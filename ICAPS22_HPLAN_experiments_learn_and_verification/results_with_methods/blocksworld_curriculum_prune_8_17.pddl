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
      ?auto_46030 - BLOCK
    )
    :vars
    (
      ?auto_46031 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46030 ?auto_46031 ) ( CLEAR ?auto_46030 ) ( HAND-EMPTY ) ( not ( = ?auto_46030 ?auto_46031 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46030 ?auto_46031 )
      ( !PUTDOWN ?auto_46030 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46037 - BLOCK
      ?auto_46038 - BLOCK
    )
    :vars
    (
      ?auto_46039 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_46037 ) ( ON ?auto_46038 ?auto_46039 ) ( CLEAR ?auto_46038 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46037 ) ( not ( = ?auto_46037 ?auto_46038 ) ) ( not ( = ?auto_46037 ?auto_46039 ) ) ( not ( = ?auto_46038 ?auto_46039 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46038 ?auto_46039 )
      ( !STACK ?auto_46038 ?auto_46037 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46047 - BLOCK
      ?auto_46048 - BLOCK
    )
    :vars
    (
      ?auto_46049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46048 ?auto_46049 ) ( not ( = ?auto_46047 ?auto_46048 ) ) ( not ( = ?auto_46047 ?auto_46049 ) ) ( not ( = ?auto_46048 ?auto_46049 ) ) ( ON ?auto_46047 ?auto_46048 ) ( CLEAR ?auto_46047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46047 )
      ( MAKE-2PILE ?auto_46047 ?auto_46048 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46058 - BLOCK
      ?auto_46059 - BLOCK
      ?auto_46060 - BLOCK
    )
    :vars
    (
      ?auto_46061 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_46059 ) ( ON ?auto_46060 ?auto_46061 ) ( CLEAR ?auto_46060 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46058 ) ( ON ?auto_46059 ?auto_46058 ) ( not ( = ?auto_46058 ?auto_46059 ) ) ( not ( = ?auto_46058 ?auto_46060 ) ) ( not ( = ?auto_46058 ?auto_46061 ) ) ( not ( = ?auto_46059 ?auto_46060 ) ) ( not ( = ?auto_46059 ?auto_46061 ) ) ( not ( = ?auto_46060 ?auto_46061 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46060 ?auto_46061 )
      ( !STACK ?auto_46060 ?auto_46059 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46072 - BLOCK
      ?auto_46073 - BLOCK
      ?auto_46074 - BLOCK
    )
    :vars
    (
      ?auto_46075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46074 ?auto_46075 ) ( ON-TABLE ?auto_46072 ) ( not ( = ?auto_46072 ?auto_46073 ) ) ( not ( = ?auto_46072 ?auto_46074 ) ) ( not ( = ?auto_46072 ?auto_46075 ) ) ( not ( = ?auto_46073 ?auto_46074 ) ) ( not ( = ?auto_46073 ?auto_46075 ) ) ( not ( = ?auto_46074 ?auto_46075 ) ) ( CLEAR ?auto_46072 ) ( ON ?auto_46073 ?auto_46074 ) ( CLEAR ?auto_46073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46072 ?auto_46073 )
      ( MAKE-3PILE ?auto_46072 ?auto_46073 ?auto_46074 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46086 - BLOCK
      ?auto_46087 - BLOCK
      ?auto_46088 - BLOCK
    )
    :vars
    (
      ?auto_46089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46088 ?auto_46089 ) ( not ( = ?auto_46086 ?auto_46087 ) ) ( not ( = ?auto_46086 ?auto_46088 ) ) ( not ( = ?auto_46086 ?auto_46089 ) ) ( not ( = ?auto_46087 ?auto_46088 ) ) ( not ( = ?auto_46087 ?auto_46089 ) ) ( not ( = ?auto_46088 ?auto_46089 ) ) ( ON ?auto_46087 ?auto_46088 ) ( ON ?auto_46086 ?auto_46087 ) ( CLEAR ?auto_46086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46086 )
      ( MAKE-3PILE ?auto_46086 ?auto_46087 ?auto_46088 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46101 - BLOCK
      ?auto_46102 - BLOCK
      ?auto_46103 - BLOCK
      ?auto_46104 - BLOCK
    )
    :vars
    (
      ?auto_46105 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_46103 ) ( ON ?auto_46104 ?auto_46105 ) ( CLEAR ?auto_46104 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46101 ) ( ON ?auto_46102 ?auto_46101 ) ( ON ?auto_46103 ?auto_46102 ) ( not ( = ?auto_46101 ?auto_46102 ) ) ( not ( = ?auto_46101 ?auto_46103 ) ) ( not ( = ?auto_46101 ?auto_46104 ) ) ( not ( = ?auto_46101 ?auto_46105 ) ) ( not ( = ?auto_46102 ?auto_46103 ) ) ( not ( = ?auto_46102 ?auto_46104 ) ) ( not ( = ?auto_46102 ?auto_46105 ) ) ( not ( = ?auto_46103 ?auto_46104 ) ) ( not ( = ?auto_46103 ?auto_46105 ) ) ( not ( = ?auto_46104 ?auto_46105 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46104 ?auto_46105 )
      ( !STACK ?auto_46104 ?auto_46103 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46119 - BLOCK
      ?auto_46120 - BLOCK
      ?auto_46121 - BLOCK
      ?auto_46122 - BLOCK
    )
    :vars
    (
      ?auto_46123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46122 ?auto_46123 ) ( ON-TABLE ?auto_46119 ) ( ON ?auto_46120 ?auto_46119 ) ( not ( = ?auto_46119 ?auto_46120 ) ) ( not ( = ?auto_46119 ?auto_46121 ) ) ( not ( = ?auto_46119 ?auto_46122 ) ) ( not ( = ?auto_46119 ?auto_46123 ) ) ( not ( = ?auto_46120 ?auto_46121 ) ) ( not ( = ?auto_46120 ?auto_46122 ) ) ( not ( = ?auto_46120 ?auto_46123 ) ) ( not ( = ?auto_46121 ?auto_46122 ) ) ( not ( = ?auto_46121 ?auto_46123 ) ) ( not ( = ?auto_46122 ?auto_46123 ) ) ( CLEAR ?auto_46120 ) ( ON ?auto_46121 ?auto_46122 ) ( CLEAR ?auto_46121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46119 ?auto_46120 ?auto_46121 )
      ( MAKE-4PILE ?auto_46119 ?auto_46120 ?auto_46121 ?auto_46122 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46137 - BLOCK
      ?auto_46138 - BLOCK
      ?auto_46139 - BLOCK
      ?auto_46140 - BLOCK
    )
    :vars
    (
      ?auto_46141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46140 ?auto_46141 ) ( ON-TABLE ?auto_46137 ) ( not ( = ?auto_46137 ?auto_46138 ) ) ( not ( = ?auto_46137 ?auto_46139 ) ) ( not ( = ?auto_46137 ?auto_46140 ) ) ( not ( = ?auto_46137 ?auto_46141 ) ) ( not ( = ?auto_46138 ?auto_46139 ) ) ( not ( = ?auto_46138 ?auto_46140 ) ) ( not ( = ?auto_46138 ?auto_46141 ) ) ( not ( = ?auto_46139 ?auto_46140 ) ) ( not ( = ?auto_46139 ?auto_46141 ) ) ( not ( = ?auto_46140 ?auto_46141 ) ) ( ON ?auto_46139 ?auto_46140 ) ( CLEAR ?auto_46137 ) ( ON ?auto_46138 ?auto_46139 ) ( CLEAR ?auto_46138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46137 ?auto_46138 )
      ( MAKE-4PILE ?auto_46137 ?auto_46138 ?auto_46139 ?auto_46140 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46155 - BLOCK
      ?auto_46156 - BLOCK
      ?auto_46157 - BLOCK
      ?auto_46158 - BLOCK
    )
    :vars
    (
      ?auto_46159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46158 ?auto_46159 ) ( not ( = ?auto_46155 ?auto_46156 ) ) ( not ( = ?auto_46155 ?auto_46157 ) ) ( not ( = ?auto_46155 ?auto_46158 ) ) ( not ( = ?auto_46155 ?auto_46159 ) ) ( not ( = ?auto_46156 ?auto_46157 ) ) ( not ( = ?auto_46156 ?auto_46158 ) ) ( not ( = ?auto_46156 ?auto_46159 ) ) ( not ( = ?auto_46157 ?auto_46158 ) ) ( not ( = ?auto_46157 ?auto_46159 ) ) ( not ( = ?auto_46158 ?auto_46159 ) ) ( ON ?auto_46157 ?auto_46158 ) ( ON ?auto_46156 ?auto_46157 ) ( ON ?auto_46155 ?auto_46156 ) ( CLEAR ?auto_46155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46155 )
      ( MAKE-4PILE ?auto_46155 ?auto_46156 ?auto_46157 ?auto_46158 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46174 - BLOCK
      ?auto_46175 - BLOCK
      ?auto_46176 - BLOCK
      ?auto_46177 - BLOCK
      ?auto_46178 - BLOCK
    )
    :vars
    (
      ?auto_46179 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_46177 ) ( ON ?auto_46178 ?auto_46179 ) ( CLEAR ?auto_46178 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46174 ) ( ON ?auto_46175 ?auto_46174 ) ( ON ?auto_46176 ?auto_46175 ) ( ON ?auto_46177 ?auto_46176 ) ( not ( = ?auto_46174 ?auto_46175 ) ) ( not ( = ?auto_46174 ?auto_46176 ) ) ( not ( = ?auto_46174 ?auto_46177 ) ) ( not ( = ?auto_46174 ?auto_46178 ) ) ( not ( = ?auto_46174 ?auto_46179 ) ) ( not ( = ?auto_46175 ?auto_46176 ) ) ( not ( = ?auto_46175 ?auto_46177 ) ) ( not ( = ?auto_46175 ?auto_46178 ) ) ( not ( = ?auto_46175 ?auto_46179 ) ) ( not ( = ?auto_46176 ?auto_46177 ) ) ( not ( = ?auto_46176 ?auto_46178 ) ) ( not ( = ?auto_46176 ?auto_46179 ) ) ( not ( = ?auto_46177 ?auto_46178 ) ) ( not ( = ?auto_46177 ?auto_46179 ) ) ( not ( = ?auto_46178 ?auto_46179 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46178 ?auto_46179 )
      ( !STACK ?auto_46178 ?auto_46177 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46196 - BLOCK
      ?auto_46197 - BLOCK
      ?auto_46198 - BLOCK
      ?auto_46199 - BLOCK
      ?auto_46200 - BLOCK
    )
    :vars
    (
      ?auto_46201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46200 ?auto_46201 ) ( ON-TABLE ?auto_46196 ) ( ON ?auto_46197 ?auto_46196 ) ( ON ?auto_46198 ?auto_46197 ) ( not ( = ?auto_46196 ?auto_46197 ) ) ( not ( = ?auto_46196 ?auto_46198 ) ) ( not ( = ?auto_46196 ?auto_46199 ) ) ( not ( = ?auto_46196 ?auto_46200 ) ) ( not ( = ?auto_46196 ?auto_46201 ) ) ( not ( = ?auto_46197 ?auto_46198 ) ) ( not ( = ?auto_46197 ?auto_46199 ) ) ( not ( = ?auto_46197 ?auto_46200 ) ) ( not ( = ?auto_46197 ?auto_46201 ) ) ( not ( = ?auto_46198 ?auto_46199 ) ) ( not ( = ?auto_46198 ?auto_46200 ) ) ( not ( = ?auto_46198 ?auto_46201 ) ) ( not ( = ?auto_46199 ?auto_46200 ) ) ( not ( = ?auto_46199 ?auto_46201 ) ) ( not ( = ?auto_46200 ?auto_46201 ) ) ( CLEAR ?auto_46198 ) ( ON ?auto_46199 ?auto_46200 ) ( CLEAR ?auto_46199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46196 ?auto_46197 ?auto_46198 ?auto_46199 )
      ( MAKE-5PILE ?auto_46196 ?auto_46197 ?auto_46198 ?auto_46199 ?auto_46200 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46218 - BLOCK
      ?auto_46219 - BLOCK
      ?auto_46220 - BLOCK
      ?auto_46221 - BLOCK
      ?auto_46222 - BLOCK
    )
    :vars
    (
      ?auto_46223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46222 ?auto_46223 ) ( ON-TABLE ?auto_46218 ) ( ON ?auto_46219 ?auto_46218 ) ( not ( = ?auto_46218 ?auto_46219 ) ) ( not ( = ?auto_46218 ?auto_46220 ) ) ( not ( = ?auto_46218 ?auto_46221 ) ) ( not ( = ?auto_46218 ?auto_46222 ) ) ( not ( = ?auto_46218 ?auto_46223 ) ) ( not ( = ?auto_46219 ?auto_46220 ) ) ( not ( = ?auto_46219 ?auto_46221 ) ) ( not ( = ?auto_46219 ?auto_46222 ) ) ( not ( = ?auto_46219 ?auto_46223 ) ) ( not ( = ?auto_46220 ?auto_46221 ) ) ( not ( = ?auto_46220 ?auto_46222 ) ) ( not ( = ?auto_46220 ?auto_46223 ) ) ( not ( = ?auto_46221 ?auto_46222 ) ) ( not ( = ?auto_46221 ?auto_46223 ) ) ( not ( = ?auto_46222 ?auto_46223 ) ) ( ON ?auto_46221 ?auto_46222 ) ( CLEAR ?auto_46219 ) ( ON ?auto_46220 ?auto_46221 ) ( CLEAR ?auto_46220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46218 ?auto_46219 ?auto_46220 )
      ( MAKE-5PILE ?auto_46218 ?auto_46219 ?auto_46220 ?auto_46221 ?auto_46222 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46240 - BLOCK
      ?auto_46241 - BLOCK
      ?auto_46242 - BLOCK
      ?auto_46243 - BLOCK
      ?auto_46244 - BLOCK
    )
    :vars
    (
      ?auto_46245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46244 ?auto_46245 ) ( ON-TABLE ?auto_46240 ) ( not ( = ?auto_46240 ?auto_46241 ) ) ( not ( = ?auto_46240 ?auto_46242 ) ) ( not ( = ?auto_46240 ?auto_46243 ) ) ( not ( = ?auto_46240 ?auto_46244 ) ) ( not ( = ?auto_46240 ?auto_46245 ) ) ( not ( = ?auto_46241 ?auto_46242 ) ) ( not ( = ?auto_46241 ?auto_46243 ) ) ( not ( = ?auto_46241 ?auto_46244 ) ) ( not ( = ?auto_46241 ?auto_46245 ) ) ( not ( = ?auto_46242 ?auto_46243 ) ) ( not ( = ?auto_46242 ?auto_46244 ) ) ( not ( = ?auto_46242 ?auto_46245 ) ) ( not ( = ?auto_46243 ?auto_46244 ) ) ( not ( = ?auto_46243 ?auto_46245 ) ) ( not ( = ?auto_46244 ?auto_46245 ) ) ( ON ?auto_46243 ?auto_46244 ) ( ON ?auto_46242 ?auto_46243 ) ( CLEAR ?auto_46240 ) ( ON ?auto_46241 ?auto_46242 ) ( CLEAR ?auto_46241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46240 ?auto_46241 )
      ( MAKE-5PILE ?auto_46240 ?auto_46241 ?auto_46242 ?auto_46243 ?auto_46244 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46262 - BLOCK
      ?auto_46263 - BLOCK
      ?auto_46264 - BLOCK
      ?auto_46265 - BLOCK
      ?auto_46266 - BLOCK
    )
    :vars
    (
      ?auto_46267 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46266 ?auto_46267 ) ( not ( = ?auto_46262 ?auto_46263 ) ) ( not ( = ?auto_46262 ?auto_46264 ) ) ( not ( = ?auto_46262 ?auto_46265 ) ) ( not ( = ?auto_46262 ?auto_46266 ) ) ( not ( = ?auto_46262 ?auto_46267 ) ) ( not ( = ?auto_46263 ?auto_46264 ) ) ( not ( = ?auto_46263 ?auto_46265 ) ) ( not ( = ?auto_46263 ?auto_46266 ) ) ( not ( = ?auto_46263 ?auto_46267 ) ) ( not ( = ?auto_46264 ?auto_46265 ) ) ( not ( = ?auto_46264 ?auto_46266 ) ) ( not ( = ?auto_46264 ?auto_46267 ) ) ( not ( = ?auto_46265 ?auto_46266 ) ) ( not ( = ?auto_46265 ?auto_46267 ) ) ( not ( = ?auto_46266 ?auto_46267 ) ) ( ON ?auto_46265 ?auto_46266 ) ( ON ?auto_46264 ?auto_46265 ) ( ON ?auto_46263 ?auto_46264 ) ( ON ?auto_46262 ?auto_46263 ) ( CLEAR ?auto_46262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46262 )
      ( MAKE-5PILE ?auto_46262 ?auto_46263 ?auto_46264 ?auto_46265 ?auto_46266 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46285 - BLOCK
      ?auto_46286 - BLOCK
      ?auto_46287 - BLOCK
      ?auto_46288 - BLOCK
      ?auto_46289 - BLOCK
      ?auto_46290 - BLOCK
    )
    :vars
    (
      ?auto_46291 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_46289 ) ( ON ?auto_46290 ?auto_46291 ) ( CLEAR ?auto_46290 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46285 ) ( ON ?auto_46286 ?auto_46285 ) ( ON ?auto_46287 ?auto_46286 ) ( ON ?auto_46288 ?auto_46287 ) ( ON ?auto_46289 ?auto_46288 ) ( not ( = ?auto_46285 ?auto_46286 ) ) ( not ( = ?auto_46285 ?auto_46287 ) ) ( not ( = ?auto_46285 ?auto_46288 ) ) ( not ( = ?auto_46285 ?auto_46289 ) ) ( not ( = ?auto_46285 ?auto_46290 ) ) ( not ( = ?auto_46285 ?auto_46291 ) ) ( not ( = ?auto_46286 ?auto_46287 ) ) ( not ( = ?auto_46286 ?auto_46288 ) ) ( not ( = ?auto_46286 ?auto_46289 ) ) ( not ( = ?auto_46286 ?auto_46290 ) ) ( not ( = ?auto_46286 ?auto_46291 ) ) ( not ( = ?auto_46287 ?auto_46288 ) ) ( not ( = ?auto_46287 ?auto_46289 ) ) ( not ( = ?auto_46287 ?auto_46290 ) ) ( not ( = ?auto_46287 ?auto_46291 ) ) ( not ( = ?auto_46288 ?auto_46289 ) ) ( not ( = ?auto_46288 ?auto_46290 ) ) ( not ( = ?auto_46288 ?auto_46291 ) ) ( not ( = ?auto_46289 ?auto_46290 ) ) ( not ( = ?auto_46289 ?auto_46291 ) ) ( not ( = ?auto_46290 ?auto_46291 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46290 ?auto_46291 )
      ( !STACK ?auto_46290 ?auto_46289 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46311 - BLOCK
      ?auto_46312 - BLOCK
      ?auto_46313 - BLOCK
      ?auto_46314 - BLOCK
      ?auto_46315 - BLOCK
      ?auto_46316 - BLOCK
    )
    :vars
    (
      ?auto_46317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46316 ?auto_46317 ) ( ON-TABLE ?auto_46311 ) ( ON ?auto_46312 ?auto_46311 ) ( ON ?auto_46313 ?auto_46312 ) ( ON ?auto_46314 ?auto_46313 ) ( not ( = ?auto_46311 ?auto_46312 ) ) ( not ( = ?auto_46311 ?auto_46313 ) ) ( not ( = ?auto_46311 ?auto_46314 ) ) ( not ( = ?auto_46311 ?auto_46315 ) ) ( not ( = ?auto_46311 ?auto_46316 ) ) ( not ( = ?auto_46311 ?auto_46317 ) ) ( not ( = ?auto_46312 ?auto_46313 ) ) ( not ( = ?auto_46312 ?auto_46314 ) ) ( not ( = ?auto_46312 ?auto_46315 ) ) ( not ( = ?auto_46312 ?auto_46316 ) ) ( not ( = ?auto_46312 ?auto_46317 ) ) ( not ( = ?auto_46313 ?auto_46314 ) ) ( not ( = ?auto_46313 ?auto_46315 ) ) ( not ( = ?auto_46313 ?auto_46316 ) ) ( not ( = ?auto_46313 ?auto_46317 ) ) ( not ( = ?auto_46314 ?auto_46315 ) ) ( not ( = ?auto_46314 ?auto_46316 ) ) ( not ( = ?auto_46314 ?auto_46317 ) ) ( not ( = ?auto_46315 ?auto_46316 ) ) ( not ( = ?auto_46315 ?auto_46317 ) ) ( not ( = ?auto_46316 ?auto_46317 ) ) ( CLEAR ?auto_46314 ) ( ON ?auto_46315 ?auto_46316 ) ( CLEAR ?auto_46315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46311 ?auto_46312 ?auto_46313 ?auto_46314 ?auto_46315 )
      ( MAKE-6PILE ?auto_46311 ?auto_46312 ?auto_46313 ?auto_46314 ?auto_46315 ?auto_46316 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46337 - BLOCK
      ?auto_46338 - BLOCK
      ?auto_46339 - BLOCK
      ?auto_46340 - BLOCK
      ?auto_46341 - BLOCK
      ?auto_46342 - BLOCK
    )
    :vars
    (
      ?auto_46343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46342 ?auto_46343 ) ( ON-TABLE ?auto_46337 ) ( ON ?auto_46338 ?auto_46337 ) ( ON ?auto_46339 ?auto_46338 ) ( not ( = ?auto_46337 ?auto_46338 ) ) ( not ( = ?auto_46337 ?auto_46339 ) ) ( not ( = ?auto_46337 ?auto_46340 ) ) ( not ( = ?auto_46337 ?auto_46341 ) ) ( not ( = ?auto_46337 ?auto_46342 ) ) ( not ( = ?auto_46337 ?auto_46343 ) ) ( not ( = ?auto_46338 ?auto_46339 ) ) ( not ( = ?auto_46338 ?auto_46340 ) ) ( not ( = ?auto_46338 ?auto_46341 ) ) ( not ( = ?auto_46338 ?auto_46342 ) ) ( not ( = ?auto_46338 ?auto_46343 ) ) ( not ( = ?auto_46339 ?auto_46340 ) ) ( not ( = ?auto_46339 ?auto_46341 ) ) ( not ( = ?auto_46339 ?auto_46342 ) ) ( not ( = ?auto_46339 ?auto_46343 ) ) ( not ( = ?auto_46340 ?auto_46341 ) ) ( not ( = ?auto_46340 ?auto_46342 ) ) ( not ( = ?auto_46340 ?auto_46343 ) ) ( not ( = ?auto_46341 ?auto_46342 ) ) ( not ( = ?auto_46341 ?auto_46343 ) ) ( not ( = ?auto_46342 ?auto_46343 ) ) ( ON ?auto_46341 ?auto_46342 ) ( CLEAR ?auto_46339 ) ( ON ?auto_46340 ?auto_46341 ) ( CLEAR ?auto_46340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46337 ?auto_46338 ?auto_46339 ?auto_46340 )
      ( MAKE-6PILE ?auto_46337 ?auto_46338 ?auto_46339 ?auto_46340 ?auto_46341 ?auto_46342 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46363 - BLOCK
      ?auto_46364 - BLOCK
      ?auto_46365 - BLOCK
      ?auto_46366 - BLOCK
      ?auto_46367 - BLOCK
      ?auto_46368 - BLOCK
    )
    :vars
    (
      ?auto_46369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46368 ?auto_46369 ) ( ON-TABLE ?auto_46363 ) ( ON ?auto_46364 ?auto_46363 ) ( not ( = ?auto_46363 ?auto_46364 ) ) ( not ( = ?auto_46363 ?auto_46365 ) ) ( not ( = ?auto_46363 ?auto_46366 ) ) ( not ( = ?auto_46363 ?auto_46367 ) ) ( not ( = ?auto_46363 ?auto_46368 ) ) ( not ( = ?auto_46363 ?auto_46369 ) ) ( not ( = ?auto_46364 ?auto_46365 ) ) ( not ( = ?auto_46364 ?auto_46366 ) ) ( not ( = ?auto_46364 ?auto_46367 ) ) ( not ( = ?auto_46364 ?auto_46368 ) ) ( not ( = ?auto_46364 ?auto_46369 ) ) ( not ( = ?auto_46365 ?auto_46366 ) ) ( not ( = ?auto_46365 ?auto_46367 ) ) ( not ( = ?auto_46365 ?auto_46368 ) ) ( not ( = ?auto_46365 ?auto_46369 ) ) ( not ( = ?auto_46366 ?auto_46367 ) ) ( not ( = ?auto_46366 ?auto_46368 ) ) ( not ( = ?auto_46366 ?auto_46369 ) ) ( not ( = ?auto_46367 ?auto_46368 ) ) ( not ( = ?auto_46367 ?auto_46369 ) ) ( not ( = ?auto_46368 ?auto_46369 ) ) ( ON ?auto_46367 ?auto_46368 ) ( ON ?auto_46366 ?auto_46367 ) ( CLEAR ?auto_46364 ) ( ON ?auto_46365 ?auto_46366 ) ( CLEAR ?auto_46365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46363 ?auto_46364 ?auto_46365 )
      ( MAKE-6PILE ?auto_46363 ?auto_46364 ?auto_46365 ?auto_46366 ?auto_46367 ?auto_46368 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46389 - BLOCK
      ?auto_46390 - BLOCK
      ?auto_46391 - BLOCK
      ?auto_46392 - BLOCK
      ?auto_46393 - BLOCK
      ?auto_46394 - BLOCK
    )
    :vars
    (
      ?auto_46395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46394 ?auto_46395 ) ( ON-TABLE ?auto_46389 ) ( not ( = ?auto_46389 ?auto_46390 ) ) ( not ( = ?auto_46389 ?auto_46391 ) ) ( not ( = ?auto_46389 ?auto_46392 ) ) ( not ( = ?auto_46389 ?auto_46393 ) ) ( not ( = ?auto_46389 ?auto_46394 ) ) ( not ( = ?auto_46389 ?auto_46395 ) ) ( not ( = ?auto_46390 ?auto_46391 ) ) ( not ( = ?auto_46390 ?auto_46392 ) ) ( not ( = ?auto_46390 ?auto_46393 ) ) ( not ( = ?auto_46390 ?auto_46394 ) ) ( not ( = ?auto_46390 ?auto_46395 ) ) ( not ( = ?auto_46391 ?auto_46392 ) ) ( not ( = ?auto_46391 ?auto_46393 ) ) ( not ( = ?auto_46391 ?auto_46394 ) ) ( not ( = ?auto_46391 ?auto_46395 ) ) ( not ( = ?auto_46392 ?auto_46393 ) ) ( not ( = ?auto_46392 ?auto_46394 ) ) ( not ( = ?auto_46392 ?auto_46395 ) ) ( not ( = ?auto_46393 ?auto_46394 ) ) ( not ( = ?auto_46393 ?auto_46395 ) ) ( not ( = ?auto_46394 ?auto_46395 ) ) ( ON ?auto_46393 ?auto_46394 ) ( ON ?auto_46392 ?auto_46393 ) ( ON ?auto_46391 ?auto_46392 ) ( CLEAR ?auto_46389 ) ( ON ?auto_46390 ?auto_46391 ) ( CLEAR ?auto_46390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46389 ?auto_46390 )
      ( MAKE-6PILE ?auto_46389 ?auto_46390 ?auto_46391 ?auto_46392 ?auto_46393 ?auto_46394 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46415 - BLOCK
      ?auto_46416 - BLOCK
      ?auto_46417 - BLOCK
      ?auto_46418 - BLOCK
      ?auto_46419 - BLOCK
      ?auto_46420 - BLOCK
    )
    :vars
    (
      ?auto_46421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46420 ?auto_46421 ) ( not ( = ?auto_46415 ?auto_46416 ) ) ( not ( = ?auto_46415 ?auto_46417 ) ) ( not ( = ?auto_46415 ?auto_46418 ) ) ( not ( = ?auto_46415 ?auto_46419 ) ) ( not ( = ?auto_46415 ?auto_46420 ) ) ( not ( = ?auto_46415 ?auto_46421 ) ) ( not ( = ?auto_46416 ?auto_46417 ) ) ( not ( = ?auto_46416 ?auto_46418 ) ) ( not ( = ?auto_46416 ?auto_46419 ) ) ( not ( = ?auto_46416 ?auto_46420 ) ) ( not ( = ?auto_46416 ?auto_46421 ) ) ( not ( = ?auto_46417 ?auto_46418 ) ) ( not ( = ?auto_46417 ?auto_46419 ) ) ( not ( = ?auto_46417 ?auto_46420 ) ) ( not ( = ?auto_46417 ?auto_46421 ) ) ( not ( = ?auto_46418 ?auto_46419 ) ) ( not ( = ?auto_46418 ?auto_46420 ) ) ( not ( = ?auto_46418 ?auto_46421 ) ) ( not ( = ?auto_46419 ?auto_46420 ) ) ( not ( = ?auto_46419 ?auto_46421 ) ) ( not ( = ?auto_46420 ?auto_46421 ) ) ( ON ?auto_46419 ?auto_46420 ) ( ON ?auto_46418 ?auto_46419 ) ( ON ?auto_46417 ?auto_46418 ) ( ON ?auto_46416 ?auto_46417 ) ( ON ?auto_46415 ?auto_46416 ) ( CLEAR ?auto_46415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46415 )
      ( MAKE-6PILE ?auto_46415 ?auto_46416 ?auto_46417 ?auto_46418 ?auto_46419 ?auto_46420 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_46442 - BLOCK
      ?auto_46443 - BLOCK
      ?auto_46444 - BLOCK
      ?auto_46445 - BLOCK
      ?auto_46446 - BLOCK
      ?auto_46447 - BLOCK
      ?auto_46448 - BLOCK
    )
    :vars
    (
      ?auto_46449 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_46447 ) ( ON ?auto_46448 ?auto_46449 ) ( CLEAR ?auto_46448 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46442 ) ( ON ?auto_46443 ?auto_46442 ) ( ON ?auto_46444 ?auto_46443 ) ( ON ?auto_46445 ?auto_46444 ) ( ON ?auto_46446 ?auto_46445 ) ( ON ?auto_46447 ?auto_46446 ) ( not ( = ?auto_46442 ?auto_46443 ) ) ( not ( = ?auto_46442 ?auto_46444 ) ) ( not ( = ?auto_46442 ?auto_46445 ) ) ( not ( = ?auto_46442 ?auto_46446 ) ) ( not ( = ?auto_46442 ?auto_46447 ) ) ( not ( = ?auto_46442 ?auto_46448 ) ) ( not ( = ?auto_46442 ?auto_46449 ) ) ( not ( = ?auto_46443 ?auto_46444 ) ) ( not ( = ?auto_46443 ?auto_46445 ) ) ( not ( = ?auto_46443 ?auto_46446 ) ) ( not ( = ?auto_46443 ?auto_46447 ) ) ( not ( = ?auto_46443 ?auto_46448 ) ) ( not ( = ?auto_46443 ?auto_46449 ) ) ( not ( = ?auto_46444 ?auto_46445 ) ) ( not ( = ?auto_46444 ?auto_46446 ) ) ( not ( = ?auto_46444 ?auto_46447 ) ) ( not ( = ?auto_46444 ?auto_46448 ) ) ( not ( = ?auto_46444 ?auto_46449 ) ) ( not ( = ?auto_46445 ?auto_46446 ) ) ( not ( = ?auto_46445 ?auto_46447 ) ) ( not ( = ?auto_46445 ?auto_46448 ) ) ( not ( = ?auto_46445 ?auto_46449 ) ) ( not ( = ?auto_46446 ?auto_46447 ) ) ( not ( = ?auto_46446 ?auto_46448 ) ) ( not ( = ?auto_46446 ?auto_46449 ) ) ( not ( = ?auto_46447 ?auto_46448 ) ) ( not ( = ?auto_46447 ?auto_46449 ) ) ( not ( = ?auto_46448 ?auto_46449 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46448 ?auto_46449 )
      ( !STACK ?auto_46448 ?auto_46447 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_46472 - BLOCK
      ?auto_46473 - BLOCK
      ?auto_46474 - BLOCK
      ?auto_46475 - BLOCK
      ?auto_46476 - BLOCK
      ?auto_46477 - BLOCK
      ?auto_46478 - BLOCK
    )
    :vars
    (
      ?auto_46479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46478 ?auto_46479 ) ( ON-TABLE ?auto_46472 ) ( ON ?auto_46473 ?auto_46472 ) ( ON ?auto_46474 ?auto_46473 ) ( ON ?auto_46475 ?auto_46474 ) ( ON ?auto_46476 ?auto_46475 ) ( not ( = ?auto_46472 ?auto_46473 ) ) ( not ( = ?auto_46472 ?auto_46474 ) ) ( not ( = ?auto_46472 ?auto_46475 ) ) ( not ( = ?auto_46472 ?auto_46476 ) ) ( not ( = ?auto_46472 ?auto_46477 ) ) ( not ( = ?auto_46472 ?auto_46478 ) ) ( not ( = ?auto_46472 ?auto_46479 ) ) ( not ( = ?auto_46473 ?auto_46474 ) ) ( not ( = ?auto_46473 ?auto_46475 ) ) ( not ( = ?auto_46473 ?auto_46476 ) ) ( not ( = ?auto_46473 ?auto_46477 ) ) ( not ( = ?auto_46473 ?auto_46478 ) ) ( not ( = ?auto_46473 ?auto_46479 ) ) ( not ( = ?auto_46474 ?auto_46475 ) ) ( not ( = ?auto_46474 ?auto_46476 ) ) ( not ( = ?auto_46474 ?auto_46477 ) ) ( not ( = ?auto_46474 ?auto_46478 ) ) ( not ( = ?auto_46474 ?auto_46479 ) ) ( not ( = ?auto_46475 ?auto_46476 ) ) ( not ( = ?auto_46475 ?auto_46477 ) ) ( not ( = ?auto_46475 ?auto_46478 ) ) ( not ( = ?auto_46475 ?auto_46479 ) ) ( not ( = ?auto_46476 ?auto_46477 ) ) ( not ( = ?auto_46476 ?auto_46478 ) ) ( not ( = ?auto_46476 ?auto_46479 ) ) ( not ( = ?auto_46477 ?auto_46478 ) ) ( not ( = ?auto_46477 ?auto_46479 ) ) ( not ( = ?auto_46478 ?auto_46479 ) ) ( CLEAR ?auto_46476 ) ( ON ?auto_46477 ?auto_46478 ) ( CLEAR ?auto_46477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_46472 ?auto_46473 ?auto_46474 ?auto_46475 ?auto_46476 ?auto_46477 )
      ( MAKE-7PILE ?auto_46472 ?auto_46473 ?auto_46474 ?auto_46475 ?auto_46476 ?auto_46477 ?auto_46478 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_46502 - BLOCK
      ?auto_46503 - BLOCK
      ?auto_46504 - BLOCK
      ?auto_46505 - BLOCK
      ?auto_46506 - BLOCK
      ?auto_46507 - BLOCK
      ?auto_46508 - BLOCK
    )
    :vars
    (
      ?auto_46509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46508 ?auto_46509 ) ( ON-TABLE ?auto_46502 ) ( ON ?auto_46503 ?auto_46502 ) ( ON ?auto_46504 ?auto_46503 ) ( ON ?auto_46505 ?auto_46504 ) ( not ( = ?auto_46502 ?auto_46503 ) ) ( not ( = ?auto_46502 ?auto_46504 ) ) ( not ( = ?auto_46502 ?auto_46505 ) ) ( not ( = ?auto_46502 ?auto_46506 ) ) ( not ( = ?auto_46502 ?auto_46507 ) ) ( not ( = ?auto_46502 ?auto_46508 ) ) ( not ( = ?auto_46502 ?auto_46509 ) ) ( not ( = ?auto_46503 ?auto_46504 ) ) ( not ( = ?auto_46503 ?auto_46505 ) ) ( not ( = ?auto_46503 ?auto_46506 ) ) ( not ( = ?auto_46503 ?auto_46507 ) ) ( not ( = ?auto_46503 ?auto_46508 ) ) ( not ( = ?auto_46503 ?auto_46509 ) ) ( not ( = ?auto_46504 ?auto_46505 ) ) ( not ( = ?auto_46504 ?auto_46506 ) ) ( not ( = ?auto_46504 ?auto_46507 ) ) ( not ( = ?auto_46504 ?auto_46508 ) ) ( not ( = ?auto_46504 ?auto_46509 ) ) ( not ( = ?auto_46505 ?auto_46506 ) ) ( not ( = ?auto_46505 ?auto_46507 ) ) ( not ( = ?auto_46505 ?auto_46508 ) ) ( not ( = ?auto_46505 ?auto_46509 ) ) ( not ( = ?auto_46506 ?auto_46507 ) ) ( not ( = ?auto_46506 ?auto_46508 ) ) ( not ( = ?auto_46506 ?auto_46509 ) ) ( not ( = ?auto_46507 ?auto_46508 ) ) ( not ( = ?auto_46507 ?auto_46509 ) ) ( not ( = ?auto_46508 ?auto_46509 ) ) ( ON ?auto_46507 ?auto_46508 ) ( CLEAR ?auto_46505 ) ( ON ?auto_46506 ?auto_46507 ) ( CLEAR ?auto_46506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46502 ?auto_46503 ?auto_46504 ?auto_46505 ?auto_46506 )
      ( MAKE-7PILE ?auto_46502 ?auto_46503 ?auto_46504 ?auto_46505 ?auto_46506 ?auto_46507 ?auto_46508 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_46532 - BLOCK
      ?auto_46533 - BLOCK
      ?auto_46534 - BLOCK
      ?auto_46535 - BLOCK
      ?auto_46536 - BLOCK
      ?auto_46537 - BLOCK
      ?auto_46538 - BLOCK
    )
    :vars
    (
      ?auto_46539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46538 ?auto_46539 ) ( ON-TABLE ?auto_46532 ) ( ON ?auto_46533 ?auto_46532 ) ( ON ?auto_46534 ?auto_46533 ) ( not ( = ?auto_46532 ?auto_46533 ) ) ( not ( = ?auto_46532 ?auto_46534 ) ) ( not ( = ?auto_46532 ?auto_46535 ) ) ( not ( = ?auto_46532 ?auto_46536 ) ) ( not ( = ?auto_46532 ?auto_46537 ) ) ( not ( = ?auto_46532 ?auto_46538 ) ) ( not ( = ?auto_46532 ?auto_46539 ) ) ( not ( = ?auto_46533 ?auto_46534 ) ) ( not ( = ?auto_46533 ?auto_46535 ) ) ( not ( = ?auto_46533 ?auto_46536 ) ) ( not ( = ?auto_46533 ?auto_46537 ) ) ( not ( = ?auto_46533 ?auto_46538 ) ) ( not ( = ?auto_46533 ?auto_46539 ) ) ( not ( = ?auto_46534 ?auto_46535 ) ) ( not ( = ?auto_46534 ?auto_46536 ) ) ( not ( = ?auto_46534 ?auto_46537 ) ) ( not ( = ?auto_46534 ?auto_46538 ) ) ( not ( = ?auto_46534 ?auto_46539 ) ) ( not ( = ?auto_46535 ?auto_46536 ) ) ( not ( = ?auto_46535 ?auto_46537 ) ) ( not ( = ?auto_46535 ?auto_46538 ) ) ( not ( = ?auto_46535 ?auto_46539 ) ) ( not ( = ?auto_46536 ?auto_46537 ) ) ( not ( = ?auto_46536 ?auto_46538 ) ) ( not ( = ?auto_46536 ?auto_46539 ) ) ( not ( = ?auto_46537 ?auto_46538 ) ) ( not ( = ?auto_46537 ?auto_46539 ) ) ( not ( = ?auto_46538 ?auto_46539 ) ) ( ON ?auto_46537 ?auto_46538 ) ( ON ?auto_46536 ?auto_46537 ) ( CLEAR ?auto_46534 ) ( ON ?auto_46535 ?auto_46536 ) ( CLEAR ?auto_46535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46532 ?auto_46533 ?auto_46534 ?auto_46535 )
      ( MAKE-7PILE ?auto_46532 ?auto_46533 ?auto_46534 ?auto_46535 ?auto_46536 ?auto_46537 ?auto_46538 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_46562 - BLOCK
      ?auto_46563 - BLOCK
      ?auto_46564 - BLOCK
      ?auto_46565 - BLOCK
      ?auto_46566 - BLOCK
      ?auto_46567 - BLOCK
      ?auto_46568 - BLOCK
    )
    :vars
    (
      ?auto_46569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46568 ?auto_46569 ) ( ON-TABLE ?auto_46562 ) ( ON ?auto_46563 ?auto_46562 ) ( not ( = ?auto_46562 ?auto_46563 ) ) ( not ( = ?auto_46562 ?auto_46564 ) ) ( not ( = ?auto_46562 ?auto_46565 ) ) ( not ( = ?auto_46562 ?auto_46566 ) ) ( not ( = ?auto_46562 ?auto_46567 ) ) ( not ( = ?auto_46562 ?auto_46568 ) ) ( not ( = ?auto_46562 ?auto_46569 ) ) ( not ( = ?auto_46563 ?auto_46564 ) ) ( not ( = ?auto_46563 ?auto_46565 ) ) ( not ( = ?auto_46563 ?auto_46566 ) ) ( not ( = ?auto_46563 ?auto_46567 ) ) ( not ( = ?auto_46563 ?auto_46568 ) ) ( not ( = ?auto_46563 ?auto_46569 ) ) ( not ( = ?auto_46564 ?auto_46565 ) ) ( not ( = ?auto_46564 ?auto_46566 ) ) ( not ( = ?auto_46564 ?auto_46567 ) ) ( not ( = ?auto_46564 ?auto_46568 ) ) ( not ( = ?auto_46564 ?auto_46569 ) ) ( not ( = ?auto_46565 ?auto_46566 ) ) ( not ( = ?auto_46565 ?auto_46567 ) ) ( not ( = ?auto_46565 ?auto_46568 ) ) ( not ( = ?auto_46565 ?auto_46569 ) ) ( not ( = ?auto_46566 ?auto_46567 ) ) ( not ( = ?auto_46566 ?auto_46568 ) ) ( not ( = ?auto_46566 ?auto_46569 ) ) ( not ( = ?auto_46567 ?auto_46568 ) ) ( not ( = ?auto_46567 ?auto_46569 ) ) ( not ( = ?auto_46568 ?auto_46569 ) ) ( ON ?auto_46567 ?auto_46568 ) ( ON ?auto_46566 ?auto_46567 ) ( ON ?auto_46565 ?auto_46566 ) ( CLEAR ?auto_46563 ) ( ON ?auto_46564 ?auto_46565 ) ( CLEAR ?auto_46564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46562 ?auto_46563 ?auto_46564 )
      ( MAKE-7PILE ?auto_46562 ?auto_46563 ?auto_46564 ?auto_46565 ?auto_46566 ?auto_46567 ?auto_46568 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_46592 - BLOCK
      ?auto_46593 - BLOCK
      ?auto_46594 - BLOCK
      ?auto_46595 - BLOCK
      ?auto_46596 - BLOCK
      ?auto_46597 - BLOCK
      ?auto_46598 - BLOCK
    )
    :vars
    (
      ?auto_46599 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46598 ?auto_46599 ) ( ON-TABLE ?auto_46592 ) ( not ( = ?auto_46592 ?auto_46593 ) ) ( not ( = ?auto_46592 ?auto_46594 ) ) ( not ( = ?auto_46592 ?auto_46595 ) ) ( not ( = ?auto_46592 ?auto_46596 ) ) ( not ( = ?auto_46592 ?auto_46597 ) ) ( not ( = ?auto_46592 ?auto_46598 ) ) ( not ( = ?auto_46592 ?auto_46599 ) ) ( not ( = ?auto_46593 ?auto_46594 ) ) ( not ( = ?auto_46593 ?auto_46595 ) ) ( not ( = ?auto_46593 ?auto_46596 ) ) ( not ( = ?auto_46593 ?auto_46597 ) ) ( not ( = ?auto_46593 ?auto_46598 ) ) ( not ( = ?auto_46593 ?auto_46599 ) ) ( not ( = ?auto_46594 ?auto_46595 ) ) ( not ( = ?auto_46594 ?auto_46596 ) ) ( not ( = ?auto_46594 ?auto_46597 ) ) ( not ( = ?auto_46594 ?auto_46598 ) ) ( not ( = ?auto_46594 ?auto_46599 ) ) ( not ( = ?auto_46595 ?auto_46596 ) ) ( not ( = ?auto_46595 ?auto_46597 ) ) ( not ( = ?auto_46595 ?auto_46598 ) ) ( not ( = ?auto_46595 ?auto_46599 ) ) ( not ( = ?auto_46596 ?auto_46597 ) ) ( not ( = ?auto_46596 ?auto_46598 ) ) ( not ( = ?auto_46596 ?auto_46599 ) ) ( not ( = ?auto_46597 ?auto_46598 ) ) ( not ( = ?auto_46597 ?auto_46599 ) ) ( not ( = ?auto_46598 ?auto_46599 ) ) ( ON ?auto_46597 ?auto_46598 ) ( ON ?auto_46596 ?auto_46597 ) ( ON ?auto_46595 ?auto_46596 ) ( ON ?auto_46594 ?auto_46595 ) ( CLEAR ?auto_46592 ) ( ON ?auto_46593 ?auto_46594 ) ( CLEAR ?auto_46593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46592 ?auto_46593 )
      ( MAKE-7PILE ?auto_46592 ?auto_46593 ?auto_46594 ?auto_46595 ?auto_46596 ?auto_46597 ?auto_46598 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_46622 - BLOCK
      ?auto_46623 - BLOCK
      ?auto_46624 - BLOCK
      ?auto_46625 - BLOCK
      ?auto_46626 - BLOCK
      ?auto_46627 - BLOCK
      ?auto_46628 - BLOCK
    )
    :vars
    (
      ?auto_46629 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46628 ?auto_46629 ) ( not ( = ?auto_46622 ?auto_46623 ) ) ( not ( = ?auto_46622 ?auto_46624 ) ) ( not ( = ?auto_46622 ?auto_46625 ) ) ( not ( = ?auto_46622 ?auto_46626 ) ) ( not ( = ?auto_46622 ?auto_46627 ) ) ( not ( = ?auto_46622 ?auto_46628 ) ) ( not ( = ?auto_46622 ?auto_46629 ) ) ( not ( = ?auto_46623 ?auto_46624 ) ) ( not ( = ?auto_46623 ?auto_46625 ) ) ( not ( = ?auto_46623 ?auto_46626 ) ) ( not ( = ?auto_46623 ?auto_46627 ) ) ( not ( = ?auto_46623 ?auto_46628 ) ) ( not ( = ?auto_46623 ?auto_46629 ) ) ( not ( = ?auto_46624 ?auto_46625 ) ) ( not ( = ?auto_46624 ?auto_46626 ) ) ( not ( = ?auto_46624 ?auto_46627 ) ) ( not ( = ?auto_46624 ?auto_46628 ) ) ( not ( = ?auto_46624 ?auto_46629 ) ) ( not ( = ?auto_46625 ?auto_46626 ) ) ( not ( = ?auto_46625 ?auto_46627 ) ) ( not ( = ?auto_46625 ?auto_46628 ) ) ( not ( = ?auto_46625 ?auto_46629 ) ) ( not ( = ?auto_46626 ?auto_46627 ) ) ( not ( = ?auto_46626 ?auto_46628 ) ) ( not ( = ?auto_46626 ?auto_46629 ) ) ( not ( = ?auto_46627 ?auto_46628 ) ) ( not ( = ?auto_46627 ?auto_46629 ) ) ( not ( = ?auto_46628 ?auto_46629 ) ) ( ON ?auto_46627 ?auto_46628 ) ( ON ?auto_46626 ?auto_46627 ) ( ON ?auto_46625 ?auto_46626 ) ( ON ?auto_46624 ?auto_46625 ) ( ON ?auto_46623 ?auto_46624 ) ( ON ?auto_46622 ?auto_46623 ) ( CLEAR ?auto_46622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46622 )
      ( MAKE-7PILE ?auto_46622 ?auto_46623 ?auto_46624 ?auto_46625 ?auto_46626 ?auto_46627 ?auto_46628 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_46653 - BLOCK
      ?auto_46654 - BLOCK
      ?auto_46655 - BLOCK
      ?auto_46656 - BLOCK
      ?auto_46657 - BLOCK
      ?auto_46658 - BLOCK
      ?auto_46659 - BLOCK
      ?auto_46660 - BLOCK
    )
    :vars
    (
      ?auto_46661 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_46659 ) ( ON ?auto_46660 ?auto_46661 ) ( CLEAR ?auto_46660 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46653 ) ( ON ?auto_46654 ?auto_46653 ) ( ON ?auto_46655 ?auto_46654 ) ( ON ?auto_46656 ?auto_46655 ) ( ON ?auto_46657 ?auto_46656 ) ( ON ?auto_46658 ?auto_46657 ) ( ON ?auto_46659 ?auto_46658 ) ( not ( = ?auto_46653 ?auto_46654 ) ) ( not ( = ?auto_46653 ?auto_46655 ) ) ( not ( = ?auto_46653 ?auto_46656 ) ) ( not ( = ?auto_46653 ?auto_46657 ) ) ( not ( = ?auto_46653 ?auto_46658 ) ) ( not ( = ?auto_46653 ?auto_46659 ) ) ( not ( = ?auto_46653 ?auto_46660 ) ) ( not ( = ?auto_46653 ?auto_46661 ) ) ( not ( = ?auto_46654 ?auto_46655 ) ) ( not ( = ?auto_46654 ?auto_46656 ) ) ( not ( = ?auto_46654 ?auto_46657 ) ) ( not ( = ?auto_46654 ?auto_46658 ) ) ( not ( = ?auto_46654 ?auto_46659 ) ) ( not ( = ?auto_46654 ?auto_46660 ) ) ( not ( = ?auto_46654 ?auto_46661 ) ) ( not ( = ?auto_46655 ?auto_46656 ) ) ( not ( = ?auto_46655 ?auto_46657 ) ) ( not ( = ?auto_46655 ?auto_46658 ) ) ( not ( = ?auto_46655 ?auto_46659 ) ) ( not ( = ?auto_46655 ?auto_46660 ) ) ( not ( = ?auto_46655 ?auto_46661 ) ) ( not ( = ?auto_46656 ?auto_46657 ) ) ( not ( = ?auto_46656 ?auto_46658 ) ) ( not ( = ?auto_46656 ?auto_46659 ) ) ( not ( = ?auto_46656 ?auto_46660 ) ) ( not ( = ?auto_46656 ?auto_46661 ) ) ( not ( = ?auto_46657 ?auto_46658 ) ) ( not ( = ?auto_46657 ?auto_46659 ) ) ( not ( = ?auto_46657 ?auto_46660 ) ) ( not ( = ?auto_46657 ?auto_46661 ) ) ( not ( = ?auto_46658 ?auto_46659 ) ) ( not ( = ?auto_46658 ?auto_46660 ) ) ( not ( = ?auto_46658 ?auto_46661 ) ) ( not ( = ?auto_46659 ?auto_46660 ) ) ( not ( = ?auto_46659 ?auto_46661 ) ) ( not ( = ?auto_46660 ?auto_46661 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46660 ?auto_46661 )
      ( !STACK ?auto_46660 ?auto_46659 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_46670 - BLOCK
      ?auto_46671 - BLOCK
      ?auto_46672 - BLOCK
      ?auto_46673 - BLOCK
      ?auto_46674 - BLOCK
      ?auto_46675 - BLOCK
      ?auto_46676 - BLOCK
      ?auto_46677 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_46676 ) ( ON-TABLE ?auto_46677 ) ( CLEAR ?auto_46677 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46670 ) ( ON ?auto_46671 ?auto_46670 ) ( ON ?auto_46672 ?auto_46671 ) ( ON ?auto_46673 ?auto_46672 ) ( ON ?auto_46674 ?auto_46673 ) ( ON ?auto_46675 ?auto_46674 ) ( ON ?auto_46676 ?auto_46675 ) ( not ( = ?auto_46670 ?auto_46671 ) ) ( not ( = ?auto_46670 ?auto_46672 ) ) ( not ( = ?auto_46670 ?auto_46673 ) ) ( not ( = ?auto_46670 ?auto_46674 ) ) ( not ( = ?auto_46670 ?auto_46675 ) ) ( not ( = ?auto_46670 ?auto_46676 ) ) ( not ( = ?auto_46670 ?auto_46677 ) ) ( not ( = ?auto_46671 ?auto_46672 ) ) ( not ( = ?auto_46671 ?auto_46673 ) ) ( not ( = ?auto_46671 ?auto_46674 ) ) ( not ( = ?auto_46671 ?auto_46675 ) ) ( not ( = ?auto_46671 ?auto_46676 ) ) ( not ( = ?auto_46671 ?auto_46677 ) ) ( not ( = ?auto_46672 ?auto_46673 ) ) ( not ( = ?auto_46672 ?auto_46674 ) ) ( not ( = ?auto_46672 ?auto_46675 ) ) ( not ( = ?auto_46672 ?auto_46676 ) ) ( not ( = ?auto_46672 ?auto_46677 ) ) ( not ( = ?auto_46673 ?auto_46674 ) ) ( not ( = ?auto_46673 ?auto_46675 ) ) ( not ( = ?auto_46673 ?auto_46676 ) ) ( not ( = ?auto_46673 ?auto_46677 ) ) ( not ( = ?auto_46674 ?auto_46675 ) ) ( not ( = ?auto_46674 ?auto_46676 ) ) ( not ( = ?auto_46674 ?auto_46677 ) ) ( not ( = ?auto_46675 ?auto_46676 ) ) ( not ( = ?auto_46675 ?auto_46677 ) ) ( not ( = ?auto_46676 ?auto_46677 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_46677 )
      ( !STACK ?auto_46677 ?auto_46676 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_46686 - BLOCK
      ?auto_46687 - BLOCK
      ?auto_46688 - BLOCK
      ?auto_46689 - BLOCK
      ?auto_46690 - BLOCK
      ?auto_46691 - BLOCK
      ?auto_46692 - BLOCK
      ?auto_46693 - BLOCK
    )
    :vars
    (
      ?auto_46694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46693 ?auto_46694 ) ( ON-TABLE ?auto_46686 ) ( ON ?auto_46687 ?auto_46686 ) ( ON ?auto_46688 ?auto_46687 ) ( ON ?auto_46689 ?auto_46688 ) ( ON ?auto_46690 ?auto_46689 ) ( ON ?auto_46691 ?auto_46690 ) ( not ( = ?auto_46686 ?auto_46687 ) ) ( not ( = ?auto_46686 ?auto_46688 ) ) ( not ( = ?auto_46686 ?auto_46689 ) ) ( not ( = ?auto_46686 ?auto_46690 ) ) ( not ( = ?auto_46686 ?auto_46691 ) ) ( not ( = ?auto_46686 ?auto_46692 ) ) ( not ( = ?auto_46686 ?auto_46693 ) ) ( not ( = ?auto_46686 ?auto_46694 ) ) ( not ( = ?auto_46687 ?auto_46688 ) ) ( not ( = ?auto_46687 ?auto_46689 ) ) ( not ( = ?auto_46687 ?auto_46690 ) ) ( not ( = ?auto_46687 ?auto_46691 ) ) ( not ( = ?auto_46687 ?auto_46692 ) ) ( not ( = ?auto_46687 ?auto_46693 ) ) ( not ( = ?auto_46687 ?auto_46694 ) ) ( not ( = ?auto_46688 ?auto_46689 ) ) ( not ( = ?auto_46688 ?auto_46690 ) ) ( not ( = ?auto_46688 ?auto_46691 ) ) ( not ( = ?auto_46688 ?auto_46692 ) ) ( not ( = ?auto_46688 ?auto_46693 ) ) ( not ( = ?auto_46688 ?auto_46694 ) ) ( not ( = ?auto_46689 ?auto_46690 ) ) ( not ( = ?auto_46689 ?auto_46691 ) ) ( not ( = ?auto_46689 ?auto_46692 ) ) ( not ( = ?auto_46689 ?auto_46693 ) ) ( not ( = ?auto_46689 ?auto_46694 ) ) ( not ( = ?auto_46690 ?auto_46691 ) ) ( not ( = ?auto_46690 ?auto_46692 ) ) ( not ( = ?auto_46690 ?auto_46693 ) ) ( not ( = ?auto_46690 ?auto_46694 ) ) ( not ( = ?auto_46691 ?auto_46692 ) ) ( not ( = ?auto_46691 ?auto_46693 ) ) ( not ( = ?auto_46691 ?auto_46694 ) ) ( not ( = ?auto_46692 ?auto_46693 ) ) ( not ( = ?auto_46692 ?auto_46694 ) ) ( not ( = ?auto_46693 ?auto_46694 ) ) ( CLEAR ?auto_46691 ) ( ON ?auto_46692 ?auto_46693 ) ( CLEAR ?auto_46692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_46686 ?auto_46687 ?auto_46688 ?auto_46689 ?auto_46690 ?auto_46691 ?auto_46692 )
      ( MAKE-8PILE ?auto_46686 ?auto_46687 ?auto_46688 ?auto_46689 ?auto_46690 ?auto_46691 ?auto_46692 ?auto_46693 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_46703 - BLOCK
      ?auto_46704 - BLOCK
      ?auto_46705 - BLOCK
      ?auto_46706 - BLOCK
      ?auto_46707 - BLOCK
      ?auto_46708 - BLOCK
      ?auto_46709 - BLOCK
      ?auto_46710 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46710 ) ( ON-TABLE ?auto_46703 ) ( ON ?auto_46704 ?auto_46703 ) ( ON ?auto_46705 ?auto_46704 ) ( ON ?auto_46706 ?auto_46705 ) ( ON ?auto_46707 ?auto_46706 ) ( ON ?auto_46708 ?auto_46707 ) ( not ( = ?auto_46703 ?auto_46704 ) ) ( not ( = ?auto_46703 ?auto_46705 ) ) ( not ( = ?auto_46703 ?auto_46706 ) ) ( not ( = ?auto_46703 ?auto_46707 ) ) ( not ( = ?auto_46703 ?auto_46708 ) ) ( not ( = ?auto_46703 ?auto_46709 ) ) ( not ( = ?auto_46703 ?auto_46710 ) ) ( not ( = ?auto_46704 ?auto_46705 ) ) ( not ( = ?auto_46704 ?auto_46706 ) ) ( not ( = ?auto_46704 ?auto_46707 ) ) ( not ( = ?auto_46704 ?auto_46708 ) ) ( not ( = ?auto_46704 ?auto_46709 ) ) ( not ( = ?auto_46704 ?auto_46710 ) ) ( not ( = ?auto_46705 ?auto_46706 ) ) ( not ( = ?auto_46705 ?auto_46707 ) ) ( not ( = ?auto_46705 ?auto_46708 ) ) ( not ( = ?auto_46705 ?auto_46709 ) ) ( not ( = ?auto_46705 ?auto_46710 ) ) ( not ( = ?auto_46706 ?auto_46707 ) ) ( not ( = ?auto_46706 ?auto_46708 ) ) ( not ( = ?auto_46706 ?auto_46709 ) ) ( not ( = ?auto_46706 ?auto_46710 ) ) ( not ( = ?auto_46707 ?auto_46708 ) ) ( not ( = ?auto_46707 ?auto_46709 ) ) ( not ( = ?auto_46707 ?auto_46710 ) ) ( not ( = ?auto_46708 ?auto_46709 ) ) ( not ( = ?auto_46708 ?auto_46710 ) ) ( not ( = ?auto_46709 ?auto_46710 ) ) ( CLEAR ?auto_46708 ) ( ON ?auto_46709 ?auto_46710 ) ( CLEAR ?auto_46709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_46703 ?auto_46704 ?auto_46705 ?auto_46706 ?auto_46707 ?auto_46708 ?auto_46709 )
      ( MAKE-8PILE ?auto_46703 ?auto_46704 ?auto_46705 ?auto_46706 ?auto_46707 ?auto_46708 ?auto_46709 ?auto_46710 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_46719 - BLOCK
      ?auto_46720 - BLOCK
      ?auto_46721 - BLOCK
      ?auto_46722 - BLOCK
      ?auto_46723 - BLOCK
      ?auto_46724 - BLOCK
      ?auto_46725 - BLOCK
      ?auto_46726 - BLOCK
    )
    :vars
    (
      ?auto_46727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46726 ?auto_46727 ) ( ON-TABLE ?auto_46719 ) ( ON ?auto_46720 ?auto_46719 ) ( ON ?auto_46721 ?auto_46720 ) ( ON ?auto_46722 ?auto_46721 ) ( ON ?auto_46723 ?auto_46722 ) ( not ( = ?auto_46719 ?auto_46720 ) ) ( not ( = ?auto_46719 ?auto_46721 ) ) ( not ( = ?auto_46719 ?auto_46722 ) ) ( not ( = ?auto_46719 ?auto_46723 ) ) ( not ( = ?auto_46719 ?auto_46724 ) ) ( not ( = ?auto_46719 ?auto_46725 ) ) ( not ( = ?auto_46719 ?auto_46726 ) ) ( not ( = ?auto_46719 ?auto_46727 ) ) ( not ( = ?auto_46720 ?auto_46721 ) ) ( not ( = ?auto_46720 ?auto_46722 ) ) ( not ( = ?auto_46720 ?auto_46723 ) ) ( not ( = ?auto_46720 ?auto_46724 ) ) ( not ( = ?auto_46720 ?auto_46725 ) ) ( not ( = ?auto_46720 ?auto_46726 ) ) ( not ( = ?auto_46720 ?auto_46727 ) ) ( not ( = ?auto_46721 ?auto_46722 ) ) ( not ( = ?auto_46721 ?auto_46723 ) ) ( not ( = ?auto_46721 ?auto_46724 ) ) ( not ( = ?auto_46721 ?auto_46725 ) ) ( not ( = ?auto_46721 ?auto_46726 ) ) ( not ( = ?auto_46721 ?auto_46727 ) ) ( not ( = ?auto_46722 ?auto_46723 ) ) ( not ( = ?auto_46722 ?auto_46724 ) ) ( not ( = ?auto_46722 ?auto_46725 ) ) ( not ( = ?auto_46722 ?auto_46726 ) ) ( not ( = ?auto_46722 ?auto_46727 ) ) ( not ( = ?auto_46723 ?auto_46724 ) ) ( not ( = ?auto_46723 ?auto_46725 ) ) ( not ( = ?auto_46723 ?auto_46726 ) ) ( not ( = ?auto_46723 ?auto_46727 ) ) ( not ( = ?auto_46724 ?auto_46725 ) ) ( not ( = ?auto_46724 ?auto_46726 ) ) ( not ( = ?auto_46724 ?auto_46727 ) ) ( not ( = ?auto_46725 ?auto_46726 ) ) ( not ( = ?auto_46725 ?auto_46727 ) ) ( not ( = ?auto_46726 ?auto_46727 ) ) ( ON ?auto_46725 ?auto_46726 ) ( CLEAR ?auto_46723 ) ( ON ?auto_46724 ?auto_46725 ) ( CLEAR ?auto_46724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_46719 ?auto_46720 ?auto_46721 ?auto_46722 ?auto_46723 ?auto_46724 )
      ( MAKE-8PILE ?auto_46719 ?auto_46720 ?auto_46721 ?auto_46722 ?auto_46723 ?auto_46724 ?auto_46725 ?auto_46726 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_46736 - BLOCK
      ?auto_46737 - BLOCK
      ?auto_46738 - BLOCK
      ?auto_46739 - BLOCK
      ?auto_46740 - BLOCK
      ?auto_46741 - BLOCK
      ?auto_46742 - BLOCK
      ?auto_46743 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46743 ) ( ON-TABLE ?auto_46736 ) ( ON ?auto_46737 ?auto_46736 ) ( ON ?auto_46738 ?auto_46737 ) ( ON ?auto_46739 ?auto_46738 ) ( ON ?auto_46740 ?auto_46739 ) ( not ( = ?auto_46736 ?auto_46737 ) ) ( not ( = ?auto_46736 ?auto_46738 ) ) ( not ( = ?auto_46736 ?auto_46739 ) ) ( not ( = ?auto_46736 ?auto_46740 ) ) ( not ( = ?auto_46736 ?auto_46741 ) ) ( not ( = ?auto_46736 ?auto_46742 ) ) ( not ( = ?auto_46736 ?auto_46743 ) ) ( not ( = ?auto_46737 ?auto_46738 ) ) ( not ( = ?auto_46737 ?auto_46739 ) ) ( not ( = ?auto_46737 ?auto_46740 ) ) ( not ( = ?auto_46737 ?auto_46741 ) ) ( not ( = ?auto_46737 ?auto_46742 ) ) ( not ( = ?auto_46737 ?auto_46743 ) ) ( not ( = ?auto_46738 ?auto_46739 ) ) ( not ( = ?auto_46738 ?auto_46740 ) ) ( not ( = ?auto_46738 ?auto_46741 ) ) ( not ( = ?auto_46738 ?auto_46742 ) ) ( not ( = ?auto_46738 ?auto_46743 ) ) ( not ( = ?auto_46739 ?auto_46740 ) ) ( not ( = ?auto_46739 ?auto_46741 ) ) ( not ( = ?auto_46739 ?auto_46742 ) ) ( not ( = ?auto_46739 ?auto_46743 ) ) ( not ( = ?auto_46740 ?auto_46741 ) ) ( not ( = ?auto_46740 ?auto_46742 ) ) ( not ( = ?auto_46740 ?auto_46743 ) ) ( not ( = ?auto_46741 ?auto_46742 ) ) ( not ( = ?auto_46741 ?auto_46743 ) ) ( not ( = ?auto_46742 ?auto_46743 ) ) ( ON ?auto_46742 ?auto_46743 ) ( CLEAR ?auto_46740 ) ( ON ?auto_46741 ?auto_46742 ) ( CLEAR ?auto_46741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_46736 ?auto_46737 ?auto_46738 ?auto_46739 ?auto_46740 ?auto_46741 )
      ( MAKE-8PILE ?auto_46736 ?auto_46737 ?auto_46738 ?auto_46739 ?auto_46740 ?auto_46741 ?auto_46742 ?auto_46743 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_46752 - BLOCK
      ?auto_46753 - BLOCK
      ?auto_46754 - BLOCK
      ?auto_46755 - BLOCK
      ?auto_46756 - BLOCK
      ?auto_46757 - BLOCK
      ?auto_46758 - BLOCK
      ?auto_46759 - BLOCK
    )
    :vars
    (
      ?auto_46760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46759 ?auto_46760 ) ( ON-TABLE ?auto_46752 ) ( ON ?auto_46753 ?auto_46752 ) ( ON ?auto_46754 ?auto_46753 ) ( ON ?auto_46755 ?auto_46754 ) ( not ( = ?auto_46752 ?auto_46753 ) ) ( not ( = ?auto_46752 ?auto_46754 ) ) ( not ( = ?auto_46752 ?auto_46755 ) ) ( not ( = ?auto_46752 ?auto_46756 ) ) ( not ( = ?auto_46752 ?auto_46757 ) ) ( not ( = ?auto_46752 ?auto_46758 ) ) ( not ( = ?auto_46752 ?auto_46759 ) ) ( not ( = ?auto_46752 ?auto_46760 ) ) ( not ( = ?auto_46753 ?auto_46754 ) ) ( not ( = ?auto_46753 ?auto_46755 ) ) ( not ( = ?auto_46753 ?auto_46756 ) ) ( not ( = ?auto_46753 ?auto_46757 ) ) ( not ( = ?auto_46753 ?auto_46758 ) ) ( not ( = ?auto_46753 ?auto_46759 ) ) ( not ( = ?auto_46753 ?auto_46760 ) ) ( not ( = ?auto_46754 ?auto_46755 ) ) ( not ( = ?auto_46754 ?auto_46756 ) ) ( not ( = ?auto_46754 ?auto_46757 ) ) ( not ( = ?auto_46754 ?auto_46758 ) ) ( not ( = ?auto_46754 ?auto_46759 ) ) ( not ( = ?auto_46754 ?auto_46760 ) ) ( not ( = ?auto_46755 ?auto_46756 ) ) ( not ( = ?auto_46755 ?auto_46757 ) ) ( not ( = ?auto_46755 ?auto_46758 ) ) ( not ( = ?auto_46755 ?auto_46759 ) ) ( not ( = ?auto_46755 ?auto_46760 ) ) ( not ( = ?auto_46756 ?auto_46757 ) ) ( not ( = ?auto_46756 ?auto_46758 ) ) ( not ( = ?auto_46756 ?auto_46759 ) ) ( not ( = ?auto_46756 ?auto_46760 ) ) ( not ( = ?auto_46757 ?auto_46758 ) ) ( not ( = ?auto_46757 ?auto_46759 ) ) ( not ( = ?auto_46757 ?auto_46760 ) ) ( not ( = ?auto_46758 ?auto_46759 ) ) ( not ( = ?auto_46758 ?auto_46760 ) ) ( not ( = ?auto_46759 ?auto_46760 ) ) ( ON ?auto_46758 ?auto_46759 ) ( ON ?auto_46757 ?auto_46758 ) ( CLEAR ?auto_46755 ) ( ON ?auto_46756 ?auto_46757 ) ( CLEAR ?auto_46756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46752 ?auto_46753 ?auto_46754 ?auto_46755 ?auto_46756 )
      ( MAKE-8PILE ?auto_46752 ?auto_46753 ?auto_46754 ?auto_46755 ?auto_46756 ?auto_46757 ?auto_46758 ?auto_46759 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_46769 - BLOCK
      ?auto_46770 - BLOCK
      ?auto_46771 - BLOCK
      ?auto_46772 - BLOCK
      ?auto_46773 - BLOCK
      ?auto_46774 - BLOCK
      ?auto_46775 - BLOCK
      ?auto_46776 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46776 ) ( ON-TABLE ?auto_46769 ) ( ON ?auto_46770 ?auto_46769 ) ( ON ?auto_46771 ?auto_46770 ) ( ON ?auto_46772 ?auto_46771 ) ( not ( = ?auto_46769 ?auto_46770 ) ) ( not ( = ?auto_46769 ?auto_46771 ) ) ( not ( = ?auto_46769 ?auto_46772 ) ) ( not ( = ?auto_46769 ?auto_46773 ) ) ( not ( = ?auto_46769 ?auto_46774 ) ) ( not ( = ?auto_46769 ?auto_46775 ) ) ( not ( = ?auto_46769 ?auto_46776 ) ) ( not ( = ?auto_46770 ?auto_46771 ) ) ( not ( = ?auto_46770 ?auto_46772 ) ) ( not ( = ?auto_46770 ?auto_46773 ) ) ( not ( = ?auto_46770 ?auto_46774 ) ) ( not ( = ?auto_46770 ?auto_46775 ) ) ( not ( = ?auto_46770 ?auto_46776 ) ) ( not ( = ?auto_46771 ?auto_46772 ) ) ( not ( = ?auto_46771 ?auto_46773 ) ) ( not ( = ?auto_46771 ?auto_46774 ) ) ( not ( = ?auto_46771 ?auto_46775 ) ) ( not ( = ?auto_46771 ?auto_46776 ) ) ( not ( = ?auto_46772 ?auto_46773 ) ) ( not ( = ?auto_46772 ?auto_46774 ) ) ( not ( = ?auto_46772 ?auto_46775 ) ) ( not ( = ?auto_46772 ?auto_46776 ) ) ( not ( = ?auto_46773 ?auto_46774 ) ) ( not ( = ?auto_46773 ?auto_46775 ) ) ( not ( = ?auto_46773 ?auto_46776 ) ) ( not ( = ?auto_46774 ?auto_46775 ) ) ( not ( = ?auto_46774 ?auto_46776 ) ) ( not ( = ?auto_46775 ?auto_46776 ) ) ( ON ?auto_46775 ?auto_46776 ) ( ON ?auto_46774 ?auto_46775 ) ( CLEAR ?auto_46772 ) ( ON ?auto_46773 ?auto_46774 ) ( CLEAR ?auto_46773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46769 ?auto_46770 ?auto_46771 ?auto_46772 ?auto_46773 )
      ( MAKE-8PILE ?auto_46769 ?auto_46770 ?auto_46771 ?auto_46772 ?auto_46773 ?auto_46774 ?auto_46775 ?auto_46776 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_46785 - BLOCK
      ?auto_46786 - BLOCK
      ?auto_46787 - BLOCK
      ?auto_46788 - BLOCK
      ?auto_46789 - BLOCK
      ?auto_46790 - BLOCK
      ?auto_46791 - BLOCK
      ?auto_46792 - BLOCK
    )
    :vars
    (
      ?auto_46793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46792 ?auto_46793 ) ( ON-TABLE ?auto_46785 ) ( ON ?auto_46786 ?auto_46785 ) ( ON ?auto_46787 ?auto_46786 ) ( not ( = ?auto_46785 ?auto_46786 ) ) ( not ( = ?auto_46785 ?auto_46787 ) ) ( not ( = ?auto_46785 ?auto_46788 ) ) ( not ( = ?auto_46785 ?auto_46789 ) ) ( not ( = ?auto_46785 ?auto_46790 ) ) ( not ( = ?auto_46785 ?auto_46791 ) ) ( not ( = ?auto_46785 ?auto_46792 ) ) ( not ( = ?auto_46785 ?auto_46793 ) ) ( not ( = ?auto_46786 ?auto_46787 ) ) ( not ( = ?auto_46786 ?auto_46788 ) ) ( not ( = ?auto_46786 ?auto_46789 ) ) ( not ( = ?auto_46786 ?auto_46790 ) ) ( not ( = ?auto_46786 ?auto_46791 ) ) ( not ( = ?auto_46786 ?auto_46792 ) ) ( not ( = ?auto_46786 ?auto_46793 ) ) ( not ( = ?auto_46787 ?auto_46788 ) ) ( not ( = ?auto_46787 ?auto_46789 ) ) ( not ( = ?auto_46787 ?auto_46790 ) ) ( not ( = ?auto_46787 ?auto_46791 ) ) ( not ( = ?auto_46787 ?auto_46792 ) ) ( not ( = ?auto_46787 ?auto_46793 ) ) ( not ( = ?auto_46788 ?auto_46789 ) ) ( not ( = ?auto_46788 ?auto_46790 ) ) ( not ( = ?auto_46788 ?auto_46791 ) ) ( not ( = ?auto_46788 ?auto_46792 ) ) ( not ( = ?auto_46788 ?auto_46793 ) ) ( not ( = ?auto_46789 ?auto_46790 ) ) ( not ( = ?auto_46789 ?auto_46791 ) ) ( not ( = ?auto_46789 ?auto_46792 ) ) ( not ( = ?auto_46789 ?auto_46793 ) ) ( not ( = ?auto_46790 ?auto_46791 ) ) ( not ( = ?auto_46790 ?auto_46792 ) ) ( not ( = ?auto_46790 ?auto_46793 ) ) ( not ( = ?auto_46791 ?auto_46792 ) ) ( not ( = ?auto_46791 ?auto_46793 ) ) ( not ( = ?auto_46792 ?auto_46793 ) ) ( ON ?auto_46791 ?auto_46792 ) ( ON ?auto_46790 ?auto_46791 ) ( ON ?auto_46789 ?auto_46790 ) ( CLEAR ?auto_46787 ) ( ON ?auto_46788 ?auto_46789 ) ( CLEAR ?auto_46788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46785 ?auto_46786 ?auto_46787 ?auto_46788 )
      ( MAKE-8PILE ?auto_46785 ?auto_46786 ?auto_46787 ?auto_46788 ?auto_46789 ?auto_46790 ?auto_46791 ?auto_46792 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_46802 - BLOCK
      ?auto_46803 - BLOCK
      ?auto_46804 - BLOCK
      ?auto_46805 - BLOCK
      ?auto_46806 - BLOCK
      ?auto_46807 - BLOCK
      ?auto_46808 - BLOCK
      ?auto_46809 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46809 ) ( ON-TABLE ?auto_46802 ) ( ON ?auto_46803 ?auto_46802 ) ( ON ?auto_46804 ?auto_46803 ) ( not ( = ?auto_46802 ?auto_46803 ) ) ( not ( = ?auto_46802 ?auto_46804 ) ) ( not ( = ?auto_46802 ?auto_46805 ) ) ( not ( = ?auto_46802 ?auto_46806 ) ) ( not ( = ?auto_46802 ?auto_46807 ) ) ( not ( = ?auto_46802 ?auto_46808 ) ) ( not ( = ?auto_46802 ?auto_46809 ) ) ( not ( = ?auto_46803 ?auto_46804 ) ) ( not ( = ?auto_46803 ?auto_46805 ) ) ( not ( = ?auto_46803 ?auto_46806 ) ) ( not ( = ?auto_46803 ?auto_46807 ) ) ( not ( = ?auto_46803 ?auto_46808 ) ) ( not ( = ?auto_46803 ?auto_46809 ) ) ( not ( = ?auto_46804 ?auto_46805 ) ) ( not ( = ?auto_46804 ?auto_46806 ) ) ( not ( = ?auto_46804 ?auto_46807 ) ) ( not ( = ?auto_46804 ?auto_46808 ) ) ( not ( = ?auto_46804 ?auto_46809 ) ) ( not ( = ?auto_46805 ?auto_46806 ) ) ( not ( = ?auto_46805 ?auto_46807 ) ) ( not ( = ?auto_46805 ?auto_46808 ) ) ( not ( = ?auto_46805 ?auto_46809 ) ) ( not ( = ?auto_46806 ?auto_46807 ) ) ( not ( = ?auto_46806 ?auto_46808 ) ) ( not ( = ?auto_46806 ?auto_46809 ) ) ( not ( = ?auto_46807 ?auto_46808 ) ) ( not ( = ?auto_46807 ?auto_46809 ) ) ( not ( = ?auto_46808 ?auto_46809 ) ) ( ON ?auto_46808 ?auto_46809 ) ( ON ?auto_46807 ?auto_46808 ) ( ON ?auto_46806 ?auto_46807 ) ( CLEAR ?auto_46804 ) ( ON ?auto_46805 ?auto_46806 ) ( CLEAR ?auto_46805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46802 ?auto_46803 ?auto_46804 ?auto_46805 )
      ( MAKE-8PILE ?auto_46802 ?auto_46803 ?auto_46804 ?auto_46805 ?auto_46806 ?auto_46807 ?auto_46808 ?auto_46809 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_46818 - BLOCK
      ?auto_46819 - BLOCK
      ?auto_46820 - BLOCK
      ?auto_46821 - BLOCK
      ?auto_46822 - BLOCK
      ?auto_46823 - BLOCK
      ?auto_46824 - BLOCK
      ?auto_46825 - BLOCK
    )
    :vars
    (
      ?auto_46826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46825 ?auto_46826 ) ( ON-TABLE ?auto_46818 ) ( ON ?auto_46819 ?auto_46818 ) ( not ( = ?auto_46818 ?auto_46819 ) ) ( not ( = ?auto_46818 ?auto_46820 ) ) ( not ( = ?auto_46818 ?auto_46821 ) ) ( not ( = ?auto_46818 ?auto_46822 ) ) ( not ( = ?auto_46818 ?auto_46823 ) ) ( not ( = ?auto_46818 ?auto_46824 ) ) ( not ( = ?auto_46818 ?auto_46825 ) ) ( not ( = ?auto_46818 ?auto_46826 ) ) ( not ( = ?auto_46819 ?auto_46820 ) ) ( not ( = ?auto_46819 ?auto_46821 ) ) ( not ( = ?auto_46819 ?auto_46822 ) ) ( not ( = ?auto_46819 ?auto_46823 ) ) ( not ( = ?auto_46819 ?auto_46824 ) ) ( not ( = ?auto_46819 ?auto_46825 ) ) ( not ( = ?auto_46819 ?auto_46826 ) ) ( not ( = ?auto_46820 ?auto_46821 ) ) ( not ( = ?auto_46820 ?auto_46822 ) ) ( not ( = ?auto_46820 ?auto_46823 ) ) ( not ( = ?auto_46820 ?auto_46824 ) ) ( not ( = ?auto_46820 ?auto_46825 ) ) ( not ( = ?auto_46820 ?auto_46826 ) ) ( not ( = ?auto_46821 ?auto_46822 ) ) ( not ( = ?auto_46821 ?auto_46823 ) ) ( not ( = ?auto_46821 ?auto_46824 ) ) ( not ( = ?auto_46821 ?auto_46825 ) ) ( not ( = ?auto_46821 ?auto_46826 ) ) ( not ( = ?auto_46822 ?auto_46823 ) ) ( not ( = ?auto_46822 ?auto_46824 ) ) ( not ( = ?auto_46822 ?auto_46825 ) ) ( not ( = ?auto_46822 ?auto_46826 ) ) ( not ( = ?auto_46823 ?auto_46824 ) ) ( not ( = ?auto_46823 ?auto_46825 ) ) ( not ( = ?auto_46823 ?auto_46826 ) ) ( not ( = ?auto_46824 ?auto_46825 ) ) ( not ( = ?auto_46824 ?auto_46826 ) ) ( not ( = ?auto_46825 ?auto_46826 ) ) ( ON ?auto_46824 ?auto_46825 ) ( ON ?auto_46823 ?auto_46824 ) ( ON ?auto_46822 ?auto_46823 ) ( ON ?auto_46821 ?auto_46822 ) ( CLEAR ?auto_46819 ) ( ON ?auto_46820 ?auto_46821 ) ( CLEAR ?auto_46820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46818 ?auto_46819 ?auto_46820 )
      ( MAKE-8PILE ?auto_46818 ?auto_46819 ?auto_46820 ?auto_46821 ?auto_46822 ?auto_46823 ?auto_46824 ?auto_46825 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_46835 - BLOCK
      ?auto_46836 - BLOCK
      ?auto_46837 - BLOCK
      ?auto_46838 - BLOCK
      ?auto_46839 - BLOCK
      ?auto_46840 - BLOCK
      ?auto_46841 - BLOCK
      ?auto_46842 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46842 ) ( ON-TABLE ?auto_46835 ) ( ON ?auto_46836 ?auto_46835 ) ( not ( = ?auto_46835 ?auto_46836 ) ) ( not ( = ?auto_46835 ?auto_46837 ) ) ( not ( = ?auto_46835 ?auto_46838 ) ) ( not ( = ?auto_46835 ?auto_46839 ) ) ( not ( = ?auto_46835 ?auto_46840 ) ) ( not ( = ?auto_46835 ?auto_46841 ) ) ( not ( = ?auto_46835 ?auto_46842 ) ) ( not ( = ?auto_46836 ?auto_46837 ) ) ( not ( = ?auto_46836 ?auto_46838 ) ) ( not ( = ?auto_46836 ?auto_46839 ) ) ( not ( = ?auto_46836 ?auto_46840 ) ) ( not ( = ?auto_46836 ?auto_46841 ) ) ( not ( = ?auto_46836 ?auto_46842 ) ) ( not ( = ?auto_46837 ?auto_46838 ) ) ( not ( = ?auto_46837 ?auto_46839 ) ) ( not ( = ?auto_46837 ?auto_46840 ) ) ( not ( = ?auto_46837 ?auto_46841 ) ) ( not ( = ?auto_46837 ?auto_46842 ) ) ( not ( = ?auto_46838 ?auto_46839 ) ) ( not ( = ?auto_46838 ?auto_46840 ) ) ( not ( = ?auto_46838 ?auto_46841 ) ) ( not ( = ?auto_46838 ?auto_46842 ) ) ( not ( = ?auto_46839 ?auto_46840 ) ) ( not ( = ?auto_46839 ?auto_46841 ) ) ( not ( = ?auto_46839 ?auto_46842 ) ) ( not ( = ?auto_46840 ?auto_46841 ) ) ( not ( = ?auto_46840 ?auto_46842 ) ) ( not ( = ?auto_46841 ?auto_46842 ) ) ( ON ?auto_46841 ?auto_46842 ) ( ON ?auto_46840 ?auto_46841 ) ( ON ?auto_46839 ?auto_46840 ) ( ON ?auto_46838 ?auto_46839 ) ( CLEAR ?auto_46836 ) ( ON ?auto_46837 ?auto_46838 ) ( CLEAR ?auto_46837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46835 ?auto_46836 ?auto_46837 )
      ( MAKE-8PILE ?auto_46835 ?auto_46836 ?auto_46837 ?auto_46838 ?auto_46839 ?auto_46840 ?auto_46841 ?auto_46842 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_46851 - BLOCK
      ?auto_46852 - BLOCK
      ?auto_46853 - BLOCK
      ?auto_46854 - BLOCK
      ?auto_46855 - BLOCK
      ?auto_46856 - BLOCK
      ?auto_46857 - BLOCK
      ?auto_46858 - BLOCK
    )
    :vars
    (
      ?auto_46859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46858 ?auto_46859 ) ( ON-TABLE ?auto_46851 ) ( not ( = ?auto_46851 ?auto_46852 ) ) ( not ( = ?auto_46851 ?auto_46853 ) ) ( not ( = ?auto_46851 ?auto_46854 ) ) ( not ( = ?auto_46851 ?auto_46855 ) ) ( not ( = ?auto_46851 ?auto_46856 ) ) ( not ( = ?auto_46851 ?auto_46857 ) ) ( not ( = ?auto_46851 ?auto_46858 ) ) ( not ( = ?auto_46851 ?auto_46859 ) ) ( not ( = ?auto_46852 ?auto_46853 ) ) ( not ( = ?auto_46852 ?auto_46854 ) ) ( not ( = ?auto_46852 ?auto_46855 ) ) ( not ( = ?auto_46852 ?auto_46856 ) ) ( not ( = ?auto_46852 ?auto_46857 ) ) ( not ( = ?auto_46852 ?auto_46858 ) ) ( not ( = ?auto_46852 ?auto_46859 ) ) ( not ( = ?auto_46853 ?auto_46854 ) ) ( not ( = ?auto_46853 ?auto_46855 ) ) ( not ( = ?auto_46853 ?auto_46856 ) ) ( not ( = ?auto_46853 ?auto_46857 ) ) ( not ( = ?auto_46853 ?auto_46858 ) ) ( not ( = ?auto_46853 ?auto_46859 ) ) ( not ( = ?auto_46854 ?auto_46855 ) ) ( not ( = ?auto_46854 ?auto_46856 ) ) ( not ( = ?auto_46854 ?auto_46857 ) ) ( not ( = ?auto_46854 ?auto_46858 ) ) ( not ( = ?auto_46854 ?auto_46859 ) ) ( not ( = ?auto_46855 ?auto_46856 ) ) ( not ( = ?auto_46855 ?auto_46857 ) ) ( not ( = ?auto_46855 ?auto_46858 ) ) ( not ( = ?auto_46855 ?auto_46859 ) ) ( not ( = ?auto_46856 ?auto_46857 ) ) ( not ( = ?auto_46856 ?auto_46858 ) ) ( not ( = ?auto_46856 ?auto_46859 ) ) ( not ( = ?auto_46857 ?auto_46858 ) ) ( not ( = ?auto_46857 ?auto_46859 ) ) ( not ( = ?auto_46858 ?auto_46859 ) ) ( ON ?auto_46857 ?auto_46858 ) ( ON ?auto_46856 ?auto_46857 ) ( ON ?auto_46855 ?auto_46856 ) ( ON ?auto_46854 ?auto_46855 ) ( ON ?auto_46853 ?auto_46854 ) ( CLEAR ?auto_46851 ) ( ON ?auto_46852 ?auto_46853 ) ( CLEAR ?auto_46852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46851 ?auto_46852 )
      ( MAKE-8PILE ?auto_46851 ?auto_46852 ?auto_46853 ?auto_46854 ?auto_46855 ?auto_46856 ?auto_46857 ?auto_46858 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_46868 - BLOCK
      ?auto_46869 - BLOCK
      ?auto_46870 - BLOCK
      ?auto_46871 - BLOCK
      ?auto_46872 - BLOCK
      ?auto_46873 - BLOCK
      ?auto_46874 - BLOCK
      ?auto_46875 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46875 ) ( ON-TABLE ?auto_46868 ) ( not ( = ?auto_46868 ?auto_46869 ) ) ( not ( = ?auto_46868 ?auto_46870 ) ) ( not ( = ?auto_46868 ?auto_46871 ) ) ( not ( = ?auto_46868 ?auto_46872 ) ) ( not ( = ?auto_46868 ?auto_46873 ) ) ( not ( = ?auto_46868 ?auto_46874 ) ) ( not ( = ?auto_46868 ?auto_46875 ) ) ( not ( = ?auto_46869 ?auto_46870 ) ) ( not ( = ?auto_46869 ?auto_46871 ) ) ( not ( = ?auto_46869 ?auto_46872 ) ) ( not ( = ?auto_46869 ?auto_46873 ) ) ( not ( = ?auto_46869 ?auto_46874 ) ) ( not ( = ?auto_46869 ?auto_46875 ) ) ( not ( = ?auto_46870 ?auto_46871 ) ) ( not ( = ?auto_46870 ?auto_46872 ) ) ( not ( = ?auto_46870 ?auto_46873 ) ) ( not ( = ?auto_46870 ?auto_46874 ) ) ( not ( = ?auto_46870 ?auto_46875 ) ) ( not ( = ?auto_46871 ?auto_46872 ) ) ( not ( = ?auto_46871 ?auto_46873 ) ) ( not ( = ?auto_46871 ?auto_46874 ) ) ( not ( = ?auto_46871 ?auto_46875 ) ) ( not ( = ?auto_46872 ?auto_46873 ) ) ( not ( = ?auto_46872 ?auto_46874 ) ) ( not ( = ?auto_46872 ?auto_46875 ) ) ( not ( = ?auto_46873 ?auto_46874 ) ) ( not ( = ?auto_46873 ?auto_46875 ) ) ( not ( = ?auto_46874 ?auto_46875 ) ) ( ON ?auto_46874 ?auto_46875 ) ( ON ?auto_46873 ?auto_46874 ) ( ON ?auto_46872 ?auto_46873 ) ( ON ?auto_46871 ?auto_46872 ) ( ON ?auto_46870 ?auto_46871 ) ( CLEAR ?auto_46868 ) ( ON ?auto_46869 ?auto_46870 ) ( CLEAR ?auto_46869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46868 ?auto_46869 )
      ( MAKE-8PILE ?auto_46868 ?auto_46869 ?auto_46870 ?auto_46871 ?auto_46872 ?auto_46873 ?auto_46874 ?auto_46875 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_46884 - BLOCK
      ?auto_46885 - BLOCK
      ?auto_46886 - BLOCK
      ?auto_46887 - BLOCK
      ?auto_46888 - BLOCK
      ?auto_46889 - BLOCK
      ?auto_46890 - BLOCK
      ?auto_46891 - BLOCK
    )
    :vars
    (
      ?auto_46892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46891 ?auto_46892 ) ( not ( = ?auto_46884 ?auto_46885 ) ) ( not ( = ?auto_46884 ?auto_46886 ) ) ( not ( = ?auto_46884 ?auto_46887 ) ) ( not ( = ?auto_46884 ?auto_46888 ) ) ( not ( = ?auto_46884 ?auto_46889 ) ) ( not ( = ?auto_46884 ?auto_46890 ) ) ( not ( = ?auto_46884 ?auto_46891 ) ) ( not ( = ?auto_46884 ?auto_46892 ) ) ( not ( = ?auto_46885 ?auto_46886 ) ) ( not ( = ?auto_46885 ?auto_46887 ) ) ( not ( = ?auto_46885 ?auto_46888 ) ) ( not ( = ?auto_46885 ?auto_46889 ) ) ( not ( = ?auto_46885 ?auto_46890 ) ) ( not ( = ?auto_46885 ?auto_46891 ) ) ( not ( = ?auto_46885 ?auto_46892 ) ) ( not ( = ?auto_46886 ?auto_46887 ) ) ( not ( = ?auto_46886 ?auto_46888 ) ) ( not ( = ?auto_46886 ?auto_46889 ) ) ( not ( = ?auto_46886 ?auto_46890 ) ) ( not ( = ?auto_46886 ?auto_46891 ) ) ( not ( = ?auto_46886 ?auto_46892 ) ) ( not ( = ?auto_46887 ?auto_46888 ) ) ( not ( = ?auto_46887 ?auto_46889 ) ) ( not ( = ?auto_46887 ?auto_46890 ) ) ( not ( = ?auto_46887 ?auto_46891 ) ) ( not ( = ?auto_46887 ?auto_46892 ) ) ( not ( = ?auto_46888 ?auto_46889 ) ) ( not ( = ?auto_46888 ?auto_46890 ) ) ( not ( = ?auto_46888 ?auto_46891 ) ) ( not ( = ?auto_46888 ?auto_46892 ) ) ( not ( = ?auto_46889 ?auto_46890 ) ) ( not ( = ?auto_46889 ?auto_46891 ) ) ( not ( = ?auto_46889 ?auto_46892 ) ) ( not ( = ?auto_46890 ?auto_46891 ) ) ( not ( = ?auto_46890 ?auto_46892 ) ) ( not ( = ?auto_46891 ?auto_46892 ) ) ( ON ?auto_46890 ?auto_46891 ) ( ON ?auto_46889 ?auto_46890 ) ( ON ?auto_46888 ?auto_46889 ) ( ON ?auto_46887 ?auto_46888 ) ( ON ?auto_46886 ?auto_46887 ) ( ON ?auto_46885 ?auto_46886 ) ( ON ?auto_46884 ?auto_46885 ) ( CLEAR ?auto_46884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46884 )
      ( MAKE-8PILE ?auto_46884 ?auto_46885 ?auto_46886 ?auto_46887 ?auto_46888 ?auto_46889 ?auto_46890 ?auto_46891 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_46901 - BLOCK
      ?auto_46902 - BLOCK
      ?auto_46903 - BLOCK
      ?auto_46904 - BLOCK
      ?auto_46905 - BLOCK
      ?auto_46906 - BLOCK
      ?auto_46907 - BLOCK
      ?auto_46908 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46908 ) ( not ( = ?auto_46901 ?auto_46902 ) ) ( not ( = ?auto_46901 ?auto_46903 ) ) ( not ( = ?auto_46901 ?auto_46904 ) ) ( not ( = ?auto_46901 ?auto_46905 ) ) ( not ( = ?auto_46901 ?auto_46906 ) ) ( not ( = ?auto_46901 ?auto_46907 ) ) ( not ( = ?auto_46901 ?auto_46908 ) ) ( not ( = ?auto_46902 ?auto_46903 ) ) ( not ( = ?auto_46902 ?auto_46904 ) ) ( not ( = ?auto_46902 ?auto_46905 ) ) ( not ( = ?auto_46902 ?auto_46906 ) ) ( not ( = ?auto_46902 ?auto_46907 ) ) ( not ( = ?auto_46902 ?auto_46908 ) ) ( not ( = ?auto_46903 ?auto_46904 ) ) ( not ( = ?auto_46903 ?auto_46905 ) ) ( not ( = ?auto_46903 ?auto_46906 ) ) ( not ( = ?auto_46903 ?auto_46907 ) ) ( not ( = ?auto_46903 ?auto_46908 ) ) ( not ( = ?auto_46904 ?auto_46905 ) ) ( not ( = ?auto_46904 ?auto_46906 ) ) ( not ( = ?auto_46904 ?auto_46907 ) ) ( not ( = ?auto_46904 ?auto_46908 ) ) ( not ( = ?auto_46905 ?auto_46906 ) ) ( not ( = ?auto_46905 ?auto_46907 ) ) ( not ( = ?auto_46905 ?auto_46908 ) ) ( not ( = ?auto_46906 ?auto_46907 ) ) ( not ( = ?auto_46906 ?auto_46908 ) ) ( not ( = ?auto_46907 ?auto_46908 ) ) ( ON ?auto_46907 ?auto_46908 ) ( ON ?auto_46906 ?auto_46907 ) ( ON ?auto_46905 ?auto_46906 ) ( ON ?auto_46904 ?auto_46905 ) ( ON ?auto_46903 ?auto_46904 ) ( ON ?auto_46902 ?auto_46903 ) ( ON ?auto_46901 ?auto_46902 ) ( CLEAR ?auto_46901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46901 )
      ( MAKE-8PILE ?auto_46901 ?auto_46902 ?auto_46903 ?auto_46904 ?auto_46905 ?auto_46906 ?auto_46907 ?auto_46908 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_46917 - BLOCK
      ?auto_46918 - BLOCK
      ?auto_46919 - BLOCK
      ?auto_46920 - BLOCK
      ?auto_46921 - BLOCK
      ?auto_46922 - BLOCK
      ?auto_46923 - BLOCK
      ?auto_46924 - BLOCK
    )
    :vars
    (
      ?auto_46925 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46917 ?auto_46918 ) ) ( not ( = ?auto_46917 ?auto_46919 ) ) ( not ( = ?auto_46917 ?auto_46920 ) ) ( not ( = ?auto_46917 ?auto_46921 ) ) ( not ( = ?auto_46917 ?auto_46922 ) ) ( not ( = ?auto_46917 ?auto_46923 ) ) ( not ( = ?auto_46917 ?auto_46924 ) ) ( not ( = ?auto_46918 ?auto_46919 ) ) ( not ( = ?auto_46918 ?auto_46920 ) ) ( not ( = ?auto_46918 ?auto_46921 ) ) ( not ( = ?auto_46918 ?auto_46922 ) ) ( not ( = ?auto_46918 ?auto_46923 ) ) ( not ( = ?auto_46918 ?auto_46924 ) ) ( not ( = ?auto_46919 ?auto_46920 ) ) ( not ( = ?auto_46919 ?auto_46921 ) ) ( not ( = ?auto_46919 ?auto_46922 ) ) ( not ( = ?auto_46919 ?auto_46923 ) ) ( not ( = ?auto_46919 ?auto_46924 ) ) ( not ( = ?auto_46920 ?auto_46921 ) ) ( not ( = ?auto_46920 ?auto_46922 ) ) ( not ( = ?auto_46920 ?auto_46923 ) ) ( not ( = ?auto_46920 ?auto_46924 ) ) ( not ( = ?auto_46921 ?auto_46922 ) ) ( not ( = ?auto_46921 ?auto_46923 ) ) ( not ( = ?auto_46921 ?auto_46924 ) ) ( not ( = ?auto_46922 ?auto_46923 ) ) ( not ( = ?auto_46922 ?auto_46924 ) ) ( not ( = ?auto_46923 ?auto_46924 ) ) ( ON ?auto_46917 ?auto_46925 ) ( not ( = ?auto_46924 ?auto_46925 ) ) ( not ( = ?auto_46923 ?auto_46925 ) ) ( not ( = ?auto_46922 ?auto_46925 ) ) ( not ( = ?auto_46921 ?auto_46925 ) ) ( not ( = ?auto_46920 ?auto_46925 ) ) ( not ( = ?auto_46919 ?auto_46925 ) ) ( not ( = ?auto_46918 ?auto_46925 ) ) ( not ( = ?auto_46917 ?auto_46925 ) ) ( ON ?auto_46918 ?auto_46917 ) ( ON ?auto_46919 ?auto_46918 ) ( ON ?auto_46920 ?auto_46919 ) ( ON ?auto_46921 ?auto_46920 ) ( ON ?auto_46922 ?auto_46921 ) ( ON ?auto_46923 ?auto_46922 ) ( ON ?auto_46924 ?auto_46923 ) ( CLEAR ?auto_46924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_46924 ?auto_46923 ?auto_46922 ?auto_46921 ?auto_46920 ?auto_46919 ?auto_46918 ?auto_46917 )
      ( MAKE-8PILE ?auto_46917 ?auto_46918 ?auto_46919 ?auto_46920 ?auto_46921 ?auto_46922 ?auto_46923 ?auto_46924 ) )
  )

)

