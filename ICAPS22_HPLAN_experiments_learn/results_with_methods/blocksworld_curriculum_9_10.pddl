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
      ?auto_61121 - BLOCK
    )
    :vars
    (
      ?auto_61122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61121 ?auto_61122 ) ( CLEAR ?auto_61121 ) ( HAND-EMPTY ) ( not ( = ?auto_61121 ?auto_61122 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61121 ?auto_61122 )
      ( !PUTDOWN ?auto_61121 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61124 - BLOCK
    )
    :vars
    (
      ?auto_61125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61124 ?auto_61125 ) ( CLEAR ?auto_61124 ) ( HAND-EMPTY ) ( not ( = ?auto_61124 ?auto_61125 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61124 ?auto_61125 )
      ( !PUTDOWN ?auto_61124 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61128 - BLOCK
      ?auto_61129 - BLOCK
    )
    :vars
    (
      ?auto_61130 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61128 ) ( ON ?auto_61129 ?auto_61130 ) ( CLEAR ?auto_61129 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61128 ) ( not ( = ?auto_61128 ?auto_61129 ) ) ( not ( = ?auto_61128 ?auto_61130 ) ) ( not ( = ?auto_61129 ?auto_61130 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61129 ?auto_61130 )
      ( !STACK ?auto_61129 ?auto_61128 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61133 - BLOCK
      ?auto_61134 - BLOCK
    )
    :vars
    (
      ?auto_61135 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61133 ) ( ON ?auto_61134 ?auto_61135 ) ( CLEAR ?auto_61134 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61133 ) ( not ( = ?auto_61133 ?auto_61134 ) ) ( not ( = ?auto_61133 ?auto_61135 ) ) ( not ( = ?auto_61134 ?auto_61135 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61134 ?auto_61135 )
      ( !STACK ?auto_61134 ?auto_61133 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61138 - BLOCK
      ?auto_61139 - BLOCK
    )
    :vars
    (
      ?auto_61140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61139 ?auto_61140 ) ( not ( = ?auto_61138 ?auto_61139 ) ) ( not ( = ?auto_61138 ?auto_61140 ) ) ( not ( = ?auto_61139 ?auto_61140 ) ) ( ON ?auto_61138 ?auto_61139 ) ( CLEAR ?auto_61138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61138 )
      ( MAKE-2PILE ?auto_61138 ?auto_61139 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61143 - BLOCK
      ?auto_61144 - BLOCK
    )
    :vars
    (
      ?auto_61145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61144 ?auto_61145 ) ( not ( = ?auto_61143 ?auto_61144 ) ) ( not ( = ?auto_61143 ?auto_61145 ) ) ( not ( = ?auto_61144 ?auto_61145 ) ) ( ON ?auto_61143 ?auto_61144 ) ( CLEAR ?auto_61143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61143 )
      ( MAKE-2PILE ?auto_61143 ?auto_61144 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61149 - BLOCK
      ?auto_61150 - BLOCK
      ?auto_61151 - BLOCK
    )
    :vars
    (
      ?auto_61152 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61150 ) ( ON ?auto_61151 ?auto_61152 ) ( CLEAR ?auto_61151 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61149 ) ( ON ?auto_61150 ?auto_61149 ) ( not ( = ?auto_61149 ?auto_61150 ) ) ( not ( = ?auto_61149 ?auto_61151 ) ) ( not ( = ?auto_61149 ?auto_61152 ) ) ( not ( = ?auto_61150 ?auto_61151 ) ) ( not ( = ?auto_61150 ?auto_61152 ) ) ( not ( = ?auto_61151 ?auto_61152 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61151 ?auto_61152 )
      ( !STACK ?auto_61151 ?auto_61150 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61156 - BLOCK
      ?auto_61157 - BLOCK
      ?auto_61158 - BLOCK
    )
    :vars
    (
      ?auto_61159 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61157 ) ( ON ?auto_61158 ?auto_61159 ) ( CLEAR ?auto_61158 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61156 ) ( ON ?auto_61157 ?auto_61156 ) ( not ( = ?auto_61156 ?auto_61157 ) ) ( not ( = ?auto_61156 ?auto_61158 ) ) ( not ( = ?auto_61156 ?auto_61159 ) ) ( not ( = ?auto_61157 ?auto_61158 ) ) ( not ( = ?auto_61157 ?auto_61159 ) ) ( not ( = ?auto_61158 ?auto_61159 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61158 ?auto_61159 )
      ( !STACK ?auto_61158 ?auto_61157 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61163 - BLOCK
      ?auto_61164 - BLOCK
      ?auto_61165 - BLOCK
    )
    :vars
    (
      ?auto_61166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61165 ?auto_61166 ) ( ON-TABLE ?auto_61163 ) ( not ( = ?auto_61163 ?auto_61164 ) ) ( not ( = ?auto_61163 ?auto_61165 ) ) ( not ( = ?auto_61163 ?auto_61166 ) ) ( not ( = ?auto_61164 ?auto_61165 ) ) ( not ( = ?auto_61164 ?auto_61166 ) ) ( not ( = ?auto_61165 ?auto_61166 ) ) ( CLEAR ?auto_61163 ) ( ON ?auto_61164 ?auto_61165 ) ( CLEAR ?auto_61164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61163 ?auto_61164 )
      ( MAKE-3PILE ?auto_61163 ?auto_61164 ?auto_61165 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61170 - BLOCK
      ?auto_61171 - BLOCK
      ?auto_61172 - BLOCK
    )
    :vars
    (
      ?auto_61173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61172 ?auto_61173 ) ( ON-TABLE ?auto_61170 ) ( not ( = ?auto_61170 ?auto_61171 ) ) ( not ( = ?auto_61170 ?auto_61172 ) ) ( not ( = ?auto_61170 ?auto_61173 ) ) ( not ( = ?auto_61171 ?auto_61172 ) ) ( not ( = ?auto_61171 ?auto_61173 ) ) ( not ( = ?auto_61172 ?auto_61173 ) ) ( CLEAR ?auto_61170 ) ( ON ?auto_61171 ?auto_61172 ) ( CLEAR ?auto_61171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61170 ?auto_61171 )
      ( MAKE-3PILE ?auto_61170 ?auto_61171 ?auto_61172 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61177 - BLOCK
      ?auto_61178 - BLOCK
      ?auto_61179 - BLOCK
    )
    :vars
    (
      ?auto_61180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61179 ?auto_61180 ) ( not ( = ?auto_61177 ?auto_61178 ) ) ( not ( = ?auto_61177 ?auto_61179 ) ) ( not ( = ?auto_61177 ?auto_61180 ) ) ( not ( = ?auto_61178 ?auto_61179 ) ) ( not ( = ?auto_61178 ?auto_61180 ) ) ( not ( = ?auto_61179 ?auto_61180 ) ) ( ON ?auto_61178 ?auto_61179 ) ( ON ?auto_61177 ?auto_61178 ) ( CLEAR ?auto_61177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61177 )
      ( MAKE-3PILE ?auto_61177 ?auto_61178 ?auto_61179 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61184 - BLOCK
      ?auto_61185 - BLOCK
      ?auto_61186 - BLOCK
    )
    :vars
    (
      ?auto_61187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61186 ?auto_61187 ) ( not ( = ?auto_61184 ?auto_61185 ) ) ( not ( = ?auto_61184 ?auto_61186 ) ) ( not ( = ?auto_61184 ?auto_61187 ) ) ( not ( = ?auto_61185 ?auto_61186 ) ) ( not ( = ?auto_61185 ?auto_61187 ) ) ( not ( = ?auto_61186 ?auto_61187 ) ) ( ON ?auto_61185 ?auto_61186 ) ( ON ?auto_61184 ?auto_61185 ) ( CLEAR ?auto_61184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61184 )
      ( MAKE-3PILE ?auto_61184 ?auto_61185 ?auto_61186 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61192 - BLOCK
      ?auto_61193 - BLOCK
      ?auto_61194 - BLOCK
      ?auto_61195 - BLOCK
    )
    :vars
    (
      ?auto_61196 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61194 ) ( ON ?auto_61195 ?auto_61196 ) ( CLEAR ?auto_61195 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61192 ) ( ON ?auto_61193 ?auto_61192 ) ( ON ?auto_61194 ?auto_61193 ) ( not ( = ?auto_61192 ?auto_61193 ) ) ( not ( = ?auto_61192 ?auto_61194 ) ) ( not ( = ?auto_61192 ?auto_61195 ) ) ( not ( = ?auto_61192 ?auto_61196 ) ) ( not ( = ?auto_61193 ?auto_61194 ) ) ( not ( = ?auto_61193 ?auto_61195 ) ) ( not ( = ?auto_61193 ?auto_61196 ) ) ( not ( = ?auto_61194 ?auto_61195 ) ) ( not ( = ?auto_61194 ?auto_61196 ) ) ( not ( = ?auto_61195 ?auto_61196 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61195 ?auto_61196 )
      ( !STACK ?auto_61195 ?auto_61194 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61201 - BLOCK
      ?auto_61202 - BLOCK
      ?auto_61203 - BLOCK
      ?auto_61204 - BLOCK
    )
    :vars
    (
      ?auto_61205 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61203 ) ( ON ?auto_61204 ?auto_61205 ) ( CLEAR ?auto_61204 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61201 ) ( ON ?auto_61202 ?auto_61201 ) ( ON ?auto_61203 ?auto_61202 ) ( not ( = ?auto_61201 ?auto_61202 ) ) ( not ( = ?auto_61201 ?auto_61203 ) ) ( not ( = ?auto_61201 ?auto_61204 ) ) ( not ( = ?auto_61201 ?auto_61205 ) ) ( not ( = ?auto_61202 ?auto_61203 ) ) ( not ( = ?auto_61202 ?auto_61204 ) ) ( not ( = ?auto_61202 ?auto_61205 ) ) ( not ( = ?auto_61203 ?auto_61204 ) ) ( not ( = ?auto_61203 ?auto_61205 ) ) ( not ( = ?auto_61204 ?auto_61205 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61204 ?auto_61205 )
      ( !STACK ?auto_61204 ?auto_61203 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61210 - BLOCK
      ?auto_61211 - BLOCK
      ?auto_61212 - BLOCK
      ?auto_61213 - BLOCK
    )
    :vars
    (
      ?auto_61214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61213 ?auto_61214 ) ( ON-TABLE ?auto_61210 ) ( ON ?auto_61211 ?auto_61210 ) ( not ( = ?auto_61210 ?auto_61211 ) ) ( not ( = ?auto_61210 ?auto_61212 ) ) ( not ( = ?auto_61210 ?auto_61213 ) ) ( not ( = ?auto_61210 ?auto_61214 ) ) ( not ( = ?auto_61211 ?auto_61212 ) ) ( not ( = ?auto_61211 ?auto_61213 ) ) ( not ( = ?auto_61211 ?auto_61214 ) ) ( not ( = ?auto_61212 ?auto_61213 ) ) ( not ( = ?auto_61212 ?auto_61214 ) ) ( not ( = ?auto_61213 ?auto_61214 ) ) ( CLEAR ?auto_61211 ) ( ON ?auto_61212 ?auto_61213 ) ( CLEAR ?auto_61212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61210 ?auto_61211 ?auto_61212 )
      ( MAKE-4PILE ?auto_61210 ?auto_61211 ?auto_61212 ?auto_61213 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61219 - BLOCK
      ?auto_61220 - BLOCK
      ?auto_61221 - BLOCK
      ?auto_61222 - BLOCK
    )
    :vars
    (
      ?auto_61223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61222 ?auto_61223 ) ( ON-TABLE ?auto_61219 ) ( ON ?auto_61220 ?auto_61219 ) ( not ( = ?auto_61219 ?auto_61220 ) ) ( not ( = ?auto_61219 ?auto_61221 ) ) ( not ( = ?auto_61219 ?auto_61222 ) ) ( not ( = ?auto_61219 ?auto_61223 ) ) ( not ( = ?auto_61220 ?auto_61221 ) ) ( not ( = ?auto_61220 ?auto_61222 ) ) ( not ( = ?auto_61220 ?auto_61223 ) ) ( not ( = ?auto_61221 ?auto_61222 ) ) ( not ( = ?auto_61221 ?auto_61223 ) ) ( not ( = ?auto_61222 ?auto_61223 ) ) ( CLEAR ?auto_61220 ) ( ON ?auto_61221 ?auto_61222 ) ( CLEAR ?auto_61221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61219 ?auto_61220 ?auto_61221 )
      ( MAKE-4PILE ?auto_61219 ?auto_61220 ?auto_61221 ?auto_61222 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61228 - BLOCK
      ?auto_61229 - BLOCK
      ?auto_61230 - BLOCK
      ?auto_61231 - BLOCK
    )
    :vars
    (
      ?auto_61232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61231 ?auto_61232 ) ( ON-TABLE ?auto_61228 ) ( not ( = ?auto_61228 ?auto_61229 ) ) ( not ( = ?auto_61228 ?auto_61230 ) ) ( not ( = ?auto_61228 ?auto_61231 ) ) ( not ( = ?auto_61228 ?auto_61232 ) ) ( not ( = ?auto_61229 ?auto_61230 ) ) ( not ( = ?auto_61229 ?auto_61231 ) ) ( not ( = ?auto_61229 ?auto_61232 ) ) ( not ( = ?auto_61230 ?auto_61231 ) ) ( not ( = ?auto_61230 ?auto_61232 ) ) ( not ( = ?auto_61231 ?auto_61232 ) ) ( ON ?auto_61230 ?auto_61231 ) ( CLEAR ?auto_61228 ) ( ON ?auto_61229 ?auto_61230 ) ( CLEAR ?auto_61229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61228 ?auto_61229 )
      ( MAKE-4PILE ?auto_61228 ?auto_61229 ?auto_61230 ?auto_61231 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61237 - BLOCK
      ?auto_61238 - BLOCK
      ?auto_61239 - BLOCK
      ?auto_61240 - BLOCK
    )
    :vars
    (
      ?auto_61241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61240 ?auto_61241 ) ( ON-TABLE ?auto_61237 ) ( not ( = ?auto_61237 ?auto_61238 ) ) ( not ( = ?auto_61237 ?auto_61239 ) ) ( not ( = ?auto_61237 ?auto_61240 ) ) ( not ( = ?auto_61237 ?auto_61241 ) ) ( not ( = ?auto_61238 ?auto_61239 ) ) ( not ( = ?auto_61238 ?auto_61240 ) ) ( not ( = ?auto_61238 ?auto_61241 ) ) ( not ( = ?auto_61239 ?auto_61240 ) ) ( not ( = ?auto_61239 ?auto_61241 ) ) ( not ( = ?auto_61240 ?auto_61241 ) ) ( ON ?auto_61239 ?auto_61240 ) ( CLEAR ?auto_61237 ) ( ON ?auto_61238 ?auto_61239 ) ( CLEAR ?auto_61238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61237 ?auto_61238 )
      ( MAKE-4PILE ?auto_61237 ?auto_61238 ?auto_61239 ?auto_61240 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61246 - BLOCK
      ?auto_61247 - BLOCK
      ?auto_61248 - BLOCK
      ?auto_61249 - BLOCK
    )
    :vars
    (
      ?auto_61250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61249 ?auto_61250 ) ( not ( = ?auto_61246 ?auto_61247 ) ) ( not ( = ?auto_61246 ?auto_61248 ) ) ( not ( = ?auto_61246 ?auto_61249 ) ) ( not ( = ?auto_61246 ?auto_61250 ) ) ( not ( = ?auto_61247 ?auto_61248 ) ) ( not ( = ?auto_61247 ?auto_61249 ) ) ( not ( = ?auto_61247 ?auto_61250 ) ) ( not ( = ?auto_61248 ?auto_61249 ) ) ( not ( = ?auto_61248 ?auto_61250 ) ) ( not ( = ?auto_61249 ?auto_61250 ) ) ( ON ?auto_61248 ?auto_61249 ) ( ON ?auto_61247 ?auto_61248 ) ( ON ?auto_61246 ?auto_61247 ) ( CLEAR ?auto_61246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61246 )
      ( MAKE-4PILE ?auto_61246 ?auto_61247 ?auto_61248 ?auto_61249 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61255 - BLOCK
      ?auto_61256 - BLOCK
      ?auto_61257 - BLOCK
      ?auto_61258 - BLOCK
    )
    :vars
    (
      ?auto_61259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61258 ?auto_61259 ) ( not ( = ?auto_61255 ?auto_61256 ) ) ( not ( = ?auto_61255 ?auto_61257 ) ) ( not ( = ?auto_61255 ?auto_61258 ) ) ( not ( = ?auto_61255 ?auto_61259 ) ) ( not ( = ?auto_61256 ?auto_61257 ) ) ( not ( = ?auto_61256 ?auto_61258 ) ) ( not ( = ?auto_61256 ?auto_61259 ) ) ( not ( = ?auto_61257 ?auto_61258 ) ) ( not ( = ?auto_61257 ?auto_61259 ) ) ( not ( = ?auto_61258 ?auto_61259 ) ) ( ON ?auto_61257 ?auto_61258 ) ( ON ?auto_61256 ?auto_61257 ) ( ON ?auto_61255 ?auto_61256 ) ( CLEAR ?auto_61255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61255 )
      ( MAKE-4PILE ?auto_61255 ?auto_61256 ?auto_61257 ?auto_61258 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61265 - BLOCK
      ?auto_61266 - BLOCK
      ?auto_61267 - BLOCK
      ?auto_61268 - BLOCK
      ?auto_61269 - BLOCK
    )
    :vars
    (
      ?auto_61270 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61268 ) ( ON ?auto_61269 ?auto_61270 ) ( CLEAR ?auto_61269 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61265 ) ( ON ?auto_61266 ?auto_61265 ) ( ON ?auto_61267 ?auto_61266 ) ( ON ?auto_61268 ?auto_61267 ) ( not ( = ?auto_61265 ?auto_61266 ) ) ( not ( = ?auto_61265 ?auto_61267 ) ) ( not ( = ?auto_61265 ?auto_61268 ) ) ( not ( = ?auto_61265 ?auto_61269 ) ) ( not ( = ?auto_61265 ?auto_61270 ) ) ( not ( = ?auto_61266 ?auto_61267 ) ) ( not ( = ?auto_61266 ?auto_61268 ) ) ( not ( = ?auto_61266 ?auto_61269 ) ) ( not ( = ?auto_61266 ?auto_61270 ) ) ( not ( = ?auto_61267 ?auto_61268 ) ) ( not ( = ?auto_61267 ?auto_61269 ) ) ( not ( = ?auto_61267 ?auto_61270 ) ) ( not ( = ?auto_61268 ?auto_61269 ) ) ( not ( = ?auto_61268 ?auto_61270 ) ) ( not ( = ?auto_61269 ?auto_61270 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61269 ?auto_61270 )
      ( !STACK ?auto_61269 ?auto_61268 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61276 - BLOCK
      ?auto_61277 - BLOCK
      ?auto_61278 - BLOCK
      ?auto_61279 - BLOCK
      ?auto_61280 - BLOCK
    )
    :vars
    (
      ?auto_61281 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61279 ) ( ON ?auto_61280 ?auto_61281 ) ( CLEAR ?auto_61280 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61276 ) ( ON ?auto_61277 ?auto_61276 ) ( ON ?auto_61278 ?auto_61277 ) ( ON ?auto_61279 ?auto_61278 ) ( not ( = ?auto_61276 ?auto_61277 ) ) ( not ( = ?auto_61276 ?auto_61278 ) ) ( not ( = ?auto_61276 ?auto_61279 ) ) ( not ( = ?auto_61276 ?auto_61280 ) ) ( not ( = ?auto_61276 ?auto_61281 ) ) ( not ( = ?auto_61277 ?auto_61278 ) ) ( not ( = ?auto_61277 ?auto_61279 ) ) ( not ( = ?auto_61277 ?auto_61280 ) ) ( not ( = ?auto_61277 ?auto_61281 ) ) ( not ( = ?auto_61278 ?auto_61279 ) ) ( not ( = ?auto_61278 ?auto_61280 ) ) ( not ( = ?auto_61278 ?auto_61281 ) ) ( not ( = ?auto_61279 ?auto_61280 ) ) ( not ( = ?auto_61279 ?auto_61281 ) ) ( not ( = ?auto_61280 ?auto_61281 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61280 ?auto_61281 )
      ( !STACK ?auto_61280 ?auto_61279 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61287 - BLOCK
      ?auto_61288 - BLOCK
      ?auto_61289 - BLOCK
      ?auto_61290 - BLOCK
      ?auto_61291 - BLOCK
    )
    :vars
    (
      ?auto_61292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61291 ?auto_61292 ) ( ON-TABLE ?auto_61287 ) ( ON ?auto_61288 ?auto_61287 ) ( ON ?auto_61289 ?auto_61288 ) ( not ( = ?auto_61287 ?auto_61288 ) ) ( not ( = ?auto_61287 ?auto_61289 ) ) ( not ( = ?auto_61287 ?auto_61290 ) ) ( not ( = ?auto_61287 ?auto_61291 ) ) ( not ( = ?auto_61287 ?auto_61292 ) ) ( not ( = ?auto_61288 ?auto_61289 ) ) ( not ( = ?auto_61288 ?auto_61290 ) ) ( not ( = ?auto_61288 ?auto_61291 ) ) ( not ( = ?auto_61288 ?auto_61292 ) ) ( not ( = ?auto_61289 ?auto_61290 ) ) ( not ( = ?auto_61289 ?auto_61291 ) ) ( not ( = ?auto_61289 ?auto_61292 ) ) ( not ( = ?auto_61290 ?auto_61291 ) ) ( not ( = ?auto_61290 ?auto_61292 ) ) ( not ( = ?auto_61291 ?auto_61292 ) ) ( CLEAR ?auto_61289 ) ( ON ?auto_61290 ?auto_61291 ) ( CLEAR ?auto_61290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61287 ?auto_61288 ?auto_61289 ?auto_61290 )
      ( MAKE-5PILE ?auto_61287 ?auto_61288 ?auto_61289 ?auto_61290 ?auto_61291 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61298 - BLOCK
      ?auto_61299 - BLOCK
      ?auto_61300 - BLOCK
      ?auto_61301 - BLOCK
      ?auto_61302 - BLOCK
    )
    :vars
    (
      ?auto_61303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61302 ?auto_61303 ) ( ON-TABLE ?auto_61298 ) ( ON ?auto_61299 ?auto_61298 ) ( ON ?auto_61300 ?auto_61299 ) ( not ( = ?auto_61298 ?auto_61299 ) ) ( not ( = ?auto_61298 ?auto_61300 ) ) ( not ( = ?auto_61298 ?auto_61301 ) ) ( not ( = ?auto_61298 ?auto_61302 ) ) ( not ( = ?auto_61298 ?auto_61303 ) ) ( not ( = ?auto_61299 ?auto_61300 ) ) ( not ( = ?auto_61299 ?auto_61301 ) ) ( not ( = ?auto_61299 ?auto_61302 ) ) ( not ( = ?auto_61299 ?auto_61303 ) ) ( not ( = ?auto_61300 ?auto_61301 ) ) ( not ( = ?auto_61300 ?auto_61302 ) ) ( not ( = ?auto_61300 ?auto_61303 ) ) ( not ( = ?auto_61301 ?auto_61302 ) ) ( not ( = ?auto_61301 ?auto_61303 ) ) ( not ( = ?auto_61302 ?auto_61303 ) ) ( CLEAR ?auto_61300 ) ( ON ?auto_61301 ?auto_61302 ) ( CLEAR ?auto_61301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61298 ?auto_61299 ?auto_61300 ?auto_61301 )
      ( MAKE-5PILE ?auto_61298 ?auto_61299 ?auto_61300 ?auto_61301 ?auto_61302 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61309 - BLOCK
      ?auto_61310 - BLOCK
      ?auto_61311 - BLOCK
      ?auto_61312 - BLOCK
      ?auto_61313 - BLOCK
    )
    :vars
    (
      ?auto_61314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61313 ?auto_61314 ) ( ON-TABLE ?auto_61309 ) ( ON ?auto_61310 ?auto_61309 ) ( not ( = ?auto_61309 ?auto_61310 ) ) ( not ( = ?auto_61309 ?auto_61311 ) ) ( not ( = ?auto_61309 ?auto_61312 ) ) ( not ( = ?auto_61309 ?auto_61313 ) ) ( not ( = ?auto_61309 ?auto_61314 ) ) ( not ( = ?auto_61310 ?auto_61311 ) ) ( not ( = ?auto_61310 ?auto_61312 ) ) ( not ( = ?auto_61310 ?auto_61313 ) ) ( not ( = ?auto_61310 ?auto_61314 ) ) ( not ( = ?auto_61311 ?auto_61312 ) ) ( not ( = ?auto_61311 ?auto_61313 ) ) ( not ( = ?auto_61311 ?auto_61314 ) ) ( not ( = ?auto_61312 ?auto_61313 ) ) ( not ( = ?auto_61312 ?auto_61314 ) ) ( not ( = ?auto_61313 ?auto_61314 ) ) ( ON ?auto_61312 ?auto_61313 ) ( CLEAR ?auto_61310 ) ( ON ?auto_61311 ?auto_61312 ) ( CLEAR ?auto_61311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61309 ?auto_61310 ?auto_61311 )
      ( MAKE-5PILE ?auto_61309 ?auto_61310 ?auto_61311 ?auto_61312 ?auto_61313 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61320 - BLOCK
      ?auto_61321 - BLOCK
      ?auto_61322 - BLOCK
      ?auto_61323 - BLOCK
      ?auto_61324 - BLOCK
    )
    :vars
    (
      ?auto_61325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61324 ?auto_61325 ) ( ON-TABLE ?auto_61320 ) ( ON ?auto_61321 ?auto_61320 ) ( not ( = ?auto_61320 ?auto_61321 ) ) ( not ( = ?auto_61320 ?auto_61322 ) ) ( not ( = ?auto_61320 ?auto_61323 ) ) ( not ( = ?auto_61320 ?auto_61324 ) ) ( not ( = ?auto_61320 ?auto_61325 ) ) ( not ( = ?auto_61321 ?auto_61322 ) ) ( not ( = ?auto_61321 ?auto_61323 ) ) ( not ( = ?auto_61321 ?auto_61324 ) ) ( not ( = ?auto_61321 ?auto_61325 ) ) ( not ( = ?auto_61322 ?auto_61323 ) ) ( not ( = ?auto_61322 ?auto_61324 ) ) ( not ( = ?auto_61322 ?auto_61325 ) ) ( not ( = ?auto_61323 ?auto_61324 ) ) ( not ( = ?auto_61323 ?auto_61325 ) ) ( not ( = ?auto_61324 ?auto_61325 ) ) ( ON ?auto_61323 ?auto_61324 ) ( CLEAR ?auto_61321 ) ( ON ?auto_61322 ?auto_61323 ) ( CLEAR ?auto_61322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61320 ?auto_61321 ?auto_61322 )
      ( MAKE-5PILE ?auto_61320 ?auto_61321 ?auto_61322 ?auto_61323 ?auto_61324 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61331 - BLOCK
      ?auto_61332 - BLOCK
      ?auto_61333 - BLOCK
      ?auto_61334 - BLOCK
      ?auto_61335 - BLOCK
    )
    :vars
    (
      ?auto_61336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61335 ?auto_61336 ) ( ON-TABLE ?auto_61331 ) ( not ( = ?auto_61331 ?auto_61332 ) ) ( not ( = ?auto_61331 ?auto_61333 ) ) ( not ( = ?auto_61331 ?auto_61334 ) ) ( not ( = ?auto_61331 ?auto_61335 ) ) ( not ( = ?auto_61331 ?auto_61336 ) ) ( not ( = ?auto_61332 ?auto_61333 ) ) ( not ( = ?auto_61332 ?auto_61334 ) ) ( not ( = ?auto_61332 ?auto_61335 ) ) ( not ( = ?auto_61332 ?auto_61336 ) ) ( not ( = ?auto_61333 ?auto_61334 ) ) ( not ( = ?auto_61333 ?auto_61335 ) ) ( not ( = ?auto_61333 ?auto_61336 ) ) ( not ( = ?auto_61334 ?auto_61335 ) ) ( not ( = ?auto_61334 ?auto_61336 ) ) ( not ( = ?auto_61335 ?auto_61336 ) ) ( ON ?auto_61334 ?auto_61335 ) ( ON ?auto_61333 ?auto_61334 ) ( CLEAR ?auto_61331 ) ( ON ?auto_61332 ?auto_61333 ) ( CLEAR ?auto_61332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61331 ?auto_61332 )
      ( MAKE-5PILE ?auto_61331 ?auto_61332 ?auto_61333 ?auto_61334 ?auto_61335 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61342 - BLOCK
      ?auto_61343 - BLOCK
      ?auto_61344 - BLOCK
      ?auto_61345 - BLOCK
      ?auto_61346 - BLOCK
    )
    :vars
    (
      ?auto_61347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61346 ?auto_61347 ) ( ON-TABLE ?auto_61342 ) ( not ( = ?auto_61342 ?auto_61343 ) ) ( not ( = ?auto_61342 ?auto_61344 ) ) ( not ( = ?auto_61342 ?auto_61345 ) ) ( not ( = ?auto_61342 ?auto_61346 ) ) ( not ( = ?auto_61342 ?auto_61347 ) ) ( not ( = ?auto_61343 ?auto_61344 ) ) ( not ( = ?auto_61343 ?auto_61345 ) ) ( not ( = ?auto_61343 ?auto_61346 ) ) ( not ( = ?auto_61343 ?auto_61347 ) ) ( not ( = ?auto_61344 ?auto_61345 ) ) ( not ( = ?auto_61344 ?auto_61346 ) ) ( not ( = ?auto_61344 ?auto_61347 ) ) ( not ( = ?auto_61345 ?auto_61346 ) ) ( not ( = ?auto_61345 ?auto_61347 ) ) ( not ( = ?auto_61346 ?auto_61347 ) ) ( ON ?auto_61345 ?auto_61346 ) ( ON ?auto_61344 ?auto_61345 ) ( CLEAR ?auto_61342 ) ( ON ?auto_61343 ?auto_61344 ) ( CLEAR ?auto_61343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61342 ?auto_61343 )
      ( MAKE-5PILE ?auto_61342 ?auto_61343 ?auto_61344 ?auto_61345 ?auto_61346 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61353 - BLOCK
      ?auto_61354 - BLOCK
      ?auto_61355 - BLOCK
      ?auto_61356 - BLOCK
      ?auto_61357 - BLOCK
    )
    :vars
    (
      ?auto_61358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61357 ?auto_61358 ) ( not ( = ?auto_61353 ?auto_61354 ) ) ( not ( = ?auto_61353 ?auto_61355 ) ) ( not ( = ?auto_61353 ?auto_61356 ) ) ( not ( = ?auto_61353 ?auto_61357 ) ) ( not ( = ?auto_61353 ?auto_61358 ) ) ( not ( = ?auto_61354 ?auto_61355 ) ) ( not ( = ?auto_61354 ?auto_61356 ) ) ( not ( = ?auto_61354 ?auto_61357 ) ) ( not ( = ?auto_61354 ?auto_61358 ) ) ( not ( = ?auto_61355 ?auto_61356 ) ) ( not ( = ?auto_61355 ?auto_61357 ) ) ( not ( = ?auto_61355 ?auto_61358 ) ) ( not ( = ?auto_61356 ?auto_61357 ) ) ( not ( = ?auto_61356 ?auto_61358 ) ) ( not ( = ?auto_61357 ?auto_61358 ) ) ( ON ?auto_61356 ?auto_61357 ) ( ON ?auto_61355 ?auto_61356 ) ( ON ?auto_61354 ?auto_61355 ) ( ON ?auto_61353 ?auto_61354 ) ( CLEAR ?auto_61353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61353 )
      ( MAKE-5PILE ?auto_61353 ?auto_61354 ?auto_61355 ?auto_61356 ?auto_61357 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61364 - BLOCK
      ?auto_61365 - BLOCK
      ?auto_61366 - BLOCK
      ?auto_61367 - BLOCK
      ?auto_61368 - BLOCK
    )
    :vars
    (
      ?auto_61369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61368 ?auto_61369 ) ( not ( = ?auto_61364 ?auto_61365 ) ) ( not ( = ?auto_61364 ?auto_61366 ) ) ( not ( = ?auto_61364 ?auto_61367 ) ) ( not ( = ?auto_61364 ?auto_61368 ) ) ( not ( = ?auto_61364 ?auto_61369 ) ) ( not ( = ?auto_61365 ?auto_61366 ) ) ( not ( = ?auto_61365 ?auto_61367 ) ) ( not ( = ?auto_61365 ?auto_61368 ) ) ( not ( = ?auto_61365 ?auto_61369 ) ) ( not ( = ?auto_61366 ?auto_61367 ) ) ( not ( = ?auto_61366 ?auto_61368 ) ) ( not ( = ?auto_61366 ?auto_61369 ) ) ( not ( = ?auto_61367 ?auto_61368 ) ) ( not ( = ?auto_61367 ?auto_61369 ) ) ( not ( = ?auto_61368 ?auto_61369 ) ) ( ON ?auto_61367 ?auto_61368 ) ( ON ?auto_61366 ?auto_61367 ) ( ON ?auto_61365 ?auto_61366 ) ( ON ?auto_61364 ?auto_61365 ) ( CLEAR ?auto_61364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61364 )
      ( MAKE-5PILE ?auto_61364 ?auto_61365 ?auto_61366 ?auto_61367 ?auto_61368 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61376 - BLOCK
      ?auto_61377 - BLOCK
      ?auto_61378 - BLOCK
      ?auto_61379 - BLOCK
      ?auto_61380 - BLOCK
      ?auto_61381 - BLOCK
    )
    :vars
    (
      ?auto_61382 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61380 ) ( ON ?auto_61381 ?auto_61382 ) ( CLEAR ?auto_61381 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61376 ) ( ON ?auto_61377 ?auto_61376 ) ( ON ?auto_61378 ?auto_61377 ) ( ON ?auto_61379 ?auto_61378 ) ( ON ?auto_61380 ?auto_61379 ) ( not ( = ?auto_61376 ?auto_61377 ) ) ( not ( = ?auto_61376 ?auto_61378 ) ) ( not ( = ?auto_61376 ?auto_61379 ) ) ( not ( = ?auto_61376 ?auto_61380 ) ) ( not ( = ?auto_61376 ?auto_61381 ) ) ( not ( = ?auto_61376 ?auto_61382 ) ) ( not ( = ?auto_61377 ?auto_61378 ) ) ( not ( = ?auto_61377 ?auto_61379 ) ) ( not ( = ?auto_61377 ?auto_61380 ) ) ( not ( = ?auto_61377 ?auto_61381 ) ) ( not ( = ?auto_61377 ?auto_61382 ) ) ( not ( = ?auto_61378 ?auto_61379 ) ) ( not ( = ?auto_61378 ?auto_61380 ) ) ( not ( = ?auto_61378 ?auto_61381 ) ) ( not ( = ?auto_61378 ?auto_61382 ) ) ( not ( = ?auto_61379 ?auto_61380 ) ) ( not ( = ?auto_61379 ?auto_61381 ) ) ( not ( = ?auto_61379 ?auto_61382 ) ) ( not ( = ?auto_61380 ?auto_61381 ) ) ( not ( = ?auto_61380 ?auto_61382 ) ) ( not ( = ?auto_61381 ?auto_61382 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61381 ?auto_61382 )
      ( !STACK ?auto_61381 ?auto_61380 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61389 - BLOCK
      ?auto_61390 - BLOCK
      ?auto_61391 - BLOCK
      ?auto_61392 - BLOCK
      ?auto_61393 - BLOCK
      ?auto_61394 - BLOCK
    )
    :vars
    (
      ?auto_61395 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61393 ) ( ON ?auto_61394 ?auto_61395 ) ( CLEAR ?auto_61394 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61389 ) ( ON ?auto_61390 ?auto_61389 ) ( ON ?auto_61391 ?auto_61390 ) ( ON ?auto_61392 ?auto_61391 ) ( ON ?auto_61393 ?auto_61392 ) ( not ( = ?auto_61389 ?auto_61390 ) ) ( not ( = ?auto_61389 ?auto_61391 ) ) ( not ( = ?auto_61389 ?auto_61392 ) ) ( not ( = ?auto_61389 ?auto_61393 ) ) ( not ( = ?auto_61389 ?auto_61394 ) ) ( not ( = ?auto_61389 ?auto_61395 ) ) ( not ( = ?auto_61390 ?auto_61391 ) ) ( not ( = ?auto_61390 ?auto_61392 ) ) ( not ( = ?auto_61390 ?auto_61393 ) ) ( not ( = ?auto_61390 ?auto_61394 ) ) ( not ( = ?auto_61390 ?auto_61395 ) ) ( not ( = ?auto_61391 ?auto_61392 ) ) ( not ( = ?auto_61391 ?auto_61393 ) ) ( not ( = ?auto_61391 ?auto_61394 ) ) ( not ( = ?auto_61391 ?auto_61395 ) ) ( not ( = ?auto_61392 ?auto_61393 ) ) ( not ( = ?auto_61392 ?auto_61394 ) ) ( not ( = ?auto_61392 ?auto_61395 ) ) ( not ( = ?auto_61393 ?auto_61394 ) ) ( not ( = ?auto_61393 ?auto_61395 ) ) ( not ( = ?auto_61394 ?auto_61395 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61394 ?auto_61395 )
      ( !STACK ?auto_61394 ?auto_61393 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61402 - BLOCK
      ?auto_61403 - BLOCK
      ?auto_61404 - BLOCK
      ?auto_61405 - BLOCK
      ?auto_61406 - BLOCK
      ?auto_61407 - BLOCK
    )
    :vars
    (
      ?auto_61408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61407 ?auto_61408 ) ( ON-TABLE ?auto_61402 ) ( ON ?auto_61403 ?auto_61402 ) ( ON ?auto_61404 ?auto_61403 ) ( ON ?auto_61405 ?auto_61404 ) ( not ( = ?auto_61402 ?auto_61403 ) ) ( not ( = ?auto_61402 ?auto_61404 ) ) ( not ( = ?auto_61402 ?auto_61405 ) ) ( not ( = ?auto_61402 ?auto_61406 ) ) ( not ( = ?auto_61402 ?auto_61407 ) ) ( not ( = ?auto_61402 ?auto_61408 ) ) ( not ( = ?auto_61403 ?auto_61404 ) ) ( not ( = ?auto_61403 ?auto_61405 ) ) ( not ( = ?auto_61403 ?auto_61406 ) ) ( not ( = ?auto_61403 ?auto_61407 ) ) ( not ( = ?auto_61403 ?auto_61408 ) ) ( not ( = ?auto_61404 ?auto_61405 ) ) ( not ( = ?auto_61404 ?auto_61406 ) ) ( not ( = ?auto_61404 ?auto_61407 ) ) ( not ( = ?auto_61404 ?auto_61408 ) ) ( not ( = ?auto_61405 ?auto_61406 ) ) ( not ( = ?auto_61405 ?auto_61407 ) ) ( not ( = ?auto_61405 ?auto_61408 ) ) ( not ( = ?auto_61406 ?auto_61407 ) ) ( not ( = ?auto_61406 ?auto_61408 ) ) ( not ( = ?auto_61407 ?auto_61408 ) ) ( CLEAR ?auto_61405 ) ( ON ?auto_61406 ?auto_61407 ) ( CLEAR ?auto_61406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61402 ?auto_61403 ?auto_61404 ?auto_61405 ?auto_61406 )
      ( MAKE-6PILE ?auto_61402 ?auto_61403 ?auto_61404 ?auto_61405 ?auto_61406 ?auto_61407 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61415 - BLOCK
      ?auto_61416 - BLOCK
      ?auto_61417 - BLOCK
      ?auto_61418 - BLOCK
      ?auto_61419 - BLOCK
      ?auto_61420 - BLOCK
    )
    :vars
    (
      ?auto_61421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61420 ?auto_61421 ) ( ON-TABLE ?auto_61415 ) ( ON ?auto_61416 ?auto_61415 ) ( ON ?auto_61417 ?auto_61416 ) ( ON ?auto_61418 ?auto_61417 ) ( not ( = ?auto_61415 ?auto_61416 ) ) ( not ( = ?auto_61415 ?auto_61417 ) ) ( not ( = ?auto_61415 ?auto_61418 ) ) ( not ( = ?auto_61415 ?auto_61419 ) ) ( not ( = ?auto_61415 ?auto_61420 ) ) ( not ( = ?auto_61415 ?auto_61421 ) ) ( not ( = ?auto_61416 ?auto_61417 ) ) ( not ( = ?auto_61416 ?auto_61418 ) ) ( not ( = ?auto_61416 ?auto_61419 ) ) ( not ( = ?auto_61416 ?auto_61420 ) ) ( not ( = ?auto_61416 ?auto_61421 ) ) ( not ( = ?auto_61417 ?auto_61418 ) ) ( not ( = ?auto_61417 ?auto_61419 ) ) ( not ( = ?auto_61417 ?auto_61420 ) ) ( not ( = ?auto_61417 ?auto_61421 ) ) ( not ( = ?auto_61418 ?auto_61419 ) ) ( not ( = ?auto_61418 ?auto_61420 ) ) ( not ( = ?auto_61418 ?auto_61421 ) ) ( not ( = ?auto_61419 ?auto_61420 ) ) ( not ( = ?auto_61419 ?auto_61421 ) ) ( not ( = ?auto_61420 ?auto_61421 ) ) ( CLEAR ?auto_61418 ) ( ON ?auto_61419 ?auto_61420 ) ( CLEAR ?auto_61419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61415 ?auto_61416 ?auto_61417 ?auto_61418 ?auto_61419 )
      ( MAKE-6PILE ?auto_61415 ?auto_61416 ?auto_61417 ?auto_61418 ?auto_61419 ?auto_61420 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61428 - BLOCK
      ?auto_61429 - BLOCK
      ?auto_61430 - BLOCK
      ?auto_61431 - BLOCK
      ?auto_61432 - BLOCK
      ?auto_61433 - BLOCK
    )
    :vars
    (
      ?auto_61434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61433 ?auto_61434 ) ( ON-TABLE ?auto_61428 ) ( ON ?auto_61429 ?auto_61428 ) ( ON ?auto_61430 ?auto_61429 ) ( not ( = ?auto_61428 ?auto_61429 ) ) ( not ( = ?auto_61428 ?auto_61430 ) ) ( not ( = ?auto_61428 ?auto_61431 ) ) ( not ( = ?auto_61428 ?auto_61432 ) ) ( not ( = ?auto_61428 ?auto_61433 ) ) ( not ( = ?auto_61428 ?auto_61434 ) ) ( not ( = ?auto_61429 ?auto_61430 ) ) ( not ( = ?auto_61429 ?auto_61431 ) ) ( not ( = ?auto_61429 ?auto_61432 ) ) ( not ( = ?auto_61429 ?auto_61433 ) ) ( not ( = ?auto_61429 ?auto_61434 ) ) ( not ( = ?auto_61430 ?auto_61431 ) ) ( not ( = ?auto_61430 ?auto_61432 ) ) ( not ( = ?auto_61430 ?auto_61433 ) ) ( not ( = ?auto_61430 ?auto_61434 ) ) ( not ( = ?auto_61431 ?auto_61432 ) ) ( not ( = ?auto_61431 ?auto_61433 ) ) ( not ( = ?auto_61431 ?auto_61434 ) ) ( not ( = ?auto_61432 ?auto_61433 ) ) ( not ( = ?auto_61432 ?auto_61434 ) ) ( not ( = ?auto_61433 ?auto_61434 ) ) ( ON ?auto_61432 ?auto_61433 ) ( CLEAR ?auto_61430 ) ( ON ?auto_61431 ?auto_61432 ) ( CLEAR ?auto_61431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61428 ?auto_61429 ?auto_61430 ?auto_61431 )
      ( MAKE-6PILE ?auto_61428 ?auto_61429 ?auto_61430 ?auto_61431 ?auto_61432 ?auto_61433 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61441 - BLOCK
      ?auto_61442 - BLOCK
      ?auto_61443 - BLOCK
      ?auto_61444 - BLOCK
      ?auto_61445 - BLOCK
      ?auto_61446 - BLOCK
    )
    :vars
    (
      ?auto_61447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61446 ?auto_61447 ) ( ON-TABLE ?auto_61441 ) ( ON ?auto_61442 ?auto_61441 ) ( ON ?auto_61443 ?auto_61442 ) ( not ( = ?auto_61441 ?auto_61442 ) ) ( not ( = ?auto_61441 ?auto_61443 ) ) ( not ( = ?auto_61441 ?auto_61444 ) ) ( not ( = ?auto_61441 ?auto_61445 ) ) ( not ( = ?auto_61441 ?auto_61446 ) ) ( not ( = ?auto_61441 ?auto_61447 ) ) ( not ( = ?auto_61442 ?auto_61443 ) ) ( not ( = ?auto_61442 ?auto_61444 ) ) ( not ( = ?auto_61442 ?auto_61445 ) ) ( not ( = ?auto_61442 ?auto_61446 ) ) ( not ( = ?auto_61442 ?auto_61447 ) ) ( not ( = ?auto_61443 ?auto_61444 ) ) ( not ( = ?auto_61443 ?auto_61445 ) ) ( not ( = ?auto_61443 ?auto_61446 ) ) ( not ( = ?auto_61443 ?auto_61447 ) ) ( not ( = ?auto_61444 ?auto_61445 ) ) ( not ( = ?auto_61444 ?auto_61446 ) ) ( not ( = ?auto_61444 ?auto_61447 ) ) ( not ( = ?auto_61445 ?auto_61446 ) ) ( not ( = ?auto_61445 ?auto_61447 ) ) ( not ( = ?auto_61446 ?auto_61447 ) ) ( ON ?auto_61445 ?auto_61446 ) ( CLEAR ?auto_61443 ) ( ON ?auto_61444 ?auto_61445 ) ( CLEAR ?auto_61444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61441 ?auto_61442 ?auto_61443 ?auto_61444 )
      ( MAKE-6PILE ?auto_61441 ?auto_61442 ?auto_61443 ?auto_61444 ?auto_61445 ?auto_61446 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61454 - BLOCK
      ?auto_61455 - BLOCK
      ?auto_61456 - BLOCK
      ?auto_61457 - BLOCK
      ?auto_61458 - BLOCK
      ?auto_61459 - BLOCK
    )
    :vars
    (
      ?auto_61460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61459 ?auto_61460 ) ( ON-TABLE ?auto_61454 ) ( ON ?auto_61455 ?auto_61454 ) ( not ( = ?auto_61454 ?auto_61455 ) ) ( not ( = ?auto_61454 ?auto_61456 ) ) ( not ( = ?auto_61454 ?auto_61457 ) ) ( not ( = ?auto_61454 ?auto_61458 ) ) ( not ( = ?auto_61454 ?auto_61459 ) ) ( not ( = ?auto_61454 ?auto_61460 ) ) ( not ( = ?auto_61455 ?auto_61456 ) ) ( not ( = ?auto_61455 ?auto_61457 ) ) ( not ( = ?auto_61455 ?auto_61458 ) ) ( not ( = ?auto_61455 ?auto_61459 ) ) ( not ( = ?auto_61455 ?auto_61460 ) ) ( not ( = ?auto_61456 ?auto_61457 ) ) ( not ( = ?auto_61456 ?auto_61458 ) ) ( not ( = ?auto_61456 ?auto_61459 ) ) ( not ( = ?auto_61456 ?auto_61460 ) ) ( not ( = ?auto_61457 ?auto_61458 ) ) ( not ( = ?auto_61457 ?auto_61459 ) ) ( not ( = ?auto_61457 ?auto_61460 ) ) ( not ( = ?auto_61458 ?auto_61459 ) ) ( not ( = ?auto_61458 ?auto_61460 ) ) ( not ( = ?auto_61459 ?auto_61460 ) ) ( ON ?auto_61458 ?auto_61459 ) ( ON ?auto_61457 ?auto_61458 ) ( CLEAR ?auto_61455 ) ( ON ?auto_61456 ?auto_61457 ) ( CLEAR ?auto_61456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61454 ?auto_61455 ?auto_61456 )
      ( MAKE-6PILE ?auto_61454 ?auto_61455 ?auto_61456 ?auto_61457 ?auto_61458 ?auto_61459 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61467 - BLOCK
      ?auto_61468 - BLOCK
      ?auto_61469 - BLOCK
      ?auto_61470 - BLOCK
      ?auto_61471 - BLOCK
      ?auto_61472 - BLOCK
    )
    :vars
    (
      ?auto_61473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61472 ?auto_61473 ) ( ON-TABLE ?auto_61467 ) ( ON ?auto_61468 ?auto_61467 ) ( not ( = ?auto_61467 ?auto_61468 ) ) ( not ( = ?auto_61467 ?auto_61469 ) ) ( not ( = ?auto_61467 ?auto_61470 ) ) ( not ( = ?auto_61467 ?auto_61471 ) ) ( not ( = ?auto_61467 ?auto_61472 ) ) ( not ( = ?auto_61467 ?auto_61473 ) ) ( not ( = ?auto_61468 ?auto_61469 ) ) ( not ( = ?auto_61468 ?auto_61470 ) ) ( not ( = ?auto_61468 ?auto_61471 ) ) ( not ( = ?auto_61468 ?auto_61472 ) ) ( not ( = ?auto_61468 ?auto_61473 ) ) ( not ( = ?auto_61469 ?auto_61470 ) ) ( not ( = ?auto_61469 ?auto_61471 ) ) ( not ( = ?auto_61469 ?auto_61472 ) ) ( not ( = ?auto_61469 ?auto_61473 ) ) ( not ( = ?auto_61470 ?auto_61471 ) ) ( not ( = ?auto_61470 ?auto_61472 ) ) ( not ( = ?auto_61470 ?auto_61473 ) ) ( not ( = ?auto_61471 ?auto_61472 ) ) ( not ( = ?auto_61471 ?auto_61473 ) ) ( not ( = ?auto_61472 ?auto_61473 ) ) ( ON ?auto_61471 ?auto_61472 ) ( ON ?auto_61470 ?auto_61471 ) ( CLEAR ?auto_61468 ) ( ON ?auto_61469 ?auto_61470 ) ( CLEAR ?auto_61469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61467 ?auto_61468 ?auto_61469 )
      ( MAKE-6PILE ?auto_61467 ?auto_61468 ?auto_61469 ?auto_61470 ?auto_61471 ?auto_61472 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61480 - BLOCK
      ?auto_61481 - BLOCK
      ?auto_61482 - BLOCK
      ?auto_61483 - BLOCK
      ?auto_61484 - BLOCK
      ?auto_61485 - BLOCK
    )
    :vars
    (
      ?auto_61486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61485 ?auto_61486 ) ( ON-TABLE ?auto_61480 ) ( not ( = ?auto_61480 ?auto_61481 ) ) ( not ( = ?auto_61480 ?auto_61482 ) ) ( not ( = ?auto_61480 ?auto_61483 ) ) ( not ( = ?auto_61480 ?auto_61484 ) ) ( not ( = ?auto_61480 ?auto_61485 ) ) ( not ( = ?auto_61480 ?auto_61486 ) ) ( not ( = ?auto_61481 ?auto_61482 ) ) ( not ( = ?auto_61481 ?auto_61483 ) ) ( not ( = ?auto_61481 ?auto_61484 ) ) ( not ( = ?auto_61481 ?auto_61485 ) ) ( not ( = ?auto_61481 ?auto_61486 ) ) ( not ( = ?auto_61482 ?auto_61483 ) ) ( not ( = ?auto_61482 ?auto_61484 ) ) ( not ( = ?auto_61482 ?auto_61485 ) ) ( not ( = ?auto_61482 ?auto_61486 ) ) ( not ( = ?auto_61483 ?auto_61484 ) ) ( not ( = ?auto_61483 ?auto_61485 ) ) ( not ( = ?auto_61483 ?auto_61486 ) ) ( not ( = ?auto_61484 ?auto_61485 ) ) ( not ( = ?auto_61484 ?auto_61486 ) ) ( not ( = ?auto_61485 ?auto_61486 ) ) ( ON ?auto_61484 ?auto_61485 ) ( ON ?auto_61483 ?auto_61484 ) ( ON ?auto_61482 ?auto_61483 ) ( CLEAR ?auto_61480 ) ( ON ?auto_61481 ?auto_61482 ) ( CLEAR ?auto_61481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61480 ?auto_61481 )
      ( MAKE-6PILE ?auto_61480 ?auto_61481 ?auto_61482 ?auto_61483 ?auto_61484 ?auto_61485 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61493 - BLOCK
      ?auto_61494 - BLOCK
      ?auto_61495 - BLOCK
      ?auto_61496 - BLOCK
      ?auto_61497 - BLOCK
      ?auto_61498 - BLOCK
    )
    :vars
    (
      ?auto_61499 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61498 ?auto_61499 ) ( ON-TABLE ?auto_61493 ) ( not ( = ?auto_61493 ?auto_61494 ) ) ( not ( = ?auto_61493 ?auto_61495 ) ) ( not ( = ?auto_61493 ?auto_61496 ) ) ( not ( = ?auto_61493 ?auto_61497 ) ) ( not ( = ?auto_61493 ?auto_61498 ) ) ( not ( = ?auto_61493 ?auto_61499 ) ) ( not ( = ?auto_61494 ?auto_61495 ) ) ( not ( = ?auto_61494 ?auto_61496 ) ) ( not ( = ?auto_61494 ?auto_61497 ) ) ( not ( = ?auto_61494 ?auto_61498 ) ) ( not ( = ?auto_61494 ?auto_61499 ) ) ( not ( = ?auto_61495 ?auto_61496 ) ) ( not ( = ?auto_61495 ?auto_61497 ) ) ( not ( = ?auto_61495 ?auto_61498 ) ) ( not ( = ?auto_61495 ?auto_61499 ) ) ( not ( = ?auto_61496 ?auto_61497 ) ) ( not ( = ?auto_61496 ?auto_61498 ) ) ( not ( = ?auto_61496 ?auto_61499 ) ) ( not ( = ?auto_61497 ?auto_61498 ) ) ( not ( = ?auto_61497 ?auto_61499 ) ) ( not ( = ?auto_61498 ?auto_61499 ) ) ( ON ?auto_61497 ?auto_61498 ) ( ON ?auto_61496 ?auto_61497 ) ( ON ?auto_61495 ?auto_61496 ) ( CLEAR ?auto_61493 ) ( ON ?auto_61494 ?auto_61495 ) ( CLEAR ?auto_61494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61493 ?auto_61494 )
      ( MAKE-6PILE ?auto_61493 ?auto_61494 ?auto_61495 ?auto_61496 ?auto_61497 ?auto_61498 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61506 - BLOCK
      ?auto_61507 - BLOCK
      ?auto_61508 - BLOCK
      ?auto_61509 - BLOCK
      ?auto_61510 - BLOCK
      ?auto_61511 - BLOCK
    )
    :vars
    (
      ?auto_61512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61511 ?auto_61512 ) ( not ( = ?auto_61506 ?auto_61507 ) ) ( not ( = ?auto_61506 ?auto_61508 ) ) ( not ( = ?auto_61506 ?auto_61509 ) ) ( not ( = ?auto_61506 ?auto_61510 ) ) ( not ( = ?auto_61506 ?auto_61511 ) ) ( not ( = ?auto_61506 ?auto_61512 ) ) ( not ( = ?auto_61507 ?auto_61508 ) ) ( not ( = ?auto_61507 ?auto_61509 ) ) ( not ( = ?auto_61507 ?auto_61510 ) ) ( not ( = ?auto_61507 ?auto_61511 ) ) ( not ( = ?auto_61507 ?auto_61512 ) ) ( not ( = ?auto_61508 ?auto_61509 ) ) ( not ( = ?auto_61508 ?auto_61510 ) ) ( not ( = ?auto_61508 ?auto_61511 ) ) ( not ( = ?auto_61508 ?auto_61512 ) ) ( not ( = ?auto_61509 ?auto_61510 ) ) ( not ( = ?auto_61509 ?auto_61511 ) ) ( not ( = ?auto_61509 ?auto_61512 ) ) ( not ( = ?auto_61510 ?auto_61511 ) ) ( not ( = ?auto_61510 ?auto_61512 ) ) ( not ( = ?auto_61511 ?auto_61512 ) ) ( ON ?auto_61510 ?auto_61511 ) ( ON ?auto_61509 ?auto_61510 ) ( ON ?auto_61508 ?auto_61509 ) ( ON ?auto_61507 ?auto_61508 ) ( ON ?auto_61506 ?auto_61507 ) ( CLEAR ?auto_61506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61506 )
      ( MAKE-6PILE ?auto_61506 ?auto_61507 ?auto_61508 ?auto_61509 ?auto_61510 ?auto_61511 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61519 - BLOCK
      ?auto_61520 - BLOCK
      ?auto_61521 - BLOCK
      ?auto_61522 - BLOCK
      ?auto_61523 - BLOCK
      ?auto_61524 - BLOCK
    )
    :vars
    (
      ?auto_61525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61524 ?auto_61525 ) ( not ( = ?auto_61519 ?auto_61520 ) ) ( not ( = ?auto_61519 ?auto_61521 ) ) ( not ( = ?auto_61519 ?auto_61522 ) ) ( not ( = ?auto_61519 ?auto_61523 ) ) ( not ( = ?auto_61519 ?auto_61524 ) ) ( not ( = ?auto_61519 ?auto_61525 ) ) ( not ( = ?auto_61520 ?auto_61521 ) ) ( not ( = ?auto_61520 ?auto_61522 ) ) ( not ( = ?auto_61520 ?auto_61523 ) ) ( not ( = ?auto_61520 ?auto_61524 ) ) ( not ( = ?auto_61520 ?auto_61525 ) ) ( not ( = ?auto_61521 ?auto_61522 ) ) ( not ( = ?auto_61521 ?auto_61523 ) ) ( not ( = ?auto_61521 ?auto_61524 ) ) ( not ( = ?auto_61521 ?auto_61525 ) ) ( not ( = ?auto_61522 ?auto_61523 ) ) ( not ( = ?auto_61522 ?auto_61524 ) ) ( not ( = ?auto_61522 ?auto_61525 ) ) ( not ( = ?auto_61523 ?auto_61524 ) ) ( not ( = ?auto_61523 ?auto_61525 ) ) ( not ( = ?auto_61524 ?auto_61525 ) ) ( ON ?auto_61523 ?auto_61524 ) ( ON ?auto_61522 ?auto_61523 ) ( ON ?auto_61521 ?auto_61522 ) ( ON ?auto_61520 ?auto_61521 ) ( ON ?auto_61519 ?auto_61520 ) ( CLEAR ?auto_61519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61519 )
      ( MAKE-6PILE ?auto_61519 ?auto_61520 ?auto_61521 ?auto_61522 ?auto_61523 ?auto_61524 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_61533 - BLOCK
      ?auto_61534 - BLOCK
      ?auto_61535 - BLOCK
      ?auto_61536 - BLOCK
      ?auto_61537 - BLOCK
      ?auto_61538 - BLOCK
      ?auto_61539 - BLOCK
    )
    :vars
    (
      ?auto_61540 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61538 ) ( ON ?auto_61539 ?auto_61540 ) ( CLEAR ?auto_61539 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61533 ) ( ON ?auto_61534 ?auto_61533 ) ( ON ?auto_61535 ?auto_61534 ) ( ON ?auto_61536 ?auto_61535 ) ( ON ?auto_61537 ?auto_61536 ) ( ON ?auto_61538 ?auto_61537 ) ( not ( = ?auto_61533 ?auto_61534 ) ) ( not ( = ?auto_61533 ?auto_61535 ) ) ( not ( = ?auto_61533 ?auto_61536 ) ) ( not ( = ?auto_61533 ?auto_61537 ) ) ( not ( = ?auto_61533 ?auto_61538 ) ) ( not ( = ?auto_61533 ?auto_61539 ) ) ( not ( = ?auto_61533 ?auto_61540 ) ) ( not ( = ?auto_61534 ?auto_61535 ) ) ( not ( = ?auto_61534 ?auto_61536 ) ) ( not ( = ?auto_61534 ?auto_61537 ) ) ( not ( = ?auto_61534 ?auto_61538 ) ) ( not ( = ?auto_61534 ?auto_61539 ) ) ( not ( = ?auto_61534 ?auto_61540 ) ) ( not ( = ?auto_61535 ?auto_61536 ) ) ( not ( = ?auto_61535 ?auto_61537 ) ) ( not ( = ?auto_61535 ?auto_61538 ) ) ( not ( = ?auto_61535 ?auto_61539 ) ) ( not ( = ?auto_61535 ?auto_61540 ) ) ( not ( = ?auto_61536 ?auto_61537 ) ) ( not ( = ?auto_61536 ?auto_61538 ) ) ( not ( = ?auto_61536 ?auto_61539 ) ) ( not ( = ?auto_61536 ?auto_61540 ) ) ( not ( = ?auto_61537 ?auto_61538 ) ) ( not ( = ?auto_61537 ?auto_61539 ) ) ( not ( = ?auto_61537 ?auto_61540 ) ) ( not ( = ?auto_61538 ?auto_61539 ) ) ( not ( = ?auto_61538 ?auto_61540 ) ) ( not ( = ?auto_61539 ?auto_61540 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61539 ?auto_61540 )
      ( !STACK ?auto_61539 ?auto_61538 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_61548 - BLOCK
      ?auto_61549 - BLOCK
      ?auto_61550 - BLOCK
      ?auto_61551 - BLOCK
      ?auto_61552 - BLOCK
      ?auto_61553 - BLOCK
      ?auto_61554 - BLOCK
    )
    :vars
    (
      ?auto_61555 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61553 ) ( ON ?auto_61554 ?auto_61555 ) ( CLEAR ?auto_61554 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61548 ) ( ON ?auto_61549 ?auto_61548 ) ( ON ?auto_61550 ?auto_61549 ) ( ON ?auto_61551 ?auto_61550 ) ( ON ?auto_61552 ?auto_61551 ) ( ON ?auto_61553 ?auto_61552 ) ( not ( = ?auto_61548 ?auto_61549 ) ) ( not ( = ?auto_61548 ?auto_61550 ) ) ( not ( = ?auto_61548 ?auto_61551 ) ) ( not ( = ?auto_61548 ?auto_61552 ) ) ( not ( = ?auto_61548 ?auto_61553 ) ) ( not ( = ?auto_61548 ?auto_61554 ) ) ( not ( = ?auto_61548 ?auto_61555 ) ) ( not ( = ?auto_61549 ?auto_61550 ) ) ( not ( = ?auto_61549 ?auto_61551 ) ) ( not ( = ?auto_61549 ?auto_61552 ) ) ( not ( = ?auto_61549 ?auto_61553 ) ) ( not ( = ?auto_61549 ?auto_61554 ) ) ( not ( = ?auto_61549 ?auto_61555 ) ) ( not ( = ?auto_61550 ?auto_61551 ) ) ( not ( = ?auto_61550 ?auto_61552 ) ) ( not ( = ?auto_61550 ?auto_61553 ) ) ( not ( = ?auto_61550 ?auto_61554 ) ) ( not ( = ?auto_61550 ?auto_61555 ) ) ( not ( = ?auto_61551 ?auto_61552 ) ) ( not ( = ?auto_61551 ?auto_61553 ) ) ( not ( = ?auto_61551 ?auto_61554 ) ) ( not ( = ?auto_61551 ?auto_61555 ) ) ( not ( = ?auto_61552 ?auto_61553 ) ) ( not ( = ?auto_61552 ?auto_61554 ) ) ( not ( = ?auto_61552 ?auto_61555 ) ) ( not ( = ?auto_61553 ?auto_61554 ) ) ( not ( = ?auto_61553 ?auto_61555 ) ) ( not ( = ?auto_61554 ?auto_61555 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61554 ?auto_61555 )
      ( !STACK ?auto_61554 ?auto_61553 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_61563 - BLOCK
      ?auto_61564 - BLOCK
      ?auto_61565 - BLOCK
      ?auto_61566 - BLOCK
      ?auto_61567 - BLOCK
      ?auto_61568 - BLOCK
      ?auto_61569 - BLOCK
    )
    :vars
    (
      ?auto_61570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61569 ?auto_61570 ) ( ON-TABLE ?auto_61563 ) ( ON ?auto_61564 ?auto_61563 ) ( ON ?auto_61565 ?auto_61564 ) ( ON ?auto_61566 ?auto_61565 ) ( ON ?auto_61567 ?auto_61566 ) ( not ( = ?auto_61563 ?auto_61564 ) ) ( not ( = ?auto_61563 ?auto_61565 ) ) ( not ( = ?auto_61563 ?auto_61566 ) ) ( not ( = ?auto_61563 ?auto_61567 ) ) ( not ( = ?auto_61563 ?auto_61568 ) ) ( not ( = ?auto_61563 ?auto_61569 ) ) ( not ( = ?auto_61563 ?auto_61570 ) ) ( not ( = ?auto_61564 ?auto_61565 ) ) ( not ( = ?auto_61564 ?auto_61566 ) ) ( not ( = ?auto_61564 ?auto_61567 ) ) ( not ( = ?auto_61564 ?auto_61568 ) ) ( not ( = ?auto_61564 ?auto_61569 ) ) ( not ( = ?auto_61564 ?auto_61570 ) ) ( not ( = ?auto_61565 ?auto_61566 ) ) ( not ( = ?auto_61565 ?auto_61567 ) ) ( not ( = ?auto_61565 ?auto_61568 ) ) ( not ( = ?auto_61565 ?auto_61569 ) ) ( not ( = ?auto_61565 ?auto_61570 ) ) ( not ( = ?auto_61566 ?auto_61567 ) ) ( not ( = ?auto_61566 ?auto_61568 ) ) ( not ( = ?auto_61566 ?auto_61569 ) ) ( not ( = ?auto_61566 ?auto_61570 ) ) ( not ( = ?auto_61567 ?auto_61568 ) ) ( not ( = ?auto_61567 ?auto_61569 ) ) ( not ( = ?auto_61567 ?auto_61570 ) ) ( not ( = ?auto_61568 ?auto_61569 ) ) ( not ( = ?auto_61568 ?auto_61570 ) ) ( not ( = ?auto_61569 ?auto_61570 ) ) ( CLEAR ?auto_61567 ) ( ON ?auto_61568 ?auto_61569 ) ( CLEAR ?auto_61568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61563 ?auto_61564 ?auto_61565 ?auto_61566 ?auto_61567 ?auto_61568 )
      ( MAKE-7PILE ?auto_61563 ?auto_61564 ?auto_61565 ?auto_61566 ?auto_61567 ?auto_61568 ?auto_61569 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_61578 - BLOCK
      ?auto_61579 - BLOCK
      ?auto_61580 - BLOCK
      ?auto_61581 - BLOCK
      ?auto_61582 - BLOCK
      ?auto_61583 - BLOCK
      ?auto_61584 - BLOCK
    )
    :vars
    (
      ?auto_61585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61584 ?auto_61585 ) ( ON-TABLE ?auto_61578 ) ( ON ?auto_61579 ?auto_61578 ) ( ON ?auto_61580 ?auto_61579 ) ( ON ?auto_61581 ?auto_61580 ) ( ON ?auto_61582 ?auto_61581 ) ( not ( = ?auto_61578 ?auto_61579 ) ) ( not ( = ?auto_61578 ?auto_61580 ) ) ( not ( = ?auto_61578 ?auto_61581 ) ) ( not ( = ?auto_61578 ?auto_61582 ) ) ( not ( = ?auto_61578 ?auto_61583 ) ) ( not ( = ?auto_61578 ?auto_61584 ) ) ( not ( = ?auto_61578 ?auto_61585 ) ) ( not ( = ?auto_61579 ?auto_61580 ) ) ( not ( = ?auto_61579 ?auto_61581 ) ) ( not ( = ?auto_61579 ?auto_61582 ) ) ( not ( = ?auto_61579 ?auto_61583 ) ) ( not ( = ?auto_61579 ?auto_61584 ) ) ( not ( = ?auto_61579 ?auto_61585 ) ) ( not ( = ?auto_61580 ?auto_61581 ) ) ( not ( = ?auto_61580 ?auto_61582 ) ) ( not ( = ?auto_61580 ?auto_61583 ) ) ( not ( = ?auto_61580 ?auto_61584 ) ) ( not ( = ?auto_61580 ?auto_61585 ) ) ( not ( = ?auto_61581 ?auto_61582 ) ) ( not ( = ?auto_61581 ?auto_61583 ) ) ( not ( = ?auto_61581 ?auto_61584 ) ) ( not ( = ?auto_61581 ?auto_61585 ) ) ( not ( = ?auto_61582 ?auto_61583 ) ) ( not ( = ?auto_61582 ?auto_61584 ) ) ( not ( = ?auto_61582 ?auto_61585 ) ) ( not ( = ?auto_61583 ?auto_61584 ) ) ( not ( = ?auto_61583 ?auto_61585 ) ) ( not ( = ?auto_61584 ?auto_61585 ) ) ( CLEAR ?auto_61582 ) ( ON ?auto_61583 ?auto_61584 ) ( CLEAR ?auto_61583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61578 ?auto_61579 ?auto_61580 ?auto_61581 ?auto_61582 ?auto_61583 )
      ( MAKE-7PILE ?auto_61578 ?auto_61579 ?auto_61580 ?auto_61581 ?auto_61582 ?auto_61583 ?auto_61584 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_61593 - BLOCK
      ?auto_61594 - BLOCK
      ?auto_61595 - BLOCK
      ?auto_61596 - BLOCK
      ?auto_61597 - BLOCK
      ?auto_61598 - BLOCK
      ?auto_61599 - BLOCK
    )
    :vars
    (
      ?auto_61600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61599 ?auto_61600 ) ( ON-TABLE ?auto_61593 ) ( ON ?auto_61594 ?auto_61593 ) ( ON ?auto_61595 ?auto_61594 ) ( ON ?auto_61596 ?auto_61595 ) ( not ( = ?auto_61593 ?auto_61594 ) ) ( not ( = ?auto_61593 ?auto_61595 ) ) ( not ( = ?auto_61593 ?auto_61596 ) ) ( not ( = ?auto_61593 ?auto_61597 ) ) ( not ( = ?auto_61593 ?auto_61598 ) ) ( not ( = ?auto_61593 ?auto_61599 ) ) ( not ( = ?auto_61593 ?auto_61600 ) ) ( not ( = ?auto_61594 ?auto_61595 ) ) ( not ( = ?auto_61594 ?auto_61596 ) ) ( not ( = ?auto_61594 ?auto_61597 ) ) ( not ( = ?auto_61594 ?auto_61598 ) ) ( not ( = ?auto_61594 ?auto_61599 ) ) ( not ( = ?auto_61594 ?auto_61600 ) ) ( not ( = ?auto_61595 ?auto_61596 ) ) ( not ( = ?auto_61595 ?auto_61597 ) ) ( not ( = ?auto_61595 ?auto_61598 ) ) ( not ( = ?auto_61595 ?auto_61599 ) ) ( not ( = ?auto_61595 ?auto_61600 ) ) ( not ( = ?auto_61596 ?auto_61597 ) ) ( not ( = ?auto_61596 ?auto_61598 ) ) ( not ( = ?auto_61596 ?auto_61599 ) ) ( not ( = ?auto_61596 ?auto_61600 ) ) ( not ( = ?auto_61597 ?auto_61598 ) ) ( not ( = ?auto_61597 ?auto_61599 ) ) ( not ( = ?auto_61597 ?auto_61600 ) ) ( not ( = ?auto_61598 ?auto_61599 ) ) ( not ( = ?auto_61598 ?auto_61600 ) ) ( not ( = ?auto_61599 ?auto_61600 ) ) ( ON ?auto_61598 ?auto_61599 ) ( CLEAR ?auto_61596 ) ( ON ?auto_61597 ?auto_61598 ) ( CLEAR ?auto_61597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61593 ?auto_61594 ?auto_61595 ?auto_61596 ?auto_61597 )
      ( MAKE-7PILE ?auto_61593 ?auto_61594 ?auto_61595 ?auto_61596 ?auto_61597 ?auto_61598 ?auto_61599 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_61608 - BLOCK
      ?auto_61609 - BLOCK
      ?auto_61610 - BLOCK
      ?auto_61611 - BLOCK
      ?auto_61612 - BLOCK
      ?auto_61613 - BLOCK
      ?auto_61614 - BLOCK
    )
    :vars
    (
      ?auto_61615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61614 ?auto_61615 ) ( ON-TABLE ?auto_61608 ) ( ON ?auto_61609 ?auto_61608 ) ( ON ?auto_61610 ?auto_61609 ) ( ON ?auto_61611 ?auto_61610 ) ( not ( = ?auto_61608 ?auto_61609 ) ) ( not ( = ?auto_61608 ?auto_61610 ) ) ( not ( = ?auto_61608 ?auto_61611 ) ) ( not ( = ?auto_61608 ?auto_61612 ) ) ( not ( = ?auto_61608 ?auto_61613 ) ) ( not ( = ?auto_61608 ?auto_61614 ) ) ( not ( = ?auto_61608 ?auto_61615 ) ) ( not ( = ?auto_61609 ?auto_61610 ) ) ( not ( = ?auto_61609 ?auto_61611 ) ) ( not ( = ?auto_61609 ?auto_61612 ) ) ( not ( = ?auto_61609 ?auto_61613 ) ) ( not ( = ?auto_61609 ?auto_61614 ) ) ( not ( = ?auto_61609 ?auto_61615 ) ) ( not ( = ?auto_61610 ?auto_61611 ) ) ( not ( = ?auto_61610 ?auto_61612 ) ) ( not ( = ?auto_61610 ?auto_61613 ) ) ( not ( = ?auto_61610 ?auto_61614 ) ) ( not ( = ?auto_61610 ?auto_61615 ) ) ( not ( = ?auto_61611 ?auto_61612 ) ) ( not ( = ?auto_61611 ?auto_61613 ) ) ( not ( = ?auto_61611 ?auto_61614 ) ) ( not ( = ?auto_61611 ?auto_61615 ) ) ( not ( = ?auto_61612 ?auto_61613 ) ) ( not ( = ?auto_61612 ?auto_61614 ) ) ( not ( = ?auto_61612 ?auto_61615 ) ) ( not ( = ?auto_61613 ?auto_61614 ) ) ( not ( = ?auto_61613 ?auto_61615 ) ) ( not ( = ?auto_61614 ?auto_61615 ) ) ( ON ?auto_61613 ?auto_61614 ) ( CLEAR ?auto_61611 ) ( ON ?auto_61612 ?auto_61613 ) ( CLEAR ?auto_61612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61608 ?auto_61609 ?auto_61610 ?auto_61611 ?auto_61612 )
      ( MAKE-7PILE ?auto_61608 ?auto_61609 ?auto_61610 ?auto_61611 ?auto_61612 ?auto_61613 ?auto_61614 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_61623 - BLOCK
      ?auto_61624 - BLOCK
      ?auto_61625 - BLOCK
      ?auto_61626 - BLOCK
      ?auto_61627 - BLOCK
      ?auto_61628 - BLOCK
      ?auto_61629 - BLOCK
    )
    :vars
    (
      ?auto_61630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61629 ?auto_61630 ) ( ON-TABLE ?auto_61623 ) ( ON ?auto_61624 ?auto_61623 ) ( ON ?auto_61625 ?auto_61624 ) ( not ( = ?auto_61623 ?auto_61624 ) ) ( not ( = ?auto_61623 ?auto_61625 ) ) ( not ( = ?auto_61623 ?auto_61626 ) ) ( not ( = ?auto_61623 ?auto_61627 ) ) ( not ( = ?auto_61623 ?auto_61628 ) ) ( not ( = ?auto_61623 ?auto_61629 ) ) ( not ( = ?auto_61623 ?auto_61630 ) ) ( not ( = ?auto_61624 ?auto_61625 ) ) ( not ( = ?auto_61624 ?auto_61626 ) ) ( not ( = ?auto_61624 ?auto_61627 ) ) ( not ( = ?auto_61624 ?auto_61628 ) ) ( not ( = ?auto_61624 ?auto_61629 ) ) ( not ( = ?auto_61624 ?auto_61630 ) ) ( not ( = ?auto_61625 ?auto_61626 ) ) ( not ( = ?auto_61625 ?auto_61627 ) ) ( not ( = ?auto_61625 ?auto_61628 ) ) ( not ( = ?auto_61625 ?auto_61629 ) ) ( not ( = ?auto_61625 ?auto_61630 ) ) ( not ( = ?auto_61626 ?auto_61627 ) ) ( not ( = ?auto_61626 ?auto_61628 ) ) ( not ( = ?auto_61626 ?auto_61629 ) ) ( not ( = ?auto_61626 ?auto_61630 ) ) ( not ( = ?auto_61627 ?auto_61628 ) ) ( not ( = ?auto_61627 ?auto_61629 ) ) ( not ( = ?auto_61627 ?auto_61630 ) ) ( not ( = ?auto_61628 ?auto_61629 ) ) ( not ( = ?auto_61628 ?auto_61630 ) ) ( not ( = ?auto_61629 ?auto_61630 ) ) ( ON ?auto_61628 ?auto_61629 ) ( ON ?auto_61627 ?auto_61628 ) ( CLEAR ?auto_61625 ) ( ON ?auto_61626 ?auto_61627 ) ( CLEAR ?auto_61626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61623 ?auto_61624 ?auto_61625 ?auto_61626 )
      ( MAKE-7PILE ?auto_61623 ?auto_61624 ?auto_61625 ?auto_61626 ?auto_61627 ?auto_61628 ?auto_61629 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_61638 - BLOCK
      ?auto_61639 - BLOCK
      ?auto_61640 - BLOCK
      ?auto_61641 - BLOCK
      ?auto_61642 - BLOCK
      ?auto_61643 - BLOCK
      ?auto_61644 - BLOCK
    )
    :vars
    (
      ?auto_61645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61644 ?auto_61645 ) ( ON-TABLE ?auto_61638 ) ( ON ?auto_61639 ?auto_61638 ) ( ON ?auto_61640 ?auto_61639 ) ( not ( = ?auto_61638 ?auto_61639 ) ) ( not ( = ?auto_61638 ?auto_61640 ) ) ( not ( = ?auto_61638 ?auto_61641 ) ) ( not ( = ?auto_61638 ?auto_61642 ) ) ( not ( = ?auto_61638 ?auto_61643 ) ) ( not ( = ?auto_61638 ?auto_61644 ) ) ( not ( = ?auto_61638 ?auto_61645 ) ) ( not ( = ?auto_61639 ?auto_61640 ) ) ( not ( = ?auto_61639 ?auto_61641 ) ) ( not ( = ?auto_61639 ?auto_61642 ) ) ( not ( = ?auto_61639 ?auto_61643 ) ) ( not ( = ?auto_61639 ?auto_61644 ) ) ( not ( = ?auto_61639 ?auto_61645 ) ) ( not ( = ?auto_61640 ?auto_61641 ) ) ( not ( = ?auto_61640 ?auto_61642 ) ) ( not ( = ?auto_61640 ?auto_61643 ) ) ( not ( = ?auto_61640 ?auto_61644 ) ) ( not ( = ?auto_61640 ?auto_61645 ) ) ( not ( = ?auto_61641 ?auto_61642 ) ) ( not ( = ?auto_61641 ?auto_61643 ) ) ( not ( = ?auto_61641 ?auto_61644 ) ) ( not ( = ?auto_61641 ?auto_61645 ) ) ( not ( = ?auto_61642 ?auto_61643 ) ) ( not ( = ?auto_61642 ?auto_61644 ) ) ( not ( = ?auto_61642 ?auto_61645 ) ) ( not ( = ?auto_61643 ?auto_61644 ) ) ( not ( = ?auto_61643 ?auto_61645 ) ) ( not ( = ?auto_61644 ?auto_61645 ) ) ( ON ?auto_61643 ?auto_61644 ) ( ON ?auto_61642 ?auto_61643 ) ( CLEAR ?auto_61640 ) ( ON ?auto_61641 ?auto_61642 ) ( CLEAR ?auto_61641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61638 ?auto_61639 ?auto_61640 ?auto_61641 )
      ( MAKE-7PILE ?auto_61638 ?auto_61639 ?auto_61640 ?auto_61641 ?auto_61642 ?auto_61643 ?auto_61644 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_61653 - BLOCK
      ?auto_61654 - BLOCK
      ?auto_61655 - BLOCK
      ?auto_61656 - BLOCK
      ?auto_61657 - BLOCK
      ?auto_61658 - BLOCK
      ?auto_61659 - BLOCK
    )
    :vars
    (
      ?auto_61660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61659 ?auto_61660 ) ( ON-TABLE ?auto_61653 ) ( ON ?auto_61654 ?auto_61653 ) ( not ( = ?auto_61653 ?auto_61654 ) ) ( not ( = ?auto_61653 ?auto_61655 ) ) ( not ( = ?auto_61653 ?auto_61656 ) ) ( not ( = ?auto_61653 ?auto_61657 ) ) ( not ( = ?auto_61653 ?auto_61658 ) ) ( not ( = ?auto_61653 ?auto_61659 ) ) ( not ( = ?auto_61653 ?auto_61660 ) ) ( not ( = ?auto_61654 ?auto_61655 ) ) ( not ( = ?auto_61654 ?auto_61656 ) ) ( not ( = ?auto_61654 ?auto_61657 ) ) ( not ( = ?auto_61654 ?auto_61658 ) ) ( not ( = ?auto_61654 ?auto_61659 ) ) ( not ( = ?auto_61654 ?auto_61660 ) ) ( not ( = ?auto_61655 ?auto_61656 ) ) ( not ( = ?auto_61655 ?auto_61657 ) ) ( not ( = ?auto_61655 ?auto_61658 ) ) ( not ( = ?auto_61655 ?auto_61659 ) ) ( not ( = ?auto_61655 ?auto_61660 ) ) ( not ( = ?auto_61656 ?auto_61657 ) ) ( not ( = ?auto_61656 ?auto_61658 ) ) ( not ( = ?auto_61656 ?auto_61659 ) ) ( not ( = ?auto_61656 ?auto_61660 ) ) ( not ( = ?auto_61657 ?auto_61658 ) ) ( not ( = ?auto_61657 ?auto_61659 ) ) ( not ( = ?auto_61657 ?auto_61660 ) ) ( not ( = ?auto_61658 ?auto_61659 ) ) ( not ( = ?auto_61658 ?auto_61660 ) ) ( not ( = ?auto_61659 ?auto_61660 ) ) ( ON ?auto_61658 ?auto_61659 ) ( ON ?auto_61657 ?auto_61658 ) ( ON ?auto_61656 ?auto_61657 ) ( CLEAR ?auto_61654 ) ( ON ?auto_61655 ?auto_61656 ) ( CLEAR ?auto_61655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61653 ?auto_61654 ?auto_61655 )
      ( MAKE-7PILE ?auto_61653 ?auto_61654 ?auto_61655 ?auto_61656 ?auto_61657 ?auto_61658 ?auto_61659 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_61668 - BLOCK
      ?auto_61669 - BLOCK
      ?auto_61670 - BLOCK
      ?auto_61671 - BLOCK
      ?auto_61672 - BLOCK
      ?auto_61673 - BLOCK
      ?auto_61674 - BLOCK
    )
    :vars
    (
      ?auto_61675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61674 ?auto_61675 ) ( ON-TABLE ?auto_61668 ) ( ON ?auto_61669 ?auto_61668 ) ( not ( = ?auto_61668 ?auto_61669 ) ) ( not ( = ?auto_61668 ?auto_61670 ) ) ( not ( = ?auto_61668 ?auto_61671 ) ) ( not ( = ?auto_61668 ?auto_61672 ) ) ( not ( = ?auto_61668 ?auto_61673 ) ) ( not ( = ?auto_61668 ?auto_61674 ) ) ( not ( = ?auto_61668 ?auto_61675 ) ) ( not ( = ?auto_61669 ?auto_61670 ) ) ( not ( = ?auto_61669 ?auto_61671 ) ) ( not ( = ?auto_61669 ?auto_61672 ) ) ( not ( = ?auto_61669 ?auto_61673 ) ) ( not ( = ?auto_61669 ?auto_61674 ) ) ( not ( = ?auto_61669 ?auto_61675 ) ) ( not ( = ?auto_61670 ?auto_61671 ) ) ( not ( = ?auto_61670 ?auto_61672 ) ) ( not ( = ?auto_61670 ?auto_61673 ) ) ( not ( = ?auto_61670 ?auto_61674 ) ) ( not ( = ?auto_61670 ?auto_61675 ) ) ( not ( = ?auto_61671 ?auto_61672 ) ) ( not ( = ?auto_61671 ?auto_61673 ) ) ( not ( = ?auto_61671 ?auto_61674 ) ) ( not ( = ?auto_61671 ?auto_61675 ) ) ( not ( = ?auto_61672 ?auto_61673 ) ) ( not ( = ?auto_61672 ?auto_61674 ) ) ( not ( = ?auto_61672 ?auto_61675 ) ) ( not ( = ?auto_61673 ?auto_61674 ) ) ( not ( = ?auto_61673 ?auto_61675 ) ) ( not ( = ?auto_61674 ?auto_61675 ) ) ( ON ?auto_61673 ?auto_61674 ) ( ON ?auto_61672 ?auto_61673 ) ( ON ?auto_61671 ?auto_61672 ) ( CLEAR ?auto_61669 ) ( ON ?auto_61670 ?auto_61671 ) ( CLEAR ?auto_61670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61668 ?auto_61669 ?auto_61670 )
      ( MAKE-7PILE ?auto_61668 ?auto_61669 ?auto_61670 ?auto_61671 ?auto_61672 ?auto_61673 ?auto_61674 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_61683 - BLOCK
      ?auto_61684 - BLOCK
      ?auto_61685 - BLOCK
      ?auto_61686 - BLOCK
      ?auto_61687 - BLOCK
      ?auto_61688 - BLOCK
      ?auto_61689 - BLOCK
    )
    :vars
    (
      ?auto_61690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61689 ?auto_61690 ) ( ON-TABLE ?auto_61683 ) ( not ( = ?auto_61683 ?auto_61684 ) ) ( not ( = ?auto_61683 ?auto_61685 ) ) ( not ( = ?auto_61683 ?auto_61686 ) ) ( not ( = ?auto_61683 ?auto_61687 ) ) ( not ( = ?auto_61683 ?auto_61688 ) ) ( not ( = ?auto_61683 ?auto_61689 ) ) ( not ( = ?auto_61683 ?auto_61690 ) ) ( not ( = ?auto_61684 ?auto_61685 ) ) ( not ( = ?auto_61684 ?auto_61686 ) ) ( not ( = ?auto_61684 ?auto_61687 ) ) ( not ( = ?auto_61684 ?auto_61688 ) ) ( not ( = ?auto_61684 ?auto_61689 ) ) ( not ( = ?auto_61684 ?auto_61690 ) ) ( not ( = ?auto_61685 ?auto_61686 ) ) ( not ( = ?auto_61685 ?auto_61687 ) ) ( not ( = ?auto_61685 ?auto_61688 ) ) ( not ( = ?auto_61685 ?auto_61689 ) ) ( not ( = ?auto_61685 ?auto_61690 ) ) ( not ( = ?auto_61686 ?auto_61687 ) ) ( not ( = ?auto_61686 ?auto_61688 ) ) ( not ( = ?auto_61686 ?auto_61689 ) ) ( not ( = ?auto_61686 ?auto_61690 ) ) ( not ( = ?auto_61687 ?auto_61688 ) ) ( not ( = ?auto_61687 ?auto_61689 ) ) ( not ( = ?auto_61687 ?auto_61690 ) ) ( not ( = ?auto_61688 ?auto_61689 ) ) ( not ( = ?auto_61688 ?auto_61690 ) ) ( not ( = ?auto_61689 ?auto_61690 ) ) ( ON ?auto_61688 ?auto_61689 ) ( ON ?auto_61687 ?auto_61688 ) ( ON ?auto_61686 ?auto_61687 ) ( ON ?auto_61685 ?auto_61686 ) ( CLEAR ?auto_61683 ) ( ON ?auto_61684 ?auto_61685 ) ( CLEAR ?auto_61684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61683 ?auto_61684 )
      ( MAKE-7PILE ?auto_61683 ?auto_61684 ?auto_61685 ?auto_61686 ?auto_61687 ?auto_61688 ?auto_61689 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_61698 - BLOCK
      ?auto_61699 - BLOCK
      ?auto_61700 - BLOCK
      ?auto_61701 - BLOCK
      ?auto_61702 - BLOCK
      ?auto_61703 - BLOCK
      ?auto_61704 - BLOCK
    )
    :vars
    (
      ?auto_61705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61704 ?auto_61705 ) ( ON-TABLE ?auto_61698 ) ( not ( = ?auto_61698 ?auto_61699 ) ) ( not ( = ?auto_61698 ?auto_61700 ) ) ( not ( = ?auto_61698 ?auto_61701 ) ) ( not ( = ?auto_61698 ?auto_61702 ) ) ( not ( = ?auto_61698 ?auto_61703 ) ) ( not ( = ?auto_61698 ?auto_61704 ) ) ( not ( = ?auto_61698 ?auto_61705 ) ) ( not ( = ?auto_61699 ?auto_61700 ) ) ( not ( = ?auto_61699 ?auto_61701 ) ) ( not ( = ?auto_61699 ?auto_61702 ) ) ( not ( = ?auto_61699 ?auto_61703 ) ) ( not ( = ?auto_61699 ?auto_61704 ) ) ( not ( = ?auto_61699 ?auto_61705 ) ) ( not ( = ?auto_61700 ?auto_61701 ) ) ( not ( = ?auto_61700 ?auto_61702 ) ) ( not ( = ?auto_61700 ?auto_61703 ) ) ( not ( = ?auto_61700 ?auto_61704 ) ) ( not ( = ?auto_61700 ?auto_61705 ) ) ( not ( = ?auto_61701 ?auto_61702 ) ) ( not ( = ?auto_61701 ?auto_61703 ) ) ( not ( = ?auto_61701 ?auto_61704 ) ) ( not ( = ?auto_61701 ?auto_61705 ) ) ( not ( = ?auto_61702 ?auto_61703 ) ) ( not ( = ?auto_61702 ?auto_61704 ) ) ( not ( = ?auto_61702 ?auto_61705 ) ) ( not ( = ?auto_61703 ?auto_61704 ) ) ( not ( = ?auto_61703 ?auto_61705 ) ) ( not ( = ?auto_61704 ?auto_61705 ) ) ( ON ?auto_61703 ?auto_61704 ) ( ON ?auto_61702 ?auto_61703 ) ( ON ?auto_61701 ?auto_61702 ) ( ON ?auto_61700 ?auto_61701 ) ( CLEAR ?auto_61698 ) ( ON ?auto_61699 ?auto_61700 ) ( CLEAR ?auto_61699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61698 ?auto_61699 )
      ( MAKE-7PILE ?auto_61698 ?auto_61699 ?auto_61700 ?auto_61701 ?auto_61702 ?auto_61703 ?auto_61704 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_61713 - BLOCK
      ?auto_61714 - BLOCK
      ?auto_61715 - BLOCK
      ?auto_61716 - BLOCK
      ?auto_61717 - BLOCK
      ?auto_61718 - BLOCK
      ?auto_61719 - BLOCK
    )
    :vars
    (
      ?auto_61720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61719 ?auto_61720 ) ( not ( = ?auto_61713 ?auto_61714 ) ) ( not ( = ?auto_61713 ?auto_61715 ) ) ( not ( = ?auto_61713 ?auto_61716 ) ) ( not ( = ?auto_61713 ?auto_61717 ) ) ( not ( = ?auto_61713 ?auto_61718 ) ) ( not ( = ?auto_61713 ?auto_61719 ) ) ( not ( = ?auto_61713 ?auto_61720 ) ) ( not ( = ?auto_61714 ?auto_61715 ) ) ( not ( = ?auto_61714 ?auto_61716 ) ) ( not ( = ?auto_61714 ?auto_61717 ) ) ( not ( = ?auto_61714 ?auto_61718 ) ) ( not ( = ?auto_61714 ?auto_61719 ) ) ( not ( = ?auto_61714 ?auto_61720 ) ) ( not ( = ?auto_61715 ?auto_61716 ) ) ( not ( = ?auto_61715 ?auto_61717 ) ) ( not ( = ?auto_61715 ?auto_61718 ) ) ( not ( = ?auto_61715 ?auto_61719 ) ) ( not ( = ?auto_61715 ?auto_61720 ) ) ( not ( = ?auto_61716 ?auto_61717 ) ) ( not ( = ?auto_61716 ?auto_61718 ) ) ( not ( = ?auto_61716 ?auto_61719 ) ) ( not ( = ?auto_61716 ?auto_61720 ) ) ( not ( = ?auto_61717 ?auto_61718 ) ) ( not ( = ?auto_61717 ?auto_61719 ) ) ( not ( = ?auto_61717 ?auto_61720 ) ) ( not ( = ?auto_61718 ?auto_61719 ) ) ( not ( = ?auto_61718 ?auto_61720 ) ) ( not ( = ?auto_61719 ?auto_61720 ) ) ( ON ?auto_61718 ?auto_61719 ) ( ON ?auto_61717 ?auto_61718 ) ( ON ?auto_61716 ?auto_61717 ) ( ON ?auto_61715 ?auto_61716 ) ( ON ?auto_61714 ?auto_61715 ) ( ON ?auto_61713 ?auto_61714 ) ( CLEAR ?auto_61713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61713 )
      ( MAKE-7PILE ?auto_61713 ?auto_61714 ?auto_61715 ?auto_61716 ?auto_61717 ?auto_61718 ?auto_61719 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_61728 - BLOCK
      ?auto_61729 - BLOCK
      ?auto_61730 - BLOCK
      ?auto_61731 - BLOCK
      ?auto_61732 - BLOCK
      ?auto_61733 - BLOCK
      ?auto_61734 - BLOCK
    )
    :vars
    (
      ?auto_61735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61734 ?auto_61735 ) ( not ( = ?auto_61728 ?auto_61729 ) ) ( not ( = ?auto_61728 ?auto_61730 ) ) ( not ( = ?auto_61728 ?auto_61731 ) ) ( not ( = ?auto_61728 ?auto_61732 ) ) ( not ( = ?auto_61728 ?auto_61733 ) ) ( not ( = ?auto_61728 ?auto_61734 ) ) ( not ( = ?auto_61728 ?auto_61735 ) ) ( not ( = ?auto_61729 ?auto_61730 ) ) ( not ( = ?auto_61729 ?auto_61731 ) ) ( not ( = ?auto_61729 ?auto_61732 ) ) ( not ( = ?auto_61729 ?auto_61733 ) ) ( not ( = ?auto_61729 ?auto_61734 ) ) ( not ( = ?auto_61729 ?auto_61735 ) ) ( not ( = ?auto_61730 ?auto_61731 ) ) ( not ( = ?auto_61730 ?auto_61732 ) ) ( not ( = ?auto_61730 ?auto_61733 ) ) ( not ( = ?auto_61730 ?auto_61734 ) ) ( not ( = ?auto_61730 ?auto_61735 ) ) ( not ( = ?auto_61731 ?auto_61732 ) ) ( not ( = ?auto_61731 ?auto_61733 ) ) ( not ( = ?auto_61731 ?auto_61734 ) ) ( not ( = ?auto_61731 ?auto_61735 ) ) ( not ( = ?auto_61732 ?auto_61733 ) ) ( not ( = ?auto_61732 ?auto_61734 ) ) ( not ( = ?auto_61732 ?auto_61735 ) ) ( not ( = ?auto_61733 ?auto_61734 ) ) ( not ( = ?auto_61733 ?auto_61735 ) ) ( not ( = ?auto_61734 ?auto_61735 ) ) ( ON ?auto_61733 ?auto_61734 ) ( ON ?auto_61732 ?auto_61733 ) ( ON ?auto_61731 ?auto_61732 ) ( ON ?auto_61730 ?auto_61731 ) ( ON ?auto_61729 ?auto_61730 ) ( ON ?auto_61728 ?auto_61729 ) ( CLEAR ?auto_61728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61728 )
      ( MAKE-7PILE ?auto_61728 ?auto_61729 ?auto_61730 ?auto_61731 ?auto_61732 ?auto_61733 ?auto_61734 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_61744 - BLOCK
      ?auto_61745 - BLOCK
      ?auto_61746 - BLOCK
      ?auto_61747 - BLOCK
      ?auto_61748 - BLOCK
      ?auto_61749 - BLOCK
      ?auto_61750 - BLOCK
      ?auto_61751 - BLOCK
    )
    :vars
    (
      ?auto_61752 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61750 ) ( ON ?auto_61751 ?auto_61752 ) ( CLEAR ?auto_61751 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61744 ) ( ON ?auto_61745 ?auto_61744 ) ( ON ?auto_61746 ?auto_61745 ) ( ON ?auto_61747 ?auto_61746 ) ( ON ?auto_61748 ?auto_61747 ) ( ON ?auto_61749 ?auto_61748 ) ( ON ?auto_61750 ?auto_61749 ) ( not ( = ?auto_61744 ?auto_61745 ) ) ( not ( = ?auto_61744 ?auto_61746 ) ) ( not ( = ?auto_61744 ?auto_61747 ) ) ( not ( = ?auto_61744 ?auto_61748 ) ) ( not ( = ?auto_61744 ?auto_61749 ) ) ( not ( = ?auto_61744 ?auto_61750 ) ) ( not ( = ?auto_61744 ?auto_61751 ) ) ( not ( = ?auto_61744 ?auto_61752 ) ) ( not ( = ?auto_61745 ?auto_61746 ) ) ( not ( = ?auto_61745 ?auto_61747 ) ) ( not ( = ?auto_61745 ?auto_61748 ) ) ( not ( = ?auto_61745 ?auto_61749 ) ) ( not ( = ?auto_61745 ?auto_61750 ) ) ( not ( = ?auto_61745 ?auto_61751 ) ) ( not ( = ?auto_61745 ?auto_61752 ) ) ( not ( = ?auto_61746 ?auto_61747 ) ) ( not ( = ?auto_61746 ?auto_61748 ) ) ( not ( = ?auto_61746 ?auto_61749 ) ) ( not ( = ?auto_61746 ?auto_61750 ) ) ( not ( = ?auto_61746 ?auto_61751 ) ) ( not ( = ?auto_61746 ?auto_61752 ) ) ( not ( = ?auto_61747 ?auto_61748 ) ) ( not ( = ?auto_61747 ?auto_61749 ) ) ( not ( = ?auto_61747 ?auto_61750 ) ) ( not ( = ?auto_61747 ?auto_61751 ) ) ( not ( = ?auto_61747 ?auto_61752 ) ) ( not ( = ?auto_61748 ?auto_61749 ) ) ( not ( = ?auto_61748 ?auto_61750 ) ) ( not ( = ?auto_61748 ?auto_61751 ) ) ( not ( = ?auto_61748 ?auto_61752 ) ) ( not ( = ?auto_61749 ?auto_61750 ) ) ( not ( = ?auto_61749 ?auto_61751 ) ) ( not ( = ?auto_61749 ?auto_61752 ) ) ( not ( = ?auto_61750 ?auto_61751 ) ) ( not ( = ?auto_61750 ?auto_61752 ) ) ( not ( = ?auto_61751 ?auto_61752 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61751 ?auto_61752 )
      ( !STACK ?auto_61751 ?auto_61750 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_61761 - BLOCK
      ?auto_61762 - BLOCK
      ?auto_61763 - BLOCK
      ?auto_61764 - BLOCK
      ?auto_61765 - BLOCK
      ?auto_61766 - BLOCK
      ?auto_61767 - BLOCK
      ?auto_61768 - BLOCK
    )
    :vars
    (
      ?auto_61769 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61767 ) ( ON ?auto_61768 ?auto_61769 ) ( CLEAR ?auto_61768 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61761 ) ( ON ?auto_61762 ?auto_61761 ) ( ON ?auto_61763 ?auto_61762 ) ( ON ?auto_61764 ?auto_61763 ) ( ON ?auto_61765 ?auto_61764 ) ( ON ?auto_61766 ?auto_61765 ) ( ON ?auto_61767 ?auto_61766 ) ( not ( = ?auto_61761 ?auto_61762 ) ) ( not ( = ?auto_61761 ?auto_61763 ) ) ( not ( = ?auto_61761 ?auto_61764 ) ) ( not ( = ?auto_61761 ?auto_61765 ) ) ( not ( = ?auto_61761 ?auto_61766 ) ) ( not ( = ?auto_61761 ?auto_61767 ) ) ( not ( = ?auto_61761 ?auto_61768 ) ) ( not ( = ?auto_61761 ?auto_61769 ) ) ( not ( = ?auto_61762 ?auto_61763 ) ) ( not ( = ?auto_61762 ?auto_61764 ) ) ( not ( = ?auto_61762 ?auto_61765 ) ) ( not ( = ?auto_61762 ?auto_61766 ) ) ( not ( = ?auto_61762 ?auto_61767 ) ) ( not ( = ?auto_61762 ?auto_61768 ) ) ( not ( = ?auto_61762 ?auto_61769 ) ) ( not ( = ?auto_61763 ?auto_61764 ) ) ( not ( = ?auto_61763 ?auto_61765 ) ) ( not ( = ?auto_61763 ?auto_61766 ) ) ( not ( = ?auto_61763 ?auto_61767 ) ) ( not ( = ?auto_61763 ?auto_61768 ) ) ( not ( = ?auto_61763 ?auto_61769 ) ) ( not ( = ?auto_61764 ?auto_61765 ) ) ( not ( = ?auto_61764 ?auto_61766 ) ) ( not ( = ?auto_61764 ?auto_61767 ) ) ( not ( = ?auto_61764 ?auto_61768 ) ) ( not ( = ?auto_61764 ?auto_61769 ) ) ( not ( = ?auto_61765 ?auto_61766 ) ) ( not ( = ?auto_61765 ?auto_61767 ) ) ( not ( = ?auto_61765 ?auto_61768 ) ) ( not ( = ?auto_61765 ?auto_61769 ) ) ( not ( = ?auto_61766 ?auto_61767 ) ) ( not ( = ?auto_61766 ?auto_61768 ) ) ( not ( = ?auto_61766 ?auto_61769 ) ) ( not ( = ?auto_61767 ?auto_61768 ) ) ( not ( = ?auto_61767 ?auto_61769 ) ) ( not ( = ?auto_61768 ?auto_61769 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61768 ?auto_61769 )
      ( !STACK ?auto_61768 ?auto_61767 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_61778 - BLOCK
      ?auto_61779 - BLOCK
      ?auto_61780 - BLOCK
      ?auto_61781 - BLOCK
      ?auto_61782 - BLOCK
      ?auto_61783 - BLOCK
      ?auto_61784 - BLOCK
      ?auto_61785 - BLOCK
    )
    :vars
    (
      ?auto_61786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61785 ?auto_61786 ) ( ON-TABLE ?auto_61778 ) ( ON ?auto_61779 ?auto_61778 ) ( ON ?auto_61780 ?auto_61779 ) ( ON ?auto_61781 ?auto_61780 ) ( ON ?auto_61782 ?auto_61781 ) ( ON ?auto_61783 ?auto_61782 ) ( not ( = ?auto_61778 ?auto_61779 ) ) ( not ( = ?auto_61778 ?auto_61780 ) ) ( not ( = ?auto_61778 ?auto_61781 ) ) ( not ( = ?auto_61778 ?auto_61782 ) ) ( not ( = ?auto_61778 ?auto_61783 ) ) ( not ( = ?auto_61778 ?auto_61784 ) ) ( not ( = ?auto_61778 ?auto_61785 ) ) ( not ( = ?auto_61778 ?auto_61786 ) ) ( not ( = ?auto_61779 ?auto_61780 ) ) ( not ( = ?auto_61779 ?auto_61781 ) ) ( not ( = ?auto_61779 ?auto_61782 ) ) ( not ( = ?auto_61779 ?auto_61783 ) ) ( not ( = ?auto_61779 ?auto_61784 ) ) ( not ( = ?auto_61779 ?auto_61785 ) ) ( not ( = ?auto_61779 ?auto_61786 ) ) ( not ( = ?auto_61780 ?auto_61781 ) ) ( not ( = ?auto_61780 ?auto_61782 ) ) ( not ( = ?auto_61780 ?auto_61783 ) ) ( not ( = ?auto_61780 ?auto_61784 ) ) ( not ( = ?auto_61780 ?auto_61785 ) ) ( not ( = ?auto_61780 ?auto_61786 ) ) ( not ( = ?auto_61781 ?auto_61782 ) ) ( not ( = ?auto_61781 ?auto_61783 ) ) ( not ( = ?auto_61781 ?auto_61784 ) ) ( not ( = ?auto_61781 ?auto_61785 ) ) ( not ( = ?auto_61781 ?auto_61786 ) ) ( not ( = ?auto_61782 ?auto_61783 ) ) ( not ( = ?auto_61782 ?auto_61784 ) ) ( not ( = ?auto_61782 ?auto_61785 ) ) ( not ( = ?auto_61782 ?auto_61786 ) ) ( not ( = ?auto_61783 ?auto_61784 ) ) ( not ( = ?auto_61783 ?auto_61785 ) ) ( not ( = ?auto_61783 ?auto_61786 ) ) ( not ( = ?auto_61784 ?auto_61785 ) ) ( not ( = ?auto_61784 ?auto_61786 ) ) ( not ( = ?auto_61785 ?auto_61786 ) ) ( CLEAR ?auto_61783 ) ( ON ?auto_61784 ?auto_61785 ) ( CLEAR ?auto_61784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_61778 ?auto_61779 ?auto_61780 ?auto_61781 ?auto_61782 ?auto_61783 ?auto_61784 )
      ( MAKE-8PILE ?auto_61778 ?auto_61779 ?auto_61780 ?auto_61781 ?auto_61782 ?auto_61783 ?auto_61784 ?auto_61785 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_61795 - BLOCK
      ?auto_61796 - BLOCK
      ?auto_61797 - BLOCK
      ?auto_61798 - BLOCK
      ?auto_61799 - BLOCK
      ?auto_61800 - BLOCK
      ?auto_61801 - BLOCK
      ?auto_61802 - BLOCK
    )
    :vars
    (
      ?auto_61803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61802 ?auto_61803 ) ( ON-TABLE ?auto_61795 ) ( ON ?auto_61796 ?auto_61795 ) ( ON ?auto_61797 ?auto_61796 ) ( ON ?auto_61798 ?auto_61797 ) ( ON ?auto_61799 ?auto_61798 ) ( ON ?auto_61800 ?auto_61799 ) ( not ( = ?auto_61795 ?auto_61796 ) ) ( not ( = ?auto_61795 ?auto_61797 ) ) ( not ( = ?auto_61795 ?auto_61798 ) ) ( not ( = ?auto_61795 ?auto_61799 ) ) ( not ( = ?auto_61795 ?auto_61800 ) ) ( not ( = ?auto_61795 ?auto_61801 ) ) ( not ( = ?auto_61795 ?auto_61802 ) ) ( not ( = ?auto_61795 ?auto_61803 ) ) ( not ( = ?auto_61796 ?auto_61797 ) ) ( not ( = ?auto_61796 ?auto_61798 ) ) ( not ( = ?auto_61796 ?auto_61799 ) ) ( not ( = ?auto_61796 ?auto_61800 ) ) ( not ( = ?auto_61796 ?auto_61801 ) ) ( not ( = ?auto_61796 ?auto_61802 ) ) ( not ( = ?auto_61796 ?auto_61803 ) ) ( not ( = ?auto_61797 ?auto_61798 ) ) ( not ( = ?auto_61797 ?auto_61799 ) ) ( not ( = ?auto_61797 ?auto_61800 ) ) ( not ( = ?auto_61797 ?auto_61801 ) ) ( not ( = ?auto_61797 ?auto_61802 ) ) ( not ( = ?auto_61797 ?auto_61803 ) ) ( not ( = ?auto_61798 ?auto_61799 ) ) ( not ( = ?auto_61798 ?auto_61800 ) ) ( not ( = ?auto_61798 ?auto_61801 ) ) ( not ( = ?auto_61798 ?auto_61802 ) ) ( not ( = ?auto_61798 ?auto_61803 ) ) ( not ( = ?auto_61799 ?auto_61800 ) ) ( not ( = ?auto_61799 ?auto_61801 ) ) ( not ( = ?auto_61799 ?auto_61802 ) ) ( not ( = ?auto_61799 ?auto_61803 ) ) ( not ( = ?auto_61800 ?auto_61801 ) ) ( not ( = ?auto_61800 ?auto_61802 ) ) ( not ( = ?auto_61800 ?auto_61803 ) ) ( not ( = ?auto_61801 ?auto_61802 ) ) ( not ( = ?auto_61801 ?auto_61803 ) ) ( not ( = ?auto_61802 ?auto_61803 ) ) ( CLEAR ?auto_61800 ) ( ON ?auto_61801 ?auto_61802 ) ( CLEAR ?auto_61801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_61795 ?auto_61796 ?auto_61797 ?auto_61798 ?auto_61799 ?auto_61800 ?auto_61801 )
      ( MAKE-8PILE ?auto_61795 ?auto_61796 ?auto_61797 ?auto_61798 ?auto_61799 ?auto_61800 ?auto_61801 ?auto_61802 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_61812 - BLOCK
      ?auto_61813 - BLOCK
      ?auto_61814 - BLOCK
      ?auto_61815 - BLOCK
      ?auto_61816 - BLOCK
      ?auto_61817 - BLOCK
      ?auto_61818 - BLOCK
      ?auto_61819 - BLOCK
    )
    :vars
    (
      ?auto_61820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61819 ?auto_61820 ) ( ON-TABLE ?auto_61812 ) ( ON ?auto_61813 ?auto_61812 ) ( ON ?auto_61814 ?auto_61813 ) ( ON ?auto_61815 ?auto_61814 ) ( ON ?auto_61816 ?auto_61815 ) ( not ( = ?auto_61812 ?auto_61813 ) ) ( not ( = ?auto_61812 ?auto_61814 ) ) ( not ( = ?auto_61812 ?auto_61815 ) ) ( not ( = ?auto_61812 ?auto_61816 ) ) ( not ( = ?auto_61812 ?auto_61817 ) ) ( not ( = ?auto_61812 ?auto_61818 ) ) ( not ( = ?auto_61812 ?auto_61819 ) ) ( not ( = ?auto_61812 ?auto_61820 ) ) ( not ( = ?auto_61813 ?auto_61814 ) ) ( not ( = ?auto_61813 ?auto_61815 ) ) ( not ( = ?auto_61813 ?auto_61816 ) ) ( not ( = ?auto_61813 ?auto_61817 ) ) ( not ( = ?auto_61813 ?auto_61818 ) ) ( not ( = ?auto_61813 ?auto_61819 ) ) ( not ( = ?auto_61813 ?auto_61820 ) ) ( not ( = ?auto_61814 ?auto_61815 ) ) ( not ( = ?auto_61814 ?auto_61816 ) ) ( not ( = ?auto_61814 ?auto_61817 ) ) ( not ( = ?auto_61814 ?auto_61818 ) ) ( not ( = ?auto_61814 ?auto_61819 ) ) ( not ( = ?auto_61814 ?auto_61820 ) ) ( not ( = ?auto_61815 ?auto_61816 ) ) ( not ( = ?auto_61815 ?auto_61817 ) ) ( not ( = ?auto_61815 ?auto_61818 ) ) ( not ( = ?auto_61815 ?auto_61819 ) ) ( not ( = ?auto_61815 ?auto_61820 ) ) ( not ( = ?auto_61816 ?auto_61817 ) ) ( not ( = ?auto_61816 ?auto_61818 ) ) ( not ( = ?auto_61816 ?auto_61819 ) ) ( not ( = ?auto_61816 ?auto_61820 ) ) ( not ( = ?auto_61817 ?auto_61818 ) ) ( not ( = ?auto_61817 ?auto_61819 ) ) ( not ( = ?auto_61817 ?auto_61820 ) ) ( not ( = ?auto_61818 ?auto_61819 ) ) ( not ( = ?auto_61818 ?auto_61820 ) ) ( not ( = ?auto_61819 ?auto_61820 ) ) ( ON ?auto_61818 ?auto_61819 ) ( CLEAR ?auto_61816 ) ( ON ?auto_61817 ?auto_61818 ) ( CLEAR ?auto_61817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61812 ?auto_61813 ?auto_61814 ?auto_61815 ?auto_61816 ?auto_61817 )
      ( MAKE-8PILE ?auto_61812 ?auto_61813 ?auto_61814 ?auto_61815 ?auto_61816 ?auto_61817 ?auto_61818 ?auto_61819 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_61829 - BLOCK
      ?auto_61830 - BLOCK
      ?auto_61831 - BLOCK
      ?auto_61832 - BLOCK
      ?auto_61833 - BLOCK
      ?auto_61834 - BLOCK
      ?auto_61835 - BLOCK
      ?auto_61836 - BLOCK
    )
    :vars
    (
      ?auto_61837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61836 ?auto_61837 ) ( ON-TABLE ?auto_61829 ) ( ON ?auto_61830 ?auto_61829 ) ( ON ?auto_61831 ?auto_61830 ) ( ON ?auto_61832 ?auto_61831 ) ( ON ?auto_61833 ?auto_61832 ) ( not ( = ?auto_61829 ?auto_61830 ) ) ( not ( = ?auto_61829 ?auto_61831 ) ) ( not ( = ?auto_61829 ?auto_61832 ) ) ( not ( = ?auto_61829 ?auto_61833 ) ) ( not ( = ?auto_61829 ?auto_61834 ) ) ( not ( = ?auto_61829 ?auto_61835 ) ) ( not ( = ?auto_61829 ?auto_61836 ) ) ( not ( = ?auto_61829 ?auto_61837 ) ) ( not ( = ?auto_61830 ?auto_61831 ) ) ( not ( = ?auto_61830 ?auto_61832 ) ) ( not ( = ?auto_61830 ?auto_61833 ) ) ( not ( = ?auto_61830 ?auto_61834 ) ) ( not ( = ?auto_61830 ?auto_61835 ) ) ( not ( = ?auto_61830 ?auto_61836 ) ) ( not ( = ?auto_61830 ?auto_61837 ) ) ( not ( = ?auto_61831 ?auto_61832 ) ) ( not ( = ?auto_61831 ?auto_61833 ) ) ( not ( = ?auto_61831 ?auto_61834 ) ) ( not ( = ?auto_61831 ?auto_61835 ) ) ( not ( = ?auto_61831 ?auto_61836 ) ) ( not ( = ?auto_61831 ?auto_61837 ) ) ( not ( = ?auto_61832 ?auto_61833 ) ) ( not ( = ?auto_61832 ?auto_61834 ) ) ( not ( = ?auto_61832 ?auto_61835 ) ) ( not ( = ?auto_61832 ?auto_61836 ) ) ( not ( = ?auto_61832 ?auto_61837 ) ) ( not ( = ?auto_61833 ?auto_61834 ) ) ( not ( = ?auto_61833 ?auto_61835 ) ) ( not ( = ?auto_61833 ?auto_61836 ) ) ( not ( = ?auto_61833 ?auto_61837 ) ) ( not ( = ?auto_61834 ?auto_61835 ) ) ( not ( = ?auto_61834 ?auto_61836 ) ) ( not ( = ?auto_61834 ?auto_61837 ) ) ( not ( = ?auto_61835 ?auto_61836 ) ) ( not ( = ?auto_61835 ?auto_61837 ) ) ( not ( = ?auto_61836 ?auto_61837 ) ) ( ON ?auto_61835 ?auto_61836 ) ( CLEAR ?auto_61833 ) ( ON ?auto_61834 ?auto_61835 ) ( CLEAR ?auto_61834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61829 ?auto_61830 ?auto_61831 ?auto_61832 ?auto_61833 ?auto_61834 )
      ( MAKE-8PILE ?auto_61829 ?auto_61830 ?auto_61831 ?auto_61832 ?auto_61833 ?auto_61834 ?auto_61835 ?auto_61836 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_61846 - BLOCK
      ?auto_61847 - BLOCK
      ?auto_61848 - BLOCK
      ?auto_61849 - BLOCK
      ?auto_61850 - BLOCK
      ?auto_61851 - BLOCK
      ?auto_61852 - BLOCK
      ?auto_61853 - BLOCK
    )
    :vars
    (
      ?auto_61854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61853 ?auto_61854 ) ( ON-TABLE ?auto_61846 ) ( ON ?auto_61847 ?auto_61846 ) ( ON ?auto_61848 ?auto_61847 ) ( ON ?auto_61849 ?auto_61848 ) ( not ( = ?auto_61846 ?auto_61847 ) ) ( not ( = ?auto_61846 ?auto_61848 ) ) ( not ( = ?auto_61846 ?auto_61849 ) ) ( not ( = ?auto_61846 ?auto_61850 ) ) ( not ( = ?auto_61846 ?auto_61851 ) ) ( not ( = ?auto_61846 ?auto_61852 ) ) ( not ( = ?auto_61846 ?auto_61853 ) ) ( not ( = ?auto_61846 ?auto_61854 ) ) ( not ( = ?auto_61847 ?auto_61848 ) ) ( not ( = ?auto_61847 ?auto_61849 ) ) ( not ( = ?auto_61847 ?auto_61850 ) ) ( not ( = ?auto_61847 ?auto_61851 ) ) ( not ( = ?auto_61847 ?auto_61852 ) ) ( not ( = ?auto_61847 ?auto_61853 ) ) ( not ( = ?auto_61847 ?auto_61854 ) ) ( not ( = ?auto_61848 ?auto_61849 ) ) ( not ( = ?auto_61848 ?auto_61850 ) ) ( not ( = ?auto_61848 ?auto_61851 ) ) ( not ( = ?auto_61848 ?auto_61852 ) ) ( not ( = ?auto_61848 ?auto_61853 ) ) ( not ( = ?auto_61848 ?auto_61854 ) ) ( not ( = ?auto_61849 ?auto_61850 ) ) ( not ( = ?auto_61849 ?auto_61851 ) ) ( not ( = ?auto_61849 ?auto_61852 ) ) ( not ( = ?auto_61849 ?auto_61853 ) ) ( not ( = ?auto_61849 ?auto_61854 ) ) ( not ( = ?auto_61850 ?auto_61851 ) ) ( not ( = ?auto_61850 ?auto_61852 ) ) ( not ( = ?auto_61850 ?auto_61853 ) ) ( not ( = ?auto_61850 ?auto_61854 ) ) ( not ( = ?auto_61851 ?auto_61852 ) ) ( not ( = ?auto_61851 ?auto_61853 ) ) ( not ( = ?auto_61851 ?auto_61854 ) ) ( not ( = ?auto_61852 ?auto_61853 ) ) ( not ( = ?auto_61852 ?auto_61854 ) ) ( not ( = ?auto_61853 ?auto_61854 ) ) ( ON ?auto_61852 ?auto_61853 ) ( ON ?auto_61851 ?auto_61852 ) ( CLEAR ?auto_61849 ) ( ON ?auto_61850 ?auto_61851 ) ( CLEAR ?auto_61850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61846 ?auto_61847 ?auto_61848 ?auto_61849 ?auto_61850 )
      ( MAKE-8PILE ?auto_61846 ?auto_61847 ?auto_61848 ?auto_61849 ?auto_61850 ?auto_61851 ?auto_61852 ?auto_61853 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_61863 - BLOCK
      ?auto_61864 - BLOCK
      ?auto_61865 - BLOCK
      ?auto_61866 - BLOCK
      ?auto_61867 - BLOCK
      ?auto_61868 - BLOCK
      ?auto_61869 - BLOCK
      ?auto_61870 - BLOCK
    )
    :vars
    (
      ?auto_61871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61870 ?auto_61871 ) ( ON-TABLE ?auto_61863 ) ( ON ?auto_61864 ?auto_61863 ) ( ON ?auto_61865 ?auto_61864 ) ( ON ?auto_61866 ?auto_61865 ) ( not ( = ?auto_61863 ?auto_61864 ) ) ( not ( = ?auto_61863 ?auto_61865 ) ) ( not ( = ?auto_61863 ?auto_61866 ) ) ( not ( = ?auto_61863 ?auto_61867 ) ) ( not ( = ?auto_61863 ?auto_61868 ) ) ( not ( = ?auto_61863 ?auto_61869 ) ) ( not ( = ?auto_61863 ?auto_61870 ) ) ( not ( = ?auto_61863 ?auto_61871 ) ) ( not ( = ?auto_61864 ?auto_61865 ) ) ( not ( = ?auto_61864 ?auto_61866 ) ) ( not ( = ?auto_61864 ?auto_61867 ) ) ( not ( = ?auto_61864 ?auto_61868 ) ) ( not ( = ?auto_61864 ?auto_61869 ) ) ( not ( = ?auto_61864 ?auto_61870 ) ) ( not ( = ?auto_61864 ?auto_61871 ) ) ( not ( = ?auto_61865 ?auto_61866 ) ) ( not ( = ?auto_61865 ?auto_61867 ) ) ( not ( = ?auto_61865 ?auto_61868 ) ) ( not ( = ?auto_61865 ?auto_61869 ) ) ( not ( = ?auto_61865 ?auto_61870 ) ) ( not ( = ?auto_61865 ?auto_61871 ) ) ( not ( = ?auto_61866 ?auto_61867 ) ) ( not ( = ?auto_61866 ?auto_61868 ) ) ( not ( = ?auto_61866 ?auto_61869 ) ) ( not ( = ?auto_61866 ?auto_61870 ) ) ( not ( = ?auto_61866 ?auto_61871 ) ) ( not ( = ?auto_61867 ?auto_61868 ) ) ( not ( = ?auto_61867 ?auto_61869 ) ) ( not ( = ?auto_61867 ?auto_61870 ) ) ( not ( = ?auto_61867 ?auto_61871 ) ) ( not ( = ?auto_61868 ?auto_61869 ) ) ( not ( = ?auto_61868 ?auto_61870 ) ) ( not ( = ?auto_61868 ?auto_61871 ) ) ( not ( = ?auto_61869 ?auto_61870 ) ) ( not ( = ?auto_61869 ?auto_61871 ) ) ( not ( = ?auto_61870 ?auto_61871 ) ) ( ON ?auto_61869 ?auto_61870 ) ( ON ?auto_61868 ?auto_61869 ) ( CLEAR ?auto_61866 ) ( ON ?auto_61867 ?auto_61868 ) ( CLEAR ?auto_61867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61863 ?auto_61864 ?auto_61865 ?auto_61866 ?auto_61867 )
      ( MAKE-8PILE ?auto_61863 ?auto_61864 ?auto_61865 ?auto_61866 ?auto_61867 ?auto_61868 ?auto_61869 ?auto_61870 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_61880 - BLOCK
      ?auto_61881 - BLOCK
      ?auto_61882 - BLOCK
      ?auto_61883 - BLOCK
      ?auto_61884 - BLOCK
      ?auto_61885 - BLOCK
      ?auto_61886 - BLOCK
      ?auto_61887 - BLOCK
    )
    :vars
    (
      ?auto_61888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61887 ?auto_61888 ) ( ON-TABLE ?auto_61880 ) ( ON ?auto_61881 ?auto_61880 ) ( ON ?auto_61882 ?auto_61881 ) ( not ( = ?auto_61880 ?auto_61881 ) ) ( not ( = ?auto_61880 ?auto_61882 ) ) ( not ( = ?auto_61880 ?auto_61883 ) ) ( not ( = ?auto_61880 ?auto_61884 ) ) ( not ( = ?auto_61880 ?auto_61885 ) ) ( not ( = ?auto_61880 ?auto_61886 ) ) ( not ( = ?auto_61880 ?auto_61887 ) ) ( not ( = ?auto_61880 ?auto_61888 ) ) ( not ( = ?auto_61881 ?auto_61882 ) ) ( not ( = ?auto_61881 ?auto_61883 ) ) ( not ( = ?auto_61881 ?auto_61884 ) ) ( not ( = ?auto_61881 ?auto_61885 ) ) ( not ( = ?auto_61881 ?auto_61886 ) ) ( not ( = ?auto_61881 ?auto_61887 ) ) ( not ( = ?auto_61881 ?auto_61888 ) ) ( not ( = ?auto_61882 ?auto_61883 ) ) ( not ( = ?auto_61882 ?auto_61884 ) ) ( not ( = ?auto_61882 ?auto_61885 ) ) ( not ( = ?auto_61882 ?auto_61886 ) ) ( not ( = ?auto_61882 ?auto_61887 ) ) ( not ( = ?auto_61882 ?auto_61888 ) ) ( not ( = ?auto_61883 ?auto_61884 ) ) ( not ( = ?auto_61883 ?auto_61885 ) ) ( not ( = ?auto_61883 ?auto_61886 ) ) ( not ( = ?auto_61883 ?auto_61887 ) ) ( not ( = ?auto_61883 ?auto_61888 ) ) ( not ( = ?auto_61884 ?auto_61885 ) ) ( not ( = ?auto_61884 ?auto_61886 ) ) ( not ( = ?auto_61884 ?auto_61887 ) ) ( not ( = ?auto_61884 ?auto_61888 ) ) ( not ( = ?auto_61885 ?auto_61886 ) ) ( not ( = ?auto_61885 ?auto_61887 ) ) ( not ( = ?auto_61885 ?auto_61888 ) ) ( not ( = ?auto_61886 ?auto_61887 ) ) ( not ( = ?auto_61886 ?auto_61888 ) ) ( not ( = ?auto_61887 ?auto_61888 ) ) ( ON ?auto_61886 ?auto_61887 ) ( ON ?auto_61885 ?auto_61886 ) ( ON ?auto_61884 ?auto_61885 ) ( CLEAR ?auto_61882 ) ( ON ?auto_61883 ?auto_61884 ) ( CLEAR ?auto_61883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61880 ?auto_61881 ?auto_61882 ?auto_61883 )
      ( MAKE-8PILE ?auto_61880 ?auto_61881 ?auto_61882 ?auto_61883 ?auto_61884 ?auto_61885 ?auto_61886 ?auto_61887 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_61897 - BLOCK
      ?auto_61898 - BLOCK
      ?auto_61899 - BLOCK
      ?auto_61900 - BLOCK
      ?auto_61901 - BLOCK
      ?auto_61902 - BLOCK
      ?auto_61903 - BLOCK
      ?auto_61904 - BLOCK
    )
    :vars
    (
      ?auto_61905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61904 ?auto_61905 ) ( ON-TABLE ?auto_61897 ) ( ON ?auto_61898 ?auto_61897 ) ( ON ?auto_61899 ?auto_61898 ) ( not ( = ?auto_61897 ?auto_61898 ) ) ( not ( = ?auto_61897 ?auto_61899 ) ) ( not ( = ?auto_61897 ?auto_61900 ) ) ( not ( = ?auto_61897 ?auto_61901 ) ) ( not ( = ?auto_61897 ?auto_61902 ) ) ( not ( = ?auto_61897 ?auto_61903 ) ) ( not ( = ?auto_61897 ?auto_61904 ) ) ( not ( = ?auto_61897 ?auto_61905 ) ) ( not ( = ?auto_61898 ?auto_61899 ) ) ( not ( = ?auto_61898 ?auto_61900 ) ) ( not ( = ?auto_61898 ?auto_61901 ) ) ( not ( = ?auto_61898 ?auto_61902 ) ) ( not ( = ?auto_61898 ?auto_61903 ) ) ( not ( = ?auto_61898 ?auto_61904 ) ) ( not ( = ?auto_61898 ?auto_61905 ) ) ( not ( = ?auto_61899 ?auto_61900 ) ) ( not ( = ?auto_61899 ?auto_61901 ) ) ( not ( = ?auto_61899 ?auto_61902 ) ) ( not ( = ?auto_61899 ?auto_61903 ) ) ( not ( = ?auto_61899 ?auto_61904 ) ) ( not ( = ?auto_61899 ?auto_61905 ) ) ( not ( = ?auto_61900 ?auto_61901 ) ) ( not ( = ?auto_61900 ?auto_61902 ) ) ( not ( = ?auto_61900 ?auto_61903 ) ) ( not ( = ?auto_61900 ?auto_61904 ) ) ( not ( = ?auto_61900 ?auto_61905 ) ) ( not ( = ?auto_61901 ?auto_61902 ) ) ( not ( = ?auto_61901 ?auto_61903 ) ) ( not ( = ?auto_61901 ?auto_61904 ) ) ( not ( = ?auto_61901 ?auto_61905 ) ) ( not ( = ?auto_61902 ?auto_61903 ) ) ( not ( = ?auto_61902 ?auto_61904 ) ) ( not ( = ?auto_61902 ?auto_61905 ) ) ( not ( = ?auto_61903 ?auto_61904 ) ) ( not ( = ?auto_61903 ?auto_61905 ) ) ( not ( = ?auto_61904 ?auto_61905 ) ) ( ON ?auto_61903 ?auto_61904 ) ( ON ?auto_61902 ?auto_61903 ) ( ON ?auto_61901 ?auto_61902 ) ( CLEAR ?auto_61899 ) ( ON ?auto_61900 ?auto_61901 ) ( CLEAR ?auto_61900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61897 ?auto_61898 ?auto_61899 ?auto_61900 )
      ( MAKE-8PILE ?auto_61897 ?auto_61898 ?auto_61899 ?auto_61900 ?auto_61901 ?auto_61902 ?auto_61903 ?auto_61904 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_61914 - BLOCK
      ?auto_61915 - BLOCK
      ?auto_61916 - BLOCK
      ?auto_61917 - BLOCK
      ?auto_61918 - BLOCK
      ?auto_61919 - BLOCK
      ?auto_61920 - BLOCK
      ?auto_61921 - BLOCK
    )
    :vars
    (
      ?auto_61922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61921 ?auto_61922 ) ( ON-TABLE ?auto_61914 ) ( ON ?auto_61915 ?auto_61914 ) ( not ( = ?auto_61914 ?auto_61915 ) ) ( not ( = ?auto_61914 ?auto_61916 ) ) ( not ( = ?auto_61914 ?auto_61917 ) ) ( not ( = ?auto_61914 ?auto_61918 ) ) ( not ( = ?auto_61914 ?auto_61919 ) ) ( not ( = ?auto_61914 ?auto_61920 ) ) ( not ( = ?auto_61914 ?auto_61921 ) ) ( not ( = ?auto_61914 ?auto_61922 ) ) ( not ( = ?auto_61915 ?auto_61916 ) ) ( not ( = ?auto_61915 ?auto_61917 ) ) ( not ( = ?auto_61915 ?auto_61918 ) ) ( not ( = ?auto_61915 ?auto_61919 ) ) ( not ( = ?auto_61915 ?auto_61920 ) ) ( not ( = ?auto_61915 ?auto_61921 ) ) ( not ( = ?auto_61915 ?auto_61922 ) ) ( not ( = ?auto_61916 ?auto_61917 ) ) ( not ( = ?auto_61916 ?auto_61918 ) ) ( not ( = ?auto_61916 ?auto_61919 ) ) ( not ( = ?auto_61916 ?auto_61920 ) ) ( not ( = ?auto_61916 ?auto_61921 ) ) ( not ( = ?auto_61916 ?auto_61922 ) ) ( not ( = ?auto_61917 ?auto_61918 ) ) ( not ( = ?auto_61917 ?auto_61919 ) ) ( not ( = ?auto_61917 ?auto_61920 ) ) ( not ( = ?auto_61917 ?auto_61921 ) ) ( not ( = ?auto_61917 ?auto_61922 ) ) ( not ( = ?auto_61918 ?auto_61919 ) ) ( not ( = ?auto_61918 ?auto_61920 ) ) ( not ( = ?auto_61918 ?auto_61921 ) ) ( not ( = ?auto_61918 ?auto_61922 ) ) ( not ( = ?auto_61919 ?auto_61920 ) ) ( not ( = ?auto_61919 ?auto_61921 ) ) ( not ( = ?auto_61919 ?auto_61922 ) ) ( not ( = ?auto_61920 ?auto_61921 ) ) ( not ( = ?auto_61920 ?auto_61922 ) ) ( not ( = ?auto_61921 ?auto_61922 ) ) ( ON ?auto_61920 ?auto_61921 ) ( ON ?auto_61919 ?auto_61920 ) ( ON ?auto_61918 ?auto_61919 ) ( ON ?auto_61917 ?auto_61918 ) ( CLEAR ?auto_61915 ) ( ON ?auto_61916 ?auto_61917 ) ( CLEAR ?auto_61916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61914 ?auto_61915 ?auto_61916 )
      ( MAKE-8PILE ?auto_61914 ?auto_61915 ?auto_61916 ?auto_61917 ?auto_61918 ?auto_61919 ?auto_61920 ?auto_61921 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_61931 - BLOCK
      ?auto_61932 - BLOCK
      ?auto_61933 - BLOCK
      ?auto_61934 - BLOCK
      ?auto_61935 - BLOCK
      ?auto_61936 - BLOCK
      ?auto_61937 - BLOCK
      ?auto_61938 - BLOCK
    )
    :vars
    (
      ?auto_61939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61938 ?auto_61939 ) ( ON-TABLE ?auto_61931 ) ( ON ?auto_61932 ?auto_61931 ) ( not ( = ?auto_61931 ?auto_61932 ) ) ( not ( = ?auto_61931 ?auto_61933 ) ) ( not ( = ?auto_61931 ?auto_61934 ) ) ( not ( = ?auto_61931 ?auto_61935 ) ) ( not ( = ?auto_61931 ?auto_61936 ) ) ( not ( = ?auto_61931 ?auto_61937 ) ) ( not ( = ?auto_61931 ?auto_61938 ) ) ( not ( = ?auto_61931 ?auto_61939 ) ) ( not ( = ?auto_61932 ?auto_61933 ) ) ( not ( = ?auto_61932 ?auto_61934 ) ) ( not ( = ?auto_61932 ?auto_61935 ) ) ( not ( = ?auto_61932 ?auto_61936 ) ) ( not ( = ?auto_61932 ?auto_61937 ) ) ( not ( = ?auto_61932 ?auto_61938 ) ) ( not ( = ?auto_61932 ?auto_61939 ) ) ( not ( = ?auto_61933 ?auto_61934 ) ) ( not ( = ?auto_61933 ?auto_61935 ) ) ( not ( = ?auto_61933 ?auto_61936 ) ) ( not ( = ?auto_61933 ?auto_61937 ) ) ( not ( = ?auto_61933 ?auto_61938 ) ) ( not ( = ?auto_61933 ?auto_61939 ) ) ( not ( = ?auto_61934 ?auto_61935 ) ) ( not ( = ?auto_61934 ?auto_61936 ) ) ( not ( = ?auto_61934 ?auto_61937 ) ) ( not ( = ?auto_61934 ?auto_61938 ) ) ( not ( = ?auto_61934 ?auto_61939 ) ) ( not ( = ?auto_61935 ?auto_61936 ) ) ( not ( = ?auto_61935 ?auto_61937 ) ) ( not ( = ?auto_61935 ?auto_61938 ) ) ( not ( = ?auto_61935 ?auto_61939 ) ) ( not ( = ?auto_61936 ?auto_61937 ) ) ( not ( = ?auto_61936 ?auto_61938 ) ) ( not ( = ?auto_61936 ?auto_61939 ) ) ( not ( = ?auto_61937 ?auto_61938 ) ) ( not ( = ?auto_61937 ?auto_61939 ) ) ( not ( = ?auto_61938 ?auto_61939 ) ) ( ON ?auto_61937 ?auto_61938 ) ( ON ?auto_61936 ?auto_61937 ) ( ON ?auto_61935 ?auto_61936 ) ( ON ?auto_61934 ?auto_61935 ) ( CLEAR ?auto_61932 ) ( ON ?auto_61933 ?auto_61934 ) ( CLEAR ?auto_61933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61931 ?auto_61932 ?auto_61933 )
      ( MAKE-8PILE ?auto_61931 ?auto_61932 ?auto_61933 ?auto_61934 ?auto_61935 ?auto_61936 ?auto_61937 ?auto_61938 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_61948 - BLOCK
      ?auto_61949 - BLOCK
      ?auto_61950 - BLOCK
      ?auto_61951 - BLOCK
      ?auto_61952 - BLOCK
      ?auto_61953 - BLOCK
      ?auto_61954 - BLOCK
      ?auto_61955 - BLOCK
    )
    :vars
    (
      ?auto_61956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61955 ?auto_61956 ) ( ON-TABLE ?auto_61948 ) ( not ( = ?auto_61948 ?auto_61949 ) ) ( not ( = ?auto_61948 ?auto_61950 ) ) ( not ( = ?auto_61948 ?auto_61951 ) ) ( not ( = ?auto_61948 ?auto_61952 ) ) ( not ( = ?auto_61948 ?auto_61953 ) ) ( not ( = ?auto_61948 ?auto_61954 ) ) ( not ( = ?auto_61948 ?auto_61955 ) ) ( not ( = ?auto_61948 ?auto_61956 ) ) ( not ( = ?auto_61949 ?auto_61950 ) ) ( not ( = ?auto_61949 ?auto_61951 ) ) ( not ( = ?auto_61949 ?auto_61952 ) ) ( not ( = ?auto_61949 ?auto_61953 ) ) ( not ( = ?auto_61949 ?auto_61954 ) ) ( not ( = ?auto_61949 ?auto_61955 ) ) ( not ( = ?auto_61949 ?auto_61956 ) ) ( not ( = ?auto_61950 ?auto_61951 ) ) ( not ( = ?auto_61950 ?auto_61952 ) ) ( not ( = ?auto_61950 ?auto_61953 ) ) ( not ( = ?auto_61950 ?auto_61954 ) ) ( not ( = ?auto_61950 ?auto_61955 ) ) ( not ( = ?auto_61950 ?auto_61956 ) ) ( not ( = ?auto_61951 ?auto_61952 ) ) ( not ( = ?auto_61951 ?auto_61953 ) ) ( not ( = ?auto_61951 ?auto_61954 ) ) ( not ( = ?auto_61951 ?auto_61955 ) ) ( not ( = ?auto_61951 ?auto_61956 ) ) ( not ( = ?auto_61952 ?auto_61953 ) ) ( not ( = ?auto_61952 ?auto_61954 ) ) ( not ( = ?auto_61952 ?auto_61955 ) ) ( not ( = ?auto_61952 ?auto_61956 ) ) ( not ( = ?auto_61953 ?auto_61954 ) ) ( not ( = ?auto_61953 ?auto_61955 ) ) ( not ( = ?auto_61953 ?auto_61956 ) ) ( not ( = ?auto_61954 ?auto_61955 ) ) ( not ( = ?auto_61954 ?auto_61956 ) ) ( not ( = ?auto_61955 ?auto_61956 ) ) ( ON ?auto_61954 ?auto_61955 ) ( ON ?auto_61953 ?auto_61954 ) ( ON ?auto_61952 ?auto_61953 ) ( ON ?auto_61951 ?auto_61952 ) ( ON ?auto_61950 ?auto_61951 ) ( CLEAR ?auto_61948 ) ( ON ?auto_61949 ?auto_61950 ) ( CLEAR ?auto_61949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61948 ?auto_61949 )
      ( MAKE-8PILE ?auto_61948 ?auto_61949 ?auto_61950 ?auto_61951 ?auto_61952 ?auto_61953 ?auto_61954 ?auto_61955 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_61965 - BLOCK
      ?auto_61966 - BLOCK
      ?auto_61967 - BLOCK
      ?auto_61968 - BLOCK
      ?auto_61969 - BLOCK
      ?auto_61970 - BLOCK
      ?auto_61971 - BLOCK
      ?auto_61972 - BLOCK
    )
    :vars
    (
      ?auto_61973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61972 ?auto_61973 ) ( ON-TABLE ?auto_61965 ) ( not ( = ?auto_61965 ?auto_61966 ) ) ( not ( = ?auto_61965 ?auto_61967 ) ) ( not ( = ?auto_61965 ?auto_61968 ) ) ( not ( = ?auto_61965 ?auto_61969 ) ) ( not ( = ?auto_61965 ?auto_61970 ) ) ( not ( = ?auto_61965 ?auto_61971 ) ) ( not ( = ?auto_61965 ?auto_61972 ) ) ( not ( = ?auto_61965 ?auto_61973 ) ) ( not ( = ?auto_61966 ?auto_61967 ) ) ( not ( = ?auto_61966 ?auto_61968 ) ) ( not ( = ?auto_61966 ?auto_61969 ) ) ( not ( = ?auto_61966 ?auto_61970 ) ) ( not ( = ?auto_61966 ?auto_61971 ) ) ( not ( = ?auto_61966 ?auto_61972 ) ) ( not ( = ?auto_61966 ?auto_61973 ) ) ( not ( = ?auto_61967 ?auto_61968 ) ) ( not ( = ?auto_61967 ?auto_61969 ) ) ( not ( = ?auto_61967 ?auto_61970 ) ) ( not ( = ?auto_61967 ?auto_61971 ) ) ( not ( = ?auto_61967 ?auto_61972 ) ) ( not ( = ?auto_61967 ?auto_61973 ) ) ( not ( = ?auto_61968 ?auto_61969 ) ) ( not ( = ?auto_61968 ?auto_61970 ) ) ( not ( = ?auto_61968 ?auto_61971 ) ) ( not ( = ?auto_61968 ?auto_61972 ) ) ( not ( = ?auto_61968 ?auto_61973 ) ) ( not ( = ?auto_61969 ?auto_61970 ) ) ( not ( = ?auto_61969 ?auto_61971 ) ) ( not ( = ?auto_61969 ?auto_61972 ) ) ( not ( = ?auto_61969 ?auto_61973 ) ) ( not ( = ?auto_61970 ?auto_61971 ) ) ( not ( = ?auto_61970 ?auto_61972 ) ) ( not ( = ?auto_61970 ?auto_61973 ) ) ( not ( = ?auto_61971 ?auto_61972 ) ) ( not ( = ?auto_61971 ?auto_61973 ) ) ( not ( = ?auto_61972 ?auto_61973 ) ) ( ON ?auto_61971 ?auto_61972 ) ( ON ?auto_61970 ?auto_61971 ) ( ON ?auto_61969 ?auto_61970 ) ( ON ?auto_61968 ?auto_61969 ) ( ON ?auto_61967 ?auto_61968 ) ( CLEAR ?auto_61965 ) ( ON ?auto_61966 ?auto_61967 ) ( CLEAR ?auto_61966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61965 ?auto_61966 )
      ( MAKE-8PILE ?auto_61965 ?auto_61966 ?auto_61967 ?auto_61968 ?auto_61969 ?auto_61970 ?auto_61971 ?auto_61972 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_61982 - BLOCK
      ?auto_61983 - BLOCK
      ?auto_61984 - BLOCK
      ?auto_61985 - BLOCK
      ?auto_61986 - BLOCK
      ?auto_61987 - BLOCK
      ?auto_61988 - BLOCK
      ?auto_61989 - BLOCK
    )
    :vars
    (
      ?auto_61990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61989 ?auto_61990 ) ( not ( = ?auto_61982 ?auto_61983 ) ) ( not ( = ?auto_61982 ?auto_61984 ) ) ( not ( = ?auto_61982 ?auto_61985 ) ) ( not ( = ?auto_61982 ?auto_61986 ) ) ( not ( = ?auto_61982 ?auto_61987 ) ) ( not ( = ?auto_61982 ?auto_61988 ) ) ( not ( = ?auto_61982 ?auto_61989 ) ) ( not ( = ?auto_61982 ?auto_61990 ) ) ( not ( = ?auto_61983 ?auto_61984 ) ) ( not ( = ?auto_61983 ?auto_61985 ) ) ( not ( = ?auto_61983 ?auto_61986 ) ) ( not ( = ?auto_61983 ?auto_61987 ) ) ( not ( = ?auto_61983 ?auto_61988 ) ) ( not ( = ?auto_61983 ?auto_61989 ) ) ( not ( = ?auto_61983 ?auto_61990 ) ) ( not ( = ?auto_61984 ?auto_61985 ) ) ( not ( = ?auto_61984 ?auto_61986 ) ) ( not ( = ?auto_61984 ?auto_61987 ) ) ( not ( = ?auto_61984 ?auto_61988 ) ) ( not ( = ?auto_61984 ?auto_61989 ) ) ( not ( = ?auto_61984 ?auto_61990 ) ) ( not ( = ?auto_61985 ?auto_61986 ) ) ( not ( = ?auto_61985 ?auto_61987 ) ) ( not ( = ?auto_61985 ?auto_61988 ) ) ( not ( = ?auto_61985 ?auto_61989 ) ) ( not ( = ?auto_61985 ?auto_61990 ) ) ( not ( = ?auto_61986 ?auto_61987 ) ) ( not ( = ?auto_61986 ?auto_61988 ) ) ( not ( = ?auto_61986 ?auto_61989 ) ) ( not ( = ?auto_61986 ?auto_61990 ) ) ( not ( = ?auto_61987 ?auto_61988 ) ) ( not ( = ?auto_61987 ?auto_61989 ) ) ( not ( = ?auto_61987 ?auto_61990 ) ) ( not ( = ?auto_61988 ?auto_61989 ) ) ( not ( = ?auto_61988 ?auto_61990 ) ) ( not ( = ?auto_61989 ?auto_61990 ) ) ( ON ?auto_61988 ?auto_61989 ) ( ON ?auto_61987 ?auto_61988 ) ( ON ?auto_61986 ?auto_61987 ) ( ON ?auto_61985 ?auto_61986 ) ( ON ?auto_61984 ?auto_61985 ) ( ON ?auto_61983 ?auto_61984 ) ( ON ?auto_61982 ?auto_61983 ) ( CLEAR ?auto_61982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61982 )
      ( MAKE-8PILE ?auto_61982 ?auto_61983 ?auto_61984 ?auto_61985 ?auto_61986 ?auto_61987 ?auto_61988 ?auto_61989 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_61999 - BLOCK
      ?auto_62000 - BLOCK
      ?auto_62001 - BLOCK
      ?auto_62002 - BLOCK
      ?auto_62003 - BLOCK
      ?auto_62004 - BLOCK
      ?auto_62005 - BLOCK
      ?auto_62006 - BLOCK
    )
    :vars
    (
      ?auto_62007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62006 ?auto_62007 ) ( not ( = ?auto_61999 ?auto_62000 ) ) ( not ( = ?auto_61999 ?auto_62001 ) ) ( not ( = ?auto_61999 ?auto_62002 ) ) ( not ( = ?auto_61999 ?auto_62003 ) ) ( not ( = ?auto_61999 ?auto_62004 ) ) ( not ( = ?auto_61999 ?auto_62005 ) ) ( not ( = ?auto_61999 ?auto_62006 ) ) ( not ( = ?auto_61999 ?auto_62007 ) ) ( not ( = ?auto_62000 ?auto_62001 ) ) ( not ( = ?auto_62000 ?auto_62002 ) ) ( not ( = ?auto_62000 ?auto_62003 ) ) ( not ( = ?auto_62000 ?auto_62004 ) ) ( not ( = ?auto_62000 ?auto_62005 ) ) ( not ( = ?auto_62000 ?auto_62006 ) ) ( not ( = ?auto_62000 ?auto_62007 ) ) ( not ( = ?auto_62001 ?auto_62002 ) ) ( not ( = ?auto_62001 ?auto_62003 ) ) ( not ( = ?auto_62001 ?auto_62004 ) ) ( not ( = ?auto_62001 ?auto_62005 ) ) ( not ( = ?auto_62001 ?auto_62006 ) ) ( not ( = ?auto_62001 ?auto_62007 ) ) ( not ( = ?auto_62002 ?auto_62003 ) ) ( not ( = ?auto_62002 ?auto_62004 ) ) ( not ( = ?auto_62002 ?auto_62005 ) ) ( not ( = ?auto_62002 ?auto_62006 ) ) ( not ( = ?auto_62002 ?auto_62007 ) ) ( not ( = ?auto_62003 ?auto_62004 ) ) ( not ( = ?auto_62003 ?auto_62005 ) ) ( not ( = ?auto_62003 ?auto_62006 ) ) ( not ( = ?auto_62003 ?auto_62007 ) ) ( not ( = ?auto_62004 ?auto_62005 ) ) ( not ( = ?auto_62004 ?auto_62006 ) ) ( not ( = ?auto_62004 ?auto_62007 ) ) ( not ( = ?auto_62005 ?auto_62006 ) ) ( not ( = ?auto_62005 ?auto_62007 ) ) ( not ( = ?auto_62006 ?auto_62007 ) ) ( ON ?auto_62005 ?auto_62006 ) ( ON ?auto_62004 ?auto_62005 ) ( ON ?auto_62003 ?auto_62004 ) ( ON ?auto_62002 ?auto_62003 ) ( ON ?auto_62001 ?auto_62002 ) ( ON ?auto_62000 ?auto_62001 ) ( ON ?auto_61999 ?auto_62000 ) ( CLEAR ?auto_61999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61999 )
      ( MAKE-8PILE ?auto_61999 ?auto_62000 ?auto_62001 ?auto_62002 ?auto_62003 ?auto_62004 ?auto_62005 ?auto_62006 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62017 - BLOCK
      ?auto_62018 - BLOCK
      ?auto_62019 - BLOCK
      ?auto_62020 - BLOCK
      ?auto_62021 - BLOCK
      ?auto_62022 - BLOCK
      ?auto_62023 - BLOCK
      ?auto_62024 - BLOCK
      ?auto_62025 - BLOCK
    )
    :vars
    (
      ?auto_62026 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_62024 ) ( ON ?auto_62025 ?auto_62026 ) ( CLEAR ?auto_62025 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62017 ) ( ON ?auto_62018 ?auto_62017 ) ( ON ?auto_62019 ?auto_62018 ) ( ON ?auto_62020 ?auto_62019 ) ( ON ?auto_62021 ?auto_62020 ) ( ON ?auto_62022 ?auto_62021 ) ( ON ?auto_62023 ?auto_62022 ) ( ON ?auto_62024 ?auto_62023 ) ( not ( = ?auto_62017 ?auto_62018 ) ) ( not ( = ?auto_62017 ?auto_62019 ) ) ( not ( = ?auto_62017 ?auto_62020 ) ) ( not ( = ?auto_62017 ?auto_62021 ) ) ( not ( = ?auto_62017 ?auto_62022 ) ) ( not ( = ?auto_62017 ?auto_62023 ) ) ( not ( = ?auto_62017 ?auto_62024 ) ) ( not ( = ?auto_62017 ?auto_62025 ) ) ( not ( = ?auto_62017 ?auto_62026 ) ) ( not ( = ?auto_62018 ?auto_62019 ) ) ( not ( = ?auto_62018 ?auto_62020 ) ) ( not ( = ?auto_62018 ?auto_62021 ) ) ( not ( = ?auto_62018 ?auto_62022 ) ) ( not ( = ?auto_62018 ?auto_62023 ) ) ( not ( = ?auto_62018 ?auto_62024 ) ) ( not ( = ?auto_62018 ?auto_62025 ) ) ( not ( = ?auto_62018 ?auto_62026 ) ) ( not ( = ?auto_62019 ?auto_62020 ) ) ( not ( = ?auto_62019 ?auto_62021 ) ) ( not ( = ?auto_62019 ?auto_62022 ) ) ( not ( = ?auto_62019 ?auto_62023 ) ) ( not ( = ?auto_62019 ?auto_62024 ) ) ( not ( = ?auto_62019 ?auto_62025 ) ) ( not ( = ?auto_62019 ?auto_62026 ) ) ( not ( = ?auto_62020 ?auto_62021 ) ) ( not ( = ?auto_62020 ?auto_62022 ) ) ( not ( = ?auto_62020 ?auto_62023 ) ) ( not ( = ?auto_62020 ?auto_62024 ) ) ( not ( = ?auto_62020 ?auto_62025 ) ) ( not ( = ?auto_62020 ?auto_62026 ) ) ( not ( = ?auto_62021 ?auto_62022 ) ) ( not ( = ?auto_62021 ?auto_62023 ) ) ( not ( = ?auto_62021 ?auto_62024 ) ) ( not ( = ?auto_62021 ?auto_62025 ) ) ( not ( = ?auto_62021 ?auto_62026 ) ) ( not ( = ?auto_62022 ?auto_62023 ) ) ( not ( = ?auto_62022 ?auto_62024 ) ) ( not ( = ?auto_62022 ?auto_62025 ) ) ( not ( = ?auto_62022 ?auto_62026 ) ) ( not ( = ?auto_62023 ?auto_62024 ) ) ( not ( = ?auto_62023 ?auto_62025 ) ) ( not ( = ?auto_62023 ?auto_62026 ) ) ( not ( = ?auto_62024 ?auto_62025 ) ) ( not ( = ?auto_62024 ?auto_62026 ) ) ( not ( = ?auto_62025 ?auto_62026 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62025 ?auto_62026 )
      ( !STACK ?auto_62025 ?auto_62024 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62036 - BLOCK
      ?auto_62037 - BLOCK
      ?auto_62038 - BLOCK
      ?auto_62039 - BLOCK
      ?auto_62040 - BLOCK
      ?auto_62041 - BLOCK
      ?auto_62042 - BLOCK
      ?auto_62043 - BLOCK
      ?auto_62044 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_62043 ) ( ON-TABLE ?auto_62044 ) ( CLEAR ?auto_62044 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62036 ) ( ON ?auto_62037 ?auto_62036 ) ( ON ?auto_62038 ?auto_62037 ) ( ON ?auto_62039 ?auto_62038 ) ( ON ?auto_62040 ?auto_62039 ) ( ON ?auto_62041 ?auto_62040 ) ( ON ?auto_62042 ?auto_62041 ) ( ON ?auto_62043 ?auto_62042 ) ( not ( = ?auto_62036 ?auto_62037 ) ) ( not ( = ?auto_62036 ?auto_62038 ) ) ( not ( = ?auto_62036 ?auto_62039 ) ) ( not ( = ?auto_62036 ?auto_62040 ) ) ( not ( = ?auto_62036 ?auto_62041 ) ) ( not ( = ?auto_62036 ?auto_62042 ) ) ( not ( = ?auto_62036 ?auto_62043 ) ) ( not ( = ?auto_62036 ?auto_62044 ) ) ( not ( = ?auto_62037 ?auto_62038 ) ) ( not ( = ?auto_62037 ?auto_62039 ) ) ( not ( = ?auto_62037 ?auto_62040 ) ) ( not ( = ?auto_62037 ?auto_62041 ) ) ( not ( = ?auto_62037 ?auto_62042 ) ) ( not ( = ?auto_62037 ?auto_62043 ) ) ( not ( = ?auto_62037 ?auto_62044 ) ) ( not ( = ?auto_62038 ?auto_62039 ) ) ( not ( = ?auto_62038 ?auto_62040 ) ) ( not ( = ?auto_62038 ?auto_62041 ) ) ( not ( = ?auto_62038 ?auto_62042 ) ) ( not ( = ?auto_62038 ?auto_62043 ) ) ( not ( = ?auto_62038 ?auto_62044 ) ) ( not ( = ?auto_62039 ?auto_62040 ) ) ( not ( = ?auto_62039 ?auto_62041 ) ) ( not ( = ?auto_62039 ?auto_62042 ) ) ( not ( = ?auto_62039 ?auto_62043 ) ) ( not ( = ?auto_62039 ?auto_62044 ) ) ( not ( = ?auto_62040 ?auto_62041 ) ) ( not ( = ?auto_62040 ?auto_62042 ) ) ( not ( = ?auto_62040 ?auto_62043 ) ) ( not ( = ?auto_62040 ?auto_62044 ) ) ( not ( = ?auto_62041 ?auto_62042 ) ) ( not ( = ?auto_62041 ?auto_62043 ) ) ( not ( = ?auto_62041 ?auto_62044 ) ) ( not ( = ?auto_62042 ?auto_62043 ) ) ( not ( = ?auto_62042 ?auto_62044 ) ) ( not ( = ?auto_62043 ?auto_62044 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_62044 )
      ( !STACK ?auto_62044 ?auto_62043 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62054 - BLOCK
      ?auto_62055 - BLOCK
      ?auto_62056 - BLOCK
      ?auto_62057 - BLOCK
      ?auto_62058 - BLOCK
      ?auto_62059 - BLOCK
      ?auto_62060 - BLOCK
      ?auto_62061 - BLOCK
      ?auto_62062 - BLOCK
    )
    :vars
    (
      ?auto_62063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62062 ?auto_62063 ) ( ON-TABLE ?auto_62054 ) ( ON ?auto_62055 ?auto_62054 ) ( ON ?auto_62056 ?auto_62055 ) ( ON ?auto_62057 ?auto_62056 ) ( ON ?auto_62058 ?auto_62057 ) ( ON ?auto_62059 ?auto_62058 ) ( ON ?auto_62060 ?auto_62059 ) ( not ( = ?auto_62054 ?auto_62055 ) ) ( not ( = ?auto_62054 ?auto_62056 ) ) ( not ( = ?auto_62054 ?auto_62057 ) ) ( not ( = ?auto_62054 ?auto_62058 ) ) ( not ( = ?auto_62054 ?auto_62059 ) ) ( not ( = ?auto_62054 ?auto_62060 ) ) ( not ( = ?auto_62054 ?auto_62061 ) ) ( not ( = ?auto_62054 ?auto_62062 ) ) ( not ( = ?auto_62054 ?auto_62063 ) ) ( not ( = ?auto_62055 ?auto_62056 ) ) ( not ( = ?auto_62055 ?auto_62057 ) ) ( not ( = ?auto_62055 ?auto_62058 ) ) ( not ( = ?auto_62055 ?auto_62059 ) ) ( not ( = ?auto_62055 ?auto_62060 ) ) ( not ( = ?auto_62055 ?auto_62061 ) ) ( not ( = ?auto_62055 ?auto_62062 ) ) ( not ( = ?auto_62055 ?auto_62063 ) ) ( not ( = ?auto_62056 ?auto_62057 ) ) ( not ( = ?auto_62056 ?auto_62058 ) ) ( not ( = ?auto_62056 ?auto_62059 ) ) ( not ( = ?auto_62056 ?auto_62060 ) ) ( not ( = ?auto_62056 ?auto_62061 ) ) ( not ( = ?auto_62056 ?auto_62062 ) ) ( not ( = ?auto_62056 ?auto_62063 ) ) ( not ( = ?auto_62057 ?auto_62058 ) ) ( not ( = ?auto_62057 ?auto_62059 ) ) ( not ( = ?auto_62057 ?auto_62060 ) ) ( not ( = ?auto_62057 ?auto_62061 ) ) ( not ( = ?auto_62057 ?auto_62062 ) ) ( not ( = ?auto_62057 ?auto_62063 ) ) ( not ( = ?auto_62058 ?auto_62059 ) ) ( not ( = ?auto_62058 ?auto_62060 ) ) ( not ( = ?auto_62058 ?auto_62061 ) ) ( not ( = ?auto_62058 ?auto_62062 ) ) ( not ( = ?auto_62058 ?auto_62063 ) ) ( not ( = ?auto_62059 ?auto_62060 ) ) ( not ( = ?auto_62059 ?auto_62061 ) ) ( not ( = ?auto_62059 ?auto_62062 ) ) ( not ( = ?auto_62059 ?auto_62063 ) ) ( not ( = ?auto_62060 ?auto_62061 ) ) ( not ( = ?auto_62060 ?auto_62062 ) ) ( not ( = ?auto_62060 ?auto_62063 ) ) ( not ( = ?auto_62061 ?auto_62062 ) ) ( not ( = ?auto_62061 ?auto_62063 ) ) ( not ( = ?auto_62062 ?auto_62063 ) ) ( CLEAR ?auto_62060 ) ( ON ?auto_62061 ?auto_62062 ) ( CLEAR ?auto_62061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_62054 ?auto_62055 ?auto_62056 ?auto_62057 ?auto_62058 ?auto_62059 ?auto_62060 ?auto_62061 )
      ( MAKE-9PILE ?auto_62054 ?auto_62055 ?auto_62056 ?auto_62057 ?auto_62058 ?auto_62059 ?auto_62060 ?auto_62061 ?auto_62062 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62073 - BLOCK
      ?auto_62074 - BLOCK
      ?auto_62075 - BLOCK
      ?auto_62076 - BLOCK
      ?auto_62077 - BLOCK
      ?auto_62078 - BLOCK
      ?auto_62079 - BLOCK
      ?auto_62080 - BLOCK
      ?auto_62081 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62081 ) ( ON-TABLE ?auto_62073 ) ( ON ?auto_62074 ?auto_62073 ) ( ON ?auto_62075 ?auto_62074 ) ( ON ?auto_62076 ?auto_62075 ) ( ON ?auto_62077 ?auto_62076 ) ( ON ?auto_62078 ?auto_62077 ) ( ON ?auto_62079 ?auto_62078 ) ( not ( = ?auto_62073 ?auto_62074 ) ) ( not ( = ?auto_62073 ?auto_62075 ) ) ( not ( = ?auto_62073 ?auto_62076 ) ) ( not ( = ?auto_62073 ?auto_62077 ) ) ( not ( = ?auto_62073 ?auto_62078 ) ) ( not ( = ?auto_62073 ?auto_62079 ) ) ( not ( = ?auto_62073 ?auto_62080 ) ) ( not ( = ?auto_62073 ?auto_62081 ) ) ( not ( = ?auto_62074 ?auto_62075 ) ) ( not ( = ?auto_62074 ?auto_62076 ) ) ( not ( = ?auto_62074 ?auto_62077 ) ) ( not ( = ?auto_62074 ?auto_62078 ) ) ( not ( = ?auto_62074 ?auto_62079 ) ) ( not ( = ?auto_62074 ?auto_62080 ) ) ( not ( = ?auto_62074 ?auto_62081 ) ) ( not ( = ?auto_62075 ?auto_62076 ) ) ( not ( = ?auto_62075 ?auto_62077 ) ) ( not ( = ?auto_62075 ?auto_62078 ) ) ( not ( = ?auto_62075 ?auto_62079 ) ) ( not ( = ?auto_62075 ?auto_62080 ) ) ( not ( = ?auto_62075 ?auto_62081 ) ) ( not ( = ?auto_62076 ?auto_62077 ) ) ( not ( = ?auto_62076 ?auto_62078 ) ) ( not ( = ?auto_62076 ?auto_62079 ) ) ( not ( = ?auto_62076 ?auto_62080 ) ) ( not ( = ?auto_62076 ?auto_62081 ) ) ( not ( = ?auto_62077 ?auto_62078 ) ) ( not ( = ?auto_62077 ?auto_62079 ) ) ( not ( = ?auto_62077 ?auto_62080 ) ) ( not ( = ?auto_62077 ?auto_62081 ) ) ( not ( = ?auto_62078 ?auto_62079 ) ) ( not ( = ?auto_62078 ?auto_62080 ) ) ( not ( = ?auto_62078 ?auto_62081 ) ) ( not ( = ?auto_62079 ?auto_62080 ) ) ( not ( = ?auto_62079 ?auto_62081 ) ) ( not ( = ?auto_62080 ?auto_62081 ) ) ( CLEAR ?auto_62079 ) ( ON ?auto_62080 ?auto_62081 ) ( CLEAR ?auto_62080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_62073 ?auto_62074 ?auto_62075 ?auto_62076 ?auto_62077 ?auto_62078 ?auto_62079 ?auto_62080 )
      ( MAKE-9PILE ?auto_62073 ?auto_62074 ?auto_62075 ?auto_62076 ?auto_62077 ?auto_62078 ?auto_62079 ?auto_62080 ?auto_62081 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62091 - BLOCK
      ?auto_62092 - BLOCK
      ?auto_62093 - BLOCK
      ?auto_62094 - BLOCK
      ?auto_62095 - BLOCK
      ?auto_62096 - BLOCK
      ?auto_62097 - BLOCK
      ?auto_62098 - BLOCK
      ?auto_62099 - BLOCK
    )
    :vars
    (
      ?auto_62100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62099 ?auto_62100 ) ( ON-TABLE ?auto_62091 ) ( ON ?auto_62092 ?auto_62091 ) ( ON ?auto_62093 ?auto_62092 ) ( ON ?auto_62094 ?auto_62093 ) ( ON ?auto_62095 ?auto_62094 ) ( ON ?auto_62096 ?auto_62095 ) ( not ( = ?auto_62091 ?auto_62092 ) ) ( not ( = ?auto_62091 ?auto_62093 ) ) ( not ( = ?auto_62091 ?auto_62094 ) ) ( not ( = ?auto_62091 ?auto_62095 ) ) ( not ( = ?auto_62091 ?auto_62096 ) ) ( not ( = ?auto_62091 ?auto_62097 ) ) ( not ( = ?auto_62091 ?auto_62098 ) ) ( not ( = ?auto_62091 ?auto_62099 ) ) ( not ( = ?auto_62091 ?auto_62100 ) ) ( not ( = ?auto_62092 ?auto_62093 ) ) ( not ( = ?auto_62092 ?auto_62094 ) ) ( not ( = ?auto_62092 ?auto_62095 ) ) ( not ( = ?auto_62092 ?auto_62096 ) ) ( not ( = ?auto_62092 ?auto_62097 ) ) ( not ( = ?auto_62092 ?auto_62098 ) ) ( not ( = ?auto_62092 ?auto_62099 ) ) ( not ( = ?auto_62092 ?auto_62100 ) ) ( not ( = ?auto_62093 ?auto_62094 ) ) ( not ( = ?auto_62093 ?auto_62095 ) ) ( not ( = ?auto_62093 ?auto_62096 ) ) ( not ( = ?auto_62093 ?auto_62097 ) ) ( not ( = ?auto_62093 ?auto_62098 ) ) ( not ( = ?auto_62093 ?auto_62099 ) ) ( not ( = ?auto_62093 ?auto_62100 ) ) ( not ( = ?auto_62094 ?auto_62095 ) ) ( not ( = ?auto_62094 ?auto_62096 ) ) ( not ( = ?auto_62094 ?auto_62097 ) ) ( not ( = ?auto_62094 ?auto_62098 ) ) ( not ( = ?auto_62094 ?auto_62099 ) ) ( not ( = ?auto_62094 ?auto_62100 ) ) ( not ( = ?auto_62095 ?auto_62096 ) ) ( not ( = ?auto_62095 ?auto_62097 ) ) ( not ( = ?auto_62095 ?auto_62098 ) ) ( not ( = ?auto_62095 ?auto_62099 ) ) ( not ( = ?auto_62095 ?auto_62100 ) ) ( not ( = ?auto_62096 ?auto_62097 ) ) ( not ( = ?auto_62096 ?auto_62098 ) ) ( not ( = ?auto_62096 ?auto_62099 ) ) ( not ( = ?auto_62096 ?auto_62100 ) ) ( not ( = ?auto_62097 ?auto_62098 ) ) ( not ( = ?auto_62097 ?auto_62099 ) ) ( not ( = ?auto_62097 ?auto_62100 ) ) ( not ( = ?auto_62098 ?auto_62099 ) ) ( not ( = ?auto_62098 ?auto_62100 ) ) ( not ( = ?auto_62099 ?auto_62100 ) ) ( ON ?auto_62098 ?auto_62099 ) ( CLEAR ?auto_62096 ) ( ON ?auto_62097 ?auto_62098 ) ( CLEAR ?auto_62097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_62091 ?auto_62092 ?auto_62093 ?auto_62094 ?auto_62095 ?auto_62096 ?auto_62097 )
      ( MAKE-9PILE ?auto_62091 ?auto_62092 ?auto_62093 ?auto_62094 ?auto_62095 ?auto_62096 ?auto_62097 ?auto_62098 ?auto_62099 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62110 - BLOCK
      ?auto_62111 - BLOCK
      ?auto_62112 - BLOCK
      ?auto_62113 - BLOCK
      ?auto_62114 - BLOCK
      ?auto_62115 - BLOCK
      ?auto_62116 - BLOCK
      ?auto_62117 - BLOCK
      ?auto_62118 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62118 ) ( ON-TABLE ?auto_62110 ) ( ON ?auto_62111 ?auto_62110 ) ( ON ?auto_62112 ?auto_62111 ) ( ON ?auto_62113 ?auto_62112 ) ( ON ?auto_62114 ?auto_62113 ) ( ON ?auto_62115 ?auto_62114 ) ( not ( = ?auto_62110 ?auto_62111 ) ) ( not ( = ?auto_62110 ?auto_62112 ) ) ( not ( = ?auto_62110 ?auto_62113 ) ) ( not ( = ?auto_62110 ?auto_62114 ) ) ( not ( = ?auto_62110 ?auto_62115 ) ) ( not ( = ?auto_62110 ?auto_62116 ) ) ( not ( = ?auto_62110 ?auto_62117 ) ) ( not ( = ?auto_62110 ?auto_62118 ) ) ( not ( = ?auto_62111 ?auto_62112 ) ) ( not ( = ?auto_62111 ?auto_62113 ) ) ( not ( = ?auto_62111 ?auto_62114 ) ) ( not ( = ?auto_62111 ?auto_62115 ) ) ( not ( = ?auto_62111 ?auto_62116 ) ) ( not ( = ?auto_62111 ?auto_62117 ) ) ( not ( = ?auto_62111 ?auto_62118 ) ) ( not ( = ?auto_62112 ?auto_62113 ) ) ( not ( = ?auto_62112 ?auto_62114 ) ) ( not ( = ?auto_62112 ?auto_62115 ) ) ( not ( = ?auto_62112 ?auto_62116 ) ) ( not ( = ?auto_62112 ?auto_62117 ) ) ( not ( = ?auto_62112 ?auto_62118 ) ) ( not ( = ?auto_62113 ?auto_62114 ) ) ( not ( = ?auto_62113 ?auto_62115 ) ) ( not ( = ?auto_62113 ?auto_62116 ) ) ( not ( = ?auto_62113 ?auto_62117 ) ) ( not ( = ?auto_62113 ?auto_62118 ) ) ( not ( = ?auto_62114 ?auto_62115 ) ) ( not ( = ?auto_62114 ?auto_62116 ) ) ( not ( = ?auto_62114 ?auto_62117 ) ) ( not ( = ?auto_62114 ?auto_62118 ) ) ( not ( = ?auto_62115 ?auto_62116 ) ) ( not ( = ?auto_62115 ?auto_62117 ) ) ( not ( = ?auto_62115 ?auto_62118 ) ) ( not ( = ?auto_62116 ?auto_62117 ) ) ( not ( = ?auto_62116 ?auto_62118 ) ) ( not ( = ?auto_62117 ?auto_62118 ) ) ( ON ?auto_62117 ?auto_62118 ) ( CLEAR ?auto_62115 ) ( ON ?auto_62116 ?auto_62117 ) ( CLEAR ?auto_62116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_62110 ?auto_62111 ?auto_62112 ?auto_62113 ?auto_62114 ?auto_62115 ?auto_62116 )
      ( MAKE-9PILE ?auto_62110 ?auto_62111 ?auto_62112 ?auto_62113 ?auto_62114 ?auto_62115 ?auto_62116 ?auto_62117 ?auto_62118 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62128 - BLOCK
      ?auto_62129 - BLOCK
      ?auto_62130 - BLOCK
      ?auto_62131 - BLOCK
      ?auto_62132 - BLOCK
      ?auto_62133 - BLOCK
      ?auto_62134 - BLOCK
      ?auto_62135 - BLOCK
      ?auto_62136 - BLOCK
    )
    :vars
    (
      ?auto_62137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62136 ?auto_62137 ) ( ON-TABLE ?auto_62128 ) ( ON ?auto_62129 ?auto_62128 ) ( ON ?auto_62130 ?auto_62129 ) ( ON ?auto_62131 ?auto_62130 ) ( ON ?auto_62132 ?auto_62131 ) ( not ( = ?auto_62128 ?auto_62129 ) ) ( not ( = ?auto_62128 ?auto_62130 ) ) ( not ( = ?auto_62128 ?auto_62131 ) ) ( not ( = ?auto_62128 ?auto_62132 ) ) ( not ( = ?auto_62128 ?auto_62133 ) ) ( not ( = ?auto_62128 ?auto_62134 ) ) ( not ( = ?auto_62128 ?auto_62135 ) ) ( not ( = ?auto_62128 ?auto_62136 ) ) ( not ( = ?auto_62128 ?auto_62137 ) ) ( not ( = ?auto_62129 ?auto_62130 ) ) ( not ( = ?auto_62129 ?auto_62131 ) ) ( not ( = ?auto_62129 ?auto_62132 ) ) ( not ( = ?auto_62129 ?auto_62133 ) ) ( not ( = ?auto_62129 ?auto_62134 ) ) ( not ( = ?auto_62129 ?auto_62135 ) ) ( not ( = ?auto_62129 ?auto_62136 ) ) ( not ( = ?auto_62129 ?auto_62137 ) ) ( not ( = ?auto_62130 ?auto_62131 ) ) ( not ( = ?auto_62130 ?auto_62132 ) ) ( not ( = ?auto_62130 ?auto_62133 ) ) ( not ( = ?auto_62130 ?auto_62134 ) ) ( not ( = ?auto_62130 ?auto_62135 ) ) ( not ( = ?auto_62130 ?auto_62136 ) ) ( not ( = ?auto_62130 ?auto_62137 ) ) ( not ( = ?auto_62131 ?auto_62132 ) ) ( not ( = ?auto_62131 ?auto_62133 ) ) ( not ( = ?auto_62131 ?auto_62134 ) ) ( not ( = ?auto_62131 ?auto_62135 ) ) ( not ( = ?auto_62131 ?auto_62136 ) ) ( not ( = ?auto_62131 ?auto_62137 ) ) ( not ( = ?auto_62132 ?auto_62133 ) ) ( not ( = ?auto_62132 ?auto_62134 ) ) ( not ( = ?auto_62132 ?auto_62135 ) ) ( not ( = ?auto_62132 ?auto_62136 ) ) ( not ( = ?auto_62132 ?auto_62137 ) ) ( not ( = ?auto_62133 ?auto_62134 ) ) ( not ( = ?auto_62133 ?auto_62135 ) ) ( not ( = ?auto_62133 ?auto_62136 ) ) ( not ( = ?auto_62133 ?auto_62137 ) ) ( not ( = ?auto_62134 ?auto_62135 ) ) ( not ( = ?auto_62134 ?auto_62136 ) ) ( not ( = ?auto_62134 ?auto_62137 ) ) ( not ( = ?auto_62135 ?auto_62136 ) ) ( not ( = ?auto_62135 ?auto_62137 ) ) ( not ( = ?auto_62136 ?auto_62137 ) ) ( ON ?auto_62135 ?auto_62136 ) ( ON ?auto_62134 ?auto_62135 ) ( CLEAR ?auto_62132 ) ( ON ?auto_62133 ?auto_62134 ) ( CLEAR ?auto_62133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_62128 ?auto_62129 ?auto_62130 ?auto_62131 ?auto_62132 ?auto_62133 )
      ( MAKE-9PILE ?auto_62128 ?auto_62129 ?auto_62130 ?auto_62131 ?auto_62132 ?auto_62133 ?auto_62134 ?auto_62135 ?auto_62136 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62147 - BLOCK
      ?auto_62148 - BLOCK
      ?auto_62149 - BLOCK
      ?auto_62150 - BLOCK
      ?auto_62151 - BLOCK
      ?auto_62152 - BLOCK
      ?auto_62153 - BLOCK
      ?auto_62154 - BLOCK
      ?auto_62155 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62155 ) ( ON-TABLE ?auto_62147 ) ( ON ?auto_62148 ?auto_62147 ) ( ON ?auto_62149 ?auto_62148 ) ( ON ?auto_62150 ?auto_62149 ) ( ON ?auto_62151 ?auto_62150 ) ( not ( = ?auto_62147 ?auto_62148 ) ) ( not ( = ?auto_62147 ?auto_62149 ) ) ( not ( = ?auto_62147 ?auto_62150 ) ) ( not ( = ?auto_62147 ?auto_62151 ) ) ( not ( = ?auto_62147 ?auto_62152 ) ) ( not ( = ?auto_62147 ?auto_62153 ) ) ( not ( = ?auto_62147 ?auto_62154 ) ) ( not ( = ?auto_62147 ?auto_62155 ) ) ( not ( = ?auto_62148 ?auto_62149 ) ) ( not ( = ?auto_62148 ?auto_62150 ) ) ( not ( = ?auto_62148 ?auto_62151 ) ) ( not ( = ?auto_62148 ?auto_62152 ) ) ( not ( = ?auto_62148 ?auto_62153 ) ) ( not ( = ?auto_62148 ?auto_62154 ) ) ( not ( = ?auto_62148 ?auto_62155 ) ) ( not ( = ?auto_62149 ?auto_62150 ) ) ( not ( = ?auto_62149 ?auto_62151 ) ) ( not ( = ?auto_62149 ?auto_62152 ) ) ( not ( = ?auto_62149 ?auto_62153 ) ) ( not ( = ?auto_62149 ?auto_62154 ) ) ( not ( = ?auto_62149 ?auto_62155 ) ) ( not ( = ?auto_62150 ?auto_62151 ) ) ( not ( = ?auto_62150 ?auto_62152 ) ) ( not ( = ?auto_62150 ?auto_62153 ) ) ( not ( = ?auto_62150 ?auto_62154 ) ) ( not ( = ?auto_62150 ?auto_62155 ) ) ( not ( = ?auto_62151 ?auto_62152 ) ) ( not ( = ?auto_62151 ?auto_62153 ) ) ( not ( = ?auto_62151 ?auto_62154 ) ) ( not ( = ?auto_62151 ?auto_62155 ) ) ( not ( = ?auto_62152 ?auto_62153 ) ) ( not ( = ?auto_62152 ?auto_62154 ) ) ( not ( = ?auto_62152 ?auto_62155 ) ) ( not ( = ?auto_62153 ?auto_62154 ) ) ( not ( = ?auto_62153 ?auto_62155 ) ) ( not ( = ?auto_62154 ?auto_62155 ) ) ( ON ?auto_62154 ?auto_62155 ) ( ON ?auto_62153 ?auto_62154 ) ( CLEAR ?auto_62151 ) ( ON ?auto_62152 ?auto_62153 ) ( CLEAR ?auto_62152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_62147 ?auto_62148 ?auto_62149 ?auto_62150 ?auto_62151 ?auto_62152 )
      ( MAKE-9PILE ?auto_62147 ?auto_62148 ?auto_62149 ?auto_62150 ?auto_62151 ?auto_62152 ?auto_62153 ?auto_62154 ?auto_62155 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62165 - BLOCK
      ?auto_62166 - BLOCK
      ?auto_62167 - BLOCK
      ?auto_62168 - BLOCK
      ?auto_62169 - BLOCK
      ?auto_62170 - BLOCK
      ?auto_62171 - BLOCK
      ?auto_62172 - BLOCK
      ?auto_62173 - BLOCK
    )
    :vars
    (
      ?auto_62174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62173 ?auto_62174 ) ( ON-TABLE ?auto_62165 ) ( ON ?auto_62166 ?auto_62165 ) ( ON ?auto_62167 ?auto_62166 ) ( ON ?auto_62168 ?auto_62167 ) ( not ( = ?auto_62165 ?auto_62166 ) ) ( not ( = ?auto_62165 ?auto_62167 ) ) ( not ( = ?auto_62165 ?auto_62168 ) ) ( not ( = ?auto_62165 ?auto_62169 ) ) ( not ( = ?auto_62165 ?auto_62170 ) ) ( not ( = ?auto_62165 ?auto_62171 ) ) ( not ( = ?auto_62165 ?auto_62172 ) ) ( not ( = ?auto_62165 ?auto_62173 ) ) ( not ( = ?auto_62165 ?auto_62174 ) ) ( not ( = ?auto_62166 ?auto_62167 ) ) ( not ( = ?auto_62166 ?auto_62168 ) ) ( not ( = ?auto_62166 ?auto_62169 ) ) ( not ( = ?auto_62166 ?auto_62170 ) ) ( not ( = ?auto_62166 ?auto_62171 ) ) ( not ( = ?auto_62166 ?auto_62172 ) ) ( not ( = ?auto_62166 ?auto_62173 ) ) ( not ( = ?auto_62166 ?auto_62174 ) ) ( not ( = ?auto_62167 ?auto_62168 ) ) ( not ( = ?auto_62167 ?auto_62169 ) ) ( not ( = ?auto_62167 ?auto_62170 ) ) ( not ( = ?auto_62167 ?auto_62171 ) ) ( not ( = ?auto_62167 ?auto_62172 ) ) ( not ( = ?auto_62167 ?auto_62173 ) ) ( not ( = ?auto_62167 ?auto_62174 ) ) ( not ( = ?auto_62168 ?auto_62169 ) ) ( not ( = ?auto_62168 ?auto_62170 ) ) ( not ( = ?auto_62168 ?auto_62171 ) ) ( not ( = ?auto_62168 ?auto_62172 ) ) ( not ( = ?auto_62168 ?auto_62173 ) ) ( not ( = ?auto_62168 ?auto_62174 ) ) ( not ( = ?auto_62169 ?auto_62170 ) ) ( not ( = ?auto_62169 ?auto_62171 ) ) ( not ( = ?auto_62169 ?auto_62172 ) ) ( not ( = ?auto_62169 ?auto_62173 ) ) ( not ( = ?auto_62169 ?auto_62174 ) ) ( not ( = ?auto_62170 ?auto_62171 ) ) ( not ( = ?auto_62170 ?auto_62172 ) ) ( not ( = ?auto_62170 ?auto_62173 ) ) ( not ( = ?auto_62170 ?auto_62174 ) ) ( not ( = ?auto_62171 ?auto_62172 ) ) ( not ( = ?auto_62171 ?auto_62173 ) ) ( not ( = ?auto_62171 ?auto_62174 ) ) ( not ( = ?auto_62172 ?auto_62173 ) ) ( not ( = ?auto_62172 ?auto_62174 ) ) ( not ( = ?auto_62173 ?auto_62174 ) ) ( ON ?auto_62172 ?auto_62173 ) ( ON ?auto_62171 ?auto_62172 ) ( ON ?auto_62170 ?auto_62171 ) ( CLEAR ?auto_62168 ) ( ON ?auto_62169 ?auto_62170 ) ( CLEAR ?auto_62169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62165 ?auto_62166 ?auto_62167 ?auto_62168 ?auto_62169 )
      ( MAKE-9PILE ?auto_62165 ?auto_62166 ?auto_62167 ?auto_62168 ?auto_62169 ?auto_62170 ?auto_62171 ?auto_62172 ?auto_62173 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62184 - BLOCK
      ?auto_62185 - BLOCK
      ?auto_62186 - BLOCK
      ?auto_62187 - BLOCK
      ?auto_62188 - BLOCK
      ?auto_62189 - BLOCK
      ?auto_62190 - BLOCK
      ?auto_62191 - BLOCK
      ?auto_62192 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62192 ) ( ON-TABLE ?auto_62184 ) ( ON ?auto_62185 ?auto_62184 ) ( ON ?auto_62186 ?auto_62185 ) ( ON ?auto_62187 ?auto_62186 ) ( not ( = ?auto_62184 ?auto_62185 ) ) ( not ( = ?auto_62184 ?auto_62186 ) ) ( not ( = ?auto_62184 ?auto_62187 ) ) ( not ( = ?auto_62184 ?auto_62188 ) ) ( not ( = ?auto_62184 ?auto_62189 ) ) ( not ( = ?auto_62184 ?auto_62190 ) ) ( not ( = ?auto_62184 ?auto_62191 ) ) ( not ( = ?auto_62184 ?auto_62192 ) ) ( not ( = ?auto_62185 ?auto_62186 ) ) ( not ( = ?auto_62185 ?auto_62187 ) ) ( not ( = ?auto_62185 ?auto_62188 ) ) ( not ( = ?auto_62185 ?auto_62189 ) ) ( not ( = ?auto_62185 ?auto_62190 ) ) ( not ( = ?auto_62185 ?auto_62191 ) ) ( not ( = ?auto_62185 ?auto_62192 ) ) ( not ( = ?auto_62186 ?auto_62187 ) ) ( not ( = ?auto_62186 ?auto_62188 ) ) ( not ( = ?auto_62186 ?auto_62189 ) ) ( not ( = ?auto_62186 ?auto_62190 ) ) ( not ( = ?auto_62186 ?auto_62191 ) ) ( not ( = ?auto_62186 ?auto_62192 ) ) ( not ( = ?auto_62187 ?auto_62188 ) ) ( not ( = ?auto_62187 ?auto_62189 ) ) ( not ( = ?auto_62187 ?auto_62190 ) ) ( not ( = ?auto_62187 ?auto_62191 ) ) ( not ( = ?auto_62187 ?auto_62192 ) ) ( not ( = ?auto_62188 ?auto_62189 ) ) ( not ( = ?auto_62188 ?auto_62190 ) ) ( not ( = ?auto_62188 ?auto_62191 ) ) ( not ( = ?auto_62188 ?auto_62192 ) ) ( not ( = ?auto_62189 ?auto_62190 ) ) ( not ( = ?auto_62189 ?auto_62191 ) ) ( not ( = ?auto_62189 ?auto_62192 ) ) ( not ( = ?auto_62190 ?auto_62191 ) ) ( not ( = ?auto_62190 ?auto_62192 ) ) ( not ( = ?auto_62191 ?auto_62192 ) ) ( ON ?auto_62191 ?auto_62192 ) ( ON ?auto_62190 ?auto_62191 ) ( ON ?auto_62189 ?auto_62190 ) ( CLEAR ?auto_62187 ) ( ON ?auto_62188 ?auto_62189 ) ( CLEAR ?auto_62188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62184 ?auto_62185 ?auto_62186 ?auto_62187 ?auto_62188 )
      ( MAKE-9PILE ?auto_62184 ?auto_62185 ?auto_62186 ?auto_62187 ?auto_62188 ?auto_62189 ?auto_62190 ?auto_62191 ?auto_62192 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62202 - BLOCK
      ?auto_62203 - BLOCK
      ?auto_62204 - BLOCK
      ?auto_62205 - BLOCK
      ?auto_62206 - BLOCK
      ?auto_62207 - BLOCK
      ?auto_62208 - BLOCK
      ?auto_62209 - BLOCK
      ?auto_62210 - BLOCK
    )
    :vars
    (
      ?auto_62211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62210 ?auto_62211 ) ( ON-TABLE ?auto_62202 ) ( ON ?auto_62203 ?auto_62202 ) ( ON ?auto_62204 ?auto_62203 ) ( not ( = ?auto_62202 ?auto_62203 ) ) ( not ( = ?auto_62202 ?auto_62204 ) ) ( not ( = ?auto_62202 ?auto_62205 ) ) ( not ( = ?auto_62202 ?auto_62206 ) ) ( not ( = ?auto_62202 ?auto_62207 ) ) ( not ( = ?auto_62202 ?auto_62208 ) ) ( not ( = ?auto_62202 ?auto_62209 ) ) ( not ( = ?auto_62202 ?auto_62210 ) ) ( not ( = ?auto_62202 ?auto_62211 ) ) ( not ( = ?auto_62203 ?auto_62204 ) ) ( not ( = ?auto_62203 ?auto_62205 ) ) ( not ( = ?auto_62203 ?auto_62206 ) ) ( not ( = ?auto_62203 ?auto_62207 ) ) ( not ( = ?auto_62203 ?auto_62208 ) ) ( not ( = ?auto_62203 ?auto_62209 ) ) ( not ( = ?auto_62203 ?auto_62210 ) ) ( not ( = ?auto_62203 ?auto_62211 ) ) ( not ( = ?auto_62204 ?auto_62205 ) ) ( not ( = ?auto_62204 ?auto_62206 ) ) ( not ( = ?auto_62204 ?auto_62207 ) ) ( not ( = ?auto_62204 ?auto_62208 ) ) ( not ( = ?auto_62204 ?auto_62209 ) ) ( not ( = ?auto_62204 ?auto_62210 ) ) ( not ( = ?auto_62204 ?auto_62211 ) ) ( not ( = ?auto_62205 ?auto_62206 ) ) ( not ( = ?auto_62205 ?auto_62207 ) ) ( not ( = ?auto_62205 ?auto_62208 ) ) ( not ( = ?auto_62205 ?auto_62209 ) ) ( not ( = ?auto_62205 ?auto_62210 ) ) ( not ( = ?auto_62205 ?auto_62211 ) ) ( not ( = ?auto_62206 ?auto_62207 ) ) ( not ( = ?auto_62206 ?auto_62208 ) ) ( not ( = ?auto_62206 ?auto_62209 ) ) ( not ( = ?auto_62206 ?auto_62210 ) ) ( not ( = ?auto_62206 ?auto_62211 ) ) ( not ( = ?auto_62207 ?auto_62208 ) ) ( not ( = ?auto_62207 ?auto_62209 ) ) ( not ( = ?auto_62207 ?auto_62210 ) ) ( not ( = ?auto_62207 ?auto_62211 ) ) ( not ( = ?auto_62208 ?auto_62209 ) ) ( not ( = ?auto_62208 ?auto_62210 ) ) ( not ( = ?auto_62208 ?auto_62211 ) ) ( not ( = ?auto_62209 ?auto_62210 ) ) ( not ( = ?auto_62209 ?auto_62211 ) ) ( not ( = ?auto_62210 ?auto_62211 ) ) ( ON ?auto_62209 ?auto_62210 ) ( ON ?auto_62208 ?auto_62209 ) ( ON ?auto_62207 ?auto_62208 ) ( ON ?auto_62206 ?auto_62207 ) ( CLEAR ?auto_62204 ) ( ON ?auto_62205 ?auto_62206 ) ( CLEAR ?auto_62205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62202 ?auto_62203 ?auto_62204 ?auto_62205 )
      ( MAKE-9PILE ?auto_62202 ?auto_62203 ?auto_62204 ?auto_62205 ?auto_62206 ?auto_62207 ?auto_62208 ?auto_62209 ?auto_62210 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62221 - BLOCK
      ?auto_62222 - BLOCK
      ?auto_62223 - BLOCK
      ?auto_62224 - BLOCK
      ?auto_62225 - BLOCK
      ?auto_62226 - BLOCK
      ?auto_62227 - BLOCK
      ?auto_62228 - BLOCK
      ?auto_62229 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62229 ) ( ON-TABLE ?auto_62221 ) ( ON ?auto_62222 ?auto_62221 ) ( ON ?auto_62223 ?auto_62222 ) ( not ( = ?auto_62221 ?auto_62222 ) ) ( not ( = ?auto_62221 ?auto_62223 ) ) ( not ( = ?auto_62221 ?auto_62224 ) ) ( not ( = ?auto_62221 ?auto_62225 ) ) ( not ( = ?auto_62221 ?auto_62226 ) ) ( not ( = ?auto_62221 ?auto_62227 ) ) ( not ( = ?auto_62221 ?auto_62228 ) ) ( not ( = ?auto_62221 ?auto_62229 ) ) ( not ( = ?auto_62222 ?auto_62223 ) ) ( not ( = ?auto_62222 ?auto_62224 ) ) ( not ( = ?auto_62222 ?auto_62225 ) ) ( not ( = ?auto_62222 ?auto_62226 ) ) ( not ( = ?auto_62222 ?auto_62227 ) ) ( not ( = ?auto_62222 ?auto_62228 ) ) ( not ( = ?auto_62222 ?auto_62229 ) ) ( not ( = ?auto_62223 ?auto_62224 ) ) ( not ( = ?auto_62223 ?auto_62225 ) ) ( not ( = ?auto_62223 ?auto_62226 ) ) ( not ( = ?auto_62223 ?auto_62227 ) ) ( not ( = ?auto_62223 ?auto_62228 ) ) ( not ( = ?auto_62223 ?auto_62229 ) ) ( not ( = ?auto_62224 ?auto_62225 ) ) ( not ( = ?auto_62224 ?auto_62226 ) ) ( not ( = ?auto_62224 ?auto_62227 ) ) ( not ( = ?auto_62224 ?auto_62228 ) ) ( not ( = ?auto_62224 ?auto_62229 ) ) ( not ( = ?auto_62225 ?auto_62226 ) ) ( not ( = ?auto_62225 ?auto_62227 ) ) ( not ( = ?auto_62225 ?auto_62228 ) ) ( not ( = ?auto_62225 ?auto_62229 ) ) ( not ( = ?auto_62226 ?auto_62227 ) ) ( not ( = ?auto_62226 ?auto_62228 ) ) ( not ( = ?auto_62226 ?auto_62229 ) ) ( not ( = ?auto_62227 ?auto_62228 ) ) ( not ( = ?auto_62227 ?auto_62229 ) ) ( not ( = ?auto_62228 ?auto_62229 ) ) ( ON ?auto_62228 ?auto_62229 ) ( ON ?auto_62227 ?auto_62228 ) ( ON ?auto_62226 ?auto_62227 ) ( ON ?auto_62225 ?auto_62226 ) ( CLEAR ?auto_62223 ) ( ON ?auto_62224 ?auto_62225 ) ( CLEAR ?auto_62224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62221 ?auto_62222 ?auto_62223 ?auto_62224 )
      ( MAKE-9PILE ?auto_62221 ?auto_62222 ?auto_62223 ?auto_62224 ?auto_62225 ?auto_62226 ?auto_62227 ?auto_62228 ?auto_62229 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62239 - BLOCK
      ?auto_62240 - BLOCK
      ?auto_62241 - BLOCK
      ?auto_62242 - BLOCK
      ?auto_62243 - BLOCK
      ?auto_62244 - BLOCK
      ?auto_62245 - BLOCK
      ?auto_62246 - BLOCK
      ?auto_62247 - BLOCK
    )
    :vars
    (
      ?auto_62248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62247 ?auto_62248 ) ( ON-TABLE ?auto_62239 ) ( ON ?auto_62240 ?auto_62239 ) ( not ( = ?auto_62239 ?auto_62240 ) ) ( not ( = ?auto_62239 ?auto_62241 ) ) ( not ( = ?auto_62239 ?auto_62242 ) ) ( not ( = ?auto_62239 ?auto_62243 ) ) ( not ( = ?auto_62239 ?auto_62244 ) ) ( not ( = ?auto_62239 ?auto_62245 ) ) ( not ( = ?auto_62239 ?auto_62246 ) ) ( not ( = ?auto_62239 ?auto_62247 ) ) ( not ( = ?auto_62239 ?auto_62248 ) ) ( not ( = ?auto_62240 ?auto_62241 ) ) ( not ( = ?auto_62240 ?auto_62242 ) ) ( not ( = ?auto_62240 ?auto_62243 ) ) ( not ( = ?auto_62240 ?auto_62244 ) ) ( not ( = ?auto_62240 ?auto_62245 ) ) ( not ( = ?auto_62240 ?auto_62246 ) ) ( not ( = ?auto_62240 ?auto_62247 ) ) ( not ( = ?auto_62240 ?auto_62248 ) ) ( not ( = ?auto_62241 ?auto_62242 ) ) ( not ( = ?auto_62241 ?auto_62243 ) ) ( not ( = ?auto_62241 ?auto_62244 ) ) ( not ( = ?auto_62241 ?auto_62245 ) ) ( not ( = ?auto_62241 ?auto_62246 ) ) ( not ( = ?auto_62241 ?auto_62247 ) ) ( not ( = ?auto_62241 ?auto_62248 ) ) ( not ( = ?auto_62242 ?auto_62243 ) ) ( not ( = ?auto_62242 ?auto_62244 ) ) ( not ( = ?auto_62242 ?auto_62245 ) ) ( not ( = ?auto_62242 ?auto_62246 ) ) ( not ( = ?auto_62242 ?auto_62247 ) ) ( not ( = ?auto_62242 ?auto_62248 ) ) ( not ( = ?auto_62243 ?auto_62244 ) ) ( not ( = ?auto_62243 ?auto_62245 ) ) ( not ( = ?auto_62243 ?auto_62246 ) ) ( not ( = ?auto_62243 ?auto_62247 ) ) ( not ( = ?auto_62243 ?auto_62248 ) ) ( not ( = ?auto_62244 ?auto_62245 ) ) ( not ( = ?auto_62244 ?auto_62246 ) ) ( not ( = ?auto_62244 ?auto_62247 ) ) ( not ( = ?auto_62244 ?auto_62248 ) ) ( not ( = ?auto_62245 ?auto_62246 ) ) ( not ( = ?auto_62245 ?auto_62247 ) ) ( not ( = ?auto_62245 ?auto_62248 ) ) ( not ( = ?auto_62246 ?auto_62247 ) ) ( not ( = ?auto_62246 ?auto_62248 ) ) ( not ( = ?auto_62247 ?auto_62248 ) ) ( ON ?auto_62246 ?auto_62247 ) ( ON ?auto_62245 ?auto_62246 ) ( ON ?auto_62244 ?auto_62245 ) ( ON ?auto_62243 ?auto_62244 ) ( ON ?auto_62242 ?auto_62243 ) ( CLEAR ?auto_62240 ) ( ON ?auto_62241 ?auto_62242 ) ( CLEAR ?auto_62241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62239 ?auto_62240 ?auto_62241 )
      ( MAKE-9PILE ?auto_62239 ?auto_62240 ?auto_62241 ?auto_62242 ?auto_62243 ?auto_62244 ?auto_62245 ?auto_62246 ?auto_62247 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62258 - BLOCK
      ?auto_62259 - BLOCK
      ?auto_62260 - BLOCK
      ?auto_62261 - BLOCK
      ?auto_62262 - BLOCK
      ?auto_62263 - BLOCK
      ?auto_62264 - BLOCK
      ?auto_62265 - BLOCK
      ?auto_62266 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62266 ) ( ON-TABLE ?auto_62258 ) ( ON ?auto_62259 ?auto_62258 ) ( not ( = ?auto_62258 ?auto_62259 ) ) ( not ( = ?auto_62258 ?auto_62260 ) ) ( not ( = ?auto_62258 ?auto_62261 ) ) ( not ( = ?auto_62258 ?auto_62262 ) ) ( not ( = ?auto_62258 ?auto_62263 ) ) ( not ( = ?auto_62258 ?auto_62264 ) ) ( not ( = ?auto_62258 ?auto_62265 ) ) ( not ( = ?auto_62258 ?auto_62266 ) ) ( not ( = ?auto_62259 ?auto_62260 ) ) ( not ( = ?auto_62259 ?auto_62261 ) ) ( not ( = ?auto_62259 ?auto_62262 ) ) ( not ( = ?auto_62259 ?auto_62263 ) ) ( not ( = ?auto_62259 ?auto_62264 ) ) ( not ( = ?auto_62259 ?auto_62265 ) ) ( not ( = ?auto_62259 ?auto_62266 ) ) ( not ( = ?auto_62260 ?auto_62261 ) ) ( not ( = ?auto_62260 ?auto_62262 ) ) ( not ( = ?auto_62260 ?auto_62263 ) ) ( not ( = ?auto_62260 ?auto_62264 ) ) ( not ( = ?auto_62260 ?auto_62265 ) ) ( not ( = ?auto_62260 ?auto_62266 ) ) ( not ( = ?auto_62261 ?auto_62262 ) ) ( not ( = ?auto_62261 ?auto_62263 ) ) ( not ( = ?auto_62261 ?auto_62264 ) ) ( not ( = ?auto_62261 ?auto_62265 ) ) ( not ( = ?auto_62261 ?auto_62266 ) ) ( not ( = ?auto_62262 ?auto_62263 ) ) ( not ( = ?auto_62262 ?auto_62264 ) ) ( not ( = ?auto_62262 ?auto_62265 ) ) ( not ( = ?auto_62262 ?auto_62266 ) ) ( not ( = ?auto_62263 ?auto_62264 ) ) ( not ( = ?auto_62263 ?auto_62265 ) ) ( not ( = ?auto_62263 ?auto_62266 ) ) ( not ( = ?auto_62264 ?auto_62265 ) ) ( not ( = ?auto_62264 ?auto_62266 ) ) ( not ( = ?auto_62265 ?auto_62266 ) ) ( ON ?auto_62265 ?auto_62266 ) ( ON ?auto_62264 ?auto_62265 ) ( ON ?auto_62263 ?auto_62264 ) ( ON ?auto_62262 ?auto_62263 ) ( ON ?auto_62261 ?auto_62262 ) ( CLEAR ?auto_62259 ) ( ON ?auto_62260 ?auto_62261 ) ( CLEAR ?auto_62260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62258 ?auto_62259 ?auto_62260 )
      ( MAKE-9PILE ?auto_62258 ?auto_62259 ?auto_62260 ?auto_62261 ?auto_62262 ?auto_62263 ?auto_62264 ?auto_62265 ?auto_62266 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62276 - BLOCK
      ?auto_62277 - BLOCK
      ?auto_62278 - BLOCK
      ?auto_62279 - BLOCK
      ?auto_62280 - BLOCK
      ?auto_62281 - BLOCK
      ?auto_62282 - BLOCK
      ?auto_62283 - BLOCK
      ?auto_62284 - BLOCK
    )
    :vars
    (
      ?auto_62285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62284 ?auto_62285 ) ( ON-TABLE ?auto_62276 ) ( not ( = ?auto_62276 ?auto_62277 ) ) ( not ( = ?auto_62276 ?auto_62278 ) ) ( not ( = ?auto_62276 ?auto_62279 ) ) ( not ( = ?auto_62276 ?auto_62280 ) ) ( not ( = ?auto_62276 ?auto_62281 ) ) ( not ( = ?auto_62276 ?auto_62282 ) ) ( not ( = ?auto_62276 ?auto_62283 ) ) ( not ( = ?auto_62276 ?auto_62284 ) ) ( not ( = ?auto_62276 ?auto_62285 ) ) ( not ( = ?auto_62277 ?auto_62278 ) ) ( not ( = ?auto_62277 ?auto_62279 ) ) ( not ( = ?auto_62277 ?auto_62280 ) ) ( not ( = ?auto_62277 ?auto_62281 ) ) ( not ( = ?auto_62277 ?auto_62282 ) ) ( not ( = ?auto_62277 ?auto_62283 ) ) ( not ( = ?auto_62277 ?auto_62284 ) ) ( not ( = ?auto_62277 ?auto_62285 ) ) ( not ( = ?auto_62278 ?auto_62279 ) ) ( not ( = ?auto_62278 ?auto_62280 ) ) ( not ( = ?auto_62278 ?auto_62281 ) ) ( not ( = ?auto_62278 ?auto_62282 ) ) ( not ( = ?auto_62278 ?auto_62283 ) ) ( not ( = ?auto_62278 ?auto_62284 ) ) ( not ( = ?auto_62278 ?auto_62285 ) ) ( not ( = ?auto_62279 ?auto_62280 ) ) ( not ( = ?auto_62279 ?auto_62281 ) ) ( not ( = ?auto_62279 ?auto_62282 ) ) ( not ( = ?auto_62279 ?auto_62283 ) ) ( not ( = ?auto_62279 ?auto_62284 ) ) ( not ( = ?auto_62279 ?auto_62285 ) ) ( not ( = ?auto_62280 ?auto_62281 ) ) ( not ( = ?auto_62280 ?auto_62282 ) ) ( not ( = ?auto_62280 ?auto_62283 ) ) ( not ( = ?auto_62280 ?auto_62284 ) ) ( not ( = ?auto_62280 ?auto_62285 ) ) ( not ( = ?auto_62281 ?auto_62282 ) ) ( not ( = ?auto_62281 ?auto_62283 ) ) ( not ( = ?auto_62281 ?auto_62284 ) ) ( not ( = ?auto_62281 ?auto_62285 ) ) ( not ( = ?auto_62282 ?auto_62283 ) ) ( not ( = ?auto_62282 ?auto_62284 ) ) ( not ( = ?auto_62282 ?auto_62285 ) ) ( not ( = ?auto_62283 ?auto_62284 ) ) ( not ( = ?auto_62283 ?auto_62285 ) ) ( not ( = ?auto_62284 ?auto_62285 ) ) ( ON ?auto_62283 ?auto_62284 ) ( ON ?auto_62282 ?auto_62283 ) ( ON ?auto_62281 ?auto_62282 ) ( ON ?auto_62280 ?auto_62281 ) ( ON ?auto_62279 ?auto_62280 ) ( ON ?auto_62278 ?auto_62279 ) ( CLEAR ?auto_62276 ) ( ON ?auto_62277 ?auto_62278 ) ( CLEAR ?auto_62277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62276 ?auto_62277 )
      ( MAKE-9PILE ?auto_62276 ?auto_62277 ?auto_62278 ?auto_62279 ?auto_62280 ?auto_62281 ?auto_62282 ?auto_62283 ?auto_62284 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62295 - BLOCK
      ?auto_62296 - BLOCK
      ?auto_62297 - BLOCK
      ?auto_62298 - BLOCK
      ?auto_62299 - BLOCK
      ?auto_62300 - BLOCK
      ?auto_62301 - BLOCK
      ?auto_62302 - BLOCK
      ?auto_62303 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62303 ) ( ON-TABLE ?auto_62295 ) ( not ( = ?auto_62295 ?auto_62296 ) ) ( not ( = ?auto_62295 ?auto_62297 ) ) ( not ( = ?auto_62295 ?auto_62298 ) ) ( not ( = ?auto_62295 ?auto_62299 ) ) ( not ( = ?auto_62295 ?auto_62300 ) ) ( not ( = ?auto_62295 ?auto_62301 ) ) ( not ( = ?auto_62295 ?auto_62302 ) ) ( not ( = ?auto_62295 ?auto_62303 ) ) ( not ( = ?auto_62296 ?auto_62297 ) ) ( not ( = ?auto_62296 ?auto_62298 ) ) ( not ( = ?auto_62296 ?auto_62299 ) ) ( not ( = ?auto_62296 ?auto_62300 ) ) ( not ( = ?auto_62296 ?auto_62301 ) ) ( not ( = ?auto_62296 ?auto_62302 ) ) ( not ( = ?auto_62296 ?auto_62303 ) ) ( not ( = ?auto_62297 ?auto_62298 ) ) ( not ( = ?auto_62297 ?auto_62299 ) ) ( not ( = ?auto_62297 ?auto_62300 ) ) ( not ( = ?auto_62297 ?auto_62301 ) ) ( not ( = ?auto_62297 ?auto_62302 ) ) ( not ( = ?auto_62297 ?auto_62303 ) ) ( not ( = ?auto_62298 ?auto_62299 ) ) ( not ( = ?auto_62298 ?auto_62300 ) ) ( not ( = ?auto_62298 ?auto_62301 ) ) ( not ( = ?auto_62298 ?auto_62302 ) ) ( not ( = ?auto_62298 ?auto_62303 ) ) ( not ( = ?auto_62299 ?auto_62300 ) ) ( not ( = ?auto_62299 ?auto_62301 ) ) ( not ( = ?auto_62299 ?auto_62302 ) ) ( not ( = ?auto_62299 ?auto_62303 ) ) ( not ( = ?auto_62300 ?auto_62301 ) ) ( not ( = ?auto_62300 ?auto_62302 ) ) ( not ( = ?auto_62300 ?auto_62303 ) ) ( not ( = ?auto_62301 ?auto_62302 ) ) ( not ( = ?auto_62301 ?auto_62303 ) ) ( not ( = ?auto_62302 ?auto_62303 ) ) ( ON ?auto_62302 ?auto_62303 ) ( ON ?auto_62301 ?auto_62302 ) ( ON ?auto_62300 ?auto_62301 ) ( ON ?auto_62299 ?auto_62300 ) ( ON ?auto_62298 ?auto_62299 ) ( ON ?auto_62297 ?auto_62298 ) ( CLEAR ?auto_62295 ) ( ON ?auto_62296 ?auto_62297 ) ( CLEAR ?auto_62296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62295 ?auto_62296 )
      ( MAKE-9PILE ?auto_62295 ?auto_62296 ?auto_62297 ?auto_62298 ?auto_62299 ?auto_62300 ?auto_62301 ?auto_62302 ?auto_62303 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62313 - BLOCK
      ?auto_62314 - BLOCK
      ?auto_62315 - BLOCK
      ?auto_62316 - BLOCK
      ?auto_62317 - BLOCK
      ?auto_62318 - BLOCK
      ?auto_62319 - BLOCK
      ?auto_62320 - BLOCK
      ?auto_62321 - BLOCK
    )
    :vars
    (
      ?auto_62322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62321 ?auto_62322 ) ( not ( = ?auto_62313 ?auto_62314 ) ) ( not ( = ?auto_62313 ?auto_62315 ) ) ( not ( = ?auto_62313 ?auto_62316 ) ) ( not ( = ?auto_62313 ?auto_62317 ) ) ( not ( = ?auto_62313 ?auto_62318 ) ) ( not ( = ?auto_62313 ?auto_62319 ) ) ( not ( = ?auto_62313 ?auto_62320 ) ) ( not ( = ?auto_62313 ?auto_62321 ) ) ( not ( = ?auto_62313 ?auto_62322 ) ) ( not ( = ?auto_62314 ?auto_62315 ) ) ( not ( = ?auto_62314 ?auto_62316 ) ) ( not ( = ?auto_62314 ?auto_62317 ) ) ( not ( = ?auto_62314 ?auto_62318 ) ) ( not ( = ?auto_62314 ?auto_62319 ) ) ( not ( = ?auto_62314 ?auto_62320 ) ) ( not ( = ?auto_62314 ?auto_62321 ) ) ( not ( = ?auto_62314 ?auto_62322 ) ) ( not ( = ?auto_62315 ?auto_62316 ) ) ( not ( = ?auto_62315 ?auto_62317 ) ) ( not ( = ?auto_62315 ?auto_62318 ) ) ( not ( = ?auto_62315 ?auto_62319 ) ) ( not ( = ?auto_62315 ?auto_62320 ) ) ( not ( = ?auto_62315 ?auto_62321 ) ) ( not ( = ?auto_62315 ?auto_62322 ) ) ( not ( = ?auto_62316 ?auto_62317 ) ) ( not ( = ?auto_62316 ?auto_62318 ) ) ( not ( = ?auto_62316 ?auto_62319 ) ) ( not ( = ?auto_62316 ?auto_62320 ) ) ( not ( = ?auto_62316 ?auto_62321 ) ) ( not ( = ?auto_62316 ?auto_62322 ) ) ( not ( = ?auto_62317 ?auto_62318 ) ) ( not ( = ?auto_62317 ?auto_62319 ) ) ( not ( = ?auto_62317 ?auto_62320 ) ) ( not ( = ?auto_62317 ?auto_62321 ) ) ( not ( = ?auto_62317 ?auto_62322 ) ) ( not ( = ?auto_62318 ?auto_62319 ) ) ( not ( = ?auto_62318 ?auto_62320 ) ) ( not ( = ?auto_62318 ?auto_62321 ) ) ( not ( = ?auto_62318 ?auto_62322 ) ) ( not ( = ?auto_62319 ?auto_62320 ) ) ( not ( = ?auto_62319 ?auto_62321 ) ) ( not ( = ?auto_62319 ?auto_62322 ) ) ( not ( = ?auto_62320 ?auto_62321 ) ) ( not ( = ?auto_62320 ?auto_62322 ) ) ( not ( = ?auto_62321 ?auto_62322 ) ) ( ON ?auto_62320 ?auto_62321 ) ( ON ?auto_62319 ?auto_62320 ) ( ON ?auto_62318 ?auto_62319 ) ( ON ?auto_62317 ?auto_62318 ) ( ON ?auto_62316 ?auto_62317 ) ( ON ?auto_62315 ?auto_62316 ) ( ON ?auto_62314 ?auto_62315 ) ( ON ?auto_62313 ?auto_62314 ) ( CLEAR ?auto_62313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62313 )
      ( MAKE-9PILE ?auto_62313 ?auto_62314 ?auto_62315 ?auto_62316 ?auto_62317 ?auto_62318 ?auto_62319 ?auto_62320 ?auto_62321 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62332 - BLOCK
      ?auto_62333 - BLOCK
      ?auto_62334 - BLOCK
      ?auto_62335 - BLOCK
      ?auto_62336 - BLOCK
      ?auto_62337 - BLOCK
      ?auto_62338 - BLOCK
      ?auto_62339 - BLOCK
      ?auto_62340 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62340 ) ( not ( = ?auto_62332 ?auto_62333 ) ) ( not ( = ?auto_62332 ?auto_62334 ) ) ( not ( = ?auto_62332 ?auto_62335 ) ) ( not ( = ?auto_62332 ?auto_62336 ) ) ( not ( = ?auto_62332 ?auto_62337 ) ) ( not ( = ?auto_62332 ?auto_62338 ) ) ( not ( = ?auto_62332 ?auto_62339 ) ) ( not ( = ?auto_62332 ?auto_62340 ) ) ( not ( = ?auto_62333 ?auto_62334 ) ) ( not ( = ?auto_62333 ?auto_62335 ) ) ( not ( = ?auto_62333 ?auto_62336 ) ) ( not ( = ?auto_62333 ?auto_62337 ) ) ( not ( = ?auto_62333 ?auto_62338 ) ) ( not ( = ?auto_62333 ?auto_62339 ) ) ( not ( = ?auto_62333 ?auto_62340 ) ) ( not ( = ?auto_62334 ?auto_62335 ) ) ( not ( = ?auto_62334 ?auto_62336 ) ) ( not ( = ?auto_62334 ?auto_62337 ) ) ( not ( = ?auto_62334 ?auto_62338 ) ) ( not ( = ?auto_62334 ?auto_62339 ) ) ( not ( = ?auto_62334 ?auto_62340 ) ) ( not ( = ?auto_62335 ?auto_62336 ) ) ( not ( = ?auto_62335 ?auto_62337 ) ) ( not ( = ?auto_62335 ?auto_62338 ) ) ( not ( = ?auto_62335 ?auto_62339 ) ) ( not ( = ?auto_62335 ?auto_62340 ) ) ( not ( = ?auto_62336 ?auto_62337 ) ) ( not ( = ?auto_62336 ?auto_62338 ) ) ( not ( = ?auto_62336 ?auto_62339 ) ) ( not ( = ?auto_62336 ?auto_62340 ) ) ( not ( = ?auto_62337 ?auto_62338 ) ) ( not ( = ?auto_62337 ?auto_62339 ) ) ( not ( = ?auto_62337 ?auto_62340 ) ) ( not ( = ?auto_62338 ?auto_62339 ) ) ( not ( = ?auto_62338 ?auto_62340 ) ) ( not ( = ?auto_62339 ?auto_62340 ) ) ( ON ?auto_62339 ?auto_62340 ) ( ON ?auto_62338 ?auto_62339 ) ( ON ?auto_62337 ?auto_62338 ) ( ON ?auto_62336 ?auto_62337 ) ( ON ?auto_62335 ?auto_62336 ) ( ON ?auto_62334 ?auto_62335 ) ( ON ?auto_62333 ?auto_62334 ) ( ON ?auto_62332 ?auto_62333 ) ( CLEAR ?auto_62332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62332 )
      ( MAKE-9PILE ?auto_62332 ?auto_62333 ?auto_62334 ?auto_62335 ?auto_62336 ?auto_62337 ?auto_62338 ?auto_62339 ?auto_62340 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_62350 - BLOCK
      ?auto_62351 - BLOCK
      ?auto_62352 - BLOCK
      ?auto_62353 - BLOCK
      ?auto_62354 - BLOCK
      ?auto_62355 - BLOCK
      ?auto_62356 - BLOCK
      ?auto_62357 - BLOCK
      ?auto_62358 - BLOCK
    )
    :vars
    (
      ?auto_62359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62350 ?auto_62351 ) ) ( not ( = ?auto_62350 ?auto_62352 ) ) ( not ( = ?auto_62350 ?auto_62353 ) ) ( not ( = ?auto_62350 ?auto_62354 ) ) ( not ( = ?auto_62350 ?auto_62355 ) ) ( not ( = ?auto_62350 ?auto_62356 ) ) ( not ( = ?auto_62350 ?auto_62357 ) ) ( not ( = ?auto_62350 ?auto_62358 ) ) ( not ( = ?auto_62351 ?auto_62352 ) ) ( not ( = ?auto_62351 ?auto_62353 ) ) ( not ( = ?auto_62351 ?auto_62354 ) ) ( not ( = ?auto_62351 ?auto_62355 ) ) ( not ( = ?auto_62351 ?auto_62356 ) ) ( not ( = ?auto_62351 ?auto_62357 ) ) ( not ( = ?auto_62351 ?auto_62358 ) ) ( not ( = ?auto_62352 ?auto_62353 ) ) ( not ( = ?auto_62352 ?auto_62354 ) ) ( not ( = ?auto_62352 ?auto_62355 ) ) ( not ( = ?auto_62352 ?auto_62356 ) ) ( not ( = ?auto_62352 ?auto_62357 ) ) ( not ( = ?auto_62352 ?auto_62358 ) ) ( not ( = ?auto_62353 ?auto_62354 ) ) ( not ( = ?auto_62353 ?auto_62355 ) ) ( not ( = ?auto_62353 ?auto_62356 ) ) ( not ( = ?auto_62353 ?auto_62357 ) ) ( not ( = ?auto_62353 ?auto_62358 ) ) ( not ( = ?auto_62354 ?auto_62355 ) ) ( not ( = ?auto_62354 ?auto_62356 ) ) ( not ( = ?auto_62354 ?auto_62357 ) ) ( not ( = ?auto_62354 ?auto_62358 ) ) ( not ( = ?auto_62355 ?auto_62356 ) ) ( not ( = ?auto_62355 ?auto_62357 ) ) ( not ( = ?auto_62355 ?auto_62358 ) ) ( not ( = ?auto_62356 ?auto_62357 ) ) ( not ( = ?auto_62356 ?auto_62358 ) ) ( not ( = ?auto_62357 ?auto_62358 ) ) ( ON ?auto_62350 ?auto_62359 ) ( not ( = ?auto_62358 ?auto_62359 ) ) ( not ( = ?auto_62357 ?auto_62359 ) ) ( not ( = ?auto_62356 ?auto_62359 ) ) ( not ( = ?auto_62355 ?auto_62359 ) ) ( not ( = ?auto_62354 ?auto_62359 ) ) ( not ( = ?auto_62353 ?auto_62359 ) ) ( not ( = ?auto_62352 ?auto_62359 ) ) ( not ( = ?auto_62351 ?auto_62359 ) ) ( not ( = ?auto_62350 ?auto_62359 ) ) ( ON ?auto_62351 ?auto_62350 ) ( ON ?auto_62352 ?auto_62351 ) ( ON ?auto_62353 ?auto_62352 ) ( ON ?auto_62354 ?auto_62353 ) ( ON ?auto_62355 ?auto_62354 ) ( ON ?auto_62356 ?auto_62355 ) ( ON ?auto_62357 ?auto_62356 ) ( ON ?auto_62358 ?auto_62357 ) ( CLEAR ?auto_62358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_62358 ?auto_62357 ?auto_62356 ?auto_62355 ?auto_62354 ?auto_62353 ?auto_62352 ?auto_62351 ?auto_62350 )
      ( MAKE-9PILE ?auto_62350 ?auto_62351 ?auto_62352 ?auto_62353 ?auto_62354 ?auto_62355 ?auto_62356 ?auto_62357 ?auto_62358 ) )
  )

)

