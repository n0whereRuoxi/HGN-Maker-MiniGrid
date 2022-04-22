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
      ?auto_334911 - BLOCK
    )
    :vars
    (
      ?auto_334912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334911 ?auto_334912 ) ( CLEAR ?auto_334911 ) ( HAND-EMPTY ) ( not ( = ?auto_334911 ?auto_334912 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_334911 ?auto_334912 )
      ( !PUTDOWN ?auto_334911 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_334918 - BLOCK
      ?auto_334919 - BLOCK
    )
    :vars
    (
      ?auto_334920 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_334918 ) ( ON ?auto_334919 ?auto_334920 ) ( CLEAR ?auto_334919 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_334918 ) ( not ( = ?auto_334918 ?auto_334919 ) ) ( not ( = ?auto_334918 ?auto_334920 ) ) ( not ( = ?auto_334919 ?auto_334920 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_334919 ?auto_334920 )
      ( !STACK ?auto_334919 ?auto_334918 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_334928 - BLOCK
      ?auto_334929 - BLOCK
    )
    :vars
    (
      ?auto_334930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334929 ?auto_334930 ) ( not ( = ?auto_334928 ?auto_334929 ) ) ( not ( = ?auto_334928 ?auto_334930 ) ) ( not ( = ?auto_334929 ?auto_334930 ) ) ( ON ?auto_334928 ?auto_334929 ) ( CLEAR ?auto_334928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_334928 )
      ( MAKE-2PILE ?auto_334928 ?auto_334929 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_334939 - BLOCK
      ?auto_334940 - BLOCK
      ?auto_334941 - BLOCK
    )
    :vars
    (
      ?auto_334942 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_334940 ) ( ON ?auto_334941 ?auto_334942 ) ( CLEAR ?auto_334941 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_334939 ) ( ON ?auto_334940 ?auto_334939 ) ( not ( = ?auto_334939 ?auto_334940 ) ) ( not ( = ?auto_334939 ?auto_334941 ) ) ( not ( = ?auto_334939 ?auto_334942 ) ) ( not ( = ?auto_334940 ?auto_334941 ) ) ( not ( = ?auto_334940 ?auto_334942 ) ) ( not ( = ?auto_334941 ?auto_334942 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_334941 ?auto_334942 )
      ( !STACK ?auto_334941 ?auto_334940 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_334953 - BLOCK
      ?auto_334954 - BLOCK
      ?auto_334955 - BLOCK
    )
    :vars
    (
      ?auto_334956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334955 ?auto_334956 ) ( ON-TABLE ?auto_334953 ) ( not ( = ?auto_334953 ?auto_334954 ) ) ( not ( = ?auto_334953 ?auto_334955 ) ) ( not ( = ?auto_334953 ?auto_334956 ) ) ( not ( = ?auto_334954 ?auto_334955 ) ) ( not ( = ?auto_334954 ?auto_334956 ) ) ( not ( = ?auto_334955 ?auto_334956 ) ) ( CLEAR ?auto_334953 ) ( ON ?auto_334954 ?auto_334955 ) ( CLEAR ?auto_334954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_334953 ?auto_334954 )
      ( MAKE-3PILE ?auto_334953 ?auto_334954 ?auto_334955 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_334967 - BLOCK
      ?auto_334968 - BLOCK
      ?auto_334969 - BLOCK
    )
    :vars
    (
      ?auto_334970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334969 ?auto_334970 ) ( not ( = ?auto_334967 ?auto_334968 ) ) ( not ( = ?auto_334967 ?auto_334969 ) ) ( not ( = ?auto_334967 ?auto_334970 ) ) ( not ( = ?auto_334968 ?auto_334969 ) ) ( not ( = ?auto_334968 ?auto_334970 ) ) ( not ( = ?auto_334969 ?auto_334970 ) ) ( ON ?auto_334968 ?auto_334969 ) ( ON ?auto_334967 ?auto_334968 ) ( CLEAR ?auto_334967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_334967 )
      ( MAKE-3PILE ?auto_334967 ?auto_334968 ?auto_334969 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_334982 - BLOCK
      ?auto_334983 - BLOCK
      ?auto_334984 - BLOCK
      ?auto_334985 - BLOCK
    )
    :vars
    (
      ?auto_334986 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_334984 ) ( ON ?auto_334985 ?auto_334986 ) ( CLEAR ?auto_334985 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_334982 ) ( ON ?auto_334983 ?auto_334982 ) ( ON ?auto_334984 ?auto_334983 ) ( not ( = ?auto_334982 ?auto_334983 ) ) ( not ( = ?auto_334982 ?auto_334984 ) ) ( not ( = ?auto_334982 ?auto_334985 ) ) ( not ( = ?auto_334982 ?auto_334986 ) ) ( not ( = ?auto_334983 ?auto_334984 ) ) ( not ( = ?auto_334983 ?auto_334985 ) ) ( not ( = ?auto_334983 ?auto_334986 ) ) ( not ( = ?auto_334984 ?auto_334985 ) ) ( not ( = ?auto_334984 ?auto_334986 ) ) ( not ( = ?auto_334985 ?auto_334986 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_334985 ?auto_334986 )
      ( !STACK ?auto_334985 ?auto_334984 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_335000 - BLOCK
      ?auto_335001 - BLOCK
      ?auto_335002 - BLOCK
      ?auto_335003 - BLOCK
    )
    :vars
    (
      ?auto_335004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335003 ?auto_335004 ) ( ON-TABLE ?auto_335000 ) ( ON ?auto_335001 ?auto_335000 ) ( not ( = ?auto_335000 ?auto_335001 ) ) ( not ( = ?auto_335000 ?auto_335002 ) ) ( not ( = ?auto_335000 ?auto_335003 ) ) ( not ( = ?auto_335000 ?auto_335004 ) ) ( not ( = ?auto_335001 ?auto_335002 ) ) ( not ( = ?auto_335001 ?auto_335003 ) ) ( not ( = ?auto_335001 ?auto_335004 ) ) ( not ( = ?auto_335002 ?auto_335003 ) ) ( not ( = ?auto_335002 ?auto_335004 ) ) ( not ( = ?auto_335003 ?auto_335004 ) ) ( CLEAR ?auto_335001 ) ( ON ?auto_335002 ?auto_335003 ) ( CLEAR ?auto_335002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_335000 ?auto_335001 ?auto_335002 )
      ( MAKE-4PILE ?auto_335000 ?auto_335001 ?auto_335002 ?auto_335003 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_335018 - BLOCK
      ?auto_335019 - BLOCK
      ?auto_335020 - BLOCK
      ?auto_335021 - BLOCK
    )
    :vars
    (
      ?auto_335022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335021 ?auto_335022 ) ( ON-TABLE ?auto_335018 ) ( not ( = ?auto_335018 ?auto_335019 ) ) ( not ( = ?auto_335018 ?auto_335020 ) ) ( not ( = ?auto_335018 ?auto_335021 ) ) ( not ( = ?auto_335018 ?auto_335022 ) ) ( not ( = ?auto_335019 ?auto_335020 ) ) ( not ( = ?auto_335019 ?auto_335021 ) ) ( not ( = ?auto_335019 ?auto_335022 ) ) ( not ( = ?auto_335020 ?auto_335021 ) ) ( not ( = ?auto_335020 ?auto_335022 ) ) ( not ( = ?auto_335021 ?auto_335022 ) ) ( ON ?auto_335020 ?auto_335021 ) ( CLEAR ?auto_335018 ) ( ON ?auto_335019 ?auto_335020 ) ( CLEAR ?auto_335019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_335018 ?auto_335019 )
      ( MAKE-4PILE ?auto_335018 ?auto_335019 ?auto_335020 ?auto_335021 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_335036 - BLOCK
      ?auto_335037 - BLOCK
      ?auto_335038 - BLOCK
      ?auto_335039 - BLOCK
    )
    :vars
    (
      ?auto_335040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335039 ?auto_335040 ) ( not ( = ?auto_335036 ?auto_335037 ) ) ( not ( = ?auto_335036 ?auto_335038 ) ) ( not ( = ?auto_335036 ?auto_335039 ) ) ( not ( = ?auto_335036 ?auto_335040 ) ) ( not ( = ?auto_335037 ?auto_335038 ) ) ( not ( = ?auto_335037 ?auto_335039 ) ) ( not ( = ?auto_335037 ?auto_335040 ) ) ( not ( = ?auto_335038 ?auto_335039 ) ) ( not ( = ?auto_335038 ?auto_335040 ) ) ( not ( = ?auto_335039 ?auto_335040 ) ) ( ON ?auto_335038 ?auto_335039 ) ( ON ?auto_335037 ?auto_335038 ) ( ON ?auto_335036 ?auto_335037 ) ( CLEAR ?auto_335036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_335036 )
      ( MAKE-4PILE ?auto_335036 ?auto_335037 ?auto_335038 ?auto_335039 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_335055 - BLOCK
      ?auto_335056 - BLOCK
      ?auto_335057 - BLOCK
      ?auto_335058 - BLOCK
      ?auto_335059 - BLOCK
    )
    :vars
    (
      ?auto_335060 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_335058 ) ( ON ?auto_335059 ?auto_335060 ) ( CLEAR ?auto_335059 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_335055 ) ( ON ?auto_335056 ?auto_335055 ) ( ON ?auto_335057 ?auto_335056 ) ( ON ?auto_335058 ?auto_335057 ) ( not ( = ?auto_335055 ?auto_335056 ) ) ( not ( = ?auto_335055 ?auto_335057 ) ) ( not ( = ?auto_335055 ?auto_335058 ) ) ( not ( = ?auto_335055 ?auto_335059 ) ) ( not ( = ?auto_335055 ?auto_335060 ) ) ( not ( = ?auto_335056 ?auto_335057 ) ) ( not ( = ?auto_335056 ?auto_335058 ) ) ( not ( = ?auto_335056 ?auto_335059 ) ) ( not ( = ?auto_335056 ?auto_335060 ) ) ( not ( = ?auto_335057 ?auto_335058 ) ) ( not ( = ?auto_335057 ?auto_335059 ) ) ( not ( = ?auto_335057 ?auto_335060 ) ) ( not ( = ?auto_335058 ?auto_335059 ) ) ( not ( = ?auto_335058 ?auto_335060 ) ) ( not ( = ?auto_335059 ?auto_335060 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_335059 ?auto_335060 )
      ( !STACK ?auto_335059 ?auto_335058 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_335077 - BLOCK
      ?auto_335078 - BLOCK
      ?auto_335079 - BLOCK
      ?auto_335080 - BLOCK
      ?auto_335081 - BLOCK
    )
    :vars
    (
      ?auto_335082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335081 ?auto_335082 ) ( ON-TABLE ?auto_335077 ) ( ON ?auto_335078 ?auto_335077 ) ( ON ?auto_335079 ?auto_335078 ) ( not ( = ?auto_335077 ?auto_335078 ) ) ( not ( = ?auto_335077 ?auto_335079 ) ) ( not ( = ?auto_335077 ?auto_335080 ) ) ( not ( = ?auto_335077 ?auto_335081 ) ) ( not ( = ?auto_335077 ?auto_335082 ) ) ( not ( = ?auto_335078 ?auto_335079 ) ) ( not ( = ?auto_335078 ?auto_335080 ) ) ( not ( = ?auto_335078 ?auto_335081 ) ) ( not ( = ?auto_335078 ?auto_335082 ) ) ( not ( = ?auto_335079 ?auto_335080 ) ) ( not ( = ?auto_335079 ?auto_335081 ) ) ( not ( = ?auto_335079 ?auto_335082 ) ) ( not ( = ?auto_335080 ?auto_335081 ) ) ( not ( = ?auto_335080 ?auto_335082 ) ) ( not ( = ?auto_335081 ?auto_335082 ) ) ( CLEAR ?auto_335079 ) ( ON ?auto_335080 ?auto_335081 ) ( CLEAR ?auto_335080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_335077 ?auto_335078 ?auto_335079 ?auto_335080 )
      ( MAKE-5PILE ?auto_335077 ?auto_335078 ?auto_335079 ?auto_335080 ?auto_335081 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_335099 - BLOCK
      ?auto_335100 - BLOCK
      ?auto_335101 - BLOCK
      ?auto_335102 - BLOCK
      ?auto_335103 - BLOCK
    )
    :vars
    (
      ?auto_335104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335103 ?auto_335104 ) ( ON-TABLE ?auto_335099 ) ( ON ?auto_335100 ?auto_335099 ) ( not ( = ?auto_335099 ?auto_335100 ) ) ( not ( = ?auto_335099 ?auto_335101 ) ) ( not ( = ?auto_335099 ?auto_335102 ) ) ( not ( = ?auto_335099 ?auto_335103 ) ) ( not ( = ?auto_335099 ?auto_335104 ) ) ( not ( = ?auto_335100 ?auto_335101 ) ) ( not ( = ?auto_335100 ?auto_335102 ) ) ( not ( = ?auto_335100 ?auto_335103 ) ) ( not ( = ?auto_335100 ?auto_335104 ) ) ( not ( = ?auto_335101 ?auto_335102 ) ) ( not ( = ?auto_335101 ?auto_335103 ) ) ( not ( = ?auto_335101 ?auto_335104 ) ) ( not ( = ?auto_335102 ?auto_335103 ) ) ( not ( = ?auto_335102 ?auto_335104 ) ) ( not ( = ?auto_335103 ?auto_335104 ) ) ( ON ?auto_335102 ?auto_335103 ) ( CLEAR ?auto_335100 ) ( ON ?auto_335101 ?auto_335102 ) ( CLEAR ?auto_335101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_335099 ?auto_335100 ?auto_335101 )
      ( MAKE-5PILE ?auto_335099 ?auto_335100 ?auto_335101 ?auto_335102 ?auto_335103 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_335121 - BLOCK
      ?auto_335122 - BLOCK
      ?auto_335123 - BLOCK
      ?auto_335124 - BLOCK
      ?auto_335125 - BLOCK
    )
    :vars
    (
      ?auto_335126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335125 ?auto_335126 ) ( ON-TABLE ?auto_335121 ) ( not ( = ?auto_335121 ?auto_335122 ) ) ( not ( = ?auto_335121 ?auto_335123 ) ) ( not ( = ?auto_335121 ?auto_335124 ) ) ( not ( = ?auto_335121 ?auto_335125 ) ) ( not ( = ?auto_335121 ?auto_335126 ) ) ( not ( = ?auto_335122 ?auto_335123 ) ) ( not ( = ?auto_335122 ?auto_335124 ) ) ( not ( = ?auto_335122 ?auto_335125 ) ) ( not ( = ?auto_335122 ?auto_335126 ) ) ( not ( = ?auto_335123 ?auto_335124 ) ) ( not ( = ?auto_335123 ?auto_335125 ) ) ( not ( = ?auto_335123 ?auto_335126 ) ) ( not ( = ?auto_335124 ?auto_335125 ) ) ( not ( = ?auto_335124 ?auto_335126 ) ) ( not ( = ?auto_335125 ?auto_335126 ) ) ( ON ?auto_335124 ?auto_335125 ) ( ON ?auto_335123 ?auto_335124 ) ( CLEAR ?auto_335121 ) ( ON ?auto_335122 ?auto_335123 ) ( CLEAR ?auto_335122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_335121 ?auto_335122 )
      ( MAKE-5PILE ?auto_335121 ?auto_335122 ?auto_335123 ?auto_335124 ?auto_335125 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_335143 - BLOCK
      ?auto_335144 - BLOCK
      ?auto_335145 - BLOCK
      ?auto_335146 - BLOCK
      ?auto_335147 - BLOCK
    )
    :vars
    (
      ?auto_335148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335147 ?auto_335148 ) ( not ( = ?auto_335143 ?auto_335144 ) ) ( not ( = ?auto_335143 ?auto_335145 ) ) ( not ( = ?auto_335143 ?auto_335146 ) ) ( not ( = ?auto_335143 ?auto_335147 ) ) ( not ( = ?auto_335143 ?auto_335148 ) ) ( not ( = ?auto_335144 ?auto_335145 ) ) ( not ( = ?auto_335144 ?auto_335146 ) ) ( not ( = ?auto_335144 ?auto_335147 ) ) ( not ( = ?auto_335144 ?auto_335148 ) ) ( not ( = ?auto_335145 ?auto_335146 ) ) ( not ( = ?auto_335145 ?auto_335147 ) ) ( not ( = ?auto_335145 ?auto_335148 ) ) ( not ( = ?auto_335146 ?auto_335147 ) ) ( not ( = ?auto_335146 ?auto_335148 ) ) ( not ( = ?auto_335147 ?auto_335148 ) ) ( ON ?auto_335146 ?auto_335147 ) ( ON ?auto_335145 ?auto_335146 ) ( ON ?auto_335144 ?auto_335145 ) ( ON ?auto_335143 ?auto_335144 ) ( CLEAR ?auto_335143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_335143 )
      ( MAKE-5PILE ?auto_335143 ?auto_335144 ?auto_335145 ?auto_335146 ?auto_335147 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_335166 - BLOCK
      ?auto_335167 - BLOCK
      ?auto_335168 - BLOCK
      ?auto_335169 - BLOCK
      ?auto_335170 - BLOCK
      ?auto_335171 - BLOCK
    )
    :vars
    (
      ?auto_335172 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_335170 ) ( ON ?auto_335171 ?auto_335172 ) ( CLEAR ?auto_335171 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_335166 ) ( ON ?auto_335167 ?auto_335166 ) ( ON ?auto_335168 ?auto_335167 ) ( ON ?auto_335169 ?auto_335168 ) ( ON ?auto_335170 ?auto_335169 ) ( not ( = ?auto_335166 ?auto_335167 ) ) ( not ( = ?auto_335166 ?auto_335168 ) ) ( not ( = ?auto_335166 ?auto_335169 ) ) ( not ( = ?auto_335166 ?auto_335170 ) ) ( not ( = ?auto_335166 ?auto_335171 ) ) ( not ( = ?auto_335166 ?auto_335172 ) ) ( not ( = ?auto_335167 ?auto_335168 ) ) ( not ( = ?auto_335167 ?auto_335169 ) ) ( not ( = ?auto_335167 ?auto_335170 ) ) ( not ( = ?auto_335167 ?auto_335171 ) ) ( not ( = ?auto_335167 ?auto_335172 ) ) ( not ( = ?auto_335168 ?auto_335169 ) ) ( not ( = ?auto_335168 ?auto_335170 ) ) ( not ( = ?auto_335168 ?auto_335171 ) ) ( not ( = ?auto_335168 ?auto_335172 ) ) ( not ( = ?auto_335169 ?auto_335170 ) ) ( not ( = ?auto_335169 ?auto_335171 ) ) ( not ( = ?auto_335169 ?auto_335172 ) ) ( not ( = ?auto_335170 ?auto_335171 ) ) ( not ( = ?auto_335170 ?auto_335172 ) ) ( not ( = ?auto_335171 ?auto_335172 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_335171 ?auto_335172 )
      ( !STACK ?auto_335171 ?auto_335170 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_335192 - BLOCK
      ?auto_335193 - BLOCK
      ?auto_335194 - BLOCK
      ?auto_335195 - BLOCK
      ?auto_335196 - BLOCK
      ?auto_335197 - BLOCK
    )
    :vars
    (
      ?auto_335198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335197 ?auto_335198 ) ( ON-TABLE ?auto_335192 ) ( ON ?auto_335193 ?auto_335192 ) ( ON ?auto_335194 ?auto_335193 ) ( ON ?auto_335195 ?auto_335194 ) ( not ( = ?auto_335192 ?auto_335193 ) ) ( not ( = ?auto_335192 ?auto_335194 ) ) ( not ( = ?auto_335192 ?auto_335195 ) ) ( not ( = ?auto_335192 ?auto_335196 ) ) ( not ( = ?auto_335192 ?auto_335197 ) ) ( not ( = ?auto_335192 ?auto_335198 ) ) ( not ( = ?auto_335193 ?auto_335194 ) ) ( not ( = ?auto_335193 ?auto_335195 ) ) ( not ( = ?auto_335193 ?auto_335196 ) ) ( not ( = ?auto_335193 ?auto_335197 ) ) ( not ( = ?auto_335193 ?auto_335198 ) ) ( not ( = ?auto_335194 ?auto_335195 ) ) ( not ( = ?auto_335194 ?auto_335196 ) ) ( not ( = ?auto_335194 ?auto_335197 ) ) ( not ( = ?auto_335194 ?auto_335198 ) ) ( not ( = ?auto_335195 ?auto_335196 ) ) ( not ( = ?auto_335195 ?auto_335197 ) ) ( not ( = ?auto_335195 ?auto_335198 ) ) ( not ( = ?auto_335196 ?auto_335197 ) ) ( not ( = ?auto_335196 ?auto_335198 ) ) ( not ( = ?auto_335197 ?auto_335198 ) ) ( CLEAR ?auto_335195 ) ( ON ?auto_335196 ?auto_335197 ) ( CLEAR ?auto_335196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_335192 ?auto_335193 ?auto_335194 ?auto_335195 ?auto_335196 )
      ( MAKE-6PILE ?auto_335192 ?auto_335193 ?auto_335194 ?auto_335195 ?auto_335196 ?auto_335197 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_335218 - BLOCK
      ?auto_335219 - BLOCK
      ?auto_335220 - BLOCK
      ?auto_335221 - BLOCK
      ?auto_335222 - BLOCK
      ?auto_335223 - BLOCK
    )
    :vars
    (
      ?auto_335224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335223 ?auto_335224 ) ( ON-TABLE ?auto_335218 ) ( ON ?auto_335219 ?auto_335218 ) ( ON ?auto_335220 ?auto_335219 ) ( not ( = ?auto_335218 ?auto_335219 ) ) ( not ( = ?auto_335218 ?auto_335220 ) ) ( not ( = ?auto_335218 ?auto_335221 ) ) ( not ( = ?auto_335218 ?auto_335222 ) ) ( not ( = ?auto_335218 ?auto_335223 ) ) ( not ( = ?auto_335218 ?auto_335224 ) ) ( not ( = ?auto_335219 ?auto_335220 ) ) ( not ( = ?auto_335219 ?auto_335221 ) ) ( not ( = ?auto_335219 ?auto_335222 ) ) ( not ( = ?auto_335219 ?auto_335223 ) ) ( not ( = ?auto_335219 ?auto_335224 ) ) ( not ( = ?auto_335220 ?auto_335221 ) ) ( not ( = ?auto_335220 ?auto_335222 ) ) ( not ( = ?auto_335220 ?auto_335223 ) ) ( not ( = ?auto_335220 ?auto_335224 ) ) ( not ( = ?auto_335221 ?auto_335222 ) ) ( not ( = ?auto_335221 ?auto_335223 ) ) ( not ( = ?auto_335221 ?auto_335224 ) ) ( not ( = ?auto_335222 ?auto_335223 ) ) ( not ( = ?auto_335222 ?auto_335224 ) ) ( not ( = ?auto_335223 ?auto_335224 ) ) ( ON ?auto_335222 ?auto_335223 ) ( CLEAR ?auto_335220 ) ( ON ?auto_335221 ?auto_335222 ) ( CLEAR ?auto_335221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_335218 ?auto_335219 ?auto_335220 ?auto_335221 )
      ( MAKE-6PILE ?auto_335218 ?auto_335219 ?auto_335220 ?auto_335221 ?auto_335222 ?auto_335223 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_335244 - BLOCK
      ?auto_335245 - BLOCK
      ?auto_335246 - BLOCK
      ?auto_335247 - BLOCK
      ?auto_335248 - BLOCK
      ?auto_335249 - BLOCK
    )
    :vars
    (
      ?auto_335250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335249 ?auto_335250 ) ( ON-TABLE ?auto_335244 ) ( ON ?auto_335245 ?auto_335244 ) ( not ( = ?auto_335244 ?auto_335245 ) ) ( not ( = ?auto_335244 ?auto_335246 ) ) ( not ( = ?auto_335244 ?auto_335247 ) ) ( not ( = ?auto_335244 ?auto_335248 ) ) ( not ( = ?auto_335244 ?auto_335249 ) ) ( not ( = ?auto_335244 ?auto_335250 ) ) ( not ( = ?auto_335245 ?auto_335246 ) ) ( not ( = ?auto_335245 ?auto_335247 ) ) ( not ( = ?auto_335245 ?auto_335248 ) ) ( not ( = ?auto_335245 ?auto_335249 ) ) ( not ( = ?auto_335245 ?auto_335250 ) ) ( not ( = ?auto_335246 ?auto_335247 ) ) ( not ( = ?auto_335246 ?auto_335248 ) ) ( not ( = ?auto_335246 ?auto_335249 ) ) ( not ( = ?auto_335246 ?auto_335250 ) ) ( not ( = ?auto_335247 ?auto_335248 ) ) ( not ( = ?auto_335247 ?auto_335249 ) ) ( not ( = ?auto_335247 ?auto_335250 ) ) ( not ( = ?auto_335248 ?auto_335249 ) ) ( not ( = ?auto_335248 ?auto_335250 ) ) ( not ( = ?auto_335249 ?auto_335250 ) ) ( ON ?auto_335248 ?auto_335249 ) ( ON ?auto_335247 ?auto_335248 ) ( CLEAR ?auto_335245 ) ( ON ?auto_335246 ?auto_335247 ) ( CLEAR ?auto_335246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_335244 ?auto_335245 ?auto_335246 )
      ( MAKE-6PILE ?auto_335244 ?auto_335245 ?auto_335246 ?auto_335247 ?auto_335248 ?auto_335249 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_335270 - BLOCK
      ?auto_335271 - BLOCK
      ?auto_335272 - BLOCK
      ?auto_335273 - BLOCK
      ?auto_335274 - BLOCK
      ?auto_335275 - BLOCK
    )
    :vars
    (
      ?auto_335276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335275 ?auto_335276 ) ( ON-TABLE ?auto_335270 ) ( not ( = ?auto_335270 ?auto_335271 ) ) ( not ( = ?auto_335270 ?auto_335272 ) ) ( not ( = ?auto_335270 ?auto_335273 ) ) ( not ( = ?auto_335270 ?auto_335274 ) ) ( not ( = ?auto_335270 ?auto_335275 ) ) ( not ( = ?auto_335270 ?auto_335276 ) ) ( not ( = ?auto_335271 ?auto_335272 ) ) ( not ( = ?auto_335271 ?auto_335273 ) ) ( not ( = ?auto_335271 ?auto_335274 ) ) ( not ( = ?auto_335271 ?auto_335275 ) ) ( not ( = ?auto_335271 ?auto_335276 ) ) ( not ( = ?auto_335272 ?auto_335273 ) ) ( not ( = ?auto_335272 ?auto_335274 ) ) ( not ( = ?auto_335272 ?auto_335275 ) ) ( not ( = ?auto_335272 ?auto_335276 ) ) ( not ( = ?auto_335273 ?auto_335274 ) ) ( not ( = ?auto_335273 ?auto_335275 ) ) ( not ( = ?auto_335273 ?auto_335276 ) ) ( not ( = ?auto_335274 ?auto_335275 ) ) ( not ( = ?auto_335274 ?auto_335276 ) ) ( not ( = ?auto_335275 ?auto_335276 ) ) ( ON ?auto_335274 ?auto_335275 ) ( ON ?auto_335273 ?auto_335274 ) ( ON ?auto_335272 ?auto_335273 ) ( CLEAR ?auto_335270 ) ( ON ?auto_335271 ?auto_335272 ) ( CLEAR ?auto_335271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_335270 ?auto_335271 )
      ( MAKE-6PILE ?auto_335270 ?auto_335271 ?auto_335272 ?auto_335273 ?auto_335274 ?auto_335275 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_335296 - BLOCK
      ?auto_335297 - BLOCK
      ?auto_335298 - BLOCK
      ?auto_335299 - BLOCK
      ?auto_335300 - BLOCK
      ?auto_335301 - BLOCK
    )
    :vars
    (
      ?auto_335302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335301 ?auto_335302 ) ( not ( = ?auto_335296 ?auto_335297 ) ) ( not ( = ?auto_335296 ?auto_335298 ) ) ( not ( = ?auto_335296 ?auto_335299 ) ) ( not ( = ?auto_335296 ?auto_335300 ) ) ( not ( = ?auto_335296 ?auto_335301 ) ) ( not ( = ?auto_335296 ?auto_335302 ) ) ( not ( = ?auto_335297 ?auto_335298 ) ) ( not ( = ?auto_335297 ?auto_335299 ) ) ( not ( = ?auto_335297 ?auto_335300 ) ) ( not ( = ?auto_335297 ?auto_335301 ) ) ( not ( = ?auto_335297 ?auto_335302 ) ) ( not ( = ?auto_335298 ?auto_335299 ) ) ( not ( = ?auto_335298 ?auto_335300 ) ) ( not ( = ?auto_335298 ?auto_335301 ) ) ( not ( = ?auto_335298 ?auto_335302 ) ) ( not ( = ?auto_335299 ?auto_335300 ) ) ( not ( = ?auto_335299 ?auto_335301 ) ) ( not ( = ?auto_335299 ?auto_335302 ) ) ( not ( = ?auto_335300 ?auto_335301 ) ) ( not ( = ?auto_335300 ?auto_335302 ) ) ( not ( = ?auto_335301 ?auto_335302 ) ) ( ON ?auto_335300 ?auto_335301 ) ( ON ?auto_335299 ?auto_335300 ) ( ON ?auto_335298 ?auto_335299 ) ( ON ?auto_335297 ?auto_335298 ) ( ON ?auto_335296 ?auto_335297 ) ( CLEAR ?auto_335296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_335296 )
      ( MAKE-6PILE ?auto_335296 ?auto_335297 ?auto_335298 ?auto_335299 ?auto_335300 ?auto_335301 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_335323 - BLOCK
      ?auto_335324 - BLOCK
      ?auto_335325 - BLOCK
      ?auto_335326 - BLOCK
      ?auto_335327 - BLOCK
      ?auto_335328 - BLOCK
      ?auto_335329 - BLOCK
    )
    :vars
    (
      ?auto_335330 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_335328 ) ( ON ?auto_335329 ?auto_335330 ) ( CLEAR ?auto_335329 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_335323 ) ( ON ?auto_335324 ?auto_335323 ) ( ON ?auto_335325 ?auto_335324 ) ( ON ?auto_335326 ?auto_335325 ) ( ON ?auto_335327 ?auto_335326 ) ( ON ?auto_335328 ?auto_335327 ) ( not ( = ?auto_335323 ?auto_335324 ) ) ( not ( = ?auto_335323 ?auto_335325 ) ) ( not ( = ?auto_335323 ?auto_335326 ) ) ( not ( = ?auto_335323 ?auto_335327 ) ) ( not ( = ?auto_335323 ?auto_335328 ) ) ( not ( = ?auto_335323 ?auto_335329 ) ) ( not ( = ?auto_335323 ?auto_335330 ) ) ( not ( = ?auto_335324 ?auto_335325 ) ) ( not ( = ?auto_335324 ?auto_335326 ) ) ( not ( = ?auto_335324 ?auto_335327 ) ) ( not ( = ?auto_335324 ?auto_335328 ) ) ( not ( = ?auto_335324 ?auto_335329 ) ) ( not ( = ?auto_335324 ?auto_335330 ) ) ( not ( = ?auto_335325 ?auto_335326 ) ) ( not ( = ?auto_335325 ?auto_335327 ) ) ( not ( = ?auto_335325 ?auto_335328 ) ) ( not ( = ?auto_335325 ?auto_335329 ) ) ( not ( = ?auto_335325 ?auto_335330 ) ) ( not ( = ?auto_335326 ?auto_335327 ) ) ( not ( = ?auto_335326 ?auto_335328 ) ) ( not ( = ?auto_335326 ?auto_335329 ) ) ( not ( = ?auto_335326 ?auto_335330 ) ) ( not ( = ?auto_335327 ?auto_335328 ) ) ( not ( = ?auto_335327 ?auto_335329 ) ) ( not ( = ?auto_335327 ?auto_335330 ) ) ( not ( = ?auto_335328 ?auto_335329 ) ) ( not ( = ?auto_335328 ?auto_335330 ) ) ( not ( = ?auto_335329 ?auto_335330 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_335329 ?auto_335330 )
      ( !STACK ?auto_335329 ?auto_335328 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_335353 - BLOCK
      ?auto_335354 - BLOCK
      ?auto_335355 - BLOCK
      ?auto_335356 - BLOCK
      ?auto_335357 - BLOCK
      ?auto_335358 - BLOCK
      ?auto_335359 - BLOCK
    )
    :vars
    (
      ?auto_335360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335359 ?auto_335360 ) ( ON-TABLE ?auto_335353 ) ( ON ?auto_335354 ?auto_335353 ) ( ON ?auto_335355 ?auto_335354 ) ( ON ?auto_335356 ?auto_335355 ) ( ON ?auto_335357 ?auto_335356 ) ( not ( = ?auto_335353 ?auto_335354 ) ) ( not ( = ?auto_335353 ?auto_335355 ) ) ( not ( = ?auto_335353 ?auto_335356 ) ) ( not ( = ?auto_335353 ?auto_335357 ) ) ( not ( = ?auto_335353 ?auto_335358 ) ) ( not ( = ?auto_335353 ?auto_335359 ) ) ( not ( = ?auto_335353 ?auto_335360 ) ) ( not ( = ?auto_335354 ?auto_335355 ) ) ( not ( = ?auto_335354 ?auto_335356 ) ) ( not ( = ?auto_335354 ?auto_335357 ) ) ( not ( = ?auto_335354 ?auto_335358 ) ) ( not ( = ?auto_335354 ?auto_335359 ) ) ( not ( = ?auto_335354 ?auto_335360 ) ) ( not ( = ?auto_335355 ?auto_335356 ) ) ( not ( = ?auto_335355 ?auto_335357 ) ) ( not ( = ?auto_335355 ?auto_335358 ) ) ( not ( = ?auto_335355 ?auto_335359 ) ) ( not ( = ?auto_335355 ?auto_335360 ) ) ( not ( = ?auto_335356 ?auto_335357 ) ) ( not ( = ?auto_335356 ?auto_335358 ) ) ( not ( = ?auto_335356 ?auto_335359 ) ) ( not ( = ?auto_335356 ?auto_335360 ) ) ( not ( = ?auto_335357 ?auto_335358 ) ) ( not ( = ?auto_335357 ?auto_335359 ) ) ( not ( = ?auto_335357 ?auto_335360 ) ) ( not ( = ?auto_335358 ?auto_335359 ) ) ( not ( = ?auto_335358 ?auto_335360 ) ) ( not ( = ?auto_335359 ?auto_335360 ) ) ( CLEAR ?auto_335357 ) ( ON ?auto_335358 ?auto_335359 ) ( CLEAR ?auto_335358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_335353 ?auto_335354 ?auto_335355 ?auto_335356 ?auto_335357 ?auto_335358 )
      ( MAKE-7PILE ?auto_335353 ?auto_335354 ?auto_335355 ?auto_335356 ?auto_335357 ?auto_335358 ?auto_335359 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_335383 - BLOCK
      ?auto_335384 - BLOCK
      ?auto_335385 - BLOCK
      ?auto_335386 - BLOCK
      ?auto_335387 - BLOCK
      ?auto_335388 - BLOCK
      ?auto_335389 - BLOCK
    )
    :vars
    (
      ?auto_335390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335389 ?auto_335390 ) ( ON-TABLE ?auto_335383 ) ( ON ?auto_335384 ?auto_335383 ) ( ON ?auto_335385 ?auto_335384 ) ( ON ?auto_335386 ?auto_335385 ) ( not ( = ?auto_335383 ?auto_335384 ) ) ( not ( = ?auto_335383 ?auto_335385 ) ) ( not ( = ?auto_335383 ?auto_335386 ) ) ( not ( = ?auto_335383 ?auto_335387 ) ) ( not ( = ?auto_335383 ?auto_335388 ) ) ( not ( = ?auto_335383 ?auto_335389 ) ) ( not ( = ?auto_335383 ?auto_335390 ) ) ( not ( = ?auto_335384 ?auto_335385 ) ) ( not ( = ?auto_335384 ?auto_335386 ) ) ( not ( = ?auto_335384 ?auto_335387 ) ) ( not ( = ?auto_335384 ?auto_335388 ) ) ( not ( = ?auto_335384 ?auto_335389 ) ) ( not ( = ?auto_335384 ?auto_335390 ) ) ( not ( = ?auto_335385 ?auto_335386 ) ) ( not ( = ?auto_335385 ?auto_335387 ) ) ( not ( = ?auto_335385 ?auto_335388 ) ) ( not ( = ?auto_335385 ?auto_335389 ) ) ( not ( = ?auto_335385 ?auto_335390 ) ) ( not ( = ?auto_335386 ?auto_335387 ) ) ( not ( = ?auto_335386 ?auto_335388 ) ) ( not ( = ?auto_335386 ?auto_335389 ) ) ( not ( = ?auto_335386 ?auto_335390 ) ) ( not ( = ?auto_335387 ?auto_335388 ) ) ( not ( = ?auto_335387 ?auto_335389 ) ) ( not ( = ?auto_335387 ?auto_335390 ) ) ( not ( = ?auto_335388 ?auto_335389 ) ) ( not ( = ?auto_335388 ?auto_335390 ) ) ( not ( = ?auto_335389 ?auto_335390 ) ) ( ON ?auto_335388 ?auto_335389 ) ( CLEAR ?auto_335386 ) ( ON ?auto_335387 ?auto_335388 ) ( CLEAR ?auto_335387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_335383 ?auto_335384 ?auto_335385 ?auto_335386 ?auto_335387 )
      ( MAKE-7PILE ?auto_335383 ?auto_335384 ?auto_335385 ?auto_335386 ?auto_335387 ?auto_335388 ?auto_335389 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_335413 - BLOCK
      ?auto_335414 - BLOCK
      ?auto_335415 - BLOCK
      ?auto_335416 - BLOCK
      ?auto_335417 - BLOCK
      ?auto_335418 - BLOCK
      ?auto_335419 - BLOCK
    )
    :vars
    (
      ?auto_335420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335419 ?auto_335420 ) ( ON-TABLE ?auto_335413 ) ( ON ?auto_335414 ?auto_335413 ) ( ON ?auto_335415 ?auto_335414 ) ( not ( = ?auto_335413 ?auto_335414 ) ) ( not ( = ?auto_335413 ?auto_335415 ) ) ( not ( = ?auto_335413 ?auto_335416 ) ) ( not ( = ?auto_335413 ?auto_335417 ) ) ( not ( = ?auto_335413 ?auto_335418 ) ) ( not ( = ?auto_335413 ?auto_335419 ) ) ( not ( = ?auto_335413 ?auto_335420 ) ) ( not ( = ?auto_335414 ?auto_335415 ) ) ( not ( = ?auto_335414 ?auto_335416 ) ) ( not ( = ?auto_335414 ?auto_335417 ) ) ( not ( = ?auto_335414 ?auto_335418 ) ) ( not ( = ?auto_335414 ?auto_335419 ) ) ( not ( = ?auto_335414 ?auto_335420 ) ) ( not ( = ?auto_335415 ?auto_335416 ) ) ( not ( = ?auto_335415 ?auto_335417 ) ) ( not ( = ?auto_335415 ?auto_335418 ) ) ( not ( = ?auto_335415 ?auto_335419 ) ) ( not ( = ?auto_335415 ?auto_335420 ) ) ( not ( = ?auto_335416 ?auto_335417 ) ) ( not ( = ?auto_335416 ?auto_335418 ) ) ( not ( = ?auto_335416 ?auto_335419 ) ) ( not ( = ?auto_335416 ?auto_335420 ) ) ( not ( = ?auto_335417 ?auto_335418 ) ) ( not ( = ?auto_335417 ?auto_335419 ) ) ( not ( = ?auto_335417 ?auto_335420 ) ) ( not ( = ?auto_335418 ?auto_335419 ) ) ( not ( = ?auto_335418 ?auto_335420 ) ) ( not ( = ?auto_335419 ?auto_335420 ) ) ( ON ?auto_335418 ?auto_335419 ) ( ON ?auto_335417 ?auto_335418 ) ( CLEAR ?auto_335415 ) ( ON ?auto_335416 ?auto_335417 ) ( CLEAR ?auto_335416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_335413 ?auto_335414 ?auto_335415 ?auto_335416 )
      ( MAKE-7PILE ?auto_335413 ?auto_335414 ?auto_335415 ?auto_335416 ?auto_335417 ?auto_335418 ?auto_335419 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_335443 - BLOCK
      ?auto_335444 - BLOCK
      ?auto_335445 - BLOCK
      ?auto_335446 - BLOCK
      ?auto_335447 - BLOCK
      ?auto_335448 - BLOCK
      ?auto_335449 - BLOCK
    )
    :vars
    (
      ?auto_335450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335449 ?auto_335450 ) ( ON-TABLE ?auto_335443 ) ( ON ?auto_335444 ?auto_335443 ) ( not ( = ?auto_335443 ?auto_335444 ) ) ( not ( = ?auto_335443 ?auto_335445 ) ) ( not ( = ?auto_335443 ?auto_335446 ) ) ( not ( = ?auto_335443 ?auto_335447 ) ) ( not ( = ?auto_335443 ?auto_335448 ) ) ( not ( = ?auto_335443 ?auto_335449 ) ) ( not ( = ?auto_335443 ?auto_335450 ) ) ( not ( = ?auto_335444 ?auto_335445 ) ) ( not ( = ?auto_335444 ?auto_335446 ) ) ( not ( = ?auto_335444 ?auto_335447 ) ) ( not ( = ?auto_335444 ?auto_335448 ) ) ( not ( = ?auto_335444 ?auto_335449 ) ) ( not ( = ?auto_335444 ?auto_335450 ) ) ( not ( = ?auto_335445 ?auto_335446 ) ) ( not ( = ?auto_335445 ?auto_335447 ) ) ( not ( = ?auto_335445 ?auto_335448 ) ) ( not ( = ?auto_335445 ?auto_335449 ) ) ( not ( = ?auto_335445 ?auto_335450 ) ) ( not ( = ?auto_335446 ?auto_335447 ) ) ( not ( = ?auto_335446 ?auto_335448 ) ) ( not ( = ?auto_335446 ?auto_335449 ) ) ( not ( = ?auto_335446 ?auto_335450 ) ) ( not ( = ?auto_335447 ?auto_335448 ) ) ( not ( = ?auto_335447 ?auto_335449 ) ) ( not ( = ?auto_335447 ?auto_335450 ) ) ( not ( = ?auto_335448 ?auto_335449 ) ) ( not ( = ?auto_335448 ?auto_335450 ) ) ( not ( = ?auto_335449 ?auto_335450 ) ) ( ON ?auto_335448 ?auto_335449 ) ( ON ?auto_335447 ?auto_335448 ) ( ON ?auto_335446 ?auto_335447 ) ( CLEAR ?auto_335444 ) ( ON ?auto_335445 ?auto_335446 ) ( CLEAR ?auto_335445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_335443 ?auto_335444 ?auto_335445 )
      ( MAKE-7PILE ?auto_335443 ?auto_335444 ?auto_335445 ?auto_335446 ?auto_335447 ?auto_335448 ?auto_335449 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_335473 - BLOCK
      ?auto_335474 - BLOCK
      ?auto_335475 - BLOCK
      ?auto_335476 - BLOCK
      ?auto_335477 - BLOCK
      ?auto_335478 - BLOCK
      ?auto_335479 - BLOCK
    )
    :vars
    (
      ?auto_335480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335479 ?auto_335480 ) ( ON-TABLE ?auto_335473 ) ( not ( = ?auto_335473 ?auto_335474 ) ) ( not ( = ?auto_335473 ?auto_335475 ) ) ( not ( = ?auto_335473 ?auto_335476 ) ) ( not ( = ?auto_335473 ?auto_335477 ) ) ( not ( = ?auto_335473 ?auto_335478 ) ) ( not ( = ?auto_335473 ?auto_335479 ) ) ( not ( = ?auto_335473 ?auto_335480 ) ) ( not ( = ?auto_335474 ?auto_335475 ) ) ( not ( = ?auto_335474 ?auto_335476 ) ) ( not ( = ?auto_335474 ?auto_335477 ) ) ( not ( = ?auto_335474 ?auto_335478 ) ) ( not ( = ?auto_335474 ?auto_335479 ) ) ( not ( = ?auto_335474 ?auto_335480 ) ) ( not ( = ?auto_335475 ?auto_335476 ) ) ( not ( = ?auto_335475 ?auto_335477 ) ) ( not ( = ?auto_335475 ?auto_335478 ) ) ( not ( = ?auto_335475 ?auto_335479 ) ) ( not ( = ?auto_335475 ?auto_335480 ) ) ( not ( = ?auto_335476 ?auto_335477 ) ) ( not ( = ?auto_335476 ?auto_335478 ) ) ( not ( = ?auto_335476 ?auto_335479 ) ) ( not ( = ?auto_335476 ?auto_335480 ) ) ( not ( = ?auto_335477 ?auto_335478 ) ) ( not ( = ?auto_335477 ?auto_335479 ) ) ( not ( = ?auto_335477 ?auto_335480 ) ) ( not ( = ?auto_335478 ?auto_335479 ) ) ( not ( = ?auto_335478 ?auto_335480 ) ) ( not ( = ?auto_335479 ?auto_335480 ) ) ( ON ?auto_335478 ?auto_335479 ) ( ON ?auto_335477 ?auto_335478 ) ( ON ?auto_335476 ?auto_335477 ) ( ON ?auto_335475 ?auto_335476 ) ( CLEAR ?auto_335473 ) ( ON ?auto_335474 ?auto_335475 ) ( CLEAR ?auto_335474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_335473 ?auto_335474 )
      ( MAKE-7PILE ?auto_335473 ?auto_335474 ?auto_335475 ?auto_335476 ?auto_335477 ?auto_335478 ?auto_335479 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_335503 - BLOCK
      ?auto_335504 - BLOCK
      ?auto_335505 - BLOCK
      ?auto_335506 - BLOCK
      ?auto_335507 - BLOCK
      ?auto_335508 - BLOCK
      ?auto_335509 - BLOCK
    )
    :vars
    (
      ?auto_335510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335509 ?auto_335510 ) ( not ( = ?auto_335503 ?auto_335504 ) ) ( not ( = ?auto_335503 ?auto_335505 ) ) ( not ( = ?auto_335503 ?auto_335506 ) ) ( not ( = ?auto_335503 ?auto_335507 ) ) ( not ( = ?auto_335503 ?auto_335508 ) ) ( not ( = ?auto_335503 ?auto_335509 ) ) ( not ( = ?auto_335503 ?auto_335510 ) ) ( not ( = ?auto_335504 ?auto_335505 ) ) ( not ( = ?auto_335504 ?auto_335506 ) ) ( not ( = ?auto_335504 ?auto_335507 ) ) ( not ( = ?auto_335504 ?auto_335508 ) ) ( not ( = ?auto_335504 ?auto_335509 ) ) ( not ( = ?auto_335504 ?auto_335510 ) ) ( not ( = ?auto_335505 ?auto_335506 ) ) ( not ( = ?auto_335505 ?auto_335507 ) ) ( not ( = ?auto_335505 ?auto_335508 ) ) ( not ( = ?auto_335505 ?auto_335509 ) ) ( not ( = ?auto_335505 ?auto_335510 ) ) ( not ( = ?auto_335506 ?auto_335507 ) ) ( not ( = ?auto_335506 ?auto_335508 ) ) ( not ( = ?auto_335506 ?auto_335509 ) ) ( not ( = ?auto_335506 ?auto_335510 ) ) ( not ( = ?auto_335507 ?auto_335508 ) ) ( not ( = ?auto_335507 ?auto_335509 ) ) ( not ( = ?auto_335507 ?auto_335510 ) ) ( not ( = ?auto_335508 ?auto_335509 ) ) ( not ( = ?auto_335508 ?auto_335510 ) ) ( not ( = ?auto_335509 ?auto_335510 ) ) ( ON ?auto_335508 ?auto_335509 ) ( ON ?auto_335507 ?auto_335508 ) ( ON ?auto_335506 ?auto_335507 ) ( ON ?auto_335505 ?auto_335506 ) ( ON ?auto_335504 ?auto_335505 ) ( ON ?auto_335503 ?auto_335504 ) ( CLEAR ?auto_335503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_335503 )
      ( MAKE-7PILE ?auto_335503 ?auto_335504 ?auto_335505 ?auto_335506 ?auto_335507 ?auto_335508 ?auto_335509 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_335534 - BLOCK
      ?auto_335535 - BLOCK
      ?auto_335536 - BLOCK
      ?auto_335537 - BLOCK
      ?auto_335538 - BLOCK
      ?auto_335539 - BLOCK
      ?auto_335540 - BLOCK
      ?auto_335541 - BLOCK
    )
    :vars
    (
      ?auto_335542 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_335540 ) ( ON ?auto_335541 ?auto_335542 ) ( CLEAR ?auto_335541 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_335534 ) ( ON ?auto_335535 ?auto_335534 ) ( ON ?auto_335536 ?auto_335535 ) ( ON ?auto_335537 ?auto_335536 ) ( ON ?auto_335538 ?auto_335537 ) ( ON ?auto_335539 ?auto_335538 ) ( ON ?auto_335540 ?auto_335539 ) ( not ( = ?auto_335534 ?auto_335535 ) ) ( not ( = ?auto_335534 ?auto_335536 ) ) ( not ( = ?auto_335534 ?auto_335537 ) ) ( not ( = ?auto_335534 ?auto_335538 ) ) ( not ( = ?auto_335534 ?auto_335539 ) ) ( not ( = ?auto_335534 ?auto_335540 ) ) ( not ( = ?auto_335534 ?auto_335541 ) ) ( not ( = ?auto_335534 ?auto_335542 ) ) ( not ( = ?auto_335535 ?auto_335536 ) ) ( not ( = ?auto_335535 ?auto_335537 ) ) ( not ( = ?auto_335535 ?auto_335538 ) ) ( not ( = ?auto_335535 ?auto_335539 ) ) ( not ( = ?auto_335535 ?auto_335540 ) ) ( not ( = ?auto_335535 ?auto_335541 ) ) ( not ( = ?auto_335535 ?auto_335542 ) ) ( not ( = ?auto_335536 ?auto_335537 ) ) ( not ( = ?auto_335536 ?auto_335538 ) ) ( not ( = ?auto_335536 ?auto_335539 ) ) ( not ( = ?auto_335536 ?auto_335540 ) ) ( not ( = ?auto_335536 ?auto_335541 ) ) ( not ( = ?auto_335536 ?auto_335542 ) ) ( not ( = ?auto_335537 ?auto_335538 ) ) ( not ( = ?auto_335537 ?auto_335539 ) ) ( not ( = ?auto_335537 ?auto_335540 ) ) ( not ( = ?auto_335537 ?auto_335541 ) ) ( not ( = ?auto_335537 ?auto_335542 ) ) ( not ( = ?auto_335538 ?auto_335539 ) ) ( not ( = ?auto_335538 ?auto_335540 ) ) ( not ( = ?auto_335538 ?auto_335541 ) ) ( not ( = ?auto_335538 ?auto_335542 ) ) ( not ( = ?auto_335539 ?auto_335540 ) ) ( not ( = ?auto_335539 ?auto_335541 ) ) ( not ( = ?auto_335539 ?auto_335542 ) ) ( not ( = ?auto_335540 ?auto_335541 ) ) ( not ( = ?auto_335540 ?auto_335542 ) ) ( not ( = ?auto_335541 ?auto_335542 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_335541 ?auto_335542 )
      ( !STACK ?auto_335541 ?auto_335540 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_335568 - BLOCK
      ?auto_335569 - BLOCK
      ?auto_335570 - BLOCK
      ?auto_335571 - BLOCK
      ?auto_335572 - BLOCK
      ?auto_335573 - BLOCK
      ?auto_335574 - BLOCK
      ?auto_335575 - BLOCK
    )
    :vars
    (
      ?auto_335576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335575 ?auto_335576 ) ( ON-TABLE ?auto_335568 ) ( ON ?auto_335569 ?auto_335568 ) ( ON ?auto_335570 ?auto_335569 ) ( ON ?auto_335571 ?auto_335570 ) ( ON ?auto_335572 ?auto_335571 ) ( ON ?auto_335573 ?auto_335572 ) ( not ( = ?auto_335568 ?auto_335569 ) ) ( not ( = ?auto_335568 ?auto_335570 ) ) ( not ( = ?auto_335568 ?auto_335571 ) ) ( not ( = ?auto_335568 ?auto_335572 ) ) ( not ( = ?auto_335568 ?auto_335573 ) ) ( not ( = ?auto_335568 ?auto_335574 ) ) ( not ( = ?auto_335568 ?auto_335575 ) ) ( not ( = ?auto_335568 ?auto_335576 ) ) ( not ( = ?auto_335569 ?auto_335570 ) ) ( not ( = ?auto_335569 ?auto_335571 ) ) ( not ( = ?auto_335569 ?auto_335572 ) ) ( not ( = ?auto_335569 ?auto_335573 ) ) ( not ( = ?auto_335569 ?auto_335574 ) ) ( not ( = ?auto_335569 ?auto_335575 ) ) ( not ( = ?auto_335569 ?auto_335576 ) ) ( not ( = ?auto_335570 ?auto_335571 ) ) ( not ( = ?auto_335570 ?auto_335572 ) ) ( not ( = ?auto_335570 ?auto_335573 ) ) ( not ( = ?auto_335570 ?auto_335574 ) ) ( not ( = ?auto_335570 ?auto_335575 ) ) ( not ( = ?auto_335570 ?auto_335576 ) ) ( not ( = ?auto_335571 ?auto_335572 ) ) ( not ( = ?auto_335571 ?auto_335573 ) ) ( not ( = ?auto_335571 ?auto_335574 ) ) ( not ( = ?auto_335571 ?auto_335575 ) ) ( not ( = ?auto_335571 ?auto_335576 ) ) ( not ( = ?auto_335572 ?auto_335573 ) ) ( not ( = ?auto_335572 ?auto_335574 ) ) ( not ( = ?auto_335572 ?auto_335575 ) ) ( not ( = ?auto_335572 ?auto_335576 ) ) ( not ( = ?auto_335573 ?auto_335574 ) ) ( not ( = ?auto_335573 ?auto_335575 ) ) ( not ( = ?auto_335573 ?auto_335576 ) ) ( not ( = ?auto_335574 ?auto_335575 ) ) ( not ( = ?auto_335574 ?auto_335576 ) ) ( not ( = ?auto_335575 ?auto_335576 ) ) ( CLEAR ?auto_335573 ) ( ON ?auto_335574 ?auto_335575 ) ( CLEAR ?auto_335574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_335568 ?auto_335569 ?auto_335570 ?auto_335571 ?auto_335572 ?auto_335573 ?auto_335574 )
      ( MAKE-8PILE ?auto_335568 ?auto_335569 ?auto_335570 ?auto_335571 ?auto_335572 ?auto_335573 ?auto_335574 ?auto_335575 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_335602 - BLOCK
      ?auto_335603 - BLOCK
      ?auto_335604 - BLOCK
      ?auto_335605 - BLOCK
      ?auto_335606 - BLOCK
      ?auto_335607 - BLOCK
      ?auto_335608 - BLOCK
      ?auto_335609 - BLOCK
    )
    :vars
    (
      ?auto_335610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335609 ?auto_335610 ) ( ON-TABLE ?auto_335602 ) ( ON ?auto_335603 ?auto_335602 ) ( ON ?auto_335604 ?auto_335603 ) ( ON ?auto_335605 ?auto_335604 ) ( ON ?auto_335606 ?auto_335605 ) ( not ( = ?auto_335602 ?auto_335603 ) ) ( not ( = ?auto_335602 ?auto_335604 ) ) ( not ( = ?auto_335602 ?auto_335605 ) ) ( not ( = ?auto_335602 ?auto_335606 ) ) ( not ( = ?auto_335602 ?auto_335607 ) ) ( not ( = ?auto_335602 ?auto_335608 ) ) ( not ( = ?auto_335602 ?auto_335609 ) ) ( not ( = ?auto_335602 ?auto_335610 ) ) ( not ( = ?auto_335603 ?auto_335604 ) ) ( not ( = ?auto_335603 ?auto_335605 ) ) ( not ( = ?auto_335603 ?auto_335606 ) ) ( not ( = ?auto_335603 ?auto_335607 ) ) ( not ( = ?auto_335603 ?auto_335608 ) ) ( not ( = ?auto_335603 ?auto_335609 ) ) ( not ( = ?auto_335603 ?auto_335610 ) ) ( not ( = ?auto_335604 ?auto_335605 ) ) ( not ( = ?auto_335604 ?auto_335606 ) ) ( not ( = ?auto_335604 ?auto_335607 ) ) ( not ( = ?auto_335604 ?auto_335608 ) ) ( not ( = ?auto_335604 ?auto_335609 ) ) ( not ( = ?auto_335604 ?auto_335610 ) ) ( not ( = ?auto_335605 ?auto_335606 ) ) ( not ( = ?auto_335605 ?auto_335607 ) ) ( not ( = ?auto_335605 ?auto_335608 ) ) ( not ( = ?auto_335605 ?auto_335609 ) ) ( not ( = ?auto_335605 ?auto_335610 ) ) ( not ( = ?auto_335606 ?auto_335607 ) ) ( not ( = ?auto_335606 ?auto_335608 ) ) ( not ( = ?auto_335606 ?auto_335609 ) ) ( not ( = ?auto_335606 ?auto_335610 ) ) ( not ( = ?auto_335607 ?auto_335608 ) ) ( not ( = ?auto_335607 ?auto_335609 ) ) ( not ( = ?auto_335607 ?auto_335610 ) ) ( not ( = ?auto_335608 ?auto_335609 ) ) ( not ( = ?auto_335608 ?auto_335610 ) ) ( not ( = ?auto_335609 ?auto_335610 ) ) ( ON ?auto_335608 ?auto_335609 ) ( CLEAR ?auto_335606 ) ( ON ?auto_335607 ?auto_335608 ) ( CLEAR ?auto_335607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_335602 ?auto_335603 ?auto_335604 ?auto_335605 ?auto_335606 ?auto_335607 )
      ( MAKE-8PILE ?auto_335602 ?auto_335603 ?auto_335604 ?auto_335605 ?auto_335606 ?auto_335607 ?auto_335608 ?auto_335609 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_335636 - BLOCK
      ?auto_335637 - BLOCK
      ?auto_335638 - BLOCK
      ?auto_335639 - BLOCK
      ?auto_335640 - BLOCK
      ?auto_335641 - BLOCK
      ?auto_335642 - BLOCK
      ?auto_335643 - BLOCK
    )
    :vars
    (
      ?auto_335644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335643 ?auto_335644 ) ( ON-TABLE ?auto_335636 ) ( ON ?auto_335637 ?auto_335636 ) ( ON ?auto_335638 ?auto_335637 ) ( ON ?auto_335639 ?auto_335638 ) ( not ( = ?auto_335636 ?auto_335637 ) ) ( not ( = ?auto_335636 ?auto_335638 ) ) ( not ( = ?auto_335636 ?auto_335639 ) ) ( not ( = ?auto_335636 ?auto_335640 ) ) ( not ( = ?auto_335636 ?auto_335641 ) ) ( not ( = ?auto_335636 ?auto_335642 ) ) ( not ( = ?auto_335636 ?auto_335643 ) ) ( not ( = ?auto_335636 ?auto_335644 ) ) ( not ( = ?auto_335637 ?auto_335638 ) ) ( not ( = ?auto_335637 ?auto_335639 ) ) ( not ( = ?auto_335637 ?auto_335640 ) ) ( not ( = ?auto_335637 ?auto_335641 ) ) ( not ( = ?auto_335637 ?auto_335642 ) ) ( not ( = ?auto_335637 ?auto_335643 ) ) ( not ( = ?auto_335637 ?auto_335644 ) ) ( not ( = ?auto_335638 ?auto_335639 ) ) ( not ( = ?auto_335638 ?auto_335640 ) ) ( not ( = ?auto_335638 ?auto_335641 ) ) ( not ( = ?auto_335638 ?auto_335642 ) ) ( not ( = ?auto_335638 ?auto_335643 ) ) ( not ( = ?auto_335638 ?auto_335644 ) ) ( not ( = ?auto_335639 ?auto_335640 ) ) ( not ( = ?auto_335639 ?auto_335641 ) ) ( not ( = ?auto_335639 ?auto_335642 ) ) ( not ( = ?auto_335639 ?auto_335643 ) ) ( not ( = ?auto_335639 ?auto_335644 ) ) ( not ( = ?auto_335640 ?auto_335641 ) ) ( not ( = ?auto_335640 ?auto_335642 ) ) ( not ( = ?auto_335640 ?auto_335643 ) ) ( not ( = ?auto_335640 ?auto_335644 ) ) ( not ( = ?auto_335641 ?auto_335642 ) ) ( not ( = ?auto_335641 ?auto_335643 ) ) ( not ( = ?auto_335641 ?auto_335644 ) ) ( not ( = ?auto_335642 ?auto_335643 ) ) ( not ( = ?auto_335642 ?auto_335644 ) ) ( not ( = ?auto_335643 ?auto_335644 ) ) ( ON ?auto_335642 ?auto_335643 ) ( ON ?auto_335641 ?auto_335642 ) ( CLEAR ?auto_335639 ) ( ON ?auto_335640 ?auto_335641 ) ( CLEAR ?auto_335640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_335636 ?auto_335637 ?auto_335638 ?auto_335639 ?auto_335640 )
      ( MAKE-8PILE ?auto_335636 ?auto_335637 ?auto_335638 ?auto_335639 ?auto_335640 ?auto_335641 ?auto_335642 ?auto_335643 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_335670 - BLOCK
      ?auto_335671 - BLOCK
      ?auto_335672 - BLOCK
      ?auto_335673 - BLOCK
      ?auto_335674 - BLOCK
      ?auto_335675 - BLOCK
      ?auto_335676 - BLOCK
      ?auto_335677 - BLOCK
    )
    :vars
    (
      ?auto_335678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335677 ?auto_335678 ) ( ON-TABLE ?auto_335670 ) ( ON ?auto_335671 ?auto_335670 ) ( ON ?auto_335672 ?auto_335671 ) ( not ( = ?auto_335670 ?auto_335671 ) ) ( not ( = ?auto_335670 ?auto_335672 ) ) ( not ( = ?auto_335670 ?auto_335673 ) ) ( not ( = ?auto_335670 ?auto_335674 ) ) ( not ( = ?auto_335670 ?auto_335675 ) ) ( not ( = ?auto_335670 ?auto_335676 ) ) ( not ( = ?auto_335670 ?auto_335677 ) ) ( not ( = ?auto_335670 ?auto_335678 ) ) ( not ( = ?auto_335671 ?auto_335672 ) ) ( not ( = ?auto_335671 ?auto_335673 ) ) ( not ( = ?auto_335671 ?auto_335674 ) ) ( not ( = ?auto_335671 ?auto_335675 ) ) ( not ( = ?auto_335671 ?auto_335676 ) ) ( not ( = ?auto_335671 ?auto_335677 ) ) ( not ( = ?auto_335671 ?auto_335678 ) ) ( not ( = ?auto_335672 ?auto_335673 ) ) ( not ( = ?auto_335672 ?auto_335674 ) ) ( not ( = ?auto_335672 ?auto_335675 ) ) ( not ( = ?auto_335672 ?auto_335676 ) ) ( not ( = ?auto_335672 ?auto_335677 ) ) ( not ( = ?auto_335672 ?auto_335678 ) ) ( not ( = ?auto_335673 ?auto_335674 ) ) ( not ( = ?auto_335673 ?auto_335675 ) ) ( not ( = ?auto_335673 ?auto_335676 ) ) ( not ( = ?auto_335673 ?auto_335677 ) ) ( not ( = ?auto_335673 ?auto_335678 ) ) ( not ( = ?auto_335674 ?auto_335675 ) ) ( not ( = ?auto_335674 ?auto_335676 ) ) ( not ( = ?auto_335674 ?auto_335677 ) ) ( not ( = ?auto_335674 ?auto_335678 ) ) ( not ( = ?auto_335675 ?auto_335676 ) ) ( not ( = ?auto_335675 ?auto_335677 ) ) ( not ( = ?auto_335675 ?auto_335678 ) ) ( not ( = ?auto_335676 ?auto_335677 ) ) ( not ( = ?auto_335676 ?auto_335678 ) ) ( not ( = ?auto_335677 ?auto_335678 ) ) ( ON ?auto_335676 ?auto_335677 ) ( ON ?auto_335675 ?auto_335676 ) ( ON ?auto_335674 ?auto_335675 ) ( CLEAR ?auto_335672 ) ( ON ?auto_335673 ?auto_335674 ) ( CLEAR ?auto_335673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_335670 ?auto_335671 ?auto_335672 ?auto_335673 )
      ( MAKE-8PILE ?auto_335670 ?auto_335671 ?auto_335672 ?auto_335673 ?auto_335674 ?auto_335675 ?auto_335676 ?auto_335677 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_335704 - BLOCK
      ?auto_335705 - BLOCK
      ?auto_335706 - BLOCK
      ?auto_335707 - BLOCK
      ?auto_335708 - BLOCK
      ?auto_335709 - BLOCK
      ?auto_335710 - BLOCK
      ?auto_335711 - BLOCK
    )
    :vars
    (
      ?auto_335712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335711 ?auto_335712 ) ( ON-TABLE ?auto_335704 ) ( ON ?auto_335705 ?auto_335704 ) ( not ( = ?auto_335704 ?auto_335705 ) ) ( not ( = ?auto_335704 ?auto_335706 ) ) ( not ( = ?auto_335704 ?auto_335707 ) ) ( not ( = ?auto_335704 ?auto_335708 ) ) ( not ( = ?auto_335704 ?auto_335709 ) ) ( not ( = ?auto_335704 ?auto_335710 ) ) ( not ( = ?auto_335704 ?auto_335711 ) ) ( not ( = ?auto_335704 ?auto_335712 ) ) ( not ( = ?auto_335705 ?auto_335706 ) ) ( not ( = ?auto_335705 ?auto_335707 ) ) ( not ( = ?auto_335705 ?auto_335708 ) ) ( not ( = ?auto_335705 ?auto_335709 ) ) ( not ( = ?auto_335705 ?auto_335710 ) ) ( not ( = ?auto_335705 ?auto_335711 ) ) ( not ( = ?auto_335705 ?auto_335712 ) ) ( not ( = ?auto_335706 ?auto_335707 ) ) ( not ( = ?auto_335706 ?auto_335708 ) ) ( not ( = ?auto_335706 ?auto_335709 ) ) ( not ( = ?auto_335706 ?auto_335710 ) ) ( not ( = ?auto_335706 ?auto_335711 ) ) ( not ( = ?auto_335706 ?auto_335712 ) ) ( not ( = ?auto_335707 ?auto_335708 ) ) ( not ( = ?auto_335707 ?auto_335709 ) ) ( not ( = ?auto_335707 ?auto_335710 ) ) ( not ( = ?auto_335707 ?auto_335711 ) ) ( not ( = ?auto_335707 ?auto_335712 ) ) ( not ( = ?auto_335708 ?auto_335709 ) ) ( not ( = ?auto_335708 ?auto_335710 ) ) ( not ( = ?auto_335708 ?auto_335711 ) ) ( not ( = ?auto_335708 ?auto_335712 ) ) ( not ( = ?auto_335709 ?auto_335710 ) ) ( not ( = ?auto_335709 ?auto_335711 ) ) ( not ( = ?auto_335709 ?auto_335712 ) ) ( not ( = ?auto_335710 ?auto_335711 ) ) ( not ( = ?auto_335710 ?auto_335712 ) ) ( not ( = ?auto_335711 ?auto_335712 ) ) ( ON ?auto_335710 ?auto_335711 ) ( ON ?auto_335709 ?auto_335710 ) ( ON ?auto_335708 ?auto_335709 ) ( ON ?auto_335707 ?auto_335708 ) ( CLEAR ?auto_335705 ) ( ON ?auto_335706 ?auto_335707 ) ( CLEAR ?auto_335706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_335704 ?auto_335705 ?auto_335706 )
      ( MAKE-8PILE ?auto_335704 ?auto_335705 ?auto_335706 ?auto_335707 ?auto_335708 ?auto_335709 ?auto_335710 ?auto_335711 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_335738 - BLOCK
      ?auto_335739 - BLOCK
      ?auto_335740 - BLOCK
      ?auto_335741 - BLOCK
      ?auto_335742 - BLOCK
      ?auto_335743 - BLOCK
      ?auto_335744 - BLOCK
      ?auto_335745 - BLOCK
    )
    :vars
    (
      ?auto_335746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335745 ?auto_335746 ) ( ON-TABLE ?auto_335738 ) ( not ( = ?auto_335738 ?auto_335739 ) ) ( not ( = ?auto_335738 ?auto_335740 ) ) ( not ( = ?auto_335738 ?auto_335741 ) ) ( not ( = ?auto_335738 ?auto_335742 ) ) ( not ( = ?auto_335738 ?auto_335743 ) ) ( not ( = ?auto_335738 ?auto_335744 ) ) ( not ( = ?auto_335738 ?auto_335745 ) ) ( not ( = ?auto_335738 ?auto_335746 ) ) ( not ( = ?auto_335739 ?auto_335740 ) ) ( not ( = ?auto_335739 ?auto_335741 ) ) ( not ( = ?auto_335739 ?auto_335742 ) ) ( not ( = ?auto_335739 ?auto_335743 ) ) ( not ( = ?auto_335739 ?auto_335744 ) ) ( not ( = ?auto_335739 ?auto_335745 ) ) ( not ( = ?auto_335739 ?auto_335746 ) ) ( not ( = ?auto_335740 ?auto_335741 ) ) ( not ( = ?auto_335740 ?auto_335742 ) ) ( not ( = ?auto_335740 ?auto_335743 ) ) ( not ( = ?auto_335740 ?auto_335744 ) ) ( not ( = ?auto_335740 ?auto_335745 ) ) ( not ( = ?auto_335740 ?auto_335746 ) ) ( not ( = ?auto_335741 ?auto_335742 ) ) ( not ( = ?auto_335741 ?auto_335743 ) ) ( not ( = ?auto_335741 ?auto_335744 ) ) ( not ( = ?auto_335741 ?auto_335745 ) ) ( not ( = ?auto_335741 ?auto_335746 ) ) ( not ( = ?auto_335742 ?auto_335743 ) ) ( not ( = ?auto_335742 ?auto_335744 ) ) ( not ( = ?auto_335742 ?auto_335745 ) ) ( not ( = ?auto_335742 ?auto_335746 ) ) ( not ( = ?auto_335743 ?auto_335744 ) ) ( not ( = ?auto_335743 ?auto_335745 ) ) ( not ( = ?auto_335743 ?auto_335746 ) ) ( not ( = ?auto_335744 ?auto_335745 ) ) ( not ( = ?auto_335744 ?auto_335746 ) ) ( not ( = ?auto_335745 ?auto_335746 ) ) ( ON ?auto_335744 ?auto_335745 ) ( ON ?auto_335743 ?auto_335744 ) ( ON ?auto_335742 ?auto_335743 ) ( ON ?auto_335741 ?auto_335742 ) ( ON ?auto_335740 ?auto_335741 ) ( CLEAR ?auto_335738 ) ( ON ?auto_335739 ?auto_335740 ) ( CLEAR ?auto_335739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_335738 ?auto_335739 )
      ( MAKE-8PILE ?auto_335738 ?auto_335739 ?auto_335740 ?auto_335741 ?auto_335742 ?auto_335743 ?auto_335744 ?auto_335745 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_335772 - BLOCK
      ?auto_335773 - BLOCK
      ?auto_335774 - BLOCK
      ?auto_335775 - BLOCK
      ?auto_335776 - BLOCK
      ?auto_335777 - BLOCK
      ?auto_335778 - BLOCK
      ?auto_335779 - BLOCK
    )
    :vars
    (
      ?auto_335780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335779 ?auto_335780 ) ( not ( = ?auto_335772 ?auto_335773 ) ) ( not ( = ?auto_335772 ?auto_335774 ) ) ( not ( = ?auto_335772 ?auto_335775 ) ) ( not ( = ?auto_335772 ?auto_335776 ) ) ( not ( = ?auto_335772 ?auto_335777 ) ) ( not ( = ?auto_335772 ?auto_335778 ) ) ( not ( = ?auto_335772 ?auto_335779 ) ) ( not ( = ?auto_335772 ?auto_335780 ) ) ( not ( = ?auto_335773 ?auto_335774 ) ) ( not ( = ?auto_335773 ?auto_335775 ) ) ( not ( = ?auto_335773 ?auto_335776 ) ) ( not ( = ?auto_335773 ?auto_335777 ) ) ( not ( = ?auto_335773 ?auto_335778 ) ) ( not ( = ?auto_335773 ?auto_335779 ) ) ( not ( = ?auto_335773 ?auto_335780 ) ) ( not ( = ?auto_335774 ?auto_335775 ) ) ( not ( = ?auto_335774 ?auto_335776 ) ) ( not ( = ?auto_335774 ?auto_335777 ) ) ( not ( = ?auto_335774 ?auto_335778 ) ) ( not ( = ?auto_335774 ?auto_335779 ) ) ( not ( = ?auto_335774 ?auto_335780 ) ) ( not ( = ?auto_335775 ?auto_335776 ) ) ( not ( = ?auto_335775 ?auto_335777 ) ) ( not ( = ?auto_335775 ?auto_335778 ) ) ( not ( = ?auto_335775 ?auto_335779 ) ) ( not ( = ?auto_335775 ?auto_335780 ) ) ( not ( = ?auto_335776 ?auto_335777 ) ) ( not ( = ?auto_335776 ?auto_335778 ) ) ( not ( = ?auto_335776 ?auto_335779 ) ) ( not ( = ?auto_335776 ?auto_335780 ) ) ( not ( = ?auto_335777 ?auto_335778 ) ) ( not ( = ?auto_335777 ?auto_335779 ) ) ( not ( = ?auto_335777 ?auto_335780 ) ) ( not ( = ?auto_335778 ?auto_335779 ) ) ( not ( = ?auto_335778 ?auto_335780 ) ) ( not ( = ?auto_335779 ?auto_335780 ) ) ( ON ?auto_335778 ?auto_335779 ) ( ON ?auto_335777 ?auto_335778 ) ( ON ?auto_335776 ?auto_335777 ) ( ON ?auto_335775 ?auto_335776 ) ( ON ?auto_335774 ?auto_335775 ) ( ON ?auto_335773 ?auto_335774 ) ( ON ?auto_335772 ?auto_335773 ) ( CLEAR ?auto_335772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_335772 )
      ( MAKE-8PILE ?auto_335772 ?auto_335773 ?auto_335774 ?auto_335775 ?auto_335776 ?auto_335777 ?auto_335778 ?auto_335779 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_335807 - BLOCK
      ?auto_335808 - BLOCK
      ?auto_335809 - BLOCK
      ?auto_335810 - BLOCK
      ?auto_335811 - BLOCK
      ?auto_335812 - BLOCK
      ?auto_335813 - BLOCK
      ?auto_335814 - BLOCK
      ?auto_335815 - BLOCK
    )
    :vars
    (
      ?auto_335816 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_335814 ) ( ON ?auto_335815 ?auto_335816 ) ( CLEAR ?auto_335815 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_335807 ) ( ON ?auto_335808 ?auto_335807 ) ( ON ?auto_335809 ?auto_335808 ) ( ON ?auto_335810 ?auto_335809 ) ( ON ?auto_335811 ?auto_335810 ) ( ON ?auto_335812 ?auto_335811 ) ( ON ?auto_335813 ?auto_335812 ) ( ON ?auto_335814 ?auto_335813 ) ( not ( = ?auto_335807 ?auto_335808 ) ) ( not ( = ?auto_335807 ?auto_335809 ) ) ( not ( = ?auto_335807 ?auto_335810 ) ) ( not ( = ?auto_335807 ?auto_335811 ) ) ( not ( = ?auto_335807 ?auto_335812 ) ) ( not ( = ?auto_335807 ?auto_335813 ) ) ( not ( = ?auto_335807 ?auto_335814 ) ) ( not ( = ?auto_335807 ?auto_335815 ) ) ( not ( = ?auto_335807 ?auto_335816 ) ) ( not ( = ?auto_335808 ?auto_335809 ) ) ( not ( = ?auto_335808 ?auto_335810 ) ) ( not ( = ?auto_335808 ?auto_335811 ) ) ( not ( = ?auto_335808 ?auto_335812 ) ) ( not ( = ?auto_335808 ?auto_335813 ) ) ( not ( = ?auto_335808 ?auto_335814 ) ) ( not ( = ?auto_335808 ?auto_335815 ) ) ( not ( = ?auto_335808 ?auto_335816 ) ) ( not ( = ?auto_335809 ?auto_335810 ) ) ( not ( = ?auto_335809 ?auto_335811 ) ) ( not ( = ?auto_335809 ?auto_335812 ) ) ( not ( = ?auto_335809 ?auto_335813 ) ) ( not ( = ?auto_335809 ?auto_335814 ) ) ( not ( = ?auto_335809 ?auto_335815 ) ) ( not ( = ?auto_335809 ?auto_335816 ) ) ( not ( = ?auto_335810 ?auto_335811 ) ) ( not ( = ?auto_335810 ?auto_335812 ) ) ( not ( = ?auto_335810 ?auto_335813 ) ) ( not ( = ?auto_335810 ?auto_335814 ) ) ( not ( = ?auto_335810 ?auto_335815 ) ) ( not ( = ?auto_335810 ?auto_335816 ) ) ( not ( = ?auto_335811 ?auto_335812 ) ) ( not ( = ?auto_335811 ?auto_335813 ) ) ( not ( = ?auto_335811 ?auto_335814 ) ) ( not ( = ?auto_335811 ?auto_335815 ) ) ( not ( = ?auto_335811 ?auto_335816 ) ) ( not ( = ?auto_335812 ?auto_335813 ) ) ( not ( = ?auto_335812 ?auto_335814 ) ) ( not ( = ?auto_335812 ?auto_335815 ) ) ( not ( = ?auto_335812 ?auto_335816 ) ) ( not ( = ?auto_335813 ?auto_335814 ) ) ( not ( = ?auto_335813 ?auto_335815 ) ) ( not ( = ?auto_335813 ?auto_335816 ) ) ( not ( = ?auto_335814 ?auto_335815 ) ) ( not ( = ?auto_335814 ?auto_335816 ) ) ( not ( = ?auto_335815 ?auto_335816 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_335815 ?auto_335816 )
      ( !STACK ?auto_335815 ?auto_335814 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_335845 - BLOCK
      ?auto_335846 - BLOCK
      ?auto_335847 - BLOCK
      ?auto_335848 - BLOCK
      ?auto_335849 - BLOCK
      ?auto_335850 - BLOCK
      ?auto_335851 - BLOCK
      ?auto_335852 - BLOCK
      ?auto_335853 - BLOCK
    )
    :vars
    (
      ?auto_335854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335853 ?auto_335854 ) ( ON-TABLE ?auto_335845 ) ( ON ?auto_335846 ?auto_335845 ) ( ON ?auto_335847 ?auto_335846 ) ( ON ?auto_335848 ?auto_335847 ) ( ON ?auto_335849 ?auto_335848 ) ( ON ?auto_335850 ?auto_335849 ) ( ON ?auto_335851 ?auto_335850 ) ( not ( = ?auto_335845 ?auto_335846 ) ) ( not ( = ?auto_335845 ?auto_335847 ) ) ( not ( = ?auto_335845 ?auto_335848 ) ) ( not ( = ?auto_335845 ?auto_335849 ) ) ( not ( = ?auto_335845 ?auto_335850 ) ) ( not ( = ?auto_335845 ?auto_335851 ) ) ( not ( = ?auto_335845 ?auto_335852 ) ) ( not ( = ?auto_335845 ?auto_335853 ) ) ( not ( = ?auto_335845 ?auto_335854 ) ) ( not ( = ?auto_335846 ?auto_335847 ) ) ( not ( = ?auto_335846 ?auto_335848 ) ) ( not ( = ?auto_335846 ?auto_335849 ) ) ( not ( = ?auto_335846 ?auto_335850 ) ) ( not ( = ?auto_335846 ?auto_335851 ) ) ( not ( = ?auto_335846 ?auto_335852 ) ) ( not ( = ?auto_335846 ?auto_335853 ) ) ( not ( = ?auto_335846 ?auto_335854 ) ) ( not ( = ?auto_335847 ?auto_335848 ) ) ( not ( = ?auto_335847 ?auto_335849 ) ) ( not ( = ?auto_335847 ?auto_335850 ) ) ( not ( = ?auto_335847 ?auto_335851 ) ) ( not ( = ?auto_335847 ?auto_335852 ) ) ( not ( = ?auto_335847 ?auto_335853 ) ) ( not ( = ?auto_335847 ?auto_335854 ) ) ( not ( = ?auto_335848 ?auto_335849 ) ) ( not ( = ?auto_335848 ?auto_335850 ) ) ( not ( = ?auto_335848 ?auto_335851 ) ) ( not ( = ?auto_335848 ?auto_335852 ) ) ( not ( = ?auto_335848 ?auto_335853 ) ) ( not ( = ?auto_335848 ?auto_335854 ) ) ( not ( = ?auto_335849 ?auto_335850 ) ) ( not ( = ?auto_335849 ?auto_335851 ) ) ( not ( = ?auto_335849 ?auto_335852 ) ) ( not ( = ?auto_335849 ?auto_335853 ) ) ( not ( = ?auto_335849 ?auto_335854 ) ) ( not ( = ?auto_335850 ?auto_335851 ) ) ( not ( = ?auto_335850 ?auto_335852 ) ) ( not ( = ?auto_335850 ?auto_335853 ) ) ( not ( = ?auto_335850 ?auto_335854 ) ) ( not ( = ?auto_335851 ?auto_335852 ) ) ( not ( = ?auto_335851 ?auto_335853 ) ) ( not ( = ?auto_335851 ?auto_335854 ) ) ( not ( = ?auto_335852 ?auto_335853 ) ) ( not ( = ?auto_335852 ?auto_335854 ) ) ( not ( = ?auto_335853 ?auto_335854 ) ) ( CLEAR ?auto_335851 ) ( ON ?auto_335852 ?auto_335853 ) ( CLEAR ?auto_335852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_335845 ?auto_335846 ?auto_335847 ?auto_335848 ?auto_335849 ?auto_335850 ?auto_335851 ?auto_335852 )
      ( MAKE-9PILE ?auto_335845 ?auto_335846 ?auto_335847 ?auto_335848 ?auto_335849 ?auto_335850 ?auto_335851 ?auto_335852 ?auto_335853 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_335883 - BLOCK
      ?auto_335884 - BLOCK
      ?auto_335885 - BLOCK
      ?auto_335886 - BLOCK
      ?auto_335887 - BLOCK
      ?auto_335888 - BLOCK
      ?auto_335889 - BLOCK
      ?auto_335890 - BLOCK
      ?auto_335891 - BLOCK
    )
    :vars
    (
      ?auto_335892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335891 ?auto_335892 ) ( ON-TABLE ?auto_335883 ) ( ON ?auto_335884 ?auto_335883 ) ( ON ?auto_335885 ?auto_335884 ) ( ON ?auto_335886 ?auto_335885 ) ( ON ?auto_335887 ?auto_335886 ) ( ON ?auto_335888 ?auto_335887 ) ( not ( = ?auto_335883 ?auto_335884 ) ) ( not ( = ?auto_335883 ?auto_335885 ) ) ( not ( = ?auto_335883 ?auto_335886 ) ) ( not ( = ?auto_335883 ?auto_335887 ) ) ( not ( = ?auto_335883 ?auto_335888 ) ) ( not ( = ?auto_335883 ?auto_335889 ) ) ( not ( = ?auto_335883 ?auto_335890 ) ) ( not ( = ?auto_335883 ?auto_335891 ) ) ( not ( = ?auto_335883 ?auto_335892 ) ) ( not ( = ?auto_335884 ?auto_335885 ) ) ( not ( = ?auto_335884 ?auto_335886 ) ) ( not ( = ?auto_335884 ?auto_335887 ) ) ( not ( = ?auto_335884 ?auto_335888 ) ) ( not ( = ?auto_335884 ?auto_335889 ) ) ( not ( = ?auto_335884 ?auto_335890 ) ) ( not ( = ?auto_335884 ?auto_335891 ) ) ( not ( = ?auto_335884 ?auto_335892 ) ) ( not ( = ?auto_335885 ?auto_335886 ) ) ( not ( = ?auto_335885 ?auto_335887 ) ) ( not ( = ?auto_335885 ?auto_335888 ) ) ( not ( = ?auto_335885 ?auto_335889 ) ) ( not ( = ?auto_335885 ?auto_335890 ) ) ( not ( = ?auto_335885 ?auto_335891 ) ) ( not ( = ?auto_335885 ?auto_335892 ) ) ( not ( = ?auto_335886 ?auto_335887 ) ) ( not ( = ?auto_335886 ?auto_335888 ) ) ( not ( = ?auto_335886 ?auto_335889 ) ) ( not ( = ?auto_335886 ?auto_335890 ) ) ( not ( = ?auto_335886 ?auto_335891 ) ) ( not ( = ?auto_335886 ?auto_335892 ) ) ( not ( = ?auto_335887 ?auto_335888 ) ) ( not ( = ?auto_335887 ?auto_335889 ) ) ( not ( = ?auto_335887 ?auto_335890 ) ) ( not ( = ?auto_335887 ?auto_335891 ) ) ( not ( = ?auto_335887 ?auto_335892 ) ) ( not ( = ?auto_335888 ?auto_335889 ) ) ( not ( = ?auto_335888 ?auto_335890 ) ) ( not ( = ?auto_335888 ?auto_335891 ) ) ( not ( = ?auto_335888 ?auto_335892 ) ) ( not ( = ?auto_335889 ?auto_335890 ) ) ( not ( = ?auto_335889 ?auto_335891 ) ) ( not ( = ?auto_335889 ?auto_335892 ) ) ( not ( = ?auto_335890 ?auto_335891 ) ) ( not ( = ?auto_335890 ?auto_335892 ) ) ( not ( = ?auto_335891 ?auto_335892 ) ) ( ON ?auto_335890 ?auto_335891 ) ( CLEAR ?auto_335888 ) ( ON ?auto_335889 ?auto_335890 ) ( CLEAR ?auto_335889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_335883 ?auto_335884 ?auto_335885 ?auto_335886 ?auto_335887 ?auto_335888 ?auto_335889 )
      ( MAKE-9PILE ?auto_335883 ?auto_335884 ?auto_335885 ?auto_335886 ?auto_335887 ?auto_335888 ?auto_335889 ?auto_335890 ?auto_335891 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_335921 - BLOCK
      ?auto_335922 - BLOCK
      ?auto_335923 - BLOCK
      ?auto_335924 - BLOCK
      ?auto_335925 - BLOCK
      ?auto_335926 - BLOCK
      ?auto_335927 - BLOCK
      ?auto_335928 - BLOCK
      ?auto_335929 - BLOCK
    )
    :vars
    (
      ?auto_335930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335929 ?auto_335930 ) ( ON-TABLE ?auto_335921 ) ( ON ?auto_335922 ?auto_335921 ) ( ON ?auto_335923 ?auto_335922 ) ( ON ?auto_335924 ?auto_335923 ) ( ON ?auto_335925 ?auto_335924 ) ( not ( = ?auto_335921 ?auto_335922 ) ) ( not ( = ?auto_335921 ?auto_335923 ) ) ( not ( = ?auto_335921 ?auto_335924 ) ) ( not ( = ?auto_335921 ?auto_335925 ) ) ( not ( = ?auto_335921 ?auto_335926 ) ) ( not ( = ?auto_335921 ?auto_335927 ) ) ( not ( = ?auto_335921 ?auto_335928 ) ) ( not ( = ?auto_335921 ?auto_335929 ) ) ( not ( = ?auto_335921 ?auto_335930 ) ) ( not ( = ?auto_335922 ?auto_335923 ) ) ( not ( = ?auto_335922 ?auto_335924 ) ) ( not ( = ?auto_335922 ?auto_335925 ) ) ( not ( = ?auto_335922 ?auto_335926 ) ) ( not ( = ?auto_335922 ?auto_335927 ) ) ( not ( = ?auto_335922 ?auto_335928 ) ) ( not ( = ?auto_335922 ?auto_335929 ) ) ( not ( = ?auto_335922 ?auto_335930 ) ) ( not ( = ?auto_335923 ?auto_335924 ) ) ( not ( = ?auto_335923 ?auto_335925 ) ) ( not ( = ?auto_335923 ?auto_335926 ) ) ( not ( = ?auto_335923 ?auto_335927 ) ) ( not ( = ?auto_335923 ?auto_335928 ) ) ( not ( = ?auto_335923 ?auto_335929 ) ) ( not ( = ?auto_335923 ?auto_335930 ) ) ( not ( = ?auto_335924 ?auto_335925 ) ) ( not ( = ?auto_335924 ?auto_335926 ) ) ( not ( = ?auto_335924 ?auto_335927 ) ) ( not ( = ?auto_335924 ?auto_335928 ) ) ( not ( = ?auto_335924 ?auto_335929 ) ) ( not ( = ?auto_335924 ?auto_335930 ) ) ( not ( = ?auto_335925 ?auto_335926 ) ) ( not ( = ?auto_335925 ?auto_335927 ) ) ( not ( = ?auto_335925 ?auto_335928 ) ) ( not ( = ?auto_335925 ?auto_335929 ) ) ( not ( = ?auto_335925 ?auto_335930 ) ) ( not ( = ?auto_335926 ?auto_335927 ) ) ( not ( = ?auto_335926 ?auto_335928 ) ) ( not ( = ?auto_335926 ?auto_335929 ) ) ( not ( = ?auto_335926 ?auto_335930 ) ) ( not ( = ?auto_335927 ?auto_335928 ) ) ( not ( = ?auto_335927 ?auto_335929 ) ) ( not ( = ?auto_335927 ?auto_335930 ) ) ( not ( = ?auto_335928 ?auto_335929 ) ) ( not ( = ?auto_335928 ?auto_335930 ) ) ( not ( = ?auto_335929 ?auto_335930 ) ) ( ON ?auto_335928 ?auto_335929 ) ( ON ?auto_335927 ?auto_335928 ) ( CLEAR ?auto_335925 ) ( ON ?auto_335926 ?auto_335927 ) ( CLEAR ?auto_335926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_335921 ?auto_335922 ?auto_335923 ?auto_335924 ?auto_335925 ?auto_335926 )
      ( MAKE-9PILE ?auto_335921 ?auto_335922 ?auto_335923 ?auto_335924 ?auto_335925 ?auto_335926 ?auto_335927 ?auto_335928 ?auto_335929 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_335959 - BLOCK
      ?auto_335960 - BLOCK
      ?auto_335961 - BLOCK
      ?auto_335962 - BLOCK
      ?auto_335963 - BLOCK
      ?auto_335964 - BLOCK
      ?auto_335965 - BLOCK
      ?auto_335966 - BLOCK
      ?auto_335967 - BLOCK
    )
    :vars
    (
      ?auto_335968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335967 ?auto_335968 ) ( ON-TABLE ?auto_335959 ) ( ON ?auto_335960 ?auto_335959 ) ( ON ?auto_335961 ?auto_335960 ) ( ON ?auto_335962 ?auto_335961 ) ( not ( = ?auto_335959 ?auto_335960 ) ) ( not ( = ?auto_335959 ?auto_335961 ) ) ( not ( = ?auto_335959 ?auto_335962 ) ) ( not ( = ?auto_335959 ?auto_335963 ) ) ( not ( = ?auto_335959 ?auto_335964 ) ) ( not ( = ?auto_335959 ?auto_335965 ) ) ( not ( = ?auto_335959 ?auto_335966 ) ) ( not ( = ?auto_335959 ?auto_335967 ) ) ( not ( = ?auto_335959 ?auto_335968 ) ) ( not ( = ?auto_335960 ?auto_335961 ) ) ( not ( = ?auto_335960 ?auto_335962 ) ) ( not ( = ?auto_335960 ?auto_335963 ) ) ( not ( = ?auto_335960 ?auto_335964 ) ) ( not ( = ?auto_335960 ?auto_335965 ) ) ( not ( = ?auto_335960 ?auto_335966 ) ) ( not ( = ?auto_335960 ?auto_335967 ) ) ( not ( = ?auto_335960 ?auto_335968 ) ) ( not ( = ?auto_335961 ?auto_335962 ) ) ( not ( = ?auto_335961 ?auto_335963 ) ) ( not ( = ?auto_335961 ?auto_335964 ) ) ( not ( = ?auto_335961 ?auto_335965 ) ) ( not ( = ?auto_335961 ?auto_335966 ) ) ( not ( = ?auto_335961 ?auto_335967 ) ) ( not ( = ?auto_335961 ?auto_335968 ) ) ( not ( = ?auto_335962 ?auto_335963 ) ) ( not ( = ?auto_335962 ?auto_335964 ) ) ( not ( = ?auto_335962 ?auto_335965 ) ) ( not ( = ?auto_335962 ?auto_335966 ) ) ( not ( = ?auto_335962 ?auto_335967 ) ) ( not ( = ?auto_335962 ?auto_335968 ) ) ( not ( = ?auto_335963 ?auto_335964 ) ) ( not ( = ?auto_335963 ?auto_335965 ) ) ( not ( = ?auto_335963 ?auto_335966 ) ) ( not ( = ?auto_335963 ?auto_335967 ) ) ( not ( = ?auto_335963 ?auto_335968 ) ) ( not ( = ?auto_335964 ?auto_335965 ) ) ( not ( = ?auto_335964 ?auto_335966 ) ) ( not ( = ?auto_335964 ?auto_335967 ) ) ( not ( = ?auto_335964 ?auto_335968 ) ) ( not ( = ?auto_335965 ?auto_335966 ) ) ( not ( = ?auto_335965 ?auto_335967 ) ) ( not ( = ?auto_335965 ?auto_335968 ) ) ( not ( = ?auto_335966 ?auto_335967 ) ) ( not ( = ?auto_335966 ?auto_335968 ) ) ( not ( = ?auto_335967 ?auto_335968 ) ) ( ON ?auto_335966 ?auto_335967 ) ( ON ?auto_335965 ?auto_335966 ) ( ON ?auto_335964 ?auto_335965 ) ( CLEAR ?auto_335962 ) ( ON ?auto_335963 ?auto_335964 ) ( CLEAR ?auto_335963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_335959 ?auto_335960 ?auto_335961 ?auto_335962 ?auto_335963 )
      ( MAKE-9PILE ?auto_335959 ?auto_335960 ?auto_335961 ?auto_335962 ?auto_335963 ?auto_335964 ?auto_335965 ?auto_335966 ?auto_335967 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_335997 - BLOCK
      ?auto_335998 - BLOCK
      ?auto_335999 - BLOCK
      ?auto_336000 - BLOCK
      ?auto_336001 - BLOCK
      ?auto_336002 - BLOCK
      ?auto_336003 - BLOCK
      ?auto_336004 - BLOCK
      ?auto_336005 - BLOCK
    )
    :vars
    (
      ?auto_336006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336005 ?auto_336006 ) ( ON-TABLE ?auto_335997 ) ( ON ?auto_335998 ?auto_335997 ) ( ON ?auto_335999 ?auto_335998 ) ( not ( = ?auto_335997 ?auto_335998 ) ) ( not ( = ?auto_335997 ?auto_335999 ) ) ( not ( = ?auto_335997 ?auto_336000 ) ) ( not ( = ?auto_335997 ?auto_336001 ) ) ( not ( = ?auto_335997 ?auto_336002 ) ) ( not ( = ?auto_335997 ?auto_336003 ) ) ( not ( = ?auto_335997 ?auto_336004 ) ) ( not ( = ?auto_335997 ?auto_336005 ) ) ( not ( = ?auto_335997 ?auto_336006 ) ) ( not ( = ?auto_335998 ?auto_335999 ) ) ( not ( = ?auto_335998 ?auto_336000 ) ) ( not ( = ?auto_335998 ?auto_336001 ) ) ( not ( = ?auto_335998 ?auto_336002 ) ) ( not ( = ?auto_335998 ?auto_336003 ) ) ( not ( = ?auto_335998 ?auto_336004 ) ) ( not ( = ?auto_335998 ?auto_336005 ) ) ( not ( = ?auto_335998 ?auto_336006 ) ) ( not ( = ?auto_335999 ?auto_336000 ) ) ( not ( = ?auto_335999 ?auto_336001 ) ) ( not ( = ?auto_335999 ?auto_336002 ) ) ( not ( = ?auto_335999 ?auto_336003 ) ) ( not ( = ?auto_335999 ?auto_336004 ) ) ( not ( = ?auto_335999 ?auto_336005 ) ) ( not ( = ?auto_335999 ?auto_336006 ) ) ( not ( = ?auto_336000 ?auto_336001 ) ) ( not ( = ?auto_336000 ?auto_336002 ) ) ( not ( = ?auto_336000 ?auto_336003 ) ) ( not ( = ?auto_336000 ?auto_336004 ) ) ( not ( = ?auto_336000 ?auto_336005 ) ) ( not ( = ?auto_336000 ?auto_336006 ) ) ( not ( = ?auto_336001 ?auto_336002 ) ) ( not ( = ?auto_336001 ?auto_336003 ) ) ( not ( = ?auto_336001 ?auto_336004 ) ) ( not ( = ?auto_336001 ?auto_336005 ) ) ( not ( = ?auto_336001 ?auto_336006 ) ) ( not ( = ?auto_336002 ?auto_336003 ) ) ( not ( = ?auto_336002 ?auto_336004 ) ) ( not ( = ?auto_336002 ?auto_336005 ) ) ( not ( = ?auto_336002 ?auto_336006 ) ) ( not ( = ?auto_336003 ?auto_336004 ) ) ( not ( = ?auto_336003 ?auto_336005 ) ) ( not ( = ?auto_336003 ?auto_336006 ) ) ( not ( = ?auto_336004 ?auto_336005 ) ) ( not ( = ?auto_336004 ?auto_336006 ) ) ( not ( = ?auto_336005 ?auto_336006 ) ) ( ON ?auto_336004 ?auto_336005 ) ( ON ?auto_336003 ?auto_336004 ) ( ON ?auto_336002 ?auto_336003 ) ( ON ?auto_336001 ?auto_336002 ) ( CLEAR ?auto_335999 ) ( ON ?auto_336000 ?auto_336001 ) ( CLEAR ?auto_336000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_335997 ?auto_335998 ?auto_335999 ?auto_336000 )
      ( MAKE-9PILE ?auto_335997 ?auto_335998 ?auto_335999 ?auto_336000 ?auto_336001 ?auto_336002 ?auto_336003 ?auto_336004 ?auto_336005 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_336035 - BLOCK
      ?auto_336036 - BLOCK
      ?auto_336037 - BLOCK
      ?auto_336038 - BLOCK
      ?auto_336039 - BLOCK
      ?auto_336040 - BLOCK
      ?auto_336041 - BLOCK
      ?auto_336042 - BLOCK
      ?auto_336043 - BLOCK
    )
    :vars
    (
      ?auto_336044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336043 ?auto_336044 ) ( ON-TABLE ?auto_336035 ) ( ON ?auto_336036 ?auto_336035 ) ( not ( = ?auto_336035 ?auto_336036 ) ) ( not ( = ?auto_336035 ?auto_336037 ) ) ( not ( = ?auto_336035 ?auto_336038 ) ) ( not ( = ?auto_336035 ?auto_336039 ) ) ( not ( = ?auto_336035 ?auto_336040 ) ) ( not ( = ?auto_336035 ?auto_336041 ) ) ( not ( = ?auto_336035 ?auto_336042 ) ) ( not ( = ?auto_336035 ?auto_336043 ) ) ( not ( = ?auto_336035 ?auto_336044 ) ) ( not ( = ?auto_336036 ?auto_336037 ) ) ( not ( = ?auto_336036 ?auto_336038 ) ) ( not ( = ?auto_336036 ?auto_336039 ) ) ( not ( = ?auto_336036 ?auto_336040 ) ) ( not ( = ?auto_336036 ?auto_336041 ) ) ( not ( = ?auto_336036 ?auto_336042 ) ) ( not ( = ?auto_336036 ?auto_336043 ) ) ( not ( = ?auto_336036 ?auto_336044 ) ) ( not ( = ?auto_336037 ?auto_336038 ) ) ( not ( = ?auto_336037 ?auto_336039 ) ) ( not ( = ?auto_336037 ?auto_336040 ) ) ( not ( = ?auto_336037 ?auto_336041 ) ) ( not ( = ?auto_336037 ?auto_336042 ) ) ( not ( = ?auto_336037 ?auto_336043 ) ) ( not ( = ?auto_336037 ?auto_336044 ) ) ( not ( = ?auto_336038 ?auto_336039 ) ) ( not ( = ?auto_336038 ?auto_336040 ) ) ( not ( = ?auto_336038 ?auto_336041 ) ) ( not ( = ?auto_336038 ?auto_336042 ) ) ( not ( = ?auto_336038 ?auto_336043 ) ) ( not ( = ?auto_336038 ?auto_336044 ) ) ( not ( = ?auto_336039 ?auto_336040 ) ) ( not ( = ?auto_336039 ?auto_336041 ) ) ( not ( = ?auto_336039 ?auto_336042 ) ) ( not ( = ?auto_336039 ?auto_336043 ) ) ( not ( = ?auto_336039 ?auto_336044 ) ) ( not ( = ?auto_336040 ?auto_336041 ) ) ( not ( = ?auto_336040 ?auto_336042 ) ) ( not ( = ?auto_336040 ?auto_336043 ) ) ( not ( = ?auto_336040 ?auto_336044 ) ) ( not ( = ?auto_336041 ?auto_336042 ) ) ( not ( = ?auto_336041 ?auto_336043 ) ) ( not ( = ?auto_336041 ?auto_336044 ) ) ( not ( = ?auto_336042 ?auto_336043 ) ) ( not ( = ?auto_336042 ?auto_336044 ) ) ( not ( = ?auto_336043 ?auto_336044 ) ) ( ON ?auto_336042 ?auto_336043 ) ( ON ?auto_336041 ?auto_336042 ) ( ON ?auto_336040 ?auto_336041 ) ( ON ?auto_336039 ?auto_336040 ) ( ON ?auto_336038 ?auto_336039 ) ( CLEAR ?auto_336036 ) ( ON ?auto_336037 ?auto_336038 ) ( CLEAR ?auto_336037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_336035 ?auto_336036 ?auto_336037 )
      ( MAKE-9PILE ?auto_336035 ?auto_336036 ?auto_336037 ?auto_336038 ?auto_336039 ?auto_336040 ?auto_336041 ?auto_336042 ?auto_336043 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_336073 - BLOCK
      ?auto_336074 - BLOCK
      ?auto_336075 - BLOCK
      ?auto_336076 - BLOCK
      ?auto_336077 - BLOCK
      ?auto_336078 - BLOCK
      ?auto_336079 - BLOCK
      ?auto_336080 - BLOCK
      ?auto_336081 - BLOCK
    )
    :vars
    (
      ?auto_336082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336081 ?auto_336082 ) ( ON-TABLE ?auto_336073 ) ( not ( = ?auto_336073 ?auto_336074 ) ) ( not ( = ?auto_336073 ?auto_336075 ) ) ( not ( = ?auto_336073 ?auto_336076 ) ) ( not ( = ?auto_336073 ?auto_336077 ) ) ( not ( = ?auto_336073 ?auto_336078 ) ) ( not ( = ?auto_336073 ?auto_336079 ) ) ( not ( = ?auto_336073 ?auto_336080 ) ) ( not ( = ?auto_336073 ?auto_336081 ) ) ( not ( = ?auto_336073 ?auto_336082 ) ) ( not ( = ?auto_336074 ?auto_336075 ) ) ( not ( = ?auto_336074 ?auto_336076 ) ) ( not ( = ?auto_336074 ?auto_336077 ) ) ( not ( = ?auto_336074 ?auto_336078 ) ) ( not ( = ?auto_336074 ?auto_336079 ) ) ( not ( = ?auto_336074 ?auto_336080 ) ) ( not ( = ?auto_336074 ?auto_336081 ) ) ( not ( = ?auto_336074 ?auto_336082 ) ) ( not ( = ?auto_336075 ?auto_336076 ) ) ( not ( = ?auto_336075 ?auto_336077 ) ) ( not ( = ?auto_336075 ?auto_336078 ) ) ( not ( = ?auto_336075 ?auto_336079 ) ) ( not ( = ?auto_336075 ?auto_336080 ) ) ( not ( = ?auto_336075 ?auto_336081 ) ) ( not ( = ?auto_336075 ?auto_336082 ) ) ( not ( = ?auto_336076 ?auto_336077 ) ) ( not ( = ?auto_336076 ?auto_336078 ) ) ( not ( = ?auto_336076 ?auto_336079 ) ) ( not ( = ?auto_336076 ?auto_336080 ) ) ( not ( = ?auto_336076 ?auto_336081 ) ) ( not ( = ?auto_336076 ?auto_336082 ) ) ( not ( = ?auto_336077 ?auto_336078 ) ) ( not ( = ?auto_336077 ?auto_336079 ) ) ( not ( = ?auto_336077 ?auto_336080 ) ) ( not ( = ?auto_336077 ?auto_336081 ) ) ( not ( = ?auto_336077 ?auto_336082 ) ) ( not ( = ?auto_336078 ?auto_336079 ) ) ( not ( = ?auto_336078 ?auto_336080 ) ) ( not ( = ?auto_336078 ?auto_336081 ) ) ( not ( = ?auto_336078 ?auto_336082 ) ) ( not ( = ?auto_336079 ?auto_336080 ) ) ( not ( = ?auto_336079 ?auto_336081 ) ) ( not ( = ?auto_336079 ?auto_336082 ) ) ( not ( = ?auto_336080 ?auto_336081 ) ) ( not ( = ?auto_336080 ?auto_336082 ) ) ( not ( = ?auto_336081 ?auto_336082 ) ) ( ON ?auto_336080 ?auto_336081 ) ( ON ?auto_336079 ?auto_336080 ) ( ON ?auto_336078 ?auto_336079 ) ( ON ?auto_336077 ?auto_336078 ) ( ON ?auto_336076 ?auto_336077 ) ( ON ?auto_336075 ?auto_336076 ) ( CLEAR ?auto_336073 ) ( ON ?auto_336074 ?auto_336075 ) ( CLEAR ?auto_336074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_336073 ?auto_336074 )
      ( MAKE-9PILE ?auto_336073 ?auto_336074 ?auto_336075 ?auto_336076 ?auto_336077 ?auto_336078 ?auto_336079 ?auto_336080 ?auto_336081 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_336111 - BLOCK
      ?auto_336112 - BLOCK
      ?auto_336113 - BLOCK
      ?auto_336114 - BLOCK
      ?auto_336115 - BLOCK
      ?auto_336116 - BLOCK
      ?auto_336117 - BLOCK
      ?auto_336118 - BLOCK
      ?auto_336119 - BLOCK
    )
    :vars
    (
      ?auto_336120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336119 ?auto_336120 ) ( not ( = ?auto_336111 ?auto_336112 ) ) ( not ( = ?auto_336111 ?auto_336113 ) ) ( not ( = ?auto_336111 ?auto_336114 ) ) ( not ( = ?auto_336111 ?auto_336115 ) ) ( not ( = ?auto_336111 ?auto_336116 ) ) ( not ( = ?auto_336111 ?auto_336117 ) ) ( not ( = ?auto_336111 ?auto_336118 ) ) ( not ( = ?auto_336111 ?auto_336119 ) ) ( not ( = ?auto_336111 ?auto_336120 ) ) ( not ( = ?auto_336112 ?auto_336113 ) ) ( not ( = ?auto_336112 ?auto_336114 ) ) ( not ( = ?auto_336112 ?auto_336115 ) ) ( not ( = ?auto_336112 ?auto_336116 ) ) ( not ( = ?auto_336112 ?auto_336117 ) ) ( not ( = ?auto_336112 ?auto_336118 ) ) ( not ( = ?auto_336112 ?auto_336119 ) ) ( not ( = ?auto_336112 ?auto_336120 ) ) ( not ( = ?auto_336113 ?auto_336114 ) ) ( not ( = ?auto_336113 ?auto_336115 ) ) ( not ( = ?auto_336113 ?auto_336116 ) ) ( not ( = ?auto_336113 ?auto_336117 ) ) ( not ( = ?auto_336113 ?auto_336118 ) ) ( not ( = ?auto_336113 ?auto_336119 ) ) ( not ( = ?auto_336113 ?auto_336120 ) ) ( not ( = ?auto_336114 ?auto_336115 ) ) ( not ( = ?auto_336114 ?auto_336116 ) ) ( not ( = ?auto_336114 ?auto_336117 ) ) ( not ( = ?auto_336114 ?auto_336118 ) ) ( not ( = ?auto_336114 ?auto_336119 ) ) ( not ( = ?auto_336114 ?auto_336120 ) ) ( not ( = ?auto_336115 ?auto_336116 ) ) ( not ( = ?auto_336115 ?auto_336117 ) ) ( not ( = ?auto_336115 ?auto_336118 ) ) ( not ( = ?auto_336115 ?auto_336119 ) ) ( not ( = ?auto_336115 ?auto_336120 ) ) ( not ( = ?auto_336116 ?auto_336117 ) ) ( not ( = ?auto_336116 ?auto_336118 ) ) ( not ( = ?auto_336116 ?auto_336119 ) ) ( not ( = ?auto_336116 ?auto_336120 ) ) ( not ( = ?auto_336117 ?auto_336118 ) ) ( not ( = ?auto_336117 ?auto_336119 ) ) ( not ( = ?auto_336117 ?auto_336120 ) ) ( not ( = ?auto_336118 ?auto_336119 ) ) ( not ( = ?auto_336118 ?auto_336120 ) ) ( not ( = ?auto_336119 ?auto_336120 ) ) ( ON ?auto_336118 ?auto_336119 ) ( ON ?auto_336117 ?auto_336118 ) ( ON ?auto_336116 ?auto_336117 ) ( ON ?auto_336115 ?auto_336116 ) ( ON ?auto_336114 ?auto_336115 ) ( ON ?auto_336113 ?auto_336114 ) ( ON ?auto_336112 ?auto_336113 ) ( ON ?auto_336111 ?auto_336112 ) ( CLEAR ?auto_336111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_336111 )
      ( MAKE-9PILE ?auto_336111 ?auto_336112 ?auto_336113 ?auto_336114 ?auto_336115 ?auto_336116 ?auto_336117 ?auto_336118 ?auto_336119 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336150 - BLOCK
      ?auto_336151 - BLOCK
      ?auto_336152 - BLOCK
      ?auto_336153 - BLOCK
      ?auto_336154 - BLOCK
      ?auto_336155 - BLOCK
      ?auto_336156 - BLOCK
      ?auto_336157 - BLOCK
      ?auto_336158 - BLOCK
      ?auto_336159 - BLOCK
    )
    :vars
    (
      ?auto_336160 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_336158 ) ( ON ?auto_336159 ?auto_336160 ) ( CLEAR ?auto_336159 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_336150 ) ( ON ?auto_336151 ?auto_336150 ) ( ON ?auto_336152 ?auto_336151 ) ( ON ?auto_336153 ?auto_336152 ) ( ON ?auto_336154 ?auto_336153 ) ( ON ?auto_336155 ?auto_336154 ) ( ON ?auto_336156 ?auto_336155 ) ( ON ?auto_336157 ?auto_336156 ) ( ON ?auto_336158 ?auto_336157 ) ( not ( = ?auto_336150 ?auto_336151 ) ) ( not ( = ?auto_336150 ?auto_336152 ) ) ( not ( = ?auto_336150 ?auto_336153 ) ) ( not ( = ?auto_336150 ?auto_336154 ) ) ( not ( = ?auto_336150 ?auto_336155 ) ) ( not ( = ?auto_336150 ?auto_336156 ) ) ( not ( = ?auto_336150 ?auto_336157 ) ) ( not ( = ?auto_336150 ?auto_336158 ) ) ( not ( = ?auto_336150 ?auto_336159 ) ) ( not ( = ?auto_336150 ?auto_336160 ) ) ( not ( = ?auto_336151 ?auto_336152 ) ) ( not ( = ?auto_336151 ?auto_336153 ) ) ( not ( = ?auto_336151 ?auto_336154 ) ) ( not ( = ?auto_336151 ?auto_336155 ) ) ( not ( = ?auto_336151 ?auto_336156 ) ) ( not ( = ?auto_336151 ?auto_336157 ) ) ( not ( = ?auto_336151 ?auto_336158 ) ) ( not ( = ?auto_336151 ?auto_336159 ) ) ( not ( = ?auto_336151 ?auto_336160 ) ) ( not ( = ?auto_336152 ?auto_336153 ) ) ( not ( = ?auto_336152 ?auto_336154 ) ) ( not ( = ?auto_336152 ?auto_336155 ) ) ( not ( = ?auto_336152 ?auto_336156 ) ) ( not ( = ?auto_336152 ?auto_336157 ) ) ( not ( = ?auto_336152 ?auto_336158 ) ) ( not ( = ?auto_336152 ?auto_336159 ) ) ( not ( = ?auto_336152 ?auto_336160 ) ) ( not ( = ?auto_336153 ?auto_336154 ) ) ( not ( = ?auto_336153 ?auto_336155 ) ) ( not ( = ?auto_336153 ?auto_336156 ) ) ( not ( = ?auto_336153 ?auto_336157 ) ) ( not ( = ?auto_336153 ?auto_336158 ) ) ( not ( = ?auto_336153 ?auto_336159 ) ) ( not ( = ?auto_336153 ?auto_336160 ) ) ( not ( = ?auto_336154 ?auto_336155 ) ) ( not ( = ?auto_336154 ?auto_336156 ) ) ( not ( = ?auto_336154 ?auto_336157 ) ) ( not ( = ?auto_336154 ?auto_336158 ) ) ( not ( = ?auto_336154 ?auto_336159 ) ) ( not ( = ?auto_336154 ?auto_336160 ) ) ( not ( = ?auto_336155 ?auto_336156 ) ) ( not ( = ?auto_336155 ?auto_336157 ) ) ( not ( = ?auto_336155 ?auto_336158 ) ) ( not ( = ?auto_336155 ?auto_336159 ) ) ( not ( = ?auto_336155 ?auto_336160 ) ) ( not ( = ?auto_336156 ?auto_336157 ) ) ( not ( = ?auto_336156 ?auto_336158 ) ) ( not ( = ?auto_336156 ?auto_336159 ) ) ( not ( = ?auto_336156 ?auto_336160 ) ) ( not ( = ?auto_336157 ?auto_336158 ) ) ( not ( = ?auto_336157 ?auto_336159 ) ) ( not ( = ?auto_336157 ?auto_336160 ) ) ( not ( = ?auto_336158 ?auto_336159 ) ) ( not ( = ?auto_336158 ?auto_336160 ) ) ( not ( = ?auto_336159 ?auto_336160 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_336159 ?auto_336160 )
      ( !STACK ?auto_336159 ?auto_336158 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336192 - BLOCK
      ?auto_336193 - BLOCK
      ?auto_336194 - BLOCK
      ?auto_336195 - BLOCK
      ?auto_336196 - BLOCK
      ?auto_336197 - BLOCK
      ?auto_336198 - BLOCK
      ?auto_336199 - BLOCK
      ?auto_336200 - BLOCK
      ?auto_336201 - BLOCK
    )
    :vars
    (
      ?auto_336202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336201 ?auto_336202 ) ( ON-TABLE ?auto_336192 ) ( ON ?auto_336193 ?auto_336192 ) ( ON ?auto_336194 ?auto_336193 ) ( ON ?auto_336195 ?auto_336194 ) ( ON ?auto_336196 ?auto_336195 ) ( ON ?auto_336197 ?auto_336196 ) ( ON ?auto_336198 ?auto_336197 ) ( ON ?auto_336199 ?auto_336198 ) ( not ( = ?auto_336192 ?auto_336193 ) ) ( not ( = ?auto_336192 ?auto_336194 ) ) ( not ( = ?auto_336192 ?auto_336195 ) ) ( not ( = ?auto_336192 ?auto_336196 ) ) ( not ( = ?auto_336192 ?auto_336197 ) ) ( not ( = ?auto_336192 ?auto_336198 ) ) ( not ( = ?auto_336192 ?auto_336199 ) ) ( not ( = ?auto_336192 ?auto_336200 ) ) ( not ( = ?auto_336192 ?auto_336201 ) ) ( not ( = ?auto_336192 ?auto_336202 ) ) ( not ( = ?auto_336193 ?auto_336194 ) ) ( not ( = ?auto_336193 ?auto_336195 ) ) ( not ( = ?auto_336193 ?auto_336196 ) ) ( not ( = ?auto_336193 ?auto_336197 ) ) ( not ( = ?auto_336193 ?auto_336198 ) ) ( not ( = ?auto_336193 ?auto_336199 ) ) ( not ( = ?auto_336193 ?auto_336200 ) ) ( not ( = ?auto_336193 ?auto_336201 ) ) ( not ( = ?auto_336193 ?auto_336202 ) ) ( not ( = ?auto_336194 ?auto_336195 ) ) ( not ( = ?auto_336194 ?auto_336196 ) ) ( not ( = ?auto_336194 ?auto_336197 ) ) ( not ( = ?auto_336194 ?auto_336198 ) ) ( not ( = ?auto_336194 ?auto_336199 ) ) ( not ( = ?auto_336194 ?auto_336200 ) ) ( not ( = ?auto_336194 ?auto_336201 ) ) ( not ( = ?auto_336194 ?auto_336202 ) ) ( not ( = ?auto_336195 ?auto_336196 ) ) ( not ( = ?auto_336195 ?auto_336197 ) ) ( not ( = ?auto_336195 ?auto_336198 ) ) ( not ( = ?auto_336195 ?auto_336199 ) ) ( not ( = ?auto_336195 ?auto_336200 ) ) ( not ( = ?auto_336195 ?auto_336201 ) ) ( not ( = ?auto_336195 ?auto_336202 ) ) ( not ( = ?auto_336196 ?auto_336197 ) ) ( not ( = ?auto_336196 ?auto_336198 ) ) ( not ( = ?auto_336196 ?auto_336199 ) ) ( not ( = ?auto_336196 ?auto_336200 ) ) ( not ( = ?auto_336196 ?auto_336201 ) ) ( not ( = ?auto_336196 ?auto_336202 ) ) ( not ( = ?auto_336197 ?auto_336198 ) ) ( not ( = ?auto_336197 ?auto_336199 ) ) ( not ( = ?auto_336197 ?auto_336200 ) ) ( not ( = ?auto_336197 ?auto_336201 ) ) ( not ( = ?auto_336197 ?auto_336202 ) ) ( not ( = ?auto_336198 ?auto_336199 ) ) ( not ( = ?auto_336198 ?auto_336200 ) ) ( not ( = ?auto_336198 ?auto_336201 ) ) ( not ( = ?auto_336198 ?auto_336202 ) ) ( not ( = ?auto_336199 ?auto_336200 ) ) ( not ( = ?auto_336199 ?auto_336201 ) ) ( not ( = ?auto_336199 ?auto_336202 ) ) ( not ( = ?auto_336200 ?auto_336201 ) ) ( not ( = ?auto_336200 ?auto_336202 ) ) ( not ( = ?auto_336201 ?auto_336202 ) ) ( CLEAR ?auto_336199 ) ( ON ?auto_336200 ?auto_336201 ) ( CLEAR ?auto_336200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_336192 ?auto_336193 ?auto_336194 ?auto_336195 ?auto_336196 ?auto_336197 ?auto_336198 ?auto_336199 ?auto_336200 )
      ( MAKE-10PILE ?auto_336192 ?auto_336193 ?auto_336194 ?auto_336195 ?auto_336196 ?auto_336197 ?auto_336198 ?auto_336199 ?auto_336200 ?auto_336201 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336234 - BLOCK
      ?auto_336235 - BLOCK
      ?auto_336236 - BLOCK
      ?auto_336237 - BLOCK
      ?auto_336238 - BLOCK
      ?auto_336239 - BLOCK
      ?auto_336240 - BLOCK
      ?auto_336241 - BLOCK
      ?auto_336242 - BLOCK
      ?auto_336243 - BLOCK
    )
    :vars
    (
      ?auto_336244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336243 ?auto_336244 ) ( ON-TABLE ?auto_336234 ) ( ON ?auto_336235 ?auto_336234 ) ( ON ?auto_336236 ?auto_336235 ) ( ON ?auto_336237 ?auto_336236 ) ( ON ?auto_336238 ?auto_336237 ) ( ON ?auto_336239 ?auto_336238 ) ( ON ?auto_336240 ?auto_336239 ) ( not ( = ?auto_336234 ?auto_336235 ) ) ( not ( = ?auto_336234 ?auto_336236 ) ) ( not ( = ?auto_336234 ?auto_336237 ) ) ( not ( = ?auto_336234 ?auto_336238 ) ) ( not ( = ?auto_336234 ?auto_336239 ) ) ( not ( = ?auto_336234 ?auto_336240 ) ) ( not ( = ?auto_336234 ?auto_336241 ) ) ( not ( = ?auto_336234 ?auto_336242 ) ) ( not ( = ?auto_336234 ?auto_336243 ) ) ( not ( = ?auto_336234 ?auto_336244 ) ) ( not ( = ?auto_336235 ?auto_336236 ) ) ( not ( = ?auto_336235 ?auto_336237 ) ) ( not ( = ?auto_336235 ?auto_336238 ) ) ( not ( = ?auto_336235 ?auto_336239 ) ) ( not ( = ?auto_336235 ?auto_336240 ) ) ( not ( = ?auto_336235 ?auto_336241 ) ) ( not ( = ?auto_336235 ?auto_336242 ) ) ( not ( = ?auto_336235 ?auto_336243 ) ) ( not ( = ?auto_336235 ?auto_336244 ) ) ( not ( = ?auto_336236 ?auto_336237 ) ) ( not ( = ?auto_336236 ?auto_336238 ) ) ( not ( = ?auto_336236 ?auto_336239 ) ) ( not ( = ?auto_336236 ?auto_336240 ) ) ( not ( = ?auto_336236 ?auto_336241 ) ) ( not ( = ?auto_336236 ?auto_336242 ) ) ( not ( = ?auto_336236 ?auto_336243 ) ) ( not ( = ?auto_336236 ?auto_336244 ) ) ( not ( = ?auto_336237 ?auto_336238 ) ) ( not ( = ?auto_336237 ?auto_336239 ) ) ( not ( = ?auto_336237 ?auto_336240 ) ) ( not ( = ?auto_336237 ?auto_336241 ) ) ( not ( = ?auto_336237 ?auto_336242 ) ) ( not ( = ?auto_336237 ?auto_336243 ) ) ( not ( = ?auto_336237 ?auto_336244 ) ) ( not ( = ?auto_336238 ?auto_336239 ) ) ( not ( = ?auto_336238 ?auto_336240 ) ) ( not ( = ?auto_336238 ?auto_336241 ) ) ( not ( = ?auto_336238 ?auto_336242 ) ) ( not ( = ?auto_336238 ?auto_336243 ) ) ( not ( = ?auto_336238 ?auto_336244 ) ) ( not ( = ?auto_336239 ?auto_336240 ) ) ( not ( = ?auto_336239 ?auto_336241 ) ) ( not ( = ?auto_336239 ?auto_336242 ) ) ( not ( = ?auto_336239 ?auto_336243 ) ) ( not ( = ?auto_336239 ?auto_336244 ) ) ( not ( = ?auto_336240 ?auto_336241 ) ) ( not ( = ?auto_336240 ?auto_336242 ) ) ( not ( = ?auto_336240 ?auto_336243 ) ) ( not ( = ?auto_336240 ?auto_336244 ) ) ( not ( = ?auto_336241 ?auto_336242 ) ) ( not ( = ?auto_336241 ?auto_336243 ) ) ( not ( = ?auto_336241 ?auto_336244 ) ) ( not ( = ?auto_336242 ?auto_336243 ) ) ( not ( = ?auto_336242 ?auto_336244 ) ) ( not ( = ?auto_336243 ?auto_336244 ) ) ( ON ?auto_336242 ?auto_336243 ) ( CLEAR ?auto_336240 ) ( ON ?auto_336241 ?auto_336242 ) ( CLEAR ?auto_336241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_336234 ?auto_336235 ?auto_336236 ?auto_336237 ?auto_336238 ?auto_336239 ?auto_336240 ?auto_336241 )
      ( MAKE-10PILE ?auto_336234 ?auto_336235 ?auto_336236 ?auto_336237 ?auto_336238 ?auto_336239 ?auto_336240 ?auto_336241 ?auto_336242 ?auto_336243 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336276 - BLOCK
      ?auto_336277 - BLOCK
      ?auto_336278 - BLOCK
      ?auto_336279 - BLOCK
      ?auto_336280 - BLOCK
      ?auto_336281 - BLOCK
      ?auto_336282 - BLOCK
      ?auto_336283 - BLOCK
      ?auto_336284 - BLOCK
      ?auto_336285 - BLOCK
    )
    :vars
    (
      ?auto_336286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336285 ?auto_336286 ) ( ON-TABLE ?auto_336276 ) ( ON ?auto_336277 ?auto_336276 ) ( ON ?auto_336278 ?auto_336277 ) ( ON ?auto_336279 ?auto_336278 ) ( ON ?auto_336280 ?auto_336279 ) ( ON ?auto_336281 ?auto_336280 ) ( not ( = ?auto_336276 ?auto_336277 ) ) ( not ( = ?auto_336276 ?auto_336278 ) ) ( not ( = ?auto_336276 ?auto_336279 ) ) ( not ( = ?auto_336276 ?auto_336280 ) ) ( not ( = ?auto_336276 ?auto_336281 ) ) ( not ( = ?auto_336276 ?auto_336282 ) ) ( not ( = ?auto_336276 ?auto_336283 ) ) ( not ( = ?auto_336276 ?auto_336284 ) ) ( not ( = ?auto_336276 ?auto_336285 ) ) ( not ( = ?auto_336276 ?auto_336286 ) ) ( not ( = ?auto_336277 ?auto_336278 ) ) ( not ( = ?auto_336277 ?auto_336279 ) ) ( not ( = ?auto_336277 ?auto_336280 ) ) ( not ( = ?auto_336277 ?auto_336281 ) ) ( not ( = ?auto_336277 ?auto_336282 ) ) ( not ( = ?auto_336277 ?auto_336283 ) ) ( not ( = ?auto_336277 ?auto_336284 ) ) ( not ( = ?auto_336277 ?auto_336285 ) ) ( not ( = ?auto_336277 ?auto_336286 ) ) ( not ( = ?auto_336278 ?auto_336279 ) ) ( not ( = ?auto_336278 ?auto_336280 ) ) ( not ( = ?auto_336278 ?auto_336281 ) ) ( not ( = ?auto_336278 ?auto_336282 ) ) ( not ( = ?auto_336278 ?auto_336283 ) ) ( not ( = ?auto_336278 ?auto_336284 ) ) ( not ( = ?auto_336278 ?auto_336285 ) ) ( not ( = ?auto_336278 ?auto_336286 ) ) ( not ( = ?auto_336279 ?auto_336280 ) ) ( not ( = ?auto_336279 ?auto_336281 ) ) ( not ( = ?auto_336279 ?auto_336282 ) ) ( not ( = ?auto_336279 ?auto_336283 ) ) ( not ( = ?auto_336279 ?auto_336284 ) ) ( not ( = ?auto_336279 ?auto_336285 ) ) ( not ( = ?auto_336279 ?auto_336286 ) ) ( not ( = ?auto_336280 ?auto_336281 ) ) ( not ( = ?auto_336280 ?auto_336282 ) ) ( not ( = ?auto_336280 ?auto_336283 ) ) ( not ( = ?auto_336280 ?auto_336284 ) ) ( not ( = ?auto_336280 ?auto_336285 ) ) ( not ( = ?auto_336280 ?auto_336286 ) ) ( not ( = ?auto_336281 ?auto_336282 ) ) ( not ( = ?auto_336281 ?auto_336283 ) ) ( not ( = ?auto_336281 ?auto_336284 ) ) ( not ( = ?auto_336281 ?auto_336285 ) ) ( not ( = ?auto_336281 ?auto_336286 ) ) ( not ( = ?auto_336282 ?auto_336283 ) ) ( not ( = ?auto_336282 ?auto_336284 ) ) ( not ( = ?auto_336282 ?auto_336285 ) ) ( not ( = ?auto_336282 ?auto_336286 ) ) ( not ( = ?auto_336283 ?auto_336284 ) ) ( not ( = ?auto_336283 ?auto_336285 ) ) ( not ( = ?auto_336283 ?auto_336286 ) ) ( not ( = ?auto_336284 ?auto_336285 ) ) ( not ( = ?auto_336284 ?auto_336286 ) ) ( not ( = ?auto_336285 ?auto_336286 ) ) ( ON ?auto_336284 ?auto_336285 ) ( ON ?auto_336283 ?auto_336284 ) ( CLEAR ?auto_336281 ) ( ON ?auto_336282 ?auto_336283 ) ( CLEAR ?auto_336282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_336276 ?auto_336277 ?auto_336278 ?auto_336279 ?auto_336280 ?auto_336281 ?auto_336282 )
      ( MAKE-10PILE ?auto_336276 ?auto_336277 ?auto_336278 ?auto_336279 ?auto_336280 ?auto_336281 ?auto_336282 ?auto_336283 ?auto_336284 ?auto_336285 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336318 - BLOCK
      ?auto_336319 - BLOCK
      ?auto_336320 - BLOCK
      ?auto_336321 - BLOCK
      ?auto_336322 - BLOCK
      ?auto_336323 - BLOCK
      ?auto_336324 - BLOCK
      ?auto_336325 - BLOCK
      ?auto_336326 - BLOCK
      ?auto_336327 - BLOCK
    )
    :vars
    (
      ?auto_336328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336327 ?auto_336328 ) ( ON-TABLE ?auto_336318 ) ( ON ?auto_336319 ?auto_336318 ) ( ON ?auto_336320 ?auto_336319 ) ( ON ?auto_336321 ?auto_336320 ) ( ON ?auto_336322 ?auto_336321 ) ( not ( = ?auto_336318 ?auto_336319 ) ) ( not ( = ?auto_336318 ?auto_336320 ) ) ( not ( = ?auto_336318 ?auto_336321 ) ) ( not ( = ?auto_336318 ?auto_336322 ) ) ( not ( = ?auto_336318 ?auto_336323 ) ) ( not ( = ?auto_336318 ?auto_336324 ) ) ( not ( = ?auto_336318 ?auto_336325 ) ) ( not ( = ?auto_336318 ?auto_336326 ) ) ( not ( = ?auto_336318 ?auto_336327 ) ) ( not ( = ?auto_336318 ?auto_336328 ) ) ( not ( = ?auto_336319 ?auto_336320 ) ) ( not ( = ?auto_336319 ?auto_336321 ) ) ( not ( = ?auto_336319 ?auto_336322 ) ) ( not ( = ?auto_336319 ?auto_336323 ) ) ( not ( = ?auto_336319 ?auto_336324 ) ) ( not ( = ?auto_336319 ?auto_336325 ) ) ( not ( = ?auto_336319 ?auto_336326 ) ) ( not ( = ?auto_336319 ?auto_336327 ) ) ( not ( = ?auto_336319 ?auto_336328 ) ) ( not ( = ?auto_336320 ?auto_336321 ) ) ( not ( = ?auto_336320 ?auto_336322 ) ) ( not ( = ?auto_336320 ?auto_336323 ) ) ( not ( = ?auto_336320 ?auto_336324 ) ) ( not ( = ?auto_336320 ?auto_336325 ) ) ( not ( = ?auto_336320 ?auto_336326 ) ) ( not ( = ?auto_336320 ?auto_336327 ) ) ( not ( = ?auto_336320 ?auto_336328 ) ) ( not ( = ?auto_336321 ?auto_336322 ) ) ( not ( = ?auto_336321 ?auto_336323 ) ) ( not ( = ?auto_336321 ?auto_336324 ) ) ( not ( = ?auto_336321 ?auto_336325 ) ) ( not ( = ?auto_336321 ?auto_336326 ) ) ( not ( = ?auto_336321 ?auto_336327 ) ) ( not ( = ?auto_336321 ?auto_336328 ) ) ( not ( = ?auto_336322 ?auto_336323 ) ) ( not ( = ?auto_336322 ?auto_336324 ) ) ( not ( = ?auto_336322 ?auto_336325 ) ) ( not ( = ?auto_336322 ?auto_336326 ) ) ( not ( = ?auto_336322 ?auto_336327 ) ) ( not ( = ?auto_336322 ?auto_336328 ) ) ( not ( = ?auto_336323 ?auto_336324 ) ) ( not ( = ?auto_336323 ?auto_336325 ) ) ( not ( = ?auto_336323 ?auto_336326 ) ) ( not ( = ?auto_336323 ?auto_336327 ) ) ( not ( = ?auto_336323 ?auto_336328 ) ) ( not ( = ?auto_336324 ?auto_336325 ) ) ( not ( = ?auto_336324 ?auto_336326 ) ) ( not ( = ?auto_336324 ?auto_336327 ) ) ( not ( = ?auto_336324 ?auto_336328 ) ) ( not ( = ?auto_336325 ?auto_336326 ) ) ( not ( = ?auto_336325 ?auto_336327 ) ) ( not ( = ?auto_336325 ?auto_336328 ) ) ( not ( = ?auto_336326 ?auto_336327 ) ) ( not ( = ?auto_336326 ?auto_336328 ) ) ( not ( = ?auto_336327 ?auto_336328 ) ) ( ON ?auto_336326 ?auto_336327 ) ( ON ?auto_336325 ?auto_336326 ) ( ON ?auto_336324 ?auto_336325 ) ( CLEAR ?auto_336322 ) ( ON ?auto_336323 ?auto_336324 ) ( CLEAR ?auto_336323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_336318 ?auto_336319 ?auto_336320 ?auto_336321 ?auto_336322 ?auto_336323 )
      ( MAKE-10PILE ?auto_336318 ?auto_336319 ?auto_336320 ?auto_336321 ?auto_336322 ?auto_336323 ?auto_336324 ?auto_336325 ?auto_336326 ?auto_336327 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336360 - BLOCK
      ?auto_336361 - BLOCK
      ?auto_336362 - BLOCK
      ?auto_336363 - BLOCK
      ?auto_336364 - BLOCK
      ?auto_336365 - BLOCK
      ?auto_336366 - BLOCK
      ?auto_336367 - BLOCK
      ?auto_336368 - BLOCK
      ?auto_336369 - BLOCK
    )
    :vars
    (
      ?auto_336370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336369 ?auto_336370 ) ( ON-TABLE ?auto_336360 ) ( ON ?auto_336361 ?auto_336360 ) ( ON ?auto_336362 ?auto_336361 ) ( ON ?auto_336363 ?auto_336362 ) ( not ( = ?auto_336360 ?auto_336361 ) ) ( not ( = ?auto_336360 ?auto_336362 ) ) ( not ( = ?auto_336360 ?auto_336363 ) ) ( not ( = ?auto_336360 ?auto_336364 ) ) ( not ( = ?auto_336360 ?auto_336365 ) ) ( not ( = ?auto_336360 ?auto_336366 ) ) ( not ( = ?auto_336360 ?auto_336367 ) ) ( not ( = ?auto_336360 ?auto_336368 ) ) ( not ( = ?auto_336360 ?auto_336369 ) ) ( not ( = ?auto_336360 ?auto_336370 ) ) ( not ( = ?auto_336361 ?auto_336362 ) ) ( not ( = ?auto_336361 ?auto_336363 ) ) ( not ( = ?auto_336361 ?auto_336364 ) ) ( not ( = ?auto_336361 ?auto_336365 ) ) ( not ( = ?auto_336361 ?auto_336366 ) ) ( not ( = ?auto_336361 ?auto_336367 ) ) ( not ( = ?auto_336361 ?auto_336368 ) ) ( not ( = ?auto_336361 ?auto_336369 ) ) ( not ( = ?auto_336361 ?auto_336370 ) ) ( not ( = ?auto_336362 ?auto_336363 ) ) ( not ( = ?auto_336362 ?auto_336364 ) ) ( not ( = ?auto_336362 ?auto_336365 ) ) ( not ( = ?auto_336362 ?auto_336366 ) ) ( not ( = ?auto_336362 ?auto_336367 ) ) ( not ( = ?auto_336362 ?auto_336368 ) ) ( not ( = ?auto_336362 ?auto_336369 ) ) ( not ( = ?auto_336362 ?auto_336370 ) ) ( not ( = ?auto_336363 ?auto_336364 ) ) ( not ( = ?auto_336363 ?auto_336365 ) ) ( not ( = ?auto_336363 ?auto_336366 ) ) ( not ( = ?auto_336363 ?auto_336367 ) ) ( not ( = ?auto_336363 ?auto_336368 ) ) ( not ( = ?auto_336363 ?auto_336369 ) ) ( not ( = ?auto_336363 ?auto_336370 ) ) ( not ( = ?auto_336364 ?auto_336365 ) ) ( not ( = ?auto_336364 ?auto_336366 ) ) ( not ( = ?auto_336364 ?auto_336367 ) ) ( not ( = ?auto_336364 ?auto_336368 ) ) ( not ( = ?auto_336364 ?auto_336369 ) ) ( not ( = ?auto_336364 ?auto_336370 ) ) ( not ( = ?auto_336365 ?auto_336366 ) ) ( not ( = ?auto_336365 ?auto_336367 ) ) ( not ( = ?auto_336365 ?auto_336368 ) ) ( not ( = ?auto_336365 ?auto_336369 ) ) ( not ( = ?auto_336365 ?auto_336370 ) ) ( not ( = ?auto_336366 ?auto_336367 ) ) ( not ( = ?auto_336366 ?auto_336368 ) ) ( not ( = ?auto_336366 ?auto_336369 ) ) ( not ( = ?auto_336366 ?auto_336370 ) ) ( not ( = ?auto_336367 ?auto_336368 ) ) ( not ( = ?auto_336367 ?auto_336369 ) ) ( not ( = ?auto_336367 ?auto_336370 ) ) ( not ( = ?auto_336368 ?auto_336369 ) ) ( not ( = ?auto_336368 ?auto_336370 ) ) ( not ( = ?auto_336369 ?auto_336370 ) ) ( ON ?auto_336368 ?auto_336369 ) ( ON ?auto_336367 ?auto_336368 ) ( ON ?auto_336366 ?auto_336367 ) ( ON ?auto_336365 ?auto_336366 ) ( CLEAR ?auto_336363 ) ( ON ?auto_336364 ?auto_336365 ) ( CLEAR ?auto_336364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_336360 ?auto_336361 ?auto_336362 ?auto_336363 ?auto_336364 )
      ( MAKE-10PILE ?auto_336360 ?auto_336361 ?auto_336362 ?auto_336363 ?auto_336364 ?auto_336365 ?auto_336366 ?auto_336367 ?auto_336368 ?auto_336369 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336402 - BLOCK
      ?auto_336403 - BLOCK
      ?auto_336404 - BLOCK
      ?auto_336405 - BLOCK
      ?auto_336406 - BLOCK
      ?auto_336407 - BLOCK
      ?auto_336408 - BLOCK
      ?auto_336409 - BLOCK
      ?auto_336410 - BLOCK
      ?auto_336411 - BLOCK
    )
    :vars
    (
      ?auto_336412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336411 ?auto_336412 ) ( ON-TABLE ?auto_336402 ) ( ON ?auto_336403 ?auto_336402 ) ( ON ?auto_336404 ?auto_336403 ) ( not ( = ?auto_336402 ?auto_336403 ) ) ( not ( = ?auto_336402 ?auto_336404 ) ) ( not ( = ?auto_336402 ?auto_336405 ) ) ( not ( = ?auto_336402 ?auto_336406 ) ) ( not ( = ?auto_336402 ?auto_336407 ) ) ( not ( = ?auto_336402 ?auto_336408 ) ) ( not ( = ?auto_336402 ?auto_336409 ) ) ( not ( = ?auto_336402 ?auto_336410 ) ) ( not ( = ?auto_336402 ?auto_336411 ) ) ( not ( = ?auto_336402 ?auto_336412 ) ) ( not ( = ?auto_336403 ?auto_336404 ) ) ( not ( = ?auto_336403 ?auto_336405 ) ) ( not ( = ?auto_336403 ?auto_336406 ) ) ( not ( = ?auto_336403 ?auto_336407 ) ) ( not ( = ?auto_336403 ?auto_336408 ) ) ( not ( = ?auto_336403 ?auto_336409 ) ) ( not ( = ?auto_336403 ?auto_336410 ) ) ( not ( = ?auto_336403 ?auto_336411 ) ) ( not ( = ?auto_336403 ?auto_336412 ) ) ( not ( = ?auto_336404 ?auto_336405 ) ) ( not ( = ?auto_336404 ?auto_336406 ) ) ( not ( = ?auto_336404 ?auto_336407 ) ) ( not ( = ?auto_336404 ?auto_336408 ) ) ( not ( = ?auto_336404 ?auto_336409 ) ) ( not ( = ?auto_336404 ?auto_336410 ) ) ( not ( = ?auto_336404 ?auto_336411 ) ) ( not ( = ?auto_336404 ?auto_336412 ) ) ( not ( = ?auto_336405 ?auto_336406 ) ) ( not ( = ?auto_336405 ?auto_336407 ) ) ( not ( = ?auto_336405 ?auto_336408 ) ) ( not ( = ?auto_336405 ?auto_336409 ) ) ( not ( = ?auto_336405 ?auto_336410 ) ) ( not ( = ?auto_336405 ?auto_336411 ) ) ( not ( = ?auto_336405 ?auto_336412 ) ) ( not ( = ?auto_336406 ?auto_336407 ) ) ( not ( = ?auto_336406 ?auto_336408 ) ) ( not ( = ?auto_336406 ?auto_336409 ) ) ( not ( = ?auto_336406 ?auto_336410 ) ) ( not ( = ?auto_336406 ?auto_336411 ) ) ( not ( = ?auto_336406 ?auto_336412 ) ) ( not ( = ?auto_336407 ?auto_336408 ) ) ( not ( = ?auto_336407 ?auto_336409 ) ) ( not ( = ?auto_336407 ?auto_336410 ) ) ( not ( = ?auto_336407 ?auto_336411 ) ) ( not ( = ?auto_336407 ?auto_336412 ) ) ( not ( = ?auto_336408 ?auto_336409 ) ) ( not ( = ?auto_336408 ?auto_336410 ) ) ( not ( = ?auto_336408 ?auto_336411 ) ) ( not ( = ?auto_336408 ?auto_336412 ) ) ( not ( = ?auto_336409 ?auto_336410 ) ) ( not ( = ?auto_336409 ?auto_336411 ) ) ( not ( = ?auto_336409 ?auto_336412 ) ) ( not ( = ?auto_336410 ?auto_336411 ) ) ( not ( = ?auto_336410 ?auto_336412 ) ) ( not ( = ?auto_336411 ?auto_336412 ) ) ( ON ?auto_336410 ?auto_336411 ) ( ON ?auto_336409 ?auto_336410 ) ( ON ?auto_336408 ?auto_336409 ) ( ON ?auto_336407 ?auto_336408 ) ( ON ?auto_336406 ?auto_336407 ) ( CLEAR ?auto_336404 ) ( ON ?auto_336405 ?auto_336406 ) ( CLEAR ?auto_336405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_336402 ?auto_336403 ?auto_336404 ?auto_336405 )
      ( MAKE-10PILE ?auto_336402 ?auto_336403 ?auto_336404 ?auto_336405 ?auto_336406 ?auto_336407 ?auto_336408 ?auto_336409 ?auto_336410 ?auto_336411 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336444 - BLOCK
      ?auto_336445 - BLOCK
      ?auto_336446 - BLOCK
      ?auto_336447 - BLOCK
      ?auto_336448 - BLOCK
      ?auto_336449 - BLOCK
      ?auto_336450 - BLOCK
      ?auto_336451 - BLOCK
      ?auto_336452 - BLOCK
      ?auto_336453 - BLOCK
    )
    :vars
    (
      ?auto_336454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336453 ?auto_336454 ) ( ON-TABLE ?auto_336444 ) ( ON ?auto_336445 ?auto_336444 ) ( not ( = ?auto_336444 ?auto_336445 ) ) ( not ( = ?auto_336444 ?auto_336446 ) ) ( not ( = ?auto_336444 ?auto_336447 ) ) ( not ( = ?auto_336444 ?auto_336448 ) ) ( not ( = ?auto_336444 ?auto_336449 ) ) ( not ( = ?auto_336444 ?auto_336450 ) ) ( not ( = ?auto_336444 ?auto_336451 ) ) ( not ( = ?auto_336444 ?auto_336452 ) ) ( not ( = ?auto_336444 ?auto_336453 ) ) ( not ( = ?auto_336444 ?auto_336454 ) ) ( not ( = ?auto_336445 ?auto_336446 ) ) ( not ( = ?auto_336445 ?auto_336447 ) ) ( not ( = ?auto_336445 ?auto_336448 ) ) ( not ( = ?auto_336445 ?auto_336449 ) ) ( not ( = ?auto_336445 ?auto_336450 ) ) ( not ( = ?auto_336445 ?auto_336451 ) ) ( not ( = ?auto_336445 ?auto_336452 ) ) ( not ( = ?auto_336445 ?auto_336453 ) ) ( not ( = ?auto_336445 ?auto_336454 ) ) ( not ( = ?auto_336446 ?auto_336447 ) ) ( not ( = ?auto_336446 ?auto_336448 ) ) ( not ( = ?auto_336446 ?auto_336449 ) ) ( not ( = ?auto_336446 ?auto_336450 ) ) ( not ( = ?auto_336446 ?auto_336451 ) ) ( not ( = ?auto_336446 ?auto_336452 ) ) ( not ( = ?auto_336446 ?auto_336453 ) ) ( not ( = ?auto_336446 ?auto_336454 ) ) ( not ( = ?auto_336447 ?auto_336448 ) ) ( not ( = ?auto_336447 ?auto_336449 ) ) ( not ( = ?auto_336447 ?auto_336450 ) ) ( not ( = ?auto_336447 ?auto_336451 ) ) ( not ( = ?auto_336447 ?auto_336452 ) ) ( not ( = ?auto_336447 ?auto_336453 ) ) ( not ( = ?auto_336447 ?auto_336454 ) ) ( not ( = ?auto_336448 ?auto_336449 ) ) ( not ( = ?auto_336448 ?auto_336450 ) ) ( not ( = ?auto_336448 ?auto_336451 ) ) ( not ( = ?auto_336448 ?auto_336452 ) ) ( not ( = ?auto_336448 ?auto_336453 ) ) ( not ( = ?auto_336448 ?auto_336454 ) ) ( not ( = ?auto_336449 ?auto_336450 ) ) ( not ( = ?auto_336449 ?auto_336451 ) ) ( not ( = ?auto_336449 ?auto_336452 ) ) ( not ( = ?auto_336449 ?auto_336453 ) ) ( not ( = ?auto_336449 ?auto_336454 ) ) ( not ( = ?auto_336450 ?auto_336451 ) ) ( not ( = ?auto_336450 ?auto_336452 ) ) ( not ( = ?auto_336450 ?auto_336453 ) ) ( not ( = ?auto_336450 ?auto_336454 ) ) ( not ( = ?auto_336451 ?auto_336452 ) ) ( not ( = ?auto_336451 ?auto_336453 ) ) ( not ( = ?auto_336451 ?auto_336454 ) ) ( not ( = ?auto_336452 ?auto_336453 ) ) ( not ( = ?auto_336452 ?auto_336454 ) ) ( not ( = ?auto_336453 ?auto_336454 ) ) ( ON ?auto_336452 ?auto_336453 ) ( ON ?auto_336451 ?auto_336452 ) ( ON ?auto_336450 ?auto_336451 ) ( ON ?auto_336449 ?auto_336450 ) ( ON ?auto_336448 ?auto_336449 ) ( ON ?auto_336447 ?auto_336448 ) ( CLEAR ?auto_336445 ) ( ON ?auto_336446 ?auto_336447 ) ( CLEAR ?auto_336446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_336444 ?auto_336445 ?auto_336446 )
      ( MAKE-10PILE ?auto_336444 ?auto_336445 ?auto_336446 ?auto_336447 ?auto_336448 ?auto_336449 ?auto_336450 ?auto_336451 ?auto_336452 ?auto_336453 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336486 - BLOCK
      ?auto_336487 - BLOCK
      ?auto_336488 - BLOCK
      ?auto_336489 - BLOCK
      ?auto_336490 - BLOCK
      ?auto_336491 - BLOCK
      ?auto_336492 - BLOCK
      ?auto_336493 - BLOCK
      ?auto_336494 - BLOCK
      ?auto_336495 - BLOCK
    )
    :vars
    (
      ?auto_336496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336495 ?auto_336496 ) ( ON-TABLE ?auto_336486 ) ( not ( = ?auto_336486 ?auto_336487 ) ) ( not ( = ?auto_336486 ?auto_336488 ) ) ( not ( = ?auto_336486 ?auto_336489 ) ) ( not ( = ?auto_336486 ?auto_336490 ) ) ( not ( = ?auto_336486 ?auto_336491 ) ) ( not ( = ?auto_336486 ?auto_336492 ) ) ( not ( = ?auto_336486 ?auto_336493 ) ) ( not ( = ?auto_336486 ?auto_336494 ) ) ( not ( = ?auto_336486 ?auto_336495 ) ) ( not ( = ?auto_336486 ?auto_336496 ) ) ( not ( = ?auto_336487 ?auto_336488 ) ) ( not ( = ?auto_336487 ?auto_336489 ) ) ( not ( = ?auto_336487 ?auto_336490 ) ) ( not ( = ?auto_336487 ?auto_336491 ) ) ( not ( = ?auto_336487 ?auto_336492 ) ) ( not ( = ?auto_336487 ?auto_336493 ) ) ( not ( = ?auto_336487 ?auto_336494 ) ) ( not ( = ?auto_336487 ?auto_336495 ) ) ( not ( = ?auto_336487 ?auto_336496 ) ) ( not ( = ?auto_336488 ?auto_336489 ) ) ( not ( = ?auto_336488 ?auto_336490 ) ) ( not ( = ?auto_336488 ?auto_336491 ) ) ( not ( = ?auto_336488 ?auto_336492 ) ) ( not ( = ?auto_336488 ?auto_336493 ) ) ( not ( = ?auto_336488 ?auto_336494 ) ) ( not ( = ?auto_336488 ?auto_336495 ) ) ( not ( = ?auto_336488 ?auto_336496 ) ) ( not ( = ?auto_336489 ?auto_336490 ) ) ( not ( = ?auto_336489 ?auto_336491 ) ) ( not ( = ?auto_336489 ?auto_336492 ) ) ( not ( = ?auto_336489 ?auto_336493 ) ) ( not ( = ?auto_336489 ?auto_336494 ) ) ( not ( = ?auto_336489 ?auto_336495 ) ) ( not ( = ?auto_336489 ?auto_336496 ) ) ( not ( = ?auto_336490 ?auto_336491 ) ) ( not ( = ?auto_336490 ?auto_336492 ) ) ( not ( = ?auto_336490 ?auto_336493 ) ) ( not ( = ?auto_336490 ?auto_336494 ) ) ( not ( = ?auto_336490 ?auto_336495 ) ) ( not ( = ?auto_336490 ?auto_336496 ) ) ( not ( = ?auto_336491 ?auto_336492 ) ) ( not ( = ?auto_336491 ?auto_336493 ) ) ( not ( = ?auto_336491 ?auto_336494 ) ) ( not ( = ?auto_336491 ?auto_336495 ) ) ( not ( = ?auto_336491 ?auto_336496 ) ) ( not ( = ?auto_336492 ?auto_336493 ) ) ( not ( = ?auto_336492 ?auto_336494 ) ) ( not ( = ?auto_336492 ?auto_336495 ) ) ( not ( = ?auto_336492 ?auto_336496 ) ) ( not ( = ?auto_336493 ?auto_336494 ) ) ( not ( = ?auto_336493 ?auto_336495 ) ) ( not ( = ?auto_336493 ?auto_336496 ) ) ( not ( = ?auto_336494 ?auto_336495 ) ) ( not ( = ?auto_336494 ?auto_336496 ) ) ( not ( = ?auto_336495 ?auto_336496 ) ) ( ON ?auto_336494 ?auto_336495 ) ( ON ?auto_336493 ?auto_336494 ) ( ON ?auto_336492 ?auto_336493 ) ( ON ?auto_336491 ?auto_336492 ) ( ON ?auto_336490 ?auto_336491 ) ( ON ?auto_336489 ?auto_336490 ) ( ON ?auto_336488 ?auto_336489 ) ( CLEAR ?auto_336486 ) ( ON ?auto_336487 ?auto_336488 ) ( CLEAR ?auto_336487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_336486 ?auto_336487 )
      ( MAKE-10PILE ?auto_336486 ?auto_336487 ?auto_336488 ?auto_336489 ?auto_336490 ?auto_336491 ?auto_336492 ?auto_336493 ?auto_336494 ?auto_336495 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336528 - BLOCK
      ?auto_336529 - BLOCK
      ?auto_336530 - BLOCK
      ?auto_336531 - BLOCK
      ?auto_336532 - BLOCK
      ?auto_336533 - BLOCK
      ?auto_336534 - BLOCK
      ?auto_336535 - BLOCK
      ?auto_336536 - BLOCK
      ?auto_336537 - BLOCK
    )
    :vars
    (
      ?auto_336538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336537 ?auto_336538 ) ( not ( = ?auto_336528 ?auto_336529 ) ) ( not ( = ?auto_336528 ?auto_336530 ) ) ( not ( = ?auto_336528 ?auto_336531 ) ) ( not ( = ?auto_336528 ?auto_336532 ) ) ( not ( = ?auto_336528 ?auto_336533 ) ) ( not ( = ?auto_336528 ?auto_336534 ) ) ( not ( = ?auto_336528 ?auto_336535 ) ) ( not ( = ?auto_336528 ?auto_336536 ) ) ( not ( = ?auto_336528 ?auto_336537 ) ) ( not ( = ?auto_336528 ?auto_336538 ) ) ( not ( = ?auto_336529 ?auto_336530 ) ) ( not ( = ?auto_336529 ?auto_336531 ) ) ( not ( = ?auto_336529 ?auto_336532 ) ) ( not ( = ?auto_336529 ?auto_336533 ) ) ( not ( = ?auto_336529 ?auto_336534 ) ) ( not ( = ?auto_336529 ?auto_336535 ) ) ( not ( = ?auto_336529 ?auto_336536 ) ) ( not ( = ?auto_336529 ?auto_336537 ) ) ( not ( = ?auto_336529 ?auto_336538 ) ) ( not ( = ?auto_336530 ?auto_336531 ) ) ( not ( = ?auto_336530 ?auto_336532 ) ) ( not ( = ?auto_336530 ?auto_336533 ) ) ( not ( = ?auto_336530 ?auto_336534 ) ) ( not ( = ?auto_336530 ?auto_336535 ) ) ( not ( = ?auto_336530 ?auto_336536 ) ) ( not ( = ?auto_336530 ?auto_336537 ) ) ( not ( = ?auto_336530 ?auto_336538 ) ) ( not ( = ?auto_336531 ?auto_336532 ) ) ( not ( = ?auto_336531 ?auto_336533 ) ) ( not ( = ?auto_336531 ?auto_336534 ) ) ( not ( = ?auto_336531 ?auto_336535 ) ) ( not ( = ?auto_336531 ?auto_336536 ) ) ( not ( = ?auto_336531 ?auto_336537 ) ) ( not ( = ?auto_336531 ?auto_336538 ) ) ( not ( = ?auto_336532 ?auto_336533 ) ) ( not ( = ?auto_336532 ?auto_336534 ) ) ( not ( = ?auto_336532 ?auto_336535 ) ) ( not ( = ?auto_336532 ?auto_336536 ) ) ( not ( = ?auto_336532 ?auto_336537 ) ) ( not ( = ?auto_336532 ?auto_336538 ) ) ( not ( = ?auto_336533 ?auto_336534 ) ) ( not ( = ?auto_336533 ?auto_336535 ) ) ( not ( = ?auto_336533 ?auto_336536 ) ) ( not ( = ?auto_336533 ?auto_336537 ) ) ( not ( = ?auto_336533 ?auto_336538 ) ) ( not ( = ?auto_336534 ?auto_336535 ) ) ( not ( = ?auto_336534 ?auto_336536 ) ) ( not ( = ?auto_336534 ?auto_336537 ) ) ( not ( = ?auto_336534 ?auto_336538 ) ) ( not ( = ?auto_336535 ?auto_336536 ) ) ( not ( = ?auto_336535 ?auto_336537 ) ) ( not ( = ?auto_336535 ?auto_336538 ) ) ( not ( = ?auto_336536 ?auto_336537 ) ) ( not ( = ?auto_336536 ?auto_336538 ) ) ( not ( = ?auto_336537 ?auto_336538 ) ) ( ON ?auto_336536 ?auto_336537 ) ( ON ?auto_336535 ?auto_336536 ) ( ON ?auto_336534 ?auto_336535 ) ( ON ?auto_336533 ?auto_336534 ) ( ON ?auto_336532 ?auto_336533 ) ( ON ?auto_336531 ?auto_336532 ) ( ON ?auto_336530 ?auto_336531 ) ( ON ?auto_336529 ?auto_336530 ) ( ON ?auto_336528 ?auto_336529 ) ( CLEAR ?auto_336528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_336528 )
      ( MAKE-10PILE ?auto_336528 ?auto_336529 ?auto_336530 ?auto_336531 ?auto_336532 ?auto_336533 ?auto_336534 ?auto_336535 ?auto_336536 ?auto_336537 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336571 - BLOCK
      ?auto_336572 - BLOCK
      ?auto_336573 - BLOCK
      ?auto_336574 - BLOCK
      ?auto_336575 - BLOCK
      ?auto_336576 - BLOCK
      ?auto_336577 - BLOCK
      ?auto_336578 - BLOCK
      ?auto_336579 - BLOCK
      ?auto_336580 - BLOCK
      ?auto_336581 - BLOCK
    )
    :vars
    (
      ?auto_336582 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_336580 ) ( ON ?auto_336581 ?auto_336582 ) ( CLEAR ?auto_336581 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_336571 ) ( ON ?auto_336572 ?auto_336571 ) ( ON ?auto_336573 ?auto_336572 ) ( ON ?auto_336574 ?auto_336573 ) ( ON ?auto_336575 ?auto_336574 ) ( ON ?auto_336576 ?auto_336575 ) ( ON ?auto_336577 ?auto_336576 ) ( ON ?auto_336578 ?auto_336577 ) ( ON ?auto_336579 ?auto_336578 ) ( ON ?auto_336580 ?auto_336579 ) ( not ( = ?auto_336571 ?auto_336572 ) ) ( not ( = ?auto_336571 ?auto_336573 ) ) ( not ( = ?auto_336571 ?auto_336574 ) ) ( not ( = ?auto_336571 ?auto_336575 ) ) ( not ( = ?auto_336571 ?auto_336576 ) ) ( not ( = ?auto_336571 ?auto_336577 ) ) ( not ( = ?auto_336571 ?auto_336578 ) ) ( not ( = ?auto_336571 ?auto_336579 ) ) ( not ( = ?auto_336571 ?auto_336580 ) ) ( not ( = ?auto_336571 ?auto_336581 ) ) ( not ( = ?auto_336571 ?auto_336582 ) ) ( not ( = ?auto_336572 ?auto_336573 ) ) ( not ( = ?auto_336572 ?auto_336574 ) ) ( not ( = ?auto_336572 ?auto_336575 ) ) ( not ( = ?auto_336572 ?auto_336576 ) ) ( not ( = ?auto_336572 ?auto_336577 ) ) ( not ( = ?auto_336572 ?auto_336578 ) ) ( not ( = ?auto_336572 ?auto_336579 ) ) ( not ( = ?auto_336572 ?auto_336580 ) ) ( not ( = ?auto_336572 ?auto_336581 ) ) ( not ( = ?auto_336572 ?auto_336582 ) ) ( not ( = ?auto_336573 ?auto_336574 ) ) ( not ( = ?auto_336573 ?auto_336575 ) ) ( not ( = ?auto_336573 ?auto_336576 ) ) ( not ( = ?auto_336573 ?auto_336577 ) ) ( not ( = ?auto_336573 ?auto_336578 ) ) ( not ( = ?auto_336573 ?auto_336579 ) ) ( not ( = ?auto_336573 ?auto_336580 ) ) ( not ( = ?auto_336573 ?auto_336581 ) ) ( not ( = ?auto_336573 ?auto_336582 ) ) ( not ( = ?auto_336574 ?auto_336575 ) ) ( not ( = ?auto_336574 ?auto_336576 ) ) ( not ( = ?auto_336574 ?auto_336577 ) ) ( not ( = ?auto_336574 ?auto_336578 ) ) ( not ( = ?auto_336574 ?auto_336579 ) ) ( not ( = ?auto_336574 ?auto_336580 ) ) ( not ( = ?auto_336574 ?auto_336581 ) ) ( not ( = ?auto_336574 ?auto_336582 ) ) ( not ( = ?auto_336575 ?auto_336576 ) ) ( not ( = ?auto_336575 ?auto_336577 ) ) ( not ( = ?auto_336575 ?auto_336578 ) ) ( not ( = ?auto_336575 ?auto_336579 ) ) ( not ( = ?auto_336575 ?auto_336580 ) ) ( not ( = ?auto_336575 ?auto_336581 ) ) ( not ( = ?auto_336575 ?auto_336582 ) ) ( not ( = ?auto_336576 ?auto_336577 ) ) ( not ( = ?auto_336576 ?auto_336578 ) ) ( not ( = ?auto_336576 ?auto_336579 ) ) ( not ( = ?auto_336576 ?auto_336580 ) ) ( not ( = ?auto_336576 ?auto_336581 ) ) ( not ( = ?auto_336576 ?auto_336582 ) ) ( not ( = ?auto_336577 ?auto_336578 ) ) ( not ( = ?auto_336577 ?auto_336579 ) ) ( not ( = ?auto_336577 ?auto_336580 ) ) ( not ( = ?auto_336577 ?auto_336581 ) ) ( not ( = ?auto_336577 ?auto_336582 ) ) ( not ( = ?auto_336578 ?auto_336579 ) ) ( not ( = ?auto_336578 ?auto_336580 ) ) ( not ( = ?auto_336578 ?auto_336581 ) ) ( not ( = ?auto_336578 ?auto_336582 ) ) ( not ( = ?auto_336579 ?auto_336580 ) ) ( not ( = ?auto_336579 ?auto_336581 ) ) ( not ( = ?auto_336579 ?auto_336582 ) ) ( not ( = ?auto_336580 ?auto_336581 ) ) ( not ( = ?auto_336580 ?auto_336582 ) ) ( not ( = ?auto_336581 ?auto_336582 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_336581 ?auto_336582 )
      ( !STACK ?auto_336581 ?auto_336580 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336617 - BLOCK
      ?auto_336618 - BLOCK
      ?auto_336619 - BLOCK
      ?auto_336620 - BLOCK
      ?auto_336621 - BLOCK
      ?auto_336622 - BLOCK
      ?auto_336623 - BLOCK
      ?auto_336624 - BLOCK
      ?auto_336625 - BLOCK
      ?auto_336626 - BLOCK
      ?auto_336627 - BLOCK
    )
    :vars
    (
      ?auto_336628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336627 ?auto_336628 ) ( ON-TABLE ?auto_336617 ) ( ON ?auto_336618 ?auto_336617 ) ( ON ?auto_336619 ?auto_336618 ) ( ON ?auto_336620 ?auto_336619 ) ( ON ?auto_336621 ?auto_336620 ) ( ON ?auto_336622 ?auto_336621 ) ( ON ?auto_336623 ?auto_336622 ) ( ON ?auto_336624 ?auto_336623 ) ( ON ?auto_336625 ?auto_336624 ) ( not ( = ?auto_336617 ?auto_336618 ) ) ( not ( = ?auto_336617 ?auto_336619 ) ) ( not ( = ?auto_336617 ?auto_336620 ) ) ( not ( = ?auto_336617 ?auto_336621 ) ) ( not ( = ?auto_336617 ?auto_336622 ) ) ( not ( = ?auto_336617 ?auto_336623 ) ) ( not ( = ?auto_336617 ?auto_336624 ) ) ( not ( = ?auto_336617 ?auto_336625 ) ) ( not ( = ?auto_336617 ?auto_336626 ) ) ( not ( = ?auto_336617 ?auto_336627 ) ) ( not ( = ?auto_336617 ?auto_336628 ) ) ( not ( = ?auto_336618 ?auto_336619 ) ) ( not ( = ?auto_336618 ?auto_336620 ) ) ( not ( = ?auto_336618 ?auto_336621 ) ) ( not ( = ?auto_336618 ?auto_336622 ) ) ( not ( = ?auto_336618 ?auto_336623 ) ) ( not ( = ?auto_336618 ?auto_336624 ) ) ( not ( = ?auto_336618 ?auto_336625 ) ) ( not ( = ?auto_336618 ?auto_336626 ) ) ( not ( = ?auto_336618 ?auto_336627 ) ) ( not ( = ?auto_336618 ?auto_336628 ) ) ( not ( = ?auto_336619 ?auto_336620 ) ) ( not ( = ?auto_336619 ?auto_336621 ) ) ( not ( = ?auto_336619 ?auto_336622 ) ) ( not ( = ?auto_336619 ?auto_336623 ) ) ( not ( = ?auto_336619 ?auto_336624 ) ) ( not ( = ?auto_336619 ?auto_336625 ) ) ( not ( = ?auto_336619 ?auto_336626 ) ) ( not ( = ?auto_336619 ?auto_336627 ) ) ( not ( = ?auto_336619 ?auto_336628 ) ) ( not ( = ?auto_336620 ?auto_336621 ) ) ( not ( = ?auto_336620 ?auto_336622 ) ) ( not ( = ?auto_336620 ?auto_336623 ) ) ( not ( = ?auto_336620 ?auto_336624 ) ) ( not ( = ?auto_336620 ?auto_336625 ) ) ( not ( = ?auto_336620 ?auto_336626 ) ) ( not ( = ?auto_336620 ?auto_336627 ) ) ( not ( = ?auto_336620 ?auto_336628 ) ) ( not ( = ?auto_336621 ?auto_336622 ) ) ( not ( = ?auto_336621 ?auto_336623 ) ) ( not ( = ?auto_336621 ?auto_336624 ) ) ( not ( = ?auto_336621 ?auto_336625 ) ) ( not ( = ?auto_336621 ?auto_336626 ) ) ( not ( = ?auto_336621 ?auto_336627 ) ) ( not ( = ?auto_336621 ?auto_336628 ) ) ( not ( = ?auto_336622 ?auto_336623 ) ) ( not ( = ?auto_336622 ?auto_336624 ) ) ( not ( = ?auto_336622 ?auto_336625 ) ) ( not ( = ?auto_336622 ?auto_336626 ) ) ( not ( = ?auto_336622 ?auto_336627 ) ) ( not ( = ?auto_336622 ?auto_336628 ) ) ( not ( = ?auto_336623 ?auto_336624 ) ) ( not ( = ?auto_336623 ?auto_336625 ) ) ( not ( = ?auto_336623 ?auto_336626 ) ) ( not ( = ?auto_336623 ?auto_336627 ) ) ( not ( = ?auto_336623 ?auto_336628 ) ) ( not ( = ?auto_336624 ?auto_336625 ) ) ( not ( = ?auto_336624 ?auto_336626 ) ) ( not ( = ?auto_336624 ?auto_336627 ) ) ( not ( = ?auto_336624 ?auto_336628 ) ) ( not ( = ?auto_336625 ?auto_336626 ) ) ( not ( = ?auto_336625 ?auto_336627 ) ) ( not ( = ?auto_336625 ?auto_336628 ) ) ( not ( = ?auto_336626 ?auto_336627 ) ) ( not ( = ?auto_336626 ?auto_336628 ) ) ( not ( = ?auto_336627 ?auto_336628 ) ) ( CLEAR ?auto_336625 ) ( ON ?auto_336626 ?auto_336627 ) ( CLEAR ?auto_336626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_336617 ?auto_336618 ?auto_336619 ?auto_336620 ?auto_336621 ?auto_336622 ?auto_336623 ?auto_336624 ?auto_336625 ?auto_336626 )
      ( MAKE-11PILE ?auto_336617 ?auto_336618 ?auto_336619 ?auto_336620 ?auto_336621 ?auto_336622 ?auto_336623 ?auto_336624 ?auto_336625 ?auto_336626 ?auto_336627 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336663 - BLOCK
      ?auto_336664 - BLOCK
      ?auto_336665 - BLOCK
      ?auto_336666 - BLOCK
      ?auto_336667 - BLOCK
      ?auto_336668 - BLOCK
      ?auto_336669 - BLOCK
      ?auto_336670 - BLOCK
      ?auto_336671 - BLOCK
      ?auto_336672 - BLOCK
      ?auto_336673 - BLOCK
    )
    :vars
    (
      ?auto_336674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336673 ?auto_336674 ) ( ON-TABLE ?auto_336663 ) ( ON ?auto_336664 ?auto_336663 ) ( ON ?auto_336665 ?auto_336664 ) ( ON ?auto_336666 ?auto_336665 ) ( ON ?auto_336667 ?auto_336666 ) ( ON ?auto_336668 ?auto_336667 ) ( ON ?auto_336669 ?auto_336668 ) ( ON ?auto_336670 ?auto_336669 ) ( not ( = ?auto_336663 ?auto_336664 ) ) ( not ( = ?auto_336663 ?auto_336665 ) ) ( not ( = ?auto_336663 ?auto_336666 ) ) ( not ( = ?auto_336663 ?auto_336667 ) ) ( not ( = ?auto_336663 ?auto_336668 ) ) ( not ( = ?auto_336663 ?auto_336669 ) ) ( not ( = ?auto_336663 ?auto_336670 ) ) ( not ( = ?auto_336663 ?auto_336671 ) ) ( not ( = ?auto_336663 ?auto_336672 ) ) ( not ( = ?auto_336663 ?auto_336673 ) ) ( not ( = ?auto_336663 ?auto_336674 ) ) ( not ( = ?auto_336664 ?auto_336665 ) ) ( not ( = ?auto_336664 ?auto_336666 ) ) ( not ( = ?auto_336664 ?auto_336667 ) ) ( not ( = ?auto_336664 ?auto_336668 ) ) ( not ( = ?auto_336664 ?auto_336669 ) ) ( not ( = ?auto_336664 ?auto_336670 ) ) ( not ( = ?auto_336664 ?auto_336671 ) ) ( not ( = ?auto_336664 ?auto_336672 ) ) ( not ( = ?auto_336664 ?auto_336673 ) ) ( not ( = ?auto_336664 ?auto_336674 ) ) ( not ( = ?auto_336665 ?auto_336666 ) ) ( not ( = ?auto_336665 ?auto_336667 ) ) ( not ( = ?auto_336665 ?auto_336668 ) ) ( not ( = ?auto_336665 ?auto_336669 ) ) ( not ( = ?auto_336665 ?auto_336670 ) ) ( not ( = ?auto_336665 ?auto_336671 ) ) ( not ( = ?auto_336665 ?auto_336672 ) ) ( not ( = ?auto_336665 ?auto_336673 ) ) ( not ( = ?auto_336665 ?auto_336674 ) ) ( not ( = ?auto_336666 ?auto_336667 ) ) ( not ( = ?auto_336666 ?auto_336668 ) ) ( not ( = ?auto_336666 ?auto_336669 ) ) ( not ( = ?auto_336666 ?auto_336670 ) ) ( not ( = ?auto_336666 ?auto_336671 ) ) ( not ( = ?auto_336666 ?auto_336672 ) ) ( not ( = ?auto_336666 ?auto_336673 ) ) ( not ( = ?auto_336666 ?auto_336674 ) ) ( not ( = ?auto_336667 ?auto_336668 ) ) ( not ( = ?auto_336667 ?auto_336669 ) ) ( not ( = ?auto_336667 ?auto_336670 ) ) ( not ( = ?auto_336667 ?auto_336671 ) ) ( not ( = ?auto_336667 ?auto_336672 ) ) ( not ( = ?auto_336667 ?auto_336673 ) ) ( not ( = ?auto_336667 ?auto_336674 ) ) ( not ( = ?auto_336668 ?auto_336669 ) ) ( not ( = ?auto_336668 ?auto_336670 ) ) ( not ( = ?auto_336668 ?auto_336671 ) ) ( not ( = ?auto_336668 ?auto_336672 ) ) ( not ( = ?auto_336668 ?auto_336673 ) ) ( not ( = ?auto_336668 ?auto_336674 ) ) ( not ( = ?auto_336669 ?auto_336670 ) ) ( not ( = ?auto_336669 ?auto_336671 ) ) ( not ( = ?auto_336669 ?auto_336672 ) ) ( not ( = ?auto_336669 ?auto_336673 ) ) ( not ( = ?auto_336669 ?auto_336674 ) ) ( not ( = ?auto_336670 ?auto_336671 ) ) ( not ( = ?auto_336670 ?auto_336672 ) ) ( not ( = ?auto_336670 ?auto_336673 ) ) ( not ( = ?auto_336670 ?auto_336674 ) ) ( not ( = ?auto_336671 ?auto_336672 ) ) ( not ( = ?auto_336671 ?auto_336673 ) ) ( not ( = ?auto_336671 ?auto_336674 ) ) ( not ( = ?auto_336672 ?auto_336673 ) ) ( not ( = ?auto_336672 ?auto_336674 ) ) ( not ( = ?auto_336673 ?auto_336674 ) ) ( ON ?auto_336672 ?auto_336673 ) ( CLEAR ?auto_336670 ) ( ON ?auto_336671 ?auto_336672 ) ( CLEAR ?auto_336671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_336663 ?auto_336664 ?auto_336665 ?auto_336666 ?auto_336667 ?auto_336668 ?auto_336669 ?auto_336670 ?auto_336671 )
      ( MAKE-11PILE ?auto_336663 ?auto_336664 ?auto_336665 ?auto_336666 ?auto_336667 ?auto_336668 ?auto_336669 ?auto_336670 ?auto_336671 ?auto_336672 ?auto_336673 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336709 - BLOCK
      ?auto_336710 - BLOCK
      ?auto_336711 - BLOCK
      ?auto_336712 - BLOCK
      ?auto_336713 - BLOCK
      ?auto_336714 - BLOCK
      ?auto_336715 - BLOCK
      ?auto_336716 - BLOCK
      ?auto_336717 - BLOCK
      ?auto_336718 - BLOCK
      ?auto_336719 - BLOCK
    )
    :vars
    (
      ?auto_336720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336719 ?auto_336720 ) ( ON-TABLE ?auto_336709 ) ( ON ?auto_336710 ?auto_336709 ) ( ON ?auto_336711 ?auto_336710 ) ( ON ?auto_336712 ?auto_336711 ) ( ON ?auto_336713 ?auto_336712 ) ( ON ?auto_336714 ?auto_336713 ) ( ON ?auto_336715 ?auto_336714 ) ( not ( = ?auto_336709 ?auto_336710 ) ) ( not ( = ?auto_336709 ?auto_336711 ) ) ( not ( = ?auto_336709 ?auto_336712 ) ) ( not ( = ?auto_336709 ?auto_336713 ) ) ( not ( = ?auto_336709 ?auto_336714 ) ) ( not ( = ?auto_336709 ?auto_336715 ) ) ( not ( = ?auto_336709 ?auto_336716 ) ) ( not ( = ?auto_336709 ?auto_336717 ) ) ( not ( = ?auto_336709 ?auto_336718 ) ) ( not ( = ?auto_336709 ?auto_336719 ) ) ( not ( = ?auto_336709 ?auto_336720 ) ) ( not ( = ?auto_336710 ?auto_336711 ) ) ( not ( = ?auto_336710 ?auto_336712 ) ) ( not ( = ?auto_336710 ?auto_336713 ) ) ( not ( = ?auto_336710 ?auto_336714 ) ) ( not ( = ?auto_336710 ?auto_336715 ) ) ( not ( = ?auto_336710 ?auto_336716 ) ) ( not ( = ?auto_336710 ?auto_336717 ) ) ( not ( = ?auto_336710 ?auto_336718 ) ) ( not ( = ?auto_336710 ?auto_336719 ) ) ( not ( = ?auto_336710 ?auto_336720 ) ) ( not ( = ?auto_336711 ?auto_336712 ) ) ( not ( = ?auto_336711 ?auto_336713 ) ) ( not ( = ?auto_336711 ?auto_336714 ) ) ( not ( = ?auto_336711 ?auto_336715 ) ) ( not ( = ?auto_336711 ?auto_336716 ) ) ( not ( = ?auto_336711 ?auto_336717 ) ) ( not ( = ?auto_336711 ?auto_336718 ) ) ( not ( = ?auto_336711 ?auto_336719 ) ) ( not ( = ?auto_336711 ?auto_336720 ) ) ( not ( = ?auto_336712 ?auto_336713 ) ) ( not ( = ?auto_336712 ?auto_336714 ) ) ( not ( = ?auto_336712 ?auto_336715 ) ) ( not ( = ?auto_336712 ?auto_336716 ) ) ( not ( = ?auto_336712 ?auto_336717 ) ) ( not ( = ?auto_336712 ?auto_336718 ) ) ( not ( = ?auto_336712 ?auto_336719 ) ) ( not ( = ?auto_336712 ?auto_336720 ) ) ( not ( = ?auto_336713 ?auto_336714 ) ) ( not ( = ?auto_336713 ?auto_336715 ) ) ( not ( = ?auto_336713 ?auto_336716 ) ) ( not ( = ?auto_336713 ?auto_336717 ) ) ( not ( = ?auto_336713 ?auto_336718 ) ) ( not ( = ?auto_336713 ?auto_336719 ) ) ( not ( = ?auto_336713 ?auto_336720 ) ) ( not ( = ?auto_336714 ?auto_336715 ) ) ( not ( = ?auto_336714 ?auto_336716 ) ) ( not ( = ?auto_336714 ?auto_336717 ) ) ( not ( = ?auto_336714 ?auto_336718 ) ) ( not ( = ?auto_336714 ?auto_336719 ) ) ( not ( = ?auto_336714 ?auto_336720 ) ) ( not ( = ?auto_336715 ?auto_336716 ) ) ( not ( = ?auto_336715 ?auto_336717 ) ) ( not ( = ?auto_336715 ?auto_336718 ) ) ( not ( = ?auto_336715 ?auto_336719 ) ) ( not ( = ?auto_336715 ?auto_336720 ) ) ( not ( = ?auto_336716 ?auto_336717 ) ) ( not ( = ?auto_336716 ?auto_336718 ) ) ( not ( = ?auto_336716 ?auto_336719 ) ) ( not ( = ?auto_336716 ?auto_336720 ) ) ( not ( = ?auto_336717 ?auto_336718 ) ) ( not ( = ?auto_336717 ?auto_336719 ) ) ( not ( = ?auto_336717 ?auto_336720 ) ) ( not ( = ?auto_336718 ?auto_336719 ) ) ( not ( = ?auto_336718 ?auto_336720 ) ) ( not ( = ?auto_336719 ?auto_336720 ) ) ( ON ?auto_336718 ?auto_336719 ) ( ON ?auto_336717 ?auto_336718 ) ( CLEAR ?auto_336715 ) ( ON ?auto_336716 ?auto_336717 ) ( CLEAR ?auto_336716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_336709 ?auto_336710 ?auto_336711 ?auto_336712 ?auto_336713 ?auto_336714 ?auto_336715 ?auto_336716 )
      ( MAKE-11PILE ?auto_336709 ?auto_336710 ?auto_336711 ?auto_336712 ?auto_336713 ?auto_336714 ?auto_336715 ?auto_336716 ?auto_336717 ?auto_336718 ?auto_336719 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336755 - BLOCK
      ?auto_336756 - BLOCK
      ?auto_336757 - BLOCK
      ?auto_336758 - BLOCK
      ?auto_336759 - BLOCK
      ?auto_336760 - BLOCK
      ?auto_336761 - BLOCK
      ?auto_336762 - BLOCK
      ?auto_336763 - BLOCK
      ?auto_336764 - BLOCK
      ?auto_336765 - BLOCK
    )
    :vars
    (
      ?auto_336766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336765 ?auto_336766 ) ( ON-TABLE ?auto_336755 ) ( ON ?auto_336756 ?auto_336755 ) ( ON ?auto_336757 ?auto_336756 ) ( ON ?auto_336758 ?auto_336757 ) ( ON ?auto_336759 ?auto_336758 ) ( ON ?auto_336760 ?auto_336759 ) ( not ( = ?auto_336755 ?auto_336756 ) ) ( not ( = ?auto_336755 ?auto_336757 ) ) ( not ( = ?auto_336755 ?auto_336758 ) ) ( not ( = ?auto_336755 ?auto_336759 ) ) ( not ( = ?auto_336755 ?auto_336760 ) ) ( not ( = ?auto_336755 ?auto_336761 ) ) ( not ( = ?auto_336755 ?auto_336762 ) ) ( not ( = ?auto_336755 ?auto_336763 ) ) ( not ( = ?auto_336755 ?auto_336764 ) ) ( not ( = ?auto_336755 ?auto_336765 ) ) ( not ( = ?auto_336755 ?auto_336766 ) ) ( not ( = ?auto_336756 ?auto_336757 ) ) ( not ( = ?auto_336756 ?auto_336758 ) ) ( not ( = ?auto_336756 ?auto_336759 ) ) ( not ( = ?auto_336756 ?auto_336760 ) ) ( not ( = ?auto_336756 ?auto_336761 ) ) ( not ( = ?auto_336756 ?auto_336762 ) ) ( not ( = ?auto_336756 ?auto_336763 ) ) ( not ( = ?auto_336756 ?auto_336764 ) ) ( not ( = ?auto_336756 ?auto_336765 ) ) ( not ( = ?auto_336756 ?auto_336766 ) ) ( not ( = ?auto_336757 ?auto_336758 ) ) ( not ( = ?auto_336757 ?auto_336759 ) ) ( not ( = ?auto_336757 ?auto_336760 ) ) ( not ( = ?auto_336757 ?auto_336761 ) ) ( not ( = ?auto_336757 ?auto_336762 ) ) ( not ( = ?auto_336757 ?auto_336763 ) ) ( not ( = ?auto_336757 ?auto_336764 ) ) ( not ( = ?auto_336757 ?auto_336765 ) ) ( not ( = ?auto_336757 ?auto_336766 ) ) ( not ( = ?auto_336758 ?auto_336759 ) ) ( not ( = ?auto_336758 ?auto_336760 ) ) ( not ( = ?auto_336758 ?auto_336761 ) ) ( not ( = ?auto_336758 ?auto_336762 ) ) ( not ( = ?auto_336758 ?auto_336763 ) ) ( not ( = ?auto_336758 ?auto_336764 ) ) ( not ( = ?auto_336758 ?auto_336765 ) ) ( not ( = ?auto_336758 ?auto_336766 ) ) ( not ( = ?auto_336759 ?auto_336760 ) ) ( not ( = ?auto_336759 ?auto_336761 ) ) ( not ( = ?auto_336759 ?auto_336762 ) ) ( not ( = ?auto_336759 ?auto_336763 ) ) ( not ( = ?auto_336759 ?auto_336764 ) ) ( not ( = ?auto_336759 ?auto_336765 ) ) ( not ( = ?auto_336759 ?auto_336766 ) ) ( not ( = ?auto_336760 ?auto_336761 ) ) ( not ( = ?auto_336760 ?auto_336762 ) ) ( not ( = ?auto_336760 ?auto_336763 ) ) ( not ( = ?auto_336760 ?auto_336764 ) ) ( not ( = ?auto_336760 ?auto_336765 ) ) ( not ( = ?auto_336760 ?auto_336766 ) ) ( not ( = ?auto_336761 ?auto_336762 ) ) ( not ( = ?auto_336761 ?auto_336763 ) ) ( not ( = ?auto_336761 ?auto_336764 ) ) ( not ( = ?auto_336761 ?auto_336765 ) ) ( not ( = ?auto_336761 ?auto_336766 ) ) ( not ( = ?auto_336762 ?auto_336763 ) ) ( not ( = ?auto_336762 ?auto_336764 ) ) ( not ( = ?auto_336762 ?auto_336765 ) ) ( not ( = ?auto_336762 ?auto_336766 ) ) ( not ( = ?auto_336763 ?auto_336764 ) ) ( not ( = ?auto_336763 ?auto_336765 ) ) ( not ( = ?auto_336763 ?auto_336766 ) ) ( not ( = ?auto_336764 ?auto_336765 ) ) ( not ( = ?auto_336764 ?auto_336766 ) ) ( not ( = ?auto_336765 ?auto_336766 ) ) ( ON ?auto_336764 ?auto_336765 ) ( ON ?auto_336763 ?auto_336764 ) ( ON ?auto_336762 ?auto_336763 ) ( CLEAR ?auto_336760 ) ( ON ?auto_336761 ?auto_336762 ) ( CLEAR ?auto_336761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_336755 ?auto_336756 ?auto_336757 ?auto_336758 ?auto_336759 ?auto_336760 ?auto_336761 )
      ( MAKE-11PILE ?auto_336755 ?auto_336756 ?auto_336757 ?auto_336758 ?auto_336759 ?auto_336760 ?auto_336761 ?auto_336762 ?auto_336763 ?auto_336764 ?auto_336765 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336801 - BLOCK
      ?auto_336802 - BLOCK
      ?auto_336803 - BLOCK
      ?auto_336804 - BLOCK
      ?auto_336805 - BLOCK
      ?auto_336806 - BLOCK
      ?auto_336807 - BLOCK
      ?auto_336808 - BLOCK
      ?auto_336809 - BLOCK
      ?auto_336810 - BLOCK
      ?auto_336811 - BLOCK
    )
    :vars
    (
      ?auto_336812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336811 ?auto_336812 ) ( ON-TABLE ?auto_336801 ) ( ON ?auto_336802 ?auto_336801 ) ( ON ?auto_336803 ?auto_336802 ) ( ON ?auto_336804 ?auto_336803 ) ( ON ?auto_336805 ?auto_336804 ) ( not ( = ?auto_336801 ?auto_336802 ) ) ( not ( = ?auto_336801 ?auto_336803 ) ) ( not ( = ?auto_336801 ?auto_336804 ) ) ( not ( = ?auto_336801 ?auto_336805 ) ) ( not ( = ?auto_336801 ?auto_336806 ) ) ( not ( = ?auto_336801 ?auto_336807 ) ) ( not ( = ?auto_336801 ?auto_336808 ) ) ( not ( = ?auto_336801 ?auto_336809 ) ) ( not ( = ?auto_336801 ?auto_336810 ) ) ( not ( = ?auto_336801 ?auto_336811 ) ) ( not ( = ?auto_336801 ?auto_336812 ) ) ( not ( = ?auto_336802 ?auto_336803 ) ) ( not ( = ?auto_336802 ?auto_336804 ) ) ( not ( = ?auto_336802 ?auto_336805 ) ) ( not ( = ?auto_336802 ?auto_336806 ) ) ( not ( = ?auto_336802 ?auto_336807 ) ) ( not ( = ?auto_336802 ?auto_336808 ) ) ( not ( = ?auto_336802 ?auto_336809 ) ) ( not ( = ?auto_336802 ?auto_336810 ) ) ( not ( = ?auto_336802 ?auto_336811 ) ) ( not ( = ?auto_336802 ?auto_336812 ) ) ( not ( = ?auto_336803 ?auto_336804 ) ) ( not ( = ?auto_336803 ?auto_336805 ) ) ( not ( = ?auto_336803 ?auto_336806 ) ) ( not ( = ?auto_336803 ?auto_336807 ) ) ( not ( = ?auto_336803 ?auto_336808 ) ) ( not ( = ?auto_336803 ?auto_336809 ) ) ( not ( = ?auto_336803 ?auto_336810 ) ) ( not ( = ?auto_336803 ?auto_336811 ) ) ( not ( = ?auto_336803 ?auto_336812 ) ) ( not ( = ?auto_336804 ?auto_336805 ) ) ( not ( = ?auto_336804 ?auto_336806 ) ) ( not ( = ?auto_336804 ?auto_336807 ) ) ( not ( = ?auto_336804 ?auto_336808 ) ) ( not ( = ?auto_336804 ?auto_336809 ) ) ( not ( = ?auto_336804 ?auto_336810 ) ) ( not ( = ?auto_336804 ?auto_336811 ) ) ( not ( = ?auto_336804 ?auto_336812 ) ) ( not ( = ?auto_336805 ?auto_336806 ) ) ( not ( = ?auto_336805 ?auto_336807 ) ) ( not ( = ?auto_336805 ?auto_336808 ) ) ( not ( = ?auto_336805 ?auto_336809 ) ) ( not ( = ?auto_336805 ?auto_336810 ) ) ( not ( = ?auto_336805 ?auto_336811 ) ) ( not ( = ?auto_336805 ?auto_336812 ) ) ( not ( = ?auto_336806 ?auto_336807 ) ) ( not ( = ?auto_336806 ?auto_336808 ) ) ( not ( = ?auto_336806 ?auto_336809 ) ) ( not ( = ?auto_336806 ?auto_336810 ) ) ( not ( = ?auto_336806 ?auto_336811 ) ) ( not ( = ?auto_336806 ?auto_336812 ) ) ( not ( = ?auto_336807 ?auto_336808 ) ) ( not ( = ?auto_336807 ?auto_336809 ) ) ( not ( = ?auto_336807 ?auto_336810 ) ) ( not ( = ?auto_336807 ?auto_336811 ) ) ( not ( = ?auto_336807 ?auto_336812 ) ) ( not ( = ?auto_336808 ?auto_336809 ) ) ( not ( = ?auto_336808 ?auto_336810 ) ) ( not ( = ?auto_336808 ?auto_336811 ) ) ( not ( = ?auto_336808 ?auto_336812 ) ) ( not ( = ?auto_336809 ?auto_336810 ) ) ( not ( = ?auto_336809 ?auto_336811 ) ) ( not ( = ?auto_336809 ?auto_336812 ) ) ( not ( = ?auto_336810 ?auto_336811 ) ) ( not ( = ?auto_336810 ?auto_336812 ) ) ( not ( = ?auto_336811 ?auto_336812 ) ) ( ON ?auto_336810 ?auto_336811 ) ( ON ?auto_336809 ?auto_336810 ) ( ON ?auto_336808 ?auto_336809 ) ( ON ?auto_336807 ?auto_336808 ) ( CLEAR ?auto_336805 ) ( ON ?auto_336806 ?auto_336807 ) ( CLEAR ?auto_336806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_336801 ?auto_336802 ?auto_336803 ?auto_336804 ?auto_336805 ?auto_336806 )
      ( MAKE-11PILE ?auto_336801 ?auto_336802 ?auto_336803 ?auto_336804 ?auto_336805 ?auto_336806 ?auto_336807 ?auto_336808 ?auto_336809 ?auto_336810 ?auto_336811 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336847 - BLOCK
      ?auto_336848 - BLOCK
      ?auto_336849 - BLOCK
      ?auto_336850 - BLOCK
      ?auto_336851 - BLOCK
      ?auto_336852 - BLOCK
      ?auto_336853 - BLOCK
      ?auto_336854 - BLOCK
      ?auto_336855 - BLOCK
      ?auto_336856 - BLOCK
      ?auto_336857 - BLOCK
    )
    :vars
    (
      ?auto_336858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336857 ?auto_336858 ) ( ON-TABLE ?auto_336847 ) ( ON ?auto_336848 ?auto_336847 ) ( ON ?auto_336849 ?auto_336848 ) ( ON ?auto_336850 ?auto_336849 ) ( not ( = ?auto_336847 ?auto_336848 ) ) ( not ( = ?auto_336847 ?auto_336849 ) ) ( not ( = ?auto_336847 ?auto_336850 ) ) ( not ( = ?auto_336847 ?auto_336851 ) ) ( not ( = ?auto_336847 ?auto_336852 ) ) ( not ( = ?auto_336847 ?auto_336853 ) ) ( not ( = ?auto_336847 ?auto_336854 ) ) ( not ( = ?auto_336847 ?auto_336855 ) ) ( not ( = ?auto_336847 ?auto_336856 ) ) ( not ( = ?auto_336847 ?auto_336857 ) ) ( not ( = ?auto_336847 ?auto_336858 ) ) ( not ( = ?auto_336848 ?auto_336849 ) ) ( not ( = ?auto_336848 ?auto_336850 ) ) ( not ( = ?auto_336848 ?auto_336851 ) ) ( not ( = ?auto_336848 ?auto_336852 ) ) ( not ( = ?auto_336848 ?auto_336853 ) ) ( not ( = ?auto_336848 ?auto_336854 ) ) ( not ( = ?auto_336848 ?auto_336855 ) ) ( not ( = ?auto_336848 ?auto_336856 ) ) ( not ( = ?auto_336848 ?auto_336857 ) ) ( not ( = ?auto_336848 ?auto_336858 ) ) ( not ( = ?auto_336849 ?auto_336850 ) ) ( not ( = ?auto_336849 ?auto_336851 ) ) ( not ( = ?auto_336849 ?auto_336852 ) ) ( not ( = ?auto_336849 ?auto_336853 ) ) ( not ( = ?auto_336849 ?auto_336854 ) ) ( not ( = ?auto_336849 ?auto_336855 ) ) ( not ( = ?auto_336849 ?auto_336856 ) ) ( not ( = ?auto_336849 ?auto_336857 ) ) ( not ( = ?auto_336849 ?auto_336858 ) ) ( not ( = ?auto_336850 ?auto_336851 ) ) ( not ( = ?auto_336850 ?auto_336852 ) ) ( not ( = ?auto_336850 ?auto_336853 ) ) ( not ( = ?auto_336850 ?auto_336854 ) ) ( not ( = ?auto_336850 ?auto_336855 ) ) ( not ( = ?auto_336850 ?auto_336856 ) ) ( not ( = ?auto_336850 ?auto_336857 ) ) ( not ( = ?auto_336850 ?auto_336858 ) ) ( not ( = ?auto_336851 ?auto_336852 ) ) ( not ( = ?auto_336851 ?auto_336853 ) ) ( not ( = ?auto_336851 ?auto_336854 ) ) ( not ( = ?auto_336851 ?auto_336855 ) ) ( not ( = ?auto_336851 ?auto_336856 ) ) ( not ( = ?auto_336851 ?auto_336857 ) ) ( not ( = ?auto_336851 ?auto_336858 ) ) ( not ( = ?auto_336852 ?auto_336853 ) ) ( not ( = ?auto_336852 ?auto_336854 ) ) ( not ( = ?auto_336852 ?auto_336855 ) ) ( not ( = ?auto_336852 ?auto_336856 ) ) ( not ( = ?auto_336852 ?auto_336857 ) ) ( not ( = ?auto_336852 ?auto_336858 ) ) ( not ( = ?auto_336853 ?auto_336854 ) ) ( not ( = ?auto_336853 ?auto_336855 ) ) ( not ( = ?auto_336853 ?auto_336856 ) ) ( not ( = ?auto_336853 ?auto_336857 ) ) ( not ( = ?auto_336853 ?auto_336858 ) ) ( not ( = ?auto_336854 ?auto_336855 ) ) ( not ( = ?auto_336854 ?auto_336856 ) ) ( not ( = ?auto_336854 ?auto_336857 ) ) ( not ( = ?auto_336854 ?auto_336858 ) ) ( not ( = ?auto_336855 ?auto_336856 ) ) ( not ( = ?auto_336855 ?auto_336857 ) ) ( not ( = ?auto_336855 ?auto_336858 ) ) ( not ( = ?auto_336856 ?auto_336857 ) ) ( not ( = ?auto_336856 ?auto_336858 ) ) ( not ( = ?auto_336857 ?auto_336858 ) ) ( ON ?auto_336856 ?auto_336857 ) ( ON ?auto_336855 ?auto_336856 ) ( ON ?auto_336854 ?auto_336855 ) ( ON ?auto_336853 ?auto_336854 ) ( ON ?auto_336852 ?auto_336853 ) ( CLEAR ?auto_336850 ) ( ON ?auto_336851 ?auto_336852 ) ( CLEAR ?auto_336851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_336847 ?auto_336848 ?auto_336849 ?auto_336850 ?auto_336851 )
      ( MAKE-11PILE ?auto_336847 ?auto_336848 ?auto_336849 ?auto_336850 ?auto_336851 ?auto_336852 ?auto_336853 ?auto_336854 ?auto_336855 ?auto_336856 ?auto_336857 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336893 - BLOCK
      ?auto_336894 - BLOCK
      ?auto_336895 - BLOCK
      ?auto_336896 - BLOCK
      ?auto_336897 - BLOCK
      ?auto_336898 - BLOCK
      ?auto_336899 - BLOCK
      ?auto_336900 - BLOCK
      ?auto_336901 - BLOCK
      ?auto_336902 - BLOCK
      ?auto_336903 - BLOCK
    )
    :vars
    (
      ?auto_336904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336903 ?auto_336904 ) ( ON-TABLE ?auto_336893 ) ( ON ?auto_336894 ?auto_336893 ) ( ON ?auto_336895 ?auto_336894 ) ( not ( = ?auto_336893 ?auto_336894 ) ) ( not ( = ?auto_336893 ?auto_336895 ) ) ( not ( = ?auto_336893 ?auto_336896 ) ) ( not ( = ?auto_336893 ?auto_336897 ) ) ( not ( = ?auto_336893 ?auto_336898 ) ) ( not ( = ?auto_336893 ?auto_336899 ) ) ( not ( = ?auto_336893 ?auto_336900 ) ) ( not ( = ?auto_336893 ?auto_336901 ) ) ( not ( = ?auto_336893 ?auto_336902 ) ) ( not ( = ?auto_336893 ?auto_336903 ) ) ( not ( = ?auto_336893 ?auto_336904 ) ) ( not ( = ?auto_336894 ?auto_336895 ) ) ( not ( = ?auto_336894 ?auto_336896 ) ) ( not ( = ?auto_336894 ?auto_336897 ) ) ( not ( = ?auto_336894 ?auto_336898 ) ) ( not ( = ?auto_336894 ?auto_336899 ) ) ( not ( = ?auto_336894 ?auto_336900 ) ) ( not ( = ?auto_336894 ?auto_336901 ) ) ( not ( = ?auto_336894 ?auto_336902 ) ) ( not ( = ?auto_336894 ?auto_336903 ) ) ( not ( = ?auto_336894 ?auto_336904 ) ) ( not ( = ?auto_336895 ?auto_336896 ) ) ( not ( = ?auto_336895 ?auto_336897 ) ) ( not ( = ?auto_336895 ?auto_336898 ) ) ( not ( = ?auto_336895 ?auto_336899 ) ) ( not ( = ?auto_336895 ?auto_336900 ) ) ( not ( = ?auto_336895 ?auto_336901 ) ) ( not ( = ?auto_336895 ?auto_336902 ) ) ( not ( = ?auto_336895 ?auto_336903 ) ) ( not ( = ?auto_336895 ?auto_336904 ) ) ( not ( = ?auto_336896 ?auto_336897 ) ) ( not ( = ?auto_336896 ?auto_336898 ) ) ( not ( = ?auto_336896 ?auto_336899 ) ) ( not ( = ?auto_336896 ?auto_336900 ) ) ( not ( = ?auto_336896 ?auto_336901 ) ) ( not ( = ?auto_336896 ?auto_336902 ) ) ( not ( = ?auto_336896 ?auto_336903 ) ) ( not ( = ?auto_336896 ?auto_336904 ) ) ( not ( = ?auto_336897 ?auto_336898 ) ) ( not ( = ?auto_336897 ?auto_336899 ) ) ( not ( = ?auto_336897 ?auto_336900 ) ) ( not ( = ?auto_336897 ?auto_336901 ) ) ( not ( = ?auto_336897 ?auto_336902 ) ) ( not ( = ?auto_336897 ?auto_336903 ) ) ( not ( = ?auto_336897 ?auto_336904 ) ) ( not ( = ?auto_336898 ?auto_336899 ) ) ( not ( = ?auto_336898 ?auto_336900 ) ) ( not ( = ?auto_336898 ?auto_336901 ) ) ( not ( = ?auto_336898 ?auto_336902 ) ) ( not ( = ?auto_336898 ?auto_336903 ) ) ( not ( = ?auto_336898 ?auto_336904 ) ) ( not ( = ?auto_336899 ?auto_336900 ) ) ( not ( = ?auto_336899 ?auto_336901 ) ) ( not ( = ?auto_336899 ?auto_336902 ) ) ( not ( = ?auto_336899 ?auto_336903 ) ) ( not ( = ?auto_336899 ?auto_336904 ) ) ( not ( = ?auto_336900 ?auto_336901 ) ) ( not ( = ?auto_336900 ?auto_336902 ) ) ( not ( = ?auto_336900 ?auto_336903 ) ) ( not ( = ?auto_336900 ?auto_336904 ) ) ( not ( = ?auto_336901 ?auto_336902 ) ) ( not ( = ?auto_336901 ?auto_336903 ) ) ( not ( = ?auto_336901 ?auto_336904 ) ) ( not ( = ?auto_336902 ?auto_336903 ) ) ( not ( = ?auto_336902 ?auto_336904 ) ) ( not ( = ?auto_336903 ?auto_336904 ) ) ( ON ?auto_336902 ?auto_336903 ) ( ON ?auto_336901 ?auto_336902 ) ( ON ?auto_336900 ?auto_336901 ) ( ON ?auto_336899 ?auto_336900 ) ( ON ?auto_336898 ?auto_336899 ) ( ON ?auto_336897 ?auto_336898 ) ( CLEAR ?auto_336895 ) ( ON ?auto_336896 ?auto_336897 ) ( CLEAR ?auto_336896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_336893 ?auto_336894 ?auto_336895 ?auto_336896 )
      ( MAKE-11PILE ?auto_336893 ?auto_336894 ?auto_336895 ?auto_336896 ?auto_336897 ?auto_336898 ?auto_336899 ?auto_336900 ?auto_336901 ?auto_336902 ?auto_336903 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336939 - BLOCK
      ?auto_336940 - BLOCK
      ?auto_336941 - BLOCK
      ?auto_336942 - BLOCK
      ?auto_336943 - BLOCK
      ?auto_336944 - BLOCK
      ?auto_336945 - BLOCK
      ?auto_336946 - BLOCK
      ?auto_336947 - BLOCK
      ?auto_336948 - BLOCK
      ?auto_336949 - BLOCK
    )
    :vars
    (
      ?auto_336950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336949 ?auto_336950 ) ( ON-TABLE ?auto_336939 ) ( ON ?auto_336940 ?auto_336939 ) ( not ( = ?auto_336939 ?auto_336940 ) ) ( not ( = ?auto_336939 ?auto_336941 ) ) ( not ( = ?auto_336939 ?auto_336942 ) ) ( not ( = ?auto_336939 ?auto_336943 ) ) ( not ( = ?auto_336939 ?auto_336944 ) ) ( not ( = ?auto_336939 ?auto_336945 ) ) ( not ( = ?auto_336939 ?auto_336946 ) ) ( not ( = ?auto_336939 ?auto_336947 ) ) ( not ( = ?auto_336939 ?auto_336948 ) ) ( not ( = ?auto_336939 ?auto_336949 ) ) ( not ( = ?auto_336939 ?auto_336950 ) ) ( not ( = ?auto_336940 ?auto_336941 ) ) ( not ( = ?auto_336940 ?auto_336942 ) ) ( not ( = ?auto_336940 ?auto_336943 ) ) ( not ( = ?auto_336940 ?auto_336944 ) ) ( not ( = ?auto_336940 ?auto_336945 ) ) ( not ( = ?auto_336940 ?auto_336946 ) ) ( not ( = ?auto_336940 ?auto_336947 ) ) ( not ( = ?auto_336940 ?auto_336948 ) ) ( not ( = ?auto_336940 ?auto_336949 ) ) ( not ( = ?auto_336940 ?auto_336950 ) ) ( not ( = ?auto_336941 ?auto_336942 ) ) ( not ( = ?auto_336941 ?auto_336943 ) ) ( not ( = ?auto_336941 ?auto_336944 ) ) ( not ( = ?auto_336941 ?auto_336945 ) ) ( not ( = ?auto_336941 ?auto_336946 ) ) ( not ( = ?auto_336941 ?auto_336947 ) ) ( not ( = ?auto_336941 ?auto_336948 ) ) ( not ( = ?auto_336941 ?auto_336949 ) ) ( not ( = ?auto_336941 ?auto_336950 ) ) ( not ( = ?auto_336942 ?auto_336943 ) ) ( not ( = ?auto_336942 ?auto_336944 ) ) ( not ( = ?auto_336942 ?auto_336945 ) ) ( not ( = ?auto_336942 ?auto_336946 ) ) ( not ( = ?auto_336942 ?auto_336947 ) ) ( not ( = ?auto_336942 ?auto_336948 ) ) ( not ( = ?auto_336942 ?auto_336949 ) ) ( not ( = ?auto_336942 ?auto_336950 ) ) ( not ( = ?auto_336943 ?auto_336944 ) ) ( not ( = ?auto_336943 ?auto_336945 ) ) ( not ( = ?auto_336943 ?auto_336946 ) ) ( not ( = ?auto_336943 ?auto_336947 ) ) ( not ( = ?auto_336943 ?auto_336948 ) ) ( not ( = ?auto_336943 ?auto_336949 ) ) ( not ( = ?auto_336943 ?auto_336950 ) ) ( not ( = ?auto_336944 ?auto_336945 ) ) ( not ( = ?auto_336944 ?auto_336946 ) ) ( not ( = ?auto_336944 ?auto_336947 ) ) ( not ( = ?auto_336944 ?auto_336948 ) ) ( not ( = ?auto_336944 ?auto_336949 ) ) ( not ( = ?auto_336944 ?auto_336950 ) ) ( not ( = ?auto_336945 ?auto_336946 ) ) ( not ( = ?auto_336945 ?auto_336947 ) ) ( not ( = ?auto_336945 ?auto_336948 ) ) ( not ( = ?auto_336945 ?auto_336949 ) ) ( not ( = ?auto_336945 ?auto_336950 ) ) ( not ( = ?auto_336946 ?auto_336947 ) ) ( not ( = ?auto_336946 ?auto_336948 ) ) ( not ( = ?auto_336946 ?auto_336949 ) ) ( not ( = ?auto_336946 ?auto_336950 ) ) ( not ( = ?auto_336947 ?auto_336948 ) ) ( not ( = ?auto_336947 ?auto_336949 ) ) ( not ( = ?auto_336947 ?auto_336950 ) ) ( not ( = ?auto_336948 ?auto_336949 ) ) ( not ( = ?auto_336948 ?auto_336950 ) ) ( not ( = ?auto_336949 ?auto_336950 ) ) ( ON ?auto_336948 ?auto_336949 ) ( ON ?auto_336947 ?auto_336948 ) ( ON ?auto_336946 ?auto_336947 ) ( ON ?auto_336945 ?auto_336946 ) ( ON ?auto_336944 ?auto_336945 ) ( ON ?auto_336943 ?auto_336944 ) ( ON ?auto_336942 ?auto_336943 ) ( CLEAR ?auto_336940 ) ( ON ?auto_336941 ?auto_336942 ) ( CLEAR ?auto_336941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_336939 ?auto_336940 ?auto_336941 )
      ( MAKE-11PILE ?auto_336939 ?auto_336940 ?auto_336941 ?auto_336942 ?auto_336943 ?auto_336944 ?auto_336945 ?auto_336946 ?auto_336947 ?auto_336948 ?auto_336949 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336985 - BLOCK
      ?auto_336986 - BLOCK
      ?auto_336987 - BLOCK
      ?auto_336988 - BLOCK
      ?auto_336989 - BLOCK
      ?auto_336990 - BLOCK
      ?auto_336991 - BLOCK
      ?auto_336992 - BLOCK
      ?auto_336993 - BLOCK
      ?auto_336994 - BLOCK
      ?auto_336995 - BLOCK
    )
    :vars
    (
      ?auto_336996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336995 ?auto_336996 ) ( ON-TABLE ?auto_336985 ) ( not ( = ?auto_336985 ?auto_336986 ) ) ( not ( = ?auto_336985 ?auto_336987 ) ) ( not ( = ?auto_336985 ?auto_336988 ) ) ( not ( = ?auto_336985 ?auto_336989 ) ) ( not ( = ?auto_336985 ?auto_336990 ) ) ( not ( = ?auto_336985 ?auto_336991 ) ) ( not ( = ?auto_336985 ?auto_336992 ) ) ( not ( = ?auto_336985 ?auto_336993 ) ) ( not ( = ?auto_336985 ?auto_336994 ) ) ( not ( = ?auto_336985 ?auto_336995 ) ) ( not ( = ?auto_336985 ?auto_336996 ) ) ( not ( = ?auto_336986 ?auto_336987 ) ) ( not ( = ?auto_336986 ?auto_336988 ) ) ( not ( = ?auto_336986 ?auto_336989 ) ) ( not ( = ?auto_336986 ?auto_336990 ) ) ( not ( = ?auto_336986 ?auto_336991 ) ) ( not ( = ?auto_336986 ?auto_336992 ) ) ( not ( = ?auto_336986 ?auto_336993 ) ) ( not ( = ?auto_336986 ?auto_336994 ) ) ( not ( = ?auto_336986 ?auto_336995 ) ) ( not ( = ?auto_336986 ?auto_336996 ) ) ( not ( = ?auto_336987 ?auto_336988 ) ) ( not ( = ?auto_336987 ?auto_336989 ) ) ( not ( = ?auto_336987 ?auto_336990 ) ) ( not ( = ?auto_336987 ?auto_336991 ) ) ( not ( = ?auto_336987 ?auto_336992 ) ) ( not ( = ?auto_336987 ?auto_336993 ) ) ( not ( = ?auto_336987 ?auto_336994 ) ) ( not ( = ?auto_336987 ?auto_336995 ) ) ( not ( = ?auto_336987 ?auto_336996 ) ) ( not ( = ?auto_336988 ?auto_336989 ) ) ( not ( = ?auto_336988 ?auto_336990 ) ) ( not ( = ?auto_336988 ?auto_336991 ) ) ( not ( = ?auto_336988 ?auto_336992 ) ) ( not ( = ?auto_336988 ?auto_336993 ) ) ( not ( = ?auto_336988 ?auto_336994 ) ) ( not ( = ?auto_336988 ?auto_336995 ) ) ( not ( = ?auto_336988 ?auto_336996 ) ) ( not ( = ?auto_336989 ?auto_336990 ) ) ( not ( = ?auto_336989 ?auto_336991 ) ) ( not ( = ?auto_336989 ?auto_336992 ) ) ( not ( = ?auto_336989 ?auto_336993 ) ) ( not ( = ?auto_336989 ?auto_336994 ) ) ( not ( = ?auto_336989 ?auto_336995 ) ) ( not ( = ?auto_336989 ?auto_336996 ) ) ( not ( = ?auto_336990 ?auto_336991 ) ) ( not ( = ?auto_336990 ?auto_336992 ) ) ( not ( = ?auto_336990 ?auto_336993 ) ) ( not ( = ?auto_336990 ?auto_336994 ) ) ( not ( = ?auto_336990 ?auto_336995 ) ) ( not ( = ?auto_336990 ?auto_336996 ) ) ( not ( = ?auto_336991 ?auto_336992 ) ) ( not ( = ?auto_336991 ?auto_336993 ) ) ( not ( = ?auto_336991 ?auto_336994 ) ) ( not ( = ?auto_336991 ?auto_336995 ) ) ( not ( = ?auto_336991 ?auto_336996 ) ) ( not ( = ?auto_336992 ?auto_336993 ) ) ( not ( = ?auto_336992 ?auto_336994 ) ) ( not ( = ?auto_336992 ?auto_336995 ) ) ( not ( = ?auto_336992 ?auto_336996 ) ) ( not ( = ?auto_336993 ?auto_336994 ) ) ( not ( = ?auto_336993 ?auto_336995 ) ) ( not ( = ?auto_336993 ?auto_336996 ) ) ( not ( = ?auto_336994 ?auto_336995 ) ) ( not ( = ?auto_336994 ?auto_336996 ) ) ( not ( = ?auto_336995 ?auto_336996 ) ) ( ON ?auto_336994 ?auto_336995 ) ( ON ?auto_336993 ?auto_336994 ) ( ON ?auto_336992 ?auto_336993 ) ( ON ?auto_336991 ?auto_336992 ) ( ON ?auto_336990 ?auto_336991 ) ( ON ?auto_336989 ?auto_336990 ) ( ON ?auto_336988 ?auto_336989 ) ( ON ?auto_336987 ?auto_336988 ) ( CLEAR ?auto_336985 ) ( ON ?auto_336986 ?auto_336987 ) ( CLEAR ?auto_336986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_336985 ?auto_336986 )
      ( MAKE-11PILE ?auto_336985 ?auto_336986 ?auto_336987 ?auto_336988 ?auto_336989 ?auto_336990 ?auto_336991 ?auto_336992 ?auto_336993 ?auto_336994 ?auto_336995 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_337031 - BLOCK
      ?auto_337032 - BLOCK
      ?auto_337033 - BLOCK
      ?auto_337034 - BLOCK
      ?auto_337035 - BLOCK
      ?auto_337036 - BLOCK
      ?auto_337037 - BLOCK
      ?auto_337038 - BLOCK
      ?auto_337039 - BLOCK
      ?auto_337040 - BLOCK
      ?auto_337041 - BLOCK
    )
    :vars
    (
      ?auto_337042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337041 ?auto_337042 ) ( not ( = ?auto_337031 ?auto_337032 ) ) ( not ( = ?auto_337031 ?auto_337033 ) ) ( not ( = ?auto_337031 ?auto_337034 ) ) ( not ( = ?auto_337031 ?auto_337035 ) ) ( not ( = ?auto_337031 ?auto_337036 ) ) ( not ( = ?auto_337031 ?auto_337037 ) ) ( not ( = ?auto_337031 ?auto_337038 ) ) ( not ( = ?auto_337031 ?auto_337039 ) ) ( not ( = ?auto_337031 ?auto_337040 ) ) ( not ( = ?auto_337031 ?auto_337041 ) ) ( not ( = ?auto_337031 ?auto_337042 ) ) ( not ( = ?auto_337032 ?auto_337033 ) ) ( not ( = ?auto_337032 ?auto_337034 ) ) ( not ( = ?auto_337032 ?auto_337035 ) ) ( not ( = ?auto_337032 ?auto_337036 ) ) ( not ( = ?auto_337032 ?auto_337037 ) ) ( not ( = ?auto_337032 ?auto_337038 ) ) ( not ( = ?auto_337032 ?auto_337039 ) ) ( not ( = ?auto_337032 ?auto_337040 ) ) ( not ( = ?auto_337032 ?auto_337041 ) ) ( not ( = ?auto_337032 ?auto_337042 ) ) ( not ( = ?auto_337033 ?auto_337034 ) ) ( not ( = ?auto_337033 ?auto_337035 ) ) ( not ( = ?auto_337033 ?auto_337036 ) ) ( not ( = ?auto_337033 ?auto_337037 ) ) ( not ( = ?auto_337033 ?auto_337038 ) ) ( not ( = ?auto_337033 ?auto_337039 ) ) ( not ( = ?auto_337033 ?auto_337040 ) ) ( not ( = ?auto_337033 ?auto_337041 ) ) ( not ( = ?auto_337033 ?auto_337042 ) ) ( not ( = ?auto_337034 ?auto_337035 ) ) ( not ( = ?auto_337034 ?auto_337036 ) ) ( not ( = ?auto_337034 ?auto_337037 ) ) ( not ( = ?auto_337034 ?auto_337038 ) ) ( not ( = ?auto_337034 ?auto_337039 ) ) ( not ( = ?auto_337034 ?auto_337040 ) ) ( not ( = ?auto_337034 ?auto_337041 ) ) ( not ( = ?auto_337034 ?auto_337042 ) ) ( not ( = ?auto_337035 ?auto_337036 ) ) ( not ( = ?auto_337035 ?auto_337037 ) ) ( not ( = ?auto_337035 ?auto_337038 ) ) ( not ( = ?auto_337035 ?auto_337039 ) ) ( not ( = ?auto_337035 ?auto_337040 ) ) ( not ( = ?auto_337035 ?auto_337041 ) ) ( not ( = ?auto_337035 ?auto_337042 ) ) ( not ( = ?auto_337036 ?auto_337037 ) ) ( not ( = ?auto_337036 ?auto_337038 ) ) ( not ( = ?auto_337036 ?auto_337039 ) ) ( not ( = ?auto_337036 ?auto_337040 ) ) ( not ( = ?auto_337036 ?auto_337041 ) ) ( not ( = ?auto_337036 ?auto_337042 ) ) ( not ( = ?auto_337037 ?auto_337038 ) ) ( not ( = ?auto_337037 ?auto_337039 ) ) ( not ( = ?auto_337037 ?auto_337040 ) ) ( not ( = ?auto_337037 ?auto_337041 ) ) ( not ( = ?auto_337037 ?auto_337042 ) ) ( not ( = ?auto_337038 ?auto_337039 ) ) ( not ( = ?auto_337038 ?auto_337040 ) ) ( not ( = ?auto_337038 ?auto_337041 ) ) ( not ( = ?auto_337038 ?auto_337042 ) ) ( not ( = ?auto_337039 ?auto_337040 ) ) ( not ( = ?auto_337039 ?auto_337041 ) ) ( not ( = ?auto_337039 ?auto_337042 ) ) ( not ( = ?auto_337040 ?auto_337041 ) ) ( not ( = ?auto_337040 ?auto_337042 ) ) ( not ( = ?auto_337041 ?auto_337042 ) ) ( ON ?auto_337040 ?auto_337041 ) ( ON ?auto_337039 ?auto_337040 ) ( ON ?auto_337038 ?auto_337039 ) ( ON ?auto_337037 ?auto_337038 ) ( ON ?auto_337036 ?auto_337037 ) ( ON ?auto_337035 ?auto_337036 ) ( ON ?auto_337034 ?auto_337035 ) ( ON ?auto_337033 ?auto_337034 ) ( ON ?auto_337032 ?auto_337033 ) ( ON ?auto_337031 ?auto_337032 ) ( CLEAR ?auto_337031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_337031 )
      ( MAKE-11PILE ?auto_337031 ?auto_337032 ?auto_337033 ?auto_337034 ?auto_337035 ?auto_337036 ?auto_337037 ?auto_337038 ?auto_337039 ?auto_337040 ?auto_337041 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337078 - BLOCK
      ?auto_337079 - BLOCK
      ?auto_337080 - BLOCK
      ?auto_337081 - BLOCK
      ?auto_337082 - BLOCK
      ?auto_337083 - BLOCK
      ?auto_337084 - BLOCK
      ?auto_337085 - BLOCK
      ?auto_337086 - BLOCK
      ?auto_337087 - BLOCK
      ?auto_337088 - BLOCK
      ?auto_337089 - BLOCK
    )
    :vars
    (
      ?auto_337090 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_337088 ) ( ON ?auto_337089 ?auto_337090 ) ( CLEAR ?auto_337089 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_337078 ) ( ON ?auto_337079 ?auto_337078 ) ( ON ?auto_337080 ?auto_337079 ) ( ON ?auto_337081 ?auto_337080 ) ( ON ?auto_337082 ?auto_337081 ) ( ON ?auto_337083 ?auto_337082 ) ( ON ?auto_337084 ?auto_337083 ) ( ON ?auto_337085 ?auto_337084 ) ( ON ?auto_337086 ?auto_337085 ) ( ON ?auto_337087 ?auto_337086 ) ( ON ?auto_337088 ?auto_337087 ) ( not ( = ?auto_337078 ?auto_337079 ) ) ( not ( = ?auto_337078 ?auto_337080 ) ) ( not ( = ?auto_337078 ?auto_337081 ) ) ( not ( = ?auto_337078 ?auto_337082 ) ) ( not ( = ?auto_337078 ?auto_337083 ) ) ( not ( = ?auto_337078 ?auto_337084 ) ) ( not ( = ?auto_337078 ?auto_337085 ) ) ( not ( = ?auto_337078 ?auto_337086 ) ) ( not ( = ?auto_337078 ?auto_337087 ) ) ( not ( = ?auto_337078 ?auto_337088 ) ) ( not ( = ?auto_337078 ?auto_337089 ) ) ( not ( = ?auto_337078 ?auto_337090 ) ) ( not ( = ?auto_337079 ?auto_337080 ) ) ( not ( = ?auto_337079 ?auto_337081 ) ) ( not ( = ?auto_337079 ?auto_337082 ) ) ( not ( = ?auto_337079 ?auto_337083 ) ) ( not ( = ?auto_337079 ?auto_337084 ) ) ( not ( = ?auto_337079 ?auto_337085 ) ) ( not ( = ?auto_337079 ?auto_337086 ) ) ( not ( = ?auto_337079 ?auto_337087 ) ) ( not ( = ?auto_337079 ?auto_337088 ) ) ( not ( = ?auto_337079 ?auto_337089 ) ) ( not ( = ?auto_337079 ?auto_337090 ) ) ( not ( = ?auto_337080 ?auto_337081 ) ) ( not ( = ?auto_337080 ?auto_337082 ) ) ( not ( = ?auto_337080 ?auto_337083 ) ) ( not ( = ?auto_337080 ?auto_337084 ) ) ( not ( = ?auto_337080 ?auto_337085 ) ) ( not ( = ?auto_337080 ?auto_337086 ) ) ( not ( = ?auto_337080 ?auto_337087 ) ) ( not ( = ?auto_337080 ?auto_337088 ) ) ( not ( = ?auto_337080 ?auto_337089 ) ) ( not ( = ?auto_337080 ?auto_337090 ) ) ( not ( = ?auto_337081 ?auto_337082 ) ) ( not ( = ?auto_337081 ?auto_337083 ) ) ( not ( = ?auto_337081 ?auto_337084 ) ) ( not ( = ?auto_337081 ?auto_337085 ) ) ( not ( = ?auto_337081 ?auto_337086 ) ) ( not ( = ?auto_337081 ?auto_337087 ) ) ( not ( = ?auto_337081 ?auto_337088 ) ) ( not ( = ?auto_337081 ?auto_337089 ) ) ( not ( = ?auto_337081 ?auto_337090 ) ) ( not ( = ?auto_337082 ?auto_337083 ) ) ( not ( = ?auto_337082 ?auto_337084 ) ) ( not ( = ?auto_337082 ?auto_337085 ) ) ( not ( = ?auto_337082 ?auto_337086 ) ) ( not ( = ?auto_337082 ?auto_337087 ) ) ( not ( = ?auto_337082 ?auto_337088 ) ) ( not ( = ?auto_337082 ?auto_337089 ) ) ( not ( = ?auto_337082 ?auto_337090 ) ) ( not ( = ?auto_337083 ?auto_337084 ) ) ( not ( = ?auto_337083 ?auto_337085 ) ) ( not ( = ?auto_337083 ?auto_337086 ) ) ( not ( = ?auto_337083 ?auto_337087 ) ) ( not ( = ?auto_337083 ?auto_337088 ) ) ( not ( = ?auto_337083 ?auto_337089 ) ) ( not ( = ?auto_337083 ?auto_337090 ) ) ( not ( = ?auto_337084 ?auto_337085 ) ) ( not ( = ?auto_337084 ?auto_337086 ) ) ( not ( = ?auto_337084 ?auto_337087 ) ) ( not ( = ?auto_337084 ?auto_337088 ) ) ( not ( = ?auto_337084 ?auto_337089 ) ) ( not ( = ?auto_337084 ?auto_337090 ) ) ( not ( = ?auto_337085 ?auto_337086 ) ) ( not ( = ?auto_337085 ?auto_337087 ) ) ( not ( = ?auto_337085 ?auto_337088 ) ) ( not ( = ?auto_337085 ?auto_337089 ) ) ( not ( = ?auto_337085 ?auto_337090 ) ) ( not ( = ?auto_337086 ?auto_337087 ) ) ( not ( = ?auto_337086 ?auto_337088 ) ) ( not ( = ?auto_337086 ?auto_337089 ) ) ( not ( = ?auto_337086 ?auto_337090 ) ) ( not ( = ?auto_337087 ?auto_337088 ) ) ( not ( = ?auto_337087 ?auto_337089 ) ) ( not ( = ?auto_337087 ?auto_337090 ) ) ( not ( = ?auto_337088 ?auto_337089 ) ) ( not ( = ?auto_337088 ?auto_337090 ) ) ( not ( = ?auto_337089 ?auto_337090 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_337089 ?auto_337090 )
      ( !STACK ?auto_337089 ?auto_337088 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337128 - BLOCK
      ?auto_337129 - BLOCK
      ?auto_337130 - BLOCK
      ?auto_337131 - BLOCK
      ?auto_337132 - BLOCK
      ?auto_337133 - BLOCK
      ?auto_337134 - BLOCK
      ?auto_337135 - BLOCK
      ?auto_337136 - BLOCK
      ?auto_337137 - BLOCK
      ?auto_337138 - BLOCK
      ?auto_337139 - BLOCK
    )
    :vars
    (
      ?auto_337140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337139 ?auto_337140 ) ( ON-TABLE ?auto_337128 ) ( ON ?auto_337129 ?auto_337128 ) ( ON ?auto_337130 ?auto_337129 ) ( ON ?auto_337131 ?auto_337130 ) ( ON ?auto_337132 ?auto_337131 ) ( ON ?auto_337133 ?auto_337132 ) ( ON ?auto_337134 ?auto_337133 ) ( ON ?auto_337135 ?auto_337134 ) ( ON ?auto_337136 ?auto_337135 ) ( ON ?auto_337137 ?auto_337136 ) ( not ( = ?auto_337128 ?auto_337129 ) ) ( not ( = ?auto_337128 ?auto_337130 ) ) ( not ( = ?auto_337128 ?auto_337131 ) ) ( not ( = ?auto_337128 ?auto_337132 ) ) ( not ( = ?auto_337128 ?auto_337133 ) ) ( not ( = ?auto_337128 ?auto_337134 ) ) ( not ( = ?auto_337128 ?auto_337135 ) ) ( not ( = ?auto_337128 ?auto_337136 ) ) ( not ( = ?auto_337128 ?auto_337137 ) ) ( not ( = ?auto_337128 ?auto_337138 ) ) ( not ( = ?auto_337128 ?auto_337139 ) ) ( not ( = ?auto_337128 ?auto_337140 ) ) ( not ( = ?auto_337129 ?auto_337130 ) ) ( not ( = ?auto_337129 ?auto_337131 ) ) ( not ( = ?auto_337129 ?auto_337132 ) ) ( not ( = ?auto_337129 ?auto_337133 ) ) ( not ( = ?auto_337129 ?auto_337134 ) ) ( not ( = ?auto_337129 ?auto_337135 ) ) ( not ( = ?auto_337129 ?auto_337136 ) ) ( not ( = ?auto_337129 ?auto_337137 ) ) ( not ( = ?auto_337129 ?auto_337138 ) ) ( not ( = ?auto_337129 ?auto_337139 ) ) ( not ( = ?auto_337129 ?auto_337140 ) ) ( not ( = ?auto_337130 ?auto_337131 ) ) ( not ( = ?auto_337130 ?auto_337132 ) ) ( not ( = ?auto_337130 ?auto_337133 ) ) ( not ( = ?auto_337130 ?auto_337134 ) ) ( not ( = ?auto_337130 ?auto_337135 ) ) ( not ( = ?auto_337130 ?auto_337136 ) ) ( not ( = ?auto_337130 ?auto_337137 ) ) ( not ( = ?auto_337130 ?auto_337138 ) ) ( not ( = ?auto_337130 ?auto_337139 ) ) ( not ( = ?auto_337130 ?auto_337140 ) ) ( not ( = ?auto_337131 ?auto_337132 ) ) ( not ( = ?auto_337131 ?auto_337133 ) ) ( not ( = ?auto_337131 ?auto_337134 ) ) ( not ( = ?auto_337131 ?auto_337135 ) ) ( not ( = ?auto_337131 ?auto_337136 ) ) ( not ( = ?auto_337131 ?auto_337137 ) ) ( not ( = ?auto_337131 ?auto_337138 ) ) ( not ( = ?auto_337131 ?auto_337139 ) ) ( not ( = ?auto_337131 ?auto_337140 ) ) ( not ( = ?auto_337132 ?auto_337133 ) ) ( not ( = ?auto_337132 ?auto_337134 ) ) ( not ( = ?auto_337132 ?auto_337135 ) ) ( not ( = ?auto_337132 ?auto_337136 ) ) ( not ( = ?auto_337132 ?auto_337137 ) ) ( not ( = ?auto_337132 ?auto_337138 ) ) ( not ( = ?auto_337132 ?auto_337139 ) ) ( not ( = ?auto_337132 ?auto_337140 ) ) ( not ( = ?auto_337133 ?auto_337134 ) ) ( not ( = ?auto_337133 ?auto_337135 ) ) ( not ( = ?auto_337133 ?auto_337136 ) ) ( not ( = ?auto_337133 ?auto_337137 ) ) ( not ( = ?auto_337133 ?auto_337138 ) ) ( not ( = ?auto_337133 ?auto_337139 ) ) ( not ( = ?auto_337133 ?auto_337140 ) ) ( not ( = ?auto_337134 ?auto_337135 ) ) ( not ( = ?auto_337134 ?auto_337136 ) ) ( not ( = ?auto_337134 ?auto_337137 ) ) ( not ( = ?auto_337134 ?auto_337138 ) ) ( not ( = ?auto_337134 ?auto_337139 ) ) ( not ( = ?auto_337134 ?auto_337140 ) ) ( not ( = ?auto_337135 ?auto_337136 ) ) ( not ( = ?auto_337135 ?auto_337137 ) ) ( not ( = ?auto_337135 ?auto_337138 ) ) ( not ( = ?auto_337135 ?auto_337139 ) ) ( not ( = ?auto_337135 ?auto_337140 ) ) ( not ( = ?auto_337136 ?auto_337137 ) ) ( not ( = ?auto_337136 ?auto_337138 ) ) ( not ( = ?auto_337136 ?auto_337139 ) ) ( not ( = ?auto_337136 ?auto_337140 ) ) ( not ( = ?auto_337137 ?auto_337138 ) ) ( not ( = ?auto_337137 ?auto_337139 ) ) ( not ( = ?auto_337137 ?auto_337140 ) ) ( not ( = ?auto_337138 ?auto_337139 ) ) ( not ( = ?auto_337138 ?auto_337140 ) ) ( not ( = ?auto_337139 ?auto_337140 ) ) ( CLEAR ?auto_337137 ) ( ON ?auto_337138 ?auto_337139 ) ( CLEAR ?auto_337138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_337128 ?auto_337129 ?auto_337130 ?auto_337131 ?auto_337132 ?auto_337133 ?auto_337134 ?auto_337135 ?auto_337136 ?auto_337137 ?auto_337138 )
      ( MAKE-12PILE ?auto_337128 ?auto_337129 ?auto_337130 ?auto_337131 ?auto_337132 ?auto_337133 ?auto_337134 ?auto_337135 ?auto_337136 ?auto_337137 ?auto_337138 ?auto_337139 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337178 - BLOCK
      ?auto_337179 - BLOCK
      ?auto_337180 - BLOCK
      ?auto_337181 - BLOCK
      ?auto_337182 - BLOCK
      ?auto_337183 - BLOCK
      ?auto_337184 - BLOCK
      ?auto_337185 - BLOCK
      ?auto_337186 - BLOCK
      ?auto_337187 - BLOCK
      ?auto_337188 - BLOCK
      ?auto_337189 - BLOCK
    )
    :vars
    (
      ?auto_337190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337189 ?auto_337190 ) ( ON-TABLE ?auto_337178 ) ( ON ?auto_337179 ?auto_337178 ) ( ON ?auto_337180 ?auto_337179 ) ( ON ?auto_337181 ?auto_337180 ) ( ON ?auto_337182 ?auto_337181 ) ( ON ?auto_337183 ?auto_337182 ) ( ON ?auto_337184 ?auto_337183 ) ( ON ?auto_337185 ?auto_337184 ) ( ON ?auto_337186 ?auto_337185 ) ( not ( = ?auto_337178 ?auto_337179 ) ) ( not ( = ?auto_337178 ?auto_337180 ) ) ( not ( = ?auto_337178 ?auto_337181 ) ) ( not ( = ?auto_337178 ?auto_337182 ) ) ( not ( = ?auto_337178 ?auto_337183 ) ) ( not ( = ?auto_337178 ?auto_337184 ) ) ( not ( = ?auto_337178 ?auto_337185 ) ) ( not ( = ?auto_337178 ?auto_337186 ) ) ( not ( = ?auto_337178 ?auto_337187 ) ) ( not ( = ?auto_337178 ?auto_337188 ) ) ( not ( = ?auto_337178 ?auto_337189 ) ) ( not ( = ?auto_337178 ?auto_337190 ) ) ( not ( = ?auto_337179 ?auto_337180 ) ) ( not ( = ?auto_337179 ?auto_337181 ) ) ( not ( = ?auto_337179 ?auto_337182 ) ) ( not ( = ?auto_337179 ?auto_337183 ) ) ( not ( = ?auto_337179 ?auto_337184 ) ) ( not ( = ?auto_337179 ?auto_337185 ) ) ( not ( = ?auto_337179 ?auto_337186 ) ) ( not ( = ?auto_337179 ?auto_337187 ) ) ( not ( = ?auto_337179 ?auto_337188 ) ) ( not ( = ?auto_337179 ?auto_337189 ) ) ( not ( = ?auto_337179 ?auto_337190 ) ) ( not ( = ?auto_337180 ?auto_337181 ) ) ( not ( = ?auto_337180 ?auto_337182 ) ) ( not ( = ?auto_337180 ?auto_337183 ) ) ( not ( = ?auto_337180 ?auto_337184 ) ) ( not ( = ?auto_337180 ?auto_337185 ) ) ( not ( = ?auto_337180 ?auto_337186 ) ) ( not ( = ?auto_337180 ?auto_337187 ) ) ( not ( = ?auto_337180 ?auto_337188 ) ) ( not ( = ?auto_337180 ?auto_337189 ) ) ( not ( = ?auto_337180 ?auto_337190 ) ) ( not ( = ?auto_337181 ?auto_337182 ) ) ( not ( = ?auto_337181 ?auto_337183 ) ) ( not ( = ?auto_337181 ?auto_337184 ) ) ( not ( = ?auto_337181 ?auto_337185 ) ) ( not ( = ?auto_337181 ?auto_337186 ) ) ( not ( = ?auto_337181 ?auto_337187 ) ) ( not ( = ?auto_337181 ?auto_337188 ) ) ( not ( = ?auto_337181 ?auto_337189 ) ) ( not ( = ?auto_337181 ?auto_337190 ) ) ( not ( = ?auto_337182 ?auto_337183 ) ) ( not ( = ?auto_337182 ?auto_337184 ) ) ( not ( = ?auto_337182 ?auto_337185 ) ) ( not ( = ?auto_337182 ?auto_337186 ) ) ( not ( = ?auto_337182 ?auto_337187 ) ) ( not ( = ?auto_337182 ?auto_337188 ) ) ( not ( = ?auto_337182 ?auto_337189 ) ) ( not ( = ?auto_337182 ?auto_337190 ) ) ( not ( = ?auto_337183 ?auto_337184 ) ) ( not ( = ?auto_337183 ?auto_337185 ) ) ( not ( = ?auto_337183 ?auto_337186 ) ) ( not ( = ?auto_337183 ?auto_337187 ) ) ( not ( = ?auto_337183 ?auto_337188 ) ) ( not ( = ?auto_337183 ?auto_337189 ) ) ( not ( = ?auto_337183 ?auto_337190 ) ) ( not ( = ?auto_337184 ?auto_337185 ) ) ( not ( = ?auto_337184 ?auto_337186 ) ) ( not ( = ?auto_337184 ?auto_337187 ) ) ( not ( = ?auto_337184 ?auto_337188 ) ) ( not ( = ?auto_337184 ?auto_337189 ) ) ( not ( = ?auto_337184 ?auto_337190 ) ) ( not ( = ?auto_337185 ?auto_337186 ) ) ( not ( = ?auto_337185 ?auto_337187 ) ) ( not ( = ?auto_337185 ?auto_337188 ) ) ( not ( = ?auto_337185 ?auto_337189 ) ) ( not ( = ?auto_337185 ?auto_337190 ) ) ( not ( = ?auto_337186 ?auto_337187 ) ) ( not ( = ?auto_337186 ?auto_337188 ) ) ( not ( = ?auto_337186 ?auto_337189 ) ) ( not ( = ?auto_337186 ?auto_337190 ) ) ( not ( = ?auto_337187 ?auto_337188 ) ) ( not ( = ?auto_337187 ?auto_337189 ) ) ( not ( = ?auto_337187 ?auto_337190 ) ) ( not ( = ?auto_337188 ?auto_337189 ) ) ( not ( = ?auto_337188 ?auto_337190 ) ) ( not ( = ?auto_337189 ?auto_337190 ) ) ( ON ?auto_337188 ?auto_337189 ) ( CLEAR ?auto_337186 ) ( ON ?auto_337187 ?auto_337188 ) ( CLEAR ?auto_337187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_337178 ?auto_337179 ?auto_337180 ?auto_337181 ?auto_337182 ?auto_337183 ?auto_337184 ?auto_337185 ?auto_337186 ?auto_337187 )
      ( MAKE-12PILE ?auto_337178 ?auto_337179 ?auto_337180 ?auto_337181 ?auto_337182 ?auto_337183 ?auto_337184 ?auto_337185 ?auto_337186 ?auto_337187 ?auto_337188 ?auto_337189 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337228 - BLOCK
      ?auto_337229 - BLOCK
      ?auto_337230 - BLOCK
      ?auto_337231 - BLOCK
      ?auto_337232 - BLOCK
      ?auto_337233 - BLOCK
      ?auto_337234 - BLOCK
      ?auto_337235 - BLOCK
      ?auto_337236 - BLOCK
      ?auto_337237 - BLOCK
      ?auto_337238 - BLOCK
      ?auto_337239 - BLOCK
    )
    :vars
    (
      ?auto_337240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337239 ?auto_337240 ) ( ON-TABLE ?auto_337228 ) ( ON ?auto_337229 ?auto_337228 ) ( ON ?auto_337230 ?auto_337229 ) ( ON ?auto_337231 ?auto_337230 ) ( ON ?auto_337232 ?auto_337231 ) ( ON ?auto_337233 ?auto_337232 ) ( ON ?auto_337234 ?auto_337233 ) ( ON ?auto_337235 ?auto_337234 ) ( not ( = ?auto_337228 ?auto_337229 ) ) ( not ( = ?auto_337228 ?auto_337230 ) ) ( not ( = ?auto_337228 ?auto_337231 ) ) ( not ( = ?auto_337228 ?auto_337232 ) ) ( not ( = ?auto_337228 ?auto_337233 ) ) ( not ( = ?auto_337228 ?auto_337234 ) ) ( not ( = ?auto_337228 ?auto_337235 ) ) ( not ( = ?auto_337228 ?auto_337236 ) ) ( not ( = ?auto_337228 ?auto_337237 ) ) ( not ( = ?auto_337228 ?auto_337238 ) ) ( not ( = ?auto_337228 ?auto_337239 ) ) ( not ( = ?auto_337228 ?auto_337240 ) ) ( not ( = ?auto_337229 ?auto_337230 ) ) ( not ( = ?auto_337229 ?auto_337231 ) ) ( not ( = ?auto_337229 ?auto_337232 ) ) ( not ( = ?auto_337229 ?auto_337233 ) ) ( not ( = ?auto_337229 ?auto_337234 ) ) ( not ( = ?auto_337229 ?auto_337235 ) ) ( not ( = ?auto_337229 ?auto_337236 ) ) ( not ( = ?auto_337229 ?auto_337237 ) ) ( not ( = ?auto_337229 ?auto_337238 ) ) ( not ( = ?auto_337229 ?auto_337239 ) ) ( not ( = ?auto_337229 ?auto_337240 ) ) ( not ( = ?auto_337230 ?auto_337231 ) ) ( not ( = ?auto_337230 ?auto_337232 ) ) ( not ( = ?auto_337230 ?auto_337233 ) ) ( not ( = ?auto_337230 ?auto_337234 ) ) ( not ( = ?auto_337230 ?auto_337235 ) ) ( not ( = ?auto_337230 ?auto_337236 ) ) ( not ( = ?auto_337230 ?auto_337237 ) ) ( not ( = ?auto_337230 ?auto_337238 ) ) ( not ( = ?auto_337230 ?auto_337239 ) ) ( not ( = ?auto_337230 ?auto_337240 ) ) ( not ( = ?auto_337231 ?auto_337232 ) ) ( not ( = ?auto_337231 ?auto_337233 ) ) ( not ( = ?auto_337231 ?auto_337234 ) ) ( not ( = ?auto_337231 ?auto_337235 ) ) ( not ( = ?auto_337231 ?auto_337236 ) ) ( not ( = ?auto_337231 ?auto_337237 ) ) ( not ( = ?auto_337231 ?auto_337238 ) ) ( not ( = ?auto_337231 ?auto_337239 ) ) ( not ( = ?auto_337231 ?auto_337240 ) ) ( not ( = ?auto_337232 ?auto_337233 ) ) ( not ( = ?auto_337232 ?auto_337234 ) ) ( not ( = ?auto_337232 ?auto_337235 ) ) ( not ( = ?auto_337232 ?auto_337236 ) ) ( not ( = ?auto_337232 ?auto_337237 ) ) ( not ( = ?auto_337232 ?auto_337238 ) ) ( not ( = ?auto_337232 ?auto_337239 ) ) ( not ( = ?auto_337232 ?auto_337240 ) ) ( not ( = ?auto_337233 ?auto_337234 ) ) ( not ( = ?auto_337233 ?auto_337235 ) ) ( not ( = ?auto_337233 ?auto_337236 ) ) ( not ( = ?auto_337233 ?auto_337237 ) ) ( not ( = ?auto_337233 ?auto_337238 ) ) ( not ( = ?auto_337233 ?auto_337239 ) ) ( not ( = ?auto_337233 ?auto_337240 ) ) ( not ( = ?auto_337234 ?auto_337235 ) ) ( not ( = ?auto_337234 ?auto_337236 ) ) ( not ( = ?auto_337234 ?auto_337237 ) ) ( not ( = ?auto_337234 ?auto_337238 ) ) ( not ( = ?auto_337234 ?auto_337239 ) ) ( not ( = ?auto_337234 ?auto_337240 ) ) ( not ( = ?auto_337235 ?auto_337236 ) ) ( not ( = ?auto_337235 ?auto_337237 ) ) ( not ( = ?auto_337235 ?auto_337238 ) ) ( not ( = ?auto_337235 ?auto_337239 ) ) ( not ( = ?auto_337235 ?auto_337240 ) ) ( not ( = ?auto_337236 ?auto_337237 ) ) ( not ( = ?auto_337236 ?auto_337238 ) ) ( not ( = ?auto_337236 ?auto_337239 ) ) ( not ( = ?auto_337236 ?auto_337240 ) ) ( not ( = ?auto_337237 ?auto_337238 ) ) ( not ( = ?auto_337237 ?auto_337239 ) ) ( not ( = ?auto_337237 ?auto_337240 ) ) ( not ( = ?auto_337238 ?auto_337239 ) ) ( not ( = ?auto_337238 ?auto_337240 ) ) ( not ( = ?auto_337239 ?auto_337240 ) ) ( ON ?auto_337238 ?auto_337239 ) ( ON ?auto_337237 ?auto_337238 ) ( CLEAR ?auto_337235 ) ( ON ?auto_337236 ?auto_337237 ) ( CLEAR ?auto_337236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_337228 ?auto_337229 ?auto_337230 ?auto_337231 ?auto_337232 ?auto_337233 ?auto_337234 ?auto_337235 ?auto_337236 )
      ( MAKE-12PILE ?auto_337228 ?auto_337229 ?auto_337230 ?auto_337231 ?auto_337232 ?auto_337233 ?auto_337234 ?auto_337235 ?auto_337236 ?auto_337237 ?auto_337238 ?auto_337239 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337278 - BLOCK
      ?auto_337279 - BLOCK
      ?auto_337280 - BLOCK
      ?auto_337281 - BLOCK
      ?auto_337282 - BLOCK
      ?auto_337283 - BLOCK
      ?auto_337284 - BLOCK
      ?auto_337285 - BLOCK
      ?auto_337286 - BLOCK
      ?auto_337287 - BLOCK
      ?auto_337288 - BLOCK
      ?auto_337289 - BLOCK
    )
    :vars
    (
      ?auto_337290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337289 ?auto_337290 ) ( ON-TABLE ?auto_337278 ) ( ON ?auto_337279 ?auto_337278 ) ( ON ?auto_337280 ?auto_337279 ) ( ON ?auto_337281 ?auto_337280 ) ( ON ?auto_337282 ?auto_337281 ) ( ON ?auto_337283 ?auto_337282 ) ( ON ?auto_337284 ?auto_337283 ) ( not ( = ?auto_337278 ?auto_337279 ) ) ( not ( = ?auto_337278 ?auto_337280 ) ) ( not ( = ?auto_337278 ?auto_337281 ) ) ( not ( = ?auto_337278 ?auto_337282 ) ) ( not ( = ?auto_337278 ?auto_337283 ) ) ( not ( = ?auto_337278 ?auto_337284 ) ) ( not ( = ?auto_337278 ?auto_337285 ) ) ( not ( = ?auto_337278 ?auto_337286 ) ) ( not ( = ?auto_337278 ?auto_337287 ) ) ( not ( = ?auto_337278 ?auto_337288 ) ) ( not ( = ?auto_337278 ?auto_337289 ) ) ( not ( = ?auto_337278 ?auto_337290 ) ) ( not ( = ?auto_337279 ?auto_337280 ) ) ( not ( = ?auto_337279 ?auto_337281 ) ) ( not ( = ?auto_337279 ?auto_337282 ) ) ( not ( = ?auto_337279 ?auto_337283 ) ) ( not ( = ?auto_337279 ?auto_337284 ) ) ( not ( = ?auto_337279 ?auto_337285 ) ) ( not ( = ?auto_337279 ?auto_337286 ) ) ( not ( = ?auto_337279 ?auto_337287 ) ) ( not ( = ?auto_337279 ?auto_337288 ) ) ( not ( = ?auto_337279 ?auto_337289 ) ) ( not ( = ?auto_337279 ?auto_337290 ) ) ( not ( = ?auto_337280 ?auto_337281 ) ) ( not ( = ?auto_337280 ?auto_337282 ) ) ( not ( = ?auto_337280 ?auto_337283 ) ) ( not ( = ?auto_337280 ?auto_337284 ) ) ( not ( = ?auto_337280 ?auto_337285 ) ) ( not ( = ?auto_337280 ?auto_337286 ) ) ( not ( = ?auto_337280 ?auto_337287 ) ) ( not ( = ?auto_337280 ?auto_337288 ) ) ( not ( = ?auto_337280 ?auto_337289 ) ) ( not ( = ?auto_337280 ?auto_337290 ) ) ( not ( = ?auto_337281 ?auto_337282 ) ) ( not ( = ?auto_337281 ?auto_337283 ) ) ( not ( = ?auto_337281 ?auto_337284 ) ) ( not ( = ?auto_337281 ?auto_337285 ) ) ( not ( = ?auto_337281 ?auto_337286 ) ) ( not ( = ?auto_337281 ?auto_337287 ) ) ( not ( = ?auto_337281 ?auto_337288 ) ) ( not ( = ?auto_337281 ?auto_337289 ) ) ( not ( = ?auto_337281 ?auto_337290 ) ) ( not ( = ?auto_337282 ?auto_337283 ) ) ( not ( = ?auto_337282 ?auto_337284 ) ) ( not ( = ?auto_337282 ?auto_337285 ) ) ( not ( = ?auto_337282 ?auto_337286 ) ) ( not ( = ?auto_337282 ?auto_337287 ) ) ( not ( = ?auto_337282 ?auto_337288 ) ) ( not ( = ?auto_337282 ?auto_337289 ) ) ( not ( = ?auto_337282 ?auto_337290 ) ) ( not ( = ?auto_337283 ?auto_337284 ) ) ( not ( = ?auto_337283 ?auto_337285 ) ) ( not ( = ?auto_337283 ?auto_337286 ) ) ( not ( = ?auto_337283 ?auto_337287 ) ) ( not ( = ?auto_337283 ?auto_337288 ) ) ( not ( = ?auto_337283 ?auto_337289 ) ) ( not ( = ?auto_337283 ?auto_337290 ) ) ( not ( = ?auto_337284 ?auto_337285 ) ) ( not ( = ?auto_337284 ?auto_337286 ) ) ( not ( = ?auto_337284 ?auto_337287 ) ) ( not ( = ?auto_337284 ?auto_337288 ) ) ( not ( = ?auto_337284 ?auto_337289 ) ) ( not ( = ?auto_337284 ?auto_337290 ) ) ( not ( = ?auto_337285 ?auto_337286 ) ) ( not ( = ?auto_337285 ?auto_337287 ) ) ( not ( = ?auto_337285 ?auto_337288 ) ) ( not ( = ?auto_337285 ?auto_337289 ) ) ( not ( = ?auto_337285 ?auto_337290 ) ) ( not ( = ?auto_337286 ?auto_337287 ) ) ( not ( = ?auto_337286 ?auto_337288 ) ) ( not ( = ?auto_337286 ?auto_337289 ) ) ( not ( = ?auto_337286 ?auto_337290 ) ) ( not ( = ?auto_337287 ?auto_337288 ) ) ( not ( = ?auto_337287 ?auto_337289 ) ) ( not ( = ?auto_337287 ?auto_337290 ) ) ( not ( = ?auto_337288 ?auto_337289 ) ) ( not ( = ?auto_337288 ?auto_337290 ) ) ( not ( = ?auto_337289 ?auto_337290 ) ) ( ON ?auto_337288 ?auto_337289 ) ( ON ?auto_337287 ?auto_337288 ) ( ON ?auto_337286 ?auto_337287 ) ( CLEAR ?auto_337284 ) ( ON ?auto_337285 ?auto_337286 ) ( CLEAR ?auto_337285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_337278 ?auto_337279 ?auto_337280 ?auto_337281 ?auto_337282 ?auto_337283 ?auto_337284 ?auto_337285 )
      ( MAKE-12PILE ?auto_337278 ?auto_337279 ?auto_337280 ?auto_337281 ?auto_337282 ?auto_337283 ?auto_337284 ?auto_337285 ?auto_337286 ?auto_337287 ?auto_337288 ?auto_337289 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337328 - BLOCK
      ?auto_337329 - BLOCK
      ?auto_337330 - BLOCK
      ?auto_337331 - BLOCK
      ?auto_337332 - BLOCK
      ?auto_337333 - BLOCK
      ?auto_337334 - BLOCK
      ?auto_337335 - BLOCK
      ?auto_337336 - BLOCK
      ?auto_337337 - BLOCK
      ?auto_337338 - BLOCK
      ?auto_337339 - BLOCK
    )
    :vars
    (
      ?auto_337340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337339 ?auto_337340 ) ( ON-TABLE ?auto_337328 ) ( ON ?auto_337329 ?auto_337328 ) ( ON ?auto_337330 ?auto_337329 ) ( ON ?auto_337331 ?auto_337330 ) ( ON ?auto_337332 ?auto_337331 ) ( ON ?auto_337333 ?auto_337332 ) ( not ( = ?auto_337328 ?auto_337329 ) ) ( not ( = ?auto_337328 ?auto_337330 ) ) ( not ( = ?auto_337328 ?auto_337331 ) ) ( not ( = ?auto_337328 ?auto_337332 ) ) ( not ( = ?auto_337328 ?auto_337333 ) ) ( not ( = ?auto_337328 ?auto_337334 ) ) ( not ( = ?auto_337328 ?auto_337335 ) ) ( not ( = ?auto_337328 ?auto_337336 ) ) ( not ( = ?auto_337328 ?auto_337337 ) ) ( not ( = ?auto_337328 ?auto_337338 ) ) ( not ( = ?auto_337328 ?auto_337339 ) ) ( not ( = ?auto_337328 ?auto_337340 ) ) ( not ( = ?auto_337329 ?auto_337330 ) ) ( not ( = ?auto_337329 ?auto_337331 ) ) ( not ( = ?auto_337329 ?auto_337332 ) ) ( not ( = ?auto_337329 ?auto_337333 ) ) ( not ( = ?auto_337329 ?auto_337334 ) ) ( not ( = ?auto_337329 ?auto_337335 ) ) ( not ( = ?auto_337329 ?auto_337336 ) ) ( not ( = ?auto_337329 ?auto_337337 ) ) ( not ( = ?auto_337329 ?auto_337338 ) ) ( not ( = ?auto_337329 ?auto_337339 ) ) ( not ( = ?auto_337329 ?auto_337340 ) ) ( not ( = ?auto_337330 ?auto_337331 ) ) ( not ( = ?auto_337330 ?auto_337332 ) ) ( not ( = ?auto_337330 ?auto_337333 ) ) ( not ( = ?auto_337330 ?auto_337334 ) ) ( not ( = ?auto_337330 ?auto_337335 ) ) ( not ( = ?auto_337330 ?auto_337336 ) ) ( not ( = ?auto_337330 ?auto_337337 ) ) ( not ( = ?auto_337330 ?auto_337338 ) ) ( not ( = ?auto_337330 ?auto_337339 ) ) ( not ( = ?auto_337330 ?auto_337340 ) ) ( not ( = ?auto_337331 ?auto_337332 ) ) ( not ( = ?auto_337331 ?auto_337333 ) ) ( not ( = ?auto_337331 ?auto_337334 ) ) ( not ( = ?auto_337331 ?auto_337335 ) ) ( not ( = ?auto_337331 ?auto_337336 ) ) ( not ( = ?auto_337331 ?auto_337337 ) ) ( not ( = ?auto_337331 ?auto_337338 ) ) ( not ( = ?auto_337331 ?auto_337339 ) ) ( not ( = ?auto_337331 ?auto_337340 ) ) ( not ( = ?auto_337332 ?auto_337333 ) ) ( not ( = ?auto_337332 ?auto_337334 ) ) ( not ( = ?auto_337332 ?auto_337335 ) ) ( not ( = ?auto_337332 ?auto_337336 ) ) ( not ( = ?auto_337332 ?auto_337337 ) ) ( not ( = ?auto_337332 ?auto_337338 ) ) ( not ( = ?auto_337332 ?auto_337339 ) ) ( not ( = ?auto_337332 ?auto_337340 ) ) ( not ( = ?auto_337333 ?auto_337334 ) ) ( not ( = ?auto_337333 ?auto_337335 ) ) ( not ( = ?auto_337333 ?auto_337336 ) ) ( not ( = ?auto_337333 ?auto_337337 ) ) ( not ( = ?auto_337333 ?auto_337338 ) ) ( not ( = ?auto_337333 ?auto_337339 ) ) ( not ( = ?auto_337333 ?auto_337340 ) ) ( not ( = ?auto_337334 ?auto_337335 ) ) ( not ( = ?auto_337334 ?auto_337336 ) ) ( not ( = ?auto_337334 ?auto_337337 ) ) ( not ( = ?auto_337334 ?auto_337338 ) ) ( not ( = ?auto_337334 ?auto_337339 ) ) ( not ( = ?auto_337334 ?auto_337340 ) ) ( not ( = ?auto_337335 ?auto_337336 ) ) ( not ( = ?auto_337335 ?auto_337337 ) ) ( not ( = ?auto_337335 ?auto_337338 ) ) ( not ( = ?auto_337335 ?auto_337339 ) ) ( not ( = ?auto_337335 ?auto_337340 ) ) ( not ( = ?auto_337336 ?auto_337337 ) ) ( not ( = ?auto_337336 ?auto_337338 ) ) ( not ( = ?auto_337336 ?auto_337339 ) ) ( not ( = ?auto_337336 ?auto_337340 ) ) ( not ( = ?auto_337337 ?auto_337338 ) ) ( not ( = ?auto_337337 ?auto_337339 ) ) ( not ( = ?auto_337337 ?auto_337340 ) ) ( not ( = ?auto_337338 ?auto_337339 ) ) ( not ( = ?auto_337338 ?auto_337340 ) ) ( not ( = ?auto_337339 ?auto_337340 ) ) ( ON ?auto_337338 ?auto_337339 ) ( ON ?auto_337337 ?auto_337338 ) ( ON ?auto_337336 ?auto_337337 ) ( ON ?auto_337335 ?auto_337336 ) ( CLEAR ?auto_337333 ) ( ON ?auto_337334 ?auto_337335 ) ( CLEAR ?auto_337334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_337328 ?auto_337329 ?auto_337330 ?auto_337331 ?auto_337332 ?auto_337333 ?auto_337334 )
      ( MAKE-12PILE ?auto_337328 ?auto_337329 ?auto_337330 ?auto_337331 ?auto_337332 ?auto_337333 ?auto_337334 ?auto_337335 ?auto_337336 ?auto_337337 ?auto_337338 ?auto_337339 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337378 - BLOCK
      ?auto_337379 - BLOCK
      ?auto_337380 - BLOCK
      ?auto_337381 - BLOCK
      ?auto_337382 - BLOCK
      ?auto_337383 - BLOCK
      ?auto_337384 - BLOCK
      ?auto_337385 - BLOCK
      ?auto_337386 - BLOCK
      ?auto_337387 - BLOCK
      ?auto_337388 - BLOCK
      ?auto_337389 - BLOCK
    )
    :vars
    (
      ?auto_337390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337389 ?auto_337390 ) ( ON-TABLE ?auto_337378 ) ( ON ?auto_337379 ?auto_337378 ) ( ON ?auto_337380 ?auto_337379 ) ( ON ?auto_337381 ?auto_337380 ) ( ON ?auto_337382 ?auto_337381 ) ( not ( = ?auto_337378 ?auto_337379 ) ) ( not ( = ?auto_337378 ?auto_337380 ) ) ( not ( = ?auto_337378 ?auto_337381 ) ) ( not ( = ?auto_337378 ?auto_337382 ) ) ( not ( = ?auto_337378 ?auto_337383 ) ) ( not ( = ?auto_337378 ?auto_337384 ) ) ( not ( = ?auto_337378 ?auto_337385 ) ) ( not ( = ?auto_337378 ?auto_337386 ) ) ( not ( = ?auto_337378 ?auto_337387 ) ) ( not ( = ?auto_337378 ?auto_337388 ) ) ( not ( = ?auto_337378 ?auto_337389 ) ) ( not ( = ?auto_337378 ?auto_337390 ) ) ( not ( = ?auto_337379 ?auto_337380 ) ) ( not ( = ?auto_337379 ?auto_337381 ) ) ( not ( = ?auto_337379 ?auto_337382 ) ) ( not ( = ?auto_337379 ?auto_337383 ) ) ( not ( = ?auto_337379 ?auto_337384 ) ) ( not ( = ?auto_337379 ?auto_337385 ) ) ( not ( = ?auto_337379 ?auto_337386 ) ) ( not ( = ?auto_337379 ?auto_337387 ) ) ( not ( = ?auto_337379 ?auto_337388 ) ) ( not ( = ?auto_337379 ?auto_337389 ) ) ( not ( = ?auto_337379 ?auto_337390 ) ) ( not ( = ?auto_337380 ?auto_337381 ) ) ( not ( = ?auto_337380 ?auto_337382 ) ) ( not ( = ?auto_337380 ?auto_337383 ) ) ( not ( = ?auto_337380 ?auto_337384 ) ) ( not ( = ?auto_337380 ?auto_337385 ) ) ( not ( = ?auto_337380 ?auto_337386 ) ) ( not ( = ?auto_337380 ?auto_337387 ) ) ( not ( = ?auto_337380 ?auto_337388 ) ) ( not ( = ?auto_337380 ?auto_337389 ) ) ( not ( = ?auto_337380 ?auto_337390 ) ) ( not ( = ?auto_337381 ?auto_337382 ) ) ( not ( = ?auto_337381 ?auto_337383 ) ) ( not ( = ?auto_337381 ?auto_337384 ) ) ( not ( = ?auto_337381 ?auto_337385 ) ) ( not ( = ?auto_337381 ?auto_337386 ) ) ( not ( = ?auto_337381 ?auto_337387 ) ) ( not ( = ?auto_337381 ?auto_337388 ) ) ( not ( = ?auto_337381 ?auto_337389 ) ) ( not ( = ?auto_337381 ?auto_337390 ) ) ( not ( = ?auto_337382 ?auto_337383 ) ) ( not ( = ?auto_337382 ?auto_337384 ) ) ( not ( = ?auto_337382 ?auto_337385 ) ) ( not ( = ?auto_337382 ?auto_337386 ) ) ( not ( = ?auto_337382 ?auto_337387 ) ) ( not ( = ?auto_337382 ?auto_337388 ) ) ( not ( = ?auto_337382 ?auto_337389 ) ) ( not ( = ?auto_337382 ?auto_337390 ) ) ( not ( = ?auto_337383 ?auto_337384 ) ) ( not ( = ?auto_337383 ?auto_337385 ) ) ( not ( = ?auto_337383 ?auto_337386 ) ) ( not ( = ?auto_337383 ?auto_337387 ) ) ( not ( = ?auto_337383 ?auto_337388 ) ) ( not ( = ?auto_337383 ?auto_337389 ) ) ( not ( = ?auto_337383 ?auto_337390 ) ) ( not ( = ?auto_337384 ?auto_337385 ) ) ( not ( = ?auto_337384 ?auto_337386 ) ) ( not ( = ?auto_337384 ?auto_337387 ) ) ( not ( = ?auto_337384 ?auto_337388 ) ) ( not ( = ?auto_337384 ?auto_337389 ) ) ( not ( = ?auto_337384 ?auto_337390 ) ) ( not ( = ?auto_337385 ?auto_337386 ) ) ( not ( = ?auto_337385 ?auto_337387 ) ) ( not ( = ?auto_337385 ?auto_337388 ) ) ( not ( = ?auto_337385 ?auto_337389 ) ) ( not ( = ?auto_337385 ?auto_337390 ) ) ( not ( = ?auto_337386 ?auto_337387 ) ) ( not ( = ?auto_337386 ?auto_337388 ) ) ( not ( = ?auto_337386 ?auto_337389 ) ) ( not ( = ?auto_337386 ?auto_337390 ) ) ( not ( = ?auto_337387 ?auto_337388 ) ) ( not ( = ?auto_337387 ?auto_337389 ) ) ( not ( = ?auto_337387 ?auto_337390 ) ) ( not ( = ?auto_337388 ?auto_337389 ) ) ( not ( = ?auto_337388 ?auto_337390 ) ) ( not ( = ?auto_337389 ?auto_337390 ) ) ( ON ?auto_337388 ?auto_337389 ) ( ON ?auto_337387 ?auto_337388 ) ( ON ?auto_337386 ?auto_337387 ) ( ON ?auto_337385 ?auto_337386 ) ( ON ?auto_337384 ?auto_337385 ) ( CLEAR ?auto_337382 ) ( ON ?auto_337383 ?auto_337384 ) ( CLEAR ?auto_337383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_337378 ?auto_337379 ?auto_337380 ?auto_337381 ?auto_337382 ?auto_337383 )
      ( MAKE-12PILE ?auto_337378 ?auto_337379 ?auto_337380 ?auto_337381 ?auto_337382 ?auto_337383 ?auto_337384 ?auto_337385 ?auto_337386 ?auto_337387 ?auto_337388 ?auto_337389 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337428 - BLOCK
      ?auto_337429 - BLOCK
      ?auto_337430 - BLOCK
      ?auto_337431 - BLOCK
      ?auto_337432 - BLOCK
      ?auto_337433 - BLOCK
      ?auto_337434 - BLOCK
      ?auto_337435 - BLOCK
      ?auto_337436 - BLOCK
      ?auto_337437 - BLOCK
      ?auto_337438 - BLOCK
      ?auto_337439 - BLOCK
    )
    :vars
    (
      ?auto_337440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337439 ?auto_337440 ) ( ON-TABLE ?auto_337428 ) ( ON ?auto_337429 ?auto_337428 ) ( ON ?auto_337430 ?auto_337429 ) ( ON ?auto_337431 ?auto_337430 ) ( not ( = ?auto_337428 ?auto_337429 ) ) ( not ( = ?auto_337428 ?auto_337430 ) ) ( not ( = ?auto_337428 ?auto_337431 ) ) ( not ( = ?auto_337428 ?auto_337432 ) ) ( not ( = ?auto_337428 ?auto_337433 ) ) ( not ( = ?auto_337428 ?auto_337434 ) ) ( not ( = ?auto_337428 ?auto_337435 ) ) ( not ( = ?auto_337428 ?auto_337436 ) ) ( not ( = ?auto_337428 ?auto_337437 ) ) ( not ( = ?auto_337428 ?auto_337438 ) ) ( not ( = ?auto_337428 ?auto_337439 ) ) ( not ( = ?auto_337428 ?auto_337440 ) ) ( not ( = ?auto_337429 ?auto_337430 ) ) ( not ( = ?auto_337429 ?auto_337431 ) ) ( not ( = ?auto_337429 ?auto_337432 ) ) ( not ( = ?auto_337429 ?auto_337433 ) ) ( not ( = ?auto_337429 ?auto_337434 ) ) ( not ( = ?auto_337429 ?auto_337435 ) ) ( not ( = ?auto_337429 ?auto_337436 ) ) ( not ( = ?auto_337429 ?auto_337437 ) ) ( not ( = ?auto_337429 ?auto_337438 ) ) ( not ( = ?auto_337429 ?auto_337439 ) ) ( not ( = ?auto_337429 ?auto_337440 ) ) ( not ( = ?auto_337430 ?auto_337431 ) ) ( not ( = ?auto_337430 ?auto_337432 ) ) ( not ( = ?auto_337430 ?auto_337433 ) ) ( not ( = ?auto_337430 ?auto_337434 ) ) ( not ( = ?auto_337430 ?auto_337435 ) ) ( not ( = ?auto_337430 ?auto_337436 ) ) ( not ( = ?auto_337430 ?auto_337437 ) ) ( not ( = ?auto_337430 ?auto_337438 ) ) ( not ( = ?auto_337430 ?auto_337439 ) ) ( not ( = ?auto_337430 ?auto_337440 ) ) ( not ( = ?auto_337431 ?auto_337432 ) ) ( not ( = ?auto_337431 ?auto_337433 ) ) ( not ( = ?auto_337431 ?auto_337434 ) ) ( not ( = ?auto_337431 ?auto_337435 ) ) ( not ( = ?auto_337431 ?auto_337436 ) ) ( not ( = ?auto_337431 ?auto_337437 ) ) ( not ( = ?auto_337431 ?auto_337438 ) ) ( not ( = ?auto_337431 ?auto_337439 ) ) ( not ( = ?auto_337431 ?auto_337440 ) ) ( not ( = ?auto_337432 ?auto_337433 ) ) ( not ( = ?auto_337432 ?auto_337434 ) ) ( not ( = ?auto_337432 ?auto_337435 ) ) ( not ( = ?auto_337432 ?auto_337436 ) ) ( not ( = ?auto_337432 ?auto_337437 ) ) ( not ( = ?auto_337432 ?auto_337438 ) ) ( not ( = ?auto_337432 ?auto_337439 ) ) ( not ( = ?auto_337432 ?auto_337440 ) ) ( not ( = ?auto_337433 ?auto_337434 ) ) ( not ( = ?auto_337433 ?auto_337435 ) ) ( not ( = ?auto_337433 ?auto_337436 ) ) ( not ( = ?auto_337433 ?auto_337437 ) ) ( not ( = ?auto_337433 ?auto_337438 ) ) ( not ( = ?auto_337433 ?auto_337439 ) ) ( not ( = ?auto_337433 ?auto_337440 ) ) ( not ( = ?auto_337434 ?auto_337435 ) ) ( not ( = ?auto_337434 ?auto_337436 ) ) ( not ( = ?auto_337434 ?auto_337437 ) ) ( not ( = ?auto_337434 ?auto_337438 ) ) ( not ( = ?auto_337434 ?auto_337439 ) ) ( not ( = ?auto_337434 ?auto_337440 ) ) ( not ( = ?auto_337435 ?auto_337436 ) ) ( not ( = ?auto_337435 ?auto_337437 ) ) ( not ( = ?auto_337435 ?auto_337438 ) ) ( not ( = ?auto_337435 ?auto_337439 ) ) ( not ( = ?auto_337435 ?auto_337440 ) ) ( not ( = ?auto_337436 ?auto_337437 ) ) ( not ( = ?auto_337436 ?auto_337438 ) ) ( not ( = ?auto_337436 ?auto_337439 ) ) ( not ( = ?auto_337436 ?auto_337440 ) ) ( not ( = ?auto_337437 ?auto_337438 ) ) ( not ( = ?auto_337437 ?auto_337439 ) ) ( not ( = ?auto_337437 ?auto_337440 ) ) ( not ( = ?auto_337438 ?auto_337439 ) ) ( not ( = ?auto_337438 ?auto_337440 ) ) ( not ( = ?auto_337439 ?auto_337440 ) ) ( ON ?auto_337438 ?auto_337439 ) ( ON ?auto_337437 ?auto_337438 ) ( ON ?auto_337436 ?auto_337437 ) ( ON ?auto_337435 ?auto_337436 ) ( ON ?auto_337434 ?auto_337435 ) ( ON ?auto_337433 ?auto_337434 ) ( CLEAR ?auto_337431 ) ( ON ?auto_337432 ?auto_337433 ) ( CLEAR ?auto_337432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_337428 ?auto_337429 ?auto_337430 ?auto_337431 ?auto_337432 )
      ( MAKE-12PILE ?auto_337428 ?auto_337429 ?auto_337430 ?auto_337431 ?auto_337432 ?auto_337433 ?auto_337434 ?auto_337435 ?auto_337436 ?auto_337437 ?auto_337438 ?auto_337439 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337478 - BLOCK
      ?auto_337479 - BLOCK
      ?auto_337480 - BLOCK
      ?auto_337481 - BLOCK
      ?auto_337482 - BLOCK
      ?auto_337483 - BLOCK
      ?auto_337484 - BLOCK
      ?auto_337485 - BLOCK
      ?auto_337486 - BLOCK
      ?auto_337487 - BLOCK
      ?auto_337488 - BLOCK
      ?auto_337489 - BLOCK
    )
    :vars
    (
      ?auto_337490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337489 ?auto_337490 ) ( ON-TABLE ?auto_337478 ) ( ON ?auto_337479 ?auto_337478 ) ( ON ?auto_337480 ?auto_337479 ) ( not ( = ?auto_337478 ?auto_337479 ) ) ( not ( = ?auto_337478 ?auto_337480 ) ) ( not ( = ?auto_337478 ?auto_337481 ) ) ( not ( = ?auto_337478 ?auto_337482 ) ) ( not ( = ?auto_337478 ?auto_337483 ) ) ( not ( = ?auto_337478 ?auto_337484 ) ) ( not ( = ?auto_337478 ?auto_337485 ) ) ( not ( = ?auto_337478 ?auto_337486 ) ) ( not ( = ?auto_337478 ?auto_337487 ) ) ( not ( = ?auto_337478 ?auto_337488 ) ) ( not ( = ?auto_337478 ?auto_337489 ) ) ( not ( = ?auto_337478 ?auto_337490 ) ) ( not ( = ?auto_337479 ?auto_337480 ) ) ( not ( = ?auto_337479 ?auto_337481 ) ) ( not ( = ?auto_337479 ?auto_337482 ) ) ( not ( = ?auto_337479 ?auto_337483 ) ) ( not ( = ?auto_337479 ?auto_337484 ) ) ( not ( = ?auto_337479 ?auto_337485 ) ) ( not ( = ?auto_337479 ?auto_337486 ) ) ( not ( = ?auto_337479 ?auto_337487 ) ) ( not ( = ?auto_337479 ?auto_337488 ) ) ( not ( = ?auto_337479 ?auto_337489 ) ) ( not ( = ?auto_337479 ?auto_337490 ) ) ( not ( = ?auto_337480 ?auto_337481 ) ) ( not ( = ?auto_337480 ?auto_337482 ) ) ( not ( = ?auto_337480 ?auto_337483 ) ) ( not ( = ?auto_337480 ?auto_337484 ) ) ( not ( = ?auto_337480 ?auto_337485 ) ) ( not ( = ?auto_337480 ?auto_337486 ) ) ( not ( = ?auto_337480 ?auto_337487 ) ) ( not ( = ?auto_337480 ?auto_337488 ) ) ( not ( = ?auto_337480 ?auto_337489 ) ) ( not ( = ?auto_337480 ?auto_337490 ) ) ( not ( = ?auto_337481 ?auto_337482 ) ) ( not ( = ?auto_337481 ?auto_337483 ) ) ( not ( = ?auto_337481 ?auto_337484 ) ) ( not ( = ?auto_337481 ?auto_337485 ) ) ( not ( = ?auto_337481 ?auto_337486 ) ) ( not ( = ?auto_337481 ?auto_337487 ) ) ( not ( = ?auto_337481 ?auto_337488 ) ) ( not ( = ?auto_337481 ?auto_337489 ) ) ( not ( = ?auto_337481 ?auto_337490 ) ) ( not ( = ?auto_337482 ?auto_337483 ) ) ( not ( = ?auto_337482 ?auto_337484 ) ) ( not ( = ?auto_337482 ?auto_337485 ) ) ( not ( = ?auto_337482 ?auto_337486 ) ) ( not ( = ?auto_337482 ?auto_337487 ) ) ( not ( = ?auto_337482 ?auto_337488 ) ) ( not ( = ?auto_337482 ?auto_337489 ) ) ( not ( = ?auto_337482 ?auto_337490 ) ) ( not ( = ?auto_337483 ?auto_337484 ) ) ( not ( = ?auto_337483 ?auto_337485 ) ) ( not ( = ?auto_337483 ?auto_337486 ) ) ( not ( = ?auto_337483 ?auto_337487 ) ) ( not ( = ?auto_337483 ?auto_337488 ) ) ( not ( = ?auto_337483 ?auto_337489 ) ) ( not ( = ?auto_337483 ?auto_337490 ) ) ( not ( = ?auto_337484 ?auto_337485 ) ) ( not ( = ?auto_337484 ?auto_337486 ) ) ( not ( = ?auto_337484 ?auto_337487 ) ) ( not ( = ?auto_337484 ?auto_337488 ) ) ( not ( = ?auto_337484 ?auto_337489 ) ) ( not ( = ?auto_337484 ?auto_337490 ) ) ( not ( = ?auto_337485 ?auto_337486 ) ) ( not ( = ?auto_337485 ?auto_337487 ) ) ( not ( = ?auto_337485 ?auto_337488 ) ) ( not ( = ?auto_337485 ?auto_337489 ) ) ( not ( = ?auto_337485 ?auto_337490 ) ) ( not ( = ?auto_337486 ?auto_337487 ) ) ( not ( = ?auto_337486 ?auto_337488 ) ) ( not ( = ?auto_337486 ?auto_337489 ) ) ( not ( = ?auto_337486 ?auto_337490 ) ) ( not ( = ?auto_337487 ?auto_337488 ) ) ( not ( = ?auto_337487 ?auto_337489 ) ) ( not ( = ?auto_337487 ?auto_337490 ) ) ( not ( = ?auto_337488 ?auto_337489 ) ) ( not ( = ?auto_337488 ?auto_337490 ) ) ( not ( = ?auto_337489 ?auto_337490 ) ) ( ON ?auto_337488 ?auto_337489 ) ( ON ?auto_337487 ?auto_337488 ) ( ON ?auto_337486 ?auto_337487 ) ( ON ?auto_337485 ?auto_337486 ) ( ON ?auto_337484 ?auto_337485 ) ( ON ?auto_337483 ?auto_337484 ) ( ON ?auto_337482 ?auto_337483 ) ( CLEAR ?auto_337480 ) ( ON ?auto_337481 ?auto_337482 ) ( CLEAR ?auto_337481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_337478 ?auto_337479 ?auto_337480 ?auto_337481 )
      ( MAKE-12PILE ?auto_337478 ?auto_337479 ?auto_337480 ?auto_337481 ?auto_337482 ?auto_337483 ?auto_337484 ?auto_337485 ?auto_337486 ?auto_337487 ?auto_337488 ?auto_337489 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337528 - BLOCK
      ?auto_337529 - BLOCK
      ?auto_337530 - BLOCK
      ?auto_337531 - BLOCK
      ?auto_337532 - BLOCK
      ?auto_337533 - BLOCK
      ?auto_337534 - BLOCK
      ?auto_337535 - BLOCK
      ?auto_337536 - BLOCK
      ?auto_337537 - BLOCK
      ?auto_337538 - BLOCK
      ?auto_337539 - BLOCK
    )
    :vars
    (
      ?auto_337540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337539 ?auto_337540 ) ( ON-TABLE ?auto_337528 ) ( ON ?auto_337529 ?auto_337528 ) ( not ( = ?auto_337528 ?auto_337529 ) ) ( not ( = ?auto_337528 ?auto_337530 ) ) ( not ( = ?auto_337528 ?auto_337531 ) ) ( not ( = ?auto_337528 ?auto_337532 ) ) ( not ( = ?auto_337528 ?auto_337533 ) ) ( not ( = ?auto_337528 ?auto_337534 ) ) ( not ( = ?auto_337528 ?auto_337535 ) ) ( not ( = ?auto_337528 ?auto_337536 ) ) ( not ( = ?auto_337528 ?auto_337537 ) ) ( not ( = ?auto_337528 ?auto_337538 ) ) ( not ( = ?auto_337528 ?auto_337539 ) ) ( not ( = ?auto_337528 ?auto_337540 ) ) ( not ( = ?auto_337529 ?auto_337530 ) ) ( not ( = ?auto_337529 ?auto_337531 ) ) ( not ( = ?auto_337529 ?auto_337532 ) ) ( not ( = ?auto_337529 ?auto_337533 ) ) ( not ( = ?auto_337529 ?auto_337534 ) ) ( not ( = ?auto_337529 ?auto_337535 ) ) ( not ( = ?auto_337529 ?auto_337536 ) ) ( not ( = ?auto_337529 ?auto_337537 ) ) ( not ( = ?auto_337529 ?auto_337538 ) ) ( not ( = ?auto_337529 ?auto_337539 ) ) ( not ( = ?auto_337529 ?auto_337540 ) ) ( not ( = ?auto_337530 ?auto_337531 ) ) ( not ( = ?auto_337530 ?auto_337532 ) ) ( not ( = ?auto_337530 ?auto_337533 ) ) ( not ( = ?auto_337530 ?auto_337534 ) ) ( not ( = ?auto_337530 ?auto_337535 ) ) ( not ( = ?auto_337530 ?auto_337536 ) ) ( not ( = ?auto_337530 ?auto_337537 ) ) ( not ( = ?auto_337530 ?auto_337538 ) ) ( not ( = ?auto_337530 ?auto_337539 ) ) ( not ( = ?auto_337530 ?auto_337540 ) ) ( not ( = ?auto_337531 ?auto_337532 ) ) ( not ( = ?auto_337531 ?auto_337533 ) ) ( not ( = ?auto_337531 ?auto_337534 ) ) ( not ( = ?auto_337531 ?auto_337535 ) ) ( not ( = ?auto_337531 ?auto_337536 ) ) ( not ( = ?auto_337531 ?auto_337537 ) ) ( not ( = ?auto_337531 ?auto_337538 ) ) ( not ( = ?auto_337531 ?auto_337539 ) ) ( not ( = ?auto_337531 ?auto_337540 ) ) ( not ( = ?auto_337532 ?auto_337533 ) ) ( not ( = ?auto_337532 ?auto_337534 ) ) ( not ( = ?auto_337532 ?auto_337535 ) ) ( not ( = ?auto_337532 ?auto_337536 ) ) ( not ( = ?auto_337532 ?auto_337537 ) ) ( not ( = ?auto_337532 ?auto_337538 ) ) ( not ( = ?auto_337532 ?auto_337539 ) ) ( not ( = ?auto_337532 ?auto_337540 ) ) ( not ( = ?auto_337533 ?auto_337534 ) ) ( not ( = ?auto_337533 ?auto_337535 ) ) ( not ( = ?auto_337533 ?auto_337536 ) ) ( not ( = ?auto_337533 ?auto_337537 ) ) ( not ( = ?auto_337533 ?auto_337538 ) ) ( not ( = ?auto_337533 ?auto_337539 ) ) ( not ( = ?auto_337533 ?auto_337540 ) ) ( not ( = ?auto_337534 ?auto_337535 ) ) ( not ( = ?auto_337534 ?auto_337536 ) ) ( not ( = ?auto_337534 ?auto_337537 ) ) ( not ( = ?auto_337534 ?auto_337538 ) ) ( not ( = ?auto_337534 ?auto_337539 ) ) ( not ( = ?auto_337534 ?auto_337540 ) ) ( not ( = ?auto_337535 ?auto_337536 ) ) ( not ( = ?auto_337535 ?auto_337537 ) ) ( not ( = ?auto_337535 ?auto_337538 ) ) ( not ( = ?auto_337535 ?auto_337539 ) ) ( not ( = ?auto_337535 ?auto_337540 ) ) ( not ( = ?auto_337536 ?auto_337537 ) ) ( not ( = ?auto_337536 ?auto_337538 ) ) ( not ( = ?auto_337536 ?auto_337539 ) ) ( not ( = ?auto_337536 ?auto_337540 ) ) ( not ( = ?auto_337537 ?auto_337538 ) ) ( not ( = ?auto_337537 ?auto_337539 ) ) ( not ( = ?auto_337537 ?auto_337540 ) ) ( not ( = ?auto_337538 ?auto_337539 ) ) ( not ( = ?auto_337538 ?auto_337540 ) ) ( not ( = ?auto_337539 ?auto_337540 ) ) ( ON ?auto_337538 ?auto_337539 ) ( ON ?auto_337537 ?auto_337538 ) ( ON ?auto_337536 ?auto_337537 ) ( ON ?auto_337535 ?auto_337536 ) ( ON ?auto_337534 ?auto_337535 ) ( ON ?auto_337533 ?auto_337534 ) ( ON ?auto_337532 ?auto_337533 ) ( ON ?auto_337531 ?auto_337532 ) ( CLEAR ?auto_337529 ) ( ON ?auto_337530 ?auto_337531 ) ( CLEAR ?auto_337530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_337528 ?auto_337529 ?auto_337530 )
      ( MAKE-12PILE ?auto_337528 ?auto_337529 ?auto_337530 ?auto_337531 ?auto_337532 ?auto_337533 ?auto_337534 ?auto_337535 ?auto_337536 ?auto_337537 ?auto_337538 ?auto_337539 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337578 - BLOCK
      ?auto_337579 - BLOCK
      ?auto_337580 - BLOCK
      ?auto_337581 - BLOCK
      ?auto_337582 - BLOCK
      ?auto_337583 - BLOCK
      ?auto_337584 - BLOCK
      ?auto_337585 - BLOCK
      ?auto_337586 - BLOCK
      ?auto_337587 - BLOCK
      ?auto_337588 - BLOCK
      ?auto_337589 - BLOCK
    )
    :vars
    (
      ?auto_337590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337589 ?auto_337590 ) ( ON-TABLE ?auto_337578 ) ( not ( = ?auto_337578 ?auto_337579 ) ) ( not ( = ?auto_337578 ?auto_337580 ) ) ( not ( = ?auto_337578 ?auto_337581 ) ) ( not ( = ?auto_337578 ?auto_337582 ) ) ( not ( = ?auto_337578 ?auto_337583 ) ) ( not ( = ?auto_337578 ?auto_337584 ) ) ( not ( = ?auto_337578 ?auto_337585 ) ) ( not ( = ?auto_337578 ?auto_337586 ) ) ( not ( = ?auto_337578 ?auto_337587 ) ) ( not ( = ?auto_337578 ?auto_337588 ) ) ( not ( = ?auto_337578 ?auto_337589 ) ) ( not ( = ?auto_337578 ?auto_337590 ) ) ( not ( = ?auto_337579 ?auto_337580 ) ) ( not ( = ?auto_337579 ?auto_337581 ) ) ( not ( = ?auto_337579 ?auto_337582 ) ) ( not ( = ?auto_337579 ?auto_337583 ) ) ( not ( = ?auto_337579 ?auto_337584 ) ) ( not ( = ?auto_337579 ?auto_337585 ) ) ( not ( = ?auto_337579 ?auto_337586 ) ) ( not ( = ?auto_337579 ?auto_337587 ) ) ( not ( = ?auto_337579 ?auto_337588 ) ) ( not ( = ?auto_337579 ?auto_337589 ) ) ( not ( = ?auto_337579 ?auto_337590 ) ) ( not ( = ?auto_337580 ?auto_337581 ) ) ( not ( = ?auto_337580 ?auto_337582 ) ) ( not ( = ?auto_337580 ?auto_337583 ) ) ( not ( = ?auto_337580 ?auto_337584 ) ) ( not ( = ?auto_337580 ?auto_337585 ) ) ( not ( = ?auto_337580 ?auto_337586 ) ) ( not ( = ?auto_337580 ?auto_337587 ) ) ( not ( = ?auto_337580 ?auto_337588 ) ) ( not ( = ?auto_337580 ?auto_337589 ) ) ( not ( = ?auto_337580 ?auto_337590 ) ) ( not ( = ?auto_337581 ?auto_337582 ) ) ( not ( = ?auto_337581 ?auto_337583 ) ) ( not ( = ?auto_337581 ?auto_337584 ) ) ( not ( = ?auto_337581 ?auto_337585 ) ) ( not ( = ?auto_337581 ?auto_337586 ) ) ( not ( = ?auto_337581 ?auto_337587 ) ) ( not ( = ?auto_337581 ?auto_337588 ) ) ( not ( = ?auto_337581 ?auto_337589 ) ) ( not ( = ?auto_337581 ?auto_337590 ) ) ( not ( = ?auto_337582 ?auto_337583 ) ) ( not ( = ?auto_337582 ?auto_337584 ) ) ( not ( = ?auto_337582 ?auto_337585 ) ) ( not ( = ?auto_337582 ?auto_337586 ) ) ( not ( = ?auto_337582 ?auto_337587 ) ) ( not ( = ?auto_337582 ?auto_337588 ) ) ( not ( = ?auto_337582 ?auto_337589 ) ) ( not ( = ?auto_337582 ?auto_337590 ) ) ( not ( = ?auto_337583 ?auto_337584 ) ) ( not ( = ?auto_337583 ?auto_337585 ) ) ( not ( = ?auto_337583 ?auto_337586 ) ) ( not ( = ?auto_337583 ?auto_337587 ) ) ( not ( = ?auto_337583 ?auto_337588 ) ) ( not ( = ?auto_337583 ?auto_337589 ) ) ( not ( = ?auto_337583 ?auto_337590 ) ) ( not ( = ?auto_337584 ?auto_337585 ) ) ( not ( = ?auto_337584 ?auto_337586 ) ) ( not ( = ?auto_337584 ?auto_337587 ) ) ( not ( = ?auto_337584 ?auto_337588 ) ) ( not ( = ?auto_337584 ?auto_337589 ) ) ( not ( = ?auto_337584 ?auto_337590 ) ) ( not ( = ?auto_337585 ?auto_337586 ) ) ( not ( = ?auto_337585 ?auto_337587 ) ) ( not ( = ?auto_337585 ?auto_337588 ) ) ( not ( = ?auto_337585 ?auto_337589 ) ) ( not ( = ?auto_337585 ?auto_337590 ) ) ( not ( = ?auto_337586 ?auto_337587 ) ) ( not ( = ?auto_337586 ?auto_337588 ) ) ( not ( = ?auto_337586 ?auto_337589 ) ) ( not ( = ?auto_337586 ?auto_337590 ) ) ( not ( = ?auto_337587 ?auto_337588 ) ) ( not ( = ?auto_337587 ?auto_337589 ) ) ( not ( = ?auto_337587 ?auto_337590 ) ) ( not ( = ?auto_337588 ?auto_337589 ) ) ( not ( = ?auto_337588 ?auto_337590 ) ) ( not ( = ?auto_337589 ?auto_337590 ) ) ( ON ?auto_337588 ?auto_337589 ) ( ON ?auto_337587 ?auto_337588 ) ( ON ?auto_337586 ?auto_337587 ) ( ON ?auto_337585 ?auto_337586 ) ( ON ?auto_337584 ?auto_337585 ) ( ON ?auto_337583 ?auto_337584 ) ( ON ?auto_337582 ?auto_337583 ) ( ON ?auto_337581 ?auto_337582 ) ( ON ?auto_337580 ?auto_337581 ) ( CLEAR ?auto_337578 ) ( ON ?auto_337579 ?auto_337580 ) ( CLEAR ?auto_337579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_337578 ?auto_337579 )
      ( MAKE-12PILE ?auto_337578 ?auto_337579 ?auto_337580 ?auto_337581 ?auto_337582 ?auto_337583 ?auto_337584 ?auto_337585 ?auto_337586 ?auto_337587 ?auto_337588 ?auto_337589 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337628 - BLOCK
      ?auto_337629 - BLOCK
      ?auto_337630 - BLOCK
      ?auto_337631 - BLOCK
      ?auto_337632 - BLOCK
      ?auto_337633 - BLOCK
      ?auto_337634 - BLOCK
      ?auto_337635 - BLOCK
      ?auto_337636 - BLOCK
      ?auto_337637 - BLOCK
      ?auto_337638 - BLOCK
      ?auto_337639 - BLOCK
    )
    :vars
    (
      ?auto_337640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337639 ?auto_337640 ) ( not ( = ?auto_337628 ?auto_337629 ) ) ( not ( = ?auto_337628 ?auto_337630 ) ) ( not ( = ?auto_337628 ?auto_337631 ) ) ( not ( = ?auto_337628 ?auto_337632 ) ) ( not ( = ?auto_337628 ?auto_337633 ) ) ( not ( = ?auto_337628 ?auto_337634 ) ) ( not ( = ?auto_337628 ?auto_337635 ) ) ( not ( = ?auto_337628 ?auto_337636 ) ) ( not ( = ?auto_337628 ?auto_337637 ) ) ( not ( = ?auto_337628 ?auto_337638 ) ) ( not ( = ?auto_337628 ?auto_337639 ) ) ( not ( = ?auto_337628 ?auto_337640 ) ) ( not ( = ?auto_337629 ?auto_337630 ) ) ( not ( = ?auto_337629 ?auto_337631 ) ) ( not ( = ?auto_337629 ?auto_337632 ) ) ( not ( = ?auto_337629 ?auto_337633 ) ) ( not ( = ?auto_337629 ?auto_337634 ) ) ( not ( = ?auto_337629 ?auto_337635 ) ) ( not ( = ?auto_337629 ?auto_337636 ) ) ( not ( = ?auto_337629 ?auto_337637 ) ) ( not ( = ?auto_337629 ?auto_337638 ) ) ( not ( = ?auto_337629 ?auto_337639 ) ) ( not ( = ?auto_337629 ?auto_337640 ) ) ( not ( = ?auto_337630 ?auto_337631 ) ) ( not ( = ?auto_337630 ?auto_337632 ) ) ( not ( = ?auto_337630 ?auto_337633 ) ) ( not ( = ?auto_337630 ?auto_337634 ) ) ( not ( = ?auto_337630 ?auto_337635 ) ) ( not ( = ?auto_337630 ?auto_337636 ) ) ( not ( = ?auto_337630 ?auto_337637 ) ) ( not ( = ?auto_337630 ?auto_337638 ) ) ( not ( = ?auto_337630 ?auto_337639 ) ) ( not ( = ?auto_337630 ?auto_337640 ) ) ( not ( = ?auto_337631 ?auto_337632 ) ) ( not ( = ?auto_337631 ?auto_337633 ) ) ( not ( = ?auto_337631 ?auto_337634 ) ) ( not ( = ?auto_337631 ?auto_337635 ) ) ( not ( = ?auto_337631 ?auto_337636 ) ) ( not ( = ?auto_337631 ?auto_337637 ) ) ( not ( = ?auto_337631 ?auto_337638 ) ) ( not ( = ?auto_337631 ?auto_337639 ) ) ( not ( = ?auto_337631 ?auto_337640 ) ) ( not ( = ?auto_337632 ?auto_337633 ) ) ( not ( = ?auto_337632 ?auto_337634 ) ) ( not ( = ?auto_337632 ?auto_337635 ) ) ( not ( = ?auto_337632 ?auto_337636 ) ) ( not ( = ?auto_337632 ?auto_337637 ) ) ( not ( = ?auto_337632 ?auto_337638 ) ) ( not ( = ?auto_337632 ?auto_337639 ) ) ( not ( = ?auto_337632 ?auto_337640 ) ) ( not ( = ?auto_337633 ?auto_337634 ) ) ( not ( = ?auto_337633 ?auto_337635 ) ) ( not ( = ?auto_337633 ?auto_337636 ) ) ( not ( = ?auto_337633 ?auto_337637 ) ) ( not ( = ?auto_337633 ?auto_337638 ) ) ( not ( = ?auto_337633 ?auto_337639 ) ) ( not ( = ?auto_337633 ?auto_337640 ) ) ( not ( = ?auto_337634 ?auto_337635 ) ) ( not ( = ?auto_337634 ?auto_337636 ) ) ( not ( = ?auto_337634 ?auto_337637 ) ) ( not ( = ?auto_337634 ?auto_337638 ) ) ( not ( = ?auto_337634 ?auto_337639 ) ) ( not ( = ?auto_337634 ?auto_337640 ) ) ( not ( = ?auto_337635 ?auto_337636 ) ) ( not ( = ?auto_337635 ?auto_337637 ) ) ( not ( = ?auto_337635 ?auto_337638 ) ) ( not ( = ?auto_337635 ?auto_337639 ) ) ( not ( = ?auto_337635 ?auto_337640 ) ) ( not ( = ?auto_337636 ?auto_337637 ) ) ( not ( = ?auto_337636 ?auto_337638 ) ) ( not ( = ?auto_337636 ?auto_337639 ) ) ( not ( = ?auto_337636 ?auto_337640 ) ) ( not ( = ?auto_337637 ?auto_337638 ) ) ( not ( = ?auto_337637 ?auto_337639 ) ) ( not ( = ?auto_337637 ?auto_337640 ) ) ( not ( = ?auto_337638 ?auto_337639 ) ) ( not ( = ?auto_337638 ?auto_337640 ) ) ( not ( = ?auto_337639 ?auto_337640 ) ) ( ON ?auto_337638 ?auto_337639 ) ( ON ?auto_337637 ?auto_337638 ) ( ON ?auto_337636 ?auto_337637 ) ( ON ?auto_337635 ?auto_337636 ) ( ON ?auto_337634 ?auto_337635 ) ( ON ?auto_337633 ?auto_337634 ) ( ON ?auto_337632 ?auto_337633 ) ( ON ?auto_337631 ?auto_337632 ) ( ON ?auto_337630 ?auto_337631 ) ( ON ?auto_337629 ?auto_337630 ) ( ON ?auto_337628 ?auto_337629 ) ( CLEAR ?auto_337628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_337628 )
      ( MAKE-12PILE ?auto_337628 ?auto_337629 ?auto_337630 ?auto_337631 ?auto_337632 ?auto_337633 ?auto_337634 ?auto_337635 ?auto_337636 ?auto_337637 ?auto_337638 ?auto_337639 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_337679 - BLOCK
      ?auto_337680 - BLOCK
      ?auto_337681 - BLOCK
      ?auto_337682 - BLOCK
      ?auto_337683 - BLOCK
      ?auto_337684 - BLOCK
      ?auto_337685 - BLOCK
      ?auto_337686 - BLOCK
      ?auto_337687 - BLOCK
      ?auto_337688 - BLOCK
      ?auto_337689 - BLOCK
      ?auto_337690 - BLOCK
      ?auto_337691 - BLOCK
    )
    :vars
    (
      ?auto_337692 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_337690 ) ( ON ?auto_337691 ?auto_337692 ) ( CLEAR ?auto_337691 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_337679 ) ( ON ?auto_337680 ?auto_337679 ) ( ON ?auto_337681 ?auto_337680 ) ( ON ?auto_337682 ?auto_337681 ) ( ON ?auto_337683 ?auto_337682 ) ( ON ?auto_337684 ?auto_337683 ) ( ON ?auto_337685 ?auto_337684 ) ( ON ?auto_337686 ?auto_337685 ) ( ON ?auto_337687 ?auto_337686 ) ( ON ?auto_337688 ?auto_337687 ) ( ON ?auto_337689 ?auto_337688 ) ( ON ?auto_337690 ?auto_337689 ) ( not ( = ?auto_337679 ?auto_337680 ) ) ( not ( = ?auto_337679 ?auto_337681 ) ) ( not ( = ?auto_337679 ?auto_337682 ) ) ( not ( = ?auto_337679 ?auto_337683 ) ) ( not ( = ?auto_337679 ?auto_337684 ) ) ( not ( = ?auto_337679 ?auto_337685 ) ) ( not ( = ?auto_337679 ?auto_337686 ) ) ( not ( = ?auto_337679 ?auto_337687 ) ) ( not ( = ?auto_337679 ?auto_337688 ) ) ( not ( = ?auto_337679 ?auto_337689 ) ) ( not ( = ?auto_337679 ?auto_337690 ) ) ( not ( = ?auto_337679 ?auto_337691 ) ) ( not ( = ?auto_337679 ?auto_337692 ) ) ( not ( = ?auto_337680 ?auto_337681 ) ) ( not ( = ?auto_337680 ?auto_337682 ) ) ( not ( = ?auto_337680 ?auto_337683 ) ) ( not ( = ?auto_337680 ?auto_337684 ) ) ( not ( = ?auto_337680 ?auto_337685 ) ) ( not ( = ?auto_337680 ?auto_337686 ) ) ( not ( = ?auto_337680 ?auto_337687 ) ) ( not ( = ?auto_337680 ?auto_337688 ) ) ( not ( = ?auto_337680 ?auto_337689 ) ) ( not ( = ?auto_337680 ?auto_337690 ) ) ( not ( = ?auto_337680 ?auto_337691 ) ) ( not ( = ?auto_337680 ?auto_337692 ) ) ( not ( = ?auto_337681 ?auto_337682 ) ) ( not ( = ?auto_337681 ?auto_337683 ) ) ( not ( = ?auto_337681 ?auto_337684 ) ) ( not ( = ?auto_337681 ?auto_337685 ) ) ( not ( = ?auto_337681 ?auto_337686 ) ) ( not ( = ?auto_337681 ?auto_337687 ) ) ( not ( = ?auto_337681 ?auto_337688 ) ) ( not ( = ?auto_337681 ?auto_337689 ) ) ( not ( = ?auto_337681 ?auto_337690 ) ) ( not ( = ?auto_337681 ?auto_337691 ) ) ( not ( = ?auto_337681 ?auto_337692 ) ) ( not ( = ?auto_337682 ?auto_337683 ) ) ( not ( = ?auto_337682 ?auto_337684 ) ) ( not ( = ?auto_337682 ?auto_337685 ) ) ( not ( = ?auto_337682 ?auto_337686 ) ) ( not ( = ?auto_337682 ?auto_337687 ) ) ( not ( = ?auto_337682 ?auto_337688 ) ) ( not ( = ?auto_337682 ?auto_337689 ) ) ( not ( = ?auto_337682 ?auto_337690 ) ) ( not ( = ?auto_337682 ?auto_337691 ) ) ( not ( = ?auto_337682 ?auto_337692 ) ) ( not ( = ?auto_337683 ?auto_337684 ) ) ( not ( = ?auto_337683 ?auto_337685 ) ) ( not ( = ?auto_337683 ?auto_337686 ) ) ( not ( = ?auto_337683 ?auto_337687 ) ) ( not ( = ?auto_337683 ?auto_337688 ) ) ( not ( = ?auto_337683 ?auto_337689 ) ) ( not ( = ?auto_337683 ?auto_337690 ) ) ( not ( = ?auto_337683 ?auto_337691 ) ) ( not ( = ?auto_337683 ?auto_337692 ) ) ( not ( = ?auto_337684 ?auto_337685 ) ) ( not ( = ?auto_337684 ?auto_337686 ) ) ( not ( = ?auto_337684 ?auto_337687 ) ) ( not ( = ?auto_337684 ?auto_337688 ) ) ( not ( = ?auto_337684 ?auto_337689 ) ) ( not ( = ?auto_337684 ?auto_337690 ) ) ( not ( = ?auto_337684 ?auto_337691 ) ) ( not ( = ?auto_337684 ?auto_337692 ) ) ( not ( = ?auto_337685 ?auto_337686 ) ) ( not ( = ?auto_337685 ?auto_337687 ) ) ( not ( = ?auto_337685 ?auto_337688 ) ) ( not ( = ?auto_337685 ?auto_337689 ) ) ( not ( = ?auto_337685 ?auto_337690 ) ) ( not ( = ?auto_337685 ?auto_337691 ) ) ( not ( = ?auto_337685 ?auto_337692 ) ) ( not ( = ?auto_337686 ?auto_337687 ) ) ( not ( = ?auto_337686 ?auto_337688 ) ) ( not ( = ?auto_337686 ?auto_337689 ) ) ( not ( = ?auto_337686 ?auto_337690 ) ) ( not ( = ?auto_337686 ?auto_337691 ) ) ( not ( = ?auto_337686 ?auto_337692 ) ) ( not ( = ?auto_337687 ?auto_337688 ) ) ( not ( = ?auto_337687 ?auto_337689 ) ) ( not ( = ?auto_337687 ?auto_337690 ) ) ( not ( = ?auto_337687 ?auto_337691 ) ) ( not ( = ?auto_337687 ?auto_337692 ) ) ( not ( = ?auto_337688 ?auto_337689 ) ) ( not ( = ?auto_337688 ?auto_337690 ) ) ( not ( = ?auto_337688 ?auto_337691 ) ) ( not ( = ?auto_337688 ?auto_337692 ) ) ( not ( = ?auto_337689 ?auto_337690 ) ) ( not ( = ?auto_337689 ?auto_337691 ) ) ( not ( = ?auto_337689 ?auto_337692 ) ) ( not ( = ?auto_337690 ?auto_337691 ) ) ( not ( = ?auto_337690 ?auto_337692 ) ) ( not ( = ?auto_337691 ?auto_337692 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_337691 ?auto_337692 )
      ( !STACK ?auto_337691 ?auto_337690 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_337733 - BLOCK
      ?auto_337734 - BLOCK
      ?auto_337735 - BLOCK
      ?auto_337736 - BLOCK
      ?auto_337737 - BLOCK
      ?auto_337738 - BLOCK
      ?auto_337739 - BLOCK
      ?auto_337740 - BLOCK
      ?auto_337741 - BLOCK
      ?auto_337742 - BLOCK
      ?auto_337743 - BLOCK
      ?auto_337744 - BLOCK
      ?auto_337745 - BLOCK
    )
    :vars
    (
      ?auto_337746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337745 ?auto_337746 ) ( ON-TABLE ?auto_337733 ) ( ON ?auto_337734 ?auto_337733 ) ( ON ?auto_337735 ?auto_337734 ) ( ON ?auto_337736 ?auto_337735 ) ( ON ?auto_337737 ?auto_337736 ) ( ON ?auto_337738 ?auto_337737 ) ( ON ?auto_337739 ?auto_337738 ) ( ON ?auto_337740 ?auto_337739 ) ( ON ?auto_337741 ?auto_337740 ) ( ON ?auto_337742 ?auto_337741 ) ( ON ?auto_337743 ?auto_337742 ) ( not ( = ?auto_337733 ?auto_337734 ) ) ( not ( = ?auto_337733 ?auto_337735 ) ) ( not ( = ?auto_337733 ?auto_337736 ) ) ( not ( = ?auto_337733 ?auto_337737 ) ) ( not ( = ?auto_337733 ?auto_337738 ) ) ( not ( = ?auto_337733 ?auto_337739 ) ) ( not ( = ?auto_337733 ?auto_337740 ) ) ( not ( = ?auto_337733 ?auto_337741 ) ) ( not ( = ?auto_337733 ?auto_337742 ) ) ( not ( = ?auto_337733 ?auto_337743 ) ) ( not ( = ?auto_337733 ?auto_337744 ) ) ( not ( = ?auto_337733 ?auto_337745 ) ) ( not ( = ?auto_337733 ?auto_337746 ) ) ( not ( = ?auto_337734 ?auto_337735 ) ) ( not ( = ?auto_337734 ?auto_337736 ) ) ( not ( = ?auto_337734 ?auto_337737 ) ) ( not ( = ?auto_337734 ?auto_337738 ) ) ( not ( = ?auto_337734 ?auto_337739 ) ) ( not ( = ?auto_337734 ?auto_337740 ) ) ( not ( = ?auto_337734 ?auto_337741 ) ) ( not ( = ?auto_337734 ?auto_337742 ) ) ( not ( = ?auto_337734 ?auto_337743 ) ) ( not ( = ?auto_337734 ?auto_337744 ) ) ( not ( = ?auto_337734 ?auto_337745 ) ) ( not ( = ?auto_337734 ?auto_337746 ) ) ( not ( = ?auto_337735 ?auto_337736 ) ) ( not ( = ?auto_337735 ?auto_337737 ) ) ( not ( = ?auto_337735 ?auto_337738 ) ) ( not ( = ?auto_337735 ?auto_337739 ) ) ( not ( = ?auto_337735 ?auto_337740 ) ) ( not ( = ?auto_337735 ?auto_337741 ) ) ( not ( = ?auto_337735 ?auto_337742 ) ) ( not ( = ?auto_337735 ?auto_337743 ) ) ( not ( = ?auto_337735 ?auto_337744 ) ) ( not ( = ?auto_337735 ?auto_337745 ) ) ( not ( = ?auto_337735 ?auto_337746 ) ) ( not ( = ?auto_337736 ?auto_337737 ) ) ( not ( = ?auto_337736 ?auto_337738 ) ) ( not ( = ?auto_337736 ?auto_337739 ) ) ( not ( = ?auto_337736 ?auto_337740 ) ) ( not ( = ?auto_337736 ?auto_337741 ) ) ( not ( = ?auto_337736 ?auto_337742 ) ) ( not ( = ?auto_337736 ?auto_337743 ) ) ( not ( = ?auto_337736 ?auto_337744 ) ) ( not ( = ?auto_337736 ?auto_337745 ) ) ( not ( = ?auto_337736 ?auto_337746 ) ) ( not ( = ?auto_337737 ?auto_337738 ) ) ( not ( = ?auto_337737 ?auto_337739 ) ) ( not ( = ?auto_337737 ?auto_337740 ) ) ( not ( = ?auto_337737 ?auto_337741 ) ) ( not ( = ?auto_337737 ?auto_337742 ) ) ( not ( = ?auto_337737 ?auto_337743 ) ) ( not ( = ?auto_337737 ?auto_337744 ) ) ( not ( = ?auto_337737 ?auto_337745 ) ) ( not ( = ?auto_337737 ?auto_337746 ) ) ( not ( = ?auto_337738 ?auto_337739 ) ) ( not ( = ?auto_337738 ?auto_337740 ) ) ( not ( = ?auto_337738 ?auto_337741 ) ) ( not ( = ?auto_337738 ?auto_337742 ) ) ( not ( = ?auto_337738 ?auto_337743 ) ) ( not ( = ?auto_337738 ?auto_337744 ) ) ( not ( = ?auto_337738 ?auto_337745 ) ) ( not ( = ?auto_337738 ?auto_337746 ) ) ( not ( = ?auto_337739 ?auto_337740 ) ) ( not ( = ?auto_337739 ?auto_337741 ) ) ( not ( = ?auto_337739 ?auto_337742 ) ) ( not ( = ?auto_337739 ?auto_337743 ) ) ( not ( = ?auto_337739 ?auto_337744 ) ) ( not ( = ?auto_337739 ?auto_337745 ) ) ( not ( = ?auto_337739 ?auto_337746 ) ) ( not ( = ?auto_337740 ?auto_337741 ) ) ( not ( = ?auto_337740 ?auto_337742 ) ) ( not ( = ?auto_337740 ?auto_337743 ) ) ( not ( = ?auto_337740 ?auto_337744 ) ) ( not ( = ?auto_337740 ?auto_337745 ) ) ( not ( = ?auto_337740 ?auto_337746 ) ) ( not ( = ?auto_337741 ?auto_337742 ) ) ( not ( = ?auto_337741 ?auto_337743 ) ) ( not ( = ?auto_337741 ?auto_337744 ) ) ( not ( = ?auto_337741 ?auto_337745 ) ) ( not ( = ?auto_337741 ?auto_337746 ) ) ( not ( = ?auto_337742 ?auto_337743 ) ) ( not ( = ?auto_337742 ?auto_337744 ) ) ( not ( = ?auto_337742 ?auto_337745 ) ) ( not ( = ?auto_337742 ?auto_337746 ) ) ( not ( = ?auto_337743 ?auto_337744 ) ) ( not ( = ?auto_337743 ?auto_337745 ) ) ( not ( = ?auto_337743 ?auto_337746 ) ) ( not ( = ?auto_337744 ?auto_337745 ) ) ( not ( = ?auto_337744 ?auto_337746 ) ) ( not ( = ?auto_337745 ?auto_337746 ) ) ( CLEAR ?auto_337743 ) ( ON ?auto_337744 ?auto_337745 ) ( CLEAR ?auto_337744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_337733 ?auto_337734 ?auto_337735 ?auto_337736 ?auto_337737 ?auto_337738 ?auto_337739 ?auto_337740 ?auto_337741 ?auto_337742 ?auto_337743 ?auto_337744 )
      ( MAKE-13PILE ?auto_337733 ?auto_337734 ?auto_337735 ?auto_337736 ?auto_337737 ?auto_337738 ?auto_337739 ?auto_337740 ?auto_337741 ?auto_337742 ?auto_337743 ?auto_337744 ?auto_337745 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_337787 - BLOCK
      ?auto_337788 - BLOCK
      ?auto_337789 - BLOCK
      ?auto_337790 - BLOCK
      ?auto_337791 - BLOCK
      ?auto_337792 - BLOCK
      ?auto_337793 - BLOCK
      ?auto_337794 - BLOCK
      ?auto_337795 - BLOCK
      ?auto_337796 - BLOCK
      ?auto_337797 - BLOCK
      ?auto_337798 - BLOCK
      ?auto_337799 - BLOCK
    )
    :vars
    (
      ?auto_337800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337799 ?auto_337800 ) ( ON-TABLE ?auto_337787 ) ( ON ?auto_337788 ?auto_337787 ) ( ON ?auto_337789 ?auto_337788 ) ( ON ?auto_337790 ?auto_337789 ) ( ON ?auto_337791 ?auto_337790 ) ( ON ?auto_337792 ?auto_337791 ) ( ON ?auto_337793 ?auto_337792 ) ( ON ?auto_337794 ?auto_337793 ) ( ON ?auto_337795 ?auto_337794 ) ( ON ?auto_337796 ?auto_337795 ) ( not ( = ?auto_337787 ?auto_337788 ) ) ( not ( = ?auto_337787 ?auto_337789 ) ) ( not ( = ?auto_337787 ?auto_337790 ) ) ( not ( = ?auto_337787 ?auto_337791 ) ) ( not ( = ?auto_337787 ?auto_337792 ) ) ( not ( = ?auto_337787 ?auto_337793 ) ) ( not ( = ?auto_337787 ?auto_337794 ) ) ( not ( = ?auto_337787 ?auto_337795 ) ) ( not ( = ?auto_337787 ?auto_337796 ) ) ( not ( = ?auto_337787 ?auto_337797 ) ) ( not ( = ?auto_337787 ?auto_337798 ) ) ( not ( = ?auto_337787 ?auto_337799 ) ) ( not ( = ?auto_337787 ?auto_337800 ) ) ( not ( = ?auto_337788 ?auto_337789 ) ) ( not ( = ?auto_337788 ?auto_337790 ) ) ( not ( = ?auto_337788 ?auto_337791 ) ) ( not ( = ?auto_337788 ?auto_337792 ) ) ( not ( = ?auto_337788 ?auto_337793 ) ) ( not ( = ?auto_337788 ?auto_337794 ) ) ( not ( = ?auto_337788 ?auto_337795 ) ) ( not ( = ?auto_337788 ?auto_337796 ) ) ( not ( = ?auto_337788 ?auto_337797 ) ) ( not ( = ?auto_337788 ?auto_337798 ) ) ( not ( = ?auto_337788 ?auto_337799 ) ) ( not ( = ?auto_337788 ?auto_337800 ) ) ( not ( = ?auto_337789 ?auto_337790 ) ) ( not ( = ?auto_337789 ?auto_337791 ) ) ( not ( = ?auto_337789 ?auto_337792 ) ) ( not ( = ?auto_337789 ?auto_337793 ) ) ( not ( = ?auto_337789 ?auto_337794 ) ) ( not ( = ?auto_337789 ?auto_337795 ) ) ( not ( = ?auto_337789 ?auto_337796 ) ) ( not ( = ?auto_337789 ?auto_337797 ) ) ( not ( = ?auto_337789 ?auto_337798 ) ) ( not ( = ?auto_337789 ?auto_337799 ) ) ( not ( = ?auto_337789 ?auto_337800 ) ) ( not ( = ?auto_337790 ?auto_337791 ) ) ( not ( = ?auto_337790 ?auto_337792 ) ) ( not ( = ?auto_337790 ?auto_337793 ) ) ( not ( = ?auto_337790 ?auto_337794 ) ) ( not ( = ?auto_337790 ?auto_337795 ) ) ( not ( = ?auto_337790 ?auto_337796 ) ) ( not ( = ?auto_337790 ?auto_337797 ) ) ( not ( = ?auto_337790 ?auto_337798 ) ) ( not ( = ?auto_337790 ?auto_337799 ) ) ( not ( = ?auto_337790 ?auto_337800 ) ) ( not ( = ?auto_337791 ?auto_337792 ) ) ( not ( = ?auto_337791 ?auto_337793 ) ) ( not ( = ?auto_337791 ?auto_337794 ) ) ( not ( = ?auto_337791 ?auto_337795 ) ) ( not ( = ?auto_337791 ?auto_337796 ) ) ( not ( = ?auto_337791 ?auto_337797 ) ) ( not ( = ?auto_337791 ?auto_337798 ) ) ( not ( = ?auto_337791 ?auto_337799 ) ) ( not ( = ?auto_337791 ?auto_337800 ) ) ( not ( = ?auto_337792 ?auto_337793 ) ) ( not ( = ?auto_337792 ?auto_337794 ) ) ( not ( = ?auto_337792 ?auto_337795 ) ) ( not ( = ?auto_337792 ?auto_337796 ) ) ( not ( = ?auto_337792 ?auto_337797 ) ) ( not ( = ?auto_337792 ?auto_337798 ) ) ( not ( = ?auto_337792 ?auto_337799 ) ) ( not ( = ?auto_337792 ?auto_337800 ) ) ( not ( = ?auto_337793 ?auto_337794 ) ) ( not ( = ?auto_337793 ?auto_337795 ) ) ( not ( = ?auto_337793 ?auto_337796 ) ) ( not ( = ?auto_337793 ?auto_337797 ) ) ( not ( = ?auto_337793 ?auto_337798 ) ) ( not ( = ?auto_337793 ?auto_337799 ) ) ( not ( = ?auto_337793 ?auto_337800 ) ) ( not ( = ?auto_337794 ?auto_337795 ) ) ( not ( = ?auto_337794 ?auto_337796 ) ) ( not ( = ?auto_337794 ?auto_337797 ) ) ( not ( = ?auto_337794 ?auto_337798 ) ) ( not ( = ?auto_337794 ?auto_337799 ) ) ( not ( = ?auto_337794 ?auto_337800 ) ) ( not ( = ?auto_337795 ?auto_337796 ) ) ( not ( = ?auto_337795 ?auto_337797 ) ) ( not ( = ?auto_337795 ?auto_337798 ) ) ( not ( = ?auto_337795 ?auto_337799 ) ) ( not ( = ?auto_337795 ?auto_337800 ) ) ( not ( = ?auto_337796 ?auto_337797 ) ) ( not ( = ?auto_337796 ?auto_337798 ) ) ( not ( = ?auto_337796 ?auto_337799 ) ) ( not ( = ?auto_337796 ?auto_337800 ) ) ( not ( = ?auto_337797 ?auto_337798 ) ) ( not ( = ?auto_337797 ?auto_337799 ) ) ( not ( = ?auto_337797 ?auto_337800 ) ) ( not ( = ?auto_337798 ?auto_337799 ) ) ( not ( = ?auto_337798 ?auto_337800 ) ) ( not ( = ?auto_337799 ?auto_337800 ) ) ( ON ?auto_337798 ?auto_337799 ) ( CLEAR ?auto_337796 ) ( ON ?auto_337797 ?auto_337798 ) ( CLEAR ?auto_337797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_337787 ?auto_337788 ?auto_337789 ?auto_337790 ?auto_337791 ?auto_337792 ?auto_337793 ?auto_337794 ?auto_337795 ?auto_337796 ?auto_337797 )
      ( MAKE-13PILE ?auto_337787 ?auto_337788 ?auto_337789 ?auto_337790 ?auto_337791 ?auto_337792 ?auto_337793 ?auto_337794 ?auto_337795 ?auto_337796 ?auto_337797 ?auto_337798 ?auto_337799 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_337841 - BLOCK
      ?auto_337842 - BLOCK
      ?auto_337843 - BLOCK
      ?auto_337844 - BLOCK
      ?auto_337845 - BLOCK
      ?auto_337846 - BLOCK
      ?auto_337847 - BLOCK
      ?auto_337848 - BLOCK
      ?auto_337849 - BLOCK
      ?auto_337850 - BLOCK
      ?auto_337851 - BLOCK
      ?auto_337852 - BLOCK
      ?auto_337853 - BLOCK
    )
    :vars
    (
      ?auto_337854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337853 ?auto_337854 ) ( ON-TABLE ?auto_337841 ) ( ON ?auto_337842 ?auto_337841 ) ( ON ?auto_337843 ?auto_337842 ) ( ON ?auto_337844 ?auto_337843 ) ( ON ?auto_337845 ?auto_337844 ) ( ON ?auto_337846 ?auto_337845 ) ( ON ?auto_337847 ?auto_337846 ) ( ON ?auto_337848 ?auto_337847 ) ( ON ?auto_337849 ?auto_337848 ) ( not ( = ?auto_337841 ?auto_337842 ) ) ( not ( = ?auto_337841 ?auto_337843 ) ) ( not ( = ?auto_337841 ?auto_337844 ) ) ( not ( = ?auto_337841 ?auto_337845 ) ) ( not ( = ?auto_337841 ?auto_337846 ) ) ( not ( = ?auto_337841 ?auto_337847 ) ) ( not ( = ?auto_337841 ?auto_337848 ) ) ( not ( = ?auto_337841 ?auto_337849 ) ) ( not ( = ?auto_337841 ?auto_337850 ) ) ( not ( = ?auto_337841 ?auto_337851 ) ) ( not ( = ?auto_337841 ?auto_337852 ) ) ( not ( = ?auto_337841 ?auto_337853 ) ) ( not ( = ?auto_337841 ?auto_337854 ) ) ( not ( = ?auto_337842 ?auto_337843 ) ) ( not ( = ?auto_337842 ?auto_337844 ) ) ( not ( = ?auto_337842 ?auto_337845 ) ) ( not ( = ?auto_337842 ?auto_337846 ) ) ( not ( = ?auto_337842 ?auto_337847 ) ) ( not ( = ?auto_337842 ?auto_337848 ) ) ( not ( = ?auto_337842 ?auto_337849 ) ) ( not ( = ?auto_337842 ?auto_337850 ) ) ( not ( = ?auto_337842 ?auto_337851 ) ) ( not ( = ?auto_337842 ?auto_337852 ) ) ( not ( = ?auto_337842 ?auto_337853 ) ) ( not ( = ?auto_337842 ?auto_337854 ) ) ( not ( = ?auto_337843 ?auto_337844 ) ) ( not ( = ?auto_337843 ?auto_337845 ) ) ( not ( = ?auto_337843 ?auto_337846 ) ) ( not ( = ?auto_337843 ?auto_337847 ) ) ( not ( = ?auto_337843 ?auto_337848 ) ) ( not ( = ?auto_337843 ?auto_337849 ) ) ( not ( = ?auto_337843 ?auto_337850 ) ) ( not ( = ?auto_337843 ?auto_337851 ) ) ( not ( = ?auto_337843 ?auto_337852 ) ) ( not ( = ?auto_337843 ?auto_337853 ) ) ( not ( = ?auto_337843 ?auto_337854 ) ) ( not ( = ?auto_337844 ?auto_337845 ) ) ( not ( = ?auto_337844 ?auto_337846 ) ) ( not ( = ?auto_337844 ?auto_337847 ) ) ( not ( = ?auto_337844 ?auto_337848 ) ) ( not ( = ?auto_337844 ?auto_337849 ) ) ( not ( = ?auto_337844 ?auto_337850 ) ) ( not ( = ?auto_337844 ?auto_337851 ) ) ( not ( = ?auto_337844 ?auto_337852 ) ) ( not ( = ?auto_337844 ?auto_337853 ) ) ( not ( = ?auto_337844 ?auto_337854 ) ) ( not ( = ?auto_337845 ?auto_337846 ) ) ( not ( = ?auto_337845 ?auto_337847 ) ) ( not ( = ?auto_337845 ?auto_337848 ) ) ( not ( = ?auto_337845 ?auto_337849 ) ) ( not ( = ?auto_337845 ?auto_337850 ) ) ( not ( = ?auto_337845 ?auto_337851 ) ) ( not ( = ?auto_337845 ?auto_337852 ) ) ( not ( = ?auto_337845 ?auto_337853 ) ) ( not ( = ?auto_337845 ?auto_337854 ) ) ( not ( = ?auto_337846 ?auto_337847 ) ) ( not ( = ?auto_337846 ?auto_337848 ) ) ( not ( = ?auto_337846 ?auto_337849 ) ) ( not ( = ?auto_337846 ?auto_337850 ) ) ( not ( = ?auto_337846 ?auto_337851 ) ) ( not ( = ?auto_337846 ?auto_337852 ) ) ( not ( = ?auto_337846 ?auto_337853 ) ) ( not ( = ?auto_337846 ?auto_337854 ) ) ( not ( = ?auto_337847 ?auto_337848 ) ) ( not ( = ?auto_337847 ?auto_337849 ) ) ( not ( = ?auto_337847 ?auto_337850 ) ) ( not ( = ?auto_337847 ?auto_337851 ) ) ( not ( = ?auto_337847 ?auto_337852 ) ) ( not ( = ?auto_337847 ?auto_337853 ) ) ( not ( = ?auto_337847 ?auto_337854 ) ) ( not ( = ?auto_337848 ?auto_337849 ) ) ( not ( = ?auto_337848 ?auto_337850 ) ) ( not ( = ?auto_337848 ?auto_337851 ) ) ( not ( = ?auto_337848 ?auto_337852 ) ) ( not ( = ?auto_337848 ?auto_337853 ) ) ( not ( = ?auto_337848 ?auto_337854 ) ) ( not ( = ?auto_337849 ?auto_337850 ) ) ( not ( = ?auto_337849 ?auto_337851 ) ) ( not ( = ?auto_337849 ?auto_337852 ) ) ( not ( = ?auto_337849 ?auto_337853 ) ) ( not ( = ?auto_337849 ?auto_337854 ) ) ( not ( = ?auto_337850 ?auto_337851 ) ) ( not ( = ?auto_337850 ?auto_337852 ) ) ( not ( = ?auto_337850 ?auto_337853 ) ) ( not ( = ?auto_337850 ?auto_337854 ) ) ( not ( = ?auto_337851 ?auto_337852 ) ) ( not ( = ?auto_337851 ?auto_337853 ) ) ( not ( = ?auto_337851 ?auto_337854 ) ) ( not ( = ?auto_337852 ?auto_337853 ) ) ( not ( = ?auto_337852 ?auto_337854 ) ) ( not ( = ?auto_337853 ?auto_337854 ) ) ( ON ?auto_337852 ?auto_337853 ) ( ON ?auto_337851 ?auto_337852 ) ( CLEAR ?auto_337849 ) ( ON ?auto_337850 ?auto_337851 ) ( CLEAR ?auto_337850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_337841 ?auto_337842 ?auto_337843 ?auto_337844 ?auto_337845 ?auto_337846 ?auto_337847 ?auto_337848 ?auto_337849 ?auto_337850 )
      ( MAKE-13PILE ?auto_337841 ?auto_337842 ?auto_337843 ?auto_337844 ?auto_337845 ?auto_337846 ?auto_337847 ?auto_337848 ?auto_337849 ?auto_337850 ?auto_337851 ?auto_337852 ?auto_337853 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_337895 - BLOCK
      ?auto_337896 - BLOCK
      ?auto_337897 - BLOCK
      ?auto_337898 - BLOCK
      ?auto_337899 - BLOCK
      ?auto_337900 - BLOCK
      ?auto_337901 - BLOCK
      ?auto_337902 - BLOCK
      ?auto_337903 - BLOCK
      ?auto_337904 - BLOCK
      ?auto_337905 - BLOCK
      ?auto_337906 - BLOCK
      ?auto_337907 - BLOCK
    )
    :vars
    (
      ?auto_337908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337907 ?auto_337908 ) ( ON-TABLE ?auto_337895 ) ( ON ?auto_337896 ?auto_337895 ) ( ON ?auto_337897 ?auto_337896 ) ( ON ?auto_337898 ?auto_337897 ) ( ON ?auto_337899 ?auto_337898 ) ( ON ?auto_337900 ?auto_337899 ) ( ON ?auto_337901 ?auto_337900 ) ( ON ?auto_337902 ?auto_337901 ) ( not ( = ?auto_337895 ?auto_337896 ) ) ( not ( = ?auto_337895 ?auto_337897 ) ) ( not ( = ?auto_337895 ?auto_337898 ) ) ( not ( = ?auto_337895 ?auto_337899 ) ) ( not ( = ?auto_337895 ?auto_337900 ) ) ( not ( = ?auto_337895 ?auto_337901 ) ) ( not ( = ?auto_337895 ?auto_337902 ) ) ( not ( = ?auto_337895 ?auto_337903 ) ) ( not ( = ?auto_337895 ?auto_337904 ) ) ( not ( = ?auto_337895 ?auto_337905 ) ) ( not ( = ?auto_337895 ?auto_337906 ) ) ( not ( = ?auto_337895 ?auto_337907 ) ) ( not ( = ?auto_337895 ?auto_337908 ) ) ( not ( = ?auto_337896 ?auto_337897 ) ) ( not ( = ?auto_337896 ?auto_337898 ) ) ( not ( = ?auto_337896 ?auto_337899 ) ) ( not ( = ?auto_337896 ?auto_337900 ) ) ( not ( = ?auto_337896 ?auto_337901 ) ) ( not ( = ?auto_337896 ?auto_337902 ) ) ( not ( = ?auto_337896 ?auto_337903 ) ) ( not ( = ?auto_337896 ?auto_337904 ) ) ( not ( = ?auto_337896 ?auto_337905 ) ) ( not ( = ?auto_337896 ?auto_337906 ) ) ( not ( = ?auto_337896 ?auto_337907 ) ) ( not ( = ?auto_337896 ?auto_337908 ) ) ( not ( = ?auto_337897 ?auto_337898 ) ) ( not ( = ?auto_337897 ?auto_337899 ) ) ( not ( = ?auto_337897 ?auto_337900 ) ) ( not ( = ?auto_337897 ?auto_337901 ) ) ( not ( = ?auto_337897 ?auto_337902 ) ) ( not ( = ?auto_337897 ?auto_337903 ) ) ( not ( = ?auto_337897 ?auto_337904 ) ) ( not ( = ?auto_337897 ?auto_337905 ) ) ( not ( = ?auto_337897 ?auto_337906 ) ) ( not ( = ?auto_337897 ?auto_337907 ) ) ( not ( = ?auto_337897 ?auto_337908 ) ) ( not ( = ?auto_337898 ?auto_337899 ) ) ( not ( = ?auto_337898 ?auto_337900 ) ) ( not ( = ?auto_337898 ?auto_337901 ) ) ( not ( = ?auto_337898 ?auto_337902 ) ) ( not ( = ?auto_337898 ?auto_337903 ) ) ( not ( = ?auto_337898 ?auto_337904 ) ) ( not ( = ?auto_337898 ?auto_337905 ) ) ( not ( = ?auto_337898 ?auto_337906 ) ) ( not ( = ?auto_337898 ?auto_337907 ) ) ( not ( = ?auto_337898 ?auto_337908 ) ) ( not ( = ?auto_337899 ?auto_337900 ) ) ( not ( = ?auto_337899 ?auto_337901 ) ) ( not ( = ?auto_337899 ?auto_337902 ) ) ( not ( = ?auto_337899 ?auto_337903 ) ) ( not ( = ?auto_337899 ?auto_337904 ) ) ( not ( = ?auto_337899 ?auto_337905 ) ) ( not ( = ?auto_337899 ?auto_337906 ) ) ( not ( = ?auto_337899 ?auto_337907 ) ) ( not ( = ?auto_337899 ?auto_337908 ) ) ( not ( = ?auto_337900 ?auto_337901 ) ) ( not ( = ?auto_337900 ?auto_337902 ) ) ( not ( = ?auto_337900 ?auto_337903 ) ) ( not ( = ?auto_337900 ?auto_337904 ) ) ( not ( = ?auto_337900 ?auto_337905 ) ) ( not ( = ?auto_337900 ?auto_337906 ) ) ( not ( = ?auto_337900 ?auto_337907 ) ) ( not ( = ?auto_337900 ?auto_337908 ) ) ( not ( = ?auto_337901 ?auto_337902 ) ) ( not ( = ?auto_337901 ?auto_337903 ) ) ( not ( = ?auto_337901 ?auto_337904 ) ) ( not ( = ?auto_337901 ?auto_337905 ) ) ( not ( = ?auto_337901 ?auto_337906 ) ) ( not ( = ?auto_337901 ?auto_337907 ) ) ( not ( = ?auto_337901 ?auto_337908 ) ) ( not ( = ?auto_337902 ?auto_337903 ) ) ( not ( = ?auto_337902 ?auto_337904 ) ) ( not ( = ?auto_337902 ?auto_337905 ) ) ( not ( = ?auto_337902 ?auto_337906 ) ) ( not ( = ?auto_337902 ?auto_337907 ) ) ( not ( = ?auto_337902 ?auto_337908 ) ) ( not ( = ?auto_337903 ?auto_337904 ) ) ( not ( = ?auto_337903 ?auto_337905 ) ) ( not ( = ?auto_337903 ?auto_337906 ) ) ( not ( = ?auto_337903 ?auto_337907 ) ) ( not ( = ?auto_337903 ?auto_337908 ) ) ( not ( = ?auto_337904 ?auto_337905 ) ) ( not ( = ?auto_337904 ?auto_337906 ) ) ( not ( = ?auto_337904 ?auto_337907 ) ) ( not ( = ?auto_337904 ?auto_337908 ) ) ( not ( = ?auto_337905 ?auto_337906 ) ) ( not ( = ?auto_337905 ?auto_337907 ) ) ( not ( = ?auto_337905 ?auto_337908 ) ) ( not ( = ?auto_337906 ?auto_337907 ) ) ( not ( = ?auto_337906 ?auto_337908 ) ) ( not ( = ?auto_337907 ?auto_337908 ) ) ( ON ?auto_337906 ?auto_337907 ) ( ON ?auto_337905 ?auto_337906 ) ( ON ?auto_337904 ?auto_337905 ) ( CLEAR ?auto_337902 ) ( ON ?auto_337903 ?auto_337904 ) ( CLEAR ?auto_337903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_337895 ?auto_337896 ?auto_337897 ?auto_337898 ?auto_337899 ?auto_337900 ?auto_337901 ?auto_337902 ?auto_337903 )
      ( MAKE-13PILE ?auto_337895 ?auto_337896 ?auto_337897 ?auto_337898 ?auto_337899 ?auto_337900 ?auto_337901 ?auto_337902 ?auto_337903 ?auto_337904 ?auto_337905 ?auto_337906 ?auto_337907 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_337949 - BLOCK
      ?auto_337950 - BLOCK
      ?auto_337951 - BLOCK
      ?auto_337952 - BLOCK
      ?auto_337953 - BLOCK
      ?auto_337954 - BLOCK
      ?auto_337955 - BLOCK
      ?auto_337956 - BLOCK
      ?auto_337957 - BLOCK
      ?auto_337958 - BLOCK
      ?auto_337959 - BLOCK
      ?auto_337960 - BLOCK
      ?auto_337961 - BLOCK
    )
    :vars
    (
      ?auto_337962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337961 ?auto_337962 ) ( ON-TABLE ?auto_337949 ) ( ON ?auto_337950 ?auto_337949 ) ( ON ?auto_337951 ?auto_337950 ) ( ON ?auto_337952 ?auto_337951 ) ( ON ?auto_337953 ?auto_337952 ) ( ON ?auto_337954 ?auto_337953 ) ( ON ?auto_337955 ?auto_337954 ) ( not ( = ?auto_337949 ?auto_337950 ) ) ( not ( = ?auto_337949 ?auto_337951 ) ) ( not ( = ?auto_337949 ?auto_337952 ) ) ( not ( = ?auto_337949 ?auto_337953 ) ) ( not ( = ?auto_337949 ?auto_337954 ) ) ( not ( = ?auto_337949 ?auto_337955 ) ) ( not ( = ?auto_337949 ?auto_337956 ) ) ( not ( = ?auto_337949 ?auto_337957 ) ) ( not ( = ?auto_337949 ?auto_337958 ) ) ( not ( = ?auto_337949 ?auto_337959 ) ) ( not ( = ?auto_337949 ?auto_337960 ) ) ( not ( = ?auto_337949 ?auto_337961 ) ) ( not ( = ?auto_337949 ?auto_337962 ) ) ( not ( = ?auto_337950 ?auto_337951 ) ) ( not ( = ?auto_337950 ?auto_337952 ) ) ( not ( = ?auto_337950 ?auto_337953 ) ) ( not ( = ?auto_337950 ?auto_337954 ) ) ( not ( = ?auto_337950 ?auto_337955 ) ) ( not ( = ?auto_337950 ?auto_337956 ) ) ( not ( = ?auto_337950 ?auto_337957 ) ) ( not ( = ?auto_337950 ?auto_337958 ) ) ( not ( = ?auto_337950 ?auto_337959 ) ) ( not ( = ?auto_337950 ?auto_337960 ) ) ( not ( = ?auto_337950 ?auto_337961 ) ) ( not ( = ?auto_337950 ?auto_337962 ) ) ( not ( = ?auto_337951 ?auto_337952 ) ) ( not ( = ?auto_337951 ?auto_337953 ) ) ( not ( = ?auto_337951 ?auto_337954 ) ) ( not ( = ?auto_337951 ?auto_337955 ) ) ( not ( = ?auto_337951 ?auto_337956 ) ) ( not ( = ?auto_337951 ?auto_337957 ) ) ( not ( = ?auto_337951 ?auto_337958 ) ) ( not ( = ?auto_337951 ?auto_337959 ) ) ( not ( = ?auto_337951 ?auto_337960 ) ) ( not ( = ?auto_337951 ?auto_337961 ) ) ( not ( = ?auto_337951 ?auto_337962 ) ) ( not ( = ?auto_337952 ?auto_337953 ) ) ( not ( = ?auto_337952 ?auto_337954 ) ) ( not ( = ?auto_337952 ?auto_337955 ) ) ( not ( = ?auto_337952 ?auto_337956 ) ) ( not ( = ?auto_337952 ?auto_337957 ) ) ( not ( = ?auto_337952 ?auto_337958 ) ) ( not ( = ?auto_337952 ?auto_337959 ) ) ( not ( = ?auto_337952 ?auto_337960 ) ) ( not ( = ?auto_337952 ?auto_337961 ) ) ( not ( = ?auto_337952 ?auto_337962 ) ) ( not ( = ?auto_337953 ?auto_337954 ) ) ( not ( = ?auto_337953 ?auto_337955 ) ) ( not ( = ?auto_337953 ?auto_337956 ) ) ( not ( = ?auto_337953 ?auto_337957 ) ) ( not ( = ?auto_337953 ?auto_337958 ) ) ( not ( = ?auto_337953 ?auto_337959 ) ) ( not ( = ?auto_337953 ?auto_337960 ) ) ( not ( = ?auto_337953 ?auto_337961 ) ) ( not ( = ?auto_337953 ?auto_337962 ) ) ( not ( = ?auto_337954 ?auto_337955 ) ) ( not ( = ?auto_337954 ?auto_337956 ) ) ( not ( = ?auto_337954 ?auto_337957 ) ) ( not ( = ?auto_337954 ?auto_337958 ) ) ( not ( = ?auto_337954 ?auto_337959 ) ) ( not ( = ?auto_337954 ?auto_337960 ) ) ( not ( = ?auto_337954 ?auto_337961 ) ) ( not ( = ?auto_337954 ?auto_337962 ) ) ( not ( = ?auto_337955 ?auto_337956 ) ) ( not ( = ?auto_337955 ?auto_337957 ) ) ( not ( = ?auto_337955 ?auto_337958 ) ) ( not ( = ?auto_337955 ?auto_337959 ) ) ( not ( = ?auto_337955 ?auto_337960 ) ) ( not ( = ?auto_337955 ?auto_337961 ) ) ( not ( = ?auto_337955 ?auto_337962 ) ) ( not ( = ?auto_337956 ?auto_337957 ) ) ( not ( = ?auto_337956 ?auto_337958 ) ) ( not ( = ?auto_337956 ?auto_337959 ) ) ( not ( = ?auto_337956 ?auto_337960 ) ) ( not ( = ?auto_337956 ?auto_337961 ) ) ( not ( = ?auto_337956 ?auto_337962 ) ) ( not ( = ?auto_337957 ?auto_337958 ) ) ( not ( = ?auto_337957 ?auto_337959 ) ) ( not ( = ?auto_337957 ?auto_337960 ) ) ( not ( = ?auto_337957 ?auto_337961 ) ) ( not ( = ?auto_337957 ?auto_337962 ) ) ( not ( = ?auto_337958 ?auto_337959 ) ) ( not ( = ?auto_337958 ?auto_337960 ) ) ( not ( = ?auto_337958 ?auto_337961 ) ) ( not ( = ?auto_337958 ?auto_337962 ) ) ( not ( = ?auto_337959 ?auto_337960 ) ) ( not ( = ?auto_337959 ?auto_337961 ) ) ( not ( = ?auto_337959 ?auto_337962 ) ) ( not ( = ?auto_337960 ?auto_337961 ) ) ( not ( = ?auto_337960 ?auto_337962 ) ) ( not ( = ?auto_337961 ?auto_337962 ) ) ( ON ?auto_337960 ?auto_337961 ) ( ON ?auto_337959 ?auto_337960 ) ( ON ?auto_337958 ?auto_337959 ) ( ON ?auto_337957 ?auto_337958 ) ( CLEAR ?auto_337955 ) ( ON ?auto_337956 ?auto_337957 ) ( CLEAR ?auto_337956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_337949 ?auto_337950 ?auto_337951 ?auto_337952 ?auto_337953 ?auto_337954 ?auto_337955 ?auto_337956 )
      ( MAKE-13PILE ?auto_337949 ?auto_337950 ?auto_337951 ?auto_337952 ?auto_337953 ?auto_337954 ?auto_337955 ?auto_337956 ?auto_337957 ?auto_337958 ?auto_337959 ?auto_337960 ?auto_337961 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_338003 - BLOCK
      ?auto_338004 - BLOCK
      ?auto_338005 - BLOCK
      ?auto_338006 - BLOCK
      ?auto_338007 - BLOCK
      ?auto_338008 - BLOCK
      ?auto_338009 - BLOCK
      ?auto_338010 - BLOCK
      ?auto_338011 - BLOCK
      ?auto_338012 - BLOCK
      ?auto_338013 - BLOCK
      ?auto_338014 - BLOCK
      ?auto_338015 - BLOCK
    )
    :vars
    (
      ?auto_338016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338015 ?auto_338016 ) ( ON-TABLE ?auto_338003 ) ( ON ?auto_338004 ?auto_338003 ) ( ON ?auto_338005 ?auto_338004 ) ( ON ?auto_338006 ?auto_338005 ) ( ON ?auto_338007 ?auto_338006 ) ( ON ?auto_338008 ?auto_338007 ) ( not ( = ?auto_338003 ?auto_338004 ) ) ( not ( = ?auto_338003 ?auto_338005 ) ) ( not ( = ?auto_338003 ?auto_338006 ) ) ( not ( = ?auto_338003 ?auto_338007 ) ) ( not ( = ?auto_338003 ?auto_338008 ) ) ( not ( = ?auto_338003 ?auto_338009 ) ) ( not ( = ?auto_338003 ?auto_338010 ) ) ( not ( = ?auto_338003 ?auto_338011 ) ) ( not ( = ?auto_338003 ?auto_338012 ) ) ( not ( = ?auto_338003 ?auto_338013 ) ) ( not ( = ?auto_338003 ?auto_338014 ) ) ( not ( = ?auto_338003 ?auto_338015 ) ) ( not ( = ?auto_338003 ?auto_338016 ) ) ( not ( = ?auto_338004 ?auto_338005 ) ) ( not ( = ?auto_338004 ?auto_338006 ) ) ( not ( = ?auto_338004 ?auto_338007 ) ) ( not ( = ?auto_338004 ?auto_338008 ) ) ( not ( = ?auto_338004 ?auto_338009 ) ) ( not ( = ?auto_338004 ?auto_338010 ) ) ( not ( = ?auto_338004 ?auto_338011 ) ) ( not ( = ?auto_338004 ?auto_338012 ) ) ( not ( = ?auto_338004 ?auto_338013 ) ) ( not ( = ?auto_338004 ?auto_338014 ) ) ( not ( = ?auto_338004 ?auto_338015 ) ) ( not ( = ?auto_338004 ?auto_338016 ) ) ( not ( = ?auto_338005 ?auto_338006 ) ) ( not ( = ?auto_338005 ?auto_338007 ) ) ( not ( = ?auto_338005 ?auto_338008 ) ) ( not ( = ?auto_338005 ?auto_338009 ) ) ( not ( = ?auto_338005 ?auto_338010 ) ) ( not ( = ?auto_338005 ?auto_338011 ) ) ( not ( = ?auto_338005 ?auto_338012 ) ) ( not ( = ?auto_338005 ?auto_338013 ) ) ( not ( = ?auto_338005 ?auto_338014 ) ) ( not ( = ?auto_338005 ?auto_338015 ) ) ( not ( = ?auto_338005 ?auto_338016 ) ) ( not ( = ?auto_338006 ?auto_338007 ) ) ( not ( = ?auto_338006 ?auto_338008 ) ) ( not ( = ?auto_338006 ?auto_338009 ) ) ( not ( = ?auto_338006 ?auto_338010 ) ) ( not ( = ?auto_338006 ?auto_338011 ) ) ( not ( = ?auto_338006 ?auto_338012 ) ) ( not ( = ?auto_338006 ?auto_338013 ) ) ( not ( = ?auto_338006 ?auto_338014 ) ) ( not ( = ?auto_338006 ?auto_338015 ) ) ( not ( = ?auto_338006 ?auto_338016 ) ) ( not ( = ?auto_338007 ?auto_338008 ) ) ( not ( = ?auto_338007 ?auto_338009 ) ) ( not ( = ?auto_338007 ?auto_338010 ) ) ( not ( = ?auto_338007 ?auto_338011 ) ) ( not ( = ?auto_338007 ?auto_338012 ) ) ( not ( = ?auto_338007 ?auto_338013 ) ) ( not ( = ?auto_338007 ?auto_338014 ) ) ( not ( = ?auto_338007 ?auto_338015 ) ) ( not ( = ?auto_338007 ?auto_338016 ) ) ( not ( = ?auto_338008 ?auto_338009 ) ) ( not ( = ?auto_338008 ?auto_338010 ) ) ( not ( = ?auto_338008 ?auto_338011 ) ) ( not ( = ?auto_338008 ?auto_338012 ) ) ( not ( = ?auto_338008 ?auto_338013 ) ) ( not ( = ?auto_338008 ?auto_338014 ) ) ( not ( = ?auto_338008 ?auto_338015 ) ) ( not ( = ?auto_338008 ?auto_338016 ) ) ( not ( = ?auto_338009 ?auto_338010 ) ) ( not ( = ?auto_338009 ?auto_338011 ) ) ( not ( = ?auto_338009 ?auto_338012 ) ) ( not ( = ?auto_338009 ?auto_338013 ) ) ( not ( = ?auto_338009 ?auto_338014 ) ) ( not ( = ?auto_338009 ?auto_338015 ) ) ( not ( = ?auto_338009 ?auto_338016 ) ) ( not ( = ?auto_338010 ?auto_338011 ) ) ( not ( = ?auto_338010 ?auto_338012 ) ) ( not ( = ?auto_338010 ?auto_338013 ) ) ( not ( = ?auto_338010 ?auto_338014 ) ) ( not ( = ?auto_338010 ?auto_338015 ) ) ( not ( = ?auto_338010 ?auto_338016 ) ) ( not ( = ?auto_338011 ?auto_338012 ) ) ( not ( = ?auto_338011 ?auto_338013 ) ) ( not ( = ?auto_338011 ?auto_338014 ) ) ( not ( = ?auto_338011 ?auto_338015 ) ) ( not ( = ?auto_338011 ?auto_338016 ) ) ( not ( = ?auto_338012 ?auto_338013 ) ) ( not ( = ?auto_338012 ?auto_338014 ) ) ( not ( = ?auto_338012 ?auto_338015 ) ) ( not ( = ?auto_338012 ?auto_338016 ) ) ( not ( = ?auto_338013 ?auto_338014 ) ) ( not ( = ?auto_338013 ?auto_338015 ) ) ( not ( = ?auto_338013 ?auto_338016 ) ) ( not ( = ?auto_338014 ?auto_338015 ) ) ( not ( = ?auto_338014 ?auto_338016 ) ) ( not ( = ?auto_338015 ?auto_338016 ) ) ( ON ?auto_338014 ?auto_338015 ) ( ON ?auto_338013 ?auto_338014 ) ( ON ?auto_338012 ?auto_338013 ) ( ON ?auto_338011 ?auto_338012 ) ( ON ?auto_338010 ?auto_338011 ) ( CLEAR ?auto_338008 ) ( ON ?auto_338009 ?auto_338010 ) ( CLEAR ?auto_338009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_338003 ?auto_338004 ?auto_338005 ?auto_338006 ?auto_338007 ?auto_338008 ?auto_338009 )
      ( MAKE-13PILE ?auto_338003 ?auto_338004 ?auto_338005 ?auto_338006 ?auto_338007 ?auto_338008 ?auto_338009 ?auto_338010 ?auto_338011 ?auto_338012 ?auto_338013 ?auto_338014 ?auto_338015 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_338057 - BLOCK
      ?auto_338058 - BLOCK
      ?auto_338059 - BLOCK
      ?auto_338060 - BLOCK
      ?auto_338061 - BLOCK
      ?auto_338062 - BLOCK
      ?auto_338063 - BLOCK
      ?auto_338064 - BLOCK
      ?auto_338065 - BLOCK
      ?auto_338066 - BLOCK
      ?auto_338067 - BLOCK
      ?auto_338068 - BLOCK
      ?auto_338069 - BLOCK
    )
    :vars
    (
      ?auto_338070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338069 ?auto_338070 ) ( ON-TABLE ?auto_338057 ) ( ON ?auto_338058 ?auto_338057 ) ( ON ?auto_338059 ?auto_338058 ) ( ON ?auto_338060 ?auto_338059 ) ( ON ?auto_338061 ?auto_338060 ) ( not ( = ?auto_338057 ?auto_338058 ) ) ( not ( = ?auto_338057 ?auto_338059 ) ) ( not ( = ?auto_338057 ?auto_338060 ) ) ( not ( = ?auto_338057 ?auto_338061 ) ) ( not ( = ?auto_338057 ?auto_338062 ) ) ( not ( = ?auto_338057 ?auto_338063 ) ) ( not ( = ?auto_338057 ?auto_338064 ) ) ( not ( = ?auto_338057 ?auto_338065 ) ) ( not ( = ?auto_338057 ?auto_338066 ) ) ( not ( = ?auto_338057 ?auto_338067 ) ) ( not ( = ?auto_338057 ?auto_338068 ) ) ( not ( = ?auto_338057 ?auto_338069 ) ) ( not ( = ?auto_338057 ?auto_338070 ) ) ( not ( = ?auto_338058 ?auto_338059 ) ) ( not ( = ?auto_338058 ?auto_338060 ) ) ( not ( = ?auto_338058 ?auto_338061 ) ) ( not ( = ?auto_338058 ?auto_338062 ) ) ( not ( = ?auto_338058 ?auto_338063 ) ) ( not ( = ?auto_338058 ?auto_338064 ) ) ( not ( = ?auto_338058 ?auto_338065 ) ) ( not ( = ?auto_338058 ?auto_338066 ) ) ( not ( = ?auto_338058 ?auto_338067 ) ) ( not ( = ?auto_338058 ?auto_338068 ) ) ( not ( = ?auto_338058 ?auto_338069 ) ) ( not ( = ?auto_338058 ?auto_338070 ) ) ( not ( = ?auto_338059 ?auto_338060 ) ) ( not ( = ?auto_338059 ?auto_338061 ) ) ( not ( = ?auto_338059 ?auto_338062 ) ) ( not ( = ?auto_338059 ?auto_338063 ) ) ( not ( = ?auto_338059 ?auto_338064 ) ) ( not ( = ?auto_338059 ?auto_338065 ) ) ( not ( = ?auto_338059 ?auto_338066 ) ) ( not ( = ?auto_338059 ?auto_338067 ) ) ( not ( = ?auto_338059 ?auto_338068 ) ) ( not ( = ?auto_338059 ?auto_338069 ) ) ( not ( = ?auto_338059 ?auto_338070 ) ) ( not ( = ?auto_338060 ?auto_338061 ) ) ( not ( = ?auto_338060 ?auto_338062 ) ) ( not ( = ?auto_338060 ?auto_338063 ) ) ( not ( = ?auto_338060 ?auto_338064 ) ) ( not ( = ?auto_338060 ?auto_338065 ) ) ( not ( = ?auto_338060 ?auto_338066 ) ) ( not ( = ?auto_338060 ?auto_338067 ) ) ( not ( = ?auto_338060 ?auto_338068 ) ) ( not ( = ?auto_338060 ?auto_338069 ) ) ( not ( = ?auto_338060 ?auto_338070 ) ) ( not ( = ?auto_338061 ?auto_338062 ) ) ( not ( = ?auto_338061 ?auto_338063 ) ) ( not ( = ?auto_338061 ?auto_338064 ) ) ( not ( = ?auto_338061 ?auto_338065 ) ) ( not ( = ?auto_338061 ?auto_338066 ) ) ( not ( = ?auto_338061 ?auto_338067 ) ) ( not ( = ?auto_338061 ?auto_338068 ) ) ( not ( = ?auto_338061 ?auto_338069 ) ) ( not ( = ?auto_338061 ?auto_338070 ) ) ( not ( = ?auto_338062 ?auto_338063 ) ) ( not ( = ?auto_338062 ?auto_338064 ) ) ( not ( = ?auto_338062 ?auto_338065 ) ) ( not ( = ?auto_338062 ?auto_338066 ) ) ( not ( = ?auto_338062 ?auto_338067 ) ) ( not ( = ?auto_338062 ?auto_338068 ) ) ( not ( = ?auto_338062 ?auto_338069 ) ) ( not ( = ?auto_338062 ?auto_338070 ) ) ( not ( = ?auto_338063 ?auto_338064 ) ) ( not ( = ?auto_338063 ?auto_338065 ) ) ( not ( = ?auto_338063 ?auto_338066 ) ) ( not ( = ?auto_338063 ?auto_338067 ) ) ( not ( = ?auto_338063 ?auto_338068 ) ) ( not ( = ?auto_338063 ?auto_338069 ) ) ( not ( = ?auto_338063 ?auto_338070 ) ) ( not ( = ?auto_338064 ?auto_338065 ) ) ( not ( = ?auto_338064 ?auto_338066 ) ) ( not ( = ?auto_338064 ?auto_338067 ) ) ( not ( = ?auto_338064 ?auto_338068 ) ) ( not ( = ?auto_338064 ?auto_338069 ) ) ( not ( = ?auto_338064 ?auto_338070 ) ) ( not ( = ?auto_338065 ?auto_338066 ) ) ( not ( = ?auto_338065 ?auto_338067 ) ) ( not ( = ?auto_338065 ?auto_338068 ) ) ( not ( = ?auto_338065 ?auto_338069 ) ) ( not ( = ?auto_338065 ?auto_338070 ) ) ( not ( = ?auto_338066 ?auto_338067 ) ) ( not ( = ?auto_338066 ?auto_338068 ) ) ( not ( = ?auto_338066 ?auto_338069 ) ) ( not ( = ?auto_338066 ?auto_338070 ) ) ( not ( = ?auto_338067 ?auto_338068 ) ) ( not ( = ?auto_338067 ?auto_338069 ) ) ( not ( = ?auto_338067 ?auto_338070 ) ) ( not ( = ?auto_338068 ?auto_338069 ) ) ( not ( = ?auto_338068 ?auto_338070 ) ) ( not ( = ?auto_338069 ?auto_338070 ) ) ( ON ?auto_338068 ?auto_338069 ) ( ON ?auto_338067 ?auto_338068 ) ( ON ?auto_338066 ?auto_338067 ) ( ON ?auto_338065 ?auto_338066 ) ( ON ?auto_338064 ?auto_338065 ) ( ON ?auto_338063 ?auto_338064 ) ( CLEAR ?auto_338061 ) ( ON ?auto_338062 ?auto_338063 ) ( CLEAR ?auto_338062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_338057 ?auto_338058 ?auto_338059 ?auto_338060 ?auto_338061 ?auto_338062 )
      ( MAKE-13PILE ?auto_338057 ?auto_338058 ?auto_338059 ?auto_338060 ?auto_338061 ?auto_338062 ?auto_338063 ?auto_338064 ?auto_338065 ?auto_338066 ?auto_338067 ?auto_338068 ?auto_338069 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_338111 - BLOCK
      ?auto_338112 - BLOCK
      ?auto_338113 - BLOCK
      ?auto_338114 - BLOCK
      ?auto_338115 - BLOCK
      ?auto_338116 - BLOCK
      ?auto_338117 - BLOCK
      ?auto_338118 - BLOCK
      ?auto_338119 - BLOCK
      ?auto_338120 - BLOCK
      ?auto_338121 - BLOCK
      ?auto_338122 - BLOCK
      ?auto_338123 - BLOCK
    )
    :vars
    (
      ?auto_338124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338123 ?auto_338124 ) ( ON-TABLE ?auto_338111 ) ( ON ?auto_338112 ?auto_338111 ) ( ON ?auto_338113 ?auto_338112 ) ( ON ?auto_338114 ?auto_338113 ) ( not ( = ?auto_338111 ?auto_338112 ) ) ( not ( = ?auto_338111 ?auto_338113 ) ) ( not ( = ?auto_338111 ?auto_338114 ) ) ( not ( = ?auto_338111 ?auto_338115 ) ) ( not ( = ?auto_338111 ?auto_338116 ) ) ( not ( = ?auto_338111 ?auto_338117 ) ) ( not ( = ?auto_338111 ?auto_338118 ) ) ( not ( = ?auto_338111 ?auto_338119 ) ) ( not ( = ?auto_338111 ?auto_338120 ) ) ( not ( = ?auto_338111 ?auto_338121 ) ) ( not ( = ?auto_338111 ?auto_338122 ) ) ( not ( = ?auto_338111 ?auto_338123 ) ) ( not ( = ?auto_338111 ?auto_338124 ) ) ( not ( = ?auto_338112 ?auto_338113 ) ) ( not ( = ?auto_338112 ?auto_338114 ) ) ( not ( = ?auto_338112 ?auto_338115 ) ) ( not ( = ?auto_338112 ?auto_338116 ) ) ( not ( = ?auto_338112 ?auto_338117 ) ) ( not ( = ?auto_338112 ?auto_338118 ) ) ( not ( = ?auto_338112 ?auto_338119 ) ) ( not ( = ?auto_338112 ?auto_338120 ) ) ( not ( = ?auto_338112 ?auto_338121 ) ) ( not ( = ?auto_338112 ?auto_338122 ) ) ( not ( = ?auto_338112 ?auto_338123 ) ) ( not ( = ?auto_338112 ?auto_338124 ) ) ( not ( = ?auto_338113 ?auto_338114 ) ) ( not ( = ?auto_338113 ?auto_338115 ) ) ( not ( = ?auto_338113 ?auto_338116 ) ) ( not ( = ?auto_338113 ?auto_338117 ) ) ( not ( = ?auto_338113 ?auto_338118 ) ) ( not ( = ?auto_338113 ?auto_338119 ) ) ( not ( = ?auto_338113 ?auto_338120 ) ) ( not ( = ?auto_338113 ?auto_338121 ) ) ( not ( = ?auto_338113 ?auto_338122 ) ) ( not ( = ?auto_338113 ?auto_338123 ) ) ( not ( = ?auto_338113 ?auto_338124 ) ) ( not ( = ?auto_338114 ?auto_338115 ) ) ( not ( = ?auto_338114 ?auto_338116 ) ) ( not ( = ?auto_338114 ?auto_338117 ) ) ( not ( = ?auto_338114 ?auto_338118 ) ) ( not ( = ?auto_338114 ?auto_338119 ) ) ( not ( = ?auto_338114 ?auto_338120 ) ) ( not ( = ?auto_338114 ?auto_338121 ) ) ( not ( = ?auto_338114 ?auto_338122 ) ) ( not ( = ?auto_338114 ?auto_338123 ) ) ( not ( = ?auto_338114 ?auto_338124 ) ) ( not ( = ?auto_338115 ?auto_338116 ) ) ( not ( = ?auto_338115 ?auto_338117 ) ) ( not ( = ?auto_338115 ?auto_338118 ) ) ( not ( = ?auto_338115 ?auto_338119 ) ) ( not ( = ?auto_338115 ?auto_338120 ) ) ( not ( = ?auto_338115 ?auto_338121 ) ) ( not ( = ?auto_338115 ?auto_338122 ) ) ( not ( = ?auto_338115 ?auto_338123 ) ) ( not ( = ?auto_338115 ?auto_338124 ) ) ( not ( = ?auto_338116 ?auto_338117 ) ) ( not ( = ?auto_338116 ?auto_338118 ) ) ( not ( = ?auto_338116 ?auto_338119 ) ) ( not ( = ?auto_338116 ?auto_338120 ) ) ( not ( = ?auto_338116 ?auto_338121 ) ) ( not ( = ?auto_338116 ?auto_338122 ) ) ( not ( = ?auto_338116 ?auto_338123 ) ) ( not ( = ?auto_338116 ?auto_338124 ) ) ( not ( = ?auto_338117 ?auto_338118 ) ) ( not ( = ?auto_338117 ?auto_338119 ) ) ( not ( = ?auto_338117 ?auto_338120 ) ) ( not ( = ?auto_338117 ?auto_338121 ) ) ( not ( = ?auto_338117 ?auto_338122 ) ) ( not ( = ?auto_338117 ?auto_338123 ) ) ( not ( = ?auto_338117 ?auto_338124 ) ) ( not ( = ?auto_338118 ?auto_338119 ) ) ( not ( = ?auto_338118 ?auto_338120 ) ) ( not ( = ?auto_338118 ?auto_338121 ) ) ( not ( = ?auto_338118 ?auto_338122 ) ) ( not ( = ?auto_338118 ?auto_338123 ) ) ( not ( = ?auto_338118 ?auto_338124 ) ) ( not ( = ?auto_338119 ?auto_338120 ) ) ( not ( = ?auto_338119 ?auto_338121 ) ) ( not ( = ?auto_338119 ?auto_338122 ) ) ( not ( = ?auto_338119 ?auto_338123 ) ) ( not ( = ?auto_338119 ?auto_338124 ) ) ( not ( = ?auto_338120 ?auto_338121 ) ) ( not ( = ?auto_338120 ?auto_338122 ) ) ( not ( = ?auto_338120 ?auto_338123 ) ) ( not ( = ?auto_338120 ?auto_338124 ) ) ( not ( = ?auto_338121 ?auto_338122 ) ) ( not ( = ?auto_338121 ?auto_338123 ) ) ( not ( = ?auto_338121 ?auto_338124 ) ) ( not ( = ?auto_338122 ?auto_338123 ) ) ( not ( = ?auto_338122 ?auto_338124 ) ) ( not ( = ?auto_338123 ?auto_338124 ) ) ( ON ?auto_338122 ?auto_338123 ) ( ON ?auto_338121 ?auto_338122 ) ( ON ?auto_338120 ?auto_338121 ) ( ON ?auto_338119 ?auto_338120 ) ( ON ?auto_338118 ?auto_338119 ) ( ON ?auto_338117 ?auto_338118 ) ( ON ?auto_338116 ?auto_338117 ) ( CLEAR ?auto_338114 ) ( ON ?auto_338115 ?auto_338116 ) ( CLEAR ?auto_338115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_338111 ?auto_338112 ?auto_338113 ?auto_338114 ?auto_338115 )
      ( MAKE-13PILE ?auto_338111 ?auto_338112 ?auto_338113 ?auto_338114 ?auto_338115 ?auto_338116 ?auto_338117 ?auto_338118 ?auto_338119 ?auto_338120 ?auto_338121 ?auto_338122 ?auto_338123 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_338165 - BLOCK
      ?auto_338166 - BLOCK
      ?auto_338167 - BLOCK
      ?auto_338168 - BLOCK
      ?auto_338169 - BLOCK
      ?auto_338170 - BLOCK
      ?auto_338171 - BLOCK
      ?auto_338172 - BLOCK
      ?auto_338173 - BLOCK
      ?auto_338174 - BLOCK
      ?auto_338175 - BLOCK
      ?auto_338176 - BLOCK
      ?auto_338177 - BLOCK
    )
    :vars
    (
      ?auto_338178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338177 ?auto_338178 ) ( ON-TABLE ?auto_338165 ) ( ON ?auto_338166 ?auto_338165 ) ( ON ?auto_338167 ?auto_338166 ) ( not ( = ?auto_338165 ?auto_338166 ) ) ( not ( = ?auto_338165 ?auto_338167 ) ) ( not ( = ?auto_338165 ?auto_338168 ) ) ( not ( = ?auto_338165 ?auto_338169 ) ) ( not ( = ?auto_338165 ?auto_338170 ) ) ( not ( = ?auto_338165 ?auto_338171 ) ) ( not ( = ?auto_338165 ?auto_338172 ) ) ( not ( = ?auto_338165 ?auto_338173 ) ) ( not ( = ?auto_338165 ?auto_338174 ) ) ( not ( = ?auto_338165 ?auto_338175 ) ) ( not ( = ?auto_338165 ?auto_338176 ) ) ( not ( = ?auto_338165 ?auto_338177 ) ) ( not ( = ?auto_338165 ?auto_338178 ) ) ( not ( = ?auto_338166 ?auto_338167 ) ) ( not ( = ?auto_338166 ?auto_338168 ) ) ( not ( = ?auto_338166 ?auto_338169 ) ) ( not ( = ?auto_338166 ?auto_338170 ) ) ( not ( = ?auto_338166 ?auto_338171 ) ) ( not ( = ?auto_338166 ?auto_338172 ) ) ( not ( = ?auto_338166 ?auto_338173 ) ) ( not ( = ?auto_338166 ?auto_338174 ) ) ( not ( = ?auto_338166 ?auto_338175 ) ) ( not ( = ?auto_338166 ?auto_338176 ) ) ( not ( = ?auto_338166 ?auto_338177 ) ) ( not ( = ?auto_338166 ?auto_338178 ) ) ( not ( = ?auto_338167 ?auto_338168 ) ) ( not ( = ?auto_338167 ?auto_338169 ) ) ( not ( = ?auto_338167 ?auto_338170 ) ) ( not ( = ?auto_338167 ?auto_338171 ) ) ( not ( = ?auto_338167 ?auto_338172 ) ) ( not ( = ?auto_338167 ?auto_338173 ) ) ( not ( = ?auto_338167 ?auto_338174 ) ) ( not ( = ?auto_338167 ?auto_338175 ) ) ( not ( = ?auto_338167 ?auto_338176 ) ) ( not ( = ?auto_338167 ?auto_338177 ) ) ( not ( = ?auto_338167 ?auto_338178 ) ) ( not ( = ?auto_338168 ?auto_338169 ) ) ( not ( = ?auto_338168 ?auto_338170 ) ) ( not ( = ?auto_338168 ?auto_338171 ) ) ( not ( = ?auto_338168 ?auto_338172 ) ) ( not ( = ?auto_338168 ?auto_338173 ) ) ( not ( = ?auto_338168 ?auto_338174 ) ) ( not ( = ?auto_338168 ?auto_338175 ) ) ( not ( = ?auto_338168 ?auto_338176 ) ) ( not ( = ?auto_338168 ?auto_338177 ) ) ( not ( = ?auto_338168 ?auto_338178 ) ) ( not ( = ?auto_338169 ?auto_338170 ) ) ( not ( = ?auto_338169 ?auto_338171 ) ) ( not ( = ?auto_338169 ?auto_338172 ) ) ( not ( = ?auto_338169 ?auto_338173 ) ) ( not ( = ?auto_338169 ?auto_338174 ) ) ( not ( = ?auto_338169 ?auto_338175 ) ) ( not ( = ?auto_338169 ?auto_338176 ) ) ( not ( = ?auto_338169 ?auto_338177 ) ) ( not ( = ?auto_338169 ?auto_338178 ) ) ( not ( = ?auto_338170 ?auto_338171 ) ) ( not ( = ?auto_338170 ?auto_338172 ) ) ( not ( = ?auto_338170 ?auto_338173 ) ) ( not ( = ?auto_338170 ?auto_338174 ) ) ( not ( = ?auto_338170 ?auto_338175 ) ) ( not ( = ?auto_338170 ?auto_338176 ) ) ( not ( = ?auto_338170 ?auto_338177 ) ) ( not ( = ?auto_338170 ?auto_338178 ) ) ( not ( = ?auto_338171 ?auto_338172 ) ) ( not ( = ?auto_338171 ?auto_338173 ) ) ( not ( = ?auto_338171 ?auto_338174 ) ) ( not ( = ?auto_338171 ?auto_338175 ) ) ( not ( = ?auto_338171 ?auto_338176 ) ) ( not ( = ?auto_338171 ?auto_338177 ) ) ( not ( = ?auto_338171 ?auto_338178 ) ) ( not ( = ?auto_338172 ?auto_338173 ) ) ( not ( = ?auto_338172 ?auto_338174 ) ) ( not ( = ?auto_338172 ?auto_338175 ) ) ( not ( = ?auto_338172 ?auto_338176 ) ) ( not ( = ?auto_338172 ?auto_338177 ) ) ( not ( = ?auto_338172 ?auto_338178 ) ) ( not ( = ?auto_338173 ?auto_338174 ) ) ( not ( = ?auto_338173 ?auto_338175 ) ) ( not ( = ?auto_338173 ?auto_338176 ) ) ( not ( = ?auto_338173 ?auto_338177 ) ) ( not ( = ?auto_338173 ?auto_338178 ) ) ( not ( = ?auto_338174 ?auto_338175 ) ) ( not ( = ?auto_338174 ?auto_338176 ) ) ( not ( = ?auto_338174 ?auto_338177 ) ) ( not ( = ?auto_338174 ?auto_338178 ) ) ( not ( = ?auto_338175 ?auto_338176 ) ) ( not ( = ?auto_338175 ?auto_338177 ) ) ( not ( = ?auto_338175 ?auto_338178 ) ) ( not ( = ?auto_338176 ?auto_338177 ) ) ( not ( = ?auto_338176 ?auto_338178 ) ) ( not ( = ?auto_338177 ?auto_338178 ) ) ( ON ?auto_338176 ?auto_338177 ) ( ON ?auto_338175 ?auto_338176 ) ( ON ?auto_338174 ?auto_338175 ) ( ON ?auto_338173 ?auto_338174 ) ( ON ?auto_338172 ?auto_338173 ) ( ON ?auto_338171 ?auto_338172 ) ( ON ?auto_338170 ?auto_338171 ) ( ON ?auto_338169 ?auto_338170 ) ( CLEAR ?auto_338167 ) ( ON ?auto_338168 ?auto_338169 ) ( CLEAR ?auto_338168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_338165 ?auto_338166 ?auto_338167 ?auto_338168 )
      ( MAKE-13PILE ?auto_338165 ?auto_338166 ?auto_338167 ?auto_338168 ?auto_338169 ?auto_338170 ?auto_338171 ?auto_338172 ?auto_338173 ?auto_338174 ?auto_338175 ?auto_338176 ?auto_338177 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_338219 - BLOCK
      ?auto_338220 - BLOCK
      ?auto_338221 - BLOCK
      ?auto_338222 - BLOCK
      ?auto_338223 - BLOCK
      ?auto_338224 - BLOCK
      ?auto_338225 - BLOCK
      ?auto_338226 - BLOCK
      ?auto_338227 - BLOCK
      ?auto_338228 - BLOCK
      ?auto_338229 - BLOCK
      ?auto_338230 - BLOCK
      ?auto_338231 - BLOCK
    )
    :vars
    (
      ?auto_338232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338231 ?auto_338232 ) ( ON-TABLE ?auto_338219 ) ( ON ?auto_338220 ?auto_338219 ) ( not ( = ?auto_338219 ?auto_338220 ) ) ( not ( = ?auto_338219 ?auto_338221 ) ) ( not ( = ?auto_338219 ?auto_338222 ) ) ( not ( = ?auto_338219 ?auto_338223 ) ) ( not ( = ?auto_338219 ?auto_338224 ) ) ( not ( = ?auto_338219 ?auto_338225 ) ) ( not ( = ?auto_338219 ?auto_338226 ) ) ( not ( = ?auto_338219 ?auto_338227 ) ) ( not ( = ?auto_338219 ?auto_338228 ) ) ( not ( = ?auto_338219 ?auto_338229 ) ) ( not ( = ?auto_338219 ?auto_338230 ) ) ( not ( = ?auto_338219 ?auto_338231 ) ) ( not ( = ?auto_338219 ?auto_338232 ) ) ( not ( = ?auto_338220 ?auto_338221 ) ) ( not ( = ?auto_338220 ?auto_338222 ) ) ( not ( = ?auto_338220 ?auto_338223 ) ) ( not ( = ?auto_338220 ?auto_338224 ) ) ( not ( = ?auto_338220 ?auto_338225 ) ) ( not ( = ?auto_338220 ?auto_338226 ) ) ( not ( = ?auto_338220 ?auto_338227 ) ) ( not ( = ?auto_338220 ?auto_338228 ) ) ( not ( = ?auto_338220 ?auto_338229 ) ) ( not ( = ?auto_338220 ?auto_338230 ) ) ( not ( = ?auto_338220 ?auto_338231 ) ) ( not ( = ?auto_338220 ?auto_338232 ) ) ( not ( = ?auto_338221 ?auto_338222 ) ) ( not ( = ?auto_338221 ?auto_338223 ) ) ( not ( = ?auto_338221 ?auto_338224 ) ) ( not ( = ?auto_338221 ?auto_338225 ) ) ( not ( = ?auto_338221 ?auto_338226 ) ) ( not ( = ?auto_338221 ?auto_338227 ) ) ( not ( = ?auto_338221 ?auto_338228 ) ) ( not ( = ?auto_338221 ?auto_338229 ) ) ( not ( = ?auto_338221 ?auto_338230 ) ) ( not ( = ?auto_338221 ?auto_338231 ) ) ( not ( = ?auto_338221 ?auto_338232 ) ) ( not ( = ?auto_338222 ?auto_338223 ) ) ( not ( = ?auto_338222 ?auto_338224 ) ) ( not ( = ?auto_338222 ?auto_338225 ) ) ( not ( = ?auto_338222 ?auto_338226 ) ) ( not ( = ?auto_338222 ?auto_338227 ) ) ( not ( = ?auto_338222 ?auto_338228 ) ) ( not ( = ?auto_338222 ?auto_338229 ) ) ( not ( = ?auto_338222 ?auto_338230 ) ) ( not ( = ?auto_338222 ?auto_338231 ) ) ( not ( = ?auto_338222 ?auto_338232 ) ) ( not ( = ?auto_338223 ?auto_338224 ) ) ( not ( = ?auto_338223 ?auto_338225 ) ) ( not ( = ?auto_338223 ?auto_338226 ) ) ( not ( = ?auto_338223 ?auto_338227 ) ) ( not ( = ?auto_338223 ?auto_338228 ) ) ( not ( = ?auto_338223 ?auto_338229 ) ) ( not ( = ?auto_338223 ?auto_338230 ) ) ( not ( = ?auto_338223 ?auto_338231 ) ) ( not ( = ?auto_338223 ?auto_338232 ) ) ( not ( = ?auto_338224 ?auto_338225 ) ) ( not ( = ?auto_338224 ?auto_338226 ) ) ( not ( = ?auto_338224 ?auto_338227 ) ) ( not ( = ?auto_338224 ?auto_338228 ) ) ( not ( = ?auto_338224 ?auto_338229 ) ) ( not ( = ?auto_338224 ?auto_338230 ) ) ( not ( = ?auto_338224 ?auto_338231 ) ) ( not ( = ?auto_338224 ?auto_338232 ) ) ( not ( = ?auto_338225 ?auto_338226 ) ) ( not ( = ?auto_338225 ?auto_338227 ) ) ( not ( = ?auto_338225 ?auto_338228 ) ) ( not ( = ?auto_338225 ?auto_338229 ) ) ( not ( = ?auto_338225 ?auto_338230 ) ) ( not ( = ?auto_338225 ?auto_338231 ) ) ( not ( = ?auto_338225 ?auto_338232 ) ) ( not ( = ?auto_338226 ?auto_338227 ) ) ( not ( = ?auto_338226 ?auto_338228 ) ) ( not ( = ?auto_338226 ?auto_338229 ) ) ( not ( = ?auto_338226 ?auto_338230 ) ) ( not ( = ?auto_338226 ?auto_338231 ) ) ( not ( = ?auto_338226 ?auto_338232 ) ) ( not ( = ?auto_338227 ?auto_338228 ) ) ( not ( = ?auto_338227 ?auto_338229 ) ) ( not ( = ?auto_338227 ?auto_338230 ) ) ( not ( = ?auto_338227 ?auto_338231 ) ) ( not ( = ?auto_338227 ?auto_338232 ) ) ( not ( = ?auto_338228 ?auto_338229 ) ) ( not ( = ?auto_338228 ?auto_338230 ) ) ( not ( = ?auto_338228 ?auto_338231 ) ) ( not ( = ?auto_338228 ?auto_338232 ) ) ( not ( = ?auto_338229 ?auto_338230 ) ) ( not ( = ?auto_338229 ?auto_338231 ) ) ( not ( = ?auto_338229 ?auto_338232 ) ) ( not ( = ?auto_338230 ?auto_338231 ) ) ( not ( = ?auto_338230 ?auto_338232 ) ) ( not ( = ?auto_338231 ?auto_338232 ) ) ( ON ?auto_338230 ?auto_338231 ) ( ON ?auto_338229 ?auto_338230 ) ( ON ?auto_338228 ?auto_338229 ) ( ON ?auto_338227 ?auto_338228 ) ( ON ?auto_338226 ?auto_338227 ) ( ON ?auto_338225 ?auto_338226 ) ( ON ?auto_338224 ?auto_338225 ) ( ON ?auto_338223 ?auto_338224 ) ( ON ?auto_338222 ?auto_338223 ) ( CLEAR ?auto_338220 ) ( ON ?auto_338221 ?auto_338222 ) ( CLEAR ?auto_338221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_338219 ?auto_338220 ?auto_338221 )
      ( MAKE-13PILE ?auto_338219 ?auto_338220 ?auto_338221 ?auto_338222 ?auto_338223 ?auto_338224 ?auto_338225 ?auto_338226 ?auto_338227 ?auto_338228 ?auto_338229 ?auto_338230 ?auto_338231 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_338273 - BLOCK
      ?auto_338274 - BLOCK
      ?auto_338275 - BLOCK
      ?auto_338276 - BLOCK
      ?auto_338277 - BLOCK
      ?auto_338278 - BLOCK
      ?auto_338279 - BLOCK
      ?auto_338280 - BLOCK
      ?auto_338281 - BLOCK
      ?auto_338282 - BLOCK
      ?auto_338283 - BLOCK
      ?auto_338284 - BLOCK
      ?auto_338285 - BLOCK
    )
    :vars
    (
      ?auto_338286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338285 ?auto_338286 ) ( ON-TABLE ?auto_338273 ) ( not ( = ?auto_338273 ?auto_338274 ) ) ( not ( = ?auto_338273 ?auto_338275 ) ) ( not ( = ?auto_338273 ?auto_338276 ) ) ( not ( = ?auto_338273 ?auto_338277 ) ) ( not ( = ?auto_338273 ?auto_338278 ) ) ( not ( = ?auto_338273 ?auto_338279 ) ) ( not ( = ?auto_338273 ?auto_338280 ) ) ( not ( = ?auto_338273 ?auto_338281 ) ) ( not ( = ?auto_338273 ?auto_338282 ) ) ( not ( = ?auto_338273 ?auto_338283 ) ) ( not ( = ?auto_338273 ?auto_338284 ) ) ( not ( = ?auto_338273 ?auto_338285 ) ) ( not ( = ?auto_338273 ?auto_338286 ) ) ( not ( = ?auto_338274 ?auto_338275 ) ) ( not ( = ?auto_338274 ?auto_338276 ) ) ( not ( = ?auto_338274 ?auto_338277 ) ) ( not ( = ?auto_338274 ?auto_338278 ) ) ( not ( = ?auto_338274 ?auto_338279 ) ) ( not ( = ?auto_338274 ?auto_338280 ) ) ( not ( = ?auto_338274 ?auto_338281 ) ) ( not ( = ?auto_338274 ?auto_338282 ) ) ( not ( = ?auto_338274 ?auto_338283 ) ) ( not ( = ?auto_338274 ?auto_338284 ) ) ( not ( = ?auto_338274 ?auto_338285 ) ) ( not ( = ?auto_338274 ?auto_338286 ) ) ( not ( = ?auto_338275 ?auto_338276 ) ) ( not ( = ?auto_338275 ?auto_338277 ) ) ( not ( = ?auto_338275 ?auto_338278 ) ) ( not ( = ?auto_338275 ?auto_338279 ) ) ( not ( = ?auto_338275 ?auto_338280 ) ) ( not ( = ?auto_338275 ?auto_338281 ) ) ( not ( = ?auto_338275 ?auto_338282 ) ) ( not ( = ?auto_338275 ?auto_338283 ) ) ( not ( = ?auto_338275 ?auto_338284 ) ) ( not ( = ?auto_338275 ?auto_338285 ) ) ( not ( = ?auto_338275 ?auto_338286 ) ) ( not ( = ?auto_338276 ?auto_338277 ) ) ( not ( = ?auto_338276 ?auto_338278 ) ) ( not ( = ?auto_338276 ?auto_338279 ) ) ( not ( = ?auto_338276 ?auto_338280 ) ) ( not ( = ?auto_338276 ?auto_338281 ) ) ( not ( = ?auto_338276 ?auto_338282 ) ) ( not ( = ?auto_338276 ?auto_338283 ) ) ( not ( = ?auto_338276 ?auto_338284 ) ) ( not ( = ?auto_338276 ?auto_338285 ) ) ( not ( = ?auto_338276 ?auto_338286 ) ) ( not ( = ?auto_338277 ?auto_338278 ) ) ( not ( = ?auto_338277 ?auto_338279 ) ) ( not ( = ?auto_338277 ?auto_338280 ) ) ( not ( = ?auto_338277 ?auto_338281 ) ) ( not ( = ?auto_338277 ?auto_338282 ) ) ( not ( = ?auto_338277 ?auto_338283 ) ) ( not ( = ?auto_338277 ?auto_338284 ) ) ( not ( = ?auto_338277 ?auto_338285 ) ) ( not ( = ?auto_338277 ?auto_338286 ) ) ( not ( = ?auto_338278 ?auto_338279 ) ) ( not ( = ?auto_338278 ?auto_338280 ) ) ( not ( = ?auto_338278 ?auto_338281 ) ) ( not ( = ?auto_338278 ?auto_338282 ) ) ( not ( = ?auto_338278 ?auto_338283 ) ) ( not ( = ?auto_338278 ?auto_338284 ) ) ( not ( = ?auto_338278 ?auto_338285 ) ) ( not ( = ?auto_338278 ?auto_338286 ) ) ( not ( = ?auto_338279 ?auto_338280 ) ) ( not ( = ?auto_338279 ?auto_338281 ) ) ( not ( = ?auto_338279 ?auto_338282 ) ) ( not ( = ?auto_338279 ?auto_338283 ) ) ( not ( = ?auto_338279 ?auto_338284 ) ) ( not ( = ?auto_338279 ?auto_338285 ) ) ( not ( = ?auto_338279 ?auto_338286 ) ) ( not ( = ?auto_338280 ?auto_338281 ) ) ( not ( = ?auto_338280 ?auto_338282 ) ) ( not ( = ?auto_338280 ?auto_338283 ) ) ( not ( = ?auto_338280 ?auto_338284 ) ) ( not ( = ?auto_338280 ?auto_338285 ) ) ( not ( = ?auto_338280 ?auto_338286 ) ) ( not ( = ?auto_338281 ?auto_338282 ) ) ( not ( = ?auto_338281 ?auto_338283 ) ) ( not ( = ?auto_338281 ?auto_338284 ) ) ( not ( = ?auto_338281 ?auto_338285 ) ) ( not ( = ?auto_338281 ?auto_338286 ) ) ( not ( = ?auto_338282 ?auto_338283 ) ) ( not ( = ?auto_338282 ?auto_338284 ) ) ( not ( = ?auto_338282 ?auto_338285 ) ) ( not ( = ?auto_338282 ?auto_338286 ) ) ( not ( = ?auto_338283 ?auto_338284 ) ) ( not ( = ?auto_338283 ?auto_338285 ) ) ( not ( = ?auto_338283 ?auto_338286 ) ) ( not ( = ?auto_338284 ?auto_338285 ) ) ( not ( = ?auto_338284 ?auto_338286 ) ) ( not ( = ?auto_338285 ?auto_338286 ) ) ( ON ?auto_338284 ?auto_338285 ) ( ON ?auto_338283 ?auto_338284 ) ( ON ?auto_338282 ?auto_338283 ) ( ON ?auto_338281 ?auto_338282 ) ( ON ?auto_338280 ?auto_338281 ) ( ON ?auto_338279 ?auto_338280 ) ( ON ?auto_338278 ?auto_338279 ) ( ON ?auto_338277 ?auto_338278 ) ( ON ?auto_338276 ?auto_338277 ) ( ON ?auto_338275 ?auto_338276 ) ( CLEAR ?auto_338273 ) ( ON ?auto_338274 ?auto_338275 ) ( CLEAR ?auto_338274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_338273 ?auto_338274 )
      ( MAKE-13PILE ?auto_338273 ?auto_338274 ?auto_338275 ?auto_338276 ?auto_338277 ?auto_338278 ?auto_338279 ?auto_338280 ?auto_338281 ?auto_338282 ?auto_338283 ?auto_338284 ?auto_338285 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_338327 - BLOCK
      ?auto_338328 - BLOCK
      ?auto_338329 - BLOCK
      ?auto_338330 - BLOCK
      ?auto_338331 - BLOCK
      ?auto_338332 - BLOCK
      ?auto_338333 - BLOCK
      ?auto_338334 - BLOCK
      ?auto_338335 - BLOCK
      ?auto_338336 - BLOCK
      ?auto_338337 - BLOCK
      ?auto_338338 - BLOCK
      ?auto_338339 - BLOCK
    )
    :vars
    (
      ?auto_338340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338339 ?auto_338340 ) ( not ( = ?auto_338327 ?auto_338328 ) ) ( not ( = ?auto_338327 ?auto_338329 ) ) ( not ( = ?auto_338327 ?auto_338330 ) ) ( not ( = ?auto_338327 ?auto_338331 ) ) ( not ( = ?auto_338327 ?auto_338332 ) ) ( not ( = ?auto_338327 ?auto_338333 ) ) ( not ( = ?auto_338327 ?auto_338334 ) ) ( not ( = ?auto_338327 ?auto_338335 ) ) ( not ( = ?auto_338327 ?auto_338336 ) ) ( not ( = ?auto_338327 ?auto_338337 ) ) ( not ( = ?auto_338327 ?auto_338338 ) ) ( not ( = ?auto_338327 ?auto_338339 ) ) ( not ( = ?auto_338327 ?auto_338340 ) ) ( not ( = ?auto_338328 ?auto_338329 ) ) ( not ( = ?auto_338328 ?auto_338330 ) ) ( not ( = ?auto_338328 ?auto_338331 ) ) ( not ( = ?auto_338328 ?auto_338332 ) ) ( not ( = ?auto_338328 ?auto_338333 ) ) ( not ( = ?auto_338328 ?auto_338334 ) ) ( not ( = ?auto_338328 ?auto_338335 ) ) ( not ( = ?auto_338328 ?auto_338336 ) ) ( not ( = ?auto_338328 ?auto_338337 ) ) ( not ( = ?auto_338328 ?auto_338338 ) ) ( not ( = ?auto_338328 ?auto_338339 ) ) ( not ( = ?auto_338328 ?auto_338340 ) ) ( not ( = ?auto_338329 ?auto_338330 ) ) ( not ( = ?auto_338329 ?auto_338331 ) ) ( not ( = ?auto_338329 ?auto_338332 ) ) ( not ( = ?auto_338329 ?auto_338333 ) ) ( not ( = ?auto_338329 ?auto_338334 ) ) ( not ( = ?auto_338329 ?auto_338335 ) ) ( not ( = ?auto_338329 ?auto_338336 ) ) ( not ( = ?auto_338329 ?auto_338337 ) ) ( not ( = ?auto_338329 ?auto_338338 ) ) ( not ( = ?auto_338329 ?auto_338339 ) ) ( not ( = ?auto_338329 ?auto_338340 ) ) ( not ( = ?auto_338330 ?auto_338331 ) ) ( not ( = ?auto_338330 ?auto_338332 ) ) ( not ( = ?auto_338330 ?auto_338333 ) ) ( not ( = ?auto_338330 ?auto_338334 ) ) ( not ( = ?auto_338330 ?auto_338335 ) ) ( not ( = ?auto_338330 ?auto_338336 ) ) ( not ( = ?auto_338330 ?auto_338337 ) ) ( not ( = ?auto_338330 ?auto_338338 ) ) ( not ( = ?auto_338330 ?auto_338339 ) ) ( not ( = ?auto_338330 ?auto_338340 ) ) ( not ( = ?auto_338331 ?auto_338332 ) ) ( not ( = ?auto_338331 ?auto_338333 ) ) ( not ( = ?auto_338331 ?auto_338334 ) ) ( not ( = ?auto_338331 ?auto_338335 ) ) ( not ( = ?auto_338331 ?auto_338336 ) ) ( not ( = ?auto_338331 ?auto_338337 ) ) ( not ( = ?auto_338331 ?auto_338338 ) ) ( not ( = ?auto_338331 ?auto_338339 ) ) ( not ( = ?auto_338331 ?auto_338340 ) ) ( not ( = ?auto_338332 ?auto_338333 ) ) ( not ( = ?auto_338332 ?auto_338334 ) ) ( not ( = ?auto_338332 ?auto_338335 ) ) ( not ( = ?auto_338332 ?auto_338336 ) ) ( not ( = ?auto_338332 ?auto_338337 ) ) ( not ( = ?auto_338332 ?auto_338338 ) ) ( not ( = ?auto_338332 ?auto_338339 ) ) ( not ( = ?auto_338332 ?auto_338340 ) ) ( not ( = ?auto_338333 ?auto_338334 ) ) ( not ( = ?auto_338333 ?auto_338335 ) ) ( not ( = ?auto_338333 ?auto_338336 ) ) ( not ( = ?auto_338333 ?auto_338337 ) ) ( not ( = ?auto_338333 ?auto_338338 ) ) ( not ( = ?auto_338333 ?auto_338339 ) ) ( not ( = ?auto_338333 ?auto_338340 ) ) ( not ( = ?auto_338334 ?auto_338335 ) ) ( not ( = ?auto_338334 ?auto_338336 ) ) ( not ( = ?auto_338334 ?auto_338337 ) ) ( not ( = ?auto_338334 ?auto_338338 ) ) ( not ( = ?auto_338334 ?auto_338339 ) ) ( not ( = ?auto_338334 ?auto_338340 ) ) ( not ( = ?auto_338335 ?auto_338336 ) ) ( not ( = ?auto_338335 ?auto_338337 ) ) ( not ( = ?auto_338335 ?auto_338338 ) ) ( not ( = ?auto_338335 ?auto_338339 ) ) ( not ( = ?auto_338335 ?auto_338340 ) ) ( not ( = ?auto_338336 ?auto_338337 ) ) ( not ( = ?auto_338336 ?auto_338338 ) ) ( not ( = ?auto_338336 ?auto_338339 ) ) ( not ( = ?auto_338336 ?auto_338340 ) ) ( not ( = ?auto_338337 ?auto_338338 ) ) ( not ( = ?auto_338337 ?auto_338339 ) ) ( not ( = ?auto_338337 ?auto_338340 ) ) ( not ( = ?auto_338338 ?auto_338339 ) ) ( not ( = ?auto_338338 ?auto_338340 ) ) ( not ( = ?auto_338339 ?auto_338340 ) ) ( ON ?auto_338338 ?auto_338339 ) ( ON ?auto_338337 ?auto_338338 ) ( ON ?auto_338336 ?auto_338337 ) ( ON ?auto_338335 ?auto_338336 ) ( ON ?auto_338334 ?auto_338335 ) ( ON ?auto_338333 ?auto_338334 ) ( ON ?auto_338332 ?auto_338333 ) ( ON ?auto_338331 ?auto_338332 ) ( ON ?auto_338330 ?auto_338331 ) ( ON ?auto_338329 ?auto_338330 ) ( ON ?auto_338328 ?auto_338329 ) ( ON ?auto_338327 ?auto_338328 ) ( CLEAR ?auto_338327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_338327 )
      ( MAKE-13PILE ?auto_338327 ?auto_338328 ?auto_338329 ?auto_338330 ?auto_338331 ?auto_338332 ?auto_338333 ?auto_338334 ?auto_338335 ?auto_338336 ?auto_338337 ?auto_338338 ?auto_338339 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338382 - BLOCK
      ?auto_338383 - BLOCK
      ?auto_338384 - BLOCK
      ?auto_338385 - BLOCK
      ?auto_338386 - BLOCK
      ?auto_338387 - BLOCK
      ?auto_338388 - BLOCK
      ?auto_338389 - BLOCK
      ?auto_338390 - BLOCK
      ?auto_338391 - BLOCK
      ?auto_338392 - BLOCK
      ?auto_338393 - BLOCK
      ?auto_338394 - BLOCK
      ?auto_338395 - BLOCK
    )
    :vars
    (
      ?auto_338396 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_338394 ) ( ON ?auto_338395 ?auto_338396 ) ( CLEAR ?auto_338395 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_338382 ) ( ON ?auto_338383 ?auto_338382 ) ( ON ?auto_338384 ?auto_338383 ) ( ON ?auto_338385 ?auto_338384 ) ( ON ?auto_338386 ?auto_338385 ) ( ON ?auto_338387 ?auto_338386 ) ( ON ?auto_338388 ?auto_338387 ) ( ON ?auto_338389 ?auto_338388 ) ( ON ?auto_338390 ?auto_338389 ) ( ON ?auto_338391 ?auto_338390 ) ( ON ?auto_338392 ?auto_338391 ) ( ON ?auto_338393 ?auto_338392 ) ( ON ?auto_338394 ?auto_338393 ) ( not ( = ?auto_338382 ?auto_338383 ) ) ( not ( = ?auto_338382 ?auto_338384 ) ) ( not ( = ?auto_338382 ?auto_338385 ) ) ( not ( = ?auto_338382 ?auto_338386 ) ) ( not ( = ?auto_338382 ?auto_338387 ) ) ( not ( = ?auto_338382 ?auto_338388 ) ) ( not ( = ?auto_338382 ?auto_338389 ) ) ( not ( = ?auto_338382 ?auto_338390 ) ) ( not ( = ?auto_338382 ?auto_338391 ) ) ( not ( = ?auto_338382 ?auto_338392 ) ) ( not ( = ?auto_338382 ?auto_338393 ) ) ( not ( = ?auto_338382 ?auto_338394 ) ) ( not ( = ?auto_338382 ?auto_338395 ) ) ( not ( = ?auto_338382 ?auto_338396 ) ) ( not ( = ?auto_338383 ?auto_338384 ) ) ( not ( = ?auto_338383 ?auto_338385 ) ) ( not ( = ?auto_338383 ?auto_338386 ) ) ( not ( = ?auto_338383 ?auto_338387 ) ) ( not ( = ?auto_338383 ?auto_338388 ) ) ( not ( = ?auto_338383 ?auto_338389 ) ) ( not ( = ?auto_338383 ?auto_338390 ) ) ( not ( = ?auto_338383 ?auto_338391 ) ) ( not ( = ?auto_338383 ?auto_338392 ) ) ( not ( = ?auto_338383 ?auto_338393 ) ) ( not ( = ?auto_338383 ?auto_338394 ) ) ( not ( = ?auto_338383 ?auto_338395 ) ) ( not ( = ?auto_338383 ?auto_338396 ) ) ( not ( = ?auto_338384 ?auto_338385 ) ) ( not ( = ?auto_338384 ?auto_338386 ) ) ( not ( = ?auto_338384 ?auto_338387 ) ) ( not ( = ?auto_338384 ?auto_338388 ) ) ( not ( = ?auto_338384 ?auto_338389 ) ) ( not ( = ?auto_338384 ?auto_338390 ) ) ( not ( = ?auto_338384 ?auto_338391 ) ) ( not ( = ?auto_338384 ?auto_338392 ) ) ( not ( = ?auto_338384 ?auto_338393 ) ) ( not ( = ?auto_338384 ?auto_338394 ) ) ( not ( = ?auto_338384 ?auto_338395 ) ) ( not ( = ?auto_338384 ?auto_338396 ) ) ( not ( = ?auto_338385 ?auto_338386 ) ) ( not ( = ?auto_338385 ?auto_338387 ) ) ( not ( = ?auto_338385 ?auto_338388 ) ) ( not ( = ?auto_338385 ?auto_338389 ) ) ( not ( = ?auto_338385 ?auto_338390 ) ) ( not ( = ?auto_338385 ?auto_338391 ) ) ( not ( = ?auto_338385 ?auto_338392 ) ) ( not ( = ?auto_338385 ?auto_338393 ) ) ( not ( = ?auto_338385 ?auto_338394 ) ) ( not ( = ?auto_338385 ?auto_338395 ) ) ( not ( = ?auto_338385 ?auto_338396 ) ) ( not ( = ?auto_338386 ?auto_338387 ) ) ( not ( = ?auto_338386 ?auto_338388 ) ) ( not ( = ?auto_338386 ?auto_338389 ) ) ( not ( = ?auto_338386 ?auto_338390 ) ) ( not ( = ?auto_338386 ?auto_338391 ) ) ( not ( = ?auto_338386 ?auto_338392 ) ) ( not ( = ?auto_338386 ?auto_338393 ) ) ( not ( = ?auto_338386 ?auto_338394 ) ) ( not ( = ?auto_338386 ?auto_338395 ) ) ( not ( = ?auto_338386 ?auto_338396 ) ) ( not ( = ?auto_338387 ?auto_338388 ) ) ( not ( = ?auto_338387 ?auto_338389 ) ) ( not ( = ?auto_338387 ?auto_338390 ) ) ( not ( = ?auto_338387 ?auto_338391 ) ) ( not ( = ?auto_338387 ?auto_338392 ) ) ( not ( = ?auto_338387 ?auto_338393 ) ) ( not ( = ?auto_338387 ?auto_338394 ) ) ( not ( = ?auto_338387 ?auto_338395 ) ) ( not ( = ?auto_338387 ?auto_338396 ) ) ( not ( = ?auto_338388 ?auto_338389 ) ) ( not ( = ?auto_338388 ?auto_338390 ) ) ( not ( = ?auto_338388 ?auto_338391 ) ) ( not ( = ?auto_338388 ?auto_338392 ) ) ( not ( = ?auto_338388 ?auto_338393 ) ) ( not ( = ?auto_338388 ?auto_338394 ) ) ( not ( = ?auto_338388 ?auto_338395 ) ) ( not ( = ?auto_338388 ?auto_338396 ) ) ( not ( = ?auto_338389 ?auto_338390 ) ) ( not ( = ?auto_338389 ?auto_338391 ) ) ( not ( = ?auto_338389 ?auto_338392 ) ) ( not ( = ?auto_338389 ?auto_338393 ) ) ( not ( = ?auto_338389 ?auto_338394 ) ) ( not ( = ?auto_338389 ?auto_338395 ) ) ( not ( = ?auto_338389 ?auto_338396 ) ) ( not ( = ?auto_338390 ?auto_338391 ) ) ( not ( = ?auto_338390 ?auto_338392 ) ) ( not ( = ?auto_338390 ?auto_338393 ) ) ( not ( = ?auto_338390 ?auto_338394 ) ) ( not ( = ?auto_338390 ?auto_338395 ) ) ( not ( = ?auto_338390 ?auto_338396 ) ) ( not ( = ?auto_338391 ?auto_338392 ) ) ( not ( = ?auto_338391 ?auto_338393 ) ) ( not ( = ?auto_338391 ?auto_338394 ) ) ( not ( = ?auto_338391 ?auto_338395 ) ) ( not ( = ?auto_338391 ?auto_338396 ) ) ( not ( = ?auto_338392 ?auto_338393 ) ) ( not ( = ?auto_338392 ?auto_338394 ) ) ( not ( = ?auto_338392 ?auto_338395 ) ) ( not ( = ?auto_338392 ?auto_338396 ) ) ( not ( = ?auto_338393 ?auto_338394 ) ) ( not ( = ?auto_338393 ?auto_338395 ) ) ( not ( = ?auto_338393 ?auto_338396 ) ) ( not ( = ?auto_338394 ?auto_338395 ) ) ( not ( = ?auto_338394 ?auto_338396 ) ) ( not ( = ?auto_338395 ?auto_338396 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_338395 ?auto_338396 )
      ( !STACK ?auto_338395 ?auto_338394 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338411 - BLOCK
      ?auto_338412 - BLOCK
      ?auto_338413 - BLOCK
      ?auto_338414 - BLOCK
      ?auto_338415 - BLOCK
      ?auto_338416 - BLOCK
      ?auto_338417 - BLOCK
      ?auto_338418 - BLOCK
      ?auto_338419 - BLOCK
      ?auto_338420 - BLOCK
      ?auto_338421 - BLOCK
      ?auto_338422 - BLOCK
      ?auto_338423 - BLOCK
      ?auto_338424 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_338423 ) ( ON-TABLE ?auto_338424 ) ( CLEAR ?auto_338424 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_338411 ) ( ON ?auto_338412 ?auto_338411 ) ( ON ?auto_338413 ?auto_338412 ) ( ON ?auto_338414 ?auto_338413 ) ( ON ?auto_338415 ?auto_338414 ) ( ON ?auto_338416 ?auto_338415 ) ( ON ?auto_338417 ?auto_338416 ) ( ON ?auto_338418 ?auto_338417 ) ( ON ?auto_338419 ?auto_338418 ) ( ON ?auto_338420 ?auto_338419 ) ( ON ?auto_338421 ?auto_338420 ) ( ON ?auto_338422 ?auto_338421 ) ( ON ?auto_338423 ?auto_338422 ) ( not ( = ?auto_338411 ?auto_338412 ) ) ( not ( = ?auto_338411 ?auto_338413 ) ) ( not ( = ?auto_338411 ?auto_338414 ) ) ( not ( = ?auto_338411 ?auto_338415 ) ) ( not ( = ?auto_338411 ?auto_338416 ) ) ( not ( = ?auto_338411 ?auto_338417 ) ) ( not ( = ?auto_338411 ?auto_338418 ) ) ( not ( = ?auto_338411 ?auto_338419 ) ) ( not ( = ?auto_338411 ?auto_338420 ) ) ( not ( = ?auto_338411 ?auto_338421 ) ) ( not ( = ?auto_338411 ?auto_338422 ) ) ( not ( = ?auto_338411 ?auto_338423 ) ) ( not ( = ?auto_338411 ?auto_338424 ) ) ( not ( = ?auto_338412 ?auto_338413 ) ) ( not ( = ?auto_338412 ?auto_338414 ) ) ( not ( = ?auto_338412 ?auto_338415 ) ) ( not ( = ?auto_338412 ?auto_338416 ) ) ( not ( = ?auto_338412 ?auto_338417 ) ) ( not ( = ?auto_338412 ?auto_338418 ) ) ( not ( = ?auto_338412 ?auto_338419 ) ) ( not ( = ?auto_338412 ?auto_338420 ) ) ( not ( = ?auto_338412 ?auto_338421 ) ) ( not ( = ?auto_338412 ?auto_338422 ) ) ( not ( = ?auto_338412 ?auto_338423 ) ) ( not ( = ?auto_338412 ?auto_338424 ) ) ( not ( = ?auto_338413 ?auto_338414 ) ) ( not ( = ?auto_338413 ?auto_338415 ) ) ( not ( = ?auto_338413 ?auto_338416 ) ) ( not ( = ?auto_338413 ?auto_338417 ) ) ( not ( = ?auto_338413 ?auto_338418 ) ) ( not ( = ?auto_338413 ?auto_338419 ) ) ( not ( = ?auto_338413 ?auto_338420 ) ) ( not ( = ?auto_338413 ?auto_338421 ) ) ( not ( = ?auto_338413 ?auto_338422 ) ) ( not ( = ?auto_338413 ?auto_338423 ) ) ( not ( = ?auto_338413 ?auto_338424 ) ) ( not ( = ?auto_338414 ?auto_338415 ) ) ( not ( = ?auto_338414 ?auto_338416 ) ) ( not ( = ?auto_338414 ?auto_338417 ) ) ( not ( = ?auto_338414 ?auto_338418 ) ) ( not ( = ?auto_338414 ?auto_338419 ) ) ( not ( = ?auto_338414 ?auto_338420 ) ) ( not ( = ?auto_338414 ?auto_338421 ) ) ( not ( = ?auto_338414 ?auto_338422 ) ) ( not ( = ?auto_338414 ?auto_338423 ) ) ( not ( = ?auto_338414 ?auto_338424 ) ) ( not ( = ?auto_338415 ?auto_338416 ) ) ( not ( = ?auto_338415 ?auto_338417 ) ) ( not ( = ?auto_338415 ?auto_338418 ) ) ( not ( = ?auto_338415 ?auto_338419 ) ) ( not ( = ?auto_338415 ?auto_338420 ) ) ( not ( = ?auto_338415 ?auto_338421 ) ) ( not ( = ?auto_338415 ?auto_338422 ) ) ( not ( = ?auto_338415 ?auto_338423 ) ) ( not ( = ?auto_338415 ?auto_338424 ) ) ( not ( = ?auto_338416 ?auto_338417 ) ) ( not ( = ?auto_338416 ?auto_338418 ) ) ( not ( = ?auto_338416 ?auto_338419 ) ) ( not ( = ?auto_338416 ?auto_338420 ) ) ( not ( = ?auto_338416 ?auto_338421 ) ) ( not ( = ?auto_338416 ?auto_338422 ) ) ( not ( = ?auto_338416 ?auto_338423 ) ) ( not ( = ?auto_338416 ?auto_338424 ) ) ( not ( = ?auto_338417 ?auto_338418 ) ) ( not ( = ?auto_338417 ?auto_338419 ) ) ( not ( = ?auto_338417 ?auto_338420 ) ) ( not ( = ?auto_338417 ?auto_338421 ) ) ( not ( = ?auto_338417 ?auto_338422 ) ) ( not ( = ?auto_338417 ?auto_338423 ) ) ( not ( = ?auto_338417 ?auto_338424 ) ) ( not ( = ?auto_338418 ?auto_338419 ) ) ( not ( = ?auto_338418 ?auto_338420 ) ) ( not ( = ?auto_338418 ?auto_338421 ) ) ( not ( = ?auto_338418 ?auto_338422 ) ) ( not ( = ?auto_338418 ?auto_338423 ) ) ( not ( = ?auto_338418 ?auto_338424 ) ) ( not ( = ?auto_338419 ?auto_338420 ) ) ( not ( = ?auto_338419 ?auto_338421 ) ) ( not ( = ?auto_338419 ?auto_338422 ) ) ( not ( = ?auto_338419 ?auto_338423 ) ) ( not ( = ?auto_338419 ?auto_338424 ) ) ( not ( = ?auto_338420 ?auto_338421 ) ) ( not ( = ?auto_338420 ?auto_338422 ) ) ( not ( = ?auto_338420 ?auto_338423 ) ) ( not ( = ?auto_338420 ?auto_338424 ) ) ( not ( = ?auto_338421 ?auto_338422 ) ) ( not ( = ?auto_338421 ?auto_338423 ) ) ( not ( = ?auto_338421 ?auto_338424 ) ) ( not ( = ?auto_338422 ?auto_338423 ) ) ( not ( = ?auto_338422 ?auto_338424 ) ) ( not ( = ?auto_338423 ?auto_338424 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_338424 )
      ( !STACK ?auto_338424 ?auto_338423 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338439 - BLOCK
      ?auto_338440 - BLOCK
      ?auto_338441 - BLOCK
      ?auto_338442 - BLOCK
      ?auto_338443 - BLOCK
      ?auto_338444 - BLOCK
      ?auto_338445 - BLOCK
      ?auto_338446 - BLOCK
      ?auto_338447 - BLOCK
      ?auto_338448 - BLOCK
      ?auto_338449 - BLOCK
      ?auto_338450 - BLOCK
      ?auto_338451 - BLOCK
      ?auto_338452 - BLOCK
    )
    :vars
    (
      ?auto_338453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338452 ?auto_338453 ) ( ON-TABLE ?auto_338439 ) ( ON ?auto_338440 ?auto_338439 ) ( ON ?auto_338441 ?auto_338440 ) ( ON ?auto_338442 ?auto_338441 ) ( ON ?auto_338443 ?auto_338442 ) ( ON ?auto_338444 ?auto_338443 ) ( ON ?auto_338445 ?auto_338444 ) ( ON ?auto_338446 ?auto_338445 ) ( ON ?auto_338447 ?auto_338446 ) ( ON ?auto_338448 ?auto_338447 ) ( ON ?auto_338449 ?auto_338448 ) ( ON ?auto_338450 ?auto_338449 ) ( not ( = ?auto_338439 ?auto_338440 ) ) ( not ( = ?auto_338439 ?auto_338441 ) ) ( not ( = ?auto_338439 ?auto_338442 ) ) ( not ( = ?auto_338439 ?auto_338443 ) ) ( not ( = ?auto_338439 ?auto_338444 ) ) ( not ( = ?auto_338439 ?auto_338445 ) ) ( not ( = ?auto_338439 ?auto_338446 ) ) ( not ( = ?auto_338439 ?auto_338447 ) ) ( not ( = ?auto_338439 ?auto_338448 ) ) ( not ( = ?auto_338439 ?auto_338449 ) ) ( not ( = ?auto_338439 ?auto_338450 ) ) ( not ( = ?auto_338439 ?auto_338451 ) ) ( not ( = ?auto_338439 ?auto_338452 ) ) ( not ( = ?auto_338439 ?auto_338453 ) ) ( not ( = ?auto_338440 ?auto_338441 ) ) ( not ( = ?auto_338440 ?auto_338442 ) ) ( not ( = ?auto_338440 ?auto_338443 ) ) ( not ( = ?auto_338440 ?auto_338444 ) ) ( not ( = ?auto_338440 ?auto_338445 ) ) ( not ( = ?auto_338440 ?auto_338446 ) ) ( not ( = ?auto_338440 ?auto_338447 ) ) ( not ( = ?auto_338440 ?auto_338448 ) ) ( not ( = ?auto_338440 ?auto_338449 ) ) ( not ( = ?auto_338440 ?auto_338450 ) ) ( not ( = ?auto_338440 ?auto_338451 ) ) ( not ( = ?auto_338440 ?auto_338452 ) ) ( not ( = ?auto_338440 ?auto_338453 ) ) ( not ( = ?auto_338441 ?auto_338442 ) ) ( not ( = ?auto_338441 ?auto_338443 ) ) ( not ( = ?auto_338441 ?auto_338444 ) ) ( not ( = ?auto_338441 ?auto_338445 ) ) ( not ( = ?auto_338441 ?auto_338446 ) ) ( not ( = ?auto_338441 ?auto_338447 ) ) ( not ( = ?auto_338441 ?auto_338448 ) ) ( not ( = ?auto_338441 ?auto_338449 ) ) ( not ( = ?auto_338441 ?auto_338450 ) ) ( not ( = ?auto_338441 ?auto_338451 ) ) ( not ( = ?auto_338441 ?auto_338452 ) ) ( not ( = ?auto_338441 ?auto_338453 ) ) ( not ( = ?auto_338442 ?auto_338443 ) ) ( not ( = ?auto_338442 ?auto_338444 ) ) ( not ( = ?auto_338442 ?auto_338445 ) ) ( not ( = ?auto_338442 ?auto_338446 ) ) ( not ( = ?auto_338442 ?auto_338447 ) ) ( not ( = ?auto_338442 ?auto_338448 ) ) ( not ( = ?auto_338442 ?auto_338449 ) ) ( not ( = ?auto_338442 ?auto_338450 ) ) ( not ( = ?auto_338442 ?auto_338451 ) ) ( not ( = ?auto_338442 ?auto_338452 ) ) ( not ( = ?auto_338442 ?auto_338453 ) ) ( not ( = ?auto_338443 ?auto_338444 ) ) ( not ( = ?auto_338443 ?auto_338445 ) ) ( not ( = ?auto_338443 ?auto_338446 ) ) ( not ( = ?auto_338443 ?auto_338447 ) ) ( not ( = ?auto_338443 ?auto_338448 ) ) ( not ( = ?auto_338443 ?auto_338449 ) ) ( not ( = ?auto_338443 ?auto_338450 ) ) ( not ( = ?auto_338443 ?auto_338451 ) ) ( not ( = ?auto_338443 ?auto_338452 ) ) ( not ( = ?auto_338443 ?auto_338453 ) ) ( not ( = ?auto_338444 ?auto_338445 ) ) ( not ( = ?auto_338444 ?auto_338446 ) ) ( not ( = ?auto_338444 ?auto_338447 ) ) ( not ( = ?auto_338444 ?auto_338448 ) ) ( not ( = ?auto_338444 ?auto_338449 ) ) ( not ( = ?auto_338444 ?auto_338450 ) ) ( not ( = ?auto_338444 ?auto_338451 ) ) ( not ( = ?auto_338444 ?auto_338452 ) ) ( not ( = ?auto_338444 ?auto_338453 ) ) ( not ( = ?auto_338445 ?auto_338446 ) ) ( not ( = ?auto_338445 ?auto_338447 ) ) ( not ( = ?auto_338445 ?auto_338448 ) ) ( not ( = ?auto_338445 ?auto_338449 ) ) ( not ( = ?auto_338445 ?auto_338450 ) ) ( not ( = ?auto_338445 ?auto_338451 ) ) ( not ( = ?auto_338445 ?auto_338452 ) ) ( not ( = ?auto_338445 ?auto_338453 ) ) ( not ( = ?auto_338446 ?auto_338447 ) ) ( not ( = ?auto_338446 ?auto_338448 ) ) ( not ( = ?auto_338446 ?auto_338449 ) ) ( not ( = ?auto_338446 ?auto_338450 ) ) ( not ( = ?auto_338446 ?auto_338451 ) ) ( not ( = ?auto_338446 ?auto_338452 ) ) ( not ( = ?auto_338446 ?auto_338453 ) ) ( not ( = ?auto_338447 ?auto_338448 ) ) ( not ( = ?auto_338447 ?auto_338449 ) ) ( not ( = ?auto_338447 ?auto_338450 ) ) ( not ( = ?auto_338447 ?auto_338451 ) ) ( not ( = ?auto_338447 ?auto_338452 ) ) ( not ( = ?auto_338447 ?auto_338453 ) ) ( not ( = ?auto_338448 ?auto_338449 ) ) ( not ( = ?auto_338448 ?auto_338450 ) ) ( not ( = ?auto_338448 ?auto_338451 ) ) ( not ( = ?auto_338448 ?auto_338452 ) ) ( not ( = ?auto_338448 ?auto_338453 ) ) ( not ( = ?auto_338449 ?auto_338450 ) ) ( not ( = ?auto_338449 ?auto_338451 ) ) ( not ( = ?auto_338449 ?auto_338452 ) ) ( not ( = ?auto_338449 ?auto_338453 ) ) ( not ( = ?auto_338450 ?auto_338451 ) ) ( not ( = ?auto_338450 ?auto_338452 ) ) ( not ( = ?auto_338450 ?auto_338453 ) ) ( not ( = ?auto_338451 ?auto_338452 ) ) ( not ( = ?auto_338451 ?auto_338453 ) ) ( not ( = ?auto_338452 ?auto_338453 ) ) ( CLEAR ?auto_338450 ) ( ON ?auto_338451 ?auto_338452 ) ( CLEAR ?auto_338451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_338439 ?auto_338440 ?auto_338441 ?auto_338442 ?auto_338443 ?auto_338444 ?auto_338445 ?auto_338446 ?auto_338447 ?auto_338448 ?auto_338449 ?auto_338450 ?auto_338451 )
      ( MAKE-14PILE ?auto_338439 ?auto_338440 ?auto_338441 ?auto_338442 ?auto_338443 ?auto_338444 ?auto_338445 ?auto_338446 ?auto_338447 ?auto_338448 ?auto_338449 ?auto_338450 ?auto_338451 ?auto_338452 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338468 - BLOCK
      ?auto_338469 - BLOCK
      ?auto_338470 - BLOCK
      ?auto_338471 - BLOCK
      ?auto_338472 - BLOCK
      ?auto_338473 - BLOCK
      ?auto_338474 - BLOCK
      ?auto_338475 - BLOCK
      ?auto_338476 - BLOCK
      ?auto_338477 - BLOCK
      ?auto_338478 - BLOCK
      ?auto_338479 - BLOCK
      ?auto_338480 - BLOCK
      ?auto_338481 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_338481 ) ( ON-TABLE ?auto_338468 ) ( ON ?auto_338469 ?auto_338468 ) ( ON ?auto_338470 ?auto_338469 ) ( ON ?auto_338471 ?auto_338470 ) ( ON ?auto_338472 ?auto_338471 ) ( ON ?auto_338473 ?auto_338472 ) ( ON ?auto_338474 ?auto_338473 ) ( ON ?auto_338475 ?auto_338474 ) ( ON ?auto_338476 ?auto_338475 ) ( ON ?auto_338477 ?auto_338476 ) ( ON ?auto_338478 ?auto_338477 ) ( ON ?auto_338479 ?auto_338478 ) ( not ( = ?auto_338468 ?auto_338469 ) ) ( not ( = ?auto_338468 ?auto_338470 ) ) ( not ( = ?auto_338468 ?auto_338471 ) ) ( not ( = ?auto_338468 ?auto_338472 ) ) ( not ( = ?auto_338468 ?auto_338473 ) ) ( not ( = ?auto_338468 ?auto_338474 ) ) ( not ( = ?auto_338468 ?auto_338475 ) ) ( not ( = ?auto_338468 ?auto_338476 ) ) ( not ( = ?auto_338468 ?auto_338477 ) ) ( not ( = ?auto_338468 ?auto_338478 ) ) ( not ( = ?auto_338468 ?auto_338479 ) ) ( not ( = ?auto_338468 ?auto_338480 ) ) ( not ( = ?auto_338468 ?auto_338481 ) ) ( not ( = ?auto_338469 ?auto_338470 ) ) ( not ( = ?auto_338469 ?auto_338471 ) ) ( not ( = ?auto_338469 ?auto_338472 ) ) ( not ( = ?auto_338469 ?auto_338473 ) ) ( not ( = ?auto_338469 ?auto_338474 ) ) ( not ( = ?auto_338469 ?auto_338475 ) ) ( not ( = ?auto_338469 ?auto_338476 ) ) ( not ( = ?auto_338469 ?auto_338477 ) ) ( not ( = ?auto_338469 ?auto_338478 ) ) ( not ( = ?auto_338469 ?auto_338479 ) ) ( not ( = ?auto_338469 ?auto_338480 ) ) ( not ( = ?auto_338469 ?auto_338481 ) ) ( not ( = ?auto_338470 ?auto_338471 ) ) ( not ( = ?auto_338470 ?auto_338472 ) ) ( not ( = ?auto_338470 ?auto_338473 ) ) ( not ( = ?auto_338470 ?auto_338474 ) ) ( not ( = ?auto_338470 ?auto_338475 ) ) ( not ( = ?auto_338470 ?auto_338476 ) ) ( not ( = ?auto_338470 ?auto_338477 ) ) ( not ( = ?auto_338470 ?auto_338478 ) ) ( not ( = ?auto_338470 ?auto_338479 ) ) ( not ( = ?auto_338470 ?auto_338480 ) ) ( not ( = ?auto_338470 ?auto_338481 ) ) ( not ( = ?auto_338471 ?auto_338472 ) ) ( not ( = ?auto_338471 ?auto_338473 ) ) ( not ( = ?auto_338471 ?auto_338474 ) ) ( not ( = ?auto_338471 ?auto_338475 ) ) ( not ( = ?auto_338471 ?auto_338476 ) ) ( not ( = ?auto_338471 ?auto_338477 ) ) ( not ( = ?auto_338471 ?auto_338478 ) ) ( not ( = ?auto_338471 ?auto_338479 ) ) ( not ( = ?auto_338471 ?auto_338480 ) ) ( not ( = ?auto_338471 ?auto_338481 ) ) ( not ( = ?auto_338472 ?auto_338473 ) ) ( not ( = ?auto_338472 ?auto_338474 ) ) ( not ( = ?auto_338472 ?auto_338475 ) ) ( not ( = ?auto_338472 ?auto_338476 ) ) ( not ( = ?auto_338472 ?auto_338477 ) ) ( not ( = ?auto_338472 ?auto_338478 ) ) ( not ( = ?auto_338472 ?auto_338479 ) ) ( not ( = ?auto_338472 ?auto_338480 ) ) ( not ( = ?auto_338472 ?auto_338481 ) ) ( not ( = ?auto_338473 ?auto_338474 ) ) ( not ( = ?auto_338473 ?auto_338475 ) ) ( not ( = ?auto_338473 ?auto_338476 ) ) ( not ( = ?auto_338473 ?auto_338477 ) ) ( not ( = ?auto_338473 ?auto_338478 ) ) ( not ( = ?auto_338473 ?auto_338479 ) ) ( not ( = ?auto_338473 ?auto_338480 ) ) ( not ( = ?auto_338473 ?auto_338481 ) ) ( not ( = ?auto_338474 ?auto_338475 ) ) ( not ( = ?auto_338474 ?auto_338476 ) ) ( not ( = ?auto_338474 ?auto_338477 ) ) ( not ( = ?auto_338474 ?auto_338478 ) ) ( not ( = ?auto_338474 ?auto_338479 ) ) ( not ( = ?auto_338474 ?auto_338480 ) ) ( not ( = ?auto_338474 ?auto_338481 ) ) ( not ( = ?auto_338475 ?auto_338476 ) ) ( not ( = ?auto_338475 ?auto_338477 ) ) ( not ( = ?auto_338475 ?auto_338478 ) ) ( not ( = ?auto_338475 ?auto_338479 ) ) ( not ( = ?auto_338475 ?auto_338480 ) ) ( not ( = ?auto_338475 ?auto_338481 ) ) ( not ( = ?auto_338476 ?auto_338477 ) ) ( not ( = ?auto_338476 ?auto_338478 ) ) ( not ( = ?auto_338476 ?auto_338479 ) ) ( not ( = ?auto_338476 ?auto_338480 ) ) ( not ( = ?auto_338476 ?auto_338481 ) ) ( not ( = ?auto_338477 ?auto_338478 ) ) ( not ( = ?auto_338477 ?auto_338479 ) ) ( not ( = ?auto_338477 ?auto_338480 ) ) ( not ( = ?auto_338477 ?auto_338481 ) ) ( not ( = ?auto_338478 ?auto_338479 ) ) ( not ( = ?auto_338478 ?auto_338480 ) ) ( not ( = ?auto_338478 ?auto_338481 ) ) ( not ( = ?auto_338479 ?auto_338480 ) ) ( not ( = ?auto_338479 ?auto_338481 ) ) ( not ( = ?auto_338480 ?auto_338481 ) ) ( CLEAR ?auto_338479 ) ( ON ?auto_338480 ?auto_338481 ) ( CLEAR ?auto_338480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_338468 ?auto_338469 ?auto_338470 ?auto_338471 ?auto_338472 ?auto_338473 ?auto_338474 ?auto_338475 ?auto_338476 ?auto_338477 ?auto_338478 ?auto_338479 ?auto_338480 )
      ( MAKE-14PILE ?auto_338468 ?auto_338469 ?auto_338470 ?auto_338471 ?auto_338472 ?auto_338473 ?auto_338474 ?auto_338475 ?auto_338476 ?auto_338477 ?auto_338478 ?auto_338479 ?auto_338480 ?auto_338481 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338496 - BLOCK
      ?auto_338497 - BLOCK
      ?auto_338498 - BLOCK
      ?auto_338499 - BLOCK
      ?auto_338500 - BLOCK
      ?auto_338501 - BLOCK
      ?auto_338502 - BLOCK
      ?auto_338503 - BLOCK
      ?auto_338504 - BLOCK
      ?auto_338505 - BLOCK
      ?auto_338506 - BLOCK
      ?auto_338507 - BLOCK
      ?auto_338508 - BLOCK
      ?auto_338509 - BLOCK
    )
    :vars
    (
      ?auto_338510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338509 ?auto_338510 ) ( ON-TABLE ?auto_338496 ) ( ON ?auto_338497 ?auto_338496 ) ( ON ?auto_338498 ?auto_338497 ) ( ON ?auto_338499 ?auto_338498 ) ( ON ?auto_338500 ?auto_338499 ) ( ON ?auto_338501 ?auto_338500 ) ( ON ?auto_338502 ?auto_338501 ) ( ON ?auto_338503 ?auto_338502 ) ( ON ?auto_338504 ?auto_338503 ) ( ON ?auto_338505 ?auto_338504 ) ( ON ?auto_338506 ?auto_338505 ) ( not ( = ?auto_338496 ?auto_338497 ) ) ( not ( = ?auto_338496 ?auto_338498 ) ) ( not ( = ?auto_338496 ?auto_338499 ) ) ( not ( = ?auto_338496 ?auto_338500 ) ) ( not ( = ?auto_338496 ?auto_338501 ) ) ( not ( = ?auto_338496 ?auto_338502 ) ) ( not ( = ?auto_338496 ?auto_338503 ) ) ( not ( = ?auto_338496 ?auto_338504 ) ) ( not ( = ?auto_338496 ?auto_338505 ) ) ( not ( = ?auto_338496 ?auto_338506 ) ) ( not ( = ?auto_338496 ?auto_338507 ) ) ( not ( = ?auto_338496 ?auto_338508 ) ) ( not ( = ?auto_338496 ?auto_338509 ) ) ( not ( = ?auto_338496 ?auto_338510 ) ) ( not ( = ?auto_338497 ?auto_338498 ) ) ( not ( = ?auto_338497 ?auto_338499 ) ) ( not ( = ?auto_338497 ?auto_338500 ) ) ( not ( = ?auto_338497 ?auto_338501 ) ) ( not ( = ?auto_338497 ?auto_338502 ) ) ( not ( = ?auto_338497 ?auto_338503 ) ) ( not ( = ?auto_338497 ?auto_338504 ) ) ( not ( = ?auto_338497 ?auto_338505 ) ) ( not ( = ?auto_338497 ?auto_338506 ) ) ( not ( = ?auto_338497 ?auto_338507 ) ) ( not ( = ?auto_338497 ?auto_338508 ) ) ( not ( = ?auto_338497 ?auto_338509 ) ) ( not ( = ?auto_338497 ?auto_338510 ) ) ( not ( = ?auto_338498 ?auto_338499 ) ) ( not ( = ?auto_338498 ?auto_338500 ) ) ( not ( = ?auto_338498 ?auto_338501 ) ) ( not ( = ?auto_338498 ?auto_338502 ) ) ( not ( = ?auto_338498 ?auto_338503 ) ) ( not ( = ?auto_338498 ?auto_338504 ) ) ( not ( = ?auto_338498 ?auto_338505 ) ) ( not ( = ?auto_338498 ?auto_338506 ) ) ( not ( = ?auto_338498 ?auto_338507 ) ) ( not ( = ?auto_338498 ?auto_338508 ) ) ( not ( = ?auto_338498 ?auto_338509 ) ) ( not ( = ?auto_338498 ?auto_338510 ) ) ( not ( = ?auto_338499 ?auto_338500 ) ) ( not ( = ?auto_338499 ?auto_338501 ) ) ( not ( = ?auto_338499 ?auto_338502 ) ) ( not ( = ?auto_338499 ?auto_338503 ) ) ( not ( = ?auto_338499 ?auto_338504 ) ) ( not ( = ?auto_338499 ?auto_338505 ) ) ( not ( = ?auto_338499 ?auto_338506 ) ) ( not ( = ?auto_338499 ?auto_338507 ) ) ( not ( = ?auto_338499 ?auto_338508 ) ) ( not ( = ?auto_338499 ?auto_338509 ) ) ( not ( = ?auto_338499 ?auto_338510 ) ) ( not ( = ?auto_338500 ?auto_338501 ) ) ( not ( = ?auto_338500 ?auto_338502 ) ) ( not ( = ?auto_338500 ?auto_338503 ) ) ( not ( = ?auto_338500 ?auto_338504 ) ) ( not ( = ?auto_338500 ?auto_338505 ) ) ( not ( = ?auto_338500 ?auto_338506 ) ) ( not ( = ?auto_338500 ?auto_338507 ) ) ( not ( = ?auto_338500 ?auto_338508 ) ) ( not ( = ?auto_338500 ?auto_338509 ) ) ( not ( = ?auto_338500 ?auto_338510 ) ) ( not ( = ?auto_338501 ?auto_338502 ) ) ( not ( = ?auto_338501 ?auto_338503 ) ) ( not ( = ?auto_338501 ?auto_338504 ) ) ( not ( = ?auto_338501 ?auto_338505 ) ) ( not ( = ?auto_338501 ?auto_338506 ) ) ( not ( = ?auto_338501 ?auto_338507 ) ) ( not ( = ?auto_338501 ?auto_338508 ) ) ( not ( = ?auto_338501 ?auto_338509 ) ) ( not ( = ?auto_338501 ?auto_338510 ) ) ( not ( = ?auto_338502 ?auto_338503 ) ) ( not ( = ?auto_338502 ?auto_338504 ) ) ( not ( = ?auto_338502 ?auto_338505 ) ) ( not ( = ?auto_338502 ?auto_338506 ) ) ( not ( = ?auto_338502 ?auto_338507 ) ) ( not ( = ?auto_338502 ?auto_338508 ) ) ( not ( = ?auto_338502 ?auto_338509 ) ) ( not ( = ?auto_338502 ?auto_338510 ) ) ( not ( = ?auto_338503 ?auto_338504 ) ) ( not ( = ?auto_338503 ?auto_338505 ) ) ( not ( = ?auto_338503 ?auto_338506 ) ) ( not ( = ?auto_338503 ?auto_338507 ) ) ( not ( = ?auto_338503 ?auto_338508 ) ) ( not ( = ?auto_338503 ?auto_338509 ) ) ( not ( = ?auto_338503 ?auto_338510 ) ) ( not ( = ?auto_338504 ?auto_338505 ) ) ( not ( = ?auto_338504 ?auto_338506 ) ) ( not ( = ?auto_338504 ?auto_338507 ) ) ( not ( = ?auto_338504 ?auto_338508 ) ) ( not ( = ?auto_338504 ?auto_338509 ) ) ( not ( = ?auto_338504 ?auto_338510 ) ) ( not ( = ?auto_338505 ?auto_338506 ) ) ( not ( = ?auto_338505 ?auto_338507 ) ) ( not ( = ?auto_338505 ?auto_338508 ) ) ( not ( = ?auto_338505 ?auto_338509 ) ) ( not ( = ?auto_338505 ?auto_338510 ) ) ( not ( = ?auto_338506 ?auto_338507 ) ) ( not ( = ?auto_338506 ?auto_338508 ) ) ( not ( = ?auto_338506 ?auto_338509 ) ) ( not ( = ?auto_338506 ?auto_338510 ) ) ( not ( = ?auto_338507 ?auto_338508 ) ) ( not ( = ?auto_338507 ?auto_338509 ) ) ( not ( = ?auto_338507 ?auto_338510 ) ) ( not ( = ?auto_338508 ?auto_338509 ) ) ( not ( = ?auto_338508 ?auto_338510 ) ) ( not ( = ?auto_338509 ?auto_338510 ) ) ( ON ?auto_338508 ?auto_338509 ) ( CLEAR ?auto_338506 ) ( ON ?auto_338507 ?auto_338508 ) ( CLEAR ?auto_338507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_338496 ?auto_338497 ?auto_338498 ?auto_338499 ?auto_338500 ?auto_338501 ?auto_338502 ?auto_338503 ?auto_338504 ?auto_338505 ?auto_338506 ?auto_338507 )
      ( MAKE-14PILE ?auto_338496 ?auto_338497 ?auto_338498 ?auto_338499 ?auto_338500 ?auto_338501 ?auto_338502 ?auto_338503 ?auto_338504 ?auto_338505 ?auto_338506 ?auto_338507 ?auto_338508 ?auto_338509 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338525 - BLOCK
      ?auto_338526 - BLOCK
      ?auto_338527 - BLOCK
      ?auto_338528 - BLOCK
      ?auto_338529 - BLOCK
      ?auto_338530 - BLOCK
      ?auto_338531 - BLOCK
      ?auto_338532 - BLOCK
      ?auto_338533 - BLOCK
      ?auto_338534 - BLOCK
      ?auto_338535 - BLOCK
      ?auto_338536 - BLOCK
      ?auto_338537 - BLOCK
      ?auto_338538 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_338538 ) ( ON-TABLE ?auto_338525 ) ( ON ?auto_338526 ?auto_338525 ) ( ON ?auto_338527 ?auto_338526 ) ( ON ?auto_338528 ?auto_338527 ) ( ON ?auto_338529 ?auto_338528 ) ( ON ?auto_338530 ?auto_338529 ) ( ON ?auto_338531 ?auto_338530 ) ( ON ?auto_338532 ?auto_338531 ) ( ON ?auto_338533 ?auto_338532 ) ( ON ?auto_338534 ?auto_338533 ) ( ON ?auto_338535 ?auto_338534 ) ( not ( = ?auto_338525 ?auto_338526 ) ) ( not ( = ?auto_338525 ?auto_338527 ) ) ( not ( = ?auto_338525 ?auto_338528 ) ) ( not ( = ?auto_338525 ?auto_338529 ) ) ( not ( = ?auto_338525 ?auto_338530 ) ) ( not ( = ?auto_338525 ?auto_338531 ) ) ( not ( = ?auto_338525 ?auto_338532 ) ) ( not ( = ?auto_338525 ?auto_338533 ) ) ( not ( = ?auto_338525 ?auto_338534 ) ) ( not ( = ?auto_338525 ?auto_338535 ) ) ( not ( = ?auto_338525 ?auto_338536 ) ) ( not ( = ?auto_338525 ?auto_338537 ) ) ( not ( = ?auto_338525 ?auto_338538 ) ) ( not ( = ?auto_338526 ?auto_338527 ) ) ( not ( = ?auto_338526 ?auto_338528 ) ) ( not ( = ?auto_338526 ?auto_338529 ) ) ( not ( = ?auto_338526 ?auto_338530 ) ) ( not ( = ?auto_338526 ?auto_338531 ) ) ( not ( = ?auto_338526 ?auto_338532 ) ) ( not ( = ?auto_338526 ?auto_338533 ) ) ( not ( = ?auto_338526 ?auto_338534 ) ) ( not ( = ?auto_338526 ?auto_338535 ) ) ( not ( = ?auto_338526 ?auto_338536 ) ) ( not ( = ?auto_338526 ?auto_338537 ) ) ( not ( = ?auto_338526 ?auto_338538 ) ) ( not ( = ?auto_338527 ?auto_338528 ) ) ( not ( = ?auto_338527 ?auto_338529 ) ) ( not ( = ?auto_338527 ?auto_338530 ) ) ( not ( = ?auto_338527 ?auto_338531 ) ) ( not ( = ?auto_338527 ?auto_338532 ) ) ( not ( = ?auto_338527 ?auto_338533 ) ) ( not ( = ?auto_338527 ?auto_338534 ) ) ( not ( = ?auto_338527 ?auto_338535 ) ) ( not ( = ?auto_338527 ?auto_338536 ) ) ( not ( = ?auto_338527 ?auto_338537 ) ) ( not ( = ?auto_338527 ?auto_338538 ) ) ( not ( = ?auto_338528 ?auto_338529 ) ) ( not ( = ?auto_338528 ?auto_338530 ) ) ( not ( = ?auto_338528 ?auto_338531 ) ) ( not ( = ?auto_338528 ?auto_338532 ) ) ( not ( = ?auto_338528 ?auto_338533 ) ) ( not ( = ?auto_338528 ?auto_338534 ) ) ( not ( = ?auto_338528 ?auto_338535 ) ) ( not ( = ?auto_338528 ?auto_338536 ) ) ( not ( = ?auto_338528 ?auto_338537 ) ) ( not ( = ?auto_338528 ?auto_338538 ) ) ( not ( = ?auto_338529 ?auto_338530 ) ) ( not ( = ?auto_338529 ?auto_338531 ) ) ( not ( = ?auto_338529 ?auto_338532 ) ) ( not ( = ?auto_338529 ?auto_338533 ) ) ( not ( = ?auto_338529 ?auto_338534 ) ) ( not ( = ?auto_338529 ?auto_338535 ) ) ( not ( = ?auto_338529 ?auto_338536 ) ) ( not ( = ?auto_338529 ?auto_338537 ) ) ( not ( = ?auto_338529 ?auto_338538 ) ) ( not ( = ?auto_338530 ?auto_338531 ) ) ( not ( = ?auto_338530 ?auto_338532 ) ) ( not ( = ?auto_338530 ?auto_338533 ) ) ( not ( = ?auto_338530 ?auto_338534 ) ) ( not ( = ?auto_338530 ?auto_338535 ) ) ( not ( = ?auto_338530 ?auto_338536 ) ) ( not ( = ?auto_338530 ?auto_338537 ) ) ( not ( = ?auto_338530 ?auto_338538 ) ) ( not ( = ?auto_338531 ?auto_338532 ) ) ( not ( = ?auto_338531 ?auto_338533 ) ) ( not ( = ?auto_338531 ?auto_338534 ) ) ( not ( = ?auto_338531 ?auto_338535 ) ) ( not ( = ?auto_338531 ?auto_338536 ) ) ( not ( = ?auto_338531 ?auto_338537 ) ) ( not ( = ?auto_338531 ?auto_338538 ) ) ( not ( = ?auto_338532 ?auto_338533 ) ) ( not ( = ?auto_338532 ?auto_338534 ) ) ( not ( = ?auto_338532 ?auto_338535 ) ) ( not ( = ?auto_338532 ?auto_338536 ) ) ( not ( = ?auto_338532 ?auto_338537 ) ) ( not ( = ?auto_338532 ?auto_338538 ) ) ( not ( = ?auto_338533 ?auto_338534 ) ) ( not ( = ?auto_338533 ?auto_338535 ) ) ( not ( = ?auto_338533 ?auto_338536 ) ) ( not ( = ?auto_338533 ?auto_338537 ) ) ( not ( = ?auto_338533 ?auto_338538 ) ) ( not ( = ?auto_338534 ?auto_338535 ) ) ( not ( = ?auto_338534 ?auto_338536 ) ) ( not ( = ?auto_338534 ?auto_338537 ) ) ( not ( = ?auto_338534 ?auto_338538 ) ) ( not ( = ?auto_338535 ?auto_338536 ) ) ( not ( = ?auto_338535 ?auto_338537 ) ) ( not ( = ?auto_338535 ?auto_338538 ) ) ( not ( = ?auto_338536 ?auto_338537 ) ) ( not ( = ?auto_338536 ?auto_338538 ) ) ( not ( = ?auto_338537 ?auto_338538 ) ) ( ON ?auto_338537 ?auto_338538 ) ( CLEAR ?auto_338535 ) ( ON ?auto_338536 ?auto_338537 ) ( CLEAR ?auto_338536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_338525 ?auto_338526 ?auto_338527 ?auto_338528 ?auto_338529 ?auto_338530 ?auto_338531 ?auto_338532 ?auto_338533 ?auto_338534 ?auto_338535 ?auto_338536 )
      ( MAKE-14PILE ?auto_338525 ?auto_338526 ?auto_338527 ?auto_338528 ?auto_338529 ?auto_338530 ?auto_338531 ?auto_338532 ?auto_338533 ?auto_338534 ?auto_338535 ?auto_338536 ?auto_338537 ?auto_338538 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338553 - BLOCK
      ?auto_338554 - BLOCK
      ?auto_338555 - BLOCK
      ?auto_338556 - BLOCK
      ?auto_338557 - BLOCK
      ?auto_338558 - BLOCK
      ?auto_338559 - BLOCK
      ?auto_338560 - BLOCK
      ?auto_338561 - BLOCK
      ?auto_338562 - BLOCK
      ?auto_338563 - BLOCK
      ?auto_338564 - BLOCK
      ?auto_338565 - BLOCK
      ?auto_338566 - BLOCK
    )
    :vars
    (
      ?auto_338567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338566 ?auto_338567 ) ( ON-TABLE ?auto_338553 ) ( ON ?auto_338554 ?auto_338553 ) ( ON ?auto_338555 ?auto_338554 ) ( ON ?auto_338556 ?auto_338555 ) ( ON ?auto_338557 ?auto_338556 ) ( ON ?auto_338558 ?auto_338557 ) ( ON ?auto_338559 ?auto_338558 ) ( ON ?auto_338560 ?auto_338559 ) ( ON ?auto_338561 ?auto_338560 ) ( ON ?auto_338562 ?auto_338561 ) ( not ( = ?auto_338553 ?auto_338554 ) ) ( not ( = ?auto_338553 ?auto_338555 ) ) ( not ( = ?auto_338553 ?auto_338556 ) ) ( not ( = ?auto_338553 ?auto_338557 ) ) ( not ( = ?auto_338553 ?auto_338558 ) ) ( not ( = ?auto_338553 ?auto_338559 ) ) ( not ( = ?auto_338553 ?auto_338560 ) ) ( not ( = ?auto_338553 ?auto_338561 ) ) ( not ( = ?auto_338553 ?auto_338562 ) ) ( not ( = ?auto_338553 ?auto_338563 ) ) ( not ( = ?auto_338553 ?auto_338564 ) ) ( not ( = ?auto_338553 ?auto_338565 ) ) ( not ( = ?auto_338553 ?auto_338566 ) ) ( not ( = ?auto_338553 ?auto_338567 ) ) ( not ( = ?auto_338554 ?auto_338555 ) ) ( not ( = ?auto_338554 ?auto_338556 ) ) ( not ( = ?auto_338554 ?auto_338557 ) ) ( not ( = ?auto_338554 ?auto_338558 ) ) ( not ( = ?auto_338554 ?auto_338559 ) ) ( not ( = ?auto_338554 ?auto_338560 ) ) ( not ( = ?auto_338554 ?auto_338561 ) ) ( not ( = ?auto_338554 ?auto_338562 ) ) ( not ( = ?auto_338554 ?auto_338563 ) ) ( not ( = ?auto_338554 ?auto_338564 ) ) ( not ( = ?auto_338554 ?auto_338565 ) ) ( not ( = ?auto_338554 ?auto_338566 ) ) ( not ( = ?auto_338554 ?auto_338567 ) ) ( not ( = ?auto_338555 ?auto_338556 ) ) ( not ( = ?auto_338555 ?auto_338557 ) ) ( not ( = ?auto_338555 ?auto_338558 ) ) ( not ( = ?auto_338555 ?auto_338559 ) ) ( not ( = ?auto_338555 ?auto_338560 ) ) ( not ( = ?auto_338555 ?auto_338561 ) ) ( not ( = ?auto_338555 ?auto_338562 ) ) ( not ( = ?auto_338555 ?auto_338563 ) ) ( not ( = ?auto_338555 ?auto_338564 ) ) ( not ( = ?auto_338555 ?auto_338565 ) ) ( not ( = ?auto_338555 ?auto_338566 ) ) ( not ( = ?auto_338555 ?auto_338567 ) ) ( not ( = ?auto_338556 ?auto_338557 ) ) ( not ( = ?auto_338556 ?auto_338558 ) ) ( not ( = ?auto_338556 ?auto_338559 ) ) ( not ( = ?auto_338556 ?auto_338560 ) ) ( not ( = ?auto_338556 ?auto_338561 ) ) ( not ( = ?auto_338556 ?auto_338562 ) ) ( not ( = ?auto_338556 ?auto_338563 ) ) ( not ( = ?auto_338556 ?auto_338564 ) ) ( not ( = ?auto_338556 ?auto_338565 ) ) ( not ( = ?auto_338556 ?auto_338566 ) ) ( not ( = ?auto_338556 ?auto_338567 ) ) ( not ( = ?auto_338557 ?auto_338558 ) ) ( not ( = ?auto_338557 ?auto_338559 ) ) ( not ( = ?auto_338557 ?auto_338560 ) ) ( not ( = ?auto_338557 ?auto_338561 ) ) ( not ( = ?auto_338557 ?auto_338562 ) ) ( not ( = ?auto_338557 ?auto_338563 ) ) ( not ( = ?auto_338557 ?auto_338564 ) ) ( not ( = ?auto_338557 ?auto_338565 ) ) ( not ( = ?auto_338557 ?auto_338566 ) ) ( not ( = ?auto_338557 ?auto_338567 ) ) ( not ( = ?auto_338558 ?auto_338559 ) ) ( not ( = ?auto_338558 ?auto_338560 ) ) ( not ( = ?auto_338558 ?auto_338561 ) ) ( not ( = ?auto_338558 ?auto_338562 ) ) ( not ( = ?auto_338558 ?auto_338563 ) ) ( not ( = ?auto_338558 ?auto_338564 ) ) ( not ( = ?auto_338558 ?auto_338565 ) ) ( not ( = ?auto_338558 ?auto_338566 ) ) ( not ( = ?auto_338558 ?auto_338567 ) ) ( not ( = ?auto_338559 ?auto_338560 ) ) ( not ( = ?auto_338559 ?auto_338561 ) ) ( not ( = ?auto_338559 ?auto_338562 ) ) ( not ( = ?auto_338559 ?auto_338563 ) ) ( not ( = ?auto_338559 ?auto_338564 ) ) ( not ( = ?auto_338559 ?auto_338565 ) ) ( not ( = ?auto_338559 ?auto_338566 ) ) ( not ( = ?auto_338559 ?auto_338567 ) ) ( not ( = ?auto_338560 ?auto_338561 ) ) ( not ( = ?auto_338560 ?auto_338562 ) ) ( not ( = ?auto_338560 ?auto_338563 ) ) ( not ( = ?auto_338560 ?auto_338564 ) ) ( not ( = ?auto_338560 ?auto_338565 ) ) ( not ( = ?auto_338560 ?auto_338566 ) ) ( not ( = ?auto_338560 ?auto_338567 ) ) ( not ( = ?auto_338561 ?auto_338562 ) ) ( not ( = ?auto_338561 ?auto_338563 ) ) ( not ( = ?auto_338561 ?auto_338564 ) ) ( not ( = ?auto_338561 ?auto_338565 ) ) ( not ( = ?auto_338561 ?auto_338566 ) ) ( not ( = ?auto_338561 ?auto_338567 ) ) ( not ( = ?auto_338562 ?auto_338563 ) ) ( not ( = ?auto_338562 ?auto_338564 ) ) ( not ( = ?auto_338562 ?auto_338565 ) ) ( not ( = ?auto_338562 ?auto_338566 ) ) ( not ( = ?auto_338562 ?auto_338567 ) ) ( not ( = ?auto_338563 ?auto_338564 ) ) ( not ( = ?auto_338563 ?auto_338565 ) ) ( not ( = ?auto_338563 ?auto_338566 ) ) ( not ( = ?auto_338563 ?auto_338567 ) ) ( not ( = ?auto_338564 ?auto_338565 ) ) ( not ( = ?auto_338564 ?auto_338566 ) ) ( not ( = ?auto_338564 ?auto_338567 ) ) ( not ( = ?auto_338565 ?auto_338566 ) ) ( not ( = ?auto_338565 ?auto_338567 ) ) ( not ( = ?auto_338566 ?auto_338567 ) ) ( ON ?auto_338565 ?auto_338566 ) ( ON ?auto_338564 ?auto_338565 ) ( CLEAR ?auto_338562 ) ( ON ?auto_338563 ?auto_338564 ) ( CLEAR ?auto_338563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_338553 ?auto_338554 ?auto_338555 ?auto_338556 ?auto_338557 ?auto_338558 ?auto_338559 ?auto_338560 ?auto_338561 ?auto_338562 ?auto_338563 )
      ( MAKE-14PILE ?auto_338553 ?auto_338554 ?auto_338555 ?auto_338556 ?auto_338557 ?auto_338558 ?auto_338559 ?auto_338560 ?auto_338561 ?auto_338562 ?auto_338563 ?auto_338564 ?auto_338565 ?auto_338566 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338582 - BLOCK
      ?auto_338583 - BLOCK
      ?auto_338584 - BLOCK
      ?auto_338585 - BLOCK
      ?auto_338586 - BLOCK
      ?auto_338587 - BLOCK
      ?auto_338588 - BLOCK
      ?auto_338589 - BLOCK
      ?auto_338590 - BLOCK
      ?auto_338591 - BLOCK
      ?auto_338592 - BLOCK
      ?auto_338593 - BLOCK
      ?auto_338594 - BLOCK
      ?auto_338595 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_338595 ) ( ON-TABLE ?auto_338582 ) ( ON ?auto_338583 ?auto_338582 ) ( ON ?auto_338584 ?auto_338583 ) ( ON ?auto_338585 ?auto_338584 ) ( ON ?auto_338586 ?auto_338585 ) ( ON ?auto_338587 ?auto_338586 ) ( ON ?auto_338588 ?auto_338587 ) ( ON ?auto_338589 ?auto_338588 ) ( ON ?auto_338590 ?auto_338589 ) ( ON ?auto_338591 ?auto_338590 ) ( not ( = ?auto_338582 ?auto_338583 ) ) ( not ( = ?auto_338582 ?auto_338584 ) ) ( not ( = ?auto_338582 ?auto_338585 ) ) ( not ( = ?auto_338582 ?auto_338586 ) ) ( not ( = ?auto_338582 ?auto_338587 ) ) ( not ( = ?auto_338582 ?auto_338588 ) ) ( not ( = ?auto_338582 ?auto_338589 ) ) ( not ( = ?auto_338582 ?auto_338590 ) ) ( not ( = ?auto_338582 ?auto_338591 ) ) ( not ( = ?auto_338582 ?auto_338592 ) ) ( not ( = ?auto_338582 ?auto_338593 ) ) ( not ( = ?auto_338582 ?auto_338594 ) ) ( not ( = ?auto_338582 ?auto_338595 ) ) ( not ( = ?auto_338583 ?auto_338584 ) ) ( not ( = ?auto_338583 ?auto_338585 ) ) ( not ( = ?auto_338583 ?auto_338586 ) ) ( not ( = ?auto_338583 ?auto_338587 ) ) ( not ( = ?auto_338583 ?auto_338588 ) ) ( not ( = ?auto_338583 ?auto_338589 ) ) ( not ( = ?auto_338583 ?auto_338590 ) ) ( not ( = ?auto_338583 ?auto_338591 ) ) ( not ( = ?auto_338583 ?auto_338592 ) ) ( not ( = ?auto_338583 ?auto_338593 ) ) ( not ( = ?auto_338583 ?auto_338594 ) ) ( not ( = ?auto_338583 ?auto_338595 ) ) ( not ( = ?auto_338584 ?auto_338585 ) ) ( not ( = ?auto_338584 ?auto_338586 ) ) ( not ( = ?auto_338584 ?auto_338587 ) ) ( not ( = ?auto_338584 ?auto_338588 ) ) ( not ( = ?auto_338584 ?auto_338589 ) ) ( not ( = ?auto_338584 ?auto_338590 ) ) ( not ( = ?auto_338584 ?auto_338591 ) ) ( not ( = ?auto_338584 ?auto_338592 ) ) ( not ( = ?auto_338584 ?auto_338593 ) ) ( not ( = ?auto_338584 ?auto_338594 ) ) ( not ( = ?auto_338584 ?auto_338595 ) ) ( not ( = ?auto_338585 ?auto_338586 ) ) ( not ( = ?auto_338585 ?auto_338587 ) ) ( not ( = ?auto_338585 ?auto_338588 ) ) ( not ( = ?auto_338585 ?auto_338589 ) ) ( not ( = ?auto_338585 ?auto_338590 ) ) ( not ( = ?auto_338585 ?auto_338591 ) ) ( not ( = ?auto_338585 ?auto_338592 ) ) ( not ( = ?auto_338585 ?auto_338593 ) ) ( not ( = ?auto_338585 ?auto_338594 ) ) ( not ( = ?auto_338585 ?auto_338595 ) ) ( not ( = ?auto_338586 ?auto_338587 ) ) ( not ( = ?auto_338586 ?auto_338588 ) ) ( not ( = ?auto_338586 ?auto_338589 ) ) ( not ( = ?auto_338586 ?auto_338590 ) ) ( not ( = ?auto_338586 ?auto_338591 ) ) ( not ( = ?auto_338586 ?auto_338592 ) ) ( not ( = ?auto_338586 ?auto_338593 ) ) ( not ( = ?auto_338586 ?auto_338594 ) ) ( not ( = ?auto_338586 ?auto_338595 ) ) ( not ( = ?auto_338587 ?auto_338588 ) ) ( not ( = ?auto_338587 ?auto_338589 ) ) ( not ( = ?auto_338587 ?auto_338590 ) ) ( not ( = ?auto_338587 ?auto_338591 ) ) ( not ( = ?auto_338587 ?auto_338592 ) ) ( not ( = ?auto_338587 ?auto_338593 ) ) ( not ( = ?auto_338587 ?auto_338594 ) ) ( not ( = ?auto_338587 ?auto_338595 ) ) ( not ( = ?auto_338588 ?auto_338589 ) ) ( not ( = ?auto_338588 ?auto_338590 ) ) ( not ( = ?auto_338588 ?auto_338591 ) ) ( not ( = ?auto_338588 ?auto_338592 ) ) ( not ( = ?auto_338588 ?auto_338593 ) ) ( not ( = ?auto_338588 ?auto_338594 ) ) ( not ( = ?auto_338588 ?auto_338595 ) ) ( not ( = ?auto_338589 ?auto_338590 ) ) ( not ( = ?auto_338589 ?auto_338591 ) ) ( not ( = ?auto_338589 ?auto_338592 ) ) ( not ( = ?auto_338589 ?auto_338593 ) ) ( not ( = ?auto_338589 ?auto_338594 ) ) ( not ( = ?auto_338589 ?auto_338595 ) ) ( not ( = ?auto_338590 ?auto_338591 ) ) ( not ( = ?auto_338590 ?auto_338592 ) ) ( not ( = ?auto_338590 ?auto_338593 ) ) ( not ( = ?auto_338590 ?auto_338594 ) ) ( not ( = ?auto_338590 ?auto_338595 ) ) ( not ( = ?auto_338591 ?auto_338592 ) ) ( not ( = ?auto_338591 ?auto_338593 ) ) ( not ( = ?auto_338591 ?auto_338594 ) ) ( not ( = ?auto_338591 ?auto_338595 ) ) ( not ( = ?auto_338592 ?auto_338593 ) ) ( not ( = ?auto_338592 ?auto_338594 ) ) ( not ( = ?auto_338592 ?auto_338595 ) ) ( not ( = ?auto_338593 ?auto_338594 ) ) ( not ( = ?auto_338593 ?auto_338595 ) ) ( not ( = ?auto_338594 ?auto_338595 ) ) ( ON ?auto_338594 ?auto_338595 ) ( ON ?auto_338593 ?auto_338594 ) ( CLEAR ?auto_338591 ) ( ON ?auto_338592 ?auto_338593 ) ( CLEAR ?auto_338592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_338582 ?auto_338583 ?auto_338584 ?auto_338585 ?auto_338586 ?auto_338587 ?auto_338588 ?auto_338589 ?auto_338590 ?auto_338591 ?auto_338592 )
      ( MAKE-14PILE ?auto_338582 ?auto_338583 ?auto_338584 ?auto_338585 ?auto_338586 ?auto_338587 ?auto_338588 ?auto_338589 ?auto_338590 ?auto_338591 ?auto_338592 ?auto_338593 ?auto_338594 ?auto_338595 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338610 - BLOCK
      ?auto_338611 - BLOCK
      ?auto_338612 - BLOCK
      ?auto_338613 - BLOCK
      ?auto_338614 - BLOCK
      ?auto_338615 - BLOCK
      ?auto_338616 - BLOCK
      ?auto_338617 - BLOCK
      ?auto_338618 - BLOCK
      ?auto_338619 - BLOCK
      ?auto_338620 - BLOCK
      ?auto_338621 - BLOCK
      ?auto_338622 - BLOCK
      ?auto_338623 - BLOCK
    )
    :vars
    (
      ?auto_338624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338623 ?auto_338624 ) ( ON-TABLE ?auto_338610 ) ( ON ?auto_338611 ?auto_338610 ) ( ON ?auto_338612 ?auto_338611 ) ( ON ?auto_338613 ?auto_338612 ) ( ON ?auto_338614 ?auto_338613 ) ( ON ?auto_338615 ?auto_338614 ) ( ON ?auto_338616 ?auto_338615 ) ( ON ?auto_338617 ?auto_338616 ) ( ON ?auto_338618 ?auto_338617 ) ( not ( = ?auto_338610 ?auto_338611 ) ) ( not ( = ?auto_338610 ?auto_338612 ) ) ( not ( = ?auto_338610 ?auto_338613 ) ) ( not ( = ?auto_338610 ?auto_338614 ) ) ( not ( = ?auto_338610 ?auto_338615 ) ) ( not ( = ?auto_338610 ?auto_338616 ) ) ( not ( = ?auto_338610 ?auto_338617 ) ) ( not ( = ?auto_338610 ?auto_338618 ) ) ( not ( = ?auto_338610 ?auto_338619 ) ) ( not ( = ?auto_338610 ?auto_338620 ) ) ( not ( = ?auto_338610 ?auto_338621 ) ) ( not ( = ?auto_338610 ?auto_338622 ) ) ( not ( = ?auto_338610 ?auto_338623 ) ) ( not ( = ?auto_338610 ?auto_338624 ) ) ( not ( = ?auto_338611 ?auto_338612 ) ) ( not ( = ?auto_338611 ?auto_338613 ) ) ( not ( = ?auto_338611 ?auto_338614 ) ) ( not ( = ?auto_338611 ?auto_338615 ) ) ( not ( = ?auto_338611 ?auto_338616 ) ) ( not ( = ?auto_338611 ?auto_338617 ) ) ( not ( = ?auto_338611 ?auto_338618 ) ) ( not ( = ?auto_338611 ?auto_338619 ) ) ( not ( = ?auto_338611 ?auto_338620 ) ) ( not ( = ?auto_338611 ?auto_338621 ) ) ( not ( = ?auto_338611 ?auto_338622 ) ) ( not ( = ?auto_338611 ?auto_338623 ) ) ( not ( = ?auto_338611 ?auto_338624 ) ) ( not ( = ?auto_338612 ?auto_338613 ) ) ( not ( = ?auto_338612 ?auto_338614 ) ) ( not ( = ?auto_338612 ?auto_338615 ) ) ( not ( = ?auto_338612 ?auto_338616 ) ) ( not ( = ?auto_338612 ?auto_338617 ) ) ( not ( = ?auto_338612 ?auto_338618 ) ) ( not ( = ?auto_338612 ?auto_338619 ) ) ( not ( = ?auto_338612 ?auto_338620 ) ) ( not ( = ?auto_338612 ?auto_338621 ) ) ( not ( = ?auto_338612 ?auto_338622 ) ) ( not ( = ?auto_338612 ?auto_338623 ) ) ( not ( = ?auto_338612 ?auto_338624 ) ) ( not ( = ?auto_338613 ?auto_338614 ) ) ( not ( = ?auto_338613 ?auto_338615 ) ) ( not ( = ?auto_338613 ?auto_338616 ) ) ( not ( = ?auto_338613 ?auto_338617 ) ) ( not ( = ?auto_338613 ?auto_338618 ) ) ( not ( = ?auto_338613 ?auto_338619 ) ) ( not ( = ?auto_338613 ?auto_338620 ) ) ( not ( = ?auto_338613 ?auto_338621 ) ) ( not ( = ?auto_338613 ?auto_338622 ) ) ( not ( = ?auto_338613 ?auto_338623 ) ) ( not ( = ?auto_338613 ?auto_338624 ) ) ( not ( = ?auto_338614 ?auto_338615 ) ) ( not ( = ?auto_338614 ?auto_338616 ) ) ( not ( = ?auto_338614 ?auto_338617 ) ) ( not ( = ?auto_338614 ?auto_338618 ) ) ( not ( = ?auto_338614 ?auto_338619 ) ) ( not ( = ?auto_338614 ?auto_338620 ) ) ( not ( = ?auto_338614 ?auto_338621 ) ) ( not ( = ?auto_338614 ?auto_338622 ) ) ( not ( = ?auto_338614 ?auto_338623 ) ) ( not ( = ?auto_338614 ?auto_338624 ) ) ( not ( = ?auto_338615 ?auto_338616 ) ) ( not ( = ?auto_338615 ?auto_338617 ) ) ( not ( = ?auto_338615 ?auto_338618 ) ) ( not ( = ?auto_338615 ?auto_338619 ) ) ( not ( = ?auto_338615 ?auto_338620 ) ) ( not ( = ?auto_338615 ?auto_338621 ) ) ( not ( = ?auto_338615 ?auto_338622 ) ) ( not ( = ?auto_338615 ?auto_338623 ) ) ( not ( = ?auto_338615 ?auto_338624 ) ) ( not ( = ?auto_338616 ?auto_338617 ) ) ( not ( = ?auto_338616 ?auto_338618 ) ) ( not ( = ?auto_338616 ?auto_338619 ) ) ( not ( = ?auto_338616 ?auto_338620 ) ) ( not ( = ?auto_338616 ?auto_338621 ) ) ( not ( = ?auto_338616 ?auto_338622 ) ) ( not ( = ?auto_338616 ?auto_338623 ) ) ( not ( = ?auto_338616 ?auto_338624 ) ) ( not ( = ?auto_338617 ?auto_338618 ) ) ( not ( = ?auto_338617 ?auto_338619 ) ) ( not ( = ?auto_338617 ?auto_338620 ) ) ( not ( = ?auto_338617 ?auto_338621 ) ) ( not ( = ?auto_338617 ?auto_338622 ) ) ( not ( = ?auto_338617 ?auto_338623 ) ) ( not ( = ?auto_338617 ?auto_338624 ) ) ( not ( = ?auto_338618 ?auto_338619 ) ) ( not ( = ?auto_338618 ?auto_338620 ) ) ( not ( = ?auto_338618 ?auto_338621 ) ) ( not ( = ?auto_338618 ?auto_338622 ) ) ( not ( = ?auto_338618 ?auto_338623 ) ) ( not ( = ?auto_338618 ?auto_338624 ) ) ( not ( = ?auto_338619 ?auto_338620 ) ) ( not ( = ?auto_338619 ?auto_338621 ) ) ( not ( = ?auto_338619 ?auto_338622 ) ) ( not ( = ?auto_338619 ?auto_338623 ) ) ( not ( = ?auto_338619 ?auto_338624 ) ) ( not ( = ?auto_338620 ?auto_338621 ) ) ( not ( = ?auto_338620 ?auto_338622 ) ) ( not ( = ?auto_338620 ?auto_338623 ) ) ( not ( = ?auto_338620 ?auto_338624 ) ) ( not ( = ?auto_338621 ?auto_338622 ) ) ( not ( = ?auto_338621 ?auto_338623 ) ) ( not ( = ?auto_338621 ?auto_338624 ) ) ( not ( = ?auto_338622 ?auto_338623 ) ) ( not ( = ?auto_338622 ?auto_338624 ) ) ( not ( = ?auto_338623 ?auto_338624 ) ) ( ON ?auto_338622 ?auto_338623 ) ( ON ?auto_338621 ?auto_338622 ) ( ON ?auto_338620 ?auto_338621 ) ( CLEAR ?auto_338618 ) ( ON ?auto_338619 ?auto_338620 ) ( CLEAR ?auto_338619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_338610 ?auto_338611 ?auto_338612 ?auto_338613 ?auto_338614 ?auto_338615 ?auto_338616 ?auto_338617 ?auto_338618 ?auto_338619 )
      ( MAKE-14PILE ?auto_338610 ?auto_338611 ?auto_338612 ?auto_338613 ?auto_338614 ?auto_338615 ?auto_338616 ?auto_338617 ?auto_338618 ?auto_338619 ?auto_338620 ?auto_338621 ?auto_338622 ?auto_338623 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338639 - BLOCK
      ?auto_338640 - BLOCK
      ?auto_338641 - BLOCK
      ?auto_338642 - BLOCK
      ?auto_338643 - BLOCK
      ?auto_338644 - BLOCK
      ?auto_338645 - BLOCK
      ?auto_338646 - BLOCK
      ?auto_338647 - BLOCK
      ?auto_338648 - BLOCK
      ?auto_338649 - BLOCK
      ?auto_338650 - BLOCK
      ?auto_338651 - BLOCK
      ?auto_338652 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_338652 ) ( ON-TABLE ?auto_338639 ) ( ON ?auto_338640 ?auto_338639 ) ( ON ?auto_338641 ?auto_338640 ) ( ON ?auto_338642 ?auto_338641 ) ( ON ?auto_338643 ?auto_338642 ) ( ON ?auto_338644 ?auto_338643 ) ( ON ?auto_338645 ?auto_338644 ) ( ON ?auto_338646 ?auto_338645 ) ( ON ?auto_338647 ?auto_338646 ) ( not ( = ?auto_338639 ?auto_338640 ) ) ( not ( = ?auto_338639 ?auto_338641 ) ) ( not ( = ?auto_338639 ?auto_338642 ) ) ( not ( = ?auto_338639 ?auto_338643 ) ) ( not ( = ?auto_338639 ?auto_338644 ) ) ( not ( = ?auto_338639 ?auto_338645 ) ) ( not ( = ?auto_338639 ?auto_338646 ) ) ( not ( = ?auto_338639 ?auto_338647 ) ) ( not ( = ?auto_338639 ?auto_338648 ) ) ( not ( = ?auto_338639 ?auto_338649 ) ) ( not ( = ?auto_338639 ?auto_338650 ) ) ( not ( = ?auto_338639 ?auto_338651 ) ) ( not ( = ?auto_338639 ?auto_338652 ) ) ( not ( = ?auto_338640 ?auto_338641 ) ) ( not ( = ?auto_338640 ?auto_338642 ) ) ( not ( = ?auto_338640 ?auto_338643 ) ) ( not ( = ?auto_338640 ?auto_338644 ) ) ( not ( = ?auto_338640 ?auto_338645 ) ) ( not ( = ?auto_338640 ?auto_338646 ) ) ( not ( = ?auto_338640 ?auto_338647 ) ) ( not ( = ?auto_338640 ?auto_338648 ) ) ( not ( = ?auto_338640 ?auto_338649 ) ) ( not ( = ?auto_338640 ?auto_338650 ) ) ( not ( = ?auto_338640 ?auto_338651 ) ) ( not ( = ?auto_338640 ?auto_338652 ) ) ( not ( = ?auto_338641 ?auto_338642 ) ) ( not ( = ?auto_338641 ?auto_338643 ) ) ( not ( = ?auto_338641 ?auto_338644 ) ) ( not ( = ?auto_338641 ?auto_338645 ) ) ( not ( = ?auto_338641 ?auto_338646 ) ) ( not ( = ?auto_338641 ?auto_338647 ) ) ( not ( = ?auto_338641 ?auto_338648 ) ) ( not ( = ?auto_338641 ?auto_338649 ) ) ( not ( = ?auto_338641 ?auto_338650 ) ) ( not ( = ?auto_338641 ?auto_338651 ) ) ( not ( = ?auto_338641 ?auto_338652 ) ) ( not ( = ?auto_338642 ?auto_338643 ) ) ( not ( = ?auto_338642 ?auto_338644 ) ) ( not ( = ?auto_338642 ?auto_338645 ) ) ( not ( = ?auto_338642 ?auto_338646 ) ) ( not ( = ?auto_338642 ?auto_338647 ) ) ( not ( = ?auto_338642 ?auto_338648 ) ) ( not ( = ?auto_338642 ?auto_338649 ) ) ( not ( = ?auto_338642 ?auto_338650 ) ) ( not ( = ?auto_338642 ?auto_338651 ) ) ( not ( = ?auto_338642 ?auto_338652 ) ) ( not ( = ?auto_338643 ?auto_338644 ) ) ( not ( = ?auto_338643 ?auto_338645 ) ) ( not ( = ?auto_338643 ?auto_338646 ) ) ( not ( = ?auto_338643 ?auto_338647 ) ) ( not ( = ?auto_338643 ?auto_338648 ) ) ( not ( = ?auto_338643 ?auto_338649 ) ) ( not ( = ?auto_338643 ?auto_338650 ) ) ( not ( = ?auto_338643 ?auto_338651 ) ) ( not ( = ?auto_338643 ?auto_338652 ) ) ( not ( = ?auto_338644 ?auto_338645 ) ) ( not ( = ?auto_338644 ?auto_338646 ) ) ( not ( = ?auto_338644 ?auto_338647 ) ) ( not ( = ?auto_338644 ?auto_338648 ) ) ( not ( = ?auto_338644 ?auto_338649 ) ) ( not ( = ?auto_338644 ?auto_338650 ) ) ( not ( = ?auto_338644 ?auto_338651 ) ) ( not ( = ?auto_338644 ?auto_338652 ) ) ( not ( = ?auto_338645 ?auto_338646 ) ) ( not ( = ?auto_338645 ?auto_338647 ) ) ( not ( = ?auto_338645 ?auto_338648 ) ) ( not ( = ?auto_338645 ?auto_338649 ) ) ( not ( = ?auto_338645 ?auto_338650 ) ) ( not ( = ?auto_338645 ?auto_338651 ) ) ( not ( = ?auto_338645 ?auto_338652 ) ) ( not ( = ?auto_338646 ?auto_338647 ) ) ( not ( = ?auto_338646 ?auto_338648 ) ) ( not ( = ?auto_338646 ?auto_338649 ) ) ( not ( = ?auto_338646 ?auto_338650 ) ) ( not ( = ?auto_338646 ?auto_338651 ) ) ( not ( = ?auto_338646 ?auto_338652 ) ) ( not ( = ?auto_338647 ?auto_338648 ) ) ( not ( = ?auto_338647 ?auto_338649 ) ) ( not ( = ?auto_338647 ?auto_338650 ) ) ( not ( = ?auto_338647 ?auto_338651 ) ) ( not ( = ?auto_338647 ?auto_338652 ) ) ( not ( = ?auto_338648 ?auto_338649 ) ) ( not ( = ?auto_338648 ?auto_338650 ) ) ( not ( = ?auto_338648 ?auto_338651 ) ) ( not ( = ?auto_338648 ?auto_338652 ) ) ( not ( = ?auto_338649 ?auto_338650 ) ) ( not ( = ?auto_338649 ?auto_338651 ) ) ( not ( = ?auto_338649 ?auto_338652 ) ) ( not ( = ?auto_338650 ?auto_338651 ) ) ( not ( = ?auto_338650 ?auto_338652 ) ) ( not ( = ?auto_338651 ?auto_338652 ) ) ( ON ?auto_338651 ?auto_338652 ) ( ON ?auto_338650 ?auto_338651 ) ( ON ?auto_338649 ?auto_338650 ) ( CLEAR ?auto_338647 ) ( ON ?auto_338648 ?auto_338649 ) ( CLEAR ?auto_338648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_338639 ?auto_338640 ?auto_338641 ?auto_338642 ?auto_338643 ?auto_338644 ?auto_338645 ?auto_338646 ?auto_338647 ?auto_338648 )
      ( MAKE-14PILE ?auto_338639 ?auto_338640 ?auto_338641 ?auto_338642 ?auto_338643 ?auto_338644 ?auto_338645 ?auto_338646 ?auto_338647 ?auto_338648 ?auto_338649 ?auto_338650 ?auto_338651 ?auto_338652 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338667 - BLOCK
      ?auto_338668 - BLOCK
      ?auto_338669 - BLOCK
      ?auto_338670 - BLOCK
      ?auto_338671 - BLOCK
      ?auto_338672 - BLOCK
      ?auto_338673 - BLOCK
      ?auto_338674 - BLOCK
      ?auto_338675 - BLOCK
      ?auto_338676 - BLOCK
      ?auto_338677 - BLOCK
      ?auto_338678 - BLOCK
      ?auto_338679 - BLOCK
      ?auto_338680 - BLOCK
    )
    :vars
    (
      ?auto_338681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338680 ?auto_338681 ) ( ON-TABLE ?auto_338667 ) ( ON ?auto_338668 ?auto_338667 ) ( ON ?auto_338669 ?auto_338668 ) ( ON ?auto_338670 ?auto_338669 ) ( ON ?auto_338671 ?auto_338670 ) ( ON ?auto_338672 ?auto_338671 ) ( ON ?auto_338673 ?auto_338672 ) ( ON ?auto_338674 ?auto_338673 ) ( not ( = ?auto_338667 ?auto_338668 ) ) ( not ( = ?auto_338667 ?auto_338669 ) ) ( not ( = ?auto_338667 ?auto_338670 ) ) ( not ( = ?auto_338667 ?auto_338671 ) ) ( not ( = ?auto_338667 ?auto_338672 ) ) ( not ( = ?auto_338667 ?auto_338673 ) ) ( not ( = ?auto_338667 ?auto_338674 ) ) ( not ( = ?auto_338667 ?auto_338675 ) ) ( not ( = ?auto_338667 ?auto_338676 ) ) ( not ( = ?auto_338667 ?auto_338677 ) ) ( not ( = ?auto_338667 ?auto_338678 ) ) ( not ( = ?auto_338667 ?auto_338679 ) ) ( not ( = ?auto_338667 ?auto_338680 ) ) ( not ( = ?auto_338667 ?auto_338681 ) ) ( not ( = ?auto_338668 ?auto_338669 ) ) ( not ( = ?auto_338668 ?auto_338670 ) ) ( not ( = ?auto_338668 ?auto_338671 ) ) ( not ( = ?auto_338668 ?auto_338672 ) ) ( not ( = ?auto_338668 ?auto_338673 ) ) ( not ( = ?auto_338668 ?auto_338674 ) ) ( not ( = ?auto_338668 ?auto_338675 ) ) ( not ( = ?auto_338668 ?auto_338676 ) ) ( not ( = ?auto_338668 ?auto_338677 ) ) ( not ( = ?auto_338668 ?auto_338678 ) ) ( not ( = ?auto_338668 ?auto_338679 ) ) ( not ( = ?auto_338668 ?auto_338680 ) ) ( not ( = ?auto_338668 ?auto_338681 ) ) ( not ( = ?auto_338669 ?auto_338670 ) ) ( not ( = ?auto_338669 ?auto_338671 ) ) ( not ( = ?auto_338669 ?auto_338672 ) ) ( not ( = ?auto_338669 ?auto_338673 ) ) ( not ( = ?auto_338669 ?auto_338674 ) ) ( not ( = ?auto_338669 ?auto_338675 ) ) ( not ( = ?auto_338669 ?auto_338676 ) ) ( not ( = ?auto_338669 ?auto_338677 ) ) ( not ( = ?auto_338669 ?auto_338678 ) ) ( not ( = ?auto_338669 ?auto_338679 ) ) ( not ( = ?auto_338669 ?auto_338680 ) ) ( not ( = ?auto_338669 ?auto_338681 ) ) ( not ( = ?auto_338670 ?auto_338671 ) ) ( not ( = ?auto_338670 ?auto_338672 ) ) ( not ( = ?auto_338670 ?auto_338673 ) ) ( not ( = ?auto_338670 ?auto_338674 ) ) ( not ( = ?auto_338670 ?auto_338675 ) ) ( not ( = ?auto_338670 ?auto_338676 ) ) ( not ( = ?auto_338670 ?auto_338677 ) ) ( not ( = ?auto_338670 ?auto_338678 ) ) ( not ( = ?auto_338670 ?auto_338679 ) ) ( not ( = ?auto_338670 ?auto_338680 ) ) ( not ( = ?auto_338670 ?auto_338681 ) ) ( not ( = ?auto_338671 ?auto_338672 ) ) ( not ( = ?auto_338671 ?auto_338673 ) ) ( not ( = ?auto_338671 ?auto_338674 ) ) ( not ( = ?auto_338671 ?auto_338675 ) ) ( not ( = ?auto_338671 ?auto_338676 ) ) ( not ( = ?auto_338671 ?auto_338677 ) ) ( not ( = ?auto_338671 ?auto_338678 ) ) ( not ( = ?auto_338671 ?auto_338679 ) ) ( not ( = ?auto_338671 ?auto_338680 ) ) ( not ( = ?auto_338671 ?auto_338681 ) ) ( not ( = ?auto_338672 ?auto_338673 ) ) ( not ( = ?auto_338672 ?auto_338674 ) ) ( not ( = ?auto_338672 ?auto_338675 ) ) ( not ( = ?auto_338672 ?auto_338676 ) ) ( not ( = ?auto_338672 ?auto_338677 ) ) ( not ( = ?auto_338672 ?auto_338678 ) ) ( not ( = ?auto_338672 ?auto_338679 ) ) ( not ( = ?auto_338672 ?auto_338680 ) ) ( not ( = ?auto_338672 ?auto_338681 ) ) ( not ( = ?auto_338673 ?auto_338674 ) ) ( not ( = ?auto_338673 ?auto_338675 ) ) ( not ( = ?auto_338673 ?auto_338676 ) ) ( not ( = ?auto_338673 ?auto_338677 ) ) ( not ( = ?auto_338673 ?auto_338678 ) ) ( not ( = ?auto_338673 ?auto_338679 ) ) ( not ( = ?auto_338673 ?auto_338680 ) ) ( not ( = ?auto_338673 ?auto_338681 ) ) ( not ( = ?auto_338674 ?auto_338675 ) ) ( not ( = ?auto_338674 ?auto_338676 ) ) ( not ( = ?auto_338674 ?auto_338677 ) ) ( not ( = ?auto_338674 ?auto_338678 ) ) ( not ( = ?auto_338674 ?auto_338679 ) ) ( not ( = ?auto_338674 ?auto_338680 ) ) ( not ( = ?auto_338674 ?auto_338681 ) ) ( not ( = ?auto_338675 ?auto_338676 ) ) ( not ( = ?auto_338675 ?auto_338677 ) ) ( not ( = ?auto_338675 ?auto_338678 ) ) ( not ( = ?auto_338675 ?auto_338679 ) ) ( not ( = ?auto_338675 ?auto_338680 ) ) ( not ( = ?auto_338675 ?auto_338681 ) ) ( not ( = ?auto_338676 ?auto_338677 ) ) ( not ( = ?auto_338676 ?auto_338678 ) ) ( not ( = ?auto_338676 ?auto_338679 ) ) ( not ( = ?auto_338676 ?auto_338680 ) ) ( not ( = ?auto_338676 ?auto_338681 ) ) ( not ( = ?auto_338677 ?auto_338678 ) ) ( not ( = ?auto_338677 ?auto_338679 ) ) ( not ( = ?auto_338677 ?auto_338680 ) ) ( not ( = ?auto_338677 ?auto_338681 ) ) ( not ( = ?auto_338678 ?auto_338679 ) ) ( not ( = ?auto_338678 ?auto_338680 ) ) ( not ( = ?auto_338678 ?auto_338681 ) ) ( not ( = ?auto_338679 ?auto_338680 ) ) ( not ( = ?auto_338679 ?auto_338681 ) ) ( not ( = ?auto_338680 ?auto_338681 ) ) ( ON ?auto_338679 ?auto_338680 ) ( ON ?auto_338678 ?auto_338679 ) ( ON ?auto_338677 ?auto_338678 ) ( ON ?auto_338676 ?auto_338677 ) ( CLEAR ?auto_338674 ) ( ON ?auto_338675 ?auto_338676 ) ( CLEAR ?auto_338675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_338667 ?auto_338668 ?auto_338669 ?auto_338670 ?auto_338671 ?auto_338672 ?auto_338673 ?auto_338674 ?auto_338675 )
      ( MAKE-14PILE ?auto_338667 ?auto_338668 ?auto_338669 ?auto_338670 ?auto_338671 ?auto_338672 ?auto_338673 ?auto_338674 ?auto_338675 ?auto_338676 ?auto_338677 ?auto_338678 ?auto_338679 ?auto_338680 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338696 - BLOCK
      ?auto_338697 - BLOCK
      ?auto_338698 - BLOCK
      ?auto_338699 - BLOCK
      ?auto_338700 - BLOCK
      ?auto_338701 - BLOCK
      ?auto_338702 - BLOCK
      ?auto_338703 - BLOCK
      ?auto_338704 - BLOCK
      ?auto_338705 - BLOCK
      ?auto_338706 - BLOCK
      ?auto_338707 - BLOCK
      ?auto_338708 - BLOCK
      ?auto_338709 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_338709 ) ( ON-TABLE ?auto_338696 ) ( ON ?auto_338697 ?auto_338696 ) ( ON ?auto_338698 ?auto_338697 ) ( ON ?auto_338699 ?auto_338698 ) ( ON ?auto_338700 ?auto_338699 ) ( ON ?auto_338701 ?auto_338700 ) ( ON ?auto_338702 ?auto_338701 ) ( ON ?auto_338703 ?auto_338702 ) ( not ( = ?auto_338696 ?auto_338697 ) ) ( not ( = ?auto_338696 ?auto_338698 ) ) ( not ( = ?auto_338696 ?auto_338699 ) ) ( not ( = ?auto_338696 ?auto_338700 ) ) ( not ( = ?auto_338696 ?auto_338701 ) ) ( not ( = ?auto_338696 ?auto_338702 ) ) ( not ( = ?auto_338696 ?auto_338703 ) ) ( not ( = ?auto_338696 ?auto_338704 ) ) ( not ( = ?auto_338696 ?auto_338705 ) ) ( not ( = ?auto_338696 ?auto_338706 ) ) ( not ( = ?auto_338696 ?auto_338707 ) ) ( not ( = ?auto_338696 ?auto_338708 ) ) ( not ( = ?auto_338696 ?auto_338709 ) ) ( not ( = ?auto_338697 ?auto_338698 ) ) ( not ( = ?auto_338697 ?auto_338699 ) ) ( not ( = ?auto_338697 ?auto_338700 ) ) ( not ( = ?auto_338697 ?auto_338701 ) ) ( not ( = ?auto_338697 ?auto_338702 ) ) ( not ( = ?auto_338697 ?auto_338703 ) ) ( not ( = ?auto_338697 ?auto_338704 ) ) ( not ( = ?auto_338697 ?auto_338705 ) ) ( not ( = ?auto_338697 ?auto_338706 ) ) ( not ( = ?auto_338697 ?auto_338707 ) ) ( not ( = ?auto_338697 ?auto_338708 ) ) ( not ( = ?auto_338697 ?auto_338709 ) ) ( not ( = ?auto_338698 ?auto_338699 ) ) ( not ( = ?auto_338698 ?auto_338700 ) ) ( not ( = ?auto_338698 ?auto_338701 ) ) ( not ( = ?auto_338698 ?auto_338702 ) ) ( not ( = ?auto_338698 ?auto_338703 ) ) ( not ( = ?auto_338698 ?auto_338704 ) ) ( not ( = ?auto_338698 ?auto_338705 ) ) ( not ( = ?auto_338698 ?auto_338706 ) ) ( not ( = ?auto_338698 ?auto_338707 ) ) ( not ( = ?auto_338698 ?auto_338708 ) ) ( not ( = ?auto_338698 ?auto_338709 ) ) ( not ( = ?auto_338699 ?auto_338700 ) ) ( not ( = ?auto_338699 ?auto_338701 ) ) ( not ( = ?auto_338699 ?auto_338702 ) ) ( not ( = ?auto_338699 ?auto_338703 ) ) ( not ( = ?auto_338699 ?auto_338704 ) ) ( not ( = ?auto_338699 ?auto_338705 ) ) ( not ( = ?auto_338699 ?auto_338706 ) ) ( not ( = ?auto_338699 ?auto_338707 ) ) ( not ( = ?auto_338699 ?auto_338708 ) ) ( not ( = ?auto_338699 ?auto_338709 ) ) ( not ( = ?auto_338700 ?auto_338701 ) ) ( not ( = ?auto_338700 ?auto_338702 ) ) ( not ( = ?auto_338700 ?auto_338703 ) ) ( not ( = ?auto_338700 ?auto_338704 ) ) ( not ( = ?auto_338700 ?auto_338705 ) ) ( not ( = ?auto_338700 ?auto_338706 ) ) ( not ( = ?auto_338700 ?auto_338707 ) ) ( not ( = ?auto_338700 ?auto_338708 ) ) ( not ( = ?auto_338700 ?auto_338709 ) ) ( not ( = ?auto_338701 ?auto_338702 ) ) ( not ( = ?auto_338701 ?auto_338703 ) ) ( not ( = ?auto_338701 ?auto_338704 ) ) ( not ( = ?auto_338701 ?auto_338705 ) ) ( not ( = ?auto_338701 ?auto_338706 ) ) ( not ( = ?auto_338701 ?auto_338707 ) ) ( not ( = ?auto_338701 ?auto_338708 ) ) ( not ( = ?auto_338701 ?auto_338709 ) ) ( not ( = ?auto_338702 ?auto_338703 ) ) ( not ( = ?auto_338702 ?auto_338704 ) ) ( not ( = ?auto_338702 ?auto_338705 ) ) ( not ( = ?auto_338702 ?auto_338706 ) ) ( not ( = ?auto_338702 ?auto_338707 ) ) ( not ( = ?auto_338702 ?auto_338708 ) ) ( not ( = ?auto_338702 ?auto_338709 ) ) ( not ( = ?auto_338703 ?auto_338704 ) ) ( not ( = ?auto_338703 ?auto_338705 ) ) ( not ( = ?auto_338703 ?auto_338706 ) ) ( not ( = ?auto_338703 ?auto_338707 ) ) ( not ( = ?auto_338703 ?auto_338708 ) ) ( not ( = ?auto_338703 ?auto_338709 ) ) ( not ( = ?auto_338704 ?auto_338705 ) ) ( not ( = ?auto_338704 ?auto_338706 ) ) ( not ( = ?auto_338704 ?auto_338707 ) ) ( not ( = ?auto_338704 ?auto_338708 ) ) ( not ( = ?auto_338704 ?auto_338709 ) ) ( not ( = ?auto_338705 ?auto_338706 ) ) ( not ( = ?auto_338705 ?auto_338707 ) ) ( not ( = ?auto_338705 ?auto_338708 ) ) ( not ( = ?auto_338705 ?auto_338709 ) ) ( not ( = ?auto_338706 ?auto_338707 ) ) ( not ( = ?auto_338706 ?auto_338708 ) ) ( not ( = ?auto_338706 ?auto_338709 ) ) ( not ( = ?auto_338707 ?auto_338708 ) ) ( not ( = ?auto_338707 ?auto_338709 ) ) ( not ( = ?auto_338708 ?auto_338709 ) ) ( ON ?auto_338708 ?auto_338709 ) ( ON ?auto_338707 ?auto_338708 ) ( ON ?auto_338706 ?auto_338707 ) ( ON ?auto_338705 ?auto_338706 ) ( CLEAR ?auto_338703 ) ( ON ?auto_338704 ?auto_338705 ) ( CLEAR ?auto_338704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_338696 ?auto_338697 ?auto_338698 ?auto_338699 ?auto_338700 ?auto_338701 ?auto_338702 ?auto_338703 ?auto_338704 )
      ( MAKE-14PILE ?auto_338696 ?auto_338697 ?auto_338698 ?auto_338699 ?auto_338700 ?auto_338701 ?auto_338702 ?auto_338703 ?auto_338704 ?auto_338705 ?auto_338706 ?auto_338707 ?auto_338708 ?auto_338709 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338724 - BLOCK
      ?auto_338725 - BLOCK
      ?auto_338726 - BLOCK
      ?auto_338727 - BLOCK
      ?auto_338728 - BLOCK
      ?auto_338729 - BLOCK
      ?auto_338730 - BLOCK
      ?auto_338731 - BLOCK
      ?auto_338732 - BLOCK
      ?auto_338733 - BLOCK
      ?auto_338734 - BLOCK
      ?auto_338735 - BLOCK
      ?auto_338736 - BLOCK
      ?auto_338737 - BLOCK
    )
    :vars
    (
      ?auto_338738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338737 ?auto_338738 ) ( ON-TABLE ?auto_338724 ) ( ON ?auto_338725 ?auto_338724 ) ( ON ?auto_338726 ?auto_338725 ) ( ON ?auto_338727 ?auto_338726 ) ( ON ?auto_338728 ?auto_338727 ) ( ON ?auto_338729 ?auto_338728 ) ( ON ?auto_338730 ?auto_338729 ) ( not ( = ?auto_338724 ?auto_338725 ) ) ( not ( = ?auto_338724 ?auto_338726 ) ) ( not ( = ?auto_338724 ?auto_338727 ) ) ( not ( = ?auto_338724 ?auto_338728 ) ) ( not ( = ?auto_338724 ?auto_338729 ) ) ( not ( = ?auto_338724 ?auto_338730 ) ) ( not ( = ?auto_338724 ?auto_338731 ) ) ( not ( = ?auto_338724 ?auto_338732 ) ) ( not ( = ?auto_338724 ?auto_338733 ) ) ( not ( = ?auto_338724 ?auto_338734 ) ) ( not ( = ?auto_338724 ?auto_338735 ) ) ( not ( = ?auto_338724 ?auto_338736 ) ) ( not ( = ?auto_338724 ?auto_338737 ) ) ( not ( = ?auto_338724 ?auto_338738 ) ) ( not ( = ?auto_338725 ?auto_338726 ) ) ( not ( = ?auto_338725 ?auto_338727 ) ) ( not ( = ?auto_338725 ?auto_338728 ) ) ( not ( = ?auto_338725 ?auto_338729 ) ) ( not ( = ?auto_338725 ?auto_338730 ) ) ( not ( = ?auto_338725 ?auto_338731 ) ) ( not ( = ?auto_338725 ?auto_338732 ) ) ( not ( = ?auto_338725 ?auto_338733 ) ) ( not ( = ?auto_338725 ?auto_338734 ) ) ( not ( = ?auto_338725 ?auto_338735 ) ) ( not ( = ?auto_338725 ?auto_338736 ) ) ( not ( = ?auto_338725 ?auto_338737 ) ) ( not ( = ?auto_338725 ?auto_338738 ) ) ( not ( = ?auto_338726 ?auto_338727 ) ) ( not ( = ?auto_338726 ?auto_338728 ) ) ( not ( = ?auto_338726 ?auto_338729 ) ) ( not ( = ?auto_338726 ?auto_338730 ) ) ( not ( = ?auto_338726 ?auto_338731 ) ) ( not ( = ?auto_338726 ?auto_338732 ) ) ( not ( = ?auto_338726 ?auto_338733 ) ) ( not ( = ?auto_338726 ?auto_338734 ) ) ( not ( = ?auto_338726 ?auto_338735 ) ) ( not ( = ?auto_338726 ?auto_338736 ) ) ( not ( = ?auto_338726 ?auto_338737 ) ) ( not ( = ?auto_338726 ?auto_338738 ) ) ( not ( = ?auto_338727 ?auto_338728 ) ) ( not ( = ?auto_338727 ?auto_338729 ) ) ( not ( = ?auto_338727 ?auto_338730 ) ) ( not ( = ?auto_338727 ?auto_338731 ) ) ( not ( = ?auto_338727 ?auto_338732 ) ) ( not ( = ?auto_338727 ?auto_338733 ) ) ( not ( = ?auto_338727 ?auto_338734 ) ) ( not ( = ?auto_338727 ?auto_338735 ) ) ( not ( = ?auto_338727 ?auto_338736 ) ) ( not ( = ?auto_338727 ?auto_338737 ) ) ( not ( = ?auto_338727 ?auto_338738 ) ) ( not ( = ?auto_338728 ?auto_338729 ) ) ( not ( = ?auto_338728 ?auto_338730 ) ) ( not ( = ?auto_338728 ?auto_338731 ) ) ( not ( = ?auto_338728 ?auto_338732 ) ) ( not ( = ?auto_338728 ?auto_338733 ) ) ( not ( = ?auto_338728 ?auto_338734 ) ) ( not ( = ?auto_338728 ?auto_338735 ) ) ( not ( = ?auto_338728 ?auto_338736 ) ) ( not ( = ?auto_338728 ?auto_338737 ) ) ( not ( = ?auto_338728 ?auto_338738 ) ) ( not ( = ?auto_338729 ?auto_338730 ) ) ( not ( = ?auto_338729 ?auto_338731 ) ) ( not ( = ?auto_338729 ?auto_338732 ) ) ( not ( = ?auto_338729 ?auto_338733 ) ) ( not ( = ?auto_338729 ?auto_338734 ) ) ( not ( = ?auto_338729 ?auto_338735 ) ) ( not ( = ?auto_338729 ?auto_338736 ) ) ( not ( = ?auto_338729 ?auto_338737 ) ) ( not ( = ?auto_338729 ?auto_338738 ) ) ( not ( = ?auto_338730 ?auto_338731 ) ) ( not ( = ?auto_338730 ?auto_338732 ) ) ( not ( = ?auto_338730 ?auto_338733 ) ) ( not ( = ?auto_338730 ?auto_338734 ) ) ( not ( = ?auto_338730 ?auto_338735 ) ) ( not ( = ?auto_338730 ?auto_338736 ) ) ( not ( = ?auto_338730 ?auto_338737 ) ) ( not ( = ?auto_338730 ?auto_338738 ) ) ( not ( = ?auto_338731 ?auto_338732 ) ) ( not ( = ?auto_338731 ?auto_338733 ) ) ( not ( = ?auto_338731 ?auto_338734 ) ) ( not ( = ?auto_338731 ?auto_338735 ) ) ( not ( = ?auto_338731 ?auto_338736 ) ) ( not ( = ?auto_338731 ?auto_338737 ) ) ( not ( = ?auto_338731 ?auto_338738 ) ) ( not ( = ?auto_338732 ?auto_338733 ) ) ( not ( = ?auto_338732 ?auto_338734 ) ) ( not ( = ?auto_338732 ?auto_338735 ) ) ( not ( = ?auto_338732 ?auto_338736 ) ) ( not ( = ?auto_338732 ?auto_338737 ) ) ( not ( = ?auto_338732 ?auto_338738 ) ) ( not ( = ?auto_338733 ?auto_338734 ) ) ( not ( = ?auto_338733 ?auto_338735 ) ) ( not ( = ?auto_338733 ?auto_338736 ) ) ( not ( = ?auto_338733 ?auto_338737 ) ) ( not ( = ?auto_338733 ?auto_338738 ) ) ( not ( = ?auto_338734 ?auto_338735 ) ) ( not ( = ?auto_338734 ?auto_338736 ) ) ( not ( = ?auto_338734 ?auto_338737 ) ) ( not ( = ?auto_338734 ?auto_338738 ) ) ( not ( = ?auto_338735 ?auto_338736 ) ) ( not ( = ?auto_338735 ?auto_338737 ) ) ( not ( = ?auto_338735 ?auto_338738 ) ) ( not ( = ?auto_338736 ?auto_338737 ) ) ( not ( = ?auto_338736 ?auto_338738 ) ) ( not ( = ?auto_338737 ?auto_338738 ) ) ( ON ?auto_338736 ?auto_338737 ) ( ON ?auto_338735 ?auto_338736 ) ( ON ?auto_338734 ?auto_338735 ) ( ON ?auto_338733 ?auto_338734 ) ( ON ?auto_338732 ?auto_338733 ) ( CLEAR ?auto_338730 ) ( ON ?auto_338731 ?auto_338732 ) ( CLEAR ?auto_338731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_338724 ?auto_338725 ?auto_338726 ?auto_338727 ?auto_338728 ?auto_338729 ?auto_338730 ?auto_338731 )
      ( MAKE-14PILE ?auto_338724 ?auto_338725 ?auto_338726 ?auto_338727 ?auto_338728 ?auto_338729 ?auto_338730 ?auto_338731 ?auto_338732 ?auto_338733 ?auto_338734 ?auto_338735 ?auto_338736 ?auto_338737 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338753 - BLOCK
      ?auto_338754 - BLOCK
      ?auto_338755 - BLOCK
      ?auto_338756 - BLOCK
      ?auto_338757 - BLOCK
      ?auto_338758 - BLOCK
      ?auto_338759 - BLOCK
      ?auto_338760 - BLOCK
      ?auto_338761 - BLOCK
      ?auto_338762 - BLOCK
      ?auto_338763 - BLOCK
      ?auto_338764 - BLOCK
      ?auto_338765 - BLOCK
      ?auto_338766 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_338766 ) ( ON-TABLE ?auto_338753 ) ( ON ?auto_338754 ?auto_338753 ) ( ON ?auto_338755 ?auto_338754 ) ( ON ?auto_338756 ?auto_338755 ) ( ON ?auto_338757 ?auto_338756 ) ( ON ?auto_338758 ?auto_338757 ) ( ON ?auto_338759 ?auto_338758 ) ( not ( = ?auto_338753 ?auto_338754 ) ) ( not ( = ?auto_338753 ?auto_338755 ) ) ( not ( = ?auto_338753 ?auto_338756 ) ) ( not ( = ?auto_338753 ?auto_338757 ) ) ( not ( = ?auto_338753 ?auto_338758 ) ) ( not ( = ?auto_338753 ?auto_338759 ) ) ( not ( = ?auto_338753 ?auto_338760 ) ) ( not ( = ?auto_338753 ?auto_338761 ) ) ( not ( = ?auto_338753 ?auto_338762 ) ) ( not ( = ?auto_338753 ?auto_338763 ) ) ( not ( = ?auto_338753 ?auto_338764 ) ) ( not ( = ?auto_338753 ?auto_338765 ) ) ( not ( = ?auto_338753 ?auto_338766 ) ) ( not ( = ?auto_338754 ?auto_338755 ) ) ( not ( = ?auto_338754 ?auto_338756 ) ) ( not ( = ?auto_338754 ?auto_338757 ) ) ( not ( = ?auto_338754 ?auto_338758 ) ) ( not ( = ?auto_338754 ?auto_338759 ) ) ( not ( = ?auto_338754 ?auto_338760 ) ) ( not ( = ?auto_338754 ?auto_338761 ) ) ( not ( = ?auto_338754 ?auto_338762 ) ) ( not ( = ?auto_338754 ?auto_338763 ) ) ( not ( = ?auto_338754 ?auto_338764 ) ) ( not ( = ?auto_338754 ?auto_338765 ) ) ( not ( = ?auto_338754 ?auto_338766 ) ) ( not ( = ?auto_338755 ?auto_338756 ) ) ( not ( = ?auto_338755 ?auto_338757 ) ) ( not ( = ?auto_338755 ?auto_338758 ) ) ( not ( = ?auto_338755 ?auto_338759 ) ) ( not ( = ?auto_338755 ?auto_338760 ) ) ( not ( = ?auto_338755 ?auto_338761 ) ) ( not ( = ?auto_338755 ?auto_338762 ) ) ( not ( = ?auto_338755 ?auto_338763 ) ) ( not ( = ?auto_338755 ?auto_338764 ) ) ( not ( = ?auto_338755 ?auto_338765 ) ) ( not ( = ?auto_338755 ?auto_338766 ) ) ( not ( = ?auto_338756 ?auto_338757 ) ) ( not ( = ?auto_338756 ?auto_338758 ) ) ( not ( = ?auto_338756 ?auto_338759 ) ) ( not ( = ?auto_338756 ?auto_338760 ) ) ( not ( = ?auto_338756 ?auto_338761 ) ) ( not ( = ?auto_338756 ?auto_338762 ) ) ( not ( = ?auto_338756 ?auto_338763 ) ) ( not ( = ?auto_338756 ?auto_338764 ) ) ( not ( = ?auto_338756 ?auto_338765 ) ) ( not ( = ?auto_338756 ?auto_338766 ) ) ( not ( = ?auto_338757 ?auto_338758 ) ) ( not ( = ?auto_338757 ?auto_338759 ) ) ( not ( = ?auto_338757 ?auto_338760 ) ) ( not ( = ?auto_338757 ?auto_338761 ) ) ( not ( = ?auto_338757 ?auto_338762 ) ) ( not ( = ?auto_338757 ?auto_338763 ) ) ( not ( = ?auto_338757 ?auto_338764 ) ) ( not ( = ?auto_338757 ?auto_338765 ) ) ( not ( = ?auto_338757 ?auto_338766 ) ) ( not ( = ?auto_338758 ?auto_338759 ) ) ( not ( = ?auto_338758 ?auto_338760 ) ) ( not ( = ?auto_338758 ?auto_338761 ) ) ( not ( = ?auto_338758 ?auto_338762 ) ) ( not ( = ?auto_338758 ?auto_338763 ) ) ( not ( = ?auto_338758 ?auto_338764 ) ) ( not ( = ?auto_338758 ?auto_338765 ) ) ( not ( = ?auto_338758 ?auto_338766 ) ) ( not ( = ?auto_338759 ?auto_338760 ) ) ( not ( = ?auto_338759 ?auto_338761 ) ) ( not ( = ?auto_338759 ?auto_338762 ) ) ( not ( = ?auto_338759 ?auto_338763 ) ) ( not ( = ?auto_338759 ?auto_338764 ) ) ( not ( = ?auto_338759 ?auto_338765 ) ) ( not ( = ?auto_338759 ?auto_338766 ) ) ( not ( = ?auto_338760 ?auto_338761 ) ) ( not ( = ?auto_338760 ?auto_338762 ) ) ( not ( = ?auto_338760 ?auto_338763 ) ) ( not ( = ?auto_338760 ?auto_338764 ) ) ( not ( = ?auto_338760 ?auto_338765 ) ) ( not ( = ?auto_338760 ?auto_338766 ) ) ( not ( = ?auto_338761 ?auto_338762 ) ) ( not ( = ?auto_338761 ?auto_338763 ) ) ( not ( = ?auto_338761 ?auto_338764 ) ) ( not ( = ?auto_338761 ?auto_338765 ) ) ( not ( = ?auto_338761 ?auto_338766 ) ) ( not ( = ?auto_338762 ?auto_338763 ) ) ( not ( = ?auto_338762 ?auto_338764 ) ) ( not ( = ?auto_338762 ?auto_338765 ) ) ( not ( = ?auto_338762 ?auto_338766 ) ) ( not ( = ?auto_338763 ?auto_338764 ) ) ( not ( = ?auto_338763 ?auto_338765 ) ) ( not ( = ?auto_338763 ?auto_338766 ) ) ( not ( = ?auto_338764 ?auto_338765 ) ) ( not ( = ?auto_338764 ?auto_338766 ) ) ( not ( = ?auto_338765 ?auto_338766 ) ) ( ON ?auto_338765 ?auto_338766 ) ( ON ?auto_338764 ?auto_338765 ) ( ON ?auto_338763 ?auto_338764 ) ( ON ?auto_338762 ?auto_338763 ) ( ON ?auto_338761 ?auto_338762 ) ( CLEAR ?auto_338759 ) ( ON ?auto_338760 ?auto_338761 ) ( CLEAR ?auto_338760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_338753 ?auto_338754 ?auto_338755 ?auto_338756 ?auto_338757 ?auto_338758 ?auto_338759 ?auto_338760 )
      ( MAKE-14PILE ?auto_338753 ?auto_338754 ?auto_338755 ?auto_338756 ?auto_338757 ?auto_338758 ?auto_338759 ?auto_338760 ?auto_338761 ?auto_338762 ?auto_338763 ?auto_338764 ?auto_338765 ?auto_338766 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338781 - BLOCK
      ?auto_338782 - BLOCK
      ?auto_338783 - BLOCK
      ?auto_338784 - BLOCK
      ?auto_338785 - BLOCK
      ?auto_338786 - BLOCK
      ?auto_338787 - BLOCK
      ?auto_338788 - BLOCK
      ?auto_338789 - BLOCK
      ?auto_338790 - BLOCK
      ?auto_338791 - BLOCK
      ?auto_338792 - BLOCK
      ?auto_338793 - BLOCK
      ?auto_338794 - BLOCK
    )
    :vars
    (
      ?auto_338795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338794 ?auto_338795 ) ( ON-TABLE ?auto_338781 ) ( ON ?auto_338782 ?auto_338781 ) ( ON ?auto_338783 ?auto_338782 ) ( ON ?auto_338784 ?auto_338783 ) ( ON ?auto_338785 ?auto_338784 ) ( ON ?auto_338786 ?auto_338785 ) ( not ( = ?auto_338781 ?auto_338782 ) ) ( not ( = ?auto_338781 ?auto_338783 ) ) ( not ( = ?auto_338781 ?auto_338784 ) ) ( not ( = ?auto_338781 ?auto_338785 ) ) ( not ( = ?auto_338781 ?auto_338786 ) ) ( not ( = ?auto_338781 ?auto_338787 ) ) ( not ( = ?auto_338781 ?auto_338788 ) ) ( not ( = ?auto_338781 ?auto_338789 ) ) ( not ( = ?auto_338781 ?auto_338790 ) ) ( not ( = ?auto_338781 ?auto_338791 ) ) ( not ( = ?auto_338781 ?auto_338792 ) ) ( not ( = ?auto_338781 ?auto_338793 ) ) ( not ( = ?auto_338781 ?auto_338794 ) ) ( not ( = ?auto_338781 ?auto_338795 ) ) ( not ( = ?auto_338782 ?auto_338783 ) ) ( not ( = ?auto_338782 ?auto_338784 ) ) ( not ( = ?auto_338782 ?auto_338785 ) ) ( not ( = ?auto_338782 ?auto_338786 ) ) ( not ( = ?auto_338782 ?auto_338787 ) ) ( not ( = ?auto_338782 ?auto_338788 ) ) ( not ( = ?auto_338782 ?auto_338789 ) ) ( not ( = ?auto_338782 ?auto_338790 ) ) ( not ( = ?auto_338782 ?auto_338791 ) ) ( not ( = ?auto_338782 ?auto_338792 ) ) ( not ( = ?auto_338782 ?auto_338793 ) ) ( not ( = ?auto_338782 ?auto_338794 ) ) ( not ( = ?auto_338782 ?auto_338795 ) ) ( not ( = ?auto_338783 ?auto_338784 ) ) ( not ( = ?auto_338783 ?auto_338785 ) ) ( not ( = ?auto_338783 ?auto_338786 ) ) ( not ( = ?auto_338783 ?auto_338787 ) ) ( not ( = ?auto_338783 ?auto_338788 ) ) ( not ( = ?auto_338783 ?auto_338789 ) ) ( not ( = ?auto_338783 ?auto_338790 ) ) ( not ( = ?auto_338783 ?auto_338791 ) ) ( not ( = ?auto_338783 ?auto_338792 ) ) ( not ( = ?auto_338783 ?auto_338793 ) ) ( not ( = ?auto_338783 ?auto_338794 ) ) ( not ( = ?auto_338783 ?auto_338795 ) ) ( not ( = ?auto_338784 ?auto_338785 ) ) ( not ( = ?auto_338784 ?auto_338786 ) ) ( not ( = ?auto_338784 ?auto_338787 ) ) ( not ( = ?auto_338784 ?auto_338788 ) ) ( not ( = ?auto_338784 ?auto_338789 ) ) ( not ( = ?auto_338784 ?auto_338790 ) ) ( not ( = ?auto_338784 ?auto_338791 ) ) ( not ( = ?auto_338784 ?auto_338792 ) ) ( not ( = ?auto_338784 ?auto_338793 ) ) ( not ( = ?auto_338784 ?auto_338794 ) ) ( not ( = ?auto_338784 ?auto_338795 ) ) ( not ( = ?auto_338785 ?auto_338786 ) ) ( not ( = ?auto_338785 ?auto_338787 ) ) ( not ( = ?auto_338785 ?auto_338788 ) ) ( not ( = ?auto_338785 ?auto_338789 ) ) ( not ( = ?auto_338785 ?auto_338790 ) ) ( not ( = ?auto_338785 ?auto_338791 ) ) ( not ( = ?auto_338785 ?auto_338792 ) ) ( not ( = ?auto_338785 ?auto_338793 ) ) ( not ( = ?auto_338785 ?auto_338794 ) ) ( not ( = ?auto_338785 ?auto_338795 ) ) ( not ( = ?auto_338786 ?auto_338787 ) ) ( not ( = ?auto_338786 ?auto_338788 ) ) ( not ( = ?auto_338786 ?auto_338789 ) ) ( not ( = ?auto_338786 ?auto_338790 ) ) ( not ( = ?auto_338786 ?auto_338791 ) ) ( not ( = ?auto_338786 ?auto_338792 ) ) ( not ( = ?auto_338786 ?auto_338793 ) ) ( not ( = ?auto_338786 ?auto_338794 ) ) ( not ( = ?auto_338786 ?auto_338795 ) ) ( not ( = ?auto_338787 ?auto_338788 ) ) ( not ( = ?auto_338787 ?auto_338789 ) ) ( not ( = ?auto_338787 ?auto_338790 ) ) ( not ( = ?auto_338787 ?auto_338791 ) ) ( not ( = ?auto_338787 ?auto_338792 ) ) ( not ( = ?auto_338787 ?auto_338793 ) ) ( not ( = ?auto_338787 ?auto_338794 ) ) ( not ( = ?auto_338787 ?auto_338795 ) ) ( not ( = ?auto_338788 ?auto_338789 ) ) ( not ( = ?auto_338788 ?auto_338790 ) ) ( not ( = ?auto_338788 ?auto_338791 ) ) ( not ( = ?auto_338788 ?auto_338792 ) ) ( not ( = ?auto_338788 ?auto_338793 ) ) ( not ( = ?auto_338788 ?auto_338794 ) ) ( not ( = ?auto_338788 ?auto_338795 ) ) ( not ( = ?auto_338789 ?auto_338790 ) ) ( not ( = ?auto_338789 ?auto_338791 ) ) ( not ( = ?auto_338789 ?auto_338792 ) ) ( not ( = ?auto_338789 ?auto_338793 ) ) ( not ( = ?auto_338789 ?auto_338794 ) ) ( not ( = ?auto_338789 ?auto_338795 ) ) ( not ( = ?auto_338790 ?auto_338791 ) ) ( not ( = ?auto_338790 ?auto_338792 ) ) ( not ( = ?auto_338790 ?auto_338793 ) ) ( not ( = ?auto_338790 ?auto_338794 ) ) ( not ( = ?auto_338790 ?auto_338795 ) ) ( not ( = ?auto_338791 ?auto_338792 ) ) ( not ( = ?auto_338791 ?auto_338793 ) ) ( not ( = ?auto_338791 ?auto_338794 ) ) ( not ( = ?auto_338791 ?auto_338795 ) ) ( not ( = ?auto_338792 ?auto_338793 ) ) ( not ( = ?auto_338792 ?auto_338794 ) ) ( not ( = ?auto_338792 ?auto_338795 ) ) ( not ( = ?auto_338793 ?auto_338794 ) ) ( not ( = ?auto_338793 ?auto_338795 ) ) ( not ( = ?auto_338794 ?auto_338795 ) ) ( ON ?auto_338793 ?auto_338794 ) ( ON ?auto_338792 ?auto_338793 ) ( ON ?auto_338791 ?auto_338792 ) ( ON ?auto_338790 ?auto_338791 ) ( ON ?auto_338789 ?auto_338790 ) ( ON ?auto_338788 ?auto_338789 ) ( CLEAR ?auto_338786 ) ( ON ?auto_338787 ?auto_338788 ) ( CLEAR ?auto_338787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_338781 ?auto_338782 ?auto_338783 ?auto_338784 ?auto_338785 ?auto_338786 ?auto_338787 )
      ( MAKE-14PILE ?auto_338781 ?auto_338782 ?auto_338783 ?auto_338784 ?auto_338785 ?auto_338786 ?auto_338787 ?auto_338788 ?auto_338789 ?auto_338790 ?auto_338791 ?auto_338792 ?auto_338793 ?auto_338794 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338810 - BLOCK
      ?auto_338811 - BLOCK
      ?auto_338812 - BLOCK
      ?auto_338813 - BLOCK
      ?auto_338814 - BLOCK
      ?auto_338815 - BLOCK
      ?auto_338816 - BLOCK
      ?auto_338817 - BLOCK
      ?auto_338818 - BLOCK
      ?auto_338819 - BLOCK
      ?auto_338820 - BLOCK
      ?auto_338821 - BLOCK
      ?auto_338822 - BLOCK
      ?auto_338823 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_338823 ) ( ON-TABLE ?auto_338810 ) ( ON ?auto_338811 ?auto_338810 ) ( ON ?auto_338812 ?auto_338811 ) ( ON ?auto_338813 ?auto_338812 ) ( ON ?auto_338814 ?auto_338813 ) ( ON ?auto_338815 ?auto_338814 ) ( not ( = ?auto_338810 ?auto_338811 ) ) ( not ( = ?auto_338810 ?auto_338812 ) ) ( not ( = ?auto_338810 ?auto_338813 ) ) ( not ( = ?auto_338810 ?auto_338814 ) ) ( not ( = ?auto_338810 ?auto_338815 ) ) ( not ( = ?auto_338810 ?auto_338816 ) ) ( not ( = ?auto_338810 ?auto_338817 ) ) ( not ( = ?auto_338810 ?auto_338818 ) ) ( not ( = ?auto_338810 ?auto_338819 ) ) ( not ( = ?auto_338810 ?auto_338820 ) ) ( not ( = ?auto_338810 ?auto_338821 ) ) ( not ( = ?auto_338810 ?auto_338822 ) ) ( not ( = ?auto_338810 ?auto_338823 ) ) ( not ( = ?auto_338811 ?auto_338812 ) ) ( not ( = ?auto_338811 ?auto_338813 ) ) ( not ( = ?auto_338811 ?auto_338814 ) ) ( not ( = ?auto_338811 ?auto_338815 ) ) ( not ( = ?auto_338811 ?auto_338816 ) ) ( not ( = ?auto_338811 ?auto_338817 ) ) ( not ( = ?auto_338811 ?auto_338818 ) ) ( not ( = ?auto_338811 ?auto_338819 ) ) ( not ( = ?auto_338811 ?auto_338820 ) ) ( not ( = ?auto_338811 ?auto_338821 ) ) ( not ( = ?auto_338811 ?auto_338822 ) ) ( not ( = ?auto_338811 ?auto_338823 ) ) ( not ( = ?auto_338812 ?auto_338813 ) ) ( not ( = ?auto_338812 ?auto_338814 ) ) ( not ( = ?auto_338812 ?auto_338815 ) ) ( not ( = ?auto_338812 ?auto_338816 ) ) ( not ( = ?auto_338812 ?auto_338817 ) ) ( not ( = ?auto_338812 ?auto_338818 ) ) ( not ( = ?auto_338812 ?auto_338819 ) ) ( not ( = ?auto_338812 ?auto_338820 ) ) ( not ( = ?auto_338812 ?auto_338821 ) ) ( not ( = ?auto_338812 ?auto_338822 ) ) ( not ( = ?auto_338812 ?auto_338823 ) ) ( not ( = ?auto_338813 ?auto_338814 ) ) ( not ( = ?auto_338813 ?auto_338815 ) ) ( not ( = ?auto_338813 ?auto_338816 ) ) ( not ( = ?auto_338813 ?auto_338817 ) ) ( not ( = ?auto_338813 ?auto_338818 ) ) ( not ( = ?auto_338813 ?auto_338819 ) ) ( not ( = ?auto_338813 ?auto_338820 ) ) ( not ( = ?auto_338813 ?auto_338821 ) ) ( not ( = ?auto_338813 ?auto_338822 ) ) ( not ( = ?auto_338813 ?auto_338823 ) ) ( not ( = ?auto_338814 ?auto_338815 ) ) ( not ( = ?auto_338814 ?auto_338816 ) ) ( not ( = ?auto_338814 ?auto_338817 ) ) ( not ( = ?auto_338814 ?auto_338818 ) ) ( not ( = ?auto_338814 ?auto_338819 ) ) ( not ( = ?auto_338814 ?auto_338820 ) ) ( not ( = ?auto_338814 ?auto_338821 ) ) ( not ( = ?auto_338814 ?auto_338822 ) ) ( not ( = ?auto_338814 ?auto_338823 ) ) ( not ( = ?auto_338815 ?auto_338816 ) ) ( not ( = ?auto_338815 ?auto_338817 ) ) ( not ( = ?auto_338815 ?auto_338818 ) ) ( not ( = ?auto_338815 ?auto_338819 ) ) ( not ( = ?auto_338815 ?auto_338820 ) ) ( not ( = ?auto_338815 ?auto_338821 ) ) ( not ( = ?auto_338815 ?auto_338822 ) ) ( not ( = ?auto_338815 ?auto_338823 ) ) ( not ( = ?auto_338816 ?auto_338817 ) ) ( not ( = ?auto_338816 ?auto_338818 ) ) ( not ( = ?auto_338816 ?auto_338819 ) ) ( not ( = ?auto_338816 ?auto_338820 ) ) ( not ( = ?auto_338816 ?auto_338821 ) ) ( not ( = ?auto_338816 ?auto_338822 ) ) ( not ( = ?auto_338816 ?auto_338823 ) ) ( not ( = ?auto_338817 ?auto_338818 ) ) ( not ( = ?auto_338817 ?auto_338819 ) ) ( not ( = ?auto_338817 ?auto_338820 ) ) ( not ( = ?auto_338817 ?auto_338821 ) ) ( not ( = ?auto_338817 ?auto_338822 ) ) ( not ( = ?auto_338817 ?auto_338823 ) ) ( not ( = ?auto_338818 ?auto_338819 ) ) ( not ( = ?auto_338818 ?auto_338820 ) ) ( not ( = ?auto_338818 ?auto_338821 ) ) ( not ( = ?auto_338818 ?auto_338822 ) ) ( not ( = ?auto_338818 ?auto_338823 ) ) ( not ( = ?auto_338819 ?auto_338820 ) ) ( not ( = ?auto_338819 ?auto_338821 ) ) ( not ( = ?auto_338819 ?auto_338822 ) ) ( not ( = ?auto_338819 ?auto_338823 ) ) ( not ( = ?auto_338820 ?auto_338821 ) ) ( not ( = ?auto_338820 ?auto_338822 ) ) ( not ( = ?auto_338820 ?auto_338823 ) ) ( not ( = ?auto_338821 ?auto_338822 ) ) ( not ( = ?auto_338821 ?auto_338823 ) ) ( not ( = ?auto_338822 ?auto_338823 ) ) ( ON ?auto_338822 ?auto_338823 ) ( ON ?auto_338821 ?auto_338822 ) ( ON ?auto_338820 ?auto_338821 ) ( ON ?auto_338819 ?auto_338820 ) ( ON ?auto_338818 ?auto_338819 ) ( ON ?auto_338817 ?auto_338818 ) ( CLEAR ?auto_338815 ) ( ON ?auto_338816 ?auto_338817 ) ( CLEAR ?auto_338816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_338810 ?auto_338811 ?auto_338812 ?auto_338813 ?auto_338814 ?auto_338815 ?auto_338816 )
      ( MAKE-14PILE ?auto_338810 ?auto_338811 ?auto_338812 ?auto_338813 ?auto_338814 ?auto_338815 ?auto_338816 ?auto_338817 ?auto_338818 ?auto_338819 ?auto_338820 ?auto_338821 ?auto_338822 ?auto_338823 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338838 - BLOCK
      ?auto_338839 - BLOCK
      ?auto_338840 - BLOCK
      ?auto_338841 - BLOCK
      ?auto_338842 - BLOCK
      ?auto_338843 - BLOCK
      ?auto_338844 - BLOCK
      ?auto_338845 - BLOCK
      ?auto_338846 - BLOCK
      ?auto_338847 - BLOCK
      ?auto_338848 - BLOCK
      ?auto_338849 - BLOCK
      ?auto_338850 - BLOCK
      ?auto_338851 - BLOCK
    )
    :vars
    (
      ?auto_338852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338851 ?auto_338852 ) ( ON-TABLE ?auto_338838 ) ( ON ?auto_338839 ?auto_338838 ) ( ON ?auto_338840 ?auto_338839 ) ( ON ?auto_338841 ?auto_338840 ) ( ON ?auto_338842 ?auto_338841 ) ( not ( = ?auto_338838 ?auto_338839 ) ) ( not ( = ?auto_338838 ?auto_338840 ) ) ( not ( = ?auto_338838 ?auto_338841 ) ) ( not ( = ?auto_338838 ?auto_338842 ) ) ( not ( = ?auto_338838 ?auto_338843 ) ) ( not ( = ?auto_338838 ?auto_338844 ) ) ( not ( = ?auto_338838 ?auto_338845 ) ) ( not ( = ?auto_338838 ?auto_338846 ) ) ( not ( = ?auto_338838 ?auto_338847 ) ) ( not ( = ?auto_338838 ?auto_338848 ) ) ( not ( = ?auto_338838 ?auto_338849 ) ) ( not ( = ?auto_338838 ?auto_338850 ) ) ( not ( = ?auto_338838 ?auto_338851 ) ) ( not ( = ?auto_338838 ?auto_338852 ) ) ( not ( = ?auto_338839 ?auto_338840 ) ) ( not ( = ?auto_338839 ?auto_338841 ) ) ( not ( = ?auto_338839 ?auto_338842 ) ) ( not ( = ?auto_338839 ?auto_338843 ) ) ( not ( = ?auto_338839 ?auto_338844 ) ) ( not ( = ?auto_338839 ?auto_338845 ) ) ( not ( = ?auto_338839 ?auto_338846 ) ) ( not ( = ?auto_338839 ?auto_338847 ) ) ( not ( = ?auto_338839 ?auto_338848 ) ) ( not ( = ?auto_338839 ?auto_338849 ) ) ( not ( = ?auto_338839 ?auto_338850 ) ) ( not ( = ?auto_338839 ?auto_338851 ) ) ( not ( = ?auto_338839 ?auto_338852 ) ) ( not ( = ?auto_338840 ?auto_338841 ) ) ( not ( = ?auto_338840 ?auto_338842 ) ) ( not ( = ?auto_338840 ?auto_338843 ) ) ( not ( = ?auto_338840 ?auto_338844 ) ) ( not ( = ?auto_338840 ?auto_338845 ) ) ( not ( = ?auto_338840 ?auto_338846 ) ) ( not ( = ?auto_338840 ?auto_338847 ) ) ( not ( = ?auto_338840 ?auto_338848 ) ) ( not ( = ?auto_338840 ?auto_338849 ) ) ( not ( = ?auto_338840 ?auto_338850 ) ) ( not ( = ?auto_338840 ?auto_338851 ) ) ( not ( = ?auto_338840 ?auto_338852 ) ) ( not ( = ?auto_338841 ?auto_338842 ) ) ( not ( = ?auto_338841 ?auto_338843 ) ) ( not ( = ?auto_338841 ?auto_338844 ) ) ( not ( = ?auto_338841 ?auto_338845 ) ) ( not ( = ?auto_338841 ?auto_338846 ) ) ( not ( = ?auto_338841 ?auto_338847 ) ) ( not ( = ?auto_338841 ?auto_338848 ) ) ( not ( = ?auto_338841 ?auto_338849 ) ) ( not ( = ?auto_338841 ?auto_338850 ) ) ( not ( = ?auto_338841 ?auto_338851 ) ) ( not ( = ?auto_338841 ?auto_338852 ) ) ( not ( = ?auto_338842 ?auto_338843 ) ) ( not ( = ?auto_338842 ?auto_338844 ) ) ( not ( = ?auto_338842 ?auto_338845 ) ) ( not ( = ?auto_338842 ?auto_338846 ) ) ( not ( = ?auto_338842 ?auto_338847 ) ) ( not ( = ?auto_338842 ?auto_338848 ) ) ( not ( = ?auto_338842 ?auto_338849 ) ) ( not ( = ?auto_338842 ?auto_338850 ) ) ( not ( = ?auto_338842 ?auto_338851 ) ) ( not ( = ?auto_338842 ?auto_338852 ) ) ( not ( = ?auto_338843 ?auto_338844 ) ) ( not ( = ?auto_338843 ?auto_338845 ) ) ( not ( = ?auto_338843 ?auto_338846 ) ) ( not ( = ?auto_338843 ?auto_338847 ) ) ( not ( = ?auto_338843 ?auto_338848 ) ) ( not ( = ?auto_338843 ?auto_338849 ) ) ( not ( = ?auto_338843 ?auto_338850 ) ) ( not ( = ?auto_338843 ?auto_338851 ) ) ( not ( = ?auto_338843 ?auto_338852 ) ) ( not ( = ?auto_338844 ?auto_338845 ) ) ( not ( = ?auto_338844 ?auto_338846 ) ) ( not ( = ?auto_338844 ?auto_338847 ) ) ( not ( = ?auto_338844 ?auto_338848 ) ) ( not ( = ?auto_338844 ?auto_338849 ) ) ( not ( = ?auto_338844 ?auto_338850 ) ) ( not ( = ?auto_338844 ?auto_338851 ) ) ( not ( = ?auto_338844 ?auto_338852 ) ) ( not ( = ?auto_338845 ?auto_338846 ) ) ( not ( = ?auto_338845 ?auto_338847 ) ) ( not ( = ?auto_338845 ?auto_338848 ) ) ( not ( = ?auto_338845 ?auto_338849 ) ) ( not ( = ?auto_338845 ?auto_338850 ) ) ( not ( = ?auto_338845 ?auto_338851 ) ) ( not ( = ?auto_338845 ?auto_338852 ) ) ( not ( = ?auto_338846 ?auto_338847 ) ) ( not ( = ?auto_338846 ?auto_338848 ) ) ( not ( = ?auto_338846 ?auto_338849 ) ) ( not ( = ?auto_338846 ?auto_338850 ) ) ( not ( = ?auto_338846 ?auto_338851 ) ) ( not ( = ?auto_338846 ?auto_338852 ) ) ( not ( = ?auto_338847 ?auto_338848 ) ) ( not ( = ?auto_338847 ?auto_338849 ) ) ( not ( = ?auto_338847 ?auto_338850 ) ) ( not ( = ?auto_338847 ?auto_338851 ) ) ( not ( = ?auto_338847 ?auto_338852 ) ) ( not ( = ?auto_338848 ?auto_338849 ) ) ( not ( = ?auto_338848 ?auto_338850 ) ) ( not ( = ?auto_338848 ?auto_338851 ) ) ( not ( = ?auto_338848 ?auto_338852 ) ) ( not ( = ?auto_338849 ?auto_338850 ) ) ( not ( = ?auto_338849 ?auto_338851 ) ) ( not ( = ?auto_338849 ?auto_338852 ) ) ( not ( = ?auto_338850 ?auto_338851 ) ) ( not ( = ?auto_338850 ?auto_338852 ) ) ( not ( = ?auto_338851 ?auto_338852 ) ) ( ON ?auto_338850 ?auto_338851 ) ( ON ?auto_338849 ?auto_338850 ) ( ON ?auto_338848 ?auto_338849 ) ( ON ?auto_338847 ?auto_338848 ) ( ON ?auto_338846 ?auto_338847 ) ( ON ?auto_338845 ?auto_338846 ) ( ON ?auto_338844 ?auto_338845 ) ( CLEAR ?auto_338842 ) ( ON ?auto_338843 ?auto_338844 ) ( CLEAR ?auto_338843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_338838 ?auto_338839 ?auto_338840 ?auto_338841 ?auto_338842 ?auto_338843 )
      ( MAKE-14PILE ?auto_338838 ?auto_338839 ?auto_338840 ?auto_338841 ?auto_338842 ?auto_338843 ?auto_338844 ?auto_338845 ?auto_338846 ?auto_338847 ?auto_338848 ?auto_338849 ?auto_338850 ?auto_338851 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338867 - BLOCK
      ?auto_338868 - BLOCK
      ?auto_338869 - BLOCK
      ?auto_338870 - BLOCK
      ?auto_338871 - BLOCK
      ?auto_338872 - BLOCK
      ?auto_338873 - BLOCK
      ?auto_338874 - BLOCK
      ?auto_338875 - BLOCK
      ?auto_338876 - BLOCK
      ?auto_338877 - BLOCK
      ?auto_338878 - BLOCK
      ?auto_338879 - BLOCK
      ?auto_338880 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_338880 ) ( ON-TABLE ?auto_338867 ) ( ON ?auto_338868 ?auto_338867 ) ( ON ?auto_338869 ?auto_338868 ) ( ON ?auto_338870 ?auto_338869 ) ( ON ?auto_338871 ?auto_338870 ) ( not ( = ?auto_338867 ?auto_338868 ) ) ( not ( = ?auto_338867 ?auto_338869 ) ) ( not ( = ?auto_338867 ?auto_338870 ) ) ( not ( = ?auto_338867 ?auto_338871 ) ) ( not ( = ?auto_338867 ?auto_338872 ) ) ( not ( = ?auto_338867 ?auto_338873 ) ) ( not ( = ?auto_338867 ?auto_338874 ) ) ( not ( = ?auto_338867 ?auto_338875 ) ) ( not ( = ?auto_338867 ?auto_338876 ) ) ( not ( = ?auto_338867 ?auto_338877 ) ) ( not ( = ?auto_338867 ?auto_338878 ) ) ( not ( = ?auto_338867 ?auto_338879 ) ) ( not ( = ?auto_338867 ?auto_338880 ) ) ( not ( = ?auto_338868 ?auto_338869 ) ) ( not ( = ?auto_338868 ?auto_338870 ) ) ( not ( = ?auto_338868 ?auto_338871 ) ) ( not ( = ?auto_338868 ?auto_338872 ) ) ( not ( = ?auto_338868 ?auto_338873 ) ) ( not ( = ?auto_338868 ?auto_338874 ) ) ( not ( = ?auto_338868 ?auto_338875 ) ) ( not ( = ?auto_338868 ?auto_338876 ) ) ( not ( = ?auto_338868 ?auto_338877 ) ) ( not ( = ?auto_338868 ?auto_338878 ) ) ( not ( = ?auto_338868 ?auto_338879 ) ) ( not ( = ?auto_338868 ?auto_338880 ) ) ( not ( = ?auto_338869 ?auto_338870 ) ) ( not ( = ?auto_338869 ?auto_338871 ) ) ( not ( = ?auto_338869 ?auto_338872 ) ) ( not ( = ?auto_338869 ?auto_338873 ) ) ( not ( = ?auto_338869 ?auto_338874 ) ) ( not ( = ?auto_338869 ?auto_338875 ) ) ( not ( = ?auto_338869 ?auto_338876 ) ) ( not ( = ?auto_338869 ?auto_338877 ) ) ( not ( = ?auto_338869 ?auto_338878 ) ) ( not ( = ?auto_338869 ?auto_338879 ) ) ( not ( = ?auto_338869 ?auto_338880 ) ) ( not ( = ?auto_338870 ?auto_338871 ) ) ( not ( = ?auto_338870 ?auto_338872 ) ) ( not ( = ?auto_338870 ?auto_338873 ) ) ( not ( = ?auto_338870 ?auto_338874 ) ) ( not ( = ?auto_338870 ?auto_338875 ) ) ( not ( = ?auto_338870 ?auto_338876 ) ) ( not ( = ?auto_338870 ?auto_338877 ) ) ( not ( = ?auto_338870 ?auto_338878 ) ) ( not ( = ?auto_338870 ?auto_338879 ) ) ( not ( = ?auto_338870 ?auto_338880 ) ) ( not ( = ?auto_338871 ?auto_338872 ) ) ( not ( = ?auto_338871 ?auto_338873 ) ) ( not ( = ?auto_338871 ?auto_338874 ) ) ( not ( = ?auto_338871 ?auto_338875 ) ) ( not ( = ?auto_338871 ?auto_338876 ) ) ( not ( = ?auto_338871 ?auto_338877 ) ) ( not ( = ?auto_338871 ?auto_338878 ) ) ( not ( = ?auto_338871 ?auto_338879 ) ) ( not ( = ?auto_338871 ?auto_338880 ) ) ( not ( = ?auto_338872 ?auto_338873 ) ) ( not ( = ?auto_338872 ?auto_338874 ) ) ( not ( = ?auto_338872 ?auto_338875 ) ) ( not ( = ?auto_338872 ?auto_338876 ) ) ( not ( = ?auto_338872 ?auto_338877 ) ) ( not ( = ?auto_338872 ?auto_338878 ) ) ( not ( = ?auto_338872 ?auto_338879 ) ) ( not ( = ?auto_338872 ?auto_338880 ) ) ( not ( = ?auto_338873 ?auto_338874 ) ) ( not ( = ?auto_338873 ?auto_338875 ) ) ( not ( = ?auto_338873 ?auto_338876 ) ) ( not ( = ?auto_338873 ?auto_338877 ) ) ( not ( = ?auto_338873 ?auto_338878 ) ) ( not ( = ?auto_338873 ?auto_338879 ) ) ( not ( = ?auto_338873 ?auto_338880 ) ) ( not ( = ?auto_338874 ?auto_338875 ) ) ( not ( = ?auto_338874 ?auto_338876 ) ) ( not ( = ?auto_338874 ?auto_338877 ) ) ( not ( = ?auto_338874 ?auto_338878 ) ) ( not ( = ?auto_338874 ?auto_338879 ) ) ( not ( = ?auto_338874 ?auto_338880 ) ) ( not ( = ?auto_338875 ?auto_338876 ) ) ( not ( = ?auto_338875 ?auto_338877 ) ) ( not ( = ?auto_338875 ?auto_338878 ) ) ( not ( = ?auto_338875 ?auto_338879 ) ) ( not ( = ?auto_338875 ?auto_338880 ) ) ( not ( = ?auto_338876 ?auto_338877 ) ) ( not ( = ?auto_338876 ?auto_338878 ) ) ( not ( = ?auto_338876 ?auto_338879 ) ) ( not ( = ?auto_338876 ?auto_338880 ) ) ( not ( = ?auto_338877 ?auto_338878 ) ) ( not ( = ?auto_338877 ?auto_338879 ) ) ( not ( = ?auto_338877 ?auto_338880 ) ) ( not ( = ?auto_338878 ?auto_338879 ) ) ( not ( = ?auto_338878 ?auto_338880 ) ) ( not ( = ?auto_338879 ?auto_338880 ) ) ( ON ?auto_338879 ?auto_338880 ) ( ON ?auto_338878 ?auto_338879 ) ( ON ?auto_338877 ?auto_338878 ) ( ON ?auto_338876 ?auto_338877 ) ( ON ?auto_338875 ?auto_338876 ) ( ON ?auto_338874 ?auto_338875 ) ( ON ?auto_338873 ?auto_338874 ) ( CLEAR ?auto_338871 ) ( ON ?auto_338872 ?auto_338873 ) ( CLEAR ?auto_338872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_338867 ?auto_338868 ?auto_338869 ?auto_338870 ?auto_338871 ?auto_338872 )
      ( MAKE-14PILE ?auto_338867 ?auto_338868 ?auto_338869 ?auto_338870 ?auto_338871 ?auto_338872 ?auto_338873 ?auto_338874 ?auto_338875 ?auto_338876 ?auto_338877 ?auto_338878 ?auto_338879 ?auto_338880 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338895 - BLOCK
      ?auto_338896 - BLOCK
      ?auto_338897 - BLOCK
      ?auto_338898 - BLOCK
      ?auto_338899 - BLOCK
      ?auto_338900 - BLOCK
      ?auto_338901 - BLOCK
      ?auto_338902 - BLOCK
      ?auto_338903 - BLOCK
      ?auto_338904 - BLOCK
      ?auto_338905 - BLOCK
      ?auto_338906 - BLOCK
      ?auto_338907 - BLOCK
      ?auto_338908 - BLOCK
    )
    :vars
    (
      ?auto_338909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338908 ?auto_338909 ) ( ON-TABLE ?auto_338895 ) ( ON ?auto_338896 ?auto_338895 ) ( ON ?auto_338897 ?auto_338896 ) ( ON ?auto_338898 ?auto_338897 ) ( not ( = ?auto_338895 ?auto_338896 ) ) ( not ( = ?auto_338895 ?auto_338897 ) ) ( not ( = ?auto_338895 ?auto_338898 ) ) ( not ( = ?auto_338895 ?auto_338899 ) ) ( not ( = ?auto_338895 ?auto_338900 ) ) ( not ( = ?auto_338895 ?auto_338901 ) ) ( not ( = ?auto_338895 ?auto_338902 ) ) ( not ( = ?auto_338895 ?auto_338903 ) ) ( not ( = ?auto_338895 ?auto_338904 ) ) ( not ( = ?auto_338895 ?auto_338905 ) ) ( not ( = ?auto_338895 ?auto_338906 ) ) ( not ( = ?auto_338895 ?auto_338907 ) ) ( not ( = ?auto_338895 ?auto_338908 ) ) ( not ( = ?auto_338895 ?auto_338909 ) ) ( not ( = ?auto_338896 ?auto_338897 ) ) ( not ( = ?auto_338896 ?auto_338898 ) ) ( not ( = ?auto_338896 ?auto_338899 ) ) ( not ( = ?auto_338896 ?auto_338900 ) ) ( not ( = ?auto_338896 ?auto_338901 ) ) ( not ( = ?auto_338896 ?auto_338902 ) ) ( not ( = ?auto_338896 ?auto_338903 ) ) ( not ( = ?auto_338896 ?auto_338904 ) ) ( not ( = ?auto_338896 ?auto_338905 ) ) ( not ( = ?auto_338896 ?auto_338906 ) ) ( not ( = ?auto_338896 ?auto_338907 ) ) ( not ( = ?auto_338896 ?auto_338908 ) ) ( not ( = ?auto_338896 ?auto_338909 ) ) ( not ( = ?auto_338897 ?auto_338898 ) ) ( not ( = ?auto_338897 ?auto_338899 ) ) ( not ( = ?auto_338897 ?auto_338900 ) ) ( not ( = ?auto_338897 ?auto_338901 ) ) ( not ( = ?auto_338897 ?auto_338902 ) ) ( not ( = ?auto_338897 ?auto_338903 ) ) ( not ( = ?auto_338897 ?auto_338904 ) ) ( not ( = ?auto_338897 ?auto_338905 ) ) ( not ( = ?auto_338897 ?auto_338906 ) ) ( not ( = ?auto_338897 ?auto_338907 ) ) ( not ( = ?auto_338897 ?auto_338908 ) ) ( not ( = ?auto_338897 ?auto_338909 ) ) ( not ( = ?auto_338898 ?auto_338899 ) ) ( not ( = ?auto_338898 ?auto_338900 ) ) ( not ( = ?auto_338898 ?auto_338901 ) ) ( not ( = ?auto_338898 ?auto_338902 ) ) ( not ( = ?auto_338898 ?auto_338903 ) ) ( not ( = ?auto_338898 ?auto_338904 ) ) ( not ( = ?auto_338898 ?auto_338905 ) ) ( not ( = ?auto_338898 ?auto_338906 ) ) ( not ( = ?auto_338898 ?auto_338907 ) ) ( not ( = ?auto_338898 ?auto_338908 ) ) ( not ( = ?auto_338898 ?auto_338909 ) ) ( not ( = ?auto_338899 ?auto_338900 ) ) ( not ( = ?auto_338899 ?auto_338901 ) ) ( not ( = ?auto_338899 ?auto_338902 ) ) ( not ( = ?auto_338899 ?auto_338903 ) ) ( not ( = ?auto_338899 ?auto_338904 ) ) ( not ( = ?auto_338899 ?auto_338905 ) ) ( not ( = ?auto_338899 ?auto_338906 ) ) ( not ( = ?auto_338899 ?auto_338907 ) ) ( not ( = ?auto_338899 ?auto_338908 ) ) ( not ( = ?auto_338899 ?auto_338909 ) ) ( not ( = ?auto_338900 ?auto_338901 ) ) ( not ( = ?auto_338900 ?auto_338902 ) ) ( not ( = ?auto_338900 ?auto_338903 ) ) ( not ( = ?auto_338900 ?auto_338904 ) ) ( not ( = ?auto_338900 ?auto_338905 ) ) ( not ( = ?auto_338900 ?auto_338906 ) ) ( not ( = ?auto_338900 ?auto_338907 ) ) ( not ( = ?auto_338900 ?auto_338908 ) ) ( not ( = ?auto_338900 ?auto_338909 ) ) ( not ( = ?auto_338901 ?auto_338902 ) ) ( not ( = ?auto_338901 ?auto_338903 ) ) ( not ( = ?auto_338901 ?auto_338904 ) ) ( not ( = ?auto_338901 ?auto_338905 ) ) ( not ( = ?auto_338901 ?auto_338906 ) ) ( not ( = ?auto_338901 ?auto_338907 ) ) ( not ( = ?auto_338901 ?auto_338908 ) ) ( not ( = ?auto_338901 ?auto_338909 ) ) ( not ( = ?auto_338902 ?auto_338903 ) ) ( not ( = ?auto_338902 ?auto_338904 ) ) ( not ( = ?auto_338902 ?auto_338905 ) ) ( not ( = ?auto_338902 ?auto_338906 ) ) ( not ( = ?auto_338902 ?auto_338907 ) ) ( not ( = ?auto_338902 ?auto_338908 ) ) ( not ( = ?auto_338902 ?auto_338909 ) ) ( not ( = ?auto_338903 ?auto_338904 ) ) ( not ( = ?auto_338903 ?auto_338905 ) ) ( not ( = ?auto_338903 ?auto_338906 ) ) ( not ( = ?auto_338903 ?auto_338907 ) ) ( not ( = ?auto_338903 ?auto_338908 ) ) ( not ( = ?auto_338903 ?auto_338909 ) ) ( not ( = ?auto_338904 ?auto_338905 ) ) ( not ( = ?auto_338904 ?auto_338906 ) ) ( not ( = ?auto_338904 ?auto_338907 ) ) ( not ( = ?auto_338904 ?auto_338908 ) ) ( not ( = ?auto_338904 ?auto_338909 ) ) ( not ( = ?auto_338905 ?auto_338906 ) ) ( not ( = ?auto_338905 ?auto_338907 ) ) ( not ( = ?auto_338905 ?auto_338908 ) ) ( not ( = ?auto_338905 ?auto_338909 ) ) ( not ( = ?auto_338906 ?auto_338907 ) ) ( not ( = ?auto_338906 ?auto_338908 ) ) ( not ( = ?auto_338906 ?auto_338909 ) ) ( not ( = ?auto_338907 ?auto_338908 ) ) ( not ( = ?auto_338907 ?auto_338909 ) ) ( not ( = ?auto_338908 ?auto_338909 ) ) ( ON ?auto_338907 ?auto_338908 ) ( ON ?auto_338906 ?auto_338907 ) ( ON ?auto_338905 ?auto_338906 ) ( ON ?auto_338904 ?auto_338905 ) ( ON ?auto_338903 ?auto_338904 ) ( ON ?auto_338902 ?auto_338903 ) ( ON ?auto_338901 ?auto_338902 ) ( ON ?auto_338900 ?auto_338901 ) ( CLEAR ?auto_338898 ) ( ON ?auto_338899 ?auto_338900 ) ( CLEAR ?auto_338899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_338895 ?auto_338896 ?auto_338897 ?auto_338898 ?auto_338899 )
      ( MAKE-14PILE ?auto_338895 ?auto_338896 ?auto_338897 ?auto_338898 ?auto_338899 ?auto_338900 ?auto_338901 ?auto_338902 ?auto_338903 ?auto_338904 ?auto_338905 ?auto_338906 ?auto_338907 ?auto_338908 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338924 - BLOCK
      ?auto_338925 - BLOCK
      ?auto_338926 - BLOCK
      ?auto_338927 - BLOCK
      ?auto_338928 - BLOCK
      ?auto_338929 - BLOCK
      ?auto_338930 - BLOCK
      ?auto_338931 - BLOCK
      ?auto_338932 - BLOCK
      ?auto_338933 - BLOCK
      ?auto_338934 - BLOCK
      ?auto_338935 - BLOCK
      ?auto_338936 - BLOCK
      ?auto_338937 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_338937 ) ( ON-TABLE ?auto_338924 ) ( ON ?auto_338925 ?auto_338924 ) ( ON ?auto_338926 ?auto_338925 ) ( ON ?auto_338927 ?auto_338926 ) ( not ( = ?auto_338924 ?auto_338925 ) ) ( not ( = ?auto_338924 ?auto_338926 ) ) ( not ( = ?auto_338924 ?auto_338927 ) ) ( not ( = ?auto_338924 ?auto_338928 ) ) ( not ( = ?auto_338924 ?auto_338929 ) ) ( not ( = ?auto_338924 ?auto_338930 ) ) ( not ( = ?auto_338924 ?auto_338931 ) ) ( not ( = ?auto_338924 ?auto_338932 ) ) ( not ( = ?auto_338924 ?auto_338933 ) ) ( not ( = ?auto_338924 ?auto_338934 ) ) ( not ( = ?auto_338924 ?auto_338935 ) ) ( not ( = ?auto_338924 ?auto_338936 ) ) ( not ( = ?auto_338924 ?auto_338937 ) ) ( not ( = ?auto_338925 ?auto_338926 ) ) ( not ( = ?auto_338925 ?auto_338927 ) ) ( not ( = ?auto_338925 ?auto_338928 ) ) ( not ( = ?auto_338925 ?auto_338929 ) ) ( not ( = ?auto_338925 ?auto_338930 ) ) ( not ( = ?auto_338925 ?auto_338931 ) ) ( not ( = ?auto_338925 ?auto_338932 ) ) ( not ( = ?auto_338925 ?auto_338933 ) ) ( not ( = ?auto_338925 ?auto_338934 ) ) ( not ( = ?auto_338925 ?auto_338935 ) ) ( not ( = ?auto_338925 ?auto_338936 ) ) ( not ( = ?auto_338925 ?auto_338937 ) ) ( not ( = ?auto_338926 ?auto_338927 ) ) ( not ( = ?auto_338926 ?auto_338928 ) ) ( not ( = ?auto_338926 ?auto_338929 ) ) ( not ( = ?auto_338926 ?auto_338930 ) ) ( not ( = ?auto_338926 ?auto_338931 ) ) ( not ( = ?auto_338926 ?auto_338932 ) ) ( not ( = ?auto_338926 ?auto_338933 ) ) ( not ( = ?auto_338926 ?auto_338934 ) ) ( not ( = ?auto_338926 ?auto_338935 ) ) ( not ( = ?auto_338926 ?auto_338936 ) ) ( not ( = ?auto_338926 ?auto_338937 ) ) ( not ( = ?auto_338927 ?auto_338928 ) ) ( not ( = ?auto_338927 ?auto_338929 ) ) ( not ( = ?auto_338927 ?auto_338930 ) ) ( not ( = ?auto_338927 ?auto_338931 ) ) ( not ( = ?auto_338927 ?auto_338932 ) ) ( not ( = ?auto_338927 ?auto_338933 ) ) ( not ( = ?auto_338927 ?auto_338934 ) ) ( not ( = ?auto_338927 ?auto_338935 ) ) ( not ( = ?auto_338927 ?auto_338936 ) ) ( not ( = ?auto_338927 ?auto_338937 ) ) ( not ( = ?auto_338928 ?auto_338929 ) ) ( not ( = ?auto_338928 ?auto_338930 ) ) ( not ( = ?auto_338928 ?auto_338931 ) ) ( not ( = ?auto_338928 ?auto_338932 ) ) ( not ( = ?auto_338928 ?auto_338933 ) ) ( not ( = ?auto_338928 ?auto_338934 ) ) ( not ( = ?auto_338928 ?auto_338935 ) ) ( not ( = ?auto_338928 ?auto_338936 ) ) ( not ( = ?auto_338928 ?auto_338937 ) ) ( not ( = ?auto_338929 ?auto_338930 ) ) ( not ( = ?auto_338929 ?auto_338931 ) ) ( not ( = ?auto_338929 ?auto_338932 ) ) ( not ( = ?auto_338929 ?auto_338933 ) ) ( not ( = ?auto_338929 ?auto_338934 ) ) ( not ( = ?auto_338929 ?auto_338935 ) ) ( not ( = ?auto_338929 ?auto_338936 ) ) ( not ( = ?auto_338929 ?auto_338937 ) ) ( not ( = ?auto_338930 ?auto_338931 ) ) ( not ( = ?auto_338930 ?auto_338932 ) ) ( not ( = ?auto_338930 ?auto_338933 ) ) ( not ( = ?auto_338930 ?auto_338934 ) ) ( not ( = ?auto_338930 ?auto_338935 ) ) ( not ( = ?auto_338930 ?auto_338936 ) ) ( not ( = ?auto_338930 ?auto_338937 ) ) ( not ( = ?auto_338931 ?auto_338932 ) ) ( not ( = ?auto_338931 ?auto_338933 ) ) ( not ( = ?auto_338931 ?auto_338934 ) ) ( not ( = ?auto_338931 ?auto_338935 ) ) ( not ( = ?auto_338931 ?auto_338936 ) ) ( not ( = ?auto_338931 ?auto_338937 ) ) ( not ( = ?auto_338932 ?auto_338933 ) ) ( not ( = ?auto_338932 ?auto_338934 ) ) ( not ( = ?auto_338932 ?auto_338935 ) ) ( not ( = ?auto_338932 ?auto_338936 ) ) ( not ( = ?auto_338932 ?auto_338937 ) ) ( not ( = ?auto_338933 ?auto_338934 ) ) ( not ( = ?auto_338933 ?auto_338935 ) ) ( not ( = ?auto_338933 ?auto_338936 ) ) ( not ( = ?auto_338933 ?auto_338937 ) ) ( not ( = ?auto_338934 ?auto_338935 ) ) ( not ( = ?auto_338934 ?auto_338936 ) ) ( not ( = ?auto_338934 ?auto_338937 ) ) ( not ( = ?auto_338935 ?auto_338936 ) ) ( not ( = ?auto_338935 ?auto_338937 ) ) ( not ( = ?auto_338936 ?auto_338937 ) ) ( ON ?auto_338936 ?auto_338937 ) ( ON ?auto_338935 ?auto_338936 ) ( ON ?auto_338934 ?auto_338935 ) ( ON ?auto_338933 ?auto_338934 ) ( ON ?auto_338932 ?auto_338933 ) ( ON ?auto_338931 ?auto_338932 ) ( ON ?auto_338930 ?auto_338931 ) ( ON ?auto_338929 ?auto_338930 ) ( CLEAR ?auto_338927 ) ( ON ?auto_338928 ?auto_338929 ) ( CLEAR ?auto_338928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_338924 ?auto_338925 ?auto_338926 ?auto_338927 ?auto_338928 )
      ( MAKE-14PILE ?auto_338924 ?auto_338925 ?auto_338926 ?auto_338927 ?auto_338928 ?auto_338929 ?auto_338930 ?auto_338931 ?auto_338932 ?auto_338933 ?auto_338934 ?auto_338935 ?auto_338936 ?auto_338937 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338952 - BLOCK
      ?auto_338953 - BLOCK
      ?auto_338954 - BLOCK
      ?auto_338955 - BLOCK
      ?auto_338956 - BLOCK
      ?auto_338957 - BLOCK
      ?auto_338958 - BLOCK
      ?auto_338959 - BLOCK
      ?auto_338960 - BLOCK
      ?auto_338961 - BLOCK
      ?auto_338962 - BLOCK
      ?auto_338963 - BLOCK
      ?auto_338964 - BLOCK
      ?auto_338965 - BLOCK
    )
    :vars
    (
      ?auto_338966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338965 ?auto_338966 ) ( ON-TABLE ?auto_338952 ) ( ON ?auto_338953 ?auto_338952 ) ( ON ?auto_338954 ?auto_338953 ) ( not ( = ?auto_338952 ?auto_338953 ) ) ( not ( = ?auto_338952 ?auto_338954 ) ) ( not ( = ?auto_338952 ?auto_338955 ) ) ( not ( = ?auto_338952 ?auto_338956 ) ) ( not ( = ?auto_338952 ?auto_338957 ) ) ( not ( = ?auto_338952 ?auto_338958 ) ) ( not ( = ?auto_338952 ?auto_338959 ) ) ( not ( = ?auto_338952 ?auto_338960 ) ) ( not ( = ?auto_338952 ?auto_338961 ) ) ( not ( = ?auto_338952 ?auto_338962 ) ) ( not ( = ?auto_338952 ?auto_338963 ) ) ( not ( = ?auto_338952 ?auto_338964 ) ) ( not ( = ?auto_338952 ?auto_338965 ) ) ( not ( = ?auto_338952 ?auto_338966 ) ) ( not ( = ?auto_338953 ?auto_338954 ) ) ( not ( = ?auto_338953 ?auto_338955 ) ) ( not ( = ?auto_338953 ?auto_338956 ) ) ( not ( = ?auto_338953 ?auto_338957 ) ) ( not ( = ?auto_338953 ?auto_338958 ) ) ( not ( = ?auto_338953 ?auto_338959 ) ) ( not ( = ?auto_338953 ?auto_338960 ) ) ( not ( = ?auto_338953 ?auto_338961 ) ) ( not ( = ?auto_338953 ?auto_338962 ) ) ( not ( = ?auto_338953 ?auto_338963 ) ) ( not ( = ?auto_338953 ?auto_338964 ) ) ( not ( = ?auto_338953 ?auto_338965 ) ) ( not ( = ?auto_338953 ?auto_338966 ) ) ( not ( = ?auto_338954 ?auto_338955 ) ) ( not ( = ?auto_338954 ?auto_338956 ) ) ( not ( = ?auto_338954 ?auto_338957 ) ) ( not ( = ?auto_338954 ?auto_338958 ) ) ( not ( = ?auto_338954 ?auto_338959 ) ) ( not ( = ?auto_338954 ?auto_338960 ) ) ( not ( = ?auto_338954 ?auto_338961 ) ) ( not ( = ?auto_338954 ?auto_338962 ) ) ( not ( = ?auto_338954 ?auto_338963 ) ) ( not ( = ?auto_338954 ?auto_338964 ) ) ( not ( = ?auto_338954 ?auto_338965 ) ) ( not ( = ?auto_338954 ?auto_338966 ) ) ( not ( = ?auto_338955 ?auto_338956 ) ) ( not ( = ?auto_338955 ?auto_338957 ) ) ( not ( = ?auto_338955 ?auto_338958 ) ) ( not ( = ?auto_338955 ?auto_338959 ) ) ( not ( = ?auto_338955 ?auto_338960 ) ) ( not ( = ?auto_338955 ?auto_338961 ) ) ( not ( = ?auto_338955 ?auto_338962 ) ) ( not ( = ?auto_338955 ?auto_338963 ) ) ( not ( = ?auto_338955 ?auto_338964 ) ) ( not ( = ?auto_338955 ?auto_338965 ) ) ( not ( = ?auto_338955 ?auto_338966 ) ) ( not ( = ?auto_338956 ?auto_338957 ) ) ( not ( = ?auto_338956 ?auto_338958 ) ) ( not ( = ?auto_338956 ?auto_338959 ) ) ( not ( = ?auto_338956 ?auto_338960 ) ) ( not ( = ?auto_338956 ?auto_338961 ) ) ( not ( = ?auto_338956 ?auto_338962 ) ) ( not ( = ?auto_338956 ?auto_338963 ) ) ( not ( = ?auto_338956 ?auto_338964 ) ) ( not ( = ?auto_338956 ?auto_338965 ) ) ( not ( = ?auto_338956 ?auto_338966 ) ) ( not ( = ?auto_338957 ?auto_338958 ) ) ( not ( = ?auto_338957 ?auto_338959 ) ) ( not ( = ?auto_338957 ?auto_338960 ) ) ( not ( = ?auto_338957 ?auto_338961 ) ) ( not ( = ?auto_338957 ?auto_338962 ) ) ( not ( = ?auto_338957 ?auto_338963 ) ) ( not ( = ?auto_338957 ?auto_338964 ) ) ( not ( = ?auto_338957 ?auto_338965 ) ) ( not ( = ?auto_338957 ?auto_338966 ) ) ( not ( = ?auto_338958 ?auto_338959 ) ) ( not ( = ?auto_338958 ?auto_338960 ) ) ( not ( = ?auto_338958 ?auto_338961 ) ) ( not ( = ?auto_338958 ?auto_338962 ) ) ( not ( = ?auto_338958 ?auto_338963 ) ) ( not ( = ?auto_338958 ?auto_338964 ) ) ( not ( = ?auto_338958 ?auto_338965 ) ) ( not ( = ?auto_338958 ?auto_338966 ) ) ( not ( = ?auto_338959 ?auto_338960 ) ) ( not ( = ?auto_338959 ?auto_338961 ) ) ( not ( = ?auto_338959 ?auto_338962 ) ) ( not ( = ?auto_338959 ?auto_338963 ) ) ( not ( = ?auto_338959 ?auto_338964 ) ) ( not ( = ?auto_338959 ?auto_338965 ) ) ( not ( = ?auto_338959 ?auto_338966 ) ) ( not ( = ?auto_338960 ?auto_338961 ) ) ( not ( = ?auto_338960 ?auto_338962 ) ) ( not ( = ?auto_338960 ?auto_338963 ) ) ( not ( = ?auto_338960 ?auto_338964 ) ) ( not ( = ?auto_338960 ?auto_338965 ) ) ( not ( = ?auto_338960 ?auto_338966 ) ) ( not ( = ?auto_338961 ?auto_338962 ) ) ( not ( = ?auto_338961 ?auto_338963 ) ) ( not ( = ?auto_338961 ?auto_338964 ) ) ( not ( = ?auto_338961 ?auto_338965 ) ) ( not ( = ?auto_338961 ?auto_338966 ) ) ( not ( = ?auto_338962 ?auto_338963 ) ) ( not ( = ?auto_338962 ?auto_338964 ) ) ( not ( = ?auto_338962 ?auto_338965 ) ) ( not ( = ?auto_338962 ?auto_338966 ) ) ( not ( = ?auto_338963 ?auto_338964 ) ) ( not ( = ?auto_338963 ?auto_338965 ) ) ( not ( = ?auto_338963 ?auto_338966 ) ) ( not ( = ?auto_338964 ?auto_338965 ) ) ( not ( = ?auto_338964 ?auto_338966 ) ) ( not ( = ?auto_338965 ?auto_338966 ) ) ( ON ?auto_338964 ?auto_338965 ) ( ON ?auto_338963 ?auto_338964 ) ( ON ?auto_338962 ?auto_338963 ) ( ON ?auto_338961 ?auto_338962 ) ( ON ?auto_338960 ?auto_338961 ) ( ON ?auto_338959 ?auto_338960 ) ( ON ?auto_338958 ?auto_338959 ) ( ON ?auto_338957 ?auto_338958 ) ( ON ?auto_338956 ?auto_338957 ) ( CLEAR ?auto_338954 ) ( ON ?auto_338955 ?auto_338956 ) ( CLEAR ?auto_338955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_338952 ?auto_338953 ?auto_338954 ?auto_338955 )
      ( MAKE-14PILE ?auto_338952 ?auto_338953 ?auto_338954 ?auto_338955 ?auto_338956 ?auto_338957 ?auto_338958 ?auto_338959 ?auto_338960 ?auto_338961 ?auto_338962 ?auto_338963 ?auto_338964 ?auto_338965 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338981 - BLOCK
      ?auto_338982 - BLOCK
      ?auto_338983 - BLOCK
      ?auto_338984 - BLOCK
      ?auto_338985 - BLOCK
      ?auto_338986 - BLOCK
      ?auto_338987 - BLOCK
      ?auto_338988 - BLOCK
      ?auto_338989 - BLOCK
      ?auto_338990 - BLOCK
      ?auto_338991 - BLOCK
      ?auto_338992 - BLOCK
      ?auto_338993 - BLOCK
      ?auto_338994 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_338994 ) ( ON-TABLE ?auto_338981 ) ( ON ?auto_338982 ?auto_338981 ) ( ON ?auto_338983 ?auto_338982 ) ( not ( = ?auto_338981 ?auto_338982 ) ) ( not ( = ?auto_338981 ?auto_338983 ) ) ( not ( = ?auto_338981 ?auto_338984 ) ) ( not ( = ?auto_338981 ?auto_338985 ) ) ( not ( = ?auto_338981 ?auto_338986 ) ) ( not ( = ?auto_338981 ?auto_338987 ) ) ( not ( = ?auto_338981 ?auto_338988 ) ) ( not ( = ?auto_338981 ?auto_338989 ) ) ( not ( = ?auto_338981 ?auto_338990 ) ) ( not ( = ?auto_338981 ?auto_338991 ) ) ( not ( = ?auto_338981 ?auto_338992 ) ) ( not ( = ?auto_338981 ?auto_338993 ) ) ( not ( = ?auto_338981 ?auto_338994 ) ) ( not ( = ?auto_338982 ?auto_338983 ) ) ( not ( = ?auto_338982 ?auto_338984 ) ) ( not ( = ?auto_338982 ?auto_338985 ) ) ( not ( = ?auto_338982 ?auto_338986 ) ) ( not ( = ?auto_338982 ?auto_338987 ) ) ( not ( = ?auto_338982 ?auto_338988 ) ) ( not ( = ?auto_338982 ?auto_338989 ) ) ( not ( = ?auto_338982 ?auto_338990 ) ) ( not ( = ?auto_338982 ?auto_338991 ) ) ( not ( = ?auto_338982 ?auto_338992 ) ) ( not ( = ?auto_338982 ?auto_338993 ) ) ( not ( = ?auto_338982 ?auto_338994 ) ) ( not ( = ?auto_338983 ?auto_338984 ) ) ( not ( = ?auto_338983 ?auto_338985 ) ) ( not ( = ?auto_338983 ?auto_338986 ) ) ( not ( = ?auto_338983 ?auto_338987 ) ) ( not ( = ?auto_338983 ?auto_338988 ) ) ( not ( = ?auto_338983 ?auto_338989 ) ) ( not ( = ?auto_338983 ?auto_338990 ) ) ( not ( = ?auto_338983 ?auto_338991 ) ) ( not ( = ?auto_338983 ?auto_338992 ) ) ( not ( = ?auto_338983 ?auto_338993 ) ) ( not ( = ?auto_338983 ?auto_338994 ) ) ( not ( = ?auto_338984 ?auto_338985 ) ) ( not ( = ?auto_338984 ?auto_338986 ) ) ( not ( = ?auto_338984 ?auto_338987 ) ) ( not ( = ?auto_338984 ?auto_338988 ) ) ( not ( = ?auto_338984 ?auto_338989 ) ) ( not ( = ?auto_338984 ?auto_338990 ) ) ( not ( = ?auto_338984 ?auto_338991 ) ) ( not ( = ?auto_338984 ?auto_338992 ) ) ( not ( = ?auto_338984 ?auto_338993 ) ) ( not ( = ?auto_338984 ?auto_338994 ) ) ( not ( = ?auto_338985 ?auto_338986 ) ) ( not ( = ?auto_338985 ?auto_338987 ) ) ( not ( = ?auto_338985 ?auto_338988 ) ) ( not ( = ?auto_338985 ?auto_338989 ) ) ( not ( = ?auto_338985 ?auto_338990 ) ) ( not ( = ?auto_338985 ?auto_338991 ) ) ( not ( = ?auto_338985 ?auto_338992 ) ) ( not ( = ?auto_338985 ?auto_338993 ) ) ( not ( = ?auto_338985 ?auto_338994 ) ) ( not ( = ?auto_338986 ?auto_338987 ) ) ( not ( = ?auto_338986 ?auto_338988 ) ) ( not ( = ?auto_338986 ?auto_338989 ) ) ( not ( = ?auto_338986 ?auto_338990 ) ) ( not ( = ?auto_338986 ?auto_338991 ) ) ( not ( = ?auto_338986 ?auto_338992 ) ) ( not ( = ?auto_338986 ?auto_338993 ) ) ( not ( = ?auto_338986 ?auto_338994 ) ) ( not ( = ?auto_338987 ?auto_338988 ) ) ( not ( = ?auto_338987 ?auto_338989 ) ) ( not ( = ?auto_338987 ?auto_338990 ) ) ( not ( = ?auto_338987 ?auto_338991 ) ) ( not ( = ?auto_338987 ?auto_338992 ) ) ( not ( = ?auto_338987 ?auto_338993 ) ) ( not ( = ?auto_338987 ?auto_338994 ) ) ( not ( = ?auto_338988 ?auto_338989 ) ) ( not ( = ?auto_338988 ?auto_338990 ) ) ( not ( = ?auto_338988 ?auto_338991 ) ) ( not ( = ?auto_338988 ?auto_338992 ) ) ( not ( = ?auto_338988 ?auto_338993 ) ) ( not ( = ?auto_338988 ?auto_338994 ) ) ( not ( = ?auto_338989 ?auto_338990 ) ) ( not ( = ?auto_338989 ?auto_338991 ) ) ( not ( = ?auto_338989 ?auto_338992 ) ) ( not ( = ?auto_338989 ?auto_338993 ) ) ( not ( = ?auto_338989 ?auto_338994 ) ) ( not ( = ?auto_338990 ?auto_338991 ) ) ( not ( = ?auto_338990 ?auto_338992 ) ) ( not ( = ?auto_338990 ?auto_338993 ) ) ( not ( = ?auto_338990 ?auto_338994 ) ) ( not ( = ?auto_338991 ?auto_338992 ) ) ( not ( = ?auto_338991 ?auto_338993 ) ) ( not ( = ?auto_338991 ?auto_338994 ) ) ( not ( = ?auto_338992 ?auto_338993 ) ) ( not ( = ?auto_338992 ?auto_338994 ) ) ( not ( = ?auto_338993 ?auto_338994 ) ) ( ON ?auto_338993 ?auto_338994 ) ( ON ?auto_338992 ?auto_338993 ) ( ON ?auto_338991 ?auto_338992 ) ( ON ?auto_338990 ?auto_338991 ) ( ON ?auto_338989 ?auto_338990 ) ( ON ?auto_338988 ?auto_338989 ) ( ON ?auto_338987 ?auto_338988 ) ( ON ?auto_338986 ?auto_338987 ) ( ON ?auto_338985 ?auto_338986 ) ( CLEAR ?auto_338983 ) ( ON ?auto_338984 ?auto_338985 ) ( CLEAR ?auto_338984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_338981 ?auto_338982 ?auto_338983 ?auto_338984 )
      ( MAKE-14PILE ?auto_338981 ?auto_338982 ?auto_338983 ?auto_338984 ?auto_338985 ?auto_338986 ?auto_338987 ?auto_338988 ?auto_338989 ?auto_338990 ?auto_338991 ?auto_338992 ?auto_338993 ?auto_338994 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_339009 - BLOCK
      ?auto_339010 - BLOCK
      ?auto_339011 - BLOCK
      ?auto_339012 - BLOCK
      ?auto_339013 - BLOCK
      ?auto_339014 - BLOCK
      ?auto_339015 - BLOCK
      ?auto_339016 - BLOCK
      ?auto_339017 - BLOCK
      ?auto_339018 - BLOCK
      ?auto_339019 - BLOCK
      ?auto_339020 - BLOCK
      ?auto_339021 - BLOCK
      ?auto_339022 - BLOCK
    )
    :vars
    (
      ?auto_339023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339022 ?auto_339023 ) ( ON-TABLE ?auto_339009 ) ( ON ?auto_339010 ?auto_339009 ) ( not ( = ?auto_339009 ?auto_339010 ) ) ( not ( = ?auto_339009 ?auto_339011 ) ) ( not ( = ?auto_339009 ?auto_339012 ) ) ( not ( = ?auto_339009 ?auto_339013 ) ) ( not ( = ?auto_339009 ?auto_339014 ) ) ( not ( = ?auto_339009 ?auto_339015 ) ) ( not ( = ?auto_339009 ?auto_339016 ) ) ( not ( = ?auto_339009 ?auto_339017 ) ) ( not ( = ?auto_339009 ?auto_339018 ) ) ( not ( = ?auto_339009 ?auto_339019 ) ) ( not ( = ?auto_339009 ?auto_339020 ) ) ( not ( = ?auto_339009 ?auto_339021 ) ) ( not ( = ?auto_339009 ?auto_339022 ) ) ( not ( = ?auto_339009 ?auto_339023 ) ) ( not ( = ?auto_339010 ?auto_339011 ) ) ( not ( = ?auto_339010 ?auto_339012 ) ) ( not ( = ?auto_339010 ?auto_339013 ) ) ( not ( = ?auto_339010 ?auto_339014 ) ) ( not ( = ?auto_339010 ?auto_339015 ) ) ( not ( = ?auto_339010 ?auto_339016 ) ) ( not ( = ?auto_339010 ?auto_339017 ) ) ( not ( = ?auto_339010 ?auto_339018 ) ) ( not ( = ?auto_339010 ?auto_339019 ) ) ( not ( = ?auto_339010 ?auto_339020 ) ) ( not ( = ?auto_339010 ?auto_339021 ) ) ( not ( = ?auto_339010 ?auto_339022 ) ) ( not ( = ?auto_339010 ?auto_339023 ) ) ( not ( = ?auto_339011 ?auto_339012 ) ) ( not ( = ?auto_339011 ?auto_339013 ) ) ( not ( = ?auto_339011 ?auto_339014 ) ) ( not ( = ?auto_339011 ?auto_339015 ) ) ( not ( = ?auto_339011 ?auto_339016 ) ) ( not ( = ?auto_339011 ?auto_339017 ) ) ( not ( = ?auto_339011 ?auto_339018 ) ) ( not ( = ?auto_339011 ?auto_339019 ) ) ( not ( = ?auto_339011 ?auto_339020 ) ) ( not ( = ?auto_339011 ?auto_339021 ) ) ( not ( = ?auto_339011 ?auto_339022 ) ) ( not ( = ?auto_339011 ?auto_339023 ) ) ( not ( = ?auto_339012 ?auto_339013 ) ) ( not ( = ?auto_339012 ?auto_339014 ) ) ( not ( = ?auto_339012 ?auto_339015 ) ) ( not ( = ?auto_339012 ?auto_339016 ) ) ( not ( = ?auto_339012 ?auto_339017 ) ) ( not ( = ?auto_339012 ?auto_339018 ) ) ( not ( = ?auto_339012 ?auto_339019 ) ) ( not ( = ?auto_339012 ?auto_339020 ) ) ( not ( = ?auto_339012 ?auto_339021 ) ) ( not ( = ?auto_339012 ?auto_339022 ) ) ( not ( = ?auto_339012 ?auto_339023 ) ) ( not ( = ?auto_339013 ?auto_339014 ) ) ( not ( = ?auto_339013 ?auto_339015 ) ) ( not ( = ?auto_339013 ?auto_339016 ) ) ( not ( = ?auto_339013 ?auto_339017 ) ) ( not ( = ?auto_339013 ?auto_339018 ) ) ( not ( = ?auto_339013 ?auto_339019 ) ) ( not ( = ?auto_339013 ?auto_339020 ) ) ( not ( = ?auto_339013 ?auto_339021 ) ) ( not ( = ?auto_339013 ?auto_339022 ) ) ( not ( = ?auto_339013 ?auto_339023 ) ) ( not ( = ?auto_339014 ?auto_339015 ) ) ( not ( = ?auto_339014 ?auto_339016 ) ) ( not ( = ?auto_339014 ?auto_339017 ) ) ( not ( = ?auto_339014 ?auto_339018 ) ) ( not ( = ?auto_339014 ?auto_339019 ) ) ( not ( = ?auto_339014 ?auto_339020 ) ) ( not ( = ?auto_339014 ?auto_339021 ) ) ( not ( = ?auto_339014 ?auto_339022 ) ) ( not ( = ?auto_339014 ?auto_339023 ) ) ( not ( = ?auto_339015 ?auto_339016 ) ) ( not ( = ?auto_339015 ?auto_339017 ) ) ( not ( = ?auto_339015 ?auto_339018 ) ) ( not ( = ?auto_339015 ?auto_339019 ) ) ( not ( = ?auto_339015 ?auto_339020 ) ) ( not ( = ?auto_339015 ?auto_339021 ) ) ( not ( = ?auto_339015 ?auto_339022 ) ) ( not ( = ?auto_339015 ?auto_339023 ) ) ( not ( = ?auto_339016 ?auto_339017 ) ) ( not ( = ?auto_339016 ?auto_339018 ) ) ( not ( = ?auto_339016 ?auto_339019 ) ) ( not ( = ?auto_339016 ?auto_339020 ) ) ( not ( = ?auto_339016 ?auto_339021 ) ) ( not ( = ?auto_339016 ?auto_339022 ) ) ( not ( = ?auto_339016 ?auto_339023 ) ) ( not ( = ?auto_339017 ?auto_339018 ) ) ( not ( = ?auto_339017 ?auto_339019 ) ) ( not ( = ?auto_339017 ?auto_339020 ) ) ( not ( = ?auto_339017 ?auto_339021 ) ) ( not ( = ?auto_339017 ?auto_339022 ) ) ( not ( = ?auto_339017 ?auto_339023 ) ) ( not ( = ?auto_339018 ?auto_339019 ) ) ( not ( = ?auto_339018 ?auto_339020 ) ) ( not ( = ?auto_339018 ?auto_339021 ) ) ( not ( = ?auto_339018 ?auto_339022 ) ) ( not ( = ?auto_339018 ?auto_339023 ) ) ( not ( = ?auto_339019 ?auto_339020 ) ) ( not ( = ?auto_339019 ?auto_339021 ) ) ( not ( = ?auto_339019 ?auto_339022 ) ) ( not ( = ?auto_339019 ?auto_339023 ) ) ( not ( = ?auto_339020 ?auto_339021 ) ) ( not ( = ?auto_339020 ?auto_339022 ) ) ( not ( = ?auto_339020 ?auto_339023 ) ) ( not ( = ?auto_339021 ?auto_339022 ) ) ( not ( = ?auto_339021 ?auto_339023 ) ) ( not ( = ?auto_339022 ?auto_339023 ) ) ( ON ?auto_339021 ?auto_339022 ) ( ON ?auto_339020 ?auto_339021 ) ( ON ?auto_339019 ?auto_339020 ) ( ON ?auto_339018 ?auto_339019 ) ( ON ?auto_339017 ?auto_339018 ) ( ON ?auto_339016 ?auto_339017 ) ( ON ?auto_339015 ?auto_339016 ) ( ON ?auto_339014 ?auto_339015 ) ( ON ?auto_339013 ?auto_339014 ) ( ON ?auto_339012 ?auto_339013 ) ( CLEAR ?auto_339010 ) ( ON ?auto_339011 ?auto_339012 ) ( CLEAR ?auto_339011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_339009 ?auto_339010 ?auto_339011 )
      ( MAKE-14PILE ?auto_339009 ?auto_339010 ?auto_339011 ?auto_339012 ?auto_339013 ?auto_339014 ?auto_339015 ?auto_339016 ?auto_339017 ?auto_339018 ?auto_339019 ?auto_339020 ?auto_339021 ?auto_339022 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_339038 - BLOCK
      ?auto_339039 - BLOCK
      ?auto_339040 - BLOCK
      ?auto_339041 - BLOCK
      ?auto_339042 - BLOCK
      ?auto_339043 - BLOCK
      ?auto_339044 - BLOCK
      ?auto_339045 - BLOCK
      ?auto_339046 - BLOCK
      ?auto_339047 - BLOCK
      ?auto_339048 - BLOCK
      ?auto_339049 - BLOCK
      ?auto_339050 - BLOCK
      ?auto_339051 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_339051 ) ( ON-TABLE ?auto_339038 ) ( ON ?auto_339039 ?auto_339038 ) ( not ( = ?auto_339038 ?auto_339039 ) ) ( not ( = ?auto_339038 ?auto_339040 ) ) ( not ( = ?auto_339038 ?auto_339041 ) ) ( not ( = ?auto_339038 ?auto_339042 ) ) ( not ( = ?auto_339038 ?auto_339043 ) ) ( not ( = ?auto_339038 ?auto_339044 ) ) ( not ( = ?auto_339038 ?auto_339045 ) ) ( not ( = ?auto_339038 ?auto_339046 ) ) ( not ( = ?auto_339038 ?auto_339047 ) ) ( not ( = ?auto_339038 ?auto_339048 ) ) ( not ( = ?auto_339038 ?auto_339049 ) ) ( not ( = ?auto_339038 ?auto_339050 ) ) ( not ( = ?auto_339038 ?auto_339051 ) ) ( not ( = ?auto_339039 ?auto_339040 ) ) ( not ( = ?auto_339039 ?auto_339041 ) ) ( not ( = ?auto_339039 ?auto_339042 ) ) ( not ( = ?auto_339039 ?auto_339043 ) ) ( not ( = ?auto_339039 ?auto_339044 ) ) ( not ( = ?auto_339039 ?auto_339045 ) ) ( not ( = ?auto_339039 ?auto_339046 ) ) ( not ( = ?auto_339039 ?auto_339047 ) ) ( not ( = ?auto_339039 ?auto_339048 ) ) ( not ( = ?auto_339039 ?auto_339049 ) ) ( not ( = ?auto_339039 ?auto_339050 ) ) ( not ( = ?auto_339039 ?auto_339051 ) ) ( not ( = ?auto_339040 ?auto_339041 ) ) ( not ( = ?auto_339040 ?auto_339042 ) ) ( not ( = ?auto_339040 ?auto_339043 ) ) ( not ( = ?auto_339040 ?auto_339044 ) ) ( not ( = ?auto_339040 ?auto_339045 ) ) ( not ( = ?auto_339040 ?auto_339046 ) ) ( not ( = ?auto_339040 ?auto_339047 ) ) ( not ( = ?auto_339040 ?auto_339048 ) ) ( not ( = ?auto_339040 ?auto_339049 ) ) ( not ( = ?auto_339040 ?auto_339050 ) ) ( not ( = ?auto_339040 ?auto_339051 ) ) ( not ( = ?auto_339041 ?auto_339042 ) ) ( not ( = ?auto_339041 ?auto_339043 ) ) ( not ( = ?auto_339041 ?auto_339044 ) ) ( not ( = ?auto_339041 ?auto_339045 ) ) ( not ( = ?auto_339041 ?auto_339046 ) ) ( not ( = ?auto_339041 ?auto_339047 ) ) ( not ( = ?auto_339041 ?auto_339048 ) ) ( not ( = ?auto_339041 ?auto_339049 ) ) ( not ( = ?auto_339041 ?auto_339050 ) ) ( not ( = ?auto_339041 ?auto_339051 ) ) ( not ( = ?auto_339042 ?auto_339043 ) ) ( not ( = ?auto_339042 ?auto_339044 ) ) ( not ( = ?auto_339042 ?auto_339045 ) ) ( not ( = ?auto_339042 ?auto_339046 ) ) ( not ( = ?auto_339042 ?auto_339047 ) ) ( not ( = ?auto_339042 ?auto_339048 ) ) ( not ( = ?auto_339042 ?auto_339049 ) ) ( not ( = ?auto_339042 ?auto_339050 ) ) ( not ( = ?auto_339042 ?auto_339051 ) ) ( not ( = ?auto_339043 ?auto_339044 ) ) ( not ( = ?auto_339043 ?auto_339045 ) ) ( not ( = ?auto_339043 ?auto_339046 ) ) ( not ( = ?auto_339043 ?auto_339047 ) ) ( not ( = ?auto_339043 ?auto_339048 ) ) ( not ( = ?auto_339043 ?auto_339049 ) ) ( not ( = ?auto_339043 ?auto_339050 ) ) ( not ( = ?auto_339043 ?auto_339051 ) ) ( not ( = ?auto_339044 ?auto_339045 ) ) ( not ( = ?auto_339044 ?auto_339046 ) ) ( not ( = ?auto_339044 ?auto_339047 ) ) ( not ( = ?auto_339044 ?auto_339048 ) ) ( not ( = ?auto_339044 ?auto_339049 ) ) ( not ( = ?auto_339044 ?auto_339050 ) ) ( not ( = ?auto_339044 ?auto_339051 ) ) ( not ( = ?auto_339045 ?auto_339046 ) ) ( not ( = ?auto_339045 ?auto_339047 ) ) ( not ( = ?auto_339045 ?auto_339048 ) ) ( not ( = ?auto_339045 ?auto_339049 ) ) ( not ( = ?auto_339045 ?auto_339050 ) ) ( not ( = ?auto_339045 ?auto_339051 ) ) ( not ( = ?auto_339046 ?auto_339047 ) ) ( not ( = ?auto_339046 ?auto_339048 ) ) ( not ( = ?auto_339046 ?auto_339049 ) ) ( not ( = ?auto_339046 ?auto_339050 ) ) ( not ( = ?auto_339046 ?auto_339051 ) ) ( not ( = ?auto_339047 ?auto_339048 ) ) ( not ( = ?auto_339047 ?auto_339049 ) ) ( not ( = ?auto_339047 ?auto_339050 ) ) ( not ( = ?auto_339047 ?auto_339051 ) ) ( not ( = ?auto_339048 ?auto_339049 ) ) ( not ( = ?auto_339048 ?auto_339050 ) ) ( not ( = ?auto_339048 ?auto_339051 ) ) ( not ( = ?auto_339049 ?auto_339050 ) ) ( not ( = ?auto_339049 ?auto_339051 ) ) ( not ( = ?auto_339050 ?auto_339051 ) ) ( ON ?auto_339050 ?auto_339051 ) ( ON ?auto_339049 ?auto_339050 ) ( ON ?auto_339048 ?auto_339049 ) ( ON ?auto_339047 ?auto_339048 ) ( ON ?auto_339046 ?auto_339047 ) ( ON ?auto_339045 ?auto_339046 ) ( ON ?auto_339044 ?auto_339045 ) ( ON ?auto_339043 ?auto_339044 ) ( ON ?auto_339042 ?auto_339043 ) ( ON ?auto_339041 ?auto_339042 ) ( CLEAR ?auto_339039 ) ( ON ?auto_339040 ?auto_339041 ) ( CLEAR ?auto_339040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_339038 ?auto_339039 ?auto_339040 )
      ( MAKE-14PILE ?auto_339038 ?auto_339039 ?auto_339040 ?auto_339041 ?auto_339042 ?auto_339043 ?auto_339044 ?auto_339045 ?auto_339046 ?auto_339047 ?auto_339048 ?auto_339049 ?auto_339050 ?auto_339051 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_339066 - BLOCK
      ?auto_339067 - BLOCK
      ?auto_339068 - BLOCK
      ?auto_339069 - BLOCK
      ?auto_339070 - BLOCK
      ?auto_339071 - BLOCK
      ?auto_339072 - BLOCK
      ?auto_339073 - BLOCK
      ?auto_339074 - BLOCK
      ?auto_339075 - BLOCK
      ?auto_339076 - BLOCK
      ?auto_339077 - BLOCK
      ?auto_339078 - BLOCK
      ?auto_339079 - BLOCK
    )
    :vars
    (
      ?auto_339080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339079 ?auto_339080 ) ( ON-TABLE ?auto_339066 ) ( not ( = ?auto_339066 ?auto_339067 ) ) ( not ( = ?auto_339066 ?auto_339068 ) ) ( not ( = ?auto_339066 ?auto_339069 ) ) ( not ( = ?auto_339066 ?auto_339070 ) ) ( not ( = ?auto_339066 ?auto_339071 ) ) ( not ( = ?auto_339066 ?auto_339072 ) ) ( not ( = ?auto_339066 ?auto_339073 ) ) ( not ( = ?auto_339066 ?auto_339074 ) ) ( not ( = ?auto_339066 ?auto_339075 ) ) ( not ( = ?auto_339066 ?auto_339076 ) ) ( not ( = ?auto_339066 ?auto_339077 ) ) ( not ( = ?auto_339066 ?auto_339078 ) ) ( not ( = ?auto_339066 ?auto_339079 ) ) ( not ( = ?auto_339066 ?auto_339080 ) ) ( not ( = ?auto_339067 ?auto_339068 ) ) ( not ( = ?auto_339067 ?auto_339069 ) ) ( not ( = ?auto_339067 ?auto_339070 ) ) ( not ( = ?auto_339067 ?auto_339071 ) ) ( not ( = ?auto_339067 ?auto_339072 ) ) ( not ( = ?auto_339067 ?auto_339073 ) ) ( not ( = ?auto_339067 ?auto_339074 ) ) ( not ( = ?auto_339067 ?auto_339075 ) ) ( not ( = ?auto_339067 ?auto_339076 ) ) ( not ( = ?auto_339067 ?auto_339077 ) ) ( not ( = ?auto_339067 ?auto_339078 ) ) ( not ( = ?auto_339067 ?auto_339079 ) ) ( not ( = ?auto_339067 ?auto_339080 ) ) ( not ( = ?auto_339068 ?auto_339069 ) ) ( not ( = ?auto_339068 ?auto_339070 ) ) ( not ( = ?auto_339068 ?auto_339071 ) ) ( not ( = ?auto_339068 ?auto_339072 ) ) ( not ( = ?auto_339068 ?auto_339073 ) ) ( not ( = ?auto_339068 ?auto_339074 ) ) ( not ( = ?auto_339068 ?auto_339075 ) ) ( not ( = ?auto_339068 ?auto_339076 ) ) ( not ( = ?auto_339068 ?auto_339077 ) ) ( not ( = ?auto_339068 ?auto_339078 ) ) ( not ( = ?auto_339068 ?auto_339079 ) ) ( not ( = ?auto_339068 ?auto_339080 ) ) ( not ( = ?auto_339069 ?auto_339070 ) ) ( not ( = ?auto_339069 ?auto_339071 ) ) ( not ( = ?auto_339069 ?auto_339072 ) ) ( not ( = ?auto_339069 ?auto_339073 ) ) ( not ( = ?auto_339069 ?auto_339074 ) ) ( not ( = ?auto_339069 ?auto_339075 ) ) ( not ( = ?auto_339069 ?auto_339076 ) ) ( not ( = ?auto_339069 ?auto_339077 ) ) ( not ( = ?auto_339069 ?auto_339078 ) ) ( not ( = ?auto_339069 ?auto_339079 ) ) ( not ( = ?auto_339069 ?auto_339080 ) ) ( not ( = ?auto_339070 ?auto_339071 ) ) ( not ( = ?auto_339070 ?auto_339072 ) ) ( not ( = ?auto_339070 ?auto_339073 ) ) ( not ( = ?auto_339070 ?auto_339074 ) ) ( not ( = ?auto_339070 ?auto_339075 ) ) ( not ( = ?auto_339070 ?auto_339076 ) ) ( not ( = ?auto_339070 ?auto_339077 ) ) ( not ( = ?auto_339070 ?auto_339078 ) ) ( not ( = ?auto_339070 ?auto_339079 ) ) ( not ( = ?auto_339070 ?auto_339080 ) ) ( not ( = ?auto_339071 ?auto_339072 ) ) ( not ( = ?auto_339071 ?auto_339073 ) ) ( not ( = ?auto_339071 ?auto_339074 ) ) ( not ( = ?auto_339071 ?auto_339075 ) ) ( not ( = ?auto_339071 ?auto_339076 ) ) ( not ( = ?auto_339071 ?auto_339077 ) ) ( not ( = ?auto_339071 ?auto_339078 ) ) ( not ( = ?auto_339071 ?auto_339079 ) ) ( not ( = ?auto_339071 ?auto_339080 ) ) ( not ( = ?auto_339072 ?auto_339073 ) ) ( not ( = ?auto_339072 ?auto_339074 ) ) ( not ( = ?auto_339072 ?auto_339075 ) ) ( not ( = ?auto_339072 ?auto_339076 ) ) ( not ( = ?auto_339072 ?auto_339077 ) ) ( not ( = ?auto_339072 ?auto_339078 ) ) ( not ( = ?auto_339072 ?auto_339079 ) ) ( not ( = ?auto_339072 ?auto_339080 ) ) ( not ( = ?auto_339073 ?auto_339074 ) ) ( not ( = ?auto_339073 ?auto_339075 ) ) ( not ( = ?auto_339073 ?auto_339076 ) ) ( not ( = ?auto_339073 ?auto_339077 ) ) ( not ( = ?auto_339073 ?auto_339078 ) ) ( not ( = ?auto_339073 ?auto_339079 ) ) ( not ( = ?auto_339073 ?auto_339080 ) ) ( not ( = ?auto_339074 ?auto_339075 ) ) ( not ( = ?auto_339074 ?auto_339076 ) ) ( not ( = ?auto_339074 ?auto_339077 ) ) ( not ( = ?auto_339074 ?auto_339078 ) ) ( not ( = ?auto_339074 ?auto_339079 ) ) ( not ( = ?auto_339074 ?auto_339080 ) ) ( not ( = ?auto_339075 ?auto_339076 ) ) ( not ( = ?auto_339075 ?auto_339077 ) ) ( not ( = ?auto_339075 ?auto_339078 ) ) ( not ( = ?auto_339075 ?auto_339079 ) ) ( not ( = ?auto_339075 ?auto_339080 ) ) ( not ( = ?auto_339076 ?auto_339077 ) ) ( not ( = ?auto_339076 ?auto_339078 ) ) ( not ( = ?auto_339076 ?auto_339079 ) ) ( not ( = ?auto_339076 ?auto_339080 ) ) ( not ( = ?auto_339077 ?auto_339078 ) ) ( not ( = ?auto_339077 ?auto_339079 ) ) ( not ( = ?auto_339077 ?auto_339080 ) ) ( not ( = ?auto_339078 ?auto_339079 ) ) ( not ( = ?auto_339078 ?auto_339080 ) ) ( not ( = ?auto_339079 ?auto_339080 ) ) ( ON ?auto_339078 ?auto_339079 ) ( ON ?auto_339077 ?auto_339078 ) ( ON ?auto_339076 ?auto_339077 ) ( ON ?auto_339075 ?auto_339076 ) ( ON ?auto_339074 ?auto_339075 ) ( ON ?auto_339073 ?auto_339074 ) ( ON ?auto_339072 ?auto_339073 ) ( ON ?auto_339071 ?auto_339072 ) ( ON ?auto_339070 ?auto_339071 ) ( ON ?auto_339069 ?auto_339070 ) ( ON ?auto_339068 ?auto_339069 ) ( CLEAR ?auto_339066 ) ( ON ?auto_339067 ?auto_339068 ) ( CLEAR ?auto_339067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_339066 ?auto_339067 )
      ( MAKE-14PILE ?auto_339066 ?auto_339067 ?auto_339068 ?auto_339069 ?auto_339070 ?auto_339071 ?auto_339072 ?auto_339073 ?auto_339074 ?auto_339075 ?auto_339076 ?auto_339077 ?auto_339078 ?auto_339079 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_339095 - BLOCK
      ?auto_339096 - BLOCK
      ?auto_339097 - BLOCK
      ?auto_339098 - BLOCK
      ?auto_339099 - BLOCK
      ?auto_339100 - BLOCK
      ?auto_339101 - BLOCK
      ?auto_339102 - BLOCK
      ?auto_339103 - BLOCK
      ?auto_339104 - BLOCK
      ?auto_339105 - BLOCK
      ?auto_339106 - BLOCK
      ?auto_339107 - BLOCK
      ?auto_339108 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_339108 ) ( ON-TABLE ?auto_339095 ) ( not ( = ?auto_339095 ?auto_339096 ) ) ( not ( = ?auto_339095 ?auto_339097 ) ) ( not ( = ?auto_339095 ?auto_339098 ) ) ( not ( = ?auto_339095 ?auto_339099 ) ) ( not ( = ?auto_339095 ?auto_339100 ) ) ( not ( = ?auto_339095 ?auto_339101 ) ) ( not ( = ?auto_339095 ?auto_339102 ) ) ( not ( = ?auto_339095 ?auto_339103 ) ) ( not ( = ?auto_339095 ?auto_339104 ) ) ( not ( = ?auto_339095 ?auto_339105 ) ) ( not ( = ?auto_339095 ?auto_339106 ) ) ( not ( = ?auto_339095 ?auto_339107 ) ) ( not ( = ?auto_339095 ?auto_339108 ) ) ( not ( = ?auto_339096 ?auto_339097 ) ) ( not ( = ?auto_339096 ?auto_339098 ) ) ( not ( = ?auto_339096 ?auto_339099 ) ) ( not ( = ?auto_339096 ?auto_339100 ) ) ( not ( = ?auto_339096 ?auto_339101 ) ) ( not ( = ?auto_339096 ?auto_339102 ) ) ( not ( = ?auto_339096 ?auto_339103 ) ) ( not ( = ?auto_339096 ?auto_339104 ) ) ( not ( = ?auto_339096 ?auto_339105 ) ) ( not ( = ?auto_339096 ?auto_339106 ) ) ( not ( = ?auto_339096 ?auto_339107 ) ) ( not ( = ?auto_339096 ?auto_339108 ) ) ( not ( = ?auto_339097 ?auto_339098 ) ) ( not ( = ?auto_339097 ?auto_339099 ) ) ( not ( = ?auto_339097 ?auto_339100 ) ) ( not ( = ?auto_339097 ?auto_339101 ) ) ( not ( = ?auto_339097 ?auto_339102 ) ) ( not ( = ?auto_339097 ?auto_339103 ) ) ( not ( = ?auto_339097 ?auto_339104 ) ) ( not ( = ?auto_339097 ?auto_339105 ) ) ( not ( = ?auto_339097 ?auto_339106 ) ) ( not ( = ?auto_339097 ?auto_339107 ) ) ( not ( = ?auto_339097 ?auto_339108 ) ) ( not ( = ?auto_339098 ?auto_339099 ) ) ( not ( = ?auto_339098 ?auto_339100 ) ) ( not ( = ?auto_339098 ?auto_339101 ) ) ( not ( = ?auto_339098 ?auto_339102 ) ) ( not ( = ?auto_339098 ?auto_339103 ) ) ( not ( = ?auto_339098 ?auto_339104 ) ) ( not ( = ?auto_339098 ?auto_339105 ) ) ( not ( = ?auto_339098 ?auto_339106 ) ) ( not ( = ?auto_339098 ?auto_339107 ) ) ( not ( = ?auto_339098 ?auto_339108 ) ) ( not ( = ?auto_339099 ?auto_339100 ) ) ( not ( = ?auto_339099 ?auto_339101 ) ) ( not ( = ?auto_339099 ?auto_339102 ) ) ( not ( = ?auto_339099 ?auto_339103 ) ) ( not ( = ?auto_339099 ?auto_339104 ) ) ( not ( = ?auto_339099 ?auto_339105 ) ) ( not ( = ?auto_339099 ?auto_339106 ) ) ( not ( = ?auto_339099 ?auto_339107 ) ) ( not ( = ?auto_339099 ?auto_339108 ) ) ( not ( = ?auto_339100 ?auto_339101 ) ) ( not ( = ?auto_339100 ?auto_339102 ) ) ( not ( = ?auto_339100 ?auto_339103 ) ) ( not ( = ?auto_339100 ?auto_339104 ) ) ( not ( = ?auto_339100 ?auto_339105 ) ) ( not ( = ?auto_339100 ?auto_339106 ) ) ( not ( = ?auto_339100 ?auto_339107 ) ) ( not ( = ?auto_339100 ?auto_339108 ) ) ( not ( = ?auto_339101 ?auto_339102 ) ) ( not ( = ?auto_339101 ?auto_339103 ) ) ( not ( = ?auto_339101 ?auto_339104 ) ) ( not ( = ?auto_339101 ?auto_339105 ) ) ( not ( = ?auto_339101 ?auto_339106 ) ) ( not ( = ?auto_339101 ?auto_339107 ) ) ( not ( = ?auto_339101 ?auto_339108 ) ) ( not ( = ?auto_339102 ?auto_339103 ) ) ( not ( = ?auto_339102 ?auto_339104 ) ) ( not ( = ?auto_339102 ?auto_339105 ) ) ( not ( = ?auto_339102 ?auto_339106 ) ) ( not ( = ?auto_339102 ?auto_339107 ) ) ( not ( = ?auto_339102 ?auto_339108 ) ) ( not ( = ?auto_339103 ?auto_339104 ) ) ( not ( = ?auto_339103 ?auto_339105 ) ) ( not ( = ?auto_339103 ?auto_339106 ) ) ( not ( = ?auto_339103 ?auto_339107 ) ) ( not ( = ?auto_339103 ?auto_339108 ) ) ( not ( = ?auto_339104 ?auto_339105 ) ) ( not ( = ?auto_339104 ?auto_339106 ) ) ( not ( = ?auto_339104 ?auto_339107 ) ) ( not ( = ?auto_339104 ?auto_339108 ) ) ( not ( = ?auto_339105 ?auto_339106 ) ) ( not ( = ?auto_339105 ?auto_339107 ) ) ( not ( = ?auto_339105 ?auto_339108 ) ) ( not ( = ?auto_339106 ?auto_339107 ) ) ( not ( = ?auto_339106 ?auto_339108 ) ) ( not ( = ?auto_339107 ?auto_339108 ) ) ( ON ?auto_339107 ?auto_339108 ) ( ON ?auto_339106 ?auto_339107 ) ( ON ?auto_339105 ?auto_339106 ) ( ON ?auto_339104 ?auto_339105 ) ( ON ?auto_339103 ?auto_339104 ) ( ON ?auto_339102 ?auto_339103 ) ( ON ?auto_339101 ?auto_339102 ) ( ON ?auto_339100 ?auto_339101 ) ( ON ?auto_339099 ?auto_339100 ) ( ON ?auto_339098 ?auto_339099 ) ( ON ?auto_339097 ?auto_339098 ) ( CLEAR ?auto_339095 ) ( ON ?auto_339096 ?auto_339097 ) ( CLEAR ?auto_339096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_339095 ?auto_339096 )
      ( MAKE-14PILE ?auto_339095 ?auto_339096 ?auto_339097 ?auto_339098 ?auto_339099 ?auto_339100 ?auto_339101 ?auto_339102 ?auto_339103 ?auto_339104 ?auto_339105 ?auto_339106 ?auto_339107 ?auto_339108 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_339123 - BLOCK
      ?auto_339124 - BLOCK
      ?auto_339125 - BLOCK
      ?auto_339126 - BLOCK
      ?auto_339127 - BLOCK
      ?auto_339128 - BLOCK
      ?auto_339129 - BLOCK
      ?auto_339130 - BLOCK
      ?auto_339131 - BLOCK
      ?auto_339132 - BLOCK
      ?auto_339133 - BLOCK
      ?auto_339134 - BLOCK
      ?auto_339135 - BLOCK
      ?auto_339136 - BLOCK
    )
    :vars
    (
      ?auto_339137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339136 ?auto_339137 ) ( not ( = ?auto_339123 ?auto_339124 ) ) ( not ( = ?auto_339123 ?auto_339125 ) ) ( not ( = ?auto_339123 ?auto_339126 ) ) ( not ( = ?auto_339123 ?auto_339127 ) ) ( not ( = ?auto_339123 ?auto_339128 ) ) ( not ( = ?auto_339123 ?auto_339129 ) ) ( not ( = ?auto_339123 ?auto_339130 ) ) ( not ( = ?auto_339123 ?auto_339131 ) ) ( not ( = ?auto_339123 ?auto_339132 ) ) ( not ( = ?auto_339123 ?auto_339133 ) ) ( not ( = ?auto_339123 ?auto_339134 ) ) ( not ( = ?auto_339123 ?auto_339135 ) ) ( not ( = ?auto_339123 ?auto_339136 ) ) ( not ( = ?auto_339123 ?auto_339137 ) ) ( not ( = ?auto_339124 ?auto_339125 ) ) ( not ( = ?auto_339124 ?auto_339126 ) ) ( not ( = ?auto_339124 ?auto_339127 ) ) ( not ( = ?auto_339124 ?auto_339128 ) ) ( not ( = ?auto_339124 ?auto_339129 ) ) ( not ( = ?auto_339124 ?auto_339130 ) ) ( not ( = ?auto_339124 ?auto_339131 ) ) ( not ( = ?auto_339124 ?auto_339132 ) ) ( not ( = ?auto_339124 ?auto_339133 ) ) ( not ( = ?auto_339124 ?auto_339134 ) ) ( not ( = ?auto_339124 ?auto_339135 ) ) ( not ( = ?auto_339124 ?auto_339136 ) ) ( not ( = ?auto_339124 ?auto_339137 ) ) ( not ( = ?auto_339125 ?auto_339126 ) ) ( not ( = ?auto_339125 ?auto_339127 ) ) ( not ( = ?auto_339125 ?auto_339128 ) ) ( not ( = ?auto_339125 ?auto_339129 ) ) ( not ( = ?auto_339125 ?auto_339130 ) ) ( not ( = ?auto_339125 ?auto_339131 ) ) ( not ( = ?auto_339125 ?auto_339132 ) ) ( not ( = ?auto_339125 ?auto_339133 ) ) ( not ( = ?auto_339125 ?auto_339134 ) ) ( not ( = ?auto_339125 ?auto_339135 ) ) ( not ( = ?auto_339125 ?auto_339136 ) ) ( not ( = ?auto_339125 ?auto_339137 ) ) ( not ( = ?auto_339126 ?auto_339127 ) ) ( not ( = ?auto_339126 ?auto_339128 ) ) ( not ( = ?auto_339126 ?auto_339129 ) ) ( not ( = ?auto_339126 ?auto_339130 ) ) ( not ( = ?auto_339126 ?auto_339131 ) ) ( not ( = ?auto_339126 ?auto_339132 ) ) ( not ( = ?auto_339126 ?auto_339133 ) ) ( not ( = ?auto_339126 ?auto_339134 ) ) ( not ( = ?auto_339126 ?auto_339135 ) ) ( not ( = ?auto_339126 ?auto_339136 ) ) ( not ( = ?auto_339126 ?auto_339137 ) ) ( not ( = ?auto_339127 ?auto_339128 ) ) ( not ( = ?auto_339127 ?auto_339129 ) ) ( not ( = ?auto_339127 ?auto_339130 ) ) ( not ( = ?auto_339127 ?auto_339131 ) ) ( not ( = ?auto_339127 ?auto_339132 ) ) ( not ( = ?auto_339127 ?auto_339133 ) ) ( not ( = ?auto_339127 ?auto_339134 ) ) ( not ( = ?auto_339127 ?auto_339135 ) ) ( not ( = ?auto_339127 ?auto_339136 ) ) ( not ( = ?auto_339127 ?auto_339137 ) ) ( not ( = ?auto_339128 ?auto_339129 ) ) ( not ( = ?auto_339128 ?auto_339130 ) ) ( not ( = ?auto_339128 ?auto_339131 ) ) ( not ( = ?auto_339128 ?auto_339132 ) ) ( not ( = ?auto_339128 ?auto_339133 ) ) ( not ( = ?auto_339128 ?auto_339134 ) ) ( not ( = ?auto_339128 ?auto_339135 ) ) ( not ( = ?auto_339128 ?auto_339136 ) ) ( not ( = ?auto_339128 ?auto_339137 ) ) ( not ( = ?auto_339129 ?auto_339130 ) ) ( not ( = ?auto_339129 ?auto_339131 ) ) ( not ( = ?auto_339129 ?auto_339132 ) ) ( not ( = ?auto_339129 ?auto_339133 ) ) ( not ( = ?auto_339129 ?auto_339134 ) ) ( not ( = ?auto_339129 ?auto_339135 ) ) ( not ( = ?auto_339129 ?auto_339136 ) ) ( not ( = ?auto_339129 ?auto_339137 ) ) ( not ( = ?auto_339130 ?auto_339131 ) ) ( not ( = ?auto_339130 ?auto_339132 ) ) ( not ( = ?auto_339130 ?auto_339133 ) ) ( not ( = ?auto_339130 ?auto_339134 ) ) ( not ( = ?auto_339130 ?auto_339135 ) ) ( not ( = ?auto_339130 ?auto_339136 ) ) ( not ( = ?auto_339130 ?auto_339137 ) ) ( not ( = ?auto_339131 ?auto_339132 ) ) ( not ( = ?auto_339131 ?auto_339133 ) ) ( not ( = ?auto_339131 ?auto_339134 ) ) ( not ( = ?auto_339131 ?auto_339135 ) ) ( not ( = ?auto_339131 ?auto_339136 ) ) ( not ( = ?auto_339131 ?auto_339137 ) ) ( not ( = ?auto_339132 ?auto_339133 ) ) ( not ( = ?auto_339132 ?auto_339134 ) ) ( not ( = ?auto_339132 ?auto_339135 ) ) ( not ( = ?auto_339132 ?auto_339136 ) ) ( not ( = ?auto_339132 ?auto_339137 ) ) ( not ( = ?auto_339133 ?auto_339134 ) ) ( not ( = ?auto_339133 ?auto_339135 ) ) ( not ( = ?auto_339133 ?auto_339136 ) ) ( not ( = ?auto_339133 ?auto_339137 ) ) ( not ( = ?auto_339134 ?auto_339135 ) ) ( not ( = ?auto_339134 ?auto_339136 ) ) ( not ( = ?auto_339134 ?auto_339137 ) ) ( not ( = ?auto_339135 ?auto_339136 ) ) ( not ( = ?auto_339135 ?auto_339137 ) ) ( not ( = ?auto_339136 ?auto_339137 ) ) ( ON ?auto_339135 ?auto_339136 ) ( ON ?auto_339134 ?auto_339135 ) ( ON ?auto_339133 ?auto_339134 ) ( ON ?auto_339132 ?auto_339133 ) ( ON ?auto_339131 ?auto_339132 ) ( ON ?auto_339130 ?auto_339131 ) ( ON ?auto_339129 ?auto_339130 ) ( ON ?auto_339128 ?auto_339129 ) ( ON ?auto_339127 ?auto_339128 ) ( ON ?auto_339126 ?auto_339127 ) ( ON ?auto_339125 ?auto_339126 ) ( ON ?auto_339124 ?auto_339125 ) ( ON ?auto_339123 ?auto_339124 ) ( CLEAR ?auto_339123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_339123 )
      ( MAKE-14PILE ?auto_339123 ?auto_339124 ?auto_339125 ?auto_339126 ?auto_339127 ?auto_339128 ?auto_339129 ?auto_339130 ?auto_339131 ?auto_339132 ?auto_339133 ?auto_339134 ?auto_339135 ?auto_339136 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_339152 - BLOCK
      ?auto_339153 - BLOCK
      ?auto_339154 - BLOCK
      ?auto_339155 - BLOCK
      ?auto_339156 - BLOCK
      ?auto_339157 - BLOCK
      ?auto_339158 - BLOCK
      ?auto_339159 - BLOCK
      ?auto_339160 - BLOCK
      ?auto_339161 - BLOCK
      ?auto_339162 - BLOCK
      ?auto_339163 - BLOCK
      ?auto_339164 - BLOCK
      ?auto_339165 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_339165 ) ( not ( = ?auto_339152 ?auto_339153 ) ) ( not ( = ?auto_339152 ?auto_339154 ) ) ( not ( = ?auto_339152 ?auto_339155 ) ) ( not ( = ?auto_339152 ?auto_339156 ) ) ( not ( = ?auto_339152 ?auto_339157 ) ) ( not ( = ?auto_339152 ?auto_339158 ) ) ( not ( = ?auto_339152 ?auto_339159 ) ) ( not ( = ?auto_339152 ?auto_339160 ) ) ( not ( = ?auto_339152 ?auto_339161 ) ) ( not ( = ?auto_339152 ?auto_339162 ) ) ( not ( = ?auto_339152 ?auto_339163 ) ) ( not ( = ?auto_339152 ?auto_339164 ) ) ( not ( = ?auto_339152 ?auto_339165 ) ) ( not ( = ?auto_339153 ?auto_339154 ) ) ( not ( = ?auto_339153 ?auto_339155 ) ) ( not ( = ?auto_339153 ?auto_339156 ) ) ( not ( = ?auto_339153 ?auto_339157 ) ) ( not ( = ?auto_339153 ?auto_339158 ) ) ( not ( = ?auto_339153 ?auto_339159 ) ) ( not ( = ?auto_339153 ?auto_339160 ) ) ( not ( = ?auto_339153 ?auto_339161 ) ) ( not ( = ?auto_339153 ?auto_339162 ) ) ( not ( = ?auto_339153 ?auto_339163 ) ) ( not ( = ?auto_339153 ?auto_339164 ) ) ( not ( = ?auto_339153 ?auto_339165 ) ) ( not ( = ?auto_339154 ?auto_339155 ) ) ( not ( = ?auto_339154 ?auto_339156 ) ) ( not ( = ?auto_339154 ?auto_339157 ) ) ( not ( = ?auto_339154 ?auto_339158 ) ) ( not ( = ?auto_339154 ?auto_339159 ) ) ( not ( = ?auto_339154 ?auto_339160 ) ) ( not ( = ?auto_339154 ?auto_339161 ) ) ( not ( = ?auto_339154 ?auto_339162 ) ) ( not ( = ?auto_339154 ?auto_339163 ) ) ( not ( = ?auto_339154 ?auto_339164 ) ) ( not ( = ?auto_339154 ?auto_339165 ) ) ( not ( = ?auto_339155 ?auto_339156 ) ) ( not ( = ?auto_339155 ?auto_339157 ) ) ( not ( = ?auto_339155 ?auto_339158 ) ) ( not ( = ?auto_339155 ?auto_339159 ) ) ( not ( = ?auto_339155 ?auto_339160 ) ) ( not ( = ?auto_339155 ?auto_339161 ) ) ( not ( = ?auto_339155 ?auto_339162 ) ) ( not ( = ?auto_339155 ?auto_339163 ) ) ( not ( = ?auto_339155 ?auto_339164 ) ) ( not ( = ?auto_339155 ?auto_339165 ) ) ( not ( = ?auto_339156 ?auto_339157 ) ) ( not ( = ?auto_339156 ?auto_339158 ) ) ( not ( = ?auto_339156 ?auto_339159 ) ) ( not ( = ?auto_339156 ?auto_339160 ) ) ( not ( = ?auto_339156 ?auto_339161 ) ) ( not ( = ?auto_339156 ?auto_339162 ) ) ( not ( = ?auto_339156 ?auto_339163 ) ) ( not ( = ?auto_339156 ?auto_339164 ) ) ( not ( = ?auto_339156 ?auto_339165 ) ) ( not ( = ?auto_339157 ?auto_339158 ) ) ( not ( = ?auto_339157 ?auto_339159 ) ) ( not ( = ?auto_339157 ?auto_339160 ) ) ( not ( = ?auto_339157 ?auto_339161 ) ) ( not ( = ?auto_339157 ?auto_339162 ) ) ( not ( = ?auto_339157 ?auto_339163 ) ) ( not ( = ?auto_339157 ?auto_339164 ) ) ( not ( = ?auto_339157 ?auto_339165 ) ) ( not ( = ?auto_339158 ?auto_339159 ) ) ( not ( = ?auto_339158 ?auto_339160 ) ) ( not ( = ?auto_339158 ?auto_339161 ) ) ( not ( = ?auto_339158 ?auto_339162 ) ) ( not ( = ?auto_339158 ?auto_339163 ) ) ( not ( = ?auto_339158 ?auto_339164 ) ) ( not ( = ?auto_339158 ?auto_339165 ) ) ( not ( = ?auto_339159 ?auto_339160 ) ) ( not ( = ?auto_339159 ?auto_339161 ) ) ( not ( = ?auto_339159 ?auto_339162 ) ) ( not ( = ?auto_339159 ?auto_339163 ) ) ( not ( = ?auto_339159 ?auto_339164 ) ) ( not ( = ?auto_339159 ?auto_339165 ) ) ( not ( = ?auto_339160 ?auto_339161 ) ) ( not ( = ?auto_339160 ?auto_339162 ) ) ( not ( = ?auto_339160 ?auto_339163 ) ) ( not ( = ?auto_339160 ?auto_339164 ) ) ( not ( = ?auto_339160 ?auto_339165 ) ) ( not ( = ?auto_339161 ?auto_339162 ) ) ( not ( = ?auto_339161 ?auto_339163 ) ) ( not ( = ?auto_339161 ?auto_339164 ) ) ( not ( = ?auto_339161 ?auto_339165 ) ) ( not ( = ?auto_339162 ?auto_339163 ) ) ( not ( = ?auto_339162 ?auto_339164 ) ) ( not ( = ?auto_339162 ?auto_339165 ) ) ( not ( = ?auto_339163 ?auto_339164 ) ) ( not ( = ?auto_339163 ?auto_339165 ) ) ( not ( = ?auto_339164 ?auto_339165 ) ) ( ON ?auto_339164 ?auto_339165 ) ( ON ?auto_339163 ?auto_339164 ) ( ON ?auto_339162 ?auto_339163 ) ( ON ?auto_339161 ?auto_339162 ) ( ON ?auto_339160 ?auto_339161 ) ( ON ?auto_339159 ?auto_339160 ) ( ON ?auto_339158 ?auto_339159 ) ( ON ?auto_339157 ?auto_339158 ) ( ON ?auto_339156 ?auto_339157 ) ( ON ?auto_339155 ?auto_339156 ) ( ON ?auto_339154 ?auto_339155 ) ( ON ?auto_339153 ?auto_339154 ) ( ON ?auto_339152 ?auto_339153 ) ( CLEAR ?auto_339152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_339152 )
      ( MAKE-14PILE ?auto_339152 ?auto_339153 ?auto_339154 ?auto_339155 ?auto_339156 ?auto_339157 ?auto_339158 ?auto_339159 ?auto_339160 ?auto_339161 ?auto_339162 ?auto_339163 ?auto_339164 ?auto_339165 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_339180 - BLOCK
      ?auto_339181 - BLOCK
      ?auto_339182 - BLOCK
      ?auto_339183 - BLOCK
      ?auto_339184 - BLOCK
      ?auto_339185 - BLOCK
      ?auto_339186 - BLOCK
      ?auto_339187 - BLOCK
      ?auto_339188 - BLOCK
      ?auto_339189 - BLOCK
      ?auto_339190 - BLOCK
      ?auto_339191 - BLOCK
      ?auto_339192 - BLOCK
      ?auto_339193 - BLOCK
    )
    :vars
    (
      ?auto_339194 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_339180 ?auto_339181 ) ) ( not ( = ?auto_339180 ?auto_339182 ) ) ( not ( = ?auto_339180 ?auto_339183 ) ) ( not ( = ?auto_339180 ?auto_339184 ) ) ( not ( = ?auto_339180 ?auto_339185 ) ) ( not ( = ?auto_339180 ?auto_339186 ) ) ( not ( = ?auto_339180 ?auto_339187 ) ) ( not ( = ?auto_339180 ?auto_339188 ) ) ( not ( = ?auto_339180 ?auto_339189 ) ) ( not ( = ?auto_339180 ?auto_339190 ) ) ( not ( = ?auto_339180 ?auto_339191 ) ) ( not ( = ?auto_339180 ?auto_339192 ) ) ( not ( = ?auto_339180 ?auto_339193 ) ) ( not ( = ?auto_339181 ?auto_339182 ) ) ( not ( = ?auto_339181 ?auto_339183 ) ) ( not ( = ?auto_339181 ?auto_339184 ) ) ( not ( = ?auto_339181 ?auto_339185 ) ) ( not ( = ?auto_339181 ?auto_339186 ) ) ( not ( = ?auto_339181 ?auto_339187 ) ) ( not ( = ?auto_339181 ?auto_339188 ) ) ( not ( = ?auto_339181 ?auto_339189 ) ) ( not ( = ?auto_339181 ?auto_339190 ) ) ( not ( = ?auto_339181 ?auto_339191 ) ) ( not ( = ?auto_339181 ?auto_339192 ) ) ( not ( = ?auto_339181 ?auto_339193 ) ) ( not ( = ?auto_339182 ?auto_339183 ) ) ( not ( = ?auto_339182 ?auto_339184 ) ) ( not ( = ?auto_339182 ?auto_339185 ) ) ( not ( = ?auto_339182 ?auto_339186 ) ) ( not ( = ?auto_339182 ?auto_339187 ) ) ( not ( = ?auto_339182 ?auto_339188 ) ) ( not ( = ?auto_339182 ?auto_339189 ) ) ( not ( = ?auto_339182 ?auto_339190 ) ) ( not ( = ?auto_339182 ?auto_339191 ) ) ( not ( = ?auto_339182 ?auto_339192 ) ) ( not ( = ?auto_339182 ?auto_339193 ) ) ( not ( = ?auto_339183 ?auto_339184 ) ) ( not ( = ?auto_339183 ?auto_339185 ) ) ( not ( = ?auto_339183 ?auto_339186 ) ) ( not ( = ?auto_339183 ?auto_339187 ) ) ( not ( = ?auto_339183 ?auto_339188 ) ) ( not ( = ?auto_339183 ?auto_339189 ) ) ( not ( = ?auto_339183 ?auto_339190 ) ) ( not ( = ?auto_339183 ?auto_339191 ) ) ( not ( = ?auto_339183 ?auto_339192 ) ) ( not ( = ?auto_339183 ?auto_339193 ) ) ( not ( = ?auto_339184 ?auto_339185 ) ) ( not ( = ?auto_339184 ?auto_339186 ) ) ( not ( = ?auto_339184 ?auto_339187 ) ) ( not ( = ?auto_339184 ?auto_339188 ) ) ( not ( = ?auto_339184 ?auto_339189 ) ) ( not ( = ?auto_339184 ?auto_339190 ) ) ( not ( = ?auto_339184 ?auto_339191 ) ) ( not ( = ?auto_339184 ?auto_339192 ) ) ( not ( = ?auto_339184 ?auto_339193 ) ) ( not ( = ?auto_339185 ?auto_339186 ) ) ( not ( = ?auto_339185 ?auto_339187 ) ) ( not ( = ?auto_339185 ?auto_339188 ) ) ( not ( = ?auto_339185 ?auto_339189 ) ) ( not ( = ?auto_339185 ?auto_339190 ) ) ( not ( = ?auto_339185 ?auto_339191 ) ) ( not ( = ?auto_339185 ?auto_339192 ) ) ( not ( = ?auto_339185 ?auto_339193 ) ) ( not ( = ?auto_339186 ?auto_339187 ) ) ( not ( = ?auto_339186 ?auto_339188 ) ) ( not ( = ?auto_339186 ?auto_339189 ) ) ( not ( = ?auto_339186 ?auto_339190 ) ) ( not ( = ?auto_339186 ?auto_339191 ) ) ( not ( = ?auto_339186 ?auto_339192 ) ) ( not ( = ?auto_339186 ?auto_339193 ) ) ( not ( = ?auto_339187 ?auto_339188 ) ) ( not ( = ?auto_339187 ?auto_339189 ) ) ( not ( = ?auto_339187 ?auto_339190 ) ) ( not ( = ?auto_339187 ?auto_339191 ) ) ( not ( = ?auto_339187 ?auto_339192 ) ) ( not ( = ?auto_339187 ?auto_339193 ) ) ( not ( = ?auto_339188 ?auto_339189 ) ) ( not ( = ?auto_339188 ?auto_339190 ) ) ( not ( = ?auto_339188 ?auto_339191 ) ) ( not ( = ?auto_339188 ?auto_339192 ) ) ( not ( = ?auto_339188 ?auto_339193 ) ) ( not ( = ?auto_339189 ?auto_339190 ) ) ( not ( = ?auto_339189 ?auto_339191 ) ) ( not ( = ?auto_339189 ?auto_339192 ) ) ( not ( = ?auto_339189 ?auto_339193 ) ) ( not ( = ?auto_339190 ?auto_339191 ) ) ( not ( = ?auto_339190 ?auto_339192 ) ) ( not ( = ?auto_339190 ?auto_339193 ) ) ( not ( = ?auto_339191 ?auto_339192 ) ) ( not ( = ?auto_339191 ?auto_339193 ) ) ( not ( = ?auto_339192 ?auto_339193 ) ) ( ON ?auto_339180 ?auto_339194 ) ( not ( = ?auto_339193 ?auto_339194 ) ) ( not ( = ?auto_339192 ?auto_339194 ) ) ( not ( = ?auto_339191 ?auto_339194 ) ) ( not ( = ?auto_339190 ?auto_339194 ) ) ( not ( = ?auto_339189 ?auto_339194 ) ) ( not ( = ?auto_339188 ?auto_339194 ) ) ( not ( = ?auto_339187 ?auto_339194 ) ) ( not ( = ?auto_339186 ?auto_339194 ) ) ( not ( = ?auto_339185 ?auto_339194 ) ) ( not ( = ?auto_339184 ?auto_339194 ) ) ( not ( = ?auto_339183 ?auto_339194 ) ) ( not ( = ?auto_339182 ?auto_339194 ) ) ( not ( = ?auto_339181 ?auto_339194 ) ) ( not ( = ?auto_339180 ?auto_339194 ) ) ( ON ?auto_339181 ?auto_339180 ) ( ON ?auto_339182 ?auto_339181 ) ( ON ?auto_339183 ?auto_339182 ) ( ON ?auto_339184 ?auto_339183 ) ( ON ?auto_339185 ?auto_339184 ) ( ON ?auto_339186 ?auto_339185 ) ( ON ?auto_339187 ?auto_339186 ) ( ON ?auto_339188 ?auto_339187 ) ( ON ?auto_339189 ?auto_339188 ) ( ON ?auto_339190 ?auto_339189 ) ( ON ?auto_339191 ?auto_339190 ) ( ON ?auto_339192 ?auto_339191 ) ( ON ?auto_339193 ?auto_339192 ) ( CLEAR ?auto_339193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_339193 ?auto_339192 ?auto_339191 ?auto_339190 ?auto_339189 ?auto_339188 ?auto_339187 ?auto_339186 ?auto_339185 ?auto_339184 ?auto_339183 ?auto_339182 ?auto_339181 ?auto_339180 )
      ( MAKE-14PILE ?auto_339180 ?auto_339181 ?auto_339182 ?auto_339183 ?auto_339184 ?auto_339185 ?auto_339186 ?auto_339187 ?auto_339188 ?auto_339189 ?auto_339190 ?auto_339191 ?auto_339192 ?auto_339193 ) )
  )

)

