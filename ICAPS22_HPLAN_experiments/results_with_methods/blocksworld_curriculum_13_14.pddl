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
      ?auto_254089 - BLOCK
    )
    :vars
    (
      ?auto_254090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254089 ?auto_254090 ) ( CLEAR ?auto_254089 ) ( HAND-EMPTY ) ( not ( = ?auto_254089 ?auto_254090 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_254089 ?auto_254090 )
      ( !PUTDOWN ?auto_254089 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_254092 - BLOCK
    )
    :vars
    (
      ?auto_254093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254092 ?auto_254093 ) ( CLEAR ?auto_254092 ) ( HAND-EMPTY ) ( not ( = ?auto_254092 ?auto_254093 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_254092 ?auto_254093 )
      ( !PUTDOWN ?auto_254092 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_254096 - BLOCK
      ?auto_254097 - BLOCK
    )
    :vars
    (
      ?auto_254098 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_254096 ) ( ON ?auto_254097 ?auto_254098 ) ( CLEAR ?auto_254097 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_254096 ) ( not ( = ?auto_254096 ?auto_254097 ) ) ( not ( = ?auto_254096 ?auto_254098 ) ) ( not ( = ?auto_254097 ?auto_254098 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_254097 ?auto_254098 )
      ( !STACK ?auto_254097 ?auto_254096 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_254101 - BLOCK
      ?auto_254102 - BLOCK
    )
    :vars
    (
      ?auto_254103 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_254101 ) ( ON ?auto_254102 ?auto_254103 ) ( CLEAR ?auto_254102 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_254101 ) ( not ( = ?auto_254101 ?auto_254102 ) ) ( not ( = ?auto_254101 ?auto_254103 ) ) ( not ( = ?auto_254102 ?auto_254103 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_254102 ?auto_254103 )
      ( !STACK ?auto_254102 ?auto_254101 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_254106 - BLOCK
      ?auto_254107 - BLOCK
    )
    :vars
    (
      ?auto_254108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254107 ?auto_254108 ) ( not ( = ?auto_254106 ?auto_254107 ) ) ( not ( = ?auto_254106 ?auto_254108 ) ) ( not ( = ?auto_254107 ?auto_254108 ) ) ( ON ?auto_254106 ?auto_254107 ) ( CLEAR ?auto_254106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_254106 )
      ( MAKE-2PILE ?auto_254106 ?auto_254107 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_254111 - BLOCK
      ?auto_254112 - BLOCK
    )
    :vars
    (
      ?auto_254113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254112 ?auto_254113 ) ( not ( = ?auto_254111 ?auto_254112 ) ) ( not ( = ?auto_254111 ?auto_254113 ) ) ( not ( = ?auto_254112 ?auto_254113 ) ) ( ON ?auto_254111 ?auto_254112 ) ( CLEAR ?auto_254111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_254111 )
      ( MAKE-2PILE ?auto_254111 ?auto_254112 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_254117 - BLOCK
      ?auto_254118 - BLOCK
      ?auto_254119 - BLOCK
    )
    :vars
    (
      ?auto_254120 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_254118 ) ( ON ?auto_254119 ?auto_254120 ) ( CLEAR ?auto_254119 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_254117 ) ( ON ?auto_254118 ?auto_254117 ) ( not ( = ?auto_254117 ?auto_254118 ) ) ( not ( = ?auto_254117 ?auto_254119 ) ) ( not ( = ?auto_254117 ?auto_254120 ) ) ( not ( = ?auto_254118 ?auto_254119 ) ) ( not ( = ?auto_254118 ?auto_254120 ) ) ( not ( = ?auto_254119 ?auto_254120 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_254119 ?auto_254120 )
      ( !STACK ?auto_254119 ?auto_254118 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_254124 - BLOCK
      ?auto_254125 - BLOCK
      ?auto_254126 - BLOCK
    )
    :vars
    (
      ?auto_254127 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_254125 ) ( ON ?auto_254126 ?auto_254127 ) ( CLEAR ?auto_254126 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_254124 ) ( ON ?auto_254125 ?auto_254124 ) ( not ( = ?auto_254124 ?auto_254125 ) ) ( not ( = ?auto_254124 ?auto_254126 ) ) ( not ( = ?auto_254124 ?auto_254127 ) ) ( not ( = ?auto_254125 ?auto_254126 ) ) ( not ( = ?auto_254125 ?auto_254127 ) ) ( not ( = ?auto_254126 ?auto_254127 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_254126 ?auto_254127 )
      ( !STACK ?auto_254126 ?auto_254125 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_254131 - BLOCK
      ?auto_254132 - BLOCK
      ?auto_254133 - BLOCK
    )
    :vars
    (
      ?auto_254134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254133 ?auto_254134 ) ( ON-TABLE ?auto_254131 ) ( not ( = ?auto_254131 ?auto_254132 ) ) ( not ( = ?auto_254131 ?auto_254133 ) ) ( not ( = ?auto_254131 ?auto_254134 ) ) ( not ( = ?auto_254132 ?auto_254133 ) ) ( not ( = ?auto_254132 ?auto_254134 ) ) ( not ( = ?auto_254133 ?auto_254134 ) ) ( CLEAR ?auto_254131 ) ( ON ?auto_254132 ?auto_254133 ) ( CLEAR ?auto_254132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_254131 ?auto_254132 )
      ( MAKE-3PILE ?auto_254131 ?auto_254132 ?auto_254133 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_254138 - BLOCK
      ?auto_254139 - BLOCK
      ?auto_254140 - BLOCK
    )
    :vars
    (
      ?auto_254141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254140 ?auto_254141 ) ( ON-TABLE ?auto_254138 ) ( not ( = ?auto_254138 ?auto_254139 ) ) ( not ( = ?auto_254138 ?auto_254140 ) ) ( not ( = ?auto_254138 ?auto_254141 ) ) ( not ( = ?auto_254139 ?auto_254140 ) ) ( not ( = ?auto_254139 ?auto_254141 ) ) ( not ( = ?auto_254140 ?auto_254141 ) ) ( CLEAR ?auto_254138 ) ( ON ?auto_254139 ?auto_254140 ) ( CLEAR ?auto_254139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_254138 ?auto_254139 )
      ( MAKE-3PILE ?auto_254138 ?auto_254139 ?auto_254140 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_254145 - BLOCK
      ?auto_254146 - BLOCK
      ?auto_254147 - BLOCK
    )
    :vars
    (
      ?auto_254148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254147 ?auto_254148 ) ( not ( = ?auto_254145 ?auto_254146 ) ) ( not ( = ?auto_254145 ?auto_254147 ) ) ( not ( = ?auto_254145 ?auto_254148 ) ) ( not ( = ?auto_254146 ?auto_254147 ) ) ( not ( = ?auto_254146 ?auto_254148 ) ) ( not ( = ?auto_254147 ?auto_254148 ) ) ( ON ?auto_254146 ?auto_254147 ) ( ON ?auto_254145 ?auto_254146 ) ( CLEAR ?auto_254145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_254145 )
      ( MAKE-3PILE ?auto_254145 ?auto_254146 ?auto_254147 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_254152 - BLOCK
      ?auto_254153 - BLOCK
      ?auto_254154 - BLOCK
    )
    :vars
    (
      ?auto_254155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254154 ?auto_254155 ) ( not ( = ?auto_254152 ?auto_254153 ) ) ( not ( = ?auto_254152 ?auto_254154 ) ) ( not ( = ?auto_254152 ?auto_254155 ) ) ( not ( = ?auto_254153 ?auto_254154 ) ) ( not ( = ?auto_254153 ?auto_254155 ) ) ( not ( = ?auto_254154 ?auto_254155 ) ) ( ON ?auto_254153 ?auto_254154 ) ( ON ?auto_254152 ?auto_254153 ) ( CLEAR ?auto_254152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_254152 )
      ( MAKE-3PILE ?auto_254152 ?auto_254153 ?auto_254154 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_254160 - BLOCK
      ?auto_254161 - BLOCK
      ?auto_254162 - BLOCK
      ?auto_254163 - BLOCK
    )
    :vars
    (
      ?auto_254164 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_254162 ) ( ON ?auto_254163 ?auto_254164 ) ( CLEAR ?auto_254163 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_254160 ) ( ON ?auto_254161 ?auto_254160 ) ( ON ?auto_254162 ?auto_254161 ) ( not ( = ?auto_254160 ?auto_254161 ) ) ( not ( = ?auto_254160 ?auto_254162 ) ) ( not ( = ?auto_254160 ?auto_254163 ) ) ( not ( = ?auto_254160 ?auto_254164 ) ) ( not ( = ?auto_254161 ?auto_254162 ) ) ( not ( = ?auto_254161 ?auto_254163 ) ) ( not ( = ?auto_254161 ?auto_254164 ) ) ( not ( = ?auto_254162 ?auto_254163 ) ) ( not ( = ?auto_254162 ?auto_254164 ) ) ( not ( = ?auto_254163 ?auto_254164 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_254163 ?auto_254164 )
      ( !STACK ?auto_254163 ?auto_254162 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_254169 - BLOCK
      ?auto_254170 - BLOCK
      ?auto_254171 - BLOCK
      ?auto_254172 - BLOCK
    )
    :vars
    (
      ?auto_254173 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_254171 ) ( ON ?auto_254172 ?auto_254173 ) ( CLEAR ?auto_254172 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_254169 ) ( ON ?auto_254170 ?auto_254169 ) ( ON ?auto_254171 ?auto_254170 ) ( not ( = ?auto_254169 ?auto_254170 ) ) ( not ( = ?auto_254169 ?auto_254171 ) ) ( not ( = ?auto_254169 ?auto_254172 ) ) ( not ( = ?auto_254169 ?auto_254173 ) ) ( not ( = ?auto_254170 ?auto_254171 ) ) ( not ( = ?auto_254170 ?auto_254172 ) ) ( not ( = ?auto_254170 ?auto_254173 ) ) ( not ( = ?auto_254171 ?auto_254172 ) ) ( not ( = ?auto_254171 ?auto_254173 ) ) ( not ( = ?auto_254172 ?auto_254173 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_254172 ?auto_254173 )
      ( !STACK ?auto_254172 ?auto_254171 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_254178 - BLOCK
      ?auto_254179 - BLOCK
      ?auto_254180 - BLOCK
      ?auto_254181 - BLOCK
    )
    :vars
    (
      ?auto_254182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254181 ?auto_254182 ) ( ON-TABLE ?auto_254178 ) ( ON ?auto_254179 ?auto_254178 ) ( not ( = ?auto_254178 ?auto_254179 ) ) ( not ( = ?auto_254178 ?auto_254180 ) ) ( not ( = ?auto_254178 ?auto_254181 ) ) ( not ( = ?auto_254178 ?auto_254182 ) ) ( not ( = ?auto_254179 ?auto_254180 ) ) ( not ( = ?auto_254179 ?auto_254181 ) ) ( not ( = ?auto_254179 ?auto_254182 ) ) ( not ( = ?auto_254180 ?auto_254181 ) ) ( not ( = ?auto_254180 ?auto_254182 ) ) ( not ( = ?auto_254181 ?auto_254182 ) ) ( CLEAR ?auto_254179 ) ( ON ?auto_254180 ?auto_254181 ) ( CLEAR ?auto_254180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_254178 ?auto_254179 ?auto_254180 )
      ( MAKE-4PILE ?auto_254178 ?auto_254179 ?auto_254180 ?auto_254181 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_254187 - BLOCK
      ?auto_254188 - BLOCK
      ?auto_254189 - BLOCK
      ?auto_254190 - BLOCK
    )
    :vars
    (
      ?auto_254191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254190 ?auto_254191 ) ( ON-TABLE ?auto_254187 ) ( ON ?auto_254188 ?auto_254187 ) ( not ( = ?auto_254187 ?auto_254188 ) ) ( not ( = ?auto_254187 ?auto_254189 ) ) ( not ( = ?auto_254187 ?auto_254190 ) ) ( not ( = ?auto_254187 ?auto_254191 ) ) ( not ( = ?auto_254188 ?auto_254189 ) ) ( not ( = ?auto_254188 ?auto_254190 ) ) ( not ( = ?auto_254188 ?auto_254191 ) ) ( not ( = ?auto_254189 ?auto_254190 ) ) ( not ( = ?auto_254189 ?auto_254191 ) ) ( not ( = ?auto_254190 ?auto_254191 ) ) ( CLEAR ?auto_254188 ) ( ON ?auto_254189 ?auto_254190 ) ( CLEAR ?auto_254189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_254187 ?auto_254188 ?auto_254189 )
      ( MAKE-4PILE ?auto_254187 ?auto_254188 ?auto_254189 ?auto_254190 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_254196 - BLOCK
      ?auto_254197 - BLOCK
      ?auto_254198 - BLOCK
      ?auto_254199 - BLOCK
    )
    :vars
    (
      ?auto_254200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254199 ?auto_254200 ) ( ON-TABLE ?auto_254196 ) ( not ( = ?auto_254196 ?auto_254197 ) ) ( not ( = ?auto_254196 ?auto_254198 ) ) ( not ( = ?auto_254196 ?auto_254199 ) ) ( not ( = ?auto_254196 ?auto_254200 ) ) ( not ( = ?auto_254197 ?auto_254198 ) ) ( not ( = ?auto_254197 ?auto_254199 ) ) ( not ( = ?auto_254197 ?auto_254200 ) ) ( not ( = ?auto_254198 ?auto_254199 ) ) ( not ( = ?auto_254198 ?auto_254200 ) ) ( not ( = ?auto_254199 ?auto_254200 ) ) ( ON ?auto_254198 ?auto_254199 ) ( CLEAR ?auto_254196 ) ( ON ?auto_254197 ?auto_254198 ) ( CLEAR ?auto_254197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_254196 ?auto_254197 )
      ( MAKE-4PILE ?auto_254196 ?auto_254197 ?auto_254198 ?auto_254199 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_254205 - BLOCK
      ?auto_254206 - BLOCK
      ?auto_254207 - BLOCK
      ?auto_254208 - BLOCK
    )
    :vars
    (
      ?auto_254209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254208 ?auto_254209 ) ( ON-TABLE ?auto_254205 ) ( not ( = ?auto_254205 ?auto_254206 ) ) ( not ( = ?auto_254205 ?auto_254207 ) ) ( not ( = ?auto_254205 ?auto_254208 ) ) ( not ( = ?auto_254205 ?auto_254209 ) ) ( not ( = ?auto_254206 ?auto_254207 ) ) ( not ( = ?auto_254206 ?auto_254208 ) ) ( not ( = ?auto_254206 ?auto_254209 ) ) ( not ( = ?auto_254207 ?auto_254208 ) ) ( not ( = ?auto_254207 ?auto_254209 ) ) ( not ( = ?auto_254208 ?auto_254209 ) ) ( ON ?auto_254207 ?auto_254208 ) ( CLEAR ?auto_254205 ) ( ON ?auto_254206 ?auto_254207 ) ( CLEAR ?auto_254206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_254205 ?auto_254206 )
      ( MAKE-4PILE ?auto_254205 ?auto_254206 ?auto_254207 ?auto_254208 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_254214 - BLOCK
      ?auto_254215 - BLOCK
      ?auto_254216 - BLOCK
      ?auto_254217 - BLOCK
    )
    :vars
    (
      ?auto_254218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254217 ?auto_254218 ) ( not ( = ?auto_254214 ?auto_254215 ) ) ( not ( = ?auto_254214 ?auto_254216 ) ) ( not ( = ?auto_254214 ?auto_254217 ) ) ( not ( = ?auto_254214 ?auto_254218 ) ) ( not ( = ?auto_254215 ?auto_254216 ) ) ( not ( = ?auto_254215 ?auto_254217 ) ) ( not ( = ?auto_254215 ?auto_254218 ) ) ( not ( = ?auto_254216 ?auto_254217 ) ) ( not ( = ?auto_254216 ?auto_254218 ) ) ( not ( = ?auto_254217 ?auto_254218 ) ) ( ON ?auto_254216 ?auto_254217 ) ( ON ?auto_254215 ?auto_254216 ) ( ON ?auto_254214 ?auto_254215 ) ( CLEAR ?auto_254214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_254214 )
      ( MAKE-4PILE ?auto_254214 ?auto_254215 ?auto_254216 ?auto_254217 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_254223 - BLOCK
      ?auto_254224 - BLOCK
      ?auto_254225 - BLOCK
      ?auto_254226 - BLOCK
    )
    :vars
    (
      ?auto_254227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254226 ?auto_254227 ) ( not ( = ?auto_254223 ?auto_254224 ) ) ( not ( = ?auto_254223 ?auto_254225 ) ) ( not ( = ?auto_254223 ?auto_254226 ) ) ( not ( = ?auto_254223 ?auto_254227 ) ) ( not ( = ?auto_254224 ?auto_254225 ) ) ( not ( = ?auto_254224 ?auto_254226 ) ) ( not ( = ?auto_254224 ?auto_254227 ) ) ( not ( = ?auto_254225 ?auto_254226 ) ) ( not ( = ?auto_254225 ?auto_254227 ) ) ( not ( = ?auto_254226 ?auto_254227 ) ) ( ON ?auto_254225 ?auto_254226 ) ( ON ?auto_254224 ?auto_254225 ) ( ON ?auto_254223 ?auto_254224 ) ( CLEAR ?auto_254223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_254223 )
      ( MAKE-4PILE ?auto_254223 ?auto_254224 ?auto_254225 ?auto_254226 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_254233 - BLOCK
      ?auto_254234 - BLOCK
      ?auto_254235 - BLOCK
      ?auto_254236 - BLOCK
      ?auto_254237 - BLOCK
    )
    :vars
    (
      ?auto_254238 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_254236 ) ( ON ?auto_254237 ?auto_254238 ) ( CLEAR ?auto_254237 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_254233 ) ( ON ?auto_254234 ?auto_254233 ) ( ON ?auto_254235 ?auto_254234 ) ( ON ?auto_254236 ?auto_254235 ) ( not ( = ?auto_254233 ?auto_254234 ) ) ( not ( = ?auto_254233 ?auto_254235 ) ) ( not ( = ?auto_254233 ?auto_254236 ) ) ( not ( = ?auto_254233 ?auto_254237 ) ) ( not ( = ?auto_254233 ?auto_254238 ) ) ( not ( = ?auto_254234 ?auto_254235 ) ) ( not ( = ?auto_254234 ?auto_254236 ) ) ( not ( = ?auto_254234 ?auto_254237 ) ) ( not ( = ?auto_254234 ?auto_254238 ) ) ( not ( = ?auto_254235 ?auto_254236 ) ) ( not ( = ?auto_254235 ?auto_254237 ) ) ( not ( = ?auto_254235 ?auto_254238 ) ) ( not ( = ?auto_254236 ?auto_254237 ) ) ( not ( = ?auto_254236 ?auto_254238 ) ) ( not ( = ?auto_254237 ?auto_254238 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_254237 ?auto_254238 )
      ( !STACK ?auto_254237 ?auto_254236 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_254244 - BLOCK
      ?auto_254245 - BLOCK
      ?auto_254246 - BLOCK
      ?auto_254247 - BLOCK
      ?auto_254248 - BLOCK
    )
    :vars
    (
      ?auto_254249 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_254247 ) ( ON ?auto_254248 ?auto_254249 ) ( CLEAR ?auto_254248 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_254244 ) ( ON ?auto_254245 ?auto_254244 ) ( ON ?auto_254246 ?auto_254245 ) ( ON ?auto_254247 ?auto_254246 ) ( not ( = ?auto_254244 ?auto_254245 ) ) ( not ( = ?auto_254244 ?auto_254246 ) ) ( not ( = ?auto_254244 ?auto_254247 ) ) ( not ( = ?auto_254244 ?auto_254248 ) ) ( not ( = ?auto_254244 ?auto_254249 ) ) ( not ( = ?auto_254245 ?auto_254246 ) ) ( not ( = ?auto_254245 ?auto_254247 ) ) ( not ( = ?auto_254245 ?auto_254248 ) ) ( not ( = ?auto_254245 ?auto_254249 ) ) ( not ( = ?auto_254246 ?auto_254247 ) ) ( not ( = ?auto_254246 ?auto_254248 ) ) ( not ( = ?auto_254246 ?auto_254249 ) ) ( not ( = ?auto_254247 ?auto_254248 ) ) ( not ( = ?auto_254247 ?auto_254249 ) ) ( not ( = ?auto_254248 ?auto_254249 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_254248 ?auto_254249 )
      ( !STACK ?auto_254248 ?auto_254247 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_254255 - BLOCK
      ?auto_254256 - BLOCK
      ?auto_254257 - BLOCK
      ?auto_254258 - BLOCK
      ?auto_254259 - BLOCK
    )
    :vars
    (
      ?auto_254260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254259 ?auto_254260 ) ( ON-TABLE ?auto_254255 ) ( ON ?auto_254256 ?auto_254255 ) ( ON ?auto_254257 ?auto_254256 ) ( not ( = ?auto_254255 ?auto_254256 ) ) ( not ( = ?auto_254255 ?auto_254257 ) ) ( not ( = ?auto_254255 ?auto_254258 ) ) ( not ( = ?auto_254255 ?auto_254259 ) ) ( not ( = ?auto_254255 ?auto_254260 ) ) ( not ( = ?auto_254256 ?auto_254257 ) ) ( not ( = ?auto_254256 ?auto_254258 ) ) ( not ( = ?auto_254256 ?auto_254259 ) ) ( not ( = ?auto_254256 ?auto_254260 ) ) ( not ( = ?auto_254257 ?auto_254258 ) ) ( not ( = ?auto_254257 ?auto_254259 ) ) ( not ( = ?auto_254257 ?auto_254260 ) ) ( not ( = ?auto_254258 ?auto_254259 ) ) ( not ( = ?auto_254258 ?auto_254260 ) ) ( not ( = ?auto_254259 ?auto_254260 ) ) ( CLEAR ?auto_254257 ) ( ON ?auto_254258 ?auto_254259 ) ( CLEAR ?auto_254258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_254255 ?auto_254256 ?auto_254257 ?auto_254258 )
      ( MAKE-5PILE ?auto_254255 ?auto_254256 ?auto_254257 ?auto_254258 ?auto_254259 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_254266 - BLOCK
      ?auto_254267 - BLOCK
      ?auto_254268 - BLOCK
      ?auto_254269 - BLOCK
      ?auto_254270 - BLOCK
    )
    :vars
    (
      ?auto_254271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254270 ?auto_254271 ) ( ON-TABLE ?auto_254266 ) ( ON ?auto_254267 ?auto_254266 ) ( ON ?auto_254268 ?auto_254267 ) ( not ( = ?auto_254266 ?auto_254267 ) ) ( not ( = ?auto_254266 ?auto_254268 ) ) ( not ( = ?auto_254266 ?auto_254269 ) ) ( not ( = ?auto_254266 ?auto_254270 ) ) ( not ( = ?auto_254266 ?auto_254271 ) ) ( not ( = ?auto_254267 ?auto_254268 ) ) ( not ( = ?auto_254267 ?auto_254269 ) ) ( not ( = ?auto_254267 ?auto_254270 ) ) ( not ( = ?auto_254267 ?auto_254271 ) ) ( not ( = ?auto_254268 ?auto_254269 ) ) ( not ( = ?auto_254268 ?auto_254270 ) ) ( not ( = ?auto_254268 ?auto_254271 ) ) ( not ( = ?auto_254269 ?auto_254270 ) ) ( not ( = ?auto_254269 ?auto_254271 ) ) ( not ( = ?auto_254270 ?auto_254271 ) ) ( CLEAR ?auto_254268 ) ( ON ?auto_254269 ?auto_254270 ) ( CLEAR ?auto_254269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_254266 ?auto_254267 ?auto_254268 ?auto_254269 )
      ( MAKE-5PILE ?auto_254266 ?auto_254267 ?auto_254268 ?auto_254269 ?auto_254270 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_254277 - BLOCK
      ?auto_254278 - BLOCK
      ?auto_254279 - BLOCK
      ?auto_254280 - BLOCK
      ?auto_254281 - BLOCK
    )
    :vars
    (
      ?auto_254282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254281 ?auto_254282 ) ( ON-TABLE ?auto_254277 ) ( ON ?auto_254278 ?auto_254277 ) ( not ( = ?auto_254277 ?auto_254278 ) ) ( not ( = ?auto_254277 ?auto_254279 ) ) ( not ( = ?auto_254277 ?auto_254280 ) ) ( not ( = ?auto_254277 ?auto_254281 ) ) ( not ( = ?auto_254277 ?auto_254282 ) ) ( not ( = ?auto_254278 ?auto_254279 ) ) ( not ( = ?auto_254278 ?auto_254280 ) ) ( not ( = ?auto_254278 ?auto_254281 ) ) ( not ( = ?auto_254278 ?auto_254282 ) ) ( not ( = ?auto_254279 ?auto_254280 ) ) ( not ( = ?auto_254279 ?auto_254281 ) ) ( not ( = ?auto_254279 ?auto_254282 ) ) ( not ( = ?auto_254280 ?auto_254281 ) ) ( not ( = ?auto_254280 ?auto_254282 ) ) ( not ( = ?auto_254281 ?auto_254282 ) ) ( ON ?auto_254280 ?auto_254281 ) ( CLEAR ?auto_254278 ) ( ON ?auto_254279 ?auto_254280 ) ( CLEAR ?auto_254279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_254277 ?auto_254278 ?auto_254279 )
      ( MAKE-5PILE ?auto_254277 ?auto_254278 ?auto_254279 ?auto_254280 ?auto_254281 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_254288 - BLOCK
      ?auto_254289 - BLOCK
      ?auto_254290 - BLOCK
      ?auto_254291 - BLOCK
      ?auto_254292 - BLOCK
    )
    :vars
    (
      ?auto_254293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254292 ?auto_254293 ) ( ON-TABLE ?auto_254288 ) ( ON ?auto_254289 ?auto_254288 ) ( not ( = ?auto_254288 ?auto_254289 ) ) ( not ( = ?auto_254288 ?auto_254290 ) ) ( not ( = ?auto_254288 ?auto_254291 ) ) ( not ( = ?auto_254288 ?auto_254292 ) ) ( not ( = ?auto_254288 ?auto_254293 ) ) ( not ( = ?auto_254289 ?auto_254290 ) ) ( not ( = ?auto_254289 ?auto_254291 ) ) ( not ( = ?auto_254289 ?auto_254292 ) ) ( not ( = ?auto_254289 ?auto_254293 ) ) ( not ( = ?auto_254290 ?auto_254291 ) ) ( not ( = ?auto_254290 ?auto_254292 ) ) ( not ( = ?auto_254290 ?auto_254293 ) ) ( not ( = ?auto_254291 ?auto_254292 ) ) ( not ( = ?auto_254291 ?auto_254293 ) ) ( not ( = ?auto_254292 ?auto_254293 ) ) ( ON ?auto_254291 ?auto_254292 ) ( CLEAR ?auto_254289 ) ( ON ?auto_254290 ?auto_254291 ) ( CLEAR ?auto_254290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_254288 ?auto_254289 ?auto_254290 )
      ( MAKE-5PILE ?auto_254288 ?auto_254289 ?auto_254290 ?auto_254291 ?auto_254292 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_254299 - BLOCK
      ?auto_254300 - BLOCK
      ?auto_254301 - BLOCK
      ?auto_254302 - BLOCK
      ?auto_254303 - BLOCK
    )
    :vars
    (
      ?auto_254304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254303 ?auto_254304 ) ( ON-TABLE ?auto_254299 ) ( not ( = ?auto_254299 ?auto_254300 ) ) ( not ( = ?auto_254299 ?auto_254301 ) ) ( not ( = ?auto_254299 ?auto_254302 ) ) ( not ( = ?auto_254299 ?auto_254303 ) ) ( not ( = ?auto_254299 ?auto_254304 ) ) ( not ( = ?auto_254300 ?auto_254301 ) ) ( not ( = ?auto_254300 ?auto_254302 ) ) ( not ( = ?auto_254300 ?auto_254303 ) ) ( not ( = ?auto_254300 ?auto_254304 ) ) ( not ( = ?auto_254301 ?auto_254302 ) ) ( not ( = ?auto_254301 ?auto_254303 ) ) ( not ( = ?auto_254301 ?auto_254304 ) ) ( not ( = ?auto_254302 ?auto_254303 ) ) ( not ( = ?auto_254302 ?auto_254304 ) ) ( not ( = ?auto_254303 ?auto_254304 ) ) ( ON ?auto_254302 ?auto_254303 ) ( ON ?auto_254301 ?auto_254302 ) ( CLEAR ?auto_254299 ) ( ON ?auto_254300 ?auto_254301 ) ( CLEAR ?auto_254300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_254299 ?auto_254300 )
      ( MAKE-5PILE ?auto_254299 ?auto_254300 ?auto_254301 ?auto_254302 ?auto_254303 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_254310 - BLOCK
      ?auto_254311 - BLOCK
      ?auto_254312 - BLOCK
      ?auto_254313 - BLOCK
      ?auto_254314 - BLOCK
    )
    :vars
    (
      ?auto_254315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254314 ?auto_254315 ) ( ON-TABLE ?auto_254310 ) ( not ( = ?auto_254310 ?auto_254311 ) ) ( not ( = ?auto_254310 ?auto_254312 ) ) ( not ( = ?auto_254310 ?auto_254313 ) ) ( not ( = ?auto_254310 ?auto_254314 ) ) ( not ( = ?auto_254310 ?auto_254315 ) ) ( not ( = ?auto_254311 ?auto_254312 ) ) ( not ( = ?auto_254311 ?auto_254313 ) ) ( not ( = ?auto_254311 ?auto_254314 ) ) ( not ( = ?auto_254311 ?auto_254315 ) ) ( not ( = ?auto_254312 ?auto_254313 ) ) ( not ( = ?auto_254312 ?auto_254314 ) ) ( not ( = ?auto_254312 ?auto_254315 ) ) ( not ( = ?auto_254313 ?auto_254314 ) ) ( not ( = ?auto_254313 ?auto_254315 ) ) ( not ( = ?auto_254314 ?auto_254315 ) ) ( ON ?auto_254313 ?auto_254314 ) ( ON ?auto_254312 ?auto_254313 ) ( CLEAR ?auto_254310 ) ( ON ?auto_254311 ?auto_254312 ) ( CLEAR ?auto_254311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_254310 ?auto_254311 )
      ( MAKE-5PILE ?auto_254310 ?auto_254311 ?auto_254312 ?auto_254313 ?auto_254314 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_254321 - BLOCK
      ?auto_254322 - BLOCK
      ?auto_254323 - BLOCK
      ?auto_254324 - BLOCK
      ?auto_254325 - BLOCK
    )
    :vars
    (
      ?auto_254326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254325 ?auto_254326 ) ( not ( = ?auto_254321 ?auto_254322 ) ) ( not ( = ?auto_254321 ?auto_254323 ) ) ( not ( = ?auto_254321 ?auto_254324 ) ) ( not ( = ?auto_254321 ?auto_254325 ) ) ( not ( = ?auto_254321 ?auto_254326 ) ) ( not ( = ?auto_254322 ?auto_254323 ) ) ( not ( = ?auto_254322 ?auto_254324 ) ) ( not ( = ?auto_254322 ?auto_254325 ) ) ( not ( = ?auto_254322 ?auto_254326 ) ) ( not ( = ?auto_254323 ?auto_254324 ) ) ( not ( = ?auto_254323 ?auto_254325 ) ) ( not ( = ?auto_254323 ?auto_254326 ) ) ( not ( = ?auto_254324 ?auto_254325 ) ) ( not ( = ?auto_254324 ?auto_254326 ) ) ( not ( = ?auto_254325 ?auto_254326 ) ) ( ON ?auto_254324 ?auto_254325 ) ( ON ?auto_254323 ?auto_254324 ) ( ON ?auto_254322 ?auto_254323 ) ( ON ?auto_254321 ?auto_254322 ) ( CLEAR ?auto_254321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_254321 )
      ( MAKE-5PILE ?auto_254321 ?auto_254322 ?auto_254323 ?auto_254324 ?auto_254325 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_254332 - BLOCK
      ?auto_254333 - BLOCK
      ?auto_254334 - BLOCK
      ?auto_254335 - BLOCK
      ?auto_254336 - BLOCK
    )
    :vars
    (
      ?auto_254337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254336 ?auto_254337 ) ( not ( = ?auto_254332 ?auto_254333 ) ) ( not ( = ?auto_254332 ?auto_254334 ) ) ( not ( = ?auto_254332 ?auto_254335 ) ) ( not ( = ?auto_254332 ?auto_254336 ) ) ( not ( = ?auto_254332 ?auto_254337 ) ) ( not ( = ?auto_254333 ?auto_254334 ) ) ( not ( = ?auto_254333 ?auto_254335 ) ) ( not ( = ?auto_254333 ?auto_254336 ) ) ( not ( = ?auto_254333 ?auto_254337 ) ) ( not ( = ?auto_254334 ?auto_254335 ) ) ( not ( = ?auto_254334 ?auto_254336 ) ) ( not ( = ?auto_254334 ?auto_254337 ) ) ( not ( = ?auto_254335 ?auto_254336 ) ) ( not ( = ?auto_254335 ?auto_254337 ) ) ( not ( = ?auto_254336 ?auto_254337 ) ) ( ON ?auto_254335 ?auto_254336 ) ( ON ?auto_254334 ?auto_254335 ) ( ON ?auto_254333 ?auto_254334 ) ( ON ?auto_254332 ?auto_254333 ) ( CLEAR ?auto_254332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_254332 )
      ( MAKE-5PILE ?auto_254332 ?auto_254333 ?auto_254334 ?auto_254335 ?auto_254336 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_254344 - BLOCK
      ?auto_254345 - BLOCK
      ?auto_254346 - BLOCK
      ?auto_254347 - BLOCK
      ?auto_254348 - BLOCK
      ?auto_254349 - BLOCK
    )
    :vars
    (
      ?auto_254350 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_254348 ) ( ON ?auto_254349 ?auto_254350 ) ( CLEAR ?auto_254349 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_254344 ) ( ON ?auto_254345 ?auto_254344 ) ( ON ?auto_254346 ?auto_254345 ) ( ON ?auto_254347 ?auto_254346 ) ( ON ?auto_254348 ?auto_254347 ) ( not ( = ?auto_254344 ?auto_254345 ) ) ( not ( = ?auto_254344 ?auto_254346 ) ) ( not ( = ?auto_254344 ?auto_254347 ) ) ( not ( = ?auto_254344 ?auto_254348 ) ) ( not ( = ?auto_254344 ?auto_254349 ) ) ( not ( = ?auto_254344 ?auto_254350 ) ) ( not ( = ?auto_254345 ?auto_254346 ) ) ( not ( = ?auto_254345 ?auto_254347 ) ) ( not ( = ?auto_254345 ?auto_254348 ) ) ( not ( = ?auto_254345 ?auto_254349 ) ) ( not ( = ?auto_254345 ?auto_254350 ) ) ( not ( = ?auto_254346 ?auto_254347 ) ) ( not ( = ?auto_254346 ?auto_254348 ) ) ( not ( = ?auto_254346 ?auto_254349 ) ) ( not ( = ?auto_254346 ?auto_254350 ) ) ( not ( = ?auto_254347 ?auto_254348 ) ) ( not ( = ?auto_254347 ?auto_254349 ) ) ( not ( = ?auto_254347 ?auto_254350 ) ) ( not ( = ?auto_254348 ?auto_254349 ) ) ( not ( = ?auto_254348 ?auto_254350 ) ) ( not ( = ?auto_254349 ?auto_254350 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_254349 ?auto_254350 )
      ( !STACK ?auto_254349 ?auto_254348 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_254357 - BLOCK
      ?auto_254358 - BLOCK
      ?auto_254359 - BLOCK
      ?auto_254360 - BLOCK
      ?auto_254361 - BLOCK
      ?auto_254362 - BLOCK
    )
    :vars
    (
      ?auto_254363 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_254361 ) ( ON ?auto_254362 ?auto_254363 ) ( CLEAR ?auto_254362 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_254357 ) ( ON ?auto_254358 ?auto_254357 ) ( ON ?auto_254359 ?auto_254358 ) ( ON ?auto_254360 ?auto_254359 ) ( ON ?auto_254361 ?auto_254360 ) ( not ( = ?auto_254357 ?auto_254358 ) ) ( not ( = ?auto_254357 ?auto_254359 ) ) ( not ( = ?auto_254357 ?auto_254360 ) ) ( not ( = ?auto_254357 ?auto_254361 ) ) ( not ( = ?auto_254357 ?auto_254362 ) ) ( not ( = ?auto_254357 ?auto_254363 ) ) ( not ( = ?auto_254358 ?auto_254359 ) ) ( not ( = ?auto_254358 ?auto_254360 ) ) ( not ( = ?auto_254358 ?auto_254361 ) ) ( not ( = ?auto_254358 ?auto_254362 ) ) ( not ( = ?auto_254358 ?auto_254363 ) ) ( not ( = ?auto_254359 ?auto_254360 ) ) ( not ( = ?auto_254359 ?auto_254361 ) ) ( not ( = ?auto_254359 ?auto_254362 ) ) ( not ( = ?auto_254359 ?auto_254363 ) ) ( not ( = ?auto_254360 ?auto_254361 ) ) ( not ( = ?auto_254360 ?auto_254362 ) ) ( not ( = ?auto_254360 ?auto_254363 ) ) ( not ( = ?auto_254361 ?auto_254362 ) ) ( not ( = ?auto_254361 ?auto_254363 ) ) ( not ( = ?auto_254362 ?auto_254363 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_254362 ?auto_254363 )
      ( !STACK ?auto_254362 ?auto_254361 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_254370 - BLOCK
      ?auto_254371 - BLOCK
      ?auto_254372 - BLOCK
      ?auto_254373 - BLOCK
      ?auto_254374 - BLOCK
      ?auto_254375 - BLOCK
    )
    :vars
    (
      ?auto_254376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254375 ?auto_254376 ) ( ON-TABLE ?auto_254370 ) ( ON ?auto_254371 ?auto_254370 ) ( ON ?auto_254372 ?auto_254371 ) ( ON ?auto_254373 ?auto_254372 ) ( not ( = ?auto_254370 ?auto_254371 ) ) ( not ( = ?auto_254370 ?auto_254372 ) ) ( not ( = ?auto_254370 ?auto_254373 ) ) ( not ( = ?auto_254370 ?auto_254374 ) ) ( not ( = ?auto_254370 ?auto_254375 ) ) ( not ( = ?auto_254370 ?auto_254376 ) ) ( not ( = ?auto_254371 ?auto_254372 ) ) ( not ( = ?auto_254371 ?auto_254373 ) ) ( not ( = ?auto_254371 ?auto_254374 ) ) ( not ( = ?auto_254371 ?auto_254375 ) ) ( not ( = ?auto_254371 ?auto_254376 ) ) ( not ( = ?auto_254372 ?auto_254373 ) ) ( not ( = ?auto_254372 ?auto_254374 ) ) ( not ( = ?auto_254372 ?auto_254375 ) ) ( not ( = ?auto_254372 ?auto_254376 ) ) ( not ( = ?auto_254373 ?auto_254374 ) ) ( not ( = ?auto_254373 ?auto_254375 ) ) ( not ( = ?auto_254373 ?auto_254376 ) ) ( not ( = ?auto_254374 ?auto_254375 ) ) ( not ( = ?auto_254374 ?auto_254376 ) ) ( not ( = ?auto_254375 ?auto_254376 ) ) ( CLEAR ?auto_254373 ) ( ON ?auto_254374 ?auto_254375 ) ( CLEAR ?auto_254374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_254370 ?auto_254371 ?auto_254372 ?auto_254373 ?auto_254374 )
      ( MAKE-6PILE ?auto_254370 ?auto_254371 ?auto_254372 ?auto_254373 ?auto_254374 ?auto_254375 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_254383 - BLOCK
      ?auto_254384 - BLOCK
      ?auto_254385 - BLOCK
      ?auto_254386 - BLOCK
      ?auto_254387 - BLOCK
      ?auto_254388 - BLOCK
    )
    :vars
    (
      ?auto_254389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254388 ?auto_254389 ) ( ON-TABLE ?auto_254383 ) ( ON ?auto_254384 ?auto_254383 ) ( ON ?auto_254385 ?auto_254384 ) ( ON ?auto_254386 ?auto_254385 ) ( not ( = ?auto_254383 ?auto_254384 ) ) ( not ( = ?auto_254383 ?auto_254385 ) ) ( not ( = ?auto_254383 ?auto_254386 ) ) ( not ( = ?auto_254383 ?auto_254387 ) ) ( not ( = ?auto_254383 ?auto_254388 ) ) ( not ( = ?auto_254383 ?auto_254389 ) ) ( not ( = ?auto_254384 ?auto_254385 ) ) ( not ( = ?auto_254384 ?auto_254386 ) ) ( not ( = ?auto_254384 ?auto_254387 ) ) ( not ( = ?auto_254384 ?auto_254388 ) ) ( not ( = ?auto_254384 ?auto_254389 ) ) ( not ( = ?auto_254385 ?auto_254386 ) ) ( not ( = ?auto_254385 ?auto_254387 ) ) ( not ( = ?auto_254385 ?auto_254388 ) ) ( not ( = ?auto_254385 ?auto_254389 ) ) ( not ( = ?auto_254386 ?auto_254387 ) ) ( not ( = ?auto_254386 ?auto_254388 ) ) ( not ( = ?auto_254386 ?auto_254389 ) ) ( not ( = ?auto_254387 ?auto_254388 ) ) ( not ( = ?auto_254387 ?auto_254389 ) ) ( not ( = ?auto_254388 ?auto_254389 ) ) ( CLEAR ?auto_254386 ) ( ON ?auto_254387 ?auto_254388 ) ( CLEAR ?auto_254387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_254383 ?auto_254384 ?auto_254385 ?auto_254386 ?auto_254387 )
      ( MAKE-6PILE ?auto_254383 ?auto_254384 ?auto_254385 ?auto_254386 ?auto_254387 ?auto_254388 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_254396 - BLOCK
      ?auto_254397 - BLOCK
      ?auto_254398 - BLOCK
      ?auto_254399 - BLOCK
      ?auto_254400 - BLOCK
      ?auto_254401 - BLOCK
    )
    :vars
    (
      ?auto_254402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254401 ?auto_254402 ) ( ON-TABLE ?auto_254396 ) ( ON ?auto_254397 ?auto_254396 ) ( ON ?auto_254398 ?auto_254397 ) ( not ( = ?auto_254396 ?auto_254397 ) ) ( not ( = ?auto_254396 ?auto_254398 ) ) ( not ( = ?auto_254396 ?auto_254399 ) ) ( not ( = ?auto_254396 ?auto_254400 ) ) ( not ( = ?auto_254396 ?auto_254401 ) ) ( not ( = ?auto_254396 ?auto_254402 ) ) ( not ( = ?auto_254397 ?auto_254398 ) ) ( not ( = ?auto_254397 ?auto_254399 ) ) ( not ( = ?auto_254397 ?auto_254400 ) ) ( not ( = ?auto_254397 ?auto_254401 ) ) ( not ( = ?auto_254397 ?auto_254402 ) ) ( not ( = ?auto_254398 ?auto_254399 ) ) ( not ( = ?auto_254398 ?auto_254400 ) ) ( not ( = ?auto_254398 ?auto_254401 ) ) ( not ( = ?auto_254398 ?auto_254402 ) ) ( not ( = ?auto_254399 ?auto_254400 ) ) ( not ( = ?auto_254399 ?auto_254401 ) ) ( not ( = ?auto_254399 ?auto_254402 ) ) ( not ( = ?auto_254400 ?auto_254401 ) ) ( not ( = ?auto_254400 ?auto_254402 ) ) ( not ( = ?auto_254401 ?auto_254402 ) ) ( ON ?auto_254400 ?auto_254401 ) ( CLEAR ?auto_254398 ) ( ON ?auto_254399 ?auto_254400 ) ( CLEAR ?auto_254399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_254396 ?auto_254397 ?auto_254398 ?auto_254399 )
      ( MAKE-6PILE ?auto_254396 ?auto_254397 ?auto_254398 ?auto_254399 ?auto_254400 ?auto_254401 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_254409 - BLOCK
      ?auto_254410 - BLOCK
      ?auto_254411 - BLOCK
      ?auto_254412 - BLOCK
      ?auto_254413 - BLOCK
      ?auto_254414 - BLOCK
    )
    :vars
    (
      ?auto_254415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254414 ?auto_254415 ) ( ON-TABLE ?auto_254409 ) ( ON ?auto_254410 ?auto_254409 ) ( ON ?auto_254411 ?auto_254410 ) ( not ( = ?auto_254409 ?auto_254410 ) ) ( not ( = ?auto_254409 ?auto_254411 ) ) ( not ( = ?auto_254409 ?auto_254412 ) ) ( not ( = ?auto_254409 ?auto_254413 ) ) ( not ( = ?auto_254409 ?auto_254414 ) ) ( not ( = ?auto_254409 ?auto_254415 ) ) ( not ( = ?auto_254410 ?auto_254411 ) ) ( not ( = ?auto_254410 ?auto_254412 ) ) ( not ( = ?auto_254410 ?auto_254413 ) ) ( not ( = ?auto_254410 ?auto_254414 ) ) ( not ( = ?auto_254410 ?auto_254415 ) ) ( not ( = ?auto_254411 ?auto_254412 ) ) ( not ( = ?auto_254411 ?auto_254413 ) ) ( not ( = ?auto_254411 ?auto_254414 ) ) ( not ( = ?auto_254411 ?auto_254415 ) ) ( not ( = ?auto_254412 ?auto_254413 ) ) ( not ( = ?auto_254412 ?auto_254414 ) ) ( not ( = ?auto_254412 ?auto_254415 ) ) ( not ( = ?auto_254413 ?auto_254414 ) ) ( not ( = ?auto_254413 ?auto_254415 ) ) ( not ( = ?auto_254414 ?auto_254415 ) ) ( ON ?auto_254413 ?auto_254414 ) ( CLEAR ?auto_254411 ) ( ON ?auto_254412 ?auto_254413 ) ( CLEAR ?auto_254412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_254409 ?auto_254410 ?auto_254411 ?auto_254412 )
      ( MAKE-6PILE ?auto_254409 ?auto_254410 ?auto_254411 ?auto_254412 ?auto_254413 ?auto_254414 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_254422 - BLOCK
      ?auto_254423 - BLOCK
      ?auto_254424 - BLOCK
      ?auto_254425 - BLOCK
      ?auto_254426 - BLOCK
      ?auto_254427 - BLOCK
    )
    :vars
    (
      ?auto_254428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254427 ?auto_254428 ) ( ON-TABLE ?auto_254422 ) ( ON ?auto_254423 ?auto_254422 ) ( not ( = ?auto_254422 ?auto_254423 ) ) ( not ( = ?auto_254422 ?auto_254424 ) ) ( not ( = ?auto_254422 ?auto_254425 ) ) ( not ( = ?auto_254422 ?auto_254426 ) ) ( not ( = ?auto_254422 ?auto_254427 ) ) ( not ( = ?auto_254422 ?auto_254428 ) ) ( not ( = ?auto_254423 ?auto_254424 ) ) ( not ( = ?auto_254423 ?auto_254425 ) ) ( not ( = ?auto_254423 ?auto_254426 ) ) ( not ( = ?auto_254423 ?auto_254427 ) ) ( not ( = ?auto_254423 ?auto_254428 ) ) ( not ( = ?auto_254424 ?auto_254425 ) ) ( not ( = ?auto_254424 ?auto_254426 ) ) ( not ( = ?auto_254424 ?auto_254427 ) ) ( not ( = ?auto_254424 ?auto_254428 ) ) ( not ( = ?auto_254425 ?auto_254426 ) ) ( not ( = ?auto_254425 ?auto_254427 ) ) ( not ( = ?auto_254425 ?auto_254428 ) ) ( not ( = ?auto_254426 ?auto_254427 ) ) ( not ( = ?auto_254426 ?auto_254428 ) ) ( not ( = ?auto_254427 ?auto_254428 ) ) ( ON ?auto_254426 ?auto_254427 ) ( ON ?auto_254425 ?auto_254426 ) ( CLEAR ?auto_254423 ) ( ON ?auto_254424 ?auto_254425 ) ( CLEAR ?auto_254424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_254422 ?auto_254423 ?auto_254424 )
      ( MAKE-6PILE ?auto_254422 ?auto_254423 ?auto_254424 ?auto_254425 ?auto_254426 ?auto_254427 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_254435 - BLOCK
      ?auto_254436 - BLOCK
      ?auto_254437 - BLOCK
      ?auto_254438 - BLOCK
      ?auto_254439 - BLOCK
      ?auto_254440 - BLOCK
    )
    :vars
    (
      ?auto_254441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254440 ?auto_254441 ) ( ON-TABLE ?auto_254435 ) ( ON ?auto_254436 ?auto_254435 ) ( not ( = ?auto_254435 ?auto_254436 ) ) ( not ( = ?auto_254435 ?auto_254437 ) ) ( not ( = ?auto_254435 ?auto_254438 ) ) ( not ( = ?auto_254435 ?auto_254439 ) ) ( not ( = ?auto_254435 ?auto_254440 ) ) ( not ( = ?auto_254435 ?auto_254441 ) ) ( not ( = ?auto_254436 ?auto_254437 ) ) ( not ( = ?auto_254436 ?auto_254438 ) ) ( not ( = ?auto_254436 ?auto_254439 ) ) ( not ( = ?auto_254436 ?auto_254440 ) ) ( not ( = ?auto_254436 ?auto_254441 ) ) ( not ( = ?auto_254437 ?auto_254438 ) ) ( not ( = ?auto_254437 ?auto_254439 ) ) ( not ( = ?auto_254437 ?auto_254440 ) ) ( not ( = ?auto_254437 ?auto_254441 ) ) ( not ( = ?auto_254438 ?auto_254439 ) ) ( not ( = ?auto_254438 ?auto_254440 ) ) ( not ( = ?auto_254438 ?auto_254441 ) ) ( not ( = ?auto_254439 ?auto_254440 ) ) ( not ( = ?auto_254439 ?auto_254441 ) ) ( not ( = ?auto_254440 ?auto_254441 ) ) ( ON ?auto_254439 ?auto_254440 ) ( ON ?auto_254438 ?auto_254439 ) ( CLEAR ?auto_254436 ) ( ON ?auto_254437 ?auto_254438 ) ( CLEAR ?auto_254437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_254435 ?auto_254436 ?auto_254437 )
      ( MAKE-6PILE ?auto_254435 ?auto_254436 ?auto_254437 ?auto_254438 ?auto_254439 ?auto_254440 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_254448 - BLOCK
      ?auto_254449 - BLOCK
      ?auto_254450 - BLOCK
      ?auto_254451 - BLOCK
      ?auto_254452 - BLOCK
      ?auto_254453 - BLOCK
    )
    :vars
    (
      ?auto_254454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254453 ?auto_254454 ) ( ON-TABLE ?auto_254448 ) ( not ( = ?auto_254448 ?auto_254449 ) ) ( not ( = ?auto_254448 ?auto_254450 ) ) ( not ( = ?auto_254448 ?auto_254451 ) ) ( not ( = ?auto_254448 ?auto_254452 ) ) ( not ( = ?auto_254448 ?auto_254453 ) ) ( not ( = ?auto_254448 ?auto_254454 ) ) ( not ( = ?auto_254449 ?auto_254450 ) ) ( not ( = ?auto_254449 ?auto_254451 ) ) ( not ( = ?auto_254449 ?auto_254452 ) ) ( not ( = ?auto_254449 ?auto_254453 ) ) ( not ( = ?auto_254449 ?auto_254454 ) ) ( not ( = ?auto_254450 ?auto_254451 ) ) ( not ( = ?auto_254450 ?auto_254452 ) ) ( not ( = ?auto_254450 ?auto_254453 ) ) ( not ( = ?auto_254450 ?auto_254454 ) ) ( not ( = ?auto_254451 ?auto_254452 ) ) ( not ( = ?auto_254451 ?auto_254453 ) ) ( not ( = ?auto_254451 ?auto_254454 ) ) ( not ( = ?auto_254452 ?auto_254453 ) ) ( not ( = ?auto_254452 ?auto_254454 ) ) ( not ( = ?auto_254453 ?auto_254454 ) ) ( ON ?auto_254452 ?auto_254453 ) ( ON ?auto_254451 ?auto_254452 ) ( ON ?auto_254450 ?auto_254451 ) ( CLEAR ?auto_254448 ) ( ON ?auto_254449 ?auto_254450 ) ( CLEAR ?auto_254449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_254448 ?auto_254449 )
      ( MAKE-6PILE ?auto_254448 ?auto_254449 ?auto_254450 ?auto_254451 ?auto_254452 ?auto_254453 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_254461 - BLOCK
      ?auto_254462 - BLOCK
      ?auto_254463 - BLOCK
      ?auto_254464 - BLOCK
      ?auto_254465 - BLOCK
      ?auto_254466 - BLOCK
    )
    :vars
    (
      ?auto_254467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254466 ?auto_254467 ) ( ON-TABLE ?auto_254461 ) ( not ( = ?auto_254461 ?auto_254462 ) ) ( not ( = ?auto_254461 ?auto_254463 ) ) ( not ( = ?auto_254461 ?auto_254464 ) ) ( not ( = ?auto_254461 ?auto_254465 ) ) ( not ( = ?auto_254461 ?auto_254466 ) ) ( not ( = ?auto_254461 ?auto_254467 ) ) ( not ( = ?auto_254462 ?auto_254463 ) ) ( not ( = ?auto_254462 ?auto_254464 ) ) ( not ( = ?auto_254462 ?auto_254465 ) ) ( not ( = ?auto_254462 ?auto_254466 ) ) ( not ( = ?auto_254462 ?auto_254467 ) ) ( not ( = ?auto_254463 ?auto_254464 ) ) ( not ( = ?auto_254463 ?auto_254465 ) ) ( not ( = ?auto_254463 ?auto_254466 ) ) ( not ( = ?auto_254463 ?auto_254467 ) ) ( not ( = ?auto_254464 ?auto_254465 ) ) ( not ( = ?auto_254464 ?auto_254466 ) ) ( not ( = ?auto_254464 ?auto_254467 ) ) ( not ( = ?auto_254465 ?auto_254466 ) ) ( not ( = ?auto_254465 ?auto_254467 ) ) ( not ( = ?auto_254466 ?auto_254467 ) ) ( ON ?auto_254465 ?auto_254466 ) ( ON ?auto_254464 ?auto_254465 ) ( ON ?auto_254463 ?auto_254464 ) ( CLEAR ?auto_254461 ) ( ON ?auto_254462 ?auto_254463 ) ( CLEAR ?auto_254462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_254461 ?auto_254462 )
      ( MAKE-6PILE ?auto_254461 ?auto_254462 ?auto_254463 ?auto_254464 ?auto_254465 ?auto_254466 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_254474 - BLOCK
      ?auto_254475 - BLOCK
      ?auto_254476 - BLOCK
      ?auto_254477 - BLOCK
      ?auto_254478 - BLOCK
      ?auto_254479 - BLOCK
    )
    :vars
    (
      ?auto_254480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254479 ?auto_254480 ) ( not ( = ?auto_254474 ?auto_254475 ) ) ( not ( = ?auto_254474 ?auto_254476 ) ) ( not ( = ?auto_254474 ?auto_254477 ) ) ( not ( = ?auto_254474 ?auto_254478 ) ) ( not ( = ?auto_254474 ?auto_254479 ) ) ( not ( = ?auto_254474 ?auto_254480 ) ) ( not ( = ?auto_254475 ?auto_254476 ) ) ( not ( = ?auto_254475 ?auto_254477 ) ) ( not ( = ?auto_254475 ?auto_254478 ) ) ( not ( = ?auto_254475 ?auto_254479 ) ) ( not ( = ?auto_254475 ?auto_254480 ) ) ( not ( = ?auto_254476 ?auto_254477 ) ) ( not ( = ?auto_254476 ?auto_254478 ) ) ( not ( = ?auto_254476 ?auto_254479 ) ) ( not ( = ?auto_254476 ?auto_254480 ) ) ( not ( = ?auto_254477 ?auto_254478 ) ) ( not ( = ?auto_254477 ?auto_254479 ) ) ( not ( = ?auto_254477 ?auto_254480 ) ) ( not ( = ?auto_254478 ?auto_254479 ) ) ( not ( = ?auto_254478 ?auto_254480 ) ) ( not ( = ?auto_254479 ?auto_254480 ) ) ( ON ?auto_254478 ?auto_254479 ) ( ON ?auto_254477 ?auto_254478 ) ( ON ?auto_254476 ?auto_254477 ) ( ON ?auto_254475 ?auto_254476 ) ( ON ?auto_254474 ?auto_254475 ) ( CLEAR ?auto_254474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_254474 )
      ( MAKE-6PILE ?auto_254474 ?auto_254475 ?auto_254476 ?auto_254477 ?auto_254478 ?auto_254479 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_254487 - BLOCK
      ?auto_254488 - BLOCK
      ?auto_254489 - BLOCK
      ?auto_254490 - BLOCK
      ?auto_254491 - BLOCK
      ?auto_254492 - BLOCK
    )
    :vars
    (
      ?auto_254493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254492 ?auto_254493 ) ( not ( = ?auto_254487 ?auto_254488 ) ) ( not ( = ?auto_254487 ?auto_254489 ) ) ( not ( = ?auto_254487 ?auto_254490 ) ) ( not ( = ?auto_254487 ?auto_254491 ) ) ( not ( = ?auto_254487 ?auto_254492 ) ) ( not ( = ?auto_254487 ?auto_254493 ) ) ( not ( = ?auto_254488 ?auto_254489 ) ) ( not ( = ?auto_254488 ?auto_254490 ) ) ( not ( = ?auto_254488 ?auto_254491 ) ) ( not ( = ?auto_254488 ?auto_254492 ) ) ( not ( = ?auto_254488 ?auto_254493 ) ) ( not ( = ?auto_254489 ?auto_254490 ) ) ( not ( = ?auto_254489 ?auto_254491 ) ) ( not ( = ?auto_254489 ?auto_254492 ) ) ( not ( = ?auto_254489 ?auto_254493 ) ) ( not ( = ?auto_254490 ?auto_254491 ) ) ( not ( = ?auto_254490 ?auto_254492 ) ) ( not ( = ?auto_254490 ?auto_254493 ) ) ( not ( = ?auto_254491 ?auto_254492 ) ) ( not ( = ?auto_254491 ?auto_254493 ) ) ( not ( = ?auto_254492 ?auto_254493 ) ) ( ON ?auto_254491 ?auto_254492 ) ( ON ?auto_254490 ?auto_254491 ) ( ON ?auto_254489 ?auto_254490 ) ( ON ?auto_254488 ?auto_254489 ) ( ON ?auto_254487 ?auto_254488 ) ( CLEAR ?auto_254487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_254487 )
      ( MAKE-6PILE ?auto_254487 ?auto_254488 ?auto_254489 ?auto_254490 ?auto_254491 ?auto_254492 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_254501 - BLOCK
      ?auto_254502 - BLOCK
      ?auto_254503 - BLOCK
      ?auto_254504 - BLOCK
      ?auto_254505 - BLOCK
      ?auto_254506 - BLOCK
      ?auto_254507 - BLOCK
    )
    :vars
    (
      ?auto_254508 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_254506 ) ( ON ?auto_254507 ?auto_254508 ) ( CLEAR ?auto_254507 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_254501 ) ( ON ?auto_254502 ?auto_254501 ) ( ON ?auto_254503 ?auto_254502 ) ( ON ?auto_254504 ?auto_254503 ) ( ON ?auto_254505 ?auto_254504 ) ( ON ?auto_254506 ?auto_254505 ) ( not ( = ?auto_254501 ?auto_254502 ) ) ( not ( = ?auto_254501 ?auto_254503 ) ) ( not ( = ?auto_254501 ?auto_254504 ) ) ( not ( = ?auto_254501 ?auto_254505 ) ) ( not ( = ?auto_254501 ?auto_254506 ) ) ( not ( = ?auto_254501 ?auto_254507 ) ) ( not ( = ?auto_254501 ?auto_254508 ) ) ( not ( = ?auto_254502 ?auto_254503 ) ) ( not ( = ?auto_254502 ?auto_254504 ) ) ( not ( = ?auto_254502 ?auto_254505 ) ) ( not ( = ?auto_254502 ?auto_254506 ) ) ( not ( = ?auto_254502 ?auto_254507 ) ) ( not ( = ?auto_254502 ?auto_254508 ) ) ( not ( = ?auto_254503 ?auto_254504 ) ) ( not ( = ?auto_254503 ?auto_254505 ) ) ( not ( = ?auto_254503 ?auto_254506 ) ) ( not ( = ?auto_254503 ?auto_254507 ) ) ( not ( = ?auto_254503 ?auto_254508 ) ) ( not ( = ?auto_254504 ?auto_254505 ) ) ( not ( = ?auto_254504 ?auto_254506 ) ) ( not ( = ?auto_254504 ?auto_254507 ) ) ( not ( = ?auto_254504 ?auto_254508 ) ) ( not ( = ?auto_254505 ?auto_254506 ) ) ( not ( = ?auto_254505 ?auto_254507 ) ) ( not ( = ?auto_254505 ?auto_254508 ) ) ( not ( = ?auto_254506 ?auto_254507 ) ) ( not ( = ?auto_254506 ?auto_254508 ) ) ( not ( = ?auto_254507 ?auto_254508 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_254507 ?auto_254508 )
      ( !STACK ?auto_254507 ?auto_254506 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_254516 - BLOCK
      ?auto_254517 - BLOCK
      ?auto_254518 - BLOCK
      ?auto_254519 - BLOCK
      ?auto_254520 - BLOCK
      ?auto_254521 - BLOCK
      ?auto_254522 - BLOCK
    )
    :vars
    (
      ?auto_254523 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_254521 ) ( ON ?auto_254522 ?auto_254523 ) ( CLEAR ?auto_254522 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_254516 ) ( ON ?auto_254517 ?auto_254516 ) ( ON ?auto_254518 ?auto_254517 ) ( ON ?auto_254519 ?auto_254518 ) ( ON ?auto_254520 ?auto_254519 ) ( ON ?auto_254521 ?auto_254520 ) ( not ( = ?auto_254516 ?auto_254517 ) ) ( not ( = ?auto_254516 ?auto_254518 ) ) ( not ( = ?auto_254516 ?auto_254519 ) ) ( not ( = ?auto_254516 ?auto_254520 ) ) ( not ( = ?auto_254516 ?auto_254521 ) ) ( not ( = ?auto_254516 ?auto_254522 ) ) ( not ( = ?auto_254516 ?auto_254523 ) ) ( not ( = ?auto_254517 ?auto_254518 ) ) ( not ( = ?auto_254517 ?auto_254519 ) ) ( not ( = ?auto_254517 ?auto_254520 ) ) ( not ( = ?auto_254517 ?auto_254521 ) ) ( not ( = ?auto_254517 ?auto_254522 ) ) ( not ( = ?auto_254517 ?auto_254523 ) ) ( not ( = ?auto_254518 ?auto_254519 ) ) ( not ( = ?auto_254518 ?auto_254520 ) ) ( not ( = ?auto_254518 ?auto_254521 ) ) ( not ( = ?auto_254518 ?auto_254522 ) ) ( not ( = ?auto_254518 ?auto_254523 ) ) ( not ( = ?auto_254519 ?auto_254520 ) ) ( not ( = ?auto_254519 ?auto_254521 ) ) ( not ( = ?auto_254519 ?auto_254522 ) ) ( not ( = ?auto_254519 ?auto_254523 ) ) ( not ( = ?auto_254520 ?auto_254521 ) ) ( not ( = ?auto_254520 ?auto_254522 ) ) ( not ( = ?auto_254520 ?auto_254523 ) ) ( not ( = ?auto_254521 ?auto_254522 ) ) ( not ( = ?auto_254521 ?auto_254523 ) ) ( not ( = ?auto_254522 ?auto_254523 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_254522 ?auto_254523 )
      ( !STACK ?auto_254522 ?auto_254521 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_254531 - BLOCK
      ?auto_254532 - BLOCK
      ?auto_254533 - BLOCK
      ?auto_254534 - BLOCK
      ?auto_254535 - BLOCK
      ?auto_254536 - BLOCK
      ?auto_254537 - BLOCK
    )
    :vars
    (
      ?auto_254538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254537 ?auto_254538 ) ( ON-TABLE ?auto_254531 ) ( ON ?auto_254532 ?auto_254531 ) ( ON ?auto_254533 ?auto_254532 ) ( ON ?auto_254534 ?auto_254533 ) ( ON ?auto_254535 ?auto_254534 ) ( not ( = ?auto_254531 ?auto_254532 ) ) ( not ( = ?auto_254531 ?auto_254533 ) ) ( not ( = ?auto_254531 ?auto_254534 ) ) ( not ( = ?auto_254531 ?auto_254535 ) ) ( not ( = ?auto_254531 ?auto_254536 ) ) ( not ( = ?auto_254531 ?auto_254537 ) ) ( not ( = ?auto_254531 ?auto_254538 ) ) ( not ( = ?auto_254532 ?auto_254533 ) ) ( not ( = ?auto_254532 ?auto_254534 ) ) ( not ( = ?auto_254532 ?auto_254535 ) ) ( not ( = ?auto_254532 ?auto_254536 ) ) ( not ( = ?auto_254532 ?auto_254537 ) ) ( not ( = ?auto_254532 ?auto_254538 ) ) ( not ( = ?auto_254533 ?auto_254534 ) ) ( not ( = ?auto_254533 ?auto_254535 ) ) ( not ( = ?auto_254533 ?auto_254536 ) ) ( not ( = ?auto_254533 ?auto_254537 ) ) ( not ( = ?auto_254533 ?auto_254538 ) ) ( not ( = ?auto_254534 ?auto_254535 ) ) ( not ( = ?auto_254534 ?auto_254536 ) ) ( not ( = ?auto_254534 ?auto_254537 ) ) ( not ( = ?auto_254534 ?auto_254538 ) ) ( not ( = ?auto_254535 ?auto_254536 ) ) ( not ( = ?auto_254535 ?auto_254537 ) ) ( not ( = ?auto_254535 ?auto_254538 ) ) ( not ( = ?auto_254536 ?auto_254537 ) ) ( not ( = ?auto_254536 ?auto_254538 ) ) ( not ( = ?auto_254537 ?auto_254538 ) ) ( CLEAR ?auto_254535 ) ( ON ?auto_254536 ?auto_254537 ) ( CLEAR ?auto_254536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_254531 ?auto_254532 ?auto_254533 ?auto_254534 ?auto_254535 ?auto_254536 )
      ( MAKE-7PILE ?auto_254531 ?auto_254532 ?auto_254533 ?auto_254534 ?auto_254535 ?auto_254536 ?auto_254537 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_254546 - BLOCK
      ?auto_254547 - BLOCK
      ?auto_254548 - BLOCK
      ?auto_254549 - BLOCK
      ?auto_254550 - BLOCK
      ?auto_254551 - BLOCK
      ?auto_254552 - BLOCK
    )
    :vars
    (
      ?auto_254553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254552 ?auto_254553 ) ( ON-TABLE ?auto_254546 ) ( ON ?auto_254547 ?auto_254546 ) ( ON ?auto_254548 ?auto_254547 ) ( ON ?auto_254549 ?auto_254548 ) ( ON ?auto_254550 ?auto_254549 ) ( not ( = ?auto_254546 ?auto_254547 ) ) ( not ( = ?auto_254546 ?auto_254548 ) ) ( not ( = ?auto_254546 ?auto_254549 ) ) ( not ( = ?auto_254546 ?auto_254550 ) ) ( not ( = ?auto_254546 ?auto_254551 ) ) ( not ( = ?auto_254546 ?auto_254552 ) ) ( not ( = ?auto_254546 ?auto_254553 ) ) ( not ( = ?auto_254547 ?auto_254548 ) ) ( not ( = ?auto_254547 ?auto_254549 ) ) ( not ( = ?auto_254547 ?auto_254550 ) ) ( not ( = ?auto_254547 ?auto_254551 ) ) ( not ( = ?auto_254547 ?auto_254552 ) ) ( not ( = ?auto_254547 ?auto_254553 ) ) ( not ( = ?auto_254548 ?auto_254549 ) ) ( not ( = ?auto_254548 ?auto_254550 ) ) ( not ( = ?auto_254548 ?auto_254551 ) ) ( not ( = ?auto_254548 ?auto_254552 ) ) ( not ( = ?auto_254548 ?auto_254553 ) ) ( not ( = ?auto_254549 ?auto_254550 ) ) ( not ( = ?auto_254549 ?auto_254551 ) ) ( not ( = ?auto_254549 ?auto_254552 ) ) ( not ( = ?auto_254549 ?auto_254553 ) ) ( not ( = ?auto_254550 ?auto_254551 ) ) ( not ( = ?auto_254550 ?auto_254552 ) ) ( not ( = ?auto_254550 ?auto_254553 ) ) ( not ( = ?auto_254551 ?auto_254552 ) ) ( not ( = ?auto_254551 ?auto_254553 ) ) ( not ( = ?auto_254552 ?auto_254553 ) ) ( CLEAR ?auto_254550 ) ( ON ?auto_254551 ?auto_254552 ) ( CLEAR ?auto_254551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_254546 ?auto_254547 ?auto_254548 ?auto_254549 ?auto_254550 ?auto_254551 )
      ( MAKE-7PILE ?auto_254546 ?auto_254547 ?auto_254548 ?auto_254549 ?auto_254550 ?auto_254551 ?auto_254552 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_254561 - BLOCK
      ?auto_254562 - BLOCK
      ?auto_254563 - BLOCK
      ?auto_254564 - BLOCK
      ?auto_254565 - BLOCK
      ?auto_254566 - BLOCK
      ?auto_254567 - BLOCK
    )
    :vars
    (
      ?auto_254568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254567 ?auto_254568 ) ( ON-TABLE ?auto_254561 ) ( ON ?auto_254562 ?auto_254561 ) ( ON ?auto_254563 ?auto_254562 ) ( ON ?auto_254564 ?auto_254563 ) ( not ( = ?auto_254561 ?auto_254562 ) ) ( not ( = ?auto_254561 ?auto_254563 ) ) ( not ( = ?auto_254561 ?auto_254564 ) ) ( not ( = ?auto_254561 ?auto_254565 ) ) ( not ( = ?auto_254561 ?auto_254566 ) ) ( not ( = ?auto_254561 ?auto_254567 ) ) ( not ( = ?auto_254561 ?auto_254568 ) ) ( not ( = ?auto_254562 ?auto_254563 ) ) ( not ( = ?auto_254562 ?auto_254564 ) ) ( not ( = ?auto_254562 ?auto_254565 ) ) ( not ( = ?auto_254562 ?auto_254566 ) ) ( not ( = ?auto_254562 ?auto_254567 ) ) ( not ( = ?auto_254562 ?auto_254568 ) ) ( not ( = ?auto_254563 ?auto_254564 ) ) ( not ( = ?auto_254563 ?auto_254565 ) ) ( not ( = ?auto_254563 ?auto_254566 ) ) ( not ( = ?auto_254563 ?auto_254567 ) ) ( not ( = ?auto_254563 ?auto_254568 ) ) ( not ( = ?auto_254564 ?auto_254565 ) ) ( not ( = ?auto_254564 ?auto_254566 ) ) ( not ( = ?auto_254564 ?auto_254567 ) ) ( not ( = ?auto_254564 ?auto_254568 ) ) ( not ( = ?auto_254565 ?auto_254566 ) ) ( not ( = ?auto_254565 ?auto_254567 ) ) ( not ( = ?auto_254565 ?auto_254568 ) ) ( not ( = ?auto_254566 ?auto_254567 ) ) ( not ( = ?auto_254566 ?auto_254568 ) ) ( not ( = ?auto_254567 ?auto_254568 ) ) ( ON ?auto_254566 ?auto_254567 ) ( CLEAR ?auto_254564 ) ( ON ?auto_254565 ?auto_254566 ) ( CLEAR ?auto_254565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_254561 ?auto_254562 ?auto_254563 ?auto_254564 ?auto_254565 )
      ( MAKE-7PILE ?auto_254561 ?auto_254562 ?auto_254563 ?auto_254564 ?auto_254565 ?auto_254566 ?auto_254567 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_254576 - BLOCK
      ?auto_254577 - BLOCK
      ?auto_254578 - BLOCK
      ?auto_254579 - BLOCK
      ?auto_254580 - BLOCK
      ?auto_254581 - BLOCK
      ?auto_254582 - BLOCK
    )
    :vars
    (
      ?auto_254583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254582 ?auto_254583 ) ( ON-TABLE ?auto_254576 ) ( ON ?auto_254577 ?auto_254576 ) ( ON ?auto_254578 ?auto_254577 ) ( ON ?auto_254579 ?auto_254578 ) ( not ( = ?auto_254576 ?auto_254577 ) ) ( not ( = ?auto_254576 ?auto_254578 ) ) ( not ( = ?auto_254576 ?auto_254579 ) ) ( not ( = ?auto_254576 ?auto_254580 ) ) ( not ( = ?auto_254576 ?auto_254581 ) ) ( not ( = ?auto_254576 ?auto_254582 ) ) ( not ( = ?auto_254576 ?auto_254583 ) ) ( not ( = ?auto_254577 ?auto_254578 ) ) ( not ( = ?auto_254577 ?auto_254579 ) ) ( not ( = ?auto_254577 ?auto_254580 ) ) ( not ( = ?auto_254577 ?auto_254581 ) ) ( not ( = ?auto_254577 ?auto_254582 ) ) ( not ( = ?auto_254577 ?auto_254583 ) ) ( not ( = ?auto_254578 ?auto_254579 ) ) ( not ( = ?auto_254578 ?auto_254580 ) ) ( not ( = ?auto_254578 ?auto_254581 ) ) ( not ( = ?auto_254578 ?auto_254582 ) ) ( not ( = ?auto_254578 ?auto_254583 ) ) ( not ( = ?auto_254579 ?auto_254580 ) ) ( not ( = ?auto_254579 ?auto_254581 ) ) ( not ( = ?auto_254579 ?auto_254582 ) ) ( not ( = ?auto_254579 ?auto_254583 ) ) ( not ( = ?auto_254580 ?auto_254581 ) ) ( not ( = ?auto_254580 ?auto_254582 ) ) ( not ( = ?auto_254580 ?auto_254583 ) ) ( not ( = ?auto_254581 ?auto_254582 ) ) ( not ( = ?auto_254581 ?auto_254583 ) ) ( not ( = ?auto_254582 ?auto_254583 ) ) ( ON ?auto_254581 ?auto_254582 ) ( CLEAR ?auto_254579 ) ( ON ?auto_254580 ?auto_254581 ) ( CLEAR ?auto_254580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_254576 ?auto_254577 ?auto_254578 ?auto_254579 ?auto_254580 )
      ( MAKE-7PILE ?auto_254576 ?auto_254577 ?auto_254578 ?auto_254579 ?auto_254580 ?auto_254581 ?auto_254582 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_254591 - BLOCK
      ?auto_254592 - BLOCK
      ?auto_254593 - BLOCK
      ?auto_254594 - BLOCK
      ?auto_254595 - BLOCK
      ?auto_254596 - BLOCK
      ?auto_254597 - BLOCK
    )
    :vars
    (
      ?auto_254598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254597 ?auto_254598 ) ( ON-TABLE ?auto_254591 ) ( ON ?auto_254592 ?auto_254591 ) ( ON ?auto_254593 ?auto_254592 ) ( not ( = ?auto_254591 ?auto_254592 ) ) ( not ( = ?auto_254591 ?auto_254593 ) ) ( not ( = ?auto_254591 ?auto_254594 ) ) ( not ( = ?auto_254591 ?auto_254595 ) ) ( not ( = ?auto_254591 ?auto_254596 ) ) ( not ( = ?auto_254591 ?auto_254597 ) ) ( not ( = ?auto_254591 ?auto_254598 ) ) ( not ( = ?auto_254592 ?auto_254593 ) ) ( not ( = ?auto_254592 ?auto_254594 ) ) ( not ( = ?auto_254592 ?auto_254595 ) ) ( not ( = ?auto_254592 ?auto_254596 ) ) ( not ( = ?auto_254592 ?auto_254597 ) ) ( not ( = ?auto_254592 ?auto_254598 ) ) ( not ( = ?auto_254593 ?auto_254594 ) ) ( not ( = ?auto_254593 ?auto_254595 ) ) ( not ( = ?auto_254593 ?auto_254596 ) ) ( not ( = ?auto_254593 ?auto_254597 ) ) ( not ( = ?auto_254593 ?auto_254598 ) ) ( not ( = ?auto_254594 ?auto_254595 ) ) ( not ( = ?auto_254594 ?auto_254596 ) ) ( not ( = ?auto_254594 ?auto_254597 ) ) ( not ( = ?auto_254594 ?auto_254598 ) ) ( not ( = ?auto_254595 ?auto_254596 ) ) ( not ( = ?auto_254595 ?auto_254597 ) ) ( not ( = ?auto_254595 ?auto_254598 ) ) ( not ( = ?auto_254596 ?auto_254597 ) ) ( not ( = ?auto_254596 ?auto_254598 ) ) ( not ( = ?auto_254597 ?auto_254598 ) ) ( ON ?auto_254596 ?auto_254597 ) ( ON ?auto_254595 ?auto_254596 ) ( CLEAR ?auto_254593 ) ( ON ?auto_254594 ?auto_254595 ) ( CLEAR ?auto_254594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_254591 ?auto_254592 ?auto_254593 ?auto_254594 )
      ( MAKE-7PILE ?auto_254591 ?auto_254592 ?auto_254593 ?auto_254594 ?auto_254595 ?auto_254596 ?auto_254597 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_254606 - BLOCK
      ?auto_254607 - BLOCK
      ?auto_254608 - BLOCK
      ?auto_254609 - BLOCK
      ?auto_254610 - BLOCK
      ?auto_254611 - BLOCK
      ?auto_254612 - BLOCK
    )
    :vars
    (
      ?auto_254613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254612 ?auto_254613 ) ( ON-TABLE ?auto_254606 ) ( ON ?auto_254607 ?auto_254606 ) ( ON ?auto_254608 ?auto_254607 ) ( not ( = ?auto_254606 ?auto_254607 ) ) ( not ( = ?auto_254606 ?auto_254608 ) ) ( not ( = ?auto_254606 ?auto_254609 ) ) ( not ( = ?auto_254606 ?auto_254610 ) ) ( not ( = ?auto_254606 ?auto_254611 ) ) ( not ( = ?auto_254606 ?auto_254612 ) ) ( not ( = ?auto_254606 ?auto_254613 ) ) ( not ( = ?auto_254607 ?auto_254608 ) ) ( not ( = ?auto_254607 ?auto_254609 ) ) ( not ( = ?auto_254607 ?auto_254610 ) ) ( not ( = ?auto_254607 ?auto_254611 ) ) ( not ( = ?auto_254607 ?auto_254612 ) ) ( not ( = ?auto_254607 ?auto_254613 ) ) ( not ( = ?auto_254608 ?auto_254609 ) ) ( not ( = ?auto_254608 ?auto_254610 ) ) ( not ( = ?auto_254608 ?auto_254611 ) ) ( not ( = ?auto_254608 ?auto_254612 ) ) ( not ( = ?auto_254608 ?auto_254613 ) ) ( not ( = ?auto_254609 ?auto_254610 ) ) ( not ( = ?auto_254609 ?auto_254611 ) ) ( not ( = ?auto_254609 ?auto_254612 ) ) ( not ( = ?auto_254609 ?auto_254613 ) ) ( not ( = ?auto_254610 ?auto_254611 ) ) ( not ( = ?auto_254610 ?auto_254612 ) ) ( not ( = ?auto_254610 ?auto_254613 ) ) ( not ( = ?auto_254611 ?auto_254612 ) ) ( not ( = ?auto_254611 ?auto_254613 ) ) ( not ( = ?auto_254612 ?auto_254613 ) ) ( ON ?auto_254611 ?auto_254612 ) ( ON ?auto_254610 ?auto_254611 ) ( CLEAR ?auto_254608 ) ( ON ?auto_254609 ?auto_254610 ) ( CLEAR ?auto_254609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_254606 ?auto_254607 ?auto_254608 ?auto_254609 )
      ( MAKE-7PILE ?auto_254606 ?auto_254607 ?auto_254608 ?auto_254609 ?auto_254610 ?auto_254611 ?auto_254612 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_254621 - BLOCK
      ?auto_254622 - BLOCK
      ?auto_254623 - BLOCK
      ?auto_254624 - BLOCK
      ?auto_254625 - BLOCK
      ?auto_254626 - BLOCK
      ?auto_254627 - BLOCK
    )
    :vars
    (
      ?auto_254628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254627 ?auto_254628 ) ( ON-TABLE ?auto_254621 ) ( ON ?auto_254622 ?auto_254621 ) ( not ( = ?auto_254621 ?auto_254622 ) ) ( not ( = ?auto_254621 ?auto_254623 ) ) ( not ( = ?auto_254621 ?auto_254624 ) ) ( not ( = ?auto_254621 ?auto_254625 ) ) ( not ( = ?auto_254621 ?auto_254626 ) ) ( not ( = ?auto_254621 ?auto_254627 ) ) ( not ( = ?auto_254621 ?auto_254628 ) ) ( not ( = ?auto_254622 ?auto_254623 ) ) ( not ( = ?auto_254622 ?auto_254624 ) ) ( not ( = ?auto_254622 ?auto_254625 ) ) ( not ( = ?auto_254622 ?auto_254626 ) ) ( not ( = ?auto_254622 ?auto_254627 ) ) ( not ( = ?auto_254622 ?auto_254628 ) ) ( not ( = ?auto_254623 ?auto_254624 ) ) ( not ( = ?auto_254623 ?auto_254625 ) ) ( not ( = ?auto_254623 ?auto_254626 ) ) ( not ( = ?auto_254623 ?auto_254627 ) ) ( not ( = ?auto_254623 ?auto_254628 ) ) ( not ( = ?auto_254624 ?auto_254625 ) ) ( not ( = ?auto_254624 ?auto_254626 ) ) ( not ( = ?auto_254624 ?auto_254627 ) ) ( not ( = ?auto_254624 ?auto_254628 ) ) ( not ( = ?auto_254625 ?auto_254626 ) ) ( not ( = ?auto_254625 ?auto_254627 ) ) ( not ( = ?auto_254625 ?auto_254628 ) ) ( not ( = ?auto_254626 ?auto_254627 ) ) ( not ( = ?auto_254626 ?auto_254628 ) ) ( not ( = ?auto_254627 ?auto_254628 ) ) ( ON ?auto_254626 ?auto_254627 ) ( ON ?auto_254625 ?auto_254626 ) ( ON ?auto_254624 ?auto_254625 ) ( CLEAR ?auto_254622 ) ( ON ?auto_254623 ?auto_254624 ) ( CLEAR ?auto_254623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_254621 ?auto_254622 ?auto_254623 )
      ( MAKE-7PILE ?auto_254621 ?auto_254622 ?auto_254623 ?auto_254624 ?auto_254625 ?auto_254626 ?auto_254627 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_254636 - BLOCK
      ?auto_254637 - BLOCK
      ?auto_254638 - BLOCK
      ?auto_254639 - BLOCK
      ?auto_254640 - BLOCK
      ?auto_254641 - BLOCK
      ?auto_254642 - BLOCK
    )
    :vars
    (
      ?auto_254643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254642 ?auto_254643 ) ( ON-TABLE ?auto_254636 ) ( ON ?auto_254637 ?auto_254636 ) ( not ( = ?auto_254636 ?auto_254637 ) ) ( not ( = ?auto_254636 ?auto_254638 ) ) ( not ( = ?auto_254636 ?auto_254639 ) ) ( not ( = ?auto_254636 ?auto_254640 ) ) ( not ( = ?auto_254636 ?auto_254641 ) ) ( not ( = ?auto_254636 ?auto_254642 ) ) ( not ( = ?auto_254636 ?auto_254643 ) ) ( not ( = ?auto_254637 ?auto_254638 ) ) ( not ( = ?auto_254637 ?auto_254639 ) ) ( not ( = ?auto_254637 ?auto_254640 ) ) ( not ( = ?auto_254637 ?auto_254641 ) ) ( not ( = ?auto_254637 ?auto_254642 ) ) ( not ( = ?auto_254637 ?auto_254643 ) ) ( not ( = ?auto_254638 ?auto_254639 ) ) ( not ( = ?auto_254638 ?auto_254640 ) ) ( not ( = ?auto_254638 ?auto_254641 ) ) ( not ( = ?auto_254638 ?auto_254642 ) ) ( not ( = ?auto_254638 ?auto_254643 ) ) ( not ( = ?auto_254639 ?auto_254640 ) ) ( not ( = ?auto_254639 ?auto_254641 ) ) ( not ( = ?auto_254639 ?auto_254642 ) ) ( not ( = ?auto_254639 ?auto_254643 ) ) ( not ( = ?auto_254640 ?auto_254641 ) ) ( not ( = ?auto_254640 ?auto_254642 ) ) ( not ( = ?auto_254640 ?auto_254643 ) ) ( not ( = ?auto_254641 ?auto_254642 ) ) ( not ( = ?auto_254641 ?auto_254643 ) ) ( not ( = ?auto_254642 ?auto_254643 ) ) ( ON ?auto_254641 ?auto_254642 ) ( ON ?auto_254640 ?auto_254641 ) ( ON ?auto_254639 ?auto_254640 ) ( CLEAR ?auto_254637 ) ( ON ?auto_254638 ?auto_254639 ) ( CLEAR ?auto_254638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_254636 ?auto_254637 ?auto_254638 )
      ( MAKE-7PILE ?auto_254636 ?auto_254637 ?auto_254638 ?auto_254639 ?auto_254640 ?auto_254641 ?auto_254642 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_254651 - BLOCK
      ?auto_254652 - BLOCK
      ?auto_254653 - BLOCK
      ?auto_254654 - BLOCK
      ?auto_254655 - BLOCK
      ?auto_254656 - BLOCK
      ?auto_254657 - BLOCK
    )
    :vars
    (
      ?auto_254658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254657 ?auto_254658 ) ( ON-TABLE ?auto_254651 ) ( not ( = ?auto_254651 ?auto_254652 ) ) ( not ( = ?auto_254651 ?auto_254653 ) ) ( not ( = ?auto_254651 ?auto_254654 ) ) ( not ( = ?auto_254651 ?auto_254655 ) ) ( not ( = ?auto_254651 ?auto_254656 ) ) ( not ( = ?auto_254651 ?auto_254657 ) ) ( not ( = ?auto_254651 ?auto_254658 ) ) ( not ( = ?auto_254652 ?auto_254653 ) ) ( not ( = ?auto_254652 ?auto_254654 ) ) ( not ( = ?auto_254652 ?auto_254655 ) ) ( not ( = ?auto_254652 ?auto_254656 ) ) ( not ( = ?auto_254652 ?auto_254657 ) ) ( not ( = ?auto_254652 ?auto_254658 ) ) ( not ( = ?auto_254653 ?auto_254654 ) ) ( not ( = ?auto_254653 ?auto_254655 ) ) ( not ( = ?auto_254653 ?auto_254656 ) ) ( not ( = ?auto_254653 ?auto_254657 ) ) ( not ( = ?auto_254653 ?auto_254658 ) ) ( not ( = ?auto_254654 ?auto_254655 ) ) ( not ( = ?auto_254654 ?auto_254656 ) ) ( not ( = ?auto_254654 ?auto_254657 ) ) ( not ( = ?auto_254654 ?auto_254658 ) ) ( not ( = ?auto_254655 ?auto_254656 ) ) ( not ( = ?auto_254655 ?auto_254657 ) ) ( not ( = ?auto_254655 ?auto_254658 ) ) ( not ( = ?auto_254656 ?auto_254657 ) ) ( not ( = ?auto_254656 ?auto_254658 ) ) ( not ( = ?auto_254657 ?auto_254658 ) ) ( ON ?auto_254656 ?auto_254657 ) ( ON ?auto_254655 ?auto_254656 ) ( ON ?auto_254654 ?auto_254655 ) ( ON ?auto_254653 ?auto_254654 ) ( CLEAR ?auto_254651 ) ( ON ?auto_254652 ?auto_254653 ) ( CLEAR ?auto_254652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_254651 ?auto_254652 )
      ( MAKE-7PILE ?auto_254651 ?auto_254652 ?auto_254653 ?auto_254654 ?auto_254655 ?auto_254656 ?auto_254657 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_254666 - BLOCK
      ?auto_254667 - BLOCK
      ?auto_254668 - BLOCK
      ?auto_254669 - BLOCK
      ?auto_254670 - BLOCK
      ?auto_254671 - BLOCK
      ?auto_254672 - BLOCK
    )
    :vars
    (
      ?auto_254673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254672 ?auto_254673 ) ( ON-TABLE ?auto_254666 ) ( not ( = ?auto_254666 ?auto_254667 ) ) ( not ( = ?auto_254666 ?auto_254668 ) ) ( not ( = ?auto_254666 ?auto_254669 ) ) ( not ( = ?auto_254666 ?auto_254670 ) ) ( not ( = ?auto_254666 ?auto_254671 ) ) ( not ( = ?auto_254666 ?auto_254672 ) ) ( not ( = ?auto_254666 ?auto_254673 ) ) ( not ( = ?auto_254667 ?auto_254668 ) ) ( not ( = ?auto_254667 ?auto_254669 ) ) ( not ( = ?auto_254667 ?auto_254670 ) ) ( not ( = ?auto_254667 ?auto_254671 ) ) ( not ( = ?auto_254667 ?auto_254672 ) ) ( not ( = ?auto_254667 ?auto_254673 ) ) ( not ( = ?auto_254668 ?auto_254669 ) ) ( not ( = ?auto_254668 ?auto_254670 ) ) ( not ( = ?auto_254668 ?auto_254671 ) ) ( not ( = ?auto_254668 ?auto_254672 ) ) ( not ( = ?auto_254668 ?auto_254673 ) ) ( not ( = ?auto_254669 ?auto_254670 ) ) ( not ( = ?auto_254669 ?auto_254671 ) ) ( not ( = ?auto_254669 ?auto_254672 ) ) ( not ( = ?auto_254669 ?auto_254673 ) ) ( not ( = ?auto_254670 ?auto_254671 ) ) ( not ( = ?auto_254670 ?auto_254672 ) ) ( not ( = ?auto_254670 ?auto_254673 ) ) ( not ( = ?auto_254671 ?auto_254672 ) ) ( not ( = ?auto_254671 ?auto_254673 ) ) ( not ( = ?auto_254672 ?auto_254673 ) ) ( ON ?auto_254671 ?auto_254672 ) ( ON ?auto_254670 ?auto_254671 ) ( ON ?auto_254669 ?auto_254670 ) ( ON ?auto_254668 ?auto_254669 ) ( CLEAR ?auto_254666 ) ( ON ?auto_254667 ?auto_254668 ) ( CLEAR ?auto_254667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_254666 ?auto_254667 )
      ( MAKE-7PILE ?auto_254666 ?auto_254667 ?auto_254668 ?auto_254669 ?auto_254670 ?auto_254671 ?auto_254672 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_254681 - BLOCK
      ?auto_254682 - BLOCK
      ?auto_254683 - BLOCK
      ?auto_254684 - BLOCK
      ?auto_254685 - BLOCK
      ?auto_254686 - BLOCK
      ?auto_254687 - BLOCK
    )
    :vars
    (
      ?auto_254688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254687 ?auto_254688 ) ( not ( = ?auto_254681 ?auto_254682 ) ) ( not ( = ?auto_254681 ?auto_254683 ) ) ( not ( = ?auto_254681 ?auto_254684 ) ) ( not ( = ?auto_254681 ?auto_254685 ) ) ( not ( = ?auto_254681 ?auto_254686 ) ) ( not ( = ?auto_254681 ?auto_254687 ) ) ( not ( = ?auto_254681 ?auto_254688 ) ) ( not ( = ?auto_254682 ?auto_254683 ) ) ( not ( = ?auto_254682 ?auto_254684 ) ) ( not ( = ?auto_254682 ?auto_254685 ) ) ( not ( = ?auto_254682 ?auto_254686 ) ) ( not ( = ?auto_254682 ?auto_254687 ) ) ( not ( = ?auto_254682 ?auto_254688 ) ) ( not ( = ?auto_254683 ?auto_254684 ) ) ( not ( = ?auto_254683 ?auto_254685 ) ) ( not ( = ?auto_254683 ?auto_254686 ) ) ( not ( = ?auto_254683 ?auto_254687 ) ) ( not ( = ?auto_254683 ?auto_254688 ) ) ( not ( = ?auto_254684 ?auto_254685 ) ) ( not ( = ?auto_254684 ?auto_254686 ) ) ( not ( = ?auto_254684 ?auto_254687 ) ) ( not ( = ?auto_254684 ?auto_254688 ) ) ( not ( = ?auto_254685 ?auto_254686 ) ) ( not ( = ?auto_254685 ?auto_254687 ) ) ( not ( = ?auto_254685 ?auto_254688 ) ) ( not ( = ?auto_254686 ?auto_254687 ) ) ( not ( = ?auto_254686 ?auto_254688 ) ) ( not ( = ?auto_254687 ?auto_254688 ) ) ( ON ?auto_254686 ?auto_254687 ) ( ON ?auto_254685 ?auto_254686 ) ( ON ?auto_254684 ?auto_254685 ) ( ON ?auto_254683 ?auto_254684 ) ( ON ?auto_254682 ?auto_254683 ) ( ON ?auto_254681 ?auto_254682 ) ( CLEAR ?auto_254681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_254681 )
      ( MAKE-7PILE ?auto_254681 ?auto_254682 ?auto_254683 ?auto_254684 ?auto_254685 ?auto_254686 ?auto_254687 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_254696 - BLOCK
      ?auto_254697 - BLOCK
      ?auto_254698 - BLOCK
      ?auto_254699 - BLOCK
      ?auto_254700 - BLOCK
      ?auto_254701 - BLOCK
      ?auto_254702 - BLOCK
    )
    :vars
    (
      ?auto_254703 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254702 ?auto_254703 ) ( not ( = ?auto_254696 ?auto_254697 ) ) ( not ( = ?auto_254696 ?auto_254698 ) ) ( not ( = ?auto_254696 ?auto_254699 ) ) ( not ( = ?auto_254696 ?auto_254700 ) ) ( not ( = ?auto_254696 ?auto_254701 ) ) ( not ( = ?auto_254696 ?auto_254702 ) ) ( not ( = ?auto_254696 ?auto_254703 ) ) ( not ( = ?auto_254697 ?auto_254698 ) ) ( not ( = ?auto_254697 ?auto_254699 ) ) ( not ( = ?auto_254697 ?auto_254700 ) ) ( not ( = ?auto_254697 ?auto_254701 ) ) ( not ( = ?auto_254697 ?auto_254702 ) ) ( not ( = ?auto_254697 ?auto_254703 ) ) ( not ( = ?auto_254698 ?auto_254699 ) ) ( not ( = ?auto_254698 ?auto_254700 ) ) ( not ( = ?auto_254698 ?auto_254701 ) ) ( not ( = ?auto_254698 ?auto_254702 ) ) ( not ( = ?auto_254698 ?auto_254703 ) ) ( not ( = ?auto_254699 ?auto_254700 ) ) ( not ( = ?auto_254699 ?auto_254701 ) ) ( not ( = ?auto_254699 ?auto_254702 ) ) ( not ( = ?auto_254699 ?auto_254703 ) ) ( not ( = ?auto_254700 ?auto_254701 ) ) ( not ( = ?auto_254700 ?auto_254702 ) ) ( not ( = ?auto_254700 ?auto_254703 ) ) ( not ( = ?auto_254701 ?auto_254702 ) ) ( not ( = ?auto_254701 ?auto_254703 ) ) ( not ( = ?auto_254702 ?auto_254703 ) ) ( ON ?auto_254701 ?auto_254702 ) ( ON ?auto_254700 ?auto_254701 ) ( ON ?auto_254699 ?auto_254700 ) ( ON ?auto_254698 ?auto_254699 ) ( ON ?auto_254697 ?auto_254698 ) ( ON ?auto_254696 ?auto_254697 ) ( CLEAR ?auto_254696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_254696 )
      ( MAKE-7PILE ?auto_254696 ?auto_254697 ?auto_254698 ?auto_254699 ?auto_254700 ?auto_254701 ?auto_254702 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_254712 - BLOCK
      ?auto_254713 - BLOCK
      ?auto_254714 - BLOCK
      ?auto_254715 - BLOCK
      ?auto_254716 - BLOCK
      ?auto_254717 - BLOCK
      ?auto_254718 - BLOCK
      ?auto_254719 - BLOCK
    )
    :vars
    (
      ?auto_254720 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_254718 ) ( ON ?auto_254719 ?auto_254720 ) ( CLEAR ?auto_254719 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_254712 ) ( ON ?auto_254713 ?auto_254712 ) ( ON ?auto_254714 ?auto_254713 ) ( ON ?auto_254715 ?auto_254714 ) ( ON ?auto_254716 ?auto_254715 ) ( ON ?auto_254717 ?auto_254716 ) ( ON ?auto_254718 ?auto_254717 ) ( not ( = ?auto_254712 ?auto_254713 ) ) ( not ( = ?auto_254712 ?auto_254714 ) ) ( not ( = ?auto_254712 ?auto_254715 ) ) ( not ( = ?auto_254712 ?auto_254716 ) ) ( not ( = ?auto_254712 ?auto_254717 ) ) ( not ( = ?auto_254712 ?auto_254718 ) ) ( not ( = ?auto_254712 ?auto_254719 ) ) ( not ( = ?auto_254712 ?auto_254720 ) ) ( not ( = ?auto_254713 ?auto_254714 ) ) ( not ( = ?auto_254713 ?auto_254715 ) ) ( not ( = ?auto_254713 ?auto_254716 ) ) ( not ( = ?auto_254713 ?auto_254717 ) ) ( not ( = ?auto_254713 ?auto_254718 ) ) ( not ( = ?auto_254713 ?auto_254719 ) ) ( not ( = ?auto_254713 ?auto_254720 ) ) ( not ( = ?auto_254714 ?auto_254715 ) ) ( not ( = ?auto_254714 ?auto_254716 ) ) ( not ( = ?auto_254714 ?auto_254717 ) ) ( not ( = ?auto_254714 ?auto_254718 ) ) ( not ( = ?auto_254714 ?auto_254719 ) ) ( not ( = ?auto_254714 ?auto_254720 ) ) ( not ( = ?auto_254715 ?auto_254716 ) ) ( not ( = ?auto_254715 ?auto_254717 ) ) ( not ( = ?auto_254715 ?auto_254718 ) ) ( not ( = ?auto_254715 ?auto_254719 ) ) ( not ( = ?auto_254715 ?auto_254720 ) ) ( not ( = ?auto_254716 ?auto_254717 ) ) ( not ( = ?auto_254716 ?auto_254718 ) ) ( not ( = ?auto_254716 ?auto_254719 ) ) ( not ( = ?auto_254716 ?auto_254720 ) ) ( not ( = ?auto_254717 ?auto_254718 ) ) ( not ( = ?auto_254717 ?auto_254719 ) ) ( not ( = ?auto_254717 ?auto_254720 ) ) ( not ( = ?auto_254718 ?auto_254719 ) ) ( not ( = ?auto_254718 ?auto_254720 ) ) ( not ( = ?auto_254719 ?auto_254720 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_254719 ?auto_254720 )
      ( !STACK ?auto_254719 ?auto_254718 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_254729 - BLOCK
      ?auto_254730 - BLOCK
      ?auto_254731 - BLOCK
      ?auto_254732 - BLOCK
      ?auto_254733 - BLOCK
      ?auto_254734 - BLOCK
      ?auto_254735 - BLOCK
      ?auto_254736 - BLOCK
    )
    :vars
    (
      ?auto_254737 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_254735 ) ( ON ?auto_254736 ?auto_254737 ) ( CLEAR ?auto_254736 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_254729 ) ( ON ?auto_254730 ?auto_254729 ) ( ON ?auto_254731 ?auto_254730 ) ( ON ?auto_254732 ?auto_254731 ) ( ON ?auto_254733 ?auto_254732 ) ( ON ?auto_254734 ?auto_254733 ) ( ON ?auto_254735 ?auto_254734 ) ( not ( = ?auto_254729 ?auto_254730 ) ) ( not ( = ?auto_254729 ?auto_254731 ) ) ( not ( = ?auto_254729 ?auto_254732 ) ) ( not ( = ?auto_254729 ?auto_254733 ) ) ( not ( = ?auto_254729 ?auto_254734 ) ) ( not ( = ?auto_254729 ?auto_254735 ) ) ( not ( = ?auto_254729 ?auto_254736 ) ) ( not ( = ?auto_254729 ?auto_254737 ) ) ( not ( = ?auto_254730 ?auto_254731 ) ) ( not ( = ?auto_254730 ?auto_254732 ) ) ( not ( = ?auto_254730 ?auto_254733 ) ) ( not ( = ?auto_254730 ?auto_254734 ) ) ( not ( = ?auto_254730 ?auto_254735 ) ) ( not ( = ?auto_254730 ?auto_254736 ) ) ( not ( = ?auto_254730 ?auto_254737 ) ) ( not ( = ?auto_254731 ?auto_254732 ) ) ( not ( = ?auto_254731 ?auto_254733 ) ) ( not ( = ?auto_254731 ?auto_254734 ) ) ( not ( = ?auto_254731 ?auto_254735 ) ) ( not ( = ?auto_254731 ?auto_254736 ) ) ( not ( = ?auto_254731 ?auto_254737 ) ) ( not ( = ?auto_254732 ?auto_254733 ) ) ( not ( = ?auto_254732 ?auto_254734 ) ) ( not ( = ?auto_254732 ?auto_254735 ) ) ( not ( = ?auto_254732 ?auto_254736 ) ) ( not ( = ?auto_254732 ?auto_254737 ) ) ( not ( = ?auto_254733 ?auto_254734 ) ) ( not ( = ?auto_254733 ?auto_254735 ) ) ( not ( = ?auto_254733 ?auto_254736 ) ) ( not ( = ?auto_254733 ?auto_254737 ) ) ( not ( = ?auto_254734 ?auto_254735 ) ) ( not ( = ?auto_254734 ?auto_254736 ) ) ( not ( = ?auto_254734 ?auto_254737 ) ) ( not ( = ?auto_254735 ?auto_254736 ) ) ( not ( = ?auto_254735 ?auto_254737 ) ) ( not ( = ?auto_254736 ?auto_254737 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_254736 ?auto_254737 )
      ( !STACK ?auto_254736 ?auto_254735 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_254746 - BLOCK
      ?auto_254747 - BLOCK
      ?auto_254748 - BLOCK
      ?auto_254749 - BLOCK
      ?auto_254750 - BLOCK
      ?auto_254751 - BLOCK
      ?auto_254752 - BLOCK
      ?auto_254753 - BLOCK
    )
    :vars
    (
      ?auto_254754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254753 ?auto_254754 ) ( ON-TABLE ?auto_254746 ) ( ON ?auto_254747 ?auto_254746 ) ( ON ?auto_254748 ?auto_254747 ) ( ON ?auto_254749 ?auto_254748 ) ( ON ?auto_254750 ?auto_254749 ) ( ON ?auto_254751 ?auto_254750 ) ( not ( = ?auto_254746 ?auto_254747 ) ) ( not ( = ?auto_254746 ?auto_254748 ) ) ( not ( = ?auto_254746 ?auto_254749 ) ) ( not ( = ?auto_254746 ?auto_254750 ) ) ( not ( = ?auto_254746 ?auto_254751 ) ) ( not ( = ?auto_254746 ?auto_254752 ) ) ( not ( = ?auto_254746 ?auto_254753 ) ) ( not ( = ?auto_254746 ?auto_254754 ) ) ( not ( = ?auto_254747 ?auto_254748 ) ) ( not ( = ?auto_254747 ?auto_254749 ) ) ( not ( = ?auto_254747 ?auto_254750 ) ) ( not ( = ?auto_254747 ?auto_254751 ) ) ( not ( = ?auto_254747 ?auto_254752 ) ) ( not ( = ?auto_254747 ?auto_254753 ) ) ( not ( = ?auto_254747 ?auto_254754 ) ) ( not ( = ?auto_254748 ?auto_254749 ) ) ( not ( = ?auto_254748 ?auto_254750 ) ) ( not ( = ?auto_254748 ?auto_254751 ) ) ( not ( = ?auto_254748 ?auto_254752 ) ) ( not ( = ?auto_254748 ?auto_254753 ) ) ( not ( = ?auto_254748 ?auto_254754 ) ) ( not ( = ?auto_254749 ?auto_254750 ) ) ( not ( = ?auto_254749 ?auto_254751 ) ) ( not ( = ?auto_254749 ?auto_254752 ) ) ( not ( = ?auto_254749 ?auto_254753 ) ) ( not ( = ?auto_254749 ?auto_254754 ) ) ( not ( = ?auto_254750 ?auto_254751 ) ) ( not ( = ?auto_254750 ?auto_254752 ) ) ( not ( = ?auto_254750 ?auto_254753 ) ) ( not ( = ?auto_254750 ?auto_254754 ) ) ( not ( = ?auto_254751 ?auto_254752 ) ) ( not ( = ?auto_254751 ?auto_254753 ) ) ( not ( = ?auto_254751 ?auto_254754 ) ) ( not ( = ?auto_254752 ?auto_254753 ) ) ( not ( = ?auto_254752 ?auto_254754 ) ) ( not ( = ?auto_254753 ?auto_254754 ) ) ( CLEAR ?auto_254751 ) ( ON ?auto_254752 ?auto_254753 ) ( CLEAR ?auto_254752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_254746 ?auto_254747 ?auto_254748 ?auto_254749 ?auto_254750 ?auto_254751 ?auto_254752 )
      ( MAKE-8PILE ?auto_254746 ?auto_254747 ?auto_254748 ?auto_254749 ?auto_254750 ?auto_254751 ?auto_254752 ?auto_254753 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_254763 - BLOCK
      ?auto_254764 - BLOCK
      ?auto_254765 - BLOCK
      ?auto_254766 - BLOCK
      ?auto_254767 - BLOCK
      ?auto_254768 - BLOCK
      ?auto_254769 - BLOCK
      ?auto_254770 - BLOCK
    )
    :vars
    (
      ?auto_254771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254770 ?auto_254771 ) ( ON-TABLE ?auto_254763 ) ( ON ?auto_254764 ?auto_254763 ) ( ON ?auto_254765 ?auto_254764 ) ( ON ?auto_254766 ?auto_254765 ) ( ON ?auto_254767 ?auto_254766 ) ( ON ?auto_254768 ?auto_254767 ) ( not ( = ?auto_254763 ?auto_254764 ) ) ( not ( = ?auto_254763 ?auto_254765 ) ) ( not ( = ?auto_254763 ?auto_254766 ) ) ( not ( = ?auto_254763 ?auto_254767 ) ) ( not ( = ?auto_254763 ?auto_254768 ) ) ( not ( = ?auto_254763 ?auto_254769 ) ) ( not ( = ?auto_254763 ?auto_254770 ) ) ( not ( = ?auto_254763 ?auto_254771 ) ) ( not ( = ?auto_254764 ?auto_254765 ) ) ( not ( = ?auto_254764 ?auto_254766 ) ) ( not ( = ?auto_254764 ?auto_254767 ) ) ( not ( = ?auto_254764 ?auto_254768 ) ) ( not ( = ?auto_254764 ?auto_254769 ) ) ( not ( = ?auto_254764 ?auto_254770 ) ) ( not ( = ?auto_254764 ?auto_254771 ) ) ( not ( = ?auto_254765 ?auto_254766 ) ) ( not ( = ?auto_254765 ?auto_254767 ) ) ( not ( = ?auto_254765 ?auto_254768 ) ) ( not ( = ?auto_254765 ?auto_254769 ) ) ( not ( = ?auto_254765 ?auto_254770 ) ) ( not ( = ?auto_254765 ?auto_254771 ) ) ( not ( = ?auto_254766 ?auto_254767 ) ) ( not ( = ?auto_254766 ?auto_254768 ) ) ( not ( = ?auto_254766 ?auto_254769 ) ) ( not ( = ?auto_254766 ?auto_254770 ) ) ( not ( = ?auto_254766 ?auto_254771 ) ) ( not ( = ?auto_254767 ?auto_254768 ) ) ( not ( = ?auto_254767 ?auto_254769 ) ) ( not ( = ?auto_254767 ?auto_254770 ) ) ( not ( = ?auto_254767 ?auto_254771 ) ) ( not ( = ?auto_254768 ?auto_254769 ) ) ( not ( = ?auto_254768 ?auto_254770 ) ) ( not ( = ?auto_254768 ?auto_254771 ) ) ( not ( = ?auto_254769 ?auto_254770 ) ) ( not ( = ?auto_254769 ?auto_254771 ) ) ( not ( = ?auto_254770 ?auto_254771 ) ) ( CLEAR ?auto_254768 ) ( ON ?auto_254769 ?auto_254770 ) ( CLEAR ?auto_254769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_254763 ?auto_254764 ?auto_254765 ?auto_254766 ?auto_254767 ?auto_254768 ?auto_254769 )
      ( MAKE-8PILE ?auto_254763 ?auto_254764 ?auto_254765 ?auto_254766 ?auto_254767 ?auto_254768 ?auto_254769 ?auto_254770 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_254780 - BLOCK
      ?auto_254781 - BLOCK
      ?auto_254782 - BLOCK
      ?auto_254783 - BLOCK
      ?auto_254784 - BLOCK
      ?auto_254785 - BLOCK
      ?auto_254786 - BLOCK
      ?auto_254787 - BLOCK
    )
    :vars
    (
      ?auto_254788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254787 ?auto_254788 ) ( ON-TABLE ?auto_254780 ) ( ON ?auto_254781 ?auto_254780 ) ( ON ?auto_254782 ?auto_254781 ) ( ON ?auto_254783 ?auto_254782 ) ( ON ?auto_254784 ?auto_254783 ) ( not ( = ?auto_254780 ?auto_254781 ) ) ( not ( = ?auto_254780 ?auto_254782 ) ) ( not ( = ?auto_254780 ?auto_254783 ) ) ( not ( = ?auto_254780 ?auto_254784 ) ) ( not ( = ?auto_254780 ?auto_254785 ) ) ( not ( = ?auto_254780 ?auto_254786 ) ) ( not ( = ?auto_254780 ?auto_254787 ) ) ( not ( = ?auto_254780 ?auto_254788 ) ) ( not ( = ?auto_254781 ?auto_254782 ) ) ( not ( = ?auto_254781 ?auto_254783 ) ) ( not ( = ?auto_254781 ?auto_254784 ) ) ( not ( = ?auto_254781 ?auto_254785 ) ) ( not ( = ?auto_254781 ?auto_254786 ) ) ( not ( = ?auto_254781 ?auto_254787 ) ) ( not ( = ?auto_254781 ?auto_254788 ) ) ( not ( = ?auto_254782 ?auto_254783 ) ) ( not ( = ?auto_254782 ?auto_254784 ) ) ( not ( = ?auto_254782 ?auto_254785 ) ) ( not ( = ?auto_254782 ?auto_254786 ) ) ( not ( = ?auto_254782 ?auto_254787 ) ) ( not ( = ?auto_254782 ?auto_254788 ) ) ( not ( = ?auto_254783 ?auto_254784 ) ) ( not ( = ?auto_254783 ?auto_254785 ) ) ( not ( = ?auto_254783 ?auto_254786 ) ) ( not ( = ?auto_254783 ?auto_254787 ) ) ( not ( = ?auto_254783 ?auto_254788 ) ) ( not ( = ?auto_254784 ?auto_254785 ) ) ( not ( = ?auto_254784 ?auto_254786 ) ) ( not ( = ?auto_254784 ?auto_254787 ) ) ( not ( = ?auto_254784 ?auto_254788 ) ) ( not ( = ?auto_254785 ?auto_254786 ) ) ( not ( = ?auto_254785 ?auto_254787 ) ) ( not ( = ?auto_254785 ?auto_254788 ) ) ( not ( = ?auto_254786 ?auto_254787 ) ) ( not ( = ?auto_254786 ?auto_254788 ) ) ( not ( = ?auto_254787 ?auto_254788 ) ) ( ON ?auto_254786 ?auto_254787 ) ( CLEAR ?auto_254784 ) ( ON ?auto_254785 ?auto_254786 ) ( CLEAR ?auto_254785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_254780 ?auto_254781 ?auto_254782 ?auto_254783 ?auto_254784 ?auto_254785 )
      ( MAKE-8PILE ?auto_254780 ?auto_254781 ?auto_254782 ?auto_254783 ?auto_254784 ?auto_254785 ?auto_254786 ?auto_254787 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_254797 - BLOCK
      ?auto_254798 - BLOCK
      ?auto_254799 - BLOCK
      ?auto_254800 - BLOCK
      ?auto_254801 - BLOCK
      ?auto_254802 - BLOCK
      ?auto_254803 - BLOCK
      ?auto_254804 - BLOCK
    )
    :vars
    (
      ?auto_254805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254804 ?auto_254805 ) ( ON-TABLE ?auto_254797 ) ( ON ?auto_254798 ?auto_254797 ) ( ON ?auto_254799 ?auto_254798 ) ( ON ?auto_254800 ?auto_254799 ) ( ON ?auto_254801 ?auto_254800 ) ( not ( = ?auto_254797 ?auto_254798 ) ) ( not ( = ?auto_254797 ?auto_254799 ) ) ( not ( = ?auto_254797 ?auto_254800 ) ) ( not ( = ?auto_254797 ?auto_254801 ) ) ( not ( = ?auto_254797 ?auto_254802 ) ) ( not ( = ?auto_254797 ?auto_254803 ) ) ( not ( = ?auto_254797 ?auto_254804 ) ) ( not ( = ?auto_254797 ?auto_254805 ) ) ( not ( = ?auto_254798 ?auto_254799 ) ) ( not ( = ?auto_254798 ?auto_254800 ) ) ( not ( = ?auto_254798 ?auto_254801 ) ) ( not ( = ?auto_254798 ?auto_254802 ) ) ( not ( = ?auto_254798 ?auto_254803 ) ) ( not ( = ?auto_254798 ?auto_254804 ) ) ( not ( = ?auto_254798 ?auto_254805 ) ) ( not ( = ?auto_254799 ?auto_254800 ) ) ( not ( = ?auto_254799 ?auto_254801 ) ) ( not ( = ?auto_254799 ?auto_254802 ) ) ( not ( = ?auto_254799 ?auto_254803 ) ) ( not ( = ?auto_254799 ?auto_254804 ) ) ( not ( = ?auto_254799 ?auto_254805 ) ) ( not ( = ?auto_254800 ?auto_254801 ) ) ( not ( = ?auto_254800 ?auto_254802 ) ) ( not ( = ?auto_254800 ?auto_254803 ) ) ( not ( = ?auto_254800 ?auto_254804 ) ) ( not ( = ?auto_254800 ?auto_254805 ) ) ( not ( = ?auto_254801 ?auto_254802 ) ) ( not ( = ?auto_254801 ?auto_254803 ) ) ( not ( = ?auto_254801 ?auto_254804 ) ) ( not ( = ?auto_254801 ?auto_254805 ) ) ( not ( = ?auto_254802 ?auto_254803 ) ) ( not ( = ?auto_254802 ?auto_254804 ) ) ( not ( = ?auto_254802 ?auto_254805 ) ) ( not ( = ?auto_254803 ?auto_254804 ) ) ( not ( = ?auto_254803 ?auto_254805 ) ) ( not ( = ?auto_254804 ?auto_254805 ) ) ( ON ?auto_254803 ?auto_254804 ) ( CLEAR ?auto_254801 ) ( ON ?auto_254802 ?auto_254803 ) ( CLEAR ?auto_254802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_254797 ?auto_254798 ?auto_254799 ?auto_254800 ?auto_254801 ?auto_254802 )
      ( MAKE-8PILE ?auto_254797 ?auto_254798 ?auto_254799 ?auto_254800 ?auto_254801 ?auto_254802 ?auto_254803 ?auto_254804 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_254814 - BLOCK
      ?auto_254815 - BLOCK
      ?auto_254816 - BLOCK
      ?auto_254817 - BLOCK
      ?auto_254818 - BLOCK
      ?auto_254819 - BLOCK
      ?auto_254820 - BLOCK
      ?auto_254821 - BLOCK
    )
    :vars
    (
      ?auto_254822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254821 ?auto_254822 ) ( ON-TABLE ?auto_254814 ) ( ON ?auto_254815 ?auto_254814 ) ( ON ?auto_254816 ?auto_254815 ) ( ON ?auto_254817 ?auto_254816 ) ( not ( = ?auto_254814 ?auto_254815 ) ) ( not ( = ?auto_254814 ?auto_254816 ) ) ( not ( = ?auto_254814 ?auto_254817 ) ) ( not ( = ?auto_254814 ?auto_254818 ) ) ( not ( = ?auto_254814 ?auto_254819 ) ) ( not ( = ?auto_254814 ?auto_254820 ) ) ( not ( = ?auto_254814 ?auto_254821 ) ) ( not ( = ?auto_254814 ?auto_254822 ) ) ( not ( = ?auto_254815 ?auto_254816 ) ) ( not ( = ?auto_254815 ?auto_254817 ) ) ( not ( = ?auto_254815 ?auto_254818 ) ) ( not ( = ?auto_254815 ?auto_254819 ) ) ( not ( = ?auto_254815 ?auto_254820 ) ) ( not ( = ?auto_254815 ?auto_254821 ) ) ( not ( = ?auto_254815 ?auto_254822 ) ) ( not ( = ?auto_254816 ?auto_254817 ) ) ( not ( = ?auto_254816 ?auto_254818 ) ) ( not ( = ?auto_254816 ?auto_254819 ) ) ( not ( = ?auto_254816 ?auto_254820 ) ) ( not ( = ?auto_254816 ?auto_254821 ) ) ( not ( = ?auto_254816 ?auto_254822 ) ) ( not ( = ?auto_254817 ?auto_254818 ) ) ( not ( = ?auto_254817 ?auto_254819 ) ) ( not ( = ?auto_254817 ?auto_254820 ) ) ( not ( = ?auto_254817 ?auto_254821 ) ) ( not ( = ?auto_254817 ?auto_254822 ) ) ( not ( = ?auto_254818 ?auto_254819 ) ) ( not ( = ?auto_254818 ?auto_254820 ) ) ( not ( = ?auto_254818 ?auto_254821 ) ) ( not ( = ?auto_254818 ?auto_254822 ) ) ( not ( = ?auto_254819 ?auto_254820 ) ) ( not ( = ?auto_254819 ?auto_254821 ) ) ( not ( = ?auto_254819 ?auto_254822 ) ) ( not ( = ?auto_254820 ?auto_254821 ) ) ( not ( = ?auto_254820 ?auto_254822 ) ) ( not ( = ?auto_254821 ?auto_254822 ) ) ( ON ?auto_254820 ?auto_254821 ) ( ON ?auto_254819 ?auto_254820 ) ( CLEAR ?auto_254817 ) ( ON ?auto_254818 ?auto_254819 ) ( CLEAR ?auto_254818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_254814 ?auto_254815 ?auto_254816 ?auto_254817 ?auto_254818 )
      ( MAKE-8PILE ?auto_254814 ?auto_254815 ?auto_254816 ?auto_254817 ?auto_254818 ?auto_254819 ?auto_254820 ?auto_254821 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_254831 - BLOCK
      ?auto_254832 - BLOCK
      ?auto_254833 - BLOCK
      ?auto_254834 - BLOCK
      ?auto_254835 - BLOCK
      ?auto_254836 - BLOCK
      ?auto_254837 - BLOCK
      ?auto_254838 - BLOCK
    )
    :vars
    (
      ?auto_254839 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254838 ?auto_254839 ) ( ON-TABLE ?auto_254831 ) ( ON ?auto_254832 ?auto_254831 ) ( ON ?auto_254833 ?auto_254832 ) ( ON ?auto_254834 ?auto_254833 ) ( not ( = ?auto_254831 ?auto_254832 ) ) ( not ( = ?auto_254831 ?auto_254833 ) ) ( not ( = ?auto_254831 ?auto_254834 ) ) ( not ( = ?auto_254831 ?auto_254835 ) ) ( not ( = ?auto_254831 ?auto_254836 ) ) ( not ( = ?auto_254831 ?auto_254837 ) ) ( not ( = ?auto_254831 ?auto_254838 ) ) ( not ( = ?auto_254831 ?auto_254839 ) ) ( not ( = ?auto_254832 ?auto_254833 ) ) ( not ( = ?auto_254832 ?auto_254834 ) ) ( not ( = ?auto_254832 ?auto_254835 ) ) ( not ( = ?auto_254832 ?auto_254836 ) ) ( not ( = ?auto_254832 ?auto_254837 ) ) ( not ( = ?auto_254832 ?auto_254838 ) ) ( not ( = ?auto_254832 ?auto_254839 ) ) ( not ( = ?auto_254833 ?auto_254834 ) ) ( not ( = ?auto_254833 ?auto_254835 ) ) ( not ( = ?auto_254833 ?auto_254836 ) ) ( not ( = ?auto_254833 ?auto_254837 ) ) ( not ( = ?auto_254833 ?auto_254838 ) ) ( not ( = ?auto_254833 ?auto_254839 ) ) ( not ( = ?auto_254834 ?auto_254835 ) ) ( not ( = ?auto_254834 ?auto_254836 ) ) ( not ( = ?auto_254834 ?auto_254837 ) ) ( not ( = ?auto_254834 ?auto_254838 ) ) ( not ( = ?auto_254834 ?auto_254839 ) ) ( not ( = ?auto_254835 ?auto_254836 ) ) ( not ( = ?auto_254835 ?auto_254837 ) ) ( not ( = ?auto_254835 ?auto_254838 ) ) ( not ( = ?auto_254835 ?auto_254839 ) ) ( not ( = ?auto_254836 ?auto_254837 ) ) ( not ( = ?auto_254836 ?auto_254838 ) ) ( not ( = ?auto_254836 ?auto_254839 ) ) ( not ( = ?auto_254837 ?auto_254838 ) ) ( not ( = ?auto_254837 ?auto_254839 ) ) ( not ( = ?auto_254838 ?auto_254839 ) ) ( ON ?auto_254837 ?auto_254838 ) ( ON ?auto_254836 ?auto_254837 ) ( CLEAR ?auto_254834 ) ( ON ?auto_254835 ?auto_254836 ) ( CLEAR ?auto_254835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_254831 ?auto_254832 ?auto_254833 ?auto_254834 ?auto_254835 )
      ( MAKE-8PILE ?auto_254831 ?auto_254832 ?auto_254833 ?auto_254834 ?auto_254835 ?auto_254836 ?auto_254837 ?auto_254838 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_254848 - BLOCK
      ?auto_254849 - BLOCK
      ?auto_254850 - BLOCK
      ?auto_254851 - BLOCK
      ?auto_254852 - BLOCK
      ?auto_254853 - BLOCK
      ?auto_254854 - BLOCK
      ?auto_254855 - BLOCK
    )
    :vars
    (
      ?auto_254856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254855 ?auto_254856 ) ( ON-TABLE ?auto_254848 ) ( ON ?auto_254849 ?auto_254848 ) ( ON ?auto_254850 ?auto_254849 ) ( not ( = ?auto_254848 ?auto_254849 ) ) ( not ( = ?auto_254848 ?auto_254850 ) ) ( not ( = ?auto_254848 ?auto_254851 ) ) ( not ( = ?auto_254848 ?auto_254852 ) ) ( not ( = ?auto_254848 ?auto_254853 ) ) ( not ( = ?auto_254848 ?auto_254854 ) ) ( not ( = ?auto_254848 ?auto_254855 ) ) ( not ( = ?auto_254848 ?auto_254856 ) ) ( not ( = ?auto_254849 ?auto_254850 ) ) ( not ( = ?auto_254849 ?auto_254851 ) ) ( not ( = ?auto_254849 ?auto_254852 ) ) ( not ( = ?auto_254849 ?auto_254853 ) ) ( not ( = ?auto_254849 ?auto_254854 ) ) ( not ( = ?auto_254849 ?auto_254855 ) ) ( not ( = ?auto_254849 ?auto_254856 ) ) ( not ( = ?auto_254850 ?auto_254851 ) ) ( not ( = ?auto_254850 ?auto_254852 ) ) ( not ( = ?auto_254850 ?auto_254853 ) ) ( not ( = ?auto_254850 ?auto_254854 ) ) ( not ( = ?auto_254850 ?auto_254855 ) ) ( not ( = ?auto_254850 ?auto_254856 ) ) ( not ( = ?auto_254851 ?auto_254852 ) ) ( not ( = ?auto_254851 ?auto_254853 ) ) ( not ( = ?auto_254851 ?auto_254854 ) ) ( not ( = ?auto_254851 ?auto_254855 ) ) ( not ( = ?auto_254851 ?auto_254856 ) ) ( not ( = ?auto_254852 ?auto_254853 ) ) ( not ( = ?auto_254852 ?auto_254854 ) ) ( not ( = ?auto_254852 ?auto_254855 ) ) ( not ( = ?auto_254852 ?auto_254856 ) ) ( not ( = ?auto_254853 ?auto_254854 ) ) ( not ( = ?auto_254853 ?auto_254855 ) ) ( not ( = ?auto_254853 ?auto_254856 ) ) ( not ( = ?auto_254854 ?auto_254855 ) ) ( not ( = ?auto_254854 ?auto_254856 ) ) ( not ( = ?auto_254855 ?auto_254856 ) ) ( ON ?auto_254854 ?auto_254855 ) ( ON ?auto_254853 ?auto_254854 ) ( ON ?auto_254852 ?auto_254853 ) ( CLEAR ?auto_254850 ) ( ON ?auto_254851 ?auto_254852 ) ( CLEAR ?auto_254851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_254848 ?auto_254849 ?auto_254850 ?auto_254851 )
      ( MAKE-8PILE ?auto_254848 ?auto_254849 ?auto_254850 ?auto_254851 ?auto_254852 ?auto_254853 ?auto_254854 ?auto_254855 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_254865 - BLOCK
      ?auto_254866 - BLOCK
      ?auto_254867 - BLOCK
      ?auto_254868 - BLOCK
      ?auto_254869 - BLOCK
      ?auto_254870 - BLOCK
      ?auto_254871 - BLOCK
      ?auto_254872 - BLOCK
    )
    :vars
    (
      ?auto_254873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254872 ?auto_254873 ) ( ON-TABLE ?auto_254865 ) ( ON ?auto_254866 ?auto_254865 ) ( ON ?auto_254867 ?auto_254866 ) ( not ( = ?auto_254865 ?auto_254866 ) ) ( not ( = ?auto_254865 ?auto_254867 ) ) ( not ( = ?auto_254865 ?auto_254868 ) ) ( not ( = ?auto_254865 ?auto_254869 ) ) ( not ( = ?auto_254865 ?auto_254870 ) ) ( not ( = ?auto_254865 ?auto_254871 ) ) ( not ( = ?auto_254865 ?auto_254872 ) ) ( not ( = ?auto_254865 ?auto_254873 ) ) ( not ( = ?auto_254866 ?auto_254867 ) ) ( not ( = ?auto_254866 ?auto_254868 ) ) ( not ( = ?auto_254866 ?auto_254869 ) ) ( not ( = ?auto_254866 ?auto_254870 ) ) ( not ( = ?auto_254866 ?auto_254871 ) ) ( not ( = ?auto_254866 ?auto_254872 ) ) ( not ( = ?auto_254866 ?auto_254873 ) ) ( not ( = ?auto_254867 ?auto_254868 ) ) ( not ( = ?auto_254867 ?auto_254869 ) ) ( not ( = ?auto_254867 ?auto_254870 ) ) ( not ( = ?auto_254867 ?auto_254871 ) ) ( not ( = ?auto_254867 ?auto_254872 ) ) ( not ( = ?auto_254867 ?auto_254873 ) ) ( not ( = ?auto_254868 ?auto_254869 ) ) ( not ( = ?auto_254868 ?auto_254870 ) ) ( not ( = ?auto_254868 ?auto_254871 ) ) ( not ( = ?auto_254868 ?auto_254872 ) ) ( not ( = ?auto_254868 ?auto_254873 ) ) ( not ( = ?auto_254869 ?auto_254870 ) ) ( not ( = ?auto_254869 ?auto_254871 ) ) ( not ( = ?auto_254869 ?auto_254872 ) ) ( not ( = ?auto_254869 ?auto_254873 ) ) ( not ( = ?auto_254870 ?auto_254871 ) ) ( not ( = ?auto_254870 ?auto_254872 ) ) ( not ( = ?auto_254870 ?auto_254873 ) ) ( not ( = ?auto_254871 ?auto_254872 ) ) ( not ( = ?auto_254871 ?auto_254873 ) ) ( not ( = ?auto_254872 ?auto_254873 ) ) ( ON ?auto_254871 ?auto_254872 ) ( ON ?auto_254870 ?auto_254871 ) ( ON ?auto_254869 ?auto_254870 ) ( CLEAR ?auto_254867 ) ( ON ?auto_254868 ?auto_254869 ) ( CLEAR ?auto_254868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_254865 ?auto_254866 ?auto_254867 ?auto_254868 )
      ( MAKE-8PILE ?auto_254865 ?auto_254866 ?auto_254867 ?auto_254868 ?auto_254869 ?auto_254870 ?auto_254871 ?auto_254872 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_254882 - BLOCK
      ?auto_254883 - BLOCK
      ?auto_254884 - BLOCK
      ?auto_254885 - BLOCK
      ?auto_254886 - BLOCK
      ?auto_254887 - BLOCK
      ?auto_254888 - BLOCK
      ?auto_254889 - BLOCK
    )
    :vars
    (
      ?auto_254890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254889 ?auto_254890 ) ( ON-TABLE ?auto_254882 ) ( ON ?auto_254883 ?auto_254882 ) ( not ( = ?auto_254882 ?auto_254883 ) ) ( not ( = ?auto_254882 ?auto_254884 ) ) ( not ( = ?auto_254882 ?auto_254885 ) ) ( not ( = ?auto_254882 ?auto_254886 ) ) ( not ( = ?auto_254882 ?auto_254887 ) ) ( not ( = ?auto_254882 ?auto_254888 ) ) ( not ( = ?auto_254882 ?auto_254889 ) ) ( not ( = ?auto_254882 ?auto_254890 ) ) ( not ( = ?auto_254883 ?auto_254884 ) ) ( not ( = ?auto_254883 ?auto_254885 ) ) ( not ( = ?auto_254883 ?auto_254886 ) ) ( not ( = ?auto_254883 ?auto_254887 ) ) ( not ( = ?auto_254883 ?auto_254888 ) ) ( not ( = ?auto_254883 ?auto_254889 ) ) ( not ( = ?auto_254883 ?auto_254890 ) ) ( not ( = ?auto_254884 ?auto_254885 ) ) ( not ( = ?auto_254884 ?auto_254886 ) ) ( not ( = ?auto_254884 ?auto_254887 ) ) ( not ( = ?auto_254884 ?auto_254888 ) ) ( not ( = ?auto_254884 ?auto_254889 ) ) ( not ( = ?auto_254884 ?auto_254890 ) ) ( not ( = ?auto_254885 ?auto_254886 ) ) ( not ( = ?auto_254885 ?auto_254887 ) ) ( not ( = ?auto_254885 ?auto_254888 ) ) ( not ( = ?auto_254885 ?auto_254889 ) ) ( not ( = ?auto_254885 ?auto_254890 ) ) ( not ( = ?auto_254886 ?auto_254887 ) ) ( not ( = ?auto_254886 ?auto_254888 ) ) ( not ( = ?auto_254886 ?auto_254889 ) ) ( not ( = ?auto_254886 ?auto_254890 ) ) ( not ( = ?auto_254887 ?auto_254888 ) ) ( not ( = ?auto_254887 ?auto_254889 ) ) ( not ( = ?auto_254887 ?auto_254890 ) ) ( not ( = ?auto_254888 ?auto_254889 ) ) ( not ( = ?auto_254888 ?auto_254890 ) ) ( not ( = ?auto_254889 ?auto_254890 ) ) ( ON ?auto_254888 ?auto_254889 ) ( ON ?auto_254887 ?auto_254888 ) ( ON ?auto_254886 ?auto_254887 ) ( ON ?auto_254885 ?auto_254886 ) ( CLEAR ?auto_254883 ) ( ON ?auto_254884 ?auto_254885 ) ( CLEAR ?auto_254884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_254882 ?auto_254883 ?auto_254884 )
      ( MAKE-8PILE ?auto_254882 ?auto_254883 ?auto_254884 ?auto_254885 ?auto_254886 ?auto_254887 ?auto_254888 ?auto_254889 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_254899 - BLOCK
      ?auto_254900 - BLOCK
      ?auto_254901 - BLOCK
      ?auto_254902 - BLOCK
      ?auto_254903 - BLOCK
      ?auto_254904 - BLOCK
      ?auto_254905 - BLOCK
      ?auto_254906 - BLOCK
    )
    :vars
    (
      ?auto_254907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254906 ?auto_254907 ) ( ON-TABLE ?auto_254899 ) ( ON ?auto_254900 ?auto_254899 ) ( not ( = ?auto_254899 ?auto_254900 ) ) ( not ( = ?auto_254899 ?auto_254901 ) ) ( not ( = ?auto_254899 ?auto_254902 ) ) ( not ( = ?auto_254899 ?auto_254903 ) ) ( not ( = ?auto_254899 ?auto_254904 ) ) ( not ( = ?auto_254899 ?auto_254905 ) ) ( not ( = ?auto_254899 ?auto_254906 ) ) ( not ( = ?auto_254899 ?auto_254907 ) ) ( not ( = ?auto_254900 ?auto_254901 ) ) ( not ( = ?auto_254900 ?auto_254902 ) ) ( not ( = ?auto_254900 ?auto_254903 ) ) ( not ( = ?auto_254900 ?auto_254904 ) ) ( not ( = ?auto_254900 ?auto_254905 ) ) ( not ( = ?auto_254900 ?auto_254906 ) ) ( not ( = ?auto_254900 ?auto_254907 ) ) ( not ( = ?auto_254901 ?auto_254902 ) ) ( not ( = ?auto_254901 ?auto_254903 ) ) ( not ( = ?auto_254901 ?auto_254904 ) ) ( not ( = ?auto_254901 ?auto_254905 ) ) ( not ( = ?auto_254901 ?auto_254906 ) ) ( not ( = ?auto_254901 ?auto_254907 ) ) ( not ( = ?auto_254902 ?auto_254903 ) ) ( not ( = ?auto_254902 ?auto_254904 ) ) ( not ( = ?auto_254902 ?auto_254905 ) ) ( not ( = ?auto_254902 ?auto_254906 ) ) ( not ( = ?auto_254902 ?auto_254907 ) ) ( not ( = ?auto_254903 ?auto_254904 ) ) ( not ( = ?auto_254903 ?auto_254905 ) ) ( not ( = ?auto_254903 ?auto_254906 ) ) ( not ( = ?auto_254903 ?auto_254907 ) ) ( not ( = ?auto_254904 ?auto_254905 ) ) ( not ( = ?auto_254904 ?auto_254906 ) ) ( not ( = ?auto_254904 ?auto_254907 ) ) ( not ( = ?auto_254905 ?auto_254906 ) ) ( not ( = ?auto_254905 ?auto_254907 ) ) ( not ( = ?auto_254906 ?auto_254907 ) ) ( ON ?auto_254905 ?auto_254906 ) ( ON ?auto_254904 ?auto_254905 ) ( ON ?auto_254903 ?auto_254904 ) ( ON ?auto_254902 ?auto_254903 ) ( CLEAR ?auto_254900 ) ( ON ?auto_254901 ?auto_254902 ) ( CLEAR ?auto_254901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_254899 ?auto_254900 ?auto_254901 )
      ( MAKE-8PILE ?auto_254899 ?auto_254900 ?auto_254901 ?auto_254902 ?auto_254903 ?auto_254904 ?auto_254905 ?auto_254906 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_254916 - BLOCK
      ?auto_254917 - BLOCK
      ?auto_254918 - BLOCK
      ?auto_254919 - BLOCK
      ?auto_254920 - BLOCK
      ?auto_254921 - BLOCK
      ?auto_254922 - BLOCK
      ?auto_254923 - BLOCK
    )
    :vars
    (
      ?auto_254924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254923 ?auto_254924 ) ( ON-TABLE ?auto_254916 ) ( not ( = ?auto_254916 ?auto_254917 ) ) ( not ( = ?auto_254916 ?auto_254918 ) ) ( not ( = ?auto_254916 ?auto_254919 ) ) ( not ( = ?auto_254916 ?auto_254920 ) ) ( not ( = ?auto_254916 ?auto_254921 ) ) ( not ( = ?auto_254916 ?auto_254922 ) ) ( not ( = ?auto_254916 ?auto_254923 ) ) ( not ( = ?auto_254916 ?auto_254924 ) ) ( not ( = ?auto_254917 ?auto_254918 ) ) ( not ( = ?auto_254917 ?auto_254919 ) ) ( not ( = ?auto_254917 ?auto_254920 ) ) ( not ( = ?auto_254917 ?auto_254921 ) ) ( not ( = ?auto_254917 ?auto_254922 ) ) ( not ( = ?auto_254917 ?auto_254923 ) ) ( not ( = ?auto_254917 ?auto_254924 ) ) ( not ( = ?auto_254918 ?auto_254919 ) ) ( not ( = ?auto_254918 ?auto_254920 ) ) ( not ( = ?auto_254918 ?auto_254921 ) ) ( not ( = ?auto_254918 ?auto_254922 ) ) ( not ( = ?auto_254918 ?auto_254923 ) ) ( not ( = ?auto_254918 ?auto_254924 ) ) ( not ( = ?auto_254919 ?auto_254920 ) ) ( not ( = ?auto_254919 ?auto_254921 ) ) ( not ( = ?auto_254919 ?auto_254922 ) ) ( not ( = ?auto_254919 ?auto_254923 ) ) ( not ( = ?auto_254919 ?auto_254924 ) ) ( not ( = ?auto_254920 ?auto_254921 ) ) ( not ( = ?auto_254920 ?auto_254922 ) ) ( not ( = ?auto_254920 ?auto_254923 ) ) ( not ( = ?auto_254920 ?auto_254924 ) ) ( not ( = ?auto_254921 ?auto_254922 ) ) ( not ( = ?auto_254921 ?auto_254923 ) ) ( not ( = ?auto_254921 ?auto_254924 ) ) ( not ( = ?auto_254922 ?auto_254923 ) ) ( not ( = ?auto_254922 ?auto_254924 ) ) ( not ( = ?auto_254923 ?auto_254924 ) ) ( ON ?auto_254922 ?auto_254923 ) ( ON ?auto_254921 ?auto_254922 ) ( ON ?auto_254920 ?auto_254921 ) ( ON ?auto_254919 ?auto_254920 ) ( ON ?auto_254918 ?auto_254919 ) ( CLEAR ?auto_254916 ) ( ON ?auto_254917 ?auto_254918 ) ( CLEAR ?auto_254917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_254916 ?auto_254917 )
      ( MAKE-8PILE ?auto_254916 ?auto_254917 ?auto_254918 ?auto_254919 ?auto_254920 ?auto_254921 ?auto_254922 ?auto_254923 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_254933 - BLOCK
      ?auto_254934 - BLOCK
      ?auto_254935 - BLOCK
      ?auto_254936 - BLOCK
      ?auto_254937 - BLOCK
      ?auto_254938 - BLOCK
      ?auto_254939 - BLOCK
      ?auto_254940 - BLOCK
    )
    :vars
    (
      ?auto_254941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254940 ?auto_254941 ) ( ON-TABLE ?auto_254933 ) ( not ( = ?auto_254933 ?auto_254934 ) ) ( not ( = ?auto_254933 ?auto_254935 ) ) ( not ( = ?auto_254933 ?auto_254936 ) ) ( not ( = ?auto_254933 ?auto_254937 ) ) ( not ( = ?auto_254933 ?auto_254938 ) ) ( not ( = ?auto_254933 ?auto_254939 ) ) ( not ( = ?auto_254933 ?auto_254940 ) ) ( not ( = ?auto_254933 ?auto_254941 ) ) ( not ( = ?auto_254934 ?auto_254935 ) ) ( not ( = ?auto_254934 ?auto_254936 ) ) ( not ( = ?auto_254934 ?auto_254937 ) ) ( not ( = ?auto_254934 ?auto_254938 ) ) ( not ( = ?auto_254934 ?auto_254939 ) ) ( not ( = ?auto_254934 ?auto_254940 ) ) ( not ( = ?auto_254934 ?auto_254941 ) ) ( not ( = ?auto_254935 ?auto_254936 ) ) ( not ( = ?auto_254935 ?auto_254937 ) ) ( not ( = ?auto_254935 ?auto_254938 ) ) ( not ( = ?auto_254935 ?auto_254939 ) ) ( not ( = ?auto_254935 ?auto_254940 ) ) ( not ( = ?auto_254935 ?auto_254941 ) ) ( not ( = ?auto_254936 ?auto_254937 ) ) ( not ( = ?auto_254936 ?auto_254938 ) ) ( not ( = ?auto_254936 ?auto_254939 ) ) ( not ( = ?auto_254936 ?auto_254940 ) ) ( not ( = ?auto_254936 ?auto_254941 ) ) ( not ( = ?auto_254937 ?auto_254938 ) ) ( not ( = ?auto_254937 ?auto_254939 ) ) ( not ( = ?auto_254937 ?auto_254940 ) ) ( not ( = ?auto_254937 ?auto_254941 ) ) ( not ( = ?auto_254938 ?auto_254939 ) ) ( not ( = ?auto_254938 ?auto_254940 ) ) ( not ( = ?auto_254938 ?auto_254941 ) ) ( not ( = ?auto_254939 ?auto_254940 ) ) ( not ( = ?auto_254939 ?auto_254941 ) ) ( not ( = ?auto_254940 ?auto_254941 ) ) ( ON ?auto_254939 ?auto_254940 ) ( ON ?auto_254938 ?auto_254939 ) ( ON ?auto_254937 ?auto_254938 ) ( ON ?auto_254936 ?auto_254937 ) ( ON ?auto_254935 ?auto_254936 ) ( CLEAR ?auto_254933 ) ( ON ?auto_254934 ?auto_254935 ) ( CLEAR ?auto_254934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_254933 ?auto_254934 )
      ( MAKE-8PILE ?auto_254933 ?auto_254934 ?auto_254935 ?auto_254936 ?auto_254937 ?auto_254938 ?auto_254939 ?auto_254940 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_254950 - BLOCK
      ?auto_254951 - BLOCK
      ?auto_254952 - BLOCK
      ?auto_254953 - BLOCK
      ?auto_254954 - BLOCK
      ?auto_254955 - BLOCK
      ?auto_254956 - BLOCK
      ?auto_254957 - BLOCK
    )
    :vars
    (
      ?auto_254958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254957 ?auto_254958 ) ( not ( = ?auto_254950 ?auto_254951 ) ) ( not ( = ?auto_254950 ?auto_254952 ) ) ( not ( = ?auto_254950 ?auto_254953 ) ) ( not ( = ?auto_254950 ?auto_254954 ) ) ( not ( = ?auto_254950 ?auto_254955 ) ) ( not ( = ?auto_254950 ?auto_254956 ) ) ( not ( = ?auto_254950 ?auto_254957 ) ) ( not ( = ?auto_254950 ?auto_254958 ) ) ( not ( = ?auto_254951 ?auto_254952 ) ) ( not ( = ?auto_254951 ?auto_254953 ) ) ( not ( = ?auto_254951 ?auto_254954 ) ) ( not ( = ?auto_254951 ?auto_254955 ) ) ( not ( = ?auto_254951 ?auto_254956 ) ) ( not ( = ?auto_254951 ?auto_254957 ) ) ( not ( = ?auto_254951 ?auto_254958 ) ) ( not ( = ?auto_254952 ?auto_254953 ) ) ( not ( = ?auto_254952 ?auto_254954 ) ) ( not ( = ?auto_254952 ?auto_254955 ) ) ( not ( = ?auto_254952 ?auto_254956 ) ) ( not ( = ?auto_254952 ?auto_254957 ) ) ( not ( = ?auto_254952 ?auto_254958 ) ) ( not ( = ?auto_254953 ?auto_254954 ) ) ( not ( = ?auto_254953 ?auto_254955 ) ) ( not ( = ?auto_254953 ?auto_254956 ) ) ( not ( = ?auto_254953 ?auto_254957 ) ) ( not ( = ?auto_254953 ?auto_254958 ) ) ( not ( = ?auto_254954 ?auto_254955 ) ) ( not ( = ?auto_254954 ?auto_254956 ) ) ( not ( = ?auto_254954 ?auto_254957 ) ) ( not ( = ?auto_254954 ?auto_254958 ) ) ( not ( = ?auto_254955 ?auto_254956 ) ) ( not ( = ?auto_254955 ?auto_254957 ) ) ( not ( = ?auto_254955 ?auto_254958 ) ) ( not ( = ?auto_254956 ?auto_254957 ) ) ( not ( = ?auto_254956 ?auto_254958 ) ) ( not ( = ?auto_254957 ?auto_254958 ) ) ( ON ?auto_254956 ?auto_254957 ) ( ON ?auto_254955 ?auto_254956 ) ( ON ?auto_254954 ?auto_254955 ) ( ON ?auto_254953 ?auto_254954 ) ( ON ?auto_254952 ?auto_254953 ) ( ON ?auto_254951 ?auto_254952 ) ( ON ?auto_254950 ?auto_254951 ) ( CLEAR ?auto_254950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_254950 )
      ( MAKE-8PILE ?auto_254950 ?auto_254951 ?auto_254952 ?auto_254953 ?auto_254954 ?auto_254955 ?auto_254956 ?auto_254957 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_254967 - BLOCK
      ?auto_254968 - BLOCK
      ?auto_254969 - BLOCK
      ?auto_254970 - BLOCK
      ?auto_254971 - BLOCK
      ?auto_254972 - BLOCK
      ?auto_254973 - BLOCK
      ?auto_254974 - BLOCK
    )
    :vars
    (
      ?auto_254975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254974 ?auto_254975 ) ( not ( = ?auto_254967 ?auto_254968 ) ) ( not ( = ?auto_254967 ?auto_254969 ) ) ( not ( = ?auto_254967 ?auto_254970 ) ) ( not ( = ?auto_254967 ?auto_254971 ) ) ( not ( = ?auto_254967 ?auto_254972 ) ) ( not ( = ?auto_254967 ?auto_254973 ) ) ( not ( = ?auto_254967 ?auto_254974 ) ) ( not ( = ?auto_254967 ?auto_254975 ) ) ( not ( = ?auto_254968 ?auto_254969 ) ) ( not ( = ?auto_254968 ?auto_254970 ) ) ( not ( = ?auto_254968 ?auto_254971 ) ) ( not ( = ?auto_254968 ?auto_254972 ) ) ( not ( = ?auto_254968 ?auto_254973 ) ) ( not ( = ?auto_254968 ?auto_254974 ) ) ( not ( = ?auto_254968 ?auto_254975 ) ) ( not ( = ?auto_254969 ?auto_254970 ) ) ( not ( = ?auto_254969 ?auto_254971 ) ) ( not ( = ?auto_254969 ?auto_254972 ) ) ( not ( = ?auto_254969 ?auto_254973 ) ) ( not ( = ?auto_254969 ?auto_254974 ) ) ( not ( = ?auto_254969 ?auto_254975 ) ) ( not ( = ?auto_254970 ?auto_254971 ) ) ( not ( = ?auto_254970 ?auto_254972 ) ) ( not ( = ?auto_254970 ?auto_254973 ) ) ( not ( = ?auto_254970 ?auto_254974 ) ) ( not ( = ?auto_254970 ?auto_254975 ) ) ( not ( = ?auto_254971 ?auto_254972 ) ) ( not ( = ?auto_254971 ?auto_254973 ) ) ( not ( = ?auto_254971 ?auto_254974 ) ) ( not ( = ?auto_254971 ?auto_254975 ) ) ( not ( = ?auto_254972 ?auto_254973 ) ) ( not ( = ?auto_254972 ?auto_254974 ) ) ( not ( = ?auto_254972 ?auto_254975 ) ) ( not ( = ?auto_254973 ?auto_254974 ) ) ( not ( = ?auto_254973 ?auto_254975 ) ) ( not ( = ?auto_254974 ?auto_254975 ) ) ( ON ?auto_254973 ?auto_254974 ) ( ON ?auto_254972 ?auto_254973 ) ( ON ?auto_254971 ?auto_254972 ) ( ON ?auto_254970 ?auto_254971 ) ( ON ?auto_254969 ?auto_254970 ) ( ON ?auto_254968 ?auto_254969 ) ( ON ?auto_254967 ?auto_254968 ) ( CLEAR ?auto_254967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_254967 )
      ( MAKE-8PILE ?auto_254967 ?auto_254968 ?auto_254969 ?auto_254970 ?auto_254971 ?auto_254972 ?auto_254973 ?auto_254974 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_254985 - BLOCK
      ?auto_254986 - BLOCK
      ?auto_254987 - BLOCK
      ?auto_254988 - BLOCK
      ?auto_254989 - BLOCK
      ?auto_254990 - BLOCK
      ?auto_254991 - BLOCK
      ?auto_254992 - BLOCK
      ?auto_254993 - BLOCK
    )
    :vars
    (
      ?auto_254994 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_254992 ) ( ON ?auto_254993 ?auto_254994 ) ( CLEAR ?auto_254993 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_254985 ) ( ON ?auto_254986 ?auto_254985 ) ( ON ?auto_254987 ?auto_254986 ) ( ON ?auto_254988 ?auto_254987 ) ( ON ?auto_254989 ?auto_254988 ) ( ON ?auto_254990 ?auto_254989 ) ( ON ?auto_254991 ?auto_254990 ) ( ON ?auto_254992 ?auto_254991 ) ( not ( = ?auto_254985 ?auto_254986 ) ) ( not ( = ?auto_254985 ?auto_254987 ) ) ( not ( = ?auto_254985 ?auto_254988 ) ) ( not ( = ?auto_254985 ?auto_254989 ) ) ( not ( = ?auto_254985 ?auto_254990 ) ) ( not ( = ?auto_254985 ?auto_254991 ) ) ( not ( = ?auto_254985 ?auto_254992 ) ) ( not ( = ?auto_254985 ?auto_254993 ) ) ( not ( = ?auto_254985 ?auto_254994 ) ) ( not ( = ?auto_254986 ?auto_254987 ) ) ( not ( = ?auto_254986 ?auto_254988 ) ) ( not ( = ?auto_254986 ?auto_254989 ) ) ( not ( = ?auto_254986 ?auto_254990 ) ) ( not ( = ?auto_254986 ?auto_254991 ) ) ( not ( = ?auto_254986 ?auto_254992 ) ) ( not ( = ?auto_254986 ?auto_254993 ) ) ( not ( = ?auto_254986 ?auto_254994 ) ) ( not ( = ?auto_254987 ?auto_254988 ) ) ( not ( = ?auto_254987 ?auto_254989 ) ) ( not ( = ?auto_254987 ?auto_254990 ) ) ( not ( = ?auto_254987 ?auto_254991 ) ) ( not ( = ?auto_254987 ?auto_254992 ) ) ( not ( = ?auto_254987 ?auto_254993 ) ) ( not ( = ?auto_254987 ?auto_254994 ) ) ( not ( = ?auto_254988 ?auto_254989 ) ) ( not ( = ?auto_254988 ?auto_254990 ) ) ( not ( = ?auto_254988 ?auto_254991 ) ) ( not ( = ?auto_254988 ?auto_254992 ) ) ( not ( = ?auto_254988 ?auto_254993 ) ) ( not ( = ?auto_254988 ?auto_254994 ) ) ( not ( = ?auto_254989 ?auto_254990 ) ) ( not ( = ?auto_254989 ?auto_254991 ) ) ( not ( = ?auto_254989 ?auto_254992 ) ) ( not ( = ?auto_254989 ?auto_254993 ) ) ( not ( = ?auto_254989 ?auto_254994 ) ) ( not ( = ?auto_254990 ?auto_254991 ) ) ( not ( = ?auto_254990 ?auto_254992 ) ) ( not ( = ?auto_254990 ?auto_254993 ) ) ( not ( = ?auto_254990 ?auto_254994 ) ) ( not ( = ?auto_254991 ?auto_254992 ) ) ( not ( = ?auto_254991 ?auto_254993 ) ) ( not ( = ?auto_254991 ?auto_254994 ) ) ( not ( = ?auto_254992 ?auto_254993 ) ) ( not ( = ?auto_254992 ?auto_254994 ) ) ( not ( = ?auto_254993 ?auto_254994 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_254993 ?auto_254994 )
      ( !STACK ?auto_254993 ?auto_254992 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_255004 - BLOCK
      ?auto_255005 - BLOCK
      ?auto_255006 - BLOCK
      ?auto_255007 - BLOCK
      ?auto_255008 - BLOCK
      ?auto_255009 - BLOCK
      ?auto_255010 - BLOCK
      ?auto_255011 - BLOCK
      ?auto_255012 - BLOCK
    )
    :vars
    (
      ?auto_255013 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_255011 ) ( ON ?auto_255012 ?auto_255013 ) ( CLEAR ?auto_255012 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_255004 ) ( ON ?auto_255005 ?auto_255004 ) ( ON ?auto_255006 ?auto_255005 ) ( ON ?auto_255007 ?auto_255006 ) ( ON ?auto_255008 ?auto_255007 ) ( ON ?auto_255009 ?auto_255008 ) ( ON ?auto_255010 ?auto_255009 ) ( ON ?auto_255011 ?auto_255010 ) ( not ( = ?auto_255004 ?auto_255005 ) ) ( not ( = ?auto_255004 ?auto_255006 ) ) ( not ( = ?auto_255004 ?auto_255007 ) ) ( not ( = ?auto_255004 ?auto_255008 ) ) ( not ( = ?auto_255004 ?auto_255009 ) ) ( not ( = ?auto_255004 ?auto_255010 ) ) ( not ( = ?auto_255004 ?auto_255011 ) ) ( not ( = ?auto_255004 ?auto_255012 ) ) ( not ( = ?auto_255004 ?auto_255013 ) ) ( not ( = ?auto_255005 ?auto_255006 ) ) ( not ( = ?auto_255005 ?auto_255007 ) ) ( not ( = ?auto_255005 ?auto_255008 ) ) ( not ( = ?auto_255005 ?auto_255009 ) ) ( not ( = ?auto_255005 ?auto_255010 ) ) ( not ( = ?auto_255005 ?auto_255011 ) ) ( not ( = ?auto_255005 ?auto_255012 ) ) ( not ( = ?auto_255005 ?auto_255013 ) ) ( not ( = ?auto_255006 ?auto_255007 ) ) ( not ( = ?auto_255006 ?auto_255008 ) ) ( not ( = ?auto_255006 ?auto_255009 ) ) ( not ( = ?auto_255006 ?auto_255010 ) ) ( not ( = ?auto_255006 ?auto_255011 ) ) ( not ( = ?auto_255006 ?auto_255012 ) ) ( not ( = ?auto_255006 ?auto_255013 ) ) ( not ( = ?auto_255007 ?auto_255008 ) ) ( not ( = ?auto_255007 ?auto_255009 ) ) ( not ( = ?auto_255007 ?auto_255010 ) ) ( not ( = ?auto_255007 ?auto_255011 ) ) ( not ( = ?auto_255007 ?auto_255012 ) ) ( not ( = ?auto_255007 ?auto_255013 ) ) ( not ( = ?auto_255008 ?auto_255009 ) ) ( not ( = ?auto_255008 ?auto_255010 ) ) ( not ( = ?auto_255008 ?auto_255011 ) ) ( not ( = ?auto_255008 ?auto_255012 ) ) ( not ( = ?auto_255008 ?auto_255013 ) ) ( not ( = ?auto_255009 ?auto_255010 ) ) ( not ( = ?auto_255009 ?auto_255011 ) ) ( not ( = ?auto_255009 ?auto_255012 ) ) ( not ( = ?auto_255009 ?auto_255013 ) ) ( not ( = ?auto_255010 ?auto_255011 ) ) ( not ( = ?auto_255010 ?auto_255012 ) ) ( not ( = ?auto_255010 ?auto_255013 ) ) ( not ( = ?auto_255011 ?auto_255012 ) ) ( not ( = ?auto_255011 ?auto_255013 ) ) ( not ( = ?auto_255012 ?auto_255013 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_255012 ?auto_255013 )
      ( !STACK ?auto_255012 ?auto_255011 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_255023 - BLOCK
      ?auto_255024 - BLOCK
      ?auto_255025 - BLOCK
      ?auto_255026 - BLOCK
      ?auto_255027 - BLOCK
      ?auto_255028 - BLOCK
      ?auto_255029 - BLOCK
      ?auto_255030 - BLOCK
      ?auto_255031 - BLOCK
    )
    :vars
    (
      ?auto_255032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255031 ?auto_255032 ) ( ON-TABLE ?auto_255023 ) ( ON ?auto_255024 ?auto_255023 ) ( ON ?auto_255025 ?auto_255024 ) ( ON ?auto_255026 ?auto_255025 ) ( ON ?auto_255027 ?auto_255026 ) ( ON ?auto_255028 ?auto_255027 ) ( ON ?auto_255029 ?auto_255028 ) ( not ( = ?auto_255023 ?auto_255024 ) ) ( not ( = ?auto_255023 ?auto_255025 ) ) ( not ( = ?auto_255023 ?auto_255026 ) ) ( not ( = ?auto_255023 ?auto_255027 ) ) ( not ( = ?auto_255023 ?auto_255028 ) ) ( not ( = ?auto_255023 ?auto_255029 ) ) ( not ( = ?auto_255023 ?auto_255030 ) ) ( not ( = ?auto_255023 ?auto_255031 ) ) ( not ( = ?auto_255023 ?auto_255032 ) ) ( not ( = ?auto_255024 ?auto_255025 ) ) ( not ( = ?auto_255024 ?auto_255026 ) ) ( not ( = ?auto_255024 ?auto_255027 ) ) ( not ( = ?auto_255024 ?auto_255028 ) ) ( not ( = ?auto_255024 ?auto_255029 ) ) ( not ( = ?auto_255024 ?auto_255030 ) ) ( not ( = ?auto_255024 ?auto_255031 ) ) ( not ( = ?auto_255024 ?auto_255032 ) ) ( not ( = ?auto_255025 ?auto_255026 ) ) ( not ( = ?auto_255025 ?auto_255027 ) ) ( not ( = ?auto_255025 ?auto_255028 ) ) ( not ( = ?auto_255025 ?auto_255029 ) ) ( not ( = ?auto_255025 ?auto_255030 ) ) ( not ( = ?auto_255025 ?auto_255031 ) ) ( not ( = ?auto_255025 ?auto_255032 ) ) ( not ( = ?auto_255026 ?auto_255027 ) ) ( not ( = ?auto_255026 ?auto_255028 ) ) ( not ( = ?auto_255026 ?auto_255029 ) ) ( not ( = ?auto_255026 ?auto_255030 ) ) ( not ( = ?auto_255026 ?auto_255031 ) ) ( not ( = ?auto_255026 ?auto_255032 ) ) ( not ( = ?auto_255027 ?auto_255028 ) ) ( not ( = ?auto_255027 ?auto_255029 ) ) ( not ( = ?auto_255027 ?auto_255030 ) ) ( not ( = ?auto_255027 ?auto_255031 ) ) ( not ( = ?auto_255027 ?auto_255032 ) ) ( not ( = ?auto_255028 ?auto_255029 ) ) ( not ( = ?auto_255028 ?auto_255030 ) ) ( not ( = ?auto_255028 ?auto_255031 ) ) ( not ( = ?auto_255028 ?auto_255032 ) ) ( not ( = ?auto_255029 ?auto_255030 ) ) ( not ( = ?auto_255029 ?auto_255031 ) ) ( not ( = ?auto_255029 ?auto_255032 ) ) ( not ( = ?auto_255030 ?auto_255031 ) ) ( not ( = ?auto_255030 ?auto_255032 ) ) ( not ( = ?auto_255031 ?auto_255032 ) ) ( CLEAR ?auto_255029 ) ( ON ?auto_255030 ?auto_255031 ) ( CLEAR ?auto_255030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_255023 ?auto_255024 ?auto_255025 ?auto_255026 ?auto_255027 ?auto_255028 ?auto_255029 ?auto_255030 )
      ( MAKE-9PILE ?auto_255023 ?auto_255024 ?auto_255025 ?auto_255026 ?auto_255027 ?auto_255028 ?auto_255029 ?auto_255030 ?auto_255031 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_255042 - BLOCK
      ?auto_255043 - BLOCK
      ?auto_255044 - BLOCK
      ?auto_255045 - BLOCK
      ?auto_255046 - BLOCK
      ?auto_255047 - BLOCK
      ?auto_255048 - BLOCK
      ?auto_255049 - BLOCK
      ?auto_255050 - BLOCK
    )
    :vars
    (
      ?auto_255051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255050 ?auto_255051 ) ( ON-TABLE ?auto_255042 ) ( ON ?auto_255043 ?auto_255042 ) ( ON ?auto_255044 ?auto_255043 ) ( ON ?auto_255045 ?auto_255044 ) ( ON ?auto_255046 ?auto_255045 ) ( ON ?auto_255047 ?auto_255046 ) ( ON ?auto_255048 ?auto_255047 ) ( not ( = ?auto_255042 ?auto_255043 ) ) ( not ( = ?auto_255042 ?auto_255044 ) ) ( not ( = ?auto_255042 ?auto_255045 ) ) ( not ( = ?auto_255042 ?auto_255046 ) ) ( not ( = ?auto_255042 ?auto_255047 ) ) ( not ( = ?auto_255042 ?auto_255048 ) ) ( not ( = ?auto_255042 ?auto_255049 ) ) ( not ( = ?auto_255042 ?auto_255050 ) ) ( not ( = ?auto_255042 ?auto_255051 ) ) ( not ( = ?auto_255043 ?auto_255044 ) ) ( not ( = ?auto_255043 ?auto_255045 ) ) ( not ( = ?auto_255043 ?auto_255046 ) ) ( not ( = ?auto_255043 ?auto_255047 ) ) ( not ( = ?auto_255043 ?auto_255048 ) ) ( not ( = ?auto_255043 ?auto_255049 ) ) ( not ( = ?auto_255043 ?auto_255050 ) ) ( not ( = ?auto_255043 ?auto_255051 ) ) ( not ( = ?auto_255044 ?auto_255045 ) ) ( not ( = ?auto_255044 ?auto_255046 ) ) ( not ( = ?auto_255044 ?auto_255047 ) ) ( not ( = ?auto_255044 ?auto_255048 ) ) ( not ( = ?auto_255044 ?auto_255049 ) ) ( not ( = ?auto_255044 ?auto_255050 ) ) ( not ( = ?auto_255044 ?auto_255051 ) ) ( not ( = ?auto_255045 ?auto_255046 ) ) ( not ( = ?auto_255045 ?auto_255047 ) ) ( not ( = ?auto_255045 ?auto_255048 ) ) ( not ( = ?auto_255045 ?auto_255049 ) ) ( not ( = ?auto_255045 ?auto_255050 ) ) ( not ( = ?auto_255045 ?auto_255051 ) ) ( not ( = ?auto_255046 ?auto_255047 ) ) ( not ( = ?auto_255046 ?auto_255048 ) ) ( not ( = ?auto_255046 ?auto_255049 ) ) ( not ( = ?auto_255046 ?auto_255050 ) ) ( not ( = ?auto_255046 ?auto_255051 ) ) ( not ( = ?auto_255047 ?auto_255048 ) ) ( not ( = ?auto_255047 ?auto_255049 ) ) ( not ( = ?auto_255047 ?auto_255050 ) ) ( not ( = ?auto_255047 ?auto_255051 ) ) ( not ( = ?auto_255048 ?auto_255049 ) ) ( not ( = ?auto_255048 ?auto_255050 ) ) ( not ( = ?auto_255048 ?auto_255051 ) ) ( not ( = ?auto_255049 ?auto_255050 ) ) ( not ( = ?auto_255049 ?auto_255051 ) ) ( not ( = ?auto_255050 ?auto_255051 ) ) ( CLEAR ?auto_255048 ) ( ON ?auto_255049 ?auto_255050 ) ( CLEAR ?auto_255049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_255042 ?auto_255043 ?auto_255044 ?auto_255045 ?auto_255046 ?auto_255047 ?auto_255048 ?auto_255049 )
      ( MAKE-9PILE ?auto_255042 ?auto_255043 ?auto_255044 ?auto_255045 ?auto_255046 ?auto_255047 ?auto_255048 ?auto_255049 ?auto_255050 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_255061 - BLOCK
      ?auto_255062 - BLOCK
      ?auto_255063 - BLOCK
      ?auto_255064 - BLOCK
      ?auto_255065 - BLOCK
      ?auto_255066 - BLOCK
      ?auto_255067 - BLOCK
      ?auto_255068 - BLOCK
      ?auto_255069 - BLOCK
    )
    :vars
    (
      ?auto_255070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255069 ?auto_255070 ) ( ON-TABLE ?auto_255061 ) ( ON ?auto_255062 ?auto_255061 ) ( ON ?auto_255063 ?auto_255062 ) ( ON ?auto_255064 ?auto_255063 ) ( ON ?auto_255065 ?auto_255064 ) ( ON ?auto_255066 ?auto_255065 ) ( not ( = ?auto_255061 ?auto_255062 ) ) ( not ( = ?auto_255061 ?auto_255063 ) ) ( not ( = ?auto_255061 ?auto_255064 ) ) ( not ( = ?auto_255061 ?auto_255065 ) ) ( not ( = ?auto_255061 ?auto_255066 ) ) ( not ( = ?auto_255061 ?auto_255067 ) ) ( not ( = ?auto_255061 ?auto_255068 ) ) ( not ( = ?auto_255061 ?auto_255069 ) ) ( not ( = ?auto_255061 ?auto_255070 ) ) ( not ( = ?auto_255062 ?auto_255063 ) ) ( not ( = ?auto_255062 ?auto_255064 ) ) ( not ( = ?auto_255062 ?auto_255065 ) ) ( not ( = ?auto_255062 ?auto_255066 ) ) ( not ( = ?auto_255062 ?auto_255067 ) ) ( not ( = ?auto_255062 ?auto_255068 ) ) ( not ( = ?auto_255062 ?auto_255069 ) ) ( not ( = ?auto_255062 ?auto_255070 ) ) ( not ( = ?auto_255063 ?auto_255064 ) ) ( not ( = ?auto_255063 ?auto_255065 ) ) ( not ( = ?auto_255063 ?auto_255066 ) ) ( not ( = ?auto_255063 ?auto_255067 ) ) ( not ( = ?auto_255063 ?auto_255068 ) ) ( not ( = ?auto_255063 ?auto_255069 ) ) ( not ( = ?auto_255063 ?auto_255070 ) ) ( not ( = ?auto_255064 ?auto_255065 ) ) ( not ( = ?auto_255064 ?auto_255066 ) ) ( not ( = ?auto_255064 ?auto_255067 ) ) ( not ( = ?auto_255064 ?auto_255068 ) ) ( not ( = ?auto_255064 ?auto_255069 ) ) ( not ( = ?auto_255064 ?auto_255070 ) ) ( not ( = ?auto_255065 ?auto_255066 ) ) ( not ( = ?auto_255065 ?auto_255067 ) ) ( not ( = ?auto_255065 ?auto_255068 ) ) ( not ( = ?auto_255065 ?auto_255069 ) ) ( not ( = ?auto_255065 ?auto_255070 ) ) ( not ( = ?auto_255066 ?auto_255067 ) ) ( not ( = ?auto_255066 ?auto_255068 ) ) ( not ( = ?auto_255066 ?auto_255069 ) ) ( not ( = ?auto_255066 ?auto_255070 ) ) ( not ( = ?auto_255067 ?auto_255068 ) ) ( not ( = ?auto_255067 ?auto_255069 ) ) ( not ( = ?auto_255067 ?auto_255070 ) ) ( not ( = ?auto_255068 ?auto_255069 ) ) ( not ( = ?auto_255068 ?auto_255070 ) ) ( not ( = ?auto_255069 ?auto_255070 ) ) ( ON ?auto_255068 ?auto_255069 ) ( CLEAR ?auto_255066 ) ( ON ?auto_255067 ?auto_255068 ) ( CLEAR ?auto_255067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_255061 ?auto_255062 ?auto_255063 ?auto_255064 ?auto_255065 ?auto_255066 ?auto_255067 )
      ( MAKE-9PILE ?auto_255061 ?auto_255062 ?auto_255063 ?auto_255064 ?auto_255065 ?auto_255066 ?auto_255067 ?auto_255068 ?auto_255069 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_255080 - BLOCK
      ?auto_255081 - BLOCK
      ?auto_255082 - BLOCK
      ?auto_255083 - BLOCK
      ?auto_255084 - BLOCK
      ?auto_255085 - BLOCK
      ?auto_255086 - BLOCK
      ?auto_255087 - BLOCK
      ?auto_255088 - BLOCK
    )
    :vars
    (
      ?auto_255089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255088 ?auto_255089 ) ( ON-TABLE ?auto_255080 ) ( ON ?auto_255081 ?auto_255080 ) ( ON ?auto_255082 ?auto_255081 ) ( ON ?auto_255083 ?auto_255082 ) ( ON ?auto_255084 ?auto_255083 ) ( ON ?auto_255085 ?auto_255084 ) ( not ( = ?auto_255080 ?auto_255081 ) ) ( not ( = ?auto_255080 ?auto_255082 ) ) ( not ( = ?auto_255080 ?auto_255083 ) ) ( not ( = ?auto_255080 ?auto_255084 ) ) ( not ( = ?auto_255080 ?auto_255085 ) ) ( not ( = ?auto_255080 ?auto_255086 ) ) ( not ( = ?auto_255080 ?auto_255087 ) ) ( not ( = ?auto_255080 ?auto_255088 ) ) ( not ( = ?auto_255080 ?auto_255089 ) ) ( not ( = ?auto_255081 ?auto_255082 ) ) ( not ( = ?auto_255081 ?auto_255083 ) ) ( not ( = ?auto_255081 ?auto_255084 ) ) ( not ( = ?auto_255081 ?auto_255085 ) ) ( not ( = ?auto_255081 ?auto_255086 ) ) ( not ( = ?auto_255081 ?auto_255087 ) ) ( not ( = ?auto_255081 ?auto_255088 ) ) ( not ( = ?auto_255081 ?auto_255089 ) ) ( not ( = ?auto_255082 ?auto_255083 ) ) ( not ( = ?auto_255082 ?auto_255084 ) ) ( not ( = ?auto_255082 ?auto_255085 ) ) ( not ( = ?auto_255082 ?auto_255086 ) ) ( not ( = ?auto_255082 ?auto_255087 ) ) ( not ( = ?auto_255082 ?auto_255088 ) ) ( not ( = ?auto_255082 ?auto_255089 ) ) ( not ( = ?auto_255083 ?auto_255084 ) ) ( not ( = ?auto_255083 ?auto_255085 ) ) ( not ( = ?auto_255083 ?auto_255086 ) ) ( not ( = ?auto_255083 ?auto_255087 ) ) ( not ( = ?auto_255083 ?auto_255088 ) ) ( not ( = ?auto_255083 ?auto_255089 ) ) ( not ( = ?auto_255084 ?auto_255085 ) ) ( not ( = ?auto_255084 ?auto_255086 ) ) ( not ( = ?auto_255084 ?auto_255087 ) ) ( not ( = ?auto_255084 ?auto_255088 ) ) ( not ( = ?auto_255084 ?auto_255089 ) ) ( not ( = ?auto_255085 ?auto_255086 ) ) ( not ( = ?auto_255085 ?auto_255087 ) ) ( not ( = ?auto_255085 ?auto_255088 ) ) ( not ( = ?auto_255085 ?auto_255089 ) ) ( not ( = ?auto_255086 ?auto_255087 ) ) ( not ( = ?auto_255086 ?auto_255088 ) ) ( not ( = ?auto_255086 ?auto_255089 ) ) ( not ( = ?auto_255087 ?auto_255088 ) ) ( not ( = ?auto_255087 ?auto_255089 ) ) ( not ( = ?auto_255088 ?auto_255089 ) ) ( ON ?auto_255087 ?auto_255088 ) ( CLEAR ?auto_255085 ) ( ON ?auto_255086 ?auto_255087 ) ( CLEAR ?auto_255086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_255080 ?auto_255081 ?auto_255082 ?auto_255083 ?auto_255084 ?auto_255085 ?auto_255086 )
      ( MAKE-9PILE ?auto_255080 ?auto_255081 ?auto_255082 ?auto_255083 ?auto_255084 ?auto_255085 ?auto_255086 ?auto_255087 ?auto_255088 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_255099 - BLOCK
      ?auto_255100 - BLOCK
      ?auto_255101 - BLOCK
      ?auto_255102 - BLOCK
      ?auto_255103 - BLOCK
      ?auto_255104 - BLOCK
      ?auto_255105 - BLOCK
      ?auto_255106 - BLOCK
      ?auto_255107 - BLOCK
    )
    :vars
    (
      ?auto_255108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255107 ?auto_255108 ) ( ON-TABLE ?auto_255099 ) ( ON ?auto_255100 ?auto_255099 ) ( ON ?auto_255101 ?auto_255100 ) ( ON ?auto_255102 ?auto_255101 ) ( ON ?auto_255103 ?auto_255102 ) ( not ( = ?auto_255099 ?auto_255100 ) ) ( not ( = ?auto_255099 ?auto_255101 ) ) ( not ( = ?auto_255099 ?auto_255102 ) ) ( not ( = ?auto_255099 ?auto_255103 ) ) ( not ( = ?auto_255099 ?auto_255104 ) ) ( not ( = ?auto_255099 ?auto_255105 ) ) ( not ( = ?auto_255099 ?auto_255106 ) ) ( not ( = ?auto_255099 ?auto_255107 ) ) ( not ( = ?auto_255099 ?auto_255108 ) ) ( not ( = ?auto_255100 ?auto_255101 ) ) ( not ( = ?auto_255100 ?auto_255102 ) ) ( not ( = ?auto_255100 ?auto_255103 ) ) ( not ( = ?auto_255100 ?auto_255104 ) ) ( not ( = ?auto_255100 ?auto_255105 ) ) ( not ( = ?auto_255100 ?auto_255106 ) ) ( not ( = ?auto_255100 ?auto_255107 ) ) ( not ( = ?auto_255100 ?auto_255108 ) ) ( not ( = ?auto_255101 ?auto_255102 ) ) ( not ( = ?auto_255101 ?auto_255103 ) ) ( not ( = ?auto_255101 ?auto_255104 ) ) ( not ( = ?auto_255101 ?auto_255105 ) ) ( not ( = ?auto_255101 ?auto_255106 ) ) ( not ( = ?auto_255101 ?auto_255107 ) ) ( not ( = ?auto_255101 ?auto_255108 ) ) ( not ( = ?auto_255102 ?auto_255103 ) ) ( not ( = ?auto_255102 ?auto_255104 ) ) ( not ( = ?auto_255102 ?auto_255105 ) ) ( not ( = ?auto_255102 ?auto_255106 ) ) ( not ( = ?auto_255102 ?auto_255107 ) ) ( not ( = ?auto_255102 ?auto_255108 ) ) ( not ( = ?auto_255103 ?auto_255104 ) ) ( not ( = ?auto_255103 ?auto_255105 ) ) ( not ( = ?auto_255103 ?auto_255106 ) ) ( not ( = ?auto_255103 ?auto_255107 ) ) ( not ( = ?auto_255103 ?auto_255108 ) ) ( not ( = ?auto_255104 ?auto_255105 ) ) ( not ( = ?auto_255104 ?auto_255106 ) ) ( not ( = ?auto_255104 ?auto_255107 ) ) ( not ( = ?auto_255104 ?auto_255108 ) ) ( not ( = ?auto_255105 ?auto_255106 ) ) ( not ( = ?auto_255105 ?auto_255107 ) ) ( not ( = ?auto_255105 ?auto_255108 ) ) ( not ( = ?auto_255106 ?auto_255107 ) ) ( not ( = ?auto_255106 ?auto_255108 ) ) ( not ( = ?auto_255107 ?auto_255108 ) ) ( ON ?auto_255106 ?auto_255107 ) ( ON ?auto_255105 ?auto_255106 ) ( CLEAR ?auto_255103 ) ( ON ?auto_255104 ?auto_255105 ) ( CLEAR ?auto_255104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_255099 ?auto_255100 ?auto_255101 ?auto_255102 ?auto_255103 ?auto_255104 )
      ( MAKE-9PILE ?auto_255099 ?auto_255100 ?auto_255101 ?auto_255102 ?auto_255103 ?auto_255104 ?auto_255105 ?auto_255106 ?auto_255107 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_255118 - BLOCK
      ?auto_255119 - BLOCK
      ?auto_255120 - BLOCK
      ?auto_255121 - BLOCK
      ?auto_255122 - BLOCK
      ?auto_255123 - BLOCK
      ?auto_255124 - BLOCK
      ?auto_255125 - BLOCK
      ?auto_255126 - BLOCK
    )
    :vars
    (
      ?auto_255127 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255126 ?auto_255127 ) ( ON-TABLE ?auto_255118 ) ( ON ?auto_255119 ?auto_255118 ) ( ON ?auto_255120 ?auto_255119 ) ( ON ?auto_255121 ?auto_255120 ) ( ON ?auto_255122 ?auto_255121 ) ( not ( = ?auto_255118 ?auto_255119 ) ) ( not ( = ?auto_255118 ?auto_255120 ) ) ( not ( = ?auto_255118 ?auto_255121 ) ) ( not ( = ?auto_255118 ?auto_255122 ) ) ( not ( = ?auto_255118 ?auto_255123 ) ) ( not ( = ?auto_255118 ?auto_255124 ) ) ( not ( = ?auto_255118 ?auto_255125 ) ) ( not ( = ?auto_255118 ?auto_255126 ) ) ( not ( = ?auto_255118 ?auto_255127 ) ) ( not ( = ?auto_255119 ?auto_255120 ) ) ( not ( = ?auto_255119 ?auto_255121 ) ) ( not ( = ?auto_255119 ?auto_255122 ) ) ( not ( = ?auto_255119 ?auto_255123 ) ) ( not ( = ?auto_255119 ?auto_255124 ) ) ( not ( = ?auto_255119 ?auto_255125 ) ) ( not ( = ?auto_255119 ?auto_255126 ) ) ( not ( = ?auto_255119 ?auto_255127 ) ) ( not ( = ?auto_255120 ?auto_255121 ) ) ( not ( = ?auto_255120 ?auto_255122 ) ) ( not ( = ?auto_255120 ?auto_255123 ) ) ( not ( = ?auto_255120 ?auto_255124 ) ) ( not ( = ?auto_255120 ?auto_255125 ) ) ( not ( = ?auto_255120 ?auto_255126 ) ) ( not ( = ?auto_255120 ?auto_255127 ) ) ( not ( = ?auto_255121 ?auto_255122 ) ) ( not ( = ?auto_255121 ?auto_255123 ) ) ( not ( = ?auto_255121 ?auto_255124 ) ) ( not ( = ?auto_255121 ?auto_255125 ) ) ( not ( = ?auto_255121 ?auto_255126 ) ) ( not ( = ?auto_255121 ?auto_255127 ) ) ( not ( = ?auto_255122 ?auto_255123 ) ) ( not ( = ?auto_255122 ?auto_255124 ) ) ( not ( = ?auto_255122 ?auto_255125 ) ) ( not ( = ?auto_255122 ?auto_255126 ) ) ( not ( = ?auto_255122 ?auto_255127 ) ) ( not ( = ?auto_255123 ?auto_255124 ) ) ( not ( = ?auto_255123 ?auto_255125 ) ) ( not ( = ?auto_255123 ?auto_255126 ) ) ( not ( = ?auto_255123 ?auto_255127 ) ) ( not ( = ?auto_255124 ?auto_255125 ) ) ( not ( = ?auto_255124 ?auto_255126 ) ) ( not ( = ?auto_255124 ?auto_255127 ) ) ( not ( = ?auto_255125 ?auto_255126 ) ) ( not ( = ?auto_255125 ?auto_255127 ) ) ( not ( = ?auto_255126 ?auto_255127 ) ) ( ON ?auto_255125 ?auto_255126 ) ( ON ?auto_255124 ?auto_255125 ) ( CLEAR ?auto_255122 ) ( ON ?auto_255123 ?auto_255124 ) ( CLEAR ?auto_255123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_255118 ?auto_255119 ?auto_255120 ?auto_255121 ?auto_255122 ?auto_255123 )
      ( MAKE-9PILE ?auto_255118 ?auto_255119 ?auto_255120 ?auto_255121 ?auto_255122 ?auto_255123 ?auto_255124 ?auto_255125 ?auto_255126 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_255137 - BLOCK
      ?auto_255138 - BLOCK
      ?auto_255139 - BLOCK
      ?auto_255140 - BLOCK
      ?auto_255141 - BLOCK
      ?auto_255142 - BLOCK
      ?auto_255143 - BLOCK
      ?auto_255144 - BLOCK
      ?auto_255145 - BLOCK
    )
    :vars
    (
      ?auto_255146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255145 ?auto_255146 ) ( ON-TABLE ?auto_255137 ) ( ON ?auto_255138 ?auto_255137 ) ( ON ?auto_255139 ?auto_255138 ) ( ON ?auto_255140 ?auto_255139 ) ( not ( = ?auto_255137 ?auto_255138 ) ) ( not ( = ?auto_255137 ?auto_255139 ) ) ( not ( = ?auto_255137 ?auto_255140 ) ) ( not ( = ?auto_255137 ?auto_255141 ) ) ( not ( = ?auto_255137 ?auto_255142 ) ) ( not ( = ?auto_255137 ?auto_255143 ) ) ( not ( = ?auto_255137 ?auto_255144 ) ) ( not ( = ?auto_255137 ?auto_255145 ) ) ( not ( = ?auto_255137 ?auto_255146 ) ) ( not ( = ?auto_255138 ?auto_255139 ) ) ( not ( = ?auto_255138 ?auto_255140 ) ) ( not ( = ?auto_255138 ?auto_255141 ) ) ( not ( = ?auto_255138 ?auto_255142 ) ) ( not ( = ?auto_255138 ?auto_255143 ) ) ( not ( = ?auto_255138 ?auto_255144 ) ) ( not ( = ?auto_255138 ?auto_255145 ) ) ( not ( = ?auto_255138 ?auto_255146 ) ) ( not ( = ?auto_255139 ?auto_255140 ) ) ( not ( = ?auto_255139 ?auto_255141 ) ) ( not ( = ?auto_255139 ?auto_255142 ) ) ( not ( = ?auto_255139 ?auto_255143 ) ) ( not ( = ?auto_255139 ?auto_255144 ) ) ( not ( = ?auto_255139 ?auto_255145 ) ) ( not ( = ?auto_255139 ?auto_255146 ) ) ( not ( = ?auto_255140 ?auto_255141 ) ) ( not ( = ?auto_255140 ?auto_255142 ) ) ( not ( = ?auto_255140 ?auto_255143 ) ) ( not ( = ?auto_255140 ?auto_255144 ) ) ( not ( = ?auto_255140 ?auto_255145 ) ) ( not ( = ?auto_255140 ?auto_255146 ) ) ( not ( = ?auto_255141 ?auto_255142 ) ) ( not ( = ?auto_255141 ?auto_255143 ) ) ( not ( = ?auto_255141 ?auto_255144 ) ) ( not ( = ?auto_255141 ?auto_255145 ) ) ( not ( = ?auto_255141 ?auto_255146 ) ) ( not ( = ?auto_255142 ?auto_255143 ) ) ( not ( = ?auto_255142 ?auto_255144 ) ) ( not ( = ?auto_255142 ?auto_255145 ) ) ( not ( = ?auto_255142 ?auto_255146 ) ) ( not ( = ?auto_255143 ?auto_255144 ) ) ( not ( = ?auto_255143 ?auto_255145 ) ) ( not ( = ?auto_255143 ?auto_255146 ) ) ( not ( = ?auto_255144 ?auto_255145 ) ) ( not ( = ?auto_255144 ?auto_255146 ) ) ( not ( = ?auto_255145 ?auto_255146 ) ) ( ON ?auto_255144 ?auto_255145 ) ( ON ?auto_255143 ?auto_255144 ) ( ON ?auto_255142 ?auto_255143 ) ( CLEAR ?auto_255140 ) ( ON ?auto_255141 ?auto_255142 ) ( CLEAR ?auto_255141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_255137 ?auto_255138 ?auto_255139 ?auto_255140 ?auto_255141 )
      ( MAKE-9PILE ?auto_255137 ?auto_255138 ?auto_255139 ?auto_255140 ?auto_255141 ?auto_255142 ?auto_255143 ?auto_255144 ?auto_255145 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_255156 - BLOCK
      ?auto_255157 - BLOCK
      ?auto_255158 - BLOCK
      ?auto_255159 - BLOCK
      ?auto_255160 - BLOCK
      ?auto_255161 - BLOCK
      ?auto_255162 - BLOCK
      ?auto_255163 - BLOCK
      ?auto_255164 - BLOCK
    )
    :vars
    (
      ?auto_255165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255164 ?auto_255165 ) ( ON-TABLE ?auto_255156 ) ( ON ?auto_255157 ?auto_255156 ) ( ON ?auto_255158 ?auto_255157 ) ( ON ?auto_255159 ?auto_255158 ) ( not ( = ?auto_255156 ?auto_255157 ) ) ( not ( = ?auto_255156 ?auto_255158 ) ) ( not ( = ?auto_255156 ?auto_255159 ) ) ( not ( = ?auto_255156 ?auto_255160 ) ) ( not ( = ?auto_255156 ?auto_255161 ) ) ( not ( = ?auto_255156 ?auto_255162 ) ) ( not ( = ?auto_255156 ?auto_255163 ) ) ( not ( = ?auto_255156 ?auto_255164 ) ) ( not ( = ?auto_255156 ?auto_255165 ) ) ( not ( = ?auto_255157 ?auto_255158 ) ) ( not ( = ?auto_255157 ?auto_255159 ) ) ( not ( = ?auto_255157 ?auto_255160 ) ) ( not ( = ?auto_255157 ?auto_255161 ) ) ( not ( = ?auto_255157 ?auto_255162 ) ) ( not ( = ?auto_255157 ?auto_255163 ) ) ( not ( = ?auto_255157 ?auto_255164 ) ) ( not ( = ?auto_255157 ?auto_255165 ) ) ( not ( = ?auto_255158 ?auto_255159 ) ) ( not ( = ?auto_255158 ?auto_255160 ) ) ( not ( = ?auto_255158 ?auto_255161 ) ) ( not ( = ?auto_255158 ?auto_255162 ) ) ( not ( = ?auto_255158 ?auto_255163 ) ) ( not ( = ?auto_255158 ?auto_255164 ) ) ( not ( = ?auto_255158 ?auto_255165 ) ) ( not ( = ?auto_255159 ?auto_255160 ) ) ( not ( = ?auto_255159 ?auto_255161 ) ) ( not ( = ?auto_255159 ?auto_255162 ) ) ( not ( = ?auto_255159 ?auto_255163 ) ) ( not ( = ?auto_255159 ?auto_255164 ) ) ( not ( = ?auto_255159 ?auto_255165 ) ) ( not ( = ?auto_255160 ?auto_255161 ) ) ( not ( = ?auto_255160 ?auto_255162 ) ) ( not ( = ?auto_255160 ?auto_255163 ) ) ( not ( = ?auto_255160 ?auto_255164 ) ) ( not ( = ?auto_255160 ?auto_255165 ) ) ( not ( = ?auto_255161 ?auto_255162 ) ) ( not ( = ?auto_255161 ?auto_255163 ) ) ( not ( = ?auto_255161 ?auto_255164 ) ) ( not ( = ?auto_255161 ?auto_255165 ) ) ( not ( = ?auto_255162 ?auto_255163 ) ) ( not ( = ?auto_255162 ?auto_255164 ) ) ( not ( = ?auto_255162 ?auto_255165 ) ) ( not ( = ?auto_255163 ?auto_255164 ) ) ( not ( = ?auto_255163 ?auto_255165 ) ) ( not ( = ?auto_255164 ?auto_255165 ) ) ( ON ?auto_255163 ?auto_255164 ) ( ON ?auto_255162 ?auto_255163 ) ( ON ?auto_255161 ?auto_255162 ) ( CLEAR ?auto_255159 ) ( ON ?auto_255160 ?auto_255161 ) ( CLEAR ?auto_255160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_255156 ?auto_255157 ?auto_255158 ?auto_255159 ?auto_255160 )
      ( MAKE-9PILE ?auto_255156 ?auto_255157 ?auto_255158 ?auto_255159 ?auto_255160 ?auto_255161 ?auto_255162 ?auto_255163 ?auto_255164 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_255175 - BLOCK
      ?auto_255176 - BLOCK
      ?auto_255177 - BLOCK
      ?auto_255178 - BLOCK
      ?auto_255179 - BLOCK
      ?auto_255180 - BLOCK
      ?auto_255181 - BLOCK
      ?auto_255182 - BLOCK
      ?auto_255183 - BLOCK
    )
    :vars
    (
      ?auto_255184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255183 ?auto_255184 ) ( ON-TABLE ?auto_255175 ) ( ON ?auto_255176 ?auto_255175 ) ( ON ?auto_255177 ?auto_255176 ) ( not ( = ?auto_255175 ?auto_255176 ) ) ( not ( = ?auto_255175 ?auto_255177 ) ) ( not ( = ?auto_255175 ?auto_255178 ) ) ( not ( = ?auto_255175 ?auto_255179 ) ) ( not ( = ?auto_255175 ?auto_255180 ) ) ( not ( = ?auto_255175 ?auto_255181 ) ) ( not ( = ?auto_255175 ?auto_255182 ) ) ( not ( = ?auto_255175 ?auto_255183 ) ) ( not ( = ?auto_255175 ?auto_255184 ) ) ( not ( = ?auto_255176 ?auto_255177 ) ) ( not ( = ?auto_255176 ?auto_255178 ) ) ( not ( = ?auto_255176 ?auto_255179 ) ) ( not ( = ?auto_255176 ?auto_255180 ) ) ( not ( = ?auto_255176 ?auto_255181 ) ) ( not ( = ?auto_255176 ?auto_255182 ) ) ( not ( = ?auto_255176 ?auto_255183 ) ) ( not ( = ?auto_255176 ?auto_255184 ) ) ( not ( = ?auto_255177 ?auto_255178 ) ) ( not ( = ?auto_255177 ?auto_255179 ) ) ( not ( = ?auto_255177 ?auto_255180 ) ) ( not ( = ?auto_255177 ?auto_255181 ) ) ( not ( = ?auto_255177 ?auto_255182 ) ) ( not ( = ?auto_255177 ?auto_255183 ) ) ( not ( = ?auto_255177 ?auto_255184 ) ) ( not ( = ?auto_255178 ?auto_255179 ) ) ( not ( = ?auto_255178 ?auto_255180 ) ) ( not ( = ?auto_255178 ?auto_255181 ) ) ( not ( = ?auto_255178 ?auto_255182 ) ) ( not ( = ?auto_255178 ?auto_255183 ) ) ( not ( = ?auto_255178 ?auto_255184 ) ) ( not ( = ?auto_255179 ?auto_255180 ) ) ( not ( = ?auto_255179 ?auto_255181 ) ) ( not ( = ?auto_255179 ?auto_255182 ) ) ( not ( = ?auto_255179 ?auto_255183 ) ) ( not ( = ?auto_255179 ?auto_255184 ) ) ( not ( = ?auto_255180 ?auto_255181 ) ) ( not ( = ?auto_255180 ?auto_255182 ) ) ( not ( = ?auto_255180 ?auto_255183 ) ) ( not ( = ?auto_255180 ?auto_255184 ) ) ( not ( = ?auto_255181 ?auto_255182 ) ) ( not ( = ?auto_255181 ?auto_255183 ) ) ( not ( = ?auto_255181 ?auto_255184 ) ) ( not ( = ?auto_255182 ?auto_255183 ) ) ( not ( = ?auto_255182 ?auto_255184 ) ) ( not ( = ?auto_255183 ?auto_255184 ) ) ( ON ?auto_255182 ?auto_255183 ) ( ON ?auto_255181 ?auto_255182 ) ( ON ?auto_255180 ?auto_255181 ) ( ON ?auto_255179 ?auto_255180 ) ( CLEAR ?auto_255177 ) ( ON ?auto_255178 ?auto_255179 ) ( CLEAR ?auto_255178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_255175 ?auto_255176 ?auto_255177 ?auto_255178 )
      ( MAKE-9PILE ?auto_255175 ?auto_255176 ?auto_255177 ?auto_255178 ?auto_255179 ?auto_255180 ?auto_255181 ?auto_255182 ?auto_255183 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_255194 - BLOCK
      ?auto_255195 - BLOCK
      ?auto_255196 - BLOCK
      ?auto_255197 - BLOCK
      ?auto_255198 - BLOCK
      ?auto_255199 - BLOCK
      ?auto_255200 - BLOCK
      ?auto_255201 - BLOCK
      ?auto_255202 - BLOCK
    )
    :vars
    (
      ?auto_255203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255202 ?auto_255203 ) ( ON-TABLE ?auto_255194 ) ( ON ?auto_255195 ?auto_255194 ) ( ON ?auto_255196 ?auto_255195 ) ( not ( = ?auto_255194 ?auto_255195 ) ) ( not ( = ?auto_255194 ?auto_255196 ) ) ( not ( = ?auto_255194 ?auto_255197 ) ) ( not ( = ?auto_255194 ?auto_255198 ) ) ( not ( = ?auto_255194 ?auto_255199 ) ) ( not ( = ?auto_255194 ?auto_255200 ) ) ( not ( = ?auto_255194 ?auto_255201 ) ) ( not ( = ?auto_255194 ?auto_255202 ) ) ( not ( = ?auto_255194 ?auto_255203 ) ) ( not ( = ?auto_255195 ?auto_255196 ) ) ( not ( = ?auto_255195 ?auto_255197 ) ) ( not ( = ?auto_255195 ?auto_255198 ) ) ( not ( = ?auto_255195 ?auto_255199 ) ) ( not ( = ?auto_255195 ?auto_255200 ) ) ( not ( = ?auto_255195 ?auto_255201 ) ) ( not ( = ?auto_255195 ?auto_255202 ) ) ( not ( = ?auto_255195 ?auto_255203 ) ) ( not ( = ?auto_255196 ?auto_255197 ) ) ( not ( = ?auto_255196 ?auto_255198 ) ) ( not ( = ?auto_255196 ?auto_255199 ) ) ( not ( = ?auto_255196 ?auto_255200 ) ) ( not ( = ?auto_255196 ?auto_255201 ) ) ( not ( = ?auto_255196 ?auto_255202 ) ) ( not ( = ?auto_255196 ?auto_255203 ) ) ( not ( = ?auto_255197 ?auto_255198 ) ) ( not ( = ?auto_255197 ?auto_255199 ) ) ( not ( = ?auto_255197 ?auto_255200 ) ) ( not ( = ?auto_255197 ?auto_255201 ) ) ( not ( = ?auto_255197 ?auto_255202 ) ) ( not ( = ?auto_255197 ?auto_255203 ) ) ( not ( = ?auto_255198 ?auto_255199 ) ) ( not ( = ?auto_255198 ?auto_255200 ) ) ( not ( = ?auto_255198 ?auto_255201 ) ) ( not ( = ?auto_255198 ?auto_255202 ) ) ( not ( = ?auto_255198 ?auto_255203 ) ) ( not ( = ?auto_255199 ?auto_255200 ) ) ( not ( = ?auto_255199 ?auto_255201 ) ) ( not ( = ?auto_255199 ?auto_255202 ) ) ( not ( = ?auto_255199 ?auto_255203 ) ) ( not ( = ?auto_255200 ?auto_255201 ) ) ( not ( = ?auto_255200 ?auto_255202 ) ) ( not ( = ?auto_255200 ?auto_255203 ) ) ( not ( = ?auto_255201 ?auto_255202 ) ) ( not ( = ?auto_255201 ?auto_255203 ) ) ( not ( = ?auto_255202 ?auto_255203 ) ) ( ON ?auto_255201 ?auto_255202 ) ( ON ?auto_255200 ?auto_255201 ) ( ON ?auto_255199 ?auto_255200 ) ( ON ?auto_255198 ?auto_255199 ) ( CLEAR ?auto_255196 ) ( ON ?auto_255197 ?auto_255198 ) ( CLEAR ?auto_255197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_255194 ?auto_255195 ?auto_255196 ?auto_255197 )
      ( MAKE-9PILE ?auto_255194 ?auto_255195 ?auto_255196 ?auto_255197 ?auto_255198 ?auto_255199 ?auto_255200 ?auto_255201 ?auto_255202 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_255213 - BLOCK
      ?auto_255214 - BLOCK
      ?auto_255215 - BLOCK
      ?auto_255216 - BLOCK
      ?auto_255217 - BLOCK
      ?auto_255218 - BLOCK
      ?auto_255219 - BLOCK
      ?auto_255220 - BLOCK
      ?auto_255221 - BLOCK
    )
    :vars
    (
      ?auto_255222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255221 ?auto_255222 ) ( ON-TABLE ?auto_255213 ) ( ON ?auto_255214 ?auto_255213 ) ( not ( = ?auto_255213 ?auto_255214 ) ) ( not ( = ?auto_255213 ?auto_255215 ) ) ( not ( = ?auto_255213 ?auto_255216 ) ) ( not ( = ?auto_255213 ?auto_255217 ) ) ( not ( = ?auto_255213 ?auto_255218 ) ) ( not ( = ?auto_255213 ?auto_255219 ) ) ( not ( = ?auto_255213 ?auto_255220 ) ) ( not ( = ?auto_255213 ?auto_255221 ) ) ( not ( = ?auto_255213 ?auto_255222 ) ) ( not ( = ?auto_255214 ?auto_255215 ) ) ( not ( = ?auto_255214 ?auto_255216 ) ) ( not ( = ?auto_255214 ?auto_255217 ) ) ( not ( = ?auto_255214 ?auto_255218 ) ) ( not ( = ?auto_255214 ?auto_255219 ) ) ( not ( = ?auto_255214 ?auto_255220 ) ) ( not ( = ?auto_255214 ?auto_255221 ) ) ( not ( = ?auto_255214 ?auto_255222 ) ) ( not ( = ?auto_255215 ?auto_255216 ) ) ( not ( = ?auto_255215 ?auto_255217 ) ) ( not ( = ?auto_255215 ?auto_255218 ) ) ( not ( = ?auto_255215 ?auto_255219 ) ) ( not ( = ?auto_255215 ?auto_255220 ) ) ( not ( = ?auto_255215 ?auto_255221 ) ) ( not ( = ?auto_255215 ?auto_255222 ) ) ( not ( = ?auto_255216 ?auto_255217 ) ) ( not ( = ?auto_255216 ?auto_255218 ) ) ( not ( = ?auto_255216 ?auto_255219 ) ) ( not ( = ?auto_255216 ?auto_255220 ) ) ( not ( = ?auto_255216 ?auto_255221 ) ) ( not ( = ?auto_255216 ?auto_255222 ) ) ( not ( = ?auto_255217 ?auto_255218 ) ) ( not ( = ?auto_255217 ?auto_255219 ) ) ( not ( = ?auto_255217 ?auto_255220 ) ) ( not ( = ?auto_255217 ?auto_255221 ) ) ( not ( = ?auto_255217 ?auto_255222 ) ) ( not ( = ?auto_255218 ?auto_255219 ) ) ( not ( = ?auto_255218 ?auto_255220 ) ) ( not ( = ?auto_255218 ?auto_255221 ) ) ( not ( = ?auto_255218 ?auto_255222 ) ) ( not ( = ?auto_255219 ?auto_255220 ) ) ( not ( = ?auto_255219 ?auto_255221 ) ) ( not ( = ?auto_255219 ?auto_255222 ) ) ( not ( = ?auto_255220 ?auto_255221 ) ) ( not ( = ?auto_255220 ?auto_255222 ) ) ( not ( = ?auto_255221 ?auto_255222 ) ) ( ON ?auto_255220 ?auto_255221 ) ( ON ?auto_255219 ?auto_255220 ) ( ON ?auto_255218 ?auto_255219 ) ( ON ?auto_255217 ?auto_255218 ) ( ON ?auto_255216 ?auto_255217 ) ( CLEAR ?auto_255214 ) ( ON ?auto_255215 ?auto_255216 ) ( CLEAR ?auto_255215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_255213 ?auto_255214 ?auto_255215 )
      ( MAKE-9PILE ?auto_255213 ?auto_255214 ?auto_255215 ?auto_255216 ?auto_255217 ?auto_255218 ?auto_255219 ?auto_255220 ?auto_255221 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_255232 - BLOCK
      ?auto_255233 - BLOCK
      ?auto_255234 - BLOCK
      ?auto_255235 - BLOCK
      ?auto_255236 - BLOCK
      ?auto_255237 - BLOCK
      ?auto_255238 - BLOCK
      ?auto_255239 - BLOCK
      ?auto_255240 - BLOCK
    )
    :vars
    (
      ?auto_255241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255240 ?auto_255241 ) ( ON-TABLE ?auto_255232 ) ( ON ?auto_255233 ?auto_255232 ) ( not ( = ?auto_255232 ?auto_255233 ) ) ( not ( = ?auto_255232 ?auto_255234 ) ) ( not ( = ?auto_255232 ?auto_255235 ) ) ( not ( = ?auto_255232 ?auto_255236 ) ) ( not ( = ?auto_255232 ?auto_255237 ) ) ( not ( = ?auto_255232 ?auto_255238 ) ) ( not ( = ?auto_255232 ?auto_255239 ) ) ( not ( = ?auto_255232 ?auto_255240 ) ) ( not ( = ?auto_255232 ?auto_255241 ) ) ( not ( = ?auto_255233 ?auto_255234 ) ) ( not ( = ?auto_255233 ?auto_255235 ) ) ( not ( = ?auto_255233 ?auto_255236 ) ) ( not ( = ?auto_255233 ?auto_255237 ) ) ( not ( = ?auto_255233 ?auto_255238 ) ) ( not ( = ?auto_255233 ?auto_255239 ) ) ( not ( = ?auto_255233 ?auto_255240 ) ) ( not ( = ?auto_255233 ?auto_255241 ) ) ( not ( = ?auto_255234 ?auto_255235 ) ) ( not ( = ?auto_255234 ?auto_255236 ) ) ( not ( = ?auto_255234 ?auto_255237 ) ) ( not ( = ?auto_255234 ?auto_255238 ) ) ( not ( = ?auto_255234 ?auto_255239 ) ) ( not ( = ?auto_255234 ?auto_255240 ) ) ( not ( = ?auto_255234 ?auto_255241 ) ) ( not ( = ?auto_255235 ?auto_255236 ) ) ( not ( = ?auto_255235 ?auto_255237 ) ) ( not ( = ?auto_255235 ?auto_255238 ) ) ( not ( = ?auto_255235 ?auto_255239 ) ) ( not ( = ?auto_255235 ?auto_255240 ) ) ( not ( = ?auto_255235 ?auto_255241 ) ) ( not ( = ?auto_255236 ?auto_255237 ) ) ( not ( = ?auto_255236 ?auto_255238 ) ) ( not ( = ?auto_255236 ?auto_255239 ) ) ( not ( = ?auto_255236 ?auto_255240 ) ) ( not ( = ?auto_255236 ?auto_255241 ) ) ( not ( = ?auto_255237 ?auto_255238 ) ) ( not ( = ?auto_255237 ?auto_255239 ) ) ( not ( = ?auto_255237 ?auto_255240 ) ) ( not ( = ?auto_255237 ?auto_255241 ) ) ( not ( = ?auto_255238 ?auto_255239 ) ) ( not ( = ?auto_255238 ?auto_255240 ) ) ( not ( = ?auto_255238 ?auto_255241 ) ) ( not ( = ?auto_255239 ?auto_255240 ) ) ( not ( = ?auto_255239 ?auto_255241 ) ) ( not ( = ?auto_255240 ?auto_255241 ) ) ( ON ?auto_255239 ?auto_255240 ) ( ON ?auto_255238 ?auto_255239 ) ( ON ?auto_255237 ?auto_255238 ) ( ON ?auto_255236 ?auto_255237 ) ( ON ?auto_255235 ?auto_255236 ) ( CLEAR ?auto_255233 ) ( ON ?auto_255234 ?auto_255235 ) ( CLEAR ?auto_255234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_255232 ?auto_255233 ?auto_255234 )
      ( MAKE-9PILE ?auto_255232 ?auto_255233 ?auto_255234 ?auto_255235 ?auto_255236 ?auto_255237 ?auto_255238 ?auto_255239 ?auto_255240 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_255251 - BLOCK
      ?auto_255252 - BLOCK
      ?auto_255253 - BLOCK
      ?auto_255254 - BLOCK
      ?auto_255255 - BLOCK
      ?auto_255256 - BLOCK
      ?auto_255257 - BLOCK
      ?auto_255258 - BLOCK
      ?auto_255259 - BLOCK
    )
    :vars
    (
      ?auto_255260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255259 ?auto_255260 ) ( ON-TABLE ?auto_255251 ) ( not ( = ?auto_255251 ?auto_255252 ) ) ( not ( = ?auto_255251 ?auto_255253 ) ) ( not ( = ?auto_255251 ?auto_255254 ) ) ( not ( = ?auto_255251 ?auto_255255 ) ) ( not ( = ?auto_255251 ?auto_255256 ) ) ( not ( = ?auto_255251 ?auto_255257 ) ) ( not ( = ?auto_255251 ?auto_255258 ) ) ( not ( = ?auto_255251 ?auto_255259 ) ) ( not ( = ?auto_255251 ?auto_255260 ) ) ( not ( = ?auto_255252 ?auto_255253 ) ) ( not ( = ?auto_255252 ?auto_255254 ) ) ( not ( = ?auto_255252 ?auto_255255 ) ) ( not ( = ?auto_255252 ?auto_255256 ) ) ( not ( = ?auto_255252 ?auto_255257 ) ) ( not ( = ?auto_255252 ?auto_255258 ) ) ( not ( = ?auto_255252 ?auto_255259 ) ) ( not ( = ?auto_255252 ?auto_255260 ) ) ( not ( = ?auto_255253 ?auto_255254 ) ) ( not ( = ?auto_255253 ?auto_255255 ) ) ( not ( = ?auto_255253 ?auto_255256 ) ) ( not ( = ?auto_255253 ?auto_255257 ) ) ( not ( = ?auto_255253 ?auto_255258 ) ) ( not ( = ?auto_255253 ?auto_255259 ) ) ( not ( = ?auto_255253 ?auto_255260 ) ) ( not ( = ?auto_255254 ?auto_255255 ) ) ( not ( = ?auto_255254 ?auto_255256 ) ) ( not ( = ?auto_255254 ?auto_255257 ) ) ( not ( = ?auto_255254 ?auto_255258 ) ) ( not ( = ?auto_255254 ?auto_255259 ) ) ( not ( = ?auto_255254 ?auto_255260 ) ) ( not ( = ?auto_255255 ?auto_255256 ) ) ( not ( = ?auto_255255 ?auto_255257 ) ) ( not ( = ?auto_255255 ?auto_255258 ) ) ( not ( = ?auto_255255 ?auto_255259 ) ) ( not ( = ?auto_255255 ?auto_255260 ) ) ( not ( = ?auto_255256 ?auto_255257 ) ) ( not ( = ?auto_255256 ?auto_255258 ) ) ( not ( = ?auto_255256 ?auto_255259 ) ) ( not ( = ?auto_255256 ?auto_255260 ) ) ( not ( = ?auto_255257 ?auto_255258 ) ) ( not ( = ?auto_255257 ?auto_255259 ) ) ( not ( = ?auto_255257 ?auto_255260 ) ) ( not ( = ?auto_255258 ?auto_255259 ) ) ( not ( = ?auto_255258 ?auto_255260 ) ) ( not ( = ?auto_255259 ?auto_255260 ) ) ( ON ?auto_255258 ?auto_255259 ) ( ON ?auto_255257 ?auto_255258 ) ( ON ?auto_255256 ?auto_255257 ) ( ON ?auto_255255 ?auto_255256 ) ( ON ?auto_255254 ?auto_255255 ) ( ON ?auto_255253 ?auto_255254 ) ( CLEAR ?auto_255251 ) ( ON ?auto_255252 ?auto_255253 ) ( CLEAR ?auto_255252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_255251 ?auto_255252 )
      ( MAKE-9PILE ?auto_255251 ?auto_255252 ?auto_255253 ?auto_255254 ?auto_255255 ?auto_255256 ?auto_255257 ?auto_255258 ?auto_255259 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_255270 - BLOCK
      ?auto_255271 - BLOCK
      ?auto_255272 - BLOCK
      ?auto_255273 - BLOCK
      ?auto_255274 - BLOCK
      ?auto_255275 - BLOCK
      ?auto_255276 - BLOCK
      ?auto_255277 - BLOCK
      ?auto_255278 - BLOCK
    )
    :vars
    (
      ?auto_255279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255278 ?auto_255279 ) ( ON-TABLE ?auto_255270 ) ( not ( = ?auto_255270 ?auto_255271 ) ) ( not ( = ?auto_255270 ?auto_255272 ) ) ( not ( = ?auto_255270 ?auto_255273 ) ) ( not ( = ?auto_255270 ?auto_255274 ) ) ( not ( = ?auto_255270 ?auto_255275 ) ) ( not ( = ?auto_255270 ?auto_255276 ) ) ( not ( = ?auto_255270 ?auto_255277 ) ) ( not ( = ?auto_255270 ?auto_255278 ) ) ( not ( = ?auto_255270 ?auto_255279 ) ) ( not ( = ?auto_255271 ?auto_255272 ) ) ( not ( = ?auto_255271 ?auto_255273 ) ) ( not ( = ?auto_255271 ?auto_255274 ) ) ( not ( = ?auto_255271 ?auto_255275 ) ) ( not ( = ?auto_255271 ?auto_255276 ) ) ( not ( = ?auto_255271 ?auto_255277 ) ) ( not ( = ?auto_255271 ?auto_255278 ) ) ( not ( = ?auto_255271 ?auto_255279 ) ) ( not ( = ?auto_255272 ?auto_255273 ) ) ( not ( = ?auto_255272 ?auto_255274 ) ) ( not ( = ?auto_255272 ?auto_255275 ) ) ( not ( = ?auto_255272 ?auto_255276 ) ) ( not ( = ?auto_255272 ?auto_255277 ) ) ( not ( = ?auto_255272 ?auto_255278 ) ) ( not ( = ?auto_255272 ?auto_255279 ) ) ( not ( = ?auto_255273 ?auto_255274 ) ) ( not ( = ?auto_255273 ?auto_255275 ) ) ( not ( = ?auto_255273 ?auto_255276 ) ) ( not ( = ?auto_255273 ?auto_255277 ) ) ( not ( = ?auto_255273 ?auto_255278 ) ) ( not ( = ?auto_255273 ?auto_255279 ) ) ( not ( = ?auto_255274 ?auto_255275 ) ) ( not ( = ?auto_255274 ?auto_255276 ) ) ( not ( = ?auto_255274 ?auto_255277 ) ) ( not ( = ?auto_255274 ?auto_255278 ) ) ( not ( = ?auto_255274 ?auto_255279 ) ) ( not ( = ?auto_255275 ?auto_255276 ) ) ( not ( = ?auto_255275 ?auto_255277 ) ) ( not ( = ?auto_255275 ?auto_255278 ) ) ( not ( = ?auto_255275 ?auto_255279 ) ) ( not ( = ?auto_255276 ?auto_255277 ) ) ( not ( = ?auto_255276 ?auto_255278 ) ) ( not ( = ?auto_255276 ?auto_255279 ) ) ( not ( = ?auto_255277 ?auto_255278 ) ) ( not ( = ?auto_255277 ?auto_255279 ) ) ( not ( = ?auto_255278 ?auto_255279 ) ) ( ON ?auto_255277 ?auto_255278 ) ( ON ?auto_255276 ?auto_255277 ) ( ON ?auto_255275 ?auto_255276 ) ( ON ?auto_255274 ?auto_255275 ) ( ON ?auto_255273 ?auto_255274 ) ( ON ?auto_255272 ?auto_255273 ) ( CLEAR ?auto_255270 ) ( ON ?auto_255271 ?auto_255272 ) ( CLEAR ?auto_255271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_255270 ?auto_255271 )
      ( MAKE-9PILE ?auto_255270 ?auto_255271 ?auto_255272 ?auto_255273 ?auto_255274 ?auto_255275 ?auto_255276 ?auto_255277 ?auto_255278 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_255289 - BLOCK
      ?auto_255290 - BLOCK
      ?auto_255291 - BLOCK
      ?auto_255292 - BLOCK
      ?auto_255293 - BLOCK
      ?auto_255294 - BLOCK
      ?auto_255295 - BLOCK
      ?auto_255296 - BLOCK
      ?auto_255297 - BLOCK
    )
    :vars
    (
      ?auto_255298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255297 ?auto_255298 ) ( not ( = ?auto_255289 ?auto_255290 ) ) ( not ( = ?auto_255289 ?auto_255291 ) ) ( not ( = ?auto_255289 ?auto_255292 ) ) ( not ( = ?auto_255289 ?auto_255293 ) ) ( not ( = ?auto_255289 ?auto_255294 ) ) ( not ( = ?auto_255289 ?auto_255295 ) ) ( not ( = ?auto_255289 ?auto_255296 ) ) ( not ( = ?auto_255289 ?auto_255297 ) ) ( not ( = ?auto_255289 ?auto_255298 ) ) ( not ( = ?auto_255290 ?auto_255291 ) ) ( not ( = ?auto_255290 ?auto_255292 ) ) ( not ( = ?auto_255290 ?auto_255293 ) ) ( not ( = ?auto_255290 ?auto_255294 ) ) ( not ( = ?auto_255290 ?auto_255295 ) ) ( not ( = ?auto_255290 ?auto_255296 ) ) ( not ( = ?auto_255290 ?auto_255297 ) ) ( not ( = ?auto_255290 ?auto_255298 ) ) ( not ( = ?auto_255291 ?auto_255292 ) ) ( not ( = ?auto_255291 ?auto_255293 ) ) ( not ( = ?auto_255291 ?auto_255294 ) ) ( not ( = ?auto_255291 ?auto_255295 ) ) ( not ( = ?auto_255291 ?auto_255296 ) ) ( not ( = ?auto_255291 ?auto_255297 ) ) ( not ( = ?auto_255291 ?auto_255298 ) ) ( not ( = ?auto_255292 ?auto_255293 ) ) ( not ( = ?auto_255292 ?auto_255294 ) ) ( not ( = ?auto_255292 ?auto_255295 ) ) ( not ( = ?auto_255292 ?auto_255296 ) ) ( not ( = ?auto_255292 ?auto_255297 ) ) ( not ( = ?auto_255292 ?auto_255298 ) ) ( not ( = ?auto_255293 ?auto_255294 ) ) ( not ( = ?auto_255293 ?auto_255295 ) ) ( not ( = ?auto_255293 ?auto_255296 ) ) ( not ( = ?auto_255293 ?auto_255297 ) ) ( not ( = ?auto_255293 ?auto_255298 ) ) ( not ( = ?auto_255294 ?auto_255295 ) ) ( not ( = ?auto_255294 ?auto_255296 ) ) ( not ( = ?auto_255294 ?auto_255297 ) ) ( not ( = ?auto_255294 ?auto_255298 ) ) ( not ( = ?auto_255295 ?auto_255296 ) ) ( not ( = ?auto_255295 ?auto_255297 ) ) ( not ( = ?auto_255295 ?auto_255298 ) ) ( not ( = ?auto_255296 ?auto_255297 ) ) ( not ( = ?auto_255296 ?auto_255298 ) ) ( not ( = ?auto_255297 ?auto_255298 ) ) ( ON ?auto_255296 ?auto_255297 ) ( ON ?auto_255295 ?auto_255296 ) ( ON ?auto_255294 ?auto_255295 ) ( ON ?auto_255293 ?auto_255294 ) ( ON ?auto_255292 ?auto_255293 ) ( ON ?auto_255291 ?auto_255292 ) ( ON ?auto_255290 ?auto_255291 ) ( ON ?auto_255289 ?auto_255290 ) ( CLEAR ?auto_255289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_255289 )
      ( MAKE-9PILE ?auto_255289 ?auto_255290 ?auto_255291 ?auto_255292 ?auto_255293 ?auto_255294 ?auto_255295 ?auto_255296 ?auto_255297 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_255308 - BLOCK
      ?auto_255309 - BLOCK
      ?auto_255310 - BLOCK
      ?auto_255311 - BLOCK
      ?auto_255312 - BLOCK
      ?auto_255313 - BLOCK
      ?auto_255314 - BLOCK
      ?auto_255315 - BLOCK
      ?auto_255316 - BLOCK
    )
    :vars
    (
      ?auto_255317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255316 ?auto_255317 ) ( not ( = ?auto_255308 ?auto_255309 ) ) ( not ( = ?auto_255308 ?auto_255310 ) ) ( not ( = ?auto_255308 ?auto_255311 ) ) ( not ( = ?auto_255308 ?auto_255312 ) ) ( not ( = ?auto_255308 ?auto_255313 ) ) ( not ( = ?auto_255308 ?auto_255314 ) ) ( not ( = ?auto_255308 ?auto_255315 ) ) ( not ( = ?auto_255308 ?auto_255316 ) ) ( not ( = ?auto_255308 ?auto_255317 ) ) ( not ( = ?auto_255309 ?auto_255310 ) ) ( not ( = ?auto_255309 ?auto_255311 ) ) ( not ( = ?auto_255309 ?auto_255312 ) ) ( not ( = ?auto_255309 ?auto_255313 ) ) ( not ( = ?auto_255309 ?auto_255314 ) ) ( not ( = ?auto_255309 ?auto_255315 ) ) ( not ( = ?auto_255309 ?auto_255316 ) ) ( not ( = ?auto_255309 ?auto_255317 ) ) ( not ( = ?auto_255310 ?auto_255311 ) ) ( not ( = ?auto_255310 ?auto_255312 ) ) ( not ( = ?auto_255310 ?auto_255313 ) ) ( not ( = ?auto_255310 ?auto_255314 ) ) ( not ( = ?auto_255310 ?auto_255315 ) ) ( not ( = ?auto_255310 ?auto_255316 ) ) ( not ( = ?auto_255310 ?auto_255317 ) ) ( not ( = ?auto_255311 ?auto_255312 ) ) ( not ( = ?auto_255311 ?auto_255313 ) ) ( not ( = ?auto_255311 ?auto_255314 ) ) ( not ( = ?auto_255311 ?auto_255315 ) ) ( not ( = ?auto_255311 ?auto_255316 ) ) ( not ( = ?auto_255311 ?auto_255317 ) ) ( not ( = ?auto_255312 ?auto_255313 ) ) ( not ( = ?auto_255312 ?auto_255314 ) ) ( not ( = ?auto_255312 ?auto_255315 ) ) ( not ( = ?auto_255312 ?auto_255316 ) ) ( not ( = ?auto_255312 ?auto_255317 ) ) ( not ( = ?auto_255313 ?auto_255314 ) ) ( not ( = ?auto_255313 ?auto_255315 ) ) ( not ( = ?auto_255313 ?auto_255316 ) ) ( not ( = ?auto_255313 ?auto_255317 ) ) ( not ( = ?auto_255314 ?auto_255315 ) ) ( not ( = ?auto_255314 ?auto_255316 ) ) ( not ( = ?auto_255314 ?auto_255317 ) ) ( not ( = ?auto_255315 ?auto_255316 ) ) ( not ( = ?auto_255315 ?auto_255317 ) ) ( not ( = ?auto_255316 ?auto_255317 ) ) ( ON ?auto_255315 ?auto_255316 ) ( ON ?auto_255314 ?auto_255315 ) ( ON ?auto_255313 ?auto_255314 ) ( ON ?auto_255312 ?auto_255313 ) ( ON ?auto_255311 ?auto_255312 ) ( ON ?auto_255310 ?auto_255311 ) ( ON ?auto_255309 ?auto_255310 ) ( ON ?auto_255308 ?auto_255309 ) ( CLEAR ?auto_255308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_255308 )
      ( MAKE-9PILE ?auto_255308 ?auto_255309 ?auto_255310 ?auto_255311 ?auto_255312 ?auto_255313 ?auto_255314 ?auto_255315 ?auto_255316 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_255328 - BLOCK
      ?auto_255329 - BLOCK
      ?auto_255330 - BLOCK
      ?auto_255331 - BLOCK
      ?auto_255332 - BLOCK
      ?auto_255333 - BLOCK
      ?auto_255334 - BLOCK
      ?auto_255335 - BLOCK
      ?auto_255336 - BLOCK
      ?auto_255337 - BLOCK
    )
    :vars
    (
      ?auto_255338 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_255336 ) ( ON ?auto_255337 ?auto_255338 ) ( CLEAR ?auto_255337 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_255328 ) ( ON ?auto_255329 ?auto_255328 ) ( ON ?auto_255330 ?auto_255329 ) ( ON ?auto_255331 ?auto_255330 ) ( ON ?auto_255332 ?auto_255331 ) ( ON ?auto_255333 ?auto_255332 ) ( ON ?auto_255334 ?auto_255333 ) ( ON ?auto_255335 ?auto_255334 ) ( ON ?auto_255336 ?auto_255335 ) ( not ( = ?auto_255328 ?auto_255329 ) ) ( not ( = ?auto_255328 ?auto_255330 ) ) ( not ( = ?auto_255328 ?auto_255331 ) ) ( not ( = ?auto_255328 ?auto_255332 ) ) ( not ( = ?auto_255328 ?auto_255333 ) ) ( not ( = ?auto_255328 ?auto_255334 ) ) ( not ( = ?auto_255328 ?auto_255335 ) ) ( not ( = ?auto_255328 ?auto_255336 ) ) ( not ( = ?auto_255328 ?auto_255337 ) ) ( not ( = ?auto_255328 ?auto_255338 ) ) ( not ( = ?auto_255329 ?auto_255330 ) ) ( not ( = ?auto_255329 ?auto_255331 ) ) ( not ( = ?auto_255329 ?auto_255332 ) ) ( not ( = ?auto_255329 ?auto_255333 ) ) ( not ( = ?auto_255329 ?auto_255334 ) ) ( not ( = ?auto_255329 ?auto_255335 ) ) ( not ( = ?auto_255329 ?auto_255336 ) ) ( not ( = ?auto_255329 ?auto_255337 ) ) ( not ( = ?auto_255329 ?auto_255338 ) ) ( not ( = ?auto_255330 ?auto_255331 ) ) ( not ( = ?auto_255330 ?auto_255332 ) ) ( not ( = ?auto_255330 ?auto_255333 ) ) ( not ( = ?auto_255330 ?auto_255334 ) ) ( not ( = ?auto_255330 ?auto_255335 ) ) ( not ( = ?auto_255330 ?auto_255336 ) ) ( not ( = ?auto_255330 ?auto_255337 ) ) ( not ( = ?auto_255330 ?auto_255338 ) ) ( not ( = ?auto_255331 ?auto_255332 ) ) ( not ( = ?auto_255331 ?auto_255333 ) ) ( not ( = ?auto_255331 ?auto_255334 ) ) ( not ( = ?auto_255331 ?auto_255335 ) ) ( not ( = ?auto_255331 ?auto_255336 ) ) ( not ( = ?auto_255331 ?auto_255337 ) ) ( not ( = ?auto_255331 ?auto_255338 ) ) ( not ( = ?auto_255332 ?auto_255333 ) ) ( not ( = ?auto_255332 ?auto_255334 ) ) ( not ( = ?auto_255332 ?auto_255335 ) ) ( not ( = ?auto_255332 ?auto_255336 ) ) ( not ( = ?auto_255332 ?auto_255337 ) ) ( not ( = ?auto_255332 ?auto_255338 ) ) ( not ( = ?auto_255333 ?auto_255334 ) ) ( not ( = ?auto_255333 ?auto_255335 ) ) ( not ( = ?auto_255333 ?auto_255336 ) ) ( not ( = ?auto_255333 ?auto_255337 ) ) ( not ( = ?auto_255333 ?auto_255338 ) ) ( not ( = ?auto_255334 ?auto_255335 ) ) ( not ( = ?auto_255334 ?auto_255336 ) ) ( not ( = ?auto_255334 ?auto_255337 ) ) ( not ( = ?auto_255334 ?auto_255338 ) ) ( not ( = ?auto_255335 ?auto_255336 ) ) ( not ( = ?auto_255335 ?auto_255337 ) ) ( not ( = ?auto_255335 ?auto_255338 ) ) ( not ( = ?auto_255336 ?auto_255337 ) ) ( not ( = ?auto_255336 ?auto_255338 ) ) ( not ( = ?auto_255337 ?auto_255338 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_255337 ?auto_255338 )
      ( !STACK ?auto_255337 ?auto_255336 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_255349 - BLOCK
      ?auto_255350 - BLOCK
      ?auto_255351 - BLOCK
      ?auto_255352 - BLOCK
      ?auto_255353 - BLOCK
      ?auto_255354 - BLOCK
      ?auto_255355 - BLOCK
      ?auto_255356 - BLOCK
      ?auto_255357 - BLOCK
      ?auto_255358 - BLOCK
    )
    :vars
    (
      ?auto_255359 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_255357 ) ( ON ?auto_255358 ?auto_255359 ) ( CLEAR ?auto_255358 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_255349 ) ( ON ?auto_255350 ?auto_255349 ) ( ON ?auto_255351 ?auto_255350 ) ( ON ?auto_255352 ?auto_255351 ) ( ON ?auto_255353 ?auto_255352 ) ( ON ?auto_255354 ?auto_255353 ) ( ON ?auto_255355 ?auto_255354 ) ( ON ?auto_255356 ?auto_255355 ) ( ON ?auto_255357 ?auto_255356 ) ( not ( = ?auto_255349 ?auto_255350 ) ) ( not ( = ?auto_255349 ?auto_255351 ) ) ( not ( = ?auto_255349 ?auto_255352 ) ) ( not ( = ?auto_255349 ?auto_255353 ) ) ( not ( = ?auto_255349 ?auto_255354 ) ) ( not ( = ?auto_255349 ?auto_255355 ) ) ( not ( = ?auto_255349 ?auto_255356 ) ) ( not ( = ?auto_255349 ?auto_255357 ) ) ( not ( = ?auto_255349 ?auto_255358 ) ) ( not ( = ?auto_255349 ?auto_255359 ) ) ( not ( = ?auto_255350 ?auto_255351 ) ) ( not ( = ?auto_255350 ?auto_255352 ) ) ( not ( = ?auto_255350 ?auto_255353 ) ) ( not ( = ?auto_255350 ?auto_255354 ) ) ( not ( = ?auto_255350 ?auto_255355 ) ) ( not ( = ?auto_255350 ?auto_255356 ) ) ( not ( = ?auto_255350 ?auto_255357 ) ) ( not ( = ?auto_255350 ?auto_255358 ) ) ( not ( = ?auto_255350 ?auto_255359 ) ) ( not ( = ?auto_255351 ?auto_255352 ) ) ( not ( = ?auto_255351 ?auto_255353 ) ) ( not ( = ?auto_255351 ?auto_255354 ) ) ( not ( = ?auto_255351 ?auto_255355 ) ) ( not ( = ?auto_255351 ?auto_255356 ) ) ( not ( = ?auto_255351 ?auto_255357 ) ) ( not ( = ?auto_255351 ?auto_255358 ) ) ( not ( = ?auto_255351 ?auto_255359 ) ) ( not ( = ?auto_255352 ?auto_255353 ) ) ( not ( = ?auto_255352 ?auto_255354 ) ) ( not ( = ?auto_255352 ?auto_255355 ) ) ( not ( = ?auto_255352 ?auto_255356 ) ) ( not ( = ?auto_255352 ?auto_255357 ) ) ( not ( = ?auto_255352 ?auto_255358 ) ) ( not ( = ?auto_255352 ?auto_255359 ) ) ( not ( = ?auto_255353 ?auto_255354 ) ) ( not ( = ?auto_255353 ?auto_255355 ) ) ( not ( = ?auto_255353 ?auto_255356 ) ) ( not ( = ?auto_255353 ?auto_255357 ) ) ( not ( = ?auto_255353 ?auto_255358 ) ) ( not ( = ?auto_255353 ?auto_255359 ) ) ( not ( = ?auto_255354 ?auto_255355 ) ) ( not ( = ?auto_255354 ?auto_255356 ) ) ( not ( = ?auto_255354 ?auto_255357 ) ) ( not ( = ?auto_255354 ?auto_255358 ) ) ( not ( = ?auto_255354 ?auto_255359 ) ) ( not ( = ?auto_255355 ?auto_255356 ) ) ( not ( = ?auto_255355 ?auto_255357 ) ) ( not ( = ?auto_255355 ?auto_255358 ) ) ( not ( = ?auto_255355 ?auto_255359 ) ) ( not ( = ?auto_255356 ?auto_255357 ) ) ( not ( = ?auto_255356 ?auto_255358 ) ) ( not ( = ?auto_255356 ?auto_255359 ) ) ( not ( = ?auto_255357 ?auto_255358 ) ) ( not ( = ?auto_255357 ?auto_255359 ) ) ( not ( = ?auto_255358 ?auto_255359 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_255358 ?auto_255359 )
      ( !STACK ?auto_255358 ?auto_255357 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_255370 - BLOCK
      ?auto_255371 - BLOCK
      ?auto_255372 - BLOCK
      ?auto_255373 - BLOCK
      ?auto_255374 - BLOCK
      ?auto_255375 - BLOCK
      ?auto_255376 - BLOCK
      ?auto_255377 - BLOCK
      ?auto_255378 - BLOCK
      ?auto_255379 - BLOCK
    )
    :vars
    (
      ?auto_255380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255379 ?auto_255380 ) ( ON-TABLE ?auto_255370 ) ( ON ?auto_255371 ?auto_255370 ) ( ON ?auto_255372 ?auto_255371 ) ( ON ?auto_255373 ?auto_255372 ) ( ON ?auto_255374 ?auto_255373 ) ( ON ?auto_255375 ?auto_255374 ) ( ON ?auto_255376 ?auto_255375 ) ( ON ?auto_255377 ?auto_255376 ) ( not ( = ?auto_255370 ?auto_255371 ) ) ( not ( = ?auto_255370 ?auto_255372 ) ) ( not ( = ?auto_255370 ?auto_255373 ) ) ( not ( = ?auto_255370 ?auto_255374 ) ) ( not ( = ?auto_255370 ?auto_255375 ) ) ( not ( = ?auto_255370 ?auto_255376 ) ) ( not ( = ?auto_255370 ?auto_255377 ) ) ( not ( = ?auto_255370 ?auto_255378 ) ) ( not ( = ?auto_255370 ?auto_255379 ) ) ( not ( = ?auto_255370 ?auto_255380 ) ) ( not ( = ?auto_255371 ?auto_255372 ) ) ( not ( = ?auto_255371 ?auto_255373 ) ) ( not ( = ?auto_255371 ?auto_255374 ) ) ( not ( = ?auto_255371 ?auto_255375 ) ) ( not ( = ?auto_255371 ?auto_255376 ) ) ( not ( = ?auto_255371 ?auto_255377 ) ) ( not ( = ?auto_255371 ?auto_255378 ) ) ( not ( = ?auto_255371 ?auto_255379 ) ) ( not ( = ?auto_255371 ?auto_255380 ) ) ( not ( = ?auto_255372 ?auto_255373 ) ) ( not ( = ?auto_255372 ?auto_255374 ) ) ( not ( = ?auto_255372 ?auto_255375 ) ) ( not ( = ?auto_255372 ?auto_255376 ) ) ( not ( = ?auto_255372 ?auto_255377 ) ) ( not ( = ?auto_255372 ?auto_255378 ) ) ( not ( = ?auto_255372 ?auto_255379 ) ) ( not ( = ?auto_255372 ?auto_255380 ) ) ( not ( = ?auto_255373 ?auto_255374 ) ) ( not ( = ?auto_255373 ?auto_255375 ) ) ( not ( = ?auto_255373 ?auto_255376 ) ) ( not ( = ?auto_255373 ?auto_255377 ) ) ( not ( = ?auto_255373 ?auto_255378 ) ) ( not ( = ?auto_255373 ?auto_255379 ) ) ( not ( = ?auto_255373 ?auto_255380 ) ) ( not ( = ?auto_255374 ?auto_255375 ) ) ( not ( = ?auto_255374 ?auto_255376 ) ) ( not ( = ?auto_255374 ?auto_255377 ) ) ( not ( = ?auto_255374 ?auto_255378 ) ) ( not ( = ?auto_255374 ?auto_255379 ) ) ( not ( = ?auto_255374 ?auto_255380 ) ) ( not ( = ?auto_255375 ?auto_255376 ) ) ( not ( = ?auto_255375 ?auto_255377 ) ) ( not ( = ?auto_255375 ?auto_255378 ) ) ( not ( = ?auto_255375 ?auto_255379 ) ) ( not ( = ?auto_255375 ?auto_255380 ) ) ( not ( = ?auto_255376 ?auto_255377 ) ) ( not ( = ?auto_255376 ?auto_255378 ) ) ( not ( = ?auto_255376 ?auto_255379 ) ) ( not ( = ?auto_255376 ?auto_255380 ) ) ( not ( = ?auto_255377 ?auto_255378 ) ) ( not ( = ?auto_255377 ?auto_255379 ) ) ( not ( = ?auto_255377 ?auto_255380 ) ) ( not ( = ?auto_255378 ?auto_255379 ) ) ( not ( = ?auto_255378 ?auto_255380 ) ) ( not ( = ?auto_255379 ?auto_255380 ) ) ( CLEAR ?auto_255377 ) ( ON ?auto_255378 ?auto_255379 ) ( CLEAR ?auto_255378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_255370 ?auto_255371 ?auto_255372 ?auto_255373 ?auto_255374 ?auto_255375 ?auto_255376 ?auto_255377 ?auto_255378 )
      ( MAKE-10PILE ?auto_255370 ?auto_255371 ?auto_255372 ?auto_255373 ?auto_255374 ?auto_255375 ?auto_255376 ?auto_255377 ?auto_255378 ?auto_255379 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_255391 - BLOCK
      ?auto_255392 - BLOCK
      ?auto_255393 - BLOCK
      ?auto_255394 - BLOCK
      ?auto_255395 - BLOCK
      ?auto_255396 - BLOCK
      ?auto_255397 - BLOCK
      ?auto_255398 - BLOCK
      ?auto_255399 - BLOCK
      ?auto_255400 - BLOCK
    )
    :vars
    (
      ?auto_255401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255400 ?auto_255401 ) ( ON-TABLE ?auto_255391 ) ( ON ?auto_255392 ?auto_255391 ) ( ON ?auto_255393 ?auto_255392 ) ( ON ?auto_255394 ?auto_255393 ) ( ON ?auto_255395 ?auto_255394 ) ( ON ?auto_255396 ?auto_255395 ) ( ON ?auto_255397 ?auto_255396 ) ( ON ?auto_255398 ?auto_255397 ) ( not ( = ?auto_255391 ?auto_255392 ) ) ( not ( = ?auto_255391 ?auto_255393 ) ) ( not ( = ?auto_255391 ?auto_255394 ) ) ( not ( = ?auto_255391 ?auto_255395 ) ) ( not ( = ?auto_255391 ?auto_255396 ) ) ( not ( = ?auto_255391 ?auto_255397 ) ) ( not ( = ?auto_255391 ?auto_255398 ) ) ( not ( = ?auto_255391 ?auto_255399 ) ) ( not ( = ?auto_255391 ?auto_255400 ) ) ( not ( = ?auto_255391 ?auto_255401 ) ) ( not ( = ?auto_255392 ?auto_255393 ) ) ( not ( = ?auto_255392 ?auto_255394 ) ) ( not ( = ?auto_255392 ?auto_255395 ) ) ( not ( = ?auto_255392 ?auto_255396 ) ) ( not ( = ?auto_255392 ?auto_255397 ) ) ( not ( = ?auto_255392 ?auto_255398 ) ) ( not ( = ?auto_255392 ?auto_255399 ) ) ( not ( = ?auto_255392 ?auto_255400 ) ) ( not ( = ?auto_255392 ?auto_255401 ) ) ( not ( = ?auto_255393 ?auto_255394 ) ) ( not ( = ?auto_255393 ?auto_255395 ) ) ( not ( = ?auto_255393 ?auto_255396 ) ) ( not ( = ?auto_255393 ?auto_255397 ) ) ( not ( = ?auto_255393 ?auto_255398 ) ) ( not ( = ?auto_255393 ?auto_255399 ) ) ( not ( = ?auto_255393 ?auto_255400 ) ) ( not ( = ?auto_255393 ?auto_255401 ) ) ( not ( = ?auto_255394 ?auto_255395 ) ) ( not ( = ?auto_255394 ?auto_255396 ) ) ( not ( = ?auto_255394 ?auto_255397 ) ) ( not ( = ?auto_255394 ?auto_255398 ) ) ( not ( = ?auto_255394 ?auto_255399 ) ) ( not ( = ?auto_255394 ?auto_255400 ) ) ( not ( = ?auto_255394 ?auto_255401 ) ) ( not ( = ?auto_255395 ?auto_255396 ) ) ( not ( = ?auto_255395 ?auto_255397 ) ) ( not ( = ?auto_255395 ?auto_255398 ) ) ( not ( = ?auto_255395 ?auto_255399 ) ) ( not ( = ?auto_255395 ?auto_255400 ) ) ( not ( = ?auto_255395 ?auto_255401 ) ) ( not ( = ?auto_255396 ?auto_255397 ) ) ( not ( = ?auto_255396 ?auto_255398 ) ) ( not ( = ?auto_255396 ?auto_255399 ) ) ( not ( = ?auto_255396 ?auto_255400 ) ) ( not ( = ?auto_255396 ?auto_255401 ) ) ( not ( = ?auto_255397 ?auto_255398 ) ) ( not ( = ?auto_255397 ?auto_255399 ) ) ( not ( = ?auto_255397 ?auto_255400 ) ) ( not ( = ?auto_255397 ?auto_255401 ) ) ( not ( = ?auto_255398 ?auto_255399 ) ) ( not ( = ?auto_255398 ?auto_255400 ) ) ( not ( = ?auto_255398 ?auto_255401 ) ) ( not ( = ?auto_255399 ?auto_255400 ) ) ( not ( = ?auto_255399 ?auto_255401 ) ) ( not ( = ?auto_255400 ?auto_255401 ) ) ( CLEAR ?auto_255398 ) ( ON ?auto_255399 ?auto_255400 ) ( CLEAR ?auto_255399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_255391 ?auto_255392 ?auto_255393 ?auto_255394 ?auto_255395 ?auto_255396 ?auto_255397 ?auto_255398 ?auto_255399 )
      ( MAKE-10PILE ?auto_255391 ?auto_255392 ?auto_255393 ?auto_255394 ?auto_255395 ?auto_255396 ?auto_255397 ?auto_255398 ?auto_255399 ?auto_255400 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_255412 - BLOCK
      ?auto_255413 - BLOCK
      ?auto_255414 - BLOCK
      ?auto_255415 - BLOCK
      ?auto_255416 - BLOCK
      ?auto_255417 - BLOCK
      ?auto_255418 - BLOCK
      ?auto_255419 - BLOCK
      ?auto_255420 - BLOCK
      ?auto_255421 - BLOCK
    )
    :vars
    (
      ?auto_255422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255421 ?auto_255422 ) ( ON-TABLE ?auto_255412 ) ( ON ?auto_255413 ?auto_255412 ) ( ON ?auto_255414 ?auto_255413 ) ( ON ?auto_255415 ?auto_255414 ) ( ON ?auto_255416 ?auto_255415 ) ( ON ?auto_255417 ?auto_255416 ) ( ON ?auto_255418 ?auto_255417 ) ( not ( = ?auto_255412 ?auto_255413 ) ) ( not ( = ?auto_255412 ?auto_255414 ) ) ( not ( = ?auto_255412 ?auto_255415 ) ) ( not ( = ?auto_255412 ?auto_255416 ) ) ( not ( = ?auto_255412 ?auto_255417 ) ) ( not ( = ?auto_255412 ?auto_255418 ) ) ( not ( = ?auto_255412 ?auto_255419 ) ) ( not ( = ?auto_255412 ?auto_255420 ) ) ( not ( = ?auto_255412 ?auto_255421 ) ) ( not ( = ?auto_255412 ?auto_255422 ) ) ( not ( = ?auto_255413 ?auto_255414 ) ) ( not ( = ?auto_255413 ?auto_255415 ) ) ( not ( = ?auto_255413 ?auto_255416 ) ) ( not ( = ?auto_255413 ?auto_255417 ) ) ( not ( = ?auto_255413 ?auto_255418 ) ) ( not ( = ?auto_255413 ?auto_255419 ) ) ( not ( = ?auto_255413 ?auto_255420 ) ) ( not ( = ?auto_255413 ?auto_255421 ) ) ( not ( = ?auto_255413 ?auto_255422 ) ) ( not ( = ?auto_255414 ?auto_255415 ) ) ( not ( = ?auto_255414 ?auto_255416 ) ) ( not ( = ?auto_255414 ?auto_255417 ) ) ( not ( = ?auto_255414 ?auto_255418 ) ) ( not ( = ?auto_255414 ?auto_255419 ) ) ( not ( = ?auto_255414 ?auto_255420 ) ) ( not ( = ?auto_255414 ?auto_255421 ) ) ( not ( = ?auto_255414 ?auto_255422 ) ) ( not ( = ?auto_255415 ?auto_255416 ) ) ( not ( = ?auto_255415 ?auto_255417 ) ) ( not ( = ?auto_255415 ?auto_255418 ) ) ( not ( = ?auto_255415 ?auto_255419 ) ) ( not ( = ?auto_255415 ?auto_255420 ) ) ( not ( = ?auto_255415 ?auto_255421 ) ) ( not ( = ?auto_255415 ?auto_255422 ) ) ( not ( = ?auto_255416 ?auto_255417 ) ) ( not ( = ?auto_255416 ?auto_255418 ) ) ( not ( = ?auto_255416 ?auto_255419 ) ) ( not ( = ?auto_255416 ?auto_255420 ) ) ( not ( = ?auto_255416 ?auto_255421 ) ) ( not ( = ?auto_255416 ?auto_255422 ) ) ( not ( = ?auto_255417 ?auto_255418 ) ) ( not ( = ?auto_255417 ?auto_255419 ) ) ( not ( = ?auto_255417 ?auto_255420 ) ) ( not ( = ?auto_255417 ?auto_255421 ) ) ( not ( = ?auto_255417 ?auto_255422 ) ) ( not ( = ?auto_255418 ?auto_255419 ) ) ( not ( = ?auto_255418 ?auto_255420 ) ) ( not ( = ?auto_255418 ?auto_255421 ) ) ( not ( = ?auto_255418 ?auto_255422 ) ) ( not ( = ?auto_255419 ?auto_255420 ) ) ( not ( = ?auto_255419 ?auto_255421 ) ) ( not ( = ?auto_255419 ?auto_255422 ) ) ( not ( = ?auto_255420 ?auto_255421 ) ) ( not ( = ?auto_255420 ?auto_255422 ) ) ( not ( = ?auto_255421 ?auto_255422 ) ) ( ON ?auto_255420 ?auto_255421 ) ( CLEAR ?auto_255418 ) ( ON ?auto_255419 ?auto_255420 ) ( CLEAR ?auto_255419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_255412 ?auto_255413 ?auto_255414 ?auto_255415 ?auto_255416 ?auto_255417 ?auto_255418 ?auto_255419 )
      ( MAKE-10PILE ?auto_255412 ?auto_255413 ?auto_255414 ?auto_255415 ?auto_255416 ?auto_255417 ?auto_255418 ?auto_255419 ?auto_255420 ?auto_255421 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_255433 - BLOCK
      ?auto_255434 - BLOCK
      ?auto_255435 - BLOCK
      ?auto_255436 - BLOCK
      ?auto_255437 - BLOCK
      ?auto_255438 - BLOCK
      ?auto_255439 - BLOCK
      ?auto_255440 - BLOCK
      ?auto_255441 - BLOCK
      ?auto_255442 - BLOCK
    )
    :vars
    (
      ?auto_255443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255442 ?auto_255443 ) ( ON-TABLE ?auto_255433 ) ( ON ?auto_255434 ?auto_255433 ) ( ON ?auto_255435 ?auto_255434 ) ( ON ?auto_255436 ?auto_255435 ) ( ON ?auto_255437 ?auto_255436 ) ( ON ?auto_255438 ?auto_255437 ) ( ON ?auto_255439 ?auto_255438 ) ( not ( = ?auto_255433 ?auto_255434 ) ) ( not ( = ?auto_255433 ?auto_255435 ) ) ( not ( = ?auto_255433 ?auto_255436 ) ) ( not ( = ?auto_255433 ?auto_255437 ) ) ( not ( = ?auto_255433 ?auto_255438 ) ) ( not ( = ?auto_255433 ?auto_255439 ) ) ( not ( = ?auto_255433 ?auto_255440 ) ) ( not ( = ?auto_255433 ?auto_255441 ) ) ( not ( = ?auto_255433 ?auto_255442 ) ) ( not ( = ?auto_255433 ?auto_255443 ) ) ( not ( = ?auto_255434 ?auto_255435 ) ) ( not ( = ?auto_255434 ?auto_255436 ) ) ( not ( = ?auto_255434 ?auto_255437 ) ) ( not ( = ?auto_255434 ?auto_255438 ) ) ( not ( = ?auto_255434 ?auto_255439 ) ) ( not ( = ?auto_255434 ?auto_255440 ) ) ( not ( = ?auto_255434 ?auto_255441 ) ) ( not ( = ?auto_255434 ?auto_255442 ) ) ( not ( = ?auto_255434 ?auto_255443 ) ) ( not ( = ?auto_255435 ?auto_255436 ) ) ( not ( = ?auto_255435 ?auto_255437 ) ) ( not ( = ?auto_255435 ?auto_255438 ) ) ( not ( = ?auto_255435 ?auto_255439 ) ) ( not ( = ?auto_255435 ?auto_255440 ) ) ( not ( = ?auto_255435 ?auto_255441 ) ) ( not ( = ?auto_255435 ?auto_255442 ) ) ( not ( = ?auto_255435 ?auto_255443 ) ) ( not ( = ?auto_255436 ?auto_255437 ) ) ( not ( = ?auto_255436 ?auto_255438 ) ) ( not ( = ?auto_255436 ?auto_255439 ) ) ( not ( = ?auto_255436 ?auto_255440 ) ) ( not ( = ?auto_255436 ?auto_255441 ) ) ( not ( = ?auto_255436 ?auto_255442 ) ) ( not ( = ?auto_255436 ?auto_255443 ) ) ( not ( = ?auto_255437 ?auto_255438 ) ) ( not ( = ?auto_255437 ?auto_255439 ) ) ( not ( = ?auto_255437 ?auto_255440 ) ) ( not ( = ?auto_255437 ?auto_255441 ) ) ( not ( = ?auto_255437 ?auto_255442 ) ) ( not ( = ?auto_255437 ?auto_255443 ) ) ( not ( = ?auto_255438 ?auto_255439 ) ) ( not ( = ?auto_255438 ?auto_255440 ) ) ( not ( = ?auto_255438 ?auto_255441 ) ) ( not ( = ?auto_255438 ?auto_255442 ) ) ( not ( = ?auto_255438 ?auto_255443 ) ) ( not ( = ?auto_255439 ?auto_255440 ) ) ( not ( = ?auto_255439 ?auto_255441 ) ) ( not ( = ?auto_255439 ?auto_255442 ) ) ( not ( = ?auto_255439 ?auto_255443 ) ) ( not ( = ?auto_255440 ?auto_255441 ) ) ( not ( = ?auto_255440 ?auto_255442 ) ) ( not ( = ?auto_255440 ?auto_255443 ) ) ( not ( = ?auto_255441 ?auto_255442 ) ) ( not ( = ?auto_255441 ?auto_255443 ) ) ( not ( = ?auto_255442 ?auto_255443 ) ) ( ON ?auto_255441 ?auto_255442 ) ( CLEAR ?auto_255439 ) ( ON ?auto_255440 ?auto_255441 ) ( CLEAR ?auto_255440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_255433 ?auto_255434 ?auto_255435 ?auto_255436 ?auto_255437 ?auto_255438 ?auto_255439 ?auto_255440 )
      ( MAKE-10PILE ?auto_255433 ?auto_255434 ?auto_255435 ?auto_255436 ?auto_255437 ?auto_255438 ?auto_255439 ?auto_255440 ?auto_255441 ?auto_255442 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_255454 - BLOCK
      ?auto_255455 - BLOCK
      ?auto_255456 - BLOCK
      ?auto_255457 - BLOCK
      ?auto_255458 - BLOCK
      ?auto_255459 - BLOCK
      ?auto_255460 - BLOCK
      ?auto_255461 - BLOCK
      ?auto_255462 - BLOCK
      ?auto_255463 - BLOCK
    )
    :vars
    (
      ?auto_255464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255463 ?auto_255464 ) ( ON-TABLE ?auto_255454 ) ( ON ?auto_255455 ?auto_255454 ) ( ON ?auto_255456 ?auto_255455 ) ( ON ?auto_255457 ?auto_255456 ) ( ON ?auto_255458 ?auto_255457 ) ( ON ?auto_255459 ?auto_255458 ) ( not ( = ?auto_255454 ?auto_255455 ) ) ( not ( = ?auto_255454 ?auto_255456 ) ) ( not ( = ?auto_255454 ?auto_255457 ) ) ( not ( = ?auto_255454 ?auto_255458 ) ) ( not ( = ?auto_255454 ?auto_255459 ) ) ( not ( = ?auto_255454 ?auto_255460 ) ) ( not ( = ?auto_255454 ?auto_255461 ) ) ( not ( = ?auto_255454 ?auto_255462 ) ) ( not ( = ?auto_255454 ?auto_255463 ) ) ( not ( = ?auto_255454 ?auto_255464 ) ) ( not ( = ?auto_255455 ?auto_255456 ) ) ( not ( = ?auto_255455 ?auto_255457 ) ) ( not ( = ?auto_255455 ?auto_255458 ) ) ( not ( = ?auto_255455 ?auto_255459 ) ) ( not ( = ?auto_255455 ?auto_255460 ) ) ( not ( = ?auto_255455 ?auto_255461 ) ) ( not ( = ?auto_255455 ?auto_255462 ) ) ( not ( = ?auto_255455 ?auto_255463 ) ) ( not ( = ?auto_255455 ?auto_255464 ) ) ( not ( = ?auto_255456 ?auto_255457 ) ) ( not ( = ?auto_255456 ?auto_255458 ) ) ( not ( = ?auto_255456 ?auto_255459 ) ) ( not ( = ?auto_255456 ?auto_255460 ) ) ( not ( = ?auto_255456 ?auto_255461 ) ) ( not ( = ?auto_255456 ?auto_255462 ) ) ( not ( = ?auto_255456 ?auto_255463 ) ) ( not ( = ?auto_255456 ?auto_255464 ) ) ( not ( = ?auto_255457 ?auto_255458 ) ) ( not ( = ?auto_255457 ?auto_255459 ) ) ( not ( = ?auto_255457 ?auto_255460 ) ) ( not ( = ?auto_255457 ?auto_255461 ) ) ( not ( = ?auto_255457 ?auto_255462 ) ) ( not ( = ?auto_255457 ?auto_255463 ) ) ( not ( = ?auto_255457 ?auto_255464 ) ) ( not ( = ?auto_255458 ?auto_255459 ) ) ( not ( = ?auto_255458 ?auto_255460 ) ) ( not ( = ?auto_255458 ?auto_255461 ) ) ( not ( = ?auto_255458 ?auto_255462 ) ) ( not ( = ?auto_255458 ?auto_255463 ) ) ( not ( = ?auto_255458 ?auto_255464 ) ) ( not ( = ?auto_255459 ?auto_255460 ) ) ( not ( = ?auto_255459 ?auto_255461 ) ) ( not ( = ?auto_255459 ?auto_255462 ) ) ( not ( = ?auto_255459 ?auto_255463 ) ) ( not ( = ?auto_255459 ?auto_255464 ) ) ( not ( = ?auto_255460 ?auto_255461 ) ) ( not ( = ?auto_255460 ?auto_255462 ) ) ( not ( = ?auto_255460 ?auto_255463 ) ) ( not ( = ?auto_255460 ?auto_255464 ) ) ( not ( = ?auto_255461 ?auto_255462 ) ) ( not ( = ?auto_255461 ?auto_255463 ) ) ( not ( = ?auto_255461 ?auto_255464 ) ) ( not ( = ?auto_255462 ?auto_255463 ) ) ( not ( = ?auto_255462 ?auto_255464 ) ) ( not ( = ?auto_255463 ?auto_255464 ) ) ( ON ?auto_255462 ?auto_255463 ) ( ON ?auto_255461 ?auto_255462 ) ( CLEAR ?auto_255459 ) ( ON ?auto_255460 ?auto_255461 ) ( CLEAR ?auto_255460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_255454 ?auto_255455 ?auto_255456 ?auto_255457 ?auto_255458 ?auto_255459 ?auto_255460 )
      ( MAKE-10PILE ?auto_255454 ?auto_255455 ?auto_255456 ?auto_255457 ?auto_255458 ?auto_255459 ?auto_255460 ?auto_255461 ?auto_255462 ?auto_255463 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_255475 - BLOCK
      ?auto_255476 - BLOCK
      ?auto_255477 - BLOCK
      ?auto_255478 - BLOCK
      ?auto_255479 - BLOCK
      ?auto_255480 - BLOCK
      ?auto_255481 - BLOCK
      ?auto_255482 - BLOCK
      ?auto_255483 - BLOCK
      ?auto_255484 - BLOCK
    )
    :vars
    (
      ?auto_255485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255484 ?auto_255485 ) ( ON-TABLE ?auto_255475 ) ( ON ?auto_255476 ?auto_255475 ) ( ON ?auto_255477 ?auto_255476 ) ( ON ?auto_255478 ?auto_255477 ) ( ON ?auto_255479 ?auto_255478 ) ( ON ?auto_255480 ?auto_255479 ) ( not ( = ?auto_255475 ?auto_255476 ) ) ( not ( = ?auto_255475 ?auto_255477 ) ) ( not ( = ?auto_255475 ?auto_255478 ) ) ( not ( = ?auto_255475 ?auto_255479 ) ) ( not ( = ?auto_255475 ?auto_255480 ) ) ( not ( = ?auto_255475 ?auto_255481 ) ) ( not ( = ?auto_255475 ?auto_255482 ) ) ( not ( = ?auto_255475 ?auto_255483 ) ) ( not ( = ?auto_255475 ?auto_255484 ) ) ( not ( = ?auto_255475 ?auto_255485 ) ) ( not ( = ?auto_255476 ?auto_255477 ) ) ( not ( = ?auto_255476 ?auto_255478 ) ) ( not ( = ?auto_255476 ?auto_255479 ) ) ( not ( = ?auto_255476 ?auto_255480 ) ) ( not ( = ?auto_255476 ?auto_255481 ) ) ( not ( = ?auto_255476 ?auto_255482 ) ) ( not ( = ?auto_255476 ?auto_255483 ) ) ( not ( = ?auto_255476 ?auto_255484 ) ) ( not ( = ?auto_255476 ?auto_255485 ) ) ( not ( = ?auto_255477 ?auto_255478 ) ) ( not ( = ?auto_255477 ?auto_255479 ) ) ( not ( = ?auto_255477 ?auto_255480 ) ) ( not ( = ?auto_255477 ?auto_255481 ) ) ( not ( = ?auto_255477 ?auto_255482 ) ) ( not ( = ?auto_255477 ?auto_255483 ) ) ( not ( = ?auto_255477 ?auto_255484 ) ) ( not ( = ?auto_255477 ?auto_255485 ) ) ( not ( = ?auto_255478 ?auto_255479 ) ) ( not ( = ?auto_255478 ?auto_255480 ) ) ( not ( = ?auto_255478 ?auto_255481 ) ) ( not ( = ?auto_255478 ?auto_255482 ) ) ( not ( = ?auto_255478 ?auto_255483 ) ) ( not ( = ?auto_255478 ?auto_255484 ) ) ( not ( = ?auto_255478 ?auto_255485 ) ) ( not ( = ?auto_255479 ?auto_255480 ) ) ( not ( = ?auto_255479 ?auto_255481 ) ) ( not ( = ?auto_255479 ?auto_255482 ) ) ( not ( = ?auto_255479 ?auto_255483 ) ) ( not ( = ?auto_255479 ?auto_255484 ) ) ( not ( = ?auto_255479 ?auto_255485 ) ) ( not ( = ?auto_255480 ?auto_255481 ) ) ( not ( = ?auto_255480 ?auto_255482 ) ) ( not ( = ?auto_255480 ?auto_255483 ) ) ( not ( = ?auto_255480 ?auto_255484 ) ) ( not ( = ?auto_255480 ?auto_255485 ) ) ( not ( = ?auto_255481 ?auto_255482 ) ) ( not ( = ?auto_255481 ?auto_255483 ) ) ( not ( = ?auto_255481 ?auto_255484 ) ) ( not ( = ?auto_255481 ?auto_255485 ) ) ( not ( = ?auto_255482 ?auto_255483 ) ) ( not ( = ?auto_255482 ?auto_255484 ) ) ( not ( = ?auto_255482 ?auto_255485 ) ) ( not ( = ?auto_255483 ?auto_255484 ) ) ( not ( = ?auto_255483 ?auto_255485 ) ) ( not ( = ?auto_255484 ?auto_255485 ) ) ( ON ?auto_255483 ?auto_255484 ) ( ON ?auto_255482 ?auto_255483 ) ( CLEAR ?auto_255480 ) ( ON ?auto_255481 ?auto_255482 ) ( CLEAR ?auto_255481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_255475 ?auto_255476 ?auto_255477 ?auto_255478 ?auto_255479 ?auto_255480 ?auto_255481 )
      ( MAKE-10PILE ?auto_255475 ?auto_255476 ?auto_255477 ?auto_255478 ?auto_255479 ?auto_255480 ?auto_255481 ?auto_255482 ?auto_255483 ?auto_255484 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_255496 - BLOCK
      ?auto_255497 - BLOCK
      ?auto_255498 - BLOCK
      ?auto_255499 - BLOCK
      ?auto_255500 - BLOCK
      ?auto_255501 - BLOCK
      ?auto_255502 - BLOCK
      ?auto_255503 - BLOCK
      ?auto_255504 - BLOCK
      ?auto_255505 - BLOCK
    )
    :vars
    (
      ?auto_255506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255505 ?auto_255506 ) ( ON-TABLE ?auto_255496 ) ( ON ?auto_255497 ?auto_255496 ) ( ON ?auto_255498 ?auto_255497 ) ( ON ?auto_255499 ?auto_255498 ) ( ON ?auto_255500 ?auto_255499 ) ( not ( = ?auto_255496 ?auto_255497 ) ) ( not ( = ?auto_255496 ?auto_255498 ) ) ( not ( = ?auto_255496 ?auto_255499 ) ) ( not ( = ?auto_255496 ?auto_255500 ) ) ( not ( = ?auto_255496 ?auto_255501 ) ) ( not ( = ?auto_255496 ?auto_255502 ) ) ( not ( = ?auto_255496 ?auto_255503 ) ) ( not ( = ?auto_255496 ?auto_255504 ) ) ( not ( = ?auto_255496 ?auto_255505 ) ) ( not ( = ?auto_255496 ?auto_255506 ) ) ( not ( = ?auto_255497 ?auto_255498 ) ) ( not ( = ?auto_255497 ?auto_255499 ) ) ( not ( = ?auto_255497 ?auto_255500 ) ) ( not ( = ?auto_255497 ?auto_255501 ) ) ( not ( = ?auto_255497 ?auto_255502 ) ) ( not ( = ?auto_255497 ?auto_255503 ) ) ( not ( = ?auto_255497 ?auto_255504 ) ) ( not ( = ?auto_255497 ?auto_255505 ) ) ( not ( = ?auto_255497 ?auto_255506 ) ) ( not ( = ?auto_255498 ?auto_255499 ) ) ( not ( = ?auto_255498 ?auto_255500 ) ) ( not ( = ?auto_255498 ?auto_255501 ) ) ( not ( = ?auto_255498 ?auto_255502 ) ) ( not ( = ?auto_255498 ?auto_255503 ) ) ( not ( = ?auto_255498 ?auto_255504 ) ) ( not ( = ?auto_255498 ?auto_255505 ) ) ( not ( = ?auto_255498 ?auto_255506 ) ) ( not ( = ?auto_255499 ?auto_255500 ) ) ( not ( = ?auto_255499 ?auto_255501 ) ) ( not ( = ?auto_255499 ?auto_255502 ) ) ( not ( = ?auto_255499 ?auto_255503 ) ) ( not ( = ?auto_255499 ?auto_255504 ) ) ( not ( = ?auto_255499 ?auto_255505 ) ) ( not ( = ?auto_255499 ?auto_255506 ) ) ( not ( = ?auto_255500 ?auto_255501 ) ) ( not ( = ?auto_255500 ?auto_255502 ) ) ( not ( = ?auto_255500 ?auto_255503 ) ) ( not ( = ?auto_255500 ?auto_255504 ) ) ( not ( = ?auto_255500 ?auto_255505 ) ) ( not ( = ?auto_255500 ?auto_255506 ) ) ( not ( = ?auto_255501 ?auto_255502 ) ) ( not ( = ?auto_255501 ?auto_255503 ) ) ( not ( = ?auto_255501 ?auto_255504 ) ) ( not ( = ?auto_255501 ?auto_255505 ) ) ( not ( = ?auto_255501 ?auto_255506 ) ) ( not ( = ?auto_255502 ?auto_255503 ) ) ( not ( = ?auto_255502 ?auto_255504 ) ) ( not ( = ?auto_255502 ?auto_255505 ) ) ( not ( = ?auto_255502 ?auto_255506 ) ) ( not ( = ?auto_255503 ?auto_255504 ) ) ( not ( = ?auto_255503 ?auto_255505 ) ) ( not ( = ?auto_255503 ?auto_255506 ) ) ( not ( = ?auto_255504 ?auto_255505 ) ) ( not ( = ?auto_255504 ?auto_255506 ) ) ( not ( = ?auto_255505 ?auto_255506 ) ) ( ON ?auto_255504 ?auto_255505 ) ( ON ?auto_255503 ?auto_255504 ) ( ON ?auto_255502 ?auto_255503 ) ( CLEAR ?auto_255500 ) ( ON ?auto_255501 ?auto_255502 ) ( CLEAR ?auto_255501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_255496 ?auto_255497 ?auto_255498 ?auto_255499 ?auto_255500 ?auto_255501 )
      ( MAKE-10PILE ?auto_255496 ?auto_255497 ?auto_255498 ?auto_255499 ?auto_255500 ?auto_255501 ?auto_255502 ?auto_255503 ?auto_255504 ?auto_255505 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_255517 - BLOCK
      ?auto_255518 - BLOCK
      ?auto_255519 - BLOCK
      ?auto_255520 - BLOCK
      ?auto_255521 - BLOCK
      ?auto_255522 - BLOCK
      ?auto_255523 - BLOCK
      ?auto_255524 - BLOCK
      ?auto_255525 - BLOCK
      ?auto_255526 - BLOCK
    )
    :vars
    (
      ?auto_255527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255526 ?auto_255527 ) ( ON-TABLE ?auto_255517 ) ( ON ?auto_255518 ?auto_255517 ) ( ON ?auto_255519 ?auto_255518 ) ( ON ?auto_255520 ?auto_255519 ) ( ON ?auto_255521 ?auto_255520 ) ( not ( = ?auto_255517 ?auto_255518 ) ) ( not ( = ?auto_255517 ?auto_255519 ) ) ( not ( = ?auto_255517 ?auto_255520 ) ) ( not ( = ?auto_255517 ?auto_255521 ) ) ( not ( = ?auto_255517 ?auto_255522 ) ) ( not ( = ?auto_255517 ?auto_255523 ) ) ( not ( = ?auto_255517 ?auto_255524 ) ) ( not ( = ?auto_255517 ?auto_255525 ) ) ( not ( = ?auto_255517 ?auto_255526 ) ) ( not ( = ?auto_255517 ?auto_255527 ) ) ( not ( = ?auto_255518 ?auto_255519 ) ) ( not ( = ?auto_255518 ?auto_255520 ) ) ( not ( = ?auto_255518 ?auto_255521 ) ) ( not ( = ?auto_255518 ?auto_255522 ) ) ( not ( = ?auto_255518 ?auto_255523 ) ) ( not ( = ?auto_255518 ?auto_255524 ) ) ( not ( = ?auto_255518 ?auto_255525 ) ) ( not ( = ?auto_255518 ?auto_255526 ) ) ( not ( = ?auto_255518 ?auto_255527 ) ) ( not ( = ?auto_255519 ?auto_255520 ) ) ( not ( = ?auto_255519 ?auto_255521 ) ) ( not ( = ?auto_255519 ?auto_255522 ) ) ( not ( = ?auto_255519 ?auto_255523 ) ) ( not ( = ?auto_255519 ?auto_255524 ) ) ( not ( = ?auto_255519 ?auto_255525 ) ) ( not ( = ?auto_255519 ?auto_255526 ) ) ( not ( = ?auto_255519 ?auto_255527 ) ) ( not ( = ?auto_255520 ?auto_255521 ) ) ( not ( = ?auto_255520 ?auto_255522 ) ) ( not ( = ?auto_255520 ?auto_255523 ) ) ( not ( = ?auto_255520 ?auto_255524 ) ) ( not ( = ?auto_255520 ?auto_255525 ) ) ( not ( = ?auto_255520 ?auto_255526 ) ) ( not ( = ?auto_255520 ?auto_255527 ) ) ( not ( = ?auto_255521 ?auto_255522 ) ) ( not ( = ?auto_255521 ?auto_255523 ) ) ( not ( = ?auto_255521 ?auto_255524 ) ) ( not ( = ?auto_255521 ?auto_255525 ) ) ( not ( = ?auto_255521 ?auto_255526 ) ) ( not ( = ?auto_255521 ?auto_255527 ) ) ( not ( = ?auto_255522 ?auto_255523 ) ) ( not ( = ?auto_255522 ?auto_255524 ) ) ( not ( = ?auto_255522 ?auto_255525 ) ) ( not ( = ?auto_255522 ?auto_255526 ) ) ( not ( = ?auto_255522 ?auto_255527 ) ) ( not ( = ?auto_255523 ?auto_255524 ) ) ( not ( = ?auto_255523 ?auto_255525 ) ) ( not ( = ?auto_255523 ?auto_255526 ) ) ( not ( = ?auto_255523 ?auto_255527 ) ) ( not ( = ?auto_255524 ?auto_255525 ) ) ( not ( = ?auto_255524 ?auto_255526 ) ) ( not ( = ?auto_255524 ?auto_255527 ) ) ( not ( = ?auto_255525 ?auto_255526 ) ) ( not ( = ?auto_255525 ?auto_255527 ) ) ( not ( = ?auto_255526 ?auto_255527 ) ) ( ON ?auto_255525 ?auto_255526 ) ( ON ?auto_255524 ?auto_255525 ) ( ON ?auto_255523 ?auto_255524 ) ( CLEAR ?auto_255521 ) ( ON ?auto_255522 ?auto_255523 ) ( CLEAR ?auto_255522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_255517 ?auto_255518 ?auto_255519 ?auto_255520 ?auto_255521 ?auto_255522 )
      ( MAKE-10PILE ?auto_255517 ?auto_255518 ?auto_255519 ?auto_255520 ?auto_255521 ?auto_255522 ?auto_255523 ?auto_255524 ?auto_255525 ?auto_255526 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_255538 - BLOCK
      ?auto_255539 - BLOCK
      ?auto_255540 - BLOCK
      ?auto_255541 - BLOCK
      ?auto_255542 - BLOCK
      ?auto_255543 - BLOCK
      ?auto_255544 - BLOCK
      ?auto_255545 - BLOCK
      ?auto_255546 - BLOCK
      ?auto_255547 - BLOCK
    )
    :vars
    (
      ?auto_255548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255547 ?auto_255548 ) ( ON-TABLE ?auto_255538 ) ( ON ?auto_255539 ?auto_255538 ) ( ON ?auto_255540 ?auto_255539 ) ( ON ?auto_255541 ?auto_255540 ) ( not ( = ?auto_255538 ?auto_255539 ) ) ( not ( = ?auto_255538 ?auto_255540 ) ) ( not ( = ?auto_255538 ?auto_255541 ) ) ( not ( = ?auto_255538 ?auto_255542 ) ) ( not ( = ?auto_255538 ?auto_255543 ) ) ( not ( = ?auto_255538 ?auto_255544 ) ) ( not ( = ?auto_255538 ?auto_255545 ) ) ( not ( = ?auto_255538 ?auto_255546 ) ) ( not ( = ?auto_255538 ?auto_255547 ) ) ( not ( = ?auto_255538 ?auto_255548 ) ) ( not ( = ?auto_255539 ?auto_255540 ) ) ( not ( = ?auto_255539 ?auto_255541 ) ) ( not ( = ?auto_255539 ?auto_255542 ) ) ( not ( = ?auto_255539 ?auto_255543 ) ) ( not ( = ?auto_255539 ?auto_255544 ) ) ( not ( = ?auto_255539 ?auto_255545 ) ) ( not ( = ?auto_255539 ?auto_255546 ) ) ( not ( = ?auto_255539 ?auto_255547 ) ) ( not ( = ?auto_255539 ?auto_255548 ) ) ( not ( = ?auto_255540 ?auto_255541 ) ) ( not ( = ?auto_255540 ?auto_255542 ) ) ( not ( = ?auto_255540 ?auto_255543 ) ) ( not ( = ?auto_255540 ?auto_255544 ) ) ( not ( = ?auto_255540 ?auto_255545 ) ) ( not ( = ?auto_255540 ?auto_255546 ) ) ( not ( = ?auto_255540 ?auto_255547 ) ) ( not ( = ?auto_255540 ?auto_255548 ) ) ( not ( = ?auto_255541 ?auto_255542 ) ) ( not ( = ?auto_255541 ?auto_255543 ) ) ( not ( = ?auto_255541 ?auto_255544 ) ) ( not ( = ?auto_255541 ?auto_255545 ) ) ( not ( = ?auto_255541 ?auto_255546 ) ) ( not ( = ?auto_255541 ?auto_255547 ) ) ( not ( = ?auto_255541 ?auto_255548 ) ) ( not ( = ?auto_255542 ?auto_255543 ) ) ( not ( = ?auto_255542 ?auto_255544 ) ) ( not ( = ?auto_255542 ?auto_255545 ) ) ( not ( = ?auto_255542 ?auto_255546 ) ) ( not ( = ?auto_255542 ?auto_255547 ) ) ( not ( = ?auto_255542 ?auto_255548 ) ) ( not ( = ?auto_255543 ?auto_255544 ) ) ( not ( = ?auto_255543 ?auto_255545 ) ) ( not ( = ?auto_255543 ?auto_255546 ) ) ( not ( = ?auto_255543 ?auto_255547 ) ) ( not ( = ?auto_255543 ?auto_255548 ) ) ( not ( = ?auto_255544 ?auto_255545 ) ) ( not ( = ?auto_255544 ?auto_255546 ) ) ( not ( = ?auto_255544 ?auto_255547 ) ) ( not ( = ?auto_255544 ?auto_255548 ) ) ( not ( = ?auto_255545 ?auto_255546 ) ) ( not ( = ?auto_255545 ?auto_255547 ) ) ( not ( = ?auto_255545 ?auto_255548 ) ) ( not ( = ?auto_255546 ?auto_255547 ) ) ( not ( = ?auto_255546 ?auto_255548 ) ) ( not ( = ?auto_255547 ?auto_255548 ) ) ( ON ?auto_255546 ?auto_255547 ) ( ON ?auto_255545 ?auto_255546 ) ( ON ?auto_255544 ?auto_255545 ) ( ON ?auto_255543 ?auto_255544 ) ( CLEAR ?auto_255541 ) ( ON ?auto_255542 ?auto_255543 ) ( CLEAR ?auto_255542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_255538 ?auto_255539 ?auto_255540 ?auto_255541 ?auto_255542 )
      ( MAKE-10PILE ?auto_255538 ?auto_255539 ?auto_255540 ?auto_255541 ?auto_255542 ?auto_255543 ?auto_255544 ?auto_255545 ?auto_255546 ?auto_255547 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_255559 - BLOCK
      ?auto_255560 - BLOCK
      ?auto_255561 - BLOCK
      ?auto_255562 - BLOCK
      ?auto_255563 - BLOCK
      ?auto_255564 - BLOCK
      ?auto_255565 - BLOCK
      ?auto_255566 - BLOCK
      ?auto_255567 - BLOCK
      ?auto_255568 - BLOCK
    )
    :vars
    (
      ?auto_255569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255568 ?auto_255569 ) ( ON-TABLE ?auto_255559 ) ( ON ?auto_255560 ?auto_255559 ) ( ON ?auto_255561 ?auto_255560 ) ( ON ?auto_255562 ?auto_255561 ) ( not ( = ?auto_255559 ?auto_255560 ) ) ( not ( = ?auto_255559 ?auto_255561 ) ) ( not ( = ?auto_255559 ?auto_255562 ) ) ( not ( = ?auto_255559 ?auto_255563 ) ) ( not ( = ?auto_255559 ?auto_255564 ) ) ( not ( = ?auto_255559 ?auto_255565 ) ) ( not ( = ?auto_255559 ?auto_255566 ) ) ( not ( = ?auto_255559 ?auto_255567 ) ) ( not ( = ?auto_255559 ?auto_255568 ) ) ( not ( = ?auto_255559 ?auto_255569 ) ) ( not ( = ?auto_255560 ?auto_255561 ) ) ( not ( = ?auto_255560 ?auto_255562 ) ) ( not ( = ?auto_255560 ?auto_255563 ) ) ( not ( = ?auto_255560 ?auto_255564 ) ) ( not ( = ?auto_255560 ?auto_255565 ) ) ( not ( = ?auto_255560 ?auto_255566 ) ) ( not ( = ?auto_255560 ?auto_255567 ) ) ( not ( = ?auto_255560 ?auto_255568 ) ) ( not ( = ?auto_255560 ?auto_255569 ) ) ( not ( = ?auto_255561 ?auto_255562 ) ) ( not ( = ?auto_255561 ?auto_255563 ) ) ( not ( = ?auto_255561 ?auto_255564 ) ) ( not ( = ?auto_255561 ?auto_255565 ) ) ( not ( = ?auto_255561 ?auto_255566 ) ) ( not ( = ?auto_255561 ?auto_255567 ) ) ( not ( = ?auto_255561 ?auto_255568 ) ) ( not ( = ?auto_255561 ?auto_255569 ) ) ( not ( = ?auto_255562 ?auto_255563 ) ) ( not ( = ?auto_255562 ?auto_255564 ) ) ( not ( = ?auto_255562 ?auto_255565 ) ) ( not ( = ?auto_255562 ?auto_255566 ) ) ( not ( = ?auto_255562 ?auto_255567 ) ) ( not ( = ?auto_255562 ?auto_255568 ) ) ( not ( = ?auto_255562 ?auto_255569 ) ) ( not ( = ?auto_255563 ?auto_255564 ) ) ( not ( = ?auto_255563 ?auto_255565 ) ) ( not ( = ?auto_255563 ?auto_255566 ) ) ( not ( = ?auto_255563 ?auto_255567 ) ) ( not ( = ?auto_255563 ?auto_255568 ) ) ( not ( = ?auto_255563 ?auto_255569 ) ) ( not ( = ?auto_255564 ?auto_255565 ) ) ( not ( = ?auto_255564 ?auto_255566 ) ) ( not ( = ?auto_255564 ?auto_255567 ) ) ( not ( = ?auto_255564 ?auto_255568 ) ) ( not ( = ?auto_255564 ?auto_255569 ) ) ( not ( = ?auto_255565 ?auto_255566 ) ) ( not ( = ?auto_255565 ?auto_255567 ) ) ( not ( = ?auto_255565 ?auto_255568 ) ) ( not ( = ?auto_255565 ?auto_255569 ) ) ( not ( = ?auto_255566 ?auto_255567 ) ) ( not ( = ?auto_255566 ?auto_255568 ) ) ( not ( = ?auto_255566 ?auto_255569 ) ) ( not ( = ?auto_255567 ?auto_255568 ) ) ( not ( = ?auto_255567 ?auto_255569 ) ) ( not ( = ?auto_255568 ?auto_255569 ) ) ( ON ?auto_255567 ?auto_255568 ) ( ON ?auto_255566 ?auto_255567 ) ( ON ?auto_255565 ?auto_255566 ) ( ON ?auto_255564 ?auto_255565 ) ( CLEAR ?auto_255562 ) ( ON ?auto_255563 ?auto_255564 ) ( CLEAR ?auto_255563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_255559 ?auto_255560 ?auto_255561 ?auto_255562 ?auto_255563 )
      ( MAKE-10PILE ?auto_255559 ?auto_255560 ?auto_255561 ?auto_255562 ?auto_255563 ?auto_255564 ?auto_255565 ?auto_255566 ?auto_255567 ?auto_255568 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_255580 - BLOCK
      ?auto_255581 - BLOCK
      ?auto_255582 - BLOCK
      ?auto_255583 - BLOCK
      ?auto_255584 - BLOCK
      ?auto_255585 - BLOCK
      ?auto_255586 - BLOCK
      ?auto_255587 - BLOCK
      ?auto_255588 - BLOCK
      ?auto_255589 - BLOCK
    )
    :vars
    (
      ?auto_255590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255589 ?auto_255590 ) ( ON-TABLE ?auto_255580 ) ( ON ?auto_255581 ?auto_255580 ) ( ON ?auto_255582 ?auto_255581 ) ( not ( = ?auto_255580 ?auto_255581 ) ) ( not ( = ?auto_255580 ?auto_255582 ) ) ( not ( = ?auto_255580 ?auto_255583 ) ) ( not ( = ?auto_255580 ?auto_255584 ) ) ( not ( = ?auto_255580 ?auto_255585 ) ) ( not ( = ?auto_255580 ?auto_255586 ) ) ( not ( = ?auto_255580 ?auto_255587 ) ) ( not ( = ?auto_255580 ?auto_255588 ) ) ( not ( = ?auto_255580 ?auto_255589 ) ) ( not ( = ?auto_255580 ?auto_255590 ) ) ( not ( = ?auto_255581 ?auto_255582 ) ) ( not ( = ?auto_255581 ?auto_255583 ) ) ( not ( = ?auto_255581 ?auto_255584 ) ) ( not ( = ?auto_255581 ?auto_255585 ) ) ( not ( = ?auto_255581 ?auto_255586 ) ) ( not ( = ?auto_255581 ?auto_255587 ) ) ( not ( = ?auto_255581 ?auto_255588 ) ) ( not ( = ?auto_255581 ?auto_255589 ) ) ( not ( = ?auto_255581 ?auto_255590 ) ) ( not ( = ?auto_255582 ?auto_255583 ) ) ( not ( = ?auto_255582 ?auto_255584 ) ) ( not ( = ?auto_255582 ?auto_255585 ) ) ( not ( = ?auto_255582 ?auto_255586 ) ) ( not ( = ?auto_255582 ?auto_255587 ) ) ( not ( = ?auto_255582 ?auto_255588 ) ) ( not ( = ?auto_255582 ?auto_255589 ) ) ( not ( = ?auto_255582 ?auto_255590 ) ) ( not ( = ?auto_255583 ?auto_255584 ) ) ( not ( = ?auto_255583 ?auto_255585 ) ) ( not ( = ?auto_255583 ?auto_255586 ) ) ( not ( = ?auto_255583 ?auto_255587 ) ) ( not ( = ?auto_255583 ?auto_255588 ) ) ( not ( = ?auto_255583 ?auto_255589 ) ) ( not ( = ?auto_255583 ?auto_255590 ) ) ( not ( = ?auto_255584 ?auto_255585 ) ) ( not ( = ?auto_255584 ?auto_255586 ) ) ( not ( = ?auto_255584 ?auto_255587 ) ) ( not ( = ?auto_255584 ?auto_255588 ) ) ( not ( = ?auto_255584 ?auto_255589 ) ) ( not ( = ?auto_255584 ?auto_255590 ) ) ( not ( = ?auto_255585 ?auto_255586 ) ) ( not ( = ?auto_255585 ?auto_255587 ) ) ( not ( = ?auto_255585 ?auto_255588 ) ) ( not ( = ?auto_255585 ?auto_255589 ) ) ( not ( = ?auto_255585 ?auto_255590 ) ) ( not ( = ?auto_255586 ?auto_255587 ) ) ( not ( = ?auto_255586 ?auto_255588 ) ) ( not ( = ?auto_255586 ?auto_255589 ) ) ( not ( = ?auto_255586 ?auto_255590 ) ) ( not ( = ?auto_255587 ?auto_255588 ) ) ( not ( = ?auto_255587 ?auto_255589 ) ) ( not ( = ?auto_255587 ?auto_255590 ) ) ( not ( = ?auto_255588 ?auto_255589 ) ) ( not ( = ?auto_255588 ?auto_255590 ) ) ( not ( = ?auto_255589 ?auto_255590 ) ) ( ON ?auto_255588 ?auto_255589 ) ( ON ?auto_255587 ?auto_255588 ) ( ON ?auto_255586 ?auto_255587 ) ( ON ?auto_255585 ?auto_255586 ) ( ON ?auto_255584 ?auto_255585 ) ( CLEAR ?auto_255582 ) ( ON ?auto_255583 ?auto_255584 ) ( CLEAR ?auto_255583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_255580 ?auto_255581 ?auto_255582 ?auto_255583 )
      ( MAKE-10PILE ?auto_255580 ?auto_255581 ?auto_255582 ?auto_255583 ?auto_255584 ?auto_255585 ?auto_255586 ?auto_255587 ?auto_255588 ?auto_255589 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_255601 - BLOCK
      ?auto_255602 - BLOCK
      ?auto_255603 - BLOCK
      ?auto_255604 - BLOCK
      ?auto_255605 - BLOCK
      ?auto_255606 - BLOCK
      ?auto_255607 - BLOCK
      ?auto_255608 - BLOCK
      ?auto_255609 - BLOCK
      ?auto_255610 - BLOCK
    )
    :vars
    (
      ?auto_255611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255610 ?auto_255611 ) ( ON-TABLE ?auto_255601 ) ( ON ?auto_255602 ?auto_255601 ) ( ON ?auto_255603 ?auto_255602 ) ( not ( = ?auto_255601 ?auto_255602 ) ) ( not ( = ?auto_255601 ?auto_255603 ) ) ( not ( = ?auto_255601 ?auto_255604 ) ) ( not ( = ?auto_255601 ?auto_255605 ) ) ( not ( = ?auto_255601 ?auto_255606 ) ) ( not ( = ?auto_255601 ?auto_255607 ) ) ( not ( = ?auto_255601 ?auto_255608 ) ) ( not ( = ?auto_255601 ?auto_255609 ) ) ( not ( = ?auto_255601 ?auto_255610 ) ) ( not ( = ?auto_255601 ?auto_255611 ) ) ( not ( = ?auto_255602 ?auto_255603 ) ) ( not ( = ?auto_255602 ?auto_255604 ) ) ( not ( = ?auto_255602 ?auto_255605 ) ) ( not ( = ?auto_255602 ?auto_255606 ) ) ( not ( = ?auto_255602 ?auto_255607 ) ) ( not ( = ?auto_255602 ?auto_255608 ) ) ( not ( = ?auto_255602 ?auto_255609 ) ) ( not ( = ?auto_255602 ?auto_255610 ) ) ( not ( = ?auto_255602 ?auto_255611 ) ) ( not ( = ?auto_255603 ?auto_255604 ) ) ( not ( = ?auto_255603 ?auto_255605 ) ) ( not ( = ?auto_255603 ?auto_255606 ) ) ( not ( = ?auto_255603 ?auto_255607 ) ) ( not ( = ?auto_255603 ?auto_255608 ) ) ( not ( = ?auto_255603 ?auto_255609 ) ) ( not ( = ?auto_255603 ?auto_255610 ) ) ( not ( = ?auto_255603 ?auto_255611 ) ) ( not ( = ?auto_255604 ?auto_255605 ) ) ( not ( = ?auto_255604 ?auto_255606 ) ) ( not ( = ?auto_255604 ?auto_255607 ) ) ( not ( = ?auto_255604 ?auto_255608 ) ) ( not ( = ?auto_255604 ?auto_255609 ) ) ( not ( = ?auto_255604 ?auto_255610 ) ) ( not ( = ?auto_255604 ?auto_255611 ) ) ( not ( = ?auto_255605 ?auto_255606 ) ) ( not ( = ?auto_255605 ?auto_255607 ) ) ( not ( = ?auto_255605 ?auto_255608 ) ) ( not ( = ?auto_255605 ?auto_255609 ) ) ( not ( = ?auto_255605 ?auto_255610 ) ) ( not ( = ?auto_255605 ?auto_255611 ) ) ( not ( = ?auto_255606 ?auto_255607 ) ) ( not ( = ?auto_255606 ?auto_255608 ) ) ( not ( = ?auto_255606 ?auto_255609 ) ) ( not ( = ?auto_255606 ?auto_255610 ) ) ( not ( = ?auto_255606 ?auto_255611 ) ) ( not ( = ?auto_255607 ?auto_255608 ) ) ( not ( = ?auto_255607 ?auto_255609 ) ) ( not ( = ?auto_255607 ?auto_255610 ) ) ( not ( = ?auto_255607 ?auto_255611 ) ) ( not ( = ?auto_255608 ?auto_255609 ) ) ( not ( = ?auto_255608 ?auto_255610 ) ) ( not ( = ?auto_255608 ?auto_255611 ) ) ( not ( = ?auto_255609 ?auto_255610 ) ) ( not ( = ?auto_255609 ?auto_255611 ) ) ( not ( = ?auto_255610 ?auto_255611 ) ) ( ON ?auto_255609 ?auto_255610 ) ( ON ?auto_255608 ?auto_255609 ) ( ON ?auto_255607 ?auto_255608 ) ( ON ?auto_255606 ?auto_255607 ) ( ON ?auto_255605 ?auto_255606 ) ( CLEAR ?auto_255603 ) ( ON ?auto_255604 ?auto_255605 ) ( CLEAR ?auto_255604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_255601 ?auto_255602 ?auto_255603 ?auto_255604 )
      ( MAKE-10PILE ?auto_255601 ?auto_255602 ?auto_255603 ?auto_255604 ?auto_255605 ?auto_255606 ?auto_255607 ?auto_255608 ?auto_255609 ?auto_255610 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_255622 - BLOCK
      ?auto_255623 - BLOCK
      ?auto_255624 - BLOCK
      ?auto_255625 - BLOCK
      ?auto_255626 - BLOCK
      ?auto_255627 - BLOCK
      ?auto_255628 - BLOCK
      ?auto_255629 - BLOCK
      ?auto_255630 - BLOCK
      ?auto_255631 - BLOCK
    )
    :vars
    (
      ?auto_255632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255631 ?auto_255632 ) ( ON-TABLE ?auto_255622 ) ( ON ?auto_255623 ?auto_255622 ) ( not ( = ?auto_255622 ?auto_255623 ) ) ( not ( = ?auto_255622 ?auto_255624 ) ) ( not ( = ?auto_255622 ?auto_255625 ) ) ( not ( = ?auto_255622 ?auto_255626 ) ) ( not ( = ?auto_255622 ?auto_255627 ) ) ( not ( = ?auto_255622 ?auto_255628 ) ) ( not ( = ?auto_255622 ?auto_255629 ) ) ( not ( = ?auto_255622 ?auto_255630 ) ) ( not ( = ?auto_255622 ?auto_255631 ) ) ( not ( = ?auto_255622 ?auto_255632 ) ) ( not ( = ?auto_255623 ?auto_255624 ) ) ( not ( = ?auto_255623 ?auto_255625 ) ) ( not ( = ?auto_255623 ?auto_255626 ) ) ( not ( = ?auto_255623 ?auto_255627 ) ) ( not ( = ?auto_255623 ?auto_255628 ) ) ( not ( = ?auto_255623 ?auto_255629 ) ) ( not ( = ?auto_255623 ?auto_255630 ) ) ( not ( = ?auto_255623 ?auto_255631 ) ) ( not ( = ?auto_255623 ?auto_255632 ) ) ( not ( = ?auto_255624 ?auto_255625 ) ) ( not ( = ?auto_255624 ?auto_255626 ) ) ( not ( = ?auto_255624 ?auto_255627 ) ) ( not ( = ?auto_255624 ?auto_255628 ) ) ( not ( = ?auto_255624 ?auto_255629 ) ) ( not ( = ?auto_255624 ?auto_255630 ) ) ( not ( = ?auto_255624 ?auto_255631 ) ) ( not ( = ?auto_255624 ?auto_255632 ) ) ( not ( = ?auto_255625 ?auto_255626 ) ) ( not ( = ?auto_255625 ?auto_255627 ) ) ( not ( = ?auto_255625 ?auto_255628 ) ) ( not ( = ?auto_255625 ?auto_255629 ) ) ( not ( = ?auto_255625 ?auto_255630 ) ) ( not ( = ?auto_255625 ?auto_255631 ) ) ( not ( = ?auto_255625 ?auto_255632 ) ) ( not ( = ?auto_255626 ?auto_255627 ) ) ( not ( = ?auto_255626 ?auto_255628 ) ) ( not ( = ?auto_255626 ?auto_255629 ) ) ( not ( = ?auto_255626 ?auto_255630 ) ) ( not ( = ?auto_255626 ?auto_255631 ) ) ( not ( = ?auto_255626 ?auto_255632 ) ) ( not ( = ?auto_255627 ?auto_255628 ) ) ( not ( = ?auto_255627 ?auto_255629 ) ) ( not ( = ?auto_255627 ?auto_255630 ) ) ( not ( = ?auto_255627 ?auto_255631 ) ) ( not ( = ?auto_255627 ?auto_255632 ) ) ( not ( = ?auto_255628 ?auto_255629 ) ) ( not ( = ?auto_255628 ?auto_255630 ) ) ( not ( = ?auto_255628 ?auto_255631 ) ) ( not ( = ?auto_255628 ?auto_255632 ) ) ( not ( = ?auto_255629 ?auto_255630 ) ) ( not ( = ?auto_255629 ?auto_255631 ) ) ( not ( = ?auto_255629 ?auto_255632 ) ) ( not ( = ?auto_255630 ?auto_255631 ) ) ( not ( = ?auto_255630 ?auto_255632 ) ) ( not ( = ?auto_255631 ?auto_255632 ) ) ( ON ?auto_255630 ?auto_255631 ) ( ON ?auto_255629 ?auto_255630 ) ( ON ?auto_255628 ?auto_255629 ) ( ON ?auto_255627 ?auto_255628 ) ( ON ?auto_255626 ?auto_255627 ) ( ON ?auto_255625 ?auto_255626 ) ( CLEAR ?auto_255623 ) ( ON ?auto_255624 ?auto_255625 ) ( CLEAR ?auto_255624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_255622 ?auto_255623 ?auto_255624 )
      ( MAKE-10PILE ?auto_255622 ?auto_255623 ?auto_255624 ?auto_255625 ?auto_255626 ?auto_255627 ?auto_255628 ?auto_255629 ?auto_255630 ?auto_255631 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_255643 - BLOCK
      ?auto_255644 - BLOCK
      ?auto_255645 - BLOCK
      ?auto_255646 - BLOCK
      ?auto_255647 - BLOCK
      ?auto_255648 - BLOCK
      ?auto_255649 - BLOCK
      ?auto_255650 - BLOCK
      ?auto_255651 - BLOCK
      ?auto_255652 - BLOCK
    )
    :vars
    (
      ?auto_255653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255652 ?auto_255653 ) ( ON-TABLE ?auto_255643 ) ( ON ?auto_255644 ?auto_255643 ) ( not ( = ?auto_255643 ?auto_255644 ) ) ( not ( = ?auto_255643 ?auto_255645 ) ) ( not ( = ?auto_255643 ?auto_255646 ) ) ( not ( = ?auto_255643 ?auto_255647 ) ) ( not ( = ?auto_255643 ?auto_255648 ) ) ( not ( = ?auto_255643 ?auto_255649 ) ) ( not ( = ?auto_255643 ?auto_255650 ) ) ( not ( = ?auto_255643 ?auto_255651 ) ) ( not ( = ?auto_255643 ?auto_255652 ) ) ( not ( = ?auto_255643 ?auto_255653 ) ) ( not ( = ?auto_255644 ?auto_255645 ) ) ( not ( = ?auto_255644 ?auto_255646 ) ) ( not ( = ?auto_255644 ?auto_255647 ) ) ( not ( = ?auto_255644 ?auto_255648 ) ) ( not ( = ?auto_255644 ?auto_255649 ) ) ( not ( = ?auto_255644 ?auto_255650 ) ) ( not ( = ?auto_255644 ?auto_255651 ) ) ( not ( = ?auto_255644 ?auto_255652 ) ) ( not ( = ?auto_255644 ?auto_255653 ) ) ( not ( = ?auto_255645 ?auto_255646 ) ) ( not ( = ?auto_255645 ?auto_255647 ) ) ( not ( = ?auto_255645 ?auto_255648 ) ) ( not ( = ?auto_255645 ?auto_255649 ) ) ( not ( = ?auto_255645 ?auto_255650 ) ) ( not ( = ?auto_255645 ?auto_255651 ) ) ( not ( = ?auto_255645 ?auto_255652 ) ) ( not ( = ?auto_255645 ?auto_255653 ) ) ( not ( = ?auto_255646 ?auto_255647 ) ) ( not ( = ?auto_255646 ?auto_255648 ) ) ( not ( = ?auto_255646 ?auto_255649 ) ) ( not ( = ?auto_255646 ?auto_255650 ) ) ( not ( = ?auto_255646 ?auto_255651 ) ) ( not ( = ?auto_255646 ?auto_255652 ) ) ( not ( = ?auto_255646 ?auto_255653 ) ) ( not ( = ?auto_255647 ?auto_255648 ) ) ( not ( = ?auto_255647 ?auto_255649 ) ) ( not ( = ?auto_255647 ?auto_255650 ) ) ( not ( = ?auto_255647 ?auto_255651 ) ) ( not ( = ?auto_255647 ?auto_255652 ) ) ( not ( = ?auto_255647 ?auto_255653 ) ) ( not ( = ?auto_255648 ?auto_255649 ) ) ( not ( = ?auto_255648 ?auto_255650 ) ) ( not ( = ?auto_255648 ?auto_255651 ) ) ( not ( = ?auto_255648 ?auto_255652 ) ) ( not ( = ?auto_255648 ?auto_255653 ) ) ( not ( = ?auto_255649 ?auto_255650 ) ) ( not ( = ?auto_255649 ?auto_255651 ) ) ( not ( = ?auto_255649 ?auto_255652 ) ) ( not ( = ?auto_255649 ?auto_255653 ) ) ( not ( = ?auto_255650 ?auto_255651 ) ) ( not ( = ?auto_255650 ?auto_255652 ) ) ( not ( = ?auto_255650 ?auto_255653 ) ) ( not ( = ?auto_255651 ?auto_255652 ) ) ( not ( = ?auto_255651 ?auto_255653 ) ) ( not ( = ?auto_255652 ?auto_255653 ) ) ( ON ?auto_255651 ?auto_255652 ) ( ON ?auto_255650 ?auto_255651 ) ( ON ?auto_255649 ?auto_255650 ) ( ON ?auto_255648 ?auto_255649 ) ( ON ?auto_255647 ?auto_255648 ) ( ON ?auto_255646 ?auto_255647 ) ( CLEAR ?auto_255644 ) ( ON ?auto_255645 ?auto_255646 ) ( CLEAR ?auto_255645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_255643 ?auto_255644 ?auto_255645 )
      ( MAKE-10PILE ?auto_255643 ?auto_255644 ?auto_255645 ?auto_255646 ?auto_255647 ?auto_255648 ?auto_255649 ?auto_255650 ?auto_255651 ?auto_255652 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_255664 - BLOCK
      ?auto_255665 - BLOCK
      ?auto_255666 - BLOCK
      ?auto_255667 - BLOCK
      ?auto_255668 - BLOCK
      ?auto_255669 - BLOCK
      ?auto_255670 - BLOCK
      ?auto_255671 - BLOCK
      ?auto_255672 - BLOCK
      ?auto_255673 - BLOCK
    )
    :vars
    (
      ?auto_255674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255673 ?auto_255674 ) ( ON-TABLE ?auto_255664 ) ( not ( = ?auto_255664 ?auto_255665 ) ) ( not ( = ?auto_255664 ?auto_255666 ) ) ( not ( = ?auto_255664 ?auto_255667 ) ) ( not ( = ?auto_255664 ?auto_255668 ) ) ( not ( = ?auto_255664 ?auto_255669 ) ) ( not ( = ?auto_255664 ?auto_255670 ) ) ( not ( = ?auto_255664 ?auto_255671 ) ) ( not ( = ?auto_255664 ?auto_255672 ) ) ( not ( = ?auto_255664 ?auto_255673 ) ) ( not ( = ?auto_255664 ?auto_255674 ) ) ( not ( = ?auto_255665 ?auto_255666 ) ) ( not ( = ?auto_255665 ?auto_255667 ) ) ( not ( = ?auto_255665 ?auto_255668 ) ) ( not ( = ?auto_255665 ?auto_255669 ) ) ( not ( = ?auto_255665 ?auto_255670 ) ) ( not ( = ?auto_255665 ?auto_255671 ) ) ( not ( = ?auto_255665 ?auto_255672 ) ) ( not ( = ?auto_255665 ?auto_255673 ) ) ( not ( = ?auto_255665 ?auto_255674 ) ) ( not ( = ?auto_255666 ?auto_255667 ) ) ( not ( = ?auto_255666 ?auto_255668 ) ) ( not ( = ?auto_255666 ?auto_255669 ) ) ( not ( = ?auto_255666 ?auto_255670 ) ) ( not ( = ?auto_255666 ?auto_255671 ) ) ( not ( = ?auto_255666 ?auto_255672 ) ) ( not ( = ?auto_255666 ?auto_255673 ) ) ( not ( = ?auto_255666 ?auto_255674 ) ) ( not ( = ?auto_255667 ?auto_255668 ) ) ( not ( = ?auto_255667 ?auto_255669 ) ) ( not ( = ?auto_255667 ?auto_255670 ) ) ( not ( = ?auto_255667 ?auto_255671 ) ) ( not ( = ?auto_255667 ?auto_255672 ) ) ( not ( = ?auto_255667 ?auto_255673 ) ) ( not ( = ?auto_255667 ?auto_255674 ) ) ( not ( = ?auto_255668 ?auto_255669 ) ) ( not ( = ?auto_255668 ?auto_255670 ) ) ( not ( = ?auto_255668 ?auto_255671 ) ) ( not ( = ?auto_255668 ?auto_255672 ) ) ( not ( = ?auto_255668 ?auto_255673 ) ) ( not ( = ?auto_255668 ?auto_255674 ) ) ( not ( = ?auto_255669 ?auto_255670 ) ) ( not ( = ?auto_255669 ?auto_255671 ) ) ( not ( = ?auto_255669 ?auto_255672 ) ) ( not ( = ?auto_255669 ?auto_255673 ) ) ( not ( = ?auto_255669 ?auto_255674 ) ) ( not ( = ?auto_255670 ?auto_255671 ) ) ( not ( = ?auto_255670 ?auto_255672 ) ) ( not ( = ?auto_255670 ?auto_255673 ) ) ( not ( = ?auto_255670 ?auto_255674 ) ) ( not ( = ?auto_255671 ?auto_255672 ) ) ( not ( = ?auto_255671 ?auto_255673 ) ) ( not ( = ?auto_255671 ?auto_255674 ) ) ( not ( = ?auto_255672 ?auto_255673 ) ) ( not ( = ?auto_255672 ?auto_255674 ) ) ( not ( = ?auto_255673 ?auto_255674 ) ) ( ON ?auto_255672 ?auto_255673 ) ( ON ?auto_255671 ?auto_255672 ) ( ON ?auto_255670 ?auto_255671 ) ( ON ?auto_255669 ?auto_255670 ) ( ON ?auto_255668 ?auto_255669 ) ( ON ?auto_255667 ?auto_255668 ) ( ON ?auto_255666 ?auto_255667 ) ( CLEAR ?auto_255664 ) ( ON ?auto_255665 ?auto_255666 ) ( CLEAR ?auto_255665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_255664 ?auto_255665 )
      ( MAKE-10PILE ?auto_255664 ?auto_255665 ?auto_255666 ?auto_255667 ?auto_255668 ?auto_255669 ?auto_255670 ?auto_255671 ?auto_255672 ?auto_255673 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_255685 - BLOCK
      ?auto_255686 - BLOCK
      ?auto_255687 - BLOCK
      ?auto_255688 - BLOCK
      ?auto_255689 - BLOCK
      ?auto_255690 - BLOCK
      ?auto_255691 - BLOCK
      ?auto_255692 - BLOCK
      ?auto_255693 - BLOCK
      ?auto_255694 - BLOCK
    )
    :vars
    (
      ?auto_255695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255694 ?auto_255695 ) ( ON-TABLE ?auto_255685 ) ( not ( = ?auto_255685 ?auto_255686 ) ) ( not ( = ?auto_255685 ?auto_255687 ) ) ( not ( = ?auto_255685 ?auto_255688 ) ) ( not ( = ?auto_255685 ?auto_255689 ) ) ( not ( = ?auto_255685 ?auto_255690 ) ) ( not ( = ?auto_255685 ?auto_255691 ) ) ( not ( = ?auto_255685 ?auto_255692 ) ) ( not ( = ?auto_255685 ?auto_255693 ) ) ( not ( = ?auto_255685 ?auto_255694 ) ) ( not ( = ?auto_255685 ?auto_255695 ) ) ( not ( = ?auto_255686 ?auto_255687 ) ) ( not ( = ?auto_255686 ?auto_255688 ) ) ( not ( = ?auto_255686 ?auto_255689 ) ) ( not ( = ?auto_255686 ?auto_255690 ) ) ( not ( = ?auto_255686 ?auto_255691 ) ) ( not ( = ?auto_255686 ?auto_255692 ) ) ( not ( = ?auto_255686 ?auto_255693 ) ) ( not ( = ?auto_255686 ?auto_255694 ) ) ( not ( = ?auto_255686 ?auto_255695 ) ) ( not ( = ?auto_255687 ?auto_255688 ) ) ( not ( = ?auto_255687 ?auto_255689 ) ) ( not ( = ?auto_255687 ?auto_255690 ) ) ( not ( = ?auto_255687 ?auto_255691 ) ) ( not ( = ?auto_255687 ?auto_255692 ) ) ( not ( = ?auto_255687 ?auto_255693 ) ) ( not ( = ?auto_255687 ?auto_255694 ) ) ( not ( = ?auto_255687 ?auto_255695 ) ) ( not ( = ?auto_255688 ?auto_255689 ) ) ( not ( = ?auto_255688 ?auto_255690 ) ) ( not ( = ?auto_255688 ?auto_255691 ) ) ( not ( = ?auto_255688 ?auto_255692 ) ) ( not ( = ?auto_255688 ?auto_255693 ) ) ( not ( = ?auto_255688 ?auto_255694 ) ) ( not ( = ?auto_255688 ?auto_255695 ) ) ( not ( = ?auto_255689 ?auto_255690 ) ) ( not ( = ?auto_255689 ?auto_255691 ) ) ( not ( = ?auto_255689 ?auto_255692 ) ) ( not ( = ?auto_255689 ?auto_255693 ) ) ( not ( = ?auto_255689 ?auto_255694 ) ) ( not ( = ?auto_255689 ?auto_255695 ) ) ( not ( = ?auto_255690 ?auto_255691 ) ) ( not ( = ?auto_255690 ?auto_255692 ) ) ( not ( = ?auto_255690 ?auto_255693 ) ) ( not ( = ?auto_255690 ?auto_255694 ) ) ( not ( = ?auto_255690 ?auto_255695 ) ) ( not ( = ?auto_255691 ?auto_255692 ) ) ( not ( = ?auto_255691 ?auto_255693 ) ) ( not ( = ?auto_255691 ?auto_255694 ) ) ( not ( = ?auto_255691 ?auto_255695 ) ) ( not ( = ?auto_255692 ?auto_255693 ) ) ( not ( = ?auto_255692 ?auto_255694 ) ) ( not ( = ?auto_255692 ?auto_255695 ) ) ( not ( = ?auto_255693 ?auto_255694 ) ) ( not ( = ?auto_255693 ?auto_255695 ) ) ( not ( = ?auto_255694 ?auto_255695 ) ) ( ON ?auto_255693 ?auto_255694 ) ( ON ?auto_255692 ?auto_255693 ) ( ON ?auto_255691 ?auto_255692 ) ( ON ?auto_255690 ?auto_255691 ) ( ON ?auto_255689 ?auto_255690 ) ( ON ?auto_255688 ?auto_255689 ) ( ON ?auto_255687 ?auto_255688 ) ( CLEAR ?auto_255685 ) ( ON ?auto_255686 ?auto_255687 ) ( CLEAR ?auto_255686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_255685 ?auto_255686 )
      ( MAKE-10PILE ?auto_255685 ?auto_255686 ?auto_255687 ?auto_255688 ?auto_255689 ?auto_255690 ?auto_255691 ?auto_255692 ?auto_255693 ?auto_255694 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_255706 - BLOCK
      ?auto_255707 - BLOCK
      ?auto_255708 - BLOCK
      ?auto_255709 - BLOCK
      ?auto_255710 - BLOCK
      ?auto_255711 - BLOCK
      ?auto_255712 - BLOCK
      ?auto_255713 - BLOCK
      ?auto_255714 - BLOCK
      ?auto_255715 - BLOCK
    )
    :vars
    (
      ?auto_255716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255715 ?auto_255716 ) ( not ( = ?auto_255706 ?auto_255707 ) ) ( not ( = ?auto_255706 ?auto_255708 ) ) ( not ( = ?auto_255706 ?auto_255709 ) ) ( not ( = ?auto_255706 ?auto_255710 ) ) ( not ( = ?auto_255706 ?auto_255711 ) ) ( not ( = ?auto_255706 ?auto_255712 ) ) ( not ( = ?auto_255706 ?auto_255713 ) ) ( not ( = ?auto_255706 ?auto_255714 ) ) ( not ( = ?auto_255706 ?auto_255715 ) ) ( not ( = ?auto_255706 ?auto_255716 ) ) ( not ( = ?auto_255707 ?auto_255708 ) ) ( not ( = ?auto_255707 ?auto_255709 ) ) ( not ( = ?auto_255707 ?auto_255710 ) ) ( not ( = ?auto_255707 ?auto_255711 ) ) ( not ( = ?auto_255707 ?auto_255712 ) ) ( not ( = ?auto_255707 ?auto_255713 ) ) ( not ( = ?auto_255707 ?auto_255714 ) ) ( not ( = ?auto_255707 ?auto_255715 ) ) ( not ( = ?auto_255707 ?auto_255716 ) ) ( not ( = ?auto_255708 ?auto_255709 ) ) ( not ( = ?auto_255708 ?auto_255710 ) ) ( not ( = ?auto_255708 ?auto_255711 ) ) ( not ( = ?auto_255708 ?auto_255712 ) ) ( not ( = ?auto_255708 ?auto_255713 ) ) ( not ( = ?auto_255708 ?auto_255714 ) ) ( not ( = ?auto_255708 ?auto_255715 ) ) ( not ( = ?auto_255708 ?auto_255716 ) ) ( not ( = ?auto_255709 ?auto_255710 ) ) ( not ( = ?auto_255709 ?auto_255711 ) ) ( not ( = ?auto_255709 ?auto_255712 ) ) ( not ( = ?auto_255709 ?auto_255713 ) ) ( not ( = ?auto_255709 ?auto_255714 ) ) ( not ( = ?auto_255709 ?auto_255715 ) ) ( not ( = ?auto_255709 ?auto_255716 ) ) ( not ( = ?auto_255710 ?auto_255711 ) ) ( not ( = ?auto_255710 ?auto_255712 ) ) ( not ( = ?auto_255710 ?auto_255713 ) ) ( not ( = ?auto_255710 ?auto_255714 ) ) ( not ( = ?auto_255710 ?auto_255715 ) ) ( not ( = ?auto_255710 ?auto_255716 ) ) ( not ( = ?auto_255711 ?auto_255712 ) ) ( not ( = ?auto_255711 ?auto_255713 ) ) ( not ( = ?auto_255711 ?auto_255714 ) ) ( not ( = ?auto_255711 ?auto_255715 ) ) ( not ( = ?auto_255711 ?auto_255716 ) ) ( not ( = ?auto_255712 ?auto_255713 ) ) ( not ( = ?auto_255712 ?auto_255714 ) ) ( not ( = ?auto_255712 ?auto_255715 ) ) ( not ( = ?auto_255712 ?auto_255716 ) ) ( not ( = ?auto_255713 ?auto_255714 ) ) ( not ( = ?auto_255713 ?auto_255715 ) ) ( not ( = ?auto_255713 ?auto_255716 ) ) ( not ( = ?auto_255714 ?auto_255715 ) ) ( not ( = ?auto_255714 ?auto_255716 ) ) ( not ( = ?auto_255715 ?auto_255716 ) ) ( ON ?auto_255714 ?auto_255715 ) ( ON ?auto_255713 ?auto_255714 ) ( ON ?auto_255712 ?auto_255713 ) ( ON ?auto_255711 ?auto_255712 ) ( ON ?auto_255710 ?auto_255711 ) ( ON ?auto_255709 ?auto_255710 ) ( ON ?auto_255708 ?auto_255709 ) ( ON ?auto_255707 ?auto_255708 ) ( ON ?auto_255706 ?auto_255707 ) ( CLEAR ?auto_255706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_255706 )
      ( MAKE-10PILE ?auto_255706 ?auto_255707 ?auto_255708 ?auto_255709 ?auto_255710 ?auto_255711 ?auto_255712 ?auto_255713 ?auto_255714 ?auto_255715 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_255727 - BLOCK
      ?auto_255728 - BLOCK
      ?auto_255729 - BLOCK
      ?auto_255730 - BLOCK
      ?auto_255731 - BLOCK
      ?auto_255732 - BLOCK
      ?auto_255733 - BLOCK
      ?auto_255734 - BLOCK
      ?auto_255735 - BLOCK
      ?auto_255736 - BLOCK
    )
    :vars
    (
      ?auto_255737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255736 ?auto_255737 ) ( not ( = ?auto_255727 ?auto_255728 ) ) ( not ( = ?auto_255727 ?auto_255729 ) ) ( not ( = ?auto_255727 ?auto_255730 ) ) ( not ( = ?auto_255727 ?auto_255731 ) ) ( not ( = ?auto_255727 ?auto_255732 ) ) ( not ( = ?auto_255727 ?auto_255733 ) ) ( not ( = ?auto_255727 ?auto_255734 ) ) ( not ( = ?auto_255727 ?auto_255735 ) ) ( not ( = ?auto_255727 ?auto_255736 ) ) ( not ( = ?auto_255727 ?auto_255737 ) ) ( not ( = ?auto_255728 ?auto_255729 ) ) ( not ( = ?auto_255728 ?auto_255730 ) ) ( not ( = ?auto_255728 ?auto_255731 ) ) ( not ( = ?auto_255728 ?auto_255732 ) ) ( not ( = ?auto_255728 ?auto_255733 ) ) ( not ( = ?auto_255728 ?auto_255734 ) ) ( not ( = ?auto_255728 ?auto_255735 ) ) ( not ( = ?auto_255728 ?auto_255736 ) ) ( not ( = ?auto_255728 ?auto_255737 ) ) ( not ( = ?auto_255729 ?auto_255730 ) ) ( not ( = ?auto_255729 ?auto_255731 ) ) ( not ( = ?auto_255729 ?auto_255732 ) ) ( not ( = ?auto_255729 ?auto_255733 ) ) ( not ( = ?auto_255729 ?auto_255734 ) ) ( not ( = ?auto_255729 ?auto_255735 ) ) ( not ( = ?auto_255729 ?auto_255736 ) ) ( not ( = ?auto_255729 ?auto_255737 ) ) ( not ( = ?auto_255730 ?auto_255731 ) ) ( not ( = ?auto_255730 ?auto_255732 ) ) ( not ( = ?auto_255730 ?auto_255733 ) ) ( not ( = ?auto_255730 ?auto_255734 ) ) ( not ( = ?auto_255730 ?auto_255735 ) ) ( not ( = ?auto_255730 ?auto_255736 ) ) ( not ( = ?auto_255730 ?auto_255737 ) ) ( not ( = ?auto_255731 ?auto_255732 ) ) ( not ( = ?auto_255731 ?auto_255733 ) ) ( not ( = ?auto_255731 ?auto_255734 ) ) ( not ( = ?auto_255731 ?auto_255735 ) ) ( not ( = ?auto_255731 ?auto_255736 ) ) ( not ( = ?auto_255731 ?auto_255737 ) ) ( not ( = ?auto_255732 ?auto_255733 ) ) ( not ( = ?auto_255732 ?auto_255734 ) ) ( not ( = ?auto_255732 ?auto_255735 ) ) ( not ( = ?auto_255732 ?auto_255736 ) ) ( not ( = ?auto_255732 ?auto_255737 ) ) ( not ( = ?auto_255733 ?auto_255734 ) ) ( not ( = ?auto_255733 ?auto_255735 ) ) ( not ( = ?auto_255733 ?auto_255736 ) ) ( not ( = ?auto_255733 ?auto_255737 ) ) ( not ( = ?auto_255734 ?auto_255735 ) ) ( not ( = ?auto_255734 ?auto_255736 ) ) ( not ( = ?auto_255734 ?auto_255737 ) ) ( not ( = ?auto_255735 ?auto_255736 ) ) ( not ( = ?auto_255735 ?auto_255737 ) ) ( not ( = ?auto_255736 ?auto_255737 ) ) ( ON ?auto_255735 ?auto_255736 ) ( ON ?auto_255734 ?auto_255735 ) ( ON ?auto_255733 ?auto_255734 ) ( ON ?auto_255732 ?auto_255733 ) ( ON ?auto_255731 ?auto_255732 ) ( ON ?auto_255730 ?auto_255731 ) ( ON ?auto_255729 ?auto_255730 ) ( ON ?auto_255728 ?auto_255729 ) ( ON ?auto_255727 ?auto_255728 ) ( CLEAR ?auto_255727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_255727 )
      ( MAKE-10PILE ?auto_255727 ?auto_255728 ?auto_255729 ?auto_255730 ?auto_255731 ?auto_255732 ?auto_255733 ?auto_255734 ?auto_255735 ?auto_255736 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_255749 - BLOCK
      ?auto_255750 - BLOCK
      ?auto_255751 - BLOCK
      ?auto_255752 - BLOCK
      ?auto_255753 - BLOCK
      ?auto_255754 - BLOCK
      ?auto_255755 - BLOCK
      ?auto_255756 - BLOCK
      ?auto_255757 - BLOCK
      ?auto_255758 - BLOCK
      ?auto_255759 - BLOCK
    )
    :vars
    (
      ?auto_255760 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_255758 ) ( ON ?auto_255759 ?auto_255760 ) ( CLEAR ?auto_255759 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_255749 ) ( ON ?auto_255750 ?auto_255749 ) ( ON ?auto_255751 ?auto_255750 ) ( ON ?auto_255752 ?auto_255751 ) ( ON ?auto_255753 ?auto_255752 ) ( ON ?auto_255754 ?auto_255753 ) ( ON ?auto_255755 ?auto_255754 ) ( ON ?auto_255756 ?auto_255755 ) ( ON ?auto_255757 ?auto_255756 ) ( ON ?auto_255758 ?auto_255757 ) ( not ( = ?auto_255749 ?auto_255750 ) ) ( not ( = ?auto_255749 ?auto_255751 ) ) ( not ( = ?auto_255749 ?auto_255752 ) ) ( not ( = ?auto_255749 ?auto_255753 ) ) ( not ( = ?auto_255749 ?auto_255754 ) ) ( not ( = ?auto_255749 ?auto_255755 ) ) ( not ( = ?auto_255749 ?auto_255756 ) ) ( not ( = ?auto_255749 ?auto_255757 ) ) ( not ( = ?auto_255749 ?auto_255758 ) ) ( not ( = ?auto_255749 ?auto_255759 ) ) ( not ( = ?auto_255749 ?auto_255760 ) ) ( not ( = ?auto_255750 ?auto_255751 ) ) ( not ( = ?auto_255750 ?auto_255752 ) ) ( not ( = ?auto_255750 ?auto_255753 ) ) ( not ( = ?auto_255750 ?auto_255754 ) ) ( not ( = ?auto_255750 ?auto_255755 ) ) ( not ( = ?auto_255750 ?auto_255756 ) ) ( not ( = ?auto_255750 ?auto_255757 ) ) ( not ( = ?auto_255750 ?auto_255758 ) ) ( not ( = ?auto_255750 ?auto_255759 ) ) ( not ( = ?auto_255750 ?auto_255760 ) ) ( not ( = ?auto_255751 ?auto_255752 ) ) ( not ( = ?auto_255751 ?auto_255753 ) ) ( not ( = ?auto_255751 ?auto_255754 ) ) ( not ( = ?auto_255751 ?auto_255755 ) ) ( not ( = ?auto_255751 ?auto_255756 ) ) ( not ( = ?auto_255751 ?auto_255757 ) ) ( not ( = ?auto_255751 ?auto_255758 ) ) ( not ( = ?auto_255751 ?auto_255759 ) ) ( not ( = ?auto_255751 ?auto_255760 ) ) ( not ( = ?auto_255752 ?auto_255753 ) ) ( not ( = ?auto_255752 ?auto_255754 ) ) ( not ( = ?auto_255752 ?auto_255755 ) ) ( not ( = ?auto_255752 ?auto_255756 ) ) ( not ( = ?auto_255752 ?auto_255757 ) ) ( not ( = ?auto_255752 ?auto_255758 ) ) ( not ( = ?auto_255752 ?auto_255759 ) ) ( not ( = ?auto_255752 ?auto_255760 ) ) ( not ( = ?auto_255753 ?auto_255754 ) ) ( not ( = ?auto_255753 ?auto_255755 ) ) ( not ( = ?auto_255753 ?auto_255756 ) ) ( not ( = ?auto_255753 ?auto_255757 ) ) ( not ( = ?auto_255753 ?auto_255758 ) ) ( not ( = ?auto_255753 ?auto_255759 ) ) ( not ( = ?auto_255753 ?auto_255760 ) ) ( not ( = ?auto_255754 ?auto_255755 ) ) ( not ( = ?auto_255754 ?auto_255756 ) ) ( not ( = ?auto_255754 ?auto_255757 ) ) ( not ( = ?auto_255754 ?auto_255758 ) ) ( not ( = ?auto_255754 ?auto_255759 ) ) ( not ( = ?auto_255754 ?auto_255760 ) ) ( not ( = ?auto_255755 ?auto_255756 ) ) ( not ( = ?auto_255755 ?auto_255757 ) ) ( not ( = ?auto_255755 ?auto_255758 ) ) ( not ( = ?auto_255755 ?auto_255759 ) ) ( not ( = ?auto_255755 ?auto_255760 ) ) ( not ( = ?auto_255756 ?auto_255757 ) ) ( not ( = ?auto_255756 ?auto_255758 ) ) ( not ( = ?auto_255756 ?auto_255759 ) ) ( not ( = ?auto_255756 ?auto_255760 ) ) ( not ( = ?auto_255757 ?auto_255758 ) ) ( not ( = ?auto_255757 ?auto_255759 ) ) ( not ( = ?auto_255757 ?auto_255760 ) ) ( not ( = ?auto_255758 ?auto_255759 ) ) ( not ( = ?auto_255758 ?auto_255760 ) ) ( not ( = ?auto_255759 ?auto_255760 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_255759 ?auto_255760 )
      ( !STACK ?auto_255759 ?auto_255758 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_255772 - BLOCK
      ?auto_255773 - BLOCK
      ?auto_255774 - BLOCK
      ?auto_255775 - BLOCK
      ?auto_255776 - BLOCK
      ?auto_255777 - BLOCK
      ?auto_255778 - BLOCK
      ?auto_255779 - BLOCK
      ?auto_255780 - BLOCK
      ?auto_255781 - BLOCK
      ?auto_255782 - BLOCK
    )
    :vars
    (
      ?auto_255783 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_255781 ) ( ON ?auto_255782 ?auto_255783 ) ( CLEAR ?auto_255782 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_255772 ) ( ON ?auto_255773 ?auto_255772 ) ( ON ?auto_255774 ?auto_255773 ) ( ON ?auto_255775 ?auto_255774 ) ( ON ?auto_255776 ?auto_255775 ) ( ON ?auto_255777 ?auto_255776 ) ( ON ?auto_255778 ?auto_255777 ) ( ON ?auto_255779 ?auto_255778 ) ( ON ?auto_255780 ?auto_255779 ) ( ON ?auto_255781 ?auto_255780 ) ( not ( = ?auto_255772 ?auto_255773 ) ) ( not ( = ?auto_255772 ?auto_255774 ) ) ( not ( = ?auto_255772 ?auto_255775 ) ) ( not ( = ?auto_255772 ?auto_255776 ) ) ( not ( = ?auto_255772 ?auto_255777 ) ) ( not ( = ?auto_255772 ?auto_255778 ) ) ( not ( = ?auto_255772 ?auto_255779 ) ) ( not ( = ?auto_255772 ?auto_255780 ) ) ( not ( = ?auto_255772 ?auto_255781 ) ) ( not ( = ?auto_255772 ?auto_255782 ) ) ( not ( = ?auto_255772 ?auto_255783 ) ) ( not ( = ?auto_255773 ?auto_255774 ) ) ( not ( = ?auto_255773 ?auto_255775 ) ) ( not ( = ?auto_255773 ?auto_255776 ) ) ( not ( = ?auto_255773 ?auto_255777 ) ) ( not ( = ?auto_255773 ?auto_255778 ) ) ( not ( = ?auto_255773 ?auto_255779 ) ) ( not ( = ?auto_255773 ?auto_255780 ) ) ( not ( = ?auto_255773 ?auto_255781 ) ) ( not ( = ?auto_255773 ?auto_255782 ) ) ( not ( = ?auto_255773 ?auto_255783 ) ) ( not ( = ?auto_255774 ?auto_255775 ) ) ( not ( = ?auto_255774 ?auto_255776 ) ) ( not ( = ?auto_255774 ?auto_255777 ) ) ( not ( = ?auto_255774 ?auto_255778 ) ) ( not ( = ?auto_255774 ?auto_255779 ) ) ( not ( = ?auto_255774 ?auto_255780 ) ) ( not ( = ?auto_255774 ?auto_255781 ) ) ( not ( = ?auto_255774 ?auto_255782 ) ) ( not ( = ?auto_255774 ?auto_255783 ) ) ( not ( = ?auto_255775 ?auto_255776 ) ) ( not ( = ?auto_255775 ?auto_255777 ) ) ( not ( = ?auto_255775 ?auto_255778 ) ) ( not ( = ?auto_255775 ?auto_255779 ) ) ( not ( = ?auto_255775 ?auto_255780 ) ) ( not ( = ?auto_255775 ?auto_255781 ) ) ( not ( = ?auto_255775 ?auto_255782 ) ) ( not ( = ?auto_255775 ?auto_255783 ) ) ( not ( = ?auto_255776 ?auto_255777 ) ) ( not ( = ?auto_255776 ?auto_255778 ) ) ( not ( = ?auto_255776 ?auto_255779 ) ) ( not ( = ?auto_255776 ?auto_255780 ) ) ( not ( = ?auto_255776 ?auto_255781 ) ) ( not ( = ?auto_255776 ?auto_255782 ) ) ( not ( = ?auto_255776 ?auto_255783 ) ) ( not ( = ?auto_255777 ?auto_255778 ) ) ( not ( = ?auto_255777 ?auto_255779 ) ) ( not ( = ?auto_255777 ?auto_255780 ) ) ( not ( = ?auto_255777 ?auto_255781 ) ) ( not ( = ?auto_255777 ?auto_255782 ) ) ( not ( = ?auto_255777 ?auto_255783 ) ) ( not ( = ?auto_255778 ?auto_255779 ) ) ( not ( = ?auto_255778 ?auto_255780 ) ) ( not ( = ?auto_255778 ?auto_255781 ) ) ( not ( = ?auto_255778 ?auto_255782 ) ) ( not ( = ?auto_255778 ?auto_255783 ) ) ( not ( = ?auto_255779 ?auto_255780 ) ) ( not ( = ?auto_255779 ?auto_255781 ) ) ( not ( = ?auto_255779 ?auto_255782 ) ) ( not ( = ?auto_255779 ?auto_255783 ) ) ( not ( = ?auto_255780 ?auto_255781 ) ) ( not ( = ?auto_255780 ?auto_255782 ) ) ( not ( = ?auto_255780 ?auto_255783 ) ) ( not ( = ?auto_255781 ?auto_255782 ) ) ( not ( = ?auto_255781 ?auto_255783 ) ) ( not ( = ?auto_255782 ?auto_255783 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_255782 ?auto_255783 )
      ( !STACK ?auto_255782 ?auto_255781 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_255795 - BLOCK
      ?auto_255796 - BLOCK
      ?auto_255797 - BLOCK
      ?auto_255798 - BLOCK
      ?auto_255799 - BLOCK
      ?auto_255800 - BLOCK
      ?auto_255801 - BLOCK
      ?auto_255802 - BLOCK
      ?auto_255803 - BLOCK
      ?auto_255804 - BLOCK
      ?auto_255805 - BLOCK
    )
    :vars
    (
      ?auto_255806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255805 ?auto_255806 ) ( ON-TABLE ?auto_255795 ) ( ON ?auto_255796 ?auto_255795 ) ( ON ?auto_255797 ?auto_255796 ) ( ON ?auto_255798 ?auto_255797 ) ( ON ?auto_255799 ?auto_255798 ) ( ON ?auto_255800 ?auto_255799 ) ( ON ?auto_255801 ?auto_255800 ) ( ON ?auto_255802 ?auto_255801 ) ( ON ?auto_255803 ?auto_255802 ) ( not ( = ?auto_255795 ?auto_255796 ) ) ( not ( = ?auto_255795 ?auto_255797 ) ) ( not ( = ?auto_255795 ?auto_255798 ) ) ( not ( = ?auto_255795 ?auto_255799 ) ) ( not ( = ?auto_255795 ?auto_255800 ) ) ( not ( = ?auto_255795 ?auto_255801 ) ) ( not ( = ?auto_255795 ?auto_255802 ) ) ( not ( = ?auto_255795 ?auto_255803 ) ) ( not ( = ?auto_255795 ?auto_255804 ) ) ( not ( = ?auto_255795 ?auto_255805 ) ) ( not ( = ?auto_255795 ?auto_255806 ) ) ( not ( = ?auto_255796 ?auto_255797 ) ) ( not ( = ?auto_255796 ?auto_255798 ) ) ( not ( = ?auto_255796 ?auto_255799 ) ) ( not ( = ?auto_255796 ?auto_255800 ) ) ( not ( = ?auto_255796 ?auto_255801 ) ) ( not ( = ?auto_255796 ?auto_255802 ) ) ( not ( = ?auto_255796 ?auto_255803 ) ) ( not ( = ?auto_255796 ?auto_255804 ) ) ( not ( = ?auto_255796 ?auto_255805 ) ) ( not ( = ?auto_255796 ?auto_255806 ) ) ( not ( = ?auto_255797 ?auto_255798 ) ) ( not ( = ?auto_255797 ?auto_255799 ) ) ( not ( = ?auto_255797 ?auto_255800 ) ) ( not ( = ?auto_255797 ?auto_255801 ) ) ( not ( = ?auto_255797 ?auto_255802 ) ) ( not ( = ?auto_255797 ?auto_255803 ) ) ( not ( = ?auto_255797 ?auto_255804 ) ) ( not ( = ?auto_255797 ?auto_255805 ) ) ( not ( = ?auto_255797 ?auto_255806 ) ) ( not ( = ?auto_255798 ?auto_255799 ) ) ( not ( = ?auto_255798 ?auto_255800 ) ) ( not ( = ?auto_255798 ?auto_255801 ) ) ( not ( = ?auto_255798 ?auto_255802 ) ) ( not ( = ?auto_255798 ?auto_255803 ) ) ( not ( = ?auto_255798 ?auto_255804 ) ) ( not ( = ?auto_255798 ?auto_255805 ) ) ( not ( = ?auto_255798 ?auto_255806 ) ) ( not ( = ?auto_255799 ?auto_255800 ) ) ( not ( = ?auto_255799 ?auto_255801 ) ) ( not ( = ?auto_255799 ?auto_255802 ) ) ( not ( = ?auto_255799 ?auto_255803 ) ) ( not ( = ?auto_255799 ?auto_255804 ) ) ( not ( = ?auto_255799 ?auto_255805 ) ) ( not ( = ?auto_255799 ?auto_255806 ) ) ( not ( = ?auto_255800 ?auto_255801 ) ) ( not ( = ?auto_255800 ?auto_255802 ) ) ( not ( = ?auto_255800 ?auto_255803 ) ) ( not ( = ?auto_255800 ?auto_255804 ) ) ( not ( = ?auto_255800 ?auto_255805 ) ) ( not ( = ?auto_255800 ?auto_255806 ) ) ( not ( = ?auto_255801 ?auto_255802 ) ) ( not ( = ?auto_255801 ?auto_255803 ) ) ( not ( = ?auto_255801 ?auto_255804 ) ) ( not ( = ?auto_255801 ?auto_255805 ) ) ( not ( = ?auto_255801 ?auto_255806 ) ) ( not ( = ?auto_255802 ?auto_255803 ) ) ( not ( = ?auto_255802 ?auto_255804 ) ) ( not ( = ?auto_255802 ?auto_255805 ) ) ( not ( = ?auto_255802 ?auto_255806 ) ) ( not ( = ?auto_255803 ?auto_255804 ) ) ( not ( = ?auto_255803 ?auto_255805 ) ) ( not ( = ?auto_255803 ?auto_255806 ) ) ( not ( = ?auto_255804 ?auto_255805 ) ) ( not ( = ?auto_255804 ?auto_255806 ) ) ( not ( = ?auto_255805 ?auto_255806 ) ) ( CLEAR ?auto_255803 ) ( ON ?auto_255804 ?auto_255805 ) ( CLEAR ?auto_255804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_255795 ?auto_255796 ?auto_255797 ?auto_255798 ?auto_255799 ?auto_255800 ?auto_255801 ?auto_255802 ?auto_255803 ?auto_255804 )
      ( MAKE-11PILE ?auto_255795 ?auto_255796 ?auto_255797 ?auto_255798 ?auto_255799 ?auto_255800 ?auto_255801 ?auto_255802 ?auto_255803 ?auto_255804 ?auto_255805 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_255818 - BLOCK
      ?auto_255819 - BLOCK
      ?auto_255820 - BLOCK
      ?auto_255821 - BLOCK
      ?auto_255822 - BLOCK
      ?auto_255823 - BLOCK
      ?auto_255824 - BLOCK
      ?auto_255825 - BLOCK
      ?auto_255826 - BLOCK
      ?auto_255827 - BLOCK
      ?auto_255828 - BLOCK
    )
    :vars
    (
      ?auto_255829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255828 ?auto_255829 ) ( ON-TABLE ?auto_255818 ) ( ON ?auto_255819 ?auto_255818 ) ( ON ?auto_255820 ?auto_255819 ) ( ON ?auto_255821 ?auto_255820 ) ( ON ?auto_255822 ?auto_255821 ) ( ON ?auto_255823 ?auto_255822 ) ( ON ?auto_255824 ?auto_255823 ) ( ON ?auto_255825 ?auto_255824 ) ( ON ?auto_255826 ?auto_255825 ) ( not ( = ?auto_255818 ?auto_255819 ) ) ( not ( = ?auto_255818 ?auto_255820 ) ) ( not ( = ?auto_255818 ?auto_255821 ) ) ( not ( = ?auto_255818 ?auto_255822 ) ) ( not ( = ?auto_255818 ?auto_255823 ) ) ( not ( = ?auto_255818 ?auto_255824 ) ) ( not ( = ?auto_255818 ?auto_255825 ) ) ( not ( = ?auto_255818 ?auto_255826 ) ) ( not ( = ?auto_255818 ?auto_255827 ) ) ( not ( = ?auto_255818 ?auto_255828 ) ) ( not ( = ?auto_255818 ?auto_255829 ) ) ( not ( = ?auto_255819 ?auto_255820 ) ) ( not ( = ?auto_255819 ?auto_255821 ) ) ( not ( = ?auto_255819 ?auto_255822 ) ) ( not ( = ?auto_255819 ?auto_255823 ) ) ( not ( = ?auto_255819 ?auto_255824 ) ) ( not ( = ?auto_255819 ?auto_255825 ) ) ( not ( = ?auto_255819 ?auto_255826 ) ) ( not ( = ?auto_255819 ?auto_255827 ) ) ( not ( = ?auto_255819 ?auto_255828 ) ) ( not ( = ?auto_255819 ?auto_255829 ) ) ( not ( = ?auto_255820 ?auto_255821 ) ) ( not ( = ?auto_255820 ?auto_255822 ) ) ( not ( = ?auto_255820 ?auto_255823 ) ) ( not ( = ?auto_255820 ?auto_255824 ) ) ( not ( = ?auto_255820 ?auto_255825 ) ) ( not ( = ?auto_255820 ?auto_255826 ) ) ( not ( = ?auto_255820 ?auto_255827 ) ) ( not ( = ?auto_255820 ?auto_255828 ) ) ( not ( = ?auto_255820 ?auto_255829 ) ) ( not ( = ?auto_255821 ?auto_255822 ) ) ( not ( = ?auto_255821 ?auto_255823 ) ) ( not ( = ?auto_255821 ?auto_255824 ) ) ( not ( = ?auto_255821 ?auto_255825 ) ) ( not ( = ?auto_255821 ?auto_255826 ) ) ( not ( = ?auto_255821 ?auto_255827 ) ) ( not ( = ?auto_255821 ?auto_255828 ) ) ( not ( = ?auto_255821 ?auto_255829 ) ) ( not ( = ?auto_255822 ?auto_255823 ) ) ( not ( = ?auto_255822 ?auto_255824 ) ) ( not ( = ?auto_255822 ?auto_255825 ) ) ( not ( = ?auto_255822 ?auto_255826 ) ) ( not ( = ?auto_255822 ?auto_255827 ) ) ( not ( = ?auto_255822 ?auto_255828 ) ) ( not ( = ?auto_255822 ?auto_255829 ) ) ( not ( = ?auto_255823 ?auto_255824 ) ) ( not ( = ?auto_255823 ?auto_255825 ) ) ( not ( = ?auto_255823 ?auto_255826 ) ) ( not ( = ?auto_255823 ?auto_255827 ) ) ( not ( = ?auto_255823 ?auto_255828 ) ) ( not ( = ?auto_255823 ?auto_255829 ) ) ( not ( = ?auto_255824 ?auto_255825 ) ) ( not ( = ?auto_255824 ?auto_255826 ) ) ( not ( = ?auto_255824 ?auto_255827 ) ) ( not ( = ?auto_255824 ?auto_255828 ) ) ( not ( = ?auto_255824 ?auto_255829 ) ) ( not ( = ?auto_255825 ?auto_255826 ) ) ( not ( = ?auto_255825 ?auto_255827 ) ) ( not ( = ?auto_255825 ?auto_255828 ) ) ( not ( = ?auto_255825 ?auto_255829 ) ) ( not ( = ?auto_255826 ?auto_255827 ) ) ( not ( = ?auto_255826 ?auto_255828 ) ) ( not ( = ?auto_255826 ?auto_255829 ) ) ( not ( = ?auto_255827 ?auto_255828 ) ) ( not ( = ?auto_255827 ?auto_255829 ) ) ( not ( = ?auto_255828 ?auto_255829 ) ) ( CLEAR ?auto_255826 ) ( ON ?auto_255827 ?auto_255828 ) ( CLEAR ?auto_255827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_255818 ?auto_255819 ?auto_255820 ?auto_255821 ?auto_255822 ?auto_255823 ?auto_255824 ?auto_255825 ?auto_255826 ?auto_255827 )
      ( MAKE-11PILE ?auto_255818 ?auto_255819 ?auto_255820 ?auto_255821 ?auto_255822 ?auto_255823 ?auto_255824 ?auto_255825 ?auto_255826 ?auto_255827 ?auto_255828 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_255841 - BLOCK
      ?auto_255842 - BLOCK
      ?auto_255843 - BLOCK
      ?auto_255844 - BLOCK
      ?auto_255845 - BLOCK
      ?auto_255846 - BLOCK
      ?auto_255847 - BLOCK
      ?auto_255848 - BLOCK
      ?auto_255849 - BLOCK
      ?auto_255850 - BLOCK
      ?auto_255851 - BLOCK
    )
    :vars
    (
      ?auto_255852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255851 ?auto_255852 ) ( ON-TABLE ?auto_255841 ) ( ON ?auto_255842 ?auto_255841 ) ( ON ?auto_255843 ?auto_255842 ) ( ON ?auto_255844 ?auto_255843 ) ( ON ?auto_255845 ?auto_255844 ) ( ON ?auto_255846 ?auto_255845 ) ( ON ?auto_255847 ?auto_255846 ) ( ON ?auto_255848 ?auto_255847 ) ( not ( = ?auto_255841 ?auto_255842 ) ) ( not ( = ?auto_255841 ?auto_255843 ) ) ( not ( = ?auto_255841 ?auto_255844 ) ) ( not ( = ?auto_255841 ?auto_255845 ) ) ( not ( = ?auto_255841 ?auto_255846 ) ) ( not ( = ?auto_255841 ?auto_255847 ) ) ( not ( = ?auto_255841 ?auto_255848 ) ) ( not ( = ?auto_255841 ?auto_255849 ) ) ( not ( = ?auto_255841 ?auto_255850 ) ) ( not ( = ?auto_255841 ?auto_255851 ) ) ( not ( = ?auto_255841 ?auto_255852 ) ) ( not ( = ?auto_255842 ?auto_255843 ) ) ( not ( = ?auto_255842 ?auto_255844 ) ) ( not ( = ?auto_255842 ?auto_255845 ) ) ( not ( = ?auto_255842 ?auto_255846 ) ) ( not ( = ?auto_255842 ?auto_255847 ) ) ( not ( = ?auto_255842 ?auto_255848 ) ) ( not ( = ?auto_255842 ?auto_255849 ) ) ( not ( = ?auto_255842 ?auto_255850 ) ) ( not ( = ?auto_255842 ?auto_255851 ) ) ( not ( = ?auto_255842 ?auto_255852 ) ) ( not ( = ?auto_255843 ?auto_255844 ) ) ( not ( = ?auto_255843 ?auto_255845 ) ) ( not ( = ?auto_255843 ?auto_255846 ) ) ( not ( = ?auto_255843 ?auto_255847 ) ) ( not ( = ?auto_255843 ?auto_255848 ) ) ( not ( = ?auto_255843 ?auto_255849 ) ) ( not ( = ?auto_255843 ?auto_255850 ) ) ( not ( = ?auto_255843 ?auto_255851 ) ) ( not ( = ?auto_255843 ?auto_255852 ) ) ( not ( = ?auto_255844 ?auto_255845 ) ) ( not ( = ?auto_255844 ?auto_255846 ) ) ( not ( = ?auto_255844 ?auto_255847 ) ) ( not ( = ?auto_255844 ?auto_255848 ) ) ( not ( = ?auto_255844 ?auto_255849 ) ) ( not ( = ?auto_255844 ?auto_255850 ) ) ( not ( = ?auto_255844 ?auto_255851 ) ) ( not ( = ?auto_255844 ?auto_255852 ) ) ( not ( = ?auto_255845 ?auto_255846 ) ) ( not ( = ?auto_255845 ?auto_255847 ) ) ( not ( = ?auto_255845 ?auto_255848 ) ) ( not ( = ?auto_255845 ?auto_255849 ) ) ( not ( = ?auto_255845 ?auto_255850 ) ) ( not ( = ?auto_255845 ?auto_255851 ) ) ( not ( = ?auto_255845 ?auto_255852 ) ) ( not ( = ?auto_255846 ?auto_255847 ) ) ( not ( = ?auto_255846 ?auto_255848 ) ) ( not ( = ?auto_255846 ?auto_255849 ) ) ( not ( = ?auto_255846 ?auto_255850 ) ) ( not ( = ?auto_255846 ?auto_255851 ) ) ( not ( = ?auto_255846 ?auto_255852 ) ) ( not ( = ?auto_255847 ?auto_255848 ) ) ( not ( = ?auto_255847 ?auto_255849 ) ) ( not ( = ?auto_255847 ?auto_255850 ) ) ( not ( = ?auto_255847 ?auto_255851 ) ) ( not ( = ?auto_255847 ?auto_255852 ) ) ( not ( = ?auto_255848 ?auto_255849 ) ) ( not ( = ?auto_255848 ?auto_255850 ) ) ( not ( = ?auto_255848 ?auto_255851 ) ) ( not ( = ?auto_255848 ?auto_255852 ) ) ( not ( = ?auto_255849 ?auto_255850 ) ) ( not ( = ?auto_255849 ?auto_255851 ) ) ( not ( = ?auto_255849 ?auto_255852 ) ) ( not ( = ?auto_255850 ?auto_255851 ) ) ( not ( = ?auto_255850 ?auto_255852 ) ) ( not ( = ?auto_255851 ?auto_255852 ) ) ( ON ?auto_255850 ?auto_255851 ) ( CLEAR ?auto_255848 ) ( ON ?auto_255849 ?auto_255850 ) ( CLEAR ?auto_255849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_255841 ?auto_255842 ?auto_255843 ?auto_255844 ?auto_255845 ?auto_255846 ?auto_255847 ?auto_255848 ?auto_255849 )
      ( MAKE-11PILE ?auto_255841 ?auto_255842 ?auto_255843 ?auto_255844 ?auto_255845 ?auto_255846 ?auto_255847 ?auto_255848 ?auto_255849 ?auto_255850 ?auto_255851 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_255864 - BLOCK
      ?auto_255865 - BLOCK
      ?auto_255866 - BLOCK
      ?auto_255867 - BLOCK
      ?auto_255868 - BLOCK
      ?auto_255869 - BLOCK
      ?auto_255870 - BLOCK
      ?auto_255871 - BLOCK
      ?auto_255872 - BLOCK
      ?auto_255873 - BLOCK
      ?auto_255874 - BLOCK
    )
    :vars
    (
      ?auto_255875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255874 ?auto_255875 ) ( ON-TABLE ?auto_255864 ) ( ON ?auto_255865 ?auto_255864 ) ( ON ?auto_255866 ?auto_255865 ) ( ON ?auto_255867 ?auto_255866 ) ( ON ?auto_255868 ?auto_255867 ) ( ON ?auto_255869 ?auto_255868 ) ( ON ?auto_255870 ?auto_255869 ) ( ON ?auto_255871 ?auto_255870 ) ( not ( = ?auto_255864 ?auto_255865 ) ) ( not ( = ?auto_255864 ?auto_255866 ) ) ( not ( = ?auto_255864 ?auto_255867 ) ) ( not ( = ?auto_255864 ?auto_255868 ) ) ( not ( = ?auto_255864 ?auto_255869 ) ) ( not ( = ?auto_255864 ?auto_255870 ) ) ( not ( = ?auto_255864 ?auto_255871 ) ) ( not ( = ?auto_255864 ?auto_255872 ) ) ( not ( = ?auto_255864 ?auto_255873 ) ) ( not ( = ?auto_255864 ?auto_255874 ) ) ( not ( = ?auto_255864 ?auto_255875 ) ) ( not ( = ?auto_255865 ?auto_255866 ) ) ( not ( = ?auto_255865 ?auto_255867 ) ) ( not ( = ?auto_255865 ?auto_255868 ) ) ( not ( = ?auto_255865 ?auto_255869 ) ) ( not ( = ?auto_255865 ?auto_255870 ) ) ( not ( = ?auto_255865 ?auto_255871 ) ) ( not ( = ?auto_255865 ?auto_255872 ) ) ( not ( = ?auto_255865 ?auto_255873 ) ) ( not ( = ?auto_255865 ?auto_255874 ) ) ( not ( = ?auto_255865 ?auto_255875 ) ) ( not ( = ?auto_255866 ?auto_255867 ) ) ( not ( = ?auto_255866 ?auto_255868 ) ) ( not ( = ?auto_255866 ?auto_255869 ) ) ( not ( = ?auto_255866 ?auto_255870 ) ) ( not ( = ?auto_255866 ?auto_255871 ) ) ( not ( = ?auto_255866 ?auto_255872 ) ) ( not ( = ?auto_255866 ?auto_255873 ) ) ( not ( = ?auto_255866 ?auto_255874 ) ) ( not ( = ?auto_255866 ?auto_255875 ) ) ( not ( = ?auto_255867 ?auto_255868 ) ) ( not ( = ?auto_255867 ?auto_255869 ) ) ( not ( = ?auto_255867 ?auto_255870 ) ) ( not ( = ?auto_255867 ?auto_255871 ) ) ( not ( = ?auto_255867 ?auto_255872 ) ) ( not ( = ?auto_255867 ?auto_255873 ) ) ( not ( = ?auto_255867 ?auto_255874 ) ) ( not ( = ?auto_255867 ?auto_255875 ) ) ( not ( = ?auto_255868 ?auto_255869 ) ) ( not ( = ?auto_255868 ?auto_255870 ) ) ( not ( = ?auto_255868 ?auto_255871 ) ) ( not ( = ?auto_255868 ?auto_255872 ) ) ( not ( = ?auto_255868 ?auto_255873 ) ) ( not ( = ?auto_255868 ?auto_255874 ) ) ( not ( = ?auto_255868 ?auto_255875 ) ) ( not ( = ?auto_255869 ?auto_255870 ) ) ( not ( = ?auto_255869 ?auto_255871 ) ) ( not ( = ?auto_255869 ?auto_255872 ) ) ( not ( = ?auto_255869 ?auto_255873 ) ) ( not ( = ?auto_255869 ?auto_255874 ) ) ( not ( = ?auto_255869 ?auto_255875 ) ) ( not ( = ?auto_255870 ?auto_255871 ) ) ( not ( = ?auto_255870 ?auto_255872 ) ) ( not ( = ?auto_255870 ?auto_255873 ) ) ( not ( = ?auto_255870 ?auto_255874 ) ) ( not ( = ?auto_255870 ?auto_255875 ) ) ( not ( = ?auto_255871 ?auto_255872 ) ) ( not ( = ?auto_255871 ?auto_255873 ) ) ( not ( = ?auto_255871 ?auto_255874 ) ) ( not ( = ?auto_255871 ?auto_255875 ) ) ( not ( = ?auto_255872 ?auto_255873 ) ) ( not ( = ?auto_255872 ?auto_255874 ) ) ( not ( = ?auto_255872 ?auto_255875 ) ) ( not ( = ?auto_255873 ?auto_255874 ) ) ( not ( = ?auto_255873 ?auto_255875 ) ) ( not ( = ?auto_255874 ?auto_255875 ) ) ( ON ?auto_255873 ?auto_255874 ) ( CLEAR ?auto_255871 ) ( ON ?auto_255872 ?auto_255873 ) ( CLEAR ?auto_255872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_255864 ?auto_255865 ?auto_255866 ?auto_255867 ?auto_255868 ?auto_255869 ?auto_255870 ?auto_255871 ?auto_255872 )
      ( MAKE-11PILE ?auto_255864 ?auto_255865 ?auto_255866 ?auto_255867 ?auto_255868 ?auto_255869 ?auto_255870 ?auto_255871 ?auto_255872 ?auto_255873 ?auto_255874 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_255887 - BLOCK
      ?auto_255888 - BLOCK
      ?auto_255889 - BLOCK
      ?auto_255890 - BLOCK
      ?auto_255891 - BLOCK
      ?auto_255892 - BLOCK
      ?auto_255893 - BLOCK
      ?auto_255894 - BLOCK
      ?auto_255895 - BLOCK
      ?auto_255896 - BLOCK
      ?auto_255897 - BLOCK
    )
    :vars
    (
      ?auto_255898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255897 ?auto_255898 ) ( ON-TABLE ?auto_255887 ) ( ON ?auto_255888 ?auto_255887 ) ( ON ?auto_255889 ?auto_255888 ) ( ON ?auto_255890 ?auto_255889 ) ( ON ?auto_255891 ?auto_255890 ) ( ON ?auto_255892 ?auto_255891 ) ( ON ?auto_255893 ?auto_255892 ) ( not ( = ?auto_255887 ?auto_255888 ) ) ( not ( = ?auto_255887 ?auto_255889 ) ) ( not ( = ?auto_255887 ?auto_255890 ) ) ( not ( = ?auto_255887 ?auto_255891 ) ) ( not ( = ?auto_255887 ?auto_255892 ) ) ( not ( = ?auto_255887 ?auto_255893 ) ) ( not ( = ?auto_255887 ?auto_255894 ) ) ( not ( = ?auto_255887 ?auto_255895 ) ) ( not ( = ?auto_255887 ?auto_255896 ) ) ( not ( = ?auto_255887 ?auto_255897 ) ) ( not ( = ?auto_255887 ?auto_255898 ) ) ( not ( = ?auto_255888 ?auto_255889 ) ) ( not ( = ?auto_255888 ?auto_255890 ) ) ( not ( = ?auto_255888 ?auto_255891 ) ) ( not ( = ?auto_255888 ?auto_255892 ) ) ( not ( = ?auto_255888 ?auto_255893 ) ) ( not ( = ?auto_255888 ?auto_255894 ) ) ( not ( = ?auto_255888 ?auto_255895 ) ) ( not ( = ?auto_255888 ?auto_255896 ) ) ( not ( = ?auto_255888 ?auto_255897 ) ) ( not ( = ?auto_255888 ?auto_255898 ) ) ( not ( = ?auto_255889 ?auto_255890 ) ) ( not ( = ?auto_255889 ?auto_255891 ) ) ( not ( = ?auto_255889 ?auto_255892 ) ) ( not ( = ?auto_255889 ?auto_255893 ) ) ( not ( = ?auto_255889 ?auto_255894 ) ) ( not ( = ?auto_255889 ?auto_255895 ) ) ( not ( = ?auto_255889 ?auto_255896 ) ) ( not ( = ?auto_255889 ?auto_255897 ) ) ( not ( = ?auto_255889 ?auto_255898 ) ) ( not ( = ?auto_255890 ?auto_255891 ) ) ( not ( = ?auto_255890 ?auto_255892 ) ) ( not ( = ?auto_255890 ?auto_255893 ) ) ( not ( = ?auto_255890 ?auto_255894 ) ) ( not ( = ?auto_255890 ?auto_255895 ) ) ( not ( = ?auto_255890 ?auto_255896 ) ) ( not ( = ?auto_255890 ?auto_255897 ) ) ( not ( = ?auto_255890 ?auto_255898 ) ) ( not ( = ?auto_255891 ?auto_255892 ) ) ( not ( = ?auto_255891 ?auto_255893 ) ) ( not ( = ?auto_255891 ?auto_255894 ) ) ( not ( = ?auto_255891 ?auto_255895 ) ) ( not ( = ?auto_255891 ?auto_255896 ) ) ( not ( = ?auto_255891 ?auto_255897 ) ) ( not ( = ?auto_255891 ?auto_255898 ) ) ( not ( = ?auto_255892 ?auto_255893 ) ) ( not ( = ?auto_255892 ?auto_255894 ) ) ( not ( = ?auto_255892 ?auto_255895 ) ) ( not ( = ?auto_255892 ?auto_255896 ) ) ( not ( = ?auto_255892 ?auto_255897 ) ) ( not ( = ?auto_255892 ?auto_255898 ) ) ( not ( = ?auto_255893 ?auto_255894 ) ) ( not ( = ?auto_255893 ?auto_255895 ) ) ( not ( = ?auto_255893 ?auto_255896 ) ) ( not ( = ?auto_255893 ?auto_255897 ) ) ( not ( = ?auto_255893 ?auto_255898 ) ) ( not ( = ?auto_255894 ?auto_255895 ) ) ( not ( = ?auto_255894 ?auto_255896 ) ) ( not ( = ?auto_255894 ?auto_255897 ) ) ( not ( = ?auto_255894 ?auto_255898 ) ) ( not ( = ?auto_255895 ?auto_255896 ) ) ( not ( = ?auto_255895 ?auto_255897 ) ) ( not ( = ?auto_255895 ?auto_255898 ) ) ( not ( = ?auto_255896 ?auto_255897 ) ) ( not ( = ?auto_255896 ?auto_255898 ) ) ( not ( = ?auto_255897 ?auto_255898 ) ) ( ON ?auto_255896 ?auto_255897 ) ( ON ?auto_255895 ?auto_255896 ) ( CLEAR ?auto_255893 ) ( ON ?auto_255894 ?auto_255895 ) ( CLEAR ?auto_255894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_255887 ?auto_255888 ?auto_255889 ?auto_255890 ?auto_255891 ?auto_255892 ?auto_255893 ?auto_255894 )
      ( MAKE-11PILE ?auto_255887 ?auto_255888 ?auto_255889 ?auto_255890 ?auto_255891 ?auto_255892 ?auto_255893 ?auto_255894 ?auto_255895 ?auto_255896 ?auto_255897 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_255910 - BLOCK
      ?auto_255911 - BLOCK
      ?auto_255912 - BLOCK
      ?auto_255913 - BLOCK
      ?auto_255914 - BLOCK
      ?auto_255915 - BLOCK
      ?auto_255916 - BLOCK
      ?auto_255917 - BLOCK
      ?auto_255918 - BLOCK
      ?auto_255919 - BLOCK
      ?auto_255920 - BLOCK
    )
    :vars
    (
      ?auto_255921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255920 ?auto_255921 ) ( ON-TABLE ?auto_255910 ) ( ON ?auto_255911 ?auto_255910 ) ( ON ?auto_255912 ?auto_255911 ) ( ON ?auto_255913 ?auto_255912 ) ( ON ?auto_255914 ?auto_255913 ) ( ON ?auto_255915 ?auto_255914 ) ( ON ?auto_255916 ?auto_255915 ) ( not ( = ?auto_255910 ?auto_255911 ) ) ( not ( = ?auto_255910 ?auto_255912 ) ) ( not ( = ?auto_255910 ?auto_255913 ) ) ( not ( = ?auto_255910 ?auto_255914 ) ) ( not ( = ?auto_255910 ?auto_255915 ) ) ( not ( = ?auto_255910 ?auto_255916 ) ) ( not ( = ?auto_255910 ?auto_255917 ) ) ( not ( = ?auto_255910 ?auto_255918 ) ) ( not ( = ?auto_255910 ?auto_255919 ) ) ( not ( = ?auto_255910 ?auto_255920 ) ) ( not ( = ?auto_255910 ?auto_255921 ) ) ( not ( = ?auto_255911 ?auto_255912 ) ) ( not ( = ?auto_255911 ?auto_255913 ) ) ( not ( = ?auto_255911 ?auto_255914 ) ) ( not ( = ?auto_255911 ?auto_255915 ) ) ( not ( = ?auto_255911 ?auto_255916 ) ) ( not ( = ?auto_255911 ?auto_255917 ) ) ( not ( = ?auto_255911 ?auto_255918 ) ) ( not ( = ?auto_255911 ?auto_255919 ) ) ( not ( = ?auto_255911 ?auto_255920 ) ) ( not ( = ?auto_255911 ?auto_255921 ) ) ( not ( = ?auto_255912 ?auto_255913 ) ) ( not ( = ?auto_255912 ?auto_255914 ) ) ( not ( = ?auto_255912 ?auto_255915 ) ) ( not ( = ?auto_255912 ?auto_255916 ) ) ( not ( = ?auto_255912 ?auto_255917 ) ) ( not ( = ?auto_255912 ?auto_255918 ) ) ( not ( = ?auto_255912 ?auto_255919 ) ) ( not ( = ?auto_255912 ?auto_255920 ) ) ( not ( = ?auto_255912 ?auto_255921 ) ) ( not ( = ?auto_255913 ?auto_255914 ) ) ( not ( = ?auto_255913 ?auto_255915 ) ) ( not ( = ?auto_255913 ?auto_255916 ) ) ( not ( = ?auto_255913 ?auto_255917 ) ) ( not ( = ?auto_255913 ?auto_255918 ) ) ( not ( = ?auto_255913 ?auto_255919 ) ) ( not ( = ?auto_255913 ?auto_255920 ) ) ( not ( = ?auto_255913 ?auto_255921 ) ) ( not ( = ?auto_255914 ?auto_255915 ) ) ( not ( = ?auto_255914 ?auto_255916 ) ) ( not ( = ?auto_255914 ?auto_255917 ) ) ( not ( = ?auto_255914 ?auto_255918 ) ) ( not ( = ?auto_255914 ?auto_255919 ) ) ( not ( = ?auto_255914 ?auto_255920 ) ) ( not ( = ?auto_255914 ?auto_255921 ) ) ( not ( = ?auto_255915 ?auto_255916 ) ) ( not ( = ?auto_255915 ?auto_255917 ) ) ( not ( = ?auto_255915 ?auto_255918 ) ) ( not ( = ?auto_255915 ?auto_255919 ) ) ( not ( = ?auto_255915 ?auto_255920 ) ) ( not ( = ?auto_255915 ?auto_255921 ) ) ( not ( = ?auto_255916 ?auto_255917 ) ) ( not ( = ?auto_255916 ?auto_255918 ) ) ( not ( = ?auto_255916 ?auto_255919 ) ) ( not ( = ?auto_255916 ?auto_255920 ) ) ( not ( = ?auto_255916 ?auto_255921 ) ) ( not ( = ?auto_255917 ?auto_255918 ) ) ( not ( = ?auto_255917 ?auto_255919 ) ) ( not ( = ?auto_255917 ?auto_255920 ) ) ( not ( = ?auto_255917 ?auto_255921 ) ) ( not ( = ?auto_255918 ?auto_255919 ) ) ( not ( = ?auto_255918 ?auto_255920 ) ) ( not ( = ?auto_255918 ?auto_255921 ) ) ( not ( = ?auto_255919 ?auto_255920 ) ) ( not ( = ?auto_255919 ?auto_255921 ) ) ( not ( = ?auto_255920 ?auto_255921 ) ) ( ON ?auto_255919 ?auto_255920 ) ( ON ?auto_255918 ?auto_255919 ) ( CLEAR ?auto_255916 ) ( ON ?auto_255917 ?auto_255918 ) ( CLEAR ?auto_255917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_255910 ?auto_255911 ?auto_255912 ?auto_255913 ?auto_255914 ?auto_255915 ?auto_255916 ?auto_255917 )
      ( MAKE-11PILE ?auto_255910 ?auto_255911 ?auto_255912 ?auto_255913 ?auto_255914 ?auto_255915 ?auto_255916 ?auto_255917 ?auto_255918 ?auto_255919 ?auto_255920 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_255933 - BLOCK
      ?auto_255934 - BLOCK
      ?auto_255935 - BLOCK
      ?auto_255936 - BLOCK
      ?auto_255937 - BLOCK
      ?auto_255938 - BLOCK
      ?auto_255939 - BLOCK
      ?auto_255940 - BLOCK
      ?auto_255941 - BLOCK
      ?auto_255942 - BLOCK
      ?auto_255943 - BLOCK
    )
    :vars
    (
      ?auto_255944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255943 ?auto_255944 ) ( ON-TABLE ?auto_255933 ) ( ON ?auto_255934 ?auto_255933 ) ( ON ?auto_255935 ?auto_255934 ) ( ON ?auto_255936 ?auto_255935 ) ( ON ?auto_255937 ?auto_255936 ) ( ON ?auto_255938 ?auto_255937 ) ( not ( = ?auto_255933 ?auto_255934 ) ) ( not ( = ?auto_255933 ?auto_255935 ) ) ( not ( = ?auto_255933 ?auto_255936 ) ) ( not ( = ?auto_255933 ?auto_255937 ) ) ( not ( = ?auto_255933 ?auto_255938 ) ) ( not ( = ?auto_255933 ?auto_255939 ) ) ( not ( = ?auto_255933 ?auto_255940 ) ) ( not ( = ?auto_255933 ?auto_255941 ) ) ( not ( = ?auto_255933 ?auto_255942 ) ) ( not ( = ?auto_255933 ?auto_255943 ) ) ( not ( = ?auto_255933 ?auto_255944 ) ) ( not ( = ?auto_255934 ?auto_255935 ) ) ( not ( = ?auto_255934 ?auto_255936 ) ) ( not ( = ?auto_255934 ?auto_255937 ) ) ( not ( = ?auto_255934 ?auto_255938 ) ) ( not ( = ?auto_255934 ?auto_255939 ) ) ( not ( = ?auto_255934 ?auto_255940 ) ) ( not ( = ?auto_255934 ?auto_255941 ) ) ( not ( = ?auto_255934 ?auto_255942 ) ) ( not ( = ?auto_255934 ?auto_255943 ) ) ( not ( = ?auto_255934 ?auto_255944 ) ) ( not ( = ?auto_255935 ?auto_255936 ) ) ( not ( = ?auto_255935 ?auto_255937 ) ) ( not ( = ?auto_255935 ?auto_255938 ) ) ( not ( = ?auto_255935 ?auto_255939 ) ) ( not ( = ?auto_255935 ?auto_255940 ) ) ( not ( = ?auto_255935 ?auto_255941 ) ) ( not ( = ?auto_255935 ?auto_255942 ) ) ( not ( = ?auto_255935 ?auto_255943 ) ) ( not ( = ?auto_255935 ?auto_255944 ) ) ( not ( = ?auto_255936 ?auto_255937 ) ) ( not ( = ?auto_255936 ?auto_255938 ) ) ( not ( = ?auto_255936 ?auto_255939 ) ) ( not ( = ?auto_255936 ?auto_255940 ) ) ( not ( = ?auto_255936 ?auto_255941 ) ) ( not ( = ?auto_255936 ?auto_255942 ) ) ( not ( = ?auto_255936 ?auto_255943 ) ) ( not ( = ?auto_255936 ?auto_255944 ) ) ( not ( = ?auto_255937 ?auto_255938 ) ) ( not ( = ?auto_255937 ?auto_255939 ) ) ( not ( = ?auto_255937 ?auto_255940 ) ) ( not ( = ?auto_255937 ?auto_255941 ) ) ( not ( = ?auto_255937 ?auto_255942 ) ) ( not ( = ?auto_255937 ?auto_255943 ) ) ( not ( = ?auto_255937 ?auto_255944 ) ) ( not ( = ?auto_255938 ?auto_255939 ) ) ( not ( = ?auto_255938 ?auto_255940 ) ) ( not ( = ?auto_255938 ?auto_255941 ) ) ( not ( = ?auto_255938 ?auto_255942 ) ) ( not ( = ?auto_255938 ?auto_255943 ) ) ( not ( = ?auto_255938 ?auto_255944 ) ) ( not ( = ?auto_255939 ?auto_255940 ) ) ( not ( = ?auto_255939 ?auto_255941 ) ) ( not ( = ?auto_255939 ?auto_255942 ) ) ( not ( = ?auto_255939 ?auto_255943 ) ) ( not ( = ?auto_255939 ?auto_255944 ) ) ( not ( = ?auto_255940 ?auto_255941 ) ) ( not ( = ?auto_255940 ?auto_255942 ) ) ( not ( = ?auto_255940 ?auto_255943 ) ) ( not ( = ?auto_255940 ?auto_255944 ) ) ( not ( = ?auto_255941 ?auto_255942 ) ) ( not ( = ?auto_255941 ?auto_255943 ) ) ( not ( = ?auto_255941 ?auto_255944 ) ) ( not ( = ?auto_255942 ?auto_255943 ) ) ( not ( = ?auto_255942 ?auto_255944 ) ) ( not ( = ?auto_255943 ?auto_255944 ) ) ( ON ?auto_255942 ?auto_255943 ) ( ON ?auto_255941 ?auto_255942 ) ( ON ?auto_255940 ?auto_255941 ) ( CLEAR ?auto_255938 ) ( ON ?auto_255939 ?auto_255940 ) ( CLEAR ?auto_255939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_255933 ?auto_255934 ?auto_255935 ?auto_255936 ?auto_255937 ?auto_255938 ?auto_255939 )
      ( MAKE-11PILE ?auto_255933 ?auto_255934 ?auto_255935 ?auto_255936 ?auto_255937 ?auto_255938 ?auto_255939 ?auto_255940 ?auto_255941 ?auto_255942 ?auto_255943 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_255956 - BLOCK
      ?auto_255957 - BLOCK
      ?auto_255958 - BLOCK
      ?auto_255959 - BLOCK
      ?auto_255960 - BLOCK
      ?auto_255961 - BLOCK
      ?auto_255962 - BLOCK
      ?auto_255963 - BLOCK
      ?auto_255964 - BLOCK
      ?auto_255965 - BLOCK
      ?auto_255966 - BLOCK
    )
    :vars
    (
      ?auto_255967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255966 ?auto_255967 ) ( ON-TABLE ?auto_255956 ) ( ON ?auto_255957 ?auto_255956 ) ( ON ?auto_255958 ?auto_255957 ) ( ON ?auto_255959 ?auto_255958 ) ( ON ?auto_255960 ?auto_255959 ) ( ON ?auto_255961 ?auto_255960 ) ( not ( = ?auto_255956 ?auto_255957 ) ) ( not ( = ?auto_255956 ?auto_255958 ) ) ( not ( = ?auto_255956 ?auto_255959 ) ) ( not ( = ?auto_255956 ?auto_255960 ) ) ( not ( = ?auto_255956 ?auto_255961 ) ) ( not ( = ?auto_255956 ?auto_255962 ) ) ( not ( = ?auto_255956 ?auto_255963 ) ) ( not ( = ?auto_255956 ?auto_255964 ) ) ( not ( = ?auto_255956 ?auto_255965 ) ) ( not ( = ?auto_255956 ?auto_255966 ) ) ( not ( = ?auto_255956 ?auto_255967 ) ) ( not ( = ?auto_255957 ?auto_255958 ) ) ( not ( = ?auto_255957 ?auto_255959 ) ) ( not ( = ?auto_255957 ?auto_255960 ) ) ( not ( = ?auto_255957 ?auto_255961 ) ) ( not ( = ?auto_255957 ?auto_255962 ) ) ( not ( = ?auto_255957 ?auto_255963 ) ) ( not ( = ?auto_255957 ?auto_255964 ) ) ( not ( = ?auto_255957 ?auto_255965 ) ) ( not ( = ?auto_255957 ?auto_255966 ) ) ( not ( = ?auto_255957 ?auto_255967 ) ) ( not ( = ?auto_255958 ?auto_255959 ) ) ( not ( = ?auto_255958 ?auto_255960 ) ) ( not ( = ?auto_255958 ?auto_255961 ) ) ( not ( = ?auto_255958 ?auto_255962 ) ) ( not ( = ?auto_255958 ?auto_255963 ) ) ( not ( = ?auto_255958 ?auto_255964 ) ) ( not ( = ?auto_255958 ?auto_255965 ) ) ( not ( = ?auto_255958 ?auto_255966 ) ) ( not ( = ?auto_255958 ?auto_255967 ) ) ( not ( = ?auto_255959 ?auto_255960 ) ) ( not ( = ?auto_255959 ?auto_255961 ) ) ( not ( = ?auto_255959 ?auto_255962 ) ) ( not ( = ?auto_255959 ?auto_255963 ) ) ( not ( = ?auto_255959 ?auto_255964 ) ) ( not ( = ?auto_255959 ?auto_255965 ) ) ( not ( = ?auto_255959 ?auto_255966 ) ) ( not ( = ?auto_255959 ?auto_255967 ) ) ( not ( = ?auto_255960 ?auto_255961 ) ) ( not ( = ?auto_255960 ?auto_255962 ) ) ( not ( = ?auto_255960 ?auto_255963 ) ) ( not ( = ?auto_255960 ?auto_255964 ) ) ( not ( = ?auto_255960 ?auto_255965 ) ) ( not ( = ?auto_255960 ?auto_255966 ) ) ( not ( = ?auto_255960 ?auto_255967 ) ) ( not ( = ?auto_255961 ?auto_255962 ) ) ( not ( = ?auto_255961 ?auto_255963 ) ) ( not ( = ?auto_255961 ?auto_255964 ) ) ( not ( = ?auto_255961 ?auto_255965 ) ) ( not ( = ?auto_255961 ?auto_255966 ) ) ( not ( = ?auto_255961 ?auto_255967 ) ) ( not ( = ?auto_255962 ?auto_255963 ) ) ( not ( = ?auto_255962 ?auto_255964 ) ) ( not ( = ?auto_255962 ?auto_255965 ) ) ( not ( = ?auto_255962 ?auto_255966 ) ) ( not ( = ?auto_255962 ?auto_255967 ) ) ( not ( = ?auto_255963 ?auto_255964 ) ) ( not ( = ?auto_255963 ?auto_255965 ) ) ( not ( = ?auto_255963 ?auto_255966 ) ) ( not ( = ?auto_255963 ?auto_255967 ) ) ( not ( = ?auto_255964 ?auto_255965 ) ) ( not ( = ?auto_255964 ?auto_255966 ) ) ( not ( = ?auto_255964 ?auto_255967 ) ) ( not ( = ?auto_255965 ?auto_255966 ) ) ( not ( = ?auto_255965 ?auto_255967 ) ) ( not ( = ?auto_255966 ?auto_255967 ) ) ( ON ?auto_255965 ?auto_255966 ) ( ON ?auto_255964 ?auto_255965 ) ( ON ?auto_255963 ?auto_255964 ) ( CLEAR ?auto_255961 ) ( ON ?auto_255962 ?auto_255963 ) ( CLEAR ?auto_255962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_255956 ?auto_255957 ?auto_255958 ?auto_255959 ?auto_255960 ?auto_255961 ?auto_255962 )
      ( MAKE-11PILE ?auto_255956 ?auto_255957 ?auto_255958 ?auto_255959 ?auto_255960 ?auto_255961 ?auto_255962 ?auto_255963 ?auto_255964 ?auto_255965 ?auto_255966 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_255979 - BLOCK
      ?auto_255980 - BLOCK
      ?auto_255981 - BLOCK
      ?auto_255982 - BLOCK
      ?auto_255983 - BLOCK
      ?auto_255984 - BLOCK
      ?auto_255985 - BLOCK
      ?auto_255986 - BLOCK
      ?auto_255987 - BLOCK
      ?auto_255988 - BLOCK
      ?auto_255989 - BLOCK
    )
    :vars
    (
      ?auto_255990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_255989 ?auto_255990 ) ( ON-TABLE ?auto_255979 ) ( ON ?auto_255980 ?auto_255979 ) ( ON ?auto_255981 ?auto_255980 ) ( ON ?auto_255982 ?auto_255981 ) ( ON ?auto_255983 ?auto_255982 ) ( not ( = ?auto_255979 ?auto_255980 ) ) ( not ( = ?auto_255979 ?auto_255981 ) ) ( not ( = ?auto_255979 ?auto_255982 ) ) ( not ( = ?auto_255979 ?auto_255983 ) ) ( not ( = ?auto_255979 ?auto_255984 ) ) ( not ( = ?auto_255979 ?auto_255985 ) ) ( not ( = ?auto_255979 ?auto_255986 ) ) ( not ( = ?auto_255979 ?auto_255987 ) ) ( not ( = ?auto_255979 ?auto_255988 ) ) ( not ( = ?auto_255979 ?auto_255989 ) ) ( not ( = ?auto_255979 ?auto_255990 ) ) ( not ( = ?auto_255980 ?auto_255981 ) ) ( not ( = ?auto_255980 ?auto_255982 ) ) ( not ( = ?auto_255980 ?auto_255983 ) ) ( not ( = ?auto_255980 ?auto_255984 ) ) ( not ( = ?auto_255980 ?auto_255985 ) ) ( not ( = ?auto_255980 ?auto_255986 ) ) ( not ( = ?auto_255980 ?auto_255987 ) ) ( not ( = ?auto_255980 ?auto_255988 ) ) ( not ( = ?auto_255980 ?auto_255989 ) ) ( not ( = ?auto_255980 ?auto_255990 ) ) ( not ( = ?auto_255981 ?auto_255982 ) ) ( not ( = ?auto_255981 ?auto_255983 ) ) ( not ( = ?auto_255981 ?auto_255984 ) ) ( not ( = ?auto_255981 ?auto_255985 ) ) ( not ( = ?auto_255981 ?auto_255986 ) ) ( not ( = ?auto_255981 ?auto_255987 ) ) ( not ( = ?auto_255981 ?auto_255988 ) ) ( not ( = ?auto_255981 ?auto_255989 ) ) ( not ( = ?auto_255981 ?auto_255990 ) ) ( not ( = ?auto_255982 ?auto_255983 ) ) ( not ( = ?auto_255982 ?auto_255984 ) ) ( not ( = ?auto_255982 ?auto_255985 ) ) ( not ( = ?auto_255982 ?auto_255986 ) ) ( not ( = ?auto_255982 ?auto_255987 ) ) ( not ( = ?auto_255982 ?auto_255988 ) ) ( not ( = ?auto_255982 ?auto_255989 ) ) ( not ( = ?auto_255982 ?auto_255990 ) ) ( not ( = ?auto_255983 ?auto_255984 ) ) ( not ( = ?auto_255983 ?auto_255985 ) ) ( not ( = ?auto_255983 ?auto_255986 ) ) ( not ( = ?auto_255983 ?auto_255987 ) ) ( not ( = ?auto_255983 ?auto_255988 ) ) ( not ( = ?auto_255983 ?auto_255989 ) ) ( not ( = ?auto_255983 ?auto_255990 ) ) ( not ( = ?auto_255984 ?auto_255985 ) ) ( not ( = ?auto_255984 ?auto_255986 ) ) ( not ( = ?auto_255984 ?auto_255987 ) ) ( not ( = ?auto_255984 ?auto_255988 ) ) ( not ( = ?auto_255984 ?auto_255989 ) ) ( not ( = ?auto_255984 ?auto_255990 ) ) ( not ( = ?auto_255985 ?auto_255986 ) ) ( not ( = ?auto_255985 ?auto_255987 ) ) ( not ( = ?auto_255985 ?auto_255988 ) ) ( not ( = ?auto_255985 ?auto_255989 ) ) ( not ( = ?auto_255985 ?auto_255990 ) ) ( not ( = ?auto_255986 ?auto_255987 ) ) ( not ( = ?auto_255986 ?auto_255988 ) ) ( not ( = ?auto_255986 ?auto_255989 ) ) ( not ( = ?auto_255986 ?auto_255990 ) ) ( not ( = ?auto_255987 ?auto_255988 ) ) ( not ( = ?auto_255987 ?auto_255989 ) ) ( not ( = ?auto_255987 ?auto_255990 ) ) ( not ( = ?auto_255988 ?auto_255989 ) ) ( not ( = ?auto_255988 ?auto_255990 ) ) ( not ( = ?auto_255989 ?auto_255990 ) ) ( ON ?auto_255988 ?auto_255989 ) ( ON ?auto_255987 ?auto_255988 ) ( ON ?auto_255986 ?auto_255987 ) ( ON ?auto_255985 ?auto_255986 ) ( CLEAR ?auto_255983 ) ( ON ?auto_255984 ?auto_255985 ) ( CLEAR ?auto_255984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_255979 ?auto_255980 ?auto_255981 ?auto_255982 ?auto_255983 ?auto_255984 )
      ( MAKE-11PILE ?auto_255979 ?auto_255980 ?auto_255981 ?auto_255982 ?auto_255983 ?auto_255984 ?auto_255985 ?auto_255986 ?auto_255987 ?auto_255988 ?auto_255989 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_256002 - BLOCK
      ?auto_256003 - BLOCK
      ?auto_256004 - BLOCK
      ?auto_256005 - BLOCK
      ?auto_256006 - BLOCK
      ?auto_256007 - BLOCK
      ?auto_256008 - BLOCK
      ?auto_256009 - BLOCK
      ?auto_256010 - BLOCK
      ?auto_256011 - BLOCK
      ?auto_256012 - BLOCK
    )
    :vars
    (
      ?auto_256013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256012 ?auto_256013 ) ( ON-TABLE ?auto_256002 ) ( ON ?auto_256003 ?auto_256002 ) ( ON ?auto_256004 ?auto_256003 ) ( ON ?auto_256005 ?auto_256004 ) ( ON ?auto_256006 ?auto_256005 ) ( not ( = ?auto_256002 ?auto_256003 ) ) ( not ( = ?auto_256002 ?auto_256004 ) ) ( not ( = ?auto_256002 ?auto_256005 ) ) ( not ( = ?auto_256002 ?auto_256006 ) ) ( not ( = ?auto_256002 ?auto_256007 ) ) ( not ( = ?auto_256002 ?auto_256008 ) ) ( not ( = ?auto_256002 ?auto_256009 ) ) ( not ( = ?auto_256002 ?auto_256010 ) ) ( not ( = ?auto_256002 ?auto_256011 ) ) ( not ( = ?auto_256002 ?auto_256012 ) ) ( not ( = ?auto_256002 ?auto_256013 ) ) ( not ( = ?auto_256003 ?auto_256004 ) ) ( not ( = ?auto_256003 ?auto_256005 ) ) ( not ( = ?auto_256003 ?auto_256006 ) ) ( not ( = ?auto_256003 ?auto_256007 ) ) ( not ( = ?auto_256003 ?auto_256008 ) ) ( not ( = ?auto_256003 ?auto_256009 ) ) ( not ( = ?auto_256003 ?auto_256010 ) ) ( not ( = ?auto_256003 ?auto_256011 ) ) ( not ( = ?auto_256003 ?auto_256012 ) ) ( not ( = ?auto_256003 ?auto_256013 ) ) ( not ( = ?auto_256004 ?auto_256005 ) ) ( not ( = ?auto_256004 ?auto_256006 ) ) ( not ( = ?auto_256004 ?auto_256007 ) ) ( not ( = ?auto_256004 ?auto_256008 ) ) ( not ( = ?auto_256004 ?auto_256009 ) ) ( not ( = ?auto_256004 ?auto_256010 ) ) ( not ( = ?auto_256004 ?auto_256011 ) ) ( not ( = ?auto_256004 ?auto_256012 ) ) ( not ( = ?auto_256004 ?auto_256013 ) ) ( not ( = ?auto_256005 ?auto_256006 ) ) ( not ( = ?auto_256005 ?auto_256007 ) ) ( not ( = ?auto_256005 ?auto_256008 ) ) ( not ( = ?auto_256005 ?auto_256009 ) ) ( not ( = ?auto_256005 ?auto_256010 ) ) ( not ( = ?auto_256005 ?auto_256011 ) ) ( not ( = ?auto_256005 ?auto_256012 ) ) ( not ( = ?auto_256005 ?auto_256013 ) ) ( not ( = ?auto_256006 ?auto_256007 ) ) ( not ( = ?auto_256006 ?auto_256008 ) ) ( not ( = ?auto_256006 ?auto_256009 ) ) ( not ( = ?auto_256006 ?auto_256010 ) ) ( not ( = ?auto_256006 ?auto_256011 ) ) ( not ( = ?auto_256006 ?auto_256012 ) ) ( not ( = ?auto_256006 ?auto_256013 ) ) ( not ( = ?auto_256007 ?auto_256008 ) ) ( not ( = ?auto_256007 ?auto_256009 ) ) ( not ( = ?auto_256007 ?auto_256010 ) ) ( not ( = ?auto_256007 ?auto_256011 ) ) ( not ( = ?auto_256007 ?auto_256012 ) ) ( not ( = ?auto_256007 ?auto_256013 ) ) ( not ( = ?auto_256008 ?auto_256009 ) ) ( not ( = ?auto_256008 ?auto_256010 ) ) ( not ( = ?auto_256008 ?auto_256011 ) ) ( not ( = ?auto_256008 ?auto_256012 ) ) ( not ( = ?auto_256008 ?auto_256013 ) ) ( not ( = ?auto_256009 ?auto_256010 ) ) ( not ( = ?auto_256009 ?auto_256011 ) ) ( not ( = ?auto_256009 ?auto_256012 ) ) ( not ( = ?auto_256009 ?auto_256013 ) ) ( not ( = ?auto_256010 ?auto_256011 ) ) ( not ( = ?auto_256010 ?auto_256012 ) ) ( not ( = ?auto_256010 ?auto_256013 ) ) ( not ( = ?auto_256011 ?auto_256012 ) ) ( not ( = ?auto_256011 ?auto_256013 ) ) ( not ( = ?auto_256012 ?auto_256013 ) ) ( ON ?auto_256011 ?auto_256012 ) ( ON ?auto_256010 ?auto_256011 ) ( ON ?auto_256009 ?auto_256010 ) ( ON ?auto_256008 ?auto_256009 ) ( CLEAR ?auto_256006 ) ( ON ?auto_256007 ?auto_256008 ) ( CLEAR ?auto_256007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_256002 ?auto_256003 ?auto_256004 ?auto_256005 ?auto_256006 ?auto_256007 )
      ( MAKE-11PILE ?auto_256002 ?auto_256003 ?auto_256004 ?auto_256005 ?auto_256006 ?auto_256007 ?auto_256008 ?auto_256009 ?auto_256010 ?auto_256011 ?auto_256012 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_256025 - BLOCK
      ?auto_256026 - BLOCK
      ?auto_256027 - BLOCK
      ?auto_256028 - BLOCK
      ?auto_256029 - BLOCK
      ?auto_256030 - BLOCK
      ?auto_256031 - BLOCK
      ?auto_256032 - BLOCK
      ?auto_256033 - BLOCK
      ?auto_256034 - BLOCK
      ?auto_256035 - BLOCK
    )
    :vars
    (
      ?auto_256036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256035 ?auto_256036 ) ( ON-TABLE ?auto_256025 ) ( ON ?auto_256026 ?auto_256025 ) ( ON ?auto_256027 ?auto_256026 ) ( ON ?auto_256028 ?auto_256027 ) ( not ( = ?auto_256025 ?auto_256026 ) ) ( not ( = ?auto_256025 ?auto_256027 ) ) ( not ( = ?auto_256025 ?auto_256028 ) ) ( not ( = ?auto_256025 ?auto_256029 ) ) ( not ( = ?auto_256025 ?auto_256030 ) ) ( not ( = ?auto_256025 ?auto_256031 ) ) ( not ( = ?auto_256025 ?auto_256032 ) ) ( not ( = ?auto_256025 ?auto_256033 ) ) ( not ( = ?auto_256025 ?auto_256034 ) ) ( not ( = ?auto_256025 ?auto_256035 ) ) ( not ( = ?auto_256025 ?auto_256036 ) ) ( not ( = ?auto_256026 ?auto_256027 ) ) ( not ( = ?auto_256026 ?auto_256028 ) ) ( not ( = ?auto_256026 ?auto_256029 ) ) ( not ( = ?auto_256026 ?auto_256030 ) ) ( not ( = ?auto_256026 ?auto_256031 ) ) ( not ( = ?auto_256026 ?auto_256032 ) ) ( not ( = ?auto_256026 ?auto_256033 ) ) ( not ( = ?auto_256026 ?auto_256034 ) ) ( not ( = ?auto_256026 ?auto_256035 ) ) ( not ( = ?auto_256026 ?auto_256036 ) ) ( not ( = ?auto_256027 ?auto_256028 ) ) ( not ( = ?auto_256027 ?auto_256029 ) ) ( not ( = ?auto_256027 ?auto_256030 ) ) ( not ( = ?auto_256027 ?auto_256031 ) ) ( not ( = ?auto_256027 ?auto_256032 ) ) ( not ( = ?auto_256027 ?auto_256033 ) ) ( not ( = ?auto_256027 ?auto_256034 ) ) ( not ( = ?auto_256027 ?auto_256035 ) ) ( not ( = ?auto_256027 ?auto_256036 ) ) ( not ( = ?auto_256028 ?auto_256029 ) ) ( not ( = ?auto_256028 ?auto_256030 ) ) ( not ( = ?auto_256028 ?auto_256031 ) ) ( not ( = ?auto_256028 ?auto_256032 ) ) ( not ( = ?auto_256028 ?auto_256033 ) ) ( not ( = ?auto_256028 ?auto_256034 ) ) ( not ( = ?auto_256028 ?auto_256035 ) ) ( not ( = ?auto_256028 ?auto_256036 ) ) ( not ( = ?auto_256029 ?auto_256030 ) ) ( not ( = ?auto_256029 ?auto_256031 ) ) ( not ( = ?auto_256029 ?auto_256032 ) ) ( not ( = ?auto_256029 ?auto_256033 ) ) ( not ( = ?auto_256029 ?auto_256034 ) ) ( not ( = ?auto_256029 ?auto_256035 ) ) ( not ( = ?auto_256029 ?auto_256036 ) ) ( not ( = ?auto_256030 ?auto_256031 ) ) ( not ( = ?auto_256030 ?auto_256032 ) ) ( not ( = ?auto_256030 ?auto_256033 ) ) ( not ( = ?auto_256030 ?auto_256034 ) ) ( not ( = ?auto_256030 ?auto_256035 ) ) ( not ( = ?auto_256030 ?auto_256036 ) ) ( not ( = ?auto_256031 ?auto_256032 ) ) ( not ( = ?auto_256031 ?auto_256033 ) ) ( not ( = ?auto_256031 ?auto_256034 ) ) ( not ( = ?auto_256031 ?auto_256035 ) ) ( not ( = ?auto_256031 ?auto_256036 ) ) ( not ( = ?auto_256032 ?auto_256033 ) ) ( not ( = ?auto_256032 ?auto_256034 ) ) ( not ( = ?auto_256032 ?auto_256035 ) ) ( not ( = ?auto_256032 ?auto_256036 ) ) ( not ( = ?auto_256033 ?auto_256034 ) ) ( not ( = ?auto_256033 ?auto_256035 ) ) ( not ( = ?auto_256033 ?auto_256036 ) ) ( not ( = ?auto_256034 ?auto_256035 ) ) ( not ( = ?auto_256034 ?auto_256036 ) ) ( not ( = ?auto_256035 ?auto_256036 ) ) ( ON ?auto_256034 ?auto_256035 ) ( ON ?auto_256033 ?auto_256034 ) ( ON ?auto_256032 ?auto_256033 ) ( ON ?auto_256031 ?auto_256032 ) ( ON ?auto_256030 ?auto_256031 ) ( CLEAR ?auto_256028 ) ( ON ?auto_256029 ?auto_256030 ) ( CLEAR ?auto_256029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_256025 ?auto_256026 ?auto_256027 ?auto_256028 ?auto_256029 )
      ( MAKE-11PILE ?auto_256025 ?auto_256026 ?auto_256027 ?auto_256028 ?auto_256029 ?auto_256030 ?auto_256031 ?auto_256032 ?auto_256033 ?auto_256034 ?auto_256035 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_256048 - BLOCK
      ?auto_256049 - BLOCK
      ?auto_256050 - BLOCK
      ?auto_256051 - BLOCK
      ?auto_256052 - BLOCK
      ?auto_256053 - BLOCK
      ?auto_256054 - BLOCK
      ?auto_256055 - BLOCK
      ?auto_256056 - BLOCK
      ?auto_256057 - BLOCK
      ?auto_256058 - BLOCK
    )
    :vars
    (
      ?auto_256059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256058 ?auto_256059 ) ( ON-TABLE ?auto_256048 ) ( ON ?auto_256049 ?auto_256048 ) ( ON ?auto_256050 ?auto_256049 ) ( ON ?auto_256051 ?auto_256050 ) ( not ( = ?auto_256048 ?auto_256049 ) ) ( not ( = ?auto_256048 ?auto_256050 ) ) ( not ( = ?auto_256048 ?auto_256051 ) ) ( not ( = ?auto_256048 ?auto_256052 ) ) ( not ( = ?auto_256048 ?auto_256053 ) ) ( not ( = ?auto_256048 ?auto_256054 ) ) ( not ( = ?auto_256048 ?auto_256055 ) ) ( not ( = ?auto_256048 ?auto_256056 ) ) ( not ( = ?auto_256048 ?auto_256057 ) ) ( not ( = ?auto_256048 ?auto_256058 ) ) ( not ( = ?auto_256048 ?auto_256059 ) ) ( not ( = ?auto_256049 ?auto_256050 ) ) ( not ( = ?auto_256049 ?auto_256051 ) ) ( not ( = ?auto_256049 ?auto_256052 ) ) ( not ( = ?auto_256049 ?auto_256053 ) ) ( not ( = ?auto_256049 ?auto_256054 ) ) ( not ( = ?auto_256049 ?auto_256055 ) ) ( not ( = ?auto_256049 ?auto_256056 ) ) ( not ( = ?auto_256049 ?auto_256057 ) ) ( not ( = ?auto_256049 ?auto_256058 ) ) ( not ( = ?auto_256049 ?auto_256059 ) ) ( not ( = ?auto_256050 ?auto_256051 ) ) ( not ( = ?auto_256050 ?auto_256052 ) ) ( not ( = ?auto_256050 ?auto_256053 ) ) ( not ( = ?auto_256050 ?auto_256054 ) ) ( not ( = ?auto_256050 ?auto_256055 ) ) ( not ( = ?auto_256050 ?auto_256056 ) ) ( not ( = ?auto_256050 ?auto_256057 ) ) ( not ( = ?auto_256050 ?auto_256058 ) ) ( not ( = ?auto_256050 ?auto_256059 ) ) ( not ( = ?auto_256051 ?auto_256052 ) ) ( not ( = ?auto_256051 ?auto_256053 ) ) ( not ( = ?auto_256051 ?auto_256054 ) ) ( not ( = ?auto_256051 ?auto_256055 ) ) ( not ( = ?auto_256051 ?auto_256056 ) ) ( not ( = ?auto_256051 ?auto_256057 ) ) ( not ( = ?auto_256051 ?auto_256058 ) ) ( not ( = ?auto_256051 ?auto_256059 ) ) ( not ( = ?auto_256052 ?auto_256053 ) ) ( not ( = ?auto_256052 ?auto_256054 ) ) ( not ( = ?auto_256052 ?auto_256055 ) ) ( not ( = ?auto_256052 ?auto_256056 ) ) ( not ( = ?auto_256052 ?auto_256057 ) ) ( not ( = ?auto_256052 ?auto_256058 ) ) ( not ( = ?auto_256052 ?auto_256059 ) ) ( not ( = ?auto_256053 ?auto_256054 ) ) ( not ( = ?auto_256053 ?auto_256055 ) ) ( not ( = ?auto_256053 ?auto_256056 ) ) ( not ( = ?auto_256053 ?auto_256057 ) ) ( not ( = ?auto_256053 ?auto_256058 ) ) ( not ( = ?auto_256053 ?auto_256059 ) ) ( not ( = ?auto_256054 ?auto_256055 ) ) ( not ( = ?auto_256054 ?auto_256056 ) ) ( not ( = ?auto_256054 ?auto_256057 ) ) ( not ( = ?auto_256054 ?auto_256058 ) ) ( not ( = ?auto_256054 ?auto_256059 ) ) ( not ( = ?auto_256055 ?auto_256056 ) ) ( not ( = ?auto_256055 ?auto_256057 ) ) ( not ( = ?auto_256055 ?auto_256058 ) ) ( not ( = ?auto_256055 ?auto_256059 ) ) ( not ( = ?auto_256056 ?auto_256057 ) ) ( not ( = ?auto_256056 ?auto_256058 ) ) ( not ( = ?auto_256056 ?auto_256059 ) ) ( not ( = ?auto_256057 ?auto_256058 ) ) ( not ( = ?auto_256057 ?auto_256059 ) ) ( not ( = ?auto_256058 ?auto_256059 ) ) ( ON ?auto_256057 ?auto_256058 ) ( ON ?auto_256056 ?auto_256057 ) ( ON ?auto_256055 ?auto_256056 ) ( ON ?auto_256054 ?auto_256055 ) ( ON ?auto_256053 ?auto_256054 ) ( CLEAR ?auto_256051 ) ( ON ?auto_256052 ?auto_256053 ) ( CLEAR ?auto_256052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_256048 ?auto_256049 ?auto_256050 ?auto_256051 ?auto_256052 )
      ( MAKE-11PILE ?auto_256048 ?auto_256049 ?auto_256050 ?auto_256051 ?auto_256052 ?auto_256053 ?auto_256054 ?auto_256055 ?auto_256056 ?auto_256057 ?auto_256058 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_256071 - BLOCK
      ?auto_256072 - BLOCK
      ?auto_256073 - BLOCK
      ?auto_256074 - BLOCK
      ?auto_256075 - BLOCK
      ?auto_256076 - BLOCK
      ?auto_256077 - BLOCK
      ?auto_256078 - BLOCK
      ?auto_256079 - BLOCK
      ?auto_256080 - BLOCK
      ?auto_256081 - BLOCK
    )
    :vars
    (
      ?auto_256082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256081 ?auto_256082 ) ( ON-TABLE ?auto_256071 ) ( ON ?auto_256072 ?auto_256071 ) ( ON ?auto_256073 ?auto_256072 ) ( not ( = ?auto_256071 ?auto_256072 ) ) ( not ( = ?auto_256071 ?auto_256073 ) ) ( not ( = ?auto_256071 ?auto_256074 ) ) ( not ( = ?auto_256071 ?auto_256075 ) ) ( not ( = ?auto_256071 ?auto_256076 ) ) ( not ( = ?auto_256071 ?auto_256077 ) ) ( not ( = ?auto_256071 ?auto_256078 ) ) ( not ( = ?auto_256071 ?auto_256079 ) ) ( not ( = ?auto_256071 ?auto_256080 ) ) ( not ( = ?auto_256071 ?auto_256081 ) ) ( not ( = ?auto_256071 ?auto_256082 ) ) ( not ( = ?auto_256072 ?auto_256073 ) ) ( not ( = ?auto_256072 ?auto_256074 ) ) ( not ( = ?auto_256072 ?auto_256075 ) ) ( not ( = ?auto_256072 ?auto_256076 ) ) ( not ( = ?auto_256072 ?auto_256077 ) ) ( not ( = ?auto_256072 ?auto_256078 ) ) ( not ( = ?auto_256072 ?auto_256079 ) ) ( not ( = ?auto_256072 ?auto_256080 ) ) ( not ( = ?auto_256072 ?auto_256081 ) ) ( not ( = ?auto_256072 ?auto_256082 ) ) ( not ( = ?auto_256073 ?auto_256074 ) ) ( not ( = ?auto_256073 ?auto_256075 ) ) ( not ( = ?auto_256073 ?auto_256076 ) ) ( not ( = ?auto_256073 ?auto_256077 ) ) ( not ( = ?auto_256073 ?auto_256078 ) ) ( not ( = ?auto_256073 ?auto_256079 ) ) ( not ( = ?auto_256073 ?auto_256080 ) ) ( not ( = ?auto_256073 ?auto_256081 ) ) ( not ( = ?auto_256073 ?auto_256082 ) ) ( not ( = ?auto_256074 ?auto_256075 ) ) ( not ( = ?auto_256074 ?auto_256076 ) ) ( not ( = ?auto_256074 ?auto_256077 ) ) ( not ( = ?auto_256074 ?auto_256078 ) ) ( not ( = ?auto_256074 ?auto_256079 ) ) ( not ( = ?auto_256074 ?auto_256080 ) ) ( not ( = ?auto_256074 ?auto_256081 ) ) ( not ( = ?auto_256074 ?auto_256082 ) ) ( not ( = ?auto_256075 ?auto_256076 ) ) ( not ( = ?auto_256075 ?auto_256077 ) ) ( not ( = ?auto_256075 ?auto_256078 ) ) ( not ( = ?auto_256075 ?auto_256079 ) ) ( not ( = ?auto_256075 ?auto_256080 ) ) ( not ( = ?auto_256075 ?auto_256081 ) ) ( not ( = ?auto_256075 ?auto_256082 ) ) ( not ( = ?auto_256076 ?auto_256077 ) ) ( not ( = ?auto_256076 ?auto_256078 ) ) ( not ( = ?auto_256076 ?auto_256079 ) ) ( not ( = ?auto_256076 ?auto_256080 ) ) ( not ( = ?auto_256076 ?auto_256081 ) ) ( not ( = ?auto_256076 ?auto_256082 ) ) ( not ( = ?auto_256077 ?auto_256078 ) ) ( not ( = ?auto_256077 ?auto_256079 ) ) ( not ( = ?auto_256077 ?auto_256080 ) ) ( not ( = ?auto_256077 ?auto_256081 ) ) ( not ( = ?auto_256077 ?auto_256082 ) ) ( not ( = ?auto_256078 ?auto_256079 ) ) ( not ( = ?auto_256078 ?auto_256080 ) ) ( not ( = ?auto_256078 ?auto_256081 ) ) ( not ( = ?auto_256078 ?auto_256082 ) ) ( not ( = ?auto_256079 ?auto_256080 ) ) ( not ( = ?auto_256079 ?auto_256081 ) ) ( not ( = ?auto_256079 ?auto_256082 ) ) ( not ( = ?auto_256080 ?auto_256081 ) ) ( not ( = ?auto_256080 ?auto_256082 ) ) ( not ( = ?auto_256081 ?auto_256082 ) ) ( ON ?auto_256080 ?auto_256081 ) ( ON ?auto_256079 ?auto_256080 ) ( ON ?auto_256078 ?auto_256079 ) ( ON ?auto_256077 ?auto_256078 ) ( ON ?auto_256076 ?auto_256077 ) ( ON ?auto_256075 ?auto_256076 ) ( CLEAR ?auto_256073 ) ( ON ?auto_256074 ?auto_256075 ) ( CLEAR ?auto_256074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_256071 ?auto_256072 ?auto_256073 ?auto_256074 )
      ( MAKE-11PILE ?auto_256071 ?auto_256072 ?auto_256073 ?auto_256074 ?auto_256075 ?auto_256076 ?auto_256077 ?auto_256078 ?auto_256079 ?auto_256080 ?auto_256081 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_256094 - BLOCK
      ?auto_256095 - BLOCK
      ?auto_256096 - BLOCK
      ?auto_256097 - BLOCK
      ?auto_256098 - BLOCK
      ?auto_256099 - BLOCK
      ?auto_256100 - BLOCK
      ?auto_256101 - BLOCK
      ?auto_256102 - BLOCK
      ?auto_256103 - BLOCK
      ?auto_256104 - BLOCK
    )
    :vars
    (
      ?auto_256105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256104 ?auto_256105 ) ( ON-TABLE ?auto_256094 ) ( ON ?auto_256095 ?auto_256094 ) ( ON ?auto_256096 ?auto_256095 ) ( not ( = ?auto_256094 ?auto_256095 ) ) ( not ( = ?auto_256094 ?auto_256096 ) ) ( not ( = ?auto_256094 ?auto_256097 ) ) ( not ( = ?auto_256094 ?auto_256098 ) ) ( not ( = ?auto_256094 ?auto_256099 ) ) ( not ( = ?auto_256094 ?auto_256100 ) ) ( not ( = ?auto_256094 ?auto_256101 ) ) ( not ( = ?auto_256094 ?auto_256102 ) ) ( not ( = ?auto_256094 ?auto_256103 ) ) ( not ( = ?auto_256094 ?auto_256104 ) ) ( not ( = ?auto_256094 ?auto_256105 ) ) ( not ( = ?auto_256095 ?auto_256096 ) ) ( not ( = ?auto_256095 ?auto_256097 ) ) ( not ( = ?auto_256095 ?auto_256098 ) ) ( not ( = ?auto_256095 ?auto_256099 ) ) ( not ( = ?auto_256095 ?auto_256100 ) ) ( not ( = ?auto_256095 ?auto_256101 ) ) ( not ( = ?auto_256095 ?auto_256102 ) ) ( not ( = ?auto_256095 ?auto_256103 ) ) ( not ( = ?auto_256095 ?auto_256104 ) ) ( not ( = ?auto_256095 ?auto_256105 ) ) ( not ( = ?auto_256096 ?auto_256097 ) ) ( not ( = ?auto_256096 ?auto_256098 ) ) ( not ( = ?auto_256096 ?auto_256099 ) ) ( not ( = ?auto_256096 ?auto_256100 ) ) ( not ( = ?auto_256096 ?auto_256101 ) ) ( not ( = ?auto_256096 ?auto_256102 ) ) ( not ( = ?auto_256096 ?auto_256103 ) ) ( not ( = ?auto_256096 ?auto_256104 ) ) ( not ( = ?auto_256096 ?auto_256105 ) ) ( not ( = ?auto_256097 ?auto_256098 ) ) ( not ( = ?auto_256097 ?auto_256099 ) ) ( not ( = ?auto_256097 ?auto_256100 ) ) ( not ( = ?auto_256097 ?auto_256101 ) ) ( not ( = ?auto_256097 ?auto_256102 ) ) ( not ( = ?auto_256097 ?auto_256103 ) ) ( not ( = ?auto_256097 ?auto_256104 ) ) ( not ( = ?auto_256097 ?auto_256105 ) ) ( not ( = ?auto_256098 ?auto_256099 ) ) ( not ( = ?auto_256098 ?auto_256100 ) ) ( not ( = ?auto_256098 ?auto_256101 ) ) ( not ( = ?auto_256098 ?auto_256102 ) ) ( not ( = ?auto_256098 ?auto_256103 ) ) ( not ( = ?auto_256098 ?auto_256104 ) ) ( not ( = ?auto_256098 ?auto_256105 ) ) ( not ( = ?auto_256099 ?auto_256100 ) ) ( not ( = ?auto_256099 ?auto_256101 ) ) ( not ( = ?auto_256099 ?auto_256102 ) ) ( not ( = ?auto_256099 ?auto_256103 ) ) ( not ( = ?auto_256099 ?auto_256104 ) ) ( not ( = ?auto_256099 ?auto_256105 ) ) ( not ( = ?auto_256100 ?auto_256101 ) ) ( not ( = ?auto_256100 ?auto_256102 ) ) ( not ( = ?auto_256100 ?auto_256103 ) ) ( not ( = ?auto_256100 ?auto_256104 ) ) ( not ( = ?auto_256100 ?auto_256105 ) ) ( not ( = ?auto_256101 ?auto_256102 ) ) ( not ( = ?auto_256101 ?auto_256103 ) ) ( not ( = ?auto_256101 ?auto_256104 ) ) ( not ( = ?auto_256101 ?auto_256105 ) ) ( not ( = ?auto_256102 ?auto_256103 ) ) ( not ( = ?auto_256102 ?auto_256104 ) ) ( not ( = ?auto_256102 ?auto_256105 ) ) ( not ( = ?auto_256103 ?auto_256104 ) ) ( not ( = ?auto_256103 ?auto_256105 ) ) ( not ( = ?auto_256104 ?auto_256105 ) ) ( ON ?auto_256103 ?auto_256104 ) ( ON ?auto_256102 ?auto_256103 ) ( ON ?auto_256101 ?auto_256102 ) ( ON ?auto_256100 ?auto_256101 ) ( ON ?auto_256099 ?auto_256100 ) ( ON ?auto_256098 ?auto_256099 ) ( CLEAR ?auto_256096 ) ( ON ?auto_256097 ?auto_256098 ) ( CLEAR ?auto_256097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_256094 ?auto_256095 ?auto_256096 ?auto_256097 )
      ( MAKE-11PILE ?auto_256094 ?auto_256095 ?auto_256096 ?auto_256097 ?auto_256098 ?auto_256099 ?auto_256100 ?auto_256101 ?auto_256102 ?auto_256103 ?auto_256104 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_256117 - BLOCK
      ?auto_256118 - BLOCK
      ?auto_256119 - BLOCK
      ?auto_256120 - BLOCK
      ?auto_256121 - BLOCK
      ?auto_256122 - BLOCK
      ?auto_256123 - BLOCK
      ?auto_256124 - BLOCK
      ?auto_256125 - BLOCK
      ?auto_256126 - BLOCK
      ?auto_256127 - BLOCK
    )
    :vars
    (
      ?auto_256128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256127 ?auto_256128 ) ( ON-TABLE ?auto_256117 ) ( ON ?auto_256118 ?auto_256117 ) ( not ( = ?auto_256117 ?auto_256118 ) ) ( not ( = ?auto_256117 ?auto_256119 ) ) ( not ( = ?auto_256117 ?auto_256120 ) ) ( not ( = ?auto_256117 ?auto_256121 ) ) ( not ( = ?auto_256117 ?auto_256122 ) ) ( not ( = ?auto_256117 ?auto_256123 ) ) ( not ( = ?auto_256117 ?auto_256124 ) ) ( not ( = ?auto_256117 ?auto_256125 ) ) ( not ( = ?auto_256117 ?auto_256126 ) ) ( not ( = ?auto_256117 ?auto_256127 ) ) ( not ( = ?auto_256117 ?auto_256128 ) ) ( not ( = ?auto_256118 ?auto_256119 ) ) ( not ( = ?auto_256118 ?auto_256120 ) ) ( not ( = ?auto_256118 ?auto_256121 ) ) ( not ( = ?auto_256118 ?auto_256122 ) ) ( not ( = ?auto_256118 ?auto_256123 ) ) ( not ( = ?auto_256118 ?auto_256124 ) ) ( not ( = ?auto_256118 ?auto_256125 ) ) ( not ( = ?auto_256118 ?auto_256126 ) ) ( not ( = ?auto_256118 ?auto_256127 ) ) ( not ( = ?auto_256118 ?auto_256128 ) ) ( not ( = ?auto_256119 ?auto_256120 ) ) ( not ( = ?auto_256119 ?auto_256121 ) ) ( not ( = ?auto_256119 ?auto_256122 ) ) ( not ( = ?auto_256119 ?auto_256123 ) ) ( not ( = ?auto_256119 ?auto_256124 ) ) ( not ( = ?auto_256119 ?auto_256125 ) ) ( not ( = ?auto_256119 ?auto_256126 ) ) ( not ( = ?auto_256119 ?auto_256127 ) ) ( not ( = ?auto_256119 ?auto_256128 ) ) ( not ( = ?auto_256120 ?auto_256121 ) ) ( not ( = ?auto_256120 ?auto_256122 ) ) ( not ( = ?auto_256120 ?auto_256123 ) ) ( not ( = ?auto_256120 ?auto_256124 ) ) ( not ( = ?auto_256120 ?auto_256125 ) ) ( not ( = ?auto_256120 ?auto_256126 ) ) ( not ( = ?auto_256120 ?auto_256127 ) ) ( not ( = ?auto_256120 ?auto_256128 ) ) ( not ( = ?auto_256121 ?auto_256122 ) ) ( not ( = ?auto_256121 ?auto_256123 ) ) ( not ( = ?auto_256121 ?auto_256124 ) ) ( not ( = ?auto_256121 ?auto_256125 ) ) ( not ( = ?auto_256121 ?auto_256126 ) ) ( not ( = ?auto_256121 ?auto_256127 ) ) ( not ( = ?auto_256121 ?auto_256128 ) ) ( not ( = ?auto_256122 ?auto_256123 ) ) ( not ( = ?auto_256122 ?auto_256124 ) ) ( not ( = ?auto_256122 ?auto_256125 ) ) ( not ( = ?auto_256122 ?auto_256126 ) ) ( not ( = ?auto_256122 ?auto_256127 ) ) ( not ( = ?auto_256122 ?auto_256128 ) ) ( not ( = ?auto_256123 ?auto_256124 ) ) ( not ( = ?auto_256123 ?auto_256125 ) ) ( not ( = ?auto_256123 ?auto_256126 ) ) ( not ( = ?auto_256123 ?auto_256127 ) ) ( not ( = ?auto_256123 ?auto_256128 ) ) ( not ( = ?auto_256124 ?auto_256125 ) ) ( not ( = ?auto_256124 ?auto_256126 ) ) ( not ( = ?auto_256124 ?auto_256127 ) ) ( not ( = ?auto_256124 ?auto_256128 ) ) ( not ( = ?auto_256125 ?auto_256126 ) ) ( not ( = ?auto_256125 ?auto_256127 ) ) ( not ( = ?auto_256125 ?auto_256128 ) ) ( not ( = ?auto_256126 ?auto_256127 ) ) ( not ( = ?auto_256126 ?auto_256128 ) ) ( not ( = ?auto_256127 ?auto_256128 ) ) ( ON ?auto_256126 ?auto_256127 ) ( ON ?auto_256125 ?auto_256126 ) ( ON ?auto_256124 ?auto_256125 ) ( ON ?auto_256123 ?auto_256124 ) ( ON ?auto_256122 ?auto_256123 ) ( ON ?auto_256121 ?auto_256122 ) ( ON ?auto_256120 ?auto_256121 ) ( CLEAR ?auto_256118 ) ( ON ?auto_256119 ?auto_256120 ) ( CLEAR ?auto_256119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_256117 ?auto_256118 ?auto_256119 )
      ( MAKE-11PILE ?auto_256117 ?auto_256118 ?auto_256119 ?auto_256120 ?auto_256121 ?auto_256122 ?auto_256123 ?auto_256124 ?auto_256125 ?auto_256126 ?auto_256127 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_256140 - BLOCK
      ?auto_256141 - BLOCK
      ?auto_256142 - BLOCK
      ?auto_256143 - BLOCK
      ?auto_256144 - BLOCK
      ?auto_256145 - BLOCK
      ?auto_256146 - BLOCK
      ?auto_256147 - BLOCK
      ?auto_256148 - BLOCK
      ?auto_256149 - BLOCK
      ?auto_256150 - BLOCK
    )
    :vars
    (
      ?auto_256151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256150 ?auto_256151 ) ( ON-TABLE ?auto_256140 ) ( ON ?auto_256141 ?auto_256140 ) ( not ( = ?auto_256140 ?auto_256141 ) ) ( not ( = ?auto_256140 ?auto_256142 ) ) ( not ( = ?auto_256140 ?auto_256143 ) ) ( not ( = ?auto_256140 ?auto_256144 ) ) ( not ( = ?auto_256140 ?auto_256145 ) ) ( not ( = ?auto_256140 ?auto_256146 ) ) ( not ( = ?auto_256140 ?auto_256147 ) ) ( not ( = ?auto_256140 ?auto_256148 ) ) ( not ( = ?auto_256140 ?auto_256149 ) ) ( not ( = ?auto_256140 ?auto_256150 ) ) ( not ( = ?auto_256140 ?auto_256151 ) ) ( not ( = ?auto_256141 ?auto_256142 ) ) ( not ( = ?auto_256141 ?auto_256143 ) ) ( not ( = ?auto_256141 ?auto_256144 ) ) ( not ( = ?auto_256141 ?auto_256145 ) ) ( not ( = ?auto_256141 ?auto_256146 ) ) ( not ( = ?auto_256141 ?auto_256147 ) ) ( not ( = ?auto_256141 ?auto_256148 ) ) ( not ( = ?auto_256141 ?auto_256149 ) ) ( not ( = ?auto_256141 ?auto_256150 ) ) ( not ( = ?auto_256141 ?auto_256151 ) ) ( not ( = ?auto_256142 ?auto_256143 ) ) ( not ( = ?auto_256142 ?auto_256144 ) ) ( not ( = ?auto_256142 ?auto_256145 ) ) ( not ( = ?auto_256142 ?auto_256146 ) ) ( not ( = ?auto_256142 ?auto_256147 ) ) ( not ( = ?auto_256142 ?auto_256148 ) ) ( not ( = ?auto_256142 ?auto_256149 ) ) ( not ( = ?auto_256142 ?auto_256150 ) ) ( not ( = ?auto_256142 ?auto_256151 ) ) ( not ( = ?auto_256143 ?auto_256144 ) ) ( not ( = ?auto_256143 ?auto_256145 ) ) ( not ( = ?auto_256143 ?auto_256146 ) ) ( not ( = ?auto_256143 ?auto_256147 ) ) ( not ( = ?auto_256143 ?auto_256148 ) ) ( not ( = ?auto_256143 ?auto_256149 ) ) ( not ( = ?auto_256143 ?auto_256150 ) ) ( not ( = ?auto_256143 ?auto_256151 ) ) ( not ( = ?auto_256144 ?auto_256145 ) ) ( not ( = ?auto_256144 ?auto_256146 ) ) ( not ( = ?auto_256144 ?auto_256147 ) ) ( not ( = ?auto_256144 ?auto_256148 ) ) ( not ( = ?auto_256144 ?auto_256149 ) ) ( not ( = ?auto_256144 ?auto_256150 ) ) ( not ( = ?auto_256144 ?auto_256151 ) ) ( not ( = ?auto_256145 ?auto_256146 ) ) ( not ( = ?auto_256145 ?auto_256147 ) ) ( not ( = ?auto_256145 ?auto_256148 ) ) ( not ( = ?auto_256145 ?auto_256149 ) ) ( not ( = ?auto_256145 ?auto_256150 ) ) ( not ( = ?auto_256145 ?auto_256151 ) ) ( not ( = ?auto_256146 ?auto_256147 ) ) ( not ( = ?auto_256146 ?auto_256148 ) ) ( not ( = ?auto_256146 ?auto_256149 ) ) ( not ( = ?auto_256146 ?auto_256150 ) ) ( not ( = ?auto_256146 ?auto_256151 ) ) ( not ( = ?auto_256147 ?auto_256148 ) ) ( not ( = ?auto_256147 ?auto_256149 ) ) ( not ( = ?auto_256147 ?auto_256150 ) ) ( not ( = ?auto_256147 ?auto_256151 ) ) ( not ( = ?auto_256148 ?auto_256149 ) ) ( not ( = ?auto_256148 ?auto_256150 ) ) ( not ( = ?auto_256148 ?auto_256151 ) ) ( not ( = ?auto_256149 ?auto_256150 ) ) ( not ( = ?auto_256149 ?auto_256151 ) ) ( not ( = ?auto_256150 ?auto_256151 ) ) ( ON ?auto_256149 ?auto_256150 ) ( ON ?auto_256148 ?auto_256149 ) ( ON ?auto_256147 ?auto_256148 ) ( ON ?auto_256146 ?auto_256147 ) ( ON ?auto_256145 ?auto_256146 ) ( ON ?auto_256144 ?auto_256145 ) ( ON ?auto_256143 ?auto_256144 ) ( CLEAR ?auto_256141 ) ( ON ?auto_256142 ?auto_256143 ) ( CLEAR ?auto_256142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_256140 ?auto_256141 ?auto_256142 )
      ( MAKE-11PILE ?auto_256140 ?auto_256141 ?auto_256142 ?auto_256143 ?auto_256144 ?auto_256145 ?auto_256146 ?auto_256147 ?auto_256148 ?auto_256149 ?auto_256150 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_256163 - BLOCK
      ?auto_256164 - BLOCK
      ?auto_256165 - BLOCK
      ?auto_256166 - BLOCK
      ?auto_256167 - BLOCK
      ?auto_256168 - BLOCK
      ?auto_256169 - BLOCK
      ?auto_256170 - BLOCK
      ?auto_256171 - BLOCK
      ?auto_256172 - BLOCK
      ?auto_256173 - BLOCK
    )
    :vars
    (
      ?auto_256174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256173 ?auto_256174 ) ( ON-TABLE ?auto_256163 ) ( not ( = ?auto_256163 ?auto_256164 ) ) ( not ( = ?auto_256163 ?auto_256165 ) ) ( not ( = ?auto_256163 ?auto_256166 ) ) ( not ( = ?auto_256163 ?auto_256167 ) ) ( not ( = ?auto_256163 ?auto_256168 ) ) ( not ( = ?auto_256163 ?auto_256169 ) ) ( not ( = ?auto_256163 ?auto_256170 ) ) ( not ( = ?auto_256163 ?auto_256171 ) ) ( not ( = ?auto_256163 ?auto_256172 ) ) ( not ( = ?auto_256163 ?auto_256173 ) ) ( not ( = ?auto_256163 ?auto_256174 ) ) ( not ( = ?auto_256164 ?auto_256165 ) ) ( not ( = ?auto_256164 ?auto_256166 ) ) ( not ( = ?auto_256164 ?auto_256167 ) ) ( not ( = ?auto_256164 ?auto_256168 ) ) ( not ( = ?auto_256164 ?auto_256169 ) ) ( not ( = ?auto_256164 ?auto_256170 ) ) ( not ( = ?auto_256164 ?auto_256171 ) ) ( not ( = ?auto_256164 ?auto_256172 ) ) ( not ( = ?auto_256164 ?auto_256173 ) ) ( not ( = ?auto_256164 ?auto_256174 ) ) ( not ( = ?auto_256165 ?auto_256166 ) ) ( not ( = ?auto_256165 ?auto_256167 ) ) ( not ( = ?auto_256165 ?auto_256168 ) ) ( not ( = ?auto_256165 ?auto_256169 ) ) ( not ( = ?auto_256165 ?auto_256170 ) ) ( not ( = ?auto_256165 ?auto_256171 ) ) ( not ( = ?auto_256165 ?auto_256172 ) ) ( not ( = ?auto_256165 ?auto_256173 ) ) ( not ( = ?auto_256165 ?auto_256174 ) ) ( not ( = ?auto_256166 ?auto_256167 ) ) ( not ( = ?auto_256166 ?auto_256168 ) ) ( not ( = ?auto_256166 ?auto_256169 ) ) ( not ( = ?auto_256166 ?auto_256170 ) ) ( not ( = ?auto_256166 ?auto_256171 ) ) ( not ( = ?auto_256166 ?auto_256172 ) ) ( not ( = ?auto_256166 ?auto_256173 ) ) ( not ( = ?auto_256166 ?auto_256174 ) ) ( not ( = ?auto_256167 ?auto_256168 ) ) ( not ( = ?auto_256167 ?auto_256169 ) ) ( not ( = ?auto_256167 ?auto_256170 ) ) ( not ( = ?auto_256167 ?auto_256171 ) ) ( not ( = ?auto_256167 ?auto_256172 ) ) ( not ( = ?auto_256167 ?auto_256173 ) ) ( not ( = ?auto_256167 ?auto_256174 ) ) ( not ( = ?auto_256168 ?auto_256169 ) ) ( not ( = ?auto_256168 ?auto_256170 ) ) ( not ( = ?auto_256168 ?auto_256171 ) ) ( not ( = ?auto_256168 ?auto_256172 ) ) ( not ( = ?auto_256168 ?auto_256173 ) ) ( not ( = ?auto_256168 ?auto_256174 ) ) ( not ( = ?auto_256169 ?auto_256170 ) ) ( not ( = ?auto_256169 ?auto_256171 ) ) ( not ( = ?auto_256169 ?auto_256172 ) ) ( not ( = ?auto_256169 ?auto_256173 ) ) ( not ( = ?auto_256169 ?auto_256174 ) ) ( not ( = ?auto_256170 ?auto_256171 ) ) ( not ( = ?auto_256170 ?auto_256172 ) ) ( not ( = ?auto_256170 ?auto_256173 ) ) ( not ( = ?auto_256170 ?auto_256174 ) ) ( not ( = ?auto_256171 ?auto_256172 ) ) ( not ( = ?auto_256171 ?auto_256173 ) ) ( not ( = ?auto_256171 ?auto_256174 ) ) ( not ( = ?auto_256172 ?auto_256173 ) ) ( not ( = ?auto_256172 ?auto_256174 ) ) ( not ( = ?auto_256173 ?auto_256174 ) ) ( ON ?auto_256172 ?auto_256173 ) ( ON ?auto_256171 ?auto_256172 ) ( ON ?auto_256170 ?auto_256171 ) ( ON ?auto_256169 ?auto_256170 ) ( ON ?auto_256168 ?auto_256169 ) ( ON ?auto_256167 ?auto_256168 ) ( ON ?auto_256166 ?auto_256167 ) ( ON ?auto_256165 ?auto_256166 ) ( CLEAR ?auto_256163 ) ( ON ?auto_256164 ?auto_256165 ) ( CLEAR ?auto_256164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_256163 ?auto_256164 )
      ( MAKE-11PILE ?auto_256163 ?auto_256164 ?auto_256165 ?auto_256166 ?auto_256167 ?auto_256168 ?auto_256169 ?auto_256170 ?auto_256171 ?auto_256172 ?auto_256173 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_256186 - BLOCK
      ?auto_256187 - BLOCK
      ?auto_256188 - BLOCK
      ?auto_256189 - BLOCK
      ?auto_256190 - BLOCK
      ?auto_256191 - BLOCK
      ?auto_256192 - BLOCK
      ?auto_256193 - BLOCK
      ?auto_256194 - BLOCK
      ?auto_256195 - BLOCK
      ?auto_256196 - BLOCK
    )
    :vars
    (
      ?auto_256197 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256196 ?auto_256197 ) ( ON-TABLE ?auto_256186 ) ( not ( = ?auto_256186 ?auto_256187 ) ) ( not ( = ?auto_256186 ?auto_256188 ) ) ( not ( = ?auto_256186 ?auto_256189 ) ) ( not ( = ?auto_256186 ?auto_256190 ) ) ( not ( = ?auto_256186 ?auto_256191 ) ) ( not ( = ?auto_256186 ?auto_256192 ) ) ( not ( = ?auto_256186 ?auto_256193 ) ) ( not ( = ?auto_256186 ?auto_256194 ) ) ( not ( = ?auto_256186 ?auto_256195 ) ) ( not ( = ?auto_256186 ?auto_256196 ) ) ( not ( = ?auto_256186 ?auto_256197 ) ) ( not ( = ?auto_256187 ?auto_256188 ) ) ( not ( = ?auto_256187 ?auto_256189 ) ) ( not ( = ?auto_256187 ?auto_256190 ) ) ( not ( = ?auto_256187 ?auto_256191 ) ) ( not ( = ?auto_256187 ?auto_256192 ) ) ( not ( = ?auto_256187 ?auto_256193 ) ) ( not ( = ?auto_256187 ?auto_256194 ) ) ( not ( = ?auto_256187 ?auto_256195 ) ) ( not ( = ?auto_256187 ?auto_256196 ) ) ( not ( = ?auto_256187 ?auto_256197 ) ) ( not ( = ?auto_256188 ?auto_256189 ) ) ( not ( = ?auto_256188 ?auto_256190 ) ) ( not ( = ?auto_256188 ?auto_256191 ) ) ( not ( = ?auto_256188 ?auto_256192 ) ) ( not ( = ?auto_256188 ?auto_256193 ) ) ( not ( = ?auto_256188 ?auto_256194 ) ) ( not ( = ?auto_256188 ?auto_256195 ) ) ( not ( = ?auto_256188 ?auto_256196 ) ) ( not ( = ?auto_256188 ?auto_256197 ) ) ( not ( = ?auto_256189 ?auto_256190 ) ) ( not ( = ?auto_256189 ?auto_256191 ) ) ( not ( = ?auto_256189 ?auto_256192 ) ) ( not ( = ?auto_256189 ?auto_256193 ) ) ( not ( = ?auto_256189 ?auto_256194 ) ) ( not ( = ?auto_256189 ?auto_256195 ) ) ( not ( = ?auto_256189 ?auto_256196 ) ) ( not ( = ?auto_256189 ?auto_256197 ) ) ( not ( = ?auto_256190 ?auto_256191 ) ) ( not ( = ?auto_256190 ?auto_256192 ) ) ( not ( = ?auto_256190 ?auto_256193 ) ) ( not ( = ?auto_256190 ?auto_256194 ) ) ( not ( = ?auto_256190 ?auto_256195 ) ) ( not ( = ?auto_256190 ?auto_256196 ) ) ( not ( = ?auto_256190 ?auto_256197 ) ) ( not ( = ?auto_256191 ?auto_256192 ) ) ( not ( = ?auto_256191 ?auto_256193 ) ) ( not ( = ?auto_256191 ?auto_256194 ) ) ( not ( = ?auto_256191 ?auto_256195 ) ) ( not ( = ?auto_256191 ?auto_256196 ) ) ( not ( = ?auto_256191 ?auto_256197 ) ) ( not ( = ?auto_256192 ?auto_256193 ) ) ( not ( = ?auto_256192 ?auto_256194 ) ) ( not ( = ?auto_256192 ?auto_256195 ) ) ( not ( = ?auto_256192 ?auto_256196 ) ) ( not ( = ?auto_256192 ?auto_256197 ) ) ( not ( = ?auto_256193 ?auto_256194 ) ) ( not ( = ?auto_256193 ?auto_256195 ) ) ( not ( = ?auto_256193 ?auto_256196 ) ) ( not ( = ?auto_256193 ?auto_256197 ) ) ( not ( = ?auto_256194 ?auto_256195 ) ) ( not ( = ?auto_256194 ?auto_256196 ) ) ( not ( = ?auto_256194 ?auto_256197 ) ) ( not ( = ?auto_256195 ?auto_256196 ) ) ( not ( = ?auto_256195 ?auto_256197 ) ) ( not ( = ?auto_256196 ?auto_256197 ) ) ( ON ?auto_256195 ?auto_256196 ) ( ON ?auto_256194 ?auto_256195 ) ( ON ?auto_256193 ?auto_256194 ) ( ON ?auto_256192 ?auto_256193 ) ( ON ?auto_256191 ?auto_256192 ) ( ON ?auto_256190 ?auto_256191 ) ( ON ?auto_256189 ?auto_256190 ) ( ON ?auto_256188 ?auto_256189 ) ( CLEAR ?auto_256186 ) ( ON ?auto_256187 ?auto_256188 ) ( CLEAR ?auto_256187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_256186 ?auto_256187 )
      ( MAKE-11PILE ?auto_256186 ?auto_256187 ?auto_256188 ?auto_256189 ?auto_256190 ?auto_256191 ?auto_256192 ?auto_256193 ?auto_256194 ?auto_256195 ?auto_256196 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_256209 - BLOCK
      ?auto_256210 - BLOCK
      ?auto_256211 - BLOCK
      ?auto_256212 - BLOCK
      ?auto_256213 - BLOCK
      ?auto_256214 - BLOCK
      ?auto_256215 - BLOCK
      ?auto_256216 - BLOCK
      ?auto_256217 - BLOCK
      ?auto_256218 - BLOCK
      ?auto_256219 - BLOCK
    )
    :vars
    (
      ?auto_256220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256219 ?auto_256220 ) ( not ( = ?auto_256209 ?auto_256210 ) ) ( not ( = ?auto_256209 ?auto_256211 ) ) ( not ( = ?auto_256209 ?auto_256212 ) ) ( not ( = ?auto_256209 ?auto_256213 ) ) ( not ( = ?auto_256209 ?auto_256214 ) ) ( not ( = ?auto_256209 ?auto_256215 ) ) ( not ( = ?auto_256209 ?auto_256216 ) ) ( not ( = ?auto_256209 ?auto_256217 ) ) ( not ( = ?auto_256209 ?auto_256218 ) ) ( not ( = ?auto_256209 ?auto_256219 ) ) ( not ( = ?auto_256209 ?auto_256220 ) ) ( not ( = ?auto_256210 ?auto_256211 ) ) ( not ( = ?auto_256210 ?auto_256212 ) ) ( not ( = ?auto_256210 ?auto_256213 ) ) ( not ( = ?auto_256210 ?auto_256214 ) ) ( not ( = ?auto_256210 ?auto_256215 ) ) ( not ( = ?auto_256210 ?auto_256216 ) ) ( not ( = ?auto_256210 ?auto_256217 ) ) ( not ( = ?auto_256210 ?auto_256218 ) ) ( not ( = ?auto_256210 ?auto_256219 ) ) ( not ( = ?auto_256210 ?auto_256220 ) ) ( not ( = ?auto_256211 ?auto_256212 ) ) ( not ( = ?auto_256211 ?auto_256213 ) ) ( not ( = ?auto_256211 ?auto_256214 ) ) ( not ( = ?auto_256211 ?auto_256215 ) ) ( not ( = ?auto_256211 ?auto_256216 ) ) ( not ( = ?auto_256211 ?auto_256217 ) ) ( not ( = ?auto_256211 ?auto_256218 ) ) ( not ( = ?auto_256211 ?auto_256219 ) ) ( not ( = ?auto_256211 ?auto_256220 ) ) ( not ( = ?auto_256212 ?auto_256213 ) ) ( not ( = ?auto_256212 ?auto_256214 ) ) ( not ( = ?auto_256212 ?auto_256215 ) ) ( not ( = ?auto_256212 ?auto_256216 ) ) ( not ( = ?auto_256212 ?auto_256217 ) ) ( not ( = ?auto_256212 ?auto_256218 ) ) ( not ( = ?auto_256212 ?auto_256219 ) ) ( not ( = ?auto_256212 ?auto_256220 ) ) ( not ( = ?auto_256213 ?auto_256214 ) ) ( not ( = ?auto_256213 ?auto_256215 ) ) ( not ( = ?auto_256213 ?auto_256216 ) ) ( not ( = ?auto_256213 ?auto_256217 ) ) ( not ( = ?auto_256213 ?auto_256218 ) ) ( not ( = ?auto_256213 ?auto_256219 ) ) ( not ( = ?auto_256213 ?auto_256220 ) ) ( not ( = ?auto_256214 ?auto_256215 ) ) ( not ( = ?auto_256214 ?auto_256216 ) ) ( not ( = ?auto_256214 ?auto_256217 ) ) ( not ( = ?auto_256214 ?auto_256218 ) ) ( not ( = ?auto_256214 ?auto_256219 ) ) ( not ( = ?auto_256214 ?auto_256220 ) ) ( not ( = ?auto_256215 ?auto_256216 ) ) ( not ( = ?auto_256215 ?auto_256217 ) ) ( not ( = ?auto_256215 ?auto_256218 ) ) ( not ( = ?auto_256215 ?auto_256219 ) ) ( not ( = ?auto_256215 ?auto_256220 ) ) ( not ( = ?auto_256216 ?auto_256217 ) ) ( not ( = ?auto_256216 ?auto_256218 ) ) ( not ( = ?auto_256216 ?auto_256219 ) ) ( not ( = ?auto_256216 ?auto_256220 ) ) ( not ( = ?auto_256217 ?auto_256218 ) ) ( not ( = ?auto_256217 ?auto_256219 ) ) ( not ( = ?auto_256217 ?auto_256220 ) ) ( not ( = ?auto_256218 ?auto_256219 ) ) ( not ( = ?auto_256218 ?auto_256220 ) ) ( not ( = ?auto_256219 ?auto_256220 ) ) ( ON ?auto_256218 ?auto_256219 ) ( ON ?auto_256217 ?auto_256218 ) ( ON ?auto_256216 ?auto_256217 ) ( ON ?auto_256215 ?auto_256216 ) ( ON ?auto_256214 ?auto_256215 ) ( ON ?auto_256213 ?auto_256214 ) ( ON ?auto_256212 ?auto_256213 ) ( ON ?auto_256211 ?auto_256212 ) ( ON ?auto_256210 ?auto_256211 ) ( ON ?auto_256209 ?auto_256210 ) ( CLEAR ?auto_256209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_256209 )
      ( MAKE-11PILE ?auto_256209 ?auto_256210 ?auto_256211 ?auto_256212 ?auto_256213 ?auto_256214 ?auto_256215 ?auto_256216 ?auto_256217 ?auto_256218 ?auto_256219 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_256232 - BLOCK
      ?auto_256233 - BLOCK
      ?auto_256234 - BLOCK
      ?auto_256235 - BLOCK
      ?auto_256236 - BLOCK
      ?auto_256237 - BLOCK
      ?auto_256238 - BLOCK
      ?auto_256239 - BLOCK
      ?auto_256240 - BLOCK
      ?auto_256241 - BLOCK
      ?auto_256242 - BLOCK
    )
    :vars
    (
      ?auto_256243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256242 ?auto_256243 ) ( not ( = ?auto_256232 ?auto_256233 ) ) ( not ( = ?auto_256232 ?auto_256234 ) ) ( not ( = ?auto_256232 ?auto_256235 ) ) ( not ( = ?auto_256232 ?auto_256236 ) ) ( not ( = ?auto_256232 ?auto_256237 ) ) ( not ( = ?auto_256232 ?auto_256238 ) ) ( not ( = ?auto_256232 ?auto_256239 ) ) ( not ( = ?auto_256232 ?auto_256240 ) ) ( not ( = ?auto_256232 ?auto_256241 ) ) ( not ( = ?auto_256232 ?auto_256242 ) ) ( not ( = ?auto_256232 ?auto_256243 ) ) ( not ( = ?auto_256233 ?auto_256234 ) ) ( not ( = ?auto_256233 ?auto_256235 ) ) ( not ( = ?auto_256233 ?auto_256236 ) ) ( not ( = ?auto_256233 ?auto_256237 ) ) ( not ( = ?auto_256233 ?auto_256238 ) ) ( not ( = ?auto_256233 ?auto_256239 ) ) ( not ( = ?auto_256233 ?auto_256240 ) ) ( not ( = ?auto_256233 ?auto_256241 ) ) ( not ( = ?auto_256233 ?auto_256242 ) ) ( not ( = ?auto_256233 ?auto_256243 ) ) ( not ( = ?auto_256234 ?auto_256235 ) ) ( not ( = ?auto_256234 ?auto_256236 ) ) ( not ( = ?auto_256234 ?auto_256237 ) ) ( not ( = ?auto_256234 ?auto_256238 ) ) ( not ( = ?auto_256234 ?auto_256239 ) ) ( not ( = ?auto_256234 ?auto_256240 ) ) ( not ( = ?auto_256234 ?auto_256241 ) ) ( not ( = ?auto_256234 ?auto_256242 ) ) ( not ( = ?auto_256234 ?auto_256243 ) ) ( not ( = ?auto_256235 ?auto_256236 ) ) ( not ( = ?auto_256235 ?auto_256237 ) ) ( not ( = ?auto_256235 ?auto_256238 ) ) ( not ( = ?auto_256235 ?auto_256239 ) ) ( not ( = ?auto_256235 ?auto_256240 ) ) ( not ( = ?auto_256235 ?auto_256241 ) ) ( not ( = ?auto_256235 ?auto_256242 ) ) ( not ( = ?auto_256235 ?auto_256243 ) ) ( not ( = ?auto_256236 ?auto_256237 ) ) ( not ( = ?auto_256236 ?auto_256238 ) ) ( not ( = ?auto_256236 ?auto_256239 ) ) ( not ( = ?auto_256236 ?auto_256240 ) ) ( not ( = ?auto_256236 ?auto_256241 ) ) ( not ( = ?auto_256236 ?auto_256242 ) ) ( not ( = ?auto_256236 ?auto_256243 ) ) ( not ( = ?auto_256237 ?auto_256238 ) ) ( not ( = ?auto_256237 ?auto_256239 ) ) ( not ( = ?auto_256237 ?auto_256240 ) ) ( not ( = ?auto_256237 ?auto_256241 ) ) ( not ( = ?auto_256237 ?auto_256242 ) ) ( not ( = ?auto_256237 ?auto_256243 ) ) ( not ( = ?auto_256238 ?auto_256239 ) ) ( not ( = ?auto_256238 ?auto_256240 ) ) ( not ( = ?auto_256238 ?auto_256241 ) ) ( not ( = ?auto_256238 ?auto_256242 ) ) ( not ( = ?auto_256238 ?auto_256243 ) ) ( not ( = ?auto_256239 ?auto_256240 ) ) ( not ( = ?auto_256239 ?auto_256241 ) ) ( not ( = ?auto_256239 ?auto_256242 ) ) ( not ( = ?auto_256239 ?auto_256243 ) ) ( not ( = ?auto_256240 ?auto_256241 ) ) ( not ( = ?auto_256240 ?auto_256242 ) ) ( not ( = ?auto_256240 ?auto_256243 ) ) ( not ( = ?auto_256241 ?auto_256242 ) ) ( not ( = ?auto_256241 ?auto_256243 ) ) ( not ( = ?auto_256242 ?auto_256243 ) ) ( ON ?auto_256241 ?auto_256242 ) ( ON ?auto_256240 ?auto_256241 ) ( ON ?auto_256239 ?auto_256240 ) ( ON ?auto_256238 ?auto_256239 ) ( ON ?auto_256237 ?auto_256238 ) ( ON ?auto_256236 ?auto_256237 ) ( ON ?auto_256235 ?auto_256236 ) ( ON ?auto_256234 ?auto_256235 ) ( ON ?auto_256233 ?auto_256234 ) ( ON ?auto_256232 ?auto_256233 ) ( CLEAR ?auto_256232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_256232 )
      ( MAKE-11PILE ?auto_256232 ?auto_256233 ?auto_256234 ?auto_256235 ?auto_256236 ?auto_256237 ?auto_256238 ?auto_256239 ?auto_256240 ?auto_256241 ?auto_256242 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_256256 - BLOCK
      ?auto_256257 - BLOCK
      ?auto_256258 - BLOCK
      ?auto_256259 - BLOCK
      ?auto_256260 - BLOCK
      ?auto_256261 - BLOCK
      ?auto_256262 - BLOCK
      ?auto_256263 - BLOCK
      ?auto_256264 - BLOCK
      ?auto_256265 - BLOCK
      ?auto_256266 - BLOCK
      ?auto_256267 - BLOCK
    )
    :vars
    (
      ?auto_256268 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_256266 ) ( ON ?auto_256267 ?auto_256268 ) ( CLEAR ?auto_256267 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_256256 ) ( ON ?auto_256257 ?auto_256256 ) ( ON ?auto_256258 ?auto_256257 ) ( ON ?auto_256259 ?auto_256258 ) ( ON ?auto_256260 ?auto_256259 ) ( ON ?auto_256261 ?auto_256260 ) ( ON ?auto_256262 ?auto_256261 ) ( ON ?auto_256263 ?auto_256262 ) ( ON ?auto_256264 ?auto_256263 ) ( ON ?auto_256265 ?auto_256264 ) ( ON ?auto_256266 ?auto_256265 ) ( not ( = ?auto_256256 ?auto_256257 ) ) ( not ( = ?auto_256256 ?auto_256258 ) ) ( not ( = ?auto_256256 ?auto_256259 ) ) ( not ( = ?auto_256256 ?auto_256260 ) ) ( not ( = ?auto_256256 ?auto_256261 ) ) ( not ( = ?auto_256256 ?auto_256262 ) ) ( not ( = ?auto_256256 ?auto_256263 ) ) ( not ( = ?auto_256256 ?auto_256264 ) ) ( not ( = ?auto_256256 ?auto_256265 ) ) ( not ( = ?auto_256256 ?auto_256266 ) ) ( not ( = ?auto_256256 ?auto_256267 ) ) ( not ( = ?auto_256256 ?auto_256268 ) ) ( not ( = ?auto_256257 ?auto_256258 ) ) ( not ( = ?auto_256257 ?auto_256259 ) ) ( not ( = ?auto_256257 ?auto_256260 ) ) ( not ( = ?auto_256257 ?auto_256261 ) ) ( not ( = ?auto_256257 ?auto_256262 ) ) ( not ( = ?auto_256257 ?auto_256263 ) ) ( not ( = ?auto_256257 ?auto_256264 ) ) ( not ( = ?auto_256257 ?auto_256265 ) ) ( not ( = ?auto_256257 ?auto_256266 ) ) ( not ( = ?auto_256257 ?auto_256267 ) ) ( not ( = ?auto_256257 ?auto_256268 ) ) ( not ( = ?auto_256258 ?auto_256259 ) ) ( not ( = ?auto_256258 ?auto_256260 ) ) ( not ( = ?auto_256258 ?auto_256261 ) ) ( not ( = ?auto_256258 ?auto_256262 ) ) ( not ( = ?auto_256258 ?auto_256263 ) ) ( not ( = ?auto_256258 ?auto_256264 ) ) ( not ( = ?auto_256258 ?auto_256265 ) ) ( not ( = ?auto_256258 ?auto_256266 ) ) ( not ( = ?auto_256258 ?auto_256267 ) ) ( not ( = ?auto_256258 ?auto_256268 ) ) ( not ( = ?auto_256259 ?auto_256260 ) ) ( not ( = ?auto_256259 ?auto_256261 ) ) ( not ( = ?auto_256259 ?auto_256262 ) ) ( not ( = ?auto_256259 ?auto_256263 ) ) ( not ( = ?auto_256259 ?auto_256264 ) ) ( not ( = ?auto_256259 ?auto_256265 ) ) ( not ( = ?auto_256259 ?auto_256266 ) ) ( not ( = ?auto_256259 ?auto_256267 ) ) ( not ( = ?auto_256259 ?auto_256268 ) ) ( not ( = ?auto_256260 ?auto_256261 ) ) ( not ( = ?auto_256260 ?auto_256262 ) ) ( not ( = ?auto_256260 ?auto_256263 ) ) ( not ( = ?auto_256260 ?auto_256264 ) ) ( not ( = ?auto_256260 ?auto_256265 ) ) ( not ( = ?auto_256260 ?auto_256266 ) ) ( not ( = ?auto_256260 ?auto_256267 ) ) ( not ( = ?auto_256260 ?auto_256268 ) ) ( not ( = ?auto_256261 ?auto_256262 ) ) ( not ( = ?auto_256261 ?auto_256263 ) ) ( not ( = ?auto_256261 ?auto_256264 ) ) ( not ( = ?auto_256261 ?auto_256265 ) ) ( not ( = ?auto_256261 ?auto_256266 ) ) ( not ( = ?auto_256261 ?auto_256267 ) ) ( not ( = ?auto_256261 ?auto_256268 ) ) ( not ( = ?auto_256262 ?auto_256263 ) ) ( not ( = ?auto_256262 ?auto_256264 ) ) ( not ( = ?auto_256262 ?auto_256265 ) ) ( not ( = ?auto_256262 ?auto_256266 ) ) ( not ( = ?auto_256262 ?auto_256267 ) ) ( not ( = ?auto_256262 ?auto_256268 ) ) ( not ( = ?auto_256263 ?auto_256264 ) ) ( not ( = ?auto_256263 ?auto_256265 ) ) ( not ( = ?auto_256263 ?auto_256266 ) ) ( not ( = ?auto_256263 ?auto_256267 ) ) ( not ( = ?auto_256263 ?auto_256268 ) ) ( not ( = ?auto_256264 ?auto_256265 ) ) ( not ( = ?auto_256264 ?auto_256266 ) ) ( not ( = ?auto_256264 ?auto_256267 ) ) ( not ( = ?auto_256264 ?auto_256268 ) ) ( not ( = ?auto_256265 ?auto_256266 ) ) ( not ( = ?auto_256265 ?auto_256267 ) ) ( not ( = ?auto_256265 ?auto_256268 ) ) ( not ( = ?auto_256266 ?auto_256267 ) ) ( not ( = ?auto_256266 ?auto_256268 ) ) ( not ( = ?auto_256267 ?auto_256268 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_256267 ?auto_256268 )
      ( !STACK ?auto_256267 ?auto_256266 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_256281 - BLOCK
      ?auto_256282 - BLOCK
      ?auto_256283 - BLOCK
      ?auto_256284 - BLOCK
      ?auto_256285 - BLOCK
      ?auto_256286 - BLOCK
      ?auto_256287 - BLOCK
      ?auto_256288 - BLOCK
      ?auto_256289 - BLOCK
      ?auto_256290 - BLOCK
      ?auto_256291 - BLOCK
      ?auto_256292 - BLOCK
    )
    :vars
    (
      ?auto_256293 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_256291 ) ( ON ?auto_256292 ?auto_256293 ) ( CLEAR ?auto_256292 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_256281 ) ( ON ?auto_256282 ?auto_256281 ) ( ON ?auto_256283 ?auto_256282 ) ( ON ?auto_256284 ?auto_256283 ) ( ON ?auto_256285 ?auto_256284 ) ( ON ?auto_256286 ?auto_256285 ) ( ON ?auto_256287 ?auto_256286 ) ( ON ?auto_256288 ?auto_256287 ) ( ON ?auto_256289 ?auto_256288 ) ( ON ?auto_256290 ?auto_256289 ) ( ON ?auto_256291 ?auto_256290 ) ( not ( = ?auto_256281 ?auto_256282 ) ) ( not ( = ?auto_256281 ?auto_256283 ) ) ( not ( = ?auto_256281 ?auto_256284 ) ) ( not ( = ?auto_256281 ?auto_256285 ) ) ( not ( = ?auto_256281 ?auto_256286 ) ) ( not ( = ?auto_256281 ?auto_256287 ) ) ( not ( = ?auto_256281 ?auto_256288 ) ) ( not ( = ?auto_256281 ?auto_256289 ) ) ( not ( = ?auto_256281 ?auto_256290 ) ) ( not ( = ?auto_256281 ?auto_256291 ) ) ( not ( = ?auto_256281 ?auto_256292 ) ) ( not ( = ?auto_256281 ?auto_256293 ) ) ( not ( = ?auto_256282 ?auto_256283 ) ) ( not ( = ?auto_256282 ?auto_256284 ) ) ( not ( = ?auto_256282 ?auto_256285 ) ) ( not ( = ?auto_256282 ?auto_256286 ) ) ( not ( = ?auto_256282 ?auto_256287 ) ) ( not ( = ?auto_256282 ?auto_256288 ) ) ( not ( = ?auto_256282 ?auto_256289 ) ) ( not ( = ?auto_256282 ?auto_256290 ) ) ( not ( = ?auto_256282 ?auto_256291 ) ) ( not ( = ?auto_256282 ?auto_256292 ) ) ( not ( = ?auto_256282 ?auto_256293 ) ) ( not ( = ?auto_256283 ?auto_256284 ) ) ( not ( = ?auto_256283 ?auto_256285 ) ) ( not ( = ?auto_256283 ?auto_256286 ) ) ( not ( = ?auto_256283 ?auto_256287 ) ) ( not ( = ?auto_256283 ?auto_256288 ) ) ( not ( = ?auto_256283 ?auto_256289 ) ) ( not ( = ?auto_256283 ?auto_256290 ) ) ( not ( = ?auto_256283 ?auto_256291 ) ) ( not ( = ?auto_256283 ?auto_256292 ) ) ( not ( = ?auto_256283 ?auto_256293 ) ) ( not ( = ?auto_256284 ?auto_256285 ) ) ( not ( = ?auto_256284 ?auto_256286 ) ) ( not ( = ?auto_256284 ?auto_256287 ) ) ( not ( = ?auto_256284 ?auto_256288 ) ) ( not ( = ?auto_256284 ?auto_256289 ) ) ( not ( = ?auto_256284 ?auto_256290 ) ) ( not ( = ?auto_256284 ?auto_256291 ) ) ( not ( = ?auto_256284 ?auto_256292 ) ) ( not ( = ?auto_256284 ?auto_256293 ) ) ( not ( = ?auto_256285 ?auto_256286 ) ) ( not ( = ?auto_256285 ?auto_256287 ) ) ( not ( = ?auto_256285 ?auto_256288 ) ) ( not ( = ?auto_256285 ?auto_256289 ) ) ( not ( = ?auto_256285 ?auto_256290 ) ) ( not ( = ?auto_256285 ?auto_256291 ) ) ( not ( = ?auto_256285 ?auto_256292 ) ) ( not ( = ?auto_256285 ?auto_256293 ) ) ( not ( = ?auto_256286 ?auto_256287 ) ) ( not ( = ?auto_256286 ?auto_256288 ) ) ( not ( = ?auto_256286 ?auto_256289 ) ) ( not ( = ?auto_256286 ?auto_256290 ) ) ( not ( = ?auto_256286 ?auto_256291 ) ) ( not ( = ?auto_256286 ?auto_256292 ) ) ( not ( = ?auto_256286 ?auto_256293 ) ) ( not ( = ?auto_256287 ?auto_256288 ) ) ( not ( = ?auto_256287 ?auto_256289 ) ) ( not ( = ?auto_256287 ?auto_256290 ) ) ( not ( = ?auto_256287 ?auto_256291 ) ) ( not ( = ?auto_256287 ?auto_256292 ) ) ( not ( = ?auto_256287 ?auto_256293 ) ) ( not ( = ?auto_256288 ?auto_256289 ) ) ( not ( = ?auto_256288 ?auto_256290 ) ) ( not ( = ?auto_256288 ?auto_256291 ) ) ( not ( = ?auto_256288 ?auto_256292 ) ) ( not ( = ?auto_256288 ?auto_256293 ) ) ( not ( = ?auto_256289 ?auto_256290 ) ) ( not ( = ?auto_256289 ?auto_256291 ) ) ( not ( = ?auto_256289 ?auto_256292 ) ) ( not ( = ?auto_256289 ?auto_256293 ) ) ( not ( = ?auto_256290 ?auto_256291 ) ) ( not ( = ?auto_256290 ?auto_256292 ) ) ( not ( = ?auto_256290 ?auto_256293 ) ) ( not ( = ?auto_256291 ?auto_256292 ) ) ( not ( = ?auto_256291 ?auto_256293 ) ) ( not ( = ?auto_256292 ?auto_256293 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_256292 ?auto_256293 )
      ( !STACK ?auto_256292 ?auto_256291 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_256306 - BLOCK
      ?auto_256307 - BLOCK
      ?auto_256308 - BLOCK
      ?auto_256309 - BLOCK
      ?auto_256310 - BLOCK
      ?auto_256311 - BLOCK
      ?auto_256312 - BLOCK
      ?auto_256313 - BLOCK
      ?auto_256314 - BLOCK
      ?auto_256315 - BLOCK
      ?auto_256316 - BLOCK
      ?auto_256317 - BLOCK
    )
    :vars
    (
      ?auto_256318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256317 ?auto_256318 ) ( ON-TABLE ?auto_256306 ) ( ON ?auto_256307 ?auto_256306 ) ( ON ?auto_256308 ?auto_256307 ) ( ON ?auto_256309 ?auto_256308 ) ( ON ?auto_256310 ?auto_256309 ) ( ON ?auto_256311 ?auto_256310 ) ( ON ?auto_256312 ?auto_256311 ) ( ON ?auto_256313 ?auto_256312 ) ( ON ?auto_256314 ?auto_256313 ) ( ON ?auto_256315 ?auto_256314 ) ( not ( = ?auto_256306 ?auto_256307 ) ) ( not ( = ?auto_256306 ?auto_256308 ) ) ( not ( = ?auto_256306 ?auto_256309 ) ) ( not ( = ?auto_256306 ?auto_256310 ) ) ( not ( = ?auto_256306 ?auto_256311 ) ) ( not ( = ?auto_256306 ?auto_256312 ) ) ( not ( = ?auto_256306 ?auto_256313 ) ) ( not ( = ?auto_256306 ?auto_256314 ) ) ( not ( = ?auto_256306 ?auto_256315 ) ) ( not ( = ?auto_256306 ?auto_256316 ) ) ( not ( = ?auto_256306 ?auto_256317 ) ) ( not ( = ?auto_256306 ?auto_256318 ) ) ( not ( = ?auto_256307 ?auto_256308 ) ) ( not ( = ?auto_256307 ?auto_256309 ) ) ( not ( = ?auto_256307 ?auto_256310 ) ) ( not ( = ?auto_256307 ?auto_256311 ) ) ( not ( = ?auto_256307 ?auto_256312 ) ) ( not ( = ?auto_256307 ?auto_256313 ) ) ( not ( = ?auto_256307 ?auto_256314 ) ) ( not ( = ?auto_256307 ?auto_256315 ) ) ( not ( = ?auto_256307 ?auto_256316 ) ) ( not ( = ?auto_256307 ?auto_256317 ) ) ( not ( = ?auto_256307 ?auto_256318 ) ) ( not ( = ?auto_256308 ?auto_256309 ) ) ( not ( = ?auto_256308 ?auto_256310 ) ) ( not ( = ?auto_256308 ?auto_256311 ) ) ( not ( = ?auto_256308 ?auto_256312 ) ) ( not ( = ?auto_256308 ?auto_256313 ) ) ( not ( = ?auto_256308 ?auto_256314 ) ) ( not ( = ?auto_256308 ?auto_256315 ) ) ( not ( = ?auto_256308 ?auto_256316 ) ) ( not ( = ?auto_256308 ?auto_256317 ) ) ( not ( = ?auto_256308 ?auto_256318 ) ) ( not ( = ?auto_256309 ?auto_256310 ) ) ( not ( = ?auto_256309 ?auto_256311 ) ) ( not ( = ?auto_256309 ?auto_256312 ) ) ( not ( = ?auto_256309 ?auto_256313 ) ) ( not ( = ?auto_256309 ?auto_256314 ) ) ( not ( = ?auto_256309 ?auto_256315 ) ) ( not ( = ?auto_256309 ?auto_256316 ) ) ( not ( = ?auto_256309 ?auto_256317 ) ) ( not ( = ?auto_256309 ?auto_256318 ) ) ( not ( = ?auto_256310 ?auto_256311 ) ) ( not ( = ?auto_256310 ?auto_256312 ) ) ( not ( = ?auto_256310 ?auto_256313 ) ) ( not ( = ?auto_256310 ?auto_256314 ) ) ( not ( = ?auto_256310 ?auto_256315 ) ) ( not ( = ?auto_256310 ?auto_256316 ) ) ( not ( = ?auto_256310 ?auto_256317 ) ) ( not ( = ?auto_256310 ?auto_256318 ) ) ( not ( = ?auto_256311 ?auto_256312 ) ) ( not ( = ?auto_256311 ?auto_256313 ) ) ( not ( = ?auto_256311 ?auto_256314 ) ) ( not ( = ?auto_256311 ?auto_256315 ) ) ( not ( = ?auto_256311 ?auto_256316 ) ) ( not ( = ?auto_256311 ?auto_256317 ) ) ( not ( = ?auto_256311 ?auto_256318 ) ) ( not ( = ?auto_256312 ?auto_256313 ) ) ( not ( = ?auto_256312 ?auto_256314 ) ) ( not ( = ?auto_256312 ?auto_256315 ) ) ( not ( = ?auto_256312 ?auto_256316 ) ) ( not ( = ?auto_256312 ?auto_256317 ) ) ( not ( = ?auto_256312 ?auto_256318 ) ) ( not ( = ?auto_256313 ?auto_256314 ) ) ( not ( = ?auto_256313 ?auto_256315 ) ) ( not ( = ?auto_256313 ?auto_256316 ) ) ( not ( = ?auto_256313 ?auto_256317 ) ) ( not ( = ?auto_256313 ?auto_256318 ) ) ( not ( = ?auto_256314 ?auto_256315 ) ) ( not ( = ?auto_256314 ?auto_256316 ) ) ( not ( = ?auto_256314 ?auto_256317 ) ) ( not ( = ?auto_256314 ?auto_256318 ) ) ( not ( = ?auto_256315 ?auto_256316 ) ) ( not ( = ?auto_256315 ?auto_256317 ) ) ( not ( = ?auto_256315 ?auto_256318 ) ) ( not ( = ?auto_256316 ?auto_256317 ) ) ( not ( = ?auto_256316 ?auto_256318 ) ) ( not ( = ?auto_256317 ?auto_256318 ) ) ( CLEAR ?auto_256315 ) ( ON ?auto_256316 ?auto_256317 ) ( CLEAR ?auto_256316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_256306 ?auto_256307 ?auto_256308 ?auto_256309 ?auto_256310 ?auto_256311 ?auto_256312 ?auto_256313 ?auto_256314 ?auto_256315 ?auto_256316 )
      ( MAKE-12PILE ?auto_256306 ?auto_256307 ?auto_256308 ?auto_256309 ?auto_256310 ?auto_256311 ?auto_256312 ?auto_256313 ?auto_256314 ?auto_256315 ?auto_256316 ?auto_256317 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_256331 - BLOCK
      ?auto_256332 - BLOCK
      ?auto_256333 - BLOCK
      ?auto_256334 - BLOCK
      ?auto_256335 - BLOCK
      ?auto_256336 - BLOCK
      ?auto_256337 - BLOCK
      ?auto_256338 - BLOCK
      ?auto_256339 - BLOCK
      ?auto_256340 - BLOCK
      ?auto_256341 - BLOCK
      ?auto_256342 - BLOCK
    )
    :vars
    (
      ?auto_256343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256342 ?auto_256343 ) ( ON-TABLE ?auto_256331 ) ( ON ?auto_256332 ?auto_256331 ) ( ON ?auto_256333 ?auto_256332 ) ( ON ?auto_256334 ?auto_256333 ) ( ON ?auto_256335 ?auto_256334 ) ( ON ?auto_256336 ?auto_256335 ) ( ON ?auto_256337 ?auto_256336 ) ( ON ?auto_256338 ?auto_256337 ) ( ON ?auto_256339 ?auto_256338 ) ( ON ?auto_256340 ?auto_256339 ) ( not ( = ?auto_256331 ?auto_256332 ) ) ( not ( = ?auto_256331 ?auto_256333 ) ) ( not ( = ?auto_256331 ?auto_256334 ) ) ( not ( = ?auto_256331 ?auto_256335 ) ) ( not ( = ?auto_256331 ?auto_256336 ) ) ( not ( = ?auto_256331 ?auto_256337 ) ) ( not ( = ?auto_256331 ?auto_256338 ) ) ( not ( = ?auto_256331 ?auto_256339 ) ) ( not ( = ?auto_256331 ?auto_256340 ) ) ( not ( = ?auto_256331 ?auto_256341 ) ) ( not ( = ?auto_256331 ?auto_256342 ) ) ( not ( = ?auto_256331 ?auto_256343 ) ) ( not ( = ?auto_256332 ?auto_256333 ) ) ( not ( = ?auto_256332 ?auto_256334 ) ) ( not ( = ?auto_256332 ?auto_256335 ) ) ( not ( = ?auto_256332 ?auto_256336 ) ) ( not ( = ?auto_256332 ?auto_256337 ) ) ( not ( = ?auto_256332 ?auto_256338 ) ) ( not ( = ?auto_256332 ?auto_256339 ) ) ( not ( = ?auto_256332 ?auto_256340 ) ) ( not ( = ?auto_256332 ?auto_256341 ) ) ( not ( = ?auto_256332 ?auto_256342 ) ) ( not ( = ?auto_256332 ?auto_256343 ) ) ( not ( = ?auto_256333 ?auto_256334 ) ) ( not ( = ?auto_256333 ?auto_256335 ) ) ( not ( = ?auto_256333 ?auto_256336 ) ) ( not ( = ?auto_256333 ?auto_256337 ) ) ( not ( = ?auto_256333 ?auto_256338 ) ) ( not ( = ?auto_256333 ?auto_256339 ) ) ( not ( = ?auto_256333 ?auto_256340 ) ) ( not ( = ?auto_256333 ?auto_256341 ) ) ( not ( = ?auto_256333 ?auto_256342 ) ) ( not ( = ?auto_256333 ?auto_256343 ) ) ( not ( = ?auto_256334 ?auto_256335 ) ) ( not ( = ?auto_256334 ?auto_256336 ) ) ( not ( = ?auto_256334 ?auto_256337 ) ) ( not ( = ?auto_256334 ?auto_256338 ) ) ( not ( = ?auto_256334 ?auto_256339 ) ) ( not ( = ?auto_256334 ?auto_256340 ) ) ( not ( = ?auto_256334 ?auto_256341 ) ) ( not ( = ?auto_256334 ?auto_256342 ) ) ( not ( = ?auto_256334 ?auto_256343 ) ) ( not ( = ?auto_256335 ?auto_256336 ) ) ( not ( = ?auto_256335 ?auto_256337 ) ) ( not ( = ?auto_256335 ?auto_256338 ) ) ( not ( = ?auto_256335 ?auto_256339 ) ) ( not ( = ?auto_256335 ?auto_256340 ) ) ( not ( = ?auto_256335 ?auto_256341 ) ) ( not ( = ?auto_256335 ?auto_256342 ) ) ( not ( = ?auto_256335 ?auto_256343 ) ) ( not ( = ?auto_256336 ?auto_256337 ) ) ( not ( = ?auto_256336 ?auto_256338 ) ) ( not ( = ?auto_256336 ?auto_256339 ) ) ( not ( = ?auto_256336 ?auto_256340 ) ) ( not ( = ?auto_256336 ?auto_256341 ) ) ( not ( = ?auto_256336 ?auto_256342 ) ) ( not ( = ?auto_256336 ?auto_256343 ) ) ( not ( = ?auto_256337 ?auto_256338 ) ) ( not ( = ?auto_256337 ?auto_256339 ) ) ( not ( = ?auto_256337 ?auto_256340 ) ) ( not ( = ?auto_256337 ?auto_256341 ) ) ( not ( = ?auto_256337 ?auto_256342 ) ) ( not ( = ?auto_256337 ?auto_256343 ) ) ( not ( = ?auto_256338 ?auto_256339 ) ) ( not ( = ?auto_256338 ?auto_256340 ) ) ( not ( = ?auto_256338 ?auto_256341 ) ) ( not ( = ?auto_256338 ?auto_256342 ) ) ( not ( = ?auto_256338 ?auto_256343 ) ) ( not ( = ?auto_256339 ?auto_256340 ) ) ( not ( = ?auto_256339 ?auto_256341 ) ) ( not ( = ?auto_256339 ?auto_256342 ) ) ( not ( = ?auto_256339 ?auto_256343 ) ) ( not ( = ?auto_256340 ?auto_256341 ) ) ( not ( = ?auto_256340 ?auto_256342 ) ) ( not ( = ?auto_256340 ?auto_256343 ) ) ( not ( = ?auto_256341 ?auto_256342 ) ) ( not ( = ?auto_256341 ?auto_256343 ) ) ( not ( = ?auto_256342 ?auto_256343 ) ) ( CLEAR ?auto_256340 ) ( ON ?auto_256341 ?auto_256342 ) ( CLEAR ?auto_256341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_256331 ?auto_256332 ?auto_256333 ?auto_256334 ?auto_256335 ?auto_256336 ?auto_256337 ?auto_256338 ?auto_256339 ?auto_256340 ?auto_256341 )
      ( MAKE-12PILE ?auto_256331 ?auto_256332 ?auto_256333 ?auto_256334 ?auto_256335 ?auto_256336 ?auto_256337 ?auto_256338 ?auto_256339 ?auto_256340 ?auto_256341 ?auto_256342 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_256356 - BLOCK
      ?auto_256357 - BLOCK
      ?auto_256358 - BLOCK
      ?auto_256359 - BLOCK
      ?auto_256360 - BLOCK
      ?auto_256361 - BLOCK
      ?auto_256362 - BLOCK
      ?auto_256363 - BLOCK
      ?auto_256364 - BLOCK
      ?auto_256365 - BLOCK
      ?auto_256366 - BLOCK
      ?auto_256367 - BLOCK
    )
    :vars
    (
      ?auto_256368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256367 ?auto_256368 ) ( ON-TABLE ?auto_256356 ) ( ON ?auto_256357 ?auto_256356 ) ( ON ?auto_256358 ?auto_256357 ) ( ON ?auto_256359 ?auto_256358 ) ( ON ?auto_256360 ?auto_256359 ) ( ON ?auto_256361 ?auto_256360 ) ( ON ?auto_256362 ?auto_256361 ) ( ON ?auto_256363 ?auto_256362 ) ( ON ?auto_256364 ?auto_256363 ) ( not ( = ?auto_256356 ?auto_256357 ) ) ( not ( = ?auto_256356 ?auto_256358 ) ) ( not ( = ?auto_256356 ?auto_256359 ) ) ( not ( = ?auto_256356 ?auto_256360 ) ) ( not ( = ?auto_256356 ?auto_256361 ) ) ( not ( = ?auto_256356 ?auto_256362 ) ) ( not ( = ?auto_256356 ?auto_256363 ) ) ( not ( = ?auto_256356 ?auto_256364 ) ) ( not ( = ?auto_256356 ?auto_256365 ) ) ( not ( = ?auto_256356 ?auto_256366 ) ) ( not ( = ?auto_256356 ?auto_256367 ) ) ( not ( = ?auto_256356 ?auto_256368 ) ) ( not ( = ?auto_256357 ?auto_256358 ) ) ( not ( = ?auto_256357 ?auto_256359 ) ) ( not ( = ?auto_256357 ?auto_256360 ) ) ( not ( = ?auto_256357 ?auto_256361 ) ) ( not ( = ?auto_256357 ?auto_256362 ) ) ( not ( = ?auto_256357 ?auto_256363 ) ) ( not ( = ?auto_256357 ?auto_256364 ) ) ( not ( = ?auto_256357 ?auto_256365 ) ) ( not ( = ?auto_256357 ?auto_256366 ) ) ( not ( = ?auto_256357 ?auto_256367 ) ) ( not ( = ?auto_256357 ?auto_256368 ) ) ( not ( = ?auto_256358 ?auto_256359 ) ) ( not ( = ?auto_256358 ?auto_256360 ) ) ( not ( = ?auto_256358 ?auto_256361 ) ) ( not ( = ?auto_256358 ?auto_256362 ) ) ( not ( = ?auto_256358 ?auto_256363 ) ) ( not ( = ?auto_256358 ?auto_256364 ) ) ( not ( = ?auto_256358 ?auto_256365 ) ) ( not ( = ?auto_256358 ?auto_256366 ) ) ( not ( = ?auto_256358 ?auto_256367 ) ) ( not ( = ?auto_256358 ?auto_256368 ) ) ( not ( = ?auto_256359 ?auto_256360 ) ) ( not ( = ?auto_256359 ?auto_256361 ) ) ( not ( = ?auto_256359 ?auto_256362 ) ) ( not ( = ?auto_256359 ?auto_256363 ) ) ( not ( = ?auto_256359 ?auto_256364 ) ) ( not ( = ?auto_256359 ?auto_256365 ) ) ( not ( = ?auto_256359 ?auto_256366 ) ) ( not ( = ?auto_256359 ?auto_256367 ) ) ( not ( = ?auto_256359 ?auto_256368 ) ) ( not ( = ?auto_256360 ?auto_256361 ) ) ( not ( = ?auto_256360 ?auto_256362 ) ) ( not ( = ?auto_256360 ?auto_256363 ) ) ( not ( = ?auto_256360 ?auto_256364 ) ) ( not ( = ?auto_256360 ?auto_256365 ) ) ( not ( = ?auto_256360 ?auto_256366 ) ) ( not ( = ?auto_256360 ?auto_256367 ) ) ( not ( = ?auto_256360 ?auto_256368 ) ) ( not ( = ?auto_256361 ?auto_256362 ) ) ( not ( = ?auto_256361 ?auto_256363 ) ) ( not ( = ?auto_256361 ?auto_256364 ) ) ( not ( = ?auto_256361 ?auto_256365 ) ) ( not ( = ?auto_256361 ?auto_256366 ) ) ( not ( = ?auto_256361 ?auto_256367 ) ) ( not ( = ?auto_256361 ?auto_256368 ) ) ( not ( = ?auto_256362 ?auto_256363 ) ) ( not ( = ?auto_256362 ?auto_256364 ) ) ( not ( = ?auto_256362 ?auto_256365 ) ) ( not ( = ?auto_256362 ?auto_256366 ) ) ( not ( = ?auto_256362 ?auto_256367 ) ) ( not ( = ?auto_256362 ?auto_256368 ) ) ( not ( = ?auto_256363 ?auto_256364 ) ) ( not ( = ?auto_256363 ?auto_256365 ) ) ( not ( = ?auto_256363 ?auto_256366 ) ) ( not ( = ?auto_256363 ?auto_256367 ) ) ( not ( = ?auto_256363 ?auto_256368 ) ) ( not ( = ?auto_256364 ?auto_256365 ) ) ( not ( = ?auto_256364 ?auto_256366 ) ) ( not ( = ?auto_256364 ?auto_256367 ) ) ( not ( = ?auto_256364 ?auto_256368 ) ) ( not ( = ?auto_256365 ?auto_256366 ) ) ( not ( = ?auto_256365 ?auto_256367 ) ) ( not ( = ?auto_256365 ?auto_256368 ) ) ( not ( = ?auto_256366 ?auto_256367 ) ) ( not ( = ?auto_256366 ?auto_256368 ) ) ( not ( = ?auto_256367 ?auto_256368 ) ) ( ON ?auto_256366 ?auto_256367 ) ( CLEAR ?auto_256364 ) ( ON ?auto_256365 ?auto_256366 ) ( CLEAR ?auto_256365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_256356 ?auto_256357 ?auto_256358 ?auto_256359 ?auto_256360 ?auto_256361 ?auto_256362 ?auto_256363 ?auto_256364 ?auto_256365 )
      ( MAKE-12PILE ?auto_256356 ?auto_256357 ?auto_256358 ?auto_256359 ?auto_256360 ?auto_256361 ?auto_256362 ?auto_256363 ?auto_256364 ?auto_256365 ?auto_256366 ?auto_256367 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_256381 - BLOCK
      ?auto_256382 - BLOCK
      ?auto_256383 - BLOCK
      ?auto_256384 - BLOCK
      ?auto_256385 - BLOCK
      ?auto_256386 - BLOCK
      ?auto_256387 - BLOCK
      ?auto_256388 - BLOCK
      ?auto_256389 - BLOCK
      ?auto_256390 - BLOCK
      ?auto_256391 - BLOCK
      ?auto_256392 - BLOCK
    )
    :vars
    (
      ?auto_256393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256392 ?auto_256393 ) ( ON-TABLE ?auto_256381 ) ( ON ?auto_256382 ?auto_256381 ) ( ON ?auto_256383 ?auto_256382 ) ( ON ?auto_256384 ?auto_256383 ) ( ON ?auto_256385 ?auto_256384 ) ( ON ?auto_256386 ?auto_256385 ) ( ON ?auto_256387 ?auto_256386 ) ( ON ?auto_256388 ?auto_256387 ) ( ON ?auto_256389 ?auto_256388 ) ( not ( = ?auto_256381 ?auto_256382 ) ) ( not ( = ?auto_256381 ?auto_256383 ) ) ( not ( = ?auto_256381 ?auto_256384 ) ) ( not ( = ?auto_256381 ?auto_256385 ) ) ( not ( = ?auto_256381 ?auto_256386 ) ) ( not ( = ?auto_256381 ?auto_256387 ) ) ( not ( = ?auto_256381 ?auto_256388 ) ) ( not ( = ?auto_256381 ?auto_256389 ) ) ( not ( = ?auto_256381 ?auto_256390 ) ) ( not ( = ?auto_256381 ?auto_256391 ) ) ( not ( = ?auto_256381 ?auto_256392 ) ) ( not ( = ?auto_256381 ?auto_256393 ) ) ( not ( = ?auto_256382 ?auto_256383 ) ) ( not ( = ?auto_256382 ?auto_256384 ) ) ( not ( = ?auto_256382 ?auto_256385 ) ) ( not ( = ?auto_256382 ?auto_256386 ) ) ( not ( = ?auto_256382 ?auto_256387 ) ) ( not ( = ?auto_256382 ?auto_256388 ) ) ( not ( = ?auto_256382 ?auto_256389 ) ) ( not ( = ?auto_256382 ?auto_256390 ) ) ( not ( = ?auto_256382 ?auto_256391 ) ) ( not ( = ?auto_256382 ?auto_256392 ) ) ( not ( = ?auto_256382 ?auto_256393 ) ) ( not ( = ?auto_256383 ?auto_256384 ) ) ( not ( = ?auto_256383 ?auto_256385 ) ) ( not ( = ?auto_256383 ?auto_256386 ) ) ( not ( = ?auto_256383 ?auto_256387 ) ) ( not ( = ?auto_256383 ?auto_256388 ) ) ( not ( = ?auto_256383 ?auto_256389 ) ) ( not ( = ?auto_256383 ?auto_256390 ) ) ( not ( = ?auto_256383 ?auto_256391 ) ) ( not ( = ?auto_256383 ?auto_256392 ) ) ( not ( = ?auto_256383 ?auto_256393 ) ) ( not ( = ?auto_256384 ?auto_256385 ) ) ( not ( = ?auto_256384 ?auto_256386 ) ) ( not ( = ?auto_256384 ?auto_256387 ) ) ( not ( = ?auto_256384 ?auto_256388 ) ) ( not ( = ?auto_256384 ?auto_256389 ) ) ( not ( = ?auto_256384 ?auto_256390 ) ) ( not ( = ?auto_256384 ?auto_256391 ) ) ( not ( = ?auto_256384 ?auto_256392 ) ) ( not ( = ?auto_256384 ?auto_256393 ) ) ( not ( = ?auto_256385 ?auto_256386 ) ) ( not ( = ?auto_256385 ?auto_256387 ) ) ( not ( = ?auto_256385 ?auto_256388 ) ) ( not ( = ?auto_256385 ?auto_256389 ) ) ( not ( = ?auto_256385 ?auto_256390 ) ) ( not ( = ?auto_256385 ?auto_256391 ) ) ( not ( = ?auto_256385 ?auto_256392 ) ) ( not ( = ?auto_256385 ?auto_256393 ) ) ( not ( = ?auto_256386 ?auto_256387 ) ) ( not ( = ?auto_256386 ?auto_256388 ) ) ( not ( = ?auto_256386 ?auto_256389 ) ) ( not ( = ?auto_256386 ?auto_256390 ) ) ( not ( = ?auto_256386 ?auto_256391 ) ) ( not ( = ?auto_256386 ?auto_256392 ) ) ( not ( = ?auto_256386 ?auto_256393 ) ) ( not ( = ?auto_256387 ?auto_256388 ) ) ( not ( = ?auto_256387 ?auto_256389 ) ) ( not ( = ?auto_256387 ?auto_256390 ) ) ( not ( = ?auto_256387 ?auto_256391 ) ) ( not ( = ?auto_256387 ?auto_256392 ) ) ( not ( = ?auto_256387 ?auto_256393 ) ) ( not ( = ?auto_256388 ?auto_256389 ) ) ( not ( = ?auto_256388 ?auto_256390 ) ) ( not ( = ?auto_256388 ?auto_256391 ) ) ( not ( = ?auto_256388 ?auto_256392 ) ) ( not ( = ?auto_256388 ?auto_256393 ) ) ( not ( = ?auto_256389 ?auto_256390 ) ) ( not ( = ?auto_256389 ?auto_256391 ) ) ( not ( = ?auto_256389 ?auto_256392 ) ) ( not ( = ?auto_256389 ?auto_256393 ) ) ( not ( = ?auto_256390 ?auto_256391 ) ) ( not ( = ?auto_256390 ?auto_256392 ) ) ( not ( = ?auto_256390 ?auto_256393 ) ) ( not ( = ?auto_256391 ?auto_256392 ) ) ( not ( = ?auto_256391 ?auto_256393 ) ) ( not ( = ?auto_256392 ?auto_256393 ) ) ( ON ?auto_256391 ?auto_256392 ) ( CLEAR ?auto_256389 ) ( ON ?auto_256390 ?auto_256391 ) ( CLEAR ?auto_256390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_256381 ?auto_256382 ?auto_256383 ?auto_256384 ?auto_256385 ?auto_256386 ?auto_256387 ?auto_256388 ?auto_256389 ?auto_256390 )
      ( MAKE-12PILE ?auto_256381 ?auto_256382 ?auto_256383 ?auto_256384 ?auto_256385 ?auto_256386 ?auto_256387 ?auto_256388 ?auto_256389 ?auto_256390 ?auto_256391 ?auto_256392 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_256406 - BLOCK
      ?auto_256407 - BLOCK
      ?auto_256408 - BLOCK
      ?auto_256409 - BLOCK
      ?auto_256410 - BLOCK
      ?auto_256411 - BLOCK
      ?auto_256412 - BLOCK
      ?auto_256413 - BLOCK
      ?auto_256414 - BLOCK
      ?auto_256415 - BLOCK
      ?auto_256416 - BLOCK
      ?auto_256417 - BLOCK
    )
    :vars
    (
      ?auto_256418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256417 ?auto_256418 ) ( ON-TABLE ?auto_256406 ) ( ON ?auto_256407 ?auto_256406 ) ( ON ?auto_256408 ?auto_256407 ) ( ON ?auto_256409 ?auto_256408 ) ( ON ?auto_256410 ?auto_256409 ) ( ON ?auto_256411 ?auto_256410 ) ( ON ?auto_256412 ?auto_256411 ) ( ON ?auto_256413 ?auto_256412 ) ( not ( = ?auto_256406 ?auto_256407 ) ) ( not ( = ?auto_256406 ?auto_256408 ) ) ( not ( = ?auto_256406 ?auto_256409 ) ) ( not ( = ?auto_256406 ?auto_256410 ) ) ( not ( = ?auto_256406 ?auto_256411 ) ) ( not ( = ?auto_256406 ?auto_256412 ) ) ( not ( = ?auto_256406 ?auto_256413 ) ) ( not ( = ?auto_256406 ?auto_256414 ) ) ( not ( = ?auto_256406 ?auto_256415 ) ) ( not ( = ?auto_256406 ?auto_256416 ) ) ( not ( = ?auto_256406 ?auto_256417 ) ) ( not ( = ?auto_256406 ?auto_256418 ) ) ( not ( = ?auto_256407 ?auto_256408 ) ) ( not ( = ?auto_256407 ?auto_256409 ) ) ( not ( = ?auto_256407 ?auto_256410 ) ) ( not ( = ?auto_256407 ?auto_256411 ) ) ( not ( = ?auto_256407 ?auto_256412 ) ) ( not ( = ?auto_256407 ?auto_256413 ) ) ( not ( = ?auto_256407 ?auto_256414 ) ) ( not ( = ?auto_256407 ?auto_256415 ) ) ( not ( = ?auto_256407 ?auto_256416 ) ) ( not ( = ?auto_256407 ?auto_256417 ) ) ( not ( = ?auto_256407 ?auto_256418 ) ) ( not ( = ?auto_256408 ?auto_256409 ) ) ( not ( = ?auto_256408 ?auto_256410 ) ) ( not ( = ?auto_256408 ?auto_256411 ) ) ( not ( = ?auto_256408 ?auto_256412 ) ) ( not ( = ?auto_256408 ?auto_256413 ) ) ( not ( = ?auto_256408 ?auto_256414 ) ) ( not ( = ?auto_256408 ?auto_256415 ) ) ( not ( = ?auto_256408 ?auto_256416 ) ) ( not ( = ?auto_256408 ?auto_256417 ) ) ( not ( = ?auto_256408 ?auto_256418 ) ) ( not ( = ?auto_256409 ?auto_256410 ) ) ( not ( = ?auto_256409 ?auto_256411 ) ) ( not ( = ?auto_256409 ?auto_256412 ) ) ( not ( = ?auto_256409 ?auto_256413 ) ) ( not ( = ?auto_256409 ?auto_256414 ) ) ( not ( = ?auto_256409 ?auto_256415 ) ) ( not ( = ?auto_256409 ?auto_256416 ) ) ( not ( = ?auto_256409 ?auto_256417 ) ) ( not ( = ?auto_256409 ?auto_256418 ) ) ( not ( = ?auto_256410 ?auto_256411 ) ) ( not ( = ?auto_256410 ?auto_256412 ) ) ( not ( = ?auto_256410 ?auto_256413 ) ) ( not ( = ?auto_256410 ?auto_256414 ) ) ( not ( = ?auto_256410 ?auto_256415 ) ) ( not ( = ?auto_256410 ?auto_256416 ) ) ( not ( = ?auto_256410 ?auto_256417 ) ) ( not ( = ?auto_256410 ?auto_256418 ) ) ( not ( = ?auto_256411 ?auto_256412 ) ) ( not ( = ?auto_256411 ?auto_256413 ) ) ( not ( = ?auto_256411 ?auto_256414 ) ) ( not ( = ?auto_256411 ?auto_256415 ) ) ( not ( = ?auto_256411 ?auto_256416 ) ) ( not ( = ?auto_256411 ?auto_256417 ) ) ( not ( = ?auto_256411 ?auto_256418 ) ) ( not ( = ?auto_256412 ?auto_256413 ) ) ( not ( = ?auto_256412 ?auto_256414 ) ) ( not ( = ?auto_256412 ?auto_256415 ) ) ( not ( = ?auto_256412 ?auto_256416 ) ) ( not ( = ?auto_256412 ?auto_256417 ) ) ( not ( = ?auto_256412 ?auto_256418 ) ) ( not ( = ?auto_256413 ?auto_256414 ) ) ( not ( = ?auto_256413 ?auto_256415 ) ) ( not ( = ?auto_256413 ?auto_256416 ) ) ( not ( = ?auto_256413 ?auto_256417 ) ) ( not ( = ?auto_256413 ?auto_256418 ) ) ( not ( = ?auto_256414 ?auto_256415 ) ) ( not ( = ?auto_256414 ?auto_256416 ) ) ( not ( = ?auto_256414 ?auto_256417 ) ) ( not ( = ?auto_256414 ?auto_256418 ) ) ( not ( = ?auto_256415 ?auto_256416 ) ) ( not ( = ?auto_256415 ?auto_256417 ) ) ( not ( = ?auto_256415 ?auto_256418 ) ) ( not ( = ?auto_256416 ?auto_256417 ) ) ( not ( = ?auto_256416 ?auto_256418 ) ) ( not ( = ?auto_256417 ?auto_256418 ) ) ( ON ?auto_256416 ?auto_256417 ) ( ON ?auto_256415 ?auto_256416 ) ( CLEAR ?auto_256413 ) ( ON ?auto_256414 ?auto_256415 ) ( CLEAR ?auto_256414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_256406 ?auto_256407 ?auto_256408 ?auto_256409 ?auto_256410 ?auto_256411 ?auto_256412 ?auto_256413 ?auto_256414 )
      ( MAKE-12PILE ?auto_256406 ?auto_256407 ?auto_256408 ?auto_256409 ?auto_256410 ?auto_256411 ?auto_256412 ?auto_256413 ?auto_256414 ?auto_256415 ?auto_256416 ?auto_256417 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_256431 - BLOCK
      ?auto_256432 - BLOCK
      ?auto_256433 - BLOCK
      ?auto_256434 - BLOCK
      ?auto_256435 - BLOCK
      ?auto_256436 - BLOCK
      ?auto_256437 - BLOCK
      ?auto_256438 - BLOCK
      ?auto_256439 - BLOCK
      ?auto_256440 - BLOCK
      ?auto_256441 - BLOCK
      ?auto_256442 - BLOCK
    )
    :vars
    (
      ?auto_256443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256442 ?auto_256443 ) ( ON-TABLE ?auto_256431 ) ( ON ?auto_256432 ?auto_256431 ) ( ON ?auto_256433 ?auto_256432 ) ( ON ?auto_256434 ?auto_256433 ) ( ON ?auto_256435 ?auto_256434 ) ( ON ?auto_256436 ?auto_256435 ) ( ON ?auto_256437 ?auto_256436 ) ( ON ?auto_256438 ?auto_256437 ) ( not ( = ?auto_256431 ?auto_256432 ) ) ( not ( = ?auto_256431 ?auto_256433 ) ) ( not ( = ?auto_256431 ?auto_256434 ) ) ( not ( = ?auto_256431 ?auto_256435 ) ) ( not ( = ?auto_256431 ?auto_256436 ) ) ( not ( = ?auto_256431 ?auto_256437 ) ) ( not ( = ?auto_256431 ?auto_256438 ) ) ( not ( = ?auto_256431 ?auto_256439 ) ) ( not ( = ?auto_256431 ?auto_256440 ) ) ( not ( = ?auto_256431 ?auto_256441 ) ) ( not ( = ?auto_256431 ?auto_256442 ) ) ( not ( = ?auto_256431 ?auto_256443 ) ) ( not ( = ?auto_256432 ?auto_256433 ) ) ( not ( = ?auto_256432 ?auto_256434 ) ) ( not ( = ?auto_256432 ?auto_256435 ) ) ( not ( = ?auto_256432 ?auto_256436 ) ) ( not ( = ?auto_256432 ?auto_256437 ) ) ( not ( = ?auto_256432 ?auto_256438 ) ) ( not ( = ?auto_256432 ?auto_256439 ) ) ( not ( = ?auto_256432 ?auto_256440 ) ) ( not ( = ?auto_256432 ?auto_256441 ) ) ( not ( = ?auto_256432 ?auto_256442 ) ) ( not ( = ?auto_256432 ?auto_256443 ) ) ( not ( = ?auto_256433 ?auto_256434 ) ) ( not ( = ?auto_256433 ?auto_256435 ) ) ( not ( = ?auto_256433 ?auto_256436 ) ) ( not ( = ?auto_256433 ?auto_256437 ) ) ( not ( = ?auto_256433 ?auto_256438 ) ) ( not ( = ?auto_256433 ?auto_256439 ) ) ( not ( = ?auto_256433 ?auto_256440 ) ) ( not ( = ?auto_256433 ?auto_256441 ) ) ( not ( = ?auto_256433 ?auto_256442 ) ) ( not ( = ?auto_256433 ?auto_256443 ) ) ( not ( = ?auto_256434 ?auto_256435 ) ) ( not ( = ?auto_256434 ?auto_256436 ) ) ( not ( = ?auto_256434 ?auto_256437 ) ) ( not ( = ?auto_256434 ?auto_256438 ) ) ( not ( = ?auto_256434 ?auto_256439 ) ) ( not ( = ?auto_256434 ?auto_256440 ) ) ( not ( = ?auto_256434 ?auto_256441 ) ) ( not ( = ?auto_256434 ?auto_256442 ) ) ( not ( = ?auto_256434 ?auto_256443 ) ) ( not ( = ?auto_256435 ?auto_256436 ) ) ( not ( = ?auto_256435 ?auto_256437 ) ) ( not ( = ?auto_256435 ?auto_256438 ) ) ( not ( = ?auto_256435 ?auto_256439 ) ) ( not ( = ?auto_256435 ?auto_256440 ) ) ( not ( = ?auto_256435 ?auto_256441 ) ) ( not ( = ?auto_256435 ?auto_256442 ) ) ( not ( = ?auto_256435 ?auto_256443 ) ) ( not ( = ?auto_256436 ?auto_256437 ) ) ( not ( = ?auto_256436 ?auto_256438 ) ) ( not ( = ?auto_256436 ?auto_256439 ) ) ( not ( = ?auto_256436 ?auto_256440 ) ) ( not ( = ?auto_256436 ?auto_256441 ) ) ( not ( = ?auto_256436 ?auto_256442 ) ) ( not ( = ?auto_256436 ?auto_256443 ) ) ( not ( = ?auto_256437 ?auto_256438 ) ) ( not ( = ?auto_256437 ?auto_256439 ) ) ( not ( = ?auto_256437 ?auto_256440 ) ) ( not ( = ?auto_256437 ?auto_256441 ) ) ( not ( = ?auto_256437 ?auto_256442 ) ) ( not ( = ?auto_256437 ?auto_256443 ) ) ( not ( = ?auto_256438 ?auto_256439 ) ) ( not ( = ?auto_256438 ?auto_256440 ) ) ( not ( = ?auto_256438 ?auto_256441 ) ) ( not ( = ?auto_256438 ?auto_256442 ) ) ( not ( = ?auto_256438 ?auto_256443 ) ) ( not ( = ?auto_256439 ?auto_256440 ) ) ( not ( = ?auto_256439 ?auto_256441 ) ) ( not ( = ?auto_256439 ?auto_256442 ) ) ( not ( = ?auto_256439 ?auto_256443 ) ) ( not ( = ?auto_256440 ?auto_256441 ) ) ( not ( = ?auto_256440 ?auto_256442 ) ) ( not ( = ?auto_256440 ?auto_256443 ) ) ( not ( = ?auto_256441 ?auto_256442 ) ) ( not ( = ?auto_256441 ?auto_256443 ) ) ( not ( = ?auto_256442 ?auto_256443 ) ) ( ON ?auto_256441 ?auto_256442 ) ( ON ?auto_256440 ?auto_256441 ) ( CLEAR ?auto_256438 ) ( ON ?auto_256439 ?auto_256440 ) ( CLEAR ?auto_256439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_256431 ?auto_256432 ?auto_256433 ?auto_256434 ?auto_256435 ?auto_256436 ?auto_256437 ?auto_256438 ?auto_256439 )
      ( MAKE-12PILE ?auto_256431 ?auto_256432 ?auto_256433 ?auto_256434 ?auto_256435 ?auto_256436 ?auto_256437 ?auto_256438 ?auto_256439 ?auto_256440 ?auto_256441 ?auto_256442 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_256456 - BLOCK
      ?auto_256457 - BLOCK
      ?auto_256458 - BLOCK
      ?auto_256459 - BLOCK
      ?auto_256460 - BLOCK
      ?auto_256461 - BLOCK
      ?auto_256462 - BLOCK
      ?auto_256463 - BLOCK
      ?auto_256464 - BLOCK
      ?auto_256465 - BLOCK
      ?auto_256466 - BLOCK
      ?auto_256467 - BLOCK
    )
    :vars
    (
      ?auto_256468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256467 ?auto_256468 ) ( ON-TABLE ?auto_256456 ) ( ON ?auto_256457 ?auto_256456 ) ( ON ?auto_256458 ?auto_256457 ) ( ON ?auto_256459 ?auto_256458 ) ( ON ?auto_256460 ?auto_256459 ) ( ON ?auto_256461 ?auto_256460 ) ( ON ?auto_256462 ?auto_256461 ) ( not ( = ?auto_256456 ?auto_256457 ) ) ( not ( = ?auto_256456 ?auto_256458 ) ) ( not ( = ?auto_256456 ?auto_256459 ) ) ( not ( = ?auto_256456 ?auto_256460 ) ) ( not ( = ?auto_256456 ?auto_256461 ) ) ( not ( = ?auto_256456 ?auto_256462 ) ) ( not ( = ?auto_256456 ?auto_256463 ) ) ( not ( = ?auto_256456 ?auto_256464 ) ) ( not ( = ?auto_256456 ?auto_256465 ) ) ( not ( = ?auto_256456 ?auto_256466 ) ) ( not ( = ?auto_256456 ?auto_256467 ) ) ( not ( = ?auto_256456 ?auto_256468 ) ) ( not ( = ?auto_256457 ?auto_256458 ) ) ( not ( = ?auto_256457 ?auto_256459 ) ) ( not ( = ?auto_256457 ?auto_256460 ) ) ( not ( = ?auto_256457 ?auto_256461 ) ) ( not ( = ?auto_256457 ?auto_256462 ) ) ( not ( = ?auto_256457 ?auto_256463 ) ) ( not ( = ?auto_256457 ?auto_256464 ) ) ( not ( = ?auto_256457 ?auto_256465 ) ) ( not ( = ?auto_256457 ?auto_256466 ) ) ( not ( = ?auto_256457 ?auto_256467 ) ) ( not ( = ?auto_256457 ?auto_256468 ) ) ( not ( = ?auto_256458 ?auto_256459 ) ) ( not ( = ?auto_256458 ?auto_256460 ) ) ( not ( = ?auto_256458 ?auto_256461 ) ) ( not ( = ?auto_256458 ?auto_256462 ) ) ( not ( = ?auto_256458 ?auto_256463 ) ) ( not ( = ?auto_256458 ?auto_256464 ) ) ( not ( = ?auto_256458 ?auto_256465 ) ) ( not ( = ?auto_256458 ?auto_256466 ) ) ( not ( = ?auto_256458 ?auto_256467 ) ) ( not ( = ?auto_256458 ?auto_256468 ) ) ( not ( = ?auto_256459 ?auto_256460 ) ) ( not ( = ?auto_256459 ?auto_256461 ) ) ( not ( = ?auto_256459 ?auto_256462 ) ) ( not ( = ?auto_256459 ?auto_256463 ) ) ( not ( = ?auto_256459 ?auto_256464 ) ) ( not ( = ?auto_256459 ?auto_256465 ) ) ( not ( = ?auto_256459 ?auto_256466 ) ) ( not ( = ?auto_256459 ?auto_256467 ) ) ( not ( = ?auto_256459 ?auto_256468 ) ) ( not ( = ?auto_256460 ?auto_256461 ) ) ( not ( = ?auto_256460 ?auto_256462 ) ) ( not ( = ?auto_256460 ?auto_256463 ) ) ( not ( = ?auto_256460 ?auto_256464 ) ) ( not ( = ?auto_256460 ?auto_256465 ) ) ( not ( = ?auto_256460 ?auto_256466 ) ) ( not ( = ?auto_256460 ?auto_256467 ) ) ( not ( = ?auto_256460 ?auto_256468 ) ) ( not ( = ?auto_256461 ?auto_256462 ) ) ( not ( = ?auto_256461 ?auto_256463 ) ) ( not ( = ?auto_256461 ?auto_256464 ) ) ( not ( = ?auto_256461 ?auto_256465 ) ) ( not ( = ?auto_256461 ?auto_256466 ) ) ( not ( = ?auto_256461 ?auto_256467 ) ) ( not ( = ?auto_256461 ?auto_256468 ) ) ( not ( = ?auto_256462 ?auto_256463 ) ) ( not ( = ?auto_256462 ?auto_256464 ) ) ( not ( = ?auto_256462 ?auto_256465 ) ) ( not ( = ?auto_256462 ?auto_256466 ) ) ( not ( = ?auto_256462 ?auto_256467 ) ) ( not ( = ?auto_256462 ?auto_256468 ) ) ( not ( = ?auto_256463 ?auto_256464 ) ) ( not ( = ?auto_256463 ?auto_256465 ) ) ( not ( = ?auto_256463 ?auto_256466 ) ) ( not ( = ?auto_256463 ?auto_256467 ) ) ( not ( = ?auto_256463 ?auto_256468 ) ) ( not ( = ?auto_256464 ?auto_256465 ) ) ( not ( = ?auto_256464 ?auto_256466 ) ) ( not ( = ?auto_256464 ?auto_256467 ) ) ( not ( = ?auto_256464 ?auto_256468 ) ) ( not ( = ?auto_256465 ?auto_256466 ) ) ( not ( = ?auto_256465 ?auto_256467 ) ) ( not ( = ?auto_256465 ?auto_256468 ) ) ( not ( = ?auto_256466 ?auto_256467 ) ) ( not ( = ?auto_256466 ?auto_256468 ) ) ( not ( = ?auto_256467 ?auto_256468 ) ) ( ON ?auto_256466 ?auto_256467 ) ( ON ?auto_256465 ?auto_256466 ) ( ON ?auto_256464 ?auto_256465 ) ( CLEAR ?auto_256462 ) ( ON ?auto_256463 ?auto_256464 ) ( CLEAR ?auto_256463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_256456 ?auto_256457 ?auto_256458 ?auto_256459 ?auto_256460 ?auto_256461 ?auto_256462 ?auto_256463 )
      ( MAKE-12PILE ?auto_256456 ?auto_256457 ?auto_256458 ?auto_256459 ?auto_256460 ?auto_256461 ?auto_256462 ?auto_256463 ?auto_256464 ?auto_256465 ?auto_256466 ?auto_256467 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_256481 - BLOCK
      ?auto_256482 - BLOCK
      ?auto_256483 - BLOCK
      ?auto_256484 - BLOCK
      ?auto_256485 - BLOCK
      ?auto_256486 - BLOCK
      ?auto_256487 - BLOCK
      ?auto_256488 - BLOCK
      ?auto_256489 - BLOCK
      ?auto_256490 - BLOCK
      ?auto_256491 - BLOCK
      ?auto_256492 - BLOCK
    )
    :vars
    (
      ?auto_256493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256492 ?auto_256493 ) ( ON-TABLE ?auto_256481 ) ( ON ?auto_256482 ?auto_256481 ) ( ON ?auto_256483 ?auto_256482 ) ( ON ?auto_256484 ?auto_256483 ) ( ON ?auto_256485 ?auto_256484 ) ( ON ?auto_256486 ?auto_256485 ) ( ON ?auto_256487 ?auto_256486 ) ( not ( = ?auto_256481 ?auto_256482 ) ) ( not ( = ?auto_256481 ?auto_256483 ) ) ( not ( = ?auto_256481 ?auto_256484 ) ) ( not ( = ?auto_256481 ?auto_256485 ) ) ( not ( = ?auto_256481 ?auto_256486 ) ) ( not ( = ?auto_256481 ?auto_256487 ) ) ( not ( = ?auto_256481 ?auto_256488 ) ) ( not ( = ?auto_256481 ?auto_256489 ) ) ( not ( = ?auto_256481 ?auto_256490 ) ) ( not ( = ?auto_256481 ?auto_256491 ) ) ( not ( = ?auto_256481 ?auto_256492 ) ) ( not ( = ?auto_256481 ?auto_256493 ) ) ( not ( = ?auto_256482 ?auto_256483 ) ) ( not ( = ?auto_256482 ?auto_256484 ) ) ( not ( = ?auto_256482 ?auto_256485 ) ) ( not ( = ?auto_256482 ?auto_256486 ) ) ( not ( = ?auto_256482 ?auto_256487 ) ) ( not ( = ?auto_256482 ?auto_256488 ) ) ( not ( = ?auto_256482 ?auto_256489 ) ) ( not ( = ?auto_256482 ?auto_256490 ) ) ( not ( = ?auto_256482 ?auto_256491 ) ) ( not ( = ?auto_256482 ?auto_256492 ) ) ( not ( = ?auto_256482 ?auto_256493 ) ) ( not ( = ?auto_256483 ?auto_256484 ) ) ( not ( = ?auto_256483 ?auto_256485 ) ) ( not ( = ?auto_256483 ?auto_256486 ) ) ( not ( = ?auto_256483 ?auto_256487 ) ) ( not ( = ?auto_256483 ?auto_256488 ) ) ( not ( = ?auto_256483 ?auto_256489 ) ) ( not ( = ?auto_256483 ?auto_256490 ) ) ( not ( = ?auto_256483 ?auto_256491 ) ) ( not ( = ?auto_256483 ?auto_256492 ) ) ( not ( = ?auto_256483 ?auto_256493 ) ) ( not ( = ?auto_256484 ?auto_256485 ) ) ( not ( = ?auto_256484 ?auto_256486 ) ) ( not ( = ?auto_256484 ?auto_256487 ) ) ( not ( = ?auto_256484 ?auto_256488 ) ) ( not ( = ?auto_256484 ?auto_256489 ) ) ( not ( = ?auto_256484 ?auto_256490 ) ) ( not ( = ?auto_256484 ?auto_256491 ) ) ( not ( = ?auto_256484 ?auto_256492 ) ) ( not ( = ?auto_256484 ?auto_256493 ) ) ( not ( = ?auto_256485 ?auto_256486 ) ) ( not ( = ?auto_256485 ?auto_256487 ) ) ( not ( = ?auto_256485 ?auto_256488 ) ) ( not ( = ?auto_256485 ?auto_256489 ) ) ( not ( = ?auto_256485 ?auto_256490 ) ) ( not ( = ?auto_256485 ?auto_256491 ) ) ( not ( = ?auto_256485 ?auto_256492 ) ) ( not ( = ?auto_256485 ?auto_256493 ) ) ( not ( = ?auto_256486 ?auto_256487 ) ) ( not ( = ?auto_256486 ?auto_256488 ) ) ( not ( = ?auto_256486 ?auto_256489 ) ) ( not ( = ?auto_256486 ?auto_256490 ) ) ( not ( = ?auto_256486 ?auto_256491 ) ) ( not ( = ?auto_256486 ?auto_256492 ) ) ( not ( = ?auto_256486 ?auto_256493 ) ) ( not ( = ?auto_256487 ?auto_256488 ) ) ( not ( = ?auto_256487 ?auto_256489 ) ) ( not ( = ?auto_256487 ?auto_256490 ) ) ( not ( = ?auto_256487 ?auto_256491 ) ) ( not ( = ?auto_256487 ?auto_256492 ) ) ( not ( = ?auto_256487 ?auto_256493 ) ) ( not ( = ?auto_256488 ?auto_256489 ) ) ( not ( = ?auto_256488 ?auto_256490 ) ) ( not ( = ?auto_256488 ?auto_256491 ) ) ( not ( = ?auto_256488 ?auto_256492 ) ) ( not ( = ?auto_256488 ?auto_256493 ) ) ( not ( = ?auto_256489 ?auto_256490 ) ) ( not ( = ?auto_256489 ?auto_256491 ) ) ( not ( = ?auto_256489 ?auto_256492 ) ) ( not ( = ?auto_256489 ?auto_256493 ) ) ( not ( = ?auto_256490 ?auto_256491 ) ) ( not ( = ?auto_256490 ?auto_256492 ) ) ( not ( = ?auto_256490 ?auto_256493 ) ) ( not ( = ?auto_256491 ?auto_256492 ) ) ( not ( = ?auto_256491 ?auto_256493 ) ) ( not ( = ?auto_256492 ?auto_256493 ) ) ( ON ?auto_256491 ?auto_256492 ) ( ON ?auto_256490 ?auto_256491 ) ( ON ?auto_256489 ?auto_256490 ) ( CLEAR ?auto_256487 ) ( ON ?auto_256488 ?auto_256489 ) ( CLEAR ?auto_256488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_256481 ?auto_256482 ?auto_256483 ?auto_256484 ?auto_256485 ?auto_256486 ?auto_256487 ?auto_256488 )
      ( MAKE-12PILE ?auto_256481 ?auto_256482 ?auto_256483 ?auto_256484 ?auto_256485 ?auto_256486 ?auto_256487 ?auto_256488 ?auto_256489 ?auto_256490 ?auto_256491 ?auto_256492 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_256506 - BLOCK
      ?auto_256507 - BLOCK
      ?auto_256508 - BLOCK
      ?auto_256509 - BLOCK
      ?auto_256510 - BLOCK
      ?auto_256511 - BLOCK
      ?auto_256512 - BLOCK
      ?auto_256513 - BLOCK
      ?auto_256514 - BLOCK
      ?auto_256515 - BLOCK
      ?auto_256516 - BLOCK
      ?auto_256517 - BLOCK
    )
    :vars
    (
      ?auto_256518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256517 ?auto_256518 ) ( ON-TABLE ?auto_256506 ) ( ON ?auto_256507 ?auto_256506 ) ( ON ?auto_256508 ?auto_256507 ) ( ON ?auto_256509 ?auto_256508 ) ( ON ?auto_256510 ?auto_256509 ) ( ON ?auto_256511 ?auto_256510 ) ( not ( = ?auto_256506 ?auto_256507 ) ) ( not ( = ?auto_256506 ?auto_256508 ) ) ( not ( = ?auto_256506 ?auto_256509 ) ) ( not ( = ?auto_256506 ?auto_256510 ) ) ( not ( = ?auto_256506 ?auto_256511 ) ) ( not ( = ?auto_256506 ?auto_256512 ) ) ( not ( = ?auto_256506 ?auto_256513 ) ) ( not ( = ?auto_256506 ?auto_256514 ) ) ( not ( = ?auto_256506 ?auto_256515 ) ) ( not ( = ?auto_256506 ?auto_256516 ) ) ( not ( = ?auto_256506 ?auto_256517 ) ) ( not ( = ?auto_256506 ?auto_256518 ) ) ( not ( = ?auto_256507 ?auto_256508 ) ) ( not ( = ?auto_256507 ?auto_256509 ) ) ( not ( = ?auto_256507 ?auto_256510 ) ) ( not ( = ?auto_256507 ?auto_256511 ) ) ( not ( = ?auto_256507 ?auto_256512 ) ) ( not ( = ?auto_256507 ?auto_256513 ) ) ( not ( = ?auto_256507 ?auto_256514 ) ) ( not ( = ?auto_256507 ?auto_256515 ) ) ( not ( = ?auto_256507 ?auto_256516 ) ) ( not ( = ?auto_256507 ?auto_256517 ) ) ( not ( = ?auto_256507 ?auto_256518 ) ) ( not ( = ?auto_256508 ?auto_256509 ) ) ( not ( = ?auto_256508 ?auto_256510 ) ) ( not ( = ?auto_256508 ?auto_256511 ) ) ( not ( = ?auto_256508 ?auto_256512 ) ) ( not ( = ?auto_256508 ?auto_256513 ) ) ( not ( = ?auto_256508 ?auto_256514 ) ) ( not ( = ?auto_256508 ?auto_256515 ) ) ( not ( = ?auto_256508 ?auto_256516 ) ) ( not ( = ?auto_256508 ?auto_256517 ) ) ( not ( = ?auto_256508 ?auto_256518 ) ) ( not ( = ?auto_256509 ?auto_256510 ) ) ( not ( = ?auto_256509 ?auto_256511 ) ) ( not ( = ?auto_256509 ?auto_256512 ) ) ( not ( = ?auto_256509 ?auto_256513 ) ) ( not ( = ?auto_256509 ?auto_256514 ) ) ( not ( = ?auto_256509 ?auto_256515 ) ) ( not ( = ?auto_256509 ?auto_256516 ) ) ( not ( = ?auto_256509 ?auto_256517 ) ) ( not ( = ?auto_256509 ?auto_256518 ) ) ( not ( = ?auto_256510 ?auto_256511 ) ) ( not ( = ?auto_256510 ?auto_256512 ) ) ( not ( = ?auto_256510 ?auto_256513 ) ) ( not ( = ?auto_256510 ?auto_256514 ) ) ( not ( = ?auto_256510 ?auto_256515 ) ) ( not ( = ?auto_256510 ?auto_256516 ) ) ( not ( = ?auto_256510 ?auto_256517 ) ) ( not ( = ?auto_256510 ?auto_256518 ) ) ( not ( = ?auto_256511 ?auto_256512 ) ) ( not ( = ?auto_256511 ?auto_256513 ) ) ( not ( = ?auto_256511 ?auto_256514 ) ) ( not ( = ?auto_256511 ?auto_256515 ) ) ( not ( = ?auto_256511 ?auto_256516 ) ) ( not ( = ?auto_256511 ?auto_256517 ) ) ( not ( = ?auto_256511 ?auto_256518 ) ) ( not ( = ?auto_256512 ?auto_256513 ) ) ( not ( = ?auto_256512 ?auto_256514 ) ) ( not ( = ?auto_256512 ?auto_256515 ) ) ( not ( = ?auto_256512 ?auto_256516 ) ) ( not ( = ?auto_256512 ?auto_256517 ) ) ( not ( = ?auto_256512 ?auto_256518 ) ) ( not ( = ?auto_256513 ?auto_256514 ) ) ( not ( = ?auto_256513 ?auto_256515 ) ) ( not ( = ?auto_256513 ?auto_256516 ) ) ( not ( = ?auto_256513 ?auto_256517 ) ) ( not ( = ?auto_256513 ?auto_256518 ) ) ( not ( = ?auto_256514 ?auto_256515 ) ) ( not ( = ?auto_256514 ?auto_256516 ) ) ( not ( = ?auto_256514 ?auto_256517 ) ) ( not ( = ?auto_256514 ?auto_256518 ) ) ( not ( = ?auto_256515 ?auto_256516 ) ) ( not ( = ?auto_256515 ?auto_256517 ) ) ( not ( = ?auto_256515 ?auto_256518 ) ) ( not ( = ?auto_256516 ?auto_256517 ) ) ( not ( = ?auto_256516 ?auto_256518 ) ) ( not ( = ?auto_256517 ?auto_256518 ) ) ( ON ?auto_256516 ?auto_256517 ) ( ON ?auto_256515 ?auto_256516 ) ( ON ?auto_256514 ?auto_256515 ) ( ON ?auto_256513 ?auto_256514 ) ( CLEAR ?auto_256511 ) ( ON ?auto_256512 ?auto_256513 ) ( CLEAR ?auto_256512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_256506 ?auto_256507 ?auto_256508 ?auto_256509 ?auto_256510 ?auto_256511 ?auto_256512 )
      ( MAKE-12PILE ?auto_256506 ?auto_256507 ?auto_256508 ?auto_256509 ?auto_256510 ?auto_256511 ?auto_256512 ?auto_256513 ?auto_256514 ?auto_256515 ?auto_256516 ?auto_256517 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_256531 - BLOCK
      ?auto_256532 - BLOCK
      ?auto_256533 - BLOCK
      ?auto_256534 - BLOCK
      ?auto_256535 - BLOCK
      ?auto_256536 - BLOCK
      ?auto_256537 - BLOCK
      ?auto_256538 - BLOCK
      ?auto_256539 - BLOCK
      ?auto_256540 - BLOCK
      ?auto_256541 - BLOCK
      ?auto_256542 - BLOCK
    )
    :vars
    (
      ?auto_256543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256542 ?auto_256543 ) ( ON-TABLE ?auto_256531 ) ( ON ?auto_256532 ?auto_256531 ) ( ON ?auto_256533 ?auto_256532 ) ( ON ?auto_256534 ?auto_256533 ) ( ON ?auto_256535 ?auto_256534 ) ( ON ?auto_256536 ?auto_256535 ) ( not ( = ?auto_256531 ?auto_256532 ) ) ( not ( = ?auto_256531 ?auto_256533 ) ) ( not ( = ?auto_256531 ?auto_256534 ) ) ( not ( = ?auto_256531 ?auto_256535 ) ) ( not ( = ?auto_256531 ?auto_256536 ) ) ( not ( = ?auto_256531 ?auto_256537 ) ) ( not ( = ?auto_256531 ?auto_256538 ) ) ( not ( = ?auto_256531 ?auto_256539 ) ) ( not ( = ?auto_256531 ?auto_256540 ) ) ( not ( = ?auto_256531 ?auto_256541 ) ) ( not ( = ?auto_256531 ?auto_256542 ) ) ( not ( = ?auto_256531 ?auto_256543 ) ) ( not ( = ?auto_256532 ?auto_256533 ) ) ( not ( = ?auto_256532 ?auto_256534 ) ) ( not ( = ?auto_256532 ?auto_256535 ) ) ( not ( = ?auto_256532 ?auto_256536 ) ) ( not ( = ?auto_256532 ?auto_256537 ) ) ( not ( = ?auto_256532 ?auto_256538 ) ) ( not ( = ?auto_256532 ?auto_256539 ) ) ( not ( = ?auto_256532 ?auto_256540 ) ) ( not ( = ?auto_256532 ?auto_256541 ) ) ( not ( = ?auto_256532 ?auto_256542 ) ) ( not ( = ?auto_256532 ?auto_256543 ) ) ( not ( = ?auto_256533 ?auto_256534 ) ) ( not ( = ?auto_256533 ?auto_256535 ) ) ( not ( = ?auto_256533 ?auto_256536 ) ) ( not ( = ?auto_256533 ?auto_256537 ) ) ( not ( = ?auto_256533 ?auto_256538 ) ) ( not ( = ?auto_256533 ?auto_256539 ) ) ( not ( = ?auto_256533 ?auto_256540 ) ) ( not ( = ?auto_256533 ?auto_256541 ) ) ( not ( = ?auto_256533 ?auto_256542 ) ) ( not ( = ?auto_256533 ?auto_256543 ) ) ( not ( = ?auto_256534 ?auto_256535 ) ) ( not ( = ?auto_256534 ?auto_256536 ) ) ( not ( = ?auto_256534 ?auto_256537 ) ) ( not ( = ?auto_256534 ?auto_256538 ) ) ( not ( = ?auto_256534 ?auto_256539 ) ) ( not ( = ?auto_256534 ?auto_256540 ) ) ( not ( = ?auto_256534 ?auto_256541 ) ) ( not ( = ?auto_256534 ?auto_256542 ) ) ( not ( = ?auto_256534 ?auto_256543 ) ) ( not ( = ?auto_256535 ?auto_256536 ) ) ( not ( = ?auto_256535 ?auto_256537 ) ) ( not ( = ?auto_256535 ?auto_256538 ) ) ( not ( = ?auto_256535 ?auto_256539 ) ) ( not ( = ?auto_256535 ?auto_256540 ) ) ( not ( = ?auto_256535 ?auto_256541 ) ) ( not ( = ?auto_256535 ?auto_256542 ) ) ( not ( = ?auto_256535 ?auto_256543 ) ) ( not ( = ?auto_256536 ?auto_256537 ) ) ( not ( = ?auto_256536 ?auto_256538 ) ) ( not ( = ?auto_256536 ?auto_256539 ) ) ( not ( = ?auto_256536 ?auto_256540 ) ) ( not ( = ?auto_256536 ?auto_256541 ) ) ( not ( = ?auto_256536 ?auto_256542 ) ) ( not ( = ?auto_256536 ?auto_256543 ) ) ( not ( = ?auto_256537 ?auto_256538 ) ) ( not ( = ?auto_256537 ?auto_256539 ) ) ( not ( = ?auto_256537 ?auto_256540 ) ) ( not ( = ?auto_256537 ?auto_256541 ) ) ( not ( = ?auto_256537 ?auto_256542 ) ) ( not ( = ?auto_256537 ?auto_256543 ) ) ( not ( = ?auto_256538 ?auto_256539 ) ) ( not ( = ?auto_256538 ?auto_256540 ) ) ( not ( = ?auto_256538 ?auto_256541 ) ) ( not ( = ?auto_256538 ?auto_256542 ) ) ( not ( = ?auto_256538 ?auto_256543 ) ) ( not ( = ?auto_256539 ?auto_256540 ) ) ( not ( = ?auto_256539 ?auto_256541 ) ) ( not ( = ?auto_256539 ?auto_256542 ) ) ( not ( = ?auto_256539 ?auto_256543 ) ) ( not ( = ?auto_256540 ?auto_256541 ) ) ( not ( = ?auto_256540 ?auto_256542 ) ) ( not ( = ?auto_256540 ?auto_256543 ) ) ( not ( = ?auto_256541 ?auto_256542 ) ) ( not ( = ?auto_256541 ?auto_256543 ) ) ( not ( = ?auto_256542 ?auto_256543 ) ) ( ON ?auto_256541 ?auto_256542 ) ( ON ?auto_256540 ?auto_256541 ) ( ON ?auto_256539 ?auto_256540 ) ( ON ?auto_256538 ?auto_256539 ) ( CLEAR ?auto_256536 ) ( ON ?auto_256537 ?auto_256538 ) ( CLEAR ?auto_256537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_256531 ?auto_256532 ?auto_256533 ?auto_256534 ?auto_256535 ?auto_256536 ?auto_256537 )
      ( MAKE-12PILE ?auto_256531 ?auto_256532 ?auto_256533 ?auto_256534 ?auto_256535 ?auto_256536 ?auto_256537 ?auto_256538 ?auto_256539 ?auto_256540 ?auto_256541 ?auto_256542 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_256556 - BLOCK
      ?auto_256557 - BLOCK
      ?auto_256558 - BLOCK
      ?auto_256559 - BLOCK
      ?auto_256560 - BLOCK
      ?auto_256561 - BLOCK
      ?auto_256562 - BLOCK
      ?auto_256563 - BLOCK
      ?auto_256564 - BLOCK
      ?auto_256565 - BLOCK
      ?auto_256566 - BLOCK
      ?auto_256567 - BLOCK
    )
    :vars
    (
      ?auto_256568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256567 ?auto_256568 ) ( ON-TABLE ?auto_256556 ) ( ON ?auto_256557 ?auto_256556 ) ( ON ?auto_256558 ?auto_256557 ) ( ON ?auto_256559 ?auto_256558 ) ( ON ?auto_256560 ?auto_256559 ) ( not ( = ?auto_256556 ?auto_256557 ) ) ( not ( = ?auto_256556 ?auto_256558 ) ) ( not ( = ?auto_256556 ?auto_256559 ) ) ( not ( = ?auto_256556 ?auto_256560 ) ) ( not ( = ?auto_256556 ?auto_256561 ) ) ( not ( = ?auto_256556 ?auto_256562 ) ) ( not ( = ?auto_256556 ?auto_256563 ) ) ( not ( = ?auto_256556 ?auto_256564 ) ) ( not ( = ?auto_256556 ?auto_256565 ) ) ( not ( = ?auto_256556 ?auto_256566 ) ) ( not ( = ?auto_256556 ?auto_256567 ) ) ( not ( = ?auto_256556 ?auto_256568 ) ) ( not ( = ?auto_256557 ?auto_256558 ) ) ( not ( = ?auto_256557 ?auto_256559 ) ) ( not ( = ?auto_256557 ?auto_256560 ) ) ( not ( = ?auto_256557 ?auto_256561 ) ) ( not ( = ?auto_256557 ?auto_256562 ) ) ( not ( = ?auto_256557 ?auto_256563 ) ) ( not ( = ?auto_256557 ?auto_256564 ) ) ( not ( = ?auto_256557 ?auto_256565 ) ) ( not ( = ?auto_256557 ?auto_256566 ) ) ( not ( = ?auto_256557 ?auto_256567 ) ) ( not ( = ?auto_256557 ?auto_256568 ) ) ( not ( = ?auto_256558 ?auto_256559 ) ) ( not ( = ?auto_256558 ?auto_256560 ) ) ( not ( = ?auto_256558 ?auto_256561 ) ) ( not ( = ?auto_256558 ?auto_256562 ) ) ( not ( = ?auto_256558 ?auto_256563 ) ) ( not ( = ?auto_256558 ?auto_256564 ) ) ( not ( = ?auto_256558 ?auto_256565 ) ) ( not ( = ?auto_256558 ?auto_256566 ) ) ( not ( = ?auto_256558 ?auto_256567 ) ) ( not ( = ?auto_256558 ?auto_256568 ) ) ( not ( = ?auto_256559 ?auto_256560 ) ) ( not ( = ?auto_256559 ?auto_256561 ) ) ( not ( = ?auto_256559 ?auto_256562 ) ) ( not ( = ?auto_256559 ?auto_256563 ) ) ( not ( = ?auto_256559 ?auto_256564 ) ) ( not ( = ?auto_256559 ?auto_256565 ) ) ( not ( = ?auto_256559 ?auto_256566 ) ) ( not ( = ?auto_256559 ?auto_256567 ) ) ( not ( = ?auto_256559 ?auto_256568 ) ) ( not ( = ?auto_256560 ?auto_256561 ) ) ( not ( = ?auto_256560 ?auto_256562 ) ) ( not ( = ?auto_256560 ?auto_256563 ) ) ( not ( = ?auto_256560 ?auto_256564 ) ) ( not ( = ?auto_256560 ?auto_256565 ) ) ( not ( = ?auto_256560 ?auto_256566 ) ) ( not ( = ?auto_256560 ?auto_256567 ) ) ( not ( = ?auto_256560 ?auto_256568 ) ) ( not ( = ?auto_256561 ?auto_256562 ) ) ( not ( = ?auto_256561 ?auto_256563 ) ) ( not ( = ?auto_256561 ?auto_256564 ) ) ( not ( = ?auto_256561 ?auto_256565 ) ) ( not ( = ?auto_256561 ?auto_256566 ) ) ( not ( = ?auto_256561 ?auto_256567 ) ) ( not ( = ?auto_256561 ?auto_256568 ) ) ( not ( = ?auto_256562 ?auto_256563 ) ) ( not ( = ?auto_256562 ?auto_256564 ) ) ( not ( = ?auto_256562 ?auto_256565 ) ) ( not ( = ?auto_256562 ?auto_256566 ) ) ( not ( = ?auto_256562 ?auto_256567 ) ) ( not ( = ?auto_256562 ?auto_256568 ) ) ( not ( = ?auto_256563 ?auto_256564 ) ) ( not ( = ?auto_256563 ?auto_256565 ) ) ( not ( = ?auto_256563 ?auto_256566 ) ) ( not ( = ?auto_256563 ?auto_256567 ) ) ( not ( = ?auto_256563 ?auto_256568 ) ) ( not ( = ?auto_256564 ?auto_256565 ) ) ( not ( = ?auto_256564 ?auto_256566 ) ) ( not ( = ?auto_256564 ?auto_256567 ) ) ( not ( = ?auto_256564 ?auto_256568 ) ) ( not ( = ?auto_256565 ?auto_256566 ) ) ( not ( = ?auto_256565 ?auto_256567 ) ) ( not ( = ?auto_256565 ?auto_256568 ) ) ( not ( = ?auto_256566 ?auto_256567 ) ) ( not ( = ?auto_256566 ?auto_256568 ) ) ( not ( = ?auto_256567 ?auto_256568 ) ) ( ON ?auto_256566 ?auto_256567 ) ( ON ?auto_256565 ?auto_256566 ) ( ON ?auto_256564 ?auto_256565 ) ( ON ?auto_256563 ?auto_256564 ) ( ON ?auto_256562 ?auto_256563 ) ( CLEAR ?auto_256560 ) ( ON ?auto_256561 ?auto_256562 ) ( CLEAR ?auto_256561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_256556 ?auto_256557 ?auto_256558 ?auto_256559 ?auto_256560 ?auto_256561 )
      ( MAKE-12PILE ?auto_256556 ?auto_256557 ?auto_256558 ?auto_256559 ?auto_256560 ?auto_256561 ?auto_256562 ?auto_256563 ?auto_256564 ?auto_256565 ?auto_256566 ?auto_256567 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_256581 - BLOCK
      ?auto_256582 - BLOCK
      ?auto_256583 - BLOCK
      ?auto_256584 - BLOCK
      ?auto_256585 - BLOCK
      ?auto_256586 - BLOCK
      ?auto_256587 - BLOCK
      ?auto_256588 - BLOCK
      ?auto_256589 - BLOCK
      ?auto_256590 - BLOCK
      ?auto_256591 - BLOCK
      ?auto_256592 - BLOCK
    )
    :vars
    (
      ?auto_256593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256592 ?auto_256593 ) ( ON-TABLE ?auto_256581 ) ( ON ?auto_256582 ?auto_256581 ) ( ON ?auto_256583 ?auto_256582 ) ( ON ?auto_256584 ?auto_256583 ) ( ON ?auto_256585 ?auto_256584 ) ( not ( = ?auto_256581 ?auto_256582 ) ) ( not ( = ?auto_256581 ?auto_256583 ) ) ( not ( = ?auto_256581 ?auto_256584 ) ) ( not ( = ?auto_256581 ?auto_256585 ) ) ( not ( = ?auto_256581 ?auto_256586 ) ) ( not ( = ?auto_256581 ?auto_256587 ) ) ( not ( = ?auto_256581 ?auto_256588 ) ) ( not ( = ?auto_256581 ?auto_256589 ) ) ( not ( = ?auto_256581 ?auto_256590 ) ) ( not ( = ?auto_256581 ?auto_256591 ) ) ( not ( = ?auto_256581 ?auto_256592 ) ) ( not ( = ?auto_256581 ?auto_256593 ) ) ( not ( = ?auto_256582 ?auto_256583 ) ) ( not ( = ?auto_256582 ?auto_256584 ) ) ( not ( = ?auto_256582 ?auto_256585 ) ) ( not ( = ?auto_256582 ?auto_256586 ) ) ( not ( = ?auto_256582 ?auto_256587 ) ) ( not ( = ?auto_256582 ?auto_256588 ) ) ( not ( = ?auto_256582 ?auto_256589 ) ) ( not ( = ?auto_256582 ?auto_256590 ) ) ( not ( = ?auto_256582 ?auto_256591 ) ) ( not ( = ?auto_256582 ?auto_256592 ) ) ( not ( = ?auto_256582 ?auto_256593 ) ) ( not ( = ?auto_256583 ?auto_256584 ) ) ( not ( = ?auto_256583 ?auto_256585 ) ) ( not ( = ?auto_256583 ?auto_256586 ) ) ( not ( = ?auto_256583 ?auto_256587 ) ) ( not ( = ?auto_256583 ?auto_256588 ) ) ( not ( = ?auto_256583 ?auto_256589 ) ) ( not ( = ?auto_256583 ?auto_256590 ) ) ( not ( = ?auto_256583 ?auto_256591 ) ) ( not ( = ?auto_256583 ?auto_256592 ) ) ( not ( = ?auto_256583 ?auto_256593 ) ) ( not ( = ?auto_256584 ?auto_256585 ) ) ( not ( = ?auto_256584 ?auto_256586 ) ) ( not ( = ?auto_256584 ?auto_256587 ) ) ( not ( = ?auto_256584 ?auto_256588 ) ) ( not ( = ?auto_256584 ?auto_256589 ) ) ( not ( = ?auto_256584 ?auto_256590 ) ) ( not ( = ?auto_256584 ?auto_256591 ) ) ( not ( = ?auto_256584 ?auto_256592 ) ) ( not ( = ?auto_256584 ?auto_256593 ) ) ( not ( = ?auto_256585 ?auto_256586 ) ) ( not ( = ?auto_256585 ?auto_256587 ) ) ( not ( = ?auto_256585 ?auto_256588 ) ) ( not ( = ?auto_256585 ?auto_256589 ) ) ( not ( = ?auto_256585 ?auto_256590 ) ) ( not ( = ?auto_256585 ?auto_256591 ) ) ( not ( = ?auto_256585 ?auto_256592 ) ) ( not ( = ?auto_256585 ?auto_256593 ) ) ( not ( = ?auto_256586 ?auto_256587 ) ) ( not ( = ?auto_256586 ?auto_256588 ) ) ( not ( = ?auto_256586 ?auto_256589 ) ) ( not ( = ?auto_256586 ?auto_256590 ) ) ( not ( = ?auto_256586 ?auto_256591 ) ) ( not ( = ?auto_256586 ?auto_256592 ) ) ( not ( = ?auto_256586 ?auto_256593 ) ) ( not ( = ?auto_256587 ?auto_256588 ) ) ( not ( = ?auto_256587 ?auto_256589 ) ) ( not ( = ?auto_256587 ?auto_256590 ) ) ( not ( = ?auto_256587 ?auto_256591 ) ) ( not ( = ?auto_256587 ?auto_256592 ) ) ( not ( = ?auto_256587 ?auto_256593 ) ) ( not ( = ?auto_256588 ?auto_256589 ) ) ( not ( = ?auto_256588 ?auto_256590 ) ) ( not ( = ?auto_256588 ?auto_256591 ) ) ( not ( = ?auto_256588 ?auto_256592 ) ) ( not ( = ?auto_256588 ?auto_256593 ) ) ( not ( = ?auto_256589 ?auto_256590 ) ) ( not ( = ?auto_256589 ?auto_256591 ) ) ( not ( = ?auto_256589 ?auto_256592 ) ) ( not ( = ?auto_256589 ?auto_256593 ) ) ( not ( = ?auto_256590 ?auto_256591 ) ) ( not ( = ?auto_256590 ?auto_256592 ) ) ( not ( = ?auto_256590 ?auto_256593 ) ) ( not ( = ?auto_256591 ?auto_256592 ) ) ( not ( = ?auto_256591 ?auto_256593 ) ) ( not ( = ?auto_256592 ?auto_256593 ) ) ( ON ?auto_256591 ?auto_256592 ) ( ON ?auto_256590 ?auto_256591 ) ( ON ?auto_256589 ?auto_256590 ) ( ON ?auto_256588 ?auto_256589 ) ( ON ?auto_256587 ?auto_256588 ) ( CLEAR ?auto_256585 ) ( ON ?auto_256586 ?auto_256587 ) ( CLEAR ?auto_256586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_256581 ?auto_256582 ?auto_256583 ?auto_256584 ?auto_256585 ?auto_256586 )
      ( MAKE-12PILE ?auto_256581 ?auto_256582 ?auto_256583 ?auto_256584 ?auto_256585 ?auto_256586 ?auto_256587 ?auto_256588 ?auto_256589 ?auto_256590 ?auto_256591 ?auto_256592 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_256606 - BLOCK
      ?auto_256607 - BLOCK
      ?auto_256608 - BLOCK
      ?auto_256609 - BLOCK
      ?auto_256610 - BLOCK
      ?auto_256611 - BLOCK
      ?auto_256612 - BLOCK
      ?auto_256613 - BLOCK
      ?auto_256614 - BLOCK
      ?auto_256615 - BLOCK
      ?auto_256616 - BLOCK
      ?auto_256617 - BLOCK
    )
    :vars
    (
      ?auto_256618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256617 ?auto_256618 ) ( ON-TABLE ?auto_256606 ) ( ON ?auto_256607 ?auto_256606 ) ( ON ?auto_256608 ?auto_256607 ) ( ON ?auto_256609 ?auto_256608 ) ( not ( = ?auto_256606 ?auto_256607 ) ) ( not ( = ?auto_256606 ?auto_256608 ) ) ( not ( = ?auto_256606 ?auto_256609 ) ) ( not ( = ?auto_256606 ?auto_256610 ) ) ( not ( = ?auto_256606 ?auto_256611 ) ) ( not ( = ?auto_256606 ?auto_256612 ) ) ( not ( = ?auto_256606 ?auto_256613 ) ) ( not ( = ?auto_256606 ?auto_256614 ) ) ( not ( = ?auto_256606 ?auto_256615 ) ) ( not ( = ?auto_256606 ?auto_256616 ) ) ( not ( = ?auto_256606 ?auto_256617 ) ) ( not ( = ?auto_256606 ?auto_256618 ) ) ( not ( = ?auto_256607 ?auto_256608 ) ) ( not ( = ?auto_256607 ?auto_256609 ) ) ( not ( = ?auto_256607 ?auto_256610 ) ) ( not ( = ?auto_256607 ?auto_256611 ) ) ( not ( = ?auto_256607 ?auto_256612 ) ) ( not ( = ?auto_256607 ?auto_256613 ) ) ( not ( = ?auto_256607 ?auto_256614 ) ) ( not ( = ?auto_256607 ?auto_256615 ) ) ( not ( = ?auto_256607 ?auto_256616 ) ) ( not ( = ?auto_256607 ?auto_256617 ) ) ( not ( = ?auto_256607 ?auto_256618 ) ) ( not ( = ?auto_256608 ?auto_256609 ) ) ( not ( = ?auto_256608 ?auto_256610 ) ) ( not ( = ?auto_256608 ?auto_256611 ) ) ( not ( = ?auto_256608 ?auto_256612 ) ) ( not ( = ?auto_256608 ?auto_256613 ) ) ( not ( = ?auto_256608 ?auto_256614 ) ) ( not ( = ?auto_256608 ?auto_256615 ) ) ( not ( = ?auto_256608 ?auto_256616 ) ) ( not ( = ?auto_256608 ?auto_256617 ) ) ( not ( = ?auto_256608 ?auto_256618 ) ) ( not ( = ?auto_256609 ?auto_256610 ) ) ( not ( = ?auto_256609 ?auto_256611 ) ) ( not ( = ?auto_256609 ?auto_256612 ) ) ( not ( = ?auto_256609 ?auto_256613 ) ) ( not ( = ?auto_256609 ?auto_256614 ) ) ( not ( = ?auto_256609 ?auto_256615 ) ) ( not ( = ?auto_256609 ?auto_256616 ) ) ( not ( = ?auto_256609 ?auto_256617 ) ) ( not ( = ?auto_256609 ?auto_256618 ) ) ( not ( = ?auto_256610 ?auto_256611 ) ) ( not ( = ?auto_256610 ?auto_256612 ) ) ( not ( = ?auto_256610 ?auto_256613 ) ) ( not ( = ?auto_256610 ?auto_256614 ) ) ( not ( = ?auto_256610 ?auto_256615 ) ) ( not ( = ?auto_256610 ?auto_256616 ) ) ( not ( = ?auto_256610 ?auto_256617 ) ) ( not ( = ?auto_256610 ?auto_256618 ) ) ( not ( = ?auto_256611 ?auto_256612 ) ) ( not ( = ?auto_256611 ?auto_256613 ) ) ( not ( = ?auto_256611 ?auto_256614 ) ) ( not ( = ?auto_256611 ?auto_256615 ) ) ( not ( = ?auto_256611 ?auto_256616 ) ) ( not ( = ?auto_256611 ?auto_256617 ) ) ( not ( = ?auto_256611 ?auto_256618 ) ) ( not ( = ?auto_256612 ?auto_256613 ) ) ( not ( = ?auto_256612 ?auto_256614 ) ) ( not ( = ?auto_256612 ?auto_256615 ) ) ( not ( = ?auto_256612 ?auto_256616 ) ) ( not ( = ?auto_256612 ?auto_256617 ) ) ( not ( = ?auto_256612 ?auto_256618 ) ) ( not ( = ?auto_256613 ?auto_256614 ) ) ( not ( = ?auto_256613 ?auto_256615 ) ) ( not ( = ?auto_256613 ?auto_256616 ) ) ( not ( = ?auto_256613 ?auto_256617 ) ) ( not ( = ?auto_256613 ?auto_256618 ) ) ( not ( = ?auto_256614 ?auto_256615 ) ) ( not ( = ?auto_256614 ?auto_256616 ) ) ( not ( = ?auto_256614 ?auto_256617 ) ) ( not ( = ?auto_256614 ?auto_256618 ) ) ( not ( = ?auto_256615 ?auto_256616 ) ) ( not ( = ?auto_256615 ?auto_256617 ) ) ( not ( = ?auto_256615 ?auto_256618 ) ) ( not ( = ?auto_256616 ?auto_256617 ) ) ( not ( = ?auto_256616 ?auto_256618 ) ) ( not ( = ?auto_256617 ?auto_256618 ) ) ( ON ?auto_256616 ?auto_256617 ) ( ON ?auto_256615 ?auto_256616 ) ( ON ?auto_256614 ?auto_256615 ) ( ON ?auto_256613 ?auto_256614 ) ( ON ?auto_256612 ?auto_256613 ) ( ON ?auto_256611 ?auto_256612 ) ( CLEAR ?auto_256609 ) ( ON ?auto_256610 ?auto_256611 ) ( CLEAR ?auto_256610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_256606 ?auto_256607 ?auto_256608 ?auto_256609 ?auto_256610 )
      ( MAKE-12PILE ?auto_256606 ?auto_256607 ?auto_256608 ?auto_256609 ?auto_256610 ?auto_256611 ?auto_256612 ?auto_256613 ?auto_256614 ?auto_256615 ?auto_256616 ?auto_256617 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_256631 - BLOCK
      ?auto_256632 - BLOCK
      ?auto_256633 - BLOCK
      ?auto_256634 - BLOCK
      ?auto_256635 - BLOCK
      ?auto_256636 - BLOCK
      ?auto_256637 - BLOCK
      ?auto_256638 - BLOCK
      ?auto_256639 - BLOCK
      ?auto_256640 - BLOCK
      ?auto_256641 - BLOCK
      ?auto_256642 - BLOCK
    )
    :vars
    (
      ?auto_256643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256642 ?auto_256643 ) ( ON-TABLE ?auto_256631 ) ( ON ?auto_256632 ?auto_256631 ) ( ON ?auto_256633 ?auto_256632 ) ( ON ?auto_256634 ?auto_256633 ) ( not ( = ?auto_256631 ?auto_256632 ) ) ( not ( = ?auto_256631 ?auto_256633 ) ) ( not ( = ?auto_256631 ?auto_256634 ) ) ( not ( = ?auto_256631 ?auto_256635 ) ) ( not ( = ?auto_256631 ?auto_256636 ) ) ( not ( = ?auto_256631 ?auto_256637 ) ) ( not ( = ?auto_256631 ?auto_256638 ) ) ( not ( = ?auto_256631 ?auto_256639 ) ) ( not ( = ?auto_256631 ?auto_256640 ) ) ( not ( = ?auto_256631 ?auto_256641 ) ) ( not ( = ?auto_256631 ?auto_256642 ) ) ( not ( = ?auto_256631 ?auto_256643 ) ) ( not ( = ?auto_256632 ?auto_256633 ) ) ( not ( = ?auto_256632 ?auto_256634 ) ) ( not ( = ?auto_256632 ?auto_256635 ) ) ( not ( = ?auto_256632 ?auto_256636 ) ) ( not ( = ?auto_256632 ?auto_256637 ) ) ( not ( = ?auto_256632 ?auto_256638 ) ) ( not ( = ?auto_256632 ?auto_256639 ) ) ( not ( = ?auto_256632 ?auto_256640 ) ) ( not ( = ?auto_256632 ?auto_256641 ) ) ( not ( = ?auto_256632 ?auto_256642 ) ) ( not ( = ?auto_256632 ?auto_256643 ) ) ( not ( = ?auto_256633 ?auto_256634 ) ) ( not ( = ?auto_256633 ?auto_256635 ) ) ( not ( = ?auto_256633 ?auto_256636 ) ) ( not ( = ?auto_256633 ?auto_256637 ) ) ( not ( = ?auto_256633 ?auto_256638 ) ) ( not ( = ?auto_256633 ?auto_256639 ) ) ( not ( = ?auto_256633 ?auto_256640 ) ) ( not ( = ?auto_256633 ?auto_256641 ) ) ( not ( = ?auto_256633 ?auto_256642 ) ) ( not ( = ?auto_256633 ?auto_256643 ) ) ( not ( = ?auto_256634 ?auto_256635 ) ) ( not ( = ?auto_256634 ?auto_256636 ) ) ( not ( = ?auto_256634 ?auto_256637 ) ) ( not ( = ?auto_256634 ?auto_256638 ) ) ( not ( = ?auto_256634 ?auto_256639 ) ) ( not ( = ?auto_256634 ?auto_256640 ) ) ( not ( = ?auto_256634 ?auto_256641 ) ) ( not ( = ?auto_256634 ?auto_256642 ) ) ( not ( = ?auto_256634 ?auto_256643 ) ) ( not ( = ?auto_256635 ?auto_256636 ) ) ( not ( = ?auto_256635 ?auto_256637 ) ) ( not ( = ?auto_256635 ?auto_256638 ) ) ( not ( = ?auto_256635 ?auto_256639 ) ) ( not ( = ?auto_256635 ?auto_256640 ) ) ( not ( = ?auto_256635 ?auto_256641 ) ) ( not ( = ?auto_256635 ?auto_256642 ) ) ( not ( = ?auto_256635 ?auto_256643 ) ) ( not ( = ?auto_256636 ?auto_256637 ) ) ( not ( = ?auto_256636 ?auto_256638 ) ) ( not ( = ?auto_256636 ?auto_256639 ) ) ( not ( = ?auto_256636 ?auto_256640 ) ) ( not ( = ?auto_256636 ?auto_256641 ) ) ( not ( = ?auto_256636 ?auto_256642 ) ) ( not ( = ?auto_256636 ?auto_256643 ) ) ( not ( = ?auto_256637 ?auto_256638 ) ) ( not ( = ?auto_256637 ?auto_256639 ) ) ( not ( = ?auto_256637 ?auto_256640 ) ) ( not ( = ?auto_256637 ?auto_256641 ) ) ( not ( = ?auto_256637 ?auto_256642 ) ) ( not ( = ?auto_256637 ?auto_256643 ) ) ( not ( = ?auto_256638 ?auto_256639 ) ) ( not ( = ?auto_256638 ?auto_256640 ) ) ( not ( = ?auto_256638 ?auto_256641 ) ) ( not ( = ?auto_256638 ?auto_256642 ) ) ( not ( = ?auto_256638 ?auto_256643 ) ) ( not ( = ?auto_256639 ?auto_256640 ) ) ( not ( = ?auto_256639 ?auto_256641 ) ) ( not ( = ?auto_256639 ?auto_256642 ) ) ( not ( = ?auto_256639 ?auto_256643 ) ) ( not ( = ?auto_256640 ?auto_256641 ) ) ( not ( = ?auto_256640 ?auto_256642 ) ) ( not ( = ?auto_256640 ?auto_256643 ) ) ( not ( = ?auto_256641 ?auto_256642 ) ) ( not ( = ?auto_256641 ?auto_256643 ) ) ( not ( = ?auto_256642 ?auto_256643 ) ) ( ON ?auto_256641 ?auto_256642 ) ( ON ?auto_256640 ?auto_256641 ) ( ON ?auto_256639 ?auto_256640 ) ( ON ?auto_256638 ?auto_256639 ) ( ON ?auto_256637 ?auto_256638 ) ( ON ?auto_256636 ?auto_256637 ) ( CLEAR ?auto_256634 ) ( ON ?auto_256635 ?auto_256636 ) ( CLEAR ?auto_256635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_256631 ?auto_256632 ?auto_256633 ?auto_256634 ?auto_256635 )
      ( MAKE-12PILE ?auto_256631 ?auto_256632 ?auto_256633 ?auto_256634 ?auto_256635 ?auto_256636 ?auto_256637 ?auto_256638 ?auto_256639 ?auto_256640 ?auto_256641 ?auto_256642 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_256656 - BLOCK
      ?auto_256657 - BLOCK
      ?auto_256658 - BLOCK
      ?auto_256659 - BLOCK
      ?auto_256660 - BLOCK
      ?auto_256661 - BLOCK
      ?auto_256662 - BLOCK
      ?auto_256663 - BLOCK
      ?auto_256664 - BLOCK
      ?auto_256665 - BLOCK
      ?auto_256666 - BLOCK
      ?auto_256667 - BLOCK
    )
    :vars
    (
      ?auto_256668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256667 ?auto_256668 ) ( ON-TABLE ?auto_256656 ) ( ON ?auto_256657 ?auto_256656 ) ( ON ?auto_256658 ?auto_256657 ) ( not ( = ?auto_256656 ?auto_256657 ) ) ( not ( = ?auto_256656 ?auto_256658 ) ) ( not ( = ?auto_256656 ?auto_256659 ) ) ( not ( = ?auto_256656 ?auto_256660 ) ) ( not ( = ?auto_256656 ?auto_256661 ) ) ( not ( = ?auto_256656 ?auto_256662 ) ) ( not ( = ?auto_256656 ?auto_256663 ) ) ( not ( = ?auto_256656 ?auto_256664 ) ) ( not ( = ?auto_256656 ?auto_256665 ) ) ( not ( = ?auto_256656 ?auto_256666 ) ) ( not ( = ?auto_256656 ?auto_256667 ) ) ( not ( = ?auto_256656 ?auto_256668 ) ) ( not ( = ?auto_256657 ?auto_256658 ) ) ( not ( = ?auto_256657 ?auto_256659 ) ) ( not ( = ?auto_256657 ?auto_256660 ) ) ( not ( = ?auto_256657 ?auto_256661 ) ) ( not ( = ?auto_256657 ?auto_256662 ) ) ( not ( = ?auto_256657 ?auto_256663 ) ) ( not ( = ?auto_256657 ?auto_256664 ) ) ( not ( = ?auto_256657 ?auto_256665 ) ) ( not ( = ?auto_256657 ?auto_256666 ) ) ( not ( = ?auto_256657 ?auto_256667 ) ) ( not ( = ?auto_256657 ?auto_256668 ) ) ( not ( = ?auto_256658 ?auto_256659 ) ) ( not ( = ?auto_256658 ?auto_256660 ) ) ( not ( = ?auto_256658 ?auto_256661 ) ) ( not ( = ?auto_256658 ?auto_256662 ) ) ( not ( = ?auto_256658 ?auto_256663 ) ) ( not ( = ?auto_256658 ?auto_256664 ) ) ( not ( = ?auto_256658 ?auto_256665 ) ) ( not ( = ?auto_256658 ?auto_256666 ) ) ( not ( = ?auto_256658 ?auto_256667 ) ) ( not ( = ?auto_256658 ?auto_256668 ) ) ( not ( = ?auto_256659 ?auto_256660 ) ) ( not ( = ?auto_256659 ?auto_256661 ) ) ( not ( = ?auto_256659 ?auto_256662 ) ) ( not ( = ?auto_256659 ?auto_256663 ) ) ( not ( = ?auto_256659 ?auto_256664 ) ) ( not ( = ?auto_256659 ?auto_256665 ) ) ( not ( = ?auto_256659 ?auto_256666 ) ) ( not ( = ?auto_256659 ?auto_256667 ) ) ( not ( = ?auto_256659 ?auto_256668 ) ) ( not ( = ?auto_256660 ?auto_256661 ) ) ( not ( = ?auto_256660 ?auto_256662 ) ) ( not ( = ?auto_256660 ?auto_256663 ) ) ( not ( = ?auto_256660 ?auto_256664 ) ) ( not ( = ?auto_256660 ?auto_256665 ) ) ( not ( = ?auto_256660 ?auto_256666 ) ) ( not ( = ?auto_256660 ?auto_256667 ) ) ( not ( = ?auto_256660 ?auto_256668 ) ) ( not ( = ?auto_256661 ?auto_256662 ) ) ( not ( = ?auto_256661 ?auto_256663 ) ) ( not ( = ?auto_256661 ?auto_256664 ) ) ( not ( = ?auto_256661 ?auto_256665 ) ) ( not ( = ?auto_256661 ?auto_256666 ) ) ( not ( = ?auto_256661 ?auto_256667 ) ) ( not ( = ?auto_256661 ?auto_256668 ) ) ( not ( = ?auto_256662 ?auto_256663 ) ) ( not ( = ?auto_256662 ?auto_256664 ) ) ( not ( = ?auto_256662 ?auto_256665 ) ) ( not ( = ?auto_256662 ?auto_256666 ) ) ( not ( = ?auto_256662 ?auto_256667 ) ) ( not ( = ?auto_256662 ?auto_256668 ) ) ( not ( = ?auto_256663 ?auto_256664 ) ) ( not ( = ?auto_256663 ?auto_256665 ) ) ( not ( = ?auto_256663 ?auto_256666 ) ) ( not ( = ?auto_256663 ?auto_256667 ) ) ( not ( = ?auto_256663 ?auto_256668 ) ) ( not ( = ?auto_256664 ?auto_256665 ) ) ( not ( = ?auto_256664 ?auto_256666 ) ) ( not ( = ?auto_256664 ?auto_256667 ) ) ( not ( = ?auto_256664 ?auto_256668 ) ) ( not ( = ?auto_256665 ?auto_256666 ) ) ( not ( = ?auto_256665 ?auto_256667 ) ) ( not ( = ?auto_256665 ?auto_256668 ) ) ( not ( = ?auto_256666 ?auto_256667 ) ) ( not ( = ?auto_256666 ?auto_256668 ) ) ( not ( = ?auto_256667 ?auto_256668 ) ) ( ON ?auto_256666 ?auto_256667 ) ( ON ?auto_256665 ?auto_256666 ) ( ON ?auto_256664 ?auto_256665 ) ( ON ?auto_256663 ?auto_256664 ) ( ON ?auto_256662 ?auto_256663 ) ( ON ?auto_256661 ?auto_256662 ) ( ON ?auto_256660 ?auto_256661 ) ( CLEAR ?auto_256658 ) ( ON ?auto_256659 ?auto_256660 ) ( CLEAR ?auto_256659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_256656 ?auto_256657 ?auto_256658 ?auto_256659 )
      ( MAKE-12PILE ?auto_256656 ?auto_256657 ?auto_256658 ?auto_256659 ?auto_256660 ?auto_256661 ?auto_256662 ?auto_256663 ?auto_256664 ?auto_256665 ?auto_256666 ?auto_256667 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_256681 - BLOCK
      ?auto_256682 - BLOCK
      ?auto_256683 - BLOCK
      ?auto_256684 - BLOCK
      ?auto_256685 - BLOCK
      ?auto_256686 - BLOCK
      ?auto_256687 - BLOCK
      ?auto_256688 - BLOCK
      ?auto_256689 - BLOCK
      ?auto_256690 - BLOCK
      ?auto_256691 - BLOCK
      ?auto_256692 - BLOCK
    )
    :vars
    (
      ?auto_256693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256692 ?auto_256693 ) ( ON-TABLE ?auto_256681 ) ( ON ?auto_256682 ?auto_256681 ) ( ON ?auto_256683 ?auto_256682 ) ( not ( = ?auto_256681 ?auto_256682 ) ) ( not ( = ?auto_256681 ?auto_256683 ) ) ( not ( = ?auto_256681 ?auto_256684 ) ) ( not ( = ?auto_256681 ?auto_256685 ) ) ( not ( = ?auto_256681 ?auto_256686 ) ) ( not ( = ?auto_256681 ?auto_256687 ) ) ( not ( = ?auto_256681 ?auto_256688 ) ) ( not ( = ?auto_256681 ?auto_256689 ) ) ( not ( = ?auto_256681 ?auto_256690 ) ) ( not ( = ?auto_256681 ?auto_256691 ) ) ( not ( = ?auto_256681 ?auto_256692 ) ) ( not ( = ?auto_256681 ?auto_256693 ) ) ( not ( = ?auto_256682 ?auto_256683 ) ) ( not ( = ?auto_256682 ?auto_256684 ) ) ( not ( = ?auto_256682 ?auto_256685 ) ) ( not ( = ?auto_256682 ?auto_256686 ) ) ( not ( = ?auto_256682 ?auto_256687 ) ) ( not ( = ?auto_256682 ?auto_256688 ) ) ( not ( = ?auto_256682 ?auto_256689 ) ) ( not ( = ?auto_256682 ?auto_256690 ) ) ( not ( = ?auto_256682 ?auto_256691 ) ) ( not ( = ?auto_256682 ?auto_256692 ) ) ( not ( = ?auto_256682 ?auto_256693 ) ) ( not ( = ?auto_256683 ?auto_256684 ) ) ( not ( = ?auto_256683 ?auto_256685 ) ) ( not ( = ?auto_256683 ?auto_256686 ) ) ( not ( = ?auto_256683 ?auto_256687 ) ) ( not ( = ?auto_256683 ?auto_256688 ) ) ( not ( = ?auto_256683 ?auto_256689 ) ) ( not ( = ?auto_256683 ?auto_256690 ) ) ( not ( = ?auto_256683 ?auto_256691 ) ) ( not ( = ?auto_256683 ?auto_256692 ) ) ( not ( = ?auto_256683 ?auto_256693 ) ) ( not ( = ?auto_256684 ?auto_256685 ) ) ( not ( = ?auto_256684 ?auto_256686 ) ) ( not ( = ?auto_256684 ?auto_256687 ) ) ( not ( = ?auto_256684 ?auto_256688 ) ) ( not ( = ?auto_256684 ?auto_256689 ) ) ( not ( = ?auto_256684 ?auto_256690 ) ) ( not ( = ?auto_256684 ?auto_256691 ) ) ( not ( = ?auto_256684 ?auto_256692 ) ) ( not ( = ?auto_256684 ?auto_256693 ) ) ( not ( = ?auto_256685 ?auto_256686 ) ) ( not ( = ?auto_256685 ?auto_256687 ) ) ( not ( = ?auto_256685 ?auto_256688 ) ) ( not ( = ?auto_256685 ?auto_256689 ) ) ( not ( = ?auto_256685 ?auto_256690 ) ) ( not ( = ?auto_256685 ?auto_256691 ) ) ( not ( = ?auto_256685 ?auto_256692 ) ) ( not ( = ?auto_256685 ?auto_256693 ) ) ( not ( = ?auto_256686 ?auto_256687 ) ) ( not ( = ?auto_256686 ?auto_256688 ) ) ( not ( = ?auto_256686 ?auto_256689 ) ) ( not ( = ?auto_256686 ?auto_256690 ) ) ( not ( = ?auto_256686 ?auto_256691 ) ) ( not ( = ?auto_256686 ?auto_256692 ) ) ( not ( = ?auto_256686 ?auto_256693 ) ) ( not ( = ?auto_256687 ?auto_256688 ) ) ( not ( = ?auto_256687 ?auto_256689 ) ) ( not ( = ?auto_256687 ?auto_256690 ) ) ( not ( = ?auto_256687 ?auto_256691 ) ) ( not ( = ?auto_256687 ?auto_256692 ) ) ( not ( = ?auto_256687 ?auto_256693 ) ) ( not ( = ?auto_256688 ?auto_256689 ) ) ( not ( = ?auto_256688 ?auto_256690 ) ) ( not ( = ?auto_256688 ?auto_256691 ) ) ( not ( = ?auto_256688 ?auto_256692 ) ) ( not ( = ?auto_256688 ?auto_256693 ) ) ( not ( = ?auto_256689 ?auto_256690 ) ) ( not ( = ?auto_256689 ?auto_256691 ) ) ( not ( = ?auto_256689 ?auto_256692 ) ) ( not ( = ?auto_256689 ?auto_256693 ) ) ( not ( = ?auto_256690 ?auto_256691 ) ) ( not ( = ?auto_256690 ?auto_256692 ) ) ( not ( = ?auto_256690 ?auto_256693 ) ) ( not ( = ?auto_256691 ?auto_256692 ) ) ( not ( = ?auto_256691 ?auto_256693 ) ) ( not ( = ?auto_256692 ?auto_256693 ) ) ( ON ?auto_256691 ?auto_256692 ) ( ON ?auto_256690 ?auto_256691 ) ( ON ?auto_256689 ?auto_256690 ) ( ON ?auto_256688 ?auto_256689 ) ( ON ?auto_256687 ?auto_256688 ) ( ON ?auto_256686 ?auto_256687 ) ( ON ?auto_256685 ?auto_256686 ) ( CLEAR ?auto_256683 ) ( ON ?auto_256684 ?auto_256685 ) ( CLEAR ?auto_256684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_256681 ?auto_256682 ?auto_256683 ?auto_256684 )
      ( MAKE-12PILE ?auto_256681 ?auto_256682 ?auto_256683 ?auto_256684 ?auto_256685 ?auto_256686 ?auto_256687 ?auto_256688 ?auto_256689 ?auto_256690 ?auto_256691 ?auto_256692 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_256706 - BLOCK
      ?auto_256707 - BLOCK
      ?auto_256708 - BLOCK
      ?auto_256709 - BLOCK
      ?auto_256710 - BLOCK
      ?auto_256711 - BLOCK
      ?auto_256712 - BLOCK
      ?auto_256713 - BLOCK
      ?auto_256714 - BLOCK
      ?auto_256715 - BLOCK
      ?auto_256716 - BLOCK
      ?auto_256717 - BLOCK
    )
    :vars
    (
      ?auto_256718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256717 ?auto_256718 ) ( ON-TABLE ?auto_256706 ) ( ON ?auto_256707 ?auto_256706 ) ( not ( = ?auto_256706 ?auto_256707 ) ) ( not ( = ?auto_256706 ?auto_256708 ) ) ( not ( = ?auto_256706 ?auto_256709 ) ) ( not ( = ?auto_256706 ?auto_256710 ) ) ( not ( = ?auto_256706 ?auto_256711 ) ) ( not ( = ?auto_256706 ?auto_256712 ) ) ( not ( = ?auto_256706 ?auto_256713 ) ) ( not ( = ?auto_256706 ?auto_256714 ) ) ( not ( = ?auto_256706 ?auto_256715 ) ) ( not ( = ?auto_256706 ?auto_256716 ) ) ( not ( = ?auto_256706 ?auto_256717 ) ) ( not ( = ?auto_256706 ?auto_256718 ) ) ( not ( = ?auto_256707 ?auto_256708 ) ) ( not ( = ?auto_256707 ?auto_256709 ) ) ( not ( = ?auto_256707 ?auto_256710 ) ) ( not ( = ?auto_256707 ?auto_256711 ) ) ( not ( = ?auto_256707 ?auto_256712 ) ) ( not ( = ?auto_256707 ?auto_256713 ) ) ( not ( = ?auto_256707 ?auto_256714 ) ) ( not ( = ?auto_256707 ?auto_256715 ) ) ( not ( = ?auto_256707 ?auto_256716 ) ) ( not ( = ?auto_256707 ?auto_256717 ) ) ( not ( = ?auto_256707 ?auto_256718 ) ) ( not ( = ?auto_256708 ?auto_256709 ) ) ( not ( = ?auto_256708 ?auto_256710 ) ) ( not ( = ?auto_256708 ?auto_256711 ) ) ( not ( = ?auto_256708 ?auto_256712 ) ) ( not ( = ?auto_256708 ?auto_256713 ) ) ( not ( = ?auto_256708 ?auto_256714 ) ) ( not ( = ?auto_256708 ?auto_256715 ) ) ( not ( = ?auto_256708 ?auto_256716 ) ) ( not ( = ?auto_256708 ?auto_256717 ) ) ( not ( = ?auto_256708 ?auto_256718 ) ) ( not ( = ?auto_256709 ?auto_256710 ) ) ( not ( = ?auto_256709 ?auto_256711 ) ) ( not ( = ?auto_256709 ?auto_256712 ) ) ( not ( = ?auto_256709 ?auto_256713 ) ) ( not ( = ?auto_256709 ?auto_256714 ) ) ( not ( = ?auto_256709 ?auto_256715 ) ) ( not ( = ?auto_256709 ?auto_256716 ) ) ( not ( = ?auto_256709 ?auto_256717 ) ) ( not ( = ?auto_256709 ?auto_256718 ) ) ( not ( = ?auto_256710 ?auto_256711 ) ) ( not ( = ?auto_256710 ?auto_256712 ) ) ( not ( = ?auto_256710 ?auto_256713 ) ) ( not ( = ?auto_256710 ?auto_256714 ) ) ( not ( = ?auto_256710 ?auto_256715 ) ) ( not ( = ?auto_256710 ?auto_256716 ) ) ( not ( = ?auto_256710 ?auto_256717 ) ) ( not ( = ?auto_256710 ?auto_256718 ) ) ( not ( = ?auto_256711 ?auto_256712 ) ) ( not ( = ?auto_256711 ?auto_256713 ) ) ( not ( = ?auto_256711 ?auto_256714 ) ) ( not ( = ?auto_256711 ?auto_256715 ) ) ( not ( = ?auto_256711 ?auto_256716 ) ) ( not ( = ?auto_256711 ?auto_256717 ) ) ( not ( = ?auto_256711 ?auto_256718 ) ) ( not ( = ?auto_256712 ?auto_256713 ) ) ( not ( = ?auto_256712 ?auto_256714 ) ) ( not ( = ?auto_256712 ?auto_256715 ) ) ( not ( = ?auto_256712 ?auto_256716 ) ) ( not ( = ?auto_256712 ?auto_256717 ) ) ( not ( = ?auto_256712 ?auto_256718 ) ) ( not ( = ?auto_256713 ?auto_256714 ) ) ( not ( = ?auto_256713 ?auto_256715 ) ) ( not ( = ?auto_256713 ?auto_256716 ) ) ( not ( = ?auto_256713 ?auto_256717 ) ) ( not ( = ?auto_256713 ?auto_256718 ) ) ( not ( = ?auto_256714 ?auto_256715 ) ) ( not ( = ?auto_256714 ?auto_256716 ) ) ( not ( = ?auto_256714 ?auto_256717 ) ) ( not ( = ?auto_256714 ?auto_256718 ) ) ( not ( = ?auto_256715 ?auto_256716 ) ) ( not ( = ?auto_256715 ?auto_256717 ) ) ( not ( = ?auto_256715 ?auto_256718 ) ) ( not ( = ?auto_256716 ?auto_256717 ) ) ( not ( = ?auto_256716 ?auto_256718 ) ) ( not ( = ?auto_256717 ?auto_256718 ) ) ( ON ?auto_256716 ?auto_256717 ) ( ON ?auto_256715 ?auto_256716 ) ( ON ?auto_256714 ?auto_256715 ) ( ON ?auto_256713 ?auto_256714 ) ( ON ?auto_256712 ?auto_256713 ) ( ON ?auto_256711 ?auto_256712 ) ( ON ?auto_256710 ?auto_256711 ) ( ON ?auto_256709 ?auto_256710 ) ( CLEAR ?auto_256707 ) ( ON ?auto_256708 ?auto_256709 ) ( CLEAR ?auto_256708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_256706 ?auto_256707 ?auto_256708 )
      ( MAKE-12PILE ?auto_256706 ?auto_256707 ?auto_256708 ?auto_256709 ?auto_256710 ?auto_256711 ?auto_256712 ?auto_256713 ?auto_256714 ?auto_256715 ?auto_256716 ?auto_256717 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_256731 - BLOCK
      ?auto_256732 - BLOCK
      ?auto_256733 - BLOCK
      ?auto_256734 - BLOCK
      ?auto_256735 - BLOCK
      ?auto_256736 - BLOCK
      ?auto_256737 - BLOCK
      ?auto_256738 - BLOCK
      ?auto_256739 - BLOCK
      ?auto_256740 - BLOCK
      ?auto_256741 - BLOCK
      ?auto_256742 - BLOCK
    )
    :vars
    (
      ?auto_256743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256742 ?auto_256743 ) ( ON-TABLE ?auto_256731 ) ( ON ?auto_256732 ?auto_256731 ) ( not ( = ?auto_256731 ?auto_256732 ) ) ( not ( = ?auto_256731 ?auto_256733 ) ) ( not ( = ?auto_256731 ?auto_256734 ) ) ( not ( = ?auto_256731 ?auto_256735 ) ) ( not ( = ?auto_256731 ?auto_256736 ) ) ( not ( = ?auto_256731 ?auto_256737 ) ) ( not ( = ?auto_256731 ?auto_256738 ) ) ( not ( = ?auto_256731 ?auto_256739 ) ) ( not ( = ?auto_256731 ?auto_256740 ) ) ( not ( = ?auto_256731 ?auto_256741 ) ) ( not ( = ?auto_256731 ?auto_256742 ) ) ( not ( = ?auto_256731 ?auto_256743 ) ) ( not ( = ?auto_256732 ?auto_256733 ) ) ( not ( = ?auto_256732 ?auto_256734 ) ) ( not ( = ?auto_256732 ?auto_256735 ) ) ( not ( = ?auto_256732 ?auto_256736 ) ) ( not ( = ?auto_256732 ?auto_256737 ) ) ( not ( = ?auto_256732 ?auto_256738 ) ) ( not ( = ?auto_256732 ?auto_256739 ) ) ( not ( = ?auto_256732 ?auto_256740 ) ) ( not ( = ?auto_256732 ?auto_256741 ) ) ( not ( = ?auto_256732 ?auto_256742 ) ) ( not ( = ?auto_256732 ?auto_256743 ) ) ( not ( = ?auto_256733 ?auto_256734 ) ) ( not ( = ?auto_256733 ?auto_256735 ) ) ( not ( = ?auto_256733 ?auto_256736 ) ) ( not ( = ?auto_256733 ?auto_256737 ) ) ( not ( = ?auto_256733 ?auto_256738 ) ) ( not ( = ?auto_256733 ?auto_256739 ) ) ( not ( = ?auto_256733 ?auto_256740 ) ) ( not ( = ?auto_256733 ?auto_256741 ) ) ( not ( = ?auto_256733 ?auto_256742 ) ) ( not ( = ?auto_256733 ?auto_256743 ) ) ( not ( = ?auto_256734 ?auto_256735 ) ) ( not ( = ?auto_256734 ?auto_256736 ) ) ( not ( = ?auto_256734 ?auto_256737 ) ) ( not ( = ?auto_256734 ?auto_256738 ) ) ( not ( = ?auto_256734 ?auto_256739 ) ) ( not ( = ?auto_256734 ?auto_256740 ) ) ( not ( = ?auto_256734 ?auto_256741 ) ) ( not ( = ?auto_256734 ?auto_256742 ) ) ( not ( = ?auto_256734 ?auto_256743 ) ) ( not ( = ?auto_256735 ?auto_256736 ) ) ( not ( = ?auto_256735 ?auto_256737 ) ) ( not ( = ?auto_256735 ?auto_256738 ) ) ( not ( = ?auto_256735 ?auto_256739 ) ) ( not ( = ?auto_256735 ?auto_256740 ) ) ( not ( = ?auto_256735 ?auto_256741 ) ) ( not ( = ?auto_256735 ?auto_256742 ) ) ( not ( = ?auto_256735 ?auto_256743 ) ) ( not ( = ?auto_256736 ?auto_256737 ) ) ( not ( = ?auto_256736 ?auto_256738 ) ) ( not ( = ?auto_256736 ?auto_256739 ) ) ( not ( = ?auto_256736 ?auto_256740 ) ) ( not ( = ?auto_256736 ?auto_256741 ) ) ( not ( = ?auto_256736 ?auto_256742 ) ) ( not ( = ?auto_256736 ?auto_256743 ) ) ( not ( = ?auto_256737 ?auto_256738 ) ) ( not ( = ?auto_256737 ?auto_256739 ) ) ( not ( = ?auto_256737 ?auto_256740 ) ) ( not ( = ?auto_256737 ?auto_256741 ) ) ( not ( = ?auto_256737 ?auto_256742 ) ) ( not ( = ?auto_256737 ?auto_256743 ) ) ( not ( = ?auto_256738 ?auto_256739 ) ) ( not ( = ?auto_256738 ?auto_256740 ) ) ( not ( = ?auto_256738 ?auto_256741 ) ) ( not ( = ?auto_256738 ?auto_256742 ) ) ( not ( = ?auto_256738 ?auto_256743 ) ) ( not ( = ?auto_256739 ?auto_256740 ) ) ( not ( = ?auto_256739 ?auto_256741 ) ) ( not ( = ?auto_256739 ?auto_256742 ) ) ( not ( = ?auto_256739 ?auto_256743 ) ) ( not ( = ?auto_256740 ?auto_256741 ) ) ( not ( = ?auto_256740 ?auto_256742 ) ) ( not ( = ?auto_256740 ?auto_256743 ) ) ( not ( = ?auto_256741 ?auto_256742 ) ) ( not ( = ?auto_256741 ?auto_256743 ) ) ( not ( = ?auto_256742 ?auto_256743 ) ) ( ON ?auto_256741 ?auto_256742 ) ( ON ?auto_256740 ?auto_256741 ) ( ON ?auto_256739 ?auto_256740 ) ( ON ?auto_256738 ?auto_256739 ) ( ON ?auto_256737 ?auto_256738 ) ( ON ?auto_256736 ?auto_256737 ) ( ON ?auto_256735 ?auto_256736 ) ( ON ?auto_256734 ?auto_256735 ) ( CLEAR ?auto_256732 ) ( ON ?auto_256733 ?auto_256734 ) ( CLEAR ?auto_256733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_256731 ?auto_256732 ?auto_256733 )
      ( MAKE-12PILE ?auto_256731 ?auto_256732 ?auto_256733 ?auto_256734 ?auto_256735 ?auto_256736 ?auto_256737 ?auto_256738 ?auto_256739 ?auto_256740 ?auto_256741 ?auto_256742 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_256756 - BLOCK
      ?auto_256757 - BLOCK
      ?auto_256758 - BLOCK
      ?auto_256759 - BLOCK
      ?auto_256760 - BLOCK
      ?auto_256761 - BLOCK
      ?auto_256762 - BLOCK
      ?auto_256763 - BLOCK
      ?auto_256764 - BLOCK
      ?auto_256765 - BLOCK
      ?auto_256766 - BLOCK
      ?auto_256767 - BLOCK
    )
    :vars
    (
      ?auto_256768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256767 ?auto_256768 ) ( ON-TABLE ?auto_256756 ) ( not ( = ?auto_256756 ?auto_256757 ) ) ( not ( = ?auto_256756 ?auto_256758 ) ) ( not ( = ?auto_256756 ?auto_256759 ) ) ( not ( = ?auto_256756 ?auto_256760 ) ) ( not ( = ?auto_256756 ?auto_256761 ) ) ( not ( = ?auto_256756 ?auto_256762 ) ) ( not ( = ?auto_256756 ?auto_256763 ) ) ( not ( = ?auto_256756 ?auto_256764 ) ) ( not ( = ?auto_256756 ?auto_256765 ) ) ( not ( = ?auto_256756 ?auto_256766 ) ) ( not ( = ?auto_256756 ?auto_256767 ) ) ( not ( = ?auto_256756 ?auto_256768 ) ) ( not ( = ?auto_256757 ?auto_256758 ) ) ( not ( = ?auto_256757 ?auto_256759 ) ) ( not ( = ?auto_256757 ?auto_256760 ) ) ( not ( = ?auto_256757 ?auto_256761 ) ) ( not ( = ?auto_256757 ?auto_256762 ) ) ( not ( = ?auto_256757 ?auto_256763 ) ) ( not ( = ?auto_256757 ?auto_256764 ) ) ( not ( = ?auto_256757 ?auto_256765 ) ) ( not ( = ?auto_256757 ?auto_256766 ) ) ( not ( = ?auto_256757 ?auto_256767 ) ) ( not ( = ?auto_256757 ?auto_256768 ) ) ( not ( = ?auto_256758 ?auto_256759 ) ) ( not ( = ?auto_256758 ?auto_256760 ) ) ( not ( = ?auto_256758 ?auto_256761 ) ) ( not ( = ?auto_256758 ?auto_256762 ) ) ( not ( = ?auto_256758 ?auto_256763 ) ) ( not ( = ?auto_256758 ?auto_256764 ) ) ( not ( = ?auto_256758 ?auto_256765 ) ) ( not ( = ?auto_256758 ?auto_256766 ) ) ( not ( = ?auto_256758 ?auto_256767 ) ) ( not ( = ?auto_256758 ?auto_256768 ) ) ( not ( = ?auto_256759 ?auto_256760 ) ) ( not ( = ?auto_256759 ?auto_256761 ) ) ( not ( = ?auto_256759 ?auto_256762 ) ) ( not ( = ?auto_256759 ?auto_256763 ) ) ( not ( = ?auto_256759 ?auto_256764 ) ) ( not ( = ?auto_256759 ?auto_256765 ) ) ( not ( = ?auto_256759 ?auto_256766 ) ) ( not ( = ?auto_256759 ?auto_256767 ) ) ( not ( = ?auto_256759 ?auto_256768 ) ) ( not ( = ?auto_256760 ?auto_256761 ) ) ( not ( = ?auto_256760 ?auto_256762 ) ) ( not ( = ?auto_256760 ?auto_256763 ) ) ( not ( = ?auto_256760 ?auto_256764 ) ) ( not ( = ?auto_256760 ?auto_256765 ) ) ( not ( = ?auto_256760 ?auto_256766 ) ) ( not ( = ?auto_256760 ?auto_256767 ) ) ( not ( = ?auto_256760 ?auto_256768 ) ) ( not ( = ?auto_256761 ?auto_256762 ) ) ( not ( = ?auto_256761 ?auto_256763 ) ) ( not ( = ?auto_256761 ?auto_256764 ) ) ( not ( = ?auto_256761 ?auto_256765 ) ) ( not ( = ?auto_256761 ?auto_256766 ) ) ( not ( = ?auto_256761 ?auto_256767 ) ) ( not ( = ?auto_256761 ?auto_256768 ) ) ( not ( = ?auto_256762 ?auto_256763 ) ) ( not ( = ?auto_256762 ?auto_256764 ) ) ( not ( = ?auto_256762 ?auto_256765 ) ) ( not ( = ?auto_256762 ?auto_256766 ) ) ( not ( = ?auto_256762 ?auto_256767 ) ) ( not ( = ?auto_256762 ?auto_256768 ) ) ( not ( = ?auto_256763 ?auto_256764 ) ) ( not ( = ?auto_256763 ?auto_256765 ) ) ( not ( = ?auto_256763 ?auto_256766 ) ) ( not ( = ?auto_256763 ?auto_256767 ) ) ( not ( = ?auto_256763 ?auto_256768 ) ) ( not ( = ?auto_256764 ?auto_256765 ) ) ( not ( = ?auto_256764 ?auto_256766 ) ) ( not ( = ?auto_256764 ?auto_256767 ) ) ( not ( = ?auto_256764 ?auto_256768 ) ) ( not ( = ?auto_256765 ?auto_256766 ) ) ( not ( = ?auto_256765 ?auto_256767 ) ) ( not ( = ?auto_256765 ?auto_256768 ) ) ( not ( = ?auto_256766 ?auto_256767 ) ) ( not ( = ?auto_256766 ?auto_256768 ) ) ( not ( = ?auto_256767 ?auto_256768 ) ) ( ON ?auto_256766 ?auto_256767 ) ( ON ?auto_256765 ?auto_256766 ) ( ON ?auto_256764 ?auto_256765 ) ( ON ?auto_256763 ?auto_256764 ) ( ON ?auto_256762 ?auto_256763 ) ( ON ?auto_256761 ?auto_256762 ) ( ON ?auto_256760 ?auto_256761 ) ( ON ?auto_256759 ?auto_256760 ) ( ON ?auto_256758 ?auto_256759 ) ( CLEAR ?auto_256756 ) ( ON ?auto_256757 ?auto_256758 ) ( CLEAR ?auto_256757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_256756 ?auto_256757 )
      ( MAKE-12PILE ?auto_256756 ?auto_256757 ?auto_256758 ?auto_256759 ?auto_256760 ?auto_256761 ?auto_256762 ?auto_256763 ?auto_256764 ?auto_256765 ?auto_256766 ?auto_256767 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_256781 - BLOCK
      ?auto_256782 - BLOCK
      ?auto_256783 - BLOCK
      ?auto_256784 - BLOCK
      ?auto_256785 - BLOCK
      ?auto_256786 - BLOCK
      ?auto_256787 - BLOCK
      ?auto_256788 - BLOCK
      ?auto_256789 - BLOCK
      ?auto_256790 - BLOCK
      ?auto_256791 - BLOCK
      ?auto_256792 - BLOCK
    )
    :vars
    (
      ?auto_256793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256792 ?auto_256793 ) ( ON-TABLE ?auto_256781 ) ( not ( = ?auto_256781 ?auto_256782 ) ) ( not ( = ?auto_256781 ?auto_256783 ) ) ( not ( = ?auto_256781 ?auto_256784 ) ) ( not ( = ?auto_256781 ?auto_256785 ) ) ( not ( = ?auto_256781 ?auto_256786 ) ) ( not ( = ?auto_256781 ?auto_256787 ) ) ( not ( = ?auto_256781 ?auto_256788 ) ) ( not ( = ?auto_256781 ?auto_256789 ) ) ( not ( = ?auto_256781 ?auto_256790 ) ) ( not ( = ?auto_256781 ?auto_256791 ) ) ( not ( = ?auto_256781 ?auto_256792 ) ) ( not ( = ?auto_256781 ?auto_256793 ) ) ( not ( = ?auto_256782 ?auto_256783 ) ) ( not ( = ?auto_256782 ?auto_256784 ) ) ( not ( = ?auto_256782 ?auto_256785 ) ) ( not ( = ?auto_256782 ?auto_256786 ) ) ( not ( = ?auto_256782 ?auto_256787 ) ) ( not ( = ?auto_256782 ?auto_256788 ) ) ( not ( = ?auto_256782 ?auto_256789 ) ) ( not ( = ?auto_256782 ?auto_256790 ) ) ( not ( = ?auto_256782 ?auto_256791 ) ) ( not ( = ?auto_256782 ?auto_256792 ) ) ( not ( = ?auto_256782 ?auto_256793 ) ) ( not ( = ?auto_256783 ?auto_256784 ) ) ( not ( = ?auto_256783 ?auto_256785 ) ) ( not ( = ?auto_256783 ?auto_256786 ) ) ( not ( = ?auto_256783 ?auto_256787 ) ) ( not ( = ?auto_256783 ?auto_256788 ) ) ( not ( = ?auto_256783 ?auto_256789 ) ) ( not ( = ?auto_256783 ?auto_256790 ) ) ( not ( = ?auto_256783 ?auto_256791 ) ) ( not ( = ?auto_256783 ?auto_256792 ) ) ( not ( = ?auto_256783 ?auto_256793 ) ) ( not ( = ?auto_256784 ?auto_256785 ) ) ( not ( = ?auto_256784 ?auto_256786 ) ) ( not ( = ?auto_256784 ?auto_256787 ) ) ( not ( = ?auto_256784 ?auto_256788 ) ) ( not ( = ?auto_256784 ?auto_256789 ) ) ( not ( = ?auto_256784 ?auto_256790 ) ) ( not ( = ?auto_256784 ?auto_256791 ) ) ( not ( = ?auto_256784 ?auto_256792 ) ) ( not ( = ?auto_256784 ?auto_256793 ) ) ( not ( = ?auto_256785 ?auto_256786 ) ) ( not ( = ?auto_256785 ?auto_256787 ) ) ( not ( = ?auto_256785 ?auto_256788 ) ) ( not ( = ?auto_256785 ?auto_256789 ) ) ( not ( = ?auto_256785 ?auto_256790 ) ) ( not ( = ?auto_256785 ?auto_256791 ) ) ( not ( = ?auto_256785 ?auto_256792 ) ) ( not ( = ?auto_256785 ?auto_256793 ) ) ( not ( = ?auto_256786 ?auto_256787 ) ) ( not ( = ?auto_256786 ?auto_256788 ) ) ( not ( = ?auto_256786 ?auto_256789 ) ) ( not ( = ?auto_256786 ?auto_256790 ) ) ( not ( = ?auto_256786 ?auto_256791 ) ) ( not ( = ?auto_256786 ?auto_256792 ) ) ( not ( = ?auto_256786 ?auto_256793 ) ) ( not ( = ?auto_256787 ?auto_256788 ) ) ( not ( = ?auto_256787 ?auto_256789 ) ) ( not ( = ?auto_256787 ?auto_256790 ) ) ( not ( = ?auto_256787 ?auto_256791 ) ) ( not ( = ?auto_256787 ?auto_256792 ) ) ( not ( = ?auto_256787 ?auto_256793 ) ) ( not ( = ?auto_256788 ?auto_256789 ) ) ( not ( = ?auto_256788 ?auto_256790 ) ) ( not ( = ?auto_256788 ?auto_256791 ) ) ( not ( = ?auto_256788 ?auto_256792 ) ) ( not ( = ?auto_256788 ?auto_256793 ) ) ( not ( = ?auto_256789 ?auto_256790 ) ) ( not ( = ?auto_256789 ?auto_256791 ) ) ( not ( = ?auto_256789 ?auto_256792 ) ) ( not ( = ?auto_256789 ?auto_256793 ) ) ( not ( = ?auto_256790 ?auto_256791 ) ) ( not ( = ?auto_256790 ?auto_256792 ) ) ( not ( = ?auto_256790 ?auto_256793 ) ) ( not ( = ?auto_256791 ?auto_256792 ) ) ( not ( = ?auto_256791 ?auto_256793 ) ) ( not ( = ?auto_256792 ?auto_256793 ) ) ( ON ?auto_256791 ?auto_256792 ) ( ON ?auto_256790 ?auto_256791 ) ( ON ?auto_256789 ?auto_256790 ) ( ON ?auto_256788 ?auto_256789 ) ( ON ?auto_256787 ?auto_256788 ) ( ON ?auto_256786 ?auto_256787 ) ( ON ?auto_256785 ?auto_256786 ) ( ON ?auto_256784 ?auto_256785 ) ( ON ?auto_256783 ?auto_256784 ) ( CLEAR ?auto_256781 ) ( ON ?auto_256782 ?auto_256783 ) ( CLEAR ?auto_256782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_256781 ?auto_256782 )
      ( MAKE-12PILE ?auto_256781 ?auto_256782 ?auto_256783 ?auto_256784 ?auto_256785 ?auto_256786 ?auto_256787 ?auto_256788 ?auto_256789 ?auto_256790 ?auto_256791 ?auto_256792 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_256806 - BLOCK
      ?auto_256807 - BLOCK
      ?auto_256808 - BLOCK
      ?auto_256809 - BLOCK
      ?auto_256810 - BLOCK
      ?auto_256811 - BLOCK
      ?auto_256812 - BLOCK
      ?auto_256813 - BLOCK
      ?auto_256814 - BLOCK
      ?auto_256815 - BLOCK
      ?auto_256816 - BLOCK
      ?auto_256817 - BLOCK
    )
    :vars
    (
      ?auto_256818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256817 ?auto_256818 ) ( not ( = ?auto_256806 ?auto_256807 ) ) ( not ( = ?auto_256806 ?auto_256808 ) ) ( not ( = ?auto_256806 ?auto_256809 ) ) ( not ( = ?auto_256806 ?auto_256810 ) ) ( not ( = ?auto_256806 ?auto_256811 ) ) ( not ( = ?auto_256806 ?auto_256812 ) ) ( not ( = ?auto_256806 ?auto_256813 ) ) ( not ( = ?auto_256806 ?auto_256814 ) ) ( not ( = ?auto_256806 ?auto_256815 ) ) ( not ( = ?auto_256806 ?auto_256816 ) ) ( not ( = ?auto_256806 ?auto_256817 ) ) ( not ( = ?auto_256806 ?auto_256818 ) ) ( not ( = ?auto_256807 ?auto_256808 ) ) ( not ( = ?auto_256807 ?auto_256809 ) ) ( not ( = ?auto_256807 ?auto_256810 ) ) ( not ( = ?auto_256807 ?auto_256811 ) ) ( not ( = ?auto_256807 ?auto_256812 ) ) ( not ( = ?auto_256807 ?auto_256813 ) ) ( not ( = ?auto_256807 ?auto_256814 ) ) ( not ( = ?auto_256807 ?auto_256815 ) ) ( not ( = ?auto_256807 ?auto_256816 ) ) ( not ( = ?auto_256807 ?auto_256817 ) ) ( not ( = ?auto_256807 ?auto_256818 ) ) ( not ( = ?auto_256808 ?auto_256809 ) ) ( not ( = ?auto_256808 ?auto_256810 ) ) ( not ( = ?auto_256808 ?auto_256811 ) ) ( not ( = ?auto_256808 ?auto_256812 ) ) ( not ( = ?auto_256808 ?auto_256813 ) ) ( not ( = ?auto_256808 ?auto_256814 ) ) ( not ( = ?auto_256808 ?auto_256815 ) ) ( not ( = ?auto_256808 ?auto_256816 ) ) ( not ( = ?auto_256808 ?auto_256817 ) ) ( not ( = ?auto_256808 ?auto_256818 ) ) ( not ( = ?auto_256809 ?auto_256810 ) ) ( not ( = ?auto_256809 ?auto_256811 ) ) ( not ( = ?auto_256809 ?auto_256812 ) ) ( not ( = ?auto_256809 ?auto_256813 ) ) ( not ( = ?auto_256809 ?auto_256814 ) ) ( not ( = ?auto_256809 ?auto_256815 ) ) ( not ( = ?auto_256809 ?auto_256816 ) ) ( not ( = ?auto_256809 ?auto_256817 ) ) ( not ( = ?auto_256809 ?auto_256818 ) ) ( not ( = ?auto_256810 ?auto_256811 ) ) ( not ( = ?auto_256810 ?auto_256812 ) ) ( not ( = ?auto_256810 ?auto_256813 ) ) ( not ( = ?auto_256810 ?auto_256814 ) ) ( not ( = ?auto_256810 ?auto_256815 ) ) ( not ( = ?auto_256810 ?auto_256816 ) ) ( not ( = ?auto_256810 ?auto_256817 ) ) ( not ( = ?auto_256810 ?auto_256818 ) ) ( not ( = ?auto_256811 ?auto_256812 ) ) ( not ( = ?auto_256811 ?auto_256813 ) ) ( not ( = ?auto_256811 ?auto_256814 ) ) ( not ( = ?auto_256811 ?auto_256815 ) ) ( not ( = ?auto_256811 ?auto_256816 ) ) ( not ( = ?auto_256811 ?auto_256817 ) ) ( not ( = ?auto_256811 ?auto_256818 ) ) ( not ( = ?auto_256812 ?auto_256813 ) ) ( not ( = ?auto_256812 ?auto_256814 ) ) ( not ( = ?auto_256812 ?auto_256815 ) ) ( not ( = ?auto_256812 ?auto_256816 ) ) ( not ( = ?auto_256812 ?auto_256817 ) ) ( not ( = ?auto_256812 ?auto_256818 ) ) ( not ( = ?auto_256813 ?auto_256814 ) ) ( not ( = ?auto_256813 ?auto_256815 ) ) ( not ( = ?auto_256813 ?auto_256816 ) ) ( not ( = ?auto_256813 ?auto_256817 ) ) ( not ( = ?auto_256813 ?auto_256818 ) ) ( not ( = ?auto_256814 ?auto_256815 ) ) ( not ( = ?auto_256814 ?auto_256816 ) ) ( not ( = ?auto_256814 ?auto_256817 ) ) ( not ( = ?auto_256814 ?auto_256818 ) ) ( not ( = ?auto_256815 ?auto_256816 ) ) ( not ( = ?auto_256815 ?auto_256817 ) ) ( not ( = ?auto_256815 ?auto_256818 ) ) ( not ( = ?auto_256816 ?auto_256817 ) ) ( not ( = ?auto_256816 ?auto_256818 ) ) ( not ( = ?auto_256817 ?auto_256818 ) ) ( ON ?auto_256816 ?auto_256817 ) ( ON ?auto_256815 ?auto_256816 ) ( ON ?auto_256814 ?auto_256815 ) ( ON ?auto_256813 ?auto_256814 ) ( ON ?auto_256812 ?auto_256813 ) ( ON ?auto_256811 ?auto_256812 ) ( ON ?auto_256810 ?auto_256811 ) ( ON ?auto_256809 ?auto_256810 ) ( ON ?auto_256808 ?auto_256809 ) ( ON ?auto_256807 ?auto_256808 ) ( ON ?auto_256806 ?auto_256807 ) ( CLEAR ?auto_256806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_256806 )
      ( MAKE-12PILE ?auto_256806 ?auto_256807 ?auto_256808 ?auto_256809 ?auto_256810 ?auto_256811 ?auto_256812 ?auto_256813 ?auto_256814 ?auto_256815 ?auto_256816 ?auto_256817 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_256831 - BLOCK
      ?auto_256832 - BLOCK
      ?auto_256833 - BLOCK
      ?auto_256834 - BLOCK
      ?auto_256835 - BLOCK
      ?auto_256836 - BLOCK
      ?auto_256837 - BLOCK
      ?auto_256838 - BLOCK
      ?auto_256839 - BLOCK
      ?auto_256840 - BLOCK
      ?auto_256841 - BLOCK
      ?auto_256842 - BLOCK
    )
    :vars
    (
      ?auto_256843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256842 ?auto_256843 ) ( not ( = ?auto_256831 ?auto_256832 ) ) ( not ( = ?auto_256831 ?auto_256833 ) ) ( not ( = ?auto_256831 ?auto_256834 ) ) ( not ( = ?auto_256831 ?auto_256835 ) ) ( not ( = ?auto_256831 ?auto_256836 ) ) ( not ( = ?auto_256831 ?auto_256837 ) ) ( not ( = ?auto_256831 ?auto_256838 ) ) ( not ( = ?auto_256831 ?auto_256839 ) ) ( not ( = ?auto_256831 ?auto_256840 ) ) ( not ( = ?auto_256831 ?auto_256841 ) ) ( not ( = ?auto_256831 ?auto_256842 ) ) ( not ( = ?auto_256831 ?auto_256843 ) ) ( not ( = ?auto_256832 ?auto_256833 ) ) ( not ( = ?auto_256832 ?auto_256834 ) ) ( not ( = ?auto_256832 ?auto_256835 ) ) ( not ( = ?auto_256832 ?auto_256836 ) ) ( not ( = ?auto_256832 ?auto_256837 ) ) ( not ( = ?auto_256832 ?auto_256838 ) ) ( not ( = ?auto_256832 ?auto_256839 ) ) ( not ( = ?auto_256832 ?auto_256840 ) ) ( not ( = ?auto_256832 ?auto_256841 ) ) ( not ( = ?auto_256832 ?auto_256842 ) ) ( not ( = ?auto_256832 ?auto_256843 ) ) ( not ( = ?auto_256833 ?auto_256834 ) ) ( not ( = ?auto_256833 ?auto_256835 ) ) ( not ( = ?auto_256833 ?auto_256836 ) ) ( not ( = ?auto_256833 ?auto_256837 ) ) ( not ( = ?auto_256833 ?auto_256838 ) ) ( not ( = ?auto_256833 ?auto_256839 ) ) ( not ( = ?auto_256833 ?auto_256840 ) ) ( not ( = ?auto_256833 ?auto_256841 ) ) ( not ( = ?auto_256833 ?auto_256842 ) ) ( not ( = ?auto_256833 ?auto_256843 ) ) ( not ( = ?auto_256834 ?auto_256835 ) ) ( not ( = ?auto_256834 ?auto_256836 ) ) ( not ( = ?auto_256834 ?auto_256837 ) ) ( not ( = ?auto_256834 ?auto_256838 ) ) ( not ( = ?auto_256834 ?auto_256839 ) ) ( not ( = ?auto_256834 ?auto_256840 ) ) ( not ( = ?auto_256834 ?auto_256841 ) ) ( not ( = ?auto_256834 ?auto_256842 ) ) ( not ( = ?auto_256834 ?auto_256843 ) ) ( not ( = ?auto_256835 ?auto_256836 ) ) ( not ( = ?auto_256835 ?auto_256837 ) ) ( not ( = ?auto_256835 ?auto_256838 ) ) ( not ( = ?auto_256835 ?auto_256839 ) ) ( not ( = ?auto_256835 ?auto_256840 ) ) ( not ( = ?auto_256835 ?auto_256841 ) ) ( not ( = ?auto_256835 ?auto_256842 ) ) ( not ( = ?auto_256835 ?auto_256843 ) ) ( not ( = ?auto_256836 ?auto_256837 ) ) ( not ( = ?auto_256836 ?auto_256838 ) ) ( not ( = ?auto_256836 ?auto_256839 ) ) ( not ( = ?auto_256836 ?auto_256840 ) ) ( not ( = ?auto_256836 ?auto_256841 ) ) ( not ( = ?auto_256836 ?auto_256842 ) ) ( not ( = ?auto_256836 ?auto_256843 ) ) ( not ( = ?auto_256837 ?auto_256838 ) ) ( not ( = ?auto_256837 ?auto_256839 ) ) ( not ( = ?auto_256837 ?auto_256840 ) ) ( not ( = ?auto_256837 ?auto_256841 ) ) ( not ( = ?auto_256837 ?auto_256842 ) ) ( not ( = ?auto_256837 ?auto_256843 ) ) ( not ( = ?auto_256838 ?auto_256839 ) ) ( not ( = ?auto_256838 ?auto_256840 ) ) ( not ( = ?auto_256838 ?auto_256841 ) ) ( not ( = ?auto_256838 ?auto_256842 ) ) ( not ( = ?auto_256838 ?auto_256843 ) ) ( not ( = ?auto_256839 ?auto_256840 ) ) ( not ( = ?auto_256839 ?auto_256841 ) ) ( not ( = ?auto_256839 ?auto_256842 ) ) ( not ( = ?auto_256839 ?auto_256843 ) ) ( not ( = ?auto_256840 ?auto_256841 ) ) ( not ( = ?auto_256840 ?auto_256842 ) ) ( not ( = ?auto_256840 ?auto_256843 ) ) ( not ( = ?auto_256841 ?auto_256842 ) ) ( not ( = ?auto_256841 ?auto_256843 ) ) ( not ( = ?auto_256842 ?auto_256843 ) ) ( ON ?auto_256841 ?auto_256842 ) ( ON ?auto_256840 ?auto_256841 ) ( ON ?auto_256839 ?auto_256840 ) ( ON ?auto_256838 ?auto_256839 ) ( ON ?auto_256837 ?auto_256838 ) ( ON ?auto_256836 ?auto_256837 ) ( ON ?auto_256835 ?auto_256836 ) ( ON ?auto_256834 ?auto_256835 ) ( ON ?auto_256833 ?auto_256834 ) ( ON ?auto_256832 ?auto_256833 ) ( ON ?auto_256831 ?auto_256832 ) ( CLEAR ?auto_256831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_256831 )
      ( MAKE-12PILE ?auto_256831 ?auto_256832 ?auto_256833 ?auto_256834 ?auto_256835 ?auto_256836 ?auto_256837 ?auto_256838 ?auto_256839 ?auto_256840 ?auto_256841 ?auto_256842 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_256857 - BLOCK
      ?auto_256858 - BLOCK
      ?auto_256859 - BLOCK
      ?auto_256860 - BLOCK
      ?auto_256861 - BLOCK
      ?auto_256862 - BLOCK
      ?auto_256863 - BLOCK
      ?auto_256864 - BLOCK
      ?auto_256865 - BLOCK
      ?auto_256866 - BLOCK
      ?auto_256867 - BLOCK
      ?auto_256868 - BLOCK
      ?auto_256869 - BLOCK
    )
    :vars
    (
      ?auto_256870 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_256868 ) ( ON ?auto_256869 ?auto_256870 ) ( CLEAR ?auto_256869 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_256857 ) ( ON ?auto_256858 ?auto_256857 ) ( ON ?auto_256859 ?auto_256858 ) ( ON ?auto_256860 ?auto_256859 ) ( ON ?auto_256861 ?auto_256860 ) ( ON ?auto_256862 ?auto_256861 ) ( ON ?auto_256863 ?auto_256862 ) ( ON ?auto_256864 ?auto_256863 ) ( ON ?auto_256865 ?auto_256864 ) ( ON ?auto_256866 ?auto_256865 ) ( ON ?auto_256867 ?auto_256866 ) ( ON ?auto_256868 ?auto_256867 ) ( not ( = ?auto_256857 ?auto_256858 ) ) ( not ( = ?auto_256857 ?auto_256859 ) ) ( not ( = ?auto_256857 ?auto_256860 ) ) ( not ( = ?auto_256857 ?auto_256861 ) ) ( not ( = ?auto_256857 ?auto_256862 ) ) ( not ( = ?auto_256857 ?auto_256863 ) ) ( not ( = ?auto_256857 ?auto_256864 ) ) ( not ( = ?auto_256857 ?auto_256865 ) ) ( not ( = ?auto_256857 ?auto_256866 ) ) ( not ( = ?auto_256857 ?auto_256867 ) ) ( not ( = ?auto_256857 ?auto_256868 ) ) ( not ( = ?auto_256857 ?auto_256869 ) ) ( not ( = ?auto_256857 ?auto_256870 ) ) ( not ( = ?auto_256858 ?auto_256859 ) ) ( not ( = ?auto_256858 ?auto_256860 ) ) ( not ( = ?auto_256858 ?auto_256861 ) ) ( not ( = ?auto_256858 ?auto_256862 ) ) ( not ( = ?auto_256858 ?auto_256863 ) ) ( not ( = ?auto_256858 ?auto_256864 ) ) ( not ( = ?auto_256858 ?auto_256865 ) ) ( not ( = ?auto_256858 ?auto_256866 ) ) ( not ( = ?auto_256858 ?auto_256867 ) ) ( not ( = ?auto_256858 ?auto_256868 ) ) ( not ( = ?auto_256858 ?auto_256869 ) ) ( not ( = ?auto_256858 ?auto_256870 ) ) ( not ( = ?auto_256859 ?auto_256860 ) ) ( not ( = ?auto_256859 ?auto_256861 ) ) ( not ( = ?auto_256859 ?auto_256862 ) ) ( not ( = ?auto_256859 ?auto_256863 ) ) ( not ( = ?auto_256859 ?auto_256864 ) ) ( not ( = ?auto_256859 ?auto_256865 ) ) ( not ( = ?auto_256859 ?auto_256866 ) ) ( not ( = ?auto_256859 ?auto_256867 ) ) ( not ( = ?auto_256859 ?auto_256868 ) ) ( not ( = ?auto_256859 ?auto_256869 ) ) ( not ( = ?auto_256859 ?auto_256870 ) ) ( not ( = ?auto_256860 ?auto_256861 ) ) ( not ( = ?auto_256860 ?auto_256862 ) ) ( not ( = ?auto_256860 ?auto_256863 ) ) ( not ( = ?auto_256860 ?auto_256864 ) ) ( not ( = ?auto_256860 ?auto_256865 ) ) ( not ( = ?auto_256860 ?auto_256866 ) ) ( not ( = ?auto_256860 ?auto_256867 ) ) ( not ( = ?auto_256860 ?auto_256868 ) ) ( not ( = ?auto_256860 ?auto_256869 ) ) ( not ( = ?auto_256860 ?auto_256870 ) ) ( not ( = ?auto_256861 ?auto_256862 ) ) ( not ( = ?auto_256861 ?auto_256863 ) ) ( not ( = ?auto_256861 ?auto_256864 ) ) ( not ( = ?auto_256861 ?auto_256865 ) ) ( not ( = ?auto_256861 ?auto_256866 ) ) ( not ( = ?auto_256861 ?auto_256867 ) ) ( not ( = ?auto_256861 ?auto_256868 ) ) ( not ( = ?auto_256861 ?auto_256869 ) ) ( not ( = ?auto_256861 ?auto_256870 ) ) ( not ( = ?auto_256862 ?auto_256863 ) ) ( not ( = ?auto_256862 ?auto_256864 ) ) ( not ( = ?auto_256862 ?auto_256865 ) ) ( not ( = ?auto_256862 ?auto_256866 ) ) ( not ( = ?auto_256862 ?auto_256867 ) ) ( not ( = ?auto_256862 ?auto_256868 ) ) ( not ( = ?auto_256862 ?auto_256869 ) ) ( not ( = ?auto_256862 ?auto_256870 ) ) ( not ( = ?auto_256863 ?auto_256864 ) ) ( not ( = ?auto_256863 ?auto_256865 ) ) ( not ( = ?auto_256863 ?auto_256866 ) ) ( not ( = ?auto_256863 ?auto_256867 ) ) ( not ( = ?auto_256863 ?auto_256868 ) ) ( not ( = ?auto_256863 ?auto_256869 ) ) ( not ( = ?auto_256863 ?auto_256870 ) ) ( not ( = ?auto_256864 ?auto_256865 ) ) ( not ( = ?auto_256864 ?auto_256866 ) ) ( not ( = ?auto_256864 ?auto_256867 ) ) ( not ( = ?auto_256864 ?auto_256868 ) ) ( not ( = ?auto_256864 ?auto_256869 ) ) ( not ( = ?auto_256864 ?auto_256870 ) ) ( not ( = ?auto_256865 ?auto_256866 ) ) ( not ( = ?auto_256865 ?auto_256867 ) ) ( not ( = ?auto_256865 ?auto_256868 ) ) ( not ( = ?auto_256865 ?auto_256869 ) ) ( not ( = ?auto_256865 ?auto_256870 ) ) ( not ( = ?auto_256866 ?auto_256867 ) ) ( not ( = ?auto_256866 ?auto_256868 ) ) ( not ( = ?auto_256866 ?auto_256869 ) ) ( not ( = ?auto_256866 ?auto_256870 ) ) ( not ( = ?auto_256867 ?auto_256868 ) ) ( not ( = ?auto_256867 ?auto_256869 ) ) ( not ( = ?auto_256867 ?auto_256870 ) ) ( not ( = ?auto_256868 ?auto_256869 ) ) ( not ( = ?auto_256868 ?auto_256870 ) ) ( not ( = ?auto_256869 ?auto_256870 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_256869 ?auto_256870 )
      ( !STACK ?auto_256869 ?auto_256868 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_256884 - BLOCK
      ?auto_256885 - BLOCK
      ?auto_256886 - BLOCK
      ?auto_256887 - BLOCK
      ?auto_256888 - BLOCK
      ?auto_256889 - BLOCK
      ?auto_256890 - BLOCK
      ?auto_256891 - BLOCK
      ?auto_256892 - BLOCK
      ?auto_256893 - BLOCK
      ?auto_256894 - BLOCK
      ?auto_256895 - BLOCK
      ?auto_256896 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_256895 ) ( ON-TABLE ?auto_256896 ) ( CLEAR ?auto_256896 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_256884 ) ( ON ?auto_256885 ?auto_256884 ) ( ON ?auto_256886 ?auto_256885 ) ( ON ?auto_256887 ?auto_256886 ) ( ON ?auto_256888 ?auto_256887 ) ( ON ?auto_256889 ?auto_256888 ) ( ON ?auto_256890 ?auto_256889 ) ( ON ?auto_256891 ?auto_256890 ) ( ON ?auto_256892 ?auto_256891 ) ( ON ?auto_256893 ?auto_256892 ) ( ON ?auto_256894 ?auto_256893 ) ( ON ?auto_256895 ?auto_256894 ) ( not ( = ?auto_256884 ?auto_256885 ) ) ( not ( = ?auto_256884 ?auto_256886 ) ) ( not ( = ?auto_256884 ?auto_256887 ) ) ( not ( = ?auto_256884 ?auto_256888 ) ) ( not ( = ?auto_256884 ?auto_256889 ) ) ( not ( = ?auto_256884 ?auto_256890 ) ) ( not ( = ?auto_256884 ?auto_256891 ) ) ( not ( = ?auto_256884 ?auto_256892 ) ) ( not ( = ?auto_256884 ?auto_256893 ) ) ( not ( = ?auto_256884 ?auto_256894 ) ) ( not ( = ?auto_256884 ?auto_256895 ) ) ( not ( = ?auto_256884 ?auto_256896 ) ) ( not ( = ?auto_256885 ?auto_256886 ) ) ( not ( = ?auto_256885 ?auto_256887 ) ) ( not ( = ?auto_256885 ?auto_256888 ) ) ( not ( = ?auto_256885 ?auto_256889 ) ) ( not ( = ?auto_256885 ?auto_256890 ) ) ( not ( = ?auto_256885 ?auto_256891 ) ) ( not ( = ?auto_256885 ?auto_256892 ) ) ( not ( = ?auto_256885 ?auto_256893 ) ) ( not ( = ?auto_256885 ?auto_256894 ) ) ( not ( = ?auto_256885 ?auto_256895 ) ) ( not ( = ?auto_256885 ?auto_256896 ) ) ( not ( = ?auto_256886 ?auto_256887 ) ) ( not ( = ?auto_256886 ?auto_256888 ) ) ( not ( = ?auto_256886 ?auto_256889 ) ) ( not ( = ?auto_256886 ?auto_256890 ) ) ( not ( = ?auto_256886 ?auto_256891 ) ) ( not ( = ?auto_256886 ?auto_256892 ) ) ( not ( = ?auto_256886 ?auto_256893 ) ) ( not ( = ?auto_256886 ?auto_256894 ) ) ( not ( = ?auto_256886 ?auto_256895 ) ) ( not ( = ?auto_256886 ?auto_256896 ) ) ( not ( = ?auto_256887 ?auto_256888 ) ) ( not ( = ?auto_256887 ?auto_256889 ) ) ( not ( = ?auto_256887 ?auto_256890 ) ) ( not ( = ?auto_256887 ?auto_256891 ) ) ( not ( = ?auto_256887 ?auto_256892 ) ) ( not ( = ?auto_256887 ?auto_256893 ) ) ( not ( = ?auto_256887 ?auto_256894 ) ) ( not ( = ?auto_256887 ?auto_256895 ) ) ( not ( = ?auto_256887 ?auto_256896 ) ) ( not ( = ?auto_256888 ?auto_256889 ) ) ( not ( = ?auto_256888 ?auto_256890 ) ) ( not ( = ?auto_256888 ?auto_256891 ) ) ( not ( = ?auto_256888 ?auto_256892 ) ) ( not ( = ?auto_256888 ?auto_256893 ) ) ( not ( = ?auto_256888 ?auto_256894 ) ) ( not ( = ?auto_256888 ?auto_256895 ) ) ( not ( = ?auto_256888 ?auto_256896 ) ) ( not ( = ?auto_256889 ?auto_256890 ) ) ( not ( = ?auto_256889 ?auto_256891 ) ) ( not ( = ?auto_256889 ?auto_256892 ) ) ( not ( = ?auto_256889 ?auto_256893 ) ) ( not ( = ?auto_256889 ?auto_256894 ) ) ( not ( = ?auto_256889 ?auto_256895 ) ) ( not ( = ?auto_256889 ?auto_256896 ) ) ( not ( = ?auto_256890 ?auto_256891 ) ) ( not ( = ?auto_256890 ?auto_256892 ) ) ( not ( = ?auto_256890 ?auto_256893 ) ) ( not ( = ?auto_256890 ?auto_256894 ) ) ( not ( = ?auto_256890 ?auto_256895 ) ) ( not ( = ?auto_256890 ?auto_256896 ) ) ( not ( = ?auto_256891 ?auto_256892 ) ) ( not ( = ?auto_256891 ?auto_256893 ) ) ( not ( = ?auto_256891 ?auto_256894 ) ) ( not ( = ?auto_256891 ?auto_256895 ) ) ( not ( = ?auto_256891 ?auto_256896 ) ) ( not ( = ?auto_256892 ?auto_256893 ) ) ( not ( = ?auto_256892 ?auto_256894 ) ) ( not ( = ?auto_256892 ?auto_256895 ) ) ( not ( = ?auto_256892 ?auto_256896 ) ) ( not ( = ?auto_256893 ?auto_256894 ) ) ( not ( = ?auto_256893 ?auto_256895 ) ) ( not ( = ?auto_256893 ?auto_256896 ) ) ( not ( = ?auto_256894 ?auto_256895 ) ) ( not ( = ?auto_256894 ?auto_256896 ) ) ( not ( = ?auto_256895 ?auto_256896 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_256896 )
      ( !STACK ?auto_256896 ?auto_256895 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_256910 - BLOCK
      ?auto_256911 - BLOCK
      ?auto_256912 - BLOCK
      ?auto_256913 - BLOCK
      ?auto_256914 - BLOCK
      ?auto_256915 - BLOCK
      ?auto_256916 - BLOCK
      ?auto_256917 - BLOCK
      ?auto_256918 - BLOCK
      ?auto_256919 - BLOCK
      ?auto_256920 - BLOCK
      ?auto_256921 - BLOCK
      ?auto_256922 - BLOCK
    )
    :vars
    (
      ?auto_256923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256922 ?auto_256923 ) ( ON-TABLE ?auto_256910 ) ( ON ?auto_256911 ?auto_256910 ) ( ON ?auto_256912 ?auto_256911 ) ( ON ?auto_256913 ?auto_256912 ) ( ON ?auto_256914 ?auto_256913 ) ( ON ?auto_256915 ?auto_256914 ) ( ON ?auto_256916 ?auto_256915 ) ( ON ?auto_256917 ?auto_256916 ) ( ON ?auto_256918 ?auto_256917 ) ( ON ?auto_256919 ?auto_256918 ) ( ON ?auto_256920 ?auto_256919 ) ( not ( = ?auto_256910 ?auto_256911 ) ) ( not ( = ?auto_256910 ?auto_256912 ) ) ( not ( = ?auto_256910 ?auto_256913 ) ) ( not ( = ?auto_256910 ?auto_256914 ) ) ( not ( = ?auto_256910 ?auto_256915 ) ) ( not ( = ?auto_256910 ?auto_256916 ) ) ( not ( = ?auto_256910 ?auto_256917 ) ) ( not ( = ?auto_256910 ?auto_256918 ) ) ( not ( = ?auto_256910 ?auto_256919 ) ) ( not ( = ?auto_256910 ?auto_256920 ) ) ( not ( = ?auto_256910 ?auto_256921 ) ) ( not ( = ?auto_256910 ?auto_256922 ) ) ( not ( = ?auto_256910 ?auto_256923 ) ) ( not ( = ?auto_256911 ?auto_256912 ) ) ( not ( = ?auto_256911 ?auto_256913 ) ) ( not ( = ?auto_256911 ?auto_256914 ) ) ( not ( = ?auto_256911 ?auto_256915 ) ) ( not ( = ?auto_256911 ?auto_256916 ) ) ( not ( = ?auto_256911 ?auto_256917 ) ) ( not ( = ?auto_256911 ?auto_256918 ) ) ( not ( = ?auto_256911 ?auto_256919 ) ) ( not ( = ?auto_256911 ?auto_256920 ) ) ( not ( = ?auto_256911 ?auto_256921 ) ) ( not ( = ?auto_256911 ?auto_256922 ) ) ( not ( = ?auto_256911 ?auto_256923 ) ) ( not ( = ?auto_256912 ?auto_256913 ) ) ( not ( = ?auto_256912 ?auto_256914 ) ) ( not ( = ?auto_256912 ?auto_256915 ) ) ( not ( = ?auto_256912 ?auto_256916 ) ) ( not ( = ?auto_256912 ?auto_256917 ) ) ( not ( = ?auto_256912 ?auto_256918 ) ) ( not ( = ?auto_256912 ?auto_256919 ) ) ( not ( = ?auto_256912 ?auto_256920 ) ) ( not ( = ?auto_256912 ?auto_256921 ) ) ( not ( = ?auto_256912 ?auto_256922 ) ) ( not ( = ?auto_256912 ?auto_256923 ) ) ( not ( = ?auto_256913 ?auto_256914 ) ) ( not ( = ?auto_256913 ?auto_256915 ) ) ( not ( = ?auto_256913 ?auto_256916 ) ) ( not ( = ?auto_256913 ?auto_256917 ) ) ( not ( = ?auto_256913 ?auto_256918 ) ) ( not ( = ?auto_256913 ?auto_256919 ) ) ( not ( = ?auto_256913 ?auto_256920 ) ) ( not ( = ?auto_256913 ?auto_256921 ) ) ( not ( = ?auto_256913 ?auto_256922 ) ) ( not ( = ?auto_256913 ?auto_256923 ) ) ( not ( = ?auto_256914 ?auto_256915 ) ) ( not ( = ?auto_256914 ?auto_256916 ) ) ( not ( = ?auto_256914 ?auto_256917 ) ) ( not ( = ?auto_256914 ?auto_256918 ) ) ( not ( = ?auto_256914 ?auto_256919 ) ) ( not ( = ?auto_256914 ?auto_256920 ) ) ( not ( = ?auto_256914 ?auto_256921 ) ) ( not ( = ?auto_256914 ?auto_256922 ) ) ( not ( = ?auto_256914 ?auto_256923 ) ) ( not ( = ?auto_256915 ?auto_256916 ) ) ( not ( = ?auto_256915 ?auto_256917 ) ) ( not ( = ?auto_256915 ?auto_256918 ) ) ( not ( = ?auto_256915 ?auto_256919 ) ) ( not ( = ?auto_256915 ?auto_256920 ) ) ( not ( = ?auto_256915 ?auto_256921 ) ) ( not ( = ?auto_256915 ?auto_256922 ) ) ( not ( = ?auto_256915 ?auto_256923 ) ) ( not ( = ?auto_256916 ?auto_256917 ) ) ( not ( = ?auto_256916 ?auto_256918 ) ) ( not ( = ?auto_256916 ?auto_256919 ) ) ( not ( = ?auto_256916 ?auto_256920 ) ) ( not ( = ?auto_256916 ?auto_256921 ) ) ( not ( = ?auto_256916 ?auto_256922 ) ) ( not ( = ?auto_256916 ?auto_256923 ) ) ( not ( = ?auto_256917 ?auto_256918 ) ) ( not ( = ?auto_256917 ?auto_256919 ) ) ( not ( = ?auto_256917 ?auto_256920 ) ) ( not ( = ?auto_256917 ?auto_256921 ) ) ( not ( = ?auto_256917 ?auto_256922 ) ) ( not ( = ?auto_256917 ?auto_256923 ) ) ( not ( = ?auto_256918 ?auto_256919 ) ) ( not ( = ?auto_256918 ?auto_256920 ) ) ( not ( = ?auto_256918 ?auto_256921 ) ) ( not ( = ?auto_256918 ?auto_256922 ) ) ( not ( = ?auto_256918 ?auto_256923 ) ) ( not ( = ?auto_256919 ?auto_256920 ) ) ( not ( = ?auto_256919 ?auto_256921 ) ) ( not ( = ?auto_256919 ?auto_256922 ) ) ( not ( = ?auto_256919 ?auto_256923 ) ) ( not ( = ?auto_256920 ?auto_256921 ) ) ( not ( = ?auto_256920 ?auto_256922 ) ) ( not ( = ?auto_256920 ?auto_256923 ) ) ( not ( = ?auto_256921 ?auto_256922 ) ) ( not ( = ?auto_256921 ?auto_256923 ) ) ( not ( = ?auto_256922 ?auto_256923 ) ) ( CLEAR ?auto_256920 ) ( ON ?auto_256921 ?auto_256922 ) ( CLEAR ?auto_256921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_256910 ?auto_256911 ?auto_256912 ?auto_256913 ?auto_256914 ?auto_256915 ?auto_256916 ?auto_256917 ?auto_256918 ?auto_256919 ?auto_256920 ?auto_256921 )
      ( MAKE-13PILE ?auto_256910 ?auto_256911 ?auto_256912 ?auto_256913 ?auto_256914 ?auto_256915 ?auto_256916 ?auto_256917 ?auto_256918 ?auto_256919 ?auto_256920 ?auto_256921 ?auto_256922 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_256937 - BLOCK
      ?auto_256938 - BLOCK
      ?auto_256939 - BLOCK
      ?auto_256940 - BLOCK
      ?auto_256941 - BLOCK
      ?auto_256942 - BLOCK
      ?auto_256943 - BLOCK
      ?auto_256944 - BLOCK
      ?auto_256945 - BLOCK
      ?auto_256946 - BLOCK
      ?auto_256947 - BLOCK
      ?auto_256948 - BLOCK
      ?auto_256949 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_256949 ) ( ON-TABLE ?auto_256937 ) ( ON ?auto_256938 ?auto_256937 ) ( ON ?auto_256939 ?auto_256938 ) ( ON ?auto_256940 ?auto_256939 ) ( ON ?auto_256941 ?auto_256940 ) ( ON ?auto_256942 ?auto_256941 ) ( ON ?auto_256943 ?auto_256942 ) ( ON ?auto_256944 ?auto_256943 ) ( ON ?auto_256945 ?auto_256944 ) ( ON ?auto_256946 ?auto_256945 ) ( ON ?auto_256947 ?auto_256946 ) ( not ( = ?auto_256937 ?auto_256938 ) ) ( not ( = ?auto_256937 ?auto_256939 ) ) ( not ( = ?auto_256937 ?auto_256940 ) ) ( not ( = ?auto_256937 ?auto_256941 ) ) ( not ( = ?auto_256937 ?auto_256942 ) ) ( not ( = ?auto_256937 ?auto_256943 ) ) ( not ( = ?auto_256937 ?auto_256944 ) ) ( not ( = ?auto_256937 ?auto_256945 ) ) ( not ( = ?auto_256937 ?auto_256946 ) ) ( not ( = ?auto_256937 ?auto_256947 ) ) ( not ( = ?auto_256937 ?auto_256948 ) ) ( not ( = ?auto_256937 ?auto_256949 ) ) ( not ( = ?auto_256938 ?auto_256939 ) ) ( not ( = ?auto_256938 ?auto_256940 ) ) ( not ( = ?auto_256938 ?auto_256941 ) ) ( not ( = ?auto_256938 ?auto_256942 ) ) ( not ( = ?auto_256938 ?auto_256943 ) ) ( not ( = ?auto_256938 ?auto_256944 ) ) ( not ( = ?auto_256938 ?auto_256945 ) ) ( not ( = ?auto_256938 ?auto_256946 ) ) ( not ( = ?auto_256938 ?auto_256947 ) ) ( not ( = ?auto_256938 ?auto_256948 ) ) ( not ( = ?auto_256938 ?auto_256949 ) ) ( not ( = ?auto_256939 ?auto_256940 ) ) ( not ( = ?auto_256939 ?auto_256941 ) ) ( not ( = ?auto_256939 ?auto_256942 ) ) ( not ( = ?auto_256939 ?auto_256943 ) ) ( not ( = ?auto_256939 ?auto_256944 ) ) ( not ( = ?auto_256939 ?auto_256945 ) ) ( not ( = ?auto_256939 ?auto_256946 ) ) ( not ( = ?auto_256939 ?auto_256947 ) ) ( not ( = ?auto_256939 ?auto_256948 ) ) ( not ( = ?auto_256939 ?auto_256949 ) ) ( not ( = ?auto_256940 ?auto_256941 ) ) ( not ( = ?auto_256940 ?auto_256942 ) ) ( not ( = ?auto_256940 ?auto_256943 ) ) ( not ( = ?auto_256940 ?auto_256944 ) ) ( not ( = ?auto_256940 ?auto_256945 ) ) ( not ( = ?auto_256940 ?auto_256946 ) ) ( not ( = ?auto_256940 ?auto_256947 ) ) ( not ( = ?auto_256940 ?auto_256948 ) ) ( not ( = ?auto_256940 ?auto_256949 ) ) ( not ( = ?auto_256941 ?auto_256942 ) ) ( not ( = ?auto_256941 ?auto_256943 ) ) ( not ( = ?auto_256941 ?auto_256944 ) ) ( not ( = ?auto_256941 ?auto_256945 ) ) ( not ( = ?auto_256941 ?auto_256946 ) ) ( not ( = ?auto_256941 ?auto_256947 ) ) ( not ( = ?auto_256941 ?auto_256948 ) ) ( not ( = ?auto_256941 ?auto_256949 ) ) ( not ( = ?auto_256942 ?auto_256943 ) ) ( not ( = ?auto_256942 ?auto_256944 ) ) ( not ( = ?auto_256942 ?auto_256945 ) ) ( not ( = ?auto_256942 ?auto_256946 ) ) ( not ( = ?auto_256942 ?auto_256947 ) ) ( not ( = ?auto_256942 ?auto_256948 ) ) ( not ( = ?auto_256942 ?auto_256949 ) ) ( not ( = ?auto_256943 ?auto_256944 ) ) ( not ( = ?auto_256943 ?auto_256945 ) ) ( not ( = ?auto_256943 ?auto_256946 ) ) ( not ( = ?auto_256943 ?auto_256947 ) ) ( not ( = ?auto_256943 ?auto_256948 ) ) ( not ( = ?auto_256943 ?auto_256949 ) ) ( not ( = ?auto_256944 ?auto_256945 ) ) ( not ( = ?auto_256944 ?auto_256946 ) ) ( not ( = ?auto_256944 ?auto_256947 ) ) ( not ( = ?auto_256944 ?auto_256948 ) ) ( not ( = ?auto_256944 ?auto_256949 ) ) ( not ( = ?auto_256945 ?auto_256946 ) ) ( not ( = ?auto_256945 ?auto_256947 ) ) ( not ( = ?auto_256945 ?auto_256948 ) ) ( not ( = ?auto_256945 ?auto_256949 ) ) ( not ( = ?auto_256946 ?auto_256947 ) ) ( not ( = ?auto_256946 ?auto_256948 ) ) ( not ( = ?auto_256946 ?auto_256949 ) ) ( not ( = ?auto_256947 ?auto_256948 ) ) ( not ( = ?auto_256947 ?auto_256949 ) ) ( not ( = ?auto_256948 ?auto_256949 ) ) ( CLEAR ?auto_256947 ) ( ON ?auto_256948 ?auto_256949 ) ( CLEAR ?auto_256948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_256937 ?auto_256938 ?auto_256939 ?auto_256940 ?auto_256941 ?auto_256942 ?auto_256943 ?auto_256944 ?auto_256945 ?auto_256946 ?auto_256947 ?auto_256948 )
      ( MAKE-13PILE ?auto_256937 ?auto_256938 ?auto_256939 ?auto_256940 ?auto_256941 ?auto_256942 ?auto_256943 ?auto_256944 ?auto_256945 ?auto_256946 ?auto_256947 ?auto_256948 ?auto_256949 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_256963 - BLOCK
      ?auto_256964 - BLOCK
      ?auto_256965 - BLOCK
      ?auto_256966 - BLOCK
      ?auto_256967 - BLOCK
      ?auto_256968 - BLOCK
      ?auto_256969 - BLOCK
      ?auto_256970 - BLOCK
      ?auto_256971 - BLOCK
      ?auto_256972 - BLOCK
      ?auto_256973 - BLOCK
      ?auto_256974 - BLOCK
      ?auto_256975 - BLOCK
    )
    :vars
    (
      ?auto_256976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256975 ?auto_256976 ) ( ON-TABLE ?auto_256963 ) ( ON ?auto_256964 ?auto_256963 ) ( ON ?auto_256965 ?auto_256964 ) ( ON ?auto_256966 ?auto_256965 ) ( ON ?auto_256967 ?auto_256966 ) ( ON ?auto_256968 ?auto_256967 ) ( ON ?auto_256969 ?auto_256968 ) ( ON ?auto_256970 ?auto_256969 ) ( ON ?auto_256971 ?auto_256970 ) ( ON ?auto_256972 ?auto_256971 ) ( not ( = ?auto_256963 ?auto_256964 ) ) ( not ( = ?auto_256963 ?auto_256965 ) ) ( not ( = ?auto_256963 ?auto_256966 ) ) ( not ( = ?auto_256963 ?auto_256967 ) ) ( not ( = ?auto_256963 ?auto_256968 ) ) ( not ( = ?auto_256963 ?auto_256969 ) ) ( not ( = ?auto_256963 ?auto_256970 ) ) ( not ( = ?auto_256963 ?auto_256971 ) ) ( not ( = ?auto_256963 ?auto_256972 ) ) ( not ( = ?auto_256963 ?auto_256973 ) ) ( not ( = ?auto_256963 ?auto_256974 ) ) ( not ( = ?auto_256963 ?auto_256975 ) ) ( not ( = ?auto_256963 ?auto_256976 ) ) ( not ( = ?auto_256964 ?auto_256965 ) ) ( not ( = ?auto_256964 ?auto_256966 ) ) ( not ( = ?auto_256964 ?auto_256967 ) ) ( not ( = ?auto_256964 ?auto_256968 ) ) ( not ( = ?auto_256964 ?auto_256969 ) ) ( not ( = ?auto_256964 ?auto_256970 ) ) ( not ( = ?auto_256964 ?auto_256971 ) ) ( not ( = ?auto_256964 ?auto_256972 ) ) ( not ( = ?auto_256964 ?auto_256973 ) ) ( not ( = ?auto_256964 ?auto_256974 ) ) ( not ( = ?auto_256964 ?auto_256975 ) ) ( not ( = ?auto_256964 ?auto_256976 ) ) ( not ( = ?auto_256965 ?auto_256966 ) ) ( not ( = ?auto_256965 ?auto_256967 ) ) ( not ( = ?auto_256965 ?auto_256968 ) ) ( not ( = ?auto_256965 ?auto_256969 ) ) ( not ( = ?auto_256965 ?auto_256970 ) ) ( not ( = ?auto_256965 ?auto_256971 ) ) ( not ( = ?auto_256965 ?auto_256972 ) ) ( not ( = ?auto_256965 ?auto_256973 ) ) ( not ( = ?auto_256965 ?auto_256974 ) ) ( not ( = ?auto_256965 ?auto_256975 ) ) ( not ( = ?auto_256965 ?auto_256976 ) ) ( not ( = ?auto_256966 ?auto_256967 ) ) ( not ( = ?auto_256966 ?auto_256968 ) ) ( not ( = ?auto_256966 ?auto_256969 ) ) ( not ( = ?auto_256966 ?auto_256970 ) ) ( not ( = ?auto_256966 ?auto_256971 ) ) ( not ( = ?auto_256966 ?auto_256972 ) ) ( not ( = ?auto_256966 ?auto_256973 ) ) ( not ( = ?auto_256966 ?auto_256974 ) ) ( not ( = ?auto_256966 ?auto_256975 ) ) ( not ( = ?auto_256966 ?auto_256976 ) ) ( not ( = ?auto_256967 ?auto_256968 ) ) ( not ( = ?auto_256967 ?auto_256969 ) ) ( not ( = ?auto_256967 ?auto_256970 ) ) ( not ( = ?auto_256967 ?auto_256971 ) ) ( not ( = ?auto_256967 ?auto_256972 ) ) ( not ( = ?auto_256967 ?auto_256973 ) ) ( not ( = ?auto_256967 ?auto_256974 ) ) ( not ( = ?auto_256967 ?auto_256975 ) ) ( not ( = ?auto_256967 ?auto_256976 ) ) ( not ( = ?auto_256968 ?auto_256969 ) ) ( not ( = ?auto_256968 ?auto_256970 ) ) ( not ( = ?auto_256968 ?auto_256971 ) ) ( not ( = ?auto_256968 ?auto_256972 ) ) ( not ( = ?auto_256968 ?auto_256973 ) ) ( not ( = ?auto_256968 ?auto_256974 ) ) ( not ( = ?auto_256968 ?auto_256975 ) ) ( not ( = ?auto_256968 ?auto_256976 ) ) ( not ( = ?auto_256969 ?auto_256970 ) ) ( not ( = ?auto_256969 ?auto_256971 ) ) ( not ( = ?auto_256969 ?auto_256972 ) ) ( not ( = ?auto_256969 ?auto_256973 ) ) ( not ( = ?auto_256969 ?auto_256974 ) ) ( not ( = ?auto_256969 ?auto_256975 ) ) ( not ( = ?auto_256969 ?auto_256976 ) ) ( not ( = ?auto_256970 ?auto_256971 ) ) ( not ( = ?auto_256970 ?auto_256972 ) ) ( not ( = ?auto_256970 ?auto_256973 ) ) ( not ( = ?auto_256970 ?auto_256974 ) ) ( not ( = ?auto_256970 ?auto_256975 ) ) ( not ( = ?auto_256970 ?auto_256976 ) ) ( not ( = ?auto_256971 ?auto_256972 ) ) ( not ( = ?auto_256971 ?auto_256973 ) ) ( not ( = ?auto_256971 ?auto_256974 ) ) ( not ( = ?auto_256971 ?auto_256975 ) ) ( not ( = ?auto_256971 ?auto_256976 ) ) ( not ( = ?auto_256972 ?auto_256973 ) ) ( not ( = ?auto_256972 ?auto_256974 ) ) ( not ( = ?auto_256972 ?auto_256975 ) ) ( not ( = ?auto_256972 ?auto_256976 ) ) ( not ( = ?auto_256973 ?auto_256974 ) ) ( not ( = ?auto_256973 ?auto_256975 ) ) ( not ( = ?auto_256973 ?auto_256976 ) ) ( not ( = ?auto_256974 ?auto_256975 ) ) ( not ( = ?auto_256974 ?auto_256976 ) ) ( not ( = ?auto_256975 ?auto_256976 ) ) ( ON ?auto_256974 ?auto_256975 ) ( CLEAR ?auto_256972 ) ( ON ?auto_256973 ?auto_256974 ) ( CLEAR ?auto_256973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_256963 ?auto_256964 ?auto_256965 ?auto_256966 ?auto_256967 ?auto_256968 ?auto_256969 ?auto_256970 ?auto_256971 ?auto_256972 ?auto_256973 )
      ( MAKE-13PILE ?auto_256963 ?auto_256964 ?auto_256965 ?auto_256966 ?auto_256967 ?auto_256968 ?auto_256969 ?auto_256970 ?auto_256971 ?auto_256972 ?auto_256973 ?auto_256974 ?auto_256975 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_256990 - BLOCK
      ?auto_256991 - BLOCK
      ?auto_256992 - BLOCK
      ?auto_256993 - BLOCK
      ?auto_256994 - BLOCK
      ?auto_256995 - BLOCK
      ?auto_256996 - BLOCK
      ?auto_256997 - BLOCK
      ?auto_256998 - BLOCK
      ?auto_256999 - BLOCK
      ?auto_257000 - BLOCK
      ?auto_257001 - BLOCK
      ?auto_257002 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_257002 ) ( ON-TABLE ?auto_256990 ) ( ON ?auto_256991 ?auto_256990 ) ( ON ?auto_256992 ?auto_256991 ) ( ON ?auto_256993 ?auto_256992 ) ( ON ?auto_256994 ?auto_256993 ) ( ON ?auto_256995 ?auto_256994 ) ( ON ?auto_256996 ?auto_256995 ) ( ON ?auto_256997 ?auto_256996 ) ( ON ?auto_256998 ?auto_256997 ) ( ON ?auto_256999 ?auto_256998 ) ( not ( = ?auto_256990 ?auto_256991 ) ) ( not ( = ?auto_256990 ?auto_256992 ) ) ( not ( = ?auto_256990 ?auto_256993 ) ) ( not ( = ?auto_256990 ?auto_256994 ) ) ( not ( = ?auto_256990 ?auto_256995 ) ) ( not ( = ?auto_256990 ?auto_256996 ) ) ( not ( = ?auto_256990 ?auto_256997 ) ) ( not ( = ?auto_256990 ?auto_256998 ) ) ( not ( = ?auto_256990 ?auto_256999 ) ) ( not ( = ?auto_256990 ?auto_257000 ) ) ( not ( = ?auto_256990 ?auto_257001 ) ) ( not ( = ?auto_256990 ?auto_257002 ) ) ( not ( = ?auto_256991 ?auto_256992 ) ) ( not ( = ?auto_256991 ?auto_256993 ) ) ( not ( = ?auto_256991 ?auto_256994 ) ) ( not ( = ?auto_256991 ?auto_256995 ) ) ( not ( = ?auto_256991 ?auto_256996 ) ) ( not ( = ?auto_256991 ?auto_256997 ) ) ( not ( = ?auto_256991 ?auto_256998 ) ) ( not ( = ?auto_256991 ?auto_256999 ) ) ( not ( = ?auto_256991 ?auto_257000 ) ) ( not ( = ?auto_256991 ?auto_257001 ) ) ( not ( = ?auto_256991 ?auto_257002 ) ) ( not ( = ?auto_256992 ?auto_256993 ) ) ( not ( = ?auto_256992 ?auto_256994 ) ) ( not ( = ?auto_256992 ?auto_256995 ) ) ( not ( = ?auto_256992 ?auto_256996 ) ) ( not ( = ?auto_256992 ?auto_256997 ) ) ( not ( = ?auto_256992 ?auto_256998 ) ) ( not ( = ?auto_256992 ?auto_256999 ) ) ( not ( = ?auto_256992 ?auto_257000 ) ) ( not ( = ?auto_256992 ?auto_257001 ) ) ( not ( = ?auto_256992 ?auto_257002 ) ) ( not ( = ?auto_256993 ?auto_256994 ) ) ( not ( = ?auto_256993 ?auto_256995 ) ) ( not ( = ?auto_256993 ?auto_256996 ) ) ( not ( = ?auto_256993 ?auto_256997 ) ) ( not ( = ?auto_256993 ?auto_256998 ) ) ( not ( = ?auto_256993 ?auto_256999 ) ) ( not ( = ?auto_256993 ?auto_257000 ) ) ( not ( = ?auto_256993 ?auto_257001 ) ) ( not ( = ?auto_256993 ?auto_257002 ) ) ( not ( = ?auto_256994 ?auto_256995 ) ) ( not ( = ?auto_256994 ?auto_256996 ) ) ( not ( = ?auto_256994 ?auto_256997 ) ) ( not ( = ?auto_256994 ?auto_256998 ) ) ( not ( = ?auto_256994 ?auto_256999 ) ) ( not ( = ?auto_256994 ?auto_257000 ) ) ( not ( = ?auto_256994 ?auto_257001 ) ) ( not ( = ?auto_256994 ?auto_257002 ) ) ( not ( = ?auto_256995 ?auto_256996 ) ) ( not ( = ?auto_256995 ?auto_256997 ) ) ( not ( = ?auto_256995 ?auto_256998 ) ) ( not ( = ?auto_256995 ?auto_256999 ) ) ( not ( = ?auto_256995 ?auto_257000 ) ) ( not ( = ?auto_256995 ?auto_257001 ) ) ( not ( = ?auto_256995 ?auto_257002 ) ) ( not ( = ?auto_256996 ?auto_256997 ) ) ( not ( = ?auto_256996 ?auto_256998 ) ) ( not ( = ?auto_256996 ?auto_256999 ) ) ( not ( = ?auto_256996 ?auto_257000 ) ) ( not ( = ?auto_256996 ?auto_257001 ) ) ( not ( = ?auto_256996 ?auto_257002 ) ) ( not ( = ?auto_256997 ?auto_256998 ) ) ( not ( = ?auto_256997 ?auto_256999 ) ) ( not ( = ?auto_256997 ?auto_257000 ) ) ( not ( = ?auto_256997 ?auto_257001 ) ) ( not ( = ?auto_256997 ?auto_257002 ) ) ( not ( = ?auto_256998 ?auto_256999 ) ) ( not ( = ?auto_256998 ?auto_257000 ) ) ( not ( = ?auto_256998 ?auto_257001 ) ) ( not ( = ?auto_256998 ?auto_257002 ) ) ( not ( = ?auto_256999 ?auto_257000 ) ) ( not ( = ?auto_256999 ?auto_257001 ) ) ( not ( = ?auto_256999 ?auto_257002 ) ) ( not ( = ?auto_257000 ?auto_257001 ) ) ( not ( = ?auto_257000 ?auto_257002 ) ) ( not ( = ?auto_257001 ?auto_257002 ) ) ( ON ?auto_257001 ?auto_257002 ) ( CLEAR ?auto_256999 ) ( ON ?auto_257000 ?auto_257001 ) ( CLEAR ?auto_257000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_256990 ?auto_256991 ?auto_256992 ?auto_256993 ?auto_256994 ?auto_256995 ?auto_256996 ?auto_256997 ?auto_256998 ?auto_256999 ?auto_257000 )
      ( MAKE-13PILE ?auto_256990 ?auto_256991 ?auto_256992 ?auto_256993 ?auto_256994 ?auto_256995 ?auto_256996 ?auto_256997 ?auto_256998 ?auto_256999 ?auto_257000 ?auto_257001 ?auto_257002 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_257016 - BLOCK
      ?auto_257017 - BLOCK
      ?auto_257018 - BLOCK
      ?auto_257019 - BLOCK
      ?auto_257020 - BLOCK
      ?auto_257021 - BLOCK
      ?auto_257022 - BLOCK
      ?auto_257023 - BLOCK
      ?auto_257024 - BLOCK
      ?auto_257025 - BLOCK
      ?auto_257026 - BLOCK
      ?auto_257027 - BLOCK
      ?auto_257028 - BLOCK
    )
    :vars
    (
      ?auto_257029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257028 ?auto_257029 ) ( ON-TABLE ?auto_257016 ) ( ON ?auto_257017 ?auto_257016 ) ( ON ?auto_257018 ?auto_257017 ) ( ON ?auto_257019 ?auto_257018 ) ( ON ?auto_257020 ?auto_257019 ) ( ON ?auto_257021 ?auto_257020 ) ( ON ?auto_257022 ?auto_257021 ) ( ON ?auto_257023 ?auto_257022 ) ( ON ?auto_257024 ?auto_257023 ) ( not ( = ?auto_257016 ?auto_257017 ) ) ( not ( = ?auto_257016 ?auto_257018 ) ) ( not ( = ?auto_257016 ?auto_257019 ) ) ( not ( = ?auto_257016 ?auto_257020 ) ) ( not ( = ?auto_257016 ?auto_257021 ) ) ( not ( = ?auto_257016 ?auto_257022 ) ) ( not ( = ?auto_257016 ?auto_257023 ) ) ( not ( = ?auto_257016 ?auto_257024 ) ) ( not ( = ?auto_257016 ?auto_257025 ) ) ( not ( = ?auto_257016 ?auto_257026 ) ) ( not ( = ?auto_257016 ?auto_257027 ) ) ( not ( = ?auto_257016 ?auto_257028 ) ) ( not ( = ?auto_257016 ?auto_257029 ) ) ( not ( = ?auto_257017 ?auto_257018 ) ) ( not ( = ?auto_257017 ?auto_257019 ) ) ( not ( = ?auto_257017 ?auto_257020 ) ) ( not ( = ?auto_257017 ?auto_257021 ) ) ( not ( = ?auto_257017 ?auto_257022 ) ) ( not ( = ?auto_257017 ?auto_257023 ) ) ( not ( = ?auto_257017 ?auto_257024 ) ) ( not ( = ?auto_257017 ?auto_257025 ) ) ( not ( = ?auto_257017 ?auto_257026 ) ) ( not ( = ?auto_257017 ?auto_257027 ) ) ( not ( = ?auto_257017 ?auto_257028 ) ) ( not ( = ?auto_257017 ?auto_257029 ) ) ( not ( = ?auto_257018 ?auto_257019 ) ) ( not ( = ?auto_257018 ?auto_257020 ) ) ( not ( = ?auto_257018 ?auto_257021 ) ) ( not ( = ?auto_257018 ?auto_257022 ) ) ( not ( = ?auto_257018 ?auto_257023 ) ) ( not ( = ?auto_257018 ?auto_257024 ) ) ( not ( = ?auto_257018 ?auto_257025 ) ) ( not ( = ?auto_257018 ?auto_257026 ) ) ( not ( = ?auto_257018 ?auto_257027 ) ) ( not ( = ?auto_257018 ?auto_257028 ) ) ( not ( = ?auto_257018 ?auto_257029 ) ) ( not ( = ?auto_257019 ?auto_257020 ) ) ( not ( = ?auto_257019 ?auto_257021 ) ) ( not ( = ?auto_257019 ?auto_257022 ) ) ( not ( = ?auto_257019 ?auto_257023 ) ) ( not ( = ?auto_257019 ?auto_257024 ) ) ( not ( = ?auto_257019 ?auto_257025 ) ) ( not ( = ?auto_257019 ?auto_257026 ) ) ( not ( = ?auto_257019 ?auto_257027 ) ) ( not ( = ?auto_257019 ?auto_257028 ) ) ( not ( = ?auto_257019 ?auto_257029 ) ) ( not ( = ?auto_257020 ?auto_257021 ) ) ( not ( = ?auto_257020 ?auto_257022 ) ) ( not ( = ?auto_257020 ?auto_257023 ) ) ( not ( = ?auto_257020 ?auto_257024 ) ) ( not ( = ?auto_257020 ?auto_257025 ) ) ( not ( = ?auto_257020 ?auto_257026 ) ) ( not ( = ?auto_257020 ?auto_257027 ) ) ( not ( = ?auto_257020 ?auto_257028 ) ) ( not ( = ?auto_257020 ?auto_257029 ) ) ( not ( = ?auto_257021 ?auto_257022 ) ) ( not ( = ?auto_257021 ?auto_257023 ) ) ( not ( = ?auto_257021 ?auto_257024 ) ) ( not ( = ?auto_257021 ?auto_257025 ) ) ( not ( = ?auto_257021 ?auto_257026 ) ) ( not ( = ?auto_257021 ?auto_257027 ) ) ( not ( = ?auto_257021 ?auto_257028 ) ) ( not ( = ?auto_257021 ?auto_257029 ) ) ( not ( = ?auto_257022 ?auto_257023 ) ) ( not ( = ?auto_257022 ?auto_257024 ) ) ( not ( = ?auto_257022 ?auto_257025 ) ) ( not ( = ?auto_257022 ?auto_257026 ) ) ( not ( = ?auto_257022 ?auto_257027 ) ) ( not ( = ?auto_257022 ?auto_257028 ) ) ( not ( = ?auto_257022 ?auto_257029 ) ) ( not ( = ?auto_257023 ?auto_257024 ) ) ( not ( = ?auto_257023 ?auto_257025 ) ) ( not ( = ?auto_257023 ?auto_257026 ) ) ( not ( = ?auto_257023 ?auto_257027 ) ) ( not ( = ?auto_257023 ?auto_257028 ) ) ( not ( = ?auto_257023 ?auto_257029 ) ) ( not ( = ?auto_257024 ?auto_257025 ) ) ( not ( = ?auto_257024 ?auto_257026 ) ) ( not ( = ?auto_257024 ?auto_257027 ) ) ( not ( = ?auto_257024 ?auto_257028 ) ) ( not ( = ?auto_257024 ?auto_257029 ) ) ( not ( = ?auto_257025 ?auto_257026 ) ) ( not ( = ?auto_257025 ?auto_257027 ) ) ( not ( = ?auto_257025 ?auto_257028 ) ) ( not ( = ?auto_257025 ?auto_257029 ) ) ( not ( = ?auto_257026 ?auto_257027 ) ) ( not ( = ?auto_257026 ?auto_257028 ) ) ( not ( = ?auto_257026 ?auto_257029 ) ) ( not ( = ?auto_257027 ?auto_257028 ) ) ( not ( = ?auto_257027 ?auto_257029 ) ) ( not ( = ?auto_257028 ?auto_257029 ) ) ( ON ?auto_257027 ?auto_257028 ) ( ON ?auto_257026 ?auto_257027 ) ( CLEAR ?auto_257024 ) ( ON ?auto_257025 ?auto_257026 ) ( CLEAR ?auto_257025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_257016 ?auto_257017 ?auto_257018 ?auto_257019 ?auto_257020 ?auto_257021 ?auto_257022 ?auto_257023 ?auto_257024 ?auto_257025 )
      ( MAKE-13PILE ?auto_257016 ?auto_257017 ?auto_257018 ?auto_257019 ?auto_257020 ?auto_257021 ?auto_257022 ?auto_257023 ?auto_257024 ?auto_257025 ?auto_257026 ?auto_257027 ?auto_257028 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_257043 - BLOCK
      ?auto_257044 - BLOCK
      ?auto_257045 - BLOCK
      ?auto_257046 - BLOCK
      ?auto_257047 - BLOCK
      ?auto_257048 - BLOCK
      ?auto_257049 - BLOCK
      ?auto_257050 - BLOCK
      ?auto_257051 - BLOCK
      ?auto_257052 - BLOCK
      ?auto_257053 - BLOCK
      ?auto_257054 - BLOCK
      ?auto_257055 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_257055 ) ( ON-TABLE ?auto_257043 ) ( ON ?auto_257044 ?auto_257043 ) ( ON ?auto_257045 ?auto_257044 ) ( ON ?auto_257046 ?auto_257045 ) ( ON ?auto_257047 ?auto_257046 ) ( ON ?auto_257048 ?auto_257047 ) ( ON ?auto_257049 ?auto_257048 ) ( ON ?auto_257050 ?auto_257049 ) ( ON ?auto_257051 ?auto_257050 ) ( not ( = ?auto_257043 ?auto_257044 ) ) ( not ( = ?auto_257043 ?auto_257045 ) ) ( not ( = ?auto_257043 ?auto_257046 ) ) ( not ( = ?auto_257043 ?auto_257047 ) ) ( not ( = ?auto_257043 ?auto_257048 ) ) ( not ( = ?auto_257043 ?auto_257049 ) ) ( not ( = ?auto_257043 ?auto_257050 ) ) ( not ( = ?auto_257043 ?auto_257051 ) ) ( not ( = ?auto_257043 ?auto_257052 ) ) ( not ( = ?auto_257043 ?auto_257053 ) ) ( not ( = ?auto_257043 ?auto_257054 ) ) ( not ( = ?auto_257043 ?auto_257055 ) ) ( not ( = ?auto_257044 ?auto_257045 ) ) ( not ( = ?auto_257044 ?auto_257046 ) ) ( not ( = ?auto_257044 ?auto_257047 ) ) ( not ( = ?auto_257044 ?auto_257048 ) ) ( not ( = ?auto_257044 ?auto_257049 ) ) ( not ( = ?auto_257044 ?auto_257050 ) ) ( not ( = ?auto_257044 ?auto_257051 ) ) ( not ( = ?auto_257044 ?auto_257052 ) ) ( not ( = ?auto_257044 ?auto_257053 ) ) ( not ( = ?auto_257044 ?auto_257054 ) ) ( not ( = ?auto_257044 ?auto_257055 ) ) ( not ( = ?auto_257045 ?auto_257046 ) ) ( not ( = ?auto_257045 ?auto_257047 ) ) ( not ( = ?auto_257045 ?auto_257048 ) ) ( not ( = ?auto_257045 ?auto_257049 ) ) ( not ( = ?auto_257045 ?auto_257050 ) ) ( not ( = ?auto_257045 ?auto_257051 ) ) ( not ( = ?auto_257045 ?auto_257052 ) ) ( not ( = ?auto_257045 ?auto_257053 ) ) ( not ( = ?auto_257045 ?auto_257054 ) ) ( not ( = ?auto_257045 ?auto_257055 ) ) ( not ( = ?auto_257046 ?auto_257047 ) ) ( not ( = ?auto_257046 ?auto_257048 ) ) ( not ( = ?auto_257046 ?auto_257049 ) ) ( not ( = ?auto_257046 ?auto_257050 ) ) ( not ( = ?auto_257046 ?auto_257051 ) ) ( not ( = ?auto_257046 ?auto_257052 ) ) ( not ( = ?auto_257046 ?auto_257053 ) ) ( not ( = ?auto_257046 ?auto_257054 ) ) ( not ( = ?auto_257046 ?auto_257055 ) ) ( not ( = ?auto_257047 ?auto_257048 ) ) ( not ( = ?auto_257047 ?auto_257049 ) ) ( not ( = ?auto_257047 ?auto_257050 ) ) ( not ( = ?auto_257047 ?auto_257051 ) ) ( not ( = ?auto_257047 ?auto_257052 ) ) ( not ( = ?auto_257047 ?auto_257053 ) ) ( not ( = ?auto_257047 ?auto_257054 ) ) ( not ( = ?auto_257047 ?auto_257055 ) ) ( not ( = ?auto_257048 ?auto_257049 ) ) ( not ( = ?auto_257048 ?auto_257050 ) ) ( not ( = ?auto_257048 ?auto_257051 ) ) ( not ( = ?auto_257048 ?auto_257052 ) ) ( not ( = ?auto_257048 ?auto_257053 ) ) ( not ( = ?auto_257048 ?auto_257054 ) ) ( not ( = ?auto_257048 ?auto_257055 ) ) ( not ( = ?auto_257049 ?auto_257050 ) ) ( not ( = ?auto_257049 ?auto_257051 ) ) ( not ( = ?auto_257049 ?auto_257052 ) ) ( not ( = ?auto_257049 ?auto_257053 ) ) ( not ( = ?auto_257049 ?auto_257054 ) ) ( not ( = ?auto_257049 ?auto_257055 ) ) ( not ( = ?auto_257050 ?auto_257051 ) ) ( not ( = ?auto_257050 ?auto_257052 ) ) ( not ( = ?auto_257050 ?auto_257053 ) ) ( not ( = ?auto_257050 ?auto_257054 ) ) ( not ( = ?auto_257050 ?auto_257055 ) ) ( not ( = ?auto_257051 ?auto_257052 ) ) ( not ( = ?auto_257051 ?auto_257053 ) ) ( not ( = ?auto_257051 ?auto_257054 ) ) ( not ( = ?auto_257051 ?auto_257055 ) ) ( not ( = ?auto_257052 ?auto_257053 ) ) ( not ( = ?auto_257052 ?auto_257054 ) ) ( not ( = ?auto_257052 ?auto_257055 ) ) ( not ( = ?auto_257053 ?auto_257054 ) ) ( not ( = ?auto_257053 ?auto_257055 ) ) ( not ( = ?auto_257054 ?auto_257055 ) ) ( ON ?auto_257054 ?auto_257055 ) ( ON ?auto_257053 ?auto_257054 ) ( CLEAR ?auto_257051 ) ( ON ?auto_257052 ?auto_257053 ) ( CLEAR ?auto_257052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_257043 ?auto_257044 ?auto_257045 ?auto_257046 ?auto_257047 ?auto_257048 ?auto_257049 ?auto_257050 ?auto_257051 ?auto_257052 )
      ( MAKE-13PILE ?auto_257043 ?auto_257044 ?auto_257045 ?auto_257046 ?auto_257047 ?auto_257048 ?auto_257049 ?auto_257050 ?auto_257051 ?auto_257052 ?auto_257053 ?auto_257054 ?auto_257055 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_257069 - BLOCK
      ?auto_257070 - BLOCK
      ?auto_257071 - BLOCK
      ?auto_257072 - BLOCK
      ?auto_257073 - BLOCK
      ?auto_257074 - BLOCK
      ?auto_257075 - BLOCK
      ?auto_257076 - BLOCK
      ?auto_257077 - BLOCK
      ?auto_257078 - BLOCK
      ?auto_257079 - BLOCK
      ?auto_257080 - BLOCK
      ?auto_257081 - BLOCK
    )
    :vars
    (
      ?auto_257082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257081 ?auto_257082 ) ( ON-TABLE ?auto_257069 ) ( ON ?auto_257070 ?auto_257069 ) ( ON ?auto_257071 ?auto_257070 ) ( ON ?auto_257072 ?auto_257071 ) ( ON ?auto_257073 ?auto_257072 ) ( ON ?auto_257074 ?auto_257073 ) ( ON ?auto_257075 ?auto_257074 ) ( ON ?auto_257076 ?auto_257075 ) ( not ( = ?auto_257069 ?auto_257070 ) ) ( not ( = ?auto_257069 ?auto_257071 ) ) ( not ( = ?auto_257069 ?auto_257072 ) ) ( not ( = ?auto_257069 ?auto_257073 ) ) ( not ( = ?auto_257069 ?auto_257074 ) ) ( not ( = ?auto_257069 ?auto_257075 ) ) ( not ( = ?auto_257069 ?auto_257076 ) ) ( not ( = ?auto_257069 ?auto_257077 ) ) ( not ( = ?auto_257069 ?auto_257078 ) ) ( not ( = ?auto_257069 ?auto_257079 ) ) ( not ( = ?auto_257069 ?auto_257080 ) ) ( not ( = ?auto_257069 ?auto_257081 ) ) ( not ( = ?auto_257069 ?auto_257082 ) ) ( not ( = ?auto_257070 ?auto_257071 ) ) ( not ( = ?auto_257070 ?auto_257072 ) ) ( not ( = ?auto_257070 ?auto_257073 ) ) ( not ( = ?auto_257070 ?auto_257074 ) ) ( not ( = ?auto_257070 ?auto_257075 ) ) ( not ( = ?auto_257070 ?auto_257076 ) ) ( not ( = ?auto_257070 ?auto_257077 ) ) ( not ( = ?auto_257070 ?auto_257078 ) ) ( not ( = ?auto_257070 ?auto_257079 ) ) ( not ( = ?auto_257070 ?auto_257080 ) ) ( not ( = ?auto_257070 ?auto_257081 ) ) ( not ( = ?auto_257070 ?auto_257082 ) ) ( not ( = ?auto_257071 ?auto_257072 ) ) ( not ( = ?auto_257071 ?auto_257073 ) ) ( not ( = ?auto_257071 ?auto_257074 ) ) ( not ( = ?auto_257071 ?auto_257075 ) ) ( not ( = ?auto_257071 ?auto_257076 ) ) ( not ( = ?auto_257071 ?auto_257077 ) ) ( not ( = ?auto_257071 ?auto_257078 ) ) ( not ( = ?auto_257071 ?auto_257079 ) ) ( not ( = ?auto_257071 ?auto_257080 ) ) ( not ( = ?auto_257071 ?auto_257081 ) ) ( not ( = ?auto_257071 ?auto_257082 ) ) ( not ( = ?auto_257072 ?auto_257073 ) ) ( not ( = ?auto_257072 ?auto_257074 ) ) ( not ( = ?auto_257072 ?auto_257075 ) ) ( not ( = ?auto_257072 ?auto_257076 ) ) ( not ( = ?auto_257072 ?auto_257077 ) ) ( not ( = ?auto_257072 ?auto_257078 ) ) ( not ( = ?auto_257072 ?auto_257079 ) ) ( not ( = ?auto_257072 ?auto_257080 ) ) ( not ( = ?auto_257072 ?auto_257081 ) ) ( not ( = ?auto_257072 ?auto_257082 ) ) ( not ( = ?auto_257073 ?auto_257074 ) ) ( not ( = ?auto_257073 ?auto_257075 ) ) ( not ( = ?auto_257073 ?auto_257076 ) ) ( not ( = ?auto_257073 ?auto_257077 ) ) ( not ( = ?auto_257073 ?auto_257078 ) ) ( not ( = ?auto_257073 ?auto_257079 ) ) ( not ( = ?auto_257073 ?auto_257080 ) ) ( not ( = ?auto_257073 ?auto_257081 ) ) ( not ( = ?auto_257073 ?auto_257082 ) ) ( not ( = ?auto_257074 ?auto_257075 ) ) ( not ( = ?auto_257074 ?auto_257076 ) ) ( not ( = ?auto_257074 ?auto_257077 ) ) ( not ( = ?auto_257074 ?auto_257078 ) ) ( not ( = ?auto_257074 ?auto_257079 ) ) ( not ( = ?auto_257074 ?auto_257080 ) ) ( not ( = ?auto_257074 ?auto_257081 ) ) ( not ( = ?auto_257074 ?auto_257082 ) ) ( not ( = ?auto_257075 ?auto_257076 ) ) ( not ( = ?auto_257075 ?auto_257077 ) ) ( not ( = ?auto_257075 ?auto_257078 ) ) ( not ( = ?auto_257075 ?auto_257079 ) ) ( not ( = ?auto_257075 ?auto_257080 ) ) ( not ( = ?auto_257075 ?auto_257081 ) ) ( not ( = ?auto_257075 ?auto_257082 ) ) ( not ( = ?auto_257076 ?auto_257077 ) ) ( not ( = ?auto_257076 ?auto_257078 ) ) ( not ( = ?auto_257076 ?auto_257079 ) ) ( not ( = ?auto_257076 ?auto_257080 ) ) ( not ( = ?auto_257076 ?auto_257081 ) ) ( not ( = ?auto_257076 ?auto_257082 ) ) ( not ( = ?auto_257077 ?auto_257078 ) ) ( not ( = ?auto_257077 ?auto_257079 ) ) ( not ( = ?auto_257077 ?auto_257080 ) ) ( not ( = ?auto_257077 ?auto_257081 ) ) ( not ( = ?auto_257077 ?auto_257082 ) ) ( not ( = ?auto_257078 ?auto_257079 ) ) ( not ( = ?auto_257078 ?auto_257080 ) ) ( not ( = ?auto_257078 ?auto_257081 ) ) ( not ( = ?auto_257078 ?auto_257082 ) ) ( not ( = ?auto_257079 ?auto_257080 ) ) ( not ( = ?auto_257079 ?auto_257081 ) ) ( not ( = ?auto_257079 ?auto_257082 ) ) ( not ( = ?auto_257080 ?auto_257081 ) ) ( not ( = ?auto_257080 ?auto_257082 ) ) ( not ( = ?auto_257081 ?auto_257082 ) ) ( ON ?auto_257080 ?auto_257081 ) ( ON ?auto_257079 ?auto_257080 ) ( ON ?auto_257078 ?auto_257079 ) ( CLEAR ?auto_257076 ) ( ON ?auto_257077 ?auto_257078 ) ( CLEAR ?auto_257077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_257069 ?auto_257070 ?auto_257071 ?auto_257072 ?auto_257073 ?auto_257074 ?auto_257075 ?auto_257076 ?auto_257077 )
      ( MAKE-13PILE ?auto_257069 ?auto_257070 ?auto_257071 ?auto_257072 ?auto_257073 ?auto_257074 ?auto_257075 ?auto_257076 ?auto_257077 ?auto_257078 ?auto_257079 ?auto_257080 ?auto_257081 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_257096 - BLOCK
      ?auto_257097 - BLOCK
      ?auto_257098 - BLOCK
      ?auto_257099 - BLOCK
      ?auto_257100 - BLOCK
      ?auto_257101 - BLOCK
      ?auto_257102 - BLOCK
      ?auto_257103 - BLOCK
      ?auto_257104 - BLOCK
      ?auto_257105 - BLOCK
      ?auto_257106 - BLOCK
      ?auto_257107 - BLOCK
      ?auto_257108 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_257108 ) ( ON-TABLE ?auto_257096 ) ( ON ?auto_257097 ?auto_257096 ) ( ON ?auto_257098 ?auto_257097 ) ( ON ?auto_257099 ?auto_257098 ) ( ON ?auto_257100 ?auto_257099 ) ( ON ?auto_257101 ?auto_257100 ) ( ON ?auto_257102 ?auto_257101 ) ( ON ?auto_257103 ?auto_257102 ) ( not ( = ?auto_257096 ?auto_257097 ) ) ( not ( = ?auto_257096 ?auto_257098 ) ) ( not ( = ?auto_257096 ?auto_257099 ) ) ( not ( = ?auto_257096 ?auto_257100 ) ) ( not ( = ?auto_257096 ?auto_257101 ) ) ( not ( = ?auto_257096 ?auto_257102 ) ) ( not ( = ?auto_257096 ?auto_257103 ) ) ( not ( = ?auto_257096 ?auto_257104 ) ) ( not ( = ?auto_257096 ?auto_257105 ) ) ( not ( = ?auto_257096 ?auto_257106 ) ) ( not ( = ?auto_257096 ?auto_257107 ) ) ( not ( = ?auto_257096 ?auto_257108 ) ) ( not ( = ?auto_257097 ?auto_257098 ) ) ( not ( = ?auto_257097 ?auto_257099 ) ) ( not ( = ?auto_257097 ?auto_257100 ) ) ( not ( = ?auto_257097 ?auto_257101 ) ) ( not ( = ?auto_257097 ?auto_257102 ) ) ( not ( = ?auto_257097 ?auto_257103 ) ) ( not ( = ?auto_257097 ?auto_257104 ) ) ( not ( = ?auto_257097 ?auto_257105 ) ) ( not ( = ?auto_257097 ?auto_257106 ) ) ( not ( = ?auto_257097 ?auto_257107 ) ) ( not ( = ?auto_257097 ?auto_257108 ) ) ( not ( = ?auto_257098 ?auto_257099 ) ) ( not ( = ?auto_257098 ?auto_257100 ) ) ( not ( = ?auto_257098 ?auto_257101 ) ) ( not ( = ?auto_257098 ?auto_257102 ) ) ( not ( = ?auto_257098 ?auto_257103 ) ) ( not ( = ?auto_257098 ?auto_257104 ) ) ( not ( = ?auto_257098 ?auto_257105 ) ) ( not ( = ?auto_257098 ?auto_257106 ) ) ( not ( = ?auto_257098 ?auto_257107 ) ) ( not ( = ?auto_257098 ?auto_257108 ) ) ( not ( = ?auto_257099 ?auto_257100 ) ) ( not ( = ?auto_257099 ?auto_257101 ) ) ( not ( = ?auto_257099 ?auto_257102 ) ) ( not ( = ?auto_257099 ?auto_257103 ) ) ( not ( = ?auto_257099 ?auto_257104 ) ) ( not ( = ?auto_257099 ?auto_257105 ) ) ( not ( = ?auto_257099 ?auto_257106 ) ) ( not ( = ?auto_257099 ?auto_257107 ) ) ( not ( = ?auto_257099 ?auto_257108 ) ) ( not ( = ?auto_257100 ?auto_257101 ) ) ( not ( = ?auto_257100 ?auto_257102 ) ) ( not ( = ?auto_257100 ?auto_257103 ) ) ( not ( = ?auto_257100 ?auto_257104 ) ) ( not ( = ?auto_257100 ?auto_257105 ) ) ( not ( = ?auto_257100 ?auto_257106 ) ) ( not ( = ?auto_257100 ?auto_257107 ) ) ( not ( = ?auto_257100 ?auto_257108 ) ) ( not ( = ?auto_257101 ?auto_257102 ) ) ( not ( = ?auto_257101 ?auto_257103 ) ) ( not ( = ?auto_257101 ?auto_257104 ) ) ( not ( = ?auto_257101 ?auto_257105 ) ) ( not ( = ?auto_257101 ?auto_257106 ) ) ( not ( = ?auto_257101 ?auto_257107 ) ) ( not ( = ?auto_257101 ?auto_257108 ) ) ( not ( = ?auto_257102 ?auto_257103 ) ) ( not ( = ?auto_257102 ?auto_257104 ) ) ( not ( = ?auto_257102 ?auto_257105 ) ) ( not ( = ?auto_257102 ?auto_257106 ) ) ( not ( = ?auto_257102 ?auto_257107 ) ) ( not ( = ?auto_257102 ?auto_257108 ) ) ( not ( = ?auto_257103 ?auto_257104 ) ) ( not ( = ?auto_257103 ?auto_257105 ) ) ( not ( = ?auto_257103 ?auto_257106 ) ) ( not ( = ?auto_257103 ?auto_257107 ) ) ( not ( = ?auto_257103 ?auto_257108 ) ) ( not ( = ?auto_257104 ?auto_257105 ) ) ( not ( = ?auto_257104 ?auto_257106 ) ) ( not ( = ?auto_257104 ?auto_257107 ) ) ( not ( = ?auto_257104 ?auto_257108 ) ) ( not ( = ?auto_257105 ?auto_257106 ) ) ( not ( = ?auto_257105 ?auto_257107 ) ) ( not ( = ?auto_257105 ?auto_257108 ) ) ( not ( = ?auto_257106 ?auto_257107 ) ) ( not ( = ?auto_257106 ?auto_257108 ) ) ( not ( = ?auto_257107 ?auto_257108 ) ) ( ON ?auto_257107 ?auto_257108 ) ( ON ?auto_257106 ?auto_257107 ) ( ON ?auto_257105 ?auto_257106 ) ( CLEAR ?auto_257103 ) ( ON ?auto_257104 ?auto_257105 ) ( CLEAR ?auto_257104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_257096 ?auto_257097 ?auto_257098 ?auto_257099 ?auto_257100 ?auto_257101 ?auto_257102 ?auto_257103 ?auto_257104 )
      ( MAKE-13PILE ?auto_257096 ?auto_257097 ?auto_257098 ?auto_257099 ?auto_257100 ?auto_257101 ?auto_257102 ?auto_257103 ?auto_257104 ?auto_257105 ?auto_257106 ?auto_257107 ?auto_257108 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_257122 - BLOCK
      ?auto_257123 - BLOCK
      ?auto_257124 - BLOCK
      ?auto_257125 - BLOCK
      ?auto_257126 - BLOCK
      ?auto_257127 - BLOCK
      ?auto_257128 - BLOCK
      ?auto_257129 - BLOCK
      ?auto_257130 - BLOCK
      ?auto_257131 - BLOCK
      ?auto_257132 - BLOCK
      ?auto_257133 - BLOCK
      ?auto_257134 - BLOCK
    )
    :vars
    (
      ?auto_257135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257134 ?auto_257135 ) ( ON-TABLE ?auto_257122 ) ( ON ?auto_257123 ?auto_257122 ) ( ON ?auto_257124 ?auto_257123 ) ( ON ?auto_257125 ?auto_257124 ) ( ON ?auto_257126 ?auto_257125 ) ( ON ?auto_257127 ?auto_257126 ) ( ON ?auto_257128 ?auto_257127 ) ( not ( = ?auto_257122 ?auto_257123 ) ) ( not ( = ?auto_257122 ?auto_257124 ) ) ( not ( = ?auto_257122 ?auto_257125 ) ) ( not ( = ?auto_257122 ?auto_257126 ) ) ( not ( = ?auto_257122 ?auto_257127 ) ) ( not ( = ?auto_257122 ?auto_257128 ) ) ( not ( = ?auto_257122 ?auto_257129 ) ) ( not ( = ?auto_257122 ?auto_257130 ) ) ( not ( = ?auto_257122 ?auto_257131 ) ) ( not ( = ?auto_257122 ?auto_257132 ) ) ( not ( = ?auto_257122 ?auto_257133 ) ) ( not ( = ?auto_257122 ?auto_257134 ) ) ( not ( = ?auto_257122 ?auto_257135 ) ) ( not ( = ?auto_257123 ?auto_257124 ) ) ( not ( = ?auto_257123 ?auto_257125 ) ) ( not ( = ?auto_257123 ?auto_257126 ) ) ( not ( = ?auto_257123 ?auto_257127 ) ) ( not ( = ?auto_257123 ?auto_257128 ) ) ( not ( = ?auto_257123 ?auto_257129 ) ) ( not ( = ?auto_257123 ?auto_257130 ) ) ( not ( = ?auto_257123 ?auto_257131 ) ) ( not ( = ?auto_257123 ?auto_257132 ) ) ( not ( = ?auto_257123 ?auto_257133 ) ) ( not ( = ?auto_257123 ?auto_257134 ) ) ( not ( = ?auto_257123 ?auto_257135 ) ) ( not ( = ?auto_257124 ?auto_257125 ) ) ( not ( = ?auto_257124 ?auto_257126 ) ) ( not ( = ?auto_257124 ?auto_257127 ) ) ( not ( = ?auto_257124 ?auto_257128 ) ) ( not ( = ?auto_257124 ?auto_257129 ) ) ( not ( = ?auto_257124 ?auto_257130 ) ) ( not ( = ?auto_257124 ?auto_257131 ) ) ( not ( = ?auto_257124 ?auto_257132 ) ) ( not ( = ?auto_257124 ?auto_257133 ) ) ( not ( = ?auto_257124 ?auto_257134 ) ) ( not ( = ?auto_257124 ?auto_257135 ) ) ( not ( = ?auto_257125 ?auto_257126 ) ) ( not ( = ?auto_257125 ?auto_257127 ) ) ( not ( = ?auto_257125 ?auto_257128 ) ) ( not ( = ?auto_257125 ?auto_257129 ) ) ( not ( = ?auto_257125 ?auto_257130 ) ) ( not ( = ?auto_257125 ?auto_257131 ) ) ( not ( = ?auto_257125 ?auto_257132 ) ) ( not ( = ?auto_257125 ?auto_257133 ) ) ( not ( = ?auto_257125 ?auto_257134 ) ) ( not ( = ?auto_257125 ?auto_257135 ) ) ( not ( = ?auto_257126 ?auto_257127 ) ) ( not ( = ?auto_257126 ?auto_257128 ) ) ( not ( = ?auto_257126 ?auto_257129 ) ) ( not ( = ?auto_257126 ?auto_257130 ) ) ( not ( = ?auto_257126 ?auto_257131 ) ) ( not ( = ?auto_257126 ?auto_257132 ) ) ( not ( = ?auto_257126 ?auto_257133 ) ) ( not ( = ?auto_257126 ?auto_257134 ) ) ( not ( = ?auto_257126 ?auto_257135 ) ) ( not ( = ?auto_257127 ?auto_257128 ) ) ( not ( = ?auto_257127 ?auto_257129 ) ) ( not ( = ?auto_257127 ?auto_257130 ) ) ( not ( = ?auto_257127 ?auto_257131 ) ) ( not ( = ?auto_257127 ?auto_257132 ) ) ( not ( = ?auto_257127 ?auto_257133 ) ) ( not ( = ?auto_257127 ?auto_257134 ) ) ( not ( = ?auto_257127 ?auto_257135 ) ) ( not ( = ?auto_257128 ?auto_257129 ) ) ( not ( = ?auto_257128 ?auto_257130 ) ) ( not ( = ?auto_257128 ?auto_257131 ) ) ( not ( = ?auto_257128 ?auto_257132 ) ) ( not ( = ?auto_257128 ?auto_257133 ) ) ( not ( = ?auto_257128 ?auto_257134 ) ) ( not ( = ?auto_257128 ?auto_257135 ) ) ( not ( = ?auto_257129 ?auto_257130 ) ) ( not ( = ?auto_257129 ?auto_257131 ) ) ( not ( = ?auto_257129 ?auto_257132 ) ) ( not ( = ?auto_257129 ?auto_257133 ) ) ( not ( = ?auto_257129 ?auto_257134 ) ) ( not ( = ?auto_257129 ?auto_257135 ) ) ( not ( = ?auto_257130 ?auto_257131 ) ) ( not ( = ?auto_257130 ?auto_257132 ) ) ( not ( = ?auto_257130 ?auto_257133 ) ) ( not ( = ?auto_257130 ?auto_257134 ) ) ( not ( = ?auto_257130 ?auto_257135 ) ) ( not ( = ?auto_257131 ?auto_257132 ) ) ( not ( = ?auto_257131 ?auto_257133 ) ) ( not ( = ?auto_257131 ?auto_257134 ) ) ( not ( = ?auto_257131 ?auto_257135 ) ) ( not ( = ?auto_257132 ?auto_257133 ) ) ( not ( = ?auto_257132 ?auto_257134 ) ) ( not ( = ?auto_257132 ?auto_257135 ) ) ( not ( = ?auto_257133 ?auto_257134 ) ) ( not ( = ?auto_257133 ?auto_257135 ) ) ( not ( = ?auto_257134 ?auto_257135 ) ) ( ON ?auto_257133 ?auto_257134 ) ( ON ?auto_257132 ?auto_257133 ) ( ON ?auto_257131 ?auto_257132 ) ( ON ?auto_257130 ?auto_257131 ) ( CLEAR ?auto_257128 ) ( ON ?auto_257129 ?auto_257130 ) ( CLEAR ?auto_257129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_257122 ?auto_257123 ?auto_257124 ?auto_257125 ?auto_257126 ?auto_257127 ?auto_257128 ?auto_257129 )
      ( MAKE-13PILE ?auto_257122 ?auto_257123 ?auto_257124 ?auto_257125 ?auto_257126 ?auto_257127 ?auto_257128 ?auto_257129 ?auto_257130 ?auto_257131 ?auto_257132 ?auto_257133 ?auto_257134 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_257149 - BLOCK
      ?auto_257150 - BLOCK
      ?auto_257151 - BLOCK
      ?auto_257152 - BLOCK
      ?auto_257153 - BLOCK
      ?auto_257154 - BLOCK
      ?auto_257155 - BLOCK
      ?auto_257156 - BLOCK
      ?auto_257157 - BLOCK
      ?auto_257158 - BLOCK
      ?auto_257159 - BLOCK
      ?auto_257160 - BLOCK
      ?auto_257161 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_257161 ) ( ON-TABLE ?auto_257149 ) ( ON ?auto_257150 ?auto_257149 ) ( ON ?auto_257151 ?auto_257150 ) ( ON ?auto_257152 ?auto_257151 ) ( ON ?auto_257153 ?auto_257152 ) ( ON ?auto_257154 ?auto_257153 ) ( ON ?auto_257155 ?auto_257154 ) ( not ( = ?auto_257149 ?auto_257150 ) ) ( not ( = ?auto_257149 ?auto_257151 ) ) ( not ( = ?auto_257149 ?auto_257152 ) ) ( not ( = ?auto_257149 ?auto_257153 ) ) ( not ( = ?auto_257149 ?auto_257154 ) ) ( not ( = ?auto_257149 ?auto_257155 ) ) ( not ( = ?auto_257149 ?auto_257156 ) ) ( not ( = ?auto_257149 ?auto_257157 ) ) ( not ( = ?auto_257149 ?auto_257158 ) ) ( not ( = ?auto_257149 ?auto_257159 ) ) ( not ( = ?auto_257149 ?auto_257160 ) ) ( not ( = ?auto_257149 ?auto_257161 ) ) ( not ( = ?auto_257150 ?auto_257151 ) ) ( not ( = ?auto_257150 ?auto_257152 ) ) ( not ( = ?auto_257150 ?auto_257153 ) ) ( not ( = ?auto_257150 ?auto_257154 ) ) ( not ( = ?auto_257150 ?auto_257155 ) ) ( not ( = ?auto_257150 ?auto_257156 ) ) ( not ( = ?auto_257150 ?auto_257157 ) ) ( not ( = ?auto_257150 ?auto_257158 ) ) ( not ( = ?auto_257150 ?auto_257159 ) ) ( not ( = ?auto_257150 ?auto_257160 ) ) ( not ( = ?auto_257150 ?auto_257161 ) ) ( not ( = ?auto_257151 ?auto_257152 ) ) ( not ( = ?auto_257151 ?auto_257153 ) ) ( not ( = ?auto_257151 ?auto_257154 ) ) ( not ( = ?auto_257151 ?auto_257155 ) ) ( not ( = ?auto_257151 ?auto_257156 ) ) ( not ( = ?auto_257151 ?auto_257157 ) ) ( not ( = ?auto_257151 ?auto_257158 ) ) ( not ( = ?auto_257151 ?auto_257159 ) ) ( not ( = ?auto_257151 ?auto_257160 ) ) ( not ( = ?auto_257151 ?auto_257161 ) ) ( not ( = ?auto_257152 ?auto_257153 ) ) ( not ( = ?auto_257152 ?auto_257154 ) ) ( not ( = ?auto_257152 ?auto_257155 ) ) ( not ( = ?auto_257152 ?auto_257156 ) ) ( not ( = ?auto_257152 ?auto_257157 ) ) ( not ( = ?auto_257152 ?auto_257158 ) ) ( not ( = ?auto_257152 ?auto_257159 ) ) ( not ( = ?auto_257152 ?auto_257160 ) ) ( not ( = ?auto_257152 ?auto_257161 ) ) ( not ( = ?auto_257153 ?auto_257154 ) ) ( not ( = ?auto_257153 ?auto_257155 ) ) ( not ( = ?auto_257153 ?auto_257156 ) ) ( not ( = ?auto_257153 ?auto_257157 ) ) ( not ( = ?auto_257153 ?auto_257158 ) ) ( not ( = ?auto_257153 ?auto_257159 ) ) ( not ( = ?auto_257153 ?auto_257160 ) ) ( not ( = ?auto_257153 ?auto_257161 ) ) ( not ( = ?auto_257154 ?auto_257155 ) ) ( not ( = ?auto_257154 ?auto_257156 ) ) ( not ( = ?auto_257154 ?auto_257157 ) ) ( not ( = ?auto_257154 ?auto_257158 ) ) ( not ( = ?auto_257154 ?auto_257159 ) ) ( not ( = ?auto_257154 ?auto_257160 ) ) ( not ( = ?auto_257154 ?auto_257161 ) ) ( not ( = ?auto_257155 ?auto_257156 ) ) ( not ( = ?auto_257155 ?auto_257157 ) ) ( not ( = ?auto_257155 ?auto_257158 ) ) ( not ( = ?auto_257155 ?auto_257159 ) ) ( not ( = ?auto_257155 ?auto_257160 ) ) ( not ( = ?auto_257155 ?auto_257161 ) ) ( not ( = ?auto_257156 ?auto_257157 ) ) ( not ( = ?auto_257156 ?auto_257158 ) ) ( not ( = ?auto_257156 ?auto_257159 ) ) ( not ( = ?auto_257156 ?auto_257160 ) ) ( not ( = ?auto_257156 ?auto_257161 ) ) ( not ( = ?auto_257157 ?auto_257158 ) ) ( not ( = ?auto_257157 ?auto_257159 ) ) ( not ( = ?auto_257157 ?auto_257160 ) ) ( not ( = ?auto_257157 ?auto_257161 ) ) ( not ( = ?auto_257158 ?auto_257159 ) ) ( not ( = ?auto_257158 ?auto_257160 ) ) ( not ( = ?auto_257158 ?auto_257161 ) ) ( not ( = ?auto_257159 ?auto_257160 ) ) ( not ( = ?auto_257159 ?auto_257161 ) ) ( not ( = ?auto_257160 ?auto_257161 ) ) ( ON ?auto_257160 ?auto_257161 ) ( ON ?auto_257159 ?auto_257160 ) ( ON ?auto_257158 ?auto_257159 ) ( ON ?auto_257157 ?auto_257158 ) ( CLEAR ?auto_257155 ) ( ON ?auto_257156 ?auto_257157 ) ( CLEAR ?auto_257156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_257149 ?auto_257150 ?auto_257151 ?auto_257152 ?auto_257153 ?auto_257154 ?auto_257155 ?auto_257156 )
      ( MAKE-13PILE ?auto_257149 ?auto_257150 ?auto_257151 ?auto_257152 ?auto_257153 ?auto_257154 ?auto_257155 ?auto_257156 ?auto_257157 ?auto_257158 ?auto_257159 ?auto_257160 ?auto_257161 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_257175 - BLOCK
      ?auto_257176 - BLOCK
      ?auto_257177 - BLOCK
      ?auto_257178 - BLOCK
      ?auto_257179 - BLOCK
      ?auto_257180 - BLOCK
      ?auto_257181 - BLOCK
      ?auto_257182 - BLOCK
      ?auto_257183 - BLOCK
      ?auto_257184 - BLOCK
      ?auto_257185 - BLOCK
      ?auto_257186 - BLOCK
      ?auto_257187 - BLOCK
    )
    :vars
    (
      ?auto_257188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257187 ?auto_257188 ) ( ON-TABLE ?auto_257175 ) ( ON ?auto_257176 ?auto_257175 ) ( ON ?auto_257177 ?auto_257176 ) ( ON ?auto_257178 ?auto_257177 ) ( ON ?auto_257179 ?auto_257178 ) ( ON ?auto_257180 ?auto_257179 ) ( not ( = ?auto_257175 ?auto_257176 ) ) ( not ( = ?auto_257175 ?auto_257177 ) ) ( not ( = ?auto_257175 ?auto_257178 ) ) ( not ( = ?auto_257175 ?auto_257179 ) ) ( not ( = ?auto_257175 ?auto_257180 ) ) ( not ( = ?auto_257175 ?auto_257181 ) ) ( not ( = ?auto_257175 ?auto_257182 ) ) ( not ( = ?auto_257175 ?auto_257183 ) ) ( not ( = ?auto_257175 ?auto_257184 ) ) ( not ( = ?auto_257175 ?auto_257185 ) ) ( not ( = ?auto_257175 ?auto_257186 ) ) ( not ( = ?auto_257175 ?auto_257187 ) ) ( not ( = ?auto_257175 ?auto_257188 ) ) ( not ( = ?auto_257176 ?auto_257177 ) ) ( not ( = ?auto_257176 ?auto_257178 ) ) ( not ( = ?auto_257176 ?auto_257179 ) ) ( not ( = ?auto_257176 ?auto_257180 ) ) ( not ( = ?auto_257176 ?auto_257181 ) ) ( not ( = ?auto_257176 ?auto_257182 ) ) ( not ( = ?auto_257176 ?auto_257183 ) ) ( not ( = ?auto_257176 ?auto_257184 ) ) ( not ( = ?auto_257176 ?auto_257185 ) ) ( not ( = ?auto_257176 ?auto_257186 ) ) ( not ( = ?auto_257176 ?auto_257187 ) ) ( not ( = ?auto_257176 ?auto_257188 ) ) ( not ( = ?auto_257177 ?auto_257178 ) ) ( not ( = ?auto_257177 ?auto_257179 ) ) ( not ( = ?auto_257177 ?auto_257180 ) ) ( not ( = ?auto_257177 ?auto_257181 ) ) ( not ( = ?auto_257177 ?auto_257182 ) ) ( not ( = ?auto_257177 ?auto_257183 ) ) ( not ( = ?auto_257177 ?auto_257184 ) ) ( not ( = ?auto_257177 ?auto_257185 ) ) ( not ( = ?auto_257177 ?auto_257186 ) ) ( not ( = ?auto_257177 ?auto_257187 ) ) ( not ( = ?auto_257177 ?auto_257188 ) ) ( not ( = ?auto_257178 ?auto_257179 ) ) ( not ( = ?auto_257178 ?auto_257180 ) ) ( not ( = ?auto_257178 ?auto_257181 ) ) ( not ( = ?auto_257178 ?auto_257182 ) ) ( not ( = ?auto_257178 ?auto_257183 ) ) ( not ( = ?auto_257178 ?auto_257184 ) ) ( not ( = ?auto_257178 ?auto_257185 ) ) ( not ( = ?auto_257178 ?auto_257186 ) ) ( not ( = ?auto_257178 ?auto_257187 ) ) ( not ( = ?auto_257178 ?auto_257188 ) ) ( not ( = ?auto_257179 ?auto_257180 ) ) ( not ( = ?auto_257179 ?auto_257181 ) ) ( not ( = ?auto_257179 ?auto_257182 ) ) ( not ( = ?auto_257179 ?auto_257183 ) ) ( not ( = ?auto_257179 ?auto_257184 ) ) ( not ( = ?auto_257179 ?auto_257185 ) ) ( not ( = ?auto_257179 ?auto_257186 ) ) ( not ( = ?auto_257179 ?auto_257187 ) ) ( not ( = ?auto_257179 ?auto_257188 ) ) ( not ( = ?auto_257180 ?auto_257181 ) ) ( not ( = ?auto_257180 ?auto_257182 ) ) ( not ( = ?auto_257180 ?auto_257183 ) ) ( not ( = ?auto_257180 ?auto_257184 ) ) ( not ( = ?auto_257180 ?auto_257185 ) ) ( not ( = ?auto_257180 ?auto_257186 ) ) ( not ( = ?auto_257180 ?auto_257187 ) ) ( not ( = ?auto_257180 ?auto_257188 ) ) ( not ( = ?auto_257181 ?auto_257182 ) ) ( not ( = ?auto_257181 ?auto_257183 ) ) ( not ( = ?auto_257181 ?auto_257184 ) ) ( not ( = ?auto_257181 ?auto_257185 ) ) ( not ( = ?auto_257181 ?auto_257186 ) ) ( not ( = ?auto_257181 ?auto_257187 ) ) ( not ( = ?auto_257181 ?auto_257188 ) ) ( not ( = ?auto_257182 ?auto_257183 ) ) ( not ( = ?auto_257182 ?auto_257184 ) ) ( not ( = ?auto_257182 ?auto_257185 ) ) ( not ( = ?auto_257182 ?auto_257186 ) ) ( not ( = ?auto_257182 ?auto_257187 ) ) ( not ( = ?auto_257182 ?auto_257188 ) ) ( not ( = ?auto_257183 ?auto_257184 ) ) ( not ( = ?auto_257183 ?auto_257185 ) ) ( not ( = ?auto_257183 ?auto_257186 ) ) ( not ( = ?auto_257183 ?auto_257187 ) ) ( not ( = ?auto_257183 ?auto_257188 ) ) ( not ( = ?auto_257184 ?auto_257185 ) ) ( not ( = ?auto_257184 ?auto_257186 ) ) ( not ( = ?auto_257184 ?auto_257187 ) ) ( not ( = ?auto_257184 ?auto_257188 ) ) ( not ( = ?auto_257185 ?auto_257186 ) ) ( not ( = ?auto_257185 ?auto_257187 ) ) ( not ( = ?auto_257185 ?auto_257188 ) ) ( not ( = ?auto_257186 ?auto_257187 ) ) ( not ( = ?auto_257186 ?auto_257188 ) ) ( not ( = ?auto_257187 ?auto_257188 ) ) ( ON ?auto_257186 ?auto_257187 ) ( ON ?auto_257185 ?auto_257186 ) ( ON ?auto_257184 ?auto_257185 ) ( ON ?auto_257183 ?auto_257184 ) ( ON ?auto_257182 ?auto_257183 ) ( CLEAR ?auto_257180 ) ( ON ?auto_257181 ?auto_257182 ) ( CLEAR ?auto_257181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_257175 ?auto_257176 ?auto_257177 ?auto_257178 ?auto_257179 ?auto_257180 ?auto_257181 )
      ( MAKE-13PILE ?auto_257175 ?auto_257176 ?auto_257177 ?auto_257178 ?auto_257179 ?auto_257180 ?auto_257181 ?auto_257182 ?auto_257183 ?auto_257184 ?auto_257185 ?auto_257186 ?auto_257187 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_257202 - BLOCK
      ?auto_257203 - BLOCK
      ?auto_257204 - BLOCK
      ?auto_257205 - BLOCK
      ?auto_257206 - BLOCK
      ?auto_257207 - BLOCK
      ?auto_257208 - BLOCK
      ?auto_257209 - BLOCK
      ?auto_257210 - BLOCK
      ?auto_257211 - BLOCK
      ?auto_257212 - BLOCK
      ?auto_257213 - BLOCK
      ?auto_257214 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_257214 ) ( ON-TABLE ?auto_257202 ) ( ON ?auto_257203 ?auto_257202 ) ( ON ?auto_257204 ?auto_257203 ) ( ON ?auto_257205 ?auto_257204 ) ( ON ?auto_257206 ?auto_257205 ) ( ON ?auto_257207 ?auto_257206 ) ( not ( = ?auto_257202 ?auto_257203 ) ) ( not ( = ?auto_257202 ?auto_257204 ) ) ( not ( = ?auto_257202 ?auto_257205 ) ) ( not ( = ?auto_257202 ?auto_257206 ) ) ( not ( = ?auto_257202 ?auto_257207 ) ) ( not ( = ?auto_257202 ?auto_257208 ) ) ( not ( = ?auto_257202 ?auto_257209 ) ) ( not ( = ?auto_257202 ?auto_257210 ) ) ( not ( = ?auto_257202 ?auto_257211 ) ) ( not ( = ?auto_257202 ?auto_257212 ) ) ( not ( = ?auto_257202 ?auto_257213 ) ) ( not ( = ?auto_257202 ?auto_257214 ) ) ( not ( = ?auto_257203 ?auto_257204 ) ) ( not ( = ?auto_257203 ?auto_257205 ) ) ( not ( = ?auto_257203 ?auto_257206 ) ) ( not ( = ?auto_257203 ?auto_257207 ) ) ( not ( = ?auto_257203 ?auto_257208 ) ) ( not ( = ?auto_257203 ?auto_257209 ) ) ( not ( = ?auto_257203 ?auto_257210 ) ) ( not ( = ?auto_257203 ?auto_257211 ) ) ( not ( = ?auto_257203 ?auto_257212 ) ) ( not ( = ?auto_257203 ?auto_257213 ) ) ( not ( = ?auto_257203 ?auto_257214 ) ) ( not ( = ?auto_257204 ?auto_257205 ) ) ( not ( = ?auto_257204 ?auto_257206 ) ) ( not ( = ?auto_257204 ?auto_257207 ) ) ( not ( = ?auto_257204 ?auto_257208 ) ) ( not ( = ?auto_257204 ?auto_257209 ) ) ( not ( = ?auto_257204 ?auto_257210 ) ) ( not ( = ?auto_257204 ?auto_257211 ) ) ( not ( = ?auto_257204 ?auto_257212 ) ) ( not ( = ?auto_257204 ?auto_257213 ) ) ( not ( = ?auto_257204 ?auto_257214 ) ) ( not ( = ?auto_257205 ?auto_257206 ) ) ( not ( = ?auto_257205 ?auto_257207 ) ) ( not ( = ?auto_257205 ?auto_257208 ) ) ( not ( = ?auto_257205 ?auto_257209 ) ) ( not ( = ?auto_257205 ?auto_257210 ) ) ( not ( = ?auto_257205 ?auto_257211 ) ) ( not ( = ?auto_257205 ?auto_257212 ) ) ( not ( = ?auto_257205 ?auto_257213 ) ) ( not ( = ?auto_257205 ?auto_257214 ) ) ( not ( = ?auto_257206 ?auto_257207 ) ) ( not ( = ?auto_257206 ?auto_257208 ) ) ( not ( = ?auto_257206 ?auto_257209 ) ) ( not ( = ?auto_257206 ?auto_257210 ) ) ( not ( = ?auto_257206 ?auto_257211 ) ) ( not ( = ?auto_257206 ?auto_257212 ) ) ( not ( = ?auto_257206 ?auto_257213 ) ) ( not ( = ?auto_257206 ?auto_257214 ) ) ( not ( = ?auto_257207 ?auto_257208 ) ) ( not ( = ?auto_257207 ?auto_257209 ) ) ( not ( = ?auto_257207 ?auto_257210 ) ) ( not ( = ?auto_257207 ?auto_257211 ) ) ( not ( = ?auto_257207 ?auto_257212 ) ) ( not ( = ?auto_257207 ?auto_257213 ) ) ( not ( = ?auto_257207 ?auto_257214 ) ) ( not ( = ?auto_257208 ?auto_257209 ) ) ( not ( = ?auto_257208 ?auto_257210 ) ) ( not ( = ?auto_257208 ?auto_257211 ) ) ( not ( = ?auto_257208 ?auto_257212 ) ) ( not ( = ?auto_257208 ?auto_257213 ) ) ( not ( = ?auto_257208 ?auto_257214 ) ) ( not ( = ?auto_257209 ?auto_257210 ) ) ( not ( = ?auto_257209 ?auto_257211 ) ) ( not ( = ?auto_257209 ?auto_257212 ) ) ( not ( = ?auto_257209 ?auto_257213 ) ) ( not ( = ?auto_257209 ?auto_257214 ) ) ( not ( = ?auto_257210 ?auto_257211 ) ) ( not ( = ?auto_257210 ?auto_257212 ) ) ( not ( = ?auto_257210 ?auto_257213 ) ) ( not ( = ?auto_257210 ?auto_257214 ) ) ( not ( = ?auto_257211 ?auto_257212 ) ) ( not ( = ?auto_257211 ?auto_257213 ) ) ( not ( = ?auto_257211 ?auto_257214 ) ) ( not ( = ?auto_257212 ?auto_257213 ) ) ( not ( = ?auto_257212 ?auto_257214 ) ) ( not ( = ?auto_257213 ?auto_257214 ) ) ( ON ?auto_257213 ?auto_257214 ) ( ON ?auto_257212 ?auto_257213 ) ( ON ?auto_257211 ?auto_257212 ) ( ON ?auto_257210 ?auto_257211 ) ( ON ?auto_257209 ?auto_257210 ) ( CLEAR ?auto_257207 ) ( ON ?auto_257208 ?auto_257209 ) ( CLEAR ?auto_257208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_257202 ?auto_257203 ?auto_257204 ?auto_257205 ?auto_257206 ?auto_257207 ?auto_257208 )
      ( MAKE-13PILE ?auto_257202 ?auto_257203 ?auto_257204 ?auto_257205 ?auto_257206 ?auto_257207 ?auto_257208 ?auto_257209 ?auto_257210 ?auto_257211 ?auto_257212 ?auto_257213 ?auto_257214 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_257228 - BLOCK
      ?auto_257229 - BLOCK
      ?auto_257230 - BLOCK
      ?auto_257231 - BLOCK
      ?auto_257232 - BLOCK
      ?auto_257233 - BLOCK
      ?auto_257234 - BLOCK
      ?auto_257235 - BLOCK
      ?auto_257236 - BLOCK
      ?auto_257237 - BLOCK
      ?auto_257238 - BLOCK
      ?auto_257239 - BLOCK
      ?auto_257240 - BLOCK
    )
    :vars
    (
      ?auto_257241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257240 ?auto_257241 ) ( ON-TABLE ?auto_257228 ) ( ON ?auto_257229 ?auto_257228 ) ( ON ?auto_257230 ?auto_257229 ) ( ON ?auto_257231 ?auto_257230 ) ( ON ?auto_257232 ?auto_257231 ) ( not ( = ?auto_257228 ?auto_257229 ) ) ( not ( = ?auto_257228 ?auto_257230 ) ) ( not ( = ?auto_257228 ?auto_257231 ) ) ( not ( = ?auto_257228 ?auto_257232 ) ) ( not ( = ?auto_257228 ?auto_257233 ) ) ( not ( = ?auto_257228 ?auto_257234 ) ) ( not ( = ?auto_257228 ?auto_257235 ) ) ( not ( = ?auto_257228 ?auto_257236 ) ) ( not ( = ?auto_257228 ?auto_257237 ) ) ( not ( = ?auto_257228 ?auto_257238 ) ) ( not ( = ?auto_257228 ?auto_257239 ) ) ( not ( = ?auto_257228 ?auto_257240 ) ) ( not ( = ?auto_257228 ?auto_257241 ) ) ( not ( = ?auto_257229 ?auto_257230 ) ) ( not ( = ?auto_257229 ?auto_257231 ) ) ( not ( = ?auto_257229 ?auto_257232 ) ) ( not ( = ?auto_257229 ?auto_257233 ) ) ( not ( = ?auto_257229 ?auto_257234 ) ) ( not ( = ?auto_257229 ?auto_257235 ) ) ( not ( = ?auto_257229 ?auto_257236 ) ) ( not ( = ?auto_257229 ?auto_257237 ) ) ( not ( = ?auto_257229 ?auto_257238 ) ) ( not ( = ?auto_257229 ?auto_257239 ) ) ( not ( = ?auto_257229 ?auto_257240 ) ) ( not ( = ?auto_257229 ?auto_257241 ) ) ( not ( = ?auto_257230 ?auto_257231 ) ) ( not ( = ?auto_257230 ?auto_257232 ) ) ( not ( = ?auto_257230 ?auto_257233 ) ) ( not ( = ?auto_257230 ?auto_257234 ) ) ( not ( = ?auto_257230 ?auto_257235 ) ) ( not ( = ?auto_257230 ?auto_257236 ) ) ( not ( = ?auto_257230 ?auto_257237 ) ) ( not ( = ?auto_257230 ?auto_257238 ) ) ( not ( = ?auto_257230 ?auto_257239 ) ) ( not ( = ?auto_257230 ?auto_257240 ) ) ( not ( = ?auto_257230 ?auto_257241 ) ) ( not ( = ?auto_257231 ?auto_257232 ) ) ( not ( = ?auto_257231 ?auto_257233 ) ) ( not ( = ?auto_257231 ?auto_257234 ) ) ( not ( = ?auto_257231 ?auto_257235 ) ) ( not ( = ?auto_257231 ?auto_257236 ) ) ( not ( = ?auto_257231 ?auto_257237 ) ) ( not ( = ?auto_257231 ?auto_257238 ) ) ( not ( = ?auto_257231 ?auto_257239 ) ) ( not ( = ?auto_257231 ?auto_257240 ) ) ( not ( = ?auto_257231 ?auto_257241 ) ) ( not ( = ?auto_257232 ?auto_257233 ) ) ( not ( = ?auto_257232 ?auto_257234 ) ) ( not ( = ?auto_257232 ?auto_257235 ) ) ( not ( = ?auto_257232 ?auto_257236 ) ) ( not ( = ?auto_257232 ?auto_257237 ) ) ( not ( = ?auto_257232 ?auto_257238 ) ) ( not ( = ?auto_257232 ?auto_257239 ) ) ( not ( = ?auto_257232 ?auto_257240 ) ) ( not ( = ?auto_257232 ?auto_257241 ) ) ( not ( = ?auto_257233 ?auto_257234 ) ) ( not ( = ?auto_257233 ?auto_257235 ) ) ( not ( = ?auto_257233 ?auto_257236 ) ) ( not ( = ?auto_257233 ?auto_257237 ) ) ( not ( = ?auto_257233 ?auto_257238 ) ) ( not ( = ?auto_257233 ?auto_257239 ) ) ( not ( = ?auto_257233 ?auto_257240 ) ) ( not ( = ?auto_257233 ?auto_257241 ) ) ( not ( = ?auto_257234 ?auto_257235 ) ) ( not ( = ?auto_257234 ?auto_257236 ) ) ( not ( = ?auto_257234 ?auto_257237 ) ) ( not ( = ?auto_257234 ?auto_257238 ) ) ( not ( = ?auto_257234 ?auto_257239 ) ) ( not ( = ?auto_257234 ?auto_257240 ) ) ( not ( = ?auto_257234 ?auto_257241 ) ) ( not ( = ?auto_257235 ?auto_257236 ) ) ( not ( = ?auto_257235 ?auto_257237 ) ) ( not ( = ?auto_257235 ?auto_257238 ) ) ( not ( = ?auto_257235 ?auto_257239 ) ) ( not ( = ?auto_257235 ?auto_257240 ) ) ( not ( = ?auto_257235 ?auto_257241 ) ) ( not ( = ?auto_257236 ?auto_257237 ) ) ( not ( = ?auto_257236 ?auto_257238 ) ) ( not ( = ?auto_257236 ?auto_257239 ) ) ( not ( = ?auto_257236 ?auto_257240 ) ) ( not ( = ?auto_257236 ?auto_257241 ) ) ( not ( = ?auto_257237 ?auto_257238 ) ) ( not ( = ?auto_257237 ?auto_257239 ) ) ( not ( = ?auto_257237 ?auto_257240 ) ) ( not ( = ?auto_257237 ?auto_257241 ) ) ( not ( = ?auto_257238 ?auto_257239 ) ) ( not ( = ?auto_257238 ?auto_257240 ) ) ( not ( = ?auto_257238 ?auto_257241 ) ) ( not ( = ?auto_257239 ?auto_257240 ) ) ( not ( = ?auto_257239 ?auto_257241 ) ) ( not ( = ?auto_257240 ?auto_257241 ) ) ( ON ?auto_257239 ?auto_257240 ) ( ON ?auto_257238 ?auto_257239 ) ( ON ?auto_257237 ?auto_257238 ) ( ON ?auto_257236 ?auto_257237 ) ( ON ?auto_257235 ?auto_257236 ) ( ON ?auto_257234 ?auto_257235 ) ( CLEAR ?auto_257232 ) ( ON ?auto_257233 ?auto_257234 ) ( CLEAR ?auto_257233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_257228 ?auto_257229 ?auto_257230 ?auto_257231 ?auto_257232 ?auto_257233 )
      ( MAKE-13PILE ?auto_257228 ?auto_257229 ?auto_257230 ?auto_257231 ?auto_257232 ?auto_257233 ?auto_257234 ?auto_257235 ?auto_257236 ?auto_257237 ?auto_257238 ?auto_257239 ?auto_257240 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_257255 - BLOCK
      ?auto_257256 - BLOCK
      ?auto_257257 - BLOCK
      ?auto_257258 - BLOCK
      ?auto_257259 - BLOCK
      ?auto_257260 - BLOCK
      ?auto_257261 - BLOCK
      ?auto_257262 - BLOCK
      ?auto_257263 - BLOCK
      ?auto_257264 - BLOCK
      ?auto_257265 - BLOCK
      ?auto_257266 - BLOCK
      ?auto_257267 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_257267 ) ( ON-TABLE ?auto_257255 ) ( ON ?auto_257256 ?auto_257255 ) ( ON ?auto_257257 ?auto_257256 ) ( ON ?auto_257258 ?auto_257257 ) ( ON ?auto_257259 ?auto_257258 ) ( not ( = ?auto_257255 ?auto_257256 ) ) ( not ( = ?auto_257255 ?auto_257257 ) ) ( not ( = ?auto_257255 ?auto_257258 ) ) ( not ( = ?auto_257255 ?auto_257259 ) ) ( not ( = ?auto_257255 ?auto_257260 ) ) ( not ( = ?auto_257255 ?auto_257261 ) ) ( not ( = ?auto_257255 ?auto_257262 ) ) ( not ( = ?auto_257255 ?auto_257263 ) ) ( not ( = ?auto_257255 ?auto_257264 ) ) ( not ( = ?auto_257255 ?auto_257265 ) ) ( not ( = ?auto_257255 ?auto_257266 ) ) ( not ( = ?auto_257255 ?auto_257267 ) ) ( not ( = ?auto_257256 ?auto_257257 ) ) ( not ( = ?auto_257256 ?auto_257258 ) ) ( not ( = ?auto_257256 ?auto_257259 ) ) ( not ( = ?auto_257256 ?auto_257260 ) ) ( not ( = ?auto_257256 ?auto_257261 ) ) ( not ( = ?auto_257256 ?auto_257262 ) ) ( not ( = ?auto_257256 ?auto_257263 ) ) ( not ( = ?auto_257256 ?auto_257264 ) ) ( not ( = ?auto_257256 ?auto_257265 ) ) ( not ( = ?auto_257256 ?auto_257266 ) ) ( not ( = ?auto_257256 ?auto_257267 ) ) ( not ( = ?auto_257257 ?auto_257258 ) ) ( not ( = ?auto_257257 ?auto_257259 ) ) ( not ( = ?auto_257257 ?auto_257260 ) ) ( not ( = ?auto_257257 ?auto_257261 ) ) ( not ( = ?auto_257257 ?auto_257262 ) ) ( not ( = ?auto_257257 ?auto_257263 ) ) ( not ( = ?auto_257257 ?auto_257264 ) ) ( not ( = ?auto_257257 ?auto_257265 ) ) ( not ( = ?auto_257257 ?auto_257266 ) ) ( not ( = ?auto_257257 ?auto_257267 ) ) ( not ( = ?auto_257258 ?auto_257259 ) ) ( not ( = ?auto_257258 ?auto_257260 ) ) ( not ( = ?auto_257258 ?auto_257261 ) ) ( not ( = ?auto_257258 ?auto_257262 ) ) ( not ( = ?auto_257258 ?auto_257263 ) ) ( not ( = ?auto_257258 ?auto_257264 ) ) ( not ( = ?auto_257258 ?auto_257265 ) ) ( not ( = ?auto_257258 ?auto_257266 ) ) ( not ( = ?auto_257258 ?auto_257267 ) ) ( not ( = ?auto_257259 ?auto_257260 ) ) ( not ( = ?auto_257259 ?auto_257261 ) ) ( not ( = ?auto_257259 ?auto_257262 ) ) ( not ( = ?auto_257259 ?auto_257263 ) ) ( not ( = ?auto_257259 ?auto_257264 ) ) ( not ( = ?auto_257259 ?auto_257265 ) ) ( not ( = ?auto_257259 ?auto_257266 ) ) ( not ( = ?auto_257259 ?auto_257267 ) ) ( not ( = ?auto_257260 ?auto_257261 ) ) ( not ( = ?auto_257260 ?auto_257262 ) ) ( not ( = ?auto_257260 ?auto_257263 ) ) ( not ( = ?auto_257260 ?auto_257264 ) ) ( not ( = ?auto_257260 ?auto_257265 ) ) ( not ( = ?auto_257260 ?auto_257266 ) ) ( not ( = ?auto_257260 ?auto_257267 ) ) ( not ( = ?auto_257261 ?auto_257262 ) ) ( not ( = ?auto_257261 ?auto_257263 ) ) ( not ( = ?auto_257261 ?auto_257264 ) ) ( not ( = ?auto_257261 ?auto_257265 ) ) ( not ( = ?auto_257261 ?auto_257266 ) ) ( not ( = ?auto_257261 ?auto_257267 ) ) ( not ( = ?auto_257262 ?auto_257263 ) ) ( not ( = ?auto_257262 ?auto_257264 ) ) ( not ( = ?auto_257262 ?auto_257265 ) ) ( not ( = ?auto_257262 ?auto_257266 ) ) ( not ( = ?auto_257262 ?auto_257267 ) ) ( not ( = ?auto_257263 ?auto_257264 ) ) ( not ( = ?auto_257263 ?auto_257265 ) ) ( not ( = ?auto_257263 ?auto_257266 ) ) ( not ( = ?auto_257263 ?auto_257267 ) ) ( not ( = ?auto_257264 ?auto_257265 ) ) ( not ( = ?auto_257264 ?auto_257266 ) ) ( not ( = ?auto_257264 ?auto_257267 ) ) ( not ( = ?auto_257265 ?auto_257266 ) ) ( not ( = ?auto_257265 ?auto_257267 ) ) ( not ( = ?auto_257266 ?auto_257267 ) ) ( ON ?auto_257266 ?auto_257267 ) ( ON ?auto_257265 ?auto_257266 ) ( ON ?auto_257264 ?auto_257265 ) ( ON ?auto_257263 ?auto_257264 ) ( ON ?auto_257262 ?auto_257263 ) ( ON ?auto_257261 ?auto_257262 ) ( CLEAR ?auto_257259 ) ( ON ?auto_257260 ?auto_257261 ) ( CLEAR ?auto_257260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_257255 ?auto_257256 ?auto_257257 ?auto_257258 ?auto_257259 ?auto_257260 )
      ( MAKE-13PILE ?auto_257255 ?auto_257256 ?auto_257257 ?auto_257258 ?auto_257259 ?auto_257260 ?auto_257261 ?auto_257262 ?auto_257263 ?auto_257264 ?auto_257265 ?auto_257266 ?auto_257267 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_257281 - BLOCK
      ?auto_257282 - BLOCK
      ?auto_257283 - BLOCK
      ?auto_257284 - BLOCK
      ?auto_257285 - BLOCK
      ?auto_257286 - BLOCK
      ?auto_257287 - BLOCK
      ?auto_257288 - BLOCK
      ?auto_257289 - BLOCK
      ?auto_257290 - BLOCK
      ?auto_257291 - BLOCK
      ?auto_257292 - BLOCK
      ?auto_257293 - BLOCK
    )
    :vars
    (
      ?auto_257294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257293 ?auto_257294 ) ( ON-TABLE ?auto_257281 ) ( ON ?auto_257282 ?auto_257281 ) ( ON ?auto_257283 ?auto_257282 ) ( ON ?auto_257284 ?auto_257283 ) ( not ( = ?auto_257281 ?auto_257282 ) ) ( not ( = ?auto_257281 ?auto_257283 ) ) ( not ( = ?auto_257281 ?auto_257284 ) ) ( not ( = ?auto_257281 ?auto_257285 ) ) ( not ( = ?auto_257281 ?auto_257286 ) ) ( not ( = ?auto_257281 ?auto_257287 ) ) ( not ( = ?auto_257281 ?auto_257288 ) ) ( not ( = ?auto_257281 ?auto_257289 ) ) ( not ( = ?auto_257281 ?auto_257290 ) ) ( not ( = ?auto_257281 ?auto_257291 ) ) ( not ( = ?auto_257281 ?auto_257292 ) ) ( not ( = ?auto_257281 ?auto_257293 ) ) ( not ( = ?auto_257281 ?auto_257294 ) ) ( not ( = ?auto_257282 ?auto_257283 ) ) ( not ( = ?auto_257282 ?auto_257284 ) ) ( not ( = ?auto_257282 ?auto_257285 ) ) ( not ( = ?auto_257282 ?auto_257286 ) ) ( not ( = ?auto_257282 ?auto_257287 ) ) ( not ( = ?auto_257282 ?auto_257288 ) ) ( not ( = ?auto_257282 ?auto_257289 ) ) ( not ( = ?auto_257282 ?auto_257290 ) ) ( not ( = ?auto_257282 ?auto_257291 ) ) ( not ( = ?auto_257282 ?auto_257292 ) ) ( not ( = ?auto_257282 ?auto_257293 ) ) ( not ( = ?auto_257282 ?auto_257294 ) ) ( not ( = ?auto_257283 ?auto_257284 ) ) ( not ( = ?auto_257283 ?auto_257285 ) ) ( not ( = ?auto_257283 ?auto_257286 ) ) ( not ( = ?auto_257283 ?auto_257287 ) ) ( not ( = ?auto_257283 ?auto_257288 ) ) ( not ( = ?auto_257283 ?auto_257289 ) ) ( not ( = ?auto_257283 ?auto_257290 ) ) ( not ( = ?auto_257283 ?auto_257291 ) ) ( not ( = ?auto_257283 ?auto_257292 ) ) ( not ( = ?auto_257283 ?auto_257293 ) ) ( not ( = ?auto_257283 ?auto_257294 ) ) ( not ( = ?auto_257284 ?auto_257285 ) ) ( not ( = ?auto_257284 ?auto_257286 ) ) ( not ( = ?auto_257284 ?auto_257287 ) ) ( not ( = ?auto_257284 ?auto_257288 ) ) ( not ( = ?auto_257284 ?auto_257289 ) ) ( not ( = ?auto_257284 ?auto_257290 ) ) ( not ( = ?auto_257284 ?auto_257291 ) ) ( not ( = ?auto_257284 ?auto_257292 ) ) ( not ( = ?auto_257284 ?auto_257293 ) ) ( not ( = ?auto_257284 ?auto_257294 ) ) ( not ( = ?auto_257285 ?auto_257286 ) ) ( not ( = ?auto_257285 ?auto_257287 ) ) ( not ( = ?auto_257285 ?auto_257288 ) ) ( not ( = ?auto_257285 ?auto_257289 ) ) ( not ( = ?auto_257285 ?auto_257290 ) ) ( not ( = ?auto_257285 ?auto_257291 ) ) ( not ( = ?auto_257285 ?auto_257292 ) ) ( not ( = ?auto_257285 ?auto_257293 ) ) ( not ( = ?auto_257285 ?auto_257294 ) ) ( not ( = ?auto_257286 ?auto_257287 ) ) ( not ( = ?auto_257286 ?auto_257288 ) ) ( not ( = ?auto_257286 ?auto_257289 ) ) ( not ( = ?auto_257286 ?auto_257290 ) ) ( not ( = ?auto_257286 ?auto_257291 ) ) ( not ( = ?auto_257286 ?auto_257292 ) ) ( not ( = ?auto_257286 ?auto_257293 ) ) ( not ( = ?auto_257286 ?auto_257294 ) ) ( not ( = ?auto_257287 ?auto_257288 ) ) ( not ( = ?auto_257287 ?auto_257289 ) ) ( not ( = ?auto_257287 ?auto_257290 ) ) ( not ( = ?auto_257287 ?auto_257291 ) ) ( not ( = ?auto_257287 ?auto_257292 ) ) ( not ( = ?auto_257287 ?auto_257293 ) ) ( not ( = ?auto_257287 ?auto_257294 ) ) ( not ( = ?auto_257288 ?auto_257289 ) ) ( not ( = ?auto_257288 ?auto_257290 ) ) ( not ( = ?auto_257288 ?auto_257291 ) ) ( not ( = ?auto_257288 ?auto_257292 ) ) ( not ( = ?auto_257288 ?auto_257293 ) ) ( not ( = ?auto_257288 ?auto_257294 ) ) ( not ( = ?auto_257289 ?auto_257290 ) ) ( not ( = ?auto_257289 ?auto_257291 ) ) ( not ( = ?auto_257289 ?auto_257292 ) ) ( not ( = ?auto_257289 ?auto_257293 ) ) ( not ( = ?auto_257289 ?auto_257294 ) ) ( not ( = ?auto_257290 ?auto_257291 ) ) ( not ( = ?auto_257290 ?auto_257292 ) ) ( not ( = ?auto_257290 ?auto_257293 ) ) ( not ( = ?auto_257290 ?auto_257294 ) ) ( not ( = ?auto_257291 ?auto_257292 ) ) ( not ( = ?auto_257291 ?auto_257293 ) ) ( not ( = ?auto_257291 ?auto_257294 ) ) ( not ( = ?auto_257292 ?auto_257293 ) ) ( not ( = ?auto_257292 ?auto_257294 ) ) ( not ( = ?auto_257293 ?auto_257294 ) ) ( ON ?auto_257292 ?auto_257293 ) ( ON ?auto_257291 ?auto_257292 ) ( ON ?auto_257290 ?auto_257291 ) ( ON ?auto_257289 ?auto_257290 ) ( ON ?auto_257288 ?auto_257289 ) ( ON ?auto_257287 ?auto_257288 ) ( ON ?auto_257286 ?auto_257287 ) ( CLEAR ?auto_257284 ) ( ON ?auto_257285 ?auto_257286 ) ( CLEAR ?auto_257285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_257281 ?auto_257282 ?auto_257283 ?auto_257284 ?auto_257285 )
      ( MAKE-13PILE ?auto_257281 ?auto_257282 ?auto_257283 ?auto_257284 ?auto_257285 ?auto_257286 ?auto_257287 ?auto_257288 ?auto_257289 ?auto_257290 ?auto_257291 ?auto_257292 ?auto_257293 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_257308 - BLOCK
      ?auto_257309 - BLOCK
      ?auto_257310 - BLOCK
      ?auto_257311 - BLOCK
      ?auto_257312 - BLOCK
      ?auto_257313 - BLOCK
      ?auto_257314 - BLOCK
      ?auto_257315 - BLOCK
      ?auto_257316 - BLOCK
      ?auto_257317 - BLOCK
      ?auto_257318 - BLOCK
      ?auto_257319 - BLOCK
      ?auto_257320 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_257320 ) ( ON-TABLE ?auto_257308 ) ( ON ?auto_257309 ?auto_257308 ) ( ON ?auto_257310 ?auto_257309 ) ( ON ?auto_257311 ?auto_257310 ) ( not ( = ?auto_257308 ?auto_257309 ) ) ( not ( = ?auto_257308 ?auto_257310 ) ) ( not ( = ?auto_257308 ?auto_257311 ) ) ( not ( = ?auto_257308 ?auto_257312 ) ) ( not ( = ?auto_257308 ?auto_257313 ) ) ( not ( = ?auto_257308 ?auto_257314 ) ) ( not ( = ?auto_257308 ?auto_257315 ) ) ( not ( = ?auto_257308 ?auto_257316 ) ) ( not ( = ?auto_257308 ?auto_257317 ) ) ( not ( = ?auto_257308 ?auto_257318 ) ) ( not ( = ?auto_257308 ?auto_257319 ) ) ( not ( = ?auto_257308 ?auto_257320 ) ) ( not ( = ?auto_257309 ?auto_257310 ) ) ( not ( = ?auto_257309 ?auto_257311 ) ) ( not ( = ?auto_257309 ?auto_257312 ) ) ( not ( = ?auto_257309 ?auto_257313 ) ) ( not ( = ?auto_257309 ?auto_257314 ) ) ( not ( = ?auto_257309 ?auto_257315 ) ) ( not ( = ?auto_257309 ?auto_257316 ) ) ( not ( = ?auto_257309 ?auto_257317 ) ) ( not ( = ?auto_257309 ?auto_257318 ) ) ( not ( = ?auto_257309 ?auto_257319 ) ) ( not ( = ?auto_257309 ?auto_257320 ) ) ( not ( = ?auto_257310 ?auto_257311 ) ) ( not ( = ?auto_257310 ?auto_257312 ) ) ( not ( = ?auto_257310 ?auto_257313 ) ) ( not ( = ?auto_257310 ?auto_257314 ) ) ( not ( = ?auto_257310 ?auto_257315 ) ) ( not ( = ?auto_257310 ?auto_257316 ) ) ( not ( = ?auto_257310 ?auto_257317 ) ) ( not ( = ?auto_257310 ?auto_257318 ) ) ( not ( = ?auto_257310 ?auto_257319 ) ) ( not ( = ?auto_257310 ?auto_257320 ) ) ( not ( = ?auto_257311 ?auto_257312 ) ) ( not ( = ?auto_257311 ?auto_257313 ) ) ( not ( = ?auto_257311 ?auto_257314 ) ) ( not ( = ?auto_257311 ?auto_257315 ) ) ( not ( = ?auto_257311 ?auto_257316 ) ) ( not ( = ?auto_257311 ?auto_257317 ) ) ( not ( = ?auto_257311 ?auto_257318 ) ) ( not ( = ?auto_257311 ?auto_257319 ) ) ( not ( = ?auto_257311 ?auto_257320 ) ) ( not ( = ?auto_257312 ?auto_257313 ) ) ( not ( = ?auto_257312 ?auto_257314 ) ) ( not ( = ?auto_257312 ?auto_257315 ) ) ( not ( = ?auto_257312 ?auto_257316 ) ) ( not ( = ?auto_257312 ?auto_257317 ) ) ( not ( = ?auto_257312 ?auto_257318 ) ) ( not ( = ?auto_257312 ?auto_257319 ) ) ( not ( = ?auto_257312 ?auto_257320 ) ) ( not ( = ?auto_257313 ?auto_257314 ) ) ( not ( = ?auto_257313 ?auto_257315 ) ) ( not ( = ?auto_257313 ?auto_257316 ) ) ( not ( = ?auto_257313 ?auto_257317 ) ) ( not ( = ?auto_257313 ?auto_257318 ) ) ( not ( = ?auto_257313 ?auto_257319 ) ) ( not ( = ?auto_257313 ?auto_257320 ) ) ( not ( = ?auto_257314 ?auto_257315 ) ) ( not ( = ?auto_257314 ?auto_257316 ) ) ( not ( = ?auto_257314 ?auto_257317 ) ) ( not ( = ?auto_257314 ?auto_257318 ) ) ( not ( = ?auto_257314 ?auto_257319 ) ) ( not ( = ?auto_257314 ?auto_257320 ) ) ( not ( = ?auto_257315 ?auto_257316 ) ) ( not ( = ?auto_257315 ?auto_257317 ) ) ( not ( = ?auto_257315 ?auto_257318 ) ) ( not ( = ?auto_257315 ?auto_257319 ) ) ( not ( = ?auto_257315 ?auto_257320 ) ) ( not ( = ?auto_257316 ?auto_257317 ) ) ( not ( = ?auto_257316 ?auto_257318 ) ) ( not ( = ?auto_257316 ?auto_257319 ) ) ( not ( = ?auto_257316 ?auto_257320 ) ) ( not ( = ?auto_257317 ?auto_257318 ) ) ( not ( = ?auto_257317 ?auto_257319 ) ) ( not ( = ?auto_257317 ?auto_257320 ) ) ( not ( = ?auto_257318 ?auto_257319 ) ) ( not ( = ?auto_257318 ?auto_257320 ) ) ( not ( = ?auto_257319 ?auto_257320 ) ) ( ON ?auto_257319 ?auto_257320 ) ( ON ?auto_257318 ?auto_257319 ) ( ON ?auto_257317 ?auto_257318 ) ( ON ?auto_257316 ?auto_257317 ) ( ON ?auto_257315 ?auto_257316 ) ( ON ?auto_257314 ?auto_257315 ) ( ON ?auto_257313 ?auto_257314 ) ( CLEAR ?auto_257311 ) ( ON ?auto_257312 ?auto_257313 ) ( CLEAR ?auto_257312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_257308 ?auto_257309 ?auto_257310 ?auto_257311 ?auto_257312 )
      ( MAKE-13PILE ?auto_257308 ?auto_257309 ?auto_257310 ?auto_257311 ?auto_257312 ?auto_257313 ?auto_257314 ?auto_257315 ?auto_257316 ?auto_257317 ?auto_257318 ?auto_257319 ?auto_257320 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_257334 - BLOCK
      ?auto_257335 - BLOCK
      ?auto_257336 - BLOCK
      ?auto_257337 - BLOCK
      ?auto_257338 - BLOCK
      ?auto_257339 - BLOCK
      ?auto_257340 - BLOCK
      ?auto_257341 - BLOCK
      ?auto_257342 - BLOCK
      ?auto_257343 - BLOCK
      ?auto_257344 - BLOCK
      ?auto_257345 - BLOCK
      ?auto_257346 - BLOCK
    )
    :vars
    (
      ?auto_257347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257346 ?auto_257347 ) ( ON-TABLE ?auto_257334 ) ( ON ?auto_257335 ?auto_257334 ) ( ON ?auto_257336 ?auto_257335 ) ( not ( = ?auto_257334 ?auto_257335 ) ) ( not ( = ?auto_257334 ?auto_257336 ) ) ( not ( = ?auto_257334 ?auto_257337 ) ) ( not ( = ?auto_257334 ?auto_257338 ) ) ( not ( = ?auto_257334 ?auto_257339 ) ) ( not ( = ?auto_257334 ?auto_257340 ) ) ( not ( = ?auto_257334 ?auto_257341 ) ) ( not ( = ?auto_257334 ?auto_257342 ) ) ( not ( = ?auto_257334 ?auto_257343 ) ) ( not ( = ?auto_257334 ?auto_257344 ) ) ( not ( = ?auto_257334 ?auto_257345 ) ) ( not ( = ?auto_257334 ?auto_257346 ) ) ( not ( = ?auto_257334 ?auto_257347 ) ) ( not ( = ?auto_257335 ?auto_257336 ) ) ( not ( = ?auto_257335 ?auto_257337 ) ) ( not ( = ?auto_257335 ?auto_257338 ) ) ( not ( = ?auto_257335 ?auto_257339 ) ) ( not ( = ?auto_257335 ?auto_257340 ) ) ( not ( = ?auto_257335 ?auto_257341 ) ) ( not ( = ?auto_257335 ?auto_257342 ) ) ( not ( = ?auto_257335 ?auto_257343 ) ) ( not ( = ?auto_257335 ?auto_257344 ) ) ( not ( = ?auto_257335 ?auto_257345 ) ) ( not ( = ?auto_257335 ?auto_257346 ) ) ( not ( = ?auto_257335 ?auto_257347 ) ) ( not ( = ?auto_257336 ?auto_257337 ) ) ( not ( = ?auto_257336 ?auto_257338 ) ) ( not ( = ?auto_257336 ?auto_257339 ) ) ( not ( = ?auto_257336 ?auto_257340 ) ) ( not ( = ?auto_257336 ?auto_257341 ) ) ( not ( = ?auto_257336 ?auto_257342 ) ) ( not ( = ?auto_257336 ?auto_257343 ) ) ( not ( = ?auto_257336 ?auto_257344 ) ) ( not ( = ?auto_257336 ?auto_257345 ) ) ( not ( = ?auto_257336 ?auto_257346 ) ) ( not ( = ?auto_257336 ?auto_257347 ) ) ( not ( = ?auto_257337 ?auto_257338 ) ) ( not ( = ?auto_257337 ?auto_257339 ) ) ( not ( = ?auto_257337 ?auto_257340 ) ) ( not ( = ?auto_257337 ?auto_257341 ) ) ( not ( = ?auto_257337 ?auto_257342 ) ) ( not ( = ?auto_257337 ?auto_257343 ) ) ( not ( = ?auto_257337 ?auto_257344 ) ) ( not ( = ?auto_257337 ?auto_257345 ) ) ( not ( = ?auto_257337 ?auto_257346 ) ) ( not ( = ?auto_257337 ?auto_257347 ) ) ( not ( = ?auto_257338 ?auto_257339 ) ) ( not ( = ?auto_257338 ?auto_257340 ) ) ( not ( = ?auto_257338 ?auto_257341 ) ) ( not ( = ?auto_257338 ?auto_257342 ) ) ( not ( = ?auto_257338 ?auto_257343 ) ) ( not ( = ?auto_257338 ?auto_257344 ) ) ( not ( = ?auto_257338 ?auto_257345 ) ) ( not ( = ?auto_257338 ?auto_257346 ) ) ( not ( = ?auto_257338 ?auto_257347 ) ) ( not ( = ?auto_257339 ?auto_257340 ) ) ( not ( = ?auto_257339 ?auto_257341 ) ) ( not ( = ?auto_257339 ?auto_257342 ) ) ( not ( = ?auto_257339 ?auto_257343 ) ) ( not ( = ?auto_257339 ?auto_257344 ) ) ( not ( = ?auto_257339 ?auto_257345 ) ) ( not ( = ?auto_257339 ?auto_257346 ) ) ( not ( = ?auto_257339 ?auto_257347 ) ) ( not ( = ?auto_257340 ?auto_257341 ) ) ( not ( = ?auto_257340 ?auto_257342 ) ) ( not ( = ?auto_257340 ?auto_257343 ) ) ( not ( = ?auto_257340 ?auto_257344 ) ) ( not ( = ?auto_257340 ?auto_257345 ) ) ( not ( = ?auto_257340 ?auto_257346 ) ) ( not ( = ?auto_257340 ?auto_257347 ) ) ( not ( = ?auto_257341 ?auto_257342 ) ) ( not ( = ?auto_257341 ?auto_257343 ) ) ( not ( = ?auto_257341 ?auto_257344 ) ) ( not ( = ?auto_257341 ?auto_257345 ) ) ( not ( = ?auto_257341 ?auto_257346 ) ) ( not ( = ?auto_257341 ?auto_257347 ) ) ( not ( = ?auto_257342 ?auto_257343 ) ) ( not ( = ?auto_257342 ?auto_257344 ) ) ( not ( = ?auto_257342 ?auto_257345 ) ) ( not ( = ?auto_257342 ?auto_257346 ) ) ( not ( = ?auto_257342 ?auto_257347 ) ) ( not ( = ?auto_257343 ?auto_257344 ) ) ( not ( = ?auto_257343 ?auto_257345 ) ) ( not ( = ?auto_257343 ?auto_257346 ) ) ( not ( = ?auto_257343 ?auto_257347 ) ) ( not ( = ?auto_257344 ?auto_257345 ) ) ( not ( = ?auto_257344 ?auto_257346 ) ) ( not ( = ?auto_257344 ?auto_257347 ) ) ( not ( = ?auto_257345 ?auto_257346 ) ) ( not ( = ?auto_257345 ?auto_257347 ) ) ( not ( = ?auto_257346 ?auto_257347 ) ) ( ON ?auto_257345 ?auto_257346 ) ( ON ?auto_257344 ?auto_257345 ) ( ON ?auto_257343 ?auto_257344 ) ( ON ?auto_257342 ?auto_257343 ) ( ON ?auto_257341 ?auto_257342 ) ( ON ?auto_257340 ?auto_257341 ) ( ON ?auto_257339 ?auto_257340 ) ( ON ?auto_257338 ?auto_257339 ) ( CLEAR ?auto_257336 ) ( ON ?auto_257337 ?auto_257338 ) ( CLEAR ?auto_257337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_257334 ?auto_257335 ?auto_257336 ?auto_257337 )
      ( MAKE-13PILE ?auto_257334 ?auto_257335 ?auto_257336 ?auto_257337 ?auto_257338 ?auto_257339 ?auto_257340 ?auto_257341 ?auto_257342 ?auto_257343 ?auto_257344 ?auto_257345 ?auto_257346 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_257361 - BLOCK
      ?auto_257362 - BLOCK
      ?auto_257363 - BLOCK
      ?auto_257364 - BLOCK
      ?auto_257365 - BLOCK
      ?auto_257366 - BLOCK
      ?auto_257367 - BLOCK
      ?auto_257368 - BLOCK
      ?auto_257369 - BLOCK
      ?auto_257370 - BLOCK
      ?auto_257371 - BLOCK
      ?auto_257372 - BLOCK
      ?auto_257373 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_257373 ) ( ON-TABLE ?auto_257361 ) ( ON ?auto_257362 ?auto_257361 ) ( ON ?auto_257363 ?auto_257362 ) ( not ( = ?auto_257361 ?auto_257362 ) ) ( not ( = ?auto_257361 ?auto_257363 ) ) ( not ( = ?auto_257361 ?auto_257364 ) ) ( not ( = ?auto_257361 ?auto_257365 ) ) ( not ( = ?auto_257361 ?auto_257366 ) ) ( not ( = ?auto_257361 ?auto_257367 ) ) ( not ( = ?auto_257361 ?auto_257368 ) ) ( not ( = ?auto_257361 ?auto_257369 ) ) ( not ( = ?auto_257361 ?auto_257370 ) ) ( not ( = ?auto_257361 ?auto_257371 ) ) ( not ( = ?auto_257361 ?auto_257372 ) ) ( not ( = ?auto_257361 ?auto_257373 ) ) ( not ( = ?auto_257362 ?auto_257363 ) ) ( not ( = ?auto_257362 ?auto_257364 ) ) ( not ( = ?auto_257362 ?auto_257365 ) ) ( not ( = ?auto_257362 ?auto_257366 ) ) ( not ( = ?auto_257362 ?auto_257367 ) ) ( not ( = ?auto_257362 ?auto_257368 ) ) ( not ( = ?auto_257362 ?auto_257369 ) ) ( not ( = ?auto_257362 ?auto_257370 ) ) ( not ( = ?auto_257362 ?auto_257371 ) ) ( not ( = ?auto_257362 ?auto_257372 ) ) ( not ( = ?auto_257362 ?auto_257373 ) ) ( not ( = ?auto_257363 ?auto_257364 ) ) ( not ( = ?auto_257363 ?auto_257365 ) ) ( not ( = ?auto_257363 ?auto_257366 ) ) ( not ( = ?auto_257363 ?auto_257367 ) ) ( not ( = ?auto_257363 ?auto_257368 ) ) ( not ( = ?auto_257363 ?auto_257369 ) ) ( not ( = ?auto_257363 ?auto_257370 ) ) ( not ( = ?auto_257363 ?auto_257371 ) ) ( not ( = ?auto_257363 ?auto_257372 ) ) ( not ( = ?auto_257363 ?auto_257373 ) ) ( not ( = ?auto_257364 ?auto_257365 ) ) ( not ( = ?auto_257364 ?auto_257366 ) ) ( not ( = ?auto_257364 ?auto_257367 ) ) ( not ( = ?auto_257364 ?auto_257368 ) ) ( not ( = ?auto_257364 ?auto_257369 ) ) ( not ( = ?auto_257364 ?auto_257370 ) ) ( not ( = ?auto_257364 ?auto_257371 ) ) ( not ( = ?auto_257364 ?auto_257372 ) ) ( not ( = ?auto_257364 ?auto_257373 ) ) ( not ( = ?auto_257365 ?auto_257366 ) ) ( not ( = ?auto_257365 ?auto_257367 ) ) ( not ( = ?auto_257365 ?auto_257368 ) ) ( not ( = ?auto_257365 ?auto_257369 ) ) ( not ( = ?auto_257365 ?auto_257370 ) ) ( not ( = ?auto_257365 ?auto_257371 ) ) ( not ( = ?auto_257365 ?auto_257372 ) ) ( not ( = ?auto_257365 ?auto_257373 ) ) ( not ( = ?auto_257366 ?auto_257367 ) ) ( not ( = ?auto_257366 ?auto_257368 ) ) ( not ( = ?auto_257366 ?auto_257369 ) ) ( not ( = ?auto_257366 ?auto_257370 ) ) ( not ( = ?auto_257366 ?auto_257371 ) ) ( not ( = ?auto_257366 ?auto_257372 ) ) ( not ( = ?auto_257366 ?auto_257373 ) ) ( not ( = ?auto_257367 ?auto_257368 ) ) ( not ( = ?auto_257367 ?auto_257369 ) ) ( not ( = ?auto_257367 ?auto_257370 ) ) ( not ( = ?auto_257367 ?auto_257371 ) ) ( not ( = ?auto_257367 ?auto_257372 ) ) ( not ( = ?auto_257367 ?auto_257373 ) ) ( not ( = ?auto_257368 ?auto_257369 ) ) ( not ( = ?auto_257368 ?auto_257370 ) ) ( not ( = ?auto_257368 ?auto_257371 ) ) ( not ( = ?auto_257368 ?auto_257372 ) ) ( not ( = ?auto_257368 ?auto_257373 ) ) ( not ( = ?auto_257369 ?auto_257370 ) ) ( not ( = ?auto_257369 ?auto_257371 ) ) ( not ( = ?auto_257369 ?auto_257372 ) ) ( not ( = ?auto_257369 ?auto_257373 ) ) ( not ( = ?auto_257370 ?auto_257371 ) ) ( not ( = ?auto_257370 ?auto_257372 ) ) ( not ( = ?auto_257370 ?auto_257373 ) ) ( not ( = ?auto_257371 ?auto_257372 ) ) ( not ( = ?auto_257371 ?auto_257373 ) ) ( not ( = ?auto_257372 ?auto_257373 ) ) ( ON ?auto_257372 ?auto_257373 ) ( ON ?auto_257371 ?auto_257372 ) ( ON ?auto_257370 ?auto_257371 ) ( ON ?auto_257369 ?auto_257370 ) ( ON ?auto_257368 ?auto_257369 ) ( ON ?auto_257367 ?auto_257368 ) ( ON ?auto_257366 ?auto_257367 ) ( ON ?auto_257365 ?auto_257366 ) ( CLEAR ?auto_257363 ) ( ON ?auto_257364 ?auto_257365 ) ( CLEAR ?auto_257364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_257361 ?auto_257362 ?auto_257363 ?auto_257364 )
      ( MAKE-13PILE ?auto_257361 ?auto_257362 ?auto_257363 ?auto_257364 ?auto_257365 ?auto_257366 ?auto_257367 ?auto_257368 ?auto_257369 ?auto_257370 ?auto_257371 ?auto_257372 ?auto_257373 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_257387 - BLOCK
      ?auto_257388 - BLOCK
      ?auto_257389 - BLOCK
      ?auto_257390 - BLOCK
      ?auto_257391 - BLOCK
      ?auto_257392 - BLOCK
      ?auto_257393 - BLOCK
      ?auto_257394 - BLOCK
      ?auto_257395 - BLOCK
      ?auto_257396 - BLOCK
      ?auto_257397 - BLOCK
      ?auto_257398 - BLOCK
      ?auto_257399 - BLOCK
    )
    :vars
    (
      ?auto_257400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257399 ?auto_257400 ) ( ON-TABLE ?auto_257387 ) ( ON ?auto_257388 ?auto_257387 ) ( not ( = ?auto_257387 ?auto_257388 ) ) ( not ( = ?auto_257387 ?auto_257389 ) ) ( not ( = ?auto_257387 ?auto_257390 ) ) ( not ( = ?auto_257387 ?auto_257391 ) ) ( not ( = ?auto_257387 ?auto_257392 ) ) ( not ( = ?auto_257387 ?auto_257393 ) ) ( not ( = ?auto_257387 ?auto_257394 ) ) ( not ( = ?auto_257387 ?auto_257395 ) ) ( not ( = ?auto_257387 ?auto_257396 ) ) ( not ( = ?auto_257387 ?auto_257397 ) ) ( not ( = ?auto_257387 ?auto_257398 ) ) ( not ( = ?auto_257387 ?auto_257399 ) ) ( not ( = ?auto_257387 ?auto_257400 ) ) ( not ( = ?auto_257388 ?auto_257389 ) ) ( not ( = ?auto_257388 ?auto_257390 ) ) ( not ( = ?auto_257388 ?auto_257391 ) ) ( not ( = ?auto_257388 ?auto_257392 ) ) ( not ( = ?auto_257388 ?auto_257393 ) ) ( not ( = ?auto_257388 ?auto_257394 ) ) ( not ( = ?auto_257388 ?auto_257395 ) ) ( not ( = ?auto_257388 ?auto_257396 ) ) ( not ( = ?auto_257388 ?auto_257397 ) ) ( not ( = ?auto_257388 ?auto_257398 ) ) ( not ( = ?auto_257388 ?auto_257399 ) ) ( not ( = ?auto_257388 ?auto_257400 ) ) ( not ( = ?auto_257389 ?auto_257390 ) ) ( not ( = ?auto_257389 ?auto_257391 ) ) ( not ( = ?auto_257389 ?auto_257392 ) ) ( not ( = ?auto_257389 ?auto_257393 ) ) ( not ( = ?auto_257389 ?auto_257394 ) ) ( not ( = ?auto_257389 ?auto_257395 ) ) ( not ( = ?auto_257389 ?auto_257396 ) ) ( not ( = ?auto_257389 ?auto_257397 ) ) ( not ( = ?auto_257389 ?auto_257398 ) ) ( not ( = ?auto_257389 ?auto_257399 ) ) ( not ( = ?auto_257389 ?auto_257400 ) ) ( not ( = ?auto_257390 ?auto_257391 ) ) ( not ( = ?auto_257390 ?auto_257392 ) ) ( not ( = ?auto_257390 ?auto_257393 ) ) ( not ( = ?auto_257390 ?auto_257394 ) ) ( not ( = ?auto_257390 ?auto_257395 ) ) ( not ( = ?auto_257390 ?auto_257396 ) ) ( not ( = ?auto_257390 ?auto_257397 ) ) ( not ( = ?auto_257390 ?auto_257398 ) ) ( not ( = ?auto_257390 ?auto_257399 ) ) ( not ( = ?auto_257390 ?auto_257400 ) ) ( not ( = ?auto_257391 ?auto_257392 ) ) ( not ( = ?auto_257391 ?auto_257393 ) ) ( not ( = ?auto_257391 ?auto_257394 ) ) ( not ( = ?auto_257391 ?auto_257395 ) ) ( not ( = ?auto_257391 ?auto_257396 ) ) ( not ( = ?auto_257391 ?auto_257397 ) ) ( not ( = ?auto_257391 ?auto_257398 ) ) ( not ( = ?auto_257391 ?auto_257399 ) ) ( not ( = ?auto_257391 ?auto_257400 ) ) ( not ( = ?auto_257392 ?auto_257393 ) ) ( not ( = ?auto_257392 ?auto_257394 ) ) ( not ( = ?auto_257392 ?auto_257395 ) ) ( not ( = ?auto_257392 ?auto_257396 ) ) ( not ( = ?auto_257392 ?auto_257397 ) ) ( not ( = ?auto_257392 ?auto_257398 ) ) ( not ( = ?auto_257392 ?auto_257399 ) ) ( not ( = ?auto_257392 ?auto_257400 ) ) ( not ( = ?auto_257393 ?auto_257394 ) ) ( not ( = ?auto_257393 ?auto_257395 ) ) ( not ( = ?auto_257393 ?auto_257396 ) ) ( not ( = ?auto_257393 ?auto_257397 ) ) ( not ( = ?auto_257393 ?auto_257398 ) ) ( not ( = ?auto_257393 ?auto_257399 ) ) ( not ( = ?auto_257393 ?auto_257400 ) ) ( not ( = ?auto_257394 ?auto_257395 ) ) ( not ( = ?auto_257394 ?auto_257396 ) ) ( not ( = ?auto_257394 ?auto_257397 ) ) ( not ( = ?auto_257394 ?auto_257398 ) ) ( not ( = ?auto_257394 ?auto_257399 ) ) ( not ( = ?auto_257394 ?auto_257400 ) ) ( not ( = ?auto_257395 ?auto_257396 ) ) ( not ( = ?auto_257395 ?auto_257397 ) ) ( not ( = ?auto_257395 ?auto_257398 ) ) ( not ( = ?auto_257395 ?auto_257399 ) ) ( not ( = ?auto_257395 ?auto_257400 ) ) ( not ( = ?auto_257396 ?auto_257397 ) ) ( not ( = ?auto_257396 ?auto_257398 ) ) ( not ( = ?auto_257396 ?auto_257399 ) ) ( not ( = ?auto_257396 ?auto_257400 ) ) ( not ( = ?auto_257397 ?auto_257398 ) ) ( not ( = ?auto_257397 ?auto_257399 ) ) ( not ( = ?auto_257397 ?auto_257400 ) ) ( not ( = ?auto_257398 ?auto_257399 ) ) ( not ( = ?auto_257398 ?auto_257400 ) ) ( not ( = ?auto_257399 ?auto_257400 ) ) ( ON ?auto_257398 ?auto_257399 ) ( ON ?auto_257397 ?auto_257398 ) ( ON ?auto_257396 ?auto_257397 ) ( ON ?auto_257395 ?auto_257396 ) ( ON ?auto_257394 ?auto_257395 ) ( ON ?auto_257393 ?auto_257394 ) ( ON ?auto_257392 ?auto_257393 ) ( ON ?auto_257391 ?auto_257392 ) ( ON ?auto_257390 ?auto_257391 ) ( CLEAR ?auto_257388 ) ( ON ?auto_257389 ?auto_257390 ) ( CLEAR ?auto_257389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_257387 ?auto_257388 ?auto_257389 )
      ( MAKE-13PILE ?auto_257387 ?auto_257388 ?auto_257389 ?auto_257390 ?auto_257391 ?auto_257392 ?auto_257393 ?auto_257394 ?auto_257395 ?auto_257396 ?auto_257397 ?auto_257398 ?auto_257399 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_257414 - BLOCK
      ?auto_257415 - BLOCK
      ?auto_257416 - BLOCK
      ?auto_257417 - BLOCK
      ?auto_257418 - BLOCK
      ?auto_257419 - BLOCK
      ?auto_257420 - BLOCK
      ?auto_257421 - BLOCK
      ?auto_257422 - BLOCK
      ?auto_257423 - BLOCK
      ?auto_257424 - BLOCK
      ?auto_257425 - BLOCK
      ?auto_257426 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_257426 ) ( ON-TABLE ?auto_257414 ) ( ON ?auto_257415 ?auto_257414 ) ( not ( = ?auto_257414 ?auto_257415 ) ) ( not ( = ?auto_257414 ?auto_257416 ) ) ( not ( = ?auto_257414 ?auto_257417 ) ) ( not ( = ?auto_257414 ?auto_257418 ) ) ( not ( = ?auto_257414 ?auto_257419 ) ) ( not ( = ?auto_257414 ?auto_257420 ) ) ( not ( = ?auto_257414 ?auto_257421 ) ) ( not ( = ?auto_257414 ?auto_257422 ) ) ( not ( = ?auto_257414 ?auto_257423 ) ) ( not ( = ?auto_257414 ?auto_257424 ) ) ( not ( = ?auto_257414 ?auto_257425 ) ) ( not ( = ?auto_257414 ?auto_257426 ) ) ( not ( = ?auto_257415 ?auto_257416 ) ) ( not ( = ?auto_257415 ?auto_257417 ) ) ( not ( = ?auto_257415 ?auto_257418 ) ) ( not ( = ?auto_257415 ?auto_257419 ) ) ( not ( = ?auto_257415 ?auto_257420 ) ) ( not ( = ?auto_257415 ?auto_257421 ) ) ( not ( = ?auto_257415 ?auto_257422 ) ) ( not ( = ?auto_257415 ?auto_257423 ) ) ( not ( = ?auto_257415 ?auto_257424 ) ) ( not ( = ?auto_257415 ?auto_257425 ) ) ( not ( = ?auto_257415 ?auto_257426 ) ) ( not ( = ?auto_257416 ?auto_257417 ) ) ( not ( = ?auto_257416 ?auto_257418 ) ) ( not ( = ?auto_257416 ?auto_257419 ) ) ( not ( = ?auto_257416 ?auto_257420 ) ) ( not ( = ?auto_257416 ?auto_257421 ) ) ( not ( = ?auto_257416 ?auto_257422 ) ) ( not ( = ?auto_257416 ?auto_257423 ) ) ( not ( = ?auto_257416 ?auto_257424 ) ) ( not ( = ?auto_257416 ?auto_257425 ) ) ( not ( = ?auto_257416 ?auto_257426 ) ) ( not ( = ?auto_257417 ?auto_257418 ) ) ( not ( = ?auto_257417 ?auto_257419 ) ) ( not ( = ?auto_257417 ?auto_257420 ) ) ( not ( = ?auto_257417 ?auto_257421 ) ) ( not ( = ?auto_257417 ?auto_257422 ) ) ( not ( = ?auto_257417 ?auto_257423 ) ) ( not ( = ?auto_257417 ?auto_257424 ) ) ( not ( = ?auto_257417 ?auto_257425 ) ) ( not ( = ?auto_257417 ?auto_257426 ) ) ( not ( = ?auto_257418 ?auto_257419 ) ) ( not ( = ?auto_257418 ?auto_257420 ) ) ( not ( = ?auto_257418 ?auto_257421 ) ) ( not ( = ?auto_257418 ?auto_257422 ) ) ( not ( = ?auto_257418 ?auto_257423 ) ) ( not ( = ?auto_257418 ?auto_257424 ) ) ( not ( = ?auto_257418 ?auto_257425 ) ) ( not ( = ?auto_257418 ?auto_257426 ) ) ( not ( = ?auto_257419 ?auto_257420 ) ) ( not ( = ?auto_257419 ?auto_257421 ) ) ( not ( = ?auto_257419 ?auto_257422 ) ) ( not ( = ?auto_257419 ?auto_257423 ) ) ( not ( = ?auto_257419 ?auto_257424 ) ) ( not ( = ?auto_257419 ?auto_257425 ) ) ( not ( = ?auto_257419 ?auto_257426 ) ) ( not ( = ?auto_257420 ?auto_257421 ) ) ( not ( = ?auto_257420 ?auto_257422 ) ) ( not ( = ?auto_257420 ?auto_257423 ) ) ( not ( = ?auto_257420 ?auto_257424 ) ) ( not ( = ?auto_257420 ?auto_257425 ) ) ( not ( = ?auto_257420 ?auto_257426 ) ) ( not ( = ?auto_257421 ?auto_257422 ) ) ( not ( = ?auto_257421 ?auto_257423 ) ) ( not ( = ?auto_257421 ?auto_257424 ) ) ( not ( = ?auto_257421 ?auto_257425 ) ) ( not ( = ?auto_257421 ?auto_257426 ) ) ( not ( = ?auto_257422 ?auto_257423 ) ) ( not ( = ?auto_257422 ?auto_257424 ) ) ( not ( = ?auto_257422 ?auto_257425 ) ) ( not ( = ?auto_257422 ?auto_257426 ) ) ( not ( = ?auto_257423 ?auto_257424 ) ) ( not ( = ?auto_257423 ?auto_257425 ) ) ( not ( = ?auto_257423 ?auto_257426 ) ) ( not ( = ?auto_257424 ?auto_257425 ) ) ( not ( = ?auto_257424 ?auto_257426 ) ) ( not ( = ?auto_257425 ?auto_257426 ) ) ( ON ?auto_257425 ?auto_257426 ) ( ON ?auto_257424 ?auto_257425 ) ( ON ?auto_257423 ?auto_257424 ) ( ON ?auto_257422 ?auto_257423 ) ( ON ?auto_257421 ?auto_257422 ) ( ON ?auto_257420 ?auto_257421 ) ( ON ?auto_257419 ?auto_257420 ) ( ON ?auto_257418 ?auto_257419 ) ( ON ?auto_257417 ?auto_257418 ) ( CLEAR ?auto_257415 ) ( ON ?auto_257416 ?auto_257417 ) ( CLEAR ?auto_257416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_257414 ?auto_257415 ?auto_257416 )
      ( MAKE-13PILE ?auto_257414 ?auto_257415 ?auto_257416 ?auto_257417 ?auto_257418 ?auto_257419 ?auto_257420 ?auto_257421 ?auto_257422 ?auto_257423 ?auto_257424 ?auto_257425 ?auto_257426 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_257440 - BLOCK
      ?auto_257441 - BLOCK
      ?auto_257442 - BLOCK
      ?auto_257443 - BLOCK
      ?auto_257444 - BLOCK
      ?auto_257445 - BLOCK
      ?auto_257446 - BLOCK
      ?auto_257447 - BLOCK
      ?auto_257448 - BLOCK
      ?auto_257449 - BLOCK
      ?auto_257450 - BLOCK
      ?auto_257451 - BLOCK
      ?auto_257452 - BLOCK
    )
    :vars
    (
      ?auto_257453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257452 ?auto_257453 ) ( ON-TABLE ?auto_257440 ) ( not ( = ?auto_257440 ?auto_257441 ) ) ( not ( = ?auto_257440 ?auto_257442 ) ) ( not ( = ?auto_257440 ?auto_257443 ) ) ( not ( = ?auto_257440 ?auto_257444 ) ) ( not ( = ?auto_257440 ?auto_257445 ) ) ( not ( = ?auto_257440 ?auto_257446 ) ) ( not ( = ?auto_257440 ?auto_257447 ) ) ( not ( = ?auto_257440 ?auto_257448 ) ) ( not ( = ?auto_257440 ?auto_257449 ) ) ( not ( = ?auto_257440 ?auto_257450 ) ) ( not ( = ?auto_257440 ?auto_257451 ) ) ( not ( = ?auto_257440 ?auto_257452 ) ) ( not ( = ?auto_257440 ?auto_257453 ) ) ( not ( = ?auto_257441 ?auto_257442 ) ) ( not ( = ?auto_257441 ?auto_257443 ) ) ( not ( = ?auto_257441 ?auto_257444 ) ) ( not ( = ?auto_257441 ?auto_257445 ) ) ( not ( = ?auto_257441 ?auto_257446 ) ) ( not ( = ?auto_257441 ?auto_257447 ) ) ( not ( = ?auto_257441 ?auto_257448 ) ) ( not ( = ?auto_257441 ?auto_257449 ) ) ( not ( = ?auto_257441 ?auto_257450 ) ) ( not ( = ?auto_257441 ?auto_257451 ) ) ( not ( = ?auto_257441 ?auto_257452 ) ) ( not ( = ?auto_257441 ?auto_257453 ) ) ( not ( = ?auto_257442 ?auto_257443 ) ) ( not ( = ?auto_257442 ?auto_257444 ) ) ( not ( = ?auto_257442 ?auto_257445 ) ) ( not ( = ?auto_257442 ?auto_257446 ) ) ( not ( = ?auto_257442 ?auto_257447 ) ) ( not ( = ?auto_257442 ?auto_257448 ) ) ( not ( = ?auto_257442 ?auto_257449 ) ) ( not ( = ?auto_257442 ?auto_257450 ) ) ( not ( = ?auto_257442 ?auto_257451 ) ) ( not ( = ?auto_257442 ?auto_257452 ) ) ( not ( = ?auto_257442 ?auto_257453 ) ) ( not ( = ?auto_257443 ?auto_257444 ) ) ( not ( = ?auto_257443 ?auto_257445 ) ) ( not ( = ?auto_257443 ?auto_257446 ) ) ( not ( = ?auto_257443 ?auto_257447 ) ) ( not ( = ?auto_257443 ?auto_257448 ) ) ( not ( = ?auto_257443 ?auto_257449 ) ) ( not ( = ?auto_257443 ?auto_257450 ) ) ( not ( = ?auto_257443 ?auto_257451 ) ) ( not ( = ?auto_257443 ?auto_257452 ) ) ( not ( = ?auto_257443 ?auto_257453 ) ) ( not ( = ?auto_257444 ?auto_257445 ) ) ( not ( = ?auto_257444 ?auto_257446 ) ) ( not ( = ?auto_257444 ?auto_257447 ) ) ( not ( = ?auto_257444 ?auto_257448 ) ) ( not ( = ?auto_257444 ?auto_257449 ) ) ( not ( = ?auto_257444 ?auto_257450 ) ) ( not ( = ?auto_257444 ?auto_257451 ) ) ( not ( = ?auto_257444 ?auto_257452 ) ) ( not ( = ?auto_257444 ?auto_257453 ) ) ( not ( = ?auto_257445 ?auto_257446 ) ) ( not ( = ?auto_257445 ?auto_257447 ) ) ( not ( = ?auto_257445 ?auto_257448 ) ) ( not ( = ?auto_257445 ?auto_257449 ) ) ( not ( = ?auto_257445 ?auto_257450 ) ) ( not ( = ?auto_257445 ?auto_257451 ) ) ( not ( = ?auto_257445 ?auto_257452 ) ) ( not ( = ?auto_257445 ?auto_257453 ) ) ( not ( = ?auto_257446 ?auto_257447 ) ) ( not ( = ?auto_257446 ?auto_257448 ) ) ( not ( = ?auto_257446 ?auto_257449 ) ) ( not ( = ?auto_257446 ?auto_257450 ) ) ( not ( = ?auto_257446 ?auto_257451 ) ) ( not ( = ?auto_257446 ?auto_257452 ) ) ( not ( = ?auto_257446 ?auto_257453 ) ) ( not ( = ?auto_257447 ?auto_257448 ) ) ( not ( = ?auto_257447 ?auto_257449 ) ) ( not ( = ?auto_257447 ?auto_257450 ) ) ( not ( = ?auto_257447 ?auto_257451 ) ) ( not ( = ?auto_257447 ?auto_257452 ) ) ( not ( = ?auto_257447 ?auto_257453 ) ) ( not ( = ?auto_257448 ?auto_257449 ) ) ( not ( = ?auto_257448 ?auto_257450 ) ) ( not ( = ?auto_257448 ?auto_257451 ) ) ( not ( = ?auto_257448 ?auto_257452 ) ) ( not ( = ?auto_257448 ?auto_257453 ) ) ( not ( = ?auto_257449 ?auto_257450 ) ) ( not ( = ?auto_257449 ?auto_257451 ) ) ( not ( = ?auto_257449 ?auto_257452 ) ) ( not ( = ?auto_257449 ?auto_257453 ) ) ( not ( = ?auto_257450 ?auto_257451 ) ) ( not ( = ?auto_257450 ?auto_257452 ) ) ( not ( = ?auto_257450 ?auto_257453 ) ) ( not ( = ?auto_257451 ?auto_257452 ) ) ( not ( = ?auto_257451 ?auto_257453 ) ) ( not ( = ?auto_257452 ?auto_257453 ) ) ( ON ?auto_257451 ?auto_257452 ) ( ON ?auto_257450 ?auto_257451 ) ( ON ?auto_257449 ?auto_257450 ) ( ON ?auto_257448 ?auto_257449 ) ( ON ?auto_257447 ?auto_257448 ) ( ON ?auto_257446 ?auto_257447 ) ( ON ?auto_257445 ?auto_257446 ) ( ON ?auto_257444 ?auto_257445 ) ( ON ?auto_257443 ?auto_257444 ) ( ON ?auto_257442 ?auto_257443 ) ( CLEAR ?auto_257440 ) ( ON ?auto_257441 ?auto_257442 ) ( CLEAR ?auto_257441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_257440 ?auto_257441 )
      ( MAKE-13PILE ?auto_257440 ?auto_257441 ?auto_257442 ?auto_257443 ?auto_257444 ?auto_257445 ?auto_257446 ?auto_257447 ?auto_257448 ?auto_257449 ?auto_257450 ?auto_257451 ?auto_257452 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_257467 - BLOCK
      ?auto_257468 - BLOCK
      ?auto_257469 - BLOCK
      ?auto_257470 - BLOCK
      ?auto_257471 - BLOCK
      ?auto_257472 - BLOCK
      ?auto_257473 - BLOCK
      ?auto_257474 - BLOCK
      ?auto_257475 - BLOCK
      ?auto_257476 - BLOCK
      ?auto_257477 - BLOCK
      ?auto_257478 - BLOCK
      ?auto_257479 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_257479 ) ( ON-TABLE ?auto_257467 ) ( not ( = ?auto_257467 ?auto_257468 ) ) ( not ( = ?auto_257467 ?auto_257469 ) ) ( not ( = ?auto_257467 ?auto_257470 ) ) ( not ( = ?auto_257467 ?auto_257471 ) ) ( not ( = ?auto_257467 ?auto_257472 ) ) ( not ( = ?auto_257467 ?auto_257473 ) ) ( not ( = ?auto_257467 ?auto_257474 ) ) ( not ( = ?auto_257467 ?auto_257475 ) ) ( not ( = ?auto_257467 ?auto_257476 ) ) ( not ( = ?auto_257467 ?auto_257477 ) ) ( not ( = ?auto_257467 ?auto_257478 ) ) ( not ( = ?auto_257467 ?auto_257479 ) ) ( not ( = ?auto_257468 ?auto_257469 ) ) ( not ( = ?auto_257468 ?auto_257470 ) ) ( not ( = ?auto_257468 ?auto_257471 ) ) ( not ( = ?auto_257468 ?auto_257472 ) ) ( not ( = ?auto_257468 ?auto_257473 ) ) ( not ( = ?auto_257468 ?auto_257474 ) ) ( not ( = ?auto_257468 ?auto_257475 ) ) ( not ( = ?auto_257468 ?auto_257476 ) ) ( not ( = ?auto_257468 ?auto_257477 ) ) ( not ( = ?auto_257468 ?auto_257478 ) ) ( not ( = ?auto_257468 ?auto_257479 ) ) ( not ( = ?auto_257469 ?auto_257470 ) ) ( not ( = ?auto_257469 ?auto_257471 ) ) ( not ( = ?auto_257469 ?auto_257472 ) ) ( not ( = ?auto_257469 ?auto_257473 ) ) ( not ( = ?auto_257469 ?auto_257474 ) ) ( not ( = ?auto_257469 ?auto_257475 ) ) ( not ( = ?auto_257469 ?auto_257476 ) ) ( not ( = ?auto_257469 ?auto_257477 ) ) ( not ( = ?auto_257469 ?auto_257478 ) ) ( not ( = ?auto_257469 ?auto_257479 ) ) ( not ( = ?auto_257470 ?auto_257471 ) ) ( not ( = ?auto_257470 ?auto_257472 ) ) ( not ( = ?auto_257470 ?auto_257473 ) ) ( not ( = ?auto_257470 ?auto_257474 ) ) ( not ( = ?auto_257470 ?auto_257475 ) ) ( not ( = ?auto_257470 ?auto_257476 ) ) ( not ( = ?auto_257470 ?auto_257477 ) ) ( not ( = ?auto_257470 ?auto_257478 ) ) ( not ( = ?auto_257470 ?auto_257479 ) ) ( not ( = ?auto_257471 ?auto_257472 ) ) ( not ( = ?auto_257471 ?auto_257473 ) ) ( not ( = ?auto_257471 ?auto_257474 ) ) ( not ( = ?auto_257471 ?auto_257475 ) ) ( not ( = ?auto_257471 ?auto_257476 ) ) ( not ( = ?auto_257471 ?auto_257477 ) ) ( not ( = ?auto_257471 ?auto_257478 ) ) ( not ( = ?auto_257471 ?auto_257479 ) ) ( not ( = ?auto_257472 ?auto_257473 ) ) ( not ( = ?auto_257472 ?auto_257474 ) ) ( not ( = ?auto_257472 ?auto_257475 ) ) ( not ( = ?auto_257472 ?auto_257476 ) ) ( not ( = ?auto_257472 ?auto_257477 ) ) ( not ( = ?auto_257472 ?auto_257478 ) ) ( not ( = ?auto_257472 ?auto_257479 ) ) ( not ( = ?auto_257473 ?auto_257474 ) ) ( not ( = ?auto_257473 ?auto_257475 ) ) ( not ( = ?auto_257473 ?auto_257476 ) ) ( not ( = ?auto_257473 ?auto_257477 ) ) ( not ( = ?auto_257473 ?auto_257478 ) ) ( not ( = ?auto_257473 ?auto_257479 ) ) ( not ( = ?auto_257474 ?auto_257475 ) ) ( not ( = ?auto_257474 ?auto_257476 ) ) ( not ( = ?auto_257474 ?auto_257477 ) ) ( not ( = ?auto_257474 ?auto_257478 ) ) ( not ( = ?auto_257474 ?auto_257479 ) ) ( not ( = ?auto_257475 ?auto_257476 ) ) ( not ( = ?auto_257475 ?auto_257477 ) ) ( not ( = ?auto_257475 ?auto_257478 ) ) ( not ( = ?auto_257475 ?auto_257479 ) ) ( not ( = ?auto_257476 ?auto_257477 ) ) ( not ( = ?auto_257476 ?auto_257478 ) ) ( not ( = ?auto_257476 ?auto_257479 ) ) ( not ( = ?auto_257477 ?auto_257478 ) ) ( not ( = ?auto_257477 ?auto_257479 ) ) ( not ( = ?auto_257478 ?auto_257479 ) ) ( ON ?auto_257478 ?auto_257479 ) ( ON ?auto_257477 ?auto_257478 ) ( ON ?auto_257476 ?auto_257477 ) ( ON ?auto_257475 ?auto_257476 ) ( ON ?auto_257474 ?auto_257475 ) ( ON ?auto_257473 ?auto_257474 ) ( ON ?auto_257472 ?auto_257473 ) ( ON ?auto_257471 ?auto_257472 ) ( ON ?auto_257470 ?auto_257471 ) ( ON ?auto_257469 ?auto_257470 ) ( CLEAR ?auto_257467 ) ( ON ?auto_257468 ?auto_257469 ) ( CLEAR ?auto_257468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_257467 ?auto_257468 )
      ( MAKE-13PILE ?auto_257467 ?auto_257468 ?auto_257469 ?auto_257470 ?auto_257471 ?auto_257472 ?auto_257473 ?auto_257474 ?auto_257475 ?auto_257476 ?auto_257477 ?auto_257478 ?auto_257479 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_257493 - BLOCK
      ?auto_257494 - BLOCK
      ?auto_257495 - BLOCK
      ?auto_257496 - BLOCK
      ?auto_257497 - BLOCK
      ?auto_257498 - BLOCK
      ?auto_257499 - BLOCK
      ?auto_257500 - BLOCK
      ?auto_257501 - BLOCK
      ?auto_257502 - BLOCK
      ?auto_257503 - BLOCK
      ?auto_257504 - BLOCK
      ?auto_257505 - BLOCK
    )
    :vars
    (
      ?auto_257506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257505 ?auto_257506 ) ( not ( = ?auto_257493 ?auto_257494 ) ) ( not ( = ?auto_257493 ?auto_257495 ) ) ( not ( = ?auto_257493 ?auto_257496 ) ) ( not ( = ?auto_257493 ?auto_257497 ) ) ( not ( = ?auto_257493 ?auto_257498 ) ) ( not ( = ?auto_257493 ?auto_257499 ) ) ( not ( = ?auto_257493 ?auto_257500 ) ) ( not ( = ?auto_257493 ?auto_257501 ) ) ( not ( = ?auto_257493 ?auto_257502 ) ) ( not ( = ?auto_257493 ?auto_257503 ) ) ( not ( = ?auto_257493 ?auto_257504 ) ) ( not ( = ?auto_257493 ?auto_257505 ) ) ( not ( = ?auto_257493 ?auto_257506 ) ) ( not ( = ?auto_257494 ?auto_257495 ) ) ( not ( = ?auto_257494 ?auto_257496 ) ) ( not ( = ?auto_257494 ?auto_257497 ) ) ( not ( = ?auto_257494 ?auto_257498 ) ) ( not ( = ?auto_257494 ?auto_257499 ) ) ( not ( = ?auto_257494 ?auto_257500 ) ) ( not ( = ?auto_257494 ?auto_257501 ) ) ( not ( = ?auto_257494 ?auto_257502 ) ) ( not ( = ?auto_257494 ?auto_257503 ) ) ( not ( = ?auto_257494 ?auto_257504 ) ) ( not ( = ?auto_257494 ?auto_257505 ) ) ( not ( = ?auto_257494 ?auto_257506 ) ) ( not ( = ?auto_257495 ?auto_257496 ) ) ( not ( = ?auto_257495 ?auto_257497 ) ) ( not ( = ?auto_257495 ?auto_257498 ) ) ( not ( = ?auto_257495 ?auto_257499 ) ) ( not ( = ?auto_257495 ?auto_257500 ) ) ( not ( = ?auto_257495 ?auto_257501 ) ) ( not ( = ?auto_257495 ?auto_257502 ) ) ( not ( = ?auto_257495 ?auto_257503 ) ) ( not ( = ?auto_257495 ?auto_257504 ) ) ( not ( = ?auto_257495 ?auto_257505 ) ) ( not ( = ?auto_257495 ?auto_257506 ) ) ( not ( = ?auto_257496 ?auto_257497 ) ) ( not ( = ?auto_257496 ?auto_257498 ) ) ( not ( = ?auto_257496 ?auto_257499 ) ) ( not ( = ?auto_257496 ?auto_257500 ) ) ( not ( = ?auto_257496 ?auto_257501 ) ) ( not ( = ?auto_257496 ?auto_257502 ) ) ( not ( = ?auto_257496 ?auto_257503 ) ) ( not ( = ?auto_257496 ?auto_257504 ) ) ( not ( = ?auto_257496 ?auto_257505 ) ) ( not ( = ?auto_257496 ?auto_257506 ) ) ( not ( = ?auto_257497 ?auto_257498 ) ) ( not ( = ?auto_257497 ?auto_257499 ) ) ( not ( = ?auto_257497 ?auto_257500 ) ) ( not ( = ?auto_257497 ?auto_257501 ) ) ( not ( = ?auto_257497 ?auto_257502 ) ) ( not ( = ?auto_257497 ?auto_257503 ) ) ( not ( = ?auto_257497 ?auto_257504 ) ) ( not ( = ?auto_257497 ?auto_257505 ) ) ( not ( = ?auto_257497 ?auto_257506 ) ) ( not ( = ?auto_257498 ?auto_257499 ) ) ( not ( = ?auto_257498 ?auto_257500 ) ) ( not ( = ?auto_257498 ?auto_257501 ) ) ( not ( = ?auto_257498 ?auto_257502 ) ) ( not ( = ?auto_257498 ?auto_257503 ) ) ( not ( = ?auto_257498 ?auto_257504 ) ) ( not ( = ?auto_257498 ?auto_257505 ) ) ( not ( = ?auto_257498 ?auto_257506 ) ) ( not ( = ?auto_257499 ?auto_257500 ) ) ( not ( = ?auto_257499 ?auto_257501 ) ) ( not ( = ?auto_257499 ?auto_257502 ) ) ( not ( = ?auto_257499 ?auto_257503 ) ) ( not ( = ?auto_257499 ?auto_257504 ) ) ( not ( = ?auto_257499 ?auto_257505 ) ) ( not ( = ?auto_257499 ?auto_257506 ) ) ( not ( = ?auto_257500 ?auto_257501 ) ) ( not ( = ?auto_257500 ?auto_257502 ) ) ( not ( = ?auto_257500 ?auto_257503 ) ) ( not ( = ?auto_257500 ?auto_257504 ) ) ( not ( = ?auto_257500 ?auto_257505 ) ) ( not ( = ?auto_257500 ?auto_257506 ) ) ( not ( = ?auto_257501 ?auto_257502 ) ) ( not ( = ?auto_257501 ?auto_257503 ) ) ( not ( = ?auto_257501 ?auto_257504 ) ) ( not ( = ?auto_257501 ?auto_257505 ) ) ( not ( = ?auto_257501 ?auto_257506 ) ) ( not ( = ?auto_257502 ?auto_257503 ) ) ( not ( = ?auto_257502 ?auto_257504 ) ) ( not ( = ?auto_257502 ?auto_257505 ) ) ( not ( = ?auto_257502 ?auto_257506 ) ) ( not ( = ?auto_257503 ?auto_257504 ) ) ( not ( = ?auto_257503 ?auto_257505 ) ) ( not ( = ?auto_257503 ?auto_257506 ) ) ( not ( = ?auto_257504 ?auto_257505 ) ) ( not ( = ?auto_257504 ?auto_257506 ) ) ( not ( = ?auto_257505 ?auto_257506 ) ) ( ON ?auto_257504 ?auto_257505 ) ( ON ?auto_257503 ?auto_257504 ) ( ON ?auto_257502 ?auto_257503 ) ( ON ?auto_257501 ?auto_257502 ) ( ON ?auto_257500 ?auto_257501 ) ( ON ?auto_257499 ?auto_257500 ) ( ON ?auto_257498 ?auto_257499 ) ( ON ?auto_257497 ?auto_257498 ) ( ON ?auto_257496 ?auto_257497 ) ( ON ?auto_257495 ?auto_257496 ) ( ON ?auto_257494 ?auto_257495 ) ( ON ?auto_257493 ?auto_257494 ) ( CLEAR ?auto_257493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_257493 )
      ( MAKE-13PILE ?auto_257493 ?auto_257494 ?auto_257495 ?auto_257496 ?auto_257497 ?auto_257498 ?auto_257499 ?auto_257500 ?auto_257501 ?auto_257502 ?auto_257503 ?auto_257504 ?auto_257505 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_257520 - BLOCK
      ?auto_257521 - BLOCK
      ?auto_257522 - BLOCK
      ?auto_257523 - BLOCK
      ?auto_257524 - BLOCK
      ?auto_257525 - BLOCK
      ?auto_257526 - BLOCK
      ?auto_257527 - BLOCK
      ?auto_257528 - BLOCK
      ?auto_257529 - BLOCK
      ?auto_257530 - BLOCK
      ?auto_257531 - BLOCK
      ?auto_257532 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_257532 ) ( not ( = ?auto_257520 ?auto_257521 ) ) ( not ( = ?auto_257520 ?auto_257522 ) ) ( not ( = ?auto_257520 ?auto_257523 ) ) ( not ( = ?auto_257520 ?auto_257524 ) ) ( not ( = ?auto_257520 ?auto_257525 ) ) ( not ( = ?auto_257520 ?auto_257526 ) ) ( not ( = ?auto_257520 ?auto_257527 ) ) ( not ( = ?auto_257520 ?auto_257528 ) ) ( not ( = ?auto_257520 ?auto_257529 ) ) ( not ( = ?auto_257520 ?auto_257530 ) ) ( not ( = ?auto_257520 ?auto_257531 ) ) ( not ( = ?auto_257520 ?auto_257532 ) ) ( not ( = ?auto_257521 ?auto_257522 ) ) ( not ( = ?auto_257521 ?auto_257523 ) ) ( not ( = ?auto_257521 ?auto_257524 ) ) ( not ( = ?auto_257521 ?auto_257525 ) ) ( not ( = ?auto_257521 ?auto_257526 ) ) ( not ( = ?auto_257521 ?auto_257527 ) ) ( not ( = ?auto_257521 ?auto_257528 ) ) ( not ( = ?auto_257521 ?auto_257529 ) ) ( not ( = ?auto_257521 ?auto_257530 ) ) ( not ( = ?auto_257521 ?auto_257531 ) ) ( not ( = ?auto_257521 ?auto_257532 ) ) ( not ( = ?auto_257522 ?auto_257523 ) ) ( not ( = ?auto_257522 ?auto_257524 ) ) ( not ( = ?auto_257522 ?auto_257525 ) ) ( not ( = ?auto_257522 ?auto_257526 ) ) ( not ( = ?auto_257522 ?auto_257527 ) ) ( not ( = ?auto_257522 ?auto_257528 ) ) ( not ( = ?auto_257522 ?auto_257529 ) ) ( not ( = ?auto_257522 ?auto_257530 ) ) ( not ( = ?auto_257522 ?auto_257531 ) ) ( not ( = ?auto_257522 ?auto_257532 ) ) ( not ( = ?auto_257523 ?auto_257524 ) ) ( not ( = ?auto_257523 ?auto_257525 ) ) ( not ( = ?auto_257523 ?auto_257526 ) ) ( not ( = ?auto_257523 ?auto_257527 ) ) ( not ( = ?auto_257523 ?auto_257528 ) ) ( not ( = ?auto_257523 ?auto_257529 ) ) ( not ( = ?auto_257523 ?auto_257530 ) ) ( not ( = ?auto_257523 ?auto_257531 ) ) ( not ( = ?auto_257523 ?auto_257532 ) ) ( not ( = ?auto_257524 ?auto_257525 ) ) ( not ( = ?auto_257524 ?auto_257526 ) ) ( not ( = ?auto_257524 ?auto_257527 ) ) ( not ( = ?auto_257524 ?auto_257528 ) ) ( not ( = ?auto_257524 ?auto_257529 ) ) ( not ( = ?auto_257524 ?auto_257530 ) ) ( not ( = ?auto_257524 ?auto_257531 ) ) ( not ( = ?auto_257524 ?auto_257532 ) ) ( not ( = ?auto_257525 ?auto_257526 ) ) ( not ( = ?auto_257525 ?auto_257527 ) ) ( not ( = ?auto_257525 ?auto_257528 ) ) ( not ( = ?auto_257525 ?auto_257529 ) ) ( not ( = ?auto_257525 ?auto_257530 ) ) ( not ( = ?auto_257525 ?auto_257531 ) ) ( not ( = ?auto_257525 ?auto_257532 ) ) ( not ( = ?auto_257526 ?auto_257527 ) ) ( not ( = ?auto_257526 ?auto_257528 ) ) ( not ( = ?auto_257526 ?auto_257529 ) ) ( not ( = ?auto_257526 ?auto_257530 ) ) ( not ( = ?auto_257526 ?auto_257531 ) ) ( not ( = ?auto_257526 ?auto_257532 ) ) ( not ( = ?auto_257527 ?auto_257528 ) ) ( not ( = ?auto_257527 ?auto_257529 ) ) ( not ( = ?auto_257527 ?auto_257530 ) ) ( not ( = ?auto_257527 ?auto_257531 ) ) ( not ( = ?auto_257527 ?auto_257532 ) ) ( not ( = ?auto_257528 ?auto_257529 ) ) ( not ( = ?auto_257528 ?auto_257530 ) ) ( not ( = ?auto_257528 ?auto_257531 ) ) ( not ( = ?auto_257528 ?auto_257532 ) ) ( not ( = ?auto_257529 ?auto_257530 ) ) ( not ( = ?auto_257529 ?auto_257531 ) ) ( not ( = ?auto_257529 ?auto_257532 ) ) ( not ( = ?auto_257530 ?auto_257531 ) ) ( not ( = ?auto_257530 ?auto_257532 ) ) ( not ( = ?auto_257531 ?auto_257532 ) ) ( ON ?auto_257531 ?auto_257532 ) ( ON ?auto_257530 ?auto_257531 ) ( ON ?auto_257529 ?auto_257530 ) ( ON ?auto_257528 ?auto_257529 ) ( ON ?auto_257527 ?auto_257528 ) ( ON ?auto_257526 ?auto_257527 ) ( ON ?auto_257525 ?auto_257526 ) ( ON ?auto_257524 ?auto_257525 ) ( ON ?auto_257523 ?auto_257524 ) ( ON ?auto_257522 ?auto_257523 ) ( ON ?auto_257521 ?auto_257522 ) ( ON ?auto_257520 ?auto_257521 ) ( CLEAR ?auto_257520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_257520 )
      ( MAKE-13PILE ?auto_257520 ?auto_257521 ?auto_257522 ?auto_257523 ?auto_257524 ?auto_257525 ?auto_257526 ?auto_257527 ?auto_257528 ?auto_257529 ?auto_257530 ?auto_257531 ?auto_257532 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_257546 - BLOCK
      ?auto_257547 - BLOCK
      ?auto_257548 - BLOCK
      ?auto_257549 - BLOCK
      ?auto_257550 - BLOCK
      ?auto_257551 - BLOCK
      ?auto_257552 - BLOCK
      ?auto_257553 - BLOCK
      ?auto_257554 - BLOCK
      ?auto_257555 - BLOCK
      ?auto_257556 - BLOCK
      ?auto_257557 - BLOCK
      ?auto_257558 - BLOCK
    )
    :vars
    (
      ?auto_257559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_257546 ?auto_257547 ) ) ( not ( = ?auto_257546 ?auto_257548 ) ) ( not ( = ?auto_257546 ?auto_257549 ) ) ( not ( = ?auto_257546 ?auto_257550 ) ) ( not ( = ?auto_257546 ?auto_257551 ) ) ( not ( = ?auto_257546 ?auto_257552 ) ) ( not ( = ?auto_257546 ?auto_257553 ) ) ( not ( = ?auto_257546 ?auto_257554 ) ) ( not ( = ?auto_257546 ?auto_257555 ) ) ( not ( = ?auto_257546 ?auto_257556 ) ) ( not ( = ?auto_257546 ?auto_257557 ) ) ( not ( = ?auto_257546 ?auto_257558 ) ) ( not ( = ?auto_257547 ?auto_257548 ) ) ( not ( = ?auto_257547 ?auto_257549 ) ) ( not ( = ?auto_257547 ?auto_257550 ) ) ( not ( = ?auto_257547 ?auto_257551 ) ) ( not ( = ?auto_257547 ?auto_257552 ) ) ( not ( = ?auto_257547 ?auto_257553 ) ) ( not ( = ?auto_257547 ?auto_257554 ) ) ( not ( = ?auto_257547 ?auto_257555 ) ) ( not ( = ?auto_257547 ?auto_257556 ) ) ( not ( = ?auto_257547 ?auto_257557 ) ) ( not ( = ?auto_257547 ?auto_257558 ) ) ( not ( = ?auto_257548 ?auto_257549 ) ) ( not ( = ?auto_257548 ?auto_257550 ) ) ( not ( = ?auto_257548 ?auto_257551 ) ) ( not ( = ?auto_257548 ?auto_257552 ) ) ( not ( = ?auto_257548 ?auto_257553 ) ) ( not ( = ?auto_257548 ?auto_257554 ) ) ( not ( = ?auto_257548 ?auto_257555 ) ) ( not ( = ?auto_257548 ?auto_257556 ) ) ( not ( = ?auto_257548 ?auto_257557 ) ) ( not ( = ?auto_257548 ?auto_257558 ) ) ( not ( = ?auto_257549 ?auto_257550 ) ) ( not ( = ?auto_257549 ?auto_257551 ) ) ( not ( = ?auto_257549 ?auto_257552 ) ) ( not ( = ?auto_257549 ?auto_257553 ) ) ( not ( = ?auto_257549 ?auto_257554 ) ) ( not ( = ?auto_257549 ?auto_257555 ) ) ( not ( = ?auto_257549 ?auto_257556 ) ) ( not ( = ?auto_257549 ?auto_257557 ) ) ( not ( = ?auto_257549 ?auto_257558 ) ) ( not ( = ?auto_257550 ?auto_257551 ) ) ( not ( = ?auto_257550 ?auto_257552 ) ) ( not ( = ?auto_257550 ?auto_257553 ) ) ( not ( = ?auto_257550 ?auto_257554 ) ) ( not ( = ?auto_257550 ?auto_257555 ) ) ( not ( = ?auto_257550 ?auto_257556 ) ) ( not ( = ?auto_257550 ?auto_257557 ) ) ( not ( = ?auto_257550 ?auto_257558 ) ) ( not ( = ?auto_257551 ?auto_257552 ) ) ( not ( = ?auto_257551 ?auto_257553 ) ) ( not ( = ?auto_257551 ?auto_257554 ) ) ( not ( = ?auto_257551 ?auto_257555 ) ) ( not ( = ?auto_257551 ?auto_257556 ) ) ( not ( = ?auto_257551 ?auto_257557 ) ) ( not ( = ?auto_257551 ?auto_257558 ) ) ( not ( = ?auto_257552 ?auto_257553 ) ) ( not ( = ?auto_257552 ?auto_257554 ) ) ( not ( = ?auto_257552 ?auto_257555 ) ) ( not ( = ?auto_257552 ?auto_257556 ) ) ( not ( = ?auto_257552 ?auto_257557 ) ) ( not ( = ?auto_257552 ?auto_257558 ) ) ( not ( = ?auto_257553 ?auto_257554 ) ) ( not ( = ?auto_257553 ?auto_257555 ) ) ( not ( = ?auto_257553 ?auto_257556 ) ) ( not ( = ?auto_257553 ?auto_257557 ) ) ( not ( = ?auto_257553 ?auto_257558 ) ) ( not ( = ?auto_257554 ?auto_257555 ) ) ( not ( = ?auto_257554 ?auto_257556 ) ) ( not ( = ?auto_257554 ?auto_257557 ) ) ( not ( = ?auto_257554 ?auto_257558 ) ) ( not ( = ?auto_257555 ?auto_257556 ) ) ( not ( = ?auto_257555 ?auto_257557 ) ) ( not ( = ?auto_257555 ?auto_257558 ) ) ( not ( = ?auto_257556 ?auto_257557 ) ) ( not ( = ?auto_257556 ?auto_257558 ) ) ( not ( = ?auto_257557 ?auto_257558 ) ) ( ON ?auto_257546 ?auto_257559 ) ( not ( = ?auto_257558 ?auto_257559 ) ) ( not ( = ?auto_257557 ?auto_257559 ) ) ( not ( = ?auto_257556 ?auto_257559 ) ) ( not ( = ?auto_257555 ?auto_257559 ) ) ( not ( = ?auto_257554 ?auto_257559 ) ) ( not ( = ?auto_257553 ?auto_257559 ) ) ( not ( = ?auto_257552 ?auto_257559 ) ) ( not ( = ?auto_257551 ?auto_257559 ) ) ( not ( = ?auto_257550 ?auto_257559 ) ) ( not ( = ?auto_257549 ?auto_257559 ) ) ( not ( = ?auto_257548 ?auto_257559 ) ) ( not ( = ?auto_257547 ?auto_257559 ) ) ( not ( = ?auto_257546 ?auto_257559 ) ) ( ON ?auto_257547 ?auto_257546 ) ( ON ?auto_257548 ?auto_257547 ) ( ON ?auto_257549 ?auto_257548 ) ( ON ?auto_257550 ?auto_257549 ) ( ON ?auto_257551 ?auto_257550 ) ( ON ?auto_257552 ?auto_257551 ) ( ON ?auto_257553 ?auto_257552 ) ( ON ?auto_257554 ?auto_257553 ) ( ON ?auto_257555 ?auto_257554 ) ( ON ?auto_257556 ?auto_257555 ) ( ON ?auto_257557 ?auto_257556 ) ( ON ?auto_257558 ?auto_257557 ) ( CLEAR ?auto_257558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_257558 ?auto_257557 ?auto_257556 ?auto_257555 ?auto_257554 ?auto_257553 ?auto_257552 ?auto_257551 ?auto_257550 ?auto_257549 ?auto_257548 ?auto_257547 ?auto_257546 )
      ( MAKE-13PILE ?auto_257546 ?auto_257547 ?auto_257548 ?auto_257549 ?auto_257550 ?auto_257551 ?auto_257552 ?auto_257553 ?auto_257554 ?auto_257555 ?auto_257556 ?auto_257557 ?auto_257558 ) )
  )

)

