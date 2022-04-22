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
      ?auto_199943 - BLOCK
    )
    :vars
    (
      ?auto_199944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199943 ?auto_199944 ) ( CLEAR ?auto_199943 ) ( HAND-EMPTY ) ( not ( = ?auto_199943 ?auto_199944 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_199943 ?auto_199944 )
      ( !PUTDOWN ?auto_199943 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_199950 - BLOCK
      ?auto_199951 - BLOCK
    )
    :vars
    (
      ?auto_199952 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_199950 ) ( ON ?auto_199951 ?auto_199952 ) ( CLEAR ?auto_199951 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_199950 ) ( not ( = ?auto_199950 ?auto_199951 ) ) ( not ( = ?auto_199950 ?auto_199952 ) ) ( not ( = ?auto_199951 ?auto_199952 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_199951 ?auto_199952 )
      ( !STACK ?auto_199951 ?auto_199950 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_199960 - BLOCK
      ?auto_199961 - BLOCK
    )
    :vars
    (
      ?auto_199962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199961 ?auto_199962 ) ( not ( = ?auto_199960 ?auto_199961 ) ) ( not ( = ?auto_199960 ?auto_199962 ) ) ( not ( = ?auto_199961 ?auto_199962 ) ) ( ON ?auto_199960 ?auto_199961 ) ( CLEAR ?auto_199960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_199960 )
      ( MAKE-2PILE ?auto_199960 ?auto_199961 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_199971 - BLOCK
      ?auto_199972 - BLOCK
      ?auto_199973 - BLOCK
    )
    :vars
    (
      ?auto_199974 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_199972 ) ( ON ?auto_199973 ?auto_199974 ) ( CLEAR ?auto_199973 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_199971 ) ( ON ?auto_199972 ?auto_199971 ) ( not ( = ?auto_199971 ?auto_199972 ) ) ( not ( = ?auto_199971 ?auto_199973 ) ) ( not ( = ?auto_199971 ?auto_199974 ) ) ( not ( = ?auto_199972 ?auto_199973 ) ) ( not ( = ?auto_199972 ?auto_199974 ) ) ( not ( = ?auto_199973 ?auto_199974 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_199973 ?auto_199974 )
      ( !STACK ?auto_199973 ?auto_199972 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_199985 - BLOCK
      ?auto_199986 - BLOCK
      ?auto_199987 - BLOCK
    )
    :vars
    (
      ?auto_199988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199987 ?auto_199988 ) ( ON-TABLE ?auto_199985 ) ( not ( = ?auto_199985 ?auto_199986 ) ) ( not ( = ?auto_199985 ?auto_199987 ) ) ( not ( = ?auto_199985 ?auto_199988 ) ) ( not ( = ?auto_199986 ?auto_199987 ) ) ( not ( = ?auto_199986 ?auto_199988 ) ) ( not ( = ?auto_199987 ?auto_199988 ) ) ( CLEAR ?auto_199985 ) ( ON ?auto_199986 ?auto_199987 ) ( CLEAR ?auto_199986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_199985 ?auto_199986 )
      ( MAKE-3PILE ?auto_199985 ?auto_199986 ?auto_199987 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_199999 - BLOCK
      ?auto_200000 - BLOCK
      ?auto_200001 - BLOCK
    )
    :vars
    (
      ?auto_200002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200001 ?auto_200002 ) ( not ( = ?auto_199999 ?auto_200000 ) ) ( not ( = ?auto_199999 ?auto_200001 ) ) ( not ( = ?auto_199999 ?auto_200002 ) ) ( not ( = ?auto_200000 ?auto_200001 ) ) ( not ( = ?auto_200000 ?auto_200002 ) ) ( not ( = ?auto_200001 ?auto_200002 ) ) ( ON ?auto_200000 ?auto_200001 ) ( ON ?auto_199999 ?auto_200000 ) ( CLEAR ?auto_199999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_199999 )
      ( MAKE-3PILE ?auto_199999 ?auto_200000 ?auto_200001 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_200014 - BLOCK
      ?auto_200015 - BLOCK
      ?auto_200016 - BLOCK
      ?auto_200017 - BLOCK
    )
    :vars
    (
      ?auto_200018 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_200016 ) ( ON ?auto_200017 ?auto_200018 ) ( CLEAR ?auto_200017 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_200014 ) ( ON ?auto_200015 ?auto_200014 ) ( ON ?auto_200016 ?auto_200015 ) ( not ( = ?auto_200014 ?auto_200015 ) ) ( not ( = ?auto_200014 ?auto_200016 ) ) ( not ( = ?auto_200014 ?auto_200017 ) ) ( not ( = ?auto_200014 ?auto_200018 ) ) ( not ( = ?auto_200015 ?auto_200016 ) ) ( not ( = ?auto_200015 ?auto_200017 ) ) ( not ( = ?auto_200015 ?auto_200018 ) ) ( not ( = ?auto_200016 ?auto_200017 ) ) ( not ( = ?auto_200016 ?auto_200018 ) ) ( not ( = ?auto_200017 ?auto_200018 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_200017 ?auto_200018 )
      ( !STACK ?auto_200017 ?auto_200016 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_200032 - BLOCK
      ?auto_200033 - BLOCK
      ?auto_200034 - BLOCK
      ?auto_200035 - BLOCK
    )
    :vars
    (
      ?auto_200036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200035 ?auto_200036 ) ( ON-TABLE ?auto_200032 ) ( ON ?auto_200033 ?auto_200032 ) ( not ( = ?auto_200032 ?auto_200033 ) ) ( not ( = ?auto_200032 ?auto_200034 ) ) ( not ( = ?auto_200032 ?auto_200035 ) ) ( not ( = ?auto_200032 ?auto_200036 ) ) ( not ( = ?auto_200033 ?auto_200034 ) ) ( not ( = ?auto_200033 ?auto_200035 ) ) ( not ( = ?auto_200033 ?auto_200036 ) ) ( not ( = ?auto_200034 ?auto_200035 ) ) ( not ( = ?auto_200034 ?auto_200036 ) ) ( not ( = ?auto_200035 ?auto_200036 ) ) ( CLEAR ?auto_200033 ) ( ON ?auto_200034 ?auto_200035 ) ( CLEAR ?auto_200034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_200032 ?auto_200033 ?auto_200034 )
      ( MAKE-4PILE ?auto_200032 ?auto_200033 ?auto_200034 ?auto_200035 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_200050 - BLOCK
      ?auto_200051 - BLOCK
      ?auto_200052 - BLOCK
      ?auto_200053 - BLOCK
    )
    :vars
    (
      ?auto_200054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200053 ?auto_200054 ) ( ON-TABLE ?auto_200050 ) ( not ( = ?auto_200050 ?auto_200051 ) ) ( not ( = ?auto_200050 ?auto_200052 ) ) ( not ( = ?auto_200050 ?auto_200053 ) ) ( not ( = ?auto_200050 ?auto_200054 ) ) ( not ( = ?auto_200051 ?auto_200052 ) ) ( not ( = ?auto_200051 ?auto_200053 ) ) ( not ( = ?auto_200051 ?auto_200054 ) ) ( not ( = ?auto_200052 ?auto_200053 ) ) ( not ( = ?auto_200052 ?auto_200054 ) ) ( not ( = ?auto_200053 ?auto_200054 ) ) ( ON ?auto_200052 ?auto_200053 ) ( CLEAR ?auto_200050 ) ( ON ?auto_200051 ?auto_200052 ) ( CLEAR ?auto_200051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_200050 ?auto_200051 )
      ( MAKE-4PILE ?auto_200050 ?auto_200051 ?auto_200052 ?auto_200053 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_200068 - BLOCK
      ?auto_200069 - BLOCK
      ?auto_200070 - BLOCK
      ?auto_200071 - BLOCK
    )
    :vars
    (
      ?auto_200072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200071 ?auto_200072 ) ( not ( = ?auto_200068 ?auto_200069 ) ) ( not ( = ?auto_200068 ?auto_200070 ) ) ( not ( = ?auto_200068 ?auto_200071 ) ) ( not ( = ?auto_200068 ?auto_200072 ) ) ( not ( = ?auto_200069 ?auto_200070 ) ) ( not ( = ?auto_200069 ?auto_200071 ) ) ( not ( = ?auto_200069 ?auto_200072 ) ) ( not ( = ?auto_200070 ?auto_200071 ) ) ( not ( = ?auto_200070 ?auto_200072 ) ) ( not ( = ?auto_200071 ?auto_200072 ) ) ( ON ?auto_200070 ?auto_200071 ) ( ON ?auto_200069 ?auto_200070 ) ( ON ?auto_200068 ?auto_200069 ) ( CLEAR ?auto_200068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_200068 )
      ( MAKE-4PILE ?auto_200068 ?auto_200069 ?auto_200070 ?auto_200071 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_200087 - BLOCK
      ?auto_200088 - BLOCK
      ?auto_200089 - BLOCK
      ?auto_200090 - BLOCK
      ?auto_200091 - BLOCK
    )
    :vars
    (
      ?auto_200092 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_200090 ) ( ON ?auto_200091 ?auto_200092 ) ( CLEAR ?auto_200091 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_200087 ) ( ON ?auto_200088 ?auto_200087 ) ( ON ?auto_200089 ?auto_200088 ) ( ON ?auto_200090 ?auto_200089 ) ( not ( = ?auto_200087 ?auto_200088 ) ) ( not ( = ?auto_200087 ?auto_200089 ) ) ( not ( = ?auto_200087 ?auto_200090 ) ) ( not ( = ?auto_200087 ?auto_200091 ) ) ( not ( = ?auto_200087 ?auto_200092 ) ) ( not ( = ?auto_200088 ?auto_200089 ) ) ( not ( = ?auto_200088 ?auto_200090 ) ) ( not ( = ?auto_200088 ?auto_200091 ) ) ( not ( = ?auto_200088 ?auto_200092 ) ) ( not ( = ?auto_200089 ?auto_200090 ) ) ( not ( = ?auto_200089 ?auto_200091 ) ) ( not ( = ?auto_200089 ?auto_200092 ) ) ( not ( = ?auto_200090 ?auto_200091 ) ) ( not ( = ?auto_200090 ?auto_200092 ) ) ( not ( = ?auto_200091 ?auto_200092 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_200091 ?auto_200092 )
      ( !STACK ?auto_200091 ?auto_200090 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_200109 - BLOCK
      ?auto_200110 - BLOCK
      ?auto_200111 - BLOCK
      ?auto_200112 - BLOCK
      ?auto_200113 - BLOCK
    )
    :vars
    (
      ?auto_200114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200113 ?auto_200114 ) ( ON-TABLE ?auto_200109 ) ( ON ?auto_200110 ?auto_200109 ) ( ON ?auto_200111 ?auto_200110 ) ( not ( = ?auto_200109 ?auto_200110 ) ) ( not ( = ?auto_200109 ?auto_200111 ) ) ( not ( = ?auto_200109 ?auto_200112 ) ) ( not ( = ?auto_200109 ?auto_200113 ) ) ( not ( = ?auto_200109 ?auto_200114 ) ) ( not ( = ?auto_200110 ?auto_200111 ) ) ( not ( = ?auto_200110 ?auto_200112 ) ) ( not ( = ?auto_200110 ?auto_200113 ) ) ( not ( = ?auto_200110 ?auto_200114 ) ) ( not ( = ?auto_200111 ?auto_200112 ) ) ( not ( = ?auto_200111 ?auto_200113 ) ) ( not ( = ?auto_200111 ?auto_200114 ) ) ( not ( = ?auto_200112 ?auto_200113 ) ) ( not ( = ?auto_200112 ?auto_200114 ) ) ( not ( = ?auto_200113 ?auto_200114 ) ) ( CLEAR ?auto_200111 ) ( ON ?auto_200112 ?auto_200113 ) ( CLEAR ?auto_200112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_200109 ?auto_200110 ?auto_200111 ?auto_200112 )
      ( MAKE-5PILE ?auto_200109 ?auto_200110 ?auto_200111 ?auto_200112 ?auto_200113 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_200131 - BLOCK
      ?auto_200132 - BLOCK
      ?auto_200133 - BLOCK
      ?auto_200134 - BLOCK
      ?auto_200135 - BLOCK
    )
    :vars
    (
      ?auto_200136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200135 ?auto_200136 ) ( ON-TABLE ?auto_200131 ) ( ON ?auto_200132 ?auto_200131 ) ( not ( = ?auto_200131 ?auto_200132 ) ) ( not ( = ?auto_200131 ?auto_200133 ) ) ( not ( = ?auto_200131 ?auto_200134 ) ) ( not ( = ?auto_200131 ?auto_200135 ) ) ( not ( = ?auto_200131 ?auto_200136 ) ) ( not ( = ?auto_200132 ?auto_200133 ) ) ( not ( = ?auto_200132 ?auto_200134 ) ) ( not ( = ?auto_200132 ?auto_200135 ) ) ( not ( = ?auto_200132 ?auto_200136 ) ) ( not ( = ?auto_200133 ?auto_200134 ) ) ( not ( = ?auto_200133 ?auto_200135 ) ) ( not ( = ?auto_200133 ?auto_200136 ) ) ( not ( = ?auto_200134 ?auto_200135 ) ) ( not ( = ?auto_200134 ?auto_200136 ) ) ( not ( = ?auto_200135 ?auto_200136 ) ) ( ON ?auto_200134 ?auto_200135 ) ( CLEAR ?auto_200132 ) ( ON ?auto_200133 ?auto_200134 ) ( CLEAR ?auto_200133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_200131 ?auto_200132 ?auto_200133 )
      ( MAKE-5PILE ?auto_200131 ?auto_200132 ?auto_200133 ?auto_200134 ?auto_200135 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_200153 - BLOCK
      ?auto_200154 - BLOCK
      ?auto_200155 - BLOCK
      ?auto_200156 - BLOCK
      ?auto_200157 - BLOCK
    )
    :vars
    (
      ?auto_200158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200157 ?auto_200158 ) ( ON-TABLE ?auto_200153 ) ( not ( = ?auto_200153 ?auto_200154 ) ) ( not ( = ?auto_200153 ?auto_200155 ) ) ( not ( = ?auto_200153 ?auto_200156 ) ) ( not ( = ?auto_200153 ?auto_200157 ) ) ( not ( = ?auto_200153 ?auto_200158 ) ) ( not ( = ?auto_200154 ?auto_200155 ) ) ( not ( = ?auto_200154 ?auto_200156 ) ) ( not ( = ?auto_200154 ?auto_200157 ) ) ( not ( = ?auto_200154 ?auto_200158 ) ) ( not ( = ?auto_200155 ?auto_200156 ) ) ( not ( = ?auto_200155 ?auto_200157 ) ) ( not ( = ?auto_200155 ?auto_200158 ) ) ( not ( = ?auto_200156 ?auto_200157 ) ) ( not ( = ?auto_200156 ?auto_200158 ) ) ( not ( = ?auto_200157 ?auto_200158 ) ) ( ON ?auto_200156 ?auto_200157 ) ( ON ?auto_200155 ?auto_200156 ) ( CLEAR ?auto_200153 ) ( ON ?auto_200154 ?auto_200155 ) ( CLEAR ?auto_200154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_200153 ?auto_200154 )
      ( MAKE-5PILE ?auto_200153 ?auto_200154 ?auto_200155 ?auto_200156 ?auto_200157 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_200175 - BLOCK
      ?auto_200176 - BLOCK
      ?auto_200177 - BLOCK
      ?auto_200178 - BLOCK
      ?auto_200179 - BLOCK
    )
    :vars
    (
      ?auto_200180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200179 ?auto_200180 ) ( not ( = ?auto_200175 ?auto_200176 ) ) ( not ( = ?auto_200175 ?auto_200177 ) ) ( not ( = ?auto_200175 ?auto_200178 ) ) ( not ( = ?auto_200175 ?auto_200179 ) ) ( not ( = ?auto_200175 ?auto_200180 ) ) ( not ( = ?auto_200176 ?auto_200177 ) ) ( not ( = ?auto_200176 ?auto_200178 ) ) ( not ( = ?auto_200176 ?auto_200179 ) ) ( not ( = ?auto_200176 ?auto_200180 ) ) ( not ( = ?auto_200177 ?auto_200178 ) ) ( not ( = ?auto_200177 ?auto_200179 ) ) ( not ( = ?auto_200177 ?auto_200180 ) ) ( not ( = ?auto_200178 ?auto_200179 ) ) ( not ( = ?auto_200178 ?auto_200180 ) ) ( not ( = ?auto_200179 ?auto_200180 ) ) ( ON ?auto_200178 ?auto_200179 ) ( ON ?auto_200177 ?auto_200178 ) ( ON ?auto_200176 ?auto_200177 ) ( ON ?auto_200175 ?auto_200176 ) ( CLEAR ?auto_200175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_200175 )
      ( MAKE-5PILE ?auto_200175 ?auto_200176 ?auto_200177 ?auto_200178 ?auto_200179 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_200198 - BLOCK
      ?auto_200199 - BLOCK
      ?auto_200200 - BLOCK
      ?auto_200201 - BLOCK
      ?auto_200202 - BLOCK
      ?auto_200203 - BLOCK
    )
    :vars
    (
      ?auto_200204 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_200202 ) ( ON ?auto_200203 ?auto_200204 ) ( CLEAR ?auto_200203 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_200198 ) ( ON ?auto_200199 ?auto_200198 ) ( ON ?auto_200200 ?auto_200199 ) ( ON ?auto_200201 ?auto_200200 ) ( ON ?auto_200202 ?auto_200201 ) ( not ( = ?auto_200198 ?auto_200199 ) ) ( not ( = ?auto_200198 ?auto_200200 ) ) ( not ( = ?auto_200198 ?auto_200201 ) ) ( not ( = ?auto_200198 ?auto_200202 ) ) ( not ( = ?auto_200198 ?auto_200203 ) ) ( not ( = ?auto_200198 ?auto_200204 ) ) ( not ( = ?auto_200199 ?auto_200200 ) ) ( not ( = ?auto_200199 ?auto_200201 ) ) ( not ( = ?auto_200199 ?auto_200202 ) ) ( not ( = ?auto_200199 ?auto_200203 ) ) ( not ( = ?auto_200199 ?auto_200204 ) ) ( not ( = ?auto_200200 ?auto_200201 ) ) ( not ( = ?auto_200200 ?auto_200202 ) ) ( not ( = ?auto_200200 ?auto_200203 ) ) ( not ( = ?auto_200200 ?auto_200204 ) ) ( not ( = ?auto_200201 ?auto_200202 ) ) ( not ( = ?auto_200201 ?auto_200203 ) ) ( not ( = ?auto_200201 ?auto_200204 ) ) ( not ( = ?auto_200202 ?auto_200203 ) ) ( not ( = ?auto_200202 ?auto_200204 ) ) ( not ( = ?auto_200203 ?auto_200204 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_200203 ?auto_200204 )
      ( !STACK ?auto_200203 ?auto_200202 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_200224 - BLOCK
      ?auto_200225 - BLOCK
      ?auto_200226 - BLOCK
      ?auto_200227 - BLOCK
      ?auto_200228 - BLOCK
      ?auto_200229 - BLOCK
    )
    :vars
    (
      ?auto_200230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200229 ?auto_200230 ) ( ON-TABLE ?auto_200224 ) ( ON ?auto_200225 ?auto_200224 ) ( ON ?auto_200226 ?auto_200225 ) ( ON ?auto_200227 ?auto_200226 ) ( not ( = ?auto_200224 ?auto_200225 ) ) ( not ( = ?auto_200224 ?auto_200226 ) ) ( not ( = ?auto_200224 ?auto_200227 ) ) ( not ( = ?auto_200224 ?auto_200228 ) ) ( not ( = ?auto_200224 ?auto_200229 ) ) ( not ( = ?auto_200224 ?auto_200230 ) ) ( not ( = ?auto_200225 ?auto_200226 ) ) ( not ( = ?auto_200225 ?auto_200227 ) ) ( not ( = ?auto_200225 ?auto_200228 ) ) ( not ( = ?auto_200225 ?auto_200229 ) ) ( not ( = ?auto_200225 ?auto_200230 ) ) ( not ( = ?auto_200226 ?auto_200227 ) ) ( not ( = ?auto_200226 ?auto_200228 ) ) ( not ( = ?auto_200226 ?auto_200229 ) ) ( not ( = ?auto_200226 ?auto_200230 ) ) ( not ( = ?auto_200227 ?auto_200228 ) ) ( not ( = ?auto_200227 ?auto_200229 ) ) ( not ( = ?auto_200227 ?auto_200230 ) ) ( not ( = ?auto_200228 ?auto_200229 ) ) ( not ( = ?auto_200228 ?auto_200230 ) ) ( not ( = ?auto_200229 ?auto_200230 ) ) ( CLEAR ?auto_200227 ) ( ON ?auto_200228 ?auto_200229 ) ( CLEAR ?auto_200228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_200224 ?auto_200225 ?auto_200226 ?auto_200227 ?auto_200228 )
      ( MAKE-6PILE ?auto_200224 ?auto_200225 ?auto_200226 ?auto_200227 ?auto_200228 ?auto_200229 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_200250 - BLOCK
      ?auto_200251 - BLOCK
      ?auto_200252 - BLOCK
      ?auto_200253 - BLOCK
      ?auto_200254 - BLOCK
      ?auto_200255 - BLOCK
    )
    :vars
    (
      ?auto_200256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200255 ?auto_200256 ) ( ON-TABLE ?auto_200250 ) ( ON ?auto_200251 ?auto_200250 ) ( ON ?auto_200252 ?auto_200251 ) ( not ( = ?auto_200250 ?auto_200251 ) ) ( not ( = ?auto_200250 ?auto_200252 ) ) ( not ( = ?auto_200250 ?auto_200253 ) ) ( not ( = ?auto_200250 ?auto_200254 ) ) ( not ( = ?auto_200250 ?auto_200255 ) ) ( not ( = ?auto_200250 ?auto_200256 ) ) ( not ( = ?auto_200251 ?auto_200252 ) ) ( not ( = ?auto_200251 ?auto_200253 ) ) ( not ( = ?auto_200251 ?auto_200254 ) ) ( not ( = ?auto_200251 ?auto_200255 ) ) ( not ( = ?auto_200251 ?auto_200256 ) ) ( not ( = ?auto_200252 ?auto_200253 ) ) ( not ( = ?auto_200252 ?auto_200254 ) ) ( not ( = ?auto_200252 ?auto_200255 ) ) ( not ( = ?auto_200252 ?auto_200256 ) ) ( not ( = ?auto_200253 ?auto_200254 ) ) ( not ( = ?auto_200253 ?auto_200255 ) ) ( not ( = ?auto_200253 ?auto_200256 ) ) ( not ( = ?auto_200254 ?auto_200255 ) ) ( not ( = ?auto_200254 ?auto_200256 ) ) ( not ( = ?auto_200255 ?auto_200256 ) ) ( ON ?auto_200254 ?auto_200255 ) ( CLEAR ?auto_200252 ) ( ON ?auto_200253 ?auto_200254 ) ( CLEAR ?auto_200253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_200250 ?auto_200251 ?auto_200252 ?auto_200253 )
      ( MAKE-6PILE ?auto_200250 ?auto_200251 ?auto_200252 ?auto_200253 ?auto_200254 ?auto_200255 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_200276 - BLOCK
      ?auto_200277 - BLOCK
      ?auto_200278 - BLOCK
      ?auto_200279 - BLOCK
      ?auto_200280 - BLOCK
      ?auto_200281 - BLOCK
    )
    :vars
    (
      ?auto_200282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200281 ?auto_200282 ) ( ON-TABLE ?auto_200276 ) ( ON ?auto_200277 ?auto_200276 ) ( not ( = ?auto_200276 ?auto_200277 ) ) ( not ( = ?auto_200276 ?auto_200278 ) ) ( not ( = ?auto_200276 ?auto_200279 ) ) ( not ( = ?auto_200276 ?auto_200280 ) ) ( not ( = ?auto_200276 ?auto_200281 ) ) ( not ( = ?auto_200276 ?auto_200282 ) ) ( not ( = ?auto_200277 ?auto_200278 ) ) ( not ( = ?auto_200277 ?auto_200279 ) ) ( not ( = ?auto_200277 ?auto_200280 ) ) ( not ( = ?auto_200277 ?auto_200281 ) ) ( not ( = ?auto_200277 ?auto_200282 ) ) ( not ( = ?auto_200278 ?auto_200279 ) ) ( not ( = ?auto_200278 ?auto_200280 ) ) ( not ( = ?auto_200278 ?auto_200281 ) ) ( not ( = ?auto_200278 ?auto_200282 ) ) ( not ( = ?auto_200279 ?auto_200280 ) ) ( not ( = ?auto_200279 ?auto_200281 ) ) ( not ( = ?auto_200279 ?auto_200282 ) ) ( not ( = ?auto_200280 ?auto_200281 ) ) ( not ( = ?auto_200280 ?auto_200282 ) ) ( not ( = ?auto_200281 ?auto_200282 ) ) ( ON ?auto_200280 ?auto_200281 ) ( ON ?auto_200279 ?auto_200280 ) ( CLEAR ?auto_200277 ) ( ON ?auto_200278 ?auto_200279 ) ( CLEAR ?auto_200278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_200276 ?auto_200277 ?auto_200278 )
      ( MAKE-6PILE ?auto_200276 ?auto_200277 ?auto_200278 ?auto_200279 ?auto_200280 ?auto_200281 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_200302 - BLOCK
      ?auto_200303 - BLOCK
      ?auto_200304 - BLOCK
      ?auto_200305 - BLOCK
      ?auto_200306 - BLOCK
      ?auto_200307 - BLOCK
    )
    :vars
    (
      ?auto_200308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200307 ?auto_200308 ) ( ON-TABLE ?auto_200302 ) ( not ( = ?auto_200302 ?auto_200303 ) ) ( not ( = ?auto_200302 ?auto_200304 ) ) ( not ( = ?auto_200302 ?auto_200305 ) ) ( not ( = ?auto_200302 ?auto_200306 ) ) ( not ( = ?auto_200302 ?auto_200307 ) ) ( not ( = ?auto_200302 ?auto_200308 ) ) ( not ( = ?auto_200303 ?auto_200304 ) ) ( not ( = ?auto_200303 ?auto_200305 ) ) ( not ( = ?auto_200303 ?auto_200306 ) ) ( not ( = ?auto_200303 ?auto_200307 ) ) ( not ( = ?auto_200303 ?auto_200308 ) ) ( not ( = ?auto_200304 ?auto_200305 ) ) ( not ( = ?auto_200304 ?auto_200306 ) ) ( not ( = ?auto_200304 ?auto_200307 ) ) ( not ( = ?auto_200304 ?auto_200308 ) ) ( not ( = ?auto_200305 ?auto_200306 ) ) ( not ( = ?auto_200305 ?auto_200307 ) ) ( not ( = ?auto_200305 ?auto_200308 ) ) ( not ( = ?auto_200306 ?auto_200307 ) ) ( not ( = ?auto_200306 ?auto_200308 ) ) ( not ( = ?auto_200307 ?auto_200308 ) ) ( ON ?auto_200306 ?auto_200307 ) ( ON ?auto_200305 ?auto_200306 ) ( ON ?auto_200304 ?auto_200305 ) ( CLEAR ?auto_200302 ) ( ON ?auto_200303 ?auto_200304 ) ( CLEAR ?auto_200303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_200302 ?auto_200303 )
      ( MAKE-6PILE ?auto_200302 ?auto_200303 ?auto_200304 ?auto_200305 ?auto_200306 ?auto_200307 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_200328 - BLOCK
      ?auto_200329 - BLOCK
      ?auto_200330 - BLOCK
      ?auto_200331 - BLOCK
      ?auto_200332 - BLOCK
      ?auto_200333 - BLOCK
    )
    :vars
    (
      ?auto_200334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200333 ?auto_200334 ) ( not ( = ?auto_200328 ?auto_200329 ) ) ( not ( = ?auto_200328 ?auto_200330 ) ) ( not ( = ?auto_200328 ?auto_200331 ) ) ( not ( = ?auto_200328 ?auto_200332 ) ) ( not ( = ?auto_200328 ?auto_200333 ) ) ( not ( = ?auto_200328 ?auto_200334 ) ) ( not ( = ?auto_200329 ?auto_200330 ) ) ( not ( = ?auto_200329 ?auto_200331 ) ) ( not ( = ?auto_200329 ?auto_200332 ) ) ( not ( = ?auto_200329 ?auto_200333 ) ) ( not ( = ?auto_200329 ?auto_200334 ) ) ( not ( = ?auto_200330 ?auto_200331 ) ) ( not ( = ?auto_200330 ?auto_200332 ) ) ( not ( = ?auto_200330 ?auto_200333 ) ) ( not ( = ?auto_200330 ?auto_200334 ) ) ( not ( = ?auto_200331 ?auto_200332 ) ) ( not ( = ?auto_200331 ?auto_200333 ) ) ( not ( = ?auto_200331 ?auto_200334 ) ) ( not ( = ?auto_200332 ?auto_200333 ) ) ( not ( = ?auto_200332 ?auto_200334 ) ) ( not ( = ?auto_200333 ?auto_200334 ) ) ( ON ?auto_200332 ?auto_200333 ) ( ON ?auto_200331 ?auto_200332 ) ( ON ?auto_200330 ?auto_200331 ) ( ON ?auto_200329 ?auto_200330 ) ( ON ?auto_200328 ?auto_200329 ) ( CLEAR ?auto_200328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_200328 )
      ( MAKE-6PILE ?auto_200328 ?auto_200329 ?auto_200330 ?auto_200331 ?auto_200332 ?auto_200333 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_200355 - BLOCK
      ?auto_200356 - BLOCK
      ?auto_200357 - BLOCK
      ?auto_200358 - BLOCK
      ?auto_200359 - BLOCK
      ?auto_200360 - BLOCK
      ?auto_200361 - BLOCK
    )
    :vars
    (
      ?auto_200362 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_200360 ) ( ON ?auto_200361 ?auto_200362 ) ( CLEAR ?auto_200361 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_200355 ) ( ON ?auto_200356 ?auto_200355 ) ( ON ?auto_200357 ?auto_200356 ) ( ON ?auto_200358 ?auto_200357 ) ( ON ?auto_200359 ?auto_200358 ) ( ON ?auto_200360 ?auto_200359 ) ( not ( = ?auto_200355 ?auto_200356 ) ) ( not ( = ?auto_200355 ?auto_200357 ) ) ( not ( = ?auto_200355 ?auto_200358 ) ) ( not ( = ?auto_200355 ?auto_200359 ) ) ( not ( = ?auto_200355 ?auto_200360 ) ) ( not ( = ?auto_200355 ?auto_200361 ) ) ( not ( = ?auto_200355 ?auto_200362 ) ) ( not ( = ?auto_200356 ?auto_200357 ) ) ( not ( = ?auto_200356 ?auto_200358 ) ) ( not ( = ?auto_200356 ?auto_200359 ) ) ( not ( = ?auto_200356 ?auto_200360 ) ) ( not ( = ?auto_200356 ?auto_200361 ) ) ( not ( = ?auto_200356 ?auto_200362 ) ) ( not ( = ?auto_200357 ?auto_200358 ) ) ( not ( = ?auto_200357 ?auto_200359 ) ) ( not ( = ?auto_200357 ?auto_200360 ) ) ( not ( = ?auto_200357 ?auto_200361 ) ) ( not ( = ?auto_200357 ?auto_200362 ) ) ( not ( = ?auto_200358 ?auto_200359 ) ) ( not ( = ?auto_200358 ?auto_200360 ) ) ( not ( = ?auto_200358 ?auto_200361 ) ) ( not ( = ?auto_200358 ?auto_200362 ) ) ( not ( = ?auto_200359 ?auto_200360 ) ) ( not ( = ?auto_200359 ?auto_200361 ) ) ( not ( = ?auto_200359 ?auto_200362 ) ) ( not ( = ?auto_200360 ?auto_200361 ) ) ( not ( = ?auto_200360 ?auto_200362 ) ) ( not ( = ?auto_200361 ?auto_200362 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_200361 ?auto_200362 )
      ( !STACK ?auto_200361 ?auto_200360 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_200385 - BLOCK
      ?auto_200386 - BLOCK
      ?auto_200387 - BLOCK
      ?auto_200388 - BLOCK
      ?auto_200389 - BLOCK
      ?auto_200390 - BLOCK
      ?auto_200391 - BLOCK
    )
    :vars
    (
      ?auto_200392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200391 ?auto_200392 ) ( ON-TABLE ?auto_200385 ) ( ON ?auto_200386 ?auto_200385 ) ( ON ?auto_200387 ?auto_200386 ) ( ON ?auto_200388 ?auto_200387 ) ( ON ?auto_200389 ?auto_200388 ) ( not ( = ?auto_200385 ?auto_200386 ) ) ( not ( = ?auto_200385 ?auto_200387 ) ) ( not ( = ?auto_200385 ?auto_200388 ) ) ( not ( = ?auto_200385 ?auto_200389 ) ) ( not ( = ?auto_200385 ?auto_200390 ) ) ( not ( = ?auto_200385 ?auto_200391 ) ) ( not ( = ?auto_200385 ?auto_200392 ) ) ( not ( = ?auto_200386 ?auto_200387 ) ) ( not ( = ?auto_200386 ?auto_200388 ) ) ( not ( = ?auto_200386 ?auto_200389 ) ) ( not ( = ?auto_200386 ?auto_200390 ) ) ( not ( = ?auto_200386 ?auto_200391 ) ) ( not ( = ?auto_200386 ?auto_200392 ) ) ( not ( = ?auto_200387 ?auto_200388 ) ) ( not ( = ?auto_200387 ?auto_200389 ) ) ( not ( = ?auto_200387 ?auto_200390 ) ) ( not ( = ?auto_200387 ?auto_200391 ) ) ( not ( = ?auto_200387 ?auto_200392 ) ) ( not ( = ?auto_200388 ?auto_200389 ) ) ( not ( = ?auto_200388 ?auto_200390 ) ) ( not ( = ?auto_200388 ?auto_200391 ) ) ( not ( = ?auto_200388 ?auto_200392 ) ) ( not ( = ?auto_200389 ?auto_200390 ) ) ( not ( = ?auto_200389 ?auto_200391 ) ) ( not ( = ?auto_200389 ?auto_200392 ) ) ( not ( = ?auto_200390 ?auto_200391 ) ) ( not ( = ?auto_200390 ?auto_200392 ) ) ( not ( = ?auto_200391 ?auto_200392 ) ) ( CLEAR ?auto_200389 ) ( ON ?auto_200390 ?auto_200391 ) ( CLEAR ?auto_200390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_200385 ?auto_200386 ?auto_200387 ?auto_200388 ?auto_200389 ?auto_200390 )
      ( MAKE-7PILE ?auto_200385 ?auto_200386 ?auto_200387 ?auto_200388 ?auto_200389 ?auto_200390 ?auto_200391 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_200415 - BLOCK
      ?auto_200416 - BLOCK
      ?auto_200417 - BLOCK
      ?auto_200418 - BLOCK
      ?auto_200419 - BLOCK
      ?auto_200420 - BLOCK
      ?auto_200421 - BLOCK
    )
    :vars
    (
      ?auto_200422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200421 ?auto_200422 ) ( ON-TABLE ?auto_200415 ) ( ON ?auto_200416 ?auto_200415 ) ( ON ?auto_200417 ?auto_200416 ) ( ON ?auto_200418 ?auto_200417 ) ( not ( = ?auto_200415 ?auto_200416 ) ) ( not ( = ?auto_200415 ?auto_200417 ) ) ( not ( = ?auto_200415 ?auto_200418 ) ) ( not ( = ?auto_200415 ?auto_200419 ) ) ( not ( = ?auto_200415 ?auto_200420 ) ) ( not ( = ?auto_200415 ?auto_200421 ) ) ( not ( = ?auto_200415 ?auto_200422 ) ) ( not ( = ?auto_200416 ?auto_200417 ) ) ( not ( = ?auto_200416 ?auto_200418 ) ) ( not ( = ?auto_200416 ?auto_200419 ) ) ( not ( = ?auto_200416 ?auto_200420 ) ) ( not ( = ?auto_200416 ?auto_200421 ) ) ( not ( = ?auto_200416 ?auto_200422 ) ) ( not ( = ?auto_200417 ?auto_200418 ) ) ( not ( = ?auto_200417 ?auto_200419 ) ) ( not ( = ?auto_200417 ?auto_200420 ) ) ( not ( = ?auto_200417 ?auto_200421 ) ) ( not ( = ?auto_200417 ?auto_200422 ) ) ( not ( = ?auto_200418 ?auto_200419 ) ) ( not ( = ?auto_200418 ?auto_200420 ) ) ( not ( = ?auto_200418 ?auto_200421 ) ) ( not ( = ?auto_200418 ?auto_200422 ) ) ( not ( = ?auto_200419 ?auto_200420 ) ) ( not ( = ?auto_200419 ?auto_200421 ) ) ( not ( = ?auto_200419 ?auto_200422 ) ) ( not ( = ?auto_200420 ?auto_200421 ) ) ( not ( = ?auto_200420 ?auto_200422 ) ) ( not ( = ?auto_200421 ?auto_200422 ) ) ( ON ?auto_200420 ?auto_200421 ) ( CLEAR ?auto_200418 ) ( ON ?auto_200419 ?auto_200420 ) ( CLEAR ?auto_200419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_200415 ?auto_200416 ?auto_200417 ?auto_200418 ?auto_200419 )
      ( MAKE-7PILE ?auto_200415 ?auto_200416 ?auto_200417 ?auto_200418 ?auto_200419 ?auto_200420 ?auto_200421 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_200445 - BLOCK
      ?auto_200446 - BLOCK
      ?auto_200447 - BLOCK
      ?auto_200448 - BLOCK
      ?auto_200449 - BLOCK
      ?auto_200450 - BLOCK
      ?auto_200451 - BLOCK
    )
    :vars
    (
      ?auto_200452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200451 ?auto_200452 ) ( ON-TABLE ?auto_200445 ) ( ON ?auto_200446 ?auto_200445 ) ( ON ?auto_200447 ?auto_200446 ) ( not ( = ?auto_200445 ?auto_200446 ) ) ( not ( = ?auto_200445 ?auto_200447 ) ) ( not ( = ?auto_200445 ?auto_200448 ) ) ( not ( = ?auto_200445 ?auto_200449 ) ) ( not ( = ?auto_200445 ?auto_200450 ) ) ( not ( = ?auto_200445 ?auto_200451 ) ) ( not ( = ?auto_200445 ?auto_200452 ) ) ( not ( = ?auto_200446 ?auto_200447 ) ) ( not ( = ?auto_200446 ?auto_200448 ) ) ( not ( = ?auto_200446 ?auto_200449 ) ) ( not ( = ?auto_200446 ?auto_200450 ) ) ( not ( = ?auto_200446 ?auto_200451 ) ) ( not ( = ?auto_200446 ?auto_200452 ) ) ( not ( = ?auto_200447 ?auto_200448 ) ) ( not ( = ?auto_200447 ?auto_200449 ) ) ( not ( = ?auto_200447 ?auto_200450 ) ) ( not ( = ?auto_200447 ?auto_200451 ) ) ( not ( = ?auto_200447 ?auto_200452 ) ) ( not ( = ?auto_200448 ?auto_200449 ) ) ( not ( = ?auto_200448 ?auto_200450 ) ) ( not ( = ?auto_200448 ?auto_200451 ) ) ( not ( = ?auto_200448 ?auto_200452 ) ) ( not ( = ?auto_200449 ?auto_200450 ) ) ( not ( = ?auto_200449 ?auto_200451 ) ) ( not ( = ?auto_200449 ?auto_200452 ) ) ( not ( = ?auto_200450 ?auto_200451 ) ) ( not ( = ?auto_200450 ?auto_200452 ) ) ( not ( = ?auto_200451 ?auto_200452 ) ) ( ON ?auto_200450 ?auto_200451 ) ( ON ?auto_200449 ?auto_200450 ) ( CLEAR ?auto_200447 ) ( ON ?auto_200448 ?auto_200449 ) ( CLEAR ?auto_200448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_200445 ?auto_200446 ?auto_200447 ?auto_200448 )
      ( MAKE-7PILE ?auto_200445 ?auto_200446 ?auto_200447 ?auto_200448 ?auto_200449 ?auto_200450 ?auto_200451 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_200475 - BLOCK
      ?auto_200476 - BLOCK
      ?auto_200477 - BLOCK
      ?auto_200478 - BLOCK
      ?auto_200479 - BLOCK
      ?auto_200480 - BLOCK
      ?auto_200481 - BLOCK
    )
    :vars
    (
      ?auto_200482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200481 ?auto_200482 ) ( ON-TABLE ?auto_200475 ) ( ON ?auto_200476 ?auto_200475 ) ( not ( = ?auto_200475 ?auto_200476 ) ) ( not ( = ?auto_200475 ?auto_200477 ) ) ( not ( = ?auto_200475 ?auto_200478 ) ) ( not ( = ?auto_200475 ?auto_200479 ) ) ( not ( = ?auto_200475 ?auto_200480 ) ) ( not ( = ?auto_200475 ?auto_200481 ) ) ( not ( = ?auto_200475 ?auto_200482 ) ) ( not ( = ?auto_200476 ?auto_200477 ) ) ( not ( = ?auto_200476 ?auto_200478 ) ) ( not ( = ?auto_200476 ?auto_200479 ) ) ( not ( = ?auto_200476 ?auto_200480 ) ) ( not ( = ?auto_200476 ?auto_200481 ) ) ( not ( = ?auto_200476 ?auto_200482 ) ) ( not ( = ?auto_200477 ?auto_200478 ) ) ( not ( = ?auto_200477 ?auto_200479 ) ) ( not ( = ?auto_200477 ?auto_200480 ) ) ( not ( = ?auto_200477 ?auto_200481 ) ) ( not ( = ?auto_200477 ?auto_200482 ) ) ( not ( = ?auto_200478 ?auto_200479 ) ) ( not ( = ?auto_200478 ?auto_200480 ) ) ( not ( = ?auto_200478 ?auto_200481 ) ) ( not ( = ?auto_200478 ?auto_200482 ) ) ( not ( = ?auto_200479 ?auto_200480 ) ) ( not ( = ?auto_200479 ?auto_200481 ) ) ( not ( = ?auto_200479 ?auto_200482 ) ) ( not ( = ?auto_200480 ?auto_200481 ) ) ( not ( = ?auto_200480 ?auto_200482 ) ) ( not ( = ?auto_200481 ?auto_200482 ) ) ( ON ?auto_200480 ?auto_200481 ) ( ON ?auto_200479 ?auto_200480 ) ( ON ?auto_200478 ?auto_200479 ) ( CLEAR ?auto_200476 ) ( ON ?auto_200477 ?auto_200478 ) ( CLEAR ?auto_200477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_200475 ?auto_200476 ?auto_200477 )
      ( MAKE-7PILE ?auto_200475 ?auto_200476 ?auto_200477 ?auto_200478 ?auto_200479 ?auto_200480 ?auto_200481 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_200505 - BLOCK
      ?auto_200506 - BLOCK
      ?auto_200507 - BLOCK
      ?auto_200508 - BLOCK
      ?auto_200509 - BLOCK
      ?auto_200510 - BLOCK
      ?auto_200511 - BLOCK
    )
    :vars
    (
      ?auto_200512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200511 ?auto_200512 ) ( ON-TABLE ?auto_200505 ) ( not ( = ?auto_200505 ?auto_200506 ) ) ( not ( = ?auto_200505 ?auto_200507 ) ) ( not ( = ?auto_200505 ?auto_200508 ) ) ( not ( = ?auto_200505 ?auto_200509 ) ) ( not ( = ?auto_200505 ?auto_200510 ) ) ( not ( = ?auto_200505 ?auto_200511 ) ) ( not ( = ?auto_200505 ?auto_200512 ) ) ( not ( = ?auto_200506 ?auto_200507 ) ) ( not ( = ?auto_200506 ?auto_200508 ) ) ( not ( = ?auto_200506 ?auto_200509 ) ) ( not ( = ?auto_200506 ?auto_200510 ) ) ( not ( = ?auto_200506 ?auto_200511 ) ) ( not ( = ?auto_200506 ?auto_200512 ) ) ( not ( = ?auto_200507 ?auto_200508 ) ) ( not ( = ?auto_200507 ?auto_200509 ) ) ( not ( = ?auto_200507 ?auto_200510 ) ) ( not ( = ?auto_200507 ?auto_200511 ) ) ( not ( = ?auto_200507 ?auto_200512 ) ) ( not ( = ?auto_200508 ?auto_200509 ) ) ( not ( = ?auto_200508 ?auto_200510 ) ) ( not ( = ?auto_200508 ?auto_200511 ) ) ( not ( = ?auto_200508 ?auto_200512 ) ) ( not ( = ?auto_200509 ?auto_200510 ) ) ( not ( = ?auto_200509 ?auto_200511 ) ) ( not ( = ?auto_200509 ?auto_200512 ) ) ( not ( = ?auto_200510 ?auto_200511 ) ) ( not ( = ?auto_200510 ?auto_200512 ) ) ( not ( = ?auto_200511 ?auto_200512 ) ) ( ON ?auto_200510 ?auto_200511 ) ( ON ?auto_200509 ?auto_200510 ) ( ON ?auto_200508 ?auto_200509 ) ( ON ?auto_200507 ?auto_200508 ) ( CLEAR ?auto_200505 ) ( ON ?auto_200506 ?auto_200507 ) ( CLEAR ?auto_200506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_200505 ?auto_200506 )
      ( MAKE-7PILE ?auto_200505 ?auto_200506 ?auto_200507 ?auto_200508 ?auto_200509 ?auto_200510 ?auto_200511 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_200535 - BLOCK
      ?auto_200536 - BLOCK
      ?auto_200537 - BLOCK
      ?auto_200538 - BLOCK
      ?auto_200539 - BLOCK
      ?auto_200540 - BLOCK
      ?auto_200541 - BLOCK
    )
    :vars
    (
      ?auto_200542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200541 ?auto_200542 ) ( not ( = ?auto_200535 ?auto_200536 ) ) ( not ( = ?auto_200535 ?auto_200537 ) ) ( not ( = ?auto_200535 ?auto_200538 ) ) ( not ( = ?auto_200535 ?auto_200539 ) ) ( not ( = ?auto_200535 ?auto_200540 ) ) ( not ( = ?auto_200535 ?auto_200541 ) ) ( not ( = ?auto_200535 ?auto_200542 ) ) ( not ( = ?auto_200536 ?auto_200537 ) ) ( not ( = ?auto_200536 ?auto_200538 ) ) ( not ( = ?auto_200536 ?auto_200539 ) ) ( not ( = ?auto_200536 ?auto_200540 ) ) ( not ( = ?auto_200536 ?auto_200541 ) ) ( not ( = ?auto_200536 ?auto_200542 ) ) ( not ( = ?auto_200537 ?auto_200538 ) ) ( not ( = ?auto_200537 ?auto_200539 ) ) ( not ( = ?auto_200537 ?auto_200540 ) ) ( not ( = ?auto_200537 ?auto_200541 ) ) ( not ( = ?auto_200537 ?auto_200542 ) ) ( not ( = ?auto_200538 ?auto_200539 ) ) ( not ( = ?auto_200538 ?auto_200540 ) ) ( not ( = ?auto_200538 ?auto_200541 ) ) ( not ( = ?auto_200538 ?auto_200542 ) ) ( not ( = ?auto_200539 ?auto_200540 ) ) ( not ( = ?auto_200539 ?auto_200541 ) ) ( not ( = ?auto_200539 ?auto_200542 ) ) ( not ( = ?auto_200540 ?auto_200541 ) ) ( not ( = ?auto_200540 ?auto_200542 ) ) ( not ( = ?auto_200541 ?auto_200542 ) ) ( ON ?auto_200540 ?auto_200541 ) ( ON ?auto_200539 ?auto_200540 ) ( ON ?auto_200538 ?auto_200539 ) ( ON ?auto_200537 ?auto_200538 ) ( ON ?auto_200536 ?auto_200537 ) ( ON ?auto_200535 ?auto_200536 ) ( CLEAR ?auto_200535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_200535 )
      ( MAKE-7PILE ?auto_200535 ?auto_200536 ?auto_200537 ?auto_200538 ?auto_200539 ?auto_200540 ?auto_200541 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200566 - BLOCK
      ?auto_200567 - BLOCK
      ?auto_200568 - BLOCK
      ?auto_200569 - BLOCK
      ?auto_200570 - BLOCK
      ?auto_200571 - BLOCK
      ?auto_200572 - BLOCK
      ?auto_200573 - BLOCK
    )
    :vars
    (
      ?auto_200574 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_200572 ) ( ON ?auto_200573 ?auto_200574 ) ( CLEAR ?auto_200573 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_200566 ) ( ON ?auto_200567 ?auto_200566 ) ( ON ?auto_200568 ?auto_200567 ) ( ON ?auto_200569 ?auto_200568 ) ( ON ?auto_200570 ?auto_200569 ) ( ON ?auto_200571 ?auto_200570 ) ( ON ?auto_200572 ?auto_200571 ) ( not ( = ?auto_200566 ?auto_200567 ) ) ( not ( = ?auto_200566 ?auto_200568 ) ) ( not ( = ?auto_200566 ?auto_200569 ) ) ( not ( = ?auto_200566 ?auto_200570 ) ) ( not ( = ?auto_200566 ?auto_200571 ) ) ( not ( = ?auto_200566 ?auto_200572 ) ) ( not ( = ?auto_200566 ?auto_200573 ) ) ( not ( = ?auto_200566 ?auto_200574 ) ) ( not ( = ?auto_200567 ?auto_200568 ) ) ( not ( = ?auto_200567 ?auto_200569 ) ) ( not ( = ?auto_200567 ?auto_200570 ) ) ( not ( = ?auto_200567 ?auto_200571 ) ) ( not ( = ?auto_200567 ?auto_200572 ) ) ( not ( = ?auto_200567 ?auto_200573 ) ) ( not ( = ?auto_200567 ?auto_200574 ) ) ( not ( = ?auto_200568 ?auto_200569 ) ) ( not ( = ?auto_200568 ?auto_200570 ) ) ( not ( = ?auto_200568 ?auto_200571 ) ) ( not ( = ?auto_200568 ?auto_200572 ) ) ( not ( = ?auto_200568 ?auto_200573 ) ) ( not ( = ?auto_200568 ?auto_200574 ) ) ( not ( = ?auto_200569 ?auto_200570 ) ) ( not ( = ?auto_200569 ?auto_200571 ) ) ( not ( = ?auto_200569 ?auto_200572 ) ) ( not ( = ?auto_200569 ?auto_200573 ) ) ( not ( = ?auto_200569 ?auto_200574 ) ) ( not ( = ?auto_200570 ?auto_200571 ) ) ( not ( = ?auto_200570 ?auto_200572 ) ) ( not ( = ?auto_200570 ?auto_200573 ) ) ( not ( = ?auto_200570 ?auto_200574 ) ) ( not ( = ?auto_200571 ?auto_200572 ) ) ( not ( = ?auto_200571 ?auto_200573 ) ) ( not ( = ?auto_200571 ?auto_200574 ) ) ( not ( = ?auto_200572 ?auto_200573 ) ) ( not ( = ?auto_200572 ?auto_200574 ) ) ( not ( = ?auto_200573 ?auto_200574 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_200573 ?auto_200574 )
      ( !STACK ?auto_200573 ?auto_200572 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200600 - BLOCK
      ?auto_200601 - BLOCK
      ?auto_200602 - BLOCK
      ?auto_200603 - BLOCK
      ?auto_200604 - BLOCK
      ?auto_200605 - BLOCK
      ?auto_200606 - BLOCK
      ?auto_200607 - BLOCK
    )
    :vars
    (
      ?auto_200608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200607 ?auto_200608 ) ( ON-TABLE ?auto_200600 ) ( ON ?auto_200601 ?auto_200600 ) ( ON ?auto_200602 ?auto_200601 ) ( ON ?auto_200603 ?auto_200602 ) ( ON ?auto_200604 ?auto_200603 ) ( ON ?auto_200605 ?auto_200604 ) ( not ( = ?auto_200600 ?auto_200601 ) ) ( not ( = ?auto_200600 ?auto_200602 ) ) ( not ( = ?auto_200600 ?auto_200603 ) ) ( not ( = ?auto_200600 ?auto_200604 ) ) ( not ( = ?auto_200600 ?auto_200605 ) ) ( not ( = ?auto_200600 ?auto_200606 ) ) ( not ( = ?auto_200600 ?auto_200607 ) ) ( not ( = ?auto_200600 ?auto_200608 ) ) ( not ( = ?auto_200601 ?auto_200602 ) ) ( not ( = ?auto_200601 ?auto_200603 ) ) ( not ( = ?auto_200601 ?auto_200604 ) ) ( not ( = ?auto_200601 ?auto_200605 ) ) ( not ( = ?auto_200601 ?auto_200606 ) ) ( not ( = ?auto_200601 ?auto_200607 ) ) ( not ( = ?auto_200601 ?auto_200608 ) ) ( not ( = ?auto_200602 ?auto_200603 ) ) ( not ( = ?auto_200602 ?auto_200604 ) ) ( not ( = ?auto_200602 ?auto_200605 ) ) ( not ( = ?auto_200602 ?auto_200606 ) ) ( not ( = ?auto_200602 ?auto_200607 ) ) ( not ( = ?auto_200602 ?auto_200608 ) ) ( not ( = ?auto_200603 ?auto_200604 ) ) ( not ( = ?auto_200603 ?auto_200605 ) ) ( not ( = ?auto_200603 ?auto_200606 ) ) ( not ( = ?auto_200603 ?auto_200607 ) ) ( not ( = ?auto_200603 ?auto_200608 ) ) ( not ( = ?auto_200604 ?auto_200605 ) ) ( not ( = ?auto_200604 ?auto_200606 ) ) ( not ( = ?auto_200604 ?auto_200607 ) ) ( not ( = ?auto_200604 ?auto_200608 ) ) ( not ( = ?auto_200605 ?auto_200606 ) ) ( not ( = ?auto_200605 ?auto_200607 ) ) ( not ( = ?auto_200605 ?auto_200608 ) ) ( not ( = ?auto_200606 ?auto_200607 ) ) ( not ( = ?auto_200606 ?auto_200608 ) ) ( not ( = ?auto_200607 ?auto_200608 ) ) ( CLEAR ?auto_200605 ) ( ON ?auto_200606 ?auto_200607 ) ( CLEAR ?auto_200606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_200600 ?auto_200601 ?auto_200602 ?auto_200603 ?auto_200604 ?auto_200605 ?auto_200606 )
      ( MAKE-8PILE ?auto_200600 ?auto_200601 ?auto_200602 ?auto_200603 ?auto_200604 ?auto_200605 ?auto_200606 ?auto_200607 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200634 - BLOCK
      ?auto_200635 - BLOCK
      ?auto_200636 - BLOCK
      ?auto_200637 - BLOCK
      ?auto_200638 - BLOCK
      ?auto_200639 - BLOCK
      ?auto_200640 - BLOCK
      ?auto_200641 - BLOCK
    )
    :vars
    (
      ?auto_200642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200641 ?auto_200642 ) ( ON-TABLE ?auto_200634 ) ( ON ?auto_200635 ?auto_200634 ) ( ON ?auto_200636 ?auto_200635 ) ( ON ?auto_200637 ?auto_200636 ) ( ON ?auto_200638 ?auto_200637 ) ( not ( = ?auto_200634 ?auto_200635 ) ) ( not ( = ?auto_200634 ?auto_200636 ) ) ( not ( = ?auto_200634 ?auto_200637 ) ) ( not ( = ?auto_200634 ?auto_200638 ) ) ( not ( = ?auto_200634 ?auto_200639 ) ) ( not ( = ?auto_200634 ?auto_200640 ) ) ( not ( = ?auto_200634 ?auto_200641 ) ) ( not ( = ?auto_200634 ?auto_200642 ) ) ( not ( = ?auto_200635 ?auto_200636 ) ) ( not ( = ?auto_200635 ?auto_200637 ) ) ( not ( = ?auto_200635 ?auto_200638 ) ) ( not ( = ?auto_200635 ?auto_200639 ) ) ( not ( = ?auto_200635 ?auto_200640 ) ) ( not ( = ?auto_200635 ?auto_200641 ) ) ( not ( = ?auto_200635 ?auto_200642 ) ) ( not ( = ?auto_200636 ?auto_200637 ) ) ( not ( = ?auto_200636 ?auto_200638 ) ) ( not ( = ?auto_200636 ?auto_200639 ) ) ( not ( = ?auto_200636 ?auto_200640 ) ) ( not ( = ?auto_200636 ?auto_200641 ) ) ( not ( = ?auto_200636 ?auto_200642 ) ) ( not ( = ?auto_200637 ?auto_200638 ) ) ( not ( = ?auto_200637 ?auto_200639 ) ) ( not ( = ?auto_200637 ?auto_200640 ) ) ( not ( = ?auto_200637 ?auto_200641 ) ) ( not ( = ?auto_200637 ?auto_200642 ) ) ( not ( = ?auto_200638 ?auto_200639 ) ) ( not ( = ?auto_200638 ?auto_200640 ) ) ( not ( = ?auto_200638 ?auto_200641 ) ) ( not ( = ?auto_200638 ?auto_200642 ) ) ( not ( = ?auto_200639 ?auto_200640 ) ) ( not ( = ?auto_200639 ?auto_200641 ) ) ( not ( = ?auto_200639 ?auto_200642 ) ) ( not ( = ?auto_200640 ?auto_200641 ) ) ( not ( = ?auto_200640 ?auto_200642 ) ) ( not ( = ?auto_200641 ?auto_200642 ) ) ( ON ?auto_200640 ?auto_200641 ) ( CLEAR ?auto_200638 ) ( ON ?auto_200639 ?auto_200640 ) ( CLEAR ?auto_200639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_200634 ?auto_200635 ?auto_200636 ?auto_200637 ?auto_200638 ?auto_200639 )
      ( MAKE-8PILE ?auto_200634 ?auto_200635 ?auto_200636 ?auto_200637 ?auto_200638 ?auto_200639 ?auto_200640 ?auto_200641 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200668 - BLOCK
      ?auto_200669 - BLOCK
      ?auto_200670 - BLOCK
      ?auto_200671 - BLOCK
      ?auto_200672 - BLOCK
      ?auto_200673 - BLOCK
      ?auto_200674 - BLOCK
      ?auto_200675 - BLOCK
    )
    :vars
    (
      ?auto_200676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200675 ?auto_200676 ) ( ON-TABLE ?auto_200668 ) ( ON ?auto_200669 ?auto_200668 ) ( ON ?auto_200670 ?auto_200669 ) ( ON ?auto_200671 ?auto_200670 ) ( not ( = ?auto_200668 ?auto_200669 ) ) ( not ( = ?auto_200668 ?auto_200670 ) ) ( not ( = ?auto_200668 ?auto_200671 ) ) ( not ( = ?auto_200668 ?auto_200672 ) ) ( not ( = ?auto_200668 ?auto_200673 ) ) ( not ( = ?auto_200668 ?auto_200674 ) ) ( not ( = ?auto_200668 ?auto_200675 ) ) ( not ( = ?auto_200668 ?auto_200676 ) ) ( not ( = ?auto_200669 ?auto_200670 ) ) ( not ( = ?auto_200669 ?auto_200671 ) ) ( not ( = ?auto_200669 ?auto_200672 ) ) ( not ( = ?auto_200669 ?auto_200673 ) ) ( not ( = ?auto_200669 ?auto_200674 ) ) ( not ( = ?auto_200669 ?auto_200675 ) ) ( not ( = ?auto_200669 ?auto_200676 ) ) ( not ( = ?auto_200670 ?auto_200671 ) ) ( not ( = ?auto_200670 ?auto_200672 ) ) ( not ( = ?auto_200670 ?auto_200673 ) ) ( not ( = ?auto_200670 ?auto_200674 ) ) ( not ( = ?auto_200670 ?auto_200675 ) ) ( not ( = ?auto_200670 ?auto_200676 ) ) ( not ( = ?auto_200671 ?auto_200672 ) ) ( not ( = ?auto_200671 ?auto_200673 ) ) ( not ( = ?auto_200671 ?auto_200674 ) ) ( not ( = ?auto_200671 ?auto_200675 ) ) ( not ( = ?auto_200671 ?auto_200676 ) ) ( not ( = ?auto_200672 ?auto_200673 ) ) ( not ( = ?auto_200672 ?auto_200674 ) ) ( not ( = ?auto_200672 ?auto_200675 ) ) ( not ( = ?auto_200672 ?auto_200676 ) ) ( not ( = ?auto_200673 ?auto_200674 ) ) ( not ( = ?auto_200673 ?auto_200675 ) ) ( not ( = ?auto_200673 ?auto_200676 ) ) ( not ( = ?auto_200674 ?auto_200675 ) ) ( not ( = ?auto_200674 ?auto_200676 ) ) ( not ( = ?auto_200675 ?auto_200676 ) ) ( ON ?auto_200674 ?auto_200675 ) ( ON ?auto_200673 ?auto_200674 ) ( CLEAR ?auto_200671 ) ( ON ?auto_200672 ?auto_200673 ) ( CLEAR ?auto_200672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_200668 ?auto_200669 ?auto_200670 ?auto_200671 ?auto_200672 )
      ( MAKE-8PILE ?auto_200668 ?auto_200669 ?auto_200670 ?auto_200671 ?auto_200672 ?auto_200673 ?auto_200674 ?auto_200675 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200702 - BLOCK
      ?auto_200703 - BLOCK
      ?auto_200704 - BLOCK
      ?auto_200705 - BLOCK
      ?auto_200706 - BLOCK
      ?auto_200707 - BLOCK
      ?auto_200708 - BLOCK
      ?auto_200709 - BLOCK
    )
    :vars
    (
      ?auto_200710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200709 ?auto_200710 ) ( ON-TABLE ?auto_200702 ) ( ON ?auto_200703 ?auto_200702 ) ( ON ?auto_200704 ?auto_200703 ) ( not ( = ?auto_200702 ?auto_200703 ) ) ( not ( = ?auto_200702 ?auto_200704 ) ) ( not ( = ?auto_200702 ?auto_200705 ) ) ( not ( = ?auto_200702 ?auto_200706 ) ) ( not ( = ?auto_200702 ?auto_200707 ) ) ( not ( = ?auto_200702 ?auto_200708 ) ) ( not ( = ?auto_200702 ?auto_200709 ) ) ( not ( = ?auto_200702 ?auto_200710 ) ) ( not ( = ?auto_200703 ?auto_200704 ) ) ( not ( = ?auto_200703 ?auto_200705 ) ) ( not ( = ?auto_200703 ?auto_200706 ) ) ( not ( = ?auto_200703 ?auto_200707 ) ) ( not ( = ?auto_200703 ?auto_200708 ) ) ( not ( = ?auto_200703 ?auto_200709 ) ) ( not ( = ?auto_200703 ?auto_200710 ) ) ( not ( = ?auto_200704 ?auto_200705 ) ) ( not ( = ?auto_200704 ?auto_200706 ) ) ( not ( = ?auto_200704 ?auto_200707 ) ) ( not ( = ?auto_200704 ?auto_200708 ) ) ( not ( = ?auto_200704 ?auto_200709 ) ) ( not ( = ?auto_200704 ?auto_200710 ) ) ( not ( = ?auto_200705 ?auto_200706 ) ) ( not ( = ?auto_200705 ?auto_200707 ) ) ( not ( = ?auto_200705 ?auto_200708 ) ) ( not ( = ?auto_200705 ?auto_200709 ) ) ( not ( = ?auto_200705 ?auto_200710 ) ) ( not ( = ?auto_200706 ?auto_200707 ) ) ( not ( = ?auto_200706 ?auto_200708 ) ) ( not ( = ?auto_200706 ?auto_200709 ) ) ( not ( = ?auto_200706 ?auto_200710 ) ) ( not ( = ?auto_200707 ?auto_200708 ) ) ( not ( = ?auto_200707 ?auto_200709 ) ) ( not ( = ?auto_200707 ?auto_200710 ) ) ( not ( = ?auto_200708 ?auto_200709 ) ) ( not ( = ?auto_200708 ?auto_200710 ) ) ( not ( = ?auto_200709 ?auto_200710 ) ) ( ON ?auto_200708 ?auto_200709 ) ( ON ?auto_200707 ?auto_200708 ) ( ON ?auto_200706 ?auto_200707 ) ( CLEAR ?auto_200704 ) ( ON ?auto_200705 ?auto_200706 ) ( CLEAR ?auto_200705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_200702 ?auto_200703 ?auto_200704 ?auto_200705 )
      ( MAKE-8PILE ?auto_200702 ?auto_200703 ?auto_200704 ?auto_200705 ?auto_200706 ?auto_200707 ?auto_200708 ?auto_200709 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200736 - BLOCK
      ?auto_200737 - BLOCK
      ?auto_200738 - BLOCK
      ?auto_200739 - BLOCK
      ?auto_200740 - BLOCK
      ?auto_200741 - BLOCK
      ?auto_200742 - BLOCK
      ?auto_200743 - BLOCK
    )
    :vars
    (
      ?auto_200744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200743 ?auto_200744 ) ( ON-TABLE ?auto_200736 ) ( ON ?auto_200737 ?auto_200736 ) ( not ( = ?auto_200736 ?auto_200737 ) ) ( not ( = ?auto_200736 ?auto_200738 ) ) ( not ( = ?auto_200736 ?auto_200739 ) ) ( not ( = ?auto_200736 ?auto_200740 ) ) ( not ( = ?auto_200736 ?auto_200741 ) ) ( not ( = ?auto_200736 ?auto_200742 ) ) ( not ( = ?auto_200736 ?auto_200743 ) ) ( not ( = ?auto_200736 ?auto_200744 ) ) ( not ( = ?auto_200737 ?auto_200738 ) ) ( not ( = ?auto_200737 ?auto_200739 ) ) ( not ( = ?auto_200737 ?auto_200740 ) ) ( not ( = ?auto_200737 ?auto_200741 ) ) ( not ( = ?auto_200737 ?auto_200742 ) ) ( not ( = ?auto_200737 ?auto_200743 ) ) ( not ( = ?auto_200737 ?auto_200744 ) ) ( not ( = ?auto_200738 ?auto_200739 ) ) ( not ( = ?auto_200738 ?auto_200740 ) ) ( not ( = ?auto_200738 ?auto_200741 ) ) ( not ( = ?auto_200738 ?auto_200742 ) ) ( not ( = ?auto_200738 ?auto_200743 ) ) ( not ( = ?auto_200738 ?auto_200744 ) ) ( not ( = ?auto_200739 ?auto_200740 ) ) ( not ( = ?auto_200739 ?auto_200741 ) ) ( not ( = ?auto_200739 ?auto_200742 ) ) ( not ( = ?auto_200739 ?auto_200743 ) ) ( not ( = ?auto_200739 ?auto_200744 ) ) ( not ( = ?auto_200740 ?auto_200741 ) ) ( not ( = ?auto_200740 ?auto_200742 ) ) ( not ( = ?auto_200740 ?auto_200743 ) ) ( not ( = ?auto_200740 ?auto_200744 ) ) ( not ( = ?auto_200741 ?auto_200742 ) ) ( not ( = ?auto_200741 ?auto_200743 ) ) ( not ( = ?auto_200741 ?auto_200744 ) ) ( not ( = ?auto_200742 ?auto_200743 ) ) ( not ( = ?auto_200742 ?auto_200744 ) ) ( not ( = ?auto_200743 ?auto_200744 ) ) ( ON ?auto_200742 ?auto_200743 ) ( ON ?auto_200741 ?auto_200742 ) ( ON ?auto_200740 ?auto_200741 ) ( ON ?auto_200739 ?auto_200740 ) ( CLEAR ?auto_200737 ) ( ON ?auto_200738 ?auto_200739 ) ( CLEAR ?auto_200738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_200736 ?auto_200737 ?auto_200738 )
      ( MAKE-8PILE ?auto_200736 ?auto_200737 ?auto_200738 ?auto_200739 ?auto_200740 ?auto_200741 ?auto_200742 ?auto_200743 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200770 - BLOCK
      ?auto_200771 - BLOCK
      ?auto_200772 - BLOCK
      ?auto_200773 - BLOCK
      ?auto_200774 - BLOCK
      ?auto_200775 - BLOCK
      ?auto_200776 - BLOCK
      ?auto_200777 - BLOCK
    )
    :vars
    (
      ?auto_200778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200777 ?auto_200778 ) ( ON-TABLE ?auto_200770 ) ( not ( = ?auto_200770 ?auto_200771 ) ) ( not ( = ?auto_200770 ?auto_200772 ) ) ( not ( = ?auto_200770 ?auto_200773 ) ) ( not ( = ?auto_200770 ?auto_200774 ) ) ( not ( = ?auto_200770 ?auto_200775 ) ) ( not ( = ?auto_200770 ?auto_200776 ) ) ( not ( = ?auto_200770 ?auto_200777 ) ) ( not ( = ?auto_200770 ?auto_200778 ) ) ( not ( = ?auto_200771 ?auto_200772 ) ) ( not ( = ?auto_200771 ?auto_200773 ) ) ( not ( = ?auto_200771 ?auto_200774 ) ) ( not ( = ?auto_200771 ?auto_200775 ) ) ( not ( = ?auto_200771 ?auto_200776 ) ) ( not ( = ?auto_200771 ?auto_200777 ) ) ( not ( = ?auto_200771 ?auto_200778 ) ) ( not ( = ?auto_200772 ?auto_200773 ) ) ( not ( = ?auto_200772 ?auto_200774 ) ) ( not ( = ?auto_200772 ?auto_200775 ) ) ( not ( = ?auto_200772 ?auto_200776 ) ) ( not ( = ?auto_200772 ?auto_200777 ) ) ( not ( = ?auto_200772 ?auto_200778 ) ) ( not ( = ?auto_200773 ?auto_200774 ) ) ( not ( = ?auto_200773 ?auto_200775 ) ) ( not ( = ?auto_200773 ?auto_200776 ) ) ( not ( = ?auto_200773 ?auto_200777 ) ) ( not ( = ?auto_200773 ?auto_200778 ) ) ( not ( = ?auto_200774 ?auto_200775 ) ) ( not ( = ?auto_200774 ?auto_200776 ) ) ( not ( = ?auto_200774 ?auto_200777 ) ) ( not ( = ?auto_200774 ?auto_200778 ) ) ( not ( = ?auto_200775 ?auto_200776 ) ) ( not ( = ?auto_200775 ?auto_200777 ) ) ( not ( = ?auto_200775 ?auto_200778 ) ) ( not ( = ?auto_200776 ?auto_200777 ) ) ( not ( = ?auto_200776 ?auto_200778 ) ) ( not ( = ?auto_200777 ?auto_200778 ) ) ( ON ?auto_200776 ?auto_200777 ) ( ON ?auto_200775 ?auto_200776 ) ( ON ?auto_200774 ?auto_200775 ) ( ON ?auto_200773 ?auto_200774 ) ( ON ?auto_200772 ?auto_200773 ) ( CLEAR ?auto_200770 ) ( ON ?auto_200771 ?auto_200772 ) ( CLEAR ?auto_200771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_200770 ?auto_200771 )
      ( MAKE-8PILE ?auto_200770 ?auto_200771 ?auto_200772 ?auto_200773 ?auto_200774 ?auto_200775 ?auto_200776 ?auto_200777 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200804 - BLOCK
      ?auto_200805 - BLOCK
      ?auto_200806 - BLOCK
      ?auto_200807 - BLOCK
      ?auto_200808 - BLOCK
      ?auto_200809 - BLOCK
      ?auto_200810 - BLOCK
      ?auto_200811 - BLOCK
    )
    :vars
    (
      ?auto_200812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200811 ?auto_200812 ) ( not ( = ?auto_200804 ?auto_200805 ) ) ( not ( = ?auto_200804 ?auto_200806 ) ) ( not ( = ?auto_200804 ?auto_200807 ) ) ( not ( = ?auto_200804 ?auto_200808 ) ) ( not ( = ?auto_200804 ?auto_200809 ) ) ( not ( = ?auto_200804 ?auto_200810 ) ) ( not ( = ?auto_200804 ?auto_200811 ) ) ( not ( = ?auto_200804 ?auto_200812 ) ) ( not ( = ?auto_200805 ?auto_200806 ) ) ( not ( = ?auto_200805 ?auto_200807 ) ) ( not ( = ?auto_200805 ?auto_200808 ) ) ( not ( = ?auto_200805 ?auto_200809 ) ) ( not ( = ?auto_200805 ?auto_200810 ) ) ( not ( = ?auto_200805 ?auto_200811 ) ) ( not ( = ?auto_200805 ?auto_200812 ) ) ( not ( = ?auto_200806 ?auto_200807 ) ) ( not ( = ?auto_200806 ?auto_200808 ) ) ( not ( = ?auto_200806 ?auto_200809 ) ) ( not ( = ?auto_200806 ?auto_200810 ) ) ( not ( = ?auto_200806 ?auto_200811 ) ) ( not ( = ?auto_200806 ?auto_200812 ) ) ( not ( = ?auto_200807 ?auto_200808 ) ) ( not ( = ?auto_200807 ?auto_200809 ) ) ( not ( = ?auto_200807 ?auto_200810 ) ) ( not ( = ?auto_200807 ?auto_200811 ) ) ( not ( = ?auto_200807 ?auto_200812 ) ) ( not ( = ?auto_200808 ?auto_200809 ) ) ( not ( = ?auto_200808 ?auto_200810 ) ) ( not ( = ?auto_200808 ?auto_200811 ) ) ( not ( = ?auto_200808 ?auto_200812 ) ) ( not ( = ?auto_200809 ?auto_200810 ) ) ( not ( = ?auto_200809 ?auto_200811 ) ) ( not ( = ?auto_200809 ?auto_200812 ) ) ( not ( = ?auto_200810 ?auto_200811 ) ) ( not ( = ?auto_200810 ?auto_200812 ) ) ( not ( = ?auto_200811 ?auto_200812 ) ) ( ON ?auto_200810 ?auto_200811 ) ( ON ?auto_200809 ?auto_200810 ) ( ON ?auto_200808 ?auto_200809 ) ( ON ?auto_200807 ?auto_200808 ) ( ON ?auto_200806 ?auto_200807 ) ( ON ?auto_200805 ?auto_200806 ) ( ON ?auto_200804 ?auto_200805 ) ( CLEAR ?auto_200804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_200804 )
      ( MAKE-8PILE ?auto_200804 ?auto_200805 ?auto_200806 ?auto_200807 ?auto_200808 ?auto_200809 ?auto_200810 ?auto_200811 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_200839 - BLOCK
      ?auto_200840 - BLOCK
      ?auto_200841 - BLOCK
      ?auto_200842 - BLOCK
      ?auto_200843 - BLOCK
      ?auto_200844 - BLOCK
      ?auto_200845 - BLOCK
      ?auto_200846 - BLOCK
      ?auto_200847 - BLOCK
    )
    :vars
    (
      ?auto_200848 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_200846 ) ( ON ?auto_200847 ?auto_200848 ) ( CLEAR ?auto_200847 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_200839 ) ( ON ?auto_200840 ?auto_200839 ) ( ON ?auto_200841 ?auto_200840 ) ( ON ?auto_200842 ?auto_200841 ) ( ON ?auto_200843 ?auto_200842 ) ( ON ?auto_200844 ?auto_200843 ) ( ON ?auto_200845 ?auto_200844 ) ( ON ?auto_200846 ?auto_200845 ) ( not ( = ?auto_200839 ?auto_200840 ) ) ( not ( = ?auto_200839 ?auto_200841 ) ) ( not ( = ?auto_200839 ?auto_200842 ) ) ( not ( = ?auto_200839 ?auto_200843 ) ) ( not ( = ?auto_200839 ?auto_200844 ) ) ( not ( = ?auto_200839 ?auto_200845 ) ) ( not ( = ?auto_200839 ?auto_200846 ) ) ( not ( = ?auto_200839 ?auto_200847 ) ) ( not ( = ?auto_200839 ?auto_200848 ) ) ( not ( = ?auto_200840 ?auto_200841 ) ) ( not ( = ?auto_200840 ?auto_200842 ) ) ( not ( = ?auto_200840 ?auto_200843 ) ) ( not ( = ?auto_200840 ?auto_200844 ) ) ( not ( = ?auto_200840 ?auto_200845 ) ) ( not ( = ?auto_200840 ?auto_200846 ) ) ( not ( = ?auto_200840 ?auto_200847 ) ) ( not ( = ?auto_200840 ?auto_200848 ) ) ( not ( = ?auto_200841 ?auto_200842 ) ) ( not ( = ?auto_200841 ?auto_200843 ) ) ( not ( = ?auto_200841 ?auto_200844 ) ) ( not ( = ?auto_200841 ?auto_200845 ) ) ( not ( = ?auto_200841 ?auto_200846 ) ) ( not ( = ?auto_200841 ?auto_200847 ) ) ( not ( = ?auto_200841 ?auto_200848 ) ) ( not ( = ?auto_200842 ?auto_200843 ) ) ( not ( = ?auto_200842 ?auto_200844 ) ) ( not ( = ?auto_200842 ?auto_200845 ) ) ( not ( = ?auto_200842 ?auto_200846 ) ) ( not ( = ?auto_200842 ?auto_200847 ) ) ( not ( = ?auto_200842 ?auto_200848 ) ) ( not ( = ?auto_200843 ?auto_200844 ) ) ( not ( = ?auto_200843 ?auto_200845 ) ) ( not ( = ?auto_200843 ?auto_200846 ) ) ( not ( = ?auto_200843 ?auto_200847 ) ) ( not ( = ?auto_200843 ?auto_200848 ) ) ( not ( = ?auto_200844 ?auto_200845 ) ) ( not ( = ?auto_200844 ?auto_200846 ) ) ( not ( = ?auto_200844 ?auto_200847 ) ) ( not ( = ?auto_200844 ?auto_200848 ) ) ( not ( = ?auto_200845 ?auto_200846 ) ) ( not ( = ?auto_200845 ?auto_200847 ) ) ( not ( = ?auto_200845 ?auto_200848 ) ) ( not ( = ?auto_200846 ?auto_200847 ) ) ( not ( = ?auto_200846 ?auto_200848 ) ) ( not ( = ?auto_200847 ?auto_200848 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_200847 ?auto_200848 )
      ( !STACK ?auto_200847 ?auto_200846 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_200877 - BLOCK
      ?auto_200878 - BLOCK
      ?auto_200879 - BLOCK
      ?auto_200880 - BLOCK
      ?auto_200881 - BLOCK
      ?auto_200882 - BLOCK
      ?auto_200883 - BLOCK
      ?auto_200884 - BLOCK
      ?auto_200885 - BLOCK
    )
    :vars
    (
      ?auto_200886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200885 ?auto_200886 ) ( ON-TABLE ?auto_200877 ) ( ON ?auto_200878 ?auto_200877 ) ( ON ?auto_200879 ?auto_200878 ) ( ON ?auto_200880 ?auto_200879 ) ( ON ?auto_200881 ?auto_200880 ) ( ON ?auto_200882 ?auto_200881 ) ( ON ?auto_200883 ?auto_200882 ) ( not ( = ?auto_200877 ?auto_200878 ) ) ( not ( = ?auto_200877 ?auto_200879 ) ) ( not ( = ?auto_200877 ?auto_200880 ) ) ( not ( = ?auto_200877 ?auto_200881 ) ) ( not ( = ?auto_200877 ?auto_200882 ) ) ( not ( = ?auto_200877 ?auto_200883 ) ) ( not ( = ?auto_200877 ?auto_200884 ) ) ( not ( = ?auto_200877 ?auto_200885 ) ) ( not ( = ?auto_200877 ?auto_200886 ) ) ( not ( = ?auto_200878 ?auto_200879 ) ) ( not ( = ?auto_200878 ?auto_200880 ) ) ( not ( = ?auto_200878 ?auto_200881 ) ) ( not ( = ?auto_200878 ?auto_200882 ) ) ( not ( = ?auto_200878 ?auto_200883 ) ) ( not ( = ?auto_200878 ?auto_200884 ) ) ( not ( = ?auto_200878 ?auto_200885 ) ) ( not ( = ?auto_200878 ?auto_200886 ) ) ( not ( = ?auto_200879 ?auto_200880 ) ) ( not ( = ?auto_200879 ?auto_200881 ) ) ( not ( = ?auto_200879 ?auto_200882 ) ) ( not ( = ?auto_200879 ?auto_200883 ) ) ( not ( = ?auto_200879 ?auto_200884 ) ) ( not ( = ?auto_200879 ?auto_200885 ) ) ( not ( = ?auto_200879 ?auto_200886 ) ) ( not ( = ?auto_200880 ?auto_200881 ) ) ( not ( = ?auto_200880 ?auto_200882 ) ) ( not ( = ?auto_200880 ?auto_200883 ) ) ( not ( = ?auto_200880 ?auto_200884 ) ) ( not ( = ?auto_200880 ?auto_200885 ) ) ( not ( = ?auto_200880 ?auto_200886 ) ) ( not ( = ?auto_200881 ?auto_200882 ) ) ( not ( = ?auto_200881 ?auto_200883 ) ) ( not ( = ?auto_200881 ?auto_200884 ) ) ( not ( = ?auto_200881 ?auto_200885 ) ) ( not ( = ?auto_200881 ?auto_200886 ) ) ( not ( = ?auto_200882 ?auto_200883 ) ) ( not ( = ?auto_200882 ?auto_200884 ) ) ( not ( = ?auto_200882 ?auto_200885 ) ) ( not ( = ?auto_200882 ?auto_200886 ) ) ( not ( = ?auto_200883 ?auto_200884 ) ) ( not ( = ?auto_200883 ?auto_200885 ) ) ( not ( = ?auto_200883 ?auto_200886 ) ) ( not ( = ?auto_200884 ?auto_200885 ) ) ( not ( = ?auto_200884 ?auto_200886 ) ) ( not ( = ?auto_200885 ?auto_200886 ) ) ( CLEAR ?auto_200883 ) ( ON ?auto_200884 ?auto_200885 ) ( CLEAR ?auto_200884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_200877 ?auto_200878 ?auto_200879 ?auto_200880 ?auto_200881 ?auto_200882 ?auto_200883 ?auto_200884 )
      ( MAKE-9PILE ?auto_200877 ?auto_200878 ?auto_200879 ?auto_200880 ?auto_200881 ?auto_200882 ?auto_200883 ?auto_200884 ?auto_200885 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_200915 - BLOCK
      ?auto_200916 - BLOCK
      ?auto_200917 - BLOCK
      ?auto_200918 - BLOCK
      ?auto_200919 - BLOCK
      ?auto_200920 - BLOCK
      ?auto_200921 - BLOCK
      ?auto_200922 - BLOCK
      ?auto_200923 - BLOCK
    )
    :vars
    (
      ?auto_200924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200923 ?auto_200924 ) ( ON-TABLE ?auto_200915 ) ( ON ?auto_200916 ?auto_200915 ) ( ON ?auto_200917 ?auto_200916 ) ( ON ?auto_200918 ?auto_200917 ) ( ON ?auto_200919 ?auto_200918 ) ( ON ?auto_200920 ?auto_200919 ) ( not ( = ?auto_200915 ?auto_200916 ) ) ( not ( = ?auto_200915 ?auto_200917 ) ) ( not ( = ?auto_200915 ?auto_200918 ) ) ( not ( = ?auto_200915 ?auto_200919 ) ) ( not ( = ?auto_200915 ?auto_200920 ) ) ( not ( = ?auto_200915 ?auto_200921 ) ) ( not ( = ?auto_200915 ?auto_200922 ) ) ( not ( = ?auto_200915 ?auto_200923 ) ) ( not ( = ?auto_200915 ?auto_200924 ) ) ( not ( = ?auto_200916 ?auto_200917 ) ) ( not ( = ?auto_200916 ?auto_200918 ) ) ( not ( = ?auto_200916 ?auto_200919 ) ) ( not ( = ?auto_200916 ?auto_200920 ) ) ( not ( = ?auto_200916 ?auto_200921 ) ) ( not ( = ?auto_200916 ?auto_200922 ) ) ( not ( = ?auto_200916 ?auto_200923 ) ) ( not ( = ?auto_200916 ?auto_200924 ) ) ( not ( = ?auto_200917 ?auto_200918 ) ) ( not ( = ?auto_200917 ?auto_200919 ) ) ( not ( = ?auto_200917 ?auto_200920 ) ) ( not ( = ?auto_200917 ?auto_200921 ) ) ( not ( = ?auto_200917 ?auto_200922 ) ) ( not ( = ?auto_200917 ?auto_200923 ) ) ( not ( = ?auto_200917 ?auto_200924 ) ) ( not ( = ?auto_200918 ?auto_200919 ) ) ( not ( = ?auto_200918 ?auto_200920 ) ) ( not ( = ?auto_200918 ?auto_200921 ) ) ( not ( = ?auto_200918 ?auto_200922 ) ) ( not ( = ?auto_200918 ?auto_200923 ) ) ( not ( = ?auto_200918 ?auto_200924 ) ) ( not ( = ?auto_200919 ?auto_200920 ) ) ( not ( = ?auto_200919 ?auto_200921 ) ) ( not ( = ?auto_200919 ?auto_200922 ) ) ( not ( = ?auto_200919 ?auto_200923 ) ) ( not ( = ?auto_200919 ?auto_200924 ) ) ( not ( = ?auto_200920 ?auto_200921 ) ) ( not ( = ?auto_200920 ?auto_200922 ) ) ( not ( = ?auto_200920 ?auto_200923 ) ) ( not ( = ?auto_200920 ?auto_200924 ) ) ( not ( = ?auto_200921 ?auto_200922 ) ) ( not ( = ?auto_200921 ?auto_200923 ) ) ( not ( = ?auto_200921 ?auto_200924 ) ) ( not ( = ?auto_200922 ?auto_200923 ) ) ( not ( = ?auto_200922 ?auto_200924 ) ) ( not ( = ?auto_200923 ?auto_200924 ) ) ( ON ?auto_200922 ?auto_200923 ) ( CLEAR ?auto_200920 ) ( ON ?auto_200921 ?auto_200922 ) ( CLEAR ?auto_200921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_200915 ?auto_200916 ?auto_200917 ?auto_200918 ?auto_200919 ?auto_200920 ?auto_200921 )
      ( MAKE-9PILE ?auto_200915 ?auto_200916 ?auto_200917 ?auto_200918 ?auto_200919 ?auto_200920 ?auto_200921 ?auto_200922 ?auto_200923 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_200953 - BLOCK
      ?auto_200954 - BLOCK
      ?auto_200955 - BLOCK
      ?auto_200956 - BLOCK
      ?auto_200957 - BLOCK
      ?auto_200958 - BLOCK
      ?auto_200959 - BLOCK
      ?auto_200960 - BLOCK
      ?auto_200961 - BLOCK
    )
    :vars
    (
      ?auto_200962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200961 ?auto_200962 ) ( ON-TABLE ?auto_200953 ) ( ON ?auto_200954 ?auto_200953 ) ( ON ?auto_200955 ?auto_200954 ) ( ON ?auto_200956 ?auto_200955 ) ( ON ?auto_200957 ?auto_200956 ) ( not ( = ?auto_200953 ?auto_200954 ) ) ( not ( = ?auto_200953 ?auto_200955 ) ) ( not ( = ?auto_200953 ?auto_200956 ) ) ( not ( = ?auto_200953 ?auto_200957 ) ) ( not ( = ?auto_200953 ?auto_200958 ) ) ( not ( = ?auto_200953 ?auto_200959 ) ) ( not ( = ?auto_200953 ?auto_200960 ) ) ( not ( = ?auto_200953 ?auto_200961 ) ) ( not ( = ?auto_200953 ?auto_200962 ) ) ( not ( = ?auto_200954 ?auto_200955 ) ) ( not ( = ?auto_200954 ?auto_200956 ) ) ( not ( = ?auto_200954 ?auto_200957 ) ) ( not ( = ?auto_200954 ?auto_200958 ) ) ( not ( = ?auto_200954 ?auto_200959 ) ) ( not ( = ?auto_200954 ?auto_200960 ) ) ( not ( = ?auto_200954 ?auto_200961 ) ) ( not ( = ?auto_200954 ?auto_200962 ) ) ( not ( = ?auto_200955 ?auto_200956 ) ) ( not ( = ?auto_200955 ?auto_200957 ) ) ( not ( = ?auto_200955 ?auto_200958 ) ) ( not ( = ?auto_200955 ?auto_200959 ) ) ( not ( = ?auto_200955 ?auto_200960 ) ) ( not ( = ?auto_200955 ?auto_200961 ) ) ( not ( = ?auto_200955 ?auto_200962 ) ) ( not ( = ?auto_200956 ?auto_200957 ) ) ( not ( = ?auto_200956 ?auto_200958 ) ) ( not ( = ?auto_200956 ?auto_200959 ) ) ( not ( = ?auto_200956 ?auto_200960 ) ) ( not ( = ?auto_200956 ?auto_200961 ) ) ( not ( = ?auto_200956 ?auto_200962 ) ) ( not ( = ?auto_200957 ?auto_200958 ) ) ( not ( = ?auto_200957 ?auto_200959 ) ) ( not ( = ?auto_200957 ?auto_200960 ) ) ( not ( = ?auto_200957 ?auto_200961 ) ) ( not ( = ?auto_200957 ?auto_200962 ) ) ( not ( = ?auto_200958 ?auto_200959 ) ) ( not ( = ?auto_200958 ?auto_200960 ) ) ( not ( = ?auto_200958 ?auto_200961 ) ) ( not ( = ?auto_200958 ?auto_200962 ) ) ( not ( = ?auto_200959 ?auto_200960 ) ) ( not ( = ?auto_200959 ?auto_200961 ) ) ( not ( = ?auto_200959 ?auto_200962 ) ) ( not ( = ?auto_200960 ?auto_200961 ) ) ( not ( = ?auto_200960 ?auto_200962 ) ) ( not ( = ?auto_200961 ?auto_200962 ) ) ( ON ?auto_200960 ?auto_200961 ) ( ON ?auto_200959 ?auto_200960 ) ( CLEAR ?auto_200957 ) ( ON ?auto_200958 ?auto_200959 ) ( CLEAR ?auto_200958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_200953 ?auto_200954 ?auto_200955 ?auto_200956 ?auto_200957 ?auto_200958 )
      ( MAKE-9PILE ?auto_200953 ?auto_200954 ?auto_200955 ?auto_200956 ?auto_200957 ?auto_200958 ?auto_200959 ?auto_200960 ?auto_200961 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_200991 - BLOCK
      ?auto_200992 - BLOCK
      ?auto_200993 - BLOCK
      ?auto_200994 - BLOCK
      ?auto_200995 - BLOCK
      ?auto_200996 - BLOCK
      ?auto_200997 - BLOCK
      ?auto_200998 - BLOCK
      ?auto_200999 - BLOCK
    )
    :vars
    (
      ?auto_201000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200999 ?auto_201000 ) ( ON-TABLE ?auto_200991 ) ( ON ?auto_200992 ?auto_200991 ) ( ON ?auto_200993 ?auto_200992 ) ( ON ?auto_200994 ?auto_200993 ) ( not ( = ?auto_200991 ?auto_200992 ) ) ( not ( = ?auto_200991 ?auto_200993 ) ) ( not ( = ?auto_200991 ?auto_200994 ) ) ( not ( = ?auto_200991 ?auto_200995 ) ) ( not ( = ?auto_200991 ?auto_200996 ) ) ( not ( = ?auto_200991 ?auto_200997 ) ) ( not ( = ?auto_200991 ?auto_200998 ) ) ( not ( = ?auto_200991 ?auto_200999 ) ) ( not ( = ?auto_200991 ?auto_201000 ) ) ( not ( = ?auto_200992 ?auto_200993 ) ) ( not ( = ?auto_200992 ?auto_200994 ) ) ( not ( = ?auto_200992 ?auto_200995 ) ) ( not ( = ?auto_200992 ?auto_200996 ) ) ( not ( = ?auto_200992 ?auto_200997 ) ) ( not ( = ?auto_200992 ?auto_200998 ) ) ( not ( = ?auto_200992 ?auto_200999 ) ) ( not ( = ?auto_200992 ?auto_201000 ) ) ( not ( = ?auto_200993 ?auto_200994 ) ) ( not ( = ?auto_200993 ?auto_200995 ) ) ( not ( = ?auto_200993 ?auto_200996 ) ) ( not ( = ?auto_200993 ?auto_200997 ) ) ( not ( = ?auto_200993 ?auto_200998 ) ) ( not ( = ?auto_200993 ?auto_200999 ) ) ( not ( = ?auto_200993 ?auto_201000 ) ) ( not ( = ?auto_200994 ?auto_200995 ) ) ( not ( = ?auto_200994 ?auto_200996 ) ) ( not ( = ?auto_200994 ?auto_200997 ) ) ( not ( = ?auto_200994 ?auto_200998 ) ) ( not ( = ?auto_200994 ?auto_200999 ) ) ( not ( = ?auto_200994 ?auto_201000 ) ) ( not ( = ?auto_200995 ?auto_200996 ) ) ( not ( = ?auto_200995 ?auto_200997 ) ) ( not ( = ?auto_200995 ?auto_200998 ) ) ( not ( = ?auto_200995 ?auto_200999 ) ) ( not ( = ?auto_200995 ?auto_201000 ) ) ( not ( = ?auto_200996 ?auto_200997 ) ) ( not ( = ?auto_200996 ?auto_200998 ) ) ( not ( = ?auto_200996 ?auto_200999 ) ) ( not ( = ?auto_200996 ?auto_201000 ) ) ( not ( = ?auto_200997 ?auto_200998 ) ) ( not ( = ?auto_200997 ?auto_200999 ) ) ( not ( = ?auto_200997 ?auto_201000 ) ) ( not ( = ?auto_200998 ?auto_200999 ) ) ( not ( = ?auto_200998 ?auto_201000 ) ) ( not ( = ?auto_200999 ?auto_201000 ) ) ( ON ?auto_200998 ?auto_200999 ) ( ON ?auto_200997 ?auto_200998 ) ( ON ?auto_200996 ?auto_200997 ) ( CLEAR ?auto_200994 ) ( ON ?auto_200995 ?auto_200996 ) ( CLEAR ?auto_200995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_200991 ?auto_200992 ?auto_200993 ?auto_200994 ?auto_200995 )
      ( MAKE-9PILE ?auto_200991 ?auto_200992 ?auto_200993 ?auto_200994 ?auto_200995 ?auto_200996 ?auto_200997 ?auto_200998 ?auto_200999 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_201029 - BLOCK
      ?auto_201030 - BLOCK
      ?auto_201031 - BLOCK
      ?auto_201032 - BLOCK
      ?auto_201033 - BLOCK
      ?auto_201034 - BLOCK
      ?auto_201035 - BLOCK
      ?auto_201036 - BLOCK
      ?auto_201037 - BLOCK
    )
    :vars
    (
      ?auto_201038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201037 ?auto_201038 ) ( ON-TABLE ?auto_201029 ) ( ON ?auto_201030 ?auto_201029 ) ( ON ?auto_201031 ?auto_201030 ) ( not ( = ?auto_201029 ?auto_201030 ) ) ( not ( = ?auto_201029 ?auto_201031 ) ) ( not ( = ?auto_201029 ?auto_201032 ) ) ( not ( = ?auto_201029 ?auto_201033 ) ) ( not ( = ?auto_201029 ?auto_201034 ) ) ( not ( = ?auto_201029 ?auto_201035 ) ) ( not ( = ?auto_201029 ?auto_201036 ) ) ( not ( = ?auto_201029 ?auto_201037 ) ) ( not ( = ?auto_201029 ?auto_201038 ) ) ( not ( = ?auto_201030 ?auto_201031 ) ) ( not ( = ?auto_201030 ?auto_201032 ) ) ( not ( = ?auto_201030 ?auto_201033 ) ) ( not ( = ?auto_201030 ?auto_201034 ) ) ( not ( = ?auto_201030 ?auto_201035 ) ) ( not ( = ?auto_201030 ?auto_201036 ) ) ( not ( = ?auto_201030 ?auto_201037 ) ) ( not ( = ?auto_201030 ?auto_201038 ) ) ( not ( = ?auto_201031 ?auto_201032 ) ) ( not ( = ?auto_201031 ?auto_201033 ) ) ( not ( = ?auto_201031 ?auto_201034 ) ) ( not ( = ?auto_201031 ?auto_201035 ) ) ( not ( = ?auto_201031 ?auto_201036 ) ) ( not ( = ?auto_201031 ?auto_201037 ) ) ( not ( = ?auto_201031 ?auto_201038 ) ) ( not ( = ?auto_201032 ?auto_201033 ) ) ( not ( = ?auto_201032 ?auto_201034 ) ) ( not ( = ?auto_201032 ?auto_201035 ) ) ( not ( = ?auto_201032 ?auto_201036 ) ) ( not ( = ?auto_201032 ?auto_201037 ) ) ( not ( = ?auto_201032 ?auto_201038 ) ) ( not ( = ?auto_201033 ?auto_201034 ) ) ( not ( = ?auto_201033 ?auto_201035 ) ) ( not ( = ?auto_201033 ?auto_201036 ) ) ( not ( = ?auto_201033 ?auto_201037 ) ) ( not ( = ?auto_201033 ?auto_201038 ) ) ( not ( = ?auto_201034 ?auto_201035 ) ) ( not ( = ?auto_201034 ?auto_201036 ) ) ( not ( = ?auto_201034 ?auto_201037 ) ) ( not ( = ?auto_201034 ?auto_201038 ) ) ( not ( = ?auto_201035 ?auto_201036 ) ) ( not ( = ?auto_201035 ?auto_201037 ) ) ( not ( = ?auto_201035 ?auto_201038 ) ) ( not ( = ?auto_201036 ?auto_201037 ) ) ( not ( = ?auto_201036 ?auto_201038 ) ) ( not ( = ?auto_201037 ?auto_201038 ) ) ( ON ?auto_201036 ?auto_201037 ) ( ON ?auto_201035 ?auto_201036 ) ( ON ?auto_201034 ?auto_201035 ) ( ON ?auto_201033 ?auto_201034 ) ( CLEAR ?auto_201031 ) ( ON ?auto_201032 ?auto_201033 ) ( CLEAR ?auto_201032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_201029 ?auto_201030 ?auto_201031 ?auto_201032 )
      ( MAKE-9PILE ?auto_201029 ?auto_201030 ?auto_201031 ?auto_201032 ?auto_201033 ?auto_201034 ?auto_201035 ?auto_201036 ?auto_201037 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_201067 - BLOCK
      ?auto_201068 - BLOCK
      ?auto_201069 - BLOCK
      ?auto_201070 - BLOCK
      ?auto_201071 - BLOCK
      ?auto_201072 - BLOCK
      ?auto_201073 - BLOCK
      ?auto_201074 - BLOCK
      ?auto_201075 - BLOCK
    )
    :vars
    (
      ?auto_201076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201075 ?auto_201076 ) ( ON-TABLE ?auto_201067 ) ( ON ?auto_201068 ?auto_201067 ) ( not ( = ?auto_201067 ?auto_201068 ) ) ( not ( = ?auto_201067 ?auto_201069 ) ) ( not ( = ?auto_201067 ?auto_201070 ) ) ( not ( = ?auto_201067 ?auto_201071 ) ) ( not ( = ?auto_201067 ?auto_201072 ) ) ( not ( = ?auto_201067 ?auto_201073 ) ) ( not ( = ?auto_201067 ?auto_201074 ) ) ( not ( = ?auto_201067 ?auto_201075 ) ) ( not ( = ?auto_201067 ?auto_201076 ) ) ( not ( = ?auto_201068 ?auto_201069 ) ) ( not ( = ?auto_201068 ?auto_201070 ) ) ( not ( = ?auto_201068 ?auto_201071 ) ) ( not ( = ?auto_201068 ?auto_201072 ) ) ( not ( = ?auto_201068 ?auto_201073 ) ) ( not ( = ?auto_201068 ?auto_201074 ) ) ( not ( = ?auto_201068 ?auto_201075 ) ) ( not ( = ?auto_201068 ?auto_201076 ) ) ( not ( = ?auto_201069 ?auto_201070 ) ) ( not ( = ?auto_201069 ?auto_201071 ) ) ( not ( = ?auto_201069 ?auto_201072 ) ) ( not ( = ?auto_201069 ?auto_201073 ) ) ( not ( = ?auto_201069 ?auto_201074 ) ) ( not ( = ?auto_201069 ?auto_201075 ) ) ( not ( = ?auto_201069 ?auto_201076 ) ) ( not ( = ?auto_201070 ?auto_201071 ) ) ( not ( = ?auto_201070 ?auto_201072 ) ) ( not ( = ?auto_201070 ?auto_201073 ) ) ( not ( = ?auto_201070 ?auto_201074 ) ) ( not ( = ?auto_201070 ?auto_201075 ) ) ( not ( = ?auto_201070 ?auto_201076 ) ) ( not ( = ?auto_201071 ?auto_201072 ) ) ( not ( = ?auto_201071 ?auto_201073 ) ) ( not ( = ?auto_201071 ?auto_201074 ) ) ( not ( = ?auto_201071 ?auto_201075 ) ) ( not ( = ?auto_201071 ?auto_201076 ) ) ( not ( = ?auto_201072 ?auto_201073 ) ) ( not ( = ?auto_201072 ?auto_201074 ) ) ( not ( = ?auto_201072 ?auto_201075 ) ) ( not ( = ?auto_201072 ?auto_201076 ) ) ( not ( = ?auto_201073 ?auto_201074 ) ) ( not ( = ?auto_201073 ?auto_201075 ) ) ( not ( = ?auto_201073 ?auto_201076 ) ) ( not ( = ?auto_201074 ?auto_201075 ) ) ( not ( = ?auto_201074 ?auto_201076 ) ) ( not ( = ?auto_201075 ?auto_201076 ) ) ( ON ?auto_201074 ?auto_201075 ) ( ON ?auto_201073 ?auto_201074 ) ( ON ?auto_201072 ?auto_201073 ) ( ON ?auto_201071 ?auto_201072 ) ( ON ?auto_201070 ?auto_201071 ) ( CLEAR ?auto_201068 ) ( ON ?auto_201069 ?auto_201070 ) ( CLEAR ?auto_201069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_201067 ?auto_201068 ?auto_201069 )
      ( MAKE-9PILE ?auto_201067 ?auto_201068 ?auto_201069 ?auto_201070 ?auto_201071 ?auto_201072 ?auto_201073 ?auto_201074 ?auto_201075 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_201105 - BLOCK
      ?auto_201106 - BLOCK
      ?auto_201107 - BLOCK
      ?auto_201108 - BLOCK
      ?auto_201109 - BLOCK
      ?auto_201110 - BLOCK
      ?auto_201111 - BLOCK
      ?auto_201112 - BLOCK
      ?auto_201113 - BLOCK
    )
    :vars
    (
      ?auto_201114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201113 ?auto_201114 ) ( ON-TABLE ?auto_201105 ) ( not ( = ?auto_201105 ?auto_201106 ) ) ( not ( = ?auto_201105 ?auto_201107 ) ) ( not ( = ?auto_201105 ?auto_201108 ) ) ( not ( = ?auto_201105 ?auto_201109 ) ) ( not ( = ?auto_201105 ?auto_201110 ) ) ( not ( = ?auto_201105 ?auto_201111 ) ) ( not ( = ?auto_201105 ?auto_201112 ) ) ( not ( = ?auto_201105 ?auto_201113 ) ) ( not ( = ?auto_201105 ?auto_201114 ) ) ( not ( = ?auto_201106 ?auto_201107 ) ) ( not ( = ?auto_201106 ?auto_201108 ) ) ( not ( = ?auto_201106 ?auto_201109 ) ) ( not ( = ?auto_201106 ?auto_201110 ) ) ( not ( = ?auto_201106 ?auto_201111 ) ) ( not ( = ?auto_201106 ?auto_201112 ) ) ( not ( = ?auto_201106 ?auto_201113 ) ) ( not ( = ?auto_201106 ?auto_201114 ) ) ( not ( = ?auto_201107 ?auto_201108 ) ) ( not ( = ?auto_201107 ?auto_201109 ) ) ( not ( = ?auto_201107 ?auto_201110 ) ) ( not ( = ?auto_201107 ?auto_201111 ) ) ( not ( = ?auto_201107 ?auto_201112 ) ) ( not ( = ?auto_201107 ?auto_201113 ) ) ( not ( = ?auto_201107 ?auto_201114 ) ) ( not ( = ?auto_201108 ?auto_201109 ) ) ( not ( = ?auto_201108 ?auto_201110 ) ) ( not ( = ?auto_201108 ?auto_201111 ) ) ( not ( = ?auto_201108 ?auto_201112 ) ) ( not ( = ?auto_201108 ?auto_201113 ) ) ( not ( = ?auto_201108 ?auto_201114 ) ) ( not ( = ?auto_201109 ?auto_201110 ) ) ( not ( = ?auto_201109 ?auto_201111 ) ) ( not ( = ?auto_201109 ?auto_201112 ) ) ( not ( = ?auto_201109 ?auto_201113 ) ) ( not ( = ?auto_201109 ?auto_201114 ) ) ( not ( = ?auto_201110 ?auto_201111 ) ) ( not ( = ?auto_201110 ?auto_201112 ) ) ( not ( = ?auto_201110 ?auto_201113 ) ) ( not ( = ?auto_201110 ?auto_201114 ) ) ( not ( = ?auto_201111 ?auto_201112 ) ) ( not ( = ?auto_201111 ?auto_201113 ) ) ( not ( = ?auto_201111 ?auto_201114 ) ) ( not ( = ?auto_201112 ?auto_201113 ) ) ( not ( = ?auto_201112 ?auto_201114 ) ) ( not ( = ?auto_201113 ?auto_201114 ) ) ( ON ?auto_201112 ?auto_201113 ) ( ON ?auto_201111 ?auto_201112 ) ( ON ?auto_201110 ?auto_201111 ) ( ON ?auto_201109 ?auto_201110 ) ( ON ?auto_201108 ?auto_201109 ) ( ON ?auto_201107 ?auto_201108 ) ( CLEAR ?auto_201105 ) ( ON ?auto_201106 ?auto_201107 ) ( CLEAR ?auto_201106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_201105 ?auto_201106 )
      ( MAKE-9PILE ?auto_201105 ?auto_201106 ?auto_201107 ?auto_201108 ?auto_201109 ?auto_201110 ?auto_201111 ?auto_201112 ?auto_201113 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_201143 - BLOCK
      ?auto_201144 - BLOCK
      ?auto_201145 - BLOCK
      ?auto_201146 - BLOCK
      ?auto_201147 - BLOCK
      ?auto_201148 - BLOCK
      ?auto_201149 - BLOCK
      ?auto_201150 - BLOCK
      ?auto_201151 - BLOCK
    )
    :vars
    (
      ?auto_201152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201151 ?auto_201152 ) ( not ( = ?auto_201143 ?auto_201144 ) ) ( not ( = ?auto_201143 ?auto_201145 ) ) ( not ( = ?auto_201143 ?auto_201146 ) ) ( not ( = ?auto_201143 ?auto_201147 ) ) ( not ( = ?auto_201143 ?auto_201148 ) ) ( not ( = ?auto_201143 ?auto_201149 ) ) ( not ( = ?auto_201143 ?auto_201150 ) ) ( not ( = ?auto_201143 ?auto_201151 ) ) ( not ( = ?auto_201143 ?auto_201152 ) ) ( not ( = ?auto_201144 ?auto_201145 ) ) ( not ( = ?auto_201144 ?auto_201146 ) ) ( not ( = ?auto_201144 ?auto_201147 ) ) ( not ( = ?auto_201144 ?auto_201148 ) ) ( not ( = ?auto_201144 ?auto_201149 ) ) ( not ( = ?auto_201144 ?auto_201150 ) ) ( not ( = ?auto_201144 ?auto_201151 ) ) ( not ( = ?auto_201144 ?auto_201152 ) ) ( not ( = ?auto_201145 ?auto_201146 ) ) ( not ( = ?auto_201145 ?auto_201147 ) ) ( not ( = ?auto_201145 ?auto_201148 ) ) ( not ( = ?auto_201145 ?auto_201149 ) ) ( not ( = ?auto_201145 ?auto_201150 ) ) ( not ( = ?auto_201145 ?auto_201151 ) ) ( not ( = ?auto_201145 ?auto_201152 ) ) ( not ( = ?auto_201146 ?auto_201147 ) ) ( not ( = ?auto_201146 ?auto_201148 ) ) ( not ( = ?auto_201146 ?auto_201149 ) ) ( not ( = ?auto_201146 ?auto_201150 ) ) ( not ( = ?auto_201146 ?auto_201151 ) ) ( not ( = ?auto_201146 ?auto_201152 ) ) ( not ( = ?auto_201147 ?auto_201148 ) ) ( not ( = ?auto_201147 ?auto_201149 ) ) ( not ( = ?auto_201147 ?auto_201150 ) ) ( not ( = ?auto_201147 ?auto_201151 ) ) ( not ( = ?auto_201147 ?auto_201152 ) ) ( not ( = ?auto_201148 ?auto_201149 ) ) ( not ( = ?auto_201148 ?auto_201150 ) ) ( not ( = ?auto_201148 ?auto_201151 ) ) ( not ( = ?auto_201148 ?auto_201152 ) ) ( not ( = ?auto_201149 ?auto_201150 ) ) ( not ( = ?auto_201149 ?auto_201151 ) ) ( not ( = ?auto_201149 ?auto_201152 ) ) ( not ( = ?auto_201150 ?auto_201151 ) ) ( not ( = ?auto_201150 ?auto_201152 ) ) ( not ( = ?auto_201151 ?auto_201152 ) ) ( ON ?auto_201150 ?auto_201151 ) ( ON ?auto_201149 ?auto_201150 ) ( ON ?auto_201148 ?auto_201149 ) ( ON ?auto_201147 ?auto_201148 ) ( ON ?auto_201146 ?auto_201147 ) ( ON ?auto_201145 ?auto_201146 ) ( ON ?auto_201144 ?auto_201145 ) ( ON ?auto_201143 ?auto_201144 ) ( CLEAR ?auto_201143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_201143 )
      ( MAKE-9PILE ?auto_201143 ?auto_201144 ?auto_201145 ?auto_201146 ?auto_201147 ?auto_201148 ?auto_201149 ?auto_201150 ?auto_201151 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_201182 - BLOCK
      ?auto_201183 - BLOCK
      ?auto_201184 - BLOCK
      ?auto_201185 - BLOCK
      ?auto_201186 - BLOCK
      ?auto_201187 - BLOCK
      ?auto_201188 - BLOCK
      ?auto_201189 - BLOCK
      ?auto_201190 - BLOCK
      ?auto_201191 - BLOCK
    )
    :vars
    (
      ?auto_201192 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_201190 ) ( ON ?auto_201191 ?auto_201192 ) ( CLEAR ?auto_201191 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_201182 ) ( ON ?auto_201183 ?auto_201182 ) ( ON ?auto_201184 ?auto_201183 ) ( ON ?auto_201185 ?auto_201184 ) ( ON ?auto_201186 ?auto_201185 ) ( ON ?auto_201187 ?auto_201186 ) ( ON ?auto_201188 ?auto_201187 ) ( ON ?auto_201189 ?auto_201188 ) ( ON ?auto_201190 ?auto_201189 ) ( not ( = ?auto_201182 ?auto_201183 ) ) ( not ( = ?auto_201182 ?auto_201184 ) ) ( not ( = ?auto_201182 ?auto_201185 ) ) ( not ( = ?auto_201182 ?auto_201186 ) ) ( not ( = ?auto_201182 ?auto_201187 ) ) ( not ( = ?auto_201182 ?auto_201188 ) ) ( not ( = ?auto_201182 ?auto_201189 ) ) ( not ( = ?auto_201182 ?auto_201190 ) ) ( not ( = ?auto_201182 ?auto_201191 ) ) ( not ( = ?auto_201182 ?auto_201192 ) ) ( not ( = ?auto_201183 ?auto_201184 ) ) ( not ( = ?auto_201183 ?auto_201185 ) ) ( not ( = ?auto_201183 ?auto_201186 ) ) ( not ( = ?auto_201183 ?auto_201187 ) ) ( not ( = ?auto_201183 ?auto_201188 ) ) ( not ( = ?auto_201183 ?auto_201189 ) ) ( not ( = ?auto_201183 ?auto_201190 ) ) ( not ( = ?auto_201183 ?auto_201191 ) ) ( not ( = ?auto_201183 ?auto_201192 ) ) ( not ( = ?auto_201184 ?auto_201185 ) ) ( not ( = ?auto_201184 ?auto_201186 ) ) ( not ( = ?auto_201184 ?auto_201187 ) ) ( not ( = ?auto_201184 ?auto_201188 ) ) ( not ( = ?auto_201184 ?auto_201189 ) ) ( not ( = ?auto_201184 ?auto_201190 ) ) ( not ( = ?auto_201184 ?auto_201191 ) ) ( not ( = ?auto_201184 ?auto_201192 ) ) ( not ( = ?auto_201185 ?auto_201186 ) ) ( not ( = ?auto_201185 ?auto_201187 ) ) ( not ( = ?auto_201185 ?auto_201188 ) ) ( not ( = ?auto_201185 ?auto_201189 ) ) ( not ( = ?auto_201185 ?auto_201190 ) ) ( not ( = ?auto_201185 ?auto_201191 ) ) ( not ( = ?auto_201185 ?auto_201192 ) ) ( not ( = ?auto_201186 ?auto_201187 ) ) ( not ( = ?auto_201186 ?auto_201188 ) ) ( not ( = ?auto_201186 ?auto_201189 ) ) ( not ( = ?auto_201186 ?auto_201190 ) ) ( not ( = ?auto_201186 ?auto_201191 ) ) ( not ( = ?auto_201186 ?auto_201192 ) ) ( not ( = ?auto_201187 ?auto_201188 ) ) ( not ( = ?auto_201187 ?auto_201189 ) ) ( not ( = ?auto_201187 ?auto_201190 ) ) ( not ( = ?auto_201187 ?auto_201191 ) ) ( not ( = ?auto_201187 ?auto_201192 ) ) ( not ( = ?auto_201188 ?auto_201189 ) ) ( not ( = ?auto_201188 ?auto_201190 ) ) ( not ( = ?auto_201188 ?auto_201191 ) ) ( not ( = ?auto_201188 ?auto_201192 ) ) ( not ( = ?auto_201189 ?auto_201190 ) ) ( not ( = ?auto_201189 ?auto_201191 ) ) ( not ( = ?auto_201189 ?auto_201192 ) ) ( not ( = ?auto_201190 ?auto_201191 ) ) ( not ( = ?auto_201190 ?auto_201192 ) ) ( not ( = ?auto_201191 ?auto_201192 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_201191 ?auto_201192 )
      ( !STACK ?auto_201191 ?auto_201190 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_201224 - BLOCK
      ?auto_201225 - BLOCK
      ?auto_201226 - BLOCK
      ?auto_201227 - BLOCK
      ?auto_201228 - BLOCK
      ?auto_201229 - BLOCK
      ?auto_201230 - BLOCK
      ?auto_201231 - BLOCK
      ?auto_201232 - BLOCK
      ?auto_201233 - BLOCK
    )
    :vars
    (
      ?auto_201234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201233 ?auto_201234 ) ( ON-TABLE ?auto_201224 ) ( ON ?auto_201225 ?auto_201224 ) ( ON ?auto_201226 ?auto_201225 ) ( ON ?auto_201227 ?auto_201226 ) ( ON ?auto_201228 ?auto_201227 ) ( ON ?auto_201229 ?auto_201228 ) ( ON ?auto_201230 ?auto_201229 ) ( ON ?auto_201231 ?auto_201230 ) ( not ( = ?auto_201224 ?auto_201225 ) ) ( not ( = ?auto_201224 ?auto_201226 ) ) ( not ( = ?auto_201224 ?auto_201227 ) ) ( not ( = ?auto_201224 ?auto_201228 ) ) ( not ( = ?auto_201224 ?auto_201229 ) ) ( not ( = ?auto_201224 ?auto_201230 ) ) ( not ( = ?auto_201224 ?auto_201231 ) ) ( not ( = ?auto_201224 ?auto_201232 ) ) ( not ( = ?auto_201224 ?auto_201233 ) ) ( not ( = ?auto_201224 ?auto_201234 ) ) ( not ( = ?auto_201225 ?auto_201226 ) ) ( not ( = ?auto_201225 ?auto_201227 ) ) ( not ( = ?auto_201225 ?auto_201228 ) ) ( not ( = ?auto_201225 ?auto_201229 ) ) ( not ( = ?auto_201225 ?auto_201230 ) ) ( not ( = ?auto_201225 ?auto_201231 ) ) ( not ( = ?auto_201225 ?auto_201232 ) ) ( not ( = ?auto_201225 ?auto_201233 ) ) ( not ( = ?auto_201225 ?auto_201234 ) ) ( not ( = ?auto_201226 ?auto_201227 ) ) ( not ( = ?auto_201226 ?auto_201228 ) ) ( not ( = ?auto_201226 ?auto_201229 ) ) ( not ( = ?auto_201226 ?auto_201230 ) ) ( not ( = ?auto_201226 ?auto_201231 ) ) ( not ( = ?auto_201226 ?auto_201232 ) ) ( not ( = ?auto_201226 ?auto_201233 ) ) ( not ( = ?auto_201226 ?auto_201234 ) ) ( not ( = ?auto_201227 ?auto_201228 ) ) ( not ( = ?auto_201227 ?auto_201229 ) ) ( not ( = ?auto_201227 ?auto_201230 ) ) ( not ( = ?auto_201227 ?auto_201231 ) ) ( not ( = ?auto_201227 ?auto_201232 ) ) ( not ( = ?auto_201227 ?auto_201233 ) ) ( not ( = ?auto_201227 ?auto_201234 ) ) ( not ( = ?auto_201228 ?auto_201229 ) ) ( not ( = ?auto_201228 ?auto_201230 ) ) ( not ( = ?auto_201228 ?auto_201231 ) ) ( not ( = ?auto_201228 ?auto_201232 ) ) ( not ( = ?auto_201228 ?auto_201233 ) ) ( not ( = ?auto_201228 ?auto_201234 ) ) ( not ( = ?auto_201229 ?auto_201230 ) ) ( not ( = ?auto_201229 ?auto_201231 ) ) ( not ( = ?auto_201229 ?auto_201232 ) ) ( not ( = ?auto_201229 ?auto_201233 ) ) ( not ( = ?auto_201229 ?auto_201234 ) ) ( not ( = ?auto_201230 ?auto_201231 ) ) ( not ( = ?auto_201230 ?auto_201232 ) ) ( not ( = ?auto_201230 ?auto_201233 ) ) ( not ( = ?auto_201230 ?auto_201234 ) ) ( not ( = ?auto_201231 ?auto_201232 ) ) ( not ( = ?auto_201231 ?auto_201233 ) ) ( not ( = ?auto_201231 ?auto_201234 ) ) ( not ( = ?auto_201232 ?auto_201233 ) ) ( not ( = ?auto_201232 ?auto_201234 ) ) ( not ( = ?auto_201233 ?auto_201234 ) ) ( CLEAR ?auto_201231 ) ( ON ?auto_201232 ?auto_201233 ) ( CLEAR ?auto_201232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_201224 ?auto_201225 ?auto_201226 ?auto_201227 ?auto_201228 ?auto_201229 ?auto_201230 ?auto_201231 ?auto_201232 )
      ( MAKE-10PILE ?auto_201224 ?auto_201225 ?auto_201226 ?auto_201227 ?auto_201228 ?auto_201229 ?auto_201230 ?auto_201231 ?auto_201232 ?auto_201233 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_201266 - BLOCK
      ?auto_201267 - BLOCK
      ?auto_201268 - BLOCK
      ?auto_201269 - BLOCK
      ?auto_201270 - BLOCK
      ?auto_201271 - BLOCK
      ?auto_201272 - BLOCK
      ?auto_201273 - BLOCK
      ?auto_201274 - BLOCK
      ?auto_201275 - BLOCK
    )
    :vars
    (
      ?auto_201276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201275 ?auto_201276 ) ( ON-TABLE ?auto_201266 ) ( ON ?auto_201267 ?auto_201266 ) ( ON ?auto_201268 ?auto_201267 ) ( ON ?auto_201269 ?auto_201268 ) ( ON ?auto_201270 ?auto_201269 ) ( ON ?auto_201271 ?auto_201270 ) ( ON ?auto_201272 ?auto_201271 ) ( not ( = ?auto_201266 ?auto_201267 ) ) ( not ( = ?auto_201266 ?auto_201268 ) ) ( not ( = ?auto_201266 ?auto_201269 ) ) ( not ( = ?auto_201266 ?auto_201270 ) ) ( not ( = ?auto_201266 ?auto_201271 ) ) ( not ( = ?auto_201266 ?auto_201272 ) ) ( not ( = ?auto_201266 ?auto_201273 ) ) ( not ( = ?auto_201266 ?auto_201274 ) ) ( not ( = ?auto_201266 ?auto_201275 ) ) ( not ( = ?auto_201266 ?auto_201276 ) ) ( not ( = ?auto_201267 ?auto_201268 ) ) ( not ( = ?auto_201267 ?auto_201269 ) ) ( not ( = ?auto_201267 ?auto_201270 ) ) ( not ( = ?auto_201267 ?auto_201271 ) ) ( not ( = ?auto_201267 ?auto_201272 ) ) ( not ( = ?auto_201267 ?auto_201273 ) ) ( not ( = ?auto_201267 ?auto_201274 ) ) ( not ( = ?auto_201267 ?auto_201275 ) ) ( not ( = ?auto_201267 ?auto_201276 ) ) ( not ( = ?auto_201268 ?auto_201269 ) ) ( not ( = ?auto_201268 ?auto_201270 ) ) ( not ( = ?auto_201268 ?auto_201271 ) ) ( not ( = ?auto_201268 ?auto_201272 ) ) ( not ( = ?auto_201268 ?auto_201273 ) ) ( not ( = ?auto_201268 ?auto_201274 ) ) ( not ( = ?auto_201268 ?auto_201275 ) ) ( not ( = ?auto_201268 ?auto_201276 ) ) ( not ( = ?auto_201269 ?auto_201270 ) ) ( not ( = ?auto_201269 ?auto_201271 ) ) ( not ( = ?auto_201269 ?auto_201272 ) ) ( not ( = ?auto_201269 ?auto_201273 ) ) ( not ( = ?auto_201269 ?auto_201274 ) ) ( not ( = ?auto_201269 ?auto_201275 ) ) ( not ( = ?auto_201269 ?auto_201276 ) ) ( not ( = ?auto_201270 ?auto_201271 ) ) ( not ( = ?auto_201270 ?auto_201272 ) ) ( not ( = ?auto_201270 ?auto_201273 ) ) ( not ( = ?auto_201270 ?auto_201274 ) ) ( not ( = ?auto_201270 ?auto_201275 ) ) ( not ( = ?auto_201270 ?auto_201276 ) ) ( not ( = ?auto_201271 ?auto_201272 ) ) ( not ( = ?auto_201271 ?auto_201273 ) ) ( not ( = ?auto_201271 ?auto_201274 ) ) ( not ( = ?auto_201271 ?auto_201275 ) ) ( not ( = ?auto_201271 ?auto_201276 ) ) ( not ( = ?auto_201272 ?auto_201273 ) ) ( not ( = ?auto_201272 ?auto_201274 ) ) ( not ( = ?auto_201272 ?auto_201275 ) ) ( not ( = ?auto_201272 ?auto_201276 ) ) ( not ( = ?auto_201273 ?auto_201274 ) ) ( not ( = ?auto_201273 ?auto_201275 ) ) ( not ( = ?auto_201273 ?auto_201276 ) ) ( not ( = ?auto_201274 ?auto_201275 ) ) ( not ( = ?auto_201274 ?auto_201276 ) ) ( not ( = ?auto_201275 ?auto_201276 ) ) ( ON ?auto_201274 ?auto_201275 ) ( CLEAR ?auto_201272 ) ( ON ?auto_201273 ?auto_201274 ) ( CLEAR ?auto_201273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_201266 ?auto_201267 ?auto_201268 ?auto_201269 ?auto_201270 ?auto_201271 ?auto_201272 ?auto_201273 )
      ( MAKE-10PILE ?auto_201266 ?auto_201267 ?auto_201268 ?auto_201269 ?auto_201270 ?auto_201271 ?auto_201272 ?auto_201273 ?auto_201274 ?auto_201275 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_201308 - BLOCK
      ?auto_201309 - BLOCK
      ?auto_201310 - BLOCK
      ?auto_201311 - BLOCK
      ?auto_201312 - BLOCK
      ?auto_201313 - BLOCK
      ?auto_201314 - BLOCK
      ?auto_201315 - BLOCK
      ?auto_201316 - BLOCK
      ?auto_201317 - BLOCK
    )
    :vars
    (
      ?auto_201318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201317 ?auto_201318 ) ( ON-TABLE ?auto_201308 ) ( ON ?auto_201309 ?auto_201308 ) ( ON ?auto_201310 ?auto_201309 ) ( ON ?auto_201311 ?auto_201310 ) ( ON ?auto_201312 ?auto_201311 ) ( ON ?auto_201313 ?auto_201312 ) ( not ( = ?auto_201308 ?auto_201309 ) ) ( not ( = ?auto_201308 ?auto_201310 ) ) ( not ( = ?auto_201308 ?auto_201311 ) ) ( not ( = ?auto_201308 ?auto_201312 ) ) ( not ( = ?auto_201308 ?auto_201313 ) ) ( not ( = ?auto_201308 ?auto_201314 ) ) ( not ( = ?auto_201308 ?auto_201315 ) ) ( not ( = ?auto_201308 ?auto_201316 ) ) ( not ( = ?auto_201308 ?auto_201317 ) ) ( not ( = ?auto_201308 ?auto_201318 ) ) ( not ( = ?auto_201309 ?auto_201310 ) ) ( not ( = ?auto_201309 ?auto_201311 ) ) ( not ( = ?auto_201309 ?auto_201312 ) ) ( not ( = ?auto_201309 ?auto_201313 ) ) ( not ( = ?auto_201309 ?auto_201314 ) ) ( not ( = ?auto_201309 ?auto_201315 ) ) ( not ( = ?auto_201309 ?auto_201316 ) ) ( not ( = ?auto_201309 ?auto_201317 ) ) ( not ( = ?auto_201309 ?auto_201318 ) ) ( not ( = ?auto_201310 ?auto_201311 ) ) ( not ( = ?auto_201310 ?auto_201312 ) ) ( not ( = ?auto_201310 ?auto_201313 ) ) ( not ( = ?auto_201310 ?auto_201314 ) ) ( not ( = ?auto_201310 ?auto_201315 ) ) ( not ( = ?auto_201310 ?auto_201316 ) ) ( not ( = ?auto_201310 ?auto_201317 ) ) ( not ( = ?auto_201310 ?auto_201318 ) ) ( not ( = ?auto_201311 ?auto_201312 ) ) ( not ( = ?auto_201311 ?auto_201313 ) ) ( not ( = ?auto_201311 ?auto_201314 ) ) ( not ( = ?auto_201311 ?auto_201315 ) ) ( not ( = ?auto_201311 ?auto_201316 ) ) ( not ( = ?auto_201311 ?auto_201317 ) ) ( not ( = ?auto_201311 ?auto_201318 ) ) ( not ( = ?auto_201312 ?auto_201313 ) ) ( not ( = ?auto_201312 ?auto_201314 ) ) ( not ( = ?auto_201312 ?auto_201315 ) ) ( not ( = ?auto_201312 ?auto_201316 ) ) ( not ( = ?auto_201312 ?auto_201317 ) ) ( not ( = ?auto_201312 ?auto_201318 ) ) ( not ( = ?auto_201313 ?auto_201314 ) ) ( not ( = ?auto_201313 ?auto_201315 ) ) ( not ( = ?auto_201313 ?auto_201316 ) ) ( not ( = ?auto_201313 ?auto_201317 ) ) ( not ( = ?auto_201313 ?auto_201318 ) ) ( not ( = ?auto_201314 ?auto_201315 ) ) ( not ( = ?auto_201314 ?auto_201316 ) ) ( not ( = ?auto_201314 ?auto_201317 ) ) ( not ( = ?auto_201314 ?auto_201318 ) ) ( not ( = ?auto_201315 ?auto_201316 ) ) ( not ( = ?auto_201315 ?auto_201317 ) ) ( not ( = ?auto_201315 ?auto_201318 ) ) ( not ( = ?auto_201316 ?auto_201317 ) ) ( not ( = ?auto_201316 ?auto_201318 ) ) ( not ( = ?auto_201317 ?auto_201318 ) ) ( ON ?auto_201316 ?auto_201317 ) ( ON ?auto_201315 ?auto_201316 ) ( CLEAR ?auto_201313 ) ( ON ?auto_201314 ?auto_201315 ) ( CLEAR ?auto_201314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_201308 ?auto_201309 ?auto_201310 ?auto_201311 ?auto_201312 ?auto_201313 ?auto_201314 )
      ( MAKE-10PILE ?auto_201308 ?auto_201309 ?auto_201310 ?auto_201311 ?auto_201312 ?auto_201313 ?auto_201314 ?auto_201315 ?auto_201316 ?auto_201317 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_201350 - BLOCK
      ?auto_201351 - BLOCK
      ?auto_201352 - BLOCK
      ?auto_201353 - BLOCK
      ?auto_201354 - BLOCK
      ?auto_201355 - BLOCK
      ?auto_201356 - BLOCK
      ?auto_201357 - BLOCK
      ?auto_201358 - BLOCK
      ?auto_201359 - BLOCK
    )
    :vars
    (
      ?auto_201360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201359 ?auto_201360 ) ( ON-TABLE ?auto_201350 ) ( ON ?auto_201351 ?auto_201350 ) ( ON ?auto_201352 ?auto_201351 ) ( ON ?auto_201353 ?auto_201352 ) ( ON ?auto_201354 ?auto_201353 ) ( not ( = ?auto_201350 ?auto_201351 ) ) ( not ( = ?auto_201350 ?auto_201352 ) ) ( not ( = ?auto_201350 ?auto_201353 ) ) ( not ( = ?auto_201350 ?auto_201354 ) ) ( not ( = ?auto_201350 ?auto_201355 ) ) ( not ( = ?auto_201350 ?auto_201356 ) ) ( not ( = ?auto_201350 ?auto_201357 ) ) ( not ( = ?auto_201350 ?auto_201358 ) ) ( not ( = ?auto_201350 ?auto_201359 ) ) ( not ( = ?auto_201350 ?auto_201360 ) ) ( not ( = ?auto_201351 ?auto_201352 ) ) ( not ( = ?auto_201351 ?auto_201353 ) ) ( not ( = ?auto_201351 ?auto_201354 ) ) ( not ( = ?auto_201351 ?auto_201355 ) ) ( not ( = ?auto_201351 ?auto_201356 ) ) ( not ( = ?auto_201351 ?auto_201357 ) ) ( not ( = ?auto_201351 ?auto_201358 ) ) ( not ( = ?auto_201351 ?auto_201359 ) ) ( not ( = ?auto_201351 ?auto_201360 ) ) ( not ( = ?auto_201352 ?auto_201353 ) ) ( not ( = ?auto_201352 ?auto_201354 ) ) ( not ( = ?auto_201352 ?auto_201355 ) ) ( not ( = ?auto_201352 ?auto_201356 ) ) ( not ( = ?auto_201352 ?auto_201357 ) ) ( not ( = ?auto_201352 ?auto_201358 ) ) ( not ( = ?auto_201352 ?auto_201359 ) ) ( not ( = ?auto_201352 ?auto_201360 ) ) ( not ( = ?auto_201353 ?auto_201354 ) ) ( not ( = ?auto_201353 ?auto_201355 ) ) ( not ( = ?auto_201353 ?auto_201356 ) ) ( not ( = ?auto_201353 ?auto_201357 ) ) ( not ( = ?auto_201353 ?auto_201358 ) ) ( not ( = ?auto_201353 ?auto_201359 ) ) ( not ( = ?auto_201353 ?auto_201360 ) ) ( not ( = ?auto_201354 ?auto_201355 ) ) ( not ( = ?auto_201354 ?auto_201356 ) ) ( not ( = ?auto_201354 ?auto_201357 ) ) ( not ( = ?auto_201354 ?auto_201358 ) ) ( not ( = ?auto_201354 ?auto_201359 ) ) ( not ( = ?auto_201354 ?auto_201360 ) ) ( not ( = ?auto_201355 ?auto_201356 ) ) ( not ( = ?auto_201355 ?auto_201357 ) ) ( not ( = ?auto_201355 ?auto_201358 ) ) ( not ( = ?auto_201355 ?auto_201359 ) ) ( not ( = ?auto_201355 ?auto_201360 ) ) ( not ( = ?auto_201356 ?auto_201357 ) ) ( not ( = ?auto_201356 ?auto_201358 ) ) ( not ( = ?auto_201356 ?auto_201359 ) ) ( not ( = ?auto_201356 ?auto_201360 ) ) ( not ( = ?auto_201357 ?auto_201358 ) ) ( not ( = ?auto_201357 ?auto_201359 ) ) ( not ( = ?auto_201357 ?auto_201360 ) ) ( not ( = ?auto_201358 ?auto_201359 ) ) ( not ( = ?auto_201358 ?auto_201360 ) ) ( not ( = ?auto_201359 ?auto_201360 ) ) ( ON ?auto_201358 ?auto_201359 ) ( ON ?auto_201357 ?auto_201358 ) ( ON ?auto_201356 ?auto_201357 ) ( CLEAR ?auto_201354 ) ( ON ?auto_201355 ?auto_201356 ) ( CLEAR ?auto_201355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_201350 ?auto_201351 ?auto_201352 ?auto_201353 ?auto_201354 ?auto_201355 )
      ( MAKE-10PILE ?auto_201350 ?auto_201351 ?auto_201352 ?auto_201353 ?auto_201354 ?auto_201355 ?auto_201356 ?auto_201357 ?auto_201358 ?auto_201359 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_201392 - BLOCK
      ?auto_201393 - BLOCK
      ?auto_201394 - BLOCK
      ?auto_201395 - BLOCK
      ?auto_201396 - BLOCK
      ?auto_201397 - BLOCK
      ?auto_201398 - BLOCK
      ?auto_201399 - BLOCK
      ?auto_201400 - BLOCK
      ?auto_201401 - BLOCK
    )
    :vars
    (
      ?auto_201402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201401 ?auto_201402 ) ( ON-TABLE ?auto_201392 ) ( ON ?auto_201393 ?auto_201392 ) ( ON ?auto_201394 ?auto_201393 ) ( ON ?auto_201395 ?auto_201394 ) ( not ( = ?auto_201392 ?auto_201393 ) ) ( not ( = ?auto_201392 ?auto_201394 ) ) ( not ( = ?auto_201392 ?auto_201395 ) ) ( not ( = ?auto_201392 ?auto_201396 ) ) ( not ( = ?auto_201392 ?auto_201397 ) ) ( not ( = ?auto_201392 ?auto_201398 ) ) ( not ( = ?auto_201392 ?auto_201399 ) ) ( not ( = ?auto_201392 ?auto_201400 ) ) ( not ( = ?auto_201392 ?auto_201401 ) ) ( not ( = ?auto_201392 ?auto_201402 ) ) ( not ( = ?auto_201393 ?auto_201394 ) ) ( not ( = ?auto_201393 ?auto_201395 ) ) ( not ( = ?auto_201393 ?auto_201396 ) ) ( not ( = ?auto_201393 ?auto_201397 ) ) ( not ( = ?auto_201393 ?auto_201398 ) ) ( not ( = ?auto_201393 ?auto_201399 ) ) ( not ( = ?auto_201393 ?auto_201400 ) ) ( not ( = ?auto_201393 ?auto_201401 ) ) ( not ( = ?auto_201393 ?auto_201402 ) ) ( not ( = ?auto_201394 ?auto_201395 ) ) ( not ( = ?auto_201394 ?auto_201396 ) ) ( not ( = ?auto_201394 ?auto_201397 ) ) ( not ( = ?auto_201394 ?auto_201398 ) ) ( not ( = ?auto_201394 ?auto_201399 ) ) ( not ( = ?auto_201394 ?auto_201400 ) ) ( not ( = ?auto_201394 ?auto_201401 ) ) ( not ( = ?auto_201394 ?auto_201402 ) ) ( not ( = ?auto_201395 ?auto_201396 ) ) ( not ( = ?auto_201395 ?auto_201397 ) ) ( not ( = ?auto_201395 ?auto_201398 ) ) ( not ( = ?auto_201395 ?auto_201399 ) ) ( not ( = ?auto_201395 ?auto_201400 ) ) ( not ( = ?auto_201395 ?auto_201401 ) ) ( not ( = ?auto_201395 ?auto_201402 ) ) ( not ( = ?auto_201396 ?auto_201397 ) ) ( not ( = ?auto_201396 ?auto_201398 ) ) ( not ( = ?auto_201396 ?auto_201399 ) ) ( not ( = ?auto_201396 ?auto_201400 ) ) ( not ( = ?auto_201396 ?auto_201401 ) ) ( not ( = ?auto_201396 ?auto_201402 ) ) ( not ( = ?auto_201397 ?auto_201398 ) ) ( not ( = ?auto_201397 ?auto_201399 ) ) ( not ( = ?auto_201397 ?auto_201400 ) ) ( not ( = ?auto_201397 ?auto_201401 ) ) ( not ( = ?auto_201397 ?auto_201402 ) ) ( not ( = ?auto_201398 ?auto_201399 ) ) ( not ( = ?auto_201398 ?auto_201400 ) ) ( not ( = ?auto_201398 ?auto_201401 ) ) ( not ( = ?auto_201398 ?auto_201402 ) ) ( not ( = ?auto_201399 ?auto_201400 ) ) ( not ( = ?auto_201399 ?auto_201401 ) ) ( not ( = ?auto_201399 ?auto_201402 ) ) ( not ( = ?auto_201400 ?auto_201401 ) ) ( not ( = ?auto_201400 ?auto_201402 ) ) ( not ( = ?auto_201401 ?auto_201402 ) ) ( ON ?auto_201400 ?auto_201401 ) ( ON ?auto_201399 ?auto_201400 ) ( ON ?auto_201398 ?auto_201399 ) ( ON ?auto_201397 ?auto_201398 ) ( CLEAR ?auto_201395 ) ( ON ?auto_201396 ?auto_201397 ) ( CLEAR ?auto_201396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_201392 ?auto_201393 ?auto_201394 ?auto_201395 ?auto_201396 )
      ( MAKE-10PILE ?auto_201392 ?auto_201393 ?auto_201394 ?auto_201395 ?auto_201396 ?auto_201397 ?auto_201398 ?auto_201399 ?auto_201400 ?auto_201401 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_201434 - BLOCK
      ?auto_201435 - BLOCK
      ?auto_201436 - BLOCK
      ?auto_201437 - BLOCK
      ?auto_201438 - BLOCK
      ?auto_201439 - BLOCK
      ?auto_201440 - BLOCK
      ?auto_201441 - BLOCK
      ?auto_201442 - BLOCK
      ?auto_201443 - BLOCK
    )
    :vars
    (
      ?auto_201444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201443 ?auto_201444 ) ( ON-TABLE ?auto_201434 ) ( ON ?auto_201435 ?auto_201434 ) ( ON ?auto_201436 ?auto_201435 ) ( not ( = ?auto_201434 ?auto_201435 ) ) ( not ( = ?auto_201434 ?auto_201436 ) ) ( not ( = ?auto_201434 ?auto_201437 ) ) ( not ( = ?auto_201434 ?auto_201438 ) ) ( not ( = ?auto_201434 ?auto_201439 ) ) ( not ( = ?auto_201434 ?auto_201440 ) ) ( not ( = ?auto_201434 ?auto_201441 ) ) ( not ( = ?auto_201434 ?auto_201442 ) ) ( not ( = ?auto_201434 ?auto_201443 ) ) ( not ( = ?auto_201434 ?auto_201444 ) ) ( not ( = ?auto_201435 ?auto_201436 ) ) ( not ( = ?auto_201435 ?auto_201437 ) ) ( not ( = ?auto_201435 ?auto_201438 ) ) ( not ( = ?auto_201435 ?auto_201439 ) ) ( not ( = ?auto_201435 ?auto_201440 ) ) ( not ( = ?auto_201435 ?auto_201441 ) ) ( not ( = ?auto_201435 ?auto_201442 ) ) ( not ( = ?auto_201435 ?auto_201443 ) ) ( not ( = ?auto_201435 ?auto_201444 ) ) ( not ( = ?auto_201436 ?auto_201437 ) ) ( not ( = ?auto_201436 ?auto_201438 ) ) ( not ( = ?auto_201436 ?auto_201439 ) ) ( not ( = ?auto_201436 ?auto_201440 ) ) ( not ( = ?auto_201436 ?auto_201441 ) ) ( not ( = ?auto_201436 ?auto_201442 ) ) ( not ( = ?auto_201436 ?auto_201443 ) ) ( not ( = ?auto_201436 ?auto_201444 ) ) ( not ( = ?auto_201437 ?auto_201438 ) ) ( not ( = ?auto_201437 ?auto_201439 ) ) ( not ( = ?auto_201437 ?auto_201440 ) ) ( not ( = ?auto_201437 ?auto_201441 ) ) ( not ( = ?auto_201437 ?auto_201442 ) ) ( not ( = ?auto_201437 ?auto_201443 ) ) ( not ( = ?auto_201437 ?auto_201444 ) ) ( not ( = ?auto_201438 ?auto_201439 ) ) ( not ( = ?auto_201438 ?auto_201440 ) ) ( not ( = ?auto_201438 ?auto_201441 ) ) ( not ( = ?auto_201438 ?auto_201442 ) ) ( not ( = ?auto_201438 ?auto_201443 ) ) ( not ( = ?auto_201438 ?auto_201444 ) ) ( not ( = ?auto_201439 ?auto_201440 ) ) ( not ( = ?auto_201439 ?auto_201441 ) ) ( not ( = ?auto_201439 ?auto_201442 ) ) ( not ( = ?auto_201439 ?auto_201443 ) ) ( not ( = ?auto_201439 ?auto_201444 ) ) ( not ( = ?auto_201440 ?auto_201441 ) ) ( not ( = ?auto_201440 ?auto_201442 ) ) ( not ( = ?auto_201440 ?auto_201443 ) ) ( not ( = ?auto_201440 ?auto_201444 ) ) ( not ( = ?auto_201441 ?auto_201442 ) ) ( not ( = ?auto_201441 ?auto_201443 ) ) ( not ( = ?auto_201441 ?auto_201444 ) ) ( not ( = ?auto_201442 ?auto_201443 ) ) ( not ( = ?auto_201442 ?auto_201444 ) ) ( not ( = ?auto_201443 ?auto_201444 ) ) ( ON ?auto_201442 ?auto_201443 ) ( ON ?auto_201441 ?auto_201442 ) ( ON ?auto_201440 ?auto_201441 ) ( ON ?auto_201439 ?auto_201440 ) ( ON ?auto_201438 ?auto_201439 ) ( CLEAR ?auto_201436 ) ( ON ?auto_201437 ?auto_201438 ) ( CLEAR ?auto_201437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_201434 ?auto_201435 ?auto_201436 ?auto_201437 )
      ( MAKE-10PILE ?auto_201434 ?auto_201435 ?auto_201436 ?auto_201437 ?auto_201438 ?auto_201439 ?auto_201440 ?auto_201441 ?auto_201442 ?auto_201443 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_201476 - BLOCK
      ?auto_201477 - BLOCK
      ?auto_201478 - BLOCK
      ?auto_201479 - BLOCK
      ?auto_201480 - BLOCK
      ?auto_201481 - BLOCK
      ?auto_201482 - BLOCK
      ?auto_201483 - BLOCK
      ?auto_201484 - BLOCK
      ?auto_201485 - BLOCK
    )
    :vars
    (
      ?auto_201486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201485 ?auto_201486 ) ( ON-TABLE ?auto_201476 ) ( ON ?auto_201477 ?auto_201476 ) ( not ( = ?auto_201476 ?auto_201477 ) ) ( not ( = ?auto_201476 ?auto_201478 ) ) ( not ( = ?auto_201476 ?auto_201479 ) ) ( not ( = ?auto_201476 ?auto_201480 ) ) ( not ( = ?auto_201476 ?auto_201481 ) ) ( not ( = ?auto_201476 ?auto_201482 ) ) ( not ( = ?auto_201476 ?auto_201483 ) ) ( not ( = ?auto_201476 ?auto_201484 ) ) ( not ( = ?auto_201476 ?auto_201485 ) ) ( not ( = ?auto_201476 ?auto_201486 ) ) ( not ( = ?auto_201477 ?auto_201478 ) ) ( not ( = ?auto_201477 ?auto_201479 ) ) ( not ( = ?auto_201477 ?auto_201480 ) ) ( not ( = ?auto_201477 ?auto_201481 ) ) ( not ( = ?auto_201477 ?auto_201482 ) ) ( not ( = ?auto_201477 ?auto_201483 ) ) ( not ( = ?auto_201477 ?auto_201484 ) ) ( not ( = ?auto_201477 ?auto_201485 ) ) ( not ( = ?auto_201477 ?auto_201486 ) ) ( not ( = ?auto_201478 ?auto_201479 ) ) ( not ( = ?auto_201478 ?auto_201480 ) ) ( not ( = ?auto_201478 ?auto_201481 ) ) ( not ( = ?auto_201478 ?auto_201482 ) ) ( not ( = ?auto_201478 ?auto_201483 ) ) ( not ( = ?auto_201478 ?auto_201484 ) ) ( not ( = ?auto_201478 ?auto_201485 ) ) ( not ( = ?auto_201478 ?auto_201486 ) ) ( not ( = ?auto_201479 ?auto_201480 ) ) ( not ( = ?auto_201479 ?auto_201481 ) ) ( not ( = ?auto_201479 ?auto_201482 ) ) ( not ( = ?auto_201479 ?auto_201483 ) ) ( not ( = ?auto_201479 ?auto_201484 ) ) ( not ( = ?auto_201479 ?auto_201485 ) ) ( not ( = ?auto_201479 ?auto_201486 ) ) ( not ( = ?auto_201480 ?auto_201481 ) ) ( not ( = ?auto_201480 ?auto_201482 ) ) ( not ( = ?auto_201480 ?auto_201483 ) ) ( not ( = ?auto_201480 ?auto_201484 ) ) ( not ( = ?auto_201480 ?auto_201485 ) ) ( not ( = ?auto_201480 ?auto_201486 ) ) ( not ( = ?auto_201481 ?auto_201482 ) ) ( not ( = ?auto_201481 ?auto_201483 ) ) ( not ( = ?auto_201481 ?auto_201484 ) ) ( not ( = ?auto_201481 ?auto_201485 ) ) ( not ( = ?auto_201481 ?auto_201486 ) ) ( not ( = ?auto_201482 ?auto_201483 ) ) ( not ( = ?auto_201482 ?auto_201484 ) ) ( not ( = ?auto_201482 ?auto_201485 ) ) ( not ( = ?auto_201482 ?auto_201486 ) ) ( not ( = ?auto_201483 ?auto_201484 ) ) ( not ( = ?auto_201483 ?auto_201485 ) ) ( not ( = ?auto_201483 ?auto_201486 ) ) ( not ( = ?auto_201484 ?auto_201485 ) ) ( not ( = ?auto_201484 ?auto_201486 ) ) ( not ( = ?auto_201485 ?auto_201486 ) ) ( ON ?auto_201484 ?auto_201485 ) ( ON ?auto_201483 ?auto_201484 ) ( ON ?auto_201482 ?auto_201483 ) ( ON ?auto_201481 ?auto_201482 ) ( ON ?auto_201480 ?auto_201481 ) ( ON ?auto_201479 ?auto_201480 ) ( CLEAR ?auto_201477 ) ( ON ?auto_201478 ?auto_201479 ) ( CLEAR ?auto_201478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_201476 ?auto_201477 ?auto_201478 )
      ( MAKE-10PILE ?auto_201476 ?auto_201477 ?auto_201478 ?auto_201479 ?auto_201480 ?auto_201481 ?auto_201482 ?auto_201483 ?auto_201484 ?auto_201485 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_201518 - BLOCK
      ?auto_201519 - BLOCK
      ?auto_201520 - BLOCK
      ?auto_201521 - BLOCK
      ?auto_201522 - BLOCK
      ?auto_201523 - BLOCK
      ?auto_201524 - BLOCK
      ?auto_201525 - BLOCK
      ?auto_201526 - BLOCK
      ?auto_201527 - BLOCK
    )
    :vars
    (
      ?auto_201528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201527 ?auto_201528 ) ( ON-TABLE ?auto_201518 ) ( not ( = ?auto_201518 ?auto_201519 ) ) ( not ( = ?auto_201518 ?auto_201520 ) ) ( not ( = ?auto_201518 ?auto_201521 ) ) ( not ( = ?auto_201518 ?auto_201522 ) ) ( not ( = ?auto_201518 ?auto_201523 ) ) ( not ( = ?auto_201518 ?auto_201524 ) ) ( not ( = ?auto_201518 ?auto_201525 ) ) ( not ( = ?auto_201518 ?auto_201526 ) ) ( not ( = ?auto_201518 ?auto_201527 ) ) ( not ( = ?auto_201518 ?auto_201528 ) ) ( not ( = ?auto_201519 ?auto_201520 ) ) ( not ( = ?auto_201519 ?auto_201521 ) ) ( not ( = ?auto_201519 ?auto_201522 ) ) ( not ( = ?auto_201519 ?auto_201523 ) ) ( not ( = ?auto_201519 ?auto_201524 ) ) ( not ( = ?auto_201519 ?auto_201525 ) ) ( not ( = ?auto_201519 ?auto_201526 ) ) ( not ( = ?auto_201519 ?auto_201527 ) ) ( not ( = ?auto_201519 ?auto_201528 ) ) ( not ( = ?auto_201520 ?auto_201521 ) ) ( not ( = ?auto_201520 ?auto_201522 ) ) ( not ( = ?auto_201520 ?auto_201523 ) ) ( not ( = ?auto_201520 ?auto_201524 ) ) ( not ( = ?auto_201520 ?auto_201525 ) ) ( not ( = ?auto_201520 ?auto_201526 ) ) ( not ( = ?auto_201520 ?auto_201527 ) ) ( not ( = ?auto_201520 ?auto_201528 ) ) ( not ( = ?auto_201521 ?auto_201522 ) ) ( not ( = ?auto_201521 ?auto_201523 ) ) ( not ( = ?auto_201521 ?auto_201524 ) ) ( not ( = ?auto_201521 ?auto_201525 ) ) ( not ( = ?auto_201521 ?auto_201526 ) ) ( not ( = ?auto_201521 ?auto_201527 ) ) ( not ( = ?auto_201521 ?auto_201528 ) ) ( not ( = ?auto_201522 ?auto_201523 ) ) ( not ( = ?auto_201522 ?auto_201524 ) ) ( not ( = ?auto_201522 ?auto_201525 ) ) ( not ( = ?auto_201522 ?auto_201526 ) ) ( not ( = ?auto_201522 ?auto_201527 ) ) ( not ( = ?auto_201522 ?auto_201528 ) ) ( not ( = ?auto_201523 ?auto_201524 ) ) ( not ( = ?auto_201523 ?auto_201525 ) ) ( not ( = ?auto_201523 ?auto_201526 ) ) ( not ( = ?auto_201523 ?auto_201527 ) ) ( not ( = ?auto_201523 ?auto_201528 ) ) ( not ( = ?auto_201524 ?auto_201525 ) ) ( not ( = ?auto_201524 ?auto_201526 ) ) ( not ( = ?auto_201524 ?auto_201527 ) ) ( not ( = ?auto_201524 ?auto_201528 ) ) ( not ( = ?auto_201525 ?auto_201526 ) ) ( not ( = ?auto_201525 ?auto_201527 ) ) ( not ( = ?auto_201525 ?auto_201528 ) ) ( not ( = ?auto_201526 ?auto_201527 ) ) ( not ( = ?auto_201526 ?auto_201528 ) ) ( not ( = ?auto_201527 ?auto_201528 ) ) ( ON ?auto_201526 ?auto_201527 ) ( ON ?auto_201525 ?auto_201526 ) ( ON ?auto_201524 ?auto_201525 ) ( ON ?auto_201523 ?auto_201524 ) ( ON ?auto_201522 ?auto_201523 ) ( ON ?auto_201521 ?auto_201522 ) ( ON ?auto_201520 ?auto_201521 ) ( CLEAR ?auto_201518 ) ( ON ?auto_201519 ?auto_201520 ) ( CLEAR ?auto_201519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_201518 ?auto_201519 )
      ( MAKE-10PILE ?auto_201518 ?auto_201519 ?auto_201520 ?auto_201521 ?auto_201522 ?auto_201523 ?auto_201524 ?auto_201525 ?auto_201526 ?auto_201527 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_201560 - BLOCK
      ?auto_201561 - BLOCK
      ?auto_201562 - BLOCK
      ?auto_201563 - BLOCK
      ?auto_201564 - BLOCK
      ?auto_201565 - BLOCK
      ?auto_201566 - BLOCK
      ?auto_201567 - BLOCK
      ?auto_201568 - BLOCK
      ?auto_201569 - BLOCK
    )
    :vars
    (
      ?auto_201570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201569 ?auto_201570 ) ( not ( = ?auto_201560 ?auto_201561 ) ) ( not ( = ?auto_201560 ?auto_201562 ) ) ( not ( = ?auto_201560 ?auto_201563 ) ) ( not ( = ?auto_201560 ?auto_201564 ) ) ( not ( = ?auto_201560 ?auto_201565 ) ) ( not ( = ?auto_201560 ?auto_201566 ) ) ( not ( = ?auto_201560 ?auto_201567 ) ) ( not ( = ?auto_201560 ?auto_201568 ) ) ( not ( = ?auto_201560 ?auto_201569 ) ) ( not ( = ?auto_201560 ?auto_201570 ) ) ( not ( = ?auto_201561 ?auto_201562 ) ) ( not ( = ?auto_201561 ?auto_201563 ) ) ( not ( = ?auto_201561 ?auto_201564 ) ) ( not ( = ?auto_201561 ?auto_201565 ) ) ( not ( = ?auto_201561 ?auto_201566 ) ) ( not ( = ?auto_201561 ?auto_201567 ) ) ( not ( = ?auto_201561 ?auto_201568 ) ) ( not ( = ?auto_201561 ?auto_201569 ) ) ( not ( = ?auto_201561 ?auto_201570 ) ) ( not ( = ?auto_201562 ?auto_201563 ) ) ( not ( = ?auto_201562 ?auto_201564 ) ) ( not ( = ?auto_201562 ?auto_201565 ) ) ( not ( = ?auto_201562 ?auto_201566 ) ) ( not ( = ?auto_201562 ?auto_201567 ) ) ( not ( = ?auto_201562 ?auto_201568 ) ) ( not ( = ?auto_201562 ?auto_201569 ) ) ( not ( = ?auto_201562 ?auto_201570 ) ) ( not ( = ?auto_201563 ?auto_201564 ) ) ( not ( = ?auto_201563 ?auto_201565 ) ) ( not ( = ?auto_201563 ?auto_201566 ) ) ( not ( = ?auto_201563 ?auto_201567 ) ) ( not ( = ?auto_201563 ?auto_201568 ) ) ( not ( = ?auto_201563 ?auto_201569 ) ) ( not ( = ?auto_201563 ?auto_201570 ) ) ( not ( = ?auto_201564 ?auto_201565 ) ) ( not ( = ?auto_201564 ?auto_201566 ) ) ( not ( = ?auto_201564 ?auto_201567 ) ) ( not ( = ?auto_201564 ?auto_201568 ) ) ( not ( = ?auto_201564 ?auto_201569 ) ) ( not ( = ?auto_201564 ?auto_201570 ) ) ( not ( = ?auto_201565 ?auto_201566 ) ) ( not ( = ?auto_201565 ?auto_201567 ) ) ( not ( = ?auto_201565 ?auto_201568 ) ) ( not ( = ?auto_201565 ?auto_201569 ) ) ( not ( = ?auto_201565 ?auto_201570 ) ) ( not ( = ?auto_201566 ?auto_201567 ) ) ( not ( = ?auto_201566 ?auto_201568 ) ) ( not ( = ?auto_201566 ?auto_201569 ) ) ( not ( = ?auto_201566 ?auto_201570 ) ) ( not ( = ?auto_201567 ?auto_201568 ) ) ( not ( = ?auto_201567 ?auto_201569 ) ) ( not ( = ?auto_201567 ?auto_201570 ) ) ( not ( = ?auto_201568 ?auto_201569 ) ) ( not ( = ?auto_201568 ?auto_201570 ) ) ( not ( = ?auto_201569 ?auto_201570 ) ) ( ON ?auto_201568 ?auto_201569 ) ( ON ?auto_201567 ?auto_201568 ) ( ON ?auto_201566 ?auto_201567 ) ( ON ?auto_201565 ?auto_201566 ) ( ON ?auto_201564 ?auto_201565 ) ( ON ?auto_201563 ?auto_201564 ) ( ON ?auto_201562 ?auto_201563 ) ( ON ?auto_201561 ?auto_201562 ) ( ON ?auto_201560 ?auto_201561 ) ( CLEAR ?auto_201560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_201560 )
      ( MAKE-10PILE ?auto_201560 ?auto_201561 ?auto_201562 ?auto_201563 ?auto_201564 ?auto_201565 ?auto_201566 ?auto_201567 ?auto_201568 ?auto_201569 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_201603 - BLOCK
      ?auto_201604 - BLOCK
      ?auto_201605 - BLOCK
      ?auto_201606 - BLOCK
      ?auto_201607 - BLOCK
      ?auto_201608 - BLOCK
      ?auto_201609 - BLOCK
      ?auto_201610 - BLOCK
      ?auto_201611 - BLOCK
      ?auto_201612 - BLOCK
      ?auto_201613 - BLOCK
    )
    :vars
    (
      ?auto_201614 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_201612 ) ( ON ?auto_201613 ?auto_201614 ) ( CLEAR ?auto_201613 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_201603 ) ( ON ?auto_201604 ?auto_201603 ) ( ON ?auto_201605 ?auto_201604 ) ( ON ?auto_201606 ?auto_201605 ) ( ON ?auto_201607 ?auto_201606 ) ( ON ?auto_201608 ?auto_201607 ) ( ON ?auto_201609 ?auto_201608 ) ( ON ?auto_201610 ?auto_201609 ) ( ON ?auto_201611 ?auto_201610 ) ( ON ?auto_201612 ?auto_201611 ) ( not ( = ?auto_201603 ?auto_201604 ) ) ( not ( = ?auto_201603 ?auto_201605 ) ) ( not ( = ?auto_201603 ?auto_201606 ) ) ( not ( = ?auto_201603 ?auto_201607 ) ) ( not ( = ?auto_201603 ?auto_201608 ) ) ( not ( = ?auto_201603 ?auto_201609 ) ) ( not ( = ?auto_201603 ?auto_201610 ) ) ( not ( = ?auto_201603 ?auto_201611 ) ) ( not ( = ?auto_201603 ?auto_201612 ) ) ( not ( = ?auto_201603 ?auto_201613 ) ) ( not ( = ?auto_201603 ?auto_201614 ) ) ( not ( = ?auto_201604 ?auto_201605 ) ) ( not ( = ?auto_201604 ?auto_201606 ) ) ( not ( = ?auto_201604 ?auto_201607 ) ) ( not ( = ?auto_201604 ?auto_201608 ) ) ( not ( = ?auto_201604 ?auto_201609 ) ) ( not ( = ?auto_201604 ?auto_201610 ) ) ( not ( = ?auto_201604 ?auto_201611 ) ) ( not ( = ?auto_201604 ?auto_201612 ) ) ( not ( = ?auto_201604 ?auto_201613 ) ) ( not ( = ?auto_201604 ?auto_201614 ) ) ( not ( = ?auto_201605 ?auto_201606 ) ) ( not ( = ?auto_201605 ?auto_201607 ) ) ( not ( = ?auto_201605 ?auto_201608 ) ) ( not ( = ?auto_201605 ?auto_201609 ) ) ( not ( = ?auto_201605 ?auto_201610 ) ) ( not ( = ?auto_201605 ?auto_201611 ) ) ( not ( = ?auto_201605 ?auto_201612 ) ) ( not ( = ?auto_201605 ?auto_201613 ) ) ( not ( = ?auto_201605 ?auto_201614 ) ) ( not ( = ?auto_201606 ?auto_201607 ) ) ( not ( = ?auto_201606 ?auto_201608 ) ) ( not ( = ?auto_201606 ?auto_201609 ) ) ( not ( = ?auto_201606 ?auto_201610 ) ) ( not ( = ?auto_201606 ?auto_201611 ) ) ( not ( = ?auto_201606 ?auto_201612 ) ) ( not ( = ?auto_201606 ?auto_201613 ) ) ( not ( = ?auto_201606 ?auto_201614 ) ) ( not ( = ?auto_201607 ?auto_201608 ) ) ( not ( = ?auto_201607 ?auto_201609 ) ) ( not ( = ?auto_201607 ?auto_201610 ) ) ( not ( = ?auto_201607 ?auto_201611 ) ) ( not ( = ?auto_201607 ?auto_201612 ) ) ( not ( = ?auto_201607 ?auto_201613 ) ) ( not ( = ?auto_201607 ?auto_201614 ) ) ( not ( = ?auto_201608 ?auto_201609 ) ) ( not ( = ?auto_201608 ?auto_201610 ) ) ( not ( = ?auto_201608 ?auto_201611 ) ) ( not ( = ?auto_201608 ?auto_201612 ) ) ( not ( = ?auto_201608 ?auto_201613 ) ) ( not ( = ?auto_201608 ?auto_201614 ) ) ( not ( = ?auto_201609 ?auto_201610 ) ) ( not ( = ?auto_201609 ?auto_201611 ) ) ( not ( = ?auto_201609 ?auto_201612 ) ) ( not ( = ?auto_201609 ?auto_201613 ) ) ( not ( = ?auto_201609 ?auto_201614 ) ) ( not ( = ?auto_201610 ?auto_201611 ) ) ( not ( = ?auto_201610 ?auto_201612 ) ) ( not ( = ?auto_201610 ?auto_201613 ) ) ( not ( = ?auto_201610 ?auto_201614 ) ) ( not ( = ?auto_201611 ?auto_201612 ) ) ( not ( = ?auto_201611 ?auto_201613 ) ) ( not ( = ?auto_201611 ?auto_201614 ) ) ( not ( = ?auto_201612 ?auto_201613 ) ) ( not ( = ?auto_201612 ?auto_201614 ) ) ( not ( = ?auto_201613 ?auto_201614 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_201613 ?auto_201614 )
      ( !STACK ?auto_201613 ?auto_201612 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_201649 - BLOCK
      ?auto_201650 - BLOCK
      ?auto_201651 - BLOCK
      ?auto_201652 - BLOCK
      ?auto_201653 - BLOCK
      ?auto_201654 - BLOCK
      ?auto_201655 - BLOCK
      ?auto_201656 - BLOCK
      ?auto_201657 - BLOCK
      ?auto_201658 - BLOCK
      ?auto_201659 - BLOCK
    )
    :vars
    (
      ?auto_201660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201659 ?auto_201660 ) ( ON-TABLE ?auto_201649 ) ( ON ?auto_201650 ?auto_201649 ) ( ON ?auto_201651 ?auto_201650 ) ( ON ?auto_201652 ?auto_201651 ) ( ON ?auto_201653 ?auto_201652 ) ( ON ?auto_201654 ?auto_201653 ) ( ON ?auto_201655 ?auto_201654 ) ( ON ?auto_201656 ?auto_201655 ) ( ON ?auto_201657 ?auto_201656 ) ( not ( = ?auto_201649 ?auto_201650 ) ) ( not ( = ?auto_201649 ?auto_201651 ) ) ( not ( = ?auto_201649 ?auto_201652 ) ) ( not ( = ?auto_201649 ?auto_201653 ) ) ( not ( = ?auto_201649 ?auto_201654 ) ) ( not ( = ?auto_201649 ?auto_201655 ) ) ( not ( = ?auto_201649 ?auto_201656 ) ) ( not ( = ?auto_201649 ?auto_201657 ) ) ( not ( = ?auto_201649 ?auto_201658 ) ) ( not ( = ?auto_201649 ?auto_201659 ) ) ( not ( = ?auto_201649 ?auto_201660 ) ) ( not ( = ?auto_201650 ?auto_201651 ) ) ( not ( = ?auto_201650 ?auto_201652 ) ) ( not ( = ?auto_201650 ?auto_201653 ) ) ( not ( = ?auto_201650 ?auto_201654 ) ) ( not ( = ?auto_201650 ?auto_201655 ) ) ( not ( = ?auto_201650 ?auto_201656 ) ) ( not ( = ?auto_201650 ?auto_201657 ) ) ( not ( = ?auto_201650 ?auto_201658 ) ) ( not ( = ?auto_201650 ?auto_201659 ) ) ( not ( = ?auto_201650 ?auto_201660 ) ) ( not ( = ?auto_201651 ?auto_201652 ) ) ( not ( = ?auto_201651 ?auto_201653 ) ) ( not ( = ?auto_201651 ?auto_201654 ) ) ( not ( = ?auto_201651 ?auto_201655 ) ) ( not ( = ?auto_201651 ?auto_201656 ) ) ( not ( = ?auto_201651 ?auto_201657 ) ) ( not ( = ?auto_201651 ?auto_201658 ) ) ( not ( = ?auto_201651 ?auto_201659 ) ) ( not ( = ?auto_201651 ?auto_201660 ) ) ( not ( = ?auto_201652 ?auto_201653 ) ) ( not ( = ?auto_201652 ?auto_201654 ) ) ( not ( = ?auto_201652 ?auto_201655 ) ) ( not ( = ?auto_201652 ?auto_201656 ) ) ( not ( = ?auto_201652 ?auto_201657 ) ) ( not ( = ?auto_201652 ?auto_201658 ) ) ( not ( = ?auto_201652 ?auto_201659 ) ) ( not ( = ?auto_201652 ?auto_201660 ) ) ( not ( = ?auto_201653 ?auto_201654 ) ) ( not ( = ?auto_201653 ?auto_201655 ) ) ( not ( = ?auto_201653 ?auto_201656 ) ) ( not ( = ?auto_201653 ?auto_201657 ) ) ( not ( = ?auto_201653 ?auto_201658 ) ) ( not ( = ?auto_201653 ?auto_201659 ) ) ( not ( = ?auto_201653 ?auto_201660 ) ) ( not ( = ?auto_201654 ?auto_201655 ) ) ( not ( = ?auto_201654 ?auto_201656 ) ) ( not ( = ?auto_201654 ?auto_201657 ) ) ( not ( = ?auto_201654 ?auto_201658 ) ) ( not ( = ?auto_201654 ?auto_201659 ) ) ( not ( = ?auto_201654 ?auto_201660 ) ) ( not ( = ?auto_201655 ?auto_201656 ) ) ( not ( = ?auto_201655 ?auto_201657 ) ) ( not ( = ?auto_201655 ?auto_201658 ) ) ( not ( = ?auto_201655 ?auto_201659 ) ) ( not ( = ?auto_201655 ?auto_201660 ) ) ( not ( = ?auto_201656 ?auto_201657 ) ) ( not ( = ?auto_201656 ?auto_201658 ) ) ( not ( = ?auto_201656 ?auto_201659 ) ) ( not ( = ?auto_201656 ?auto_201660 ) ) ( not ( = ?auto_201657 ?auto_201658 ) ) ( not ( = ?auto_201657 ?auto_201659 ) ) ( not ( = ?auto_201657 ?auto_201660 ) ) ( not ( = ?auto_201658 ?auto_201659 ) ) ( not ( = ?auto_201658 ?auto_201660 ) ) ( not ( = ?auto_201659 ?auto_201660 ) ) ( CLEAR ?auto_201657 ) ( ON ?auto_201658 ?auto_201659 ) ( CLEAR ?auto_201658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_201649 ?auto_201650 ?auto_201651 ?auto_201652 ?auto_201653 ?auto_201654 ?auto_201655 ?auto_201656 ?auto_201657 ?auto_201658 )
      ( MAKE-11PILE ?auto_201649 ?auto_201650 ?auto_201651 ?auto_201652 ?auto_201653 ?auto_201654 ?auto_201655 ?auto_201656 ?auto_201657 ?auto_201658 ?auto_201659 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_201695 - BLOCK
      ?auto_201696 - BLOCK
      ?auto_201697 - BLOCK
      ?auto_201698 - BLOCK
      ?auto_201699 - BLOCK
      ?auto_201700 - BLOCK
      ?auto_201701 - BLOCK
      ?auto_201702 - BLOCK
      ?auto_201703 - BLOCK
      ?auto_201704 - BLOCK
      ?auto_201705 - BLOCK
    )
    :vars
    (
      ?auto_201706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201705 ?auto_201706 ) ( ON-TABLE ?auto_201695 ) ( ON ?auto_201696 ?auto_201695 ) ( ON ?auto_201697 ?auto_201696 ) ( ON ?auto_201698 ?auto_201697 ) ( ON ?auto_201699 ?auto_201698 ) ( ON ?auto_201700 ?auto_201699 ) ( ON ?auto_201701 ?auto_201700 ) ( ON ?auto_201702 ?auto_201701 ) ( not ( = ?auto_201695 ?auto_201696 ) ) ( not ( = ?auto_201695 ?auto_201697 ) ) ( not ( = ?auto_201695 ?auto_201698 ) ) ( not ( = ?auto_201695 ?auto_201699 ) ) ( not ( = ?auto_201695 ?auto_201700 ) ) ( not ( = ?auto_201695 ?auto_201701 ) ) ( not ( = ?auto_201695 ?auto_201702 ) ) ( not ( = ?auto_201695 ?auto_201703 ) ) ( not ( = ?auto_201695 ?auto_201704 ) ) ( not ( = ?auto_201695 ?auto_201705 ) ) ( not ( = ?auto_201695 ?auto_201706 ) ) ( not ( = ?auto_201696 ?auto_201697 ) ) ( not ( = ?auto_201696 ?auto_201698 ) ) ( not ( = ?auto_201696 ?auto_201699 ) ) ( not ( = ?auto_201696 ?auto_201700 ) ) ( not ( = ?auto_201696 ?auto_201701 ) ) ( not ( = ?auto_201696 ?auto_201702 ) ) ( not ( = ?auto_201696 ?auto_201703 ) ) ( not ( = ?auto_201696 ?auto_201704 ) ) ( not ( = ?auto_201696 ?auto_201705 ) ) ( not ( = ?auto_201696 ?auto_201706 ) ) ( not ( = ?auto_201697 ?auto_201698 ) ) ( not ( = ?auto_201697 ?auto_201699 ) ) ( not ( = ?auto_201697 ?auto_201700 ) ) ( not ( = ?auto_201697 ?auto_201701 ) ) ( not ( = ?auto_201697 ?auto_201702 ) ) ( not ( = ?auto_201697 ?auto_201703 ) ) ( not ( = ?auto_201697 ?auto_201704 ) ) ( not ( = ?auto_201697 ?auto_201705 ) ) ( not ( = ?auto_201697 ?auto_201706 ) ) ( not ( = ?auto_201698 ?auto_201699 ) ) ( not ( = ?auto_201698 ?auto_201700 ) ) ( not ( = ?auto_201698 ?auto_201701 ) ) ( not ( = ?auto_201698 ?auto_201702 ) ) ( not ( = ?auto_201698 ?auto_201703 ) ) ( not ( = ?auto_201698 ?auto_201704 ) ) ( not ( = ?auto_201698 ?auto_201705 ) ) ( not ( = ?auto_201698 ?auto_201706 ) ) ( not ( = ?auto_201699 ?auto_201700 ) ) ( not ( = ?auto_201699 ?auto_201701 ) ) ( not ( = ?auto_201699 ?auto_201702 ) ) ( not ( = ?auto_201699 ?auto_201703 ) ) ( not ( = ?auto_201699 ?auto_201704 ) ) ( not ( = ?auto_201699 ?auto_201705 ) ) ( not ( = ?auto_201699 ?auto_201706 ) ) ( not ( = ?auto_201700 ?auto_201701 ) ) ( not ( = ?auto_201700 ?auto_201702 ) ) ( not ( = ?auto_201700 ?auto_201703 ) ) ( not ( = ?auto_201700 ?auto_201704 ) ) ( not ( = ?auto_201700 ?auto_201705 ) ) ( not ( = ?auto_201700 ?auto_201706 ) ) ( not ( = ?auto_201701 ?auto_201702 ) ) ( not ( = ?auto_201701 ?auto_201703 ) ) ( not ( = ?auto_201701 ?auto_201704 ) ) ( not ( = ?auto_201701 ?auto_201705 ) ) ( not ( = ?auto_201701 ?auto_201706 ) ) ( not ( = ?auto_201702 ?auto_201703 ) ) ( not ( = ?auto_201702 ?auto_201704 ) ) ( not ( = ?auto_201702 ?auto_201705 ) ) ( not ( = ?auto_201702 ?auto_201706 ) ) ( not ( = ?auto_201703 ?auto_201704 ) ) ( not ( = ?auto_201703 ?auto_201705 ) ) ( not ( = ?auto_201703 ?auto_201706 ) ) ( not ( = ?auto_201704 ?auto_201705 ) ) ( not ( = ?auto_201704 ?auto_201706 ) ) ( not ( = ?auto_201705 ?auto_201706 ) ) ( ON ?auto_201704 ?auto_201705 ) ( CLEAR ?auto_201702 ) ( ON ?auto_201703 ?auto_201704 ) ( CLEAR ?auto_201703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_201695 ?auto_201696 ?auto_201697 ?auto_201698 ?auto_201699 ?auto_201700 ?auto_201701 ?auto_201702 ?auto_201703 )
      ( MAKE-11PILE ?auto_201695 ?auto_201696 ?auto_201697 ?auto_201698 ?auto_201699 ?auto_201700 ?auto_201701 ?auto_201702 ?auto_201703 ?auto_201704 ?auto_201705 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_201741 - BLOCK
      ?auto_201742 - BLOCK
      ?auto_201743 - BLOCK
      ?auto_201744 - BLOCK
      ?auto_201745 - BLOCK
      ?auto_201746 - BLOCK
      ?auto_201747 - BLOCK
      ?auto_201748 - BLOCK
      ?auto_201749 - BLOCK
      ?auto_201750 - BLOCK
      ?auto_201751 - BLOCK
    )
    :vars
    (
      ?auto_201752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201751 ?auto_201752 ) ( ON-TABLE ?auto_201741 ) ( ON ?auto_201742 ?auto_201741 ) ( ON ?auto_201743 ?auto_201742 ) ( ON ?auto_201744 ?auto_201743 ) ( ON ?auto_201745 ?auto_201744 ) ( ON ?auto_201746 ?auto_201745 ) ( ON ?auto_201747 ?auto_201746 ) ( not ( = ?auto_201741 ?auto_201742 ) ) ( not ( = ?auto_201741 ?auto_201743 ) ) ( not ( = ?auto_201741 ?auto_201744 ) ) ( not ( = ?auto_201741 ?auto_201745 ) ) ( not ( = ?auto_201741 ?auto_201746 ) ) ( not ( = ?auto_201741 ?auto_201747 ) ) ( not ( = ?auto_201741 ?auto_201748 ) ) ( not ( = ?auto_201741 ?auto_201749 ) ) ( not ( = ?auto_201741 ?auto_201750 ) ) ( not ( = ?auto_201741 ?auto_201751 ) ) ( not ( = ?auto_201741 ?auto_201752 ) ) ( not ( = ?auto_201742 ?auto_201743 ) ) ( not ( = ?auto_201742 ?auto_201744 ) ) ( not ( = ?auto_201742 ?auto_201745 ) ) ( not ( = ?auto_201742 ?auto_201746 ) ) ( not ( = ?auto_201742 ?auto_201747 ) ) ( not ( = ?auto_201742 ?auto_201748 ) ) ( not ( = ?auto_201742 ?auto_201749 ) ) ( not ( = ?auto_201742 ?auto_201750 ) ) ( not ( = ?auto_201742 ?auto_201751 ) ) ( not ( = ?auto_201742 ?auto_201752 ) ) ( not ( = ?auto_201743 ?auto_201744 ) ) ( not ( = ?auto_201743 ?auto_201745 ) ) ( not ( = ?auto_201743 ?auto_201746 ) ) ( not ( = ?auto_201743 ?auto_201747 ) ) ( not ( = ?auto_201743 ?auto_201748 ) ) ( not ( = ?auto_201743 ?auto_201749 ) ) ( not ( = ?auto_201743 ?auto_201750 ) ) ( not ( = ?auto_201743 ?auto_201751 ) ) ( not ( = ?auto_201743 ?auto_201752 ) ) ( not ( = ?auto_201744 ?auto_201745 ) ) ( not ( = ?auto_201744 ?auto_201746 ) ) ( not ( = ?auto_201744 ?auto_201747 ) ) ( not ( = ?auto_201744 ?auto_201748 ) ) ( not ( = ?auto_201744 ?auto_201749 ) ) ( not ( = ?auto_201744 ?auto_201750 ) ) ( not ( = ?auto_201744 ?auto_201751 ) ) ( not ( = ?auto_201744 ?auto_201752 ) ) ( not ( = ?auto_201745 ?auto_201746 ) ) ( not ( = ?auto_201745 ?auto_201747 ) ) ( not ( = ?auto_201745 ?auto_201748 ) ) ( not ( = ?auto_201745 ?auto_201749 ) ) ( not ( = ?auto_201745 ?auto_201750 ) ) ( not ( = ?auto_201745 ?auto_201751 ) ) ( not ( = ?auto_201745 ?auto_201752 ) ) ( not ( = ?auto_201746 ?auto_201747 ) ) ( not ( = ?auto_201746 ?auto_201748 ) ) ( not ( = ?auto_201746 ?auto_201749 ) ) ( not ( = ?auto_201746 ?auto_201750 ) ) ( not ( = ?auto_201746 ?auto_201751 ) ) ( not ( = ?auto_201746 ?auto_201752 ) ) ( not ( = ?auto_201747 ?auto_201748 ) ) ( not ( = ?auto_201747 ?auto_201749 ) ) ( not ( = ?auto_201747 ?auto_201750 ) ) ( not ( = ?auto_201747 ?auto_201751 ) ) ( not ( = ?auto_201747 ?auto_201752 ) ) ( not ( = ?auto_201748 ?auto_201749 ) ) ( not ( = ?auto_201748 ?auto_201750 ) ) ( not ( = ?auto_201748 ?auto_201751 ) ) ( not ( = ?auto_201748 ?auto_201752 ) ) ( not ( = ?auto_201749 ?auto_201750 ) ) ( not ( = ?auto_201749 ?auto_201751 ) ) ( not ( = ?auto_201749 ?auto_201752 ) ) ( not ( = ?auto_201750 ?auto_201751 ) ) ( not ( = ?auto_201750 ?auto_201752 ) ) ( not ( = ?auto_201751 ?auto_201752 ) ) ( ON ?auto_201750 ?auto_201751 ) ( ON ?auto_201749 ?auto_201750 ) ( CLEAR ?auto_201747 ) ( ON ?auto_201748 ?auto_201749 ) ( CLEAR ?auto_201748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_201741 ?auto_201742 ?auto_201743 ?auto_201744 ?auto_201745 ?auto_201746 ?auto_201747 ?auto_201748 )
      ( MAKE-11PILE ?auto_201741 ?auto_201742 ?auto_201743 ?auto_201744 ?auto_201745 ?auto_201746 ?auto_201747 ?auto_201748 ?auto_201749 ?auto_201750 ?auto_201751 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_201787 - BLOCK
      ?auto_201788 - BLOCK
      ?auto_201789 - BLOCK
      ?auto_201790 - BLOCK
      ?auto_201791 - BLOCK
      ?auto_201792 - BLOCK
      ?auto_201793 - BLOCK
      ?auto_201794 - BLOCK
      ?auto_201795 - BLOCK
      ?auto_201796 - BLOCK
      ?auto_201797 - BLOCK
    )
    :vars
    (
      ?auto_201798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201797 ?auto_201798 ) ( ON-TABLE ?auto_201787 ) ( ON ?auto_201788 ?auto_201787 ) ( ON ?auto_201789 ?auto_201788 ) ( ON ?auto_201790 ?auto_201789 ) ( ON ?auto_201791 ?auto_201790 ) ( ON ?auto_201792 ?auto_201791 ) ( not ( = ?auto_201787 ?auto_201788 ) ) ( not ( = ?auto_201787 ?auto_201789 ) ) ( not ( = ?auto_201787 ?auto_201790 ) ) ( not ( = ?auto_201787 ?auto_201791 ) ) ( not ( = ?auto_201787 ?auto_201792 ) ) ( not ( = ?auto_201787 ?auto_201793 ) ) ( not ( = ?auto_201787 ?auto_201794 ) ) ( not ( = ?auto_201787 ?auto_201795 ) ) ( not ( = ?auto_201787 ?auto_201796 ) ) ( not ( = ?auto_201787 ?auto_201797 ) ) ( not ( = ?auto_201787 ?auto_201798 ) ) ( not ( = ?auto_201788 ?auto_201789 ) ) ( not ( = ?auto_201788 ?auto_201790 ) ) ( not ( = ?auto_201788 ?auto_201791 ) ) ( not ( = ?auto_201788 ?auto_201792 ) ) ( not ( = ?auto_201788 ?auto_201793 ) ) ( not ( = ?auto_201788 ?auto_201794 ) ) ( not ( = ?auto_201788 ?auto_201795 ) ) ( not ( = ?auto_201788 ?auto_201796 ) ) ( not ( = ?auto_201788 ?auto_201797 ) ) ( not ( = ?auto_201788 ?auto_201798 ) ) ( not ( = ?auto_201789 ?auto_201790 ) ) ( not ( = ?auto_201789 ?auto_201791 ) ) ( not ( = ?auto_201789 ?auto_201792 ) ) ( not ( = ?auto_201789 ?auto_201793 ) ) ( not ( = ?auto_201789 ?auto_201794 ) ) ( not ( = ?auto_201789 ?auto_201795 ) ) ( not ( = ?auto_201789 ?auto_201796 ) ) ( not ( = ?auto_201789 ?auto_201797 ) ) ( not ( = ?auto_201789 ?auto_201798 ) ) ( not ( = ?auto_201790 ?auto_201791 ) ) ( not ( = ?auto_201790 ?auto_201792 ) ) ( not ( = ?auto_201790 ?auto_201793 ) ) ( not ( = ?auto_201790 ?auto_201794 ) ) ( not ( = ?auto_201790 ?auto_201795 ) ) ( not ( = ?auto_201790 ?auto_201796 ) ) ( not ( = ?auto_201790 ?auto_201797 ) ) ( not ( = ?auto_201790 ?auto_201798 ) ) ( not ( = ?auto_201791 ?auto_201792 ) ) ( not ( = ?auto_201791 ?auto_201793 ) ) ( not ( = ?auto_201791 ?auto_201794 ) ) ( not ( = ?auto_201791 ?auto_201795 ) ) ( not ( = ?auto_201791 ?auto_201796 ) ) ( not ( = ?auto_201791 ?auto_201797 ) ) ( not ( = ?auto_201791 ?auto_201798 ) ) ( not ( = ?auto_201792 ?auto_201793 ) ) ( not ( = ?auto_201792 ?auto_201794 ) ) ( not ( = ?auto_201792 ?auto_201795 ) ) ( not ( = ?auto_201792 ?auto_201796 ) ) ( not ( = ?auto_201792 ?auto_201797 ) ) ( not ( = ?auto_201792 ?auto_201798 ) ) ( not ( = ?auto_201793 ?auto_201794 ) ) ( not ( = ?auto_201793 ?auto_201795 ) ) ( not ( = ?auto_201793 ?auto_201796 ) ) ( not ( = ?auto_201793 ?auto_201797 ) ) ( not ( = ?auto_201793 ?auto_201798 ) ) ( not ( = ?auto_201794 ?auto_201795 ) ) ( not ( = ?auto_201794 ?auto_201796 ) ) ( not ( = ?auto_201794 ?auto_201797 ) ) ( not ( = ?auto_201794 ?auto_201798 ) ) ( not ( = ?auto_201795 ?auto_201796 ) ) ( not ( = ?auto_201795 ?auto_201797 ) ) ( not ( = ?auto_201795 ?auto_201798 ) ) ( not ( = ?auto_201796 ?auto_201797 ) ) ( not ( = ?auto_201796 ?auto_201798 ) ) ( not ( = ?auto_201797 ?auto_201798 ) ) ( ON ?auto_201796 ?auto_201797 ) ( ON ?auto_201795 ?auto_201796 ) ( ON ?auto_201794 ?auto_201795 ) ( CLEAR ?auto_201792 ) ( ON ?auto_201793 ?auto_201794 ) ( CLEAR ?auto_201793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_201787 ?auto_201788 ?auto_201789 ?auto_201790 ?auto_201791 ?auto_201792 ?auto_201793 )
      ( MAKE-11PILE ?auto_201787 ?auto_201788 ?auto_201789 ?auto_201790 ?auto_201791 ?auto_201792 ?auto_201793 ?auto_201794 ?auto_201795 ?auto_201796 ?auto_201797 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_201833 - BLOCK
      ?auto_201834 - BLOCK
      ?auto_201835 - BLOCK
      ?auto_201836 - BLOCK
      ?auto_201837 - BLOCK
      ?auto_201838 - BLOCK
      ?auto_201839 - BLOCK
      ?auto_201840 - BLOCK
      ?auto_201841 - BLOCK
      ?auto_201842 - BLOCK
      ?auto_201843 - BLOCK
    )
    :vars
    (
      ?auto_201844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201843 ?auto_201844 ) ( ON-TABLE ?auto_201833 ) ( ON ?auto_201834 ?auto_201833 ) ( ON ?auto_201835 ?auto_201834 ) ( ON ?auto_201836 ?auto_201835 ) ( ON ?auto_201837 ?auto_201836 ) ( not ( = ?auto_201833 ?auto_201834 ) ) ( not ( = ?auto_201833 ?auto_201835 ) ) ( not ( = ?auto_201833 ?auto_201836 ) ) ( not ( = ?auto_201833 ?auto_201837 ) ) ( not ( = ?auto_201833 ?auto_201838 ) ) ( not ( = ?auto_201833 ?auto_201839 ) ) ( not ( = ?auto_201833 ?auto_201840 ) ) ( not ( = ?auto_201833 ?auto_201841 ) ) ( not ( = ?auto_201833 ?auto_201842 ) ) ( not ( = ?auto_201833 ?auto_201843 ) ) ( not ( = ?auto_201833 ?auto_201844 ) ) ( not ( = ?auto_201834 ?auto_201835 ) ) ( not ( = ?auto_201834 ?auto_201836 ) ) ( not ( = ?auto_201834 ?auto_201837 ) ) ( not ( = ?auto_201834 ?auto_201838 ) ) ( not ( = ?auto_201834 ?auto_201839 ) ) ( not ( = ?auto_201834 ?auto_201840 ) ) ( not ( = ?auto_201834 ?auto_201841 ) ) ( not ( = ?auto_201834 ?auto_201842 ) ) ( not ( = ?auto_201834 ?auto_201843 ) ) ( not ( = ?auto_201834 ?auto_201844 ) ) ( not ( = ?auto_201835 ?auto_201836 ) ) ( not ( = ?auto_201835 ?auto_201837 ) ) ( not ( = ?auto_201835 ?auto_201838 ) ) ( not ( = ?auto_201835 ?auto_201839 ) ) ( not ( = ?auto_201835 ?auto_201840 ) ) ( not ( = ?auto_201835 ?auto_201841 ) ) ( not ( = ?auto_201835 ?auto_201842 ) ) ( not ( = ?auto_201835 ?auto_201843 ) ) ( not ( = ?auto_201835 ?auto_201844 ) ) ( not ( = ?auto_201836 ?auto_201837 ) ) ( not ( = ?auto_201836 ?auto_201838 ) ) ( not ( = ?auto_201836 ?auto_201839 ) ) ( not ( = ?auto_201836 ?auto_201840 ) ) ( not ( = ?auto_201836 ?auto_201841 ) ) ( not ( = ?auto_201836 ?auto_201842 ) ) ( not ( = ?auto_201836 ?auto_201843 ) ) ( not ( = ?auto_201836 ?auto_201844 ) ) ( not ( = ?auto_201837 ?auto_201838 ) ) ( not ( = ?auto_201837 ?auto_201839 ) ) ( not ( = ?auto_201837 ?auto_201840 ) ) ( not ( = ?auto_201837 ?auto_201841 ) ) ( not ( = ?auto_201837 ?auto_201842 ) ) ( not ( = ?auto_201837 ?auto_201843 ) ) ( not ( = ?auto_201837 ?auto_201844 ) ) ( not ( = ?auto_201838 ?auto_201839 ) ) ( not ( = ?auto_201838 ?auto_201840 ) ) ( not ( = ?auto_201838 ?auto_201841 ) ) ( not ( = ?auto_201838 ?auto_201842 ) ) ( not ( = ?auto_201838 ?auto_201843 ) ) ( not ( = ?auto_201838 ?auto_201844 ) ) ( not ( = ?auto_201839 ?auto_201840 ) ) ( not ( = ?auto_201839 ?auto_201841 ) ) ( not ( = ?auto_201839 ?auto_201842 ) ) ( not ( = ?auto_201839 ?auto_201843 ) ) ( not ( = ?auto_201839 ?auto_201844 ) ) ( not ( = ?auto_201840 ?auto_201841 ) ) ( not ( = ?auto_201840 ?auto_201842 ) ) ( not ( = ?auto_201840 ?auto_201843 ) ) ( not ( = ?auto_201840 ?auto_201844 ) ) ( not ( = ?auto_201841 ?auto_201842 ) ) ( not ( = ?auto_201841 ?auto_201843 ) ) ( not ( = ?auto_201841 ?auto_201844 ) ) ( not ( = ?auto_201842 ?auto_201843 ) ) ( not ( = ?auto_201842 ?auto_201844 ) ) ( not ( = ?auto_201843 ?auto_201844 ) ) ( ON ?auto_201842 ?auto_201843 ) ( ON ?auto_201841 ?auto_201842 ) ( ON ?auto_201840 ?auto_201841 ) ( ON ?auto_201839 ?auto_201840 ) ( CLEAR ?auto_201837 ) ( ON ?auto_201838 ?auto_201839 ) ( CLEAR ?auto_201838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_201833 ?auto_201834 ?auto_201835 ?auto_201836 ?auto_201837 ?auto_201838 )
      ( MAKE-11PILE ?auto_201833 ?auto_201834 ?auto_201835 ?auto_201836 ?auto_201837 ?auto_201838 ?auto_201839 ?auto_201840 ?auto_201841 ?auto_201842 ?auto_201843 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_201879 - BLOCK
      ?auto_201880 - BLOCK
      ?auto_201881 - BLOCK
      ?auto_201882 - BLOCK
      ?auto_201883 - BLOCK
      ?auto_201884 - BLOCK
      ?auto_201885 - BLOCK
      ?auto_201886 - BLOCK
      ?auto_201887 - BLOCK
      ?auto_201888 - BLOCK
      ?auto_201889 - BLOCK
    )
    :vars
    (
      ?auto_201890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201889 ?auto_201890 ) ( ON-TABLE ?auto_201879 ) ( ON ?auto_201880 ?auto_201879 ) ( ON ?auto_201881 ?auto_201880 ) ( ON ?auto_201882 ?auto_201881 ) ( not ( = ?auto_201879 ?auto_201880 ) ) ( not ( = ?auto_201879 ?auto_201881 ) ) ( not ( = ?auto_201879 ?auto_201882 ) ) ( not ( = ?auto_201879 ?auto_201883 ) ) ( not ( = ?auto_201879 ?auto_201884 ) ) ( not ( = ?auto_201879 ?auto_201885 ) ) ( not ( = ?auto_201879 ?auto_201886 ) ) ( not ( = ?auto_201879 ?auto_201887 ) ) ( not ( = ?auto_201879 ?auto_201888 ) ) ( not ( = ?auto_201879 ?auto_201889 ) ) ( not ( = ?auto_201879 ?auto_201890 ) ) ( not ( = ?auto_201880 ?auto_201881 ) ) ( not ( = ?auto_201880 ?auto_201882 ) ) ( not ( = ?auto_201880 ?auto_201883 ) ) ( not ( = ?auto_201880 ?auto_201884 ) ) ( not ( = ?auto_201880 ?auto_201885 ) ) ( not ( = ?auto_201880 ?auto_201886 ) ) ( not ( = ?auto_201880 ?auto_201887 ) ) ( not ( = ?auto_201880 ?auto_201888 ) ) ( not ( = ?auto_201880 ?auto_201889 ) ) ( not ( = ?auto_201880 ?auto_201890 ) ) ( not ( = ?auto_201881 ?auto_201882 ) ) ( not ( = ?auto_201881 ?auto_201883 ) ) ( not ( = ?auto_201881 ?auto_201884 ) ) ( not ( = ?auto_201881 ?auto_201885 ) ) ( not ( = ?auto_201881 ?auto_201886 ) ) ( not ( = ?auto_201881 ?auto_201887 ) ) ( not ( = ?auto_201881 ?auto_201888 ) ) ( not ( = ?auto_201881 ?auto_201889 ) ) ( not ( = ?auto_201881 ?auto_201890 ) ) ( not ( = ?auto_201882 ?auto_201883 ) ) ( not ( = ?auto_201882 ?auto_201884 ) ) ( not ( = ?auto_201882 ?auto_201885 ) ) ( not ( = ?auto_201882 ?auto_201886 ) ) ( not ( = ?auto_201882 ?auto_201887 ) ) ( not ( = ?auto_201882 ?auto_201888 ) ) ( not ( = ?auto_201882 ?auto_201889 ) ) ( not ( = ?auto_201882 ?auto_201890 ) ) ( not ( = ?auto_201883 ?auto_201884 ) ) ( not ( = ?auto_201883 ?auto_201885 ) ) ( not ( = ?auto_201883 ?auto_201886 ) ) ( not ( = ?auto_201883 ?auto_201887 ) ) ( not ( = ?auto_201883 ?auto_201888 ) ) ( not ( = ?auto_201883 ?auto_201889 ) ) ( not ( = ?auto_201883 ?auto_201890 ) ) ( not ( = ?auto_201884 ?auto_201885 ) ) ( not ( = ?auto_201884 ?auto_201886 ) ) ( not ( = ?auto_201884 ?auto_201887 ) ) ( not ( = ?auto_201884 ?auto_201888 ) ) ( not ( = ?auto_201884 ?auto_201889 ) ) ( not ( = ?auto_201884 ?auto_201890 ) ) ( not ( = ?auto_201885 ?auto_201886 ) ) ( not ( = ?auto_201885 ?auto_201887 ) ) ( not ( = ?auto_201885 ?auto_201888 ) ) ( not ( = ?auto_201885 ?auto_201889 ) ) ( not ( = ?auto_201885 ?auto_201890 ) ) ( not ( = ?auto_201886 ?auto_201887 ) ) ( not ( = ?auto_201886 ?auto_201888 ) ) ( not ( = ?auto_201886 ?auto_201889 ) ) ( not ( = ?auto_201886 ?auto_201890 ) ) ( not ( = ?auto_201887 ?auto_201888 ) ) ( not ( = ?auto_201887 ?auto_201889 ) ) ( not ( = ?auto_201887 ?auto_201890 ) ) ( not ( = ?auto_201888 ?auto_201889 ) ) ( not ( = ?auto_201888 ?auto_201890 ) ) ( not ( = ?auto_201889 ?auto_201890 ) ) ( ON ?auto_201888 ?auto_201889 ) ( ON ?auto_201887 ?auto_201888 ) ( ON ?auto_201886 ?auto_201887 ) ( ON ?auto_201885 ?auto_201886 ) ( ON ?auto_201884 ?auto_201885 ) ( CLEAR ?auto_201882 ) ( ON ?auto_201883 ?auto_201884 ) ( CLEAR ?auto_201883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_201879 ?auto_201880 ?auto_201881 ?auto_201882 ?auto_201883 )
      ( MAKE-11PILE ?auto_201879 ?auto_201880 ?auto_201881 ?auto_201882 ?auto_201883 ?auto_201884 ?auto_201885 ?auto_201886 ?auto_201887 ?auto_201888 ?auto_201889 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_201925 - BLOCK
      ?auto_201926 - BLOCK
      ?auto_201927 - BLOCK
      ?auto_201928 - BLOCK
      ?auto_201929 - BLOCK
      ?auto_201930 - BLOCK
      ?auto_201931 - BLOCK
      ?auto_201932 - BLOCK
      ?auto_201933 - BLOCK
      ?auto_201934 - BLOCK
      ?auto_201935 - BLOCK
    )
    :vars
    (
      ?auto_201936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201935 ?auto_201936 ) ( ON-TABLE ?auto_201925 ) ( ON ?auto_201926 ?auto_201925 ) ( ON ?auto_201927 ?auto_201926 ) ( not ( = ?auto_201925 ?auto_201926 ) ) ( not ( = ?auto_201925 ?auto_201927 ) ) ( not ( = ?auto_201925 ?auto_201928 ) ) ( not ( = ?auto_201925 ?auto_201929 ) ) ( not ( = ?auto_201925 ?auto_201930 ) ) ( not ( = ?auto_201925 ?auto_201931 ) ) ( not ( = ?auto_201925 ?auto_201932 ) ) ( not ( = ?auto_201925 ?auto_201933 ) ) ( not ( = ?auto_201925 ?auto_201934 ) ) ( not ( = ?auto_201925 ?auto_201935 ) ) ( not ( = ?auto_201925 ?auto_201936 ) ) ( not ( = ?auto_201926 ?auto_201927 ) ) ( not ( = ?auto_201926 ?auto_201928 ) ) ( not ( = ?auto_201926 ?auto_201929 ) ) ( not ( = ?auto_201926 ?auto_201930 ) ) ( not ( = ?auto_201926 ?auto_201931 ) ) ( not ( = ?auto_201926 ?auto_201932 ) ) ( not ( = ?auto_201926 ?auto_201933 ) ) ( not ( = ?auto_201926 ?auto_201934 ) ) ( not ( = ?auto_201926 ?auto_201935 ) ) ( not ( = ?auto_201926 ?auto_201936 ) ) ( not ( = ?auto_201927 ?auto_201928 ) ) ( not ( = ?auto_201927 ?auto_201929 ) ) ( not ( = ?auto_201927 ?auto_201930 ) ) ( not ( = ?auto_201927 ?auto_201931 ) ) ( not ( = ?auto_201927 ?auto_201932 ) ) ( not ( = ?auto_201927 ?auto_201933 ) ) ( not ( = ?auto_201927 ?auto_201934 ) ) ( not ( = ?auto_201927 ?auto_201935 ) ) ( not ( = ?auto_201927 ?auto_201936 ) ) ( not ( = ?auto_201928 ?auto_201929 ) ) ( not ( = ?auto_201928 ?auto_201930 ) ) ( not ( = ?auto_201928 ?auto_201931 ) ) ( not ( = ?auto_201928 ?auto_201932 ) ) ( not ( = ?auto_201928 ?auto_201933 ) ) ( not ( = ?auto_201928 ?auto_201934 ) ) ( not ( = ?auto_201928 ?auto_201935 ) ) ( not ( = ?auto_201928 ?auto_201936 ) ) ( not ( = ?auto_201929 ?auto_201930 ) ) ( not ( = ?auto_201929 ?auto_201931 ) ) ( not ( = ?auto_201929 ?auto_201932 ) ) ( not ( = ?auto_201929 ?auto_201933 ) ) ( not ( = ?auto_201929 ?auto_201934 ) ) ( not ( = ?auto_201929 ?auto_201935 ) ) ( not ( = ?auto_201929 ?auto_201936 ) ) ( not ( = ?auto_201930 ?auto_201931 ) ) ( not ( = ?auto_201930 ?auto_201932 ) ) ( not ( = ?auto_201930 ?auto_201933 ) ) ( not ( = ?auto_201930 ?auto_201934 ) ) ( not ( = ?auto_201930 ?auto_201935 ) ) ( not ( = ?auto_201930 ?auto_201936 ) ) ( not ( = ?auto_201931 ?auto_201932 ) ) ( not ( = ?auto_201931 ?auto_201933 ) ) ( not ( = ?auto_201931 ?auto_201934 ) ) ( not ( = ?auto_201931 ?auto_201935 ) ) ( not ( = ?auto_201931 ?auto_201936 ) ) ( not ( = ?auto_201932 ?auto_201933 ) ) ( not ( = ?auto_201932 ?auto_201934 ) ) ( not ( = ?auto_201932 ?auto_201935 ) ) ( not ( = ?auto_201932 ?auto_201936 ) ) ( not ( = ?auto_201933 ?auto_201934 ) ) ( not ( = ?auto_201933 ?auto_201935 ) ) ( not ( = ?auto_201933 ?auto_201936 ) ) ( not ( = ?auto_201934 ?auto_201935 ) ) ( not ( = ?auto_201934 ?auto_201936 ) ) ( not ( = ?auto_201935 ?auto_201936 ) ) ( ON ?auto_201934 ?auto_201935 ) ( ON ?auto_201933 ?auto_201934 ) ( ON ?auto_201932 ?auto_201933 ) ( ON ?auto_201931 ?auto_201932 ) ( ON ?auto_201930 ?auto_201931 ) ( ON ?auto_201929 ?auto_201930 ) ( CLEAR ?auto_201927 ) ( ON ?auto_201928 ?auto_201929 ) ( CLEAR ?auto_201928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_201925 ?auto_201926 ?auto_201927 ?auto_201928 )
      ( MAKE-11PILE ?auto_201925 ?auto_201926 ?auto_201927 ?auto_201928 ?auto_201929 ?auto_201930 ?auto_201931 ?auto_201932 ?auto_201933 ?auto_201934 ?auto_201935 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_201971 - BLOCK
      ?auto_201972 - BLOCK
      ?auto_201973 - BLOCK
      ?auto_201974 - BLOCK
      ?auto_201975 - BLOCK
      ?auto_201976 - BLOCK
      ?auto_201977 - BLOCK
      ?auto_201978 - BLOCK
      ?auto_201979 - BLOCK
      ?auto_201980 - BLOCK
      ?auto_201981 - BLOCK
    )
    :vars
    (
      ?auto_201982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201981 ?auto_201982 ) ( ON-TABLE ?auto_201971 ) ( ON ?auto_201972 ?auto_201971 ) ( not ( = ?auto_201971 ?auto_201972 ) ) ( not ( = ?auto_201971 ?auto_201973 ) ) ( not ( = ?auto_201971 ?auto_201974 ) ) ( not ( = ?auto_201971 ?auto_201975 ) ) ( not ( = ?auto_201971 ?auto_201976 ) ) ( not ( = ?auto_201971 ?auto_201977 ) ) ( not ( = ?auto_201971 ?auto_201978 ) ) ( not ( = ?auto_201971 ?auto_201979 ) ) ( not ( = ?auto_201971 ?auto_201980 ) ) ( not ( = ?auto_201971 ?auto_201981 ) ) ( not ( = ?auto_201971 ?auto_201982 ) ) ( not ( = ?auto_201972 ?auto_201973 ) ) ( not ( = ?auto_201972 ?auto_201974 ) ) ( not ( = ?auto_201972 ?auto_201975 ) ) ( not ( = ?auto_201972 ?auto_201976 ) ) ( not ( = ?auto_201972 ?auto_201977 ) ) ( not ( = ?auto_201972 ?auto_201978 ) ) ( not ( = ?auto_201972 ?auto_201979 ) ) ( not ( = ?auto_201972 ?auto_201980 ) ) ( not ( = ?auto_201972 ?auto_201981 ) ) ( not ( = ?auto_201972 ?auto_201982 ) ) ( not ( = ?auto_201973 ?auto_201974 ) ) ( not ( = ?auto_201973 ?auto_201975 ) ) ( not ( = ?auto_201973 ?auto_201976 ) ) ( not ( = ?auto_201973 ?auto_201977 ) ) ( not ( = ?auto_201973 ?auto_201978 ) ) ( not ( = ?auto_201973 ?auto_201979 ) ) ( not ( = ?auto_201973 ?auto_201980 ) ) ( not ( = ?auto_201973 ?auto_201981 ) ) ( not ( = ?auto_201973 ?auto_201982 ) ) ( not ( = ?auto_201974 ?auto_201975 ) ) ( not ( = ?auto_201974 ?auto_201976 ) ) ( not ( = ?auto_201974 ?auto_201977 ) ) ( not ( = ?auto_201974 ?auto_201978 ) ) ( not ( = ?auto_201974 ?auto_201979 ) ) ( not ( = ?auto_201974 ?auto_201980 ) ) ( not ( = ?auto_201974 ?auto_201981 ) ) ( not ( = ?auto_201974 ?auto_201982 ) ) ( not ( = ?auto_201975 ?auto_201976 ) ) ( not ( = ?auto_201975 ?auto_201977 ) ) ( not ( = ?auto_201975 ?auto_201978 ) ) ( not ( = ?auto_201975 ?auto_201979 ) ) ( not ( = ?auto_201975 ?auto_201980 ) ) ( not ( = ?auto_201975 ?auto_201981 ) ) ( not ( = ?auto_201975 ?auto_201982 ) ) ( not ( = ?auto_201976 ?auto_201977 ) ) ( not ( = ?auto_201976 ?auto_201978 ) ) ( not ( = ?auto_201976 ?auto_201979 ) ) ( not ( = ?auto_201976 ?auto_201980 ) ) ( not ( = ?auto_201976 ?auto_201981 ) ) ( not ( = ?auto_201976 ?auto_201982 ) ) ( not ( = ?auto_201977 ?auto_201978 ) ) ( not ( = ?auto_201977 ?auto_201979 ) ) ( not ( = ?auto_201977 ?auto_201980 ) ) ( not ( = ?auto_201977 ?auto_201981 ) ) ( not ( = ?auto_201977 ?auto_201982 ) ) ( not ( = ?auto_201978 ?auto_201979 ) ) ( not ( = ?auto_201978 ?auto_201980 ) ) ( not ( = ?auto_201978 ?auto_201981 ) ) ( not ( = ?auto_201978 ?auto_201982 ) ) ( not ( = ?auto_201979 ?auto_201980 ) ) ( not ( = ?auto_201979 ?auto_201981 ) ) ( not ( = ?auto_201979 ?auto_201982 ) ) ( not ( = ?auto_201980 ?auto_201981 ) ) ( not ( = ?auto_201980 ?auto_201982 ) ) ( not ( = ?auto_201981 ?auto_201982 ) ) ( ON ?auto_201980 ?auto_201981 ) ( ON ?auto_201979 ?auto_201980 ) ( ON ?auto_201978 ?auto_201979 ) ( ON ?auto_201977 ?auto_201978 ) ( ON ?auto_201976 ?auto_201977 ) ( ON ?auto_201975 ?auto_201976 ) ( ON ?auto_201974 ?auto_201975 ) ( CLEAR ?auto_201972 ) ( ON ?auto_201973 ?auto_201974 ) ( CLEAR ?auto_201973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_201971 ?auto_201972 ?auto_201973 )
      ( MAKE-11PILE ?auto_201971 ?auto_201972 ?auto_201973 ?auto_201974 ?auto_201975 ?auto_201976 ?auto_201977 ?auto_201978 ?auto_201979 ?auto_201980 ?auto_201981 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_202017 - BLOCK
      ?auto_202018 - BLOCK
      ?auto_202019 - BLOCK
      ?auto_202020 - BLOCK
      ?auto_202021 - BLOCK
      ?auto_202022 - BLOCK
      ?auto_202023 - BLOCK
      ?auto_202024 - BLOCK
      ?auto_202025 - BLOCK
      ?auto_202026 - BLOCK
      ?auto_202027 - BLOCK
    )
    :vars
    (
      ?auto_202028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202027 ?auto_202028 ) ( ON-TABLE ?auto_202017 ) ( not ( = ?auto_202017 ?auto_202018 ) ) ( not ( = ?auto_202017 ?auto_202019 ) ) ( not ( = ?auto_202017 ?auto_202020 ) ) ( not ( = ?auto_202017 ?auto_202021 ) ) ( not ( = ?auto_202017 ?auto_202022 ) ) ( not ( = ?auto_202017 ?auto_202023 ) ) ( not ( = ?auto_202017 ?auto_202024 ) ) ( not ( = ?auto_202017 ?auto_202025 ) ) ( not ( = ?auto_202017 ?auto_202026 ) ) ( not ( = ?auto_202017 ?auto_202027 ) ) ( not ( = ?auto_202017 ?auto_202028 ) ) ( not ( = ?auto_202018 ?auto_202019 ) ) ( not ( = ?auto_202018 ?auto_202020 ) ) ( not ( = ?auto_202018 ?auto_202021 ) ) ( not ( = ?auto_202018 ?auto_202022 ) ) ( not ( = ?auto_202018 ?auto_202023 ) ) ( not ( = ?auto_202018 ?auto_202024 ) ) ( not ( = ?auto_202018 ?auto_202025 ) ) ( not ( = ?auto_202018 ?auto_202026 ) ) ( not ( = ?auto_202018 ?auto_202027 ) ) ( not ( = ?auto_202018 ?auto_202028 ) ) ( not ( = ?auto_202019 ?auto_202020 ) ) ( not ( = ?auto_202019 ?auto_202021 ) ) ( not ( = ?auto_202019 ?auto_202022 ) ) ( not ( = ?auto_202019 ?auto_202023 ) ) ( not ( = ?auto_202019 ?auto_202024 ) ) ( not ( = ?auto_202019 ?auto_202025 ) ) ( not ( = ?auto_202019 ?auto_202026 ) ) ( not ( = ?auto_202019 ?auto_202027 ) ) ( not ( = ?auto_202019 ?auto_202028 ) ) ( not ( = ?auto_202020 ?auto_202021 ) ) ( not ( = ?auto_202020 ?auto_202022 ) ) ( not ( = ?auto_202020 ?auto_202023 ) ) ( not ( = ?auto_202020 ?auto_202024 ) ) ( not ( = ?auto_202020 ?auto_202025 ) ) ( not ( = ?auto_202020 ?auto_202026 ) ) ( not ( = ?auto_202020 ?auto_202027 ) ) ( not ( = ?auto_202020 ?auto_202028 ) ) ( not ( = ?auto_202021 ?auto_202022 ) ) ( not ( = ?auto_202021 ?auto_202023 ) ) ( not ( = ?auto_202021 ?auto_202024 ) ) ( not ( = ?auto_202021 ?auto_202025 ) ) ( not ( = ?auto_202021 ?auto_202026 ) ) ( not ( = ?auto_202021 ?auto_202027 ) ) ( not ( = ?auto_202021 ?auto_202028 ) ) ( not ( = ?auto_202022 ?auto_202023 ) ) ( not ( = ?auto_202022 ?auto_202024 ) ) ( not ( = ?auto_202022 ?auto_202025 ) ) ( not ( = ?auto_202022 ?auto_202026 ) ) ( not ( = ?auto_202022 ?auto_202027 ) ) ( not ( = ?auto_202022 ?auto_202028 ) ) ( not ( = ?auto_202023 ?auto_202024 ) ) ( not ( = ?auto_202023 ?auto_202025 ) ) ( not ( = ?auto_202023 ?auto_202026 ) ) ( not ( = ?auto_202023 ?auto_202027 ) ) ( not ( = ?auto_202023 ?auto_202028 ) ) ( not ( = ?auto_202024 ?auto_202025 ) ) ( not ( = ?auto_202024 ?auto_202026 ) ) ( not ( = ?auto_202024 ?auto_202027 ) ) ( not ( = ?auto_202024 ?auto_202028 ) ) ( not ( = ?auto_202025 ?auto_202026 ) ) ( not ( = ?auto_202025 ?auto_202027 ) ) ( not ( = ?auto_202025 ?auto_202028 ) ) ( not ( = ?auto_202026 ?auto_202027 ) ) ( not ( = ?auto_202026 ?auto_202028 ) ) ( not ( = ?auto_202027 ?auto_202028 ) ) ( ON ?auto_202026 ?auto_202027 ) ( ON ?auto_202025 ?auto_202026 ) ( ON ?auto_202024 ?auto_202025 ) ( ON ?auto_202023 ?auto_202024 ) ( ON ?auto_202022 ?auto_202023 ) ( ON ?auto_202021 ?auto_202022 ) ( ON ?auto_202020 ?auto_202021 ) ( ON ?auto_202019 ?auto_202020 ) ( CLEAR ?auto_202017 ) ( ON ?auto_202018 ?auto_202019 ) ( CLEAR ?auto_202018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_202017 ?auto_202018 )
      ( MAKE-11PILE ?auto_202017 ?auto_202018 ?auto_202019 ?auto_202020 ?auto_202021 ?auto_202022 ?auto_202023 ?auto_202024 ?auto_202025 ?auto_202026 ?auto_202027 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_202063 - BLOCK
      ?auto_202064 - BLOCK
      ?auto_202065 - BLOCK
      ?auto_202066 - BLOCK
      ?auto_202067 - BLOCK
      ?auto_202068 - BLOCK
      ?auto_202069 - BLOCK
      ?auto_202070 - BLOCK
      ?auto_202071 - BLOCK
      ?auto_202072 - BLOCK
      ?auto_202073 - BLOCK
    )
    :vars
    (
      ?auto_202074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202073 ?auto_202074 ) ( not ( = ?auto_202063 ?auto_202064 ) ) ( not ( = ?auto_202063 ?auto_202065 ) ) ( not ( = ?auto_202063 ?auto_202066 ) ) ( not ( = ?auto_202063 ?auto_202067 ) ) ( not ( = ?auto_202063 ?auto_202068 ) ) ( not ( = ?auto_202063 ?auto_202069 ) ) ( not ( = ?auto_202063 ?auto_202070 ) ) ( not ( = ?auto_202063 ?auto_202071 ) ) ( not ( = ?auto_202063 ?auto_202072 ) ) ( not ( = ?auto_202063 ?auto_202073 ) ) ( not ( = ?auto_202063 ?auto_202074 ) ) ( not ( = ?auto_202064 ?auto_202065 ) ) ( not ( = ?auto_202064 ?auto_202066 ) ) ( not ( = ?auto_202064 ?auto_202067 ) ) ( not ( = ?auto_202064 ?auto_202068 ) ) ( not ( = ?auto_202064 ?auto_202069 ) ) ( not ( = ?auto_202064 ?auto_202070 ) ) ( not ( = ?auto_202064 ?auto_202071 ) ) ( not ( = ?auto_202064 ?auto_202072 ) ) ( not ( = ?auto_202064 ?auto_202073 ) ) ( not ( = ?auto_202064 ?auto_202074 ) ) ( not ( = ?auto_202065 ?auto_202066 ) ) ( not ( = ?auto_202065 ?auto_202067 ) ) ( not ( = ?auto_202065 ?auto_202068 ) ) ( not ( = ?auto_202065 ?auto_202069 ) ) ( not ( = ?auto_202065 ?auto_202070 ) ) ( not ( = ?auto_202065 ?auto_202071 ) ) ( not ( = ?auto_202065 ?auto_202072 ) ) ( not ( = ?auto_202065 ?auto_202073 ) ) ( not ( = ?auto_202065 ?auto_202074 ) ) ( not ( = ?auto_202066 ?auto_202067 ) ) ( not ( = ?auto_202066 ?auto_202068 ) ) ( not ( = ?auto_202066 ?auto_202069 ) ) ( not ( = ?auto_202066 ?auto_202070 ) ) ( not ( = ?auto_202066 ?auto_202071 ) ) ( not ( = ?auto_202066 ?auto_202072 ) ) ( not ( = ?auto_202066 ?auto_202073 ) ) ( not ( = ?auto_202066 ?auto_202074 ) ) ( not ( = ?auto_202067 ?auto_202068 ) ) ( not ( = ?auto_202067 ?auto_202069 ) ) ( not ( = ?auto_202067 ?auto_202070 ) ) ( not ( = ?auto_202067 ?auto_202071 ) ) ( not ( = ?auto_202067 ?auto_202072 ) ) ( not ( = ?auto_202067 ?auto_202073 ) ) ( not ( = ?auto_202067 ?auto_202074 ) ) ( not ( = ?auto_202068 ?auto_202069 ) ) ( not ( = ?auto_202068 ?auto_202070 ) ) ( not ( = ?auto_202068 ?auto_202071 ) ) ( not ( = ?auto_202068 ?auto_202072 ) ) ( not ( = ?auto_202068 ?auto_202073 ) ) ( not ( = ?auto_202068 ?auto_202074 ) ) ( not ( = ?auto_202069 ?auto_202070 ) ) ( not ( = ?auto_202069 ?auto_202071 ) ) ( not ( = ?auto_202069 ?auto_202072 ) ) ( not ( = ?auto_202069 ?auto_202073 ) ) ( not ( = ?auto_202069 ?auto_202074 ) ) ( not ( = ?auto_202070 ?auto_202071 ) ) ( not ( = ?auto_202070 ?auto_202072 ) ) ( not ( = ?auto_202070 ?auto_202073 ) ) ( not ( = ?auto_202070 ?auto_202074 ) ) ( not ( = ?auto_202071 ?auto_202072 ) ) ( not ( = ?auto_202071 ?auto_202073 ) ) ( not ( = ?auto_202071 ?auto_202074 ) ) ( not ( = ?auto_202072 ?auto_202073 ) ) ( not ( = ?auto_202072 ?auto_202074 ) ) ( not ( = ?auto_202073 ?auto_202074 ) ) ( ON ?auto_202072 ?auto_202073 ) ( ON ?auto_202071 ?auto_202072 ) ( ON ?auto_202070 ?auto_202071 ) ( ON ?auto_202069 ?auto_202070 ) ( ON ?auto_202068 ?auto_202069 ) ( ON ?auto_202067 ?auto_202068 ) ( ON ?auto_202066 ?auto_202067 ) ( ON ?auto_202065 ?auto_202066 ) ( ON ?auto_202064 ?auto_202065 ) ( ON ?auto_202063 ?auto_202064 ) ( CLEAR ?auto_202063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_202063 )
      ( MAKE-11PILE ?auto_202063 ?auto_202064 ?auto_202065 ?auto_202066 ?auto_202067 ?auto_202068 ?auto_202069 ?auto_202070 ?auto_202071 ?auto_202072 ?auto_202073 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_202110 - BLOCK
      ?auto_202111 - BLOCK
      ?auto_202112 - BLOCK
      ?auto_202113 - BLOCK
      ?auto_202114 - BLOCK
      ?auto_202115 - BLOCK
      ?auto_202116 - BLOCK
      ?auto_202117 - BLOCK
      ?auto_202118 - BLOCK
      ?auto_202119 - BLOCK
      ?auto_202120 - BLOCK
      ?auto_202121 - BLOCK
    )
    :vars
    (
      ?auto_202122 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_202120 ) ( ON ?auto_202121 ?auto_202122 ) ( CLEAR ?auto_202121 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_202110 ) ( ON ?auto_202111 ?auto_202110 ) ( ON ?auto_202112 ?auto_202111 ) ( ON ?auto_202113 ?auto_202112 ) ( ON ?auto_202114 ?auto_202113 ) ( ON ?auto_202115 ?auto_202114 ) ( ON ?auto_202116 ?auto_202115 ) ( ON ?auto_202117 ?auto_202116 ) ( ON ?auto_202118 ?auto_202117 ) ( ON ?auto_202119 ?auto_202118 ) ( ON ?auto_202120 ?auto_202119 ) ( not ( = ?auto_202110 ?auto_202111 ) ) ( not ( = ?auto_202110 ?auto_202112 ) ) ( not ( = ?auto_202110 ?auto_202113 ) ) ( not ( = ?auto_202110 ?auto_202114 ) ) ( not ( = ?auto_202110 ?auto_202115 ) ) ( not ( = ?auto_202110 ?auto_202116 ) ) ( not ( = ?auto_202110 ?auto_202117 ) ) ( not ( = ?auto_202110 ?auto_202118 ) ) ( not ( = ?auto_202110 ?auto_202119 ) ) ( not ( = ?auto_202110 ?auto_202120 ) ) ( not ( = ?auto_202110 ?auto_202121 ) ) ( not ( = ?auto_202110 ?auto_202122 ) ) ( not ( = ?auto_202111 ?auto_202112 ) ) ( not ( = ?auto_202111 ?auto_202113 ) ) ( not ( = ?auto_202111 ?auto_202114 ) ) ( not ( = ?auto_202111 ?auto_202115 ) ) ( not ( = ?auto_202111 ?auto_202116 ) ) ( not ( = ?auto_202111 ?auto_202117 ) ) ( not ( = ?auto_202111 ?auto_202118 ) ) ( not ( = ?auto_202111 ?auto_202119 ) ) ( not ( = ?auto_202111 ?auto_202120 ) ) ( not ( = ?auto_202111 ?auto_202121 ) ) ( not ( = ?auto_202111 ?auto_202122 ) ) ( not ( = ?auto_202112 ?auto_202113 ) ) ( not ( = ?auto_202112 ?auto_202114 ) ) ( not ( = ?auto_202112 ?auto_202115 ) ) ( not ( = ?auto_202112 ?auto_202116 ) ) ( not ( = ?auto_202112 ?auto_202117 ) ) ( not ( = ?auto_202112 ?auto_202118 ) ) ( not ( = ?auto_202112 ?auto_202119 ) ) ( not ( = ?auto_202112 ?auto_202120 ) ) ( not ( = ?auto_202112 ?auto_202121 ) ) ( not ( = ?auto_202112 ?auto_202122 ) ) ( not ( = ?auto_202113 ?auto_202114 ) ) ( not ( = ?auto_202113 ?auto_202115 ) ) ( not ( = ?auto_202113 ?auto_202116 ) ) ( not ( = ?auto_202113 ?auto_202117 ) ) ( not ( = ?auto_202113 ?auto_202118 ) ) ( not ( = ?auto_202113 ?auto_202119 ) ) ( not ( = ?auto_202113 ?auto_202120 ) ) ( not ( = ?auto_202113 ?auto_202121 ) ) ( not ( = ?auto_202113 ?auto_202122 ) ) ( not ( = ?auto_202114 ?auto_202115 ) ) ( not ( = ?auto_202114 ?auto_202116 ) ) ( not ( = ?auto_202114 ?auto_202117 ) ) ( not ( = ?auto_202114 ?auto_202118 ) ) ( not ( = ?auto_202114 ?auto_202119 ) ) ( not ( = ?auto_202114 ?auto_202120 ) ) ( not ( = ?auto_202114 ?auto_202121 ) ) ( not ( = ?auto_202114 ?auto_202122 ) ) ( not ( = ?auto_202115 ?auto_202116 ) ) ( not ( = ?auto_202115 ?auto_202117 ) ) ( not ( = ?auto_202115 ?auto_202118 ) ) ( not ( = ?auto_202115 ?auto_202119 ) ) ( not ( = ?auto_202115 ?auto_202120 ) ) ( not ( = ?auto_202115 ?auto_202121 ) ) ( not ( = ?auto_202115 ?auto_202122 ) ) ( not ( = ?auto_202116 ?auto_202117 ) ) ( not ( = ?auto_202116 ?auto_202118 ) ) ( not ( = ?auto_202116 ?auto_202119 ) ) ( not ( = ?auto_202116 ?auto_202120 ) ) ( not ( = ?auto_202116 ?auto_202121 ) ) ( not ( = ?auto_202116 ?auto_202122 ) ) ( not ( = ?auto_202117 ?auto_202118 ) ) ( not ( = ?auto_202117 ?auto_202119 ) ) ( not ( = ?auto_202117 ?auto_202120 ) ) ( not ( = ?auto_202117 ?auto_202121 ) ) ( not ( = ?auto_202117 ?auto_202122 ) ) ( not ( = ?auto_202118 ?auto_202119 ) ) ( not ( = ?auto_202118 ?auto_202120 ) ) ( not ( = ?auto_202118 ?auto_202121 ) ) ( not ( = ?auto_202118 ?auto_202122 ) ) ( not ( = ?auto_202119 ?auto_202120 ) ) ( not ( = ?auto_202119 ?auto_202121 ) ) ( not ( = ?auto_202119 ?auto_202122 ) ) ( not ( = ?auto_202120 ?auto_202121 ) ) ( not ( = ?auto_202120 ?auto_202122 ) ) ( not ( = ?auto_202121 ?auto_202122 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_202121 ?auto_202122 )
      ( !STACK ?auto_202121 ?auto_202120 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_202135 - BLOCK
      ?auto_202136 - BLOCK
      ?auto_202137 - BLOCK
      ?auto_202138 - BLOCK
      ?auto_202139 - BLOCK
      ?auto_202140 - BLOCK
      ?auto_202141 - BLOCK
      ?auto_202142 - BLOCK
      ?auto_202143 - BLOCK
      ?auto_202144 - BLOCK
      ?auto_202145 - BLOCK
      ?auto_202146 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_202145 ) ( ON-TABLE ?auto_202146 ) ( CLEAR ?auto_202146 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_202135 ) ( ON ?auto_202136 ?auto_202135 ) ( ON ?auto_202137 ?auto_202136 ) ( ON ?auto_202138 ?auto_202137 ) ( ON ?auto_202139 ?auto_202138 ) ( ON ?auto_202140 ?auto_202139 ) ( ON ?auto_202141 ?auto_202140 ) ( ON ?auto_202142 ?auto_202141 ) ( ON ?auto_202143 ?auto_202142 ) ( ON ?auto_202144 ?auto_202143 ) ( ON ?auto_202145 ?auto_202144 ) ( not ( = ?auto_202135 ?auto_202136 ) ) ( not ( = ?auto_202135 ?auto_202137 ) ) ( not ( = ?auto_202135 ?auto_202138 ) ) ( not ( = ?auto_202135 ?auto_202139 ) ) ( not ( = ?auto_202135 ?auto_202140 ) ) ( not ( = ?auto_202135 ?auto_202141 ) ) ( not ( = ?auto_202135 ?auto_202142 ) ) ( not ( = ?auto_202135 ?auto_202143 ) ) ( not ( = ?auto_202135 ?auto_202144 ) ) ( not ( = ?auto_202135 ?auto_202145 ) ) ( not ( = ?auto_202135 ?auto_202146 ) ) ( not ( = ?auto_202136 ?auto_202137 ) ) ( not ( = ?auto_202136 ?auto_202138 ) ) ( not ( = ?auto_202136 ?auto_202139 ) ) ( not ( = ?auto_202136 ?auto_202140 ) ) ( not ( = ?auto_202136 ?auto_202141 ) ) ( not ( = ?auto_202136 ?auto_202142 ) ) ( not ( = ?auto_202136 ?auto_202143 ) ) ( not ( = ?auto_202136 ?auto_202144 ) ) ( not ( = ?auto_202136 ?auto_202145 ) ) ( not ( = ?auto_202136 ?auto_202146 ) ) ( not ( = ?auto_202137 ?auto_202138 ) ) ( not ( = ?auto_202137 ?auto_202139 ) ) ( not ( = ?auto_202137 ?auto_202140 ) ) ( not ( = ?auto_202137 ?auto_202141 ) ) ( not ( = ?auto_202137 ?auto_202142 ) ) ( not ( = ?auto_202137 ?auto_202143 ) ) ( not ( = ?auto_202137 ?auto_202144 ) ) ( not ( = ?auto_202137 ?auto_202145 ) ) ( not ( = ?auto_202137 ?auto_202146 ) ) ( not ( = ?auto_202138 ?auto_202139 ) ) ( not ( = ?auto_202138 ?auto_202140 ) ) ( not ( = ?auto_202138 ?auto_202141 ) ) ( not ( = ?auto_202138 ?auto_202142 ) ) ( not ( = ?auto_202138 ?auto_202143 ) ) ( not ( = ?auto_202138 ?auto_202144 ) ) ( not ( = ?auto_202138 ?auto_202145 ) ) ( not ( = ?auto_202138 ?auto_202146 ) ) ( not ( = ?auto_202139 ?auto_202140 ) ) ( not ( = ?auto_202139 ?auto_202141 ) ) ( not ( = ?auto_202139 ?auto_202142 ) ) ( not ( = ?auto_202139 ?auto_202143 ) ) ( not ( = ?auto_202139 ?auto_202144 ) ) ( not ( = ?auto_202139 ?auto_202145 ) ) ( not ( = ?auto_202139 ?auto_202146 ) ) ( not ( = ?auto_202140 ?auto_202141 ) ) ( not ( = ?auto_202140 ?auto_202142 ) ) ( not ( = ?auto_202140 ?auto_202143 ) ) ( not ( = ?auto_202140 ?auto_202144 ) ) ( not ( = ?auto_202140 ?auto_202145 ) ) ( not ( = ?auto_202140 ?auto_202146 ) ) ( not ( = ?auto_202141 ?auto_202142 ) ) ( not ( = ?auto_202141 ?auto_202143 ) ) ( not ( = ?auto_202141 ?auto_202144 ) ) ( not ( = ?auto_202141 ?auto_202145 ) ) ( not ( = ?auto_202141 ?auto_202146 ) ) ( not ( = ?auto_202142 ?auto_202143 ) ) ( not ( = ?auto_202142 ?auto_202144 ) ) ( not ( = ?auto_202142 ?auto_202145 ) ) ( not ( = ?auto_202142 ?auto_202146 ) ) ( not ( = ?auto_202143 ?auto_202144 ) ) ( not ( = ?auto_202143 ?auto_202145 ) ) ( not ( = ?auto_202143 ?auto_202146 ) ) ( not ( = ?auto_202144 ?auto_202145 ) ) ( not ( = ?auto_202144 ?auto_202146 ) ) ( not ( = ?auto_202145 ?auto_202146 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_202146 )
      ( !STACK ?auto_202146 ?auto_202145 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_202159 - BLOCK
      ?auto_202160 - BLOCK
      ?auto_202161 - BLOCK
      ?auto_202162 - BLOCK
      ?auto_202163 - BLOCK
      ?auto_202164 - BLOCK
      ?auto_202165 - BLOCK
      ?auto_202166 - BLOCK
      ?auto_202167 - BLOCK
      ?auto_202168 - BLOCK
      ?auto_202169 - BLOCK
      ?auto_202170 - BLOCK
    )
    :vars
    (
      ?auto_202171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202170 ?auto_202171 ) ( ON-TABLE ?auto_202159 ) ( ON ?auto_202160 ?auto_202159 ) ( ON ?auto_202161 ?auto_202160 ) ( ON ?auto_202162 ?auto_202161 ) ( ON ?auto_202163 ?auto_202162 ) ( ON ?auto_202164 ?auto_202163 ) ( ON ?auto_202165 ?auto_202164 ) ( ON ?auto_202166 ?auto_202165 ) ( ON ?auto_202167 ?auto_202166 ) ( ON ?auto_202168 ?auto_202167 ) ( not ( = ?auto_202159 ?auto_202160 ) ) ( not ( = ?auto_202159 ?auto_202161 ) ) ( not ( = ?auto_202159 ?auto_202162 ) ) ( not ( = ?auto_202159 ?auto_202163 ) ) ( not ( = ?auto_202159 ?auto_202164 ) ) ( not ( = ?auto_202159 ?auto_202165 ) ) ( not ( = ?auto_202159 ?auto_202166 ) ) ( not ( = ?auto_202159 ?auto_202167 ) ) ( not ( = ?auto_202159 ?auto_202168 ) ) ( not ( = ?auto_202159 ?auto_202169 ) ) ( not ( = ?auto_202159 ?auto_202170 ) ) ( not ( = ?auto_202159 ?auto_202171 ) ) ( not ( = ?auto_202160 ?auto_202161 ) ) ( not ( = ?auto_202160 ?auto_202162 ) ) ( not ( = ?auto_202160 ?auto_202163 ) ) ( not ( = ?auto_202160 ?auto_202164 ) ) ( not ( = ?auto_202160 ?auto_202165 ) ) ( not ( = ?auto_202160 ?auto_202166 ) ) ( not ( = ?auto_202160 ?auto_202167 ) ) ( not ( = ?auto_202160 ?auto_202168 ) ) ( not ( = ?auto_202160 ?auto_202169 ) ) ( not ( = ?auto_202160 ?auto_202170 ) ) ( not ( = ?auto_202160 ?auto_202171 ) ) ( not ( = ?auto_202161 ?auto_202162 ) ) ( not ( = ?auto_202161 ?auto_202163 ) ) ( not ( = ?auto_202161 ?auto_202164 ) ) ( not ( = ?auto_202161 ?auto_202165 ) ) ( not ( = ?auto_202161 ?auto_202166 ) ) ( not ( = ?auto_202161 ?auto_202167 ) ) ( not ( = ?auto_202161 ?auto_202168 ) ) ( not ( = ?auto_202161 ?auto_202169 ) ) ( not ( = ?auto_202161 ?auto_202170 ) ) ( not ( = ?auto_202161 ?auto_202171 ) ) ( not ( = ?auto_202162 ?auto_202163 ) ) ( not ( = ?auto_202162 ?auto_202164 ) ) ( not ( = ?auto_202162 ?auto_202165 ) ) ( not ( = ?auto_202162 ?auto_202166 ) ) ( not ( = ?auto_202162 ?auto_202167 ) ) ( not ( = ?auto_202162 ?auto_202168 ) ) ( not ( = ?auto_202162 ?auto_202169 ) ) ( not ( = ?auto_202162 ?auto_202170 ) ) ( not ( = ?auto_202162 ?auto_202171 ) ) ( not ( = ?auto_202163 ?auto_202164 ) ) ( not ( = ?auto_202163 ?auto_202165 ) ) ( not ( = ?auto_202163 ?auto_202166 ) ) ( not ( = ?auto_202163 ?auto_202167 ) ) ( not ( = ?auto_202163 ?auto_202168 ) ) ( not ( = ?auto_202163 ?auto_202169 ) ) ( not ( = ?auto_202163 ?auto_202170 ) ) ( not ( = ?auto_202163 ?auto_202171 ) ) ( not ( = ?auto_202164 ?auto_202165 ) ) ( not ( = ?auto_202164 ?auto_202166 ) ) ( not ( = ?auto_202164 ?auto_202167 ) ) ( not ( = ?auto_202164 ?auto_202168 ) ) ( not ( = ?auto_202164 ?auto_202169 ) ) ( not ( = ?auto_202164 ?auto_202170 ) ) ( not ( = ?auto_202164 ?auto_202171 ) ) ( not ( = ?auto_202165 ?auto_202166 ) ) ( not ( = ?auto_202165 ?auto_202167 ) ) ( not ( = ?auto_202165 ?auto_202168 ) ) ( not ( = ?auto_202165 ?auto_202169 ) ) ( not ( = ?auto_202165 ?auto_202170 ) ) ( not ( = ?auto_202165 ?auto_202171 ) ) ( not ( = ?auto_202166 ?auto_202167 ) ) ( not ( = ?auto_202166 ?auto_202168 ) ) ( not ( = ?auto_202166 ?auto_202169 ) ) ( not ( = ?auto_202166 ?auto_202170 ) ) ( not ( = ?auto_202166 ?auto_202171 ) ) ( not ( = ?auto_202167 ?auto_202168 ) ) ( not ( = ?auto_202167 ?auto_202169 ) ) ( not ( = ?auto_202167 ?auto_202170 ) ) ( not ( = ?auto_202167 ?auto_202171 ) ) ( not ( = ?auto_202168 ?auto_202169 ) ) ( not ( = ?auto_202168 ?auto_202170 ) ) ( not ( = ?auto_202168 ?auto_202171 ) ) ( not ( = ?auto_202169 ?auto_202170 ) ) ( not ( = ?auto_202169 ?auto_202171 ) ) ( not ( = ?auto_202170 ?auto_202171 ) ) ( CLEAR ?auto_202168 ) ( ON ?auto_202169 ?auto_202170 ) ( CLEAR ?auto_202169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_202159 ?auto_202160 ?auto_202161 ?auto_202162 ?auto_202163 ?auto_202164 ?auto_202165 ?auto_202166 ?auto_202167 ?auto_202168 ?auto_202169 )
      ( MAKE-12PILE ?auto_202159 ?auto_202160 ?auto_202161 ?auto_202162 ?auto_202163 ?auto_202164 ?auto_202165 ?auto_202166 ?auto_202167 ?auto_202168 ?auto_202169 ?auto_202170 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_202184 - BLOCK
      ?auto_202185 - BLOCK
      ?auto_202186 - BLOCK
      ?auto_202187 - BLOCK
      ?auto_202188 - BLOCK
      ?auto_202189 - BLOCK
      ?auto_202190 - BLOCK
      ?auto_202191 - BLOCK
      ?auto_202192 - BLOCK
      ?auto_202193 - BLOCK
      ?auto_202194 - BLOCK
      ?auto_202195 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202195 ) ( ON-TABLE ?auto_202184 ) ( ON ?auto_202185 ?auto_202184 ) ( ON ?auto_202186 ?auto_202185 ) ( ON ?auto_202187 ?auto_202186 ) ( ON ?auto_202188 ?auto_202187 ) ( ON ?auto_202189 ?auto_202188 ) ( ON ?auto_202190 ?auto_202189 ) ( ON ?auto_202191 ?auto_202190 ) ( ON ?auto_202192 ?auto_202191 ) ( ON ?auto_202193 ?auto_202192 ) ( not ( = ?auto_202184 ?auto_202185 ) ) ( not ( = ?auto_202184 ?auto_202186 ) ) ( not ( = ?auto_202184 ?auto_202187 ) ) ( not ( = ?auto_202184 ?auto_202188 ) ) ( not ( = ?auto_202184 ?auto_202189 ) ) ( not ( = ?auto_202184 ?auto_202190 ) ) ( not ( = ?auto_202184 ?auto_202191 ) ) ( not ( = ?auto_202184 ?auto_202192 ) ) ( not ( = ?auto_202184 ?auto_202193 ) ) ( not ( = ?auto_202184 ?auto_202194 ) ) ( not ( = ?auto_202184 ?auto_202195 ) ) ( not ( = ?auto_202185 ?auto_202186 ) ) ( not ( = ?auto_202185 ?auto_202187 ) ) ( not ( = ?auto_202185 ?auto_202188 ) ) ( not ( = ?auto_202185 ?auto_202189 ) ) ( not ( = ?auto_202185 ?auto_202190 ) ) ( not ( = ?auto_202185 ?auto_202191 ) ) ( not ( = ?auto_202185 ?auto_202192 ) ) ( not ( = ?auto_202185 ?auto_202193 ) ) ( not ( = ?auto_202185 ?auto_202194 ) ) ( not ( = ?auto_202185 ?auto_202195 ) ) ( not ( = ?auto_202186 ?auto_202187 ) ) ( not ( = ?auto_202186 ?auto_202188 ) ) ( not ( = ?auto_202186 ?auto_202189 ) ) ( not ( = ?auto_202186 ?auto_202190 ) ) ( not ( = ?auto_202186 ?auto_202191 ) ) ( not ( = ?auto_202186 ?auto_202192 ) ) ( not ( = ?auto_202186 ?auto_202193 ) ) ( not ( = ?auto_202186 ?auto_202194 ) ) ( not ( = ?auto_202186 ?auto_202195 ) ) ( not ( = ?auto_202187 ?auto_202188 ) ) ( not ( = ?auto_202187 ?auto_202189 ) ) ( not ( = ?auto_202187 ?auto_202190 ) ) ( not ( = ?auto_202187 ?auto_202191 ) ) ( not ( = ?auto_202187 ?auto_202192 ) ) ( not ( = ?auto_202187 ?auto_202193 ) ) ( not ( = ?auto_202187 ?auto_202194 ) ) ( not ( = ?auto_202187 ?auto_202195 ) ) ( not ( = ?auto_202188 ?auto_202189 ) ) ( not ( = ?auto_202188 ?auto_202190 ) ) ( not ( = ?auto_202188 ?auto_202191 ) ) ( not ( = ?auto_202188 ?auto_202192 ) ) ( not ( = ?auto_202188 ?auto_202193 ) ) ( not ( = ?auto_202188 ?auto_202194 ) ) ( not ( = ?auto_202188 ?auto_202195 ) ) ( not ( = ?auto_202189 ?auto_202190 ) ) ( not ( = ?auto_202189 ?auto_202191 ) ) ( not ( = ?auto_202189 ?auto_202192 ) ) ( not ( = ?auto_202189 ?auto_202193 ) ) ( not ( = ?auto_202189 ?auto_202194 ) ) ( not ( = ?auto_202189 ?auto_202195 ) ) ( not ( = ?auto_202190 ?auto_202191 ) ) ( not ( = ?auto_202190 ?auto_202192 ) ) ( not ( = ?auto_202190 ?auto_202193 ) ) ( not ( = ?auto_202190 ?auto_202194 ) ) ( not ( = ?auto_202190 ?auto_202195 ) ) ( not ( = ?auto_202191 ?auto_202192 ) ) ( not ( = ?auto_202191 ?auto_202193 ) ) ( not ( = ?auto_202191 ?auto_202194 ) ) ( not ( = ?auto_202191 ?auto_202195 ) ) ( not ( = ?auto_202192 ?auto_202193 ) ) ( not ( = ?auto_202192 ?auto_202194 ) ) ( not ( = ?auto_202192 ?auto_202195 ) ) ( not ( = ?auto_202193 ?auto_202194 ) ) ( not ( = ?auto_202193 ?auto_202195 ) ) ( not ( = ?auto_202194 ?auto_202195 ) ) ( CLEAR ?auto_202193 ) ( ON ?auto_202194 ?auto_202195 ) ( CLEAR ?auto_202194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_202184 ?auto_202185 ?auto_202186 ?auto_202187 ?auto_202188 ?auto_202189 ?auto_202190 ?auto_202191 ?auto_202192 ?auto_202193 ?auto_202194 )
      ( MAKE-12PILE ?auto_202184 ?auto_202185 ?auto_202186 ?auto_202187 ?auto_202188 ?auto_202189 ?auto_202190 ?auto_202191 ?auto_202192 ?auto_202193 ?auto_202194 ?auto_202195 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_202208 - BLOCK
      ?auto_202209 - BLOCK
      ?auto_202210 - BLOCK
      ?auto_202211 - BLOCK
      ?auto_202212 - BLOCK
      ?auto_202213 - BLOCK
      ?auto_202214 - BLOCK
      ?auto_202215 - BLOCK
      ?auto_202216 - BLOCK
      ?auto_202217 - BLOCK
      ?auto_202218 - BLOCK
      ?auto_202219 - BLOCK
    )
    :vars
    (
      ?auto_202220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202219 ?auto_202220 ) ( ON-TABLE ?auto_202208 ) ( ON ?auto_202209 ?auto_202208 ) ( ON ?auto_202210 ?auto_202209 ) ( ON ?auto_202211 ?auto_202210 ) ( ON ?auto_202212 ?auto_202211 ) ( ON ?auto_202213 ?auto_202212 ) ( ON ?auto_202214 ?auto_202213 ) ( ON ?auto_202215 ?auto_202214 ) ( ON ?auto_202216 ?auto_202215 ) ( not ( = ?auto_202208 ?auto_202209 ) ) ( not ( = ?auto_202208 ?auto_202210 ) ) ( not ( = ?auto_202208 ?auto_202211 ) ) ( not ( = ?auto_202208 ?auto_202212 ) ) ( not ( = ?auto_202208 ?auto_202213 ) ) ( not ( = ?auto_202208 ?auto_202214 ) ) ( not ( = ?auto_202208 ?auto_202215 ) ) ( not ( = ?auto_202208 ?auto_202216 ) ) ( not ( = ?auto_202208 ?auto_202217 ) ) ( not ( = ?auto_202208 ?auto_202218 ) ) ( not ( = ?auto_202208 ?auto_202219 ) ) ( not ( = ?auto_202208 ?auto_202220 ) ) ( not ( = ?auto_202209 ?auto_202210 ) ) ( not ( = ?auto_202209 ?auto_202211 ) ) ( not ( = ?auto_202209 ?auto_202212 ) ) ( not ( = ?auto_202209 ?auto_202213 ) ) ( not ( = ?auto_202209 ?auto_202214 ) ) ( not ( = ?auto_202209 ?auto_202215 ) ) ( not ( = ?auto_202209 ?auto_202216 ) ) ( not ( = ?auto_202209 ?auto_202217 ) ) ( not ( = ?auto_202209 ?auto_202218 ) ) ( not ( = ?auto_202209 ?auto_202219 ) ) ( not ( = ?auto_202209 ?auto_202220 ) ) ( not ( = ?auto_202210 ?auto_202211 ) ) ( not ( = ?auto_202210 ?auto_202212 ) ) ( not ( = ?auto_202210 ?auto_202213 ) ) ( not ( = ?auto_202210 ?auto_202214 ) ) ( not ( = ?auto_202210 ?auto_202215 ) ) ( not ( = ?auto_202210 ?auto_202216 ) ) ( not ( = ?auto_202210 ?auto_202217 ) ) ( not ( = ?auto_202210 ?auto_202218 ) ) ( not ( = ?auto_202210 ?auto_202219 ) ) ( not ( = ?auto_202210 ?auto_202220 ) ) ( not ( = ?auto_202211 ?auto_202212 ) ) ( not ( = ?auto_202211 ?auto_202213 ) ) ( not ( = ?auto_202211 ?auto_202214 ) ) ( not ( = ?auto_202211 ?auto_202215 ) ) ( not ( = ?auto_202211 ?auto_202216 ) ) ( not ( = ?auto_202211 ?auto_202217 ) ) ( not ( = ?auto_202211 ?auto_202218 ) ) ( not ( = ?auto_202211 ?auto_202219 ) ) ( not ( = ?auto_202211 ?auto_202220 ) ) ( not ( = ?auto_202212 ?auto_202213 ) ) ( not ( = ?auto_202212 ?auto_202214 ) ) ( not ( = ?auto_202212 ?auto_202215 ) ) ( not ( = ?auto_202212 ?auto_202216 ) ) ( not ( = ?auto_202212 ?auto_202217 ) ) ( not ( = ?auto_202212 ?auto_202218 ) ) ( not ( = ?auto_202212 ?auto_202219 ) ) ( not ( = ?auto_202212 ?auto_202220 ) ) ( not ( = ?auto_202213 ?auto_202214 ) ) ( not ( = ?auto_202213 ?auto_202215 ) ) ( not ( = ?auto_202213 ?auto_202216 ) ) ( not ( = ?auto_202213 ?auto_202217 ) ) ( not ( = ?auto_202213 ?auto_202218 ) ) ( not ( = ?auto_202213 ?auto_202219 ) ) ( not ( = ?auto_202213 ?auto_202220 ) ) ( not ( = ?auto_202214 ?auto_202215 ) ) ( not ( = ?auto_202214 ?auto_202216 ) ) ( not ( = ?auto_202214 ?auto_202217 ) ) ( not ( = ?auto_202214 ?auto_202218 ) ) ( not ( = ?auto_202214 ?auto_202219 ) ) ( not ( = ?auto_202214 ?auto_202220 ) ) ( not ( = ?auto_202215 ?auto_202216 ) ) ( not ( = ?auto_202215 ?auto_202217 ) ) ( not ( = ?auto_202215 ?auto_202218 ) ) ( not ( = ?auto_202215 ?auto_202219 ) ) ( not ( = ?auto_202215 ?auto_202220 ) ) ( not ( = ?auto_202216 ?auto_202217 ) ) ( not ( = ?auto_202216 ?auto_202218 ) ) ( not ( = ?auto_202216 ?auto_202219 ) ) ( not ( = ?auto_202216 ?auto_202220 ) ) ( not ( = ?auto_202217 ?auto_202218 ) ) ( not ( = ?auto_202217 ?auto_202219 ) ) ( not ( = ?auto_202217 ?auto_202220 ) ) ( not ( = ?auto_202218 ?auto_202219 ) ) ( not ( = ?auto_202218 ?auto_202220 ) ) ( not ( = ?auto_202219 ?auto_202220 ) ) ( ON ?auto_202218 ?auto_202219 ) ( CLEAR ?auto_202216 ) ( ON ?auto_202217 ?auto_202218 ) ( CLEAR ?auto_202217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_202208 ?auto_202209 ?auto_202210 ?auto_202211 ?auto_202212 ?auto_202213 ?auto_202214 ?auto_202215 ?auto_202216 ?auto_202217 )
      ( MAKE-12PILE ?auto_202208 ?auto_202209 ?auto_202210 ?auto_202211 ?auto_202212 ?auto_202213 ?auto_202214 ?auto_202215 ?auto_202216 ?auto_202217 ?auto_202218 ?auto_202219 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_202233 - BLOCK
      ?auto_202234 - BLOCK
      ?auto_202235 - BLOCK
      ?auto_202236 - BLOCK
      ?auto_202237 - BLOCK
      ?auto_202238 - BLOCK
      ?auto_202239 - BLOCK
      ?auto_202240 - BLOCK
      ?auto_202241 - BLOCK
      ?auto_202242 - BLOCK
      ?auto_202243 - BLOCK
      ?auto_202244 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202244 ) ( ON-TABLE ?auto_202233 ) ( ON ?auto_202234 ?auto_202233 ) ( ON ?auto_202235 ?auto_202234 ) ( ON ?auto_202236 ?auto_202235 ) ( ON ?auto_202237 ?auto_202236 ) ( ON ?auto_202238 ?auto_202237 ) ( ON ?auto_202239 ?auto_202238 ) ( ON ?auto_202240 ?auto_202239 ) ( ON ?auto_202241 ?auto_202240 ) ( not ( = ?auto_202233 ?auto_202234 ) ) ( not ( = ?auto_202233 ?auto_202235 ) ) ( not ( = ?auto_202233 ?auto_202236 ) ) ( not ( = ?auto_202233 ?auto_202237 ) ) ( not ( = ?auto_202233 ?auto_202238 ) ) ( not ( = ?auto_202233 ?auto_202239 ) ) ( not ( = ?auto_202233 ?auto_202240 ) ) ( not ( = ?auto_202233 ?auto_202241 ) ) ( not ( = ?auto_202233 ?auto_202242 ) ) ( not ( = ?auto_202233 ?auto_202243 ) ) ( not ( = ?auto_202233 ?auto_202244 ) ) ( not ( = ?auto_202234 ?auto_202235 ) ) ( not ( = ?auto_202234 ?auto_202236 ) ) ( not ( = ?auto_202234 ?auto_202237 ) ) ( not ( = ?auto_202234 ?auto_202238 ) ) ( not ( = ?auto_202234 ?auto_202239 ) ) ( not ( = ?auto_202234 ?auto_202240 ) ) ( not ( = ?auto_202234 ?auto_202241 ) ) ( not ( = ?auto_202234 ?auto_202242 ) ) ( not ( = ?auto_202234 ?auto_202243 ) ) ( not ( = ?auto_202234 ?auto_202244 ) ) ( not ( = ?auto_202235 ?auto_202236 ) ) ( not ( = ?auto_202235 ?auto_202237 ) ) ( not ( = ?auto_202235 ?auto_202238 ) ) ( not ( = ?auto_202235 ?auto_202239 ) ) ( not ( = ?auto_202235 ?auto_202240 ) ) ( not ( = ?auto_202235 ?auto_202241 ) ) ( not ( = ?auto_202235 ?auto_202242 ) ) ( not ( = ?auto_202235 ?auto_202243 ) ) ( not ( = ?auto_202235 ?auto_202244 ) ) ( not ( = ?auto_202236 ?auto_202237 ) ) ( not ( = ?auto_202236 ?auto_202238 ) ) ( not ( = ?auto_202236 ?auto_202239 ) ) ( not ( = ?auto_202236 ?auto_202240 ) ) ( not ( = ?auto_202236 ?auto_202241 ) ) ( not ( = ?auto_202236 ?auto_202242 ) ) ( not ( = ?auto_202236 ?auto_202243 ) ) ( not ( = ?auto_202236 ?auto_202244 ) ) ( not ( = ?auto_202237 ?auto_202238 ) ) ( not ( = ?auto_202237 ?auto_202239 ) ) ( not ( = ?auto_202237 ?auto_202240 ) ) ( not ( = ?auto_202237 ?auto_202241 ) ) ( not ( = ?auto_202237 ?auto_202242 ) ) ( not ( = ?auto_202237 ?auto_202243 ) ) ( not ( = ?auto_202237 ?auto_202244 ) ) ( not ( = ?auto_202238 ?auto_202239 ) ) ( not ( = ?auto_202238 ?auto_202240 ) ) ( not ( = ?auto_202238 ?auto_202241 ) ) ( not ( = ?auto_202238 ?auto_202242 ) ) ( not ( = ?auto_202238 ?auto_202243 ) ) ( not ( = ?auto_202238 ?auto_202244 ) ) ( not ( = ?auto_202239 ?auto_202240 ) ) ( not ( = ?auto_202239 ?auto_202241 ) ) ( not ( = ?auto_202239 ?auto_202242 ) ) ( not ( = ?auto_202239 ?auto_202243 ) ) ( not ( = ?auto_202239 ?auto_202244 ) ) ( not ( = ?auto_202240 ?auto_202241 ) ) ( not ( = ?auto_202240 ?auto_202242 ) ) ( not ( = ?auto_202240 ?auto_202243 ) ) ( not ( = ?auto_202240 ?auto_202244 ) ) ( not ( = ?auto_202241 ?auto_202242 ) ) ( not ( = ?auto_202241 ?auto_202243 ) ) ( not ( = ?auto_202241 ?auto_202244 ) ) ( not ( = ?auto_202242 ?auto_202243 ) ) ( not ( = ?auto_202242 ?auto_202244 ) ) ( not ( = ?auto_202243 ?auto_202244 ) ) ( ON ?auto_202243 ?auto_202244 ) ( CLEAR ?auto_202241 ) ( ON ?auto_202242 ?auto_202243 ) ( CLEAR ?auto_202242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_202233 ?auto_202234 ?auto_202235 ?auto_202236 ?auto_202237 ?auto_202238 ?auto_202239 ?auto_202240 ?auto_202241 ?auto_202242 )
      ( MAKE-12PILE ?auto_202233 ?auto_202234 ?auto_202235 ?auto_202236 ?auto_202237 ?auto_202238 ?auto_202239 ?auto_202240 ?auto_202241 ?auto_202242 ?auto_202243 ?auto_202244 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_202257 - BLOCK
      ?auto_202258 - BLOCK
      ?auto_202259 - BLOCK
      ?auto_202260 - BLOCK
      ?auto_202261 - BLOCK
      ?auto_202262 - BLOCK
      ?auto_202263 - BLOCK
      ?auto_202264 - BLOCK
      ?auto_202265 - BLOCK
      ?auto_202266 - BLOCK
      ?auto_202267 - BLOCK
      ?auto_202268 - BLOCK
    )
    :vars
    (
      ?auto_202269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202268 ?auto_202269 ) ( ON-TABLE ?auto_202257 ) ( ON ?auto_202258 ?auto_202257 ) ( ON ?auto_202259 ?auto_202258 ) ( ON ?auto_202260 ?auto_202259 ) ( ON ?auto_202261 ?auto_202260 ) ( ON ?auto_202262 ?auto_202261 ) ( ON ?auto_202263 ?auto_202262 ) ( ON ?auto_202264 ?auto_202263 ) ( not ( = ?auto_202257 ?auto_202258 ) ) ( not ( = ?auto_202257 ?auto_202259 ) ) ( not ( = ?auto_202257 ?auto_202260 ) ) ( not ( = ?auto_202257 ?auto_202261 ) ) ( not ( = ?auto_202257 ?auto_202262 ) ) ( not ( = ?auto_202257 ?auto_202263 ) ) ( not ( = ?auto_202257 ?auto_202264 ) ) ( not ( = ?auto_202257 ?auto_202265 ) ) ( not ( = ?auto_202257 ?auto_202266 ) ) ( not ( = ?auto_202257 ?auto_202267 ) ) ( not ( = ?auto_202257 ?auto_202268 ) ) ( not ( = ?auto_202257 ?auto_202269 ) ) ( not ( = ?auto_202258 ?auto_202259 ) ) ( not ( = ?auto_202258 ?auto_202260 ) ) ( not ( = ?auto_202258 ?auto_202261 ) ) ( not ( = ?auto_202258 ?auto_202262 ) ) ( not ( = ?auto_202258 ?auto_202263 ) ) ( not ( = ?auto_202258 ?auto_202264 ) ) ( not ( = ?auto_202258 ?auto_202265 ) ) ( not ( = ?auto_202258 ?auto_202266 ) ) ( not ( = ?auto_202258 ?auto_202267 ) ) ( not ( = ?auto_202258 ?auto_202268 ) ) ( not ( = ?auto_202258 ?auto_202269 ) ) ( not ( = ?auto_202259 ?auto_202260 ) ) ( not ( = ?auto_202259 ?auto_202261 ) ) ( not ( = ?auto_202259 ?auto_202262 ) ) ( not ( = ?auto_202259 ?auto_202263 ) ) ( not ( = ?auto_202259 ?auto_202264 ) ) ( not ( = ?auto_202259 ?auto_202265 ) ) ( not ( = ?auto_202259 ?auto_202266 ) ) ( not ( = ?auto_202259 ?auto_202267 ) ) ( not ( = ?auto_202259 ?auto_202268 ) ) ( not ( = ?auto_202259 ?auto_202269 ) ) ( not ( = ?auto_202260 ?auto_202261 ) ) ( not ( = ?auto_202260 ?auto_202262 ) ) ( not ( = ?auto_202260 ?auto_202263 ) ) ( not ( = ?auto_202260 ?auto_202264 ) ) ( not ( = ?auto_202260 ?auto_202265 ) ) ( not ( = ?auto_202260 ?auto_202266 ) ) ( not ( = ?auto_202260 ?auto_202267 ) ) ( not ( = ?auto_202260 ?auto_202268 ) ) ( not ( = ?auto_202260 ?auto_202269 ) ) ( not ( = ?auto_202261 ?auto_202262 ) ) ( not ( = ?auto_202261 ?auto_202263 ) ) ( not ( = ?auto_202261 ?auto_202264 ) ) ( not ( = ?auto_202261 ?auto_202265 ) ) ( not ( = ?auto_202261 ?auto_202266 ) ) ( not ( = ?auto_202261 ?auto_202267 ) ) ( not ( = ?auto_202261 ?auto_202268 ) ) ( not ( = ?auto_202261 ?auto_202269 ) ) ( not ( = ?auto_202262 ?auto_202263 ) ) ( not ( = ?auto_202262 ?auto_202264 ) ) ( not ( = ?auto_202262 ?auto_202265 ) ) ( not ( = ?auto_202262 ?auto_202266 ) ) ( not ( = ?auto_202262 ?auto_202267 ) ) ( not ( = ?auto_202262 ?auto_202268 ) ) ( not ( = ?auto_202262 ?auto_202269 ) ) ( not ( = ?auto_202263 ?auto_202264 ) ) ( not ( = ?auto_202263 ?auto_202265 ) ) ( not ( = ?auto_202263 ?auto_202266 ) ) ( not ( = ?auto_202263 ?auto_202267 ) ) ( not ( = ?auto_202263 ?auto_202268 ) ) ( not ( = ?auto_202263 ?auto_202269 ) ) ( not ( = ?auto_202264 ?auto_202265 ) ) ( not ( = ?auto_202264 ?auto_202266 ) ) ( not ( = ?auto_202264 ?auto_202267 ) ) ( not ( = ?auto_202264 ?auto_202268 ) ) ( not ( = ?auto_202264 ?auto_202269 ) ) ( not ( = ?auto_202265 ?auto_202266 ) ) ( not ( = ?auto_202265 ?auto_202267 ) ) ( not ( = ?auto_202265 ?auto_202268 ) ) ( not ( = ?auto_202265 ?auto_202269 ) ) ( not ( = ?auto_202266 ?auto_202267 ) ) ( not ( = ?auto_202266 ?auto_202268 ) ) ( not ( = ?auto_202266 ?auto_202269 ) ) ( not ( = ?auto_202267 ?auto_202268 ) ) ( not ( = ?auto_202267 ?auto_202269 ) ) ( not ( = ?auto_202268 ?auto_202269 ) ) ( ON ?auto_202267 ?auto_202268 ) ( ON ?auto_202266 ?auto_202267 ) ( CLEAR ?auto_202264 ) ( ON ?auto_202265 ?auto_202266 ) ( CLEAR ?auto_202265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_202257 ?auto_202258 ?auto_202259 ?auto_202260 ?auto_202261 ?auto_202262 ?auto_202263 ?auto_202264 ?auto_202265 )
      ( MAKE-12PILE ?auto_202257 ?auto_202258 ?auto_202259 ?auto_202260 ?auto_202261 ?auto_202262 ?auto_202263 ?auto_202264 ?auto_202265 ?auto_202266 ?auto_202267 ?auto_202268 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_202282 - BLOCK
      ?auto_202283 - BLOCK
      ?auto_202284 - BLOCK
      ?auto_202285 - BLOCK
      ?auto_202286 - BLOCK
      ?auto_202287 - BLOCK
      ?auto_202288 - BLOCK
      ?auto_202289 - BLOCK
      ?auto_202290 - BLOCK
      ?auto_202291 - BLOCK
      ?auto_202292 - BLOCK
      ?auto_202293 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202293 ) ( ON-TABLE ?auto_202282 ) ( ON ?auto_202283 ?auto_202282 ) ( ON ?auto_202284 ?auto_202283 ) ( ON ?auto_202285 ?auto_202284 ) ( ON ?auto_202286 ?auto_202285 ) ( ON ?auto_202287 ?auto_202286 ) ( ON ?auto_202288 ?auto_202287 ) ( ON ?auto_202289 ?auto_202288 ) ( not ( = ?auto_202282 ?auto_202283 ) ) ( not ( = ?auto_202282 ?auto_202284 ) ) ( not ( = ?auto_202282 ?auto_202285 ) ) ( not ( = ?auto_202282 ?auto_202286 ) ) ( not ( = ?auto_202282 ?auto_202287 ) ) ( not ( = ?auto_202282 ?auto_202288 ) ) ( not ( = ?auto_202282 ?auto_202289 ) ) ( not ( = ?auto_202282 ?auto_202290 ) ) ( not ( = ?auto_202282 ?auto_202291 ) ) ( not ( = ?auto_202282 ?auto_202292 ) ) ( not ( = ?auto_202282 ?auto_202293 ) ) ( not ( = ?auto_202283 ?auto_202284 ) ) ( not ( = ?auto_202283 ?auto_202285 ) ) ( not ( = ?auto_202283 ?auto_202286 ) ) ( not ( = ?auto_202283 ?auto_202287 ) ) ( not ( = ?auto_202283 ?auto_202288 ) ) ( not ( = ?auto_202283 ?auto_202289 ) ) ( not ( = ?auto_202283 ?auto_202290 ) ) ( not ( = ?auto_202283 ?auto_202291 ) ) ( not ( = ?auto_202283 ?auto_202292 ) ) ( not ( = ?auto_202283 ?auto_202293 ) ) ( not ( = ?auto_202284 ?auto_202285 ) ) ( not ( = ?auto_202284 ?auto_202286 ) ) ( not ( = ?auto_202284 ?auto_202287 ) ) ( not ( = ?auto_202284 ?auto_202288 ) ) ( not ( = ?auto_202284 ?auto_202289 ) ) ( not ( = ?auto_202284 ?auto_202290 ) ) ( not ( = ?auto_202284 ?auto_202291 ) ) ( not ( = ?auto_202284 ?auto_202292 ) ) ( not ( = ?auto_202284 ?auto_202293 ) ) ( not ( = ?auto_202285 ?auto_202286 ) ) ( not ( = ?auto_202285 ?auto_202287 ) ) ( not ( = ?auto_202285 ?auto_202288 ) ) ( not ( = ?auto_202285 ?auto_202289 ) ) ( not ( = ?auto_202285 ?auto_202290 ) ) ( not ( = ?auto_202285 ?auto_202291 ) ) ( not ( = ?auto_202285 ?auto_202292 ) ) ( not ( = ?auto_202285 ?auto_202293 ) ) ( not ( = ?auto_202286 ?auto_202287 ) ) ( not ( = ?auto_202286 ?auto_202288 ) ) ( not ( = ?auto_202286 ?auto_202289 ) ) ( not ( = ?auto_202286 ?auto_202290 ) ) ( not ( = ?auto_202286 ?auto_202291 ) ) ( not ( = ?auto_202286 ?auto_202292 ) ) ( not ( = ?auto_202286 ?auto_202293 ) ) ( not ( = ?auto_202287 ?auto_202288 ) ) ( not ( = ?auto_202287 ?auto_202289 ) ) ( not ( = ?auto_202287 ?auto_202290 ) ) ( not ( = ?auto_202287 ?auto_202291 ) ) ( not ( = ?auto_202287 ?auto_202292 ) ) ( not ( = ?auto_202287 ?auto_202293 ) ) ( not ( = ?auto_202288 ?auto_202289 ) ) ( not ( = ?auto_202288 ?auto_202290 ) ) ( not ( = ?auto_202288 ?auto_202291 ) ) ( not ( = ?auto_202288 ?auto_202292 ) ) ( not ( = ?auto_202288 ?auto_202293 ) ) ( not ( = ?auto_202289 ?auto_202290 ) ) ( not ( = ?auto_202289 ?auto_202291 ) ) ( not ( = ?auto_202289 ?auto_202292 ) ) ( not ( = ?auto_202289 ?auto_202293 ) ) ( not ( = ?auto_202290 ?auto_202291 ) ) ( not ( = ?auto_202290 ?auto_202292 ) ) ( not ( = ?auto_202290 ?auto_202293 ) ) ( not ( = ?auto_202291 ?auto_202292 ) ) ( not ( = ?auto_202291 ?auto_202293 ) ) ( not ( = ?auto_202292 ?auto_202293 ) ) ( ON ?auto_202292 ?auto_202293 ) ( ON ?auto_202291 ?auto_202292 ) ( CLEAR ?auto_202289 ) ( ON ?auto_202290 ?auto_202291 ) ( CLEAR ?auto_202290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_202282 ?auto_202283 ?auto_202284 ?auto_202285 ?auto_202286 ?auto_202287 ?auto_202288 ?auto_202289 ?auto_202290 )
      ( MAKE-12PILE ?auto_202282 ?auto_202283 ?auto_202284 ?auto_202285 ?auto_202286 ?auto_202287 ?auto_202288 ?auto_202289 ?auto_202290 ?auto_202291 ?auto_202292 ?auto_202293 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_202306 - BLOCK
      ?auto_202307 - BLOCK
      ?auto_202308 - BLOCK
      ?auto_202309 - BLOCK
      ?auto_202310 - BLOCK
      ?auto_202311 - BLOCK
      ?auto_202312 - BLOCK
      ?auto_202313 - BLOCK
      ?auto_202314 - BLOCK
      ?auto_202315 - BLOCK
      ?auto_202316 - BLOCK
      ?auto_202317 - BLOCK
    )
    :vars
    (
      ?auto_202318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202317 ?auto_202318 ) ( ON-TABLE ?auto_202306 ) ( ON ?auto_202307 ?auto_202306 ) ( ON ?auto_202308 ?auto_202307 ) ( ON ?auto_202309 ?auto_202308 ) ( ON ?auto_202310 ?auto_202309 ) ( ON ?auto_202311 ?auto_202310 ) ( ON ?auto_202312 ?auto_202311 ) ( not ( = ?auto_202306 ?auto_202307 ) ) ( not ( = ?auto_202306 ?auto_202308 ) ) ( not ( = ?auto_202306 ?auto_202309 ) ) ( not ( = ?auto_202306 ?auto_202310 ) ) ( not ( = ?auto_202306 ?auto_202311 ) ) ( not ( = ?auto_202306 ?auto_202312 ) ) ( not ( = ?auto_202306 ?auto_202313 ) ) ( not ( = ?auto_202306 ?auto_202314 ) ) ( not ( = ?auto_202306 ?auto_202315 ) ) ( not ( = ?auto_202306 ?auto_202316 ) ) ( not ( = ?auto_202306 ?auto_202317 ) ) ( not ( = ?auto_202306 ?auto_202318 ) ) ( not ( = ?auto_202307 ?auto_202308 ) ) ( not ( = ?auto_202307 ?auto_202309 ) ) ( not ( = ?auto_202307 ?auto_202310 ) ) ( not ( = ?auto_202307 ?auto_202311 ) ) ( not ( = ?auto_202307 ?auto_202312 ) ) ( not ( = ?auto_202307 ?auto_202313 ) ) ( not ( = ?auto_202307 ?auto_202314 ) ) ( not ( = ?auto_202307 ?auto_202315 ) ) ( not ( = ?auto_202307 ?auto_202316 ) ) ( not ( = ?auto_202307 ?auto_202317 ) ) ( not ( = ?auto_202307 ?auto_202318 ) ) ( not ( = ?auto_202308 ?auto_202309 ) ) ( not ( = ?auto_202308 ?auto_202310 ) ) ( not ( = ?auto_202308 ?auto_202311 ) ) ( not ( = ?auto_202308 ?auto_202312 ) ) ( not ( = ?auto_202308 ?auto_202313 ) ) ( not ( = ?auto_202308 ?auto_202314 ) ) ( not ( = ?auto_202308 ?auto_202315 ) ) ( not ( = ?auto_202308 ?auto_202316 ) ) ( not ( = ?auto_202308 ?auto_202317 ) ) ( not ( = ?auto_202308 ?auto_202318 ) ) ( not ( = ?auto_202309 ?auto_202310 ) ) ( not ( = ?auto_202309 ?auto_202311 ) ) ( not ( = ?auto_202309 ?auto_202312 ) ) ( not ( = ?auto_202309 ?auto_202313 ) ) ( not ( = ?auto_202309 ?auto_202314 ) ) ( not ( = ?auto_202309 ?auto_202315 ) ) ( not ( = ?auto_202309 ?auto_202316 ) ) ( not ( = ?auto_202309 ?auto_202317 ) ) ( not ( = ?auto_202309 ?auto_202318 ) ) ( not ( = ?auto_202310 ?auto_202311 ) ) ( not ( = ?auto_202310 ?auto_202312 ) ) ( not ( = ?auto_202310 ?auto_202313 ) ) ( not ( = ?auto_202310 ?auto_202314 ) ) ( not ( = ?auto_202310 ?auto_202315 ) ) ( not ( = ?auto_202310 ?auto_202316 ) ) ( not ( = ?auto_202310 ?auto_202317 ) ) ( not ( = ?auto_202310 ?auto_202318 ) ) ( not ( = ?auto_202311 ?auto_202312 ) ) ( not ( = ?auto_202311 ?auto_202313 ) ) ( not ( = ?auto_202311 ?auto_202314 ) ) ( not ( = ?auto_202311 ?auto_202315 ) ) ( not ( = ?auto_202311 ?auto_202316 ) ) ( not ( = ?auto_202311 ?auto_202317 ) ) ( not ( = ?auto_202311 ?auto_202318 ) ) ( not ( = ?auto_202312 ?auto_202313 ) ) ( not ( = ?auto_202312 ?auto_202314 ) ) ( not ( = ?auto_202312 ?auto_202315 ) ) ( not ( = ?auto_202312 ?auto_202316 ) ) ( not ( = ?auto_202312 ?auto_202317 ) ) ( not ( = ?auto_202312 ?auto_202318 ) ) ( not ( = ?auto_202313 ?auto_202314 ) ) ( not ( = ?auto_202313 ?auto_202315 ) ) ( not ( = ?auto_202313 ?auto_202316 ) ) ( not ( = ?auto_202313 ?auto_202317 ) ) ( not ( = ?auto_202313 ?auto_202318 ) ) ( not ( = ?auto_202314 ?auto_202315 ) ) ( not ( = ?auto_202314 ?auto_202316 ) ) ( not ( = ?auto_202314 ?auto_202317 ) ) ( not ( = ?auto_202314 ?auto_202318 ) ) ( not ( = ?auto_202315 ?auto_202316 ) ) ( not ( = ?auto_202315 ?auto_202317 ) ) ( not ( = ?auto_202315 ?auto_202318 ) ) ( not ( = ?auto_202316 ?auto_202317 ) ) ( not ( = ?auto_202316 ?auto_202318 ) ) ( not ( = ?auto_202317 ?auto_202318 ) ) ( ON ?auto_202316 ?auto_202317 ) ( ON ?auto_202315 ?auto_202316 ) ( ON ?auto_202314 ?auto_202315 ) ( CLEAR ?auto_202312 ) ( ON ?auto_202313 ?auto_202314 ) ( CLEAR ?auto_202313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_202306 ?auto_202307 ?auto_202308 ?auto_202309 ?auto_202310 ?auto_202311 ?auto_202312 ?auto_202313 )
      ( MAKE-12PILE ?auto_202306 ?auto_202307 ?auto_202308 ?auto_202309 ?auto_202310 ?auto_202311 ?auto_202312 ?auto_202313 ?auto_202314 ?auto_202315 ?auto_202316 ?auto_202317 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_202331 - BLOCK
      ?auto_202332 - BLOCK
      ?auto_202333 - BLOCK
      ?auto_202334 - BLOCK
      ?auto_202335 - BLOCK
      ?auto_202336 - BLOCK
      ?auto_202337 - BLOCK
      ?auto_202338 - BLOCK
      ?auto_202339 - BLOCK
      ?auto_202340 - BLOCK
      ?auto_202341 - BLOCK
      ?auto_202342 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202342 ) ( ON-TABLE ?auto_202331 ) ( ON ?auto_202332 ?auto_202331 ) ( ON ?auto_202333 ?auto_202332 ) ( ON ?auto_202334 ?auto_202333 ) ( ON ?auto_202335 ?auto_202334 ) ( ON ?auto_202336 ?auto_202335 ) ( ON ?auto_202337 ?auto_202336 ) ( not ( = ?auto_202331 ?auto_202332 ) ) ( not ( = ?auto_202331 ?auto_202333 ) ) ( not ( = ?auto_202331 ?auto_202334 ) ) ( not ( = ?auto_202331 ?auto_202335 ) ) ( not ( = ?auto_202331 ?auto_202336 ) ) ( not ( = ?auto_202331 ?auto_202337 ) ) ( not ( = ?auto_202331 ?auto_202338 ) ) ( not ( = ?auto_202331 ?auto_202339 ) ) ( not ( = ?auto_202331 ?auto_202340 ) ) ( not ( = ?auto_202331 ?auto_202341 ) ) ( not ( = ?auto_202331 ?auto_202342 ) ) ( not ( = ?auto_202332 ?auto_202333 ) ) ( not ( = ?auto_202332 ?auto_202334 ) ) ( not ( = ?auto_202332 ?auto_202335 ) ) ( not ( = ?auto_202332 ?auto_202336 ) ) ( not ( = ?auto_202332 ?auto_202337 ) ) ( not ( = ?auto_202332 ?auto_202338 ) ) ( not ( = ?auto_202332 ?auto_202339 ) ) ( not ( = ?auto_202332 ?auto_202340 ) ) ( not ( = ?auto_202332 ?auto_202341 ) ) ( not ( = ?auto_202332 ?auto_202342 ) ) ( not ( = ?auto_202333 ?auto_202334 ) ) ( not ( = ?auto_202333 ?auto_202335 ) ) ( not ( = ?auto_202333 ?auto_202336 ) ) ( not ( = ?auto_202333 ?auto_202337 ) ) ( not ( = ?auto_202333 ?auto_202338 ) ) ( not ( = ?auto_202333 ?auto_202339 ) ) ( not ( = ?auto_202333 ?auto_202340 ) ) ( not ( = ?auto_202333 ?auto_202341 ) ) ( not ( = ?auto_202333 ?auto_202342 ) ) ( not ( = ?auto_202334 ?auto_202335 ) ) ( not ( = ?auto_202334 ?auto_202336 ) ) ( not ( = ?auto_202334 ?auto_202337 ) ) ( not ( = ?auto_202334 ?auto_202338 ) ) ( not ( = ?auto_202334 ?auto_202339 ) ) ( not ( = ?auto_202334 ?auto_202340 ) ) ( not ( = ?auto_202334 ?auto_202341 ) ) ( not ( = ?auto_202334 ?auto_202342 ) ) ( not ( = ?auto_202335 ?auto_202336 ) ) ( not ( = ?auto_202335 ?auto_202337 ) ) ( not ( = ?auto_202335 ?auto_202338 ) ) ( not ( = ?auto_202335 ?auto_202339 ) ) ( not ( = ?auto_202335 ?auto_202340 ) ) ( not ( = ?auto_202335 ?auto_202341 ) ) ( not ( = ?auto_202335 ?auto_202342 ) ) ( not ( = ?auto_202336 ?auto_202337 ) ) ( not ( = ?auto_202336 ?auto_202338 ) ) ( not ( = ?auto_202336 ?auto_202339 ) ) ( not ( = ?auto_202336 ?auto_202340 ) ) ( not ( = ?auto_202336 ?auto_202341 ) ) ( not ( = ?auto_202336 ?auto_202342 ) ) ( not ( = ?auto_202337 ?auto_202338 ) ) ( not ( = ?auto_202337 ?auto_202339 ) ) ( not ( = ?auto_202337 ?auto_202340 ) ) ( not ( = ?auto_202337 ?auto_202341 ) ) ( not ( = ?auto_202337 ?auto_202342 ) ) ( not ( = ?auto_202338 ?auto_202339 ) ) ( not ( = ?auto_202338 ?auto_202340 ) ) ( not ( = ?auto_202338 ?auto_202341 ) ) ( not ( = ?auto_202338 ?auto_202342 ) ) ( not ( = ?auto_202339 ?auto_202340 ) ) ( not ( = ?auto_202339 ?auto_202341 ) ) ( not ( = ?auto_202339 ?auto_202342 ) ) ( not ( = ?auto_202340 ?auto_202341 ) ) ( not ( = ?auto_202340 ?auto_202342 ) ) ( not ( = ?auto_202341 ?auto_202342 ) ) ( ON ?auto_202341 ?auto_202342 ) ( ON ?auto_202340 ?auto_202341 ) ( ON ?auto_202339 ?auto_202340 ) ( CLEAR ?auto_202337 ) ( ON ?auto_202338 ?auto_202339 ) ( CLEAR ?auto_202338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_202331 ?auto_202332 ?auto_202333 ?auto_202334 ?auto_202335 ?auto_202336 ?auto_202337 ?auto_202338 )
      ( MAKE-12PILE ?auto_202331 ?auto_202332 ?auto_202333 ?auto_202334 ?auto_202335 ?auto_202336 ?auto_202337 ?auto_202338 ?auto_202339 ?auto_202340 ?auto_202341 ?auto_202342 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_202355 - BLOCK
      ?auto_202356 - BLOCK
      ?auto_202357 - BLOCK
      ?auto_202358 - BLOCK
      ?auto_202359 - BLOCK
      ?auto_202360 - BLOCK
      ?auto_202361 - BLOCK
      ?auto_202362 - BLOCK
      ?auto_202363 - BLOCK
      ?auto_202364 - BLOCK
      ?auto_202365 - BLOCK
      ?auto_202366 - BLOCK
    )
    :vars
    (
      ?auto_202367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202366 ?auto_202367 ) ( ON-TABLE ?auto_202355 ) ( ON ?auto_202356 ?auto_202355 ) ( ON ?auto_202357 ?auto_202356 ) ( ON ?auto_202358 ?auto_202357 ) ( ON ?auto_202359 ?auto_202358 ) ( ON ?auto_202360 ?auto_202359 ) ( not ( = ?auto_202355 ?auto_202356 ) ) ( not ( = ?auto_202355 ?auto_202357 ) ) ( not ( = ?auto_202355 ?auto_202358 ) ) ( not ( = ?auto_202355 ?auto_202359 ) ) ( not ( = ?auto_202355 ?auto_202360 ) ) ( not ( = ?auto_202355 ?auto_202361 ) ) ( not ( = ?auto_202355 ?auto_202362 ) ) ( not ( = ?auto_202355 ?auto_202363 ) ) ( not ( = ?auto_202355 ?auto_202364 ) ) ( not ( = ?auto_202355 ?auto_202365 ) ) ( not ( = ?auto_202355 ?auto_202366 ) ) ( not ( = ?auto_202355 ?auto_202367 ) ) ( not ( = ?auto_202356 ?auto_202357 ) ) ( not ( = ?auto_202356 ?auto_202358 ) ) ( not ( = ?auto_202356 ?auto_202359 ) ) ( not ( = ?auto_202356 ?auto_202360 ) ) ( not ( = ?auto_202356 ?auto_202361 ) ) ( not ( = ?auto_202356 ?auto_202362 ) ) ( not ( = ?auto_202356 ?auto_202363 ) ) ( not ( = ?auto_202356 ?auto_202364 ) ) ( not ( = ?auto_202356 ?auto_202365 ) ) ( not ( = ?auto_202356 ?auto_202366 ) ) ( not ( = ?auto_202356 ?auto_202367 ) ) ( not ( = ?auto_202357 ?auto_202358 ) ) ( not ( = ?auto_202357 ?auto_202359 ) ) ( not ( = ?auto_202357 ?auto_202360 ) ) ( not ( = ?auto_202357 ?auto_202361 ) ) ( not ( = ?auto_202357 ?auto_202362 ) ) ( not ( = ?auto_202357 ?auto_202363 ) ) ( not ( = ?auto_202357 ?auto_202364 ) ) ( not ( = ?auto_202357 ?auto_202365 ) ) ( not ( = ?auto_202357 ?auto_202366 ) ) ( not ( = ?auto_202357 ?auto_202367 ) ) ( not ( = ?auto_202358 ?auto_202359 ) ) ( not ( = ?auto_202358 ?auto_202360 ) ) ( not ( = ?auto_202358 ?auto_202361 ) ) ( not ( = ?auto_202358 ?auto_202362 ) ) ( not ( = ?auto_202358 ?auto_202363 ) ) ( not ( = ?auto_202358 ?auto_202364 ) ) ( not ( = ?auto_202358 ?auto_202365 ) ) ( not ( = ?auto_202358 ?auto_202366 ) ) ( not ( = ?auto_202358 ?auto_202367 ) ) ( not ( = ?auto_202359 ?auto_202360 ) ) ( not ( = ?auto_202359 ?auto_202361 ) ) ( not ( = ?auto_202359 ?auto_202362 ) ) ( not ( = ?auto_202359 ?auto_202363 ) ) ( not ( = ?auto_202359 ?auto_202364 ) ) ( not ( = ?auto_202359 ?auto_202365 ) ) ( not ( = ?auto_202359 ?auto_202366 ) ) ( not ( = ?auto_202359 ?auto_202367 ) ) ( not ( = ?auto_202360 ?auto_202361 ) ) ( not ( = ?auto_202360 ?auto_202362 ) ) ( not ( = ?auto_202360 ?auto_202363 ) ) ( not ( = ?auto_202360 ?auto_202364 ) ) ( not ( = ?auto_202360 ?auto_202365 ) ) ( not ( = ?auto_202360 ?auto_202366 ) ) ( not ( = ?auto_202360 ?auto_202367 ) ) ( not ( = ?auto_202361 ?auto_202362 ) ) ( not ( = ?auto_202361 ?auto_202363 ) ) ( not ( = ?auto_202361 ?auto_202364 ) ) ( not ( = ?auto_202361 ?auto_202365 ) ) ( not ( = ?auto_202361 ?auto_202366 ) ) ( not ( = ?auto_202361 ?auto_202367 ) ) ( not ( = ?auto_202362 ?auto_202363 ) ) ( not ( = ?auto_202362 ?auto_202364 ) ) ( not ( = ?auto_202362 ?auto_202365 ) ) ( not ( = ?auto_202362 ?auto_202366 ) ) ( not ( = ?auto_202362 ?auto_202367 ) ) ( not ( = ?auto_202363 ?auto_202364 ) ) ( not ( = ?auto_202363 ?auto_202365 ) ) ( not ( = ?auto_202363 ?auto_202366 ) ) ( not ( = ?auto_202363 ?auto_202367 ) ) ( not ( = ?auto_202364 ?auto_202365 ) ) ( not ( = ?auto_202364 ?auto_202366 ) ) ( not ( = ?auto_202364 ?auto_202367 ) ) ( not ( = ?auto_202365 ?auto_202366 ) ) ( not ( = ?auto_202365 ?auto_202367 ) ) ( not ( = ?auto_202366 ?auto_202367 ) ) ( ON ?auto_202365 ?auto_202366 ) ( ON ?auto_202364 ?auto_202365 ) ( ON ?auto_202363 ?auto_202364 ) ( ON ?auto_202362 ?auto_202363 ) ( CLEAR ?auto_202360 ) ( ON ?auto_202361 ?auto_202362 ) ( CLEAR ?auto_202361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_202355 ?auto_202356 ?auto_202357 ?auto_202358 ?auto_202359 ?auto_202360 ?auto_202361 )
      ( MAKE-12PILE ?auto_202355 ?auto_202356 ?auto_202357 ?auto_202358 ?auto_202359 ?auto_202360 ?auto_202361 ?auto_202362 ?auto_202363 ?auto_202364 ?auto_202365 ?auto_202366 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_202380 - BLOCK
      ?auto_202381 - BLOCK
      ?auto_202382 - BLOCK
      ?auto_202383 - BLOCK
      ?auto_202384 - BLOCK
      ?auto_202385 - BLOCK
      ?auto_202386 - BLOCK
      ?auto_202387 - BLOCK
      ?auto_202388 - BLOCK
      ?auto_202389 - BLOCK
      ?auto_202390 - BLOCK
      ?auto_202391 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202391 ) ( ON-TABLE ?auto_202380 ) ( ON ?auto_202381 ?auto_202380 ) ( ON ?auto_202382 ?auto_202381 ) ( ON ?auto_202383 ?auto_202382 ) ( ON ?auto_202384 ?auto_202383 ) ( ON ?auto_202385 ?auto_202384 ) ( not ( = ?auto_202380 ?auto_202381 ) ) ( not ( = ?auto_202380 ?auto_202382 ) ) ( not ( = ?auto_202380 ?auto_202383 ) ) ( not ( = ?auto_202380 ?auto_202384 ) ) ( not ( = ?auto_202380 ?auto_202385 ) ) ( not ( = ?auto_202380 ?auto_202386 ) ) ( not ( = ?auto_202380 ?auto_202387 ) ) ( not ( = ?auto_202380 ?auto_202388 ) ) ( not ( = ?auto_202380 ?auto_202389 ) ) ( not ( = ?auto_202380 ?auto_202390 ) ) ( not ( = ?auto_202380 ?auto_202391 ) ) ( not ( = ?auto_202381 ?auto_202382 ) ) ( not ( = ?auto_202381 ?auto_202383 ) ) ( not ( = ?auto_202381 ?auto_202384 ) ) ( not ( = ?auto_202381 ?auto_202385 ) ) ( not ( = ?auto_202381 ?auto_202386 ) ) ( not ( = ?auto_202381 ?auto_202387 ) ) ( not ( = ?auto_202381 ?auto_202388 ) ) ( not ( = ?auto_202381 ?auto_202389 ) ) ( not ( = ?auto_202381 ?auto_202390 ) ) ( not ( = ?auto_202381 ?auto_202391 ) ) ( not ( = ?auto_202382 ?auto_202383 ) ) ( not ( = ?auto_202382 ?auto_202384 ) ) ( not ( = ?auto_202382 ?auto_202385 ) ) ( not ( = ?auto_202382 ?auto_202386 ) ) ( not ( = ?auto_202382 ?auto_202387 ) ) ( not ( = ?auto_202382 ?auto_202388 ) ) ( not ( = ?auto_202382 ?auto_202389 ) ) ( not ( = ?auto_202382 ?auto_202390 ) ) ( not ( = ?auto_202382 ?auto_202391 ) ) ( not ( = ?auto_202383 ?auto_202384 ) ) ( not ( = ?auto_202383 ?auto_202385 ) ) ( not ( = ?auto_202383 ?auto_202386 ) ) ( not ( = ?auto_202383 ?auto_202387 ) ) ( not ( = ?auto_202383 ?auto_202388 ) ) ( not ( = ?auto_202383 ?auto_202389 ) ) ( not ( = ?auto_202383 ?auto_202390 ) ) ( not ( = ?auto_202383 ?auto_202391 ) ) ( not ( = ?auto_202384 ?auto_202385 ) ) ( not ( = ?auto_202384 ?auto_202386 ) ) ( not ( = ?auto_202384 ?auto_202387 ) ) ( not ( = ?auto_202384 ?auto_202388 ) ) ( not ( = ?auto_202384 ?auto_202389 ) ) ( not ( = ?auto_202384 ?auto_202390 ) ) ( not ( = ?auto_202384 ?auto_202391 ) ) ( not ( = ?auto_202385 ?auto_202386 ) ) ( not ( = ?auto_202385 ?auto_202387 ) ) ( not ( = ?auto_202385 ?auto_202388 ) ) ( not ( = ?auto_202385 ?auto_202389 ) ) ( not ( = ?auto_202385 ?auto_202390 ) ) ( not ( = ?auto_202385 ?auto_202391 ) ) ( not ( = ?auto_202386 ?auto_202387 ) ) ( not ( = ?auto_202386 ?auto_202388 ) ) ( not ( = ?auto_202386 ?auto_202389 ) ) ( not ( = ?auto_202386 ?auto_202390 ) ) ( not ( = ?auto_202386 ?auto_202391 ) ) ( not ( = ?auto_202387 ?auto_202388 ) ) ( not ( = ?auto_202387 ?auto_202389 ) ) ( not ( = ?auto_202387 ?auto_202390 ) ) ( not ( = ?auto_202387 ?auto_202391 ) ) ( not ( = ?auto_202388 ?auto_202389 ) ) ( not ( = ?auto_202388 ?auto_202390 ) ) ( not ( = ?auto_202388 ?auto_202391 ) ) ( not ( = ?auto_202389 ?auto_202390 ) ) ( not ( = ?auto_202389 ?auto_202391 ) ) ( not ( = ?auto_202390 ?auto_202391 ) ) ( ON ?auto_202390 ?auto_202391 ) ( ON ?auto_202389 ?auto_202390 ) ( ON ?auto_202388 ?auto_202389 ) ( ON ?auto_202387 ?auto_202388 ) ( CLEAR ?auto_202385 ) ( ON ?auto_202386 ?auto_202387 ) ( CLEAR ?auto_202386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_202380 ?auto_202381 ?auto_202382 ?auto_202383 ?auto_202384 ?auto_202385 ?auto_202386 )
      ( MAKE-12PILE ?auto_202380 ?auto_202381 ?auto_202382 ?auto_202383 ?auto_202384 ?auto_202385 ?auto_202386 ?auto_202387 ?auto_202388 ?auto_202389 ?auto_202390 ?auto_202391 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_202404 - BLOCK
      ?auto_202405 - BLOCK
      ?auto_202406 - BLOCK
      ?auto_202407 - BLOCK
      ?auto_202408 - BLOCK
      ?auto_202409 - BLOCK
      ?auto_202410 - BLOCK
      ?auto_202411 - BLOCK
      ?auto_202412 - BLOCK
      ?auto_202413 - BLOCK
      ?auto_202414 - BLOCK
      ?auto_202415 - BLOCK
    )
    :vars
    (
      ?auto_202416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202415 ?auto_202416 ) ( ON-TABLE ?auto_202404 ) ( ON ?auto_202405 ?auto_202404 ) ( ON ?auto_202406 ?auto_202405 ) ( ON ?auto_202407 ?auto_202406 ) ( ON ?auto_202408 ?auto_202407 ) ( not ( = ?auto_202404 ?auto_202405 ) ) ( not ( = ?auto_202404 ?auto_202406 ) ) ( not ( = ?auto_202404 ?auto_202407 ) ) ( not ( = ?auto_202404 ?auto_202408 ) ) ( not ( = ?auto_202404 ?auto_202409 ) ) ( not ( = ?auto_202404 ?auto_202410 ) ) ( not ( = ?auto_202404 ?auto_202411 ) ) ( not ( = ?auto_202404 ?auto_202412 ) ) ( not ( = ?auto_202404 ?auto_202413 ) ) ( not ( = ?auto_202404 ?auto_202414 ) ) ( not ( = ?auto_202404 ?auto_202415 ) ) ( not ( = ?auto_202404 ?auto_202416 ) ) ( not ( = ?auto_202405 ?auto_202406 ) ) ( not ( = ?auto_202405 ?auto_202407 ) ) ( not ( = ?auto_202405 ?auto_202408 ) ) ( not ( = ?auto_202405 ?auto_202409 ) ) ( not ( = ?auto_202405 ?auto_202410 ) ) ( not ( = ?auto_202405 ?auto_202411 ) ) ( not ( = ?auto_202405 ?auto_202412 ) ) ( not ( = ?auto_202405 ?auto_202413 ) ) ( not ( = ?auto_202405 ?auto_202414 ) ) ( not ( = ?auto_202405 ?auto_202415 ) ) ( not ( = ?auto_202405 ?auto_202416 ) ) ( not ( = ?auto_202406 ?auto_202407 ) ) ( not ( = ?auto_202406 ?auto_202408 ) ) ( not ( = ?auto_202406 ?auto_202409 ) ) ( not ( = ?auto_202406 ?auto_202410 ) ) ( not ( = ?auto_202406 ?auto_202411 ) ) ( not ( = ?auto_202406 ?auto_202412 ) ) ( not ( = ?auto_202406 ?auto_202413 ) ) ( not ( = ?auto_202406 ?auto_202414 ) ) ( not ( = ?auto_202406 ?auto_202415 ) ) ( not ( = ?auto_202406 ?auto_202416 ) ) ( not ( = ?auto_202407 ?auto_202408 ) ) ( not ( = ?auto_202407 ?auto_202409 ) ) ( not ( = ?auto_202407 ?auto_202410 ) ) ( not ( = ?auto_202407 ?auto_202411 ) ) ( not ( = ?auto_202407 ?auto_202412 ) ) ( not ( = ?auto_202407 ?auto_202413 ) ) ( not ( = ?auto_202407 ?auto_202414 ) ) ( not ( = ?auto_202407 ?auto_202415 ) ) ( not ( = ?auto_202407 ?auto_202416 ) ) ( not ( = ?auto_202408 ?auto_202409 ) ) ( not ( = ?auto_202408 ?auto_202410 ) ) ( not ( = ?auto_202408 ?auto_202411 ) ) ( not ( = ?auto_202408 ?auto_202412 ) ) ( not ( = ?auto_202408 ?auto_202413 ) ) ( not ( = ?auto_202408 ?auto_202414 ) ) ( not ( = ?auto_202408 ?auto_202415 ) ) ( not ( = ?auto_202408 ?auto_202416 ) ) ( not ( = ?auto_202409 ?auto_202410 ) ) ( not ( = ?auto_202409 ?auto_202411 ) ) ( not ( = ?auto_202409 ?auto_202412 ) ) ( not ( = ?auto_202409 ?auto_202413 ) ) ( not ( = ?auto_202409 ?auto_202414 ) ) ( not ( = ?auto_202409 ?auto_202415 ) ) ( not ( = ?auto_202409 ?auto_202416 ) ) ( not ( = ?auto_202410 ?auto_202411 ) ) ( not ( = ?auto_202410 ?auto_202412 ) ) ( not ( = ?auto_202410 ?auto_202413 ) ) ( not ( = ?auto_202410 ?auto_202414 ) ) ( not ( = ?auto_202410 ?auto_202415 ) ) ( not ( = ?auto_202410 ?auto_202416 ) ) ( not ( = ?auto_202411 ?auto_202412 ) ) ( not ( = ?auto_202411 ?auto_202413 ) ) ( not ( = ?auto_202411 ?auto_202414 ) ) ( not ( = ?auto_202411 ?auto_202415 ) ) ( not ( = ?auto_202411 ?auto_202416 ) ) ( not ( = ?auto_202412 ?auto_202413 ) ) ( not ( = ?auto_202412 ?auto_202414 ) ) ( not ( = ?auto_202412 ?auto_202415 ) ) ( not ( = ?auto_202412 ?auto_202416 ) ) ( not ( = ?auto_202413 ?auto_202414 ) ) ( not ( = ?auto_202413 ?auto_202415 ) ) ( not ( = ?auto_202413 ?auto_202416 ) ) ( not ( = ?auto_202414 ?auto_202415 ) ) ( not ( = ?auto_202414 ?auto_202416 ) ) ( not ( = ?auto_202415 ?auto_202416 ) ) ( ON ?auto_202414 ?auto_202415 ) ( ON ?auto_202413 ?auto_202414 ) ( ON ?auto_202412 ?auto_202413 ) ( ON ?auto_202411 ?auto_202412 ) ( ON ?auto_202410 ?auto_202411 ) ( CLEAR ?auto_202408 ) ( ON ?auto_202409 ?auto_202410 ) ( CLEAR ?auto_202409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_202404 ?auto_202405 ?auto_202406 ?auto_202407 ?auto_202408 ?auto_202409 )
      ( MAKE-12PILE ?auto_202404 ?auto_202405 ?auto_202406 ?auto_202407 ?auto_202408 ?auto_202409 ?auto_202410 ?auto_202411 ?auto_202412 ?auto_202413 ?auto_202414 ?auto_202415 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_202429 - BLOCK
      ?auto_202430 - BLOCK
      ?auto_202431 - BLOCK
      ?auto_202432 - BLOCK
      ?auto_202433 - BLOCK
      ?auto_202434 - BLOCK
      ?auto_202435 - BLOCK
      ?auto_202436 - BLOCK
      ?auto_202437 - BLOCK
      ?auto_202438 - BLOCK
      ?auto_202439 - BLOCK
      ?auto_202440 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202440 ) ( ON-TABLE ?auto_202429 ) ( ON ?auto_202430 ?auto_202429 ) ( ON ?auto_202431 ?auto_202430 ) ( ON ?auto_202432 ?auto_202431 ) ( ON ?auto_202433 ?auto_202432 ) ( not ( = ?auto_202429 ?auto_202430 ) ) ( not ( = ?auto_202429 ?auto_202431 ) ) ( not ( = ?auto_202429 ?auto_202432 ) ) ( not ( = ?auto_202429 ?auto_202433 ) ) ( not ( = ?auto_202429 ?auto_202434 ) ) ( not ( = ?auto_202429 ?auto_202435 ) ) ( not ( = ?auto_202429 ?auto_202436 ) ) ( not ( = ?auto_202429 ?auto_202437 ) ) ( not ( = ?auto_202429 ?auto_202438 ) ) ( not ( = ?auto_202429 ?auto_202439 ) ) ( not ( = ?auto_202429 ?auto_202440 ) ) ( not ( = ?auto_202430 ?auto_202431 ) ) ( not ( = ?auto_202430 ?auto_202432 ) ) ( not ( = ?auto_202430 ?auto_202433 ) ) ( not ( = ?auto_202430 ?auto_202434 ) ) ( not ( = ?auto_202430 ?auto_202435 ) ) ( not ( = ?auto_202430 ?auto_202436 ) ) ( not ( = ?auto_202430 ?auto_202437 ) ) ( not ( = ?auto_202430 ?auto_202438 ) ) ( not ( = ?auto_202430 ?auto_202439 ) ) ( not ( = ?auto_202430 ?auto_202440 ) ) ( not ( = ?auto_202431 ?auto_202432 ) ) ( not ( = ?auto_202431 ?auto_202433 ) ) ( not ( = ?auto_202431 ?auto_202434 ) ) ( not ( = ?auto_202431 ?auto_202435 ) ) ( not ( = ?auto_202431 ?auto_202436 ) ) ( not ( = ?auto_202431 ?auto_202437 ) ) ( not ( = ?auto_202431 ?auto_202438 ) ) ( not ( = ?auto_202431 ?auto_202439 ) ) ( not ( = ?auto_202431 ?auto_202440 ) ) ( not ( = ?auto_202432 ?auto_202433 ) ) ( not ( = ?auto_202432 ?auto_202434 ) ) ( not ( = ?auto_202432 ?auto_202435 ) ) ( not ( = ?auto_202432 ?auto_202436 ) ) ( not ( = ?auto_202432 ?auto_202437 ) ) ( not ( = ?auto_202432 ?auto_202438 ) ) ( not ( = ?auto_202432 ?auto_202439 ) ) ( not ( = ?auto_202432 ?auto_202440 ) ) ( not ( = ?auto_202433 ?auto_202434 ) ) ( not ( = ?auto_202433 ?auto_202435 ) ) ( not ( = ?auto_202433 ?auto_202436 ) ) ( not ( = ?auto_202433 ?auto_202437 ) ) ( not ( = ?auto_202433 ?auto_202438 ) ) ( not ( = ?auto_202433 ?auto_202439 ) ) ( not ( = ?auto_202433 ?auto_202440 ) ) ( not ( = ?auto_202434 ?auto_202435 ) ) ( not ( = ?auto_202434 ?auto_202436 ) ) ( not ( = ?auto_202434 ?auto_202437 ) ) ( not ( = ?auto_202434 ?auto_202438 ) ) ( not ( = ?auto_202434 ?auto_202439 ) ) ( not ( = ?auto_202434 ?auto_202440 ) ) ( not ( = ?auto_202435 ?auto_202436 ) ) ( not ( = ?auto_202435 ?auto_202437 ) ) ( not ( = ?auto_202435 ?auto_202438 ) ) ( not ( = ?auto_202435 ?auto_202439 ) ) ( not ( = ?auto_202435 ?auto_202440 ) ) ( not ( = ?auto_202436 ?auto_202437 ) ) ( not ( = ?auto_202436 ?auto_202438 ) ) ( not ( = ?auto_202436 ?auto_202439 ) ) ( not ( = ?auto_202436 ?auto_202440 ) ) ( not ( = ?auto_202437 ?auto_202438 ) ) ( not ( = ?auto_202437 ?auto_202439 ) ) ( not ( = ?auto_202437 ?auto_202440 ) ) ( not ( = ?auto_202438 ?auto_202439 ) ) ( not ( = ?auto_202438 ?auto_202440 ) ) ( not ( = ?auto_202439 ?auto_202440 ) ) ( ON ?auto_202439 ?auto_202440 ) ( ON ?auto_202438 ?auto_202439 ) ( ON ?auto_202437 ?auto_202438 ) ( ON ?auto_202436 ?auto_202437 ) ( ON ?auto_202435 ?auto_202436 ) ( CLEAR ?auto_202433 ) ( ON ?auto_202434 ?auto_202435 ) ( CLEAR ?auto_202434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_202429 ?auto_202430 ?auto_202431 ?auto_202432 ?auto_202433 ?auto_202434 )
      ( MAKE-12PILE ?auto_202429 ?auto_202430 ?auto_202431 ?auto_202432 ?auto_202433 ?auto_202434 ?auto_202435 ?auto_202436 ?auto_202437 ?auto_202438 ?auto_202439 ?auto_202440 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_202453 - BLOCK
      ?auto_202454 - BLOCK
      ?auto_202455 - BLOCK
      ?auto_202456 - BLOCK
      ?auto_202457 - BLOCK
      ?auto_202458 - BLOCK
      ?auto_202459 - BLOCK
      ?auto_202460 - BLOCK
      ?auto_202461 - BLOCK
      ?auto_202462 - BLOCK
      ?auto_202463 - BLOCK
      ?auto_202464 - BLOCK
    )
    :vars
    (
      ?auto_202465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202464 ?auto_202465 ) ( ON-TABLE ?auto_202453 ) ( ON ?auto_202454 ?auto_202453 ) ( ON ?auto_202455 ?auto_202454 ) ( ON ?auto_202456 ?auto_202455 ) ( not ( = ?auto_202453 ?auto_202454 ) ) ( not ( = ?auto_202453 ?auto_202455 ) ) ( not ( = ?auto_202453 ?auto_202456 ) ) ( not ( = ?auto_202453 ?auto_202457 ) ) ( not ( = ?auto_202453 ?auto_202458 ) ) ( not ( = ?auto_202453 ?auto_202459 ) ) ( not ( = ?auto_202453 ?auto_202460 ) ) ( not ( = ?auto_202453 ?auto_202461 ) ) ( not ( = ?auto_202453 ?auto_202462 ) ) ( not ( = ?auto_202453 ?auto_202463 ) ) ( not ( = ?auto_202453 ?auto_202464 ) ) ( not ( = ?auto_202453 ?auto_202465 ) ) ( not ( = ?auto_202454 ?auto_202455 ) ) ( not ( = ?auto_202454 ?auto_202456 ) ) ( not ( = ?auto_202454 ?auto_202457 ) ) ( not ( = ?auto_202454 ?auto_202458 ) ) ( not ( = ?auto_202454 ?auto_202459 ) ) ( not ( = ?auto_202454 ?auto_202460 ) ) ( not ( = ?auto_202454 ?auto_202461 ) ) ( not ( = ?auto_202454 ?auto_202462 ) ) ( not ( = ?auto_202454 ?auto_202463 ) ) ( not ( = ?auto_202454 ?auto_202464 ) ) ( not ( = ?auto_202454 ?auto_202465 ) ) ( not ( = ?auto_202455 ?auto_202456 ) ) ( not ( = ?auto_202455 ?auto_202457 ) ) ( not ( = ?auto_202455 ?auto_202458 ) ) ( not ( = ?auto_202455 ?auto_202459 ) ) ( not ( = ?auto_202455 ?auto_202460 ) ) ( not ( = ?auto_202455 ?auto_202461 ) ) ( not ( = ?auto_202455 ?auto_202462 ) ) ( not ( = ?auto_202455 ?auto_202463 ) ) ( not ( = ?auto_202455 ?auto_202464 ) ) ( not ( = ?auto_202455 ?auto_202465 ) ) ( not ( = ?auto_202456 ?auto_202457 ) ) ( not ( = ?auto_202456 ?auto_202458 ) ) ( not ( = ?auto_202456 ?auto_202459 ) ) ( not ( = ?auto_202456 ?auto_202460 ) ) ( not ( = ?auto_202456 ?auto_202461 ) ) ( not ( = ?auto_202456 ?auto_202462 ) ) ( not ( = ?auto_202456 ?auto_202463 ) ) ( not ( = ?auto_202456 ?auto_202464 ) ) ( not ( = ?auto_202456 ?auto_202465 ) ) ( not ( = ?auto_202457 ?auto_202458 ) ) ( not ( = ?auto_202457 ?auto_202459 ) ) ( not ( = ?auto_202457 ?auto_202460 ) ) ( not ( = ?auto_202457 ?auto_202461 ) ) ( not ( = ?auto_202457 ?auto_202462 ) ) ( not ( = ?auto_202457 ?auto_202463 ) ) ( not ( = ?auto_202457 ?auto_202464 ) ) ( not ( = ?auto_202457 ?auto_202465 ) ) ( not ( = ?auto_202458 ?auto_202459 ) ) ( not ( = ?auto_202458 ?auto_202460 ) ) ( not ( = ?auto_202458 ?auto_202461 ) ) ( not ( = ?auto_202458 ?auto_202462 ) ) ( not ( = ?auto_202458 ?auto_202463 ) ) ( not ( = ?auto_202458 ?auto_202464 ) ) ( not ( = ?auto_202458 ?auto_202465 ) ) ( not ( = ?auto_202459 ?auto_202460 ) ) ( not ( = ?auto_202459 ?auto_202461 ) ) ( not ( = ?auto_202459 ?auto_202462 ) ) ( not ( = ?auto_202459 ?auto_202463 ) ) ( not ( = ?auto_202459 ?auto_202464 ) ) ( not ( = ?auto_202459 ?auto_202465 ) ) ( not ( = ?auto_202460 ?auto_202461 ) ) ( not ( = ?auto_202460 ?auto_202462 ) ) ( not ( = ?auto_202460 ?auto_202463 ) ) ( not ( = ?auto_202460 ?auto_202464 ) ) ( not ( = ?auto_202460 ?auto_202465 ) ) ( not ( = ?auto_202461 ?auto_202462 ) ) ( not ( = ?auto_202461 ?auto_202463 ) ) ( not ( = ?auto_202461 ?auto_202464 ) ) ( not ( = ?auto_202461 ?auto_202465 ) ) ( not ( = ?auto_202462 ?auto_202463 ) ) ( not ( = ?auto_202462 ?auto_202464 ) ) ( not ( = ?auto_202462 ?auto_202465 ) ) ( not ( = ?auto_202463 ?auto_202464 ) ) ( not ( = ?auto_202463 ?auto_202465 ) ) ( not ( = ?auto_202464 ?auto_202465 ) ) ( ON ?auto_202463 ?auto_202464 ) ( ON ?auto_202462 ?auto_202463 ) ( ON ?auto_202461 ?auto_202462 ) ( ON ?auto_202460 ?auto_202461 ) ( ON ?auto_202459 ?auto_202460 ) ( ON ?auto_202458 ?auto_202459 ) ( CLEAR ?auto_202456 ) ( ON ?auto_202457 ?auto_202458 ) ( CLEAR ?auto_202457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_202453 ?auto_202454 ?auto_202455 ?auto_202456 ?auto_202457 )
      ( MAKE-12PILE ?auto_202453 ?auto_202454 ?auto_202455 ?auto_202456 ?auto_202457 ?auto_202458 ?auto_202459 ?auto_202460 ?auto_202461 ?auto_202462 ?auto_202463 ?auto_202464 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_202478 - BLOCK
      ?auto_202479 - BLOCK
      ?auto_202480 - BLOCK
      ?auto_202481 - BLOCK
      ?auto_202482 - BLOCK
      ?auto_202483 - BLOCK
      ?auto_202484 - BLOCK
      ?auto_202485 - BLOCK
      ?auto_202486 - BLOCK
      ?auto_202487 - BLOCK
      ?auto_202488 - BLOCK
      ?auto_202489 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202489 ) ( ON-TABLE ?auto_202478 ) ( ON ?auto_202479 ?auto_202478 ) ( ON ?auto_202480 ?auto_202479 ) ( ON ?auto_202481 ?auto_202480 ) ( not ( = ?auto_202478 ?auto_202479 ) ) ( not ( = ?auto_202478 ?auto_202480 ) ) ( not ( = ?auto_202478 ?auto_202481 ) ) ( not ( = ?auto_202478 ?auto_202482 ) ) ( not ( = ?auto_202478 ?auto_202483 ) ) ( not ( = ?auto_202478 ?auto_202484 ) ) ( not ( = ?auto_202478 ?auto_202485 ) ) ( not ( = ?auto_202478 ?auto_202486 ) ) ( not ( = ?auto_202478 ?auto_202487 ) ) ( not ( = ?auto_202478 ?auto_202488 ) ) ( not ( = ?auto_202478 ?auto_202489 ) ) ( not ( = ?auto_202479 ?auto_202480 ) ) ( not ( = ?auto_202479 ?auto_202481 ) ) ( not ( = ?auto_202479 ?auto_202482 ) ) ( not ( = ?auto_202479 ?auto_202483 ) ) ( not ( = ?auto_202479 ?auto_202484 ) ) ( not ( = ?auto_202479 ?auto_202485 ) ) ( not ( = ?auto_202479 ?auto_202486 ) ) ( not ( = ?auto_202479 ?auto_202487 ) ) ( not ( = ?auto_202479 ?auto_202488 ) ) ( not ( = ?auto_202479 ?auto_202489 ) ) ( not ( = ?auto_202480 ?auto_202481 ) ) ( not ( = ?auto_202480 ?auto_202482 ) ) ( not ( = ?auto_202480 ?auto_202483 ) ) ( not ( = ?auto_202480 ?auto_202484 ) ) ( not ( = ?auto_202480 ?auto_202485 ) ) ( not ( = ?auto_202480 ?auto_202486 ) ) ( not ( = ?auto_202480 ?auto_202487 ) ) ( not ( = ?auto_202480 ?auto_202488 ) ) ( not ( = ?auto_202480 ?auto_202489 ) ) ( not ( = ?auto_202481 ?auto_202482 ) ) ( not ( = ?auto_202481 ?auto_202483 ) ) ( not ( = ?auto_202481 ?auto_202484 ) ) ( not ( = ?auto_202481 ?auto_202485 ) ) ( not ( = ?auto_202481 ?auto_202486 ) ) ( not ( = ?auto_202481 ?auto_202487 ) ) ( not ( = ?auto_202481 ?auto_202488 ) ) ( not ( = ?auto_202481 ?auto_202489 ) ) ( not ( = ?auto_202482 ?auto_202483 ) ) ( not ( = ?auto_202482 ?auto_202484 ) ) ( not ( = ?auto_202482 ?auto_202485 ) ) ( not ( = ?auto_202482 ?auto_202486 ) ) ( not ( = ?auto_202482 ?auto_202487 ) ) ( not ( = ?auto_202482 ?auto_202488 ) ) ( not ( = ?auto_202482 ?auto_202489 ) ) ( not ( = ?auto_202483 ?auto_202484 ) ) ( not ( = ?auto_202483 ?auto_202485 ) ) ( not ( = ?auto_202483 ?auto_202486 ) ) ( not ( = ?auto_202483 ?auto_202487 ) ) ( not ( = ?auto_202483 ?auto_202488 ) ) ( not ( = ?auto_202483 ?auto_202489 ) ) ( not ( = ?auto_202484 ?auto_202485 ) ) ( not ( = ?auto_202484 ?auto_202486 ) ) ( not ( = ?auto_202484 ?auto_202487 ) ) ( not ( = ?auto_202484 ?auto_202488 ) ) ( not ( = ?auto_202484 ?auto_202489 ) ) ( not ( = ?auto_202485 ?auto_202486 ) ) ( not ( = ?auto_202485 ?auto_202487 ) ) ( not ( = ?auto_202485 ?auto_202488 ) ) ( not ( = ?auto_202485 ?auto_202489 ) ) ( not ( = ?auto_202486 ?auto_202487 ) ) ( not ( = ?auto_202486 ?auto_202488 ) ) ( not ( = ?auto_202486 ?auto_202489 ) ) ( not ( = ?auto_202487 ?auto_202488 ) ) ( not ( = ?auto_202487 ?auto_202489 ) ) ( not ( = ?auto_202488 ?auto_202489 ) ) ( ON ?auto_202488 ?auto_202489 ) ( ON ?auto_202487 ?auto_202488 ) ( ON ?auto_202486 ?auto_202487 ) ( ON ?auto_202485 ?auto_202486 ) ( ON ?auto_202484 ?auto_202485 ) ( ON ?auto_202483 ?auto_202484 ) ( CLEAR ?auto_202481 ) ( ON ?auto_202482 ?auto_202483 ) ( CLEAR ?auto_202482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_202478 ?auto_202479 ?auto_202480 ?auto_202481 ?auto_202482 )
      ( MAKE-12PILE ?auto_202478 ?auto_202479 ?auto_202480 ?auto_202481 ?auto_202482 ?auto_202483 ?auto_202484 ?auto_202485 ?auto_202486 ?auto_202487 ?auto_202488 ?auto_202489 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_202502 - BLOCK
      ?auto_202503 - BLOCK
      ?auto_202504 - BLOCK
      ?auto_202505 - BLOCK
      ?auto_202506 - BLOCK
      ?auto_202507 - BLOCK
      ?auto_202508 - BLOCK
      ?auto_202509 - BLOCK
      ?auto_202510 - BLOCK
      ?auto_202511 - BLOCK
      ?auto_202512 - BLOCK
      ?auto_202513 - BLOCK
    )
    :vars
    (
      ?auto_202514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202513 ?auto_202514 ) ( ON-TABLE ?auto_202502 ) ( ON ?auto_202503 ?auto_202502 ) ( ON ?auto_202504 ?auto_202503 ) ( not ( = ?auto_202502 ?auto_202503 ) ) ( not ( = ?auto_202502 ?auto_202504 ) ) ( not ( = ?auto_202502 ?auto_202505 ) ) ( not ( = ?auto_202502 ?auto_202506 ) ) ( not ( = ?auto_202502 ?auto_202507 ) ) ( not ( = ?auto_202502 ?auto_202508 ) ) ( not ( = ?auto_202502 ?auto_202509 ) ) ( not ( = ?auto_202502 ?auto_202510 ) ) ( not ( = ?auto_202502 ?auto_202511 ) ) ( not ( = ?auto_202502 ?auto_202512 ) ) ( not ( = ?auto_202502 ?auto_202513 ) ) ( not ( = ?auto_202502 ?auto_202514 ) ) ( not ( = ?auto_202503 ?auto_202504 ) ) ( not ( = ?auto_202503 ?auto_202505 ) ) ( not ( = ?auto_202503 ?auto_202506 ) ) ( not ( = ?auto_202503 ?auto_202507 ) ) ( not ( = ?auto_202503 ?auto_202508 ) ) ( not ( = ?auto_202503 ?auto_202509 ) ) ( not ( = ?auto_202503 ?auto_202510 ) ) ( not ( = ?auto_202503 ?auto_202511 ) ) ( not ( = ?auto_202503 ?auto_202512 ) ) ( not ( = ?auto_202503 ?auto_202513 ) ) ( not ( = ?auto_202503 ?auto_202514 ) ) ( not ( = ?auto_202504 ?auto_202505 ) ) ( not ( = ?auto_202504 ?auto_202506 ) ) ( not ( = ?auto_202504 ?auto_202507 ) ) ( not ( = ?auto_202504 ?auto_202508 ) ) ( not ( = ?auto_202504 ?auto_202509 ) ) ( not ( = ?auto_202504 ?auto_202510 ) ) ( not ( = ?auto_202504 ?auto_202511 ) ) ( not ( = ?auto_202504 ?auto_202512 ) ) ( not ( = ?auto_202504 ?auto_202513 ) ) ( not ( = ?auto_202504 ?auto_202514 ) ) ( not ( = ?auto_202505 ?auto_202506 ) ) ( not ( = ?auto_202505 ?auto_202507 ) ) ( not ( = ?auto_202505 ?auto_202508 ) ) ( not ( = ?auto_202505 ?auto_202509 ) ) ( not ( = ?auto_202505 ?auto_202510 ) ) ( not ( = ?auto_202505 ?auto_202511 ) ) ( not ( = ?auto_202505 ?auto_202512 ) ) ( not ( = ?auto_202505 ?auto_202513 ) ) ( not ( = ?auto_202505 ?auto_202514 ) ) ( not ( = ?auto_202506 ?auto_202507 ) ) ( not ( = ?auto_202506 ?auto_202508 ) ) ( not ( = ?auto_202506 ?auto_202509 ) ) ( not ( = ?auto_202506 ?auto_202510 ) ) ( not ( = ?auto_202506 ?auto_202511 ) ) ( not ( = ?auto_202506 ?auto_202512 ) ) ( not ( = ?auto_202506 ?auto_202513 ) ) ( not ( = ?auto_202506 ?auto_202514 ) ) ( not ( = ?auto_202507 ?auto_202508 ) ) ( not ( = ?auto_202507 ?auto_202509 ) ) ( not ( = ?auto_202507 ?auto_202510 ) ) ( not ( = ?auto_202507 ?auto_202511 ) ) ( not ( = ?auto_202507 ?auto_202512 ) ) ( not ( = ?auto_202507 ?auto_202513 ) ) ( not ( = ?auto_202507 ?auto_202514 ) ) ( not ( = ?auto_202508 ?auto_202509 ) ) ( not ( = ?auto_202508 ?auto_202510 ) ) ( not ( = ?auto_202508 ?auto_202511 ) ) ( not ( = ?auto_202508 ?auto_202512 ) ) ( not ( = ?auto_202508 ?auto_202513 ) ) ( not ( = ?auto_202508 ?auto_202514 ) ) ( not ( = ?auto_202509 ?auto_202510 ) ) ( not ( = ?auto_202509 ?auto_202511 ) ) ( not ( = ?auto_202509 ?auto_202512 ) ) ( not ( = ?auto_202509 ?auto_202513 ) ) ( not ( = ?auto_202509 ?auto_202514 ) ) ( not ( = ?auto_202510 ?auto_202511 ) ) ( not ( = ?auto_202510 ?auto_202512 ) ) ( not ( = ?auto_202510 ?auto_202513 ) ) ( not ( = ?auto_202510 ?auto_202514 ) ) ( not ( = ?auto_202511 ?auto_202512 ) ) ( not ( = ?auto_202511 ?auto_202513 ) ) ( not ( = ?auto_202511 ?auto_202514 ) ) ( not ( = ?auto_202512 ?auto_202513 ) ) ( not ( = ?auto_202512 ?auto_202514 ) ) ( not ( = ?auto_202513 ?auto_202514 ) ) ( ON ?auto_202512 ?auto_202513 ) ( ON ?auto_202511 ?auto_202512 ) ( ON ?auto_202510 ?auto_202511 ) ( ON ?auto_202509 ?auto_202510 ) ( ON ?auto_202508 ?auto_202509 ) ( ON ?auto_202507 ?auto_202508 ) ( ON ?auto_202506 ?auto_202507 ) ( CLEAR ?auto_202504 ) ( ON ?auto_202505 ?auto_202506 ) ( CLEAR ?auto_202505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_202502 ?auto_202503 ?auto_202504 ?auto_202505 )
      ( MAKE-12PILE ?auto_202502 ?auto_202503 ?auto_202504 ?auto_202505 ?auto_202506 ?auto_202507 ?auto_202508 ?auto_202509 ?auto_202510 ?auto_202511 ?auto_202512 ?auto_202513 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_202527 - BLOCK
      ?auto_202528 - BLOCK
      ?auto_202529 - BLOCK
      ?auto_202530 - BLOCK
      ?auto_202531 - BLOCK
      ?auto_202532 - BLOCK
      ?auto_202533 - BLOCK
      ?auto_202534 - BLOCK
      ?auto_202535 - BLOCK
      ?auto_202536 - BLOCK
      ?auto_202537 - BLOCK
      ?auto_202538 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202538 ) ( ON-TABLE ?auto_202527 ) ( ON ?auto_202528 ?auto_202527 ) ( ON ?auto_202529 ?auto_202528 ) ( not ( = ?auto_202527 ?auto_202528 ) ) ( not ( = ?auto_202527 ?auto_202529 ) ) ( not ( = ?auto_202527 ?auto_202530 ) ) ( not ( = ?auto_202527 ?auto_202531 ) ) ( not ( = ?auto_202527 ?auto_202532 ) ) ( not ( = ?auto_202527 ?auto_202533 ) ) ( not ( = ?auto_202527 ?auto_202534 ) ) ( not ( = ?auto_202527 ?auto_202535 ) ) ( not ( = ?auto_202527 ?auto_202536 ) ) ( not ( = ?auto_202527 ?auto_202537 ) ) ( not ( = ?auto_202527 ?auto_202538 ) ) ( not ( = ?auto_202528 ?auto_202529 ) ) ( not ( = ?auto_202528 ?auto_202530 ) ) ( not ( = ?auto_202528 ?auto_202531 ) ) ( not ( = ?auto_202528 ?auto_202532 ) ) ( not ( = ?auto_202528 ?auto_202533 ) ) ( not ( = ?auto_202528 ?auto_202534 ) ) ( not ( = ?auto_202528 ?auto_202535 ) ) ( not ( = ?auto_202528 ?auto_202536 ) ) ( not ( = ?auto_202528 ?auto_202537 ) ) ( not ( = ?auto_202528 ?auto_202538 ) ) ( not ( = ?auto_202529 ?auto_202530 ) ) ( not ( = ?auto_202529 ?auto_202531 ) ) ( not ( = ?auto_202529 ?auto_202532 ) ) ( not ( = ?auto_202529 ?auto_202533 ) ) ( not ( = ?auto_202529 ?auto_202534 ) ) ( not ( = ?auto_202529 ?auto_202535 ) ) ( not ( = ?auto_202529 ?auto_202536 ) ) ( not ( = ?auto_202529 ?auto_202537 ) ) ( not ( = ?auto_202529 ?auto_202538 ) ) ( not ( = ?auto_202530 ?auto_202531 ) ) ( not ( = ?auto_202530 ?auto_202532 ) ) ( not ( = ?auto_202530 ?auto_202533 ) ) ( not ( = ?auto_202530 ?auto_202534 ) ) ( not ( = ?auto_202530 ?auto_202535 ) ) ( not ( = ?auto_202530 ?auto_202536 ) ) ( not ( = ?auto_202530 ?auto_202537 ) ) ( not ( = ?auto_202530 ?auto_202538 ) ) ( not ( = ?auto_202531 ?auto_202532 ) ) ( not ( = ?auto_202531 ?auto_202533 ) ) ( not ( = ?auto_202531 ?auto_202534 ) ) ( not ( = ?auto_202531 ?auto_202535 ) ) ( not ( = ?auto_202531 ?auto_202536 ) ) ( not ( = ?auto_202531 ?auto_202537 ) ) ( not ( = ?auto_202531 ?auto_202538 ) ) ( not ( = ?auto_202532 ?auto_202533 ) ) ( not ( = ?auto_202532 ?auto_202534 ) ) ( not ( = ?auto_202532 ?auto_202535 ) ) ( not ( = ?auto_202532 ?auto_202536 ) ) ( not ( = ?auto_202532 ?auto_202537 ) ) ( not ( = ?auto_202532 ?auto_202538 ) ) ( not ( = ?auto_202533 ?auto_202534 ) ) ( not ( = ?auto_202533 ?auto_202535 ) ) ( not ( = ?auto_202533 ?auto_202536 ) ) ( not ( = ?auto_202533 ?auto_202537 ) ) ( not ( = ?auto_202533 ?auto_202538 ) ) ( not ( = ?auto_202534 ?auto_202535 ) ) ( not ( = ?auto_202534 ?auto_202536 ) ) ( not ( = ?auto_202534 ?auto_202537 ) ) ( not ( = ?auto_202534 ?auto_202538 ) ) ( not ( = ?auto_202535 ?auto_202536 ) ) ( not ( = ?auto_202535 ?auto_202537 ) ) ( not ( = ?auto_202535 ?auto_202538 ) ) ( not ( = ?auto_202536 ?auto_202537 ) ) ( not ( = ?auto_202536 ?auto_202538 ) ) ( not ( = ?auto_202537 ?auto_202538 ) ) ( ON ?auto_202537 ?auto_202538 ) ( ON ?auto_202536 ?auto_202537 ) ( ON ?auto_202535 ?auto_202536 ) ( ON ?auto_202534 ?auto_202535 ) ( ON ?auto_202533 ?auto_202534 ) ( ON ?auto_202532 ?auto_202533 ) ( ON ?auto_202531 ?auto_202532 ) ( CLEAR ?auto_202529 ) ( ON ?auto_202530 ?auto_202531 ) ( CLEAR ?auto_202530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_202527 ?auto_202528 ?auto_202529 ?auto_202530 )
      ( MAKE-12PILE ?auto_202527 ?auto_202528 ?auto_202529 ?auto_202530 ?auto_202531 ?auto_202532 ?auto_202533 ?auto_202534 ?auto_202535 ?auto_202536 ?auto_202537 ?auto_202538 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_202551 - BLOCK
      ?auto_202552 - BLOCK
      ?auto_202553 - BLOCK
      ?auto_202554 - BLOCK
      ?auto_202555 - BLOCK
      ?auto_202556 - BLOCK
      ?auto_202557 - BLOCK
      ?auto_202558 - BLOCK
      ?auto_202559 - BLOCK
      ?auto_202560 - BLOCK
      ?auto_202561 - BLOCK
      ?auto_202562 - BLOCK
    )
    :vars
    (
      ?auto_202563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202562 ?auto_202563 ) ( ON-TABLE ?auto_202551 ) ( ON ?auto_202552 ?auto_202551 ) ( not ( = ?auto_202551 ?auto_202552 ) ) ( not ( = ?auto_202551 ?auto_202553 ) ) ( not ( = ?auto_202551 ?auto_202554 ) ) ( not ( = ?auto_202551 ?auto_202555 ) ) ( not ( = ?auto_202551 ?auto_202556 ) ) ( not ( = ?auto_202551 ?auto_202557 ) ) ( not ( = ?auto_202551 ?auto_202558 ) ) ( not ( = ?auto_202551 ?auto_202559 ) ) ( not ( = ?auto_202551 ?auto_202560 ) ) ( not ( = ?auto_202551 ?auto_202561 ) ) ( not ( = ?auto_202551 ?auto_202562 ) ) ( not ( = ?auto_202551 ?auto_202563 ) ) ( not ( = ?auto_202552 ?auto_202553 ) ) ( not ( = ?auto_202552 ?auto_202554 ) ) ( not ( = ?auto_202552 ?auto_202555 ) ) ( not ( = ?auto_202552 ?auto_202556 ) ) ( not ( = ?auto_202552 ?auto_202557 ) ) ( not ( = ?auto_202552 ?auto_202558 ) ) ( not ( = ?auto_202552 ?auto_202559 ) ) ( not ( = ?auto_202552 ?auto_202560 ) ) ( not ( = ?auto_202552 ?auto_202561 ) ) ( not ( = ?auto_202552 ?auto_202562 ) ) ( not ( = ?auto_202552 ?auto_202563 ) ) ( not ( = ?auto_202553 ?auto_202554 ) ) ( not ( = ?auto_202553 ?auto_202555 ) ) ( not ( = ?auto_202553 ?auto_202556 ) ) ( not ( = ?auto_202553 ?auto_202557 ) ) ( not ( = ?auto_202553 ?auto_202558 ) ) ( not ( = ?auto_202553 ?auto_202559 ) ) ( not ( = ?auto_202553 ?auto_202560 ) ) ( not ( = ?auto_202553 ?auto_202561 ) ) ( not ( = ?auto_202553 ?auto_202562 ) ) ( not ( = ?auto_202553 ?auto_202563 ) ) ( not ( = ?auto_202554 ?auto_202555 ) ) ( not ( = ?auto_202554 ?auto_202556 ) ) ( not ( = ?auto_202554 ?auto_202557 ) ) ( not ( = ?auto_202554 ?auto_202558 ) ) ( not ( = ?auto_202554 ?auto_202559 ) ) ( not ( = ?auto_202554 ?auto_202560 ) ) ( not ( = ?auto_202554 ?auto_202561 ) ) ( not ( = ?auto_202554 ?auto_202562 ) ) ( not ( = ?auto_202554 ?auto_202563 ) ) ( not ( = ?auto_202555 ?auto_202556 ) ) ( not ( = ?auto_202555 ?auto_202557 ) ) ( not ( = ?auto_202555 ?auto_202558 ) ) ( not ( = ?auto_202555 ?auto_202559 ) ) ( not ( = ?auto_202555 ?auto_202560 ) ) ( not ( = ?auto_202555 ?auto_202561 ) ) ( not ( = ?auto_202555 ?auto_202562 ) ) ( not ( = ?auto_202555 ?auto_202563 ) ) ( not ( = ?auto_202556 ?auto_202557 ) ) ( not ( = ?auto_202556 ?auto_202558 ) ) ( not ( = ?auto_202556 ?auto_202559 ) ) ( not ( = ?auto_202556 ?auto_202560 ) ) ( not ( = ?auto_202556 ?auto_202561 ) ) ( not ( = ?auto_202556 ?auto_202562 ) ) ( not ( = ?auto_202556 ?auto_202563 ) ) ( not ( = ?auto_202557 ?auto_202558 ) ) ( not ( = ?auto_202557 ?auto_202559 ) ) ( not ( = ?auto_202557 ?auto_202560 ) ) ( not ( = ?auto_202557 ?auto_202561 ) ) ( not ( = ?auto_202557 ?auto_202562 ) ) ( not ( = ?auto_202557 ?auto_202563 ) ) ( not ( = ?auto_202558 ?auto_202559 ) ) ( not ( = ?auto_202558 ?auto_202560 ) ) ( not ( = ?auto_202558 ?auto_202561 ) ) ( not ( = ?auto_202558 ?auto_202562 ) ) ( not ( = ?auto_202558 ?auto_202563 ) ) ( not ( = ?auto_202559 ?auto_202560 ) ) ( not ( = ?auto_202559 ?auto_202561 ) ) ( not ( = ?auto_202559 ?auto_202562 ) ) ( not ( = ?auto_202559 ?auto_202563 ) ) ( not ( = ?auto_202560 ?auto_202561 ) ) ( not ( = ?auto_202560 ?auto_202562 ) ) ( not ( = ?auto_202560 ?auto_202563 ) ) ( not ( = ?auto_202561 ?auto_202562 ) ) ( not ( = ?auto_202561 ?auto_202563 ) ) ( not ( = ?auto_202562 ?auto_202563 ) ) ( ON ?auto_202561 ?auto_202562 ) ( ON ?auto_202560 ?auto_202561 ) ( ON ?auto_202559 ?auto_202560 ) ( ON ?auto_202558 ?auto_202559 ) ( ON ?auto_202557 ?auto_202558 ) ( ON ?auto_202556 ?auto_202557 ) ( ON ?auto_202555 ?auto_202556 ) ( ON ?auto_202554 ?auto_202555 ) ( CLEAR ?auto_202552 ) ( ON ?auto_202553 ?auto_202554 ) ( CLEAR ?auto_202553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_202551 ?auto_202552 ?auto_202553 )
      ( MAKE-12PILE ?auto_202551 ?auto_202552 ?auto_202553 ?auto_202554 ?auto_202555 ?auto_202556 ?auto_202557 ?auto_202558 ?auto_202559 ?auto_202560 ?auto_202561 ?auto_202562 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_202576 - BLOCK
      ?auto_202577 - BLOCK
      ?auto_202578 - BLOCK
      ?auto_202579 - BLOCK
      ?auto_202580 - BLOCK
      ?auto_202581 - BLOCK
      ?auto_202582 - BLOCK
      ?auto_202583 - BLOCK
      ?auto_202584 - BLOCK
      ?auto_202585 - BLOCK
      ?auto_202586 - BLOCK
      ?auto_202587 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202587 ) ( ON-TABLE ?auto_202576 ) ( ON ?auto_202577 ?auto_202576 ) ( not ( = ?auto_202576 ?auto_202577 ) ) ( not ( = ?auto_202576 ?auto_202578 ) ) ( not ( = ?auto_202576 ?auto_202579 ) ) ( not ( = ?auto_202576 ?auto_202580 ) ) ( not ( = ?auto_202576 ?auto_202581 ) ) ( not ( = ?auto_202576 ?auto_202582 ) ) ( not ( = ?auto_202576 ?auto_202583 ) ) ( not ( = ?auto_202576 ?auto_202584 ) ) ( not ( = ?auto_202576 ?auto_202585 ) ) ( not ( = ?auto_202576 ?auto_202586 ) ) ( not ( = ?auto_202576 ?auto_202587 ) ) ( not ( = ?auto_202577 ?auto_202578 ) ) ( not ( = ?auto_202577 ?auto_202579 ) ) ( not ( = ?auto_202577 ?auto_202580 ) ) ( not ( = ?auto_202577 ?auto_202581 ) ) ( not ( = ?auto_202577 ?auto_202582 ) ) ( not ( = ?auto_202577 ?auto_202583 ) ) ( not ( = ?auto_202577 ?auto_202584 ) ) ( not ( = ?auto_202577 ?auto_202585 ) ) ( not ( = ?auto_202577 ?auto_202586 ) ) ( not ( = ?auto_202577 ?auto_202587 ) ) ( not ( = ?auto_202578 ?auto_202579 ) ) ( not ( = ?auto_202578 ?auto_202580 ) ) ( not ( = ?auto_202578 ?auto_202581 ) ) ( not ( = ?auto_202578 ?auto_202582 ) ) ( not ( = ?auto_202578 ?auto_202583 ) ) ( not ( = ?auto_202578 ?auto_202584 ) ) ( not ( = ?auto_202578 ?auto_202585 ) ) ( not ( = ?auto_202578 ?auto_202586 ) ) ( not ( = ?auto_202578 ?auto_202587 ) ) ( not ( = ?auto_202579 ?auto_202580 ) ) ( not ( = ?auto_202579 ?auto_202581 ) ) ( not ( = ?auto_202579 ?auto_202582 ) ) ( not ( = ?auto_202579 ?auto_202583 ) ) ( not ( = ?auto_202579 ?auto_202584 ) ) ( not ( = ?auto_202579 ?auto_202585 ) ) ( not ( = ?auto_202579 ?auto_202586 ) ) ( not ( = ?auto_202579 ?auto_202587 ) ) ( not ( = ?auto_202580 ?auto_202581 ) ) ( not ( = ?auto_202580 ?auto_202582 ) ) ( not ( = ?auto_202580 ?auto_202583 ) ) ( not ( = ?auto_202580 ?auto_202584 ) ) ( not ( = ?auto_202580 ?auto_202585 ) ) ( not ( = ?auto_202580 ?auto_202586 ) ) ( not ( = ?auto_202580 ?auto_202587 ) ) ( not ( = ?auto_202581 ?auto_202582 ) ) ( not ( = ?auto_202581 ?auto_202583 ) ) ( not ( = ?auto_202581 ?auto_202584 ) ) ( not ( = ?auto_202581 ?auto_202585 ) ) ( not ( = ?auto_202581 ?auto_202586 ) ) ( not ( = ?auto_202581 ?auto_202587 ) ) ( not ( = ?auto_202582 ?auto_202583 ) ) ( not ( = ?auto_202582 ?auto_202584 ) ) ( not ( = ?auto_202582 ?auto_202585 ) ) ( not ( = ?auto_202582 ?auto_202586 ) ) ( not ( = ?auto_202582 ?auto_202587 ) ) ( not ( = ?auto_202583 ?auto_202584 ) ) ( not ( = ?auto_202583 ?auto_202585 ) ) ( not ( = ?auto_202583 ?auto_202586 ) ) ( not ( = ?auto_202583 ?auto_202587 ) ) ( not ( = ?auto_202584 ?auto_202585 ) ) ( not ( = ?auto_202584 ?auto_202586 ) ) ( not ( = ?auto_202584 ?auto_202587 ) ) ( not ( = ?auto_202585 ?auto_202586 ) ) ( not ( = ?auto_202585 ?auto_202587 ) ) ( not ( = ?auto_202586 ?auto_202587 ) ) ( ON ?auto_202586 ?auto_202587 ) ( ON ?auto_202585 ?auto_202586 ) ( ON ?auto_202584 ?auto_202585 ) ( ON ?auto_202583 ?auto_202584 ) ( ON ?auto_202582 ?auto_202583 ) ( ON ?auto_202581 ?auto_202582 ) ( ON ?auto_202580 ?auto_202581 ) ( ON ?auto_202579 ?auto_202580 ) ( CLEAR ?auto_202577 ) ( ON ?auto_202578 ?auto_202579 ) ( CLEAR ?auto_202578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_202576 ?auto_202577 ?auto_202578 )
      ( MAKE-12PILE ?auto_202576 ?auto_202577 ?auto_202578 ?auto_202579 ?auto_202580 ?auto_202581 ?auto_202582 ?auto_202583 ?auto_202584 ?auto_202585 ?auto_202586 ?auto_202587 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_202600 - BLOCK
      ?auto_202601 - BLOCK
      ?auto_202602 - BLOCK
      ?auto_202603 - BLOCK
      ?auto_202604 - BLOCK
      ?auto_202605 - BLOCK
      ?auto_202606 - BLOCK
      ?auto_202607 - BLOCK
      ?auto_202608 - BLOCK
      ?auto_202609 - BLOCK
      ?auto_202610 - BLOCK
      ?auto_202611 - BLOCK
    )
    :vars
    (
      ?auto_202612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202611 ?auto_202612 ) ( ON-TABLE ?auto_202600 ) ( not ( = ?auto_202600 ?auto_202601 ) ) ( not ( = ?auto_202600 ?auto_202602 ) ) ( not ( = ?auto_202600 ?auto_202603 ) ) ( not ( = ?auto_202600 ?auto_202604 ) ) ( not ( = ?auto_202600 ?auto_202605 ) ) ( not ( = ?auto_202600 ?auto_202606 ) ) ( not ( = ?auto_202600 ?auto_202607 ) ) ( not ( = ?auto_202600 ?auto_202608 ) ) ( not ( = ?auto_202600 ?auto_202609 ) ) ( not ( = ?auto_202600 ?auto_202610 ) ) ( not ( = ?auto_202600 ?auto_202611 ) ) ( not ( = ?auto_202600 ?auto_202612 ) ) ( not ( = ?auto_202601 ?auto_202602 ) ) ( not ( = ?auto_202601 ?auto_202603 ) ) ( not ( = ?auto_202601 ?auto_202604 ) ) ( not ( = ?auto_202601 ?auto_202605 ) ) ( not ( = ?auto_202601 ?auto_202606 ) ) ( not ( = ?auto_202601 ?auto_202607 ) ) ( not ( = ?auto_202601 ?auto_202608 ) ) ( not ( = ?auto_202601 ?auto_202609 ) ) ( not ( = ?auto_202601 ?auto_202610 ) ) ( not ( = ?auto_202601 ?auto_202611 ) ) ( not ( = ?auto_202601 ?auto_202612 ) ) ( not ( = ?auto_202602 ?auto_202603 ) ) ( not ( = ?auto_202602 ?auto_202604 ) ) ( not ( = ?auto_202602 ?auto_202605 ) ) ( not ( = ?auto_202602 ?auto_202606 ) ) ( not ( = ?auto_202602 ?auto_202607 ) ) ( not ( = ?auto_202602 ?auto_202608 ) ) ( not ( = ?auto_202602 ?auto_202609 ) ) ( not ( = ?auto_202602 ?auto_202610 ) ) ( not ( = ?auto_202602 ?auto_202611 ) ) ( not ( = ?auto_202602 ?auto_202612 ) ) ( not ( = ?auto_202603 ?auto_202604 ) ) ( not ( = ?auto_202603 ?auto_202605 ) ) ( not ( = ?auto_202603 ?auto_202606 ) ) ( not ( = ?auto_202603 ?auto_202607 ) ) ( not ( = ?auto_202603 ?auto_202608 ) ) ( not ( = ?auto_202603 ?auto_202609 ) ) ( not ( = ?auto_202603 ?auto_202610 ) ) ( not ( = ?auto_202603 ?auto_202611 ) ) ( not ( = ?auto_202603 ?auto_202612 ) ) ( not ( = ?auto_202604 ?auto_202605 ) ) ( not ( = ?auto_202604 ?auto_202606 ) ) ( not ( = ?auto_202604 ?auto_202607 ) ) ( not ( = ?auto_202604 ?auto_202608 ) ) ( not ( = ?auto_202604 ?auto_202609 ) ) ( not ( = ?auto_202604 ?auto_202610 ) ) ( not ( = ?auto_202604 ?auto_202611 ) ) ( not ( = ?auto_202604 ?auto_202612 ) ) ( not ( = ?auto_202605 ?auto_202606 ) ) ( not ( = ?auto_202605 ?auto_202607 ) ) ( not ( = ?auto_202605 ?auto_202608 ) ) ( not ( = ?auto_202605 ?auto_202609 ) ) ( not ( = ?auto_202605 ?auto_202610 ) ) ( not ( = ?auto_202605 ?auto_202611 ) ) ( not ( = ?auto_202605 ?auto_202612 ) ) ( not ( = ?auto_202606 ?auto_202607 ) ) ( not ( = ?auto_202606 ?auto_202608 ) ) ( not ( = ?auto_202606 ?auto_202609 ) ) ( not ( = ?auto_202606 ?auto_202610 ) ) ( not ( = ?auto_202606 ?auto_202611 ) ) ( not ( = ?auto_202606 ?auto_202612 ) ) ( not ( = ?auto_202607 ?auto_202608 ) ) ( not ( = ?auto_202607 ?auto_202609 ) ) ( not ( = ?auto_202607 ?auto_202610 ) ) ( not ( = ?auto_202607 ?auto_202611 ) ) ( not ( = ?auto_202607 ?auto_202612 ) ) ( not ( = ?auto_202608 ?auto_202609 ) ) ( not ( = ?auto_202608 ?auto_202610 ) ) ( not ( = ?auto_202608 ?auto_202611 ) ) ( not ( = ?auto_202608 ?auto_202612 ) ) ( not ( = ?auto_202609 ?auto_202610 ) ) ( not ( = ?auto_202609 ?auto_202611 ) ) ( not ( = ?auto_202609 ?auto_202612 ) ) ( not ( = ?auto_202610 ?auto_202611 ) ) ( not ( = ?auto_202610 ?auto_202612 ) ) ( not ( = ?auto_202611 ?auto_202612 ) ) ( ON ?auto_202610 ?auto_202611 ) ( ON ?auto_202609 ?auto_202610 ) ( ON ?auto_202608 ?auto_202609 ) ( ON ?auto_202607 ?auto_202608 ) ( ON ?auto_202606 ?auto_202607 ) ( ON ?auto_202605 ?auto_202606 ) ( ON ?auto_202604 ?auto_202605 ) ( ON ?auto_202603 ?auto_202604 ) ( ON ?auto_202602 ?auto_202603 ) ( CLEAR ?auto_202600 ) ( ON ?auto_202601 ?auto_202602 ) ( CLEAR ?auto_202601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_202600 ?auto_202601 )
      ( MAKE-12PILE ?auto_202600 ?auto_202601 ?auto_202602 ?auto_202603 ?auto_202604 ?auto_202605 ?auto_202606 ?auto_202607 ?auto_202608 ?auto_202609 ?auto_202610 ?auto_202611 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_202625 - BLOCK
      ?auto_202626 - BLOCK
      ?auto_202627 - BLOCK
      ?auto_202628 - BLOCK
      ?auto_202629 - BLOCK
      ?auto_202630 - BLOCK
      ?auto_202631 - BLOCK
      ?auto_202632 - BLOCK
      ?auto_202633 - BLOCK
      ?auto_202634 - BLOCK
      ?auto_202635 - BLOCK
      ?auto_202636 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202636 ) ( ON-TABLE ?auto_202625 ) ( not ( = ?auto_202625 ?auto_202626 ) ) ( not ( = ?auto_202625 ?auto_202627 ) ) ( not ( = ?auto_202625 ?auto_202628 ) ) ( not ( = ?auto_202625 ?auto_202629 ) ) ( not ( = ?auto_202625 ?auto_202630 ) ) ( not ( = ?auto_202625 ?auto_202631 ) ) ( not ( = ?auto_202625 ?auto_202632 ) ) ( not ( = ?auto_202625 ?auto_202633 ) ) ( not ( = ?auto_202625 ?auto_202634 ) ) ( not ( = ?auto_202625 ?auto_202635 ) ) ( not ( = ?auto_202625 ?auto_202636 ) ) ( not ( = ?auto_202626 ?auto_202627 ) ) ( not ( = ?auto_202626 ?auto_202628 ) ) ( not ( = ?auto_202626 ?auto_202629 ) ) ( not ( = ?auto_202626 ?auto_202630 ) ) ( not ( = ?auto_202626 ?auto_202631 ) ) ( not ( = ?auto_202626 ?auto_202632 ) ) ( not ( = ?auto_202626 ?auto_202633 ) ) ( not ( = ?auto_202626 ?auto_202634 ) ) ( not ( = ?auto_202626 ?auto_202635 ) ) ( not ( = ?auto_202626 ?auto_202636 ) ) ( not ( = ?auto_202627 ?auto_202628 ) ) ( not ( = ?auto_202627 ?auto_202629 ) ) ( not ( = ?auto_202627 ?auto_202630 ) ) ( not ( = ?auto_202627 ?auto_202631 ) ) ( not ( = ?auto_202627 ?auto_202632 ) ) ( not ( = ?auto_202627 ?auto_202633 ) ) ( not ( = ?auto_202627 ?auto_202634 ) ) ( not ( = ?auto_202627 ?auto_202635 ) ) ( not ( = ?auto_202627 ?auto_202636 ) ) ( not ( = ?auto_202628 ?auto_202629 ) ) ( not ( = ?auto_202628 ?auto_202630 ) ) ( not ( = ?auto_202628 ?auto_202631 ) ) ( not ( = ?auto_202628 ?auto_202632 ) ) ( not ( = ?auto_202628 ?auto_202633 ) ) ( not ( = ?auto_202628 ?auto_202634 ) ) ( not ( = ?auto_202628 ?auto_202635 ) ) ( not ( = ?auto_202628 ?auto_202636 ) ) ( not ( = ?auto_202629 ?auto_202630 ) ) ( not ( = ?auto_202629 ?auto_202631 ) ) ( not ( = ?auto_202629 ?auto_202632 ) ) ( not ( = ?auto_202629 ?auto_202633 ) ) ( not ( = ?auto_202629 ?auto_202634 ) ) ( not ( = ?auto_202629 ?auto_202635 ) ) ( not ( = ?auto_202629 ?auto_202636 ) ) ( not ( = ?auto_202630 ?auto_202631 ) ) ( not ( = ?auto_202630 ?auto_202632 ) ) ( not ( = ?auto_202630 ?auto_202633 ) ) ( not ( = ?auto_202630 ?auto_202634 ) ) ( not ( = ?auto_202630 ?auto_202635 ) ) ( not ( = ?auto_202630 ?auto_202636 ) ) ( not ( = ?auto_202631 ?auto_202632 ) ) ( not ( = ?auto_202631 ?auto_202633 ) ) ( not ( = ?auto_202631 ?auto_202634 ) ) ( not ( = ?auto_202631 ?auto_202635 ) ) ( not ( = ?auto_202631 ?auto_202636 ) ) ( not ( = ?auto_202632 ?auto_202633 ) ) ( not ( = ?auto_202632 ?auto_202634 ) ) ( not ( = ?auto_202632 ?auto_202635 ) ) ( not ( = ?auto_202632 ?auto_202636 ) ) ( not ( = ?auto_202633 ?auto_202634 ) ) ( not ( = ?auto_202633 ?auto_202635 ) ) ( not ( = ?auto_202633 ?auto_202636 ) ) ( not ( = ?auto_202634 ?auto_202635 ) ) ( not ( = ?auto_202634 ?auto_202636 ) ) ( not ( = ?auto_202635 ?auto_202636 ) ) ( ON ?auto_202635 ?auto_202636 ) ( ON ?auto_202634 ?auto_202635 ) ( ON ?auto_202633 ?auto_202634 ) ( ON ?auto_202632 ?auto_202633 ) ( ON ?auto_202631 ?auto_202632 ) ( ON ?auto_202630 ?auto_202631 ) ( ON ?auto_202629 ?auto_202630 ) ( ON ?auto_202628 ?auto_202629 ) ( ON ?auto_202627 ?auto_202628 ) ( CLEAR ?auto_202625 ) ( ON ?auto_202626 ?auto_202627 ) ( CLEAR ?auto_202626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_202625 ?auto_202626 )
      ( MAKE-12PILE ?auto_202625 ?auto_202626 ?auto_202627 ?auto_202628 ?auto_202629 ?auto_202630 ?auto_202631 ?auto_202632 ?auto_202633 ?auto_202634 ?auto_202635 ?auto_202636 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_202649 - BLOCK
      ?auto_202650 - BLOCK
      ?auto_202651 - BLOCK
      ?auto_202652 - BLOCK
      ?auto_202653 - BLOCK
      ?auto_202654 - BLOCK
      ?auto_202655 - BLOCK
      ?auto_202656 - BLOCK
      ?auto_202657 - BLOCK
      ?auto_202658 - BLOCK
      ?auto_202659 - BLOCK
      ?auto_202660 - BLOCK
    )
    :vars
    (
      ?auto_202661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202660 ?auto_202661 ) ( not ( = ?auto_202649 ?auto_202650 ) ) ( not ( = ?auto_202649 ?auto_202651 ) ) ( not ( = ?auto_202649 ?auto_202652 ) ) ( not ( = ?auto_202649 ?auto_202653 ) ) ( not ( = ?auto_202649 ?auto_202654 ) ) ( not ( = ?auto_202649 ?auto_202655 ) ) ( not ( = ?auto_202649 ?auto_202656 ) ) ( not ( = ?auto_202649 ?auto_202657 ) ) ( not ( = ?auto_202649 ?auto_202658 ) ) ( not ( = ?auto_202649 ?auto_202659 ) ) ( not ( = ?auto_202649 ?auto_202660 ) ) ( not ( = ?auto_202649 ?auto_202661 ) ) ( not ( = ?auto_202650 ?auto_202651 ) ) ( not ( = ?auto_202650 ?auto_202652 ) ) ( not ( = ?auto_202650 ?auto_202653 ) ) ( not ( = ?auto_202650 ?auto_202654 ) ) ( not ( = ?auto_202650 ?auto_202655 ) ) ( not ( = ?auto_202650 ?auto_202656 ) ) ( not ( = ?auto_202650 ?auto_202657 ) ) ( not ( = ?auto_202650 ?auto_202658 ) ) ( not ( = ?auto_202650 ?auto_202659 ) ) ( not ( = ?auto_202650 ?auto_202660 ) ) ( not ( = ?auto_202650 ?auto_202661 ) ) ( not ( = ?auto_202651 ?auto_202652 ) ) ( not ( = ?auto_202651 ?auto_202653 ) ) ( not ( = ?auto_202651 ?auto_202654 ) ) ( not ( = ?auto_202651 ?auto_202655 ) ) ( not ( = ?auto_202651 ?auto_202656 ) ) ( not ( = ?auto_202651 ?auto_202657 ) ) ( not ( = ?auto_202651 ?auto_202658 ) ) ( not ( = ?auto_202651 ?auto_202659 ) ) ( not ( = ?auto_202651 ?auto_202660 ) ) ( not ( = ?auto_202651 ?auto_202661 ) ) ( not ( = ?auto_202652 ?auto_202653 ) ) ( not ( = ?auto_202652 ?auto_202654 ) ) ( not ( = ?auto_202652 ?auto_202655 ) ) ( not ( = ?auto_202652 ?auto_202656 ) ) ( not ( = ?auto_202652 ?auto_202657 ) ) ( not ( = ?auto_202652 ?auto_202658 ) ) ( not ( = ?auto_202652 ?auto_202659 ) ) ( not ( = ?auto_202652 ?auto_202660 ) ) ( not ( = ?auto_202652 ?auto_202661 ) ) ( not ( = ?auto_202653 ?auto_202654 ) ) ( not ( = ?auto_202653 ?auto_202655 ) ) ( not ( = ?auto_202653 ?auto_202656 ) ) ( not ( = ?auto_202653 ?auto_202657 ) ) ( not ( = ?auto_202653 ?auto_202658 ) ) ( not ( = ?auto_202653 ?auto_202659 ) ) ( not ( = ?auto_202653 ?auto_202660 ) ) ( not ( = ?auto_202653 ?auto_202661 ) ) ( not ( = ?auto_202654 ?auto_202655 ) ) ( not ( = ?auto_202654 ?auto_202656 ) ) ( not ( = ?auto_202654 ?auto_202657 ) ) ( not ( = ?auto_202654 ?auto_202658 ) ) ( not ( = ?auto_202654 ?auto_202659 ) ) ( not ( = ?auto_202654 ?auto_202660 ) ) ( not ( = ?auto_202654 ?auto_202661 ) ) ( not ( = ?auto_202655 ?auto_202656 ) ) ( not ( = ?auto_202655 ?auto_202657 ) ) ( not ( = ?auto_202655 ?auto_202658 ) ) ( not ( = ?auto_202655 ?auto_202659 ) ) ( not ( = ?auto_202655 ?auto_202660 ) ) ( not ( = ?auto_202655 ?auto_202661 ) ) ( not ( = ?auto_202656 ?auto_202657 ) ) ( not ( = ?auto_202656 ?auto_202658 ) ) ( not ( = ?auto_202656 ?auto_202659 ) ) ( not ( = ?auto_202656 ?auto_202660 ) ) ( not ( = ?auto_202656 ?auto_202661 ) ) ( not ( = ?auto_202657 ?auto_202658 ) ) ( not ( = ?auto_202657 ?auto_202659 ) ) ( not ( = ?auto_202657 ?auto_202660 ) ) ( not ( = ?auto_202657 ?auto_202661 ) ) ( not ( = ?auto_202658 ?auto_202659 ) ) ( not ( = ?auto_202658 ?auto_202660 ) ) ( not ( = ?auto_202658 ?auto_202661 ) ) ( not ( = ?auto_202659 ?auto_202660 ) ) ( not ( = ?auto_202659 ?auto_202661 ) ) ( not ( = ?auto_202660 ?auto_202661 ) ) ( ON ?auto_202659 ?auto_202660 ) ( ON ?auto_202658 ?auto_202659 ) ( ON ?auto_202657 ?auto_202658 ) ( ON ?auto_202656 ?auto_202657 ) ( ON ?auto_202655 ?auto_202656 ) ( ON ?auto_202654 ?auto_202655 ) ( ON ?auto_202653 ?auto_202654 ) ( ON ?auto_202652 ?auto_202653 ) ( ON ?auto_202651 ?auto_202652 ) ( ON ?auto_202650 ?auto_202651 ) ( ON ?auto_202649 ?auto_202650 ) ( CLEAR ?auto_202649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_202649 )
      ( MAKE-12PILE ?auto_202649 ?auto_202650 ?auto_202651 ?auto_202652 ?auto_202653 ?auto_202654 ?auto_202655 ?auto_202656 ?auto_202657 ?auto_202658 ?auto_202659 ?auto_202660 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_202674 - BLOCK
      ?auto_202675 - BLOCK
      ?auto_202676 - BLOCK
      ?auto_202677 - BLOCK
      ?auto_202678 - BLOCK
      ?auto_202679 - BLOCK
      ?auto_202680 - BLOCK
      ?auto_202681 - BLOCK
      ?auto_202682 - BLOCK
      ?auto_202683 - BLOCK
      ?auto_202684 - BLOCK
      ?auto_202685 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202685 ) ( not ( = ?auto_202674 ?auto_202675 ) ) ( not ( = ?auto_202674 ?auto_202676 ) ) ( not ( = ?auto_202674 ?auto_202677 ) ) ( not ( = ?auto_202674 ?auto_202678 ) ) ( not ( = ?auto_202674 ?auto_202679 ) ) ( not ( = ?auto_202674 ?auto_202680 ) ) ( not ( = ?auto_202674 ?auto_202681 ) ) ( not ( = ?auto_202674 ?auto_202682 ) ) ( not ( = ?auto_202674 ?auto_202683 ) ) ( not ( = ?auto_202674 ?auto_202684 ) ) ( not ( = ?auto_202674 ?auto_202685 ) ) ( not ( = ?auto_202675 ?auto_202676 ) ) ( not ( = ?auto_202675 ?auto_202677 ) ) ( not ( = ?auto_202675 ?auto_202678 ) ) ( not ( = ?auto_202675 ?auto_202679 ) ) ( not ( = ?auto_202675 ?auto_202680 ) ) ( not ( = ?auto_202675 ?auto_202681 ) ) ( not ( = ?auto_202675 ?auto_202682 ) ) ( not ( = ?auto_202675 ?auto_202683 ) ) ( not ( = ?auto_202675 ?auto_202684 ) ) ( not ( = ?auto_202675 ?auto_202685 ) ) ( not ( = ?auto_202676 ?auto_202677 ) ) ( not ( = ?auto_202676 ?auto_202678 ) ) ( not ( = ?auto_202676 ?auto_202679 ) ) ( not ( = ?auto_202676 ?auto_202680 ) ) ( not ( = ?auto_202676 ?auto_202681 ) ) ( not ( = ?auto_202676 ?auto_202682 ) ) ( not ( = ?auto_202676 ?auto_202683 ) ) ( not ( = ?auto_202676 ?auto_202684 ) ) ( not ( = ?auto_202676 ?auto_202685 ) ) ( not ( = ?auto_202677 ?auto_202678 ) ) ( not ( = ?auto_202677 ?auto_202679 ) ) ( not ( = ?auto_202677 ?auto_202680 ) ) ( not ( = ?auto_202677 ?auto_202681 ) ) ( not ( = ?auto_202677 ?auto_202682 ) ) ( not ( = ?auto_202677 ?auto_202683 ) ) ( not ( = ?auto_202677 ?auto_202684 ) ) ( not ( = ?auto_202677 ?auto_202685 ) ) ( not ( = ?auto_202678 ?auto_202679 ) ) ( not ( = ?auto_202678 ?auto_202680 ) ) ( not ( = ?auto_202678 ?auto_202681 ) ) ( not ( = ?auto_202678 ?auto_202682 ) ) ( not ( = ?auto_202678 ?auto_202683 ) ) ( not ( = ?auto_202678 ?auto_202684 ) ) ( not ( = ?auto_202678 ?auto_202685 ) ) ( not ( = ?auto_202679 ?auto_202680 ) ) ( not ( = ?auto_202679 ?auto_202681 ) ) ( not ( = ?auto_202679 ?auto_202682 ) ) ( not ( = ?auto_202679 ?auto_202683 ) ) ( not ( = ?auto_202679 ?auto_202684 ) ) ( not ( = ?auto_202679 ?auto_202685 ) ) ( not ( = ?auto_202680 ?auto_202681 ) ) ( not ( = ?auto_202680 ?auto_202682 ) ) ( not ( = ?auto_202680 ?auto_202683 ) ) ( not ( = ?auto_202680 ?auto_202684 ) ) ( not ( = ?auto_202680 ?auto_202685 ) ) ( not ( = ?auto_202681 ?auto_202682 ) ) ( not ( = ?auto_202681 ?auto_202683 ) ) ( not ( = ?auto_202681 ?auto_202684 ) ) ( not ( = ?auto_202681 ?auto_202685 ) ) ( not ( = ?auto_202682 ?auto_202683 ) ) ( not ( = ?auto_202682 ?auto_202684 ) ) ( not ( = ?auto_202682 ?auto_202685 ) ) ( not ( = ?auto_202683 ?auto_202684 ) ) ( not ( = ?auto_202683 ?auto_202685 ) ) ( not ( = ?auto_202684 ?auto_202685 ) ) ( ON ?auto_202684 ?auto_202685 ) ( ON ?auto_202683 ?auto_202684 ) ( ON ?auto_202682 ?auto_202683 ) ( ON ?auto_202681 ?auto_202682 ) ( ON ?auto_202680 ?auto_202681 ) ( ON ?auto_202679 ?auto_202680 ) ( ON ?auto_202678 ?auto_202679 ) ( ON ?auto_202677 ?auto_202678 ) ( ON ?auto_202676 ?auto_202677 ) ( ON ?auto_202675 ?auto_202676 ) ( ON ?auto_202674 ?auto_202675 ) ( CLEAR ?auto_202674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_202674 )
      ( MAKE-12PILE ?auto_202674 ?auto_202675 ?auto_202676 ?auto_202677 ?auto_202678 ?auto_202679 ?auto_202680 ?auto_202681 ?auto_202682 ?auto_202683 ?auto_202684 ?auto_202685 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_202698 - BLOCK
      ?auto_202699 - BLOCK
      ?auto_202700 - BLOCK
      ?auto_202701 - BLOCK
      ?auto_202702 - BLOCK
      ?auto_202703 - BLOCK
      ?auto_202704 - BLOCK
      ?auto_202705 - BLOCK
      ?auto_202706 - BLOCK
      ?auto_202707 - BLOCK
      ?auto_202708 - BLOCK
      ?auto_202709 - BLOCK
    )
    :vars
    (
      ?auto_202710 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202698 ?auto_202699 ) ) ( not ( = ?auto_202698 ?auto_202700 ) ) ( not ( = ?auto_202698 ?auto_202701 ) ) ( not ( = ?auto_202698 ?auto_202702 ) ) ( not ( = ?auto_202698 ?auto_202703 ) ) ( not ( = ?auto_202698 ?auto_202704 ) ) ( not ( = ?auto_202698 ?auto_202705 ) ) ( not ( = ?auto_202698 ?auto_202706 ) ) ( not ( = ?auto_202698 ?auto_202707 ) ) ( not ( = ?auto_202698 ?auto_202708 ) ) ( not ( = ?auto_202698 ?auto_202709 ) ) ( not ( = ?auto_202699 ?auto_202700 ) ) ( not ( = ?auto_202699 ?auto_202701 ) ) ( not ( = ?auto_202699 ?auto_202702 ) ) ( not ( = ?auto_202699 ?auto_202703 ) ) ( not ( = ?auto_202699 ?auto_202704 ) ) ( not ( = ?auto_202699 ?auto_202705 ) ) ( not ( = ?auto_202699 ?auto_202706 ) ) ( not ( = ?auto_202699 ?auto_202707 ) ) ( not ( = ?auto_202699 ?auto_202708 ) ) ( not ( = ?auto_202699 ?auto_202709 ) ) ( not ( = ?auto_202700 ?auto_202701 ) ) ( not ( = ?auto_202700 ?auto_202702 ) ) ( not ( = ?auto_202700 ?auto_202703 ) ) ( not ( = ?auto_202700 ?auto_202704 ) ) ( not ( = ?auto_202700 ?auto_202705 ) ) ( not ( = ?auto_202700 ?auto_202706 ) ) ( not ( = ?auto_202700 ?auto_202707 ) ) ( not ( = ?auto_202700 ?auto_202708 ) ) ( not ( = ?auto_202700 ?auto_202709 ) ) ( not ( = ?auto_202701 ?auto_202702 ) ) ( not ( = ?auto_202701 ?auto_202703 ) ) ( not ( = ?auto_202701 ?auto_202704 ) ) ( not ( = ?auto_202701 ?auto_202705 ) ) ( not ( = ?auto_202701 ?auto_202706 ) ) ( not ( = ?auto_202701 ?auto_202707 ) ) ( not ( = ?auto_202701 ?auto_202708 ) ) ( not ( = ?auto_202701 ?auto_202709 ) ) ( not ( = ?auto_202702 ?auto_202703 ) ) ( not ( = ?auto_202702 ?auto_202704 ) ) ( not ( = ?auto_202702 ?auto_202705 ) ) ( not ( = ?auto_202702 ?auto_202706 ) ) ( not ( = ?auto_202702 ?auto_202707 ) ) ( not ( = ?auto_202702 ?auto_202708 ) ) ( not ( = ?auto_202702 ?auto_202709 ) ) ( not ( = ?auto_202703 ?auto_202704 ) ) ( not ( = ?auto_202703 ?auto_202705 ) ) ( not ( = ?auto_202703 ?auto_202706 ) ) ( not ( = ?auto_202703 ?auto_202707 ) ) ( not ( = ?auto_202703 ?auto_202708 ) ) ( not ( = ?auto_202703 ?auto_202709 ) ) ( not ( = ?auto_202704 ?auto_202705 ) ) ( not ( = ?auto_202704 ?auto_202706 ) ) ( not ( = ?auto_202704 ?auto_202707 ) ) ( not ( = ?auto_202704 ?auto_202708 ) ) ( not ( = ?auto_202704 ?auto_202709 ) ) ( not ( = ?auto_202705 ?auto_202706 ) ) ( not ( = ?auto_202705 ?auto_202707 ) ) ( not ( = ?auto_202705 ?auto_202708 ) ) ( not ( = ?auto_202705 ?auto_202709 ) ) ( not ( = ?auto_202706 ?auto_202707 ) ) ( not ( = ?auto_202706 ?auto_202708 ) ) ( not ( = ?auto_202706 ?auto_202709 ) ) ( not ( = ?auto_202707 ?auto_202708 ) ) ( not ( = ?auto_202707 ?auto_202709 ) ) ( not ( = ?auto_202708 ?auto_202709 ) ) ( ON ?auto_202698 ?auto_202710 ) ( not ( = ?auto_202709 ?auto_202710 ) ) ( not ( = ?auto_202708 ?auto_202710 ) ) ( not ( = ?auto_202707 ?auto_202710 ) ) ( not ( = ?auto_202706 ?auto_202710 ) ) ( not ( = ?auto_202705 ?auto_202710 ) ) ( not ( = ?auto_202704 ?auto_202710 ) ) ( not ( = ?auto_202703 ?auto_202710 ) ) ( not ( = ?auto_202702 ?auto_202710 ) ) ( not ( = ?auto_202701 ?auto_202710 ) ) ( not ( = ?auto_202700 ?auto_202710 ) ) ( not ( = ?auto_202699 ?auto_202710 ) ) ( not ( = ?auto_202698 ?auto_202710 ) ) ( ON ?auto_202699 ?auto_202698 ) ( ON ?auto_202700 ?auto_202699 ) ( ON ?auto_202701 ?auto_202700 ) ( ON ?auto_202702 ?auto_202701 ) ( ON ?auto_202703 ?auto_202702 ) ( ON ?auto_202704 ?auto_202703 ) ( ON ?auto_202705 ?auto_202704 ) ( ON ?auto_202706 ?auto_202705 ) ( ON ?auto_202707 ?auto_202706 ) ( ON ?auto_202708 ?auto_202707 ) ( ON ?auto_202709 ?auto_202708 ) ( CLEAR ?auto_202709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_202709 ?auto_202708 ?auto_202707 ?auto_202706 ?auto_202705 ?auto_202704 ?auto_202703 ?auto_202702 ?auto_202701 ?auto_202700 ?auto_202699 ?auto_202698 )
      ( MAKE-12PILE ?auto_202698 ?auto_202699 ?auto_202700 ?auto_202701 ?auto_202702 ?auto_202703 ?auto_202704 ?auto_202705 ?auto_202706 ?auto_202707 ?auto_202708 ?auto_202709 ) )
  )

)

