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
      ?auto_679969 - BLOCK
    )
    :vars
    (
      ?auto_679970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_679969 ?auto_679970 ) ( CLEAR ?auto_679969 ) ( HAND-EMPTY ) ( not ( = ?auto_679969 ?auto_679970 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_679969 ?auto_679970 )
      ( !PUTDOWN ?auto_679969 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_679976 - BLOCK
      ?auto_679977 - BLOCK
    )
    :vars
    (
      ?auto_679978 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_679976 ) ( ON ?auto_679977 ?auto_679978 ) ( CLEAR ?auto_679977 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_679976 ) ( not ( = ?auto_679976 ?auto_679977 ) ) ( not ( = ?auto_679976 ?auto_679978 ) ) ( not ( = ?auto_679977 ?auto_679978 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_679977 ?auto_679978 )
      ( !STACK ?auto_679977 ?auto_679976 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_679986 - BLOCK
      ?auto_679987 - BLOCK
    )
    :vars
    (
      ?auto_679988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_679987 ?auto_679988 ) ( not ( = ?auto_679986 ?auto_679987 ) ) ( not ( = ?auto_679986 ?auto_679988 ) ) ( not ( = ?auto_679987 ?auto_679988 ) ) ( ON ?auto_679986 ?auto_679987 ) ( CLEAR ?auto_679986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_679986 )
      ( MAKE-2PILE ?auto_679986 ?auto_679987 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_679997 - BLOCK
      ?auto_679998 - BLOCK
      ?auto_679999 - BLOCK
    )
    :vars
    (
      ?auto_680000 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_679998 ) ( ON ?auto_679999 ?auto_680000 ) ( CLEAR ?auto_679999 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_679997 ) ( ON ?auto_679998 ?auto_679997 ) ( not ( = ?auto_679997 ?auto_679998 ) ) ( not ( = ?auto_679997 ?auto_679999 ) ) ( not ( = ?auto_679997 ?auto_680000 ) ) ( not ( = ?auto_679998 ?auto_679999 ) ) ( not ( = ?auto_679998 ?auto_680000 ) ) ( not ( = ?auto_679999 ?auto_680000 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_679999 ?auto_680000 )
      ( !STACK ?auto_679999 ?auto_679998 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_680011 - BLOCK
      ?auto_680012 - BLOCK
      ?auto_680013 - BLOCK
    )
    :vars
    (
      ?auto_680014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680013 ?auto_680014 ) ( ON-TABLE ?auto_680011 ) ( not ( = ?auto_680011 ?auto_680012 ) ) ( not ( = ?auto_680011 ?auto_680013 ) ) ( not ( = ?auto_680011 ?auto_680014 ) ) ( not ( = ?auto_680012 ?auto_680013 ) ) ( not ( = ?auto_680012 ?auto_680014 ) ) ( not ( = ?auto_680013 ?auto_680014 ) ) ( CLEAR ?auto_680011 ) ( ON ?auto_680012 ?auto_680013 ) ( CLEAR ?auto_680012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_680011 ?auto_680012 )
      ( MAKE-3PILE ?auto_680011 ?auto_680012 ?auto_680013 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_680025 - BLOCK
      ?auto_680026 - BLOCK
      ?auto_680027 - BLOCK
    )
    :vars
    (
      ?auto_680028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680027 ?auto_680028 ) ( not ( = ?auto_680025 ?auto_680026 ) ) ( not ( = ?auto_680025 ?auto_680027 ) ) ( not ( = ?auto_680025 ?auto_680028 ) ) ( not ( = ?auto_680026 ?auto_680027 ) ) ( not ( = ?auto_680026 ?auto_680028 ) ) ( not ( = ?auto_680027 ?auto_680028 ) ) ( ON ?auto_680026 ?auto_680027 ) ( ON ?auto_680025 ?auto_680026 ) ( CLEAR ?auto_680025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_680025 )
      ( MAKE-3PILE ?auto_680025 ?auto_680026 ?auto_680027 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_680040 - BLOCK
      ?auto_680041 - BLOCK
      ?auto_680042 - BLOCK
      ?auto_680043 - BLOCK
    )
    :vars
    (
      ?auto_680044 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_680042 ) ( ON ?auto_680043 ?auto_680044 ) ( CLEAR ?auto_680043 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_680040 ) ( ON ?auto_680041 ?auto_680040 ) ( ON ?auto_680042 ?auto_680041 ) ( not ( = ?auto_680040 ?auto_680041 ) ) ( not ( = ?auto_680040 ?auto_680042 ) ) ( not ( = ?auto_680040 ?auto_680043 ) ) ( not ( = ?auto_680040 ?auto_680044 ) ) ( not ( = ?auto_680041 ?auto_680042 ) ) ( not ( = ?auto_680041 ?auto_680043 ) ) ( not ( = ?auto_680041 ?auto_680044 ) ) ( not ( = ?auto_680042 ?auto_680043 ) ) ( not ( = ?auto_680042 ?auto_680044 ) ) ( not ( = ?auto_680043 ?auto_680044 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_680043 ?auto_680044 )
      ( !STACK ?auto_680043 ?auto_680042 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_680058 - BLOCK
      ?auto_680059 - BLOCK
      ?auto_680060 - BLOCK
      ?auto_680061 - BLOCK
    )
    :vars
    (
      ?auto_680062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680061 ?auto_680062 ) ( ON-TABLE ?auto_680058 ) ( ON ?auto_680059 ?auto_680058 ) ( not ( = ?auto_680058 ?auto_680059 ) ) ( not ( = ?auto_680058 ?auto_680060 ) ) ( not ( = ?auto_680058 ?auto_680061 ) ) ( not ( = ?auto_680058 ?auto_680062 ) ) ( not ( = ?auto_680059 ?auto_680060 ) ) ( not ( = ?auto_680059 ?auto_680061 ) ) ( not ( = ?auto_680059 ?auto_680062 ) ) ( not ( = ?auto_680060 ?auto_680061 ) ) ( not ( = ?auto_680060 ?auto_680062 ) ) ( not ( = ?auto_680061 ?auto_680062 ) ) ( CLEAR ?auto_680059 ) ( ON ?auto_680060 ?auto_680061 ) ( CLEAR ?auto_680060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_680058 ?auto_680059 ?auto_680060 )
      ( MAKE-4PILE ?auto_680058 ?auto_680059 ?auto_680060 ?auto_680061 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_680076 - BLOCK
      ?auto_680077 - BLOCK
      ?auto_680078 - BLOCK
      ?auto_680079 - BLOCK
    )
    :vars
    (
      ?auto_680080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680079 ?auto_680080 ) ( ON-TABLE ?auto_680076 ) ( not ( = ?auto_680076 ?auto_680077 ) ) ( not ( = ?auto_680076 ?auto_680078 ) ) ( not ( = ?auto_680076 ?auto_680079 ) ) ( not ( = ?auto_680076 ?auto_680080 ) ) ( not ( = ?auto_680077 ?auto_680078 ) ) ( not ( = ?auto_680077 ?auto_680079 ) ) ( not ( = ?auto_680077 ?auto_680080 ) ) ( not ( = ?auto_680078 ?auto_680079 ) ) ( not ( = ?auto_680078 ?auto_680080 ) ) ( not ( = ?auto_680079 ?auto_680080 ) ) ( ON ?auto_680078 ?auto_680079 ) ( CLEAR ?auto_680076 ) ( ON ?auto_680077 ?auto_680078 ) ( CLEAR ?auto_680077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_680076 ?auto_680077 )
      ( MAKE-4PILE ?auto_680076 ?auto_680077 ?auto_680078 ?auto_680079 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_680094 - BLOCK
      ?auto_680095 - BLOCK
      ?auto_680096 - BLOCK
      ?auto_680097 - BLOCK
    )
    :vars
    (
      ?auto_680098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680097 ?auto_680098 ) ( not ( = ?auto_680094 ?auto_680095 ) ) ( not ( = ?auto_680094 ?auto_680096 ) ) ( not ( = ?auto_680094 ?auto_680097 ) ) ( not ( = ?auto_680094 ?auto_680098 ) ) ( not ( = ?auto_680095 ?auto_680096 ) ) ( not ( = ?auto_680095 ?auto_680097 ) ) ( not ( = ?auto_680095 ?auto_680098 ) ) ( not ( = ?auto_680096 ?auto_680097 ) ) ( not ( = ?auto_680096 ?auto_680098 ) ) ( not ( = ?auto_680097 ?auto_680098 ) ) ( ON ?auto_680096 ?auto_680097 ) ( ON ?auto_680095 ?auto_680096 ) ( ON ?auto_680094 ?auto_680095 ) ( CLEAR ?auto_680094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_680094 )
      ( MAKE-4PILE ?auto_680094 ?auto_680095 ?auto_680096 ?auto_680097 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_680113 - BLOCK
      ?auto_680114 - BLOCK
      ?auto_680115 - BLOCK
      ?auto_680116 - BLOCK
      ?auto_680117 - BLOCK
    )
    :vars
    (
      ?auto_680118 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_680116 ) ( ON ?auto_680117 ?auto_680118 ) ( CLEAR ?auto_680117 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_680113 ) ( ON ?auto_680114 ?auto_680113 ) ( ON ?auto_680115 ?auto_680114 ) ( ON ?auto_680116 ?auto_680115 ) ( not ( = ?auto_680113 ?auto_680114 ) ) ( not ( = ?auto_680113 ?auto_680115 ) ) ( not ( = ?auto_680113 ?auto_680116 ) ) ( not ( = ?auto_680113 ?auto_680117 ) ) ( not ( = ?auto_680113 ?auto_680118 ) ) ( not ( = ?auto_680114 ?auto_680115 ) ) ( not ( = ?auto_680114 ?auto_680116 ) ) ( not ( = ?auto_680114 ?auto_680117 ) ) ( not ( = ?auto_680114 ?auto_680118 ) ) ( not ( = ?auto_680115 ?auto_680116 ) ) ( not ( = ?auto_680115 ?auto_680117 ) ) ( not ( = ?auto_680115 ?auto_680118 ) ) ( not ( = ?auto_680116 ?auto_680117 ) ) ( not ( = ?auto_680116 ?auto_680118 ) ) ( not ( = ?auto_680117 ?auto_680118 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_680117 ?auto_680118 )
      ( !STACK ?auto_680117 ?auto_680116 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_680135 - BLOCK
      ?auto_680136 - BLOCK
      ?auto_680137 - BLOCK
      ?auto_680138 - BLOCK
      ?auto_680139 - BLOCK
    )
    :vars
    (
      ?auto_680140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680139 ?auto_680140 ) ( ON-TABLE ?auto_680135 ) ( ON ?auto_680136 ?auto_680135 ) ( ON ?auto_680137 ?auto_680136 ) ( not ( = ?auto_680135 ?auto_680136 ) ) ( not ( = ?auto_680135 ?auto_680137 ) ) ( not ( = ?auto_680135 ?auto_680138 ) ) ( not ( = ?auto_680135 ?auto_680139 ) ) ( not ( = ?auto_680135 ?auto_680140 ) ) ( not ( = ?auto_680136 ?auto_680137 ) ) ( not ( = ?auto_680136 ?auto_680138 ) ) ( not ( = ?auto_680136 ?auto_680139 ) ) ( not ( = ?auto_680136 ?auto_680140 ) ) ( not ( = ?auto_680137 ?auto_680138 ) ) ( not ( = ?auto_680137 ?auto_680139 ) ) ( not ( = ?auto_680137 ?auto_680140 ) ) ( not ( = ?auto_680138 ?auto_680139 ) ) ( not ( = ?auto_680138 ?auto_680140 ) ) ( not ( = ?auto_680139 ?auto_680140 ) ) ( CLEAR ?auto_680137 ) ( ON ?auto_680138 ?auto_680139 ) ( CLEAR ?auto_680138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_680135 ?auto_680136 ?auto_680137 ?auto_680138 )
      ( MAKE-5PILE ?auto_680135 ?auto_680136 ?auto_680137 ?auto_680138 ?auto_680139 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_680157 - BLOCK
      ?auto_680158 - BLOCK
      ?auto_680159 - BLOCK
      ?auto_680160 - BLOCK
      ?auto_680161 - BLOCK
    )
    :vars
    (
      ?auto_680162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680161 ?auto_680162 ) ( ON-TABLE ?auto_680157 ) ( ON ?auto_680158 ?auto_680157 ) ( not ( = ?auto_680157 ?auto_680158 ) ) ( not ( = ?auto_680157 ?auto_680159 ) ) ( not ( = ?auto_680157 ?auto_680160 ) ) ( not ( = ?auto_680157 ?auto_680161 ) ) ( not ( = ?auto_680157 ?auto_680162 ) ) ( not ( = ?auto_680158 ?auto_680159 ) ) ( not ( = ?auto_680158 ?auto_680160 ) ) ( not ( = ?auto_680158 ?auto_680161 ) ) ( not ( = ?auto_680158 ?auto_680162 ) ) ( not ( = ?auto_680159 ?auto_680160 ) ) ( not ( = ?auto_680159 ?auto_680161 ) ) ( not ( = ?auto_680159 ?auto_680162 ) ) ( not ( = ?auto_680160 ?auto_680161 ) ) ( not ( = ?auto_680160 ?auto_680162 ) ) ( not ( = ?auto_680161 ?auto_680162 ) ) ( ON ?auto_680160 ?auto_680161 ) ( CLEAR ?auto_680158 ) ( ON ?auto_680159 ?auto_680160 ) ( CLEAR ?auto_680159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_680157 ?auto_680158 ?auto_680159 )
      ( MAKE-5PILE ?auto_680157 ?auto_680158 ?auto_680159 ?auto_680160 ?auto_680161 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_680179 - BLOCK
      ?auto_680180 - BLOCK
      ?auto_680181 - BLOCK
      ?auto_680182 - BLOCK
      ?auto_680183 - BLOCK
    )
    :vars
    (
      ?auto_680184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680183 ?auto_680184 ) ( ON-TABLE ?auto_680179 ) ( not ( = ?auto_680179 ?auto_680180 ) ) ( not ( = ?auto_680179 ?auto_680181 ) ) ( not ( = ?auto_680179 ?auto_680182 ) ) ( not ( = ?auto_680179 ?auto_680183 ) ) ( not ( = ?auto_680179 ?auto_680184 ) ) ( not ( = ?auto_680180 ?auto_680181 ) ) ( not ( = ?auto_680180 ?auto_680182 ) ) ( not ( = ?auto_680180 ?auto_680183 ) ) ( not ( = ?auto_680180 ?auto_680184 ) ) ( not ( = ?auto_680181 ?auto_680182 ) ) ( not ( = ?auto_680181 ?auto_680183 ) ) ( not ( = ?auto_680181 ?auto_680184 ) ) ( not ( = ?auto_680182 ?auto_680183 ) ) ( not ( = ?auto_680182 ?auto_680184 ) ) ( not ( = ?auto_680183 ?auto_680184 ) ) ( ON ?auto_680182 ?auto_680183 ) ( ON ?auto_680181 ?auto_680182 ) ( CLEAR ?auto_680179 ) ( ON ?auto_680180 ?auto_680181 ) ( CLEAR ?auto_680180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_680179 ?auto_680180 )
      ( MAKE-5PILE ?auto_680179 ?auto_680180 ?auto_680181 ?auto_680182 ?auto_680183 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_680201 - BLOCK
      ?auto_680202 - BLOCK
      ?auto_680203 - BLOCK
      ?auto_680204 - BLOCK
      ?auto_680205 - BLOCK
    )
    :vars
    (
      ?auto_680206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680205 ?auto_680206 ) ( not ( = ?auto_680201 ?auto_680202 ) ) ( not ( = ?auto_680201 ?auto_680203 ) ) ( not ( = ?auto_680201 ?auto_680204 ) ) ( not ( = ?auto_680201 ?auto_680205 ) ) ( not ( = ?auto_680201 ?auto_680206 ) ) ( not ( = ?auto_680202 ?auto_680203 ) ) ( not ( = ?auto_680202 ?auto_680204 ) ) ( not ( = ?auto_680202 ?auto_680205 ) ) ( not ( = ?auto_680202 ?auto_680206 ) ) ( not ( = ?auto_680203 ?auto_680204 ) ) ( not ( = ?auto_680203 ?auto_680205 ) ) ( not ( = ?auto_680203 ?auto_680206 ) ) ( not ( = ?auto_680204 ?auto_680205 ) ) ( not ( = ?auto_680204 ?auto_680206 ) ) ( not ( = ?auto_680205 ?auto_680206 ) ) ( ON ?auto_680204 ?auto_680205 ) ( ON ?auto_680203 ?auto_680204 ) ( ON ?auto_680202 ?auto_680203 ) ( ON ?auto_680201 ?auto_680202 ) ( CLEAR ?auto_680201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_680201 )
      ( MAKE-5PILE ?auto_680201 ?auto_680202 ?auto_680203 ?auto_680204 ?auto_680205 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_680224 - BLOCK
      ?auto_680225 - BLOCK
      ?auto_680226 - BLOCK
      ?auto_680227 - BLOCK
      ?auto_680228 - BLOCK
      ?auto_680229 - BLOCK
    )
    :vars
    (
      ?auto_680230 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_680228 ) ( ON ?auto_680229 ?auto_680230 ) ( CLEAR ?auto_680229 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_680224 ) ( ON ?auto_680225 ?auto_680224 ) ( ON ?auto_680226 ?auto_680225 ) ( ON ?auto_680227 ?auto_680226 ) ( ON ?auto_680228 ?auto_680227 ) ( not ( = ?auto_680224 ?auto_680225 ) ) ( not ( = ?auto_680224 ?auto_680226 ) ) ( not ( = ?auto_680224 ?auto_680227 ) ) ( not ( = ?auto_680224 ?auto_680228 ) ) ( not ( = ?auto_680224 ?auto_680229 ) ) ( not ( = ?auto_680224 ?auto_680230 ) ) ( not ( = ?auto_680225 ?auto_680226 ) ) ( not ( = ?auto_680225 ?auto_680227 ) ) ( not ( = ?auto_680225 ?auto_680228 ) ) ( not ( = ?auto_680225 ?auto_680229 ) ) ( not ( = ?auto_680225 ?auto_680230 ) ) ( not ( = ?auto_680226 ?auto_680227 ) ) ( not ( = ?auto_680226 ?auto_680228 ) ) ( not ( = ?auto_680226 ?auto_680229 ) ) ( not ( = ?auto_680226 ?auto_680230 ) ) ( not ( = ?auto_680227 ?auto_680228 ) ) ( not ( = ?auto_680227 ?auto_680229 ) ) ( not ( = ?auto_680227 ?auto_680230 ) ) ( not ( = ?auto_680228 ?auto_680229 ) ) ( not ( = ?auto_680228 ?auto_680230 ) ) ( not ( = ?auto_680229 ?auto_680230 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_680229 ?auto_680230 )
      ( !STACK ?auto_680229 ?auto_680228 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_680250 - BLOCK
      ?auto_680251 - BLOCK
      ?auto_680252 - BLOCK
      ?auto_680253 - BLOCK
      ?auto_680254 - BLOCK
      ?auto_680255 - BLOCK
    )
    :vars
    (
      ?auto_680256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680255 ?auto_680256 ) ( ON-TABLE ?auto_680250 ) ( ON ?auto_680251 ?auto_680250 ) ( ON ?auto_680252 ?auto_680251 ) ( ON ?auto_680253 ?auto_680252 ) ( not ( = ?auto_680250 ?auto_680251 ) ) ( not ( = ?auto_680250 ?auto_680252 ) ) ( not ( = ?auto_680250 ?auto_680253 ) ) ( not ( = ?auto_680250 ?auto_680254 ) ) ( not ( = ?auto_680250 ?auto_680255 ) ) ( not ( = ?auto_680250 ?auto_680256 ) ) ( not ( = ?auto_680251 ?auto_680252 ) ) ( not ( = ?auto_680251 ?auto_680253 ) ) ( not ( = ?auto_680251 ?auto_680254 ) ) ( not ( = ?auto_680251 ?auto_680255 ) ) ( not ( = ?auto_680251 ?auto_680256 ) ) ( not ( = ?auto_680252 ?auto_680253 ) ) ( not ( = ?auto_680252 ?auto_680254 ) ) ( not ( = ?auto_680252 ?auto_680255 ) ) ( not ( = ?auto_680252 ?auto_680256 ) ) ( not ( = ?auto_680253 ?auto_680254 ) ) ( not ( = ?auto_680253 ?auto_680255 ) ) ( not ( = ?auto_680253 ?auto_680256 ) ) ( not ( = ?auto_680254 ?auto_680255 ) ) ( not ( = ?auto_680254 ?auto_680256 ) ) ( not ( = ?auto_680255 ?auto_680256 ) ) ( CLEAR ?auto_680253 ) ( ON ?auto_680254 ?auto_680255 ) ( CLEAR ?auto_680254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_680250 ?auto_680251 ?auto_680252 ?auto_680253 ?auto_680254 )
      ( MAKE-6PILE ?auto_680250 ?auto_680251 ?auto_680252 ?auto_680253 ?auto_680254 ?auto_680255 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_680276 - BLOCK
      ?auto_680277 - BLOCK
      ?auto_680278 - BLOCK
      ?auto_680279 - BLOCK
      ?auto_680280 - BLOCK
      ?auto_680281 - BLOCK
    )
    :vars
    (
      ?auto_680282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680281 ?auto_680282 ) ( ON-TABLE ?auto_680276 ) ( ON ?auto_680277 ?auto_680276 ) ( ON ?auto_680278 ?auto_680277 ) ( not ( = ?auto_680276 ?auto_680277 ) ) ( not ( = ?auto_680276 ?auto_680278 ) ) ( not ( = ?auto_680276 ?auto_680279 ) ) ( not ( = ?auto_680276 ?auto_680280 ) ) ( not ( = ?auto_680276 ?auto_680281 ) ) ( not ( = ?auto_680276 ?auto_680282 ) ) ( not ( = ?auto_680277 ?auto_680278 ) ) ( not ( = ?auto_680277 ?auto_680279 ) ) ( not ( = ?auto_680277 ?auto_680280 ) ) ( not ( = ?auto_680277 ?auto_680281 ) ) ( not ( = ?auto_680277 ?auto_680282 ) ) ( not ( = ?auto_680278 ?auto_680279 ) ) ( not ( = ?auto_680278 ?auto_680280 ) ) ( not ( = ?auto_680278 ?auto_680281 ) ) ( not ( = ?auto_680278 ?auto_680282 ) ) ( not ( = ?auto_680279 ?auto_680280 ) ) ( not ( = ?auto_680279 ?auto_680281 ) ) ( not ( = ?auto_680279 ?auto_680282 ) ) ( not ( = ?auto_680280 ?auto_680281 ) ) ( not ( = ?auto_680280 ?auto_680282 ) ) ( not ( = ?auto_680281 ?auto_680282 ) ) ( ON ?auto_680280 ?auto_680281 ) ( CLEAR ?auto_680278 ) ( ON ?auto_680279 ?auto_680280 ) ( CLEAR ?auto_680279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_680276 ?auto_680277 ?auto_680278 ?auto_680279 )
      ( MAKE-6PILE ?auto_680276 ?auto_680277 ?auto_680278 ?auto_680279 ?auto_680280 ?auto_680281 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_680302 - BLOCK
      ?auto_680303 - BLOCK
      ?auto_680304 - BLOCK
      ?auto_680305 - BLOCK
      ?auto_680306 - BLOCK
      ?auto_680307 - BLOCK
    )
    :vars
    (
      ?auto_680308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680307 ?auto_680308 ) ( ON-TABLE ?auto_680302 ) ( ON ?auto_680303 ?auto_680302 ) ( not ( = ?auto_680302 ?auto_680303 ) ) ( not ( = ?auto_680302 ?auto_680304 ) ) ( not ( = ?auto_680302 ?auto_680305 ) ) ( not ( = ?auto_680302 ?auto_680306 ) ) ( not ( = ?auto_680302 ?auto_680307 ) ) ( not ( = ?auto_680302 ?auto_680308 ) ) ( not ( = ?auto_680303 ?auto_680304 ) ) ( not ( = ?auto_680303 ?auto_680305 ) ) ( not ( = ?auto_680303 ?auto_680306 ) ) ( not ( = ?auto_680303 ?auto_680307 ) ) ( not ( = ?auto_680303 ?auto_680308 ) ) ( not ( = ?auto_680304 ?auto_680305 ) ) ( not ( = ?auto_680304 ?auto_680306 ) ) ( not ( = ?auto_680304 ?auto_680307 ) ) ( not ( = ?auto_680304 ?auto_680308 ) ) ( not ( = ?auto_680305 ?auto_680306 ) ) ( not ( = ?auto_680305 ?auto_680307 ) ) ( not ( = ?auto_680305 ?auto_680308 ) ) ( not ( = ?auto_680306 ?auto_680307 ) ) ( not ( = ?auto_680306 ?auto_680308 ) ) ( not ( = ?auto_680307 ?auto_680308 ) ) ( ON ?auto_680306 ?auto_680307 ) ( ON ?auto_680305 ?auto_680306 ) ( CLEAR ?auto_680303 ) ( ON ?auto_680304 ?auto_680305 ) ( CLEAR ?auto_680304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_680302 ?auto_680303 ?auto_680304 )
      ( MAKE-6PILE ?auto_680302 ?auto_680303 ?auto_680304 ?auto_680305 ?auto_680306 ?auto_680307 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_680328 - BLOCK
      ?auto_680329 - BLOCK
      ?auto_680330 - BLOCK
      ?auto_680331 - BLOCK
      ?auto_680332 - BLOCK
      ?auto_680333 - BLOCK
    )
    :vars
    (
      ?auto_680334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680333 ?auto_680334 ) ( ON-TABLE ?auto_680328 ) ( not ( = ?auto_680328 ?auto_680329 ) ) ( not ( = ?auto_680328 ?auto_680330 ) ) ( not ( = ?auto_680328 ?auto_680331 ) ) ( not ( = ?auto_680328 ?auto_680332 ) ) ( not ( = ?auto_680328 ?auto_680333 ) ) ( not ( = ?auto_680328 ?auto_680334 ) ) ( not ( = ?auto_680329 ?auto_680330 ) ) ( not ( = ?auto_680329 ?auto_680331 ) ) ( not ( = ?auto_680329 ?auto_680332 ) ) ( not ( = ?auto_680329 ?auto_680333 ) ) ( not ( = ?auto_680329 ?auto_680334 ) ) ( not ( = ?auto_680330 ?auto_680331 ) ) ( not ( = ?auto_680330 ?auto_680332 ) ) ( not ( = ?auto_680330 ?auto_680333 ) ) ( not ( = ?auto_680330 ?auto_680334 ) ) ( not ( = ?auto_680331 ?auto_680332 ) ) ( not ( = ?auto_680331 ?auto_680333 ) ) ( not ( = ?auto_680331 ?auto_680334 ) ) ( not ( = ?auto_680332 ?auto_680333 ) ) ( not ( = ?auto_680332 ?auto_680334 ) ) ( not ( = ?auto_680333 ?auto_680334 ) ) ( ON ?auto_680332 ?auto_680333 ) ( ON ?auto_680331 ?auto_680332 ) ( ON ?auto_680330 ?auto_680331 ) ( CLEAR ?auto_680328 ) ( ON ?auto_680329 ?auto_680330 ) ( CLEAR ?auto_680329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_680328 ?auto_680329 )
      ( MAKE-6PILE ?auto_680328 ?auto_680329 ?auto_680330 ?auto_680331 ?auto_680332 ?auto_680333 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_680354 - BLOCK
      ?auto_680355 - BLOCK
      ?auto_680356 - BLOCK
      ?auto_680357 - BLOCK
      ?auto_680358 - BLOCK
      ?auto_680359 - BLOCK
    )
    :vars
    (
      ?auto_680360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680359 ?auto_680360 ) ( not ( = ?auto_680354 ?auto_680355 ) ) ( not ( = ?auto_680354 ?auto_680356 ) ) ( not ( = ?auto_680354 ?auto_680357 ) ) ( not ( = ?auto_680354 ?auto_680358 ) ) ( not ( = ?auto_680354 ?auto_680359 ) ) ( not ( = ?auto_680354 ?auto_680360 ) ) ( not ( = ?auto_680355 ?auto_680356 ) ) ( not ( = ?auto_680355 ?auto_680357 ) ) ( not ( = ?auto_680355 ?auto_680358 ) ) ( not ( = ?auto_680355 ?auto_680359 ) ) ( not ( = ?auto_680355 ?auto_680360 ) ) ( not ( = ?auto_680356 ?auto_680357 ) ) ( not ( = ?auto_680356 ?auto_680358 ) ) ( not ( = ?auto_680356 ?auto_680359 ) ) ( not ( = ?auto_680356 ?auto_680360 ) ) ( not ( = ?auto_680357 ?auto_680358 ) ) ( not ( = ?auto_680357 ?auto_680359 ) ) ( not ( = ?auto_680357 ?auto_680360 ) ) ( not ( = ?auto_680358 ?auto_680359 ) ) ( not ( = ?auto_680358 ?auto_680360 ) ) ( not ( = ?auto_680359 ?auto_680360 ) ) ( ON ?auto_680358 ?auto_680359 ) ( ON ?auto_680357 ?auto_680358 ) ( ON ?auto_680356 ?auto_680357 ) ( ON ?auto_680355 ?auto_680356 ) ( ON ?auto_680354 ?auto_680355 ) ( CLEAR ?auto_680354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_680354 )
      ( MAKE-6PILE ?auto_680354 ?auto_680355 ?auto_680356 ?auto_680357 ?auto_680358 ?auto_680359 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_680381 - BLOCK
      ?auto_680382 - BLOCK
      ?auto_680383 - BLOCK
      ?auto_680384 - BLOCK
      ?auto_680385 - BLOCK
      ?auto_680386 - BLOCK
      ?auto_680387 - BLOCK
    )
    :vars
    (
      ?auto_680388 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_680386 ) ( ON ?auto_680387 ?auto_680388 ) ( CLEAR ?auto_680387 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_680381 ) ( ON ?auto_680382 ?auto_680381 ) ( ON ?auto_680383 ?auto_680382 ) ( ON ?auto_680384 ?auto_680383 ) ( ON ?auto_680385 ?auto_680384 ) ( ON ?auto_680386 ?auto_680385 ) ( not ( = ?auto_680381 ?auto_680382 ) ) ( not ( = ?auto_680381 ?auto_680383 ) ) ( not ( = ?auto_680381 ?auto_680384 ) ) ( not ( = ?auto_680381 ?auto_680385 ) ) ( not ( = ?auto_680381 ?auto_680386 ) ) ( not ( = ?auto_680381 ?auto_680387 ) ) ( not ( = ?auto_680381 ?auto_680388 ) ) ( not ( = ?auto_680382 ?auto_680383 ) ) ( not ( = ?auto_680382 ?auto_680384 ) ) ( not ( = ?auto_680382 ?auto_680385 ) ) ( not ( = ?auto_680382 ?auto_680386 ) ) ( not ( = ?auto_680382 ?auto_680387 ) ) ( not ( = ?auto_680382 ?auto_680388 ) ) ( not ( = ?auto_680383 ?auto_680384 ) ) ( not ( = ?auto_680383 ?auto_680385 ) ) ( not ( = ?auto_680383 ?auto_680386 ) ) ( not ( = ?auto_680383 ?auto_680387 ) ) ( not ( = ?auto_680383 ?auto_680388 ) ) ( not ( = ?auto_680384 ?auto_680385 ) ) ( not ( = ?auto_680384 ?auto_680386 ) ) ( not ( = ?auto_680384 ?auto_680387 ) ) ( not ( = ?auto_680384 ?auto_680388 ) ) ( not ( = ?auto_680385 ?auto_680386 ) ) ( not ( = ?auto_680385 ?auto_680387 ) ) ( not ( = ?auto_680385 ?auto_680388 ) ) ( not ( = ?auto_680386 ?auto_680387 ) ) ( not ( = ?auto_680386 ?auto_680388 ) ) ( not ( = ?auto_680387 ?auto_680388 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_680387 ?auto_680388 )
      ( !STACK ?auto_680387 ?auto_680386 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_680411 - BLOCK
      ?auto_680412 - BLOCK
      ?auto_680413 - BLOCK
      ?auto_680414 - BLOCK
      ?auto_680415 - BLOCK
      ?auto_680416 - BLOCK
      ?auto_680417 - BLOCK
    )
    :vars
    (
      ?auto_680418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680417 ?auto_680418 ) ( ON-TABLE ?auto_680411 ) ( ON ?auto_680412 ?auto_680411 ) ( ON ?auto_680413 ?auto_680412 ) ( ON ?auto_680414 ?auto_680413 ) ( ON ?auto_680415 ?auto_680414 ) ( not ( = ?auto_680411 ?auto_680412 ) ) ( not ( = ?auto_680411 ?auto_680413 ) ) ( not ( = ?auto_680411 ?auto_680414 ) ) ( not ( = ?auto_680411 ?auto_680415 ) ) ( not ( = ?auto_680411 ?auto_680416 ) ) ( not ( = ?auto_680411 ?auto_680417 ) ) ( not ( = ?auto_680411 ?auto_680418 ) ) ( not ( = ?auto_680412 ?auto_680413 ) ) ( not ( = ?auto_680412 ?auto_680414 ) ) ( not ( = ?auto_680412 ?auto_680415 ) ) ( not ( = ?auto_680412 ?auto_680416 ) ) ( not ( = ?auto_680412 ?auto_680417 ) ) ( not ( = ?auto_680412 ?auto_680418 ) ) ( not ( = ?auto_680413 ?auto_680414 ) ) ( not ( = ?auto_680413 ?auto_680415 ) ) ( not ( = ?auto_680413 ?auto_680416 ) ) ( not ( = ?auto_680413 ?auto_680417 ) ) ( not ( = ?auto_680413 ?auto_680418 ) ) ( not ( = ?auto_680414 ?auto_680415 ) ) ( not ( = ?auto_680414 ?auto_680416 ) ) ( not ( = ?auto_680414 ?auto_680417 ) ) ( not ( = ?auto_680414 ?auto_680418 ) ) ( not ( = ?auto_680415 ?auto_680416 ) ) ( not ( = ?auto_680415 ?auto_680417 ) ) ( not ( = ?auto_680415 ?auto_680418 ) ) ( not ( = ?auto_680416 ?auto_680417 ) ) ( not ( = ?auto_680416 ?auto_680418 ) ) ( not ( = ?auto_680417 ?auto_680418 ) ) ( CLEAR ?auto_680415 ) ( ON ?auto_680416 ?auto_680417 ) ( CLEAR ?auto_680416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_680411 ?auto_680412 ?auto_680413 ?auto_680414 ?auto_680415 ?auto_680416 )
      ( MAKE-7PILE ?auto_680411 ?auto_680412 ?auto_680413 ?auto_680414 ?auto_680415 ?auto_680416 ?auto_680417 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_680441 - BLOCK
      ?auto_680442 - BLOCK
      ?auto_680443 - BLOCK
      ?auto_680444 - BLOCK
      ?auto_680445 - BLOCK
      ?auto_680446 - BLOCK
      ?auto_680447 - BLOCK
    )
    :vars
    (
      ?auto_680448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680447 ?auto_680448 ) ( ON-TABLE ?auto_680441 ) ( ON ?auto_680442 ?auto_680441 ) ( ON ?auto_680443 ?auto_680442 ) ( ON ?auto_680444 ?auto_680443 ) ( not ( = ?auto_680441 ?auto_680442 ) ) ( not ( = ?auto_680441 ?auto_680443 ) ) ( not ( = ?auto_680441 ?auto_680444 ) ) ( not ( = ?auto_680441 ?auto_680445 ) ) ( not ( = ?auto_680441 ?auto_680446 ) ) ( not ( = ?auto_680441 ?auto_680447 ) ) ( not ( = ?auto_680441 ?auto_680448 ) ) ( not ( = ?auto_680442 ?auto_680443 ) ) ( not ( = ?auto_680442 ?auto_680444 ) ) ( not ( = ?auto_680442 ?auto_680445 ) ) ( not ( = ?auto_680442 ?auto_680446 ) ) ( not ( = ?auto_680442 ?auto_680447 ) ) ( not ( = ?auto_680442 ?auto_680448 ) ) ( not ( = ?auto_680443 ?auto_680444 ) ) ( not ( = ?auto_680443 ?auto_680445 ) ) ( not ( = ?auto_680443 ?auto_680446 ) ) ( not ( = ?auto_680443 ?auto_680447 ) ) ( not ( = ?auto_680443 ?auto_680448 ) ) ( not ( = ?auto_680444 ?auto_680445 ) ) ( not ( = ?auto_680444 ?auto_680446 ) ) ( not ( = ?auto_680444 ?auto_680447 ) ) ( not ( = ?auto_680444 ?auto_680448 ) ) ( not ( = ?auto_680445 ?auto_680446 ) ) ( not ( = ?auto_680445 ?auto_680447 ) ) ( not ( = ?auto_680445 ?auto_680448 ) ) ( not ( = ?auto_680446 ?auto_680447 ) ) ( not ( = ?auto_680446 ?auto_680448 ) ) ( not ( = ?auto_680447 ?auto_680448 ) ) ( ON ?auto_680446 ?auto_680447 ) ( CLEAR ?auto_680444 ) ( ON ?auto_680445 ?auto_680446 ) ( CLEAR ?auto_680445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_680441 ?auto_680442 ?auto_680443 ?auto_680444 ?auto_680445 )
      ( MAKE-7PILE ?auto_680441 ?auto_680442 ?auto_680443 ?auto_680444 ?auto_680445 ?auto_680446 ?auto_680447 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_680471 - BLOCK
      ?auto_680472 - BLOCK
      ?auto_680473 - BLOCK
      ?auto_680474 - BLOCK
      ?auto_680475 - BLOCK
      ?auto_680476 - BLOCK
      ?auto_680477 - BLOCK
    )
    :vars
    (
      ?auto_680478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680477 ?auto_680478 ) ( ON-TABLE ?auto_680471 ) ( ON ?auto_680472 ?auto_680471 ) ( ON ?auto_680473 ?auto_680472 ) ( not ( = ?auto_680471 ?auto_680472 ) ) ( not ( = ?auto_680471 ?auto_680473 ) ) ( not ( = ?auto_680471 ?auto_680474 ) ) ( not ( = ?auto_680471 ?auto_680475 ) ) ( not ( = ?auto_680471 ?auto_680476 ) ) ( not ( = ?auto_680471 ?auto_680477 ) ) ( not ( = ?auto_680471 ?auto_680478 ) ) ( not ( = ?auto_680472 ?auto_680473 ) ) ( not ( = ?auto_680472 ?auto_680474 ) ) ( not ( = ?auto_680472 ?auto_680475 ) ) ( not ( = ?auto_680472 ?auto_680476 ) ) ( not ( = ?auto_680472 ?auto_680477 ) ) ( not ( = ?auto_680472 ?auto_680478 ) ) ( not ( = ?auto_680473 ?auto_680474 ) ) ( not ( = ?auto_680473 ?auto_680475 ) ) ( not ( = ?auto_680473 ?auto_680476 ) ) ( not ( = ?auto_680473 ?auto_680477 ) ) ( not ( = ?auto_680473 ?auto_680478 ) ) ( not ( = ?auto_680474 ?auto_680475 ) ) ( not ( = ?auto_680474 ?auto_680476 ) ) ( not ( = ?auto_680474 ?auto_680477 ) ) ( not ( = ?auto_680474 ?auto_680478 ) ) ( not ( = ?auto_680475 ?auto_680476 ) ) ( not ( = ?auto_680475 ?auto_680477 ) ) ( not ( = ?auto_680475 ?auto_680478 ) ) ( not ( = ?auto_680476 ?auto_680477 ) ) ( not ( = ?auto_680476 ?auto_680478 ) ) ( not ( = ?auto_680477 ?auto_680478 ) ) ( ON ?auto_680476 ?auto_680477 ) ( ON ?auto_680475 ?auto_680476 ) ( CLEAR ?auto_680473 ) ( ON ?auto_680474 ?auto_680475 ) ( CLEAR ?auto_680474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_680471 ?auto_680472 ?auto_680473 ?auto_680474 )
      ( MAKE-7PILE ?auto_680471 ?auto_680472 ?auto_680473 ?auto_680474 ?auto_680475 ?auto_680476 ?auto_680477 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_680501 - BLOCK
      ?auto_680502 - BLOCK
      ?auto_680503 - BLOCK
      ?auto_680504 - BLOCK
      ?auto_680505 - BLOCK
      ?auto_680506 - BLOCK
      ?auto_680507 - BLOCK
    )
    :vars
    (
      ?auto_680508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680507 ?auto_680508 ) ( ON-TABLE ?auto_680501 ) ( ON ?auto_680502 ?auto_680501 ) ( not ( = ?auto_680501 ?auto_680502 ) ) ( not ( = ?auto_680501 ?auto_680503 ) ) ( not ( = ?auto_680501 ?auto_680504 ) ) ( not ( = ?auto_680501 ?auto_680505 ) ) ( not ( = ?auto_680501 ?auto_680506 ) ) ( not ( = ?auto_680501 ?auto_680507 ) ) ( not ( = ?auto_680501 ?auto_680508 ) ) ( not ( = ?auto_680502 ?auto_680503 ) ) ( not ( = ?auto_680502 ?auto_680504 ) ) ( not ( = ?auto_680502 ?auto_680505 ) ) ( not ( = ?auto_680502 ?auto_680506 ) ) ( not ( = ?auto_680502 ?auto_680507 ) ) ( not ( = ?auto_680502 ?auto_680508 ) ) ( not ( = ?auto_680503 ?auto_680504 ) ) ( not ( = ?auto_680503 ?auto_680505 ) ) ( not ( = ?auto_680503 ?auto_680506 ) ) ( not ( = ?auto_680503 ?auto_680507 ) ) ( not ( = ?auto_680503 ?auto_680508 ) ) ( not ( = ?auto_680504 ?auto_680505 ) ) ( not ( = ?auto_680504 ?auto_680506 ) ) ( not ( = ?auto_680504 ?auto_680507 ) ) ( not ( = ?auto_680504 ?auto_680508 ) ) ( not ( = ?auto_680505 ?auto_680506 ) ) ( not ( = ?auto_680505 ?auto_680507 ) ) ( not ( = ?auto_680505 ?auto_680508 ) ) ( not ( = ?auto_680506 ?auto_680507 ) ) ( not ( = ?auto_680506 ?auto_680508 ) ) ( not ( = ?auto_680507 ?auto_680508 ) ) ( ON ?auto_680506 ?auto_680507 ) ( ON ?auto_680505 ?auto_680506 ) ( ON ?auto_680504 ?auto_680505 ) ( CLEAR ?auto_680502 ) ( ON ?auto_680503 ?auto_680504 ) ( CLEAR ?auto_680503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_680501 ?auto_680502 ?auto_680503 )
      ( MAKE-7PILE ?auto_680501 ?auto_680502 ?auto_680503 ?auto_680504 ?auto_680505 ?auto_680506 ?auto_680507 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_680531 - BLOCK
      ?auto_680532 - BLOCK
      ?auto_680533 - BLOCK
      ?auto_680534 - BLOCK
      ?auto_680535 - BLOCK
      ?auto_680536 - BLOCK
      ?auto_680537 - BLOCK
    )
    :vars
    (
      ?auto_680538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680537 ?auto_680538 ) ( ON-TABLE ?auto_680531 ) ( not ( = ?auto_680531 ?auto_680532 ) ) ( not ( = ?auto_680531 ?auto_680533 ) ) ( not ( = ?auto_680531 ?auto_680534 ) ) ( not ( = ?auto_680531 ?auto_680535 ) ) ( not ( = ?auto_680531 ?auto_680536 ) ) ( not ( = ?auto_680531 ?auto_680537 ) ) ( not ( = ?auto_680531 ?auto_680538 ) ) ( not ( = ?auto_680532 ?auto_680533 ) ) ( not ( = ?auto_680532 ?auto_680534 ) ) ( not ( = ?auto_680532 ?auto_680535 ) ) ( not ( = ?auto_680532 ?auto_680536 ) ) ( not ( = ?auto_680532 ?auto_680537 ) ) ( not ( = ?auto_680532 ?auto_680538 ) ) ( not ( = ?auto_680533 ?auto_680534 ) ) ( not ( = ?auto_680533 ?auto_680535 ) ) ( not ( = ?auto_680533 ?auto_680536 ) ) ( not ( = ?auto_680533 ?auto_680537 ) ) ( not ( = ?auto_680533 ?auto_680538 ) ) ( not ( = ?auto_680534 ?auto_680535 ) ) ( not ( = ?auto_680534 ?auto_680536 ) ) ( not ( = ?auto_680534 ?auto_680537 ) ) ( not ( = ?auto_680534 ?auto_680538 ) ) ( not ( = ?auto_680535 ?auto_680536 ) ) ( not ( = ?auto_680535 ?auto_680537 ) ) ( not ( = ?auto_680535 ?auto_680538 ) ) ( not ( = ?auto_680536 ?auto_680537 ) ) ( not ( = ?auto_680536 ?auto_680538 ) ) ( not ( = ?auto_680537 ?auto_680538 ) ) ( ON ?auto_680536 ?auto_680537 ) ( ON ?auto_680535 ?auto_680536 ) ( ON ?auto_680534 ?auto_680535 ) ( ON ?auto_680533 ?auto_680534 ) ( CLEAR ?auto_680531 ) ( ON ?auto_680532 ?auto_680533 ) ( CLEAR ?auto_680532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_680531 ?auto_680532 )
      ( MAKE-7PILE ?auto_680531 ?auto_680532 ?auto_680533 ?auto_680534 ?auto_680535 ?auto_680536 ?auto_680537 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_680561 - BLOCK
      ?auto_680562 - BLOCK
      ?auto_680563 - BLOCK
      ?auto_680564 - BLOCK
      ?auto_680565 - BLOCK
      ?auto_680566 - BLOCK
      ?auto_680567 - BLOCK
    )
    :vars
    (
      ?auto_680568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680567 ?auto_680568 ) ( not ( = ?auto_680561 ?auto_680562 ) ) ( not ( = ?auto_680561 ?auto_680563 ) ) ( not ( = ?auto_680561 ?auto_680564 ) ) ( not ( = ?auto_680561 ?auto_680565 ) ) ( not ( = ?auto_680561 ?auto_680566 ) ) ( not ( = ?auto_680561 ?auto_680567 ) ) ( not ( = ?auto_680561 ?auto_680568 ) ) ( not ( = ?auto_680562 ?auto_680563 ) ) ( not ( = ?auto_680562 ?auto_680564 ) ) ( not ( = ?auto_680562 ?auto_680565 ) ) ( not ( = ?auto_680562 ?auto_680566 ) ) ( not ( = ?auto_680562 ?auto_680567 ) ) ( not ( = ?auto_680562 ?auto_680568 ) ) ( not ( = ?auto_680563 ?auto_680564 ) ) ( not ( = ?auto_680563 ?auto_680565 ) ) ( not ( = ?auto_680563 ?auto_680566 ) ) ( not ( = ?auto_680563 ?auto_680567 ) ) ( not ( = ?auto_680563 ?auto_680568 ) ) ( not ( = ?auto_680564 ?auto_680565 ) ) ( not ( = ?auto_680564 ?auto_680566 ) ) ( not ( = ?auto_680564 ?auto_680567 ) ) ( not ( = ?auto_680564 ?auto_680568 ) ) ( not ( = ?auto_680565 ?auto_680566 ) ) ( not ( = ?auto_680565 ?auto_680567 ) ) ( not ( = ?auto_680565 ?auto_680568 ) ) ( not ( = ?auto_680566 ?auto_680567 ) ) ( not ( = ?auto_680566 ?auto_680568 ) ) ( not ( = ?auto_680567 ?auto_680568 ) ) ( ON ?auto_680566 ?auto_680567 ) ( ON ?auto_680565 ?auto_680566 ) ( ON ?auto_680564 ?auto_680565 ) ( ON ?auto_680563 ?auto_680564 ) ( ON ?auto_680562 ?auto_680563 ) ( ON ?auto_680561 ?auto_680562 ) ( CLEAR ?auto_680561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_680561 )
      ( MAKE-7PILE ?auto_680561 ?auto_680562 ?auto_680563 ?auto_680564 ?auto_680565 ?auto_680566 ?auto_680567 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_680592 - BLOCK
      ?auto_680593 - BLOCK
      ?auto_680594 - BLOCK
      ?auto_680595 - BLOCK
      ?auto_680596 - BLOCK
      ?auto_680597 - BLOCK
      ?auto_680598 - BLOCK
      ?auto_680599 - BLOCK
    )
    :vars
    (
      ?auto_680600 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_680598 ) ( ON ?auto_680599 ?auto_680600 ) ( CLEAR ?auto_680599 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_680592 ) ( ON ?auto_680593 ?auto_680592 ) ( ON ?auto_680594 ?auto_680593 ) ( ON ?auto_680595 ?auto_680594 ) ( ON ?auto_680596 ?auto_680595 ) ( ON ?auto_680597 ?auto_680596 ) ( ON ?auto_680598 ?auto_680597 ) ( not ( = ?auto_680592 ?auto_680593 ) ) ( not ( = ?auto_680592 ?auto_680594 ) ) ( not ( = ?auto_680592 ?auto_680595 ) ) ( not ( = ?auto_680592 ?auto_680596 ) ) ( not ( = ?auto_680592 ?auto_680597 ) ) ( not ( = ?auto_680592 ?auto_680598 ) ) ( not ( = ?auto_680592 ?auto_680599 ) ) ( not ( = ?auto_680592 ?auto_680600 ) ) ( not ( = ?auto_680593 ?auto_680594 ) ) ( not ( = ?auto_680593 ?auto_680595 ) ) ( not ( = ?auto_680593 ?auto_680596 ) ) ( not ( = ?auto_680593 ?auto_680597 ) ) ( not ( = ?auto_680593 ?auto_680598 ) ) ( not ( = ?auto_680593 ?auto_680599 ) ) ( not ( = ?auto_680593 ?auto_680600 ) ) ( not ( = ?auto_680594 ?auto_680595 ) ) ( not ( = ?auto_680594 ?auto_680596 ) ) ( not ( = ?auto_680594 ?auto_680597 ) ) ( not ( = ?auto_680594 ?auto_680598 ) ) ( not ( = ?auto_680594 ?auto_680599 ) ) ( not ( = ?auto_680594 ?auto_680600 ) ) ( not ( = ?auto_680595 ?auto_680596 ) ) ( not ( = ?auto_680595 ?auto_680597 ) ) ( not ( = ?auto_680595 ?auto_680598 ) ) ( not ( = ?auto_680595 ?auto_680599 ) ) ( not ( = ?auto_680595 ?auto_680600 ) ) ( not ( = ?auto_680596 ?auto_680597 ) ) ( not ( = ?auto_680596 ?auto_680598 ) ) ( not ( = ?auto_680596 ?auto_680599 ) ) ( not ( = ?auto_680596 ?auto_680600 ) ) ( not ( = ?auto_680597 ?auto_680598 ) ) ( not ( = ?auto_680597 ?auto_680599 ) ) ( not ( = ?auto_680597 ?auto_680600 ) ) ( not ( = ?auto_680598 ?auto_680599 ) ) ( not ( = ?auto_680598 ?auto_680600 ) ) ( not ( = ?auto_680599 ?auto_680600 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_680599 ?auto_680600 )
      ( !STACK ?auto_680599 ?auto_680598 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_680626 - BLOCK
      ?auto_680627 - BLOCK
      ?auto_680628 - BLOCK
      ?auto_680629 - BLOCK
      ?auto_680630 - BLOCK
      ?auto_680631 - BLOCK
      ?auto_680632 - BLOCK
      ?auto_680633 - BLOCK
    )
    :vars
    (
      ?auto_680634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680633 ?auto_680634 ) ( ON-TABLE ?auto_680626 ) ( ON ?auto_680627 ?auto_680626 ) ( ON ?auto_680628 ?auto_680627 ) ( ON ?auto_680629 ?auto_680628 ) ( ON ?auto_680630 ?auto_680629 ) ( ON ?auto_680631 ?auto_680630 ) ( not ( = ?auto_680626 ?auto_680627 ) ) ( not ( = ?auto_680626 ?auto_680628 ) ) ( not ( = ?auto_680626 ?auto_680629 ) ) ( not ( = ?auto_680626 ?auto_680630 ) ) ( not ( = ?auto_680626 ?auto_680631 ) ) ( not ( = ?auto_680626 ?auto_680632 ) ) ( not ( = ?auto_680626 ?auto_680633 ) ) ( not ( = ?auto_680626 ?auto_680634 ) ) ( not ( = ?auto_680627 ?auto_680628 ) ) ( not ( = ?auto_680627 ?auto_680629 ) ) ( not ( = ?auto_680627 ?auto_680630 ) ) ( not ( = ?auto_680627 ?auto_680631 ) ) ( not ( = ?auto_680627 ?auto_680632 ) ) ( not ( = ?auto_680627 ?auto_680633 ) ) ( not ( = ?auto_680627 ?auto_680634 ) ) ( not ( = ?auto_680628 ?auto_680629 ) ) ( not ( = ?auto_680628 ?auto_680630 ) ) ( not ( = ?auto_680628 ?auto_680631 ) ) ( not ( = ?auto_680628 ?auto_680632 ) ) ( not ( = ?auto_680628 ?auto_680633 ) ) ( not ( = ?auto_680628 ?auto_680634 ) ) ( not ( = ?auto_680629 ?auto_680630 ) ) ( not ( = ?auto_680629 ?auto_680631 ) ) ( not ( = ?auto_680629 ?auto_680632 ) ) ( not ( = ?auto_680629 ?auto_680633 ) ) ( not ( = ?auto_680629 ?auto_680634 ) ) ( not ( = ?auto_680630 ?auto_680631 ) ) ( not ( = ?auto_680630 ?auto_680632 ) ) ( not ( = ?auto_680630 ?auto_680633 ) ) ( not ( = ?auto_680630 ?auto_680634 ) ) ( not ( = ?auto_680631 ?auto_680632 ) ) ( not ( = ?auto_680631 ?auto_680633 ) ) ( not ( = ?auto_680631 ?auto_680634 ) ) ( not ( = ?auto_680632 ?auto_680633 ) ) ( not ( = ?auto_680632 ?auto_680634 ) ) ( not ( = ?auto_680633 ?auto_680634 ) ) ( CLEAR ?auto_680631 ) ( ON ?auto_680632 ?auto_680633 ) ( CLEAR ?auto_680632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_680626 ?auto_680627 ?auto_680628 ?auto_680629 ?auto_680630 ?auto_680631 ?auto_680632 )
      ( MAKE-8PILE ?auto_680626 ?auto_680627 ?auto_680628 ?auto_680629 ?auto_680630 ?auto_680631 ?auto_680632 ?auto_680633 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_680660 - BLOCK
      ?auto_680661 - BLOCK
      ?auto_680662 - BLOCK
      ?auto_680663 - BLOCK
      ?auto_680664 - BLOCK
      ?auto_680665 - BLOCK
      ?auto_680666 - BLOCK
      ?auto_680667 - BLOCK
    )
    :vars
    (
      ?auto_680668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680667 ?auto_680668 ) ( ON-TABLE ?auto_680660 ) ( ON ?auto_680661 ?auto_680660 ) ( ON ?auto_680662 ?auto_680661 ) ( ON ?auto_680663 ?auto_680662 ) ( ON ?auto_680664 ?auto_680663 ) ( not ( = ?auto_680660 ?auto_680661 ) ) ( not ( = ?auto_680660 ?auto_680662 ) ) ( not ( = ?auto_680660 ?auto_680663 ) ) ( not ( = ?auto_680660 ?auto_680664 ) ) ( not ( = ?auto_680660 ?auto_680665 ) ) ( not ( = ?auto_680660 ?auto_680666 ) ) ( not ( = ?auto_680660 ?auto_680667 ) ) ( not ( = ?auto_680660 ?auto_680668 ) ) ( not ( = ?auto_680661 ?auto_680662 ) ) ( not ( = ?auto_680661 ?auto_680663 ) ) ( not ( = ?auto_680661 ?auto_680664 ) ) ( not ( = ?auto_680661 ?auto_680665 ) ) ( not ( = ?auto_680661 ?auto_680666 ) ) ( not ( = ?auto_680661 ?auto_680667 ) ) ( not ( = ?auto_680661 ?auto_680668 ) ) ( not ( = ?auto_680662 ?auto_680663 ) ) ( not ( = ?auto_680662 ?auto_680664 ) ) ( not ( = ?auto_680662 ?auto_680665 ) ) ( not ( = ?auto_680662 ?auto_680666 ) ) ( not ( = ?auto_680662 ?auto_680667 ) ) ( not ( = ?auto_680662 ?auto_680668 ) ) ( not ( = ?auto_680663 ?auto_680664 ) ) ( not ( = ?auto_680663 ?auto_680665 ) ) ( not ( = ?auto_680663 ?auto_680666 ) ) ( not ( = ?auto_680663 ?auto_680667 ) ) ( not ( = ?auto_680663 ?auto_680668 ) ) ( not ( = ?auto_680664 ?auto_680665 ) ) ( not ( = ?auto_680664 ?auto_680666 ) ) ( not ( = ?auto_680664 ?auto_680667 ) ) ( not ( = ?auto_680664 ?auto_680668 ) ) ( not ( = ?auto_680665 ?auto_680666 ) ) ( not ( = ?auto_680665 ?auto_680667 ) ) ( not ( = ?auto_680665 ?auto_680668 ) ) ( not ( = ?auto_680666 ?auto_680667 ) ) ( not ( = ?auto_680666 ?auto_680668 ) ) ( not ( = ?auto_680667 ?auto_680668 ) ) ( ON ?auto_680666 ?auto_680667 ) ( CLEAR ?auto_680664 ) ( ON ?auto_680665 ?auto_680666 ) ( CLEAR ?auto_680665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_680660 ?auto_680661 ?auto_680662 ?auto_680663 ?auto_680664 ?auto_680665 )
      ( MAKE-8PILE ?auto_680660 ?auto_680661 ?auto_680662 ?auto_680663 ?auto_680664 ?auto_680665 ?auto_680666 ?auto_680667 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_680694 - BLOCK
      ?auto_680695 - BLOCK
      ?auto_680696 - BLOCK
      ?auto_680697 - BLOCK
      ?auto_680698 - BLOCK
      ?auto_680699 - BLOCK
      ?auto_680700 - BLOCK
      ?auto_680701 - BLOCK
    )
    :vars
    (
      ?auto_680702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680701 ?auto_680702 ) ( ON-TABLE ?auto_680694 ) ( ON ?auto_680695 ?auto_680694 ) ( ON ?auto_680696 ?auto_680695 ) ( ON ?auto_680697 ?auto_680696 ) ( not ( = ?auto_680694 ?auto_680695 ) ) ( not ( = ?auto_680694 ?auto_680696 ) ) ( not ( = ?auto_680694 ?auto_680697 ) ) ( not ( = ?auto_680694 ?auto_680698 ) ) ( not ( = ?auto_680694 ?auto_680699 ) ) ( not ( = ?auto_680694 ?auto_680700 ) ) ( not ( = ?auto_680694 ?auto_680701 ) ) ( not ( = ?auto_680694 ?auto_680702 ) ) ( not ( = ?auto_680695 ?auto_680696 ) ) ( not ( = ?auto_680695 ?auto_680697 ) ) ( not ( = ?auto_680695 ?auto_680698 ) ) ( not ( = ?auto_680695 ?auto_680699 ) ) ( not ( = ?auto_680695 ?auto_680700 ) ) ( not ( = ?auto_680695 ?auto_680701 ) ) ( not ( = ?auto_680695 ?auto_680702 ) ) ( not ( = ?auto_680696 ?auto_680697 ) ) ( not ( = ?auto_680696 ?auto_680698 ) ) ( not ( = ?auto_680696 ?auto_680699 ) ) ( not ( = ?auto_680696 ?auto_680700 ) ) ( not ( = ?auto_680696 ?auto_680701 ) ) ( not ( = ?auto_680696 ?auto_680702 ) ) ( not ( = ?auto_680697 ?auto_680698 ) ) ( not ( = ?auto_680697 ?auto_680699 ) ) ( not ( = ?auto_680697 ?auto_680700 ) ) ( not ( = ?auto_680697 ?auto_680701 ) ) ( not ( = ?auto_680697 ?auto_680702 ) ) ( not ( = ?auto_680698 ?auto_680699 ) ) ( not ( = ?auto_680698 ?auto_680700 ) ) ( not ( = ?auto_680698 ?auto_680701 ) ) ( not ( = ?auto_680698 ?auto_680702 ) ) ( not ( = ?auto_680699 ?auto_680700 ) ) ( not ( = ?auto_680699 ?auto_680701 ) ) ( not ( = ?auto_680699 ?auto_680702 ) ) ( not ( = ?auto_680700 ?auto_680701 ) ) ( not ( = ?auto_680700 ?auto_680702 ) ) ( not ( = ?auto_680701 ?auto_680702 ) ) ( ON ?auto_680700 ?auto_680701 ) ( ON ?auto_680699 ?auto_680700 ) ( CLEAR ?auto_680697 ) ( ON ?auto_680698 ?auto_680699 ) ( CLEAR ?auto_680698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_680694 ?auto_680695 ?auto_680696 ?auto_680697 ?auto_680698 )
      ( MAKE-8PILE ?auto_680694 ?auto_680695 ?auto_680696 ?auto_680697 ?auto_680698 ?auto_680699 ?auto_680700 ?auto_680701 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_680728 - BLOCK
      ?auto_680729 - BLOCK
      ?auto_680730 - BLOCK
      ?auto_680731 - BLOCK
      ?auto_680732 - BLOCK
      ?auto_680733 - BLOCK
      ?auto_680734 - BLOCK
      ?auto_680735 - BLOCK
    )
    :vars
    (
      ?auto_680736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680735 ?auto_680736 ) ( ON-TABLE ?auto_680728 ) ( ON ?auto_680729 ?auto_680728 ) ( ON ?auto_680730 ?auto_680729 ) ( not ( = ?auto_680728 ?auto_680729 ) ) ( not ( = ?auto_680728 ?auto_680730 ) ) ( not ( = ?auto_680728 ?auto_680731 ) ) ( not ( = ?auto_680728 ?auto_680732 ) ) ( not ( = ?auto_680728 ?auto_680733 ) ) ( not ( = ?auto_680728 ?auto_680734 ) ) ( not ( = ?auto_680728 ?auto_680735 ) ) ( not ( = ?auto_680728 ?auto_680736 ) ) ( not ( = ?auto_680729 ?auto_680730 ) ) ( not ( = ?auto_680729 ?auto_680731 ) ) ( not ( = ?auto_680729 ?auto_680732 ) ) ( not ( = ?auto_680729 ?auto_680733 ) ) ( not ( = ?auto_680729 ?auto_680734 ) ) ( not ( = ?auto_680729 ?auto_680735 ) ) ( not ( = ?auto_680729 ?auto_680736 ) ) ( not ( = ?auto_680730 ?auto_680731 ) ) ( not ( = ?auto_680730 ?auto_680732 ) ) ( not ( = ?auto_680730 ?auto_680733 ) ) ( not ( = ?auto_680730 ?auto_680734 ) ) ( not ( = ?auto_680730 ?auto_680735 ) ) ( not ( = ?auto_680730 ?auto_680736 ) ) ( not ( = ?auto_680731 ?auto_680732 ) ) ( not ( = ?auto_680731 ?auto_680733 ) ) ( not ( = ?auto_680731 ?auto_680734 ) ) ( not ( = ?auto_680731 ?auto_680735 ) ) ( not ( = ?auto_680731 ?auto_680736 ) ) ( not ( = ?auto_680732 ?auto_680733 ) ) ( not ( = ?auto_680732 ?auto_680734 ) ) ( not ( = ?auto_680732 ?auto_680735 ) ) ( not ( = ?auto_680732 ?auto_680736 ) ) ( not ( = ?auto_680733 ?auto_680734 ) ) ( not ( = ?auto_680733 ?auto_680735 ) ) ( not ( = ?auto_680733 ?auto_680736 ) ) ( not ( = ?auto_680734 ?auto_680735 ) ) ( not ( = ?auto_680734 ?auto_680736 ) ) ( not ( = ?auto_680735 ?auto_680736 ) ) ( ON ?auto_680734 ?auto_680735 ) ( ON ?auto_680733 ?auto_680734 ) ( ON ?auto_680732 ?auto_680733 ) ( CLEAR ?auto_680730 ) ( ON ?auto_680731 ?auto_680732 ) ( CLEAR ?auto_680731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_680728 ?auto_680729 ?auto_680730 ?auto_680731 )
      ( MAKE-8PILE ?auto_680728 ?auto_680729 ?auto_680730 ?auto_680731 ?auto_680732 ?auto_680733 ?auto_680734 ?auto_680735 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_680762 - BLOCK
      ?auto_680763 - BLOCK
      ?auto_680764 - BLOCK
      ?auto_680765 - BLOCK
      ?auto_680766 - BLOCK
      ?auto_680767 - BLOCK
      ?auto_680768 - BLOCK
      ?auto_680769 - BLOCK
    )
    :vars
    (
      ?auto_680770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680769 ?auto_680770 ) ( ON-TABLE ?auto_680762 ) ( ON ?auto_680763 ?auto_680762 ) ( not ( = ?auto_680762 ?auto_680763 ) ) ( not ( = ?auto_680762 ?auto_680764 ) ) ( not ( = ?auto_680762 ?auto_680765 ) ) ( not ( = ?auto_680762 ?auto_680766 ) ) ( not ( = ?auto_680762 ?auto_680767 ) ) ( not ( = ?auto_680762 ?auto_680768 ) ) ( not ( = ?auto_680762 ?auto_680769 ) ) ( not ( = ?auto_680762 ?auto_680770 ) ) ( not ( = ?auto_680763 ?auto_680764 ) ) ( not ( = ?auto_680763 ?auto_680765 ) ) ( not ( = ?auto_680763 ?auto_680766 ) ) ( not ( = ?auto_680763 ?auto_680767 ) ) ( not ( = ?auto_680763 ?auto_680768 ) ) ( not ( = ?auto_680763 ?auto_680769 ) ) ( not ( = ?auto_680763 ?auto_680770 ) ) ( not ( = ?auto_680764 ?auto_680765 ) ) ( not ( = ?auto_680764 ?auto_680766 ) ) ( not ( = ?auto_680764 ?auto_680767 ) ) ( not ( = ?auto_680764 ?auto_680768 ) ) ( not ( = ?auto_680764 ?auto_680769 ) ) ( not ( = ?auto_680764 ?auto_680770 ) ) ( not ( = ?auto_680765 ?auto_680766 ) ) ( not ( = ?auto_680765 ?auto_680767 ) ) ( not ( = ?auto_680765 ?auto_680768 ) ) ( not ( = ?auto_680765 ?auto_680769 ) ) ( not ( = ?auto_680765 ?auto_680770 ) ) ( not ( = ?auto_680766 ?auto_680767 ) ) ( not ( = ?auto_680766 ?auto_680768 ) ) ( not ( = ?auto_680766 ?auto_680769 ) ) ( not ( = ?auto_680766 ?auto_680770 ) ) ( not ( = ?auto_680767 ?auto_680768 ) ) ( not ( = ?auto_680767 ?auto_680769 ) ) ( not ( = ?auto_680767 ?auto_680770 ) ) ( not ( = ?auto_680768 ?auto_680769 ) ) ( not ( = ?auto_680768 ?auto_680770 ) ) ( not ( = ?auto_680769 ?auto_680770 ) ) ( ON ?auto_680768 ?auto_680769 ) ( ON ?auto_680767 ?auto_680768 ) ( ON ?auto_680766 ?auto_680767 ) ( ON ?auto_680765 ?auto_680766 ) ( CLEAR ?auto_680763 ) ( ON ?auto_680764 ?auto_680765 ) ( CLEAR ?auto_680764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_680762 ?auto_680763 ?auto_680764 )
      ( MAKE-8PILE ?auto_680762 ?auto_680763 ?auto_680764 ?auto_680765 ?auto_680766 ?auto_680767 ?auto_680768 ?auto_680769 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_680796 - BLOCK
      ?auto_680797 - BLOCK
      ?auto_680798 - BLOCK
      ?auto_680799 - BLOCK
      ?auto_680800 - BLOCK
      ?auto_680801 - BLOCK
      ?auto_680802 - BLOCK
      ?auto_680803 - BLOCK
    )
    :vars
    (
      ?auto_680804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680803 ?auto_680804 ) ( ON-TABLE ?auto_680796 ) ( not ( = ?auto_680796 ?auto_680797 ) ) ( not ( = ?auto_680796 ?auto_680798 ) ) ( not ( = ?auto_680796 ?auto_680799 ) ) ( not ( = ?auto_680796 ?auto_680800 ) ) ( not ( = ?auto_680796 ?auto_680801 ) ) ( not ( = ?auto_680796 ?auto_680802 ) ) ( not ( = ?auto_680796 ?auto_680803 ) ) ( not ( = ?auto_680796 ?auto_680804 ) ) ( not ( = ?auto_680797 ?auto_680798 ) ) ( not ( = ?auto_680797 ?auto_680799 ) ) ( not ( = ?auto_680797 ?auto_680800 ) ) ( not ( = ?auto_680797 ?auto_680801 ) ) ( not ( = ?auto_680797 ?auto_680802 ) ) ( not ( = ?auto_680797 ?auto_680803 ) ) ( not ( = ?auto_680797 ?auto_680804 ) ) ( not ( = ?auto_680798 ?auto_680799 ) ) ( not ( = ?auto_680798 ?auto_680800 ) ) ( not ( = ?auto_680798 ?auto_680801 ) ) ( not ( = ?auto_680798 ?auto_680802 ) ) ( not ( = ?auto_680798 ?auto_680803 ) ) ( not ( = ?auto_680798 ?auto_680804 ) ) ( not ( = ?auto_680799 ?auto_680800 ) ) ( not ( = ?auto_680799 ?auto_680801 ) ) ( not ( = ?auto_680799 ?auto_680802 ) ) ( not ( = ?auto_680799 ?auto_680803 ) ) ( not ( = ?auto_680799 ?auto_680804 ) ) ( not ( = ?auto_680800 ?auto_680801 ) ) ( not ( = ?auto_680800 ?auto_680802 ) ) ( not ( = ?auto_680800 ?auto_680803 ) ) ( not ( = ?auto_680800 ?auto_680804 ) ) ( not ( = ?auto_680801 ?auto_680802 ) ) ( not ( = ?auto_680801 ?auto_680803 ) ) ( not ( = ?auto_680801 ?auto_680804 ) ) ( not ( = ?auto_680802 ?auto_680803 ) ) ( not ( = ?auto_680802 ?auto_680804 ) ) ( not ( = ?auto_680803 ?auto_680804 ) ) ( ON ?auto_680802 ?auto_680803 ) ( ON ?auto_680801 ?auto_680802 ) ( ON ?auto_680800 ?auto_680801 ) ( ON ?auto_680799 ?auto_680800 ) ( ON ?auto_680798 ?auto_680799 ) ( CLEAR ?auto_680796 ) ( ON ?auto_680797 ?auto_680798 ) ( CLEAR ?auto_680797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_680796 ?auto_680797 )
      ( MAKE-8PILE ?auto_680796 ?auto_680797 ?auto_680798 ?auto_680799 ?auto_680800 ?auto_680801 ?auto_680802 ?auto_680803 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_680830 - BLOCK
      ?auto_680831 - BLOCK
      ?auto_680832 - BLOCK
      ?auto_680833 - BLOCK
      ?auto_680834 - BLOCK
      ?auto_680835 - BLOCK
      ?auto_680836 - BLOCK
      ?auto_680837 - BLOCK
    )
    :vars
    (
      ?auto_680838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680837 ?auto_680838 ) ( not ( = ?auto_680830 ?auto_680831 ) ) ( not ( = ?auto_680830 ?auto_680832 ) ) ( not ( = ?auto_680830 ?auto_680833 ) ) ( not ( = ?auto_680830 ?auto_680834 ) ) ( not ( = ?auto_680830 ?auto_680835 ) ) ( not ( = ?auto_680830 ?auto_680836 ) ) ( not ( = ?auto_680830 ?auto_680837 ) ) ( not ( = ?auto_680830 ?auto_680838 ) ) ( not ( = ?auto_680831 ?auto_680832 ) ) ( not ( = ?auto_680831 ?auto_680833 ) ) ( not ( = ?auto_680831 ?auto_680834 ) ) ( not ( = ?auto_680831 ?auto_680835 ) ) ( not ( = ?auto_680831 ?auto_680836 ) ) ( not ( = ?auto_680831 ?auto_680837 ) ) ( not ( = ?auto_680831 ?auto_680838 ) ) ( not ( = ?auto_680832 ?auto_680833 ) ) ( not ( = ?auto_680832 ?auto_680834 ) ) ( not ( = ?auto_680832 ?auto_680835 ) ) ( not ( = ?auto_680832 ?auto_680836 ) ) ( not ( = ?auto_680832 ?auto_680837 ) ) ( not ( = ?auto_680832 ?auto_680838 ) ) ( not ( = ?auto_680833 ?auto_680834 ) ) ( not ( = ?auto_680833 ?auto_680835 ) ) ( not ( = ?auto_680833 ?auto_680836 ) ) ( not ( = ?auto_680833 ?auto_680837 ) ) ( not ( = ?auto_680833 ?auto_680838 ) ) ( not ( = ?auto_680834 ?auto_680835 ) ) ( not ( = ?auto_680834 ?auto_680836 ) ) ( not ( = ?auto_680834 ?auto_680837 ) ) ( not ( = ?auto_680834 ?auto_680838 ) ) ( not ( = ?auto_680835 ?auto_680836 ) ) ( not ( = ?auto_680835 ?auto_680837 ) ) ( not ( = ?auto_680835 ?auto_680838 ) ) ( not ( = ?auto_680836 ?auto_680837 ) ) ( not ( = ?auto_680836 ?auto_680838 ) ) ( not ( = ?auto_680837 ?auto_680838 ) ) ( ON ?auto_680836 ?auto_680837 ) ( ON ?auto_680835 ?auto_680836 ) ( ON ?auto_680834 ?auto_680835 ) ( ON ?auto_680833 ?auto_680834 ) ( ON ?auto_680832 ?auto_680833 ) ( ON ?auto_680831 ?auto_680832 ) ( ON ?auto_680830 ?auto_680831 ) ( CLEAR ?auto_680830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_680830 )
      ( MAKE-8PILE ?auto_680830 ?auto_680831 ?auto_680832 ?auto_680833 ?auto_680834 ?auto_680835 ?auto_680836 ?auto_680837 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_680865 - BLOCK
      ?auto_680866 - BLOCK
      ?auto_680867 - BLOCK
      ?auto_680868 - BLOCK
      ?auto_680869 - BLOCK
      ?auto_680870 - BLOCK
      ?auto_680871 - BLOCK
      ?auto_680872 - BLOCK
      ?auto_680873 - BLOCK
    )
    :vars
    (
      ?auto_680874 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_680872 ) ( ON ?auto_680873 ?auto_680874 ) ( CLEAR ?auto_680873 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_680865 ) ( ON ?auto_680866 ?auto_680865 ) ( ON ?auto_680867 ?auto_680866 ) ( ON ?auto_680868 ?auto_680867 ) ( ON ?auto_680869 ?auto_680868 ) ( ON ?auto_680870 ?auto_680869 ) ( ON ?auto_680871 ?auto_680870 ) ( ON ?auto_680872 ?auto_680871 ) ( not ( = ?auto_680865 ?auto_680866 ) ) ( not ( = ?auto_680865 ?auto_680867 ) ) ( not ( = ?auto_680865 ?auto_680868 ) ) ( not ( = ?auto_680865 ?auto_680869 ) ) ( not ( = ?auto_680865 ?auto_680870 ) ) ( not ( = ?auto_680865 ?auto_680871 ) ) ( not ( = ?auto_680865 ?auto_680872 ) ) ( not ( = ?auto_680865 ?auto_680873 ) ) ( not ( = ?auto_680865 ?auto_680874 ) ) ( not ( = ?auto_680866 ?auto_680867 ) ) ( not ( = ?auto_680866 ?auto_680868 ) ) ( not ( = ?auto_680866 ?auto_680869 ) ) ( not ( = ?auto_680866 ?auto_680870 ) ) ( not ( = ?auto_680866 ?auto_680871 ) ) ( not ( = ?auto_680866 ?auto_680872 ) ) ( not ( = ?auto_680866 ?auto_680873 ) ) ( not ( = ?auto_680866 ?auto_680874 ) ) ( not ( = ?auto_680867 ?auto_680868 ) ) ( not ( = ?auto_680867 ?auto_680869 ) ) ( not ( = ?auto_680867 ?auto_680870 ) ) ( not ( = ?auto_680867 ?auto_680871 ) ) ( not ( = ?auto_680867 ?auto_680872 ) ) ( not ( = ?auto_680867 ?auto_680873 ) ) ( not ( = ?auto_680867 ?auto_680874 ) ) ( not ( = ?auto_680868 ?auto_680869 ) ) ( not ( = ?auto_680868 ?auto_680870 ) ) ( not ( = ?auto_680868 ?auto_680871 ) ) ( not ( = ?auto_680868 ?auto_680872 ) ) ( not ( = ?auto_680868 ?auto_680873 ) ) ( not ( = ?auto_680868 ?auto_680874 ) ) ( not ( = ?auto_680869 ?auto_680870 ) ) ( not ( = ?auto_680869 ?auto_680871 ) ) ( not ( = ?auto_680869 ?auto_680872 ) ) ( not ( = ?auto_680869 ?auto_680873 ) ) ( not ( = ?auto_680869 ?auto_680874 ) ) ( not ( = ?auto_680870 ?auto_680871 ) ) ( not ( = ?auto_680870 ?auto_680872 ) ) ( not ( = ?auto_680870 ?auto_680873 ) ) ( not ( = ?auto_680870 ?auto_680874 ) ) ( not ( = ?auto_680871 ?auto_680872 ) ) ( not ( = ?auto_680871 ?auto_680873 ) ) ( not ( = ?auto_680871 ?auto_680874 ) ) ( not ( = ?auto_680872 ?auto_680873 ) ) ( not ( = ?auto_680872 ?auto_680874 ) ) ( not ( = ?auto_680873 ?auto_680874 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_680873 ?auto_680874 )
      ( !STACK ?auto_680873 ?auto_680872 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_680903 - BLOCK
      ?auto_680904 - BLOCK
      ?auto_680905 - BLOCK
      ?auto_680906 - BLOCK
      ?auto_680907 - BLOCK
      ?auto_680908 - BLOCK
      ?auto_680909 - BLOCK
      ?auto_680910 - BLOCK
      ?auto_680911 - BLOCK
    )
    :vars
    (
      ?auto_680912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680911 ?auto_680912 ) ( ON-TABLE ?auto_680903 ) ( ON ?auto_680904 ?auto_680903 ) ( ON ?auto_680905 ?auto_680904 ) ( ON ?auto_680906 ?auto_680905 ) ( ON ?auto_680907 ?auto_680906 ) ( ON ?auto_680908 ?auto_680907 ) ( ON ?auto_680909 ?auto_680908 ) ( not ( = ?auto_680903 ?auto_680904 ) ) ( not ( = ?auto_680903 ?auto_680905 ) ) ( not ( = ?auto_680903 ?auto_680906 ) ) ( not ( = ?auto_680903 ?auto_680907 ) ) ( not ( = ?auto_680903 ?auto_680908 ) ) ( not ( = ?auto_680903 ?auto_680909 ) ) ( not ( = ?auto_680903 ?auto_680910 ) ) ( not ( = ?auto_680903 ?auto_680911 ) ) ( not ( = ?auto_680903 ?auto_680912 ) ) ( not ( = ?auto_680904 ?auto_680905 ) ) ( not ( = ?auto_680904 ?auto_680906 ) ) ( not ( = ?auto_680904 ?auto_680907 ) ) ( not ( = ?auto_680904 ?auto_680908 ) ) ( not ( = ?auto_680904 ?auto_680909 ) ) ( not ( = ?auto_680904 ?auto_680910 ) ) ( not ( = ?auto_680904 ?auto_680911 ) ) ( not ( = ?auto_680904 ?auto_680912 ) ) ( not ( = ?auto_680905 ?auto_680906 ) ) ( not ( = ?auto_680905 ?auto_680907 ) ) ( not ( = ?auto_680905 ?auto_680908 ) ) ( not ( = ?auto_680905 ?auto_680909 ) ) ( not ( = ?auto_680905 ?auto_680910 ) ) ( not ( = ?auto_680905 ?auto_680911 ) ) ( not ( = ?auto_680905 ?auto_680912 ) ) ( not ( = ?auto_680906 ?auto_680907 ) ) ( not ( = ?auto_680906 ?auto_680908 ) ) ( not ( = ?auto_680906 ?auto_680909 ) ) ( not ( = ?auto_680906 ?auto_680910 ) ) ( not ( = ?auto_680906 ?auto_680911 ) ) ( not ( = ?auto_680906 ?auto_680912 ) ) ( not ( = ?auto_680907 ?auto_680908 ) ) ( not ( = ?auto_680907 ?auto_680909 ) ) ( not ( = ?auto_680907 ?auto_680910 ) ) ( not ( = ?auto_680907 ?auto_680911 ) ) ( not ( = ?auto_680907 ?auto_680912 ) ) ( not ( = ?auto_680908 ?auto_680909 ) ) ( not ( = ?auto_680908 ?auto_680910 ) ) ( not ( = ?auto_680908 ?auto_680911 ) ) ( not ( = ?auto_680908 ?auto_680912 ) ) ( not ( = ?auto_680909 ?auto_680910 ) ) ( not ( = ?auto_680909 ?auto_680911 ) ) ( not ( = ?auto_680909 ?auto_680912 ) ) ( not ( = ?auto_680910 ?auto_680911 ) ) ( not ( = ?auto_680910 ?auto_680912 ) ) ( not ( = ?auto_680911 ?auto_680912 ) ) ( CLEAR ?auto_680909 ) ( ON ?auto_680910 ?auto_680911 ) ( CLEAR ?auto_680910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_680903 ?auto_680904 ?auto_680905 ?auto_680906 ?auto_680907 ?auto_680908 ?auto_680909 ?auto_680910 )
      ( MAKE-9PILE ?auto_680903 ?auto_680904 ?auto_680905 ?auto_680906 ?auto_680907 ?auto_680908 ?auto_680909 ?auto_680910 ?auto_680911 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_680941 - BLOCK
      ?auto_680942 - BLOCK
      ?auto_680943 - BLOCK
      ?auto_680944 - BLOCK
      ?auto_680945 - BLOCK
      ?auto_680946 - BLOCK
      ?auto_680947 - BLOCK
      ?auto_680948 - BLOCK
      ?auto_680949 - BLOCK
    )
    :vars
    (
      ?auto_680950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680949 ?auto_680950 ) ( ON-TABLE ?auto_680941 ) ( ON ?auto_680942 ?auto_680941 ) ( ON ?auto_680943 ?auto_680942 ) ( ON ?auto_680944 ?auto_680943 ) ( ON ?auto_680945 ?auto_680944 ) ( ON ?auto_680946 ?auto_680945 ) ( not ( = ?auto_680941 ?auto_680942 ) ) ( not ( = ?auto_680941 ?auto_680943 ) ) ( not ( = ?auto_680941 ?auto_680944 ) ) ( not ( = ?auto_680941 ?auto_680945 ) ) ( not ( = ?auto_680941 ?auto_680946 ) ) ( not ( = ?auto_680941 ?auto_680947 ) ) ( not ( = ?auto_680941 ?auto_680948 ) ) ( not ( = ?auto_680941 ?auto_680949 ) ) ( not ( = ?auto_680941 ?auto_680950 ) ) ( not ( = ?auto_680942 ?auto_680943 ) ) ( not ( = ?auto_680942 ?auto_680944 ) ) ( not ( = ?auto_680942 ?auto_680945 ) ) ( not ( = ?auto_680942 ?auto_680946 ) ) ( not ( = ?auto_680942 ?auto_680947 ) ) ( not ( = ?auto_680942 ?auto_680948 ) ) ( not ( = ?auto_680942 ?auto_680949 ) ) ( not ( = ?auto_680942 ?auto_680950 ) ) ( not ( = ?auto_680943 ?auto_680944 ) ) ( not ( = ?auto_680943 ?auto_680945 ) ) ( not ( = ?auto_680943 ?auto_680946 ) ) ( not ( = ?auto_680943 ?auto_680947 ) ) ( not ( = ?auto_680943 ?auto_680948 ) ) ( not ( = ?auto_680943 ?auto_680949 ) ) ( not ( = ?auto_680943 ?auto_680950 ) ) ( not ( = ?auto_680944 ?auto_680945 ) ) ( not ( = ?auto_680944 ?auto_680946 ) ) ( not ( = ?auto_680944 ?auto_680947 ) ) ( not ( = ?auto_680944 ?auto_680948 ) ) ( not ( = ?auto_680944 ?auto_680949 ) ) ( not ( = ?auto_680944 ?auto_680950 ) ) ( not ( = ?auto_680945 ?auto_680946 ) ) ( not ( = ?auto_680945 ?auto_680947 ) ) ( not ( = ?auto_680945 ?auto_680948 ) ) ( not ( = ?auto_680945 ?auto_680949 ) ) ( not ( = ?auto_680945 ?auto_680950 ) ) ( not ( = ?auto_680946 ?auto_680947 ) ) ( not ( = ?auto_680946 ?auto_680948 ) ) ( not ( = ?auto_680946 ?auto_680949 ) ) ( not ( = ?auto_680946 ?auto_680950 ) ) ( not ( = ?auto_680947 ?auto_680948 ) ) ( not ( = ?auto_680947 ?auto_680949 ) ) ( not ( = ?auto_680947 ?auto_680950 ) ) ( not ( = ?auto_680948 ?auto_680949 ) ) ( not ( = ?auto_680948 ?auto_680950 ) ) ( not ( = ?auto_680949 ?auto_680950 ) ) ( ON ?auto_680948 ?auto_680949 ) ( CLEAR ?auto_680946 ) ( ON ?auto_680947 ?auto_680948 ) ( CLEAR ?auto_680947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_680941 ?auto_680942 ?auto_680943 ?auto_680944 ?auto_680945 ?auto_680946 ?auto_680947 )
      ( MAKE-9PILE ?auto_680941 ?auto_680942 ?auto_680943 ?auto_680944 ?auto_680945 ?auto_680946 ?auto_680947 ?auto_680948 ?auto_680949 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_680979 - BLOCK
      ?auto_680980 - BLOCK
      ?auto_680981 - BLOCK
      ?auto_680982 - BLOCK
      ?auto_680983 - BLOCK
      ?auto_680984 - BLOCK
      ?auto_680985 - BLOCK
      ?auto_680986 - BLOCK
      ?auto_680987 - BLOCK
    )
    :vars
    (
      ?auto_680988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_680987 ?auto_680988 ) ( ON-TABLE ?auto_680979 ) ( ON ?auto_680980 ?auto_680979 ) ( ON ?auto_680981 ?auto_680980 ) ( ON ?auto_680982 ?auto_680981 ) ( ON ?auto_680983 ?auto_680982 ) ( not ( = ?auto_680979 ?auto_680980 ) ) ( not ( = ?auto_680979 ?auto_680981 ) ) ( not ( = ?auto_680979 ?auto_680982 ) ) ( not ( = ?auto_680979 ?auto_680983 ) ) ( not ( = ?auto_680979 ?auto_680984 ) ) ( not ( = ?auto_680979 ?auto_680985 ) ) ( not ( = ?auto_680979 ?auto_680986 ) ) ( not ( = ?auto_680979 ?auto_680987 ) ) ( not ( = ?auto_680979 ?auto_680988 ) ) ( not ( = ?auto_680980 ?auto_680981 ) ) ( not ( = ?auto_680980 ?auto_680982 ) ) ( not ( = ?auto_680980 ?auto_680983 ) ) ( not ( = ?auto_680980 ?auto_680984 ) ) ( not ( = ?auto_680980 ?auto_680985 ) ) ( not ( = ?auto_680980 ?auto_680986 ) ) ( not ( = ?auto_680980 ?auto_680987 ) ) ( not ( = ?auto_680980 ?auto_680988 ) ) ( not ( = ?auto_680981 ?auto_680982 ) ) ( not ( = ?auto_680981 ?auto_680983 ) ) ( not ( = ?auto_680981 ?auto_680984 ) ) ( not ( = ?auto_680981 ?auto_680985 ) ) ( not ( = ?auto_680981 ?auto_680986 ) ) ( not ( = ?auto_680981 ?auto_680987 ) ) ( not ( = ?auto_680981 ?auto_680988 ) ) ( not ( = ?auto_680982 ?auto_680983 ) ) ( not ( = ?auto_680982 ?auto_680984 ) ) ( not ( = ?auto_680982 ?auto_680985 ) ) ( not ( = ?auto_680982 ?auto_680986 ) ) ( not ( = ?auto_680982 ?auto_680987 ) ) ( not ( = ?auto_680982 ?auto_680988 ) ) ( not ( = ?auto_680983 ?auto_680984 ) ) ( not ( = ?auto_680983 ?auto_680985 ) ) ( not ( = ?auto_680983 ?auto_680986 ) ) ( not ( = ?auto_680983 ?auto_680987 ) ) ( not ( = ?auto_680983 ?auto_680988 ) ) ( not ( = ?auto_680984 ?auto_680985 ) ) ( not ( = ?auto_680984 ?auto_680986 ) ) ( not ( = ?auto_680984 ?auto_680987 ) ) ( not ( = ?auto_680984 ?auto_680988 ) ) ( not ( = ?auto_680985 ?auto_680986 ) ) ( not ( = ?auto_680985 ?auto_680987 ) ) ( not ( = ?auto_680985 ?auto_680988 ) ) ( not ( = ?auto_680986 ?auto_680987 ) ) ( not ( = ?auto_680986 ?auto_680988 ) ) ( not ( = ?auto_680987 ?auto_680988 ) ) ( ON ?auto_680986 ?auto_680987 ) ( ON ?auto_680985 ?auto_680986 ) ( CLEAR ?auto_680983 ) ( ON ?auto_680984 ?auto_680985 ) ( CLEAR ?auto_680984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_680979 ?auto_680980 ?auto_680981 ?auto_680982 ?auto_680983 ?auto_680984 )
      ( MAKE-9PILE ?auto_680979 ?auto_680980 ?auto_680981 ?auto_680982 ?auto_680983 ?auto_680984 ?auto_680985 ?auto_680986 ?auto_680987 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_681017 - BLOCK
      ?auto_681018 - BLOCK
      ?auto_681019 - BLOCK
      ?auto_681020 - BLOCK
      ?auto_681021 - BLOCK
      ?auto_681022 - BLOCK
      ?auto_681023 - BLOCK
      ?auto_681024 - BLOCK
      ?auto_681025 - BLOCK
    )
    :vars
    (
      ?auto_681026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_681025 ?auto_681026 ) ( ON-TABLE ?auto_681017 ) ( ON ?auto_681018 ?auto_681017 ) ( ON ?auto_681019 ?auto_681018 ) ( ON ?auto_681020 ?auto_681019 ) ( not ( = ?auto_681017 ?auto_681018 ) ) ( not ( = ?auto_681017 ?auto_681019 ) ) ( not ( = ?auto_681017 ?auto_681020 ) ) ( not ( = ?auto_681017 ?auto_681021 ) ) ( not ( = ?auto_681017 ?auto_681022 ) ) ( not ( = ?auto_681017 ?auto_681023 ) ) ( not ( = ?auto_681017 ?auto_681024 ) ) ( not ( = ?auto_681017 ?auto_681025 ) ) ( not ( = ?auto_681017 ?auto_681026 ) ) ( not ( = ?auto_681018 ?auto_681019 ) ) ( not ( = ?auto_681018 ?auto_681020 ) ) ( not ( = ?auto_681018 ?auto_681021 ) ) ( not ( = ?auto_681018 ?auto_681022 ) ) ( not ( = ?auto_681018 ?auto_681023 ) ) ( not ( = ?auto_681018 ?auto_681024 ) ) ( not ( = ?auto_681018 ?auto_681025 ) ) ( not ( = ?auto_681018 ?auto_681026 ) ) ( not ( = ?auto_681019 ?auto_681020 ) ) ( not ( = ?auto_681019 ?auto_681021 ) ) ( not ( = ?auto_681019 ?auto_681022 ) ) ( not ( = ?auto_681019 ?auto_681023 ) ) ( not ( = ?auto_681019 ?auto_681024 ) ) ( not ( = ?auto_681019 ?auto_681025 ) ) ( not ( = ?auto_681019 ?auto_681026 ) ) ( not ( = ?auto_681020 ?auto_681021 ) ) ( not ( = ?auto_681020 ?auto_681022 ) ) ( not ( = ?auto_681020 ?auto_681023 ) ) ( not ( = ?auto_681020 ?auto_681024 ) ) ( not ( = ?auto_681020 ?auto_681025 ) ) ( not ( = ?auto_681020 ?auto_681026 ) ) ( not ( = ?auto_681021 ?auto_681022 ) ) ( not ( = ?auto_681021 ?auto_681023 ) ) ( not ( = ?auto_681021 ?auto_681024 ) ) ( not ( = ?auto_681021 ?auto_681025 ) ) ( not ( = ?auto_681021 ?auto_681026 ) ) ( not ( = ?auto_681022 ?auto_681023 ) ) ( not ( = ?auto_681022 ?auto_681024 ) ) ( not ( = ?auto_681022 ?auto_681025 ) ) ( not ( = ?auto_681022 ?auto_681026 ) ) ( not ( = ?auto_681023 ?auto_681024 ) ) ( not ( = ?auto_681023 ?auto_681025 ) ) ( not ( = ?auto_681023 ?auto_681026 ) ) ( not ( = ?auto_681024 ?auto_681025 ) ) ( not ( = ?auto_681024 ?auto_681026 ) ) ( not ( = ?auto_681025 ?auto_681026 ) ) ( ON ?auto_681024 ?auto_681025 ) ( ON ?auto_681023 ?auto_681024 ) ( ON ?auto_681022 ?auto_681023 ) ( CLEAR ?auto_681020 ) ( ON ?auto_681021 ?auto_681022 ) ( CLEAR ?auto_681021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_681017 ?auto_681018 ?auto_681019 ?auto_681020 ?auto_681021 )
      ( MAKE-9PILE ?auto_681017 ?auto_681018 ?auto_681019 ?auto_681020 ?auto_681021 ?auto_681022 ?auto_681023 ?auto_681024 ?auto_681025 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_681055 - BLOCK
      ?auto_681056 - BLOCK
      ?auto_681057 - BLOCK
      ?auto_681058 - BLOCK
      ?auto_681059 - BLOCK
      ?auto_681060 - BLOCK
      ?auto_681061 - BLOCK
      ?auto_681062 - BLOCK
      ?auto_681063 - BLOCK
    )
    :vars
    (
      ?auto_681064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_681063 ?auto_681064 ) ( ON-TABLE ?auto_681055 ) ( ON ?auto_681056 ?auto_681055 ) ( ON ?auto_681057 ?auto_681056 ) ( not ( = ?auto_681055 ?auto_681056 ) ) ( not ( = ?auto_681055 ?auto_681057 ) ) ( not ( = ?auto_681055 ?auto_681058 ) ) ( not ( = ?auto_681055 ?auto_681059 ) ) ( not ( = ?auto_681055 ?auto_681060 ) ) ( not ( = ?auto_681055 ?auto_681061 ) ) ( not ( = ?auto_681055 ?auto_681062 ) ) ( not ( = ?auto_681055 ?auto_681063 ) ) ( not ( = ?auto_681055 ?auto_681064 ) ) ( not ( = ?auto_681056 ?auto_681057 ) ) ( not ( = ?auto_681056 ?auto_681058 ) ) ( not ( = ?auto_681056 ?auto_681059 ) ) ( not ( = ?auto_681056 ?auto_681060 ) ) ( not ( = ?auto_681056 ?auto_681061 ) ) ( not ( = ?auto_681056 ?auto_681062 ) ) ( not ( = ?auto_681056 ?auto_681063 ) ) ( not ( = ?auto_681056 ?auto_681064 ) ) ( not ( = ?auto_681057 ?auto_681058 ) ) ( not ( = ?auto_681057 ?auto_681059 ) ) ( not ( = ?auto_681057 ?auto_681060 ) ) ( not ( = ?auto_681057 ?auto_681061 ) ) ( not ( = ?auto_681057 ?auto_681062 ) ) ( not ( = ?auto_681057 ?auto_681063 ) ) ( not ( = ?auto_681057 ?auto_681064 ) ) ( not ( = ?auto_681058 ?auto_681059 ) ) ( not ( = ?auto_681058 ?auto_681060 ) ) ( not ( = ?auto_681058 ?auto_681061 ) ) ( not ( = ?auto_681058 ?auto_681062 ) ) ( not ( = ?auto_681058 ?auto_681063 ) ) ( not ( = ?auto_681058 ?auto_681064 ) ) ( not ( = ?auto_681059 ?auto_681060 ) ) ( not ( = ?auto_681059 ?auto_681061 ) ) ( not ( = ?auto_681059 ?auto_681062 ) ) ( not ( = ?auto_681059 ?auto_681063 ) ) ( not ( = ?auto_681059 ?auto_681064 ) ) ( not ( = ?auto_681060 ?auto_681061 ) ) ( not ( = ?auto_681060 ?auto_681062 ) ) ( not ( = ?auto_681060 ?auto_681063 ) ) ( not ( = ?auto_681060 ?auto_681064 ) ) ( not ( = ?auto_681061 ?auto_681062 ) ) ( not ( = ?auto_681061 ?auto_681063 ) ) ( not ( = ?auto_681061 ?auto_681064 ) ) ( not ( = ?auto_681062 ?auto_681063 ) ) ( not ( = ?auto_681062 ?auto_681064 ) ) ( not ( = ?auto_681063 ?auto_681064 ) ) ( ON ?auto_681062 ?auto_681063 ) ( ON ?auto_681061 ?auto_681062 ) ( ON ?auto_681060 ?auto_681061 ) ( ON ?auto_681059 ?auto_681060 ) ( CLEAR ?auto_681057 ) ( ON ?auto_681058 ?auto_681059 ) ( CLEAR ?auto_681058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_681055 ?auto_681056 ?auto_681057 ?auto_681058 )
      ( MAKE-9PILE ?auto_681055 ?auto_681056 ?auto_681057 ?auto_681058 ?auto_681059 ?auto_681060 ?auto_681061 ?auto_681062 ?auto_681063 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_681093 - BLOCK
      ?auto_681094 - BLOCK
      ?auto_681095 - BLOCK
      ?auto_681096 - BLOCK
      ?auto_681097 - BLOCK
      ?auto_681098 - BLOCK
      ?auto_681099 - BLOCK
      ?auto_681100 - BLOCK
      ?auto_681101 - BLOCK
    )
    :vars
    (
      ?auto_681102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_681101 ?auto_681102 ) ( ON-TABLE ?auto_681093 ) ( ON ?auto_681094 ?auto_681093 ) ( not ( = ?auto_681093 ?auto_681094 ) ) ( not ( = ?auto_681093 ?auto_681095 ) ) ( not ( = ?auto_681093 ?auto_681096 ) ) ( not ( = ?auto_681093 ?auto_681097 ) ) ( not ( = ?auto_681093 ?auto_681098 ) ) ( not ( = ?auto_681093 ?auto_681099 ) ) ( not ( = ?auto_681093 ?auto_681100 ) ) ( not ( = ?auto_681093 ?auto_681101 ) ) ( not ( = ?auto_681093 ?auto_681102 ) ) ( not ( = ?auto_681094 ?auto_681095 ) ) ( not ( = ?auto_681094 ?auto_681096 ) ) ( not ( = ?auto_681094 ?auto_681097 ) ) ( not ( = ?auto_681094 ?auto_681098 ) ) ( not ( = ?auto_681094 ?auto_681099 ) ) ( not ( = ?auto_681094 ?auto_681100 ) ) ( not ( = ?auto_681094 ?auto_681101 ) ) ( not ( = ?auto_681094 ?auto_681102 ) ) ( not ( = ?auto_681095 ?auto_681096 ) ) ( not ( = ?auto_681095 ?auto_681097 ) ) ( not ( = ?auto_681095 ?auto_681098 ) ) ( not ( = ?auto_681095 ?auto_681099 ) ) ( not ( = ?auto_681095 ?auto_681100 ) ) ( not ( = ?auto_681095 ?auto_681101 ) ) ( not ( = ?auto_681095 ?auto_681102 ) ) ( not ( = ?auto_681096 ?auto_681097 ) ) ( not ( = ?auto_681096 ?auto_681098 ) ) ( not ( = ?auto_681096 ?auto_681099 ) ) ( not ( = ?auto_681096 ?auto_681100 ) ) ( not ( = ?auto_681096 ?auto_681101 ) ) ( not ( = ?auto_681096 ?auto_681102 ) ) ( not ( = ?auto_681097 ?auto_681098 ) ) ( not ( = ?auto_681097 ?auto_681099 ) ) ( not ( = ?auto_681097 ?auto_681100 ) ) ( not ( = ?auto_681097 ?auto_681101 ) ) ( not ( = ?auto_681097 ?auto_681102 ) ) ( not ( = ?auto_681098 ?auto_681099 ) ) ( not ( = ?auto_681098 ?auto_681100 ) ) ( not ( = ?auto_681098 ?auto_681101 ) ) ( not ( = ?auto_681098 ?auto_681102 ) ) ( not ( = ?auto_681099 ?auto_681100 ) ) ( not ( = ?auto_681099 ?auto_681101 ) ) ( not ( = ?auto_681099 ?auto_681102 ) ) ( not ( = ?auto_681100 ?auto_681101 ) ) ( not ( = ?auto_681100 ?auto_681102 ) ) ( not ( = ?auto_681101 ?auto_681102 ) ) ( ON ?auto_681100 ?auto_681101 ) ( ON ?auto_681099 ?auto_681100 ) ( ON ?auto_681098 ?auto_681099 ) ( ON ?auto_681097 ?auto_681098 ) ( ON ?auto_681096 ?auto_681097 ) ( CLEAR ?auto_681094 ) ( ON ?auto_681095 ?auto_681096 ) ( CLEAR ?auto_681095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_681093 ?auto_681094 ?auto_681095 )
      ( MAKE-9PILE ?auto_681093 ?auto_681094 ?auto_681095 ?auto_681096 ?auto_681097 ?auto_681098 ?auto_681099 ?auto_681100 ?auto_681101 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_681131 - BLOCK
      ?auto_681132 - BLOCK
      ?auto_681133 - BLOCK
      ?auto_681134 - BLOCK
      ?auto_681135 - BLOCK
      ?auto_681136 - BLOCK
      ?auto_681137 - BLOCK
      ?auto_681138 - BLOCK
      ?auto_681139 - BLOCK
    )
    :vars
    (
      ?auto_681140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_681139 ?auto_681140 ) ( ON-TABLE ?auto_681131 ) ( not ( = ?auto_681131 ?auto_681132 ) ) ( not ( = ?auto_681131 ?auto_681133 ) ) ( not ( = ?auto_681131 ?auto_681134 ) ) ( not ( = ?auto_681131 ?auto_681135 ) ) ( not ( = ?auto_681131 ?auto_681136 ) ) ( not ( = ?auto_681131 ?auto_681137 ) ) ( not ( = ?auto_681131 ?auto_681138 ) ) ( not ( = ?auto_681131 ?auto_681139 ) ) ( not ( = ?auto_681131 ?auto_681140 ) ) ( not ( = ?auto_681132 ?auto_681133 ) ) ( not ( = ?auto_681132 ?auto_681134 ) ) ( not ( = ?auto_681132 ?auto_681135 ) ) ( not ( = ?auto_681132 ?auto_681136 ) ) ( not ( = ?auto_681132 ?auto_681137 ) ) ( not ( = ?auto_681132 ?auto_681138 ) ) ( not ( = ?auto_681132 ?auto_681139 ) ) ( not ( = ?auto_681132 ?auto_681140 ) ) ( not ( = ?auto_681133 ?auto_681134 ) ) ( not ( = ?auto_681133 ?auto_681135 ) ) ( not ( = ?auto_681133 ?auto_681136 ) ) ( not ( = ?auto_681133 ?auto_681137 ) ) ( not ( = ?auto_681133 ?auto_681138 ) ) ( not ( = ?auto_681133 ?auto_681139 ) ) ( not ( = ?auto_681133 ?auto_681140 ) ) ( not ( = ?auto_681134 ?auto_681135 ) ) ( not ( = ?auto_681134 ?auto_681136 ) ) ( not ( = ?auto_681134 ?auto_681137 ) ) ( not ( = ?auto_681134 ?auto_681138 ) ) ( not ( = ?auto_681134 ?auto_681139 ) ) ( not ( = ?auto_681134 ?auto_681140 ) ) ( not ( = ?auto_681135 ?auto_681136 ) ) ( not ( = ?auto_681135 ?auto_681137 ) ) ( not ( = ?auto_681135 ?auto_681138 ) ) ( not ( = ?auto_681135 ?auto_681139 ) ) ( not ( = ?auto_681135 ?auto_681140 ) ) ( not ( = ?auto_681136 ?auto_681137 ) ) ( not ( = ?auto_681136 ?auto_681138 ) ) ( not ( = ?auto_681136 ?auto_681139 ) ) ( not ( = ?auto_681136 ?auto_681140 ) ) ( not ( = ?auto_681137 ?auto_681138 ) ) ( not ( = ?auto_681137 ?auto_681139 ) ) ( not ( = ?auto_681137 ?auto_681140 ) ) ( not ( = ?auto_681138 ?auto_681139 ) ) ( not ( = ?auto_681138 ?auto_681140 ) ) ( not ( = ?auto_681139 ?auto_681140 ) ) ( ON ?auto_681138 ?auto_681139 ) ( ON ?auto_681137 ?auto_681138 ) ( ON ?auto_681136 ?auto_681137 ) ( ON ?auto_681135 ?auto_681136 ) ( ON ?auto_681134 ?auto_681135 ) ( ON ?auto_681133 ?auto_681134 ) ( CLEAR ?auto_681131 ) ( ON ?auto_681132 ?auto_681133 ) ( CLEAR ?auto_681132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_681131 ?auto_681132 )
      ( MAKE-9PILE ?auto_681131 ?auto_681132 ?auto_681133 ?auto_681134 ?auto_681135 ?auto_681136 ?auto_681137 ?auto_681138 ?auto_681139 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_681169 - BLOCK
      ?auto_681170 - BLOCK
      ?auto_681171 - BLOCK
      ?auto_681172 - BLOCK
      ?auto_681173 - BLOCK
      ?auto_681174 - BLOCK
      ?auto_681175 - BLOCK
      ?auto_681176 - BLOCK
      ?auto_681177 - BLOCK
    )
    :vars
    (
      ?auto_681178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_681177 ?auto_681178 ) ( not ( = ?auto_681169 ?auto_681170 ) ) ( not ( = ?auto_681169 ?auto_681171 ) ) ( not ( = ?auto_681169 ?auto_681172 ) ) ( not ( = ?auto_681169 ?auto_681173 ) ) ( not ( = ?auto_681169 ?auto_681174 ) ) ( not ( = ?auto_681169 ?auto_681175 ) ) ( not ( = ?auto_681169 ?auto_681176 ) ) ( not ( = ?auto_681169 ?auto_681177 ) ) ( not ( = ?auto_681169 ?auto_681178 ) ) ( not ( = ?auto_681170 ?auto_681171 ) ) ( not ( = ?auto_681170 ?auto_681172 ) ) ( not ( = ?auto_681170 ?auto_681173 ) ) ( not ( = ?auto_681170 ?auto_681174 ) ) ( not ( = ?auto_681170 ?auto_681175 ) ) ( not ( = ?auto_681170 ?auto_681176 ) ) ( not ( = ?auto_681170 ?auto_681177 ) ) ( not ( = ?auto_681170 ?auto_681178 ) ) ( not ( = ?auto_681171 ?auto_681172 ) ) ( not ( = ?auto_681171 ?auto_681173 ) ) ( not ( = ?auto_681171 ?auto_681174 ) ) ( not ( = ?auto_681171 ?auto_681175 ) ) ( not ( = ?auto_681171 ?auto_681176 ) ) ( not ( = ?auto_681171 ?auto_681177 ) ) ( not ( = ?auto_681171 ?auto_681178 ) ) ( not ( = ?auto_681172 ?auto_681173 ) ) ( not ( = ?auto_681172 ?auto_681174 ) ) ( not ( = ?auto_681172 ?auto_681175 ) ) ( not ( = ?auto_681172 ?auto_681176 ) ) ( not ( = ?auto_681172 ?auto_681177 ) ) ( not ( = ?auto_681172 ?auto_681178 ) ) ( not ( = ?auto_681173 ?auto_681174 ) ) ( not ( = ?auto_681173 ?auto_681175 ) ) ( not ( = ?auto_681173 ?auto_681176 ) ) ( not ( = ?auto_681173 ?auto_681177 ) ) ( not ( = ?auto_681173 ?auto_681178 ) ) ( not ( = ?auto_681174 ?auto_681175 ) ) ( not ( = ?auto_681174 ?auto_681176 ) ) ( not ( = ?auto_681174 ?auto_681177 ) ) ( not ( = ?auto_681174 ?auto_681178 ) ) ( not ( = ?auto_681175 ?auto_681176 ) ) ( not ( = ?auto_681175 ?auto_681177 ) ) ( not ( = ?auto_681175 ?auto_681178 ) ) ( not ( = ?auto_681176 ?auto_681177 ) ) ( not ( = ?auto_681176 ?auto_681178 ) ) ( not ( = ?auto_681177 ?auto_681178 ) ) ( ON ?auto_681176 ?auto_681177 ) ( ON ?auto_681175 ?auto_681176 ) ( ON ?auto_681174 ?auto_681175 ) ( ON ?auto_681173 ?auto_681174 ) ( ON ?auto_681172 ?auto_681173 ) ( ON ?auto_681171 ?auto_681172 ) ( ON ?auto_681170 ?auto_681171 ) ( ON ?auto_681169 ?auto_681170 ) ( CLEAR ?auto_681169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_681169 )
      ( MAKE-9PILE ?auto_681169 ?auto_681170 ?auto_681171 ?auto_681172 ?auto_681173 ?auto_681174 ?auto_681175 ?auto_681176 ?auto_681177 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_681208 - BLOCK
      ?auto_681209 - BLOCK
      ?auto_681210 - BLOCK
      ?auto_681211 - BLOCK
      ?auto_681212 - BLOCK
      ?auto_681213 - BLOCK
      ?auto_681214 - BLOCK
      ?auto_681215 - BLOCK
      ?auto_681216 - BLOCK
      ?auto_681217 - BLOCK
    )
    :vars
    (
      ?auto_681218 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_681216 ) ( ON ?auto_681217 ?auto_681218 ) ( CLEAR ?auto_681217 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_681208 ) ( ON ?auto_681209 ?auto_681208 ) ( ON ?auto_681210 ?auto_681209 ) ( ON ?auto_681211 ?auto_681210 ) ( ON ?auto_681212 ?auto_681211 ) ( ON ?auto_681213 ?auto_681212 ) ( ON ?auto_681214 ?auto_681213 ) ( ON ?auto_681215 ?auto_681214 ) ( ON ?auto_681216 ?auto_681215 ) ( not ( = ?auto_681208 ?auto_681209 ) ) ( not ( = ?auto_681208 ?auto_681210 ) ) ( not ( = ?auto_681208 ?auto_681211 ) ) ( not ( = ?auto_681208 ?auto_681212 ) ) ( not ( = ?auto_681208 ?auto_681213 ) ) ( not ( = ?auto_681208 ?auto_681214 ) ) ( not ( = ?auto_681208 ?auto_681215 ) ) ( not ( = ?auto_681208 ?auto_681216 ) ) ( not ( = ?auto_681208 ?auto_681217 ) ) ( not ( = ?auto_681208 ?auto_681218 ) ) ( not ( = ?auto_681209 ?auto_681210 ) ) ( not ( = ?auto_681209 ?auto_681211 ) ) ( not ( = ?auto_681209 ?auto_681212 ) ) ( not ( = ?auto_681209 ?auto_681213 ) ) ( not ( = ?auto_681209 ?auto_681214 ) ) ( not ( = ?auto_681209 ?auto_681215 ) ) ( not ( = ?auto_681209 ?auto_681216 ) ) ( not ( = ?auto_681209 ?auto_681217 ) ) ( not ( = ?auto_681209 ?auto_681218 ) ) ( not ( = ?auto_681210 ?auto_681211 ) ) ( not ( = ?auto_681210 ?auto_681212 ) ) ( not ( = ?auto_681210 ?auto_681213 ) ) ( not ( = ?auto_681210 ?auto_681214 ) ) ( not ( = ?auto_681210 ?auto_681215 ) ) ( not ( = ?auto_681210 ?auto_681216 ) ) ( not ( = ?auto_681210 ?auto_681217 ) ) ( not ( = ?auto_681210 ?auto_681218 ) ) ( not ( = ?auto_681211 ?auto_681212 ) ) ( not ( = ?auto_681211 ?auto_681213 ) ) ( not ( = ?auto_681211 ?auto_681214 ) ) ( not ( = ?auto_681211 ?auto_681215 ) ) ( not ( = ?auto_681211 ?auto_681216 ) ) ( not ( = ?auto_681211 ?auto_681217 ) ) ( not ( = ?auto_681211 ?auto_681218 ) ) ( not ( = ?auto_681212 ?auto_681213 ) ) ( not ( = ?auto_681212 ?auto_681214 ) ) ( not ( = ?auto_681212 ?auto_681215 ) ) ( not ( = ?auto_681212 ?auto_681216 ) ) ( not ( = ?auto_681212 ?auto_681217 ) ) ( not ( = ?auto_681212 ?auto_681218 ) ) ( not ( = ?auto_681213 ?auto_681214 ) ) ( not ( = ?auto_681213 ?auto_681215 ) ) ( not ( = ?auto_681213 ?auto_681216 ) ) ( not ( = ?auto_681213 ?auto_681217 ) ) ( not ( = ?auto_681213 ?auto_681218 ) ) ( not ( = ?auto_681214 ?auto_681215 ) ) ( not ( = ?auto_681214 ?auto_681216 ) ) ( not ( = ?auto_681214 ?auto_681217 ) ) ( not ( = ?auto_681214 ?auto_681218 ) ) ( not ( = ?auto_681215 ?auto_681216 ) ) ( not ( = ?auto_681215 ?auto_681217 ) ) ( not ( = ?auto_681215 ?auto_681218 ) ) ( not ( = ?auto_681216 ?auto_681217 ) ) ( not ( = ?auto_681216 ?auto_681218 ) ) ( not ( = ?auto_681217 ?auto_681218 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_681217 ?auto_681218 )
      ( !STACK ?auto_681217 ?auto_681216 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_681250 - BLOCK
      ?auto_681251 - BLOCK
      ?auto_681252 - BLOCK
      ?auto_681253 - BLOCK
      ?auto_681254 - BLOCK
      ?auto_681255 - BLOCK
      ?auto_681256 - BLOCK
      ?auto_681257 - BLOCK
      ?auto_681258 - BLOCK
      ?auto_681259 - BLOCK
    )
    :vars
    (
      ?auto_681260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_681259 ?auto_681260 ) ( ON-TABLE ?auto_681250 ) ( ON ?auto_681251 ?auto_681250 ) ( ON ?auto_681252 ?auto_681251 ) ( ON ?auto_681253 ?auto_681252 ) ( ON ?auto_681254 ?auto_681253 ) ( ON ?auto_681255 ?auto_681254 ) ( ON ?auto_681256 ?auto_681255 ) ( ON ?auto_681257 ?auto_681256 ) ( not ( = ?auto_681250 ?auto_681251 ) ) ( not ( = ?auto_681250 ?auto_681252 ) ) ( not ( = ?auto_681250 ?auto_681253 ) ) ( not ( = ?auto_681250 ?auto_681254 ) ) ( not ( = ?auto_681250 ?auto_681255 ) ) ( not ( = ?auto_681250 ?auto_681256 ) ) ( not ( = ?auto_681250 ?auto_681257 ) ) ( not ( = ?auto_681250 ?auto_681258 ) ) ( not ( = ?auto_681250 ?auto_681259 ) ) ( not ( = ?auto_681250 ?auto_681260 ) ) ( not ( = ?auto_681251 ?auto_681252 ) ) ( not ( = ?auto_681251 ?auto_681253 ) ) ( not ( = ?auto_681251 ?auto_681254 ) ) ( not ( = ?auto_681251 ?auto_681255 ) ) ( not ( = ?auto_681251 ?auto_681256 ) ) ( not ( = ?auto_681251 ?auto_681257 ) ) ( not ( = ?auto_681251 ?auto_681258 ) ) ( not ( = ?auto_681251 ?auto_681259 ) ) ( not ( = ?auto_681251 ?auto_681260 ) ) ( not ( = ?auto_681252 ?auto_681253 ) ) ( not ( = ?auto_681252 ?auto_681254 ) ) ( not ( = ?auto_681252 ?auto_681255 ) ) ( not ( = ?auto_681252 ?auto_681256 ) ) ( not ( = ?auto_681252 ?auto_681257 ) ) ( not ( = ?auto_681252 ?auto_681258 ) ) ( not ( = ?auto_681252 ?auto_681259 ) ) ( not ( = ?auto_681252 ?auto_681260 ) ) ( not ( = ?auto_681253 ?auto_681254 ) ) ( not ( = ?auto_681253 ?auto_681255 ) ) ( not ( = ?auto_681253 ?auto_681256 ) ) ( not ( = ?auto_681253 ?auto_681257 ) ) ( not ( = ?auto_681253 ?auto_681258 ) ) ( not ( = ?auto_681253 ?auto_681259 ) ) ( not ( = ?auto_681253 ?auto_681260 ) ) ( not ( = ?auto_681254 ?auto_681255 ) ) ( not ( = ?auto_681254 ?auto_681256 ) ) ( not ( = ?auto_681254 ?auto_681257 ) ) ( not ( = ?auto_681254 ?auto_681258 ) ) ( not ( = ?auto_681254 ?auto_681259 ) ) ( not ( = ?auto_681254 ?auto_681260 ) ) ( not ( = ?auto_681255 ?auto_681256 ) ) ( not ( = ?auto_681255 ?auto_681257 ) ) ( not ( = ?auto_681255 ?auto_681258 ) ) ( not ( = ?auto_681255 ?auto_681259 ) ) ( not ( = ?auto_681255 ?auto_681260 ) ) ( not ( = ?auto_681256 ?auto_681257 ) ) ( not ( = ?auto_681256 ?auto_681258 ) ) ( not ( = ?auto_681256 ?auto_681259 ) ) ( not ( = ?auto_681256 ?auto_681260 ) ) ( not ( = ?auto_681257 ?auto_681258 ) ) ( not ( = ?auto_681257 ?auto_681259 ) ) ( not ( = ?auto_681257 ?auto_681260 ) ) ( not ( = ?auto_681258 ?auto_681259 ) ) ( not ( = ?auto_681258 ?auto_681260 ) ) ( not ( = ?auto_681259 ?auto_681260 ) ) ( CLEAR ?auto_681257 ) ( ON ?auto_681258 ?auto_681259 ) ( CLEAR ?auto_681258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_681250 ?auto_681251 ?auto_681252 ?auto_681253 ?auto_681254 ?auto_681255 ?auto_681256 ?auto_681257 ?auto_681258 )
      ( MAKE-10PILE ?auto_681250 ?auto_681251 ?auto_681252 ?auto_681253 ?auto_681254 ?auto_681255 ?auto_681256 ?auto_681257 ?auto_681258 ?auto_681259 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_681292 - BLOCK
      ?auto_681293 - BLOCK
      ?auto_681294 - BLOCK
      ?auto_681295 - BLOCK
      ?auto_681296 - BLOCK
      ?auto_681297 - BLOCK
      ?auto_681298 - BLOCK
      ?auto_681299 - BLOCK
      ?auto_681300 - BLOCK
      ?auto_681301 - BLOCK
    )
    :vars
    (
      ?auto_681302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_681301 ?auto_681302 ) ( ON-TABLE ?auto_681292 ) ( ON ?auto_681293 ?auto_681292 ) ( ON ?auto_681294 ?auto_681293 ) ( ON ?auto_681295 ?auto_681294 ) ( ON ?auto_681296 ?auto_681295 ) ( ON ?auto_681297 ?auto_681296 ) ( ON ?auto_681298 ?auto_681297 ) ( not ( = ?auto_681292 ?auto_681293 ) ) ( not ( = ?auto_681292 ?auto_681294 ) ) ( not ( = ?auto_681292 ?auto_681295 ) ) ( not ( = ?auto_681292 ?auto_681296 ) ) ( not ( = ?auto_681292 ?auto_681297 ) ) ( not ( = ?auto_681292 ?auto_681298 ) ) ( not ( = ?auto_681292 ?auto_681299 ) ) ( not ( = ?auto_681292 ?auto_681300 ) ) ( not ( = ?auto_681292 ?auto_681301 ) ) ( not ( = ?auto_681292 ?auto_681302 ) ) ( not ( = ?auto_681293 ?auto_681294 ) ) ( not ( = ?auto_681293 ?auto_681295 ) ) ( not ( = ?auto_681293 ?auto_681296 ) ) ( not ( = ?auto_681293 ?auto_681297 ) ) ( not ( = ?auto_681293 ?auto_681298 ) ) ( not ( = ?auto_681293 ?auto_681299 ) ) ( not ( = ?auto_681293 ?auto_681300 ) ) ( not ( = ?auto_681293 ?auto_681301 ) ) ( not ( = ?auto_681293 ?auto_681302 ) ) ( not ( = ?auto_681294 ?auto_681295 ) ) ( not ( = ?auto_681294 ?auto_681296 ) ) ( not ( = ?auto_681294 ?auto_681297 ) ) ( not ( = ?auto_681294 ?auto_681298 ) ) ( not ( = ?auto_681294 ?auto_681299 ) ) ( not ( = ?auto_681294 ?auto_681300 ) ) ( not ( = ?auto_681294 ?auto_681301 ) ) ( not ( = ?auto_681294 ?auto_681302 ) ) ( not ( = ?auto_681295 ?auto_681296 ) ) ( not ( = ?auto_681295 ?auto_681297 ) ) ( not ( = ?auto_681295 ?auto_681298 ) ) ( not ( = ?auto_681295 ?auto_681299 ) ) ( not ( = ?auto_681295 ?auto_681300 ) ) ( not ( = ?auto_681295 ?auto_681301 ) ) ( not ( = ?auto_681295 ?auto_681302 ) ) ( not ( = ?auto_681296 ?auto_681297 ) ) ( not ( = ?auto_681296 ?auto_681298 ) ) ( not ( = ?auto_681296 ?auto_681299 ) ) ( not ( = ?auto_681296 ?auto_681300 ) ) ( not ( = ?auto_681296 ?auto_681301 ) ) ( not ( = ?auto_681296 ?auto_681302 ) ) ( not ( = ?auto_681297 ?auto_681298 ) ) ( not ( = ?auto_681297 ?auto_681299 ) ) ( not ( = ?auto_681297 ?auto_681300 ) ) ( not ( = ?auto_681297 ?auto_681301 ) ) ( not ( = ?auto_681297 ?auto_681302 ) ) ( not ( = ?auto_681298 ?auto_681299 ) ) ( not ( = ?auto_681298 ?auto_681300 ) ) ( not ( = ?auto_681298 ?auto_681301 ) ) ( not ( = ?auto_681298 ?auto_681302 ) ) ( not ( = ?auto_681299 ?auto_681300 ) ) ( not ( = ?auto_681299 ?auto_681301 ) ) ( not ( = ?auto_681299 ?auto_681302 ) ) ( not ( = ?auto_681300 ?auto_681301 ) ) ( not ( = ?auto_681300 ?auto_681302 ) ) ( not ( = ?auto_681301 ?auto_681302 ) ) ( ON ?auto_681300 ?auto_681301 ) ( CLEAR ?auto_681298 ) ( ON ?auto_681299 ?auto_681300 ) ( CLEAR ?auto_681299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_681292 ?auto_681293 ?auto_681294 ?auto_681295 ?auto_681296 ?auto_681297 ?auto_681298 ?auto_681299 )
      ( MAKE-10PILE ?auto_681292 ?auto_681293 ?auto_681294 ?auto_681295 ?auto_681296 ?auto_681297 ?auto_681298 ?auto_681299 ?auto_681300 ?auto_681301 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_681334 - BLOCK
      ?auto_681335 - BLOCK
      ?auto_681336 - BLOCK
      ?auto_681337 - BLOCK
      ?auto_681338 - BLOCK
      ?auto_681339 - BLOCK
      ?auto_681340 - BLOCK
      ?auto_681341 - BLOCK
      ?auto_681342 - BLOCK
      ?auto_681343 - BLOCK
    )
    :vars
    (
      ?auto_681344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_681343 ?auto_681344 ) ( ON-TABLE ?auto_681334 ) ( ON ?auto_681335 ?auto_681334 ) ( ON ?auto_681336 ?auto_681335 ) ( ON ?auto_681337 ?auto_681336 ) ( ON ?auto_681338 ?auto_681337 ) ( ON ?auto_681339 ?auto_681338 ) ( not ( = ?auto_681334 ?auto_681335 ) ) ( not ( = ?auto_681334 ?auto_681336 ) ) ( not ( = ?auto_681334 ?auto_681337 ) ) ( not ( = ?auto_681334 ?auto_681338 ) ) ( not ( = ?auto_681334 ?auto_681339 ) ) ( not ( = ?auto_681334 ?auto_681340 ) ) ( not ( = ?auto_681334 ?auto_681341 ) ) ( not ( = ?auto_681334 ?auto_681342 ) ) ( not ( = ?auto_681334 ?auto_681343 ) ) ( not ( = ?auto_681334 ?auto_681344 ) ) ( not ( = ?auto_681335 ?auto_681336 ) ) ( not ( = ?auto_681335 ?auto_681337 ) ) ( not ( = ?auto_681335 ?auto_681338 ) ) ( not ( = ?auto_681335 ?auto_681339 ) ) ( not ( = ?auto_681335 ?auto_681340 ) ) ( not ( = ?auto_681335 ?auto_681341 ) ) ( not ( = ?auto_681335 ?auto_681342 ) ) ( not ( = ?auto_681335 ?auto_681343 ) ) ( not ( = ?auto_681335 ?auto_681344 ) ) ( not ( = ?auto_681336 ?auto_681337 ) ) ( not ( = ?auto_681336 ?auto_681338 ) ) ( not ( = ?auto_681336 ?auto_681339 ) ) ( not ( = ?auto_681336 ?auto_681340 ) ) ( not ( = ?auto_681336 ?auto_681341 ) ) ( not ( = ?auto_681336 ?auto_681342 ) ) ( not ( = ?auto_681336 ?auto_681343 ) ) ( not ( = ?auto_681336 ?auto_681344 ) ) ( not ( = ?auto_681337 ?auto_681338 ) ) ( not ( = ?auto_681337 ?auto_681339 ) ) ( not ( = ?auto_681337 ?auto_681340 ) ) ( not ( = ?auto_681337 ?auto_681341 ) ) ( not ( = ?auto_681337 ?auto_681342 ) ) ( not ( = ?auto_681337 ?auto_681343 ) ) ( not ( = ?auto_681337 ?auto_681344 ) ) ( not ( = ?auto_681338 ?auto_681339 ) ) ( not ( = ?auto_681338 ?auto_681340 ) ) ( not ( = ?auto_681338 ?auto_681341 ) ) ( not ( = ?auto_681338 ?auto_681342 ) ) ( not ( = ?auto_681338 ?auto_681343 ) ) ( not ( = ?auto_681338 ?auto_681344 ) ) ( not ( = ?auto_681339 ?auto_681340 ) ) ( not ( = ?auto_681339 ?auto_681341 ) ) ( not ( = ?auto_681339 ?auto_681342 ) ) ( not ( = ?auto_681339 ?auto_681343 ) ) ( not ( = ?auto_681339 ?auto_681344 ) ) ( not ( = ?auto_681340 ?auto_681341 ) ) ( not ( = ?auto_681340 ?auto_681342 ) ) ( not ( = ?auto_681340 ?auto_681343 ) ) ( not ( = ?auto_681340 ?auto_681344 ) ) ( not ( = ?auto_681341 ?auto_681342 ) ) ( not ( = ?auto_681341 ?auto_681343 ) ) ( not ( = ?auto_681341 ?auto_681344 ) ) ( not ( = ?auto_681342 ?auto_681343 ) ) ( not ( = ?auto_681342 ?auto_681344 ) ) ( not ( = ?auto_681343 ?auto_681344 ) ) ( ON ?auto_681342 ?auto_681343 ) ( ON ?auto_681341 ?auto_681342 ) ( CLEAR ?auto_681339 ) ( ON ?auto_681340 ?auto_681341 ) ( CLEAR ?auto_681340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_681334 ?auto_681335 ?auto_681336 ?auto_681337 ?auto_681338 ?auto_681339 ?auto_681340 )
      ( MAKE-10PILE ?auto_681334 ?auto_681335 ?auto_681336 ?auto_681337 ?auto_681338 ?auto_681339 ?auto_681340 ?auto_681341 ?auto_681342 ?auto_681343 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_681376 - BLOCK
      ?auto_681377 - BLOCK
      ?auto_681378 - BLOCK
      ?auto_681379 - BLOCK
      ?auto_681380 - BLOCK
      ?auto_681381 - BLOCK
      ?auto_681382 - BLOCK
      ?auto_681383 - BLOCK
      ?auto_681384 - BLOCK
      ?auto_681385 - BLOCK
    )
    :vars
    (
      ?auto_681386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_681385 ?auto_681386 ) ( ON-TABLE ?auto_681376 ) ( ON ?auto_681377 ?auto_681376 ) ( ON ?auto_681378 ?auto_681377 ) ( ON ?auto_681379 ?auto_681378 ) ( ON ?auto_681380 ?auto_681379 ) ( not ( = ?auto_681376 ?auto_681377 ) ) ( not ( = ?auto_681376 ?auto_681378 ) ) ( not ( = ?auto_681376 ?auto_681379 ) ) ( not ( = ?auto_681376 ?auto_681380 ) ) ( not ( = ?auto_681376 ?auto_681381 ) ) ( not ( = ?auto_681376 ?auto_681382 ) ) ( not ( = ?auto_681376 ?auto_681383 ) ) ( not ( = ?auto_681376 ?auto_681384 ) ) ( not ( = ?auto_681376 ?auto_681385 ) ) ( not ( = ?auto_681376 ?auto_681386 ) ) ( not ( = ?auto_681377 ?auto_681378 ) ) ( not ( = ?auto_681377 ?auto_681379 ) ) ( not ( = ?auto_681377 ?auto_681380 ) ) ( not ( = ?auto_681377 ?auto_681381 ) ) ( not ( = ?auto_681377 ?auto_681382 ) ) ( not ( = ?auto_681377 ?auto_681383 ) ) ( not ( = ?auto_681377 ?auto_681384 ) ) ( not ( = ?auto_681377 ?auto_681385 ) ) ( not ( = ?auto_681377 ?auto_681386 ) ) ( not ( = ?auto_681378 ?auto_681379 ) ) ( not ( = ?auto_681378 ?auto_681380 ) ) ( not ( = ?auto_681378 ?auto_681381 ) ) ( not ( = ?auto_681378 ?auto_681382 ) ) ( not ( = ?auto_681378 ?auto_681383 ) ) ( not ( = ?auto_681378 ?auto_681384 ) ) ( not ( = ?auto_681378 ?auto_681385 ) ) ( not ( = ?auto_681378 ?auto_681386 ) ) ( not ( = ?auto_681379 ?auto_681380 ) ) ( not ( = ?auto_681379 ?auto_681381 ) ) ( not ( = ?auto_681379 ?auto_681382 ) ) ( not ( = ?auto_681379 ?auto_681383 ) ) ( not ( = ?auto_681379 ?auto_681384 ) ) ( not ( = ?auto_681379 ?auto_681385 ) ) ( not ( = ?auto_681379 ?auto_681386 ) ) ( not ( = ?auto_681380 ?auto_681381 ) ) ( not ( = ?auto_681380 ?auto_681382 ) ) ( not ( = ?auto_681380 ?auto_681383 ) ) ( not ( = ?auto_681380 ?auto_681384 ) ) ( not ( = ?auto_681380 ?auto_681385 ) ) ( not ( = ?auto_681380 ?auto_681386 ) ) ( not ( = ?auto_681381 ?auto_681382 ) ) ( not ( = ?auto_681381 ?auto_681383 ) ) ( not ( = ?auto_681381 ?auto_681384 ) ) ( not ( = ?auto_681381 ?auto_681385 ) ) ( not ( = ?auto_681381 ?auto_681386 ) ) ( not ( = ?auto_681382 ?auto_681383 ) ) ( not ( = ?auto_681382 ?auto_681384 ) ) ( not ( = ?auto_681382 ?auto_681385 ) ) ( not ( = ?auto_681382 ?auto_681386 ) ) ( not ( = ?auto_681383 ?auto_681384 ) ) ( not ( = ?auto_681383 ?auto_681385 ) ) ( not ( = ?auto_681383 ?auto_681386 ) ) ( not ( = ?auto_681384 ?auto_681385 ) ) ( not ( = ?auto_681384 ?auto_681386 ) ) ( not ( = ?auto_681385 ?auto_681386 ) ) ( ON ?auto_681384 ?auto_681385 ) ( ON ?auto_681383 ?auto_681384 ) ( ON ?auto_681382 ?auto_681383 ) ( CLEAR ?auto_681380 ) ( ON ?auto_681381 ?auto_681382 ) ( CLEAR ?auto_681381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_681376 ?auto_681377 ?auto_681378 ?auto_681379 ?auto_681380 ?auto_681381 )
      ( MAKE-10PILE ?auto_681376 ?auto_681377 ?auto_681378 ?auto_681379 ?auto_681380 ?auto_681381 ?auto_681382 ?auto_681383 ?auto_681384 ?auto_681385 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_681418 - BLOCK
      ?auto_681419 - BLOCK
      ?auto_681420 - BLOCK
      ?auto_681421 - BLOCK
      ?auto_681422 - BLOCK
      ?auto_681423 - BLOCK
      ?auto_681424 - BLOCK
      ?auto_681425 - BLOCK
      ?auto_681426 - BLOCK
      ?auto_681427 - BLOCK
    )
    :vars
    (
      ?auto_681428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_681427 ?auto_681428 ) ( ON-TABLE ?auto_681418 ) ( ON ?auto_681419 ?auto_681418 ) ( ON ?auto_681420 ?auto_681419 ) ( ON ?auto_681421 ?auto_681420 ) ( not ( = ?auto_681418 ?auto_681419 ) ) ( not ( = ?auto_681418 ?auto_681420 ) ) ( not ( = ?auto_681418 ?auto_681421 ) ) ( not ( = ?auto_681418 ?auto_681422 ) ) ( not ( = ?auto_681418 ?auto_681423 ) ) ( not ( = ?auto_681418 ?auto_681424 ) ) ( not ( = ?auto_681418 ?auto_681425 ) ) ( not ( = ?auto_681418 ?auto_681426 ) ) ( not ( = ?auto_681418 ?auto_681427 ) ) ( not ( = ?auto_681418 ?auto_681428 ) ) ( not ( = ?auto_681419 ?auto_681420 ) ) ( not ( = ?auto_681419 ?auto_681421 ) ) ( not ( = ?auto_681419 ?auto_681422 ) ) ( not ( = ?auto_681419 ?auto_681423 ) ) ( not ( = ?auto_681419 ?auto_681424 ) ) ( not ( = ?auto_681419 ?auto_681425 ) ) ( not ( = ?auto_681419 ?auto_681426 ) ) ( not ( = ?auto_681419 ?auto_681427 ) ) ( not ( = ?auto_681419 ?auto_681428 ) ) ( not ( = ?auto_681420 ?auto_681421 ) ) ( not ( = ?auto_681420 ?auto_681422 ) ) ( not ( = ?auto_681420 ?auto_681423 ) ) ( not ( = ?auto_681420 ?auto_681424 ) ) ( not ( = ?auto_681420 ?auto_681425 ) ) ( not ( = ?auto_681420 ?auto_681426 ) ) ( not ( = ?auto_681420 ?auto_681427 ) ) ( not ( = ?auto_681420 ?auto_681428 ) ) ( not ( = ?auto_681421 ?auto_681422 ) ) ( not ( = ?auto_681421 ?auto_681423 ) ) ( not ( = ?auto_681421 ?auto_681424 ) ) ( not ( = ?auto_681421 ?auto_681425 ) ) ( not ( = ?auto_681421 ?auto_681426 ) ) ( not ( = ?auto_681421 ?auto_681427 ) ) ( not ( = ?auto_681421 ?auto_681428 ) ) ( not ( = ?auto_681422 ?auto_681423 ) ) ( not ( = ?auto_681422 ?auto_681424 ) ) ( not ( = ?auto_681422 ?auto_681425 ) ) ( not ( = ?auto_681422 ?auto_681426 ) ) ( not ( = ?auto_681422 ?auto_681427 ) ) ( not ( = ?auto_681422 ?auto_681428 ) ) ( not ( = ?auto_681423 ?auto_681424 ) ) ( not ( = ?auto_681423 ?auto_681425 ) ) ( not ( = ?auto_681423 ?auto_681426 ) ) ( not ( = ?auto_681423 ?auto_681427 ) ) ( not ( = ?auto_681423 ?auto_681428 ) ) ( not ( = ?auto_681424 ?auto_681425 ) ) ( not ( = ?auto_681424 ?auto_681426 ) ) ( not ( = ?auto_681424 ?auto_681427 ) ) ( not ( = ?auto_681424 ?auto_681428 ) ) ( not ( = ?auto_681425 ?auto_681426 ) ) ( not ( = ?auto_681425 ?auto_681427 ) ) ( not ( = ?auto_681425 ?auto_681428 ) ) ( not ( = ?auto_681426 ?auto_681427 ) ) ( not ( = ?auto_681426 ?auto_681428 ) ) ( not ( = ?auto_681427 ?auto_681428 ) ) ( ON ?auto_681426 ?auto_681427 ) ( ON ?auto_681425 ?auto_681426 ) ( ON ?auto_681424 ?auto_681425 ) ( ON ?auto_681423 ?auto_681424 ) ( CLEAR ?auto_681421 ) ( ON ?auto_681422 ?auto_681423 ) ( CLEAR ?auto_681422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_681418 ?auto_681419 ?auto_681420 ?auto_681421 ?auto_681422 )
      ( MAKE-10PILE ?auto_681418 ?auto_681419 ?auto_681420 ?auto_681421 ?auto_681422 ?auto_681423 ?auto_681424 ?auto_681425 ?auto_681426 ?auto_681427 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_681460 - BLOCK
      ?auto_681461 - BLOCK
      ?auto_681462 - BLOCK
      ?auto_681463 - BLOCK
      ?auto_681464 - BLOCK
      ?auto_681465 - BLOCK
      ?auto_681466 - BLOCK
      ?auto_681467 - BLOCK
      ?auto_681468 - BLOCK
      ?auto_681469 - BLOCK
    )
    :vars
    (
      ?auto_681470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_681469 ?auto_681470 ) ( ON-TABLE ?auto_681460 ) ( ON ?auto_681461 ?auto_681460 ) ( ON ?auto_681462 ?auto_681461 ) ( not ( = ?auto_681460 ?auto_681461 ) ) ( not ( = ?auto_681460 ?auto_681462 ) ) ( not ( = ?auto_681460 ?auto_681463 ) ) ( not ( = ?auto_681460 ?auto_681464 ) ) ( not ( = ?auto_681460 ?auto_681465 ) ) ( not ( = ?auto_681460 ?auto_681466 ) ) ( not ( = ?auto_681460 ?auto_681467 ) ) ( not ( = ?auto_681460 ?auto_681468 ) ) ( not ( = ?auto_681460 ?auto_681469 ) ) ( not ( = ?auto_681460 ?auto_681470 ) ) ( not ( = ?auto_681461 ?auto_681462 ) ) ( not ( = ?auto_681461 ?auto_681463 ) ) ( not ( = ?auto_681461 ?auto_681464 ) ) ( not ( = ?auto_681461 ?auto_681465 ) ) ( not ( = ?auto_681461 ?auto_681466 ) ) ( not ( = ?auto_681461 ?auto_681467 ) ) ( not ( = ?auto_681461 ?auto_681468 ) ) ( not ( = ?auto_681461 ?auto_681469 ) ) ( not ( = ?auto_681461 ?auto_681470 ) ) ( not ( = ?auto_681462 ?auto_681463 ) ) ( not ( = ?auto_681462 ?auto_681464 ) ) ( not ( = ?auto_681462 ?auto_681465 ) ) ( not ( = ?auto_681462 ?auto_681466 ) ) ( not ( = ?auto_681462 ?auto_681467 ) ) ( not ( = ?auto_681462 ?auto_681468 ) ) ( not ( = ?auto_681462 ?auto_681469 ) ) ( not ( = ?auto_681462 ?auto_681470 ) ) ( not ( = ?auto_681463 ?auto_681464 ) ) ( not ( = ?auto_681463 ?auto_681465 ) ) ( not ( = ?auto_681463 ?auto_681466 ) ) ( not ( = ?auto_681463 ?auto_681467 ) ) ( not ( = ?auto_681463 ?auto_681468 ) ) ( not ( = ?auto_681463 ?auto_681469 ) ) ( not ( = ?auto_681463 ?auto_681470 ) ) ( not ( = ?auto_681464 ?auto_681465 ) ) ( not ( = ?auto_681464 ?auto_681466 ) ) ( not ( = ?auto_681464 ?auto_681467 ) ) ( not ( = ?auto_681464 ?auto_681468 ) ) ( not ( = ?auto_681464 ?auto_681469 ) ) ( not ( = ?auto_681464 ?auto_681470 ) ) ( not ( = ?auto_681465 ?auto_681466 ) ) ( not ( = ?auto_681465 ?auto_681467 ) ) ( not ( = ?auto_681465 ?auto_681468 ) ) ( not ( = ?auto_681465 ?auto_681469 ) ) ( not ( = ?auto_681465 ?auto_681470 ) ) ( not ( = ?auto_681466 ?auto_681467 ) ) ( not ( = ?auto_681466 ?auto_681468 ) ) ( not ( = ?auto_681466 ?auto_681469 ) ) ( not ( = ?auto_681466 ?auto_681470 ) ) ( not ( = ?auto_681467 ?auto_681468 ) ) ( not ( = ?auto_681467 ?auto_681469 ) ) ( not ( = ?auto_681467 ?auto_681470 ) ) ( not ( = ?auto_681468 ?auto_681469 ) ) ( not ( = ?auto_681468 ?auto_681470 ) ) ( not ( = ?auto_681469 ?auto_681470 ) ) ( ON ?auto_681468 ?auto_681469 ) ( ON ?auto_681467 ?auto_681468 ) ( ON ?auto_681466 ?auto_681467 ) ( ON ?auto_681465 ?auto_681466 ) ( ON ?auto_681464 ?auto_681465 ) ( CLEAR ?auto_681462 ) ( ON ?auto_681463 ?auto_681464 ) ( CLEAR ?auto_681463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_681460 ?auto_681461 ?auto_681462 ?auto_681463 )
      ( MAKE-10PILE ?auto_681460 ?auto_681461 ?auto_681462 ?auto_681463 ?auto_681464 ?auto_681465 ?auto_681466 ?auto_681467 ?auto_681468 ?auto_681469 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_681502 - BLOCK
      ?auto_681503 - BLOCK
      ?auto_681504 - BLOCK
      ?auto_681505 - BLOCK
      ?auto_681506 - BLOCK
      ?auto_681507 - BLOCK
      ?auto_681508 - BLOCK
      ?auto_681509 - BLOCK
      ?auto_681510 - BLOCK
      ?auto_681511 - BLOCK
    )
    :vars
    (
      ?auto_681512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_681511 ?auto_681512 ) ( ON-TABLE ?auto_681502 ) ( ON ?auto_681503 ?auto_681502 ) ( not ( = ?auto_681502 ?auto_681503 ) ) ( not ( = ?auto_681502 ?auto_681504 ) ) ( not ( = ?auto_681502 ?auto_681505 ) ) ( not ( = ?auto_681502 ?auto_681506 ) ) ( not ( = ?auto_681502 ?auto_681507 ) ) ( not ( = ?auto_681502 ?auto_681508 ) ) ( not ( = ?auto_681502 ?auto_681509 ) ) ( not ( = ?auto_681502 ?auto_681510 ) ) ( not ( = ?auto_681502 ?auto_681511 ) ) ( not ( = ?auto_681502 ?auto_681512 ) ) ( not ( = ?auto_681503 ?auto_681504 ) ) ( not ( = ?auto_681503 ?auto_681505 ) ) ( not ( = ?auto_681503 ?auto_681506 ) ) ( not ( = ?auto_681503 ?auto_681507 ) ) ( not ( = ?auto_681503 ?auto_681508 ) ) ( not ( = ?auto_681503 ?auto_681509 ) ) ( not ( = ?auto_681503 ?auto_681510 ) ) ( not ( = ?auto_681503 ?auto_681511 ) ) ( not ( = ?auto_681503 ?auto_681512 ) ) ( not ( = ?auto_681504 ?auto_681505 ) ) ( not ( = ?auto_681504 ?auto_681506 ) ) ( not ( = ?auto_681504 ?auto_681507 ) ) ( not ( = ?auto_681504 ?auto_681508 ) ) ( not ( = ?auto_681504 ?auto_681509 ) ) ( not ( = ?auto_681504 ?auto_681510 ) ) ( not ( = ?auto_681504 ?auto_681511 ) ) ( not ( = ?auto_681504 ?auto_681512 ) ) ( not ( = ?auto_681505 ?auto_681506 ) ) ( not ( = ?auto_681505 ?auto_681507 ) ) ( not ( = ?auto_681505 ?auto_681508 ) ) ( not ( = ?auto_681505 ?auto_681509 ) ) ( not ( = ?auto_681505 ?auto_681510 ) ) ( not ( = ?auto_681505 ?auto_681511 ) ) ( not ( = ?auto_681505 ?auto_681512 ) ) ( not ( = ?auto_681506 ?auto_681507 ) ) ( not ( = ?auto_681506 ?auto_681508 ) ) ( not ( = ?auto_681506 ?auto_681509 ) ) ( not ( = ?auto_681506 ?auto_681510 ) ) ( not ( = ?auto_681506 ?auto_681511 ) ) ( not ( = ?auto_681506 ?auto_681512 ) ) ( not ( = ?auto_681507 ?auto_681508 ) ) ( not ( = ?auto_681507 ?auto_681509 ) ) ( not ( = ?auto_681507 ?auto_681510 ) ) ( not ( = ?auto_681507 ?auto_681511 ) ) ( not ( = ?auto_681507 ?auto_681512 ) ) ( not ( = ?auto_681508 ?auto_681509 ) ) ( not ( = ?auto_681508 ?auto_681510 ) ) ( not ( = ?auto_681508 ?auto_681511 ) ) ( not ( = ?auto_681508 ?auto_681512 ) ) ( not ( = ?auto_681509 ?auto_681510 ) ) ( not ( = ?auto_681509 ?auto_681511 ) ) ( not ( = ?auto_681509 ?auto_681512 ) ) ( not ( = ?auto_681510 ?auto_681511 ) ) ( not ( = ?auto_681510 ?auto_681512 ) ) ( not ( = ?auto_681511 ?auto_681512 ) ) ( ON ?auto_681510 ?auto_681511 ) ( ON ?auto_681509 ?auto_681510 ) ( ON ?auto_681508 ?auto_681509 ) ( ON ?auto_681507 ?auto_681508 ) ( ON ?auto_681506 ?auto_681507 ) ( ON ?auto_681505 ?auto_681506 ) ( CLEAR ?auto_681503 ) ( ON ?auto_681504 ?auto_681505 ) ( CLEAR ?auto_681504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_681502 ?auto_681503 ?auto_681504 )
      ( MAKE-10PILE ?auto_681502 ?auto_681503 ?auto_681504 ?auto_681505 ?auto_681506 ?auto_681507 ?auto_681508 ?auto_681509 ?auto_681510 ?auto_681511 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_681544 - BLOCK
      ?auto_681545 - BLOCK
      ?auto_681546 - BLOCK
      ?auto_681547 - BLOCK
      ?auto_681548 - BLOCK
      ?auto_681549 - BLOCK
      ?auto_681550 - BLOCK
      ?auto_681551 - BLOCK
      ?auto_681552 - BLOCK
      ?auto_681553 - BLOCK
    )
    :vars
    (
      ?auto_681554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_681553 ?auto_681554 ) ( ON-TABLE ?auto_681544 ) ( not ( = ?auto_681544 ?auto_681545 ) ) ( not ( = ?auto_681544 ?auto_681546 ) ) ( not ( = ?auto_681544 ?auto_681547 ) ) ( not ( = ?auto_681544 ?auto_681548 ) ) ( not ( = ?auto_681544 ?auto_681549 ) ) ( not ( = ?auto_681544 ?auto_681550 ) ) ( not ( = ?auto_681544 ?auto_681551 ) ) ( not ( = ?auto_681544 ?auto_681552 ) ) ( not ( = ?auto_681544 ?auto_681553 ) ) ( not ( = ?auto_681544 ?auto_681554 ) ) ( not ( = ?auto_681545 ?auto_681546 ) ) ( not ( = ?auto_681545 ?auto_681547 ) ) ( not ( = ?auto_681545 ?auto_681548 ) ) ( not ( = ?auto_681545 ?auto_681549 ) ) ( not ( = ?auto_681545 ?auto_681550 ) ) ( not ( = ?auto_681545 ?auto_681551 ) ) ( not ( = ?auto_681545 ?auto_681552 ) ) ( not ( = ?auto_681545 ?auto_681553 ) ) ( not ( = ?auto_681545 ?auto_681554 ) ) ( not ( = ?auto_681546 ?auto_681547 ) ) ( not ( = ?auto_681546 ?auto_681548 ) ) ( not ( = ?auto_681546 ?auto_681549 ) ) ( not ( = ?auto_681546 ?auto_681550 ) ) ( not ( = ?auto_681546 ?auto_681551 ) ) ( not ( = ?auto_681546 ?auto_681552 ) ) ( not ( = ?auto_681546 ?auto_681553 ) ) ( not ( = ?auto_681546 ?auto_681554 ) ) ( not ( = ?auto_681547 ?auto_681548 ) ) ( not ( = ?auto_681547 ?auto_681549 ) ) ( not ( = ?auto_681547 ?auto_681550 ) ) ( not ( = ?auto_681547 ?auto_681551 ) ) ( not ( = ?auto_681547 ?auto_681552 ) ) ( not ( = ?auto_681547 ?auto_681553 ) ) ( not ( = ?auto_681547 ?auto_681554 ) ) ( not ( = ?auto_681548 ?auto_681549 ) ) ( not ( = ?auto_681548 ?auto_681550 ) ) ( not ( = ?auto_681548 ?auto_681551 ) ) ( not ( = ?auto_681548 ?auto_681552 ) ) ( not ( = ?auto_681548 ?auto_681553 ) ) ( not ( = ?auto_681548 ?auto_681554 ) ) ( not ( = ?auto_681549 ?auto_681550 ) ) ( not ( = ?auto_681549 ?auto_681551 ) ) ( not ( = ?auto_681549 ?auto_681552 ) ) ( not ( = ?auto_681549 ?auto_681553 ) ) ( not ( = ?auto_681549 ?auto_681554 ) ) ( not ( = ?auto_681550 ?auto_681551 ) ) ( not ( = ?auto_681550 ?auto_681552 ) ) ( not ( = ?auto_681550 ?auto_681553 ) ) ( not ( = ?auto_681550 ?auto_681554 ) ) ( not ( = ?auto_681551 ?auto_681552 ) ) ( not ( = ?auto_681551 ?auto_681553 ) ) ( not ( = ?auto_681551 ?auto_681554 ) ) ( not ( = ?auto_681552 ?auto_681553 ) ) ( not ( = ?auto_681552 ?auto_681554 ) ) ( not ( = ?auto_681553 ?auto_681554 ) ) ( ON ?auto_681552 ?auto_681553 ) ( ON ?auto_681551 ?auto_681552 ) ( ON ?auto_681550 ?auto_681551 ) ( ON ?auto_681549 ?auto_681550 ) ( ON ?auto_681548 ?auto_681549 ) ( ON ?auto_681547 ?auto_681548 ) ( ON ?auto_681546 ?auto_681547 ) ( CLEAR ?auto_681544 ) ( ON ?auto_681545 ?auto_681546 ) ( CLEAR ?auto_681545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_681544 ?auto_681545 )
      ( MAKE-10PILE ?auto_681544 ?auto_681545 ?auto_681546 ?auto_681547 ?auto_681548 ?auto_681549 ?auto_681550 ?auto_681551 ?auto_681552 ?auto_681553 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_681586 - BLOCK
      ?auto_681587 - BLOCK
      ?auto_681588 - BLOCK
      ?auto_681589 - BLOCK
      ?auto_681590 - BLOCK
      ?auto_681591 - BLOCK
      ?auto_681592 - BLOCK
      ?auto_681593 - BLOCK
      ?auto_681594 - BLOCK
      ?auto_681595 - BLOCK
    )
    :vars
    (
      ?auto_681596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_681595 ?auto_681596 ) ( not ( = ?auto_681586 ?auto_681587 ) ) ( not ( = ?auto_681586 ?auto_681588 ) ) ( not ( = ?auto_681586 ?auto_681589 ) ) ( not ( = ?auto_681586 ?auto_681590 ) ) ( not ( = ?auto_681586 ?auto_681591 ) ) ( not ( = ?auto_681586 ?auto_681592 ) ) ( not ( = ?auto_681586 ?auto_681593 ) ) ( not ( = ?auto_681586 ?auto_681594 ) ) ( not ( = ?auto_681586 ?auto_681595 ) ) ( not ( = ?auto_681586 ?auto_681596 ) ) ( not ( = ?auto_681587 ?auto_681588 ) ) ( not ( = ?auto_681587 ?auto_681589 ) ) ( not ( = ?auto_681587 ?auto_681590 ) ) ( not ( = ?auto_681587 ?auto_681591 ) ) ( not ( = ?auto_681587 ?auto_681592 ) ) ( not ( = ?auto_681587 ?auto_681593 ) ) ( not ( = ?auto_681587 ?auto_681594 ) ) ( not ( = ?auto_681587 ?auto_681595 ) ) ( not ( = ?auto_681587 ?auto_681596 ) ) ( not ( = ?auto_681588 ?auto_681589 ) ) ( not ( = ?auto_681588 ?auto_681590 ) ) ( not ( = ?auto_681588 ?auto_681591 ) ) ( not ( = ?auto_681588 ?auto_681592 ) ) ( not ( = ?auto_681588 ?auto_681593 ) ) ( not ( = ?auto_681588 ?auto_681594 ) ) ( not ( = ?auto_681588 ?auto_681595 ) ) ( not ( = ?auto_681588 ?auto_681596 ) ) ( not ( = ?auto_681589 ?auto_681590 ) ) ( not ( = ?auto_681589 ?auto_681591 ) ) ( not ( = ?auto_681589 ?auto_681592 ) ) ( not ( = ?auto_681589 ?auto_681593 ) ) ( not ( = ?auto_681589 ?auto_681594 ) ) ( not ( = ?auto_681589 ?auto_681595 ) ) ( not ( = ?auto_681589 ?auto_681596 ) ) ( not ( = ?auto_681590 ?auto_681591 ) ) ( not ( = ?auto_681590 ?auto_681592 ) ) ( not ( = ?auto_681590 ?auto_681593 ) ) ( not ( = ?auto_681590 ?auto_681594 ) ) ( not ( = ?auto_681590 ?auto_681595 ) ) ( not ( = ?auto_681590 ?auto_681596 ) ) ( not ( = ?auto_681591 ?auto_681592 ) ) ( not ( = ?auto_681591 ?auto_681593 ) ) ( not ( = ?auto_681591 ?auto_681594 ) ) ( not ( = ?auto_681591 ?auto_681595 ) ) ( not ( = ?auto_681591 ?auto_681596 ) ) ( not ( = ?auto_681592 ?auto_681593 ) ) ( not ( = ?auto_681592 ?auto_681594 ) ) ( not ( = ?auto_681592 ?auto_681595 ) ) ( not ( = ?auto_681592 ?auto_681596 ) ) ( not ( = ?auto_681593 ?auto_681594 ) ) ( not ( = ?auto_681593 ?auto_681595 ) ) ( not ( = ?auto_681593 ?auto_681596 ) ) ( not ( = ?auto_681594 ?auto_681595 ) ) ( not ( = ?auto_681594 ?auto_681596 ) ) ( not ( = ?auto_681595 ?auto_681596 ) ) ( ON ?auto_681594 ?auto_681595 ) ( ON ?auto_681593 ?auto_681594 ) ( ON ?auto_681592 ?auto_681593 ) ( ON ?auto_681591 ?auto_681592 ) ( ON ?auto_681590 ?auto_681591 ) ( ON ?auto_681589 ?auto_681590 ) ( ON ?auto_681588 ?auto_681589 ) ( ON ?auto_681587 ?auto_681588 ) ( ON ?auto_681586 ?auto_681587 ) ( CLEAR ?auto_681586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_681586 )
      ( MAKE-10PILE ?auto_681586 ?auto_681587 ?auto_681588 ?auto_681589 ?auto_681590 ?auto_681591 ?auto_681592 ?auto_681593 ?auto_681594 ?auto_681595 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_681629 - BLOCK
      ?auto_681630 - BLOCK
      ?auto_681631 - BLOCK
      ?auto_681632 - BLOCK
      ?auto_681633 - BLOCK
      ?auto_681634 - BLOCK
      ?auto_681635 - BLOCK
      ?auto_681636 - BLOCK
      ?auto_681637 - BLOCK
      ?auto_681638 - BLOCK
      ?auto_681639 - BLOCK
    )
    :vars
    (
      ?auto_681640 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_681638 ) ( ON ?auto_681639 ?auto_681640 ) ( CLEAR ?auto_681639 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_681629 ) ( ON ?auto_681630 ?auto_681629 ) ( ON ?auto_681631 ?auto_681630 ) ( ON ?auto_681632 ?auto_681631 ) ( ON ?auto_681633 ?auto_681632 ) ( ON ?auto_681634 ?auto_681633 ) ( ON ?auto_681635 ?auto_681634 ) ( ON ?auto_681636 ?auto_681635 ) ( ON ?auto_681637 ?auto_681636 ) ( ON ?auto_681638 ?auto_681637 ) ( not ( = ?auto_681629 ?auto_681630 ) ) ( not ( = ?auto_681629 ?auto_681631 ) ) ( not ( = ?auto_681629 ?auto_681632 ) ) ( not ( = ?auto_681629 ?auto_681633 ) ) ( not ( = ?auto_681629 ?auto_681634 ) ) ( not ( = ?auto_681629 ?auto_681635 ) ) ( not ( = ?auto_681629 ?auto_681636 ) ) ( not ( = ?auto_681629 ?auto_681637 ) ) ( not ( = ?auto_681629 ?auto_681638 ) ) ( not ( = ?auto_681629 ?auto_681639 ) ) ( not ( = ?auto_681629 ?auto_681640 ) ) ( not ( = ?auto_681630 ?auto_681631 ) ) ( not ( = ?auto_681630 ?auto_681632 ) ) ( not ( = ?auto_681630 ?auto_681633 ) ) ( not ( = ?auto_681630 ?auto_681634 ) ) ( not ( = ?auto_681630 ?auto_681635 ) ) ( not ( = ?auto_681630 ?auto_681636 ) ) ( not ( = ?auto_681630 ?auto_681637 ) ) ( not ( = ?auto_681630 ?auto_681638 ) ) ( not ( = ?auto_681630 ?auto_681639 ) ) ( not ( = ?auto_681630 ?auto_681640 ) ) ( not ( = ?auto_681631 ?auto_681632 ) ) ( not ( = ?auto_681631 ?auto_681633 ) ) ( not ( = ?auto_681631 ?auto_681634 ) ) ( not ( = ?auto_681631 ?auto_681635 ) ) ( not ( = ?auto_681631 ?auto_681636 ) ) ( not ( = ?auto_681631 ?auto_681637 ) ) ( not ( = ?auto_681631 ?auto_681638 ) ) ( not ( = ?auto_681631 ?auto_681639 ) ) ( not ( = ?auto_681631 ?auto_681640 ) ) ( not ( = ?auto_681632 ?auto_681633 ) ) ( not ( = ?auto_681632 ?auto_681634 ) ) ( not ( = ?auto_681632 ?auto_681635 ) ) ( not ( = ?auto_681632 ?auto_681636 ) ) ( not ( = ?auto_681632 ?auto_681637 ) ) ( not ( = ?auto_681632 ?auto_681638 ) ) ( not ( = ?auto_681632 ?auto_681639 ) ) ( not ( = ?auto_681632 ?auto_681640 ) ) ( not ( = ?auto_681633 ?auto_681634 ) ) ( not ( = ?auto_681633 ?auto_681635 ) ) ( not ( = ?auto_681633 ?auto_681636 ) ) ( not ( = ?auto_681633 ?auto_681637 ) ) ( not ( = ?auto_681633 ?auto_681638 ) ) ( not ( = ?auto_681633 ?auto_681639 ) ) ( not ( = ?auto_681633 ?auto_681640 ) ) ( not ( = ?auto_681634 ?auto_681635 ) ) ( not ( = ?auto_681634 ?auto_681636 ) ) ( not ( = ?auto_681634 ?auto_681637 ) ) ( not ( = ?auto_681634 ?auto_681638 ) ) ( not ( = ?auto_681634 ?auto_681639 ) ) ( not ( = ?auto_681634 ?auto_681640 ) ) ( not ( = ?auto_681635 ?auto_681636 ) ) ( not ( = ?auto_681635 ?auto_681637 ) ) ( not ( = ?auto_681635 ?auto_681638 ) ) ( not ( = ?auto_681635 ?auto_681639 ) ) ( not ( = ?auto_681635 ?auto_681640 ) ) ( not ( = ?auto_681636 ?auto_681637 ) ) ( not ( = ?auto_681636 ?auto_681638 ) ) ( not ( = ?auto_681636 ?auto_681639 ) ) ( not ( = ?auto_681636 ?auto_681640 ) ) ( not ( = ?auto_681637 ?auto_681638 ) ) ( not ( = ?auto_681637 ?auto_681639 ) ) ( not ( = ?auto_681637 ?auto_681640 ) ) ( not ( = ?auto_681638 ?auto_681639 ) ) ( not ( = ?auto_681638 ?auto_681640 ) ) ( not ( = ?auto_681639 ?auto_681640 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_681639 ?auto_681640 )
      ( !STACK ?auto_681639 ?auto_681638 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_681675 - BLOCK
      ?auto_681676 - BLOCK
      ?auto_681677 - BLOCK
      ?auto_681678 - BLOCK
      ?auto_681679 - BLOCK
      ?auto_681680 - BLOCK
      ?auto_681681 - BLOCK
      ?auto_681682 - BLOCK
      ?auto_681683 - BLOCK
      ?auto_681684 - BLOCK
      ?auto_681685 - BLOCK
    )
    :vars
    (
      ?auto_681686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_681685 ?auto_681686 ) ( ON-TABLE ?auto_681675 ) ( ON ?auto_681676 ?auto_681675 ) ( ON ?auto_681677 ?auto_681676 ) ( ON ?auto_681678 ?auto_681677 ) ( ON ?auto_681679 ?auto_681678 ) ( ON ?auto_681680 ?auto_681679 ) ( ON ?auto_681681 ?auto_681680 ) ( ON ?auto_681682 ?auto_681681 ) ( ON ?auto_681683 ?auto_681682 ) ( not ( = ?auto_681675 ?auto_681676 ) ) ( not ( = ?auto_681675 ?auto_681677 ) ) ( not ( = ?auto_681675 ?auto_681678 ) ) ( not ( = ?auto_681675 ?auto_681679 ) ) ( not ( = ?auto_681675 ?auto_681680 ) ) ( not ( = ?auto_681675 ?auto_681681 ) ) ( not ( = ?auto_681675 ?auto_681682 ) ) ( not ( = ?auto_681675 ?auto_681683 ) ) ( not ( = ?auto_681675 ?auto_681684 ) ) ( not ( = ?auto_681675 ?auto_681685 ) ) ( not ( = ?auto_681675 ?auto_681686 ) ) ( not ( = ?auto_681676 ?auto_681677 ) ) ( not ( = ?auto_681676 ?auto_681678 ) ) ( not ( = ?auto_681676 ?auto_681679 ) ) ( not ( = ?auto_681676 ?auto_681680 ) ) ( not ( = ?auto_681676 ?auto_681681 ) ) ( not ( = ?auto_681676 ?auto_681682 ) ) ( not ( = ?auto_681676 ?auto_681683 ) ) ( not ( = ?auto_681676 ?auto_681684 ) ) ( not ( = ?auto_681676 ?auto_681685 ) ) ( not ( = ?auto_681676 ?auto_681686 ) ) ( not ( = ?auto_681677 ?auto_681678 ) ) ( not ( = ?auto_681677 ?auto_681679 ) ) ( not ( = ?auto_681677 ?auto_681680 ) ) ( not ( = ?auto_681677 ?auto_681681 ) ) ( not ( = ?auto_681677 ?auto_681682 ) ) ( not ( = ?auto_681677 ?auto_681683 ) ) ( not ( = ?auto_681677 ?auto_681684 ) ) ( not ( = ?auto_681677 ?auto_681685 ) ) ( not ( = ?auto_681677 ?auto_681686 ) ) ( not ( = ?auto_681678 ?auto_681679 ) ) ( not ( = ?auto_681678 ?auto_681680 ) ) ( not ( = ?auto_681678 ?auto_681681 ) ) ( not ( = ?auto_681678 ?auto_681682 ) ) ( not ( = ?auto_681678 ?auto_681683 ) ) ( not ( = ?auto_681678 ?auto_681684 ) ) ( not ( = ?auto_681678 ?auto_681685 ) ) ( not ( = ?auto_681678 ?auto_681686 ) ) ( not ( = ?auto_681679 ?auto_681680 ) ) ( not ( = ?auto_681679 ?auto_681681 ) ) ( not ( = ?auto_681679 ?auto_681682 ) ) ( not ( = ?auto_681679 ?auto_681683 ) ) ( not ( = ?auto_681679 ?auto_681684 ) ) ( not ( = ?auto_681679 ?auto_681685 ) ) ( not ( = ?auto_681679 ?auto_681686 ) ) ( not ( = ?auto_681680 ?auto_681681 ) ) ( not ( = ?auto_681680 ?auto_681682 ) ) ( not ( = ?auto_681680 ?auto_681683 ) ) ( not ( = ?auto_681680 ?auto_681684 ) ) ( not ( = ?auto_681680 ?auto_681685 ) ) ( not ( = ?auto_681680 ?auto_681686 ) ) ( not ( = ?auto_681681 ?auto_681682 ) ) ( not ( = ?auto_681681 ?auto_681683 ) ) ( not ( = ?auto_681681 ?auto_681684 ) ) ( not ( = ?auto_681681 ?auto_681685 ) ) ( not ( = ?auto_681681 ?auto_681686 ) ) ( not ( = ?auto_681682 ?auto_681683 ) ) ( not ( = ?auto_681682 ?auto_681684 ) ) ( not ( = ?auto_681682 ?auto_681685 ) ) ( not ( = ?auto_681682 ?auto_681686 ) ) ( not ( = ?auto_681683 ?auto_681684 ) ) ( not ( = ?auto_681683 ?auto_681685 ) ) ( not ( = ?auto_681683 ?auto_681686 ) ) ( not ( = ?auto_681684 ?auto_681685 ) ) ( not ( = ?auto_681684 ?auto_681686 ) ) ( not ( = ?auto_681685 ?auto_681686 ) ) ( CLEAR ?auto_681683 ) ( ON ?auto_681684 ?auto_681685 ) ( CLEAR ?auto_681684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_681675 ?auto_681676 ?auto_681677 ?auto_681678 ?auto_681679 ?auto_681680 ?auto_681681 ?auto_681682 ?auto_681683 ?auto_681684 )
      ( MAKE-11PILE ?auto_681675 ?auto_681676 ?auto_681677 ?auto_681678 ?auto_681679 ?auto_681680 ?auto_681681 ?auto_681682 ?auto_681683 ?auto_681684 ?auto_681685 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_681721 - BLOCK
      ?auto_681722 - BLOCK
      ?auto_681723 - BLOCK
      ?auto_681724 - BLOCK
      ?auto_681725 - BLOCK
      ?auto_681726 - BLOCK
      ?auto_681727 - BLOCK
      ?auto_681728 - BLOCK
      ?auto_681729 - BLOCK
      ?auto_681730 - BLOCK
      ?auto_681731 - BLOCK
    )
    :vars
    (
      ?auto_681732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_681731 ?auto_681732 ) ( ON-TABLE ?auto_681721 ) ( ON ?auto_681722 ?auto_681721 ) ( ON ?auto_681723 ?auto_681722 ) ( ON ?auto_681724 ?auto_681723 ) ( ON ?auto_681725 ?auto_681724 ) ( ON ?auto_681726 ?auto_681725 ) ( ON ?auto_681727 ?auto_681726 ) ( ON ?auto_681728 ?auto_681727 ) ( not ( = ?auto_681721 ?auto_681722 ) ) ( not ( = ?auto_681721 ?auto_681723 ) ) ( not ( = ?auto_681721 ?auto_681724 ) ) ( not ( = ?auto_681721 ?auto_681725 ) ) ( not ( = ?auto_681721 ?auto_681726 ) ) ( not ( = ?auto_681721 ?auto_681727 ) ) ( not ( = ?auto_681721 ?auto_681728 ) ) ( not ( = ?auto_681721 ?auto_681729 ) ) ( not ( = ?auto_681721 ?auto_681730 ) ) ( not ( = ?auto_681721 ?auto_681731 ) ) ( not ( = ?auto_681721 ?auto_681732 ) ) ( not ( = ?auto_681722 ?auto_681723 ) ) ( not ( = ?auto_681722 ?auto_681724 ) ) ( not ( = ?auto_681722 ?auto_681725 ) ) ( not ( = ?auto_681722 ?auto_681726 ) ) ( not ( = ?auto_681722 ?auto_681727 ) ) ( not ( = ?auto_681722 ?auto_681728 ) ) ( not ( = ?auto_681722 ?auto_681729 ) ) ( not ( = ?auto_681722 ?auto_681730 ) ) ( not ( = ?auto_681722 ?auto_681731 ) ) ( not ( = ?auto_681722 ?auto_681732 ) ) ( not ( = ?auto_681723 ?auto_681724 ) ) ( not ( = ?auto_681723 ?auto_681725 ) ) ( not ( = ?auto_681723 ?auto_681726 ) ) ( not ( = ?auto_681723 ?auto_681727 ) ) ( not ( = ?auto_681723 ?auto_681728 ) ) ( not ( = ?auto_681723 ?auto_681729 ) ) ( not ( = ?auto_681723 ?auto_681730 ) ) ( not ( = ?auto_681723 ?auto_681731 ) ) ( not ( = ?auto_681723 ?auto_681732 ) ) ( not ( = ?auto_681724 ?auto_681725 ) ) ( not ( = ?auto_681724 ?auto_681726 ) ) ( not ( = ?auto_681724 ?auto_681727 ) ) ( not ( = ?auto_681724 ?auto_681728 ) ) ( not ( = ?auto_681724 ?auto_681729 ) ) ( not ( = ?auto_681724 ?auto_681730 ) ) ( not ( = ?auto_681724 ?auto_681731 ) ) ( not ( = ?auto_681724 ?auto_681732 ) ) ( not ( = ?auto_681725 ?auto_681726 ) ) ( not ( = ?auto_681725 ?auto_681727 ) ) ( not ( = ?auto_681725 ?auto_681728 ) ) ( not ( = ?auto_681725 ?auto_681729 ) ) ( not ( = ?auto_681725 ?auto_681730 ) ) ( not ( = ?auto_681725 ?auto_681731 ) ) ( not ( = ?auto_681725 ?auto_681732 ) ) ( not ( = ?auto_681726 ?auto_681727 ) ) ( not ( = ?auto_681726 ?auto_681728 ) ) ( not ( = ?auto_681726 ?auto_681729 ) ) ( not ( = ?auto_681726 ?auto_681730 ) ) ( not ( = ?auto_681726 ?auto_681731 ) ) ( not ( = ?auto_681726 ?auto_681732 ) ) ( not ( = ?auto_681727 ?auto_681728 ) ) ( not ( = ?auto_681727 ?auto_681729 ) ) ( not ( = ?auto_681727 ?auto_681730 ) ) ( not ( = ?auto_681727 ?auto_681731 ) ) ( not ( = ?auto_681727 ?auto_681732 ) ) ( not ( = ?auto_681728 ?auto_681729 ) ) ( not ( = ?auto_681728 ?auto_681730 ) ) ( not ( = ?auto_681728 ?auto_681731 ) ) ( not ( = ?auto_681728 ?auto_681732 ) ) ( not ( = ?auto_681729 ?auto_681730 ) ) ( not ( = ?auto_681729 ?auto_681731 ) ) ( not ( = ?auto_681729 ?auto_681732 ) ) ( not ( = ?auto_681730 ?auto_681731 ) ) ( not ( = ?auto_681730 ?auto_681732 ) ) ( not ( = ?auto_681731 ?auto_681732 ) ) ( ON ?auto_681730 ?auto_681731 ) ( CLEAR ?auto_681728 ) ( ON ?auto_681729 ?auto_681730 ) ( CLEAR ?auto_681729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_681721 ?auto_681722 ?auto_681723 ?auto_681724 ?auto_681725 ?auto_681726 ?auto_681727 ?auto_681728 ?auto_681729 )
      ( MAKE-11PILE ?auto_681721 ?auto_681722 ?auto_681723 ?auto_681724 ?auto_681725 ?auto_681726 ?auto_681727 ?auto_681728 ?auto_681729 ?auto_681730 ?auto_681731 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_681767 - BLOCK
      ?auto_681768 - BLOCK
      ?auto_681769 - BLOCK
      ?auto_681770 - BLOCK
      ?auto_681771 - BLOCK
      ?auto_681772 - BLOCK
      ?auto_681773 - BLOCK
      ?auto_681774 - BLOCK
      ?auto_681775 - BLOCK
      ?auto_681776 - BLOCK
      ?auto_681777 - BLOCK
    )
    :vars
    (
      ?auto_681778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_681777 ?auto_681778 ) ( ON-TABLE ?auto_681767 ) ( ON ?auto_681768 ?auto_681767 ) ( ON ?auto_681769 ?auto_681768 ) ( ON ?auto_681770 ?auto_681769 ) ( ON ?auto_681771 ?auto_681770 ) ( ON ?auto_681772 ?auto_681771 ) ( ON ?auto_681773 ?auto_681772 ) ( not ( = ?auto_681767 ?auto_681768 ) ) ( not ( = ?auto_681767 ?auto_681769 ) ) ( not ( = ?auto_681767 ?auto_681770 ) ) ( not ( = ?auto_681767 ?auto_681771 ) ) ( not ( = ?auto_681767 ?auto_681772 ) ) ( not ( = ?auto_681767 ?auto_681773 ) ) ( not ( = ?auto_681767 ?auto_681774 ) ) ( not ( = ?auto_681767 ?auto_681775 ) ) ( not ( = ?auto_681767 ?auto_681776 ) ) ( not ( = ?auto_681767 ?auto_681777 ) ) ( not ( = ?auto_681767 ?auto_681778 ) ) ( not ( = ?auto_681768 ?auto_681769 ) ) ( not ( = ?auto_681768 ?auto_681770 ) ) ( not ( = ?auto_681768 ?auto_681771 ) ) ( not ( = ?auto_681768 ?auto_681772 ) ) ( not ( = ?auto_681768 ?auto_681773 ) ) ( not ( = ?auto_681768 ?auto_681774 ) ) ( not ( = ?auto_681768 ?auto_681775 ) ) ( not ( = ?auto_681768 ?auto_681776 ) ) ( not ( = ?auto_681768 ?auto_681777 ) ) ( not ( = ?auto_681768 ?auto_681778 ) ) ( not ( = ?auto_681769 ?auto_681770 ) ) ( not ( = ?auto_681769 ?auto_681771 ) ) ( not ( = ?auto_681769 ?auto_681772 ) ) ( not ( = ?auto_681769 ?auto_681773 ) ) ( not ( = ?auto_681769 ?auto_681774 ) ) ( not ( = ?auto_681769 ?auto_681775 ) ) ( not ( = ?auto_681769 ?auto_681776 ) ) ( not ( = ?auto_681769 ?auto_681777 ) ) ( not ( = ?auto_681769 ?auto_681778 ) ) ( not ( = ?auto_681770 ?auto_681771 ) ) ( not ( = ?auto_681770 ?auto_681772 ) ) ( not ( = ?auto_681770 ?auto_681773 ) ) ( not ( = ?auto_681770 ?auto_681774 ) ) ( not ( = ?auto_681770 ?auto_681775 ) ) ( not ( = ?auto_681770 ?auto_681776 ) ) ( not ( = ?auto_681770 ?auto_681777 ) ) ( not ( = ?auto_681770 ?auto_681778 ) ) ( not ( = ?auto_681771 ?auto_681772 ) ) ( not ( = ?auto_681771 ?auto_681773 ) ) ( not ( = ?auto_681771 ?auto_681774 ) ) ( not ( = ?auto_681771 ?auto_681775 ) ) ( not ( = ?auto_681771 ?auto_681776 ) ) ( not ( = ?auto_681771 ?auto_681777 ) ) ( not ( = ?auto_681771 ?auto_681778 ) ) ( not ( = ?auto_681772 ?auto_681773 ) ) ( not ( = ?auto_681772 ?auto_681774 ) ) ( not ( = ?auto_681772 ?auto_681775 ) ) ( not ( = ?auto_681772 ?auto_681776 ) ) ( not ( = ?auto_681772 ?auto_681777 ) ) ( not ( = ?auto_681772 ?auto_681778 ) ) ( not ( = ?auto_681773 ?auto_681774 ) ) ( not ( = ?auto_681773 ?auto_681775 ) ) ( not ( = ?auto_681773 ?auto_681776 ) ) ( not ( = ?auto_681773 ?auto_681777 ) ) ( not ( = ?auto_681773 ?auto_681778 ) ) ( not ( = ?auto_681774 ?auto_681775 ) ) ( not ( = ?auto_681774 ?auto_681776 ) ) ( not ( = ?auto_681774 ?auto_681777 ) ) ( not ( = ?auto_681774 ?auto_681778 ) ) ( not ( = ?auto_681775 ?auto_681776 ) ) ( not ( = ?auto_681775 ?auto_681777 ) ) ( not ( = ?auto_681775 ?auto_681778 ) ) ( not ( = ?auto_681776 ?auto_681777 ) ) ( not ( = ?auto_681776 ?auto_681778 ) ) ( not ( = ?auto_681777 ?auto_681778 ) ) ( ON ?auto_681776 ?auto_681777 ) ( ON ?auto_681775 ?auto_681776 ) ( CLEAR ?auto_681773 ) ( ON ?auto_681774 ?auto_681775 ) ( CLEAR ?auto_681774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_681767 ?auto_681768 ?auto_681769 ?auto_681770 ?auto_681771 ?auto_681772 ?auto_681773 ?auto_681774 )
      ( MAKE-11PILE ?auto_681767 ?auto_681768 ?auto_681769 ?auto_681770 ?auto_681771 ?auto_681772 ?auto_681773 ?auto_681774 ?auto_681775 ?auto_681776 ?auto_681777 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_681813 - BLOCK
      ?auto_681814 - BLOCK
      ?auto_681815 - BLOCK
      ?auto_681816 - BLOCK
      ?auto_681817 - BLOCK
      ?auto_681818 - BLOCK
      ?auto_681819 - BLOCK
      ?auto_681820 - BLOCK
      ?auto_681821 - BLOCK
      ?auto_681822 - BLOCK
      ?auto_681823 - BLOCK
    )
    :vars
    (
      ?auto_681824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_681823 ?auto_681824 ) ( ON-TABLE ?auto_681813 ) ( ON ?auto_681814 ?auto_681813 ) ( ON ?auto_681815 ?auto_681814 ) ( ON ?auto_681816 ?auto_681815 ) ( ON ?auto_681817 ?auto_681816 ) ( ON ?auto_681818 ?auto_681817 ) ( not ( = ?auto_681813 ?auto_681814 ) ) ( not ( = ?auto_681813 ?auto_681815 ) ) ( not ( = ?auto_681813 ?auto_681816 ) ) ( not ( = ?auto_681813 ?auto_681817 ) ) ( not ( = ?auto_681813 ?auto_681818 ) ) ( not ( = ?auto_681813 ?auto_681819 ) ) ( not ( = ?auto_681813 ?auto_681820 ) ) ( not ( = ?auto_681813 ?auto_681821 ) ) ( not ( = ?auto_681813 ?auto_681822 ) ) ( not ( = ?auto_681813 ?auto_681823 ) ) ( not ( = ?auto_681813 ?auto_681824 ) ) ( not ( = ?auto_681814 ?auto_681815 ) ) ( not ( = ?auto_681814 ?auto_681816 ) ) ( not ( = ?auto_681814 ?auto_681817 ) ) ( not ( = ?auto_681814 ?auto_681818 ) ) ( not ( = ?auto_681814 ?auto_681819 ) ) ( not ( = ?auto_681814 ?auto_681820 ) ) ( not ( = ?auto_681814 ?auto_681821 ) ) ( not ( = ?auto_681814 ?auto_681822 ) ) ( not ( = ?auto_681814 ?auto_681823 ) ) ( not ( = ?auto_681814 ?auto_681824 ) ) ( not ( = ?auto_681815 ?auto_681816 ) ) ( not ( = ?auto_681815 ?auto_681817 ) ) ( not ( = ?auto_681815 ?auto_681818 ) ) ( not ( = ?auto_681815 ?auto_681819 ) ) ( not ( = ?auto_681815 ?auto_681820 ) ) ( not ( = ?auto_681815 ?auto_681821 ) ) ( not ( = ?auto_681815 ?auto_681822 ) ) ( not ( = ?auto_681815 ?auto_681823 ) ) ( not ( = ?auto_681815 ?auto_681824 ) ) ( not ( = ?auto_681816 ?auto_681817 ) ) ( not ( = ?auto_681816 ?auto_681818 ) ) ( not ( = ?auto_681816 ?auto_681819 ) ) ( not ( = ?auto_681816 ?auto_681820 ) ) ( not ( = ?auto_681816 ?auto_681821 ) ) ( not ( = ?auto_681816 ?auto_681822 ) ) ( not ( = ?auto_681816 ?auto_681823 ) ) ( not ( = ?auto_681816 ?auto_681824 ) ) ( not ( = ?auto_681817 ?auto_681818 ) ) ( not ( = ?auto_681817 ?auto_681819 ) ) ( not ( = ?auto_681817 ?auto_681820 ) ) ( not ( = ?auto_681817 ?auto_681821 ) ) ( not ( = ?auto_681817 ?auto_681822 ) ) ( not ( = ?auto_681817 ?auto_681823 ) ) ( not ( = ?auto_681817 ?auto_681824 ) ) ( not ( = ?auto_681818 ?auto_681819 ) ) ( not ( = ?auto_681818 ?auto_681820 ) ) ( not ( = ?auto_681818 ?auto_681821 ) ) ( not ( = ?auto_681818 ?auto_681822 ) ) ( not ( = ?auto_681818 ?auto_681823 ) ) ( not ( = ?auto_681818 ?auto_681824 ) ) ( not ( = ?auto_681819 ?auto_681820 ) ) ( not ( = ?auto_681819 ?auto_681821 ) ) ( not ( = ?auto_681819 ?auto_681822 ) ) ( not ( = ?auto_681819 ?auto_681823 ) ) ( not ( = ?auto_681819 ?auto_681824 ) ) ( not ( = ?auto_681820 ?auto_681821 ) ) ( not ( = ?auto_681820 ?auto_681822 ) ) ( not ( = ?auto_681820 ?auto_681823 ) ) ( not ( = ?auto_681820 ?auto_681824 ) ) ( not ( = ?auto_681821 ?auto_681822 ) ) ( not ( = ?auto_681821 ?auto_681823 ) ) ( not ( = ?auto_681821 ?auto_681824 ) ) ( not ( = ?auto_681822 ?auto_681823 ) ) ( not ( = ?auto_681822 ?auto_681824 ) ) ( not ( = ?auto_681823 ?auto_681824 ) ) ( ON ?auto_681822 ?auto_681823 ) ( ON ?auto_681821 ?auto_681822 ) ( ON ?auto_681820 ?auto_681821 ) ( CLEAR ?auto_681818 ) ( ON ?auto_681819 ?auto_681820 ) ( CLEAR ?auto_681819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_681813 ?auto_681814 ?auto_681815 ?auto_681816 ?auto_681817 ?auto_681818 ?auto_681819 )
      ( MAKE-11PILE ?auto_681813 ?auto_681814 ?auto_681815 ?auto_681816 ?auto_681817 ?auto_681818 ?auto_681819 ?auto_681820 ?auto_681821 ?auto_681822 ?auto_681823 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_681859 - BLOCK
      ?auto_681860 - BLOCK
      ?auto_681861 - BLOCK
      ?auto_681862 - BLOCK
      ?auto_681863 - BLOCK
      ?auto_681864 - BLOCK
      ?auto_681865 - BLOCK
      ?auto_681866 - BLOCK
      ?auto_681867 - BLOCK
      ?auto_681868 - BLOCK
      ?auto_681869 - BLOCK
    )
    :vars
    (
      ?auto_681870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_681869 ?auto_681870 ) ( ON-TABLE ?auto_681859 ) ( ON ?auto_681860 ?auto_681859 ) ( ON ?auto_681861 ?auto_681860 ) ( ON ?auto_681862 ?auto_681861 ) ( ON ?auto_681863 ?auto_681862 ) ( not ( = ?auto_681859 ?auto_681860 ) ) ( not ( = ?auto_681859 ?auto_681861 ) ) ( not ( = ?auto_681859 ?auto_681862 ) ) ( not ( = ?auto_681859 ?auto_681863 ) ) ( not ( = ?auto_681859 ?auto_681864 ) ) ( not ( = ?auto_681859 ?auto_681865 ) ) ( not ( = ?auto_681859 ?auto_681866 ) ) ( not ( = ?auto_681859 ?auto_681867 ) ) ( not ( = ?auto_681859 ?auto_681868 ) ) ( not ( = ?auto_681859 ?auto_681869 ) ) ( not ( = ?auto_681859 ?auto_681870 ) ) ( not ( = ?auto_681860 ?auto_681861 ) ) ( not ( = ?auto_681860 ?auto_681862 ) ) ( not ( = ?auto_681860 ?auto_681863 ) ) ( not ( = ?auto_681860 ?auto_681864 ) ) ( not ( = ?auto_681860 ?auto_681865 ) ) ( not ( = ?auto_681860 ?auto_681866 ) ) ( not ( = ?auto_681860 ?auto_681867 ) ) ( not ( = ?auto_681860 ?auto_681868 ) ) ( not ( = ?auto_681860 ?auto_681869 ) ) ( not ( = ?auto_681860 ?auto_681870 ) ) ( not ( = ?auto_681861 ?auto_681862 ) ) ( not ( = ?auto_681861 ?auto_681863 ) ) ( not ( = ?auto_681861 ?auto_681864 ) ) ( not ( = ?auto_681861 ?auto_681865 ) ) ( not ( = ?auto_681861 ?auto_681866 ) ) ( not ( = ?auto_681861 ?auto_681867 ) ) ( not ( = ?auto_681861 ?auto_681868 ) ) ( not ( = ?auto_681861 ?auto_681869 ) ) ( not ( = ?auto_681861 ?auto_681870 ) ) ( not ( = ?auto_681862 ?auto_681863 ) ) ( not ( = ?auto_681862 ?auto_681864 ) ) ( not ( = ?auto_681862 ?auto_681865 ) ) ( not ( = ?auto_681862 ?auto_681866 ) ) ( not ( = ?auto_681862 ?auto_681867 ) ) ( not ( = ?auto_681862 ?auto_681868 ) ) ( not ( = ?auto_681862 ?auto_681869 ) ) ( not ( = ?auto_681862 ?auto_681870 ) ) ( not ( = ?auto_681863 ?auto_681864 ) ) ( not ( = ?auto_681863 ?auto_681865 ) ) ( not ( = ?auto_681863 ?auto_681866 ) ) ( not ( = ?auto_681863 ?auto_681867 ) ) ( not ( = ?auto_681863 ?auto_681868 ) ) ( not ( = ?auto_681863 ?auto_681869 ) ) ( not ( = ?auto_681863 ?auto_681870 ) ) ( not ( = ?auto_681864 ?auto_681865 ) ) ( not ( = ?auto_681864 ?auto_681866 ) ) ( not ( = ?auto_681864 ?auto_681867 ) ) ( not ( = ?auto_681864 ?auto_681868 ) ) ( not ( = ?auto_681864 ?auto_681869 ) ) ( not ( = ?auto_681864 ?auto_681870 ) ) ( not ( = ?auto_681865 ?auto_681866 ) ) ( not ( = ?auto_681865 ?auto_681867 ) ) ( not ( = ?auto_681865 ?auto_681868 ) ) ( not ( = ?auto_681865 ?auto_681869 ) ) ( not ( = ?auto_681865 ?auto_681870 ) ) ( not ( = ?auto_681866 ?auto_681867 ) ) ( not ( = ?auto_681866 ?auto_681868 ) ) ( not ( = ?auto_681866 ?auto_681869 ) ) ( not ( = ?auto_681866 ?auto_681870 ) ) ( not ( = ?auto_681867 ?auto_681868 ) ) ( not ( = ?auto_681867 ?auto_681869 ) ) ( not ( = ?auto_681867 ?auto_681870 ) ) ( not ( = ?auto_681868 ?auto_681869 ) ) ( not ( = ?auto_681868 ?auto_681870 ) ) ( not ( = ?auto_681869 ?auto_681870 ) ) ( ON ?auto_681868 ?auto_681869 ) ( ON ?auto_681867 ?auto_681868 ) ( ON ?auto_681866 ?auto_681867 ) ( ON ?auto_681865 ?auto_681866 ) ( CLEAR ?auto_681863 ) ( ON ?auto_681864 ?auto_681865 ) ( CLEAR ?auto_681864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_681859 ?auto_681860 ?auto_681861 ?auto_681862 ?auto_681863 ?auto_681864 )
      ( MAKE-11PILE ?auto_681859 ?auto_681860 ?auto_681861 ?auto_681862 ?auto_681863 ?auto_681864 ?auto_681865 ?auto_681866 ?auto_681867 ?auto_681868 ?auto_681869 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_681905 - BLOCK
      ?auto_681906 - BLOCK
      ?auto_681907 - BLOCK
      ?auto_681908 - BLOCK
      ?auto_681909 - BLOCK
      ?auto_681910 - BLOCK
      ?auto_681911 - BLOCK
      ?auto_681912 - BLOCK
      ?auto_681913 - BLOCK
      ?auto_681914 - BLOCK
      ?auto_681915 - BLOCK
    )
    :vars
    (
      ?auto_681916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_681915 ?auto_681916 ) ( ON-TABLE ?auto_681905 ) ( ON ?auto_681906 ?auto_681905 ) ( ON ?auto_681907 ?auto_681906 ) ( ON ?auto_681908 ?auto_681907 ) ( not ( = ?auto_681905 ?auto_681906 ) ) ( not ( = ?auto_681905 ?auto_681907 ) ) ( not ( = ?auto_681905 ?auto_681908 ) ) ( not ( = ?auto_681905 ?auto_681909 ) ) ( not ( = ?auto_681905 ?auto_681910 ) ) ( not ( = ?auto_681905 ?auto_681911 ) ) ( not ( = ?auto_681905 ?auto_681912 ) ) ( not ( = ?auto_681905 ?auto_681913 ) ) ( not ( = ?auto_681905 ?auto_681914 ) ) ( not ( = ?auto_681905 ?auto_681915 ) ) ( not ( = ?auto_681905 ?auto_681916 ) ) ( not ( = ?auto_681906 ?auto_681907 ) ) ( not ( = ?auto_681906 ?auto_681908 ) ) ( not ( = ?auto_681906 ?auto_681909 ) ) ( not ( = ?auto_681906 ?auto_681910 ) ) ( not ( = ?auto_681906 ?auto_681911 ) ) ( not ( = ?auto_681906 ?auto_681912 ) ) ( not ( = ?auto_681906 ?auto_681913 ) ) ( not ( = ?auto_681906 ?auto_681914 ) ) ( not ( = ?auto_681906 ?auto_681915 ) ) ( not ( = ?auto_681906 ?auto_681916 ) ) ( not ( = ?auto_681907 ?auto_681908 ) ) ( not ( = ?auto_681907 ?auto_681909 ) ) ( not ( = ?auto_681907 ?auto_681910 ) ) ( not ( = ?auto_681907 ?auto_681911 ) ) ( not ( = ?auto_681907 ?auto_681912 ) ) ( not ( = ?auto_681907 ?auto_681913 ) ) ( not ( = ?auto_681907 ?auto_681914 ) ) ( not ( = ?auto_681907 ?auto_681915 ) ) ( not ( = ?auto_681907 ?auto_681916 ) ) ( not ( = ?auto_681908 ?auto_681909 ) ) ( not ( = ?auto_681908 ?auto_681910 ) ) ( not ( = ?auto_681908 ?auto_681911 ) ) ( not ( = ?auto_681908 ?auto_681912 ) ) ( not ( = ?auto_681908 ?auto_681913 ) ) ( not ( = ?auto_681908 ?auto_681914 ) ) ( not ( = ?auto_681908 ?auto_681915 ) ) ( not ( = ?auto_681908 ?auto_681916 ) ) ( not ( = ?auto_681909 ?auto_681910 ) ) ( not ( = ?auto_681909 ?auto_681911 ) ) ( not ( = ?auto_681909 ?auto_681912 ) ) ( not ( = ?auto_681909 ?auto_681913 ) ) ( not ( = ?auto_681909 ?auto_681914 ) ) ( not ( = ?auto_681909 ?auto_681915 ) ) ( not ( = ?auto_681909 ?auto_681916 ) ) ( not ( = ?auto_681910 ?auto_681911 ) ) ( not ( = ?auto_681910 ?auto_681912 ) ) ( not ( = ?auto_681910 ?auto_681913 ) ) ( not ( = ?auto_681910 ?auto_681914 ) ) ( not ( = ?auto_681910 ?auto_681915 ) ) ( not ( = ?auto_681910 ?auto_681916 ) ) ( not ( = ?auto_681911 ?auto_681912 ) ) ( not ( = ?auto_681911 ?auto_681913 ) ) ( not ( = ?auto_681911 ?auto_681914 ) ) ( not ( = ?auto_681911 ?auto_681915 ) ) ( not ( = ?auto_681911 ?auto_681916 ) ) ( not ( = ?auto_681912 ?auto_681913 ) ) ( not ( = ?auto_681912 ?auto_681914 ) ) ( not ( = ?auto_681912 ?auto_681915 ) ) ( not ( = ?auto_681912 ?auto_681916 ) ) ( not ( = ?auto_681913 ?auto_681914 ) ) ( not ( = ?auto_681913 ?auto_681915 ) ) ( not ( = ?auto_681913 ?auto_681916 ) ) ( not ( = ?auto_681914 ?auto_681915 ) ) ( not ( = ?auto_681914 ?auto_681916 ) ) ( not ( = ?auto_681915 ?auto_681916 ) ) ( ON ?auto_681914 ?auto_681915 ) ( ON ?auto_681913 ?auto_681914 ) ( ON ?auto_681912 ?auto_681913 ) ( ON ?auto_681911 ?auto_681912 ) ( ON ?auto_681910 ?auto_681911 ) ( CLEAR ?auto_681908 ) ( ON ?auto_681909 ?auto_681910 ) ( CLEAR ?auto_681909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_681905 ?auto_681906 ?auto_681907 ?auto_681908 ?auto_681909 )
      ( MAKE-11PILE ?auto_681905 ?auto_681906 ?auto_681907 ?auto_681908 ?auto_681909 ?auto_681910 ?auto_681911 ?auto_681912 ?auto_681913 ?auto_681914 ?auto_681915 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_681951 - BLOCK
      ?auto_681952 - BLOCK
      ?auto_681953 - BLOCK
      ?auto_681954 - BLOCK
      ?auto_681955 - BLOCK
      ?auto_681956 - BLOCK
      ?auto_681957 - BLOCK
      ?auto_681958 - BLOCK
      ?auto_681959 - BLOCK
      ?auto_681960 - BLOCK
      ?auto_681961 - BLOCK
    )
    :vars
    (
      ?auto_681962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_681961 ?auto_681962 ) ( ON-TABLE ?auto_681951 ) ( ON ?auto_681952 ?auto_681951 ) ( ON ?auto_681953 ?auto_681952 ) ( not ( = ?auto_681951 ?auto_681952 ) ) ( not ( = ?auto_681951 ?auto_681953 ) ) ( not ( = ?auto_681951 ?auto_681954 ) ) ( not ( = ?auto_681951 ?auto_681955 ) ) ( not ( = ?auto_681951 ?auto_681956 ) ) ( not ( = ?auto_681951 ?auto_681957 ) ) ( not ( = ?auto_681951 ?auto_681958 ) ) ( not ( = ?auto_681951 ?auto_681959 ) ) ( not ( = ?auto_681951 ?auto_681960 ) ) ( not ( = ?auto_681951 ?auto_681961 ) ) ( not ( = ?auto_681951 ?auto_681962 ) ) ( not ( = ?auto_681952 ?auto_681953 ) ) ( not ( = ?auto_681952 ?auto_681954 ) ) ( not ( = ?auto_681952 ?auto_681955 ) ) ( not ( = ?auto_681952 ?auto_681956 ) ) ( not ( = ?auto_681952 ?auto_681957 ) ) ( not ( = ?auto_681952 ?auto_681958 ) ) ( not ( = ?auto_681952 ?auto_681959 ) ) ( not ( = ?auto_681952 ?auto_681960 ) ) ( not ( = ?auto_681952 ?auto_681961 ) ) ( not ( = ?auto_681952 ?auto_681962 ) ) ( not ( = ?auto_681953 ?auto_681954 ) ) ( not ( = ?auto_681953 ?auto_681955 ) ) ( not ( = ?auto_681953 ?auto_681956 ) ) ( not ( = ?auto_681953 ?auto_681957 ) ) ( not ( = ?auto_681953 ?auto_681958 ) ) ( not ( = ?auto_681953 ?auto_681959 ) ) ( not ( = ?auto_681953 ?auto_681960 ) ) ( not ( = ?auto_681953 ?auto_681961 ) ) ( not ( = ?auto_681953 ?auto_681962 ) ) ( not ( = ?auto_681954 ?auto_681955 ) ) ( not ( = ?auto_681954 ?auto_681956 ) ) ( not ( = ?auto_681954 ?auto_681957 ) ) ( not ( = ?auto_681954 ?auto_681958 ) ) ( not ( = ?auto_681954 ?auto_681959 ) ) ( not ( = ?auto_681954 ?auto_681960 ) ) ( not ( = ?auto_681954 ?auto_681961 ) ) ( not ( = ?auto_681954 ?auto_681962 ) ) ( not ( = ?auto_681955 ?auto_681956 ) ) ( not ( = ?auto_681955 ?auto_681957 ) ) ( not ( = ?auto_681955 ?auto_681958 ) ) ( not ( = ?auto_681955 ?auto_681959 ) ) ( not ( = ?auto_681955 ?auto_681960 ) ) ( not ( = ?auto_681955 ?auto_681961 ) ) ( not ( = ?auto_681955 ?auto_681962 ) ) ( not ( = ?auto_681956 ?auto_681957 ) ) ( not ( = ?auto_681956 ?auto_681958 ) ) ( not ( = ?auto_681956 ?auto_681959 ) ) ( not ( = ?auto_681956 ?auto_681960 ) ) ( not ( = ?auto_681956 ?auto_681961 ) ) ( not ( = ?auto_681956 ?auto_681962 ) ) ( not ( = ?auto_681957 ?auto_681958 ) ) ( not ( = ?auto_681957 ?auto_681959 ) ) ( not ( = ?auto_681957 ?auto_681960 ) ) ( not ( = ?auto_681957 ?auto_681961 ) ) ( not ( = ?auto_681957 ?auto_681962 ) ) ( not ( = ?auto_681958 ?auto_681959 ) ) ( not ( = ?auto_681958 ?auto_681960 ) ) ( not ( = ?auto_681958 ?auto_681961 ) ) ( not ( = ?auto_681958 ?auto_681962 ) ) ( not ( = ?auto_681959 ?auto_681960 ) ) ( not ( = ?auto_681959 ?auto_681961 ) ) ( not ( = ?auto_681959 ?auto_681962 ) ) ( not ( = ?auto_681960 ?auto_681961 ) ) ( not ( = ?auto_681960 ?auto_681962 ) ) ( not ( = ?auto_681961 ?auto_681962 ) ) ( ON ?auto_681960 ?auto_681961 ) ( ON ?auto_681959 ?auto_681960 ) ( ON ?auto_681958 ?auto_681959 ) ( ON ?auto_681957 ?auto_681958 ) ( ON ?auto_681956 ?auto_681957 ) ( ON ?auto_681955 ?auto_681956 ) ( CLEAR ?auto_681953 ) ( ON ?auto_681954 ?auto_681955 ) ( CLEAR ?auto_681954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_681951 ?auto_681952 ?auto_681953 ?auto_681954 )
      ( MAKE-11PILE ?auto_681951 ?auto_681952 ?auto_681953 ?auto_681954 ?auto_681955 ?auto_681956 ?auto_681957 ?auto_681958 ?auto_681959 ?auto_681960 ?auto_681961 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_681997 - BLOCK
      ?auto_681998 - BLOCK
      ?auto_681999 - BLOCK
      ?auto_682000 - BLOCK
      ?auto_682001 - BLOCK
      ?auto_682002 - BLOCK
      ?auto_682003 - BLOCK
      ?auto_682004 - BLOCK
      ?auto_682005 - BLOCK
      ?auto_682006 - BLOCK
      ?auto_682007 - BLOCK
    )
    :vars
    (
      ?auto_682008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_682007 ?auto_682008 ) ( ON-TABLE ?auto_681997 ) ( ON ?auto_681998 ?auto_681997 ) ( not ( = ?auto_681997 ?auto_681998 ) ) ( not ( = ?auto_681997 ?auto_681999 ) ) ( not ( = ?auto_681997 ?auto_682000 ) ) ( not ( = ?auto_681997 ?auto_682001 ) ) ( not ( = ?auto_681997 ?auto_682002 ) ) ( not ( = ?auto_681997 ?auto_682003 ) ) ( not ( = ?auto_681997 ?auto_682004 ) ) ( not ( = ?auto_681997 ?auto_682005 ) ) ( not ( = ?auto_681997 ?auto_682006 ) ) ( not ( = ?auto_681997 ?auto_682007 ) ) ( not ( = ?auto_681997 ?auto_682008 ) ) ( not ( = ?auto_681998 ?auto_681999 ) ) ( not ( = ?auto_681998 ?auto_682000 ) ) ( not ( = ?auto_681998 ?auto_682001 ) ) ( not ( = ?auto_681998 ?auto_682002 ) ) ( not ( = ?auto_681998 ?auto_682003 ) ) ( not ( = ?auto_681998 ?auto_682004 ) ) ( not ( = ?auto_681998 ?auto_682005 ) ) ( not ( = ?auto_681998 ?auto_682006 ) ) ( not ( = ?auto_681998 ?auto_682007 ) ) ( not ( = ?auto_681998 ?auto_682008 ) ) ( not ( = ?auto_681999 ?auto_682000 ) ) ( not ( = ?auto_681999 ?auto_682001 ) ) ( not ( = ?auto_681999 ?auto_682002 ) ) ( not ( = ?auto_681999 ?auto_682003 ) ) ( not ( = ?auto_681999 ?auto_682004 ) ) ( not ( = ?auto_681999 ?auto_682005 ) ) ( not ( = ?auto_681999 ?auto_682006 ) ) ( not ( = ?auto_681999 ?auto_682007 ) ) ( not ( = ?auto_681999 ?auto_682008 ) ) ( not ( = ?auto_682000 ?auto_682001 ) ) ( not ( = ?auto_682000 ?auto_682002 ) ) ( not ( = ?auto_682000 ?auto_682003 ) ) ( not ( = ?auto_682000 ?auto_682004 ) ) ( not ( = ?auto_682000 ?auto_682005 ) ) ( not ( = ?auto_682000 ?auto_682006 ) ) ( not ( = ?auto_682000 ?auto_682007 ) ) ( not ( = ?auto_682000 ?auto_682008 ) ) ( not ( = ?auto_682001 ?auto_682002 ) ) ( not ( = ?auto_682001 ?auto_682003 ) ) ( not ( = ?auto_682001 ?auto_682004 ) ) ( not ( = ?auto_682001 ?auto_682005 ) ) ( not ( = ?auto_682001 ?auto_682006 ) ) ( not ( = ?auto_682001 ?auto_682007 ) ) ( not ( = ?auto_682001 ?auto_682008 ) ) ( not ( = ?auto_682002 ?auto_682003 ) ) ( not ( = ?auto_682002 ?auto_682004 ) ) ( not ( = ?auto_682002 ?auto_682005 ) ) ( not ( = ?auto_682002 ?auto_682006 ) ) ( not ( = ?auto_682002 ?auto_682007 ) ) ( not ( = ?auto_682002 ?auto_682008 ) ) ( not ( = ?auto_682003 ?auto_682004 ) ) ( not ( = ?auto_682003 ?auto_682005 ) ) ( not ( = ?auto_682003 ?auto_682006 ) ) ( not ( = ?auto_682003 ?auto_682007 ) ) ( not ( = ?auto_682003 ?auto_682008 ) ) ( not ( = ?auto_682004 ?auto_682005 ) ) ( not ( = ?auto_682004 ?auto_682006 ) ) ( not ( = ?auto_682004 ?auto_682007 ) ) ( not ( = ?auto_682004 ?auto_682008 ) ) ( not ( = ?auto_682005 ?auto_682006 ) ) ( not ( = ?auto_682005 ?auto_682007 ) ) ( not ( = ?auto_682005 ?auto_682008 ) ) ( not ( = ?auto_682006 ?auto_682007 ) ) ( not ( = ?auto_682006 ?auto_682008 ) ) ( not ( = ?auto_682007 ?auto_682008 ) ) ( ON ?auto_682006 ?auto_682007 ) ( ON ?auto_682005 ?auto_682006 ) ( ON ?auto_682004 ?auto_682005 ) ( ON ?auto_682003 ?auto_682004 ) ( ON ?auto_682002 ?auto_682003 ) ( ON ?auto_682001 ?auto_682002 ) ( ON ?auto_682000 ?auto_682001 ) ( CLEAR ?auto_681998 ) ( ON ?auto_681999 ?auto_682000 ) ( CLEAR ?auto_681999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_681997 ?auto_681998 ?auto_681999 )
      ( MAKE-11PILE ?auto_681997 ?auto_681998 ?auto_681999 ?auto_682000 ?auto_682001 ?auto_682002 ?auto_682003 ?auto_682004 ?auto_682005 ?auto_682006 ?auto_682007 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_682043 - BLOCK
      ?auto_682044 - BLOCK
      ?auto_682045 - BLOCK
      ?auto_682046 - BLOCK
      ?auto_682047 - BLOCK
      ?auto_682048 - BLOCK
      ?auto_682049 - BLOCK
      ?auto_682050 - BLOCK
      ?auto_682051 - BLOCK
      ?auto_682052 - BLOCK
      ?auto_682053 - BLOCK
    )
    :vars
    (
      ?auto_682054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_682053 ?auto_682054 ) ( ON-TABLE ?auto_682043 ) ( not ( = ?auto_682043 ?auto_682044 ) ) ( not ( = ?auto_682043 ?auto_682045 ) ) ( not ( = ?auto_682043 ?auto_682046 ) ) ( not ( = ?auto_682043 ?auto_682047 ) ) ( not ( = ?auto_682043 ?auto_682048 ) ) ( not ( = ?auto_682043 ?auto_682049 ) ) ( not ( = ?auto_682043 ?auto_682050 ) ) ( not ( = ?auto_682043 ?auto_682051 ) ) ( not ( = ?auto_682043 ?auto_682052 ) ) ( not ( = ?auto_682043 ?auto_682053 ) ) ( not ( = ?auto_682043 ?auto_682054 ) ) ( not ( = ?auto_682044 ?auto_682045 ) ) ( not ( = ?auto_682044 ?auto_682046 ) ) ( not ( = ?auto_682044 ?auto_682047 ) ) ( not ( = ?auto_682044 ?auto_682048 ) ) ( not ( = ?auto_682044 ?auto_682049 ) ) ( not ( = ?auto_682044 ?auto_682050 ) ) ( not ( = ?auto_682044 ?auto_682051 ) ) ( not ( = ?auto_682044 ?auto_682052 ) ) ( not ( = ?auto_682044 ?auto_682053 ) ) ( not ( = ?auto_682044 ?auto_682054 ) ) ( not ( = ?auto_682045 ?auto_682046 ) ) ( not ( = ?auto_682045 ?auto_682047 ) ) ( not ( = ?auto_682045 ?auto_682048 ) ) ( not ( = ?auto_682045 ?auto_682049 ) ) ( not ( = ?auto_682045 ?auto_682050 ) ) ( not ( = ?auto_682045 ?auto_682051 ) ) ( not ( = ?auto_682045 ?auto_682052 ) ) ( not ( = ?auto_682045 ?auto_682053 ) ) ( not ( = ?auto_682045 ?auto_682054 ) ) ( not ( = ?auto_682046 ?auto_682047 ) ) ( not ( = ?auto_682046 ?auto_682048 ) ) ( not ( = ?auto_682046 ?auto_682049 ) ) ( not ( = ?auto_682046 ?auto_682050 ) ) ( not ( = ?auto_682046 ?auto_682051 ) ) ( not ( = ?auto_682046 ?auto_682052 ) ) ( not ( = ?auto_682046 ?auto_682053 ) ) ( not ( = ?auto_682046 ?auto_682054 ) ) ( not ( = ?auto_682047 ?auto_682048 ) ) ( not ( = ?auto_682047 ?auto_682049 ) ) ( not ( = ?auto_682047 ?auto_682050 ) ) ( not ( = ?auto_682047 ?auto_682051 ) ) ( not ( = ?auto_682047 ?auto_682052 ) ) ( not ( = ?auto_682047 ?auto_682053 ) ) ( not ( = ?auto_682047 ?auto_682054 ) ) ( not ( = ?auto_682048 ?auto_682049 ) ) ( not ( = ?auto_682048 ?auto_682050 ) ) ( not ( = ?auto_682048 ?auto_682051 ) ) ( not ( = ?auto_682048 ?auto_682052 ) ) ( not ( = ?auto_682048 ?auto_682053 ) ) ( not ( = ?auto_682048 ?auto_682054 ) ) ( not ( = ?auto_682049 ?auto_682050 ) ) ( not ( = ?auto_682049 ?auto_682051 ) ) ( not ( = ?auto_682049 ?auto_682052 ) ) ( not ( = ?auto_682049 ?auto_682053 ) ) ( not ( = ?auto_682049 ?auto_682054 ) ) ( not ( = ?auto_682050 ?auto_682051 ) ) ( not ( = ?auto_682050 ?auto_682052 ) ) ( not ( = ?auto_682050 ?auto_682053 ) ) ( not ( = ?auto_682050 ?auto_682054 ) ) ( not ( = ?auto_682051 ?auto_682052 ) ) ( not ( = ?auto_682051 ?auto_682053 ) ) ( not ( = ?auto_682051 ?auto_682054 ) ) ( not ( = ?auto_682052 ?auto_682053 ) ) ( not ( = ?auto_682052 ?auto_682054 ) ) ( not ( = ?auto_682053 ?auto_682054 ) ) ( ON ?auto_682052 ?auto_682053 ) ( ON ?auto_682051 ?auto_682052 ) ( ON ?auto_682050 ?auto_682051 ) ( ON ?auto_682049 ?auto_682050 ) ( ON ?auto_682048 ?auto_682049 ) ( ON ?auto_682047 ?auto_682048 ) ( ON ?auto_682046 ?auto_682047 ) ( ON ?auto_682045 ?auto_682046 ) ( CLEAR ?auto_682043 ) ( ON ?auto_682044 ?auto_682045 ) ( CLEAR ?auto_682044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_682043 ?auto_682044 )
      ( MAKE-11PILE ?auto_682043 ?auto_682044 ?auto_682045 ?auto_682046 ?auto_682047 ?auto_682048 ?auto_682049 ?auto_682050 ?auto_682051 ?auto_682052 ?auto_682053 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_682089 - BLOCK
      ?auto_682090 - BLOCK
      ?auto_682091 - BLOCK
      ?auto_682092 - BLOCK
      ?auto_682093 - BLOCK
      ?auto_682094 - BLOCK
      ?auto_682095 - BLOCK
      ?auto_682096 - BLOCK
      ?auto_682097 - BLOCK
      ?auto_682098 - BLOCK
      ?auto_682099 - BLOCK
    )
    :vars
    (
      ?auto_682100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_682099 ?auto_682100 ) ( not ( = ?auto_682089 ?auto_682090 ) ) ( not ( = ?auto_682089 ?auto_682091 ) ) ( not ( = ?auto_682089 ?auto_682092 ) ) ( not ( = ?auto_682089 ?auto_682093 ) ) ( not ( = ?auto_682089 ?auto_682094 ) ) ( not ( = ?auto_682089 ?auto_682095 ) ) ( not ( = ?auto_682089 ?auto_682096 ) ) ( not ( = ?auto_682089 ?auto_682097 ) ) ( not ( = ?auto_682089 ?auto_682098 ) ) ( not ( = ?auto_682089 ?auto_682099 ) ) ( not ( = ?auto_682089 ?auto_682100 ) ) ( not ( = ?auto_682090 ?auto_682091 ) ) ( not ( = ?auto_682090 ?auto_682092 ) ) ( not ( = ?auto_682090 ?auto_682093 ) ) ( not ( = ?auto_682090 ?auto_682094 ) ) ( not ( = ?auto_682090 ?auto_682095 ) ) ( not ( = ?auto_682090 ?auto_682096 ) ) ( not ( = ?auto_682090 ?auto_682097 ) ) ( not ( = ?auto_682090 ?auto_682098 ) ) ( not ( = ?auto_682090 ?auto_682099 ) ) ( not ( = ?auto_682090 ?auto_682100 ) ) ( not ( = ?auto_682091 ?auto_682092 ) ) ( not ( = ?auto_682091 ?auto_682093 ) ) ( not ( = ?auto_682091 ?auto_682094 ) ) ( not ( = ?auto_682091 ?auto_682095 ) ) ( not ( = ?auto_682091 ?auto_682096 ) ) ( not ( = ?auto_682091 ?auto_682097 ) ) ( not ( = ?auto_682091 ?auto_682098 ) ) ( not ( = ?auto_682091 ?auto_682099 ) ) ( not ( = ?auto_682091 ?auto_682100 ) ) ( not ( = ?auto_682092 ?auto_682093 ) ) ( not ( = ?auto_682092 ?auto_682094 ) ) ( not ( = ?auto_682092 ?auto_682095 ) ) ( not ( = ?auto_682092 ?auto_682096 ) ) ( not ( = ?auto_682092 ?auto_682097 ) ) ( not ( = ?auto_682092 ?auto_682098 ) ) ( not ( = ?auto_682092 ?auto_682099 ) ) ( not ( = ?auto_682092 ?auto_682100 ) ) ( not ( = ?auto_682093 ?auto_682094 ) ) ( not ( = ?auto_682093 ?auto_682095 ) ) ( not ( = ?auto_682093 ?auto_682096 ) ) ( not ( = ?auto_682093 ?auto_682097 ) ) ( not ( = ?auto_682093 ?auto_682098 ) ) ( not ( = ?auto_682093 ?auto_682099 ) ) ( not ( = ?auto_682093 ?auto_682100 ) ) ( not ( = ?auto_682094 ?auto_682095 ) ) ( not ( = ?auto_682094 ?auto_682096 ) ) ( not ( = ?auto_682094 ?auto_682097 ) ) ( not ( = ?auto_682094 ?auto_682098 ) ) ( not ( = ?auto_682094 ?auto_682099 ) ) ( not ( = ?auto_682094 ?auto_682100 ) ) ( not ( = ?auto_682095 ?auto_682096 ) ) ( not ( = ?auto_682095 ?auto_682097 ) ) ( not ( = ?auto_682095 ?auto_682098 ) ) ( not ( = ?auto_682095 ?auto_682099 ) ) ( not ( = ?auto_682095 ?auto_682100 ) ) ( not ( = ?auto_682096 ?auto_682097 ) ) ( not ( = ?auto_682096 ?auto_682098 ) ) ( not ( = ?auto_682096 ?auto_682099 ) ) ( not ( = ?auto_682096 ?auto_682100 ) ) ( not ( = ?auto_682097 ?auto_682098 ) ) ( not ( = ?auto_682097 ?auto_682099 ) ) ( not ( = ?auto_682097 ?auto_682100 ) ) ( not ( = ?auto_682098 ?auto_682099 ) ) ( not ( = ?auto_682098 ?auto_682100 ) ) ( not ( = ?auto_682099 ?auto_682100 ) ) ( ON ?auto_682098 ?auto_682099 ) ( ON ?auto_682097 ?auto_682098 ) ( ON ?auto_682096 ?auto_682097 ) ( ON ?auto_682095 ?auto_682096 ) ( ON ?auto_682094 ?auto_682095 ) ( ON ?auto_682093 ?auto_682094 ) ( ON ?auto_682092 ?auto_682093 ) ( ON ?auto_682091 ?auto_682092 ) ( ON ?auto_682090 ?auto_682091 ) ( ON ?auto_682089 ?auto_682090 ) ( CLEAR ?auto_682089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_682089 )
      ( MAKE-11PILE ?auto_682089 ?auto_682090 ?auto_682091 ?auto_682092 ?auto_682093 ?auto_682094 ?auto_682095 ?auto_682096 ?auto_682097 ?auto_682098 ?auto_682099 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_682136 - BLOCK
      ?auto_682137 - BLOCK
      ?auto_682138 - BLOCK
      ?auto_682139 - BLOCK
      ?auto_682140 - BLOCK
      ?auto_682141 - BLOCK
      ?auto_682142 - BLOCK
      ?auto_682143 - BLOCK
      ?auto_682144 - BLOCK
      ?auto_682145 - BLOCK
      ?auto_682146 - BLOCK
      ?auto_682147 - BLOCK
    )
    :vars
    (
      ?auto_682148 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_682146 ) ( ON ?auto_682147 ?auto_682148 ) ( CLEAR ?auto_682147 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_682136 ) ( ON ?auto_682137 ?auto_682136 ) ( ON ?auto_682138 ?auto_682137 ) ( ON ?auto_682139 ?auto_682138 ) ( ON ?auto_682140 ?auto_682139 ) ( ON ?auto_682141 ?auto_682140 ) ( ON ?auto_682142 ?auto_682141 ) ( ON ?auto_682143 ?auto_682142 ) ( ON ?auto_682144 ?auto_682143 ) ( ON ?auto_682145 ?auto_682144 ) ( ON ?auto_682146 ?auto_682145 ) ( not ( = ?auto_682136 ?auto_682137 ) ) ( not ( = ?auto_682136 ?auto_682138 ) ) ( not ( = ?auto_682136 ?auto_682139 ) ) ( not ( = ?auto_682136 ?auto_682140 ) ) ( not ( = ?auto_682136 ?auto_682141 ) ) ( not ( = ?auto_682136 ?auto_682142 ) ) ( not ( = ?auto_682136 ?auto_682143 ) ) ( not ( = ?auto_682136 ?auto_682144 ) ) ( not ( = ?auto_682136 ?auto_682145 ) ) ( not ( = ?auto_682136 ?auto_682146 ) ) ( not ( = ?auto_682136 ?auto_682147 ) ) ( not ( = ?auto_682136 ?auto_682148 ) ) ( not ( = ?auto_682137 ?auto_682138 ) ) ( not ( = ?auto_682137 ?auto_682139 ) ) ( not ( = ?auto_682137 ?auto_682140 ) ) ( not ( = ?auto_682137 ?auto_682141 ) ) ( not ( = ?auto_682137 ?auto_682142 ) ) ( not ( = ?auto_682137 ?auto_682143 ) ) ( not ( = ?auto_682137 ?auto_682144 ) ) ( not ( = ?auto_682137 ?auto_682145 ) ) ( not ( = ?auto_682137 ?auto_682146 ) ) ( not ( = ?auto_682137 ?auto_682147 ) ) ( not ( = ?auto_682137 ?auto_682148 ) ) ( not ( = ?auto_682138 ?auto_682139 ) ) ( not ( = ?auto_682138 ?auto_682140 ) ) ( not ( = ?auto_682138 ?auto_682141 ) ) ( not ( = ?auto_682138 ?auto_682142 ) ) ( not ( = ?auto_682138 ?auto_682143 ) ) ( not ( = ?auto_682138 ?auto_682144 ) ) ( not ( = ?auto_682138 ?auto_682145 ) ) ( not ( = ?auto_682138 ?auto_682146 ) ) ( not ( = ?auto_682138 ?auto_682147 ) ) ( not ( = ?auto_682138 ?auto_682148 ) ) ( not ( = ?auto_682139 ?auto_682140 ) ) ( not ( = ?auto_682139 ?auto_682141 ) ) ( not ( = ?auto_682139 ?auto_682142 ) ) ( not ( = ?auto_682139 ?auto_682143 ) ) ( not ( = ?auto_682139 ?auto_682144 ) ) ( not ( = ?auto_682139 ?auto_682145 ) ) ( not ( = ?auto_682139 ?auto_682146 ) ) ( not ( = ?auto_682139 ?auto_682147 ) ) ( not ( = ?auto_682139 ?auto_682148 ) ) ( not ( = ?auto_682140 ?auto_682141 ) ) ( not ( = ?auto_682140 ?auto_682142 ) ) ( not ( = ?auto_682140 ?auto_682143 ) ) ( not ( = ?auto_682140 ?auto_682144 ) ) ( not ( = ?auto_682140 ?auto_682145 ) ) ( not ( = ?auto_682140 ?auto_682146 ) ) ( not ( = ?auto_682140 ?auto_682147 ) ) ( not ( = ?auto_682140 ?auto_682148 ) ) ( not ( = ?auto_682141 ?auto_682142 ) ) ( not ( = ?auto_682141 ?auto_682143 ) ) ( not ( = ?auto_682141 ?auto_682144 ) ) ( not ( = ?auto_682141 ?auto_682145 ) ) ( not ( = ?auto_682141 ?auto_682146 ) ) ( not ( = ?auto_682141 ?auto_682147 ) ) ( not ( = ?auto_682141 ?auto_682148 ) ) ( not ( = ?auto_682142 ?auto_682143 ) ) ( not ( = ?auto_682142 ?auto_682144 ) ) ( not ( = ?auto_682142 ?auto_682145 ) ) ( not ( = ?auto_682142 ?auto_682146 ) ) ( not ( = ?auto_682142 ?auto_682147 ) ) ( not ( = ?auto_682142 ?auto_682148 ) ) ( not ( = ?auto_682143 ?auto_682144 ) ) ( not ( = ?auto_682143 ?auto_682145 ) ) ( not ( = ?auto_682143 ?auto_682146 ) ) ( not ( = ?auto_682143 ?auto_682147 ) ) ( not ( = ?auto_682143 ?auto_682148 ) ) ( not ( = ?auto_682144 ?auto_682145 ) ) ( not ( = ?auto_682144 ?auto_682146 ) ) ( not ( = ?auto_682144 ?auto_682147 ) ) ( not ( = ?auto_682144 ?auto_682148 ) ) ( not ( = ?auto_682145 ?auto_682146 ) ) ( not ( = ?auto_682145 ?auto_682147 ) ) ( not ( = ?auto_682145 ?auto_682148 ) ) ( not ( = ?auto_682146 ?auto_682147 ) ) ( not ( = ?auto_682146 ?auto_682148 ) ) ( not ( = ?auto_682147 ?auto_682148 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_682147 ?auto_682148 )
      ( !STACK ?auto_682147 ?auto_682146 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_682186 - BLOCK
      ?auto_682187 - BLOCK
      ?auto_682188 - BLOCK
      ?auto_682189 - BLOCK
      ?auto_682190 - BLOCK
      ?auto_682191 - BLOCK
      ?auto_682192 - BLOCK
      ?auto_682193 - BLOCK
      ?auto_682194 - BLOCK
      ?auto_682195 - BLOCK
      ?auto_682196 - BLOCK
      ?auto_682197 - BLOCK
    )
    :vars
    (
      ?auto_682198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_682197 ?auto_682198 ) ( ON-TABLE ?auto_682186 ) ( ON ?auto_682187 ?auto_682186 ) ( ON ?auto_682188 ?auto_682187 ) ( ON ?auto_682189 ?auto_682188 ) ( ON ?auto_682190 ?auto_682189 ) ( ON ?auto_682191 ?auto_682190 ) ( ON ?auto_682192 ?auto_682191 ) ( ON ?auto_682193 ?auto_682192 ) ( ON ?auto_682194 ?auto_682193 ) ( ON ?auto_682195 ?auto_682194 ) ( not ( = ?auto_682186 ?auto_682187 ) ) ( not ( = ?auto_682186 ?auto_682188 ) ) ( not ( = ?auto_682186 ?auto_682189 ) ) ( not ( = ?auto_682186 ?auto_682190 ) ) ( not ( = ?auto_682186 ?auto_682191 ) ) ( not ( = ?auto_682186 ?auto_682192 ) ) ( not ( = ?auto_682186 ?auto_682193 ) ) ( not ( = ?auto_682186 ?auto_682194 ) ) ( not ( = ?auto_682186 ?auto_682195 ) ) ( not ( = ?auto_682186 ?auto_682196 ) ) ( not ( = ?auto_682186 ?auto_682197 ) ) ( not ( = ?auto_682186 ?auto_682198 ) ) ( not ( = ?auto_682187 ?auto_682188 ) ) ( not ( = ?auto_682187 ?auto_682189 ) ) ( not ( = ?auto_682187 ?auto_682190 ) ) ( not ( = ?auto_682187 ?auto_682191 ) ) ( not ( = ?auto_682187 ?auto_682192 ) ) ( not ( = ?auto_682187 ?auto_682193 ) ) ( not ( = ?auto_682187 ?auto_682194 ) ) ( not ( = ?auto_682187 ?auto_682195 ) ) ( not ( = ?auto_682187 ?auto_682196 ) ) ( not ( = ?auto_682187 ?auto_682197 ) ) ( not ( = ?auto_682187 ?auto_682198 ) ) ( not ( = ?auto_682188 ?auto_682189 ) ) ( not ( = ?auto_682188 ?auto_682190 ) ) ( not ( = ?auto_682188 ?auto_682191 ) ) ( not ( = ?auto_682188 ?auto_682192 ) ) ( not ( = ?auto_682188 ?auto_682193 ) ) ( not ( = ?auto_682188 ?auto_682194 ) ) ( not ( = ?auto_682188 ?auto_682195 ) ) ( not ( = ?auto_682188 ?auto_682196 ) ) ( not ( = ?auto_682188 ?auto_682197 ) ) ( not ( = ?auto_682188 ?auto_682198 ) ) ( not ( = ?auto_682189 ?auto_682190 ) ) ( not ( = ?auto_682189 ?auto_682191 ) ) ( not ( = ?auto_682189 ?auto_682192 ) ) ( not ( = ?auto_682189 ?auto_682193 ) ) ( not ( = ?auto_682189 ?auto_682194 ) ) ( not ( = ?auto_682189 ?auto_682195 ) ) ( not ( = ?auto_682189 ?auto_682196 ) ) ( not ( = ?auto_682189 ?auto_682197 ) ) ( not ( = ?auto_682189 ?auto_682198 ) ) ( not ( = ?auto_682190 ?auto_682191 ) ) ( not ( = ?auto_682190 ?auto_682192 ) ) ( not ( = ?auto_682190 ?auto_682193 ) ) ( not ( = ?auto_682190 ?auto_682194 ) ) ( not ( = ?auto_682190 ?auto_682195 ) ) ( not ( = ?auto_682190 ?auto_682196 ) ) ( not ( = ?auto_682190 ?auto_682197 ) ) ( not ( = ?auto_682190 ?auto_682198 ) ) ( not ( = ?auto_682191 ?auto_682192 ) ) ( not ( = ?auto_682191 ?auto_682193 ) ) ( not ( = ?auto_682191 ?auto_682194 ) ) ( not ( = ?auto_682191 ?auto_682195 ) ) ( not ( = ?auto_682191 ?auto_682196 ) ) ( not ( = ?auto_682191 ?auto_682197 ) ) ( not ( = ?auto_682191 ?auto_682198 ) ) ( not ( = ?auto_682192 ?auto_682193 ) ) ( not ( = ?auto_682192 ?auto_682194 ) ) ( not ( = ?auto_682192 ?auto_682195 ) ) ( not ( = ?auto_682192 ?auto_682196 ) ) ( not ( = ?auto_682192 ?auto_682197 ) ) ( not ( = ?auto_682192 ?auto_682198 ) ) ( not ( = ?auto_682193 ?auto_682194 ) ) ( not ( = ?auto_682193 ?auto_682195 ) ) ( not ( = ?auto_682193 ?auto_682196 ) ) ( not ( = ?auto_682193 ?auto_682197 ) ) ( not ( = ?auto_682193 ?auto_682198 ) ) ( not ( = ?auto_682194 ?auto_682195 ) ) ( not ( = ?auto_682194 ?auto_682196 ) ) ( not ( = ?auto_682194 ?auto_682197 ) ) ( not ( = ?auto_682194 ?auto_682198 ) ) ( not ( = ?auto_682195 ?auto_682196 ) ) ( not ( = ?auto_682195 ?auto_682197 ) ) ( not ( = ?auto_682195 ?auto_682198 ) ) ( not ( = ?auto_682196 ?auto_682197 ) ) ( not ( = ?auto_682196 ?auto_682198 ) ) ( not ( = ?auto_682197 ?auto_682198 ) ) ( CLEAR ?auto_682195 ) ( ON ?auto_682196 ?auto_682197 ) ( CLEAR ?auto_682196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_682186 ?auto_682187 ?auto_682188 ?auto_682189 ?auto_682190 ?auto_682191 ?auto_682192 ?auto_682193 ?auto_682194 ?auto_682195 ?auto_682196 )
      ( MAKE-12PILE ?auto_682186 ?auto_682187 ?auto_682188 ?auto_682189 ?auto_682190 ?auto_682191 ?auto_682192 ?auto_682193 ?auto_682194 ?auto_682195 ?auto_682196 ?auto_682197 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_682236 - BLOCK
      ?auto_682237 - BLOCK
      ?auto_682238 - BLOCK
      ?auto_682239 - BLOCK
      ?auto_682240 - BLOCK
      ?auto_682241 - BLOCK
      ?auto_682242 - BLOCK
      ?auto_682243 - BLOCK
      ?auto_682244 - BLOCK
      ?auto_682245 - BLOCK
      ?auto_682246 - BLOCK
      ?auto_682247 - BLOCK
    )
    :vars
    (
      ?auto_682248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_682247 ?auto_682248 ) ( ON-TABLE ?auto_682236 ) ( ON ?auto_682237 ?auto_682236 ) ( ON ?auto_682238 ?auto_682237 ) ( ON ?auto_682239 ?auto_682238 ) ( ON ?auto_682240 ?auto_682239 ) ( ON ?auto_682241 ?auto_682240 ) ( ON ?auto_682242 ?auto_682241 ) ( ON ?auto_682243 ?auto_682242 ) ( ON ?auto_682244 ?auto_682243 ) ( not ( = ?auto_682236 ?auto_682237 ) ) ( not ( = ?auto_682236 ?auto_682238 ) ) ( not ( = ?auto_682236 ?auto_682239 ) ) ( not ( = ?auto_682236 ?auto_682240 ) ) ( not ( = ?auto_682236 ?auto_682241 ) ) ( not ( = ?auto_682236 ?auto_682242 ) ) ( not ( = ?auto_682236 ?auto_682243 ) ) ( not ( = ?auto_682236 ?auto_682244 ) ) ( not ( = ?auto_682236 ?auto_682245 ) ) ( not ( = ?auto_682236 ?auto_682246 ) ) ( not ( = ?auto_682236 ?auto_682247 ) ) ( not ( = ?auto_682236 ?auto_682248 ) ) ( not ( = ?auto_682237 ?auto_682238 ) ) ( not ( = ?auto_682237 ?auto_682239 ) ) ( not ( = ?auto_682237 ?auto_682240 ) ) ( not ( = ?auto_682237 ?auto_682241 ) ) ( not ( = ?auto_682237 ?auto_682242 ) ) ( not ( = ?auto_682237 ?auto_682243 ) ) ( not ( = ?auto_682237 ?auto_682244 ) ) ( not ( = ?auto_682237 ?auto_682245 ) ) ( not ( = ?auto_682237 ?auto_682246 ) ) ( not ( = ?auto_682237 ?auto_682247 ) ) ( not ( = ?auto_682237 ?auto_682248 ) ) ( not ( = ?auto_682238 ?auto_682239 ) ) ( not ( = ?auto_682238 ?auto_682240 ) ) ( not ( = ?auto_682238 ?auto_682241 ) ) ( not ( = ?auto_682238 ?auto_682242 ) ) ( not ( = ?auto_682238 ?auto_682243 ) ) ( not ( = ?auto_682238 ?auto_682244 ) ) ( not ( = ?auto_682238 ?auto_682245 ) ) ( not ( = ?auto_682238 ?auto_682246 ) ) ( not ( = ?auto_682238 ?auto_682247 ) ) ( not ( = ?auto_682238 ?auto_682248 ) ) ( not ( = ?auto_682239 ?auto_682240 ) ) ( not ( = ?auto_682239 ?auto_682241 ) ) ( not ( = ?auto_682239 ?auto_682242 ) ) ( not ( = ?auto_682239 ?auto_682243 ) ) ( not ( = ?auto_682239 ?auto_682244 ) ) ( not ( = ?auto_682239 ?auto_682245 ) ) ( not ( = ?auto_682239 ?auto_682246 ) ) ( not ( = ?auto_682239 ?auto_682247 ) ) ( not ( = ?auto_682239 ?auto_682248 ) ) ( not ( = ?auto_682240 ?auto_682241 ) ) ( not ( = ?auto_682240 ?auto_682242 ) ) ( not ( = ?auto_682240 ?auto_682243 ) ) ( not ( = ?auto_682240 ?auto_682244 ) ) ( not ( = ?auto_682240 ?auto_682245 ) ) ( not ( = ?auto_682240 ?auto_682246 ) ) ( not ( = ?auto_682240 ?auto_682247 ) ) ( not ( = ?auto_682240 ?auto_682248 ) ) ( not ( = ?auto_682241 ?auto_682242 ) ) ( not ( = ?auto_682241 ?auto_682243 ) ) ( not ( = ?auto_682241 ?auto_682244 ) ) ( not ( = ?auto_682241 ?auto_682245 ) ) ( not ( = ?auto_682241 ?auto_682246 ) ) ( not ( = ?auto_682241 ?auto_682247 ) ) ( not ( = ?auto_682241 ?auto_682248 ) ) ( not ( = ?auto_682242 ?auto_682243 ) ) ( not ( = ?auto_682242 ?auto_682244 ) ) ( not ( = ?auto_682242 ?auto_682245 ) ) ( not ( = ?auto_682242 ?auto_682246 ) ) ( not ( = ?auto_682242 ?auto_682247 ) ) ( not ( = ?auto_682242 ?auto_682248 ) ) ( not ( = ?auto_682243 ?auto_682244 ) ) ( not ( = ?auto_682243 ?auto_682245 ) ) ( not ( = ?auto_682243 ?auto_682246 ) ) ( not ( = ?auto_682243 ?auto_682247 ) ) ( not ( = ?auto_682243 ?auto_682248 ) ) ( not ( = ?auto_682244 ?auto_682245 ) ) ( not ( = ?auto_682244 ?auto_682246 ) ) ( not ( = ?auto_682244 ?auto_682247 ) ) ( not ( = ?auto_682244 ?auto_682248 ) ) ( not ( = ?auto_682245 ?auto_682246 ) ) ( not ( = ?auto_682245 ?auto_682247 ) ) ( not ( = ?auto_682245 ?auto_682248 ) ) ( not ( = ?auto_682246 ?auto_682247 ) ) ( not ( = ?auto_682246 ?auto_682248 ) ) ( not ( = ?auto_682247 ?auto_682248 ) ) ( ON ?auto_682246 ?auto_682247 ) ( CLEAR ?auto_682244 ) ( ON ?auto_682245 ?auto_682246 ) ( CLEAR ?auto_682245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_682236 ?auto_682237 ?auto_682238 ?auto_682239 ?auto_682240 ?auto_682241 ?auto_682242 ?auto_682243 ?auto_682244 ?auto_682245 )
      ( MAKE-12PILE ?auto_682236 ?auto_682237 ?auto_682238 ?auto_682239 ?auto_682240 ?auto_682241 ?auto_682242 ?auto_682243 ?auto_682244 ?auto_682245 ?auto_682246 ?auto_682247 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_682286 - BLOCK
      ?auto_682287 - BLOCK
      ?auto_682288 - BLOCK
      ?auto_682289 - BLOCK
      ?auto_682290 - BLOCK
      ?auto_682291 - BLOCK
      ?auto_682292 - BLOCK
      ?auto_682293 - BLOCK
      ?auto_682294 - BLOCK
      ?auto_682295 - BLOCK
      ?auto_682296 - BLOCK
      ?auto_682297 - BLOCK
    )
    :vars
    (
      ?auto_682298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_682297 ?auto_682298 ) ( ON-TABLE ?auto_682286 ) ( ON ?auto_682287 ?auto_682286 ) ( ON ?auto_682288 ?auto_682287 ) ( ON ?auto_682289 ?auto_682288 ) ( ON ?auto_682290 ?auto_682289 ) ( ON ?auto_682291 ?auto_682290 ) ( ON ?auto_682292 ?auto_682291 ) ( ON ?auto_682293 ?auto_682292 ) ( not ( = ?auto_682286 ?auto_682287 ) ) ( not ( = ?auto_682286 ?auto_682288 ) ) ( not ( = ?auto_682286 ?auto_682289 ) ) ( not ( = ?auto_682286 ?auto_682290 ) ) ( not ( = ?auto_682286 ?auto_682291 ) ) ( not ( = ?auto_682286 ?auto_682292 ) ) ( not ( = ?auto_682286 ?auto_682293 ) ) ( not ( = ?auto_682286 ?auto_682294 ) ) ( not ( = ?auto_682286 ?auto_682295 ) ) ( not ( = ?auto_682286 ?auto_682296 ) ) ( not ( = ?auto_682286 ?auto_682297 ) ) ( not ( = ?auto_682286 ?auto_682298 ) ) ( not ( = ?auto_682287 ?auto_682288 ) ) ( not ( = ?auto_682287 ?auto_682289 ) ) ( not ( = ?auto_682287 ?auto_682290 ) ) ( not ( = ?auto_682287 ?auto_682291 ) ) ( not ( = ?auto_682287 ?auto_682292 ) ) ( not ( = ?auto_682287 ?auto_682293 ) ) ( not ( = ?auto_682287 ?auto_682294 ) ) ( not ( = ?auto_682287 ?auto_682295 ) ) ( not ( = ?auto_682287 ?auto_682296 ) ) ( not ( = ?auto_682287 ?auto_682297 ) ) ( not ( = ?auto_682287 ?auto_682298 ) ) ( not ( = ?auto_682288 ?auto_682289 ) ) ( not ( = ?auto_682288 ?auto_682290 ) ) ( not ( = ?auto_682288 ?auto_682291 ) ) ( not ( = ?auto_682288 ?auto_682292 ) ) ( not ( = ?auto_682288 ?auto_682293 ) ) ( not ( = ?auto_682288 ?auto_682294 ) ) ( not ( = ?auto_682288 ?auto_682295 ) ) ( not ( = ?auto_682288 ?auto_682296 ) ) ( not ( = ?auto_682288 ?auto_682297 ) ) ( not ( = ?auto_682288 ?auto_682298 ) ) ( not ( = ?auto_682289 ?auto_682290 ) ) ( not ( = ?auto_682289 ?auto_682291 ) ) ( not ( = ?auto_682289 ?auto_682292 ) ) ( not ( = ?auto_682289 ?auto_682293 ) ) ( not ( = ?auto_682289 ?auto_682294 ) ) ( not ( = ?auto_682289 ?auto_682295 ) ) ( not ( = ?auto_682289 ?auto_682296 ) ) ( not ( = ?auto_682289 ?auto_682297 ) ) ( not ( = ?auto_682289 ?auto_682298 ) ) ( not ( = ?auto_682290 ?auto_682291 ) ) ( not ( = ?auto_682290 ?auto_682292 ) ) ( not ( = ?auto_682290 ?auto_682293 ) ) ( not ( = ?auto_682290 ?auto_682294 ) ) ( not ( = ?auto_682290 ?auto_682295 ) ) ( not ( = ?auto_682290 ?auto_682296 ) ) ( not ( = ?auto_682290 ?auto_682297 ) ) ( not ( = ?auto_682290 ?auto_682298 ) ) ( not ( = ?auto_682291 ?auto_682292 ) ) ( not ( = ?auto_682291 ?auto_682293 ) ) ( not ( = ?auto_682291 ?auto_682294 ) ) ( not ( = ?auto_682291 ?auto_682295 ) ) ( not ( = ?auto_682291 ?auto_682296 ) ) ( not ( = ?auto_682291 ?auto_682297 ) ) ( not ( = ?auto_682291 ?auto_682298 ) ) ( not ( = ?auto_682292 ?auto_682293 ) ) ( not ( = ?auto_682292 ?auto_682294 ) ) ( not ( = ?auto_682292 ?auto_682295 ) ) ( not ( = ?auto_682292 ?auto_682296 ) ) ( not ( = ?auto_682292 ?auto_682297 ) ) ( not ( = ?auto_682292 ?auto_682298 ) ) ( not ( = ?auto_682293 ?auto_682294 ) ) ( not ( = ?auto_682293 ?auto_682295 ) ) ( not ( = ?auto_682293 ?auto_682296 ) ) ( not ( = ?auto_682293 ?auto_682297 ) ) ( not ( = ?auto_682293 ?auto_682298 ) ) ( not ( = ?auto_682294 ?auto_682295 ) ) ( not ( = ?auto_682294 ?auto_682296 ) ) ( not ( = ?auto_682294 ?auto_682297 ) ) ( not ( = ?auto_682294 ?auto_682298 ) ) ( not ( = ?auto_682295 ?auto_682296 ) ) ( not ( = ?auto_682295 ?auto_682297 ) ) ( not ( = ?auto_682295 ?auto_682298 ) ) ( not ( = ?auto_682296 ?auto_682297 ) ) ( not ( = ?auto_682296 ?auto_682298 ) ) ( not ( = ?auto_682297 ?auto_682298 ) ) ( ON ?auto_682296 ?auto_682297 ) ( ON ?auto_682295 ?auto_682296 ) ( CLEAR ?auto_682293 ) ( ON ?auto_682294 ?auto_682295 ) ( CLEAR ?auto_682294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_682286 ?auto_682287 ?auto_682288 ?auto_682289 ?auto_682290 ?auto_682291 ?auto_682292 ?auto_682293 ?auto_682294 )
      ( MAKE-12PILE ?auto_682286 ?auto_682287 ?auto_682288 ?auto_682289 ?auto_682290 ?auto_682291 ?auto_682292 ?auto_682293 ?auto_682294 ?auto_682295 ?auto_682296 ?auto_682297 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_682336 - BLOCK
      ?auto_682337 - BLOCK
      ?auto_682338 - BLOCK
      ?auto_682339 - BLOCK
      ?auto_682340 - BLOCK
      ?auto_682341 - BLOCK
      ?auto_682342 - BLOCK
      ?auto_682343 - BLOCK
      ?auto_682344 - BLOCK
      ?auto_682345 - BLOCK
      ?auto_682346 - BLOCK
      ?auto_682347 - BLOCK
    )
    :vars
    (
      ?auto_682348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_682347 ?auto_682348 ) ( ON-TABLE ?auto_682336 ) ( ON ?auto_682337 ?auto_682336 ) ( ON ?auto_682338 ?auto_682337 ) ( ON ?auto_682339 ?auto_682338 ) ( ON ?auto_682340 ?auto_682339 ) ( ON ?auto_682341 ?auto_682340 ) ( ON ?auto_682342 ?auto_682341 ) ( not ( = ?auto_682336 ?auto_682337 ) ) ( not ( = ?auto_682336 ?auto_682338 ) ) ( not ( = ?auto_682336 ?auto_682339 ) ) ( not ( = ?auto_682336 ?auto_682340 ) ) ( not ( = ?auto_682336 ?auto_682341 ) ) ( not ( = ?auto_682336 ?auto_682342 ) ) ( not ( = ?auto_682336 ?auto_682343 ) ) ( not ( = ?auto_682336 ?auto_682344 ) ) ( not ( = ?auto_682336 ?auto_682345 ) ) ( not ( = ?auto_682336 ?auto_682346 ) ) ( not ( = ?auto_682336 ?auto_682347 ) ) ( not ( = ?auto_682336 ?auto_682348 ) ) ( not ( = ?auto_682337 ?auto_682338 ) ) ( not ( = ?auto_682337 ?auto_682339 ) ) ( not ( = ?auto_682337 ?auto_682340 ) ) ( not ( = ?auto_682337 ?auto_682341 ) ) ( not ( = ?auto_682337 ?auto_682342 ) ) ( not ( = ?auto_682337 ?auto_682343 ) ) ( not ( = ?auto_682337 ?auto_682344 ) ) ( not ( = ?auto_682337 ?auto_682345 ) ) ( not ( = ?auto_682337 ?auto_682346 ) ) ( not ( = ?auto_682337 ?auto_682347 ) ) ( not ( = ?auto_682337 ?auto_682348 ) ) ( not ( = ?auto_682338 ?auto_682339 ) ) ( not ( = ?auto_682338 ?auto_682340 ) ) ( not ( = ?auto_682338 ?auto_682341 ) ) ( not ( = ?auto_682338 ?auto_682342 ) ) ( not ( = ?auto_682338 ?auto_682343 ) ) ( not ( = ?auto_682338 ?auto_682344 ) ) ( not ( = ?auto_682338 ?auto_682345 ) ) ( not ( = ?auto_682338 ?auto_682346 ) ) ( not ( = ?auto_682338 ?auto_682347 ) ) ( not ( = ?auto_682338 ?auto_682348 ) ) ( not ( = ?auto_682339 ?auto_682340 ) ) ( not ( = ?auto_682339 ?auto_682341 ) ) ( not ( = ?auto_682339 ?auto_682342 ) ) ( not ( = ?auto_682339 ?auto_682343 ) ) ( not ( = ?auto_682339 ?auto_682344 ) ) ( not ( = ?auto_682339 ?auto_682345 ) ) ( not ( = ?auto_682339 ?auto_682346 ) ) ( not ( = ?auto_682339 ?auto_682347 ) ) ( not ( = ?auto_682339 ?auto_682348 ) ) ( not ( = ?auto_682340 ?auto_682341 ) ) ( not ( = ?auto_682340 ?auto_682342 ) ) ( not ( = ?auto_682340 ?auto_682343 ) ) ( not ( = ?auto_682340 ?auto_682344 ) ) ( not ( = ?auto_682340 ?auto_682345 ) ) ( not ( = ?auto_682340 ?auto_682346 ) ) ( not ( = ?auto_682340 ?auto_682347 ) ) ( not ( = ?auto_682340 ?auto_682348 ) ) ( not ( = ?auto_682341 ?auto_682342 ) ) ( not ( = ?auto_682341 ?auto_682343 ) ) ( not ( = ?auto_682341 ?auto_682344 ) ) ( not ( = ?auto_682341 ?auto_682345 ) ) ( not ( = ?auto_682341 ?auto_682346 ) ) ( not ( = ?auto_682341 ?auto_682347 ) ) ( not ( = ?auto_682341 ?auto_682348 ) ) ( not ( = ?auto_682342 ?auto_682343 ) ) ( not ( = ?auto_682342 ?auto_682344 ) ) ( not ( = ?auto_682342 ?auto_682345 ) ) ( not ( = ?auto_682342 ?auto_682346 ) ) ( not ( = ?auto_682342 ?auto_682347 ) ) ( not ( = ?auto_682342 ?auto_682348 ) ) ( not ( = ?auto_682343 ?auto_682344 ) ) ( not ( = ?auto_682343 ?auto_682345 ) ) ( not ( = ?auto_682343 ?auto_682346 ) ) ( not ( = ?auto_682343 ?auto_682347 ) ) ( not ( = ?auto_682343 ?auto_682348 ) ) ( not ( = ?auto_682344 ?auto_682345 ) ) ( not ( = ?auto_682344 ?auto_682346 ) ) ( not ( = ?auto_682344 ?auto_682347 ) ) ( not ( = ?auto_682344 ?auto_682348 ) ) ( not ( = ?auto_682345 ?auto_682346 ) ) ( not ( = ?auto_682345 ?auto_682347 ) ) ( not ( = ?auto_682345 ?auto_682348 ) ) ( not ( = ?auto_682346 ?auto_682347 ) ) ( not ( = ?auto_682346 ?auto_682348 ) ) ( not ( = ?auto_682347 ?auto_682348 ) ) ( ON ?auto_682346 ?auto_682347 ) ( ON ?auto_682345 ?auto_682346 ) ( ON ?auto_682344 ?auto_682345 ) ( CLEAR ?auto_682342 ) ( ON ?auto_682343 ?auto_682344 ) ( CLEAR ?auto_682343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_682336 ?auto_682337 ?auto_682338 ?auto_682339 ?auto_682340 ?auto_682341 ?auto_682342 ?auto_682343 )
      ( MAKE-12PILE ?auto_682336 ?auto_682337 ?auto_682338 ?auto_682339 ?auto_682340 ?auto_682341 ?auto_682342 ?auto_682343 ?auto_682344 ?auto_682345 ?auto_682346 ?auto_682347 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_682386 - BLOCK
      ?auto_682387 - BLOCK
      ?auto_682388 - BLOCK
      ?auto_682389 - BLOCK
      ?auto_682390 - BLOCK
      ?auto_682391 - BLOCK
      ?auto_682392 - BLOCK
      ?auto_682393 - BLOCK
      ?auto_682394 - BLOCK
      ?auto_682395 - BLOCK
      ?auto_682396 - BLOCK
      ?auto_682397 - BLOCK
    )
    :vars
    (
      ?auto_682398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_682397 ?auto_682398 ) ( ON-TABLE ?auto_682386 ) ( ON ?auto_682387 ?auto_682386 ) ( ON ?auto_682388 ?auto_682387 ) ( ON ?auto_682389 ?auto_682388 ) ( ON ?auto_682390 ?auto_682389 ) ( ON ?auto_682391 ?auto_682390 ) ( not ( = ?auto_682386 ?auto_682387 ) ) ( not ( = ?auto_682386 ?auto_682388 ) ) ( not ( = ?auto_682386 ?auto_682389 ) ) ( not ( = ?auto_682386 ?auto_682390 ) ) ( not ( = ?auto_682386 ?auto_682391 ) ) ( not ( = ?auto_682386 ?auto_682392 ) ) ( not ( = ?auto_682386 ?auto_682393 ) ) ( not ( = ?auto_682386 ?auto_682394 ) ) ( not ( = ?auto_682386 ?auto_682395 ) ) ( not ( = ?auto_682386 ?auto_682396 ) ) ( not ( = ?auto_682386 ?auto_682397 ) ) ( not ( = ?auto_682386 ?auto_682398 ) ) ( not ( = ?auto_682387 ?auto_682388 ) ) ( not ( = ?auto_682387 ?auto_682389 ) ) ( not ( = ?auto_682387 ?auto_682390 ) ) ( not ( = ?auto_682387 ?auto_682391 ) ) ( not ( = ?auto_682387 ?auto_682392 ) ) ( not ( = ?auto_682387 ?auto_682393 ) ) ( not ( = ?auto_682387 ?auto_682394 ) ) ( not ( = ?auto_682387 ?auto_682395 ) ) ( not ( = ?auto_682387 ?auto_682396 ) ) ( not ( = ?auto_682387 ?auto_682397 ) ) ( not ( = ?auto_682387 ?auto_682398 ) ) ( not ( = ?auto_682388 ?auto_682389 ) ) ( not ( = ?auto_682388 ?auto_682390 ) ) ( not ( = ?auto_682388 ?auto_682391 ) ) ( not ( = ?auto_682388 ?auto_682392 ) ) ( not ( = ?auto_682388 ?auto_682393 ) ) ( not ( = ?auto_682388 ?auto_682394 ) ) ( not ( = ?auto_682388 ?auto_682395 ) ) ( not ( = ?auto_682388 ?auto_682396 ) ) ( not ( = ?auto_682388 ?auto_682397 ) ) ( not ( = ?auto_682388 ?auto_682398 ) ) ( not ( = ?auto_682389 ?auto_682390 ) ) ( not ( = ?auto_682389 ?auto_682391 ) ) ( not ( = ?auto_682389 ?auto_682392 ) ) ( not ( = ?auto_682389 ?auto_682393 ) ) ( not ( = ?auto_682389 ?auto_682394 ) ) ( not ( = ?auto_682389 ?auto_682395 ) ) ( not ( = ?auto_682389 ?auto_682396 ) ) ( not ( = ?auto_682389 ?auto_682397 ) ) ( not ( = ?auto_682389 ?auto_682398 ) ) ( not ( = ?auto_682390 ?auto_682391 ) ) ( not ( = ?auto_682390 ?auto_682392 ) ) ( not ( = ?auto_682390 ?auto_682393 ) ) ( not ( = ?auto_682390 ?auto_682394 ) ) ( not ( = ?auto_682390 ?auto_682395 ) ) ( not ( = ?auto_682390 ?auto_682396 ) ) ( not ( = ?auto_682390 ?auto_682397 ) ) ( not ( = ?auto_682390 ?auto_682398 ) ) ( not ( = ?auto_682391 ?auto_682392 ) ) ( not ( = ?auto_682391 ?auto_682393 ) ) ( not ( = ?auto_682391 ?auto_682394 ) ) ( not ( = ?auto_682391 ?auto_682395 ) ) ( not ( = ?auto_682391 ?auto_682396 ) ) ( not ( = ?auto_682391 ?auto_682397 ) ) ( not ( = ?auto_682391 ?auto_682398 ) ) ( not ( = ?auto_682392 ?auto_682393 ) ) ( not ( = ?auto_682392 ?auto_682394 ) ) ( not ( = ?auto_682392 ?auto_682395 ) ) ( not ( = ?auto_682392 ?auto_682396 ) ) ( not ( = ?auto_682392 ?auto_682397 ) ) ( not ( = ?auto_682392 ?auto_682398 ) ) ( not ( = ?auto_682393 ?auto_682394 ) ) ( not ( = ?auto_682393 ?auto_682395 ) ) ( not ( = ?auto_682393 ?auto_682396 ) ) ( not ( = ?auto_682393 ?auto_682397 ) ) ( not ( = ?auto_682393 ?auto_682398 ) ) ( not ( = ?auto_682394 ?auto_682395 ) ) ( not ( = ?auto_682394 ?auto_682396 ) ) ( not ( = ?auto_682394 ?auto_682397 ) ) ( not ( = ?auto_682394 ?auto_682398 ) ) ( not ( = ?auto_682395 ?auto_682396 ) ) ( not ( = ?auto_682395 ?auto_682397 ) ) ( not ( = ?auto_682395 ?auto_682398 ) ) ( not ( = ?auto_682396 ?auto_682397 ) ) ( not ( = ?auto_682396 ?auto_682398 ) ) ( not ( = ?auto_682397 ?auto_682398 ) ) ( ON ?auto_682396 ?auto_682397 ) ( ON ?auto_682395 ?auto_682396 ) ( ON ?auto_682394 ?auto_682395 ) ( ON ?auto_682393 ?auto_682394 ) ( CLEAR ?auto_682391 ) ( ON ?auto_682392 ?auto_682393 ) ( CLEAR ?auto_682392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_682386 ?auto_682387 ?auto_682388 ?auto_682389 ?auto_682390 ?auto_682391 ?auto_682392 )
      ( MAKE-12PILE ?auto_682386 ?auto_682387 ?auto_682388 ?auto_682389 ?auto_682390 ?auto_682391 ?auto_682392 ?auto_682393 ?auto_682394 ?auto_682395 ?auto_682396 ?auto_682397 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_682436 - BLOCK
      ?auto_682437 - BLOCK
      ?auto_682438 - BLOCK
      ?auto_682439 - BLOCK
      ?auto_682440 - BLOCK
      ?auto_682441 - BLOCK
      ?auto_682442 - BLOCK
      ?auto_682443 - BLOCK
      ?auto_682444 - BLOCK
      ?auto_682445 - BLOCK
      ?auto_682446 - BLOCK
      ?auto_682447 - BLOCK
    )
    :vars
    (
      ?auto_682448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_682447 ?auto_682448 ) ( ON-TABLE ?auto_682436 ) ( ON ?auto_682437 ?auto_682436 ) ( ON ?auto_682438 ?auto_682437 ) ( ON ?auto_682439 ?auto_682438 ) ( ON ?auto_682440 ?auto_682439 ) ( not ( = ?auto_682436 ?auto_682437 ) ) ( not ( = ?auto_682436 ?auto_682438 ) ) ( not ( = ?auto_682436 ?auto_682439 ) ) ( not ( = ?auto_682436 ?auto_682440 ) ) ( not ( = ?auto_682436 ?auto_682441 ) ) ( not ( = ?auto_682436 ?auto_682442 ) ) ( not ( = ?auto_682436 ?auto_682443 ) ) ( not ( = ?auto_682436 ?auto_682444 ) ) ( not ( = ?auto_682436 ?auto_682445 ) ) ( not ( = ?auto_682436 ?auto_682446 ) ) ( not ( = ?auto_682436 ?auto_682447 ) ) ( not ( = ?auto_682436 ?auto_682448 ) ) ( not ( = ?auto_682437 ?auto_682438 ) ) ( not ( = ?auto_682437 ?auto_682439 ) ) ( not ( = ?auto_682437 ?auto_682440 ) ) ( not ( = ?auto_682437 ?auto_682441 ) ) ( not ( = ?auto_682437 ?auto_682442 ) ) ( not ( = ?auto_682437 ?auto_682443 ) ) ( not ( = ?auto_682437 ?auto_682444 ) ) ( not ( = ?auto_682437 ?auto_682445 ) ) ( not ( = ?auto_682437 ?auto_682446 ) ) ( not ( = ?auto_682437 ?auto_682447 ) ) ( not ( = ?auto_682437 ?auto_682448 ) ) ( not ( = ?auto_682438 ?auto_682439 ) ) ( not ( = ?auto_682438 ?auto_682440 ) ) ( not ( = ?auto_682438 ?auto_682441 ) ) ( not ( = ?auto_682438 ?auto_682442 ) ) ( not ( = ?auto_682438 ?auto_682443 ) ) ( not ( = ?auto_682438 ?auto_682444 ) ) ( not ( = ?auto_682438 ?auto_682445 ) ) ( not ( = ?auto_682438 ?auto_682446 ) ) ( not ( = ?auto_682438 ?auto_682447 ) ) ( not ( = ?auto_682438 ?auto_682448 ) ) ( not ( = ?auto_682439 ?auto_682440 ) ) ( not ( = ?auto_682439 ?auto_682441 ) ) ( not ( = ?auto_682439 ?auto_682442 ) ) ( not ( = ?auto_682439 ?auto_682443 ) ) ( not ( = ?auto_682439 ?auto_682444 ) ) ( not ( = ?auto_682439 ?auto_682445 ) ) ( not ( = ?auto_682439 ?auto_682446 ) ) ( not ( = ?auto_682439 ?auto_682447 ) ) ( not ( = ?auto_682439 ?auto_682448 ) ) ( not ( = ?auto_682440 ?auto_682441 ) ) ( not ( = ?auto_682440 ?auto_682442 ) ) ( not ( = ?auto_682440 ?auto_682443 ) ) ( not ( = ?auto_682440 ?auto_682444 ) ) ( not ( = ?auto_682440 ?auto_682445 ) ) ( not ( = ?auto_682440 ?auto_682446 ) ) ( not ( = ?auto_682440 ?auto_682447 ) ) ( not ( = ?auto_682440 ?auto_682448 ) ) ( not ( = ?auto_682441 ?auto_682442 ) ) ( not ( = ?auto_682441 ?auto_682443 ) ) ( not ( = ?auto_682441 ?auto_682444 ) ) ( not ( = ?auto_682441 ?auto_682445 ) ) ( not ( = ?auto_682441 ?auto_682446 ) ) ( not ( = ?auto_682441 ?auto_682447 ) ) ( not ( = ?auto_682441 ?auto_682448 ) ) ( not ( = ?auto_682442 ?auto_682443 ) ) ( not ( = ?auto_682442 ?auto_682444 ) ) ( not ( = ?auto_682442 ?auto_682445 ) ) ( not ( = ?auto_682442 ?auto_682446 ) ) ( not ( = ?auto_682442 ?auto_682447 ) ) ( not ( = ?auto_682442 ?auto_682448 ) ) ( not ( = ?auto_682443 ?auto_682444 ) ) ( not ( = ?auto_682443 ?auto_682445 ) ) ( not ( = ?auto_682443 ?auto_682446 ) ) ( not ( = ?auto_682443 ?auto_682447 ) ) ( not ( = ?auto_682443 ?auto_682448 ) ) ( not ( = ?auto_682444 ?auto_682445 ) ) ( not ( = ?auto_682444 ?auto_682446 ) ) ( not ( = ?auto_682444 ?auto_682447 ) ) ( not ( = ?auto_682444 ?auto_682448 ) ) ( not ( = ?auto_682445 ?auto_682446 ) ) ( not ( = ?auto_682445 ?auto_682447 ) ) ( not ( = ?auto_682445 ?auto_682448 ) ) ( not ( = ?auto_682446 ?auto_682447 ) ) ( not ( = ?auto_682446 ?auto_682448 ) ) ( not ( = ?auto_682447 ?auto_682448 ) ) ( ON ?auto_682446 ?auto_682447 ) ( ON ?auto_682445 ?auto_682446 ) ( ON ?auto_682444 ?auto_682445 ) ( ON ?auto_682443 ?auto_682444 ) ( ON ?auto_682442 ?auto_682443 ) ( CLEAR ?auto_682440 ) ( ON ?auto_682441 ?auto_682442 ) ( CLEAR ?auto_682441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_682436 ?auto_682437 ?auto_682438 ?auto_682439 ?auto_682440 ?auto_682441 )
      ( MAKE-12PILE ?auto_682436 ?auto_682437 ?auto_682438 ?auto_682439 ?auto_682440 ?auto_682441 ?auto_682442 ?auto_682443 ?auto_682444 ?auto_682445 ?auto_682446 ?auto_682447 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_682486 - BLOCK
      ?auto_682487 - BLOCK
      ?auto_682488 - BLOCK
      ?auto_682489 - BLOCK
      ?auto_682490 - BLOCK
      ?auto_682491 - BLOCK
      ?auto_682492 - BLOCK
      ?auto_682493 - BLOCK
      ?auto_682494 - BLOCK
      ?auto_682495 - BLOCK
      ?auto_682496 - BLOCK
      ?auto_682497 - BLOCK
    )
    :vars
    (
      ?auto_682498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_682497 ?auto_682498 ) ( ON-TABLE ?auto_682486 ) ( ON ?auto_682487 ?auto_682486 ) ( ON ?auto_682488 ?auto_682487 ) ( ON ?auto_682489 ?auto_682488 ) ( not ( = ?auto_682486 ?auto_682487 ) ) ( not ( = ?auto_682486 ?auto_682488 ) ) ( not ( = ?auto_682486 ?auto_682489 ) ) ( not ( = ?auto_682486 ?auto_682490 ) ) ( not ( = ?auto_682486 ?auto_682491 ) ) ( not ( = ?auto_682486 ?auto_682492 ) ) ( not ( = ?auto_682486 ?auto_682493 ) ) ( not ( = ?auto_682486 ?auto_682494 ) ) ( not ( = ?auto_682486 ?auto_682495 ) ) ( not ( = ?auto_682486 ?auto_682496 ) ) ( not ( = ?auto_682486 ?auto_682497 ) ) ( not ( = ?auto_682486 ?auto_682498 ) ) ( not ( = ?auto_682487 ?auto_682488 ) ) ( not ( = ?auto_682487 ?auto_682489 ) ) ( not ( = ?auto_682487 ?auto_682490 ) ) ( not ( = ?auto_682487 ?auto_682491 ) ) ( not ( = ?auto_682487 ?auto_682492 ) ) ( not ( = ?auto_682487 ?auto_682493 ) ) ( not ( = ?auto_682487 ?auto_682494 ) ) ( not ( = ?auto_682487 ?auto_682495 ) ) ( not ( = ?auto_682487 ?auto_682496 ) ) ( not ( = ?auto_682487 ?auto_682497 ) ) ( not ( = ?auto_682487 ?auto_682498 ) ) ( not ( = ?auto_682488 ?auto_682489 ) ) ( not ( = ?auto_682488 ?auto_682490 ) ) ( not ( = ?auto_682488 ?auto_682491 ) ) ( not ( = ?auto_682488 ?auto_682492 ) ) ( not ( = ?auto_682488 ?auto_682493 ) ) ( not ( = ?auto_682488 ?auto_682494 ) ) ( not ( = ?auto_682488 ?auto_682495 ) ) ( not ( = ?auto_682488 ?auto_682496 ) ) ( not ( = ?auto_682488 ?auto_682497 ) ) ( not ( = ?auto_682488 ?auto_682498 ) ) ( not ( = ?auto_682489 ?auto_682490 ) ) ( not ( = ?auto_682489 ?auto_682491 ) ) ( not ( = ?auto_682489 ?auto_682492 ) ) ( not ( = ?auto_682489 ?auto_682493 ) ) ( not ( = ?auto_682489 ?auto_682494 ) ) ( not ( = ?auto_682489 ?auto_682495 ) ) ( not ( = ?auto_682489 ?auto_682496 ) ) ( not ( = ?auto_682489 ?auto_682497 ) ) ( not ( = ?auto_682489 ?auto_682498 ) ) ( not ( = ?auto_682490 ?auto_682491 ) ) ( not ( = ?auto_682490 ?auto_682492 ) ) ( not ( = ?auto_682490 ?auto_682493 ) ) ( not ( = ?auto_682490 ?auto_682494 ) ) ( not ( = ?auto_682490 ?auto_682495 ) ) ( not ( = ?auto_682490 ?auto_682496 ) ) ( not ( = ?auto_682490 ?auto_682497 ) ) ( not ( = ?auto_682490 ?auto_682498 ) ) ( not ( = ?auto_682491 ?auto_682492 ) ) ( not ( = ?auto_682491 ?auto_682493 ) ) ( not ( = ?auto_682491 ?auto_682494 ) ) ( not ( = ?auto_682491 ?auto_682495 ) ) ( not ( = ?auto_682491 ?auto_682496 ) ) ( not ( = ?auto_682491 ?auto_682497 ) ) ( not ( = ?auto_682491 ?auto_682498 ) ) ( not ( = ?auto_682492 ?auto_682493 ) ) ( not ( = ?auto_682492 ?auto_682494 ) ) ( not ( = ?auto_682492 ?auto_682495 ) ) ( not ( = ?auto_682492 ?auto_682496 ) ) ( not ( = ?auto_682492 ?auto_682497 ) ) ( not ( = ?auto_682492 ?auto_682498 ) ) ( not ( = ?auto_682493 ?auto_682494 ) ) ( not ( = ?auto_682493 ?auto_682495 ) ) ( not ( = ?auto_682493 ?auto_682496 ) ) ( not ( = ?auto_682493 ?auto_682497 ) ) ( not ( = ?auto_682493 ?auto_682498 ) ) ( not ( = ?auto_682494 ?auto_682495 ) ) ( not ( = ?auto_682494 ?auto_682496 ) ) ( not ( = ?auto_682494 ?auto_682497 ) ) ( not ( = ?auto_682494 ?auto_682498 ) ) ( not ( = ?auto_682495 ?auto_682496 ) ) ( not ( = ?auto_682495 ?auto_682497 ) ) ( not ( = ?auto_682495 ?auto_682498 ) ) ( not ( = ?auto_682496 ?auto_682497 ) ) ( not ( = ?auto_682496 ?auto_682498 ) ) ( not ( = ?auto_682497 ?auto_682498 ) ) ( ON ?auto_682496 ?auto_682497 ) ( ON ?auto_682495 ?auto_682496 ) ( ON ?auto_682494 ?auto_682495 ) ( ON ?auto_682493 ?auto_682494 ) ( ON ?auto_682492 ?auto_682493 ) ( ON ?auto_682491 ?auto_682492 ) ( CLEAR ?auto_682489 ) ( ON ?auto_682490 ?auto_682491 ) ( CLEAR ?auto_682490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_682486 ?auto_682487 ?auto_682488 ?auto_682489 ?auto_682490 )
      ( MAKE-12PILE ?auto_682486 ?auto_682487 ?auto_682488 ?auto_682489 ?auto_682490 ?auto_682491 ?auto_682492 ?auto_682493 ?auto_682494 ?auto_682495 ?auto_682496 ?auto_682497 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_682536 - BLOCK
      ?auto_682537 - BLOCK
      ?auto_682538 - BLOCK
      ?auto_682539 - BLOCK
      ?auto_682540 - BLOCK
      ?auto_682541 - BLOCK
      ?auto_682542 - BLOCK
      ?auto_682543 - BLOCK
      ?auto_682544 - BLOCK
      ?auto_682545 - BLOCK
      ?auto_682546 - BLOCK
      ?auto_682547 - BLOCK
    )
    :vars
    (
      ?auto_682548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_682547 ?auto_682548 ) ( ON-TABLE ?auto_682536 ) ( ON ?auto_682537 ?auto_682536 ) ( ON ?auto_682538 ?auto_682537 ) ( not ( = ?auto_682536 ?auto_682537 ) ) ( not ( = ?auto_682536 ?auto_682538 ) ) ( not ( = ?auto_682536 ?auto_682539 ) ) ( not ( = ?auto_682536 ?auto_682540 ) ) ( not ( = ?auto_682536 ?auto_682541 ) ) ( not ( = ?auto_682536 ?auto_682542 ) ) ( not ( = ?auto_682536 ?auto_682543 ) ) ( not ( = ?auto_682536 ?auto_682544 ) ) ( not ( = ?auto_682536 ?auto_682545 ) ) ( not ( = ?auto_682536 ?auto_682546 ) ) ( not ( = ?auto_682536 ?auto_682547 ) ) ( not ( = ?auto_682536 ?auto_682548 ) ) ( not ( = ?auto_682537 ?auto_682538 ) ) ( not ( = ?auto_682537 ?auto_682539 ) ) ( not ( = ?auto_682537 ?auto_682540 ) ) ( not ( = ?auto_682537 ?auto_682541 ) ) ( not ( = ?auto_682537 ?auto_682542 ) ) ( not ( = ?auto_682537 ?auto_682543 ) ) ( not ( = ?auto_682537 ?auto_682544 ) ) ( not ( = ?auto_682537 ?auto_682545 ) ) ( not ( = ?auto_682537 ?auto_682546 ) ) ( not ( = ?auto_682537 ?auto_682547 ) ) ( not ( = ?auto_682537 ?auto_682548 ) ) ( not ( = ?auto_682538 ?auto_682539 ) ) ( not ( = ?auto_682538 ?auto_682540 ) ) ( not ( = ?auto_682538 ?auto_682541 ) ) ( not ( = ?auto_682538 ?auto_682542 ) ) ( not ( = ?auto_682538 ?auto_682543 ) ) ( not ( = ?auto_682538 ?auto_682544 ) ) ( not ( = ?auto_682538 ?auto_682545 ) ) ( not ( = ?auto_682538 ?auto_682546 ) ) ( not ( = ?auto_682538 ?auto_682547 ) ) ( not ( = ?auto_682538 ?auto_682548 ) ) ( not ( = ?auto_682539 ?auto_682540 ) ) ( not ( = ?auto_682539 ?auto_682541 ) ) ( not ( = ?auto_682539 ?auto_682542 ) ) ( not ( = ?auto_682539 ?auto_682543 ) ) ( not ( = ?auto_682539 ?auto_682544 ) ) ( not ( = ?auto_682539 ?auto_682545 ) ) ( not ( = ?auto_682539 ?auto_682546 ) ) ( not ( = ?auto_682539 ?auto_682547 ) ) ( not ( = ?auto_682539 ?auto_682548 ) ) ( not ( = ?auto_682540 ?auto_682541 ) ) ( not ( = ?auto_682540 ?auto_682542 ) ) ( not ( = ?auto_682540 ?auto_682543 ) ) ( not ( = ?auto_682540 ?auto_682544 ) ) ( not ( = ?auto_682540 ?auto_682545 ) ) ( not ( = ?auto_682540 ?auto_682546 ) ) ( not ( = ?auto_682540 ?auto_682547 ) ) ( not ( = ?auto_682540 ?auto_682548 ) ) ( not ( = ?auto_682541 ?auto_682542 ) ) ( not ( = ?auto_682541 ?auto_682543 ) ) ( not ( = ?auto_682541 ?auto_682544 ) ) ( not ( = ?auto_682541 ?auto_682545 ) ) ( not ( = ?auto_682541 ?auto_682546 ) ) ( not ( = ?auto_682541 ?auto_682547 ) ) ( not ( = ?auto_682541 ?auto_682548 ) ) ( not ( = ?auto_682542 ?auto_682543 ) ) ( not ( = ?auto_682542 ?auto_682544 ) ) ( not ( = ?auto_682542 ?auto_682545 ) ) ( not ( = ?auto_682542 ?auto_682546 ) ) ( not ( = ?auto_682542 ?auto_682547 ) ) ( not ( = ?auto_682542 ?auto_682548 ) ) ( not ( = ?auto_682543 ?auto_682544 ) ) ( not ( = ?auto_682543 ?auto_682545 ) ) ( not ( = ?auto_682543 ?auto_682546 ) ) ( not ( = ?auto_682543 ?auto_682547 ) ) ( not ( = ?auto_682543 ?auto_682548 ) ) ( not ( = ?auto_682544 ?auto_682545 ) ) ( not ( = ?auto_682544 ?auto_682546 ) ) ( not ( = ?auto_682544 ?auto_682547 ) ) ( not ( = ?auto_682544 ?auto_682548 ) ) ( not ( = ?auto_682545 ?auto_682546 ) ) ( not ( = ?auto_682545 ?auto_682547 ) ) ( not ( = ?auto_682545 ?auto_682548 ) ) ( not ( = ?auto_682546 ?auto_682547 ) ) ( not ( = ?auto_682546 ?auto_682548 ) ) ( not ( = ?auto_682547 ?auto_682548 ) ) ( ON ?auto_682546 ?auto_682547 ) ( ON ?auto_682545 ?auto_682546 ) ( ON ?auto_682544 ?auto_682545 ) ( ON ?auto_682543 ?auto_682544 ) ( ON ?auto_682542 ?auto_682543 ) ( ON ?auto_682541 ?auto_682542 ) ( ON ?auto_682540 ?auto_682541 ) ( CLEAR ?auto_682538 ) ( ON ?auto_682539 ?auto_682540 ) ( CLEAR ?auto_682539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_682536 ?auto_682537 ?auto_682538 ?auto_682539 )
      ( MAKE-12PILE ?auto_682536 ?auto_682537 ?auto_682538 ?auto_682539 ?auto_682540 ?auto_682541 ?auto_682542 ?auto_682543 ?auto_682544 ?auto_682545 ?auto_682546 ?auto_682547 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_682586 - BLOCK
      ?auto_682587 - BLOCK
      ?auto_682588 - BLOCK
      ?auto_682589 - BLOCK
      ?auto_682590 - BLOCK
      ?auto_682591 - BLOCK
      ?auto_682592 - BLOCK
      ?auto_682593 - BLOCK
      ?auto_682594 - BLOCK
      ?auto_682595 - BLOCK
      ?auto_682596 - BLOCK
      ?auto_682597 - BLOCK
    )
    :vars
    (
      ?auto_682598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_682597 ?auto_682598 ) ( ON-TABLE ?auto_682586 ) ( ON ?auto_682587 ?auto_682586 ) ( not ( = ?auto_682586 ?auto_682587 ) ) ( not ( = ?auto_682586 ?auto_682588 ) ) ( not ( = ?auto_682586 ?auto_682589 ) ) ( not ( = ?auto_682586 ?auto_682590 ) ) ( not ( = ?auto_682586 ?auto_682591 ) ) ( not ( = ?auto_682586 ?auto_682592 ) ) ( not ( = ?auto_682586 ?auto_682593 ) ) ( not ( = ?auto_682586 ?auto_682594 ) ) ( not ( = ?auto_682586 ?auto_682595 ) ) ( not ( = ?auto_682586 ?auto_682596 ) ) ( not ( = ?auto_682586 ?auto_682597 ) ) ( not ( = ?auto_682586 ?auto_682598 ) ) ( not ( = ?auto_682587 ?auto_682588 ) ) ( not ( = ?auto_682587 ?auto_682589 ) ) ( not ( = ?auto_682587 ?auto_682590 ) ) ( not ( = ?auto_682587 ?auto_682591 ) ) ( not ( = ?auto_682587 ?auto_682592 ) ) ( not ( = ?auto_682587 ?auto_682593 ) ) ( not ( = ?auto_682587 ?auto_682594 ) ) ( not ( = ?auto_682587 ?auto_682595 ) ) ( not ( = ?auto_682587 ?auto_682596 ) ) ( not ( = ?auto_682587 ?auto_682597 ) ) ( not ( = ?auto_682587 ?auto_682598 ) ) ( not ( = ?auto_682588 ?auto_682589 ) ) ( not ( = ?auto_682588 ?auto_682590 ) ) ( not ( = ?auto_682588 ?auto_682591 ) ) ( not ( = ?auto_682588 ?auto_682592 ) ) ( not ( = ?auto_682588 ?auto_682593 ) ) ( not ( = ?auto_682588 ?auto_682594 ) ) ( not ( = ?auto_682588 ?auto_682595 ) ) ( not ( = ?auto_682588 ?auto_682596 ) ) ( not ( = ?auto_682588 ?auto_682597 ) ) ( not ( = ?auto_682588 ?auto_682598 ) ) ( not ( = ?auto_682589 ?auto_682590 ) ) ( not ( = ?auto_682589 ?auto_682591 ) ) ( not ( = ?auto_682589 ?auto_682592 ) ) ( not ( = ?auto_682589 ?auto_682593 ) ) ( not ( = ?auto_682589 ?auto_682594 ) ) ( not ( = ?auto_682589 ?auto_682595 ) ) ( not ( = ?auto_682589 ?auto_682596 ) ) ( not ( = ?auto_682589 ?auto_682597 ) ) ( not ( = ?auto_682589 ?auto_682598 ) ) ( not ( = ?auto_682590 ?auto_682591 ) ) ( not ( = ?auto_682590 ?auto_682592 ) ) ( not ( = ?auto_682590 ?auto_682593 ) ) ( not ( = ?auto_682590 ?auto_682594 ) ) ( not ( = ?auto_682590 ?auto_682595 ) ) ( not ( = ?auto_682590 ?auto_682596 ) ) ( not ( = ?auto_682590 ?auto_682597 ) ) ( not ( = ?auto_682590 ?auto_682598 ) ) ( not ( = ?auto_682591 ?auto_682592 ) ) ( not ( = ?auto_682591 ?auto_682593 ) ) ( not ( = ?auto_682591 ?auto_682594 ) ) ( not ( = ?auto_682591 ?auto_682595 ) ) ( not ( = ?auto_682591 ?auto_682596 ) ) ( not ( = ?auto_682591 ?auto_682597 ) ) ( not ( = ?auto_682591 ?auto_682598 ) ) ( not ( = ?auto_682592 ?auto_682593 ) ) ( not ( = ?auto_682592 ?auto_682594 ) ) ( not ( = ?auto_682592 ?auto_682595 ) ) ( not ( = ?auto_682592 ?auto_682596 ) ) ( not ( = ?auto_682592 ?auto_682597 ) ) ( not ( = ?auto_682592 ?auto_682598 ) ) ( not ( = ?auto_682593 ?auto_682594 ) ) ( not ( = ?auto_682593 ?auto_682595 ) ) ( not ( = ?auto_682593 ?auto_682596 ) ) ( not ( = ?auto_682593 ?auto_682597 ) ) ( not ( = ?auto_682593 ?auto_682598 ) ) ( not ( = ?auto_682594 ?auto_682595 ) ) ( not ( = ?auto_682594 ?auto_682596 ) ) ( not ( = ?auto_682594 ?auto_682597 ) ) ( not ( = ?auto_682594 ?auto_682598 ) ) ( not ( = ?auto_682595 ?auto_682596 ) ) ( not ( = ?auto_682595 ?auto_682597 ) ) ( not ( = ?auto_682595 ?auto_682598 ) ) ( not ( = ?auto_682596 ?auto_682597 ) ) ( not ( = ?auto_682596 ?auto_682598 ) ) ( not ( = ?auto_682597 ?auto_682598 ) ) ( ON ?auto_682596 ?auto_682597 ) ( ON ?auto_682595 ?auto_682596 ) ( ON ?auto_682594 ?auto_682595 ) ( ON ?auto_682593 ?auto_682594 ) ( ON ?auto_682592 ?auto_682593 ) ( ON ?auto_682591 ?auto_682592 ) ( ON ?auto_682590 ?auto_682591 ) ( ON ?auto_682589 ?auto_682590 ) ( CLEAR ?auto_682587 ) ( ON ?auto_682588 ?auto_682589 ) ( CLEAR ?auto_682588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_682586 ?auto_682587 ?auto_682588 )
      ( MAKE-12PILE ?auto_682586 ?auto_682587 ?auto_682588 ?auto_682589 ?auto_682590 ?auto_682591 ?auto_682592 ?auto_682593 ?auto_682594 ?auto_682595 ?auto_682596 ?auto_682597 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_682636 - BLOCK
      ?auto_682637 - BLOCK
      ?auto_682638 - BLOCK
      ?auto_682639 - BLOCK
      ?auto_682640 - BLOCK
      ?auto_682641 - BLOCK
      ?auto_682642 - BLOCK
      ?auto_682643 - BLOCK
      ?auto_682644 - BLOCK
      ?auto_682645 - BLOCK
      ?auto_682646 - BLOCK
      ?auto_682647 - BLOCK
    )
    :vars
    (
      ?auto_682648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_682647 ?auto_682648 ) ( ON-TABLE ?auto_682636 ) ( not ( = ?auto_682636 ?auto_682637 ) ) ( not ( = ?auto_682636 ?auto_682638 ) ) ( not ( = ?auto_682636 ?auto_682639 ) ) ( not ( = ?auto_682636 ?auto_682640 ) ) ( not ( = ?auto_682636 ?auto_682641 ) ) ( not ( = ?auto_682636 ?auto_682642 ) ) ( not ( = ?auto_682636 ?auto_682643 ) ) ( not ( = ?auto_682636 ?auto_682644 ) ) ( not ( = ?auto_682636 ?auto_682645 ) ) ( not ( = ?auto_682636 ?auto_682646 ) ) ( not ( = ?auto_682636 ?auto_682647 ) ) ( not ( = ?auto_682636 ?auto_682648 ) ) ( not ( = ?auto_682637 ?auto_682638 ) ) ( not ( = ?auto_682637 ?auto_682639 ) ) ( not ( = ?auto_682637 ?auto_682640 ) ) ( not ( = ?auto_682637 ?auto_682641 ) ) ( not ( = ?auto_682637 ?auto_682642 ) ) ( not ( = ?auto_682637 ?auto_682643 ) ) ( not ( = ?auto_682637 ?auto_682644 ) ) ( not ( = ?auto_682637 ?auto_682645 ) ) ( not ( = ?auto_682637 ?auto_682646 ) ) ( not ( = ?auto_682637 ?auto_682647 ) ) ( not ( = ?auto_682637 ?auto_682648 ) ) ( not ( = ?auto_682638 ?auto_682639 ) ) ( not ( = ?auto_682638 ?auto_682640 ) ) ( not ( = ?auto_682638 ?auto_682641 ) ) ( not ( = ?auto_682638 ?auto_682642 ) ) ( not ( = ?auto_682638 ?auto_682643 ) ) ( not ( = ?auto_682638 ?auto_682644 ) ) ( not ( = ?auto_682638 ?auto_682645 ) ) ( not ( = ?auto_682638 ?auto_682646 ) ) ( not ( = ?auto_682638 ?auto_682647 ) ) ( not ( = ?auto_682638 ?auto_682648 ) ) ( not ( = ?auto_682639 ?auto_682640 ) ) ( not ( = ?auto_682639 ?auto_682641 ) ) ( not ( = ?auto_682639 ?auto_682642 ) ) ( not ( = ?auto_682639 ?auto_682643 ) ) ( not ( = ?auto_682639 ?auto_682644 ) ) ( not ( = ?auto_682639 ?auto_682645 ) ) ( not ( = ?auto_682639 ?auto_682646 ) ) ( not ( = ?auto_682639 ?auto_682647 ) ) ( not ( = ?auto_682639 ?auto_682648 ) ) ( not ( = ?auto_682640 ?auto_682641 ) ) ( not ( = ?auto_682640 ?auto_682642 ) ) ( not ( = ?auto_682640 ?auto_682643 ) ) ( not ( = ?auto_682640 ?auto_682644 ) ) ( not ( = ?auto_682640 ?auto_682645 ) ) ( not ( = ?auto_682640 ?auto_682646 ) ) ( not ( = ?auto_682640 ?auto_682647 ) ) ( not ( = ?auto_682640 ?auto_682648 ) ) ( not ( = ?auto_682641 ?auto_682642 ) ) ( not ( = ?auto_682641 ?auto_682643 ) ) ( not ( = ?auto_682641 ?auto_682644 ) ) ( not ( = ?auto_682641 ?auto_682645 ) ) ( not ( = ?auto_682641 ?auto_682646 ) ) ( not ( = ?auto_682641 ?auto_682647 ) ) ( not ( = ?auto_682641 ?auto_682648 ) ) ( not ( = ?auto_682642 ?auto_682643 ) ) ( not ( = ?auto_682642 ?auto_682644 ) ) ( not ( = ?auto_682642 ?auto_682645 ) ) ( not ( = ?auto_682642 ?auto_682646 ) ) ( not ( = ?auto_682642 ?auto_682647 ) ) ( not ( = ?auto_682642 ?auto_682648 ) ) ( not ( = ?auto_682643 ?auto_682644 ) ) ( not ( = ?auto_682643 ?auto_682645 ) ) ( not ( = ?auto_682643 ?auto_682646 ) ) ( not ( = ?auto_682643 ?auto_682647 ) ) ( not ( = ?auto_682643 ?auto_682648 ) ) ( not ( = ?auto_682644 ?auto_682645 ) ) ( not ( = ?auto_682644 ?auto_682646 ) ) ( not ( = ?auto_682644 ?auto_682647 ) ) ( not ( = ?auto_682644 ?auto_682648 ) ) ( not ( = ?auto_682645 ?auto_682646 ) ) ( not ( = ?auto_682645 ?auto_682647 ) ) ( not ( = ?auto_682645 ?auto_682648 ) ) ( not ( = ?auto_682646 ?auto_682647 ) ) ( not ( = ?auto_682646 ?auto_682648 ) ) ( not ( = ?auto_682647 ?auto_682648 ) ) ( ON ?auto_682646 ?auto_682647 ) ( ON ?auto_682645 ?auto_682646 ) ( ON ?auto_682644 ?auto_682645 ) ( ON ?auto_682643 ?auto_682644 ) ( ON ?auto_682642 ?auto_682643 ) ( ON ?auto_682641 ?auto_682642 ) ( ON ?auto_682640 ?auto_682641 ) ( ON ?auto_682639 ?auto_682640 ) ( ON ?auto_682638 ?auto_682639 ) ( CLEAR ?auto_682636 ) ( ON ?auto_682637 ?auto_682638 ) ( CLEAR ?auto_682637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_682636 ?auto_682637 )
      ( MAKE-12PILE ?auto_682636 ?auto_682637 ?auto_682638 ?auto_682639 ?auto_682640 ?auto_682641 ?auto_682642 ?auto_682643 ?auto_682644 ?auto_682645 ?auto_682646 ?auto_682647 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_682686 - BLOCK
      ?auto_682687 - BLOCK
      ?auto_682688 - BLOCK
      ?auto_682689 - BLOCK
      ?auto_682690 - BLOCK
      ?auto_682691 - BLOCK
      ?auto_682692 - BLOCK
      ?auto_682693 - BLOCK
      ?auto_682694 - BLOCK
      ?auto_682695 - BLOCK
      ?auto_682696 - BLOCK
      ?auto_682697 - BLOCK
    )
    :vars
    (
      ?auto_682698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_682697 ?auto_682698 ) ( not ( = ?auto_682686 ?auto_682687 ) ) ( not ( = ?auto_682686 ?auto_682688 ) ) ( not ( = ?auto_682686 ?auto_682689 ) ) ( not ( = ?auto_682686 ?auto_682690 ) ) ( not ( = ?auto_682686 ?auto_682691 ) ) ( not ( = ?auto_682686 ?auto_682692 ) ) ( not ( = ?auto_682686 ?auto_682693 ) ) ( not ( = ?auto_682686 ?auto_682694 ) ) ( not ( = ?auto_682686 ?auto_682695 ) ) ( not ( = ?auto_682686 ?auto_682696 ) ) ( not ( = ?auto_682686 ?auto_682697 ) ) ( not ( = ?auto_682686 ?auto_682698 ) ) ( not ( = ?auto_682687 ?auto_682688 ) ) ( not ( = ?auto_682687 ?auto_682689 ) ) ( not ( = ?auto_682687 ?auto_682690 ) ) ( not ( = ?auto_682687 ?auto_682691 ) ) ( not ( = ?auto_682687 ?auto_682692 ) ) ( not ( = ?auto_682687 ?auto_682693 ) ) ( not ( = ?auto_682687 ?auto_682694 ) ) ( not ( = ?auto_682687 ?auto_682695 ) ) ( not ( = ?auto_682687 ?auto_682696 ) ) ( not ( = ?auto_682687 ?auto_682697 ) ) ( not ( = ?auto_682687 ?auto_682698 ) ) ( not ( = ?auto_682688 ?auto_682689 ) ) ( not ( = ?auto_682688 ?auto_682690 ) ) ( not ( = ?auto_682688 ?auto_682691 ) ) ( not ( = ?auto_682688 ?auto_682692 ) ) ( not ( = ?auto_682688 ?auto_682693 ) ) ( not ( = ?auto_682688 ?auto_682694 ) ) ( not ( = ?auto_682688 ?auto_682695 ) ) ( not ( = ?auto_682688 ?auto_682696 ) ) ( not ( = ?auto_682688 ?auto_682697 ) ) ( not ( = ?auto_682688 ?auto_682698 ) ) ( not ( = ?auto_682689 ?auto_682690 ) ) ( not ( = ?auto_682689 ?auto_682691 ) ) ( not ( = ?auto_682689 ?auto_682692 ) ) ( not ( = ?auto_682689 ?auto_682693 ) ) ( not ( = ?auto_682689 ?auto_682694 ) ) ( not ( = ?auto_682689 ?auto_682695 ) ) ( not ( = ?auto_682689 ?auto_682696 ) ) ( not ( = ?auto_682689 ?auto_682697 ) ) ( not ( = ?auto_682689 ?auto_682698 ) ) ( not ( = ?auto_682690 ?auto_682691 ) ) ( not ( = ?auto_682690 ?auto_682692 ) ) ( not ( = ?auto_682690 ?auto_682693 ) ) ( not ( = ?auto_682690 ?auto_682694 ) ) ( not ( = ?auto_682690 ?auto_682695 ) ) ( not ( = ?auto_682690 ?auto_682696 ) ) ( not ( = ?auto_682690 ?auto_682697 ) ) ( not ( = ?auto_682690 ?auto_682698 ) ) ( not ( = ?auto_682691 ?auto_682692 ) ) ( not ( = ?auto_682691 ?auto_682693 ) ) ( not ( = ?auto_682691 ?auto_682694 ) ) ( not ( = ?auto_682691 ?auto_682695 ) ) ( not ( = ?auto_682691 ?auto_682696 ) ) ( not ( = ?auto_682691 ?auto_682697 ) ) ( not ( = ?auto_682691 ?auto_682698 ) ) ( not ( = ?auto_682692 ?auto_682693 ) ) ( not ( = ?auto_682692 ?auto_682694 ) ) ( not ( = ?auto_682692 ?auto_682695 ) ) ( not ( = ?auto_682692 ?auto_682696 ) ) ( not ( = ?auto_682692 ?auto_682697 ) ) ( not ( = ?auto_682692 ?auto_682698 ) ) ( not ( = ?auto_682693 ?auto_682694 ) ) ( not ( = ?auto_682693 ?auto_682695 ) ) ( not ( = ?auto_682693 ?auto_682696 ) ) ( not ( = ?auto_682693 ?auto_682697 ) ) ( not ( = ?auto_682693 ?auto_682698 ) ) ( not ( = ?auto_682694 ?auto_682695 ) ) ( not ( = ?auto_682694 ?auto_682696 ) ) ( not ( = ?auto_682694 ?auto_682697 ) ) ( not ( = ?auto_682694 ?auto_682698 ) ) ( not ( = ?auto_682695 ?auto_682696 ) ) ( not ( = ?auto_682695 ?auto_682697 ) ) ( not ( = ?auto_682695 ?auto_682698 ) ) ( not ( = ?auto_682696 ?auto_682697 ) ) ( not ( = ?auto_682696 ?auto_682698 ) ) ( not ( = ?auto_682697 ?auto_682698 ) ) ( ON ?auto_682696 ?auto_682697 ) ( ON ?auto_682695 ?auto_682696 ) ( ON ?auto_682694 ?auto_682695 ) ( ON ?auto_682693 ?auto_682694 ) ( ON ?auto_682692 ?auto_682693 ) ( ON ?auto_682691 ?auto_682692 ) ( ON ?auto_682690 ?auto_682691 ) ( ON ?auto_682689 ?auto_682690 ) ( ON ?auto_682688 ?auto_682689 ) ( ON ?auto_682687 ?auto_682688 ) ( ON ?auto_682686 ?auto_682687 ) ( CLEAR ?auto_682686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_682686 )
      ( MAKE-12PILE ?auto_682686 ?auto_682687 ?auto_682688 ?auto_682689 ?auto_682690 ?auto_682691 ?auto_682692 ?auto_682693 ?auto_682694 ?auto_682695 ?auto_682696 ?auto_682697 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_682737 - BLOCK
      ?auto_682738 - BLOCK
      ?auto_682739 - BLOCK
      ?auto_682740 - BLOCK
      ?auto_682741 - BLOCK
      ?auto_682742 - BLOCK
      ?auto_682743 - BLOCK
      ?auto_682744 - BLOCK
      ?auto_682745 - BLOCK
      ?auto_682746 - BLOCK
      ?auto_682747 - BLOCK
      ?auto_682748 - BLOCK
      ?auto_682749 - BLOCK
    )
    :vars
    (
      ?auto_682750 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_682748 ) ( ON ?auto_682749 ?auto_682750 ) ( CLEAR ?auto_682749 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_682737 ) ( ON ?auto_682738 ?auto_682737 ) ( ON ?auto_682739 ?auto_682738 ) ( ON ?auto_682740 ?auto_682739 ) ( ON ?auto_682741 ?auto_682740 ) ( ON ?auto_682742 ?auto_682741 ) ( ON ?auto_682743 ?auto_682742 ) ( ON ?auto_682744 ?auto_682743 ) ( ON ?auto_682745 ?auto_682744 ) ( ON ?auto_682746 ?auto_682745 ) ( ON ?auto_682747 ?auto_682746 ) ( ON ?auto_682748 ?auto_682747 ) ( not ( = ?auto_682737 ?auto_682738 ) ) ( not ( = ?auto_682737 ?auto_682739 ) ) ( not ( = ?auto_682737 ?auto_682740 ) ) ( not ( = ?auto_682737 ?auto_682741 ) ) ( not ( = ?auto_682737 ?auto_682742 ) ) ( not ( = ?auto_682737 ?auto_682743 ) ) ( not ( = ?auto_682737 ?auto_682744 ) ) ( not ( = ?auto_682737 ?auto_682745 ) ) ( not ( = ?auto_682737 ?auto_682746 ) ) ( not ( = ?auto_682737 ?auto_682747 ) ) ( not ( = ?auto_682737 ?auto_682748 ) ) ( not ( = ?auto_682737 ?auto_682749 ) ) ( not ( = ?auto_682737 ?auto_682750 ) ) ( not ( = ?auto_682738 ?auto_682739 ) ) ( not ( = ?auto_682738 ?auto_682740 ) ) ( not ( = ?auto_682738 ?auto_682741 ) ) ( not ( = ?auto_682738 ?auto_682742 ) ) ( not ( = ?auto_682738 ?auto_682743 ) ) ( not ( = ?auto_682738 ?auto_682744 ) ) ( not ( = ?auto_682738 ?auto_682745 ) ) ( not ( = ?auto_682738 ?auto_682746 ) ) ( not ( = ?auto_682738 ?auto_682747 ) ) ( not ( = ?auto_682738 ?auto_682748 ) ) ( not ( = ?auto_682738 ?auto_682749 ) ) ( not ( = ?auto_682738 ?auto_682750 ) ) ( not ( = ?auto_682739 ?auto_682740 ) ) ( not ( = ?auto_682739 ?auto_682741 ) ) ( not ( = ?auto_682739 ?auto_682742 ) ) ( not ( = ?auto_682739 ?auto_682743 ) ) ( not ( = ?auto_682739 ?auto_682744 ) ) ( not ( = ?auto_682739 ?auto_682745 ) ) ( not ( = ?auto_682739 ?auto_682746 ) ) ( not ( = ?auto_682739 ?auto_682747 ) ) ( not ( = ?auto_682739 ?auto_682748 ) ) ( not ( = ?auto_682739 ?auto_682749 ) ) ( not ( = ?auto_682739 ?auto_682750 ) ) ( not ( = ?auto_682740 ?auto_682741 ) ) ( not ( = ?auto_682740 ?auto_682742 ) ) ( not ( = ?auto_682740 ?auto_682743 ) ) ( not ( = ?auto_682740 ?auto_682744 ) ) ( not ( = ?auto_682740 ?auto_682745 ) ) ( not ( = ?auto_682740 ?auto_682746 ) ) ( not ( = ?auto_682740 ?auto_682747 ) ) ( not ( = ?auto_682740 ?auto_682748 ) ) ( not ( = ?auto_682740 ?auto_682749 ) ) ( not ( = ?auto_682740 ?auto_682750 ) ) ( not ( = ?auto_682741 ?auto_682742 ) ) ( not ( = ?auto_682741 ?auto_682743 ) ) ( not ( = ?auto_682741 ?auto_682744 ) ) ( not ( = ?auto_682741 ?auto_682745 ) ) ( not ( = ?auto_682741 ?auto_682746 ) ) ( not ( = ?auto_682741 ?auto_682747 ) ) ( not ( = ?auto_682741 ?auto_682748 ) ) ( not ( = ?auto_682741 ?auto_682749 ) ) ( not ( = ?auto_682741 ?auto_682750 ) ) ( not ( = ?auto_682742 ?auto_682743 ) ) ( not ( = ?auto_682742 ?auto_682744 ) ) ( not ( = ?auto_682742 ?auto_682745 ) ) ( not ( = ?auto_682742 ?auto_682746 ) ) ( not ( = ?auto_682742 ?auto_682747 ) ) ( not ( = ?auto_682742 ?auto_682748 ) ) ( not ( = ?auto_682742 ?auto_682749 ) ) ( not ( = ?auto_682742 ?auto_682750 ) ) ( not ( = ?auto_682743 ?auto_682744 ) ) ( not ( = ?auto_682743 ?auto_682745 ) ) ( not ( = ?auto_682743 ?auto_682746 ) ) ( not ( = ?auto_682743 ?auto_682747 ) ) ( not ( = ?auto_682743 ?auto_682748 ) ) ( not ( = ?auto_682743 ?auto_682749 ) ) ( not ( = ?auto_682743 ?auto_682750 ) ) ( not ( = ?auto_682744 ?auto_682745 ) ) ( not ( = ?auto_682744 ?auto_682746 ) ) ( not ( = ?auto_682744 ?auto_682747 ) ) ( not ( = ?auto_682744 ?auto_682748 ) ) ( not ( = ?auto_682744 ?auto_682749 ) ) ( not ( = ?auto_682744 ?auto_682750 ) ) ( not ( = ?auto_682745 ?auto_682746 ) ) ( not ( = ?auto_682745 ?auto_682747 ) ) ( not ( = ?auto_682745 ?auto_682748 ) ) ( not ( = ?auto_682745 ?auto_682749 ) ) ( not ( = ?auto_682745 ?auto_682750 ) ) ( not ( = ?auto_682746 ?auto_682747 ) ) ( not ( = ?auto_682746 ?auto_682748 ) ) ( not ( = ?auto_682746 ?auto_682749 ) ) ( not ( = ?auto_682746 ?auto_682750 ) ) ( not ( = ?auto_682747 ?auto_682748 ) ) ( not ( = ?auto_682747 ?auto_682749 ) ) ( not ( = ?auto_682747 ?auto_682750 ) ) ( not ( = ?auto_682748 ?auto_682749 ) ) ( not ( = ?auto_682748 ?auto_682750 ) ) ( not ( = ?auto_682749 ?auto_682750 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_682749 ?auto_682750 )
      ( !STACK ?auto_682749 ?auto_682748 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_682791 - BLOCK
      ?auto_682792 - BLOCK
      ?auto_682793 - BLOCK
      ?auto_682794 - BLOCK
      ?auto_682795 - BLOCK
      ?auto_682796 - BLOCK
      ?auto_682797 - BLOCK
      ?auto_682798 - BLOCK
      ?auto_682799 - BLOCK
      ?auto_682800 - BLOCK
      ?auto_682801 - BLOCK
      ?auto_682802 - BLOCK
      ?auto_682803 - BLOCK
    )
    :vars
    (
      ?auto_682804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_682803 ?auto_682804 ) ( ON-TABLE ?auto_682791 ) ( ON ?auto_682792 ?auto_682791 ) ( ON ?auto_682793 ?auto_682792 ) ( ON ?auto_682794 ?auto_682793 ) ( ON ?auto_682795 ?auto_682794 ) ( ON ?auto_682796 ?auto_682795 ) ( ON ?auto_682797 ?auto_682796 ) ( ON ?auto_682798 ?auto_682797 ) ( ON ?auto_682799 ?auto_682798 ) ( ON ?auto_682800 ?auto_682799 ) ( ON ?auto_682801 ?auto_682800 ) ( not ( = ?auto_682791 ?auto_682792 ) ) ( not ( = ?auto_682791 ?auto_682793 ) ) ( not ( = ?auto_682791 ?auto_682794 ) ) ( not ( = ?auto_682791 ?auto_682795 ) ) ( not ( = ?auto_682791 ?auto_682796 ) ) ( not ( = ?auto_682791 ?auto_682797 ) ) ( not ( = ?auto_682791 ?auto_682798 ) ) ( not ( = ?auto_682791 ?auto_682799 ) ) ( not ( = ?auto_682791 ?auto_682800 ) ) ( not ( = ?auto_682791 ?auto_682801 ) ) ( not ( = ?auto_682791 ?auto_682802 ) ) ( not ( = ?auto_682791 ?auto_682803 ) ) ( not ( = ?auto_682791 ?auto_682804 ) ) ( not ( = ?auto_682792 ?auto_682793 ) ) ( not ( = ?auto_682792 ?auto_682794 ) ) ( not ( = ?auto_682792 ?auto_682795 ) ) ( not ( = ?auto_682792 ?auto_682796 ) ) ( not ( = ?auto_682792 ?auto_682797 ) ) ( not ( = ?auto_682792 ?auto_682798 ) ) ( not ( = ?auto_682792 ?auto_682799 ) ) ( not ( = ?auto_682792 ?auto_682800 ) ) ( not ( = ?auto_682792 ?auto_682801 ) ) ( not ( = ?auto_682792 ?auto_682802 ) ) ( not ( = ?auto_682792 ?auto_682803 ) ) ( not ( = ?auto_682792 ?auto_682804 ) ) ( not ( = ?auto_682793 ?auto_682794 ) ) ( not ( = ?auto_682793 ?auto_682795 ) ) ( not ( = ?auto_682793 ?auto_682796 ) ) ( not ( = ?auto_682793 ?auto_682797 ) ) ( not ( = ?auto_682793 ?auto_682798 ) ) ( not ( = ?auto_682793 ?auto_682799 ) ) ( not ( = ?auto_682793 ?auto_682800 ) ) ( not ( = ?auto_682793 ?auto_682801 ) ) ( not ( = ?auto_682793 ?auto_682802 ) ) ( not ( = ?auto_682793 ?auto_682803 ) ) ( not ( = ?auto_682793 ?auto_682804 ) ) ( not ( = ?auto_682794 ?auto_682795 ) ) ( not ( = ?auto_682794 ?auto_682796 ) ) ( not ( = ?auto_682794 ?auto_682797 ) ) ( not ( = ?auto_682794 ?auto_682798 ) ) ( not ( = ?auto_682794 ?auto_682799 ) ) ( not ( = ?auto_682794 ?auto_682800 ) ) ( not ( = ?auto_682794 ?auto_682801 ) ) ( not ( = ?auto_682794 ?auto_682802 ) ) ( not ( = ?auto_682794 ?auto_682803 ) ) ( not ( = ?auto_682794 ?auto_682804 ) ) ( not ( = ?auto_682795 ?auto_682796 ) ) ( not ( = ?auto_682795 ?auto_682797 ) ) ( not ( = ?auto_682795 ?auto_682798 ) ) ( not ( = ?auto_682795 ?auto_682799 ) ) ( not ( = ?auto_682795 ?auto_682800 ) ) ( not ( = ?auto_682795 ?auto_682801 ) ) ( not ( = ?auto_682795 ?auto_682802 ) ) ( not ( = ?auto_682795 ?auto_682803 ) ) ( not ( = ?auto_682795 ?auto_682804 ) ) ( not ( = ?auto_682796 ?auto_682797 ) ) ( not ( = ?auto_682796 ?auto_682798 ) ) ( not ( = ?auto_682796 ?auto_682799 ) ) ( not ( = ?auto_682796 ?auto_682800 ) ) ( not ( = ?auto_682796 ?auto_682801 ) ) ( not ( = ?auto_682796 ?auto_682802 ) ) ( not ( = ?auto_682796 ?auto_682803 ) ) ( not ( = ?auto_682796 ?auto_682804 ) ) ( not ( = ?auto_682797 ?auto_682798 ) ) ( not ( = ?auto_682797 ?auto_682799 ) ) ( not ( = ?auto_682797 ?auto_682800 ) ) ( not ( = ?auto_682797 ?auto_682801 ) ) ( not ( = ?auto_682797 ?auto_682802 ) ) ( not ( = ?auto_682797 ?auto_682803 ) ) ( not ( = ?auto_682797 ?auto_682804 ) ) ( not ( = ?auto_682798 ?auto_682799 ) ) ( not ( = ?auto_682798 ?auto_682800 ) ) ( not ( = ?auto_682798 ?auto_682801 ) ) ( not ( = ?auto_682798 ?auto_682802 ) ) ( not ( = ?auto_682798 ?auto_682803 ) ) ( not ( = ?auto_682798 ?auto_682804 ) ) ( not ( = ?auto_682799 ?auto_682800 ) ) ( not ( = ?auto_682799 ?auto_682801 ) ) ( not ( = ?auto_682799 ?auto_682802 ) ) ( not ( = ?auto_682799 ?auto_682803 ) ) ( not ( = ?auto_682799 ?auto_682804 ) ) ( not ( = ?auto_682800 ?auto_682801 ) ) ( not ( = ?auto_682800 ?auto_682802 ) ) ( not ( = ?auto_682800 ?auto_682803 ) ) ( not ( = ?auto_682800 ?auto_682804 ) ) ( not ( = ?auto_682801 ?auto_682802 ) ) ( not ( = ?auto_682801 ?auto_682803 ) ) ( not ( = ?auto_682801 ?auto_682804 ) ) ( not ( = ?auto_682802 ?auto_682803 ) ) ( not ( = ?auto_682802 ?auto_682804 ) ) ( not ( = ?auto_682803 ?auto_682804 ) ) ( CLEAR ?auto_682801 ) ( ON ?auto_682802 ?auto_682803 ) ( CLEAR ?auto_682802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_682791 ?auto_682792 ?auto_682793 ?auto_682794 ?auto_682795 ?auto_682796 ?auto_682797 ?auto_682798 ?auto_682799 ?auto_682800 ?auto_682801 ?auto_682802 )
      ( MAKE-13PILE ?auto_682791 ?auto_682792 ?auto_682793 ?auto_682794 ?auto_682795 ?auto_682796 ?auto_682797 ?auto_682798 ?auto_682799 ?auto_682800 ?auto_682801 ?auto_682802 ?auto_682803 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_682845 - BLOCK
      ?auto_682846 - BLOCK
      ?auto_682847 - BLOCK
      ?auto_682848 - BLOCK
      ?auto_682849 - BLOCK
      ?auto_682850 - BLOCK
      ?auto_682851 - BLOCK
      ?auto_682852 - BLOCK
      ?auto_682853 - BLOCK
      ?auto_682854 - BLOCK
      ?auto_682855 - BLOCK
      ?auto_682856 - BLOCK
      ?auto_682857 - BLOCK
    )
    :vars
    (
      ?auto_682858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_682857 ?auto_682858 ) ( ON-TABLE ?auto_682845 ) ( ON ?auto_682846 ?auto_682845 ) ( ON ?auto_682847 ?auto_682846 ) ( ON ?auto_682848 ?auto_682847 ) ( ON ?auto_682849 ?auto_682848 ) ( ON ?auto_682850 ?auto_682849 ) ( ON ?auto_682851 ?auto_682850 ) ( ON ?auto_682852 ?auto_682851 ) ( ON ?auto_682853 ?auto_682852 ) ( ON ?auto_682854 ?auto_682853 ) ( not ( = ?auto_682845 ?auto_682846 ) ) ( not ( = ?auto_682845 ?auto_682847 ) ) ( not ( = ?auto_682845 ?auto_682848 ) ) ( not ( = ?auto_682845 ?auto_682849 ) ) ( not ( = ?auto_682845 ?auto_682850 ) ) ( not ( = ?auto_682845 ?auto_682851 ) ) ( not ( = ?auto_682845 ?auto_682852 ) ) ( not ( = ?auto_682845 ?auto_682853 ) ) ( not ( = ?auto_682845 ?auto_682854 ) ) ( not ( = ?auto_682845 ?auto_682855 ) ) ( not ( = ?auto_682845 ?auto_682856 ) ) ( not ( = ?auto_682845 ?auto_682857 ) ) ( not ( = ?auto_682845 ?auto_682858 ) ) ( not ( = ?auto_682846 ?auto_682847 ) ) ( not ( = ?auto_682846 ?auto_682848 ) ) ( not ( = ?auto_682846 ?auto_682849 ) ) ( not ( = ?auto_682846 ?auto_682850 ) ) ( not ( = ?auto_682846 ?auto_682851 ) ) ( not ( = ?auto_682846 ?auto_682852 ) ) ( not ( = ?auto_682846 ?auto_682853 ) ) ( not ( = ?auto_682846 ?auto_682854 ) ) ( not ( = ?auto_682846 ?auto_682855 ) ) ( not ( = ?auto_682846 ?auto_682856 ) ) ( not ( = ?auto_682846 ?auto_682857 ) ) ( not ( = ?auto_682846 ?auto_682858 ) ) ( not ( = ?auto_682847 ?auto_682848 ) ) ( not ( = ?auto_682847 ?auto_682849 ) ) ( not ( = ?auto_682847 ?auto_682850 ) ) ( not ( = ?auto_682847 ?auto_682851 ) ) ( not ( = ?auto_682847 ?auto_682852 ) ) ( not ( = ?auto_682847 ?auto_682853 ) ) ( not ( = ?auto_682847 ?auto_682854 ) ) ( not ( = ?auto_682847 ?auto_682855 ) ) ( not ( = ?auto_682847 ?auto_682856 ) ) ( not ( = ?auto_682847 ?auto_682857 ) ) ( not ( = ?auto_682847 ?auto_682858 ) ) ( not ( = ?auto_682848 ?auto_682849 ) ) ( not ( = ?auto_682848 ?auto_682850 ) ) ( not ( = ?auto_682848 ?auto_682851 ) ) ( not ( = ?auto_682848 ?auto_682852 ) ) ( not ( = ?auto_682848 ?auto_682853 ) ) ( not ( = ?auto_682848 ?auto_682854 ) ) ( not ( = ?auto_682848 ?auto_682855 ) ) ( not ( = ?auto_682848 ?auto_682856 ) ) ( not ( = ?auto_682848 ?auto_682857 ) ) ( not ( = ?auto_682848 ?auto_682858 ) ) ( not ( = ?auto_682849 ?auto_682850 ) ) ( not ( = ?auto_682849 ?auto_682851 ) ) ( not ( = ?auto_682849 ?auto_682852 ) ) ( not ( = ?auto_682849 ?auto_682853 ) ) ( not ( = ?auto_682849 ?auto_682854 ) ) ( not ( = ?auto_682849 ?auto_682855 ) ) ( not ( = ?auto_682849 ?auto_682856 ) ) ( not ( = ?auto_682849 ?auto_682857 ) ) ( not ( = ?auto_682849 ?auto_682858 ) ) ( not ( = ?auto_682850 ?auto_682851 ) ) ( not ( = ?auto_682850 ?auto_682852 ) ) ( not ( = ?auto_682850 ?auto_682853 ) ) ( not ( = ?auto_682850 ?auto_682854 ) ) ( not ( = ?auto_682850 ?auto_682855 ) ) ( not ( = ?auto_682850 ?auto_682856 ) ) ( not ( = ?auto_682850 ?auto_682857 ) ) ( not ( = ?auto_682850 ?auto_682858 ) ) ( not ( = ?auto_682851 ?auto_682852 ) ) ( not ( = ?auto_682851 ?auto_682853 ) ) ( not ( = ?auto_682851 ?auto_682854 ) ) ( not ( = ?auto_682851 ?auto_682855 ) ) ( not ( = ?auto_682851 ?auto_682856 ) ) ( not ( = ?auto_682851 ?auto_682857 ) ) ( not ( = ?auto_682851 ?auto_682858 ) ) ( not ( = ?auto_682852 ?auto_682853 ) ) ( not ( = ?auto_682852 ?auto_682854 ) ) ( not ( = ?auto_682852 ?auto_682855 ) ) ( not ( = ?auto_682852 ?auto_682856 ) ) ( not ( = ?auto_682852 ?auto_682857 ) ) ( not ( = ?auto_682852 ?auto_682858 ) ) ( not ( = ?auto_682853 ?auto_682854 ) ) ( not ( = ?auto_682853 ?auto_682855 ) ) ( not ( = ?auto_682853 ?auto_682856 ) ) ( not ( = ?auto_682853 ?auto_682857 ) ) ( not ( = ?auto_682853 ?auto_682858 ) ) ( not ( = ?auto_682854 ?auto_682855 ) ) ( not ( = ?auto_682854 ?auto_682856 ) ) ( not ( = ?auto_682854 ?auto_682857 ) ) ( not ( = ?auto_682854 ?auto_682858 ) ) ( not ( = ?auto_682855 ?auto_682856 ) ) ( not ( = ?auto_682855 ?auto_682857 ) ) ( not ( = ?auto_682855 ?auto_682858 ) ) ( not ( = ?auto_682856 ?auto_682857 ) ) ( not ( = ?auto_682856 ?auto_682858 ) ) ( not ( = ?auto_682857 ?auto_682858 ) ) ( ON ?auto_682856 ?auto_682857 ) ( CLEAR ?auto_682854 ) ( ON ?auto_682855 ?auto_682856 ) ( CLEAR ?auto_682855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_682845 ?auto_682846 ?auto_682847 ?auto_682848 ?auto_682849 ?auto_682850 ?auto_682851 ?auto_682852 ?auto_682853 ?auto_682854 ?auto_682855 )
      ( MAKE-13PILE ?auto_682845 ?auto_682846 ?auto_682847 ?auto_682848 ?auto_682849 ?auto_682850 ?auto_682851 ?auto_682852 ?auto_682853 ?auto_682854 ?auto_682855 ?auto_682856 ?auto_682857 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_682899 - BLOCK
      ?auto_682900 - BLOCK
      ?auto_682901 - BLOCK
      ?auto_682902 - BLOCK
      ?auto_682903 - BLOCK
      ?auto_682904 - BLOCK
      ?auto_682905 - BLOCK
      ?auto_682906 - BLOCK
      ?auto_682907 - BLOCK
      ?auto_682908 - BLOCK
      ?auto_682909 - BLOCK
      ?auto_682910 - BLOCK
      ?auto_682911 - BLOCK
    )
    :vars
    (
      ?auto_682912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_682911 ?auto_682912 ) ( ON-TABLE ?auto_682899 ) ( ON ?auto_682900 ?auto_682899 ) ( ON ?auto_682901 ?auto_682900 ) ( ON ?auto_682902 ?auto_682901 ) ( ON ?auto_682903 ?auto_682902 ) ( ON ?auto_682904 ?auto_682903 ) ( ON ?auto_682905 ?auto_682904 ) ( ON ?auto_682906 ?auto_682905 ) ( ON ?auto_682907 ?auto_682906 ) ( not ( = ?auto_682899 ?auto_682900 ) ) ( not ( = ?auto_682899 ?auto_682901 ) ) ( not ( = ?auto_682899 ?auto_682902 ) ) ( not ( = ?auto_682899 ?auto_682903 ) ) ( not ( = ?auto_682899 ?auto_682904 ) ) ( not ( = ?auto_682899 ?auto_682905 ) ) ( not ( = ?auto_682899 ?auto_682906 ) ) ( not ( = ?auto_682899 ?auto_682907 ) ) ( not ( = ?auto_682899 ?auto_682908 ) ) ( not ( = ?auto_682899 ?auto_682909 ) ) ( not ( = ?auto_682899 ?auto_682910 ) ) ( not ( = ?auto_682899 ?auto_682911 ) ) ( not ( = ?auto_682899 ?auto_682912 ) ) ( not ( = ?auto_682900 ?auto_682901 ) ) ( not ( = ?auto_682900 ?auto_682902 ) ) ( not ( = ?auto_682900 ?auto_682903 ) ) ( not ( = ?auto_682900 ?auto_682904 ) ) ( not ( = ?auto_682900 ?auto_682905 ) ) ( not ( = ?auto_682900 ?auto_682906 ) ) ( not ( = ?auto_682900 ?auto_682907 ) ) ( not ( = ?auto_682900 ?auto_682908 ) ) ( not ( = ?auto_682900 ?auto_682909 ) ) ( not ( = ?auto_682900 ?auto_682910 ) ) ( not ( = ?auto_682900 ?auto_682911 ) ) ( not ( = ?auto_682900 ?auto_682912 ) ) ( not ( = ?auto_682901 ?auto_682902 ) ) ( not ( = ?auto_682901 ?auto_682903 ) ) ( not ( = ?auto_682901 ?auto_682904 ) ) ( not ( = ?auto_682901 ?auto_682905 ) ) ( not ( = ?auto_682901 ?auto_682906 ) ) ( not ( = ?auto_682901 ?auto_682907 ) ) ( not ( = ?auto_682901 ?auto_682908 ) ) ( not ( = ?auto_682901 ?auto_682909 ) ) ( not ( = ?auto_682901 ?auto_682910 ) ) ( not ( = ?auto_682901 ?auto_682911 ) ) ( not ( = ?auto_682901 ?auto_682912 ) ) ( not ( = ?auto_682902 ?auto_682903 ) ) ( not ( = ?auto_682902 ?auto_682904 ) ) ( not ( = ?auto_682902 ?auto_682905 ) ) ( not ( = ?auto_682902 ?auto_682906 ) ) ( not ( = ?auto_682902 ?auto_682907 ) ) ( not ( = ?auto_682902 ?auto_682908 ) ) ( not ( = ?auto_682902 ?auto_682909 ) ) ( not ( = ?auto_682902 ?auto_682910 ) ) ( not ( = ?auto_682902 ?auto_682911 ) ) ( not ( = ?auto_682902 ?auto_682912 ) ) ( not ( = ?auto_682903 ?auto_682904 ) ) ( not ( = ?auto_682903 ?auto_682905 ) ) ( not ( = ?auto_682903 ?auto_682906 ) ) ( not ( = ?auto_682903 ?auto_682907 ) ) ( not ( = ?auto_682903 ?auto_682908 ) ) ( not ( = ?auto_682903 ?auto_682909 ) ) ( not ( = ?auto_682903 ?auto_682910 ) ) ( not ( = ?auto_682903 ?auto_682911 ) ) ( not ( = ?auto_682903 ?auto_682912 ) ) ( not ( = ?auto_682904 ?auto_682905 ) ) ( not ( = ?auto_682904 ?auto_682906 ) ) ( not ( = ?auto_682904 ?auto_682907 ) ) ( not ( = ?auto_682904 ?auto_682908 ) ) ( not ( = ?auto_682904 ?auto_682909 ) ) ( not ( = ?auto_682904 ?auto_682910 ) ) ( not ( = ?auto_682904 ?auto_682911 ) ) ( not ( = ?auto_682904 ?auto_682912 ) ) ( not ( = ?auto_682905 ?auto_682906 ) ) ( not ( = ?auto_682905 ?auto_682907 ) ) ( not ( = ?auto_682905 ?auto_682908 ) ) ( not ( = ?auto_682905 ?auto_682909 ) ) ( not ( = ?auto_682905 ?auto_682910 ) ) ( not ( = ?auto_682905 ?auto_682911 ) ) ( not ( = ?auto_682905 ?auto_682912 ) ) ( not ( = ?auto_682906 ?auto_682907 ) ) ( not ( = ?auto_682906 ?auto_682908 ) ) ( not ( = ?auto_682906 ?auto_682909 ) ) ( not ( = ?auto_682906 ?auto_682910 ) ) ( not ( = ?auto_682906 ?auto_682911 ) ) ( not ( = ?auto_682906 ?auto_682912 ) ) ( not ( = ?auto_682907 ?auto_682908 ) ) ( not ( = ?auto_682907 ?auto_682909 ) ) ( not ( = ?auto_682907 ?auto_682910 ) ) ( not ( = ?auto_682907 ?auto_682911 ) ) ( not ( = ?auto_682907 ?auto_682912 ) ) ( not ( = ?auto_682908 ?auto_682909 ) ) ( not ( = ?auto_682908 ?auto_682910 ) ) ( not ( = ?auto_682908 ?auto_682911 ) ) ( not ( = ?auto_682908 ?auto_682912 ) ) ( not ( = ?auto_682909 ?auto_682910 ) ) ( not ( = ?auto_682909 ?auto_682911 ) ) ( not ( = ?auto_682909 ?auto_682912 ) ) ( not ( = ?auto_682910 ?auto_682911 ) ) ( not ( = ?auto_682910 ?auto_682912 ) ) ( not ( = ?auto_682911 ?auto_682912 ) ) ( ON ?auto_682910 ?auto_682911 ) ( ON ?auto_682909 ?auto_682910 ) ( CLEAR ?auto_682907 ) ( ON ?auto_682908 ?auto_682909 ) ( CLEAR ?auto_682908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_682899 ?auto_682900 ?auto_682901 ?auto_682902 ?auto_682903 ?auto_682904 ?auto_682905 ?auto_682906 ?auto_682907 ?auto_682908 )
      ( MAKE-13PILE ?auto_682899 ?auto_682900 ?auto_682901 ?auto_682902 ?auto_682903 ?auto_682904 ?auto_682905 ?auto_682906 ?auto_682907 ?auto_682908 ?auto_682909 ?auto_682910 ?auto_682911 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_682953 - BLOCK
      ?auto_682954 - BLOCK
      ?auto_682955 - BLOCK
      ?auto_682956 - BLOCK
      ?auto_682957 - BLOCK
      ?auto_682958 - BLOCK
      ?auto_682959 - BLOCK
      ?auto_682960 - BLOCK
      ?auto_682961 - BLOCK
      ?auto_682962 - BLOCK
      ?auto_682963 - BLOCK
      ?auto_682964 - BLOCK
      ?auto_682965 - BLOCK
    )
    :vars
    (
      ?auto_682966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_682965 ?auto_682966 ) ( ON-TABLE ?auto_682953 ) ( ON ?auto_682954 ?auto_682953 ) ( ON ?auto_682955 ?auto_682954 ) ( ON ?auto_682956 ?auto_682955 ) ( ON ?auto_682957 ?auto_682956 ) ( ON ?auto_682958 ?auto_682957 ) ( ON ?auto_682959 ?auto_682958 ) ( ON ?auto_682960 ?auto_682959 ) ( not ( = ?auto_682953 ?auto_682954 ) ) ( not ( = ?auto_682953 ?auto_682955 ) ) ( not ( = ?auto_682953 ?auto_682956 ) ) ( not ( = ?auto_682953 ?auto_682957 ) ) ( not ( = ?auto_682953 ?auto_682958 ) ) ( not ( = ?auto_682953 ?auto_682959 ) ) ( not ( = ?auto_682953 ?auto_682960 ) ) ( not ( = ?auto_682953 ?auto_682961 ) ) ( not ( = ?auto_682953 ?auto_682962 ) ) ( not ( = ?auto_682953 ?auto_682963 ) ) ( not ( = ?auto_682953 ?auto_682964 ) ) ( not ( = ?auto_682953 ?auto_682965 ) ) ( not ( = ?auto_682953 ?auto_682966 ) ) ( not ( = ?auto_682954 ?auto_682955 ) ) ( not ( = ?auto_682954 ?auto_682956 ) ) ( not ( = ?auto_682954 ?auto_682957 ) ) ( not ( = ?auto_682954 ?auto_682958 ) ) ( not ( = ?auto_682954 ?auto_682959 ) ) ( not ( = ?auto_682954 ?auto_682960 ) ) ( not ( = ?auto_682954 ?auto_682961 ) ) ( not ( = ?auto_682954 ?auto_682962 ) ) ( not ( = ?auto_682954 ?auto_682963 ) ) ( not ( = ?auto_682954 ?auto_682964 ) ) ( not ( = ?auto_682954 ?auto_682965 ) ) ( not ( = ?auto_682954 ?auto_682966 ) ) ( not ( = ?auto_682955 ?auto_682956 ) ) ( not ( = ?auto_682955 ?auto_682957 ) ) ( not ( = ?auto_682955 ?auto_682958 ) ) ( not ( = ?auto_682955 ?auto_682959 ) ) ( not ( = ?auto_682955 ?auto_682960 ) ) ( not ( = ?auto_682955 ?auto_682961 ) ) ( not ( = ?auto_682955 ?auto_682962 ) ) ( not ( = ?auto_682955 ?auto_682963 ) ) ( not ( = ?auto_682955 ?auto_682964 ) ) ( not ( = ?auto_682955 ?auto_682965 ) ) ( not ( = ?auto_682955 ?auto_682966 ) ) ( not ( = ?auto_682956 ?auto_682957 ) ) ( not ( = ?auto_682956 ?auto_682958 ) ) ( not ( = ?auto_682956 ?auto_682959 ) ) ( not ( = ?auto_682956 ?auto_682960 ) ) ( not ( = ?auto_682956 ?auto_682961 ) ) ( not ( = ?auto_682956 ?auto_682962 ) ) ( not ( = ?auto_682956 ?auto_682963 ) ) ( not ( = ?auto_682956 ?auto_682964 ) ) ( not ( = ?auto_682956 ?auto_682965 ) ) ( not ( = ?auto_682956 ?auto_682966 ) ) ( not ( = ?auto_682957 ?auto_682958 ) ) ( not ( = ?auto_682957 ?auto_682959 ) ) ( not ( = ?auto_682957 ?auto_682960 ) ) ( not ( = ?auto_682957 ?auto_682961 ) ) ( not ( = ?auto_682957 ?auto_682962 ) ) ( not ( = ?auto_682957 ?auto_682963 ) ) ( not ( = ?auto_682957 ?auto_682964 ) ) ( not ( = ?auto_682957 ?auto_682965 ) ) ( not ( = ?auto_682957 ?auto_682966 ) ) ( not ( = ?auto_682958 ?auto_682959 ) ) ( not ( = ?auto_682958 ?auto_682960 ) ) ( not ( = ?auto_682958 ?auto_682961 ) ) ( not ( = ?auto_682958 ?auto_682962 ) ) ( not ( = ?auto_682958 ?auto_682963 ) ) ( not ( = ?auto_682958 ?auto_682964 ) ) ( not ( = ?auto_682958 ?auto_682965 ) ) ( not ( = ?auto_682958 ?auto_682966 ) ) ( not ( = ?auto_682959 ?auto_682960 ) ) ( not ( = ?auto_682959 ?auto_682961 ) ) ( not ( = ?auto_682959 ?auto_682962 ) ) ( not ( = ?auto_682959 ?auto_682963 ) ) ( not ( = ?auto_682959 ?auto_682964 ) ) ( not ( = ?auto_682959 ?auto_682965 ) ) ( not ( = ?auto_682959 ?auto_682966 ) ) ( not ( = ?auto_682960 ?auto_682961 ) ) ( not ( = ?auto_682960 ?auto_682962 ) ) ( not ( = ?auto_682960 ?auto_682963 ) ) ( not ( = ?auto_682960 ?auto_682964 ) ) ( not ( = ?auto_682960 ?auto_682965 ) ) ( not ( = ?auto_682960 ?auto_682966 ) ) ( not ( = ?auto_682961 ?auto_682962 ) ) ( not ( = ?auto_682961 ?auto_682963 ) ) ( not ( = ?auto_682961 ?auto_682964 ) ) ( not ( = ?auto_682961 ?auto_682965 ) ) ( not ( = ?auto_682961 ?auto_682966 ) ) ( not ( = ?auto_682962 ?auto_682963 ) ) ( not ( = ?auto_682962 ?auto_682964 ) ) ( not ( = ?auto_682962 ?auto_682965 ) ) ( not ( = ?auto_682962 ?auto_682966 ) ) ( not ( = ?auto_682963 ?auto_682964 ) ) ( not ( = ?auto_682963 ?auto_682965 ) ) ( not ( = ?auto_682963 ?auto_682966 ) ) ( not ( = ?auto_682964 ?auto_682965 ) ) ( not ( = ?auto_682964 ?auto_682966 ) ) ( not ( = ?auto_682965 ?auto_682966 ) ) ( ON ?auto_682964 ?auto_682965 ) ( ON ?auto_682963 ?auto_682964 ) ( ON ?auto_682962 ?auto_682963 ) ( CLEAR ?auto_682960 ) ( ON ?auto_682961 ?auto_682962 ) ( CLEAR ?auto_682961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_682953 ?auto_682954 ?auto_682955 ?auto_682956 ?auto_682957 ?auto_682958 ?auto_682959 ?auto_682960 ?auto_682961 )
      ( MAKE-13PILE ?auto_682953 ?auto_682954 ?auto_682955 ?auto_682956 ?auto_682957 ?auto_682958 ?auto_682959 ?auto_682960 ?auto_682961 ?auto_682962 ?auto_682963 ?auto_682964 ?auto_682965 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_683007 - BLOCK
      ?auto_683008 - BLOCK
      ?auto_683009 - BLOCK
      ?auto_683010 - BLOCK
      ?auto_683011 - BLOCK
      ?auto_683012 - BLOCK
      ?auto_683013 - BLOCK
      ?auto_683014 - BLOCK
      ?auto_683015 - BLOCK
      ?auto_683016 - BLOCK
      ?auto_683017 - BLOCK
      ?auto_683018 - BLOCK
      ?auto_683019 - BLOCK
    )
    :vars
    (
      ?auto_683020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_683019 ?auto_683020 ) ( ON-TABLE ?auto_683007 ) ( ON ?auto_683008 ?auto_683007 ) ( ON ?auto_683009 ?auto_683008 ) ( ON ?auto_683010 ?auto_683009 ) ( ON ?auto_683011 ?auto_683010 ) ( ON ?auto_683012 ?auto_683011 ) ( ON ?auto_683013 ?auto_683012 ) ( not ( = ?auto_683007 ?auto_683008 ) ) ( not ( = ?auto_683007 ?auto_683009 ) ) ( not ( = ?auto_683007 ?auto_683010 ) ) ( not ( = ?auto_683007 ?auto_683011 ) ) ( not ( = ?auto_683007 ?auto_683012 ) ) ( not ( = ?auto_683007 ?auto_683013 ) ) ( not ( = ?auto_683007 ?auto_683014 ) ) ( not ( = ?auto_683007 ?auto_683015 ) ) ( not ( = ?auto_683007 ?auto_683016 ) ) ( not ( = ?auto_683007 ?auto_683017 ) ) ( not ( = ?auto_683007 ?auto_683018 ) ) ( not ( = ?auto_683007 ?auto_683019 ) ) ( not ( = ?auto_683007 ?auto_683020 ) ) ( not ( = ?auto_683008 ?auto_683009 ) ) ( not ( = ?auto_683008 ?auto_683010 ) ) ( not ( = ?auto_683008 ?auto_683011 ) ) ( not ( = ?auto_683008 ?auto_683012 ) ) ( not ( = ?auto_683008 ?auto_683013 ) ) ( not ( = ?auto_683008 ?auto_683014 ) ) ( not ( = ?auto_683008 ?auto_683015 ) ) ( not ( = ?auto_683008 ?auto_683016 ) ) ( not ( = ?auto_683008 ?auto_683017 ) ) ( not ( = ?auto_683008 ?auto_683018 ) ) ( not ( = ?auto_683008 ?auto_683019 ) ) ( not ( = ?auto_683008 ?auto_683020 ) ) ( not ( = ?auto_683009 ?auto_683010 ) ) ( not ( = ?auto_683009 ?auto_683011 ) ) ( not ( = ?auto_683009 ?auto_683012 ) ) ( not ( = ?auto_683009 ?auto_683013 ) ) ( not ( = ?auto_683009 ?auto_683014 ) ) ( not ( = ?auto_683009 ?auto_683015 ) ) ( not ( = ?auto_683009 ?auto_683016 ) ) ( not ( = ?auto_683009 ?auto_683017 ) ) ( not ( = ?auto_683009 ?auto_683018 ) ) ( not ( = ?auto_683009 ?auto_683019 ) ) ( not ( = ?auto_683009 ?auto_683020 ) ) ( not ( = ?auto_683010 ?auto_683011 ) ) ( not ( = ?auto_683010 ?auto_683012 ) ) ( not ( = ?auto_683010 ?auto_683013 ) ) ( not ( = ?auto_683010 ?auto_683014 ) ) ( not ( = ?auto_683010 ?auto_683015 ) ) ( not ( = ?auto_683010 ?auto_683016 ) ) ( not ( = ?auto_683010 ?auto_683017 ) ) ( not ( = ?auto_683010 ?auto_683018 ) ) ( not ( = ?auto_683010 ?auto_683019 ) ) ( not ( = ?auto_683010 ?auto_683020 ) ) ( not ( = ?auto_683011 ?auto_683012 ) ) ( not ( = ?auto_683011 ?auto_683013 ) ) ( not ( = ?auto_683011 ?auto_683014 ) ) ( not ( = ?auto_683011 ?auto_683015 ) ) ( not ( = ?auto_683011 ?auto_683016 ) ) ( not ( = ?auto_683011 ?auto_683017 ) ) ( not ( = ?auto_683011 ?auto_683018 ) ) ( not ( = ?auto_683011 ?auto_683019 ) ) ( not ( = ?auto_683011 ?auto_683020 ) ) ( not ( = ?auto_683012 ?auto_683013 ) ) ( not ( = ?auto_683012 ?auto_683014 ) ) ( not ( = ?auto_683012 ?auto_683015 ) ) ( not ( = ?auto_683012 ?auto_683016 ) ) ( not ( = ?auto_683012 ?auto_683017 ) ) ( not ( = ?auto_683012 ?auto_683018 ) ) ( not ( = ?auto_683012 ?auto_683019 ) ) ( not ( = ?auto_683012 ?auto_683020 ) ) ( not ( = ?auto_683013 ?auto_683014 ) ) ( not ( = ?auto_683013 ?auto_683015 ) ) ( not ( = ?auto_683013 ?auto_683016 ) ) ( not ( = ?auto_683013 ?auto_683017 ) ) ( not ( = ?auto_683013 ?auto_683018 ) ) ( not ( = ?auto_683013 ?auto_683019 ) ) ( not ( = ?auto_683013 ?auto_683020 ) ) ( not ( = ?auto_683014 ?auto_683015 ) ) ( not ( = ?auto_683014 ?auto_683016 ) ) ( not ( = ?auto_683014 ?auto_683017 ) ) ( not ( = ?auto_683014 ?auto_683018 ) ) ( not ( = ?auto_683014 ?auto_683019 ) ) ( not ( = ?auto_683014 ?auto_683020 ) ) ( not ( = ?auto_683015 ?auto_683016 ) ) ( not ( = ?auto_683015 ?auto_683017 ) ) ( not ( = ?auto_683015 ?auto_683018 ) ) ( not ( = ?auto_683015 ?auto_683019 ) ) ( not ( = ?auto_683015 ?auto_683020 ) ) ( not ( = ?auto_683016 ?auto_683017 ) ) ( not ( = ?auto_683016 ?auto_683018 ) ) ( not ( = ?auto_683016 ?auto_683019 ) ) ( not ( = ?auto_683016 ?auto_683020 ) ) ( not ( = ?auto_683017 ?auto_683018 ) ) ( not ( = ?auto_683017 ?auto_683019 ) ) ( not ( = ?auto_683017 ?auto_683020 ) ) ( not ( = ?auto_683018 ?auto_683019 ) ) ( not ( = ?auto_683018 ?auto_683020 ) ) ( not ( = ?auto_683019 ?auto_683020 ) ) ( ON ?auto_683018 ?auto_683019 ) ( ON ?auto_683017 ?auto_683018 ) ( ON ?auto_683016 ?auto_683017 ) ( ON ?auto_683015 ?auto_683016 ) ( CLEAR ?auto_683013 ) ( ON ?auto_683014 ?auto_683015 ) ( CLEAR ?auto_683014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_683007 ?auto_683008 ?auto_683009 ?auto_683010 ?auto_683011 ?auto_683012 ?auto_683013 ?auto_683014 )
      ( MAKE-13PILE ?auto_683007 ?auto_683008 ?auto_683009 ?auto_683010 ?auto_683011 ?auto_683012 ?auto_683013 ?auto_683014 ?auto_683015 ?auto_683016 ?auto_683017 ?auto_683018 ?auto_683019 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_683061 - BLOCK
      ?auto_683062 - BLOCK
      ?auto_683063 - BLOCK
      ?auto_683064 - BLOCK
      ?auto_683065 - BLOCK
      ?auto_683066 - BLOCK
      ?auto_683067 - BLOCK
      ?auto_683068 - BLOCK
      ?auto_683069 - BLOCK
      ?auto_683070 - BLOCK
      ?auto_683071 - BLOCK
      ?auto_683072 - BLOCK
      ?auto_683073 - BLOCK
    )
    :vars
    (
      ?auto_683074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_683073 ?auto_683074 ) ( ON-TABLE ?auto_683061 ) ( ON ?auto_683062 ?auto_683061 ) ( ON ?auto_683063 ?auto_683062 ) ( ON ?auto_683064 ?auto_683063 ) ( ON ?auto_683065 ?auto_683064 ) ( ON ?auto_683066 ?auto_683065 ) ( not ( = ?auto_683061 ?auto_683062 ) ) ( not ( = ?auto_683061 ?auto_683063 ) ) ( not ( = ?auto_683061 ?auto_683064 ) ) ( not ( = ?auto_683061 ?auto_683065 ) ) ( not ( = ?auto_683061 ?auto_683066 ) ) ( not ( = ?auto_683061 ?auto_683067 ) ) ( not ( = ?auto_683061 ?auto_683068 ) ) ( not ( = ?auto_683061 ?auto_683069 ) ) ( not ( = ?auto_683061 ?auto_683070 ) ) ( not ( = ?auto_683061 ?auto_683071 ) ) ( not ( = ?auto_683061 ?auto_683072 ) ) ( not ( = ?auto_683061 ?auto_683073 ) ) ( not ( = ?auto_683061 ?auto_683074 ) ) ( not ( = ?auto_683062 ?auto_683063 ) ) ( not ( = ?auto_683062 ?auto_683064 ) ) ( not ( = ?auto_683062 ?auto_683065 ) ) ( not ( = ?auto_683062 ?auto_683066 ) ) ( not ( = ?auto_683062 ?auto_683067 ) ) ( not ( = ?auto_683062 ?auto_683068 ) ) ( not ( = ?auto_683062 ?auto_683069 ) ) ( not ( = ?auto_683062 ?auto_683070 ) ) ( not ( = ?auto_683062 ?auto_683071 ) ) ( not ( = ?auto_683062 ?auto_683072 ) ) ( not ( = ?auto_683062 ?auto_683073 ) ) ( not ( = ?auto_683062 ?auto_683074 ) ) ( not ( = ?auto_683063 ?auto_683064 ) ) ( not ( = ?auto_683063 ?auto_683065 ) ) ( not ( = ?auto_683063 ?auto_683066 ) ) ( not ( = ?auto_683063 ?auto_683067 ) ) ( not ( = ?auto_683063 ?auto_683068 ) ) ( not ( = ?auto_683063 ?auto_683069 ) ) ( not ( = ?auto_683063 ?auto_683070 ) ) ( not ( = ?auto_683063 ?auto_683071 ) ) ( not ( = ?auto_683063 ?auto_683072 ) ) ( not ( = ?auto_683063 ?auto_683073 ) ) ( not ( = ?auto_683063 ?auto_683074 ) ) ( not ( = ?auto_683064 ?auto_683065 ) ) ( not ( = ?auto_683064 ?auto_683066 ) ) ( not ( = ?auto_683064 ?auto_683067 ) ) ( not ( = ?auto_683064 ?auto_683068 ) ) ( not ( = ?auto_683064 ?auto_683069 ) ) ( not ( = ?auto_683064 ?auto_683070 ) ) ( not ( = ?auto_683064 ?auto_683071 ) ) ( not ( = ?auto_683064 ?auto_683072 ) ) ( not ( = ?auto_683064 ?auto_683073 ) ) ( not ( = ?auto_683064 ?auto_683074 ) ) ( not ( = ?auto_683065 ?auto_683066 ) ) ( not ( = ?auto_683065 ?auto_683067 ) ) ( not ( = ?auto_683065 ?auto_683068 ) ) ( not ( = ?auto_683065 ?auto_683069 ) ) ( not ( = ?auto_683065 ?auto_683070 ) ) ( not ( = ?auto_683065 ?auto_683071 ) ) ( not ( = ?auto_683065 ?auto_683072 ) ) ( not ( = ?auto_683065 ?auto_683073 ) ) ( not ( = ?auto_683065 ?auto_683074 ) ) ( not ( = ?auto_683066 ?auto_683067 ) ) ( not ( = ?auto_683066 ?auto_683068 ) ) ( not ( = ?auto_683066 ?auto_683069 ) ) ( not ( = ?auto_683066 ?auto_683070 ) ) ( not ( = ?auto_683066 ?auto_683071 ) ) ( not ( = ?auto_683066 ?auto_683072 ) ) ( not ( = ?auto_683066 ?auto_683073 ) ) ( not ( = ?auto_683066 ?auto_683074 ) ) ( not ( = ?auto_683067 ?auto_683068 ) ) ( not ( = ?auto_683067 ?auto_683069 ) ) ( not ( = ?auto_683067 ?auto_683070 ) ) ( not ( = ?auto_683067 ?auto_683071 ) ) ( not ( = ?auto_683067 ?auto_683072 ) ) ( not ( = ?auto_683067 ?auto_683073 ) ) ( not ( = ?auto_683067 ?auto_683074 ) ) ( not ( = ?auto_683068 ?auto_683069 ) ) ( not ( = ?auto_683068 ?auto_683070 ) ) ( not ( = ?auto_683068 ?auto_683071 ) ) ( not ( = ?auto_683068 ?auto_683072 ) ) ( not ( = ?auto_683068 ?auto_683073 ) ) ( not ( = ?auto_683068 ?auto_683074 ) ) ( not ( = ?auto_683069 ?auto_683070 ) ) ( not ( = ?auto_683069 ?auto_683071 ) ) ( not ( = ?auto_683069 ?auto_683072 ) ) ( not ( = ?auto_683069 ?auto_683073 ) ) ( not ( = ?auto_683069 ?auto_683074 ) ) ( not ( = ?auto_683070 ?auto_683071 ) ) ( not ( = ?auto_683070 ?auto_683072 ) ) ( not ( = ?auto_683070 ?auto_683073 ) ) ( not ( = ?auto_683070 ?auto_683074 ) ) ( not ( = ?auto_683071 ?auto_683072 ) ) ( not ( = ?auto_683071 ?auto_683073 ) ) ( not ( = ?auto_683071 ?auto_683074 ) ) ( not ( = ?auto_683072 ?auto_683073 ) ) ( not ( = ?auto_683072 ?auto_683074 ) ) ( not ( = ?auto_683073 ?auto_683074 ) ) ( ON ?auto_683072 ?auto_683073 ) ( ON ?auto_683071 ?auto_683072 ) ( ON ?auto_683070 ?auto_683071 ) ( ON ?auto_683069 ?auto_683070 ) ( ON ?auto_683068 ?auto_683069 ) ( CLEAR ?auto_683066 ) ( ON ?auto_683067 ?auto_683068 ) ( CLEAR ?auto_683067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_683061 ?auto_683062 ?auto_683063 ?auto_683064 ?auto_683065 ?auto_683066 ?auto_683067 )
      ( MAKE-13PILE ?auto_683061 ?auto_683062 ?auto_683063 ?auto_683064 ?auto_683065 ?auto_683066 ?auto_683067 ?auto_683068 ?auto_683069 ?auto_683070 ?auto_683071 ?auto_683072 ?auto_683073 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_683115 - BLOCK
      ?auto_683116 - BLOCK
      ?auto_683117 - BLOCK
      ?auto_683118 - BLOCK
      ?auto_683119 - BLOCK
      ?auto_683120 - BLOCK
      ?auto_683121 - BLOCK
      ?auto_683122 - BLOCK
      ?auto_683123 - BLOCK
      ?auto_683124 - BLOCK
      ?auto_683125 - BLOCK
      ?auto_683126 - BLOCK
      ?auto_683127 - BLOCK
    )
    :vars
    (
      ?auto_683128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_683127 ?auto_683128 ) ( ON-TABLE ?auto_683115 ) ( ON ?auto_683116 ?auto_683115 ) ( ON ?auto_683117 ?auto_683116 ) ( ON ?auto_683118 ?auto_683117 ) ( ON ?auto_683119 ?auto_683118 ) ( not ( = ?auto_683115 ?auto_683116 ) ) ( not ( = ?auto_683115 ?auto_683117 ) ) ( not ( = ?auto_683115 ?auto_683118 ) ) ( not ( = ?auto_683115 ?auto_683119 ) ) ( not ( = ?auto_683115 ?auto_683120 ) ) ( not ( = ?auto_683115 ?auto_683121 ) ) ( not ( = ?auto_683115 ?auto_683122 ) ) ( not ( = ?auto_683115 ?auto_683123 ) ) ( not ( = ?auto_683115 ?auto_683124 ) ) ( not ( = ?auto_683115 ?auto_683125 ) ) ( not ( = ?auto_683115 ?auto_683126 ) ) ( not ( = ?auto_683115 ?auto_683127 ) ) ( not ( = ?auto_683115 ?auto_683128 ) ) ( not ( = ?auto_683116 ?auto_683117 ) ) ( not ( = ?auto_683116 ?auto_683118 ) ) ( not ( = ?auto_683116 ?auto_683119 ) ) ( not ( = ?auto_683116 ?auto_683120 ) ) ( not ( = ?auto_683116 ?auto_683121 ) ) ( not ( = ?auto_683116 ?auto_683122 ) ) ( not ( = ?auto_683116 ?auto_683123 ) ) ( not ( = ?auto_683116 ?auto_683124 ) ) ( not ( = ?auto_683116 ?auto_683125 ) ) ( not ( = ?auto_683116 ?auto_683126 ) ) ( not ( = ?auto_683116 ?auto_683127 ) ) ( not ( = ?auto_683116 ?auto_683128 ) ) ( not ( = ?auto_683117 ?auto_683118 ) ) ( not ( = ?auto_683117 ?auto_683119 ) ) ( not ( = ?auto_683117 ?auto_683120 ) ) ( not ( = ?auto_683117 ?auto_683121 ) ) ( not ( = ?auto_683117 ?auto_683122 ) ) ( not ( = ?auto_683117 ?auto_683123 ) ) ( not ( = ?auto_683117 ?auto_683124 ) ) ( not ( = ?auto_683117 ?auto_683125 ) ) ( not ( = ?auto_683117 ?auto_683126 ) ) ( not ( = ?auto_683117 ?auto_683127 ) ) ( not ( = ?auto_683117 ?auto_683128 ) ) ( not ( = ?auto_683118 ?auto_683119 ) ) ( not ( = ?auto_683118 ?auto_683120 ) ) ( not ( = ?auto_683118 ?auto_683121 ) ) ( not ( = ?auto_683118 ?auto_683122 ) ) ( not ( = ?auto_683118 ?auto_683123 ) ) ( not ( = ?auto_683118 ?auto_683124 ) ) ( not ( = ?auto_683118 ?auto_683125 ) ) ( not ( = ?auto_683118 ?auto_683126 ) ) ( not ( = ?auto_683118 ?auto_683127 ) ) ( not ( = ?auto_683118 ?auto_683128 ) ) ( not ( = ?auto_683119 ?auto_683120 ) ) ( not ( = ?auto_683119 ?auto_683121 ) ) ( not ( = ?auto_683119 ?auto_683122 ) ) ( not ( = ?auto_683119 ?auto_683123 ) ) ( not ( = ?auto_683119 ?auto_683124 ) ) ( not ( = ?auto_683119 ?auto_683125 ) ) ( not ( = ?auto_683119 ?auto_683126 ) ) ( not ( = ?auto_683119 ?auto_683127 ) ) ( not ( = ?auto_683119 ?auto_683128 ) ) ( not ( = ?auto_683120 ?auto_683121 ) ) ( not ( = ?auto_683120 ?auto_683122 ) ) ( not ( = ?auto_683120 ?auto_683123 ) ) ( not ( = ?auto_683120 ?auto_683124 ) ) ( not ( = ?auto_683120 ?auto_683125 ) ) ( not ( = ?auto_683120 ?auto_683126 ) ) ( not ( = ?auto_683120 ?auto_683127 ) ) ( not ( = ?auto_683120 ?auto_683128 ) ) ( not ( = ?auto_683121 ?auto_683122 ) ) ( not ( = ?auto_683121 ?auto_683123 ) ) ( not ( = ?auto_683121 ?auto_683124 ) ) ( not ( = ?auto_683121 ?auto_683125 ) ) ( not ( = ?auto_683121 ?auto_683126 ) ) ( not ( = ?auto_683121 ?auto_683127 ) ) ( not ( = ?auto_683121 ?auto_683128 ) ) ( not ( = ?auto_683122 ?auto_683123 ) ) ( not ( = ?auto_683122 ?auto_683124 ) ) ( not ( = ?auto_683122 ?auto_683125 ) ) ( not ( = ?auto_683122 ?auto_683126 ) ) ( not ( = ?auto_683122 ?auto_683127 ) ) ( not ( = ?auto_683122 ?auto_683128 ) ) ( not ( = ?auto_683123 ?auto_683124 ) ) ( not ( = ?auto_683123 ?auto_683125 ) ) ( not ( = ?auto_683123 ?auto_683126 ) ) ( not ( = ?auto_683123 ?auto_683127 ) ) ( not ( = ?auto_683123 ?auto_683128 ) ) ( not ( = ?auto_683124 ?auto_683125 ) ) ( not ( = ?auto_683124 ?auto_683126 ) ) ( not ( = ?auto_683124 ?auto_683127 ) ) ( not ( = ?auto_683124 ?auto_683128 ) ) ( not ( = ?auto_683125 ?auto_683126 ) ) ( not ( = ?auto_683125 ?auto_683127 ) ) ( not ( = ?auto_683125 ?auto_683128 ) ) ( not ( = ?auto_683126 ?auto_683127 ) ) ( not ( = ?auto_683126 ?auto_683128 ) ) ( not ( = ?auto_683127 ?auto_683128 ) ) ( ON ?auto_683126 ?auto_683127 ) ( ON ?auto_683125 ?auto_683126 ) ( ON ?auto_683124 ?auto_683125 ) ( ON ?auto_683123 ?auto_683124 ) ( ON ?auto_683122 ?auto_683123 ) ( ON ?auto_683121 ?auto_683122 ) ( CLEAR ?auto_683119 ) ( ON ?auto_683120 ?auto_683121 ) ( CLEAR ?auto_683120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_683115 ?auto_683116 ?auto_683117 ?auto_683118 ?auto_683119 ?auto_683120 )
      ( MAKE-13PILE ?auto_683115 ?auto_683116 ?auto_683117 ?auto_683118 ?auto_683119 ?auto_683120 ?auto_683121 ?auto_683122 ?auto_683123 ?auto_683124 ?auto_683125 ?auto_683126 ?auto_683127 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_683169 - BLOCK
      ?auto_683170 - BLOCK
      ?auto_683171 - BLOCK
      ?auto_683172 - BLOCK
      ?auto_683173 - BLOCK
      ?auto_683174 - BLOCK
      ?auto_683175 - BLOCK
      ?auto_683176 - BLOCK
      ?auto_683177 - BLOCK
      ?auto_683178 - BLOCK
      ?auto_683179 - BLOCK
      ?auto_683180 - BLOCK
      ?auto_683181 - BLOCK
    )
    :vars
    (
      ?auto_683182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_683181 ?auto_683182 ) ( ON-TABLE ?auto_683169 ) ( ON ?auto_683170 ?auto_683169 ) ( ON ?auto_683171 ?auto_683170 ) ( ON ?auto_683172 ?auto_683171 ) ( not ( = ?auto_683169 ?auto_683170 ) ) ( not ( = ?auto_683169 ?auto_683171 ) ) ( not ( = ?auto_683169 ?auto_683172 ) ) ( not ( = ?auto_683169 ?auto_683173 ) ) ( not ( = ?auto_683169 ?auto_683174 ) ) ( not ( = ?auto_683169 ?auto_683175 ) ) ( not ( = ?auto_683169 ?auto_683176 ) ) ( not ( = ?auto_683169 ?auto_683177 ) ) ( not ( = ?auto_683169 ?auto_683178 ) ) ( not ( = ?auto_683169 ?auto_683179 ) ) ( not ( = ?auto_683169 ?auto_683180 ) ) ( not ( = ?auto_683169 ?auto_683181 ) ) ( not ( = ?auto_683169 ?auto_683182 ) ) ( not ( = ?auto_683170 ?auto_683171 ) ) ( not ( = ?auto_683170 ?auto_683172 ) ) ( not ( = ?auto_683170 ?auto_683173 ) ) ( not ( = ?auto_683170 ?auto_683174 ) ) ( not ( = ?auto_683170 ?auto_683175 ) ) ( not ( = ?auto_683170 ?auto_683176 ) ) ( not ( = ?auto_683170 ?auto_683177 ) ) ( not ( = ?auto_683170 ?auto_683178 ) ) ( not ( = ?auto_683170 ?auto_683179 ) ) ( not ( = ?auto_683170 ?auto_683180 ) ) ( not ( = ?auto_683170 ?auto_683181 ) ) ( not ( = ?auto_683170 ?auto_683182 ) ) ( not ( = ?auto_683171 ?auto_683172 ) ) ( not ( = ?auto_683171 ?auto_683173 ) ) ( not ( = ?auto_683171 ?auto_683174 ) ) ( not ( = ?auto_683171 ?auto_683175 ) ) ( not ( = ?auto_683171 ?auto_683176 ) ) ( not ( = ?auto_683171 ?auto_683177 ) ) ( not ( = ?auto_683171 ?auto_683178 ) ) ( not ( = ?auto_683171 ?auto_683179 ) ) ( not ( = ?auto_683171 ?auto_683180 ) ) ( not ( = ?auto_683171 ?auto_683181 ) ) ( not ( = ?auto_683171 ?auto_683182 ) ) ( not ( = ?auto_683172 ?auto_683173 ) ) ( not ( = ?auto_683172 ?auto_683174 ) ) ( not ( = ?auto_683172 ?auto_683175 ) ) ( not ( = ?auto_683172 ?auto_683176 ) ) ( not ( = ?auto_683172 ?auto_683177 ) ) ( not ( = ?auto_683172 ?auto_683178 ) ) ( not ( = ?auto_683172 ?auto_683179 ) ) ( not ( = ?auto_683172 ?auto_683180 ) ) ( not ( = ?auto_683172 ?auto_683181 ) ) ( not ( = ?auto_683172 ?auto_683182 ) ) ( not ( = ?auto_683173 ?auto_683174 ) ) ( not ( = ?auto_683173 ?auto_683175 ) ) ( not ( = ?auto_683173 ?auto_683176 ) ) ( not ( = ?auto_683173 ?auto_683177 ) ) ( not ( = ?auto_683173 ?auto_683178 ) ) ( not ( = ?auto_683173 ?auto_683179 ) ) ( not ( = ?auto_683173 ?auto_683180 ) ) ( not ( = ?auto_683173 ?auto_683181 ) ) ( not ( = ?auto_683173 ?auto_683182 ) ) ( not ( = ?auto_683174 ?auto_683175 ) ) ( not ( = ?auto_683174 ?auto_683176 ) ) ( not ( = ?auto_683174 ?auto_683177 ) ) ( not ( = ?auto_683174 ?auto_683178 ) ) ( not ( = ?auto_683174 ?auto_683179 ) ) ( not ( = ?auto_683174 ?auto_683180 ) ) ( not ( = ?auto_683174 ?auto_683181 ) ) ( not ( = ?auto_683174 ?auto_683182 ) ) ( not ( = ?auto_683175 ?auto_683176 ) ) ( not ( = ?auto_683175 ?auto_683177 ) ) ( not ( = ?auto_683175 ?auto_683178 ) ) ( not ( = ?auto_683175 ?auto_683179 ) ) ( not ( = ?auto_683175 ?auto_683180 ) ) ( not ( = ?auto_683175 ?auto_683181 ) ) ( not ( = ?auto_683175 ?auto_683182 ) ) ( not ( = ?auto_683176 ?auto_683177 ) ) ( not ( = ?auto_683176 ?auto_683178 ) ) ( not ( = ?auto_683176 ?auto_683179 ) ) ( not ( = ?auto_683176 ?auto_683180 ) ) ( not ( = ?auto_683176 ?auto_683181 ) ) ( not ( = ?auto_683176 ?auto_683182 ) ) ( not ( = ?auto_683177 ?auto_683178 ) ) ( not ( = ?auto_683177 ?auto_683179 ) ) ( not ( = ?auto_683177 ?auto_683180 ) ) ( not ( = ?auto_683177 ?auto_683181 ) ) ( not ( = ?auto_683177 ?auto_683182 ) ) ( not ( = ?auto_683178 ?auto_683179 ) ) ( not ( = ?auto_683178 ?auto_683180 ) ) ( not ( = ?auto_683178 ?auto_683181 ) ) ( not ( = ?auto_683178 ?auto_683182 ) ) ( not ( = ?auto_683179 ?auto_683180 ) ) ( not ( = ?auto_683179 ?auto_683181 ) ) ( not ( = ?auto_683179 ?auto_683182 ) ) ( not ( = ?auto_683180 ?auto_683181 ) ) ( not ( = ?auto_683180 ?auto_683182 ) ) ( not ( = ?auto_683181 ?auto_683182 ) ) ( ON ?auto_683180 ?auto_683181 ) ( ON ?auto_683179 ?auto_683180 ) ( ON ?auto_683178 ?auto_683179 ) ( ON ?auto_683177 ?auto_683178 ) ( ON ?auto_683176 ?auto_683177 ) ( ON ?auto_683175 ?auto_683176 ) ( ON ?auto_683174 ?auto_683175 ) ( CLEAR ?auto_683172 ) ( ON ?auto_683173 ?auto_683174 ) ( CLEAR ?auto_683173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_683169 ?auto_683170 ?auto_683171 ?auto_683172 ?auto_683173 )
      ( MAKE-13PILE ?auto_683169 ?auto_683170 ?auto_683171 ?auto_683172 ?auto_683173 ?auto_683174 ?auto_683175 ?auto_683176 ?auto_683177 ?auto_683178 ?auto_683179 ?auto_683180 ?auto_683181 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_683223 - BLOCK
      ?auto_683224 - BLOCK
      ?auto_683225 - BLOCK
      ?auto_683226 - BLOCK
      ?auto_683227 - BLOCK
      ?auto_683228 - BLOCK
      ?auto_683229 - BLOCK
      ?auto_683230 - BLOCK
      ?auto_683231 - BLOCK
      ?auto_683232 - BLOCK
      ?auto_683233 - BLOCK
      ?auto_683234 - BLOCK
      ?auto_683235 - BLOCK
    )
    :vars
    (
      ?auto_683236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_683235 ?auto_683236 ) ( ON-TABLE ?auto_683223 ) ( ON ?auto_683224 ?auto_683223 ) ( ON ?auto_683225 ?auto_683224 ) ( not ( = ?auto_683223 ?auto_683224 ) ) ( not ( = ?auto_683223 ?auto_683225 ) ) ( not ( = ?auto_683223 ?auto_683226 ) ) ( not ( = ?auto_683223 ?auto_683227 ) ) ( not ( = ?auto_683223 ?auto_683228 ) ) ( not ( = ?auto_683223 ?auto_683229 ) ) ( not ( = ?auto_683223 ?auto_683230 ) ) ( not ( = ?auto_683223 ?auto_683231 ) ) ( not ( = ?auto_683223 ?auto_683232 ) ) ( not ( = ?auto_683223 ?auto_683233 ) ) ( not ( = ?auto_683223 ?auto_683234 ) ) ( not ( = ?auto_683223 ?auto_683235 ) ) ( not ( = ?auto_683223 ?auto_683236 ) ) ( not ( = ?auto_683224 ?auto_683225 ) ) ( not ( = ?auto_683224 ?auto_683226 ) ) ( not ( = ?auto_683224 ?auto_683227 ) ) ( not ( = ?auto_683224 ?auto_683228 ) ) ( not ( = ?auto_683224 ?auto_683229 ) ) ( not ( = ?auto_683224 ?auto_683230 ) ) ( not ( = ?auto_683224 ?auto_683231 ) ) ( not ( = ?auto_683224 ?auto_683232 ) ) ( not ( = ?auto_683224 ?auto_683233 ) ) ( not ( = ?auto_683224 ?auto_683234 ) ) ( not ( = ?auto_683224 ?auto_683235 ) ) ( not ( = ?auto_683224 ?auto_683236 ) ) ( not ( = ?auto_683225 ?auto_683226 ) ) ( not ( = ?auto_683225 ?auto_683227 ) ) ( not ( = ?auto_683225 ?auto_683228 ) ) ( not ( = ?auto_683225 ?auto_683229 ) ) ( not ( = ?auto_683225 ?auto_683230 ) ) ( not ( = ?auto_683225 ?auto_683231 ) ) ( not ( = ?auto_683225 ?auto_683232 ) ) ( not ( = ?auto_683225 ?auto_683233 ) ) ( not ( = ?auto_683225 ?auto_683234 ) ) ( not ( = ?auto_683225 ?auto_683235 ) ) ( not ( = ?auto_683225 ?auto_683236 ) ) ( not ( = ?auto_683226 ?auto_683227 ) ) ( not ( = ?auto_683226 ?auto_683228 ) ) ( not ( = ?auto_683226 ?auto_683229 ) ) ( not ( = ?auto_683226 ?auto_683230 ) ) ( not ( = ?auto_683226 ?auto_683231 ) ) ( not ( = ?auto_683226 ?auto_683232 ) ) ( not ( = ?auto_683226 ?auto_683233 ) ) ( not ( = ?auto_683226 ?auto_683234 ) ) ( not ( = ?auto_683226 ?auto_683235 ) ) ( not ( = ?auto_683226 ?auto_683236 ) ) ( not ( = ?auto_683227 ?auto_683228 ) ) ( not ( = ?auto_683227 ?auto_683229 ) ) ( not ( = ?auto_683227 ?auto_683230 ) ) ( not ( = ?auto_683227 ?auto_683231 ) ) ( not ( = ?auto_683227 ?auto_683232 ) ) ( not ( = ?auto_683227 ?auto_683233 ) ) ( not ( = ?auto_683227 ?auto_683234 ) ) ( not ( = ?auto_683227 ?auto_683235 ) ) ( not ( = ?auto_683227 ?auto_683236 ) ) ( not ( = ?auto_683228 ?auto_683229 ) ) ( not ( = ?auto_683228 ?auto_683230 ) ) ( not ( = ?auto_683228 ?auto_683231 ) ) ( not ( = ?auto_683228 ?auto_683232 ) ) ( not ( = ?auto_683228 ?auto_683233 ) ) ( not ( = ?auto_683228 ?auto_683234 ) ) ( not ( = ?auto_683228 ?auto_683235 ) ) ( not ( = ?auto_683228 ?auto_683236 ) ) ( not ( = ?auto_683229 ?auto_683230 ) ) ( not ( = ?auto_683229 ?auto_683231 ) ) ( not ( = ?auto_683229 ?auto_683232 ) ) ( not ( = ?auto_683229 ?auto_683233 ) ) ( not ( = ?auto_683229 ?auto_683234 ) ) ( not ( = ?auto_683229 ?auto_683235 ) ) ( not ( = ?auto_683229 ?auto_683236 ) ) ( not ( = ?auto_683230 ?auto_683231 ) ) ( not ( = ?auto_683230 ?auto_683232 ) ) ( not ( = ?auto_683230 ?auto_683233 ) ) ( not ( = ?auto_683230 ?auto_683234 ) ) ( not ( = ?auto_683230 ?auto_683235 ) ) ( not ( = ?auto_683230 ?auto_683236 ) ) ( not ( = ?auto_683231 ?auto_683232 ) ) ( not ( = ?auto_683231 ?auto_683233 ) ) ( not ( = ?auto_683231 ?auto_683234 ) ) ( not ( = ?auto_683231 ?auto_683235 ) ) ( not ( = ?auto_683231 ?auto_683236 ) ) ( not ( = ?auto_683232 ?auto_683233 ) ) ( not ( = ?auto_683232 ?auto_683234 ) ) ( not ( = ?auto_683232 ?auto_683235 ) ) ( not ( = ?auto_683232 ?auto_683236 ) ) ( not ( = ?auto_683233 ?auto_683234 ) ) ( not ( = ?auto_683233 ?auto_683235 ) ) ( not ( = ?auto_683233 ?auto_683236 ) ) ( not ( = ?auto_683234 ?auto_683235 ) ) ( not ( = ?auto_683234 ?auto_683236 ) ) ( not ( = ?auto_683235 ?auto_683236 ) ) ( ON ?auto_683234 ?auto_683235 ) ( ON ?auto_683233 ?auto_683234 ) ( ON ?auto_683232 ?auto_683233 ) ( ON ?auto_683231 ?auto_683232 ) ( ON ?auto_683230 ?auto_683231 ) ( ON ?auto_683229 ?auto_683230 ) ( ON ?auto_683228 ?auto_683229 ) ( ON ?auto_683227 ?auto_683228 ) ( CLEAR ?auto_683225 ) ( ON ?auto_683226 ?auto_683227 ) ( CLEAR ?auto_683226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_683223 ?auto_683224 ?auto_683225 ?auto_683226 )
      ( MAKE-13PILE ?auto_683223 ?auto_683224 ?auto_683225 ?auto_683226 ?auto_683227 ?auto_683228 ?auto_683229 ?auto_683230 ?auto_683231 ?auto_683232 ?auto_683233 ?auto_683234 ?auto_683235 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_683277 - BLOCK
      ?auto_683278 - BLOCK
      ?auto_683279 - BLOCK
      ?auto_683280 - BLOCK
      ?auto_683281 - BLOCK
      ?auto_683282 - BLOCK
      ?auto_683283 - BLOCK
      ?auto_683284 - BLOCK
      ?auto_683285 - BLOCK
      ?auto_683286 - BLOCK
      ?auto_683287 - BLOCK
      ?auto_683288 - BLOCK
      ?auto_683289 - BLOCK
    )
    :vars
    (
      ?auto_683290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_683289 ?auto_683290 ) ( ON-TABLE ?auto_683277 ) ( ON ?auto_683278 ?auto_683277 ) ( not ( = ?auto_683277 ?auto_683278 ) ) ( not ( = ?auto_683277 ?auto_683279 ) ) ( not ( = ?auto_683277 ?auto_683280 ) ) ( not ( = ?auto_683277 ?auto_683281 ) ) ( not ( = ?auto_683277 ?auto_683282 ) ) ( not ( = ?auto_683277 ?auto_683283 ) ) ( not ( = ?auto_683277 ?auto_683284 ) ) ( not ( = ?auto_683277 ?auto_683285 ) ) ( not ( = ?auto_683277 ?auto_683286 ) ) ( not ( = ?auto_683277 ?auto_683287 ) ) ( not ( = ?auto_683277 ?auto_683288 ) ) ( not ( = ?auto_683277 ?auto_683289 ) ) ( not ( = ?auto_683277 ?auto_683290 ) ) ( not ( = ?auto_683278 ?auto_683279 ) ) ( not ( = ?auto_683278 ?auto_683280 ) ) ( not ( = ?auto_683278 ?auto_683281 ) ) ( not ( = ?auto_683278 ?auto_683282 ) ) ( not ( = ?auto_683278 ?auto_683283 ) ) ( not ( = ?auto_683278 ?auto_683284 ) ) ( not ( = ?auto_683278 ?auto_683285 ) ) ( not ( = ?auto_683278 ?auto_683286 ) ) ( not ( = ?auto_683278 ?auto_683287 ) ) ( not ( = ?auto_683278 ?auto_683288 ) ) ( not ( = ?auto_683278 ?auto_683289 ) ) ( not ( = ?auto_683278 ?auto_683290 ) ) ( not ( = ?auto_683279 ?auto_683280 ) ) ( not ( = ?auto_683279 ?auto_683281 ) ) ( not ( = ?auto_683279 ?auto_683282 ) ) ( not ( = ?auto_683279 ?auto_683283 ) ) ( not ( = ?auto_683279 ?auto_683284 ) ) ( not ( = ?auto_683279 ?auto_683285 ) ) ( not ( = ?auto_683279 ?auto_683286 ) ) ( not ( = ?auto_683279 ?auto_683287 ) ) ( not ( = ?auto_683279 ?auto_683288 ) ) ( not ( = ?auto_683279 ?auto_683289 ) ) ( not ( = ?auto_683279 ?auto_683290 ) ) ( not ( = ?auto_683280 ?auto_683281 ) ) ( not ( = ?auto_683280 ?auto_683282 ) ) ( not ( = ?auto_683280 ?auto_683283 ) ) ( not ( = ?auto_683280 ?auto_683284 ) ) ( not ( = ?auto_683280 ?auto_683285 ) ) ( not ( = ?auto_683280 ?auto_683286 ) ) ( not ( = ?auto_683280 ?auto_683287 ) ) ( not ( = ?auto_683280 ?auto_683288 ) ) ( not ( = ?auto_683280 ?auto_683289 ) ) ( not ( = ?auto_683280 ?auto_683290 ) ) ( not ( = ?auto_683281 ?auto_683282 ) ) ( not ( = ?auto_683281 ?auto_683283 ) ) ( not ( = ?auto_683281 ?auto_683284 ) ) ( not ( = ?auto_683281 ?auto_683285 ) ) ( not ( = ?auto_683281 ?auto_683286 ) ) ( not ( = ?auto_683281 ?auto_683287 ) ) ( not ( = ?auto_683281 ?auto_683288 ) ) ( not ( = ?auto_683281 ?auto_683289 ) ) ( not ( = ?auto_683281 ?auto_683290 ) ) ( not ( = ?auto_683282 ?auto_683283 ) ) ( not ( = ?auto_683282 ?auto_683284 ) ) ( not ( = ?auto_683282 ?auto_683285 ) ) ( not ( = ?auto_683282 ?auto_683286 ) ) ( not ( = ?auto_683282 ?auto_683287 ) ) ( not ( = ?auto_683282 ?auto_683288 ) ) ( not ( = ?auto_683282 ?auto_683289 ) ) ( not ( = ?auto_683282 ?auto_683290 ) ) ( not ( = ?auto_683283 ?auto_683284 ) ) ( not ( = ?auto_683283 ?auto_683285 ) ) ( not ( = ?auto_683283 ?auto_683286 ) ) ( not ( = ?auto_683283 ?auto_683287 ) ) ( not ( = ?auto_683283 ?auto_683288 ) ) ( not ( = ?auto_683283 ?auto_683289 ) ) ( not ( = ?auto_683283 ?auto_683290 ) ) ( not ( = ?auto_683284 ?auto_683285 ) ) ( not ( = ?auto_683284 ?auto_683286 ) ) ( not ( = ?auto_683284 ?auto_683287 ) ) ( not ( = ?auto_683284 ?auto_683288 ) ) ( not ( = ?auto_683284 ?auto_683289 ) ) ( not ( = ?auto_683284 ?auto_683290 ) ) ( not ( = ?auto_683285 ?auto_683286 ) ) ( not ( = ?auto_683285 ?auto_683287 ) ) ( not ( = ?auto_683285 ?auto_683288 ) ) ( not ( = ?auto_683285 ?auto_683289 ) ) ( not ( = ?auto_683285 ?auto_683290 ) ) ( not ( = ?auto_683286 ?auto_683287 ) ) ( not ( = ?auto_683286 ?auto_683288 ) ) ( not ( = ?auto_683286 ?auto_683289 ) ) ( not ( = ?auto_683286 ?auto_683290 ) ) ( not ( = ?auto_683287 ?auto_683288 ) ) ( not ( = ?auto_683287 ?auto_683289 ) ) ( not ( = ?auto_683287 ?auto_683290 ) ) ( not ( = ?auto_683288 ?auto_683289 ) ) ( not ( = ?auto_683288 ?auto_683290 ) ) ( not ( = ?auto_683289 ?auto_683290 ) ) ( ON ?auto_683288 ?auto_683289 ) ( ON ?auto_683287 ?auto_683288 ) ( ON ?auto_683286 ?auto_683287 ) ( ON ?auto_683285 ?auto_683286 ) ( ON ?auto_683284 ?auto_683285 ) ( ON ?auto_683283 ?auto_683284 ) ( ON ?auto_683282 ?auto_683283 ) ( ON ?auto_683281 ?auto_683282 ) ( ON ?auto_683280 ?auto_683281 ) ( CLEAR ?auto_683278 ) ( ON ?auto_683279 ?auto_683280 ) ( CLEAR ?auto_683279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_683277 ?auto_683278 ?auto_683279 )
      ( MAKE-13PILE ?auto_683277 ?auto_683278 ?auto_683279 ?auto_683280 ?auto_683281 ?auto_683282 ?auto_683283 ?auto_683284 ?auto_683285 ?auto_683286 ?auto_683287 ?auto_683288 ?auto_683289 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_683331 - BLOCK
      ?auto_683332 - BLOCK
      ?auto_683333 - BLOCK
      ?auto_683334 - BLOCK
      ?auto_683335 - BLOCK
      ?auto_683336 - BLOCK
      ?auto_683337 - BLOCK
      ?auto_683338 - BLOCK
      ?auto_683339 - BLOCK
      ?auto_683340 - BLOCK
      ?auto_683341 - BLOCK
      ?auto_683342 - BLOCK
      ?auto_683343 - BLOCK
    )
    :vars
    (
      ?auto_683344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_683343 ?auto_683344 ) ( ON-TABLE ?auto_683331 ) ( not ( = ?auto_683331 ?auto_683332 ) ) ( not ( = ?auto_683331 ?auto_683333 ) ) ( not ( = ?auto_683331 ?auto_683334 ) ) ( not ( = ?auto_683331 ?auto_683335 ) ) ( not ( = ?auto_683331 ?auto_683336 ) ) ( not ( = ?auto_683331 ?auto_683337 ) ) ( not ( = ?auto_683331 ?auto_683338 ) ) ( not ( = ?auto_683331 ?auto_683339 ) ) ( not ( = ?auto_683331 ?auto_683340 ) ) ( not ( = ?auto_683331 ?auto_683341 ) ) ( not ( = ?auto_683331 ?auto_683342 ) ) ( not ( = ?auto_683331 ?auto_683343 ) ) ( not ( = ?auto_683331 ?auto_683344 ) ) ( not ( = ?auto_683332 ?auto_683333 ) ) ( not ( = ?auto_683332 ?auto_683334 ) ) ( not ( = ?auto_683332 ?auto_683335 ) ) ( not ( = ?auto_683332 ?auto_683336 ) ) ( not ( = ?auto_683332 ?auto_683337 ) ) ( not ( = ?auto_683332 ?auto_683338 ) ) ( not ( = ?auto_683332 ?auto_683339 ) ) ( not ( = ?auto_683332 ?auto_683340 ) ) ( not ( = ?auto_683332 ?auto_683341 ) ) ( not ( = ?auto_683332 ?auto_683342 ) ) ( not ( = ?auto_683332 ?auto_683343 ) ) ( not ( = ?auto_683332 ?auto_683344 ) ) ( not ( = ?auto_683333 ?auto_683334 ) ) ( not ( = ?auto_683333 ?auto_683335 ) ) ( not ( = ?auto_683333 ?auto_683336 ) ) ( not ( = ?auto_683333 ?auto_683337 ) ) ( not ( = ?auto_683333 ?auto_683338 ) ) ( not ( = ?auto_683333 ?auto_683339 ) ) ( not ( = ?auto_683333 ?auto_683340 ) ) ( not ( = ?auto_683333 ?auto_683341 ) ) ( not ( = ?auto_683333 ?auto_683342 ) ) ( not ( = ?auto_683333 ?auto_683343 ) ) ( not ( = ?auto_683333 ?auto_683344 ) ) ( not ( = ?auto_683334 ?auto_683335 ) ) ( not ( = ?auto_683334 ?auto_683336 ) ) ( not ( = ?auto_683334 ?auto_683337 ) ) ( not ( = ?auto_683334 ?auto_683338 ) ) ( not ( = ?auto_683334 ?auto_683339 ) ) ( not ( = ?auto_683334 ?auto_683340 ) ) ( not ( = ?auto_683334 ?auto_683341 ) ) ( not ( = ?auto_683334 ?auto_683342 ) ) ( not ( = ?auto_683334 ?auto_683343 ) ) ( not ( = ?auto_683334 ?auto_683344 ) ) ( not ( = ?auto_683335 ?auto_683336 ) ) ( not ( = ?auto_683335 ?auto_683337 ) ) ( not ( = ?auto_683335 ?auto_683338 ) ) ( not ( = ?auto_683335 ?auto_683339 ) ) ( not ( = ?auto_683335 ?auto_683340 ) ) ( not ( = ?auto_683335 ?auto_683341 ) ) ( not ( = ?auto_683335 ?auto_683342 ) ) ( not ( = ?auto_683335 ?auto_683343 ) ) ( not ( = ?auto_683335 ?auto_683344 ) ) ( not ( = ?auto_683336 ?auto_683337 ) ) ( not ( = ?auto_683336 ?auto_683338 ) ) ( not ( = ?auto_683336 ?auto_683339 ) ) ( not ( = ?auto_683336 ?auto_683340 ) ) ( not ( = ?auto_683336 ?auto_683341 ) ) ( not ( = ?auto_683336 ?auto_683342 ) ) ( not ( = ?auto_683336 ?auto_683343 ) ) ( not ( = ?auto_683336 ?auto_683344 ) ) ( not ( = ?auto_683337 ?auto_683338 ) ) ( not ( = ?auto_683337 ?auto_683339 ) ) ( not ( = ?auto_683337 ?auto_683340 ) ) ( not ( = ?auto_683337 ?auto_683341 ) ) ( not ( = ?auto_683337 ?auto_683342 ) ) ( not ( = ?auto_683337 ?auto_683343 ) ) ( not ( = ?auto_683337 ?auto_683344 ) ) ( not ( = ?auto_683338 ?auto_683339 ) ) ( not ( = ?auto_683338 ?auto_683340 ) ) ( not ( = ?auto_683338 ?auto_683341 ) ) ( not ( = ?auto_683338 ?auto_683342 ) ) ( not ( = ?auto_683338 ?auto_683343 ) ) ( not ( = ?auto_683338 ?auto_683344 ) ) ( not ( = ?auto_683339 ?auto_683340 ) ) ( not ( = ?auto_683339 ?auto_683341 ) ) ( not ( = ?auto_683339 ?auto_683342 ) ) ( not ( = ?auto_683339 ?auto_683343 ) ) ( not ( = ?auto_683339 ?auto_683344 ) ) ( not ( = ?auto_683340 ?auto_683341 ) ) ( not ( = ?auto_683340 ?auto_683342 ) ) ( not ( = ?auto_683340 ?auto_683343 ) ) ( not ( = ?auto_683340 ?auto_683344 ) ) ( not ( = ?auto_683341 ?auto_683342 ) ) ( not ( = ?auto_683341 ?auto_683343 ) ) ( not ( = ?auto_683341 ?auto_683344 ) ) ( not ( = ?auto_683342 ?auto_683343 ) ) ( not ( = ?auto_683342 ?auto_683344 ) ) ( not ( = ?auto_683343 ?auto_683344 ) ) ( ON ?auto_683342 ?auto_683343 ) ( ON ?auto_683341 ?auto_683342 ) ( ON ?auto_683340 ?auto_683341 ) ( ON ?auto_683339 ?auto_683340 ) ( ON ?auto_683338 ?auto_683339 ) ( ON ?auto_683337 ?auto_683338 ) ( ON ?auto_683336 ?auto_683337 ) ( ON ?auto_683335 ?auto_683336 ) ( ON ?auto_683334 ?auto_683335 ) ( ON ?auto_683333 ?auto_683334 ) ( CLEAR ?auto_683331 ) ( ON ?auto_683332 ?auto_683333 ) ( CLEAR ?auto_683332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_683331 ?auto_683332 )
      ( MAKE-13PILE ?auto_683331 ?auto_683332 ?auto_683333 ?auto_683334 ?auto_683335 ?auto_683336 ?auto_683337 ?auto_683338 ?auto_683339 ?auto_683340 ?auto_683341 ?auto_683342 ?auto_683343 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_683385 - BLOCK
      ?auto_683386 - BLOCK
      ?auto_683387 - BLOCK
      ?auto_683388 - BLOCK
      ?auto_683389 - BLOCK
      ?auto_683390 - BLOCK
      ?auto_683391 - BLOCK
      ?auto_683392 - BLOCK
      ?auto_683393 - BLOCK
      ?auto_683394 - BLOCK
      ?auto_683395 - BLOCK
      ?auto_683396 - BLOCK
      ?auto_683397 - BLOCK
    )
    :vars
    (
      ?auto_683398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_683397 ?auto_683398 ) ( not ( = ?auto_683385 ?auto_683386 ) ) ( not ( = ?auto_683385 ?auto_683387 ) ) ( not ( = ?auto_683385 ?auto_683388 ) ) ( not ( = ?auto_683385 ?auto_683389 ) ) ( not ( = ?auto_683385 ?auto_683390 ) ) ( not ( = ?auto_683385 ?auto_683391 ) ) ( not ( = ?auto_683385 ?auto_683392 ) ) ( not ( = ?auto_683385 ?auto_683393 ) ) ( not ( = ?auto_683385 ?auto_683394 ) ) ( not ( = ?auto_683385 ?auto_683395 ) ) ( not ( = ?auto_683385 ?auto_683396 ) ) ( not ( = ?auto_683385 ?auto_683397 ) ) ( not ( = ?auto_683385 ?auto_683398 ) ) ( not ( = ?auto_683386 ?auto_683387 ) ) ( not ( = ?auto_683386 ?auto_683388 ) ) ( not ( = ?auto_683386 ?auto_683389 ) ) ( not ( = ?auto_683386 ?auto_683390 ) ) ( not ( = ?auto_683386 ?auto_683391 ) ) ( not ( = ?auto_683386 ?auto_683392 ) ) ( not ( = ?auto_683386 ?auto_683393 ) ) ( not ( = ?auto_683386 ?auto_683394 ) ) ( not ( = ?auto_683386 ?auto_683395 ) ) ( not ( = ?auto_683386 ?auto_683396 ) ) ( not ( = ?auto_683386 ?auto_683397 ) ) ( not ( = ?auto_683386 ?auto_683398 ) ) ( not ( = ?auto_683387 ?auto_683388 ) ) ( not ( = ?auto_683387 ?auto_683389 ) ) ( not ( = ?auto_683387 ?auto_683390 ) ) ( not ( = ?auto_683387 ?auto_683391 ) ) ( not ( = ?auto_683387 ?auto_683392 ) ) ( not ( = ?auto_683387 ?auto_683393 ) ) ( not ( = ?auto_683387 ?auto_683394 ) ) ( not ( = ?auto_683387 ?auto_683395 ) ) ( not ( = ?auto_683387 ?auto_683396 ) ) ( not ( = ?auto_683387 ?auto_683397 ) ) ( not ( = ?auto_683387 ?auto_683398 ) ) ( not ( = ?auto_683388 ?auto_683389 ) ) ( not ( = ?auto_683388 ?auto_683390 ) ) ( not ( = ?auto_683388 ?auto_683391 ) ) ( not ( = ?auto_683388 ?auto_683392 ) ) ( not ( = ?auto_683388 ?auto_683393 ) ) ( not ( = ?auto_683388 ?auto_683394 ) ) ( not ( = ?auto_683388 ?auto_683395 ) ) ( not ( = ?auto_683388 ?auto_683396 ) ) ( not ( = ?auto_683388 ?auto_683397 ) ) ( not ( = ?auto_683388 ?auto_683398 ) ) ( not ( = ?auto_683389 ?auto_683390 ) ) ( not ( = ?auto_683389 ?auto_683391 ) ) ( not ( = ?auto_683389 ?auto_683392 ) ) ( not ( = ?auto_683389 ?auto_683393 ) ) ( not ( = ?auto_683389 ?auto_683394 ) ) ( not ( = ?auto_683389 ?auto_683395 ) ) ( not ( = ?auto_683389 ?auto_683396 ) ) ( not ( = ?auto_683389 ?auto_683397 ) ) ( not ( = ?auto_683389 ?auto_683398 ) ) ( not ( = ?auto_683390 ?auto_683391 ) ) ( not ( = ?auto_683390 ?auto_683392 ) ) ( not ( = ?auto_683390 ?auto_683393 ) ) ( not ( = ?auto_683390 ?auto_683394 ) ) ( not ( = ?auto_683390 ?auto_683395 ) ) ( not ( = ?auto_683390 ?auto_683396 ) ) ( not ( = ?auto_683390 ?auto_683397 ) ) ( not ( = ?auto_683390 ?auto_683398 ) ) ( not ( = ?auto_683391 ?auto_683392 ) ) ( not ( = ?auto_683391 ?auto_683393 ) ) ( not ( = ?auto_683391 ?auto_683394 ) ) ( not ( = ?auto_683391 ?auto_683395 ) ) ( not ( = ?auto_683391 ?auto_683396 ) ) ( not ( = ?auto_683391 ?auto_683397 ) ) ( not ( = ?auto_683391 ?auto_683398 ) ) ( not ( = ?auto_683392 ?auto_683393 ) ) ( not ( = ?auto_683392 ?auto_683394 ) ) ( not ( = ?auto_683392 ?auto_683395 ) ) ( not ( = ?auto_683392 ?auto_683396 ) ) ( not ( = ?auto_683392 ?auto_683397 ) ) ( not ( = ?auto_683392 ?auto_683398 ) ) ( not ( = ?auto_683393 ?auto_683394 ) ) ( not ( = ?auto_683393 ?auto_683395 ) ) ( not ( = ?auto_683393 ?auto_683396 ) ) ( not ( = ?auto_683393 ?auto_683397 ) ) ( not ( = ?auto_683393 ?auto_683398 ) ) ( not ( = ?auto_683394 ?auto_683395 ) ) ( not ( = ?auto_683394 ?auto_683396 ) ) ( not ( = ?auto_683394 ?auto_683397 ) ) ( not ( = ?auto_683394 ?auto_683398 ) ) ( not ( = ?auto_683395 ?auto_683396 ) ) ( not ( = ?auto_683395 ?auto_683397 ) ) ( not ( = ?auto_683395 ?auto_683398 ) ) ( not ( = ?auto_683396 ?auto_683397 ) ) ( not ( = ?auto_683396 ?auto_683398 ) ) ( not ( = ?auto_683397 ?auto_683398 ) ) ( ON ?auto_683396 ?auto_683397 ) ( ON ?auto_683395 ?auto_683396 ) ( ON ?auto_683394 ?auto_683395 ) ( ON ?auto_683393 ?auto_683394 ) ( ON ?auto_683392 ?auto_683393 ) ( ON ?auto_683391 ?auto_683392 ) ( ON ?auto_683390 ?auto_683391 ) ( ON ?auto_683389 ?auto_683390 ) ( ON ?auto_683388 ?auto_683389 ) ( ON ?auto_683387 ?auto_683388 ) ( ON ?auto_683386 ?auto_683387 ) ( ON ?auto_683385 ?auto_683386 ) ( CLEAR ?auto_683385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_683385 )
      ( MAKE-13PILE ?auto_683385 ?auto_683386 ?auto_683387 ?auto_683388 ?auto_683389 ?auto_683390 ?auto_683391 ?auto_683392 ?auto_683393 ?auto_683394 ?auto_683395 ?auto_683396 ?auto_683397 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_683440 - BLOCK
      ?auto_683441 - BLOCK
      ?auto_683442 - BLOCK
      ?auto_683443 - BLOCK
      ?auto_683444 - BLOCK
      ?auto_683445 - BLOCK
      ?auto_683446 - BLOCK
      ?auto_683447 - BLOCK
      ?auto_683448 - BLOCK
      ?auto_683449 - BLOCK
      ?auto_683450 - BLOCK
      ?auto_683451 - BLOCK
      ?auto_683452 - BLOCK
      ?auto_683453 - BLOCK
    )
    :vars
    (
      ?auto_683454 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_683452 ) ( ON ?auto_683453 ?auto_683454 ) ( CLEAR ?auto_683453 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_683440 ) ( ON ?auto_683441 ?auto_683440 ) ( ON ?auto_683442 ?auto_683441 ) ( ON ?auto_683443 ?auto_683442 ) ( ON ?auto_683444 ?auto_683443 ) ( ON ?auto_683445 ?auto_683444 ) ( ON ?auto_683446 ?auto_683445 ) ( ON ?auto_683447 ?auto_683446 ) ( ON ?auto_683448 ?auto_683447 ) ( ON ?auto_683449 ?auto_683448 ) ( ON ?auto_683450 ?auto_683449 ) ( ON ?auto_683451 ?auto_683450 ) ( ON ?auto_683452 ?auto_683451 ) ( not ( = ?auto_683440 ?auto_683441 ) ) ( not ( = ?auto_683440 ?auto_683442 ) ) ( not ( = ?auto_683440 ?auto_683443 ) ) ( not ( = ?auto_683440 ?auto_683444 ) ) ( not ( = ?auto_683440 ?auto_683445 ) ) ( not ( = ?auto_683440 ?auto_683446 ) ) ( not ( = ?auto_683440 ?auto_683447 ) ) ( not ( = ?auto_683440 ?auto_683448 ) ) ( not ( = ?auto_683440 ?auto_683449 ) ) ( not ( = ?auto_683440 ?auto_683450 ) ) ( not ( = ?auto_683440 ?auto_683451 ) ) ( not ( = ?auto_683440 ?auto_683452 ) ) ( not ( = ?auto_683440 ?auto_683453 ) ) ( not ( = ?auto_683440 ?auto_683454 ) ) ( not ( = ?auto_683441 ?auto_683442 ) ) ( not ( = ?auto_683441 ?auto_683443 ) ) ( not ( = ?auto_683441 ?auto_683444 ) ) ( not ( = ?auto_683441 ?auto_683445 ) ) ( not ( = ?auto_683441 ?auto_683446 ) ) ( not ( = ?auto_683441 ?auto_683447 ) ) ( not ( = ?auto_683441 ?auto_683448 ) ) ( not ( = ?auto_683441 ?auto_683449 ) ) ( not ( = ?auto_683441 ?auto_683450 ) ) ( not ( = ?auto_683441 ?auto_683451 ) ) ( not ( = ?auto_683441 ?auto_683452 ) ) ( not ( = ?auto_683441 ?auto_683453 ) ) ( not ( = ?auto_683441 ?auto_683454 ) ) ( not ( = ?auto_683442 ?auto_683443 ) ) ( not ( = ?auto_683442 ?auto_683444 ) ) ( not ( = ?auto_683442 ?auto_683445 ) ) ( not ( = ?auto_683442 ?auto_683446 ) ) ( not ( = ?auto_683442 ?auto_683447 ) ) ( not ( = ?auto_683442 ?auto_683448 ) ) ( not ( = ?auto_683442 ?auto_683449 ) ) ( not ( = ?auto_683442 ?auto_683450 ) ) ( not ( = ?auto_683442 ?auto_683451 ) ) ( not ( = ?auto_683442 ?auto_683452 ) ) ( not ( = ?auto_683442 ?auto_683453 ) ) ( not ( = ?auto_683442 ?auto_683454 ) ) ( not ( = ?auto_683443 ?auto_683444 ) ) ( not ( = ?auto_683443 ?auto_683445 ) ) ( not ( = ?auto_683443 ?auto_683446 ) ) ( not ( = ?auto_683443 ?auto_683447 ) ) ( not ( = ?auto_683443 ?auto_683448 ) ) ( not ( = ?auto_683443 ?auto_683449 ) ) ( not ( = ?auto_683443 ?auto_683450 ) ) ( not ( = ?auto_683443 ?auto_683451 ) ) ( not ( = ?auto_683443 ?auto_683452 ) ) ( not ( = ?auto_683443 ?auto_683453 ) ) ( not ( = ?auto_683443 ?auto_683454 ) ) ( not ( = ?auto_683444 ?auto_683445 ) ) ( not ( = ?auto_683444 ?auto_683446 ) ) ( not ( = ?auto_683444 ?auto_683447 ) ) ( not ( = ?auto_683444 ?auto_683448 ) ) ( not ( = ?auto_683444 ?auto_683449 ) ) ( not ( = ?auto_683444 ?auto_683450 ) ) ( not ( = ?auto_683444 ?auto_683451 ) ) ( not ( = ?auto_683444 ?auto_683452 ) ) ( not ( = ?auto_683444 ?auto_683453 ) ) ( not ( = ?auto_683444 ?auto_683454 ) ) ( not ( = ?auto_683445 ?auto_683446 ) ) ( not ( = ?auto_683445 ?auto_683447 ) ) ( not ( = ?auto_683445 ?auto_683448 ) ) ( not ( = ?auto_683445 ?auto_683449 ) ) ( not ( = ?auto_683445 ?auto_683450 ) ) ( not ( = ?auto_683445 ?auto_683451 ) ) ( not ( = ?auto_683445 ?auto_683452 ) ) ( not ( = ?auto_683445 ?auto_683453 ) ) ( not ( = ?auto_683445 ?auto_683454 ) ) ( not ( = ?auto_683446 ?auto_683447 ) ) ( not ( = ?auto_683446 ?auto_683448 ) ) ( not ( = ?auto_683446 ?auto_683449 ) ) ( not ( = ?auto_683446 ?auto_683450 ) ) ( not ( = ?auto_683446 ?auto_683451 ) ) ( not ( = ?auto_683446 ?auto_683452 ) ) ( not ( = ?auto_683446 ?auto_683453 ) ) ( not ( = ?auto_683446 ?auto_683454 ) ) ( not ( = ?auto_683447 ?auto_683448 ) ) ( not ( = ?auto_683447 ?auto_683449 ) ) ( not ( = ?auto_683447 ?auto_683450 ) ) ( not ( = ?auto_683447 ?auto_683451 ) ) ( not ( = ?auto_683447 ?auto_683452 ) ) ( not ( = ?auto_683447 ?auto_683453 ) ) ( not ( = ?auto_683447 ?auto_683454 ) ) ( not ( = ?auto_683448 ?auto_683449 ) ) ( not ( = ?auto_683448 ?auto_683450 ) ) ( not ( = ?auto_683448 ?auto_683451 ) ) ( not ( = ?auto_683448 ?auto_683452 ) ) ( not ( = ?auto_683448 ?auto_683453 ) ) ( not ( = ?auto_683448 ?auto_683454 ) ) ( not ( = ?auto_683449 ?auto_683450 ) ) ( not ( = ?auto_683449 ?auto_683451 ) ) ( not ( = ?auto_683449 ?auto_683452 ) ) ( not ( = ?auto_683449 ?auto_683453 ) ) ( not ( = ?auto_683449 ?auto_683454 ) ) ( not ( = ?auto_683450 ?auto_683451 ) ) ( not ( = ?auto_683450 ?auto_683452 ) ) ( not ( = ?auto_683450 ?auto_683453 ) ) ( not ( = ?auto_683450 ?auto_683454 ) ) ( not ( = ?auto_683451 ?auto_683452 ) ) ( not ( = ?auto_683451 ?auto_683453 ) ) ( not ( = ?auto_683451 ?auto_683454 ) ) ( not ( = ?auto_683452 ?auto_683453 ) ) ( not ( = ?auto_683452 ?auto_683454 ) ) ( not ( = ?auto_683453 ?auto_683454 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_683453 ?auto_683454 )
      ( !STACK ?auto_683453 ?auto_683452 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_683498 - BLOCK
      ?auto_683499 - BLOCK
      ?auto_683500 - BLOCK
      ?auto_683501 - BLOCK
      ?auto_683502 - BLOCK
      ?auto_683503 - BLOCK
      ?auto_683504 - BLOCK
      ?auto_683505 - BLOCK
      ?auto_683506 - BLOCK
      ?auto_683507 - BLOCK
      ?auto_683508 - BLOCK
      ?auto_683509 - BLOCK
      ?auto_683510 - BLOCK
      ?auto_683511 - BLOCK
    )
    :vars
    (
      ?auto_683512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_683511 ?auto_683512 ) ( ON-TABLE ?auto_683498 ) ( ON ?auto_683499 ?auto_683498 ) ( ON ?auto_683500 ?auto_683499 ) ( ON ?auto_683501 ?auto_683500 ) ( ON ?auto_683502 ?auto_683501 ) ( ON ?auto_683503 ?auto_683502 ) ( ON ?auto_683504 ?auto_683503 ) ( ON ?auto_683505 ?auto_683504 ) ( ON ?auto_683506 ?auto_683505 ) ( ON ?auto_683507 ?auto_683506 ) ( ON ?auto_683508 ?auto_683507 ) ( ON ?auto_683509 ?auto_683508 ) ( not ( = ?auto_683498 ?auto_683499 ) ) ( not ( = ?auto_683498 ?auto_683500 ) ) ( not ( = ?auto_683498 ?auto_683501 ) ) ( not ( = ?auto_683498 ?auto_683502 ) ) ( not ( = ?auto_683498 ?auto_683503 ) ) ( not ( = ?auto_683498 ?auto_683504 ) ) ( not ( = ?auto_683498 ?auto_683505 ) ) ( not ( = ?auto_683498 ?auto_683506 ) ) ( not ( = ?auto_683498 ?auto_683507 ) ) ( not ( = ?auto_683498 ?auto_683508 ) ) ( not ( = ?auto_683498 ?auto_683509 ) ) ( not ( = ?auto_683498 ?auto_683510 ) ) ( not ( = ?auto_683498 ?auto_683511 ) ) ( not ( = ?auto_683498 ?auto_683512 ) ) ( not ( = ?auto_683499 ?auto_683500 ) ) ( not ( = ?auto_683499 ?auto_683501 ) ) ( not ( = ?auto_683499 ?auto_683502 ) ) ( not ( = ?auto_683499 ?auto_683503 ) ) ( not ( = ?auto_683499 ?auto_683504 ) ) ( not ( = ?auto_683499 ?auto_683505 ) ) ( not ( = ?auto_683499 ?auto_683506 ) ) ( not ( = ?auto_683499 ?auto_683507 ) ) ( not ( = ?auto_683499 ?auto_683508 ) ) ( not ( = ?auto_683499 ?auto_683509 ) ) ( not ( = ?auto_683499 ?auto_683510 ) ) ( not ( = ?auto_683499 ?auto_683511 ) ) ( not ( = ?auto_683499 ?auto_683512 ) ) ( not ( = ?auto_683500 ?auto_683501 ) ) ( not ( = ?auto_683500 ?auto_683502 ) ) ( not ( = ?auto_683500 ?auto_683503 ) ) ( not ( = ?auto_683500 ?auto_683504 ) ) ( not ( = ?auto_683500 ?auto_683505 ) ) ( not ( = ?auto_683500 ?auto_683506 ) ) ( not ( = ?auto_683500 ?auto_683507 ) ) ( not ( = ?auto_683500 ?auto_683508 ) ) ( not ( = ?auto_683500 ?auto_683509 ) ) ( not ( = ?auto_683500 ?auto_683510 ) ) ( not ( = ?auto_683500 ?auto_683511 ) ) ( not ( = ?auto_683500 ?auto_683512 ) ) ( not ( = ?auto_683501 ?auto_683502 ) ) ( not ( = ?auto_683501 ?auto_683503 ) ) ( not ( = ?auto_683501 ?auto_683504 ) ) ( not ( = ?auto_683501 ?auto_683505 ) ) ( not ( = ?auto_683501 ?auto_683506 ) ) ( not ( = ?auto_683501 ?auto_683507 ) ) ( not ( = ?auto_683501 ?auto_683508 ) ) ( not ( = ?auto_683501 ?auto_683509 ) ) ( not ( = ?auto_683501 ?auto_683510 ) ) ( not ( = ?auto_683501 ?auto_683511 ) ) ( not ( = ?auto_683501 ?auto_683512 ) ) ( not ( = ?auto_683502 ?auto_683503 ) ) ( not ( = ?auto_683502 ?auto_683504 ) ) ( not ( = ?auto_683502 ?auto_683505 ) ) ( not ( = ?auto_683502 ?auto_683506 ) ) ( not ( = ?auto_683502 ?auto_683507 ) ) ( not ( = ?auto_683502 ?auto_683508 ) ) ( not ( = ?auto_683502 ?auto_683509 ) ) ( not ( = ?auto_683502 ?auto_683510 ) ) ( not ( = ?auto_683502 ?auto_683511 ) ) ( not ( = ?auto_683502 ?auto_683512 ) ) ( not ( = ?auto_683503 ?auto_683504 ) ) ( not ( = ?auto_683503 ?auto_683505 ) ) ( not ( = ?auto_683503 ?auto_683506 ) ) ( not ( = ?auto_683503 ?auto_683507 ) ) ( not ( = ?auto_683503 ?auto_683508 ) ) ( not ( = ?auto_683503 ?auto_683509 ) ) ( not ( = ?auto_683503 ?auto_683510 ) ) ( not ( = ?auto_683503 ?auto_683511 ) ) ( not ( = ?auto_683503 ?auto_683512 ) ) ( not ( = ?auto_683504 ?auto_683505 ) ) ( not ( = ?auto_683504 ?auto_683506 ) ) ( not ( = ?auto_683504 ?auto_683507 ) ) ( not ( = ?auto_683504 ?auto_683508 ) ) ( not ( = ?auto_683504 ?auto_683509 ) ) ( not ( = ?auto_683504 ?auto_683510 ) ) ( not ( = ?auto_683504 ?auto_683511 ) ) ( not ( = ?auto_683504 ?auto_683512 ) ) ( not ( = ?auto_683505 ?auto_683506 ) ) ( not ( = ?auto_683505 ?auto_683507 ) ) ( not ( = ?auto_683505 ?auto_683508 ) ) ( not ( = ?auto_683505 ?auto_683509 ) ) ( not ( = ?auto_683505 ?auto_683510 ) ) ( not ( = ?auto_683505 ?auto_683511 ) ) ( not ( = ?auto_683505 ?auto_683512 ) ) ( not ( = ?auto_683506 ?auto_683507 ) ) ( not ( = ?auto_683506 ?auto_683508 ) ) ( not ( = ?auto_683506 ?auto_683509 ) ) ( not ( = ?auto_683506 ?auto_683510 ) ) ( not ( = ?auto_683506 ?auto_683511 ) ) ( not ( = ?auto_683506 ?auto_683512 ) ) ( not ( = ?auto_683507 ?auto_683508 ) ) ( not ( = ?auto_683507 ?auto_683509 ) ) ( not ( = ?auto_683507 ?auto_683510 ) ) ( not ( = ?auto_683507 ?auto_683511 ) ) ( not ( = ?auto_683507 ?auto_683512 ) ) ( not ( = ?auto_683508 ?auto_683509 ) ) ( not ( = ?auto_683508 ?auto_683510 ) ) ( not ( = ?auto_683508 ?auto_683511 ) ) ( not ( = ?auto_683508 ?auto_683512 ) ) ( not ( = ?auto_683509 ?auto_683510 ) ) ( not ( = ?auto_683509 ?auto_683511 ) ) ( not ( = ?auto_683509 ?auto_683512 ) ) ( not ( = ?auto_683510 ?auto_683511 ) ) ( not ( = ?auto_683510 ?auto_683512 ) ) ( not ( = ?auto_683511 ?auto_683512 ) ) ( CLEAR ?auto_683509 ) ( ON ?auto_683510 ?auto_683511 ) ( CLEAR ?auto_683510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_683498 ?auto_683499 ?auto_683500 ?auto_683501 ?auto_683502 ?auto_683503 ?auto_683504 ?auto_683505 ?auto_683506 ?auto_683507 ?auto_683508 ?auto_683509 ?auto_683510 )
      ( MAKE-14PILE ?auto_683498 ?auto_683499 ?auto_683500 ?auto_683501 ?auto_683502 ?auto_683503 ?auto_683504 ?auto_683505 ?auto_683506 ?auto_683507 ?auto_683508 ?auto_683509 ?auto_683510 ?auto_683511 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_683556 - BLOCK
      ?auto_683557 - BLOCK
      ?auto_683558 - BLOCK
      ?auto_683559 - BLOCK
      ?auto_683560 - BLOCK
      ?auto_683561 - BLOCK
      ?auto_683562 - BLOCK
      ?auto_683563 - BLOCK
      ?auto_683564 - BLOCK
      ?auto_683565 - BLOCK
      ?auto_683566 - BLOCK
      ?auto_683567 - BLOCK
      ?auto_683568 - BLOCK
      ?auto_683569 - BLOCK
    )
    :vars
    (
      ?auto_683570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_683569 ?auto_683570 ) ( ON-TABLE ?auto_683556 ) ( ON ?auto_683557 ?auto_683556 ) ( ON ?auto_683558 ?auto_683557 ) ( ON ?auto_683559 ?auto_683558 ) ( ON ?auto_683560 ?auto_683559 ) ( ON ?auto_683561 ?auto_683560 ) ( ON ?auto_683562 ?auto_683561 ) ( ON ?auto_683563 ?auto_683562 ) ( ON ?auto_683564 ?auto_683563 ) ( ON ?auto_683565 ?auto_683564 ) ( ON ?auto_683566 ?auto_683565 ) ( not ( = ?auto_683556 ?auto_683557 ) ) ( not ( = ?auto_683556 ?auto_683558 ) ) ( not ( = ?auto_683556 ?auto_683559 ) ) ( not ( = ?auto_683556 ?auto_683560 ) ) ( not ( = ?auto_683556 ?auto_683561 ) ) ( not ( = ?auto_683556 ?auto_683562 ) ) ( not ( = ?auto_683556 ?auto_683563 ) ) ( not ( = ?auto_683556 ?auto_683564 ) ) ( not ( = ?auto_683556 ?auto_683565 ) ) ( not ( = ?auto_683556 ?auto_683566 ) ) ( not ( = ?auto_683556 ?auto_683567 ) ) ( not ( = ?auto_683556 ?auto_683568 ) ) ( not ( = ?auto_683556 ?auto_683569 ) ) ( not ( = ?auto_683556 ?auto_683570 ) ) ( not ( = ?auto_683557 ?auto_683558 ) ) ( not ( = ?auto_683557 ?auto_683559 ) ) ( not ( = ?auto_683557 ?auto_683560 ) ) ( not ( = ?auto_683557 ?auto_683561 ) ) ( not ( = ?auto_683557 ?auto_683562 ) ) ( not ( = ?auto_683557 ?auto_683563 ) ) ( not ( = ?auto_683557 ?auto_683564 ) ) ( not ( = ?auto_683557 ?auto_683565 ) ) ( not ( = ?auto_683557 ?auto_683566 ) ) ( not ( = ?auto_683557 ?auto_683567 ) ) ( not ( = ?auto_683557 ?auto_683568 ) ) ( not ( = ?auto_683557 ?auto_683569 ) ) ( not ( = ?auto_683557 ?auto_683570 ) ) ( not ( = ?auto_683558 ?auto_683559 ) ) ( not ( = ?auto_683558 ?auto_683560 ) ) ( not ( = ?auto_683558 ?auto_683561 ) ) ( not ( = ?auto_683558 ?auto_683562 ) ) ( not ( = ?auto_683558 ?auto_683563 ) ) ( not ( = ?auto_683558 ?auto_683564 ) ) ( not ( = ?auto_683558 ?auto_683565 ) ) ( not ( = ?auto_683558 ?auto_683566 ) ) ( not ( = ?auto_683558 ?auto_683567 ) ) ( not ( = ?auto_683558 ?auto_683568 ) ) ( not ( = ?auto_683558 ?auto_683569 ) ) ( not ( = ?auto_683558 ?auto_683570 ) ) ( not ( = ?auto_683559 ?auto_683560 ) ) ( not ( = ?auto_683559 ?auto_683561 ) ) ( not ( = ?auto_683559 ?auto_683562 ) ) ( not ( = ?auto_683559 ?auto_683563 ) ) ( not ( = ?auto_683559 ?auto_683564 ) ) ( not ( = ?auto_683559 ?auto_683565 ) ) ( not ( = ?auto_683559 ?auto_683566 ) ) ( not ( = ?auto_683559 ?auto_683567 ) ) ( not ( = ?auto_683559 ?auto_683568 ) ) ( not ( = ?auto_683559 ?auto_683569 ) ) ( not ( = ?auto_683559 ?auto_683570 ) ) ( not ( = ?auto_683560 ?auto_683561 ) ) ( not ( = ?auto_683560 ?auto_683562 ) ) ( not ( = ?auto_683560 ?auto_683563 ) ) ( not ( = ?auto_683560 ?auto_683564 ) ) ( not ( = ?auto_683560 ?auto_683565 ) ) ( not ( = ?auto_683560 ?auto_683566 ) ) ( not ( = ?auto_683560 ?auto_683567 ) ) ( not ( = ?auto_683560 ?auto_683568 ) ) ( not ( = ?auto_683560 ?auto_683569 ) ) ( not ( = ?auto_683560 ?auto_683570 ) ) ( not ( = ?auto_683561 ?auto_683562 ) ) ( not ( = ?auto_683561 ?auto_683563 ) ) ( not ( = ?auto_683561 ?auto_683564 ) ) ( not ( = ?auto_683561 ?auto_683565 ) ) ( not ( = ?auto_683561 ?auto_683566 ) ) ( not ( = ?auto_683561 ?auto_683567 ) ) ( not ( = ?auto_683561 ?auto_683568 ) ) ( not ( = ?auto_683561 ?auto_683569 ) ) ( not ( = ?auto_683561 ?auto_683570 ) ) ( not ( = ?auto_683562 ?auto_683563 ) ) ( not ( = ?auto_683562 ?auto_683564 ) ) ( not ( = ?auto_683562 ?auto_683565 ) ) ( not ( = ?auto_683562 ?auto_683566 ) ) ( not ( = ?auto_683562 ?auto_683567 ) ) ( not ( = ?auto_683562 ?auto_683568 ) ) ( not ( = ?auto_683562 ?auto_683569 ) ) ( not ( = ?auto_683562 ?auto_683570 ) ) ( not ( = ?auto_683563 ?auto_683564 ) ) ( not ( = ?auto_683563 ?auto_683565 ) ) ( not ( = ?auto_683563 ?auto_683566 ) ) ( not ( = ?auto_683563 ?auto_683567 ) ) ( not ( = ?auto_683563 ?auto_683568 ) ) ( not ( = ?auto_683563 ?auto_683569 ) ) ( not ( = ?auto_683563 ?auto_683570 ) ) ( not ( = ?auto_683564 ?auto_683565 ) ) ( not ( = ?auto_683564 ?auto_683566 ) ) ( not ( = ?auto_683564 ?auto_683567 ) ) ( not ( = ?auto_683564 ?auto_683568 ) ) ( not ( = ?auto_683564 ?auto_683569 ) ) ( not ( = ?auto_683564 ?auto_683570 ) ) ( not ( = ?auto_683565 ?auto_683566 ) ) ( not ( = ?auto_683565 ?auto_683567 ) ) ( not ( = ?auto_683565 ?auto_683568 ) ) ( not ( = ?auto_683565 ?auto_683569 ) ) ( not ( = ?auto_683565 ?auto_683570 ) ) ( not ( = ?auto_683566 ?auto_683567 ) ) ( not ( = ?auto_683566 ?auto_683568 ) ) ( not ( = ?auto_683566 ?auto_683569 ) ) ( not ( = ?auto_683566 ?auto_683570 ) ) ( not ( = ?auto_683567 ?auto_683568 ) ) ( not ( = ?auto_683567 ?auto_683569 ) ) ( not ( = ?auto_683567 ?auto_683570 ) ) ( not ( = ?auto_683568 ?auto_683569 ) ) ( not ( = ?auto_683568 ?auto_683570 ) ) ( not ( = ?auto_683569 ?auto_683570 ) ) ( ON ?auto_683568 ?auto_683569 ) ( CLEAR ?auto_683566 ) ( ON ?auto_683567 ?auto_683568 ) ( CLEAR ?auto_683567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_683556 ?auto_683557 ?auto_683558 ?auto_683559 ?auto_683560 ?auto_683561 ?auto_683562 ?auto_683563 ?auto_683564 ?auto_683565 ?auto_683566 ?auto_683567 )
      ( MAKE-14PILE ?auto_683556 ?auto_683557 ?auto_683558 ?auto_683559 ?auto_683560 ?auto_683561 ?auto_683562 ?auto_683563 ?auto_683564 ?auto_683565 ?auto_683566 ?auto_683567 ?auto_683568 ?auto_683569 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_683614 - BLOCK
      ?auto_683615 - BLOCK
      ?auto_683616 - BLOCK
      ?auto_683617 - BLOCK
      ?auto_683618 - BLOCK
      ?auto_683619 - BLOCK
      ?auto_683620 - BLOCK
      ?auto_683621 - BLOCK
      ?auto_683622 - BLOCK
      ?auto_683623 - BLOCK
      ?auto_683624 - BLOCK
      ?auto_683625 - BLOCK
      ?auto_683626 - BLOCK
      ?auto_683627 - BLOCK
    )
    :vars
    (
      ?auto_683628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_683627 ?auto_683628 ) ( ON-TABLE ?auto_683614 ) ( ON ?auto_683615 ?auto_683614 ) ( ON ?auto_683616 ?auto_683615 ) ( ON ?auto_683617 ?auto_683616 ) ( ON ?auto_683618 ?auto_683617 ) ( ON ?auto_683619 ?auto_683618 ) ( ON ?auto_683620 ?auto_683619 ) ( ON ?auto_683621 ?auto_683620 ) ( ON ?auto_683622 ?auto_683621 ) ( ON ?auto_683623 ?auto_683622 ) ( not ( = ?auto_683614 ?auto_683615 ) ) ( not ( = ?auto_683614 ?auto_683616 ) ) ( not ( = ?auto_683614 ?auto_683617 ) ) ( not ( = ?auto_683614 ?auto_683618 ) ) ( not ( = ?auto_683614 ?auto_683619 ) ) ( not ( = ?auto_683614 ?auto_683620 ) ) ( not ( = ?auto_683614 ?auto_683621 ) ) ( not ( = ?auto_683614 ?auto_683622 ) ) ( not ( = ?auto_683614 ?auto_683623 ) ) ( not ( = ?auto_683614 ?auto_683624 ) ) ( not ( = ?auto_683614 ?auto_683625 ) ) ( not ( = ?auto_683614 ?auto_683626 ) ) ( not ( = ?auto_683614 ?auto_683627 ) ) ( not ( = ?auto_683614 ?auto_683628 ) ) ( not ( = ?auto_683615 ?auto_683616 ) ) ( not ( = ?auto_683615 ?auto_683617 ) ) ( not ( = ?auto_683615 ?auto_683618 ) ) ( not ( = ?auto_683615 ?auto_683619 ) ) ( not ( = ?auto_683615 ?auto_683620 ) ) ( not ( = ?auto_683615 ?auto_683621 ) ) ( not ( = ?auto_683615 ?auto_683622 ) ) ( not ( = ?auto_683615 ?auto_683623 ) ) ( not ( = ?auto_683615 ?auto_683624 ) ) ( not ( = ?auto_683615 ?auto_683625 ) ) ( not ( = ?auto_683615 ?auto_683626 ) ) ( not ( = ?auto_683615 ?auto_683627 ) ) ( not ( = ?auto_683615 ?auto_683628 ) ) ( not ( = ?auto_683616 ?auto_683617 ) ) ( not ( = ?auto_683616 ?auto_683618 ) ) ( not ( = ?auto_683616 ?auto_683619 ) ) ( not ( = ?auto_683616 ?auto_683620 ) ) ( not ( = ?auto_683616 ?auto_683621 ) ) ( not ( = ?auto_683616 ?auto_683622 ) ) ( not ( = ?auto_683616 ?auto_683623 ) ) ( not ( = ?auto_683616 ?auto_683624 ) ) ( not ( = ?auto_683616 ?auto_683625 ) ) ( not ( = ?auto_683616 ?auto_683626 ) ) ( not ( = ?auto_683616 ?auto_683627 ) ) ( not ( = ?auto_683616 ?auto_683628 ) ) ( not ( = ?auto_683617 ?auto_683618 ) ) ( not ( = ?auto_683617 ?auto_683619 ) ) ( not ( = ?auto_683617 ?auto_683620 ) ) ( not ( = ?auto_683617 ?auto_683621 ) ) ( not ( = ?auto_683617 ?auto_683622 ) ) ( not ( = ?auto_683617 ?auto_683623 ) ) ( not ( = ?auto_683617 ?auto_683624 ) ) ( not ( = ?auto_683617 ?auto_683625 ) ) ( not ( = ?auto_683617 ?auto_683626 ) ) ( not ( = ?auto_683617 ?auto_683627 ) ) ( not ( = ?auto_683617 ?auto_683628 ) ) ( not ( = ?auto_683618 ?auto_683619 ) ) ( not ( = ?auto_683618 ?auto_683620 ) ) ( not ( = ?auto_683618 ?auto_683621 ) ) ( not ( = ?auto_683618 ?auto_683622 ) ) ( not ( = ?auto_683618 ?auto_683623 ) ) ( not ( = ?auto_683618 ?auto_683624 ) ) ( not ( = ?auto_683618 ?auto_683625 ) ) ( not ( = ?auto_683618 ?auto_683626 ) ) ( not ( = ?auto_683618 ?auto_683627 ) ) ( not ( = ?auto_683618 ?auto_683628 ) ) ( not ( = ?auto_683619 ?auto_683620 ) ) ( not ( = ?auto_683619 ?auto_683621 ) ) ( not ( = ?auto_683619 ?auto_683622 ) ) ( not ( = ?auto_683619 ?auto_683623 ) ) ( not ( = ?auto_683619 ?auto_683624 ) ) ( not ( = ?auto_683619 ?auto_683625 ) ) ( not ( = ?auto_683619 ?auto_683626 ) ) ( not ( = ?auto_683619 ?auto_683627 ) ) ( not ( = ?auto_683619 ?auto_683628 ) ) ( not ( = ?auto_683620 ?auto_683621 ) ) ( not ( = ?auto_683620 ?auto_683622 ) ) ( not ( = ?auto_683620 ?auto_683623 ) ) ( not ( = ?auto_683620 ?auto_683624 ) ) ( not ( = ?auto_683620 ?auto_683625 ) ) ( not ( = ?auto_683620 ?auto_683626 ) ) ( not ( = ?auto_683620 ?auto_683627 ) ) ( not ( = ?auto_683620 ?auto_683628 ) ) ( not ( = ?auto_683621 ?auto_683622 ) ) ( not ( = ?auto_683621 ?auto_683623 ) ) ( not ( = ?auto_683621 ?auto_683624 ) ) ( not ( = ?auto_683621 ?auto_683625 ) ) ( not ( = ?auto_683621 ?auto_683626 ) ) ( not ( = ?auto_683621 ?auto_683627 ) ) ( not ( = ?auto_683621 ?auto_683628 ) ) ( not ( = ?auto_683622 ?auto_683623 ) ) ( not ( = ?auto_683622 ?auto_683624 ) ) ( not ( = ?auto_683622 ?auto_683625 ) ) ( not ( = ?auto_683622 ?auto_683626 ) ) ( not ( = ?auto_683622 ?auto_683627 ) ) ( not ( = ?auto_683622 ?auto_683628 ) ) ( not ( = ?auto_683623 ?auto_683624 ) ) ( not ( = ?auto_683623 ?auto_683625 ) ) ( not ( = ?auto_683623 ?auto_683626 ) ) ( not ( = ?auto_683623 ?auto_683627 ) ) ( not ( = ?auto_683623 ?auto_683628 ) ) ( not ( = ?auto_683624 ?auto_683625 ) ) ( not ( = ?auto_683624 ?auto_683626 ) ) ( not ( = ?auto_683624 ?auto_683627 ) ) ( not ( = ?auto_683624 ?auto_683628 ) ) ( not ( = ?auto_683625 ?auto_683626 ) ) ( not ( = ?auto_683625 ?auto_683627 ) ) ( not ( = ?auto_683625 ?auto_683628 ) ) ( not ( = ?auto_683626 ?auto_683627 ) ) ( not ( = ?auto_683626 ?auto_683628 ) ) ( not ( = ?auto_683627 ?auto_683628 ) ) ( ON ?auto_683626 ?auto_683627 ) ( ON ?auto_683625 ?auto_683626 ) ( CLEAR ?auto_683623 ) ( ON ?auto_683624 ?auto_683625 ) ( CLEAR ?auto_683624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_683614 ?auto_683615 ?auto_683616 ?auto_683617 ?auto_683618 ?auto_683619 ?auto_683620 ?auto_683621 ?auto_683622 ?auto_683623 ?auto_683624 )
      ( MAKE-14PILE ?auto_683614 ?auto_683615 ?auto_683616 ?auto_683617 ?auto_683618 ?auto_683619 ?auto_683620 ?auto_683621 ?auto_683622 ?auto_683623 ?auto_683624 ?auto_683625 ?auto_683626 ?auto_683627 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_683672 - BLOCK
      ?auto_683673 - BLOCK
      ?auto_683674 - BLOCK
      ?auto_683675 - BLOCK
      ?auto_683676 - BLOCK
      ?auto_683677 - BLOCK
      ?auto_683678 - BLOCK
      ?auto_683679 - BLOCK
      ?auto_683680 - BLOCK
      ?auto_683681 - BLOCK
      ?auto_683682 - BLOCK
      ?auto_683683 - BLOCK
      ?auto_683684 - BLOCK
      ?auto_683685 - BLOCK
    )
    :vars
    (
      ?auto_683686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_683685 ?auto_683686 ) ( ON-TABLE ?auto_683672 ) ( ON ?auto_683673 ?auto_683672 ) ( ON ?auto_683674 ?auto_683673 ) ( ON ?auto_683675 ?auto_683674 ) ( ON ?auto_683676 ?auto_683675 ) ( ON ?auto_683677 ?auto_683676 ) ( ON ?auto_683678 ?auto_683677 ) ( ON ?auto_683679 ?auto_683678 ) ( ON ?auto_683680 ?auto_683679 ) ( not ( = ?auto_683672 ?auto_683673 ) ) ( not ( = ?auto_683672 ?auto_683674 ) ) ( not ( = ?auto_683672 ?auto_683675 ) ) ( not ( = ?auto_683672 ?auto_683676 ) ) ( not ( = ?auto_683672 ?auto_683677 ) ) ( not ( = ?auto_683672 ?auto_683678 ) ) ( not ( = ?auto_683672 ?auto_683679 ) ) ( not ( = ?auto_683672 ?auto_683680 ) ) ( not ( = ?auto_683672 ?auto_683681 ) ) ( not ( = ?auto_683672 ?auto_683682 ) ) ( not ( = ?auto_683672 ?auto_683683 ) ) ( not ( = ?auto_683672 ?auto_683684 ) ) ( not ( = ?auto_683672 ?auto_683685 ) ) ( not ( = ?auto_683672 ?auto_683686 ) ) ( not ( = ?auto_683673 ?auto_683674 ) ) ( not ( = ?auto_683673 ?auto_683675 ) ) ( not ( = ?auto_683673 ?auto_683676 ) ) ( not ( = ?auto_683673 ?auto_683677 ) ) ( not ( = ?auto_683673 ?auto_683678 ) ) ( not ( = ?auto_683673 ?auto_683679 ) ) ( not ( = ?auto_683673 ?auto_683680 ) ) ( not ( = ?auto_683673 ?auto_683681 ) ) ( not ( = ?auto_683673 ?auto_683682 ) ) ( not ( = ?auto_683673 ?auto_683683 ) ) ( not ( = ?auto_683673 ?auto_683684 ) ) ( not ( = ?auto_683673 ?auto_683685 ) ) ( not ( = ?auto_683673 ?auto_683686 ) ) ( not ( = ?auto_683674 ?auto_683675 ) ) ( not ( = ?auto_683674 ?auto_683676 ) ) ( not ( = ?auto_683674 ?auto_683677 ) ) ( not ( = ?auto_683674 ?auto_683678 ) ) ( not ( = ?auto_683674 ?auto_683679 ) ) ( not ( = ?auto_683674 ?auto_683680 ) ) ( not ( = ?auto_683674 ?auto_683681 ) ) ( not ( = ?auto_683674 ?auto_683682 ) ) ( not ( = ?auto_683674 ?auto_683683 ) ) ( not ( = ?auto_683674 ?auto_683684 ) ) ( not ( = ?auto_683674 ?auto_683685 ) ) ( not ( = ?auto_683674 ?auto_683686 ) ) ( not ( = ?auto_683675 ?auto_683676 ) ) ( not ( = ?auto_683675 ?auto_683677 ) ) ( not ( = ?auto_683675 ?auto_683678 ) ) ( not ( = ?auto_683675 ?auto_683679 ) ) ( not ( = ?auto_683675 ?auto_683680 ) ) ( not ( = ?auto_683675 ?auto_683681 ) ) ( not ( = ?auto_683675 ?auto_683682 ) ) ( not ( = ?auto_683675 ?auto_683683 ) ) ( not ( = ?auto_683675 ?auto_683684 ) ) ( not ( = ?auto_683675 ?auto_683685 ) ) ( not ( = ?auto_683675 ?auto_683686 ) ) ( not ( = ?auto_683676 ?auto_683677 ) ) ( not ( = ?auto_683676 ?auto_683678 ) ) ( not ( = ?auto_683676 ?auto_683679 ) ) ( not ( = ?auto_683676 ?auto_683680 ) ) ( not ( = ?auto_683676 ?auto_683681 ) ) ( not ( = ?auto_683676 ?auto_683682 ) ) ( not ( = ?auto_683676 ?auto_683683 ) ) ( not ( = ?auto_683676 ?auto_683684 ) ) ( not ( = ?auto_683676 ?auto_683685 ) ) ( not ( = ?auto_683676 ?auto_683686 ) ) ( not ( = ?auto_683677 ?auto_683678 ) ) ( not ( = ?auto_683677 ?auto_683679 ) ) ( not ( = ?auto_683677 ?auto_683680 ) ) ( not ( = ?auto_683677 ?auto_683681 ) ) ( not ( = ?auto_683677 ?auto_683682 ) ) ( not ( = ?auto_683677 ?auto_683683 ) ) ( not ( = ?auto_683677 ?auto_683684 ) ) ( not ( = ?auto_683677 ?auto_683685 ) ) ( not ( = ?auto_683677 ?auto_683686 ) ) ( not ( = ?auto_683678 ?auto_683679 ) ) ( not ( = ?auto_683678 ?auto_683680 ) ) ( not ( = ?auto_683678 ?auto_683681 ) ) ( not ( = ?auto_683678 ?auto_683682 ) ) ( not ( = ?auto_683678 ?auto_683683 ) ) ( not ( = ?auto_683678 ?auto_683684 ) ) ( not ( = ?auto_683678 ?auto_683685 ) ) ( not ( = ?auto_683678 ?auto_683686 ) ) ( not ( = ?auto_683679 ?auto_683680 ) ) ( not ( = ?auto_683679 ?auto_683681 ) ) ( not ( = ?auto_683679 ?auto_683682 ) ) ( not ( = ?auto_683679 ?auto_683683 ) ) ( not ( = ?auto_683679 ?auto_683684 ) ) ( not ( = ?auto_683679 ?auto_683685 ) ) ( not ( = ?auto_683679 ?auto_683686 ) ) ( not ( = ?auto_683680 ?auto_683681 ) ) ( not ( = ?auto_683680 ?auto_683682 ) ) ( not ( = ?auto_683680 ?auto_683683 ) ) ( not ( = ?auto_683680 ?auto_683684 ) ) ( not ( = ?auto_683680 ?auto_683685 ) ) ( not ( = ?auto_683680 ?auto_683686 ) ) ( not ( = ?auto_683681 ?auto_683682 ) ) ( not ( = ?auto_683681 ?auto_683683 ) ) ( not ( = ?auto_683681 ?auto_683684 ) ) ( not ( = ?auto_683681 ?auto_683685 ) ) ( not ( = ?auto_683681 ?auto_683686 ) ) ( not ( = ?auto_683682 ?auto_683683 ) ) ( not ( = ?auto_683682 ?auto_683684 ) ) ( not ( = ?auto_683682 ?auto_683685 ) ) ( not ( = ?auto_683682 ?auto_683686 ) ) ( not ( = ?auto_683683 ?auto_683684 ) ) ( not ( = ?auto_683683 ?auto_683685 ) ) ( not ( = ?auto_683683 ?auto_683686 ) ) ( not ( = ?auto_683684 ?auto_683685 ) ) ( not ( = ?auto_683684 ?auto_683686 ) ) ( not ( = ?auto_683685 ?auto_683686 ) ) ( ON ?auto_683684 ?auto_683685 ) ( ON ?auto_683683 ?auto_683684 ) ( ON ?auto_683682 ?auto_683683 ) ( CLEAR ?auto_683680 ) ( ON ?auto_683681 ?auto_683682 ) ( CLEAR ?auto_683681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_683672 ?auto_683673 ?auto_683674 ?auto_683675 ?auto_683676 ?auto_683677 ?auto_683678 ?auto_683679 ?auto_683680 ?auto_683681 )
      ( MAKE-14PILE ?auto_683672 ?auto_683673 ?auto_683674 ?auto_683675 ?auto_683676 ?auto_683677 ?auto_683678 ?auto_683679 ?auto_683680 ?auto_683681 ?auto_683682 ?auto_683683 ?auto_683684 ?auto_683685 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_683730 - BLOCK
      ?auto_683731 - BLOCK
      ?auto_683732 - BLOCK
      ?auto_683733 - BLOCK
      ?auto_683734 - BLOCK
      ?auto_683735 - BLOCK
      ?auto_683736 - BLOCK
      ?auto_683737 - BLOCK
      ?auto_683738 - BLOCK
      ?auto_683739 - BLOCK
      ?auto_683740 - BLOCK
      ?auto_683741 - BLOCK
      ?auto_683742 - BLOCK
      ?auto_683743 - BLOCK
    )
    :vars
    (
      ?auto_683744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_683743 ?auto_683744 ) ( ON-TABLE ?auto_683730 ) ( ON ?auto_683731 ?auto_683730 ) ( ON ?auto_683732 ?auto_683731 ) ( ON ?auto_683733 ?auto_683732 ) ( ON ?auto_683734 ?auto_683733 ) ( ON ?auto_683735 ?auto_683734 ) ( ON ?auto_683736 ?auto_683735 ) ( ON ?auto_683737 ?auto_683736 ) ( not ( = ?auto_683730 ?auto_683731 ) ) ( not ( = ?auto_683730 ?auto_683732 ) ) ( not ( = ?auto_683730 ?auto_683733 ) ) ( not ( = ?auto_683730 ?auto_683734 ) ) ( not ( = ?auto_683730 ?auto_683735 ) ) ( not ( = ?auto_683730 ?auto_683736 ) ) ( not ( = ?auto_683730 ?auto_683737 ) ) ( not ( = ?auto_683730 ?auto_683738 ) ) ( not ( = ?auto_683730 ?auto_683739 ) ) ( not ( = ?auto_683730 ?auto_683740 ) ) ( not ( = ?auto_683730 ?auto_683741 ) ) ( not ( = ?auto_683730 ?auto_683742 ) ) ( not ( = ?auto_683730 ?auto_683743 ) ) ( not ( = ?auto_683730 ?auto_683744 ) ) ( not ( = ?auto_683731 ?auto_683732 ) ) ( not ( = ?auto_683731 ?auto_683733 ) ) ( not ( = ?auto_683731 ?auto_683734 ) ) ( not ( = ?auto_683731 ?auto_683735 ) ) ( not ( = ?auto_683731 ?auto_683736 ) ) ( not ( = ?auto_683731 ?auto_683737 ) ) ( not ( = ?auto_683731 ?auto_683738 ) ) ( not ( = ?auto_683731 ?auto_683739 ) ) ( not ( = ?auto_683731 ?auto_683740 ) ) ( not ( = ?auto_683731 ?auto_683741 ) ) ( not ( = ?auto_683731 ?auto_683742 ) ) ( not ( = ?auto_683731 ?auto_683743 ) ) ( not ( = ?auto_683731 ?auto_683744 ) ) ( not ( = ?auto_683732 ?auto_683733 ) ) ( not ( = ?auto_683732 ?auto_683734 ) ) ( not ( = ?auto_683732 ?auto_683735 ) ) ( not ( = ?auto_683732 ?auto_683736 ) ) ( not ( = ?auto_683732 ?auto_683737 ) ) ( not ( = ?auto_683732 ?auto_683738 ) ) ( not ( = ?auto_683732 ?auto_683739 ) ) ( not ( = ?auto_683732 ?auto_683740 ) ) ( not ( = ?auto_683732 ?auto_683741 ) ) ( not ( = ?auto_683732 ?auto_683742 ) ) ( not ( = ?auto_683732 ?auto_683743 ) ) ( not ( = ?auto_683732 ?auto_683744 ) ) ( not ( = ?auto_683733 ?auto_683734 ) ) ( not ( = ?auto_683733 ?auto_683735 ) ) ( not ( = ?auto_683733 ?auto_683736 ) ) ( not ( = ?auto_683733 ?auto_683737 ) ) ( not ( = ?auto_683733 ?auto_683738 ) ) ( not ( = ?auto_683733 ?auto_683739 ) ) ( not ( = ?auto_683733 ?auto_683740 ) ) ( not ( = ?auto_683733 ?auto_683741 ) ) ( not ( = ?auto_683733 ?auto_683742 ) ) ( not ( = ?auto_683733 ?auto_683743 ) ) ( not ( = ?auto_683733 ?auto_683744 ) ) ( not ( = ?auto_683734 ?auto_683735 ) ) ( not ( = ?auto_683734 ?auto_683736 ) ) ( not ( = ?auto_683734 ?auto_683737 ) ) ( not ( = ?auto_683734 ?auto_683738 ) ) ( not ( = ?auto_683734 ?auto_683739 ) ) ( not ( = ?auto_683734 ?auto_683740 ) ) ( not ( = ?auto_683734 ?auto_683741 ) ) ( not ( = ?auto_683734 ?auto_683742 ) ) ( not ( = ?auto_683734 ?auto_683743 ) ) ( not ( = ?auto_683734 ?auto_683744 ) ) ( not ( = ?auto_683735 ?auto_683736 ) ) ( not ( = ?auto_683735 ?auto_683737 ) ) ( not ( = ?auto_683735 ?auto_683738 ) ) ( not ( = ?auto_683735 ?auto_683739 ) ) ( not ( = ?auto_683735 ?auto_683740 ) ) ( not ( = ?auto_683735 ?auto_683741 ) ) ( not ( = ?auto_683735 ?auto_683742 ) ) ( not ( = ?auto_683735 ?auto_683743 ) ) ( not ( = ?auto_683735 ?auto_683744 ) ) ( not ( = ?auto_683736 ?auto_683737 ) ) ( not ( = ?auto_683736 ?auto_683738 ) ) ( not ( = ?auto_683736 ?auto_683739 ) ) ( not ( = ?auto_683736 ?auto_683740 ) ) ( not ( = ?auto_683736 ?auto_683741 ) ) ( not ( = ?auto_683736 ?auto_683742 ) ) ( not ( = ?auto_683736 ?auto_683743 ) ) ( not ( = ?auto_683736 ?auto_683744 ) ) ( not ( = ?auto_683737 ?auto_683738 ) ) ( not ( = ?auto_683737 ?auto_683739 ) ) ( not ( = ?auto_683737 ?auto_683740 ) ) ( not ( = ?auto_683737 ?auto_683741 ) ) ( not ( = ?auto_683737 ?auto_683742 ) ) ( not ( = ?auto_683737 ?auto_683743 ) ) ( not ( = ?auto_683737 ?auto_683744 ) ) ( not ( = ?auto_683738 ?auto_683739 ) ) ( not ( = ?auto_683738 ?auto_683740 ) ) ( not ( = ?auto_683738 ?auto_683741 ) ) ( not ( = ?auto_683738 ?auto_683742 ) ) ( not ( = ?auto_683738 ?auto_683743 ) ) ( not ( = ?auto_683738 ?auto_683744 ) ) ( not ( = ?auto_683739 ?auto_683740 ) ) ( not ( = ?auto_683739 ?auto_683741 ) ) ( not ( = ?auto_683739 ?auto_683742 ) ) ( not ( = ?auto_683739 ?auto_683743 ) ) ( not ( = ?auto_683739 ?auto_683744 ) ) ( not ( = ?auto_683740 ?auto_683741 ) ) ( not ( = ?auto_683740 ?auto_683742 ) ) ( not ( = ?auto_683740 ?auto_683743 ) ) ( not ( = ?auto_683740 ?auto_683744 ) ) ( not ( = ?auto_683741 ?auto_683742 ) ) ( not ( = ?auto_683741 ?auto_683743 ) ) ( not ( = ?auto_683741 ?auto_683744 ) ) ( not ( = ?auto_683742 ?auto_683743 ) ) ( not ( = ?auto_683742 ?auto_683744 ) ) ( not ( = ?auto_683743 ?auto_683744 ) ) ( ON ?auto_683742 ?auto_683743 ) ( ON ?auto_683741 ?auto_683742 ) ( ON ?auto_683740 ?auto_683741 ) ( ON ?auto_683739 ?auto_683740 ) ( CLEAR ?auto_683737 ) ( ON ?auto_683738 ?auto_683739 ) ( CLEAR ?auto_683738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_683730 ?auto_683731 ?auto_683732 ?auto_683733 ?auto_683734 ?auto_683735 ?auto_683736 ?auto_683737 ?auto_683738 )
      ( MAKE-14PILE ?auto_683730 ?auto_683731 ?auto_683732 ?auto_683733 ?auto_683734 ?auto_683735 ?auto_683736 ?auto_683737 ?auto_683738 ?auto_683739 ?auto_683740 ?auto_683741 ?auto_683742 ?auto_683743 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_683788 - BLOCK
      ?auto_683789 - BLOCK
      ?auto_683790 - BLOCK
      ?auto_683791 - BLOCK
      ?auto_683792 - BLOCK
      ?auto_683793 - BLOCK
      ?auto_683794 - BLOCK
      ?auto_683795 - BLOCK
      ?auto_683796 - BLOCK
      ?auto_683797 - BLOCK
      ?auto_683798 - BLOCK
      ?auto_683799 - BLOCK
      ?auto_683800 - BLOCK
      ?auto_683801 - BLOCK
    )
    :vars
    (
      ?auto_683802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_683801 ?auto_683802 ) ( ON-TABLE ?auto_683788 ) ( ON ?auto_683789 ?auto_683788 ) ( ON ?auto_683790 ?auto_683789 ) ( ON ?auto_683791 ?auto_683790 ) ( ON ?auto_683792 ?auto_683791 ) ( ON ?auto_683793 ?auto_683792 ) ( ON ?auto_683794 ?auto_683793 ) ( not ( = ?auto_683788 ?auto_683789 ) ) ( not ( = ?auto_683788 ?auto_683790 ) ) ( not ( = ?auto_683788 ?auto_683791 ) ) ( not ( = ?auto_683788 ?auto_683792 ) ) ( not ( = ?auto_683788 ?auto_683793 ) ) ( not ( = ?auto_683788 ?auto_683794 ) ) ( not ( = ?auto_683788 ?auto_683795 ) ) ( not ( = ?auto_683788 ?auto_683796 ) ) ( not ( = ?auto_683788 ?auto_683797 ) ) ( not ( = ?auto_683788 ?auto_683798 ) ) ( not ( = ?auto_683788 ?auto_683799 ) ) ( not ( = ?auto_683788 ?auto_683800 ) ) ( not ( = ?auto_683788 ?auto_683801 ) ) ( not ( = ?auto_683788 ?auto_683802 ) ) ( not ( = ?auto_683789 ?auto_683790 ) ) ( not ( = ?auto_683789 ?auto_683791 ) ) ( not ( = ?auto_683789 ?auto_683792 ) ) ( not ( = ?auto_683789 ?auto_683793 ) ) ( not ( = ?auto_683789 ?auto_683794 ) ) ( not ( = ?auto_683789 ?auto_683795 ) ) ( not ( = ?auto_683789 ?auto_683796 ) ) ( not ( = ?auto_683789 ?auto_683797 ) ) ( not ( = ?auto_683789 ?auto_683798 ) ) ( not ( = ?auto_683789 ?auto_683799 ) ) ( not ( = ?auto_683789 ?auto_683800 ) ) ( not ( = ?auto_683789 ?auto_683801 ) ) ( not ( = ?auto_683789 ?auto_683802 ) ) ( not ( = ?auto_683790 ?auto_683791 ) ) ( not ( = ?auto_683790 ?auto_683792 ) ) ( not ( = ?auto_683790 ?auto_683793 ) ) ( not ( = ?auto_683790 ?auto_683794 ) ) ( not ( = ?auto_683790 ?auto_683795 ) ) ( not ( = ?auto_683790 ?auto_683796 ) ) ( not ( = ?auto_683790 ?auto_683797 ) ) ( not ( = ?auto_683790 ?auto_683798 ) ) ( not ( = ?auto_683790 ?auto_683799 ) ) ( not ( = ?auto_683790 ?auto_683800 ) ) ( not ( = ?auto_683790 ?auto_683801 ) ) ( not ( = ?auto_683790 ?auto_683802 ) ) ( not ( = ?auto_683791 ?auto_683792 ) ) ( not ( = ?auto_683791 ?auto_683793 ) ) ( not ( = ?auto_683791 ?auto_683794 ) ) ( not ( = ?auto_683791 ?auto_683795 ) ) ( not ( = ?auto_683791 ?auto_683796 ) ) ( not ( = ?auto_683791 ?auto_683797 ) ) ( not ( = ?auto_683791 ?auto_683798 ) ) ( not ( = ?auto_683791 ?auto_683799 ) ) ( not ( = ?auto_683791 ?auto_683800 ) ) ( not ( = ?auto_683791 ?auto_683801 ) ) ( not ( = ?auto_683791 ?auto_683802 ) ) ( not ( = ?auto_683792 ?auto_683793 ) ) ( not ( = ?auto_683792 ?auto_683794 ) ) ( not ( = ?auto_683792 ?auto_683795 ) ) ( not ( = ?auto_683792 ?auto_683796 ) ) ( not ( = ?auto_683792 ?auto_683797 ) ) ( not ( = ?auto_683792 ?auto_683798 ) ) ( not ( = ?auto_683792 ?auto_683799 ) ) ( not ( = ?auto_683792 ?auto_683800 ) ) ( not ( = ?auto_683792 ?auto_683801 ) ) ( not ( = ?auto_683792 ?auto_683802 ) ) ( not ( = ?auto_683793 ?auto_683794 ) ) ( not ( = ?auto_683793 ?auto_683795 ) ) ( not ( = ?auto_683793 ?auto_683796 ) ) ( not ( = ?auto_683793 ?auto_683797 ) ) ( not ( = ?auto_683793 ?auto_683798 ) ) ( not ( = ?auto_683793 ?auto_683799 ) ) ( not ( = ?auto_683793 ?auto_683800 ) ) ( not ( = ?auto_683793 ?auto_683801 ) ) ( not ( = ?auto_683793 ?auto_683802 ) ) ( not ( = ?auto_683794 ?auto_683795 ) ) ( not ( = ?auto_683794 ?auto_683796 ) ) ( not ( = ?auto_683794 ?auto_683797 ) ) ( not ( = ?auto_683794 ?auto_683798 ) ) ( not ( = ?auto_683794 ?auto_683799 ) ) ( not ( = ?auto_683794 ?auto_683800 ) ) ( not ( = ?auto_683794 ?auto_683801 ) ) ( not ( = ?auto_683794 ?auto_683802 ) ) ( not ( = ?auto_683795 ?auto_683796 ) ) ( not ( = ?auto_683795 ?auto_683797 ) ) ( not ( = ?auto_683795 ?auto_683798 ) ) ( not ( = ?auto_683795 ?auto_683799 ) ) ( not ( = ?auto_683795 ?auto_683800 ) ) ( not ( = ?auto_683795 ?auto_683801 ) ) ( not ( = ?auto_683795 ?auto_683802 ) ) ( not ( = ?auto_683796 ?auto_683797 ) ) ( not ( = ?auto_683796 ?auto_683798 ) ) ( not ( = ?auto_683796 ?auto_683799 ) ) ( not ( = ?auto_683796 ?auto_683800 ) ) ( not ( = ?auto_683796 ?auto_683801 ) ) ( not ( = ?auto_683796 ?auto_683802 ) ) ( not ( = ?auto_683797 ?auto_683798 ) ) ( not ( = ?auto_683797 ?auto_683799 ) ) ( not ( = ?auto_683797 ?auto_683800 ) ) ( not ( = ?auto_683797 ?auto_683801 ) ) ( not ( = ?auto_683797 ?auto_683802 ) ) ( not ( = ?auto_683798 ?auto_683799 ) ) ( not ( = ?auto_683798 ?auto_683800 ) ) ( not ( = ?auto_683798 ?auto_683801 ) ) ( not ( = ?auto_683798 ?auto_683802 ) ) ( not ( = ?auto_683799 ?auto_683800 ) ) ( not ( = ?auto_683799 ?auto_683801 ) ) ( not ( = ?auto_683799 ?auto_683802 ) ) ( not ( = ?auto_683800 ?auto_683801 ) ) ( not ( = ?auto_683800 ?auto_683802 ) ) ( not ( = ?auto_683801 ?auto_683802 ) ) ( ON ?auto_683800 ?auto_683801 ) ( ON ?auto_683799 ?auto_683800 ) ( ON ?auto_683798 ?auto_683799 ) ( ON ?auto_683797 ?auto_683798 ) ( ON ?auto_683796 ?auto_683797 ) ( CLEAR ?auto_683794 ) ( ON ?auto_683795 ?auto_683796 ) ( CLEAR ?auto_683795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_683788 ?auto_683789 ?auto_683790 ?auto_683791 ?auto_683792 ?auto_683793 ?auto_683794 ?auto_683795 )
      ( MAKE-14PILE ?auto_683788 ?auto_683789 ?auto_683790 ?auto_683791 ?auto_683792 ?auto_683793 ?auto_683794 ?auto_683795 ?auto_683796 ?auto_683797 ?auto_683798 ?auto_683799 ?auto_683800 ?auto_683801 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_683846 - BLOCK
      ?auto_683847 - BLOCK
      ?auto_683848 - BLOCK
      ?auto_683849 - BLOCK
      ?auto_683850 - BLOCK
      ?auto_683851 - BLOCK
      ?auto_683852 - BLOCK
      ?auto_683853 - BLOCK
      ?auto_683854 - BLOCK
      ?auto_683855 - BLOCK
      ?auto_683856 - BLOCK
      ?auto_683857 - BLOCK
      ?auto_683858 - BLOCK
      ?auto_683859 - BLOCK
    )
    :vars
    (
      ?auto_683860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_683859 ?auto_683860 ) ( ON-TABLE ?auto_683846 ) ( ON ?auto_683847 ?auto_683846 ) ( ON ?auto_683848 ?auto_683847 ) ( ON ?auto_683849 ?auto_683848 ) ( ON ?auto_683850 ?auto_683849 ) ( ON ?auto_683851 ?auto_683850 ) ( not ( = ?auto_683846 ?auto_683847 ) ) ( not ( = ?auto_683846 ?auto_683848 ) ) ( not ( = ?auto_683846 ?auto_683849 ) ) ( not ( = ?auto_683846 ?auto_683850 ) ) ( not ( = ?auto_683846 ?auto_683851 ) ) ( not ( = ?auto_683846 ?auto_683852 ) ) ( not ( = ?auto_683846 ?auto_683853 ) ) ( not ( = ?auto_683846 ?auto_683854 ) ) ( not ( = ?auto_683846 ?auto_683855 ) ) ( not ( = ?auto_683846 ?auto_683856 ) ) ( not ( = ?auto_683846 ?auto_683857 ) ) ( not ( = ?auto_683846 ?auto_683858 ) ) ( not ( = ?auto_683846 ?auto_683859 ) ) ( not ( = ?auto_683846 ?auto_683860 ) ) ( not ( = ?auto_683847 ?auto_683848 ) ) ( not ( = ?auto_683847 ?auto_683849 ) ) ( not ( = ?auto_683847 ?auto_683850 ) ) ( not ( = ?auto_683847 ?auto_683851 ) ) ( not ( = ?auto_683847 ?auto_683852 ) ) ( not ( = ?auto_683847 ?auto_683853 ) ) ( not ( = ?auto_683847 ?auto_683854 ) ) ( not ( = ?auto_683847 ?auto_683855 ) ) ( not ( = ?auto_683847 ?auto_683856 ) ) ( not ( = ?auto_683847 ?auto_683857 ) ) ( not ( = ?auto_683847 ?auto_683858 ) ) ( not ( = ?auto_683847 ?auto_683859 ) ) ( not ( = ?auto_683847 ?auto_683860 ) ) ( not ( = ?auto_683848 ?auto_683849 ) ) ( not ( = ?auto_683848 ?auto_683850 ) ) ( not ( = ?auto_683848 ?auto_683851 ) ) ( not ( = ?auto_683848 ?auto_683852 ) ) ( not ( = ?auto_683848 ?auto_683853 ) ) ( not ( = ?auto_683848 ?auto_683854 ) ) ( not ( = ?auto_683848 ?auto_683855 ) ) ( not ( = ?auto_683848 ?auto_683856 ) ) ( not ( = ?auto_683848 ?auto_683857 ) ) ( not ( = ?auto_683848 ?auto_683858 ) ) ( not ( = ?auto_683848 ?auto_683859 ) ) ( not ( = ?auto_683848 ?auto_683860 ) ) ( not ( = ?auto_683849 ?auto_683850 ) ) ( not ( = ?auto_683849 ?auto_683851 ) ) ( not ( = ?auto_683849 ?auto_683852 ) ) ( not ( = ?auto_683849 ?auto_683853 ) ) ( not ( = ?auto_683849 ?auto_683854 ) ) ( not ( = ?auto_683849 ?auto_683855 ) ) ( not ( = ?auto_683849 ?auto_683856 ) ) ( not ( = ?auto_683849 ?auto_683857 ) ) ( not ( = ?auto_683849 ?auto_683858 ) ) ( not ( = ?auto_683849 ?auto_683859 ) ) ( not ( = ?auto_683849 ?auto_683860 ) ) ( not ( = ?auto_683850 ?auto_683851 ) ) ( not ( = ?auto_683850 ?auto_683852 ) ) ( not ( = ?auto_683850 ?auto_683853 ) ) ( not ( = ?auto_683850 ?auto_683854 ) ) ( not ( = ?auto_683850 ?auto_683855 ) ) ( not ( = ?auto_683850 ?auto_683856 ) ) ( not ( = ?auto_683850 ?auto_683857 ) ) ( not ( = ?auto_683850 ?auto_683858 ) ) ( not ( = ?auto_683850 ?auto_683859 ) ) ( not ( = ?auto_683850 ?auto_683860 ) ) ( not ( = ?auto_683851 ?auto_683852 ) ) ( not ( = ?auto_683851 ?auto_683853 ) ) ( not ( = ?auto_683851 ?auto_683854 ) ) ( not ( = ?auto_683851 ?auto_683855 ) ) ( not ( = ?auto_683851 ?auto_683856 ) ) ( not ( = ?auto_683851 ?auto_683857 ) ) ( not ( = ?auto_683851 ?auto_683858 ) ) ( not ( = ?auto_683851 ?auto_683859 ) ) ( not ( = ?auto_683851 ?auto_683860 ) ) ( not ( = ?auto_683852 ?auto_683853 ) ) ( not ( = ?auto_683852 ?auto_683854 ) ) ( not ( = ?auto_683852 ?auto_683855 ) ) ( not ( = ?auto_683852 ?auto_683856 ) ) ( not ( = ?auto_683852 ?auto_683857 ) ) ( not ( = ?auto_683852 ?auto_683858 ) ) ( not ( = ?auto_683852 ?auto_683859 ) ) ( not ( = ?auto_683852 ?auto_683860 ) ) ( not ( = ?auto_683853 ?auto_683854 ) ) ( not ( = ?auto_683853 ?auto_683855 ) ) ( not ( = ?auto_683853 ?auto_683856 ) ) ( not ( = ?auto_683853 ?auto_683857 ) ) ( not ( = ?auto_683853 ?auto_683858 ) ) ( not ( = ?auto_683853 ?auto_683859 ) ) ( not ( = ?auto_683853 ?auto_683860 ) ) ( not ( = ?auto_683854 ?auto_683855 ) ) ( not ( = ?auto_683854 ?auto_683856 ) ) ( not ( = ?auto_683854 ?auto_683857 ) ) ( not ( = ?auto_683854 ?auto_683858 ) ) ( not ( = ?auto_683854 ?auto_683859 ) ) ( not ( = ?auto_683854 ?auto_683860 ) ) ( not ( = ?auto_683855 ?auto_683856 ) ) ( not ( = ?auto_683855 ?auto_683857 ) ) ( not ( = ?auto_683855 ?auto_683858 ) ) ( not ( = ?auto_683855 ?auto_683859 ) ) ( not ( = ?auto_683855 ?auto_683860 ) ) ( not ( = ?auto_683856 ?auto_683857 ) ) ( not ( = ?auto_683856 ?auto_683858 ) ) ( not ( = ?auto_683856 ?auto_683859 ) ) ( not ( = ?auto_683856 ?auto_683860 ) ) ( not ( = ?auto_683857 ?auto_683858 ) ) ( not ( = ?auto_683857 ?auto_683859 ) ) ( not ( = ?auto_683857 ?auto_683860 ) ) ( not ( = ?auto_683858 ?auto_683859 ) ) ( not ( = ?auto_683858 ?auto_683860 ) ) ( not ( = ?auto_683859 ?auto_683860 ) ) ( ON ?auto_683858 ?auto_683859 ) ( ON ?auto_683857 ?auto_683858 ) ( ON ?auto_683856 ?auto_683857 ) ( ON ?auto_683855 ?auto_683856 ) ( ON ?auto_683854 ?auto_683855 ) ( ON ?auto_683853 ?auto_683854 ) ( CLEAR ?auto_683851 ) ( ON ?auto_683852 ?auto_683853 ) ( CLEAR ?auto_683852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_683846 ?auto_683847 ?auto_683848 ?auto_683849 ?auto_683850 ?auto_683851 ?auto_683852 )
      ( MAKE-14PILE ?auto_683846 ?auto_683847 ?auto_683848 ?auto_683849 ?auto_683850 ?auto_683851 ?auto_683852 ?auto_683853 ?auto_683854 ?auto_683855 ?auto_683856 ?auto_683857 ?auto_683858 ?auto_683859 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_683904 - BLOCK
      ?auto_683905 - BLOCK
      ?auto_683906 - BLOCK
      ?auto_683907 - BLOCK
      ?auto_683908 - BLOCK
      ?auto_683909 - BLOCK
      ?auto_683910 - BLOCK
      ?auto_683911 - BLOCK
      ?auto_683912 - BLOCK
      ?auto_683913 - BLOCK
      ?auto_683914 - BLOCK
      ?auto_683915 - BLOCK
      ?auto_683916 - BLOCK
      ?auto_683917 - BLOCK
    )
    :vars
    (
      ?auto_683918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_683917 ?auto_683918 ) ( ON-TABLE ?auto_683904 ) ( ON ?auto_683905 ?auto_683904 ) ( ON ?auto_683906 ?auto_683905 ) ( ON ?auto_683907 ?auto_683906 ) ( ON ?auto_683908 ?auto_683907 ) ( not ( = ?auto_683904 ?auto_683905 ) ) ( not ( = ?auto_683904 ?auto_683906 ) ) ( not ( = ?auto_683904 ?auto_683907 ) ) ( not ( = ?auto_683904 ?auto_683908 ) ) ( not ( = ?auto_683904 ?auto_683909 ) ) ( not ( = ?auto_683904 ?auto_683910 ) ) ( not ( = ?auto_683904 ?auto_683911 ) ) ( not ( = ?auto_683904 ?auto_683912 ) ) ( not ( = ?auto_683904 ?auto_683913 ) ) ( not ( = ?auto_683904 ?auto_683914 ) ) ( not ( = ?auto_683904 ?auto_683915 ) ) ( not ( = ?auto_683904 ?auto_683916 ) ) ( not ( = ?auto_683904 ?auto_683917 ) ) ( not ( = ?auto_683904 ?auto_683918 ) ) ( not ( = ?auto_683905 ?auto_683906 ) ) ( not ( = ?auto_683905 ?auto_683907 ) ) ( not ( = ?auto_683905 ?auto_683908 ) ) ( not ( = ?auto_683905 ?auto_683909 ) ) ( not ( = ?auto_683905 ?auto_683910 ) ) ( not ( = ?auto_683905 ?auto_683911 ) ) ( not ( = ?auto_683905 ?auto_683912 ) ) ( not ( = ?auto_683905 ?auto_683913 ) ) ( not ( = ?auto_683905 ?auto_683914 ) ) ( not ( = ?auto_683905 ?auto_683915 ) ) ( not ( = ?auto_683905 ?auto_683916 ) ) ( not ( = ?auto_683905 ?auto_683917 ) ) ( not ( = ?auto_683905 ?auto_683918 ) ) ( not ( = ?auto_683906 ?auto_683907 ) ) ( not ( = ?auto_683906 ?auto_683908 ) ) ( not ( = ?auto_683906 ?auto_683909 ) ) ( not ( = ?auto_683906 ?auto_683910 ) ) ( not ( = ?auto_683906 ?auto_683911 ) ) ( not ( = ?auto_683906 ?auto_683912 ) ) ( not ( = ?auto_683906 ?auto_683913 ) ) ( not ( = ?auto_683906 ?auto_683914 ) ) ( not ( = ?auto_683906 ?auto_683915 ) ) ( not ( = ?auto_683906 ?auto_683916 ) ) ( not ( = ?auto_683906 ?auto_683917 ) ) ( not ( = ?auto_683906 ?auto_683918 ) ) ( not ( = ?auto_683907 ?auto_683908 ) ) ( not ( = ?auto_683907 ?auto_683909 ) ) ( not ( = ?auto_683907 ?auto_683910 ) ) ( not ( = ?auto_683907 ?auto_683911 ) ) ( not ( = ?auto_683907 ?auto_683912 ) ) ( not ( = ?auto_683907 ?auto_683913 ) ) ( not ( = ?auto_683907 ?auto_683914 ) ) ( not ( = ?auto_683907 ?auto_683915 ) ) ( not ( = ?auto_683907 ?auto_683916 ) ) ( not ( = ?auto_683907 ?auto_683917 ) ) ( not ( = ?auto_683907 ?auto_683918 ) ) ( not ( = ?auto_683908 ?auto_683909 ) ) ( not ( = ?auto_683908 ?auto_683910 ) ) ( not ( = ?auto_683908 ?auto_683911 ) ) ( not ( = ?auto_683908 ?auto_683912 ) ) ( not ( = ?auto_683908 ?auto_683913 ) ) ( not ( = ?auto_683908 ?auto_683914 ) ) ( not ( = ?auto_683908 ?auto_683915 ) ) ( not ( = ?auto_683908 ?auto_683916 ) ) ( not ( = ?auto_683908 ?auto_683917 ) ) ( not ( = ?auto_683908 ?auto_683918 ) ) ( not ( = ?auto_683909 ?auto_683910 ) ) ( not ( = ?auto_683909 ?auto_683911 ) ) ( not ( = ?auto_683909 ?auto_683912 ) ) ( not ( = ?auto_683909 ?auto_683913 ) ) ( not ( = ?auto_683909 ?auto_683914 ) ) ( not ( = ?auto_683909 ?auto_683915 ) ) ( not ( = ?auto_683909 ?auto_683916 ) ) ( not ( = ?auto_683909 ?auto_683917 ) ) ( not ( = ?auto_683909 ?auto_683918 ) ) ( not ( = ?auto_683910 ?auto_683911 ) ) ( not ( = ?auto_683910 ?auto_683912 ) ) ( not ( = ?auto_683910 ?auto_683913 ) ) ( not ( = ?auto_683910 ?auto_683914 ) ) ( not ( = ?auto_683910 ?auto_683915 ) ) ( not ( = ?auto_683910 ?auto_683916 ) ) ( not ( = ?auto_683910 ?auto_683917 ) ) ( not ( = ?auto_683910 ?auto_683918 ) ) ( not ( = ?auto_683911 ?auto_683912 ) ) ( not ( = ?auto_683911 ?auto_683913 ) ) ( not ( = ?auto_683911 ?auto_683914 ) ) ( not ( = ?auto_683911 ?auto_683915 ) ) ( not ( = ?auto_683911 ?auto_683916 ) ) ( not ( = ?auto_683911 ?auto_683917 ) ) ( not ( = ?auto_683911 ?auto_683918 ) ) ( not ( = ?auto_683912 ?auto_683913 ) ) ( not ( = ?auto_683912 ?auto_683914 ) ) ( not ( = ?auto_683912 ?auto_683915 ) ) ( not ( = ?auto_683912 ?auto_683916 ) ) ( not ( = ?auto_683912 ?auto_683917 ) ) ( not ( = ?auto_683912 ?auto_683918 ) ) ( not ( = ?auto_683913 ?auto_683914 ) ) ( not ( = ?auto_683913 ?auto_683915 ) ) ( not ( = ?auto_683913 ?auto_683916 ) ) ( not ( = ?auto_683913 ?auto_683917 ) ) ( not ( = ?auto_683913 ?auto_683918 ) ) ( not ( = ?auto_683914 ?auto_683915 ) ) ( not ( = ?auto_683914 ?auto_683916 ) ) ( not ( = ?auto_683914 ?auto_683917 ) ) ( not ( = ?auto_683914 ?auto_683918 ) ) ( not ( = ?auto_683915 ?auto_683916 ) ) ( not ( = ?auto_683915 ?auto_683917 ) ) ( not ( = ?auto_683915 ?auto_683918 ) ) ( not ( = ?auto_683916 ?auto_683917 ) ) ( not ( = ?auto_683916 ?auto_683918 ) ) ( not ( = ?auto_683917 ?auto_683918 ) ) ( ON ?auto_683916 ?auto_683917 ) ( ON ?auto_683915 ?auto_683916 ) ( ON ?auto_683914 ?auto_683915 ) ( ON ?auto_683913 ?auto_683914 ) ( ON ?auto_683912 ?auto_683913 ) ( ON ?auto_683911 ?auto_683912 ) ( ON ?auto_683910 ?auto_683911 ) ( CLEAR ?auto_683908 ) ( ON ?auto_683909 ?auto_683910 ) ( CLEAR ?auto_683909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_683904 ?auto_683905 ?auto_683906 ?auto_683907 ?auto_683908 ?auto_683909 )
      ( MAKE-14PILE ?auto_683904 ?auto_683905 ?auto_683906 ?auto_683907 ?auto_683908 ?auto_683909 ?auto_683910 ?auto_683911 ?auto_683912 ?auto_683913 ?auto_683914 ?auto_683915 ?auto_683916 ?auto_683917 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_683962 - BLOCK
      ?auto_683963 - BLOCK
      ?auto_683964 - BLOCK
      ?auto_683965 - BLOCK
      ?auto_683966 - BLOCK
      ?auto_683967 - BLOCK
      ?auto_683968 - BLOCK
      ?auto_683969 - BLOCK
      ?auto_683970 - BLOCK
      ?auto_683971 - BLOCK
      ?auto_683972 - BLOCK
      ?auto_683973 - BLOCK
      ?auto_683974 - BLOCK
      ?auto_683975 - BLOCK
    )
    :vars
    (
      ?auto_683976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_683975 ?auto_683976 ) ( ON-TABLE ?auto_683962 ) ( ON ?auto_683963 ?auto_683962 ) ( ON ?auto_683964 ?auto_683963 ) ( ON ?auto_683965 ?auto_683964 ) ( not ( = ?auto_683962 ?auto_683963 ) ) ( not ( = ?auto_683962 ?auto_683964 ) ) ( not ( = ?auto_683962 ?auto_683965 ) ) ( not ( = ?auto_683962 ?auto_683966 ) ) ( not ( = ?auto_683962 ?auto_683967 ) ) ( not ( = ?auto_683962 ?auto_683968 ) ) ( not ( = ?auto_683962 ?auto_683969 ) ) ( not ( = ?auto_683962 ?auto_683970 ) ) ( not ( = ?auto_683962 ?auto_683971 ) ) ( not ( = ?auto_683962 ?auto_683972 ) ) ( not ( = ?auto_683962 ?auto_683973 ) ) ( not ( = ?auto_683962 ?auto_683974 ) ) ( not ( = ?auto_683962 ?auto_683975 ) ) ( not ( = ?auto_683962 ?auto_683976 ) ) ( not ( = ?auto_683963 ?auto_683964 ) ) ( not ( = ?auto_683963 ?auto_683965 ) ) ( not ( = ?auto_683963 ?auto_683966 ) ) ( not ( = ?auto_683963 ?auto_683967 ) ) ( not ( = ?auto_683963 ?auto_683968 ) ) ( not ( = ?auto_683963 ?auto_683969 ) ) ( not ( = ?auto_683963 ?auto_683970 ) ) ( not ( = ?auto_683963 ?auto_683971 ) ) ( not ( = ?auto_683963 ?auto_683972 ) ) ( not ( = ?auto_683963 ?auto_683973 ) ) ( not ( = ?auto_683963 ?auto_683974 ) ) ( not ( = ?auto_683963 ?auto_683975 ) ) ( not ( = ?auto_683963 ?auto_683976 ) ) ( not ( = ?auto_683964 ?auto_683965 ) ) ( not ( = ?auto_683964 ?auto_683966 ) ) ( not ( = ?auto_683964 ?auto_683967 ) ) ( not ( = ?auto_683964 ?auto_683968 ) ) ( not ( = ?auto_683964 ?auto_683969 ) ) ( not ( = ?auto_683964 ?auto_683970 ) ) ( not ( = ?auto_683964 ?auto_683971 ) ) ( not ( = ?auto_683964 ?auto_683972 ) ) ( not ( = ?auto_683964 ?auto_683973 ) ) ( not ( = ?auto_683964 ?auto_683974 ) ) ( not ( = ?auto_683964 ?auto_683975 ) ) ( not ( = ?auto_683964 ?auto_683976 ) ) ( not ( = ?auto_683965 ?auto_683966 ) ) ( not ( = ?auto_683965 ?auto_683967 ) ) ( not ( = ?auto_683965 ?auto_683968 ) ) ( not ( = ?auto_683965 ?auto_683969 ) ) ( not ( = ?auto_683965 ?auto_683970 ) ) ( not ( = ?auto_683965 ?auto_683971 ) ) ( not ( = ?auto_683965 ?auto_683972 ) ) ( not ( = ?auto_683965 ?auto_683973 ) ) ( not ( = ?auto_683965 ?auto_683974 ) ) ( not ( = ?auto_683965 ?auto_683975 ) ) ( not ( = ?auto_683965 ?auto_683976 ) ) ( not ( = ?auto_683966 ?auto_683967 ) ) ( not ( = ?auto_683966 ?auto_683968 ) ) ( not ( = ?auto_683966 ?auto_683969 ) ) ( not ( = ?auto_683966 ?auto_683970 ) ) ( not ( = ?auto_683966 ?auto_683971 ) ) ( not ( = ?auto_683966 ?auto_683972 ) ) ( not ( = ?auto_683966 ?auto_683973 ) ) ( not ( = ?auto_683966 ?auto_683974 ) ) ( not ( = ?auto_683966 ?auto_683975 ) ) ( not ( = ?auto_683966 ?auto_683976 ) ) ( not ( = ?auto_683967 ?auto_683968 ) ) ( not ( = ?auto_683967 ?auto_683969 ) ) ( not ( = ?auto_683967 ?auto_683970 ) ) ( not ( = ?auto_683967 ?auto_683971 ) ) ( not ( = ?auto_683967 ?auto_683972 ) ) ( not ( = ?auto_683967 ?auto_683973 ) ) ( not ( = ?auto_683967 ?auto_683974 ) ) ( not ( = ?auto_683967 ?auto_683975 ) ) ( not ( = ?auto_683967 ?auto_683976 ) ) ( not ( = ?auto_683968 ?auto_683969 ) ) ( not ( = ?auto_683968 ?auto_683970 ) ) ( not ( = ?auto_683968 ?auto_683971 ) ) ( not ( = ?auto_683968 ?auto_683972 ) ) ( not ( = ?auto_683968 ?auto_683973 ) ) ( not ( = ?auto_683968 ?auto_683974 ) ) ( not ( = ?auto_683968 ?auto_683975 ) ) ( not ( = ?auto_683968 ?auto_683976 ) ) ( not ( = ?auto_683969 ?auto_683970 ) ) ( not ( = ?auto_683969 ?auto_683971 ) ) ( not ( = ?auto_683969 ?auto_683972 ) ) ( not ( = ?auto_683969 ?auto_683973 ) ) ( not ( = ?auto_683969 ?auto_683974 ) ) ( not ( = ?auto_683969 ?auto_683975 ) ) ( not ( = ?auto_683969 ?auto_683976 ) ) ( not ( = ?auto_683970 ?auto_683971 ) ) ( not ( = ?auto_683970 ?auto_683972 ) ) ( not ( = ?auto_683970 ?auto_683973 ) ) ( not ( = ?auto_683970 ?auto_683974 ) ) ( not ( = ?auto_683970 ?auto_683975 ) ) ( not ( = ?auto_683970 ?auto_683976 ) ) ( not ( = ?auto_683971 ?auto_683972 ) ) ( not ( = ?auto_683971 ?auto_683973 ) ) ( not ( = ?auto_683971 ?auto_683974 ) ) ( not ( = ?auto_683971 ?auto_683975 ) ) ( not ( = ?auto_683971 ?auto_683976 ) ) ( not ( = ?auto_683972 ?auto_683973 ) ) ( not ( = ?auto_683972 ?auto_683974 ) ) ( not ( = ?auto_683972 ?auto_683975 ) ) ( not ( = ?auto_683972 ?auto_683976 ) ) ( not ( = ?auto_683973 ?auto_683974 ) ) ( not ( = ?auto_683973 ?auto_683975 ) ) ( not ( = ?auto_683973 ?auto_683976 ) ) ( not ( = ?auto_683974 ?auto_683975 ) ) ( not ( = ?auto_683974 ?auto_683976 ) ) ( not ( = ?auto_683975 ?auto_683976 ) ) ( ON ?auto_683974 ?auto_683975 ) ( ON ?auto_683973 ?auto_683974 ) ( ON ?auto_683972 ?auto_683973 ) ( ON ?auto_683971 ?auto_683972 ) ( ON ?auto_683970 ?auto_683971 ) ( ON ?auto_683969 ?auto_683970 ) ( ON ?auto_683968 ?auto_683969 ) ( ON ?auto_683967 ?auto_683968 ) ( CLEAR ?auto_683965 ) ( ON ?auto_683966 ?auto_683967 ) ( CLEAR ?auto_683966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_683962 ?auto_683963 ?auto_683964 ?auto_683965 ?auto_683966 )
      ( MAKE-14PILE ?auto_683962 ?auto_683963 ?auto_683964 ?auto_683965 ?auto_683966 ?auto_683967 ?auto_683968 ?auto_683969 ?auto_683970 ?auto_683971 ?auto_683972 ?auto_683973 ?auto_683974 ?auto_683975 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_684020 - BLOCK
      ?auto_684021 - BLOCK
      ?auto_684022 - BLOCK
      ?auto_684023 - BLOCK
      ?auto_684024 - BLOCK
      ?auto_684025 - BLOCK
      ?auto_684026 - BLOCK
      ?auto_684027 - BLOCK
      ?auto_684028 - BLOCK
      ?auto_684029 - BLOCK
      ?auto_684030 - BLOCK
      ?auto_684031 - BLOCK
      ?auto_684032 - BLOCK
      ?auto_684033 - BLOCK
    )
    :vars
    (
      ?auto_684034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_684033 ?auto_684034 ) ( ON-TABLE ?auto_684020 ) ( ON ?auto_684021 ?auto_684020 ) ( ON ?auto_684022 ?auto_684021 ) ( not ( = ?auto_684020 ?auto_684021 ) ) ( not ( = ?auto_684020 ?auto_684022 ) ) ( not ( = ?auto_684020 ?auto_684023 ) ) ( not ( = ?auto_684020 ?auto_684024 ) ) ( not ( = ?auto_684020 ?auto_684025 ) ) ( not ( = ?auto_684020 ?auto_684026 ) ) ( not ( = ?auto_684020 ?auto_684027 ) ) ( not ( = ?auto_684020 ?auto_684028 ) ) ( not ( = ?auto_684020 ?auto_684029 ) ) ( not ( = ?auto_684020 ?auto_684030 ) ) ( not ( = ?auto_684020 ?auto_684031 ) ) ( not ( = ?auto_684020 ?auto_684032 ) ) ( not ( = ?auto_684020 ?auto_684033 ) ) ( not ( = ?auto_684020 ?auto_684034 ) ) ( not ( = ?auto_684021 ?auto_684022 ) ) ( not ( = ?auto_684021 ?auto_684023 ) ) ( not ( = ?auto_684021 ?auto_684024 ) ) ( not ( = ?auto_684021 ?auto_684025 ) ) ( not ( = ?auto_684021 ?auto_684026 ) ) ( not ( = ?auto_684021 ?auto_684027 ) ) ( not ( = ?auto_684021 ?auto_684028 ) ) ( not ( = ?auto_684021 ?auto_684029 ) ) ( not ( = ?auto_684021 ?auto_684030 ) ) ( not ( = ?auto_684021 ?auto_684031 ) ) ( not ( = ?auto_684021 ?auto_684032 ) ) ( not ( = ?auto_684021 ?auto_684033 ) ) ( not ( = ?auto_684021 ?auto_684034 ) ) ( not ( = ?auto_684022 ?auto_684023 ) ) ( not ( = ?auto_684022 ?auto_684024 ) ) ( not ( = ?auto_684022 ?auto_684025 ) ) ( not ( = ?auto_684022 ?auto_684026 ) ) ( not ( = ?auto_684022 ?auto_684027 ) ) ( not ( = ?auto_684022 ?auto_684028 ) ) ( not ( = ?auto_684022 ?auto_684029 ) ) ( not ( = ?auto_684022 ?auto_684030 ) ) ( not ( = ?auto_684022 ?auto_684031 ) ) ( not ( = ?auto_684022 ?auto_684032 ) ) ( not ( = ?auto_684022 ?auto_684033 ) ) ( not ( = ?auto_684022 ?auto_684034 ) ) ( not ( = ?auto_684023 ?auto_684024 ) ) ( not ( = ?auto_684023 ?auto_684025 ) ) ( not ( = ?auto_684023 ?auto_684026 ) ) ( not ( = ?auto_684023 ?auto_684027 ) ) ( not ( = ?auto_684023 ?auto_684028 ) ) ( not ( = ?auto_684023 ?auto_684029 ) ) ( not ( = ?auto_684023 ?auto_684030 ) ) ( not ( = ?auto_684023 ?auto_684031 ) ) ( not ( = ?auto_684023 ?auto_684032 ) ) ( not ( = ?auto_684023 ?auto_684033 ) ) ( not ( = ?auto_684023 ?auto_684034 ) ) ( not ( = ?auto_684024 ?auto_684025 ) ) ( not ( = ?auto_684024 ?auto_684026 ) ) ( not ( = ?auto_684024 ?auto_684027 ) ) ( not ( = ?auto_684024 ?auto_684028 ) ) ( not ( = ?auto_684024 ?auto_684029 ) ) ( not ( = ?auto_684024 ?auto_684030 ) ) ( not ( = ?auto_684024 ?auto_684031 ) ) ( not ( = ?auto_684024 ?auto_684032 ) ) ( not ( = ?auto_684024 ?auto_684033 ) ) ( not ( = ?auto_684024 ?auto_684034 ) ) ( not ( = ?auto_684025 ?auto_684026 ) ) ( not ( = ?auto_684025 ?auto_684027 ) ) ( not ( = ?auto_684025 ?auto_684028 ) ) ( not ( = ?auto_684025 ?auto_684029 ) ) ( not ( = ?auto_684025 ?auto_684030 ) ) ( not ( = ?auto_684025 ?auto_684031 ) ) ( not ( = ?auto_684025 ?auto_684032 ) ) ( not ( = ?auto_684025 ?auto_684033 ) ) ( not ( = ?auto_684025 ?auto_684034 ) ) ( not ( = ?auto_684026 ?auto_684027 ) ) ( not ( = ?auto_684026 ?auto_684028 ) ) ( not ( = ?auto_684026 ?auto_684029 ) ) ( not ( = ?auto_684026 ?auto_684030 ) ) ( not ( = ?auto_684026 ?auto_684031 ) ) ( not ( = ?auto_684026 ?auto_684032 ) ) ( not ( = ?auto_684026 ?auto_684033 ) ) ( not ( = ?auto_684026 ?auto_684034 ) ) ( not ( = ?auto_684027 ?auto_684028 ) ) ( not ( = ?auto_684027 ?auto_684029 ) ) ( not ( = ?auto_684027 ?auto_684030 ) ) ( not ( = ?auto_684027 ?auto_684031 ) ) ( not ( = ?auto_684027 ?auto_684032 ) ) ( not ( = ?auto_684027 ?auto_684033 ) ) ( not ( = ?auto_684027 ?auto_684034 ) ) ( not ( = ?auto_684028 ?auto_684029 ) ) ( not ( = ?auto_684028 ?auto_684030 ) ) ( not ( = ?auto_684028 ?auto_684031 ) ) ( not ( = ?auto_684028 ?auto_684032 ) ) ( not ( = ?auto_684028 ?auto_684033 ) ) ( not ( = ?auto_684028 ?auto_684034 ) ) ( not ( = ?auto_684029 ?auto_684030 ) ) ( not ( = ?auto_684029 ?auto_684031 ) ) ( not ( = ?auto_684029 ?auto_684032 ) ) ( not ( = ?auto_684029 ?auto_684033 ) ) ( not ( = ?auto_684029 ?auto_684034 ) ) ( not ( = ?auto_684030 ?auto_684031 ) ) ( not ( = ?auto_684030 ?auto_684032 ) ) ( not ( = ?auto_684030 ?auto_684033 ) ) ( not ( = ?auto_684030 ?auto_684034 ) ) ( not ( = ?auto_684031 ?auto_684032 ) ) ( not ( = ?auto_684031 ?auto_684033 ) ) ( not ( = ?auto_684031 ?auto_684034 ) ) ( not ( = ?auto_684032 ?auto_684033 ) ) ( not ( = ?auto_684032 ?auto_684034 ) ) ( not ( = ?auto_684033 ?auto_684034 ) ) ( ON ?auto_684032 ?auto_684033 ) ( ON ?auto_684031 ?auto_684032 ) ( ON ?auto_684030 ?auto_684031 ) ( ON ?auto_684029 ?auto_684030 ) ( ON ?auto_684028 ?auto_684029 ) ( ON ?auto_684027 ?auto_684028 ) ( ON ?auto_684026 ?auto_684027 ) ( ON ?auto_684025 ?auto_684026 ) ( ON ?auto_684024 ?auto_684025 ) ( CLEAR ?auto_684022 ) ( ON ?auto_684023 ?auto_684024 ) ( CLEAR ?auto_684023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_684020 ?auto_684021 ?auto_684022 ?auto_684023 )
      ( MAKE-14PILE ?auto_684020 ?auto_684021 ?auto_684022 ?auto_684023 ?auto_684024 ?auto_684025 ?auto_684026 ?auto_684027 ?auto_684028 ?auto_684029 ?auto_684030 ?auto_684031 ?auto_684032 ?auto_684033 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_684078 - BLOCK
      ?auto_684079 - BLOCK
      ?auto_684080 - BLOCK
      ?auto_684081 - BLOCK
      ?auto_684082 - BLOCK
      ?auto_684083 - BLOCK
      ?auto_684084 - BLOCK
      ?auto_684085 - BLOCK
      ?auto_684086 - BLOCK
      ?auto_684087 - BLOCK
      ?auto_684088 - BLOCK
      ?auto_684089 - BLOCK
      ?auto_684090 - BLOCK
      ?auto_684091 - BLOCK
    )
    :vars
    (
      ?auto_684092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_684091 ?auto_684092 ) ( ON-TABLE ?auto_684078 ) ( ON ?auto_684079 ?auto_684078 ) ( not ( = ?auto_684078 ?auto_684079 ) ) ( not ( = ?auto_684078 ?auto_684080 ) ) ( not ( = ?auto_684078 ?auto_684081 ) ) ( not ( = ?auto_684078 ?auto_684082 ) ) ( not ( = ?auto_684078 ?auto_684083 ) ) ( not ( = ?auto_684078 ?auto_684084 ) ) ( not ( = ?auto_684078 ?auto_684085 ) ) ( not ( = ?auto_684078 ?auto_684086 ) ) ( not ( = ?auto_684078 ?auto_684087 ) ) ( not ( = ?auto_684078 ?auto_684088 ) ) ( not ( = ?auto_684078 ?auto_684089 ) ) ( not ( = ?auto_684078 ?auto_684090 ) ) ( not ( = ?auto_684078 ?auto_684091 ) ) ( not ( = ?auto_684078 ?auto_684092 ) ) ( not ( = ?auto_684079 ?auto_684080 ) ) ( not ( = ?auto_684079 ?auto_684081 ) ) ( not ( = ?auto_684079 ?auto_684082 ) ) ( not ( = ?auto_684079 ?auto_684083 ) ) ( not ( = ?auto_684079 ?auto_684084 ) ) ( not ( = ?auto_684079 ?auto_684085 ) ) ( not ( = ?auto_684079 ?auto_684086 ) ) ( not ( = ?auto_684079 ?auto_684087 ) ) ( not ( = ?auto_684079 ?auto_684088 ) ) ( not ( = ?auto_684079 ?auto_684089 ) ) ( not ( = ?auto_684079 ?auto_684090 ) ) ( not ( = ?auto_684079 ?auto_684091 ) ) ( not ( = ?auto_684079 ?auto_684092 ) ) ( not ( = ?auto_684080 ?auto_684081 ) ) ( not ( = ?auto_684080 ?auto_684082 ) ) ( not ( = ?auto_684080 ?auto_684083 ) ) ( not ( = ?auto_684080 ?auto_684084 ) ) ( not ( = ?auto_684080 ?auto_684085 ) ) ( not ( = ?auto_684080 ?auto_684086 ) ) ( not ( = ?auto_684080 ?auto_684087 ) ) ( not ( = ?auto_684080 ?auto_684088 ) ) ( not ( = ?auto_684080 ?auto_684089 ) ) ( not ( = ?auto_684080 ?auto_684090 ) ) ( not ( = ?auto_684080 ?auto_684091 ) ) ( not ( = ?auto_684080 ?auto_684092 ) ) ( not ( = ?auto_684081 ?auto_684082 ) ) ( not ( = ?auto_684081 ?auto_684083 ) ) ( not ( = ?auto_684081 ?auto_684084 ) ) ( not ( = ?auto_684081 ?auto_684085 ) ) ( not ( = ?auto_684081 ?auto_684086 ) ) ( not ( = ?auto_684081 ?auto_684087 ) ) ( not ( = ?auto_684081 ?auto_684088 ) ) ( not ( = ?auto_684081 ?auto_684089 ) ) ( not ( = ?auto_684081 ?auto_684090 ) ) ( not ( = ?auto_684081 ?auto_684091 ) ) ( not ( = ?auto_684081 ?auto_684092 ) ) ( not ( = ?auto_684082 ?auto_684083 ) ) ( not ( = ?auto_684082 ?auto_684084 ) ) ( not ( = ?auto_684082 ?auto_684085 ) ) ( not ( = ?auto_684082 ?auto_684086 ) ) ( not ( = ?auto_684082 ?auto_684087 ) ) ( not ( = ?auto_684082 ?auto_684088 ) ) ( not ( = ?auto_684082 ?auto_684089 ) ) ( not ( = ?auto_684082 ?auto_684090 ) ) ( not ( = ?auto_684082 ?auto_684091 ) ) ( not ( = ?auto_684082 ?auto_684092 ) ) ( not ( = ?auto_684083 ?auto_684084 ) ) ( not ( = ?auto_684083 ?auto_684085 ) ) ( not ( = ?auto_684083 ?auto_684086 ) ) ( not ( = ?auto_684083 ?auto_684087 ) ) ( not ( = ?auto_684083 ?auto_684088 ) ) ( not ( = ?auto_684083 ?auto_684089 ) ) ( not ( = ?auto_684083 ?auto_684090 ) ) ( not ( = ?auto_684083 ?auto_684091 ) ) ( not ( = ?auto_684083 ?auto_684092 ) ) ( not ( = ?auto_684084 ?auto_684085 ) ) ( not ( = ?auto_684084 ?auto_684086 ) ) ( not ( = ?auto_684084 ?auto_684087 ) ) ( not ( = ?auto_684084 ?auto_684088 ) ) ( not ( = ?auto_684084 ?auto_684089 ) ) ( not ( = ?auto_684084 ?auto_684090 ) ) ( not ( = ?auto_684084 ?auto_684091 ) ) ( not ( = ?auto_684084 ?auto_684092 ) ) ( not ( = ?auto_684085 ?auto_684086 ) ) ( not ( = ?auto_684085 ?auto_684087 ) ) ( not ( = ?auto_684085 ?auto_684088 ) ) ( not ( = ?auto_684085 ?auto_684089 ) ) ( not ( = ?auto_684085 ?auto_684090 ) ) ( not ( = ?auto_684085 ?auto_684091 ) ) ( not ( = ?auto_684085 ?auto_684092 ) ) ( not ( = ?auto_684086 ?auto_684087 ) ) ( not ( = ?auto_684086 ?auto_684088 ) ) ( not ( = ?auto_684086 ?auto_684089 ) ) ( not ( = ?auto_684086 ?auto_684090 ) ) ( not ( = ?auto_684086 ?auto_684091 ) ) ( not ( = ?auto_684086 ?auto_684092 ) ) ( not ( = ?auto_684087 ?auto_684088 ) ) ( not ( = ?auto_684087 ?auto_684089 ) ) ( not ( = ?auto_684087 ?auto_684090 ) ) ( not ( = ?auto_684087 ?auto_684091 ) ) ( not ( = ?auto_684087 ?auto_684092 ) ) ( not ( = ?auto_684088 ?auto_684089 ) ) ( not ( = ?auto_684088 ?auto_684090 ) ) ( not ( = ?auto_684088 ?auto_684091 ) ) ( not ( = ?auto_684088 ?auto_684092 ) ) ( not ( = ?auto_684089 ?auto_684090 ) ) ( not ( = ?auto_684089 ?auto_684091 ) ) ( not ( = ?auto_684089 ?auto_684092 ) ) ( not ( = ?auto_684090 ?auto_684091 ) ) ( not ( = ?auto_684090 ?auto_684092 ) ) ( not ( = ?auto_684091 ?auto_684092 ) ) ( ON ?auto_684090 ?auto_684091 ) ( ON ?auto_684089 ?auto_684090 ) ( ON ?auto_684088 ?auto_684089 ) ( ON ?auto_684087 ?auto_684088 ) ( ON ?auto_684086 ?auto_684087 ) ( ON ?auto_684085 ?auto_684086 ) ( ON ?auto_684084 ?auto_684085 ) ( ON ?auto_684083 ?auto_684084 ) ( ON ?auto_684082 ?auto_684083 ) ( ON ?auto_684081 ?auto_684082 ) ( CLEAR ?auto_684079 ) ( ON ?auto_684080 ?auto_684081 ) ( CLEAR ?auto_684080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_684078 ?auto_684079 ?auto_684080 )
      ( MAKE-14PILE ?auto_684078 ?auto_684079 ?auto_684080 ?auto_684081 ?auto_684082 ?auto_684083 ?auto_684084 ?auto_684085 ?auto_684086 ?auto_684087 ?auto_684088 ?auto_684089 ?auto_684090 ?auto_684091 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_684136 - BLOCK
      ?auto_684137 - BLOCK
      ?auto_684138 - BLOCK
      ?auto_684139 - BLOCK
      ?auto_684140 - BLOCK
      ?auto_684141 - BLOCK
      ?auto_684142 - BLOCK
      ?auto_684143 - BLOCK
      ?auto_684144 - BLOCK
      ?auto_684145 - BLOCK
      ?auto_684146 - BLOCK
      ?auto_684147 - BLOCK
      ?auto_684148 - BLOCK
      ?auto_684149 - BLOCK
    )
    :vars
    (
      ?auto_684150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_684149 ?auto_684150 ) ( ON-TABLE ?auto_684136 ) ( not ( = ?auto_684136 ?auto_684137 ) ) ( not ( = ?auto_684136 ?auto_684138 ) ) ( not ( = ?auto_684136 ?auto_684139 ) ) ( not ( = ?auto_684136 ?auto_684140 ) ) ( not ( = ?auto_684136 ?auto_684141 ) ) ( not ( = ?auto_684136 ?auto_684142 ) ) ( not ( = ?auto_684136 ?auto_684143 ) ) ( not ( = ?auto_684136 ?auto_684144 ) ) ( not ( = ?auto_684136 ?auto_684145 ) ) ( not ( = ?auto_684136 ?auto_684146 ) ) ( not ( = ?auto_684136 ?auto_684147 ) ) ( not ( = ?auto_684136 ?auto_684148 ) ) ( not ( = ?auto_684136 ?auto_684149 ) ) ( not ( = ?auto_684136 ?auto_684150 ) ) ( not ( = ?auto_684137 ?auto_684138 ) ) ( not ( = ?auto_684137 ?auto_684139 ) ) ( not ( = ?auto_684137 ?auto_684140 ) ) ( not ( = ?auto_684137 ?auto_684141 ) ) ( not ( = ?auto_684137 ?auto_684142 ) ) ( not ( = ?auto_684137 ?auto_684143 ) ) ( not ( = ?auto_684137 ?auto_684144 ) ) ( not ( = ?auto_684137 ?auto_684145 ) ) ( not ( = ?auto_684137 ?auto_684146 ) ) ( not ( = ?auto_684137 ?auto_684147 ) ) ( not ( = ?auto_684137 ?auto_684148 ) ) ( not ( = ?auto_684137 ?auto_684149 ) ) ( not ( = ?auto_684137 ?auto_684150 ) ) ( not ( = ?auto_684138 ?auto_684139 ) ) ( not ( = ?auto_684138 ?auto_684140 ) ) ( not ( = ?auto_684138 ?auto_684141 ) ) ( not ( = ?auto_684138 ?auto_684142 ) ) ( not ( = ?auto_684138 ?auto_684143 ) ) ( not ( = ?auto_684138 ?auto_684144 ) ) ( not ( = ?auto_684138 ?auto_684145 ) ) ( not ( = ?auto_684138 ?auto_684146 ) ) ( not ( = ?auto_684138 ?auto_684147 ) ) ( not ( = ?auto_684138 ?auto_684148 ) ) ( not ( = ?auto_684138 ?auto_684149 ) ) ( not ( = ?auto_684138 ?auto_684150 ) ) ( not ( = ?auto_684139 ?auto_684140 ) ) ( not ( = ?auto_684139 ?auto_684141 ) ) ( not ( = ?auto_684139 ?auto_684142 ) ) ( not ( = ?auto_684139 ?auto_684143 ) ) ( not ( = ?auto_684139 ?auto_684144 ) ) ( not ( = ?auto_684139 ?auto_684145 ) ) ( not ( = ?auto_684139 ?auto_684146 ) ) ( not ( = ?auto_684139 ?auto_684147 ) ) ( not ( = ?auto_684139 ?auto_684148 ) ) ( not ( = ?auto_684139 ?auto_684149 ) ) ( not ( = ?auto_684139 ?auto_684150 ) ) ( not ( = ?auto_684140 ?auto_684141 ) ) ( not ( = ?auto_684140 ?auto_684142 ) ) ( not ( = ?auto_684140 ?auto_684143 ) ) ( not ( = ?auto_684140 ?auto_684144 ) ) ( not ( = ?auto_684140 ?auto_684145 ) ) ( not ( = ?auto_684140 ?auto_684146 ) ) ( not ( = ?auto_684140 ?auto_684147 ) ) ( not ( = ?auto_684140 ?auto_684148 ) ) ( not ( = ?auto_684140 ?auto_684149 ) ) ( not ( = ?auto_684140 ?auto_684150 ) ) ( not ( = ?auto_684141 ?auto_684142 ) ) ( not ( = ?auto_684141 ?auto_684143 ) ) ( not ( = ?auto_684141 ?auto_684144 ) ) ( not ( = ?auto_684141 ?auto_684145 ) ) ( not ( = ?auto_684141 ?auto_684146 ) ) ( not ( = ?auto_684141 ?auto_684147 ) ) ( not ( = ?auto_684141 ?auto_684148 ) ) ( not ( = ?auto_684141 ?auto_684149 ) ) ( not ( = ?auto_684141 ?auto_684150 ) ) ( not ( = ?auto_684142 ?auto_684143 ) ) ( not ( = ?auto_684142 ?auto_684144 ) ) ( not ( = ?auto_684142 ?auto_684145 ) ) ( not ( = ?auto_684142 ?auto_684146 ) ) ( not ( = ?auto_684142 ?auto_684147 ) ) ( not ( = ?auto_684142 ?auto_684148 ) ) ( not ( = ?auto_684142 ?auto_684149 ) ) ( not ( = ?auto_684142 ?auto_684150 ) ) ( not ( = ?auto_684143 ?auto_684144 ) ) ( not ( = ?auto_684143 ?auto_684145 ) ) ( not ( = ?auto_684143 ?auto_684146 ) ) ( not ( = ?auto_684143 ?auto_684147 ) ) ( not ( = ?auto_684143 ?auto_684148 ) ) ( not ( = ?auto_684143 ?auto_684149 ) ) ( not ( = ?auto_684143 ?auto_684150 ) ) ( not ( = ?auto_684144 ?auto_684145 ) ) ( not ( = ?auto_684144 ?auto_684146 ) ) ( not ( = ?auto_684144 ?auto_684147 ) ) ( not ( = ?auto_684144 ?auto_684148 ) ) ( not ( = ?auto_684144 ?auto_684149 ) ) ( not ( = ?auto_684144 ?auto_684150 ) ) ( not ( = ?auto_684145 ?auto_684146 ) ) ( not ( = ?auto_684145 ?auto_684147 ) ) ( not ( = ?auto_684145 ?auto_684148 ) ) ( not ( = ?auto_684145 ?auto_684149 ) ) ( not ( = ?auto_684145 ?auto_684150 ) ) ( not ( = ?auto_684146 ?auto_684147 ) ) ( not ( = ?auto_684146 ?auto_684148 ) ) ( not ( = ?auto_684146 ?auto_684149 ) ) ( not ( = ?auto_684146 ?auto_684150 ) ) ( not ( = ?auto_684147 ?auto_684148 ) ) ( not ( = ?auto_684147 ?auto_684149 ) ) ( not ( = ?auto_684147 ?auto_684150 ) ) ( not ( = ?auto_684148 ?auto_684149 ) ) ( not ( = ?auto_684148 ?auto_684150 ) ) ( not ( = ?auto_684149 ?auto_684150 ) ) ( ON ?auto_684148 ?auto_684149 ) ( ON ?auto_684147 ?auto_684148 ) ( ON ?auto_684146 ?auto_684147 ) ( ON ?auto_684145 ?auto_684146 ) ( ON ?auto_684144 ?auto_684145 ) ( ON ?auto_684143 ?auto_684144 ) ( ON ?auto_684142 ?auto_684143 ) ( ON ?auto_684141 ?auto_684142 ) ( ON ?auto_684140 ?auto_684141 ) ( ON ?auto_684139 ?auto_684140 ) ( ON ?auto_684138 ?auto_684139 ) ( CLEAR ?auto_684136 ) ( ON ?auto_684137 ?auto_684138 ) ( CLEAR ?auto_684137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_684136 ?auto_684137 )
      ( MAKE-14PILE ?auto_684136 ?auto_684137 ?auto_684138 ?auto_684139 ?auto_684140 ?auto_684141 ?auto_684142 ?auto_684143 ?auto_684144 ?auto_684145 ?auto_684146 ?auto_684147 ?auto_684148 ?auto_684149 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_684194 - BLOCK
      ?auto_684195 - BLOCK
      ?auto_684196 - BLOCK
      ?auto_684197 - BLOCK
      ?auto_684198 - BLOCK
      ?auto_684199 - BLOCK
      ?auto_684200 - BLOCK
      ?auto_684201 - BLOCK
      ?auto_684202 - BLOCK
      ?auto_684203 - BLOCK
      ?auto_684204 - BLOCK
      ?auto_684205 - BLOCK
      ?auto_684206 - BLOCK
      ?auto_684207 - BLOCK
    )
    :vars
    (
      ?auto_684208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_684207 ?auto_684208 ) ( not ( = ?auto_684194 ?auto_684195 ) ) ( not ( = ?auto_684194 ?auto_684196 ) ) ( not ( = ?auto_684194 ?auto_684197 ) ) ( not ( = ?auto_684194 ?auto_684198 ) ) ( not ( = ?auto_684194 ?auto_684199 ) ) ( not ( = ?auto_684194 ?auto_684200 ) ) ( not ( = ?auto_684194 ?auto_684201 ) ) ( not ( = ?auto_684194 ?auto_684202 ) ) ( not ( = ?auto_684194 ?auto_684203 ) ) ( not ( = ?auto_684194 ?auto_684204 ) ) ( not ( = ?auto_684194 ?auto_684205 ) ) ( not ( = ?auto_684194 ?auto_684206 ) ) ( not ( = ?auto_684194 ?auto_684207 ) ) ( not ( = ?auto_684194 ?auto_684208 ) ) ( not ( = ?auto_684195 ?auto_684196 ) ) ( not ( = ?auto_684195 ?auto_684197 ) ) ( not ( = ?auto_684195 ?auto_684198 ) ) ( not ( = ?auto_684195 ?auto_684199 ) ) ( not ( = ?auto_684195 ?auto_684200 ) ) ( not ( = ?auto_684195 ?auto_684201 ) ) ( not ( = ?auto_684195 ?auto_684202 ) ) ( not ( = ?auto_684195 ?auto_684203 ) ) ( not ( = ?auto_684195 ?auto_684204 ) ) ( not ( = ?auto_684195 ?auto_684205 ) ) ( not ( = ?auto_684195 ?auto_684206 ) ) ( not ( = ?auto_684195 ?auto_684207 ) ) ( not ( = ?auto_684195 ?auto_684208 ) ) ( not ( = ?auto_684196 ?auto_684197 ) ) ( not ( = ?auto_684196 ?auto_684198 ) ) ( not ( = ?auto_684196 ?auto_684199 ) ) ( not ( = ?auto_684196 ?auto_684200 ) ) ( not ( = ?auto_684196 ?auto_684201 ) ) ( not ( = ?auto_684196 ?auto_684202 ) ) ( not ( = ?auto_684196 ?auto_684203 ) ) ( not ( = ?auto_684196 ?auto_684204 ) ) ( not ( = ?auto_684196 ?auto_684205 ) ) ( not ( = ?auto_684196 ?auto_684206 ) ) ( not ( = ?auto_684196 ?auto_684207 ) ) ( not ( = ?auto_684196 ?auto_684208 ) ) ( not ( = ?auto_684197 ?auto_684198 ) ) ( not ( = ?auto_684197 ?auto_684199 ) ) ( not ( = ?auto_684197 ?auto_684200 ) ) ( not ( = ?auto_684197 ?auto_684201 ) ) ( not ( = ?auto_684197 ?auto_684202 ) ) ( not ( = ?auto_684197 ?auto_684203 ) ) ( not ( = ?auto_684197 ?auto_684204 ) ) ( not ( = ?auto_684197 ?auto_684205 ) ) ( not ( = ?auto_684197 ?auto_684206 ) ) ( not ( = ?auto_684197 ?auto_684207 ) ) ( not ( = ?auto_684197 ?auto_684208 ) ) ( not ( = ?auto_684198 ?auto_684199 ) ) ( not ( = ?auto_684198 ?auto_684200 ) ) ( not ( = ?auto_684198 ?auto_684201 ) ) ( not ( = ?auto_684198 ?auto_684202 ) ) ( not ( = ?auto_684198 ?auto_684203 ) ) ( not ( = ?auto_684198 ?auto_684204 ) ) ( not ( = ?auto_684198 ?auto_684205 ) ) ( not ( = ?auto_684198 ?auto_684206 ) ) ( not ( = ?auto_684198 ?auto_684207 ) ) ( not ( = ?auto_684198 ?auto_684208 ) ) ( not ( = ?auto_684199 ?auto_684200 ) ) ( not ( = ?auto_684199 ?auto_684201 ) ) ( not ( = ?auto_684199 ?auto_684202 ) ) ( not ( = ?auto_684199 ?auto_684203 ) ) ( not ( = ?auto_684199 ?auto_684204 ) ) ( not ( = ?auto_684199 ?auto_684205 ) ) ( not ( = ?auto_684199 ?auto_684206 ) ) ( not ( = ?auto_684199 ?auto_684207 ) ) ( not ( = ?auto_684199 ?auto_684208 ) ) ( not ( = ?auto_684200 ?auto_684201 ) ) ( not ( = ?auto_684200 ?auto_684202 ) ) ( not ( = ?auto_684200 ?auto_684203 ) ) ( not ( = ?auto_684200 ?auto_684204 ) ) ( not ( = ?auto_684200 ?auto_684205 ) ) ( not ( = ?auto_684200 ?auto_684206 ) ) ( not ( = ?auto_684200 ?auto_684207 ) ) ( not ( = ?auto_684200 ?auto_684208 ) ) ( not ( = ?auto_684201 ?auto_684202 ) ) ( not ( = ?auto_684201 ?auto_684203 ) ) ( not ( = ?auto_684201 ?auto_684204 ) ) ( not ( = ?auto_684201 ?auto_684205 ) ) ( not ( = ?auto_684201 ?auto_684206 ) ) ( not ( = ?auto_684201 ?auto_684207 ) ) ( not ( = ?auto_684201 ?auto_684208 ) ) ( not ( = ?auto_684202 ?auto_684203 ) ) ( not ( = ?auto_684202 ?auto_684204 ) ) ( not ( = ?auto_684202 ?auto_684205 ) ) ( not ( = ?auto_684202 ?auto_684206 ) ) ( not ( = ?auto_684202 ?auto_684207 ) ) ( not ( = ?auto_684202 ?auto_684208 ) ) ( not ( = ?auto_684203 ?auto_684204 ) ) ( not ( = ?auto_684203 ?auto_684205 ) ) ( not ( = ?auto_684203 ?auto_684206 ) ) ( not ( = ?auto_684203 ?auto_684207 ) ) ( not ( = ?auto_684203 ?auto_684208 ) ) ( not ( = ?auto_684204 ?auto_684205 ) ) ( not ( = ?auto_684204 ?auto_684206 ) ) ( not ( = ?auto_684204 ?auto_684207 ) ) ( not ( = ?auto_684204 ?auto_684208 ) ) ( not ( = ?auto_684205 ?auto_684206 ) ) ( not ( = ?auto_684205 ?auto_684207 ) ) ( not ( = ?auto_684205 ?auto_684208 ) ) ( not ( = ?auto_684206 ?auto_684207 ) ) ( not ( = ?auto_684206 ?auto_684208 ) ) ( not ( = ?auto_684207 ?auto_684208 ) ) ( ON ?auto_684206 ?auto_684207 ) ( ON ?auto_684205 ?auto_684206 ) ( ON ?auto_684204 ?auto_684205 ) ( ON ?auto_684203 ?auto_684204 ) ( ON ?auto_684202 ?auto_684203 ) ( ON ?auto_684201 ?auto_684202 ) ( ON ?auto_684200 ?auto_684201 ) ( ON ?auto_684199 ?auto_684200 ) ( ON ?auto_684198 ?auto_684199 ) ( ON ?auto_684197 ?auto_684198 ) ( ON ?auto_684196 ?auto_684197 ) ( ON ?auto_684195 ?auto_684196 ) ( ON ?auto_684194 ?auto_684195 ) ( CLEAR ?auto_684194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_684194 )
      ( MAKE-14PILE ?auto_684194 ?auto_684195 ?auto_684196 ?auto_684197 ?auto_684198 ?auto_684199 ?auto_684200 ?auto_684201 ?auto_684202 ?auto_684203 ?auto_684204 ?auto_684205 ?auto_684206 ?auto_684207 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_684253 - BLOCK
      ?auto_684254 - BLOCK
      ?auto_684255 - BLOCK
      ?auto_684256 - BLOCK
      ?auto_684257 - BLOCK
      ?auto_684258 - BLOCK
      ?auto_684259 - BLOCK
      ?auto_684260 - BLOCK
      ?auto_684261 - BLOCK
      ?auto_684262 - BLOCK
      ?auto_684263 - BLOCK
      ?auto_684264 - BLOCK
      ?auto_684265 - BLOCK
      ?auto_684266 - BLOCK
      ?auto_684267 - BLOCK
    )
    :vars
    (
      ?auto_684268 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_684266 ) ( ON ?auto_684267 ?auto_684268 ) ( CLEAR ?auto_684267 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_684253 ) ( ON ?auto_684254 ?auto_684253 ) ( ON ?auto_684255 ?auto_684254 ) ( ON ?auto_684256 ?auto_684255 ) ( ON ?auto_684257 ?auto_684256 ) ( ON ?auto_684258 ?auto_684257 ) ( ON ?auto_684259 ?auto_684258 ) ( ON ?auto_684260 ?auto_684259 ) ( ON ?auto_684261 ?auto_684260 ) ( ON ?auto_684262 ?auto_684261 ) ( ON ?auto_684263 ?auto_684262 ) ( ON ?auto_684264 ?auto_684263 ) ( ON ?auto_684265 ?auto_684264 ) ( ON ?auto_684266 ?auto_684265 ) ( not ( = ?auto_684253 ?auto_684254 ) ) ( not ( = ?auto_684253 ?auto_684255 ) ) ( not ( = ?auto_684253 ?auto_684256 ) ) ( not ( = ?auto_684253 ?auto_684257 ) ) ( not ( = ?auto_684253 ?auto_684258 ) ) ( not ( = ?auto_684253 ?auto_684259 ) ) ( not ( = ?auto_684253 ?auto_684260 ) ) ( not ( = ?auto_684253 ?auto_684261 ) ) ( not ( = ?auto_684253 ?auto_684262 ) ) ( not ( = ?auto_684253 ?auto_684263 ) ) ( not ( = ?auto_684253 ?auto_684264 ) ) ( not ( = ?auto_684253 ?auto_684265 ) ) ( not ( = ?auto_684253 ?auto_684266 ) ) ( not ( = ?auto_684253 ?auto_684267 ) ) ( not ( = ?auto_684253 ?auto_684268 ) ) ( not ( = ?auto_684254 ?auto_684255 ) ) ( not ( = ?auto_684254 ?auto_684256 ) ) ( not ( = ?auto_684254 ?auto_684257 ) ) ( not ( = ?auto_684254 ?auto_684258 ) ) ( not ( = ?auto_684254 ?auto_684259 ) ) ( not ( = ?auto_684254 ?auto_684260 ) ) ( not ( = ?auto_684254 ?auto_684261 ) ) ( not ( = ?auto_684254 ?auto_684262 ) ) ( not ( = ?auto_684254 ?auto_684263 ) ) ( not ( = ?auto_684254 ?auto_684264 ) ) ( not ( = ?auto_684254 ?auto_684265 ) ) ( not ( = ?auto_684254 ?auto_684266 ) ) ( not ( = ?auto_684254 ?auto_684267 ) ) ( not ( = ?auto_684254 ?auto_684268 ) ) ( not ( = ?auto_684255 ?auto_684256 ) ) ( not ( = ?auto_684255 ?auto_684257 ) ) ( not ( = ?auto_684255 ?auto_684258 ) ) ( not ( = ?auto_684255 ?auto_684259 ) ) ( not ( = ?auto_684255 ?auto_684260 ) ) ( not ( = ?auto_684255 ?auto_684261 ) ) ( not ( = ?auto_684255 ?auto_684262 ) ) ( not ( = ?auto_684255 ?auto_684263 ) ) ( not ( = ?auto_684255 ?auto_684264 ) ) ( not ( = ?auto_684255 ?auto_684265 ) ) ( not ( = ?auto_684255 ?auto_684266 ) ) ( not ( = ?auto_684255 ?auto_684267 ) ) ( not ( = ?auto_684255 ?auto_684268 ) ) ( not ( = ?auto_684256 ?auto_684257 ) ) ( not ( = ?auto_684256 ?auto_684258 ) ) ( not ( = ?auto_684256 ?auto_684259 ) ) ( not ( = ?auto_684256 ?auto_684260 ) ) ( not ( = ?auto_684256 ?auto_684261 ) ) ( not ( = ?auto_684256 ?auto_684262 ) ) ( not ( = ?auto_684256 ?auto_684263 ) ) ( not ( = ?auto_684256 ?auto_684264 ) ) ( not ( = ?auto_684256 ?auto_684265 ) ) ( not ( = ?auto_684256 ?auto_684266 ) ) ( not ( = ?auto_684256 ?auto_684267 ) ) ( not ( = ?auto_684256 ?auto_684268 ) ) ( not ( = ?auto_684257 ?auto_684258 ) ) ( not ( = ?auto_684257 ?auto_684259 ) ) ( not ( = ?auto_684257 ?auto_684260 ) ) ( not ( = ?auto_684257 ?auto_684261 ) ) ( not ( = ?auto_684257 ?auto_684262 ) ) ( not ( = ?auto_684257 ?auto_684263 ) ) ( not ( = ?auto_684257 ?auto_684264 ) ) ( not ( = ?auto_684257 ?auto_684265 ) ) ( not ( = ?auto_684257 ?auto_684266 ) ) ( not ( = ?auto_684257 ?auto_684267 ) ) ( not ( = ?auto_684257 ?auto_684268 ) ) ( not ( = ?auto_684258 ?auto_684259 ) ) ( not ( = ?auto_684258 ?auto_684260 ) ) ( not ( = ?auto_684258 ?auto_684261 ) ) ( not ( = ?auto_684258 ?auto_684262 ) ) ( not ( = ?auto_684258 ?auto_684263 ) ) ( not ( = ?auto_684258 ?auto_684264 ) ) ( not ( = ?auto_684258 ?auto_684265 ) ) ( not ( = ?auto_684258 ?auto_684266 ) ) ( not ( = ?auto_684258 ?auto_684267 ) ) ( not ( = ?auto_684258 ?auto_684268 ) ) ( not ( = ?auto_684259 ?auto_684260 ) ) ( not ( = ?auto_684259 ?auto_684261 ) ) ( not ( = ?auto_684259 ?auto_684262 ) ) ( not ( = ?auto_684259 ?auto_684263 ) ) ( not ( = ?auto_684259 ?auto_684264 ) ) ( not ( = ?auto_684259 ?auto_684265 ) ) ( not ( = ?auto_684259 ?auto_684266 ) ) ( not ( = ?auto_684259 ?auto_684267 ) ) ( not ( = ?auto_684259 ?auto_684268 ) ) ( not ( = ?auto_684260 ?auto_684261 ) ) ( not ( = ?auto_684260 ?auto_684262 ) ) ( not ( = ?auto_684260 ?auto_684263 ) ) ( not ( = ?auto_684260 ?auto_684264 ) ) ( not ( = ?auto_684260 ?auto_684265 ) ) ( not ( = ?auto_684260 ?auto_684266 ) ) ( not ( = ?auto_684260 ?auto_684267 ) ) ( not ( = ?auto_684260 ?auto_684268 ) ) ( not ( = ?auto_684261 ?auto_684262 ) ) ( not ( = ?auto_684261 ?auto_684263 ) ) ( not ( = ?auto_684261 ?auto_684264 ) ) ( not ( = ?auto_684261 ?auto_684265 ) ) ( not ( = ?auto_684261 ?auto_684266 ) ) ( not ( = ?auto_684261 ?auto_684267 ) ) ( not ( = ?auto_684261 ?auto_684268 ) ) ( not ( = ?auto_684262 ?auto_684263 ) ) ( not ( = ?auto_684262 ?auto_684264 ) ) ( not ( = ?auto_684262 ?auto_684265 ) ) ( not ( = ?auto_684262 ?auto_684266 ) ) ( not ( = ?auto_684262 ?auto_684267 ) ) ( not ( = ?auto_684262 ?auto_684268 ) ) ( not ( = ?auto_684263 ?auto_684264 ) ) ( not ( = ?auto_684263 ?auto_684265 ) ) ( not ( = ?auto_684263 ?auto_684266 ) ) ( not ( = ?auto_684263 ?auto_684267 ) ) ( not ( = ?auto_684263 ?auto_684268 ) ) ( not ( = ?auto_684264 ?auto_684265 ) ) ( not ( = ?auto_684264 ?auto_684266 ) ) ( not ( = ?auto_684264 ?auto_684267 ) ) ( not ( = ?auto_684264 ?auto_684268 ) ) ( not ( = ?auto_684265 ?auto_684266 ) ) ( not ( = ?auto_684265 ?auto_684267 ) ) ( not ( = ?auto_684265 ?auto_684268 ) ) ( not ( = ?auto_684266 ?auto_684267 ) ) ( not ( = ?auto_684266 ?auto_684268 ) ) ( not ( = ?auto_684267 ?auto_684268 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_684267 ?auto_684268 )
      ( !STACK ?auto_684267 ?auto_684266 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_684315 - BLOCK
      ?auto_684316 - BLOCK
      ?auto_684317 - BLOCK
      ?auto_684318 - BLOCK
      ?auto_684319 - BLOCK
      ?auto_684320 - BLOCK
      ?auto_684321 - BLOCK
      ?auto_684322 - BLOCK
      ?auto_684323 - BLOCK
      ?auto_684324 - BLOCK
      ?auto_684325 - BLOCK
      ?auto_684326 - BLOCK
      ?auto_684327 - BLOCK
      ?auto_684328 - BLOCK
      ?auto_684329 - BLOCK
    )
    :vars
    (
      ?auto_684330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_684329 ?auto_684330 ) ( ON-TABLE ?auto_684315 ) ( ON ?auto_684316 ?auto_684315 ) ( ON ?auto_684317 ?auto_684316 ) ( ON ?auto_684318 ?auto_684317 ) ( ON ?auto_684319 ?auto_684318 ) ( ON ?auto_684320 ?auto_684319 ) ( ON ?auto_684321 ?auto_684320 ) ( ON ?auto_684322 ?auto_684321 ) ( ON ?auto_684323 ?auto_684322 ) ( ON ?auto_684324 ?auto_684323 ) ( ON ?auto_684325 ?auto_684324 ) ( ON ?auto_684326 ?auto_684325 ) ( ON ?auto_684327 ?auto_684326 ) ( not ( = ?auto_684315 ?auto_684316 ) ) ( not ( = ?auto_684315 ?auto_684317 ) ) ( not ( = ?auto_684315 ?auto_684318 ) ) ( not ( = ?auto_684315 ?auto_684319 ) ) ( not ( = ?auto_684315 ?auto_684320 ) ) ( not ( = ?auto_684315 ?auto_684321 ) ) ( not ( = ?auto_684315 ?auto_684322 ) ) ( not ( = ?auto_684315 ?auto_684323 ) ) ( not ( = ?auto_684315 ?auto_684324 ) ) ( not ( = ?auto_684315 ?auto_684325 ) ) ( not ( = ?auto_684315 ?auto_684326 ) ) ( not ( = ?auto_684315 ?auto_684327 ) ) ( not ( = ?auto_684315 ?auto_684328 ) ) ( not ( = ?auto_684315 ?auto_684329 ) ) ( not ( = ?auto_684315 ?auto_684330 ) ) ( not ( = ?auto_684316 ?auto_684317 ) ) ( not ( = ?auto_684316 ?auto_684318 ) ) ( not ( = ?auto_684316 ?auto_684319 ) ) ( not ( = ?auto_684316 ?auto_684320 ) ) ( not ( = ?auto_684316 ?auto_684321 ) ) ( not ( = ?auto_684316 ?auto_684322 ) ) ( not ( = ?auto_684316 ?auto_684323 ) ) ( not ( = ?auto_684316 ?auto_684324 ) ) ( not ( = ?auto_684316 ?auto_684325 ) ) ( not ( = ?auto_684316 ?auto_684326 ) ) ( not ( = ?auto_684316 ?auto_684327 ) ) ( not ( = ?auto_684316 ?auto_684328 ) ) ( not ( = ?auto_684316 ?auto_684329 ) ) ( not ( = ?auto_684316 ?auto_684330 ) ) ( not ( = ?auto_684317 ?auto_684318 ) ) ( not ( = ?auto_684317 ?auto_684319 ) ) ( not ( = ?auto_684317 ?auto_684320 ) ) ( not ( = ?auto_684317 ?auto_684321 ) ) ( not ( = ?auto_684317 ?auto_684322 ) ) ( not ( = ?auto_684317 ?auto_684323 ) ) ( not ( = ?auto_684317 ?auto_684324 ) ) ( not ( = ?auto_684317 ?auto_684325 ) ) ( not ( = ?auto_684317 ?auto_684326 ) ) ( not ( = ?auto_684317 ?auto_684327 ) ) ( not ( = ?auto_684317 ?auto_684328 ) ) ( not ( = ?auto_684317 ?auto_684329 ) ) ( not ( = ?auto_684317 ?auto_684330 ) ) ( not ( = ?auto_684318 ?auto_684319 ) ) ( not ( = ?auto_684318 ?auto_684320 ) ) ( not ( = ?auto_684318 ?auto_684321 ) ) ( not ( = ?auto_684318 ?auto_684322 ) ) ( not ( = ?auto_684318 ?auto_684323 ) ) ( not ( = ?auto_684318 ?auto_684324 ) ) ( not ( = ?auto_684318 ?auto_684325 ) ) ( not ( = ?auto_684318 ?auto_684326 ) ) ( not ( = ?auto_684318 ?auto_684327 ) ) ( not ( = ?auto_684318 ?auto_684328 ) ) ( not ( = ?auto_684318 ?auto_684329 ) ) ( not ( = ?auto_684318 ?auto_684330 ) ) ( not ( = ?auto_684319 ?auto_684320 ) ) ( not ( = ?auto_684319 ?auto_684321 ) ) ( not ( = ?auto_684319 ?auto_684322 ) ) ( not ( = ?auto_684319 ?auto_684323 ) ) ( not ( = ?auto_684319 ?auto_684324 ) ) ( not ( = ?auto_684319 ?auto_684325 ) ) ( not ( = ?auto_684319 ?auto_684326 ) ) ( not ( = ?auto_684319 ?auto_684327 ) ) ( not ( = ?auto_684319 ?auto_684328 ) ) ( not ( = ?auto_684319 ?auto_684329 ) ) ( not ( = ?auto_684319 ?auto_684330 ) ) ( not ( = ?auto_684320 ?auto_684321 ) ) ( not ( = ?auto_684320 ?auto_684322 ) ) ( not ( = ?auto_684320 ?auto_684323 ) ) ( not ( = ?auto_684320 ?auto_684324 ) ) ( not ( = ?auto_684320 ?auto_684325 ) ) ( not ( = ?auto_684320 ?auto_684326 ) ) ( not ( = ?auto_684320 ?auto_684327 ) ) ( not ( = ?auto_684320 ?auto_684328 ) ) ( not ( = ?auto_684320 ?auto_684329 ) ) ( not ( = ?auto_684320 ?auto_684330 ) ) ( not ( = ?auto_684321 ?auto_684322 ) ) ( not ( = ?auto_684321 ?auto_684323 ) ) ( not ( = ?auto_684321 ?auto_684324 ) ) ( not ( = ?auto_684321 ?auto_684325 ) ) ( not ( = ?auto_684321 ?auto_684326 ) ) ( not ( = ?auto_684321 ?auto_684327 ) ) ( not ( = ?auto_684321 ?auto_684328 ) ) ( not ( = ?auto_684321 ?auto_684329 ) ) ( not ( = ?auto_684321 ?auto_684330 ) ) ( not ( = ?auto_684322 ?auto_684323 ) ) ( not ( = ?auto_684322 ?auto_684324 ) ) ( not ( = ?auto_684322 ?auto_684325 ) ) ( not ( = ?auto_684322 ?auto_684326 ) ) ( not ( = ?auto_684322 ?auto_684327 ) ) ( not ( = ?auto_684322 ?auto_684328 ) ) ( not ( = ?auto_684322 ?auto_684329 ) ) ( not ( = ?auto_684322 ?auto_684330 ) ) ( not ( = ?auto_684323 ?auto_684324 ) ) ( not ( = ?auto_684323 ?auto_684325 ) ) ( not ( = ?auto_684323 ?auto_684326 ) ) ( not ( = ?auto_684323 ?auto_684327 ) ) ( not ( = ?auto_684323 ?auto_684328 ) ) ( not ( = ?auto_684323 ?auto_684329 ) ) ( not ( = ?auto_684323 ?auto_684330 ) ) ( not ( = ?auto_684324 ?auto_684325 ) ) ( not ( = ?auto_684324 ?auto_684326 ) ) ( not ( = ?auto_684324 ?auto_684327 ) ) ( not ( = ?auto_684324 ?auto_684328 ) ) ( not ( = ?auto_684324 ?auto_684329 ) ) ( not ( = ?auto_684324 ?auto_684330 ) ) ( not ( = ?auto_684325 ?auto_684326 ) ) ( not ( = ?auto_684325 ?auto_684327 ) ) ( not ( = ?auto_684325 ?auto_684328 ) ) ( not ( = ?auto_684325 ?auto_684329 ) ) ( not ( = ?auto_684325 ?auto_684330 ) ) ( not ( = ?auto_684326 ?auto_684327 ) ) ( not ( = ?auto_684326 ?auto_684328 ) ) ( not ( = ?auto_684326 ?auto_684329 ) ) ( not ( = ?auto_684326 ?auto_684330 ) ) ( not ( = ?auto_684327 ?auto_684328 ) ) ( not ( = ?auto_684327 ?auto_684329 ) ) ( not ( = ?auto_684327 ?auto_684330 ) ) ( not ( = ?auto_684328 ?auto_684329 ) ) ( not ( = ?auto_684328 ?auto_684330 ) ) ( not ( = ?auto_684329 ?auto_684330 ) ) ( CLEAR ?auto_684327 ) ( ON ?auto_684328 ?auto_684329 ) ( CLEAR ?auto_684328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_684315 ?auto_684316 ?auto_684317 ?auto_684318 ?auto_684319 ?auto_684320 ?auto_684321 ?auto_684322 ?auto_684323 ?auto_684324 ?auto_684325 ?auto_684326 ?auto_684327 ?auto_684328 )
      ( MAKE-15PILE ?auto_684315 ?auto_684316 ?auto_684317 ?auto_684318 ?auto_684319 ?auto_684320 ?auto_684321 ?auto_684322 ?auto_684323 ?auto_684324 ?auto_684325 ?auto_684326 ?auto_684327 ?auto_684328 ?auto_684329 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_684377 - BLOCK
      ?auto_684378 - BLOCK
      ?auto_684379 - BLOCK
      ?auto_684380 - BLOCK
      ?auto_684381 - BLOCK
      ?auto_684382 - BLOCK
      ?auto_684383 - BLOCK
      ?auto_684384 - BLOCK
      ?auto_684385 - BLOCK
      ?auto_684386 - BLOCK
      ?auto_684387 - BLOCK
      ?auto_684388 - BLOCK
      ?auto_684389 - BLOCK
      ?auto_684390 - BLOCK
      ?auto_684391 - BLOCK
    )
    :vars
    (
      ?auto_684392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_684391 ?auto_684392 ) ( ON-TABLE ?auto_684377 ) ( ON ?auto_684378 ?auto_684377 ) ( ON ?auto_684379 ?auto_684378 ) ( ON ?auto_684380 ?auto_684379 ) ( ON ?auto_684381 ?auto_684380 ) ( ON ?auto_684382 ?auto_684381 ) ( ON ?auto_684383 ?auto_684382 ) ( ON ?auto_684384 ?auto_684383 ) ( ON ?auto_684385 ?auto_684384 ) ( ON ?auto_684386 ?auto_684385 ) ( ON ?auto_684387 ?auto_684386 ) ( ON ?auto_684388 ?auto_684387 ) ( not ( = ?auto_684377 ?auto_684378 ) ) ( not ( = ?auto_684377 ?auto_684379 ) ) ( not ( = ?auto_684377 ?auto_684380 ) ) ( not ( = ?auto_684377 ?auto_684381 ) ) ( not ( = ?auto_684377 ?auto_684382 ) ) ( not ( = ?auto_684377 ?auto_684383 ) ) ( not ( = ?auto_684377 ?auto_684384 ) ) ( not ( = ?auto_684377 ?auto_684385 ) ) ( not ( = ?auto_684377 ?auto_684386 ) ) ( not ( = ?auto_684377 ?auto_684387 ) ) ( not ( = ?auto_684377 ?auto_684388 ) ) ( not ( = ?auto_684377 ?auto_684389 ) ) ( not ( = ?auto_684377 ?auto_684390 ) ) ( not ( = ?auto_684377 ?auto_684391 ) ) ( not ( = ?auto_684377 ?auto_684392 ) ) ( not ( = ?auto_684378 ?auto_684379 ) ) ( not ( = ?auto_684378 ?auto_684380 ) ) ( not ( = ?auto_684378 ?auto_684381 ) ) ( not ( = ?auto_684378 ?auto_684382 ) ) ( not ( = ?auto_684378 ?auto_684383 ) ) ( not ( = ?auto_684378 ?auto_684384 ) ) ( not ( = ?auto_684378 ?auto_684385 ) ) ( not ( = ?auto_684378 ?auto_684386 ) ) ( not ( = ?auto_684378 ?auto_684387 ) ) ( not ( = ?auto_684378 ?auto_684388 ) ) ( not ( = ?auto_684378 ?auto_684389 ) ) ( not ( = ?auto_684378 ?auto_684390 ) ) ( not ( = ?auto_684378 ?auto_684391 ) ) ( not ( = ?auto_684378 ?auto_684392 ) ) ( not ( = ?auto_684379 ?auto_684380 ) ) ( not ( = ?auto_684379 ?auto_684381 ) ) ( not ( = ?auto_684379 ?auto_684382 ) ) ( not ( = ?auto_684379 ?auto_684383 ) ) ( not ( = ?auto_684379 ?auto_684384 ) ) ( not ( = ?auto_684379 ?auto_684385 ) ) ( not ( = ?auto_684379 ?auto_684386 ) ) ( not ( = ?auto_684379 ?auto_684387 ) ) ( not ( = ?auto_684379 ?auto_684388 ) ) ( not ( = ?auto_684379 ?auto_684389 ) ) ( not ( = ?auto_684379 ?auto_684390 ) ) ( not ( = ?auto_684379 ?auto_684391 ) ) ( not ( = ?auto_684379 ?auto_684392 ) ) ( not ( = ?auto_684380 ?auto_684381 ) ) ( not ( = ?auto_684380 ?auto_684382 ) ) ( not ( = ?auto_684380 ?auto_684383 ) ) ( not ( = ?auto_684380 ?auto_684384 ) ) ( not ( = ?auto_684380 ?auto_684385 ) ) ( not ( = ?auto_684380 ?auto_684386 ) ) ( not ( = ?auto_684380 ?auto_684387 ) ) ( not ( = ?auto_684380 ?auto_684388 ) ) ( not ( = ?auto_684380 ?auto_684389 ) ) ( not ( = ?auto_684380 ?auto_684390 ) ) ( not ( = ?auto_684380 ?auto_684391 ) ) ( not ( = ?auto_684380 ?auto_684392 ) ) ( not ( = ?auto_684381 ?auto_684382 ) ) ( not ( = ?auto_684381 ?auto_684383 ) ) ( not ( = ?auto_684381 ?auto_684384 ) ) ( not ( = ?auto_684381 ?auto_684385 ) ) ( not ( = ?auto_684381 ?auto_684386 ) ) ( not ( = ?auto_684381 ?auto_684387 ) ) ( not ( = ?auto_684381 ?auto_684388 ) ) ( not ( = ?auto_684381 ?auto_684389 ) ) ( not ( = ?auto_684381 ?auto_684390 ) ) ( not ( = ?auto_684381 ?auto_684391 ) ) ( not ( = ?auto_684381 ?auto_684392 ) ) ( not ( = ?auto_684382 ?auto_684383 ) ) ( not ( = ?auto_684382 ?auto_684384 ) ) ( not ( = ?auto_684382 ?auto_684385 ) ) ( not ( = ?auto_684382 ?auto_684386 ) ) ( not ( = ?auto_684382 ?auto_684387 ) ) ( not ( = ?auto_684382 ?auto_684388 ) ) ( not ( = ?auto_684382 ?auto_684389 ) ) ( not ( = ?auto_684382 ?auto_684390 ) ) ( not ( = ?auto_684382 ?auto_684391 ) ) ( not ( = ?auto_684382 ?auto_684392 ) ) ( not ( = ?auto_684383 ?auto_684384 ) ) ( not ( = ?auto_684383 ?auto_684385 ) ) ( not ( = ?auto_684383 ?auto_684386 ) ) ( not ( = ?auto_684383 ?auto_684387 ) ) ( not ( = ?auto_684383 ?auto_684388 ) ) ( not ( = ?auto_684383 ?auto_684389 ) ) ( not ( = ?auto_684383 ?auto_684390 ) ) ( not ( = ?auto_684383 ?auto_684391 ) ) ( not ( = ?auto_684383 ?auto_684392 ) ) ( not ( = ?auto_684384 ?auto_684385 ) ) ( not ( = ?auto_684384 ?auto_684386 ) ) ( not ( = ?auto_684384 ?auto_684387 ) ) ( not ( = ?auto_684384 ?auto_684388 ) ) ( not ( = ?auto_684384 ?auto_684389 ) ) ( not ( = ?auto_684384 ?auto_684390 ) ) ( not ( = ?auto_684384 ?auto_684391 ) ) ( not ( = ?auto_684384 ?auto_684392 ) ) ( not ( = ?auto_684385 ?auto_684386 ) ) ( not ( = ?auto_684385 ?auto_684387 ) ) ( not ( = ?auto_684385 ?auto_684388 ) ) ( not ( = ?auto_684385 ?auto_684389 ) ) ( not ( = ?auto_684385 ?auto_684390 ) ) ( not ( = ?auto_684385 ?auto_684391 ) ) ( not ( = ?auto_684385 ?auto_684392 ) ) ( not ( = ?auto_684386 ?auto_684387 ) ) ( not ( = ?auto_684386 ?auto_684388 ) ) ( not ( = ?auto_684386 ?auto_684389 ) ) ( not ( = ?auto_684386 ?auto_684390 ) ) ( not ( = ?auto_684386 ?auto_684391 ) ) ( not ( = ?auto_684386 ?auto_684392 ) ) ( not ( = ?auto_684387 ?auto_684388 ) ) ( not ( = ?auto_684387 ?auto_684389 ) ) ( not ( = ?auto_684387 ?auto_684390 ) ) ( not ( = ?auto_684387 ?auto_684391 ) ) ( not ( = ?auto_684387 ?auto_684392 ) ) ( not ( = ?auto_684388 ?auto_684389 ) ) ( not ( = ?auto_684388 ?auto_684390 ) ) ( not ( = ?auto_684388 ?auto_684391 ) ) ( not ( = ?auto_684388 ?auto_684392 ) ) ( not ( = ?auto_684389 ?auto_684390 ) ) ( not ( = ?auto_684389 ?auto_684391 ) ) ( not ( = ?auto_684389 ?auto_684392 ) ) ( not ( = ?auto_684390 ?auto_684391 ) ) ( not ( = ?auto_684390 ?auto_684392 ) ) ( not ( = ?auto_684391 ?auto_684392 ) ) ( ON ?auto_684390 ?auto_684391 ) ( CLEAR ?auto_684388 ) ( ON ?auto_684389 ?auto_684390 ) ( CLEAR ?auto_684389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_684377 ?auto_684378 ?auto_684379 ?auto_684380 ?auto_684381 ?auto_684382 ?auto_684383 ?auto_684384 ?auto_684385 ?auto_684386 ?auto_684387 ?auto_684388 ?auto_684389 )
      ( MAKE-15PILE ?auto_684377 ?auto_684378 ?auto_684379 ?auto_684380 ?auto_684381 ?auto_684382 ?auto_684383 ?auto_684384 ?auto_684385 ?auto_684386 ?auto_684387 ?auto_684388 ?auto_684389 ?auto_684390 ?auto_684391 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_684439 - BLOCK
      ?auto_684440 - BLOCK
      ?auto_684441 - BLOCK
      ?auto_684442 - BLOCK
      ?auto_684443 - BLOCK
      ?auto_684444 - BLOCK
      ?auto_684445 - BLOCK
      ?auto_684446 - BLOCK
      ?auto_684447 - BLOCK
      ?auto_684448 - BLOCK
      ?auto_684449 - BLOCK
      ?auto_684450 - BLOCK
      ?auto_684451 - BLOCK
      ?auto_684452 - BLOCK
      ?auto_684453 - BLOCK
    )
    :vars
    (
      ?auto_684454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_684453 ?auto_684454 ) ( ON-TABLE ?auto_684439 ) ( ON ?auto_684440 ?auto_684439 ) ( ON ?auto_684441 ?auto_684440 ) ( ON ?auto_684442 ?auto_684441 ) ( ON ?auto_684443 ?auto_684442 ) ( ON ?auto_684444 ?auto_684443 ) ( ON ?auto_684445 ?auto_684444 ) ( ON ?auto_684446 ?auto_684445 ) ( ON ?auto_684447 ?auto_684446 ) ( ON ?auto_684448 ?auto_684447 ) ( ON ?auto_684449 ?auto_684448 ) ( not ( = ?auto_684439 ?auto_684440 ) ) ( not ( = ?auto_684439 ?auto_684441 ) ) ( not ( = ?auto_684439 ?auto_684442 ) ) ( not ( = ?auto_684439 ?auto_684443 ) ) ( not ( = ?auto_684439 ?auto_684444 ) ) ( not ( = ?auto_684439 ?auto_684445 ) ) ( not ( = ?auto_684439 ?auto_684446 ) ) ( not ( = ?auto_684439 ?auto_684447 ) ) ( not ( = ?auto_684439 ?auto_684448 ) ) ( not ( = ?auto_684439 ?auto_684449 ) ) ( not ( = ?auto_684439 ?auto_684450 ) ) ( not ( = ?auto_684439 ?auto_684451 ) ) ( not ( = ?auto_684439 ?auto_684452 ) ) ( not ( = ?auto_684439 ?auto_684453 ) ) ( not ( = ?auto_684439 ?auto_684454 ) ) ( not ( = ?auto_684440 ?auto_684441 ) ) ( not ( = ?auto_684440 ?auto_684442 ) ) ( not ( = ?auto_684440 ?auto_684443 ) ) ( not ( = ?auto_684440 ?auto_684444 ) ) ( not ( = ?auto_684440 ?auto_684445 ) ) ( not ( = ?auto_684440 ?auto_684446 ) ) ( not ( = ?auto_684440 ?auto_684447 ) ) ( not ( = ?auto_684440 ?auto_684448 ) ) ( not ( = ?auto_684440 ?auto_684449 ) ) ( not ( = ?auto_684440 ?auto_684450 ) ) ( not ( = ?auto_684440 ?auto_684451 ) ) ( not ( = ?auto_684440 ?auto_684452 ) ) ( not ( = ?auto_684440 ?auto_684453 ) ) ( not ( = ?auto_684440 ?auto_684454 ) ) ( not ( = ?auto_684441 ?auto_684442 ) ) ( not ( = ?auto_684441 ?auto_684443 ) ) ( not ( = ?auto_684441 ?auto_684444 ) ) ( not ( = ?auto_684441 ?auto_684445 ) ) ( not ( = ?auto_684441 ?auto_684446 ) ) ( not ( = ?auto_684441 ?auto_684447 ) ) ( not ( = ?auto_684441 ?auto_684448 ) ) ( not ( = ?auto_684441 ?auto_684449 ) ) ( not ( = ?auto_684441 ?auto_684450 ) ) ( not ( = ?auto_684441 ?auto_684451 ) ) ( not ( = ?auto_684441 ?auto_684452 ) ) ( not ( = ?auto_684441 ?auto_684453 ) ) ( not ( = ?auto_684441 ?auto_684454 ) ) ( not ( = ?auto_684442 ?auto_684443 ) ) ( not ( = ?auto_684442 ?auto_684444 ) ) ( not ( = ?auto_684442 ?auto_684445 ) ) ( not ( = ?auto_684442 ?auto_684446 ) ) ( not ( = ?auto_684442 ?auto_684447 ) ) ( not ( = ?auto_684442 ?auto_684448 ) ) ( not ( = ?auto_684442 ?auto_684449 ) ) ( not ( = ?auto_684442 ?auto_684450 ) ) ( not ( = ?auto_684442 ?auto_684451 ) ) ( not ( = ?auto_684442 ?auto_684452 ) ) ( not ( = ?auto_684442 ?auto_684453 ) ) ( not ( = ?auto_684442 ?auto_684454 ) ) ( not ( = ?auto_684443 ?auto_684444 ) ) ( not ( = ?auto_684443 ?auto_684445 ) ) ( not ( = ?auto_684443 ?auto_684446 ) ) ( not ( = ?auto_684443 ?auto_684447 ) ) ( not ( = ?auto_684443 ?auto_684448 ) ) ( not ( = ?auto_684443 ?auto_684449 ) ) ( not ( = ?auto_684443 ?auto_684450 ) ) ( not ( = ?auto_684443 ?auto_684451 ) ) ( not ( = ?auto_684443 ?auto_684452 ) ) ( not ( = ?auto_684443 ?auto_684453 ) ) ( not ( = ?auto_684443 ?auto_684454 ) ) ( not ( = ?auto_684444 ?auto_684445 ) ) ( not ( = ?auto_684444 ?auto_684446 ) ) ( not ( = ?auto_684444 ?auto_684447 ) ) ( not ( = ?auto_684444 ?auto_684448 ) ) ( not ( = ?auto_684444 ?auto_684449 ) ) ( not ( = ?auto_684444 ?auto_684450 ) ) ( not ( = ?auto_684444 ?auto_684451 ) ) ( not ( = ?auto_684444 ?auto_684452 ) ) ( not ( = ?auto_684444 ?auto_684453 ) ) ( not ( = ?auto_684444 ?auto_684454 ) ) ( not ( = ?auto_684445 ?auto_684446 ) ) ( not ( = ?auto_684445 ?auto_684447 ) ) ( not ( = ?auto_684445 ?auto_684448 ) ) ( not ( = ?auto_684445 ?auto_684449 ) ) ( not ( = ?auto_684445 ?auto_684450 ) ) ( not ( = ?auto_684445 ?auto_684451 ) ) ( not ( = ?auto_684445 ?auto_684452 ) ) ( not ( = ?auto_684445 ?auto_684453 ) ) ( not ( = ?auto_684445 ?auto_684454 ) ) ( not ( = ?auto_684446 ?auto_684447 ) ) ( not ( = ?auto_684446 ?auto_684448 ) ) ( not ( = ?auto_684446 ?auto_684449 ) ) ( not ( = ?auto_684446 ?auto_684450 ) ) ( not ( = ?auto_684446 ?auto_684451 ) ) ( not ( = ?auto_684446 ?auto_684452 ) ) ( not ( = ?auto_684446 ?auto_684453 ) ) ( not ( = ?auto_684446 ?auto_684454 ) ) ( not ( = ?auto_684447 ?auto_684448 ) ) ( not ( = ?auto_684447 ?auto_684449 ) ) ( not ( = ?auto_684447 ?auto_684450 ) ) ( not ( = ?auto_684447 ?auto_684451 ) ) ( not ( = ?auto_684447 ?auto_684452 ) ) ( not ( = ?auto_684447 ?auto_684453 ) ) ( not ( = ?auto_684447 ?auto_684454 ) ) ( not ( = ?auto_684448 ?auto_684449 ) ) ( not ( = ?auto_684448 ?auto_684450 ) ) ( not ( = ?auto_684448 ?auto_684451 ) ) ( not ( = ?auto_684448 ?auto_684452 ) ) ( not ( = ?auto_684448 ?auto_684453 ) ) ( not ( = ?auto_684448 ?auto_684454 ) ) ( not ( = ?auto_684449 ?auto_684450 ) ) ( not ( = ?auto_684449 ?auto_684451 ) ) ( not ( = ?auto_684449 ?auto_684452 ) ) ( not ( = ?auto_684449 ?auto_684453 ) ) ( not ( = ?auto_684449 ?auto_684454 ) ) ( not ( = ?auto_684450 ?auto_684451 ) ) ( not ( = ?auto_684450 ?auto_684452 ) ) ( not ( = ?auto_684450 ?auto_684453 ) ) ( not ( = ?auto_684450 ?auto_684454 ) ) ( not ( = ?auto_684451 ?auto_684452 ) ) ( not ( = ?auto_684451 ?auto_684453 ) ) ( not ( = ?auto_684451 ?auto_684454 ) ) ( not ( = ?auto_684452 ?auto_684453 ) ) ( not ( = ?auto_684452 ?auto_684454 ) ) ( not ( = ?auto_684453 ?auto_684454 ) ) ( ON ?auto_684452 ?auto_684453 ) ( ON ?auto_684451 ?auto_684452 ) ( CLEAR ?auto_684449 ) ( ON ?auto_684450 ?auto_684451 ) ( CLEAR ?auto_684450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_684439 ?auto_684440 ?auto_684441 ?auto_684442 ?auto_684443 ?auto_684444 ?auto_684445 ?auto_684446 ?auto_684447 ?auto_684448 ?auto_684449 ?auto_684450 )
      ( MAKE-15PILE ?auto_684439 ?auto_684440 ?auto_684441 ?auto_684442 ?auto_684443 ?auto_684444 ?auto_684445 ?auto_684446 ?auto_684447 ?auto_684448 ?auto_684449 ?auto_684450 ?auto_684451 ?auto_684452 ?auto_684453 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_684501 - BLOCK
      ?auto_684502 - BLOCK
      ?auto_684503 - BLOCK
      ?auto_684504 - BLOCK
      ?auto_684505 - BLOCK
      ?auto_684506 - BLOCK
      ?auto_684507 - BLOCK
      ?auto_684508 - BLOCK
      ?auto_684509 - BLOCK
      ?auto_684510 - BLOCK
      ?auto_684511 - BLOCK
      ?auto_684512 - BLOCK
      ?auto_684513 - BLOCK
      ?auto_684514 - BLOCK
      ?auto_684515 - BLOCK
    )
    :vars
    (
      ?auto_684516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_684515 ?auto_684516 ) ( ON-TABLE ?auto_684501 ) ( ON ?auto_684502 ?auto_684501 ) ( ON ?auto_684503 ?auto_684502 ) ( ON ?auto_684504 ?auto_684503 ) ( ON ?auto_684505 ?auto_684504 ) ( ON ?auto_684506 ?auto_684505 ) ( ON ?auto_684507 ?auto_684506 ) ( ON ?auto_684508 ?auto_684507 ) ( ON ?auto_684509 ?auto_684508 ) ( ON ?auto_684510 ?auto_684509 ) ( not ( = ?auto_684501 ?auto_684502 ) ) ( not ( = ?auto_684501 ?auto_684503 ) ) ( not ( = ?auto_684501 ?auto_684504 ) ) ( not ( = ?auto_684501 ?auto_684505 ) ) ( not ( = ?auto_684501 ?auto_684506 ) ) ( not ( = ?auto_684501 ?auto_684507 ) ) ( not ( = ?auto_684501 ?auto_684508 ) ) ( not ( = ?auto_684501 ?auto_684509 ) ) ( not ( = ?auto_684501 ?auto_684510 ) ) ( not ( = ?auto_684501 ?auto_684511 ) ) ( not ( = ?auto_684501 ?auto_684512 ) ) ( not ( = ?auto_684501 ?auto_684513 ) ) ( not ( = ?auto_684501 ?auto_684514 ) ) ( not ( = ?auto_684501 ?auto_684515 ) ) ( not ( = ?auto_684501 ?auto_684516 ) ) ( not ( = ?auto_684502 ?auto_684503 ) ) ( not ( = ?auto_684502 ?auto_684504 ) ) ( not ( = ?auto_684502 ?auto_684505 ) ) ( not ( = ?auto_684502 ?auto_684506 ) ) ( not ( = ?auto_684502 ?auto_684507 ) ) ( not ( = ?auto_684502 ?auto_684508 ) ) ( not ( = ?auto_684502 ?auto_684509 ) ) ( not ( = ?auto_684502 ?auto_684510 ) ) ( not ( = ?auto_684502 ?auto_684511 ) ) ( not ( = ?auto_684502 ?auto_684512 ) ) ( not ( = ?auto_684502 ?auto_684513 ) ) ( not ( = ?auto_684502 ?auto_684514 ) ) ( not ( = ?auto_684502 ?auto_684515 ) ) ( not ( = ?auto_684502 ?auto_684516 ) ) ( not ( = ?auto_684503 ?auto_684504 ) ) ( not ( = ?auto_684503 ?auto_684505 ) ) ( not ( = ?auto_684503 ?auto_684506 ) ) ( not ( = ?auto_684503 ?auto_684507 ) ) ( not ( = ?auto_684503 ?auto_684508 ) ) ( not ( = ?auto_684503 ?auto_684509 ) ) ( not ( = ?auto_684503 ?auto_684510 ) ) ( not ( = ?auto_684503 ?auto_684511 ) ) ( not ( = ?auto_684503 ?auto_684512 ) ) ( not ( = ?auto_684503 ?auto_684513 ) ) ( not ( = ?auto_684503 ?auto_684514 ) ) ( not ( = ?auto_684503 ?auto_684515 ) ) ( not ( = ?auto_684503 ?auto_684516 ) ) ( not ( = ?auto_684504 ?auto_684505 ) ) ( not ( = ?auto_684504 ?auto_684506 ) ) ( not ( = ?auto_684504 ?auto_684507 ) ) ( not ( = ?auto_684504 ?auto_684508 ) ) ( not ( = ?auto_684504 ?auto_684509 ) ) ( not ( = ?auto_684504 ?auto_684510 ) ) ( not ( = ?auto_684504 ?auto_684511 ) ) ( not ( = ?auto_684504 ?auto_684512 ) ) ( not ( = ?auto_684504 ?auto_684513 ) ) ( not ( = ?auto_684504 ?auto_684514 ) ) ( not ( = ?auto_684504 ?auto_684515 ) ) ( not ( = ?auto_684504 ?auto_684516 ) ) ( not ( = ?auto_684505 ?auto_684506 ) ) ( not ( = ?auto_684505 ?auto_684507 ) ) ( not ( = ?auto_684505 ?auto_684508 ) ) ( not ( = ?auto_684505 ?auto_684509 ) ) ( not ( = ?auto_684505 ?auto_684510 ) ) ( not ( = ?auto_684505 ?auto_684511 ) ) ( not ( = ?auto_684505 ?auto_684512 ) ) ( not ( = ?auto_684505 ?auto_684513 ) ) ( not ( = ?auto_684505 ?auto_684514 ) ) ( not ( = ?auto_684505 ?auto_684515 ) ) ( not ( = ?auto_684505 ?auto_684516 ) ) ( not ( = ?auto_684506 ?auto_684507 ) ) ( not ( = ?auto_684506 ?auto_684508 ) ) ( not ( = ?auto_684506 ?auto_684509 ) ) ( not ( = ?auto_684506 ?auto_684510 ) ) ( not ( = ?auto_684506 ?auto_684511 ) ) ( not ( = ?auto_684506 ?auto_684512 ) ) ( not ( = ?auto_684506 ?auto_684513 ) ) ( not ( = ?auto_684506 ?auto_684514 ) ) ( not ( = ?auto_684506 ?auto_684515 ) ) ( not ( = ?auto_684506 ?auto_684516 ) ) ( not ( = ?auto_684507 ?auto_684508 ) ) ( not ( = ?auto_684507 ?auto_684509 ) ) ( not ( = ?auto_684507 ?auto_684510 ) ) ( not ( = ?auto_684507 ?auto_684511 ) ) ( not ( = ?auto_684507 ?auto_684512 ) ) ( not ( = ?auto_684507 ?auto_684513 ) ) ( not ( = ?auto_684507 ?auto_684514 ) ) ( not ( = ?auto_684507 ?auto_684515 ) ) ( not ( = ?auto_684507 ?auto_684516 ) ) ( not ( = ?auto_684508 ?auto_684509 ) ) ( not ( = ?auto_684508 ?auto_684510 ) ) ( not ( = ?auto_684508 ?auto_684511 ) ) ( not ( = ?auto_684508 ?auto_684512 ) ) ( not ( = ?auto_684508 ?auto_684513 ) ) ( not ( = ?auto_684508 ?auto_684514 ) ) ( not ( = ?auto_684508 ?auto_684515 ) ) ( not ( = ?auto_684508 ?auto_684516 ) ) ( not ( = ?auto_684509 ?auto_684510 ) ) ( not ( = ?auto_684509 ?auto_684511 ) ) ( not ( = ?auto_684509 ?auto_684512 ) ) ( not ( = ?auto_684509 ?auto_684513 ) ) ( not ( = ?auto_684509 ?auto_684514 ) ) ( not ( = ?auto_684509 ?auto_684515 ) ) ( not ( = ?auto_684509 ?auto_684516 ) ) ( not ( = ?auto_684510 ?auto_684511 ) ) ( not ( = ?auto_684510 ?auto_684512 ) ) ( not ( = ?auto_684510 ?auto_684513 ) ) ( not ( = ?auto_684510 ?auto_684514 ) ) ( not ( = ?auto_684510 ?auto_684515 ) ) ( not ( = ?auto_684510 ?auto_684516 ) ) ( not ( = ?auto_684511 ?auto_684512 ) ) ( not ( = ?auto_684511 ?auto_684513 ) ) ( not ( = ?auto_684511 ?auto_684514 ) ) ( not ( = ?auto_684511 ?auto_684515 ) ) ( not ( = ?auto_684511 ?auto_684516 ) ) ( not ( = ?auto_684512 ?auto_684513 ) ) ( not ( = ?auto_684512 ?auto_684514 ) ) ( not ( = ?auto_684512 ?auto_684515 ) ) ( not ( = ?auto_684512 ?auto_684516 ) ) ( not ( = ?auto_684513 ?auto_684514 ) ) ( not ( = ?auto_684513 ?auto_684515 ) ) ( not ( = ?auto_684513 ?auto_684516 ) ) ( not ( = ?auto_684514 ?auto_684515 ) ) ( not ( = ?auto_684514 ?auto_684516 ) ) ( not ( = ?auto_684515 ?auto_684516 ) ) ( ON ?auto_684514 ?auto_684515 ) ( ON ?auto_684513 ?auto_684514 ) ( ON ?auto_684512 ?auto_684513 ) ( CLEAR ?auto_684510 ) ( ON ?auto_684511 ?auto_684512 ) ( CLEAR ?auto_684511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_684501 ?auto_684502 ?auto_684503 ?auto_684504 ?auto_684505 ?auto_684506 ?auto_684507 ?auto_684508 ?auto_684509 ?auto_684510 ?auto_684511 )
      ( MAKE-15PILE ?auto_684501 ?auto_684502 ?auto_684503 ?auto_684504 ?auto_684505 ?auto_684506 ?auto_684507 ?auto_684508 ?auto_684509 ?auto_684510 ?auto_684511 ?auto_684512 ?auto_684513 ?auto_684514 ?auto_684515 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_684563 - BLOCK
      ?auto_684564 - BLOCK
      ?auto_684565 - BLOCK
      ?auto_684566 - BLOCK
      ?auto_684567 - BLOCK
      ?auto_684568 - BLOCK
      ?auto_684569 - BLOCK
      ?auto_684570 - BLOCK
      ?auto_684571 - BLOCK
      ?auto_684572 - BLOCK
      ?auto_684573 - BLOCK
      ?auto_684574 - BLOCK
      ?auto_684575 - BLOCK
      ?auto_684576 - BLOCK
      ?auto_684577 - BLOCK
    )
    :vars
    (
      ?auto_684578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_684577 ?auto_684578 ) ( ON-TABLE ?auto_684563 ) ( ON ?auto_684564 ?auto_684563 ) ( ON ?auto_684565 ?auto_684564 ) ( ON ?auto_684566 ?auto_684565 ) ( ON ?auto_684567 ?auto_684566 ) ( ON ?auto_684568 ?auto_684567 ) ( ON ?auto_684569 ?auto_684568 ) ( ON ?auto_684570 ?auto_684569 ) ( ON ?auto_684571 ?auto_684570 ) ( not ( = ?auto_684563 ?auto_684564 ) ) ( not ( = ?auto_684563 ?auto_684565 ) ) ( not ( = ?auto_684563 ?auto_684566 ) ) ( not ( = ?auto_684563 ?auto_684567 ) ) ( not ( = ?auto_684563 ?auto_684568 ) ) ( not ( = ?auto_684563 ?auto_684569 ) ) ( not ( = ?auto_684563 ?auto_684570 ) ) ( not ( = ?auto_684563 ?auto_684571 ) ) ( not ( = ?auto_684563 ?auto_684572 ) ) ( not ( = ?auto_684563 ?auto_684573 ) ) ( not ( = ?auto_684563 ?auto_684574 ) ) ( not ( = ?auto_684563 ?auto_684575 ) ) ( not ( = ?auto_684563 ?auto_684576 ) ) ( not ( = ?auto_684563 ?auto_684577 ) ) ( not ( = ?auto_684563 ?auto_684578 ) ) ( not ( = ?auto_684564 ?auto_684565 ) ) ( not ( = ?auto_684564 ?auto_684566 ) ) ( not ( = ?auto_684564 ?auto_684567 ) ) ( not ( = ?auto_684564 ?auto_684568 ) ) ( not ( = ?auto_684564 ?auto_684569 ) ) ( not ( = ?auto_684564 ?auto_684570 ) ) ( not ( = ?auto_684564 ?auto_684571 ) ) ( not ( = ?auto_684564 ?auto_684572 ) ) ( not ( = ?auto_684564 ?auto_684573 ) ) ( not ( = ?auto_684564 ?auto_684574 ) ) ( not ( = ?auto_684564 ?auto_684575 ) ) ( not ( = ?auto_684564 ?auto_684576 ) ) ( not ( = ?auto_684564 ?auto_684577 ) ) ( not ( = ?auto_684564 ?auto_684578 ) ) ( not ( = ?auto_684565 ?auto_684566 ) ) ( not ( = ?auto_684565 ?auto_684567 ) ) ( not ( = ?auto_684565 ?auto_684568 ) ) ( not ( = ?auto_684565 ?auto_684569 ) ) ( not ( = ?auto_684565 ?auto_684570 ) ) ( not ( = ?auto_684565 ?auto_684571 ) ) ( not ( = ?auto_684565 ?auto_684572 ) ) ( not ( = ?auto_684565 ?auto_684573 ) ) ( not ( = ?auto_684565 ?auto_684574 ) ) ( not ( = ?auto_684565 ?auto_684575 ) ) ( not ( = ?auto_684565 ?auto_684576 ) ) ( not ( = ?auto_684565 ?auto_684577 ) ) ( not ( = ?auto_684565 ?auto_684578 ) ) ( not ( = ?auto_684566 ?auto_684567 ) ) ( not ( = ?auto_684566 ?auto_684568 ) ) ( not ( = ?auto_684566 ?auto_684569 ) ) ( not ( = ?auto_684566 ?auto_684570 ) ) ( not ( = ?auto_684566 ?auto_684571 ) ) ( not ( = ?auto_684566 ?auto_684572 ) ) ( not ( = ?auto_684566 ?auto_684573 ) ) ( not ( = ?auto_684566 ?auto_684574 ) ) ( not ( = ?auto_684566 ?auto_684575 ) ) ( not ( = ?auto_684566 ?auto_684576 ) ) ( not ( = ?auto_684566 ?auto_684577 ) ) ( not ( = ?auto_684566 ?auto_684578 ) ) ( not ( = ?auto_684567 ?auto_684568 ) ) ( not ( = ?auto_684567 ?auto_684569 ) ) ( not ( = ?auto_684567 ?auto_684570 ) ) ( not ( = ?auto_684567 ?auto_684571 ) ) ( not ( = ?auto_684567 ?auto_684572 ) ) ( not ( = ?auto_684567 ?auto_684573 ) ) ( not ( = ?auto_684567 ?auto_684574 ) ) ( not ( = ?auto_684567 ?auto_684575 ) ) ( not ( = ?auto_684567 ?auto_684576 ) ) ( not ( = ?auto_684567 ?auto_684577 ) ) ( not ( = ?auto_684567 ?auto_684578 ) ) ( not ( = ?auto_684568 ?auto_684569 ) ) ( not ( = ?auto_684568 ?auto_684570 ) ) ( not ( = ?auto_684568 ?auto_684571 ) ) ( not ( = ?auto_684568 ?auto_684572 ) ) ( not ( = ?auto_684568 ?auto_684573 ) ) ( not ( = ?auto_684568 ?auto_684574 ) ) ( not ( = ?auto_684568 ?auto_684575 ) ) ( not ( = ?auto_684568 ?auto_684576 ) ) ( not ( = ?auto_684568 ?auto_684577 ) ) ( not ( = ?auto_684568 ?auto_684578 ) ) ( not ( = ?auto_684569 ?auto_684570 ) ) ( not ( = ?auto_684569 ?auto_684571 ) ) ( not ( = ?auto_684569 ?auto_684572 ) ) ( not ( = ?auto_684569 ?auto_684573 ) ) ( not ( = ?auto_684569 ?auto_684574 ) ) ( not ( = ?auto_684569 ?auto_684575 ) ) ( not ( = ?auto_684569 ?auto_684576 ) ) ( not ( = ?auto_684569 ?auto_684577 ) ) ( not ( = ?auto_684569 ?auto_684578 ) ) ( not ( = ?auto_684570 ?auto_684571 ) ) ( not ( = ?auto_684570 ?auto_684572 ) ) ( not ( = ?auto_684570 ?auto_684573 ) ) ( not ( = ?auto_684570 ?auto_684574 ) ) ( not ( = ?auto_684570 ?auto_684575 ) ) ( not ( = ?auto_684570 ?auto_684576 ) ) ( not ( = ?auto_684570 ?auto_684577 ) ) ( not ( = ?auto_684570 ?auto_684578 ) ) ( not ( = ?auto_684571 ?auto_684572 ) ) ( not ( = ?auto_684571 ?auto_684573 ) ) ( not ( = ?auto_684571 ?auto_684574 ) ) ( not ( = ?auto_684571 ?auto_684575 ) ) ( not ( = ?auto_684571 ?auto_684576 ) ) ( not ( = ?auto_684571 ?auto_684577 ) ) ( not ( = ?auto_684571 ?auto_684578 ) ) ( not ( = ?auto_684572 ?auto_684573 ) ) ( not ( = ?auto_684572 ?auto_684574 ) ) ( not ( = ?auto_684572 ?auto_684575 ) ) ( not ( = ?auto_684572 ?auto_684576 ) ) ( not ( = ?auto_684572 ?auto_684577 ) ) ( not ( = ?auto_684572 ?auto_684578 ) ) ( not ( = ?auto_684573 ?auto_684574 ) ) ( not ( = ?auto_684573 ?auto_684575 ) ) ( not ( = ?auto_684573 ?auto_684576 ) ) ( not ( = ?auto_684573 ?auto_684577 ) ) ( not ( = ?auto_684573 ?auto_684578 ) ) ( not ( = ?auto_684574 ?auto_684575 ) ) ( not ( = ?auto_684574 ?auto_684576 ) ) ( not ( = ?auto_684574 ?auto_684577 ) ) ( not ( = ?auto_684574 ?auto_684578 ) ) ( not ( = ?auto_684575 ?auto_684576 ) ) ( not ( = ?auto_684575 ?auto_684577 ) ) ( not ( = ?auto_684575 ?auto_684578 ) ) ( not ( = ?auto_684576 ?auto_684577 ) ) ( not ( = ?auto_684576 ?auto_684578 ) ) ( not ( = ?auto_684577 ?auto_684578 ) ) ( ON ?auto_684576 ?auto_684577 ) ( ON ?auto_684575 ?auto_684576 ) ( ON ?auto_684574 ?auto_684575 ) ( ON ?auto_684573 ?auto_684574 ) ( CLEAR ?auto_684571 ) ( ON ?auto_684572 ?auto_684573 ) ( CLEAR ?auto_684572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_684563 ?auto_684564 ?auto_684565 ?auto_684566 ?auto_684567 ?auto_684568 ?auto_684569 ?auto_684570 ?auto_684571 ?auto_684572 )
      ( MAKE-15PILE ?auto_684563 ?auto_684564 ?auto_684565 ?auto_684566 ?auto_684567 ?auto_684568 ?auto_684569 ?auto_684570 ?auto_684571 ?auto_684572 ?auto_684573 ?auto_684574 ?auto_684575 ?auto_684576 ?auto_684577 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_684625 - BLOCK
      ?auto_684626 - BLOCK
      ?auto_684627 - BLOCK
      ?auto_684628 - BLOCK
      ?auto_684629 - BLOCK
      ?auto_684630 - BLOCK
      ?auto_684631 - BLOCK
      ?auto_684632 - BLOCK
      ?auto_684633 - BLOCK
      ?auto_684634 - BLOCK
      ?auto_684635 - BLOCK
      ?auto_684636 - BLOCK
      ?auto_684637 - BLOCK
      ?auto_684638 - BLOCK
      ?auto_684639 - BLOCK
    )
    :vars
    (
      ?auto_684640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_684639 ?auto_684640 ) ( ON-TABLE ?auto_684625 ) ( ON ?auto_684626 ?auto_684625 ) ( ON ?auto_684627 ?auto_684626 ) ( ON ?auto_684628 ?auto_684627 ) ( ON ?auto_684629 ?auto_684628 ) ( ON ?auto_684630 ?auto_684629 ) ( ON ?auto_684631 ?auto_684630 ) ( ON ?auto_684632 ?auto_684631 ) ( not ( = ?auto_684625 ?auto_684626 ) ) ( not ( = ?auto_684625 ?auto_684627 ) ) ( not ( = ?auto_684625 ?auto_684628 ) ) ( not ( = ?auto_684625 ?auto_684629 ) ) ( not ( = ?auto_684625 ?auto_684630 ) ) ( not ( = ?auto_684625 ?auto_684631 ) ) ( not ( = ?auto_684625 ?auto_684632 ) ) ( not ( = ?auto_684625 ?auto_684633 ) ) ( not ( = ?auto_684625 ?auto_684634 ) ) ( not ( = ?auto_684625 ?auto_684635 ) ) ( not ( = ?auto_684625 ?auto_684636 ) ) ( not ( = ?auto_684625 ?auto_684637 ) ) ( not ( = ?auto_684625 ?auto_684638 ) ) ( not ( = ?auto_684625 ?auto_684639 ) ) ( not ( = ?auto_684625 ?auto_684640 ) ) ( not ( = ?auto_684626 ?auto_684627 ) ) ( not ( = ?auto_684626 ?auto_684628 ) ) ( not ( = ?auto_684626 ?auto_684629 ) ) ( not ( = ?auto_684626 ?auto_684630 ) ) ( not ( = ?auto_684626 ?auto_684631 ) ) ( not ( = ?auto_684626 ?auto_684632 ) ) ( not ( = ?auto_684626 ?auto_684633 ) ) ( not ( = ?auto_684626 ?auto_684634 ) ) ( not ( = ?auto_684626 ?auto_684635 ) ) ( not ( = ?auto_684626 ?auto_684636 ) ) ( not ( = ?auto_684626 ?auto_684637 ) ) ( not ( = ?auto_684626 ?auto_684638 ) ) ( not ( = ?auto_684626 ?auto_684639 ) ) ( not ( = ?auto_684626 ?auto_684640 ) ) ( not ( = ?auto_684627 ?auto_684628 ) ) ( not ( = ?auto_684627 ?auto_684629 ) ) ( not ( = ?auto_684627 ?auto_684630 ) ) ( not ( = ?auto_684627 ?auto_684631 ) ) ( not ( = ?auto_684627 ?auto_684632 ) ) ( not ( = ?auto_684627 ?auto_684633 ) ) ( not ( = ?auto_684627 ?auto_684634 ) ) ( not ( = ?auto_684627 ?auto_684635 ) ) ( not ( = ?auto_684627 ?auto_684636 ) ) ( not ( = ?auto_684627 ?auto_684637 ) ) ( not ( = ?auto_684627 ?auto_684638 ) ) ( not ( = ?auto_684627 ?auto_684639 ) ) ( not ( = ?auto_684627 ?auto_684640 ) ) ( not ( = ?auto_684628 ?auto_684629 ) ) ( not ( = ?auto_684628 ?auto_684630 ) ) ( not ( = ?auto_684628 ?auto_684631 ) ) ( not ( = ?auto_684628 ?auto_684632 ) ) ( not ( = ?auto_684628 ?auto_684633 ) ) ( not ( = ?auto_684628 ?auto_684634 ) ) ( not ( = ?auto_684628 ?auto_684635 ) ) ( not ( = ?auto_684628 ?auto_684636 ) ) ( not ( = ?auto_684628 ?auto_684637 ) ) ( not ( = ?auto_684628 ?auto_684638 ) ) ( not ( = ?auto_684628 ?auto_684639 ) ) ( not ( = ?auto_684628 ?auto_684640 ) ) ( not ( = ?auto_684629 ?auto_684630 ) ) ( not ( = ?auto_684629 ?auto_684631 ) ) ( not ( = ?auto_684629 ?auto_684632 ) ) ( not ( = ?auto_684629 ?auto_684633 ) ) ( not ( = ?auto_684629 ?auto_684634 ) ) ( not ( = ?auto_684629 ?auto_684635 ) ) ( not ( = ?auto_684629 ?auto_684636 ) ) ( not ( = ?auto_684629 ?auto_684637 ) ) ( not ( = ?auto_684629 ?auto_684638 ) ) ( not ( = ?auto_684629 ?auto_684639 ) ) ( not ( = ?auto_684629 ?auto_684640 ) ) ( not ( = ?auto_684630 ?auto_684631 ) ) ( not ( = ?auto_684630 ?auto_684632 ) ) ( not ( = ?auto_684630 ?auto_684633 ) ) ( not ( = ?auto_684630 ?auto_684634 ) ) ( not ( = ?auto_684630 ?auto_684635 ) ) ( not ( = ?auto_684630 ?auto_684636 ) ) ( not ( = ?auto_684630 ?auto_684637 ) ) ( not ( = ?auto_684630 ?auto_684638 ) ) ( not ( = ?auto_684630 ?auto_684639 ) ) ( not ( = ?auto_684630 ?auto_684640 ) ) ( not ( = ?auto_684631 ?auto_684632 ) ) ( not ( = ?auto_684631 ?auto_684633 ) ) ( not ( = ?auto_684631 ?auto_684634 ) ) ( not ( = ?auto_684631 ?auto_684635 ) ) ( not ( = ?auto_684631 ?auto_684636 ) ) ( not ( = ?auto_684631 ?auto_684637 ) ) ( not ( = ?auto_684631 ?auto_684638 ) ) ( not ( = ?auto_684631 ?auto_684639 ) ) ( not ( = ?auto_684631 ?auto_684640 ) ) ( not ( = ?auto_684632 ?auto_684633 ) ) ( not ( = ?auto_684632 ?auto_684634 ) ) ( not ( = ?auto_684632 ?auto_684635 ) ) ( not ( = ?auto_684632 ?auto_684636 ) ) ( not ( = ?auto_684632 ?auto_684637 ) ) ( not ( = ?auto_684632 ?auto_684638 ) ) ( not ( = ?auto_684632 ?auto_684639 ) ) ( not ( = ?auto_684632 ?auto_684640 ) ) ( not ( = ?auto_684633 ?auto_684634 ) ) ( not ( = ?auto_684633 ?auto_684635 ) ) ( not ( = ?auto_684633 ?auto_684636 ) ) ( not ( = ?auto_684633 ?auto_684637 ) ) ( not ( = ?auto_684633 ?auto_684638 ) ) ( not ( = ?auto_684633 ?auto_684639 ) ) ( not ( = ?auto_684633 ?auto_684640 ) ) ( not ( = ?auto_684634 ?auto_684635 ) ) ( not ( = ?auto_684634 ?auto_684636 ) ) ( not ( = ?auto_684634 ?auto_684637 ) ) ( not ( = ?auto_684634 ?auto_684638 ) ) ( not ( = ?auto_684634 ?auto_684639 ) ) ( not ( = ?auto_684634 ?auto_684640 ) ) ( not ( = ?auto_684635 ?auto_684636 ) ) ( not ( = ?auto_684635 ?auto_684637 ) ) ( not ( = ?auto_684635 ?auto_684638 ) ) ( not ( = ?auto_684635 ?auto_684639 ) ) ( not ( = ?auto_684635 ?auto_684640 ) ) ( not ( = ?auto_684636 ?auto_684637 ) ) ( not ( = ?auto_684636 ?auto_684638 ) ) ( not ( = ?auto_684636 ?auto_684639 ) ) ( not ( = ?auto_684636 ?auto_684640 ) ) ( not ( = ?auto_684637 ?auto_684638 ) ) ( not ( = ?auto_684637 ?auto_684639 ) ) ( not ( = ?auto_684637 ?auto_684640 ) ) ( not ( = ?auto_684638 ?auto_684639 ) ) ( not ( = ?auto_684638 ?auto_684640 ) ) ( not ( = ?auto_684639 ?auto_684640 ) ) ( ON ?auto_684638 ?auto_684639 ) ( ON ?auto_684637 ?auto_684638 ) ( ON ?auto_684636 ?auto_684637 ) ( ON ?auto_684635 ?auto_684636 ) ( ON ?auto_684634 ?auto_684635 ) ( CLEAR ?auto_684632 ) ( ON ?auto_684633 ?auto_684634 ) ( CLEAR ?auto_684633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_684625 ?auto_684626 ?auto_684627 ?auto_684628 ?auto_684629 ?auto_684630 ?auto_684631 ?auto_684632 ?auto_684633 )
      ( MAKE-15PILE ?auto_684625 ?auto_684626 ?auto_684627 ?auto_684628 ?auto_684629 ?auto_684630 ?auto_684631 ?auto_684632 ?auto_684633 ?auto_684634 ?auto_684635 ?auto_684636 ?auto_684637 ?auto_684638 ?auto_684639 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_684687 - BLOCK
      ?auto_684688 - BLOCK
      ?auto_684689 - BLOCK
      ?auto_684690 - BLOCK
      ?auto_684691 - BLOCK
      ?auto_684692 - BLOCK
      ?auto_684693 - BLOCK
      ?auto_684694 - BLOCK
      ?auto_684695 - BLOCK
      ?auto_684696 - BLOCK
      ?auto_684697 - BLOCK
      ?auto_684698 - BLOCK
      ?auto_684699 - BLOCK
      ?auto_684700 - BLOCK
      ?auto_684701 - BLOCK
    )
    :vars
    (
      ?auto_684702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_684701 ?auto_684702 ) ( ON-TABLE ?auto_684687 ) ( ON ?auto_684688 ?auto_684687 ) ( ON ?auto_684689 ?auto_684688 ) ( ON ?auto_684690 ?auto_684689 ) ( ON ?auto_684691 ?auto_684690 ) ( ON ?auto_684692 ?auto_684691 ) ( ON ?auto_684693 ?auto_684692 ) ( not ( = ?auto_684687 ?auto_684688 ) ) ( not ( = ?auto_684687 ?auto_684689 ) ) ( not ( = ?auto_684687 ?auto_684690 ) ) ( not ( = ?auto_684687 ?auto_684691 ) ) ( not ( = ?auto_684687 ?auto_684692 ) ) ( not ( = ?auto_684687 ?auto_684693 ) ) ( not ( = ?auto_684687 ?auto_684694 ) ) ( not ( = ?auto_684687 ?auto_684695 ) ) ( not ( = ?auto_684687 ?auto_684696 ) ) ( not ( = ?auto_684687 ?auto_684697 ) ) ( not ( = ?auto_684687 ?auto_684698 ) ) ( not ( = ?auto_684687 ?auto_684699 ) ) ( not ( = ?auto_684687 ?auto_684700 ) ) ( not ( = ?auto_684687 ?auto_684701 ) ) ( not ( = ?auto_684687 ?auto_684702 ) ) ( not ( = ?auto_684688 ?auto_684689 ) ) ( not ( = ?auto_684688 ?auto_684690 ) ) ( not ( = ?auto_684688 ?auto_684691 ) ) ( not ( = ?auto_684688 ?auto_684692 ) ) ( not ( = ?auto_684688 ?auto_684693 ) ) ( not ( = ?auto_684688 ?auto_684694 ) ) ( not ( = ?auto_684688 ?auto_684695 ) ) ( not ( = ?auto_684688 ?auto_684696 ) ) ( not ( = ?auto_684688 ?auto_684697 ) ) ( not ( = ?auto_684688 ?auto_684698 ) ) ( not ( = ?auto_684688 ?auto_684699 ) ) ( not ( = ?auto_684688 ?auto_684700 ) ) ( not ( = ?auto_684688 ?auto_684701 ) ) ( not ( = ?auto_684688 ?auto_684702 ) ) ( not ( = ?auto_684689 ?auto_684690 ) ) ( not ( = ?auto_684689 ?auto_684691 ) ) ( not ( = ?auto_684689 ?auto_684692 ) ) ( not ( = ?auto_684689 ?auto_684693 ) ) ( not ( = ?auto_684689 ?auto_684694 ) ) ( not ( = ?auto_684689 ?auto_684695 ) ) ( not ( = ?auto_684689 ?auto_684696 ) ) ( not ( = ?auto_684689 ?auto_684697 ) ) ( not ( = ?auto_684689 ?auto_684698 ) ) ( not ( = ?auto_684689 ?auto_684699 ) ) ( not ( = ?auto_684689 ?auto_684700 ) ) ( not ( = ?auto_684689 ?auto_684701 ) ) ( not ( = ?auto_684689 ?auto_684702 ) ) ( not ( = ?auto_684690 ?auto_684691 ) ) ( not ( = ?auto_684690 ?auto_684692 ) ) ( not ( = ?auto_684690 ?auto_684693 ) ) ( not ( = ?auto_684690 ?auto_684694 ) ) ( not ( = ?auto_684690 ?auto_684695 ) ) ( not ( = ?auto_684690 ?auto_684696 ) ) ( not ( = ?auto_684690 ?auto_684697 ) ) ( not ( = ?auto_684690 ?auto_684698 ) ) ( not ( = ?auto_684690 ?auto_684699 ) ) ( not ( = ?auto_684690 ?auto_684700 ) ) ( not ( = ?auto_684690 ?auto_684701 ) ) ( not ( = ?auto_684690 ?auto_684702 ) ) ( not ( = ?auto_684691 ?auto_684692 ) ) ( not ( = ?auto_684691 ?auto_684693 ) ) ( not ( = ?auto_684691 ?auto_684694 ) ) ( not ( = ?auto_684691 ?auto_684695 ) ) ( not ( = ?auto_684691 ?auto_684696 ) ) ( not ( = ?auto_684691 ?auto_684697 ) ) ( not ( = ?auto_684691 ?auto_684698 ) ) ( not ( = ?auto_684691 ?auto_684699 ) ) ( not ( = ?auto_684691 ?auto_684700 ) ) ( not ( = ?auto_684691 ?auto_684701 ) ) ( not ( = ?auto_684691 ?auto_684702 ) ) ( not ( = ?auto_684692 ?auto_684693 ) ) ( not ( = ?auto_684692 ?auto_684694 ) ) ( not ( = ?auto_684692 ?auto_684695 ) ) ( not ( = ?auto_684692 ?auto_684696 ) ) ( not ( = ?auto_684692 ?auto_684697 ) ) ( not ( = ?auto_684692 ?auto_684698 ) ) ( not ( = ?auto_684692 ?auto_684699 ) ) ( not ( = ?auto_684692 ?auto_684700 ) ) ( not ( = ?auto_684692 ?auto_684701 ) ) ( not ( = ?auto_684692 ?auto_684702 ) ) ( not ( = ?auto_684693 ?auto_684694 ) ) ( not ( = ?auto_684693 ?auto_684695 ) ) ( not ( = ?auto_684693 ?auto_684696 ) ) ( not ( = ?auto_684693 ?auto_684697 ) ) ( not ( = ?auto_684693 ?auto_684698 ) ) ( not ( = ?auto_684693 ?auto_684699 ) ) ( not ( = ?auto_684693 ?auto_684700 ) ) ( not ( = ?auto_684693 ?auto_684701 ) ) ( not ( = ?auto_684693 ?auto_684702 ) ) ( not ( = ?auto_684694 ?auto_684695 ) ) ( not ( = ?auto_684694 ?auto_684696 ) ) ( not ( = ?auto_684694 ?auto_684697 ) ) ( not ( = ?auto_684694 ?auto_684698 ) ) ( not ( = ?auto_684694 ?auto_684699 ) ) ( not ( = ?auto_684694 ?auto_684700 ) ) ( not ( = ?auto_684694 ?auto_684701 ) ) ( not ( = ?auto_684694 ?auto_684702 ) ) ( not ( = ?auto_684695 ?auto_684696 ) ) ( not ( = ?auto_684695 ?auto_684697 ) ) ( not ( = ?auto_684695 ?auto_684698 ) ) ( not ( = ?auto_684695 ?auto_684699 ) ) ( not ( = ?auto_684695 ?auto_684700 ) ) ( not ( = ?auto_684695 ?auto_684701 ) ) ( not ( = ?auto_684695 ?auto_684702 ) ) ( not ( = ?auto_684696 ?auto_684697 ) ) ( not ( = ?auto_684696 ?auto_684698 ) ) ( not ( = ?auto_684696 ?auto_684699 ) ) ( not ( = ?auto_684696 ?auto_684700 ) ) ( not ( = ?auto_684696 ?auto_684701 ) ) ( not ( = ?auto_684696 ?auto_684702 ) ) ( not ( = ?auto_684697 ?auto_684698 ) ) ( not ( = ?auto_684697 ?auto_684699 ) ) ( not ( = ?auto_684697 ?auto_684700 ) ) ( not ( = ?auto_684697 ?auto_684701 ) ) ( not ( = ?auto_684697 ?auto_684702 ) ) ( not ( = ?auto_684698 ?auto_684699 ) ) ( not ( = ?auto_684698 ?auto_684700 ) ) ( not ( = ?auto_684698 ?auto_684701 ) ) ( not ( = ?auto_684698 ?auto_684702 ) ) ( not ( = ?auto_684699 ?auto_684700 ) ) ( not ( = ?auto_684699 ?auto_684701 ) ) ( not ( = ?auto_684699 ?auto_684702 ) ) ( not ( = ?auto_684700 ?auto_684701 ) ) ( not ( = ?auto_684700 ?auto_684702 ) ) ( not ( = ?auto_684701 ?auto_684702 ) ) ( ON ?auto_684700 ?auto_684701 ) ( ON ?auto_684699 ?auto_684700 ) ( ON ?auto_684698 ?auto_684699 ) ( ON ?auto_684697 ?auto_684698 ) ( ON ?auto_684696 ?auto_684697 ) ( ON ?auto_684695 ?auto_684696 ) ( CLEAR ?auto_684693 ) ( ON ?auto_684694 ?auto_684695 ) ( CLEAR ?auto_684694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_684687 ?auto_684688 ?auto_684689 ?auto_684690 ?auto_684691 ?auto_684692 ?auto_684693 ?auto_684694 )
      ( MAKE-15PILE ?auto_684687 ?auto_684688 ?auto_684689 ?auto_684690 ?auto_684691 ?auto_684692 ?auto_684693 ?auto_684694 ?auto_684695 ?auto_684696 ?auto_684697 ?auto_684698 ?auto_684699 ?auto_684700 ?auto_684701 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_684749 - BLOCK
      ?auto_684750 - BLOCK
      ?auto_684751 - BLOCK
      ?auto_684752 - BLOCK
      ?auto_684753 - BLOCK
      ?auto_684754 - BLOCK
      ?auto_684755 - BLOCK
      ?auto_684756 - BLOCK
      ?auto_684757 - BLOCK
      ?auto_684758 - BLOCK
      ?auto_684759 - BLOCK
      ?auto_684760 - BLOCK
      ?auto_684761 - BLOCK
      ?auto_684762 - BLOCK
      ?auto_684763 - BLOCK
    )
    :vars
    (
      ?auto_684764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_684763 ?auto_684764 ) ( ON-TABLE ?auto_684749 ) ( ON ?auto_684750 ?auto_684749 ) ( ON ?auto_684751 ?auto_684750 ) ( ON ?auto_684752 ?auto_684751 ) ( ON ?auto_684753 ?auto_684752 ) ( ON ?auto_684754 ?auto_684753 ) ( not ( = ?auto_684749 ?auto_684750 ) ) ( not ( = ?auto_684749 ?auto_684751 ) ) ( not ( = ?auto_684749 ?auto_684752 ) ) ( not ( = ?auto_684749 ?auto_684753 ) ) ( not ( = ?auto_684749 ?auto_684754 ) ) ( not ( = ?auto_684749 ?auto_684755 ) ) ( not ( = ?auto_684749 ?auto_684756 ) ) ( not ( = ?auto_684749 ?auto_684757 ) ) ( not ( = ?auto_684749 ?auto_684758 ) ) ( not ( = ?auto_684749 ?auto_684759 ) ) ( not ( = ?auto_684749 ?auto_684760 ) ) ( not ( = ?auto_684749 ?auto_684761 ) ) ( not ( = ?auto_684749 ?auto_684762 ) ) ( not ( = ?auto_684749 ?auto_684763 ) ) ( not ( = ?auto_684749 ?auto_684764 ) ) ( not ( = ?auto_684750 ?auto_684751 ) ) ( not ( = ?auto_684750 ?auto_684752 ) ) ( not ( = ?auto_684750 ?auto_684753 ) ) ( not ( = ?auto_684750 ?auto_684754 ) ) ( not ( = ?auto_684750 ?auto_684755 ) ) ( not ( = ?auto_684750 ?auto_684756 ) ) ( not ( = ?auto_684750 ?auto_684757 ) ) ( not ( = ?auto_684750 ?auto_684758 ) ) ( not ( = ?auto_684750 ?auto_684759 ) ) ( not ( = ?auto_684750 ?auto_684760 ) ) ( not ( = ?auto_684750 ?auto_684761 ) ) ( not ( = ?auto_684750 ?auto_684762 ) ) ( not ( = ?auto_684750 ?auto_684763 ) ) ( not ( = ?auto_684750 ?auto_684764 ) ) ( not ( = ?auto_684751 ?auto_684752 ) ) ( not ( = ?auto_684751 ?auto_684753 ) ) ( not ( = ?auto_684751 ?auto_684754 ) ) ( not ( = ?auto_684751 ?auto_684755 ) ) ( not ( = ?auto_684751 ?auto_684756 ) ) ( not ( = ?auto_684751 ?auto_684757 ) ) ( not ( = ?auto_684751 ?auto_684758 ) ) ( not ( = ?auto_684751 ?auto_684759 ) ) ( not ( = ?auto_684751 ?auto_684760 ) ) ( not ( = ?auto_684751 ?auto_684761 ) ) ( not ( = ?auto_684751 ?auto_684762 ) ) ( not ( = ?auto_684751 ?auto_684763 ) ) ( not ( = ?auto_684751 ?auto_684764 ) ) ( not ( = ?auto_684752 ?auto_684753 ) ) ( not ( = ?auto_684752 ?auto_684754 ) ) ( not ( = ?auto_684752 ?auto_684755 ) ) ( not ( = ?auto_684752 ?auto_684756 ) ) ( not ( = ?auto_684752 ?auto_684757 ) ) ( not ( = ?auto_684752 ?auto_684758 ) ) ( not ( = ?auto_684752 ?auto_684759 ) ) ( not ( = ?auto_684752 ?auto_684760 ) ) ( not ( = ?auto_684752 ?auto_684761 ) ) ( not ( = ?auto_684752 ?auto_684762 ) ) ( not ( = ?auto_684752 ?auto_684763 ) ) ( not ( = ?auto_684752 ?auto_684764 ) ) ( not ( = ?auto_684753 ?auto_684754 ) ) ( not ( = ?auto_684753 ?auto_684755 ) ) ( not ( = ?auto_684753 ?auto_684756 ) ) ( not ( = ?auto_684753 ?auto_684757 ) ) ( not ( = ?auto_684753 ?auto_684758 ) ) ( not ( = ?auto_684753 ?auto_684759 ) ) ( not ( = ?auto_684753 ?auto_684760 ) ) ( not ( = ?auto_684753 ?auto_684761 ) ) ( not ( = ?auto_684753 ?auto_684762 ) ) ( not ( = ?auto_684753 ?auto_684763 ) ) ( not ( = ?auto_684753 ?auto_684764 ) ) ( not ( = ?auto_684754 ?auto_684755 ) ) ( not ( = ?auto_684754 ?auto_684756 ) ) ( not ( = ?auto_684754 ?auto_684757 ) ) ( not ( = ?auto_684754 ?auto_684758 ) ) ( not ( = ?auto_684754 ?auto_684759 ) ) ( not ( = ?auto_684754 ?auto_684760 ) ) ( not ( = ?auto_684754 ?auto_684761 ) ) ( not ( = ?auto_684754 ?auto_684762 ) ) ( not ( = ?auto_684754 ?auto_684763 ) ) ( not ( = ?auto_684754 ?auto_684764 ) ) ( not ( = ?auto_684755 ?auto_684756 ) ) ( not ( = ?auto_684755 ?auto_684757 ) ) ( not ( = ?auto_684755 ?auto_684758 ) ) ( not ( = ?auto_684755 ?auto_684759 ) ) ( not ( = ?auto_684755 ?auto_684760 ) ) ( not ( = ?auto_684755 ?auto_684761 ) ) ( not ( = ?auto_684755 ?auto_684762 ) ) ( not ( = ?auto_684755 ?auto_684763 ) ) ( not ( = ?auto_684755 ?auto_684764 ) ) ( not ( = ?auto_684756 ?auto_684757 ) ) ( not ( = ?auto_684756 ?auto_684758 ) ) ( not ( = ?auto_684756 ?auto_684759 ) ) ( not ( = ?auto_684756 ?auto_684760 ) ) ( not ( = ?auto_684756 ?auto_684761 ) ) ( not ( = ?auto_684756 ?auto_684762 ) ) ( not ( = ?auto_684756 ?auto_684763 ) ) ( not ( = ?auto_684756 ?auto_684764 ) ) ( not ( = ?auto_684757 ?auto_684758 ) ) ( not ( = ?auto_684757 ?auto_684759 ) ) ( not ( = ?auto_684757 ?auto_684760 ) ) ( not ( = ?auto_684757 ?auto_684761 ) ) ( not ( = ?auto_684757 ?auto_684762 ) ) ( not ( = ?auto_684757 ?auto_684763 ) ) ( not ( = ?auto_684757 ?auto_684764 ) ) ( not ( = ?auto_684758 ?auto_684759 ) ) ( not ( = ?auto_684758 ?auto_684760 ) ) ( not ( = ?auto_684758 ?auto_684761 ) ) ( not ( = ?auto_684758 ?auto_684762 ) ) ( not ( = ?auto_684758 ?auto_684763 ) ) ( not ( = ?auto_684758 ?auto_684764 ) ) ( not ( = ?auto_684759 ?auto_684760 ) ) ( not ( = ?auto_684759 ?auto_684761 ) ) ( not ( = ?auto_684759 ?auto_684762 ) ) ( not ( = ?auto_684759 ?auto_684763 ) ) ( not ( = ?auto_684759 ?auto_684764 ) ) ( not ( = ?auto_684760 ?auto_684761 ) ) ( not ( = ?auto_684760 ?auto_684762 ) ) ( not ( = ?auto_684760 ?auto_684763 ) ) ( not ( = ?auto_684760 ?auto_684764 ) ) ( not ( = ?auto_684761 ?auto_684762 ) ) ( not ( = ?auto_684761 ?auto_684763 ) ) ( not ( = ?auto_684761 ?auto_684764 ) ) ( not ( = ?auto_684762 ?auto_684763 ) ) ( not ( = ?auto_684762 ?auto_684764 ) ) ( not ( = ?auto_684763 ?auto_684764 ) ) ( ON ?auto_684762 ?auto_684763 ) ( ON ?auto_684761 ?auto_684762 ) ( ON ?auto_684760 ?auto_684761 ) ( ON ?auto_684759 ?auto_684760 ) ( ON ?auto_684758 ?auto_684759 ) ( ON ?auto_684757 ?auto_684758 ) ( ON ?auto_684756 ?auto_684757 ) ( CLEAR ?auto_684754 ) ( ON ?auto_684755 ?auto_684756 ) ( CLEAR ?auto_684755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_684749 ?auto_684750 ?auto_684751 ?auto_684752 ?auto_684753 ?auto_684754 ?auto_684755 )
      ( MAKE-15PILE ?auto_684749 ?auto_684750 ?auto_684751 ?auto_684752 ?auto_684753 ?auto_684754 ?auto_684755 ?auto_684756 ?auto_684757 ?auto_684758 ?auto_684759 ?auto_684760 ?auto_684761 ?auto_684762 ?auto_684763 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_684811 - BLOCK
      ?auto_684812 - BLOCK
      ?auto_684813 - BLOCK
      ?auto_684814 - BLOCK
      ?auto_684815 - BLOCK
      ?auto_684816 - BLOCK
      ?auto_684817 - BLOCK
      ?auto_684818 - BLOCK
      ?auto_684819 - BLOCK
      ?auto_684820 - BLOCK
      ?auto_684821 - BLOCK
      ?auto_684822 - BLOCK
      ?auto_684823 - BLOCK
      ?auto_684824 - BLOCK
      ?auto_684825 - BLOCK
    )
    :vars
    (
      ?auto_684826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_684825 ?auto_684826 ) ( ON-TABLE ?auto_684811 ) ( ON ?auto_684812 ?auto_684811 ) ( ON ?auto_684813 ?auto_684812 ) ( ON ?auto_684814 ?auto_684813 ) ( ON ?auto_684815 ?auto_684814 ) ( not ( = ?auto_684811 ?auto_684812 ) ) ( not ( = ?auto_684811 ?auto_684813 ) ) ( not ( = ?auto_684811 ?auto_684814 ) ) ( not ( = ?auto_684811 ?auto_684815 ) ) ( not ( = ?auto_684811 ?auto_684816 ) ) ( not ( = ?auto_684811 ?auto_684817 ) ) ( not ( = ?auto_684811 ?auto_684818 ) ) ( not ( = ?auto_684811 ?auto_684819 ) ) ( not ( = ?auto_684811 ?auto_684820 ) ) ( not ( = ?auto_684811 ?auto_684821 ) ) ( not ( = ?auto_684811 ?auto_684822 ) ) ( not ( = ?auto_684811 ?auto_684823 ) ) ( not ( = ?auto_684811 ?auto_684824 ) ) ( not ( = ?auto_684811 ?auto_684825 ) ) ( not ( = ?auto_684811 ?auto_684826 ) ) ( not ( = ?auto_684812 ?auto_684813 ) ) ( not ( = ?auto_684812 ?auto_684814 ) ) ( not ( = ?auto_684812 ?auto_684815 ) ) ( not ( = ?auto_684812 ?auto_684816 ) ) ( not ( = ?auto_684812 ?auto_684817 ) ) ( not ( = ?auto_684812 ?auto_684818 ) ) ( not ( = ?auto_684812 ?auto_684819 ) ) ( not ( = ?auto_684812 ?auto_684820 ) ) ( not ( = ?auto_684812 ?auto_684821 ) ) ( not ( = ?auto_684812 ?auto_684822 ) ) ( not ( = ?auto_684812 ?auto_684823 ) ) ( not ( = ?auto_684812 ?auto_684824 ) ) ( not ( = ?auto_684812 ?auto_684825 ) ) ( not ( = ?auto_684812 ?auto_684826 ) ) ( not ( = ?auto_684813 ?auto_684814 ) ) ( not ( = ?auto_684813 ?auto_684815 ) ) ( not ( = ?auto_684813 ?auto_684816 ) ) ( not ( = ?auto_684813 ?auto_684817 ) ) ( not ( = ?auto_684813 ?auto_684818 ) ) ( not ( = ?auto_684813 ?auto_684819 ) ) ( not ( = ?auto_684813 ?auto_684820 ) ) ( not ( = ?auto_684813 ?auto_684821 ) ) ( not ( = ?auto_684813 ?auto_684822 ) ) ( not ( = ?auto_684813 ?auto_684823 ) ) ( not ( = ?auto_684813 ?auto_684824 ) ) ( not ( = ?auto_684813 ?auto_684825 ) ) ( not ( = ?auto_684813 ?auto_684826 ) ) ( not ( = ?auto_684814 ?auto_684815 ) ) ( not ( = ?auto_684814 ?auto_684816 ) ) ( not ( = ?auto_684814 ?auto_684817 ) ) ( not ( = ?auto_684814 ?auto_684818 ) ) ( not ( = ?auto_684814 ?auto_684819 ) ) ( not ( = ?auto_684814 ?auto_684820 ) ) ( not ( = ?auto_684814 ?auto_684821 ) ) ( not ( = ?auto_684814 ?auto_684822 ) ) ( not ( = ?auto_684814 ?auto_684823 ) ) ( not ( = ?auto_684814 ?auto_684824 ) ) ( not ( = ?auto_684814 ?auto_684825 ) ) ( not ( = ?auto_684814 ?auto_684826 ) ) ( not ( = ?auto_684815 ?auto_684816 ) ) ( not ( = ?auto_684815 ?auto_684817 ) ) ( not ( = ?auto_684815 ?auto_684818 ) ) ( not ( = ?auto_684815 ?auto_684819 ) ) ( not ( = ?auto_684815 ?auto_684820 ) ) ( not ( = ?auto_684815 ?auto_684821 ) ) ( not ( = ?auto_684815 ?auto_684822 ) ) ( not ( = ?auto_684815 ?auto_684823 ) ) ( not ( = ?auto_684815 ?auto_684824 ) ) ( not ( = ?auto_684815 ?auto_684825 ) ) ( not ( = ?auto_684815 ?auto_684826 ) ) ( not ( = ?auto_684816 ?auto_684817 ) ) ( not ( = ?auto_684816 ?auto_684818 ) ) ( not ( = ?auto_684816 ?auto_684819 ) ) ( not ( = ?auto_684816 ?auto_684820 ) ) ( not ( = ?auto_684816 ?auto_684821 ) ) ( not ( = ?auto_684816 ?auto_684822 ) ) ( not ( = ?auto_684816 ?auto_684823 ) ) ( not ( = ?auto_684816 ?auto_684824 ) ) ( not ( = ?auto_684816 ?auto_684825 ) ) ( not ( = ?auto_684816 ?auto_684826 ) ) ( not ( = ?auto_684817 ?auto_684818 ) ) ( not ( = ?auto_684817 ?auto_684819 ) ) ( not ( = ?auto_684817 ?auto_684820 ) ) ( not ( = ?auto_684817 ?auto_684821 ) ) ( not ( = ?auto_684817 ?auto_684822 ) ) ( not ( = ?auto_684817 ?auto_684823 ) ) ( not ( = ?auto_684817 ?auto_684824 ) ) ( not ( = ?auto_684817 ?auto_684825 ) ) ( not ( = ?auto_684817 ?auto_684826 ) ) ( not ( = ?auto_684818 ?auto_684819 ) ) ( not ( = ?auto_684818 ?auto_684820 ) ) ( not ( = ?auto_684818 ?auto_684821 ) ) ( not ( = ?auto_684818 ?auto_684822 ) ) ( not ( = ?auto_684818 ?auto_684823 ) ) ( not ( = ?auto_684818 ?auto_684824 ) ) ( not ( = ?auto_684818 ?auto_684825 ) ) ( not ( = ?auto_684818 ?auto_684826 ) ) ( not ( = ?auto_684819 ?auto_684820 ) ) ( not ( = ?auto_684819 ?auto_684821 ) ) ( not ( = ?auto_684819 ?auto_684822 ) ) ( not ( = ?auto_684819 ?auto_684823 ) ) ( not ( = ?auto_684819 ?auto_684824 ) ) ( not ( = ?auto_684819 ?auto_684825 ) ) ( not ( = ?auto_684819 ?auto_684826 ) ) ( not ( = ?auto_684820 ?auto_684821 ) ) ( not ( = ?auto_684820 ?auto_684822 ) ) ( not ( = ?auto_684820 ?auto_684823 ) ) ( not ( = ?auto_684820 ?auto_684824 ) ) ( not ( = ?auto_684820 ?auto_684825 ) ) ( not ( = ?auto_684820 ?auto_684826 ) ) ( not ( = ?auto_684821 ?auto_684822 ) ) ( not ( = ?auto_684821 ?auto_684823 ) ) ( not ( = ?auto_684821 ?auto_684824 ) ) ( not ( = ?auto_684821 ?auto_684825 ) ) ( not ( = ?auto_684821 ?auto_684826 ) ) ( not ( = ?auto_684822 ?auto_684823 ) ) ( not ( = ?auto_684822 ?auto_684824 ) ) ( not ( = ?auto_684822 ?auto_684825 ) ) ( not ( = ?auto_684822 ?auto_684826 ) ) ( not ( = ?auto_684823 ?auto_684824 ) ) ( not ( = ?auto_684823 ?auto_684825 ) ) ( not ( = ?auto_684823 ?auto_684826 ) ) ( not ( = ?auto_684824 ?auto_684825 ) ) ( not ( = ?auto_684824 ?auto_684826 ) ) ( not ( = ?auto_684825 ?auto_684826 ) ) ( ON ?auto_684824 ?auto_684825 ) ( ON ?auto_684823 ?auto_684824 ) ( ON ?auto_684822 ?auto_684823 ) ( ON ?auto_684821 ?auto_684822 ) ( ON ?auto_684820 ?auto_684821 ) ( ON ?auto_684819 ?auto_684820 ) ( ON ?auto_684818 ?auto_684819 ) ( ON ?auto_684817 ?auto_684818 ) ( CLEAR ?auto_684815 ) ( ON ?auto_684816 ?auto_684817 ) ( CLEAR ?auto_684816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_684811 ?auto_684812 ?auto_684813 ?auto_684814 ?auto_684815 ?auto_684816 )
      ( MAKE-15PILE ?auto_684811 ?auto_684812 ?auto_684813 ?auto_684814 ?auto_684815 ?auto_684816 ?auto_684817 ?auto_684818 ?auto_684819 ?auto_684820 ?auto_684821 ?auto_684822 ?auto_684823 ?auto_684824 ?auto_684825 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_684873 - BLOCK
      ?auto_684874 - BLOCK
      ?auto_684875 - BLOCK
      ?auto_684876 - BLOCK
      ?auto_684877 - BLOCK
      ?auto_684878 - BLOCK
      ?auto_684879 - BLOCK
      ?auto_684880 - BLOCK
      ?auto_684881 - BLOCK
      ?auto_684882 - BLOCK
      ?auto_684883 - BLOCK
      ?auto_684884 - BLOCK
      ?auto_684885 - BLOCK
      ?auto_684886 - BLOCK
      ?auto_684887 - BLOCK
    )
    :vars
    (
      ?auto_684888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_684887 ?auto_684888 ) ( ON-TABLE ?auto_684873 ) ( ON ?auto_684874 ?auto_684873 ) ( ON ?auto_684875 ?auto_684874 ) ( ON ?auto_684876 ?auto_684875 ) ( not ( = ?auto_684873 ?auto_684874 ) ) ( not ( = ?auto_684873 ?auto_684875 ) ) ( not ( = ?auto_684873 ?auto_684876 ) ) ( not ( = ?auto_684873 ?auto_684877 ) ) ( not ( = ?auto_684873 ?auto_684878 ) ) ( not ( = ?auto_684873 ?auto_684879 ) ) ( not ( = ?auto_684873 ?auto_684880 ) ) ( not ( = ?auto_684873 ?auto_684881 ) ) ( not ( = ?auto_684873 ?auto_684882 ) ) ( not ( = ?auto_684873 ?auto_684883 ) ) ( not ( = ?auto_684873 ?auto_684884 ) ) ( not ( = ?auto_684873 ?auto_684885 ) ) ( not ( = ?auto_684873 ?auto_684886 ) ) ( not ( = ?auto_684873 ?auto_684887 ) ) ( not ( = ?auto_684873 ?auto_684888 ) ) ( not ( = ?auto_684874 ?auto_684875 ) ) ( not ( = ?auto_684874 ?auto_684876 ) ) ( not ( = ?auto_684874 ?auto_684877 ) ) ( not ( = ?auto_684874 ?auto_684878 ) ) ( not ( = ?auto_684874 ?auto_684879 ) ) ( not ( = ?auto_684874 ?auto_684880 ) ) ( not ( = ?auto_684874 ?auto_684881 ) ) ( not ( = ?auto_684874 ?auto_684882 ) ) ( not ( = ?auto_684874 ?auto_684883 ) ) ( not ( = ?auto_684874 ?auto_684884 ) ) ( not ( = ?auto_684874 ?auto_684885 ) ) ( not ( = ?auto_684874 ?auto_684886 ) ) ( not ( = ?auto_684874 ?auto_684887 ) ) ( not ( = ?auto_684874 ?auto_684888 ) ) ( not ( = ?auto_684875 ?auto_684876 ) ) ( not ( = ?auto_684875 ?auto_684877 ) ) ( not ( = ?auto_684875 ?auto_684878 ) ) ( not ( = ?auto_684875 ?auto_684879 ) ) ( not ( = ?auto_684875 ?auto_684880 ) ) ( not ( = ?auto_684875 ?auto_684881 ) ) ( not ( = ?auto_684875 ?auto_684882 ) ) ( not ( = ?auto_684875 ?auto_684883 ) ) ( not ( = ?auto_684875 ?auto_684884 ) ) ( not ( = ?auto_684875 ?auto_684885 ) ) ( not ( = ?auto_684875 ?auto_684886 ) ) ( not ( = ?auto_684875 ?auto_684887 ) ) ( not ( = ?auto_684875 ?auto_684888 ) ) ( not ( = ?auto_684876 ?auto_684877 ) ) ( not ( = ?auto_684876 ?auto_684878 ) ) ( not ( = ?auto_684876 ?auto_684879 ) ) ( not ( = ?auto_684876 ?auto_684880 ) ) ( not ( = ?auto_684876 ?auto_684881 ) ) ( not ( = ?auto_684876 ?auto_684882 ) ) ( not ( = ?auto_684876 ?auto_684883 ) ) ( not ( = ?auto_684876 ?auto_684884 ) ) ( not ( = ?auto_684876 ?auto_684885 ) ) ( not ( = ?auto_684876 ?auto_684886 ) ) ( not ( = ?auto_684876 ?auto_684887 ) ) ( not ( = ?auto_684876 ?auto_684888 ) ) ( not ( = ?auto_684877 ?auto_684878 ) ) ( not ( = ?auto_684877 ?auto_684879 ) ) ( not ( = ?auto_684877 ?auto_684880 ) ) ( not ( = ?auto_684877 ?auto_684881 ) ) ( not ( = ?auto_684877 ?auto_684882 ) ) ( not ( = ?auto_684877 ?auto_684883 ) ) ( not ( = ?auto_684877 ?auto_684884 ) ) ( not ( = ?auto_684877 ?auto_684885 ) ) ( not ( = ?auto_684877 ?auto_684886 ) ) ( not ( = ?auto_684877 ?auto_684887 ) ) ( not ( = ?auto_684877 ?auto_684888 ) ) ( not ( = ?auto_684878 ?auto_684879 ) ) ( not ( = ?auto_684878 ?auto_684880 ) ) ( not ( = ?auto_684878 ?auto_684881 ) ) ( not ( = ?auto_684878 ?auto_684882 ) ) ( not ( = ?auto_684878 ?auto_684883 ) ) ( not ( = ?auto_684878 ?auto_684884 ) ) ( not ( = ?auto_684878 ?auto_684885 ) ) ( not ( = ?auto_684878 ?auto_684886 ) ) ( not ( = ?auto_684878 ?auto_684887 ) ) ( not ( = ?auto_684878 ?auto_684888 ) ) ( not ( = ?auto_684879 ?auto_684880 ) ) ( not ( = ?auto_684879 ?auto_684881 ) ) ( not ( = ?auto_684879 ?auto_684882 ) ) ( not ( = ?auto_684879 ?auto_684883 ) ) ( not ( = ?auto_684879 ?auto_684884 ) ) ( not ( = ?auto_684879 ?auto_684885 ) ) ( not ( = ?auto_684879 ?auto_684886 ) ) ( not ( = ?auto_684879 ?auto_684887 ) ) ( not ( = ?auto_684879 ?auto_684888 ) ) ( not ( = ?auto_684880 ?auto_684881 ) ) ( not ( = ?auto_684880 ?auto_684882 ) ) ( not ( = ?auto_684880 ?auto_684883 ) ) ( not ( = ?auto_684880 ?auto_684884 ) ) ( not ( = ?auto_684880 ?auto_684885 ) ) ( not ( = ?auto_684880 ?auto_684886 ) ) ( not ( = ?auto_684880 ?auto_684887 ) ) ( not ( = ?auto_684880 ?auto_684888 ) ) ( not ( = ?auto_684881 ?auto_684882 ) ) ( not ( = ?auto_684881 ?auto_684883 ) ) ( not ( = ?auto_684881 ?auto_684884 ) ) ( not ( = ?auto_684881 ?auto_684885 ) ) ( not ( = ?auto_684881 ?auto_684886 ) ) ( not ( = ?auto_684881 ?auto_684887 ) ) ( not ( = ?auto_684881 ?auto_684888 ) ) ( not ( = ?auto_684882 ?auto_684883 ) ) ( not ( = ?auto_684882 ?auto_684884 ) ) ( not ( = ?auto_684882 ?auto_684885 ) ) ( not ( = ?auto_684882 ?auto_684886 ) ) ( not ( = ?auto_684882 ?auto_684887 ) ) ( not ( = ?auto_684882 ?auto_684888 ) ) ( not ( = ?auto_684883 ?auto_684884 ) ) ( not ( = ?auto_684883 ?auto_684885 ) ) ( not ( = ?auto_684883 ?auto_684886 ) ) ( not ( = ?auto_684883 ?auto_684887 ) ) ( not ( = ?auto_684883 ?auto_684888 ) ) ( not ( = ?auto_684884 ?auto_684885 ) ) ( not ( = ?auto_684884 ?auto_684886 ) ) ( not ( = ?auto_684884 ?auto_684887 ) ) ( not ( = ?auto_684884 ?auto_684888 ) ) ( not ( = ?auto_684885 ?auto_684886 ) ) ( not ( = ?auto_684885 ?auto_684887 ) ) ( not ( = ?auto_684885 ?auto_684888 ) ) ( not ( = ?auto_684886 ?auto_684887 ) ) ( not ( = ?auto_684886 ?auto_684888 ) ) ( not ( = ?auto_684887 ?auto_684888 ) ) ( ON ?auto_684886 ?auto_684887 ) ( ON ?auto_684885 ?auto_684886 ) ( ON ?auto_684884 ?auto_684885 ) ( ON ?auto_684883 ?auto_684884 ) ( ON ?auto_684882 ?auto_684883 ) ( ON ?auto_684881 ?auto_684882 ) ( ON ?auto_684880 ?auto_684881 ) ( ON ?auto_684879 ?auto_684880 ) ( ON ?auto_684878 ?auto_684879 ) ( CLEAR ?auto_684876 ) ( ON ?auto_684877 ?auto_684878 ) ( CLEAR ?auto_684877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_684873 ?auto_684874 ?auto_684875 ?auto_684876 ?auto_684877 )
      ( MAKE-15PILE ?auto_684873 ?auto_684874 ?auto_684875 ?auto_684876 ?auto_684877 ?auto_684878 ?auto_684879 ?auto_684880 ?auto_684881 ?auto_684882 ?auto_684883 ?auto_684884 ?auto_684885 ?auto_684886 ?auto_684887 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_684935 - BLOCK
      ?auto_684936 - BLOCK
      ?auto_684937 - BLOCK
      ?auto_684938 - BLOCK
      ?auto_684939 - BLOCK
      ?auto_684940 - BLOCK
      ?auto_684941 - BLOCK
      ?auto_684942 - BLOCK
      ?auto_684943 - BLOCK
      ?auto_684944 - BLOCK
      ?auto_684945 - BLOCK
      ?auto_684946 - BLOCK
      ?auto_684947 - BLOCK
      ?auto_684948 - BLOCK
      ?auto_684949 - BLOCK
    )
    :vars
    (
      ?auto_684950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_684949 ?auto_684950 ) ( ON-TABLE ?auto_684935 ) ( ON ?auto_684936 ?auto_684935 ) ( ON ?auto_684937 ?auto_684936 ) ( not ( = ?auto_684935 ?auto_684936 ) ) ( not ( = ?auto_684935 ?auto_684937 ) ) ( not ( = ?auto_684935 ?auto_684938 ) ) ( not ( = ?auto_684935 ?auto_684939 ) ) ( not ( = ?auto_684935 ?auto_684940 ) ) ( not ( = ?auto_684935 ?auto_684941 ) ) ( not ( = ?auto_684935 ?auto_684942 ) ) ( not ( = ?auto_684935 ?auto_684943 ) ) ( not ( = ?auto_684935 ?auto_684944 ) ) ( not ( = ?auto_684935 ?auto_684945 ) ) ( not ( = ?auto_684935 ?auto_684946 ) ) ( not ( = ?auto_684935 ?auto_684947 ) ) ( not ( = ?auto_684935 ?auto_684948 ) ) ( not ( = ?auto_684935 ?auto_684949 ) ) ( not ( = ?auto_684935 ?auto_684950 ) ) ( not ( = ?auto_684936 ?auto_684937 ) ) ( not ( = ?auto_684936 ?auto_684938 ) ) ( not ( = ?auto_684936 ?auto_684939 ) ) ( not ( = ?auto_684936 ?auto_684940 ) ) ( not ( = ?auto_684936 ?auto_684941 ) ) ( not ( = ?auto_684936 ?auto_684942 ) ) ( not ( = ?auto_684936 ?auto_684943 ) ) ( not ( = ?auto_684936 ?auto_684944 ) ) ( not ( = ?auto_684936 ?auto_684945 ) ) ( not ( = ?auto_684936 ?auto_684946 ) ) ( not ( = ?auto_684936 ?auto_684947 ) ) ( not ( = ?auto_684936 ?auto_684948 ) ) ( not ( = ?auto_684936 ?auto_684949 ) ) ( not ( = ?auto_684936 ?auto_684950 ) ) ( not ( = ?auto_684937 ?auto_684938 ) ) ( not ( = ?auto_684937 ?auto_684939 ) ) ( not ( = ?auto_684937 ?auto_684940 ) ) ( not ( = ?auto_684937 ?auto_684941 ) ) ( not ( = ?auto_684937 ?auto_684942 ) ) ( not ( = ?auto_684937 ?auto_684943 ) ) ( not ( = ?auto_684937 ?auto_684944 ) ) ( not ( = ?auto_684937 ?auto_684945 ) ) ( not ( = ?auto_684937 ?auto_684946 ) ) ( not ( = ?auto_684937 ?auto_684947 ) ) ( not ( = ?auto_684937 ?auto_684948 ) ) ( not ( = ?auto_684937 ?auto_684949 ) ) ( not ( = ?auto_684937 ?auto_684950 ) ) ( not ( = ?auto_684938 ?auto_684939 ) ) ( not ( = ?auto_684938 ?auto_684940 ) ) ( not ( = ?auto_684938 ?auto_684941 ) ) ( not ( = ?auto_684938 ?auto_684942 ) ) ( not ( = ?auto_684938 ?auto_684943 ) ) ( not ( = ?auto_684938 ?auto_684944 ) ) ( not ( = ?auto_684938 ?auto_684945 ) ) ( not ( = ?auto_684938 ?auto_684946 ) ) ( not ( = ?auto_684938 ?auto_684947 ) ) ( not ( = ?auto_684938 ?auto_684948 ) ) ( not ( = ?auto_684938 ?auto_684949 ) ) ( not ( = ?auto_684938 ?auto_684950 ) ) ( not ( = ?auto_684939 ?auto_684940 ) ) ( not ( = ?auto_684939 ?auto_684941 ) ) ( not ( = ?auto_684939 ?auto_684942 ) ) ( not ( = ?auto_684939 ?auto_684943 ) ) ( not ( = ?auto_684939 ?auto_684944 ) ) ( not ( = ?auto_684939 ?auto_684945 ) ) ( not ( = ?auto_684939 ?auto_684946 ) ) ( not ( = ?auto_684939 ?auto_684947 ) ) ( not ( = ?auto_684939 ?auto_684948 ) ) ( not ( = ?auto_684939 ?auto_684949 ) ) ( not ( = ?auto_684939 ?auto_684950 ) ) ( not ( = ?auto_684940 ?auto_684941 ) ) ( not ( = ?auto_684940 ?auto_684942 ) ) ( not ( = ?auto_684940 ?auto_684943 ) ) ( not ( = ?auto_684940 ?auto_684944 ) ) ( not ( = ?auto_684940 ?auto_684945 ) ) ( not ( = ?auto_684940 ?auto_684946 ) ) ( not ( = ?auto_684940 ?auto_684947 ) ) ( not ( = ?auto_684940 ?auto_684948 ) ) ( not ( = ?auto_684940 ?auto_684949 ) ) ( not ( = ?auto_684940 ?auto_684950 ) ) ( not ( = ?auto_684941 ?auto_684942 ) ) ( not ( = ?auto_684941 ?auto_684943 ) ) ( not ( = ?auto_684941 ?auto_684944 ) ) ( not ( = ?auto_684941 ?auto_684945 ) ) ( not ( = ?auto_684941 ?auto_684946 ) ) ( not ( = ?auto_684941 ?auto_684947 ) ) ( not ( = ?auto_684941 ?auto_684948 ) ) ( not ( = ?auto_684941 ?auto_684949 ) ) ( not ( = ?auto_684941 ?auto_684950 ) ) ( not ( = ?auto_684942 ?auto_684943 ) ) ( not ( = ?auto_684942 ?auto_684944 ) ) ( not ( = ?auto_684942 ?auto_684945 ) ) ( not ( = ?auto_684942 ?auto_684946 ) ) ( not ( = ?auto_684942 ?auto_684947 ) ) ( not ( = ?auto_684942 ?auto_684948 ) ) ( not ( = ?auto_684942 ?auto_684949 ) ) ( not ( = ?auto_684942 ?auto_684950 ) ) ( not ( = ?auto_684943 ?auto_684944 ) ) ( not ( = ?auto_684943 ?auto_684945 ) ) ( not ( = ?auto_684943 ?auto_684946 ) ) ( not ( = ?auto_684943 ?auto_684947 ) ) ( not ( = ?auto_684943 ?auto_684948 ) ) ( not ( = ?auto_684943 ?auto_684949 ) ) ( not ( = ?auto_684943 ?auto_684950 ) ) ( not ( = ?auto_684944 ?auto_684945 ) ) ( not ( = ?auto_684944 ?auto_684946 ) ) ( not ( = ?auto_684944 ?auto_684947 ) ) ( not ( = ?auto_684944 ?auto_684948 ) ) ( not ( = ?auto_684944 ?auto_684949 ) ) ( not ( = ?auto_684944 ?auto_684950 ) ) ( not ( = ?auto_684945 ?auto_684946 ) ) ( not ( = ?auto_684945 ?auto_684947 ) ) ( not ( = ?auto_684945 ?auto_684948 ) ) ( not ( = ?auto_684945 ?auto_684949 ) ) ( not ( = ?auto_684945 ?auto_684950 ) ) ( not ( = ?auto_684946 ?auto_684947 ) ) ( not ( = ?auto_684946 ?auto_684948 ) ) ( not ( = ?auto_684946 ?auto_684949 ) ) ( not ( = ?auto_684946 ?auto_684950 ) ) ( not ( = ?auto_684947 ?auto_684948 ) ) ( not ( = ?auto_684947 ?auto_684949 ) ) ( not ( = ?auto_684947 ?auto_684950 ) ) ( not ( = ?auto_684948 ?auto_684949 ) ) ( not ( = ?auto_684948 ?auto_684950 ) ) ( not ( = ?auto_684949 ?auto_684950 ) ) ( ON ?auto_684948 ?auto_684949 ) ( ON ?auto_684947 ?auto_684948 ) ( ON ?auto_684946 ?auto_684947 ) ( ON ?auto_684945 ?auto_684946 ) ( ON ?auto_684944 ?auto_684945 ) ( ON ?auto_684943 ?auto_684944 ) ( ON ?auto_684942 ?auto_684943 ) ( ON ?auto_684941 ?auto_684942 ) ( ON ?auto_684940 ?auto_684941 ) ( ON ?auto_684939 ?auto_684940 ) ( CLEAR ?auto_684937 ) ( ON ?auto_684938 ?auto_684939 ) ( CLEAR ?auto_684938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_684935 ?auto_684936 ?auto_684937 ?auto_684938 )
      ( MAKE-15PILE ?auto_684935 ?auto_684936 ?auto_684937 ?auto_684938 ?auto_684939 ?auto_684940 ?auto_684941 ?auto_684942 ?auto_684943 ?auto_684944 ?auto_684945 ?auto_684946 ?auto_684947 ?auto_684948 ?auto_684949 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_684997 - BLOCK
      ?auto_684998 - BLOCK
      ?auto_684999 - BLOCK
      ?auto_685000 - BLOCK
      ?auto_685001 - BLOCK
      ?auto_685002 - BLOCK
      ?auto_685003 - BLOCK
      ?auto_685004 - BLOCK
      ?auto_685005 - BLOCK
      ?auto_685006 - BLOCK
      ?auto_685007 - BLOCK
      ?auto_685008 - BLOCK
      ?auto_685009 - BLOCK
      ?auto_685010 - BLOCK
      ?auto_685011 - BLOCK
    )
    :vars
    (
      ?auto_685012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_685011 ?auto_685012 ) ( ON-TABLE ?auto_684997 ) ( ON ?auto_684998 ?auto_684997 ) ( not ( = ?auto_684997 ?auto_684998 ) ) ( not ( = ?auto_684997 ?auto_684999 ) ) ( not ( = ?auto_684997 ?auto_685000 ) ) ( not ( = ?auto_684997 ?auto_685001 ) ) ( not ( = ?auto_684997 ?auto_685002 ) ) ( not ( = ?auto_684997 ?auto_685003 ) ) ( not ( = ?auto_684997 ?auto_685004 ) ) ( not ( = ?auto_684997 ?auto_685005 ) ) ( not ( = ?auto_684997 ?auto_685006 ) ) ( not ( = ?auto_684997 ?auto_685007 ) ) ( not ( = ?auto_684997 ?auto_685008 ) ) ( not ( = ?auto_684997 ?auto_685009 ) ) ( not ( = ?auto_684997 ?auto_685010 ) ) ( not ( = ?auto_684997 ?auto_685011 ) ) ( not ( = ?auto_684997 ?auto_685012 ) ) ( not ( = ?auto_684998 ?auto_684999 ) ) ( not ( = ?auto_684998 ?auto_685000 ) ) ( not ( = ?auto_684998 ?auto_685001 ) ) ( not ( = ?auto_684998 ?auto_685002 ) ) ( not ( = ?auto_684998 ?auto_685003 ) ) ( not ( = ?auto_684998 ?auto_685004 ) ) ( not ( = ?auto_684998 ?auto_685005 ) ) ( not ( = ?auto_684998 ?auto_685006 ) ) ( not ( = ?auto_684998 ?auto_685007 ) ) ( not ( = ?auto_684998 ?auto_685008 ) ) ( not ( = ?auto_684998 ?auto_685009 ) ) ( not ( = ?auto_684998 ?auto_685010 ) ) ( not ( = ?auto_684998 ?auto_685011 ) ) ( not ( = ?auto_684998 ?auto_685012 ) ) ( not ( = ?auto_684999 ?auto_685000 ) ) ( not ( = ?auto_684999 ?auto_685001 ) ) ( not ( = ?auto_684999 ?auto_685002 ) ) ( not ( = ?auto_684999 ?auto_685003 ) ) ( not ( = ?auto_684999 ?auto_685004 ) ) ( not ( = ?auto_684999 ?auto_685005 ) ) ( not ( = ?auto_684999 ?auto_685006 ) ) ( not ( = ?auto_684999 ?auto_685007 ) ) ( not ( = ?auto_684999 ?auto_685008 ) ) ( not ( = ?auto_684999 ?auto_685009 ) ) ( not ( = ?auto_684999 ?auto_685010 ) ) ( not ( = ?auto_684999 ?auto_685011 ) ) ( not ( = ?auto_684999 ?auto_685012 ) ) ( not ( = ?auto_685000 ?auto_685001 ) ) ( not ( = ?auto_685000 ?auto_685002 ) ) ( not ( = ?auto_685000 ?auto_685003 ) ) ( not ( = ?auto_685000 ?auto_685004 ) ) ( not ( = ?auto_685000 ?auto_685005 ) ) ( not ( = ?auto_685000 ?auto_685006 ) ) ( not ( = ?auto_685000 ?auto_685007 ) ) ( not ( = ?auto_685000 ?auto_685008 ) ) ( not ( = ?auto_685000 ?auto_685009 ) ) ( not ( = ?auto_685000 ?auto_685010 ) ) ( not ( = ?auto_685000 ?auto_685011 ) ) ( not ( = ?auto_685000 ?auto_685012 ) ) ( not ( = ?auto_685001 ?auto_685002 ) ) ( not ( = ?auto_685001 ?auto_685003 ) ) ( not ( = ?auto_685001 ?auto_685004 ) ) ( not ( = ?auto_685001 ?auto_685005 ) ) ( not ( = ?auto_685001 ?auto_685006 ) ) ( not ( = ?auto_685001 ?auto_685007 ) ) ( not ( = ?auto_685001 ?auto_685008 ) ) ( not ( = ?auto_685001 ?auto_685009 ) ) ( not ( = ?auto_685001 ?auto_685010 ) ) ( not ( = ?auto_685001 ?auto_685011 ) ) ( not ( = ?auto_685001 ?auto_685012 ) ) ( not ( = ?auto_685002 ?auto_685003 ) ) ( not ( = ?auto_685002 ?auto_685004 ) ) ( not ( = ?auto_685002 ?auto_685005 ) ) ( not ( = ?auto_685002 ?auto_685006 ) ) ( not ( = ?auto_685002 ?auto_685007 ) ) ( not ( = ?auto_685002 ?auto_685008 ) ) ( not ( = ?auto_685002 ?auto_685009 ) ) ( not ( = ?auto_685002 ?auto_685010 ) ) ( not ( = ?auto_685002 ?auto_685011 ) ) ( not ( = ?auto_685002 ?auto_685012 ) ) ( not ( = ?auto_685003 ?auto_685004 ) ) ( not ( = ?auto_685003 ?auto_685005 ) ) ( not ( = ?auto_685003 ?auto_685006 ) ) ( not ( = ?auto_685003 ?auto_685007 ) ) ( not ( = ?auto_685003 ?auto_685008 ) ) ( not ( = ?auto_685003 ?auto_685009 ) ) ( not ( = ?auto_685003 ?auto_685010 ) ) ( not ( = ?auto_685003 ?auto_685011 ) ) ( not ( = ?auto_685003 ?auto_685012 ) ) ( not ( = ?auto_685004 ?auto_685005 ) ) ( not ( = ?auto_685004 ?auto_685006 ) ) ( not ( = ?auto_685004 ?auto_685007 ) ) ( not ( = ?auto_685004 ?auto_685008 ) ) ( not ( = ?auto_685004 ?auto_685009 ) ) ( not ( = ?auto_685004 ?auto_685010 ) ) ( not ( = ?auto_685004 ?auto_685011 ) ) ( not ( = ?auto_685004 ?auto_685012 ) ) ( not ( = ?auto_685005 ?auto_685006 ) ) ( not ( = ?auto_685005 ?auto_685007 ) ) ( not ( = ?auto_685005 ?auto_685008 ) ) ( not ( = ?auto_685005 ?auto_685009 ) ) ( not ( = ?auto_685005 ?auto_685010 ) ) ( not ( = ?auto_685005 ?auto_685011 ) ) ( not ( = ?auto_685005 ?auto_685012 ) ) ( not ( = ?auto_685006 ?auto_685007 ) ) ( not ( = ?auto_685006 ?auto_685008 ) ) ( not ( = ?auto_685006 ?auto_685009 ) ) ( not ( = ?auto_685006 ?auto_685010 ) ) ( not ( = ?auto_685006 ?auto_685011 ) ) ( not ( = ?auto_685006 ?auto_685012 ) ) ( not ( = ?auto_685007 ?auto_685008 ) ) ( not ( = ?auto_685007 ?auto_685009 ) ) ( not ( = ?auto_685007 ?auto_685010 ) ) ( not ( = ?auto_685007 ?auto_685011 ) ) ( not ( = ?auto_685007 ?auto_685012 ) ) ( not ( = ?auto_685008 ?auto_685009 ) ) ( not ( = ?auto_685008 ?auto_685010 ) ) ( not ( = ?auto_685008 ?auto_685011 ) ) ( not ( = ?auto_685008 ?auto_685012 ) ) ( not ( = ?auto_685009 ?auto_685010 ) ) ( not ( = ?auto_685009 ?auto_685011 ) ) ( not ( = ?auto_685009 ?auto_685012 ) ) ( not ( = ?auto_685010 ?auto_685011 ) ) ( not ( = ?auto_685010 ?auto_685012 ) ) ( not ( = ?auto_685011 ?auto_685012 ) ) ( ON ?auto_685010 ?auto_685011 ) ( ON ?auto_685009 ?auto_685010 ) ( ON ?auto_685008 ?auto_685009 ) ( ON ?auto_685007 ?auto_685008 ) ( ON ?auto_685006 ?auto_685007 ) ( ON ?auto_685005 ?auto_685006 ) ( ON ?auto_685004 ?auto_685005 ) ( ON ?auto_685003 ?auto_685004 ) ( ON ?auto_685002 ?auto_685003 ) ( ON ?auto_685001 ?auto_685002 ) ( ON ?auto_685000 ?auto_685001 ) ( CLEAR ?auto_684998 ) ( ON ?auto_684999 ?auto_685000 ) ( CLEAR ?auto_684999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_684997 ?auto_684998 ?auto_684999 )
      ( MAKE-15PILE ?auto_684997 ?auto_684998 ?auto_684999 ?auto_685000 ?auto_685001 ?auto_685002 ?auto_685003 ?auto_685004 ?auto_685005 ?auto_685006 ?auto_685007 ?auto_685008 ?auto_685009 ?auto_685010 ?auto_685011 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_685059 - BLOCK
      ?auto_685060 - BLOCK
      ?auto_685061 - BLOCK
      ?auto_685062 - BLOCK
      ?auto_685063 - BLOCK
      ?auto_685064 - BLOCK
      ?auto_685065 - BLOCK
      ?auto_685066 - BLOCK
      ?auto_685067 - BLOCK
      ?auto_685068 - BLOCK
      ?auto_685069 - BLOCK
      ?auto_685070 - BLOCK
      ?auto_685071 - BLOCK
      ?auto_685072 - BLOCK
      ?auto_685073 - BLOCK
    )
    :vars
    (
      ?auto_685074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_685073 ?auto_685074 ) ( ON-TABLE ?auto_685059 ) ( not ( = ?auto_685059 ?auto_685060 ) ) ( not ( = ?auto_685059 ?auto_685061 ) ) ( not ( = ?auto_685059 ?auto_685062 ) ) ( not ( = ?auto_685059 ?auto_685063 ) ) ( not ( = ?auto_685059 ?auto_685064 ) ) ( not ( = ?auto_685059 ?auto_685065 ) ) ( not ( = ?auto_685059 ?auto_685066 ) ) ( not ( = ?auto_685059 ?auto_685067 ) ) ( not ( = ?auto_685059 ?auto_685068 ) ) ( not ( = ?auto_685059 ?auto_685069 ) ) ( not ( = ?auto_685059 ?auto_685070 ) ) ( not ( = ?auto_685059 ?auto_685071 ) ) ( not ( = ?auto_685059 ?auto_685072 ) ) ( not ( = ?auto_685059 ?auto_685073 ) ) ( not ( = ?auto_685059 ?auto_685074 ) ) ( not ( = ?auto_685060 ?auto_685061 ) ) ( not ( = ?auto_685060 ?auto_685062 ) ) ( not ( = ?auto_685060 ?auto_685063 ) ) ( not ( = ?auto_685060 ?auto_685064 ) ) ( not ( = ?auto_685060 ?auto_685065 ) ) ( not ( = ?auto_685060 ?auto_685066 ) ) ( not ( = ?auto_685060 ?auto_685067 ) ) ( not ( = ?auto_685060 ?auto_685068 ) ) ( not ( = ?auto_685060 ?auto_685069 ) ) ( not ( = ?auto_685060 ?auto_685070 ) ) ( not ( = ?auto_685060 ?auto_685071 ) ) ( not ( = ?auto_685060 ?auto_685072 ) ) ( not ( = ?auto_685060 ?auto_685073 ) ) ( not ( = ?auto_685060 ?auto_685074 ) ) ( not ( = ?auto_685061 ?auto_685062 ) ) ( not ( = ?auto_685061 ?auto_685063 ) ) ( not ( = ?auto_685061 ?auto_685064 ) ) ( not ( = ?auto_685061 ?auto_685065 ) ) ( not ( = ?auto_685061 ?auto_685066 ) ) ( not ( = ?auto_685061 ?auto_685067 ) ) ( not ( = ?auto_685061 ?auto_685068 ) ) ( not ( = ?auto_685061 ?auto_685069 ) ) ( not ( = ?auto_685061 ?auto_685070 ) ) ( not ( = ?auto_685061 ?auto_685071 ) ) ( not ( = ?auto_685061 ?auto_685072 ) ) ( not ( = ?auto_685061 ?auto_685073 ) ) ( not ( = ?auto_685061 ?auto_685074 ) ) ( not ( = ?auto_685062 ?auto_685063 ) ) ( not ( = ?auto_685062 ?auto_685064 ) ) ( not ( = ?auto_685062 ?auto_685065 ) ) ( not ( = ?auto_685062 ?auto_685066 ) ) ( not ( = ?auto_685062 ?auto_685067 ) ) ( not ( = ?auto_685062 ?auto_685068 ) ) ( not ( = ?auto_685062 ?auto_685069 ) ) ( not ( = ?auto_685062 ?auto_685070 ) ) ( not ( = ?auto_685062 ?auto_685071 ) ) ( not ( = ?auto_685062 ?auto_685072 ) ) ( not ( = ?auto_685062 ?auto_685073 ) ) ( not ( = ?auto_685062 ?auto_685074 ) ) ( not ( = ?auto_685063 ?auto_685064 ) ) ( not ( = ?auto_685063 ?auto_685065 ) ) ( not ( = ?auto_685063 ?auto_685066 ) ) ( not ( = ?auto_685063 ?auto_685067 ) ) ( not ( = ?auto_685063 ?auto_685068 ) ) ( not ( = ?auto_685063 ?auto_685069 ) ) ( not ( = ?auto_685063 ?auto_685070 ) ) ( not ( = ?auto_685063 ?auto_685071 ) ) ( not ( = ?auto_685063 ?auto_685072 ) ) ( not ( = ?auto_685063 ?auto_685073 ) ) ( not ( = ?auto_685063 ?auto_685074 ) ) ( not ( = ?auto_685064 ?auto_685065 ) ) ( not ( = ?auto_685064 ?auto_685066 ) ) ( not ( = ?auto_685064 ?auto_685067 ) ) ( not ( = ?auto_685064 ?auto_685068 ) ) ( not ( = ?auto_685064 ?auto_685069 ) ) ( not ( = ?auto_685064 ?auto_685070 ) ) ( not ( = ?auto_685064 ?auto_685071 ) ) ( not ( = ?auto_685064 ?auto_685072 ) ) ( not ( = ?auto_685064 ?auto_685073 ) ) ( not ( = ?auto_685064 ?auto_685074 ) ) ( not ( = ?auto_685065 ?auto_685066 ) ) ( not ( = ?auto_685065 ?auto_685067 ) ) ( not ( = ?auto_685065 ?auto_685068 ) ) ( not ( = ?auto_685065 ?auto_685069 ) ) ( not ( = ?auto_685065 ?auto_685070 ) ) ( not ( = ?auto_685065 ?auto_685071 ) ) ( not ( = ?auto_685065 ?auto_685072 ) ) ( not ( = ?auto_685065 ?auto_685073 ) ) ( not ( = ?auto_685065 ?auto_685074 ) ) ( not ( = ?auto_685066 ?auto_685067 ) ) ( not ( = ?auto_685066 ?auto_685068 ) ) ( not ( = ?auto_685066 ?auto_685069 ) ) ( not ( = ?auto_685066 ?auto_685070 ) ) ( not ( = ?auto_685066 ?auto_685071 ) ) ( not ( = ?auto_685066 ?auto_685072 ) ) ( not ( = ?auto_685066 ?auto_685073 ) ) ( not ( = ?auto_685066 ?auto_685074 ) ) ( not ( = ?auto_685067 ?auto_685068 ) ) ( not ( = ?auto_685067 ?auto_685069 ) ) ( not ( = ?auto_685067 ?auto_685070 ) ) ( not ( = ?auto_685067 ?auto_685071 ) ) ( not ( = ?auto_685067 ?auto_685072 ) ) ( not ( = ?auto_685067 ?auto_685073 ) ) ( not ( = ?auto_685067 ?auto_685074 ) ) ( not ( = ?auto_685068 ?auto_685069 ) ) ( not ( = ?auto_685068 ?auto_685070 ) ) ( not ( = ?auto_685068 ?auto_685071 ) ) ( not ( = ?auto_685068 ?auto_685072 ) ) ( not ( = ?auto_685068 ?auto_685073 ) ) ( not ( = ?auto_685068 ?auto_685074 ) ) ( not ( = ?auto_685069 ?auto_685070 ) ) ( not ( = ?auto_685069 ?auto_685071 ) ) ( not ( = ?auto_685069 ?auto_685072 ) ) ( not ( = ?auto_685069 ?auto_685073 ) ) ( not ( = ?auto_685069 ?auto_685074 ) ) ( not ( = ?auto_685070 ?auto_685071 ) ) ( not ( = ?auto_685070 ?auto_685072 ) ) ( not ( = ?auto_685070 ?auto_685073 ) ) ( not ( = ?auto_685070 ?auto_685074 ) ) ( not ( = ?auto_685071 ?auto_685072 ) ) ( not ( = ?auto_685071 ?auto_685073 ) ) ( not ( = ?auto_685071 ?auto_685074 ) ) ( not ( = ?auto_685072 ?auto_685073 ) ) ( not ( = ?auto_685072 ?auto_685074 ) ) ( not ( = ?auto_685073 ?auto_685074 ) ) ( ON ?auto_685072 ?auto_685073 ) ( ON ?auto_685071 ?auto_685072 ) ( ON ?auto_685070 ?auto_685071 ) ( ON ?auto_685069 ?auto_685070 ) ( ON ?auto_685068 ?auto_685069 ) ( ON ?auto_685067 ?auto_685068 ) ( ON ?auto_685066 ?auto_685067 ) ( ON ?auto_685065 ?auto_685066 ) ( ON ?auto_685064 ?auto_685065 ) ( ON ?auto_685063 ?auto_685064 ) ( ON ?auto_685062 ?auto_685063 ) ( ON ?auto_685061 ?auto_685062 ) ( CLEAR ?auto_685059 ) ( ON ?auto_685060 ?auto_685061 ) ( CLEAR ?auto_685060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_685059 ?auto_685060 )
      ( MAKE-15PILE ?auto_685059 ?auto_685060 ?auto_685061 ?auto_685062 ?auto_685063 ?auto_685064 ?auto_685065 ?auto_685066 ?auto_685067 ?auto_685068 ?auto_685069 ?auto_685070 ?auto_685071 ?auto_685072 ?auto_685073 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_685121 - BLOCK
      ?auto_685122 - BLOCK
      ?auto_685123 - BLOCK
      ?auto_685124 - BLOCK
      ?auto_685125 - BLOCK
      ?auto_685126 - BLOCK
      ?auto_685127 - BLOCK
      ?auto_685128 - BLOCK
      ?auto_685129 - BLOCK
      ?auto_685130 - BLOCK
      ?auto_685131 - BLOCK
      ?auto_685132 - BLOCK
      ?auto_685133 - BLOCK
      ?auto_685134 - BLOCK
      ?auto_685135 - BLOCK
    )
    :vars
    (
      ?auto_685136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_685135 ?auto_685136 ) ( not ( = ?auto_685121 ?auto_685122 ) ) ( not ( = ?auto_685121 ?auto_685123 ) ) ( not ( = ?auto_685121 ?auto_685124 ) ) ( not ( = ?auto_685121 ?auto_685125 ) ) ( not ( = ?auto_685121 ?auto_685126 ) ) ( not ( = ?auto_685121 ?auto_685127 ) ) ( not ( = ?auto_685121 ?auto_685128 ) ) ( not ( = ?auto_685121 ?auto_685129 ) ) ( not ( = ?auto_685121 ?auto_685130 ) ) ( not ( = ?auto_685121 ?auto_685131 ) ) ( not ( = ?auto_685121 ?auto_685132 ) ) ( not ( = ?auto_685121 ?auto_685133 ) ) ( not ( = ?auto_685121 ?auto_685134 ) ) ( not ( = ?auto_685121 ?auto_685135 ) ) ( not ( = ?auto_685121 ?auto_685136 ) ) ( not ( = ?auto_685122 ?auto_685123 ) ) ( not ( = ?auto_685122 ?auto_685124 ) ) ( not ( = ?auto_685122 ?auto_685125 ) ) ( not ( = ?auto_685122 ?auto_685126 ) ) ( not ( = ?auto_685122 ?auto_685127 ) ) ( not ( = ?auto_685122 ?auto_685128 ) ) ( not ( = ?auto_685122 ?auto_685129 ) ) ( not ( = ?auto_685122 ?auto_685130 ) ) ( not ( = ?auto_685122 ?auto_685131 ) ) ( not ( = ?auto_685122 ?auto_685132 ) ) ( not ( = ?auto_685122 ?auto_685133 ) ) ( not ( = ?auto_685122 ?auto_685134 ) ) ( not ( = ?auto_685122 ?auto_685135 ) ) ( not ( = ?auto_685122 ?auto_685136 ) ) ( not ( = ?auto_685123 ?auto_685124 ) ) ( not ( = ?auto_685123 ?auto_685125 ) ) ( not ( = ?auto_685123 ?auto_685126 ) ) ( not ( = ?auto_685123 ?auto_685127 ) ) ( not ( = ?auto_685123 ?auto_685128 ) ) ( not ( = ?auto_685123 ?auto_685129 ) ) ( not ( = ?auto_685123 ?auto_685130 ) ) ( not ( = ?auto_685123 ?auto_685131 ) ) ( not ( = ?auto_685123 ?auto_685132 ) ) ( not ( = ?auto_685123 ?auto_685133 ) ) ( not ( = ?auto_685123 ?auto_685134 ) ) ( not ( = ?auto_685123 ?auto_685135 ) ) ( not ( = ?auto_685123 ?auto_685136 ) ) ( not ( = ?auto_685124 ?auto_685125 ) ) ( not ( = ?auto_685124 ?auto_685126 ) ) ( not ( = ?auto_685124 ?auto_685127 ) ) ( not ( = ?auto_685124 ?auto_685128 ) ) ( not ( = ?auto_685124 ?auto_685129 ) ) ( not ( = ?auto_685124 ?auto_685130 ) ) ( not ( = ?auto_685124 ?auto_685131 ) ) ( not ( = ?auto_685124 ?auto_685132 ) ) ( not ( = ?auto_685124 ?auto_685133 ) ) ( not ( = ?auto_685124 ?auto_685134 ) ) ( not ( = ?auto_685124 ?auto_685135 ) ) ( not ( = ?auto_685124 ?auto_685136 ) ) ( not ( = ?auto_685125 ?auto_685126 ) ) ( not ( = ?auto_685125 ?auto_685127 ) ) ( not ( = ?auto_685125 ?auto_685128 ) ) ( not ( = ?auto_685125 ?auto_685129 ) ) ( not ( = ?auto_685125 ?auto_685130 ) ) ( not ( = ?auto_685125 ?auto_685131 ) ) ( not ( = ?auto_685125 ?auto_685132 ) ) ( not ( = ?auto_685125 ?auto_685133 ) ) ( not ( = ?auto_685125 ?auto_685134 ) ) ( not ( = ?auto_685125 ?auto_685135 ) ) ( not ( = ?auto_685125 ?auto_685136 ) ) ( not ( = ?auto_685126 ?auto_685127 ) ) ( not ( = ?auto_685126 ?auto_685128 ) ) ( not ( = ?auto_685126 ?auto_685129 ) ) ( not ( = ?auto_685126 ?auto_685130 ) ) ( not ( = ?auto_685126 ?auto_685131 ) ) ( not ( = ?auto_685126 ?auto_685132 ) ) ( not ( = ?auto_685126 ?auto_685133 ) ) ( not ( = ?auto_685126 ?auto_685134 ) ) ( not ( = ?auto_685126 ?auto_685135 ) ) ( not ( = ?auto_685126 ?auto_685136 ) ) ( not ( = ?auto_685127 ?auto_685128 ) ) ( not ( = ?auto_685127 ?auto_685129 ) ) ( not ( = ?auto_685127 ?auto_685130 ) ) ( not ( = ?auto_685127 ?auto_685131 ) ) ( not ( = ?auto_685127 ?auto_685132 ) ) ( not ( = ?auto_685127 ?auto_685133 ) ) ( not ( = ?auto_685127 ?auto_685134 ) ) ( not ( = ?auto_685127 ?auto_685135 ) ) ( not ( = ?auto_685127 ?auto_685136 ) ) ( not ( = ?auto_685128 ?auto_685129 ) ) ( not ( = ?auto_685128 ?auto_685130 ) ) ( not ( = ?auto_685128 ?auto_685131 ) ) ( not ( = ?auto_685128 ?auto_685132 ) ) ( not ( = ?auto_685128 ?auto_685133 ) ) ( not ( = ?auto_685128 ?auto_685134 ) ) ( not ( = ?auto_685128 ?auto_685135 ) ) ( not ( = ?auto_685128 ?auto_685136 ) ) ( not ( = ?auto_685129 ?auto_685130 ) ) ( not ( = ?auto_685129 ?auto_685131 ) ) ( not ( = ?auto_685129 ?auto_685132 ) ) ( not ( = ?auto_685129 ?auto_685133 ) ) ( not ( = ?auto_685129 ?auto_685134 ) ) ( not ( = ?auto_685129 ?auto_685135 ) ) ( not ( = ?auto_685129 ?auto_685136 ) ) ( not ( = ?auto_685130 ?auto_685131 ) ) ( not ( = ?auto_685130 ?auto_685132 ) ) ( not ( = ?auto_685130 ?auto_685133 ) ) ( not ( = ?auto_685130 ?auto_685134 ) ) ( not ( = ?auto_685130 ?auto_685135 ) ) ( not ( = ?auto_685130 ?auto_685136 ) ) ( not ( = ?auto_685131 ?auto_685132 ) ) ( not ( = ?auto_685131 ?auto_685133 ) ) ( not ( = ?auto_685131 ?auto_685134 ) ) ( not ( = ?auto_685131 ?auto_685135 ) ) ( not ( = ?auto_685131 ?auto_685136 ) ) ( not ( = ?auto_685132 ?auto_685133 ) ) ( not ( = ?auto_685132 ?auto_685134 ) ) ( not ( = ?auto_685132 ?auto_685135 ) ) ( not ( = ?auto_685132 ?auto_685136 ) ) ( not ( = ?auto_685133 ?auto_685134 ) ) ( not ( = ?auto_685133 ?auto_685135 ) ) ( not ( = ?auto_685133 ?auto_685136 ) ) ( not ( = ?auto_685134 ?auto_685135 ) ) ( not ( = ?auto_685134 ?auto_685136 ) ) ( not ( = ?auto_685135 ?auto_685136 ) ) ( ON ?auto_685134 ?auto_685135 ) ( ON ?auto_685133 ?auto_685134 ) ( ON ?auto_685132 ?auto_685133 ) ( ON ?auto_685131 ?auto_685132 ) ( ON ?auto_685130 ?auto_685131 ) ( ON ?auto_685129 ?auto_685130 ) ( ON ?auto_685128 ?auto_685129 ) ( ON ?auto_685127 ?auto_685128 ) ( ON ?auto_685126 ?auto_685127 ) ( ON ?auto_685125 ?auto_685126 ) ( ON ?auto_685124 ?auto_685125 ) ( ON ?auto_685123 ?auto_685124 ) ( ON ?auto_685122 ?auto_685123 ) ( ON ?auto_685121 ?auto_685122 ) ( CLEAR ?auto_685121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_685121 )
      ( MAKE-15PILE ?auto_685121 ?auto_685122 ?auto_685123 ?auto_685124 ?auto_685125 ?auto_685126 ?auto_685127 ?auto_685128 ?auto_685129 ?auto_685130 ?auto_685131 ?auto_685132 ?auto_685133 ?auto_685134 ?auto_685135 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_685184 - BLOCK
      ?auto_685185 - BLOCK
      ?auto_685186 - BLOCK
      ?auto_685187 - BLOCK
      ?auto_685188 - BLOCK
      ?auto_685189 - BLOCK
      ?auto_685190 - BLOCK
      ?auto_685191 - BLOCK
      ?auto_685192 - BLOCK
      ?auto_685193 - BLOCK
      ?auto_685194 - BLOCK
      ?auto_685195 - BLOCK
      ?auto_685196 - BLOCK
      ?auto_685197 - BLOCK
      ?auto_685198 - BLOCK
      ?auto_685199 - BLOCK
    )
    :vars
    (
      ?auto_685200 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_685198 ) ( ON ?auto_685199 ?auto_685200 ) ( CLEAR ?auto_685199 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_685184 ) ( ON ?auto_685185 ?auto_685184 ) ( ON ?auto_685186 ?auto_685185 ) ( ON ?auto_685187 ?auto_685186 ) ( ON ?auto_685188 ?auto_685187 ) ( ON ?auto_685189 ?auto_685188 ) ( ON ?auto_685190 ?auto_685189 ) ( ON ?auto_685191 ?auto_685190 ) ( ON ?auto_685192 ?auto_685191 ) ( ON ?auto_685193 ?auto_685192 ) ( ON ?auto_685194 ?auto_685193 ) ( ON ?auto_685195 ?auto_685194 ) ( ON ?auto_685196 ?auto_685195 ) ( ON ?auto_685197 ?auto_685196 ) ( ON ?auto_685198 ?auto_685197 ) ( not ( = ?auto_685184 ?auto_685185 ) ) ( not ( = ?auto_685184 ?auto_685186 ) ) ( not ( = ?auto_685184 ?auto_685187 ) ) ( not ( = ?auto_685184 ?auto_685188 ) ) ( not ( = ?auto_685184 ?auto_685189 ) ) ( not ( = ?auto_685184 ?auto_685190 ) ) ( not ( = ?auto_685184 ?auto_685191 ) ) ( not ( = ?auto_685184 ?auto_685192 ) ) ( not ( = ?auto_685184 ?auto_685193 ) ) ( not ( = ?auto_685184 ?auto_685194 ) ) ( not ( = ?auto_685184 ?auto_685195 ) ) ( not ( = ?auto_685184 ?auto_685196 ) ) ( not ( = ?auto_685184 ?auto_685197 ) ) ( not ( = ?auto_685184 ?auto_685198 ) ) ( not ( = ?auto_685184 ?auto_685199 ) ) ( not ( = ?auto_685184 ?auto_685200 ) ) ( not ( = ?auto_685185 ?auto_685186 ) ) ( not ( = ?auto_685185 ?auto_685187 ) ) ( not ( = ?auto_685185 ?auto_685188 ) ) ( not ( = ?auto_685185 ?auto_685189 ) ) ( not ( = ?auto_685185 ?auto_685190 ) ) ( not ( = ?auto_685185 ?auto_685191 ) ) ( not ( = ?auto_685185 ?auto_685192 ) ) ( not ( = ?auto_685185 ?auto_685193 ) ) ( not ( = ?auto_685185 ?auto_685194 ) ) ( not ( = ?auto_685185 ?auto_685195 ) ) ( not ( = ?auto_685185 ?auto_685196 ) ) ( not ( = ?auto_685185 ?auto_685197 ) ) ( not ( = ?auto_685185 ?auto_685198 ) ) ( not ( = ?auto_685185 ?auto_685199 ) ) ( not ( = ?auto_685185 ?auto_685200 ) ) ( not ( = ?auto_685186 ?auto_685187 ) ) ( not ( = ?auto_685186 ?auto_685188 ) ) ( not ( = ?auto_685186 ?auto_685189 ) ) ( not ( = ?auto_685186 ?auto_685190 ) ) ( not ( = ?auto_685186 ?auto_685191 ) ) ( not ( = ?auto_685186 ?auto_685192 ) ) ( not ( = ?auto_685186 ?auto_685193 ) ) ( not ( = ?auto_685186 ?auto_685194 ) ) ( not ( = ?auto_685186 ?auto_685195 ) ) ( not ( = ?auto_685186 ?auto_685196 ) ) ( not ( = ?auto_685186 ?auto_685197 ) ) ( not ( = ?auto_685186 ?auto_685198 ) ) ( not ( = ?auto_685186 ?auto_685199 ) ) ( not ( = ?auto_685186 ?auto_685200 ) ) ( not ( = ?auto_685187 ?auto_685188 ) ) ( not ( = ?auto_685187 ?auto_685189 ) ) ( not ( = ?auto_685187 ?auto_685190 ) ) ( not ( = ?auto_685187 ?auto_685191 ) ) ( not ( = ?auto_685187 ?auto_685192 ) ) ( not ( = ?auto_685187 ?auto_685193 ) ) ( not ( = ?auto_685187 ?auto_685194 ) ) ( not ( = ?auto_685187 ?auto_685195 ) ) ( not ( = ?auto_685187 ?auto_685196 ) ) ( not ( = ?auto_685187 ?auto_685197 ) ) ( not ( = ?auto_685187 ?auto_685198 ) ) ( not ( = ?auto_685187 ?auto_685199 ) ) ( not ( = ?auto_685187 ?auto_685200 ) ) ( not ( = ?auto_685188 ?auto_685189 ) ) ( not ( = ?auto_685188 ?auto_685190 ) ) ( not ( = ?auto_685188 ?auto_685191 ) ) ( not ( = ?auto_685188 ?auto_685192 ) ) ( not ( = ?auto_685188 ?auto_685193 ) ) ( not ( = ?auto_685188 ?auto_685194 ) ) ( not ( = ?auto_685188 ?auto_685195 ) ) ( not ( = ?auto_685188 ?auto_685196 ) ) ( not ( = ?auto_685188 ?auto_685197 ) ) ( not ( = ?auto_685188 ?auto_685198 ) ) ( not ( = ?auto_685188 ?auto_685199 ) ) ( not ( = ?auto_685188 ?auto_685200 ) ) ( not ( = ?auto_685189 ?auto_685190 ) ) ( not ( = ?auto_685189 ?auto_685191 ) ) ( not ( = ?auto_685189 ?auto_685192 ) ) ( not ( = ?auto_685189 ?auto_685193 ) ) ( not ( = ?auto_685189 ?auto_685194 ) ) ( not ( = ?auto_685189 ?auto_685195 ) ) ( not ( = ?auto_685189 ?auto_685196 ) ) ( not ( = ?auto_685189 ?auto_685197 ) ) ( not ( = ?auto_685189 ?auto_685198 ) ) ( not ( = ?auto_685189 ?auto_685199 ) ) ( not ( = ?auto_685189 ?auto_685200 ) ) ( not ( = ?auto_685190 ?auto_685191 ) ) ( not ( = ?auto_685190 ?auto_685192 ) ) ( not ( = ?auto_685190 ?auto_685193 ) ) ( not ( = ?auto_685190 ?auto_685194 ) ) ( not ( = ?auto_685190 ?auto_685195 ) ) ( not ( = ?auto_685190 ?auto_685196 ) ) ( not ( = ?auto_685190 ?auto_685197 ) ) ( not ( = ?auto_685190 ?auto_685198 ) ) ( not ( = ?auto_685190 ?auto_685199 ) ) ( not ( = ?auto_685190 ?auto_685200 ) ) ( not ( = ?auto_685191 ?auto_685192 ) ) ( not ( = ?auto_685191 ?auto_685193 ) ) ( not ( = ?auto_685191 ?auto_685194 ) ) ( not ( = ?auto_685191 ?auto_685195 ) ) ( not ( = ?auto_685191 ?auto_685196 ) ) ( not ( = ?auto_685191 ?auto_685197 ) ) ( not ( = ?auto_685191 ?auto_685198 ) ) ( not ( = ?auto_685191 ?auto_685199 ) ) ( not ( = ?auto_685191 ?auto_685200 ) ) ( not ( = ?auto_685192 ?auto_685193 ) ) ( not ( = ?auto_685192 ?auto_685194 ) ) ( not ( = ?auto_685192 ?auto_685195 ) ) ( not ( = ?auto_685192 ?auto_685196 ) ) ( not ( = ?auto_685192 ?auto_685197 ) ) ( not ( = ?auto_685192 ?auto_685198 ) ) ( not ( = ?auto_685192 ?auto_685199 ) ) ( not ( = ?auto_685192 ?auto_685200 ) ) ( not ( = ?auto_685193 ?auto_685194 ) ) ( not ( = ?auto_685193 ?auto_685195 ) ) ( not ( = ?auto_685193 ?auto_685196 ) ) ( not ( = ?auto_685193 ?auto_685197 ) ) ( not ( = ?auto_685193 ?auto_685198 ) ) ( not ( = ?auto_685193 ?auto_685199 ) ) ( not ( = ?auto_685193 ?auto_685200 ) ) ( not ( = ?auto_685194 ?auto_685195 ) ) ( not ( = ?auto_685194 ?auto_685196 ) ) ( not ( = ?auto_685194 ?auto_685197 ) ) ( not ( = ?auto_685194 ?auto_685198 ) ) ( not ( = ?auto_685194 ?auto_685199 ) ) ( not ( = ?auto_685194 ?auto_685200 ) ) ( not ( = ?auto_685195 ?auto_685196 ) ) ( not ( = ?auto_685195 ?auto_685197 ) ) ( not ( = ?auto_685195 ?auto_685198 ) ) ( not ( = ?auto_685195 ?auto_685199 ) ) ( not ( = ?auto_685195 ?auto_685200 ) ) ( not ( = ?auto_685196 ?auto_685197 ) ) ( not ( = ?auto_685196 ?auto_685198 ) ) ( not ( = ?auto_685196 ?auto_685199 ) ) ( not ( = ?auto_685196 ?auto_685200 ) ) ( not ( = ?auto_685197 ?auto_685198 ) ) ( not ( = ?auto_685197 ?auto_685199 ) ) ( not ( = ?auto_685197 ?auto_685200 ) ) ( not ( = ?auto_685198 ?auto_685199 ) ) ( not ( = ?auto_685198 ?auto_685200 ) ) ( not ( = ?auto_685199 ?auto_685200 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_685199 ?auto_685200 )
      ( !STACK ?auto_685199 ?auto_685198 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_685250 - BLOCK
      ?auto_685251 - BLOCK
      ?auto_685252 - BLOCK
      ?auto_685253 - BLOCK
      ?auto_685254 - BLOCK
      ?auto_685255 - BLOCK
      ?auto_685256 - BLOCK
      ?auto_685257 - BLOCK
      ?auto_685258 - BLOCK
      ?auto_685259 - BLOCK
      ?auto_685260 - BLOCK
      ?auto_685261 - BLOCK
      ?auto_685262 - BLOCK
      ?auto_685263 - BLOCK
      ?auto_685264 - BLOCK
      ?auto_685265 - BLOCK
    )
    :vars
    (
      ?auto_685266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_685265 ?auto_685266 ) ( ON-TABLE ?auto_685250 ) ( ON ?auto_685251 ?auto_685250 ) ( ON ?auto_685252 ?auto_685251 ) ( ON ?auto_685253 ?auto_685252 ) ( ON ?auto_685254 ?auto_685253 ) ( ON ?auto_685255 ?auto_685254 ) ( ON ?auto_685256 ?auto_685255 ) ( ON ?auto_685257 ?auto_685256 ) ( ON ?auto_685258 ?auto_685257 ) ( ON ?auto_685259 ?auto_685258 ) ( ON ?auto_685260 ?auto_685259 ) ( ON ?auto_685261 ?auto_685260 ) ( ON ?auto_685262 ?auto_685261 ) ( ON ?auto_685263 ?auto_685262 ) ( not ( = ?auto_685250 ?auto_685251 ) ) ( not ( = ?auto_685250 ?auto_685252 ) ) ( not ( = ?auto_685250 ?auto_685253 ) ) ( not ( = ?auto_685250 ?auto_685254 ) ) ( not ( = ?auto_685250 ?auto_685255 ) ) ( not ( = ?auto_685250 ?auto_685256 ) ) ( not ( = ?auto_685250 ?auto_685257 ) ) ( not ( = ?auto_685250 ?auto_685258 ) ) ( not ( = ?auto_685250 ?auto_685259 ) ) ( not ( = ?auto_685250 ?auto_685260 ) ) ( not ( = ?auto_685250 ?auto_685261 ) ) ( not ( = ?auto_685250 ?auto_685262 ) ) ( not ( = ?auto_685250 ?auto_685263 ) ) ( not ( = ?auto_685250 ?auto_685264 ) ) ( not ( = ?auto_685250 ?auto_685265 ) ) ( not ( = ?auto_685250 ?auto_685266 ) ) ( not ( = ?auto_685251 ?auto_685252 ) ) ( not ( = ?auto_685251 ?auto_685253 ) ) ( not ( = ?auto_685251 ?auto_685254 ) ) ( not ( = ?auto_685251 ?auto_685255 ) ) ( not ( = ?auto_685251 ?auto_685256 ) ) ( not ( = ?auto_685251 ?auto_685257 ) ) ( not ( = ?auto_685251 ?auto_685258 ) ) ( not ( = ?auto_685251 ?auto_685259 ) ) ( not ( = ?auto_685251 ?auto_685260 ) ) ( not ( = ?auto_685251 ?auto_685261 ) ) ( not ( = ?auto_685251 ?auto_685262 ) ) ( not ( = ?auto_685251 ?auto_685263 ) ) ( not ( = ?auto_685251 ?auto_685264 ) ) ( not ( = ?auto_685251 ?auto_685265 ) ) ( not ( = ?auto_685251 ?auto_685266 ) ) ( not ( = ?auto_685252 ?auto_685253 ) ) ( not ( = ?auto_685252 ?auto_685254 ) ) ( not ( = ?auto_685252 ?auto_685255 ) ) ( not ( = ?auto_685252 ?auto_685256 ) ) ( not ( = ?auto_685252 ?auto_685257 ) ) ( not ( = ?auto_685252 ?auto_685258 ) ) ( not ( = ?auto_685252 ?auto_685259 ) ) ( not ( = ?auto_685252 ?auto_685260 ) ) ( not ( = ?auto_685252 ?auto_685261 ) ) ( not ( = ?auto_685252 ?auto_685262 ) ) ( not ( = ?auto_685252 ?auto_685263 ) ) ( not ( = ?auto_685252 ?auto_685264 ) ) ( not ( = ?auto_685252 ?auto_685265 ) ) ( not ( = ?auto_685252 ?auto_685266 ) ) ( not ( = ?auto_685253 ?auto_685254 ) ) ( not ( = ?auto_685253 ?auto_685255 ) ) ( not ( = ?auto_685253 ?auto_685256 ) ) ( not ( = ?auto_685253 ?auto_685257 ) ) ( not ( = ?auto_685253 ?auto_685258 ) ) ( not ( = ?auto_685253 ?auto_685259 ) ) ( not ( = ?auto_685253 ?auto_685260 ) ) ( not ( = ?auto_685253 ?auto_685261 ) ) ( not ( = ?auto_685253 ?auto_685262 ) ) ( not ( = ?auto_685253 ?auto_685263 ) ) ( not ( = ?auto_685253 ?auto_685264 ) ) ( not ( = ?auto_685253 ?auto_685265 ) ) ( not ( = ?auto_685253 ?auto_685266 ) ) ( not ( = ?auto_685254 ?auto_685255 ) ) ( not ( = ?auto_685254 ?auto_685256 ) ) ( not ( = ?auto_685254 ?auto_685257 ) ) ( not ( = ?auto_685254 ?auto_685258 ) ) ( not ( = ?auto_685254 ?auto_685259 ) ) ( not ( = ?auto_685254 ?auto_685260 ) ) ( not ( = ?auto_685254 ?auto_685261 ) ) ( not ( = ?auto_685254 ?auto_685262 ) ) ( not ( = ?auto_685254 ?auto_685263 ) ) ( not ( = ?auto_685254 ?auto_685264 ) ) ( not ( = ?auto_685254 ?auto_685265 ) ) ( not ( = ?auto_685254 ?auto_685266 ) ) ( not ( = ?auto_685255 ?auto_685256 ) ) ( not ( = ?auto_685255 ?auto_685257 ) ) ( not ( = ?auto_685255 ?auto_685258 ) ) ( not ( = ?auto_685255 ?auto_685259 ) ) ( not ( = ?auto_685255 ?auto_685260 ) ) ( not ( = ?auto_685255 ?auto_685261 ) ) ( not ( = ?auto_685255 ?auto_685262 ) ) ( not ( = ?auto_685255 ?auto_685263 ) ) ( not ( = ?auto_685255 ?auto_685264 ) ) ( not ( = ?auto_685255 ?auto_685265 ) ) ( not ( = ?auto_685255 ?auto_685266 ) ) ( not ( = ?auto_685256 ?auto_685257 ) ) ( not ( = ?auto_685256 ?auto_685258 ) ) ( not ( = ?auto_685256 ?auto_685259 ) ) ( not ( = ?auto_685256 ?auto_685260 ) ) ( not ( = ?auto_685256 ?auto_685261 ) ) ( not ( = ?auto_685256 ?auto_685262 ) ) ( not ( = ?auto_685256 ?auto_685263 ) ) ( not ( = ?auto_685256 ?auto_685264 ) ) ( not ( = ?auto_685256 ?auto_685265 ) ) ( not ( = ?auto_685256 ?auto_685266 ) ) ( not ( = ?auto_685257 ?auto_685258 ) ) ( not ( = ?auto_685257 ?auto_685259 ) ) ( not ( = ?auto_685257 ?auto_685260 ) ) ( not ( = ?auto_685257 ?auto_685261 ) ) ( not ( = ?auto_685257 ?auto_685262 ) ) ( not ( = ?auto_685257 ?auto_685263 ) ) ( not ( = ?auto_685257 ?auto_685264 ) ) ( not ( = ?auto_685257 ?auto_685265 ) ) ( not ( = ?auto_685257 ?auto_685266 ) ) ( not ( = ?auto_685258 ?auto_685259 ) ) ( not ( = ?auto_685258 ?auto_685260 ) ) ( not ( = ?auto_685258 ?auto_685261 ) ) ( not ( = ?auto_685258 ?auto_685262 ) ) ( not ( = ?auto_685258 ?auto_685263 ) ) ( not ( = ?auto_685258 ?auto_685264 ) ) ( not ( = ?auto_685258 ?auto_685265 ) ) ( not ( = ?auto_685258 ?auto_685266 ) ) ( not ( = ?auto_685259 ?auto_685260 ) ) ( not ( = ?auto_685259 ?auto_685261 ) ) ( not ( = ?auto_685259 ?auto_685262 ) ) ( not ( = ?auto_685259 ?auto_685263 ) ) ( not ( = ?auto_685259 ?auto_685264 ) ) ( not ( = ?auto_685259 ?auto_685265 ) ) ( not ( = ?auto_685259 ?auto_685266 ) ) ( not ( = ?auto_685260 ?auto_685261 ) ) ( not ( = ?auto_685260 ?auto_685262 ) ) ( not ( = ?auto_685260 ?auto_685263 ) ) ( not ( = ?auto_685260 ?auto_685264 ) ) ( not ( = ?auto_685260 ?auto_685265 ) ) ( not ( = ?auto_685260 ?auto_685266 ) ) ( not ( = ?auto_685261 ?auto_685262 ) ) ( not ( = ?auto_685261 ?auto_685263 ) ) ( not ( = ?auto_685261 ?auto_685264 ) ) ( not ( = ?auto_685261 ?auto_685265 ) ) ( not ( = ?auto_685261 ?auto_685266 ) ) ( not ( = ?auto_685262 ?auto_685263 ) ) ( not ( = ?auto_685262 ?auto_685264 ) ) ( not ( = ?auto_685262 ?auto_685265 ) ) ( not ( = ?auto_685262 ?auto_685266 ) ) ( not ( = ?auto_685263 ?auto_685264 ) ) ( not ( = ?auto_685263 ?auto_685265 ) ) ( not ( = ?auto_685263 ?auto_685266 ) ) ( not ( = ?auto_685264 ?auto_685265 ) ) ( not ( = ?auto_685264 ?auto_685266 ) ) ( not ( = ?auto_685265 ?auto_685266 ) ) ( CLEAR ?auto_685263 ) ( ON ?auto_685264 ?auto_685265 ) ( CLEAR ?auto_685264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_685250 ?auto_685251 ?auto_685252 ?auto_685253 ?auto_685254 ?auto_685255 ?auto_685256 ?auto_685257 ?auto_685258 ?auto_685259 ?auto_685260 ?auto_685261 ?auto_685262 ?auto_685263 ?auto_685264 )
      ( MAKE-16PILE ?auto_685250 ?auto_685251 ?auto_685252 ?auto_685253 ?auto_685254 ?auto_685255 ?auto_685256 ?auto_685257 ?auto_685258 ?auto_685259 ?auto_685260 ?auto_685261 ?auto_685262 ?auto_685263 ?auto_685264 ?auto_685265 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_685316 - BLOCK
      ?auto_685317 - BLOCK
      ?auto_685318 - BLOCK
      ?auto_685319 - BLOCK
      ?auto_685320 - BLOCK
      ?auto_685321 - BLOCK
      ?auto_685322 - BLOCK
      ?auto_685323 - BLOCK
      ?auto_685324 - BLOCK
      ?auto_685325 - BLOCK
      ?auto_685326 - BLOCK
      ?auto_685327 - BLOCK
      ?auto_685328 - BLOCK
      ?auto_685329 - BLOCK
      ?auto_685330 - BLOCK
      ?auto_685331 - BLOCK
    )
    :vars
    (
      ?auto_685332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_685331 ?auto_685332 ) ( ON-TABLE ?auto_685316 ) ( ON ?auto_685317 ?auto_685316 ) ( ON ?auto_685318 ?auto_685317 ) ( ON ?auto_685319 ?auto_685318 ) ( ON ?auto_685320 ?auto_685319 ) ( ON ?auto_685321 ?auto_685320 ) ( ON ?auto_685322 ?auto_685321 ) ( ON ?auto_685323 ?auto_685322 ) ( ON ?auto_685324 ?auto_685323 ) ( ON ?auto_685325 ?auto_685324 ) ( ON ?auto_685326 ?auto_685325 ) ( ON ?auto_685327 ?auto_685326 ) ( ON ?auto_685328 ?auto_685327 ) ( not ( = ?auto_685316 ?auto_685317 ) ) ( not ( = ?auto_685316 ?auto_685318 ) ) ( not ( = ?auto_685316 ?auto_685319 ) ) ( not ( = ?auto_685316 ?auto_685320 ) ) ( not ( = ?auto_685316 ?auto_685321 ) ) ( not ( = ?auto_685316 ?auto_685322 ) ) ( not ( = ?auto_685316 ?auto_685323 ) ) ( not ( = ?auto_685316 ?auto_685324 ) ) ( not ( = ?auto_685316 ?auto_685325 ) ) ( not ( = ?auto_685316 ?auto_685326 ) ) ( not ( = ?auto_685316 ?auto_685327 ) ) ( not ( = ?auto_685316 ?auto_685328 ) ) ( not ( = ?auto_685316 ?auto_685329 ) ) ( not ( = ?auto_685316 ?auto_685330 ) ) ( not ( = ?auto_685316 ?auto_685331 ) ) ( not ( = ?auto_685316 ?auto_685332 ) ) ( not ( = ?auto_685317 ?auto_685318 ) ) ( not ( = ?auto_685317 ?auto_685319 ) ) ( not ( = ?auto_685317 ?auto_685320 ) ) ( not ( = ?auto_685317 ?auto_685321 ) ) ( not ( = ?auto_685317 ?auto_685322 ) ) ( not ( = ?auto_685317 ?auto_685323 ) ) ( not ( = ?auto_685317 ?auto_685324 ) ) ( not ( = ?auto_685317 ?auto_685325 ) ) ( not ( = ?auto_685317 ?auto_685326 ) ) ( not ( = ?auto_685317 ?auto_685327 ) ) ( not ( = ?auto_685317 ?auto_685328 ) ) ( not ( = ?auto_685317 ?auto_685329 ) ) ( not ( = ?auto_685317 ?auto_685330 ) ) ( not ( = ?auto_685317 ?auto_685331 ) ) ( not ( = ?auto_685317 ?auto_685332 ) ) ( not ( = ?auto_685318 ?auto_685319 ) ) ( not ( = ?auto_685318 ?auto_685320 ) ) ( not ( = ?auto_685318 ?auto_685321 ) ) ( not ( = ?auto_685318 ?auto_685322 ) ) ( not ( = ?auto_685318 ?auto_685323 ) ) ( not ( = ?auto_685318 ?auto_685324 ) ) ( not ( = ?auto_685318 ?auto_685325 ) ) ( not ( = ?auto_685318 ?auto_685326 ) ) ( not ( = ?auto_685318 ?auto_685327 ) ) ( not ( = ?auto_685318 ?auto_685328 ) ) ( not ( = ?auto_685318 ?auto_685329 ) ) ( not ( = ?auto_685318 ?auto_685330 ) ) ( not ( = ?auto_685318 ?auto_685331 ) ) ( not ( = ?auto_685318 ?auto_685332 ) ) ( not ( = ?auto_685319 ?auto_685320 ) ) ( not ( = ?auto_685319 ?auto_685321 ) ) ( not ( = ?auto_685319 ?auto_685322 ) ) ( not ( = ?auto_685319 ?auto_685323 ) ) ( not ( = ?auto_685319 ?auto_685324 ) ) ( not ( = ?auto_685319 ?auto_685325 ) ) ( not ( = ?auto_685319 ?auto_685326 ) ) ( not ( = ?auto_685319 ?auto_685327 ) ) ( not ( = ?auto_685319 ?auto_685328 ) ) ( not ( = ?auto_685319 ?auto_685329 ) ) ( not ( = ?auto_685319 ?auto_685330 ) ) ( not ( = ?auto_685319 ?auto_685331 ) ) ( not ( = ?auto_685319 ?auto_685332 ) ) ( not ( = ?auto_685320 ?auto_685321 ) ) ( not ( = ?auto_685320 ?auto_685322 ) ) ( not ( = ?auto_685320 ?auto_685323 ) ) ( not ( = ?auto_685320 ?auto_685324 ) ) ( not ( = ?auto_685320 ?auto_685325 ) ) ( not ( = ?auto_685320 ?auto_685326 ) ) ( not ( = ?auto_685320 ?auto_685327 ) ) ( not ( = ?auto_685320 ?auto_685328 ) ) ( not ( = ?auto_685320 ?auto_685329 ) ) ( not ( = ?auto_685320 ?auto_685330 ) ) ( not ( = ?auto_685320 ?auto_685331 ) ) ( not ( = ?auto_685320 ?auto_685332 ) ) ( not ( = ?auto_685321 ?auto_685322 ) ) ( not ( = ?auto_685321 ?auto_685323 ) ) ( not ( = ?auto_685321 ?auto_685324 ) ) ( not ( = ?auto_685321 ?auto_685325 ) ) ( not ( = ?auto_685321 ?auto_685326 ) ) ( not ( = ?auto_685321 ?auto_685327 ) ) ( not ( = ?auto_685321 ?auto_685328 ) ) ( not ( = ?auto_685321 ?auto_685329 ) ) ( not ( = ?auto_685321 ?auto_685330 ) ) ( not ( = ?auto_685321 ?auto_685331 ) ) ( not ( = ?auto_685321 ?auto_685332 ) ) ( not ( = ?auto_685322 ?auto_685323 ) ) ( not ( = ?auto_685322 ?auto_685324 ) ) ( not ( = ?auto_685322 ?auto_685325 ) ) ( not ( = ?auto_685322 ?auto_685326 ) ) ( not ( = ?auto_685322 ?auto_685327 ) ) ( not ( = ?auto_685322 ?auto_685328 ) ) ( not ( = ?auto_685322 ?auto_685329 ) ) ( not ( = ?auto_685322 ?auto_685330 ) ) ( not ( = ?auto_685322 ?auto_685331 ) ) ( not ( = ?auto_685322 ?auto_685332 ) ) ( not ( = ?auto_685323 ?auto_685324 ) ) ( not ( = ?auto_685323 ?auto_685325 ) ) ( not ( = ?auto_685323 ?auto_685326 ) ) ( not ( = ?auto_685323 ?auto_685327 ) ) ( not ( = ?auto_685323 ?auto_685328 ) ) ( not ( = ?auto_685323 ?auto_685329 ) ) ( not ( = ?auto_685323 ?auto_685330 ) ) ( not ( = ?auto_685323 ?auto_685331 ) ) ( not ( = ?auto_685323 ?auto_685332 ) ) ( not ( = ?auto_685324 ?auto_685325 ) ) ( not ( = ?auto_685324 ?auto_685326 ) ) ( not ( = ?auto_685324 ?auto_685327 ) ) ( not ( = ?auto_685324 ?auto_685328 ) ) ( not ( = ?auto_685324 ?auto_685329 ) ) ( not ( = ?auto_685324 ?auto_685330 ) ) ( not ( = ?auto_685324 ?auto_685331 ) ) ( not ( = ?auto_685324 ?auto_685332 ) ) ( not ( = ?auto_685325 ?auto_685326 ) ) ( not ( = ?auto_685325 ?auto_685327 ) ) ( not ( = ?auto_685325 ?auto_685328 ) ) ( not ( = ?auto_685325 ?auto_685329 ) ) ( not ( = ?auto_685325 ?auto_685330 ) ) ( not ( = ?auto_685325 ?auto_685331 ) ) ( not ( = ?auto_685325 ?auto_685332 ) ) ( not ( = ?auto_685326 ?auto_685327 ) ) ( not ( = ?auto_685326 ?auto_685328 ) ) ( not ( = ?auto_685326 ?auto_685329 ) ) ( not ( = ?auto_685326 ?auto_685330 ) ) ( not ( = ?auto_685326 ?auto_685331 ) ) ( not ( = ?auto_685326 ?auto_685332 ) ) ( not ( = ?auto_685327 ?auto_685328 ) ) ( not ( = ?auto_685327 ?auto_685329 ) ) ( not ( = ?auto_685327 ?auto_685330 ) ) ( not ( = ?auto_685327 ?auto_685331 ) ) ( not ( = ?auto_685327 ?auto_685332 ) ) ( not ( = ?auto_685328 ?auto_685329 ) ) ( not ( = ?auto_685328 ?auto_685330 ) ) ( not ( = ?auto_685328 ?auto_685331 ) ) ( not ( = ?auto_685328 ?auto_685332 ) ) ( not ( = ?auto_685329 ?auto_685330 ) ) ( not ( = ?auto_685329 ?auto_685331 ) ) ( not ( = ?auto_685329 ?auto_685332 ) ) ( not ( = ?auto_685330 ?auto_685331 ) ) ( not ( = ?auto_685330 ?auto_685332 ) ) ( not ( = ?auto_685331 ?auto_685332 ) ) ( ON ?auto_685330 ?auto_685331 ) ( CLEAR ?auto_685328 ) ( ON ?auto_685329 ?auto_685330 ) ( CLEAR ?auto_685329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_685316 ?auto_685317 ?auto_685318 ?auto_685319 ?auto_685320 ?auto_685321 ?auto_685322 ?auto_685323 ?auto_685324 ?auto_685325 ?auto_685326 ?auto_685327 ?auto_685328 ?auto_685329 )
      ( MAKE-16PILE ?auto_685316 ?auto_685317 ?auto_685318 ?auto_685319 ?auto_685320 ?auto_685321 ?auto_685322 ?auto_685323 ?auto_685324 ?auto_685325 ?auto_685326 ?auto_685327 ?auto_685328 ?auto_685329 ?auto_685330 ?auto_685331 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_685382 - BLOCK
      ?auto_685383 - BLOCK
      ?auto_685384 - BLOCK
      ?auto_685385 - BLOCK
      ?auto_685386 - BLOCK
      ?auto_685387 - BLOCK
      ?auto_685388 - BLOCK
      ?auto_685389 - BLOCK
      ?auto_685390 - BLOCK
      ?auto_685391 - BLOCK
      ?auto_685392 - BLOCK
      ?auto_685393 - BLOCK
      ?auto_685394 - BLOCK
      ?auto_685395 - BLOCK
      ?auto_685396 - BLOCK
      ?auto_685397 - BLOCK
    )
    :vars
    (
      ?auto_685398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_685397 ?auto_685398 ) ( ON-TABLE ?auto_685382 ) ( ON ?auto_685383 ?auto_685382 ) ( ON ?auto_685384 ?auto_685383 ) ( ON ?auto_685385 ?auto_685384 ) ( ON ?auto_685386 ?auto_685385 ) ( ON ?auto_685387 ?auto_685386 ) ( ON ?auto_685388 ?auto_685387 ) ( ON ?auto_685389 ?auto_685388 ) ( ON ?auto_685390 ?auto_685389 ) ( ON ?auto_685391 ?auto_685390 ) ( ON ?auto_685392 ?auto_685391 ) ( ON ?auto_685393 ?auto_685392 ) ( not ( = ?auto_685382 ?auto_685383 ) ) ( not ( = ?auto_685382 ?auto_685384 ) ) ( not ( = ?auto_685382 ?auto_685385 ) ) ( not ( = ?auto_685382 ?auto_685386 ) ) ( not ( = ?auto_685382 ?auto_685387 ) ) ( not ( = ?auto_685382 ?auto_685388 ) ) ( not ( = ?auto_685382 ?auto_685389 ) ) ( not ( = ?auto_685382 ?auto_685390 ) ) ( not ( = ?auto_685382 ?auto_685391 ) ) ( not ( = ?auto_685382 ?auto_685392 ) ) ( not ( = ?auto_685382 ?auto_685393 ) ) ( not ( = ?auto_685382 ?auto_685394 ) ) ( not ( = ?auto_685382 ?auto_685395 ) ) ( not ( = ?auto_685382 ?auto_685396 ) ) ( not ( = ?auto_685382 ?auto_685397 ) ) ( not ( = ?auto_685382 ?auto_685398 ) ) ( not ( = ?auto_685383 ?auto_685384 ) ) ( not ( = ?auto_685383 ?auto_685385 ) ) ( not ( = ?auto_685383 ?auto_685386 ) ) ( not ( = ?auto_685383 ?auto_685387 ) ) ( not ( = ?auto_685383 ?auto_685388 ) ) ( not ( = ?auto_685383 ?auto_685389 ) ) ( not ( = ?auto_685383 ?auto_685390 ) ) ( not ( = ?auto_685383 ?auto_685391 ) ) ( not ( = ?auto_685383 ?auto_685392 ) ) ( not ( = ?auto_685383 ?auto_685393 ) ) ( not ( = ?auto_685383 ?auto_685394 ) ) ( not ( = ?auto_685383 ?auto_685395 ) ) ( not ( = ?auto_685383 ?auto_685396 ) ) ( not ( = ?auto_685383 ?auto_685397 ) ) ( not ( = ?auto_685383 ?auto_685398 ) ) ( not ( = ?auto_685384 ?auto_685385 ) ) ( not ( = ?auto_685384 ?auto_685386 ) ) ( not ( = ?auto_685384 ?auto_685387 ) ) ( not ( = ?auto_685384 ?auto_685388 ) ) ( not ( = ?auto_685384 ?auto_685389 ) ) ( not ( = ?auto_685384 ?auto_685390 ) ) ( not ( = ?auto_685384 ?auto_685391 ) ) ( not ( = ?auto_685384 ?auto_685392 ) ) ( not ( = ?auto_685384 ?auto_685393 ) ) ( not ( = ?auto_685384 ?auto_685394 ) ) ( not ( = ?auto_685384 ?auto_685395 ) ) ( not ( = ?auto_685384 ?auto_685396 ) ) ( not ( = ?auto_685384 ?auto_685397 ) ) ( not ( = ?auto_685384 ?auto_685398 ) ) ( not ( = ?auto_685385 ?auto_685386 ) ) ( not ( = ?auto_685385 ?auto_685387 ) ) ( not ( = ?auto_685385 ?auto_685388 ) ) ( not ( = ?auto_685385 ?auto_685389 ) ) ( not ( = ?auto_685385 ?auto_685390 ) ) ( not ( = ?auto_685385 ?auto_685391 ) ) ( not ( = ?auto_685385 ?auto_685392 ) ) ( not ( = ?auto_685385 ?auto_685393 ) ) ( not ( = ?auto_685385 ?auto_685394 ) ) ( not ( = ?auto_685385 ?auto_685395 ) ) ( not ( = ?auto_685385 ?auto_685396 ) ) ( not ( = ?auto_685385 ?auto_685397 ) ) ( not ( = ?auto_685385 ?auto_685398 ) ) ( not ( = ?auto_685386 ?auto_685387 ) ) ( not ( = ?auto_685386 ?auto_685388 ) ) ( not ( = ?auto_685386 ?auto_685389 ) ) ( not ( = ?auto_685386 ?auto_685390 ) ) ( not ( = ?auto_685386 ?auto_685391 ) ) ( not ( = ?auto_685386 ?auto_685392 ) ) ( not ( = ?auto_685386 ?auto_685393 ) ) ( not ( = ?auto_685386 ?auto_685394 ) ) ( not ( = ?auto_685386 ?auto_685395 ) ) ( not ( = ?auto_685386 ?auto_685396 ) ) ( not ( = ?auto_685386 ?auto_685397 ) ) ( not ( = ?auto_685386 ?auto_685398 ) ) ( not ( = ?auto_685387 ?auto_685388 ) ) ( not ( = ?auto_685387 ?auto_685389 ) ) ( not ( = ?auto_685387 ?auto_685390 ) ) ( not ( = ?auto_685387 ?auto_685391 ) ) ( not ( = ?auto_685387 ?auto_685392 ) ) ( not ( = ?auto_685387 ?auto_685393 ) ) ( not ( = ?auto_685387 ?auto_685394 ) ) ( not ( = ?auto_685387 ?auto_685395 ) ) ( not ( = ?auto_685387 ?auto_685396 ) ) ( not ( = ?auto_685387 ?auto_685397 ) ) ( not ( = ?auto_685387 ?auto_685398 ) ) ( not ( = ?auto_685388 ?auto_685389 ) ) ( not ( = ?auto_685388 ?auto_685390 ) ) ( not ( = ?auto_685388 ?auto_685391 ) ) ( not ( = ?auto_685388 ?auto_685392 ) ) ( not ( = ?auto_685388 ?auto_685393 ) ) ( not ( = ?auto_685388 ?auto_685394 ) ) ( not ( = ?auto_685388 ?auto_685395 ) ) ( not ( = ?auto_685388 ?auto_685396 ) ) ( not ( = ?auto_685388 ?auto_685397 ) ) ( not ( = ?auto_685388 ?auto_685398 ) ) ( not ( = ?auto_685389 ?auto_685390 ) ) ( not ( = ?auto_685389 ?auto_685391 ) ) ( not ( = ?auto_685389 ?auto_685392 ) ) ( not ( = ?auto_685389 ?auto_685393 ) ) ( not ( = ?auto_685389 ?auto_685394 ) ) ( not ( = ?auto_685389 ?auto_685395 ) ) ( not ( = ?auto_685389 ?auto_685396 ) ) ( not ( = ?auto_685389 ?auto_685397 ) ) ( not ( = ?auto_685389 ?auto_685398 ) ) ( not ( = ?auto_685390 ?auto_685391 ) ) ( not ( = ?auto_685390 ?auto_685392 ) ) ( not ( = ?auto_685390 ?auto_685393 ) ) ( not ( = ?auto_685390 ?auto_685394 ) ) ( not ( = ?auto_685390 ?auto_685395 ) ) ( not ( = ?auto_685390 ?auto_685396 ) ) ( not ( = ?auto_685390 ?auto_685397 ) ) ( not ( = ?auto_685390 ?auto_685398 ) ) ( not ( = ?auto_685391 ?auto_685392 ) ) ( not ( = ?auto_685391 ?auto_685393 ) ) ( not ( = ?auto_685391 ?auto_685394 ) ) ( not ( = ?auto_685391 ?auto_685395 ) ) ( not ( = ?auto_685391 ?auto_685396 ) ) ( not ( = ?auto_685391 ?auto_685397 ) ) ( not ( = ?auto_685391 ?auto_685398 ) ) ( not ( = ?auto_685392 ?auto_685393 ) ) ( not ( = ?auto_685392 ?auto_685394 ) ) ( not ( = ?auto_685392 ?auto_685395 ) ) ( not ( = ?auto_685392 ?auto_685396 ) ) ( not ( = ?auto_685392 ?auto_685397 ) ) ( not ( = ?auto_685392 ?auto_685398 ) ) ( not ( = ?auto_685393 ?auto_685394 ) ) ( not ( = ?auto_685393 ?auto_685395 ) ) ( not ( = ?auto_685393 ?auto_685396 ) ) ( not ( = ?auto_685393 ?auto_685397 ) ) ( not ( = ?auto_685393 ?auto_685398 ) ) ( not ( = ?auto_685394 ?auto_685395 ) ) ( not ( = ?auto_685394 ?auto_685396 ) ) ( not ( = ?auto_685394 ?auto_685397 ) ) ( not ( = ?auto_685394 ?auto_685398 ) ) ( not ( = ?auto_685395 ?auto_685396 ) ) ( not ( = ?auto_685395 ?auto_685397 ) ) ( not ( = ?auto_685395 ?auto_685398 ) ) ( not ( = ?auto_685396 ?auto_685397 ) ) ( not ( = ?auto_685396 ?auto_685398 ) ) ( not ( = ?auto_685397 ?auto_685398 ) ) ( ON ?auto_685396 ?auto_685397 ) ( ON ?auto_685395 ?auto_685396 ) ( CLEAR ?auto_685393 ) ( ON ?auto_685394 ?auto_685395 ) ( CLEAR ?auto_685394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_685382 ?auto_685383 ?auto_685384 ?auto_685385 ?auto_685386 ?auto_685387 ?auto_685388 ?auto_685389 ?auto_685390 ?auto_685391 ?auto_685392 ?auto_685393 ?auto_685394 )
      ( MAKE-16PILE ?auto_685382 ?auto_685383 ?auto_685384 ?auto_685385 ?auto_685386 ?auto_685387 ?auto_685388 ?auto_685389 ?auto_685390 ?auto_685391 ?auto_685392 ?auto_685393 ?auto_685394 ?auto_685395 ?auto_685396 ?auto_685397 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_685448 - BLOCK
      ?auto_685449 - BLOCK
      ?auto_685450 - BLOCK
      ?auto_685451 - BLOCK
      ?auto_685452 - BLOCK
      ?auto_685453 - BLOCK
      ?auto_685454 - BLOCK
      ?auto_685455 - BLOCK
      ?auto_685456 - BLOCK
      ?auto_685457 - BLOCK
      ?auto_685458 - BLOCK
      ?auto_685459 - BLOCK
      ?auto_685460 - BLOCK
      ?auto_685461 - BLOCK
      ?auto_685462 - BLOCK
      ?auto_685463 - BLOCK
    )
    :vars
    (
      ?auto_685464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_685463 ?auto_685464 ) ( ON-TABLE ?auto_685448 ) ( ON ?auto_685449 ?auto_685448 ) ( ON ?auto_685450 ?auto_685449 ) ( ON ?auto_685451 ?auto_685450 ) ( ON ?auto_685452 ?auto_685451 ) ( ON ?auto_685453 ?auto_685452 ) ( ON ?auto_685454 ?auto_685453 ) ( ON ?auto_685455 ?auto_685454 ) ( ON ?auto_685456 ?auto_685455 ) ( ON ?auto_685457 ?auto_685456 ) ( ON ?auto_685458 ?auto_685457 ) ( not ( = ?auto_685448 ?auto_685449 ) ) ( not ( = ?auto_685448 ?auto_685450 ) ) ( not ( = ?auto_685448 ?auto_685451 ) ) ( not ( = ?auto_685448 ?auto_685452 ) ) ( not ( = ?auto_685448 ?auto_685453 ) ) ( not ( = ?auto_685448 ?auto_685454 ) ) ( not ( = ?auto_685448 ?auto_685455 ) ) ( not ( = ?auto_685448 ?auto_685456 ) ) ( not ( = ?auto_685448 ?auto_685457 ) ) ( not ( = ?auto_685448 ?auto_685458 ) ) ( not ( = ?auto_685448 ?auto_685459 ) ) ( not ( = ?auto_685448 ?auto_685460 ) ) ( not ( = ?auto_685448 ?auto_685461 ) ) ( not ( = ?auto_685448 ?auto_685462 ) ) ( not ( = ?auto_685448 ?auto_685463 ) ) ( not ( = ?auto_685448 ?auto_685464 ) ) ( not ( = ?auto_685449 ?auto_685450 ) ) ( not ( = ?auto_685449 ?auto_685451 ) ) ( not ( = ?auto_685449 ?auto_685452 ) ) ( not ( = ?auto_685449 ?auto_685453 ) ) ( not ( = ?auto_685449 ?auto_685454 ) ) ( not ( = ?auto_685449 ?auto_685455 ) ) ( not ( = ?auto_685449 ?auto_685456 ) ) ( not ( = ?auto_685449 ?auto_685457 ) ) ( not ( = ?auto_685449 ?auto_685458 ) ) ( not ( = ?auto_685449 ?auto_685459 ) ) ( not ( = ?auto_685449 ?auto_685460 ) ) ( not ( = ?auto_685449 ?auto_685461 ) ) ( not ( = ?auto_685449 ?auto_685462 ) ) ( not ( = ?auto_685449 ?auto_685463 ) ) ( not ( = ?auto_685449 ?auto_685464 ) ) ( not ( = ?auto_685450 ?auto_685451 ) ) ( not ( = ?auto_685450 ?auto_685452 ) ) ( not ( = ?auto_685450 ?auto_685453 ) ) ( not ( = ?auto_685450 ?auto_685454 ) ) ( not ( = ?auto_685450 ?auto_685455 ) ) ( not ( = ?auto_685450 ?auto_685456 ) ) ( not ( = ?auto_685450 ?auto_685457 ) ) ( not ( = ?auto_685450 ?auto_685458 ) ) ( not ( = ?auto_685450 ?auto_685459 ) ) ( not ( = ?auto_685450 ?auto_685460 ) ) ( not ( = ?auto_685450 ?auto_685461 ) ) ( not ( = ?auto_685450 ?auto_685462 ) ) ( not ( = ?auto_685450 ?auto_685463 ) ) ( not ( = ?auto_685450 ?auto_685464 ) ) ( not ( = ?auto_685451 ?auto_685452 ) ) ( not ( = ?auto_685451 ?auto_685453 ) ) ( not ( = ?auto_685451 ?auto_685454 ) ) ( not ( = ?auto_685451 ?auto_685455 ) ) ( not ( = ?auto_685451 ?auto_685456 ) ) ( not ( = ?auto_685451 ?auto_685457 ) ) ( not ( = ?auto_685451 ?auto_685458 ) ) ( not ( = ?auto_685451 ?auto_685459 ) ) ( not ( = ?auto_685451 ?auto_685460 ) ) ( not ( = ?auto_685451 ?auto_685461 ) ) ( not ( = ?auto_685451 ?auto_685462 ) ) ( not ( = ?auto_685451 ?auto_685463 ) ) ( not ( = ?auto_685451 ?auto_685464 ) ) ( not ( = ?auto_685452 ?auto_685453 ) ) ( not ( = ?auto_685452 ?auto_685454 ) ) ( not ( = ?auto_685452 ?auto_685455 ) ) ( not ( = ?auto_685452 ?auto_685456 ) ) ( not ( = ?auto_685452 ?auto_685457 ) ) ( not ( = ?auto_685452 ?auto_685458 ) ) ( not ( = ?auto_685452 ?auto_685459 ) ) ( not ( = ?auto_685452 ?auto_685460 ) ) ( not ( = ?auto_685452 ?auto_685461 ) ) ( not ( = ?auto_685452 ?auto_685462 ) ) ( not ( = ?auto_685452 ?auto_685463 ) ) ( not ( = ?auto_685452 ?auto_685464 ) ) ( not ( = ?auto_685453 ?auto_685454 ) ) ( not ( = ?auto_685453 ?auto_685455 ) ) ( not ( = ?auto_685453 ?auto_685456 ) ) ( not ( = ?auto_685453 ?auto_685457 ) ) ( not ( = ?auto_685453 ?auto_685458 ) ) ( not ( = ?auto_685453 ?auto_685459 ) ) ( not ( = ?auto_685453 ?auto_685460 ) ) ( not ( = ?auto_685453 ?auto_685461 ) ) ( not ( = ?auto_685453 ?auto_685462 ) ) ( not ( = ?auto_685453 ?auto_685463 ) ) ( not ( = ?auto_685453 ?auto_685464 ) ) ( not ( = ?auto_685454 ?auto_685455 ) ) ( not ( = ?auto_685454 ?auto_685456 ) ) ( not ( = ?auto_685454 ?auto_685457 ) ) ( not ( = ?auto_685454 ?auto_685458 ) ) ( not ( = ?auto_685454 ?auto_685459 ) ) ( not ( = ?auto_685454 ?auto_685460 ) ) ( not ( = ?auto_685454 ?auto_685461 ) ) ( not ( = ?auto_685454 ?auto_685462 ) ) ( not ( = ?auto_685454 ?auto_685463 ) ) ( not ( = ?auto_685454 ?auto_685464 ) ) ( not ( = ?auto_685455 ?auto_685456 ) ) ( not ( = ?auto_685455 ?auto_685457 ) ) ( not ( = ?auto_685455 ?auto_685458 ) ) ( not ( = ?auto_685455 ?auto_685459 ) ) ( not ( = ?auto_685455 ?auto_685460 ) ) ( not ( = ?auto_685455 ?auto_685461 ) ) ( not ( = ?auto_685455 ?auto_685462 ) ) ( not ( = ?auto_685455 ?auto_685463 ) ) ( not ( = ?auto_685455 ?auto_685464 ) ) ( not ( = ?auto_685456 ?auto_685457 ) ) ( not ( = ?auto_685456 ?auto_685458 ) ) ( not ( = ?auto_685456 ?auto_685459 ) ) ( not ( = ?auto_685456 ?auto_685460 ) ) ( not ( = ?auto_685456 ?auto_685461 ) ) ( not ( = ?auto_685456 ?auto_685462 ) ) ( not ( = ?auto_685456 ?auto_685463 ) ) ( not ( = ?auto_685456 ?auto_685464 ) ) ( not ( = ?auto_685457 ?auto_685458 ) ) ( not ( = ?auto_685457 ?auto_685459 ) ) ( not ( = ?auto_685457 ?auto_685460 ) ) ( not ( = ?auto_685457 ?auto_685461 ) ) ( not ( = ?auto_685457 ?auto_685462 ) ) ( not ( = ?auto_685457 ?auto_685463 ) ) ( not ( = ?auto_685457 ?auto_685464 ) ) ( not ( = ?auto_685458 ?auto_685459 ) ) ( not ( = ?auto_685458 ?auto_685460 ) ) ( not ( = ?auto_685458 ?auto_685461 ) ) ( not ( = ?auto_685458 ?auto_685462 ) ) ( not ( = ?auto_685458 ?auto_685463 ) ) ( not ( = ?auto_685458 ?auto_685464 ) ) ( not ( = ?auto_685459 ?auto_685460 ) ) ( not ( = ?auto_685459 ?auto_685461 ) ) ( not ( = ?auto_685459 ?auto_685462 ) ) ( not ( = ?auto_685459 ?auto_685463 ) ) ( not ( = ?auto_685459 ?auto_685464 ) ) ( not ( = ?auto_685460 ?auto_685461 ) ) ( not ( = ?auto_685460 ?auto_685462 ) ) ( not ( = ?auto_685460 ?auto_685463 ) ) ( not ( = ?auto_685460 ?auto_685464 ) ) ( not ( = ?auto_685461 ?auto_685462 ) ) ( not ( = ?auto_685461 ?auto_685463 ) ) ( not ( = ?auto_685461 ?auto_685464 ) ) ( not ( = ?auto_685462 ?auto_685463 ) ) ( not ( = ?auto_685462 ?auto_685464 ) ) ( not ( = ?auto_685463 ?auto_685464 ) ) ( ON ?auto_685462 ?auto_685463 ) ( ON ?auto_685461 ?auto_685462 ) ( ON ?auto_685460 ?auto_685461 ) ( CLEAR ?auto_685458 ) ( ON ?auto_685459 ?auto_685460 ) ( CLEAR ?auto_685459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_685448 ?auto_685449 ?auto_685450 ?auto_685451 ?auto_685452 ?auto_685453 ?auto_685454 ?auto_685455 ?auto_685456 ?auto_685457 ?auto_685458 ?auto_685459 )
      ( MAKE-16PILE ?auto_685448 ?auto_685449 ?auto_685450 ?auto_685451 ?auto_685452 ?auto_685453 ?auto_685454 ?auto_685455 ?auto_685456 ?auto_685457 ?auto_685458 ?auto_685459 ?auto_685460 ?auto_685461 ?auto_685462 ?auto_685463 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_685514 - BLOCK
      ?auto_685515 - BLOCK
      ?auto_685516 - BLOCK
      ?auto_685517 - BLOCK
      ?auto_685518 - BLOCK
      ?auto_685519 - BLOCK
      ?auto_685520 - BLOCK
      ?auto_685521 - BLOCK
      ?auto_685522 - BLOCK
      ?auto_685523 - BLOCK
      ?auto_685524 - BLOCK
      ?auto_685525 - BLOCK
      ?auto_685526 - BLOCK
      ?auto_685527 - BLOCK
      ?auto_685528 - BLOCK
      ?auto_685529 - BLOCK
    )
    :vars
    (
      ?auto_685530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_685529 ?auto_685530 ) ( ON-TABLE ?auto_685514 ) ( ON ?auto_685515 ?auto_685514 ) ( ON ?auto_685516 ?auto_685515 ) ( ON ?auto_685517 ?auto_685516 ) ( ON ?auto_685518 ?auto_685517 ) ( ON ?auto_685519 ?auto_685518 ) ( ON ?auto_685520 ?auto_685519 ) ( ON ?auto_685521 ?auto_685520 ) ( ON ?auto_685522 ?auto_685521 ) ( ON ?auto_685523 ?auto_685522 ) ( not ( = ?auto_685514 ?auto_685515 ) ) ( not ( = ?auto_685514 ?auto_685516 ) ) ( not ( = ?auto_685514 ?auto_685517 ) ) ( not ( = ?auto_685514 ?auto_685518 ) ) ( not ( = ?auto_685514 ?auto_685519 ) ) ( not ( = ?auto_685514 ?auto_685520 ) ) ( not ( = ?auto_685514 ?auto_685521 ) ) ( not ( = ?auto_685514 ?auto_685522 ) ) ( not ( = ?auto_685514 ?auto_685523 ) ) ( not ( = ?auto_685514 ?auto_685524 ) ) ( not ( = ?auto_685514 ?auto_685525 ) ) ( not ( = ?auto_685514 ?auto_685526 ) ) ( not ( = ?auto_685514 ?auto_685527 ) ) ( not ( = ?auto_685514 ?auto_685528 ) ) ( not ( = ?auto_685514 ?auto_685529 ) ) ( not ( = ?auto_685514 ?auto_685530 ) ) ( not ( = ?auto_685515 ?auto_685516 ) ) ( not ( = ?auto_685515 ?auto_685517 ) ) ( not ( = ?auto_685515 ?auto_685518 ) ) ( not ( = ?auto_685515 ?auto_685519 ) ) ( not ( = ?auto_685515 ?auto_685520 ) ) ( not ( = ?auto_685515 ?auto_685521 ) ) ( not ( = ?auto_685515 ?auto_685522 ) ) ( not ( = ?auto_685515 ?auto_685523 ) ) ( not ( = ?auto_685515 ?auto_685524 ) ) ( not ( = ?auto_685515 ?auto_685525 ) ) ( not ( = ?auto_685515 ?auto_685526 ) ) ( not ( = ?auto_685515 ?auto_685527 ) ) ( not ( = ?auto_685515 ?auto_685528 ) ) ( not ( = ?auto_685515 ?auto_685529 ) ) ( not ( = ?auto_685515 ?auto_685530 ) ) ( not ( = ?auto_685516 ?auto_685517 ) ) ( not ( = ?auto_685516 ?auto_685518 ) ) ( not ( = ?auto_685516 ?auto_685519 ) ) ( not ( = ?auto_685516 ?auto_685520 ) ) ( not ( = ?auto_685516 ?auto_685521 ) ) ( not ( = ?auto_685516 ?auto_685522 ) ) ( not ( = ?auto_685516 ?auto_685523 ) ) ( not ( = ?auto_685516 ?auto_685524 ) ) ( not ( = ?auto_685516 ?auto_685525 ) ) ( not ( = ?auto_685516 ?auto_685526 ) ) ( not ( = ?auto_685516 ?auto_685527 ) ) ( not ( = ?auto_685516 ?auto_685528 ) ) ( not ( = ?auto_685516 ?auto_685529 ) ) ( not ( = ?auto_685516 ?auto_685530 ) ) ( not ( = ?auto_685517 ?auto_685518 ) ) ( not ( = ?auto_685517 ?auto_685519 ) ) ( not ( = ?auto_685517 ?auto_685520 ) ) ( not ( = ?auto_685517 ?auto_685521 ) ) ( not ( = ?auto_685517 ?auto_685522 ) ) ( not ( = ?auto_685517 ?auto_685523 ) ) ( not ( = ?auto_685517 ?auto_685524 ) ) ( not ( = ?auto_685517 ?auto_685525 ) ) ( not ( = ?auto_685517 ?auto_685526 ) ) ( not ( = ?auto_685517 ?auto_685527 ) ) ( not ( = ?auto_685517 ?auto_685528 ) ) ( not ( = ?auto_685517 ?auto_685529 ) ) ( not ( = ?auto_685517 ?auto_685530 ) ) ( not ( = ?auto_685518 ?auto_685519 ) ) ( not ( = ?auto_685518 ?auto_685520 ) ) ( not ( = ?auto_685518 ?auto_685521 ) ) ( not ( = ?auto_685518 ?auto_685522 ) ) ( not ( = ?auto_685518 ?auto_685523 ) ) ( not ( = ?auto_685518 ?auto_685524 ) ) ( not ( = ?auto_685518 ?auto_685525 ) ) ( not ( = ?auto_685518 ?auto_685526 ) ) ( not ( = ?auto_685518 ?auto_685527 ) ) ( not ( = ?auto_685518 ?auto_685528 ) ) ( not ( = ?auto_685518 ?auto_685529 ) ) ( not ( = ?auto_685518 ?auto_685530 ) ) ( not ( = ?auto_685519 ?auto_685520 ) ) ( not ( = ?auto_685519 ?auto_685521 ) ) ( not ( = ?auto_685519 ?auto_685522 ) ) ( not ( = ?auto_685519 ?auto_685523 ) ) ( not ( = ?auto_685519 ?auto_685524 ) ) ( not ( = ?auto_685519 ?auto_685525 ) ) ( not ( = ?auto_685519 ?auto_685526 ) ) ( not ( = ?auto_685519 ?auto_685527 ) ) ( not ( = ?auto_685519 ?auto_685528 ) ) ( not ( = ?auto_685519 ?auto_685529 ) ) ( not ( = ?auto_685519 ?auto_685530 ) ) ( not ( = ?auto_685520 ?auto_685521 ) ) ( not ( = ?auto_685520 ?auto_685522 ) ) ( not ( = ?auto_685520 ?auto_685523 ) ) ( not ( = ?auto_685520 ?auto_685524 ) ) ( not ( = ?auto_685520 ?auto_685525 ) ) ( not ( = ?auto_685520 ?auto_685526 ) ) ( not ( = ?auto_685520 ?auto_685527 ) ) ( not ( = ?auto_685520 ?auto_685528 ) ) ( not ( = ?auto_685520 ?auto_685529 ) ) ( not ( = ?auto_685520 ?auto_685530 ) ) ( not ( = ?auto_685521 ?auto_685522 ) ) ( not ( = ?auto_685521 ?auto_685523 ) ) ( not ( = ?auto_685521 ?auto_685524 ) ) ( not ( = ?auto_685521 ?auto_685525 ) ) ( not ( = ?auto_685521 ?auto_685526 ) ) ( not ( = ?auto_685521 ?auto_685527 ) ) ( not ( = ?auto_685521 ?auto_685528 ) ) ( not ( = ?auto_685521 ?auto_685529 ) ) ( not ( = ?auto_685521 ?auto_685530 ) ) ( not ( = ?auto_685522 ?auto_685523 ) ) ( not ( = ?auto_685522 ?auto_685524 ) ) ( not ( = ?auto_685522 ?auto_685525 ) ) ( not ( = ?auto_685522 ?auto_685526 ) ) ( not ( = ?auto_685522 ?auto_685527 ) ) ( not ( = ?auto_685522 ?auto_685528 ) ) ( not ( = ?auto_685522 ?auto_685529 ) ) ( not ( = ?auto_685522 ?auto_685530 ) ) ( not ( = ?auto_685523 ?auto_685524 ) ) ( not ( = ?auto_685523 ?auto_685525 ) ) ( not ( = ?auto_685523 ?auto_685526 ) ) ( not ( = ?auto_685523 ?auto_685527 ) ) ( not ( = ?auto_685523 ?auto_685528 ) ) ( not ( = ?auto_685523 ?auto_685529 ) ) ( not ( = ?auto_685523 ?auto_685530 ) ) ( not ( = ?auto_685524 ?auto_685525 ) ) ( not ( = ?auto_685524 ?auto_685526 ) ) ( not ( = ?auto_685524 ?auto_685527 ) ) ( not ( = ?auto_685524 ?auto_685528 ) ) ( not ( = ?auto_685524 ?auto_685529 ) ) ( not ( = ?auto_685524 ?auto_685530 ) ) ( not ( = ?auto_685525 ?auto_685526 ) ) ( not ( = ?auto_685525 ?auto_685527 ) ) ( not ( = ?auto_685525 ?auto_685528 ) ) ( not ( = ?auto_685525 ?auto_685529 ) ) ( not ( = ?auto_685525 ?auto_685530 ) ) ( not ( = ?auto_685526 ?auto_685527 ) ) ( not ( = ?auto_685526 ?auto_685528 ) ) ( not ( = ?auto_685526 ?auto_685529 ) ) ( not ( = ?auto_685526 ?auto_685530 ) ) ( not ( = ?auto_685527 ?auto_685528 ) ) ( not ( = ?auto_685527 ?auto_685529 ) ) ( not ( = ?auto_685527 ?auto_685530 ) ) ( not ( = ?auto_685528 ?auto_685529 ) ) ( not ( = ?auto_685528 ?auto_685530 ) ) ( not ( = ?auto_685529 ?auto_685530 ) ) ( ON ?auto_685528 ?auto_685529 ) ( ON ?auto_685527 ?auto_685528 ) ( ON ?auto_685526 ?auto_685527 ) ( ON ?auto_685525 ?auto_685526 ) ( CLEAR ?auto_685523 ) ( ON ?auto_685524 ?auto_685525 ) ( CLEAR ?auto_685524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_685514 ?auto_685515 ?auto_685516 ?auto_685517 ?auto_685518 ?auto_685519 ?auto_685520 ?auto_685521 ?auto_685522 ?auto_685523 ?auto_685524 )
      ( MAKE-16PILE ?auto_685514 ?auto_685515 ?auto_685516 ?auto_685517 ?auto_685518 ?auto_685519 ?auto_685520 ?auto_685521 ?auto_685522 ?auto_685523 ?auto_685524 ?auto_685525 ?auto_685526 ?auto_685527 ?auto_685528 ?auto_685529 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_685580 - BLOCK
      ?auto_685581 - BLOCK
      ?auto_685582 - BLOCK
      ?auto_685583 - BLOCK
      ?auto_685584 - BLOCK
      ?auto_685585 - BLOCK
      ?auto_685586 - BLOCK
      ?auto_685587 - BLOCK
      ?auto_685588 - BLOCK
      ?auto_685589 - BLOCK
      ?auto_685590 - BLOCK
      ?auto_685591 - BLOCK
      ?auto_685592 - BLOCK
      ?auto_685593 - BLOCK
      ?auto_685594 - BLOCK
      ?auto_685595 - BLOCK
    )
    :vars
    (
      ?auto_685596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_685595 ?auto_685596 ) ( ON-TABLE ?auto_685580 ) ( ON ?auto_685581 ?auto_685580 ) ( ON ?auto_685582 ?auto_685581 ) ( ON ?auto_685583 ?auto_685582 ) ( ON ?auto_685584 ?auto_685583 ) ( ON ?auto_685585 ?auto_685584 ) ( ON ?auto_685586 ?auto_685585 ) ( ON ?auto_685587 ?auto_685586 ) ( ON ?auto_685588 ?auto_685587 ) ( not ( = ?auto_685580 ?auto_685581 ) ) ( not ( = ?auto_685580 ?auto_685582 ) ) ( not ( = ?auto_685580 ?auto_685583 ) ) ( not ( = ?auto_685580 ?auto_685584 ) ) ( not ( = ?auto_685580 ?auto_685585 ) ) ( not ( = ?auto_685580 ?auto_685586 ) ) ( not ( = ?auto_685580 ?auto_685587 ) ) ( not ( = ?auto_685580 ?auto_685588 ) ) ( not ( = ?auto_685580 ?auto_685589 ) ) ( not ( = ?auto_685580 ?auto_685590 ) ) ( not ( = ?auto_685580 ?auto_685591 ) ) ( not ( = ?auto_685580 ?auto_685592 ) ) ( not ( = ?auto_685580 ?auto_685593 ) ) ( not ( = ?auto_685580 ?auto_685594 ) ) ( not ( = ?auto_685580 ?auto_685595 ) ) ( not ( = ?auto_685580 ?auto_685596 ) ) ( not ( = ?auto_685581 ?auto_685582 ) ) ( not ( = ?auto_685581 ?auto_685583 ) ) ( not ( = ?auto_685581 ?auto_685584 ) ) ( not ( = ?auto_685581 ?auto_685585 ) ) ( not ( = ?auto_685581 ?auto_685586 ) ) ( not ( = ?auto_685581 ?auto_685587 ) ) ( not ( = ?auto_685581 ?auto_685588 ) ) ( not ( = ?auto_685581 ?auto_685589 ) ) ( not ( = ?auto_685581 ?auto_685590 ) ) ( not ( = ?auto_685581 ?auto_685591 ) ) ( not ( = ?auto_685581 ?auto_685592 ) ) ( not ( = ?auto_685581 ?auto_685593 ) ) ( not ( = ?auto_685581 ?auto_685594 ) ) ( not ( = ?auto_685581 ?auto_685595 ) ) ( not ( = ?auto_685581 ?auto_685596 ) ) ( not ( = ?auto_685582 ?auto_685583 ) ) ( not ( = ?auto_685582 ?auto_685584 ) ) ( not ( = ?auto_685582 ?auto_685585 ) ) ( not ( = ?auto_685582 ?auto_685586 ) ) ( not ( = ?auto_685582 ?auto_685587 ) ) ( not ( = ?auto_685582 ?auto_685588 ) ) ( not ( = ?auto_685582 ?auto_685589 ) ) ( not ( = ?auto_685582 ?auto_685590 ) ) ( not ( = ?auto_685582 ?auto_685591 ) ) ( not ( = ?auto_685582 ?auto_685592 ) ) ( not ( = ?auto_685582 ?auto_685593 ) ) ( not ( = ?auto_685582 ?auto_685594 ) ) ( not ( = ?auto_685582 ?auto_685595 ) ) ( not ( = ?auto_685582 ?auto_685596 ) ) ( not ( = ?auto_685583 ?auto_685584 ) ) ( not ( = ?auto_685583 ?auto_685585 ) ) ( not ( = ?auto_685583 ?auto_685586 ) ) ( not ( = ?auto_685583 ?auto_685587 ) ) ( not ( = ?auto_685583 ?auto_685588 ) ) ( not ( = ?auto_685583 ?auto_685589 ) ) ( not ( = ?auto_685583 ?auto_685590 ) ) ( not ( = ?auto_685583 ?auto_685591 ) ) ( not ( = ?auto_685583 ?auto_685592 ) ) ( not ( = ?auto_685583 ?auto_685593 ) ) ( not ( = ?auto_685583 ?auto_685594 ) ) ( not ( = ?auto_685583 ?auto_685595 ) ) ( not ( = ?auto_685583 ?auto_685596 ) ) ( not ( = ?auto_685584 ?auto_685585 ) ) ( not ( = ?auto_685584 ?auto_685586 ) ) ( not ( = ?auto_685584 ?auto_685587 ) ) ( not ( = ?auto_685584 ?auto_685588 ) ) ( not ( = ?auto_685584 ?auto_685589 ) ) ( not ( = ?auto_685584 ?auto_685590 ) ) ( not ( = ?auto_685584 ?auto_685591 ) ) ( not ( = ?auto_685584 ?auto_685592 ) ) ( not ( = ?auto_685584 ?auto_685593 ) ) ( not ( = ?auto_685584 ?auto_685594 ) ) ( not ( = ?auto_685584 ?auto_685595 ) ) ( not ( = ?auto_685584 ?auto_685596 ) ) ( not ( = ?auto_685585 ?auto_685586 ) ) ( not ( = ?auto_685585 ?auto_685587 ) ) ( not ( = ?auto_685585 ?auto_685588 ) ) ( not ( = ?auto_685585 ?auto_685589 ) ) ( not ( = ?auto_685585 ?auto_685590 ) ) ( not ( = ?auto_685585 ?auto_685591 ) ) ( not ( = ?auto_685585 ?auto_685592 ) ) ( not ( = ?auto_685585 ?auto_685593 ) ) ( not ( = ?auto_685585 ?auto_685594 ) ) ( not ( = ?auto_685585 ?auto_685595 ) ) ( not ( = ?auto_685585 ?auto_685596 ) ) ( not ( = ?auto_685586 ?auto_685587 ) ) ( not ( = ?auto_685586 ?auto_685588 ) ) ( not ( = ?auto_685586 ?auto_685589 ) ) ( not ( = ?auto_685586 ?auto_685590 ) ) ( not ( = ?auto_685586 ?auto_685591 ) ) ( not ( = ?auto_685586 ?auto_685592 ) ) ( not ( = ?auto_685586 ?auto_685593 ) ) ( not ( = ?auto_685586 ?auto_685594 ) ) ( not ( = ?auto_685586 ?auto_685595 ) ) ( not ( = ?auto_685586 ?auto_685596 ) ) ( not ( = ?auto_685587 ?auto_685588 ) ) ( not ( = ?auto_685587 ?auto_685589 ) ) ( not ( = ?auto_685587 ?auto_685590 ) ) ( not ( = ?auto_685587 ?auto_685591 ) ) ( not ( = ?auto_685587 ?auto_685592 ) ) ( not ( = ?auto_685587 ?auto_685593 ) ) ( not ( = ?auto_685587 ?auto_685594 ) ) ( not ( = ?auto_685587 ?auto_685595 ) ) ( not ( = ?auto_685587 ?auto_685596 ) ) ( not ( = ?auto_685588 ?auto_685589 ) ) ( not ( = ?auto_685588 ?auto_685590 ) ) ( not ( = ?auto_685588 ?auto_685591 ) ) ( not ( = ?auto_685588 ?auto_685592 ) ) ( not ( = ?auto_685588 ?auto_685593 ) ) ( not ( = ?auto_685588 ?auto_685594 ) ) ( not ( = ?auto_685588 ?auto_685595 ) ) ( not ( = ?auto_685588 ?auto_685596 ) ) ( not ( = ?auto_685589 ?auto_685590 ) ) ( not ( = ?auto_685589 ?auto_685591 ) ) ( not ( = ?auto_685589 ?auto_685592 ) ) ( not ( = ?auto_685589 ?auto_685593 ) ) ( not ( = ?auto_685589 ?auto_685594 ) ) ( not ( = ?auto_685589 ?auto_685595 ) ) ( not ( = ?auto_685589 ?auto_685596 ) ) ( not ( = ?auto_685590 ?auto_685591 ) ) ( not ( = ?auto_685590 ?auto_685592 ) ) ( not ( = ?auto_685590 ?auto_685593 ) ) ( not ( = ?auto_685590 ?auto_685594 ) ) ( not ( = ?auto_685590 ?auto_685595 ) ) ( not ( = ?auto_685590 ?auto_685596 ) ) ( not ( = ?auto_685591 ?auto_685592 ) ) ( not ( = ?auto_685591 ?auto_685593 ) ) ( not ( = ?auto_685591 ?auto_685594 ) ) ( not ( = ?auto_685591 ?auto_685595 ) ) ( not ( = ?auto_685591 ?auto_685596 ) ) ( not ( = ?auto_685592 ?auto_685593 ) ) ( not ( = ?auto_685592 ?auto_685594 ) ) ( not ( = ?auto_685592 ?auto_685595 ) ) ( not ( = ?auto_685592 ?auto_685596 ) ) ( not ( = ?auto_685593 ?auto_685594 ) ) ( not ( = ?auto_685593 ?auto_685595 ) ) ( not ( = ?auto_685593 ?auto_685596 ) ) ( not ( = ?auto_685594 ?auto_685595 ) ) ( not ( = ?auto_685594 ?auto_685596 ) ) ( not ( = ?auto_685595 ?auto_685596 ) ) ( ON ?auto_685594 ?auto_685595 ) ( ON ?auto_685593 ?auto_685594 ) ( ON ?auto_685592 ?auto_685593 ) ( ON ?auto_685591 ?auto_685592 ) ( ON ?auto_685590 ?auto_685591 ) ( CLEAR ?auto_685588 ) ( ON ?auto_685589 ?auto_685590 ) ( CLEAR ?auto_685589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_685580 ?auto_685581 ?auto_685582 ?auto_685583 ?auto_685584 ?auto_685585 ?auto_685586 ?auto_685587 ?auto_685588 ?auto_685589 )
      ( MAKE-16PILE ?auto_685580 ?auto_685581 ?auto_685582 ?auto_685583 ?auto_685584 ?auto_685585 ?auto_685586 ?auto_685587 ?auto_685588 ?auto_685589 ?auto_685590 ?auto_685591 ?auto_685592 ?auto_685593 ?auto_685594 ?auto_685595 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_685646 - BLOCK
      ?auto_685647 - BLOCK
      ?auto_685648 - BLOCK
      ?auto_685649 - BLOCK
      ?auto_685650 - BLOCK
      ?auto_685651 - BLOCK
      ?auto_685652 - BLOCK
      ?auto_685653 - BLOCK
      ?auto_685654 - BLOCK
      ?auto_685655 - BLOCK
      ?auto_685656 - BLOCK
      ?auto_685657 - BLOCK
      ?auto_685658 - BLOCK
      ?auto_685659 - BLOCK
      ?auto_685660 - BLOCK
      ?auto_685661 - BLOCK
    )
    :vars
    (
      ?auto_685662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_685661 ?auto_685662 ) ( ON-TABLE ?auto_685646 ) ( ON ?auto_685647 ?auto_685646 ) ( ON ?auto_685648 ?auto_685647 ) ( ON ?auto_685649 ?auto_685648 ) ( ON ?auto_685650 ?auto_685649 ) ( ON ?auto_685651 ?auto_685650 ) ( ON ?auto_685652 ?auto_685651 ) ( ON ?auto_685653 ?auto_685652 ) ( not ( = ?auto_685646 ?auto_685647 ) ) ( not ( = ?auto_685646 ?auto_685648 ) ) ( not ( = ?auto_685646 ?auto_685649 ) ) ( not ( = ?auto_685646 ?auto_685650 ) ) ( not ( = ?auto_685646 ?auto_685651 ) ) ( not ( = ?auto_685646 ?auto_685652 ) ) ( not ( = ?auto_685646 ?auto_685653 ) ) ( not ( = ?auto_685646 ?auto_685654 ) ) ( not ( = ?auto_685646 ?auto_685655 ) ) ( not ( = ?auto_685646 ?auto_685656 ) ) ( not ( = ?auto_685646 ?auto_685657 ) ) ( not ( = ?auto_685646 ?auto_685658 ) ) ( not ( = ?auto_685646 ?auto_685659 ) ) ( not ( = ?auto_685646 ?auto_685660 ) ) ( not ( = ?auto_685646 ?auto_685661 ) ) ( not ( = ?auto_685646 ?auto_685662 ) ) ( not ( = ?auto_685647 ?auto_685648 ) ) ( not ( = ?auto_685647 ?auto_685649 ) ) ( not ( = ?auto_685647 ?auto_685650 ) ) ( not ( = ?auto_685647 ?auto_685651 ) ) ( not ( = ?auto_685647 ?auto_685652 ) ) ( not ( = ?auto_685647 ?auto_685653 ) ) ( not ( = ?auto_685647 ?auto_685654 ) ) ( not ( = ?auto_685647 ?auto_685655 ) ) ( not ( = ?auto_685647 ?auto_685656 ) ) ( not ( = ?auto_685647 ?auto_685657 ) ) ( not ( = ?auto_685647 ?auto_685658 ) ) ( not ( = ?auto_685647 ?auto_685659 ) ) ( not ( = ?auto_685647 ?auto_685660 ) ) ( not ( = ?auto_685647 ?auto_685661 ) ) ( not ( = ?auto_685647 ?auto_685662 ) ) ( not ( = ?auto_685648 ?auto_685649 ) ) ( not ( = ?auto_685648 ?auto_685650 ) ) ( not ( = ?auto_685648 ?auto_685651 ) ) ( not ( = ?auto_685648 ?auto_685652 ) ) ( not ( = ?auto_685648 ?auto_685653 ) ) ( not ( = ?auto_685648 ?auto_685654 ) ) ( not ( = ?auto_685648 ?auto_685655 ) ) ( not ( = ?auto_685648 ?auto_685656 ) ) ( not ( = ?auto_685648 ?auto_685657 ) ) ( not ( = ?auto_685648 ?auto_685658 ) ) ( not ( = ?auto_685648 ?auto_685659 ) ) ( not ( = ?auto_685648 ?auto_685660 ) ) ( not ( = ?auto_685648 ?auto_685661 ) ) ( not ( = ?auto_685648 ?auto_685662 ) ) ( not ( = ?auto_685649 ?auto_685650 ) ) ( not ( = ?auto_685649 ?auto_685651 ) ) ( not ( = ?auto_685649 ?auto_685652 ) ) ( not ( = ?auto_685649 ?auto_685653 ) ) ( not ( = ?auto_685649 ?auto_685654 ) ) ( not ( = ?auto_685649 ?auto_685655 ) ) ( not ( = ?auto_685649 ?auto_685656 ) ) ( not ( = ?auto_685649 ?auto_685657 ) ) ( not ( = ?auto_685649 ?auto_685658 ) ) ( not ( = ?auto_685649 ?auto_685659 ) ) ( not ( = ?auto_685649 ?auto_685660 ) ) ( not ( = ?auto_685649 ?auto_685661 ) ) ( not ( = ?auto_685649 ?auto_685662 ) ) ( not ( = ?auto_685650 ?auto_685651 ) ) ( not ( = ?auto_685650 ?auto_685652 ) ) ( not ( = ?auto_685650 ?auto_685653 ) ) ( not ( = ?auto_685650 ?auto_685654 ) ) ( not ( = ?auto_685650 ?auto_685655 ) ) ( not ( = ?auto_685650 ?auto_685656 ) ) ( not ( = ?auto_685650 ?auto_685657 ) ) ( not ( = ?auto_685650 ?auto_685658 ) ) ( not ( = ?auto_685650 ?auto_685659 ) ) ( not ( = ?auto_685650 ?auto_685660 ) ) ( not ( = ?auto_685650 ?auto_685661 ) ) ( not ( = ?auto_685650 ?auto_685662 ) ) ( not ( = ?auto_685651 ?auto_685652 ) ) ( not ( = ?auto_685651 ?auto_685653 ) ) ( not ( = ?auto_685651 ?auto_685654 ) ) ( not ( = ?auto_685651 ?auto_685655 ) ) ( not ( = ?auto_685651 ?auto_685656 ) ) ( not ( = ?auto_685651 ?auto_685657 ) ) ( not ( = ?auto_685651 ?auto_685658 ) ) ( not ( = ?auto_685651 ?auto_685659 ) ) ( not ( = ?auto_685651 ?auto_685660 ) ) ( not ( = ?auto_685651 ?auto_685661 ) ) ( not ( = ?auto_685651 ?auto_685662 ) ) ( not ( = ?auto_685652 ?auto_685653 ) ) ( not ( = ?auto_685652 ?auto_685654 ) ) ( not ( = ?auto_685652 ?auto_685655 ) ) ( not ( = ?auto_685652 ?auto_685656 ) ) ( not ( = ?auto_685652 ?auto_685657 ) ) ( not ( = ?auto_685652 ?auto_685658 ) ) ( not ( = ?auto_685652 ?auto_685659 ) ) ( not ( = ?auto_685652 ?auto_685660 ) ) ( not ( = ?auto_685652 ?auto_685661 ) ) ( not ( = ?auto_685652 ?auto_685662 ) ) ( not ( = ?auto_685653 ?auto_685654 ) ) ( not ( = ?auto_685653 ?auto_685655 ) ) ( not ( = ?auto_685653 ?auto_685656 ) ) ( not ( = ?auto_685653 ?auto_685657 ) ) ( not ( = ?auto_685653 ?auto_685658 ) ) ( not ( = ?auto_685653 ?auto_685659 ) ) ( not ( = ?auto_685653 ?auto_685660 ) ) ( not ( = ?auto_685653 ?auto_685661 ) ) ( not ( = ?auto_685653 ?auto_685662 ) ) ( not ( = ?auto_685654 ?auto_685655 ) ) ( not ( = ?auto_685654 ?auto_685656 ) ) ( not ( = ?auto_685654 ?auto_685657 ) ) ( not ( = ?auto_685654 ?auto_685658 ) ) ( not ( = ?auto_685654 ?auto_685659 ) ) ( not ( = ?auto_685654 ?auto_685660 ) ) ( not ( = ?auto_685654 ?auto_685661 ) ) ( not ( = ?auto_685654 ?auto_685662 ) ) ( not ( = ?auto_685655 ?auto_685656 ) ) ( not ( = ?auto_685655 ?auto_685657 ) ) ( not ( = ?auto_685655 ?auto_685658 ) ) ( not ( = ?auto_685655 ?auto_685659 ) ) ( not ( = ?auto_685655 ?auto_685660 ) ) ( not ( = ?auto_685655 ?auto_685661 ) ) ( not ( = ?auto_685655 ?auto_685662 ) ) ( not ( = ?auto_685656 ?auto_685657 ) ) ( not ( = ?auto_685656 ?auto_685658 ) ) ( not ( = ?auto_685656 ?auto_685659 ) ) ( not ( = ?auto_685656 ?auto_685660 ) ) ( not ( = ?auto_685656 ?auto_685661 ) ) ( not ( = ?auto_685656 ?auto_685662 ) ) ( not ( = ?auto_685657 ?auto_685658 ) ) ( not ( = ?auto_685657 ?auto_685659 ) ) ( not ( = ?auto_685657 ?auto_685660 ) ) ( not ( = ?auto_685657 ?auto_685661 ) ) ( not ( = ?auto_685657 ?auto_685662 ) ) ( not ( = ?auto_685658 ?auto_685659 ) ) ( not ( = ?auto_685658 ?auto_685660 ) ) ( not ( = ?auto_685658 ?auto_685661 ) ) ( not ( = ?auto_685658 ?auto_685662 ) ) ( not ( = ?auto_685659 ?auto_685660 ) ) ( not ( = ?auto_685659 ?auto_685661 ) ) ( not ( = ?auto_685659 ?auto_685662 ) ) ( not ( = ?auto_685660 ?auto_685661 ) ) ( not ( = ?auto_685660 ?auto_685662 ) ) ( not ( = ?auto_685661 ?auto_685662 ) ) ( ON ?auto_685660 ?auto_685661 ) ( ON ?auto_685659 ?auto_685660 ) ( ON ?auto_685658 ?auto_685659 ) ( ON ?auto_685657 ?auto_685658 ) ( ON ?auto_685656 ?auto_685657 ) ( ON ?auto_685655 ?auto_685656 ) ( CLEAR ?auto_685653 ) ( ON ?auto_685654 ?auto_685655 ) ( CLEAR ?auto_685654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_685646 ?auto_685647 ?auto_685648 ?auto_685649 ?auto_685650 ?auto_685651 ?auto_685652 ?auto_685653 ?auto_685654 )
      ( MAKE-16PILE ?auto_685646 ?auto_685647 ?auto_685648 ?auto_685649 ?auto_685650 ?auto_685651 ?auto_685652 ?auto_685653 ?auto_685654 ?auto_685655 ?auto_685656 ?auto_685657 ?auto_685658 ?auto_685659 ?auto_685660 ?auto_685661 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_685712 - BLOCK
      ?auto_685713 - BLOCK
      ?auto_685714 - BLOCK
      ?auto_685715 - BLOCK
      ?auto_685716 - BLOCK
      ?auto_685717 - BLOCK
      ?auto_685718 - BLOCK
      ?auto_685719 - BLOCK
      ?auto_685720 - BLOCK
      ?auto_685721 - BLOCK
      ?auto_685722 - BLOCK
      ?auto_685723 - BLOCK
      ?auto_685724 - BLOCK
      ?auto_685725 - BLOCK
      ?auto_685726 - BLOCK
      ?auto_685727 - BLOCK
    )
    :vars
    (
      ?auto_685728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_685727 ?auto_685728 ) ( ON-TABLE ?auto_685712 ) ( ON ?auto_685713 ?auto_685712 ) ( ON ?auto_685714 ?auto_685713 ) ( ON ?auto_685715 ?auto_685714 ) ( ON ?auto_685716 ?auto_685715 ) ( ON ?auto_685717 ?auto_685716 ) ( ON ?auto_685718 ?auto_685717 ) ( not ( = ?auto_685712 ?auto_685713 ) ) ( not ( = ?auto_685712 ?auto_685714 ) ) ( not ( = ?auto_685712 ?auto_685715 ) ) ( not ( = ?auto_685712 ?auto_685716 ) ) ( not ( = ?auto_685712 ?auto_685717 ) ) ( not ( = ?auto_685712 ?auto_685718 ) ) ( not ( = ?auto_685712 ?auto_685719 ) ) ( not ( = ?auto_685712 ?auto_685720 ) ) ( not ( = ?auto_685712 ?auto_685721 ) ) ( not ( = ?auto_685712 ?auto_685722 ) ) ( not ( = ?auto_685712 ?auto_685723 ) ) ( not ( = ?auto_685712 ?auto_685724 ) ) ( not ( = ?auto_685712 ?auto_685725 ) ) ( not ( = ?auto_685712 ?auto_685726 ) ) ( not ( = ?auto_685712 ?auto_685727 ) ) ( not ( = ?auto_685712 ?auto_685728 ) ) ( not ( = ?auto_685713 ?auto_685714 ) ) ( not ( = ?auto_685713 ?auto_685715 ) ) ( not ( = ?auto_685713 ?auto_685716 ) ) ( not ( = ?auto_685713 ?auto_685717 ) ) ( not ( = ?auto_685713 ?auto_685718 ) ) ( not ( = ?auto_685713 ?auto_685719 ) ) ( not ( = ?auto_685713 ?auto_685720 ) ) ( not ( = ?auto_685713 ?auto_685721 ) ) ( not ( = ?auto_685713 ?auto_685722 ) ) ( not ( = ?auto_685713 ?auto_685723 ) ) ( not ( = ?auto_685713 ?auto_685724 ) ) ( not ( = ?auto_685713 ?auto_685725 ) ) ( not ( = ?auto_685713 ?auto_685726 ) ) ( not ( = ?auto_685713 ?auto_685727 ) ) ( not ( = ?auto_685713 ?auto_685728 ) ) ( not ( = ?auto_685714 ?auto_685715 ) ) ( not ( = ?auto_685714 ?auto_685716 ) ) ( not ( = ?auto_685714 ?auto_685717 ) ) ( not ( = ?auto_685714 ?auto_685718 ) ) ( not ( = ?auto_685714 ?auto_685719 ) ) ( not ( = ?auto_685714 ?auto_685720 ) ) ( not ( = ?auto_685714 ?auto_685721 ) ) ( not ( = ?auto_685714 ?auto_685722 ) ) ( not ( = ?auto_685714 ?auto_685723 ) ) ( not ( = ?auto_685714 ?auto_685724 ) ) ( not ( = ?auto_685714 ?auto_685725 ) ) ( not ( = ?auto_685714 ?auto_685726 ) ) ( not ( = ?auto_685714 ?auto_685727 ) ) ( not ( = ?auto_685714 ?auto_685728 ) ) ( not ( = ?auto_685715 ?auto_685716 ) ) ( not ( = ?auto_685715 ?auto_685717 ) ) ( not ( = ?auto_685715 ?auto_685718 ) ) ( not ( = ?auto_685715 ?auto_685719 ) ) ( not ( = ?auto_685715 ?auto_685720 ) ) ( not ( = ?auto_685715 ?auto_685721 ) ) ( not ( = ?auto_685715 ?auto_685722 ) ) ( not ( = ?auto_685715 ?auto_685723 ) ) ( not ( = ?auto_685715 ?auto_685724 ) ) ( not ( = ?auto_685715 ?auto_685725 ) ) ( not ( = ?auto_685715 ?auto_685726 ) ) ( not ( = ?auto_685715 ?auto_685727 ) ) ( not ( = ?auto_685715 ?auto_685728 ) ) ( not ( = ?auto_685716 ?auto_685717 ) ) ( not ( = ?auto_685716 ?auto_685718 ) ) ( not ( = ?auto_685716 ?auto_685719 ) ) ( not ( = ?auto_685716 ?auto_685720 ) ) ( not ( = ?auto_685716 ?auto_685721 ) ) ( not ( = ?auto_685716 ?auto_685722 ) ) ( not ( = ?auto_685716 ?auto_685723 ) ) ( not ( = ?auto_685716 ?auto_685724 ) ) ( not ( = ?auto_685716 ?auto_685725 ) ) ( not ( = ?auto_685716 ?auto_685726 ) ) ( not ( = ?auto_685716 ?auto_685727 ) ) ( not ( = ?auto_685716 ?auto_685728 ) ) ( not ( = ?auto_685717 ?auto_685718 ) ) ( not ( = ?auto_685717 ?auto_685719 ) ) ( not ( = ?auto_685717 ?auto_685720 ) ) ( not ( = ?auto_685717 ?auto_685721 ) ) ( not ( = ?auto_685717 ?auto_685722 ) ) ( not ( = ?auto_685717 ?auto_685723 ) ) ( not ( = ?auto_685717 ?auto_685724 ) ) ( not ( = ?auto_685717 ?auto_685725 ) ) ( not ( = ?auto_685717 ?auto_685726 ) ) ( not ( = ?auto_685717 ?auto_685727 ) ) ( not ( = ?auto_685717 ?auto_685728 ) ) ( not ( = ?auto_685718 ?auto_685719 ) ) ( not ( = ?auto_685718 ?auto_685720 ) ) ( not ( = ?auto_685718 ?auto_685721 ) ) ( not ( = ?auto_685718 ?auto_685722 ) ) ( not ( = ?auto_685718 ?auto_685723 ) ) ( not ( = ?auto_685718 ?auto_685724 ) ) ( not ( = ?auto_685718 ?auto_685725 ) ) ( not ( = ?auto_685718 ?auto_685726 ) ) ( not ( = ?auto_685718 ?auto_685727 ) ) ( not ( = ?auto_685718 ?auto_685728 ) ) ( not ( = ?auto_685719 ?auto_685720 ) ) ( not ( = ?auto_685719 ?auto_685721 ) ) ( not ( = ?auto_685719 ?auto_685722 ) ) ( not ( = ?auto_685719 ?auto_685723 ) ) ( not ( = ?auto_685719 ?auto_685724 ) ) ( not ( = ?auto_685719 ?auto_685725 ) ) ( not ( = ?auto_685719 ?auto_685726 ) ) ( not ( = ?auto_685719 ?auto_685727 ) ) ( not ( = ?auto_685719 ?auto_685728 ) ) ( not ( = ?auto_685720 ?auto_685721 ) ) ( not ( = ?auto_685720 ?auto_685722 ) ) ( not ( = ?auto_685720 ?auto_685723 ) ) ( not ( = ?auto_685720 ?auto_685724 ) ) ( not ( = ?auto_685720 ?auto_685725 ) ) ( not ( = ?auto_685720 ?auto_685726 ) ) ( not ( = ?auto_685720 ?auto_685727 ) ) ( not ( = ?auto_685720 ?auto_685728 ) ) ( not ( = ?auto_685721 ?auto_685722 ) ) ( not ( = ?auto_685721 ?auto_685723 ) ) ( not ( = ?auto_685721 ?auto_685724 ) ) ( not ( = ?auto_685721 ?auto_685725 ) ) ( not ( = ?auto_685721 ?auto_685726 ) ) ( not ( = ?auto_685721 ?auto_685727 ) ) ( not ( = ?auto_685721 ?auto_685728 ) ) ( not ( = ?auto_685722 ?auto_685723 ) ) ( not ( = ?auto_685722 ?auto_685724 ) ) ( not ( = ?auto_685722 ?auto_685725 ) ) ( not ( = ?auto_685722 ?auto_685726 ) ) ( not ( = ?auto_685722 ?auto_685727 ) ) ( not ( = ?auto_685722 ?auto_685728 ) ) ( not ( = ?auto_685723 ?auto_685724 ) ) ( not ( = ?auto_685723 ?auto_685725 ) ) ( not ( = ?auto_685723 ?auto_685726 ) ) ( not ( = ?auto_685723 ?auto_685727 ) ) ( not ( = ?auto_685723 ?auto_685728 ) ) ( not ( = ?auto_685724 ?auto_685725 ) ) ( not ( = ?auto_685724 ?auto_685726 ) ) ( not ( = ?auto_685724 ?auto_685727 ) ) ( not ( = ?auto_685724 ?auto_685728 ) ) ( not ( = ?auto_685725 ?auto_685726 ) ) ( not ( = ?auto_685725 ?auto_685727 ) ) ( not ( = ?auto_685725 ?auto_685728 ) ) ( not ( = ?auto_685726 ?auto_685727 ) ) ( not ( = ?auto_685726 ?auto_685728 ) ) ( not ( = ?auto_685727 ?auto_685728 ) ) ( ON ?auto_685726 ?auto_685727 ) ( ON ?auto_685725 ?auto_685726 ) ( ON ?auto_685724 ?auto_685725 ) ( ON ?auto_685723 ?auto_685724 ) ( ON ?auto_685722 ?auto_685723 ) ( ON ?auto_685721 ?auto_685722 ) ( ON ?auto_685720 ?auto_685721 ) ( CLEAR ?auto_685718 ) ( ON ?auto_685719 ?auto_685720 ) ( CLEAR ?auto_685719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_685712 ?auto_685713 ?auto_685714 ?auto_685715 ?auto_685716 ?auto_685717 ?auto_685718 ?auto_685719 )
      ( MAKE-16PILE ?auto_685712 ?auto_685713 ?auto_685714 ?auto_685715 ?auto_685716 ?auto_685717 ?auto_685718 ?auto_685719 ?auto_685720 ?auto_685721 ?auto_685722 ?auto_685723 ?auto_685724 ?auto_685725 ?auto_685726 ?auto_685727 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_685778 - BLOCK
      ?auto_685779 - BLOCK
      ?auto_685780 - BLOCK
      ?auto_685781 - BLOCK
      ?auto_685782 - BLOCK
      ?auto_685783 - BLOCK
      ?auto_685784 - BLOCK
      ?auto_685785 - BLOCK
      ?auto_685786 - BLOCK
      ?auto_685787 - BLOCK
      ?auto_685788 - BLOCK
      ?auto_685789 - BLOCK
      ?auto_685790 - BLOCK
      ?auto_685791 - BLOCK
      ?auto_685792 - BLOCK
      ?auto_685793 - BLOCK
    )
    :vars
    (
      ?auto_685794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_685793 ?auto_685794 ) ( ON-TABLE ?auto_685778 ) ( ON ?auto_685779 ?auto_685778 ) ( ON ?auto_685780 ?auto_685779 ) ( ON ?auto_685781 ?auto_685780 ) ( ON ?auto_685782 ?auto_685781 ) ( ON ?auto_685783 ?auto_685782 ) ( not ( = ?auto_685778 ?auto_685779 ) ) ( not ( = ?auto_685778 ?auto_685780 ) ) ( not ( = ?auto_685778 ?auto_685781 ) ) ( not ( = ?auto_685778 ?auto_685782 ) ) ( not ( = ?auto_685778 ?auto_685783 ) ) ( not ( = ?auto_685778 ?auto_685784 ) ) ( not ( = ?auto_685778 ?auto_685785 ) ) ( not ( = ?auto_685778 ?auto_685786 ) ) ( not ( = ?auto_685778 ?auto_685787 ) ) ( not ( = ?auto_685778 ?auto_685788 ) ) ( not ( = ?auto_685778 ?auto_685789 ) ) ( not ( = ?auto_685778 ?auto_685790 ) ) ( not ( = ?auto_685778 ?auto_685791 ) ) ( not ( = ?auto_685778 ?auto_685792 ) ) ( not ( = ?auto_685778 ?auto_685793 ) ) ( not ( = ?auto_685778 ?auto_685794 ) ) ( not ( = ?auto_685779 ?auto_685780 ) ) ( not ( = ?auto_685779 ?auto_685781 ) ) ( not ( = ?auto_685779 ?auto_685782 ) ) ( not ( = ?auto_685779 ?auto_685783 ) ) ( not ( = ?auto_685779 ?auto_685784 ) ) ( not ( = ?auto_685779 ?auto_685785 ) ) ( not ( = ?auto_685779 ?auto_685786 ) ) ( not ( = ?auto_685779 ?auto_685787 ) ) ( not ( = ?auto_685779 ?auto_685788 ) ) ( not ( = ?auto_685779 ?auto_685789 ) ) ( not ( = ?auto_685779 ?auto_685790 ) ) ( not ( = ?auto_685779 ?auto_685791 ) ) ( not ( = ?auto_685779 ?auto_685792 ) ) ( not ( = ?auto_685779 ?auto_685793 ) ) ( not ( = ?auto_685779 ?auto_685794 ) ) ( not ( = ?auto_685780 ?auto_685781 ) ) ( not ( = ?auto_685780 ?auto_685782 ) ) ( not ( = ?auto_685780 ?auto_685783 ) ) ( not ( = ?auto_685780 ?auto_685784 ) ) ( not ( = ?auto_685780 ?auto_685785 ) ) ( not ( = ?auto_685780 ?auto_685786 ) ) ( not ( = ?auto_685780 ?auto_685787 ) ) ( not ( = ?auto_685780 ?auto_685788 ) ) ( not ( = ?auto_685780 ?auto_685789 ) ) ( not ( = ?auto_685780 ?auto_685790 ) ) ( not ( = ?auto_685780 ?auto_685791 ) ) ( not ( = ?auto_685780 ?auto_685792 ) ) ( not ( = ?auto_685780 ?auto_685793 ) ) ( not ( = ?auto_685780 ?auto_685794 ) ) ( not ( = ?auto_685781 ?auto_685782 ) ) ( not ( = ?auto_685781 ?auto_685783 ) ) ( not ( = ?auto_685781 ?auto_685784 ) ) ( not ( = ?auto_685781 ?auto_685785 ) ) ( not ( = ?auto_685781 ?auto_685786 ) ) ( not ( = ?auto_685781 ?auto_685787 ) ) ( not ( = ?auto_685781 ?auto_685788 ) ) ( not ( = ?auto_685781 ?auto_685789 ) ) ( not ( = ?auto_685781 ?auto_685790 ) ) ( not ( = ?auto_685781 ?auto_685791 ) ) ( not ( = ?auto_685781 ?auto_685792 ) ) ( not ( = ?auto_685781 ?auto_685793 ) ) ( not ( = ?auto_685781 ?auto_685794 ) ) ( not ( = ?auto_685782 ?auto_685783 ) ) ( not ( = ?auto_685782 ?auto_685784 ) ) ( not ( = ?auto_685782 ?auto_685785 ) ) ( not ( = ?auto_685782 ?auto_685786 ) ) ( not ( = ?auto_685782 ?auto_685787 ) ) ( not ( = ?auto_685782 ?auto_685788 ) ) ( not ( = ?auto_685782 ?auto_685789 ) ) ( not ( = ?auto_685782 ?auto_685790 ) ) ( not ( = ?auto_685782 ?auto_685791 ) ) ( not ( = ?auto_685782 ?auto_685792 ) ) ( not ( = ?auto_685782 ?auto_685793 ) ) ( not ( = ?auto_685782 ?auto_685794 ) ) ( not ( = ?auto_685783 ?auto_685784 ) ) ( not ( = ?auto_685783 ?auto_685785 ) ) ( not ( = ?auto_685783 ?auto_685786 ) ) ( not ( = ?auto_685783 ?auto_685787 ) ) ( not ( = ?auto_685783 ?auto_685788 ) ) ( not ( = ?auto_685783 ?auto_685789 ) ) ( not ( = ?auto_685783 ?auto_685790 ) ) ( not ( = ?auto_685783 ?auto_685791 ) ) ( not ( = ?auto_685783 ?auto_685792 ) ) ( not ( = ?auto_685783 ?auto_685793 ) ) ( not ( = ?auto_685783 ?auto_685794 ) ) ( not ( = ?auto_685784 ?auto_685785 ) ) ( not ( = ?auto_685784 ?auto_685786 ) ) ( not ( = ?auto_685784 ?auto_685787 ) ) ( not ( = ?auto_685784 ?auto_685788 ) ) ( not ( = ?auto_685784 ?auto_685789 ) ) ( not ( = ?auto_685784 ?auto_685790 ) ) ( not ( = ?auto_685784 ?auto_685791 ) ) ( not ( = ?auto_685784 ?auto_685792 ) ) ( not ( = ?auto_685784 ?auto_685793 ) ) ( not ( = ?auto_685784 ?auto_685794 ) ) ( not ( = ?auto_685785 ?auto_685786 ) ) ( not ( = ?auto_685785 ?auto_685787 ) ) ( not ( = ?auto_685785 ?auto_685788 ) ) ( not ( = ?auto_685785 ?auto_685789 ) ) ( not ( = ?auto_685785 ?auto_685790 ) ) ( not ( = ?auto_685785 ?auto_685791 ) ) ( not ( = ?auto_685785 ?auto_685792 ) ) ( not ( = ?auto_685785 ?auto_685793 ) ) ( not ( = ?auto_685785 ?auto_685794 ) ) ( not ( = ?auto_685786 ?auto_685787 ) ) ( not ( = ?auto_685786 ?auto_685788 ) ) ( not ( = ?auto_685786 ?auto_685789 ) ) ( not ( = ?auto_685786 ?auto_685790 ) ) ( not ( = ?auto_685786 ?auto_685791 ) ) ( not ( = ?auto_685786 ?auto_685792 ) ) ( not ( = ?auto_685786 ?auto_685793 ) ) ( not ( = ?auto_685786 ?auto_685794 ) ) ( not ( = ?auto_685787 ?auto_685788 ) ) ( not ( = ?auto_685787 ?auto_685789 ) ) ( not ( = ?auto_685787 ?auto_685790 ) ) ( not ( = ?auto_685787 ?auto_685791 ) ) ( not ( = ?auto_685787 ?auto_685792 ) ) ( not ( = ?auto_685787 ?auto_685793 ) ) ( not ( = ?auto_685787 ?auto_685794 ) ) ( not ( = ?auto_685788 ?auto_685789 ) ) ( not ( = ?auto_685788 ?auto_685790 ) ) ( not ( = ?auto_685788 ?auto_685791 ) ) ( not ( = ?auto_685788 ?auto_685792 ) ) ( not ( = ?auto_685788 ?auto_685793 ) ) ( not ( = ?auto_685788 ?auto_685794 ) ) ( not ( = ?auto_685789 ?auto_685790 ) ) ( not ( = ?auto_685789 ?auto_685791 ) ) ( not ( = ?auto_685789 ?auto_685792 ) ) ( not ( = ?auto_685789 ?auto_685793 ) ) ( not ( = ?auto_685789 ?auto_685794 ) ) ( not ( = ?auto_685790 ?auto_685791 ) ) ( not ( = ?auto_685790 ?auto_685792 ) ) ( not ( = ?auto_685790 ?auto_685793 ) ) ( not ( = ?auto_685790 ?auto_685794 ) ) ( not ( = ?auto_685791 ?auto_685792 ) ) ( not ( = ?auto_685791 ?auto_685793 ) ) ( not ( = ?auto_685791 ?auto_685794 ) ) ( not ( = ?auto_685792 ?auto_685793 ) ) ( not ( = ?auto_685792 ?auto_685794 ) ) ( not ( = ?auto_685793 ?auto_685794 ) ) ( ON ?auto_685792 ?auto_685793 ) ( ON ?auto_685791 ?auto_685792 ) ( ON ?auto_685790 ?auto_685791 ) ( ON ?auto_685789 ?auto_685790 ) ( ON ?auto_685788 ?auto_685789 ) ( ON ?auto_685787 ?auto_685788 ) ( ON ?auto_685786 ?auto_685787 ) ( ON ?auto_685785 ?auto_685786 ) ( CLEAR ?auto_685783 ) ( ON ?auto_685784 ?auto_685785 ) ( CLEAR ?auto_685784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_685778 ?auto_685779 ?auto_685780 ?auto_685781 ?auto_685782 ?auto_685783 ?auto_685784 )
      ( MAKE-16PILE ?auto_685778 ?auto_685779 ?auto_685780 ?auto_685781 ?auto_685782 ?auto_685783 ?auto_685784 ?auto_685785 ?auto_685786 ?auto_685787 ?auto_685788 ?auto_685789 ?auto_685790 ?auto_685791 ?auto_685792 ?auto_685793 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_685844 - BLOCK
      ?auto_685845 - BLOCK
      ?auto_685846 - BLOCK
      ?auto_685847 - BLOCK
      ?auto_685848 - BLOCK
      ?auto_685849 - BLOCK
      ?auto_685850 - BLOCK
      ?auto_685851 - BLOCK
      ?auto_685852 - BLOCK
      ?auto_685853 - BLOCK
      ?auto_685854 - BLOCK
      ?auto_685855 - BLOCK
      ?auto_685856 - BLOCK
      ?auto_685857 - BLOCK
      ?auto_685858 - BLOCK
      ?auto_685859 - BLOCK
    )
    :vars
    (
      ?auto_685860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_685859 ?auto_685860 ) ( ON-TABLE ?auto_685844 ) ( ON ?auto_685845 ?auto_685844 ) ( ON ?auto_685846 ?auto_685845 ) ( ON ?auto_685847 ?auto_685846 ) ( ON ?auto_685848 ?auto_685847 ) ( not ( = ?auto_685844 ?auto_685845 ) ) ( not ( = ?auto_685844 ?auto_685846 ) ) ( not ( = ?auto_685844 ?auto_685847 ) ) ( not ( = ?auto_685844 ?auto_685848 ) ) ( not ( = ?auto_685844 ?auto_685849 ) ) ( not ( = ?auto_685844 ?auto_685850 ) ) ( not ( = ?auto_685844 ?auto_685851 ) ) ( not ( = ?auto_685844 ?auto_685852 ) ) ( not ( = ?auto_685844 ?auto_685853 ) ) ( not ( = ?auto_685844 ?auto_685854 ) ) ( not ( = ?auto_685844 ?auto_685855 ) ) ( not ( = ?auto_685844 ?auto_685856 ) ) ( not ( = ?auto_685844 ?auto_685857 ) ) ( not ( = ?auto_685844 ?auto_685858 ) ) ( not ( = ?auto_685844 ?auto_685859 ) ) ( not ( = ?auto_685844 ?auto_685860 ) ) ( not ( = ?auto_685845 ?auto_685846 ) ) ( not ( = ?auto_685845 ?auto_685847 ) ) ( not ( = ?auto_685845 ?auto_685848 ) ) ( not ( = ?auto_685845 ?auto_685849 ) ) ( not ( = ?auto_685845 ?auto_685850 ) ) ( not ( = ?auto_685845 ?auto_685851 ) ) ( not ( = ?auto_685845 ?auto_685852 ) ) ( not ( = ?auto_685845 ?auto_685853 ) ) ( not ( = ?auto_685845 ?auto_685854 ) ) ( not ( = ?auto_685845 ?auto_685855 ) ) ( not ( = ?auto_685845 ?auto_685856 ) ) ( not ( = ?auto_685845 ?auto_685857 ) ) ( not ( = ?auto_685845 ?auto_685858 ) ) ( not ( = ?auto_685845 ?auto_685859 ) ) ( not ( = ?auto_685845 ?auto_685860 ) ) ( not ( = ?auto_685846 ?auto_685847 ) ) ( not ( = ?auto_685846 ?auto_685848 ) ) ( not ( = ?auto_685846 ?auto_685849 ) ) ( not ( = ?auto_685846 ?auto_685850 ) ) ( not ( = ?auto_685846 ?auto_685851 ) ) ( not ( = ?auto_685846 ?auto_685852 ) ) ( not ( = ?auto_685846 ?auto_685853 ) ) ( not ( = ?auto_685846 ?auto_685854 ) ) ( not ( = ?auto_685846 ?auto_685855 ) ) ( not ( = ?auto_685846 ?auto_685856 ) ) ( not ( = ?auto_685846 ?auto_685857 ) ) ( not ( = ?auto_685846 ?auto_685858 ) ) ( not ( = ?auto_685846 ?auto_685859 ) ) ( not ( = ?auto_685846 ?auto_685860 ) ) ( not ( = ?auto_685847 ?auto_685848 ) ) ( not ( = ?auto_685847 ?auto_685849 ) ) ( not ( = ?auto_685847 ?auto_685850 ) ) ( not ( = ?auto_685847 ?auto_685851 ) ) ( not ( = ?auto_685847 ?auto_685852 ) ) ( not ( = ?auto_685847 ?auto_685853 ) ) ( not ( = ?auto_685847 ?auto_685854 ) ) ( not ( = ?auto_685847 ?auto_685855 ) ) ( not ( = ?auto_685847 ?auto_685856 ) ) ( not ( = ?auto_685847 ?auto_685857 ) ) ( not ( = ?auto_685847 ?auto_685858 ) ) ( not ( = ?auto_685847 ?auto_685859 ) ) ( not ( = ?auto_685847 ?auto_685860 ) ) ( not ( = ?auto_685848 ?auto_685849 ) ) ( not ( = ?auto_685848 ?auto_685850 ) ) ( not ( = ?auto_685848 ?auto_685851 ) ) ( not ( = ?auto_685848 ?auto_685852 ) ) ( not ( = ?auto_685848 ?auto_685853 ) ) ( not ( = ?auto_685848 ?auto_685854 ) ) ( not ( = ?auto_685848 ?auto_685855 ) ) ( not ( = ?auto_685848 ?auto_685856 ) ) ( not ( = ?auto_685848 ?auto_685857 ) ) ( not ( = ?auto_685848 ?auto_685858 ) ) ( not ( = ?auto_685848 ?auto_685859 ) ) ( not ( = ?auto_685848 ?auto_685860 ) ) ( not ( = ?auto_685849 ?auto_685850 ) ) ( not ( = ?auto_685849 ?auto_685851 ) ) ( not ( = ?auto_685849 ?auto_685852 ) ) ( not ( = ?auto_685849 ?auto_685853 ) ) ( not ( = ?auto_685849 ?auto_685854 ) ) ( not ( = ?auto_685849 ?auto_685855 ) ) ( not ( = ?auto_685849 ?auto_685856 ) ) ( not ( = ?auto_685849 ?auto_685857 ) ) ( not ( = ?auto_685849 ?auto_685858 ) ) ( not ( = ?auto_685849 ?auto_685859 ) ) ( not ( = ?auto_685849 ?auto_685860 ) ) ( not ( = ?auto_685850 ?auto_685851 ) ) ( not ( = ?auto_685850 ?auto_685852 ) ) ( not ( = ?auto_685850 ?auto_685853 ) ) ( not ( = ?auto_685850 ?auto_685854 ) ) ( not ( = ?auto_685850 ?auto_685855 ) ) ( not ( = ?auto_685850 ?auto_685856 ) ) ( not ( = ?auto_685850 ?auto_685857 ) ) ( not ( = ?auto_685850 ?auto_685858 ) ) ( not ( = ?auto_685850 ?auto_685859 ) ) ( not ( = ?auto_685850 ?auto_685860 ) ) ( not ( = ?auto_685851 ?auto_685852 ) ) ( not ( = ?auto_685851 ?auto_685853 ) ) ( not ( = ?auto_685851 ?auto_685854 ) ) ( not ( = ?auto_685851 ?auto_685855 ) ) ( not ( = ?auto_685851 ?auto_685856 ) ) ( not ( = ?auto_685851 ?auto_685857 ) ) ( not ( = ?auto_685851 ?auto_685858 ) ) ( not ( = ?auto_685851 ?auto_685859 ) ) ( not ( = ?auto_685851 ?auto_685860 ) ) ( not ( = ?auto_685852 ?auto_685853 ) ) ( not ( = ?auto_685852 ?auto_685854 ) ) ( not ( = ?auto_685852 ?auto_685855 ) ) ( not ( = ?auto_685852 ?auto_685856 ) ) ( not ( = ?auto_685852 ?auto_685857 ) ) ( not ( = ?auto_685852 ?auto_685858 ) ) ( not ( = ?auto_685852 ?auto_685859 ) ) ( not ( = ?auto_685852 ?auto_685860 ) ) ( not ( = ?auto_685853 ?auto_685854 ) ) ( not ( = ?auto_685853 ?auto_685855 ) ) ( not ( = ?auto_685853 ?auto_685856 ) ) ( not ( = ?auto_685853 ?auto_685857 ) ) ( not ( = ?auto_685853 ?auto_685858 ) ) ( not ( = ?auto_685853 ?auto_685859 ) ) ( not ( = ?auto_685853 ?auto_685860 ) ) ( not ( = ?auto_685854 ?auto_685855 ) ) ( not ( = ?auto_685854 ?auto_685856 ) ) ( not ( = ?auto_685854 ?auto_685857 ) ) ( not ( = ?auto_685854 ?auto_685858 ) ) ( not ( = ?auto_685854 ?auto_685859 ) ) ( not ( = ?auto_685854 ?auto_685860 ) ) ( not ( = ?auto_685855 ?auto_685856 ) ) ( not ( = ?auto_685855 ?auto_685857 ) ) ( not ( = ?auto_685855 ?auto_685858 ) ) ( not ( = ?auto_685855 ?auto_685859 ) ) ( not ( = ?auto_685855 ?auto_685860 ) ) ( not ( = ?auto_685856 ?auto_685857 ) ) ( not ( = ?auto_685856 ?auto_685858 ) ) ( not ( = ?auto_685856 ?auto_685859 ) ) ( not ( = ?auto_685856 ?auto_685860 ) ) ( not ( = ?auto_685857 ?auto_685858 ) ) ( not ( = ?auto_685857 ?auto_685859 ) ) ( not ( = ?auto_685857 ?auto_685860 ) ) ( not ( = ?auto_685858 ?auto_685859 ) ) ( not ( = ?auto_685858 ?auto_685860 ) ) ( not ( = ?auto_685859 ?auto_685860 ) ) ( ON ?auto_685858 ?auto_685859 ) ( ON ?auto_685857 ?auto_685858 ) ( ON ?auto_685856 ?auto_685857 ) ( ON ?auto_685855 ?auto_685856 ) ( ON ?auto_685854 ?auto_685855 ) ( ON ?auto_685853 ?auto_685854 ) ( ON ?auto_685852 ?auto_685853 ) ( ON ?auto_685851 ?auto_685852 ) ( ON ?auto_685850 ?auto_685851 ) ( CLEAR ?auto_685848 ) ( ON ?auto_685849 ?auto_685850 ) ( CLEAR ?auto_685849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_685844 ?auto_685845 ?auto_685846 ?auto_685847 ?auto_685848 ?auto_685849 )
      ( MAKE-16PILE ?auto_685844 ?auto_685845 ?auto_685846 ?auto_685847 ?auto_685848 ?auto_685849 ?auto_685850 ?auto_685851 ?auto_685852 ?auto_685853 ?auto_685854 ?auto_685855 ?auto_685856 ?auto_685857 ?auto_685858 ?auto_685859 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_685910 - BLOCK
      ?auto_685911 - BLOCK
      ?auto_685912 - BLOCK
      ?auto_685913 - BLOCK
      ?auto_685914 - BLOCK
      ?auto_685915 - BLOCK
      ?auto_685916 - BLOCK
      ?auto_685917 - BLOCK
      ?auto_685918 - BLOCK
      ?auto_685919 - BLOCK
      ?auto_685920 - BLOCK
      ?auto_685921 - BLOCK
      ?auto_685922 - BLOCK
      ?auto_685923 - BLOCK
      ?auto_685924 - BLOCK
      ?auto_685925 - BLOCK
    )
    :vars
    (
      ?auto_685926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_685925 ?auto_685926 ) ( ON-TABLE ?auto_685910 ) ( ON ?auto_685911 ?auto_685910 ) ( ON ?auto_685912 ?auto_685911 ) ( ON ?auto_685913 ?auto_685912 ) ( not ( = ?auto_685910 ?auto_685911 ) ) ( not ( = ?auto_685910 ?auto_685912 ) ) ( not ( = ?auto_685910 ?auto_685913 ) ) ( not ( = ?auto_685910 ?auto_685914 ) ) ( not ( = ?auto_685910 ?auto_685915 ) ) ( not ( = ?auto_685910 ?auto_685916 ) ) ( not ( = ?auto_685910 ?auto_685917 ) ) ( not ( = ?auto_685910 ?auto_685918 ) ) ( not ( = ?auto_685910 ?auto_685919 ) ) ( not ( = ?auto_685910 ?auto_685920 ) ) ( not ( = ?auto_685910 ?auto_685921 ) ) ( not ( = ?auto_685910 ?auto_685922 ) ) ( not ( = ?auto_685910 ?auto_685923 ) ) ( not ( = ?auto_685910 ?auto_685924 ) ) ( not ( = ?auto_685910 ?auto_685925 ) ) ( not ( = ?auto_685910 ?auto_685926 ) ) ( not ( = ?auto_685911 ?auto_685912 ) ) ( not ( = ?auto_685911 ?auto_685913 ) ) ( not ( = ?auto_685911 ?auto_685914 ) ) ( not ( = ?auto_685911 ?auto_685915 ) ) ( not ( = ?auto_685911 ?auto_685916 ) ) ( not ( = ?auto_685911 ?auto_685917 ) ) ( not ( = ?auto_685911 ?auto_685918 ) ) ( not ( = ?auto_685911 ?auto_685919 ) ) ( not ( = ?auto_685911 ?auto_685920 ) ) ( not ( = ?auto_685911 ?auto_685921 ) ) ( not ( = ?auto_685911 ?auto_685922 ) ) ( not ( = ?auto_685911 ?auto_685923 ) ) ( not ( = ?auto_685911 ?auto_685924 ) ) ( not ( = ?auto_685911 ?auto_685925 ) ) ( not ( = ?auto_685911 ?auto_685926 ) ) ( not ( = ?auto_685912 ?auto_685913 ) ) ( not ( = ?auto_685912 ?auto_685914 ) ) ( not ( = ?auto_685912 ?auto_685915 ) ) ( not ( = ?auto_685912 ?auto_685916 ) ) ( not ( = ?auto_685912 ?auto_685917 ) ) ( not ( = ?auto_685912 ?auto_685918 ) ) ( not ( = ?auto_685912 ?auto_685919 ) ) ( not ( = ?auto_685912 ?auto_685920 ) ) ( not ( = ?auto_685912 ?auto_685921 ) ) ( not ( = ?auto_685912 ?auto_685922 ) ) ( not ( = ?auto_685912 ?auto_685923 ) ) ( not ( = ?auto_685912 ?auto_685924 ) ) ( not ( = ?auto_685912 ?auto_685925 ) ) ( not ( = ?auto_685912 ?auto_685926 ) ) ( not ( = ?auto_685913 ?auto_685914 ) ) ( not ( = ?auto_685913 ?auto_685915 ) ) ( not ( = ?auto_685913 ?auto_685916 ) ) ( not ( = ?auto_685913 ?auto_685917 ) ) ( not ( = ?auto_685913 ?auto_685918 ) ) ( not ( = ?auto_685913 ?auto_685919 ) ) ( not ( = ?auto_685913 ?auto_685920 ) ) ( not ( = ?auto_685913 ?auto_685921 ) ) ( not ( = ?auto_685913 ?auto_685922 ) ) ( not ( = ?auto_685913 ?auto_685923 ) ) ( not ( = ?auto_685913 ?auto_685924 ) ) ( not ( = ?auto_685913 ?auto_685925 ) ) ( not ( = ?auto_685913 ?auto_685926 ) ) ( not ( = ?auto_685914 ?auto_685915 ) ) ( not ( = ?auto_685914 ?auto_685916 ) ) ( not ( = ?auto_685914 ?auto_685917 ) ) ( not ( = ?auto_685914 ?auto_685918 ) ) ( not ( = ?auto_685914 ?auto_685919 ) ) ( not ( = ?auto_685914 ?auto_685920 ) ) ( not ( = ?auto_685914 ?auto_685921 ) ) ( not ( = ?auto_685914 ?auto_685922 ) ) ( not ( = ?auto_685914 ?auto_685923 ) ) ( not ( = ?auto_685914 ?auto_685924 ) ) ( not ( = ?auto_685914 ?auto_685925 ) ) ( not ( = ?auto_685914 ?auto_685926 ) ) ( not ( = ?auto_685915 ?auto_685916 ) ) ( not ( = ?auto_685915 ?auto_685917 ) ) ( not ( = ?auto_685915 ?auto_685918 ) ) ( not ( = ?auto_685915 ?auto_685919 ) ) ( not ( = ?auto_685915 ?auto_685920 ) ) ( not ( = ?auto_685915 ?auto_685921 ) ) ( not ( = ?auto_685915 ?auto_685922 ) ) ( not ( = ?auto_685915 ?auto_685923 ) ) ( not ( = ?auto_685915 ?auto_685924 ) ) ( not ( = ?auto_685915 ?auto_685925 ) ) ( not ( = ?auto_685915 ?auto_685926 ) ) ( not ( = ?auto_685916 ?auto_685917 ) ) ( not ( = ?auto_685916 ?auto_685918 ) ) ( not ( = ?auto_685916 ?auto_685919 ) ) ( not ( = ?auto_685916 ?auto_685920 ) ) ( not ( = ?auto_685916 ?auto_685921 ) ) ( not ( = ?auto_685916 ?auto_685922 ) ) ( not ( = ?auto_685916 ?auto_685923 ) ) ( not ( = ?auto_685916 ?auto_685924 ) ) ( not ( = ?auto_685916 ?auto_685925 ) ) ( not ( = ?auto_685916 ?auto_685926 ) ) ( not ( = ?auto_685917 ?auto_685918 ) ) ( not ( = ?auto_685917 ?auto_685919 ) ) ( not ( = ?auto_685917 ?auto_685920 ) ) ( not ( = ?auto_685917 ?auto_685921 ) ) ( not ( = ?auto_685917 ?auto_685922 ) ) ( not ( = ?auto_685917 ?auto_685923 ) ) ( not ( = ?auto_685917 ?auto_685924 ) ) ( not ( = ?auto_685917 ?auto_685925 ) ) ( not ( = ?auto_685917 ?auto_685926 ) ) ( not ( = ?auto_685918 ?auto_685919 ) ) ( not ( = ?auto_685918 ?auto_685920 ) ) ( not ( = ?auto_685918 ?auto_685921 ) ) ( not ( = ?auto_685918 ?auto_685922 ) ) ( not ( = ?auto_685918 ?auto_685923 ) ) ( not ( = ?auto_685918 ?auto_685924 ) ) ( not ( = ?auto_685918 ?auto_685925 ) ) ( not ( = ?auto_685918 ?auto_685926 ) ) ( not ( = ?auto_685919 ?auto_685920 ) ) ( not ( = ?auto_685919 ?auto_685921 ) ) ( not ( = ?auto_685919 ?auto_685922 ) ) ( not ( = ?auto_685919 ?auto_685923 ) ) ( not ( = ?auto_685919 ?auto_685924 ) ) ( not ( = ?auto_685919 ?auto_685925 ) ) ( not ( = ?auto_685919 ?auto_685926 ) ) ( not ( = ?auto_685920 ?auto_685921 ) ) ( not ( = ?auto_685920 ?auto_685922 ) ) ( not ( = ?auto_685920 ?auto_685923 ) ) ( not ( = ?auto_685920 ?auto_685924 ) ) ( not ( = ?auto_685920 ?auto_685925 ) ) ( not ( = ?auto_685920 ?auto_685926 ) ) ( not ( = ?auto_685921 ?auto_685922 ) ) ( not ( = ?auto_685921 ?auto_685923 ) ) ( not ( = ?auto_685921 ?auto_685924 ) ) ( not ( = ?auto_685921 ?auto_685925 ) ) ( not ( = ?auto_685921 ?auto_685926 ) ) ( not ( = ?auto_685922 ?auto_685923 ) ) ( not ( = ?auto_685922 ?auto_685924 ) ) ( not ( = ?auto_685922 ?auto_685925 ) ) ( not ( = ?auto_685922 ?auto_685926 ) ) ( not ( = ?auto_685923 ?auto_685924 ) ) ( not ( = ?auto_685923 ?auto_685925 ) ) ( not ( = ?auto_685923 ?auto_685926 ) ) ( not ( = ?auto_685924 ?auto_685925 ) ) ( not ( = ?auto_685924 ?auto_685926 ) ) ( not ( = ?auto_685925 ?auto_685926 ) ) ( ON ?auto_685924 ?auto_685925 ) ( ON ?auto_685923 ?auto_685924 ) ( ON ?auto_685922 ?auto_685923 ) ( ON ?auto_685921 ?auto_685922 ) ( ON ?auto_685920 ?auto_685921 ) ( ON ?auto_685919 ?auto_685920 ) ( ON ?auto_685918 ?auto_685919 ) ( ON ?auto_685917 ?auto_685918 ) ( ON ?auto_685916 ?auto_685917 ) ( ON ?auto_685915 ?auto_685916 ) ( CLEAR ?auto_685913 ) ( ON ?auto_685914 ?auto_685915 ) ( CLEAR ?auto_685914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_685910 ?auto_685911 ?auto_685912 ?auto_685913 ?auto_685914 )
      ( MAKE-16PILE ?auto_685910 ?auto_685911 ?auto_685912 ?auto_685913 ?auto_685914 ?auto_685915 ?auto_685916 ?auto_685917 ?auto_685918 ?auto_685919 ?auto_685920 ?auto_685921 ?auto_685922 ?auto_685923 ?auto_685924 ?auto_685925 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_685976 - BLOCK
      ?auto_685977 - BLOCK
      ?auto_685978 - BLOCK
      ?auto_685979 - BLOCK
      ?auto_685980 - BLOCK
      ?auto_685981 - BLOCK
      ?auto_685982 - BLOCK
      ?auto_685983 - BLOCK
      ?auto_685984 - BLOCK
      ?auto_685985 - BLOCK
      ?auto_685986 - BLOCK
      ?auto_685987 - BLOCK
      ?auto_685988 - BLOCK
      ?auto_685989 - BLOCK
      ?auto_685990 - BLOCK
      ?auto_685991 - BLOCK
    )
    :vars
    (
      ?auto_685992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_685991 ?auto_685992 ) ( ON-TABLE ?auto_685976 ) ( ON ?auto_685977 ?auto_685976 ) ( ON ?auto_685978 ?auto_685977 ) ( not ( = ?auto_685976 ?auto_685977 ) ) ( not ( = ?auto_685976 ?auto_685978 ) ) ( not ( = ?auto_685976 ?auto_685979 ) ) ( not ( = ?auto_685976 ?auto_685980 ) ) ( not ( = ?auto_685976 ?auto_685981 ) ) ( not ( = ?auto_685976 ?auto_685982 ) ) ( not ( = ?auto_685976 ?auto_685983 ) ) ( not ( = ?auto_685976 ?auto_685984 ) ) ( not ( = ?auto_685976 ?auto_685985 ) ) ( not ( = ?auto_685976 ?auto_685986 ) ) ( not ( = ?auto_685976 ?auto_685987 ) ) ( not ( = ?auto_685976 ?auto_685988 ) ) ( not ( = ?auto_685976 ?auto_685989 ) ) ( not ( = ?auto_685976 ?auto_685990 ) ) ( not ( = ?auto_685976 ?auto_685991 ) ) ( not ( = ?auto_685976 ?auto_685992 ) ) ( not ( = ?auto_685977 ?auto_685978 ) ) ( not ( = ?auto_685977 ?auto_685979 ) ) ( not ( = ?auto_685977 ?auto_685980 ) ) ( not ( = ?auto_685977 ?auto_685981 ) ) ( not ( = ?auto_685977 ?auto_685982 ) ) ( not ( = ?auto_685977 ?auto_685983 ) ) ( not ( = ?auto_685977 ?auto_685984 ) ) ( not ( = ?auto_685977 ?auto_685985 ) ) ( not ( = ?auto_685977 ?auto_685986 ) ) ( not ( = ?auto_685977 ?auto_685987 ) ) ( not ( = ?auto_685977 ?auto_685988 ) ) ( not ( = ?auto_685977 ?auto_685989 ) ) ( not ( = ?auto_685977 ?auto_685990 ) ) ( not ( = ?auto_685977 ?auto_685991 ) ) ( not ( = ?auto_685977 ?auto_685992 ) ) ( not ( = ?auto_685978 ?auto_685979 ) ) ( not ( = ?auto_685978 ?auto_685980 ) ) ( not ( = ?auto_685978 ?auto_685981 ) ) ( not ( = ?auto_685978 ?auto_685982 ) ) ( not ( = ?auto_685978 ?auto_685983 ) ) ( not ( = ?auto_685978 ?auto_685984 ) ) ( not ( = ?auto_685978 ?auto_685985 ) ) ( not ( = ?auto_685978 ?auto_685986 ) ) ( not ( = ?auto_685978 ?auto_685987 ) ) ( not ( = ?auto_685978 ?auto_685988 ) ) ( not ( = ?auto_685978 ?auto_685989 ) ) ( not ( = ?auto_685978 ?auto_685990 ) ) ( not ( = ?auto_685978 ?auto_685991 ) ) ( not ( = ?auto_685978 ?auto_685992 ) ) ( not ( = ?auto_685979 ?auto_685980 ) ) ( not ( = ?auto_685979 ?auto_685981 ) ) ( not ( = ?auto_685979 ?auto_685982 ) ) ( not ( = ?auto_685979 ?auto_685983 ) ) ( not ( = ?auto_685979 ?auto_685984 ) ) ( not ( = ?auto_685979 ?auto_685985 ) ) ( not ( = ?auto_685979 ?auto_685986 ) ) ( not ( = ?auto_685979 ?auto_685987 ) ) ( not ( = ?auto_685979 ?auto_685988 ) ) ( not ( = ?auto_685979 ?auto_685989 ) ) ( not ( = ?auto_685979 ?auto_685990 ) ) ( not ( = ?auto_685979 ?auto_685991 ) ) ( not ( = ?auto_685979 ?auto_685992 ) ) ( not ( = ?auto_685980 ?auto_685981 ) ) ( not ( = ?auto_685980 ?auto_685982 ) ) ( not ( = ?auto_685980 ?auto_685983 ) ) ( not ( = ?auto_685980 ?auto_685984 ) ) ( not ( = ?auto_685980 ?auto_685985 ) ) ( not ( = ?auto_685980 ?auto_685986 ) ) ( not ( = ?auto_685980 ?auto_685987 ) ) ( not ( = ?auto_685980 ?auto_685988 ) ) ( not ( = ?auto_685980 ?auto_685989 ) ) ( not ( = ?auto_685980 ?auto_685990 ) ) ( not ( = ?auto_685980 ?auto_685991 ) ) ( not ( = ?auto_685980 ?auto_685992 ) ) ( not ( = ?auto_685981 ?auto_685982 ) ) ( not ( = ?auto_685981 ?auto_685983 ) ) ( not ( = ?auto_685981 ?auto_685984 ) ) ( not ( = ?auto_685981 ?auto_685985 ) ) ( not ( = ?auto_685981 ?auto_685986 ) ) ( not ( = ?auto_685981 ?auto_685987 ) ) ( not ( = ?auto_685981 ?auto_685988 ) ) ( not ( = ?auto_685981 ?auto_685989 ) ) ( not ( = ?auto_685981 ?auto_685990 ) ) ( not ( = ?auto_685981 ?auto_685991 ) ) ( not ( = ?auto_685981 ?auto_685992 ) ) ( not ( = ?auto_685982 ?auto_685983 ) ) ( not ( = ?auto_685982 ?auto_685984 ) ) ( not ( = ?auto_685982 ?auto_685985 ) ) ( not ( = ?auto_685982 ?auto_685986 ) ) ( not ( = ?auto_685982 ?auto_685987 ) ) ( not ( = ?auto_685982 ?auto_685988 ) ) ( not ( = ?auto_685982 ?auto_685989 ) ) ( not ( = ?auto_685982 ?auto_685990 ) ) ( not ( = ?auto_685982 ?auto_685991 ) ) ( not ( = ?auto_685982 ?auto_685992 ) ) ( not ( = ?auto_685983 ?auto_685984 ) ) ( not ( = ?auto_685983 ?auto_685985 ) ) ( not ( = ?auto_685983 ?auto_685986 ) ) ( not ( = ?auto_685983 ?auto_685987 ) ) ( not ( = ?auto_685983 ?auto_685988 ) ) ( not ( = ?auto_685983 ?auto_685989 ) ) ( not ( = ?auto_685983 ?auto_685990 ) ) ( not ( = ?auto_685983 ?auto_685991 ) ) ( not ( = ?auto_685983 ?auto_685992 ) ) ( not ( = ?auto_685984 ?auto_685985 ) ) ( not ( = ?auto_685984 ?auto_685986 ) ) ( not ( = ?auto_685984 ?auto_685987 ) ) ( not ( = ?auto_685984 ?auto_685988 ) ) ( not ( = ?auto_685984 ?auto_685989 ) ) ( not ( = ?auto_685984 ?auto_685990 ) ) ( not ( = ?auto_685984 ?auto_685991 ) ) ( not ( = ?auto_685984 ?auto_685992 ) ) ( not ( = ?auto_685985 ?auto_685986 ) ) ( not ( = ?auto_685985 ?auto_685987 ) ) ( not ( = ?auto_685985 ?auto_685988 ) ) ( not ( = ?auto_685985 ?auto_685989 ) ) ( not ( = ?auto_685985 ?auto_685990 ) ) ( not ( = ?auto_685985 ?auto_685991 ) ) ( not ( = ?auto_685985 ?auto_685992 ) ) ( not ( = ?auto_685986 ?auto_685987 ) ) ( not ( = ?auto_685986 ?auto_685988 ) ) ( not ( = ?auto_685986 ?auto_685989 ) ) ( not ( = ?auto_685986 ?auto_685990 ) ) ( not ( = ?auto_685986 ?auto_685991 ) ) ( not ( = ?auto_685986 ?auto_685992 ) ) ( not ( = ?auto_685987 ?auto_685988 ) ) ( not ( = ?auto_685987 ?auto_685989 ) ) ( not ( = ?auto_685987 ?auto_685990 ) ) ( not ( = ?auto_685987 ?auto_685991 ) ) ( not ( = ?auto_685987 ?auto_685992 ) ) ( not ( = ?auto_685988 ?auto_685989 ) ) ( not ( = ?auto_685988 ?auto_685990 ) ) ( not ( = ?auto_685988 ?auto_685991 ) ) ( not ( = ?auto_685988 ?auto_685992 ) ) ( not ( = ?auto_685989 ?auto_685990 ) ) ( not ( = ?auto_685989 ?auto_685991 ) ) ( not ( = ?auto_685989 ?auto_685992 ) ) ( not ( = ?auto_685990 ?auto_685991 ) ) ( not ( = ?auto_685990 ?auto_685992 ) ) ( not ( = ?auto_685991 ?auto_685992 ) ) ( ON ?auto_685990 ?auto_685991 ) ( ON ?auto_685989 ?auto_685990 ) ( ON ?auto_685988 ?auto_685989 ) ( ON ?auto_685987 ?auto_685988 ) ( ON ?auto_685986 ?auto_685987 ) ( ON ?auto_685985 ?auto_685986 ) ( ON ?auto_685984 ?auto_685985 ) ( ON ?auto_685983 ?auto_685984 ) ( ON ?auto_685982 ?auto_685983 ) ( ON ?auto_685981 ?auto_685982 ) ( ON ?auto_685980 ?auto_685981 ) ( CLEAR ?auto_685978 ) ( ON ?auto_685979 ?auto_685980 ) ( CLEAR ?auto_685979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_685976 ?auto_685977 ?auto_685978 ?auto_685979 )
      ( MAKE-16PILE ?auto_685976 ?auto_685977 ?auto_685978 ?auto_685979 ?auto_685980 ?auto_685981 ?auto_685982 ?auto_685983 ?auto_685984 ?auto_685985 ?auto_685986 ?auto_685987 ?auto_685988 ?auto_685989 ?auto_685990 ?auto_685991 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_686042 - BLOCK
      ?auto_686043 - BLOCK
      ?auto_686044 - BLOCK
      ?auto_686045 - BLOCK
      ?auto_686046 - BLOCK
      ?auto_686047 - BLOCK
      ?auto_686048 - BLOCK
      ?auto_686049 - BLOCK
      ?auto_686050 - BLOCK
      ?auto_686051 - BLOCK
      ?auto_686052 - BLOCK
      ?auto_686053 - BLOCK
      ?auto_686054 - BLOCK
      ?auto_686055 - BLOCK
      ?auto_686056 - BLOCK
      ?auto_686057 - BLOCK
    )
    :vars
    (
      ?auto_686058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_686057 ?auto_686058 ) ( ON-TABLE ?auto_686042 ) ( ON ?auto_686043 ?auto_686042 ) ( not ( = ?auto_686042 ?auto_686043 ) ) ( not ( = ?auto_686042 ?auto_686044 ) ) ( not ( = ?auto_686042 ?auto_686045 ) ) ( not ( = ?auto_686042 ?auto_686046 ) ) ( not ( = ?auto_686042 ?auto_686047 ) ) ( not ( = ?auto_686042 ?auto_686048 ) ) ( not ( = ?auto_686042 ?auto_686049 ) ) ( not ( = ?auto_686042 ?auto_686050 ) ) ( not ( = ?auto_686042 ?auto_686051 ) ) ( not ( = ?auto_686042 ?auto_686052 ) ) ( not ( = ?auto_686042 ?auto_686053 ) ) ( not ( = ?auto_686042 ?auto_686054 ) ) ( not ( = ?auto_686042 ?auto_686055 ) ) ( not ( = ?auto_686042 ?auto_686056 ) ) ( not ( = ?auto_686042 ?auto_686057 ) ) ( not ( = ?auto_686042 ?auto_686058 ) ) ( not ( = ?auto_686043 ?auto_686044 ) ) ( not ( = ?auto_686043 ?auto_686045 ) ) ( not ( = ?auto_686043 ?auto_686046 ) ) ( not ( = ?auto_686043 ?auto_686047 ) ) ( not ( = ?auto_686043 ?auto_686048 ) ) ( not ( = ?auto_686043 ?auto_686049 ) ) ( not ( = ?auto_686043 ?auto_686050 ) ) ( not ( = ?auto_686043 ?auto_686051 ) ) ( not ( = ?auto_686043 ?auto_686052 ) ) ( not ( = ?auto_686043 ?auto_686053 ) ) ( not ( = ?auto_686043 ?auto_686054 ) ) ( not ( = ?auto_686043 ?auto_686055 ) ) ( not ( = ?auto_686043 ?auto_686056 ) ) ( not ( = ?auto_686043 ?auto_686057 ) ) ( not ( = ?auto_686043 ?auto_686058 ) ) ( not ( = ?auto_686044 ?auto_686045 ) ) ( not ( = ?auto_686044 ?auto_686046 ) ) ( not ( = ?auto_686044 ?auto_686047 ) ) ( not ( = ?auto_686044 ?auto_686048 ) ) ( not ( = ?auto_686044 ?auto_686049 ) ) ( not ( = ?auto_686044 ?auto_686050 ) ) ( not ( = ?auto_686044 ?auto_686051 ) ) ( not ( = ?auto_686044 ?auto_686052 ) ) ( not ( = ?auto_686044 ?auto_686053 ) ) ( not ( = ?auto_686044 ?auto_686054 ) ) ( not ( = ?auto_686044 ?auto_686055 ) ) ( not ( = ?auto_686044 ?auto_686056 ) ) ( not ( = ?auto_686044 ?auto_686057 ) ) ( not ( = ?auto_686044 ?auto_686058 ) ) ( not ( = ?auto_686045 ?auto_686046 ) ) ( not ( = ?auto_686045 ?auto_686047 ) ) ( not ( = ?auto_686045 ?auto_686048 ) ) ( not ( = ?auto_686045 ?auto_686049 ) ) ( not ( = ?auto_686045 ?auto_686050 ) ) ( not ( = ?auto_686045 ?auto_686051 ) ) ( not ( = ?auto_686045 ?auto_686052 ) ) ( not ( = ?auto_686045 ?auto_686053 ) ) ( not ( = ?auto_686045 ?auto_686054 ) ) ( not ( = ?auto_686045 ?auto_686055 ) ) ( not ( = ?auto_686045 ?auto_686056 ) ) ( not ( = ?auto_686045 ?auto_686057 ) ) ( not ( = ?auto_686045 ?auto_686058 ) ) ( not ( = ?auto_686046 ?auto_686047 ) ) ( not ( = ?auto_686046 ?auto_686048 ) ) ( not ( = ?auto_686046 ?auto_686049 ) ) ( not ( = ?auto_686046 ?auto_686050 ) ) ( not ( = ?auto_686046 ?auto_686051 ) ) ( not ( = ?auto_686046 ?auto_686052 ) ) ( not ( = ?auto_686046 ?auto_686053 ) ) ( not ( = ?auto_686046 ?auto_686054 ) ) ( not ( = ?auto_686046 ?auto_686055 ) ) ( not ( = ?auto_686046 ?auto_686056 ) ) ( not ( = ?auto_686046 ?auto_686057 ) ) ( not ( = ?auto_686046 ?auto_686058 ) ) ( not ( = ?auto_686047 ?auto_686048 ) ) ( not ( = ?auto_686047 ?auto_686049 ) ) ( not ( = ?auto_686047 ?auto_686050 ) ) ( not ( = ?auto_686047 ?auto_686051 ) ) ( not ( = ?auto_686047 ?auto_686052 ) ) ( not ( = ?auto_686047 ?auto_686053 ) ) ( not ( = ?auto_686047 ?auto_686054 ) ) ( not ( = ?auto_686047 ?auto_686055 ) ) ( not ( = ?auto_686047 ?auto_686056 ) ) ( not ( = ?auto_686047 ?auto_686057 ) ) ( not ( = ?auto_686047 ?auto_686058 ) ) ( not ( = ?auto_686048 ?auto_686049 ) ) ( not ( = ?auto_686048 ?auto_686050 ) ) ( not ( = ?auto_686048 ?auto_686051 ) ) ( not ( = ?auto_686048 ?auto_686052 ) ) ( not ( = ?auto_686048 ?auto_686053 ) ) ( not ( = ?auto_686048 ?auto_686054 ) ) ( not ( = ?auto_686048 ?auto_686055 ) ) ( not ( = ?auto_686048 ?auto_686056 ) ) ( not ( = ?auto_686048 ?auto_686057 ) ) ( not ( = ?auto_686048 ?auto_686058 ) ) ( not ( = ?auto_686049 ?auto_686050 ) ) ( not ( = ?auto_686049 ?auto_686051 ) ) ( not ( = ?auto_686049 ?auto_686052 ) ) ( not ( = ?auto_686049 ?auto_686053 ) ) ( not ( = ?auto_686049 ?auto_686054 ) ) ( not ( = ?auto_686049 ?auto_686055 ) ) ( not ( = ?auto_686049 ?auto_686056 ) ) ( not ( = ?auto_686049 ?auto_686057 ) ) ( not ( = ?auto_686049 ?auto_686058 ) ) ( not ( = ?auto_686050 ?auto_686051 ) ) ( not ( = ?auto_686050 ?auto_686052 ) ) ( not ( = ?auto_686050 ?auto_686053 ) ) ( not ( = ?auto_686050 ?auto_686054 ) ) ( not ( = ?auto_686050 ?auto_686055 ) ) ( not ( = ?auto_686050 ?auto_686056 ) ) ( not ( = ?auto_686050 ?auto_686057 ) ) ( not ( = ?auto_686050 ?auto_686058 ) ) ( not ( = ?auto_686051 ?auto_686052 ) ) ( not ( = ?auto_686051 ?auto_686053 ) ) ( not ( = ?auto_686051 ?auto_686054 ) ) ( not ( = ?auto_686051 ?auto_686055 ) ) ( not ( = ?auto_686051 ?auto_686056 ) ) ( not ( = ?auto_686051 ?auto_686057 ) ) ( not ( = ?auto_686051 ?auto_686058 ) ) ( not ( = ?auto_686052 ?auto_686053 ) ) ( not ( = ?auto_686052 ?auto_686054 ) ) ( not ( = ?auto_686052 ?auto_686055 ) ) ( not ( = ?auto_686052 ?auto_686056 ) ) ( not ( = ?auto_686052 ?auto_686057 ) ) ( not ( = ?auto_686052 ?auto_686058 ) ) ( not ( = ?auto_686053 ?auto_686054 ) ) ( not ( = ?auto_686053 ?auto_686055 ) ) ( not ( = ?auto_686053 ?auto_686056 ) ) ( not ( = ?auto_686053 ?auto_686057 ) ) ( not ( = ?auto_686053 ?auto_686058 ) ) ( not ( = ?auto_686054 ?auto_686055 ) ) ( not ( = ?auto_686054 ?auto_686056 ) ) ( not ( = ?auto_686054 ?auto_686057 ) ) ( not ( = ?auto_686054 ?auto_686058 ) ) ( not ( = ?auto_686055 ?auto_686056 ) ) ( not ( = ?auto_686055 ?auto_686057 ) ) ( not ( = ?auto_686055 ?auto_686058 ) ) ( not ( = ?auto_686056 ?auto_686057 ) ) ( not ( = ?auto_686056 ?auto_686058 ) ) ( not ( = ?auto_686057 ?auto_686058 ) ) ( ON ?auto_686056 ?auto_686057 ) ( ON ?auto_686055 ?auto_686056 ) ( ON ?auto_686054 ?auto_686055 ) ( ON ?auto_686053 ?auto_686054 ) ( ON ?auto_686052 ?auto_686053 ) ( ON ?auto_686051 ?auto_686052 ) ( ON ?auto_686050 ?auto_686051 ) ( ON ?auto_686049 ?auto_686050 ) ( ON ?auto_686048 ?auto_686049 ) ( ON ?auto_686047 ?auto_686048 ) ( ON ?auto_686046 ?auto_686047 ) ( ON ?auto_686045 ?auto_686046 ) ( CLEAR ?auto_686043 ) ( ON ?auto_686044 ?auto_686045 ) ( CLEAR ?auto_686044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_686042 ?auto_686043 ?auto_686044 )
      ( MAKE-16PILE ?auto_686042 ?auto_686043 ?auto_686044 ?auto_686045 ?auto_686046 ?auto_686047 ?auto_686048 ?auto_686049 ?auto_686050 ?auto_686051 ?auto_686052 ?auto_686053 ?auto_686054 ?auto_686055 ?auto_686056 ?auto_686057 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_686108 - BLOCK
      ?auto_686109 - BLOCK
      ?auto_686110 - BLOCK
      ?auto_686111 - BLOCK
      ?auto_686112 - BLOCK
      ?auto_686113 - BLOCK
      ?auto_686114 - BLOCK
      ?auto_686115 - BLOCK
      ?auto_686116 - BLOCK
      ?auto_686117 - BLOCK
      ?auto_686118 - BLOCK
      ?auto_686119 - BLOCK
      ?auto_686120 - BLOCK
      ?auto_686121 - BLOCK
      ?auto_686122 - BLOCK
      ?auto_686123 - BLOCK
    )
    :vars
    (
      ?auto_686124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_686123 ?auto_686124 ) ( ON-TABLE ?auto_686108 ) ( not ( = ?auto_686108 ?auto_686109 ) ) ( not ( = ?auto_686108 ?auto_686110 ) ) ( not ( = ?auto_686108 ?auto_686111 ) ) ( not ( = ?auto_686108 ?auto_686112 ) ) ( not ( = ?auto_686108 ?auto_686113 ) ) ( not ( = ?auto_686108 ?auto_686114 ) ) ( not ( = ?auto_686108 ?auto_686115 ) ) ( not ( = ?auto_686108 ?auto_686116 ) ) ( not ( = ?auto_686108 ?auto_686117 ) ) ( not ( = ?auto_686108 ?auto_686118 ) ) ( not ( = ?auto_686108 ?auto_686119 ) ) ( not ( = ?auto_686108 ?auto_686120 ) ) ( not ( = ?auto_686108 ?auto_686121 ) ) ( not ( = ?auto_686108 ?auto_686122 ) ) ( not ( = ?auto_686108 ?auto_686123 ) ) ( not ( = ?auto_686108 ?auto_686124 ) ) ( not ( = ?auto_686109 ?auto_686110 ) ) ( not ( = ?auto_686109 ?auto_686111 ) ) ( not ( = ?auto_686109 ?auto_686112 ) ) ( not ( = ?auto_686109 ?auto_686113 ) ) ( not ( = ?auto_686109 ?auto_686114 ) ) ( not ( = ?auto_686109 ?auto_686115 ) ) ( not ( = ?auto_686109 ?auto_686116 ) ) ( not ( = ?auto_686109 ?auto_686117 ) ) ( not ( = ?auto_686109 ?auto_686118 ) ) ( not ( = ?auto_686109 ?auto_686119 ) ) ( not ( = ?auto_686109 ?auto_686120 ) ) ( not ( = ?auto_686109 ?auto_686121 ) ) ( not ( = ?auto_686109 ?auto_686122 ) ) ( not ( = ?auto_686109 ?auto_686123 ) ) ( not ( = ?auto_686109 ?auto_686124 ) ) ( not ( = ?auto_686110 ?auto_686111 ) ) ( not ( = ?auto_686110 ?auto_686112 ) ) ( not ( = ?auto_686110 ?auto_686113 ) ) ( not ( = ?auto_686110 ?auto_686114 ) ) ( not ( = ?auto_686110 ?auto_686115 ) ) ( not ( = ?auto_686110 ?auto_686116 ) ) ( not ( = ?auto_686110 ?auto_686117 ) ) ( not ( = ?auto_686110 ?auto_686118 ) ) ( not ( = ?auto_686110 ?auto_686119 ) ) ( not ( = ?auto_686110 ?auto_686120 ) ) ( not ( = ?auto_686110 ?auto_686121 ) ) ( not ( = ?auto_686110 ?auto_686122 ) ) ( not ( = ?auto_686110 ?auto_686123 ) ) ( not ( = ?auto_686110 ?auto_686124 ) ) ( not ( = ?auto_686111 ?auto_686112 ) ) ( not ( = ?auto_686111 ?auto_686113 ) ) ( not ( = ?auto_686111 ?auto_686114 ) ) ( not ( = ?auto_686111 ?auto_686115 ) ) ( not ( = ?auto_686111 ?auto_686116 ) ) ( not ( = ?auto_686111 ?auto_686117 ) ) ( not ( = ?auto_686111 ?auto_686118 ) ) ( not ( = ?auto_686111 ?auto_686119 ) ) ( not ( = ?auto_686111 ?auto_686120 ) ) ( not ( = ?auto_686111 ?auto_686121 ) ) ( not ( = ?auto_686111 ?auto_686122 ) ) ( not ( = ?auto_686111 ?auto_686123 ) ) ( not ( = ?auto_686111 ?auto_686124 ) ) ( not ( = ?auto_686112 ?auto_686113 ) ) ( not ( = ?auto_686112 ?auto_686114 ) ) ( not ( = ?auto_686112 ?auto_686115 ) ) ( not ( = ?auto_686112 ?auto_686116 ) ) ( not ( = ?auto_686112 ?auto_686117 ) ) ( not ( = ?auto_686112 ?auto_686118 ) ) ( not ( = ?auto_686112 ?auto_686119 ) ) ( not ( = ?auto_686112 ?auto_686120 ) ) ( not ( = ?auto_686112 ?auto_686121 ) ) ( not ( = ?auto_686112 ?auto_686122 ) ) ( not ( = ?auto_686112 ?auto_686123 ) ) ( not ( = ?auto_686112 ?auto_686124 ) ) ( not ( = ?auto_686113 ?auto_686114 ) ) ( not ( = ?auto_686113 ?auto_686115 ) ) ( not ( = ?auto_686113 ?auto_686116 ) ) ( not ( = ?auto_686113 ?auto_686117 ) ) ( not ( = ?auto_686113 ?auto_686118 ) ) ( not ( = ?auto_686113 ?auto_686119 ) ) ( not ( = ?auto_686113 ?auto_686120 ) ) ( not ( = ?auto_686113 ?auto_686121 ) ) ( not ( = ?auto_686113 ?auto_686122 ) ) ( not ( = ?auto_686113 ?auto_686123 ) ) ( not ( = ?auto_686113 ?auto_686124 ) ) ( not ( = ?auto_686114 ?auto_686115 ) ) ( not ( = ?auto_686114 ?auto_686116 ) ) ( not ( = ?auto_686114 ?auto_686117 ) ) ( not ( = ?auto_686114 ?auto_686118 ) ) ( not ( = ?auto_686114 ?auto_686119 ) ) ( not ( = ?auto_686114 ?auto_686120 ) ) ( not ( = ?auto_686114 ?auto_686121 ) ) ( not ( = ?auto_686114 ?auto_686122 ) ) ( not ( = ?auto_686114 ?auto_686123 ) ) ( not ( = ?auto_686114 ?auto_686124 ) ) ( not ( = ?auto_686115 ?auto_686116 ) ) ( not ( = ?auto_686115 ?auto_686117 ) ) ( not ( = ?auto_686115 ?auto_686118 ) ) ( not ( = ?auto_686115 ?auto_686119 ) ) ( not ( = ?auto_686115 ?auto_686120 ) ) ( not ( = ?auto_686115 ?auto_686121 ) ) ( not ( = ?auto_686115 ?auto_686122 ) ) ( not ( = ?auto_686115 ?auto_686123 ) ) ( not ( = ?auto_686115 ?auto_686124 ) ) ( not ( = ?auto_686116 ?auto_686117 ) ) ( not ( = ?auto_686116 ?auto_686118 ) ) ( not ( = ?auto_686116 ?auto_686119 ) ) ( not ( = ?auto_686116 ?auto_686120 ) ) ( not ( = ?auto_686116 ?auto_686121 ) ) ( not ( = ?auto_686116 ?auto_686122 ) ) ( not ( = ?auto_686116 ?auto_686123 ) ) ( not ( = ?auto_686116 ?auto_686124 ) ) ( not ( = ?auto_686117 ?auto_686118 ) ) ( not ( = ?auto_686117 ?auto_686119 ) ) ( not ( = ?auto_686117 ?auto_686120 ) ) ( not ( = ?auto_686117 ?auto_686121 ) ) ( not ( = ?auto_686117 ?auto_686122 ) ) ( not ( = ?auto_686117 ?auto_686123 ) ) ( not ( = ?auto_686117 ?auto_686124 ) ) ( not ( = ?auto_686118 ?auto_686119 ) ) ( not ( = ?auto_686118 ?auto_686120 ) ) ( not ( = ?auto_686118 ?auto_686121 ) ) ( not ( = ?auto_686118 ?auto_686122 ) ) ( not ( = ?auto_686118 ?auto_686123 ) ) ( not ( = ?auto_686118 ?auto_686124 ) ) ( not ( = ?auto_686119 ?auto_686120 ) ) ( not ( = ?auto_686119 ?auto_686121 ) ) ( not ( = ?auto_686119 ?auto_686122 ) ) ( not ( = ?auto_686119 ?auto_686123 ) ) ( not ( = ?auto_686119 ?auto_686124 ) ) ( not ( = ?auto_686120 ?auto_686121 ) ) ( not ( = ?auto_686120 ?auto_686122 ) ) ( not ( = ?auto_686120 ?auto_686123 ) ) ( not ( = ?auto_686120 ?auto_686124 ) ) ( not ( = ?auto_686121 ?auto_686122 ) ) ( not ( = ?auto_686121 ?auto_686123 ) ) ( not ( = ?auto_686121 ?auto_686124 ) ) ( not ( = ?auto_686122 ?auto_686123 ) ) ( not ( = ?auto_686122 ?auto_686124 ) ) ( not ( = ?auto_686123 ?auto_686124 ) ) ( ON ?auto_686122 ?auto_686123 ) ( ON ?auto_686121 ?auto_686122 ) ( ON ?auto_686120 ?auto_686121 ) ( ON ?auto_686119 ?auto_686120 ) ( ON ?auto_686118 ?auto_686119 ) ( ON ?auto_686117 ?auto_686118 ) ( ON ?auto_686116 ?auto_686117 ) ( ON ?auto_686115 ?auto_686116 ) ( ON ?auto_686114 ?auto_686115 ) ( ON ?auto_686113 ?auto_686114 ) ( ON ?auto_686112 ?auto_686113 ) ( ON ?auto_686111 ?auto_686112 ) ( ON ?auto_686110 ?auto_686111 ) ( CLEAR ?auto_686108 ) ( ON ?auto_686109 ?auto_686110 ) ( CLEAR ?auto_686109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_686108 ?auto_686109 )
      ( MAKE-16PILE ?auto_686108 ?auto_686109 ?auto_686110 ?auto_686111 ?auto_686112 ?auto_686113 ?auto_686114 ?auto_686115 ?auto_686116 ?auto_686117 ?auto_686118 ?auto_686119 ?auto_686120 ?auto_686121 ?auto_686122 ?auto_686123 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_686174 - BLOCK
      ?auto_686175 - BLOCK
      ?auto_686176 - BLOCK
      ?auto_686177 - BLOCK
      ?auto_686178 - BLOCK
      ?auto_686179 - BLOCK
      ?auto_686180 - BLOCK
      ?auto_686181 - BLOCK
      ?auto_686182 - BLOCK
      ?auto_686183 - BLOCK
      ?auto_686184 - BLOCK
      ?auto_686185 - BLOCK
      ?auto_686186 - BLOCK
      ?auto_686187 - BLOCK
      ?auto_686188 - BLOCK
      ?auto_686189 - BLOCK
    )
    :vars
    (
      ?auto_686190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_686189 ?auto_686190 ) ( not ( = ?auto_686174 ?auto_686175 ) ) ( not ( = ?auto_686174 ?auto_686176 ) ) ( not ( = ?auto_686174 ?auto_686177 ) ) ( not ( = ?auto_686174 ?auto_686178 ) ) ( not ( = ?auto_686174 ?auto_686179 ) ) ( not ( = ?auto_686174 ?auto_686180 ) ) ( not ( = ?auto_686174 ?auto_686181 ) ) ( not ( = ?auto_686174 ?auto_686182 ) ) ( not ( = ?auto_686174 ?auto_686183 ) ) ( not ( = ?auto_686174 ?auto_686184 ) ) ( not ( = ?auto_686174 ?auto_686185 ) ) ( not ( = ?auto_686174 ?auto_686186 ) ) ( not ( = ?auto_686174 ?auto_686187 ) ) ( not ( = ?auto_686174 ?auto_686188 ) ) ( not ( = ?auto_686174 ?auto_686189 ) ) ( not ( = ?auto_686174 ?auto_686190 ) ) ( not ( = ?auto_686175 ?auto_686176 ) ) ( not ( = ?auto_686175 ?auto_686177 ) ) ( not ( = ?auto_686175 ?auto_686178 ) ) ( not ( = ?auto_686175 ?auto_686179 ) ) ( not ( = ?auto_686175 ?auto_686180 ) ) ( not ( = ?auto_686175 ?auto_686181 ) ) ( not ( = ?auto_686175 ?auto_686182 ) ) ( not ( = ?auto_686175 ?auto_686183 ) ) ( not ( = ?auto_686175 ?auto_686184 ) ) ( not ( = ?auto_686175 ?auto_686185 ) ) ( not ( = ?auto_686175 ?auto_686186 ) ) ( not ( = ?auto_686175 ?auto_686187 ) ) ( not ( = ?auto_686175 ?auto_686188 ) ) ( not ( = ?auto_686175 ?auto_686189 ) ) ( not ( = ?auto_686175 ?auto_686190 ) ) ( not ( = ?auto_686176 ?auto_686177 ) ) ( not ( = ?auto_686176 ?auto_686178 ) ) ( not ( = ?auto_686176 ?auto_686179 ) ) ( not ( = ?auto_686176 ?auto_686180 ) ) ( not ( = ?auto_686176 ?auto_686181 ) ) ( not ( = ?auto_686176 ?auto_686182 ) ) ( not ( = ?auto_686176 ?auto_686183 ) ) ( not ( = ?auto_686176 ?auto_686184 ) ) ( not ( = ?auto_686176 ?auto_686185 ) ) ( not ( = ?auto_686176 ?auto_686186 ) ) ( not ( = ?auto_686176 ?auto_686187 ) ) ( not ( = ?auto_686176 ?auto_686188 ) ) ( not ( = ?auto_686176 ?auto_686189 ) ) ( not ( = ?auto_686176 ?auto_686190 ) ) ( not ( = ?auto_686177 ?auto_686178 ) ) ( not ( = ?auto_686177 ?auto_686179 ) ) ( not ( = ?auto_686177 ?auto_686180 ) ) ( not ( = ?auto_686177 ?auto_686181 ) ) ( not ( = ?auto_686177 ?auto_686182 ) ) ( not ( = ?auto_686177 ?auto_686183 ) ) ( not ( = ?auto_686177 ?auto_686184 ) ) ( not ( = ?auto_686177 ?auto_686185 ) ) ( not ( = ?auto_686177 ?auto_686186 ) ) ( not ( = ?auto_686177 ?auto_686187 ) ) ( not ( = ?auto_686177 ?auto_686188 ) ) ( not ( = ?auto_686177 ?auto_686189 ) ) ( not ( = ?auto_686177 ?auto_686190 ) ) ( not ( = ?auto_686178 ?auto_686179 ) ) ( not ( = ?auto_686178 ?auto_686180 ) ) ( not ( = ?auto_686178 ?auto_686181 ) ) ( not ( = ?auto_686178 ?auto_686182 ) ) ( not ( = ?auto_686178 ?auto_686183 ) ) ( not ( = ?auto_686178 ?auto_686184 ) ) ( not ( = ?auto_686178 ?auto_686185 ) ) ( not ( = ?auto_686178 ?auto_686186 ) ) ( not ( = ?auto_686178 ?auto_686187 ) ) ( not ( = ?auto_686178 ?auto_686188 ) ) ( not ( = ?auto_686178 ?auto_686189 ) ) ( not ( = ?auto_686178 ?auto_686190 ) ) ( not ( = ?auto_686179 ?auto_686180 ) ) ( not ( = ?auto_686179 ?auto_686181 ) ) ( not ( = ?auto_686179 ?auto_686182 ) ) ( not ( = ?auto_686179 ?auto_686183 ) ) ( not ( = ?auto_686179 ?auto_686184 ) ) ( not ( = ?auto_686179 ?auto_686185 ) ) ( not ( = ?auto_686179 ?auto_686186 ) ) ( not ( = ?auto_686179 ?auto_686187 ) ) ( not ( = ?auto_686179 ?auto_686188 ) ) ( not ( = ?auto_686179 ?auto_686189 ) ) ( not ( = ?auto_686179 ?auto_686190 ) ) ( not ( = ?auto_686180 ?auto_686181 ) ) ( not ( = ?auto_686180 ?auto_686182 ) ) ( not ( = ?auto_686180 ?auto_686183 ) ) ( not ( = ?auto_686180 ?auto_686184 ) ) ( not ( = ?auto_686180 ?auto_686185 ) ) ( not ( = ?auto_686180 ?auto_686186 ) ) ( not ( = ?auto_686180 ?auto_686187 ) ) ( not ( = ?auto_686180 ?auto_686188 ) ) ( not ( = ?auto_686180 ?auto_686189 ) ) ( not ( = ?auto_686180 ?auto_686190 ) ) ( not ( = ?auto_686181 ?auto_686182 ) ) ( not ( = ?auto_686181 ?auto_686183 ) ) ( not ( = ?auto_686181 ?auto_686184 ) ) ( not ( = ?auto_686181 ?auto_686185 ) ) ( not ( = ?auto_686181 ?auto_686186 ) ) ( not ( = ?auto_686181 ?auto_686187 ) ) ( not ( = ?auto_686181 ?auto_686188 ) ) ( not ( = ?auto_686181 ?auto_686189 ) ) ( not ( = ?auto_686181 ?auto_686190 ) ) ( not ( = ?auto_686182 ?auto_686183 ) ) ( not ( = ?auto_686182 ?auto_686184 ) ) ( not ( = ?auto_686182 ?auto_686185 ) ) ( not ( = ?auto_686182 ?auto_686186 ) ) ( not ( = ?auto_686182 ?auto_686187 ) ) ( not ( = ?auto_686182 ?auto_686188 ) ) ( not ( = ?auto_686182 ?auto_686189 ) ) ( not ( = ?auto_686182 ?auto_686190 ) ) ( not ( = ?auto_686183 ?auto_686184 ) ) ( not ( = ?auto_686183 ?auto_686185 ) ) ( not ( = ?auto_686183 ?auto_686186 ) ) ( not ( = ?auto_686183 ?auto_686187 ) ) ( not ( = ?auto_686183 ?auto_686188 ) ) ( not ( = ?auto_686183 ?auto_686189 ) ) ( not ( = ?auto_686183 ?auto_686190 ) ) ( not ( = ?auto_686184 ?auto_686185 ) ) ( not ( = ?auto_686184 ?auto_686186 ) ) ( not ( = ?auto_686184 ?auto_686187 ) ) ( not ( = ?auto_686184 ?auto_686188 ) ) ( not ( = ?auto_686184 ?auto_686189 ) ) ( not ( = ?auto_686184 ?auto_686190 ) ) ( not ( = ?auto_686185 ?auto_686186 ) ) ( not ( = ?auto_686185 ?auto_686187 ) ) ( not ( = ?auto_686185 ?auto_686188 ) ) ( not ( = ?auto_686185 ?auto_686189 ) ) ( not ( = ?auto_686185 ?auto_686190 ) ) ( not ( = ?auto_686186 ?auto_686187 ) ) ( not ( = ?auto_686186 ?auto_686188 ) ) ( not ( = ?auto_686186 ?auto_686189 ) ) ( not ( = ?auto_686186 ?auto_686190 ) ) ( not ( = ?auto_686187 ?auto_686188 ) ) ( not ( = ?auto_686187 ?auto_686189 ) ) ( not ( = ?auto_686187 ?auto_686190 ) ) ( not ( = ?auto_686188 ?auto_686189 ) ) ( not ( = ?auto_686188 ?auto_686190 ) ) ( not ( = ?auto_686189 ?auto_686190 ) ) ( ON ?auto_686188 ?auto_686189 ) ( ON ?auto_686187 ?auto_686188 ) ( ON ?auto_686186 ?auto_686187 ) ( ON ?auto_686185 ?auto_686186 ) ( ON ?auto_686184 ?auto_686185 ) ( ON ?auto_686183 ?auto_686184 ) ( ON ?auto_686182 ?auto_686183 ) ( ON ?auto_686181 ?auto_686182 ) ( ON ?auto_686180 ?auto_686181 ) ( ON ?auto_686179 ?auto_686180 ) ( ON ?auto_686178 ?auto_686179 ) ( ON ?auto_686177 ?auto_686178 ) ( ON ?auto_686176 ?auto_686177 ) ( ON ?auto_686175 ?auto_686176 ) ( ON ?auto_686174 ?auto_686175 ) ( CLEAR ?auto_686174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_686174 )
      ( MAKE-16PILE ?auto_686174 ?auto_686175 ?auto_686176 ?auto_686177 ?auto_686178 ?auto_686179 ?auto_686180 ?auto_686181 ?auto_686182 ?auto_686183 ?auto_686184 ?auto_686185 ?auto_686186 ?auto_686187 ?auto_686188 ?auto_686189 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_686241 - BLOCK
      ?auto_686242 - BLOCK
      ?auto_686243 - BLOCK
      ?auto_686244 - BLOCK
      ?auto_686245 - BLOCK
      ?auto_686246 - BLOCK
      ?auto_686247 - BLOCK
      ?auto_686248 - BLOCK
      ?auto_686249 - BLOCK
      ?auto_686250 - BLOCK
      ?auto_686251 - BLOCK
      ?auto_686252 - BLOCK
      ?auto_686253 - BLOCK
      ?auto_686254 - BLOCK
      ?auto_686255 - BLOCK
      ?auto_686256 - BLOCK
      ?auto_686257 - BLOCK
    )
    :vars
    (
      ?auto_686258 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_686256 ) ( ON ?auto_686257 ?auto_686258 ) ( CLEAR ?auto_686257 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_686241 ) ( ON ?auto_686242 ?auto_686241 ) ( ON ?auto_686243 ?auto_686242 ) ( ON ?auto_686244 ?auto_686243 ) ( ON ?auto_686245 ?auto_686244 ) ( ON ?auto_686246 ?auto_686245 ) ( ON ?auto_686247 ?auto_686246 ) ( ON ?auto_686248 ?auto_686247 ) ( ON ?auto_686249 ?auto_686248 ) ( ON ?auto_686250 ?auto_686249 ) ( ON ?auto_686251 ?auto_686250 ) ( ON ?auto_686252 ?auto_686251 ) ( ON ?auto_686253 ?auto_686252 ) ( ON ?auto_686254 ?auto_686253 ) ( ON ?auto_686255 ?auto_686254 ) ( ON ?auto_686256 ?auto_686255 ) ( not ( = ?auto_686241 ?auto_686242 ) ) ( not ( = ?auto_686241 ?auto_686243 ) ) ( not ( = ?auto_686241 ?auto_686244 ) ) ( not ( = ?auto_686241 ?auto_686245 ) ) ( not ( = ?auto_686241 ?auto_686246 ) ) ( not ( = ?auto_686241 ?auto_686247 ) ) ( not ( = ?auto_686241 ?auto_686248 ) ) ( not ( = ?auto_686241 ?auto_686249 ) ) ( not ( = ?auto_686241 ?auto_686250 ) ) ( not ( = ?auto_686241 ?auto_686251 ) ) ( not ( = ?auto_686241 ?auto_686252 ) ) ( not ( = ?auto_686241 ?auto_686253 ) ) ( not ( = ?auto_686241 ?auto_686254 ) ) ( not ( = ?auto_686241 ?auto_686255 ) ) ( not ( = ?auto_686241 ?auto_686256 ) ) ( not ( = ?auto_686241 ?auto_686257 ) ) ( not ( = ?auto_686241 ?auto_686258 ) ) ( not ( = ?auto_686242 ?auto_686243 ) ) ( not ( = ?auto_686242 ?auto_686244 ) ) ( not ( = ?auto_686242 ?auto_686245 ) ) ( not ( = ?auto_686242 ?auto_686246 ) ) ( not ( = ?auto_686242 ?auto_686247 ) ) ( not ( = ?auto_686242 ?auto_686248 ) ) ( not ( = ?auto_686242 ?auto_686249 ) ) ( not ( = ?auto_686242 ?auto_686250 ) ) ( not ( = ?auto_686242 ?auto_686251 ) ) ( not ( = ?auto_686242 ?auto_686252 ) ) ( not ( = ?auto_686242 ?auto_686253 ) ) ( not ( = ?auto_686242 ?auto_686254 ) ) ( not ( = ?auto_686242 ?auto_686255 ) ) ( not ( = ?auto_686242 ?auto_686256 ) ) ( not ( = ?auto_686242 ?auto_686257 ) ) ( not ( = ?auto_686242 ?auto_686258 ) ) ( not ( = ?auto_686243 ?auto_686244 ) ) ( not ( = ?auto_686243 ?auto_686245 ) ) ( not ( = ?auto_686243 ?auto_686246 ) ) ( not ( = ?auto_686243 ?auto_686247 ) ) ( not ( = ?auto_686243 ?auto_686248 ) ) ( not ( = ?auto_686243 ?auto_686249 ) ) ( not ( = ?auto_686243 ?auto_686250 ) ) ( not ( = ?auto_686243 ?auto_686251 ) ) ( not ( = ?auto_686243 ?auto_686252 ) ) ( not ( = ?auto_686243 ?auto_686253 ) ) ( not ( = ?auto_686243 ?auto_686254 ) ) ( not ( = ?auto_686243 ?auto_686255 ) ) ( not ( = ?auto_686243 ?auto_686256 ) ) ( not ( = ?auto_686243 ?auto_686257 ) ) ( not ( = ?auto_686243 ?auto_686258 ) ) ( not ( = ?auto_686244 ?auto_686245 ) ) ( not ( = ?auto_686244 ?auto_686246 ) ) ( not ( = ?auto_686244 ?auto_686247 ) ) ( not ( = ?auto_686244 ?auto_686248 ) ) ( not ( = ?auto_686244 ?auto_686249 ) ) ( not ( = ?auto_686244 ?auto_686250 ) ) ( not ( = ?auto_686244 ?auto_686251 ) ) ( not ( = ?auto_686244 ?auto_686252 ) ) ( not ( = ?auto_686244 ?auto_686253 ) ) ( not ( = ?auto_686244 ?auto_686254 ) ) ( not ( = ?auto_686244 ?auto_686255 ) ) ( not ( = ?auto_686244 ?auto_686256 ) ) ( not ( = ?auto_686244 ?auto_686257 ) ) ( not ( = ?auto_686244 ?auto_686258 ) ) ( not ( = ?auto_686245 ?auto_686246 ) ) ( not ( = ?auto_686245 ?auto_686247 ) ) ( not ( = ?auto_686245 ?auto_686248 ) ) ( not ( = ?auto_686245 ?auto_686249 ) ) ( not ( = ?auto_686245 ?auto_686250 ) ) ( not ( = ?auto_686245 ?auto_686251 ) ) ( not ( = ?auto_686245 ?auto_686252 ) ) ( not ( = ?auto_686245 ?auto_686253 ) ) ( not ( = ?auto_686245 ?auto_686254 ) ) ( not ( = ?auto_686245 ?auto_686255 ) ) ( not ( = ?auto_686245 ?auto_686256 ) ) ( not ( = ?auto_686245 ?auto_686257 ) ) ( not ( = ?auto_686245 ?auto_686258 ) ) ( not ( = ?auto_686246 ?auto_686247 ) ) ( not ( = ?auto_686246 ?auto_686248 ) ) ( not ( = ?auto_686246 ?auto_686249 ) ) ( not ( = ?auto_686246 ?auto_686250 ) ) ( not ( = ?auto_686246 ?auto_686251 ) ) ( not ( = ?auto_686246 ?auto_686252 ) ) ( not ( = ?auto_686246 ?auto_686253 ) ) ( not ( = ?auto_686246 ?auto_686254 ) ) ( not ( = ?auto_686246 ?auto_686255 ) ) ( not ( = ?auto_686246 ?auto_686256 ) ) ( not ( = ?auto_686246 ?auto_686257 ) ) ( not ( = ?auto_686246 ?auto_686258 ) ) ( not ( = ?auto_686247 ?auto_686248 ) ) ( not ( = ?auto_686247 ?auto_686249 ) ) ( not ( = ?auto_686247 ?auto_686250 ) ) ( not ( = ?auto_686247 ?auto_686251 ) ) ( not ( = ?auto_686247 ?auto_686252 ) ) ( not ( = ?auto_686247 ?auto_686253 ) ) ( not ( = ?auto_686247 ?auto_686254 ) ) ( not ( = ?auto_686247 ?auto_686255 ) ) ( not ( = ?auto_686247 ?auto_686256 ) ) ( not ( = ?auto_686247 ?auto_686257 ) ) ( not ( = ?auto_686247 ?auto_686258 ) ) ( not ( = ?auto_686248 ?auto_686249 ) ) ( not ( = ?auto_686248 ?auto_686250 ) ) ( not ( = ?auto_686248 ?auto_686251 ) ) ( not ( = ?auto_686248 ?auto_686252 ) ) ( not ( = ?auto_686248 ?auto_686253 ) ) ( not ( = ?auto_686248 ?auto_686254 ) ) ( not ( = ?auto_686248 ?auto_686255 ) ) ( not ( = ?auto_686248 ?auto_686256 ) ) ( not ( = ?auto_686248 ?auto_686257 ) ) ( not ( = ?auto_686248 ?auto_686258 ) ) ( not ( = ?auto_686249 ?auto_686250 ) ) ( not ( = ?auto_686249 ?auto_686251 ) ) ( not ( = ?auto_686249 ?auto_686252 ) ) ( not ( = ?auto_686249 ?auto_686253 ) ) ( not ( = ?auto_686249 ?auto_686254 ) ) ( not ( = ?auto_686249 ?auto_686255 ) ) ( not ( = ?auto_686249 ?auto_686256 ) ) ( not ( = ?auto_686249 ?auto_686257 ) ) ( not ( = ?auto_686249 ?auto_686258 ) ) ( not ( = ?auto_686250 ?auto_686251 ) ) ( not ( = ?auto_686250 ?auto_686252 ) ) ( not ( = ?auto_686250 ?auto_686253 ) ) ( not ( = ?auto_686250 ?auto_686254 ) ) ( not ( = ?auto_686250 ?auto_686255 ) ) ( not ( = ?auto_686250 ?auto_686256 ) ) ( not ( = ?auto_686250 ?auto_686257 ) ) ( not ( = ?auto_686250 ?auto_686258 ) ) ( not ( = ?auto_686251 ?auto_686252 ) ) ( not ( = ?auto_686251 ?auto_686253 ) ) ( not ( = ?auto_686251 ?auto_686254 ) ) ( not ( = ?auto_686251 ?auto_686255 ) ) ( not ( = ?auto_686251 ?auto_686256 ) ) ( not ( = ?auto_686251 ?auto_686257 ) ) ( not ( = ?auto_686251 ?auto_686258 ) ) ( not ( = ?auto_686252 ?auto_686253 ) ) ( not ( = ?auto_686252 ?auto_686254 ) ) ( not ( = ?auto_686252 ?auto_686255 ) ) ( not ( = ?auto_686252 ?auto_686256 ) ) ( not ( = ?auto_686252 ?auto_686257 ) ) ( not ( = ?auto_686252 ?auto_686258 ) ) ( not ( = ?auto_686253 ?auto_686254 ) ) ( not ( = ?auto_686253 ?auto_686255 ) ) ( not ( = ?auto_686253 ?auto_686256 ) ) ( not ( = ?auto_686253 ?auto_686257 ) ) ( not ( = ?auto_686253 ?auto_686258 ) ) ( not ( = ?auto_686254 ?auto_686255 ) ) ( not ( = ?auto_686254 ?auto_686256 ) ) ( not ( = ?auto_686254 ?auto_686257 ) ) ( not ( = ?auto_686254 ?auto_686258 ) ) ( not ( = ?auto_686255 ?auto_686256 ) ) ( not ( = ?auto_686255 ?auto_686257 ) ) ( not ( = ?auto_686255 ?auto_686258 ) ) ( not ( = ?auto_686256 ?auto_686257 ) ) ( not ( = ?auto_686256 ?auto_686258 ) ) ( not ( = ?auto_686257 ?auto_686258 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_686257 ?auto_686258 )
      ( !STACK ?auto_686257 ?auto_686256 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_686276 - BLOCK
      ?auto_686277 - BLOCK
      ?auto_686278 - BLOCK
      ?auto_686279 - BLOCK
      ?auto_686280 - BLOCK
      ?auto_686281 - BLOCK
      ?auto_686282 - BLOCK
      ?auto_686283 - BLOCK
      ?auto_686284 - BLOCK
      ?auto_686285 - BLOCK
      ?auto_686286 - BLOCK
      ?auto_686287 - BLOCK
      ?auto_686288 - BLOCK
      ?auto_686289 - BLOCK
      ?auto_686290 - BLOCK
      ?auto_686291 - BLOCK
      ?auto_686292 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_686291 ) ( ON-TABLE ?auto_686292 ) ( CLEAR ?auto_686292 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_686276 ) ( ON ?auto_686277 ?auto_686276 ) ( ON ?auto_686278 ?auto_686277 ) ( ON ?auto_686279 ?auto_686278 ) ( ON ?auto_686280 ?auto_686279 ) ( ON ?auto_686281 ?auto_686280 ) ( ON ?auto_686282 ?auto_686281 ) ( ON ?auto_686283 ?auto_686282 ) ( ON ?auto_686284 ?auto_686283 ) ( ON ?auto_686285 ?auto_686284 ) ( ON ?auto_686286 ?auto_686285 ) ( ON ?auto_686287 ?auto_686286 ) ( ON ?auto_686288 ?auto_686287 ) ( ON ?auto_686289 ?auto_686288 ) ( ON ?auto_686290 ?auto_686289 ) ( ON ?auto_686291 ?auto_686290 ) ( not ( = ?auto_686276 ?auto_686277 ) ) ( not ( = ?auto_686276 ?auto_686278 ) ) ( not ( = ?auto_686276 ?auto_686279 ) ) ( not ( = ?auto_686276 ?auto_686280 ) ) ( not ( = ?auto_686276 ?auto_686281 ) ) ( not ( = ?auto_686276 ?auto_686282 ) ) ( not ( = ?auto_686276 ?auto_686283 ) ) ( not ( = ?auto_686276 ?auto_686284 ) ) ( not ( = ?auto_686276 ?auto_686285 ) ) ( not ( = ?auto_686276 ?auto_686286 ) ) ( not ( = ?auto_686276 ?auto_686287 ) ) ( not ( = ?auto_686276 ?auto_686288 ) ) ( not ( = ?auto_686276 ?auto_686289 ) ) ( not ( = ?auto_686276 ?auto_686290 ) ) ( not ( = ?auto_686276 ?auto_686291 ) ) ( not ( = ?auto_686276 ?auto_686292 ) ) ( not ( = ?auto_686277 ?auto_686278 ) ) ( not ( = ?auto_686277 ?auto_686279 ) ) ( not ( = ?auto_686277 ?auto_686280 ) ) ( not ( = ?auto_686277 ?auto_686281 ) ) ( not ( = ?auto_686277 ?auto_686282 ) ) ( not ( = ?auto_686277 ?auto_686283 ) ) ( not ( = ?auto_686277 ?auto_686284 ) ) ( not ( = ?auto_686277 ?auto_686285 ) ) ( not ( = ?auto_686277 ?auto_686286 ) ) ( not ( = ?auto_686277 ?auto_686287 ) ) ( not ( = ?auto_686277 ?auto_686288 ) ) ( not ( = ?auto_686277 ?auto_686289 ) ) ( not ( = ?auto_686277 ?auto_686290 ) ) ( not ( = ?auto_686277 ?auto_686291 ) ) ( not ( = ?auto_686277 ?auto_686292 ) ) ( not ( = ?auto_686278 ?auto_686279 ) ) ( not ( = ?auto_686278 ?auto_686280 ) ) ( not ( = ?auto_686278 ?auto_686281 ) ) ( not ( = ?auto_686278 ?auto_686282 ) ) ( not ( = ?auto_686278 ?auto_686283 ) ) ( not ( = ?auto_686278 ?auto_686284 ) ) ( not ( = ?auto_686278 ?auto_686285 ) ) ( not ( = ?auto_686278 ?auto_686286 ) ) ( not ( = ?auto_686278 ?auto_686287 ) ) ( not ( = ?auto_686278 ?auto_686288 ) ) ( not ( = ?auto_686278 ?auto_686289 ) ) ( not ( = ?auto_686278 ?auto_686290 ) ) ( not ( = ?auto_686278 ?auto_686291 ) ) ( not ( = ?auto_686278 ?auto_686292 ) ) ( not ( = ?auto_686279 ?auto_686280 ) ) ( not ( = ?auto_686279 ?auto_686281 ) ) ( not ( = ?auto_686279 ?auto_686282 ) ) ( not ( = ?auto_686279 ?auto_686283 ) ) ( not ( = ?auto_686279 ?auto_686284 ) ) ( not ( = ?auto_686279 ?auto_686285 ) ) ( not ( = ?auto_686279 ?auto_686286 ) ) ( not ( = ?auto_686279 ?auto_686287 ) ) ( not ( = ?auto_686279 ?auto_686288 ) ) ( not ( = ?auto_686279 ?auto_686289 ) ) ( not ( = ?auto_686279 ?auto_686290 ) ) ( not ( = ?auto_686279 ?auto_686291 ) ) ( not ( = ?auto_686279 ?auto_686292 ) ) ( not ( = ?auto_686280 ?auto_686281 ) ) ( not ( = ?auto_686280 ?auto_686282 ) ) ( not ( = ?auto_686280 ?auto_686283 ) ) ( not ( = ?auto_686280 ?auto_686284 ) ) ( not ( = ?auto_686280 ?auto_686285 ) ) ( not ( = ?auto_686280 ?auto_686286 ) ) ( not ( = ?auto_686280 ?auto_686287 ) ) ( not ( = ?auto_686280 ?auto_686288 ) ) ( not ( = ?auto_686280 ?auto_686289 ) ) ( not ( = ?auto_686280 ?auto_686290 ) ) ( not ( = ?auto_686280 ?auto_686291 ) ) ( not ( = ?auto_686280 ?auto_686292 ) ) ( not ( = ?auto_686281 ?auto_686282 ) ) ( not ( = ?auto_686281 ?auto_686283 ) ) ( not ( = ?auto_686281 ?auto_686284 ) ) ( not ( = ?auto_686281 ?auto_686285 ) ) ( not ( = ?auto_686281 ?auto_686286 ) ) ( not ( = ?auto_686281 ?auto_686287 ) ) ( not ( = ?auto_686281 ?auto_686288 ) ) ( not ( = ?auto_686281 ?auto_686289 ) ) ( not ( = ?auto_686281 ?auto_686290 ) ) ( not ( = ?auto_686281 ?auto_686291 ) ) ( not ( = ?auto_686281 ?auto_686292 ) ) ( not ( = ?auto_686282 ?auto_686283 ) ) ( not ( = ?auto_686282 ?auto_686284 ) ) ( not ( = ?auto_686282 ?auto_686285 ) ) ( not ( = ?auto_686282 ?auto_686286 ) ) ( not ( = ?auto_686282 ?auto_686287 ) ) ( not ( = ?auto_686282 ?auto_686288 ) ) ( not ( = ?auto_686282 ?auto_686289 ) ) ( not ( = ?auto_686282 ?auto_686290 ) ) ( not ( = ?auto_686282 ?auto_686291 ) ) ( not ( = ?auto_686282 ?auto_686292 ) ) ( not ( = ?auto_686283 ?auto_686284 ) ) ( not ( = ?auto_686283 ?auto_686285 ) ) ( not ( = ?auto_686283 ?auto_686286 ) ) ( not ( = ?auto_686283 ?auto_686287 ) ) ( not ( = ?auto_686283 ?auto_686288 ) ) ( not ( = ?auto_686283 ?auto_686289 ) ) ( not ( = ?auto_686283 ?auto_686290 ) ) ( not ( = ?auto_686283 ?auto_686291 ) ) ( not ( = ?auto_686283 ?auto_686292 ) ) ( not ( = ?auto_686284 ?auto_686285 ) ) ( not ( = ?auto_686284 ?auto_686286 ) ) ( not ( = ?auto_686284 ?auto_686287 ) ) ( not ( = ?auto_686284 ?auto_686288 ) ) ( not ( = ?auto_686284 ?auto_686289 ) ) ( not ( = ?auto_686284 ?auto_686290 ) ) ( not ( = ?auto_686284 ?auto_686291 ) ) ( not ( = ?auto_686284 ?auto_686292 ) ) ( not ( = ?auto_686285 ?auto_686286 ) ) ( not ( = ?auto_686285 ?auto_686287 ) ) ( not ( = ?auto_686285 ?auto_686288 ) ) ( not ( = ?auto_686285 ?auto_686289 ) ) ( not ( = ?auto_686285 ?auto_686290 ) ) ( not ( = ?auto_686285 ?auto_686291 ) ) ( not ( = ?auto_686285 ?auto_686292 ) ) ( not ( = ?auto_686286 ?auto_686287 ) ) ( not ( = ?auto_686286 ?auto_686288 ) ) ( not ( = ?auto_686286 ?auto_686289 ) ) ( not ( = ?auto_686286 ?auto_686290 ) ) ( not ( = ?auto_686286 ?auto_686291 ) ) ( not ( = ?auto_686286 ?auto_686292 ) ) ( not ( = ?auto_686287 ?auto_686288 ) ) ( not ( = ?auto_686287 ?auto_686289 ) ) ( not ( = ?auto_686287 ?auto_686290 ) ) ( not ( = ?auto_686287 ?auto_686291 ) ) ( not ( = ?auto_686287 ?auto_686292 ) ) ( not ( = ?auto_686288 ?auto_686289 ) ) ( not ( = ?auto_686288 ?auto_686290 ) ) ( not ( = ?auto_686288 ?auto_686291 ) ) ( not ( = ?auto_686288 ?auto_686292 ) ) ( not ( = ?auto_686289 ?auto_686290 ) ) ( not ( = ?auto_686289 ?auto_686291 ) ) ( not ( = ?auto_686289 ?auto_686292 ) ) ( not ( = ?auto_686290 ?auto_686291 ) ) ( not ( = ?auto_686290 ?auto_686292 ) ) ( not ( = ?auto_686291 ?auto_686292 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_686292 )
      ( !STACK ?auto_686292 ?auto_686291 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_686310 - BLOCK
      ?auto_686311 - BLOCK
      ?auto_686312 - BLOCK
      ?auto_686313 - BLOCK
      ?auto_686314 - BLOCK
      ?auto_686315 - BLOCK
      ?auto_686316 - BLOCK
      ?auto_686317 - BLOCK
      ?auto_686318 - BLOCK
      ?auto_686319 - BLOCK
      ?auto_686320 - BLOCK
      ?auto_686321 - BLOCK
      ?auto_686322 - BLOCK
      ?auto_686323 - BLOCK
      ?auto_686324 - BLOCK
      ?auto_686325 - BLOCK
      ?auto_686326 - BLOCK
    )
    :vars
    (
      ?auto_686327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_686326 ?auto_686327 ) ( ON-TABLE ?auto_686310 ) ( ON ?auto_686311 ?auto_686310 ) ( ON ?auto_686312 ?auto_686311 ) ( ON ?auto_686313 ?auto_686312 ) ( ON ?auto_686314 ?auto_686313 ) ( ON ?auto_686315 ?auto_686314 ) ( ON ?auto_686316 ?auto_686315 ) ( ON ?auto_686317 ?auto_686316 ) ( ON ?auto_686318 ?auto_686317 ) ( ON ?auto_686319 ?auto_686318 ) ( ON ?auto_686320 ?auto_686319 ) ( ON ?auto_686321 ?auto_686320 ) ( ON ?auto_686322 ?auto_686321 ) ( ON ?auto_686323 ?auto_686322 ) ( ON ?auto_686324 ?auto_686323 ) ( not ( = ?auto_686310 ?auto_686311 ) ) ( not ( = ?auto_686310 ?auto_686312 ) ) ( not ( = ?auto_686310 ?auto_686313 ) ) ( not ( = ?auto_686310 ?auto_686314 ) ) ( not ( = ?auto_686310 ?auto_686315 ) ) ( not ( = ?auto_686310 ?auto_686316 ) ) ( not ( = ?auto_686310 ?auto_686317 ) ) ( not ( = ?auto_686310 ?auto_686318 ) ) ( not ( = ?auto_686310 ?auto_686319 ) ) ( not ( = ?auto_686310 ?auto_686320 ) ) ( not ( = ?auto_686310 ?auto_686321 ) ) ( not ( = ?auto_686310 ?auto_686322 ) ) ( not ( = ?auto_686310 ?auto_686323 ) ) ( not ( = ?auto_686310 ?auto_686324 ) ) ( not ( = ?auto_686310 ?auto_686325 ) ) ( not ( = ?auto_686310 ?auto_686326 ) ) ( not ( = ?auto_686310 ?auto_686327 ) ) ( not ( = ?auto_686311 ?auto_686312 ) ) ( not ( = ?auto_686311 ?auto_686313 ) ) ( not ( = ?auto_686311 ?auto_686314 ) ) ( not ( = ?auto_686311 ?auto_686315 ) ) ( not ( = ?auto_686311 ?auto_686316 ) ) ( not ( = ?auto_686311 ?auto_686317 ) ) ( not ( = ?auto_686311 ?auto_686318 ) ) ( not ( = ?auto_686311 ?auto_686319 ) ) ( not ( = ?auto_686311 ?auto_686320 ) ) ( not ( = ?auto_686311 ?auto_686321 ) ) ( not ( = ?auto_686311 ?auto_686322 ) ) ( not ( = ?auto_686311 ?auto_686323 ) ) ( not ( = ?auto_686311 ?auto_686324 ) ) ( not ( = ?auto_686311 ?auto_686325 ) ) ( not ( = ?auto_686311 ?auto_686326 ) ) ( not ( = ?auto_686311 ?auto_686327 ) ) ( not ( = ?auto_686312 ?auto_686313 ) ) ( not ( = ?auto_686312 ?auto_686314 ) ) ( not ( = ?auto_686312 ?auto_686315 ) ) ( not ( = ?auto_686312 ?auto_686316 ) ) ( not ( = ?auto_686312 ?auto_686317 ) ) ( not ( = ?auto_686312 ?auto_686318 ) ) ( not ( = ?auto_686312 ?auto_686319 ) ) ( not ( = ?auto_686312 ?auto_686320 ) ) ( not ( = ?auto_686312 ?auto_686321 ) ) ( not ( = ?auto_686312 ?auto_686322 ) ) ( not ( = ?auto_686312 ?auto_686323 ) ) ( not ( = ?auto_686312 ?auto_686324 ) ) ( not ( = ?auto_686312 ?auto_686325 ) ) ( not ( = ?auto_686312 ?auto_686326 ) ) ( not ( = ?auto_686312 ?auto_686327 ) ) ( not ( = ?auto_686313 ?auto_686314 ) ) ( not ( = ?auto_686313 ?auto_686315 ) ) ( not ( = ?auto_686313 ?auto_686316 ) ) ( not ( = ?auto_686313 ?auto_686317 ) ) ( not ( = ?auto_686313 ?auto_686318 ) ) ( not ( = ?auto_686313 ?auto_686319 ) ) ( not ( = ?auto_686313 ?auto_686320 ) ) ( not ( = ?auto_686313 ?auto_686321 ) ) ( not ( = ?auto_686313 ?auto_686322 ) ) ( not ( = ?auto_686313 ?auto_686323 ) ) ( not ( = ?auto_686313 ?auto_686324 ) ) ( not ( = ?auto_686313 ?auto_686325 ) ) ( not ( = ?auto_686313 ?auto_686326 ) ) ( not ( = ?auto_686313 ?auto_686327 ) ) ( not ( = ?auto_686314 ?auto_686315 ) ) ( not ( = ?auto_686314 ?auto_686316 ) ) ( not ( = ?auto_686314 ?auto_686317 ) ) ( not ( = ?auto_686314 ?auto_686318 ) ) ( not ( = ?auto_686314 ?auto_686319 ) ) ( not ( = ?auto_686314 ?auto_686320 ) ) ( not ( = ?auto_686314 ?auto_686321 ) ) ( not ( = ?auto_686314 ?auto_686322 ) ) ( not ( = ?auto_686314 ?auto_686323 ) ) ( not ( = ?auto_686314 ?auto_686324 ) ) ( not ( = ?auto_686314 ?auto_686325 ) ) ( not ( = ?auto_686314 ?auto_686326 ) ) ( not ( = ?auto_686314 ?auto_686327 ) ) ( not ( = ?auto_686315 ?auto_686316 ) ) ( not ( = ?auto_686315 ?auto_686317 ) ) ( not ( = ?auto_686315 ?auto_686318 ) ) ( not ( = ?auto_686315 ?auto_686319 ) ) ( not ( = ?auto_686315 ?auto_686320 ) ) ( not ( = ?auto_686315 ?auto_686321 ) ) ( not ( = ?auto_686315 ?auto_686322 ) ) ( not ( = ?auto_686315 ?auto_686323 ) ) ( not ( = ?auto_686315 ?auto_686324 ) ) ( not ( = ?auto_686315 ?auto_686325 ) ) ( not ( = ?auto_686315 ?auto_686326 ) ) ( not ( = ?auto_686315 ?auto_686327 ) ) ( not ( = ?auto_686316 ?auto_686317 ) ) ( not ( = ?auto_686316 ?auto_686318 ) ) ( not ( = ?auto_686316 ?auto_686319 ) ) ( not ( = ?auto_686316 ?auto_686320 ) ) ( not ( = ?auto_686316 ?auto_686321 ) ) ( not ( = ?auto_686316 ?auto_686322 ) ) ( not ( = ?auto_686316 ?auto_686323 ) ) ( not ( = ?auto_686316 ?auto_686324 ) ) ( not ( = ?auto_686316 ?auto_686325 ) ) ( not ( = ?auto_686316 ?auto_686326 ) ) ( not ( = ?auto_686316 ?auto_686327 ) ) ( not ( = ?auto_686317 ?auto_686318 ) ) ( not ( = ?auto_686317 ?auto_686319 ) ) ( not ( = ?auto_686317 ?auto_686320 ) ) ( not ( = ?auto_686317 ?auto_686321 ) ) ( not ( = ?auto_686317 ?auto_686322 ) ) ( not ( = ?auto_686317 ?auto_686323 ) ) ( not ( = ?auto_686317 ?auto_686324 ) ) ( not ( = ?auto_686317 ?auto_686325 ) ) ( not ( = ?auto_686317 ?auto_686326 ) ) ( not ( = ?auto_686317 ?auto_686327 ) ) ( not ( = ?auto_686318 ?auto_686319 ) ) ( not ( = ?auto_686318 ?auto_686320 ) ) ( not ( = ?auto_686318 ?auto_686321 ) ) ( not ( = ?auto_686318 ?auto_686322 ) ) ( not ( = ?auto_686318 ?auto_686323 ) ) ( not ( = ?auto_686318 ?auto_686324 ) ) ( not ( = ?auto_686318 ?auto_686325 ) ) ( not ( = ?auto_686318 ?auto_686326 ) ) ( not ( = ?auto_686318 ?auto_686327 ) ) ( not ( = ?auto_686319 ?auto_686320 ) ) ( not ( = ?auto_686319 ?auto_686321 ) ) ( not ( = ?auto_686319 ?auto_686322 ) ) ( not ( = ?auto_686319 ?auto_686323 ) ) ( not ( = ?auto_686319 ?auto_686324 ) ) ( not ( = ?auto_686319 ?auto_686325 ) ) ( not ( = ?auto_686319 ?auto_686326 ) ) ( not ( = ?auto_686319 ?auto_686327 ) ) ( not ( = ?auto_686320 ?auto_686321 ) ) ( not ( = ?auto_686320 ?auto_686322 ) ) ( not ( = ?auto_686320 ?auto_686323 ) ) ( not ( = ?auto_686320 ?auto_686324 ) ) ( not ( = ?auto_686320 ?auto_686325 ) ) ( not ( = ?auto_686320 ?auto_686326 ) ) ( not ( = ?auto_686320 ?auto_686327 ) ) ( not ( = ?auto_686321 ?auto_686322 ) ) ( not ( = ?auto_686321 ?auto_686323 ) ) ( not ( = ?auto_686321 ?auto_686324 ) ) ( not ( = ?auto_686321 ?auto_686325 ) ) ( not ( = ?auto_686321 ?auto_686326 ) ) ( not ( = ?auto_686321 ?auto_686327 ) ) ( not ( = ?auto_686322 ?auto_686323 ) ) ( not ( = ?auto_686322 ?auto_686324 ) ) ( not ( = ?auto_686322 ?auto_686325 ) ) ( not ( = ?auto_686322 ?auto_686326 ) ) ( not ( = ?auto_686322 ?auto_686327 ) ) ( not ( = ?auto_686323 ?auto_686324 ) ) ( not ( = ?auto_686323 ?auto_686325 ) ) ( not ( = ?auto_686323 ?auto_686326 ) ) ( not ( = ?auto_686323 ?auto_686327 ) ) ( not ( = ?auto_686324 ?auto_686325 ) ) ( not ( = ?auto_686324 ?auto_686326 ) ) ( not ( = ?auto_686324 ?auto_686327 ) ) ( not ( = ?auto_686325 ?auto_686326 ) ) ( not ( = ?auto_686325 ?auto_686327 ) ) ( not ( = ?auto_686326 ?auto_686327 ) ) ( CLEAR ?auto_686324 ) ( ON ?auto_686325 ?auto_686326 ) ( CLEAR ?auto_686325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_686310 ?auto_686311 ?auto_686312 ?auto_686313 ?auto_686314 ?auto_686315 ?auto_686316 ?auto_686317 ?auto_686318 ?auto_686319 ?auto_686320 ?auto_686321 ?auto_686322 ?auto_686323 ?auto_686324 ?auto_686325 )
      ( MAKE-17PILE ?auto_686310 ?auto_686311 ?auto_686312 ?auto_686313 ?auto_686314 ?auto_686315 ?auto_686316 ?auto_686317 ?auto_686318 ?auto_686319 ?auto_686320 ?auto_686321 ?auto_686322 ?auto_686323 ?auto_686324 ?auto_686325 ?auto_686326 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_686345 - BLOCK
      ?auto_686346 - BLOCK
      ?auto_686347 - BLOCK
      ?auto_686348 - BLOCK
      ?auto_686349 - BLOCK
      ?auto_686350 - BLOCK
      ?auto_686351 - BLOCK
      ?auto_686352 - BLOCK
      ?auto_686353 - BLOCK
      ?auto_686354 - BLOCK
      ?auto_686355 - BLOCK
      ?auto_686356 - BLOCK
      ?auto_686357 - BLOCK
      ?auto_686358 - BLOCK
      ?auto_686359 - BLOCK
      ?auto_686360 - BLOCK
      ?auto_686361 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_686361 ) ( ON-TABLE ?auto_686345 ) ( ON ?auto_686346 ?auto_686345 ) ( ON ?auto_686347 ?auto_686346 ) ( ON ?auto_686348 ?auto_686347 ) ( ON ?auto_686349 ?auto_686348 ) ( ON ?auto_686350 ?auto_686349 ) ( ON ?auto_686351 ?auto_686350 ) ( ON ?auto_686352 ?auto_686351 ) ( ON ?auto_686353 ?auto_686352 ) ( ON ?auto_686354 ?auto_686353 ) ( ON ?auto_686355 ?auto_686354 ) ( ON ?auto_686356 ?auto_686355 ) ( ON ?auto_686357 ?auto_686356 ) ( ON ?auto_686358 ?auto_686357 ) ( ON ?auto_686359 ?auto_686358 ) ( not ( = ?auto_686345 ?auto_686346 ) ) ( not ( = ?auto_686345 ?auto_686347 ) ) ( not ( = ?auto_686345 ?auto_686348 ) ) ( not ( = ?auto_686345 ?auto_686349 ) ) ( not ( = ?auto_686345 ?auto_686350 ) ) ( not ( = ?auto_686345 ?auto_686351 ) ) ( not ( = ?auto_686345 ?auto_686352 ) ) ( not ( = ?auto_686345 ?auto_686353 ) ) ( not ( = ?auto_686345 ?auto_686354 ) ) ( not ( = ?auto_686345 ?auto_686355 ) ) ( not ( = ?auto_686345 ?auto_686356 ) ) ( not ( = ?auto_686345 ?auto_686357 ) ) ( not ( = ?auto_686345 ?auto_686358 ) ) ( not ( = ?auto_686345 ?auto_686359 ) ) ( not ( = ?auto_686345 ?auto_686360 ) ) ( not ( = ?auto_686345 ?auto_686361 ) ) ( not ( = ?auto_686346 ?auto_686347 ) ) ( not ( = ?auto_686346 ?auto_686348 ) ) ( not ( = ?auto_686346 ?auto_686349 ) ) ( not ( = ?auto_686346 ?auto_686350 ) ) ( not ( = ?auto_686346 ?auto_686351 ) ) ( not ( = ?auto_686346 ?auto_686352 ) ) ( not ( = ?auto_686346 ?auto_686353 ) ) ( not ( = ?auto_686346 ?auto_686354 ) ) ( not ( = ?auto_686346 ?auto_686355 ) ) ( not ( = ?auto_686346 ?auto_686356 ) ) ( not ( = ?auto_686346 ?auto_686357 ) ) ( not ( = ?auto_686346 ?auto_686358 ) ) ( not ( = ?auto_686346 ?auto_686359 ) ) ( not ( = ?auto_686346 ?auto_686360 ) ) ( not ( = ?auto_686346 ?auto_686361 ) ) ( not ( = ?auto_686347 ?auto_686348 ) ) ( not ( = ?auto_686347 ?auto_686349 ) ) ( not ( = ?auto_686347 ?auto_686350 ) ) ( not ( = ?auto_686347 ?auto_686351 ) ) ( not ( = ?auto_686347 ?auto_686352 ) ) ( not ( = ?auto_686347 ?auto_686353 ) ) ( not ( = ?auto_686347 ?auto_686354 ) ) ( not ( = ?auto_686347 ?auto_686355 ) ) ( not ( = ?auto_686347 ?auto_686356 ) ) ( not ( = ?auto_686347 ?auto_686357 ) ) ( not ( = ?auto_686347 ?auto_686358 ) ) ( not ( = ?auto_686347 ?auto_686359 ) ) ( not ( = ?auto_686347 ?auto_686360 ) ) ( not ( = ?auto_686347 ?auto_686361 ) ) ( not ( = ?auto_686348 ?auto_686349 ) ) ( not ( = ?auto_686348 ?auto_686350 ) ) ( not ( = ?auto_686348 ?auto_686351 ) ) ( not ( = ?auto_686348 ?auto_686352 ) ) ( not ( = ?auto_686348 ?auto_686353 ) ) ( not ( = ?auto_686348 ?auto_686354 ) ) ( not ( = ?auto_686348 ?auto_686355 ) ) ( not ( = ?auto_686348 ?auto_686356 ) ) ( not ( = ?auto_686348 ?auto_686357 ) ) ( not ( = ?auto_686348 ?auto_686358 ) ) ( not ( = ?auto_686348 ?auto_686359 ) ) ( not ( = ?auto_686348 ?auto_686360 ) ) ( not ( = ?auto_686348 ?auto_686361 ) ) ( not ( = ?auto_686349 ?auto_686350 ) ) ( not ( = ?auto_686349 ?auto_686351 ) ) ( not ( = ?auto_686349 ?auto_686352 ) ) ( not ( = ?auto_686349 ?auto_686353 ) ) ( not ( = ?auto_686349 ?auto_686354 ) ) ( not ( = ?auto_686349 ?auto_686355 ) ) ( not ( = ?auto_686349 ?auto_686356 ) ) ( not ( = ?auto_686349 ?auto_686357 ) ) ( not ( = ?auto_686349 ?auto_686358 ) ) ( not ( = ?auto_686349 ?auto_686359 ) ) ( not ( = ?auto_686349 ?auto_686360 ) ) ( not ( = ?auto_686349 ?auto_686361 ) ) ( not ( = ?auto_686350 ?auto_686351 ) ) ( not ( = ?auto_686350 ?auto_686352 ) ) ( not ( = ?auto_686350 ?auto_686353 ) ) ( not ( = ?auto_686350 ?auto_686354 ) ) ( not ( = ?auto_686350 ?auto_686355 ) ) ( not ( = ?auto_686350 ?auto_686356 ) ) ( not ( = ?auto_686350 ?auto_686357 ) ) ( not ( = ?auto_686350 ?auto_686358 ) ) ( not ( = ?auto_686350 ?auto_686359 ) ) ( not ( = ?auto_686350 ?auto_686360 ) ) ( not ( = ?auto_686350 ?auto_686361 ) ) ( not ( = ?auto_686351 ?auto_686352 ) ) ( not ( = ?auto_686351 ?auto_686353 ) ) ( not ( = ?auto_686351 ?auto_686354 ) ) ( not ( = ?auto_686351 ?auto_686355 ) ) ( not ( = ?auto_686351 ?auto_686356 ) ) ( not ( = ?auto_686351 ?auto_686357 ) ) ( not ( = ?auto_686351 ?auto_686358 ) ) ( not ( = ?auto_686351 ?auto_686359 ) ) ( not ( = ?auto_686351 ?auto_686360 ) ) ( not ( = ?auto_686351 ?auto_686361 ) ) ( not ( = ?auto_686352 ?auto_686353 ) ) ( not ( = ?auto_686352 ?auto_686354 ) ) ( not ( = ?auto_686352 ?auto_686355 ) ) ( not ( = ?auto_686352 ?auto_686356 ) ) ( not ( = ?auto_686352 ?auto_686357 ) ) ( not ( = ?auto_686352 ?auto_686358 ) ) ( not ( = ?auto_686352 ?auto_686359 ) ) ( not ( = ?auto_686352 ?auto_686360 ) ) ( not ( = ?auto_686352 ?auto_686361 ) ) ( not ( = ?auto_686353 ?auto_686354 ) ) ( not ( = ?auto_686353 ?auto_686355 ) ) ( not ( = ?auto_686353 ?auto_686356 ) ) ( not ( = ?auto_686353 ?auto_686357 ) ) ( not ( = ?auto_686353 ?auto_686358 ) ) ( not ( = ?auto_686353 ?auto_686359 ) ) ( not ( = ?auto_686353 ?auto_686360 ) ) ( not ( = ?auto_686353 ?auto_686361 ) ) ( not ( = ?auto_686354 ?auto_686355 ) ) ( not ( = ?auto_686354 ?auto_686356 ) ) ( not ( = ?auto_686354 ?auto_686357 ) ) ( not ( = ?auto_686354 ?auto_686358 ) ) ( not ( = ?auto_686354 ?auto_686359 ) ) ( not ( = ?auto_686354 ?auto_686360 ) ) ( not ( = ?auto_686354 ?auto_686361 ) ) ( not ( = ?auto_686355 ?auto_686356 ) ) ( not ( = ?auto_686355 ?auto_686357 ) ) ( not ( = ?auto_686355 ?auto_686358 ) ) ( not ( = ?auto_686355 ?auto_686359 ) ) ( not ( = ?auto_686355 ?auto_686360 ) ) ( not ( = ?auto_686355 ?auto_686361 ) ) ( not ( = ?auto_686356 ?auto_686357 ) ) ( not ( = ?auto_686356 ?auto_686358 ) ) ( not ( = ?auto_686356 ?auto_686359 ) ) ( not ( = ?auto_686356 ?auto_686360 ) ) ( not ( = ?auto_686356 ?auto_686361 ) ) ( not ( = ?auto_686357 ?auto_686358 ) ) ( not ( = ?auto_686357 ?auto_686359 ) ) ( not ( = ?auto_686357 ?auto_686360 ) ) ( not ( = ?auto_686357 ?auto_686361 ) ) ( not ( = ?auto_686358 ?auto_686359 ) ) ( not ( = ?auto_686358 ?auto_686360 ) ) ( not ( = ?auto_686358 ?auto_686361 ) ) ( not ( = ?auto_686359 ?auto_686360 ) ) ( not ( = ?auto_686359 ?auto_686361 ) ) ( not ( = ?auto_686360 ?auto_686361 ) ) ( CLEAR ?auto_686359 ) ( ON ?auto_686360 ?auto_686361 ) ( CLEAR ?auto_686360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_686345 ?auto_686346 ?auto_686347 ?auto_686348 ?auto_686349 ?auto_686350 ?auto_686351 ?auto_686352 ?auto_686353 ?auto_686354 ?auto_686355 ?auto_686356 ?auto_686357 ?auto_686358 ?auto_686359 ?auto_686360 )
      ( MAKE-17PILE ?auto_686345 ?auto_686346 ?auto_686347 ?auto_686348 ?auto_686349 ?auto_686350 ?auto_686351 ?auto_686352 ?auto_686353 ?auto_686354 ?auto_686355 ?auto_686356 ?auto_686357 ?auto_686358 ?auto_686359 ?auto_686360 ?auto_686361 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_686379 - BLOCK
      ?auto_686380 - BLOCK
      ?auto_686381 - BLOCK
      ?auto_686382 - BLOCK
      ?auto_686383 - BLOCK
      ?auto_686384 - BLOCK
      ?auto_686385 - BLOCK
      ?auto_686386 - BLOCK
      ?auto_686387 - BLOCK
      ?auto_686388 - BLOCK
      ?auto_686389 - BLOCK
      ?auto_686390 - BLOCK
      ?auto_686391 - BLOCK
      ?auto_686392 - BLOCK
      ?auto_686393 - BLOCK
      ?auto_686394 - BLOCK
      ?auto_686395 - BLOCK
    )
    :vars
    (
      ?auto_686396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_686395 ?auto_686396 ) ( ON-TABLE ?auto_686379 ) ( ON ?auto_686380 ?auto_686379 ) ( ON ?auto_686381 ?auto_686380 ) ( ON ?auto_686382 ?auto_686381 ) ( ON ?auto_686383 ?auto_686382 ) ( ON ?auto_686384 ?auto_686383 ) ( ON ?auto_686385 ?auto_686384 ) ( ON ?auto_686386 ?auto_686385 ) ( ON ?auto_686387 ?auto_686386 ) ( ON ?auto_686388 ?auto_686387 ) ( ON ?auto_686389 ?auto_686388 ) ( ON ?auto_686390 ?auto_686389 ) ( ON ?auto_686391 ?auto_686390 ) ( ON ?auto_686392 ?auto_686391 ) ( not ( = ?auto_686379 ?auto_686380 ) ) ( not ( = ?auto_686379 ?auto_686381 ) ) ( not ( = ?auto_686379 ?auto_686382 ) ) ( not ( = ?auto_686379 ?auto_686383 ) ) ( not ( = ?auto_686379 ?auto_686384 ) ) ( not ( = ?auto_686379 ?auto_686385 ) ) ( not ( = ?auto_686379 ?auto_686386 ) ) ( not ( = ?auto_686379 ?auto_686387 ) ) ( not ( = ?auto_686379 ?auto_686388 ) ) ( not ( = ?auto_686379 ?auto_686389 ) ) ( not ( = ?auto_686379 ?auto_686390 ) ) ( not ( = ?auto_686379 ?auto_686391 ) ) ( not ( = ?auto_686379 ?auto_686392 ) ) ( not ( = ?auto_686379 ?auto_686393 ) ) ( not ( = ?auto_686379 ?auto_686394 ) ) ( not ( = ?auto_686379 ?auto_686395 ) ) ( not ( = ?auto_686379 ?auto_686396 ) ) ( not ( = ?auto_686380 ?auto_686381 ) ) ( not ( = ?auto_686380 ?auto_686382 ) ) ( not ( = ?auto_686380 ?auto_686383 ) ) ( not ( = ?auto_686380 ?auto_686384 ) ) ( not ( = ?auto_686380 ?auto_686385 ) ) ( not ( = ?auto_686380 ?auto_686386 ) ) ( not ( = ?auto_686380 ?auto_686387 ) ) ( not ( = ?auto_686380 ?auto_686388 ) ) ( not ( = ?auto_686380 ?auto_686389 ) ) ( not ( = ?auto_686380 ?auto_686390 ) ) ( not ( = ?auto_686380 ?auto_686391 ) ) ( not ( = ?auto_686380 ?auto_686392 ) ) ( not ( = ?auto_686380 ?auto_686393 ) ) ( not ( = ?auto_686380 ?auto_686394 ) ) ( not ( = ?auto_686380 ?auto_686395 ) ) ( not ( = ?auto_686380 ?auto_686396 ) ) ( not ( = ?auto_686381 ?auto_686382 ) ) ( not ( = ?auto_686381 ?auto_686383 ) ) ( not ( = ?auto_686381 ?auto_686384 ) ) ( not ( = ?auto_686381 ?auto_686385 ) ) ( not ( = ?auto_686381 ?auto_686386 ) ) ( not ( = ?auto_686381 ?auto_686387 ) ) ( not ( = ?auto_686381 ?auto_686388 ) ) ( not ( = ?auto_686381 ?auto_686389 ) ) ( not ( = ?auto_686381 ?auto_686390 ) ) ( not ( = ?auto_686381 ?auto_686391 ) ) ( not ( = ?auto_686381 ?auto_686392 ) ) ( not ( = ?auto_686381 ?auto_686393 ) ) ( not ( = ?auto_686381 ?auto_686394 ) ) ( not ( = ?auto_686381 ?auto_686395 ) ) ( not ( = ?auto_686381 ?auto_686396 ) ) ( not ( = ?auto_686382 ?auto_686383 ) ) ( not ( = ?auto_686382 ?auto_686384 ) ) ( not ( = ?auto_686382 ?auto_686385 ) ) ( not ( = ?auto_686382 ?auto_686386 ) ) ( not ( = ?auto_686382 ?auto_686387 ) ) ( not ( = ?auto_686382 ?auto_686388 ) ) ( not ( = ?auto_686382 ?auto_686389 ) ) ( not ( = ?auto_686382 ?auto_686390 ) ) ( not ( = ?auto_686382 ?auto_686391 ) ) ( not ( = ?auto_686382 ?auto_686392 ) ) ( not ( = ?auto_686382 ?auto_686393 ) ) ( not ( = ?auto_686382 ?auto_686394 ) ) ( not ( = ?auto_686382 ?auto_686395 ) ) ( not ( = ?auto_686382 ?auto_686396 ) ) ( not ( = ?auto_686383 ?auto_686384 ) ) ( not ( = ?auto_686383 ?auto_686385 ) ) ( not ( = ?auto_686383 ?auto_686386 ) ) ( not ( = ?auto_686383 ?auto_686387 ) ) ( not ( = ?auto_686383 ?auto_686388 ) ) ( not ( = ?auto_686383 ?auto_686389 ) ) ( not ( = ?auto_686383 ?auto_686390 ) ) ( not ( = ?auto_686383 ?auto_686391 ) ) ( not ( = ?auto_686383 ?auto_686392 ) ) ( not ( = ?auto_686383 ?auto_686393 ) ) ( not ( = ?auto_686383 ?auto_686394 ) ) ( not ( = ?auto_686383 ?auto_686395 ) ) ( not ( = ?auto_686383 ?auto_686396 ) ) ( not ( = ?auto_686384 ?auto_686385 ) ) ( not ( = ?auto_686384 ?auto_686386 ) ) ( not ( = ?auto_686384 ?auto_686387 ) ) ( not ( = ?auto_686384 ?auto_686388 ) ) ( not ( = ?auto_686384 ?auto_686389 ) ) ( not ( = ?auto_686384 ?auto_686390 ) ) ( not ( = ?auto_686384 ?auto_686391 ) ) ( not ( = ?auto_686384 ?auto_686392 ) ) ( not ( = ?auto_686384 ?auto_686393 ) ) ( not ( = ?auto_686384 ?auto_686394 ) ) ( not ( = ?auto_686384 ?auto_686395 ) ) ( not ( = ?auto_686384 ?auto_686396 ) ) ( not ( = ?auto_686385 ?auto_686386 ) ) ( not ( = ?auto_686385 ?auto_686387 ) ) ( not ( = ?auto_686385 ?auto_686388 ) ) ( not ( = ?auto_686385 ?auto_686389 ) ) ( not ( = ?auto_686385 ?auto_686390 ) ) ( not ( = ?auto_686385 ?auto_686391 ) ) ( not ( = ?auto_686385 ?auto_686392 ) ) ( not ( = ?auto_686385 ?auto_686393 ) ) ( not ( = ?auto_686385 ?auto_686394 ) ) ( not ( = ?auto_686385 ?auto_686395 ) ) ( not ( = ?auto_686385 ?auto_686396 ) ) ( not ( = ?auto_686386 ?auto_686387 ) ) ( not ( = ?auto_686386 ?auto_686388 ) ) ( not ( = ?auto_686386 ?auto_686389 ) ) ( not ( = ?auto_686386 ?auto_686390 ) ) ( not ( = ?auto_686386 ?auto_686391 ) ) ( not ( = ?auto_686386 ?auto_686392 ) ) ( not ( = ?auto_686386 ?auto_686393 ) ) ( not ( = ?auto_686386 ?auto_686394 ) ) ( not ( = ?auto_686386 ?auto_686395 ) ) ( not ( = ?auto_686386 ?auto_686396 ) ) ( not ( = ?auto_686387 ?auto_686388 ) ) ( not ( = ?auto_686387 ?auto_686389 ) ) ( not ( = ?auto_686387 ?auto_686390 ) ) ( not ( = ?auto_686387 ?auto_686391 ) ) ( not ( = ?auto_686387 ?auto_686392 ) ) ( not ( = ?auto_686387 ?auto_686393 ) ) ( not ( = ?auto_686387 ?auto_686394 ) ) ( not ( = ?auto_686387 ?auto_686395 ) ) ( not ( = ?auto_686387 ?auto_686396 ) ) ( not ( = ?auto_686388 ?auto_686389 ) ) ( not ( = ?auto_686388 ?auto_686390 ) ) ( not ( = ?auto_686388 ?auto_686391 ) ) ( not ( = ?auto_686388 ?auto_686392 ) ) ( not ( = ?auto_686388 ?auto_686393 ) ) ( not ( = ?auto_686388 ?auto_686394 ) ) ( not ( = ?auto_686388 ?auto_686395 ) ) ( not ( = ?auto_686388 ?auto_686396 ) ) ( not ( = ?auto_686389 ?auto_686390 ) ) ( not ( = ?auto_686389 ?auto_686391 ) ) ( not ( = ?auto_686389 ?auto_686392 ) ) ( not ( = ?auto_686389 ?auto_686393 ) ) ( not ( = ?auto_686389 ?auto_686394 ) ) ( not ( = ?auto_686389 ?auto_686395 ) ) ( not ( = ?auto_686389 ?auto_686396 ) ) ( not ( = ?auto_686390 ?auto_686391 ) ) ( not ( = ?auto_686390 ?auto_686392 ) ) ( not ( = ?auto_686390 ?auto_686393 ) ) ( not ( = ?auto_686390 ?auto_686394 ) ) ( not ( = ?auto_686390 ?auto_686395 ) ) ( not ( = ?auto_686390 ?auto_686396 ) ) ( not ( = ?auto_686391 ?auto_686392 ) ) ( not ( = ?auto_686391 ?auto_686393 ) ) ( not ( = ?auto_686391 ?auto_686394 ) ) ( not ( = ?auto_686391 ?auto_686395 ) ) ( not ( = ?auto_686391 ?auto_686396 ) ) ( not ( = ?auto_686392 ?auto_686393 ) ) ( not ( = ?auto_686392 ?auto_686394 ) ) ( not ( = ?auto_686392 ?auto_686395 ) ) ( not ( = ?auto_686392 ?auto_686396 ) ) ( not ( = ?auto_686393 ?auto_686394 ) ) ( not ( = ?auto_686393 ?auto_686395 ) ) ( not ( = ?auto_686393 ?auto_686396 ) ) ( not ( = ?auto_686394 ?auto_686395 ) ) ( not ( = ?auto_686394 ?auto_686396 ) ) ( not ( = ?auto_686395 ?auto_686396 ) ) ( ON ?auto_686394 ?auto_686395 ) ( CLEAR ?auto_686392 ) ( ON ?auto_686393 ?auto_686394 ) ( CLEAR ?auto_686393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_686379 ?auto_686380 ?auto_686381 ?auto_686382 ?auto_686383 ?auto_686384 ?auto_686385 ?auto_686386 ?auto_686387 ?auto_686388 ?auto_686389 ?auto_686390 ?auto_686391 ?auto_686392 ?auto_686393 )
      ( MAKE-17PILE ?auto_686379 ?auto_686380 ?auto_686381 ?auto_686382 ?auto_686383 ?auto_686384 ?auto_686385 ?auto_686386 ?auto_686387 ?auto_686388 ?auto_686389 ?auto_686390 ?auto_686391 ?auto_686392 ?auto_686393 ?auto_686394 ?auto_686395 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_686414 - BLOCK
      ?auto_686415 - BLOCK
      ?auto_686416 - BLOCK
      ?auto_686417 - BLOCK
      ?auto_686418 - BLOCK
      ?auto_686419 - BLOCK
      ?auto_686420 - BLOCK
      ?auto_686421 - BLOCK
      ?auto_686422 - BLOCK
      ?auto_686423 - BLOCK
      ?auto_686424 - BLOCK
      ?auto_686425 - BLOCK
      ?auto_686426 - BLOCK
      ?auto_686427 - BLOCK
      ?auto_686428 - BLOCK
      ?auto_686429 - BLOCK
      ?auto_686430 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_686430 ) ( ON-TABLE ?auto_686414 ) ( ON ?auto_686415 ?auto_686414 ) ( ON ?auto_686416 ?auto_686415 ) ( ON ?auto_686417 ?auto_686416 ) ( ON ?auto_686418 ?auto_686417 ) ( ON ?auto_686419 ?auto_686418 ) ( ON ?auto_686420 ?auto_686419 ) ( ON ?auto_686421 ?auto_686420 ) ( ON ?auto_686422 ?auto_686421 ) ( ON ?auto_686423 ?auto_686422 ) ( ON ?auto_686424 ?auto_686423 ) ( ON ?auto_686425 ?auto_686424 ) ( ON ?auto_686426 ?auto_686425 ) ( ON ?auto_686427 ?auto_686426 ) ( not ( = ?auto_686414 ?auto_686415 ) ) ( not ( = ?auto_686414 ?auto_686416 ) ) ( not ( = ?auto_686414 ?auto_686417 ) ) ( not ( = ?auto_686414 ?auto_686418 ) ) ( not ( = ?auto_686414 ?auto_686419 ) ) ( not ( = ?auto_686414 ?auto_686420 ) ) ( not ( = ?auto_686414 ?auto_686421 ) ) ( not ( = ?auto_686414 ?auto_686422 ) ) ( not ( = ?auto_686414 ?auto_686423 ) ) ( not ( = ?auto_686414 ?auto_686424 ) ) ( not ( = ?auto_686414 ?auto_686425 ) ) ( not ( = ?auto_686414 ?auto_686426 ) ) ( not ( = ?auto_686414 ?auto_686427 ) ) ( not ( = ?auto_686414 ?auto_686428 ) ) ( not ( = ?auto_686414 ?auto_686429 ) ) ( not ( = ?auto_686414 ?auto_686430 ) ) ( not ( = ?auto_686415 ?auto_686416 ) ) ( not ( = ?auto_686415 ?auto_686417 ) ) ( not ( = ?auto_686415 ?auto_686418 ) ) ( not ( = ?auto_686415 ?auto_686419 ) ) ( not ( = ?auto_686415 ?auto_686420 ) ) ( not ( = ?auto_686415 ?auto_686421 ) ) ( not ( = ?auto_686415 ?auto_686422 ) ) ( not ( = ?auto_686415 ?auto_686423 ) ) ( not ( = ?auto_686415 ?auto_686424 ) ) ( not ( = ?auto_686415 ?auto_686425 ) ) ( not ( = ?auto_686415 ?auto_686426 ) ) ( not ( = ?auto_686415 ?auto_686427 ) ) ( not ( = ?auto_686415 ?auto_686428 ) ) ( not ( = ?auto_686415 ?auto_686429 ) ) ( not ( = ?auto_686415 ?auto_686430 ) ) ( not ( = ?auto_686416 ?auto_686417 ) ) ( not ( = ?auto_686416 ?auto_686418 ) ) ( not ( = ?auto_686416 ?auto_686419 ) ) ( not ( = ?auto_686416 ?auto_686420 ) ) ( not ( = ?auto_686416 ?auto_686421 ) ) ( not ( = ?auto_686416 ?auto_686422 ) ) ( not ( = ?auto_686416 ?auto_686423 ) ) ( not ( = ?auto_686416 ?auto_686424 ) ) ( not ( = ?auto_686416 ?auto_686425 ) ) ( not ( = ?auto_686416 ?auto_686426 ) ) ( not ( = ?auto_686416 ?auto_686427 ) ) ( not ( = ?auto_686416 ?auto_686428 ) ) ( not ( = ?auto_686416 ?auto_686429 ) ) ( not ( = ?auto_686416 ?auto_686430 ) ) ( not ( = ?auto_686417 ?auto_686418 ) ) ( not ( = ?auto_686417 ?auto_686419 ) ) ( not ( = ?auto_686417 ?auto_686420 ) ) ( not ( = ?auto_686417 ?auto_686421 ) ) ( not ( = ?auto_686417 ?auto_686422 ) ) ( not ( = ?auto_686417 ?auto_686423 ) ) ( not ( = ?auto_686417 ?auto_686424 ) ) ( not ( = ?auto_686417 ?auto_686425 ) ) ( not ( = ?auto_686417 ?auto_686426 ) ) ( not ( = ?auto_686417 ?auto_686427 ) ) ( not ( = ?auto_686417 ?auto_686428 ) ) ( not ( = ?auto_686417 ?auto_686429 ) ) ( not ( = ?auto_686417 ?auto_686430 ) ) ( not ( = ?auto_686418 ?auto_686419 ) ) ( not ( = ?auto_686418 ?auto_686420 ) ) ( not ( = ?auto_686418 ?auto_686421 ) ) ( not ( = ?auto_686418 ?auto_686422 ) ) ( not ( = ?auto_686418 ?auto_686423 ) ) ( not ( = ?auto_686418 ?auto_686424 ) ) ( not ( = ?auto_686418 ?auto_686425 ) ) ( not ( = ?auto_686418 ?auto_686426 ) ) ( not ( = ?auto_686418 ?auto_686427 ) ) ( not ( = ?auto_686418 ?auto_686428 ) ) ( not ( = ?auto_686418 ?auto_686429 ) ) ( not ( = ?auto_686418 ?auto_686430 ) ) ( not ( = ?auto_686419 ?auto_686420 ) ) ( not ( = ?auto_686419 ?auto_686421 ) ) ( not ( = ?auto_686419 ?auto_686422 ) ) ( not ( = ?auto_686419 ?auto_686423 ) ) ( not ( = ?auto_686419 ?auto_686424 ) ) ( not ( = ?auto_686419 ?auto_686425 ) ) ( not ( = ?auto_686419 ?auto_686426 ) ) ( not ( = ?auto_686419 ?auto_686427 ) ) ( not ( = ?auto_686419 ?auto_686428 ) ) ( not ( = ?auto_686419 ?auto_686429 ) ) ( not ( = ?auto_686419 ?auto_686430 ) ) ( not ( = ?auto_686420 ?auto_686421 ) ) ( not ( = ?auto_686420 ?auto_686422 ) ) ( not ( = ?auto_686420 ?auto_686423 ) ) ( not ( = ?auto_686420 ?auto_686424 ) ) ( not ( = ?auto_686420 ?auto_686425 ) ) ( not ( = ?auto_686420 ?auto_686426 ) ) ( not ( = ?auto_686420 ?auto_686427 ) ) ( not ( = ?auto_686420 ?auto_686428 ) ) ( not ( = ?auto_686420 ?auto_686429 ) ) ( not ( = ?auto_686420 ?auto_686430 ) ) ( not ( = ?auto_686421 ?auto_686422 ) ) ( not ( = ?auto_686421 ?auto_686423 ) ) ( not ( = ?auto_686421 ?auto_686424 ) ) ( not ( = ?auto_686421 ?auto_686425 ) ) ( not ( = ?auto_686421 ?auto_686426 ) ) ( not ( = ?auto_686421 ?auto_686427 ) ) ( not ( = ?auto_686421 ?auto_686428 ) ) ( not ( = ?auto_686421 ?auto_686429 ) ) ( not ( = ?auto_686421 ?auto_686430 ) ) ( not ( = ?auto_686422 ?auto_686423 ) ) ( not ( = ?auto_686422 ?auto_686424 ) ) ( not ( = ?auto_686422 ?auto_686425 ) ) ( not ( = ?auto_686422 ?auto_686426 ) ) ( not ( = ?auto_686422 ?auto_686427 ) ) ( not ( = ?auto_686422 ?auto_686428 ) ) ( not ( = ?auto_686422 ?auto_686429 ) ) ( not ( = ?auto_686422 ?auto_686430 ) ) ( not ( = ?auto_686423 ?auto_686424 ) ) ( not ( = ?auto_686423 ?auto_686425 ) ) ( not ( = ?auto_686423 ?auto_686426 ) ) ( not ( = ?auto_686423 ?auto_686427 ) ) ( not ( = ?auto_686423 ?auto_686428 ) ) ( not ( = ?auto_686423 ?auto_686429 ) ) ( not ( = ?auto_686423 ?auto_686430 ) ) ( not ( = ?auto_686424 ?auto_686425 ) ) ( not ( = ?auto_686424 ?auto_686426 ) ) ( not ( = ?auto_686424 ?auto_686427 ) ) ( not ( = ?auto_686424 ?auto_686428 ) ) ( not ( = ?auto_686424 ?auto_686429 ) ) ( not ( = ?auto_686424 ?auto_686430 ) ) ( not ( = ?auto_686425 ?auto_686426 ) ) ( not ( = ?auto_686425 ?auto_686427 ) ) ( not ( = ?auto_686425 ?auto_686428 ) ) ( not ( = ?auto_686425 ?auto_686429 ) ) ( not ( = ?auto_686425 ?auto_686430 ) ) ( not ( = ?auto_686426 ?auto_686427 ) ) ( not ( = ?auto_686426 ?auto_686428 ) ) ( not ( = ?auto_686426 ?auto_686429 ) ) ( not ( = ?auto_686426 ?auto_686430 ) ) ( not ( = ?auto_686427 ?auto_686428 ) ) ( not ( = ?auto_686427 ?auto_686429 ) ) ( not ( = ?auto_686427 ?auto_686430 ) ) ( not ( = ?auto_686428 ?auto_686429 ) ) ( not ( = ?auto_686428 ?auto_686430 ) ) ( not ( = ?auto_686429 ?auto_686430 ) ) ( ON ?auto_686429 ?auto_686430 ) ( CLEAR ?auto_686427 ) ( ON ?auto_686428 ?auto_686429 ) ( CLEAR ?auto_686428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_686414 ?auto_686415 ?auto_686416 ?auto_686417 ?auto_686418 ?auto_686419 ?auto_686420 ?auto_686421 ?auto_686422 ?auto_686423 ?auto_686424 ?auto_686425 ?auto_686426 ?auto_686427 ?auto_686428 )
      ( MAKE-17PILE ?auto_686414 ?auto_686415 ?auto_686416 ?auto_686417 ?auto_686418 ?auto_686419 ?auto_686420 ?auto_686421 ?auto_686422 ?auto_686423 ?auto_686424 ?auto_686425 ?auto_686426 ?auto_686427 ?auto_686428 ?auto_686429 ?auto_686430 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_686448 - BLOCK
      ?auto_686449 - BLOCK
      ?auto_686450 - BLOCK
      ?auto_686451 - BLOCK
      ?auto_686452 - BLOCK
      ?auto_686453 - BLOCK
      ?auto_686454 - BLOCK
      ?auto_686455 - BLOCK
      ?auto_686456 - BLOCK
      ?auto_686457 - BLOCK
      ?auto_686458 - BLOCK
      ?auto_686459 - BLOCK
      ?auto_686460 - BLOCK
      ?auto_686461 - BLOCK
      ?auto_686462 - BLOCK
      ?auto_686463 - BLOCK
      ?auto_686464 - BLOCK
    )
    :vars
    (
      ?auto_686465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_686464 ?auto_686465 ) ( ON-TABLE ?auto_686448 ) ( ON ?auto_686449 ?auto_686448 ) ( ON ?auto_686450 ?auto_686449 ) ( ON ?auto_686451 ?auto_686450 ) ( ON ?auto_686452 ?auto_686451 ) ( ON ?auto_686453 ?auto_686452 ) ( ON ?auto_686454 ?auto_686453 ) ( ON ?auto_686455 ?auto_686454 ) ( ON ?auto_686456 ?auto_686455 ) ( ON ?auto_686457 ?auto_686456 ) ( ON ?auto_686458 ?auto_686457 ) ( ON ?auto_686459 ?auto_686458 ) ( ON ?auto_686460 ?auto_686459 ) ( not ( = ?auto_686448 ?auto_686449 ) ) ( not ( = ?auto_686448 ?auto_686450 ) ) ( not ( = ?auto_686448 ?auto_686451 ) ) ( not ( = ?auto_686448 ?auto_686452 ) ) ( not ( = ?auto_686448 ?auto_686453 ) ) ( not ( = ?auto_686448 ?auto_686454 ) ) ( not ( = ?auto_686448 ?auto_686455 ) ) ( not ( = ?auto_686448 ?auto_686456 ) ) ( not ( = ?auto_686448 ?auto_686457 ) ) ( not ( = ?auto_686448 ?auto_686458 ) ) ( not ( = ?auto_686448 ?auto_686459 ) ) ( not ( = ?auto_686448 ?auto_686460 ) ) ( not ( = ?auto_686448 ?auto_686461 ) ) ( not ( = ?auto_686448 ?auto_686462 ) ) ( not ( = ?auto_686448 ?auto_686463 ) ) ( not ( = ?auto_686448 ?auto_686464 ) ) ( not ( = ?auto_686448 ?auto_686465 ) ) ( not ( = ?auto_686449 ?auto_686450 ) ) ( not ( = ?auto_686449 ?auto_686451 ) ) ( not ( = ?auto_686449 ?auto_686452 ) ) ( not ( = ?auto_686449 ?auto_686453 ) ) ( not ( = ?auto_686449 ?auto_686454 ) ) ( not ( = ?auto_686449 ?auto_686455 ) ) ( not ( = ?auto_686449 ?auto_686456 ) ) ( not ( = ?auto_686449 ?auto_686457 ) ) ( not ( = ?auto_686449 ?auto_686458 ) ) ( not ( = ?auto_686449 ?auto_686459 ) ) ( not ( = ?auto_686449 ?auto_686460 ) ) ( not ( = ?auto_686449 ?auto_686461 ) ) ( not ( = ?auto_686449 ?auto_686462 ) ) ( not ( = ?auto_686449 ?auto_686463 ) ) ( not ( = ?auto_686449 ?auto_686464 ) ) ( not ( = ?auto_686449 ?auto_686465 ) ) ( not ( = ?auto_686450 ?auto_686451 ) ) ( not ( = ?auto_686450 ?auto_686452 ) ) ( not ( = ?auto_686450 ?auto_686453 ) ) ( not ( = ?auto_686450 ?auto_686454 ) ) ( not ( = ?auto_686450 ?auto_686455 ) ) ( not ( = ?auto_686450 ?auto_686456 ) ) ( not ( = ?auto_686450 ?auto_686457 ) ) ( not ( = ?auto_686450 ?auto_686458 ) ) ( not ( = ?auto_686450 ?auto_686459 ) ) ( not ( = ?auto_686450 ?auto_686460 ) ) ( not ( = ?auto_686450 ?auto_686461 ) ) ( not ( = ?auto_686450 ?auto_686462 ) ) ( not ( = ?auto_686450 ?auto_686463 ) ) ( not ( = ?auto_686450 ?auto_686464 ) ) ( not ( = ?auto_686450 ?auto_686465 ) ) ( not ( = ?auto_686451 ?auto_686452 ) ) ( not ( = ?auto_686451 ?auto_686453 ) ) ( not ( = ?auto_686451 ?auto_686454 ) ) ( not ( = ?auto_686451 ?auto_686455 ) ) ( not ( = ?auto_686451 ?auto_686456 ) ) ( not ( = ?auto_686451 ?auto_686457 ) ) ( not ( = ?auto_686451 ?auto_686458 ) ) ( not ( = ?auto_686451 ?auto_686459 ) ) ( not ( = ?auto_686451 ?auto_686460 ) ) ( not ( = ?auto_686451 ?auto_686461 ) ) ( not ( = ?auto_686451 ?auto_686462 ) ) ( not ( = ?auto_686451 ?auto_686463 ) ) ( not ( = ?auto_686451 ?auto_686464 ) ) ( not ( = ?auto_686451 ?auto_686465 ) ) ( not ( = ?auto_686452 ?auto_686453 ) ) ( not ( = ?auto_686452 ?auto_686454 ) ) ( not ( = ?auto_686452 ?auto_686455 ) ) ( not ( = ?auto_686452 ?auto_686456 ) ) ( not ( = ?auto_686452 ?auto_686457 ) ) ( not ( = ?auto_686452 ?auto_686458 ) ) ( not ( = ?auto_686452 ?auto_686459 ) ) ( not ( = ?auto_686452 ?auto_686460 ) ) ( not ( = ?auto_686452 ?auto_686461 ) ) ( not ( = ?auto_686452 ?auto_686462 ) ) ( not ( = ?auto_686452 ?auto_686463 ) ) ( not ( = ?auto_686452 ?auto_686464 ) ) ( not ( = ?auto_686452 ?auto_686465 ) ) ( not ( = ?auto_686453 ?auto_686454 ) ) ( not ( = ?auto_686453 ?auto_686455 ) ) ( not ( = ?auto_686453 ?auto_686456 ) ) ( not ( = ?auto_686453 ?auto_686457 ) ) ( not ( = ?auto_686453 ?auto_686458 ) ) ( not ( = ?auto_686453 ?auto_686459 ) ) ( not ( = ?auto_686453 ?auto_686460 ) ) ( not ( = ?auto_686453 ?auto_686461 ) ) ( not ( = ?auto_686453 ?auto_686462 ) ) ( not ( = ?auto_686453 ?auto_686463 ) ) ( not ( = ?auto_686453 ?auto_686464 ) ) ( not ( = ?auto_686453 ?auto_686465 ) ) ( not ( = ?auto_686454 ?auto_686455 ) ) ( not ( = ?auto_686454 ?auto_686456 ) ) ( not ( = ?auto_686454 ?auto_686457 ) ) ( not ( = ?auto_686454 ?auto_686458 ) ) ( not ( = ?auto_686454 ?auto_686459 ) ) ( not ( = ?auto_686454 ?auto_686460 ) ) ( not ( = ?auto_686454 ?auto_686461 ) ) ( not ( = ?auto_686454 ?auto_686462 ) ) ( not ( = ?auto_686454 ?auto_686463 ) ) ( not ( = ?auto_686454 ?auto_686464 ) ) ( not ( = ?auto_686454 ?auto_686465 ) ) ( not ( = ?auto_686455 ?auto_686456 ) ) ( not ( = ?auto_686455 ?auto_686457 ) ) ( not ( = ?auto_686455 ?auto_686458 ) ) ( not ( = ?auto_686455 ?auto_686459 ) ) ( not ( = ?auto_686455 ?auto_686460 ) ) ( not ( = ?auto_686455 ?auto_686461 ) ) ( not ( = ?auto_686455 ?auto_686462 ) ) ( not ( = ?auto_686455 ?auto_686463 ) ) ( not ( = ?auto_686455 ?auto_686464 ) ) ( not ( = ?auto_686455 ?auto_686465 ) ) ( not ( = ?auto_686456 ?auto_686457 ) ) ( not ( = ?auto_686456 ?auto_686458 ) ) ( not ( = ?auto_686456 ?auto_686459 ) ) ( not ( = ?auto_686456 ?auto_686460 ) ) ( not ( = ?auto_686456 ?auto_686461 ) ) ( not ( = ?auto_686456 ?auto_686462 ) ) ( not ( = ?auto_686456 ?auto_686463 ) ) ( not ( = ?auto_686456 ?auto_686464 ) ) ( not ( = ?auto_686456 ?auto_686465 ) ) ( not ( = ?auto_686457 ?auto_686458 ) ) ( not ( = ?auto_686457 ?auto_686459 ) ) ( not ( = ?auto_686457 ?auto_686460 ) ) ( not ( = ?auto_686457 ?auto_686461 ) ) ( not ( = ?auto_686457 ?auto_686462 ) ) ( not ( = ?auto_686457 ?auto_686463 ) ) ( not ( = ?auto_686457 ?auto_686464 ) ) ( not ( = ?auto_686457 ?auto_686465 ) ) ( not ( = ?auto_686458 ?auto_686459 ) ) ( not ( = ?auto_686458 ?auto_686460 ) ) ( not ( = ?auto_686458 ?auto_686461 ) ) ( not ( = ?auto_686458 ?auto_686462 ) ) ( not ( = ?auto_686458 ?auto_686463 ) ) ( not ( = ?auto_686458 ?auto_686464 ) ) ( not ( = ?auto_686458 ?auto_686465 ) ) ( not ( = ?auto_686459 ?auto_686460 ) ) ( not ( = ?auto_686459 ?auto_686461 ) ) ( not ( = ?auto_686459 ?auto_686462 ) ) ( not ( = ?auto_686459 ?auto_686463 ) ) ( not ( = ?auto_686459 ?auto_686464 ) ) ( not ( = ?auto_686459 ?auto_686465 ) ) ( not ( = ?auto_686460 ?auto_686461 ) ) ( not ( = ?auto_686460 ?auto_686462 ) ) ( not ( = ?auto_686460 ?auto_686463 ) ) ( not ( = ?auto_686460 ?auto_686464 ) ) ( not ( = ?auto_686460 ?auto_686465 ) ) ( not ( = ?auto_686461 ?auto_686462 ) ) ( not ( = ?auto_686461 ?auto_686463 ) ) ( not ( = ?auto_686461 ?auto_686464 ) ) ( not ( = ?auto_686461 ?auto_686465 ) ) ( not ( = ?auto_686462 ?auto_686463 ) ) ( not ( = ?auto_686462 ?auto_686464 ) ) ( not ( = ?auto_686462 ?auto_686465 ) ) ( not ( = ?auto_686463 ?auto_686464 ) ) ( not ( = ?auto_686463 ?auto_686465 ) ) ( not ( = ?auto_686464 ?auto_686465 ) ) ( ON ?auto_686463 ?auto_686464 ) ( ON ?auto_686462 ?auto_686463 ) ( CLEAR ?auto_686460 ) ( ON ?auto_686461 ?auto_686462 ) ( CLEAR ?auto_686461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_686448 ?auto_686449 ?auto_686450 ?auto_686451 ?auto_686452 ?auto_686453 ?auto_686454 ?auto_686455 ?auto_686456 ?auto_686457 ?auto_686458 ?auto_686459 ?auto_686460 ?auto_686461 )
      ( MAKE-17PILE ?auto_686448 ?auto_686449 ?auto_686450 ?auto_686451 ?auto_686452 ?auto_686453 ?auto_686454 ?auto_686455 ?auto_686456 ?auto_686457 ?auto_686458 ?auto_686459 ?auto_686460 ?auto_686461 ?auto_686462 ?auto_686463 ?auto_686464 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_686483 - BLOCK
      ?auto_686484 - BLOCK
      ?auto_686485 - BLOCK
      ?auto_686486 - BLOCK
      ?auto_686487 - BLOCK
      ?auto_686488 - BLOCK
      ?auto_686489 - BLOCK
      ?auto_686490 - BLOCK
      ?auto_686491 - BLOCK
      ?auto_686492 - BLOCK
      ?auto_686493 - BLOCK
      ?auto_686494 - BLOCK
      ?auto_686495 - BLOCK
      ?auto_686496 - BLOCK
      ?auto_686497 - BLOCK
      ?auto_686498 - BLOCK
      ?auto_686499 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_686499 ) ( ON-TABLE ?auto_686483 ) ( ON ?auto_686484 ?auto_686483 ) ( ON ?auto_686485 ?auto_686484 ) ( ON ?auto_686486 ?auto_686485 ) ( ON ?auto_686487 ?auto_686486 ) ( ON ?auto_686488 ?auto_686487 ) ( ON ?auto_686489 ?auto_686488 ) ( ON ?auto_686490 ?auto_686489 ) ( ON ?auto_686491 ?auto_686490 ) ( ON ?auto_686492 ?auto_686491 ) ( ON ?auto_686493 ?auto_686492 ) ( ON ?auto_686494 ?auto_686493 ) ( ON ?auto_686495 ?auto_686494 ) ( not ( = ?auto_686483 ?auto_686484 ) ) ( not ( = ?auto_686483 ?auto_686485 ) ) ( not ( = ?auto_686483 ?auto_686486 ) ) ( not ( = ?auto_686483 ?auto_686487 ) ) ( not ( = ?auto_686483 ?auto_686488 ) ) ( not ( = ?auto_686483 ?auto_686489 ) ) ( not ( = ?auto_686483 ?auto_686490 ) ) ( not ( = ?auto_686483 ?auto_686491 ) ) ( not ( = ?auto_686483 ?auto_686492 ) ) ( not ( = ?auto_686483 ?auto_686493 ) ) ( not ( = ?auto_686483 ?auto_686494 ) ) ( not ( = ?auto_686483 ?auto_686495 ) ) ( not ( = ?auto_686483 ?auto_686496 ) ) ( not ( = ?auto_686483 ?auto_686497 ) ) ( not ( = ?auto_686483 ?auto_686498 ) ) ( not ( = ?auto_686483 ?auto_686499 ) ) ( not ( = ?auto_686484 ?auto_686485 ) ) ( not ( = ?auto_686484 ?auto_686486 ) ) ( not ( = ?auto_686484 ?auto_686487 ) ) ( not ( = ?auto_686484 ?auto_686488 ) ) ( not ( = ?auto_686484 ?auto_686489 ) ) ( not ( = ?auto_686484 ?auto_686490 ) ) ( not ( = ?auto_686484 ?auto_686491 ) ) ( not ( = ?auto_686484 ?auto_686492 ) ) ( not ( = ?auto_686484 ?auto_686493 ) ) ( not ( = ?auto_686484 ?auto_686494 ) ) ( not ( = ?auto_686484 ?auto_686495 ) ) ( not ( = ?auto_686484 ?auto_686496 ) ) ( not ( = ?auto_686484 ?auto_686497 ) ) ( not ( = ?auto_686484 ?auto_686498 ) ) ( not ( = ?auto_686484 ?auto_686499 ) ) ( not ( = ?auto_686485 ?auto_686486 ) ) ( not ( = ?auto_686485 ?auto_686487 ) ) ( not ( = ?auto_686485 ?auto_686488 ) ) ( not ( = ?auto_686485 ?auto_686489 ) ) ( not ( = ?auto_686485 ?auto_686490 ) ) ( not ( = ?auto_686485 ?auto_686491 ) ) ( not ( = ?auto_686485 ?auto_686492 ) ) ( not ( = ?auto_686485 ?auto_686493 ) ) ( not ( = ?auto_686485 ?auto_686494 ) ) ( not ( = ?auto_686485 ?auto_686495 ) ) ( not ( = ?auto_686485 ?auto_686496 ) ) ( not ( = ?auto_686485 ?auto_686497 ) ) ( not ( = ?auto_686485 ?auto_686498 ) ) ( not ( = ?auto_686485 ?auto_686499 ) ) ( not ( = ?auto_686486 ?auto_686487 ) ) ( not ( = ?auto_686486 ?auto_686488 ) ) ( not ( = ?auto_686486 ?auto_686489 ) ) ( not ( = ?auto_686486 ?auto_686490 ) ) ( not ( = ?auto_686486 ?auto_686491 ) ) ( not ( = ?auto_686486 ?auto_686492 ) ) ( not ( = ?auto_686486 ?auto_686493 ) ) ( not ( = ?auto_686486 ?auto_686494 ) ) ( not ( = ?auto_686486 ?auto_686495 ) ) ( not ( = ?auto_686486 ?auto_686496 ) ) ( not ( = ?auto_686486 ?auto_686497 ) ) ( not ( = ?auto_686486 ?auto_686498 ) ) ( not ( = ?auto_686486 ?auto_686499 ) ) ( not ( = ?auto_686487 ?auto_686488 ) ) ( not ( = ?auto_686487 ?auto_686489 ) ) ( not ( = ?auto_686487 ?auto_686490 ) ) ( not ( = ?auto_686487 ?auto_686491 ) ) ( not ( = ?auto_686487 ?auto_686492 ) ) ( not ( = ?auto_686487 ?auto_686493 ) ) ( not ( = ?auto_686487 ?auto_686494 ) ) ( not ( = ?auto_686487 ?auto_686495 ) ) ( not ( = ?auto_686487 ?auto_686496 ) ) ( not ( = ?auto_686487 ?auto_686497 ) ) ( not ( = ?auto_686487 ?auto_686498 ) ) ( not ( = ?auto_686487 ?auto_686499 ) ) ( not ( = ?auto_686488 ?auto_686489 ) ) ( not ( = ?auto_686488 ?auto_686490 ) ) ( not ( = ?auto_686488 ?auto_686491 ) ) ( not ( = ?auto_686488 ?auto_686492 ) ) ( not ( = ?auto_686488 ?auto_686493 ) ) ( not ( = ?auto_686488 ?auto_686494 ) ) ( not ( = ?auto_686488 ?auto_686495 ) ) ( not ( = ?auto_686488 ?auto_686496 ) ) ( not ( = ?auto_686488 ?auto_686497 ) ) ( not ( = ?auto_686488 ?auto_686498 ) ) ( not ( = ?auto_686488 ?auto_686499 ) ) ( not ( = ?auto_686489 ?auto_686490 ) ) ( not ( = ?auto_686489 ?auto_686491 ) ) ( not ( = ?auto_686489 ?auto_686492 ) ) ( not ( = ?auto_686489 ?auto_686493 ) ) ( not ( = ?auto_686489 ?auto_686494 ) ) ( not ( = ?auto_686489 ?auto_686495 ) ) ( not ( = ?auto_686489 ?auto_686496 ) ) ( not ( = ?auto_686489 ?auto_686497 ) ) ( not ( = ?auto_686489 ?auto_686498 ) ) ( not ( = ?auto_686489 ?auto_686499 ) ) ( not ( = ?auto_686490 ?auto_686491 ) ) ( not ( = ?auto_686490 ?auto_686492 ) ) ( not ( = ?auto_686490 ?auto_686493 ) ) ( not ( = ?auto_686490 ?auto_686494 ) ) ( not ( = ?auto_686490 ?auto_686495 ) ) ( not ( = ?auto_686490 ?auto_686496 ) ) ( not ( = ?auto_686490 ?auto_686497 ) ) ( not ( = ?auto_686490 ?auto_686498 ) ) ( not ( = ?auto_686490 ?auto_686499 ) ) ( not ( = ?auto_686491 ?auto_686492 ) ) ( not ( = ?auto_686491 ?auto_686493 ) ) ( not ( = ?auto_686491 ?auto_686494 ) ) ( not ( = ?auto_686491 ?auto_686495 ) ) ( not ( = ?auto_686491 ?auto_686496 ) ) ( not ( = ?auto_686491 ?auto_686497 ) ) ( not ( = ?auto_686491 ?auto_686498 ) ) ( not ( = ?auto_686491 ?auto_686499 ) ) ( not ( = ?auto_686492 ?auto_686493 ) ) ( not ( = ?auto_686492 ?auto_686494 ) ) ( not ( = ?auto_686492 ?auto_686495 ) ) ( not ( = ?auto_686492 ?auto_686496 ) ) ( not ( = ?auto_686492 ?auto_686497 ) ) ( not ( = ?auto_686492 ?auto_686498 ) ) ( not ( = ?auto_686492 ?auto_686499 ) ) ( not ( = ?auto_686493 ?auto_686494 ) ) ( not ( = ?auto_686493 ?auto_686495 ) ) ( not ( = ?auto_686493 ?auto_686496 ) ) ( not ( = ?auto_686493 ?auto_686497 ) ) ( not ( = ?auto_686493 ?auto_686498 ) ) ( not ( = ?auto_686493 ?auto_686499 ) ) ( not ( = ?auto_686494 ?auto_686495 ) ) ( not ( = ?auto_686494 ?auto_686496 ) ) ( not ( = ?auto_686494 ?auto_686497 ) ) ( not ( = ?auto_686494 ?auto_686498 ) ) ( not ( = ?auto_686494 ?auto_686499 ) ) ( not ( = ?auto_686495 ?auto_686496 ) ) ( not ( = ?auto_686495 ?auto_686497 ) ) ( not ( = ?auto_686495 ?auto_686498 ) ) ( not ( = ?auto_686495 ?auto_686499 ) ) ( not ( = ?auto_686496 ?auto_686497 ) ) ( not ( = ?auto_686496 ?auto_686498 ) ) ( not ( = ?auto_686496 ?auto_686499 ) ) ( not ( = ?auto_686497 ?auto_686498 ) ) ( not ( = ?auto_686497 ?auto_686499 ) ) ( not ( = ?auto_686498 ?auto_686499 ) ) ( ON ?auto_686498 ?auto_686499 ) ( ON ?auto_686497 ?auto_686498 ) ( CLEAR ?auto_686495 ) ( ON ?auto_686496 ?auto_686497 ) ( CLEAR ?auto_686496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_686483 ?auto_686484 ?auto_686485 ?auto_686486 ?auto_686487 ?auto_686488 ?auto_686489 ?auto_686490 ?auto_686491 ?auto_686492 ?auto_686493 ?auto_686494 ?auto_686495 ?auto_686496 )
      ( MAKE-17PILE ?auto_686483 ?auto_686484 ?auto_686485 ?auto_686486 ?auto_686487 ?auto_686488 ?auto_686489 ?auto_686490 ?auto_686491 ?auto_686492 ?auto_686493 ?auto_686494 ?auto_686495 ?auto_686496 ?auto_686497 ?auto_686498 ?auto_686499 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_686517 - BLOCK
      ?auto_686518 - BLOCK
      ?auto_686519 - BLOCK
      ?auto_686520 - BLOCK
      ?auto_686521 - BLOCK
      ?auto_686522 - BLOCK
      ?auto_686523 - BLOCK
      ?auto_686524 - BLOCK
      ?auto_686525 - BLOCK
      ?auto_686526 - BLOCK
      ?auto_686527 - BLOCK
      ?auto_686528 - BLOCK
      ?auto_686529 - BLOCK
      ?auto_686530 - BLOCK
      ?auto_686531 - BLOCK
      ?auto_686532 - BLOCK
      ?auto_686533 - BLOCK
    )
    :vars
    (
      ?auto_686534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_686533 ?auto_686534 ) ( ON-TABLE ?auto_686517 ) ( ON ?auto_686518 ?auto_686517 ) ( ON ?auto_686519 ?auto_686518 ) ( ON ?auto_686520 ?auto_686519 ) ( ON ?auto_686521 ?auto_686520 ) ( ON ?auto_686522 ?auto_686521 ) ( ON ?auto_686523 ?auto_686522 ) ( ON ?auto_686524 ?auto_686523 ) ( ON ?auto_686525 ?auto_686524 ) ( ON ?auto_686526 ?auto_686525 ) ( ON ?auto_686527 ?auto_686526 ) ( ON ?auto_686528 ?auto_686527 ) ( not ( = ?auto_686517 ?auto_686518 ) ) ( not ( = ?auto_686517 ?auto_686519 ) ) ( not ( = ?auto_686517 ?auto_686520 ) ) ( not ( = ?auto_686517 ?auto_686521 ) ) ( not ( = ?auto_686517 ?auto_686522 ) ) ( not ( = ?auto_686517 ?auto_686523 ) ) ( not ( = ?auto_686517 ?auto_686524 ) ) ( not ( = ?auto_686517 ?auto_686525 ) ) ( not ( = ?auto_686517 ?auto_686526 ) ) ( not ( = ?auto_686517 ?auto_686527 ) ) ( not ( = ?auto_686517 ?auto_686528 ) ) ( not ( = ?auto_686517 ?auto_686529 ) ) ( not ( = ?auto_686517 ?auto_686530 ) ) ( not ( = ?auto_686517 ?auto_686531 ) ) ( not ( = ?auto_686517 ?auto_686532 ) ) ( not ( = ?auto_686517 ?auto_686533 ) ) ( not ( = ?auto_686517 ?auto_686534 ) ) ( not ( = ?auto_686518 ?auto_686519 ) ) ( not ( = ?auto_686518 ?auto_686520 ) ) ( not ( = ?auto_686518 ?auto_686521 ) ) ( not ( = ?auto_686518 ?auto_686522 ) ) ( not ( = ?auto_686518 ?auto_686523 ) ) ( not ( = ?auto_686518 ?auto_686524 ) ) ( not ( = ?auto_686518 ?auto_686525 ) ) ( not ( = ?auto_686518 ?auto_686526 ) ) ( not ( = ?auto_686518 ?auto_686527 ) ) ( not ( = ?auto_686518 ?auto_686528 ) ) ( not ( = ?auto_686518 ?auto_686529 ) ) ( not ( = ?auto_686518 ?auto_686530 ) ) ( not ( = ?auto_686518 ?auto_686531 ) ) ( not ( = ?auto_686518 ?auto_686532 ) ) ( not ( = ?auto_686518 ?auto_686533 ) ) ( not ( = ?auto_686518 ?auto_686534 ) ) ( not ( = ?auto_686519 ?auto_686520 ) ) ( not ( = ?auto_686519 ?auto_686521 ) ) ( not ( = ?auto_686519 ?auto_686522 ) ) ( not ( = ?auto_686519 ?auto_686523 ) ) ( not ( = ?auto_686519 ?auto_686524 ) ) ( not ( = ?auto_686519 ?auto_686525 ) ) ( not ( = ?auto_686519 ?auto_686526 ) ) ( not ( = ?auto_686519 ?auto_686527 ) ) ( not ( = ?auto_686519 ?auto_686528 ) ) ( not ( = ?auto_686519 ?auto_686529 ) ) ( not ( = ?auto_686519 ?auto_686530 ) ) ( not ( = ?auto_686519 ?auto_686531 ) ) ( not ( = ?auto_686519 ?auto_686532 ) ) ( not ( = ?auto_686519 ?auto_686533 ) ) ( not ( = ?auto_686519 ?auto_686534 ) ) ( not ( = ?auto_686520 ?auto_686521 ) ) ( not ( = ?auto_686520 ?auto_686522 ) ) ( not ( = ?auto_686520 ?auto_686523 ) ) ( not ( = ?auto_686520 ?auto_686524 ) ) ( not ( = ?auto_686520 ?auto_686525 ) ) ( not ( = ?auto_686520 ?auto_686526 ) ) ( not ( = ?auto_686520 ?auto_686527 ) ) ( not ( = ?auto_686520 ?auto_686528 ) ) ( not ( = ?auto_686520 ?auto_686529 ) ) ( not ( = ?auto_686520 ?auto_686530 ) ) ( not ( = ?auto_686520 ?auto_686531 ) ) ( not ( = ?auto_686520 ?auto_686532 ) ) ( not ( = ?auto_686520 ?auto_686533 ) ) ( not ( = ?auto_686520 ?auto_686534 ) ) ( not ( = ?auto_686521 ?auto_686522 ) ) ( not ( = ?auto_686521 ?auto_686523 ) ) ( not ( = ?auto_686521 ?auto_686524 ) ) ( not ( = ?auto_686521 ?auto_686525 ) ) ( not ( = ?auto_686521 ?auto_686526 ) ) ( not ( = ?auto_686521 ?auto_686527 ) ) ( not ( = ?auto_686521 ?auto_686528 ) ) ( not ( = ?auto_686521 ?auto_686529 ) ) ( not ( = ?auto_686521 ?auto_686530 ) ) ( not ( = ?auto_686521 ?auto_686531 ) ) ( not ( = ?auto_686521 ?auto_686532 ) ) ( not ( = ?auto_686521 ?auto_686533 ) ) ( not ( = ?auto_686521 ?auto_686534 ) ) ( not ( = ?auto_686522 ?auto_686523 ) ) ( not ( = ?auto_686522 ?auto_686524 ) ) ( not ( = ?auto_686522 ?auto_686525 ) ) ( not ( = ?auto_686522 ?auto_686526 ) ) ( not ( = ?auto_686522 ?auto_686527 ) ) ( not ( = ?auto_686522 ?auto_686528 ) ) ( not ( = ?auto_686522 ?auto_686529 ) ) ( not ( = ?auto_686522 ?auto_686530 ) ) ( not ( = ?auto_686522 ?auto_686531 ) ) ( not ( = ?auto_686522 ?auto_686532 ) ) ( not ( = ?auto_686522 ?auto_686533 ) ) ( not ( = ?auto_686522 ?auto_686534 ) ) ( not ( = ?auto_686523 ?auto_686524 ) ) ( not ( = ?auto_686523 ?auto_686525 ) ) ( not ( = ?auto_686523 ?auto_686526 ) ) ( not ( = ?auto_686523 ?auto_686527 ) ) ( not ( = ?auto_686523 ?auto_686528 ) ) ( not ( = ?auto_686523 ?auto_686529 ) ) ( not ( = ?auto_686523 ?auto_686530 ) ) ( not ( = ?auto_686523 ?auto_686531 ) ) ( not ( = ?auto_686523 ?auto_686532 ) ) ( not ( = ?auto_686523 ?auto_686533 ) ) ( not ( = ?auto_686523 ?auto_686534 ) ) ( not ( = ?auto_686524 ?auto_686525 ) ) ( not ( = ?auto_686524 ?auto_686526 ) ) ( not ( = ?auto_686524 ?auto_686527 ) ) ( not ( = ?auto_686524 ?auto_686528 ) ) ( not ( = ?auto_686524 ?auto_686529 ) ) ( not ( = ?auto_686524 ?auto_686530 ) ) ( not ( = ?auto_686524 ?auto_686531 ) ) ( not ( = ?auto_686524 ?auto_686532 ) ) ( not ( = ?auto_686524 ?auto_686533 ) ) ( not ( = ?auto_686524 ?auto_686534 ) ) ( not ( = ?auto_686525 ?auto_686526 ) ) ( not ( = ?auto_686525 ?auto_686527 ) ) ( not ( = ?auto_686525 ?auto_686528 ) ) ( not ( = ?auto_686525 ?auto_686529 ) ) ( not ( = ?auto_686525 ?auto_686530 ) ) ( not ( = ?auto_686525 ?auto_686531 ) ) ( not ( = ?auto_686525 ?auto_686532 ) ) ( not ( = ?auto_686525 ?auto_686533 ) ) ( not ( = ?auto_686525 ?auto_686534 ) ) ( not ( = ?auto_686526 ?auto_686527 ) ) ( not ( = ?auto_686526 ?auto_686528 ) ) ( not ( = ?auto_686526 ?auto_686529 ) ) ( not ( = ?auto_686526 ?auto_686530 ) ) ( not ( = ?auto_686526 ?auto_686531 ) ) ( not ( = ?auto_686526 ?auto_686532 ) ) ( not ( = ?auto_686526 ?auto_686533 ) ) ( not ( = ?auto_686526 ?auto_686534 ) ) ( not ( = ?auto_686527 ?auto_686528 ) ) ( not ( = ?auto_686527 ?auto_686529 ) ) ( not ( = ?auto_686527 ?auto_686530 ) ) ( not ( = ?auto_686527 ?auto_686531 ) ) ( not ( = ?auto_686527 ?auto_686532 ) ) ( not ( = ?auto_686527 ?auto_686533 ) ) ( not ( = ?auto_686527 ?auto_686534 ) ) ( not ( = ?auto_686528 ?auto_686529 ) ) ( not ( = ?auto_686528 ?auto_686530 ) ) ( not ( = ?auto_686528 ?auto_686531 ) ) ( not ( = ?auto_686528 ?auto_686532 ) ) ( not ( = ?auto_686528 ?auto_686533 ) ) ( not ( = ?auto_686528 ?auto_686534 ) ) ( not ( = ?auto_686529 ?auto_686530 ) ) ( not ( = ?auto_686529 ?auto_686531 ) ) ( not ( = ?auto_686529 ?auto_686532 ) ) ( not ( = ?auto_686529 ?auto_686533 ) ) ( not ( = ?auto_686529 ?auto_686534 ) ) ( not ( = ?auto_686530 ?auto_686531 ) ) ( not ( = ?auto_686530 ?auto_686532 ) ) ( not ( = ?auto_686530 ?auto_686533 ) ) ( not ( = ?auto_686530 ?auto_686534 ) ) ( not ( = ?auto_686531 ?auto_686532 ) ) ( not ( = ?auto_686531 ?auto_686533 ) ) ( not ( = ?auto_686531 ?auto_686534 ) ) ( not ( = ?auto_686532 ?auto_686533 ) ) ( not ( = ?auto_686532 ?auto_686534 ) ) ( not ( = ?auto_686533 ?auto_686534 ) ) ( ON ?auto_686532 ?auto_686533 ) ( ON ?auto_686531 ?auto_686532 ) ( ON ?auto_686530 ?auto_686531 ) ( CLEAR ?auto_686528 ) ( ON ?auto_686529 ?auto_686530 ) ( CLEAR ?auto_686529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_686517 ?auto_686518 ?auto_686519 ?auto_686520 ?auto_686521 ?auto_686522 ?auto_686523 ?auto_686524 ?auto_686525 ?auto_686526 ?auto_686527 ?auto_686528 ?auto_686529 )
      ( MAKE-17PILE ?auto_686517 ?auto_686518 ?auto_686519 ?auto_686520 ?auto_686521 ?auto_686522 ?auto_686523 ?auto_686524 ?auto_686525 ?auto_686526 ?auto_686527 ?auto_686528 ?auto_686529 ?auto_686530 ?auto_686531 ?auto_686532 ?auto_686533 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_686552 - BLOCK
      ?auto_686553 - BLOCK
      ?auto_686554 - BLOCK
      ?auto_686555 - BLOCK
      ?auto_686556 - BLOCK
      ?auto_686557 - BLOCK
      ?auto_686558 - BLOCK
      ?auto_686559 - BLOCK
      ?auto_686560 - BLOCK
      ?auto_686561 - BLOCK
      ?auto_686562 - BLOCK
      ?auto_686563 - BLOCK
      ?auto_686564 - BLOCK
      ?auto_686565 - BLOCK
      ?auto_686566 - BLOCK
      ?auto_686567 - BLOCK
      ?auto_686568 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_686568 ) ( ON-TABLE ?auto_686552 ) ( ON ?auto_686553 ?auto_686552 ) ( ON ?auto_686554 ?auto_686553 ) ( ON ?auto_686555 ?auto_686554 ) ( ON ?auto_686556 ?auto_686555 ) ( ON ?auto_686557 ?auto_686556 ) ( ON ?auto_686558 ?auto_686557 ) ( ON ?auto_686559 ?auto_686558 ) ( ON ?auto_686560 ?auto_686559 ) ( ON ?auto_686561 ?auto_686560 ) ( ON ?auto_686562 ?auto_686561 ) ( ON ?auto_686563 ?auto_686562 ) ( not ( = ?auto_686552 ?auto_686553 ) ) ( not ( = ?auto_686552 ?auto_686554 ) ) ( not ( = ?auto_686552 ?auto_686555 ) ) ( not ( = ?auto_686552 ?auto_686556 ) ) ( not ( = ?auto_686552 ?auto_686557 ) ) ( not ( = ?auto_686552 ?auto_686558 ) ) ( not ( = ?auto_686552 ?auto_686559 ) ) ( not ( = ?auto_686552 ?auto_686560 ) ) ( not ( = ?auto_686552 ?auto_686561 ) ) ( not ( = ?auto_686552 ?auto_686562 ) ) ( not ( = ?auto_686552 ?auto_686563 ) ) ( not ( = ?auto_686552 ?auto_686564 ) ) ( not ( = ?auto_686552 ?auto_686565 ) ) ( not ( = ?auto_686552 ?auto_686566 ) ) ( not ( = ?auto_686552 ?auto_686567 ) ) ( not ( = ?auto_686552 ?auto_686568 ) ) ( not ( = ?auto_686553 ?auto_686554 ) ) ( not ( = ?auto_686553 ?auto_686555 ) ) ( not ( = ?auto_686553 ?auto_686556 ) ) ( not ( = ?auto_686553 ?auto_686557 ) ) ( not ( = ?auto_686553 ?auto_686558 ) ) ( not ( = ?auto_686553 ?auto_686559 ) ) ( not ( = ?auto_686553 ?auto_686560 ) ) ( not ( = ?auto_686553 ?auto_686561 ) ) ( not ( = ?auto_686553 ?auto_686562 ) ) ( not ( = ?auto_686553 ?auto_686563 ) ) ( not ( = ?auto_686553 ?auto_686564 ) ) ( not ( = ?auto_686553 ?auto_686565 ) ) ( not ( = ?auto_686553 ?auto_686566 ) ) ( not ( = ?auto_686553 ?auto_686567 ) ) ( not ( = ?auto_686553 ?auto_686568 ) ) ( not ( = ?auto_686554 ?auto_686555 ) ) ( not ( = ?auto_686554 ?auto_686556 ) ) ( not ( = ?auto_686554 ?auto_686557 ) ) ( not ( = ?auto_686554 ?auto_686558 ) ) ( not ( = ?auto_686554 ?auto_686559 ) ) ( not ( = ?auto_686554 ?auto_686560 ) ) ( not ( = ?auto_686554 ?auto_686561 ) ) ( not ( = ?auto_686554 ?auto_686562 ) ) ( not ( = ?auto_686554 ?auto_686563 ) ) ( not ( = ?auto_686554 ?auto_686564 ) ) ( not ( = ?auto_686554 ?auto_686565 ) ) ( not ( = ?auto_686554 ?auto_686566 ) ) ( not ( = ?auto_686554 ?auto_686567 ) ) ( not ( = ?auto_686554 ?auto_686568 ) ) ( not ( = ?auto_686555 ?auto_686556 ) ) ( not ( = ?auto_686555 ?auto_686557 ) ) ( not ( = ?auto_686555 ?auto_686558 ) ) ( not ( = ?auto_686555 ?auto_686559 ) ) ( not ( = ?auto_686555 ?auto_686560 ) ) ( not ( = ?auto_686555 ?auto_686561 ) ) ( not ( = ?auto_686555 ?auto_686562 ) ) ( not ( = ?auto_686555 ?auto_686563 ) ) ( not ( = ?auto_686555 ?auto_686564 ) ) ( not ( = ?auto_686555 ?auto_686565 ) ) ( not ( = ?auto_686555 ?auto_686566 ) ) ( not ( = ?auto_686555 ?auto_686567 ) ) ( not ( = ?auto_686555 ?auto_686568 ) ) ( not ( = ?auto_686556 ?auto_686557 ) ) ( not ( = ?auto_686556 ?auto_686558 ) ) ( not ( = ?auto_686556 ?auto_686559 ) ) ( not ( = ?auto_686556 ?auto_686560 ) ) ( not ( = ?auto_686556 ?auto_686561 ) ) ( not ( = ?auto_686556 ?auto_686562 ) ) ( not ( = ?auto_686556 ?auto_686563 ) ) ( not ( = ?auto_686556 ?auto_686564 ) ) ( not ( = ?auto_686556 ?auto_686565 ) ) ( not ( = ?auto_686556 ?auto_686566 ) ) ( not ( = ?auto_686556 ?auto_686567 ) ) ( not ( = ?auto_686556 ?auto_686568 ) ) ( not ( = ?auto_686557 ?auto_686558 ) ) ( not ( = ?auto_686557 ?auto_686559 ) ) ( not ( = ?auto_686557 ?auto_686560 ) ) ( not ( = ?auto_686557 ?auto_686561 ) ) ( not ( = ?auto_686557 ?auto_686562 ) ) ( not ( = ?auto_686557 ?auto_686563 ) ) ( not ( = ?auto_686557 ?auto_686564 ) ) ( not ( = ?auto_686557 ?auto_686565 ) ) ( not ( = ?auto_686557 ?auto_686566 ) ) ( not ( = ?auto_686557 ?auto_686567 ) ) ( not ( = ?auto_686557 ?auto_686568 ) ) ( not ( = ?auto_686558 ?auto_686559 ) ) ( not ( = ?auto_686558 ?auto_686560 ) ) ( not ( = ?auto_686558 ?auto_686561 ) ) ( not ( = ?auto_686558 ?auto_686562 ) ) ( not ( = ?auto_686558 ?auto_686563 ) ) ( not ( = ?auto_686558 ?auto_686564 ) ) ( not ( = ?auto_686558 ?auto_686565 ) ) ( not ( = ?auto_686558 ?auto_686566 ) ) ( not ( = ?auto_686558 ?auto_686567 ) ) ( not ( = ?auto_686558 ?auto_686568 ) ) ( not ( = ?auto_686559 ?auto_686560 ) ) ( not ( = ?auto_686559 ?auto_686561 ) ) ( not ( = ?auto_686559 ?auto_686562 ) ) ( not ( = ?auto_686559 ?auto_686563 ) ) ( not ( = ?auto_686559 ?auto_686564 ) ) ( not ( = ?auto_686559 ?auto_686565 ) ) ( not ( = ?auto_686559 ?auto_686566 ) ) ( not ( = ?auto_686559 ?auto_686567 ) ) ( not ( = ?auto_686559 ?auto_686568 ) ) ( not ( = ?auto_686560 ?auto_686561 ) ) ( not ( = ?auto_686560 ?auto_686562 ) ) ( not ( = ?auto_686560 ?auto_686563 ) ) ( not ( = ?auto_686560 ?auto_686564 ) ) ( not ( = ?auto_686560 ?auto_686565 ) ) ( not ( = ?auto_686560 ?auto_686566 ) ) ( not ( = ?auto_686560 ?auto_686567 ) ) ( not ( = ?auto_686560 ?auto_686568 ) ) ( not ( = ?auto_686561 ?auto_686562 ) ) ( not ( = ?auto_686561 ?auto_686563 ) ) ( not ( = ?auto_686561 ?auto_686564 ) ) ( not ( = ?auto_686561 ?auto_686565 ) ) ( not ( = ?auto_686561 ?auto_686566 ) ) ( not ( = ?auto_686561 ?auto_686567 ) ) ( not ( = ?auto_686561 ?auto_686568 ) ) ( not ( = ?auto_686562 ?auto_686563 ) ) ( not ( = ?auto_686562 ?auto_686564 ) ) ( not ( = ?auto_686562 ?auto_686565 ) ) ( not ( = ?auto_686562 ?auto_686566 ) ) ( not ( = ?auto_686562 ?auto_686567 ) ) ( not ( = ?auto_686562 ?auto_686568 ) ) ( not ( = ?auto_686563 ?auto_686564 ) ) ( not ( = ?auto_686563 ?auto_686565 ) ) ( not ( = ?auto_686563 ?auto_686566 ) ) ( not ( = ?auto_686563 ?auto_686567 ) ) ( not ( = ?auto_686563 ?auto_686568 ) ) ( not ( = ?auto_686564 ?auto_686565 ) ) ( not ( = ?auto_686564 ?auto_686566 ) ) ( not ( = ?auto_686564 ?auto_686567 ) ) ( not ( = ?auto_686564 ?auto_686568 ) ) ( not ( = ?auto_686565 ?auto_686566 ) ) ( not ( = ?auto_686565 ?auto_686567 ) ) ( not ( = ?auto_686565 ?auto_686568 ) ) ( not ( = ?auto_686566 ?auto_686567 ) ) ( not ( = ?auto_686566 ?auto_686568 ) ) ( not ( = ?auto_686567 ?auto_686568 ) ) ( ON ?auto_686567 ?auto_686568 ) ( ON ?auto_686566 ?auto_686567 ) ( ON ?auto_686565 ?auto_686566 ) ( CLEAR ?auto_686563 ) ( ON ?auto_686564 ?auto_686565 ) ( CLEAR ?auto_686564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_686552 ?auto_686553 ?auto_686554 ?auto_686555 ?auto_686556 ?auto_686557 ?auto_686558 ?auto_686559 ?auto_686560 ?auto_686561 ?auto_686562 ?auto_686563 ?auto_686564 )
      ( MAKE-17PILE ?auto_686552 ?auto_686553 ?auto_686554 ?auto_686555 ?auto_686556 ?auto_686557 ?auto_686558 ?auto_686559 ?auto_686560 ?auto_686561 ?auto_686562 ?auto_686563 ?auto_686564 ?auto_686565 ?auto_686566 ?auto_686567 ?auto_686568 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_686586 - BLOCK
      ?auto_686587 - BLOCK
      ?auto_686588 - BLOCK
      ?auto_686589 - BLOCK
      ?auto_686590 - BLOCK
      ?auto_686591 - BLOCK
      ?auto_686592 - BLOCK
      ?auto_686593 - BLOCK
      ?auto_686594 - BLOCK
      ?auto_686595 - BLOCK
      ?auto_686596 - BLOCK
      ?auto_686597 - BLOCK
      ?auto_686598 - BLOCK
      ?auto_686599 - BLOCK
      ?auto_686600 - BLOCK
      ?auto_686601 - BLOCK
      ?auto_686602 - BLOCK
    )
    :vars
    (
      ?auto_686603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_686602 ?auto_686603 ) ( ON-TABLE ?auto_686586 ) ( ON ?auto_686587 ?auto_686586 ) ( ON ?auto_686588 ?auto_686587 ) ( ON ?auto_686589 ?auto_686588 ) ( ON ?auto_686590 ?auto_686589 ) ( ON ?auto_686591 ?auto_686590 ) ( ON ?auto_686592 ?auto_686591 ) ( ON ?auto_686593 ?auto_686592 ) ( ON ?auto_686594 ?auto_686593 ) ( ON ?auto_686595 ?auto_686594 ) ( ON ?auto_686596 ?auto_686595 ) ( not ( = ?auto_686586 ?auto_686587 ) ) ( not ( = ?auto_686586 ?auto_686588 ) ) ( not ( = ?auto_686586 ?auto_686589 ) ) ( not ( = ?auto_686586 ?auto_686590 ) ) ( not ( = ?auto_686586 ?auto_686591 ) ) ( not ( = ?auto_686586 ?auto_686592 ) ) ( not ( = ?auto_686586 ?auto_686593 ) ) ( not ( = ?auto_686586 ?auto_686594 ) ) ( not ( = ?auto_686586 ?auto_686595 ) ) ( not ( = ?auto_686586 ?auto_686596 ) ) ( not ( = ?auto_686586 ?auto_686597 ) ) ( not ( = ?auto_686586 ?auto_686598 ) ) ( not ( = ?auto_686586 ?auto_686599 ) ) ( not ( = ?auto_686586 ?auto_686600 ) ) ( not ( = ?auto_686586 ?auto_686601 ) ) ( not ( = ?auto_686586 ?auto_686602 ) ) ( not ( = ?auto_686586 ?auto_686603 ) ) ( not ( = ?auto_686587 ?auto_686588 ) ) ( not ( = ?auto_686587 ?auto_686589 ) ) ( not ( = ?auto_686587 ?auto_686590 ) ) ( not ( = ?auto_686587 ?auto_686591 ) ) ( not ( = ?auto_686587 ?auto_686592 ) ) ( not ( = ?auto_686587 ?auto_686593 ) ) ( not ( = ?auto_686587 ?auto_686594 ) ) ( not ( = ?auto_686587 ?auto_686595 ) ) ( not ( = ?auto_686587 ?auto_686596 ) ) ( not ( = ?auto_686587 ?auto_686597 ) ) ( not ( = ?auto_686587 ?auto_686598 ) ) ( not ( = ?auto_686587 ?auto_686599 ) ) ( not ( = ?auto_686587 ?auto_686600 ) ) ( not ( = ?auto_686587 ?auto_686601 ) ) ( not ( = ?auto_686587 ?auto_686602 ) ) ( not ( = ?auto_686587 ?auto_686603 ) ) ( not ( = ?auto_686588 ?auto_686589 ) ) ( not ( = ?auto_686588 ?auto_686590 ) ) ( not ( = ?auto_686588 ?auto_686591 ) ) ( not ( = ?auto_686588 ?auto_686592 ) ) ( not ( = ?auto_686588 ?auto_686593 ) ) ( not ( = ?auto_686588 ?auto_686594 ) ) ( not ( = ?auto_686588 ?auto_686595 ) ) ( not ( = ?auto_686588 ?auto_686596 ) ) ( not ( = ?auto_686588 ?auto_686597 ) ) ( not ( = ?auto_686588 ?auto_686598 ) ) ( not ( = ?auto_686588 ?auto_686599 ) ) ( not ( = ?auto_686588 ?auto_686600 ) ) ( not ( = ?auto_686588 ?auto_686601 ) ) ( not ( = ?auto_686588 ?auto_686602 ) ) ( not ( = ?auto_686588 ?auto_686603 ) ) ( not ( = ?auto_686589 ?auto_686590 ) ) ( not ( = ?auto_686589 ?auto_686591 ) ) ( not ( = ?auto_686589 ?auto_686592 ) ) ( not ( = ?auto_686589 ?auto_686593 ) ) ( not ( = ?auto_686589 ?auto_686594 ) ) ( not ( = ?auto_686589 ?auto_686595 ) ) ( not ( = ?auto_686589 ?auto_686596 ) ) ( not ( = ?auto_686589 ?auto_686597 ) ) ( not ( = ?auto_686589 ?auto_686598 ) ) ( not ( = ?auto_686589 ?auto_686599 ) ) ( not ( = ?auto_686589 ?auto_686600 ) ) ( not ( = ?auto_686589 ?auto_686601 ) ) ( not ( = ?auto_686589 ?auto_686602 ) ) ( not ( = ?auto_686589 ?auto_686603 ) ) ( not ( = ?auto_686590 ?auto_686591 ) ) ( not ( = ?auto_686590 ?auto_686592 ) ) ( not ( = ?auto_686590 ?auto_686593 ) ) ( not ( = ?auto_686590 ?auto_686594 ) ) ( not ( = ?auto_686590 ?auto_686595 ) ) ( not ( = ?auto_686590 ?auto_686596 ) ) ( not ( = ?auto_686590 ?auto_686597 ) ) ( not ( = ?auto_686590 ?auto_686598 ) ) ( not ( = ?auto_686590 ?auto_686599 ) ) ( not ( = ?auto_686590 ?auto_686600 ) ) ( not ( = ?auto_686590 ?auto_686601 ) ) ( not ( = ?auto_686590 ?auto_686602 ) ) ( not ( = ?auto_686590 ?auto_686603 ) ) ( not ( = ?auto_686591 ?auto_686592 ) ) ( not ( = ?auto_686591 ?auto_686593 ) ) ( not ( = ?auto_686591 ?auto_686594 ) ) ( not ( = ?auto_686591 ?auto_686595 ) ) ( not ( = ?auto_686591 ?auto_686596 ) ) ( not ( = ?auto_686591 ?auto_686597 ) ) ( not ( = ?auto_686591 ?auto_686598 ) ) ( not ( = ?auto_686591 ?auto_686599 ) ) ( not ( = ?auto_686591 ?auto_686600 ) ) ( not ( = ?auto_686591 ?auto_686601 ) ) ( not ( = ?auto_686591 ?auto_686602 ) ) ( not ( = ?auto_686591 ?auto_686603 ) ) ( not ( = ?auto_686592 ?auto_686593 ) ) ( not ( = ?auto_686592 ?auto_686594 ) ) ( not ( = ?auto_686592 ?auto_686595 ) ) ( not ( = ?auto_686592 ?auto_686596 ) ) ( not ( = ?auto_686592 ?auto_686597 ) ) ( not ( = ?auto_686592 ?auto_686598 ) ) ( not ( = ?auto_686592 ?auto_686599 ) ) ( not ( = ?auto_686592 ?auto_686600 ) ) ( not ( = ?auto_686592 ?auto_686601 ) ) ( not ( = ?auto_686592 ?auto_686602 ) ) ( not ( = ?auto_686592 ?auto_686603 ) ) ( not ( = ?auto_686593 ?auto_686594 ) ) ( not ( = ?auto_686593 ?auto_686595 ) ) ( not ( = ?auto_686593 ?auto_686596 ) ) ( not ( = ?auto_686593 ?auto_686597 ) ) ( not ( = ?auto_686593 ?auto_686598 ) ) ( not ( = ?auto_686593 ?auto_686599 ) ) ( not ( = ?auto_686593 ?auto_686600 ) ) ( not ( = ?auto_686593 ?auto_686601 ) ) ( not ( = ?auto_686593 ?auto_686602 ) ) ( not ( = ?auto_686593 ?auto_686603 ) ) ( not ( = ?auto_686594 ?auto_686595 ) ) ( not ( = ?auto_686594 ?auto_686596 ) ) ( not ( = ?auto_686594 ?auto_686597 ) ) ( not ( = ?auto_686594 ?auto_686598 ) ) ( not ( = ?auto_686594 ?auto_686599 ) ) ( not ( = ?auto_686594 ?auto_686600 ) ) ( not ( = ?auto_686594 ?auto_686601 ) ) ( not ( = ?auto_686594 ?auto_686602 ) ) ( not ( = ?auto_686594 ?auto_686603 ) ) ( not ( = ?auto_686595 ?auto_686596 ) ) ( not ( = ?auto_686595 ?auto_686597 ) ) ( not ( = ?auto_686595 ?auto_686598 ) ) ( not ( = ?auto_686595 ?auto_686599 ) ) ( not ( = ?auto_686595 ?auto_686600 ) ) ( not ( = ?auto_686595 ?auto_686601 ) ) ( not ( = ?auto_686595 ?auto_686602 ) ) ( not ( = ?auto_686595 ?auto_686603 ) ) ( not ( = ?auto_686596 ?auto_686597 ) ) ( not ( = ?auto_686596 ?auto_686598 ) ) ( not ( = ?auto_686596 ?auto_686599 ) ) ( not ( = ?auto_686596 ?auto_686600 ) ) ( not ( = ?auto_686596 ?auto_686601 ) ) ( not ( = ?auto_686596 ?auto_686602 ) ) ( not ( = ?auto_686596 ?auto_686603 ) ) ( not ( = ?auto_686597 ?auto_686598 ) ) ( not ( = ?auto_686597 ?auto_686599 ) ) ( not ( = ?auto_686597 ?auto_686600 ) ) ( not ( = ?auto_686597 ?auto_686601 ) ) ( not ( = ?auto_686597 ?auto_686602 ) ) ( not ( = ?auto_686597 ?auto_686603 ) ) ( not ( = ?auto_686598 ?auto_686599 ) ) ( not ( = ?auto_686598 ?auto_686600 ) ) ( not ( = ?auto_686598 ?auto_686601 ) ) ( not ( = ?auto_686598 ?auto_686602 ) ) ( not ( = ?auto_686598 ?auto_686603 ) ) ( not ( = ?auto_686599 ?auto_686600 ) ) ( not ( = ?auto_686599 ?auto_686601 ) ) ( not ( = ?auto_686599 ?auto_686602 ) ) ( not ( = ?auto_686599 ?auto_686603 ) ) ( not ( = ?auto_686600 ?auto_686601 ) ) ( not ( = ?auto_686600 ?auto_686602 ) ) ( not ( = ?auto_686600 ?auto_686603 ) ) ( not ( = ?auto_686601 ?auto_686602 ) ) ( not ( = ?auto_686601 ?auto_686603 ) ) ( not ( = ?auto_686602 ?auto_686603 ) ) ( ON ?auto_686601 ?auto_686602 ) ( ON ?auto_686600 ?auto_686601 ) ( ON ?auto_686599 ?auto_686600 ) ( ON ?auto_686598 ?auto_686599 ) ( CLEAR ?auto_686596 ) ( ON ?auto_686597 ?auto_686598 ) ( CLEAR ?auto_686597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_686586 ?auto_686587 ?auto_686588 ?auto_686589 ?auto_686590 ?auto_686591 ?auto_686592 ?auto_686593 ?auto_686594 ?auto_686595 ?auto_686596 ?auto_686597 )
      ( MAKE-17PILE ?auto_686586 ?auto_686587 ?auto_686588 ?auto_686589 ?auto_686590 ?auto_686591 ?auto_686592 ?auto_686593 ?auto_686594 ?auto_686595 ?auto_686596 ?auto_686597 ?auto_686598 ?auto_686599 ?auto_686600 ?auto_686601 ?auto_686602 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_686621 - BLOCK
      ?auto_686622 - BLOCK
      ?auto_686623 - BLOCK
      ?auto_686624 - BLOCK
      ?auto_686625 - BLOCK
      ?auto_686626 - BLOCK
      ?auto_686627 - BLOCK
      ?auto_686628 - BLOCK
      ?auto_686629 - BLOCK
      ?auto_686630 - BLOCK
      ?auto_686631 - BLOCK
      ?auto_686632 - BLOCK
      ?auto_686633 - BLOCK
      ?auto_686634 - BLOCK
      ?auto_686635 - BLOCK
      ?auto_686636 - BLOCK
      ?auto_686637 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_686637 ) ( ON-TABLE ?auto_686621 ) ( ON ?auto_686622 ?auto_686621 ) ( ON ?auto_686623 ?auto_686622 ) ( ON ?auto_686624 ?auto_686623 ) ( ON ?auto_686625 ?auto_686624 ) ( ON ?auto_686626 ?auto_686625 ) ( ON ?auto_686627 ?auto_686626 ) ( ON ?auto_686628 ?auto_686627 ) ( ON ?auto_686629 ?auto_686628 ) ( ON ?auto_686630 ?auto_686629 ) ( ON ?auto_686631 ?auto_686630 ) ( not ( = ?auto_686621 ?auto_686622 ) ) ( not ( = ?auto_686621 ?auto_686623 ) ) ( not ( = ?auto_686621 ?auto_686624 ) ) ( not ( = ?auto_686621 ?auto_686625 ) ) ( not ( = ?auto_686621 ?auto_686626 ) ) ( not ( = ?auto_686621 ?auto_686627 ) ) ( not ( = ?auto_686621 ?auto_686628 ) ) ( not ( = ?auto_686621 ?auto_686629 ) ) ( not ( = ?auto_686621 ?auto_686630 ) ) ( not ( = ?auto_686621 ?auto_686631 ) ) ( not ( = ?auto_686621 ?auto_686632 ) ) ( not ( = ?auto_686621 ?auto_686633 ) ) ( not ( = ?auto_686621 ?auto_686634 ) ) ( not ( = ?auto_686621 ?auto_686635 ) ) ( not ( = ?auto_686621 ?auto_686636 ) ) ( not ( = ?auto_686621 ?auto_686637 ) ) ( not ( = ?auto_686622 ?auto_686623 ) ) ( not ( = ?auto_686622 ?auto_686624 ) ) ( not ( = ?auto_686622 ?auto_686625 ) ) ( not ( = ?auto_686622 ?auto_686626 ) ) ( not ( = ?auto_686622 ?auto_686627 ) ) ( not ( = ?auto_686622 ?auto_686628 ) ) ( not ( = ?auto_686622 ?auto_686629 ) ) ( not ( = ?auto_686622 ?auto_686630 ) ) ( not ( = ?auto_686622 ?auto_686631 ) ) ( not ( = ?auto_686622 ?auto_686632 ) ) ( not ( = ?auto_686622 ?auto_686633 ) ) ( not ( = ?auto_686622 ?auto_686634 ) ) ( not ( = ?auto_686622 ?auto_686635 ) ) ( not ( = ?auto_686622 ?auto_686636 ) ) ( not ( = ?auto_686622 ?auto_686637 ) ) ( not ( = ?auto_686623 ?auto_686624 ) ) ( not ( = ?auto_686623 ?auto_686625 ) ) ( not ( = ?auto_686623 ?auto_686626 ) ) ( not ( = ?auto_686623 ?auto_686627 ) ) ( not ( = ?auto_686623 ?auto_686628 ) ) ( not ( = ?auto_686623 ?auto_686629 ) ) ( not ( = ?auto_686623 ?auto_686630 ) ) ( not ( = ?auto_686623 ?auto_686631 ) ) ( not ( = ?auto_686623 ?auto_686632 ) ) ( not ( = ?auto_686623 ?auto_686633 ) ) ( not ( = ?auto_686623 ?auto_686634 ) ) ( not ( = ?auto_686623 ?auto_686635 ) ) ( not ( = ?auto_686623 ?auto_686636 ) ) ( not ( = ?auto_686623 ?auto_686637 ) ) ( not ( = ?auto_686624 ?auto_686625 ) ) ( not ( = ?auto_686624 ?auto_686626 ) ) ( not ( = ?auto_686624 ?auto_686627 ) ) ( not ( = ?auto_686624 ?auto_686628 ) ) ( not ( = ?auto_686624 ?auto_686629 ) ) ( not ( = ?auto_686624 ?auto_686630 ) ) ( not ( = ?auto_686624 ?auto_686631 ) ) ( not ( = ?auto_686624 ?auto_686632 ) ) ( not ( = ?auto_686624 ?auto_686633 ) ) ( not ( = ?auto_686624 ?auto_686634 ) ) ( not ( = ?auto_686624 ?auto_686635 ) ) ( not ( = ?auto_686624 ?auto_686636 ) ) ( not ( = ?auto_686624 ?auto_686637 ) ) ( not ( = ?auto_686625 ?auto_686626 ) ) ( not ( = ?auto_686625 ?auto_686627 ) ) ( not ( = ?auto_686625 ?auto_686628 ) ) ( not ( = ?auto_686625 ?auto_686629 ) ) ( not ( = ?auto_686625 ?auto_686630 ) ) ( not ( = ?auto_686625 ?auto_686631 ) ) ( not ( = ?auto_686625 ?auto_686632 ) ) ( not ( = ?auto_686625 ?auto_686633 ) ) ( not ( = ?auto_686625 ?auto_686634 ) ) ( not ( = ?auto_686625 ?auto_686635 ) ) ( not ( = ?auto_686625 ?auto_686636 ) ) ( not ( = ?auto_686625 ?auto_686637 ) ) ( not ( = ?auto_686626 ?auto_686627 ) ) ( not ( = ?auto_686626 ?auto_686628 ) ) ( not ( = ?auto_686626 ?auto_686629 ) ) ( not ( = ?auto_686626 ?auto_686630 ) ) ( not ( = ?auto_686626 ?auto_686631 ) ) ( not ( = ?auto_686626 ?auto_686632 ) ) ( not ( = ?auto_686626 ?auto_686633 ) ) ( not ( = ?auto_686626 ?auto_686634 ) ) ( not ( = ?auto_686626 ?auto_686635 ) ) ( not ( = ?auto_686626 ?auto_686636 ) ) ( not ( = ?auto_686626 ?auto_686637 ) ) ( not ( = ?auto_686627 ?auto_686628 ) ) ( not ( = ?auto_686627 ?auto_686629 ) ) ( not ( = ?auto_686627 ?auto_686630 ) ) ( not ( = ?auto_686627 ?auto_686631 ) ) ( not ( = ?auto_686627 ?auto_686632 ) ) ( not ( = ?auto_686627 ?auto_686633 ) ) ( not ( = ?auto_686627 ?auto_686634 ) ) ( not ( = ?auto_686627 ?auto_686635 ) ) ( not ( = ?auto_686627 ?auto_686636 ) ) ( not ( = ?auto_686627 ?auto_686637 ) ) ( not ( = ?auto_686628 ?auto_686629 ) ) ( not ( = ?auto_686628 ?auto_686630 ) ) ( not ( = ?auto_686628 ?auto_686631 ) ) ( not ( = ?auto_686628 ?auto_686632 ) ) ( not ( = ?auto_686628 ?auto_686633 ) ) ( not ( = ?auto_686628 ?auto_686634 ) ) ( not ( = ?auto_686628 ?auto_686635 ) ) ( not ( = ?auto_686628 ?auto_686636 ) ) ( not ( = ?auto_686628 ?auto_686637 ) ) ( not ( = ?auto_686629 ?auto_686630 ) ) ( not ( = ?auto_686629 ?auto_686631 ) ) ( not ( = ?auto_686629 ?auto_686632 ) ) ( not ( = ?auto_686629 ?auto_686633 ) ) ( not ( = ?auto_686629 ?auto_686634 ) ) ( not ( = ?auto_686629 ?auto_686635 ) ) ( not ( = ?auto_686629 ?auto_686636 ) ) ( not ( = ?auto_686629 ?auto_686637 ) ) ( not ( = ?auto_686630 ?auto_686631 ) ) ( not ( = ?auto_686630 ?auto_686632 ) ) ( not ( = ?auto_686630 ?auto_686633 ) ) ( not ( = ?auto_686630 ?auto_686634 ) ) ( not ( = ?auto_686630 ?auto_686635 ) ) ( not ( = ?auto_686630 ?auto_686636 ) ) ( not ( = ?auto_686630 ?auto_686637 ) ) ( not ( = ?auto_686631 ?auto_686632 ) ) ( not ( = ?auto_686631 ?auto_686633 ) ) ( not ( = ?auto_686631 ?auto_686634 ) ) ( not ( = ?auto_686631 ?auto_686635 ) ) ( not ( = ?auto_686631 ?auto_686636 ) ) ( not ( = ?auto_686631 ?auto_686637 ) ) ( not ( = ?auto_686632 ?auto_686633 ) ) ( not ( = ?auto_686632 ?auto_686634 ) ) ( not ( = ?auto_686632 ?auto_686635 ) ) ( not ( = ?auto_686632 ?auto_686636 ) ) ( not ( = ?auto_686632 ?auto_686637 ) ) ( not ( = ?auto_686633 ?auto_686634 ) ) ( not ( = ?auto_686633 ?auto_686635 ) ) ( not ( = ?auto_686633 ?auto_686636 ) ) ( not ( = ?auto_686633 ?auto_686637 ) ) ( not ( = ?auto_686634 ?auto_686635 ) ) ( not ( = ?auto_686634 ?auto_686636 ) ) ( not ( = ?auto_686634 ?auto_686637 ) ) ( not ( = ?auto_686635 ?auto_686636 ) ) ( not ( = ?auto_686635 ?auto_686637 ) ) ( not ( = ?auto_686636 ?auto_686637 ) ) ( ON ?auto_686636 ?auto_686637 ) ( ON ?auto_686635 ?auto_686636 ) ( ON ?auto_686634 ?auto_686635 ) ( ON ?auto_686633 ?auto_686634 ) ( CLEAR ?auto_686631 ) ( ON ?auto_686632 ?auto_686633 ) ( CLEAR ?auto_686632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_686621 ?auto_686622 ?auto_686623 ?auto_686624 ?auto_686625 ?auto_686626 ?auto_686627 ?auto_686628 ?auto_686629 ?auto_686630 ?auto_686631 ?auto_686632 )
      ( MAKE-17PILE ?auto_686621 ?auto_686622 ?auto_686623 ?auto_686624 ?auto_686625 ?auto_686626 ?auto_686627 ?auto_686628 ?auto_686629 ?auto_686630 ?auto_686631 ?auto_686632 ?auto_686633 ?auto_686634 ?auto_686635 ?auto_686636 ?auto_686637 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_686655 - BLOCK
      ?auto_686656 - BLOCK
      ?auto_686657 - BLOCK
      ?auto_686658 - BLOCK
      ?auto_686659 - BLOCK
      ?auto_686660 - BLOCK
      ?auto_686661 - BLOCK
      ?auto_686662 - BLOCK
      ?auto_686663 - BLOCK
      ?auto_686664 - BLOCK
      ?auto_686665 - BLOCK
      ?auto_686666 - BLOCK
      ?auto_686667 - BLOCK
      ?auto_686668 - BLOCK
      ?auto_686669 - BLOCK
      ?auto_686670 - BLOCK
      ?auto_686671 - BLOCK
    )
    :vars
    (
      ?auto_686672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_686671 ?auto_686672 ) ( ON-TABLE ?auto_686655 ) ( ON ?auto_686656 ?auto_686655 ) ( ON ?auto_686657 ?auto_686656 ) ( ON ?auto_686658 ?auto_686657 ) ( ON ?auto_686659 ?auto_686658 ) ( ON ?auto_686660 ?auto_686659 ) ( ON ?auto_686661 ?auto_686660 ) ( ON ?auto_686662 ?auto_686661 ) ( ON ?auto_686663 ?auto_686662 ) ( ON ?auto_686664 ?auto_686663 ) ( not ( = ?auto_686655 ?auto_686656 ) ) ( not ( = ?auto_686655 ?auto_686657 ) ) ( not ( = ?auto_686655 ?auto_686658 ) ) ( not ( = ?auto_686655 ?auto_686659 ) ) ( not ( = ?auto_686655 ?auto_686660 ) ) ( not ( = ?auto_686655 ?auto_686661 ) ) ( not ( = ?auto_686655 ?auto_686662 ) ) ( not ( = ?auto_686655 ?auto_686663 ) ) ( not ( = ?auto_686655 ?auto_686664 ) ) ( not ( = ?auto_686655 ?auto_686665 ) ) ( not ( = ?auto_686655 ?auto_686666 ) ) ( not ( = ?auto_686655 ?auto_686667 ) ) ( not ( = ?auto_686655 ?auto_686668 ) ) ( not ( = ?auto_686655 ?auto_686669 ) ) ( not ( = ?auto_686655 ?auto_686670 ) ) ( not ( = ?auto_686655 ?auto_686671 ) ) ( not ( = ?auto_686655 ?auto_686672 ) ) ( not ( = ?auto_686656 ?auto_686657 ) ) ( not ( = ?auto_686656 ?auto_686658 ) ) ( not ( = ?auto_686656 ?auto_686659 ) ) ( not ( = ?auto_686656 ?auto_686660 ) ) ( not ( = ?auto_686656 ?auto_686661 ) ) ( not ( = ?auto_686656 ?auto_686662 ) ) ( not ( = ?auto_686656 ?auto_686663 ) ) ( not ( = ?auto_686656 ?auto_686664 ) ) ( not ( = ?auto_686656 ?auto_686665 ) ) ( not ( = ?auto_686656 ?auto_686666 ) ) ( not ( = ?auto_686656 ?auto_686667 ) ) ( not ( = ?auto_686656 ?auto_686668 ) ) ( not ( = ?auto_686656 ?auto_686669 ) ) ( not ( = ?auto_686656 ?auto_686670 ) ) ( not ( = ?auto_686656 ?auto_686671 ) ) ( not ( = ?auto_686656 ?auto_686672 ) ) ( not ( = ?auto_686657 ?auto_686658 ) ) ( not ( = ?auto_686657 ?auto_686659 ) ) ( not ( = ?auto_686657 ?auto_686660 ) ) ( not ( = ?auto_686657 ?auto_686661 ) ) ( not ( = ?auto_686657 ?auto_686662 ) ) ( not ( = ?auto_686657 ?auto_686663 ) ) ( not ( = ?auto_686657 ?auto_686664 ) ) ( not ( = ?auto_686657 ?auto_686665 ) ) ( not ( = ?auto_686657 ?auto_686666 ) ) ( not ( = ?auto_686657 ?auto_686667 ) ) ( not ( = ?auto_686657 ?auto_686668 ) ) ( not ( = ?auto_686657 ?auto_686669 ) ) ( not ( = ?auto_686657 ?auto_686670 ) ) ( not ( = ?auto_686657 ?auto_686671 ) ) ( not ( = ?auto_686657 ?auto_686672 ) ) ( not ( = ?auto_686658 ?auto_686659 ) ) ( not ( = ?auto_686658 ?auto_686660 ) ) ( not ( = ?auto_686658 ?auto_686661 ) ) ( not ( = ?auto_686658 ?auto_686662 ) ) ( not ( = ?auto_686658 ?auto_686663 ) ) ( not ( = ?auto_686658 ?auto_686664 ) ) ( not ( = ?auto_686658 ?auto_686665 ) ) ( not ( = ?auto_686658 ?auto_686666 ) ) ( not ( = ?auto_686658 ?auto_686667 ) ) ( not ( = ?auto_686658 ?auto_686668 ) ) ( not ( = ?auto_686658 ?auto_686669 ) ) ( not ( = ?auto_686658 ?auto_686670 ) ) ( not ( = ?auto_686658 ?auto_686671 ) ) ( not ( = ?auto_686658 ?auto_686672 ) ) ( not ( = ?auto_686659 ?auto_686660 ) ) ( not ( = ?auto_686659 ?auto_686661 ) ) ( not ( = ?auto_686659 ?auto_686662 ) ) ( not ( = ?auto_686659 ?auto_686663 ) ) ( not ( = ?auto_686659 ?auto_686664 ) ) ( not ( = ?auto_686659 ?auto_686665 ) ) ( not ( = ?auto_686659 ?auto_686666 ) ) ( not ( = ?auto_686659 ?auto_686667 ) ) ( not ( = ?auto_686659 ?auto_686668 ) ) ( not ( = ?auto_686659 ?auto_686669 ) ) ( not ( = ?auto_686659 ?auto_686670 ) ) ( not ( = ?auto_686659 ?auto_686671 ) ) ( not ( = ?auto_686659 ?auto_686672 ) ) ( not ( = ?auto_686660 ?auto_686661 ) ) ( not ( = ?auto_686660 ?auto_686662 ) ) ( not ( = ?auto_686660 ?auto_686663 ) ) ( not ( = ?auto_686660 ?auto_686664 ) ) ( not ( = ?auto_686660 ?auto_686665 ) ) ( not ( = ?auto_686660 ?auto_686666 ) ) ( not ( = ?auto_686660 ?auto_686667 ) ) ( not ( = ?auto_686660 ?auto_686668 ) ) ( not ( = ?auto_686660 ?auto_686669 ) ) ( not ( = ?auto_686660 ?auto_686670 ) ) ( not ( = ?auto_686660 ?auto_686671 ) ) ( not ( = ?auto_686660 ?auto_686672 ) ) ( not ( = ?auto_686661 ?auto_686662 ) ) ( not ( = ?auto_686661 ?auto_686663 ) ) ( not ( = ?auto_686661 ?auto_686664 ) ) ( not ( = ?auto_686661 ?auto_686665 ) ) ( not ( = ?auto_686661 ?auto_686666 ) ) ( not ( = ?auto_686661 ?auto_686667 ) ) ( not ( = ?auto_686661 ?auto_686668 ) ) ( not ( = ?auto_686661 ?auto_686669 ) ) ( not ( = ?auto_686661 ?auto_686670 ) ) ( not ( = ?auto_686661 ?auto_686671 ) ) ( not ( = ?auto_686661 ?auto_686672 ) ) ( not ( = ?auto_686662 ?auto_686663 ) ) ( not ( = ?auto_686662 ?auto_686664 ) ) ( not ( = ?auto_686662 ?auto_686665 ) ) ( not ( = ?auto_686662 ?auto_686666 ) ) ( not ( = ?auto_686662 ?auto_686667 ) ) ( not ( = ?auto_686662 ?auto_686668 ) ) ( not ( = ?auto_686662 ?auto_686669 ) ) ( not ( = ?auto_686662 ?auto_686670 ) ) ( not ( = ?auto_686662 ?auto_686671 ) ) ( not ( = ?auto_686662 ?auto_686672 ) ) ( not ( = ?auto_686663 ?auto_686664 ) ) ( not ( = ?auto_686663 ?auto_686665 ) ) ( not ( = ?auto_686663 ?auto_686666 ) ) ( not ( = ?auto_686663 ?auto_686667 ) ) ( not ( = ?auto_686663 ?auto_686668 ) ) ( not ( = ?auto_686663 ?auto_686669 ) ) ( not ( = ?auto_686663 ?auto_686670 ) ) ( not ( = ?auto_686663 ?auto_686671 ) ) ( not ( = ?auto_686663 ?auto_686672 ) ) ( not ( = ?auto_686664 ?auto_686665 ) ) ( not ( = ?auto_686664 ?auto_686666 ) ) ( not ( = ?auto_686664 ?auto_686667 ) ) ( not ( = ?auto_686664 ?auto_686668 ) ) ( not ( = ?auto_686664 ?auto_686669 ) ) ( not ( = ?auto_686664 ?auto_686670 ) ) ( not ( = ?auto_686664 ?auto_686671 ) ) ( not ( = ?auto_686664 ?auto_686672 ) ) ( not ( = ?auto_686665 ?auto_686666 ) ) ( not ( = ?auto_686665 ?auto_686667 ) ) ( not ( = ?auto_686665 ?auto_686668 ) ) ( not ( = ?auto_686665 ?auto_686669 ) ) ( not ( = ?auto_686665 ?auto_686670 ) ) ( not ( = ?auto_686665 ?auto_686671 ) ) ( not ( = ?auto_686665 ?auto_686672 ) ) ( not ( = ?auto_686666 ?auto_686667 ) ) ( not ( = ?auto_686666 ?auto_686668 ) ) ( not ( = ?auto_686666 ?auto_686669 ) ) ( not ( = ?auto_686666 ?auto_686670 ) ) ( not ( = ?auto_686666 ?auto_686671 ) ) ( not ( = ?auto_686666 ?auto_686672 ) ) ( not ( = ?auto_686667 ?auto_686668 ) ) ( not ( = ?auto_686667 ?auto_686669 ) ) ( not ( = ?auto_686667 ?auto_686670 ) ) ( not ( = ?auto_686667 ?auto_686671 ) ) ( not ( = ?auto_686667 ?auto_686672 ) ) ( not ( = ?auto_686668 ?auto_686669 ) ) ( not ( = ?auto_686668 ?auto_686670 ) ) ( not ( = ?auto_686668 ?auto_686671 ) ) ( not ( = ?auto_686668 ?auto_686672 ) ) ( not ( = ?auto_686669 ?auto_686670 ) ) ( not ( = ?auto_686669 ?auto_686671 ) ) ( not ( = ?auto_686669 ?auto_686672 ) ) ( not ( = ?auto_686670 ?auto_686671 ) ) ( not ( = ?auto_686670 ?auto_686672 ) ) ( not ( = ?auto_686671 ?auto_686672 ) ) ( ON ?auto_686670 ?auto_686671 ) ( ON ?auto_686669 ?auto_686670 ) ( ON ?auto_686668 ?auto_686669 ) ( ON ?auto_686667 ?auto_686668 ) ( ON ?auto_686666 ?auto_686667 ) ( CLEAR ?auto_686664 ) ( ON ?auto_686665 ?auto_686666 ) ( CLEAR ?auto_686665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_686655 ?auto_686656 ?auto_686657 ?auto_686658 ?auto_686659 ?auto_686660 ?auto_686661 ?auto_686662 ?auto_686663 ?auto_686664 ?auto_686665 )
      ( MAKE-17PILE ?auto_686655 ?auto_686656 ?auto_686657 ?auto_686658 ?auto_686659 ?auto_686660 ?auto_686661 ?auto_686662 ?auto_686663 ?auto_686664 ?auto_686665 ?auto_686666 ?auto_686667 ?auto_686668 ?auto_686669 ?auto_686670 ?auto_686671 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_686690 - BLOCK
      ?auto_686691 - BLOCK
      ?auto_686692 - BLOCK
      ?auto_686693 - BLOCK
      ?auto_686694 - BLOCK
      ?auto_686695 - BLOCK
      ?auto_686696 - BLOCK
      ?auto_686697 - BLOCK
      ?auto_686698 - BLOCK
      ?auto_686699 - BLOCK
      ?auto_686700 - BLOCK
      ?auto_686701 - BLOCK
      ?auto_686702 - BLOCK
      ?auto_686703 - BLOCK
      ?auto_686704 - BLOCK
      ?auto_686705 - BLOCK
      ?auto_686706 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_686706 ) ( ON-TABLE ?auto_686690 ) ( ON ?auto_686691 ?auto_686690 ) ( ON ?auto_686692 ?auto_686691 ) ( ON ?auto_686693 ?auto_686692 ) ( ON ?auto_686694 ?auto_686693 ) ( ON ?auto_686695 ?auto_686694 ) ( ON ?auto_686696 ?auto_686695 ) ( ON ?auto_686697 ?auto_686696 ) ( ON ?auto_686698 ?auto_686697 ) ( ON ?auto_686699 ?auto_686698 ) ( not ( = ?auto_686690 ?auto_686691 ) ) ( not ( = ?auto_686690 ?auto_686692 ) ) ( not ( = ?auto_686690 ?auto_686693 ) ) ( not ( = ?auto_686690 ?auto_686694 ) ) ( not ( = ?auto_686690 ?auto_686695 ) ) ( not ( = ?auto_686690 ?auto_686696 ) ) ( not ( = ?auto_686690 ?auto_686697 ) ) ( not ( = ?auto_686690 ?auto_686698 ) ) ( not ( = ?auto_686690 ?auto_686699 ) ) ( not ( = ?auto_686690 ?auto_686700 ) ) ( not ( = ?auto_686690 ?auto_686701 ) ) ( not ( = ?auto_686690 ?auto_686702 ) ) ( not ( = ?auto_686690 ?auto_686703 ) ) ( not ( = ?auto_686690 ?auto_686704 ) ) ( not ( = ?auto_686690 ?auto_686705 ) ) ( not ( = ?auto_686690 ?auto_686706 ) ) ( not ( = ?auto_686691 ?auto_686692 ) ) ( not ( = ?auto_686691 ?auto_686693 ) ) ( not ( = ?auto_686691 ?auto_686694 ) ) ( not ( = ?auto_686691 ?auto_686695 ) ) ( not ( = ?auto_686691 ?auto_686696 ) ) ( not ( = ?auto_686691 ?auto_686697 ) ) ( not ( = ?auto_686691 ?auto_686698 ) ) ( not ( = ?auto_686691 ?auto_686699 ) ) ( not ( = ?auto_686691 ?auto_686700 ) ) ( not ( = ?auto_686691 ?auto_686701 ) ) ( not ( = ?auto_686691 ?auto_686702 ) ) ( not ( = ?auto_686691 ?auto_686703 ) ) ( not ( = ?auto_686691 ?auto_686704 ) ) ( not ( = ?auto_686691 ?auto_686705 ) ) ( not ( = ?auto_686691 ?auto_686706 ) ) ( not ( = ?auto_686692 ?auto_686693 ) ) ( not ( = ?auto_686692 ?auto_686694 ) ) ( not ( = ?auto_686692 ?auto_686695 ) ) ( not ( = ?auto_686692 ?auto_686696 ) ) ( not ( = ?auto_686692 ?auto_686697 ) ) ( not ( = ?auto_686692 ?auto_686698 ) ) ( not ( = ?auto_686692 ?auto_686699 ) ) ( not ( = ?auto_686692 ?auto_686700 ) ) ( not ( = ?auto_686692 ?auto_686701 ) ) ( not ( = ?auto_686692 ?auto_686702 ) ) ( not ( = ?auto_686692 ?auto_686703 ) ) ( not ( = ?auto_686692 ?auto_686704 ) ) ( not ( = ?auto_686692 ?auto_686705 ) ) ( not ( = ?auto_686692 ?auto_686706 ) ) ( not ( = ?auto_686693 ?auto_686694 ) ) ( not ( = ?auto_686693 ?auto_686695 ) ) ( not ( = ?auto_686693 ?auto_686696 ) ) ( not ( = ?auto_686693 ?auto_686697 ) ) ( not ( = ?auto_686693 ?auto_686698 ) ) ( not ( = ?auto_686693 ?auto_686699 ) ) ( not ( = ?auto_686693 ?auto_686700 ) ) ( not ( = ?auto_686693 ?auto_686701 ) ) ( not ( = ?auto_686693 ?auto_686702 ) ) ( not ( = ?auto_686693 ?auto_686703 ) ) ( not ( = ?auto_686693 ?auto_686704 ) ) ( not ( = ?auto_686693 ?auto_686705 ) ) ( not ( = ?auto_686693 ?auto_686706 ) ) ( not ( = ?auto_686694 ?auto_686695 ) ) ( not ( = ?auto_686694 ?auto_686696 ) ) ( not ( = ?auto_686694 ?auto_686697 ) ) ( not ( = ?auto_686694 ?auto_686698 ) ) ( not ( = ?auto_686694 ?auto_686699 ) ) ( not ( = ?auto_686694 ?auto_686700 ) ) ( not ( = ?auto_686694 ?auto_686701 ) ) ( not ( = ?auto_686694 ?auto_686702 ) ) ( not ( = ?auto_686694 ?auto_686703 ) ) ( not ( = ?auto_686694 ?auto_686704 ) ) ( not ( = ?auto_686694 ?auto_686705 ) ) ( not ( = ?auto_686694 ?auto_686706 ) ) ( not ( = ?auto_686695 ?auto_686696 ) ) ( not ( = ?auto_686695 ?auto_686697 ) ) ( not ( = ?auto_686695 ?auto_686698 ) ) ( not ( = ?auto_686695 ?auto_686699 ) ) ( not ( = ?auto_686695 ?auto_686700 ) ) ( not ( = ?auto_686695 ?auto_686701 ) ) ( not ( = ?auto_686695 ?auto_686702 ) ) ( not ( = ?auto_686695 ?auto_686703 ) ) ( not ( = ?auto_686695 ?auto_686704 ) ) ( not ( = ?auto_686695 ?auto_686705 ) ) ( not ( = ?auto_686695 ?auto_686706 ) ) ( not ( = ?auto_686696 ?auto_686697 ) ) ( not ( = ?auto_686696 ?auto_686698 ) ) ( not ( = ?auto_686696 ?auto_686699 ) ) ( not ( = ?auto_686696 ?auto_686700 ) ) ( not ( = ?auto_686696 ?auto_686701 ) ) ( not ( = ?auto_686696 ?auto_686702 ) ) ( not ( = ?auto_686696 ?auto_686703 ) ) ( not ( = ?auto_686696 ?auto_686704 ) ) ( not ( = ?auto_686696 ?auto_686705 ) ) ( not ( = ?auto_686696 ?auto_686706 ) ) ( not ( = ?auto_686697 ?auto_686698 ) ) ( not ( = ?auto_686697 ?auto_686699 ) ) ( not ( = ?auto_686697 ?auto_686700 ) ) ( not ( = ?auto_686697 ?auto_686701 ) ) ( not ( = ?auto_686697 ?auto_686702 ) ) ( not ( = ?auto_686697 ?auto_686703 ) ) ( not ( = ?auto_686697 ?auto_686704 ) ) ( not ( = ?auto_686697 ?auto_686705 ) ) ( not ( = ?auto_686697 ?auto_686706 ) ) ( not ( = ?auto_686698 ?auto_686699 ) ) ( not ( = ?auto_686698 ?auto_686700 ) ) ( not ( = ?auto_686698 ?auto_686701 ) ) ( not ( = ?auto_686698 ?auto_686702 ) ) ( not ( = ?auto_686698 ?auto_686703 ) ) ( not ( = ?auto_686698 ?auto_686704 ) ) ( not ( = ?auto_686698 ?auto_686705 ) ) ( not ( = ?auto_686698 ?auto_686706 ) ) ( not ( = ?auto_686699 ?auto_686700 ) ) ( not ( = ?auto_686699 ?auto_686701 ) ) ( not ( = ?auto_686699 ?auto_686702 ) ) ( not ( = ?auto_686699 ?auto_686703 ) ) ( not ( = ?auto_686699 ?auto_686704 ) ) ( not ( = ?auto_686699 ?auto_686705 ) ) ( not ( = ?auto_686699 ?auto_686706 ) ) ( not ( = ?auto_686700 ?auto_686701 ) ) ( not ( = ?auto_686700 ?auto_686702 ) ) ( not ( = ?auto_686700 ?auto_686703 ) ) ( not ( = ?auto_686700 ?auto_686704 ) ) ( not ( = ?auto_686700 ?auto_686705 ) ) ( not ( = ?auto_686700 ?auto_686706 ) ) ( not ( = ?auto_686701 ?auto_686702 ) ) ( not ( = ?auto_686701 ?auto_686703 ) ) ( not ( = ?auto_686701 ?auto_686704 ) ) ( not ( = ?auto_686701 ?auto_686705 ) ) ( not ( = ?auto_686701 ?auto_686706 ) ) ( not ( = ?auto_686702 ?auto_686703 ) ) ( not ( = ?auto_686702 ?auto_686704 ) ) ( not ( = ?auto_686702 ?auto_686705 ) ) ( not ( = ?auto_686702 ?auto_686706 ) ) ( not ( = ?auto_686703 ?auto_686704 ) ) ( not ( = ?auto_686703 ?auto_686705 ) ) ( not ( = ?auto_686703 ?auto_686706 ) ) ( not ( = ?auto_686704 ?auto_686705 ) ) ( not ( = ?auto_686704 ?auto_686706 ) ) ( not ( = ?auto_686705 ?auto_686706 ) ) ( ON ?auto_686705 ?auto_686706 ) ( ON ?auto_686704 ?auto_686705 ) ( ON ?auto_686703 ?auto_686704 ) ( ON ?auto_686702 ?auto_686703 ) ( ON ?auto_686701 ?auto_686702 ) ( CLEAR ?auto_686699 ) ( ON ?auto_686700 ?auto_686701 ) ( CLEAR ?auto_686700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_686690 ?auto_686691 ?auto_686692 ?auto_686693 ?auto_686694 ?auto_686695 ?auto_686696 ?auto_686697 ?auto_686698 ?auto_686699 ?auto_686700 )
      ( MAKE-17PILE ?auto_686690 ?auto_686691 ?auto_686692 ?auto_686693 ?auto_686694 ?auto_686695 ?auto_686696 ?auto_686697 ?auto_686698 ?auto_686699 ?auto_686700 ?auto_686701 ?auto_686702 ?auto_686703 ?auto_686704 ?auto_686705 ?auto_686706 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_686724 - BLOCK
      ?auto_686725 - BLOCK
      ?auto_686726 - BLOCK
      ?auto_686727 - BLOCK
      ?auto_686728 - BLOCK
      ?auto_686729 - BLOCK
      ?auto_686730 - BLOCK
      ?auto_686731 - BLOCK
      ?auto_686732 - BLOCK
      ?auto_686733 - BLOCK
      ?auto_686734 - BLOCK
      ?auto_686735 - BLOCK
      ?auto_686736 - BLOCK
      ?auto_686737 - BLOCK
      ?auto_686738 - BLOCK
      ?auto_686739 - BLOCK
      ?auto_686740 - BLOCK
    )
    :vars
    (
      ?auto_686741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_686740 ?auto_686741 ) ( ON-TABLE ?auto_686724 ) ( ON ?auto_686725 ?auto_686724 ) ( ON ?auto_686726 ?auto_686725 ) ( ON ?auto_686727 ?auto_686726 ) ( ON ?auto_686728 ?auto_686727 ) ( ON ?auto_686729 ?auto_686728 ) ( ON ?auto_686730 ?auto_686729 ) ( ON ?auto_686731 ?auto_686730 ) ( ON ?auto_686732 ?auto_686731 ) ( not ( = ?auto_686724 ?auto_686725 ) ) ( not ( = ?auto_686724 ?auto_686726 ) ) ( not ( = ?auto_686724 ?auto_686727 ) ) ( not ( = ?auto_686724 ?auto_686728 ) ) ( not ( = ?auto_686724 ?auto_686729 ) ) ( not ( = ?auto_686724 ?auto_686730 ) ) ( not ( = ?auto_686724 ?auto_686731 ) ) ( not ( = ?auto_686724 ?auto_686732 ) ) ( not ( = ?auto_686724 ?auto_686733 ) ) ( not ( = ?auto_686724 ?auto_686734 ) ) ( not ( = ?auto_686724 ?auto_686735 ) ) ( not ( = ?auto_686724 ?auto_686736 ) ) ( not ( = ?auto_686724 ?auto_686737 ) ) ( not ( = ?auto_686724 ?auto_686738 ) ) ( not ( = ?auto_686724 ?auto_686739 ) ) ( not ( = ?auto_686724 ?auto_686740 ) ) ( not ( = ?auto_686724 ?auto_686741 ) ) ( not ( = ?auto_686725 ?auto_686726 ) ) ( not ( = ?auto_686725 ?auto_686727 ) ) ( not ( = ?auto_686725 ?auto_686728 ) ) ( not ( = ?auto_686725 ?auto_686729 ) ) ( not ( = ?auto_686725 ?auto_686730 ) ) ( not ( = ?auto_686725 ?auto_686731 ) ) ( not ( = ?auto_686725 ?auto_686732 ) ) ( not ( = ?auto_686725 ?auto_686733 ) ) ( not ( = ?auto_686725 ?auto_686734 ) ) ( not ( = ?auto_686725 ?auto_686735 ) ) ( not ( = ?auto_686725 ?auto_686736 ) ) ( not ( = ?auto_686725 ?auto_686737 ) ) ( not ( = ?auto_686725 ?auto_686738 ) ) ( not ( = ?auto_686725 ?auto_686739 ) ) ( not ( = ?auto_686725 ?auto_686740 ) ) ( not ( = ?auto_686725 ?auto_686741 ) ) ( not ( = ?auto_686726 ?auto_686727 ) ) ( not ( = ?auto_686726 ?auto_686728 ) ) ( not ( = ?auto_686726 ?auto_686729 ) ) ( not ( = ?auto_686726 ?auto_686730 ) ) ( not ( = ?auto_686726 ?auto_686731 ) ) ( not ( = ?auto_686726 ?auto_686732 ) ) ( not ( = ?auto_686726 ?auto_686733 ) ) ( not ( = ?auto_686726 ?auto_686734 ) ) ( not ( = ?auto_686726 ?auto_686735 ) ) ( not ( = ?auto_686726 ?auto_686736 ) ) ( not ( = ?auto_686726 ?auto_686737 ) ) ( not ( = ?auto_686726 ?auto_686738 ) ) ( not ( = ?auto_686726 ?auto_686739 ) ) ( not ( = ?auto_686726 ?auto_686740 ) ) ( not ( = ?auto_686726 ?auto_686741 ) ) ( not ( = ?auto_686727 ?auto_686728 ) ) ( not ( = ?auto_686727 ?auto_686729 ) ) ( not ( = ?auto_686727 ?auto_686730 ) ) ( not ( = ?auto_686727 ?auto_686731 ) ) ( not ( = ?auto_686727 ?auto_686732 ) ) ( not ( = ?auto_686727 ?auto_686733 ) ) ( not ( = ?auto_686727 ?auto_686734 ) ) ( not ( = ?auto_686727 ?auto_686735 ) ) ( not ( = ?auto_686727 ?auto_686736 ) ) ( not ( = ?auto_686727 ?auto_686737 ) ) ( not ( = ?auto_686727 ?auto_686738 ) ) ( not ( = ?auto_686727 ?auto_686739 ) ) ( not ( = ?auto_686727 ?auto_686740 ) ) ( not ( = ?auto_686727 ?auto_686741 ) ) ( not ( = ?auto_686728 ?auto_686729 ) ) ( not ( = ?auto_686728 ?auto_686730 ) ) ( not ( = ?auto_686728 ?auto_686731 ) ) ( not ( = ?auto_686728 ?auto_686732 ) ) ( not ( = ?auto_686728 ?auto_686733 ) ) ( not ( = ?auto_686728 ?auto_686734 ) ) ( not ( = ?auto_686728 ?auto_686735 ) ) ( not ( = ?auto_686728 ?auto_686736 ) ) ( not ( = ?auto_686728 ?auto_686737 ) ) ( not ( = ?auto_686728 ?auto_686738 ) ) ( not ( = ?auto_686728 ?auto_686739 ) ) ( not ( = ?auto_686728 ?auto_686740 ) ) ( not ( = ?auto_686728 ?auto_686741 ) ) ( not ( = ?auto_686729 ?auto_686730 ) ) ( not ( = ?auto_686729 ?auto_686731 ) ) ( not ( = ?auto_686729 ?auto_686732 ) ) ( not ( = ?auto_686729 ?auto_686733 ) ) ( not ( = ?auto_686729 ?auto_686734 ) ) ( not ( = ?auto_686729 ?auto_686735 ) ) ( not ( = ?auto_686729 ?auto_686736 ) ) ( not ( = ?auto_686729 ?auto_686737 ) ) ( not ( = ?auto_686729 ?auto_686738 ) ) ( not ( = ?auto_686729 ?auto_686739 ) ) ( not ( = ?auto_686729 ?auto_686740 ) ) ( not ( = ?auto_686729 ?auto_686741 ) ) ( not ( = ?auto_686730 ?auto_686731 ) ) ( not ( = ?auto_686730 ?auto_686732 ) ) ( not ( = ?auto_686730 ?auto_686733 ) ) ( not ( = ?auto_686730 ?auto_686734 ) ) ( not ( = ?auto_686730 ?auto_686735 ) ) ( not ( = ?auto_686730 ?auto_686736 ) ) ( not ( = ?auto_686730 ?auto_686737 ) ) ( not ( = ?auto_686730 ?auto_686738 ) ) ( not ( = ?auto_686730 ?auto_686739 ) ) ( not ( = ?auto_686730 ?auto_686740 ) ) ( not ( = ?auto_686730 ?auto_686741 ) ) ( not ( = ?auto_686731 ?auto_686732 ) ) ( not ( = ?auto_686731 ?auto_686733 ) ) ( not ( = ?auto_686731 ?auto_686734 ) ) ( not ( = ?auto_686731 ?auto_686735 ) ) ( not ( = ?auto_686731 ?auto_686736 ) ) ( not ( = ?auto_686731 ?auto_686737 ) ) ( not ( = ?auto_686731 ?auto_686738 ) ) ( not ( = ?auto_686731 ?auto_686739 ) ) ( not ( = ?auto_686731 ?auto_686740 ) ) ( not ( = ?auto_686731 ?auto_686741 ) ) ( not ( = ?auto_686732 ?auto_686733 ) ) ( not ( = ?auto_686732 ?auto_686734 ) ) ( not ( = ?auto_686732 ?auto_686735 ) ) ( not ( = ?auto_686732 ?auto_686736 ) ) ( not ( = ?auto_686732 ?auto_686737 ) ) ( not ( = ?auto_686732 ?auto_686738 ) ) ( not ( = ?auto_686732 ?auto_686739 ) ) ( not ( = ?auto_686732 ?auto_686740 ) ) ( not ( = ?auto_686732 ?auto_686741 ) ) ( not ( = ?auto_686733 ?auto_686734 ) ) ( not ( = ?auto_686733 ?auto_686735 ) ) ( not ( = ?auto_686733 ?auto_686736 ) ) ( not ( = ?auto_686733 ?auto_686737 ) ) ( not ( = ?auto_686733 ?auto_686738 ) ) ( not ( = ?auto_686733 ?auto_686739 ) ) ( not ( = ?auto_686733 ?auto_686740 ) ) ( not ( = ?auto_686733 ?auto_686741 ) ) ( not ( = ?auto_686734 ?auto_686735 ) ) ( not ( = ?auto_686734 ?auto_686736 ) ) ( not ( = ?auto_686734 ?auto_686737 ) ) ( not ( = ?auto_686734 ?auto_686738 ) ) ( not ( = ?auto_686734 ?auto_686739 ) ) ( not ( = ?auto_686734 ?auto_686740 ) ) ( not ( = ?auto_686734 ?auto_686741 ) ) ( not ( = ?auto_686735 ?auto_686736 ) ) ( not ( = ?auto_686735 ?auto_686737 ) ) ( not ( = ?auto_686735 ?auto_686738 ) ) ( not ( = ?auto_686735 ?auto_686739 ) ) ( not ( = ?auto_686735 ?auto_686740 ) ) ( not ( = ?auto_686735 ?auto_686741 ) ) ( not ( = ?auto_686736 ?auto_686737 ) ) ( not ( = ?auto_686736 ?auto_686738 ) ) ( not ( = ?auto_686736 ?auto_686739 ) ) ( not ( = ?auto_686736 ?auto_686740 ) ) ( not ( = ?auto_686736 ?auto_686741 ) ) ( not ( = ?auto_686737 ?auto_686738 ) ) ( not ( = ?auto_686737 ?auto_686739 ) ) ( not ( = ?auto_686737 ?auto_686740 ) ) ( not ( = ?auto_686737 ?auto_686741 ) ) ( not ( = ?auto_686738 ?auto_686739 ) ) ( not ( = ?auto_686738 ?auto_686740 ) ) ( not ( = ?auto_686738 ?auto_686741 ) ) ( not ( = ?auto_686739 ?auto_686740 ) ) ( not ( = ?auto_686739 ?auto_686741 ) ) ( not ( = ?auto_686740 ?auto_686741 ) ) ( ON ?auto_686739 ?auto_686740 ) ( ON ?auto_686738 ?auto_686739 ) ( ON ?auto_686737 ?auto_686738 ) ( ON ?auto_686736 ?auto_686737 ) ( ON ?auto_686735 ?auto_686736 ) ( ON ?auto_686734 ?auto_686735 ) ( CLEAR ?auto_686732 ) ( ON ?auto_686733 ?auto_686734 ) ( CLEAR ?auto_686733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_686724 ?auto_686725 ?auto_686726 ?auto_686727 ?auto_686728 ?auto_686729 ?auto_686730 ?auto_686731 ?auto_686732 ?auto_686733 )
      ( MAKE-17PILE ?auto_686724 ?auto_686725 ?auto_686726 ?auto_686727 ?auto_686728 ?auto_686729 ?auto_686730 ?auto_686731 ?auto_686732 ?auto_686733 ?auto_686734 ?auto_686735 ?auto_686736 ?auto_686737 ?auto_686738 ?auto_686739 ?auto_686740 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_686759 - BLOCK
      ?auto_686760 - BLOCK
      ?auto_686761 - BLOCK
      ?auto_686762 - BLOCK
      ?auto_686763 - BLOCK
      ?auto_686764 - BLOCK
      ?auto_686765 - BLOCK
      ?auto_686766 - BLOCK
      ?auto_686767 - BLOCK
      ?auto_686768 - BLOCK
      ?auto_686769 - BLOCK
      ?auto_686770 - BLOCK
      ?auto_686771 - BLOCK
      ?auto_686772 - BLOCK
      ?auto_686773 - BLOCK
      ?auto_686774 - BLOCK
      ?auto_686775 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_686775 ) ( ON-TABLE ?auto_686759 ) ( ON ?auto_686760 ?auto_686759 ) ( ON ?auto_686761 ?auto_686760 ) ( ON ?auto_686762 ?auto_686761 ) ( ON ?auto_686763 ?auto_686762 ) ( ON ?auto_686764 ?auto_686763 ) ( ON ?auto_686765 ?auto_686764 ) ( ON ?auto_686766 ?auto_686765 ) ( ON ?auto_686767 ?auto_686766 ) ( not ( = ?auto_686759 ?auto_686760 ) ) ( not ( = ?auto_686759 ?auto_686761 ) ) ( not ( = ?auto_686759 ?auto_686762 ) ) ( not ( = ?auto_686759 ?auto_686763 ) ) ( not ( = ?auto_686759 ?auto_686764 ) ) ( not ( = ?auto_686759 ?auto_686765 ) ) ( not ( = ?auto_686759 ?auto_686766 ) ) ( not ( = ?auto_686759 ?auto_686767 ) ) ( not ( = ?auto_686759 ?auto_686768 ) ) ( not ( = ?auto_686759 ?auto_686769 ) ) ( not ( = ?auto_686759 ?auto_686770 ) ) ( not ( = ?auto_686759 ?auto_686771 ) ) ( not ( = ?auto_686759 ?auto_686772 ) ) ( not ( = ?auto_686759 ?auto_686773 ) ) ( not ( = ?auto_686759 ?auto_686774 ) ) ( not ( = ?auto_686759 ?auto_686775 ) ) ( not ( = ?auto_686760 ?auto_686761 ) ) ( not ( = ?auto_686760 ?auto_686762 ) ) ( not ( = ?auto_686760 ?auto_686763 ) ) ( not ( = ?auto_686760 ?auto_686764 ) ) ( not ( = ?auto_686760 ?auto_686765 ) ) ( not ( = ?auto_686760 ?auto_686766 ) ) ( not ( = ?auto_686760 ?auto_686767 ) ) ( not ( = ?auto_686760 ?auto_686768 ) ) ( not ( = ?auto_686760 ?auto_686769 ) ) ( not ( = ?auto_686760 ?auto_686770 ) ) ( not ( = ?auto_686760 ?auto_686771 ) ) ( not ( = ?auto_686760 ?auto_686772 ) ) ( not ( = ?auto_686760 ?auto_686773 ) ) ( not ( = ?auto_686760 ?auto_686774 ) ) ( not ( = ?auto_686760 ?auto_686775 ) ) ( not ( = ?auto_686761 ?auto_686762 ) ) ( not ( = ?auto_686761 ?auto_686763 ) ) ( not ( = ?auto_686761 ?auto_686764 ) ) ( not ( = ?auto_686761 ?auto_686765 ) ) ( not ( = ?auto_686761 ?auto_686766 ) ) ( not ( = ?auto_686761 ?auto_686767 ) ) ( not ( = ?auto_686761 ?auto_686768 ) ) ( not ( = ?auto_686761 ?auto_686769 ) ) ( not ( = ?auto_686761 ?auto_686770 ) ) ( not ( = ?auto_686761 ?auto_686771 ) ) ( not ( = ?auto_686761 ?auto_686772 ) ) ( not ( = ?auto_686761 ?auto_686773 ) ) ( not ( = ?auto_686761 ?auto_686774 ) ) ( not ( = ?auto_686761 ?auto_686775 ) ) ( not ( = ?auto_686762 ?auto_686763 ) ) ( not ( = ?auto_686762 ?auto_686764 ) ) ( not ( = ?auto_686762 ?auto_686765 ) ) ( not ( = ?auto_686762 ?auto_686766 ) ) ( not ( = ?auto_686762 ?auto_686767 ) ) ( not ( = ?auto_686762 ?auto_686768 ) ) ( not ( = ?auto_686762 ?auto_686769 ) ) ( not ( = ?auto_686762 ?auto_686770 ) ) ( not ( = ?auto_686762 ?auto_686771 ) ) ( not ( = ?auto_686762 ?auto_686772 ) ) ( not ( = ?auto_686762 ?auto_686773 ) ) ( not ( = ?auto_686762 ?auto_686774 ) ) ( not ( = ?auto_686762 ?auto_686775 ) ) ( not ( = ?auto_686763 ?auto_686764 ) ) ( not ( = ?auto_686763 ?auto_686765 ) ) ( not ( = ?auto_686763 ?auto_686766 ) ) ( not ( = ?auto_686763 ?auto_686767 ) ) ( not ( = ?auto_686763 ?auto_686768 ) ) ( not ( = ?auto_686763 ?auto_686769 ) ) ( not ( = ?auto_686763 ?auto_686770 ) ) ( not ( = ?auto_686763 ?auto_686771 ) ) ( not ( = ?auto_686763 ?auto_686772 ) ) ( not ( = ?auto_686763 ?auto_686773 ) ) ( not ( = ?auto_686763 ?auto_686774 ) ) ( not ( = ?auto_686763 ?auto_686775 ) ) ( not ( = ?auto_686764 ?auto_686765 ) ) ( not ( = ?auto_686764 ?auto_686766 ) ) ( not ( = ?auto_686764 ?auto_686767 ) ) ( not ( = ?auto_686764 ?auto_686768 ) ) ( not ( = ?auto_686764 ?auto_686769 ) ) ( not ( = ?auto_686764 ?auto_686770 ) ) ( not ( = ?auto_686764 ?auto_686771 ) ) ( not ( = ?auto_686764 ?auto_686772 ) ) ( not ( = ?auto_686764 ?auto_686773 ) ) ( not ( = ?auto_686764 ?auto_686774 ) ) ( not ( = ?auto_686764 ?auto_686775 ) ) ( not ( = ?auto_686765 ?auto_686766 ) ) ( not ( = ?auto_686765 ?auto_686767 ) ) ( not ( = ?auto_686765 ?auto_686768 ) ) ( not ( = ?auto_686765 ?auto_686769 ) ) ( not ( = ?auto_686765 ?auto_686770 ) ) ( not ( = ?auto_686765 ?auto_686771 ) ) ( not ( = ?auto_686765 ?auto_686772 ) ) ( not ( = ?auto_686765 ?auto_686773 ) ) ( not ( = ?auto_686765 ?auto_686774 ) ) ( not ( = ?auto_686765 ?auto_686775 ) ) ( not ( = ?auto_686766 ?auto_686767 ) ) ( not ( = ?auto_686766 ?auto_686768 ) ) ( not ( = ?auto_686766 ?auto_686769 ) ) ( not ( = ?auto_686766 ?auto_686770 ) ) ( not ( = ?auto_686766 ?auto_686771 ) ) ( not ( = ?auto_686766 ?auto_686772 ) ) ( not ( = ?auto_686766 ?auto_686773 ) ) ( not ( = ?auto_686766 ?auto_686774 ) ) ( not ( = ?auto_686766 ?auto_686775 ) ) ( not ( = ?auto_686767 ?auto_686768 ) ) ( not ( = ?auto_686767 ?auto_686769 ) ) ( not ( = ?auto_686767 ?auto_686770 ) ) ( not ( = ?auto_686767 ?auto_686771 ) ) ( not ( = ?auto_686767 ?auto_686772 ) ) ( not ( = ?auto_686767 ?auto_686773 ) ) ( not ( = ?auto_686767 ?auto_686774 ) ) ( not ( = ?auto_686767 ?auto_686775 ) ) ( not ( = ?auto_686768 ?auto_686769 ) ) ( not ( = ?auto_686768 ?auto_686770 ) ) ( not ( = ?auto_686768 ?auto_686771 ) ) ( not ( = ?auto_686768 ?auto_686772 ) ) ( not ( = ?auto_686768 ?auto_686773 ) ) ( not ( = ?auto_686768 ?auto_686774 ) ) ( not ( = ?auto_686768 ?auto_686775 ) ) ( not ( = ?auto_686769 ?auto_686770 ) ) ( not ( = ?auto_686769 ?auto_686771 ) ) ( not ( = ?auto_686769 ?auto_686772 ) ) ( not ( = ?auto_686769 ?auto_686773 ) ) ( not ( = ?auto_686769 ?auto_686774 ) ) ( not ( = ?auto_686769 ?auto_686775 ) ) ( not ( = ?auto_686770 ?auto_686771 ) ) ( not ( = ?auto_686770 ?auto_686772 ) ) ( not ( = ?auto_686770 ?auto_686773 ) ) ( not ( = ?auto_686770 ?auto_686774 ) ) ( not ( = ?auto_686770 ?auto_686775 ) ) ( not ( = ?auto_686771 ?auto_686772 ) ) ( not ( = ?auto_686771 ?auto_686773 ) ) ( not ( = ?auto_686771 ?auto_686774 ) ) ( not ( = ?auto_686771 ?auto_686775 ) ) ( not ( = ?auto_686772 ?auto_686773 ) ) ( not ( = ?auto_686772 ?auto_686774 ) ) ( not ( = ?auto_686772 ?auto_686775 ) ) ( not ( = ?auto_686773 ?auto_686774 ) ) ( not ( = ?auto_686773 ?auto_686775 ) ) ( not ( = ?auto_686774 ?auto_686775 ) ) ( ON ?auto_686774 ?auto_686775 ) ( ON ?auto_686773 ?auto_686774 ) ( ON ?auto_686772 ?auto_686773 ) ( ON ?auto_686771 ?auto_686772 ) ( ON ?auto_686770 ?auto_686771 ) ( ON ?auto_686769 ?auto_686770 ) ( CLEAR ?auto_686767 ) ( ON ?auto_686768 ?auto_686769 ) ( CLEAR ?auto_686768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_686759 ?auto_686760 ?auto_686761 ?auto_686762 ?auto_686763 ?auto_686764 ?auto_686765 ?auto_686766 ?auto_686767 ?auto_686768 )
      ( MAKE-17PILE ?auto_686759 ?auto_686760 ?auto_686761 ?auto_686762 ?auto_686763 ?auto_686764 ?auto_686765 ?auto_686766 ?auto_686767 ?auto_686768 ?auto_686769 ?auto_686770 ?auto_686771 ?auto_686772 ?auto_686773 ?auto_686774 ?auto_686775 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_686793 - BLOCK
      ?auto_686794 - BLOCK
      ?auto_686795 - BLOCK
      ?auto_686796 - BLOCK
      ?auto_686797 - BLOCK
      ?auto_686798 - BLOCK
      ?auto_686799 - BLOCK
      ?auto_686800 - BLOCK
      ?auto_686801 - BLOCK
      ?auto_686802 - BLOCK
      ?auto_686803 - BLOCK
      ?auto_686804 - BLOCK
      ?auto_686805 - BLOCK
      ?auto_686806 - BLOCK
      ?auto_686807 - BLOCK
      ?auto_686808 - BLOCK
      ?auto_686809 - BLOCK
    )
    :vars
    (
      ?auto_686810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_686809 ?auto_686810 ) ( ON-TABLE ?auto_686793 ) ( ON ?auto_686794 ?auto_686793 ) ( ON ?auto_686795 ?auto_686794 ) ( ON ?auto_686796 ?auto_686795 ) ( ON ?auto_686797 ?auto_686796 ) ( ON ?auto_686798 ?auto_686797 ) ( ON ?auto_686799 ?auto_686798 ) ( ON ?auto_686800 ?auto_686799 ) ( not ( = ?auto_686793 ?auto_686794 ) ) ( not ( = ?auto_686793 ?auto_686795 ) ) ( not ( = ?auto_686793 ?auto_686796 ) ) ( not ( = ?auto_686793 ?auto_686797 ) ) ( not ( = ?auto_686793 ?auto_686798 ) ) ( not ( = ?auto_686793 ?auto_686799 ) ) ( not ( = ?auto_686793 ?auto_686800 ) ) ( not ( = ?auto_686793 ?auto_686801 ) ) ( not ( = ?auto_686793 ?auto_686802 ) ) ( not ( = ?auto_686793 ?auto_686803 ) ) ( not ( = ?auto_686793 ?auto_686804 ) ) ( not ( = ?auto_686793 ?auto_686805 ) ) ( not ( = ?auto_686793 ?auto_686806 ) ) ( not ( = ?auto_686793 ?auto_686807 ) ) ( not ( = ?auto_686793 ?auto_686808 ) ) ( not ( = ?auto_686793 ?auto_686809 ) ) ( not ( = ?auto_686793 ?auto_686810 ) ) ( not ( = ?auto_686794 ?auto_686795 ) ) ( not ( = ?auto_686794 ?auto_686796 ) ) ( not ( = ?auto_686794 ?auto_686797 ) ) ( not ( = ?auto_686794 ?auto_686798 ) ) ( not ( = ?auto_686794 ?auto_686799 ) ) ( not ( = ?auto_686794 ?auto_686800 ) ) ( not ( = ?auto_686794 ?auto_686801 ) ) ( not ( = ?auto_686794 ?auto_686802 ) ) ( not ( = ?auto_686794 ?auto_686803 ) ) ( not ( = ?auto_686794 ?auto_686804 ) ) ( not ( = ?auto_686794 ?auto_686805 ) ) ( not ( = ?auto_686794 ?auto_686806 ) ) ( not ( = ?auto_686794 ?auto_686807 ) ) ( not ( = ?auto_686794 ?auto_686808 ) ) ( not ( = ?auto_686794 ?auto_686809 ) ) ( not ( = ?auto_686794 ?auto_686810 ) ) ( not ( = ?auto_686795 ?auto_686796 ) ) ( not ( = ?auto_686795 ?auto_686797 ) ) ( not ( = ?auto_686795 ?auto_686798 ) ) ( not ( = ?auto_686795 ?auto_686799 ) ) ( not ( = ?auto_686795 ?auto_686800 ) ) ( not ( = ?auto_686795 ?auto_686801 ) ) ( not ( = ?auto_686795 ?auto_686802 ) ) ( not ( = ?auto_686795 ?auto_686803 ) ) ( not ( = ?auto_686795 ?auto_686804 ) ) ( not ( = ?auto_686795 ?auto_686805 ) ) ( not ( = ?auto_686795 ?auto_686806 ) ) ( not ( = ?auto_686795 ?auto_686807 ) ) ( not ( = ?auto_686795 ?auto_686808 ) ) ( not ( = ?auto_686795 ?auto_686809 ) ) ( not ( = ?auto_686795 ?auto_686810 ) ) ( not ( = ?auto_686796 ?auto_686797 ) ) ( not ( = ?auto_686796 ?auto_686798 ) ) ( not ( = ?auto_686796 ?auto_686799 ) ) ( not ( = ?auto_686796 ?auto_686800 ) ) ( not ( = ?auto_686796 ?auto_686801 ) ) ( not ( = ?auto_686796 ?auto_686802 ) ) ( not ( = ?auto_686796 ?auto_686803 ) ) ( not ( = ?auto_686796 ?auto_686804 ) ) ( not ( = ?auto_686796 ?auto_686805 ) ) ( not ( = ?auto_686796 ?auto_686806 ) ) ( not ( = ?auto_686796 ?auto_686807 ) ) ( not ( = ?auto_686796 ?auto_686808 ) ) ( not ( = ?auto_686796 ?auto_686809 ) ) ( not ( = ?auto_686796 ?auto_686810 ) ) ( not ( = ?auto_686797 ?auto_686798 ) ) ( not ( = ?auto_686797 ?auto_686799 ) ) ( not ( = ?auto_686797 ?auto_686800 ) ) ( not ( = ?auto_686797 ?auto_686801 ) ) ( not ( = ?auto_686797 ?auto_686802 ) ) ( not ( = ?auto_686797 ?auto_686803 ) ) ( not ( = ?auto_686797 ?auto_686804 ) ) ( not ( = ?auto_686797 ?auto_686805 ) ) ( not ( = ?auto_686797 ?auto_686806 ) ) ( not ( = ?auto_686797 ?auto_686807 ) ) ( not ( = ?auto_686797 ?auto_686808 ) ) ( not ( = ?auto_686797 ?auto_686809 ) ) ( not ( = ?auto_686797 ?auto_686810 ) ) ( not ( = ?auto_686798 ?auto_686799 ) ) ( not ( = ?auto_686798 ?auto_686800 ) ) ( not ( = ?auto_686798 ?auto_686801 ) ) ( not ( = ?auto_686798 ?auto_686802 ) ) ( not ( = ?auto_686798 ?auto_686803 ) ) ( not ( = ?auto_686798 ?auto_686804 ) ) ( not ( = ?auto_686798 ?auto_686805 ) ) ( not ( = ?auto_686798 ?auto_686806 ) ) ( not ( = ?auto_686798 ?auto_686807 ) ) ( not ( = ?auto_686798 ?auto_686808 ) ) ( not ( = ?auto_686798 ?auto_686809 ) ) ( not ( = ?auto_686798 ?auto_686810 ) ) ( not ( = ?auto_686799 ?auto_686800 ) ) ( not ( = ?auto_686799 ?auto_686801 ) ) ( not ( = ?auto_686799 ?auto_686802 ) ) ( not ( = ?auto_686799 ?auto_686803 ) ) ( not ( = ?auto_686799 ?auto_686804 ) ) ( not ( = ?auto_686799 ?auto_686805 ) ) ( not ( = ?auto_686799 ?auto_686806 ) ) ( not ( = ?auto_686799 ?auto_686807 ) ) ( not ( = ?auto_686799 ?auto_686808 ) ) ( not ( = ?auto_686799 ?auto_686809 ) ) ( not ( = ?auto_686799 ?auto_686810 ) ) ( not ( = ?auto_686800 ?auto_686801 ) ) ( not ( = ?auto_686800 ?auto_686802 ) ) ( not ( = ?auto_686800 ?auto_686803 ) ) ( not ( = ?auto_686800 ?auto_686804 ) ) ( not ( = ?auto_686800 ?auto_686805 ) ) ( not ( = ?auto_686800 ?auto_686806 ) ) ( not ( = ?auto_686800 ?auto_686807 ) ) ( not ( = ?auto_686800 ?auto_686808 ) ) ( not ( = ?auto_686800 ?auto_686809 ) ) ( not ( = ?auto_686800 ?auto_686810 ) ) ( not ( = ?auto_686801 ?auto_686802 ) ) ( not ( = ?auto_686801 ?auto_686803 ) ) ( not ( = ?auto_686801 ?auto_686804 ) ) ( not ( = ?auto_686801 ?auto_686805 ) ) ( not ( = ?auto_686801 ?auto_686806 ) ) ( not ( = ?auto_686801 ?auto_686807 ) ) ( not ( = ?auto_686801 ?auto_686808 ) ) ( not ( = ?auto_686801 ?auto_686809 ) ) ( not ( = ?auto_686801 ?auto_686810 ) ) ( not ( = ?auto_686802 ?auto_686803 ) ) ( not ( = ?auto_686802 ?auto_686804 ) ) ( not ( = ?auto_686802 ?auto_686805 ) ) ( not ( = ?auto_686802 ?auto_686806 ) ) ( not ( = ?auto_686802 ?auto_686807 ) ) ( not ( = ?auto_686802 ?auto_686808 ) ) ( not ( = ?auto_686802 ?auto_686809 ) ) ( not ( = ?auto_686802 ?auto_686810 ) ) ( not ( = ?auto_686803 ?auto_686804 ) ) ( not ( = ?auto_686803 ?auto_686805 ) ) ( not ( = ?auto_686803 ?auto_686806 ) ) ( not ( = ?auto_686803 ?auto_686807 ) ) ( not ( = ?auto_686803 ?auto_686808 ) ) ( not ( = ?auto_686803 ?auto_686809 ) ) ( not ( = ?auto_686803 ?auto_686810 ) ) ( not ( = ?auto_686804 ?auto_686805 ) ) ( not ( = ?auto_686804 ?auto_686806 ) ) ( not ( = ?auto_686804 ?auto_686807 ) ) ( not ( = ?auto_686804 ?auto_686808 ) ) ( not ( = ?auto_686804 ?auto_686809 ) ) ( not ( = ?auto_686804 ?auto_686810 ) ) ( not ( = ?auto_686805 ?auto_686806 ) ) ( not ( = ?auto_686805 ?auto_686807 ) ) ( not ( = ?auto_686805 ?auto_686808 ) ) ( not ( = ?auto_686805 ?auto_686809 ) ) ( not ( = ?auto_686805 ?auto_686810 ) ) ( not ( = ?auto_686806 ?auto_686807 ) ) ( not ( = ?auto_686806 ?auto_686808 ) ) ( not ( = ?auto_686806 ?auto_686809 ) ) ( not ( = ?auto_686806 ?auto_686810 ) ) ( not ( = ?auto_686807 ?auto_686808 ) ) ( not ( = ?auto_686807 ?auto_686809 ) ) ( not ( = ?auto_686807 ?auto_686810 ) ) ( not ( = ?auto_686808 ?auto_686809 ) ) ( not ( = ?auto_686808 ?auto_686810 ) ) ( not ( = ?auto_686809 ?auto_686810 ) ) ( ON ?auto_686808 ?auto_686809 ) ( ON ?auto_686807 ?auto_686808 ) ( ON ?auto_686806 ?auto_686807 ) ( ON ?auto_686805 ?auto_686806 ) ( ON ?auto_686804 ?auto_686805 ) ( ON ?auto_686803 ?auto_686804 ) ( ON ?auto_686802 ?auto_686803 ) ( CLEAR ?auto_686800 ) ( ON ?auto_686801 ?auto_686802 ) ( CLEAR ?auto_686801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_686793 ?auto_686794 ?auto_686795 ?auto_686796 ?auto_686797 ?auto_686798 ?auto_686799 ?auto_686800 ?auto_686801 )
      ( MAKE-17PILE ?auto_686793 ?auto_686794 ?auto_686795 ?auto_686796 ?auto_686797 ?auto_686798 ?auto_686799 ?auto_686800 ?auto_686801 ?auto_686802 ?auto_686803 ?auto_686804 ?auto_686805 ?auto_686806 ?auto_686807 ?auto_686808 ?auto_686809 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_686828 - BLOCK
      ?auto_686829 - BLOCK
      ?auto_686830 - BLOCK
      ?auto_686831 - BLOCK
      ?auto_686832 - BLOCK
      ?auto_686833 - BLOCK
      ?auto_686834 - BLOCK
      ?auto_686835 - BLOCK
      ?auto_686836 - BLOCK
      ?auto_686837 - BLOCK
      ?auto_686838 - BLOCK
      ?auto_686839 - BLOCK
      ?auto_686840 - BLOCK
      ?auto_686841 - BLOCK
      ?auto_686842 - BLOCK
      ?auto_686843 - BLOCK
      ?auto_686844 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_686844 ) ( ON-TABLE ?auto_686828 ) ( ON ?auto_686829 ?auto_686828 ) ( ON ?auto_686830 ?auto_686829 ) ( ON ?auto_686831 ?auto_686830 ) ( ON ?auto_686832 ?auto_686831 ) ( ON ?auto_686833 ?auto_686832 ) ( ON ?auto_686834 ?auto_686833 ) ( ON ?auto_686835 ?auto_686834 ) ( not ( = ?auto_686828 ?auto_686829 ) ) ( not ( = ?auto_686828 ?auto_686830 ) ) ( not ( = ?auto_686828 ?auto_686831 ) ) ( not ( = ?auto_686828 ?auto_686832 ) ) ( not ( = ?auto_686828 ?auto_686833 ) ) ( not ( = ?auto_686828 ?auto_686834 ) ) ( not ( = ?auto_686828 ?auto_686835 ) ) ( not ( = ?auto_686828 ?auto_686836 ) ) ( not ( = ?auto_686828 ?auto_686837 ) ) ( not ( = ?auto_686828 ?auto_686838 ) ) ( not ( = ?auto_686828 ?auto_686839 ) ) ( not ( = ?auto_686828 ?auto_686840 ) ) ( not ( = ?auto_686828 ?auto_686841 ) ) ( not ( = ?auto_686828 ?auto_686842 ) ) ( not ( = ?auto_686828 ?auto_686843 ) ) ( not ( = ?auto_686828 ?auto_686844 ) ) ( not ( = ?auto_686829 ?auto_686830 ) ) ( not ( = ?auto_686829 ?auto_686831 ) ) ( not ( = ?auto_686829 ?auto_686832 ) ) ( not ( = ?auto_686829 ?auto_686833 ) ) ( not ( = ?auto_686829 ?auto_686834 ) ) ( not ( = ?auto_686829 ?auto_686835 ) ) ( not ( = ?auto_686829 ?auto_686836 ) ) ( not ( = ?auto_686829 ?auto_686837 ) ) ( not ( = ?auto_686829 ?auto_686838 ) ) ( not ( = ?auto_686829 ?auto_686839 ) ) ( not ( = ?auto_686829 ?auto_686840 ) ) ( not ( = ?auto_686829 ?auto_686841 ) ) ( not ( = ?auto_686829 ?auto_686842 ) ) ( not ( = ?auto_686829 ?auto_686843 ) ) ( not ( = ?auto_686829 ?auto_686844 ) ) ( not ( = ?auto_686830 ?auto_686831 ) ) ( not ( = ?auto_686830 ?auto_686832 ) ) ( not ( = ?auto_686830 ?auto_686833 ) ) ( not ( = ?auto_686830 ?auto_686834 ) ) ( not ( = ?auto_686830 ?auto_686835 ) ) ( not ( = ?auto_686830 ?auto_686836 ) ) ( not ( = ?auto_686830 ?auto_686837 ) ) ( not ( = ?auto_686830 ?auto_686838 ) ) ( not ( = ?auto_686830 ?auto_686839 ) ) ( not ( = ?auto_686830 ?auto_686840 ) ) ( not ( = ?auto_686830 ?auto_686841 ) ) ( not ( = ?auto_686830 ?auto_686842 ) ) ( not ( = ?auto_686830 ?auto_686843 ) ) ( not ( = ?auto_686830 ?auto_686844 ) ) ( not ( = ?auto_686831 ?auto_686832 ) ) ( not ( = ?auto_686831 ?auto_686833 ) ) ( not ( = ?auto_686831 ?auto_686834 ) ) ( not ( = ?auto_686831 ?auto_686835 ) ) ( not ( = ?auto_686831 ?auto_686836 ) ) ( not ( = ?auto_686831 ?auto_686837 ) ) ( not ( = ?auto_686831 ?auto_686838 ) ) ( not ( = ?auto_686831 ?auto_686839 ) ) ( not ( = ?auto_686831 ?auto_686840 ) ) ( not ( = ?auto_686831 ?auto_686841 ) ) ( not ( = ?auto_686831 ?auto_686842 ) ) ( not ( = ?auto_686831 ?auto_686843 ) ) ( not ( = ?auto_686831 ?auto_686844 ) ) ( not ( = ?auto_686832 ?auto_686833 ) ) ( not ( = ?auto_686832 ?auto_686834 ) ) ( not ( = ?auto_686832 ?auto_686835 ) ) ( not ( = ?auto_686832 ?auto_686836 ) ) ( not ( = ?auto_686832 ?auto_686837 ) ) ( not ( = ?auto_686832 ?auto_686838 ) ) ( not ( = ?auto_686832 ?auto_686839 ) ) ( not ( = ?auto_686832 ?auto_686840 ) ) ( not ( = ?auto_686832 ?auto_686841 ) ) ( not ( = ?auto_686832 ?auto_686842 ) ) ( not ( = ?auto_686832 ?auto_686843 ) ) ( not ( = ?auto_686832 ?auto_686844 ) ) ( not ( = ?auto_686833 ?auto_686834 ) ) ( not ( = ?auto_686833 ?auto_686835 ) ) ( not ( = ?auto_686833 ?auto_686836 ) ) ( not ( = ?auto_686833 ?auto_686837 ) ) ( not ( = ?auto_686833 ?auto_686838 ) ) ( not ( = ?auto_686833 ?auto_686839 ) ) ( not ( = ?auto_686833 ?auto_686840 ) ) ( not ( = ?auto_686833 ?auto_686841 ) ) ( not ( = ?auto_686833 ?auto_686842 ) ) ( not ( = ?auto_686833 ?auto_686843 ) ) ( not ( = ?auto_686833 ?auto_686844 ) ) ( not ( = ?auto_686834 ?auto_686835 ) ) ( not ( = ?auto_686834 ?auto_686836 ) ) ( not ( = ?auto_686834 ?auto_686837 ) ) ( not ( = ?auto_686834 ?auto_686838 ) ) ( not ( = ?auto_686834 ?auto_686839 ) ) ( not ( = ?auto_686834 ?auto_686840 ) ) ( not ( = ?auto_686834 ?auto_686841 ) ) ( not ( = ?auto_686834 ?auto_686842 ) ) ( not ( = ?auto_686834 ?auto_686843 ) ) ( not ( = ?auto_686834 ?auto_686844 ) ) ( not ( = ?auto_686835 ?auto_686836 ) ) ( not ( = ?auto_686835 ?auto_686837 ) ) ( not ( = ?auto_686835 ?auto_686838 ) ) ( not ( = ?auto_686835 ?auto_686839 ) ) ( not ( = ?auto_686835 ?auto_686840 ) ) ( not ( = ?auto_686835 ?auto_686841 ) ) ( not ( = ?auto_686835 ?auto_686842 ) ) ( not ( = ?auto_686835 ?auto_686843 ) ) ( not ( = ?auto_686835 ?auto_686844 ) ) ( not ( = ?auto_686836 ?auto_686837 ) ) ( not ( = ?auto_686836 ?auto_686838 ) ) ( not ( = ?auto_686836 ?auto_686839 ) ) ( not ( = ?auto_686836 ?auto_686840 ) ) ( not ( = ?auto_686836 ?auto_686841 ) ) ( not ( = ?auto_686836 ?auto_686842 ) ) ( not ( = ?auto_686836 ?auto_686843 ) ) ( not ( = ?auto_686836 ?auto_686844 ) ) ( not ( = ?auto_686837 ?auto_686838 ) ) ( not ( = ?auto_686837 ?auto_686839 ) ) ( not ( = ?auto_686837 ?auto_686840 ) ) ( not ( = ?auto_686837 ?auto_686841 ) ) ( not ( = ?auto_686837 ?auto_686842 ) ) ( not ( = ?auto_686837 ?auto_686843 ) ) ( not ( = ?auto_686837 ?auto_686844 ) ) ( not ( = ?auto_686838 ?auto_686839 ) ) ( not ( = ?auto_686838 ?auto_686840 ) ) ( not ( = ?auto_686838 ?auto_686841 ) ) ( not ( = ?auto_686838 ?auto_686842 ) ) ( not ( = ?auto_686838 ?auto_686843 ) ) ( not ( = ?auto_686838 ?auto_686844 ) ) ( not ( = ?auto_686839 ?auto_686840 ) ) ( not ( = ?auto_686839 ?auto_686841 ) ) ( not ( = ?auto_686839 ?auto_686842 ) ) ( not ( = ?auto_686839 ?auto_686843 ) ) ( not ( = ?auto_686839 ?auto_686844 ) ) ( not ( = ?auto_686840 ?auto_686841 ) ) ( not ( = ?auto_686840 ?auto_686842 ) ) ( not ( = ?auto_686840 ?auto_686843 ) ) ( not ( = ?auto_686840 ?auto_686844 ) ) ( not ( = ?auto_686841 ?auto_686842 ) ) ( not ( = ?auto_686841 ?auto_686843 ) ) ( not ( = ?auto_686841 ?auto_686844 ) ) ( not ( = ?auto_686842 ?auto_686843 ) ) ( not ( = ?auto_686842 ?auto_686844 ) ) ( not ( = ?auto_686843 ?auto_686844 ) ) ( ON ?auto_686843 ?auto_686844 ) ( ON ?auto_686842 ?auto_686843 ) ( ON ?auto_686841 ?auto_686842 ) ( ON ?auto_686840 ?auto_686841 ) ( ON ?auto_686839 ?auto_686840 ) ( ON ?auto_686838 ?auto_686839 ) ( ON ?auto_686837 ?auto_686838 ) ( CLEAR ?auto_686835 ) ( ON ?auto_686836 ?auto_686837 ) ( CLEAR ?auto_686836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_686828 ?auto_686829 ?auto_686830 ?auto_686831 ?auto_686832 ?auto_686833 ?auto_686834 ?auto_686835 ?auto_686836 )
      ( MAKE-17PILE ?auto_686828 ?auto_686829 ?auto_686830 ?auto_686831 ?auto_686832 ?auto_686833 ?auto_686834 ?auto_686835 ?auto_686836 ?auto_686837 ?auto_686838 ?auto_686839 ?auto_686840 ?auto_686841 ?auto_686842 ?auto_686843 ?auto_686844 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_686862 - BLOCK
      ?auto_686863 - BLOCK
      ?auto_686864 - BLOCK
      ?auto_686865 - BLOCK
      ?auto_686866 - BLOCK
      ?auto_686867 - BLOCK
      ?auto_686868 - BLOCK
      ?auto_686869 - BLOCK
      ?auto_686870 - BLOCK
      ?auto_686871 - BLOCK
      ?auto_686872 - BLOCK
      ?auto_686873 - BLOCK
      ?auto_686874 - BLOCK
      ?auto_686875 - BLOCK
      ?auto_686876 - BLOCK
      ?auto_686877 - BLOCK
      ?auto_686878 - BLOCK
    )
    :vars
    (
      ?auto_686879 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_686878 ?auto_686879 ) ( ON-TABLE ?auto_686862 ) ( ON ?auto_686863 ?auto_686862 ) ( ON ?auto_686864 ?auto_686863 ) ( ON ?auto_686865 ?auto_686864 ) ( ON ?auto_686866 ?auto_686865 ) ( ON ?auto_686867 ?auto_686866 ) ( ON ?auto_686868 ?auto_686867 ) ( not ( = ?auto_686862 ?auto_686863 ) ) ( not ( = ?auto_686862 ?auto_686864 ) ) ( not ( = ?auto_686862 ?auto_686865 ) ) ( not ( = ?auto_686862 ?auto_686866 ) ) ( not ( = ?auto_686862 ?auto_686867 ) ) ( not ( = ?auto_686862 ?auto_686868 ) ) ( not ( = ?auto_686862 ?auto_686869 ) ) ( not ( = ?auto_686862 ?auto_686870 ) ) ( not ( = ?auto_686862 ?auto_686871 ) ) ( not ( = ?auto_686862 ?auto_686872 ) ) ( not ( = ?auto_686862 ?auto_686873 ) ) ( not ( = ?auto_686862 ?auto_686874 ) ) ( not ( = ?auto_686862 ?auto_686875 ) ) ( not ( = ?auto_686862 ?auto_686876 ) ) ( not ( = ?auto_686862 ?auto_686877 ) ) ( not ( = ?auto_686862 ?auto_686878 ) ) ( not ( = ?auto_686862 ?auto_686879 ) ) ( not ( = ?auto_686863 ?auto_686864 ) ) ( not ( = ?auto_686863 ?auto_686865 ) ) ( not ( = ?auto_686863 ?auto_686866 ) ) ( not ( = ?auto_686863 ?auto_686867 ) ) ( not ( = ?auto_686863 ?auto_686868 ) ) ( not ( = ?auto_686863 ?auto_686869 ) ) ( not ( = ?auto_686863 ?auto_686870 ) ) ( not ( = ?auto_686863 ?auto_686871 ) ) ( not ( = ?auto_686863 ?auto_686872 ) ) ( not ( = ?auto_686863 ?auto_686873 ) ) ( not ( = ?auto_686863 ?auto_686874 ) ) ( not ( = ?auto_686863 ?auto_686875 ) ) ( not ( = ?auto_686863 ?auto_686876 ) ) ( not ( = ?auto_686863 ?auto_686877 ) ) ( not ( = ?auto_686863 ?auto_686878 ) ) ( not ( = ?auto_686863 ?auto_686879 ) ) ( not ( = ?auto_686864 ?auto_686865 ) ) ( not ( = ?auto_686864 ?auto_686866 ) ) ( not ( = ?auto_686864 ?auto_686867 ) ) ( not ( = ?auto_686864 ?auto_686868 ) ) ( not ( = ?auto_686864 ?auto_686869 ) ) ( not ( = ?auto_686864 ?auto_686870 ) ) ( not ( = ?auto_686864 ?auto_686871 ) ) ( not ( = ?auto_686864 ?auto_686872 ) ) ( not ( = ?auto_686864 ?auto_686873 ) ) ( not ( = ?auto_686864 ?auto_686874 ) ) ( not ( = ?auto_686864 ?auto_686875 ) ) ( not ( = ?auto_686864 ?auto_686876 ) ) ( not ( = ?auto_686864 ?auto_686877 ) ) ( not ( = ?auto_686864 ?auto_686878 ) ) ( not ( = ?auto_686864 ?auto_686879 ) ) ( not ( = ?auto_686865 ?auto_686866 ) ) ( not ( = ?auto_686865 ?auto_686867 ) ) ( not ( = ?auto_686865 ?auto_686868 ) ) ( not ( = ?auto_686865 ?auto_686869 ) ) ( not ( = ?auto_686865 ?auto_686870 ) ) ( not ( = ?auto_686865 ?auto_686871 ) ) ( not ( = ?auto_686865 ?auto_686872 ) ) ( not ( = ?auto_686865 ?auto_686873 ) ) ( not ( = ?auto_686865 ?auto_686874 ) ) ( not ( = ?auto_686865 ?auto_686875 ) ) ( not ( = ?auto_686865 ?auto_686876 ) ) ( not ( = ?auto_686865 ?auto_686877 ) ) ( not ( = ?auto_686865 ?auto_686878 ) ) ( not ( = ?auto_686865 ?auto_686879 ) ) ( not ( = ?auto_686866 ?auto_686867 ) ) ( not ( = ?auto_686866 ?auto_686868 ) ) ( not ( = ?auto_686866 ?auto_686869 ) ) ( not ( = ?auto_686866 ?auto_686870 ) ) ( not ( = ?auto_686866 ?auto_686871 ) ) ( not ( = ?auto_686866 ?auto_686872 ) ) ( not ( = ?auto_686866 ?auto_686873 ) ) ( not ( = ?auto_686866 ?auto_686874 ) ) ( not ( = ?auto_686866 ?auto_686875 ) ) ( not ( = ?auto_686866 ?auto_686876 ) ) ( not ( = ?auto_686866 ?auto_686877 ) ) ( not ( = ?auto_686866 ?auto_686878 ) ) ( not ( = ?auto_686866 ?auto_686879 ) ) ( not ( = ?auto_686867 ?auto_686868 ) ) ( not ( = ?auto_686867 ?auto_686869 ) ) ( not ( = ?auto_686867 ?auto_686870 ) ) ( not ( = ?auto_686867 ?auto_686871 ) ) ( not ( = ?auto_686867 ?auto_686872 ) ) ( not ( = ?auto_686867 ?auto_686873 ) ) ( not ( = ?auto_686867 ?auto_686874 ) ) ( not ( = ?auto_686867 ?auto_686875 ) ) ( not ( = ?auto_686867 ?auto_686876 ) ) ( not ( = ?auto_686867 ?auto_686877 ) ) ( not ( = ?auto_686867 ?auto_686878 ) ) ( not ( = ?auto_686867 ?auto_686879 ) ) ( not ( = ?auto_686868 ?auto_686869 ) ) ( not ( = ?auto_686868 ?auto_686870 ) ) ( not ( = ?auto_686868 ?auto_686871 ) ) ( not ( = ?auto_686868 ?auto_686872 ) ) ( not ( = ?auto_686868 ?auto_686873 ) ) ( not ( = ?auto_686868 ?auto_686874 ) ) ( not ( = ?auto_686868 ?auto_686875 ) ) ( not ( = ?auto_686868 ?auto_686876 ) ) ( not ( = ?auto_686868 ?auto_686877 ) ) ( not ( = ?auto_686868 ?auto_686878 ) ) ( not ( = ?auto_686868 ?auto_686879 ) ) ( not ( = ?auto_686869 ?auto_686870 ) ) ( not ( = ?auto_686869 ?auto_686871 ) ) ( not ( = ?auto_686869 ?auto_686872 ) ) ( not ( = ?auto_686869 ?auto_686873 ) ) ( not ( = ?auto_686869 ?auto_686874 ) ) ( not ( = ?auto_686869 ?auto_686875 ) ) ( not ( = ?auto_686869 ?auto_686876 ) ) ( not ( = ?auto_686869 ?auto_686877 ) ) ( not ( = ?auto_686869 ?auto_686878 ) ) ( not ( = ?auto_686869 ?auto_686879 ) ) ( not ( = ?auto_686870 ?auto_686871 ) ) ( not ( = ?auto_686870 ?auto_686872 ) ) ( not ( = ?auto_686870 ?auto_686873 ) ) ( not ( = ?auto_686870 ?auto_686874 ) ) ( not ( = ?auto_686870 ?auto_686875 ) ) ( not ( = ?auto_686870 ?auto_686876 ) ) ( not ( = ?auto_686870 ?auto_686877 ) ) ( not ( = ?auto_686870 ?auto_686878 ) ) ( not ( = ?auto_686870 ?auto_686879 ) ) ( not ( = ?auto_686871 ?auto_686872 ) ) ( not ( = ?auto_686871 ?auto_686873 ) ) ( not ( = ?auto_686871 ?auto_686874 ) ) ( not ( = ?auto_686871 ?auto_686875 ) ) ( not ( = ?auto_686871 ?auto_686876 ) ) ( not ( = ?auto_686871 ?auto_686877 ) ) ( not ( = ?auto_686871 ?auto_686878 ) ) ( not ( = ?auto_686871 ?auto_686879 ) ) ( not ( = ?auto_686872 ?auto_686873 ) ) ( not ( = ?auto_686872 ?auto_686874 ) ) ( not ( = ?auto_686872 ?auto_686875 ) ) ( not ( = ?auto_686872 ?auto_686876 ) ) ( not ( = ?auto_686872 ?auto_686877 ) ) ( not ( = ?auto_686872 ?auto_686878 ) ) ( not ( = ?auto_686872 ?auto_686879 ) ) ( not ( = ?auto_686873 ?auto_686874 ) ) ( not ( = ?auto_686873 ?auto_686875 ) ) ( not ( = ?auto_686873 ?auto_686876 ) ) ( not ( = ?auto_686873 ?auto_686877 ) ) ( not ( = ?auto_686873 ?auto_686878 ) ) ( not ( = ?auto_686873 ?auto_686879 ) ) ( not ( = ?auto_686874 ?auto_686875 ) ) ( not ( = ?auto_686874 ?auto_686876 ) ) ( not ( = ?auto_686874 ?auto_686877 ) ) ( not ( = ?auto_686874 ?auto_686878 ) ) ( not ( = ?auto_686874 ?auto_686879 ) ) ( not ( = ?auto_686875 ?auto_686876 ) ) ( not ( = ?auto_686875 ?auto_686877 ) ) ( not ( = ?auto_686875 ?auto_686878 ) ) ( not ( = ?auto_686875 ?auto_686879 ) ) ( not ( = ?auto_686876 ?auto_686877 ) ) ( not ( = ?auto_686876 ?auto_686878 ) ) ( not ( = ?auto_686876 ?auto_686879 ) ) ( not ( = ?auto_686877 ?auto_686878 ) ) ( not ( = ?auto_686877 ?auto_686879 ) ) ( not ( = ?auto_686878 ?auto_686879 ) ) ( ON ?auto_686877 ?auto_686878 ) ( ON ?auto_686876 ?auto_686877 ) ( ON ?auto_686875 ?auto_686876 ) ( ON ?auto_686874 ?auto_686875 ) ( ON ?auto_686873 ?auto_686874 ) ( ON ?auto_686872 ?auto_686873 ) ( ON ?auto_686871 ?auto_686872 ) ( ON ?auto_686870 ?auto_686871 ) ( CLEAR ?auto_686868 ) ( ON ?auto_686869 ?auto_686870 ) ( CLEAR ?auto_686869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_686862 ?auto_686863 ?auto_686864 ?auto_686865 ?auto_686866 ?auto_686867 ?auto_686868 ?auto_686869 )
      ( MAKE-17PILE ?auto_686862 ?auto_686863 ?auto_686864 ?auto_686865 ?auto_686866 ?auto_686867 ?auto_686868 ?auto_686869 ?auto_686870 ?auto_686871 ?auto_686872 ?auto_686873 ?auto_686874 ?auto_686875 ?auto_686876 ?auto_686877 ?auto_686878 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_686897 - BLOCK
      ?auto_686898 - BLOCK
      ?auto_686899 - BLOCK
      ?auto_686900 - BLOCK
      ?auto_686901 - BLOCK
      ?auto_686902 - BLOCK
      ?auto_686903 - BLOCK
      ?auto_686904 - BLOCK
      ?auto_686905 - BLOCK
      ?auto_686906 - BLOCK
      ?auto_686907 - BLOCK
      ?auto_686908 - BLOCK
      ?auto_686909 - BLOCK
      ?auto_686910 - BLOCK
      ?auto_686911 - BLOCK
      ?auto_686912 - BLOCK
      ?auto_686913 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_686913 ) ( ON-TABLE ?auto_686897 ) ( ON ?auto_686898 ?auto_686897 ) ( ON ?auto_686899 ?auto_686898 ) ( ON ?auto_686900 ?auto_686899 ) ( ON ?auto_686901 ?auto_686900 ) ( ON ?auto_686902 ?auto_686901 ) ( ON ?auto_686903 ?auto_686902 ) ( not ( = ?auto_686897 ?auto_686898 ) ) ( not ( = ?auto_686897 ?auto_686899 ) ) ( not ( = ?auto_686897 ?auto_686900 ) ) ( not ( = ?auto_686897 ?auto_686901 ) ) ( not ( = ?auto_686897 ?auto_686902 ) ) ( not ( = ?auto_686897 ?auto_686903 ) ) ( not ( = ?auto_686897 ?auto_686904 ) ) ( not ( = ?auto_686897 ?auto_686905 ) ) ( not ( = ?auto_686897 ?auto_686906 ) ) ( not ( = ?auto_686897 ?auto_686907 ) ) ( not ( = ?auto_686897 ?auto_686908 ) ) ( not ( = ?auto_686897 ?auto_686909 ) ) ( not ( = ?auto_686897 ?auto_686910 ) ) ( not ( = ?auto_686897 ?auto_686911 ) ) ( not ( = ?auto_686897 ?auto_686912 ) ) ( not ( = ?auto_686897 ?auto_686913 ) ) ( not ( = ?auto_686898 ?auto_686899 ) ) ( not ( = ?auto_686898 ?auto_686900 ) ) ( not ( = ?auto_686898 ?auto_686901 ) ) ( not ( = ?auto_686898 ?auto_686902 ) ) ( not ( = ?auto_686898 ?auto_686903 ) ) ( not ( = ?auto_686898 ?auto_686904 ) ) ( not ( = ?auto_686898 ?auto_686905 ) ) ( not ( = ?auto_686898 ?auto_686906 ) ) ( not ( = ?auto_686898 ?auto_686907 ) ) ( not ( = ?auto_686898 ?auto_686908 ) ) ( not ( = ?auto_686898 ?auto_686909 ) ) ( not ( = ?auto_686898 ?auto_686910 ) ) ( not ( = ?auto_686898 ?auto_686911 ) ) ( not ( = ?auto_686898 ?auto_686912 ) ) ( not ( = ?auto_686898 ?auto_686913 ) ) ( not ( = ?auto_686899 ?auto_686900 ) ) ( not ( = ?auto_686899 ?auto_686901 ) ) ( not ( = ?auto_686899 ?auto_686902 ) ) ( not ( = ?auto_686899 ?auto_686903 ) ) ( not ( = ?auto_686899 ?auto_686904 ) ) ( not ( = ?auto_686899 ?auto_686905 ) ) ( not ( = ?auto_686899 ?auto_686906 ) ) ( not ( = ?auto_686899 ?auto_686907 ) ) ( not ( = ?auto_686899 ?auto_686908 ) ) ( not ( = ?auto_686899 ?auto_686909 ) ) ( not ( = ?auto_686899 ?auto_686910 ) ) ( not ( = ?auto_686899 ?auto_686911 ) ) ( not ( = ?auto_686899 ?auto_686912 ) ) ( not ( = ?auto_686899 ?auto_686913 ) ) ( not ( = ?auto_686900 ?auto_686901 ) ) ( not ( = ?auto_686900 ?auto_686902 ) ) ( not ( = ?auto_686900 ?auto_686903 ) ) ( not ( = ?auto_686900 ?auto_686904 ) ) ( not ( = ?auto_686900 ?auto_686905 ) ) ( not ( = ?auto_686900 ?auto_686906 ) ) ( not ( = ?auto_686900 ?auto_686907 ) ) ( not ( = ?auto_686900 ?auto_686908 ) ) ( not ( = ?auto_686900 ?auto_686909 ) ) ( not ( = ?auto_686900 ?auto_686910 ) ) ( not ( = ?auto_686900 ?auto_686911 ) ) ( not ( = ?auto_686900 ?auto_686912 ) ) ( not ( = ?auto_686900 ?auto_686913 ) ) ( not ( = ?auto_686901 ?auto_686902 ) ) ( not ( = ?auto_686901 ?auto_686903 ) ) ( not ( = ?auto_686901 ?auto_686904 ) ) ( not ( = ?auto_686901 ?auto_686905 ) ) ( not ( = ?auto_686901 ?auto_686906 ) ) ( not ( = ?auto_686901 ?auto_686907 ) ) ( not ( = ?auto_686901 ?auto_686908 ) ) ( not ( = ?auto_686901 ?auto_686909 ) ) ( not ( = ?auto_686901 ?auto_686910 ) ) ( not ( = ?auto_686901 ?auto_686911 ) ) ( not ( = ?auto_686901 ?auto_686912 ) ) ( not ( = ?auto_686901 ?auto_686913 ) ) ( not ( = ?auto_686902 ?auto_686903 ) ) ( not ( = ?auto_686902 ?auto_686904 ) ) ( not ( = ?auto_686902 ?auto_686905 ) ) ( not ( = ?auto_686902 ?auto_686906 ) ) ( not ( = ?auto_686902 ?auto_686907 ) ) ( not ( = ?auto_686902 ?auto_686908 ) ) ( not ( = ?auto_686902 ?auto_686909 ) ) ( not ( = ?auto_686902 ?auto_686910 ) ) ( not ( = ?auto_686902 ?auto_686911 ) ) ( not ( = ?auto_686902 ?auto_686912 ) ) ( not ( = ?auto_686902 ?auto_686913 ) ) ( not ( = ?auto_686903 ?auto_686904 ) ) ( not ( = ?auto_686903 ?auto_686905 ) ) ( not ( = ?auto_686903 ?auto_686906 ) ) ( not ( = ?auto_686903 ?auto_686907 ) ) ( not ( = ?auto_686903 ?auto_686908 ) ) ( not ( = ?auto_686903 ?auto_686909 ) ) ( not ( = ?auto_686903 ?auto_686910 ) ) ( not ( = ?auto_686903 ?auto_686911 ) ) ( not ( = ?auto_686903 ?auto_686912 ) ) ( not ( = ?auto_686903 ?auto_686913 ) ) ( not ( = ?auto_686904 ?auto_686905 ) ) ( not ( = ?auto_686904 ?auto_686906 ) ) ( not ( = ?auto_686904 ?auto_686907 ) ) ( not ( = ?auto_686904 ?auto_686908 ) ) ( not ( = ?auto_686904 ?auto_686909 ) ) ( not ( = ?auto_686904 ?auto_686910 ) ) ( not ( = ?auto_686904 ?auto_686911 ) ) ( not ( = ?auto_686904 ?auto_686912 ) ) ( not ( = ?auto_686904 ?auto_686913 ) ) ( not ( = ?auto_686905 ?auto_686906 ) ) ( not ( = ?auto_686905 ?auto_686907 ) ) ( not ( = ?auto_686905 ?auto_686908 ) ) ( not ( = ?auto_686905 ?auto_686909 ) ) ( not ( = ?auto_686905 ?auto_686910 ) ) ( not ( = ?auto_686905 ?auto_686911 ) ) ( not ( = ?auto_686905 ?auto_686912 ) ) ( not ( = ?auto_686905 ?auto_686913 ) ) ( not ( = ?auto_686906 ?auto_686907 ) ) ( not ( = ?auto_686906 ?auto_686908 ) ) ( not ( = ?auto_686906 ?auto_686909 ) ) ( not ( = ?auto_686906 ?auto_686910 ) ) ( not ( = ?auto_686906 ?auto_686911 ) ) ( not ( = ?auto_686906 ?auto_686912 ) ) ( not ( = ?auto_686906 ?auto_686913 ) ) ( not ( = ?auto_686907 ?auto_686908 ) ) ( not ( = ?auto_686907 ?auto_686909 ) ) ( not ( = ?auto_686907 ?auto_686910 ) ) ( not ( = ?auto_686907 ?auto_686911 ) ) ( not ( = ?auto_686907 ?auto_686912 ) ) ( not ( = ?auto_686907 ?auto_686913 ) ) ( not ( = ?auto_686908 ?auto_686909 ) ) ( not ( = ?auto_686908 ?auto_686910 ) ) ( not ( = ?auto_686908 ?auto_686911 ) ) ( not ( = ?auto_686908 ?auto_686912 ) ) ( not ( = ?auto_686908 ?auto_686913 ) ) ( not ( = ?auto_686909 ?auto_686910 ) ) ( not ( = ?auto_686909 ?auto_686911 ) ) ( not ( = ?auto_686909 ?auto_686912 ) ) ( not ( = ?auto_686909 ?auto_686913 ) ) ( not ( = ?auto_686910 ?auto_686911 ) ) ( not ( = ?auto_686910 ?auto_686912 ) ) ( not ( = ?auto_686910 ?auto_686913 ) ) ( not ( = ?auto_686911 ?auto_686912 ) ) ( not ( = ?auto_686911 ?auto_686913 ) ) ( not ( = ?auto_686912 ?auto_686913 ) ) ( ON ?auto_686912 ?auto_686913 ) ( ON ?auto_686911 ?auto_686912 ) ( ON ?auto_686910 ?auto_686911 ) ( ON ?auto_686909 ?auto_686910 ) ( ON ?auto_686908 ?auto_686909 ) ( ON ?auto_686907 ?auto_686908 ) ( ON ?auto_686906 ?auto_686907 ) ( ON ?auto_686905 ?auto_686906 ) ( CLEAR ?auto_686903 ) ( ON ?auto_686904 ?auto_686905 ) ( CLEAR ?auto_686904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_686897 ?auto_686898 ?auto_686899 ?auto_686900 ?auto_686901 ?auto_686902 ?auto_686903 ?auto_686904 )
      ( MAKE-17PILE ?auto_686897 ?auto_686898 ?auto_686899 ?auto_686900 ?auto_686901 ?auto_686902 ?auto_686903 ?auto_686904 ?auto_686905 ?auto_686906 ?auto_686907 ?auto_686908 ?auto_686909 ?auto_686910 ?auto_686911 ?auto_686912 ?auto_686913 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_686931 - BLOCK
      ?auto_686932 - BLOCK
      ?auto_686933 - BLOCK
      ?auto_686934 - BLOCK
      ?auto_686935 - BLOCK
      ?auto_686936 - BLOCK
      ?auto_686937 - BLOCK
      ?auto_686938 - BLOCK
      ?auto_686939 - BLOCK
      ?auto_686940 - BLOCK
      ?auto_686941 - BLOCK
      ?auto_686942 - BLOCK
      ?auto_686943 - BLOCK
      ?auto_686944 - BLOCK
      ?auto_686945 - BLOCK
      ?auto_686946 - BLOCK
      ?auto_686947 - BLOCK
    )
    :vars
    (
      ?auto_686948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_686947 ?auto_686948 ) ( ON-TABLE ?auto_686931 ) ( ON ?auto_686932 ?auto_686931 ) ( ON ?auto_686933 ?auto_686932 ) ( ON ?auto_686934 ?auto_686933 ) ( ON ?auto_686935 ?auto_686934 ) ( ON ?auto_686936 ?auto_686935 ) ( not ( = ?auto_686931 ?auto_686932 ) ) ( not ( = ?auto_686931 ?auto_686933 ) ) ( not ( = ?auto_686931 ?auto_686934 ) ) ( not ( = ?auto_686931 ?auto_686935 ) ) ( not ( = ?auto_686931 ?auto_686936 ) ) ( not ( = ?auto_686931 ?auto_686937 ) ) ( not ( = ?auto_686931 ?auto_686938 ) ) ( not ( = ?auto_686931 ?auto_686939 ) ) ( not ( = ?auto_686931 ?auto_686940 ) ) ( not ( = ?auto_686931 ?auto_686941 ) ) ( not ( = ?auto_686931 ?auto_686942 ) ) ( not ( = ?auto_686931 ?auto_686943 ) ) ( not ( = ?auto_686931 ?auto_686944 ) ) ( not ( = ?auto_686931 ?auto_686945 ) ) ( not ( = ?auto_686931 ?auto_686946 ) ) ( not ( = ?auto_686931 ?auto_686947 ) ) ( not ( = ?auto_686931 ?auto_686948 ) ) ( not ( = ?auto_686932 ?auto_686933 ) ) ( not ( = ?auto_686932 ?auto_686934 ) ) ( not ( = ?auto_686932 ?auto_686935 ) ) ( not ( = ?auto_686932 ?auto_686936 ) ) ( not ( = ?auto_686932 ?auto_686937 ) ) ( not ( = ?auto_686932 ?auto_686938 ) ) ( not ( = ?auto_686932 ?auto_686939 ) ) ( not ( = ?auto_686932 ?auto_686940 ) ) ( not ( = ?auto_686932 ?auto_686941 ) ) ( not ( = ?auto_686932 ?auto_686942 ) ) ( not ( = ?auto_686932 ?auto_686943 ) ) ( not ( = ?auto_686932 ?auto_686944 ) ) ( not ( = ?auto_686932 ?auto_686945 ) ) ( not ( = ?auto_686932 ?auto_686946 ) ) ( not ( = ?auto_686932 ?auto_686947 ) ) ( not ( = ?auto_686932 ?auto_686948 ) ) ( not ( = ?auto_686933 ?auto_686934 ) ) ( not ( = ?auto_686933 ?auto_686935 ) ) ( not ( = ?auto_686933 ?auto_686936 ) ) ( not ( = ?auto_686933 ?auto_686937 ) ) ( not ( = ?auto_686933 ?auto_686938 ) ) ( not ( = ?auto_686933 ?auto_686939 ) ) ( not ( = ?auto_686933 ?auto_686940 ) ) ( not ( = ?auto_686933 ?auto_686941 ) ) ( not ( = ?auto_686933 ?auto_686942 ) ) ( not ( = ?auto_686933 ?auto_686943 ) ) ( not ( = ?auto_686933 ?auto_686944 ) ) ( not ( = ?auto_686933 ?auto_686945 ) ) ( not ( = ?auto_686933 ?auto_686946 ) ) ( not ( = ?auto_686933 ?auto_686947 ) ) ( not ( = ?auto_686933 ?auto_686948 ) ) ( not ( = ?auto_686934 ?auto_686935 ) ) ( not ( = ?auto_686934 ?auto_686936 ) ) ( not ( = ?auto_686934 ?auto_686937 ) ) ( not ( = ?auto_686934 ?auto_686938 ) ) ( not ( = ?auto_686934 ?auto_686939 ) ) ( not ( = ?auto_686934 ?auto_686940 ) ) ( not ( = ?auto_686934 ?auto_686941 ) ) ( not ( = ?auto_686934 ?auto_686942 ) ) ( not ( = ?auto_686934 ?auto_686943 ) ) ( not ( = ?auto_686934 ?auto_686944 ) ) ( not ( = ?auto_686934 ?auto_686945 ) ) ( not ( = ?auto_686934 ?auto_686946 ) ) ( not ( = ?auto_686934 ?auto_686947 ) ) ( not ( = ?auto_686934 ?auto_686948 ) ) ( not ( = ?auto_686935 ?auto_686936 ) ) ( not ( = ?auto_686935 ?auto_686937 ) ) ( not ( = ?auto_686935 ?auto_686938 ) ) ( not ( = ?auto_686935 ?auto_686939 ) ) ( not ( = ?auto_686935 ?auto_686940 ) ) ( not ( = ?auto_686935 ?auto_686941 ) ) ( not ( = ?auto_686935 ?auto_686942 ) ) ( not ( = ?auto_686935 ?auto_686943 ) ) ( not ( = ?auto_686935 ?auto_686944 ) ) ( not ( = ?auto_686935 ?auto_686945 ) ) ( not ( = ?auto_686935 ?auto_686946 ) ) ( not ( = ?auto_686935 ?auto_686947 ) ) ( not ( = ?auto_686935 ?auto_686948 ) ) ( not ( = ?auto_686936 ?auto_686937 ) ) ( not ( = ?auto_686936 ?auto_686938 ) ) ( not ( = ?auto_686936 ?auto_686939 ) ) ( not ( = ?auto_686936 ?auto_686940 ) ) ( not ( = ?auto_686936 ?auto_686941 ) ) ( not ( = ?auto_686936 ?auto_686942 ) ) ( not ( = ?auto_686936 ?auto_686943 ) ) ( not ( = ?auto_686936 ?auto_686944 ) ) ( not ( = ?auto_686936 ?auto_686945 ) ) ( not ( = ?auto_686936 ?auto_686946 ) ) ( not ( = ?auto_686936 ?auto_686947 ) ) ( not ( = ?auto_686936 ?auto_686948 ) ) ( not ( = ?auto_686937 ?auto_686938 ) ) ( not ( = ?auto_686937 ?auto_686939 ) ) ( not ( = ?auto_686937 ?auto_686940 ) ) ( not ( = ?auto_686937 ?auto_686941 ) ) ( not ( = ?auto_686937 ?auto_686942 ) ) ( not ( = ?auto_686937 ?auto_686943 ) ) ( not ( = ?auto_686937 ?auto_686944 ) ) ( not ( = ?auto_686937 ?auto_686945 ) ) ( not ( = ?auto_686937 ?auto_686946 ) ) ( not ( = ?auto_686937 ?auto_686947 ) ) ( not ( = ?auto_686937 ?auto_686948 ) ) ( not ( = ?auto_686938 ?auto_686939 ) ) ( not ( = ?auto_686938 ?auto_686940 ) ) ( not ( = ?auto_686938 ?auto_686941 ) ) ( not ( = ?auto_686938 ?auto_686942 ) ) ( not ( = ?auto_686938 ?auto_686943 ) ) ( not ( = ?auto_686938 ?auto_686944 ) ) ( not ( = ?auto_686938 ?auto_686945 ) ) ( not ( = ?auto_686938 ?auto_686946 ) ) ( not ( = ?auto_686938 ?auto_686947 ) ) ( not ( = ?auto_686938 ?auto_686948 ) ) ( not ( = ?auto_686939 ?auto_686940 ) ) ( not ( = ?auto_686939 ?auto_686941 ) ) ( not ( = ?auto_686939 ?auto_686942 ) ) ( not ( = ?auto_686939 ?auto_686943 ) ) ( not ( = ?auto_686939 ?auto_686944 ) ) ( not ( = ?auto_686939 ?auto_686945 ) ) ( not ( = ?auto_686939 ?auto_686946 ) ) ( not ( = ?auto_686939 ?auto_686947 ) ) ( not ( = ?auto_686939 ?auto_686948 ) ) ( not ( = ?auto_686940 ?auto_686941 ) ) ( not ( = ?auto_686940 ?auto_686942 ) ) ( not ( = ?auto_686940 ?auto_686943 ) ) ( not ( = ?auto_686940 ?auto_686944 ) ) ( not ( = ?auto_686940 ?auto_686945 ) ) ( not ( = ?auto_686940 ?auto_686946 ) ) ( not ( = ?auto_686940 ?auto_686947 ) ) ( not ( = ?auto_686940 ?auto_686948 ) ) ( not ( = ?auto_686941 ?auto_686942 ) ) ( not ( = ?auto_686941 ?auto_686943 ) ) ( not ( = ?auto_686941 ?auto_686944 ) ) ( not ( = ?auto_686941 ?auto_686945 ) ) ( not ( = ?auto_686941 ?auto_686946 ) ) ( not ( = ?auto_686941 ?auto_686947 ) ) ( not ( = ?auto_686941 ?auto_686948 ) ) ( not ( = ?auto_686942 ?auto_686943 ) ) ( not ( = ?auto_686942 ?auto_686944 ) ) ( not ( = ?auto_686942 ?auto_686945 ) ) ( not ( = ?auto_686942 ?auto_686946 ) ) ( not ( = ?auto_686942 ?auto_686947 ) ) ( not ( = ?auto_686942 ?auto_686948 ) ) ( not ( = ?auto_686943 ?auto_686944 ) ) ( not ( = ?auto_686943 ?auto_686945 ) ) ( not ( = ?auto_686943 ?auto_686946 ) ) ( not ( = ?auto_686943 ?auto_686947 ) ) ( not ( = ?auto_686943 ?auto_686948 ) ) ( not ( = ?auto_686944 ?auto_686945 ) ) ( not ( = ?auto_686944 ?auto_686946 ) ) ( not ( = ?auto_686944 ?auto_686947 ) ) ( not ( = ?auto_686944 ?auto_686948 ) ) ( not ( = ?auto_686945 ?auto_686946 ) ) ( not ( = ?auto_686945 ?auto_686947 ) ) ( not ( = ?auto_686945 ?auto_686948 ) ) ( not ( = ?auto_686946 ?auto_686947 ) ) ( not ( = ?auto_686946 ?auto_686948 ) ) ( not ( = ?auto_686947 ?auto_686948 ) ) ( ON ?auto_686946 ?auto_686947 ) ( ON ?auto_686945 ?auto_686946 ) ( ON ?auto_686944 ?auto_686945 ) ( ON ?auto_686943 ?auto_686944 ) ( ON ?auto_686942 ?auto_686943 ) ( ON ?auto_686941 ?auto_686942 ) ( ON ?auto_686940 ?auto_686941 ) ( ON ?auto_686939 ?auto_686940 ) ( ON ?auto_686938 ?auto_686939 ) ( CLEAR ?auto_686936 ) ( ON ?auto_686937 ?auto_686938 ) ( CLEAR ?auto_686937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_686931 ?auto_686932 ?auto_686933 ?auto_686934 ?auto_686935 ?auto_686936 ?auto_686937 )
      ( MAKE-17PILE ?auto_686931 ?auto_686932 ?auto_686933 ?auto_686934 ?auto_686935 ?auto_686936 ?auto_686937 ?auto_686938 ?auto_686939 ?auto_686940 ?auto_686941 ?auto_686942 ?auto_686943 ?auto_686944 ?auto_686945 ?auto_686946 ?auto_686947 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_686966 - BLOCK
      ?auto_686967 - BLOCK
      ?auto_686968 - BLOCK
      ?auto_686969 - BLOCK
      ?auto_686970 - BLOCK
      ?auto_686971 - BLOCK
      ?auto_686972 - BLOCK
      ?auto_686973 - BLOCK
      ?auto_686974 - BLOCK
      ?auto_686975 - BLOCK
      ?auto_686976 - BLOCK
      ?auto_686977 - BLOCK
      ?auto_686978 - BLOCK
      ?auto_686979 - BLOCK
      ?auto_686980 - BLOCK
      ?auto_686981 - BLOCK
      ?auto_686982 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_686982 ) ( ON-TABLE ?auto_686966 ) ( ON ?auto_686967 ?auto_686966 ) ( ON ?auto_686968 ?auto_686967 ) ( ON ?auto_686969 ?auto_686968 ) ( ON ?auto_686970 ?auto_686969 ) ( ON ?auto_686971 ?auto_686970 ) ( not ( = ?auto_686966 ?auto_686967 ) ) ( not ( = ?auto_686966 ?auto_686968 ) ) ( not ( = ?auto_686966 ?auto_686969 ) ) ( not ( = ?auto_686966 ?auto_686970 ) ) ( not ( = ?auto_686966 ?auto_686971 ) ) ( not ( = ?auto_686966 ?auto_686972 ) ) ( not ( = ?auto_686966 ?auto_686973 ) ) ( not ( = ?auto_686966 ?auto_686974 ) ) ( not ( = ?auto_686966 ?auto_686975 ) ) ( not ( = ?auto_686966 ?auto_686976 ) ) ( not ( = ?auto_686966 ?auto_686977 ) ) ( not ( = ?auto_686966 ?auto_686978 ) ) ( not ( = ?auto_686966 ?auto_686979 ) ) ( not ( = ?auto_686966 ?auto_686980 ) ) ( not ( = ?auto_686966 ?auto_686981 ) ) ( not ( = ?auto_686966 ?auto_686982 ) ) ( not ( = ?auto_686967 ?auto_686968 ) ) ( not ( = ?auto_686967 ?auto_686969 ) ) ( not ( = ?auto_686967 ?auto_686970 ) ) ( not ( = ?auto_686967 ?auto_686971 ) ) ( not ( = ?auto_686967 ?auto_686972 ) ) ( not ( = ?auto_686967 ?auto_686973 ) ) ( not ( = ?auto_686967 ?auto_686974 ) ) ( not ( = ?auto_686967 ?auto_686975 ) ) ( not ( = ?auto_686967 ?auto_686976 ) ) ( not ( = ?auto_686967 ?auto_686977 ) ) ( not ( = ?auto_686967 ?auto_686978 ) ) ( not ( = ?auto_686967 ?auto_686979 ) ) ( not ( = ?auto_686967 ?auto_686980 ) ) ( not ( = ?auto_686967 ?auto_686981 ) ) ( not ( = ?auto_686967 ?auto_686982 ) ) ( not ( = ?auto_686968 ?auto_686969 ) ) ( not ( = ?auto_686968 ?auto_686970 ) ) ( not ( = ?auto_686968 ?auto_686971 ) ) ( not ( = ?auto_686968 ?auto_686972 ) ) ( not ( = ?auto_686968 ?auto_686973 ) ) ( not ( = ?auto_686968 ?auto_686974 ) ) ( not ( = ?auto_686968 ?auto_686975 ) ) ( not ( = ?auto_686968 ?auto_686976 ) ) ( not ( = ?auto_686968 ?auto_686977 ) ) ( not ( = ?auto_686968 ?auto_686978 ) ) ( not ( = ?auto_686968 ?auto_686979 ) ) ( not ( = ?auto_686968 ?auto_686980 ) ) ( not ( = ?auto_686968 ?auto_686981 ) ) ( not ( = ?auto_686968 ?auto_686982 ) ) ( not ( = ?auto_686969 ?auto_686970 ) ) ( not ( = ?auto_686969 ?auto_686971 ) ) ( not ( = ?auto_686969 ?auto_686972 ) ) ( not ( = ?auto_686969 ?auto_686973 ) ) ( not ( = ?auto_686969 ?auto_686974 ) ) ( not ( = ?auto_686969 ?auto_686975 ) ) ( not ( = ?auto_686969 ?auto_686976 ) ) ( not ( = ?auto_686969 ?auto_686977 ) ) ( not ( = ?auto_686969 ?auto_686978 ) ) ( not ( = ?auto_686969 ?auto_686979 ) ) ( not ( = ?auto_686969 ?auto_686980 ) ) ( not ( = ?auto_686969 ?auto_686981 ) ) ( not ( = ?auto_686969 ?auto_686982 ) ) ( not ( = ?auto_686970 ?auto_686971 ) ) ( not ( = ?auto_686970 ?auto_686972 ) ) ( not ( = ?auto_686970 ?auto_686973 ) ) ( not ( = ?auto_686970 ?auto_686974 ) ) ( not ( = ?auto_686970 ?auto_686975 ) ) ( not ( = ?auto_686970 ?auto_686976 ) ) ( not ( = ?auto_686970 ?auto_686977 ) ) ( not ( = ?auto_686970 ?auto_686978 ) ) ( not ( = ?auto_686970 ?auto_686979 ) ) ( not ( = ?auto_686970 ?auto_686980 ) ) ( not ( = ?auto_686970 ?auto_686981 ) ) ( not ( = ?auto_686970 ?auto_686982 ) ) ( not ( = ?auto_686971 ?auto_686972 ) ) ( not ( = ?auto_686971 ?auto_686973 ) ) ( not ( = ?auto_686971 ?auto_686974 ) ) ( not ( = ?auto_686971 ?auto_686975 ) ) ( not ( = ?auto_686971 ?auto_686976 ) ) ( not ( = ?auto_686971 ?auto_686977 ) ) ( not ( = ?auto_686971 ?auto_686978 ) ) ( not ( = ?auto_686971 ?auto_686979 ) ) ( not ( = ?auto_686971 ?auto_686980 ) ) ( not ( = ?auto_686971 ?auto_686981 ) ) ( not ( = ?auto_686971 ?auto_686982 ) ) ( not ( = ?auto_686972 ?auto_686973 ) ) ( not ( = ?auto_686972 ?auto_686974 ) ) ( not ( = ?auto_686972 ?auto_686975 ) ) ( not ( = ?auto_686972 ?auto_686976 ) ) ( not ( = ?auto_686972 ?auto_686977 ) ) ( not ( = ?auto_686972 ?auto_686978 ) ) ( not ( = ?auto_686972 ?auto_686979 ) ) ( not ( = ?auto_686972 ?auto_686980 ) ) ( not ( = ?auto_686972 ?auto_686981 ) ) ( not ( = ?auto_686972 ?auto_686982 ) ) ( not ( = ?auto_686973 ?auto_686974 ) ) ( not ( = ?auto_686973 ?auto_686975 ) ) ( not ( = ?auto_686973 ?auto_686976 ) ) ( not ( = ?auto_686973 ?auto_686977 ) ) ( not ( = ?auto_686973 ?auto_686978 ) ) ( not ( = ?auto_686973 ?auto_686979 ) ) ( not ( = ?auto_686973 ?auto_686980 ) ) ( not ( = ?auto_686973 ?auto_686981 ) ) ( not ( = ?auto_686973 ?auto_686982 ) ) ( not ( = ?auto_686974 ?auto_686975 ) ) ( not ( = ?auto_686974 ?auto_686976 ) ) ( not ( = ?auto_686974 ?auto_686977 ) ) ( not ( = ?auto_686974 ?auto_686978 ) ) ( not ( = ?auto_686974 ?auto_686979 ) ) ( not ( = ?auto_686974 ?auto_686980 ) ) ( not ( = ?auto_686974 ?auto_686981 ) ) ( not ( = ?auto_686974 ?auto_686982 ) ) ( not ( = ?auto_686975 ?auto_686976 ) ) ( not ( = ?auto_686975 ?auto_686977 ) ) ( not ( = ?auto_686975 ?auto_686978 ) ) ( not ( = ?auto_686975 ?auto_686979 ) ) ( not ( = ?auto_686975 ?auto_686980 ) ) ( not ( = ?auto_686975 ?auto_686981 ) ) ( not ( = ?auto_686975 ?auto_686982 ) ) ( not ( = ?auto_686976 ?auto_686977 ) ) ( not ( = ?auto_686976 ?auto_686978 ) ) ( not ( = ?auto_686976 ?auto_686979 ) ) ( not ( = ?auto_686976 ?auto_686980 ) ) ( not ( = ?auto_686976 ?auto_686981 ) ) ( not ( = ?auto_686976 ?auto_686982 ) ) ( not ( = ?auto_686977 ?auto_686978 ) ) ( not ( = ?auto_686977 ?auto_686979 ) ) ( not ( = ?auto_686977 ?auto_686980 ) ) ( not ( = ?auto_686977 ?auto_686981 ) ) ( not ( = ?auto_686977 ?auto_686982 ) ) ( not ( = ?auto_686978 ?auto_686979 ) ) ( not ( = ?auto_686978 ?auto_686980 ) ) ( not ( = ?auto_686978 ?auto_686981 ) ) ( not ( = ?auto_686978 ?auto_686982 ) ) ( not ( = ?auto_686979 ?auto_686980 ) ) ( not ( = ?auto_686979 ?auto_686981 ) ) ( not ( = ?auto_686979 ?auto_686982 ) ) ( not ( = ?auto_686980 ?auto_686981 ) ) ( not ( = ?auto_686980 ?auto_686982 ) ) ( not ( = ?auto_686981 ?auto_686982 ) ) ( ON ?auto_686981 ?auto_686982 ) ( ON ?auto_686980 ?auto_686981 ) ( ON ?auto_686979 ?auto_686980 ) ( ON ?auto_686978 ?auto_686979 ) ( ON ?auto_686977 ?auto_686978 ) ( ON ?auto_686976 ?auto_686977 ) ( ON ?auto_686975 ?auto_686976 ) ( ON ?auto_686974 ?auto_686975 ) ( ON ?auto_686973 ?auto_686974 ) ( CLEAR ?auto_686971 ) ( ON ?auto_686972 ?auto_686973 ) ( CLEAR ?auto_686972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_686966 ?auto_686967 ?auto_686968 ?auto_686969 ?auto_686970 ?auto_686971 ?auto_686972 )
      ( MAKE-17PILE ?auto_686966 ?auto_686967 ?auto_686968 ?auto_686969 ?auto_686970 ?auto_686971 ?auto_686972 ?auto_686973 ?auto_686974 ?auto_686975 ?auto_686976 ?auto_686977 ?auto_686978 ?auto_686979 ?auto_686980 ?auto_686981 ?auto_686982 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_687000 - BLOCK
      ?auto_687001 - BLOCK
      ?auto_687002 - BLOCK
      ?auto_687003 - BLOCK
      ?auto_687004 - BLOCK
      ?auto_687005 - BLOCK
      ?auto_687006 - BLOCK
      ?auto_687007 - BLOCK
      ?auto_687008 - BLOCK
      ?auto_687009 - BLOCK
      ?auto_687010 - BLOCK
      ?auto_687011 - BLOCK
      ?auto_687012 - BLOCK
      ?auto_687013 - BLOCK
      ?auto_687014 - BLOCK
      ?auto_687015 - BLOCK
      ?auto_687016 - BLOCK
    )
    :vars
    (
      ?auto_687017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_687016 ?auto_687017 ) ( ON-TABLE ?auto_687000 ) ( ON ?auto_687001 ?auto_687000 ) ( ON ?auto_687002 ?auto_687001 ) ( ON ?auto_687003 ?auto_687002 ) ( ON ?auto_687004 ?auto_687003 ) ( not ( = ?auto_687000 ?auto_687001 ) ) ( not ( = ?auto_687000 ?auto_687002 ) ) ( not ( = ?auto_687000 ?auto_687003 ) ) ( not ( = ?auto_687000 ?auto_687004 ) ) ( not ( = ?auto_687000 ?auto_687005 ) ) ( not ( = ?auto_687000 ?auto_687006 ) ) ( not ( = ?auto_687000 ?auto_687007 ) ) ( not ( = ?auto_687000 ?auto_687008 ) ) ( not ( = ?auto_687000 ?auto_687009 ) ) ( not ( = ?auto_687000 ?auto_687010 ) ) ( not ( = ?auto_687000 ?auto_687011 ) ) ( not ( = ?auto_687000 ?auto_687012 ) ) ( not ( = ?auto_687000 ?auto_687013 ) ) ( not ( = ?auto_687000 ?auto_687014 ) ) ( not ( = ?auto_687000 ?auto_687015 ) ) ( not ( = ?auto_687000 ?auto_687016 ) ) ( not ( = ?auto_687000 ?auto_687017 ) ) ( not ( = ?auto_687001 ?auto_687002 ) ) ( not ( = ?auto_687001 ?auto_687003 ) ) ( not ( = ?auto_687001 ?auto_687004 ) ) ( not ( = ?auto_687001 ?auto_687005 ) ) ( not ( = ?auto_687001 ?auto_687006 ) ) ( not ( = ?auto_687001 ?auto_687007 ) ) ( not ( = ?auto_687001 ?auto_687008 ) ) ( not ( = ?auto_687001 ?auto_687009 ) ) ( not ( = ?auto_687001 ?auto_687010 ) ) ( not ( = ?auto_687001 ?auto_687011 ) ) ( not ( = ?auto_687001 ?auto_687012 ) ) ( not ( = ?auto_687001 ?auto_687013 ) ) ( not ( = ?auto_687001 ?auto_687014 ) ) ( not ( = ?auto_687001 ?auto_687015 ) ) ( not ( = ?auto_687001 ?auto_687016 ) ) ( not ( = ?auto_687001 ?auto_687017 ) ) ( not ( = ?auto_687002 ?auto_687003 ) ) ( not ( = ?auto_687002 ?auto_687004 ) ) ( not ( = ?auto_687002 ?auto_687005 ) ) ( not ( = ?auto_687002 ?auto_687006 ) ) ( not ( = ?auto_687002 ?auto_687007 ) ) ( not ( = ?auto_687002 ?auto_687008 ) ) ( not ( = ?auto_687002 ?auto_687009 ) ) ( not ( = ?auto_687002 ?auto_687010 ) ) ( not ( = ?auto_687002 ?auto_687011 ) ) ( not ( = ?auto_687002 ?auto_687012 ) ) ( not ( = ?auto_687002 ?auto_687013 ) ) ( not ( = ?auto_687002 ?auto_687014 ) ) ( not ( = ?auto_687002 ?auto_687015 ) ) ( not ( = ?auto_687002 ?auto_687016 ) ) ( not ( = ?auto_687002 ?auto_687017 ) ) ( not ( = ?auto_687003 ?auto_687004 ) ) ( not ( = ?auto_687003 ?auto_687005 ) ) ( not ( = ?auto_687003 ?auto_687006 ) ) ( not ( = ?auto_687003 ?auto_687007 ) ) ( not ( = ?auto_687003 ?auto_687008 ) ) ( not ( = ?auto_687003 ?auto_687009 ) ) ( not ( = ?auto_687003 ?auto_687010 ) ) ( not ( = ?auto_687003 ?auto_687011 ) ) ( not ( = ?auto_687003 ?auto_687012 ) ) ( not ( = ?auto_687003 ?auto_687013 ) ) ( not ( = ?auto_687003 ?auto_687014 ) ) ( not ( = ?auto_687003 ?auto_687015 ) ) ( not ( = ?auto_687003 ?auto_687016 ) ) ( not ( = ?auto_687003 ?auto_687017 ) ) ( not ( = ?auto_687004 ?auto_687005 ) ) ( not ( = ?auto_687004 ?auto_687006 ) ) ( not ( = ?auto_687004 ?auto_687007 ) ) ( not ( = ?auto_687004 ?auto_687008 ) ) ( not ( = ?auto_687004 ?auto_687009 ) ) ( not ( = ?auto_687004 ?auto_687010 ) ) ( not ( = ?auto_687004 ?auto_687011 ) ) ( not ( = ?auto_687004 ?auto_687012 ) ) ( not ( = ?auto_687004 ?auto_687013 ) ) ( not ( = ?auto_687004 ?auto_687014 ) ) ( not ( = ?auto_687004 ?auto_687015 ) ) ( not ( = ?auto_687004 ?auto_687016 ) ) ( not ( = ?auto_687004 ?auto_687017 ) ) ( not ( = ?auto_687005 ?auto_687006 ) ) ( not ( = ?auto_687005 ?auto_687007 ) ) ( not ( = ?auto_687005 ?auto_687008 ) ) ( not ( = ?auto_687005 ?auto_687009 ) ) ( not ( = ?auto_687005 ?auto_687010 ) ) ( not ( = ?auto_687005 ?auto_687011 ) ) ( not ( = ?auto_687005 ?auto_687012 ) ) ( not ( = ?auto_687005 ?auto_687013 ) ) ( not ( = ?auto_687005 ?auto_687014 ) ) ( not ( = ?auto_687005 ?auto_687015 ) ) ( not ( = ?auto_687005 ?auto_687016 ) ) ( not ( = ?auto_687005 ?auto_687017 ) ) ( not ( = ?auto_687006 ?auto_687007 ) ) ( not ( = ?auto_687006 ?auto_687008 ) ) ( not ( = ?auto_687006 ?auto_687009 ) ) ( not ( = ?auto_687006 ?auto_687010 ) ) ( not ( = ?auto_687006 ?auto_687011 ) ) ( not ( = ?auto_687006 ?auto_687012 ) ) ( not ( = ?auto_687006 ?auto_687013 ) ) ( not ( = ?auto_687006 ?auto_687014 ) ) ( not ( = ?auto_687006 ?auto_687015 ) ) ( not ( = ?auto_687006 ?auto_687016 ) ) ( not ( = ?auto_687006 ?auto_687017 ) ) ( not ( = ?auto_687007 ?auto_687008 ) ) ( not ( = ?auto_687007 ?auto_687009 ) ) ( not ( = ?auto_687007 ?auto_687010 ) ) ( not ( = ?auto_687007 ?auto_687011 ) ) ( not ( = ?auto_687007 ?auto_687012 ) ) ( not ( = ?auto_687007 ?auto_687013 ) ) ( not ( = ?auto_687007 ?auto_687014 ) ) ( not ( = ?auto_687007 ?auto_687015 ) ) ( not ( = ?auto_687007 ?auto_687016 ) ) ( not ( = ?auto_687007 ?auto_687017 ) ) ( not ( = ?auto_687008 ?auto_687009 ) ) ( not ( = ?auto_687008 ?auto_687010 ) ) ( not ( = ?auto_687008 ?auto_687011 ) ) ( not ( = ?auto_687008 ?auto_687012 ) ) ( not ( = ?auto_687008 ?auto_687013 ) ) ( not ( = ?auto_687008 ?auto_687014 ) ) ( not ( = ?auto_687008 ?auto_687015 ) ) ( not ( = ?auto_687008 ?auto_687016 ) ) ( not ( = ?auto_687008 ?auto_687017 ) ) ( not ( = ?auto_687009 ?auto_687010 ) ) ( not ( = ?auto_687009 ?auto_687011 ) ) ( not ( = ?auto_687009 ?auto_687012 ) ) ( not ( = ?auto_687009 ?auto_687013 ) ) ( not ( = ?auto_687009 ?auto_687014 ) ) ( not ( = ?auto_687009 ?auto_687015 ) ) ( not ( = ?auto_687009 ?auto_687016 ) ) ( not ( = ?auto_687009 ?auto_687017 ) ) ( not ( = ?auto_687010 ?auto_687011 ) ) ( not ( = ?auto_687010 ?auto_687012 ) ) ( not ( = ?auto_687010 ?auto_687013 ) ) ( not ( = ?auto_687010 ?auto_687014 ) ) ( not ( = ?auto_687010 ?auto_687015 ) ) ( not ( = ?auto_687010 ?auto_687016 ) ) ( not ( = ?auto_687010 ?auto_687017 ) ) ( not ( = ?auto_687011 ?auto_687012 ) ) ( not ( = ?auto_687011 ?auto_687013 ) ) ( not ( = ?auto_687011 ?auto_687014 ) ) ( not ( = ?auto_687011 ?auto_687015 ) ) ( not ( = ?auto_687011 ?auto_687016 ) ) ( not ( = ?auto_687011 ?auto_687017 ) ) ( not ( = ?auto_687012 ?auto_687013 ) ) ( not ( = ?auto_687012 ?auto_687014 ) ) ( not ( = ?auto_687012 ?auto_687015 ) ) ( not ( = ?auto_687012 ?auto_687016 ) ) ( not ( = ?auto_687012 ?auto_687017 ) ) ( not ( = ?auto_687013 ?auto_687014 ) ) ( not ( = ?auto_687013 ?auto_687015 ) ) ( not ( = ?auto_687013 ?auto_687016 ) ) ( not ( = ?auto_687013 ?auto_687017 ) ) ( not ( = ?auto_687014 ?auto_687015 ) ) ( not ( = ?auto_687014 ?auto_687016 ) ) ( not ( = ?auto_687014 ?auto_687017 ) ) ( not ( = ?auto_687015 ?auto_687016 ) ) ( not ( = ?auto_687015 ?auto_687017 ) ) ( not ( = ?auto_687016 ?auto_687017 ) ) ( ON ?auto_687015 ?auto_687016 ) ( ON ?auto_687014 ?auto_687015 ) ( ON ?auto_687013 ?auto_687014 ) ( ON ?auto_687012 ?auto_687013 ) ( ON ?auto_687011 ?auto_687012 ) ( ON ?auto_687010 ?auto_687011 ) ( ON ?auto_687009 ?auto_687010 ) ( ON ?auto_687008 ?auto_687009 ) ( ON ?auto_687007 ?auto_687008 ) ( ON ?auto_687006 ?auto_687007 ) ( CLEAR ?auto_687004 ) ( ON ?auto_687005 ?auto_687006 ) ( CLEAR ?auto_687005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_687000 ?auto_687001 ?auto_687002 ?auto_687003 ?auto_687004 ?auto_687005 )
      ( MAKE-17PILE ?auto_687000 ?auto_687001 ?auto_687002 ?auto_687003 ?auto_687004 ?auto_687005 ?auto_687006 ?auto_687007 ?auto_687008 ?auto_687009 ?auto_687010 ?auto_687011 ?auto_687012 ?auto_687013 ?auto_687014 ?auto_687015 ?auto_687016 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_687035 - BLOCK
      ?auto_687036 - BLOCK
      ?auto_687037 - BLOCK
      ?auto_687038 - BLOCK
      ?auto_687039 - BLOCK
      ?auto_687040 - BLOCK
      ?auto_687041 - BLOCK
      ?auto_687042 - BLOCK
      ?auto_687043 - BLOCK
      ?auto_687044 - BLOCK
      ?auto_687045 - BLOCK
      ?auto_687046 - BLOCK
      ?auto_687047 - BLOCK
      ?auto_687048 - BLOCK
      ?auto_687049 - BLOCK
      ?auto_687050 - BLOCK
      ?auto_687051 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_687051 ) ( ON-TABLE ?auto_687035 ) ( ON ?auto_687036 ?auto_687035 ) ( ON ?auto_687037 ?auto_687036 ) ( ON ?auto_687038 ?auto_687037 ) ( ON ?auto_687039 ?auto_687038 ) ( not ( = ?auto_687035 ?auto_687036 ) ) ( not ( = ?auto_687035 ?auto_687037 ) ) ( not ( = ?auto_687035 ?auto_687038 ) ) ( not ( = ?auto_687035 ?auto_687039 ) ) ( not ( = ?auto_687035 ?auto_687040 ) ) ( not ( = ?auto_687035 ?auto_687041 ) ) ( not ( = ?auto_687035 ?auto_687042 ) ) ( not ( = ?auto_687035 ?auto_687043 ) ) ( not ( = ?auto_687035 ?auto_687044 ) ) ( not ( = ?auto_687035 ?auto_687045 ) ) ( not ( = ?auto_687035 ?auto_687046 ) ) ( not ( = ?auto_687035 ?auto_687047 ) ) ( not ( = ?auto_687035 ?auto_687048 ) ) ( not ( = ?auto_687035 ?auto_687049 ) ) ( not ( = ?auto_687035 ?auto_687050 ) ) ( not ( = ?auto_687035 ?auto_687051 ) ) ( not ( = ?auto_687036 ?auto_687037 ) ) ( not ( = ?auto_687036 ?auto_687038 ) ) ( not ( = ?auto_687036 ?auto_687039 ) ) ( not ( = ?auto_687036 ?auto_687040 ) ) ( not ( = ?auto_687036 ?auto_687041 ) ) ( not ( = ?auto_687036 ?auto_687042 ) ) ( not ( = ?auto_687036 ?auto_687043 ) ) ( not ( = ?auto_687036 ?auto_687044 ) ) ( not ( = ?auto_687036 ?auto_687045 ) ) ( not ( = ?auto_687036 ?auto_687046 ) ) ( not ( = ?auto_687036 ?auto_687047 ) ) ( not ( = ?auto_687036 ?auto_687048 ) ) ( not ( = ?auto_687036 ?auto_687049 ) ) ( not ( = ?auto_687036 ?auto_687050 ) ) ( not ( = ?auto_687036 ?auto_687051 ) ) ( not ( = ?auto_687037 ?auto_687038 ) ) ( not ( = ?auto_687037 ?auto_687039 ) ) ( not ( = ?auto_687037 ?auto_687040 ) ) ( not ( = ?auto_687037 ?auto_687041 ) ) ( not ( = ?auto_687037 ?auto_687042 ) ) ( not ( = ?auto_687037 ?auto_687043 ) ) ( not ( = ?auto_687037 ?auto_687044 ) ) ( not ( = ?auto_687037 ?auto_687045 ) ) ( not ( = ?auto_687037 ?auto_687046 ) ) ( not ( = ?auto_687037 ?auto_687047 ) ) ( not ( = ?auto_687037 ?auto_687048 ) ) ( not ( = ?auto_687037 ?auto_687049 ) ) ( not ( = ?auto_687037 ?auto_687050 ) ) ( not ( = ?auto_687037 ?auto_687051 ) ) ( not ( = ?auto_687038 ?auto_687039 ) ) ( not ( = ?auto_687038 ?auto_687040 ) ) ( not ( = ?auto_687038 ?auto_687041 ) ) ( not ( = ?auto_687038 ?auto_687042 ) ) ( not ( = ?auto_687038 ?auto_687043 ) ) ( not ( = ?auto_687038 ?auto_687044 ) ) ( not ( = ?auto_687038 ?auto_687045 ) ) ( not ( = ?auto_687038 ?auto_687046 ) ) ( not ( = ?auto_687038 ?auto_687047 ) ) ( not ( = ?auto_687038 ?auto_687048 ) ) ( not ( = ?auto_687038 ?auto_687049 ) ) ( not ( = ?auto_687038 ?auto_687050 ) ) ( not ( = ?auto_687038 ?auto_687051 ) ) ( not ( = ?auto_687039 ?auto_687040 ) ) ( not ( = ?auto_687039 ?auto_687041 ) ) ( not ( = ?auto_687039 ?auto_687042 ) ) ( not ( = ?auto_687039 ?auto_687043 ) ) ( not ( = ?auto_687039 ?auto_687044 ) ) ( not ( = ?auto_687039 ?auto_687045 ) ) ( not ( = ?auto_687039 ?auto_687046 ) ) ( not ( = ?auto_687039 ?auto_687047 ) ) ( not ( = ?auto_687039 ?auto_687048 ) ) ( not ( = ?auto_687039 ?auto_687049 ) ) ( not ( = ?auto_687039 ?auto_687050 ) ) ( not ( = ?auto_687039 ?auto_687051 ) ) ( not ( = ?auto_687040 ?auto_687041 ) ) ( not ( = ?auto_687040 ?auto_687042 ) ) ( not ( = ?auto_687040 ?auto_687043 ) ) ( not ( = ?auto_687040 ?auto_687044 ) ) ( not ( = ?auto_687040 ?auto_687045 ) ) ( not ( = ?auto_687040 ?auto_687046 ) ) ( not ( = ?auto_687040 ?auto_687047 ) ) ( not ( = ?auto_687040 ?auto_687048 ) ) ( not ( = ?auto_687040 ?auto_687049 ) ) ( not ( = ?auto_687040 ?auto_687050 ) ) ( not ( = ?auto_687040 ?auto_687051 ) ) ( not ( = ?auto_687041 ?auto_687042 ) ) ( not ( = ?auto_687041 ?auto_687043 ) ) ( not ( = ?auto_687041 ?auto_687044 ) ) ( not ( = ?auto_687041 ?auto_687045 ) ) ( not ( = ?auto_687041 ?auto_687046 ) ) ( not ( = ?auto_687041 ?auto_687047 ) ) ( not ( = ?auto_687041 ?auto_687048 ) ) ( not ( = ?auto_687041 ?auto_687049 ) ) ( not ( = ?auto_687041 ?auto_687050 ) ) ( not ( = ?auto_687041 ?auto_687051 ) ) ( not ( = ?auto_687042 ?auto_687043 ) ) ( not ( = ?auto_687042 ?auto_687044 ) ) ( not ( = ?auto_687042 ?auto_687045 ) ) ( not ( = ?auto_687042 ?auto_687046 ) ) ( not ( = ?auto_687042 ?auto_687047 ) ) ( not ( = ?auto_687042 ?auto_687048 ) ) ( not ( = ?auto_687042 ?auto_687049 ) ) ( not ( = ?auto_687042 ?auto_687050 ) ) ( not ( = ?auto_687042 ?auto_687051 ) ) ( not ( = ?auto_687043 ?auto_687044 ) ) ( not ( = ?auto_687043 ?auto_687045 ) ) ( not ( = ?auto_687043 ?auto_687046 ) ) ( not ( = ?auto_687043 ?auto_687047 ) ) ( not ( = ?auto_687043 ?auto_687048 ) ) ( not ( = ?auto_687043 ?auto_687049 ) ) ( not ( = ?auto_687043 ?auto_687050 ) ) ( not ( = ?auto_687043 ?auto_687051 ) ) ( not ( = ?auto_687044 ?auto_687045 ) ) ( not ( = ?auto_687044 ?auto_687046 ) ) ( not ( = ?auto_687044 ?auto_687047 ) ) ( not ( = ?auto_687044 ?auto_687048 ) ) ( not ( = ?auto_687044 ?auto_687049 ) ) ( not ( = ?auto_687044 ?auto_687050 ) ) ( not ( = ?auto_687044 ?auto_687051 ) ) ( not ( = ?auto_687045 ?auto_687046 ) ) ( not ( = ?auto_687045 ?auto_687047 ) ) ( not ( = ?auto_687045 ?auto_687048 ) ) ( not ( = ?auto_687045 ?auto_687049 ) ) ( not ( = ?auto_687045 ?auto_687050 ) ) ( not ( = ?auto_687045 ?auto_687051 ) ) ( not ( = ?auto_687046 ?auto_687047 ) ) ( not ( = ?auto_687046 ?auto_687048 ) ) ( not ( = ?auto_687046 ?auto_687049 ) ) ( not ( = ?auto_687046 ?auto_687050 ) ) ( not ( = ?auto_687046 ?auto_687051 ) ) ( not ( = ?auto_687047 ?auto_687048 ) ) ( not ( = ?auto_687047 ?auto_687049 ) ) ( not ( = ?auto_687047 ?auto_687050 ) ) ( not ( = ?auto_687047 ?auto_687051 ) ) ( not ( = ?auto_687048 ?auto_687049 ) ) ( not ( = ?auto_687048 ?auto_687050 ) ) ( not ( = ?auto_687048 ?auto_687051 ) ) ( not ( = ?auto_687049 ?auto_687050 ) ) ( not ( = ?auto_687049 ?auto_687051 ) ) ( not ( = ?auto_687050 ?auto_687051 ) ) ( ON ?auto_687050 ?auto_687051 ) ( ON ?auto_687049 ?auto_687050 ) ( ON ?auto_687048 ?auto_687049 ) ( ON ?auto_687047 ?auto_687048 ) ( ON ?auto_687046 ?auto_687047 ) ( ON ?auto_687045 ?auto_687046 ) ( ON ?auto_687044 ?auto_687045 ) ( ON ?auto_687043 ?auto_687044 ) ( ON ?auto_687042 ?auto_687043 ) ( ON ?auto_687041 ?auto_687042 ) ( CLEAR ?auto_687039 ) ( ON ?auto_687040 ?auto_687041 ) ( CLEAR ?auto_687040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_687035 ?auto_687036 ?auto_687037 ?auto_687038 ?auto_687039 ?auto_687040 )
      ( MAKE-17PILE ?auto_687035 ?auto_687036 ?auto_687037 ?auto_687038 ?auto_687039 ?auto_687040 ?auto_687041 ?auto_687042 ?auto_687043 ?auto_687044 ?auto_687045 ?auto_687046 ?auto_687047 ?auto_687048 ?auto_687049 ?auto_687050 ?auto_687051 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_687069 - BLOCK
      ?auto_687070 - BLOCK
      ?auto_687071 - BLOCK
      ?auto_687072 - BLOCK
      ?auto_687073 - BLOCK
      ?auto_687074 - BLOCK
      ?auto_687075 - BLOCK
      ?auto_687076 - BLOCK
      ?auto_687077 - BLOCK
      ?auto_687078 - BLOCK
      ?auto_687079 - BLOCK
      ?auto_687080 - BLOCK
      ?auto_687081 - BLOCK
      ?auto_687082 - BLOCK
      ?auto_687083 - BLOCK
      ?auto_687084 - BLOCK
      ?auto_687085 - BLOCK
    )
    :vars
    (
      ?auto_687086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_687085 ?auto_687086 ) ( ON-TABLE ?auto_687069 ) ( ON ?auto_687070 ?auto_687069 ) ( ON ?auto_687071 ?auto_687070 ) ( ON ?auto_687072 ?auto_687071 ) ( not ( = ?auto_687069 ?auto_687070 ) ) ( not ( = ?auto_687069 ?auto_687071 ) ) ( not ( = ?auto_687069 ?auto_687072 ) ) ( not ( = ?auto_687069 ?auto_687073 ) ) ( not ( = ?auto_687069 ?auto_687074 ) ) ( not ( = ?auto_687069 ?auto_687075 ) ) ( not ( = ?auto_687069 ?auto_687076 ) ) ( not ( = ?auto_687069 ?auto_687077 ) ) ( not ( = ?auto_687069 ?auto_687078 ) ) ( not ( = ?auto_687069 ?auto_687079 ) ) ( not ( = ?auto_687069 ?auto_687080 ) ) ( not ( = ?auto_687069 ?auto_687081 ) ) ( not ( = ?auto_687069 ?auto_687082 ) ) ( not ( = ?auto_687069 ?auto_687083 ) ) ( not ( = ?auto_687069 ?auto_687084 ) ) ( not ( = ?auto_687069 ?auto_687085 ) ) ( not ( = ?auto_687069 ?auto_687086 ) ) ( not ( = ?auto_687070 ?auto_687071 ) ) ( not ( = ?auto_687070 ?auto_687072 ) ) ( not ( = ?auto_687070 ?auto_687073 ) ) ( not ( = ?auto_687070 ?auto_687074 ) ) ( not ( = ?auto_687070 ?auto_687075 ) ) ( not ( = ?auto_687070 ?auto_687076 ) ) ( not ( = ?auto_687070 ?auto_687077 ) ) ( not ( = ?auto_687070 ?auto_687078 ) ) ( not ( = ?auto_687070 ?auto_687079 ) ) ( not ( = ?auto_687070 ?auto_687080 ) ) ( not ( = ?auto_687070 ?auto_687081 ) ) ( not ( = ?auto_687070 ?auto_687082 ) ) ( not ( = ?auto_687070 ?auto_687083 ) ) ( not ( = ?auto_687070 ?auto_687084 ) ) ( not ( = ?auto_687070 ?auto_687085 ) ) ( not ( = ?auto_687070 ?auto_687086 ) ) ( not ( = ?auto_687071 ?auto_687072 ) ) ( not ( = ?auto_687071 ?auto_687073 ) ) ( not ( = ?auto_687071 ?auto_687074 ) ) ( not ( = ?auto_687071 ?auto_687075 ) ) ( not ( = ?auto_687071 ?auto_687076 ) ) ( not ( = ?auto_687071 ?auto_687077 ) ) ( not ( = ?auto_687071 ?auto_687078 ) ) ( not ( = ?auto_687071 ?auto_687079 ) ) ( not ( = ?auto_687071 ?auto_687080 ) ) ( not ( = ?auto_687071 ?auto_687081 ) ) ( not ( = ?auto_687071 ?auto_687082 ) ) ( not ( = ?auto_687071 ?auto_687083 ) ) ( not ( = ?auto_687071 ?auto_687084 ) ) ( not ( = ?auto_687071 ?auto_687085 ) ) ( not ( = ?auto_687071 ?auto_687086 ) ) ( not ( = ?auto_687072 ?auto_687073 ) ) ( not ( = ?auto_687072 ?auto_687074 ) ) ( not ( = ?auto_687072 ?auto_687075 ) ) ( not ( = ?auto_687072 ?auto_687076 ) ) ( not ( = ?auto_687072 ?auto_687077 ) ) ( not ( = ?auto_687072 ?auto_687078 ) ) ( not ( = ?auto_687072 ?auto_687079 ) ) ( not ( = ?auto_687072 ?auto_687080 ) ) ( not ( = ?auto_687072 ?auto_687081 ) ) ( not ( = ?auto_687072 ?auto_687082 ) ) ( not ( = ?auto_687072 ?auto_687083 ) ) ( not ( = ?auto_687072 ?auto_687084 ) ) ( not ( = ?auto_687072 ?auto_687085 ) ) ( not ( = ?auto_687072 ?auto_687086 ) ) ( not ( = ?auto_687073 ?auto_687074 ) ) ( not ( = ?auto_687073 ?auto_687075 ) ) ( not ( = ?auto_687073 ?auto_687076 ) ) ( not ( = ?auto_687073 ?auto_687077 ) ) ( not ( = ?auto_687073 ?auto_687078 ) ) ( not ( = ?auto_687073 ?auto_687079 ) ) ( not ( = ?auto_687073 ?auto_687080 ) ) ( not ( = ?auto_687073 ?auto_687081 ) ) ( not ( = ?auto_687073 ?auto_687082 ) ) ( not ( = ?auto_687073 ?auto_687083 ) ) ( not ( = ?auto_687073 ?auto_687084 ) ) ( not ( = ?auto_687073 ?auto_687085 ) ) ( not ( = ?auto_687073 ?auto_687086 ) ) ( not ( = ?auto_687074 ?auto_687075 ) ) ( not ( = ?auto_687074 ?auto_687076 ) ) ( not ( = ?auto_687074 ?auto_687077 ) ) ( not ( = ?auto_687074 ?auto_687078 ) ) ( not ( = ?auto_687074 ?auto_687079 ) ) ( not ( = ?auto_687074 ?auto_687080 ) ) ( not ( = ?auto_687074 ?auto_687081 ) ) ( not ( = ?auto_687074 ?auto_687082 ) ) ( not ( = ?auto_687074 ?auto_687083 ) ) ( not ( = ?auto_687074 ?auto_687084 ) ) ( not ( = ?auto_687074 ?auto_687085 ) ) ( not ( = ?auto_687074 ?auto_687086 ) ) ( not ( = ?auto_687075 ?auto_687076 ) ) ( not ( = ?auto_687075 ?auto_687077 ) ) ( not ( = ?auto_687075 ?auto_687078 ) ) ( not ( = ?auto_687075 ?auto_687079 ) ) ( not ( = ?auto_687075 ?auto_687080 ) ) ( not ( = ?auto_687075 ?auto_687081 ) ) ( not ( = ?auto_687075 ?auto_687082 ) ) ( not ( = ?auto_687075 ?auto_687083 ) ) ( not ( = ?auto_687075 ?auto_687084 ) ) ( not ( = ?auto_687075 ?auto_687085 ) ) ( not ( = ?auto_687075 ?auto_687086 ) ) ( not ( = ?auto_687076 ?auto_687077 ) ) ( not ( = ?auto_687076 ?auto_687078 ) ) ( not ( = ?auto_687076 ?auto_687079 ) ) ( not ( = ?auto_687076 ?auto_687080 ) ) ( not ( = ?auto_687076 ?auto_687081 ) ) ( not ( = ?auto_687076 ?auto_687082 ) ) ( not ( = ?auto_687076 ?auto_687083 ) ) ( not ( = ?auto_687076 ?auto_687084 ) ) ( not ( = ?auto_687076 ?auto_687085 ) ) ( not ( = ?auto_687076 ?auto_687086 ) ) ( not ( = ?auto_687077 ?auto_687078 ) ) ( not ( = ?auto_687077 ?auto_687079 ) ) ( not ( = ?auto_687077 ?auto_687080 ) ) ( not ( = ?auto_687077 ?auto_687081 ) ) ( not ( = ?auto_687077 ?auto_687082 ) ) ( not ( = ?auto_687077 ?auto_687083 ) ) ( not ( = ?auto_687077 ?auto_687084 ) ) ( not ( = ?auto_687077 ?auto_687085 ) ) ( not ( = ?auto_687077 ?auto_687086 ) ) ( not ( = ?auto_687078 ?auto_687079 ) ) ( not ( = ?auto_687078 ?auto_687080 ) ) ( not ( = ?auto_687078 ?auto_687081 ) ) ( not ( = ?auto_687078 ?auto_687082 ) ) ( not ( = ?auto_687078 ?auto_687083 ) ) ( not ( = ?auto_687078 ?auto_687084 ) ) ( not ( = ?auto_687078 ?auto_687085 ) ) ( not ( = ?auto_687078 ?auto_687086 ) ) ( not ( = ?auto_687079 ?auto_687080 ) ) ( not ( = ?auto_687079 ?auto_687081 ) ) ( not ( = ?auto_687079 ?auto_687082 ) ) ( not ( = ?auto_687079 ?auto_687083 ) ) ( not ( = ?auto_687079 ?auto_687084 ) ) ( not ( = ?auto_687079 ?auto_687085 ) ) ( not ( = ?auto_687079 ?auto_687086 ) ) ( not ( = ?auto_687080 ?auto_687081 ) ) ( not ( = ?auto_687080 ?auto_687082 ) ) ( not ( = ?auto_687080 ?auto_687083 ) ) ( not ( = ?auto_687080 ?auto_687084 ) ) ( not ( = ?auto_687080 ?auto_687085 ) ) ( not ( = ?auto_687080 ?auto_687086 ) ) ( not ( = ?auto_687081 ?auto_687082 ) ) ( not ( = ?auto_687081 ?auto_687083 ) ) ( not ( = ?auto_687081 ?auto_687084 ) ) ( not ( = ?auto_687081 ?auto_687085 ) ) ( not ( = ?auto_687081 ?auto_687086 ) ) ( not ( = ?auto_687082 ?auto_687083 ) ) ( not ( = ?auto_687082 ?auto_687084 ) ) ( not ( = ?auto_687082 ?auto_687085 ) ) ( not ( = ?auto_687082 ?auto_687086 ) ) ( not ( = ?auto_687083 ?auto_687084 ) ) ( not ( = ?auto_687083 ?auto_687085 ) ) ( not ( = ?auto_687083 ?auto_687086 ) ) ( not ( = ?auto_687084 ?auto_687085 ) ) ( not ( = ?auto_687084 ?auto_687086 ) ) ( not ( = ?auto_687085 ?auto_687086 ) ) ( ON ?auto_687084 ?auto_687085 ) ( ON ?auto_687083 ?auto_687084 ) ( ON ?auto_687082 ?auto_687083 ) ( ON ?auto_687081 ?auto_687082 ) ( ON ?auto_687080 ?auto_687081 ) ( ON ?auto_687079 ?auto_687080 ) ( ON ?auto_687078 ?auto_687079 ) ( ON ?auto_687077 ?auto_687078 ) ( ON ?auto_687076 ?auto_687077 ) ( ON ?auto_687075 ?auto_687076 ) ( ON ?auto_687074 ?auto_687075 ) ( CLEAR ?auto_687072 ) ( ON ?auto_687073 ?auto_687074 ) ( CLEAR ?auto_687073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_687069 ?auto_687070 ?auto_687071 ?auto_687072 ?auto_687073 )
      ( MAKE-17PILE ?auto_687069 ?auto_687070 ?auto_687071 ?auto_687072 ?auto_687073 ?auto_687074 ?auto_687075 ?auto_687076 ?auto_687077 ?auto_687078 ?auto_687079 ?auto_687080 ?auto_687081 ?auto_687082 ?auto_687083 ?auto_687084 ?auto_687085 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_687104 - BLOCK
      ?auto_687105 - BLOCK
      ?auto_687106 - BLOCK
      ?auto_687107 - BLOCK
      ?auto_687108 - BLOCK
      ?auto_687109 - BLOCK
      ?auto_687110 - BLOCK
      ?auto_687111 - BLOCK
      ?auto_687112 - BLOCK
      ?auto_687113 - BLOCK
      ?auto_687114 - BLOCK
      ?auto_687115 - BLOCK
      ?auto_687116 - BLOCK
      ?auto_687117 - BLOCK
      ?auto_687118 - BLOCK
      ?auto_687119 - BLOCK
      ?auto_687120 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_687120 ) ( ON-TABLE ?auto_687104 ) ( ON ?auto_687105 ?auto_687104 ) ( ON ?auto_687106 ?auto_687105 ) ( ON ?auto_687107 ?auto_687106 ) ( not ( = ?auto_687104 ?auto_687105 ) ) ( not ( = ?auto_687104 ?auto_687106 ) ) ( not ( = ?auto_687104 ?auto_687107 ) ) ( not ( = ?auto_687104 ?auto_687108 ) ) ( not ( = ?auto_687104 ?auto_687109 ) ) ( not ( = ?auto_687104 ?auto_687110 ) ) ( not ( = ?auto_687104 ?auto_687111 ) ) ( not ( = ?auto_687104 ?auto_687112 ) ) ( not ( = ?auto_687104 ?auto_687113 ) ) ( not ( = ?auto_687104 ?auto_687114 ) ) ( not ( = ?auto_687104 ?auto_687115 ) ) ( not ( = ?auto_687104 ?auto_687116 ) ) ( not ( = ?auto_687104 ?auto_687117 ) ) ( not ( = ?auto_687104 ?auto_687118 ) ) ( not ( = ?auto_687104 ?auto_687119 ) ) ( not ( = ?auto_687104 ?auto_687120 ) ) ( not ( = ?auto_687105 ?auto_687106 ) ) ( not ( = ?auto_687105 ?auto_687107 ) ) ( not ( = ?auto_687105 ?auto_687108 ) ) ( not ( = ?auto_687105 ?auto_687109 ) ) ( not ( = ?auto_687105 ?auto_687110 ) ) ( not ( = ?auto_687105 ?auto_687111 ) ) ( not ( = ?auto_687105 ?auto_687112 ) ) ( not ( = ?auto_687105 ?auto_687113 ) ) ( not ( = ?auto_687105 ?auto_687114 ) ) ( not ( = ?auto_687105 ?auto_687115 ) ) ( not ( = ?auto_687105 ?auto_687116 ) ) ( not ( = ?auto_687105 ?auto_687117 ) ) ( not ( = ?auto_687105 ?auto_687118 ) ) ( not ( = ?auto_687105 ?auto_687119 ) ) ( not ( = ?auto_687105 ?auto_687120 ) ) ( not ( = ?auto_687106 ?auto_687107 ) ) ( not ( = ?auto_687106 ?auto_687108 ) ) ( not ( = ?auto_687106 ?auto_687109 ) ) ( not ( = ?auto_687106 ?auto_687110 ) ) ( not ( = ?auto_687106 ?auto_687111 ) ) ( not ( = ?auto_687106 ?auto_687112 ) ) ( not ( = ?auto_687106 ?auto_687113 ) ) ( not ( = ?auto_687106 ?auto_687114 ) ) ( not ( = ?auto_687106 ?auto_687115 ) ) ( not ( = ?auto_687106 ?auto_687116 ) ) ( not ( = ?auto_687106 ?auto_687117 ) ) ( not ( = ?auto_687106 ?auto_687118 ) ) ( not ( = ?auto_687106 ?auto_687119 ) ) ( not ( = ?auto_687106 ?auto_687120 ) ) ( not ( = ?auto_687107 ?auto_687108 ) ) ( not ( = ?auto_687107 ?auto_687109 ) ) ( not ( = ?auto_687107 ?auto_687110 ) ) ( not ( = ?auto_687107 ?auto_687111 ) ) ( not ( = ?auto_687107 ?auto_687112 ) ) ( not ( = ?auto_687107 ?auto_687113 ) ) ( not ( = ?auto_687107 ?auto_687114 ) ) ( not ( = ?auto_687107 ?auto_687115 ) ) ( not ( = ?auto_687107 ?auto_687116 ) ) ( not ( = ?auto_687107 ?auto_687117 ) ) ( not ( = ?auto_687107 ?auto_687118 ) ) ( not ( = ?auto_687107 ?auto_687119 ) ) ( not ( = ?auto_687107 ?auto_687120 ) ) ( not ( = ?auto_687108 ?auto_687109 ) ) ( not ( = ?auto_687108 ?auto_687110 ) ) ( not ( = ?auto_687108 ?auto_687111 ) ) ( not ( = ?auto_687108 ?auto_687112 ) ) ( not ( = ?auto_687108 ?auto_687113 ) ) ( not ( = ?auto_687108 ?auto_687114 ) ) ( not ( = ?auto_687108 ?auto_687115 ) ) ( not ( = ?auto_687108 ?auto_687116 ) ) ( not ( = ?auto_687108 ?auto_687117 ) ) ( not ( = ?auto_687108 ?auto_687118 ) ) ( not ( = ?auto_687108 ?auto_687119 ) ) ( not ( = ?auto_687108 ?auto_687120 ) ) ( not ( = ?auto_687109 ?auto_687110 ) ) ( not ( = ?auto_687109 ?auto_687111 ) ) ( not ( = ?auto_687109 ?auto_687112 ) ) ( not ( = ?auto_687109 ?auto_687113 ) ) ( not ( = ?auto_687109 ?auto_687114 ) ) ( not ( = ?auto_687109 ?auto_687115 ) ) ( not ( = ?auto_687109 ?auto_687116 ) ) ( not ( = ?auto_687109 ?auto_687117 ) ) ( not ( = ?auto_687109 ?auto_687118 ) ) ( not ( = ?auto_687109 ?auto_687119 ) ) ( not ( = ?auto_687109 ?auto_687120 ) ) ( not ( = ?auto_687110 ?auto_687111 ) ) ( not ( = ?auto_687110 ?auto_687112 ) ) ( not ( = ?auto_687110 ?auto_687113 ) ) ( not ( = ?auto_687110 ?auto_687114 ) ) ( not ( = ?auto_687110 ?auto_687115 ) ) ( not ( = ?auto_687110 ?auto_687116 ) ) ( not ( = ?auto_687110 ?auto_687117 ) ) ( not ( = ?auto_687110 ?auto_687118 ) ) ( not ( = ?auto_687110 ?auto_687119 ) ) ( not ( = ?auto_687110 ?auto_687120 ) ) ( not ( = ?auto_687111 ?auto_687112 ) ) ( not ( = ?auto_687111 ?auto_687113 ) ) ( not ( = ?auto_687111 ?auto_687114 ) ) ( not ( = ?auto_687111 ?auto_687115 ) ) ( not ( = ?auto_687111 ?auto_687116 ) ) ( not ( = ?auto_687111 ?auto_687117 ) ) ( not ( = ?auto_687111 ?auto_687118 ) ) ( not ( = ?auto_687111 ?auto_687119 ) ) ( not ( = ?auto_687111 ?auto_687120 ) ) ( not ( = ?auto_687112 ?auto_687113 ) ) ( not ( = ?auto_687112 ?auto_687114 ) ) ( not ( = ?auto_687112 ?auto_687115 ) ) ( not ( = ?auto_687112 ?auto_687116 ) ) ( not ( = ?auto_687112 ?auto_687117 ) ) ( not ( = ?auto_687112 ?auto_687118 ) ) ( not ( = ?auto_687112 ?auto_687119 ) ) ( not ( = ?auto_687112 ?auto_687120 ) ) ( not ( = ?auto_687113 ?auto_687114 ) ) ( not ( = ?auto_687113 ?auto_687115 ) ) ( not ( = ?auto_687113 ?auto_687116 ) ) ( not ( = ?auto_687113 ?auto_687117 ) ) ( not ( = ?auto_687113 ?auto_687118 ) ) ( not ( = ?auto_687113 ?auto_687119 ) ) ( not ( = ?auto_687113 ?auto_687120 ) ) ( not ( = ?auto_687114 ?auto_687115 ) ) ( not ( = ?auto_687114 ?auto_687116 ) ) ( not ( = ?auto_687114 ?auto_687117 ) ) ( not ( = ?auto_687114 ?auto_687118 ) ) ( not ( = ?auto_687114 ?auto_687119 ) ) ( not ( = ?auto_687114 ?auto_687120 ) ) ( not ( = ?auto_687115 ?auto_687116 ) ) ( not ( = ?auto_687115 ?auto_687117 ) ) ( not ( = ?auto_687115 ?auto_687118 ) ) ( not ( = ?auto_687115 ?auto_687119 ) ) ( not ( = ?auto_687115 ?auto_687120 ) ) ( not ( = ?auto_687116 ?auto_687117 ) ) ( not ( = ?auto_687116 ?auto_687118 ) ) ( not ( = ?auto_687116 ?auto_687119 ) ) ( not ( = ?auto_687116 ?auto_687120 ) ) ( not ( = ?auto_687117 ?auto_687118 ) ) ( not ( = ?auto_687117 ?auto_687119 ) ) ( not ( = ?auto_687117 ?auto_687120 ) ) ( not ( = ?auto_687118 ?auto_687119 ) ) ( not ( = ?auto_687118 ?auto_687120 ) ) ( not ( = ?auto_687119 ?auto_687120 ) ) ( ON ?auto_687119 ?auto_687120 ) ( ON ?auto_687118 ?auto_687119 ) ( ON ?auto_687117 ?auto_687118 ) ( ON ?auto_687116 ?auto_687117 ) ( ON ?auto_687115 ?auto_687116 ) ( ON ?auto_687114 ?auto_687115 ) ( ON ?auto_687113 ?auto_687114 ) ( ON ?auto_687112 ?auto_687113 ) ( ON ?auto_687111 ?auto_687112 ) ( ON ?auto_687110 ?auto_687111 ) ( ON ?auto_687109 ?auto_687110 ) ( CLEAR ?auto_687107 ) ( ON ?auto_687108 ?auto_687109 ) ( CLEAR ?auto_687108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_687104 ?auto_687105 ?auto_687106 ?auto_687107 ?auto_687108 )
      ( MAKE-17PILE ?auto_687104 ?auto_687105 ?auto_687106 ?auto_687107 ?auto_687108 ?auto_687109 ?auto_687110 ?auto_687111 ?auto_687112 ?auto_687113 ?auto_687114 ?auto_687115 ?auto_687116 ?auto_687117 ?auto_687118 ?auto_687119 ?auto_687120 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_687138 - BLOCK
      ?auto_687139 - BLOCK
      ?auto_687140 - BLOCK
      ?auto_687141 - BLOCK
      ?auto_687142 - BLOCK
      ?auto_687143 - BLOCK
      ?auto_687144 - BLOCK
      ?auto_687145 - BLOCK
      ?auto_687146 - BLOCK
      ?auto_687147 - BLOCK
      ?auto_687148 - BLOCK
      ?auto_687149 - BLOCK
      ?auto_687150 - BLOCK
      ?auto_687151 - BLOCK
      ?auto_687152 - BLOCK
      ?auto_687153 - BLOCK
      ?auto_687154 - BLOCK
    )
    :vars
    (
      ?auto_687155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_687154 ?auto_687155 ) ( ON-TABLE ?auto_687138 ) ( ON ?auto_687139 ?auto_687138 ) ( ON ?auto_687140 ?auto_687139 ) ( not ( = ?auto_687138 ?auto_687139 ) ) ( not ( = ?auto_687138 ?auto_687140 ) ) ( not ( = ?auto_687138 ?auto_687141 ) ) ( not ( = ?auto_687138 ?auto_687142 ) ) ( not ( = ?auto_687138 ?auto_687143 ) ) ( not ( = ?auto_687138 ?auto_687144 ) ) ( not ( = ?auto_687138 ?auto_687145 ) ) ( not ( = ?auto_687138 ?auto_687146 ) ) ( not ( = ?auto_687138 ?auto_687147 ) ) ( not ( = ?auto_687138 ?auto_687148 ) ) ( not ( = ?auto_687138 ?auto_687149 ) ) ( not ( = ?auto_687138 ?auto_687150 ) ) ( not ( = ?auto_687138 ?auto_687151 ) ) ( not ( = ?auto_687138 ?auto_687152 ) ) ( not ( = ?auto_687138 ?auto_687153 ) ) ( not ( = ?auto_687138 ?auto_687154 ) ) ( not ( = ?auto_687138 ?auto_687155 ) ) ( not ( = ?auto_687139 ?auto_687140 ) ) ( not ( = ?auto_687139 ?auto_687141 ) ) ( not ( = ?auto_687139 ?auto_687142 ) ) ( not ( = ?auto_687139 ?auto_687143 ) ) ( not ( = ?auto_687139 ?auto_687144 ) ) ( not ( = ?auto_687139 ?auto_687145 ) ) ( not ( = ?auto_687139 ?auto_687146 ) ) ( not ( = ?auto_687139 ?auto_687147 ) ) ( not ( = ?auto_687139 ?auto_687148 ) ) ( not ( = ?auto_687139 ?auto_687149 ) ) ( not ( = ?auto_687139 ?auto_687150 ) ) ( not ( = ?auto_687139 ?auto_687151 ) ) ( not ( = ?auto_687139 ?auto_687152 ) ) ( not ( = ?auto_687139 ?auto_687153 ) ) ( not ( = ?auto_687139 ?auto_687154 ) ) ( not ( = ?auto_687139 ?auto_687155 ) ) ( not ( = ?auto_687140 ?auto_687141 ) ) ( not ( = ?auto_687140 ?auto_687142 ) ) ( not ( = ?auto_687140 ?auto_687143 ) ) ( not ( = ?auto_687140 ?auto_687144 ) ) ( not ( = ?auto_687140 ?auto_687145 ) ) ( not ( = ?auto_687140 ?auto_687146 ) ) ( not ( = ?auto_687140 ?auto_687147 ) ) ( not ( = ?auto_687140 ?auto_687148 ) ) ( not ( = ?auto_687140 ?auto_687149 ) ) ( not ( = ?auto_687140 ?auto_687150 ) ) ( not ( = ?auto_687140 ?auto_687151 ) ) ( not ( = ?auto_687140 ?auto_687152 ) ) ( not ( = ?auto_687140 ?auto_687153 ) ) ( not ( = ?auto_687140 ?auto_687154 ) ) ( not ( = ?auto_687140 ?auto_687155 ) ) ( not ( = ?auto_687141 ?auto_687142 ) ) ( not ( = ?auto_687141 ?auto_687143 ) ) ( not ( = ?auto_687141 ?auto_687144 ) ) ( not ( = ?auto_687141 ?auto_687145 ) ) ( not ( = ?auto_687141 ?auto_687146 ) ) ( not ( = ?auto_687141 ?auto_687147 ) ) ( not ( = ?auto_687141 ?auto_687148 ) ) ( not ( = ?auto_687141 ?auto_687149 ) ) ( not ( = ?auto_687141 ?auto_687150 ) ) ( not ( = ?auto_687141 ?auto_687151 ) ) ( not ( = ?auto_687141 ?auto_687152 ) ) ( not ( = ?auto_687141 ?auto_687153 ) ) ( not ( = ?auto_687141 ?auto_687154 ) ) ( not ( = ?auto_687141 ?auto_687155 ) ) ( not ( = ?auto_687142 ?auto_687143 ) ) ( not ( = ?auto_687142 ?auto_687144 ) ) ( not ( = ?auto_687142 ?auto_687145 ) ) ( not ( = ?auto_687142 ?auto_687146 ) ) ( not ( = ?auto_687142 ?auto_687147 ) ) ( not ( = ?auto_687142 ?auto_687148 ) ) ( not ( = ?auto_687142 ?auto_687149 ) ) ( not ( = ?auto_687142 ?auto_687150 ) ) ( not ( = ?auto_687142 ?auto_687151 ) ) ( not ( = ?auto_687142 ?auto_687152 ) ) ( not ( = ?auto_687142 ?auto_687153 ) ) ( not ( = ?auto_687142 ?auto_687154 ) ) ( not ( = ?auto_687142 ?auto_687155 ) ) ( not ( = ?auto_687143 ?auto_687144 ) ) ( not ( = ?auto_687143 ?auto_687145 ) ) ( not ( = ?auto_687143 ?auto_687146 ) ) ( not ( = ?auto_687143 ?auto_687147 ) ) ( not ( = ?auto_687143 ?auto_687148 ) ) ( not ( = ?auto_687143 ?auto_687149 ) ) ( not ( = ?auto_687143 ?auto_687150 ) ) ( not ( = ?auto_687143 ?auto_687151 ) ) ( not ( = ?auto_687143 ?auto_687152 ) ) ( not ( = ?auto_687143 ?auto_687153 ) ) ( not ( = ?auto_687143 ?auto_687154 ) ) ( not ( = ?auto_687143 ?auto_687155 ) ) ( not ( = ?auto_687144 ?auto_687145 ) ) ( not ( = ?auto_687144 ?auto_687146 ) ) ( not ( = ?auto_687144 ?auto_687147 ) ) ( not ( = ?auto_687144 ?auto_687148 ) ) ( not ( = ?auto_687144 ?auto_687149 ) ) ( not ( = ?auto_687144 ?auto_687150 ) ) ( not ( = ?auto_687144 ?auto_687151 ) ) ( not ( = ?auto_687144 ?auto_687152 ) ) ( not ( = ?auto_687144 ?auto_687153 ) ) ( not ( = ?auto_687144 ?auto_687154 ) ) ( not ( = ?auto_687144 ?auto_687155 ) ) ( not ( = ?auto_687145 ?auto_687146 ) ) ( not ( = ?auto_687145 ?auto_687147 ) ) ( not ( = ?auto_687145 ?auto_687148 ) ) ( not ( = ?auto_687145 ?auto_687149 ) ) ( not ( = ?auto_687145 ?auto_687150 ) ) ( not ( = ?auto_687145 ?auto_687151 ) ) ( not ( = ?auto_687145 ?auto_687152 ) ) ( not ( = ?auto_687145 ?auto_687153 ) ) ( not ( = ?auto_687145 ?auto_687154 ) ) ( not ( = ?auto_687145 ?auto_687155 ) ) ( not ( = ?auto_687146 ?auto_687147 ) ) ( not ( = ?auto_687146 ?auto_687148 ) ) ( not ( = ?auto_687146 ?auto_687149 ) ) ( not ( = ?auto_687146 ?auto_687150 ) ) ( not ( = ?auto_687146 ?auto_687151 ) ) ( not ( = ?auto_687146 ?auto_687152 ) ) ( not ( = ?auto_687146 ?auto_687153 ) ) ( not ( = ?auto_687146 ?auto_687154 ) ) ( not ( = ?auto_687146 ?auto_687155 ) ) ( not ( = ?auto_687147 ?auto_687148 ) ) ( not ( = ?auto_687147 ?auto_687149 ) ) ( not ( = ?auto_687147 ?auto_687150 ) ) ( not ( = ?auto_687147 ?auto_687151 ) ) ( not ( = ?auto_687147 ?auto_687152 ) ) ( not ( = ?auto_687147 ?auto_687153 ) ) ( not ( = ?auto_687147 ?auto_687154 ) ) ( not ( = ?auto_687147 ?auto_687155 ) ) ( not ( = ?auto_687148 ?auto_687149 ) ) ( not ( = ?auto_687148 ?auto_687150 ) ) ( not ( = ?auto_687148 ?auto_687151 ) ) ( not ( = ?auto_687148 ?auto_687152 ) ) ( not ( = ?auto_687148 ?auto_687153 ) ) ( not ( = ?auto_687148 ?auto_687154 ) ) ( not ( = ?auto_687148 ?auto_687155 ) ) ( not ( = ?auto_687149 ?auto_687150 ) ) ( not ( = ?auto_687149 ?auto_687151 ) ) ( not ( = ?auto_687149 ?auto_687152 ) ) ( not ( = ?auto_687149 ?auto_687153 ) ) ( not ( = ?auto_687149 ?auto_687154 ) ) ( not ( = ?auto_687149 ?auto_687155 ) ) ( not ( = ?auto_687150 ?auto_687151 ) ) ( not ( = ?auto_687150 ?auto_687152 ) ) ( not ( = ?auto_687150 ?auto_687153 ) ) ( not ( = ?auto_687150 ?auto_687154 ) ) ( not ( = ?auto_687150 ?auto_687155 ) ) ( not ( = ?auto_687151 ?auto_687152 ) ) ( not ( = ?auto_687151 ?auto_687153 ) ) ( not ( = ?auto_687151 ?auto_687154 ) ) ( not ( = ?auto_687151 ?auto_687155 ) ) ( not ( = ?auto_687152 ?auto_687153 ) ) ( not ( = ?auto_687152 ?auto_687154 ) ) ( not ( = ?auto_687152 ?auto_687155 ) ) ( not ( = ?auto_687153 ?auto_687154 ) ) ( not ( = ?auto_687153 ?auto_687155 ) ) ( not ( = ?auto_687154 ?auto_687155 ) ) ( ON ?auto_687153 ?auto_687154 ) ( ON ?auto_687152 ?auto_687153 ) ( ON ?auto_687151 ?auto_687152 ) ( ON ?auto_687150 ?auto_687151 ) ( ON ?auto_687149 ?auto_687150 ) ( ON ?auto_687148 ?auto_687149 ) ( ON ?auto_687147 ?auto_687148 ) ( ON ?auto_687146 ?auto_687147 ) ( ON ?auto_687145 ?auto_687146 ) ( ON ?auto_687144 ?auto_687145 ) ( ON ?auto_687143 ?auto_687144 ) ( ON ?auto_687142 ?auto_687143 ) ( CLEAR ?auto_687140 ) ( ON ?auto_687141 ?auto_687142 ) ( CLEAR ?auto_687141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_687138 ?auto_687139 ?auto_687140 ?auto_687141 )
      ( MAKE-17PILE ?auto_687138 ?auto_687139 ?auto_687140 ?auto_687141 ?auto_687142 ?auto_687143 ?auto_687144 ?auto_687145 ?auto_687146 ?auto_687147 ?auto_687148 ?auto_687149 ?auto_687150 ?auto_687151 ?auto_687152 ?auto_687153 ?auto_687154 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_687173 - BLOCK
      ?auto_687174 - BLOCK
      ?auto_687175 - BLOCK
      ?auto_687176 - BLOCK
      ?auto_687177 - BLOCK
      ?auto_687178 - BLOCK
      ?auto_687179 - BLOCK
      ?auto_687180 - BLOCK
      ?auto_687181 - BLOCK
      ?auto_687182 - BLOCK
      ?auto_687183 - BLOCK
      ?auto_687184 - BLOCK
      ?auto_687185 - BLOCK
      ?auto_687186 - BLOCK
      ?auto_687187 - BLOCK
      ?auto_687188 - BLOCK
      ?auto_687189 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_687189 ) ( ON-TABLE ?auto_687173 ) ( ON ?auto_687174 ?auto_687173 ) ( ON ?auto_687175 ?auto_687174 ) ( not ( = ?auto_687173 ?auto_687174 ) ) ( not ( = ?auto_687173 ?auto_687175 ) ) ( not ( = ?auto_687173 ?auto_687176 ) ) ( not ( = ?auto_687173 ?auto_687177 ) ) ( not ( = ?auto_687173 ?auto_687178 ) ) ( not ( = ?auto_687173 ?auto_687179 ) ) ( not ( = ?auto_687173 ?auto_687180 ) ) ( not ( = ?auto_687173 ?auto_687181 ) ) ( not ( = ?auto_687173 ?auto_687182 ) ) ( not ( = ?auto_687173 ?auto_687183 ) ) ( not ( = ?auto_687173 ?auto_687184 ) ) ( not ( = ?auto_687173 ?auto_687185 ) ) ( not ( = ?auto_687173 ?auto_687186 ) ) ( not ( = ?auto_687173 ?auto_687187 ) ) ( not ( = ?auto_687173 ?auto_687188 ) ) ( not ( = ?auto_687173 ?auto_687189 ) ) ( not ( = ?auto_687174 ?auto_687175 ) ) ( not ( = ?auto_687174 ?auto_687176 ) ) ( not ( = ?auto_687174 ?auto_687177 ) ) ( not ( = ?auto_687174 ?auto_687178 ) ) ( not ( = ?auto_687174 ?auto_687179 ) ) ( not ( = ?auto_687174 ?auto_687180 ) ) ( not ( = ?auto_687174 ?auto_687181 ) ) ( not ( = ?auto_687174 ?auto_687182 ) ) ( not ( = ?auto_687174 ?auto_687183 ) ) ( not ( = ?auto_687174 ?auto_687184 ) ) ( not ( = ?auto_687174 ?auto_687185 ) ) ( not ( = ?auto_687174 ?auto_687186 ) ) ( not ( = ?auto_687174 ?auto_687187 ) ) ( not ( = ?auto_687174 ?auto_687188 ) ) ( not ( = ?auto_687174 ?auto_687189 ) ) ( not ( = ?auto_687175 ?auto_687176 ) ) ( not ( = ?auto_687175 ?auto_687177 ) ) ( not ( = ?auto_687175 ?auto_687178 ) ) ( not ( = ?auto_687175 ?auto_687179 ) ) ( not ( = ?auto_687175 ?auto_687180 ) ) ( not ( = ?auto_687175 ?auto_687181 ) ) ( not ( = ?auto_687175 ?auto_687182 ) ) ( not ( = ?auto_687175 ?auto_687183 ) ) ( not ( = ?auto_687175 ?auto_687184 ) ) ( not ( = ?auto_687175 ?auto_687185 ) ) ( not ( = ?auto_687175 ?auto_687186 ) ) ( not ( = ?auto_687175 ?auto_687187 ) ) ( not ( = ?auto_687175 ?auto_687188 ) ) ( not ( = ?auto_687175 ?auto_687189 ) ) ( not ( = ?auto_687176 ?auto_687177 ) ) ( not ( = ?auto_687176 ?auto_687178 ) ) ( not ( = ?auto_687176 ?auto_687179 ) ) ( not ( = ?auto_687176 ?auto_687180 ) ) ( not ( = ?auto_687176 ?auto_687181 ) ) ( not ( = ?auto_687176 ?auto_687182 ) ) ( not ( = ?auto_687176 ?auto_687183 ) ) ( not ( = ?auto_687176 ?auto_687184 ) ) ( not ( = ?auto_687176 ?auto_687185 ) ) ( not ( = ?auto_687176 ?auto_687186 ) ) ( not ( = ?auto_687176 ?auto_687187 ) ) ( not ( = ?auto_687176 ?auto_687188 ) ) ( not ( = ?auto_687176 ?auto_687189 ) ) ( not ( = ?auto_687177 ?auto_687178 ) ) ( not ( = ?auto_687177 ?auto_687179 ) ) ( not ( = ?auto_687177 ?auto_687180 ) ) ( not ( = ?auto_687177 ?auto_687181 ) ) ( not ( = ?auto_687177 ?auto_687182 ) ) ( not ( = ?auto_687177 ?auto_687183 ) ) ( not ( = ?auto_687177 ?auto_687184 ) ) ( not ( = ?auto_687177 ?auto_687185 ) ) ( not ( = ?auto_687177 ?auto_687186 ) ) ( not ( = ?auto_687177 ?auto_687187 ) ) ( not ( = ?auto_687177 ?auto_687188 ) ) ( not ( = ?auto_687177 ?auto_687189 ) ) ( not ( = ?auto_687178 ?auto_687179 ) ) ( not ( = ?auto_687178 ?auto_687180 ) ) ( not ( = ?auto_687178 ?auto_687181 ) ) ( not ( = ?auto_687178 ?auto_687182 ) ) ( not ( = ?auto_687178 ?auto_687183 ) ) ( not ( = ?auto_687178 ?auto_687184 ) ) ( not ( = ?auto_687178 ?auto_687185 ) ) ( not ( = ?auto_687178 ?auto_687186 ) ) ( not ( = ?auto_687178 ?auto_687187 ) ) ( not ( = ?auto_687178 ?auto_687188 ) ) ( not ( = ?auto_687178 ?auto_687189 ) ) ( not ( = ?auto_687179 ?auto_687180 ) ) ( not ( = ?auto_687179 ?auto_687181 ) ) ( not ( = ?auto_687179 ?auto_687182 ) ) ( not ( = ?auto_687179 ?auto_687183 ) ) ( not ( = ?auto_687179 ?auto_687184 ) ) ( not ( = ?auto_687179 ?auto_687185 ) ) ( not ( = ?auto_687179 ?auto_687186 ) ) ( not ( = ?auto_687179 ?auto_687187 ) ) ( not ( = ?auto_687179 ?auto_687188 ) ) ( not ( = ?auto_687179 ?auto_687189 ) ) ( not ( = ?auto_687180 ?auto_687181 ) ) ( not ( = ?auto_687180 ?auto_687182 ) ) ( not ( = ?auto_687180 ?auto_687183 ) ) ( not ( = ?auto_687180 ?auto_687184 ) ) ( not ( = ?auto_687180 ?auto_687185 ) ) ( not ( = ?auto_687180 ?auto_687186 ) ) ( not ( = ?auto_687180 ?auto_687187 ) ) ( not ( = ?auto_687180 ?auto_687188 ) ) ( not ( = ?auto_687180 ?auto_687189 ) ) ( not ( = ?auto_687181 ?auto_687182 ) ) ( not ( = ?auto_687181 ?auto_687183 ) ) ( not ( = ?auto_687181 ?auto_687184 ) ) ( not ( = ?auto_687181 ?auto_687185 ) ) ( not ( = ?auto_687181 ?auto_687186 ) ) ( not ( = ?auto_687181 ?auto_687187 ) ) ( not ( = ?auto_687181 ?auto_687188 ) ) ( not ( = ?auto_687181 ?auto_687189 ) ) ( not ( = ?auto_687182 ?auto_687183 ) ) ( not ( = ?auto_687182 ?auto_687184 ) ) ( not ( = ?auto_687182 ?auto_687185 ) ) ( not ( = ?auto_687182 ?auto_687186 ) ) ( not ( = ?auto_687182 ?auto_687187 ) ) ( not ( = ?auto_687182 ?auto_687188 ) ) ( not ( = ?auto_687182 ?auto_687189 ) ) ( not ( = ?auto_687183 ?auto_687184 ) ) ( not ( = ?auto_687183 ?auto_687185 ) ) ( not ( = ?auto_687183 ?auto_687186 ) ) ( not ( = ?auto_687183 ?auto_687187 ) ) ( not ( = ?auto_687183 ?auto_687188 ) ) ( not ( = ?auto_687183 ?auto_687189 ) ) ( not ( = ?auto_687184 ?auto_687185 ) ) ( not ( = ?auto_687184 ?auto_687186 ) ) ( not ( = ?auto_687184 ?auto_687187 ) ) ( not ( = ?auto_687184 ?auto_687188 ) ) ( not ( = ?auto_687184 ?auto_687189 ) ) ( not ( = ?auto_687185 ?auto_687186 ) ) ( not ( = ?auto_687185 ?auto_687187 ) ) ( not ( = ?auto_687185 ?auto_687188 ) ) ( not ( = ?auto_687185 ?auto_687189 ) ) ( not ( = ?auto_687186 ?auto_687187 ) ) ( not ( = ?auto_687186 ?auto_687188 ) ) ( not ( = ?auto_687186 ?auto_687189 ) ) ( not ( = ?auto_687187 ?auto_687188 ) ) ( not ( = ?auto_687187 ?auto_687189 ) ) ( not ( = ?auto_687188 ?auto_687189 ) ) ( ON ?auto_687188 ?auto_687189 ) ( ON ?auto_687187 ?auto_687188 ) ( ON ?auto_687186 ?auto_687187 ) ( ON ?auto_687185 ?auto_687186 ) ( ON ?auto_687184 ?auto_687185 ) ( ON ?auto_687183 ?auto_687184 ) ( ON ?auto_687182 ?auto_687183 ) ( ON ?auto_687181 ?auto_687182 ) ( ON ?auto_687180 ?auto_687181 ) ( ON ?auto_687179 ?auto_687180 ) ( ON ?auto_687178 ?auto_687179 ) ( ON ?auto_687177 ?auto_687178 ) ( CLEAR ?auto_687175 ) ( ON ?auto_687176 ?auto_687177 ) ( CLEAR ?auto_687176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_687173 ?auto_687174 ?auto_687175 ?auto_687176 )
      ( MAKE-17PILE ?auto_687173 ?auto_687174 ?auto_687175 ?auto_687176 ?auto_687177 ?auto_687178 ?auto_687179 ?auto_687180 ?auto_687181 ?auto_687182 ?auto_687183 ?auto_687184 ?auto_687185 ?auto_687186 ?auto_687187 ?auto_687188 ?auto_687189 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_687207 - BLOCK
      ?auto_687208 - BLOCK
      ?auto_687209 - BLOCK
      ?auto_687210 - BLOCK
      ?auto_687211 - BLOCK
      ?auto_687212 - BLOCK
      ?auto_687213 - BLOCK
      ?auto_687214 - BLOCK
      ?auto_687215 - BLOCK
      ?auto_687216 - BLOCK
      ?auto_687217 - BLOCK
      ?auto_687218 - BLOCK
      ?auto_687219 - BLOCK
      ?auto_687220 - BLOCK
      ?auto_687221 - BLOCK
      ?auto_687222 - BLOCK
      ?auto_687223 - BLOCK
    )
    :vars
    (
      ?auto_687224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_687223 ?auto_687224 ) ( ON-TABLE ?auto_687207 ) ( ON ?auto_687208 ?auto_687207 ) ( not ( = ?auto_687207 ?auto_687208 ) ) ( not ( = ?auto_687207 ?auto_687209 ) ) ( not ( = ?auto_687207 ?auto_687210 ) ) ( not ( = ?auto_687207 ?auto_687211 ) ) ( not ( = ?auto_687207 ?auto_687212 ) ) ( not ( = ?auto_687207 ?auto_687213 ) ) ( not ( = ?auto_687207 ?auto_687214 ) ) ( not ( = ?auto_687207 ?auto_687215 ) ) ( not ( = ?auto_687207 ?auto_687216 ) ) ( not ( = ?auto_687207 ?auto_687217 ) ) ( not ( = ?auto_687207 ?auto_687218 ) ) ( not ( = ?auto_687207 ?auto_687219 ) ) ( not ( = ?auto_687207 ?auto_687220 ) ) ( not ( = ?auto_687207 ?auto_687221 ) ) ( not ( = ?auto_687207 ?auto_687222 ) ) ( not ( = ?auto_687207 ?auto_687223 ) ) ( not ( = ?auto_687207 ?auto_687224 ) ) ( not ( = ?auto_687208 ?auto_687209 ) ) ( not ( = ?auto_687208 ?auto_687210 ) ) ( not ( = ?auto_687208 ?auto_687211 ) ) ( not ( = ?auto_687208 ?auto_687212 ) ) ( not ( = ?auto_687208 ?auto_687213 ) ) ( not ( = ?auto_687208 ?auto_687214 ) ) ( not ( = ?auto_687208 ?auto_687215 ) ) ( not ( = ?auto_687208 ?auto_687216 ) ) ( not ( = ?auto_687208 ?auto_687217 ) ) ( not ( = ?auto_687208 ?auto_687218 ) ) ( not ( = ?auto_687208 ?auto_687219 ) ) ( not ( = ?auto_687208 ?auto_687220 ) ) ( not ( = ?auto_687208 ?auto_687221 ) ) ( not ( = ?auto_687208 ?auto_687222 ) ) ( not ( = ?auto_687208 ?auto_687223 ) ) ( not ( = ?auto_687208 ?auto_687224 ) ) ( not ( = ?auto_687209 ?auto_687210 ) ) ( not ( = ?auto_687209 ?auto_687211 ) ) ( not ( = ?auto_687209 ?auto_687212 ) ) ( not ( = ?auto_687209 ?auto_687213 ) ) ( not ( = ?auto_687209 ?auto_687214 ) ) ( not ( = ?auto_687209 ?auto_687215 ) ) ( not ( = ?auto_687209 ?auto_687216 ) ) ( not ( = ?auto_687209 ?auto_687217 ) ) ( not ( = ?auto_687209 ?auto_687218 ) ) ( not ( = ?auto_687209 ?auto_687219 ) ) ( not ( = ?auto_687209 ?auto_687220 ) ) ( not ( = ?auto_687209 ?auto_687221 ) ) ( not ( = ?auto_687209 ?auto_687222 ) ) ( not ( = ?auto_687209 ?auto_687223 ) ) ( not ( = ?auto_687209 ?auto_687224 ) ) ( not ( = ?auto_687210 ?auto_687211 ) ) ( not ( = ?auto_687210 ?auto_687212 ) ) ( not ( = ?auto_687210 ?auto_687213 ) ) ( not ( = ?auto_687210 ?auto_687214 ) ) ( not ( = ?auto_687210 ?auto_687215 ) ) ( not ( = ?auto_687210 ?auto_687216 ) ) ( not ( = ?auto_687210 ?auto_687217 ) ) ( not ( = ?auto_687210 ?auto_687218 ) ) ( not ( = ?auto_687210 ?auto_687219 ) ) ( not ( = ?auto_687210 ?auto_687220 ) ) ( not ( = ?auto_687210 ?auto_687221 ) ) ( not ( = ?auto_687210 ?auto_687222 ) ) ( not ( = ?auto_687210 ?auto_687223 ) ) ( not ( = ?auto_687210 ?auto_687224 ) ) ( not ( = ?auto_687211 ?auto_687212 ) ) ( not ( = ?auto_687211 ?auto_687213 ) ) ( not ( = ?auto_687211 ?auto_687214 ) ) ( not ( = ?auto_687211 ?auto_687215 ) ) ( not ( = ?auto_687211 ?auto_687216 ) ) ( not ( = ?auto_687211 ?auto_687217 ) ) ( not ( = ?auto_687211 ?auto_687218 ) ) ( not ( = ?auto_687211 ?auto_687219 ) ) ( not ( = ?auto_687211 ?auto_687220 ) ) ( not ( = ?auto_687211 ?auto_687221 ) ) ( not ( = ?auto_687211 ?auto_687222 ) ) ( not ( = ?auto_687211 ?auto_687223 ) ) ( not ( = ?auto_687211 ?auto_687224 ) ) ( not ( = ?auto_687212 ?auto_687213 ) ) ( not ( = ?auto_687212 ?auto_687214 ) ) ( not ( = ?auto_687212 ?auto_687215 ) ) ( not ( = ?auto_687212 ?auto_687216 ) ) ( not ( = ?auto_687212 ?auto_687217 ) ) ( not ( = ?auto_687212 ?auto_687218 ) ) ( not ( = ?auto_687212 ?auto_687219 ) ) ( not ( = ?auto_687212 ?auto_687220 ) ) ( not ( = ?auto_687212 ?auto_687221 ) ) ( not ( = ?auto_687212 ?auto_687222 ) ) ( not ( = ?auto_687212 ?auto_687223 ) ) ( not ( = ?auto_687212 ?auto_687224 ) ) ( not ( = ?auto_687213 ?auto_687214 ) ) ( not ( = ?auto_687213 ?auto_687215 ) ) ( not ( = ?auto_687213 ?auto_687216 ) ) ( not ( = ?auto_687213 ?auto_687217 ) ) ( not ( = ?auto_687213 ?auto_687218 ) ) ( not ( = ?auto_687213 ?auto_687219 ) ) ( not ( = ?auto_687213 ?auto_687220 ) ) ( not ( = ?auto_687213 ?auto_687221 ) ) ( not ( = ?auto_687213 ?auto_687222 ) ) ( not ( = ?auto_687213 ?auto_687223 ) ) ( not ( = ?auto_687213 ?auto_687224 ) ) ( not ( = ?auto_687214 ?auto_687215 ) ) ( not ( = ?auto_687214 ?auto_687216 ) ) ( not ( = ?auto_687214 ?auto_687217 ) ) ( not ( = ?auto_687214 ?auto_687218 ) ) ( not ( = ?auto_687214 ?auto_687219 ) ) ( not ( = ?auto_687214 ?auto_687220 ) ) ( not ( = ?auto_687214 ?auto_687221 ) ) ( not ( = ?auto_687214 ?auto_687222 ) ) ( not ( = ?auto_687214 ?auto_687223 ) ) ( not ( = ?auto_687214 ?auto_687224 ) ) ( not ( = ?auto_687215 ?auto_687216 ) ) ( not ( = ?auto_687215 ?auto_687217 ) ) ( not ( = ?auto_687215 ?auto_687218 ) ) ( not ( = ?auto_687215 ?auto_687219 ) ) ( not ( = ?auto_687215 ?auto_687220 ) ) ( not ( = ?auto_687215 ?auto_687221 ) ) ( not ( = ?auto_687215 ?auto_687222 ) ) ( not ( = ?auto_687215 ?auto_687223 ) ) ( not ( = ?auto_687215 ?auto_687224 ) ) ( not ( = ?auto_687216 ?auto_687217 ) ) ( not ( = ?auto_687216 ?auto_687218 ) ) ( not ( = ?auto_687216 ?auto_687219 ) ) ( not ( = ?auto_687216 ?auto_687220 ) ) ( not ( = ?auto_687216 ?auto_687221 ) ) ( not ( = ?auto_687216 ?auto_687222 ) ) ( not ( = ?auto_687216 ?auto_687223 ) ) ( not ( = ?auto_687216 ?auto_687224 ) ) ( not ( = ?auto_687217 ?auto_687218 ) ) ( not ( = ?auto_687217 ?auto_687219 ) ) ( not ( = ?auto_687217 ?auto_687220 ) ) ( not ( = ?auto_687217 ?auto_687221 ) ) ( not ( = ?auto_687217 ?auto_687222 ) ) ( not ( = ?auto_687217 ?auto_687223 ) ) ( not ( = ?auto_687217 ?auto_687224 ) ) ( not ( = ?auto_687218 ?auto_687219 ) ) ( not ( = ?auto_687218 ?auto_687220 ) ) ( not ( = ?auto_687218 ?auto_687221 ) ) ( not ( = ?auto_687218 ?auto_687222 ) ) ( not ( = ?auto_687218 ?auto_687223 ) ) ( not ( = ?auto_687218 ?auto_687224 ) ) ( not ( = ?auto_687219 ?auto_687220 ) ) ( not ( = ?auto_687219 ?auto_687221 ) ) ( not ( = ?auto_687219 ?auto_687222 ) ) ( not ( = ?auto_687219 ?auto_687223 ) ) ( not ( = ?auto_687219 ?auto_687224 ) ) ( not ( = ?auto_687220 ?auto_687221 ) ) ( not ( = ?auto_687220 ?auto_687222 ) ) ( not ( = ?auto_687220 ?auto_687223 ) ) ( not ( = ?auto_687220 ?auto_687224 ) ) ( not ( = ?auto_687221 ?auto_687222 ) ) ( not ( = ?auto_687221 ?auto_687223 ) ) ( not ( = ?auto_687221 ?auto_687224 ) ) ( not ( = ?auto_687222 ?auto_687223 ) ) ( not ( = ?auto_687222 ?auto_687224 ) ) ( not ( = ?auto_687223 ?auto_687224 ) ) ( ON ?auto_687222 ?auto_687223 ) ( ON ?auto_687221 ?auto_687222 ) ( ON ?auto_687220 ?auto_687221 ) ( ON ?auto_687219 ?auto_687220 ) ( ON ?auto_687218 ?auto_687219 ) ( ON ?auto_687217 ?auto_687218 ) ( ON ?auto_687216 ?auto_687217 ) ( ON ?auto_687215 ?auto_687216 ) ( ON ?auto_687214 ?auto_687215 ) ( ON ?auto_687213 ?auto_687214 ) ( ON ?auto_687212 ?auto_687213 ) ( ON ?auto_687211 ?auto_687212 ) ( ON ?auto_687210 ?auto_687211 ) ( CLEAR ?auto_687208 ) ( ON ?auto_687209 ?auto_687210 ) ( CLEAR ?auto_687209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_687207 ?auto_687208 ?auto_687209 )
      ( MAKE-17PILE ?auto_687207 ?auto_687208 ?auto_687209 ?auto_687210 ?auto_687211 ?auto_687212 ?auto_687213 ?auto_687214 ?auto_687215 ?auto_687216 ?auto_687217 ?auto_687218 ?auto_687219 ?auto_687220 ?auto_687221 ?auto_687222 ?auto_687223 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_687242 - BLOCK
      ?auto_687243 - BLOCK
      ?auto_687244 - BLOCK
      ?auto_687245 - BLOCK
      ?auto_687246 - BLOCK
      ?auto_687247 - BLOCK
      ?auto_687248 - BLOCK
      ?auto_687249 - BLOCK
      ?auto_687250 - BLOCK
      ?auto_687251 - BLOCK
      ?auto_687252 - BLOCK
      ?auto_687253 - BLOCK
      ?auto_687254 - BLOCK
      ?auto_687255 - BLOCK
      ?auto_687256 - BLOCK
      ?auto_687257 - BLOCK
      ?auto_687258 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_687258 ) ( ON-TABLE ?auto_687242 ) ( ON ?auto_687243 ?auto_687242 ) ( not ( = ?auto_687242 ?auto_687243 ) ) ( not ( = ?auto_687242 ?auto_687244 ) ) ( not ( = ?auto_687242 ?auto_687245 ) ) ( not ( = ?auto_687242 ?auto_687246 ) ) ( not ( = ?auto_687242 ?auto_687247 ) ) ( not ( = ?auto_687242 ?auto_687248 ) ) ( not ( = ?auto_687242 ?auto_687249 ) ) ( not ( = ?auto_687242 ?auto_687250 ) ) ( not ( = ?auto_687242 ?auto_687251 ) ) ( not ( = ?auto_687242 ?auto_687252 ) ) ( not ( = ?auto_687242 ?auto_687253 ) ) ( not ( = ?auto_687242 ?auto_687254 ) ) ( not ( = ?auto_687242 ?auto_687255 ) ) ( not ( = ?auto_687242 ?auto_687256 ) ) ( not ( = ?auto_687242 ?auto_687257 ) ) ( not ( = ?auto_687242 ?auto_687258 ) ) ( not ( = ?auto_687243 ?auto_687244 ) ) ( not ( = ?auto_687243 ?auto_687245 ) ) ( not ( = ?auto_687243 ?auto_687246 ) ) ( not ( = ?auto_687243 ?auto_687247 ) ) ( not ( = ?auto_687243 ?auto_687248 ) ) ( not ( = ?auto_687243 ?auto_687249 ) ) ( not ( = ?auto_687243 ?auto_687250 ) ) ( not ( = ?auto_687243 ?auto_687251 ) ) ( not ( = ?auto_687243 ?auto_687252 ) ) ( not ( = ?auto_687243 ?auto_687253 ) ) ( not ( = ?auto_687243 ?auto_687254 ) ) ( not ( = ?auto_687243 ?auto_687255 ) ) ( not ( = ?auto_687243 ?auto_687256 ) ) ( not ( = ?auto_687243 ?auto_687257 ) ) ( not ( = ?auto_687243 ?auto_687258 ) ) ( not ( = ?auto_687244 ?auto_687245 ) ) ( not ( = ?auto_687244 ?auto_687246 ) ) ( not ( = ?auto_687244 ?auto_687247 ) ) ( not ( = ?auto_687244 ?auto_687248 ) ) ( not ( = ?auto_687244 ?auto_687249 ) ) ( not ( = ?auto_687244 ?auto_687250 ) ) ( not ( = ?auto_687244 ?auto_687251 ) ) ( not ( = ?auto_687244 ?auto_687252 ) ) ( not ( = ?auto_687244 ?auto_687253 ) ) ( not ( = ?auto_687244 ?auto_687254 ) ) ( not ( = ?auto_687244 ?auto_687255 ) ) ( not ( = ?auto_687244 ?auto_687256 ) ) ( not ( = ?auto_687244 ?auto_687257 ) ) ( not ( = ?auto_687244 ?auto_687258 ) ) ( not ( = ?auto_687245 ?auto_687246 ) ) ( not ( = ?auto_687245 ?auto_687247 ) ) ( not ( = ?auto_687245 ?auto_687248 ) ) ( not ( = ?auto_687245 ?auto_687249 ) ) ( not ( = ?auto_687245 ?auto_687250 ) ) ( not ( = ?auto_687245 ?auto_687251 ) ) ( not ( = ?auto_687245 ?auto_687252 ) ) ( not ( = ?auto_687245 ?auto_687253 ) ) ( not ( = ?auto_687245 ?auto_687254 ) ) ( not ( = ?auto_687245 ?auto_687255 ) ) ( not ( = ?auto_687245 ?auto_687256 ) ) ( not ( = ?auto_687245 ?auto_687257 ) ) ( not ( = ?auto_687245 ?auto_687258 ) ) ( not ( = ?auto_687246 ?auto_687247 ) ) ( not ( = ?auto_687246 ?auto_687248 ) ) ( not ( = ?auto_687246 ?auto_687249 ) ) ( not ( = ?auto_687246 ?auto_687250 ) ) ( not ( = ?auto_687246 ?auto_687251 ) ) ( not ( = ?auto_687246 ?auto_687252 ) ) ( not ( = ?auto_687246 ?auto_687253 ) ) ( not ( = ?auto_687246 ?auto_687254 ) ) ( not ( = ?auto_687246 ?auto_687255 ) ) ( not ( = ?auto_687246 ?auto_687256 ) ) ( not ( = ?auto_687246 ?auto_687257 ) ) ( not ( = ?auto_687246 ?auto_687258 ) ) ( not ( = ?auto_687247 ?auto_687248 ) ) ( not ( = ?auto_687247 ?auto_687249 ) ) ( not ( = ?auto_687247 ?auto_687250 ) ) ( not ( = ?auto_687247 ?auto_687251 ) ) ( not ( = ?auto_687247 ?auto_687252 ) ) ( not ( = ?auto_687247 ?auto_687253 ) ) ( not ( = ?auto_687247 ?auto_687254 ) ) ( not ( = ?auto_687247 ?auto_687255 ) ) ( not ( = ?auto_687247 ?auto_687256 ) ) ( not ( = ?auto_687247 ?auto_687257 ) ) ( not ( = ?auto_687247 ?auto_687258 ) ) ( not ( = ?auto_687248 ?auto_687249 ) ) ( not ( = ?auto_687248 ?auto_687250 ) ) ( not ( = ?auto_687248 ?auto_687251 ) ) ( not ( = ?auto_687248 ?auto_687252 ) ) ( not ( = ?auto_687248 ?auto_687253 ) ) ( not ( = ?auto_687248 ?auto_687254 ) ) ( not ( = ?auto_687248 ?auto_687255 ) ) ( not ( = ?auto_687248 ?auto_687256 ) ) ( not ( = ?auto_687248 ?auto_687257 ) ) ( not ( = ?auto_687248 ?auto_687258 ) ) ( not ( = ?auto_687249 ?auto_687250 ) ) ( not ( = ?auto_687249 ?auto_687251 ) ) ( not ( = ?auto_687249 ?auto_687252 ) ) ( not ( = ?auto_687249 ?auto_687253 ) ) ( not ( = ?auto_687249 ?auto_687254 ) ) ( not ( = ?auto_687249 ?auto_687255 ) ) ( not ( = ?auto_687249 ?auto_687256 ) ) ( not ( = ?auto_687249 ?auto_687257 ) ) ( not ( = ?auto_687249 ?auto_687258 ) ) ( not ( = ?auto_687250 ?auto_687251 ) ) ( not ( = ?auto_687250 ?auto_687252 ) ) ( not ( = ?auto_687250 ?auto_687253 ) ) ( not ( = ?auto_687250 ?auto_687254 ) ) ( not ( = ?auto_687250 ?auto_687255 ) ) ( not ( = ?auto_687250 ?auto_687256 ) ) ( not ( = ?auto_687250 ?auto_687257 ) ) ( not ( = ?auto_687250 ?auto_687258 ) ) ( not ( = ?auto_687251 ?auto_687252 ) ) ( not ( = ?auto_687251 ?auto_687253 ) ) ( not ( = ?auto_687251 ?auto_687254 ) ) ( not ( = ?auto_687251 ?auto_687255 ) ) ( not ( = ?auto_687251 ?auto_687256 ) ) ( not ( = ?auto_687251 ?auto_687257 ) ) ( not ( = ?auto_687251 ?auto_687258 ) ) ( not ( = ?auto_687252 ?auto_687253 ) ) ( not ( = ?auto_687252 ?auto_687254 ) ) ( not ( = ?auto_687252 ?auto_687255 ) ) ( not ( = ?auto_687252 ?auto_687256 ) ) ( not ( = ?auto_687252 ?auto_687257 ) ) ( not ( = ?auto_687252 ?auto_687258 ) ) ( not ( = ?auto_687253 ?auto_687254 ) ) ( not ( = ?auto_687253 ?auto_687255 ) ) ( not ( = ?auto_687253 ?auto_687256 ) ) ( not ( = ?auto_687253 ?auto_687257 ) ) ( not ( = ?auto_687253 ?auto_687258 ) ) ( not ( = ?auto_687254 ?auto_687255 ) ) ( not ( = ?auto_687254 ?auto_687256 ) ) ( not ( = ?auto_687254 ?auto_687257 ) ) ( not ( = ?auto_687254 ?auto_687258 ) ) ( not ( = ?auto_687255 ?auto_687256 ) ) ( not ( = ?auto_687255 ?auto_687257 ) ) ( not ( = ?auto_687255 ?auto_687258 ) ) ( not ( = ?auto_687256 ?auto_687257 ) ) ( not ( = ?auto_687256 ?auto_687258 ) ) ( not ( = ?auto_687257 ?auto_687258 ) ) ( ON ?auto_687257 ?auto_687258 ) ( ON ?auto_687256 ?auto_687257 ) ( ON ?auto_687255 ?auto_687256 ) ( ON ?auto_687254 ?auto_687255 ) ( ON ?auto_687253 ?auto_687254 ) ( ON ?auto_687252 ?auto_687253 ) ( ON ?auto_687251 ?auto_687252 ) ( ON ?auto_687250 ?auto_687251 ) ( ON ?auto_687249 ?auto_687250 ) ( ON ?auto_687248 ?auto_687249 ) ( ON ?auto_687247 ?auto_687248 ) ( ON ?auto_687246 ?auto_687247 ) ( ON ?auto_687245 ?auto_687246 ) ( CLEAR ?auto_687243 ) ( ON ?auto_687244 ?auto_687245 ) ( CLEAR ?auto_687244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_687242 ?auto_687243 ?auto_687244 )
      ( MAKE-17PILE ?auto_687242 ?auto_687243 ?auto_687244 ?auto_687245 ?auto_687246 ?auto_687247 ?auto_687248 ?auto_687249 ?auto_687250 ?auto_687251 ?auto_687252 ?auto_687253 ?auto_687254 ?auto_687255 ?auto_687256 ?auto_687257 ?auto_687258 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_687276 - BLOCK
      ?auto_687277 - BLOCK
      ?auto_687278 - BLOCK
      ?auto_687279 - BLOCK
      ?auto_687280 - BLOCK
      ?auto_687281 - BLOCK
      ?auto_687282 - BLOCK
      ?auto_687283 - BLOCK
      ?auto_687284 - BLOCK
      ?auto_687285 - BLOCK
      ?auto_687286 - BLOCK
      ?auto_687287 - BLOCK
      ?auto_687288 - BLOCK
      ?auto_687289 - BLOCK
      ?auto_687290 - BLOCK
      ?auto_687291 - BLOCK
      ?auto_687292 - BLOCK
    )
    :vars
    (
      ?auto_687293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_687292 ?auto_687293 ) ( ON-TABLE ?auto_687276 ) ( not ( = ?auto_687276 ?auto_687277 ) ) ( not ( = ?auto_687276 ?auto_687278 ) ) ( not ( = ?auto_687276 ?auto_687279 ) ) ( not ( = ?auto_687276 ?auto_687280 ) ) ( not ( = ?auto_687276 ?auto_687281 ) ) ( not ( = ?auto_687276 ?auto_687282 ) ) ( not ( = ?auto_687276 ?auto_687283 ) ) ( not ( = ?auto_687276 ?auto_687284 ) ) ( not ( = ?auto_687276 ?auto_687285 ) ) ( not ( = ?auto_687276 ?auto_687286 ) ) ( not ( = ?auto_687276 ?auto_687287 ) ) ( not ( = ?auto_687276 ?auto_687288 ) ) ( not ( = ?auto_687276 ?auto_687289 ) ) ( not ( = ?auto_687276 ?auto_687290 ) ) ( not ( = ?auto_687276 ?auto_687291 ) ) ( not ( = ?auto_687276 ?auto_687292 ) ) ( not ( = ?auto_687276 ?auto_687293 ) ) ( not ( = ?auto_687277 ?auto_687278 ) ) ( not ( = ?auto_687277 ?auto_687279 ) ) ( not ( = ?auto_687277 ?auto_687280 ) ) ( not ( = ?auto_687277 ?auto_687281 ) ) ( not ( = ?auto_687277 ?auto_687282 ) ) ( not ( = ?auto_687277 ?auto_687283 ) ) ( not ( = ?auto_687277 ?auto_687284 ) ) ( not ( = ?auto_687277 ?auto_687285 ) ) ( not ( = ?auto_687277 ?auto_687286 ) ) ( not ( = ?auto_687277 ?auto_687287 ) ) ( not ( = ?auto_687277 ?auto_687288 ) ) ( not ( = ?auto_687277 ?auto_687289 ) ) ( not ( = ?auto_687277 ?auto_687290 ) ) ( not ( = ?auto_687277 ?auto_687291 ) ) ( not ( = ?auto_687277 ?auto_687292 ) ) ( not ( = ?auto_687277 ?auto_687293 ) ) ( not ( = ?auto_687278 ?auto_687279 ) ) ( not ( = ?auto_687278 ?auto_687280 ) ) ( not ( = ?auto_687278 ?auto_687281 ) ) ( not ( = ?auto_687278 ?auto_687282 ) ) ( not ( = ?auto_687278 ?auto_687283 ) ) ( not ( = ?auto_687278 ?auto_687284 ) ) ( not ( = ?auto_687278 ?auto_687285 ) ) ( not ( = ?auto_687278 ?auto_687286 ) ) ( not ( = ?auto_687278 ?auto_687287 ) ) ( not ( = ?auto_687278 ?auto_687288 ) ) ( not ( = ?auto_687278 ?auto_687289 ) ) ( not ( = ?auto_687278 ?auto_687290 ) ) ( not ( = ?auto_687278 ?auto_687291 ) ) ( not ( = ?auto_687278 ?auto_687292 ) ) ( not ( = ?auto_687278 ?auto_687293 ) ) ( not ( = ?auto_687279 ?auto_687280 ) ) ( not ( = ?auto_687279 ?auto_687281 ) ) ( not ( = ?auto_687279 ?auto_687282 ) ) ( not ( = ?auto_687279 ?auto_687283 ) ) ( not ( = ?auto_687279 ?auto_687284 ) ) ( not ( = ?auto_687279 ?auto_687285 ) ) ( not ( = ?auto_687279 ?auto_687286 ) ) ( not ( = ?auto_687279 ?auto_687287 ) ) ( not ( = ?auto_687279 ?auto_687288 ) ) ( not ( = ?auto_687279 ?auto_687289 ) ) ( not ( = ?auto_687279 ?auto_687290 ) ) ( not ( = ?auto_687279 ?auto_687291 ) ) ( not ( = ?auto_687279 ?auto_687292 ) ) ( not ( = ?auto_687279 ?auto_687293 ) ) ( not ( = ?auto_687280 ?auto_687281 ) ) ( not ( = ?auto_687280 ?auto_687282 ) ) ( not ( = ?auto_687280 ?auto_687283 ) ) ( not ( = ?auto_687280 ?auto_687284 ) ) ( not ( = ?auto_687280 ?auto_687285 ) ) ( not ( = ?auto_687280 ?auto_687286 ) ) ( not ( = ?auto_687280 ?auto_687287 ) ) ( not ( = ?auto_687280 ?auto_687288 ) ) ( not ( = ?auto_687280 ?auto_687289 ) ) ( not ( = ?auto_687280 ?auto_687290 ) ) ( not ( = ?auto_687280 ?auto_687291 ) ) ( not ( = ?auto_687280 ?auto_687292 ) ) ( not ( = ?auto_687280 ?auto_687293 ) ) ( not ( = ?auto_687281 ?auto_687282 ) ) ( not ( = ?auto_687281 ?auto_687283 ) ) ( not ( = ?auto_687281 ?auto_687284 ) ) ( not ( = ?auto_687281 ?auto_687285 ) ) ( not ( = ?auto_687281 ?auto_687286 ) ) ( not ( = ?auto_687281 ?auto_687287 ) ) ( not ( = ?auto_687281 ?auto_687288 ) ) ( not ( = ?auto_687281 ?auto_687289 ) ) ( not ( = ?auto_687281 ?auto_687290 ) ) ( not ( = ?auto_687281 ?auto_687291 ) ) ( not ( = ?auto_687281 ?auto_687292 ) ) ( not ( = ?auto_687281 ?auto_687293 ) ) ( not ( = ?auto_687282 ?auto_687283 ) ) ( not ( = ?auto_687282 ?auto_687284 ) ) ( not ( = ?auto_687282 ?auto_687285 ) ) ( not ( = ?auto_687282 ?auto_687286 ) ) ( not ( = ?auto_687282 ?auto_687287 ) ) ( not ( = ?auto_687282 ?auto_687288 ) ) ( not ( = ?auto_687282 ?auto_687289 ) ) ( not ( = ?auto_687282 ?auto_687290 ) ) ( not ( = ?auto_687282 ?auto_687291 ) ) ( not ( = ?auto_687282 ?auto_687292 ) ) ( not ( = ?auto_687282 ?auto_687293 ) ) ( not ( = ?auto_687283 ?auto_687284 ) ) ( not ( = ?auto_687283 ?auto_687285 ) ) ( not ( = ?auto_687283 ?auto_687286 ) ) ( not ( = ?auto_687283 ?auto_687287 ) ) ( not ( = ?auto_687283 ?auto_687288 ) ) ( not ( = ?auto_687283 ?auto_687289 ) ) ( not ( = ?auto_687283 ?auto_687290 ) ) ( not ( = ?auto_687283 ?auto_687291 ) ) ( not ( = ?auto_687283 ?auto_687292 ) ) ( not ( = ?auto_687283 ?auto_687293 ) ) ( not ( = ?auto_687284 ?auto_687285 ) ) ( not ( = ?auto_687284 ?auto_687286 ) ) ( not ( = ?auto_687284 ?auto_687287 ) ) ( not ( = ?auto_687284 ?auto_687288 ) ) ( not ( = ?auto_687284 ?auto_687289 ) ) ( not ( = ?auto_687284 ?auto_687290 ) ) ( not ( = ?auto_687284 ?auto_687291 ) ) ( not ( = ?auto_687284 ?auto_687292 ) ) ( not ( = ?auto_687284 ?auto_687293 ) ) ( not ( = ?auto_687285 ?auto_687286 ) ) ( not ( = ?auto_687285 ?auto_687287 ) ) ( not ( = ?auto_687285 ?auto_687288 ) ) ( not ( = ?auto_687285 ?auto_687289 ) ) ( not ( = ?auto_687285 ?auto_687290 ) ) ( not ( = ?auto_687285 ?auto_687291 ) ) ( not ( = ?auto_687285 ?auto_687292 ) ) ( not ( = ?auto_687285 ?auto_687293 ) ) ( not ( = ?auto_687286 ?auto_687287 ) ) ( not ( = ?auto_687286 ?auto_687288 ) ) ( not ( = ?auto_687286 ?auto_687289 ) ) ( not ( = ?auto_687286 ?auto_687290 ) ) ( not ( = ?auto_687286 ?auto_687291 ) ) ( not ( = ?auto_687286 ?auto_687292 ) ) ( not ( = ?auto_687286 ?auto_687293 ) ) ( not ( = ?auto_687287 ?auto_687288 ) ) ( not ( = ?auto_687287 ?auto_687289 ) ) ( not ( = ?auto_687287 ?auto_687290 ) ) ( not ( = ?auto_687287 ?auto_687291 ) ) ( not ( = ?auto_687287 ?auto_687292 ) ) ( not ( = ?auto_687287 ?auto_687293 ) ) ( not ( = ?auto_687288 ?auto_687289 ) ) ( not ( = ?auto_687288 ?auto_687290 ) ) ( not ( = ?auto_687288 ?auto_687291 ) ) ( not ( = ?auto_687288 ?auto_687292 ) ) ( not ( = ?auto_687288 ?auto_687293 ) ) ( not ( = ?auto_687289 ?auto_687290 ) ) ( not ( = ?auto_687289 ?auto_687291 ) ) ( not ( = ?auto_687289 ?auto_687292 ) ) ( not ( = ?auto_687289 ?auto_687293 ) ) ( not ( = ?auto_687290 ?auto_687291 ) ) ( not ( = ?auto_687290 ?auto_687292 ) ) ( not ( = ?auto_687290 ?auto_687293 ) ) ( not ( = ?auto_687291 ?auto_687292 ) ) ( not ( = ?auto_687291 ?auto_687293 ) ) ( not ( = ?auto_687292 ?auto_687293 ) ) ( ON ?auto_687291 ?auto_687292 ) ( ON ?auto_687290 ?auto_687291 ) ( ON ?auto_687289 ?auto_687290 ) ( ON ?auto_687288 ?auto_687289 ) ( ON ?auto_687287 ?auto_687288 ) ( ON ?auto_687286 ?auto_687287 ) ( ON ?auto_687285 ?auto_687286 ) ( ON ?auto_687284 ?auto_687285 ) ( ON ?auto_687283 ?auto_687284 ) ( ON ?auto_687282 ?auto_687283 ) ( ON ?auto_687281 ?auto_687282 ) ( ON ?auto_687280 ?auto_687281 ) ( ON ?auto_687279 ?auto_687280 ) ( ON ?auto_687278 ?auto_687279 ) ( CLEAR ?auto_687276 ) ( ON ?auto_687277 ?auto_687278 ) ( CLEAR ?auto_687277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_687276 ?auto_687277 )
      ( MAKE-17PILE ?auto_687276 ?auto_687277 ?auto_687278 ?auto_687279 ?auto_687280 ?auto_687281 ?auto_687282 ?auto_687283 ?auto_687284 ?auto_687285 ?auto_687286 ?auto_687287 ?auto_687288 ?auto_687289 ?auto_687290 ?auto_687291 ?auto_687292 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_687311 - BLOCK
      ?auto_687312 - BLOCK
      ?auto_687313 - BLOCK
      ?auto_687314 - BLOCK
      ?auto_687315 - BLOCK
      ?auto_687316 - BLOCK
      ?auto_687317 - BLOCK
      ?auto_687318 - BLOCK
      ?auto_687319 - BLOCK
      ?auto_687320 - BLOCK
      ?auto_687321 - BLOCK
      ?auto_687322 - BLOCK
      ?auto_687323 - BLOCK
      ?auto_687324 - BLOCK
      ?auto_687325 - BLOCK
      ?auto_687326 - BLOCK
      ?auto_687327 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_687327 ) ( ON-TABLE ?auto_687311 ) ( not ( = ?auto_687311 ?auto_687312 ) ) ( not ( = ?auto_687311 ?auto_687313 ) ) ( not ( = ?auto_687311 ?auto_687314 ) ) ( not ( = ?auto_687311 ?auto_687315 ) ) ( not ( = ?auto_687311 ?auto_687316 ) ) ( not ( = ?auto_687311 ?auto_687317 ) ) ( not ( = ?auto_687311 ?auto_687318 ) ) ( not ( = ?auto_687311 ?auto_687319 ) ) ( not ( = ?auto_687311 ?auto_687320 ) ) ( not ( = ?auto_687311 ?auto_687321 ) ) ( not ( = ?auto_687311 ?auto_687322 ) ) ( not ( = ?auto_687311 ?auto_687323 ) ) ( not ( = ?auto_687311 ?auto_687324 ) ) ( not ( = ?auto_687311 ?auto_687325 ) ) ( not ( = ?auto_687311 ?auto_687326 ) ) ( not ( = ?auto_687311 ?auto_687327 ) ) ( not ( = ?auto_687312 ?auto_687313 ) ) ( not ( = ?auto_687312 ?auto_687314 ) ) ( not ( = ?auto_687312 ?auto_687315 ) ) ( not ( = ?auto_687312 ?auto_687316 ) ) ( not ( = ?auto_687312 ?auto_687317 ) ) ( not ( = ?auto_687312 ?auto_687318 ) ) ( not ( = ?auto_687312 ?auto_687319 ) ) ( not ( = ?auto_687312 ?auto_687320 ) ) ( not ( = ?auto_687312 ?auto_687321 ) ) ( not ( = ?auto_687312 ?auto_687322 ) ) ( not ( = ?auto_687312 ?auto_687323 ) ) ( not ( = ?auto_687312 ?auto_687324 ) ) ( not ( = ?auto_687312 ?auto_687325 ) ) ( not ( = ?auto_687312 ?auto_687326 ) ) ( not ( = ?auto_687312 ?auto_687327 ) ) ( not ( = ?auto_687313 ?auto_687314 ) ) ( not ( = ?auto_687313 ?auto_687315 ) ) ( not ( = ?auto_687313 ?auto_687316 ) ) ( not ( = ?auto_687313 ?auto_687317 ) ) ( not ( = ?auto_687313 ?auto_687318 ) ) ( not ( = ?auto_687313 ?auto_687319 ) ) ( not ( = ?auto_687313 ?auto_687320 ) ) ( not ( = ?auto_687313 ?auto_687321 ) ) ( not ( = ?auto_687313 ?auto_687322 ) ) ( not ( = ?auto_687313 ?auto_687323 ) ) ( not ( = ?auto_687313 ?auto_687324 ) ) ( not ( = ?auto_687313 ?auto_687325 ) ) ( not ( = ?auto_687313 ?auto_687326 ) ) ( not ( = ?auto_687313 ?auto_687327 ) ) ( not ( = ?auto_687314 ?auto_687315 ) ) ( not ( = ?auto_687314 ?auto_687316 ) ) ( not ( = ?auto_687314 ?auto_687317 ) ) ( not ( = ?auto_687314 ?auto_687318 ) ) ( not ( = ?auto_687314 ?auto_687319 ) ) ( not ( = ?auto_687314 ?auto_687320 ) ) ( not ( = ?auto_687314 ?auto_687321 ) ) ( not ( = ?auto_687314 ?auto_687322 ) ) ( not ( = ?auto_687314 ?auto_687323 ) ) ( not ( = ?auto_687314 ?auto_687324 ) ) ( not ( = ?auto_687314 ?auto_687325 ) ) ( not ( = ?auto_687314 ?auto_687326 ) ) ( not ( = ?auto_687314 ?auto_687327 ) ) ( not ( = ?auto_687315 ?auto_687316 ) ) ( not ( = ?auto_687315 ?auto_687317 ) ) ( not ( = ?auto_687315 ?auto_687318 ) ) ( not ( = ?auto_687315 ?auto_687319 ) ) ( not ( = ?auto_687315 ?auto_687320 ) ) ( not ( = ?auto_687315 ?auto_687321 ) ) ( not ( = ?auto_687315 ?auto_687322 ) ) ( not ( = ?auto_687315 ?auto_687323 ) ) ( not ( = ?auto_687315 ?auto_687324 ) ) ( not ( = ?auto_687315 ?auto_687325 ) ) ( not ( = ?auto_687315 ?auto_687326 ) ) ( not ( = ?auto_687315 ?auto_687327 ) ) ( not ( = ?auto_687316 ?auto_687317 ) ) ( not ( = ?auto_687316 ?auto_687318 ) ) ( not ( = ?auto_687316 ?auto_687319 ) ) ( not ( = ?auto_687316 ?auto_687320 ) ) ( not ( = ?auto_687316 ?auto_687321 ) ) ( not ( = ?auto_687316 ?auto_687322 ) ) ( not ( = ?auto_687316 ?auto_687323 ) ) ( not ( = ?auto_687316 ?auto_687324 ) ) ( not ( = ?auto_687316 ?auto_687325 ) ) ( not ( = ?auto_687316 ?auto_687326 ) ) ( not ( = ?auto_687316 ?auto_687327 ) ) ( not ( = ?auto_687317 ?auto_687318 ) ) ( not ( = ?auto_687317 ?auto_687319 ) ) ( not ( = ?auto_687317 ?auto_687320 ) ) ( not ( = ?auto_687317 ?auto_687321 ) ) ( not ( = ?auto_687317 ?auto_687322 ) ) ( not ( = ?auto_687317 ?auto_687323 ) ) ( not ( = ?auto_687317 ?auto_687324 ) ) ( not ( = ?auto_687317 ?auto_687325 ) ) ( not ( = ?auto_687317 ?auto_687326 ) ) ( not ( = ?auto_687317 ?auto_687327 ) ) ( not ( = ?auto_687318 ?auto_687319 ) ) ( not ( = ?auto_687318 ?auto_687320 ) ) ( not ( = ?auto_687318 ?auto_687321 ) ) ( not ( = ?auto_687318 ?auto_687322 ) ) ( not ( = ?auto_687318 ?auto_687323 ) ) ( not ( = ?auto_687318 ?auto_687324 ) ) ( not ( = ?auto_687318 ?auto_687325 ) ) ( not ( = ?auto_687318 ?auto_687326 ) ) ( not ( = ?auto_687318 ?auto_687327 ) ) ( not ( = ?auto_687319 ?auto_687320 ) ) ( not ( = ?auto_687319 ?auto_687321 ) ) ( not ( = ?auto_687319 ?auto_687322 ) ) ( not ( = ?auto_687319 ?auto_687323 ) ) ( not ( = ?auto_687319 ?auto_687324 ) ) ( not ( = ?auto_687319 ?auto_687325 ) ) ( not ( = ?auto_687319 ?auto_687326 ) ) ( not ( = ?auto_687319 ?auto_687327 ) ) ( not ( = ?auto_687320 ?auto_687321 ) ) ( not ( = ?auto_687320 ?auto_687322 ) ) ( not ( = ?auto_687320 ?auto_687323 ) ) ( not ( = ?auto_687320 ?auto_687324 ) ) ( not ( = ?auto_687320 ?auto_687325 ) ) ( not ( = ?auto_687320 ?auto_687326 ) ) ( not ( = ?auto_687320 ?auto_687327 ) ) ( not ( = ?auto_687321 ?auto_687322 ) ) ( not ( = ?auto_687321 ?auto_687323 ) ) ( not ( = ?auto_687321 ?auto_687324 ) ) ( not ( = ?auto_687321 ?auto_687325 ) ) ( not ( = ?auto_687321 ?auto_687326 ) ) ( not ( = ?auto_687321 ?auto_687327 ) ) ( not ( = ?auto_687322 ?auto_687323 ) ) ( not ( = ?auto_687322 ?auto_687324 ) ) ( not ( = ?auto_687322 ?auto_687325 ) ) ( not ( = ?auto_687322 ?auto_687326 ) ) ( not ( = ?auto_687322 ?auto_687327 ) ) ( not ( = ?auto_687323 ?auto_687324 ) ) ( not ( = ?auto_687323 ?auto_687325 ) ) ( not ( = ?auto_687323 ?auto_687326 ) ) ( not ( = ?auto_687323 ?auto_687327 ) ) ( not ( = ?auto_687324 ?auto_687325 ) ) ( not ( = ?auto_687324 ?auto_687326 ) ) ( not ( = ?auto_687324 ?auto_687327 ) ) ( not ( = ?auto_687325 ?auto_687326 ) ) ( not ( = ?auto_687325 ?auto_687327 ) ) ( not ( = ?auto_687326 ?auto_687327 ) ) ( ON ?auto_687326 ?auto_687327 ) ( ON ?auto_687325 ?auto_687326 ) ( ON ?auto_687324 ?auto_687325 ) ( ON ?auto_687323 ?auto_687324 ) ( ON ?auto_687322 ?auto_687323 ) ( ON ?auto_687321 ?auto_687322 ) ( ON ?auto_687320 ?auto_687321 ) ( ON ?auto_687319 ?auto_687320 ) ( ON ?auto_687318 ?auto_687319 ) ( ON ?auto_687317 ?auto_687318 ) ( ON ?auto_687316 ?auto_687317 ) ( ON ?auto_687315 ?auto_687316 ) ( ON ?auto_687314 ?auto_687315 ) ( ON ?auto_687313 ?auto_687314 ) ( CLEAR ?auto_687311 ) ( ON ?auto_687312 ?auto_687313 ) ( CLEAR ?auto_687312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_687311 ?auto_687312 )
      ( MAKE-17PILE ?auto_687311 ?auto_687312 ?auto_687313 ?auto_687314 ?auto_687315 ?auto_687316 ?auto_687317 ?auto_687318 ?auto_687319 ?auto_687320 ?auto_687321 ?auto_687322 ?auto_687323 ?auto_687324 ?auto_687325 ?auto_687326 ?auto_687327 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_687345 - BLOCK
      ?auto_687346 - BLOCK
      ?auto_687347 - BLOCK
      ?auto_687348 - BLOCK
      ?auto_687349 - BLOCK
      ?auto_687350 - BLOCK
      ?auto_687351 - BLOCK
      ?auto_687352 - BLOCK
      ?auto_687353 - BLOCK
      ?auto_687354 - BLOCK
      ?auto_687355 - BLOCK
      ?auto_687356 - BLOCK
      ?auto_687357 - BLOCK
      ?auto_687358 - BLOCK
      ?auto_687359 - BLOCK
      ?auto_687360 - BLOCK
      ?auto_687361 - BLOCK
    )
    :vars
    (
      ?auto_687362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_687361 ?auto_687362 ) ( not ( = ?auto_687345 ?auto_687346 ) ) ( not ( = ?auto_687345 ?auto_687347 ) ) ( not ( = ?auto_687345 ?auto_687348 ) ) ( not ( = ?auto_687345 ?auto_687349 ) ) ( not ( = ?auto_687345 ?auto_687350 ) ) ( not ( = ?auto_687345 ?auto_687351 ) ) ( not ( = ?auto_687345 ?auto_687352 ) ) ( not ( = ?auto_687345 ?auto_687353 ) ) ( not ( = ?auto_687345 ?auto_687354 ) ) ( not ( = ?auto_687345 ?auto_687355 ) ) ( not ( = ?auto_687345 ?auto_687356 ) ) ( not ( = ?auto_687345 ?auto_687357 ) ) ( not ( = ?auto_687345 ?auto_687358 ) ) ( not ( = ?auto_687345 ?auto_687359 ) ) ( not ( = ?auto_687345 ?auto_687360 ) ) ( not ( = ?auto_687345 ?auto_687361 ) ) ( not ( = ?auto_687345 ?auto_687362 ) ) ( not ( = ?auto_687346 ?auto_687347 ) ) ( not ( = ?auto_687346 ?auto_687348 ) ) ( not ( = ?auto_687346 ?auto_687349 ) ) ( not ( = ?auto_687346 ?auto_687350 ) ) ( not ( = ?auto_687346 ?auto_687351 ) ) ( not ( = ?auto_687346 ?auto_687352 ) ) ( not ( = ?auto_687346 ?auto_687353 ) ) ( not ( = ?auto_687346 ?auto_687354 ) ) ( not ( = ?auto_687346 ?auto_687355 ) ) ( not ( = ?auto_687346 ?auto_687356 ) ) ( not ( = ?auto_687346 ?auto_687357 ) ) ( not ( = ?auto_687346 ?auto_687358 ) ) ( not ( = ?auto_687346 ?auto_687359 ) ) ( not ( = ?auto_687346 ?auto_687360 ) ) ( not ( = ?auto_687346 ?auto_687361 ) ) ( not ( = ?auto_687346 ?auto_687362 ) ) ( not ( = ?auto_687347 ?auto_687348 ) ) ( not ( = ?auto_687347 ?auto_687349 ) ) ( not ( = ?auto_687347 ?auto_687350 ) ) ( not ( = ?auto_687347 ?auto_687351 ) ) ( not ( = ?auto_687347 ?auto_687352 ) ) ( not ( = ?auto_687347 ?auto_687353 ) ) ( not ( = ?auto_687347 ?auto_687354 ) ) ( not ( = ?auto_687347 ?auto_687355 ) ) ( not ( = ?auto_687347 ?auto_687356 ) ) ( not ( = ?auto_687347 ?auto_687357 ) ) ( not ( = ?auto_687347 ?auto_687358 ) ) ( not ( = ?auto_687347 ?auto_687359 ) ) ( not ( = ?auto_687347 ?auto_687360 ) ) ( not ( = ?auto_687347 ?auto_687361 ) ) ( not ( = ?auto_687347 ?auto_687362 ) ) ( not ( = ?auto_687348 ?auto_687349 ) ) ( not ( = ?auto_687348 ?auto_687350 ) ) ( not ( = ?auto_687348 ?auto_687351 ) ) ( not ( = ?auto_687348 ?auto_687352 ) ) ( not ( = ?auto_687348 ?auto_687353 ) ) ( not ( = ?auto_687348 ?auto_687354 ) ) ( not ( = ?auto_687348 ?auto_687355 ) ) ( not ( = ?auto_687348 ?auto_687356 ) ) ( not ( = ?auto_687348 ?auto_687357 ) ) ( not ( = ?auto_687348 ?auto_687358 ) ) ( not ( = ?auto_687348 ?auto_687359 ) ) ( not ( = ?auto_687348 ?auto_687360 ) ) ( not ( = ?auto_687348 ?auto_687361 ) ) ( not ( = ?auto_687348 ?auto_687362 ) ) ( not ( = ?auto_687349 ?auto_687350 ) ) ( not ( = ?auto_687349 ?auto_687351 ) ) ( not ( = ?auto_687349 ?auto_687352 ) ) ( not ( = ?auto_687349 ?auto_687353 ) ) ( not ( = ?auto_687349 ?auto_687354 ) ) ( not ( = ?auto_687349 ?auto_687355 ) ) ( not ( = ?auto_687349 ?auto_687356 ) ) ( not ( = ?auto_687349 ?auto_687357 ) ) ( not ( = ?auto_687349 ?auto_687358 ) ) ( not ( = ?auto_687349 ?auto_687359 ) ) ( not ( = ?auto_687349 ?auto_687360 ) ) ( not ( = ?auto_687349 ?auto_687361 ) ) ( not ( = ?auto_687349 ?auto_687362 ) ) ( not ( = ?auto_687350 ?auto_687351 ) ) ( not ( = ?auto_687350 ?auto_687352 ) ) ( not ( = ?auto_687350 ?auto_687353 ) ) ( not ( = ?auto_687350 ?auto_687354 ) ) ( not ( = ?auto_687350 ?auto_687355 ) ) ( not ( = ?auto_687350 ?auto_687356 ) ) ( not ( = ?auto_687350 ?auto_687357 ) ) ( not ( = ?auto_687350 ?auto_687358 ) ) ( not ( = ?auto_687350 ?auto_687359 ) ) ( not ( = ?auto_687350 ?auto_687360 ) ) ( not ( = ?auto_687350 ?auto_687361 ) ) ( not ( = ?auto_687350 ?auto_687362 ) ) ( not ( = ?auto_687351 ?auto_687352 ) ) ( not ( = ?auto_687351 ?auto_687353 ) ) ( not ( = ?auto_687351 ?auto_687354 ) ) ( not ( = ?auto_687351 ?auto_687355 ) ) ( not ( = ?auto_687351 ?auto_687356 ) ) ( not ( = ?auto_687351 ?auto_687357 ) ) ( not ( = ?auto_687351 ?auto_687358 ) ) ( not ( = ?auto_687351 ?auto_687359 ) ) ( not ( = ?auto_687351 ?auto_687360 ) ) ( not ( = ?auto_687351 ?auto_687361 ) ) ( not ( = ?auto_687351 ?auto_687362 ) ) ( not ( = ?auto_687352 ?auto_687353 ) ) ( not ( = ?auto_687352 ?auto_687354 ) ) ( not ( = ?auto_687352 ?auto_687355 ) ) ( not ( = ?auto_687352 ?auto_687356 ) ) ( not ( = ?auto_687352 ?auto_687357 ) ) ( not ( = ?auto_687352 ?auto_687358 ) ) ( not ( = ?auto_687352 ?auto_687359 ) ) ( not ( = ?auto_687352 ?auto_687360 ) ) ( not ( = ?auto_687352 ?auto_687361 ) ) ( not ( = ?auto_687352 ?auto_687362 ) ) ( not ( = ?auto_687353 ?auto_687354 ) ) ( not ( = ?auto_687353 ?auto_687355 ) ) ( not ( = ?auto_687353 ?auto_687356 ) ) ( not ( = ?auto_687353 ?auto_687357 ) ) ( not ( = ?auto_687353 ?auto_687358 ) ) ( not ( = ?auto_687353 ?auto_687359 ) ) ( not ( = ?auto_687353 ?auto_687360 ) ) ( not ( = ?auto_687353 ?auto_687361 ) ) ( not ( = ?auto_687353 ?auto_687362 ) ) ( not ( = ?auto_687354 ?auto_687355 ) ) ( not ( = ?auto_687354 ?auto_687356 ) ) ( not ( = ?auto_687354 ?auto_687357 ) ) ( not ( = ?auto_687354 ?auto_687358 ) ) ( not ( = ?auto_687354 ?auto_687359 ) ) ( not ( = ?auto_687354 ?auto_687360 ) ) ( not ( = ?auto_687354 ?auto_687361 ) ) ( not ( = ?auto_687354 ?auto_687362 ) ) ( not ( = ?auto_687355 ?auto_687356 ) ) ( not ( = ?auto_687355 ?auto_687357 ) ) ( not ( = ?auto_687355 ?auto_687358 ) ) ( not ( = ?auto_687355 ?auto_687359 ) ) ( not ( = ?auto_687355 ?auto_687360 ) ) ( not ( = ?auto_687355 ?auto_687361 ) ) ( not ( = ?auto_687355 ?auto_687362 ) ) ( not ( = ?auto_687356 ?auto_687357 ) ) ( not ( = ?auto_687356 ?auto_687358 ) ) ( not ( = ?auto_687356 ?auto_687359 ) ) ( not ( = ?auto_687356 ?auto_687360 ) ) ( not ( = ?auto_687356 ?auto_687361 ) ) ( not ( = ?auto_687356 ?auto_687362 ) ) ( not ( = ?auto_687357 ?auto_687358 ) ) ( not ( = ?auto_687357 ?auto_687359 ) ) ( not ( = ?auto_687357 ?auto_687360 ) ) ( not ( = ?auto_687357 ?auto_687361 ) ) ( not ( = ?auto_687357 ?auto_687362 ) ) ( not ( = ?auto_687358 ?auto_687359 ) ) ( not ( = ?auto_687358 ?auto_687360 ) ) ( not ( = ?auto_687358 ?auto_687361 ) ) ( not ( = ?auto_687358 ?auto_687362 ) ) ( not ( = ?auto_687359 ?auto_687360 ) ) ( not ( = ?auto_687359 ?auto_687361 ) ) ( not ( = ?auto_687359 ?auto_687362 ) ) ( not ( = ?auto_687360 ?auto_687361 ) ) ( not ( = ?auto_687360 ?auto_687362 ) ) ( not ( = ?auto_687361 ?auto_687362 ) ) ( ON ?auto_687360 ?auto_687361 ) ( ON ?auto_687359 ?auto_687360 ) ( ON ?auto_687358 ?auto_687359 ) ( ON ?auto_687357 ?auto_687358 ) ( ON ?auto_687356 ?auto_687357 ) ( ON ?auto_687355 ?auto_687356 ) ( ON ?auto_687354 ?auto_687355 ) ( ON ?auto_687353 ?auto_687354 ) ( ON ?auto_687352 ?auto_687353 ) ( ON ?auto_687351 ?auto_687352 ) ( ON ?auto_687350 ?auto_687351 ) ( ON ?auto_687349 ?auto_687350 ) ( ON ?auto_687348 ?auto_687349 ) ( ON ?auto_687347 ?auto_687348 ) ( ON ?auto_687346 ?auto_687347 ) ( ON ?auto_687345 ?auto_687346 ) ( CLEAR ?auto_687345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_687345 )
      ( MAKE-17PILE ?auto_687345 ?auto_687346 ?auto_687347 ?auto_687348 ?auto_687349 ?auto_687350 ?auto_687351 ?auto_687352 ?auto_687353 ?auto_687354 ?auto_687355 ?auto_687356 ?auto_687357 ?auto_687358 ?auto_687359 ?auto_687360 ?auto_687361 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_687380 - BLOCK
      ?auto_687381 - BLOCK
      ?auto_687382 - BLOCK
      ?auto_687383 - BLOCK
      ?auto_687384 - BLOCK
      ?auto_687385 - BLOCK
      ?auto_687386 - BLOCK
      ?auto_687387 - BLOCK
      ?auto_687388 - BLOCK
      ?auto_687389 - BLOCK
      ?auto_687390 - BLOCK
      ?auto_687391 - BLOCK
      ?auto_687392 - BLOCK
      ?auto_687393 - BLOCK
      ?auto_687394 - BLOCK
      ?auto_687395 - BLOCK
      ?auto_687396 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_687396 ) ( not ( = ?auto_687380 ?auto_687381 ) ) ( not ( = ?auto_687380 ?auto_687382 ) ) ( not ( = ?auto_687380 ?auto_687383 ) ) ( not ( = ?auto_687380 ?auto_687384 ) ) ( not ( = ?auto_687380 ?auto_687385 ) ) ( not ( = ?auto_687380 ?auto_687386 ) ) ( not ( = ?auto_687380 ?auto_687387 ) ) ( not ( = ?auto_687380 ?auto_687388 ) ) ( not ( = ?auto_687380 ?auto_687389 ) ) ( not ( = ?auto_687380 ?auto_687390 ) ) ( not ( = ?auto_687380 ?auto_687391 ) ) ( not ( = ?auto_687380 ?auto_687392 ) ) ( not ( = ?auto_687380 ?auto_687393 ) ) ( not ( = ?auto_687380 ?auto_687394 ) ) ( not ( = ?auto_687380 ?auto_687395 ) ) ( not ( = ?auto_687380 ?auto_687396 ) ) ( not ( = ?auto_687381 ?auto_687382 ) ) ( not ( = ?auto_687381 ?auto_687383 ) ) ( not ( = ?auto_687381 ?auto_687384 ) ) ( not ( = ?auto_687381 ?auto_687385 ) ) ( not ( = ?auto_687381 ?auto_687386 ) ) ( not ( = ?auto_687381 ?auto_687387 ) ) ( not ( = ?auto_687381 ?auto_687388 ) ) ( not ( = ?auto_687381 ?auto_687389 ) ) ( not ( = ?auto_687381 ?auto_687390 ) ) ( not ( = ?auto_687381 ?auto_687391 ) ) ( not ( = ?auto_687381 ?auto_687392 ) ) ( not ( = ?auto_687381 ?auto_687393 ) ) ( not ( = ?auto_687381 ?auto_687394 ) ) ( not ( = ?auto_687381 ?auto_687395 ) ) ( not ( = ?auto_687381 ?auto_687396 ) ) ( not ( = ?auto_687382 ?auto_687383 ) ) ( not ( = ?auto_687382 ?auto_687384 ) ) ( not ( = ?auto_687382 ?auto_687385 ) ) ( not ( = ?auto_687382 ?auto_687386 ) ) ( not ( = ?auto_687382 ?auto_687387 ) ) ( not ( = ?auto_687382 ?auto_687388 ) ) ( not ( = ?auto_687382 ?auto_687389 ) ) ( not ( = ?auto_687382 ?auto_687390 ) ) ( not ( = ?auto_687382 ?auto_687391 ) ) ( not ( = ?auto_687382 ?auto_687392 ) ) ( not ( = ?auto_687382 ?auto_687393 ) ) ( not ( = ?auto_687382 ?auto_687394 ) ) ( not ( = ?auto_687382 ?auto_687395 ) ) ( not ( = ?auto_687382 ?auto_687396 ) ) ( not ( = ?auto_687383 ?auto_687384 ) ) ( not ( = ?auto_687383 ?auto_687385 ) ) ( not ( = ?auto_687383 ?auto_687386 ) ) ( not ( = ?auto_687383 ?auto_687387 ) ) ( not ( = ?auto_687383 ?auto_687388 ) ) ( not ( = ?auto_687383 ?auto_687389 ) ) ( not ( = ?auto_687383 ?auto_687390 ) ) ( not ( = ?auto_687383 ?auto_687391 ) ) ( not ( = ?auto_687383 ?auto_687392 ) ) ( not ( = ?auto_687383 ?auto_687393 ) ) ( not ( = ?auto_687383 ?auto_687394 ) ) ( not ( = ?auto_687383 ?auto_687395 ) ) ( not ( = ?auto_687383 ?auto_687396 ) ) ( not ( = ?auto_687384 ?auto_687385 ) ) ( not ( = ?auto_687384 ?auto_687386 ) ) ( not ( = ?auto_687384 ?auto_687387 ) ) ( not ( = ?auto_687384 ?auto_687388 ) ) ( not ( = ?auto_687384 ?auto_687389 ) ) ( not ( = ?auto_687384 ?auto_687390 ) ) ( not ( = ?auto_687384 ?auto_687391 ) ) ( not ( = ?auto_687384 ?auto_687392 ) ) ( not ( = ?auto_687384 ?auto_687393 ) ) ( not ( = ?auto_687384 ?auto_687394 ) ) ( not ( = ?auto_687384 ?auto_687395 ) ) ( not ( = ?auto_687384 ?auto_687396 ) ) ( not ( = ?auto_687385 ?auto_687386 ) ) ( not ( = ?auto_687385 ?auto_687387 ) ) ( not ( = ?auto_687385 ?auto_687388 ) ) ( not ( = ?auto_687385 ?auto_687389 ) ) ( not ( = ?auto_687385 ?auto_687390 ) ) ( not ( = ?auto_687385 ?auto_687391 ) ) ( not ( = ?auto_687385 ?auto_687392 ) ) ( not ( = ?auto_687385 ?auto_687393 ) ) ( not ( = ?auto_687385 ?auto_687394 ) ) ( not ( = ?auto_687385 ?auto_687395 ) ) ( not ( = ?auto_687385 ?auto_687396 ) ) ( not ( = ?auto_687386 ?auto_687387 ) ) ( not ( = ?auto_687386 ?auto_687388 ) ) ( not ( = ?auto_687386 ?auto_687389 ) ) ( not ( = ?auto_687386 ?auto_687390 ) ) ( not ( = ?auto_687386 ?auto_687391 ) ) ( not ( = ?auto_687386 ?auto_687392 ) ) ( not ( = ?auto_687386 ?auto_687393 ) ) ( not ( = ?auto_687386 ?auto_687394 ) ) ( not ( = ?auto_687386 ?auto_687395 ) ) ( not ( = ?auto_687386 ?auto_687396 ) ) ( not ( = ?auto_687387 ?auto_687388 ) ) ( not ( = ?auto_687387 ?auto_687389 ) ) ( not ( = ?auto_687387 ?auto_687390 ) ) ( not ( = ?auto_687387 ?auto_687391 ) ) ( not ( = ?auto_687387 ?auto_687392 ) ) ( not ( = ?auto_687387 ?auto_687393 ) ) ( not ( = ?auto_687387 ?auto_687394 ) ) ( not ( = ?auto_687387 ?auto_687395 ) ) ( not ( = ?auto_687387 ?auto_687396 ) ) ( not ( = ?auto_687388 ?auto_687389 ) ) ( not ( = ?auto_687388 ?auto_687390 ) ) ( not ( = ?auto_687388 ?auto_687391 ) ) ( not ( = ?auto_687388 ?auto_687392 ) ) ( not ( = ?auto_687388 ?auto_687393 ) ) ( not ( = ?auto_687388 ?auto_687394 ) ) ( not ( = ?auto_687388 ?auto_687395 ) ) ( not ( = ?auto_687388 ?auto_687396 ) ) ( not ( = ?auto_687389 ?auto_687390 ) ) ( not ( = ?auto_687389 ?auto_687391 ) ) ( not ( = ?auto_687389 ?auto_687392 ) ) ( not ( = ?auto_687389 ?auto_687393 ) ) ( not ( = ?auto_687389 ?auto_687394 ) ) ( not ( = ?auto_687389 ?auto_687395 ) ) ( not ( = ?auto_687389 ?auto_687396 ) ) ( not ( = ?auto_687390 ?auto_687391 ) ) ( not ( = ?auto_687390 ?auto_687392 ) ) ( not ( = ?auto_687390 ?auto_687393 ) ) ( not ( = ?auto_687390 ?auto_687394 ) ) ( not ( = ?auto_687390 ?auto_687395 ) ) ( not ( = ?auto_687390 ?auto_687396 ) ) ( not ( = ?auto_687391 ?auto_687392 ) ) ( not ( = ?auto_687391 ?auto_687393 ) ) ( not ( = ?auto_687391 ?auto_687394 ) ) ( not ( = ?auto_687391 ?auto_687395 ) ) ( not ( = ?auto_687391 ?auto_687396 ) ) ( not ( = ?auto_687392 ?auto_687393 ) ) ( not ( = ?auto_687392 ?auto_687394 ) ) ( not ( = ?auto_687392 ?auto_687395 ) ) ( not ( = ?auto_687392 ?auto_687396 ) ) ( not ( = ?auto_687393 ?auto_687394 ) ) ( not ( = ?auto_687393 ?auto_687395 ) ) ( not ( = ?auto_687393 ?auto_687396 ) ) ( not ( = ?auto_687394 ?auto_687395 ) ) ( not ( = ?auto_687394 ?auto_687396 ) ) ( not ( = ?auto_687395 ?auto_687396 ) ) ( ON ?auto_687395 ?auto_687396 ) ( ON ?auto_687394 ?auto_687395 ) ( ON ?auto_687393 ?auto_687394 ) ( ON ?auto_687392 ?auto_687393 ) ( ON ?auto_687391 ?auto_687392 ) ( ON ?auto_687390 ?auto_687391 ) ( ON ?auto_687389 ?auto_687390 ) ( ON ?auto_687388 ?auto_687389 ) ( ON ?auto_687387 ?auto_687388 ) ( ON ?auto_687386 ?auto_687387 ) ( ON ?auto_687385 ?auto_687386 ) ( ON ?auto_687384 ?auto_687385 ) ( ON ?auto_687383 ?auto_687384 ) ( ON ?auto_687382 ?auto_687383 ) ( ON ?auto_687381 ?auto_687382 ) ( ON ?auto_687380 ?auto_687381 ) ( CLEAR ?auto_687380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_687380 )
      ( MAKE-17PILE ?auto_687380 ?auto_687381 ?auto_687382 ?auto_687383 ?auto_687384 ?auto_687385 ?auto_687386 ?auto_687387 ?auto_687388 ?auto_687389 ?auto_687390 ?auto_687391 ?auto_687392 ?auto_687393 ?auto_687394 ?auto_687395 ?auto_687396 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_687414 - BLOCK
      ?auto_687415 - BLOCK
      ?auto_687416 - BLOCK
      ?auto_687417 - BLOCK
      ?auto_687418 - BLOCK
      ?auto_687419 - BLOCK
      ?auto_687420 - BLOCK
      ?auto_687421 - BLOCK
      ?auto_687422 - BLOCK
      ?auto_687423 - BLOCK
      ?auto_687424 - BLOCK
      ?auto_687425 - BLOCK
      ?auto_687426 - BLOCK
      ?auto_687427 - BLOCK
      ?auto_687428 - BLOCK
      ?auto_687429 - BLOCK
      ?auto_687430 - BLOCK
    )
    :vars
    (
      ?auto_687431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_687414 ?auto_687415 ) ) ( not ( = ?auto_687414 ?auto_687416 ) ) ( not ( = ?auto_687414 ?auto_687417 ) ) ( not ( = ?auto_687414 ?auto_687418 ) ) ( not ( = ?auto_687414 ?auto_687419 ) ) ( not ( = ?auto_687414 ?auto_687420 ) ) ( not ( = ?auto_687414 ?auto_687421 ) ) ( not ( = ?auto_687414 ?auto_687422 ) ) ( not ( = ?auto_687414 ?auto_687423 ) ) ( not ( = ?auto_687414 ?auto_687424 ) ) ( not ( = ?auto_687414 ?auto_687425 ) ) ( not ( = ?auto_687414 ?auto_687426 ) ) ( not ( = ?auto_687414 ?auto_687427 ) ) ( not ( = ?auto_687414 ?auto_687428 ) ) ( not ( = ?auto_687414 ?auto_687429 ) ) ( not ( = ?auto_687414 ?auto_687430 ) ) ( not ( = ?auto_687415 ?auto_687416 ) ) ( not ( = ?auto_687415 ?auto_687417 ) ) ( not ( = ?auto_687415 ?auto_687418 ) ) ( not ( = ?auto_687415 ?auto_687419 ) ) ( not ( = ?auto_687415 ?auto_687420 ) ) ( not ( = ?auto_687415 ?auto_687421 ) ) ( not ( = ?auto_687415 ?auto_687422 ) ) ( not ( = ?auto_687415 ?auto_687423 ) ) ( not ( = ?auto_687415 ?auto_687424 ) ) ( not ( = ?auto_687415 ?auto_687425 ) ) ( not ( = ?auto_687415 ?auto_687426 ) ) ( not ( = ?auto_687415 ?auto_687427 ) ) ( not ( = ?auto_687415 ?auto_687428 ) ) ( not ( = ?auto_687415 ?auto_687429 ) ) ( not ( = ?auto_687415 ?auto_687430 ) ) ( not ( = ?auto_687416 ?auto_687417 ) ) ( not ( = ?auto_687416 ?auto_687418 ) ) ( not ( = ?auto_687416 ?auto_687419 ) ) ( not ( = ?auto_687416 ?auto_687420 ) ) ( not ( = ?auto_687416 ?auto_687421 ) ) ( not ( = ?auto_687416 ?auto_687422 ) ) ( not ( = ?auto_687416 ?auto_687423 ) ) ( not ( = ?auto_687416 ?auto_687424 ) ) ( not ( = ?auto_687416 ?auto_687425 ) ) ( not ( = ?auto_687416 ?auto_687426 ) ) ( not ( = ?auto_687416 ?auto_687427 ) ) ( not ( = ?auto_687416 ?auto_687428 ) ) ( not ( = ?auto_687416 ?auto_687429 ) ) ( not ( = ?auto_687416 ?auto_687430 ) ) ( not ( = ?auto_687417 ?auto_687418 ) ) ( not ( = ?auto_687417 ?auto_687419 ) ) ( not ( = ?auto_687417 ?auto_687420 ) ) ( not ( = ?auto_687417 ?auto_687421 ) ) ( not ( = ?auto_687417 ?auto_687422 ) ) ( not ( = ?auto_687417 ?auto_687423 ) ) ( not ( = ?auto_687417 ?auto_687424 ) ) ( not ( = ?auto_687417 ?auto_687425 ) ) ( not ( = ?auto_687417 ?auto_687426 ) ) ( not ( = ?auto_687417 ?auto_687427 ) ) ( not ( = ?auto_687417 ?auto_687428 ) ) ( not ( = ?auto_687417 ?auto_687429 ) ) ( not ( = ?auto_687417 ?auto_687430 ) ) ( not ( = ?auto_687418 ?auto_687419 ) ) ( not ( = ?auto_687418 ?auto_687420 ) ) ( not ( = ?auto_687418 ?auto_687421 ) ) ( not ( = ?auto_687418 ?auto_687422 ) ) ( not ( = ?auto_687418 ?auto_687423 ) ) ( not ( = ?auto_687418 ?auto_687424 ) ) ( not ( = ?auto_687418 ?auto_687425 ) ) ( not ( = ?auto_687418 ?auto_687426 ) ) ( not ( = ?auto_687418 ?auto_687427 ) ) ( not ( = ?auto_687418 ?auto_687428 ) ) ( not ( = ?auto_687418 ?auto_687429 ) ) ( not ( = ?auto_687418 ?auto_687430 ) ) ( not ( = ?auto_687419 ?auto_687420 ) ) ( not ( = ?auto_687419 ?auto_687421 ) ) ( not ( = ?auto_687419 ?auto_687422 ) ) ( not ( = ?auto_687419 ?auto_687423 ) ) ( not ( = ?auto_687419 ?auto_687424 ) ) ( not ( = ?auto_687419 ?auto_687425 ) ) ( not ( = ?auto_687419 ?auto_687426 ) ) ( not ( = ?auto_687419 ?auto_687427 ) ) ( not ( = ?auto_687419 ?auto_687428 ) ) ( not ( = ?auto_687419 ?auto_687429 ) ) ( not ( = ?auto_687419 ?auto_687430 ) ) ( not ( = ?auto_687420 ?auto_687421 ) ) ( not ( = ?auto_687420 ?auto_687422 ) ) ( not ( = ?auto_687420 ?auto_687423 ) ) ( not ( = ?auto_687420 ?auto_687424 ) ) ( not ( = ?auto_687420 ?auto_687425 ) ) ( not ( = ?auto_687420 ?auto_687426 ) ) ( not ( = ?auto_687420 ?auto_687427 ) ) ( not ( = ?auto_687420 ?auto_687428 ) ) ( not ( = ?auto_687420 ?auto_687429 ) ) ( not ( = ?auto_687420 ?auto_687430 ) ) ( not ( = ?auto_687421 ?auto_687422 ) ) ( not ( = ?auto_687421 ?auto_687423 ) ) ( not ( = ?auto_687421 ?auto_687424 ) ) ( not ( = ?auto_687421 ?auto_687425 ) ) ( not ( = ?auto_687421 ?auto_687426 ) ) ( not ( = ?auto_687421 ?auto_687427 ) ) ( not ( = ?auto_687421 ?auto_687428 ) ) ( not ( = ?auto_687421 ?auto_687429 ) ) ( not ( = ?auto_687421 ?auto_687430 ) ) ( not ( = ?auto_687422 ?auto_687423 ) ) ( not ( = ?auto_687422 ?auto_687424 ) ) ( not ( = ?auto_687422 ?auto_687425 ) ) ( not ( = ?auto_687422 ?auto_687426 ) ) ( not ( = ?auto_687422 ?auto_687427 ) ) ( not ( = ?auto_687422 ?auto_687428 ) ) ( not ( = ?auto_687422 ?auto_687429 ) ) ( not ( = ?auto_687422 ?auto_687430 ) ) ( not ( = ?auto_687423 ?auto_687424 ) ) ( not ( = ?auto_687423 ?auto_687425 ) ) ( not ( = ?auto_687423 ?auto_687426 ) ) ( not ( = ?auto_687423 ?auto_687427 ) ) ( not ( = ?auto_687423 ?auto_687428 ) ) ( not ( = ?auto_687423 ?auto_687429 ) ) ( not ( = ?auto_687423 ?auto_687430 ) ) ( not ( = ?auto_687424 ?auto_687425 ) ) ( not ( = ?auto_687424 ?auto_687426 ) ) ( not ( = ?auto_687424 ?auto_687427 ) ) ( not ( = ?auto_687424 ?auto_687428 ) ) ( not ( = ?auto_687424 ?auto_687429 ) ) ( not ( = ?auto_687424 ?auto_687430 ) ) ( not ( = ?auto_687425 ?auto_687426 ) ) ( not ( = ?auto_687425 ?auto_687427 ) ) ( not ( = ?auto_687425 ?auto_687428 ) ) ( not ( = ?auto_687425 ?auto_687429 ) ) ( not ( = ?auto_687425 ?auto_687430 ) ) ( not ( = ?auto_687426 ?auto_687427 ) ) ( not ( = ?auto_687426 ?auto_687428 ) ) ( not ( = ?auto_687426 ?auto_687429 ) ) ( not ( = ?auto_687426 ?auto_687430 ) ) ( not ( = ?auto_687427 ?auto_687428 ) ) ( not ( = ?auto_687427 ?auto_687429 ) ) ( not ( = ?auto_687427 ?auto_687430 ) ) ( not ( = ?auto_687428 ?auto_687429 ) ) ( not ( = ?auto_687428 ?auto_687430 ) ) ( not ( = ?auto_687429 ?auto_687430 ) ) ( ON ?auto_687414 ?auto_687431 ) ( not ( = ?auto_687430 ?auto_687431 ) ) ( not ( = ?auto_687429 ?auto_687431 ) ) ( not ( = ?auto_687428 ?auto_687431 ) ) ( not ( = ?auto_687427 ?auto_687431 ) ) ( not ( = ?auto_687426 ?auto_687431 ) ) ( not ( = ?auto_687425 ?auto_687431 ) ) ( not ( = ?auto_687424 ?auto_687431 ) ) ( not ( = ?auto_687423 ?auto_687431 ) ) ( not ( = ?auto_687422 ?auto_687431 ) ) ( not ( = ?auto_687421 ?auto_687431 ) ) ( not ( = ?auto_687420 ?auto_687431 ) ) ( not ( = ?auto_687419 ?auto_687431 ) ) ( not ( = ?auto_687418 ?auto_687431 ) ) ( not ( = ?auto_687417 ?auto_687431 ) ) ( not ( = ?auto_687416 ?auto_687431 ) ) ( not ( = ?auto_687415 ?auto_687431 ) ) ( not ( = ?auto_687414 ?auto_687431 ) ) ( ON ?auto_687415 ?auto_687414 ) ( ON ?auto_687416 ?auto_687415 ) ( ON ?auto_687417 ?auto_687416 ) ( ON ?auto_687418 ?auto_687417 ) ( ON ?auto_687419 ?auto_687418 ) ( ON ?auto_687420 ?auto_687419 ) ( ON ?auto_687421 ?auto_687420 ) ( ON ?auto_687422 ?auto_687421 ) ( ON ?auto_687423 ?auto_687422 ) ( ON ?auto_687424 ?auto_687423 ) ( ON ?auto_687425 ?auto_687424 ) ( ON ?auto_687426 ?auto_687425 ) ( ON ?auto_687427 ?auto_687426 ) ( ON ?auto_687428 ?auto_687427 ) ( ON ?auto_687429 ?auto_687428 ) ( ON ?auto_687430 ?auto_687429 ) ( CLEAR ?auto_687430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_687430 ?auto_687429 ?auto_687428 ?auto_687427 ?auto_687426 ?auto_687425 ?auto_687424 ?auto_687423 ?auto_687422 ?auto_687421 ?auto_687420 ?auto_687419 ?auto_687418 ?auto_687417 ?auto_687416 ?auto_687415 ?auto_687414 )
      ( MAKE-17PILE ?auto_687414 ?auto_687415 ?auto_687416 ?auto_687417 ?auto_687418 ?auto_687419 ?auto_687420 ?auto_687421 ?auto_687422 ?auto_687423 ?auto_687424 ?auto_687425 ?auto_687426 ?auto_687427 ?auto_687428 ?auto_687429 ?auto_687430 ) )
  )

)

