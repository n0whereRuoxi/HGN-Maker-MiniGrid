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
      ?auto_150101 - BLOCK
    )
    :vars
    (
      ?auto_150102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150101 ?auto_150102 ) ( CLEAR ?auto_150101 ) ( HAND-EMPTY ) ( not ( = ?auto_150101 ?auto_150102 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150101 ?auto_150102 )
      ( !PUTDOWN ?auto_150101 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_150104 - BLOCK
    )
    :vars
    (
      ?auto_150105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150104 ?auto_150105 ) ( CLEAR ?auto_150104 ) ( HAND-EMPTY ) ( not ( = ?auto_150104 ?auto_150105 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150104 ?auto_150105 )
      ( !PUTDOWN ?auto_150104 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_150108 - BLOCK
      ?auto_150109 - BLOCK
    )
    :vars
    (
      ?auto_150110 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_150108 ) ( ON ?auto_150109 ?auto_150110 ) ( CLEAR ?auto_150109 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150108 ) ( not ( = ?auto_150108 ?auto_150109 ) ) ( not ( = ?auto_150108 ?auto_150110 ) ) ( not ( = ?auto_150109 ?auto_150110 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150109 ?auto_150110 )
      ( !STACK ?auto_150109 ?auto_150108 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_150113 - BLOCK
      ?auto_150114 - BLOCK
    )
    :vars
    (
      ?auto_150115 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_150113 ) ( ON ?auto_150114 ?auto_150115 ) ( CLEAR ?auto_150114 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150113 ) ( not ( = ?auto_150113 ?auto_150114 ) ) ( not ( = ?auto_150113 ?auto_150115 ) ) ( not ( = ?auto_150114 ?auto_150115 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150114 ?auto_150115 )
      ( !STACK ?auto_150114 ?auto_150113 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_150118 - BLOCK
      ?auto_150119 - BLOCK
    )
    :vars
    (
      ?auto_150120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150119 ?auto_150120 ) ( not ( = ?auto_150118 ?auto_150119 ) ) ( not ( = ?auto_150118 ?auto_150120 ) ) ( not ( = ?auto_150119 ?auto_150120 ) ) ( ON ?auto_150118 ?auto_150119 ) ( CLEAR ?auto_150118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150118 )
      ( MAKE-2PILE ?auto_150118 ?auto_150119 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_150123 - BLOCK
      ?auto_150124 - BLOCK
    )
    :vars
    (
      ?auto_150125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150124 ?auto_150125 ) ( not ( = ?auto_150123 ?auto_150124 ) ) ( not ( = ?auto_150123 ?auto_150125 ) ) ( not ( = ?auto_150124 ?auto_150125 ) ) ( ON ?auto_150123 ?auto_150124 ) ( CLEAR ?auto_150123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150123 )
      ( MAKE-2PILE ?auto_150123 ?auto_150124 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_150129 - BLOCK
      ?auto_150130 - BLOCK
      ?auto_150131 - BLOCK
    )
    :vars
    (
      ?auto_150132 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_150130 ) ( ON ?auto_150131 ?auto_150132 ) ( CLEAR ?auto_150131 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150129 ) ( ON ?auto_150130 ?auto_150129 ) ( not ( = ?auto_150129 ?auto_150130 ) ) ( not ( = ?auto_150129 ?auto_150131 ) ) ( not ( = ?auto_150129 ?auto_150132 ) ) ( not ( = ?auto_150130 ?auto_150131 ) ) ( not ( = ?auto_150130 ?auto_150132 ) ) ( not ( = ?auto_150131 ?auto_150132 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150131 ?auto_150132 )
      ( !STACK ?auto_150131 ?auto_150130 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_150136 - BLOCK
      ?auto_150137 - BLOCK
      ?auto_150138 - BLOCK
    )
    :vars
    (
      ?auto_150139 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_150137 ) ( ON ?auto_150138 ?auto_150139 ) ( CLEAR ?auto_150138 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150136 ) ( ON ?auto_150137 ?auto_150136 ) ( not ( = ?auto_150136 ?auto_150137 ) ) ( not ( = ?auto_150136 ?auto_150138 ) ) ( not ( = ?auto_150136 ?auto_150139 ) ) ( not ( = ?auto_150137 ?auto_150138 ) ) ( not ( = ?auto_150137 ?auto_150139 ) ) ( not ( = ?auto_150138 ?auto_150139 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150138 ?auto_150139 )
      ( !STACK ?auto_150138 ?auto_150137 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_150143 - BLOCK
      ?auto_150144 - BLOCK
      ?auto_150145 - BLOCK
    )
    :vars
    (
      ?auto_150146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150145 ?auto_150146 ) ( ON-TABLE ?auto_150143 ) ( not ( = ?auto_150143 ?auto_150144 ) ) ( not ( = ?auto_150143 ?auto_150145 ) ) ( not ( = ?auto_150143 ?auto_150146 ) ) ( not ( = ?auto_150144 ?auto_150145 ) ) ( not ( = ?auto_150144 ?auto_150146 ) ) ( not ( = ?auto_150145 ?auto_150146 ) ) ( CLEAR ?auto_150143 ) ( ON ?auto_150144 ?auto_150145 ) ( CLEAR ?auto_150144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150143 ?auto_150144 )
      ( MAKE-3PILE ?auto_150143 ?auto_150144 ?auto_150145 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_150150 - BLOCK
      ?auto_150151 - BLOCK
      ?auto_150152 - BLOCK
    )
    :vars
    (
      ?auto_150153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150152 ?auto_150153 ) ( ON-TABLE ?auto_150150 ) ( not ( = ?auto_150150 ?auto_150151 ) ) ( not ( = ?auto_150150 ?auto_150152 ) ) ( not ( = ?auto_150150 ?auto_150153 ) ) ( not ( = ?auto_150151 ?auto_150152 ) ) ( not ( = ?auto_150151 ?auto_150153 ) ) ( not ( = ?auto_150152 ?auto_150153 ) ) ( CLEAR ?auto_150150 ) ( ON ?auto_150151 ?auto_150152 ) ( CLEAR ?auto_150151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150150 ?auto_150151 )
      ( MAKE-3PILE ?auto_150150 ?auto_150151 ?auto_150152 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_150157 - BLOCK
      ?auto_150158 - BLOCK
      ?auto_150159 - BLOCK
    )
    :vars
    (
      ?auto_150160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150159 ?auto_150160 ) ( not ( = ?auto_150157 ?auto_150158 ) ) ( not ( = ?auto_150157 ?auto_150159 ) ) ( not ( = ?auto_150157 ?auto_150160 ) ) ( not ( = ?auto_150158 ?auto_150159 ) ) ( not ( = ?auto_150158 ?auto_150160 ) ) ( not ( = ?auto_150159 ?auto_150160 ) ) ( ON ?auto_150158 ?auto_150159 ) ( ON ?auto_150157 ?auto_150158 ) ( CLEAR ?auto_150157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150157 )
      ( MAKE-3PILE ?auto_150157 ?auto_150158 ?auto_150159 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_150164 - BLOCK
      ?auto_150165 - BLOCK
      ?auto_150166 - BLOCK
    )
    :vars
    (
      ?auto_150167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150166 ?auto_150167 ) ( not ( = ?auto_150164 ?auto_150165 ) ) ( not ( = ?auto_150164 ?auto_150166 ) ) ( not ( = ?auto_150164 ?auto_150167 ) ) ( not ( = ?auto_150165 ?auto_150166 ) ) ( not ( = ?auto_150165 ?auto_150167 ) ) ( not ( = ?auto_150166 ?auto_150167 ) ) ( ON ?auto_150165 ?auto_150166 ) ( ON ?auto_150164 ?auto_150165 ) ( CLEAR ?auto_150164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150164 )
      ( MAKE-3PILE ?auto_150164 ?auto_150165 ?auto_150166 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150172 - BLOCK
      ?auto_150173 - BLOCK
      ?auto_150174 - BLOCK
      ?auto_150175 - BLOCK
    )
    :vars
    (
      ?auto_150176 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_150174 ) ( ON ?auto_150175 ?auto_150176 ) ( CLEAR ?auto_150175 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150172 ) ( ON ?auto_150173 ?auto_150172 ) ( ON ?auto_150174 ?auto_150173 ) ( not ( = ?auto_150172 ?auto_150173 ) ) ( not ( = ?auto_150172 ?auto_150174 ) ) ( not ( = ?auto_150172 ?auto_150175 ) ) ( not ( = ?auto_150172 ?auto_150176 ) ) ( not ( = ?auto_150173 ?auto_150174 ) ) ( not ( = ?auto_150173 ?auto_150175 ) ) ( not ( = ?auto_150173 ?auto_150176 ) ) ( not ( = ?auto_150174 ?auto_150175 ) ) ( not ( = ?auto_150174 ?auto_150176 ) ) ( not ( = ?auto_150175 ?auto_150176 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150175 ?auto_150176 )
      ( !STACK ?auto_150175 ?auto_150174 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150181 - BLOCK
      ?auto_150182 - BLOCK
      ?auto_150183 - BLOCK
      ?auto_150184 - BLOCK
    )
    :vars
    (
      ?auto_150185 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_150183 ) ( ON ?auto_150184 ?auto_150185 ) ( CLEAR ?auto_150184 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150181 ) ( ON ?auto_150182 ?auto_150181 ) ( ON ?auto_150183 ?auto_150182 ) ( not ( = ?auto_150181 ?auto_150182 ) ) ( not ( = ?auto_150181 ?auto_150183 ) ) ( not ( = ?auto_150181 ?auto_150184 ) ) ( not ( = ?auto_150181 ?auto_150185 ) ) ( not ( = ?auto_150182 ?auto_150183 ) ) ( not ( = ?auto_150182 ?auto_150184 ) ) ( not ( = ?auto_150182 ?auto_150185 ) ) ( not ( = ?auto_150183 ?auto_150184 ) ) ( not ( = ?auto_150183 ?auto_150185 ) ) ( not ( = ?auto_150184 ?auto_150185 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150184 ?auto_150185 )
      ( !STACK ?auto_150184 ?auto_150183 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150190 - BLOCK
      ?auto_150191 - BLOCK
      ?auto_150192 - BLOCK
      ?auto_150193 - BLOCK
    )
    :vars
    (
      ?auto_150194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150193 ?auto_150194 ) ( ON-TABLE ?auto_150190 ) ( ON ?auto_150191 ?auto_150190 ) ( not ( = ?auto_150190 ?auto_150191 ) ) ( not ( = ?auto_150190 ?auto_150192 ) ) ( not ( = ?auto_150190 ?auto_150193 ) ) ( not ( = ?auto_150190 ?auto_150194 ) ) ( not ( = ?auto_150191 ?auto_150192 ) ) ( not ( = ?auto_150191 ?auto_150193 ) ) ( not ( = ?auto_150191 ?auto_150194 ) ) ( not ( = ?auto_150192 ?auto_150193 ) ) ( not ( = ?auto_150192 ?auto_150194 ) ) ( not ( = ?auto_150193 ?auto_150194 ) ) ( CLEAR ?auto_150191 ) ( ON ?auto_150192 ?auto_150193 ) ( CLEAR ?auto_150192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150190 ?auto_150191 ?auto_150192 )
      ( MAKE-4PILE ?auto_150190 ?auto_150191 ?auto_150192 ?auto_150193 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150199 - BLOCK
      ?auto_150200 - BLOCK
      ?auto_150201 - BLOCK
      ?auto_150202 - BLOCK
    )
    :vars
    (
      ?auto_150203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150202 ?auto_150203 ) ( ON-TABLE ?auto_150199 ) ( ON ?auto_150200 ?auto_150199 ) ( not ( = ?auto_150199 ?auto_150200 ) ) ( not ( = ?auto_150199 ?auto_150201 ) ) ( not ( = ?auto_150199 ?auto_150202 ) ) ( not ( = ?auto_150199 ?auto_150203 ) ) ( not ( = ?auto_150200 ?auto_150201 ) ) ( not ( = ?auto_150200 ?auto_150202 ) ) ( not ( = ?auto_150200 ?auto_150203 ) ) ( not ( = ?auto_150201 ?auto_150202 ) ) ( not ( = ?auto_150201 ?auto_150203 ) ) ( not ( = ?auto_150202 ?auto_150203 ) ) ( CLEAR ?auto_150200 ) ( ON ?auto_150201 ?auto_150202 ) ( CLEAR ?auto_150201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150199 ?auto_150200 ?auto_150201 )
      ( MAKE-4PILE ?auto_150199 ?auto_150200 ?auto_150201 ?auto_150202 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150208 - BLOCK
      ?auto_150209 - BLOCK
      ?auto_150210 - BLOCK
      ?auto_150211 - BLOCK
    )
    :vars
    (
      ?auto_150212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150211 ?auto_150212 ) ( ON-TABLE ?auto_150208 ) ( not ( = ?auto_150208 ?auto_150209 ) ) ( not ( = ?auto_150208 ?auto_150210 ) ) ( not ( = ?auto_150208 ?auto_150211 ) ) ( not ( = ?auto_150208 ?auto_150212 ) ) ( not ( = ?auto_150209 ?auto_150210 ) ) ( not ( = ?auto_150209 ?auto_150211 ) ) ( not ( = ?auto_150209 ?auto_150212 ) ) ( not ( = ?auto_150210 ?auto_150211 ) ) ( not ( = ?auto_150210 ?auto_150212 ) ) ( not ( = ?auto_150211 ?auto_150212 ) ) ( ON ?auto_150210 ?auto_150211 ) ( CLEAR ?auto_150208 ) ( ON ?auto_150209 ?auto_150210 ) ( CLEAR ?auto_150209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150208 ?auto_150209 )
      ( MAKE-4PILE ?auto_150208 ?auto_150209 ?auto_150210 ?auto_150211 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150217 - BLOCK
      ?auto_150218 - BLOCK
      ?auto_150219 - BLOCK
      ?auto_150220 - BLOCK
    )
    :vars
    (
      ?auto_150221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150220 ?auto_150221 ) ( ON-TABLE ?auto_150217 ) ( not ( = ?auto_150217 ?auto_150218 ) ) ( not ( = ?auto_150217 ?auto_150219 ) ) ( not ( = ?auto_150217 ?auto_150220 ) ) ( not ( = ?auto_150217 ?auto_150221 ) ) ( not ( = ?auto_150218 ?auto_150219 ) ) ( not ( = ?auto_150218 ?auto_150220 ) ) ( not ( = ?auto_150218 ?auto_150221 ) ) ( not ( = ?auto_150219 ?auto_150220 ) ) ( not ( = ?auto_150219 ?auto_150221 ) ) ( not ( = ?auto_150220 ?auto_150221 ) ) ( ON ?auto_150219 ?auto_150220 ) ( CLEAR ?auto_150217 ) ( ON ?auto_150218 ?auto_150219 ) ( CLEAR ?auto_150218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150217 ?auto_150218 )
      ( MAKE-4PILE ?auto_150217 ?auto_150218 ?auto_150219 ?auto_150220 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150226 - BLOCK
      ?auto_150227 - BLOCK
      ?auto_150228 - BLOCK
      ?auto_150229 - BLOCK
    )
    :vars
    (
      ?auto_150230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150229 ?auto_150230 ) ( not ( = ?auto_150226 ?auto_150227 ) ) ( not ( = ?auto_150226 ?auto_150228 ) ) ( not ( = ?auto_150226 ?auto_150229 ) ) ( not ( = ?auto_150226 ?auto_150230 ) ) ( not ( = ?auto_150227 ?auto_150228 ) ) ( not ( = ?auto_150227 ?auto_150229 ) ) ( not ( = ?auto_150227 ?auto_150230 ) ) ( not ( = ?auto_150228 ?auto_150229 ) ) ( not ( = ?auto_150228 ?auto_150230 ) ) ( not ( = ?auto_150229 ?auto_150230 ) ) ( ON ?auto_150228 ?auto_150229 ) ( ON ?auto_150227 ?auto_150228 ) ( ON ?auto_150226 ?auto_150227 ) ( CLEAR ?auto_150226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150226 )
      ( MAKE-4PILE ?auto_150226 ?auto_150227 ?auto_150228 ?auto_150229 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150235 - BLOCK
      ?auto_150236 - BLOCK
      ?auto_150237 - BLOCK
      ?auto_150238 - BLOCK
    )
    :vars
    (
      ?auto_150239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150238 ?auto_150239 ) ( not ( = ?auto_150235 ?auto_150236 ) ) ( not ( = ?auto_150235 ?auto_150237 ) ) ( not ( = ?auto_150235 ?auto_150238 ) ) ( not ( = ?auto_150235 ?auto_150239 ) ) ( not ( = ?auto_150236 ?auto_150237 ) ) ( not ( = ?auto_150236 ?auto_150238 ) ) ( not ( = ?auto_150236 ?auto_150239 ) ) ( not ( = ?auto_150237 ?auto_150238 ) ) ( not ( = ?auto_150237 ?auto_150239 ) ) ( not ( = ?auto_150238 ?auto_150239 ) ) ( ON ?auto_150237 ?auto_150238 ) ( ON ?auto_150236 ?auto_150237 ) ( ON ?auto_150235 ?auto_150236 ) ( CLEAR ?auto_150235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150235 )
      ( MAKE-4PILE ?auto_150235 ?auto_150236 ?auto_150237 ?auto_150238 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_150245 - BLOCK
      ?auto_150246 - BLOCK
      ?auto_150247 - BLOCK
      ?auto_150248 - BLOCK
      ?auto_150249 - BLOCK
    )
    :vars
    (
      ?auto_150250 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_150248 ) ( ON ?auto_150249 ?auto_150250 ) ( CLEAR ?auto_150249 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150245 ) ( ON ?auto_150246 ?auto_150245 ) ( ON ?auto_150247 ?auto_150246 ) ( ON ?auto_150248 ?auto_150247 ) ( not ( = ?auto_150245 ?auto_150246 ) ) ( not ( = ?auto_150245 ?auto_150247 ) ) ( not ( = ?auto_150245 ?auto_150248 ) ) ( not ( = ?auto_150245 ?auto_150249 ) ) ( not ( = ?auto_150245 ?auto_150250 ) ) ( not ( = ?auto_150246 ?auto_150247 ) ) ( not ( = ?auto_150246 ?auto_150248 ) ) ( not ( = ?auto_150246 ?auto_150249 ) ) ( not ( = ?auto_150246 ?auto_150250 ) ) ( not ( = ?auto_150247 ?auto_150248 ) ) ( not ( = ?auto_150247 ?auto_150249 ) ) ( not ( = ?auto_150247 ?auto_150250 ) ) ( not ( = ?auto_150248 ?auto_150249 ) ) ( not ( = ?auto_150248 ?auto_150250 ) ) ( not ( = ?auto_150249 ?auto_150250 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150249 ?auto_150250 )
      ( !STACK ?auto_150249 ?auto_150248 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_150256 - BLOCK
      ?auto_150257 - BLOCK
      ?auto_150258 - BLOCK
      ?auto_150259 - BLOCK
      ?auto_150260 - BLOCK
    )
    :vars
    (
      ?auto_150261 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_150259 ) ( ON ?auto_150260 ?auto_150261 ) ( CLEAR ?auto_150260 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150256 ) ( ON ?auto_150257 ?auto_150256 ) ( ON ?auto_150258 ?auto_150257 ) ( ON ?auto_150259 ?auto_150258 ) ( not ( = ?auto_150256 ?auto_150257 ) ) ( not ( = ?auto_150256 ?auto_150258 ) ) ( not ( = ?auto_150256 ?auto_150259 ) ) ( not ( = ?auto_150256 ?auto_150260 ) ) ( not ( = ?auto_150256 ?auto_150261 ) ) ( not ( = ?auto_150257 ?auto_150258 ) ) ( not ( = ?auto_150257 ?auto_150259 ) ) ( not ( = ?auto_150257 ?auto_150260 ) ) ( not ( = ?auto_150257 ?auto_150261 ) ) ( not ( = ?auto_150258 ?auto_150259 ) ) ( not ( = ?auto_150258 ?auto_150260 ) ) ( not ( = ?auto_150258 ?auto_150261 ) ) ( not ( = ?auto_150259 ?auto_150260 ) ) ( not ( = ?auto_150259 ?auto_150261 ) ) ( not ( = ?auto_150260 ?auto_150261 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150260 ?auto_150261 )
      ( !STACK ?auto_150260 ?auto_150259 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_150267 - BLOCK
      ?auto_150268 - BLOCK
      ?auto_150269 - BLOCK
      ?auto_150270 - BLOCK
      ?auto_150271 - BLOCK
    )
    :vars
    (
      ?auto_150272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150271 ?auto_150272 ) ( ON-TABLE ?auto_150267 ) ( ON ?auto_150268 ?auto_150267 ) ( ON ?auto_150269 ?auto_150268 ) ( not ( = ?auto_150267 ?auto_150268 ) ) ( not ( = ?auto_150267 ?auto_150269 ) ) ( not ( = ?auto_150267 ?auto_150270 ) ) ( not ( = ?auto_150267 ?auto_150271 ) ) ( not ( = ?auto_150267 ?auto_150272 ) ) ( not ( = ?auto_150268 ?auto_150269 ) ) ( not ( = ?auto_150268 ?auto_150270 ) ) ( not ( = ?auto_150268 ?auto_150271 ) ) ( not ( = ?auto_150268 ?auto_150272 ) ) ( not ( = ?auto_150269 ?auto_150270 ) ) ( not ( = ?auto_150269 ?auto_150271 ) ) ( not ( = ?auto_150269 ?auto_150272 ) ) ( not ( = ?auto_150270 ?auto_150271 ) ) ( not ( = ?auto_150270 ?auto_150272 ) ) ( not ( = ?auto_150271 ?auto_150272 ) ) ( CLEAR ?auto_150269 ) ( ON ?auto_150270 ?auto_150271 ) ( CLEAR ?auto_150270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150267 ?auto_150268 ?auto_150269 ?auto_150270 )
      ( MAKE-5PILE ?auto_150267 ?auto_150268 ?auto_150269 ?auto_150270 ?auto_150271 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_150278 - BLOCK
      ?auto_150279 - BLOCK
      ?auto_150280 - BLOCK
      ?auto_150281 - BLOCK
      ?auto_150282 - BLOCK
    )
    :vars
    (
      ?auto_150283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150282 ?auto_150283 ) ( ON-TABLE ?auto_150278 ) ( ON ?auto_150279 ?auto_150278 ) ( ON ?auto_150280 ?auto_150279 ) ( not ( = ?auto_150278 ?auto_150279 ) ) ( not ( = ?auto_150278 ?auto_150280 ) ) ( not ( = ?auto_150278 ?auto_150281 ) ) ( not ( = ?auto_150278 ?auto_150282 ) ) ( not ( = ?auto_150278 ?auto_150283 ) ) ( not ( = ?auto_150279 ?auto_150280 ) ) ( not ( = ?auto_150279 ?auto_150281 ) ) ( not ( = ?auto_150279 ?auto_150282 ) ) ( not ( = ?auto_150279 ?auto_150283 ) ) ( not ( = ?auto_150280 ?auto_150281 ) ) ( not ( = ?auto_150280 ?auto_150282 ) ) ( not ( = ?auto_150280 ?auto_150283 ) ) ( not ( = ?auto_150281 ?auto_150282 ) ) ( not ( = ?auto_150281 ?auto_150283 ) ) ( not ( = ?auto_150282 ?auto_150283 ) ) ( CLEAR ?auto_150280 ) ( ON ?auto_150281 ?auto_150282 ) ( CLEAR ?auto_150281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150278 ?auto_150279 ?auto_150280 ?auto_150281 )
      ( MAKE-5PILE ?auto_150278 ?auto_150279 ?auto_150280 ?auto_150281 ?auto_150282 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_150289 - BLOCK
      ?auto_150290 - BLOCK
      ?auto_150291 - BLOCK
      ?auto_150292 - BLOCK
      ?auto_150293 - BLOCK
    )
    :vars
    (
      ?auto_150294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150293 ?auto_150294 ) ( ON-TABLE ?auto_150289 ) ( ON ?auto_150290 ?auto_150289 ) ( not ( = ?auto_150289 ?auto_150290 ) ) ( not ( = ?auto_150289 ?auto_150291 ) ) ( not ( = ?auto_150289 ?auto_150292 ) ) ( not ( = ?auto_150289 ?auto_150293 ) ) ( not ( = ?auto_150289 ?auto_150294 ) ) ( not ( = ?auto_150290 ?auto_150291 ) ) ( not ( = ?auto_150290 ?auto_150292 ) ) ( not ( = ?auto_150290 ?auto_150293 ) ) ( not ( = ?auto_150290 ?auto_150294 ) ) ( not ( = ?auto_150291 ?auto_150292 ) ) ( not ( = ?auto_150291 ?auto_150293 ) ) ( not ( = ?auto_150291 ?auto_150294 ) ) ( not ( = ?auto_150292 ?auto_150293 ) ) ( not ( = ?auto_150292 ?auto_150294 ) ) ( not ( = ?auto_150293 ?auto_150294 ) ) ( ON ?auto_150292 ?auto_150293 ) ( CLEAR ?auto_150290 ) ( ON ?auto_150291 ?auto_150292 ) ( CLEAR ?auto_150291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150289 ?auto_150290 ?auto_150291 )
      ( MAKE-5PILE ?auto_150289 ?auto_150290 ?auto_150291 ?auto_150292 ?auto_150293 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_150300 - BLOCK
      ?auto_150301 - BLOCK
      ?auto_150302 - BLOCK
      ?auto_150303 - BLOCK
      ?auto_150304 - BLOCK
    )
    :vars
    (
      ?auto_150305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150304 ?auto_150305 ) ( ON-TABLE ?auto_150300 ) ( ON ?auto_150301 ?auto_150300 ) ( not ( = ?auto_150300 ?auto_150301 ) ) ( not ( = ?auto_150300 ?auto_150302 ) ) ( not ( = ?auto_150300 ?auto_150303 ) ) ( not ( = ?auto_150300 ?auto_150304 ) ) ( not ( = ?auto_150300 ?auto_150305 ) ) ( not ( = ?auto_150301 ?auto_150302 ) ) ( not ( = ?auto_150301 ?auto_150303 ) ) ( not ( = ?auto_150301 ?auto_150304 ) ) ( not ( = ?auto_150301 ?auto_150305 ) ) ( not ( = ?auto_150302 ?auto_150303 ) ) ( not ( = ?auto_150302 ?auto_150304 ) ) ( not ( = ?auto_150302 ?auto_150305 ) ) ( not ( = ?auto_150303 ?auto_150304 ) ) ( not ( = ?auto_150303 ?auto_150305 ) ) ( not ( = ?auto_150304 ?auto_150305 ) ) ( ON ?auto_150303 ?auto_150304 ) ( CLEAR ?auto_150301 ) ( ON ?auto_150302 ?auto_150303 ) ( CLEAR ?auto_150302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150300 ?auto_150301 ?auto_150302 )
      ( MAKE-5PILE ?auto_150300 ?auto_150301 ?auto_150302 ?auto_150303 ?auto_150304 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_150311 - BLOCK
      ?auto_150312 - BLOCK
      ?auto_150313 - BLOCK
      ?auto_150314 - BLOCK
      ?auto_150315 - BLOCK
    )
    :vars
    (
      ?auto_150316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150315 ?auto_150316 ) ( ON-TABLE ?auto_150311 ) ( not ( = ?auto_150311 ?auto_150312 ) ) ( not ( = ?auto_150311 ?auto_150313 ) ) ( not ( = ?auto_150311 ?auto_150314 ) ) ( not ( = ?auto_150311 ?auto_150315 ) ) ( not ( = ?auto_150311 ?auto_150316 ) ) ( not ( = ?auto_150312 ?auto_150313 ) ) ( not ( = ?auto_150312 ?auto_150314 ) ) ( not ( = ?auto_150312 ?auto_150315 ) ) ( not ( = ?auto_150312 ?auto_150316 ) ) ( not ( = ?auto_150313 ?auto_150314 ) ) ( not ( = ?auto_150313 ?auto_150315 ) ) ( not ( = ?auto_150313 ?auto_150316 ) ) ( not ( = ?auto_150314 ?auto_150315 ) ) ( not ( = ?auto_150314 ?auto_150316 ) ) ( not ( = ?auto_150315 ?auto_150316 ) ) ( ON ?auto_150314 ?auto_150315 ) ( ON ?auto_150313 ?auto_150314 ) ( CLEAR ?auto_150311 ) ( ON ?auto_150312 ?auto_150313 ) ( CLEAR ?auto_150312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150311 ?auto_150312 )
      ( MAKE-5PILE ?auto_150311 ?auto_150312 ?auto_150313 ?auto_150314 ?auto_150315 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_150322 - BLOCK
      ?auto_150323 - BLOCK
      ?auto_150324 - BLOCK
      ?auto_150325 - BLOCK
      ?auto_150326 - BLOCK
    )
    :vars
    (
      ?auto_150327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150326 ?auto_150327 ) ( ON-TABLE ?auto_150322 ) ( not ( = ?auto_150322 ?auto_150323 ) ) ( not ( = ?auto_150322 ?auto_150324 ) ) ( not ( = ?auto_150322 ?auto_150325 ) ) ( not ( = ?auto_150322 ?auto_150326 ) ) ( not ( = ?auto_150322 ?auto_150327 ) ) ( not ( = ?auto_150323 ?auto_150324 ) ) ( not ( = ?auto_150323 ?auto_150325 ) ) ( not ( = ?auto_150323 ?auto_150326 ) ) ( not ( = ?auto_150323 ?auto_150327 ) ) ( not ( = ?auto_150324 ?auto_150325 ) ) ( not ( = ?auto_150324 ?auto_150326 ) ) ( not ( = ?auto_150324 ?auto_150327 ) ) ( not ( = ?auto_150325 ?auto_150326 ) ) ( not ( = ?auto_150325 ?auto_150327 ) ) ( not ( = ?auto_150326 ?auto_150327 ) ) ( ON ?auto_150325 ?auto_150326 ) ( ON ?auto_150324 ?auto_150325 ) ( CLEAR ?auto_150322 ) ( ON ?auto_150323 ?auto_150324 ) ( CLEAR ?auto_150323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150322 ?auto_150323 )
      ( MAKE-5PILE ?auto_150322 ?auto_150323 ?auto_150324 ?auto_150325 ?auto_150326 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_150333 - BLOCK
      ?auto_150334 - BLOCK
      ?auto_150335 - BLOCK
      ?auto_150336 - BLOCK
      ?auto_150337 - BLOCK
    )
    :vars
    (
      ?auto_150338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150337 ?auto_150338 ) ( not ( = ?auto_150333 ?auto_150334 ) ) ( not ( = ?auto_150333 ?auto_150335 ) ) ( not ( = ?auto_150333 ?auto_150336 ) ) ( not ( = ?auto_150333 ?auto_150337 ) ) ( not ( = ?auto_150333 ?auto_150338 ) ) ( not ( = ?auto_150334 ?auto_150335 ) ) ( not ( = ?auto_150334 ?auto_150336 ) ) ( not ( = ?auto_150334 ?auto_150337 ) ) ( not ( = ?auto_150334 ?auto_150338 ) ) ( not ( = ?auto_150335 ?auto_150336 ) ) ( not ( = ?auto_150335 ?auto_150337 ) ) ( not ( = ?auto_150335 ?auto_150338 ) ) ( not ( = ?auto_150336 ?auto_150337 ) ) ( not ( = ?auto_150336 ?auto_150338 ) ) ( not ( = ?auto_150337 ?auto_150338 ) ) ( ON ?auto_150336 ?auto_150337 ) ( ON ?auto_150335 ?auto_150336 ) ( ON ?auto_150334 ?auto_150335 ) ( ON ?auto_150333 ?auto_150334 ) ( CLEAR ?auto_150333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150333 )
      ( MAKE-5PILE ?auto_150333 ?auto_150334 ?auto_150335 ?auto_150336 ?auto_150337 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_150344 - BLOCK
      ?auto_150345 - BLOCK
      ?auto_150346 - BLOCK
      ?auto_150347 - BLOCK
      ?auto_150348 - BLOCK
    )
    :vars
    (
      ?auto_150349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150348 ?auto_150349 ) ( not ( = ?auto_150344 ?auto_150345 ) ) ( not ( = ?auto_150344 ?auto_150346 ) ) ( not ( = ?auto_150344 ?auto_150347 ) ) ( not ( = ?auto_150344 ?auto_150348 ) ) ( not ( = ?auto_150344 ?auto_150349 ) ) ( not ( = ?auto_150345 ?auto_150346 ) ) ( not ( = ?auto_150345 ?auto_150347 ) ) ( not ( = ?auto_150345 ?auto_150348 ) ) ( not ( = ?auto_150345 ?auto_150349 ) ) ( not ( = ?auto_150346 ?auto_150347 ) ) ( not ( = ?auto_150346 ?auto_150348 ) ) ( not ( = ?auto_150346 ?auto_150349 ) ) ( not ( = ?auto_150347 ?auto_150348 ) ) ( not ( = ?auto_150347 ?auto_150349 ) ) ( not ( = ?auto_150348 ?auto_150349 ) ) ( ON ?auto_150347 ?auto_150348 ) ( ON ?auto_150346 ?auto_150347 ) ( ON ?auto_150345 ?auto_150346 ) ( ON ?auto_150344 ?auto_150345 ) ( CLEAR ?auto_150344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150344 )
      ( MAKE-5PILE ?auto_150344 ?auto_150345 ?auto_150346 ?auto_150347 ?auto_150348 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_150356 - BLOCK
      ?auto_150357 - BLOCK
      ?auto_150358 - BLOCK
      ?auto_150359 - BLOCK
      ?auto_150360 - BLOCK
      ?auto_150361 - BLOCK
    )
    :vars
    (
      ?auto_150362 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_150360 ) ( ON ?auto_150361 ?auto_150362 ) ( CLEAR ?auto_150361 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150356 ) ( ON ?auto_150357 ?auto_150356 ) ( ON ?auto_150358 ?auto_150357 ) ( ON ?auto_150359 ?auto_150358 ) ( ON ?auto_150360 ?auto_150359 ) ( not ( = ?auto_150356 ?auto_150357 ) ) ( not ( = ?auto_150356 ?auto_150358 ) ) ( not ( = ?auto_150356 ?auto_150359 ) ) ( not ( = ?auto_150356 ?auto_150360 ) ) ( not ( = ?auto_150356 ?auto_150361 ) ) ( not ( = ?auto_150356 ?auto_150362 ) ) ( not ( = ?auto_150357 ?auto_150358 ) ) ( not ( = ?auto_150357 ?auto_150359 ) ) ( not ( = ?auto_150357 ?auto_150360 ) ) ( not ( = ?auto_150357 ?auto_150361 ) ) ( not ( = ?auto_150357 ?auto_150362 ) ) ( not ( = ?auto_150358 ?auto_150359 ) ) ( not ( = ?auto_150358 ?auto_150360 ) ) ( not ( = ?auto_150358 ?auto_150361 ) ) ( not ( = ?auto_150358 ?auto_150362 ) ) ( not ( = ?auto_150359 ?auto_150360 ) ) ( not ( = ?auto_150359 ?auto_150361 ) ) ( not ( = ?auto_150359 ?auto_150362 ) ) ( not ( = ?auto_150360 ?auto_150361 ) ) ( not ( = ?auto_150360 ?auto_150362 ) ) ( not ( = ?auto_150361 ?auto_150362 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150361 ?auto_150362 )
      ( !STACK ?auto_150361 ?auto_150360 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_150369 - BLOCK
      ?auto_150370 - BLOCK
      ?auto_150371 - BLOCK
      ?auto_150372 - BLOCK
      ?auto_150373 - BLOCK
      ?auto_150374 - BLOCK
    )
    :vars
    (
      ?auto_150375 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_150373 ) ( ON ?auto_150374 ?auto_150375 ) ( CLEAR ?auto_150374 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150369 ) ( ON ?auto_150370 ?auto_150369 ) ( ON ?auto_150371 ?auto_150370 ) ( ON ?auto_150372 ?auto_150371 ) ( ON ?auto_150373 ?auto_150372 ) ( not ( = ?auto_150369 ?auto_150370 ) ) ( not ( = ?auto_150369 ?auto_150371 ) ) ( not ( = ?auto_150369 ?auto_150372 ) ) ( not ( = ?auto_150369 ?auto_150373 ) ) ( not ( = ?auto_150369 ?auto_150374 ) ) ( not ( = ?auto_150369 ?auto_150375 ) ) ( not ( = ?auto_150370 ?auto_150371 ) ) ( not ( = ?auto_150370 ?auto_150372 ) ) ( not ( = ?auto_150370 ?auto_150373 ) ) ( not ( = ?auto_150370 ?auto_150374 ) ) ( not ( = ?auto_150370 ?auto_150375 ) ) ( not ( = ?auto_150371 ?auto_150372 ) ) ( not ( = ?auto_150371 ?auto_150373 ) ) ( not ( = ?auto_150371 ?auto_150374 ) ) ( not ( = ?auto_150371 ?auto_150375 ) ) ( not ( = ?auto_150372 ?auto_150373 ) ) ( not ( = ?auto_150372 ?auto_150374 ) ) ( not ( = ?auto_150372 ?auto_150375 ) ) ( not ( = ?auto_150373 ?auto_150374 ) ) ( not ( = ?auto_150373 ?auto_150375 ) ) ( not ( = ?auto_150374 ?auto_150375 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150374 ?auto_150375 )
      ( !STACK ?auto_150374 ?auto_150373 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_150382 - BLOCK
      ?auto_150383 - BLOCK
      ?auto_150384 - BLOCK
      ?auto_150385 - BLOCK
      ?auto_150386 - BLOCK
      ?auto_150387 - BLOCK
    )
    :vars
    (
      ?auto_150388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150387 ?auto_150388 ) ( ON-TABLE ?auto_150382 ) ( ON ?auto_150383 ?auto_150382 ) ( ON ?auto_150384 ?auto_150383 ) ( ON ?auto_150385 ?auto_150384 ) ( not ( = ?auto_150382 ?auto_150383 ) ) ( not ( = ?auto_150382 ?auto_150384 ) ) ( not ( = ?auto_150382 ?auto_150385 ) ) ( not ( = ?auto_150382 ?auto_150386 ) ) ( not ( = ?auto_150382 ?auto_150387 ) ) ( not ( = ?auto_150382 ?auto_150388 ) ) ( not ( = ?auto_150383 ?auto_150384 ) ) ( not ( = ?auto_150383 ?auto_150385 ) ) ( not ( = ?auto_150383 ?auto_150386 ) ) ( not ( = ?auto_150383 ?auto_150387 ) ) ( not ( = ?auto_150383 ?auto_150388 ) ) ( not ( = ?auto_150384 ?auto_150385 ) ) ( not ( = ?auto_150384 ?auto_150386 ) ) ( not ( = ?auto_150384 ?auto_150387 ) ) ( not ( = ?auto_150384 ?auto_150388 ) ) ( not ( = ?auto_150385 ?auto_150386 ) ) ( not ( = ?auto_150385 ?auto_150387 ) ) ( not ( = ?auto_150385 ?auto_150388 ) ) ( not ( = ?auto_150386 ?auto_150387 ) ) ( not ( = ?auto_150386 ?auto_150388 ) ) ( not ( = ?auto_150387 ?auto_150388 ) ) ( CLEAR ?auto_150385 ) ( ON ?auto_150386 ?auto_150387 ) ( CLEAR ?auto_150386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150382 ?auto_150383 ?auto_150384 ?auto_150385 ?auto_150386 )
      ( MAKE-6PILE ?auto_150382 ?auto_150383 ?auto_150384 ?auto_150385 ?auto_150386 ?auto_150387 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_150395 - BLOCK
      ?auto_150396 - BLOCK
      ?auto_150397 - BLOCK
      ?auto_150398 - BLOCK
      ?auto_150399 - BLOCK
      ?auto_150400 - BLOCK
    )
    :vars
    (
      ?auto_150401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150400 ?auto_150401 ) ( ON-TABLE ?auto_150395 ) ( ON ?auto_150396 ?auto_150395 ) ( ON ?auto_150397 ?auto_150396 ) ( ON ?auto_150398 ?auto_150397 ) ( not ( = ?auto_150395 ?auto_150396 ) ) ( not ( = ?auto_150395 ?auto_150397 ) ) ( not ( = ?auto_150395 ?auto_150398 ) ) ( not ( = ?auto_150395 ?auto_150399 ) ) ( not ( = ?auto_150395 ?auto_150400 ) ) ( not ( = ?auto_150395 ?auto_150401 ) ) ( not ( = ?auto_150396 ?auto_150397 ) ) ( not ( = ?auto_150396 ?auto_150398 ) ) ( not ( = ?auto_150396 ?auto_150399 ) ) ( not ( = ?auto_150396 ?auto_150400 ) ) ( not ( = ?auto_150396 ?auto_150401 ) ) ( not ( = ?auto_150397 ?auto_150398 ) ) ( not ( = ?auto_150397 ?auto_150399 ) ) ( not ( = ?auto_150397 ?auto_150400 ) ) ( not ( = ?auto_150397 ?auto_150401 ) ) ( not ( = ?auto_150398 ?auto_150399 ) ) ( not ( = ?auto_150398 ?auto_150400 ) ) ( not ( = ?auto_150398 ?auto_150401 ) ) ( not ( = ?auto_150399 ?auto_150400 ) ) ( not ( = ?auto_150399 ?auto_150401 ) ) ( not ( = ?auto_150400 ?auto_150401 ) ) ( CLEAR ?auto_150398 ) ( ON ?auto_150399 ?auto_150400 ) ( CLEAR ?auto_150399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150395 ?auto_150396 ?auto_150397 ?auto_150398 ?auto_150399 )
      ( MAKE-6PILE ?auto_150395 ?auto_150396 ?auto_150397 ?auto_150398 ?auto_150399 ?auto_150400 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_150408 - BLOCK
      ?auto_150409 - BLOCK
      ?auto_150410 - BLOCK
      ?auto_150411 - BLOCK
      ?auto_150412 - BLOCK
      ?auto_150413 - BLOCK
    )
    :vars
    (
      ?auto_150414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150413 ?auto_150414 ) ( ON-TABLE ?auto_150408 ) ( ON ?auto_150409 ?auto_150408 ) ( ON ?auto_150410 ?auto_150409 ) ( not ( = ?auto_150408 ?auto_150409 ) ) ( not ( = ?auto_150408 ?auto_150410 ) ) ( not ( = ?auto_150408 ?auto_150411 ) ) ( not ( = ?auto_150408 ?auto_150412 ) ) ( not ( = ?auto_150408 ?auto_150413 ) ) ( not ( = ?auto_150408 ?auto_150414 ) ) ( not ( = ?auto_150409 ?auto_150410 ) ) ( not ( = ?auto_150409 ?auto_150411 ) ) ( not ( = ?auto_150409 ?auto_150412 ) ) ( not ( = ?auto_150409 ?auto_150413 ) ) ( not ( = ?auto_150409 ?auto_150414 ) ) ( not ( = ?auto_150410 ?auto_150411 ) ) ( not ( = ?auto_150410 ?auto_150412 ) ) ( not ( = ?auto_150410 ?auto_150413 ) ) ( not ( = ?auto_150410 ?auto_150414 ) ) ( not ( = ?auto_150411 ?auto_150412 ) ) ( not ( = ?auto_150411 ?auto_150413 ) ) ( not ( = ?auto_150411 ?auto_150414 ) ) ( not ( = ?auto_150412 ?auto_150413 ) ) ( not ( = ?auto_150412 ?auto_150414 ) ) ( not ( = ?auto_150413 ?auto_150414 ) ) ( ON ?auto_150412 ?auto_150413 ) ( CLEAR ?auto_150410 ) ( ON ?auto_150411 ?auto_150412 ) ( CLEAR ?auto_150411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150408 ?auto_150409 ?auto_150410 ?auto_150411 )
      ( MAKE-6PILE ?auto_150408 ?auto_150409 ?auto_150410 ?auto_150411 ?auto_150412 ?auto_150413 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_150421 - BLOCK
      ?auto_150422 - BLOCK
      ?auto_150423 - BLOCK
      ?auto_150424 - BLOCK
      ?auto_150425 - BLOCK
      ?auto_150426 - BLOCK
    )
    :vars
    (
      ?auto_150427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150426 ?auto_150427 ) ( ON-TABLE ?auto_150421 ) ( ON ?auto_150422 ?auto_150421 ) ( ON ?auto_150423 ?auto_150422 ) ( not ( = ?auto_150421 ?auto_150422 ) ) ( not ( = ?auto_150421 ?auto_150423 ) ) ( not ( = ?auto_150421 ?auto_150424 ) ) ( not ( = ?auto_150421 ?auto_150425 ) ) ( not ( = ?auto_150421 ?auto_150426 ) ) ( not ( = ?auto_150421 ?auto_150427 ) ) ( not ( = ?auto_150422 ?auto_150423 ) ) ( not ( = ?auto_150422 ?auto_150424 ) ) ( not ( = ?auto_150422 ?auto_150425 ) ) ( not ( = ?auto_150422 ?auto_150426 ) ) ( not ( = ?auto_150422 ?auto_150427 ) ) ( not ( = ?auto_150423 ?auto_150424 ) ) ( not ( = ?auto_150423 ?auto_150425 ) ) ( not ( = ?auto_150423 ?auto_150426 ) ) ( not ( = ?auto_150423 ?auto_150427 ) ) ( not ( = ?auto_150424 ?auto_150425 ) ) ( not ( = ?auto_150424 ?auto_150426 ) ) ( not ( = ?auto_150424 ?auto_150427 ) ) ( not ( = ?auto_150425 ?auto_150426 ) ) ( not ( = ?auto_150425 ?auto_150427 ) ) ( not ( = ?auto_150426 ?auto_150427 ) ) ( ON ?auto_150425 ?auto_150426 ) ( CLEAR ?auto_150423 ) ( ON ?auto_150424 ?auto_150425 ) ( CLEAR ?auto_150424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150421 ?auto_150422 ?auto_150423 ?auto_150424 )
      ( MAKE-6PILE ?auto_150421 ?auto_150422 ?auto_150423 ?auto_150424 ?auto_150425 ?auto_150426 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_150434 - BLOCK
      ?auto_150435 - BLOCK
      ?auto_150436 - BLOCK
      ?auto_150437 - BLOCK
      ?auto_150438 - BLOCK
      ?auto_150439 - BLOCK
    )
    :vars
    (
      ?auto_150440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150439 ?auto_150440 ) ( ON-TABLE ?auto_150434 ) ( ON ?auto_150435 ?auto_150434 ) ( not ( = ?auto_150434 ?auto_150435 ) ) ( not ( = ?auto_150434 ?auto_150436 ) ) ( not ( = ?auto_150434 ?auto_150437 ) ) ( not ( = ?auto_150434 ?auto_150438 ) ) ( not ( = ?auto_150434 ?auto_150439 ) ) ( not ( = ?auto_150434 ?auto_150440 ) ) ( not ( = ?auto_150435 ?auto_150436 ) ) ( not ( = ?auto_150435 ?auto_150437 ) ) ( not ( = ?auto_150435 ?auto_150438 ) ) ( not ( = ?auto_150435 ?auto_150439 ) ) ( not ( = ?auto_150435 ?auto_150440 ) ) ( not ( = ?auto_150436 ?auto_150437 ) ) ( not ( = ?auto_150436 ?auto_150438 ) ) ( not ( = ?auto_150436 ?auto_150439 ) ) ( not ( = ?auto_150436 ?auto_150440 ) ) ( not ( = ?auto_150437 ?auto_150438 ) ) ( not ( = ?auto_150437 ?auto_150439 ) ) ( not ( = ?auto_150437 ?auto_150440 ) ) ( not ( = ?auto_150438 ?auto_150439 ) ) ( not ( = ?auto_150438 ?auto_150440 ) ) ( not ( = ?auto_150439 ?auto_150440 ) ) ( ON ?auto_150438 ?auto_150439 ) ( ON ?auto_150437 ?auto_150438 ) ( CLEAR ?auto_150435 ) ( ON ?auto_150436 ?auto_150437 ) ( CLEAR ?auto_150436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150434 ?auto_150435 ?auto_150436 )
      ( MAKE-6PILE ?auto_150434 ?auto_150435 ?auto_150436 ?auto_150437 ?auto_150438 ?auto_150439 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_150447 - BLOCK
      ?auto_150448 - BLOCK
      ?auto_150449 - BLOCK
      ?auto_150450 - BLOCK
      ?auto_150451 - BLOCK
      ?auto_150452 - BLOCK
    )
    :vars
    (
      ?auto_150453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150452 ?auto_150453 ) ( ON-TABLE ?auto_150447 ) ( ON ?auto_150448 ?auto_150447 ) ( not ( = ?auto_150447 ?auto_150448 ) ) ( not ( = ?auto_150447 ?auto_150449 ) ) ( not ( = ?auto_150447 ?auto_150450 ) ) ( not ( = ?auto_150447 ?auto_150451 ) ) ( not ( = ?auto_150447 ?auto_150452 ) ) ( not ( = ?auto_150447 ?auto_150453 ) ) ( not ( = ?auto_150448 ?auto_150449 ) ) ( not ( = ?auto_150448 ?auto_150450 ) ) ( not ( = ?auto_150448 ?auto_150451 ) ) ( not ( = ?auto_150448 ?auto_150452 ) ) ( not ( = ?auto_150448 ?auto_150453 ) ) ( not ( = ?auto_150449 ?auto_150450 ) ) ( not ( = ?auto_150449 ?auto_150451 ) ) ( not ( = ?auto_150449 ?auto_150452 ) ) ( not ( = ?auto_150449 ?auto_150453 ) ) ( not ( = ?auto_150450 ?auto_150451 ) ) ( not ( = ?auto_150450 ?auto_150452 ) ) ( not ( = ?auto_150450 ?auto_150453 ) ) ( not ( = ?auto_150451 ?auto_150452 ) ) ( not ( = ?auto_150451 ?auto_150453 ) ) ( not ( = ?auto_150452 ?auto_150453 ) ) ( ON ?auto_150451 ?auto_150452 ) ( ON ?auto_150450 ?auto_150451 ) ( CLEAR ?auto_150448 ) ( ON ?auto_150449 ?auto_150450 ) ( CLEAR ?auto_150449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150447 ?auto_150448 ?auto_150449 )
      ( MAKE-6PILE ?auto_150447 ?auto_150448 ?auto_150449 ?auto_150450 ?auto_150451 ?auto_150452 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_150460 - BLOCK
      ?auto_150461 - BLOCK
      ?auto_150462 - BLOCK
      ?auto_150463 - BLOCK
      ?auto_150464 - BLOCK
      ?auto_150465 - BLOCK
    )
    :vars
    (
      ?auto_150466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150465 ?auto_150466 ) ( ON-TABLE ?auto_150460 ) ( not ( = ?auto_150460 ?auto_150461 ) ) ( not ( = ?auto_150460 ?auto_150462 ) ) ( not ( = ?auto_150460 ?auto_150463 ) ) ( not ( = ?auto_150460 ?auto_150464 ) ) ( not ( = ?auto_150460 ?auto_150465 ) ) ( not ( = ?auto_150460 ?auto_150466 ) ) ( not ( = ?auto_150461 ?auto_150462 ) ) ( not ( = ?auto_150461 ?auto_150463 ) ) ( not ( = ?auto_150461 ?auto_150464 ) ) ( not ( = ?auto_150461 ?auto_150465 ) ) ( not ( = ?auto_150461 ?auto_150466 ) ) ( not ( = ?auto_150462 ?auto_150463 ) ) ( not ( = ?auto_150462 ?auto_150464 ) ) ( not ( = ?auto_150462 ?auto_150465 ) ) ( not ( = ?auto_150462 ?auto_150466 ) ) ( not ( = ?auto_150463 ?auto_150464 ) ) ( not ( = ?auto_150463 ?auto_150465 ) ) ( not ( = ?auto_150463 ?auto_150466 ) ) ( not ( = ?auto_150464 ?auto_150465 ) ) ( not ( = ?auto_150464 ?auto_150466 ) ) ( not ( = ?auto_150465 ?auto_150466 ) ) ( ON ?auto_150464 ?auto_150465 ) ( ON ?auto_150463 ?auto_150464 ) ( ON ?auto_150462 ?auto_150463 ) ( CLEAR ?auto_150460 ) ( ON ?auto_150461 ?auto_150462 ) ( CLEAR ?auto_150461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150460 ?auto_150461 )
      ( MAKE-6PILE ?auto_150460 ?auto_150461 ?auto_150462 ?auto_150463 ?auto_150464 ?auto_150465 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_150473 - BLOCK
      ?auto_150474 - BLOCK
      ?auto_150475 - BLOCK
      ?auto_150476 - BLOCK
      ?auto_150477 - BLOCK
      ?auto_150478 - BLOCK
    )
    :vars
    (
      ?auto_150479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150478 ?auto_150479 ) ( ON-TABLE ?auto_150473 ) ( not ( = ?auto_150473 ?auto_150474 ) ) ( not ( = ?auto_150473 ?auto_150475 ) ) ( not ( = ?auto_150473 ?auto_150476 ) ) ( not ( = ?auto_150473 ?auto_150477 ) ) ( not ( = ?auto_150473 ?auto_150478 ) ) ( not ( = ?auto_150473 ?auto_150479 ) ) ( not ( = ?auto_150474 ?auto_150475 ) ) ( not ( = ?auto_150474 ?auto_150476 ) ) ( not ( = ?auto_150474 ?auto_150477 ) ) ( not ( = ?auto_150474 ?auto_150478 ) ) ( not ( = ?auto_150474 ?auto_150479 ) ) ( not ( = ?auto_150475 ?auto_150476 ) ) ( not ( = ?auto_150475 ?auto_150477 ) ) ( not ( = ?auto_150475 ?auto_150478 ) ) ( not ( = ?auto_150475 ?auto_150479 ) ) ( not ( = ?auto_150476 ?auto_150477 ) ) ( not ( = ?auto_150476 ?auto_150478 ) ) ( not ( = ?auto_150476 ?auto_150479 ) ) ( not ( = ?auto_150477 ?auto_150478 ) ) ( not ( = ?auto_150477 ?auto_150479 ) ) ( not ( = ?auto_150478 ?auto_150479 ) ) ( ON ?auto_150477 ?auto_150478 ) ( ON ?auto_150476 ?auto_150477 ) ( ON ?auto_150475 ?auto_150476 ) ( CLEAR ?auto_150473 ) ( ON ?auto_150474 ?auto_150475 ) ( CLEAR ?auto_150474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150473 ?auto_150474 )
      ( MAKE-6PILE ?auto_150473 ?auto_150474 ?auto_150475 ?auto_150476 ?auto_150477 ?auto_150478 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_150486 - BLOCK
      ?auto_150487 - BLOCK
      ?auto_150488 - BLOCK
      ?auto_150489 - BLOCK
      ?auto_150490 - BLOCK
      ?auto_150491 - BLOCK
    )
    :vars
    (
      ?auto_150492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150491 ?auto_150492 ) ( not ( = ?auto_150486 ?auto_150487 ) ) ( not ( = ?auto_150486 ?auto_150488 ) ) ( not ( = ?auto_150486 ?auto_150489 ) ) ( not ( = ?auto_150486 ?auto_150490 ) ) ( not ( = ?auto_150486 ?auto_150491 ) ) ( not ( = ?auto_150486 ?auto_150492 ) ) ( not ( = ?auto_150487 ?auto_150488 ) ) ( not ( = ?auto_150487 ?auto_150489 ) ) ( not ( = ?auto_150487 ?auto_150490 ) ) ( not ( = ?auto_150487 ?auto_150491 ) ) ( not ( = ?auto_150487 ?auto_150492 ) ) ( not ( = ?auto_150488 ?auto_150489 ) ) ( not ( = ?auto_150488 ?auto_150490 ) ) ( not ( = ?auto_150488 ?auto_150491 ) ) ( not ( = ?auto_150488 ?auto_150492 ) ) ( not ( = ?auto_150489 ?auto_150490 ) ) ( not ( = ?auto_150489 ?auto_150491 ) ) ( not ( = ?auto_150489 ?auto_150492 ) ) ( not ( = ?auto_150490 ?auto_150491 ) ) ( not ( = ?auto_150490 ?auto_150492 ) ) ( not ( = ?auto_150491 ?auto_150492 ) ) ( ON ?auto_150490 ?auto_150491 ) ( ON ?auto_150489 ?auto_150490 ) ( ON ?auto_150488 ?auto_150489 ) ( ON ?auto_150487 ?auto_150488 ) ( ON ?auto_150486 ?auto_150487 ) ( CLEAR ?auto_150486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150486 )
      ( MAKE-6PILE ?auto_150486 ?auto_150487 ?auto_150488 ?auto_150489 ?auto_150490 ?auto_150491 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_150499 - BLOCK
      ?auto_150500 - BLOCK
      ?auto_150501 - BLOCK
      ?auto_150502 - BLOCK
      ?auto_150503 - BLOCK
      ?auto_150504 - BLOCK
    )
    :vars
    (
      ?auto_150505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150504 ?auto_150505 ) ( not ( = ?auto_150499 ?auto_150500 ) ) ( not ( = ?auto_150499 ?auto_150501 ) ) ( not ( = ?auto_150499 ?auto_150502 ) ) ( not ( = ?auto_150499 ?auto_150503 ) ) ( not ( = ?auto_150499 ?auto_150504 ) ) ( not ( = ?auto_150499 ?auto_150505 ) ) ( not ( = ?auto_150500 ?auto_150501 ) ) ( not ( = ?auto_150500 ?auto_150502 ) ) ( not ( = ?auto_150500 ?auto_150503 ) ) ( not ( = ?auto_150500 ?auto_150504 ) ) ( not ( = ?auto_150500 ?auto_150505 ) ) ( not ( = ?auto_150501 ?auto_150502 ) ) ( not ( = ?auto_150501 ?auto_150503 ) ) ( not ( = ?auto_150501 ?auto_150504 ) ) ( not ( = ?auto_150501 ?auto_150505 ) ) ( not ( = ?auto_150502 ?auto_150503 ) ) ( not ( = ?auto_150502 ?auto_150504 ) ) ( not ( = ?auto_150502 ?auto_150505 ) ) ( not ( = ?auto_150503 ?auto_150504 ) ) ( not ( = ?auto_150503 ?auto_150505 ) ) ( not ( = ?auto_150504 ?auto_150505 ) ) ( ON ?auto_150503 ?auto_150504 ) ( ON ?auto_150502 ?auto_150503 ) ( ON ?auto_150501 ?auto_150502 ) ( ON ?auto_150500 ?auto_150501 ) ( ON ?auto_150499 ?auto_150500 ) ( CLEAR ?auto_150499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150499 )
      ( MAKE-6PILE ?auto_150499 ?auto_150500 ?auto_150501 ?auto_150502 ?auto_150503 ?auto_150504 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150513 - BLOCK
      ?auto_150514 - BLOCK
      ?auto_150515 - BLOCK
      ?auto_150516 - BLOCK
      ?auto_150517 - BLOCK
      ?auto_150518 - BLOCK
      ?auto_150519 - BLOCK
    )
    :vars
    (
      ?auto_150520 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_150518 ) ( ON ?auto_150519 ?auto_150520 ) ( CLEAR ?auto_150519 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150513 ) ( ON ?auto_150514 ?auto_150513 ) ( ON ?auto_150515 ?auto_150514 ) ( ON ?auto_150516 ?auto_150515 ) ( ON ?auto_150517 ?auto_150516 ) ( ON ?auto_150518 ?auto_150517 ) ( not ( = ?auto_150513 ?auto_150514 ) ) ( not ( = ?auto_150513 ?auto_150515 ) ) ( not ( = ?auto_150513 ?auto_150516 ) ) ( not ( = ?auto_150513 ?auto_150517 ) ) ( not ( = ?auto_150513 ?auto_150518 ) ) ( not ( = ?auto_150513 ?auto_150519 ) ) ( not ( = ?auto_150513 ?auto_150520 ) ) ( not ( = ?auto_150514 ?auto_150515 ) ) ( not ( = ?auto_150514 ?auto_150516 ) ) ( not ( = ?auto_150514 ?auto_150517 ) ) ( not ( = ?auto_150514 ?auto_150518 ) ) ( not ( = ?auto_150514 ?auto_150519 ) ) ( not ( = ?auto_150514 ?auto_150520 ) ) ( not ( = ?auto_150515 ?auto_150516 ) ) ( not ( = ?auto_150515 ?auto_150517 ) ) ( not ( = ?auto_150515 ?auto_150518 ) ) ( not ( = ?auto_150515 ?auto_150519 ) ) ( not ( = ?auto_150515 ?auto_150520 ) ) ( not ( = ?auto_150516 ?auto_150517 ) ) ( not ( = ?auto_150516 ?auto_150518 ) ) ( not ( = ?auto_150516 ?auto_150519 ) ) ( not ( = ?auto_150516 ?auto_150520 ) ) ( not ( = ?auto_150517 ?auto_150518 ) ) ( not ( = ?auto_150517 ?auto_150519 ) ) ( not ( = ?auto_150517 ?auto_150520 ) ) ( not ( = ?auto_150518 ?auto_150519 ) ) ( not ( = ?auto_150518 ?auto_150520 ) ) ( not ( = ?auto_150519 ?auto_150520 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150519 ?auto_150520 )
      ( !STACK ?auto_150519 ?auto_150518 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150528 - BLOCK
      ?auto_150529 - BLOCK
      ?auto_150530 - BLOCK
      ?auto_150531 - BLOCK
      ?auto_150532 - BLOCK
      ?auto_150533 - BLOCK
      ?auto_150534 - BLOCK
    )
    :vars
    (
      ?auto_150535 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_150533 ) ( ON ?auto_150534 ?auto_150535 ) ( CLEAR ?auto_150534 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150528 ) ( ON ?auto_150529 ?auto_150528 ) ( ON ?auto_150530 ?auto_150529 ) ( ON ?auto_150531 ?auto_150530 ) ( ON ?auto_150532 ?auto_150531 ) ( ON ?auto_150533 ?auto_150532 ) ( not ( = ?auto_150528 ?auto_150529 ) ) ( not ( = ?auto_150528 ?auto_150530 ) ) ( not ( = ?auto_150528 ?auto_150531 ) ) ( not ( = ?auto_150528 ?auto_150532 ) ) ( not ( = ?auto_150528 ?auto_150533 ) ) ( not ( = ?auto_150528 ?auto_150534 ) ) ( not ( = ?auto_150528 ?auto_150535 ) ) ( not ( = ?auto_150529 ?auto_150530 ) ) ( not ( = ?auto_150529 ?auto_150531 ) ) ( not ( = ?auto_150529 ?auto_150532 ) ) ( not ( = ?auto_150529 ?auto_150533 ) ) ( not ( = ?auto_150529 ?auto_150534 ) ) ( not ( = ?auto_150529 ?auto_150535 ) ) ( not ( = ?auto_150530 ?auto_150531 ) ) ( not ( = ?auto_150530 ?auto_150532 ) ) ( not ( = ?auto_150530 ?auto_150533 ) ) ( not ( = ?auto_150530 ?auto_150534 ) ) ( not ( = ?auto_150530 ?auto_150535 ) ) ( not ( = ?auto_150531 ?auto_150532 ) ) ( not ( = ?auto_150531 ?auto_150533 ) ) ( not ( = ?auto_150531 ?auto_150534 ) ) ( not ( = ?auto_150531 ?auto_150535 ) ) ( not ( = ?auto_150532 ?auto_150533 ) ) ( not ( = ?auto_150532 ?auto_150534 ) ) ( not ( = ?auto_150532 ?auto_150535 ) ) ( not ( = ?auto_150533 ?auto_150534 ) ) ( not ( = ?auto_150533 ?auto_150535 ) ) ( not ( = ?auto_150534 ?auto_150535 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150534 ?auto_150535 )
      ( !STACK ?auto_150534 ?auto_150533 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150543 - BLOCK
      ?auto_150544 - BLOCK
      ?auto_150545 - BLOCK
      ?auto_150546 - BLOCK
      ?auto_150547 - BLOCK
      ?auto_150548 - BLOCK
      ?auto_150549 - BLOCK
    )
    :vars
    (
      ?auto_150550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150549 ?auto_150550 ) ( ON-TABLE ?auto_150543 ) ( ON ?auto_150544 ?auto_150543 ) ( ON ?auto_150545 ?auto_150544 ) ( ON ?auto_150546 ?auto_150545 ) ( ON ?auto_150547 ?auto_150546 ) ( not ( = ?auto_150543 ?auto_150544 ) ) ( not ( = ?auto_150543 ?auto_150545 ) ) ( not ( = ?auto_150543 ?auto_150546 ) ) ( not ( = ?auto_150543 ?auto_150547 ) ) ( not ( = ?auto_150543 ?auto_150548 ) ) ( not ( = ?auto_150543 ?auto_150549 ) ) ( not ( = ?auto_150543 ?auto_150550 ) ) ( not ( = ?auto_150544 ?auto_150545 ) ) ( not ( = ?auto_150544 ?auto_150546 ) ) ( not ( = ?auto_150544 ?auto_150547 ) ) ( not ( = ?auto_150544 ?auto_150548 ) ) ( not ( = ?auto_150544 ?auto_150549 ) ) ( not ( = ?auto_150544 ?auto_150550 ) ) ( not ( = ?auto_150545 ?auto_150546 ) ) ( not ( = ?auto_150545 ?auto_150547 ) ) ( not ( = ?auto_150545 ?auto_150548 ) ) ( not ( = ?auto_150545 ?auto_150549 ) ) ( not ( = ?auto_150545 ?auto_150550 ) ) ( not ( = ?auto_150546 ?auto_150547 ) ) ( not ( = ?auto_150546 ?auto_150548 ) ) ( not ( = ?auto_150546 ?auto_150549 ) ) ( not ( = ?auto_150546 ?auto_150550 ) ) ( not ( = ?auto_150547 ?auto_150548 ) ) ( not ( = ?auto_150547 ?auto_150549 ) ) ( not ( = ?auto_150547 ?auto_150550 ) ) ( not ( = ?auto_150548 ?auto_150549 ) ) ( not ( = ?auto_150548 ?auto_150550 ) ) ( not ( = ?auto_150549 ?auto_150550 ) ) ( CLEAR ?auto_150547 ) ( ON ?auto_150548 ?auto_150549 ) ( CLEAR ?auto_150548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150543 ?auto_150544 ?auto_150545 ?auto_150546 ?auto_150547 ?auto_150548 )
      ( MAKE-7PILE ?auto_150543 ?auto_150544 ?auto_150545 ?auto_150546 ?auto_150547 ?auto_150548 ?auto_150549 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150558 - BLOCK
      ?auto_150559 - BLOCK
      ?auto_150560 - BLOCK
      ?auto_150561 - BLOCK
      ?auto_150562 - BLOCK
      ?auto_150563 - BLOCK
      ?auto_150564 - BLOCK
    )
    :vars
    (
      ?auto_150565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150564 ?auto_150565 ) ( ON-TABLE ?auto_150558 ) ( ON ?auto_150559 ?auto_150558 ) ( ON ?auto_150560 ?auto_150559 ) ( ON ?auto_150561 ?auto_150560 ) ( ON ?auto_150562 ?auto_150561 ) ( not ( = ?auto_150558 ?auto_150559 ) ) ( not ( = ?auto_150558 ?auto_150560 ) ) ( not ( = ?auto_150558 ?auto_150561 ) ) ( not ( = ?auto_150558 ?auto_150562 ) ) ( not ( = ?auto_150558 ?auto_150563 ) ) ( not ( = ?auto_150558 ?auto_150564 ) ) ( not ( = ?auto_150558 ?auto_150565 ) ) ( not ( = ?auto_150559 ?auto_150560 ) ) ( not ( = ?auto_150559 ?auto_150561 ) ) ( not ( = ?auto_150559 ?auto_150562 ) ) ( not ( = ?auto_150559 ?auto_150563 ) ) ( not ( = ?auto_150559 ?auto_150564 ) ) ( not ( = ?auto_150559 ?auto_150565 ) ) ( not ( = ?auto_150560 ?auto_150561 ) ) ( not ( = ?auto_150560 ?auto_150562 ) ) ( not ( = ?auto_150560 ?auto_150563 ) ) ( not ( = ?auto_150560 ?auto_150564 ) ) ( not ( = ?auto_150560 ?auto_150565 ) ) ( not ( = ?auto_150561 ?auto_150562 ) ) ( not ( = ?auto_150561 ?auto_150563 ) ) ( not ( = ?auto_150561 ?auto_150564 ) ) ( not ( = ?auto_150561 ?auto_150565 ) ) ( not ( = ?auto_150562 ?auto_150563 ) ) ( not ( = ?auto_150562 ?auto_150564 ) ) ( not ( = ?auto_150562 ?auto_150565 ) ) ( not ( = ?auto_150563 ?auto_150564 ) ) ( not ( = ?auto_150563 ?auto_150565 ) ) ( not ( = ?auto_150564 ?auto_150565 ) ) ( CLEAR ?auto_150562 ) ( ON ?auto_150563 ?auto_150564 ) ( CLEAR ?auto_150563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150558 ?auto_150559 ?auto_150560 ?auto_150561 ?auto_150562 ?auto_150563 )
      ( MAKE-7PILE ?auto_150558 ?auto_150559 ?auto_150560 ?auto_150561 ?auto_150562 ?auto_150563 ?auto_150564 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150573 - BLOCK
      ?auto_150574 - BLOCK
      ?auto_150575 - BLOCK
      ?auto_150576 - BLOCK
      ?auto_150577 - BLOCK
      ?auto_150578 - BLOCK
      ?auto_150579 - BLOCK
    )
    :vars
    (
      ?auto_150580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150579 ?auto_150580 ) ( ON-TABLE ?auto_150573 ) ( ON ?auto_150574 ?auto_150573 ) ( ON ?auto_150575 ?auto_150574 ) ( ON ?auto_150576 ?auto_150575 ) ( not ( = ?auto_150573 ?auto_150574 ) ) ( not ( = ?auto_150573 ?auto_150575 ) ) ( not ( = ?auto_150573 ?auto_150576 ) ) ( not ( = ?auto_150573 ?auto_150577 ) ) ( not ( = ?auto_150573 ?auto_150578 ) ) ( not ( = ?auto_150573 ?auto_150579 ) ) ( not ( = ?auto_150573 ?auto_150580 ) ) ( not ( = ?auto_150574 ?auto_150575 ) ) ( not ( = ?auto_150574 ?auto_150576 ) ) ( not ( = ?auto_150574 ?auto_150577 ) ) ( not ( = ?auto_150574 ?auto_150578 ) ) ( not ( = ?auto_150574 ?auto_150579 ) ) ( not ( = ?auto_150574 ?auto_150580 ) ) ( not ( = ?auto_150575 ?auto_150576 ) ) ( not ( = ?auto_150575 ?auto_150577 ) ) ( not ( = ?auto_150575 ?auto_150578 ) ) ( not ( = ?auto_150575 ?auto_150579 ) ) ( not ( = ?auto_150575 ?auto_150580 ) ) ( not ( = ?auto_150576 ?auto_150577 ) ) ( not ( = ?auto_150576 ?auto_150578 ) ) ( not ( = ?auto_150576 ?auto_150579 ) ) ( not ( = ?auto_150576 ?auto_150580 ) ) ( not ( = ?auto_150577 ?auto_150578 ) ) ( not ( = ?auto_150577 ?auto_150579 ) ) ( not ( = ?auto_150577 ?auto_150580 ) ) ( not ( = ?auto_150578 ?auto_150579 ) ) ( not ( = ?auto_150578 ?auto_150580 ) ) ( not ( = ?auto_150579 ?auto_150580 ) ) ( ON ?auto_150578 ?auto_150579 ) ( CLEAR ?auto_150576 ) ( ON ?auto_150577 ?auto_150578 ) ( CLEAR ?auto_150577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150573 ?auto_150574 ?auto_150575 ?auto_150576 ?auto_150577 )
      ( MAKE-7PILE ?auto_150573 ?auto_150574 ?auto_150575 ?auto_150576 ?auto_150577 ?auto_150578 ?auto_150579 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150588 - BLOCK
      ?auto_150589 - BLOCK
      ?auto_150590 - BLOCK
      ?auto_150591 - BLOCK
      ?auto_150592 - BLOCK
      ?auto_150593 - BLOCK
      ?auto_150594 - BLOCK
    )
    :vars
    (
      ?auto_150595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150594 ?auto_150595 ) ( ON-TABLE ?auto_150588 ) ( ON ?auto_150589 ?auto_150588 ) ( ON ?auto_150590 ?auto_150589 ) ( ON ?auto_150591 ?auto_150590 ) ( not ( = ?auto_150588 ?auto_150589 ) ) ( not ( = ?auto_150588 ?auto_150590 ) ) ( not ( = ?auto_150588 ?auto_150591 ) ) ( not ( = ?auto_150588 ?auto_150592 ) ) ( not ( = ?auto_150588 ?auto_150593 ) ) ( not ( = ?auto_150588 ?auto_150594 ) ) ( not ( = ?auto_150588 ?auto_150595 ) ) ( not ( = ?auto_150589 ?auto_150590 ) ) ( not ( = ?auto_150589 ?auto_150591 ) ) ( not ( = ?auto_150589 ?auto_150592 ) ) ( not ( = ?auto_150589 ?auto_150593 ) ) ( not ( = ?auto_150589 ?auto_150594 ) ) ( not ( = ?auto_150589 ?auto_150595 ) ) ( not ( = ?auto_150590 ?auto_150591 ) ) ( not ( = ?auto_150590 ?auto_150592 ) ) ( not ( = ?auto_150590 ?auto_150593 ) ) ( not ( = ?auto_150590 ?auto_150594 ) ) ( not ( = ?auto_150590 ?auto_150595 ) ) ( not ( = ?auto_150591 ?auto_150592 ) ) ( not ( = ?auto_150591 ?auto_150593 ) ) ( not ( = ?auto_150591 ?auto_150594 ) ) ( not ( = ?auto_150591 ?auto_150595 ) ) ( not ( = ?auto_150592 ?auto_150593 ) ) ( not ( = ?auto_150592 ?auto_150594 ) ) ( not ( = ?auto_150592 ?auto_150595 ) ) ( not ( = ?auto_150593 ?auto_150594 ) ) ( not ( = ?auto_150593 ?auto_150595 ) ) ( not ( = ?auto_150594 ?auto_150595 ) ) ( ON ?auto_150593 ?auto_150594 ) ( CLEAR ?auto_150591 ) ( ON ?auto_150592 ?auto_150593 ) ( CLEAR ?auto_150592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150588 ?auto_150589 ?auto_150590 ?auto_150591 ?auto_150592 )
      ( MAKE-7PILE ?auto_150588 ?auto_150589 ?auto_150590 ?auto_150591 ?auto_150592 ?auto_150593 ?auto_150594 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150603 - BLOCK
      ?auto_150604 - BLOCK
      ?auto_150605 - BLOCK
      ?auto_150606 - BLOCK
      ?auto_150607 - BLOCK
      ?auto_150608 - BLOCK
      ?auto_150609 - BLOCK
    )
    :vars
    (
      ?auto_150610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150609 ?auto_150610 ) ( ON-TABLE ?auto_150603 ) ( ON ?auto_150604 ?auto_150603 ) ( ON ?auto_150605 ?auto_150604 ) ( not ( = ?auto_150603 ?auto_150604 ) ) ( not ( = ?auto_150603 ?auto_150605 ) ) ( not ( = ?auto_150603 ?auto_150606 ) ) ( not ( = ?auto_150603 ?auto_150607 ) ) ( not ( = ?auto_150603 ?auto_150608 ) ) ( not ( = ?auto_150603 ?auto_150609 ) ) ( not ( = ?auto_150603 ?auto_150610 ) ) ( not ( = ?auto_150604 ?auto_150605 ) ) ( not ( = ?auto_150604 ?auto_150606 ) ) ( not ( = ?auto_150604 ?auto_150607 ) ) ( not ( = ?auto_150604 ?auto_150608 ) ) ( not ( = ?auto_150604 ?auto_150609 ) ) ( not ( = ?auto_150604 ?auto_150610 ) ) ( not ( = ?auto_150605 ?auto_150606 ) ) ( not ( = ?auto_150605 ?auto_150607 ) ) ( not ( = ?auto_150605 ?auto_150608 ) ) ( not ( = ?auto_150605 ?auto_150609 ) ) ( not ( = ?auto_150605 ?auto_150610 ) ) ( not ( = ?auto_150606 ?auto_150607 ) ) ( not ( = ?auto_150606 ?auto_150608 ) ) ( not ( = ?auto_150606 ?auto_150609 ) ) ( not ( = ?auto_150606 ?auto_150610 ) ) ( not ( = ?auto_150607 ?auto_150608 ) ) ( not ( = ?auto_150607 ?auto_150609 ) ) ( not ( = ?auto_150607 ?auto_150610 ) ) ( not ( = ?auto_150608 ?auto_150609 ) ) ( not ( = ?auto_150608 ?auto_150610 ) ) ( not ( = ?auto_150609 ?auto_150610 ) ) ( ON ?auto_150608 ?auto_150609 ) ( ON ?auto_150607 ?auto_150608 ) ( CLEAR ?auto_150605 ) ( ON ?auto_150606 ?auto_150607 ) ( CLEAR ?auto_150606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150603 ?auto_150604 ?auto_150605 ?auto_150606 )
      ( MAKE-7PILE ?auto_150603 ?auto_150604 ?auto_150605 ?auto_150606 ?auto_150607 ?auto_150608 ?auto_150609 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150618 - BLOCK
      ?auto_150619 - BLOCK
      ?auto_150620 - BLOCK
      ?auto_150621 - BLOCK
      ?auto_150622 - BLOCK
      ?auto_150623 - BLOCK
      ?auto_150624 - BLOCK
    )
    :vars
    (
      ?auto_150625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150624 ?auto_150625 ) ( ON-TABLE ?auto_150618 ) ( ON ?auto_150619 ?auto_150618 ) ( ON ?auto_150620 ?auto_150619 ) ( not ( = ?auto_150618 ?auto_150619 ) ) ( not ( = ?auto_150618 ?auto_150620 ) ) ( not ( = ?auto_150618 ?auto_150621 ) ) ( not ( = ?auto_150618 ?auto_150622 ) ) ( not ( = ?auto_150618 ?auto_150623 ) ) ( not ( = ?auto_150618 ?auto_150624 ) ) ( not ( = ?auto_150618 ?auto_150625 ) ) ( not ( = ?auto_150619 ?auto_150620 ) ) ( not ( = ?auto_150619 ?auto_150621 ) ) ( not ( = ?auto_150619 ?auto_150622 ) ) ( not ( = ?auto_150619 ?auto_150623 ) ) ( not ( = ?auto_150619 ?auto_150624 ) ) ( not ( = ?auto_150619 ?auto_150625 ) ) ( not ( = ?auto_150620 ?auto_150621 ) ) ( not ( = ?auto_150620 ?auto_150622 ) ) ( not ( = ?auto_150620 ?auto_150623 ) ) ( not ( = ?auto_150620 ?auto_150624 ) ) ( not ( = ?auto_150620 ?auto_150625 ) ) ( not ( = ?auto_150621 ?auto_150622 ) ) ( not ( = ?auto_150621 ?auto_150623 ) ) ( not ( = ?auto_150621 ?auto_150624 ) ) ( not ( = ?auto_150621 ?auto_150625 ) ) ( not ( = ?auto_150622 ?auto_150623 ) ) ( not ( = ?auto_150622 ?auto_150624 ) ) ( not ( = ?auto_150622 ?auto_150625 ) ) ( not ( = ?auto_150623 ?auto_150624 ) ) ( not ( = ?auto_150623 ?auto_150625 ) ) ( not ( = ?auto_150624 ?auto_150625 ) ) ( ON ?auto_150623 ?auto_150624 ) ( ON ?auto_150622 ?auto_150623 ) ( CLEAR ?auto_150620 ) ( ON ?auto_150621 ?auto_150622 ) ( CLEAR ?auto_150621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150618 ?auto_150619 ?auto_150620 ?auto_150621 )
      ( MAKE-7PILE ?auto_150618 ?auto_150619 ?auto_150620 ?auto_150621 ?auto_150622 ?auto_150623 ?auto_150624 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150633 - BLOCK
      ?auto_150634 - BLOCK
      ?auto_150635 - BLOCK
      ?auto_150636 - BLOCK
      ?auto_150637 - BLOCK
      ?auto_150638 - BLOCK
      ?auto_150639 - BLOCK
    )
    :vars
    (
      ?auto_150640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150639 ?auto_150640 ) ( ON-TABLE ?auto_150633 ) ( ON ?auto_150634 ?auto_150633 ) ( not ( = ?auto_150633 ?auto_150634 ) ) ( not ( = ?auto_150633 ?auto_150635 ) ) ( not ( = ?auto_150633 ?auto_150636 ) ) ( not ( = ?auto_150633 ?auto_150637 ) ) ( not ( = ?auto_150633 ?auto_150638 ) ) ( not ( = ?auto_150633 ?auto_150639 ) ) ( not ( = ?auto_150633 ?auto_150640 ) ) ( not ( = ?auto_150634 ?auto_150635 ) ) ( not ( = ?auto_150634 ?auto_150636 ) ) ( not ( = ?auto_150634 ?auto_150637 ) ) ( not ( = ?auto_150634 ?auto_150638 ) ) ( not ( = ?auto_150634 ?auto_150639 ) ) ( not ( = ?auto_150634 ?auto_150640 ) ) ( not ( = ?auto_150635 ?auto_150636 ) ) ( not ( = ?auto_150635 ?auto_150637 ) ) ( not ( = ?auto_150635 ?auto_150638 ) ) ( not ( = ?auto_150635 ?auto_150639 ) ) ( not ( = ?auto_150635 ?auto_150640 ) ) ( not ( = ?auto_150636 ?auto_150637 ) ) ( not ( = ?auto_150636 ?auto_150638 ) ) ( not ( = ?auto_150636 ?auto_150639 ) ) ( not ( = ?auto_150636 ?auto_150640 ) ) ( not ( = ?auto_150637 ?auto_150638 ) ) ( not ( = ?auto_150637 ?auto_150639 ) ) ( not ( = ?auto_150637 ?auto_150640 ) ) ( not ( = ?auto_150638 ?auto_150639 ) ) ( not ( = ?auto_150638 ?auto_150640 ) ) ( not ( = ?auto_150639 ?auto_150640 ) ) ( ON ?auto_150638 ?auto_150639 ) ( ON ?auto_150637 ?auto_150638 ) ( ON ?auto_150636 ?auto_150637 ) ( CLEAR ?auto_150634 ) ( ON ?auto_150635 ?auto_150636 ) ( CLEAR ?auto_150635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150633 ?auto_150634 ?auto_150635 )
      ( MAKE-7PILE ?auto_150633 ?auto_150634 ?auto_150635 ?auto_150636 ?auto_150637 ?auto_150638 ?auto_150639 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150648 - BLOCK
      ?auto_150649 - BLOCK
      ?auto_150650 - BLOCK
      ?auto_150651 - BLOCK
      ?auto_150652 - BLOCK
      ?auto_150653 - BLOCK
      ?auto_150654 - BLOCK
    )
    :vars
    (
      ?auto_150655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150654 ?auto_150655 ) ( ON-TABLE ?auto_150648 ) ( ON ?auto_150649 ?auto_150648 ) ( not ( = ?auto_150648 ?auto_150649 ) ) ( not ( = ?auto_150648 ?auto_150650 ) ) ( not ( = ?auto_150648 ?auto_150651 ) ) ( not ( = ?auto_150648 ?auto_150652 ) ) ( not ( = ?auto_150648 ?auto_150653 ) ) ( not ( = ?auto_150648 ?auto_150654 ) ) ( not ( = ?auto_150648 ?auto_150655 ) ) ( not ( = ?auto_150649 ?auto_150650 ) ) ( not ( = ?auto_150649 ?auto_150651 ) ) ( not ( = ?auto_150649 ?auto_150652 ) ) ( not ( = ?auto_150649 ?auto_150653 ) ) ( not ( = ?auto_150649 ?auto_150654 ) ) ( not ( = ?auto_150649 ?auto_150655 ) ) ( not ( = ?auto_150650 ?auto_150651 ) ) ( not ( = ?auto_150650 ?auto_150652 ) ) ( not ( = ?auto_150650 ?auto_150653 ) ) ( not ( = ?auto_150650 ?auto_150654 ) ) ( not ( = ?auto_150650 ?auto_150655 ) ) ( not ( = ?auto_150651 ?auto_150652 ) ) ( not ( = ?auto_150651 ?auto_150653 ) ) ( not ( = ?auto_150651 ?auto_150654 ) ) ( not ( = ?auto_150651 ?auto_150655 ) ) ( not ( = ?auto_150652 ?auto_150653 ) ) ( not ( = ?auto_150652 ?auto_150654 ) ) ( not ( = ?auto_150652 ?auto_150655 ) ) ( not ( = ?auto_150653 ?auto_150654 ) ) ( not ( = ?auto_150653 ?auto_150655 ) ) ( not ( = ?auto_150654 ?auto_150655 ) ) ( ON ?auto_150653 ?auto_150654 ) ( ON ?auto_150652 ?auto_150653 ) ( ON ?auto_150651 ?auto_150652 ) ( CLEAR ?auto_150649 ) ( ON ?auto_150650 ?auto_150651 ) ( CLEAR ?auto_150650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150648 ?auto_150649 ?auto_150650 )
      ( MAKE-7PILE ?auto_150648 ?auto_150649 ?auto_150650 ?auto_150651 ?auto_150652 ?auto_150653 ?auto_150654 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150663 - BLOCK
      ?auto_150664 - BLOCK
      ?auto_150665 - BLOCK
      ?auto_150666 - BLOCK
      ?auto_150667 - BLOCK
      ?auto_150668 - BLOCK
      ?auto_150669 - BLOCK
    )
    :vars
    (
      ?auto_150670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150669 ?auto_150670 ) ( ON-TABLE ?auto_150663 ) ( not ( = ?auto_150663 ?auto_150664 ) ) ( not ( = ?auto_150663 ?auto_150665 ) ) ( not ( = ?auto_150663 ?auto_150666 ) ) ( not ( = ?auto_150663 ?auto_150667 ) ) ( not ( = ?auto_150663 ?auto_150668 ) ) ( not ( = ?auto_150663 ?auto_150669 ) ) ( not ( = ?auto_150663 ?auto_150670 ) ) ( not ( = ?auto_150664 ?auto_150665 ) ) ( not ( = ?auto_150664 ?auto_150666 ) ) ( not ( = ?auto_150664 ?auto_150667 ) ) ( not ( = ?auto_150664 ?auto_150668 ) ) ( not ( = ?auto_150664 ?auto_150669 ) ) ( not ( = ?auto_150664 ?auto_150670 ) ) ( not ( = ?auto_150665 ?auto_150666 ) ) ( not ( = ?auto_150665 ?auto_150667 ) ) ( not ( = ?auto_150665 ?auto_150668 ) ) ( not ( = ?auto_150665 ?auto_150669 ) ) ( not ( = ?auto_150665 ?auto_150670 ) ) ( not ( = ?auto_150666 ?auto_150667 ) ) ( not ( = ?auto_150666 ?auto_150668 ) ) ( not ( = ?auto_150666 ?auto_150669 ) ) ( not ( = ?auto_150666 ?auto_150670 ) ) ( not ( = ?auto_150667 ?auto_150668 ) ) ( not ( = ?auto_150667 ?auto_150669 ) ) ( not ( = ?auto_150667 ?auto_150670 ) ) ( not ( = ?auto_150668 ?auto_150669 ) ) ( not ( = ?auto_150668 ?auto_150670 ) ) ( not ( = ?auto_150669 ?auto_150670 ) ) ( ON ?auto_150668 ?auto_150669 ) ( ON ?auto_150667 ?auto_150668 ) ( ON ?auto_150666 ?auto_150667 ) ( ON ?auto_150665 ?auto_150666 ) ( CLEAR ?auto_150663 ) ( ON ?auto_150664 ?auto_150665 ) ( CLEAR ?auto_150664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150663 ?auto_150664 )
      ( MAKE-7PILE ?auto_150663 ?auto_150664 ?auto_150665 ?auto_150666 ?auto_150667 ?auto_150668 ?auto_150669 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150678 - BLOCK
      ?auto_150679 - BLOCK
      ?auto_150680 - BLOCK
      ?auto_150681 - BLOCK
      ?auto_150682 - BLOCK
      ?auto_150683 - BLOCK
      ?auto_150684 - BLOCK
    )
    :vars
    (
      ?auto_150685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150684 ?auto_150685 ) ( ON-TABLE ?auto_150678 ) ( not ( = ?auto_150678 ?auto_150679 ) ) ( not ( = ?auto_150678 ?auto_150680 ) ) ( not ( = ?auto_150678 ?auto_150681 ) ) ( not ( = ?auto_150678 ?auto_150682 ) ) ( not ( = ?auto_150678 ?auto_150683 ) ) ( not ( = ?auto_150678 ?auto_150684 ) ) ( not ( = ?auto_150678 ?auto_150685 ) ) ( not ( = ?auto_150679 ?auto_150680 ) ) ( not ( = ?auto_150679 ?auto_150681 ) ) ( not ( = ?auto_150679 ?auto_150682 ) ) ( not ( = ?auto_150679 ?auto_150683 ) ) ( not ( = ?auto_150679 ?auto_150684 ) ) ( not ( = ?auto_150679 ?auto_150685 ) ) ( not ( = ?auto_150680 ?auto_150681 ) ) ( not ( = ?auto_150680 ?auto_150682 ) ) ( not ( = ?auto_150680 ?auto_150683 ) ) ( not ( = ?auto_150680 ?auto_150684 ) ) ( not ( = ?auto_150680 ?auto_150685 ) ) ( not ( = ?auto_150681 ?auto_150682 ) ) ( not ( = ?auto_150681 ?auto_150683 ) ) ( not ( = ?auto_150681 ?auto_150684 ) ) ( not ( = ?auto_150681 ?auto_150685 ) ) ( not ( = ?auto_150682 ?auto_150683 ) ) ( not ( = ?auto_150682 ?auto_150684 ) ) ( not ( = ?auto_150682 ?auto_150685 ) ) ( not ( = ?auto_150683 ?auto_150684 ) ) ( not ( = ?auto_150683 ?auto_150685 ) ) ( not ( = ?auto_150684 ?auto_150685 ) ) ( ON ?auto_150683 ?auto_150684 ) ( ON ?auto_150682 ?auto_150683 ) ( ON ?auto_150681 ?auto_150682 ) ( ON ?auto_150680 ?auto_150681 ) ( CLEAR ?auto_150678 ) ( ON ?auto_150679 ?auto_150680 ) ( CLEAR ?auto_150679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150678 ?auto_150679 )
      ( MAKE-7PILE ?auto_150678 ?auto_150679 ?auto_150680 ?auto_150681 ?auto_150682 ?auto_150683 ?auto_150684 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150693 - BLOCK
      ?auto_150694 - BLOCK
      ?auto_150695 - BLOCK
      ?auto_150696 - BLOCK
      ?auto_150697 - BLOCK
      ?auto_150698 - BLOCK
      ?auto_150699 - BLOCK
    )
    :vars
    (
      ?auto_150700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150699 ?auto_150700 ) ( not ( = ?auto_150693 ?auto_150694 ) ) ( not ( = ?auto_150693 ?auto_150695 ) ) ( not ( = ?auto_150693 ?auto_150696 ) ) ( not ( = ?auto_150693 ?auto_150697 ) ) ( not ( = ?auto_150693 ?auto_150698 ) ) ( not ( = ?auto_150693 ?auto_150699 ) ) ( not ( = ?auto_150693 ?auto_150700 ) ) ( not ( = ?auto_150694 ?auto_150695 ) ) ( not ( = ?auto_150694 ?auto_150696 ) ) ( not ( = ?auto_150694 ?auto_150697 ) ) ( not ( = ?auto_150694 ?auto_150698 ) ) ( not ( = ?auto_150694 ?auto_150699 ) ) ( not ( = ?auto_150694 ?auto_150700 ) ) ( not ( = ?auto_150695 ?auto_150696 ) ) ( not ( = ?auto_150695 ?auto_150697 ) ) ( not ( = ?auto_150695 ?auto_150698 ) ) ( not ( = ?auto_150695 ?auto_150699 ) ) ( not ( = ?auto_150695 ?auto_150700 ) ) ( not ( = ?auto_150696 ?auto_150697 ) ) ( not ( = ?auto_150696 ?auto_150698 ) ) ( not ( = ?auto_150696 ?auto_150699 ) ) ( not ( = ?auto_150696 ?auto_150700 ) ) ( not ( = ?auto_150697 ?auto_150698 ) ) ( not ( = ?auto_150697 ?auto_150699 ) ) ( not ( = ?auto_150697 ?auto_150700 ) ) ( not ( = ?auto_150698 ?auto_150699 ) ) ( not ( = ?auto_150698 ?auto_150700 ) ) ( not ( = ?auto_150699 ?auto_150700 ) ) ( ON ?auto_150698 ?auto_150699 ) ( ON ?auto_150697 ?auto_150698 ) ( ON ?auto_150696 ?auto_150697 ) ( ON ?auto_150695 ?auto_150696 ) ( ON ?auto_150694 ?auto_150695 ) ( ON ?auto_150693 ?auto_150694 ) ( CLEAR ?auto_150693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150693 )
      ( MAKE-7PILE ?auto_150693 ?auto_150694 ?auto_150695 ?auto_150696 ?auto_150697 ?auto_150698 ?auto_150699 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150708 - BLOCK
      ?auto_150709 - BLOCK
      ?auto_150710 - BLOCK
      ?auto_150711 - BLOCK
      ?auto_150712 - BLOCK
      ?auto_150713 - BLOCK
      ?auto_150714 - BLOCK
    )
    :vars
    (
      ?auto_150715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150714 ?auto_150715 ) ( not ( = ?auto_150708 ?auto_150709 ) ) ( not ( = ?auto_150708 ?auto_150710 ) ) ( not ( = ?auto_150708 ?auto_150711 ) ) ( not ( = ?auto_150708 ?auto_150712 ) ) ( not ( = ?auto_150708 ?auto_150713 ) ) ( not ( = ?auto_150708 ?auto_150714 ) ) ( not ( = ?auto_150708 ?auto_150715 ) ) ( not ( = ?auto_150709 ?auto_150710 ) ) ( not ( = ?auto_150709 ?auto_150711 ) ) ( not ( = ?auto_150709 ?auto_150712 ) ) ( not ( = ?auto_150709 ?auto_150713 ) ) ( not ( = ?auto_150709 ?auto_150714 ) ) ( not ( = ?auto_150709 ?auto_150715 ) ) ( not ( = ?auto_150710 ?auto_150711 ) ) ( not ( = ?auto_150710 ?auto_150712 ) ) ( not ( = ?auto_150710 ?auto_150713 ) ) ( not ( = ?auto_150710 ?auto_150714 ) ) ( not ( = ?auto_150710 ?auto_150715 ) ) ( not ( = ?auto_150711 ?auto_150712 ) ) ( not ( = ?auto_150711 ?auto_150713 ) ) ( not ( = ?auto_150711 ?auto_150714 ) ) ( not ( = ?auto_150711 ?auto_150715 ) ) ( not ( = ?auto_150712 ?auto_150713 ) ) ( not ( = ?auto_150712 ?auto_150714 ) ) ( not ( = ?auto_150712 ?auto_150715 ) ) ( not ( = ?auto_150713 ?auto_150714 ) ) ( not ( = ?auto_150713 ?auto_150715 ) ) ( not ( = ?auto_150714 ?auto_150715 ) ) ( ON ?auto_150713 ?auto_150714 ) ( ON ?auto_150712 ?auto_150713 ) ( ON ?auto_150711 ?auto_150712 ) ( ON ?auto_150710 ?auto_150711 ) ( ON ?auto_150709 ?auto_150710 ) ( ON ?auto_150708 ?auto_150709 ) ( CLEAR ?auto_150708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150708 )
      ( MAKE-7PILE ?auto_150708 ?auto_150709 ?auto_150710 ?auto_150711 ?auto_150712 ?auto_150713 ?auto_150714 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150724 - BLOCK
      ?auto_150725 - BLOCK
      ?auto_150726 - BLOCK
      ?auto_150727 - BLOCK
      ?auto_150728 - BLOCK
      ?auto_150729 - BLOCK
      ?auto_150730 - BLOCK
      ?auto_150731 - BLOCK
    )
    :vars
    (
      ?auto_150732 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_150730 ) ( ON ?auto_150731 ?auto_150732 ) ( CLEAR ?auto_150731 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150724 ) ( ON ?auto_150725 ?auto_150724 ) ( ON ?auto_150726 ?auto_150725 ) ( ON ?auto_150727 ?auto_150726 ) ( ON ?auto_150728 ?auto_150727 ) ( ON ?auto_150729 ?auto_150728 ) ( ON ?auto_150730 ?auto_150729 ) ( not ( = ?auto_150724 ?auto_150725 ) ) ( not ( = ?auto_150724 ?auto_150726 ) ) ( not ( = ?auto_150724 ?auto_150727 ) ) ( not ( = ?auto_150724 ?auto_150728 ) ) ( not ( = ?auto_150724 ?auto_150729 ) ) ( not ( = ?auto_150724 ?auto_150730 ) ) ( not ( = ?auto_150724 ?auto_150731 ) ) ( not ( = ?auto_150724 ?auto_150732 ) ) ( not ( = ?auto_150725 ?auto_150726 ) ) ( not ( = ?auto_150725 ?auto_150727 ) ) ( not ( = ?auto_150725 ?auto_150728 ) ) ( not ( = ?auto_150725 ?auto_150729 ) ) ( not ( = ?auto_150725 ?auto_150730 ) ) ( not ( = ?auto_150725 ?auto_150731 ) ) ( not ( = ?auto_150725 ?auto_150732 ) ) ( not ( = ?auto_150726 ?auto_150727 ) ) ( not ( = ?auto_150726 ?auto_150728 ) ) ( not ( = ?auto_150726 ?auto_150729 ) ) ( not ( = ?auto_150726 ?auto_150730 ) ) ( not ( = ?auto_150726 ?auto_150731 ) ) ( not ( = ?auto_150726 ?auto_150732 ) ) ( not ( = ?auto_150727 ?auto_150728 ) ) ( not ( = ?auto_150727 ?auto_150729 ) ) ( not ( = ?auto_150727 ?auto_150730 ) ) ( not ( = ?auto_150727 ?auto_150731 ) ) ( not ( = ?auto_150727 ?auto_150732 ) ) ( not ( = ?auto_150728 ?auto_150729 ) ) ( not ( = ?auto_150728 ?auto_150730 ) ) ( not ( = ?auto_150728 ?auto_150731 ) ) ( not ( = ?auto_150728 ?auto_150732 ) ) ( not ( = ?auto_150729 ?auto_150730 ) ) ( not ( = ?auto_150729 ?auto_150731 ) ) ( not ( = ?auto_150729 ?auto_150732 ) ) ( not ( = ?auto_150730 ?auto_150731 ) ) ( not ( = ?auto_150730 ?auto_150732 ) ) ( not ( = ?auto_150731 ?auto_150732 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150731 ?auto_150732 )
      ( !STACK ?auto_150731 ?auto_150730 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150741 - BLOCK
      ?auto_150742 - BLOCK
      ?auto_150743 - BLOCK
      ?auto_150744 - BLOCK
      ?auto_150745 - BLOCK
      ?auto_150746 - BLOCK
      ?auto_150747 - BLOCK
      ?auto_150748 - BLOCK
    )
    :vars
    (
      ?auto_150749 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_150747 ) ( ON ?auto_150748 ?auto_150749 ) ( CLEAR ?auto_150748 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150741 ) ( ON ?auto_150742 ?auto_150741 ) ( ON ?auto_150743 ?auto_150742 ) ( ON ?auto_150744 ?auto_150743 ) ( ON ?auto_150745 ?auto_150744 ) ( ON ?auto_150746 ?auto_150745 ) ( ON ?auto_150747 ?auto_150746 ) ( not ( = ?auto_150741 ?auto_150742 ) ) ( not ( = ?auto_150741 ?auto_150743 ) ) ( not ( = ?auto_150741 ?auto_150744 ) ) ( not ( = ?auto_150741 ?auto_150745 ) ) ( not ( = ?auto_150741 ?auto_150746 ) ) ( not ( = ?auto_150741 ?auto_150747 ) ) ( not ( = ?auto_150741 ?auto_150748 ) ) ( not ( = ?auto_150741 ?auto_150749 ) ) ( not ( = ?auto_150742 ?auto_150743 ) ) ( not ( = ?auto_150742 ?auto_150744 ) ) ( not ( = ?auto_150742 ?auto_150745 ) ) ( not ( = ?auto_150742 ?auto_150746 ) ) ( not ( = ?auto_150742 ?auto_150747 ) ) ( not ( = ?auto_150742 ?auto_150748 ) ) ( not ( = ?auto_150742 ?auto_150749 ) ) ( not ( = ?auto_150743 ?auto_150744 ) ) ( not ( = ?auto_150743 ?auto_150745 ) ) ( not ( = ?auto_150743 ?auto_150746 ) ) ( not ( = ?auto_150743 ?auto_150747 ) ) ( not ( = ?auto_150743 ?auto_150748 ) ) ( not ( = ?auto_150743 ?auto_150749 ) ) ( not ( = ?auto_150744 ?auto_150745 ) ) ( not ( = ?auto_150744 ?auto_150746 ) ) ( not ( = ?auto_150744 ?auto_150747 ) ) ( not ( = ?auto_150744 ?auto_150748 ) ) ( not ( = ?auto_150744 ?auto_150749 ) ) ( not ( = ?auto_150745 ?auto_150746 ) ) ( not ( = ?auto_150745 ?auto_150747 ) ) ( not ( = ?auto_150745 ?auto_150748 ) ) ( not ( = ?auto_150745 ?auto_150749 ) ) ( not ( = ?auto_150746 ?auto_150747 ) ) ( not ( = ?auto_150746 ?auto_150748 ) ) ( not ( = ?auto_150746 ?auto_150749 ) ) ( not ( = ?auto_150747 ?auto_150748 ) ) ( not ( = ?auto_150747 ?auto_150749 ) ) ( not ( = ?auto_150748 ?auto_150749 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150748 ?auto_150749 )
      ( !STACK ?auto_150748 ?auto_150747 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150758 - BLOCK
      ?auto_150759 - BLOCK
      ?auto_150760 - BLOCK
      ?auto_150761 - BLOCK
      ?auto_150762 - BLOCK
      ?auto_150763 - BLOCK
      ?auto_150764 - BLOCK
      ?auto_150765 - BLOCK
    )
    :vars
    (
      ?auto_150766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150765 ?auto_150766 ) ( ON-TABLE ?auto_150758 ) ( ON ?auto_150759 ?auto_150758 ) ( ON ?auto_150760 ?auto_150759 ) ( ON ?auto_150761 ?auto_150760 ) ( ON ?auto_150762 ?auto_150761 ) ( ON ?auto_150763 ?auto_150762 ) ( not ( = ?auto_150758 ?auto_150759 ) ) ( not ( = ?auto_150758 ?auto_150760 ) ) ( not ( = ?auto_150758 ?auto_150761 ) ) ( not ( = ?auto_150758 ?auto_150762 ) ) ( not ( = ?auto_150758 ?auto_150763 ) ) ( not ( = ?auto_150758 ?auto_150764 ) ) ( not ( = ?auto_150758 ?auto_150765 ) ) ( not ( = ?auto_150758 ?auto_150766 ) ) ( not ( = ?auto_150759 ?auto_150760 ) ) ( not ( = ?auto_150759 ?auto_150761 ) ) ( not ( = ?auto_150759 ?auto_150762 ) ) ( not ( = ?auto_150759 ?auto_150763 ) ) ( not ( = ?auto_150759 ?auto_150764 ) ) ( not ( = ?auto_150759 ?auto_150765 ) ) ( not ( = ?auto_150759 ?auto_150766 ) ) ( not ( = ?auto_150760 ?auto_150761 ) ) ( not ( = ?auto_150760 ?auto_150762 ) ) ( not ( = ?auto_150760 ?auto_150763 ) ) ( not ( = ?auto_150760 ?auto_150764 ) ) ( not ( = ?auto_150760 ?auto_150765 ) ) ( not ( = ?auto_150760 ?auto_150766 ) ) ( not ( = ?auto_150761 ?auto_150762 ) ) ( not ( = ?auto_150761 ?auto_150763 ) ) ( not ( = ?auto_150761 ?auto_150764 ) ) ( not ( = ?auto_150761 ?auto_150765 ) ) ( not ( = ?auto_150761 ?auto_150766 ) ) ( not ( = ?auto_150762 ?auto_150763 ) ) ( not ( = ?auto_150762 ?auto_150764 ) ) ( not ( = ?auto_150762 ?auto_150765 ) ) ( not ( = ?auto_150762 ?auto_150766 ) ) ( not ( = ?auto_150763 ?auto_150764 ) ) ( not ( = ?auto_150763 ?auto_150765 ) ) ( not ( = ?auto_150763 ?auto_150766 ) ) ( not ( = ?auto_150764 ?auto_150765 ) ) ( not ( = ?auto_150764 ?auto_150766 ) ) ( not ( = ?auto_150765 ?auto_150766 ) ) ( CLEAR ?auto_150763 ) ( ON ?auto_150764 ?auto_150765 ) ( CLEAR ?auto_150764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_150758 ?auto_150759 ?auto_150760 ?auto_150761 ?auto_150762 ?auto_150763 ?auto_150764 )
      ( MAKE-8PILE ?auto_150758 ?auto_150759 ?auto_150760 ?auto_150761 ?auto_150762 ?auto_150763 ?auto_150764 ?auto_150765 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150775 - BLOCK
      ?auto_150776 - BLOCK
      ?auto_150777 - BLOCK
      ?auto_150778 - BLOCK
      ?auto_150779 - BLOCK
      ?auto_150780 - BLOCK
      ?auto_150781 - BLOCK
      ?auto_150782 - BLOCK
    )
    :vars
    (
      ?auto_150783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150782 ?auto_150783 ) ( ON-TABLE ?auto_150775 ) ( ON ?auto_150776 ?auto_150775 ) ( ON ?auto_150777 ?auto_150776 ) ( ON ?auto_150778 ?auto_150777 ) ( ON ?auto_150779 ?auto_150778 ) ( ON ?auto_150780 ?auto_150779 ) ( not ( = ?auto_150775 ?auto_150776 ) ) ( not ( = ?auto_150775 ?auto_150777 ) ) ( not ( = ?auto_150775 ?auto_150778 ) ) ( not ( = ?auto_150775 ?auto_150779 ) ) ( not ( = ?auto_150775 ?auto_150780 ) ) ( not ( = ?auto_150775 ?auto_150781 ) ) ( not ( = ?auto_150775 ?auto_150782 ) ) ( not ( = ?auto_150775 ?auto_150783 ) ) ( not ( = ?auto_150776 ?auto_150777 ) ) ( not ( = ?auto_150776 ?auto_150778 ) ) ( not ( = ?auto_150776 ?auto_150779 ) ) ( not ( = ?auto_150776 ?auto_150780 ) ) ( not ( = ?auto_150776 ?auto_150781 ) ) ( not ( = ?auto_150776 ?auto_150782 ) ) ( not ( = ?auto_150776 ?auto_150783 ) ) ( not ( = ?auto_150777 ?auto_150778 ) ) ( not ( = ?auto_150777 ?auto_150779 ) ) ( not ( = ?auto_150777 ?auto_150780 ) ) ( not ( = ?auto_150777 ?auto_150781 ) ) ( not ( = ?auto_150777 ?auto_150782 ) ) ( not ( = ?auto_150777 ?auto_150783 ) ) ( not ( = ?auto_150778 ?auto_150779 ) ) ( not ( = ?auto_150778 ?auto_150780 ) ) ( not ( = ?auto_150778 ?auto_150781 ) ) ( not ( = ?auto_150778 ?auto_150782 ) ) ( not ( = ?auto_150778 ?auto_150783 ) ) ( not ( = ?auto_150779 ?auto_150780 ) ) ( not ( = ?auto_150779 ?auto_150781 ) ) ( not ( = ?auto_150779 ?auto_150782 ) ) ( not ( = ?auto_150779 ?auto_150783 ) ) ( not ( = ?auto_150780 ?auto_150781 ) ) ( not ( = ?auto_150780 ?auto_150782 ) ) ( not ( = ?auto_150780 ?auto_150783 ) ) ( not ( = ?auto_150781 ?auto_150782 ) ) ( not ( = ?auto_150781 ?auto_150783 ) ) ( not ( = ?auto_150782 ?auto_150783 ) ) ( CLEAR ?auto_150780 ) ( ON ?auto_150781 ?auto_150782 ) ( CLEAR ?auto_150781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_150775 ?auto_150776 ?auto_150777 ?auto_150778 ?auto_150779 ?auto_150780 ?auto_150781 )
      ( MAKE-8PILE ?auto_150775 ?auto_150776 ?auto_150777 ?auto_150778 ?auto_150779 ?auto_150780 ?auto_150781 ?auto_150782 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150792 - BLOCK
      ?auto_150793 - BLOCK
      ?auto_150794 - BLOCK
      ?auto_150795 - BLOCK
      ?auto_150796 - BLOCK
      ?auto_150797 - BLOCK
      ?auto_150798 - BLOCK
      ?auto_150799 - BLOCK
    )
    :vars
    (
      ?auto_150800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150799 ?auto_150800 ) ( ON-TABLE ?auto_150792 ) ( ON ?auto_150793 ?auto_150792 ) ( ON ?auto_150794 ?auto_150793 ) ( ON ?auto_150795 ?auto_150794 ) ( ON ?auto_150796 ?auto_150795 ) ( not ( = ?auto_150792 ?auto_150793 ) ) ( not ( = ?auto_150792 ?auto_150794 ) ) ( not ( = ?auto_150792 ?auto_150795 ) ) ( not ( = ?auto_150792 ?auto_150796 ) ) ( not ( = ?auto_150792 ?auto_150797 ) ) ( not ( = ?auto_150792 ?auto_150798 ) ) ( not ( = ?auto_150792 ?auto_150799 ) ) ( not ( = ?auto_150792 ?auto_150800 ) ) ( not ( = ?auto_150793 ?auto_150794 ) ) ( not ( = ?auto_150793 ?auto_150795 ) ) ( not ( = ?auto_150793 ?auto_150796 ) ) ( not ( = ?auto_150793 ?auto_150797 ) ) ( not ( = ?auto_150793 ?auto_150798 ) ) ( not ( = ?auto_150793 ?auto_150799 ) ) ( not ( = ?auto_150793 ?auto_150800 ) ) ( not ( = ?auto_150794 ?auto_150795 ) ) ( not ( = ?auto_150794 ?auto_150796 ) ) ( not ( = ?auto_150794 ?auto_150797 ) ) ( not ( = ?auto_150794 ?auto_150798 ) ) ( not ( = ?auto_150794 ?auto_150799 ) ) ( not ( = ?auto_150794 ?auto_150800 ) ) ( not ( = ?auto_150795 ?auto_150796 ) ) ( not ( = ?auto_150795 ?auto_150797 ) ) ( not ( = ?auto_150795 ?auto_150798 ) ) ( not ( = ?auto_150795 ?auto_150799 ) ) ( not ( = ?auto_150795 ?auto_150800 ) ) ( not ( = ?auto_150796 ?auto_150797 ) ) ( not ( = ?auto_150796 ?auto_150798 ) ) ( not ( = ?auto_150796 ?auto_150799 ) ) ( not ( = ?auto_150796 ?auto_150800 ) ) ( not ( = ?auto_150797 ?auto_150798 ) ) ( not ( = ?auto_150797 ?auto_150799 ) ) ( not ( = ?auto_150797 ?auto_150800 ) ) ( not ( = ?auto_150798 ?auto_150799 ) ) ( not ( = ?auto_150798 ?auto_150800 ) ) ( not ( = ?auto_150799 ?auto_150800 ) ) ( ON ?auto_150798 ?auto_150799 ) ( CLEAR ?auto_150796 ) ( ON ?auto_150797 ?auto_150798 ) ( CLEAR ?auto_150797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150792 ?auto_150793 ?auto_150794 ?auto_150795 ?auto_150796 ?auto_150797 )
      ( MAKE-8PILE ?auto_150792 ?auto_150793 ?auto_150794 ?auto_150795 ?auto_150796 ?auto_150797 ?auto_150798 ?auto_150799 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150809 - BLOCK
      ?auto_150810 - BLOCK
      ?auto_150811 - BLOCK
      ?auto_150812 - BLOCK
      ?auto_150813 - BLOCK
      ?auto_150814 - BLOCK
      ?auto_150815 - BLOCK
      ?auto_150816 - BLOCK
    )
    :vars
    (
      ?auto_150817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150816 ?auto_150817 ) ( ON-TABLE ?auto_150809 ) ( ON ?auto_150810 ?auto_150809 ) ( ON ?auto_150811 ?auto_150810 ) ( ON ?auto_150812 ?auto_150811 ) ( ON ?auto_150813 ?auto_150812 ) ( not ( = ?auto_150809 ?auto_150810 ) ) ( not ( = ?auto_150809 ?auto_150811 ) ) ( not ( = ?auto_150809 ?auto_150812 ) ) ( not ( = ?auto_150809 ?auto_150813 ) ) ( not ( = ?auto_150809 ?auto_150814 ) ) ( not ( = ?auto_150809 ?auto_150815 ) ) ( not ( = ?auto_150809 ?auto_150816 ) ) ( not ( = ?auto_150809 ?auto_150817 ) ) ( not ( = ?auto_150810 ?auto_150811 ) ) ( not ( = ?auto_150810 ?auto_150812 ) ) ( not ( = ?auto_150810 ?auto_150813 ) ) ( not ( = ?auto_150810 ?auto_150814 ) ) ( not ( = ?auto_150810 ?auto_150815 ) ) ( not ( = ?auto_150810 ?auto_150816 ) ) ( not ( = ?auto_150810 ?auto_150817 ) ) ( not ( = ?auto_150811 ?auto_150812 ) ) ( not ( = ?auto_150811 ?auto_150813 ) ) ( not ( = ?auto_150811 ?auto_150814 ) ) ( not ( = ?auto_150811 ?auto_150815 ) ) ( not ( = ?auto_150811 ?auto_150816 ) ) ( not ( = ?auto_150811 ?auto_150817 ) ) ( not ( = ?auto_150812 ?auto_150813 ) ) ( not ( = ?auto_150812 ?auto_150814 ) ) ( not ( = ?auto_150812 ?auto_150815 ) ) ( not ( = ?auto_150812 ?auto_150816 ) ) ( not ( = ?auto_150812 ?auto_150817 ) ) ( not ( = ?auto_150813 ?auto_150814 ) ) ( not ( = ?auto_150813 ?auto_150815 ) ) ( not ( = ?auto_150813 ?auto_150816 ) ) ( not ( = ?auto_150813 ?auto_150817 ) ) ( not ( = ?auto_150814 ?auto_150815 ) ) ( not ( = ?auto_150814 ?auto_150816 ) ) ( not ( = ?auto_150814 ?auto_150817 ) ) ( not ( = ?auto_150815 ?auto_150816 ) ) ( not ( = ?auto_150815 ?auto_150817 ) ) ( not ( = ?auto_150816 ?auto_150817 ) ) ( ON ?auto_150815 ?auto_150816 ) ( CLEAR ?auto_150813 ) ( ON ?auto_150814 ?auto_150815 ) ( CLEAR ?auto_150814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150809 ?auto_150810 ?auto_150811 ?auto_150812 ?auto_150813 ?auto_150814 )
      ( MAKE-8PILE ?auto_150809 ?auto_150810 ?auto_150811 ?auto_150812 ?auto_150813 ?auto_150814 ?auto_150815 ?auto_150816 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150826 - BLOCK
      ?auto_150827 - BLOCK
      ?auto_150828 - BLOCK
      ?auto_150829 - BLOCK
      ?auto_150830 - BLOCK
      ?auto_150831 - BLOCK
      ?auto_150832 - BLOCK
      ?auto_150833 - BLOCK
    )
    :vars
    (
      ?auto_150834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150833 ?auto_150834 ) ( ON-TABLE ?auto_150826 ) ( ON ?auto_150827 ?auto_150826 ) ( ON ?auto_150828 ?auto_150827 ) ( ON ?auto_150829 ?auto_150828 ) ( not ( = ?auto_150826 ?auto_150827 ) ) ( not ( = ?auto_150826 ?auto_150828 ) ) ( not ( = ?auto_150826 ?auto_150829 ) ) ( not ( = ?auto_150826 ?auto_150830 ) ) ( not ( = ?auto_150826 ?auto_150831 ) ) ( not ( = ?auto_150826 ?auto_150832 ) ) ( not ( = ?auto_150826 ?auto_150833 ) ) ( not ( = ?auto_150826 ?auto_150834 ) ) ( not ( = ?auto_150827 ?auto_150828 ) ) ( not ( = ?auto_150827 ?auto_150829 ) ) ( not ( = ?auto_150827 ?auto_150830 ) ) ( not ( = ?auto_150827 ?auto_150831 ) ) ( not ( = ?auto_150827 ?auto_150832 ) ) ( not ( = ?auto_150827 ?auto_150833 ) ) ( not ( = ?auto_150827 ?auto_150834 ) ) ( not ( = ?auto_150828 ?auto_150829 ) ) ( not ( = ?auto_150828 ?auto_150830 ) ) ( not ( = ?auto_150828 ?auto_150831 ) ) ( not ( = ?auto_150828 ?auto_150832 ) ) ( not ( = ?auto_150828 ?auto_150833 ) ) ( not ( = ?auto_150828 ?auto_150834 ) ) ( not ( = ?auto_150829 ?auto_150830 ) ) ( not ( = ?auto_150829 ?auto_150831 ) ) ( not ( = ?auto_150829 ?auto_150832 ) ) ( not ( = ?auto_150829 ?auto_150833 ) ) ( not ( = ?auto_150829 ?auto_150834 ) ) ( not ( = ?auto_150830 ?auto_150831 ) ) ( not ( = ?auto_150830 ?auto_150832 ) ) ( not ( = ?auto_150830 ?auto_150833 ) ) ( not ( = ?auto_150830 ?auto_150834 ) ) ( not ( = ?auto_150831 ?auto_150832 ) ) ( not ( = ?auto_150831 ?auto_150833 ) ) ( not ( = ?auto_150831 ?auto_150834 ) ) ( not ( = ?auto_150832 ?auto_150833 ) ) ( not ( = ?auto_150832 ?auto_150834 ) ) ( not ( = ?auto_150833 ?auto_150834 ) ) ( ON ?auto_150832 ?auto_150833 ) ( ON ?auto_150831 ?auto_150832 ) ( CLEAR ?auto_150829 ) ( ON ?auto_150830 ?auto_150831 ) ( CLEAR ?auto_150830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150826 ?auto_150827 ?auto_150828 ?auto_150829 ?auto_150830 )
      ( MAKE-8PILE ?auto_150826 ?auto_150827 ?auto_150828 ?auto_150829 ?auto_150830 ?auto_150831 ?auto_150832 ?auto_150833 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150843 - BLOCK
      ?auto_150844 - BLOCK
      ?auto_150845 - BLOCK
      ?auto_150846 - BLOCK
      ?auto_150847 - BLOCK
      ?auto_150848 - BLOCK
      ?auto_150849 - BLOCK
      ?auto_150850 - BLOCK
    )
    :vars
    (
      ?auto_150851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150850 ?auto_150851 ) ( ON-TABLE ?auto_150843 ) ( ON ?auto_150844 ?auto_150843 ) ( ON ?auto_150845 ?auto_150844 ) ( ON ?auto_150846 ?auto_150845 ) ( not ( = ?auto_150843 ?auto_150844 ) ) ( not ( = ?auto_150843 ?auto_150845 ) ) ( not ( = ?auto_150843 ?auto_150846 ) ) ( not ( = ?auto_150843 ?auto_150847 ) ) ( not ( = ?auto_150843 ?auto_150848 ) ) ( not ( = ?auto_150843 ?auto_150849 ) ) ( not ( = ?auto_150843 ?auto_150850 ) ) ( not ( = ?auto_150843 ?auto_150851 ) ) ( not ( = ?auto_150844 ?auto_150845 ) ) ( not ( = ?auto_150844 ?auto_150846 ) ) ( not ( = ?auto_150844 ?auto_150847 ) ) ( not ( = ?auto_150844 ?auto_150848 ) ) ( not ( = ?auto_150844 ?auto_150849 ) ) ( not ( = ?auto_150844 ?auto_150850 ) ) ( not ( = ?auto_150844 ?auto_150851 ) ) ( not ( = ?auto_150845 ?auto_150846 ) ) ( not ( = ?auto_150845 ?auto_150847 ) ) ( not ( = ?auto_150845 ?auto_150848 ) ) ( not ( = ?auto_150845 ?auto_150849 ) ) ( not ( = ?auto_150845 ?auto_150850 ) ) ( not ( = ?auto_150845 ?auto_150851 ) ) ( not ( = ?auto_150846 ?auto_150847 ) ) ( not ( = ?auto_150846 ?auto_150848 ) ) ( not ( = ?auto_150846 ?auto_150849 ) ) ( not ( = ?auto_150846 ?auto_150850 ) ) ( not ( = ?auto_150846 ?auto_150851 ) ) ( not ( = ?auto_150847 ?auto_150848 ) ) ( not ( = ?auto_150847 ?auto_150849 ) ) ( not ( = ?auto_150847 ?auto_150850 ) ) ( not ( = ?auto_150847 ?auto_150851 ) ) ( not ( = ?auto_150848 ?auto_150849 ) ) ( not ( = ?auto_150848 ?auto_150850 ) ) ( not ( = ?auto_150848 ?auto_150851 ) ) ( not ( = ?auto_150849 ?auto_150850 ) ) ( not ( = ?auto_150849 ?auto_150851 ) ) ( not ( = ?auto_150850 ?auto_150851 ) ) ( ON ?auto_150849 ?auto_150850 ) ( ON ?auto_150848 ?auto_150849 ) ( CLEAR ?auto_150846 ) ( ON ?auto_150847 ?auto_150848 ) ( CLEAR ?auto_150847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150843 ?auto_150844 ?auto_150845 ?auto_150846 ?auto_150847 )
      ( MAKE-8PILE ?auto_150843 ?auto_150844 ?auto_150845 ?auto_150846 ?auto_150847 ?auto_150848 ?auto_150849 ?auto_150850 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150860 - BLOCK
      ?auto_150861 - BLOCK
      ?auto_150862 - BLOCK
      ?auto_150863 - BLOCK
      ?auto_150864 - BLOCK
      ?auto_150865 - BLOCK
      ?auto_150866 - BLOCK
      ?auto_150867 - BLOCK
    )
    :vars
    (
      ?auto_150868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150867 ?auto_150868 ) ( ON-TABLE ?auto_150860 ) ( ON ?auto_150861 ?auto_150860 ) ( ON ?auto_150862 ?auto_150861 ) ( not ( = ?auto_150860 ?auto_150861 ) ) ( not ( = ?auto_150860 ?auto_150862 ) ) ( not ( = ?auto_150860 ?auto_150863 ) ) ( not ( = ?auto_150860 ?auto_150864 ) ) ( not ( = ?auto_150860 ?auto_150865 ) ) ( not ( = ?auto_150860 ?auto_150866 ) ) ( not ( = ?auto_150860 ?auto_150867 ) ) ( not ( = ?auto_150860 ?auto_150868 ) ) ( not ( = ?auto_150861 ?auto_150862 ) ) ( not ( = ?auto_150861 ?auto_150863 ) ) ( not ( = ?auto_150861 ?auto_150864 ) ) ( not ( = ?auto_150861 ?auto_150865 ) ) ( not ( = ?auto_150861 ?auto_150866 ) ) ( not ( = ?auto_150861 ?auto_150867 ) ) ( not ( = ?auto_150861 ?auto_150868 ) ) ( not ( = ?auto_150862 ?auto_150863 ) ) ( not ( = ?auto_150862 ?auto_150864 ) ) ( not ( = ?auto_150862 ?auto_150865 ) ) ( not ( = ?auto_150862 ?auto_150866 ) ) ( not ( = ?auto_150862 ?auto_150867 ) ) ( not ( = ?auto_150862 ?auto_150868 ) ) ( not ( = ?auto_150863 ?auto_150864 ) ) ( not ( = ?auto_150863 ?auto_150865 ) ) ( not ( = ?auto_150863 ?auto_150866 ) ) ( not ( = ?auto_150863 ?auto_150867 ) ) ( not ( = ?auto_150863 ?auto_150868 ) ) ( not ( = ?auto_150864 ?auto_150865 ) ) ( not ( = ?auto_150864 ?auto_150866 ) ) ( not ( = ?auto_150864 ?auto_150867 ) ) ( not ( = ?auto_150864 ?auto_150868 ) ) ( not ( = ?auto_150865 ?auto_150866 ) ) ( not ( = ?auto_150865 ?auto_150867 ) ) ( not ( = ?auto_150865 ?auto_150868 ) ) ( not ( = ?auto_150866 ?auto_150867 ) ) ( not ( = ?auto_150866 ?auto_150868 ) ) ( not ( = ?auto_150867 ?auto_150868 ) ) ( ON ?auto_150866 ?auto_150867 ) ( ON ?auto_150865 ?auto_150866 ) ( ON ?auto_150864 ?auto_150865 ) ( CLEAR ?auto_150862 ) ( ON ?auto_150863 ?auto_150864 ) ( CLEAR ?auto_150863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150860 ?auto_150861 ?auto_150862 ?auto_150863 )
      ( MAKE-8PILE ?auto_150860 ?auto_150861 ?auto_150862 ?auto_150863 ?auto_150864 ?auto_150865 ?auto_150866 ?auto_150867 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150877 - BLOCK
      ?auto_150878 - BLOCK
      ?auto_150879 - BLOCK
      ?auto_150880 - BLOCK
      ?auto_150881 - BLOCK
      ?auto_150882 - BLOCK
      ?auto_150883 - BLOCK
      ?auto_150884 - BLOCK
    )
    :vars
    (
      ?auto_150885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150884 ?auto_150885 ) ( ON-TABLE ?auto_150877 ) ( ON ?auto_150878 ?auto_150877 ) ( ON ?auto_150879 ?auto_150878 ) ( not ( = ?auto_150877 ?auto_150878 ) ) ( not ( = ?auto_150877 ?auto_150879 ) ) ( not ( = ?auto_150877 ?auto_150880 ) ) ( not ( = ?auto_150877 ?auto_150881 ) ) ( not ( = ?auto_150877 ?auto_150882 ) ) ( not ( = ?auto_150877 ?auto_150883 ) ) ( not ( = ?auto_150877 ?auto_150884 ) ) ( not ( = ?auto_150877 ?auto_150885 ) ) ( not ( = ?auto_150878 ?auto_150879 ) ) ( not ( = ?auto_150878 ?auto_150880 ) ) ( not ( = ?auto_150878 ?auto_150881 ) ) ( not ( = ?auto_150878 ?auto_150882 ) ) ( not ( = ?auto_150878 ?auto_150883 ) ) ( not ( = ?auto_150878 ?auto_150884 ) ) ( not ( = ?auto_150878 ?auto_150885 ) ) ( not ( = ?auto_150879 ?auto_150880 ) ) ( not ( = ?auto_150879 ?auto_150881 ) ) ( not ( = ?auto_150879 ?auto_150882 ) ) ( not ( = ?auto_150879 ?auto_150883 ) ) ( not ( = ?auto_150879 ?auto_150884 ) ) ( not ( = ?auto_150879 ?auto_150885 ) ) ( not ( = ?auto_150880 ?auto_150881 ) ) ( not ( = ?auto_150880 ?auto_150882 ) ) ( not ( = ?auto_150880 ?auto_150883 ) ) ( not ( = ?auto_150880 ?auto_150884 ) ) ( not ( = ?auto_150880 ?auto_150885 ) ) ( not ( = ?auto_150881 ?auto_150882 ) ) ( not ( = ?auto_150881 ?auto_150883 ) ) ( not ( = ?auto_150881 ?auto_150884 ) ) ( not ( = ?auto_150881 ?auto_150885 ) ) ( not ( = ?auto_150882 ?auto_150883 ) ) ( not ( = ?auto_150882 ?auto_150884 ) ) ( not ( = ?auto_150882 ?auto_150885 ) ) ( not ( = ?auto_150883 ?auto_150884 ) ) ( not ( = ?auto_150883 ?auto_150885 ) ) ( not ( = ?auto_150884 ?auto_150885 ) ) ( ON ?auto_150883 ?auto_150884 ) ( ON ?auto_150882 ?auto_150883 ) ( ON ?auto_150881 ?auto_150882 ) ( CLEAR ?auto_150879 ) ( ON ?auto_150880 ?auto_150881 ) ( CLEAR ?auto_150880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150877 ?auto_150878 ?auto_150879 ?auto_150880 )
      ( MAKE-8PILE ?auto_150877 ?auto_150878 ?auto_150879 ?auto_150880 ?auto_150881 ?auto_150882 ?auto_150883 ?auto_150884 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150894 - BLOCK
      ?auto_150895 - BLOCK
      ?auto_150896 - BLOCK
      ?auto_150897 - BLOCK
      ?auto_150898 - BLOCK
      ?auto_150899 - BLOCK
      ?auto_150900 - BLOCK
      ?auto_150901 - BLOCK
    )
    :vars
    (
      ?auto_150902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150901 ?auto_150902 ) ( ON-TABLE ?auto_150894 ) ( ON ?auto_150895 ?auto_150894 ) ( not ( = ?auto_150894 ?auto_150895 ) ) ( not ( = ?auto_150894 ?auto_150896 ) ) ( not ( = ?auto_150894 ?auto_150897 ) ) ( not ( = ?auto_150894 ?auto_150898 ) ) ( not ( = ?auto_150894 ?auto_150899 ) ) ( not ( = ?auto_150894 ?auto_150900 ) ) ( not ( = ?auto_150894 ?auto_150901 ) ) ( not ( = ?auto_150894 ?auto_150902 ) ) ( not ( = ?auto_150895 ?auto_150896 ) ) ( not ( = ?auto_150895 ?auto_150897 ) ) ( not ( = ?auto_150895 ?auto_150898 ) ) ( not ( = ?auto_150895 ?auto_150899 ) ) ( not ( = ?auto_150895 ?auto_150900 ) ) ( not ( = ?auto_150895 ?auto_150901 ) ) ( not ( = ?auto_150895 ?auto_150902 ) ) ( not ( = ?auto_150896 ?auto_150897 ) ) ( not ( = ?auto_150896 ?auto_150898 ) ) ( not ( = ?auto_150896 ?auto_150899 ) ) ( not ( = ?auto_150896 ?auto_150900 ) ) ( not ( = ?auto_150896 ?auto_150901 ) ) ( not ( = ?auto_150896 ?auto_150902 ) ) ( not ( = ?auto_150897 ?auto_150898 ) ) ( not ( = ?auto_150897 ?auto_150899 ) ) ( not ( = ?auto_150897 ?auto_150900 ) ) ( not ( = ?auto_150897 ?auto_150901 ) ) ( not ( = ?auto_150897 ?auto_150902 ) ) ( not ( = ?auto_150898 ?auto_150899 ) ) ( not ( = ?auto_150898 ?auto_150900 ) ) ( not ( = ?auto_150898 ?auto_150901 ) ) ( not ( = ?auto_150898 ?auto_150902 ) ) ( not ( = ?auto_150899 ?auto_150900 ) ) ( not ( = ?auto_150899 ?auto_150901 ) ) ( not ( = ?auto_150899 ?auto_150902 ) ) ( not ( = ?auto_150900 ?auto_150901 ) ) ( not ( = ?auto_150900 ?auto_150902 ) ) ( not ( = ?auto_150901 ?auto_150902 ) ) ( ON ?auto_150900 ?auto_150901 ) ( ON ?auto_150899 ?auto_150900 ) ( ON ?auto_150898 ?auto_150899 ) ( ON ?auto_150897 ?auto_150898 ) ( CLEAR ?auto_150895 ) ( ON ?auto_150896 ?auto_150897 ) ( CLEAR ?auto_150896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150894 ?auto_150895 ?auto_150896 )
      ( MAKE-8PILE ?auto_150894 ?auto_150895 ?auto_150896 ?auto_150897 ?auto_150898 ?auto_150899 ?auto_150900 ?auto_150901 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150911 - BLOCK
      ?auto_150912 - BLOCK
      ?auto_150913 - BLOCK
      ?auto_150914 - BLOCK
      ?auto_150915 - BLOCK
      ?auto_150916 - BLOCK
      ?auto_150917 - BLOCK
      ?auto_150918 - BLOCK
    )
    :vars
    (
      ?auto_150919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150918 ?auto_150919 ) ( ON-TABLE ?auto_150911 ) ( ON ?auto_150912 ?auto_150911 ) ( not ( = ?auto_150911 ?auto_150912 ) ) ( not ( = ?auto_150911 ?auto_150913 ) ) ( not ( = ?auto_150911 ?auto_150914 ) ) ( not ( = ?auto_150911 ?auto_150915 ) ) ( not ( = ?auto_150911 ?auto_150916 ) ) ( not ( = ?auto_150911 ?auto_150917 ) ) ( not ( = ?auto_150911 ?auto_150918 ) ) ( not ( = ?auto_150911 ?auto_150919 ) ) ( not ( = ?auto_150912 ?auto_150913 ) ) ( not ( = ?auto_150912 ?auto_150914 ) ) ( not ( = ?auto_150912 ?auto_150915 ) ) ( not ( = ?auto_150912 ?auto_150916 ) ) ( not ( = ?auto_150912 ?auto_150917 ) ) ( not ( = ?auto_150912 ?auto_150918 ) ) ( not ( = ?auto_150912 ?auto_150919 ) ) ( not ( = ?auto_150913 ?auto_150914 ) ) ( not ( = ?auto_150913 ?auto_150915 ) ) ( not ( = ?auto_150913 ?auto_150916 ) ) ( not ( = ?auto_150913 ?auto_150917 ) ) ( not ( = ?auto_150913 ?auto_150918 ) ) ( not ( = ?auto_150913 ?auto_150919 ) ) ( not ( = ?auto_150914 ?auto_150915 ) ) ( not ( = ?auto_150914 ?auto_150916 ) ) ( not ( = ?auto_150914 ?auto_150917 ) ) ( not ( = ?auto_150914 ?auto_150918 ) ) ( not ( = ?auto_150914 ?auto_150919 ) ) ( not ( = ?auto_150915 ?auto_150916 ) ) ( not ( = ?auto_150915 ?auto_150917 ) ) ( not ( = ?auto_150915 ?auto_150918 ) ) ( not ( = ?auto_150915 ?auto_150919 ) ) ( not ( = ?auto_150916 ?auto_150917 ) ) ( not ( = ?auto_150916 ?auto_150918 ) ) ( not ( = ?auto_150916 ?auto_150919 ) ) ( not ( = ?auto_150917 ?auto_150918 ) ) ( not ( = ?auto_150917 ?auto_150919 ) ) ( not ( = ?auto_150918 ?auto_150919 ) ) ( ON ?auto_150917 ?auto_150918 ) ( ON ?auto_150916 ?auto_150917 ) ( ON ?auto_150915 ?auto_150916 ) ( ON ?auto_150914 ?auto_150915 ) ( CLEAR ?auto_150912 ) ( ON ?auto_150913 ?auto_150914 ) ( CLEAR ?auto_150913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150911 ?auto_150912 ?auto_150913 )
      ( MAKE-8PILE ?auto_150911 ?auto_150912 ?auto_150913 ?auto_150914 ?auto_150915 ?auto_150916 ?auto_150917 ?auto_150918 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150928 - BLOCK
      ?auto_150929 - BLOCK
      ?auto_150930 - BLOCK
      ?auto_150931 - BLOCK
      ?auto_150932 - BLOCK
      ?auto_150933 - BLOCK
      ?auto_150934 - BLOCK
      ?auto_150935 - BLOCK
    )
    :vars
    (
      ?auto_150936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150935 ?auto_150936 ) ( ON-TABLE ?auto_150928 ) ( not ( = ?auto_150928 ?auto_150929 ) ) ( not ( = ?auto_150928 ?auto_150930 ) ) ( not ( = ?auto_150928 ?auto_150931 ) ) ( not ( = ?auto_150928 ?auto_150932 ) ) ( not ( = ?auto_150928 ?auto_150933 ) ) ( not ( = ?auto_150928 ?auto_150934 ) ) ( not ( = ?auto_150928 ?auto_150935 ) ) ( not ( = ?auto_150928 ?auto_150936 ) ) ( not ( = ?auto_150929 ?auto_150930 ) ) ( not ( = ?auto_150929 ?auto_150931 ) ) ( not ( = ?auto_150929 ?auto_150932 ) ) ( not ( = ?auto_150929 ?auto_150933 ) ) ( not ( = ?auto_150929 ?auto_150934 ) ) ( not ( = ?auto_150929 ?auto_150935 ) ) ( not ( = ?auto_150929 ?auto_150936 ) ) ( not ( = ?auto_150930 ?auto_150931 ) ) ( not ( = ?auto_150930 ?auto_150932 ) ) ( not ( = ?auto_150930 ?auto_150933 ) ) ( not ( = ?auto_150930 ?auto_150934 ) ) ( not ( = ?auto_150930 ?auto_150935 ) ) ( not ( = ?auto_150930 ?auto_150936 ) ) ( not ( = ?auto_150931 ?auto_150932 ) ) ( not ( = ?auto_150931 ?auto_150933 ) ) ( not ( = ?auto_150931 ?auto_150934 ) ) ( not ( = ?auto_150931 ?auto_150935 ) ) ( not ( = ?auto_150931 ?auto_150936 ) ) ( not ( = ?auto_150932 ?auto_150933 ) ) ( not ( = ?auto_150932 ?auto_150934 ) ) ( not ( = ?auto_150932 ?auto_150935 ) ) ( not ( = ?auto_150932 ?auto_150936 ) ) ( not ( = ?auto_150933 ?auto_150934 ) ) ( not ( = ?auto_150933 ?auto_150935 ) ) ( not ( = ?auto_150933 ?auto_150936 ) ) ( not ( = ?auto_150934 ?auto_150935 ) ) ( not ( = ?auto_150934 ?auto_150936 ) ) ( not ( = ?auto_150935 ?auto_150936 ) ) ( ON ?auto_150934 ?auto_150935 ) ( ON ?auto_150933 ?auto_150934 ) ( ON ?auto_150932 ?auto_150933 ) ( ON ?auto_150931 ?auto_150932 ) ( ON ?auto_150930 ?auto_150931 ) ( CLEAR ?auto_150928 ) ( ON ?auto_150929 ?auto_150930 ) ( CLEAR ?auto_150929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150928 ?auto_150929 )
      ( MAKE-8PILE ?auto_150928 ?auto_150929 ?auto_150930 ?auto_150931 ?auto_150932 ?auto_150933 ?auto_150934 ?auto_150935 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150945 - BLOCK
      ?auto_150946 - BLOCK
      ?auto_150947 - BLOCK
      ?auto_150948 - BLOCK
      ?auto_150949 - BLOCK
      ?auto_150950 - BLOCK
      ?auto_150951 - BLOCK
      ?auto_150952 - BLOCK
    )
    :vars
    (
      ?auto_150953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150952 ?auto_150953 ) ( ON-TABLE ?auto_150945 ) ( not ( = ?auto_150945 ?auto_150946 ) ) ( not ( = ?auto_150945 ?auto_150947 ) ) ( not ( = ?auto_150945 ?auto_150948 ) ) ( not ( = ?auto_150945 ?auto_150949 ) ) ( not ( = ?auto_150945 ?auto_150950 ) ) ( not ( = ?auto_150945 ?auto_150951 ) ) ( not ( = ?auto_150945 ?auto_150952 ) ) ( not ( = ?auto_150945 ?auto_150953 ) ) ( not ( = ?auto_150946 ?auto_150947 ) ) ( not ( = ?auto_150946 ?auto_150948 ) ) ( not ( = ?auto_150946 ?auto_150949 ) ) ( not ( = ?auto_150946 ?auto_150950 ) ) ( not ( = ?auto_150946 ?auto_150951 ) ) ( not ( = ?auto_150946 ?auto_150952 ) ) ( not ( = ?auto_150946 ?auto_150953 ) ) ( not ( = ?auto_150947 ?auto_150948 ) ) ( not ( = ?auto_150947 ?auto_150949 ) ) ( not ( = ?auto_150947 ?auto_150950 ) ) ( not ( = ?auto_150947 ?auto_150951 ) ) ( not ( = ?auto_150947 ?auto_150952 ) ) ( not ( = ?auto_150947 ?auto_150953 ) ) ( not ( = ?auto_150948 ?auto_150949 ) ) ( not ( = ?auto_150948 ?auto_150950 ) ) ( not ( = ?auto_150948 ?auto_150951 ) ) ( not ( = ?auto_150948 ?auto_150952 ) ) ( not ( = ?auto_150948 ?auto_150953 ) ) ( not ( = ?auto_150949 ?auto_150950 ) ) ( not ( = ?auto_150949 ?auto_150951 ) ) ( not ( = ?auto_150949 ?auto_150952 ) ) ( not ( = ?auto_150949 ?auto_150953 ) ) ( not ( = ?auto_150950 ?auto_150951 ) ) ( not ( = ?auto_150950 ?auto_150952 ) ) ( not ( = ?auto_150950 ?auto_150953 ) ) ( not ( = ?auto_150951 ?auto_150952 ) ) ( not ( = ?auto_150951 ?auto_150953 ) ) ( not ( = ?auto_150952 ?auto_150953 ) ) ( ON ?auto_150951 ?auto_150952 ) ( ON ?auto_150950 ?auto_150951 ) ( ON ?auto_150949 ?auto_150950 ) ( ON ?auto_150948 ?auto_150949 ) ( ON ?auto_150947 ?auto_150948 ) ( CLEAR ?auto_150945 ) ( ON ?auto_150946 ?auto_150947 ) ( CLEAR ?auto_150946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150945 ?auto_150946 )
      ( MAKE-8PILE ?auto_150945 ?auto_150946 ?auto_150947 ?auto_150948 ?auto_150949 ?auto_150950 ?auto_150951 ?auto_150952 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150962 - BLOCK
      ?auto_150963 - BLOCK
      ?auto_150964 - BLOCK
      ?auto_150965 - BLOCK
      ?auto_150966 - BLOCK
      ?auto_150967 - BLOCK
      ?auto_150968 - BLOCK
      ?auto_150969 - BLOCK
    )
    :vars
    (
      ?auto_150970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150969 ?auto_150970 ) ( not ( = ?auto_150962 ?auto_150963 ) ) ( not ( = ?auto_150962 ?auto_150964 ) ) ( not ( = ?auto_150962 ?auto_150965 ) ) ( not ( = ?auto_150962 ?auto_150966 ) ) ( not ( = ?auto_150962 ?auto_150967 ) ) ( not ( = ?auto_150962 ?auto_150968 ) ) ( not ( = ?auto_150962 ?auto_150969 ) ) ( not ( = ?auto_150962 ?auto_150970 ) ) ( not ( = ?auto_150963 ?auto_150964 ) ) ( not ( = ?auto_150963 ?auto_150965 ) ) ( not ( = ?auto_150963 ?auto_150966 ) ) ( not ( = ?auto_150963 ?auto_150967 ) ) ( not ( = ?auto_150963 ?auto_150968 ) ) ( not ( = ?auto_150963 ?auto_150969 ) ) ( not ( = ?auto_150963 ?auto_150970 ) ) ( not ( = ?auto_150964 ?auto_150965 ) ) ( not ( = ?auto_150964 ?auto_150966 ) ) ( not ( = ?auto_150964 ?auto_150967 ) ) ( not ( = ?auto_150964 ?auto_150968 ) ) ( not ( = ?auto_150964 ?auto_150969 ) ) ( not ( = ?auto_150964 ?auto_150970 ) ) ( not ( = ?auto_150965 ?auto_150966 ) ) ( not ( = ?auto_150965 ?auto_150967 ) ) ( not ( = ?auto_150965 ?auto_150968 ) ) ( not ( = ?auto_150965 ?auto_150969 ) ) ( not ( = ?auto_150965 ?auto_150970 ) ) ( not ( = ?auto_150966 ?auto_150967 ) ) ( not ( = ?auto_150966 ?auto_150968 ) ) ( not ( = ?auto_150966 ?auto_150969 ) ) ( not ( = ?auto_150966 ?auto_150970 ) ) ( not ( = ?auto_150967 ?auto_150968 ) ) ( not ( = ?auto_150967 ?auto_150969 ) ) ( not ( = ?auto_150967 ?auto_150970 ) ) ( not ( = ?auto_150968 ?auto_150969 ) ) ( not ( = ?auto_150968 ?auto_150970 ) ) ( not ( = ?auto_150969 ?auto_150970 ) ) ( ON ?auto_150968 ?auto_150969 ) ( ON ?auto_150967 ?auto_150968 ) ( ON ?auto_150966 ?auto_150967 ) ( ON ?auto_150965 ?auto_150966 ) ( ON ?auto_150964 ?auto_150965 ) ( ON ?auto_150963 ?auto_150964 ) ( ON ?auto_150962 ?auto_150963 ) ( CLEAR ?auto_150962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150962 )
      ( MAKE-8PILE ?auto_150962 ?auto_150963 ?auto_150964 ?auto_150965 ?auto_150966 ?auto_150967 ?auto_150968 ?auto_150969 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150979 - BLOCK
      ?auto_150980 - BLOCK
      ?auto_150981 - BLOCK
      ?auto_150982 - BLOCK
      ?auto_150983 - BLOCK
      ?auto_150984 - BLOCK
      ?auto_150985 - BLOCK
      ?auto_150986 - BLOCK
    )
    :vars
    (
      ?auto_150987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150986 ?auto_150987 ) ( not ( = ?auto_150979 ?auto_150980 ) ) ( not ( = ?auto_150979 ?auto_150981 ) ) ( not ( = ?auto_150979 ?auto_150982 ) ) ( not ( = ?auto_150979 ?auto_150983 ) ) ( not ( = ?auto_150979 ?auto_150984 ) ) ( not ( = ?auto_150979 ?auto_150985 ) ) ( not ( = ?auto_150979 ?auto_150986 ) ) ( not ( = ?auto_150979 ?auto_150987 ) ) ( not ( = ?auto_150980 ?auto_150981 ) ) ( not ( = ?auto_150980 ?auto_150982 ) ) ( not ( = ?auto_150980 ?auto_150983 ) ) ( not ( = ?auto_150980 ?auto_150984 ) ) ( not ( = ?auto_150980 ?auto_150985 ) ) ( not ( = ?auto_150980 ?auto_150986 ) ) ( not ( = ?auto_150980 ?auto_150987 ) ) ( not ( = ?auto_150981 ?auto_150982 ) ) ( not ( = ?auto_150981 ?auto_150983 ) ) ( not ( = ?auto_150981 ?auto_150984 ) ) ( not ( = ?auto_150981 ?auto_150985 ) ) ( not ( = ?auto_150981 ?auto_150986 ) ) ( not ( = ?auto_150981 ?auto_150987 ) ) ( not ( = ?auto_150982 ?auto_150983 ) ) ( not ( = ?auto_150982 ?auto_150984 ) ) ( not ( = ?auto_150982 ?auto_150985 ) ) ( not ( = ?auto_150982 ?auto_150986 ) ) ( not ( = ?auto_150982 ?auto_150987 ) ) ( not ( = ?auto_150983 ?auto_150984 ) ) ( not ( = ?auto_150983 ?auto_150985 ) ) ( not ( = ?auto_150983 ?auto_150986 ) ) ( not ( = ?auto_150983 ?auto_150987 ) ) ( not ( = ?auto_150984 ?auto_150985 ) ) ( not ( = ?auto_150984 ?auto_150986 ) ) ( not ( = ?auto_150984 ?auto_150987 ) ) ( not ( = ?auto_150985 ?auto_150986 ) ) ( not ( = ?auto_150985 ?auto_150987 ) ) ( not ( = ?auto_150986 ?auto_150987 ) ) ( ON ?auto_150985 ?auto_150986 ) ( ON ?auto_150984 ?auto_150985 ) ( ON ?auto_150983 ?auto_150984 ) ( ON ?auto_150982 ?auto_150983 ) ( ON ?auto_150981 ?auto_150982 ) ( ON ?auto_150980 ?auto_150981 ) ( ON ?auto_150979 ?auto_150980 ) ( CLEAR ?auto_150979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150979 )
      ( MAKE-8PILE ?auto_150979 ?auto_150980 ?auto_150981 ?auto_150982 ?auto_150983 ?auto_150984 ?auto_150985 ?auto_150986 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_150997 - BLOCK
      ?auto_150998 - BLOCK
      ?auto_150999 - BLOCK
      ?auto_151000 - BLOCK
      ?auto_151001 - BLOCK
      ?auto_151002 - BLOCK
      ?auto_151003 - BLOCK
      ?auto_151004 - BLOCK
      ?auto_151005 - BLOCK
    )
    :vars
    (
      ?auto_151006 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_151004 ) ( ON ?auto_151005 ?auto_151006 ) ( CLEAR ?auto_151005 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150997 ) ( ON ?auto_150998 ?auto_150997 ) ( ON ?auto_150999 ?auto_150998 ) ( ON ?auto_151000 ?auto_150999 ) ( ON ?auto_151001 ?auto_151000 ) ( ON ?auto_151002 ?auto_151001 ) ( ON ?auto_151003 ?auto_151002 ) ( ON ?auto_151004 ?auto_151003 ) ( not ( = ?auto_150997 ?auto_150998 ) ) ( not ( = ?auto_150997 ?auto_150999 ) ) ( not ( = ?auto_150997 ?auto_151000 ) ) ( not ( = ?auto_150997 ?auto_151001 ) ) ( not ( = ?auto_150997 ?auto_151002 ) ) ( not ( = ?auto_150997 ?auto_151003 ) ) ( not ( = ?auto_150997 ?auto_151004 ) ) ( not ( = ?auto_150997 ?auto_151005 ) ) ( not ( = ?auto_150997 ?auto_151006 ) ) ( not ( = ?auto_150998 ?auto_150999 ) ) ( not ( = ?auto_150998 ?auto_151000 ) ) ( not ( = ?auto_150998 ?auto_151001 ) ) ( not ( = ?auto_150998 ?auto_151002 ) ) ( not ( = ?auto_150998 ?auto_151003 ) ) ( not ( = ?auto_150998 ?auto_151004 ) ) ( not ( = ?auto_150998 ?auto_151005 ) ) ( not ( = ?auto_150998 ?auto_151006 ) ) ( not ( = ?auto_150999 ?auto_151000 ) ) ( not ( = ?auto_150999 ?auto_151001 ) ) ( not ( = ?auto_150999 ?auto_151002 ) ) ( not ( = ?auto_150999 ?auto_151003 ) ) ( not ( = ?auto_150999 ?auto_151004 ) ) ( not ( = ?auto_150999 ?auto_151005 ) ) ( not ( = ?auto_150999 ?auto_151006 ) ) ( not ( = ?auto_151000 ?auto_151001 ) ) ( not ( = ?auto_151000 ?auto_151002 ) ) ( not ( = ?auto_151000 ?auto_151003 ) ) ( not ( = ?auto_151000 ?auto_151004 ) ) ( not ( = ?auto_151000 ?auto_151005 ) ) ( not ( = ?auto_151000 ?auto_151006 ) ) ( not ( = ?auto_151001 ?auto_151002 ) ) ( not ( = ?auto_151001 ?auto_151003 ) ) ( not ( = ?auto_151001 ?auto_151004 ) ) ( not ( = ?auto_151001 ?auto_151005 ) ) ( not ( = ?auto_151001 ?auto_151006 ) ) ( not ( = ?auto_151002 ?auto_151003 ) ) ( not ( = ?auto_151002 ?auto_151004 ) ) ( not ( = ?auto_151002 ?auto_151005 ) ) ( not ( = ?auto_151002 ?auto_151006 ) ) ( not ( = ?auto_151003 ?auto_151004 ) ) ( not ( = ?auto_151003 ?auto_151005 ) ) ( not ( = ?auto_151003 ?auto_151006 ) ) ( not ( = ?auto_151004 ?auto_151005 ) ) ( not ( = ?auto_151004 ?auto_151006 ) ) ( not ( = ?auto_151005 ?auto_151006 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_151005 ?auto_151006 )
      ( !STACK ?auto_151005 ?auto_151004 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_151016 - BLOCK
      ?auto_151017 - BLOCK
      ?auto_151018 - BLOCK
      ?auto_151019 - BLOCK
      ?auto_151020 - BLOCK
      ?auto_151021 - BLOCK
      ?auto_151022 - BLOCK
      ?auto_151023 - BLOCK
      ?auto_151024 - BLOCK
    )
    :vars
    (
      ?auto_151025 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_151023 ) ( ON ?auto_151024 ?auto_151025 ) ( CLEAR ?auto_151024 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_151016 ) ( ON ?auto_151017 ?auto_151016 ) ( ON ?auto_151018 ?auto_151017 ) ( ON ?auto_151019 ?auto_151018 ) ( ON ?auto_151020 ?auto_151019 ) ( ON ?auto_151021 ?auto_151020 ) ( ON ?auto_151022 ?auto_151021 ) ( ON ?auto_151023 ?auto_151022 ) ( not ( = ?auto_151016 ?auto_151017 ) ) ( not ( = ?auto_151016 ?auto_151018 ) ) ( not ( = ?auto_151016 ?auto_151019 ) ) ( not ( = ?auto_151016 ?auto_151020 ) ) ( not ( = ?auto_151016 ?auto_151021 ) ) ( not ( = ?auto_151016 ?auto_151022 ) ) ( not ( = ?auto_151016 ?auto_151023 ) ) ( not ( = ?auto_151016 ?auto_151024 ) ) ( not ( = ?auto_151016 ?auto_151025 ) ) ( not ( = ?auto_151017 ?auto_151018 ) ) ( not ( = ?auto_151017 ?auto_151019 ) ) ( not ( = ?auto_151017 ?auto_151020 ) ) ( not ( = ?auto_151017 ?auto_151021 ) ) ( not ( = ?auto_151017 ?auto_151022 ) ) ( not ( = ?auto_151017 ?auto_151023 ) ) ( not ( = ?auto_151017 ?auto_151024 ) ) ( not ( = ?auto_151017 ?auto_151025 ) ) ( not ( = ?auto_151018 ?auto_151019 ) ) ( not ( = ?auto_151018 ?auto_151020 ) ) ( not ( = ?auto_151018 ?auto_151021 ) ) ( not ( = ?auto_151018 ?auto_151022 ) ) ( not ( = ?auto_151018 ?auto_151023 ) ) ( not ( = ?auto_151018 ?auto_151024 ) ) ( not ( = ?auto_151018 ?auto_151025 ) ) ( not ( = ?auto_151019 ?auto_151020 ) ) ( not ( = ?auto_151019 ?auto_151021 ) ) ( not ( = ?auto_151019 ?auto_151022 ) ) ( not ( = ?auto_151019 ?auto_151023 ) ) ( not ( = ?auto_151019 ?auto_151024 ) ) ( not ( = ?auto_151019 ?auto_151025 ) ) ( not ( = ?auto_151020 ?auto_151021 ) ) ( not ( = ?auto_151020 ?auto_151022 ) ) ( not ( = ?auto_151020 ?auto_151023 ) ) ( not ( = ?auto_151020 ?auto_151024 ) ) ( not ( = ?auto_151020 ?auto_151025 ) ) ( not ( = ?auto_151021 ?auto_151022 ) ) ( not ( = ?auto_151021 ?auto_151023 ) ) ( not ( = ?auto_151021 ?auto_151024 ) ) ( not ( = ?auto_151021 ?auto_151025 ) ) ( not ( = ?auto_151022 ?auto_151023 ) ) ( not ( = ?auto_151022 ?auto_151024 ) ) ( not ( = ?auto_151022 ?auto_151025 ) ) ( not ( = ?auto_151023 ?auto_151024 ) ) ( not ( = ?auto_151023 ?auto_151025 ) ) ( not ( = ?auto_151024 ?auto_151025 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_151024 ?auto_151025 )
      ( !STACK ?auto_151024 ?auto_151023 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_151035 - BLOCK
      ?auto_151036 - BLOCK
      ?auto_151037 - BLOCK
      ?auto_151038 - BLOCK
      ?auto_151039 - BLOCK
      ?auto_151040 - BLOCK
      ?auto_151041 - BLOCK
      ?auto_151042 - BLOCK
      ?auto_151043 - BLOCK
    )
    :vars
    (
      ?auto_151044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151043 ?auto_151044 ) ( ON-TABLE ?auto_151035 ) ( ON ?auto_151036 ?auto_151035 ) ( ON ?auto_151037 ?auto_151036 ) ( ON ?auto_151038 ?auto_151037 ) ( ON ?auto_151039 ?auto_151038 ) ( ON ?auto_151040 ?auto_151039 ) ( ON ?auto_151041 ?auto_151040 ) ( not ( = ?auto_151035 ?auto_151036 ) ) ( not ( = ?auto_151035 ?auto_151037 ) ) ( not ( = ?auto_151035 ?auto_151038 ) ) ( not ( = ?auto_151035 ?auto_151039 ) ) ( not ( = ?auto_151035 ?auto_151040 ) ) ( not ( = ?auto_151035 ?auto_151041 ) ) ( not ( = ?auto_151035 ?auto_151042 ) ) ( not ( = ?auto_151035 ?auto_151043 ) ) ( not ( = ?auto_151035 ?auto_151044 ) ) ( not ( = ?auto_151036 ?auto_151037 ) ) ( not ( = ?auto_151036 ?auto_151038 ) ) ( not ( = ?auto_151036 ?auto_151039 ) ) ( not ( = ?auto_151036 ?auto_151040 ) ) ( not ( = ?auto_151036 ?auto_151041 ) ) ( not ( = ?auto_151036 ?auto_151042 ) ) ( not ( = ?auto_151036 ?auto_151043 ) ) ( not ( = ?auto_151036 ?auto_151044 ) ) ( not ( = ?auto_151037 ?auto_151038 ) ) ( not ( = ?auto_151037 ?auto_151039 ) ) ( not ( = ?auto_151037 ?auto_151040 ) ) ( not ( = ?auto_151037 ?auto_151041 ) ) ( not ( = ?auto_151037 ?auto_151042 ) ) ( not ( = ?auto_151037 ?auto_151043 ) ) ( not ( = ?auto_151037 ?auto_151044 ) ) ( not ( = ?auto_151038 ?auto_151039 ) ) ( not ( = ?auto_151038 ?auto_151040 ) ) ( not ( = ?auto_151038 ?auto_151041 ) ) ( not ( = ?auto_151038 ?auto_151042 ) ) ( not ( = ?auto_151038 ?auto_151043 ) ) ( not ( = ?auto_151038 ?auto_151044 ) ) ( not ( = ?auto_151039 ?auto_151040 ) ) ( not ( = ?auto_151039 ?auto_151041 ) ) ( not ( = ?auto_151039 ?auto_151042 ) ) ( not ( = ?auto_151039 ?auto_151043 ) ) ( not ( = ?auto_151039 ?auto_151044 ) ) ( not ( = ?auto_151040 ?auto_151041 ) ) ( not ( = ?auto_151040 ?auto_151042 ) ) ( not ( = ?auto_151040 ?auto_151043 ) ) ( not ( = ?auto_151040 ?auto_151044 ) ) ( not ( = ?auto_151041 ?auto_151042 ) ) ( not ( = ?auto_151041 ?auto_151043 ) ) ( not ( = ?auto_151041 ?auto_151044 ) ) ( not ( = ?auto_151042 ?auto_151043 ) ) ( not ( = ?auto_151042 ?auto_151044 ) ) ( not ( = ?auto_151043 ?auto_151044 ) ) ( CLEAR ?auto_151041 ) ( ON ?auto_151042 ?auto_151043 ) ( CLEAR ?auto_151042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_151035 ?auto_151036 ?auto_151037 ?auto_151038 ?auto_151039 ?auto_151040 ?auto_151041 ?auto_151042 )
      ( MAKE-9PILE ?auto_151035 ?auto_151036 ?auto_151037 ?auto_151038 ?auto_151039 ?auto_151040 ?auto_151041 ?auto_151042 ?auto_151043 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_151054 - BLOCK
      ?auto_151055 - BLOCK
      ?auto_151056 - BLOCK
      ?auto_151057 - BLOCK
      ?auto_151058 - BLOCK
      ?auto_151059 - BLOCK
      ?auto_151060 - BLOCK
      ?auto_151061 - BLOCK
      ?auto_151062 - BLOCK
    )
    :vars
    (
      ?auto_151063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151062 ?auto_151063 ) ( ON-TABLE ?auto_151054 ) ( ON ?auto_151055 ?auto_151054 ) ( ON ?auto_151056 ?auto_151055 ) ( ON ?auto_151057 ?auto_151056 ) ( ON ?auto_151058 ?auto_151057 ) ( ON ?auto_151059 ?auto_151058 ) ( ON ?auto_151060 ?auto_151059 ) ( not ( = ?auto_151054 ?auto_151055 ) ) ( not ( = ?auto_151054 ?auto_151056 ) ) ( not ( = ?auto_151054 ?auto_151057 ) ) ( not ( = ?auto_151054 ?auto_151058 ) ) ( not ( = ?auto_151054 ?auto_151059 ) ) ( not ( = ?auto_151054 ?auto_151060 ) ) ( not ( = ?auto_151054 ?auto_151061 ) ) ( not ( = ?auto_151054 ?auto_151062 ) ) ( not ( = ?auto_151054 ?auto_151063 ) ) ( not ( = ?auto_151055 ?auto_151056 ) ) ( not ( = ?auto_151055 ?auto_151057 ) ) ( not ( = ?auto_151055 ?auto_151058 ) ) ( not ( = ?auto_151055 ?auto_151059 ) ) ( not ( = ?auto_151055 ?auto_151060 ) ) ( not ( = ?auto_151055 ?auto_151061 ) ) ( not ( = ?auto_151055 ?auto_151062 ) ) ( not ( = ?auto_151055 ?auto_151063 ) ) ( not ( = ?auto_151056 ?auto_151057 ) ) ( not ( = ?auto_151056 ?auto_151058 ) ) ( not ( = ?auto_151056 ?auto_151059 ) ) ( not ( = ?auto_151056 ?auto_151060 ) ) ( not ( = ?auto_151056 ?auto_151061 ) ) ( not ( = ?auto_151056 ?auto_151062 ) ) ( not ( = ?auto_151056 ?auto_151063 ) ) ( not ( = ?auto_151057 ?auto_151058 ) ) ( not ( = ?auto_151057 ?auto_151059 ) ) ( not ( = ?auto_151057 ?auto_151060 ) ) ( not ( = ?auto_151057 ?auto_151061 ) ) ( not ( = ?auto_151057 ?auto_151062 ) ) ( not ( = ?auto_151057 ?auto_151063 ) ) ( not ( = ?auto_151058 ?auto_151059 ) ) ( not ( = ?auto_151058 ?auto_151060 ) ) ( not ( = ?auto_151058 ?auto_151061 ) ) ( not ( = ?auto_151058 ?auto_151062 ) ) ( not ( = ?auto_151058 ?auto_151063 ) ) ( not ( = ?auto_151059 ?auto_151060 ) ) ( not ( = ?auto_151059 ?auto_151061 ) ) ( not ( = ?auto_151059 ?auto_151062 ) ) ( not ( = ?auto_151059 ?auto_151063 ) ) ( not ( = ?auto_151060 ?auto_151061 ) ) ( not ( = ?auto_151060 ?auto_151062 ) ) ( not ( = ?auto_151060 ?auto_151063 ) ) ( not ( = ?auto_151061 ?auto_151062 ) ) ( not ( = ?auto_151061 ?auto_151063 ) ) ( not ( = ?auto_151062 ?auto_151063 ) ) ( CLEAR ?auto_151060 ) ( ON ?auto_151061 ?auto_151062 ) ( CLEAR ?auto_151061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_151054 ?auto_151055 ?auto_151056 ?auto_151057 ?auto_151058 ?auto_151059 ?auto_151060 ?auto_151061 )
      ( MAKE-9PILE ?auto_151054 ?auto_151055 ?auto_151056 ?auto_151057 ?auto_151058 ?auto_151059 ?auto_151060 ?auto_151061 ?auto_151062 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_151073 - BLOCK
      ?auto_151074 - BLOCK
      ?auto_151075 - BLOCK
      ?auto_151076 - BLOCK
      ?auto_151077 - BLOCK
      ?auto_151078 - BLOCK
      ?auto_151079 - BLOCK
      ?auto_151080 - BLOCK
      ?auto_151081 - BLOCK
    )
    :vars
    (
      ?auto_151082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151081 ?auto_151082 ) ( ON-TABLE ?auto_151073 ) ( ON ?auto_151074 ?auto_151073 ) ( ON ?auto_151075 ?auto_151074 ) ( ON ?auto_151076 ?auto_151075 ) ( ON ?auto_151077 ?auto_151076 ) ( ON ?auto_151078 ?auto_151077 ) ( not ( = ?auto_151073 ?auto_151074 ) ) ( not ( = ?auto_151073 ?auto_151075 ) ) ( not ( = ?auto_151073 ?auto_151076 ) ) ( not ( = ?auto_151073 ?auto_151077 ) ) ( not ( = ?auto_151073 ?auto_151078 ) ) ( not ( = ?auto_151073 ?auto_151079 ) ) ( not ( = ?auto_151073 ?auto_151080 ) ) ( not ( = ?auto_151073 ?auto_151081 ) ) ( not ( = ?auto_151073 ?auto_151082 ) ) ( not ( = ?auto_151074 ?auto_151075 ) ) ( not ( = ?auto_151074 ?auto_151076 ) ) ( not ( = ?auto_151074 ?auto_151077 ) ) ( not ( = ?auto_151074 ?auto_151078 ) ) ( not ( = ?auto_151074 ?auto_151079 ) ) ( not ( = ?auto_151074 ?auto_151080 ) ) ( not ( = ?auto_151074 ?auto_151081 ) ) ( not ( = ?auto_151074 ?auto_151082 ) ) ( not ( = ?auto_151075 ?auto_151076 ) ) ( not ( = ?auto_151075 ?auto_151077 ) ) ( not ( = ?auto_151075 ?auto_151078 ) ) ( not ( = ?auto_151075 ?auto_151079 ) ) ( not ( = ?auto_151075 ?auto_151080 ) ) ( not ( = ?auto_151075 ?auto_151081 ) ) ( not ( = ?auto_151075 ?auto_151082 ) ) ( not ( = ?auto_151076 ?auto_151077 ) ) ( not ( = ?auto_151076 ?auto_151078 ) ) ( not ( = ?auto_151076 ?auto_151079 ) ) ( not ( = ?auto_151076 ?auto_151080 ) ) ( not ( = ?auto_151076 ?auto_151081 ) ) ( not ( = ?auto_151076 ?auto_151082 ) ) ( not ( = ?auto_151077 ?auto_151078 ) ) ( not ( = ?auto_151077 ?auto_151079 ) ) ( not ( = ?auto_151077 ?auto_151080 ) ) ( not ( = ?auto_151077 ?auto_151081 ) ) ( not ( = ?auto_151077 ?auto_151082 ) ) ( not ( = ?auto_151078 ?auto_151079 ) ) ( not ( = ?auto_151078 ?auto_151080 ) ) ( not ( = ?auto_151078 ?auto_151081 ) ) ( not ( = ?auto_151078 ?auto_151082 ) ) ( not ( = ?auto_151079 ?auto_151080 ) ) ( not ( = ?auto_151079 ?auto_151081 ) ) ( not ( = ?auto_151079 ?auto_151082 ) ) ( not ( = ?auto_151080 ?auto_151081 ) ) ( not ( = ?auto_151080 ?auto_151082 ) ) ( not ( = ?auto_151081 ?auto_151082 ) ) ( ON ?auto_151080 ?auto_151081 ) ( CLEAR ?auto_151078 ) ( ON ?auto_151079 ?auto_151080 ) ( CLEAR ?auto_151079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_151073 ?auto_151074 ?auto_151075 ?auto_151076 ?auto_151077 ?auto_151078 ?auto_151079 )
      ( MAKE-9PILE ?auto_151073 ?auto_151074 ?auto_151075 ?auto_151076 ?auto_151077 ?auto_151078 ?auto_151079 ?auto_151080 ?auto_151081 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_151092 - BLOCK
      ?auto_151093 - BLOCK
      ?auto_151094 - BLOCK
      ?auto_151095 - BLOCK
      ?auto_151096 - BLOCK
      ?auto_151097 - BLOCK
      ?auto_151098 - BLOCK
      ?auto_151099 - BLOCK
      ?auto_151100 - BLOCK
    )
    :vars
    (
      ?auto_151101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151100 ?auto_151101 ) ( ON-TABLE ?auto_151092 ) ( ON ?auto_151093 ?auto_151092 ) ( ON ?auto_151094 ?auto_151093 ) ( ON ?auto_151095 ?auto_151094 ) ( ON ?auto_151096 ?auto_151095 ) ( ON ?auto_151097 ?auto_151096 ) ( not ( = ?auto_151092 ?auto_151093 ) ) ( not ( = ?auto_151092 ?auto_151094 ) ) ( not ( = ?auto_151092 ?auto_151095 ) ) ( not ( = ?auto_151092 ?auto_151096 ) ) ( not ( = ?auto_151092 ?auto_151097 ) ) ( not ( = ?auto_151092 ?auto_151098 ) ) ( not ( = ?auto_151092 ?auto_151099 ) ) ( not ( = ?auto_151092 ?auto_151100 ) ) ( not ( = ?auto_151092 ?auto_151101 ) ) ( not ( = ?auto_151093 ?auto_151094 ) ) ( not ( = ?auto_151093 ?auto_151095 ) ) ( not ( = ?auto_151093 ?auto_151096 ) ) ( not ( = ?auto_151093 ?auto_151097 ) ) ( not ( = ?auto_151093 ?auto_151098 ) ) ( not ( = ?auto_151093 ?auto_151099 ) ) ( not ( = ?auto_151093 ?auto_151100 ) ) ( not ( = ?auto_151093 ?auto_151101 ) ) ( not ( = ?auto_151094 ?auto_151095 ) ) ( not ( = ?auto_151094 ?auto_151096 ) ) ( not ( = ?auto_151094 ?auto_151097 ) ) ( not ( = ?auto_151094 ?auto_151098 ) ) ( not ( = ?auto_151094 ?auto_151099 ) ) ( not ( = ?auto_151094 ?auto_151100 ) ) ( not ( = ?auto_151094 ?auto_151101 ) ) ( not ( = ?auto_151095 ?auto_151096 ) ) ( not ( = ?auto_151095 ?auto_151097 ) ) ( not ( = ?auto_151095 ?auto_151098 ) ) ( not ( = ?auto_151095 ?auto_151099 ) ) ( not ( = ?auto_151095 ?auto_151100 ) ) ( not ( = ?auto_151095 ?auto_151101 ) ) ( not ( = ?auto_151096 ?auto_151097 ) ) ( not ( = ?auto_151096 ?auto_151098 ) ) ( not ( = ?auto_151096 ?auto_151099 ) ) ( not ( = ?auto_151096 ?auto_151100 ) ) ( not ( = ?auto_151096 ?auto_151101 ) ) ( not ( = ?auto_151097 ?auto_151098 ) ) ( not ( = ?auto_151097 ?auto_151099 ) ) ( not ( = ?auto_151097 ?auto_151100 ) ) ( not ( = ?auto_151097 ?auto_151101 ) ) ( not ( = ?auto_151098 ?auto_151099 ) ) ( not ( = ?auto_151098 ?auto_151100 ) ) ( not ( = ?auto_151098 ?auto_151101 ) ) ( not ( = ?auto_151099 ?auto_151100 ) ) ( not ( = ?auto_151099 ?auto_151101 ) ) ( not ( = ?auto_151100 ?auto_151101 ) ) ( ON ?auto_151099 ?auto_151100 ) ( CLEAR ?auto_151097 ) ( ON ?auto_151098 ?auto_151099 ) ( CLEAR ?auto_151098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_151092 ?auto_151093 ?auto_151094 ?auto_151095 ?auto_151096 ?auto_151097 ?auto_151098 )
      ( MAKE-9PILE ?auto_151092 ?auto_151093 ?auto_151094 ?auto_151095 ?auto_151096 ?auto_151097 ?auto_151098 ?auto_151099 ?auto_151100 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_151111 - BLOCK
      ?auto_151112 - BLOCK
      ?auto_151113 - BLOCK
      ?auto_151114 - BLOCK
      ?auto_151115 - BLOCK
      ?auto_151116 - BLOCK
      ?auto_151117 - BLOCK
      ?auto_151118 - BLOCK
      ?auto_151119 - BLOCK
    )
    :vars
    (
      ?auto_151120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151119 ?auto_151120 ) ( ON-TABLE ?auto_151111 ) ( ON ?auto_151112 ?auto_151111 ) ( ON ?auto_151113 ?auto_151112 ) ( ON ?auto_151114 ?auto_151113 ) ( ON ?auto_151115 ?auto_151114 ) ( not ( = ?auto_151111 ?auto_151112 ) ) ( not ( = ?auto_151111 ?auto_151113 ) ) ( not ( = ?auto_151111 ?auto_151114 ) ) ( not ( = ?auto_151111 ?auto_151115 ) ) ( not ( = ?auto_151111 ?auto_151116 ) ) ( not ( = ?auto_151111 ?auto_151117 ) ) ( not ( = ?auto_151111 ?auto_151118 ) ) ( not ( = ?auto_151111 ?auto_151119 ) ) ( not ( = ?auto_151111 ?auto_151120 ) ) ( not ( = ?auto_151112 ?auto_151113 ) ) ( not ( = ?auto_151112 ?auto_151114 ) ) ( not ( = ?auto_151112 ?auto_151115 ) ) ( not ( = ?auto_151112 ?auto_151116 ) ) ( not ( = ?auto_151112 ?auto_151117 ) ) ( not ( = ?auto_151112 ?auto_151118 ) ) ( not ( = ?auto_151112 ?auto_151119 ) ) ( not ( = ?auto_151112 ?auto_151120 ) ) ( not ( = ?auto_151113 ?auto_151114 ) ) ( not ( = ?auto_151113 ?auto_151115 ) ) ( not ( = ?auto_151113 ?auto_151116 ) ) ( not ( = ?auto_151113 ?auto_151117 ) ) ( not ( = ?auto_151113 ?auto_151118 ) ) ( not ( = ?auto_151113 ?auto_151119 ) ) ( not ( = ?auto_151113 ?auto_151120 ) ) ( not ( = ?auto_151114 ?auto_151115 ) ) ( not ( = ?auto_151114 ?auto_151116 ) ) ( not ( = ?auto_151114 ?auto_151117 ) ) ( not ( = ?auto_151114 ?auto_151118 ) ) ( not ( = ?auto_151114 ?auto_151119 ) ) ( not ( = ?auto_151114 ?auto_151120 ) ) ( not ( = ?auto_151115 ?auto_151116 ) ) ( not ( = ?auto_151115 ?auto_151117 ) ) ( not ( = ?auto_151115 ?auto_151118 ) ) ( not ( = ?auto_151115 ?auto_151119 ) ) ( not ( = ?auto_151115 ?auto_151120 ) ) ( not ( = ?auto_151116 ?auto_151117 ) ) ( not ( = ?auto_151116 ?auto_151118 ) ) ( not ( = ?auto_151116 ?auto_151119 ) ) ( not ( = ?auto_151116 ?auto_151120 ) ) ( not ( = ?auto_151117 ?auto_151118 ) ) ( not ( = ?auto_151117 ?auto_151119 ) ) ( not ( = ?auto_151117 ?auto_151120 ) ) ( not ( = ?auto_151118 ?auto_151119 ) ) ( not ( = ?auto_151118 ?auto_151120 ) ) ( not ( = ?auto_151119 ?auto_151120 ) ) ( ON ?auto_151118 ?auto_151119 ) ( ON ?auto_151117 ?auto_151118 ) ( CLEAR ?auto_151115 ) ( ON ?auto_151116 ?auto_151117 ) ( CLEAR ?auto_151116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151111 ?auto_151112 ?auto_151113 ?auto_151114 ?auto_151115 ?auto_151116 )
      ( MAKE-9PILE ?auto_151111 ?auto_151112 ?auto_151113 ?auto_151114 ?auto_151115 ?auto_151116 ?auto_151117 ?auto_151118 ?auto_151119 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_151130 - BLOCK
      ?auto_151131 - BLOCK
      ?auto_151132 - BLOCK
      ?auto_151133 - BLOCK
      ?auto_151134 - BLOCK
      ?auto_151135 - BLOCK
      ?auto_151136 - BLOCK
      ?auto_151137 - BLOCK
      ?auto_151138 - BLOCK
    )
    :vars
    (
      ?auto_151139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151138 ?auto_151139 ) ( ON-TABLE ?auto_151130 ) ( ON ?auto_151131 ?auto_151130 ) ( ON ?auto_151132 ?auto_151131 ) ( ON ?auto_151133 ?auto_151132 ) ( ON ?auto_151134 ?auto_151133 ) ( not ( = ?auto_151130 ?auto_151131 ) ) ( not ( = ?auto_151130 ?auto_151132 ) ) ( not ( = ?auto_151130 ?auto_151133 ) ) ( not ( = ?auto_151130 ?auto_151134 ) ) ( not ( = ?auto_151130 ?auto_151135 ) ) ( not ( = ?auto_151130 ?auto_151136 ) ) ( not ( = ?auto_151130 ?auto_151137 ) ) ( not ( = ?auto_151130 ?auto_151138 ) ) ( not ( = ?auto_151130 ?auto_151139 ) ) ( not ( = ?auto_151131 ?auto_151132 ) ) ( not ( = ?auto_151131 ?auto_151133 ) ) ( not ( = ?auto_151131 ?auto_151134 ) ) ( not ( = ?auto_151131 ?auto_151135 ) ) ( not ( = ?auto_151131 ?auto_151136 ) ) ( not ( = ?auto_151131 ?auto_151137 ) ) ( not ( = ?auto_151131 ?auto_151138 ) ) ( not ( = ?auto_151131 ?auto_151139 ) ) ( not ( = ?auto_151132 ?auto_151133 ) ) ( not ( = ?auto_151132 ?auto_151134 ) ) ( not ( = ?auto_151132 ?auto_151135 ) ) ( not ( = ?auto_151132 ?auto_151136 ) ) ( not ( = ?auto_151132 ?auto_151137 ) ) ( not ( = ?auto_151132 ?auto_151138 ) ) ( not ( = ?auto_151132 ?auto_151139 ) ) ( not ( = ?auto_151133 ?auto_151134 ) ) ( not ( = ?auto_151133 ?auto_151135 ) ) ( not ( = ?auto_151133 ?auto_151136 ) ) ( not ( = ?auto_151133 ?auto_151137 ) ) ( not ( = ?auto_151133 ?auto_151138 ) ) ( not ( = ?auto_151133 ?auto_151139 ) ) ( not ( = ?auto_151134 ?auto_151135 ) ) ( not ( = ?auto_151134 ?auto_151136 ) ) ( not ( = ?auto_151134 ?auto_151137 ) ) ( not ( = ?auto_151134 ?auto_151138 ) ) ( not ( = ?auto_151134 ?auto_151139 ) ) ( not ( = ?auto_151135 ?auto_151136 ) ) ( not ( = ?auto_151135 ?auto_151137 ) ) ( not ( = ?auto_151135 ?auto_151138 ) ) ( not ( = ?auto_151135 ?auto_151139 ) ) ( not ( = ?auto_151136 ?auto_151137 ) ) ( not ( = ?auto_151136 ?auto_151138 ) ) ( not ( = ?auto_151136 ?auto_151139 ) ) ( not ( = ?auto_151137 ?auto_151138 ) ) ( not ( = ?auto_151137 ?auto_151139 ) ) ( not ( = ?auto_151138 ?auto_151139 ) ) ( ON ?auto_151137 ?auto_151138 ) ( ON ?auto_151136 ?auto_151137 ) ( CLEAR ?auto_151134 ) ( ON ?auto_151135 ?auto_151136 ) ( CLEAR ?auto_151135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151130 ?auto_151131 ?auto_151132 ?auto_151133 ?auto_151134 ?auto_151135 )
      ( MAKE-9PILE ?auto_151130 ?auto_151131 ?auto_151132 ?auto_151133 ?auto_151134 ?auto_151135 ?auto_151136 ?auto_151137 ?auto_151138 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_151149 - BLOCK
      ?auto_151150 - BLOCK
      ?auto_151151 - BLOCK
      ?auto_151152 - BLOCK
      ?auto_151153 - BLOCK
      ?auto_151154 - BLOCK
      ?auto_151155 - BLOCK
      ?auto_151156 - BLOCK
      ?auto_151157 - BLOCK
    )
    :vars
    (
      ?auto_151158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151157 ?auto_151158 ) ( ON-TABLE ?auto_151149 ) ( ON ?auto_151150 ?auto_151149 ) ( ON ?auto_151151 ?auto_151150 ) ( ON ?auto_151152 ?auto_151151 ) ( not ( = ?auto_151149 ?auto_151150 ) ) ( not ( = ?auto_151149 ?auto_151151 ) ) ( not ( = ?auto_151149 ?auto_151152 ) ) ( not ( = ?auto_151149 ?auto_151153 ) ) ( not ( = ?auto_151149 ?auto_151154 ) ) ( not ( = ?auto_151149 ?auto_151155 ) ) ( not ( = ?auto_151149 ?auto_151156 ) ) ( not ( = ?auto_151149 ?auto_151157 ) ) ( not ( = ?auto_151149 ?auto_151158 ) ) ( not ( = ?auto_151150 ?auto_151151 ) ) ( not ( = ?auto_151150 ?auto_151152 ) ) ( not ( = ?auto_151150 ?auto_151153 ) ) ( not ( = ?auto_151150 ?auto_151154 ) ) ( not ( = ?auto_151150 ?auto_151155 ) ) ( not ( = ?auto_151150 ?auto_151156 ) ) ( not ( = ?auto_151150 ?auto_151157 ) ) ( not ( = ?auto_151150 ?auto_151158 ) ) ( not ( = ?auto_151151 ?auto_151152 ) ) ( not ( = ?auto_151151 ?auto_151153 ) ) ( not ( = ?auto_151151 ?auto_151154 ) ) ( not ( = ?auto_151151 ?auto_151155 ) ) ( not ( = ?auto_151151 ?auto_151156 ) ) ( not ( = ?auto_151151 ?auto_151157 ) ) ( not ( = ?auto_151151 ?auto_151158 ) ) ( not ( = ?auto_151152 ?auto_151153 ) ) ( not ( = ?auto_151152 ?auto_151154 ) ) ( not ( = ?auto_151152 ?auto_151155 ) ) ( not ( = ?auto_151152 ?auto_151156 ) ) ( not ( = ?auto_151152 ?auto_151157 ) ) ( not ( = ?auto_151152 ?auto_151158 ) ) ( not ( = ?auto_151153 ?auto_151154 ) ) ( not ( = ?auto_151153 ?auto_151155 ) ) ( not ( = ?auto_151153 ?auto_151156 ) ) ( not ( = ?auto_151153 ?auto_151157 ) ) ( not ( = ?auto_151153 ?auto_151158 ) ) ( not ( = ?auto_151154 ?auto_151155 ) ) ( not ( = ?auto_151154 ?auto_151156 ) ) ( not ( = ?auto_151154 ?auto_151157 ) ) ( not ( = ?auto_151154 ?auto_151158 ) ) ( not ( = ?auto_151155 ?auto_151156 ) ) ( not ( = ?auto_151155 ?auto_151157 ) ) ( not ( = ?auto_151155 ?auto_151158 ) ) ( not ( = ?auto_151156 ?auto_151157 ) ) ( not ( = ?auto_151156 ?auto_151158 ) ) ( not ( = ?auto_151157 ?auto_151158 ) ) ( ON ?auto_151156 ?auto_151157 ) ( ON ?auto_151155 ?auto_151156 ) ( ON ?auto_151154 ?auto_151155 ) ( CLEAR ?auto_151152 ) ( ON ?auto_151153 ?auto_151154 ) ( CLEAR ?auto_151153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_151149 ?auto_151150 ?auto_151151 ?auto_151152 ?auto_151153 )
      ( MAKE-9PILE ?auto_151149 ?auto_151150 ?auto_151151 ?auto_151152 ?auto_151153 ?auto_151154 ?auto_151155 ?auto_151156 ?auto_151157 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_151168 - BLOCK
      ?auto_151169 - BLOCK
      ?auto_151170 - BLOCK
      ?auto_151171 - BLOCK
      ?auto_151172 - BLOCK
      ?auto_151173 - BLOCK
      ?auto_151174 - BLOCK
      ?auto_151175 - BLOCK
      ?auto_151176 - BLOCK
    )
    :vars
    (
      ?auto_151177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151176 ?auto_151177 ) ( ON-TABLE ?auto_151168 ) ( ON ?auto_151169 ?auto_151168 ) ( ON ?auto_151170 ?auto_151169 ) ( ON ?auto_151171 ?auto_151170 ) ( not ( = ?auto_151168 ?auto_151169 ) ) ( not ( = ?auto_151168 ?auto_151170 ) ) ( not ( = ?auto_151168 ?auto_151171 ) ) ( not ( = ?auto_151168 ?auto_151172 ) ) ( not ( = ?auto_151168 ?auto_151173 ) ) ( not ( = ?auto_151168 ?auto_151174 ) ) ( not ( = ?auto_151168 ?auto_151175 ) ) ( not ( = ?auto_151168 ?auto_151176 ) ) ( not ( = ?auto_151168 ?auto_151177 ) ) ( not ( = ?auto_151169 ?auto_151170 ) ) ( not ( = ?auto_151169 ?auto_151171 ) ) ( not ( = ?auto_151169 ?auto_151172 ) ) ( not ( = ?auto_151169 ?auto_151173 ) ) ( not ( = ?auto_151169 ?auto_151174 ) ) ( not ( = ?auto_151169 ?auto_151175 ) ) ( not ( = ?auto_151169 ?auto_151176 ) ) ( not ( = ?auto_151169 ?auto_151177 ) ) ( not ( = ?auto_151170 ?auto_151171 ) ) ( not ( = ?auto_151170 ?auto_151172 ) ) ( not ( = ?auto_151170 ?auto_151173 ) ) ( not ( = ?auto_151170 ?auto_151174 ) ) ( not ( = ?auto_151170 ?auto_151175 ) ) ( not ( = ?auto_151170 ?auto_151176 ) ) ( not ( = ?auto_151170 ?auto_151177 ) ) ( not ( = ?auto_151171 ?auto_151172 ) ) ( not ( = ?auto_151171 ?auto_151173 ) ) ( not ( = ?auto_151171 ?auto_151174 ) ) ( not ( = ?auto_151171 ?auto_151175 ) ) ( not ( = ?auto_151171 ?auto_151176 ) ) ( not ( = ?auto_151171 ?auto_151177 ) ) ( not ( = ?auto_151172 ?auto_151173 ) ) ( not ( = ?auto_151172 ?auto_151174 ) ) ( not ( = ?auto_151172 ?auto_151175 ) ) ( not ( = ?auto_151172 ?auto_151176 ) ) ( not ( = ?auto_151172 ?auto_151177 ) ) ( not ( = ?auto_151173 ?auto_151174 ) ) ( not ( = ?auto_151173 ?auto_151175 ) ) ( not ( = ?auto_151173 ?auto_151176 ) ) ( not ( = ?auto_151173 ?auto_151177 ) ) ( not ( = ?auto_151174 ?auto_151175 ) ) ( not ( = ?auto_151174 ?auto_151176 ) ) ( not ( = ?auto_151174 ?auto_151177 ) ) ( not ( = ?auto_151175 ?auto_151176 ) ) ( not ( = ?auto_151175 ?auto_151177 ) ) ( not ( = ?auto_151176 ?auto_151177 ) ) ( ON ?auto_151175 ?auto_151176 ) ( ON ?auto_151174 ?auto_151175 ) ( ON ?auto_151173 ?auto_151174 ) ( CLEAR ?auto_151171 ) ( ON ?auto_151172 ?auto_151173 ) ( CLEAR ?auto_151172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_151168 ?auto_151169 ?auto_151170 ?auto_151171 ?auto_151172 )
      ( MAKE-9PILE ?auto_151168 ?auto_151169 ?auto_151170 ?auto_151171 ?auto_151172 ?auto_151173 ?auto_151174 ?auto_151175 ?auto_151176 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_151187 - BLOCK
      ?auto_151188 - BLOCK
      ?auto_151189 - BLOCK
      ?auto_151190 - BLOCK
      ?auto_151191 - BLOCK
      ?auto_151192 - BLOCK
      ?auto_151193 - BLOCK
      ?auto_151194 - BLOCK
      ?auto_151195 - BLOCK
    )
    :vars
    (
      ?auto_151196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151195 ?auto_151196 ) ( ON-TABLE ?auto_151187 ) ( ON ?auto_151188 ?auto_151187 ) ( ON ?auto_151189 ?auto_151188 ) ( not ( = ?auto_151187 ?auto_151188 ) ) ( not ( = ?auto_151187 ?auto_151189 ) ) ( not ( = ?auto_151187 ?auto_151190 ) ) ( not ( = ?auto_151187 ?auto_151191 ) ) ( not ( = ?auto_151187 ?auto_151192 ) ) ( not ( = ?auto_151187 ?auto_151193 ) ) ( not ( = ?auto_151187 ?auto_151194 ) ) ( not ( = ?auto_151187 ?auto_151195 ) ) ( not ( = ?auto_151187 ?auto_151196 ) ) ( not ( = ?auto_151188 ?auto_151189 ) ) ( not ( = ?auto_151188 ?auto_151190 ) ) ( not ( = ?auto_151188 ?auto_151191 ) ) ( not ( = ?auto_151188 ?auto_151192 ) ) ( not ( = ?auto_151188 ?auto_151193 ) ) ( not ( = ?auto_151188 ?auto_151194 ) ) ( not ( = ?auto_151188 ?auto_151195 ) ) ( not ( = ?auto_151188 ?auto_151196 ) ) ( not ( = ?auto_151189 ?auto_151190 ) ) ( not ( = ?auto_151189 ?auto_151191 ) ) ( not ( = ?auto_151189 ?auto_151192 ) ) ( not ( = ?auto_151189 ?auto_151193 ) ) ( not ( = ?auto_151189 ?auto_151194 ) ) ( not ( = ?auto_151189 ?auto_151195 ) ) ( not ( = ?auto_151189 ?auto_151196 ) ) ( not ( = ?auto_151190 ?auto_151191 ) ) ( not ( = ?auto_151190 ?auto_151192 ) ) ( not ( = ?auto_151190 ?auto_151193 ) ) ( not ( = ?auto_151190 ?auto_151194 ) ) ( not ( = ?auto_151190 ?auto_151195 ) ) ( not ( = ?auto_151190 ?auto_151196 ) ) ( not ( = ?auto_151191 ?auto_151192 ) ) ( not ( = ?auto_151191 ?auto_151193 ) ) ( not ( = ?auto_151191 ?auto_151194 ) ) ( not ( = ?auto_151191 ?auto_151195 ) ) ( not ( = ?auto_151191 ?auto_151196 ) ) ( not ( = ?auto_151192 ?auto_151193 ) ) ( not ( = ?auto_151192 ?auto_151194 ) ) ( not ( = ?auto_151192 ?auto_151195 ) ) ( not ( = ?auto_151192 ?auto_151196 ) ) ( not ( = ?auto_151193 ?auto_151194 ) ) ( not ( = ?auto_151193 ?auto_151195 ) ) ( not ( = ?auto_151193 ?auto_151196 ) ) ( not ( = ?auto_151194 ?auto_151195 ) ) ( not ( = ?auto_151194 ?auto_151196 ) ) ( not ( = ?auto_151195 ?auto_151196 ) ) ( ON ?auto_151194 ?auto_151195 ) ( ON ?auto_151193 ?auto_151194 ) ( ON ?auto_151192 ?auto_151193 ) ( ON ?auto_151191 ?auto_151192 ) ( CLEAR ?auto_151189 ) ( ON ?auto_151190 ?auto_151191 ) ( CLEAR ?auto_151190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151187 ?auto_151188 ?auto_151189 ?auto_151190 )
      ( MAKE-9PILE ?auto_151187 ?auto_151188 ?auto_151189 ?auto_151190 ?auto_151191 ?auto_151192 ?auto_151193 ?auto_151194 ?auto_151195 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_151206 - BLOCK
      ?auto_151207 - BLOCK
      ?auto_151208 - BLOCK
      ?auto_151209 - BLOCK
      ?auto_151210 - BLOCK
      ?auto_151211 - BLOCK
      ?auto_151212 - BLOCK
      ?auto_151213 - BLOCK
      ?auto_151214 - BLOCK
    )
    :vars
    (
      ?auto_151215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151214 ?auto_151215 ) ( ON-TABLE ?auto_151206 ) ( ON ?auto_151207 ?auto_151206 ) ( ON ?auto_151208 ?auto_151207 ) ( not ( = ?auto_151206 ?auto_151207 ) ) ( not ( = ?auto_151206 ?auto_151208 ) ) ( not ( = ?auto_151206 ?auto_151209 ) ) ( not ( = ?auto_151206 ?auto_151210 ) ) ( not ( = ?auto_151206 ?auto_151211 ) ) ( not ( = ?auto_151206 ?auto_151212 ) ) ( not ( = ?auto_151206 ?auto_151213 ) ) ( not ( = ?auto_151206 ?auto_151214 ) ) ( not ( = ?auto_151206 ?auto_151215 ) ) ( not ( = ?auto_151207 ?auto_151208 ) ) ( not ( = ?auto_151207 ?auto_151209 ) ) ( not ( = ?auto_151207 ?auto_151210 ) ) ( not ( = ?auto_151207 ?auto_151211 ) ) ( not ( = ?auto_151207 ?auto_151212 ) ) ( not ( = ?auto_151207 ?auto_151213 ) ) ( not ( = ?auto_151207 ?auto_151214 ) ) ( not ( = ?auto_151207 ?auto_151215 ) ) ( not ( = ?auto_151208 ?auto_151209 ) ) ( not ( = ?auto_151208 ?auto_151210 ) ) ( not ( = ?auto_151208 ?auto_151211 ) ) ( not ( = ?auto_151208 ?auto_151212 ) ) ( not ( = ?auto_151208 ?auto_151213 ) ) ( not ( = ?auto_151208 ?auto_151214 ) ) ( not ( = ?auto_151208 ?auto_151215 ) ) ( not ( = ?auto_151209 ?auto_151210 ) ) ( not ( = ?auto_151209 ?auto_151211 ) ) ( not ( = ?auto_151209 ?auto_151212 ) ) ( not ( = ?auto_151209 ?auto_151213 ) ) ( not ( = ?auto_151209 ?auto_151214 ) ) ( not ( = ?auto_151209 ?auto_151215 ) ) ( not ( = ?auto_151210 ?auto_151211 ) ) ( not ( = ?auto_151210 ?auto_151212 ) ) ( not ( = ?auto_151210 ?auto_151213 ) ) ( not ( = ?auto_151210 ?auto_151214 ) ) ( not ( = ?auto_151210 ?auto_151215 ) ) ( not ( = ?auto_151211 ?auto_151212 ) ) ( not ( = ?auto_151211 ?auto_151213 ) ) ( not ( = ?auto_151211 ?auto_151214 ) ) ( not ( = ?auto_151211 ?auto_151215 ) ) ( not ( = ?auto_151212 ?auto_151213 ) ) ( not ( = ?auto_151212 ?auto_151214 ) ) ( not ( = ?auto_151212 ?auto_151215 ) ) ( not ( = ?auto_151213 ?auto_151214 ) ) ( not ( = ?auto_151213 ?auto_151215 ) ) ( not ( = ?auto_151214 ?auto_151215 ) ) ( ON ?auto_151213 ?auto_151214 ) ( ON ?auto_151212 ?auto_151213 ) ( ON ?auto_151211 ?auto_151212 ) ( ON ?auto_151210 ?auto_151211 ) ( CLEAR ?auto_151208 ) ( ON ?auto_151209 ?auto_151210 ) ( CLEAR ?auto_151209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151206 ?auto_151207 ?auto_151208 ?auto_151209 )
      ( MAKE-9PILE ?auto_151206 ?auto_151207 ?auto_151208 ?auto_151209 ?auto_151210 ?auto_151211 ?auto_151212 ?auto_151213 ?auto_151214 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_151225 - BLOCK
      ?auto_151226 - BLOCK
      ?auto_151227 - BLOCK
      ?auto_151228 - BLOCK
      ?auto_151229 - BLOCK
      ?auto_151230 - BLOCK
      ?auto_151231 - BLOCK
      ?auto_151232 - BLOCK
      ?auto_151233 - BLOCK
    )
    :vars
    (
      ?auto_151234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151233 ?auto_151234 ) ( ON-TABLE ?auto_151225 ) ( ON ?auto_151226 ?auto_151225 ) ( not ( = ?auto_151225 ?auto_151226 ) ) ( not ( = ?auto_151225 ?auto_151227 ) ) ( not ( = ?auto_151225 ?auto_151228 ) ) ( not ( = ?auto_151225 ?auto_151229 ) ) ( not ( = ?auto_151225 ?auto_151230 ) ) ( not ( = ?auto_151225 ?auto_151231 ) ) ( not ( = ?auto_151225 ?auto_151232 ) ) ( not ( = ?auto_151225 ?auto_151233 ) ) ( not ( = ?auto_151225 ?auto_151234 ) ) ( not ( = ?auto_151226 ?auto_151227 ) ) ( not ( = ?auto_151226 ?auto_151228 ) ) ( not ( = ?auto_151226 ?auto_151229 ) ) ( not ( = ?auto_151226 ?auto_151230 ) ) ( not ( = ?auto_151226 ?auto_151231 ) ) ( not ( = ?auto_151226 ?auto_151232 ) ) ( not ( = ?auto_151226 ?auto_151233 ) ) ( not ( = ?auto_151226 ?auto_151234 ) ) ( not ( = ?auto_151227 ?auto_151228 ) ) ( not ( = ?auto_151227 ?auto_151229 ) ) ( not ( = ?auto_151227 ?auto_151230 ) ) ( not ( = ?auto_151227 ?auto_151231 ) ) ( not ( = ?auto_151227 ?auto_151232 ) ) ( not ( = ?auto_151227 ?auto_151233 ) ) ( not ( = ?auto_151227 ?auto_151234 ) ) ( not ( = ?auto_151228 ?auto_151229 ) ) ( not ( = ?auto_151228 ?auto_151230 ) ) ( not ( = ?auto_151228 ?auto_151231 ) ) ( not ( = ?auto_151228 ?auto_151232 ) ) ( not ( = ?auto_151228 ?auto_151233 ) ) ( not ( = ?auto_151228 ?auto_151234 ) ) ( not ( = ?auto_151229 ?auto_151230 ) ) ( not ( = ?auto_151229 ?auto_151231 ) ) ( not ( = ?auto_151229 ?auto_151232 ) ) ( not ( = ?auto_151229 ?auto_151233 ) ) ( not ( = ?auto_151229 ?auto_151234 ) ) ( not ( = ?auto_151230 ?auto_151231 ) ) ( not ( = ?auto_151230 ?auto_151232 ) ) ( not ( = ?auto_151230 ?auto_151233 ) ) ( not ( = ?auto_151230 ?auto_151234 ) ) ( not ( = ?auto_151231 ?auto_151232 ) ) ( not ( = ?auto_151231 ?auto_151233 ) ) ( not ( = ?auto_151231 ?auto_151234 ) ) ( not ( = ?auto_151232 ?auto_151233 ) ) ( not ( = ?auto_151232 ?auto_151234 ) ) ( not ( = ?auto_151233 ?auto_151234 ) ) ( ON ?auto_151232 ?auto_151233 ) ( ON ?auto_151231 ?auto_151232 ) ( ON ?auto_151230 ?auto_151231 ) ( ON ?auto_151229 ?auto_151230 ) ( ON ?auto_151228 ?auto_151229 ) ( CLEAR ?auto_151226 ) ( ON ?auto_151227 ?auto_151228 ) ( CLEAR ?auto_151227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_151225 ?auto_151226 ?auto_151227 )
      ( MAKE-9PILE ?auto_151225 ?auto_151226 ?auto_151227 ?auto_151228 ?auto_151229 ?auto_151230 ?auto_151231 ?auto_151232 ?auto_151233 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_151244 - BLOCK
      ?auto_151245 - BLOCK
      ?auto_151246 - BLOCK
      ?auto_151247 - BLOCK
      ?auto_151248 - BLOCK
      ?auto_151249 - BLOCK
      ?auto_151250 - BLOCK
      ?auto_151251 - BLOCK
      ?auto_151252 - BLOCK
    )
    :vars
    (
      ?auto_151253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151252 ?auto_151253 ) ( ON-TABLE ?auto_151244 ) ( ON ?auto_151245 ?auto_151244 ) ( not ( = ?auto_151244 ?auto_151245 ) ) ( not ( = ?auto_151244 ?auto_151246 ) ) ( not ( = ?auto_151244 ?auto_151247 ) ) ( not ( = ?auto_151244 ?auto_151248 ) ) ( not ( = ?auto_151244 ?auto_151249 ) ) ( not ( = ?auto_151244 ?auto_151250 ) ) ( not ( = ?auto_151244 ?auto_151251 ) ) ( not ( = ?auto_151244 ?auto_151252 ) ) ( not ( = ?auto_151244 ?auto_151253 ) ) ( not ( = ?auto_151245 ?auto_151246 ) ) ( not ( = ?auto_151245 ?auto_151247 ) ) ( not ( = ?auto_151245 ?auto_151248 ) ) ( not ( = ?auto_151245 ?auto_151249 ) ) ( not ( = ?auto_151245 ?auto_151250 ) ) ( not ( = ?auto_151245 ?auto_151251 ) ) ( not ( = ?auto_151245 ?auto_151252 ) ) ( not ( = ?auto_151245 ?auto_151253 ) ) ( not ( = ?auto_151246 ?auto_151247 ) ) ( not ( = ?auto_151246 ?auto_151248 ) ) ( not ( = ?auto_151246 ?auto_151249 ) ) ( not ( = ?auto_151246 ?auto_151250 ) ) ( not ( = ?auto_151246 ?auto_151251 ) ) ( not ( = ?auto_151246 ?auto_151252 ) ) ( not ( = ?auto_151246 ?auto_151253 ) ) ( not ( = ?auto_151247 ?auto_151248 ) ) ( not ( = ?auto_151247 ?auto_151249 ) ) ( not ( = ?auto_151247 ?auto_151250 ) ) ( not ( = ?auto_151247 ?auto_151251 ) ) ( not ( = ?auto_151247 ?auto_151252 ) ) ( not ( = ?auto_151247 ?auto_151253 ) ) ( not ( = ?auto_151248 ?auto_151249 ) ) ( not ( = ?auto_151248 ?auto_151250 ) ) ( not ( = ?auto_151248 ?auto_151251 ) ) ( not ( = ?auto_151248 ?auto_151252 ) ) ( not ( = ?auto_151248 ?auto_151253 ) ) ( not ( = ?auto_151249 ?auto_151250 ) ) ( not ( = ?auto_151249 ?auto_151251 ) ) ( not ( = ?auto_151249 ?auto_151252 ) ) ( not ( = ?auto_151249 ?auto_151253 ) ) ( not ( = ?auto_151250 ?auto_151251 ) ) ( not ( = ?auto_151250 ?auto_151252 ) ) ( not ( = ?auto_151250 ?auto_151253 ) ) ( not ( = ?auto_151251 ?auto_151252 ) ) ( not ( = ?auto_151251 ?auto_151253 ) ) ( not ( = ?auto_151252 ?auto_151253 ) ) ( ON ?auto_151251 ?auto_151252 ) ( ON ?auto_151250 ?auto_151251 ) ( ON ?auto_151249 ?auto_151250 ) ( ON ?auto_151248 ?auto_151249 ) ( ON ?auto_151247 ?auto_151248 ) ( CLEAR ?auto_151245 ) ( ON ?auto_151246 ?auto_151247 ) ( CLEAR ?auto_151246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_151244 ?auto_151245 ?auto_151246 )
      ( MAKE-9PILE ?auto_151244 ?auto_151245 ?auto_151246 ?auto_151247 ?auto_151248 ?auto_151249 ?auto_151250 ?auto_151251 ?auto_151252 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_151263 - BLOCK
      ?auto_151264 - BLOCK
      ?auto_151265 - BLOCK
      ?auto_151266 - BLOCK
      ?auto_151267 - BLOCK
      ?auto_151268 - BLOCK
      ?auto_151269 - BLOCK
      ?auto_151270 - BLOCK
      ?auto_151271 - BLOCK
    )
    :vars
    (
      ?auto_151272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151271 ?auto_151272 ) ( ON-TABLE ?auto_151263 ) ( not ( = ?auto_151263 ?auto_151264 ) ) ( not ( = ?auto_151263 ?auto_151265 ) ) ( not ( = ?auto_151263 ?auto_151266 ) ) ( not ( = ?auto_151263 ?auto_151267 ) ) ( not ( = ?auto_151263 ?auto_151268 ) ) ( not ( = ?auto_151263 ?auto_151269 ) ) ( not ( = ?auto_151263 ?auto_151270 ) ) ( not ( = ?auto_151263 ?auto_151271 ) ) ( not ( = ?auto_151263 ?auto_151272 ) ) ( not ( = ?auto_151264 ?auto_151265 ) ) ( not ( = ?auto_151264 ?auto_151266 ) ) ( not ( = ?auto_151264 ?auto_151267 ) ) ( not ( = ?auto_151264 ?auto_151268 ) ) ( not ( = ?auto_151264 ?auto_151269 ) ) ( not ( = ?auto_151264 ?auto_151270 ) ) ( not ( = ?auto_151264 ?auto_151271 ) ) ( not ( = ?auto_151264 ?auto_151272 ) ) ( not ( = ?auto_151265 ?auto_151266 ) ) ( not ( = ?auto_151265 ?auto_151267 ) ) ( not ( = ?auto_151265 ?auto_151268 ) ) ( not ( = ?auto_151265 ?auto_151269 ) ) ( not ( = ?auto_151265 ?auto_151270 ) ) ( not ( = ?auto_151265 ?auto_151271 ) ) ( not ( = ?auto_151265 ?auto_151272 ) ) ( not ( = ?auto_151266 ?auto_151267 ) ) ( not ( = ?auto_151266 ?auto_151268 ) ) ( not ( = ?auto_151266 ?auto_151269 ) ) ( not ( = ?auto_151266 ?auto_151270 ) ) ( not ( = ?auto_151266 ?auto_151271 ) ) ( not ( = ?auto_151266 ?auto_151272 ) ) ( not ( = ?auto_151267 ?auto_151268 ) ) ( not ( = ?auto_151267 ?auto_151269 ) ) ( not ( = ?auto_151267 ?auto_151270 ) ) ( not ( = ?auto_151267 ?auto_151271 ) ) ( not ( = ?auto_151267 ?auto_151272 ) ) ( not ( = ?auto_151268 ?auto_151269 ) ) ( not ( = ?auto_151268 ?auto_151270 ) ) ( not ( = ?auto_151268 ?auto_151271 ) ) ( not ( = ?auto_151268 ?auto_151272 ) ) ( not ( = ?auto_151269 ?auto_151270 ) ) ( not ( = ?auto_151269 ?auto_151271 ) ) ( not ( = ?auto_151269 ?auto_151272 ) ) ( not ( = ?auto_151270 ?auto_151271 ) ) ( not ( = ?auto_151270 ?auto_151272 ) ) ( not ( = ?auto_151271 ?auto_151272 ) ) ( ON ?auto_151270 ?auto_151271 ) ( ON ?auto_151269 ?auto_151270 ) ( ON ?auto_151268 ?auto_151269 ) ( ON ?auto_151267 ?auto_151268 ) ( ON ?auto_151266 ?auto_151267 ) ( ON ?auto_151265 ?auto_151266 ) ( CLEAR ?auto_151263 ) ( ON ?auto_151264 ?auto_151265 ) ( CLEAR ?auto_151264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_151263 ?auto_151264 )
      ( MAKE-9PILE ?auto_151263 ?auto_151264 ?auto_151265 ?auto_151266 ?auto_151267 ?auto_151268 ?auto_151269 ?auto_151270 ?auto_151271 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_151282 - BLOCK
      ?auto_151283 - BLOCK
      ?auto_151284 - BLOCK
      ?auto_151285 - BLOCK
      ?auto_151286 - BLOCK
      ?auto_151287 - BLOCK
      ?auto_151288 - BLOCK
      ?auto_151289 - BLOCK
      ?auto_151290 - BLOCK
    )
    :vars
    (
      ?auto_151291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151290 ?auto_151291 ) ( ON-TABLE ?auto_151282 ) ( not ( = ?auto_151282 ?auto_151283 ) ) ( not ( = ?auto_151282 ?auto_151284 ) ) ( not ( = ?auto_151282 ?auto_151285 ) ) ( not ( = ?auto_151282 ?auto_151286 ) ) ( not ( = ?auto_151282 ?auto_151287 ) ) ( not ( = ?auto_151282 ?auto_151288 ) ) ( not ( = ?auto_151282 ?auto_151289 ) ) ( not ( = ?auto_151282 ?auto_151290 ) ) ( not ( = ?auto_151282 ?auto_151291 ) ) ( not ( = ?auto_151283 ?auto_151284 ) ) ( not ( = ?auto_151283 ?auto_151285 ) ) ( not ( = ?auto_151283 ?auto_151286 ) ) ( not ( = ?auto_151283 ?auto_151287 ) ) ( not ( = ?auto_151283 ?auto_151288 ) ) ( not ( = ?auto_151283 ?auto_151289 ) ) ( not ( = ?auto_151283 ?auto_151290 ) ) ( not ( = ?auto_151283 ?auto_151291 ) ) ( not ( = ?auto_151284 ?auto_151285 ) ) ( not ( = ?auto_151284 ?auto_151286 ) ) ( not ( = ?auto_151284 ?auto_151287 ) ) ( not ( = ?auto_151284 ?auto_151288 ) ) ( not ( = ?auto_151284 ?auto_151289 ) ) ( not ( = ?auto_151284 ?auto_151290 ) ) ( not ( = ?auto_151284 ?auto_151291 ) ) ( not ( = ?auto_151285 ?auto_151286 ) ) ( not ( = ?auto_151285 ?auto_151287 ) ) ( not ( = ?auto_151285 ?auto_151288 ) ) ( not ( = ?auto_151285 ?auto_151289 ) ) ( not ( = ?auto_151285 ?auto_151290 ) ) ( not ( = ?auto_151285 ?auto_151291 ) ) ( not ( = ?auto_151286 ?auto_151287 ) ) ( not ( = ?auto_151286 ?auto_151288 ) ) ( not ( = ?auto_151286 ?auto_151289 ) ) ( not ( = ?auto_151286 ?auto_151290 ) ) ( not ( = ?auto_151286 ?auto_151291 ) ) ( not ( = ?auto_151287 ?auto_151288 ) ) ( not ( = ?auto_151287 ?auto_151289 ) ) ( not ( = ?auto_151287 ?auto_151290 ) ) ( not ( = ?auto_151287 ?auto_151291 ) ) ( not ( = ?auto_151288 ?auto_151289 ) ) ( not ( = ?auto_151288 ?auto_151290 ) ) ( not ( = ?auto_151288 ?auto_151291 ) ) ( not ( = ?auto_151289 ?auto_151290 ) ) ( not ( = ?auto_151289 ?auto_151291 ) ) ( not ( = ?auto_151290 ?auto_151291 ) ) ( ON ?auto_151289 ?auto_151290 ) ( ON ?auto_151288 ?auto_151289 ) ( ON ?auto_151287 ?auto_151288 ) ( ON ?auto_151286 ?auto_151287 ) ( ON ?auto_151285 ?auto_151286 ) ( ON ?auto_151284 ?auto_151285 ) ( CLEAR ?auto_151282 ) ( ON ?auto_151283 ?auto_151284 ) ( CLEAR ?auto_151283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_151282 ?auto_151283 )
      ( MAKE-9PILE ?auto_151282 ?auto_151283 ?auto_151284 ?auto_151285 ?auto_151286 ?auto_151287 ?auto_151288 ?auto_151289 ?auto_151290 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_151301 - BLOCK
      ?auto_151302 - BLOCK
      ?auto_151303 - BLOCK
      ?auto_151304 - BLOCK
      ?auto_151305 - BLOCK
      ?auto_151306 - BLOCK
      ?auto_151307 - BLOCK
      ?auto_151308 - BLOCK
      ?auto_151309 - BLOCK
    )
    :vars
    (
      ?auto_151310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151309 ?auto_151310 ) ( not ( = ?auto_151301 ?auto_151302 ) ) ( not ( = ?auto_151301 ?auto_151303 ) ) ( not ( = ?auto_151301 ?auto_151304 ) ) ( not ( = ?auto_151301 ?auto_151305 ) ) ( not ( = ?auto_151301 ?auto_151306 ) ) ( not ( = ?auto_151301 ?auto_151307 ) ) ( not ( = ?auto_151301 ?auto_151308 ) ) ( not ( = ?auto_151301 ?auto_151309 ) ) ( not ( = ?auto_151301 ?auto_151310 ) ) ( not ( = ?auto_151302 ?auto_151303 ) ) ( not ( = ?auto_151302 ?auto_151304 ) ) ( not ( = ?auto_151302 ?auto_151305 ) ) ( not ( = ?auto_151302 ?auto_151306 ) ) ( not ( = ?auto_151302 ?auto_151307 ) ) ( not ( = ?auto_151302 ?auto_151308 ) ) ( not ( = ?auto_151302 ?auto_151309 ) ) ( not ( = ?auto_151302 ?auto_151310 ) ) ( not ( = ?auto_151303 ?auto_151304 ) ) ( not ( = ?auto_151303 ?auto_151305 ) ) ( not ( = ?auto_151303 ?auto_151306 ) ) ( not ( = ?auto_151303 ?auto_151307 ) ) ( not ( = ?auto_151303 ?auto_151308 ) ) ( not ( = ?auto_151303 ?auto_151309 ) ) ( not ( = ?auto_151303 ?auto_151310 ) ) ( not ( = ?auto_151304 ?auto_151305 ) ) ( not ( = ?auto_151304 ?auto_151306 ) ) ( not ( = ?auto_151304 ?auto_151307 ) ) ( not ( = ?auto_151304 ?auto_151308 ) ) ( not ( = ?auto_151304 ?auto_151309 ) ) ( not ( = ?auto_151304 ?auto_151310 ) ) ( not ( = ?auto_151305 ?auto_151306 ) ) ( not ( = ?auto_151305 ?auto_151307 ) ) ( not ( = ?auto_151305 ?auto_151308 ) ) ( not ( = ?auto_151305 ?auto_151309 ) ) ( not ( = ?auto_151305 ?auto_151310 ) ) ( not ( = ?auto_151306 ?auto_151307 ) ) ( not ( = ?auto_151306 ?auto_151308 ) ) ( not ( = ?auto_151306 ?auto_151309 ) ) ( not ( = ?auto_151306 ?auto_151310 ) ) ( not ( = ?auto_151307 ?auto_151308 ) ) ( not ( = ?auto_151307 ?auto_151309 ) ) ( not ( = ?auto_151307 ?auto_151310 ) ) ( not ( = ?auto_151308 ?auto_151309 ) ) ( not ( = ?auto_151308 ?auto_151310 ) ) ( not ( = ?auto_151309 ?auto_151310 ) ) ( ON ?auto_151308 ?auto_151309 ) ( ON ?auto_151307 ?auto_151308 ) ( ON ?auto_151306 ?auto_151307 ) ( ON ?auto_151305 ?auto_151306 ) ( ON ?auto_151304 ?auto_151305 ) ( ON ?auto_151303 ?auto_151304 ) ( ON ?auto_151302 ?auto_151303 ) ( ON ?auto_151301 ?auto_151302 ) ( CLEAR ?auto_151301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_151301 )
      ( MAKE-9PILE ?auto_151301 ?auto_151302 ?auto_151303 ?auto_151304 ?auto_151305 ?auto_151306 ?auto_151307 ?auto_151308 ?auto_151309 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_151320 - BLOCK
      ?auto_151321 - BLOCK
      ?auto_151322 - BLOCK
      ?auto_151323 - BLOCK
      ?auto_151324 - BLOCK
      ?auto_151325 - BLOCK
      ?auto_151326 - BLOCK
      ?auto_151327 - BLOCK
      ?auto_151328 - BLOCK
    )
    :vars
    (
      ?auto_151329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151328 ?auto_151329 ) ( not ( = ?auto_151320 ?auto_151321 ) ) ( not ( = ?auto_151320 ?auto_151322 ) ) ( not ( = ?auto_151320 ?auto_151323 ) ) ( not ( = ?auto_151320 ?auto_151324 ) ) ( not ( = ?auto_151320 ?auto_151325 ) ) ( not ( = ?auto_151320 ?auto_151326 ) ) ( not ( = ?auto_151320 ?auto_151327 ) ) ( not ( = ?auto_151320 ?auto_151328 ) ) ( not ( = ?auto_151320 ?auto_151329 ) ) ( not ( = ?auto_151321 ?auto_151322 ) ) ( not ( = ?auto_151321 ?auto_151323 ) ) ( not ( = ?auto_151321 ?auto_151324 ) ) ( not ( = ?auto_151321 ?auto_151325 ) ) ( not ( = ?auto_151321 ?auto_151326 ) ) ( not ( = ?auto_151321 ?auto_151327 ) ) ( not ( = ?auto_151321 ?auto_151328 ) ) ( not ( = ?auto_151321 ?auto_151329 ) ) ( not ( = ?auto_151322 ?auto_151323 ) ) ( not ( = ?auto_151322 ?auto_151324 ) ) ( not ( = ?auto_151322 ?auto_151325 ) ) ( not ( = ?auto_151322 ?auto_151326 ) ) ( not ( = ?auto_151322 ?auto_151327 ) ) ( not ( = ?auto_151322 ?auto_151328 ) ) ( not ( = ?auto_151322 ?auto_151329 ) ) ( not ( = ?auto_151323 ?auto_151324 ) ) ( not ( = ?auto_151323 ?auto_151325 ) ) ( not ( = ?auto_151323 ?auto_151326 ) ) ( not ( = ?auto_151323 ?auto_151327 ) ) ( not ( = ?auto_151323 ?auto_151328 ) ) ( not ( = ?auto_151323 ?auto_151329 ) ) ( not ( = ?auto_151324 ?auto_151325 ) ) ( not ( = ?auto_151324 ?auto_151326 ) ) ( not ( = ?auto_151324 ?auto_151327 ) ) ( not ( = ?auto_151324 ?auto_151328 ) ) ( not ( = ?auto_151324 ?auto_151329 ) ) ( not ( = ?auto_151325 ?auto_151326 ) ) ( not ( = ?auto_151325 ?auto_151327 ) ) ( not ( = ?auto_151325 ?auto_151328 ) ) ( not ( = ?auto_151325 ?auto_151329 ) ) ( not ( = ?auto_151326 ?auto_151327 ) ) ( not ( = ?auto_151326 ?auto_151328 ) ) ( not ( = ?auto_151326 ?auto_151329 ) ) ( not ( = ?auto_151327 ?auto_151328 ) ) ( not ( = ?auto_151327 ?auto_151329 ) ) ( not ( = ?auto_151328 ?auto_151329 ) ) ( ON ?auto_151327 ?auto_151328 ) ( ON ?auto_151326 ?auto_151327 ) ( ON ?auto_151325 ?auto_151326 ) ( ON ?auto_151324 ?auto_151325 ) ( ON ?auto_151323 ?auto_151324 ) ( ON ?auto_151322 ?auto_151323 ) ( ON ?auto_151321 ?auto_151322 ) ( ON ?auto_151320 ?auto_151321 ) ( CLEAR ?auto_151320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_151320 )
      ( MAKE-9PILE ?auto_151320 ?auto_151321 ?auto_151322 ?auto_151323 ?auto_151324 ?auto_151325 ?auto_151326 ?auto_151327 ?auto_151328 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_151340 - BLOCK
      ?auto_151341 - BLOCK
      ?auto_151342 - BLOCK
      ?auto_151343 - BLOCK
      ?auto_151344 - BLOCK
      ?auto_151345 - BLOCK
      ?auto_151346 - BLOCK
      ?auto_151347 - BLOCK
      ?auto_151348 - BLOCK
      ?auto_151349 - BLOCK
    )
    :vars
    (
      ?auto_151350 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_151348 ) ( ON ?auto_151349 ?auto_151350 ) ( CLEAR ?auto_151349 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_151340 ) ( ON ?auto_151341 ?auto_151340 ) ( ON ?auto_151342 ?auto_151341 ) ( ON ?auto_151343 ?auto_151342 ) ( ON ?auto_151344 ?auto_151343 ) ( ON ?auto_151345 ?auto_151344 ) ( ON ?auto_151346 ?auto_151345 ) ( ON ?auto_151347 ?auto_151346 ) ( ON ?auto_151348 ?auto_151347 ) ( not ( = ?auto_151340 ?auto_151341 ) ) ( not ( = ?auto_151340 ?auto_151342 ) ) ( not ( = ?auto_151340 ?auto_151343 ) ) ( not ( = ?auto_151340 ?auto_151344 ) ) ( not ( = ?auto_151340 ?auto_151345 ) ) ( not ( = ?auto_151340 ?auto_151346 ) ) ( not ( = ?auto_151340 ?auto_151347 ) ) ( not ( = ?auto_151340 ?auto_151348 ) ) ( not ( = ?auto_151340 ?auto_151349 ) ) ( not ( = ?auto_151340 ?auto_151350 ) ) ( not ( = ?auto_151341 ?auto_151342 ) ) ( not ( = ?auto_151341 ?auto_151343 ) ) ( not ( = ?auto_151341 ?auto_151344 ) ) ( not ( = ?auto_151341 ?auto_151345 ) ) ( not ( = ?auto_151341 ?auto_151346 ) ) ( not ( = ?auto_151341 ?auto_151347 ) ) ( not ( = ?auto_151341 ?auto_151348 ) ) ( not ( = ?auto_151341 ?auto_151349 ) ) ( not ( = ?auto_151341 ?auto_151350 ) ) ( not ( = ?auto_151342 ?auto_151343 ) ) ( not ( = ?auto_151342 ?auto_151344 ) ) ( not ( = ?auto_151342 ?auto_151345 ) ) ( not ( = ?auto_151342 ?auto_151346 ) ) ( not ( = ?auto_151342 ?auto_151347 ) ) ( not ( = ?auto_151342 ?auto_151348 ) ) ( not ( = ?auto_151342 ?auto_151349 ) ) ( not ( = ?auto_151342 ?auto_151350 ) ) ( not ( = ?auto_151343 ?auto_151344 ) ) ( not ( = ?auto_151343 ?auto_151345 ) ) ( not ( = ?auto_151343 ?auto_151346 ) ) ( not ( = ?auto_151343 ?auto_151347 ) ) ( not ( = ?auto_151343 ?auto_151348 ) ) ( not ( = ?auto_151343 ?auto_151349 ) ) ( not ( = ?auto_151343 ?auto_151350 ) ) ( not ( = ?auto_151344 ?auto_151345 ) ) ( not ( = ?auto_151344 ?auto_151346 ) ) ( not ( = ?auto_151344 ?auto_151347 ) ) ( not ( = ?auto_151344 ?auto_151348 ) ) ( not ( = ?auto_151344 ?auto_151349 ) ) ( not ( = ?auto_151344 ?auto_151350 ) ) ( not ( = ?auto_151345 ?auto_151346 ) ) ( not ( = ?auto_151345 ?auto_151347 ) ) ( not ( = ?auto_151345 ?auto_151348 ) ) ( not ( = ?auto_151345 ?auto_151349 ) ) ( not ( = ?auto_151345 ?auto_151350 ) ) ( not ( = ?auto_151346 ?auto_151347 ) ) ( not ( = ?auto_151346 ?auto_151348 ) ) ( not ( = ?auto_151346 ?auto_151349 ) ) ( not ( = ?auto_151346 ?auto_151350 ) ) ( not ( = ?auto_151347 ?auto_151348 ) ) ( not ( = ?auto_151347 ?auto_151349 ) ) ( not ( = ?auto_151347 ?auto_151350 ) ) ( not ( = ?auto_151348 ?auto_151349 ) ) ( not ( = ?auto_151348 ?auto_151350 ) ) ( not ( = ?auto_151349 ?auto_151350 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_151349 ?auto_151350 )
      ( !STACK ?auto_151349 ?auto_151348 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_151361 - BLOCK
      ?auto_151362 - BLOCK
      ?auto_151363 - BLOCK
      ?auto_151364 - BLOCK
      ?auto_151365 - BLOCK
      ?auto_151366 - BLOCK
      ?auto_151367 - BLOCK
      ?auto_151368 - BLOCK
      ?auto_151369 - BLOCK
      ?auto_151370 - BLOCK
    )
    :vars
    (
      ?auto_151371 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_151369 ) ( ON ?auto_151370 ?auto_151371 ) ( CLEAR ?auto_151370 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_151361 ) ( ON ?auto_151362 ?auto_151361 ) ( ON ?auto_151363 ?auto_151362 ) ( ON ?auto_151364 ?auto_151363 ) ( ON ?auto_151365 ?auto_151364 ) ( ON ?auto_151366 ?auto_151365 ) ( ON ?auto_151367 ?auto_151366 ) ( ON ?auto_151368 ?auto_151367 ) ( ON ?auto_151369 ?auto_151368 ) ( not ( = ?auto_151361 ?auto_151362 ) ) ( not ( = ?auto_151361 ?auto_151363 ) ) ( not ( = ?auto_151361 ?auto_151364 ) ) ( not ( = ?auto_151361 ?auto_151365 ) ) ( not ( = ?auto_151361 ?auto_151366 ) ) ( not ( = ?auto_151361 ?auto_151367 ) ) ( not ( = ?auto_151361 ?auto_151368 ) ) ( not ( = ?auto_151361 ?auto_151369 ) ) ( not ( = ?auto_151361 ?auto_151370 ) ) ( not ( = ?auto_151361 ?auto_151371 ) ) ( not ( = ?auto_151362 ?auto_151363 ) ) ( not ( = ?auto_151362 ?auto_151364 ) ) ( not ( = ?auto_151362 ?auto_151365 ) ) ( not ( = ?auto_151362 ?auto_151366 ) ) ( not ( = ?auto_151362 ?auto_151367 ) ) ( not ( = ?auto_151362 ?auto_151368 ) ) ( not ( = ?auto_151362 ?auto_151369 ) ) ( not ( = ?auto_151362 ?auto_151370 ) ) ( not ( = ?auto_151362 ?auto_151371 ) ) ( not ( = ?auto_151363 ?auto_151364 ) ) ( not ( = ?auto_151363 ?auto_151365 ) ) ( not ( = ?auto_151363 ?auto_151366 ) ) ( not ( = ?auto_151363 ?auto_151367 ) ) ( not ( = ?auto_151363 ?auto_151368 ) ) ( not ( = ?auto_151363 ?auto_151369 ) ) ( not ( = ?auto_151363 ?auto_151370 ) ) ( not ( = ?auto_151363 ?auto_151371 ) ) ( not ( = ?auto_151364 ?auto_151365 ) ) ( not ( = ?auto_151364 ?auto_151366 ) ) ( not ( = ?auto_151364 ?auto_151367 ) ) ( not ( = ?auto_151364 ?auto_151368 ) ) ( not ( = ?auto_151364 ?auto_151369 ) ) ( not ( = ?auto_151364 ?auto_151370 ) ) ( not ( = ?auto_151364 ?auto_151371 ) ) ( not ( = ?auto_151365 ?auto_151366 ) ) ( not ( = ?auto_151365 ?auto_151367 ) ) ( not ( = ?auto_151365 ?auto_151368 ) ) ( not ( = ?auto_151365 ?auto_151369 ) ) ( not ( = ?auto_151365 ?auto_151370 ) ) ( not ( = ?auto_151365 ?auto_151371 ) ) ( not ( = ?auto_151366 ?auto_151367 ) ) ( not ( = ?auto_151366 ?auto_151368 ) ) ( not ( = ?auto_151366 ?auto_151369 ) ) ( not ( = ?auto_151366 ?auto_151370 ) ) ( not ( = ?auto_151366 ?auto_151371 ) ) ( not ( = ?auto_151367 ?auto_151368 ) ) ( not ( = ?auto_151367 ?auto_151369 ) ) ( not ( = ?auto_151367 ?auto_151370 ) ) ( not ( = ?auto_151367 ?auto_151371 ) ) ( not ( = ?auto_151368 ?auto_151369 ) ) ( not ( = ?auto_151368 ?auto_151370 ) ) ( not ( = ?auto_151368 ?auto_151371 ) ) ( not ( = ?auto_151369 ?auto_151370 ) ) ( not ( = ?auto_151369 ?auto_151371 ) ) ( not ( = ?auto_151370 ?auto_151371 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_151370 ?auto_151371 )
      ( !STACK ?auto_151370 ?auto_151369 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_151382 - BLOCK
      ?auto_151383 - BLOCK
      ?auto_151384 - BLOCK
      ?auto_151385 - BLOCK
      ?auto_151386 - BLOCK
      ?auto_151387 - BLOCK
      ?auto_151388 - BLOCK
      ?auto_151389 - BLOCK
      ?auto_151390 - BLOCK
      ?auto_151391 - BLOCK
    )
    :vars
    (
      ?auto_151392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151391 ?auto_151392 ) ( ON-TABLE ?auto_151382 ) ( ON ?auto_151383 ?auto_151382 ) ( ON ?auto_151384 ?auto_151383 ) ( ON ?auto_151385 ?auto_151384 ) ( ON ?auto_151386 ?auto_151385 ) ( ON ?auto_151387 ?auto_151386 ) ( ON ?auto_151388 ?auto_151387 ) ( ON ?auto_151389 ?auto_151388 ) ( not ( = ?auto_151382 ?auto_151383 ) ) ( not ( = ?auto_151382 ?auto_151384 ) ) ( not ( = ?auto_151382 ?auto_151385 ) ) ( not ( = ?auto_151382 ?auto_151386 ) ) ( not ( = ?auto_151382 ?auto_151387 ) ) ( not ( = ?auto_151382 ?auto_151388 ) ) ( not ( = ?auto_151382 ?auto_151389 ) ) ( not ( = ?auto_151382 ?auto_151390 ) ) ( not ( = ?auto_151382 ?auto_151391 ) ) ( not ( = ?auto_151382 ?auto_151392 ) ) ( not ( = ?auto_151383 ?auto_151384 ) ) ( not ( = ?auto_151383 ?auto_151385 ) ) ( not ( = ?auto_151383 ?auto_151386 ) ) ( not ( = ?auto_151383 ?auto_151387 ) ) ( not ( = ?auto_151383 ?auto_151388 ) ) ( not ( = ?auto_151383 ?auto_151389 ) ) ( not ( = ?auto_151383 ?auto_151390 ) ) ( not ( = ?auto_151383 ?auto_151391 ) ) ( not ( = ?auto_151383 ?auto_151392 ) ) ( not ( = ?auto_151384 ?auto_151385 ) ) ( not ( = ?auto_151384 ?auto_151386 ) ) ( not ( = ?auto_151384 ?auto_151387 ) ) ( not ( = ?auto_151384 ?auto_151388 ) ) ( not ( = ?auto_151384 ?auto_151389 ) ) ( not ( = ?auto_151384 ?auto_151390 ) ) ( not ( = ?auto_151384 ?auto_151391 ) ) ( not ( = ?auto_151384 ?auto_151392 ) ) ( not ( = ?auto_151385 ?auto_151386 ) ) ( not ( = ?auto_151385 ?auto_151387 ) ) ( not ( = ?auto_151385 ?auto_151388 ) ) ( not ( = ?auto_151385 ?auto_151389 ) ) ( not ( = ?auto_151385 ?auto_151390 ) ) ( not ( = ?auto_151385 ?auto_151391 ) ) ( not ( = ?auto_151385 ?auto_151392 ) ) ( not ( = ?auto_151386 ?auto_151387 ) ) ( not ( = ?auto_151386 ?auto_151388 ) ) ( not ( = ?auto_151386 ?auto_151389 ) ) ( not ( = ?auto_151386 ?auto_151390 ) ) ( not ( = ?auto_151386 ?auto_151391 ) ) ( not ( = ?auto_151386 ?auto_151392 ) ) ( not ( = ?auto_151387 ?auto_151388 ) ) ( not ( = ?auto_151387 ?auto_151389 ) ) ( not ( = ?auto_151387 ?auto_151390 ) ) ( not ( = ?auto_151387 ?auto_151391 ) ) ( not ( = ?auto_151387 ?auto_151392 ) ) ( not ( = ?auto_151388 ?auto_151389 ) ) ( not ( = ?auto_151388 ?auto_151390 ) ) ( not ( = ?auto_151388 ?auto_151391 ) ) ( not ( = ?auto_151388 ?auto_151392 ) ) ( not ( = ?auto_151389 ?auto_151390 ) ) ( not ( = ?auto_151389 ?auto_151391 ) ) ( not ( = ?auto_151389 ?auto_151392 ) ) ( not ( = ?auto_151390 ?auto_151391 ) ) ( not ( = ?auto_151390 ?auto_151392 ) ) ( not ( = ?auto_151391 ?auto_151392 ) ) ( CLEAR ?auto_151389 ) ( ON ?auto_151390 ?auto_151391 ) ( CLEAR ?auto_151390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_151382 ?auto_151383 ?auto_151384 ?auto_151385 ?auto_151386 ?auto_151387 ?auto_151388 ?auto_151389 ?auto_151390 )
      ( MAKE-10PILE ?auto_151382 ?auto_151383 ?auto_151384 ?auto_151385 ?auto_151386 ?auto_151387 ?auto_151388 ?auto_151389 ?auto_151390 ?auto_151391 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_151403 - BLOCK
      ?auto_151404 - BLOCK
      ?auto_151405 - BLOCK
      ?auto_151406 - BLOCK
      ?auto_151407 - BLOCK
      ?auto_151408 - BLOCK
      ?auto_151409 - BLOCK
      ?auto_151410 - BLOCK
      ?auto_151411 - BLOCK
      ?auto_151412 - BLOCK
    )
    :vars
    (
      ?auto_151413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151412 ?auto_151413 ) ( ON-TABLE ?auto_151403 ) ( ON ?auto_151404 ?auto_151403 ) ( ON ?auto_151405 ?auto_151404 ) ( ON ?auto_151406 ?auto_151405 ) ( ON ?auto_151407 ?auto_151406 ) ( ON ?auto_151408 ?auto_151407 ) ( ON ?auto_151409 ?auto_151408 ) ( ON ?auto_151410 ?auto_151409 ) ( not ( = ?auto_151403 ?auto_151404 ) ) ( not ( = ?auto_151403 ?auto_151405 ) ) ( not ( = ?auto_151403 ?auto_151406 ) ) ( not ( = ?auto_151403 ?auto_151407 ) ) ( not ( = ?auto_151403 ?auto_151408 ) ) ( not ( = ?auto_151403 ?auto_151409 ) ) ( not ( = ?auto_151403 ?auto_151410 ) ) ( not ( = ?auto_151403 ?auto_151411 ) ) ( not ( = ?auto_151403 ?auto_151412 ) ) ( not ( = ?auto_151403 ?auto_151413 ) ) ( not ( = ?auto_151404 ?auto_151405 ) ) ( not ( = ?auto_151404 ?auto_151406 ) ) ( not ( = ?auto_151404 ?auto_151407 ) ) ( not ( = ?auto_151404 ?auto_151408 ) ) ( not ( = ?auto_151404 ?auto_151409 ) ) ( not ( = ?auto_151404 ?auto_151410 ) ) ( not ( = ?auto_151404 ?auto_151411 ) ) ( not ( = ?auto_151404 ?auto_151412 ) ) ( not ( = ?auto_151404 ?auto_151413 ) ) ( not ( = ?auto_151405 ?auto_151406 ) ) ( not ( = ?auto_151405 ?auto_151407 ) ) ( not ( = ?auto_151405 ?auto_151408 ) ) ( not ( = ?auto_151405 ?auto_151409 ) ) ( not ( = ?auto_151405 ?auto_151410 ) ) ( not ( = ?auto_151405 ?auto_151411 ) ) ( not ( = ?auto_151405 ?auto_151412 ) ) ( not ( = ?auto_151405 ?auto_151413 ) ) ( not ( = ?auto_151406 ?auto_151407 ) ) ( not ( = ?auto_151406 ?auto_151408 ) ) ( not ( = ?auto_151406 ?auto_151409 ) ) ( not ( = ?auto_151406 ?auto_151410 ) ) ( not ( = ?auto_151406 ?auto_151411 ) ) ( not ( = ?auto_151406 ?auto_151412 ) ) ( not ( = ?auto_151406 ?auto_151413 ) ) ( not ( = ?auto_151407 ?auto_151408 ) ) ( not ( = ?auto_151407 ?auto_151409 ) ) ( not ( = ?auto_151407 ?auto_151410 ) ) ( not ( = ?auto_151407 ?auto_151411 ) ) ( not ( = ?auto_151407 ?auto_151412 ) ) ( not ( = ?auto_151407 ?auto_151413 ) ) ( not ( = ?auto_151408 ?auto_151409 ) ) ( not ( = ?auto_151408 ?auto_151410 ) ) ( not ( = ?auto_151408 ?auto_151411 ) ) ( not ( = ?auto_151408 ?auto_151412 ) ) ( not ( = ?auto_151408 ?auto_151413 ) ) ( not ( = ?auto_151409 ?auto_151410 ) ) ( not ( = ?auto_151409 ?auto_151411 ) ) ( not ( = ?auto_151409 ?auto_151412 ) ) ( not ( = ?auto_151409 ?auto_151413 ) ) ( not ( = ?auto_151410 ?auto_151411 ) ) ( not ( = ?auto_151410 ?auto_151412 ) ) ( not ( = ?auto_151410 ?auto_151413 ) ) ( not ( = ?auto_151411 ?auto_151412 ) ) ( not ( = ?auto_151411 ?auto_151413 ) ) ( not ( = ?auto_151412 ?auto_151413 ) ) ( CLEAR ?auto_151410 ) ( ON ?auto_151411 ?auto_151412 ) ( CLEAR ?auto_151411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_151403 ?auto_151404 ?auto_151405 ?auto_151406 ?auto_151407 ?auto_151408 ?auto_151409 ?auto_151410 ?auto_151411 )
      ( MAKE-10PILE ?auto_151403 ?auto_151404 ?auto_151405 ?auto_151406 ?auto_151407 ?auto_151408 ?auto_151409 ?auto_151410 ?auto_151411 ?auto_151412 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_151424 - BLOCK
      ?auto_151425 - BLOCK
      ?auto_151426 - BLOCK
      ?auto_151427 - BLOCK
      ?auto_151428 - BLOCK
      ?auto_151429 - BLOCK
      ?auto_151430 - BLOCK
      ?auto_151431 - BLOCK
      ?auto_151432 - BLOCK
      ?auto_151433 - BLOCK
    )
    :vars
    (
      ?auto_151434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151433 ?auto_151434 ) ( ON-TABLE ?auto_151424 ) ( ON ?auto_151425 ?auto_151424 ) ( ON ?auto_151426 ?auto_151425 ) ( ON ?auto_151427 ?auto_151426 ) ( ON ?auto_151428 ?auto_151427 ) ( ON ?auto_151429 ?auto_151428 ) ( ON ?auto_151430 ?auto_151429 ) ( not ( = ?auto_151424 ?auto_151425 ) ) ( not ( = ?auto_151424 ?auto_151426 ) ) ( not ( = ?auto_151424 ?auto_151427 ) ) ( not ( = ?auto_151424 ?auto_151428 ) ) ( not ( = ?auto_151424 ?auto_151429 ) ) ( not ( = ?auto_151424 ?auto_151430 ) ) ( not ( = ?auto_151424 ?auto_151431 ) ) ( not ( = ?auto_151424 ?auto_151432 ) ) ( not ( = ?auto_151424 ?auto_151433 ) ) ( not ( = ?auto_151424 ?auto_151434 ) ) ( not ( = ?auto_151425 ?auto_151426 ) ) ( not ( = ?auto_151425 ?auto_151427 ) ) ( not ( = ?auto_151425 ?auto_151428 ) ) ( not ( = ?auto_151425 ?auto_151429 ) ) ( not ( = ?auto_151425 ?auto_151430 ) ) ( not ( = ?auto_151425 ?auto_151431 ) ) ( not ( = ?auto_151425 ?auto_151432 ) ) ( not ( = ?auto_151425 ?auto_151433 ) ) ( not ( = ?auto_151425 ?auto_151434 ) ) ( not ( = ?auto_151426 ?auto_151427 ) ) ( not ( = ?auto_151426 ?auto_151428 ) ) ( not ( = ?auto_151426 ?auto_151429 ) ) ( not ( = ?auto_151426 ?auto_151430 ) ) ( not ( = ?auto_151426 ?auto_151431 ) ) ( not ( = ?auto_151426 ?auto_151432 ) ) ( not ( = ?auto_151426 ?auto_151433 ) ) ( not ( = ?auto_151426 ?auto_151434 ) ) ( not ( = ?auto_151427 ?auto_151428 ) ) ( not ( = ?auto_151427 ?auto_151429 ) ) ( not ( = ?auto_151427 ?auto_151430 ) ) ( not ( = ?auto_151427 ?auto_151431 ) ) ( not ( = ?auto_151427 ?auto_151432 ) ) ( not ( = ?auto_151427 ?auto_151433 ) ) ( not ( = ?auto_151427 ?auto_151434 ) ) ( not ( = ?auto_151428 ?auto_151429 ) ) ( not ( = ?auto_151428 ?auto_151430 ) ) ( not ( = ?auto_151428 ?auto_151431 ) ) ( not ( = ?auto_151428 ?auto_151432 ) ) ( not ( = ?auto_151428 ?auto_151433 ) ) ( not ( = ?auto_151428 ?auto_151434 ) ) ( not ( = ?auto_151429 ?auto_151430 ) ) ( not ( = ?auto_151429 ?auto_151431 ) ) ( not ( = ?auto_151429 ?auto_151432 ) ) ( not ( = ?auto_151429 ?auto_151433 ) ) ( not ( = ?auto_151429 ?auto_151434 ) ) ( not ( = ?auto_151430 ?auto_151431 ) ) ( not ( = ?auto_151430 ?auto_151432 ) ) ( not ( = ?auto_151430 ?auto_151433 ) ) ( not ( = ?auto_151430 ?auto_151434 ) ) ( not ( = ?auto_151431 ?auto_151432 ) ) ( not ( = ?auto_151431 ?auto_151433 ) ) ( not ( = ?auto_151431 ?auto_151434 ) ) ( not ( = ?auto_151432 ?auto_151433 ) ) ( not ( = ?auto_151432 ?auto_151434 ) ) ( not ( = ?auto_151433 ?auto_151434 ) ) ( ON ?auto_151432 ?auto_151433 ) ( CLEAR ?auto_151430 ) ( ON ?auto_151431 ?auto_151432 ) ( CLEAR ?auto_151431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_151424 ?auto_151425 ?auto_151426 ?auto_151427 ?auto_151428 ?auto_151429 ?auto_151430 ?auto_151431 )
      ( MAKE-10PILE ?auto_151424 ?auto_151425 ?auto_151426 ?auto_151427 ?auto_151428 ?auto_151429 ?auto_151430 ?auto_151431 ?auto_151432 ?auto_151433 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_151445 - BLOCK
      ?auto_151446 - BLOCK
      ?auto_151447 - BLOCK
      ?auto_151448 - BLOCK
      ?auto_151449 - BLOCK
      ?auto_151450 - BLOCK
      ?auto_151451 - BLOCK
      ?auto_151452 - BLOCK
      ?auto_151453 - BLOCK
      ?auto_151454 - BLOCK
    )
    :vars
    (
      ?auto_151455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151454 ?auto_151455 ) ( ON-TABLE ?auto_151445 ) ( ON ?auto_151446 ?auto_151445 ) ( ON ?auto_151447 ?auto_151446 ) ( ON ?auto_151448 ?auto_151447 ) ( ON ?auto_151449 ?auto_151448 ) ( ON ?auto_151450 ?auto_151449 ) ( ON ?auto_151451 ?auto_151450 ) ( not ( = ?auto_151445 ?auto_151446 ) ) ( not ( = ?auto_151445 ?auto_151447 ) ) ( not ( = ?auto_151445 ?auto_151448 ) ) ( not ( = ?auto_151445 ?auto_151449 ) ) ( not ( = ?auto_151445 ?auto_151450 ) ) ( not ( = ?auto_151445 ?auto_151451 ) ) ( not ( = ?auto_151445 ?auto_151452 ) ) ( not ( = ?auto_151445 ?auto_151453 ) ) ( not ( = ?auto_151445 ?auto_151454 ) ) ( not ( = ?auto_151445 ?auto_151455 ) ) ( not ( = ?auto_151446 ?auto_151447 ) ) ( not ( = ?auto_151446 ?auto_151448 ) ) ( not ( = ?auto_151446 ?auto_151449 ) ) ( not ( = ?auto_151446 ?auto_151450 ) ) ( not ( = ?auto_151446 ?auto_151451 ) ) ( not ( = ?auto_151446 ?auto_151452 ) ) ( not ( = ?auto_151446 ?auto_151453 ) ) ( not ( = ?auto_151446 ?auto_151454 ) ) ( not ( = ?auto_151446 ?auto_151455 ) ) ( not ( = ?auto_151447 ?auto_151448 ) ) ( not ( = ?auto_151447 ?auto_151449 ) ) ( not ( = ?auto_151447 ?auto_151450 ) ) ( not ( = ?auto_151447 ?auto_151451 ) ) ( not ( = ?auto_151447 ?auto_151452 ) ) ( not ( = ?auto_151447 ?auto_151453 ) ) ( not ( = ?auto_151447 ?auto_151454 ) ) ( not ( = ?auto_151447 ?auto_151455 ) ) ( not ( = ?auto_151448 ?auto_151449 ) ) ( not ( = ?auto_151448 ?auto_151450 ) ) ( not ( = ?auto_151448 ?auto_151451 ) ) ( not ( = ?auto_151448 ?auto_151452 ) ) ( not ( = ?auto_151448 ?auto_151453 ) ) ( not ( = ?auto_151448 ?auto_151454 ) ) ( not ( = ?auto_151448 ?auto_151455 ) ) ( not ( = ?auto_151449 ?auto_151450 ) ) ( not ( = ?auto_151449 ?auto_151451 ) ) ( not ( = ?auto_151449 ?auto_151452 ) ) ( not ( = ?auto_151449 ?auto_151453 ) ) ( not ( = ?auto_151449 ?auto_151454 ) ) ( not ( = ?auto_151449 ?auto_151455 ) ) ( not ( = ?auto_151450 ?auto_151451 ) ) ( not ( = ?auto_151450 ?auto_151452 ) ) ( not ( = ?auto_151450 ?auto_151453 ) ) ( not ( = ?auto_151450 ?auto_151454 ) ) ( not ( = ?auto_151450 ?auto_151455 ) ) ( not ( = ?auto_151451 ?auto_151452 ) ) ( not ( = ?auto_151451 ?auto_151453 ) ) ( not ( = ?auto_151451 ?auto_151454 ) ) ( not ( = ?auto_151451 ?auto_151455 ) ) ( not ( = ?auto_151452 ?auto_151453 ) ) ( not ( = ?auto_151452 ?auto_151454 ) ) ( not ( = ?auto_151452 ?auto_151455 ) ) ( not ( = ?auto_151453 ?auto_151454 ) ) ( not ( = ?auto_151453 ?auto_151455 ) ) ( not ( = ?auto_151454 ?auto_151455 ) ) ( ON ?auto_151453 ?auto_151454 ) ( CLEAR ?auto_151451 ) ( ON ?auto_151452 ?auto_151453 ) ( CLEAR ?auto_151452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_151445 ?auto_151446 ?auto_151447 ?auto_151448 ?auto_151449 ?auto_151450 ?auto_151451 ?auto_151452 )
      ( MAKE-10PILE ?auto_151445 ?auto_151446 ?auto_151447 ?auto_151448 ?auto_151449 ?auto_151450 ?auto_151451 ?auto_151452 ?auto_151453 ?auto_151454 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_151466 - BLOCK
      ?auto_151467 - BLOCK
      ?auto_151468 - BLOCK
      ?auto_151469 - BLOCK
      ?auto_151470 - BLOCK
      ?auto_151471 - BLOCK
      ?auto_151472 - BLOCK
      ?auto_151473 - BLOCK
      ?auto_151474 - BLOCK
      ?auto_151475 - BLOCK
    )
    :vars
    (
      ?auto_151476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151475 ?auto_151476 ) ( ON-TABLE ?auto_151466 ) ( ON ?auto_151467 ?auto_151466 ) ( ON ?auto_151468 ?auto_151467 ) ( ON ?auto_151469 ?auto_151468 ) ( ON ?auto_151470 ?auto_151469 ) ( ON ?auto_151471 ?auto_151470 ) ( not ( = ?auto_151466 ?auto_151467 ) ) ( not ( = ?auto_151466 ?auto_151468 ) ) ( not ( = ?auto_151466 ?auto_151469 ) ) ( not ( = ?auto_151466 ?auto_151470 ) ) ( not ( = ?auto_151466 ?auto_151471 ) ) ( not ( = ?auto_151466 ?auto_151472 ) ) ( not ( = ?auto_151466 ?auto_151473 ) ) ( not ( = ?auto_151466 ?auto_151474 ) ) ( not ( = ?auto_151466 ?auto_151475 ) ) ( not ( = ?auto_151466 ?auto_151476 ) ) ( not ( = ?auto_151467 ?auto_151468 ) ) ( not ( = ?auto_151467 ?auto_151469 ) ) ( not ( = ?auto_151467 ?auto_151470 ) ) ( not ( = ?auto_151467 ?auto_151471 ) ) ( not ( = ?auto_151467 ?auto_151472 ) ) ( not ( = ?auto_151467 ?auto_151473 ) ) ( not ( = ?auto_151467 ?auto_151474 ) ) ( not ( = ?auto_151467 ?auto_151475 ) ) ( not ( = ?auto_151467 ?auto_151476 ) ) ( not ( = ?auto_151468 ?auto_151469 ) ) ( not ( = ?auto_151468 ?auto_151470 ) ) ( not ( = ?auto_151468 ?auto_151471 ) ) ( not ( = ?auto_151468 ?auto_151472 ) ) ( not ( = ?auto_151468 ?auto_151473 ) ) ( not ( = ?auto_151468 ?auto_151474 ) ) ( not ( = ?auto_151468 ?auto_151475 ) ) ( not ( = ?auto_151468 ?auto_151476 ) ) ( not ( = ?auto_151469 ?auto_151470 ) ) ( not ( = ?auto_151469 ?auto_151471 ) ) ( not ( = ?auto_151469 ?auto_151472 ) ) ( not ( = ?auto_151469 ?auto_151473 ) ) ( not ( = ?auto_151469 ?auto_151474 ) ) ( not ( = ?auto_151469 ?auto_151475 ) ) ( not ( = ?auto_151469 ?auto_151476 ) ) ( not ( = ?auto_151470 ?auto_151471 ) ) ( not ( = ?auto_151470 ?auto_151472 ) ) ( not ( = ?auto_151470 ?auto_151473 ) ) ( not ( = ?auto_151470 ?auto_151474 ) ) ( not ( = ?auto_151470 ?auto_151475 ) ) ( not ( = ?auto_151470 ?auto_151476 ) ) ( not ( = ?auto_151471 ?auto_151472 ) ) ( not ( = ?auto_151471 ?auto_151473 ) ) ( not ( = ?auto_151471 ?auto_151474 ) ) ( not ( = ?auto_151471 ?auto_151475 ) ) ( not ( = ?auto_151471 ?auto_151476 ) ) ( not ( = ?auto_151472 ?auto_151473 ) ) ( not ( = ?auto_151472 ?auto_151474 ) ) ( not ( = ?auto_151472 ?auto_151475 ) ) ( not ( = ?auto_151472 ?auto_151476 ) ) ( not ( = ?auto_151473 ?auto_151474 ) ) ( not ( = ?auto_151473 ?auto_151475 ) ) ( not ( = ?auto_151473 ?auto_151476 ) ) ( not ( = ?auto_151474 ?auto_151475 ) ) ( not ( = ?auto_151474 ?auto_151476 ) ) ( not ( = ?auto_151475 ?auto_151476 ) ) ( ON ?auto_151474 ?auto_151475 ) ( ON ?auto_151473 ?auto_151474 ) ( CLEAR ?auto_151471 ) ( ON ?auto_151472 ?auto_151473 ) ( CLEAR ?auto_151472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_151466 ?auto_151467 ?auto_151468 ?auto_151469 ?auto_151470 ?auto_151471 ?auto_151472 )
      ( MAKE-10PILE ?auto_151466 ?auto_151467 ?auto_151468 ?auto_151469 ?auto_151470 ?auto_151471 ?auto_151472 ?auto_151473 ?auto_151474 ?auto_151475 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_151487 - BLOCK
      ?auto_151488 - BLOCK
      ?auto_151489 - BLOCK
      ?auto_151490 - BLOCK
      ?auto_151491 - BLOCK
      ?auto_151492 - BLOCK
      ?auto_151493 - BLOCK
      ?auto_151494 - BLOCK
      ?auto_151495 - BLOCK
      ?auto_151496 - BLOCK
    )
    :vars
    (
      ?auto_151497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151496 ?auto_151497 ) ( ON-TABLE ?auto_151487 ) ( ON ?auto_151488 ?auto_151487 ) ( ON ?auto_151489 ?auto_151488 ) ( ON ?auto_151490 ?auto_151489 ) ( ON ?auto_151491 ?auto_151490 ) ( ON ?auto_151492 ?auto_151491 ) ( not ( = ?auto_151487 ?auto_151488 ) ) ( not ( = ?auto_151487 ?auto_151489 ) ) ( not ( = ?auto_151487 ?auto_151490 ) ) ( not ( = ?auto_151487 ?auto_151491 ) ) ( not ( = ?auto_151487 ?auto_151492 ) ) ( not ( = ?auto_151487 ?auto_151493 ) ) ( not ( = ?auto_151487 ?auto_151494 ) ) ( not ( = ?auto_151487 ?auto_151495 ) ) ( not ( = ?auto_151487 ?auto_151496 ) ) ( not ( = ?auto_151487 ?auto_151497 ) ) ( not ( = ?auto_151488 ?auto_151489 ) ) ( not ( = ?auto_151488 ?auto_151490 ) ) ( not ( = ?auto_151488 ?auto_151491 ) ) ( not ( = ?auto_151488 ?auto_151492 ) ) ( not ( = ?auto_151488 ?auto_151493 ) ) ( not ( = ?auto_151488 ?auto_151494 ) ) ( not ( = ?auto_151488 ?auto_151495 ) ) ( not ( = ?auto_151488 ?auto_151496 ) ) ( not ( = ?auto_151488 ?auto_151497 ) ) ( not ( = ?auto_151489 ?auto_151490 ) ) ( not ( = ?auto_151489 ?auto_151491 ) ) ( not ( = ?auto_151489 ?auto_151492 ) ) ( not ( = ?auto_151489 ?auto_151493 ) ) ( not ( = ?auto_151489 ?auto_151494 ) ) ( not ( = ?auto_151489 ?auto_151495 ) ) ( not ( = ?auto_151489 ?auto_151496 ) ) ( not ( = ?auto_151489 ?auto_151497 ) ) ( not ( = ?auto_151490 ?auto_151491 ) ) ( not ( = ?auto_151490 ?auto_151492 ) ) ( not ( = ?auto_151490 ?auto_151493 ) ) ( not ( = ?auto_151490 ?auto_151494 ) ) ( not ( = ?auto_151490 ?auto_151495 ) ) ( not ( = ?auto_151490 ?auto_151496 ) ) ( not ( = ?auto_151490 ?auto_151497 ) ) ( not ( = ?auto_151491 ?auto_151492 ) ) ( not ( = ?auto_151491 ?auto_151493 ) ) ( not ( = ?auto_151491 ?auto_151494 ) ) ( not ( = ?auto_151491 ?auto_151495 ) ) ( not ( = ?auto_151491 ?auto_151496 ) ) ( not ( = ?auto_151491 ?auto_151497 ) ) ( not ( = ?auto_151492 ?auto_151493 ) ) ( not ( = ?auto_151492 ?auto_151494 ) ) ( not ( = ?auto_151492 ?auto_151495 ) ) ( not ( = ?auto_151492 ?auto_151496 ) ) ( not ( = ?auto_151492 ?auto_151497 ) ) ( not ( = ?auto_151493 ?auto_151494 ) ) ( not ( = ?auto_151493 ?auto_151495 ) ) ( not ( = ?auto_151493 ?auto_151496 ) ) ( not ( = ?auto_151493 ?auto_151497 ) ) ( not ( = ?auto_151494 ?auto_151495 ) ) ( not ( = ?auto_151494 ?auto_151496 ) ) ( not ( = ?auto_151494 ?auto_151497 ) ) ( not ( = ?auto_151495 ?auto_151496 ) ) ( not ( = ?auto_151495 ?auto_151497 ) ) ( not ( = ?auto_151496 ?auto_151497 ) ) ( ON ?auto_151495 ?auto_151496 ) ( ON ?auto_151494 ?auto_151495 ) ( CLEAR ?auto_151492 ) ( ON ?auto_151493 ?auto_151494 ) ( CLEAR ?auto_151493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_151487 ?auto_151488 ?auto_151489 ?auto_151490 ?auto_151491 ?auto_151492 ?auto_151493 )
      ( MAKE-10PILE ?auto_151487 ?auto_151488 ?auto_151489 ?auto_151490 ?auto_151491 ?auto_151492 ?auto_151493 ?auto_151494 ?auto_151495 ?auto_151496 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_151508 - BLOCK
      ?auto_151509 - BLOCK
      ?auto_151510 - BLOCK
      ?auto_151511 - BLOCK
      ?auto_151512 - BLOCK
      ?auto_151513 - BLOCK
      ?auto_151514 - BLOCK
      ?auto_151515 - BLOCK
      ?auto_151516 - BLOCK
      ?auto_151517 - BLOCK
    )
    :vars
    (
      ?auto_151518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151517 ?auto_151518 ) ( ON-TABLE ?auto_151508 ) ( ON ?auto_151509 ?auto_151508 ) ( ON ?auto_151510 ?auto_151509 ) ( ON ?auto_151511 ?auto_151510 ) ( ON ?auto_151512 ?auto_151511 ) ( not ( = ?auto_151508 ?auto_151509 ) ) ( not ( = ?auto_151508 ?auto_151510 ) ) ( not ( = ?auto_151508 ?auto_151511 ) ) ( not ( = ?auto_151508 ?auto_151512 ) ) ( not ( = ?auto_151508 ?auto_151513 ) ) ( not ( = ?auto_151508 ?auto_151514 ) ) ( not ( = ?auto_151508 ?auto_151515 ) ) ( not ( = ?auto_151508 ?auto_151516 ) ) ( not ( = ?auto_151508 ?auto_151517 ) ) ( not ( = ?auto_151508 ?auto_151518 ) ) ( not ( = ?auto_151509 ?auto_151510 ) ) ( not ( = ?auto_151509 ?auto_151511 ) ) ( not ( = ?auto_151509 ?auto_151512 ) ) ( not ( = ?auto_151509 ?auto_151513 ) ) ( not ( = ?auto_151509 ?auto_151514 ) ) ( not ( = ?auto_151509 ?auto_151515 ) ) ( not ( = ?auto_151509 ?auto_151516 ) ) ( not ( = ?auto_151509 ?auto_151517 ) ) ( not ( = ?auto_151509 ?auto_151518 ) ) ( not ( = ?auto_151510 ?auto_151511 ) ) ( not ( = ?auto_151510 ?auto_151512 ) ) ( not ( = ?auto_151510 ?auto_151513 ) ) ( not ( = ?auto_151510 ?auto_151514 ) ) ( not ( = ?auto_151510 ?auto_151515 ) ) ( not ( = ?auto_151510 ?auto_151516 ) ) ( not ( = ?auto_151510 ?auto_151517 ) ) ( not ( = ?auto_151510 ?auto_151518 ) ) ( not ( = ?auto_151511 ?auto_151512 ) ) ( not ( = ?auto_151511 ?auto_151513 ) ) ( not ( = ?auto_151511 ?auto_151514 ) ) ( not ( = ?auto_151511 ?auto_151515 ) ) ( not ( = ?auto_151511 ?auto_151516 ) ) ( not ( = ?auto_151511 ?auto_151517 ) ) ( not ( = ?auto_151511 ?auto_151518 ) ) ( not ( = ?auto_151512 ?auto_151513 ) ) ( not ( = ?auto_151512 ?auto_151514 ) ) ( not ( = ?auto_151512 ?auto_151515 ) ) ( not ( = ?auto_151512 ?auto_151516 ) ) ( not ( = ?auto_151512 ?auto_151517 ) ) ( not ( = ?auto_151512 ?auto_151518 ) ) ( not ( = ?auto_151513 ?auto_151514 ) ) ( not ( = ?auto_151513 ?auto_151515 ) ) ( not ( = ?auto_151513 ?auto_151516 ) ) ( not ( = ?auto_151513 ?auto_151517 ) ) ( not ( = ?auto_151513 ?auto_151518 ) ) ( not ( = ?auto_151514 ?auto_151515 ) ) ( not ( = ?auto_151514 ?auto_151516 ) ) ( not ( = ?auto_151514 ?auto_151517 ) ) ( not ( = ?auto_151514 ?auto_151518 ) ) ( not ( = ?auto_151515 ?auto_151516 ) ) ( not ( = ?auto_151515 ?auto_151517 ) ) ( not ( = ?auto_151515 ?auto_151518 ) ) ( not ( = ?auto_151516 ?auto_151517 ) ) ( not ( = ?auto_151516 ?auto_151518 ) ) ( not ( = ?auto_151517 ?auto_151518 ) ) ( ON ?auto_151516 ?auto_151517 ) ( ON ?auto_151515 ?auto_151516 ) ( ON ?auto_151514 ?auto_151515 ) ( CLEAR ?auto_151512 ) ( ON ?auto_151513 ?auto_151514 ) ( CLEAR ?auto_151513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151508 ?auto_151509 ?auto_151510 ?auto_151511 ?auto_151512 ?auto_151513 )
      ( MAKE-10PILE ?auto_151508 ?auto_151509 ?auto_151510 ?auto_151511 ?auto_151512 ?auto_151513 ?auto_151514 ?auto_151515 ?auto_151516 ?auto_151517 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_151529 - BLOCK
      ?auto_151530 - BLOCK
      ?auto_151531 - BLOCK
      ?auto_151532 - BLOCK
      ?auto_151533 - BLOCK
      ?auto_151534 - BLOCK
      ?auto_151535 - BLOCK
      ?auto_151536 - BLOCK
      ?auto_151537 - BLOCK
      ?auto_151538 - BLOCK
    )
    :vars
    (
      ?auto_151539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151538 ?auto_151539 ) ( ON-TABLE ?auto_151529 ) ( ON ?auto_151530 ?auto_151529 ) ( ON ?auto_151531 ?auto_151530 ) ( ON ?auto_151532 ?auto_151531 ) ( ON ?auto_151533 ?auto_151532 ) ( not ( = ?auto_151529 ?auto_151530 ) ) ( not ( = ?auto_151529 ?auto_151531 ) ) ( not ( = ?auto_151529 ?auto_151532 ) ) ( not ( = ?auto_151529 ?auto_151533 ) ) ( not ( = ?auto_151529 ?auto_151534 ) ) ( not ( = ?auto_151529 ?auto_151535 ) ) ( not ( = ?auto_151529 ?auto_151536 ) ) ( not ( = ?auto_151529 ?auto_151537 ) ) ( not ( = ?auto_151529 ?auto_151538 ) ) ( not ( = ?auto_151529 ?auto_151539 ) ) ( not ( = ?auto_151530 ?auto_151531 ) ) ( not ( = ?auto_151530 ?auto_151532 ) ) ( not ( = ?auto_151530 ?auto_151533 ) ) ( not ( = ?auto_151530 ?auto_151534 ) ) ( not ( = ?auto_151530 ?auto_151535 ) ) ( not ( = ?auto_151530 ?auto_151536 ) ) ( not ( = ?auto_151530 ?auto_151537 ) ) ( not ( = ?auto_151530 ?auto_151538 ) ) ( not ( = ?auto_151530 ?auto_151539 ) ) ( not ( = ?auto_151531 ?auto_151532 ) ) ( not ( = ?auto_151531 ?auto_151533 ) ) ( not ( = ?auto_151531 ?auto_151534 ) ) ( not ( = ?auto_151531 ?auto_151535 ) ) ( not ( = ?auto_151531 ?auto_151536 ) ) ( not ( = ?auto_151531 ?auto_151537 ) ) ( not ( = ?auto_151531 ?auto_151538 ) ) ( not ( = ?auto_151531 ?auto_151539 ) ) ( not ( = ?auto_151532 ?auto_151533 ) ) ( not ( = ?auto_151532 ?auto_151534 ) ) ( not ( = ?auto_151532 ?auto_151535 ) ) ( not ( = ?auto_151532 ?auto_151536 ) ) ( not ( = ?auto_151532 ?auto_151537 ) ) ( not ( = ?auto_151532 ?auto_151538 ) ) ( not ( = ?auto_151532 ?auto_151539 ) ) ( not ( = ?auto_151533 ?auto_151534 ) ) ( not ( = ?auto_151533 ?auto_151535 ) ) ( not ( = ?auto_151533 ?auto_151536 ) ) ( not ( = ?auto_151533 ?auto_151537 ) ) ( not ( = ?auto_151533 ?auto_151538 ) ) ( not ( = ?auto_151533 ?auto_151539 ) ) ( not ( = ?auto_151534 ?auto_151535 ) ) ( not ( = ?auto_151534 ?auto_151536 ) ) ( not ( = ?auto_151534 ?auto_151537 ) ) ( not ( = ?auto_151534 ?auto_151538 ) ) ( not ( = ?auto_151534 ?auto_151539 ) ) ( not ( = ?auto_151535 ?auto_151536 ) ) ( not ( = ?auto_151535 ?auto_151537 ) ) ( not ( = ?auto_151535 ?auto_151538 ) ) ( not ( = ?auto_151535 ?auto_151539 ) ) ( not ( = ?auto_151536 ?auto_151537 ) ) ( not ( = ?auto_151536 ?auto_151538 ) ) ( not ( = ?auto_151536 ?auto_151539 ) ) ( not ( = ?auto_151537 ?auto_151538 ) ) ( not ( = ?auto_151537 ?auto_151539 ) ) ( not ( = ?auto_151538 ?auto_151539 ) ) ( ON ?auto_151537 ?auto_151538 ) ( ON ?auto_151536 ?auto_151537 ) ( ON ?auto_151535 ?auto_151536 ) ( CLEAR ?auto_151533 ) ( ON ?auto_151534 ?auto_151535 ) ( CLEAR ?auto_151534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151529 ?auto_151530 ?auto_151531 ?auto_151532 ?auto_151533 ?auto_151534 )
      ( MAKE-10PILE ?auto_151529 ?auto_151530 ?auto_151531 ?auto_151532 ?auto_151533 ?auto_151534 ?auto_151535 ?auto_151536 ?auto_151537 ?auto_151538 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_151550 - BLOCK
      ?auto_151551 - BLOCK
      ?auto_151552 - BLOCK
      ?auto_151553 - BLOCK
      ?auto_151554 - BLOCK
      ?auto_151555 - BLOCK
      ?auto_151556 - BLOCK
      ?auto_151557 - BLOCK
      ?auto_151558 - BLOCK
      ?auto_151559 - BLOCK
    )
    :vars
    (
      ?auto_151560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151559 ?auto_151560 ) ( ON-TABLE ?auto_151550 ) ( ON ?auto_151551 ?auto_151550 ) ( ON ?auto_151552 ?auto_151551 ) ( ON ?auto_151553 ?auto_151552 ) ( not ( = ?auto_151550 ?auto_151551 ) ) ( not ( = ?auto_151550 ?auto_151552 ) ) ( not ( = ?auto_151550 ?auto_151553 ) ) ( not ( = ?auto_151550 ?auto_151554 ) ) ( not ( = ?auto_151550 ?auto_151555 ) ) ( not ( = ?auto_151550 ?auto_151556 ) ) ( not ( = ?auto_151550 ?auto_151557 ) ) ( not ( = ?auto_151550 ?auto_151558 ) ) ( not ( = ?auto_151550 ?auto_151559 ) ) ( not ( = ?auto_151550 ?auto_151560 ) ) ( not ( = ?auto_151551 ?auto_151552 ) ) ( not ( = ?auto_151551 ?auto_151553 ) ) ( not ( = ?auto_151551 ?auto_151554 ) ) ( not ( = ?auto_151551 ?auto_151555 ) ) ( not ( = ?auto_151551 ?auto_151556 ) ) ( not ( = ?auto_151551 ?auto_151557 ) ) ( not ( = ?auto_151551 ?auto_151558 ) ) ( not ( = ?auto_151551 ?auto_151559 ) ) ( not ( = ?auto_151551 ?auto_151560 ) ) ( not ( = ?auto_151552 ?auto_151553 ) ) ( not ( = ?auto_151552 ?auto_151554 ) ) ( not ( = ?auto_151552 ?auto_151555 ) ) ( not ( = ?auto_151552 ?auto_151556 ) ) ( not ( = ?auto_151552 ?auto_151557 ) ) ( not ( = ?auto_151552 ?auto_151558 ) ) ( not ( = ?auto_151552 ?auto_151559 ) ) ( not ( = ?auto_151552 ?auto_151560 ) ) ( not ( = ?auto_151553 ?auto_151554 ) ) ( not ( = ?auto_151553 ?auto_151555 ) ) ( not ( = ?auto_151553 ?auto_151556 ) ) ( not ( = ?auto_151553 ?auto_151557 ) ) ( not ( = ?auto_151553 ?auto_151558 ) ) ( not ( = ?auto_151553 ?auto_151559 ) ) ( not ( = ?auto_151553 ?auto_151560 ) ) ( not ( = ?auto_151554 ?auto_151555 ) ) ( not ( = ?auto_151554 ?auto_151556 ) ) ( not ( = ?auto_151554 ?auto_151557 ) ) ( not ( = ?auto_151554 ?auto_151558 ) ) ( not ( = ?auto_151554 ?auto_151559 ) ) ( not ( = ?auto_151554 ?auto_151560 ) ) ( not ( = ?auto_151555 ?auto_151556 ) ) ( not ( = ?auto_151555 ?auto_151557 ) ) ( not ( = ?auto_151555 ?auto_151558 ) ) ( not ( = ?auto_151555 ?auto_151559 ) ) ( not ( = ?auto_151555 ?auto_151560 ) ) ( not ( = ?auto_151556 ?auto_151557 ) ) ( not ( = ?auto_151556 ?auto_151558 ) ) ( not ( = ?auto_151556 ?auto_151559 ) ) ( not ( = ?auto_151556 ?auto_151560 ) ) ( not ( = ?auto_151557 ?auto_151558 ) ) ( not ( = ?auto_151557 ?auto_151559 ) ) ( not ( = ?auto_151557 ?auto_151560 ) ) ( not ( = ?auto_151558 ?auto_151559 ) ) ( not ( = ?auto_151558 ?auto_151560 ) ) ( not ( = ?auto_151559 ?auto_151560 ) ) ( ON ?auto_151558 ?auto_151559 ) ( ON ?auto_151557 ?auto_151558 ) ( ON ?auto_151556 ?auto_151557 ) ( ON ?auto_151555 ?auto_151556 ) ( CLEAR ?auto_151553 ) ( ON ?auto_151554 ?auto_151555 ) ( CLEAR ?auto_151554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_151550 ?auto_151551 ?auto_151552 ?auto_151553 ?auto_151554 )
      ( MAKE-10PILE ?auto_151550 ?auto_151551 ?auto_151552 ?auto_151553 ?auto_151554 ?auto_151555 ?auto_151556 ?auto_151557 ?auto_151558 ?auto_151559 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_151571 - BLOCK
      ?auto_151572 - BLOCK
      ?auto_151573 - BLOCK
      ?auto_151574 - BLOCK
      ?auto_151575 - BLOCK
      ?auto_151576 - BLOCK
      ?auto_151577 - BLOCK
      ?auto_151578 - BLOCK
      ?auto_151579 - BLOCK
      ?auto_151580 - BLOCK
    )
    :vars
    (
      ?auto_151581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151580 ?auto_151581 ) ( ON-TABLE ?auto_151571 ) ( ON ?auto_151572 ?auto_151571 ) ( ON ?auto_151573 ?auto_151572 ) ( ON ?auto_151574 ?auto_151573 ) ( not ( = ?auto_151571 ?auto_151572 ) ) ( not ( = ?auto_151571 ?auto_151573 ) ) ( not ( = ?auto_151571 ?auto_151574 ) ) ( not ( = ?auto_151571 ?auto_151575 ) ) ( not ( = ?auto_151571 ?auto_151576 ) ) ( not ( = ?auto_151571 ?auto_151577 ) ) ( not ( = ?auto_151571 ?auto_151578 ) ) ( not ( = ?auto_151571 ?auto_151579 ) ) ( not ( = ?auto_151571 ?auto_151580 ) ) ( not ( = ?auto_151571 ?auto_151581 ) ) ( not ( = ?auto_151572 ?auto_151573 ) ) ( not ( = ?auto_151572 ?auto_151574 ) ) ( not ( = ?auto_151572 ?auto_151575 ) ) ( not ( = ?auto_151572 ?auto_151576 ) ) ( not ( = ?auto_151572 ?auto_151577 ) ) ( not ( = ?auto_151572 ?auto_151578 ) ) ( not ( = ?auto_151572 ?auto_151579 ) ) ( not ( = ?auto_151572 ?auto_151580 ) ) ( not ( = ?auto_151572 ?auto_151581 ) ) ( not ( = ?auto_151573 ?auto_151574 ) ) ( not ( = ?auto_151573 ?auto_151575 ) ) ( not ( = ?auto_151573 ?auto_151576 ) ) ( not ( = ?auto_151573 ?auto_151577 ) ) ( not ( = ?auto_151573 ?auto_151578 ) ) ( not ( = ?auto_151573 ?auto_151579 ) ) ( not ( = ?auto_151573 ?auto_151580 ) ) ( not ( = ?auto_151573 ?auto_151581 ) ) ( not ( = ?auto_151574 ?auto_151575 ) ) ( not ( = ?auto_151574 ?auto_151576 ) ) ( not ( = ?auto_151574 ?auto_151577 ) ) ( not ( = ?auto_151574 ?auto_151578 ) ) ( not ( = ?auto_151574 ?auto_151579 ) ) ( not ( = ?auto_151574 ?auto_151580 ) ) ( not ( = ?auto_151574 ?auto_151581 ) ) ( not ( = ?auto_151575 ?auto_151576 ) ) ( not ( = ?auto_151575 ?auto_151577 ) ) ( not ( = ?auto_151575 ?auto_151578 ) ) ( not ( = ?auto_151575 ?auto_151579 ) ) ( not ( = ?auto_151575 ?auto_151580 ) ) ( not ( = ?auto_151575 ?auto_151581 ) ) ( not ( = ?auto_151576 ?auto_151577 ) ) ( not ( = ?auto_151576 ?auto_151578 ) ) ( not ( = ?auto_151576 ?auto_151579 ) ) ( not ( = ?auto_151576 ?auto_151580 ) ) ( not ( = ?auto_151576 ?auto_151581 ) ) ( not ( = ?auto_151577 ?auto_151578 ) ) ( not ( = ?auto_151577 ?auto_151579 ) ) ( not ( = ?auto_151577 ?auto_151580 ) ) ( not ( = ?auto_151577 ?auto_151581 ) ) ( not ( = ?auto_151578 ?auto_151579 ) ) ( not ( = ?auto_151578 ?auto_151580 ) ) ( not ( = ?auto_151578 ?auto_151581 ) ) ( not ( = ?auto_151579 ?auto_151580 ) ) ( not ( = ?auto_151579 ?auto_151581 ) ) ( not ( = ?auto_151580 ?auto_151581 ) ) ( ON ?auto_151579 ?auto_151580 ) ( ON ?auto_151578 ?auto_151579 ) ( ON ?auto_151577 ?auto_151578 ) ( ON ?auto_151576 ?auto_151577 ) ( CLEAR ?auto_151574 ) ( ON ?auto_151575 ?auto_151576 ) ( CLEAR ?auto_151575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_151571 ?auto_151572 ?auto_151573 ?auto_151574 ?auto_151575 )
      ( MAKE-10PILE ?auto_151571 ?auto_151572 ?auto_151573 ?auto_151574 ?auto_151575 ?auto_151576 ?auto_151577 ?auto_151578 ?auto_151579 ?auto_151580 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_151592 - BLOCK
      ?auto_151593 - BLOCK
      ?auto_151594 - BLOCK
      ?auto_151595 - BLOCK
      ?auto_151596 - BLOCK
      ?auto_151597 - BLOCK
      ?auto_151598 - BLOCK
      ?auto_151599 - BLOCK
      ?auto_151600 - BLOCK
      ?auto_151601 - BLOCK
    )
    :vars
    (
      ?auto_151602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151601 ?auto_151602 ) ( ON-TABLE ?auto_151592 ) ( ON ?auto_151593 ?auto_151592 ) ( ON ?auto_151594 ?auto_151593 ) ( not ( = ?auto_151592 ?auto_151593 ) ) ( not ( = ?auto_151592 ?auto_151594 ) ) ( not ( = ?auto_151592 ?auto_151595 ) ) ( not ( = ?auto_151592 ?auto_151596 ) ) ( not ( = ?auto_151592 ?auto_151597 ) ) ( not ( = ?auto_151592 ?auto_151598 ) ) ( not ( = ?auto_151592 ?auto_151599 ) ) ( not ( = ?auto_151592 ?auto_151600 ) ) ( not ( = ?auto_151592 ?auto_151601 ) ) ( not ( = ?auto_151592 ?auto_151602 ) ) ( not ( = ?auto_151593 ?auto_151594 ) ) ( not ( = ?auto_151593 ?auto_151595 ) ) ( not ( = ?auto_151593 ?auto_151596 ) ) ( not ( = ?auto_151593 ?auto_151597 ) ) ( not ( = ?auto_151593 ?auto_151598 ) ) ( not ( = ?auto_151593 ?auto_151599 ) ) ( not ( = ?auto_151593 ?auto_151600 ) ) ( not ( = ?auto_151593 ?auto_151601 ) ) ( not ( = ?auto_151593 ?auto_151602 ) ) ( not ( = ?auto_151594 ?auto_151595 ) ) ( not ( = ?auto_151594 ?auto_151596 ) ) ( not ( = ?auto_151594 ?auto_151597 ) ) ( not ( = ?auto_151594 ?auto_151598 ) ) ( not ( = ?auto_151594 ?auto_151599 ) ) ( not ( = ?auto_151594 ?auto_151600 ) ) ( not ( = ?auto_151594 ?auto_151601 ) ) ( not ( = ?auto_151594 ?auto_151602 ) ) ( not ( = ?auto_151595 ?auto_151596 ) ) ( not ( = ?auto_151595 ?auto_151597 ) ) ( not ( = ?auto_151595 ?auto_151598 ) ) ( not ( = ?auto_151595 ?auto_151599 ) ) ( not ( = ?auto_151595 ?auto_151600 ) ) ( not ( = ?auto_151595 ?auto_151601 ) ) ( not ( = ?auto_151595 ?auto_151602 ) ) ( not ( = ?auto_151596 ?auto_151597 ) ) ( not ( = ?auto_151596 ?auto_151598 ) ) ( not ( = ?auto_151596 ?auto_151599 ) ) ( not ( = ?auto_151596 ?auto_151600 ) ) ( not ( = ?auto_151596 ?auto_151601 ) ) ( not ( = ?auto_151596 ?auto_151602 ) ) ( not ( = ?auto_151597 ?auto_151598 ) ) ( not ( = ?auto_151597 ?auto_151599 ) ) ( not ( = ?auto_151597 ?auto_151600 ) ) ( not ( = ?auto_151597 ?auto_151601 ) ) ( not ( = ?auto_151597 ?auto_151602 ) ) ( not ( = ?auto_151598 ?auto_151599 ) ) ( not ( = ?auto_151598 ?auto_151600 ) ) ( not ( = ?auto_151598 ?auto_151601 ) ) ( not ( = ?auto_151598 ?auto_151602 ) ) ( not ( = ?auto_151599 ?auto_151600 ) ) ( not ( = ?auto_151599 ?auto_151601 ) ) ( not ( = ?auto_151599 ?auto_151602 ) ) ( not ( = ?auto_151600 ?auto_151601 ) ) ( not ( = ?auto_151600 ?auto_151602 ) ) ( not ( = ?auto_151601 ?auto_151602 ) ) ( ON ?auto_151600 ?auto_151601 ) ( ON ?auto_151599 ?auto_151600 ) ( ON ?auto_151598 ?auto_151599 ) ( ON ?auto_151597 ?auto_151598 ) ( ON ?auto_151596 ?auto_151597 ) ( CLEAR ?auto_151594 ) ( ON ?auto_151595 ?auto_151596 ) ( CLEAR ?auto_151595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151592 ?auto_151593 ?auto_151594 ?auto_151595 )
      ( MAKE-10PILE ?auto_151592 ?auto_151593 ?auto_151594 ?auto_151595 ?auto_151596 ?auto_151597 ?auto_151598 ?auto_151599 ?auto_151600 ?auto_151601 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_151613 - BLOCK
      ?auto_151614 - BLOCK
      ?auto_151615 - BLOCK
      ?auto_151616 - BLOCK
      ?auto_151617 - BLOCK
      ?auto_151618 - BLOCK
      ?auto_151619 - BLOCK
      ?auto_151620 - BLOCK
      ?auto_151621 - BLOCK
      ?auto_151622 - BLOCK
    )
    :vars
    (
      ?auto_151623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151622 ?auto_151623 ) ( ON-TABLE ?auto_151613 ) ( ON ?auto_151614 ?auto_151613 ) ( ON ?auto_151615 ?auto_151614 ) ( not ( = ?auto_151613 ?auto_151614 ) ) ( not ( = ?auto_151613 ?auto_151615 ) ) ( not ( = ?auto_151613 ?auto_151616 ) ) ( not ( = ?auto_151613 ?auto_151617 ) ) ( not ( = ?auto_151613 ?auto_151618 ) ) ( not ( = ?auto_151613 ?auto_151619 ) ) ( not ( = ?auto_151613 ?auto_151620 ) ) ( not ( = ?auto_151613 ?auto_151621 ) ) ( not ( = ?auto_151613 ?auto_151622 ) ) ( not ( = ?auto_151613 ?auto_151623 ) ) ( not ( = ?auto_151614 ?auto_151615 ) ) ( not ( = ?auto_151614 ?auto_151616 ) ) ( not ( = ?auto_151614 ?auto_151617 ) ) ( not ( = ?auto_151614 ?auto_151618 ) ) ( not ( = ?auto_151614 ?auto_151619 ) ) ( not ( = ?auto_151614 ?auto_151620 ) ) ( not ( = ?auto_151614 ?auto_151621 ) ) ( not ( = ?auto_151614 ?auto_151622 ) ) ( not ( = ?auto_151614 ?auto_151623 ) ) ( not ( = ?auto_151615 ?auto_151616 ) ) ( not ( = ?auto_151615 ?auto_151617 ) ) ( not ( = ?auto_151615 ?auto_151618 ) ) ( not ( = ?auto_151615 ?auto_151619 ) ) ( not ( = ?auto_151615 ?auto_151620 ) ) ( not ( = ?auto_151615 ?auto_151621 ) ) ( not ( = ?auto_151615 ?auto_151622 ) ) ( not ( = ?auto_151615 ?auto_151623 ) ) ( not ( = ?auto_151616 ?auto_151617 ) ) ( not ( = ?auto_151616 ?auto_151618 ) ) ( not ( = ?auto_151616 ?auto_151619 ) ) ( not ( = ?auto_151616 ?auto_151620 ) ) ( not ( = ?auto_151616 ?auto_151621 ) ) ( not ( = ?auto_151616 ?auto_151622 ) ) ( not ( = ?auto_151616 ?auto_151623 ) ) ( not ( = ?auto_151617 ?auto_151618 ) ) ( not ( = ?auto_151617 ?auto_151619 ) ) ( not ( = ?auto_151617 ?auto_151620 ) ) ( not ( = ?auto_151617 ?auto_151621 ) ) ( not ( = ?auto_151617 ?auto_151622 ) ) ( not ( = ?auto_151617 ?auto_151623 ) ) ( not ( = ?auto_151618 ?auto_151619 ) ) ( not ( = ?auto_151618 ?auto_151620 ) ) ( not ( = ?auto_151618 ?auto_151621 ) ) ( not ( = ?auto_151618 ?auto_151622 ) ) ( not ( = ?auto_151618 ?auto_151623 ) ) ( not ( = ?auto_151619 ?auto_151620 ) ) ( not ( = ?auto_151619 ?auto_151621 ) ) ( not ( = ?auto_151619 ?auto_151622 ) ) ( not ( = ?auto_151619 ?auto_151623 ) ) ( not ( = ?auto_151620 ?auto_151621 ) ) ( not ( = ?auto_151620 ?auto_151622 ) ) ( not ( = ?auto_151620 ?auto_151623 ) ) ( not ( = ?auto_151621 ?auto_151622 ) ) ( not ( = ?auto_151621 ?auto_151623 ) ) ( not ( = ?auto_151622 ?auto_151623 ) ) ( ON ?auto_151621 ?auto_151622 ) ( ON ?auto_151620 ?auto_151621 ) ( ON ?auto_151619 ?auto_151620 ) ( ON ?auto_151618 ?auto_151619 ) ( ON ?auto_151617 ?auto_151618 ) ( CLEAR ?auto_151615 ) ( ON ?auto_151616 ?auto_151617 ) ( CLEAR ?auto_151616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151613 ?auto_151614 ?auto_151615 ?auto_151616 )
      ( MAKE-10PILE ?auto_151613 ?auto_151614 ?auto_151615 ?auto_151616 ?auto_151617 ?auto_151618 ?auto_151619 ?auto_151620 ?auto_151621 ?auto_151622 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_151634 - BLOCK
      ?auto_151635 - BLOCK
      ?auto_151636 - BLOCK
      ?auto_151637 - BLOCK
      ?auto_151638 - BLOCK
      ?auto_151639 - BLOCK
      ?auto_151640 - BLOCK
      ?auto_151641 - BLOCK
      ?auto_151642 - BLOCK
      ?auto_151643 - BLOCK
    )
    :vars
    (
      ?auto_151644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151643 ?auto_151644 ) ( ON-TABLE ?auto_151634 ) ( ON ?auto_151635 ?auto_151634 ) ( not ( = ?auto_151634 ?auto_151635 ) ) ( not ( = ?auto_151634 ?auto_151636 ) ) ( not ( = ?auto_151634 ?auto_151637 ) ) ( not ( = ?auto_151634 ?auto_151638 ) ) ( not ( = ?auto_151634 ?auto_151639 ) ) ( not ( = ?auto_151634 ?auto_151640 ) ) ( not ( = ?auto_151634 ?auto_151641 ) ) ( not ( = ?auto_151634 ?auto_151642 ) ) ( not ( = ?auto_151634 ?auto_151643 ) ) ( not ( = ?auto_151634 ?auto_151644 ) ) ( not ( = ?auto_151635 ?auto_151636 ) ) ( not ( = ?auto_151635 ?auto_151637 ) ) ( not ( = ?auto_151635 ?auto_151638 ) ) ( not ( = ?auto_151635 ?auto_151639 ) ) ( not ( = ?auto_151635 ?auto_151640 ) ) ( not ( = ?auto_151635 ?auto_151641 ) ) ( not ( = ?auto_151635 ?auto_151642 ) ) ( not ( = ?auto_151635 ?auto_151643 ) ) ( not ( = ?auto_151635 ?auto_151644 ) ) ( not ( = ?auto_151636 ?auto_151637 ) ) ( not ( = ?auto_151636 ?auto_151638 ) ) ( not ( = ?auto_151636 ?auto_151639 ) ) ( not ( = ?auto_151636 ?auto_151640 ) ) ( not ( = ?auto_151636 ?auto_151641 ) ) ( not ( = ?auto_151636 ?auto_151642 ) ) ( not ( = ?auto_151636 ?auto_151643 ) ) ( not ( = ?auto_151636 ?auto_151644 ) ) ( not ( = ?auto_151637 ?auto_151638 ) ) ( not ( = ?auto_151637 ?auto_151639 ) ) ( not ( = ?auto_151637 ?auto_151640 ) ) ( not ( = ?auto_151637 ?auto_151641 ) ) ( not ( = ?auto_151637 ?auto_151642 ) ) ( not ( = ?auto_151637 ?auto_151643 ) ) ( not ( = ?auto_151637 ?auto_151644 ) ) ( not ( = ?auto_151638 ?auto_151639 ) ) ( not ( = ?auto_151638 ?auto_151640 ) ) ( not ( = ?auto_151638 ?auto_151641 ) ) ( not ( = ?auto_151638 ?auto_151642 ) ) ( not ( = ?auto_151638 ?auto_151643 ) ) ( not ( = ?auto_151638 ?auto_151644 ) ) ( not ( = ?auto_151639 ?auto_151640 ) ) ( not ( = ?auto_151639 ?auto_151641 ) ) ( not ( = ?auto_151639 ?auto_151642 ) ) ( not ( = ?auto_151639 ?auto_151643 ) ) ( not ( = ?auto_151639 ?auto_151644 ) ) ( not ( = ?auto_151640 ?auto_151641 ) ) ( not ( = ?auto_151640 ?auto_151642 ) ) ( not ( = ?auto_151640 ?auto_151643 ) ) ( not ( = ?auto_151640 ?auto_151644 ) ) ( not ( = ?auto_151641 ?auto_151642 ) ) ( not ( = ?auto_151641 ?auto_151643 ) ) ( not ( = ?auto_151641 ?auto_151644 ) ) ( not ( = ?auto_151642 ?auto_151643 ) ) ( not ( = ?auto_151642 ?auto_151644 ) ) ( not ( = ?auto_151643 ?auto_151644 ) ) ( ON ?auto_151642 ?auto_151643 ) ( ON ?auto_151641 ?auto_151642 ) ( ON ?auto_151640 ?auto_151641 ) ( ON ?auto_151639 ?auto_151640 ) ( ON ?auto_151638 ?auto_151639 ) ( ON ?auto_151637 ?auto_151638 ) ( CLEAR ?auto_151635 ) ( ON ?auto_151636 ?auto_151637 ) ( CLEAR ?auto_151636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_151634 ?auto_151635 ?auto_151636 )
      ( MAKE-10PILE ?auto_151634 ?auto_151635 ?auto_151636 ?auto_151637 ?auto_151638 ?auto_151639 ?auto_151640 ?auto_151641 ?auto_151642 ?auto_151643 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_151655 - BLOCK
      ?auto_151656 - BLOCK
      ?auto_151657 - BLOCK
      ?auto_151658 - BLOCK
      ?auto_151659 - BLOCK
      ?auto_151660 - BLOCK
      ?auto_151661 - BLOCK
      ?auto_151662 - BLOCK
      ?auto_151663 - BLOCK
      ?auto_151664 - BLOCK
    )
    :vars
    (
      ?auto_151665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151664 ?auto_151665 ) ( ON-TABLE ?auto_151655 ) ( ON ?auto_151656 ?auto_151655 ) ( not ( = ?auto_151655 ?auto_151656 ) ) ( not ( = ?auto_151655 ?auto_151657 ) ) ( not ( = ?auto_151655 ?auto_151658 ) ) ( not ( = ?auto_151655 ?auto_151659 ) ) ( not ( = ?auto_151655 ?auto_151660 ) ) ( not ( = ?auto_151655 ?auto_151661 ) ) ( not ( = ?auto_151655 ?auto_151662 ) ) ( not ( = ?auto_151655 ?auto_151663 ) ) ( not ( = ?auto_151655 ?auto_151664 ) ) ( not ( = ?auto_151655 ?auto_151665 ) ) ( not ( = ?auto_151656 ?auto_151657 ) ) ( not ( = ?auto_151656 ?auto_151658 ) ) ( not ( = ?auto_151656 ?auto_151659 ) ) ( not ( = ?auto_151656 ?auto_151660 ) ) ( not ( = ?auto_151656 ?auto_151661 ) ) ( not ( = ?auto_151656 ?auto_151662 ) ) ( not ( = ?auto_151656 ?auto_151663 ) ) ( not ( = ?auto_151656 ?auto_151664 ) ) ( not ( = ?auto_151656 ?auto_151665 ) ) ( not ( = ?auto_151657 ?auto_151658 ) ) ( not ( = ?auto_151657 ?auto_151659 ) ) ( not ( = ?auto_151657 ?auto_151660 ) ) ( not ( = ?auto_151657 ?auto_151661 ) ) ( not ( = ?auto_151657 ?auto_151662 ) ) ( not ( = ?auto_151657 ?auto_151663 ) ) ( not ( = ?auto_151657 ?auto_151664 ) ) ( not ( = ?auto_151657 ?auto_151665 ) ) ( not ( = ?auto_151658 ?auto_151659 ) ) ( not ( = ?auto_151658 ?auto_151660 ) ) ( not ( = ?auto_151658 ?auto_151661 ) ) ( not ( = ?auto_151658 ?auto_151662 ) ) ( not ( = ?auto_151658 ?auto_151663 ) ) ( not ( = ?auto_151658 ?auto_151664 ) ) ( not ( = ?auto_151658 ?auto_151665 ) ) ( not ( = ?auto_151659 ?auto_151660 ) ) ( not ( = ?auto_151659 ?auto_151661 ) ) ( not ( = ?auto_151659 ?auto_151662 ) ) ( not ( = ?auto_151659 ?auto_151663 ) ) ( not ( = ?auto_151659 ?auto_151664 ) ) ( not ( = ?auto_151659 ?auto_151665 ) ) ( not ( = ?auto_151660 ?auto_151661 ) ) ( not ( = ?auto_151660 ?auto_151662 ) ) ( not ( = ?auto_151660 ?auto_151663 ) ) ( not ( = ?auto_151660 ?auto_151664 ) ) ( not ( = ?auto_151660 ?auto_151665 ) ) ( not ( = ?auto_151661 ?auto_151662 ) ) ( not ( = ?auto_151661 ?auto_151663 ) ) ( not ( = ?auto_151661 ?auto_151664 ) ) ( not ( = ?auto_151661 ?auto_151665 ) ) ( not ( = ?auto_151662 ?auto_151663 ) ) ( not ( = ?auto_151662 ?auto_151664 ) ) ( not ( = ?auto_151662 ?auto_151665 ) ) ( not ( = ?auto_151663 ?auto_151664 ) ) ( not ( = ?auto_151663 ?auto_151665 ) ) ( not ( = ?auto_151664 ?auto_151665 ) ) ( ON ?auto_151663 ?auto_151664 ) ( ON ?auto_151662 ?auto_151663 ) ( ON ?auto_151661 ?auto_151662 ) ( ON ?auto_151660 ?auto_151661 ) ( ON ?auto_151659 ?auto_151660 ) ( ON ?auto_151658 ?auto_151659 ) ( CLEAR ?auto_151656 ) ( ON ?auto_151657 ?auto_151658 ) ( CLEAR ?auto_151657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_151655 ?auto_151656 ?auto_151657 )
      ( MAKE-10PILE ?auto_151655 ?auto_151656 ?auto_151657 ?auto_151658 ?auto_151659 ?auto_151660 ?auto_151661 ?auto_151662 ?auto_151663 ?auto_151664 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_151676 - BLOCK
      ?auto_151677 - BLOCK
      ?auto_151678 - BLOCK
      ?auto_151679 - BLOCK
      ?auto_151680 - BLOCK
      ?auto_151681 - BLOCK
      ?auto_151682 - BLOCK
      ?auto_151683 - BLOCK
      ?auto_151684 - BLOCK
      ?auto_151685 - BLOCK
    )
    :vars
    (
      ?auto_151686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151685 ?auto_151686 ) ( ON-TABLE ?auto_151676 ) ( not ( = ?auto_151676 ?auto_151677 ) ) ( not ( = ?auto_151676 ?auto_151678 ) ) ( not ( = ?auto_151676 ?auto_151679 ) ) ( not ( = ?auto_151676 ?auto_151680 ) ) ( not ( = ?auto_151676 ?auto_151681 ) ) ( not ( = ?auto_151676 ?auto_151682 ) ) ( not ( = ?auto_151676 ?auto_151683 ) ) ( not ( = ?auto_151676 ?auto_151684 ) ) ( not ( = ?auto_151676 ?auto_151685 ) ) ( not ( = ?auto_151676 ?auto_151686 ) ) ( not ( = ?auto_151677 ?auto_151678 ) ) ( not ( = ?auto_151677 ?auto_151679 ) ) ( not ( = ?auto_151677 ?auto_151680 ) ) ( not ( = ?auto_151677 ?auto_151681 ) ) ( not ( = ?auto_151677 ?auto_151682 ) ) ( not ( = ?auto_151677 ?auto_151683 ) ) ( not ( = ?auto_151677 ?auto_151684 ) ) ( not ( = ?auto_151677 ?auto_151685 ) ) ( not ( = ?auto_151677 ?auto_151686 ) ) ( not ( = ?auto_151678 ?auto_151679 ) ) ( not ( = ?auto_151678 ?auto_151680 ) ) ( not ( = ?auto_151678 ?auto_151681 ) ) ( not ( = ?auto_151678 ?auto_151682 ) ) ( not ( = ?auto_151678 ?auto_151683 ) ) ( not ( = ?auto_151678 ?auto_151684 ) ) ( not ( = ?auto_151678 ?auto_151685 ) ) ( not ( = ?auto_151678 ?auto_151686 ) ) ( not ( = ?auto_151679 ?auto_151680 ) ) ( not ( = ?auto_151679 ?auto_151681 ) ) ( not ( = ?auto_151679 ?auto_151682 ) ) ( not ( = ?auto_151679 ?auto_151683 ) ) ( not ( = ?auto_151679 ?auto_151684 ) ) ( not ( = ?auto_151679 ?auto_151685 ) ) ( not ( = ?auto_151679 ?auto_151686 ) ) ( not ( = ?auto_151680 ?auto_151681 ) ) ( not ( = ?auto_151680 ?auto_151682 ) ) ( not ( = ?auto_151680 ?auto_151683 ) ) ( not ( = ?auto_151680 ?auto_151684 ) ) ( not ( = ?auto_151680 ?auto_151685 ) ) ( not ( = ?auto_151680 ?auto_151686 ) ) ( not ( = ?auto_151681 ?auto_151682 ) ) ( not ( = ?auto_151681 ?auto_151683 ) ) ( not ( = ?auto_151681 ?auto_151684 ) ) ( not ( = ?auto_151681 ?auto_151685 ) ) ( not ( = ?auto_151681 ?auto_151686 ) ) ( not ( = ?auto_151682 ?auto_151683 ) ) ( not ( = ?auto_151682 ?auto_151684 ) ) ( not ( = ?auto_151682 ?auto_151685 ) ) ( not ( = ?auto_151682 ?auto_151686 ) ) ( not ( = ?auto_151683 ?auto_151684 ) ) ( not ( = ?auto_151683 ?auto_151685 ) ) ( not ( = ?auto_151683 ?auto_151686 ) ) ( not ( = ?auto_151684 ?auto_151685 ) ) ( not ( = ?auto_151684 ?auto_151686 ) ) ( not ( = ?auto_151685 ?auto_151686 ) ) ( ON ?auto_151684 ?auto_151685 ) ( ON ?auto_151683 ?auto_151684 ) ( ON ?auto_151682 ?auto_151683 ) ( ON ?auto_151681 ?auto_151682 ) ( ON ?auto_151680 ?auto_151681 ) ( ON ?auto_151679 ?auto_151680 ) ( ON ?auto_151678 ?auto_151679 ) ( CLEAR ?auto_151676 ) ( ON ?auto_151677 ?auto_151678 ) ( CLEAR ?auto_151677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_151676 ?auto_151677 )
      ( MAKE-10PILE ?auto_151676 ?auto_151677 ?auto_151678 ?auto_151679 ?auto_151680 ?auto_151681 ?auto_151682 ?auto_151683 ?auto_151684 ?auto_151685 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_151697 - BLOCK
      ?auto_151698 - BLOCK
      ?auto_151699 - BLOCK
      ?auto_151700 - BLOCK
      ?auto_151701 - BLOCK
      ?auto_151702 - BLOCK
      ?auto_151703 - BLOCK
      ?auto_151704 - BLOCK
      ?auto_151705 - BLOCK
      ?auto_151706 - BLOCK
    )
    :vars
    (
      ?auto_151707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151706 ?auto_151707 ) ( ON-TABLE ?auto_151697 ) ( not ( = ?auto_151697 ?auto_151698 ) ) ( not ( = ?auto_151697 ?auto_151699 ) ) ( not ( = ?auto_151697 ?auto_151700 ) ) ( not ( = ?auto_151697 ?auto_151701 ) ) ( not ( = ?auto_151697 ?auto_151702 ) ) ( not ( = ?auto_151697 ?auto_151703 ) ) ( not ( = ?auto_151697 ?auto_151704 ) ) ( not ( = ?auto_151697 ?auto_151705 ) ) ( not ( = ?auto_151697 ?auto_151706 ) ) ( not ( = ?auto_151697 ?auto_151707 ) ) ( not ( = ?auto_151698 ?auto_151699 ) ) ( not ( = ?auto_151698 ?auto_151700 ) ) ( not ( = ?auto_151698 ?auto_151701 ) ) ( not ( = ?auto_151698 ?auto_151702 ) ) ( not ( = ?auto_151698 ?auto_151703 ) ) ( not ( = ?auto_151698 ?auto_151704 ) ) ( not ( = ?auto_151698 ?auto_151705 ) ) ( not ( = ?auto_151698 ?auto_151706 ) ) ( not ( = ?auto_151698 ?auto_151707 ) ) ( not ( = ?auto_151699 ?auto_151700 ) ) ( not ( = ?auto_151699 ?auto_151701 ) ) ( not ( = ?auto_151699 ?auto_151702 ) ) ( not ( = ?auto_151699 ?auto_151703 ) ) ( not ( = ?auto_151699 ?auto_151704 ) ) ( not ( = ?auto_151699 ?auto_151705 ) ) ( not ( = ?auto_151699 ?auto_151706 ) ) ( not ( = ?auto_151699 ?auto_151707 ) ) ( not ( = ?auto_151700 ?auto_151701 ) ) ( not ( = ?auto_151700 ?auto_151702 ) ) ( not ( = ?auto_151700 ?auto_151703 ) ) ( not ( = ?auto_151700 ?auto_151704 ) ) ( not ( = ?auto_151700 ?auto_151705 ) ) ( not ( = ?auto_151700 ?auto_151706 ) ) ( not ( = ?auto_151700 ?auto_151707 ) ) ( not ( = ?auto_151701 ?auto_151702 ) ) ( not ( = ?auto_151701 ?auto_151703 ) ) ( not ( = ?auto_151701 ?auto_151704 ) ) ( not ( = ?auto_151701 ?auto_151705 ) ) ( not ( = ?auto_151701 ?auto_151706 ) ) ( not ( = ?auto_151701 ?auto_151707 ) ) ( not ( = ?auto_151702 ?auto_151703 ) ) ( not ( = ?auto_151702 ?auto_151704 ) ) ( not ( = ?auto_151702 ?auto_151705 ) ) ( not ( = ?auto_151702 ?auto_151706 ) ) ( not ( = ?auto_151702 ?auto_151707 ) ) ( not ( = ?auto_151703 ?auto_151704 ) ) ( not ( = ?auto_151703 ?auto_151705 ) ) ( not ( = ?auto_151703 ?auto_151706 ) ) ( not ( = ?auto_151703 ?auto_151707 ) ) ( not ( = ?auto_151704 ?auto_151705 ) ) ( not ( = ?auto_151704 ?auto_151706 ) ) ( not ( = ?auto_151704 ?auto_151707 ) ) ( not ( = ?auto_151705 ?auto_151706 ) ) ( not ( = ?auto_151705 ?auto_151707 ) ) ( not ( = ?auto_151706 ?auto_151707 ) ) ( ON ?auto_151705 ?auto_151706 ) ( ON ?auto_151704 ?auto_151705 ) ( ON ?auto_151703 ?auto_151704 ) ( ON ?auto_151702 ?auto_151703 ) ( ON ?auto_151701 ?auto_151702 ) ( ON ?auto_151700 ?auto_151701 ) ( ON ?auto_151699 ?auto_151700 ) ( CLEAR ?auto_151697 ) ( ON ?auto_151698 ?auto_151699 ) ( CLEAR ?auto_151698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_151697 ?auto_151698 )
      ( MAKE-10PILE ?auto_151697 ?auto_151698 ?auto_151699 ?auto_151700 ?auto_151701 ?auto_151702 ?auto_151703 ?auto_151704 ?auto_151705 ?auto_151706 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_151718 - BLOCK
      ?auto_151719 - BLOCK
      ?auto_151720 - BLOCK
      ?auto_151721 - BLOCK
      ?auto_151722 - BLOCK
      ?auto_151723 - BLOCK
      ?auto_151724 - BLOCK
      ?auto_151725 - BLOCK
      ?auto_151726 - BLOCK
      ?auto_151727 - BLOCK
    )
    :vars
    (
      ?auto_151728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151727 ?auto_151728 ) ( not ( = ?auto_151718 ?auto_151719 ) ) ( not ( = ?auto_151718 ?auto_151720 ) ) ( not ( = ?auto_151718 ?auto_151721 ) ) ( not ( = ?auto_151718 ?auto_151722 ) ) ( not ( = ?auto_151718 ?auto_151723 ) ) ( not ( = ?auto_151718 ?auto_151724 ) ) ( not ( = ?auto_151718 ?auto_151725 ) ) ( not ( = ?auto_151718 ?auto_151726 ) ) ( not ( = ?auto_151718 ?auto_151727 ) ) ( not ( = ?auto_151718 ?auto_151728 ) ) ( not ( = ?auto_151719 ?auto_151720 ) ) ( not ( = ?auto_151719 ?auto_151721 ) ) ( not ( = ?auto_151719 ?auto_151722 ) ) ( not ( = ?auto_151719 ?auto_151723 ) ) ( not ( = ?auto_151719 ?auto_151724 ) ) ( not ( = ?auto_151719 ?auto_151725 ) ) ( not ( = ?auto_151719 ?auto_151726 ) ) ( not ( = ?auto_151719 ?auto_151727 ) ) ( not ( = ?auto_151719 ?auto_151728 ) ) ( not ( = ?auto_151720 ?auto_151721 ) ) ( not ( = ?auto_151720 ?auto_151722 ) ) ( not ( = ?auto_151720 ?auto_151723 ) ) ( not ( = ?auto_151720 ?auto_151724 ) ) ( not ( = ?auto_151720 ?auto_151725 ) ) ( not ( = ?auto_151720 ?auto_151726 ) ) ( not ( = ?auto_151720 ?auto_151727 ) ) ( not ( = ?auto_151720 ?auto_151728 ) ) ( not ( = ?auto_151721 ?auto_151722 ) ) ( not ( = ?auto_151721 ?auto_151723 ) ) ( not ( = ?auto_151721 ?auto_151724 ) ) ( not ( = ?auto_151721 ?auto_151725 ) ) ( not ( = ?auto_151721 ?auto_151726 ) ) ( not ( = ?auto_151721 ?auto_151727 ) ) ( not ( = ?auto_151721 ?auto_151728 ) ) ( not ( = ?auto_151722 ?auto_151723 ) ) ( not ( = ?auto_151722 ?auto_151724 ) ) ( not ( = ?auto_151722 ?auto_151725 ) ) ( not ( = ?auto_151722 ?auto_151726 ) ) ( not ( = ?auto_151722 ?auto_151727 ) ) ( not ( = ?auto_151722 ?auto_151728 ) ) ( not ( = ?auto_151723 ?auto_151724 ) ) ( not ( = ?auto_151723 ?auto_151725 ) ) ( not ( = ?auto_151723 ?auto_151726 ) ) ( not ( = ?auto_151723 ?auto_151727 ) ) ( not ( = ?auto_151723 ?auto_151728 ) ) ( not ( = ?auto_151724 ?auto_151725 ) ) ( not ( = ?auto_151724 ?auto_151726 ) ) ( not ( = ?auto_151724 ?auto_151727 ) ) ( not ( = ?auto_151724 ?auto_151728 ) ) ( not ( = ?auto_151725 ?auto_151726 ) ) ( not ( = ?auto_151725 ?auto_151727 ) ) ( not ( = ?auto_151725 ?auto_151728 ) ) ( not ( = ?auto_151726 ?auto_151727 ) ) ( not ( = ?auto_151726 ?auto_151728 ) ) ( not ( = ?auto_151727 ?auto_151728 ) ) ( ON ?auto_151726 ?auto_151727 ) ( ON ?auto_151725 ?auto_151726 ) ( ON ?auto_151724 ?auto_151725 ) ( ON ?auto_151723 ?auto_151724 ) ( ON ?auto_151722 ?auto_151723 ) ( ON ?auto_151721 ?auto_151722 ) ( ON ?auto_151720 ?auto_151721 ) ( ON ?auto_151719 ?auto_151720 ) ( ON ?auto_151718 ?auto_151719 ) ( CLEAR ?auto_151718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_151718 )
      ( MAKE-10PILE ?auto_151718 ?auto_151719 ?auto_151720 ?auto_151721 ?auto_151722 ?auto_151723 ?auto_151724 ?auto_151725 ?auto_151726 ?auto_151727 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_151739 - BLOCK
      ?auto_151740 - BLOCK
      ?auto_151741 - BLOCK
      ?auto_151742 - BLOCK
      ?auto_151743 - BLOCK
      ?auto_151744 - BLOCK
      ?auto_151745 - BLOCK
      ?auto_151746 - BLOCK
      ?auto_151747 - BLOCK
      ?auto_151748 - BLOCK
    )
    :vars
    (
      ?auto_151749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151748 ?auto_151749 ) ( not ( = ?auto_151739 ?auto_151740 ) ) ( not ( = ?auto_151739 ?auto_151741 ) ) ( not ( = ?auto_151739 ?auto_151742 ) ) ( not ( = ?auto_151739 ?auto_151743 ) ) ( not ( = ?auto_151739 ?auto_151744 ) ) ( not ( = ?auto_151739 ?auto_151745 ) ) ( not ( = ?auto_151739 ?auto_151746 ) ) ( not ( = ?auto_151739 ?auto_151747 ) ) ( not ( = ?auto_151739 ?auto_151748 ) ) ( not ( = ?auto_151739 ?auto_151749 ) ) ( not ( = ?auto_151740 ?auto_151741 ) ) ( not ( = ?auto_151740 ?auto_151742 ) ) ( not ( = ?auto_151740 ?auto_151743 ) ) ( not ( = ?auto_151740 ?auto_151744 ) ) ( not ( = ?auto_151740 ?auto_151745 ) ) ( not ( = ?auto_151740 ?auto_151746 ) ) ( not ( = ?auto_151740 ?auto_151747 ) ) ( not ( = ?auto_151740 ?auto_151748 ) ) ( not ( = ?auto_151740 ?auto_151749 ) ) ( not ( = ?auto_151741 ?auto_151742 ) ) ( not ( = ?auto_151741 ?auto_151743 ) ) ( not ( = ?auto_151741 ?auto_151744 ) ) ( not ( = ?auto_151741 ?auto_151745 ) ) ( not ( = ?auto_151741 ?auto_151746 ) ) ( not ( = ?auto_151741 ?auto_151747 ) ) ( not ( = ?auto_151741 ?auto_151748 ) ) ( not ( = ?auto_151741 ?auto_151749 ) ) ( not ( = ?auto_151742 ?auto_151743 ) ) ( not ( = ?auto_151742 ?auto_151744 ) ) ( not ( = ?auto_151742 ?auto_151745 ) ) ( not ( = ?auto_151742 ?auto_151746 ) ) ( not ( = ?auto_151742 ?auto_151747 ) ) ( not ( = ?auto_151742 ?auto_151748 ) ) ( not ( = ?auto_151742 ?auto_151749 ) ) ( not ( = ?auto_151743 ?auto_151744 ) ) ( not ( = ?auto_151743 ?auto_151745 ) ) ( not ( = ?auto_151743 ?auto_151746 ) ) ( not ( = ?auto_151743 ?auto_151747 ) ) ( not ( = ?auto_151743 ?auto_151748 ) ) ( not ( = ?auto_151743 ?auto_151749 ) ) ( not ( = ?auto_151744 ?auto_151745 ) ) ( not ( = ?auto_151744 ?auto_151746 ) ) ( not ( = ?auto_151744 ?auto_151747 ) ) ( not ( = ?auto_151744 ?auto_151748 ) ) ( not ( = ?auto_151744 ?auto_151749 ) ) ( not ( = ?auto_151745 ?auto_151746 ) ) ( not ( = ?auto_151745 ?auto_151747 ) ) ( not ( = ?auto_151745 ?auto_151748 ) ) ( not ( = ?auto_151745 ?auto_151749 ) ) ( not ( = ?auto_151746 ?auto_151747 ) ) ( not ( = ?auto_151746 ?auto_151748 ) ) ( not ( = ?auto_151746 ?auto_151749 ) ) ( not ( = ?auto_151747 ?auto_151748 ) ) ( not ( = ?auto_151747 ?auto_151749 ) ) ( not ( = ?auto_151748 ?auto_151749 ) ) ( ON ?auto_151747 ?auto_151748 ) ( ON ?auto_151746 ?auto_151747 ) ( ON ?auto_151745 ?auto_151746 ) ( ON ?auto_151744 ?auto_151745 ) ( ON ?auto_151743 ?auto_151744 ) ( ON ?auto_151742 ?auto_151743 ) ( ON ?auto_151741 ?auto_151742 ) ( ON ?auto_151740 ?auto_151741 ) ( ON ?auto_151739 ?auto_151740 ) ( CLEAR ?auto_151739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_151739 )
      ( MAKE-10PILE ?auto_151739 ?auto_151740 ?auto_151741 ?auto_151742 ?auto_151743 ?auto_151744 ?auto_151745 ?auto_151746 ?auto_151747 ?auto_151748 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_151761 - BLOCK
      ?auto_151762 - BLOCK
      ?auto_151763 - BLOCK
      ?auto_151764 - BLOCK
      ?auto_151765 - BLOCK
      ?auto_151766 - BLOCK
      ?auto_151767 - BLOCK
      ?auto_151768 - BLOCK
      ?auto_151769 - BLOCK
      ?auto_151770 - BLOCK
      ?auto_151771 - BLOCK
    )
    :vars
    (
      ?auto_151772 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_151770 ) ( ON ?auto_151771 ?auto_151772 ) ( CLEAR ?auto_151771 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_151761 ) ( ON ?auto_151762 ?auto_151761 ) ( ON ?auto_151763 ?auto_151762 ) ( ON ?auto_151764 ?auto_151763 ) ( ON ?auto_151765 ?auto_151764 ) ( ON ?auto_151766 ?auto_151765 ) ( ON ?auto_151767 ?auto_151766 ) ( ON ?auto_151768 ?auto_151767 ) ( ON ?auto_151769 ?auto_151768 ) ( ON ?auto_151770 ?auto_151769 ) ( not ( = ?auto_151761 ?auto_151762 ) ) ( not ( = ?auto_151761 ?auto_151763 ) ) ( not ( = ?auto_151761 ?auto_151764 ) ) ( not ( = ?auto_151761 ?auto_151765 ) ) ( not ( = ?auto_151761 ?auto_151766 ) ) ( not ( = ?auto_151761 ?auto_151767 ) ) ( not ( = ?auto_151761 ?auto_151768 ) ) ( not ( = ?auto_151761 ?auto_151769 ) ) ( not ( = ?auto_151761 ?auto_151770 ) ) ( not ( = ?auto_151761 ?auto_151771 ) ) ( not ( = ?auto_151761 ?auto_151772 ) ) ( not ( = ?auto_151762 ?auto_151763 ) ) ( not ( = ?auto_151762 ?auto_151764 ) ) ( not ( = ?auto_151762 ?auto_151765 ) ) ( not ( = ?auto_151762 ?auto_151766 ) ) ( not ( = ?auto_151762 ?auto_151767 ) ) ( not ( = ?auto_151762 ?auto_151768 ) ) ( not ( = ?auto_151762 ?auto_151769 ) ) ( not ( = ?auto_151762 ?auto_151770 ) ) ( not ( = ?auto_151762 ?auto_151771 ) ) ( not ( = ?auto_151762 ?auto_151772 ) ) ( not ( = ?auto_151763 ?auto_151764 ) ) ( not ( = ?auto_151763 ?auto_151765 ) ) ( not ( = ?auto_151763 ?auto_151766 ) ) ( not ( = ?auto_151763 ?auto_151767 ) ) ( not ( = ?auto_151763 ?auto_151768 ) ) ( not ( = ?auto_151763 ?auto_151769 ) ) ( not ( = ?auto_151763 ?auto_151770 ) ) ( not ( = ?auto_151763 ?auto_151771 ) ) ( not ( = ?auto_151763 ?auto_151772 ) ) ( not ( = ?auto_151764 ?auto_151765 ) ) ( not ( = ?auto_151764 ?auto_151766 ) ) ( not ( = ?auto_151764 ?auto_151767 ) ) ( not ( = ?auto_151764 ?auto_151768 ) ) ( not ( = ?auto_151764 ?auto_151769 ) ) ( not ( = ?auto_151764 ?auto_151770 ) ) ( not ( = ?auto_151764 ?auto_151771 ) ) ( not ( = ?auto_151764 ?auto_151772 ) ) ( not ( = ?auto_151765 ?auto_151766 ) ) ( not ( = ?auto_151765 ?auto_151767 ) ) ( not ( = ?auto_151765 ?auto_151768 ) ) ( not ( = ?auto_151765 ?auto_151769 ) ) ( not ( = ?auto_151765 ?auto_151770 ) ) ( not ( = ?auto_151765 ?auto_151771 ) ) ( not ( = ?auto_151765 ?auto_151772 ) ) ( not ( = ?auto_151766 ?auto_151767 ) ) ( not ( = ?auto_151766 ?auto_151768 ) ) ( not ( = ?auto_151766 ?auto_151769 ) ) ( not ( = ?auto_151766 ?auto_151770 ) ) ( not ( = ?auto_151766 ?auto_151771 ) ) ( not ( = ?auto_151766 ?auto_151772 ) ) ( not ( = ?auto_151767 ?auto_151768 ) ) ( not ( = ?auto_151767 ?auto_151769 ) ) ( not ( = ?auto_151767 ?auto_151770 ) ) ( not ( = ?auto_151767 ?auto_151771 ) ) ( not ( = ?auto_151767 ?auto_151772 ) ) ( not ( = ?auto_151768 ?auto_151769 ) ) ( not ( = ?auto_151768 ?auto_151770 ) ) ( not ( = ?auto_151768 ?auto_151771 ) ) ( not ( = ?auto_151768 ?auto_151772 ) ) ( not ( = ?auto_151769 ?auto_151770 ) ) ( not ( = ?auto_151769 ?auto_151771 ) ) ( not ( = ?auto_151769 ?auto_151772 ) ) ( not ( = ?auto_151770 ?auto_151771 ) ) ( not ( = ?auto_151770 ?auto_151772 ) ) ( not ( = ?auto_151771 ?auto_151772 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_151771 ?auto_151772 )
      ( !STACK ?auto_151771 ?auto_151770 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_151784 - BLOCK
      ?auto_151785 - BLOCK
      ?auto_151786 - BLOCK
      ?auto_151787 - BLOCK
      ?auto_151788 - BLOCK
      ?auto_151789 - BLOCK
      ?auto_151790 - BLOCK
      ?auto_151791 - BLOCK
      ?auto_151792 - BLOCK
      ?auto_151793 - BLOCK
      ?auto_151794 - BLOCK
    )
    :vars
    (
      ?auto_151795 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_151793 ) ( ON ?auto_151794 ?auto_151795 ) ( CLEAR ?auto_151794 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_151784 ) ( ON ?auto_151785 ?auto_151784 ) ( ON ?auto_151786 ?auto_151785 ) ( ON ?auto_151787 ?auto_151786 ) ( ON ?auto_151788 ?auto_151787 ) ( ON ?auto_151789 ?auto_151788 ) ( ON ?auto_151790 ?auto_151789 ) ( ON ?auto_151791 ?auto_151790 ) ( ON ?auto_151792 ?auto_151791 ) ( ON ?auto_151793 ?auto_151792 ) ( not ( = ?auto_151784 ?auto_151785 ) ) ( not ( = ?auto_151784 ?auto_151786 ) ) ( not ( = ?auto_151784 ?auto_151787 ) ) ( not ( = ?auto_151784 ?auto_151788 ) ) ( not ( = ?auto_151784 ?auto_151789 ) ) ( not ( = ?auto_151784 ?auto_151790 ) ) ( not ( = ?auto_151784 ?auto_151791 ) ) ( not ( = ?auto_151784 ?auto_151792 ) ) ( not ( = ?auto_151784 ?auto_151793 ) ) ( not ( = ?auto_151784 ?auto_151794 ) ) ( not ( = ?auto_151784 ?auto_151795 ) ) ( not ( = ?auto_151785 ?auto_151786 ) ) ( not ( = ?auto_151785 ?auto_151787 ) ) ( not ( = ?auto_151785 ?auto_151788 ) ) ( not ( = ?auto_151785 ?auto_151789 ) ) ( not ( = ?auto_151785 ?auto_151790 ) ) ( not ( = ?auto_151785 ?auto_151791 ) ) ( not ( = ?auto_151785 ?auto_151792 ) ) ( not ( = ?auto_151785 ?auto_151793 ) ) ( not ( = ?auto_151785 ?auto_151794 ) ) ( not ( = ?auto_151785 ?auto_151795 ) ) ( not ( = ?auto_151786 ?auto_151787 ) ) ( not ( = ?auto_151786 ?auto_151788 ) ) ( not ( = ?auto_151786 ?auto_151789 ) ) ( not ( = ?auto_151786 ?auto_151790 ) ) ( not ( = ?auto_151786 ?auto_151791 ) ) ( not ( = ?auto_151786 ?auto_151792 ) ) ( not ( = ?auto_151786 ?auto_151793 ) ) ( not ( = ?auto_151786 ?auto_151794 ) ) ( not ( = ?auto_151786 ?auto_151795 ) ) ( not ( = ?auto_151787 ?auto_151788 ) ) ( not ( = ?auto_151787 ?auto_151789 ) ) ( not ( = ?auto_151787 ?auto_151790 ) ) ( not ( = ?auto_151787 ?auto_151791 ) ) ( not ( = ?auto_151787 ?auto_151792 ) ) ( not ( = ?auto_151787 ?auto_151793 ) ) ( not ( = ?auto_151787 ?auto_151794 ) ) ( not ( = ?auto_151787 ?auto_151795 ) ) ( not ( = ?auto_151788 ?auto_151789 ) ) ( not ( = ?auto_151788 ?auto_151790 ) ) ( not ( = ?auto_151788 ?auto_151791 ) ) ( not ( = ?auto_151788 ?auto_151792 ) ) ( not ( = ?auto_151788 ?auto_151793 ) ) ( not ( = ?auto_151788 ?auto_151794 ) ) ( not ( = ?auto_151788 ?auto_151795 ) ) ( not ( = ?auto_151789 ?auto_151790 ) ) ( not ( = ?auto_151789 ?auto_151791 ) ) ( not ( = ?auto_151789 ?auto_151792 ) ) ( not ( = ?auto_151789 ?auto_151793 ) ) ( not ( = ?auto_151789 ?auto_151794 ) ) ( not ( = ?auto_151789 ?auto_151795 ) ) ( not ( = ?auto_151790 ?auto_151791 ) ) ( not ( = ?auto_151790 ?auto_151792 ) ) ( not ( = ?auto_151790 ?auto_151793 ) ) ( not ( = ?auto_151790 ?auto_151794 ) ) ( not ( = ?auto_151790 ?auto_151795 ) ) ( not ( = ?auto_151791 ?auto_151792 ) ) ( not ( = ?auto_151791 ?auto_151793 ) ) ( not ( = ?auto_151791 ?auto_151794 ) ) ( not ( = ?auto_151791 ?auto_151795 ) ) ( not ( = ?auto_151792 ?auto_151793 ) ) ( not ( = ?auto_151792 ?auto_151794 ) ) ( not ( = ?auto_151792 ?auto_151795 ) ) ( not ( = ?auto_151793 ?auto_151794 ) ) ( not ( = ?auto_151793 ?auto_151795 ) ) ( not ( = ?auto_151794 ?auto_151795 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_151794 ?auto_151795 )
      ( !STACK ?auto_151794 ?auto_151793 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_151807 - BLOCK
      ?auto_151808 - BLOCK
      ?auto_151809 - BLOCK
      ?auto_151810 - BLOCK
      ?auto_151811 - BLOCK
      ?auto_151812 - BLOCK
      ?auto_151813 - BLOCK
      ?auto_151814 - BLOCK
      ?auto_151815 - BLOCK
      ?auto_151816 - BLOCK
      ?auto_151817 - BLOCK
    )
    :vars
    (
      ?auto_151818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151817 ?auto_151818 ) ( ON-TABLE ?auto_151807 ) ( ON ?auto_151808 ?auto_151807 ) ( ON ?auto_151809 ?auto_151808 ) ( ON ?auto_151810 ?auto_151809 ) ( ON ?auto_151811 ?auto_151810 ) ( ON ?auto_151812 ?auto_151811 ) ( ON ?auto_151813 ?auto_151812 ) ( ON ?auto_151814 ?auto_151813 ) ( ON ?auto_151815 ?auto_151814 ) ( not ( = ?auto_151807 ?auto_151808 ) ) ( not ( = ?auto_151807 ?auto_151809 ) ) ( not ( = ?auto_151807 ?auto_151810 ) ) ( not ( = ?auto_151807 ?auto_151811 ) ) ( not ( = ?auto_151807 ?auto_151812 ) ) ( not ( = ?auto_151807 ?auto_151813 ) ) ( not ( = ?auto_151807 ?auto_151814 ) ) ( not ( = ?auto_151807 ?auto_151815 ) ) ( not ( = ?auto_151807 ?auto_151816 ) ) ( not ( = ?auto_151807 ?auto_151817 ) ) ( not ( = ?auto_151807 ?auto_151818 ) ) ( not ( = ?auto_151808 ?auto_151809 ) ) ( not ( = ?auto_151808 ?auto_151810 ) ) ( not ( = ?auto_151808 ?auto_151811 ) ) ( not ( = ?auto_151808 ?auto_151812 ) ) ( not ( = ?auto_151808 ?auto_151813 ) ) ( not ( = ?auto_151808 ?auto_151814 ) ) ( not ( = ?auto_151808 ?auto_151815 ) ) ( not ( = ?auto_151808 ?auto_151816 ) ) ( not ( = ?auto_151808 ?auto_151817 ) ) ( not ( = ?auto_151808 ?auto_151818 ) ) ( not ( = ?auto_151809 ?auto_151810 ) ) ( not ( = ?auto_151809 ?auto_151811 ) ) ( not ( = ?auto_151809 ?auto_151812 ) ) ( not ( = ?auto_151809 ?auto_151813 ) ) ( not ( = ?auto_151809 ?auto_151814 ) ) ( not ( = ?auto_151809 ?auto_151815 ) ) ( not ( = ?auto_151809 ?auto_151816 ) ) ( not ( = ?auto_151809 ?auto_151817 ) ) ( not ( = ?auto_151809 ?auto_151818 ) ) ( not ( = ?auto_151810 ?auto_151811 ) ) ( not ( = ?auto_151810 ?auto_151812 ) ) ( not ( = ?auto_151810 ?auto_151813 ) ) ( not ( = ?auto_151810 ?auto_151814 ) ) ( not ( = ?auto_151810 ?auto_151815 ) ) ( not ( = ?auto_151810 ?auto_151816 ) ) ( not ( = ?auto_151810 ?auto_151817 ) ) ( not ( = ?auto_151810 ?auto_151818 ) ) ( not ( = ?auto_151811 ?auto_151812 ) ) ( not ( = ?auto_151811 ?auto_151813 ) ) ( not ( = ?auto_151811 ?auto_151814 ) ) ( not ( = ?auto_151811 ?auto_151815 ) ) ( not ( = ?auto_151811 ?auto_151816 ) ) ( not ( = ?auto_151811 ?auto_151817 ) ) ( not ( = ?auto_151811 ?auto_151818 ) ) ( not ( = ?auto_151812 ?auto_151813 ) ) ( not ( = ?auto_151812 ?auto_151814 ) ) ( not ( = ?auto_151812 ?auto_151815 ) ) ( not ( = ?auto_151812 ?auto_151816 ) ) ( not ( = ?auto_151812 ?auto_151817 ) ) ( not ( = ?auto_151812 ?auto_151818 ) ) ( not ( = ?auto_151813 ?auto_151814 ) ) ( not ( = ?auto_151813 ?auto_151815 ) ) ( not ( = ?auto_151813 ?auto_151816 ) ) ( not ( = ?auto_151813 ?auto_151817 ) ) ( not ( = ?auto_151813 ?auto_151818 ) ) ( not ( = ?auto_151814 ?auto_151815 ) ) ( not ( = ?auto_151814 ?auto_151816 ) ) ( not ( = ?auto_151814 ?auto_151817 ) ) ( not ( = ?auto_151814 ?auto_151818 ) ) ( not ( = ?auto_151815 ?auto_151816 ) ) ( not ( = ?auto_151815 ?auto_151817 ) ) ( not ( = ?auto_151815 ?auto_151818 ) ) ( not ( = ?auto_151816 ?auto_151817 ) ) ( not ( = ?auto_151816 ?auto_151818 ) ) ( not ( = ?auto_151817 ?auto_151818 ) ) ( CLEAR ?auto_151815 ) ( ON ?auto_151816 ?auto_151817 ) ( CLEAR ?auto_151816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_151807 ?auto_151808 ?auto_151809 ?auto_151810 ?auto_151811 ?auto_151812 ?auto_151813 ?auto_151814 ?auto_151815 ?auto_151816 )
      ( MAKE-11PILE ?auto_151807 ?auto_151808 ?auto_151809 ?auto_151810 ?auto_151811 ?auto_151812 ?auto_151813 ?auto_151814 ?auto_151815 ?auto_151816 ?auto_151817 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_151830 - BLOCK
      ?auto_151831 - BLOCK
      ?auto_151832 - BLOCK
      ?auto_151833 - BLOCK
      ?auto_151834 - BLOCK
      ?auto_151835 - BLOCK
      ?auto_151836 - BLOCK
      ?auto_151837 - BLOCK
      ?auto_151838 - BLOCK
      ?auto_151839 - BLOCK
      ?auto_151840 - BLOCK
    )
    :vars
    (
      ?auto_151841 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151840 ?auto_151841 ) ( ON-TABLE ?auto_151830 ) ( ON ?auto_151831 ?auto_151830 ) ( ON ?auto_151832 ?auto_151831 ) ( ON ?auto_151833 ?auto_151832 ) ( ON ?auto_151834 ?auto_151833 ) ( ON ?auto_151835 ?auto_151834 ) ( ON ?auto_151836 ?auto_151835 ) ( ON ?auto_151837 ?auto_151836 ) ( ON ?auto_151838 ?auto_151837 ) ( not ( = ?auto_151830 ?auto_151831 ) ) ( not ( = ?auto_151830 ?auto_151832 ) ) ( not ( = ?auto_151830 ?auto_151833 ) ) ( not ( = ?auto_151830 ?auto_151834 ) ) ( not ( = ?auto_151830 ?auto_151835 ) ) ( not ( = ?auto_151830 ?auto_151836 ) ) ( not ( = ?auto_151830 ?auto_151837 ) ) ( not ( = ?auto_151830 ?auto_151838 ) ) ( not ( = ?auto_151830 ?auto_151839 ) ) ( not ( = ?auto_151830 ?auto_151840 ) ) ( not ( = ?auto_151830 ?auto_151841 ) ) ( not ( = ?auto_151831 ?auto_151832 ) ) ( not ( = ?auto_151831 ?auto_151833 ) ) ( not ( = ?auto_151831 ?auto_151834 ) ) ( not ( = ?auto_151831 ?auto_151835 ) ) ( not ( = ?auto_151831 ?auto_151836 ) ) ( not ( = ?auto_151831 ?auto_151837 ) ) ( not ( = ?auto_151831 ?auto_151838 ) ) ( not ( = ?auto_151831 ?auto_151839 ) ) ( not ( = ?auto_151831 ?auto_151840 ) ) ( not ( = ?auto_151831 ?auto_151841 ) ) ( not ( = ?auto_151832 ?auto_151833 ) ) ( not ( = ?auto_151832 ?auto_151834 ) ) ( not ( = ?auto_151832 ?auto_151835 ) ) ( not ( = ?auto_151832 ?auto_151836 ) ) ( not ( = ?auto_151832 ?auto_151837 ) ) ( not ( = ?auto_151832 ?auto_151838 ) ) ( not ( = ?auto_151832 ?auto_151839 ) ) ( not ( = ?auto_151832 ?auto_151840 ) ) ( not ( = ?auto_151832 ?auto_151841 ) ) ( not ( = ?auto_151833 ?auto_151834 ) ) ( not ( = ?auto_151833 ?auto_151835 ) ) ( not ( = ?auto_151833 ?auto_151836 ) ) ( not ( = ?auto_151833 ?auto_151837 ) ) ( not ( = ?auto_151833 ?auto_151838 ) ) ( not ( = ?auto_151833 ?auto_151839 ) ) ( not ( = ?auto_151833 ?auto_151840 ) ) ( not ( = ?auto_151833 ?auto_151841 ) ) ( not ( = ?auto_151834 ?auto_151835 ) ) ( not ( = ?auto_151834 ?auto_151836 ) ) ( not ( = ?auto_151834 ?auto_151837 ) ) ( not ( = ?auto_151834 ?auto_151838 ) ) ( not ( = ?auto_151834 ?auto_151839 ) ) ( not ( = ?auto_151834 ?auto_151840 ) ) ( not ( = ?auto_151834 ?auto_151841 ) ) ( not ( = ?auto_151835 ?auto_151836 ) ) ( not ( = ?auto_151835 ?auto_151837 ) ) ( not ( = ?auto_151835 ?auto_151838 ) ) ( not ( = ?auto_151835 ?auto_151839 ) ) ( not ( = ?auto_151835 ?auto_151840 ) ) ( not ( = ?auto_151835 ?auto_151841 ) ) ( not ( = ?auto_151836 ?auto_151837 ) ) ( not ( = ?auto_151836 ?auto_151838 ) ) ( not ( = ?auto_151836 ?auto_151839 ) ) ( not ( = ?auto_151836 ?auto_151840 ) ) ( not ( = ?auto_151836 ?auto_151841 ) ) ( not ( = ?auto_151837 ?auto_151838 ) ) ( not ( = ?auto_151837 ?auto_151839 ) ) ( not ( = ?auto_151837 ?auto_151840 ) ) ( not ( = ?auto_151837 ?auto_151841 ) ) ( not ( = ?auto_151838 ?auto_151839 ) ) ( not ( = ?auto_151838 ?auto_151840 ) ) ( not ( = ?auto_151838 ?auto_151841 ) ) ( not ( = ?auto_151839 ?auto_151840 ) ) ( not ( = ?auto_151839 ?auto_151841 ) ) ( not ( = ?auto_151840 ?auto_151841 ) ) ( CLEAR ?auto_151838 ) ( ON ?auto_151839 ?auto_151840 ) ( CLEAR ?auto_151839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_151830 ?auto_151831 ?auto_151832 ?auto_151833 ?auto_151834 ?auto_151835 ?auto_151836 ?auto_151837 ?auto_151838 ?auto_151839 )
      ( MAKE-11PILE ?auto_151830 ?auto_151831 ?auto_151832 ?auto_151833 ?auto_151834 ?auto_151835 ?auto_151836 ?auto_151837 ?auto_151838 ?auto_151839 ?auto_151840 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_151853 - BLOCK
      ?auto_151854 - BLOCK
      ?auto_151855 - BLOCK
      ?auto_151856 - BLOCK
      ?auto_151857 - BLOCK
      ?auto_151858 - BLOCK
      ?auto_151859 - BLOCK
      ?auto_151860 - BLOCK
      ?auto_151861 - BLOCK
      ?auto_151862 - BLOCK
      ?auto_151863 - BLOCK
    )
    :vars
    (
      ?auto_151864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151863 ?auto_151864 ) ( ON-TABLE ?auto_151853 ) ( ON ?auto_151854 ?auto_151853 ) ( ON ?auto_151855 ?auto_151854 ) ( ON ?auto_151856 ?auto_151855 ) ( ON ?auto_151857 ?auto_151856 ) ( ON ?auto_151858 ?auto_151857 ) ( ON ?auto_151859 ?auto_151858 ) ( ON ?auto_151860 ?auto_151859 ) ( not ( = ?auto_151853 ?auto_151854 ) ) ( not ( = ?auto_151853 ?auto_151855 ) ) ( not ( = ?auto_151853 ?auto_151856 ) ) ( not ( = ?auto_151853 ?auto_151857 ) ) ( not ( = ?auto_151853 ?auto_151858 ) ) ( not ( = ?auto_151853 ?auto_151859 ) ) ( not ( = ?auto_151853 ?auto_151860 ) ) ( not ( = ?auto_151853 ?auto_151861 ) ) ( not ( = ?auto_151853 ?auto_151862 ) ) ( not ( = ?auto_151853 ?auto_151863 ) ) ( not ( = ?auto_151853 ?auto_151864 ) ) ( not ( = ?auto_151854 ?auto_151855 ) ) ( not ( = ?auto_151854 ?auto_151856 ) ) ( not ( = ?auto_151854 ?auto_151857 ) ) ( not ( = ?auto_151854 ?auto_151858 ) ) ( not ( = ?auto_151854 ?auto_151859 ) ) ( not ( = ?auto_151854 ?auto_151860 ) ) ( not ( = ?auto_151854 ?auto_151861 ) ) ( not ( = ?auto_151854 ?auto_151862 ) ) ( not ( = ?auto_151854 ?auto_151863 ) ) ( not ( = ?auto_151854 ?auto_151864 ) ) ( not ( = ?auto_151855 ?auto_151856 ) ) ( not ( = ?auto_151855 ?auto_151857 ) ) ( not ( = ?auto_151855 ?auto_151858 ) ) ( not ( = ?auto_151855 ?auto_151859 ) ) ( not ( = ?auto_151855 ?auto_151860 ) ) ( not ( = ?auto_151855 ?auto_151861 ) ) ( not ( = ?auto_151855 ?auto_151862 ) ) ( not ( = ?auto_151855 ?auto_151863 ) ) ( not ( = ?auto_151855 ?auto_151864 ) ) ( not ( = ?auto_151856 ?auto_151857 ) ) ( not ( = ?auto_151856 ?auto_151858 ) ) ( not ( = ?auto_151856 ?auto_151859 ) ) ( not ( = ?auto_151856 ?auto_151860 ) ) ( not ( = ?auto_151856 ?auto_151861 ) ) ( not ( = ?auto_151856 ?auto_151862 ) ) ( not ( = ?auto_151856 ?auto_151863 ) ) ( not ( = ?auto_151856 ?auto_151864 ) ) ( not ( = ?auto_151857 ?auto_151858 ) ) ( not ( = ?auto_151857 ?auto_151859 ) ) ( not ( = ?auto_151857 ?auto_151860 ) ) ( not ( = ?auto_151857 ?auto_151861 ) ) ( not ( = ?auto_151857 ?auto_151862 ) ) ( not ( = ?auto_151857 ?auto_151863 ) ) ( not ( = ?auto_151857 ?auto_151864 ) ) ( not ( = ?auto_151858 ?auto_151859 ) ) ( not ( = ?auto_151858 ?auto_151860 ) ) ( not ( = ?auto_151858 ?auto_151861 ) ) ( not ( = ?auto_151858 ?auto_151862 ) ) ( not ( = ?auto_151858 ?auto_151863 ) ) ( not ( = ?auto_151858 ?auto_151864 ) ) ( not ( = ?auto_151859 ?auto_151860 ) ) ( not ( = ?auto_151859 ?auto_151861 ) ) ( not ( = ?auto_151859 ?auto_151862 ) ) ( not ( = ?auto_151859 ?auto_151863 ) ) ( not ( = ?auto_151859 ?auto_151864 ) ) ( not ( = ?auto_151860 ?auto_151861 ) ) ( not ( = ?auto_151860 ?auto_151862 ) ) ( not ( = ?auto_151860 ?auto_151863 ) ) ( not ( = ?auto_151860 ?auto_151864 ) ) ( not ( = ?auto_151861 ?auto_151862 ) ) ( not ( = ?auto_151861 ?auto_151863 ) ) ( not ( = ?auto_151861 ?auto_151864 ) ) ( not ( = ?auto_151862 ?auto_151863 ) ) ( not ( = ?auto_151862 ?auto_151864 ) ) ( not ( = ?auto_151863 ?auto_151864 ) ) ( ON ?auto_151862 ?auto_151863 ) ( CLEAR ?auto_151860 ) ( ON ?auto_151861 ?auto_151862 ) ( CLEAR ?auto_151861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_151853 ?auto_151854 ?auto_151855 ?auto_151856 ?auto_151857 ?auto_151858 ?auto_151859 ?auto_151860 ?auto_151861 )
      ( MAKE-11PILE ?auto_151853 ?auto_151854 ?auto_151855 ?auto_151856 ?auto_151857 ?auto_151858 ?auto_151859 ?auto_151860 ?auto_151861 ?auto_151862 ?auto_151863 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_151876 - BLOCK
      ?auto_151877 - BLOCK
      ?auto_151878 - BLOCK
      ?auto_151879 - BLOCK
      ?auto_151880 - BLOCK
      ?auto_151881 - BLOCK
      ?auto_151882 - BLOCK
      ?auto_151883 - BLOCK
      ?auto_151884 - BLOCK
      ?auto_151885 - BLOCK
      ?auto_151886 - BLOCK
    )
    :vars
    (
      ?auto_151887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151886 ?auto_151887 ) ( ON-TABLE ?auto_151876 ) ( ON ?auto_151877 ?auto_151876 ) ( ON ?auto_151878 ?auto_151877 ) ( ON ?auto_151879 ?auto_151878 ) ( ON ?auto_151880 ?auto_151879 ) ( ON ?auto_151881 ?auto_151880 ) ( ON ?auto_151882 ?auto_151881 ) ( ON ?auto_151883 ?auto_151882 ) ( not ( = ?auto_151876 ?auto_151877 ) ) ( not ( = ?auto_151876 ?auto_151878 ) ) ( not ( = ?auto_151876 ?auto_151879 ) ) ( not ( = ?auto_151876 ?auto_151880 ) ) ( not ( = ?auto_151876 ?auto_151881 ) ) ( not ( = ?auto_151876 ?auto_151882 ) ) ( not ( = ?auto_151876 ?auto_151883 ) ) ( not ( = ?auto_151876 ?auto_151884 ) ) ( not ( = ?auto_151876 ?auto_151885 ) ) ( not ( = ?auto_151876 ?auto_151886 ) ) ( not ( = ?auto_151876 ?auto_151887 ) ) ( not ( = ?auto_151877 ?auto_151878 ) ) ( not ( = ?auto_151877 ?auto_151879 ) ) ( not ( = ?auto_151877 ?auto_151880 ) ) ( not ( = ?auto_151877 ?auto_151881 ) ) ( not ( = ?auto_151877 ?auto_151882 ) ) ( not ( = ?auto_151877 ?auto_151883 ) ) ( not ( = ?auto_151877 ?auto_151884 ) ) ( not ( = ?auto_151877 ?auto_151885 ) ) ( not ( = ?auto_151877 ?auto_151886 ) ) ( not ( = ?auto_151877 ?auto_151887 ) ) ( not ( = ?auto_151878 ?auto_151879 ) ) ( not ( = ?auto_151878 ?auto_151880 ) ) ( not ( = ?auto_151878 ?auto_151881 ) ) ( not ( = ?auto_151878 ?auto_151882 ) ) ( not ( = ?auto_151878 ?auto_151883 ) ) ( not ( = ?auto_151878 ?auto_151884 ) ) ( not ( = ?auto_151878 ?auto_151885 ) ) ( not ( = ?auto_151878 ?auto_151886 ) ) ( not ( = ?auto_151878 ?auto_151887 ) ) ( not ( = ?auto_151879 ?auto_151880 ) ) ( not ( = ?auto_151879 ?auto_151881 ) ) ( not ( = ?auto_151879 ?auto_151882 ) ) ( not ( = ?auto_151879 ?auto_151883 ) ) ( not ( = ?auto_151879 ?auto_151884 ) ) ( not ( = ?auto_151879 ?auto_151885 ) ) ( not ( = ?auto_151879 ?auto_151886 ) ) ( not ( = ?auto_151879 ?auto_151887 ) ) ( not ( = ?auto_151880 ?auto_151881 ) ) ( not ( = ?auto_151880 ?auto_151882 ) ) ( not ( = ?auto_151880 ?auto_151883 ) ) ( not ( = ?auto_151880 ?auto_151884 ) ) ( not ( = ?auto_151880 ?auto_151885 ) ) ( not ( = ?auto_151880 ?auto_151886 ) ) ( not ( = ?auto_151880 ?auto_151887 ) ) ( not ( = ?auto_151881 ?auto_151882 ) ) ( not ( = ?auto_151881 ?auto_151883 ) ) ( not ( = ?auto_151881 ?auto_151884 ) ) ( not ( = ?auto_151881 ?auto_151885 ) ) ( not ( = ?auto_151881 ?auto_151886 ) ) ( not ( = ?auto_151881 ?auto_151887 ) ) ( not ( = ?auto_151882 ?auto_151883 ) ) ( not ( = ?auto_151882 ?auto_151884 ) ) ( not ( = ?auto_151882 ?auto_151885 ) ) ( not ( = ?auto_151882 ?auto_151886 ) ) ( not ( = ?auto_151882 ?auto_151887 ) ) ( not ( = ?auto_151883 ?auto_151884 ) ) ( not ( = ?auto_151883 ?auto_151885 ) ) ( not ( = ?auto_151883 ?auto_151886 ) ) ( not ( = ?auto_151883 ?auto_151887 ) ) ( not ( = ?auto_151884 ?auto_151885 ) ) ( not ( = ?auto_151884 ?auto_151886 ) ) ( not ( = ?auto_151884 ?auto_151887 ) ) ( not ( = ?auto_151885 ?auto_151886 ) ) ( not ( = ?auto_151885 ?auto_151887 ) ) ( not ( = ?auto_151886 ?auto_151887 ) ) ( ON ?auto_151885 ?auto_151886 ) ( CLEAR ?auto_151883 ) ( ON ?auto_151884 ?auto_151885 ) ( CLEAR ?auto_151884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_151876 ?auto_151877 ?auto_151878 ?auto_151879 ?auto_151880 ?auto_151881 ?auto_151882 ?auto_151883 ?auto_151884 )
      ( MAKE-11PILE ?auto_151876 ?auto_151877 ?auto_151878 ?auto_151879 ?auto_151880 ?auto_151881 ?auto_151882 ?auto_151883 ?auto_151884 ?auto_151885 ?auto_151886 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_151899 - BLOCK
      ?auto_151900 - BLOCK
      ?auto_151901 - BLOCK
      ?auto_151902 - BLOCK
      ?auto_151903 - BLOCK
      ?auto_151904 - BLOCK
      ?auto_151905 - BLOCK
      ?auto_151906 - BLOCK
      ?auto_151907 - BLOCK
      ?auto_151908 - BLOCK
      ?auto_151909 - BLOCK
    )
    :vars
    (
      ?auto_151910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151909 ?auto_151910 ) ( ON-TABLE ?auto_151899 ) ( ON ?auto_151900 ?auto_151899 ) ( ON ?auto_151901 ?auto_151900 ) ( ON ?auto_151902 ?auto_151901 ) ( ON ?auto_151903 ?auto_151902 ) ( ON ?auto_151904 ?auto_151903 ) ( ON ?auto_151905 ?auto_151904 ) ( not ( = ?auto_151899 ?auto_151900 ) ) ( not ( = ?auto_151899 ?auto_151901 ) ) ( not ( = ?auto_151899 ?auto_151902 ) ) ( not ( = ?auto_151899 ?auto_151903 ) ) ( not ( = ?auto_151899 ?auto_151904 ) ) ( not ( = ?auto_151899 ?auto_151905 ) ) ( not ( = ?auto_151899 ?auto_151906 ) ) ( not ( = ?auto_151899 ?auto_151907 ) ) ( not ( = ?auto_151899 ?auto_151908 ) ) ( not ( = ?auto_151899 ?auto_151909 ) ) ( not ( = ?auto_151899 ?auto_151910 ) ) ( not ( = ?auto_151900 ?auto_151901 ) ) ( not ( = ?auto_151900 ?auto_151902 ) ) ( not ( = ?auto_151900 ?auto_151903 ) ) ( not ( = ?auto_151900 ?auto_151904 ) ) ( not ( = ?auto_151900 ?auto_151905 ) ) ( not ( = ?auto_151900 ?auto_151906 ) ) ( not ( = ?auto_151900 ?auto_151907 ) ) ( not ( = ?auto_151900 ?auto_151908 ) ) ( not ( = ?auto_151900 ?auto_151909 ) ) ( not ( = ?auto_151900 ?auto_151910 ) ) ( not ( = ?auto_151901 ?auto_151902 ) ) ( not ( = ?auto_151901 ?auto_151903 ) ) ( not ( = ?auto_151901 ?auto_151904 ) ) ( not ( = ?auto_151901 ?auto_151905 ) ) ( not ( = ?auto_151901 ?auto_151906 ) ) ( not ( = ?auto_151901 ?auto_151907 ) ) ( not ( = ?auto_151901 ?auto_151908 ) ) ( not ( = ?auto_151901 ?auto_151909 ) ) ( not ( = ?auto_151901 ?auto_151910 ) ) ( not ( = ?auto_151902 ?auto_151903 ) ) ( not ( = ?auto_151902 ?auto_151904 ) ) ( not ( = ?auto_151902 ?auto_151905 ) ) ( not ( = ?auto_151902 ?auto_151906 ) ) ( not ( = ?auto_151902 ?auto_151907 ) ) ( not ( = ?auto_151902 ?auto_151908 ) ) ( not ( = ?auto_151902 ?auto_151909 ) ) ( not ( = ?auto_151902 ?auto_151910 ) ) ( not ( = ?auto_151903 ?auto_151904 ) ) ( not ( = ?auto_151903 ?auto_151905 ) ) ( not ( = ?auto_151903 ?auto_151906 ) ) ( not ( = ?auto_151903 ?auto_151907 ) ) ( not ( = ?auto_151903 ?auto_151908 ) ) ( not ( = ?auto_151903 ?auto_151909 ) ) ( not ( = ?auto_151903 ?auto_151910 ) ) ( not ( = ?auto_151904 ?auto_151905 ) ) ( not ( = ?auto_151904 ?auto_151906 ) ) ( not ( = ?auto_151904 ?auto_151907 ) ) ( not ( = ?auto_151904 ?auto_151908 ) ) ( not ( = ?auto_151904 ?auto_151909 ) ) ( not ( = ?auto_151904 ?auto_151910 ) ) ( not ( = ?auto_151905 ?auto_151906 ) ) ( not ( = ?auto_151905 ?auto_151907 ) ) ( not ( = ?auto_151905 ?auto_151908 ) ) ( not ( = ?auto_151905 ?auto_151909 ) ) ( not ( = ?auto_151905 ?auto_151910 ) ) ( not ( = ?auto_151906 ?auto_151907 ) ) ( not ( = ?auto_151906 ?auto_151908 ) ) ( not ( = ?auto_151906 ?auto_151909 ) ) ( not ( = ?auto_151906 ?auto_151910 ) ) ( not ( = ?auto_151907 ?auto_151908 ) ) ( not ( = ?auto_151907 ?auto_151909 ) ) ( not ( = ?auto_151907 ?auto_151910 ) ) ( not ( = ?auto_151908 ?auto_151909 ) ) ( not ( = ?auto_151908 ?auto_151910 ) ) ( not ( = ?auto_151909 ?auto_151910 ) ) ( ON ?auto_151908 ?auto_151909 ) ( ON ?auto_151907 ?auto_151908 ) ( CLEAR ?auto_151905 ) ( ON ?auto_151906 ?auto_151907 ) ( CLEAR ?auto_151906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_151899 ?auto_151900 ?auto_151901 ?auto_151902 ?auto_151903 ?auto_151904 ?auto_151905 ?auto_151906 )
      ( MAKE-11PILE ?auto_151899 ?auto_151900 ?auto_151901 ?auto_151902 ?auto_151903 ?auto_151904 ?auto_151905 ?auto_151906 ?auto_151907 ?auto_151908 ?auto_151909 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_151922 - BLOCK
      ?auto_151923 - BLOCK
      ?auto_151924 - BLOCK
      ?auto_151925 - BLOCK
      ?auto_151926 - BLOCK
      ?auto_151927 - BLOCK
      ?auto_151928 - BLOCK
      ?auto_151929 - BLOCK
      ?auto_151930 - BLOCK
      ?auto_151931 - BLOCK
      ?auto_151932 - BLOCK
    )
    :vars
    (
      ?auto_151933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151932 ?auto_151933 ) ( ON-TABLE ?auto_151922 ) ( ON ?auto_151923 ?auto_151922 ) ( ON ?auto_151924 ?auto_151923 ) ( ON ?auto_151925 ?auto_151924 ) ( ON ?auto_151926 ?auto_151925 ) ( ON ?auto_151927 ?auto_151926 ) ( ON ?auto_151928 ?auto_151927 ) ( not ( = ?auto_151922 ?auto_151923 ) ) ( not ( = ?auto_151922 ?auto_151924 ) ) ( not ( = ?auto_151922 ?auto_151925 ) ) ( not ( = ?auto_151922 ?auto_151926 ) ) ( not ( = ?auto_151922 ?auto_151927 ) ) ( not ( = ?auto_151922 ?auto_151928 ) ) ( not ( = ?auto_151922 ?auto_151929 ) ) ( not ( = ?auto_151922 ?auto_151930 ) ) ( not ( = ?auto_151922 ?auto_151931 ) ) ( not ( = ?auto_151922 ?auto_151932 ) ) ( not ( = ?auto_151922 ?auto_151933 ) ) ( not ( = ?auto_151923 ?auto_151924 ) ) ( not ( = ?auto_151923 ?auto_151925 ) ) ( not ( = ?auto_151923 ?auto_151926 ) ) ( not ( = ?auto_151923 ?auto_151927 ) ) ( not ( = ?auto_151923 ?auto_151928 ) ) ( not ( = ?auto_151923 ?auto_151929 ) ) ( not ( = ?auto_151923 ?auto_151930 ) ) ( not ( = ?auto_151923 ?auto_151931 ) ) ( not ( = ?auto_151923 ?auto_151932 ) ) ( not ( = ?auto_151923 ?auto_151933 ) ) ( not ( = ?auto_151924 ?auto_151925 ) ) ( not ( = ?auto_151924 ?auto_151926 ) ) ( not ( = ?auto_151924 ?auto_151927 ) ) ( not ( = ?auto_151924 ?auto_151928 ) ) ( not ( = ?auto_151924 ?auto_151929 ) ) ( not ( = ?auto_151924 ?auto_151930 ) ) ( not ( = ?auto_151924 ?auto_151931 ) ) ( not ( = ?auto_151924 ?auto_151932 ) ) ( not ( = ?auto_151924 ?auto_151933 ) ) ( not ( = ?auto_151925 ?auto_151926 ) ) ( not ( = ?auto_151925 ?auto_151927 ) ) ( not ( = ?auto_151925 ?auto_151928 ) ) ( not ( = ?auto_151925 ?auto_151929 ) ) ( not ( = ?auto_151925 ?auto_151930 ) ) ( not ( = ?auto_151925 ?auto_151931 ) ) ( not ( = ?auto_151925 ?auto_151932 ) ) ( not ( = ?auto_151925 ?auto_151933 ) ) ( not ( = ?auto_151926 ?auto_151927 ) ) ( not ( = ?auto_151926 ?auto_151928 ) ) ( not ( = ?auto_151926 ?auto_151929 ) ) ( not ( = ?auto_151926 ?auto_151930 ) ) ( not ( = ?auto_151926 ?auto_151931 ) ) ( not ( = ?auto_151926 ?auto_151932 ) ) ( not ( = ?auto_151926 ?auto_151933 ) ) ( not ( = ?auto_151927 ?auto_151928 ) ) ( not ( = ?auto_151927 ?auto_151929 ) ) ( not ( = ?auto_151927 ?auto_151930 ) ) ( not ( = ?auto_151927 ?auto_151931 ) ) ( not ( = ?auto_151927 ?auto_151932 ) ) ( not ( = ?auto_151927 ?auto_151933 ) ) ( not ( = ?auto_151928 ?auto_151929 ) ) ( not ( = ?auto_151928 ?auto_151930 ) ) ( not ( = ?auto_151928 ?auto_151931 ) ) ( not ( = ?auto_151928 ?auto_151932 ) ) ( not ( = ?auto_151928 ?auto_151933 ) ) ( not ( = ?auto_151929 ?auto_151930 ) ) ( not ( = ?auto_151929 ?auto_151931 ) ) ( not ( = ?auto_151929 ?auto_151932 ) ) ( not ( = ?auto_151929 ?auto_151933 ) ) ( not ( = ?auto_151930 ?auto_151931 ) ) ( not ( = ?auto_151930 ?auto_151932 ) ) ( not ( = ?auto_151930 ?auto_151933 ) ) ( not ( = ?auto_151931 ?auto_151932 ) ) ( not ( = ?auto_151931 ?auto_151933 ) ) ( not ( = ?auto_151932 ?auto_151933 ) ) ( ON ?auto_151931 ?auto_151932 ) ( ON ?auto_151930 ?auto_151931 ) ( CLEAR ?auto_151928 ) ( ON ?auto_151929 ?auto_151930 ) ( CLEAR ?auto_151929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_151922 ?auto_151923 ?auto_151924 ?auto_151925 ?auto_151926 ?auto_151927 ?auto_151928 ?auto_151929 )
      ( MAKE-11PILE ?auto_151922 ?auto_151923 ?auto_151924 ?auto_151925 ?auto_151926 ?auto_151927 ?auto_151928 ?auto_151929 ?auto_151930 ?auto_151931 ?auto_151932 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_151945 - BLOCK
      ?auto_151946 - BLOCK
      ?auto_151947 - BLOCK
      ?auto_151948 - BLOCK
      ?auto_151949 - BLOCK
      ?auto_151950 - BLOCK
      ?auto_151951 - BLOCK
      ?auto_151952 - BLOCK
      ?auto_151953 - BLOCK
      ?auto_151954 - BLOCK
      ?auto_151955 - BLOCK
    )
    :vars
    (
      ?auto_151956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151955 ?auto_151956 ) ( ON-TABLE ?auto_151945 ) ( ON ?auto_151946 ?auto_151945 ) ( ON ?auto_151947 ?auto_151946 ) ( ON ?auto_151948 ?auto_151947 ) ( ON ?auto_151949 ?auto_151948 ) ( ON ?auto_151950 ?auto_151949 ) ( not ( = ?auto_151945 ?auto_151946 ) ) ( not ( = ?auto_151945 ?auto_151947 ) ) ( not ( = ?auto_151945 ?auto_151948 ) ) ( not ( = ?auto_151945 ?auto_151949 ) ) ( not ( = ?auto_151945 ?auto_151950 ) ) ( not ( = ?auto_151945 ?auto_151951 ) ) ( not ( = ?auto_151945 ?auto_151952 ) ) ( not ( = ?auto_151945 ?auto_151953 ) ) ( not ( = ?auto_151945 ?auto_151954 ) ) ( not ( = ?auto_151945 ?auto_151955 ) ) ( not ( = ?auto_151945 ?auto_151956 ) ) ( not ( = ?auto_151946 ?auto_151947 ) ) ( not ( = ?auto_151946 ?auto_151948 ) ) ( not ( = ?auto_151946 ?auto_151949 ) ) ( not ( = ?auto_151946 ?auto_151950 ) ) ( not ( = ?auto_151946 ?auto_151951 ) ) ( not ( = ?auto_151946 ?auto_151952 ) ) ( not ( = ?auto_151946 ?auto_151953 ) ) ( not ( = ?auto_151946 ?auto_151954 ) ) ( not ( = ?auto_151946 ?auto_151955 ) ) ( not ( = ?auto_151946 ?auto_151956 ) ) ( not ( = ?auto_151947 ?auto_151948 ) ) ( not ( = ?auto_151947 ?auto_151949 ) ) ( not ( = ?auto_151947 ?auto_151950 ) ) ( not ( = ?auto_151947 ?auto_151951 ) ) ( not ( = ?auto_151947 ?auto_151952 ) ) ( not ( = ?auto_151947 ?auto_151953 ) ) ( not ( = ?auto_151947 ?auto_151954 ) ) ( not ( = ?auto_151947 ?auto_151955 ) ) ( not ( = ?auto_151947 ?auto_151956 ) ) ( not ( = ?auto_151948 ?auto_151949 ) ) ( not ( = ?auto_151948 ?auto_151950 ) ) ( not ( = ?auto_151948 ?auto_151951 ) ) ( not ( = ?auto_151948 ?auto_151952 ) ) ( not ( = ?auto_151948 ?auto_151953 ) ) ( not ( = ?auto_151948 ?auto_151954 ) ) ( not ( = ?auto_151948 ?auto_151955 ) ) ( not ( = ?auto_151948 ?auto_151956 ) ) ( not ( = ?auto_151949 ?auto_151950 ) ) ( not ( = ?auto_151949 ?auto_151951 ) ) ( not ( = ?auto_151949 ?auto_151952 ) ) ( not ( = ?auto_151949 ?auto_151953 ) ) ( not ( = ?auto_151949 ?auto_151954 ) ) ( not ( = ?auto_151949 ?auto_151955 ) ) ( not ( = ?auto_151949 ?auto_151956 ) ) ( not ( = ?auto_151950 ?auto_151951 ) ) ( not ( = ?auto_151950 ?auto_151952 ) ) ( not ( = ?auto_151950 ?auto_151953 ) ) ( not ( = ?auto_151950 ?auto_151954 ) ) ( not ( = ?auto_151950 ?auto_151955 ) ) ( not ( = ?auto_151950 ?auto_151956 ) ) ( not ( = ?auto_151951 ?auto_151952 ) ) ( not ( = ?auto_151951 ?auto_151953 ) ) ( not ( = ?auto_151951 ?auto_151954 ) ) ( not ( = ?auto_151951 ?auto_151955 ) ) ( not ( = ?auto_151951 ?auto_151956 ) ) ( not ( = ?auto_151952 ?auto_151953 ) ) ( not ( = ?auto_151952 ?auto_151954 ) ) ( not ( = ?auto_151952 ?auto_151955 ) ) ( not ( = ?auto_151952 ?auto_151956 ) ) ( not ( = ?auto_151953 ?auto_151954 ) ) ( not ( = ?auto_151953 ?auto_151955 ) ) ( not ( = ?auto_151953 ?auto_151956 ) ) ( not ( = ?auto_151954 ?auto_151955 ) ) ( not ( = ?auto_151954 ?auto_151956 ) ) ( not ( = ?auto_151955 ?auto_151956 ) ) ( ON ?auto_151954 ?auto_151955 ) ( ON ?auto_151953 ?auto_151954 ) ( ON ?auto_151952 ?auto_151953 ) ( CLEAR ?auto_151950 ) ( ON ?auto_151951 ?auto_151952 ) ( CLEAR ?auto_151951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_151945 ?auto_151946 ?auto_151947 ?auto_151948 ?auto_151949 ?auto_151950 ?auto_151951 )
      ( MAKE-11PILE ?auto_151945 ?auto_151946 ?auto_151947 ?auto_151948 ?auto_151949 ?auto_151950 ?auto_151951 ?auto_151952 ?auto_151953 ?auto_151954 ?auto_151955 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_151968 - BLOCK
      ?auto_151969 - BLOCK
      ?auto_151970 - BLOCK
      ?auto_151971 - BLOCK
      ?auto_151972 - BLOCK
      ?auto_151973 - BLOCK
      ?auto_151974 - BLOCK
      ?auto_151975 - BLOCK
      ?auto_151976 - BLOCK
      ?auto_151977 - BLOCK
      ?auto_151978 - BLOCK
    )
    :vars
    (
      ?auto_151979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151978 ?auto_151979 ) ( ON-TABLE ?auto_151968 ) ( ON ?auto_151969 ?auto_151968 ) ( ON ?auto_151970 ?auto_151969 ) ( ON ?auto_151971 ?auto_151970 ) ( ON ?auto_151972 ?auto_151971 ) ( ON ?auto_151973 ?auto_151972 ) ( not ( = ?auto_151968 ?auto_151969 ) ) ( not ( = ?auto_151968 ?auto_151970 ) ) ( not ( = ?auto_151968 ?auto_151971 ) ) ( not ( = ?auto_151968 ?auto_151972 ) ) ( not ( = ?auto_151968 ?auto_151973 ) ) ( not ( = ?auto_151968 ?auto_151974 ) ) ( not ( = ?auto_151968 ?auto_151975 ) ) ( not ( = ?auto_151968 ?auto_151976 ) ) ( not ( = ?auto_151968 ?auto_151977 ) ) ( not ( = ?auto_151968 ?auto_151978 ) ) ( not ( = ?auto_151968 ?auto_151979 ) ) ( not ( = ?auto_151969 ?auto_151970 ) ) ( not ( = ?auto_151969 ?auto_151971 ) ) ( not ( = ?auto_151969 ?auto_151972 ) ) ( not ( = ?auto_151969 ?auto_151973 ) ) ( not ( = ?auto_151969 ?auto_151974 ) ) ( not ( = ?auto_151969 ?auto_151975 ) ) ( not ( = ?auto_151969 ?auto_151976 ) ) ( not ( = ?auto_151969 ?auto_151977 ) ) ( not ( = ?auto_151969 ?auto_151978 ) ) ( not ( = ?auto_151969 ?auto_151979 ) ) ( not ( = ?auto_151970 ?auto_151971 ) ) ( not ( = ?auto_151970 ?auto_151972 ) ) ( not ( = ?auto_151970 ?auto_151973 ) ) ( not ( = ?auto_151970 ?auto_151974 ) ) ( not ( = ?auto_151970 ?auto_151975 ) ) ( not ( = ?auto_151970 ?auto_151976 ) ) ( not ( = ?auto_151970 ?auto_151977 ) ) ( not ( = ?auto_151970 ?auto_151978 ) ) ( not ( = ?auto_151970 ?auto_151979 ) ) ( not ( = ?auto_151971 ?auto_151972 ) ) ( not ( = ?auto_151971 ?auto_151973 ) ) ( not ( = ?auto_151971 ?auto_151974 ) ) ( not ( = ?auto_151971 ?auto_151975 ) ) ( not ( = ?auto_151971 ?auto_151976 ) ) ( not ( = ?auto_151971 ?auto_151977 ) ) ( not ( = ?auto_151971 ?auto_151978 ) ) ( not ( = ?auto_151971 ?auto_151979 ) ) ( not ( = ?auto_151972 ?auto_151973 ) ) ( not ( = ?auto_151972 ?auto_151974 ) ) ( not ( = ?auto_151972 ?auto_151975 ) ) ( not ( = ?auto_151972 ?auto_151976 ) ) ( not ( = ?auto_151972 ?auto_151977 ) ) ( not ( = ?auto_151972 ?auto_151978 ) ) ( not ( = ?auto_151972 ?auto_151979 ) ) ( not ( = ?auto_151973 ?auto_151974 ) ) ( not ( = ?auto_151973 ?auto_151975 ) ) ( not ( = ?auto_151973 ?auto_151976 ) ) ( not ( = ?auto_151973 ?auto_151977 ) ) ( not ( = ?auto_151973 ?auto_151978 ) ) ( not ( = ?auto_151973 ?auto_151979 ) ) ( not ( = ?auto_151974 ?auto_151975 ) ) ( not ( = ?auto_151974 ?auto_151976 ) ) ( not ( = ?auto_151974 ?auto_151977 ) ) ( not ( = ?auto_151974 ?auto_151978 ) ) ( not ( = ?auto_151974 ?auto_151979 ) ) ( not ( = ?auto_151975 ?auto_151976 ) ) ( not ( = ?auto_151975 ?auto_151977 ) ) ( not ( = ?auto_151975 ?auto_151978 ) ) ( not ( = ?auto_151975 ?auto_151979 ) ) ( not ( = ?auto_151976 ?auto_151977 ) ) ( not ( = ?auto_151976 ?auto_151978 ) ) ( not ( = ?auto_151976 ?auto_151979 ) ) ( not ( = ?auto_151977 ?auto_151978 ) ) ( not ( = ?auto_151977 ?auto_151979 ) ) ( not ( = ?auto_151978 ?auto_151979 ) ) ( ON ?auto_151977 ?auto_151978 ) ( ON ?auto_151976 ?auto_151977 ) ( ON ?auto_151975 ?auto_151976 ) ( CLEAR ?auto_151973 ) ( ON ?auto_151974 ?auto_151975 ) ( CLEAR ?auto_151974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_151968 ?auto_151969 ?auto_151970 ?auto_151971 ?auto_151972 ?auto_151973 ?auto_151974 )
      ( MAKE-11PILE ?auto_151968 ?auto_151969 ?auto_151970 ?auto_151971 ?auto_151972 ?auto_151973 ?auto_151974 ?auto_151975 ?auto_151976 ?auto_151977 ?auto_151978 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_151991 - BLOCK
      ?auto_151992 - BLOCK
      ?auto_151993 - BLOCK
      ?auto_151994 - BLOCK
      ?auto_151995 - BLOCK
      ?auto_151996 - BLOCK
      ?auto_151997 - BLOCK
      ?auto_151998 - BLOCK
      ?auto_151999 - BLOCK
      ?auto_152000 - BLOCK
      ?auto_152001 - BLOCK
    )
    :vars
    (
      ?auto_152002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152001 ?auto_152002 ) ( ON-TABLE ?auto_151991 ) ( ON ?auto_151992 ?auto_151991 ) ( ON ?auto_151993 ?auto_151992 ) ( ON ?auto_151994 ?auto_151993 ) ( ON ?auto_151995 ?auto_151994 ) ( not ( = ?auto_151991 ?auto_151992 ) ) ( not ( = ?auto_151991 ?auto_151993 ) ) ( not ( = ?auto_151991 ?auto_151994 ) ) ( not ( = ?auto_151991 ?auto_151995 ) ) ( not ( = ?auto_151991 ?auto_151996 ) ) ( not ( = ?auto_151991 ?auto_151997 ) ) ( not ( = ?auto_151991 ?auto_151998 ) ) ( not ( = ?auto_151991 ?auto_151999 ) ) ( not ( = ?auto_151991 ?auto_152000 ) ) ( not ( = ?auto_151991 ?auto_152001 ) ) ( not ( = ?auto_151991 ?auto_152002 ) ) ( not ( = ?auto_151992 ?auto_151993 ) ) ( not ( = ?auto_151992 ?auto_151994 ) ) ( not ( = ?auto_151992 ?auto_151995 ) ) ( not ( = ?auto_151992 ?auto_151996 ) ) ( not ( = ?auto_151992 ?auto_151997 ) ) ( not ( = ?auto_151992 ?auto_151998 ) ) ( not ( = ?auto_151992 ?auto_151999 ) ) ( not ( = ?auto_151992 ?auto_152000 ) ) ( not ( = ?auto_151992 ?auto_152001 ) ) ( not ( = ?auto_151992 ?auto_152002 ) ) ( not ( = ?auto_151993 ?auto_151994 ) ) ( not ( = ?auto_151993 ?auto_151995 ) ) ( not ( = ?auto_151993 ?auto_151996 ) ) ( not ( = ?auto_151993 ?auto_151997 ) ) ( not ( = ?auto_151993 ?auto_151998 ) ) ( not ( = ?auto_151993 ?auto_151999 ) ) ( not ( = ?auto_151993 ?auto_152000 ) ) ( not ( = ?auto_151993 ?auto_152001 ) ) ( not ( = ?auto_151993 ?auto_152002 ) ) ( not ( = ?auto_151994 ?auto_151995 ) ) ( not ( = ?auto_151994 ?auto_151996 ) ) ( not ( = ?auto_151994 ?auto_151997 ) ) ( not ( = ?auto_151994 ?auto_151998 ) ) ( not ( = ?auto_151994 ?auto_151999 ) ) ( not ( = ?auto_151994 ?auto_152000 ) ) ( not ( = ?auto_151994 ?auto_152001 ) ) ( not ( = ?auto_151994 ?auto_152002 ) ) ( not ( = ?auto_151995 ?auto_151996 ) ) ( not ( = ?auto_151995 ?auto_151997 ) ) ( not ( = ?auto_151995 ?auto_151998 ) ) ( not ( = ?auto_151995 ?auto_151999 ) ) ( not ( = ?auto_151995 ?auto_152000 ) ) ( not ( = ?auto_151995 ?auto_152001 ) ) ( not ( = ?auto_151995 ?auto_152002 ) ) ( not ( = ?auto_151996 ?auto_151997 ) ) ( not ( = ?auto_151996 ?auto_151998 ) ) ( not ( = ?auto_151996 ?auto_151999 ) ) ( not ( = ?auto_151996 ?auto_152000 ) ) ( not ( = ?auto_151996 ?auto_152001 ) ) ( not ( = ?auto_151996 ?auto_152002 ) ) ( not ( = ?auto_151997 ?auto_151998 ) ) ( not ( = ?auto_151997 ?auto_151999 ) ) ( not ( = ?auto_151997 ?auto_152000 ) ) ( not ( = ?auto_151997 ?auto_152001 ) ) ( not ( = ?auto_151997 ?auto_152002 ) ) ( not ( = ?auto_151998 ?auto_151999 ) ) ( not ( = ?auto_151998 ?auto_152000 ) ) ( not ( = ?auto_151998 ?auto_152001 ) ) ( not ( = ?auto_151998 ?auto_152002 ) ) ( not ( = ?auto_151999 ?auto_152000 ) ) ( not ( = ?auto_151999 ?auto_152001 ) ) ( not ( = ?auto_151999 ?auto_152002 ) ) ( not ( = ?auto_152000 ?auto_152001 ) ) ( not ( = ?auto_152000 ?auto_152002 ) ) ( not ( = ?auto_152001 ?auto_152002 ) ) ( ON ?auto_152000 ?auto_152001 ) ( ON ?auto_151999 ?auto_152000 ) ( ON ?auto_151998 ?auto_151999 ) ( ON ?auto_151997 ?auto_151998 ) ( CLEAR ?auto_151995 ) ( ON ?auto_151996 ?auto_151997 ) ( CLEAR ?auto_151996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151991 ?auto_151992 ?auto_151993 ?auto_151994 ?auto_151995 ?auto_151996 )
      ( MAKE-11PILE ?auto_151991 ?auto_151992 ?auto_151993 ?auto_151994 ?auto_151995 ?auto_151996 ?auto_151997 ?auto_151998 ?auto_151999 ?auto_152000 ?auto_152001 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_152014 - BLOCK
      ?auto_152015 - BLOCK
      ?auto_152016 - BLOCK
      ?auto_152017 - BLOCK
      ?auto_152018 - BLOCK
      ?auto_152019 - BLOCK
      ?auto_152020 - BLOCK
      ?auto_152021 - BLOCK
      ?auto_152022 - BLOCK
      ?auto_152023 - BLOCK
      ?auto_152024 - BLOCK
    )
    :vars
    (
      ?auto_152025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152024 ?auto_152025 ) ( ON-TABLE ?auto_152014 ) ( ON ?auto_152015 ?auto_152014 ) ( ON ?auto_152016 ?auto_152015 ) ( ON ?auto_152017 ?auto_152016 ) ( ON ?auto_152018 ?auto_152017 ) ( not ( = ?auto_152014 ?auto_152015 ) ) ( not ( = ?auto_152014 ?auto_152016 ) ) ( not ( = ?auto_152014 ?auto_152017 ) ) ( not ( = ?auto_152014 ?auto_152018 ) ) ( not ( = ?auto_152014 ?auto_152019 ) ) ( not ( = ?auto_152014 ?auto_152020 ) ) ( not ( = ?auto_152014 ?auto_152021 ) ) ( not ( = ?auto_152014 ?auto_152022 ) ) ( not ( = ?auto_152014 ?auto_152023 ) ) ( not ( = ?auto_152014 ?auto_152024 ) ) ( not ( = ?auto_152014 ?auto_152025 ) ) ( not ( = ?auto_152015 ?auto_152016 ) ) ( not ( = ?auto_152015 ?auto_152017 ) ) ( not ( = ?auto_152015 ?auto_152018 ) ) ( not ( = ?auto_152015 ?auto_152019 ) ) ( not ( = ?auto_152015 ?auto_152020 ) ) ( not ( = ?auto_152015 ?auto_152021 ) ) ( not ( = ?auto_152015 ?auto_152022 ) ) ( not ( = ?auto_152015 ?auto_152023 ) ) ( not ( = ?auto_152015 ?auto_152024 ) ) ( not ( = ?auto_152015 ?auto_152025 ) ) ( not ( = ?auto_152016 ?auto_152017 ) ) ( not ( = ?auto_152016 ?auto_152018 ) ) ( not ( = ?auto_152016 ?auto_152019 ) ) ( not ( = ?auto_152016 ?auto_152020 ) ) ( not ( = ?auto_152016 ?auto_152021 ) ) ( not ( = ?auto_152016 ?auto_152022 ) ) ( not ( = ?auto_152016 ?auto_152023 ) ) ( not ( = ?auto_152016 ?auto_152024 ) ) ( not ( = ?auto_152016 ?auto_152025 ) ) ( not ( = ?auto_152017 ?auto_152018 ) ) ( not ( = ?auto_152017 ?auto_152019 ) ) ( not ( = ?auto_152017 ?auto_152020 ) ) ( not ( = ?auto_152017 ?auto_152021 ) ) ( not ( = ?auto_152017 ?auto_152022 ) ) ( not ( = ?auto_152017 ?auto_152023 ) ) ( not ( = ?auto_152017 ?auto_152024 ) ) ( not ( = ?auto_152017 ?auto_152025 ) ) ( not ( = ?auto_152018 ?auto_152019 ) ) ( not ( = ?auto_152018 ?auto_152020 ) ) ( not ( = ?auto_152018 ?auto_152021 ) ) ( not ( = ?auto_152018 ?auto_152022 ) ) ( not ( = ?auto_152018 ?auto_152023 ) ) ( not ( = ?auto_152018 ?auto_152024 ) ) ( not ( = ?auto_152018 ?auto_152025 ) ) ( not ( = ?auto_152019 ?auto_152020 ) ) ( not ( = ?auto_152019 ?auto_152021 ) ) ( not ( = ?auto_152019 ?auto_152022 ) ) ( not ( = ?auto_152019 ?auto_152023 ) ) ( not ( = ?auto_152019 ?auto_152024 ) ) ( not ( = ?auto_152019 ?auto_152025 ) ) ( not ( = ?auto_152020 ?auto_152021 ) ) ( not ( = ?auto_152020 ?auto_152022 ) ) ( not ( = ?auto_152020 ?auto_152023 ) ) ( not ( = ?auto_152020 ?auto_152024 ) ) ( not ( = ?auto_152020 ?auto_152025 ) ) ( not ( = ?auto_152021 ?auto_152022 ) ) ( not ( = ?auto_152021 ?auto_152023 ) ) ( not ( = ?auto_152021 ?auto_152024 ) ) ( not ( = ?auto_152021 ?auto_152025 ) ) ( not ( = ?auto_152022 ?auto_152023 ) ) ( not ( = ?auto_152022 ?auto_152024 ) ) ( not ( = ?auto_152022 ?auto_152025 ) ) ( not ( = ?auto_152023 ?auto_152024 ) ) ( not ( = ?auto_152023 ?auto_152025 ) ) ( not ( = ?auto_152024 ?auto_152025 ) ) ( ON ?auto_152023 ?auto_152024 ) ( ON ?auto_152022 ?auto_152023 ) ( ON ?auto_152021 ?auto_152022 ) ( ON ?auto_152020 ?auto_152021 ) ( CLEAR ?auto_152018 ) ( ON ?auto_152019 ?auto_152020 ) ( CLEAR ?auto_152019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_152014 ?auto_152015 ?auto_152016 ?auto_152017 ?auto_152018 ?auto_152019 )
      ( MAKE-11PILE ?auto_152014 ?auto_152015 ?auto_152016 ?auto_152017 ?auto_152018 ?auto_152019 ?auto_152020 ?auto_152021 ?auto_152022 ?auto_152023 ?auto_152024 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_152037 - BLOCK
      ?auto_152038 - BLOCK
      ?auto_152039 - BLOCK
      ?auto_152040 - BLOCK
      ?auto_152041 - BLOCK
      ?auto_152042 - BLOCK
      ?auto_152043 - BLOCK
      ?auto_152044 - BLOCK
      ?auto_152045 - BLOCK
      ?auto_152046 - BLOCK
      ?auto_152047 - BLOCK
    )
    :vars
    (
      ?auto_152048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152047 ?auto_152048 ) ( ON-TABLE ?auto_152037 ) ( ON ?auto_152038 ?auto_152037 ) ( ON ?auto_152039 ?auto_152038 ) ( ON ?auto_152040 ?auto_152039 ) ( not ( = ?auto_152037 ?auto_152038 ) ) ( not ( = ?auto_152037 ?auto_152039 ) ) ( not ( = ?auto_152037 ?auto_152040 ) ) ( not ( = ?auto_152037 ?auto_152041 ) ) ( not ( = ?auto_152037 ?auto_152042 ) ) ( not ( = ?auto_152037 ?auto_152043 ) ) ( not ( = ?auto_152037 ?auto_152044 ) ) ( not ( = ?auto_152037 ?auto_152045 ) ) ( not ( = ?auto_152037 ?auto_152046 ) ) ( not ( = ?auto_152037 ?auto_152047 ) ) ( not ( = ?auto_152037 ?auto_152048 ) ) ( not ( = ?auto_152038 ?auto_152039 ) ) ( not ( = ?auto_152038 ?auto_152040 ) ) ( not ( = ?auto_152038 ?auto_152041 ) ) ( not ( = ?auto_152038 ?auto_152042 ) ) ( not ( = ?auto_152038 ?auto_152043 ) ) ( not ( = ?auto_152038 ?auto_152044 ) ) ( not ( = ?auto_152038 ?auto_152045 ) ) ( not ( = ?auto_152038 ?auto_152046 ) ) ( not ( = ?auto_152038 ?auto_152047 ) ) ( not ( = ?auto_152038 ?auto_152048 ) ) ( not ( = ?auto_152039 ?auto_152040 ) ) ( not ( = ?auto_152039 ?auto_152041 ) ) ( not ( = ?auto_152039 ?auto_152042 ) ) ( not ( = ?auto_152039 ?auto_152043 ) ) ( not ( = ?auto_152039 ?auto_152044 ) ) ( not ( = ?auto_152039 ?auto_152045 ) ) ( not ( = ?auto_152039 ?auto_152046 ) ) ( not ( = ?auto_152039 ?auto_152047 ) ) ( not ( = ?auto_152039 ?auto_152048 ) ) ( not ( = ?auto_152040 ?auto_152041 ) ) ( not ( = ?auto_152040 ?auto_152042 ) ) ( not ( = ?auto_152040 ?auto_152043 ) ) ( not ( = ?auto_152040 ?auto_152044 ) ) ( not ( = ?auto_152040 ?auto_152045 ) ) ( not ( = ?auto_152040 ?auto_152046 ) ) ( not ( = ?auto_152040 ?auto_152047 ) ) ( not ( = ?auto_152040 ?auto_152048 ) ) ( not ( = ?auto_152041 ?auto_152042 ) ) ( not ( = ?auto_152041 ?auto_152043 ) ) ( not ( = ?auto_152041 ?auto_152044 ) ) ( not ( = ?auto_152041 ?auto_152045 ) ) ( not ( = ?auto_152041 ?auto_152046 ) ) ( not ( = ?auto_152041 ?auto_152047 ) ) ( not ( = ?auto_152041 ?auto_152048 ) ) ( not ( = ?auto_152042 ?auto_152043 ) ) ( not ( = ?auto_152042 ?auto_152044 ) ) ( not ( = ?auto_152042 ?auto_152045 ) ) ( not ( = ?auto_152042 ?auto_152046 ) ) ( not ( = ?auto_152042 ?auto_152047 ) ) ( not ( = ?auto_152042 ?auto_152048 ) ) ( not ( = ?auto_152043 ?auto_152044 ) ) ( not ( = ?auto_152043 ?auto_152045 ) ) ( not ( = ?auto_152043 ?auto_152046 ) ) ( not ( = ?auto_152043 ?auto_152047 ) ) ( not ( = ?auto_152043 ?auto_152048 ) ) ( not ( = ?auto_152044 ?auto_152045 ) ) ( not ( = ?auto_152044 ?auto_152046 ) ) ( not ( = ?auto_152044 ?auto_152047 ) ) ( not ( = ?auto_152044 ?auto_152048 ) ) ( not ( = ?auto_152045 ?auto_152046 ) ) ( not ( = ?auto_152045 ?auto_152047 ) ) ( not ( = ?auto_152045 ?auto_152048 ) ) ( not ( = ?auto_152046 ?auto_152047 ) ) ( not ( = ?auto_152046 ?auto_152048 ) ) ( not ( = ?auto_152047 ?auto_152048 ) ) ( ON ?auto_152046 ?auto_152047 ) ( ON ?auto_152045 ?auto_152046 ) ( ON ?auto_152044 ?auto_152045 ) ( ON ?auto_152043 ?auto_152044 ) ( ON ?auto_152042 ?auto_152043 ) ( CLEAR ?auto_152040 ) ( ON ?auto_152041 ?auto_152042 ) ( CLEAR ?auto_152041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_152037 ?auto_152038 ?auto_152039 ?auto_152040 ?auto_152041 )
      ( MAKE-11PILE ?auto_152037 ?auto_152038 ?auto_152039 ?auto_152040 ?auto_152041 ?auto_152042 ?auto_152043 ?auto_152044 ?auto_152045 ?auto_152046 ?auto_152047 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_152060 - BLOCK
      ?auto_152061 - BLOCK
      ?auto_152062 - BLOCK
      ?auto_152063 - BLOCK
      ?auto_152064 - BLOCK
      ?auto_152065 - BLOCK
      ?auto_152066 - BLOCK
      ?auto_152067 - BLOCK
      ?auto_152068 - BLOCK
      ?auto_152069 - BLOCK
      ?auto_152070 - BLOCK
    )
    :vars
    (
      ?auto_152071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152070 ?auto_152071 ) ( ON-TABLE ?auto_152060 ) ( ON ?auto_152061 ?auto_152060 ) ( ON ?auto_152062 ?auto_152061 ) ( ON ?auto_152063 ?auto_152062 ) ( not ( = ?auto_152060 ?auto_152061 ) ) ( not ( = ?auto_152060 ?auto_152062 ) ) ( not ( = ?auto_152060 ?auto_152063 ) ) ( not ( = ?auto_152060 ?auto_152064 ) ) ( not ( = ?auto_152060 ?auto_152065 ) ) ( not ( = ?auto_152060 ?auto_152066 ) ) ( not ( = ?auto_152060 ?auto_152067 ) ) ( not ( = ?auto_152060 ?auto_152068 ) ) ( not ( = ?auto_152060 ?auto_152069 ) ) ( not ( = ?auto_152060 ?auto_152070 ) ) ( not ( = ?auto_152060 ?auto_152071 ) ) ( not ( = ?auto_152061 ?auto_152062 ) ) ( not ( = ?auto_152061 ?auto_152063 ) ) ( not ( = ?auto_152061 ?auto_152064 ) ) ( not ( = ?auto_152061 ?auto_152065 ) ) ( not ( = ?auto_152061 ?auto_152066 ) ) ( not ( = ?auto_152061 ?auto_152067 ) ) ( not ( = ?auto_152061 ?auto_152068 ) ) ( not ( = ?auto_152061 ?auto_152069 ) ) ( not ( = ?auto_152061 ?auto_152070 ) ) ( not ( = ?auto_152061 ?auto_152071 ) ) ( not ( = ?auto_152062 ?auto_152063 ) ) ( not ( = ?auto_152062 ?auto_152064 ) ) ( not ( = ?auto_152062 ?auto_152065 ) ) ( not ( = ?auto_152062 ?auto_152066 ) ) ( not ( = ?auto_152062 ?auto_152067 ) ) ( not ( = ?auto_152062 ?auto_152068 ) ) ( not ( = ?auto_152062 ?auto_152069 ) ) ( not ( = ?auto_152062 ?auto_152070 ) ) ( not ( = ?auto_152062 ?auto_152071 ) ) ( not ( = ?auto_152063 ?auto_152064 ) ) ( not ( = ?auto_152063 ?auto_152065 ) ) ( not ( = ?auto_152063 ?auto_152066 ) ) ( not ( = ?auto_152063 ?auto_152067 ) ) ( not ( = ?auto_152063 ?auto_152068 ) ) ( not ( = ?auto_152063 ?auto_152069 ) ) ( not ( = ?auto_152063 ?auto_152070 ) ) ( not ( = ?auto_152063 ?auto_152071 ) ) ( not ( = ?auto_152064 ?auto_152065 ) ) ( not ( = ?auto_152064 ?auto_152066 ) ) ( not ( = ?auto_152064 ?auto_152067 ) ) ( not ( = ?auto_152064 ?auto_152068 ) ) ( not ( = ?auto_152064 ?auto_152069 ) ) ( not ( = ?auto_152064 ?auto_152070 ) ) ( not ( = ?auto_152064 ?auto_152071 ) ) ( not ( = ?auto_152065 ?auto_152066 ) ) ( not ( = ?auto_152065 ?auto_152067 ) ) ( not ( = ?auto_152065 ?auto_152068 ) ) ( not ( = ?auto_152065 ?auto_152069 ) ) ( not ( = ?auto_152065 ?auto_152070 ) ) ( not ( = ?auto_152065 ?auto_152071 ) ) ( not ( = ?auto_152066 ?auto_152067 ) ) ( not ( = ?auto_152066 ?auto_152068 ) ) ( not ( = ?auto_152066 ?auto_152069 ) ) ( not ( = ?auto_152066 ?auto_152070 ) ) ( not ( = ?auto_152066 ?auto_152071 ) ) ( not ( = ?auto_152067 ?auto_152068 ) ) ( not ( = ?auto_152067 ?auto_152069 ) ) ( not ( = ?auto_152067 ?auto_152070 ) ) ( not ( = ?auto_152067 ?auto_152071 ) ) ( not ( = ?auto_152068 ?auto_152069 ) ) ( not ( = ?auto_152068 ?auto_152070 ) ) ( not ( = ?auto_152068 ?auto_152071 ) ) ( not ( = ?auto_152069 ?auto_152070 ) ) ( not ( = ?auto_152069 ?auto_152071 ) ) ( not ( = ?auto_152070 ?auto_152071 ) ) ( ON ?auto_152069 ?auto_152070 ) ( ON ?auto_152068 ?auto_152069 ) ( ON ?auto_152067 ?auto_152068 ) ( ON ?auto_152066 ?auto_152067 ) ( ON ?auto_152065 ?auto_152066 ) ( CLEAR ?auto_152063 ) ( ON ?auto_152064 ?auto_152065 ) ( CLEAR ?auto_152064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_152060 ?auto_152061 ?auto_152062 ?auto_152063 ?auto_152064 )
      ( MAKE-11PILE ?auto_152060 ?auto_152061 ?auto_152062 ?auto_152063 ?auto_152064 ?auto_152065 ?auto_152066 ?auto_152067 ?auto_152068 ?auto_152069 ?auto_152070 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_152083 - BLOCK
      ?auto_152084 - BLOCK
      ?auto_152085 - BLOCK
      ?auto_152086 - BLOCK
      ?auto_152087 - BLOCK
      ?auto_152088 - BLOCK
      ?auto_152089 - BLOCK
      ?auto_152090 - BLOCK
      ?auto_152091 - BLOCK
      ?auto_152092 - BLOCK
      ?auto_152093 - BLOCK
    )
    :vars
    (
      ?auto_152094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152093 ?auto_152094 ) ( ON-TABLE ?auto_152083 ) ( ON ?auto_152084 ?auto_152083 ) ( ON ?auto_152085 ?auto_152084 ) ( not ( = ?auto_152083 ?auto_152084 ) ) ( not ( = ?auto_152083 ?auto_152085 ) ) ( not ( = ?auto_152083 ?auto_152086 ) ) ( not ( = ?auto_152083 ?auto_152087 ) ) ( not ( = ?auto_152083 ?auto_152088 ) ) ( not ( = ?auto_152083 ?auto_152089 ) ) ( not ( = ?auto_152083 ?auto_152090 ) ) ( not ( = ?auto_152083 ?auto_152091 ) ) ( not ( = ?auto_152083 ?auto_152092 ) ) ( not ( = ?auto_152083 ?auto_152093 ) ) ( not ( = ?auto_152083 ?auto_152094 ) ) ( not ( = ?auto_152084 ?auto_152085 ) ) ( not ( = ?auto_152084 ?auto_152086 ) ) ( not ( = ?auto_152084 ?auto_152087 ) ) ( not ( = ?auto_152084 ?auto_152088 ) ) ( not ( = ?auto_152084 ?auto_152089 ) ) ( not ( = ?auto_152084 ?auto_152090 ) ) ( not ( = ?auto_152084 ?auto_152091 ) ) ( not ( = ?auto_152084 ?auto_152092 ) ) ( not ( = ?auto_152084 ?auto_152093 ) ) ( not ( = ?auto_152084 ?auto_152094 ) ) ( not ( = ?auto_152085 ?auto_152086 ) ) ( not ( = ?auto_152085 ?auto_152087 ) ) ( not ( = ?auto_152085 ?auto_152088 ) ) ( not ( = ?auto_152085 ?auto_152089 ) ) ( not ( = ?auto_152085 ?auto_152090 ) ) ( not ( = ?auto_152085 ?auto_152091 ) ) ( not ( = ?auto_152085 ?auto_152092 ) ) ( not ( = ?auto_152085 ?auto_152093 ) ) ( not ( = ?auto_152085 ?auto_152094 ) ) ( not ( = ?auto_152086 ?auto_152087 ) ) ( not ( = ?auto_152086 ?auto_152088 ) ) ( not ( = ?auto_152086 ?auto_152089 ) ) ( not ( = ?auto_152086 ?auto_152090 ) ) ( not ( = ?auto_152086 ?auto_152091 ) ) ( not ( = ?auto_152086 ?auto_152092 ) ) ( not ( = ?auto_152086 ?auto_152093 ) ) ( not ( = ?auto_152086 ?auto_152094 ) ) ( not ( = ?auto_152087 ?auto_152088 ) ) ( not ( = ?auto_152087 ?auto_152089 ) ) ( not ( = ?auto_152087 ?auto_152090 ) ) ( not ( = ?auto_152087 ?auto_152091 ) ) ( not ( = ?auto_152087 ?auto_152092 ) ) ( not ( = ?auto_152087 ?auto_152093 ) ) ( not ( = ?auto_152087 ?auto_152094 ) ) ( not ( = ?auto_152088 ?auto_152089 ) ) ( not ( = ?auto_152088 ?auto_152090 ) ) ( not ( = ?auto_152088 ?auto_152091 ) ) ( not ( = ?auto_152088 ?auto_152092 ) ) ( not ( = ?auto_152088 ?auto_152093 ) ) ( not ( = ?auto_152088 ?auto_152094 ) ) ( not ( = ?auto_152089 ?auto_152090 ) ) ( not ( = ?auto_152089 ?auto_152091 ) ) ( not ( = ?auto_152089 ?auto_152092 ) ) ( not ( = ?auto_152089 ?auto_152093 ) ) ( not ( = ?auto_152089 ?auto_152094 ) ) ( not ( = ?auto_152090 ?auto_152091 ) ) ( not ( = ?auto_152090 ?auto_152092 ) ) ( not ( = ?auto_152090 ?auto_152093 ) ) ( not ( = ?auto_152090 ?auto_152094 ) ) ( not ( = ?auto_152091 ?auto_152092 ) ) ( not ( = ?auto_152091 ?auto_152093 ) ) ( not ( = ?auto_152091 ?auto_152094 ) ) ( not ( = ?auto_152092 ?auto_152093 ) ) ( not ( = ?auto_152092 ?auto_152094 ) ) ( not ( = ?auto_152093 ?auto_152094 ) ) ( ON ?auto_152092 ?auto_152093 ) ( ON ?auto_152091 ?auto_152092 ) ( ON ?auto_152090 ?auto_152091 ) ( ON ?auto_152089 ?auto_152090 ) ( ON ?auto_152088 ?auto_152089 ) ( ON ?auto_152087 ?auto_152088 ) ( CLEAR ?auto_152085 ) ( ON ?auto_152086 ?auto_152087 ) ( CLEAR ?auto_152086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_152083 ?auto_152084 ?auto_152085 ?auto_152086 )
      ( MAKE-11PILE ?auto_152083 ?auto_152084 ?auto_152085 ?auto_152086 ?auto_152087 ?auto_152088 ?auto_152089 ?auto_152090 ?auto_152091 ?auto_152092 ?auto_152093 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_152106 - BLOCK
      ?auto_152107 - BLOCK
      ?auto_152108 - BLOCK
      ?auto_152109 - BLOCK
      ?auto_152110 - BLOCK
      ?auto_152111 - BLOCK
      ?auto_152112 - BLOCK
      ?auto_152113 - BLOCK
      ?auto_152114 - BLOCK
      ?auto_152115 - BLOCK
      ?auto_152116 - BLOCK
    )
    :vars
    (
      ?auto_152117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152116 ?auto_152117 ) ( ON-TABLE ?auto_152106 ) ( ON ?auto_152107 ?auto_152106 ) ( ON ?auto_152108 ?auto_152107 ) ( not ( = ?auto_152106 ?auto_152107 ) ) ( not ( = ?auto_152106 ?auto_152108 ) ) ( not ( = ?auto_152106 ?auto_152109 ) ) ( not ( = ?auto_152106 ?auto_152110 ) ) ( not ( = ?auto_152106 ?auto_152111 ) ) ( not ( = ?auto_152106 ?auto_152112 ) ) ( not ( = ?auto_152106 ?auto_152113 ) ) ( not ( = ?auto_152106 ?auto_152114 ) ) ( not ( = ?auto_152106 ?auto_152115 ) ) ( not ( = ?auto_152106 ?auto_152116 ) ) ( not ( = ?auto_152106 ?auto_152117 ) ) ( not ( = ?auto_152107 ?auto_152108 ) ) ( not ( = ?auto_152107 ?auto_152109 ) ) ( not ( = ?auto_152107 ?auto_152110 ) ) ( not ( = ?auto_152107 ?auto_152111 ) ) ( not ( = ?auto_152107 ?auto_152112 ) ) ( not ( = ?auto_152107 ?auto_152113 ) ) ( not ( = ?auto_152107 ?auto_152114 ) ) ( not ( = ?auto_152107 ?auto_152115 ) ) ( not ( = ?auto_152107 ?auto_152116 ) ) ( not ( = ?auto_152107 ?auto_152117 ) ) ( not ( = ?auto_152108 ?auto_152109 ) ) ( not ( = ?auto_152108 ?auto_152110 ) ) ( not ( = ?auto_152108 ?auto_152111 ) ) ( not ( = ?auto_152108 ?auto_152112 ) ) ( not ( = ?auto_152108 ?auto_152113 ) ) ( not ( = ?auto_152108 ?auto_152114 ) ) ( not ( = ?auto_152108 ?auto_152115 ) ) ( not ( = ?auto_152108 ?auto_152116 ) ) ( not ( = ?auto_152108 ?auto_152117 ) ) ( not ( = ?auto_152109 ?auto_152110 ) ) ( not ( = ?auto_152109 ?auto_152111 ) ) ( not ( = ?auto_152109 ?auto_152112 ) ) ( not ( = ?auto_152109 ?auto_152113 ) ) ( not ( = ?auto_152109 ?auto_152114 ) ) ( not ( = ?auto_152109 ?auto_152115 ) ) ( not ( = ?auto_152109 ?auto_152116 ) ) ( not ( = ?auto_152109 ?auto_152117 ) ) ( not ( = ?auto_152110 ?auto_152111 ) ) ( not ( = ?auto_152110 ?auto_152112 ) ) ( not ( = ?auto_152110 ?auto_152113 ) ) ( not ( = ?auto_152110 ?auto_152114 ) ) ( not ( = ?auto_152110 ?auto_152115 ) ) ( not ( = ?auto_152110 ?auto_152116 ) ) ( not ( = ?auto_152110 ?auto_152117 ) ) ( not ( = ?auto_152111 ?auto_152112 ) ) ( not ( = ?auto_152111 ?auto_152113 ) ) ( not ( = ?auto_152111 ?auto_152114 ) ) ( not ( = ?auto_152111 ?auto_152115 ) ) ( not ( = ?auto_152111 ?auto_152116 ) ) ( not ( = ?auto_152111 ?auto_152117 ) ) ( not ( = ?auto_152112 ?auto_152113 ) ) ( not ( = ?auto_152112 ?auto_152114 ) ) ( not ( = ?auto_152112 ?auto_152115 ) ) ( not ( = ?auto_152112 ?auto_152116 ) ) ( not ( = ?auto_152112 ?auto_152117 ) ) ( not ( = ?auto_152113 ?auto_152114 ) ) ( not ( = ?auto_152113 ?auto_152115 ) ) ( not ( = ?auto_152113 ?auto_152116 ) ) ( not ( = ?auto_152113 ?auto_152117 ) ) ( not ( = ?auto_152114 ?auto_152115 ) ) ( not ( = ?auto_152114 ?auto_152116 ) ) ( not ( = ?auto_152114 ?auto_152117 ) ) ( not ( = ?auto_152115 ?auto_152116 ) ) ( not ( = ?auto_152115 ?auto_152117 ) ) ( not ( = ?auto_152116 ?auto_152117 ) ) ( ON ?auto_152115 ?auto_152116 ) ( ON ?auto_152114 ?auto_152115 ) ( ON ?auto_152113 ?auto_152114 ) ( ON ?auto_152112 ?auto_152113 ) ( ON ?auto_152111 ?auto_152112 ) ( ON ?auto_152110 ?auto_152111 ) ( CLEAR ?auto_152108 ) ( ON ?auto_152109 ?auto_152110 ) ( CLEAR ?auto_152109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_152106 ?auto_152107 ?auto_152108 ?auto_152109 )
      ( MAKE-11PILE ?auto_152106 ?auto_152107 ?auto_152108 ?auto_152109 ?auto_152110 ?auto_152111 ?auto_152112 ?auto_152113 ?auto_152114 ?auto_152115 ?auto_152116 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_152129 - BLOCK
      ?auto_152130 - BLOCK
      ?auto_152131 - BLOCK
      ?auto_152132 - BLOCK
      ?auto_152133 - BLOCK
      ?auto_152134 - BLOCK
      ?auto_152135 - BLOCK
      ?auto_152136 - BLOCK
      ?auto_152137 - BLOCK
      ?auto_152138 - BLOCK
      ?auto_152139 - BLOCK
    )
    :vars
    (
      ?auto_152140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152139 ?auto_152140 ) ( ON-TABLE ?auto_152129 ) ( ON ?auto_152130 ?auto_152129 ) ( not ( = ?auto_152129 ?auto_152130 ) ) ( not ( = ?auto_152129 ?auto_152131 ) ) ( not ( = ?auto_152129 ?auto_152132 ) ) ( not ( = ?auto_152129 ?auto_152133 ) ) ( not ( = ?auto_152129 ?auto_152134 ) ) ( not ( = ?auto_152129 ?auto_152135 ) ) ( not ( = ?auto_152129 ?auto_152136 ) ) ( not ( = ?auto_152129 ?auto_152137 ) ) ( not ( = ?auto_152129 ?auto_152138 ) ) ( not ( = ?auto_152129 ?auto_152139 ) ) ( not ( = ?auto_152129 ?auto_152140 ) ) ( not ( = ?auto_152130 ?auto_152131 ) ) ( not ( = ?auto_152130 ?auto_152132 ) ) ( not ( = ?auto_152130 ?auto_152133 ) ) ( not ( = ?auto_152130 ?auto_152134 ) ) ( not ( = ?auto_152130 ?auto_152135 ) ) ( not ( = ?auto_152130 ?auto_152136 ) ) ( not ( = ?auto_152130 ?auto_152137 ) ) ( not ( = ?auto_152130 ?auto_152138 ) ) ( not ( = ?auto_152130 ?auto_152139 ) ) ( not ( = ?auto_152130 ?auto_152140 ) ) ( not ( = ?auto_152131 ?auto_152132 ) ) ( not ( = ?auto_152131 ?auto_152133 ) ) ( not ( = ?auto_152131 ?auto_152134 ) ) ( not ( = ?auto_152131 ?auto_152135 ) ) ( not ( = ?auto_152131 ?auto_152136 ) ) ( not ( = ?auto_152131 ?auto_152137 ) ) ( not ( = ?auto_152131 ?auto_152138 ) ) ( not ( = ?auto_152131 ?auto_152139 ) ) ( not ( = ?auto_152131 ?auto_152140 ) ) ( not ( = ?auto_152132 ?auto_152133 ) ) ( not ( = ?auto_152132 ?auto_152134 ) ) ( not ( = ?auto_152132 ?auto_152135 ) ) ( not ( = ?auto_152132 ?auto_152136 ) ) ( not ( = ?auto_152132 ?auto_152137 ) ) ( not ( = ?auto_152132 ?auto_152138 ) ) ( not ( = ?auto_152132 ?auto_152139 ) ) ( not ( = ?auto_152132 ?auto_152140 ) ) ( not ( = ?auto_152133 ?auto_152134 ) ) ( not ( = ?auto_152133 ?auto_152135 ) ) ( not ( = ?auto_152133 ?auto_152136 ) ) ( not ( = ?auto_152133 ?auto_152137 ) ) ( not ( = ?auto_152133 ?auto_152138 ) ) ( not ( = ?auto_152133 ?auto_152139 ) ) ( not ( = ?auto_152133 ?auto_152140 ) ) ( not ( = ?auto_152134 ?auto_152135 ) ) ( not ( = ?auto_152134 ?auto_152136 ) ) ( not ( = ?auto_152134 ?auto_152137 ) ) ( not ( = ?auto_152134 ?auto_152138 ) ) ( not ( = ?auto_152134 ?auto_152139 ) ) ( not ( = ?auto_152134 ?auto_152140 ) ) ( not ( = ?auto_152135 ?auto_152136 ) ) ( not ( = ?auto_152135 ?auto_152137 ) ) ( not ( = ?auto_152135 ?auto_152138 ) ) ( not ( = ?auto_152135 ?auto_152139 ) ) ( not ( = ?auto_152135 ?auto_152140 ) ) ( not ( = ?auto_152136 ?auto_152137 ) ) ( not ( = ?auto_152136 ?auto_152138 ) ) ( not ( = ?auto_152136 ?auto_152139 ) ) ( not ( = ?auto_152136 ?auto_152140 ) ) ( not ( = ?auto_152137 ?auto_152138 ) ) ( not ( = ?auto_152137 ?auto_152139 ) ) ( not ( = ?auto_152137 ?auto_152140 ) ) ( not ( = ?auto_152138 ?auto_152139 ) ) ( not ( = ?auto_152138 ?auto_152140 ) ) ( not ( = ?auto_152139 ?auto_152140 ) ) ( ON ?auto_152138 ?auto_152139 ) ( ON ?auto_152137 ?auto_152138 ) ( ON ?auto_152136 ?auto_152137 ) ( ON ?auto_152135 ?auto_152136 ) ( ON ?auto_152134 ?auto_152135 ) ( ON ?auto_152133 ?auto_152134 ) ( ON ?auto_152132 ?auto_152133 ) ( CLEAR ?auto_152130 ) ( ON ?auto_152131 ?auto_152132 ) ( CLEAR ?auto_152131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_152129 ?auto_152130 ?auto_152131 )
      ( MAKE-11PILE ?auto_152129 ?auto_152130 ?auto_152131 ?auto_152132 ?auto_152133 ?auto_152134 ?auto_152135 ?auto_152136 ?auto_152137 ?auto_152138 ?auto_152139 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_152152 - BLOCK
      ?auto_152153 - BLOCK
      ?auto_152154 - BLOCK
      ?auto_152155 - BLOCK
      ?auto_152156 - BLOCK
      ?auto_152157 - BLOCK
      ?auto_152158 - BLOCK
      ?auto_152159 - BLOCK
      ?auto_152160 - BLOCK
      ?auto_152161 - BLOCK
      ?auto_152162 - BLOCK
    )
    :vars
    (
      ?auto_152163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152162 ?auto_152163 ) ( ON-TABLE ?auto_152152 ) ( ON ?auto_152153 ?auto_152152 ) ( not ( = ?auto_152152 ?auto_152153 ) ) ( not ( = ?auto_152152 ?auto_152154 ) ) ( not ( = ?auto_152152 ?auto_152155 ) ) ( not ( = ?auto_152152 ?auto_152156 ) ) ( not ( = ?auto_152152 ?auto_152157 ) ) ( not ( = ?auto_152152 ?auto_152158 ) ) ( not ( = ?auto_152152 ?auto_152159 ) ) ( not ( = ?auto_152152 ?auto_152160 ) ) ( not ( = ?auto_152152 ?auto_152161 ) ) ( not ( = ?auto_152152 ?auto_152162 ) ) ( not ( = ?auto_152152 ?auto_152163 ) ) ( not ( = ?auto_152153 ?auto_152154 ) ) ( not ( = ?auto_152153 ?auto_152155 ) ) ( not ( = ?auto_152153 ?auto_152156 ) ) ( not ( = ?auto_152153 ?auto_152157 ) ) ( not ( = ?auto_152153 ?auto_152158 ) ) ( not ( = ?auto_152153 ?auto_152159 ) ) ( not ( = ?auto_152153 ?auto_152160 ) ) ( not ( = ?auto_152153 ?auto_152161 ) ) ( not ( = ?auto_152153 ?auto_152162 ) ) ( not ( = ?auto_152153 ?auto_152163 ) ) ( not ( = ?auto_152154 ?auto_152155 ) ) ( not ( = ?auto_152154 ?auto_152156 ) ) ( not ( = ?auto_152154 ?auto_152157 ) ) ( not ( = ?auto_152154 ?auto_152158 ) ) ( not ( = ?auto_152154 ?auto_152159 ) ) ( not ( = ?auto_152154 ?auto_152160 ) ) ( not ( = ?auto_152154 ?auto_152161 ) ) ( not ( = ?auto_152154 ?auto_152162 ) ) ( not ( = ?auto_152154 ?auto_152163 ) ) ( not ( = ?auto_152155 ?auto_152156 ) ) ( not ( = ?auto_152155 ?auto_152157 ) ) ( not ( = ?auto_152155 ?auto_152158 ) ) ( not ( = ?auto_152155 ?auto_152159 ) ) ( not ( = ?auto_152155 ?auto_152160 ) ) ( not ( = ?auto_152155 ?auto_152161 ) ) ( not ( = ?auto_152155 ?auto_152162 ) ) ( not ( = ?auto_152155 ?auto_152163 ) ) ( not ( = ?auto_152156 ?auto_152157 ) ) ( not ( = ?auto_152156 ?auto_152158 ) ) ( not ( = ?auto_152156 ?auto_152159 ) ) ( not ( = ?auto_152156 ?auto_152160 ) ) ( not ( = ?auto_152156 ?auto_152161 ) ) ( not ( = ?auto_152156 ?auto_152162 ) ) ( not ( = ?auto_152156 ?auto_152163 ) ) ( not ( = ?auto_152157 ?auto_152158 ) ) ( not ( = ?auto_152157 ?auto_152159 ) ) ( not ( = ?auto_152157 ?auto_152160 ) ) ( not ( = ?auto_152157 ?auto_152161 ) ) ( not ( = ?auto_152157 ?auto_152162 ) ) ( not ( = ?auto_152157 ?auto_152163 ) ) ( not ( = ?auto_152158 ?auto_152159 ) ) ( not ( = ?auto_152158 ?auto_152160 ) ) ( not ( = ?auto_152158 ?auto_152161 ) ) ( not ( = ?auto_152158 ?auto_152162 ) ) ( not ( = ?auto_152158 ?auto_152163 ) ) ( not ( = ?auto_152159 ?auto_152160 ) ) ( not ( = ?auto_152159 ?auto_152161 ) ) ( not ( = ?auto_152159 ?auto_152162 ) ) ( not ( = ?auto_152159 ?auto_152163 ) ) ( not ( = ?auto_152160 ?auto_152161 ) ) ( not ( = ?auto_152160 ?auto_152162 ) ) ( not ( = ?auto_152160 ?auto_152163 ) ) ( not ( = ?auto_152161 ?auto_152162 ) ) ( not ( = ?auto_152161 ?auto_152163 ) ) ( not ( = ?auto_152162 ?auto_152163 ) ) ( ON ?auto_152161 ?auto_152162 ) ( ON ?auto_152160 ?auto_152161 ) ( ON ?auto_152159 ?auto_152160 ) ( ON ?auto_152158 ?auto_152159 ) ( ON ?auto_152157 ?auto_152158 ) ( ON ?auto_152156 ?auto_152157 ) ( ON ?auto_152155 ?auto_152156 ) ( CLEAR ?auto_152153 ) ( ON ?auto_152154 ?auto_152155 ) ( CLEAR ?auto_152154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_152152 ?auto_152153 ?auto_152154 )
      ( MAKE-11PILE ?auto_152152 ?auto_152153 ?auto_152154 ?auto_152155 ?auto_152156 ?auto_152157 ?auto_152158 ?auto_152159 ?auto_152160 ?auto_152161 ?auto_152162 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_152175 - BLOCK
      ?auto_152176 - BLOCK
      ?auto_152177 - BLOCK
      ?auto_152178 - BLOCK
      ?auto_152179 - BLOCK
      ?auto_152180 - BLOCK
      ?auto_152181 - BLOCK
      ?auto_152182 - BLOCK
      ?auto_152183 - BLOCK
      ?auto_152184 - BLOCK
      ?auto_152185 - BLOCK
    )
    :vars
    (
      ?auto_152186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152185 ?auto_152186 ) ( ON-TABLE ?auto_152175 ) ( not ( = ?auto_152175 ?auto_152176 ) ) ( not ( = ?auto_152175 ?auto_152177 ) ) ( not ( = ?auto_152175 ?auto_152178 ) ) ( not ( = ?auto_152175 ?auto_152179 ) ) ( not ( = ?auto_152175 ?auto_152180 ) ) ( not ( = ?auto_152175 ?auto_152181 ) ) ( not ( = ?auto_152175 ?auto_152182 ) ) ( not ( = ?auto_152175 ?auto_152183 ) ) ( not ( = ?auto_152175 ?auto_152184 ) ) ( not ( = ?auto_152175 ?auto_152185 ) ) ( not ( = ?auto_152175 ?auto_152186 ) ) ( not ( = ?auto_152176 ?auto_152177 ) ) ( not ( = ?auto_152176 ?auto_152178 ) ) ( not ( = ?auto_152176 ?auto_152179 ) ) ( not ( = ?auto_152176 ?auto_152180 ) ) ( not ( = ?auto_152176 ?auto_152181 ) ) ( not ( = ?auto_152176 ?auto_152182 ) ) ( not ( = ?auto_152176 ?auto_152183 ) ) ( not ( = ?auto_152176 ?auto_152184 ) ) ( not ( = ?auto_152176 ?auto_152185 ) ) ( not ( = ?auto_152176 ?auto_152186 ) ) ( not ( = ?auto_152177 ?auto_152178 ) ) ( not ( = ?auto_152177 ?auto_152179 ) ) ( not ( = ?auto_152177 ?auto_152180 ) ) ( not ( = ?auto_152177 ?auto_152181 ) ) ( not ( = ?auto_152177 ?auto_152182 ) ) ( not ( = ?auto_152177 ?auto_152183 ) ) ( not ( = ?auto_152177 ?auto_152184 ) ) ( not ( = ?auto_152177 ?auto_152185 ) ) ( not ( = ?auto_152177 ?auto_152186 ) ) ( not ( = ?auto_152178 ?auto_152179 ) ) ( not ( = ?auto_152178 ?auto_152180 ) ) ( not ( = ?auto_152178 ?auto_152181 ) ) ( not ( = ?auto_152178 ?auto_152182 ) ) ( not ( = ?auto_152178 ?auto_152183 ) ) ( not ( = ?auto_152178 ?auto_152184 ) ) ( not ( = ?auto_152178 ?auto_152185 ) ) ( not ( = ?auto_152178 ?auto_152186 ) ) ( not ( = ?auto_152179 ?auto_152180 ) ) ( not ( = ?auto_152179 ?auto_152181 ) ) ( not ( = ?auto_152179 ?auto_152182 ) ) ( not ( = ?auto_152179 ?auto_152183 ) ) ( not ( = ?auto_152179 ?auto_152184 ) ) ( not ( = ?auto_152179 ?auto_152185 ) ) ( not ( = ?auto_152179 ?auto_152186 ) ) ( not ( = ?auto_152180 ?auto_152181 ) ) ( not ( = ?auto_152180 ?auto_152182 ) ) ( not ( = ?auto_152180 ?auto_152183 ) ) ( not ( = ?auto_152180 ?auto_152184 ) ) ( not ( = ?auto_152180 ?auto_152185 ) ) ( not ( = ?auto_152180 ?auto_152186 ) ) ( not ( = ?auto_152181 ?auto_152182 ) ) ( not ( = ?auto_152181 ?auto_152183 ) ) ( not ( = ?auto_152181 ?auto_152184 ) ) ( not ( = ?auto_152181 ?auto_152185 ) ) ( not ( = ?auto_152181 ?auto_152186 ) ) ( not ( = ?auto_152182 ?auto_152183 ) ) ( not ( = ?auto_152182 ?auto_152184 ) ) ( not ( = ?auto_152182 ?auto_152185 ) ) ( not ( = ?auto_152182 ?auto_152186 ) ) ( not ( = ?auto_152183 ?auto_152184 ) ) ( not ( = ?auto_152183 ?auto_152185 ) ) ( not ( = ?auto_152183 ?auto_152186 ) ) ( not ( = ?auto_152184 ?auto_152185 ) ) ( not ( = ?auto_152184 ?auto_152186 ) ) ( not ( = ?auto_152185 ?auto_152186 ) ) ( ON ?auto_152184 ?auto_152185 ) ( ON ?auto_152183 ?auto_152184 ) ( ON ?auto_152182 ?auto_152183 ) ( ON ?auto_152181 ?auto_152182 ) ( ON ?auto_152180 ?auto_152181 ) ( ON ?auto_152179 ?auto_152180 ) ( ON ?auto_152178 ?auto_152179 ) ( ON ?auto_152177 ?auto_152178 ) ( CLEAR ?auto_152175 ) ( ON ?auto_152176 ?auto_152177 ) ( CLEAR ?auto_152176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152175 ?auto_152176 )
      ( MAKE-11PILE ?auto_152175 ?auto_152176 ?auto_152177 ?auto_152178 ?auto_152179 ?auto_152180 ?auto_152181 ?auto_152182 ?auto_152183 ?auto_152184 ?auto_152185 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_152198 - BLOCK
      ?auto_152199 - BLOCK
      ?auto_152200 - BLOCK
      ?auto_152201 - BLOCK
      ?auto_152202 - BLOCK
      ?auto_152203 - BLOCK
      ?auto_152204 - BLOCK
      ?auto_152205 - BLOCK
      ?auto_152206 - BLOCK
      ?auto_152207 - BLOCK
      ?auto_152208 - BLOCK
    )
    :vars
    (
      ?auto_152209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152208 ?auto_152209 ) ( ON-TABLE ?auto_152198 ) ( not ( = ?auto_152198 ?auto_152199 ) ) ( not ( = ?auto_152198 ?auto_152200 ) ) ( not ( = ?auto_152198 ?auto_152201 ) ) ( not ( = ?auto_152198 ?auto_152202 ) ) ( not ( = ?auto_152198 ?auto_152203 ) ) ( not ( = ?auto_152198 ?auto_152204 ) ) ( not ( = ?auto_152198 ?auto_152205 ) ) ( not ( = ?auto_152198 ?auto_152206 ) ) ( not ( = ?auto_152198 ?auto_152207 ) ) ( not ( = ?auto_152198 ?auto_152208 ) ) ( not ( = ?auto_152198 ?auto_152209 ) ) ( not ( = ?auto_152199 ?auto_152200 ) ) ( not ( = ?auto_152199 ?auto_152201 ) ) ( not ( = ?auto_152199 ?auto_152202 ) ) ( not ( = ?auto_152199 ?auto_152203 ) ) ( not ( = ?auto_152199 ?auto_152204 ) ) ( not ( = ?auto_152199 ?auto_152205 ) ) ( not ( = ?auto_152199 ?auto_152206 ) ) ( not ( = ?auto_152199 ?auto_152207 ) ) ( not ( = ?auto_152199 ?auto_152208 ) ) ( not ( = ?auto_152199 ?auto_152209 ) ) ( not ( = ?auto_152200 ?auto_152201 ) ) ( not ( = ?auto_152200 ?auto_152202 ) ) ( not ( = ?auto_152200 ?auto_152203 ) ) ( not ( = ?auto_152200 ?auto_152204 ) ) ( not ( = ?auto_152200 ?auto_152205 ) ) ( not ( = ?auto_152200 ?auto_152206 ) ) ( not ( = ?auto_152200 ?auto_152207 ) ) ( not ( = ?auto_152200 ?auto_152208 ) ) ( not ( = ?auto_152200 ?auto_152209 ) ) ( not ( = ?auto_152201 ?auto_152202 ) ) ( not ( = ?auto_152201 ?auto_152203 ) ) ( not ( = ?auto_152201 ?auto_152204 ) ) ( not ( = ?auto_152201 ?auto_152205 ) ) ( not ( = ?auto_152201 ?auto_152206 ) ) ( not ( = ?auto_152201 ?auto_152207 ) ) ( not ( = ?auto_152201 ?auto_152208 ) ) ( not ( = ?auto_152201 ?auto_152209 ) ) ( not ( = ?auto_152202 ?auto_152203 ) ) ( not ( = ?auto_152202 ?auto_152204 ) ) ( not ( = ?auto_152202 ?auto_152205 ) ) ( not ( = ?auto_152202 ?auto_152206 ) ) ( not ( = ?auto_152202 ?auto_152207 ) ) ( not ( = ?auto_152202 ?auto_152208 ) ) ( not ( = ?auto_152202 ?auto_152209 ) ) ( not ( = ?auto_152203 ?auto_152204 ) ) ( not ( = ?auto_152203 ?auto_152205 ) ) ( not ( = ?auto_152203 ?auto_152206 ) ) ( not ( = ?auto_152203 ?auto_152207 ) ) ( not ( = ?auto_152203 ?auto_152208 ) ) ( not ( = ?auto_152203 ?auto_152209 ) ) ( not ( = ?auto_152204 ?auto_152205 ) ) ( not ( = ?auto_152204 ?auto_152206 ) ) ( not ( = ?auto_152204 ?auto_152207 ) ) ( not ( = ?auto_152204 ?auto_152208 ) ) ( not ( = ?auto_152204 ?auto_152209 ) ) ( not ( = ?auto_152205 ?auto_152206 ) ) ( not ( = ?auto_152205 ?auto_152207 ) ) ( not ( = ?auto_152205 ?auto_152208 ) ) ( not ( = ?auto_152205 ?auto_152209 ) ) ( not ( = ?auto_152206 ?auto_152207 ) ) ( not ( = ?auto_152206 ?auto_152208 ) ) ( not ( = ?auto_152206 ?auto_152209 ) ) ( not ( = ?auto_152207 ?auto_152208 ) ) ( not ( = ?auto_152207 ?auto_152209 ) ) ( not ( = ?auto_152208 ?auto_152209 ) ) ( ON ?auto_152207 ?auto_152208 ) ( ON ?auto_152206 ?auto_152207 ) ( ON ?auto_152205 ?auto_152206 ) ( ON ?auto_152204 ?auto_152205 ) ( ON ?auto_152203 ?auto_152204 ) ( ON ?auto_152202 ?auto_152203 ) ( ON ?auto_152201 ?auto_152202 ) ( ON ?auto_152200 ?auto_152201 ) ( CLEAR ?auto_152198 ) ( ON ?auto_152199 ?auto_152200 ) ( CLEAR ?auto_152199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152198 ?auto_152199 )
      ( MAKE-11PILE ?auto_152198 ?auto_152199 ?auto_152200 ?auto_152201 ?auto_152202 ?auto_152203 ?auto_152204 ?auto_152205 ?auto_152206 ?auto_152207 ?auto_152208 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_152221 - BLOCK
      ?auto_152222 - BLOCK
      ?auto_152223 - BLOCK
      ?auto_152224 - BLOCK
      ?auto_152225 - BLOCK
      ?auto_152226 - BLOCK
      ?auto_152227 - BLOCK
      ?auto_152228 - BLOCK
      ?auto_152229 - BLOCK
      ?auto_152230 - BLOCK
      ?auto_152231 - BLOCK
    )
    :vars
    (
      ?auto_152232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152231 ?auto_152232 ) ( not ( = ?auto_152221 ?auto_152222 ) ) ( not ( = ?auto_152221 ?auto_152223 ) ) ( not ( = ?auto_152221 ?auto_152224 ) ) ( not ( = ?auto_152221 ?auto_152225 ) ) ( not ( = ?auto_152221 ?auto_152226 ) ) ( not ( = ?auto_152221 ?auto_152227 ) ) ( not ( = ?auto_152221 ?auto_152228 ) ) ( not ( = ?auto_152221 ?auto_152229 ) ) ( not ( = ?auto_152221 ?auto_152230 ) ) ( not ( = ?auto_152221 ?auto_152231 ) ) ( not ( = ?auto_152221 ?auto_152232 ) ) ( not ( = ?auto_152222 ?auto_152223 ) ) ( not ( = ?auto_152222 ?auto_152224 ) ) ( not ( = ?auto_152222 ?auto_152225 ) ) ( not ( = ?auto_152222 ?auto_152226 ) ) ( not ( = ?auto_152222 ?auto_152227 ) ) ( not ( = ?auto_152222 ?auto_152228 ) ) ( not ( = ?auto_152222 ?auto_152229 ) ) ( not ( = ?auto_152222 ?auto_152230 ) ) ( not ( = ?auto_152222 ?auto_152231 ) ) ( not ( = ?auto_152222 ?auto_152232 ) ) ( not ( = ?auto_152223 ?auto_152224 ) ) ( not ( = ?auto_152223 ?auto_152225 ) ) ( not ( = ?auto_152223 ?auto_152226 ) ) ( not ( = ?auto_152223 ?auto_152227 ) ) ( not ( = ?auto_152223 ?auto_152228 ) ) ( not ( = ?auto_152223 ?auto_152229 ) ) ( not ( = ?auto_152223 ?auto_152230 ) ) ( not ( = ?auto_152223 ?auto_152231 ) ) ( not ( = ?auto_152223 ?auto_152232 ) ) ( not ( = ?auto_152224 ?auto_152225 ) ) ( not ( = ?auto_152224 ?auto_152226 ) ) ( not ( = ?auto_152224 ?auto_152227 ) ) ( not ( = ?auto_152224 ?auto_152228 ) ) ( not ( = ?auto_152224 ?auto_152229 ) ) ( not ( = ?auto_152224 ?auto_152230 ) ) ( not ( = ?auto_152224 ?auto_152231 ) ) ( not ( = ?auto_152224 ?auto_152232 ) ) ( not ( = ?auto_152225 ?auto_152226 ) ) ( not ( = ?auto_152225 ?auto_152227 ) ) ( not ( = ?auto_152225 ?auto_152228 ) ) ( not ( = ?auto_152225 ?auto_152229 ) ) ( not ( = ?auto_152225 ?auto_152230 ) ) ( not ( = ?auto_152225 ?auto_152231 ) ) ( not ( = ?auto_152225 ?auto_152232 ) ) ( not ( = ?auto_152226 ?auto_152227 ) ) ( not ( = ?auto_152226 ?auto_152228 ) ) ( not ( = ?auto_152226 ?auto_152229 ) ) ( not ( = ?auto_152226 ?auto_152230 ) ) ( not ( = ?auto_152226 ?auto_152231 ) ) ( not ( = ?auto_152226 ?auto_152232 ) ) ( not ( = ?auto_152227 ?auto_152228 ) ) ( not ( = ?auto_152227 ?auto_152229 ) ) ( not ( = ?auto_152227 ?auto_152230 ) ) ( not ( = ?auto_152227 ?auto_152231 ) ) ( not ( = ?auto_152227 ?auto_152232 ) ) ( not ( = ?auto_152228 ?auto_152229 ) ) ( not ( = ?auto_152228 ?auto_152230 ) ) ( not ( = ?auto_152228 ?auto_152231 ) ) ( not ( = ?auto_152228 ?auto_152232 ) ) ( not ( = ?auto_152229 ?auto_152230 ) ) ( not ( = ?auto_152229 ?auto_152231 ) ) ( not ( = ?auto_152229 ?auto_152232 ) ) ( not ( = ?auto_152230 ?auto_152231 ) ) ( not ( = ?auto_152230 ?auto_152232 ) ) ( not ( = ?auto_152231 ?auto_152232 ) ) ( ON ?auto_152230 ?auto_152231 ) ( ON ?auto_152229 ?auto_152230 ) ( ON ?auto_152228 ?auto_152229 ) ( ON ?auto_152227 ?auto_152228 ) ( ON ?auto_152226 ?auto_152227 ) ( ON ?auto_152225 ?auto_152226 ) ( ON ?auto_152224 ?auto_152225 ) ( ON ?auto_152223 ?auto_152224 ) ( ON ?auto_152222 ?auto_152223 ) ( ON ?auto_152221 ?auto_152222 ) ( CLEAR ?auto_152221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_152221 )
      ( MAKE-11PILE ?auto_152221 ?auto_152222 ?auto_152223 ?auto_152224 ?auto_152225 ?auto_152226 ?auto_152227 ?auto_152228 ?auto_152229 ?auto_152230 ?auto_152231 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_152244 - BLOCK
      ?auto_152245 - BLOCK
      ?auto_152246 - BLOCK
      ?auto_152247 - BLOCK
      ?auto_152248 - BLOCK
      ?auto_152249 - BLOCK
      ?auto_152250 - BLOCK
      ?auto_152251 - BLOCK
      ?auto_152252 - BLOCK
      ?auto_152253 - BLOCK
      ?auto_152254 - BLOCK
    )
    :vars
    (
      ?auto_152255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152254 ?auto_152255 ) ( not ( = ?auto_152244 ?auto_152245 ) ) ( not ( = ?auto_152244 ?auto_152246 ) ) ( not ( = ?auto_152244 ?auto_152247 ) ) ( not ( = ?auto_152244 ?auto_152248 ) ) ( not ( = ?auto_152244 ?auto_152249 ) ) ( not ( = ?auto_152244 ?auto_152250 ) ) ( not ( = ?auto_152244 ?auto_152251 ) ) ( not ( = ?auto_152244 ?auto_152252 ) ) ( not ( = ?auto_152244 ?auto_152253 ) ) ( not ( = ?auto_152244 ?auto_152254 ) ) ( not ( = ?auto_152244 ?auto_152255 ) ) ( not ( = ?auto_152245 ?auto_152246 ) ) ( not ( = ?auto_152245 ?auto_152247 ) ) ( not ( = ?auto_152245 ?auto_152248 ) ) ( not ( = ?auto_152245 ?auto_152249 ) ) ( not ( = ?auto_152245 ?auto_152250 ) ) ( not ( = ?auto_152245 ?auto_152251 ) ) ( not ( = ?auto_152245 ?auto_152252 ) ) ( not ( = ?auto_152245 ?auto_152253 ) ) ( not ( = ?auto_152245 ?auto_152254 ) ) ( not ( = ?auto_152245 ?auto_152255 ) ) ( not ( = ?auto_152246 ?auto_152247 ) ) ( not ( = ?auto_152246 ?auto_152248 ) ) ( not ( = ?auto_152246 ?auto_152249 ) ) ( not ( = ?auto_152246 ?auto_152250 ) ) ( not ( = ?auto_152246 ?auto_152251 ) ) ( not ( = ?auto_152246 ?auto_152252 ) ) ( not ( = ?auto_152246 ?auto_152253 ) ) ( not ( = ?auto_152246 ?auto_152254 ) ) ( not ( = ?auto_152246 ?auto_152255 ) ) ( not ( = ?auto_152247 ?auto_152248 ) ) ( not ( = ?auto_152247 ?auto_152249 ) ) ( not ( = ?auto_152247 ?auto_152250 ) ) ( not ( = ?auto_152247 ?auto_152251 ) ) ( not ( = ?auto_152247 ?auto_152252 ) ) ( not ( = ?auto_152247 ?auto_152253 ) ) ( not ( = ?auto_152247 ?auto_152254 ) ) ( not ( = ?auto_152247 ?auto_152255 ) ) ( not ( = ?auto_152248 ?auto_152249 ) ) ( not ( = ?auto_152248 ?auto_152250 ) ) ( not ( = ?auto_152248 ?auto_152251 ) ) ( not ( = ?auto_152248 ?auto_152252 ) ) ( not ( = ?auto_152248 ?auto_152253 ) ) ( not ( = ?auto_152248 ?auto_152254 ) ) ( not ( = ?auto_152248 ?auto_152255 ) ) ( not ( = ?auto_152249 ?auto_152250 ) ) ( not ( = ?auto_152249 ?auto_152251 ) ) ( not ( = ?auto_152249 ?auto_152252 ) ) ( not ( = ?auto_152249 ?auto_152253 ) ) ( not ( = ?auto_152249 ?auto_152254 ) ) ( not ( = ?auto_152249 ?auto_152255 ) ) ( not ( = ?auto_152250 ?auto_152251 ) ) ( not ( = ?auto_152250 ?auto_152252 ) ) ( not ( = ?auto_152250 ?auto_152253 ) ) ( not ( = ?auto_152250 ?auto_152254 ) ) ( not ( = ?auto_152250 ?auto_152255 ) ) ( not ( = ?auto_152251 ?auto_152252 ) ) ( not ( = ?auto_152251 ?auto_152253 ) ) ( not ( = ?auto_152251 ?auto_152254 ) ) ( not ( = ?auto_152251 ?auto_152255 ) ) ( not ( = ?auto_152252 ?auto_152253 ) ) ( not ( = ?auto_152252 ?auto_152254 ) ) ( not ( = ?auto_152252 ?auto_152255 ) ) ( not ( = ?auto_152253 ?auto_152254 ) ) ( not ( = ?auto_152253 ?auto_152255 ) ) ( not ( = ?auto_152254 ?auto_152255 ) ) ( ON ?auto_152253 ?auto_152254 ) ( ON ?auto_152252 ?auto_152253 ) ( ON ?auto_152251 ?auto_152252 ) ( ON ?auto_152250 ?auto_152251 ) ( ON ?auto_152249 ?auto_152250 ) ( ON ?auto_152248 ?auto_152249 ) ( ON ?auto_152247 ?auto_152248 ) ( ON ?auto_152246 ?auto_152247 ) ( ON ?auto_152245 ?auto_152246 ) ( ON ?auto_152244 ?auto_152245 ) ( CLEAR ?auto_152244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_152244 )
      ( MAKE-11PILE ?auto_152244 ?auto_152245 ?auto_152246 ?auto_152247 ?auto_152248 ?auto_152249 ?auto_152250 ?auto_152251 ?auto_152252 ?auto_152253 ?auto_152254 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_152268 - BLOCK
      ?auto_152269 - BLOCK
      ?auto_152270 - BLOCK
      ?auto_152271 - BLOCK
      ?auto_152272 - BLOCK
      ?auto_152273 - BLOCK
      ?auto_152274 - BLOCK
      ?auto_152275 - BLOCK
      ?auto_152276 - BLOCK
      ?auto_152277 - BLOCK
      ?auto_152278 - BLOCK
      ?auto_152279 - BLOCK
    )
    :vars
    (
      ?auto_152280 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_152278 ) ( ON ?auto_152279 ?auto_152280 ) ( CLEAR ?auto_152279 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_152268 ) ( ON ?auto_152269 ?auto_152268 ) ( ON ?auto_152270 ?auto_152269 ) ( ON ?auto_152271 ?auto_152270 ) ( ON ?auto_152272 ?auto_152271 ) ( ON ?auto_152273 ?auto_152272 ) ( ON ?auto_152274 ?auto_152273 ) ( ON ?auto_152275 ?auto_152274 ) ( ON ?auto_152276 ?auto_152275 ) ( ON ?auto_152277 ?auto_152276 ) ( ON ?auto_152278 ?auto_152277 ) ( not ( = ?auto_152268 ?auto_152269 ) ) ( not ( = ?auto_152268 ?auto_152270 ) ) ( not ( = ?auto_152268 ?auto_152271 ) ) ( not ( = ?auto_152268 ?auto_152272 ) ) ( not ( = ?auto_152268 ?auto_152273 ) ) ( not ( = ?auto_152268 ?auto_152274 ) ) ( not ( = ?auto_152268 ?auto_152275 ) ) ( not ( = ?auto_152268 ?auto_152276 ) ) ( not ( = ?auto_152268 ?auto_152277 ) ) ( not ( = ?auto_152268 ?auto_152278 ) ) ( not ( = ?auto_152268 ?auto_152279 ) ) ( not ( = ?auto_152268 ?auto_152280 ) ) ( not ( = ?auto_152269 ?auto_152270 ) ) ( not ( = ?auto_152269 ?auto_152271 ) ) ( not ( = ?auto_152269 ?auto_152272 ) ) ( not ( = ?auto_152269 ?auto_152273 ) ) ( not ( = ?auto_152269 ?auto_152274 ) ) ( not ( = ?auto_152269 ?auto_152275 ) ) ( not ( = ?auto_152269 ?auto_152276 ) ) ( not ( = ?auto_152269 ?auto_152277 ) ) ( not ( = ?auto_152269 ?auto_152278 ) ) ( not ( = ?auto_152269 ?auto_152279 ) ) ( not ( = ?auto_152269 ?auto_152280 ) ) ( not ( = ?auto_152270 ?auto_152271 ) ) ( not ( = ?auto_152270 ?auto_152272 ) ) ( not ( = ?auto_152270 ?auto_152273 ) ) ( not ( = ?auto_152270 ?auto_152274 ) ) ( not ( = ?auto_152270 ?auto_152275 ) ) ( not ( = ?auto_152270 ?auto_152276 ) ) ( not ( = ?auto_152270 ?auto_152277 ) ) ( not ( = ?auto_152270 ?auto_152278 ) ) ( not ( = ?auto_152270 ?auto_152279 ) ) ( not ( = ?auto_152270 ?auto_152280 ) ) ( not ( = ?auto_152271 ?auto_152272 ) ) ( not ( = ?auto_152271 ?auto_152273 ) ) ( not ( = ?auto_152271 ?auto_152274 ) ) ( not ( = ?auto_152271 ?auto_152275 ) ) ( not ( = ?auto_152271 ?auto_152276 ) ) ( not ( = ?auto_152271 ?auto_152277 ) ) ( not ( = ?auto_152271 ?auto_152278 ) ) ( not ( = ?auto_152271 ?auto_152279 ) ) ( not ( = ?auto_152271 ?auto_152280 ) ) ( not ( = ?auto_152272 ?auto_152273 ) ) ( not ( = ?auto_152272 ?auto_152274 ) ) ( not ( = ?auto_152272 ?auto_152275 ) ) ( not ( = ?auto_152272 ?auto_152276 ) ) ( not ( = ?auto_152272 ?auto_152277 ) ) ( not ( = ?auto_152272 ?auto_152278 ) ) ( not ( = ?auto_152272 ?auto_152279 ) ) ( not ( = ?auto_152272 ?auto_152280 ) ) ( not ( = ?auto_152273 ?auto_152274 ) ) ( not ( = ?auto_152273 ?auto_152275 ) ) ( not ( = ?auto_152273 ?auto_152276 ) ) ( not ( = ?auto_152273 ?auto_152277 ) ) ( not ( = ?auto_152273 ?auto_152278 ) ) ( not ( = ?auto_152273 ?auto_152279 ) ) ( not ( = ?auto_152273 ?auto_152280 ) ) ( not ( = ?auto_152274 ?auto_152275 ) ) ( not ( = ?auto_152274 ?auto_152276 ) ) ( not ( = ?auto_152274 ?auto_152277 ) ) ( not ( = ?auto_152274 ?auto_152278 ) ) ( not ( = ?auto_152274 ?auto_152279 ) ) ( not ( = ?auto_152274 ?auto_152280 ) ) ( not ( = ?auto_152275 ?auto_152276 ) ) ( not ( = ?auto_152275 ?auto_152277 ) ) ( not ( = ?auto_152275 ?auto_152278 ) ) ( not ( = ?auto_152275 ?auto_152279 ) ) ( not ( = ?auto_152275 ?auto_152280 ) ) ( not ( = ?auto_152276 ?auto_152277 ) ) ( not ( = ?auto_152276 ?auto_152278 ) ) ( not ( = ?auto_152276 ?auto_152279 ) ) ( not ( = ?auto_152276 ?auto_152280 ) ) ( not ( = ?auto_152277 ?auto_152278 ) ) ( not ( = ?auto_152277 ?auto_152279 ) ) ( not ( = ?auto_152277 ?auto_152280 ) ) ( not ( = ?auto_152278 ?auto_152279 ) ) ( not ( = ?auto_152278 ?auto_152280 ) ) ( not ( = ?auto_152279 ?auto_152280 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_152279 ?auto_152280 )
      ( !STACK ?auto_152279 ?auto_152278 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_152293 - BLOCK
      ?auto_152294 - BLOCK
      ?auto_152295 - BLOCK
      ?auto_152296 - BLOCK
      ?auto_152297 - BLOCK
      ?auto_152298 - BLOCK
      ?auto_152299 - BLOCK
      ?auto_152300 - BLOCK
      ?auto_152301 - BLOCK
      ?auto_152302 - BLOCK
      ?auto_152303 - BLOCK
      ?auto_152304 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_152303 ) ( ON-TABLE ?auto_152304 ) ( CLEAR ?auto_152304 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_152293 ) ( ON ?auto_152294 ?auto_152293 ) ( ON ?auto_152295 ?auto_152294 ) ( ON ?auto_152296 ?auto_152295 ) ( ON ?auto_152297 ?auto_152296 ) ( ON ?auto_152298 ?auto_152297 ) ( ON ?auto_152299 ?auto_152298 ) ( ON ?auto_152300 ?auto_152299 ) ( ON ?auto_152301 ?auto_152300 ) ( ON ?auto_152302 ?auto_152301 ) ( ON ?auto_152303 ?auto_152302 ) ( not ( = ?auto_152293 ?auto_152294 ) ) ( not ( = ?auto_152293 ?auto_152295 ) ) ( not ( = ?auto_152293 ?auto_152296 ) ) ( not ( = ?auto_152293 ?auto_152297 ) ) ( not ( = ?auto_152293 ?auto_152298 ) ) ( not ( = ?auto_152293 ?auto_152299 ) ) ( not ( = ?auto_152293 ?auto_152300 ) ) ( not ( = ?auto_152293 ?auto_152301 ) ) ( not ( = ?auto_152293 ?auto_152302 ) ) ( not ( = ?auto_152293 ?auto_152303 ) ) ( not ( = ?auto_152293 ?auto_152304 ) ) ( not ( = ?auto_152294 ?auto_152295 ) ) ( not ( = ?auto_152294 ?auto_152296 ) ) ( not ( = ?auto_152294 ?auto_152297 ) ) ( not ( = ?auto_152294 ?auto_152298 ) ) ( not ( = ?auto_152294 ?auto_152299 ) ) ( not ( = ?auto_152294 ?auto_152300 ) ) ( not ( = ?auto_152294 ?auto_152301 ) ) ( not ( = ?auto_152294 ?auto_152302 ) ) ( not ( = ?auto_152294 ?auto_152303 ) ) ( not ( = ?auto_152294 ?auto_152304 ) ) ( not ( = ?auto_152295 ?auto_152296 ) ) ( not ( = ?auto_152295 ?auto_152297 ) ) ( not ( = ?auto_152295 ?auto_152298 ) ) ( not ( = ?auto_152295 ?auto_152299 ) ) ( not ( = ?auto_152295 ?auto_152300 ) ) ( not ( = ?auto_152295 ?auto_152301 ) ) ( not ( = ?auto_152295 ?auto_152302 ) ) ( not ( = ?auto_152295 ?auto_152303 ) ) ( not ( = ?auto_152295 ?auto_152304 ) ) ( not ( = ?auto_152296 ?auto_152297 ) ) ( not ( = ?auto_152296 ?auto_152298 ) ) ( not ( = ?auto_152296 ?auto_152299 ) ) ( not ( = ?auto_152296 ?auto_152300 ) ) ( not ( = ?auto_152296 ?auto_152301 ) ) ( not ( = ?auto_152296 ?auto_152302 ) ) ( not ( = ?auto_152296 ?auto_152303 ) ) ( not ( = ?auto_152296 ?auto_152304 ) ) ( not ( = ?auto_152297 ?auto_152298 ) ) ( not ( = ?auto_152297 ?auto_152299 ) ) ( not ( = ?auto_152297 ?auto_152300 ) ) ( not ( = ?auto_152297 ?auto_152301 ) ) ( not ( = ?auto_152297 ?auto_152302 ) ) ( not ( = ?auto_152297 ?auto_152303 ) ) ( not ( = ?auto_152297 ?auto_152304 ) ) ( not ( = ?auto_152298 ?auto_152299 ) ) ( not ( = ?auto_152298 ?auto_152300 ) ) ( not ( = ?auto_152298 ?auto_152301 ) ) ( not ( = ?auto_152298 ?auto_152302 ) ) ( not ( = ?auto_152298 ?auto_152303 ) ) ( not ( = ?auto_152298 ?auto_152304 ) ) ( not ( = ?auto_152299 ?auto_152300 ) ) ( not ( = ?auto_152299 ?auto_152301 ) ) ( not ( = ?auto_152299 ?auto_152302 ) ) ( not ( = ?auto_152299 ?auto_152303 ) ) ( not ( = ?auto_152299 ?auto_152304 ) ) ( not ( = ?auto_152300 ?auto_152301 ) ) ( not ( = ?auto_152300 ?auto_152302 ) ) ( not ( = ?auto_152300 ?auto_152303 ) ) ( not ( = ?auto_152300 ?auto_152304 ) ) ( not ( = ?auto_152301 ?auto_152302 ) ) ( not ( = ?auto_152301 ?auto_152303 ) ) ( not ( = ?auto_152301 ?auto_152304 ) ) ( not ( = ?auto_152302 ?auto_152303 ) ) ( not ( = ?auto_152302 ?auto_152304 ) ) ( not ( = ?auto_152303 ?auto_152304 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_152304 )
      ( !STACK ?auto_152304 ?auto_152303 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_152317 - BLOCK
      ?auto_152318 - BLOCK
      ?auto_152319 - BLOCK
      ?auto_152320 - BLOCK
      ?auto_152321 - BLOCK
      ?auto_152322 - BLOCK
      ?auto_152323 - BLOCK
      ?auto_152324 - BLOCK
      ?auto_152325 - BLOCK
      ?auto_152326 - BLOCK
      ?auto_152327 - BLOCK
      ?auto_152328 - BLOCK
    )
    :vars
    (
      ?auto_152329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152328 ?auto_152329 ) ( ON-TABLE ?auto_152317 ) ( ON ?auto_152318 ?auto_152317 ) ( ON ?auto_152319 ?auto_152318 ) ( ON ?auto_152320 ?auto_152319 ) ( ON ?auto_152321 ?auto_152320 ) ( ON ?auto_152322 ?auto_152321 ) ( ON ?auto_152323 ?auto_152322 ) ( ON ?auto_152324 ?auto_152323 ) ( ON ?auto_152325 ?auto_152324 ) ( ON ?auto_152326 ?auto_152325 ) ( not ( = ?auto_152317 ?auto_152318 ) ) ( not ( = ?auto_152317 ?auto_152319 ) ) ( not ( = ?auto_152317 ?auto_152320 ) ) ( not ( = ?auto_152317 ?auto_152321 ) ) ( not ( = ?auto_152317 ?auto_152322 ) ) ( not ( = ?auto_152317 ?auto_152323 ) ) ( not ( = ?auto_152317 ?auto_152324 ) ) ( not ( = ?auto_152317 ?auto_152325 ) ) ( not ( = ?auto_152317 ?auto_152326 ) ) ( not ( = ?auto_152317 ?auto_152327 ) ) ( not ( = ?auto_152317 ?auto_152328 ) ) ( not ( = ?auto_152317 ?auto_152329 ) ) ( not ( = ?auto_152318 ?auto_152319 ) ) ( not ( = ?auto_152318 ?auto_152320 ) ) ( not ( = ?auto_152318 ?auto_152321 ) ) ( not ( = ?auto_152318 ?auto_152322 ) ) ( not ( = ?auto_152318 ?auto_152323 ) ) ( not ( = ?auto_152318 ?auto_152324 ) ) ( not ( = ?auto_152318 ?auto_152325 ) ) ( not ( = ?auto_152318 ?auto_152326 ) ) ( not ( = ?auto_152318 ?auto_152327 ) ) ( not ( = ?auto_152318 ?auto_152328 ) ) ( not ( = ?auto_152318 ?auto_152329 ) ) ( not ( = ?auto_152319 ?auto_152320 ) ) ( not ( = ?auto_152319 ?auto_152321 ) ) ( not ( = ?auto_152319 ?auto_152322 ) ) ( not ( = ?auto_152319 ?auto_152323 ) ) ( not ( = ?auto_152319 ?auto_152324 ) ) ( not ( = ?auto_152319 ?auto_152325 ) ) ( not ( = ?auto_152319 ?auto_152326 ) ) ( not ( = ?auto_152319 ?auto_152327 ) ) ( not ( = ?auto_152319 ?auto_152328 ) ) ( not ( = ?auto_152319 ?auto_152329 ) ) ( not ( = ?auto_152320 ?auto_152321 ) ) ( not ( = ?auto_152320 ?auto_152322 ) ) ( not ( = ?auto_152320 ?auto_152323 ) ) ( not ( = ?auto_152320 ?auto_152324 ) ) ( not ( = ?auto_152320 ?auto_152325 ) ) ( not ( = ?auto_152320 ?auto_152326 ) ) ( not ( = ?auto_152320 ?auto_152327 ) ) ( not ( = ?auto_152320 ?auto_152328 ) ) ( not ( = ?auto_152320 ?auto_152329 ) ) ( not ( = ?auto_152321 ?auto_152322 ) ) ( not ( = ?auto_152321 ?auto_152323 ) ) ( not ( = ?auto_152321 ?auto_152324 ) ) ( not ( = ?auto_152321 ?auto_152325 ) ) ( not ( = ?auto_152321 ?auto_152326 ) ) ( not ( = ?auto_152321 ?auto_152327 ) ) ( not ( = ?auto_152321 ?auto_152328 ) ) ( not ( = ?auto_152321 ?auto_152329 ) ) ( not ( = ?auto_152322 ?auto_152323 ) ) ( not ( = ?auto_152322 ?auto_152324 ) ) ( not ( = ?auto_152322 ?auto_152325 ) ) ( not ( = ?auto_152322 ?auto_152326 ) ) ( not ( = ?auto_152322 ?auto_152327 ) ) ( not ( = ?auto_152322 ?auto_152328 ) ) ( not ( = ?auto_152322 ?auto_152329 ) ) ( not ( = ?auto_152323 ?auto_152324 ) ) ( not ( = ?auto_152323 ?auto_152325 ) ) ( not ( = ?auto_152323 ?auto_152326 ) ) ( not ( = ?auto_152323 ?auto_152327 ) ) ( not ( = ?auto_152323 ?auto_152328 ) ) ( not ( = ?auto_152323 ?auto_152329 ) ) ( not ( = ?auto_152324 ?auto_152325 ) ) ( not ( = ?auto_152324 ?auto_152326 ) ) ( not ( = ?auto_152324 ?auto_152327 ) ) ( not ( = ?auto_152324 ?auto_152328 ) ) ( not ( = ?auto_152324 ?auto_152329 ) ) ( not ( = ?auto_152325 ?auto_152326 ) ) ( not ( = ?auto_152325 ?auto_152327 ) ) ( not ( = ?auto_152325 ?auto_152328 ) ) ( not ( = ?auto_152325 ?auto_152329 ) ) ( not ( = ?auto_152326 ?auto_152327 ) ) ( not ( = ?auto_152326 ?auto_152328 ) ) ( not ( = ?auto_152326 ?auto_152329 ) ) ( not ( = ?auto_152327 ?auto_152328 ) ) ( not ( = ?auto_152327 ?auto_152329 ) ) ( not ( = ?auto_152328 ?auto_152329 ) ) ( CLEAR ?auto_152326 ) ( ON ?auto_152327 ?auto_152328 ) ( CLEAR ?auto_152327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_152317 ?auto_152318 ?auto_152319 ?auto_152320 ?auto_152321 ?auto_152322 ?auto_152323 ?auto_152324 ?auto_152325 ?auto_152326 ?auto_152327 )
      ( MAKE-12PILE ?auto_152317 ?auto_152318 ?auto_152319 ?auto_152320 ?auto_152321 ?auto_152322 ?auto_152323 ?auto_152324 ?auto_152325 ?auto_152326 ?auto_152327 ?auto_152328 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_152342 - BLOCK
      ?auto_152343 - BLOCK
      ?auto_152344 - BLOCK
      ?auto_152345 - BLOCK
      ?auto_152346 - BLOCK
      ?auto_152347 - BLOCK
      ?auto_152348 - BLOCK
      ?auto_152349 - BLOCK
      ?auto_152350 - BLOCK
      ?auto_152351 - BLOCK
      ?auto_152352 - BLOCK
      ?auto_152353 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152353 ) ( ON-TABLE ?auto_152342 ) ( ON ?auto_152343 ?auto_152342 ) ( ON ?auto_152344 ?auto_152343 ) ( ON ?auto_152345 ?auto_152344 ) ( ON ?auto_152346 ?auto_152345 ) ( ON ?auto_152347 ?auto_152346 ) ( ON ?auto_152348 ?auto_152347 ) ( ON ?auto_152349 ?auto_152348 ) ( ON ?auto_152350 ?auto_152349 ) ( ON ?auto_152351 ?auto_152350 ) ( not ( = ?auto_152342 ?auto_152343 ) ) ( not ( = ?auto_152342 ?auto_152344 ) ) ( not ( = ?auto_152342 ?auto_152345 ) ) ( not ( = ?auto_152342 ?auto_152346 ) ) ( not ( = ?auto_152342 ?auto_152347 ) ) ( not ( = ?auto_152342 ?auto_152348 ) ) ( not ( = ?auto_152342 ?auto_152349 ) ) ( not ( = ?auto_152342 ?auto_152350 ) ) ( not ( = ?auto_152342 ?auto_152351 ) ) ( not ( = ?auto_152342 ?auto_152352 ) ) ( not ( = ?auto_152342 ?auto_152353 ) ) ( not ( = ?auto_152343 ?auto_152344 ) ) ( not ( = ?auto_152343 ?auto_152345 ) ) ( not ( = ?auto_152343 ?auto_152346 ) ) ( not ( = ?auto_152343 ?auto_152347 ) ) ( not ( = ?auto_152343 ?auto_152348 ) ) ( not ( = ?auto_152343 ?auto_152349 ) ) ( not ( = ?auto_152343 ?auto_152350 ) ) ( not ( = ?auto_152343 ?auto_152351 ) ) ( not ( = ?auto_152343 ?auto_152352 ) ) ( not ( = ?auto_152343 ?auto_152353 ) ) ( not ( = ?auto_152344 ?auto_152345 ) ) ( not ( = ?auto_152344 ?auto_152346 ) ) ( not ( = ?auto_152344 ?auto_152347 ) ) ( not ( = ?auto_152344 ?auto_152348 ) ) ( not ( = ?auto_152344 ?auto_152349 ) ) ( not ( = ?auto_152344 ?auto_152350 ) ) ( not ( = ?auto_152344 ?auto_152351 ) ) ( not ( = ?auto_152344 ?auto_152352 ) ) ( not ( = ?auto_152344 ?auto_152353 ) ) ( not ( = ?auto_152345 ?auto_152346 ) ) ( not ( = ?auto_152345 ?auto_152347 ) ) ( not ( = ?auto_152345 ?auto_152348 ) ) ( not ( = ?auto_152345 ?auto_152349 ) ) ( not ( = ?auto_152345 ?auto_152350 ) ) ( not ( = ?auto_152345 ?auto_152351 ) ) ( not ( = ?auto_152345 ?auto_152352 ) ) ( not ( = ?auto_152345 ?auto_152353 ) ) ( not ( = ?auto_152346 ?auto_152347 ) ) ( not ( = ?auto_152346 ?auto_152348 ) ) ( not ( = ?auto_152346 ?auto_152349 ) ) ( not ( = ?auto_152346 ?auto_152350 ) ) ( not ( = ?auto_152346 ?auto_152351 ) ) ( not ( = ?auto_152346 ?auto_152352 ) ) ( not ( = ?auto_152346 ?auto_152353 ) ) ( not ( = ?auto_152347 ?auto_152348 ) ) ( not ( = ?auto_152347 ?auto_152349 ) ) ( not ( = ?auto_152347 ?auto_152350 ) ) ( not ( = ?auto_152347 ?auto_152351 ) ) ( not ( = ?auto_152347 ?auto_152352 ) ) ( not ( = ?auto_152347 ?auto_152353 ) ) ( not ( = ?auto_152348 ?auto_152349 ) ) ( not ( = ?auto_152348 ?auto_152350 ) ) ( not ( = ?auto_152348 ?auto_152351 ) ) ( not ( = ?auto_152348 ?auto_152352 ) ) ( not ( = ?auto_152348 ?auto_152353 ) ) ( not ( = ?auto_152349 ?auto_152350 ) ) ( not ( = ?auto_152349 ?auto_152351 ) ) ( not ( = ?auto_152349 ?auto_152352 ) ) ( not ( = ?auto_152349 ?auto_152353 ) ) ( not ( = ?auto_152350 ?auto_152351 ) ) ( not ( = ?auto_152350 ?auto_152352 ) ) ( not ( = ?auto_152350 ?auto_152353 ) ) ( not ( = ?auto_152351 ?auto_152352 ) ) ( not ( = ?auto_152351 ?auto_152353 ) ) ( not ( = ?auto_152352 ?auto_152353 ) ) ( CLEAR ?auto_152351 ) ( ON ?auto_152352 ?auto_152353 ) ( CLEAR ?auto_152352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_152342 ?auto_152343 ?auto_152344 ?auto_152345 ?auto_152346 ?auto_152347 ?auto_152348 ?auto_152349 ?auto_152350 ?auto_152351 ?auto_152352 )
      ( MAKE-12PILE ?auto_152342 ?auto_152343 ?auto_152344 ?auto_152345 ?auto_152346 ?auto_152347 ?auto_152348 ?auto_152349 ?auto_152350 ?auto_152351 ?auto_152352 ?auto_152353 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_152366 - BLOCK
      ?auto_152367 - BLOCK
      ?auto_152368 - BLOCK
      ?auto_152369 - BLOCK
      ?auto_152370 - BLOCK
      ?auto_152371 - BLOCK
      ?auto_152372 - BLOCK
      ?auto_152373 - BLOCK
      ?auto_152374 - BLOCK
      ?auto_152375 - BLOCK
      ?auto_152376 - BLOCK
      ?auto_152377 - BLOCK
    )
    :vars
    (
      ?auto_152378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152377 ?auto_152378 ) ( ON-TABLE ?auto_152366 ) ( ON ?auto_152367 ?auto_152366 ) ( ON ?auto_152368 ?auto_152367 ) ( ON ?auto_152369 ?auto_152368 ) ( ON ?auto_152370 ?auto_152369 ) ( ON ?auto_152371 ?auto_152370 ) ( ON ?auto_152372 ?auto_152371 ) ( ON ?auto_152373 ?auto_152372 ) ( ON ?auto_152374 ?auto_152373 ) ( not ( = ?auto_152366 ?auto_152367 ) ) ( not ( = ?auto_152366 ?auto_152368 ) ) ( not ( = ?auto_152366 ?auto_152369 ) ) ( not ( = ?auto_152366 ?auto_152370 ) ) ( not ( = ?auto_152366 ?auto_152371 ) ) ( not ( = ?auto_152366 ?auto_152372 ) ) ( not ( = ?auto_152366 ?auto_152373 ) ) ( not ( = ?auto_152366 ?auto_152374 ) ) ( not ( = ?auto_152366 ?auto_152375 ) ) ( not ( = ?auto_152366 ?auto_152376 ) ) ( not ( = ?auto_152366 ?auto_152377 ) ) ( not ( = ?auto_152366 ?auto_152378 ) ) ( not ( = ?auto_152367 ?auto_152368 ) ) ( not ( = ?auto_152367 ?auto_152369 ) ) ( not ( = ?auto_152367 ?auto_152370 ) ) ( not ( = ?auto_152367 ?auto_152371 ) ) ( not ( = ?auto_152367 ?auto_152372 ) ) ( not ( = ?auto_152367 ?auto_152373 ) ) ( not ( = ?auto_152367 ?auto_152374 ) ) ( not ( = ?auto_152367 ?auto_152375 ) ) ( not ( = ?auto_152367 ?auto_152376 ) ) ( not ( = ?auto_152367 ?auto_152377 ) ) ( not ( = ?auto_152367 ?auto_152378 ) ) ( not ( = ?auto_152368 ?auto_152369 ) ) ( not ( = ?auto_152368 ?auto_152370 ) ) ( not ( = ?auto_152368 ?auto_152371 ) ) ( not ( = ?auto_152368 ?auto_152372 ) ) ( not ( = ?auto_152368 ?auto_152373 ) ) ( not ( = ?auto_152368 ?auto_152374 ) ) ( not ( = ?auto_152368 ?auto_152375 ) ) ( not ( = ?auto_152368 ?auto_152376 ) ) ( not ( = ?auto_152368 ?auto_152377 ) ) ( not ( = ?auto_152368 ?auto_152378 ) ) ( not ( = ?auto_152369 ?auto_152370 ) ) ( not ( = ?auto_152369 ?auto_152371 ) ) ( not ( = ?auto_152369 ?auto_152372 ) ) ( not ( = ?auto_152369 ?auto_152373 ) ) ( not ( = ?auto_152369 ?auto_152374 ) ) ( not ( = ?auto_152369 ?auto_152375 ) ) ( not ( = ?auto_152369 ?auto_152376 ) ) ( not ( = ?auto_152369 ?auto_152377 ) ) ( not ( = ?auto_152369 ?auto_152378 ) ) ( not ( = ?auto_152370 ?auto_152371 ) ) ( not ( = ?auto_152370 ?auto_152372 ) ) ( not ( = ?auto_152370 ?auto_152373 ) ) ( not ( = ?auto_152370 ?auto_152374 ) ) ( not ( = ?auto_152370 ?auto_152375 ) ) ( not ( = ?auto_152370 ?auto_152376 ) ) ( not ( = ?auto_152370 ?auto_152377 ) ) ( not ( = ?auto_152370 ?auto_152378 ) ) ( not ( = ?auto_152371 ?auto_152372 ) ) ( not ( = ?auto_152371 ?auto_152373 ) ) ( not ( = ?auto_152371 ?auto_152374 ) ) ( not ( = ?auto_152371 ?auto_152375 ) ) ( not ( = ?auto_152371 ?auto_152376 ) ) ( not ( = ?auto_152371 ?auto_152377 ) ) ( not ( = ?auto_152371 ?auto_152378 ) ) ( not ( = ?auto_152372 ?auto_152373 ) ) ( not ( = ?auto_152372 ?auto_152374 ) ) ( not ( = ?auto_152372 ?auto_152375 ) ) ( not ( = ?auto_152372 ?auto_152376 ) ) ( not ( = ?auto_152372 ?auto_152377 ) ) ( not ( = ?auto_152372 ?auto_152378 ) ) ( not ( = ?auto_152373 ?auto_152374 ) ) ( not ( = ?auto_152373 ?auto_152375 ) ) ( not ( = ?auto_152373 ?auto_152376 ) ) ( not ( = ?auto_152373 ?auto_152377 ) ) ( not ( = ?auto_152373 ?auto_152378 ) ) ( not ( = ?auto_152374 ?auto_152375 ) ) ( not ( = ?auto_152374 ?auto_152376 ) ) ( not ( = ?auto_152374 ?auto_152377 ) ) ( not ( = ?auto_152374 ?auto_152378 ) ) ( not ( = ?auto_152375 ?auto_152376 ) ) ( not ( = ?auto_152375 ?auto_152377 ) ) ( not ( = ?auto_152375 ?auto_152378 ) ) ( not ( = ?auto_152376 ?auto_152377 ) ) ( not ( = ?auto_152376 ?auto_152378 ) ) ( not ( = ?auto_152377 ?auto_152378 ) ) ( ON ?auto_152376 ?auto_152377 ) ( CLEAR ?auto_152374 ) ( ON ?auto_152375 ?auto_152376 ) ( CLEAR ?auto_152375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_152366 ?auto_152367 ?auto_152368 ?auto_152369 ?auto_152370 ?auto_152371 ?auto_152372 ?auto_152373 ?auto_152374 ?auto_152375 )
      ( MAKE-12PILE ?auto_152366 ?auto_152367 ?auto_152368 ?auto_152369 ?auto_152370 ?auto_152371 ?auto_152372 ?auto_152373 ?auto_152374 ?auto_152375 ?auto_152376 ?auto_152377 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_152391 - BLOCK
      ?auto_152392 - BLOCK
      ?auto_152393 - BLOCK
      ?auto_152394 - BLOCK
      ?auto_152395 - BLOCK
      ?auto_152396 - BLOCK
      ?auto_152397 - BLOCK
      ?auto_152398 - BLOCK
      ?auto_152399 - BLOCK
      ?auto_152400 - BLOCK
      ?auto_152401 - BLOCK
      ?auto_152402 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152402 ) ( ON-TABLE ?auto_152391 ) ( ON ?auto_152392 ?auto_152391 ) ( ON ?auto_152393 ?auto_152392 ) ( ON ?auto_152394 ?auto_152393 ) ( ON ?auto_152395 ?auto_152394 ) ( ON ?auto_152396 ?auto_152395 ) ( ON ?auto_152397 ?auto_152396 ) ( ON ?auto_152398 ?auto_152397 ) ( ON ?auto_152399 ?auto_152398 ) ( not ( = ?auto_152391 ?auto_152392 ) ) ( not ( = ?auto_152391 ?auto_152393 ) ) ( not ( = ?auto_152391 ?auto_152394 ) ) ( not ( = ?auto_152391 ?auto_152395 ) ) ( not ( = ?auto_152391 ?auto_152396 ) ) ( not ( = ?auto_152391 ?auto_152397 ) ) ( not ( = ?auto_152391 ?auto_152398 ) ) ( not ( = ?auto_152391 ?auto_152399 ) ) ( not ( = ?auto_152391 ?auto_152400 ) ) ( not ( = ?auto_152391 ?auto_152401 ) ) ( not ( = ?auto_152391 ?auto_152402 ) ) ( not ( = ?auto_152392 ?auto_152393 ) ) ( not ( = ?auto_152392 ?auto_152394 ) ) ( not ( = ?auto_152392 ?auto_152395 ) ) ( not ( = ?auto_152392 ?auto_152396 ) ) ( not ( = ?auto_152392 ?auto_152397 ) ) ( not ( = ?auto_152392 ?auto_152398 ) ) ( not ( = ?auto_152392 ?auto_152399 ) ) ( not ( = ?auto_152392 ?auto_152400 ) ) ( not ( = ?auto_152392 ?auto_152401 ) ) ( not ( = ?auto_152392 ?auto_152402 ) ) ( not ( = ?auto_152393 ?auto_152394 ) ) ( not ( = ?auto_152393 ?auto_152395 ) ) ( not ( = ?auto_152393 ?auto_152396 ) ) ( not ( = ?auto_152393 ?auto_152397 ) ) ( not ( = ?auto_152393 ?auto_152398 ) ) ( not ( = ?auto_152393 ?auto_152399 ) ) ( not ( = ?auto_152393 ?auto_152400 ) ) ( not ( = ?auto_152393 ?auto_152401 ) ) ( not ( = ?auto_152393 ?auto_152402 ) ) ( not ( = ?auto_152394 ?auto_152395 ) ) ( not ( = ?auto_152394 ?auto_152396 ) ) ( not ( = ?auto_152394 ?auto_152397 ) ) ( not ( = ?auto_152394 ?auto_152398 ) ) ( not ( = ?auto_152394 ?auto_152399 ) ) ( not ( = ?auto_152394 ?auto_152400 ) ) ( not ( = ?auto_152394 ?auto_152401 ) ) ( not ( = ?auto_152394 ?auto_152402 ) ) ( not ( = ?auto_152395 ?auto_152396 ) ) ( not ( = ?auto_152395 ?auto_152397 ) ) ( not ( = ?auto_152395 ?auto_152398 ) ) ( not ( = ?auto_152395 ?auto_152399 ) ) ( not ( = ?auto_152395 ?auto_152400 ) ) ( not ( = ?auto_152395 ?auto_152401 ) ) ( not ( = ?auto_152395 ?auto_152402 ) ) ( not ( = ?auto_152396 ?auto_152397 ) ) ( not ( = ?auto_152396 ?auto_152398 ) ) ( not ( = ?auto_152396 ?auto_152399 ) ) ( not ( = ?auto_152396 ?auto_152400 ) ) ( not ( = ?auto_152396 ?auto_152401 ) ) ( not ( = ?auto_152396 ?auto_152402 ) ) ( not ( = ?auto_152397 ?auto_152398 ) ) ( not ( = ?auto_152397 ?auto_152399 ) ) ( not ( = ?auto_152397 ?auto_152400 ) ) ( not ( = ?auto_152397 ?auto_152401 ) ) ( not ( = ?auto_152397 ?auto_152402 ) ) ( not ( = ?auto_152398 ?auto_152399 ) ) ( not ( = ?auto_152398 ?auto_152400 ) ) ( not ( = ?auto_152398 ?auto_152401 ) ) ( not ( = ?auto_152398 ?auto_152402 ) ) ( not ( = ?auto_152399 ?auto_152400 ) ) ( not ( = ?auto_152399 ?auto_152401 ) ) ( not ( = ?auto_152399 ?auto_152402 ) ) ( not ( = ?auto_152400 ?auto_152401 ) ) ( not ( = ?auto_152400 ?auto_152402 ) ) ( not ( = ?auto_152401 ?auto_152402 ) ) ( ON ?auto_152401 ?auto_152402 ) ( CLEAR ?auto_152399 ) ( ON ?auto_152400 ?auto_152401 ) ( CLEAR ?auto_152400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_152391 ?auto_152392 ?auto_152393 ?auto_152394 ?auto_152395 ?auto_152396 ?auto_152397 ?auto_152398 ?auto_152399 ?auto_152400 )
      ( MAKE-12PILE ?auto_152391 ?auto_152392 ?auto_152393 ?auto_152394 ?auto_152395 ?auto_152396 ?auto_152397 ?auto_152398 ?auto_152399 ?auto_152400 ?auto_152401 ?auto_152402 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_152415 - BLOCK
      ?auto_152416 - BLOCK
      ?auto_152417 - BLOCK
      ?auto_152418 - BLOCK
      ?auto_152419 - BLOCK
      ?auto_152420 - BLOCK
      ?auto_152421 - BLOCK
      ?auto_152422 - BLOCK
      ?auto_152423 - BLOCK
      ?auto_152424 - BLOCK
      ?auto_152425 - BLOCK
      ?auto_152426 - BLOCK
    )
    :vars
    (
      ?auto_152427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152426 ?auto_152427 ) ( ON-TABLE ?auto_152415 ) ( ON ?auto_152416 ?auto_152415 ) ( ON ?auto_152417 ?auto_152416 ) ( ON ?auto_152418 ?auto_152417 ) ( ON ?auto_152419 ?auto_152418 ) ( ON ?auto_152420 ?auto_152419 ) ( ON ?auto_152421 ?auto_152420 ) ( ON ?auto_152422 ?auto_152421 ) ( not ( = ?auto_152415 ?auto_152416 ) ) ( not ( = ?auto_152415 ?auto_152417 ) ) ( not ( = ?auto_152415 ?auto_152418 ) ) ( not ( = ?auto_152415 ?auto_152419 ) ) ( not ( = ?auto_152415 ?auto_152420 ) ) ( not ( = ?auto_152415 ?auto_152421 ) ) ( not ( = ?auto_152415 ?auto_152422 ) ) ( not ( = ?auto_152415 ?auto_152423 ) ) ( not ( = ?auto_152415 ?auto_152424 ) ) ( not ( = ?auto_152415 ?auto_152425 ) ) ( not ( = ?auto_152415 ?auto_152426 ) ) ( not ( = ?auto_152415 ?auto_152427 ) ) ( not ( = ?auto_152416 ?auto_152417 ) ) ( not ( = ?auto_152416 ?auto_152418 ) ) ( not ( = ?auto_152416 ?auto_152419 ) ) ( not ( = ?auto_152416 ?auto_152420 ) ) ( not ( = ?auto_152416 ?auto_152421 ) ) ( not ( = ?auto_152416 ?auto_152422 ) ) ( not ( = ?auto_152416 ?auto_152423 ) ) ( not ( = ?auto_152416 ?auto_152424 ) ) ( not ( = ?auto_152416 ?auto_152425 ) ) ( not ( = ?auto_152416 ?auto_152426 ) ) ( not ( = ?auto_152416 ?auto_152427 ) ) ( not ( = ?auto_152417 ?auto_152418 ) ) ( not ( = ?auto_152417 ?auto_152419 ) ) ( not ( = ?auto_152417 ?auto_152420 ) ) ( not ( = ?auto_152417 ?auto_152421 ) ) ( not ( = ?auto_152417 ?auto_152422 ) ) ( not ( = ?auto_152417 ?auto_152423 ) ) ( not ( = ?auto_152417 ?auto_152424 ) ) ( not ( = ?auto_152417 ?auto_152425 ) ) ( not ( = ?auto_152417 ?auto_152426 ) ) ( not ( = ?auto_152417 ?auto_152427 ) ) ( not ( = ?auto_152418 ?auto_152419 ) ) ( not ( = ?auto_152418 ?auto_152420 ) ) ( not ( = ?auto_152418 ?auto_152421 ) ) ( not ( = ?auto_152418 ?auto_152422 ) ) ( not ( = ?auto_152418 ?auto_152423 ) ) ( not ( = ?auto_152418 ?auto_152424 ) ) ( not ( = ?auto_152418 ?auto_152425 ) ) ( not ( = ?auto_152418 ?auto_152426 ) ) ( not ( = ?auto_152418 ?auto_152427 ) ) ( not ( = ?auto_152419 ?auto_152420 ) ) ( not ( = ?auto_152419 ?auto_152421 ) ) ( not ( = ?auto_152419 ?auto_152422 ) ) ( not ( = ?auto_152419 ?auto_152423 ) ) ( not ( = ?auto_152419 ?auto_152424 ) ) ( not ( = ?auto_152419 ?auto_152425 ) ) ( not ( = ?auto_152419 ?auto_152426 ) ) ( not ( = ?auto_152419 ?auto_152427 ) ) ( not ( = ?auto_152420 ?auto_152421 ) ) ( not ( = ?auto_152420 ?auto_152422 ) ) ( not ( = ?auto_152420 ?auto_152423 ) ) ( not ( = ?auto_152420 ?auto_152424 ) ) ( not ( = ?auto_152420 ?auto_152425 ) ) ( not ( = ?auto_152420 ?auto_152426 ) ) ( not ( = ?auto_152420 ?auto_152427 ) ) ( not ( = ?auto_152421 ?auto_152422 ) ) ( not ( = ?auto_152421 ?auto_152423 ) ) ( not ( = ?auto_152421 ?auto_152424 ) ) ( not ( = ?auto_152421 ?auto_152425 ) ) ( not ( = ?auto_152421 ?auto_152426 ) ) ( not ( = ?auto_152421 ?auto_152427 ) ) ( not ( = ?auto_152422 ?auto_152423 ) ) ( not ( = ?auto_152422 ?auto_152424 ) ) ( not ( = ?auto_152422 ?auto_152425 ) ) ( not ( = ?auto_152422 ?auto_152426 ) ) ( not ( = ?auto_152422 ?auto_152427 ) ) ( not ( = ?auto_152423 ?auto_152424 ) ) ( not ( = ?auto_152423 ?auto_152425 ) ) ( not ( = ?auto_152423 ?auto_152426 ) ) ( not ( = ?auto_152423 ?auto_152427 ) ) ( not ( = ?auto_152424 ?auto_152425 ) ) ( not ( = ?auto_152424 ?auto_152426 ) ) ( not ( = ?auto_152424 ?auto_152427 ) ) ( not ( = ?auto_152425 ?auto_152426 ) ) ( not ( = ?auto_152425 ?auto_152427 ) ) ( not ( = ?auto_152426 ?auto_152427 ) ) ( ON ?auto_152425 ?auto_152426 ) ( ON ?auto_152424 ?auto_152425 ) ( CLEAR ?auto_152422 ) ( ON ?auto_152423 ?auto_152424 ) ( CLEAR ?auto_152423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_152415 ?auto_152416 ?auto_152417 ?auto_152418 ?auto_152419 ?auto_152420 ?auto_152421 ?auto_152422 ?auto_152423 )
      ( MAKE-12PILE ?auto_152415 ?auto_152416 ?auto_152417 ?auto_152418 ?auto_152419 ?auto_152420 ?auto_152421 ?auto_152422 ?auto_152423 ?auto_152424 ?auto_152425 ?auto_152426 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_152440 - BLOCK
      ?auto_152441 - BLOCK
      ?auto_152442 - BLOCK
      ?auto_152443 - BLOCK
      ?auto_152444 - BLOCK
      ?auto_152445 - BLOCK
      ?auto_152446 - BLOCK
      ?auto_152447 - BLOCK
      ?auto_152448 - BLOCK
      ?auto_152449 - BLOCK
      ?auto_152450 - BLOCK
      ?auto_152451 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152451 ) ( ON-TABLE ?auto_152440 ) ( ON ?auto_152441 ?auto_152440 ) ( ON ?auto_152442 ?auto_152441 ) ( ON ?auto_152443 ?auto_152442 ) ( ON ?auto_152444 ?auto_152443 ) ( ON ?auto_152445 ?auto_152444 ) ( ON ?auto_152446 ?auto_152445 ) ( ON ?auto_152447 ?auto_152446 ) ( not ( = ?auto_152440 ?auto_152441 ) ) ( not ( = ?auto_152440 ?auto_152442 ) ) ( not ( = ?auto_152440 ?auto_152443 ) ) ( not ( = ?auto_152440 ?auto_152444 ) ) ( not ( = ?auto_152440 ?auto_152445 ) ) ( not ( = ?auto_152440 ?auto_152446 ) ) ( not ( = ?auto_152440 ?auto_152447 ) ) ( not ( = ?auto_152440 ?auto_152448 ) ) ( not ( = ?auto_152440 ?auto_152449 ) ) ( not ( = ?auto_152440 ?auto_152450 ) ) ( not ( = ?auto_152440 ?auto_152451 ) ) ( not ( = ?auto_152441 ?auto_152442 ) ) ( not ( = ?auto_152441 ?auto_152443 ) ) ( not ( = ?auto_152441 ?auto_152444 ) ) ( not ( = ?auto_152441 ?auto_152445 ) ) ( not ( = ?auto_152441 ?auto_152446 ) ) ( not ( = ?auto_152441 ?auto_152447 ) ) ( not ( = ?auto_152441 ?auto_152448 ) ) ( not ( = ?auto_152441 ?auto_152449 ) ) ( not ( = ?auto_152441 ?auto_152450 ) ) ( not ( = ?auto_152441 ?auto_152451 ) ) ( not ( = ?auto_152442 ?auto_152443 ) ) ( not ( = ?auto_152442 ?auto_152444 ) ) ( not ( = ?auto_152442 ?auto_152445 ) ) ( not ( = ?auto_152442 ?auto_152446 ) ) ( not ( = ?auto_152442 ?auto_152447 ) ) ( not ( = ?auto_152442 ?auto_152448 ) ) ( not ( = ?auto_152442 ?auto_152449 ) ) ( not ( = ?auto_152442 ?auto_152450 ) ) ( not ( = ?auto_152442 ?auto_152451 ) ) ( not ( = ?auto_152443 ?auto_152444 ) ) ( not ( = ?auto_152443 ?auto_152445 ) ) ( not ( = ?auto_152443 ?auto_152446 ) ) ( not ( = ?auto_152443 ?auto_152447 ) ) ( not ( = ?auto_152443 ?auto_152448 ) ) ( not ( = ?auto_152443 ?auto_152449 ) ) ( not ( = ?auto_152443 ?auto_152450 ) ) ( not ( = ?auto_152443 ?auto_152451 ) ) ( not ( = ?auto_152444 ?auto_152445 ) ) ( not ( = ?auto_152444 ?auto_152446 ) ) ( not ( = ?auto_152444 ?auto_152447 ) ) ( not ( = ?auto_152444 ?auto_152448 ) ) ( not ( = ?auto_152444 ?auto_152449 ) ) ( not ( = ?auto_152444 ?auto_152450 ) ) ( not ( = ?auto_152444 ?auto_152451 ) ) ( not ( = ?auto_152445 ?auto_152446 ) ) ( not ( = ?auto_152445 ?auto_152447 ) ) ( not ( = ?auto_152445 ?auto_152448 ) ) ( not ( = ?auto_152445 ?auto_152449 ) ) ( not ( = ?auto_152445 ?auto_152450 ) ) ( not ( = ?auto_152445 ?auto_152451 ) ) ( not ( = ?auto_152446 ?auto_152447 ) ) ( not ( = ?auto_152446 ?auto_152448 ) ) ( not ( = ?auto_152446 ?auto_152449 ) ) ( not ( = ?auto_152446 ?auto_152450 ) ) ( not ( = ?auto_152446 ?auto_152451 ) ) ( not ( = ?auto_152447 ?auto_152448 ) ) ( not ( = ?auto_152447 ?auto_152449 ) ) ( not ( = ?auto_152447 ?auto_152450 ) ) ( not ( = ?auto_152447 ?auto_152451 ) ) ( not ( = ?auto_152448 ?auto_152449 ) ) ( not ( = ?auto_152448 ?auto_152450 ) ) ( not ( = ?auto_152448 ?auto_152451 ) ) ( not ( = ?auto_152449 ?auto_152450 ) ) ( not ( = ?auto_152449 ?auto_152451 ) ) ( not ( = ?auto_152450 ?auto_152451 ) ) ( ON ?auto_152450 ?auto_152451 ) ( ON ?auto_152449 ?auto_152450 ) ( CLEAR ?auto_152447 ) ( ON ?auto_152448 ?auto_152449 ) ( CLEAR ?auto_152448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_152440 ?auto_152441 ?auto_152442 ?auto_152443 ?auto_152444 ?auto_152445 ?auto_152446 ?auto_152447 ?auto_152448 )
      ( MAKE-12PILE ?auto_152440 ?auto_152441 ?auto_152442 ?auto_152443 ?auto_152444 ?auto_152445 ?auto_152446 ?auto_152447 ?auto_152448 ?auto_152449 ?auto_152450 ?auto_152451 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_152464 - BLOCK
      ?auto_152465 - BLOCK
      ?auto_152466 - BLOCK
      ?auto_152467 - BLOCK
      ?auto_152468 - BLOCK
      ?auto_152469 - BLOCK
      ?auto_152470 - BLOCK
      ?auto_152471 - BLOCK
      ?auto_152472 - BLOCK
      ?auto_152473 - BLOCK
      ?auto_152474 - BLOCK
      ?auto_152475 - BLOCK
    )
    :vars
    (
      ?auto_152476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152475 ?auto_152476 ) ( ON-TABLE ?auto_152464 ) ( ON ?auto_152465 ?auto_152464 ) ( ON ?auto_152466 ?auto_152465 ) ( ON ?auto_152467 ?auto_152466 ) ( ON ?auto_152468 ?auto_152467 ) ( ON ?auto_152469 ?auto_152468 ) ( ON ?auto_152470 ?auto_152469 ) ( not ( = ?auto_152464 ?auto_152465 ) ) ( not ( = ?auto_152464 ?auto_152466 ) ) ( not ( = ?auto_152464 ?auto_152467 ) ) ( not ( = ?auto_152464 ?auto_152468 ) ) ( not ( = ?auto_152464 ?auto_152469 ) ) ( not ( = ?auto_152464 ?auto_152470 ) ) ( not ( = ?auto_152464 ?auto_152471 ) ) ( not ( = ?auto_152464 ?auto_152472 ) ) ( not ( = ?auto_152464 ?auto_152473 ) ) ( not ( = ?auto_152464 ?auto_152474 ) ) ( not ( = ?auto_152464 ?auto_152475 ) ) ( not ( = ?auto_152464 ?auto_152476 ) ) ( not ( = ?auto_152465 ?auto_152466 ) ) ( not ( = ?auto_152465 ?auto_152467 ) ) ( not ( = ?auto_152465 ?auto_152468 ) ) ( not ( = ?auto_152465 ?auto_152469 ) ) ( not ( = ?auto_152465 ?auto_152470 ) ) ( not ( = ?auto_152465 ?auto_152471 ) ) ( not ( = ?auto_152465 ?auto_152472 ) ) ( not ( = ?auto_152465 ?auto_152473 ) ) ( not ( = ?auto_152465 ?auto_152474 ) ) ( not ( = ?auto_152465 ?auto_152475 ) ) ( not ( = ?auto_152465 ?auto_152476 ) ) ( not ( = ?auto_152466 ?auto_152467 ) ) ( not ( = ?auto_152466 ?auto_152468 ) ) ( not ( = ?auto_152466 ?auto_152469 ) ) ( not ( = ?auto_152466 ?auto_152470 ) ) ( not ( = ?auto_152466 ?auto_152471 ) ) ( not ( = ?auto_152466 ?auto_152472 ) ) ( not ( = ?auto_152466 ?auto_152473 ) ) ( not ( = ?auto_152466 ?auto_152474 ) ) ( not ( = ?auto_152466 ?auto_152475 ) ) ( not ( = ?auto_152466 ?auto_152476 ) ) ( not ( = ?auto_152467 ?auto_152468 ) ) ( not ( = ?auto_152467 ?auto_152469 ) ) ( not ( = ?auto_152467 ?auto_152470 ) ) ( not ( = ?auto_152467 ?auto_152471 ) ) ( not ( = ?auto_152467 ?auto_152472 ) ) ( not ( = ?auto_152467 ?auto_152473 ) ) ( not ( = ?auto_152467 ?auto_152474 ) ) ( not ( = ?auto_152467 ?auto_152475 ) ) ( not ( = ?auto_152467 ?auto_152476 ) ) ( not ( = ?auto_152468 ?auto_152469 ) ) ( not ( = ?auto_152468 ?auto_152470 ) ) ( not ( = ?auto_152468 ?auto_152471 ) ) ( not ( = ?auto_152468 ?auto_152472 ) ) ( not ( = ?auto_152468 ?auto_152473 ) ) ( not ( = ?auto_152468 ?auto_152474 ) ) ( not ( = ?auto_152468 ?auto_152475 ) ) ( not ( = ?auto_152468 ?auto_152476 ) ) ( not ( = ?auto_152469 ?auto_152470 ) ) ( not ( = ?auto_152469 ?auto_152471 ) ) ( not ( = ?auto_152469 ?auto_152472 ) ) ( not ( = ?auto_152469 ?auto_152473 ) ) ( not ( = ?auto_152469 ?auto_152474 ) ) ( not ( = ?auto_152469 ?auto_152475 ) ) ( not ( = ?auto_152469 ?auto_152476 ) ) ( not ( = ?auto_152470 ?auto_152471 ) ) ( not ( = ?auto_152470 ?auto_152472 ) ) ( not ( = ?auto_152470 ?auto_152473 ) ) ( not ( = ?auto_152470 ?auto_152474 ) ) ( not ( = ?auto_152470 ?auto_152475 ) ) ( not ( = ?auto_152470 ?auto_152476 ) ) ( not ( = ?auto_152471 ?auto_152472 ) ) ( not ( = ?auto_152471 ?auto_152473 ) ) ( not ( = ?auto_152471 ?auto_152474 ) ) ( not ( = ?auto_152471 ?auto_152475 ) ) ( not ( = ?auto_152471 ?auto_152476 ) ) ( not ( = ?auto_152472 ?auto_152473 ) ) ( not ( = ?auto_152472 ?auto_152474 ) ) ( not ( = ?auto_152472 ?auto_152475 ) ) ( not ( = ?auto_152472 ?auto_152476 ) ) ( not ( = ?auto_152473 ?auto_152474 ) ) ( not ( = ?auto_152473 ?auto_152475 ) ) ( not ( = ?auto_152473 ?auto_152476 ) ) ( not ( = ?auto_152474 ?auto_152475 ) ) ( not ( = ?auto_152474 ?auto_152476 ) ) ( not ( = ?auto_152475 ?auto_152476 ) ) ( ON ?auto_152474 ?auto_152475 ) ( ON ?auto_152473 ?auto_152474 ) ( ON ?auto_152472 ?auto_152473 ) ( CLEAR ?auto_152470 ) ( ON ?auto_152471 ?auto_152472 ) ( CLEAR ?auto_152471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_152464 ?auto_152465 ?auto_152466 ?auto_152467 ?auto_152468 ?auto_152469 ?auto_152470 ?auto_152471 )
      ( MAKE-12PILE ?auto_152464 ?auto_152465 ?auto_152466 ?auto_152467 ?auto_152468 ?auto_152469 ?auto_152470 ?auto_152471 ?auto_152472 ?auto_152473 ?auto_152474 ?auto_152475 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_152489 - BLOCK
      ?auto_152490 - BLOCK
      ?auto_152491 - BLOCK
      ?auto_152492 - BLOCK
      ?auto_152493 - BLOCK
      ?auto_152494 - BLOCK
      ?auto_152495 - BLOCK
      ?auto_152496 - BLOCK
      ?auto_152497 - BLOCK
      ?auto_152498 - BLOCK
      ?auto_152499 - BLOCK
      ?auto_152500 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152500 ) ( ON-TABLE ?auto_152489 ) ( ON ?auto_152490 ?auto_152489 ) ( ON ?auto_152491 ?auto_152490 ) ( ON ?auto_152492 ?auto_152491 ) ( ON ?auto_152493 ?auto_152492 ) ( ON ?auto_152494 ?auto_152493 ) ( ON ?auto_152495 ?auto_152494 ) ( not ( = ?auto_152489 ?auto_152490 ) ) ( not ( = ?auto_152489 ?auto_152491 ) ) ( not ( = ?auto_152489 ?auto_152492 ) ) ( not ( = ?auto_152489 ?auto_152493 ) ) ( not ( = ?auto_152489 ?auto_152494 ) ) ( not ( = ?auto_152489 ?auto_152495 ) ) ( not ( = ?auto_152489 ?auto_152496 ) ) ( not ( = ?auto_152489 ?auto_152497 ) ) ( not ( = ?auto_152489 ?auto_152498 ) ) ( not ( = ?auto_152489 ?auto_152499 ) ) ( not ( = ?auto_152489 ?auto_152500 ) ) ( not ( = ?auto_152490 ?auto_152491 ) ) ( not ( = ?auto_152490 ?auto_152492 ) ) ( not ( = ?auto_152490 ?auto_152493 ) ) ( not ( = ?auto_152490 ?auto_152494 ) ) ( not ( = ?auto_152490 ?auto_152495 ) ) ( not ( = ?auto_152490 ?auto_152496 ) ) ( not ( = ?auto_152490 ?auto_152497 ) ) ( not ( = ?auto_152490 ?auto_152498 ) ) ( not ( = ?auto_152490 ?auto_152499 ) ) ( not ( = ?auto_152490 ?auto_152500 ) ) ( not ( = ?auto_152491 ?auto_152492 ) ) ( not ( = ?auto_152491 ?auto_152493 ) ) ( not ( = ?auto_152491 ?auto_152494 ) ) ( not ( = ?auto_152491 ?auto_152495 ) ) ( not ( = ?auto_152491 ?auto_152496 ) ) ( not ( = ?auto_152491 ?auto_152497 ) ) ( not ( = ?auto_152491 ?auto_152498 ) ) ( not ( = ?auto_152491 ?auto_152499 ) ) ( not ( = ?auto_152491 ?auto_152500 ) ) ( not ( = ?auto_152492 ?auto_152493 ) ) ( not ( = ?auto_152492 ?auto_152494 ) ) ( not ( = ?auto_152492 ?auto_152495 ) ) ( not ( = ?auto_152492 ?auto_152496 ) ) ( not ( = ?auto_152492 ?auto_152497 ) ) ( not ( = ?auto_152492 ?auto_152498 ) ) ( not ( = ?auto_152492 ?auto_152499 ) ) ( not ( = ?auto_152492 ?auto_152500 ) ) ( not ( = ?auto_152493 ?auto_152494 ) ) ( not ( = ?auto_152493 ?auto_152495 ) ) ( not ( = ?auto_152493 ?auto_152496 ) ) ( not ( = ?auto_152493 ?auto_152497 ) ) ( not ( = ?auto_152493 ?auto_152498 ) ) ( not ( = ?auto_152493 ?auto_152499 ) ) ( not ( = ?auto_152493 ?auto_152500 ) ) ( not ( = ?auto_152494 ?auto_152495 ) ) ( not ( = ?auto_152494 ?auto_152496 ) ) ( not ( = ?auto_152494 ?auto_152497 ) ) ( not ( = ?auto_152494 ?auto_152498 ) ) ( not ( = ?auto_152494 ?auto_152499 ) ) ( not ( = ?auto_152494 ?auto_152500 ) ) ( not ( = ?auto_152495 ?auto_152496 ) ) ( not ( = ?auto_152495 ?auto_152497 ) ) ( not ( = ?auto_152495 ?auto_152498 ) ) ( not ( = ?auto_152495 ?auto_152499 ) ) ( not ( = ?auto_152495 ?auto_152500 ) ) ( not ( = ?auto_152496 ?auto_152497 ) ) ( not ( = ?auto_152496 ?auto_152498 ) ) ( not ( = ?auto_152496 ?auto_152499 ) ) ( not ( = ?auto_152496 ?auto_152500 ) ) ( not ( = ?auto_152497 ?auto_152498 ) ) ( not ( = ?auto_152497 ?auto_152499 ) ) ( not ( = ?auto_152497 ?auto_152500 ) ) ( not ( = ?auto_152498 ?auto_152499 ) ) ( not ( = ?auto_152498 ?auto_152500 ) ) ( not ( = ?auto_152499 ?auto_152500 ) ) ( ON ?auto_152499 ?auto_152500 ) ( ON ?auto_152498 ?auto_152499 ) ( ON ?auto_152497 ?auto_152498 ) ( CLEAR ?auto_152495 ) ( ON ?auto_152496 ?auto_152497 ) ( CLEAR ?auto_152496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_152489 ?auto_152490 ?auto_152491 ?auto_152492 ?auto_152493 ?auto_152494 ?auto_152495 ?auto_152496 )
      ( MAKE-12PILE ?auto_152489 ?auto_152490 ?auto_152491 ?auto_152492 ?auto_152493 ?auto_152494 ?auto_152495 ?auto_152496 ?auto_152497 ?auto_152498 ?auto_152499 ?auto_152500 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_152513 - BLOCK
      ?auto_152514 - BLOCK
      ?auto_152515 - BLOCK
      ?auto_152516 - BLOCK
      ?auto_152517 - BLOCK
      ?auto_152518 - BLOCK
      ?auto_152519 - BLOCK
      ?auto_152520 - BLOCK
      ?auto_152521 - BLOCK
      ?auto_152522 - BLOCK
      ?auto_152523 - BLOCK
      ?auto_152524 - BLOCK
    )
    :vars
    (
      ?auto_152525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152524 ?auto_152525 ) ( ON-TABLE ?auto_152513 ) ( ON ?auto_152514 ?auto_152513 ) ( ON ?auto_152515 ?auto_152514 ) ( ON ?auto_152516 ?auto_152515 ) ( ON ?auto_152517 ?auto_152516 ) ( ON ?auto_152518 ?auto_152517 ) ( not ( = ?auto_152513 ?auto_152514 ) ) ( not ( = ?auto_152513 ?auto_152515 ) ) ( not ( = ?auto_152513 ?auto_152516 ) ) ( not ( = ?auto_152513 ?auto_152517 ) ) ( not ( = ?auto_152513 ?auto_152518 ) ) ( not ( = ?auto_152513 ?auto_152519 ) ) ( not ( = ?auto_152513 ?auto_152520 ) ) ( not ( = ?auto_152513 ?auto_152521 ) ) ( not ( = ?auto_152513 ?auto_152522 ) ) ( not ( = ?auto_152513 ?auto_152523 ) ) ( not ( = ?auto_152513 ?auto_152524 ) ) ( not ( = ?auto_152513 ?auto_152525 ) ) ( not ( = ?auto_152514 ?auto_152515 ) ) ( not ( = ?auto_152514 ?auto_152516 ) ) ( not ( = ?auto_152514 ?auto_152517 ) ) ( not ( = ?auto_152514 ?auto_152518 ) ) ( not ( = ?auto_152514 ?auto_152519 ) ) ( not ( = ?auto_152514 ?auto_152520 ) ) ( not ( = ?auto_152514 ?auto_152521 ) ) ( not ( = ?auto_152514 ?auto_152522 ) ) ( not ( = ?auto_152514 ?auto_152523 ) ) ( not ( = ?auto_152514 ?auto_152524 ) ) ( not ( = ?auto_152514 ?auto_152525 ) ) ( not ( = ?auto_152515 ?auto_152516 ) ) ( not ( = ?auto_152515 ?auto_152517 ) ) ( not ( = ?auto_152515 ?auto_152518 ) ) ( not ( = ?auto_152515 ?auto_152519 ) ) ( not ( = ?auto_152515 ?auto_152520 ) ) ( not ( = ?auto_152515 ?auto_152521 ) ) ( not ( = ?auto_152515 ?auto_152522 ) ) ( not ( = ?auto_152515 ?auto_152523 ) ) ( not ( = ?auto_152515 ?auto_152524 ) ) ( not ( = ?auto_152515 ?auto_152525 ) ) ( not ( = ?auto_152516 ?auto_152517 ) ) ( not ( = ?auto_152516 ?auto_152518 ) ) ( not ( = ?auto_152516 ?auto_152519 ) ) ( not ( = ?auto_152516 ?auto_152520 ) ) ( not ( = ?auto_152516 ?auto_152521 ) ) ( not ( = ?auto_152516 ?auto_152522 ) ) ( not ( = ?auto_152516 ?auto_152523 ) ) ( not ( = ?auto_152516 ?auto_152524 ) ) ( not ( = ?auto_152516 ?auto_152525 ) ) ( not ( = ?auto_152517 ?auto_152518 ) ) ( not ( = ?auto_152517 ?auto_152519 ) ) ( not ( = ?auto_152517 ?auto_152520 ) ) ( not ( = ?auto_152517 ?auto_152521 ) ) ( not ( = ?auto_152517 ?auto_152522 ) ) ( not ( = ?auto_152517 ?auto_152523 ) ) ( not ( = ?auto_152517 ?auto_152524 ) ) ( not ( = ?auto_152517 ?auto_152525 ) ) ( not ( = ?auto_152518 ?auto_152519 ) ) ( not ( = ?auto_152518 ?auto_152520 ) ) ( not ( = ?auto_152518 ?auto_152521 ) ) ( not ( = ?auto_152518 ?auto_152522 ) ) ( not ( = ?auto_152518 ?auto_152523 ) ) ( not ( = ?auto_152518 ?auto_152524 ) ) ( not ( = ?auto_152518 ?auto_152525 ) ) ( not ( = ?auto_152519 ?auto_152520 ) ) ( not ( = ?auto_152519 ?auto_152521 ) ) ( not ( = ?auto_152519 ?auto_152522 ) ) ( not ( = ?auto_152519 ?auto_152523 ) ) ( not ( = ?auto_152519 ?auto_152524 ) ) ( not ( = ?auto_152519 ?auto_152525 ) ) ( not ( = ?auto_152520 ?auto_152521 ) ) ( not ( = ?auto_152520 ?auto_152522 ) ) ( not ( = ?auto_152520 ?auto_152523 ) ) ( not ( = ?auto_152520 ?auto_152524 ) ) ( not ( = ?auto_152520 ?auto_152525 ) ) ( not ( = ?auto_152521 ?auto_152522 ) ) ( not ( = ?auto_152521 ?auto_152523 ) ) ( not ( = ?auto_152521 ?auto_152524 ) ) ( not ( = ?auto_152521 ?auto_152525 ) ) ( not ( = ?auto_152522 ?auto_152523 ) ) ( not ( = ?auto_152522 ?auto_152524 ) ) ( not ( = ?auto_152522 ?auto_152525 ) ) ( not ( = ?auto_152523 ?auto_152524 ) ) ( not ( = ?auto_152523 ?auto_152525 ) ) ( not ( = ?auto_152524 ?auto_152525 ) ) ( ON ?auto_152523 ?auto_152524 ) ( ON ?auto_152522 ?auto_152523 ) ( ON ?auto_152521 ?auto_152522 ) ( ON ?auto_152520 ?auto_152521 ) ( CLEAR ?auto_152518 ) ( ON ?auto_152519 ?auto_152520 ) ( CLEAR ?auto_152519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152513 ?auto_152514 ?auto_152515 ?auto_152516 ?auto_152517 ?auto_152518 ?auto_152519 )
      ( MAKE-12PILE ?auto_152513 ?auto_152514 ?auto_152515 ?auto_152516 ?auto_152517 ?auto_152518 ?auto_152519 ?auto_152520 ?auto_152521 ?auto_152522 ?auto_152523 ?auto_152524 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_152538 - BLOCK
      ?auto_152539 - BLOCK
      ?auto_152540 - BLOCK
      ?auto_152541 - BLOCK
      ?auto_152542 - BLOCK
      ?auto_152543 - BLOCK
      ?auto_152544 - BLOCK
      ?auto_152545 - BLOCK
      ?auto_152546 - BLOCK
      ?auto_152547 - BLOCK
      ?auto_152548 - BLOCK
      ?auto_152549 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152549 ) ( ON-TABLE ?auto_152538 ) ( ON ?auto_152539 ?auto_152538 ) ( ON ?auto_152540 ?auto_152539 ) ( ON ?auto_152541 ?auto_152540 ) ( ON ?auto_152542 ?auto_152541 ) ( ON ?auto_152543 ?auto_152542 ) ( not ( = ?auto_152538 ?auto_152539 ) ) ( not ( = ?auto_152538 ?auto_152540 ) ) ( not ( = ?auto_152538 ?auto_152541 ) ) ( not ( = ?auto_152538 ?auto_152542 ) ) ( not ( = ?auto_152538 ?auto_152543 ) ) ( not ( = ?auto_152538 ?auto_152544 ) ) ( not ( = ?auto_152538 ?auto_152545 ) ) ( not ( = ?auto_152538 ?auto_152546 ) ) ( not ( = ?auto_152538 ?auto_152547 ) ) ( not ( = ?auto_152538 ?auto_152548 ) ) ( not ( = ?auto_152538 ?auto_152549 ) ) ( not ( = ?auto_152539 ?auto_152540 ) ) ( not ( = ?auto_152539 ?auto_152541 ) ) ( not ( = ?auto_152539 ?auto_152542 ) ) ( not ( = ?auto_152539 ?auto_152543 ) ) ( not ( = ?auto_152539 ?auto_152544 ) ) ( not ( = ?auto_152539 ?auto_152545 ) ) ( not ( = ?auto_152539 ?auto_152546 ) ) ( not ( = ?auto_152539 ?auto_152547 ) ) ( not ( = ?auto_152539 ?auto_152548 ) ) ( not ( = ?auto_152539 ?auto_152549 ) ) ( not ( = ?auto_152540 ?auto_152541 ) ) ( not ( = ?auto_152540 ?auto_152542 ) ) ( not ( = ?auto_152540 ?auto_152543 ) ) ( not ( = ?auto_152540 ?auto_152544 ) ) ( not ( = ?auto_152540 ?auto_152545 ) ) ( not ( = ?auto_152540 ?auto_152546 ) ) ( not ( = ?auto_152540 ?auto_152547 ) ) ( not ( = ?auto_152540 ?auto_152548 ) ) ( not ( = ?auto_152540 ?auto_152549 ) ) ( not ( = ?auto_152541 ?auto_152542 ) ) ( not ( = ?auto_152541 ?auto_152543 ) ) ( not ( = ?auto_152541 ?auto_152544 ) ) ( not ( = ?auto_152541 ?auto_152545 ) ) ( not ( = ?auto_152541 ?auto_152546 ) ) ( not ( = ?auto_152541 ?auto_152547 ) ) ( not ( = ?auto_152541 ?auto_152548 ) ) ( not ( = ?auto_152541 ?auto_152549 ) ) ( not ( = ?auto_152542 ?auto_152543 ) ) ( not ( = ?auto_152542 ?auto_152544 ) ) ( not ( = ?auto_152542 ?auto_152545 ) ) ( not ( = ?auto_152542 ?auto_152546 ) ) ( not ( = ?auto_152542 ?auto_152547 ) ) ( not ( = ?auto_152542 ?auto_152548 ) ) ( not ( = ?auto_152542 ?auto_152549 ) ) ( not ( = ?auto_152543 ?auto_152544 ) ) ( not ( = ?auto_152543 ?auto_152545 ) ) ( not ( = ?auto_152543 ?auto_152546 ) ) ( not ( = ?auto_152543 ?auto_152547 ) ) ( not ( = ?auto_152543 ?auto_152548 ) ) ( not ( = ?auto_152543 ?auto_152549 ) ) ( not ( = ?auto_152544 ?auto_152545 ) ) ( not ( = ?auto_152544 ?auto_152546 ) ) ( not ( = ?auto_152544 ?auto_152547 ) ) ( not ( = ?auto_152544 ?auto_152548 ) ) ( not ( = ?auto_152544 ?auto_152549 ) ) ( not ( = ?auto_152545 ?auto_152546 ) ) ( not ( = ?auto_152545 ?auto_152547 ) ) ( not ( = ?auto_152545 ?auto_152548 ) ) ( not ( = ?auto_152545 ?auto_152549 ) ) ( not ( = ?auto_152546 ?auto_152547 ) ) ( not ( = ?auto_152546 ?auto_152548 ) ) ( not ( = ?auto_152546 ?auto_152549 ) ) ( not ( = ?auto_152547 ?auto_152548 ) ) ( not ( = ?auto_152547 ?auto_152549 ) ) ( not ( = ?auto_152548 ?auto_152549 ) ) ( ON ?auto_152548 ?auto_152549 ) ( ON ?auto_152547 ?auto_152548 ) ( ON ?auto_152546 ?auto_152547 ) ( ON ?auto_152545 ?auto_152546 ) ( CLEAR ?auto_152543 ) ( ON ?auto_152544 ?auto_152545 ) ( CLEAR ?auto_152544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152538 ?auto_152539 ?auto_152540 ?auto_152541 ?auto_152542 ?auto_152543 ?auto_152544 )
      ( MAKE-12PILE ?auto_152538 ?auto_152539 ?auto_152540 ?auto_152541 ?auto_152542 ?auto_152543 ?auto_152544 ?auto_152545 ?auto_152546 ?auto_152547 ?auto_152548 ?auto_152549 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_152562 - BLOCK
      ?auto_152563 - BLOCK
      ?auto_152564 - BLOCK
      ?auto_152565 - BLOCK
      ?auto_152566 - BLOCK
      ?auto_152567 - BLOCK
      ?auto_152568 - BLOCK
      ?auto_152569 - BLOCK
      ?auto_152570 - BLOCK
      ?auto_152571 - BLOCK
      ?auto_152572 - BLOCK
      ?auto_152573 - BLOCK
    )
    :vars
    (
      ?auto_152574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152573 ?auto_152574 ) ( ON-TABLE ?auto_152562 ) ( ON ?auto_152563 ?auto_152562 ) ( ON ?auto_152564 ?auto_152563 ) ( ON ?auto_152565 ?auto_152564 ) ( ON ?auto_152566 ?auto_152565 ) ( not ( = ?auto_152562 ?auto_152563 ) ) ( not ( = ?auto_152562 ?auto_152564 ) ) ( not ( = ?auto_152562 ?auto_152565 ) ) ( not ( = ?auto_152562 ?auto_152566 ) ) ( not ( = ?auto_152562 ?auto_152567 ) ) ( not ( = ?auto_152562 ?auto_152568 ) ) ( not ( = ?auto_152562 ?auto_152569 ) ) ( not ( = ?auto_152562 ?auto_152570 ) ) ( not ( = ?auto_152562 ?auto_152571 ) ) ( not ( = ?auto_152562 ?auto_152572 ) ) ( not ( = ?auto_152562 ?auto_152573 ) ) ( not ( = ?auto_152562 ?auto_152574 ) ) ( not ( = ?auto_152563 ?auto_152564 ) ) ( not ( = ?auto_152563 ?auto_152565 ) ) ( not ( = ?auto_152563 ?auto_152566 ) ) ( not ( = ?auto_152563 ?auto_152567 ) ) ( not ( = ?auto_152563 ?auto_152568 ) ) ( not ( = ?auto_152563 ?auto_152569 ) ) ( not ( = ?auto_152563 ?auto_152570 ) ) ( not ( = ?auto_152563 ?auto_152571 ) ) ( not ( = ?auto_152563 ?auto_152572 ) ) ( not ( = ?auto_152563 ?auto_152573 ) ) ( not ( = ?auto_152563 ?auto_152574 ) ) ( not ( = ?auto_152564 ?auto_152565 ) ) ( not ( = ?auto_152564 ?auto_152566 ) ) ( not ( = ?auto_152564 ?auto_152567 ) ) ( not ( = ?auto_152564 ?auto_152568 ) ) ( not ( = ?auto_152564 ?auto_152569 ) ) ( not ( = ?auto_152564 ?auto_152570 ) ) ( not ( = ?auto_152564 ?auto_152571 ) ) ( not ( = ?auto_152564 ?auto_152572 ) ) ( not ( = ?auto_152564 ?auto_152573 ) ) ( not ( = ?auto_152564 ?auto_152574 ) ) ( not ( = ?auto_152565 ?auto_152566 ) ) ( not ( = ?auto_152565 ?auto_152567 ) ) ( not ( = ?auto_152565 ?auto_152568 ) ) ( not ( = ?auto_152565 ?auto_152569 ) ) ( not ( = ?auto_152565 ?auto_152570 ) ) ( not ( = ?auto_152565 ?auto_152571 ) ) ( not ( = ?auto_152565 ?auto_152572 ) ) ( not ( = ?auto_152565 ?auto_152573 ) ) ( not ( = ?auto_152565 ?auto_152574 ) ) ( not ( = ?auto_152566 ?auto_152567 ) ) ( not ( = ?auto_152566 ?auto_152568 ) ) ( not ( = ?auto_152566 ?auto_152569 ) ) ( not ( = ?auto_152566 ?auto_152570 ) ) ( not ( = ?auto_152566 ?auto_152571 ) ) ( not ( = ?auto_152566 ?auto_152572 ) ) ( not ( = ?auto_152566 ?auto_152573 ) ) ( not ( = ?auto_152566 ?auto_152574 ) ) ( not ( = ?auto_152567 ?auto_152568 ) ) ( not ( = ?auto_152567 ?auto_152569 ) ) ( not ( = ?auto_152567 ?auto_152570 ) ) ( not ( = ?auto_152567 ?auto_152571 ) ) ( not ( = ?auto_152567 ?auto_152572 ) ) ( not ( = ?auto_152567 ?auto_152573 ) ) ( not ( = ?auto_152567 ?auto_152574 ) ) ( not ( = ?auto_152568 ?auto_152569 ) ) ( not ( = ?auto_152568 ?auto_152570 ) ) ( not ( = ?auto_152568 ?auto_152571 ) ) ( not ( = ?auto_152568 ?auto_152572 ) ) ( not ( = ?auto_152568 ?auto_152573 ) ) ( not ( = ?auto_152568 ?auto_152574 ) ) ( not ( = ?auto_152569 ?auto_152570 ) ) ( not ( = ?auto_152569 ?auto_152571 ) ) ( not ( = ?auto_152569 ?auto_152572 ) ) ( not ( = ?auto_152569 ?auto_152573 ) ) ( not ( = ?auto_152569 ?auto_152574 ) ) ( not ( = ?auto_152570 ?auto_152571 ) ) ( not ( = ?auto_152570 ?auto_152572 ) ) ( not ( = ?auto_152570 ?auto_152573 ) ) ( not ( = ?auto_152570 ?auto_152574 ) ) ( not ( = ?auto_152571 ?auto_152572 ) ) ( not ( = ?auto_152571 ?auto_152573 ) ) ( not ( = ?auto_152571 ?auto_152574 ) ) ( not ( = ?auto_152572 ?auto_152573 ) ) ( not ( = ?auto_152572 ?auto_152574 ) ) ( not ( = ?auto_152573 ?auto_152574 ) ) ( ON ?auto_152572 ?auto_152573 ) ( ON ?auto_152571 ?auto_152572 ) ( ON ?auto_152570 ?auto_152571 ) ( ON ?auto_152569 ?auto_152570 ) ( ON ?auto_152568 ?auto_152569 ) ( CLEAR ?auto_152566 ) ( ON ?auto_152567 ?auto_152568 ) ( CLEAR ?auto_152567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_152562 ?auto_152563 ?auto_152564 ?auto_152565 ?auto_152566 ?auto_152567 )
      ( MAKE-12PILE ?auto_152562 ?auto_152563 ?auto_152564 ?auto_152565 ?auto_152566 ?auto_152567 ?auto_152568 ?auto_152569 ?auto_152570 ?auto_152571 ?auto_152572 ?auto_152573 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_152587 - BLOCK
      ?auto_152588 - BLOCK
      ?auto_152589 - BLOCK
      ?auto_152590 - BLOCK
      ?auto_152591 - BLOCK
      ?auto_152592 - BLOCK
      ?auto_152593 - BLOCK
      ?auto_152594 - BLOCK
      ?auto_152595 - BLOCK
      ?auto_152596 - BLOCK
      ?auto_152597 - BLOCK
      ?auto_152598 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152598 ) ( ON-TABLE ?auto_152587 ) ( ON ?auto_152588 ?auto_152587 ) ( ON ?auto_152589 ?auto_152588 ) ( ON ?auto_152590 ?auto_152589 ) ( ON ?auto_152591 ?auto_152590 ) ( not ( = ?auto_152587 ?auto_152588 ) ) ( not ( = ?auto_152587 ?auto_152589 ) ) ( not ( = ?auto_152587 ?auto_152590 ) ) ( not ( = ?auto_152587 ?auto_152591 ) ) ( not ( = ?auto_152587 ?auto_152592 ) ) ( not ( = ?auto_152587 ?auto_152593 ) ) ( not ( = ?auto_152587 ?auto_152594 ) ) ( not ( = ?auto_152587 ?auto_152595 ) ) ( not ( = ?auto_152587 ?auto_152596 ) ) ( not ( = ?auto_152587 ?auto_152597 ) ) ( not ( = ?auto_152587 ?auto_152598 ) ) ( not ( = ?auto_152588 ?auto_152589 ) ) ( not ( = ?auto_152588 ?auto_152590 ) ) ( not ( = ?auto_152588 ?auto_152591 ) ) ( not ( = ?auto_152588 ?auto_152592 ) ) ( not ( = ?auto_152588 ?auto_152593 ) ) ( not ( = ?auto_152588 ?auto_152594 ) ) ( not ( = ?auto_152588 ?auto_152595 ) ) ( not ( = ?auto_152588 ?auto_152596 ) ) ( not ( = ?auto_152588 ?auto_152597 ) ) ( not ( = ?auto_152588 ?auto_152598 ) ) ( not ( = ?auto_152589 ?auto_152590 ) ) ( not ( = ?auto_152589 ?auto_152591 ) ) ( not ( = ?auto_152589 ?auto_152592 ) ) ( not ( = ?auto_152589 ?auto_152593 ) ) ( not ( = ?auto_152589 ?auto_152594 ) ) ( not ( = ?auto_152589 ?auto_152595 ) ) ( not ( = ?auto_152589 ?auto_152596 ) ) ( not ( = ?auto_152589 ?auto_152597 ) ) ( not ( = ?auto_152589 ?auto_152598 ) ) ( not ( = ?auto_152590 ?auto_152591 ) ) ( not ( = ?auto_152590 ?auto_152592 ) ) ( not ( = ?auto_152590 ?auto_152593 ) ) ( not ( = ?auto_152590 ?auto_152594 ) ) ( not ( = ?auto_152590 ?auto_152595 ) ) ( not ( = ?auto_152590 ?auto_152596 ) ) ( not ( = ?auto_152590 ?auto_152597 ) ) ( not ( = ?auto_152590 ?auto_152598 ) ) ( not ( = ?auto_152591 ?auto_152592 ) ) ( not ( = ?auto_152591 ?auto_152593 ) ) ( not ( = ?auto_152591 ?auto_152594 ) ) ( not ( = ?auto_152591 ?auto_152595 ) ) ( not ( = ?auto_152591 ?auto_152596 ) ) ( not ( = ?auto_152591 ?auto_152597 ) ) ( not ( = ?auto_152591 ?auto_152598 ) ) ( not ( = ?auto_152592 ?auto_152593 ) ) ( not ( = ?auto_152592 ?auto_152594 ) ) ( not ( = ?auto_152592 ?auto_152595 ) ) ( not ( = ?auto_152592 ?auto_152596 ) ) ( not ( = ?auto_152592 ?auto_152597 ) ) ( not ( = ?auto_152592 ?auto_152598 ) ) ( not ( = ?auto_152593 ?auto_152594 ) ) ( not ( = ?auto_152593 ?auto_152595 ) ) ( not ( = ?auto_152593 ?auto_152596 ) ) ( not ( = ?auto_152593 ?auto_152597 ) ) ( not ( = ?auto_152593 ?auto_152598 ) ) ( not ( = ?auto_152594 ?auto_152595 ) ) ( not ( = ?auto_152594 ?auto_152596 ) ) ( not ( = ?auto_152594 ?auto_152597 ) ) ( not ( = ?auto_152594 ?auto_152598 ) ) ( not ( = ?auto_152595 ?auto_152596 ) ) ( not ( = ?auto_152595 ?auto_152597 ) ) ( not ( = ?auto_152595 ?auto_152598 ) ) ( not ( = ?auto_152596 ?auto_152597 ) ) ( not ( = ?auto_152596 ?auto_152598 ) ) ( not ( = ?auto_152597 ?auto_152598 ) ) ( ON ?auto_152597 ?auto_152598 ) ( ON ?auto_152596 ?auto_152597 ) ( ON ?auto_152595 ?auto_152596 ) ( ON ?auto_152594 ?auto_152595 ) ( ON ?auto_152593 ?auto_152594 ) ( CLEAR ?auto_152591 ) ( ON ?auto_152592 ?auto_152593 ) ( CLEAR ?auto_152592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_152587 ?auto_152588 ?auto_152589 ?auto_152590 ?auto_152591 ?auto_152592 )
      ( MAKE-12PILE ?auto_152587 ?auto_152588 ?auto_152589 ?auto_152590 ?auto_152591 ?auto_152592 ?auto_152593 ?auto_152594 ?auto_152595 ?auto_152596 ?auto_152597 ?auto_152598 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_152611 - BLOCK
      ?auto_152612 - BLOCK
      ?auto_152613 - BLOCK
      ?auto_152614 - BLOCK
      ?auto_152615 - BLOCK
      ?auto_152616 - BLOCK
      ?auto_152617 - BLOCK
      ?auto_152618 - BLOCK
      ?auto_152619 - BLOCK
      ?auto_152620 - BLOCK
      ?auto_152621 - BLOCK
      ?auto_152622 - BLOCK
    )
    :vars
    (
      ?auto_152623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152622 ?auto_152623 ) ( ON-TABLE ?auto_152611 ) ( ON ?auto_152612 ?auto_152611 ) ( ON ?auto_152613 ?auto_152612 ) ( ON ?auto_152614 ?auto_152613 ) ( not ( = ?auto_152611 ?auto_152612 ) ) ( not ( = ?auto_152611 ?auto_152613 ) ) ( not ( = ?auto_152611 ?auto_152614 ) ) ( not ( = ?auto_152611 ?auto_152615 ) ) ( not ( = ?auto_152611 ?auto_152616 ) ) ( not ( = ?auto_152611 ?auto_152617 ) ) ( not ( = ?auto_152611 ?auto_152618 ) ) ( not ( = ?auto_152611 ?auto_152619 ) ) ( not ( = ?auto_152611 ?auto_152620 ) ) ( not ( = ?auto_152611 ?auto_152621 ) ) ( not ( = ?auto_152611 ?auto_152622 ) ) ( not ( = ?auto_152611 ?auto_152623 ) ) ( not ( = ?auto_152612 ?auto_152613 ) ) ( not ( = ?auto_152612 ?auto_152614 ) ) ( not ( = ?auto_152612 ?auto_152615 ) ) ( not ( = ?auto_152612 ?auto_152616 ) ) ( not ( = ?auto_152612 ?auto_152617 ) ) ( not ( = ?auto_152612 ?auto_152618 ) ) ( not ( = ?auto_152612 ?auto_152619 ) ) ( not ( = ?auto_152612 ?auto_152620 ) ) ( not ( = ?auto_152612 ?auto_152621 ) ) ( not ( = ?auto_152612 ?auto_152622 ) ) ( not ( = ?auto_152612 ?auto_152623 ) ) ( not ( = ?auto_152613 ?auto_152614 ) ) ( not ( = ?auto_152613 ?auto_152615 ) ) ( not ( = ?auto_152613 ?auto_152616 ) ) ( not ( = ?auto_152613 ?auto_152617 ) ) ( not ( = ?auto_152613 ?auto_152618 ) ) ( not ( = ?auto_152613 ?auto_152619 ) ) ( not ( = ?auto_152613 ?auto_152620 ) ) ( not ( = ?auto_152613 ?auto_152621 ) ) ( not ( = ?auto_152613 ?auto_152622 ) ) ( not ( = ?auto_152613 ?auto_152623 ) ) ( not ( = ?auto_152614 ?auto_152615 ) ) ( not ( = ?auto_152614 ?auto_152616 ) ) ( not ( = ?auto_152614 ?auto_152617 ) ) ( not ( = ?auto_152614 ?auto_152618 ) ) ( not ( = ?auto_152614 ?auto_152619 ) ) ( not ( = ?auto_152614 ?auto_152620 ) ) ( not ( = ?auto_152614 ?auto_152621 ) ) ( not ( = ?auto_152614 ?auto_152622 ) ) ( not ( = ?auto_152614 ?auto_152623 ) ) ( not ( = ?auto_152615 ?auto_152616 ) ) ( not ( = ?auto_152615 ?auto_152617 ) ) ( not ( = ?auto_152615 ?auto_152618 ) ) ( not ( = ?auto_152615 ?auto_152619 ) ) ( not ( = ?auto_152615 ?auto_152620 ) ) ( not ( = ?auto_152615 ?auto_152621 ) ) ( not ( = ?auto_152615 ?auto_152622 ) ) ( not ( = ?auto_152615 ?auto_152623 ) ) ( not ( = ?auto_152616 ?auto_152617 ) ) ( not ( = ?auto_152616 ?auto_152618 ) ) ( not ( = ?auto_152616 ?auto_152619 ) ) ( not ( = ?auto_152616 ?auto_152620 ) ) ( not ( = ?auto_152616 ?auto_152621 ) ) ( not ( = ?auto_152616 ?auto_152622 ) ) ( not ( = ?auto_152616 ?auto_152623 ) ) ( not ( = ?auto_152617 ?auto_152618 ) ) ( not ( = ?auto_152617 ?auto_152619 ) ) ( not ( = ?auto_152617 ?auto_152620 ) ) ( not ( = ?auto_152617 ?auto_152621 ) ) ( not ( = ?auto_152617 ?auto_152622 ) ) ( not ( = ?auto_152617 ?auto_152623 ) ) ( not ( = ?auto_152618 ?auto_152619 ) ) ( not ( = ?auto_152618 ?auto_152620 ) ) ( not ( = ?auto_152618 ?auto_152621 ) ) ( not ( = ?auto_152618 ?auto_152622 ) ) ( not ( = ?auto_152618 ?auto_152623 ) ) ( not ( = ?auto_152619 ?auto_152620 ) ) ( not ( = ?auto_152619 ?auto_152621 ) ) ( not ( = ?auto_152619 ?auto_152622 ) ) ( not ( = ?auto_152619 ?auto_152623 ) ) ( not ( = ?auto_152620 ?auto_152621 ) ) ( not ( = ?auto_152620 ?auto_152622 ) ) ( not ( = ?auto_152620 ?auto_152623 ) ) ( not ( = ?auto_152621 ?auto_152622 ) ) ( not ( = ?auto_152621 ?auto_152623 ) ) ( not ( = ?auto_152622 ?auto_152623 ) ) ( ON ?auto_152621 ?auto_152622 ) ( ON ?auto_152620 ?auto_152621 ) ( ON ?auto_152619 ?auto_152620 ) ( ON ?auto_152618 ?auto_152619 ) ( ON ?auto_152617 ?auto_152618 ) ( ON ?auto_152616 ?auto_152617 ) ( CLEAR ?auto_152614 ) ( ON ?auto_152615 ?auto_152616 ) ( CLEAR ?auto_152615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_152611 ?auto_152612 ?auto_152613 ?auto_152614 ?auto_152615 )
      ( MAKE-12PILE ?auto_152611 ?auto_152612 ?auto_152613 ?auto_152614 ?auto_152615 ?auto_152616 ?auto_152617 ?auto_152618 ?auto_152619 ?auto_152620 ?auto_152621 ?auto_152622 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_152636 - BLOCK
      ?auto_152637 - BLOCK
      ?auto_152638 - BLOCK
      ?auto_152639 - BLOCK
      ?auto_152640 - BLOCK
      ?auto_152641 - BLOCK
      ?auto_152642 - BLOCK
      ?auto_152643 - BLOCK
      ?auto_152644 - BLOCK
      ?auto_152645 - BLOCK
      ?auto_152646 - BLOCK
      ?auto_152647 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152647 ) ( ON-TABLE ?auto_152636 ) ( ON ?auto_152637 ?auto_152636 ) ( ON ?auto_152638 ?auto_152637 ) ( ON ?auto_152639 ?auto_152638 ) ( not ( = ?auto_152636 ?auto_152637 ) ) ( not ( = ?auto_152636 ?auto_152638 ) ) ( not ( = ?auto_152636 ?auto_152639 ) ) ( not ( = ?auto_152636 ?auto_152640 ) ) ( not ( = ?auto_152636 ?auto_152641 ) ) ( not ( = ?auto_152636 ?auto_152642 ) ) ( not ( = ?auto_152636 ?auto_152643 ) ) ( not ( = ?auto_152636 ?auto_152644 ) ) ( not ( = ?auto_152636 ?auto_152645 ) ) ( not ( = ?auto_152636 ?auto_152646 ) ) ( not ( = ?auto_152636 ?auto_152647 ) ) ( not ( = ?auto_152637 ?auto_152638 ) ) ( not ( = ?auto_152637 ?auto_152639 ) ) ( not ( = ?auto_152637 ?auto_152640 ) ) ( not ( = ?auto_152637 ?auto_152641 ) ) ( not ( = ?auto_152637 ?auto_152642 ) ) ( not ( = ?auto_152637 ?auto_152643 ) ) ( not ( = ?auto_152637 ?auto_152644 ) ) ( not ( = ?auto_152637 ?auto_152645 ) ) ( not ( = ?auto_152637 ?auto_152646 ) ) ( not ( = ?auto_152637 ?auto_152647 ) ) ( not ( = ?auto_152638 ?auto_152639 ) ) ( not ( = ?auto_152638 ?auto_152640 ) ) ( not ( = ?auto_152638 ?auto_152641 ) ) ( not ( = ?auto_152638 ?auto_152642 ) ) ( not ( = ?auto_152638 ?auto_152643 ) ) ( not ( = ?auto_152638 ?auto_152644 ) ) ( not ( = ?auto_152638 ?auto_152645 ) ) ( not ( = ?auto_152638 ?auto_152646 ) ) ( not ( = ?auto_152638 ?auto_152647 ) ) ( not ( = ?auto_152639 ?auto_152640 ) ) ( not ( = ?auto_152639 ?auto_152641 ) ) ( not ( = ?auto_152639 ?auto_152642 ) ) ( not ( = ?auto_152639 ?auto_152643 ) ) ( not ( = ?auto_152639 ?auto_152644 ) ) ( not ( = ?auto_152639 ?auto_152645 ) ) ( not ( = ?auto_152639 ?auto_152646 ) ) ( not ( = ?auto_152639 ?auto_152647 ) ) ( not ( = ?auto_152640 ?auto_152641 ) ) ( not ( = ?auto_152640 ?auto_152642 ) ) ( not ( = ?auto_152640 ?auto_152643 ) ) ( not ( = ?auto_152640 ?auto_152644 ) ) ( not ( = ?auto_152640 ?auto_152645 ) ) ( not ( = ?auto_152640 ?auto_152646 ) ) ( not ( = ?auto_152640 ?auto_152647 ) ) ( not ( = ?auto_152641 ?auto_152642 ) ) ( not ( = ?auto_152641 ?auto_152643 ) ) ( not ( = ?auto_152641 ?auto_152644 ) ) ( not ( = ?auto_152641 ?auto_152645 ) ) ( not ( = ?auto_152641 ?auto_152646 ) ) ( not ( = ?auto_152641 ?auto_152647 ) ) ( not ( = ?auto_152642 ?auto_152643 ) ) ( not ( = ?auto_152642 ?auto_152644 ) ) ( not ( = ?auto_152642 ?auto_152645 ) ) ( not ( = ?auto_152642 ?auto_152646 ) ) ( not ( = ?auto_152642 ?auto_152647 ) ) ( not ( = ?auto_152643 ?auto_152644 ) ) ( not ( = ?auto_152643 ?auto_152645 ) ) ( not ( = ?auto_152643 ?auto_152646 ) ) ( not ( = ?auto_152643 ?auto_152647 ) ) ( not ( = ?auto_152644 ?auto_152645 ) ) ( not ( = ?auto_152644 ?auto_152646 ) ) ( not ( = ?auto_152644 ?auto_152647 ) ) ( not ( = ?auto_152645 ?auto_152646 ) ) ( not ( = ?auto_152645 ?auto_152647 ) ) ( not ( = ?auto_152646 ?auto_152647 ) ) ( ON ?auto_152646 ?auto_152647 ) ( ON ?auto_152645 ?auto_152646 ) ( ON ?auto_152644 ?auto_152645 ) ( ON ?auto_152643 ?auto_152644 ) ( ON ?auto_152642 ?auto_152643 ) ( ON ?auto_152641 ?auto_152642 ) ( CLEAR ?auto_152639 ) ( ON ?auto_152640 ?auto_152641 ) ( CLEAR ?auto_152640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_152636 ?auto_152637 ?auto_152638 ?auto_152639 ?auto_152640 )
      ( MAKE-12PILE ?auto_152636 ?auto_152637 ?auto_152638 ?auto_152639 ?auto_152640 ?auto_152641 ?auto_152642 ?auto_152643 ?auto_152644 ?auto_152645 ?auto_152646 ?auto_152647 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_152660 - BLOCK
      ?auto_152661 - BLOCK
      ?auto_152662 - BLOCK
      ?auto_152663 - BLOCK
      ?auto_152664 - BLOCK
      ?auto_152665 - BLOCK
      ?auto_152666 - BLOCK
      ?auto_152667 - BLOCK
      ?auto_152668 - BLOCK
      ?auto_152669 - BLOCK
      ?auto_152670 - BLOCK
      ?auto_152671 - BLOCK
    )
    :vars
    (
      ?auto_152672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152671 ?auto_152672 ) ( ON-TABLE ?auto_152660 ) ( ON ?auto_152661 ?auto_152660 ) ( ON ?auto_152662 ?auto_152661 ) ( not ( = ?auto_152660 ?auto_152661 ) ) ( not ( = ?auto_152660 ?auto_152662 ) ) ( not ( = ?auto_152660 ?auto_152663 ) ) ( not ( = ?auto_152660 ?auto_152664 ) ) ( not ( = ?auto_152660 ?auto_152665 ) ) ( not ( = ?auto_152660 ?auto_152666 ) ) ( not ( = ?auto_152660 ?auto_152667 ) ) ( not ( = ?auto_152660 ?auto_152668 ) ) ( not ( = ?auto_152660 ?auto_152669 ) ) ( not ( = ?auto_152660 ?auto_152670 ) ) ( not ( = ?auto_152660 ?auto_152671 ) ) ( not ( = ?auto_152660 ?auto_152672 ) ) ( not ( = ?auto_152661 ?auto_152662 ) ) ( not ( = ?auto_152661 ?auto_152663 ) ) ( not ( = ?auto_152661 ?auto_152664 ) ) ( not ( = ?auto_152661 ?auto_152665 ) ) ( not ( = ?auto_152661 ?auto_152666 ) ) ( not ( = ?auto_152661 ?auto_152667 ) ) ( not ( = ?auto_152661 ?auto_152668 ) ) ( not ( = ?auto_152661 ?auto_152669 ) ) ( not ( = ?auto_152661 ?auto_152670 ) ) ( not ( = ?auto_152661 ?auto_152671 ) ) ( not ( = ?auto_152661 ?auto_152672 ) ) ( not ( = ?auto_152662 ?auto_152663 ) ) ( not ( = ?auto_152662 ?auto_152664 ) ) ( not ( = ?auto_152662 ?auto_152665 ) ) ( not ( = ?auto_152662 ?auto_152666 ) ) ( not ( = ?auto_152662 ?auto_152667 ) ) ( not ( = ?auto_152662 ?auto_152668 ) ) ( not ( = ?auto_152662 ?auto_152669 ) ) ( not ( = ?auto_152662 ?auto_152670 ) ) ( not ( = ?auto_152662 ?auto_152671 ) ) ( not ( = ?auto_152662 ?auto_152672 ) ) ( not ( = ?auto_152663 ?auto_152664 ) ) ( not ( = ?auto_152663 ?auto_152665 ) ) ( not ( = ?auto_152663 ?auto_152666 ) ) ( not ( = ?auto_152663 ?auto_152667 ) ) ( not ( = ?auto_152663 ?auto_152668 ) ) ( not ( = ?auto_152663 ?auto_152669 ) ) ( not ( = ?auto_152663 ?auto_152670 ) ) ( not ( = ?auto_152663 ?auto_152671 ) ) ( not ( = ?auto_152663 ?auto_152672 ) ) ( not ( = ?auto_152664 ?auto_152665 ) ) ( not ( = ?auto_152664 ?auto_152666 ) ) ( not ( = ?auto_152664 ?auto_152667 ) ) ( not ( = ?auto_152664 ?auto_152668 ) ) ( not ( = ?auto_152664 ?auto_152669 ) ) ( not ( = ?auto_152664 ?auto_152670 ) ) ( not ( = ?auto_152664 ?auto_152671 ) ) ( not ( = ?auto_152664 ?auto_152672 ) ) ( not ( = ?auto_152665 ?auto_152666 ) ) ( not ( = ?auto_152665 ?auto_152667 ) ) ( not ( = ?auto_152665 ?auto_152668 ) ) ( not ( = ?auto_152665 ?auto_152669 ) ) ( not ( = ?auto_152665 ?auto_152670 ) ) ( not ( = ?auto_152665 ?auto_152671 ) ) ( not ( = ?auto_152665 ?auto_152672 ) ) ( not ( = ?auto_152666 ?auto_152667 ) ) ( not ( = ?auto_152666 ?auto_152668 ) ) ( not ( = ?auto_152666 ?auto_152669 ) ) ( not ( = ?auto_152666 ?auto_152670 ) ) ( not ( = ?auto_152666 ?auto_152671 ) ) ( not ( = ?auto_152666 ?auto_152672 ) ) ( not ( = ?auto_152667 ?auto_152668 ) ) ( not ( = ?auto_152667 ?auto_152669 ) ) ( not ( = ?auto_152667 ?auto_152670 ) ) ( not ( = ?auto_152667 ?auto_152671 ) ) ( not ( = ?auto_152667 ?auto_152672 ) ) ( not ( = ?auto_152668 ?auto_152669 ) ) ( not ( = ?auto_152668 ?auto_152670 ) ) ( not ( = ?auto_152668 ?auto_152671 ) ) ( not ( = ?auto_152668 ?auto_152672 ) ) ( not ( = ?auto_152669 ?auto_152670 ) ) ( not ( = ?auto_152669 ?auto_152671 ) ) ( not ( = ?auto_152669 ?auto_152672 ) ) ( not ( = ?auto_152670 ?auto_152671 ) ) ( not ( = ?auto_152670 ?auto_152672 ) ) ( not ( = ?auto_152671 ?auto_152672 ) ) ( ON ?auto_152670 ?auto_152671 ) ( ON ?auto_152669 ?auto_152670 ) ( ON ?auto_152668 ?auto_152669 ) ( ON ?auto_152667 ?auto_152668 ) ( ON ?auto_152666 ?auto_152667 ) ( ON ?auto_152665 ?auto_152666 ) ( ON ?auto_152664 ?auto_152665 ) ( CLEAR ?auto_152662 ) ( ON ?auto_152663 ?auto_152664 ) ( CLEAR ?auto_152663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_152660 ?auto_152661 ?auto_152662 ?auto_152663 )
      ( MAKE-12PILE ?auto_152660 ?auto_152661 ?auto_152662 ?auto_152663 ?auto_152664 ?auto_152665 ?auto_152666 ?auto_152667 ?auto_152668 ?auto_152669 ?auto_152670 ?auto_152671 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_152685 - BLOCK
      ?auto_152686 - BLOCK
      ?auto_152687 - BLOCK
      ?auto_152688 - BLOCK
      ?auto_152689 - BLOCK
      ?auto_152690 - BLOCK
      ?auto_152691 - BLOCK
      ?auto_152692 - BLOCK
      ?auto_152693 - BLOCK
      ?auto_152694 - BLOCK
      ?auto_152695 - BLOCK
      ?auto_152696 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152696 ) ( ON-TABLE ?auto_152685 ) ( ON ?auto_152686 ?auto_152685 ) ( ON ?auto_152687 ?auto_152686 ) ( not ( = ?auto_152685 ?auto_152686 ) ) ( not ( = ?auto_152685 ?auto_152687 ) ) ( not ( = ?auto_152685 ?auto_152688 ) ) ( not ( = ?auto_152685 ?auto_152689 ) ) ( not ( = ?auto_152685 ?auto_152690 ) ) ( not ( = ?auto_152685 ?auto_152691 ) ) ( not ( = ?auto_152685 ?auto_152692 ) ) ( not ( = ?auto_152685 ?auto_152693 ) ) ( not ( = ?auto_152685 ?auto_152694 ) ) ( not ( = ?auto_152685 ?auto_152695 ) ) ( not ( = ?auto_152685 ?auto_152696 ) ) ( not ( = ?auto_152686 ?auto_152687 ) ) ( not ( = ?auto_152686 ?auto_152688 ) ) ( not ( = ?auto_152686 ?auto_152689 ) ) ( not ( = ?auto_152686 ?auto_152690 ) ) ( not ( = ?auto_152686 ?auto_152691 ) ) ( not ( = ?auto_152686 ?auto_152692 ) ) ( not ( = ?auto_152686 ?auto_152693 ) ) ( not ( = ?auto_152686 ?auto_152694 ) ) ( not ( = ?auto_152686 ?auto_152695 ) ) ( not ( = ?auto_152686 ?auto_152696 ) ) ( not ( = ?auto_152687 ?auto_152688 ) ) ( not ( = ?auto_152687 ?auto_152689 ) ) ( not ( = ?auto_152687 ?auto_152690 ) ) ( not ( = ?auto_152687 ?auto_152691 ) ) ( not ( = ?auto_152687 ?auto_152692 ) ) ( not ( = ?auto_152687 ?auto_152693 ) ) ( not ( = ?auto_152687 ?auto_152694 ) ) ( not ( = ?auto_152687 ?auto_152695 ) ) ( not ( = ?auto_152687 ?auto_152696 ) ) ( not ( = ?auto_152688 ?auto_152689 ) ) ( not ( = ?auto_152688 ?auto_152690 ) ) ( not ( = ?auto_152688 ?auto_152691 ) ) ( not ( = ?auto_152688 ?auto_152692 ) ) ( not ( = ?auto_152688 ?auto_152693 ) ) ( not ( = ?auto_152688 ?auto_152694 ) ) ( not ( = ?auto_152688 ?auto_152695 ) ) ( not ( = ?auto_152688 ?auto_152696 ) ) ( not ( = ?auto_152689 ?auto_152690 ) ) ( not ( = ?auto_152689 ?auto_152691 ) ) ( not ( = ?auto_152689 ?auto_152692 ) ) ( not ( = ?auto_152689 ?auto_152693 ) ) ( not ( = ?auto_152689 ?auto_152694 ) ) ( not ( = ?auto_152689 ?auto_152695 ) ) ( not ( = ?auto_152689 ?auto_152696 ) ) ( not ( = ?auto_152690 ?auto_152691 ) ) ( not ( = ?auto_152690 ?auto_152692 ) ) ( not ( = ?auto_152690 ?auto_152693 ) ) ( not ( = ?auto_152690 ?auto_152694 ) ) ( not ( = ?auto_152690 ?auto_152695 ) ) ( not ( = ?auto_152690 ?auto_152696 ) ) ( not ( = ?auto_152691 ?auto_152692 ) ) ( not ( = ?auto_152691 ?auto_152693 ) ) ( not ( = ?auto_152691 ?auto_152694 ) ) ( not ( = ?auto_152691 ?auto_152695 ) ) ( not ( = ?auto_152691 ?auto_152696 ) ) ( not ( = ?auto_152692 ?auto_152693 ) ) ( not ( = ?auto_152692 ?auto_152694 ) ) ( not ( = ?auto_152692 ?auto_152695 ) ) ( not ( = ?auto_152692 ?auto_152696 ) ) ( not ( = ?auto_152693 ?auto_152694 ) ) ( not ( = ?auto_152693 ?auto_152695 ) ) ( not ( = ?auto_152693 ?auto_152696 ) ) ( not ( = ?auto_152694 ?auto_152695 ) ) ( not ( = ?auto_152694 ?auto_152696 ) ) ( not ( = ?auto_152695 ?auto_152696 ) ) ( ON ?auto_152695 ?auto_152696 ) ( ON ?auto_152694 ?auto_152695 ) ( ON ?auto_152693 ?auto_152694 ) ( ON ?auto_152692 ?auto_152693 ) ( ON ?auto_152691 ?auto_152692 ) ( ON ?auto_152690 ?auto_152691 ) ( ON ?auto_152689 ?auto_152690 ) ( CLEAR ?auto_152687 ) ( ON ?auto_152688 ?auto_152689 ) ( CLEAR ?auto_152688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_152685 ?auto_152686 ?auto_152687 ?auto_152688 )
      ( MAKE-12PILE ?auto_152685 ?auto_152686 ?auto_152687 ?auto_152688 ?auto_152689 ?auto_152690 ?auto_152691 ?auto_152692 ?auto_152693 ?auto_152694 ?auto_152695 ?auto_152696 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_152709 - BLOCK
      ?auto_152710 - BLOCK
      ?auto_152711 - BLOCK
      ?auto_152712 - BLOCK
      ?auto_152713 - BLOCK
      ?auto_152714 - BLOCK
      ?auto_152715 - BLOCK
      ?auto_152716 - BLOCK
      ?auto_152717 - BLOCK
      ?auto_152718 - BLOCK
      ?auto_152719 - BLOCK
      ?auto_152720 - BLOCK
    )
    :vars
    (
      ?auto_152721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152720 ?auto_152721 ) ( ON-TABLE ?auto_152709 ) ( ON ?auto_152710 ?auto_152709 ) ( not ( = ?auto_152709 ?auto_152710 ) ) ( not ( = ?auto_152709 ?auto_152711 ) ) ( not ( = ?auto_152709 ?auto_152712 ) ) ( not ( = ?auto_152709 ?auto_152713 ) ) ( not ( = ?auto_152709 ?auto_152714 ) ) ( not ( = ?auto_152709 ?auto_152715 ) ) ( not ( = ?auto_152709 ?auto_152716 ) ) ( not ( = ?auto_152709 ?auto_152717 ) ) ( not ( = ?auto_152709 ?auto_152718 ) ) ( not ( = ?auto_152709 ?auto_152719 ) ) ( not ( = ?auto_152709 ?auto_152720 ) ) ( not ( = ?auto_152709 ?auto_152721 ) ) ( not ( = ?auto_152710 ?auto_152711 ) ) ( not ( = ?auto_152710 ?auto_152712 ) ) ( not ( = ?auto_152710 ?auto_152713 ) ) ( not ( = ?auto_152710 ?auto_152714 ) ) ( not ( = ?auto_152710 ?auto_152715 ) ) ( not ( = ?auto_152710 ?auto_152716 ) ) ( not ( = ?auto_152710 ?auto_152717 ) ) ( not ( = ?auto_152710 ?auto_152718 ) ) ( not ( = ?auto_152710 ?auto_152719 ) ) ( not ( = ?auto_152710 ?auto_152720 ) ) ( not ( = ?auto_152710 ?auto_152721 ) ) ( not ( = ?auto_152711 ?auto_152712 ) ) ( not ( = ?auto_152711 ?auto_152713 ) ) ( not ( = ?auto_152711 ?auto_152714 ) ) ( not ( = ?auto_152711 ?auto_152715 ) ) ( not ( = ?auto_152711 ?auto_152716 ) ) ( not ( = ?auto_152711 ?auto_152717 ) ) ( not ( = ?auto_152711 ?auto_152718 ) ) ( not ( = ?auto_152711 ?auto_152719 ) ) ( not ( = ?auto_152711 ?auto_152720 ) ) ( not ( = ?auto_152711 ?auto_152721 ) ) ( not ( = ?auto_152712 ?auto_152713 ) ) ( not ( = ?auto_152712 ?auto_152714 ) ) ( not ( = ?auto_152712 ?auto_152715 ) ) ( not ( = ?auto_152712 ?auto_152716 ) ) ( not ( = ?auto_152712 ?auto_152717 ) ) ( not ( = ?auto_152712 ?auto_152718 ) ) ( not ( = ?auto_152712 ?auto_152719 ) ) ( not ( = ?auto_152712 ?auto_152720 ) ) ( not ( = ?auto_152712 ?auto_152721 ) ) ( not ( = ?auto_152713 ?auto_152714 ) ) ( not ( = ?auto_152713 ?auto_152715 ) ) ( not ( = ?auto_152713 ?auto_152716 ) ) ( not ( = ?auto_152713 ?auto_152717 ) ) ( not ( = ?auto_152713 ?auto_152718 ) ) ( not ( = ?auto_152713 ?auto_152719 ) ) ( not ( = ?auto_152713 ?auto_152720 ) ) ( not ( = ?auto_152713 ?auto_152721 ) ) ( not ( = ?auto_152714 ?auto_152715 ) ) ( not ( = ?auto_152714 ?auto_152716 ) ) ( not ( = ?auto_152714 ?auto_152717 ) ) ( not ( = ?auto_152714 ?auto_152718 ) ) ( not ( = ?auto_152714 ?auto_152719 ) ) ( not ( = ?auto_152714 ?auto_152720 ) ) ( not ( = ?auto_152714 ?auto_152721 ) ) ( not ( = ?auto_152715 ?auto_152716 ) ) ( not ( = ?auto_152715 ?auto_152717 ) ) ( not ( = ?auto_152715 ?auto_152718 ) ) ( not ( = ?auto_152715 ?auto_152719 ) ) ( not ( = ?auto_152715 ?auto_152720 ) ) ( not ( = ?auto_152715 ?auto_152721 ) ) ( not ( = ?auto_152716 ?auto_152717 ) ) ( not ( = ?auto_152716 ?auto_152718 ) ) ( not ( = ?auto_152716 ?auto_152719 ) ) ( not ( = ?auto_152716 ?auto_152720 ) ) ( not ( = ?auto_152716 ?auto_152721 ) ) ( not ( = ?auto_152717 ?auto_152718 ) ) ( not ( = ?auto_152717 ?auto_152719 ) ) ( not ( = ?auto_152717 ?auto_152720 ) ) ( not ( = ?auto_152717 ?auto_152721 ) ) ( not ( = ?auto_152718 ?auto_152719 ) ) ( not ( = ?auto_152718 ?auto_152720 ) ) ( not ( = ?auto_152718 ?auto_152721 ) ) ( not ( = ?auto_152719 ?auto_152720 ) ) ( not ( = ?auto_152719 ?auto_152721 ) ) ( not ( = ?auto_152720 ?auto_152721 ) ) ( ON ?auto_152719 ?auto_152720 ) ( ON ?auto_152718 ?auto_152719 ) ( ON ?auto_152717 ?auto_152718 ) ( ON ?auto_152716 ?auto_152717 ) ( ON ?auto_152715 ?auto_152716 ) ( ON ?auto_152714 ?auto_152715 ) ( ON ?auto_152713 ?auto_152714 ) ( ON ?auto_152712 ?auto_152713 ) ( CLEAR ?auto_152710 ) ( ON ?auto_152711 ?auto_152712 ) ( CLEAR ?auto_152711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_152709 ?auto_152710 ?auto_152711 )
      ( MAKE-12PILE ?auto_152709 ?auto_152710 ?auto_152711 ?auto_152712 ?auto_152713 ?auto_152714 ?auto_152715 ?auto_152716 ?auto_152717 ?auto_152718 ?auto_152719 ?auto_152720 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_152734 - BLOCK
      ?auto_152735 - BLOCK
      ?auto_152736 - BLOCK
      ?auto_152737 - BLOCK
      ?auto_152738 - BLOCK
      ?auto_152739 - BLOCK
      ?auto_152740 - BLOCK
      ?auto_152741 - BLOCK
      ?auto_152742 - BLOCK
      ?auto_152743 - BLOCK
      ?auto_152744 - BLOCK
      ?auto_152745 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152745 ) ( ON-TABLE ?auto_152734 ) ( ON ?auto_152735 ?auto_152734 ) ( not ( = ?auto_152734 ?auto_152735 ) ) ( not ( = ?auto_152734 ?auto_152736 ) ) ( not ( = ?auto_152734 ?auto_152737 ) ) ( not ( = ?auto_152734 ?auto_152738 ) ) ( not ( = ?auto_152734 ?auto_152739 ) ) ( not ( = ?auto_152734 ?auto_152740 ) ) ( not ( = ?auto_152734 ?auto_152741 ) ) ( not ( = ?auto_152734 ?auto_152742 ) ) ( not ( = ?auto_152734 ?auto_152743 ) ) ( not ( = ?auto_152734 ?auto_152744 ) ) ( not ( = ?auto_152734 ?auto_152745 ) ) ( not ( = ?auto_152735 ?auto_152736 ) ) ( not ( = ?auto_152735 ?auto_152737 ) ) ( not ( = ?auto_152735 ?auto_152738 ) ) ( not ( = ?auto_152735 ?auto_152739 ) ) ( not ( = ?auto_152735 ?auto_152740 ) ) ( not ( = ?auto_152735 ?auto_152741 ) ) ( not ( = ?auto_152735 ?auto_152742 ) ) ( not ( = ?auto_152735 ?auto_152743 ) ) ( not ( = ?auto_152735 ?auto_152744 ) ) ( not ( = ?auto_152735 ?auto_152745 ) ) ( not ( = ?auto_152736 ?auto_152737 ) ) ( not ( = ?auto_152736 ?auto_152738 ) ) ( not ( = ?auto_152736 ?auto_152739 ) ) ( not ( = ?auto_152736 ?auto_152740 ) ) ( not ( = ?auto_152736 ?auto_152741 ) ) ( not ( = ?auto_152736 ?auto_152742 ) ) ( not ( = ?auto_152736 ?auto_152743 ) ) ( not ( = ?auto_152736 ?auto_152744 ) ) ( not ( = ?auto_152736 ?auto_152745 ) ) ( not ( = ?auto_152737 ?auto_152738 ) ) ( not ( = ?auto_152737 ?auto_152739 ) ) ( not ( = ?auto_152737 ?auto_152740 ) ) ( not ( = ?auto_152737 ?auto_152741 ) ) ( not ( = ?auto_152737 ?auto_152742 ) ) ( not ( = ?auto_152737 ?auto_152743 ) ) ( not ( = ?auto_152737 ?auto_152744 ) ) ( not ( = ?auto_152737 ?auto_152745 ) ) ( not ( = ?auto_152738 ?auto_152739 ) ) ( not ( = ?auto_152738 ?auto_152740 ) ) ( not ( = ?auto_152738 ?auto_152741 ) ) ( not ( = ?auto_152738 ?auto_152742 ) ) ( not ( = ?auto_152738 ?auto_152743 ) ) ( not ( = ?auto_152738 ?auto_152744 ) ) ( not ( = ?auto_152738 ?auto_152745 ) ) ( not ( = ?auto_152739 ?auto_152740 ) ) ( not ( = ?auto_152739 ?auto_152741 ) ) ( not ( = ?auto_152739 ?auto_152742 ) ) ( not ( = ?auto_152739 ?auto_152743 ) ) ( not ( = ?auto_152739 ?auto_152744 ) ) ( not ( = ?auto_152739 ?auto_152745 ) ) ( not ( = ?auto_152740 ?auto_152741 ) ) ( not ( = ?auto_152740 ?auto_152742 ) ) ( not ( = ?auto_152740 ?auto_152743 ) ) ( not ( = ?auto_152740 ?auto_152744 ) ) ( not ( = ?auto_152740 ?auto_152745 ) ) ( not ( = ?auto_152741 ?auto_152742 ) ) ( not ( = ?auto_152741 ?auto_152743 ) ) ( not ( = ?auto_152741 ?auto_152744 ) ) ( not ( = ?auto_152741 ?auto_152745 ) ) ( not ( = ?auto_152742 ?auto_152743 ) ) ( not ( = ?auto_152742 ?auto_152744 ) ) ( not ( = ?auto_152742 ?auto_152745 ) ) ( not ( = ?auto_152743 ?auto_152744 ) ) ( not ( = ?auto_152743 ?auto_152745 ) ) ( not ( = ?auto_152744 ?auto_152745 ) ) ( ON ?auto_152744 ?auto_152745 ) ( ON ?auto_152743 ?auto_152744 ) ( ON ?auto_152742 ?auto_152743 ) ( ON ?auto_152741 ?auto_152742 ) ( ON ?auto_152740 ?auto_152741 ) ( ON ?auto_152739 ?auto_152740 ) ( ON ?auto_152738 ?auto_152739 ) ( ON ?auto_152737 ?auto_152738 ) ( CLEAR ?auto_152735 ) ( ON ?auto_152736 ?auto_152737 ) ( CLEAR ?auto_152736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_152734 ?auto_152735 ?auto_152736 )
      ( MAKE-12PILE ?auto_152734 ?auto_152735 ?auto_152736 ?auto_152737 ?auto_152738 ?auto_152739 ?auto_152740 ?auto_152741 ?auto_152742 ?auto_152743 ?auto_152744 ?auto_152745 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_152758 - BLOCK
      ?auto_152759 - BLOCK
      ?auto_152760 - BLOCK
      ?auto_152761 - BLOCK
      ?auto_152762 - BLOCK
      ?auto_152763 - BLOCK
      ?auto_152764 - BLOCK
      ?auto_152765 - BLOCK
      ?auto_152766 - BLOCK
      ?auto_152767 - BLOCK
      ?auto_152768 - BLOCK
      ?auto_152769 - BLOCK
    )
    :vars
    (
      ?auto_152770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152769 ?auto_152770 ) ( ON-TABLE ?auto_152758 ) ( not ( = ?auto_152758 ?auto_152759 ) ) ( not ( = ?auto_152758 ?auto_152760 ) ) ( not ( = ?auto_152758 ?auto_152761 ) ) ( not ( = ?auto_152758 ?auto_152762 ) ) ( not ( = ?auto_152758 ?auto_152763 ) ) ( not ( = ?auto_152758 ?auto_152764 ) ) ( not ( = ?auto_152758 ?auto_152765 ) ) ( not ( = ?auto_152758 ?auto_152766 ) ) ( not ( = ?auto_152758 ?auto_152767 ) ) ( not ( = ?auto_152758 ?auto_152768 ) ) ( not ( = ?auto_152758 ?auto_152769 ) ) ( not ( = ?auto_152758 ?auto_152770 ) ) ( not ( = ?auto_152759 ?auto_152760 ) ) ( not ( = ?auto_152759 ?auto_152761 ) ) ( not ( = ?auto_152759 ?auto_152762 ) ) ( not ( = ?auto_152759 ?auto_152763 ) ) ( not ( = ?auto_152759 ?auto_152764 ) ) ( not ( = ?auto_152759 ?auto_152765 ) ) ( not ( = ?auto_152759 ?auto_152766 ) ) ( not ( = ?auto_152759 ?auto_152767 ) ) ( not ( = ?auto_152759 ?auto_152768 ) ) ( not ( = ?auto_152759 ?auto_152769 ) ) ( not ( = ?auto_152759 ?auto_152770 ) ) ( not ( = ?auto_152760 ?auto_152761 ) ) ( not ( = ?auto_152760 ?auto_152762 ) ) ( not ( = ?auto_152760 ?auto_152763 ) ) ( not ( = ?auto_152760 ?auto_152764 ) ) ( not ( = ?auto_152760 ?auto_152765 ) ) ( not ( = ?auto_152760 ?auto_152766 ) ) ( not ( = ?auto_152760 ?auto_152767 ) ) ( not ( = ?auto_152760 ?auto_152768 ) ) ( not ( = ?auto_152760 ?auto_152769 ) ) ( not ( = ?auto_152760 ?auto_152770 ) ) ( not ( = ?auto_152761 ?auto_152762 ) ) ( not ( = ?auto_152761 ?auto_152763 ) ) ( not ( = ?auto_152761 ?auto_152764 ) ) ( not ( = ?auto_152761 ?auto_152765 ) ) ( not ( = ?auto_152761 ?auto_152766 ) ) ( not ( = ?auto_152761 ?auto_152767 ) ) ( not ( = ?auto_152761 ?auto_152768 ) ) ( not ( = ?auto_152761 ?auto_152769 ) ) ( not ( = ?auto_152761 ?auto_152770 ) ) ( not ( = ?auto_152762 ?auto_152763 ) ) ( not ( = ?auto_152762 ?auto_152764 ) ) ( not ( = ?auto_152762 ?auto_152765 ) ) ( not ( = ?auto_152762 ?auto_152766 ) ) ( not ( = ?auto_152762 ?auto_152767 ) ) ( not ( = ?auto_152762 ?auto_152768 ) ) ( not ( = ?auto_152762 ?auto_152769 ) ) ( not ( = ?auto_152762 ?auto_152770 ) ) ( not ( = ?auto_152763 ?auto_152764 ) ) ( not ( = ?auto_152763 ?auto_152765 ) ) ( not ( = ?auto_152763 ?auto_152766 ) ) ( not ( = ?auto_152763 ?auto_152767 ) ) ( not ( = ?auto_152763 ?auto_152768 ) ) ( not ( = ?auto_152763 ?auto_152769 ) ) ( not ( = ?auto_152763 ?auto_152770 ) ) ( not ( = ?auto_152764 ?auto_152765 ) ) ( not ( = ?auto_152764 ?auto_152766 ) ) ( not ( = ?auto_152764 ?auto_152767 ) ) ( not ( = ?auto_152764 ?auto_152768 ) ) ( not ( = ?auto_152764 ?auto_152769 ) ) ( not ( = ?auto_152764 ?auto_152770 ) ) ( not ( = ?auto_152765 ?auto_152766 ) ) ( not ( = ?auto_152765 ?auto_152767 ) ) ( not ( = ?auto_152765 ?auto_152768 ) ) ( not ( = ?auto_152765 ?auto_152769 ) ) ( not ( = ?auto_152765 ?auto_152770 ) ) ( not ( = ?auto_152766 ?auto_152767 ) ) ( not ( = ?auto_152766 ?auto_152768 ) ) ( not ( = ?auto_152766 ?auto_152769 ) ) ( not ( = ?auto_152766 ?auto_152770 ) ) ( not ( = ?auto_152767 ?auto_152768 ) ) ( not ( = ?auto_152767 ?auto_152769 ) ) ( not ( = ?auto_152767 ?auto_152770 ) ) ( not ( = ?auto_152768 ?auto_152769 ) ) ( not ( = ?auto_152768 ?auto_152770 ) ) ( not ( = ?auto_152769 ?auto_152770 ) ) ( ON ?auto_152768 ?auto_152769 ) ( ON ?auto_152767 ?auto_152768 ) ( ON ?auto_152766 ?auto_152767 ) ( ON ?auto_152765 ?auto_152766 ) ( ON ?auto_152764 ?auto_152765 ) ( ON ?auto_152763 ?auto_152764 ) ( ON ?auto_152762 ?auto_152763 ) ( ON ?auto_152761 ?auto_152762 ) ( ON ?auto_152760 ?auto_152761 ) ( CLEAR ?auto_152758 ) ( ON ?auto_152759 ?auto_152760 ) ( CLEAR ?auto_152759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152758 ?auto_152759 )
      ( MAKE-12PILE ?auto_152758 ?auto_152759 ?auto_152760 ?auto_152761 ?auto_152762 ?auto_152763 ?auto_152764 ?auto_152765 ?auto_152766 ?auto_152767 ?auto_152768 ?auto_152769 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_152783 - BLOCK
      ?auto_152784 - BLOCK
      ?auto_152785 - BLOCK
      ?auto_152786 - BLOCK
      ?auto_152787 - BLOCK
      ?auto_152788 - BLOCK
      ?auto_152789 - BLOCK
      ?auto_152790 - BLOCK
      ?auto_152791 - BLOCK
      ?auto_152792 - BLOCK
      ?auto_152793 - BLOCK
      ?auto_152794 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152794 ) ( ON-TABLE ?auto_152783 ) ( not ( = ?auto_152783 ?auto_152784 ) ) ( not ( = ?auto_152783 ?auto_152785 ) ) ( not ( = ?auto_152783 ?auto_152786 ) ) ( not ( = ?auto_152783 ?auto_152787 ) ) ( not ( = ?auto_152783 ?auto_152788 ) ) ( not ( = ?auto_152783 ?auto_152789 ) ) ( not ( = ?auto_152783 ?auto_152790 ) ) ( not ( = ?auto_152783 ?auto_152791 ) ) ( not ( = ?auto_152783 ?auto_152792 ) ) ( not ( = ?auto_152783 ?auto_152793 ) ) ( not ( = ?auto_152783 ?auto_152794 ) ) ( not ( = ?auto_152784 ?auto_152785 ) ) ( not ( = ?auto_152784 ?auto_152786 ) ) ( not ( = ?auto_152784 ?auto_152787 ) ) ( not ( = ?auto_152784 ?auto_152788 ) ) ( not ( = ?auto_152784 ?auto_152789 ) ) ( not ( = ?auto_152784 ?auto_152790 ) ) ( not ( = ?auto_152784 ?auto_152791 ) ) ( not ( = ?auto_152784 ?auto_152792 ) ) ( not ( = ?auto_152784 ?auto_152793 ) ) ( not ( = ?auto_152784 ?auto_152794 ) ) ( not ( = ?auto_152785 ?auto_152786 ) ) ( not ( = ?auto_152785 ?auto_152787 ) ) ( not ( = ?auto_152785 ?auto_152788 ) ) ( not ( = ?auto_152785 ?auto_152789 ) ) ( not ( = ?auto_152785 ?auto_152790 ) ) ( not ( = ?auto_152785 ?auto_152791 ) ) ( not ( = ?auto_152785 ?auto_152792 ) ) ( not ( = ?auto_152785 ?auto_152793 ) ) ( not ( = ?auto_152785 ?auto_152794 ) ) ( not ( = ?auto_152786 ?auto_152787 ) ) ( not ( = ?auto_152786 ?auto_152788 ) ) ( not ( = ?auto_152786 ?auto_152789 ) ) ( not ( = ?auto_152786 ?auto_152790 ) ) ( not ( = ?auto_152786 ?auto_152791 ) ) ( not ( = ?auto_152786 ?auto_152792 ) ) ( not ( = ?auto_152786 ?auto_152793 ) ) ( not ( = ?auto_152786 ?auto_152794 ) ) ( not ( = ?auto_152787 ?auto_152788 ) ) ( not ( = ?auto_152787 ?auto_152789 ) ) ( not ( = ?auto_152787 ?auto_152790 ) ) ( not ( = ?auto_152787 ?auto_152791 ) ) ( not ( = ?auto_152787 ?auto_152792 ) ) ( not ( = ?auto_152787 ?auto_152793 ) ) ( not ( = ?auto_152787 ?auto_152794 ) ) ( not ( = ?auto_152788 ?auto_152789 ) ) ( not ( = ?auto_152788 ?auto_152790 ) ) ( not ( = ?auto_152788 ?auto_152791 ) ) ( not ( = ?auto_152788 ?auto_152792 ) ) ( not ( = ?auto_152788 ?auto_152793 ) ) ( not ( = ?auto_152788 ?auto_152794 ) ) ( not ( = ?auto_152789 ?auto_152790 ) ) ( not ( = ?auto_152789 ?auto_152791 ) ) ( not ( = ?auto_152789 ?auto_152792 ) ) ( not ( = ?auto_152789 ?auto_152793 ) ) ( not ( = ?auto_152789 ?auto_152794 ) ) ( not ( = ?auto_152790 ?auto_152791 ) ) ( not ( = ?auto_152790 ?auto_152792 ) ) ( not ( = ?auto_152790 ?auto_152793 ) ) ( not ( = ?auto_152790 ?auto_152794 ) ) ( not ( = ?auto_152791 ?auto_152792 ) ) ( not ( = ?auto_152791 ?auto_152793 ) ) ( not ( = ?auto_152791 ?auto_152794 ) ) ( not ( = ?auto_152792 ?auto_152793 ) ) ( not ( = ?auto_152792 ?auto_152794 ) ) ( not ( = ?auto_152793 ?auto_152794 ) ) ( ON ?auto_152793 ?auto_152794 ) ( ON ?auto_152792 ?auto_152793 ) ( ON ?auto_152791 ?auto_152792 ) ( ON ?auto_152790 ?auto_152791 ) ( ON ?auto_152789 ?auto_152790 ) ( ON ?auto_152788 ?auto_152789 ) ( ON ?auto_152787 ?auto_152788 ) ( ON ?auto_152786 ?auto_152787 ) ( ON ?auto_152785 ?auto_152786 ) ( CLEAR ?auto_152783 ) ( ON ?auto_152784 ?auto_152785 ) ( CLEAR ?auto_152784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152783 ?auto_152784 )
      ( MAKE-12PILE ?auto_152783 ?auto_152784 ?auto_152785 ?auto_152786 ?auto_152787 ?auto_152788 ?auto_152789 ?auto_152790 ?auto_152791 ?auto_152792 ?auto_152793 ?auto_152794 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_152807 - BLOCK
      ?auto_152808 - BLOCK
      ?auto_152809 - BLOCK
      ?auto_152810 - BLOCK
      ?auto_152811 - BLOCK
      ?auto_152812 - BLOCK
      ?auto_152813 - BLOCK
      ?auto_152814 - BLOCK
      ?auto_152815 - BLOCK
      ?auto_152816 - BLOCK
      ?auto_152817 - BLOCK
      ?auto_152818 - BLOCK
    )
    :vars
    (
      ?auto_152819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152818 ?auto_152819 ) ( not ( = ?auto_152807 ?auto_152808 ) ) ( not ( = ?auto_152807 ?auto_152809 ) ) ( not ( = ?auto_152807 ?auto_152810 ) ) ( not ( = ?auto_152807 ?auto_152811 ) ) ( not ( = ?auto_152807 ?auto_152812 ) ) ( not ( = ?auto_152807 ?auto_152813 ) ) ( not ( = ?auto_152807 ?auto_152814 ) ) ( not ( = ?auto_152807 ?auto_152815 ) ) ( not ( = ?auto_152807 ?auto_152816 ) ) ( not ( = ?auto_152807 ?auto_152817 ) ) ( not ( = ?auto_152807 ?auto_152818 ) ) ( not ( = ?auto_152807 ?auto_152819 ) ) ( not ( = ?auto_152808 ?auto_152809 ) ) ( not ( = ?auto_152808 ?auto_152810 ) ) ( not ( = ?auto_152808 ?auto_152811 ) ) ( not ( = ?auto_152808 ?auto_152812 ) ) ( not ( = ?auto_152808 ?auto_152813 ) ) ( not ( = ?auto_152808 ?auto_152814 ) ) ( not ( = ?auto_152808 ?auto_152815 ) ) ( not ( = ?auto_152808 ?auto_152816 ) ) ( not ( = ?auto_152808 ?auto_152817 ) ) ( not ( = ?auto_152808 ?auto_152818 ) ) ( not ( = ?auto_152808 ?auto_152819 ) ) ( not ( = ?auto_152809 ?auto_152810 ) ) ( not ( = ?auto_152809 ?auto_152811 ) ) ( not ( = ?auto_152809 ?auto_152812 ) ) ( not ( = ?auto_152809 ?auto_152813 ) ) ( not ( = ?auto_152809 ?auto_152814 ) ) ( not ( = ?auto_152809 ?auto_152815 ) ) ( not ( = ?auto_152809 ?auto_152816 ) ) ( not ( = ?auto_152809 ?auto_152817 ) ) ( not ( = ?auto_152809 ?auto_152818 ) ) ( not ( = ?auto_152809 ?auto_152819 ) ) ( not ( = ?auto_152810 ?auto_152811 ) ) ( not ( = ?auto_152810 ?auto_152812 ) ) ( not ( = ?auto_152810 ?auto_152813 ) ) ( not ( = ?auto_152810 ?auto_152814 ) ) ( not ( = ?auto_152810 ?auto_152815 ) ) ( not ( = ?auto_152810 ?auto_152816 ) ) ( not ( = ?auto_152810 ?auto_152817 ) ) ( not ( = ?auto_152810 ?auto_152818 ) ) ( not ( = ?auto_152810 ?auto_152819 ) ) ( not ( = ?auto_152811 ?auto_152812 ) ) ( not ( = ?auto_152811 ?auto_152813 ) ) ( not ( = ?auto_152811 ?auto_152814 ) ) ( not ( = ?auto_152811 ?auto_152815 ) ) ( not ( = ?auto_152811 ?auto_152816 ) ) ( not ( = ?auto_152811 ?auto_152817 ) ) ( not ( = ?auto_152811 ?auto_152818 ) ) ( not ( = ?auto_152811 ?auto_152819 ) ) ( not ( = ?auto_152812 ?auto_152813 ) ) ( not ( = ?auto_152812 ?auto_152814 ) ) ( not ( = ?auto_152812 ?auto_152815 ) ) ( not ( = ?auto_152812 ?auto_152816 ) ) ( not ( = ?auto_152812 ?auto_152817 ) ) ( not ( = ?auto_152812 ?auto_152818 ) ) ( not ( = ?auto_152812 ?auto_152819 ) ) ( not ( = ?auto_152813 ?auto_152814 ) ) ( not ( = ?auto_152813 ?auto_152815 ) ) ( not ( = ?auto_152813 ?auto_152816 ) ) ( not ( = ?auto_152813 ?auto_152817 ) ) ( not ( = ?auto_152813 ?auto_152818 ) ) ( not ( = ?auto_152813 ?auto_152819 ) ) ( not ( = ?auto_152814 ?auto_152815 ) ) ( not ( = ?auto_152814 ?auto_152816 ) ) ( not ( = ?auto_152814 ?auto_152817 ) ) ( not ( = ?auto_152814 ?auto_152818 ) ) ( not ( = ?auto_152814 ?auto_152819 ) ) ( not ( = ?auto_152815 ?auto_152816 ) ) ( not ( = ?auto_152815 ?auto_152817 ) ) ( not ( = ?auto_152815 ?auto_152818 ) ) ( not ( = ?auto_152815 ?auto_152819 ) ) ( not ( = ?auto_152816 ?auto_152817 ) ) ( not ( = ?auto_152816 ?auto_152818 ) ) ( not ( = ?auto_152816 ?auto_152819 ) ) ( not ( = ?auto_152817 ?auto_152818 ) ) ( not ( = ?auto_152817 ?auto_152819 ) ) ( not ( = ?auto_152818 ?auto_152819 ) ) ( ON ?auto_152817 ?auto_152818 ) ( ON ?auto_152816 ?auto_152817 ) ( ON ?auto_152815 ?auto_152816 ) ( ON ?auto_152814 ?auto_152815 ) ( ON ?auto_152813 ?auto_152814 ) ( ON ?auto_152812 ?auto_152813 ) ( ON ?auto_152811 ?auto_152812 ) ( ON ?auto_152810 ?auto_152811 ) ( ON ?auto_152809 ?auto_152810 ) ( ON ?auto_152808 ?auto_152809 ) ( ON ?auto_152807 ?auto_152808 ) ( CLEAR ?auto_152807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_152807 )
      ( MAKE-12PILE ?auto_152807 ?auto_152808 ?auto_152809 ?auto_152810 ?auto_152811 ?auto_152812 ?auto_152813 ?auto_152814 ?auto_152815 ?auto_152816 ?auto_152817 ?auto_152818 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_152832 - BLOCK
      ?auto_152833 - BLOCK
      ?auto_152834 - BLOCK
      ?auto_152835 - BLOCK
      ?auto_152836 - BLOCK
      ?auto_152837 - BLOCK
      ?auto_152838 - BLOCK
      ?auto_152839 - BLOCK
      ?auto_152840 - BLOCK
      ?auto_152841 - BLOCK
      ?auto_152842 - BLOCK
      ?auto_152843 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152843 ) ( not ( = ?auto_152832 ?auto_152833 ) ) ( not ( = ?auto_152832 ?auto_152834 ) ) ( not ( = ?auto_152832 ?auto_152835 ) ) ( not ( = ?auto_152832 ?auto_152836 ) ) ( not ( = ?auto_152832 ?auto_152837 ) ) ( not ( = ?auto_152832 ?auto_152838 ) ) ( not ( = ?auto_152832 ?auto_152839 ) ) ( not ( = ?auto_152832 ?auto_152840 ) ) ( not ( = ?auto_152832 ?auto_152841 ) ) ( not ( = ?auto_152832 ?auto_152842 ) ) ( not ( = ?auto_152832 ?auto_152843 ) ) ( not ( = ?auto_152833 ?auto_152834 ) ) ( not ( = ?auto_152833 ?auto_152835 ) ) ( not ( = ?auto_152833 ?auto_152836 ) ) ( not ( = ?auto_152833 ?auto_152837 ) ) ( not ( = ?auto_152833 ?auto_152838 ) ) ( not ( = ?auto_152833 ?auto_152839 ) ) ( not ( = ?auto_152833 ?auto_152840 ) ) ( not ( = ?auto_152833 ?auto_152841 ) ) ( not ( = ?auto_152833 ?auto_152842 ) ) ( not ( = ?auto_152833 ?auto_152843 ) ) ( not ( = ?auto_152834 ?auto_152835 ) ) ( not ( = ?auto_152834 ?auto_152836 ) ) ( not ( = ?auto_152834 ?auto_152837 ) ) ( not ( = ?auto_152834 ?auto_152838 ) ) ( not ( = ?auto_152834 ?auto_152839 ) ) ( not ( = ?auto_152834 ?auto_152840 ) ) ( not ( = ?auto_152834 ?auto_152841 ) ) ( not ( = ?auto_152834 ?auto_152842 ) ) ( not ( = ?auto_152834 ?auto_152843 ) ) ( not ( = ?auto_152835 ?auto_152836 ) ) ( not ( = ?auto_152835 ?auto_152837 ) ) ( not ( = ?auto_152835 ?auto_152838 ) ) ( not ( = ?auto_152835 ?auto_152839 ) ) ( not ( = ?auto_152835 ?auto_152840 ) ) ( not ( = ?auto_152835 ?auto_152841 ) ) ( not ( = ?auto_152835 ?auto_152842 ) ) ( not ( = ?auto_152835 ?auto_152843 ) ) ( not ( = ?auto_152836 ?auto_152837 ) ) ( not ( = ?auto_152836 ?auto_152838 ) ) ( not ( = ?auto_152836 ?auto_152839 ) ) ( not ( = ?auto_152836 ?auto_152840 ) ) ( not ( = ?auto_152836 ?auto_152841 ) ) ( not ( = ?auto_152836 ?auto_152842 ) ) ( not ( = ?auto_152836 ?auto_152843 ) ) ( not ( = ?auto_152837 ?auto_152838 ) ) ( not ( = ?auto_152837 ?auto_152839 ) ) ( not ( = ?auto_152837 ?auto_152840 ) ) ( not ( = ?auto_152837 ?auto_152841 ) ) ( not ( = ?auto_152837 ?auto_152842 ) ) ( not ( = ?auto_152837 ?auto_152843 ) ) ( not ( = ?auto_152838 ?auto_152839 ) ) ( not ( = ?auto_152838 ?auto_152840 ) ) ( not ( = ?auto_152838 ?auto_152841 ) ) ( not ( = ?auto_152838 ?auto_152842 ) ) ( not ( = ?auto_152838 ?auto_152843 ) ) ( not ( = ?auto_152839 ?auto_152840 ) ) ( not ( = ?auto_152839 ?auto_152841 ) ) ( not ( = ?auto_152839 ?auto_152842 ) ) ( not ( = ?auto_152839 ?auto_152843 ) ) ( not ( = ?auto_152840 ?auto_152841 ) ) ( not ( = ?auto_152840 ?auto_152842 ) ) ( not ( = ?auto_152840 ?auto_152843 ) ) ( not ( = ?auto_152841 ?auto_152842 ) ) ( not ( = ?auto_152841 ?auto_152843 ) ) ( not ( = ?auto_152842 ?auto_152843 ) ) ( ON ?auto_152842 ?auto_152843 ) ( ON ?auto_152841 ?auto_152842 ) ( ON ?auto_152840 ?auto_152841 ) ( ON ?auto_152839 ?auto_152840 ) ( ON ?auto_152838 ?auto_152839 ) ( ON ?auto_152837 ?auto_152838 ) ( ON ?auto_152836 ?auto_152837 ) ( ON ?auto_152835 ?auto_152836 ) ( ON ?auto_152834 ?auto_152835 ) ( ON ?auto_152833 ?auto_152834 ) ( ON ?auto_152832 ?auto_152833 ) ( CLEAR ?auto_152832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_152832 )
      ( MAKE-12PILE ?auto_152832 ?auto_152833 ?auto_152834 ?auto_152835 ?auto_152836 ?auto_152837 ?auto_152838 ?auto_152839 ?auto_152840 ?auto_152841 ?auto_152842 ?auto_152843 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_152856 - BLOCK
      ?auto_152857 - BLOCK
      ?auto_152858 - BLOCK
      ?auto_152859 - BLOCK
      ?auto_152860 - BLOCK
      ?auto_152861 - BLOCK
      ?auto_152862 - BLOCK
      ?auto_152863 - BLOCK
      ?auto_152864 - BLOCK
      ?auto_152865 - BLOCK
      ?auto_152866 - BLOCK
      ?auto_152867 - BLOCK
    )
    :vars
    (
      ?auto_152868 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152856 ?auto_152857 ) ) ( not ( = ?auto_152856 ?auto_152858 ) ) ( not ( = ?auto_152856 ?auto_152859 ) ) ( not ( = ?auto_152856 ?auto_152860 ) ) ( not ( = ?auto_152856 ?auto_152861 ) ) ( not ( = ?auto_152856 ?auto_152862 ) ) ( not ( = ?auto_152856 ?auto_152863 ) ) ( not ( = ?auto_152856 ?auto_152864 ) ) ( not ( = ?auto_152856 ?auto_152865 ) ) ( not ( = ?auto_152856 ?auto_152866 ) ) ( not ( = ?auto_152856 ?auto_152867 ) ) ( not ( = ?auto_152857 ?auto_152858 ) ) ( not ( = ?auto_152857 ?auto_152859 ) ) ( not ( = ?auto_152857 ?auto_152860 ) ) ( not ( = ?auto_152857 ?auto_152861 ) ) ( not ( = ?auto_152857 ?auto_152862 ) ) ( not ( = ?auto_152857 ?auto_152863 ) ) ( not ( = ?auto_152857 ?auto_152864 ) ) ( not ( = ?auto_152857 ?auto_152865 ) ) ( not ( = ?auto_152857 ?auto_152866 ) ) ( not ( = ?auto_152857 ?auto_152867 ) ) ( not ( = ?auto_152858 ?auto_152859 ) ) ( not ( = ?auto_152858 ?auto_152860 ) ) ( not ( = ?auto_152858 ?auto_152861 ) ) ( not ( = ?auto_152858 ?auto_152862 ) ) ( not ( = ?auto_152858 ?auto_152863 ) ) ( not ( = ?auto_152858 ?auto_152864 ) ) ( not ( = ?auto_152858 ?auto_152865 ) ) ( not ( = ?auto_152858 ?auto_152866 ) ) ( not ( = ?auto_152858 ?auto_152867 ) ) ( not ( = ?auto_152859 ?auto_152860 ) ) ( not ( = ?auto_152859 ?auto_152861 ) ) ( not ( = ?auto_152859 ?auto_152862 ) ) ( not ( = ?auto_152859 ?auto_152863 ) ) ( not ( = ?auto_152859 ?auto_152864 ) ) ( not ( = ?auto_152859 ?auto_152865 ) ) ( not ( = ?auto_152859 ?auto_152866 ) ) ( not ( = ?auto_152859 ?auto_152867 ) ) ( not ( = ?auto_152860 ?auto_152861 ) ) ( not ( = ?auto_152860 ?auto_152862 ) ) ( not ( = ?auto_152860 ?auto_152863 ) ) ( not ( = ?auto_152860 ?auto_152864 ) ) ( not ( = ?auto_152860 ?auto_152865 ) ) ( not ( = ?auto_152860 ?auto_152866 ) ) ( not ( = ?auto_152860 ?auto_152867 ) ) ( not ( = ?auto_152861 ?auto_152862 ) ) ( not ( = ?auto_152861 ?auto_152863 ) ) ( not ( = ?auto_152861 ?auto_152864 ) ) ( not ( = ?auto_152861 ?auto_152865 ) ) ( not ( = ?auto_152861 ?auto_152866 ) ) ( not ( = ?auto_152861 ?auto_152867 ) ) ( not ( = ?auto_152862 ?auto_152863 ) ) ( not ( = ?auto_152862 ?auto_152864 ) ) ( not ( = ?auto_152862 ?auto_152865 ) ) ( not ( = ?auto_152862 ?auto_152866 ) ) ( not ( = ?auto_152862 ?auto_152867 ) ) ( not ( = ?auto_152863 ?auto_152864 ) ) ( not ( = ?auto_152863 ?auto_152865 ) ) ( not ( = ?auto_152863 ?auto_152866 ) ) ( not ( = ?auto_152863 ?auto_152867 ) ) ( not ( = ?auto_152864 ?auto_152865 ) ) ( not ( = ?auto_152864 ?auto_152866 ) ) ( not ( = ?auto_152864 ?auto_152867 ) ) ( not ( = ?auto_152865 ?auto_152866 ) ) ( not ( = ?auto_152865 ?auto_152867 ) ) ( not ( = ?auto_152866 ?auto_152867 ) ) ( ON ?auto_152856 ?auto_152868 ) ( not ( = ?auto_152867 ?auto_152868 ) ) ( not ( = ?auto_152866 ?auto_152868 ) ) ( not ( = ?auto_152865 ?auto_152868 ) ) ( not ( = ?auto_152864 ?auto_152868 ) ) ( not ( = ?auto_152863 ?auto_152868 ) ) ( not ( = ?auto_152862 ?auto_152868 ) ) ( not ( = ?auto_152861 ?auto_152868 ) ) ( not ( = ?auto_152860 ?auto_152868 ) ) ( not ( = ?auto_152859 ?auto_152868 ) ) ( not ( = ?auto_152858 ?auto_152868 ) ) ( not ( = ?auto_152857 ?auto_152868 ) ) ( not ( = ?auto_152856 ?auto_152868 ) ) ( ON ?auto_152857 ?auto_152856 ) ( ON ?auto_152858 ?auto_152857 ) ( ON ?auto_152859 ?auto_152858 ) ( ON ?auto_152860 ?auto_152859 ) ( ON ?auto_152861 ?auto_152860 ) ( ON ?auto_152862 ?auto_152861 ) ( ON ?auto_152863 ?auto_152862 ) ( ON ?auto_152864 ?auto_152863 ) ( ON ?auto_152865 ?auto_152864 ) ( ON ?auto_152866 ?auto_152865 ) ( ON ?auto_152867 ?auto_152866 ) ( CLEAR ?auto_152867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_152867 ?auto_152866 ?auto_152865 ?auto_152864 ?auto_152863 ?auto_152862 ?auto_152861 ?auto_152860 ?auto_152859 ?auto_152858 ?auto_152857 ?auto_152856 )
      ( MAKE-12PILE ?auto_152856 ?auto_152857 ?auto_152858 ?auto_152859 ?auto_152860 ?auto_152861 ?auto_152862 ?auto_152863 ?auto_152864 ?auto_152865 ?auto_152866 ?auto_152867 ) )
  )

)

