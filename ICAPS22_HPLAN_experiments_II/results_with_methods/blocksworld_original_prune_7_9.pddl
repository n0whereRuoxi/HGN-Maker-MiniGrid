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

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89145 - BLOCK
      ?auto_89146 - BLOCK
      ?auto_89147 - BLOCK
      ?auto_89148 - BLOCK
      ?auto_89149 - BLOCK
      ?auto_89150 - BLOCK
      ?auto_89151 - BLOCK
    )
    :vars
    (
      ?auto_89152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89152 ?auto_89151 ) ( CLEAR ?auto_89152 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_89145 ) ( ON ?auto_89146 ?auto_89145 ) ( ON ?auto_89147 ?auto_89146 ) ( ON ?auto_89148 ?auto_89147 ) ( ON ?auto_89149 ?auto_89148 ) ( ON ?auto_89150 ?auto_89149 ) ( ON ?auto_89151 ?auto_89150 ) ( not ( = ?auto_89145 ?auto_89146 ) ) ( not ( = ?auto_89145 ?auto_89147 ) ) ( not ( = ?auto_89145 ?auto_89148 ) ) ( not ( = ?auto_89145 ?auto_89149 ) ) ( not ( = ?auto_89145 ?auto_89150 ) ) ( not ( = ?auto_89145 ?auto_89151 ) ) ( not ( = ?auto_89145 ?auto_89152 ) ) ( not ( = ?auto_89146 ?auto_89147 ) ) ( not ( = ?auto_89146 ?auto_89148 ) ) ( not ( = ?auto_89146 ?auto_89149 ) ) ( not ( = ?auto_89146 ?auto_89150 ) ) ( not ( = ?auto_89146 ?auto_89151 ) ) ( not ( = ?auto_89146 ?auto_89152 ) ) ( not ( = ?auto_89147 ?auto_89148 ) ) ( not ( = ?auto_89147 ?auto_89149 ) ) ( not ( = ?auto_89147 ?auto_89150 ) ) ( not ( = ?auto_89147 ?auto_89151 ) ) ( not ( = ?auto_89147 ?auto_89152 ) ) ( not ( = ?auto_89148 ?auto_89149 ) ) ( not ( = ?auto_89148 ?auto_89150 ) ) ( not ( = ?auto_89148 ?auto_89151 ) ) ( not ( = ?auto_89148 ?auto_89152 ) ) ( not ( = ?auto_89149 ?auto_89150 ) ) ( not ( = ?auto_89149 ?auto_89151 ) ) ( not ( = ?auto_89149 ?auto_89152 ) ) ( not ( = ?auto_89150 ?auto_89151 ) ) ( not ( = ?auto_89150 ?auto_89152 ) ) ( not ( = ?auto_89151 ?auto_89152 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_89152 ?auto_89151 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89154 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_89154 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_89154 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89155 - BLOCK
    )
    :vars
    (
      ?auto_89156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89155 ?auto_89156 ) ( CLEAR ?auto_89155 ) ( HAND-EMPTY ) ( not ( = ?auto_89155 ?auto_89156 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_89155 ?auto_89156 )
      ( MAKE-1PILE ?auto_89155 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89163 - BLOCK
      ?auto_89164 - BLOCK
      ?auto_89165 - BLOCK
      ?auto_89166 - BLOCK
      ?auto_89167 - BLOCK
      ?auto_89168 - BLOCK
    )
    :vars
    (
      ?auto_89169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89169 ?auto_89168 ) ( CLEAR ?auto_89169 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_89163 ) ( ON ?auto_89164 ?auto_89163 ) ( ON ?auto_89165 ?auto_89164 ) ( ON ?auto_89166 ?auto_89165 ) ( ON ?auto_89167 ?auto_89166 ) ( ON ?auto_89168 ?auto_89167 ) ( not ( = ?auto_89163 ?auto_89164 ) ) ( not ( = ?auto_89163 ?auto_89165 ) ) ( not ( = ?auto_89163 ?auto_89166 ) ) ( not ( = ?auto_89163 ?auto_89167 ) ) ( not ( = ?auto_89163 ?auto_89168 ) ) ( not ( = ?auto_89163 ?auto_89169 ) ) ( not ( = ?auto_89164 ?auto_89165 ) ) ( not ( = ?auto_89164 ?auto_89166 ) ) ( not ( = ?auto_89164 ?auto_89167 ) ) ( not ( = ?auto_89164 ?auto_89168 ) ) ( not ( = ?auto_89164 ?auto_89169 ) ) ( not ( = ?auto_89165 ?auto_89166 ) ) ( not ( = ?auto_89165 ?auto_89167 ) ) ( not ( = ?auto_89165 ?auto_89168 ) ) ( not ( = ?auto_89165 ?auto_89169 ) ) ( not ( = ?auto_89166 ?auto_89167 ) ) ( not ( = ?auto_89166 ?auto_89168 ) ) ( not ( = ?auto_89166 ?auto_89169 ) ) ( not ( = ?auto_89167 ?auto_89168 ) ) ( not ( = ?auto_89167 ?auto_89169 ) ) ( not ( = ?auto_89168 ?auto_89169 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_89169 ?auto_89168 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89170 - BLOCK
      ?auto_89171 - BLOCK
      ?auto_89172 - BLOCK
      ?auto_89173 - BLOCK
      ?auto_89174 - BLOCK
      ?auto_89175 - BLOCK
    )
    :vars
    (
      ?auto_89176 - BLOCK
      ?auto_89177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89176 ?auto_89175 ) ( CLEAR ?auto_89176 ) ( ON-TABLE ?auto_89170 ) ( ON ?auto_89171 ?auto_89170 ) ( ON ?auto_89172 ?auto_89171 ) ( ON ?auto_89173 ?auto_89172 ) ( ON ?auto_89174 ?auto_89173 ) ( ON ?auto_89175 ?auto_89174 ) ( not ( = ?auto_89170 ?auto_89171 ) ) ( not ( = ?auto_89170 ?auto_89172 ) ) ( not ( = ?auto_89170 ?auto_89173 ) ) ( not ( = ?auto_89170 ?auto_89174 ) ) ( not ( = ?auto_89170 ?auto_89175 ) ) ( not ( = ?auto_89170 ?auto_89176 ) ) ( not ( = ?auto_89171 ?auto_89172 ) ) ( not ( = ?auto_89171 ?auto_89173 ) ) ( not ( = ?auto_89171 ?auto_89174 ) ) ( not ( = ?auto_89171 ?auto_89175 ) ) ( not ( = ?auto_89171 ?auto_89176 ) ) ( not ( = ?auto_89172 ?auto_89173 ) ) ( not ( = ?auto_89172 ?auto_89174 ) ) ( not ( = ?auto_89172 ?auto_89175 ) ) ( not ( = ?auto_89172 ?auto_89176 ) ) ( not ( = ?auto_89173 ?auto_89174 ) ) ( not ( = ?auto_89173 ?auto_89175 ) ) ( not ( = ?auto_89173 ?auto_89176 ) ) ( not ( = ?auto_89174 ?auto_89175 ) ) ( not ( = ?auto_89174 ?auto_89176 ) ) ( not ( = ?auto_89175 ?auto_89176 ) ) ( HOLDING ?auto_89177 ) ( not ( = ?auto_89170 ?auto_89177 ) ) ( not ( = ?auto_89171 ?auto_89177 ) ) ( not ( = ?auto_89172 ?auto_89177 ) ) ( not ( = ?auto_89173 ?auto_89177 ) ) ( not ( = ?auto_89174 ?auto_89177 ) ) ( not ( = ?auto_89175 ?auto_89177 ) ) ( not ( = ?auto_89176 ?auto_89177 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_89177 )
      ( MAKE-6PILE ?auto_89170 ?auto_89171 ?auto_89172 ?auto_89173 ?auto_89174 ?auto_89175 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89178 - BLOCK
      ?auto_89179 - BLOCK
      ?auto_89180 - BLOCK
      ?auto_89181 - BLOCK
      ?auto_89182 - BLOCK
      ?auto_89183 - BLOCK
    )
    :vars
    (
      ?auto_89185 - BLOCK
      ?auto_89184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89185 ?auto_89183 ) ( ON-TABLE ?auto_89178 ) ( ON ?auto_89179 ?auto_89178 ) ( ON ?auto_89180 ?auto_89179 ) ( ON ?auto_89181 ?auto_89180 ) ( ON ?auto_89182 ?auto_89181 ) ( ON ?auto_89183 ?auto_89182 ) ( not ( = ?auto_89178 ?auto_89179 ) ) ( not ( = ?auto_89178 ?auto_89180 ) ) ( not ( = ?auto_89178 ?auto_89181 ) ) ( not ( = ?auto_89178 ?auto_89182 ) ) ( not ( = ?auto_89178 ?auto_89183 ) ) ( not ( = ?auto_89178 ?auto_89185 ) ) ( not ( = ?auto_89179 ?auto_89180 ) ) ( not ( = ?auto_89179 ?auto_89181 ) ) ( not ( = ?auto_89179 ?auto_89182 ) ) ( not ( = ?auto_89179 ?auto_89183 ) ) ( not ( = ?auto_89179 ?auto_89185 ) ) ( not ( = ?auto_89180 ?auto_89181 ) ) ( not ( = ?auto_89180 ?auto_89182 ) ) ( not ( = ?auto_89180 ?auto_89183 ) ) ( not ( = ?auto_89180 ?auto_89185 ) ) ( not ( = ?auto_89181 ?auto_89182 ) ) ( not ( = ?auto_89181 ?auto_89183 ) ) ( not ( = ?auto_89181 ?auto_89185 ) ) ( not ( = ?auto_89182 ?auto_89183 ) ) ( not ( = ?auto_89182 ?auto_89185 ) ) ( not ( = ?auto_89183 ?auto_89185 ) ) ( not ( = ?auto_89178 ?auto_89184 ) ) ( not ( = ?auto_89179 ?auto_89184 ) ) ( not ( = ?auto_89180 ?auto_89184 ) ) ( not ( = ?auto_89181 ?auto_89184 ) ) ( not ( = ?auto_89182 ?auto_89184 ) ) ( not ( = ?auto_89183 ?auto_89184 ) ) ( not ( = ?auto_89185 ?auto_89184 ) ) ( ON ?auto_89184 ?auto_89185 ) ( CLEAR ?auto_89184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_89178 ?auto_89179 ?auto_89180 ?auto_89181 ?auto_89182 ?auto_89183 ?auto_89185 )
      ( MAKE-6PILE ?auto_89178 ?auto_89179 ?auto_89180 ?auto_89181 ?auto_89182 ?auto_89183 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89188 - BLOCK
      ?auto_89189 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_89189 ) ( CLEAR ?auto_89188 ) ( ON-TABLE ?auto_89188 ) ( not ( = ?auto_89188 ?auto_89189 ) ) )
    :subtasks
    ( ( !STACK ?auto_89189 ?auto_89188 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89190 - BLOCK
      ?auto_89191 - BLOCK
    )
    :vars
    (
      ?auto_89192 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_89190 ) ( ON-TABLE ?auto_89190 ) ( not ( = ?auto_89190 ?auto_89191 ) ) ( ON ?auto_89191 ?auto_89192 ) ( CLEAR ?auto_89191 ) ( HAND-EMPTY ) ( not ( = ?auto_89190 ?auto_89192 ) ) ( not ( = ?auto_89191 ?auto_89192 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_89191 ?auto_89192 )
      ( MAKE-2PILE ?auto_89190 ?auto_89191 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89193 - BLOCK
      ?auto_89194 - BLOCK
    )
    :vars
    (
      ?auto_89195 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89193 ?auto_89194 ) ) ( ON ?auto_89194 ?auto_89195 ) ( CLEAR ?auto_89194 ) ( not ( = ?auto_89193 ?auto_89195 ) ) ( not ( = ?auto_89194 ?auto_89195 ) ) ( HOLDING ?auto_89193 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_89193 )
      ( MAKE-2PILE ?auto_89193 ?auto_89194 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89196 - BLOCK
      ?auto_89197 - BLOCK
    )
    :vars
    (
      ?auto_89198 - BLOCK
      ?auto_89199 - BLOCK
      ?auto_89201 - BLOCK
      ?auto_89200 - BLOCK
      ?auto_89202 - BLOCK
      ?auto_89203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89196 ?auto_89197 ) ) ( ON ?auto_89197 ?auto_89198 ) ( not ( = ?auto_89196 ?auto_89198 ) ) ( not ( = ?auto_89197 ?auto_89198 ) ) ( ON ?auto_89196 ?auto_89197 ) ( CLEAR ?auto_89196 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_89199 ) ( ON ?auto_89201 ?auto_89199 ) ( ON ?auto_89200 ?auto_89201 ) ( ON ?auto_89202 ?auto_89200 ) ( ON ?auto_89203 ?auto_89202 ) ( ON ?auto_89198 ?auto_89203 ) ( not ( = ?auto_89199 ?auto_89201 ) ) ( not ( = ?auto_89199 ?auto_89200 ) ) ( not ( = ?auto_89199 ?auto_89202 ) ) ( not ( = ?auto_89199 ?auto_89203 ) ) ( not ( = ?auto_89199 ?auto_89198 ) ) ( not ( = ?auto_89199 ?auto_89197 ) ) ( not ( = ?auto_89199 ?auto_89196 ) ) ( not ( = ?auto_89201 ?auto_89200 ) ) ( not ( = ?auto_89201 ?auto_89202 ) ) ( not ( = ?auto_89201 ?auto_89203 ) ) ( not ( = ?auto_89201 ?auto_89198 ) ) ( not ( = ?auto_89201 ?auto_89197 ) ) ( not ( = ?auto_89201 ?auto_89196 ) ) ( not ( = ?auto_89200 ?auto_89202 ) ) ( not ( = ?auto_89200 ?auto_89203 ) ) ( not ( = ?auto_89200 ?auto_89198 ) ) ( not ( = ?auto_89200 ?auto_89197 ) ) ( not ( = ?auto_89200 ?auto_89196 ) ) ( not ( = ?auto_89202 ?auto_89203 ) ) ( not ( = ?auto_89202 ?auto_89198 ) ) ( not ( = ?auto_89202 ?auto_89197 ) ) ( not ( = ?auto_89202 ?auto_89196 ) ) ( not ( = ?auto_89203 ?auto_89198 ) ) ( not ( = ?auto_89203 ?auto_89197 ) ) ( not ( = ?auto_89203 ?auto_89196 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_89199 ?auto_89201 ?auto_89200 ?auto_89202 ?auto_89203 ?auto_89198 ?auto_89197 )
      ( MAKE-2PILE ?auto_89196 ?auto_89197 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89209 - BLOCK
      ?auto_89210 - BLOCK
      ?auto_89211 - BLOCK
      ?auto_89212 - BLOCK
      ?auto_89213 - BLOCK
    )
    :vars
    (
      ?auto_89214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89214 ?auto_89213 ) ( CLEAR ?auto_89214 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_89209 ) ( ON ?auto_89210 ?auto_89209 ) ( ON ?auto_89211 ?auto_89210 ) ( ON ?auto_89212 ?auto_89211 ) ( ON ?auto_89213 ?auto_89212 ) ( not ( = ?auto_89209 ?auto_89210 ) ) ( not ( = ?auto_89209 ?auto_89211 ) ) ( not ( = ?auto_89209 ?auto_89212 ) ) ( not ( = ?auto_89209 ?auto_89213 ) ) ( not ( = ?auto_89209 ?auto_89214 ) ) ( not ( = ?auto_89210 ?auto_89211 ) ) ( not ( = ?auto_89210 ?auto_89212 ) ) ( not ( = ?auto_89210 ?auto_89213 ) ) ( not ( = ?auto_89210 ?auto_89214 ) ) ( not ( = ?auto_89211 ?auto_89212 ) ) ( not ( = ?auto_89211 ?auto_89213 ) ) ( not ( = ?auto_89211 ?auto_89214 ) ) ( not ( = ?auto_89212 ?auto_89213 ) ) ( not ( = ?auto_89212 ?auto_89214 ) ) ( not ( = ?auto_89213 ?auto_89214 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_89214 ?auto_89213 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89215 - BLOCK
      ?auto_89216 - BLOCK
      ?auto_89217 - BLOCK
      ?auto_89218 - BLOCK
      ?auto_89219 - BLOCK
    )
    :vars
    (
      ?auto_89220 - BLOCK
      ?auto_89221 - BLOCK
      ?auto_89222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89220 ?auto_89219 ) ( CLEAR ?auto_89220 ) ( ON-TABLE ?auto_89215 ) ( ON ?auto_89216 ?auto_89215 ) ( ON ?auto_89217 ?auto_89216 ) ( ON ?auto_89218 ?auto_89217 ) ( ON ?auto_89219 ?auto_89218 ) ( not ( = ?auto_89215 ?auto_89216 ) ) ( not ( = ?auto_89215 ?auto_89217 ) ) ( not ( = ?auto_89215 ?auto_89218 ) ) ( not ( = ?auto_89215 ?auto_89219 ) ) ( not ( = ?auto_89215 ?auto_89220 ) ) ( not ( = ?auto_89216 ?auto_89217 ) ) ( not ( = ?auto_89216 ?auto_89218 ) ) ( not ( = ?auto_89216 ?auto_89219 ) ) ( not ( = ?auto_89216 ?auto_89220 ) ) ( not ( = ?auto_89217 ?auto_89218 ) ) ( not ( = ?auto_89217 ?auto_89219 ) ) ( not ( = ?auto_89217 ?auto_89220 ) ) ( not ( = ?auto_89218 ?auto_89219 ) ) ( not ( = ?auto_89218 ?auto_89220 ) ) ( not ( = ?auto_89219 ?auto_89220 ) ) ( HOLDING ?auto_89221 ) ( CLEAR ?auto_89222 ) ( not ( = ?auto_89215 ?auto_89221 ) ) ( not ( = ?auto_89215 ?auto_89222 ) ) ( not ( = ?auto_89216 ?auto_89221 ) ) ( not ( = ?auto_89216 ?auto_89222 ) ) ( not ( = ?auto_89217 ?auto_89221 ) ) ( not ( = ?auto_89217 ?auto_89222 ) ) ( not ( = ?auto_89218 ?auto_89221 ) ) ( not ( = ?auto_89218 ?auto_89222 ) ) ( not ( = ?auto_89219 ?auto_89221 ) ) ( not ( = ?auto_89219 ?auto_89222 ) ) ( not ( = ?auto_89220 ?auto_89221 ) ) ( not ( = ?auto_89220 ?auto_89222 ) ) ( not ( = ?auto_89221 ?auto_89222 ) ) )
    :subtasks
    ( ( !STACK ?auto_89221 ?auto_89222 )
      ( MAKE-5PILE ?auto_89215 ?auto_89216 ?auto_89217 ?auto_89218 ?auto_89219 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_90141 - BLOCK
      ?auto_90142 - BLOCK
      ?auto_90143 - BLOCK
      ?auto_90144 - BLOCK
      ?auto_90145 - BLOCK
    )
    :vars
    (
      ?auto_90146 - BLOCK
      ?auto_90147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90146 ?auto_90145 ) ( ON-TABLE ?auto_90141 ) ( ON ?auto_90142 ?auto_90141 ) ( ON ?auto_90143 ?auto_90142 ) ( ON ?auto_90144 ?auto_90143 ) ( ON ?auto_90145 ?auto_90144 ) ( not ( = ?auto_90141 ?auto_90142 ) ) ( not ( = ?auto_90141 ?auto_90143 ) ) ( not ( = ?auto_90141 ?auto_90144 ) ) ( not ( = ?auto_90141 ?auto_90145 ) ) ( not ( = ?auto_90141 ?auto_90146 ) ) ( not ( = ?auto_90142 ?auto_90143 ) ) ( not ( = ?auto_90142 ?auto_90144 ) ) ( not ( = ?auto_90142 ?auto_90145 ) ) ( not ( = ?auto_90142 ?auto_90146 ) ) ( not ( = ?auto_90143 ?auto_90144 ) ) ( not ( = ?auto_90143 ?auto_90145 ) ) ( not ( = ?auto_90143 ?auto_90146 ) ) ( not ( = ?auto_90144 ?auto_90145 ) ) ( not ( = ?auto_90144 ?auto_90146 ) ) ( not ( = ?auto_90145 ?auto_90146 ) ) ( not ( = ?auto_90141 ?auto_90147 ) ) ( not ( = ?auto_90142 ?auto_90147 ) ) ( not ( = ?auto_90143 ?auto_90147 ) ) ( not ( = ?auto_90144 ?auto_90147 ) ) ( not ( = ?auto_90145 ?auto_90147 ) ) ( not ( = ?auto_90146 ?auto_90147 ) ) ( ON ?auto_90147 ?auto_90146 ) ( CLEAR ?auto_90147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90141 ?auto_90142 ?auto_90143 ?auto_90144 ?auto_90145 ?auto_90146 )
      ( MAKE-5PILE ?auto_90141 ?auto_90142 ?auto_90143 ?auto_90144 ?auto_90145 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89231 - BLOCK
      ?auto_89232 - BLOCK
      ?auto_89233 - BLOCK
      ?auto_89234 - BLOCK
      ?auto_89235 - BLOCK
    )
    :vars
    (
      ?auto_89236 - BLOCK
      ?auto_89237 - BLOCK
      ?auto_89238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89236 ?auto_89235 ) ( ON-TABLE ?auto_89231 ) ( ON ?auto_89232 ?auto_89231 ) ( ON ?auto_89233 ?auto_89232 ) ( ON ?auto_89234 ?auto_89233 ) ( ON ?auto_89235 ?auto_89234 ) ( not ( = ?auto_89231 ?auto_89232 ) ) ( not ( = ?auto_89231 ?auto_89233 ) ) ( not ( = ?auto_89231 ?auto_89234 ) ) ( not ( = ?auto_89231 ?auto_89235 ) ) ( not ( = ?auto_89231 ?auto_89236 ) ) ( not ( = ?auto_89232 ?auto_89233 ) ) ( not ( = ?auto_89232 ?auto_89234 ) ) ( not ( = ?auto_89232 ?auto_89235 ) ) ( not ( = ?auto_89232 ?auto_89236 ) ) ( not ( = ?auto_89233 ?auto_89234 ) ) ( not ( = ?auto_89233 ?auto_89235 ) ) ( not ( = ?auto_89233 ?auto_89236 ) ) ( not ( = ?auto_89234 ?auto_89235 ) ) ( not ( = ?auto_89234 ?auto_89236 ) ) ( not ( = ?auto_89235 ?auto_89236 ) ) ( not ( = ?auto_89231 ?auto_89237 ) ) ( not ( = ?auto_89231 ?auto_89238 ) ) ( not ( = ?auto_89232 ?auto_89237 ) ) ( not ( = ?auto_89232 ?auto_89238 ) ) ( not ( = ?auto_89233 ?auto_89237 ) ) ( not ( = ?auto_89233 ?auto_89238 ) ) ( not ( = ?auto_89234 ?auto_89237 ) ) ( not ( = ?auto_89234 ?auto_89238 ) ) ( not ( = ?auto_89235 ?auto_89237 ) ) ( not ( = ?auto_89235 ?auto_89238 ) ) ( not ( = ?auto_89236 ?auto_89237 ) ) ( not ( = ?auto_89236 ?auto_89238 ) ) ( not ( = ?auto_89237 ?auto_89238 ) ) ( ON ?auto_89237 ?auto_89236 ) ( CLEAR ?auto_89237 ) ( HOLDING ?auto_89238 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_89238 )
      ( MAKE-5PILE ?auto_89231 ?auto_89232 ?auto_89233 ?auto_89234 ?auto_89235 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89239 - BLOCK
      ?auto_89240 - BLOCK
      ?auto_89241 - BLOCK
      ?auto_89242 - BLOCK
      ?auto_89243 - BLOCK
    )
    :vars
    (
      ?auto_89246 - BLOCK
      ?auto_89245 - BLOCK
      ?auto_89244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89246 ?auto_89243 ) ( ON-TABLE ?auto_89239 ) ( ON ?auto_89240 ?auto_89239 ) ( ON ?auto_89241 ?auto_89240 ) ( ON ?auto_89242 ?auto_89241 ) ( ON ?auto_89243 ?auto_89242 ) ( not ( = ?auto_89239 ?auto_89240 ) ) ( not ( = ?auto_89239 ?auto_89241 ) ) ( not ( = ?auto_89239 ?auto_89242 ) ) ( not ( = ?auto_89239 ?auto_89243 ) ) ( not ( = ?auto_89239 ?auto_89246 ) ) ( not ( = ?auto_89240 ?auto_89241 ) ) ( not ( = ?auto_89240 ?auto_89242 ) ) ( not ( = ?auto_89240 ?auto_89243 ) ) ( not ( = ?auto_89240 ?auto_89246 ) ) ( not ( = ?auto_89241 ?auto_89242 ) ) ( not ( = ?auto_89241 ?auto_89243 ) ) ( not ( = ?auto_89241 ?auto_89246 ) ) ( not ( = ?auto_89242 ?auto_89243 ) ) ( not ( = ?auto_89242 ?auto_89246 ) ) ( not ( = ?auto_89243 ?auto_89246 ) ) ( not ( = ?auto_89239 ?auto_89245 ) ) ( not ( = ?auto_89239 ?auto_89244 ) ) ( not ( = ?auto_89240 ?auto_89245 ) ) ( not ( = ?auto_89240 ?auto_89244 ) ) ( not ( = ?auto_89241 ?auto_89245 ) ) ( not ( = ?auto_89241 ?auto_89244 ) ) ( not ( = ?auto_89242 ?auto_89245 ) ) ( not ( = ?auto_89242 ?auto_89244 ) ) ( not ( = ?auto_89243 ?auto_89245 ) ) ( not ( = ?auto_89243 ?auto_89244 ) ) ( not ( = ?auto_89246 ?auto_89245 ) ) ( not ( = ?auto_89246 ?auto_89244 ) ) ( not ( = ?auto_89245 ?auto_89244 ) ) ( ON ?auto_89245 ?auto_89246 ) ( ON ?auto_89244 ?auto_89245 ) ( CLEAR ?auto_89244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_89239 ?auto_89240 ?auto_89241 ?auto_89242 ?auto_89243 ?auto_89246 ?auto_89245 )
      ( MAKE-5PILE ?auto_89239 ?auto_89240 ?auto_89241 ?auto_89242 ?auto_89243 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_89250 - BLOCK
      ?auto_89251 - BLOCK
      ?auto_89252 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_89252 ) ( CLEAR ?auto_89251 ) ( ON-TABLE ?auto_89250 ) ( ON ?auto_89251 ?auto_89250 ) ( not ( = ?auto_89250 ?auto_89251 ) ) ( not ( = ?auto_89250 ?auto_89252 ) ) ( not ( = ?auto_89251 ?auto_89252 ) ) )
    :subtasks
    ( ( !STACK ?auto_89252 ?auto_89251 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_89253 - BLOCK
      ?auto_89254 - BLOCK
      ?auto_89255 - BLOCK
    )
    :vars
    (
      ?auto_89256 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_89254 ) ( ON-TABLE ?auto_89253 ) ( ON ?auto_89254 ?auto_89253 ) ( not ( = ?auto_89253 ?auto_89254 ) ) ( not ( = ?auto_89253 ?auto_89255 ) ) ( not ( = ?auto_89254 ?auto_89255 ) ) ( ON ?auto_89255 ?auto_89256 ) ( CLEAR ?auto_89255 ) ( HAND-EMPTY ) ( not ( = ?auto_89253 ?auto_89256 ) ) ( not ( = ?auto_89254 ?auto_89256 ) ) ( not ( = ?auto_89255 ?auto_89256 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_89255 ?auto_89256 )
      ( MAKE-3PILE ?auto_89253 ?auto_89254 ?auto_89255 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_89257 - BLOCK
      ?auto_89258 - BLOCK
      ?auto_89259 - BLOCK
    )
    :vars
    (
      ?auto_89260 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89257 ) ( not ( = ?auto_89257 ?auto_89258 ) ) ( not ( = ?auto_89257 ?auto_89259 ) ) ( not ( = ?auto_89258 ?auto_89259 ) ) ( ON ?auto_89259 ?auto_89260 ) ( CLEAR ?auto_89259 ) ( not ( = ?auto_89257 ?auto_89260 ) ) ( not ( = ?auto_89258 ?auto_89260 ) ) ( not ( = ?auto_89259 ?auto_89260 ) ) ( HOLDING ?auto_89258 ) ( CLEAR ?auto_89257 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89257 ?auto_89258 )
      ( MAKE-3PILE ?auto_89257 ?auto_89258 ?auto_89259 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_89261 - BLOCK
      ?auto_89262 - BLOCK
      ?auto_89263 - BLOCK
    )
    :vars
    (
      ?auto_89264 - BLOCK
      ?auto_89267 - BLOCK
      ?auto_89265 - BLOCK
      ?auto_89268 - BLOCK
      ?auto_89266 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89261 ) ( not ( = ?auto_89261 ?auto_89262 ) ) ( not ( = ?auto_89261 ?auto_89263 ) ) ( not ( = ?auto_89262 ?auto_89263 ) ) ( ON ?auto_89263 ?auto_89264 ) ( not ( = ?auto_89261 ?auto_89264 ) ) ( not ( = ?auto_89262 ?auto_89264 ) ) ( not ( = ?auto_89263 ?auto_89264 ) ) ( CLEAR ?auto_89261 ) ( ON ?auto_89262 ?auto_89263 ) ( CLEAR ?auto_89262 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_89267 ) ( ON ?auto_89265 ?auto_89267 ) ( ON ?auto_89268 ?auto_89265 ) ( ON ?auto_89266 ?auto_89268 ) ( ON ?auto_89264 ?auto_89266 ) ( not ( = ?auto_89267 ?auto_89265 ) ) ( not ( = ?auto_89267 ?auto_89268 ) ) ( not ( = ?auto_89267 ?auto_89266 ) ) ( not ( = ?auto_89267 ?auto_89264 ) ) ( not ( = ?auto_89267 ?auto_89263 ) ) ( not ( = ?auto_89267 ?auto_89262 ) ) ( not ( = ?auto_89265 ?auto_89268 ) ) ( not ( = ?auto_89265 ?auto_89266 ) ) ( not ( = ?auto_89265 ?auto_89264 ) ) ( not ( = ?auto_89265 ?auto_89263 ) ) ( not ( = ?auto_89265 ?auto_89262 ) ) ( not ( = ?auto_89268 ?auto_89266 ) ) ( not ( = ?auto_89268 ?auto_89264 ) ) ( not ( = ?auto_89268 ?auto_89263 ) ) ( not ( = ?auto_89268 ?auto_89262 ) ) ( not ( = ?auto_89266 ?auto_89264 ) ) ( not ( = ?auto_89266 ?auto_89263 ) ) ( not ( = ?auto_89266 ?auto_89262 ) ) ( not ( = ?auto_89261 ?auto_89267 ) ) ( not ( = ?auto_89261 ?auto_89265 ) ) ( not ( = ?auto_89261 ?auto_89268 ) ) ( not ( = ?auto_89261 ?auto_89266 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89267 ?auto_89265 ?auto_89268 ?auto_89266 ?auto_89264 ?auto_89263 )
      ( MAKE-3PILE ?auto_89261 ?auto_89262 ?auto_89263 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_89269 - BLOCK
      ?auto_89270 - BLOCK
      ?auto_89271 - BLOCK
    )
    :vars
    (
      ?auto_89272 - BLOCK
      ?auto_89275 - BLOCK
      ?auto_89273 - BLOCK
      ?auto_89274 - BLOCK
      ?auto_89276 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89269 ?auto_89270 ) ) ( not ( = ?auto_89269 ?auto_89271 ) ) ( not ( = ?auto_89270 ?auto_89271 ) ) ( ON ?auto_89271 ?auto_89272 ) ( not ( = ?auto_89269 ?auto_89272 ) ) ( not ( = ?auto_89270 ?auto_89272 ) ) ( not ( = ?auto_89271 ?auto_89272 ) ) ( ON ?auto_89270 ?auto_89271 ) ( CLEAR ?auto_89270 ) ( ON-TABLE ?auto_89275 ) ( ON ?auto_89273 ?auto_89275 ) ( ON ?auto_89274 ?auto_89273 ) ( ON ?auto_89276 ?auto_89274 ) ( ON ?auto_89272 ?auto_89276 ) ( not ( = ?auto_89275 ?auto_89273 ) ) ( not ( = ?auto_89275 ?auto_89274 ) ) ( not ( = ?auto_89275 ?auto_89276 ) ) ( not ( = ?auto_89275 ?auto_89272 ) ) ( not ( = ?auto_89275 ?auto_89271 ) ) ( not ( = ?auto_89275 ?auto_89270 ) ) ( not ( = ?auto_89273 ?auto_89274 ) ) ( not ( = ?auto_89273 ?auto_89276 ) ) ( not ( = ?auto_89273 ?auto_89272 ) ) ( not ( = ?auto_89273 ?auto_89271 ) ) ( not ( = ?auto_89273 ?auto_89270 ) ) ( not ( = ?auto_89274 ?auto_89276 ) ) ( not ( = ?auto_89274 ?auto_89272 ) ) ( not ( = ?auto_89274 ?auto_89271 ) ) ( not ( = ?auto_89274 ?auto_89270 ) ) ( not ( = ?auto_89276 ?auto_89272 ) ) ( not ( = ?auto_89276 ?auto_89271 ) ) ( not ( = ?auto_89276 ?auto_89270 ) ) ( not ( = ?auto_89269 ?auto_89275 ) ) ( not ( = ?auto_89269 ?auto_89273 ) ) ( not ( = ?auto_89269 ?auto_89274 ) ) ( not ( = ?auto_89269 ?auto_89276 ) ) ( HOLDING ?auto_89269 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_89269 )
      ( MAKE-3PILE ?auto_89269 ?auto_89270 ?auto_89271 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_89277 - BLOCK
      ?auto_89278 - BLOCK
      ?auto_89279 - BLOCK
    )
    :vars
    (
      ?auto_89280 - BLOCK
      ?auto_89282 - BLOCK
      ?auto_89281 - BLOCK
      ?auto_89283 - BLOCK
      ?auto_89284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89277 ?auto_89278 ) ) ( not ( = ?auto_89277 ?auto_89279 ) ) ( not ( = ?auto_89278 ?auto_89279 ) ) ( ON ?auto_89279 ?auto_89280 ) ( not ( = ?auto_89277 ?auto_89280 ) ) ( not ( = ?auto_89278 ?auto_89280 ) ) ( not ( = ?auto_89279 ?auto_89280 ) ) ( ON ?auto_89278 ?auto_89279 ) ( ON-TABLE ?auto_89282 ) ( ON ?auto_89281 ?auto_89282 ) ( ON ?auto_89283 ?auto_89281 ) ( ON ?auto_89284 ?auto_89283 ) ( ON ?auto_89280 ?auto_89284 ) ( not ( = ?auto_89282 ?auto_89281 ) ) ( not ( = ?auto_89282 ?auto_89283 ) ) ( not ( = ?auto_89282 ?auto_89284 ) ) ( not ( = ?auto_89282 ?auto_89280 ) ) ( not ( = ?auto_89282 ?auto_89279 ) ) ( not ( = ?auto_89282 ?auto_89278 ) ) ( not ( = ?auto_89281 ?auto_89283 ) ) ( not ( = ?auto_89281 ?auto_89284 ) ) ( not ( = ?auto_89281 ?auto_89280 ) ) ( not ( = ?auto_89281 ?auto_89279 ) ) ( not ( = ?auto_89281 ?auto_89278 ) ) ( not ( = ?auto_89283 ?auto_89284 ) ) ( not ( = ?auto_89283 ?auto_89280 ) ) ( not ( = ?auto_89283 ?auto_89279 ) ) ( not ( = ?auto_89283 ?auto_89278 ) ) ( not ( = ?auto_89284 ?auto_89280 ) ) ( not ( = ?auto_89284 ?auto_89279 ) ) ( not ( = ?auto_89284 ?auto_89278 ) ) ( not ( = ?auto_89277 ?auto_89282 ) ) ( not ( = ?auto_89277 ?auto_89281 ) ) ( not ( = ?auto_89277 ?auto_89283 ) ) ( not ( = ?auto_89277 ?auto_89284 ) ) ( ON ?auto_89277 ?auto_89278 ) ( CLEAR ?auto_89277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_89282 ?auto_89281 ?auto_89283 ?auto_89284 ?auto_89280 ?auto_89279 ?auto_89278 )
      ( MAKE-3PILE ?auto_89277 ?auto_89278 ?auto_89279 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_89289 - BLOCK
      ?auto_89290 - BLOCK
      ?auto_89291 - BLOCK
      ?auto_89292 - BLOCK
    )
    :vars
    (
      ?auto_89293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89293 ?auto_89292 ) ( CLEAR ?auto_89293 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_89289 ) ( ON ?auto_89290 ?auto_89289 ) ( ON ?auto_89291 ?auto_89290 ) ( ON ?auto_89292 ?auto_89291 ) ( not ( = ?auto_89289 ?auto_89290 ) ) ( not ( = ?auto_89289 ?auto_89291 ) ) ( not ( = ?auto_89289 ?auto_89292 ) ) ( not ( = ?auto_89289 ?auto_89293 ) ) ( not ( = ?auto_89290 ?auto_89291 ) ) ( not ( = ?auto_89290 ?auto_89292 ) ) ( not ( = ?auto_89290 ?auto_89293 ) ) ( not ( = ?auto_89291 ?auto_89292 ) ) ( not ( = ?auto_89291 ?auto_89293 ) ) ( not ( = ?auto_89292 ?auto_89293 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_89293 ?auto_89292 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_89294 - BLOCK
      ?auto_89295 - BLOCK
      ?auto_89296 - BLOCK
      ?auto_89297 - BLOCK
    )
    :vars
    (
      ?auto_89298 - BLOCK
      ?auto_89299 - BLOCK
      ?auto_89300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89298 ?auto_89297 ) ( CLEAR ?auto_89298 ) ( ON-TABLE ?auto_89294 ) ( ON ?auto_89295 ?auto_89294 ) ( ON ?auto_89296 ?auto_89295 ) ( ON ?auto_89297 ?auto_89296 ) ( not ( = ?auto_89294 ?auto_89295 ) ) ( not ( = ?auto_89294 ?auto_89296 ) ) ( not ( = ?auto_89294 ?auto_89297 ) ) ( not ( = ?auto_89294 ?auto_89298 ) ) ( not ( = ?auto_89295 ?auto_89296 ) ) ( not ( = ?auto_89295 ?auto_89297 ) ) ( not ( = ?auto_89295 ?auto_89298 ) ) ( not ( = ?auto_89296 ?auto_89297 ) ) ( not ( = ?auto_89296 ?auto_89298 ) ) ( not ( = ?auto_89297 ?auto_89298 ) ) ( HOLDING ?auto_89299 ) ( CLEAR ?auto_89300 ) ( not ( = ?auto_89294 ?auto_89299 ) ) ( not ( = ?auto_89294 ?auto_89300 ) ) ( not ( = ?auto_89295 ?auto_89299 ) ) ( not ( = ?auto_89295 ?auto_89300 ) ) ( not ( = ?auto_89296 ?auto_89299 ) ) ( not ( = ?auto_89296 ?auto_89300 ) ) ( not ( = ?auto_89297 ?auto_89299 ) ) ( not ( = ?auto_89297 ?auto_89300 ) ) ( not ( = ?auto_89298 ?auto_89299 ) ) ( not ( = ?auto_89298 ?auto_89300 ) ) ( not ( = ?auto_89299 ?auto_89300 ) ) )
    :subtasks
    ( ( !STACK ?auto_89299 ?auto_89300 )
      ( MAKE-4PILE ?auto_89294 ?auto_89295 ?auto_89296 ?auto_89297 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_89301 - BLOCK
      ?auto_89302 - BLOCK
      ?auto_89303 - BLOCK
      ?auto_89304 - BLOCK
    )
    :vars
    (
      ?auto_89306 - BLOCK
      ?auto_89307 - BLOCK
      ?auto_89305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89306 ?auto_89304 ) ( ON-TABLE ?auto_89301 ) ( ON ?auto_89302 ?auto_89301 ) ( ON ?auto_89303 ?auto_89302 ) ( ON ?auto_89304 ?auto_89303 ) ( not ( = ?auto_89301 ?auto_89302 ) ) ( not ( = ?auto_89301 ?auto_89303 ) ) ( not ( = ?auto_89301 ?auto_89304 ) ) ( not ( = ?auto_89301 ?auto_89306 ) ) ( not ( = ?auto_89302 ?auto_89303 ) ) ( not ( = ?auto_89302 ?auto_89304 ) ) ( not ( = ?auto_89302 ?auto_89306 ) ) ( not ( = ?auto_89303 ?auto_89304 ) ) ( not ( = ?auto_89303 ?auto_89306 ) ) ( not ( = ?auto_89304 ?auto_89306 ) ) ( CLEAR ?auto_89307 ) ( not ( = ?auto_89301 ?auto_89305 ) ) ( not ( = ?auto_89301 ?auto_89307 ) ) ( not ( = ?auto_89302 ?auto_89305 ) ) ( not ( = ?auto_89302 ?auto_89307 ) ) ( not ( = ?auto_89303 ?auto_89305 ) ) ( not ( = ?auto_89303 ?auto_89307 ) ) ( not ( = ?auto_89304 ?auto_89305 ) ) ( not ( = ?auto_89304 ?auto_89307 ) ) ( not ( = ?auto_89306 ?auto_89305 ) ) ( not ( = ?auto_89306 ?auto_89307 ) ) ( not ( = ?auto_89305 ?auto_89307 ) ) ( ON ?auto_89305 ?auto_89306 ) ( CLEAR ?auto_89305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89301 ?auto_89302 ?auto_89303 ?auto_89304 ?auto_89306 )
      ( MAKE-4PILE ?auto_89301 ?auto_89302 ?auto_89303 ?auto_89304 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_89308 - BLOCK
      ?auto_89309 - BLOCK
      ?auto_89310 - BLOCK
      ?auto_89311 - BLOCK
    )
    :vars
    (
      ?auto_89312 - BLOCK
      ?auto_89314 - BLOCK
      ?auto_89313 - BLOCK
      ?auto_89315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89312 ?auto_89311 ) ( ON-TABLE ?auto_89308 ) ( ON ?auto_89309 ?auto_89308 ) ( ON ?auto_89310 ?auto_89309 ) ( ON ?auto_89311 ?auto_89310 ) ( not ( = ?auto_89308 ?auto_89309 ) ) ( not ( = ?auto_89308 ?auto_89310 ) ) ( not ( = ?auto_89308 ?auto_89311 ) ) ( not ( = ?auto_89308 ?auto_89312 ) ) ( not ( = ?auto_89309 ?auto_89310 ) ) ( not ( = ?auto_89309 ?auto_89311 ) ) ( not ( = ?auto_89309 ?auto_89312 ) ) ( not ( = ?auto_89310 ?auto_89311 ) ) ( not ( = ?auto_89310 ?auto_89312 ) ) ( not ( = ?auto_89311 ?auto_89312 ) ) ( not ( = ?auto_89308 ?auto_89314 ) ) ( not ( = ?auto_89308 ?auto_89313 ) ) ( not ( = ?auto_89309 ?auto_89314 ) ) ( not ( = ?auto_89309 ?auto_89313 ) ) ( not ( = ?auto_89310 ?auto_89314 ) ) ( not ( = ?auto_89310 ?auto_89313 ) ) ( not ( = ?auto_89311 ?auto_89314 ) ) ( not ( = ?auto_89311 ?auto_89313 ) ) ( not ( = ?auto_89312 ?auto_89314 ) ) ( not ( = ?auto_89312 ?auto_89313 ) ) ( not ( = ?auto_89314 ?auto_89313 ) ) ( ON ?auto_89314 ?auto_89312 ) ( CLEAR ?auto_89314 ) ( HOLDING ?auto_89313 ) ( CLEAR ?auto_89315 ) ( ON-TABLE ?auto_89315 ) ( not ( = ?auto_89315 ?auto_89313 ) ) ( not ( = ?auto_89308 ?auto_89315 ) ) ( not ( = ?auto_89309 ?auto_89315 ) ) ( not ( = ?auto_89310 ?auto_89315 ) ) ( not ( = ?auto_89311 ?auto_89315 ) ) ( not ( = ?auto_89312 ?auto_89315 ) ) ( not ( = ?auto_89314 ?auto_89315 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89315 ?auto_89313 )
      ( MAKE-4PILE ?auto_89308 ?auto_89309 ?auto_89310 ?auto_89311 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90370 - BLOCK
      ?auto_90371 - BLOCK
      ?auto_90372 - BLOCK
      ?auto_90373 - BLOCK
    )
    :vars
    (
      ?auto_90374 - BLOCK
      ?auto_90376 - BLOCK
      ?auto_90375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90374 ?auto_90373 ) ( ON-TABLE ?auto_90370 ) ( ON ?auto_90371 ?auto_90370 ) ( ON ?auto_90372 ?auto_90371 ) ( ON ?auto_90373 ?auto_90372 ) ( not ( = ?auto_90370 ?auto_90371 ) ) ( not ( = ?auto_90370 ?auto_90372 ) ) ( not ( = ?auto_90370 ?auto_90373 ) ) ( not ( = ?auto_90370 ?auto_90374 ) ) ( not ( = ?auto_90371 ?auto_90372 ) ) ( not ( = ?auto_90371 ?auto_90373 ) ) ( not ( = ?auto_90371 ?auto_90374 ) ) ( not ( = ?auto_90372 ?auto_90373 ) ) ( not ( = ?auto_90372 ?auto_90374 ) ) ( not ( = ?auto_90373 ?auto_90374 ) ) ( not ( = ?auto_90370 ?auto_90376 ) ) ( not ( = ?auto_90370 ?auto_90375 ) ) ( not ( = ?auto_90371 ?auto_90376 ) ) ( not ( = ?auto_90371 ?auto_90375 ) ) ( not ( = ?auto_90372 ?auto_90376 ) ) ( not ( = ?auto_90372 ?auto_90375 ) ) ( not ( = ?auto_90373 ?auto_90376 ) ) ( not ( = ?auto_90373 ?auto_90375 ) ) ( not ( = ?auto_90374 ?auto_90376 ) ) ( not ( = ?auto_90374 ?auto_90375 ) ) ( not ( = ?auto_90376 ?auto_90375 ) ) ( ON ?auto_90376 ?auto_90374 ) ( ON ?auto_90375 ?auto_90376 ) ( CLEAR ?auto_90375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90370 ?auto_90371 ?auto_90372 ?auto_90373 ?auto_90374 ?auto_90376 )
      ( MAKE-4PILE ?auto_90370 ?auto_90371 ?auto_90372 ?auto_90373 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_89324 - BLOCK
      ?auto_89325 - BLOCK
      ?auto_89326 - BLOCK
      ?auto_89327 - BLOCK
    )
    :vars
    (
      ?auto_89330 - BLOCK
      ?auto_89329 - BLOCK
      ?auto_89328 - BLOCK
      ?auto_89331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89330 ?auto_89327 ) ( ON-TABLE ?auto_89324 ) ( ON ?auto_89325 ?auto_89324 ) ( ON ?auto_89326 ?auto_89325 ) ( ON ?auto_89327 ?auto_89326 ) ( not ( = ?auto_89324 ?auto_89325 ) ) ( not ( = ?auto_89324 ?auto_89326 ) ) ( not ( = ?auto_89324 ?auto_89327 ) ) ( not ( = ?auto_89324 ?auto_89330 ) ) ( not ( = ?auto_89325 ?auto_89326 ) ) ( not ( = ?auto_89325 ?auto_89327 ) ) ( not ( = ?auto_89325 ?auto_89330 ) ) ( not ( = ?auto_89326 ?auto_89327 ) ) ( not ( = ?auto_89326 ?auto_89330 ) ) ( not ( = ?auto_89327 ?auto_89330 ) ) ( not ( = ?auto_89324 ?auto_89329 ) ) ( not ( = ?auto_89324 ?auto_89328 ) ) ( not ( = ?auto_89325 ?auto_89329 ) ) ( not ( = ?auto_89325 ?auto_89328 ) ) ( not ( = ?auto_89326 ?auto_89329 ) ) ( not ( = ?auto_89326 ?auto_89328 ) ) ( not ( = ?auto_89327 ?auto_89329 ) ) ( not ( = ?auto_89327 ?auto_89328 ) ) ( not ( = ?auto_89330 ?auto_89329 ) ) ( not ( = ?auto_89330 ?auto_89328 ) ) ( not ( = ?auto_89329 ?auto_89328 ) ) ( ON ?auto_89329 ?auto_89330 ) ( not ( = ?auto_89331 ?auto_89328 ) ) ( not ( = ?auto_89324 ?auto_89331 ) ) ( not ( = ?auto_89325 ?auto_89331 ) ) ( not ( = ?auto_89326 ?auto_89331 ) ) ( not ( = ?auto_89327 ?auto_89331 ) ) ( not ( = ?auto_89330 ?auto_89331 ) ) ( not ( = ?auto_89329 ?auto_89331 ) ) ( ON ?auto_89328 ?auto_89329 ) ( CLEAR ?auto_89328 ) ( HOLDING ?auto_89331 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_89331 )
      ( MAKE-4PILE ?auto_89324 ?auto_89325 ?auto_89326 ?auto_89327 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_89332 - BLOCK
      ?auto_89333 - BLOCK
      ?auto_89334 - BLOCK
      ?auto_89335 - BLOCK
    )
    :vars
    (
      ?auto_89337 - BLOCK
      ?auto_89339 - BLOCK
      ?auto_89336 - BLOCK
      ?auto_89338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89337 ?auto_89335 ) ( ON-TABLE ?auto_89332 ) ( ON ?auto_89333 ?auto_89332 ) ( ON ?auto_89334 ?auto_89333 ) ( ON ?auto_89335 ?auto_89334 ) ( not ( = ?auto_89332 ?auto_89333 ) ) ( not ( = ?auto_89332 ?auto_89334 ) ) ( not ( = ?auto_89332 ?auto_89335 ) ) ( not ( = ?auto_89332 ?auto_89337 ) ) ( not ( = ?auto_89333 ?auto_89334 ) ) ( not ( = ?auto_89333 ?auto_89335 ) ) ( not ( = ?auto_89333 ?auto_89337 ) ) ( not ( = ?auto_89334 ?auto_89335 ) ) ( not ( = ?auto_89334 ?auto_89337 ) ) ( not ( = ?auto_89335 ?auto_89337 ) ) ( not ( = ?auto_89332 ?auto_89339 ) ) ( not ( = ?auto_89332 ?auto_89336 ) ) ( not ( = ?auto_89333 ?auto_89339 ) ) ( not ( = ?auto_89333 ?auto_89336 ) ) ( not ( = ?auto_89334 ?auto_89339 ) ) ( not ( = ?auto_89334 ?auto_89336 ) ) ( not ( = ?auto_89335 ?auto_89339 ) ) ( not ( = ?auto_89335 ?auto_89336 ) ) ( not ( = ?auto_89337 ?auto_89339 ) ) ( not ( = ?auto_89337 ?auto_89336 ) ) ( not ( = ?auto_89339 ?auto_89336 ) ) ( ON ?auto_89339 ?auto_89337 ) ( not ( = ?auto_89338 ?auto_89336 ) ) ( not ( = ?auto_89332 ?auto_89338 ) ) ( not ( = ?auto_89333 ?auto_89338 ) ) ( not ( = ?auto_89334 ?auto_89338 ) ) ( not ( = ?auto_89335 ?auto_89338 ) ) ( not ( = ?auto_89337 ?auto_89338 ) ) ( not ( = ?auto_89339 ?auto_89338 ) ) ( ON ?auto_89336 ?auto_89339 ) ( ON ?auto_89338 ?auto_89336 ) ( CLEAR ?auto_89338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_89332 ?auto_89333 ?auto_89334 ?auto_89335 ?auto_89337 ?auto_89339 ?auto_89336 )
      ( MAKE-4PILE ?auto_89332 ?auto_89333 ?auto_89334 ?auto_89335 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_89344 - BLOCK
      ?auto_89345 - BLOCK
      ?auto_89346 - BLOCK
      ?auto_89347 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_89347 ) ( CLEAR ?auto_89346 ) ( ON-TABLE ?auto_89344 ) ( ON ?auto_89345 ?auto_89344 ) ( ON ?auto_89346 ?auto_89345 ) ( not ( = ?auto_89344 ?auto_89345 ) ) ( not ( = ?auto_89344 ?auto_89346 ) ) ( not ( = ?auto_89344 ?auto_89347 ) ) ( not ( = ?auto_89345 ?auto_89346 ) ) ( not ( = ?auto_89345 ?auto_89347 ) ) ( not ( = ?auto_89346 ?auto_89347 ) ) )
    :subtasks
    ( ( !STACK ?auto_89347 ?auto_89346 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_89348 - BLOCK
      ?auto_89349 - BLOCK
      ?auto_89350 - BLOCK
      ?auto_89351 - BLOCK
    )
    :vars
    (
      ?auto_89352 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_89350 ) ( ON-TABLE ?auto_89348 ) ( ON ?auto_89349 ?auto_89348 ) ( ON ?auto_89350 ?auto_89349 ) ( not ( = ?auto_89348 ?auto_89349 ) ) ( not ( = ?auto_89348 ?auto_89350 ) ) ( not ( = ?auto_89348 ?auto_89351 ) ) ( not ( = ?auto_89349 ?auto_89350 ) ) ( not ( = ?auto_89349 ?auto_89351 ) ) ( not ( = ?auto_89350 ?auto_89351 ) ) ( ON ?auto_89351 ?auto_89352 ) ( CLEAR ?auto_89351 ) ( HAND-EMPTY ) ( not ( = ?auto_89348 ?auto_89352 ) ) ( not ( = ?auto_89349 ?auto_89352 ) ) ( not ( = ?auto_89350 ?auto_89352 ) ) ( not ( = ?auto_89351 ?auto_89352 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_89351 ?auto_89352 )
      ( MAKE-4PILE ?auto_89348 ?auto_89349 ?auto_89350 ?auto_89351 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_89353 - BLOCK
      ?auto_89354 - BLOCK
      ?auto_89355 - BLOCK
      ?auto_89356 - BLOCK
    )
    :vars
    (
      ?auto_89357 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89353 ) ( ON ?auto_89354 ?auto_89353 ) ( not ( = ?auto_89353 ?auto_89354 ) ) ( not ( = ?auto_89353 ?auto_89355 ) ) ( not ( = ?auto_89353 ?auto_89356 ) ) ( not ( = ?auto_89354 ?auto_89355 ) ) ( not ( = ?auto_89354 ?auto_89356 ) ) ( not ( = ?auto_89355 ?auto_89356 ) ) ( ON ?auto_89356 ?auto_89357 ) ( CLEAR ?auto_89356 ) ( not ( = ?auto_89353 ?auto_89357 ) ) ( not ( = ?auto_89354 ?auto_89357 ) ) ( not ( = ?auto_89355 ?auto_89357 ) ) ( not ( = ?auto_89356 ?auto_89357 ) ) ( HOLDING ?auto_89355 ) ( CLEAR ?auto_89354 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89353 ?auto_89354 ?auto_89355 )
      ( MAKE-4PILE ?auto_89353 ?auto_89354 ?auto_89355 ?auto_89356 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_89358 - BLOCK
      ?auto_89359 - BLOCK
      ?auto_89360 - BLOCK
      ?auto_89361 - BLOCK
    )
    :vars
    (
      ?auto_89362 - BLOCK
      ?auto_89365 - BLOCK
      ?auto_89363 - BLOCK
      ?auto_89364 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89358 ) ( ON ?auto_89359 ?auto_89358 ) ( not ( = ?auto_89358 ?auto_89359 ) ) ( not ( = ?auto_89358 ?auto_89360 ) ) ( not ( = ?auto_89358 ?auto_89361 ) ) ( not ( = ?auto_89359 ?auto_89360 ) ) ( not ( = ?auto_89359 ?auto_89361 ) ) ( not ( = ?auto_89360 ?auto_89361 ) ) ( ON ?auto_89361 ?auto_89362 ) ( not ( = ?auto_89358 ?auto_89362 ) ) ( not ( = ?auto_89359 ?auto_89362 ) ) ( not ( = ?auto_89360 ?auto_89362 ) ) ( not ( = ?auto_89361 ?auto_89362 ) ) ( CLEAR ?auto_89359 ) ( ON ?auto_89360 ?auto_89361 ) ( CLEAR ?auto_89360 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_89365 ) ( ON ?auto_89363 ?auto_89365 ) ( ON ?auto_89364 ?auto_89363 ) ( ON ?auto_89362 ?auto_89364 ) ( not ( = ?auto_89365 ?auto_89363 ) ) ( not ( = ?auto_89365 ?auto_89364 ) ) ( not ( = ?auto_89365 ?auto_89362 ) ) ( not ( = ?auto_89365 ?auto_89361 ) ) ( not ( = ?auto_89365 ?auto_89360 ) ) ( not ( = ?auto_89363 ?auto_89364 ) ) ( not ( = ?auto_89363 ?auto_89362 ) ) ( not ( = ?auto_89363 ?auto_89361 ) ) ( not ( = ?auto_89363 ?auto_89360 ) ) ( not ( = ?auto_89364 ?auto_89362 ) ) ( not ( = ?auto_89364 ?auto_89361 ) ) ( not ( = ?auto_89364 ?auto_89360 ) ) ( not ( = ?auto_89358 ?auto_89365 ) ) ( not ( = ?auto_89358 ?auto_89363 ) ) ( not ( = ?auto_89358 ?auto_89364 ) ) ( not ( = ?auto_89359 ?auto_89365 ) ) ( not ( = ?auto_89359 ?auto_89363 ) ) ( not ( = ?auto_89359 ?auto_89364 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89365 ?auto_89363 ?auto_89364 ?auto_89362 ?auto_89361 )
      ( MAKE-4PILE ?auto_89358 ?auto_89359 ?auto_89360 ?auto_89361 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_89366 - BLOCK
      ?auto_89367 - BLOCK
      ?auto_89368 - BLOCK
      ?auto_89369 - BLOCK
    )
    :vars
    (
      ?auto_89373 - BLOCK
      ?auto_89370 - BLOCK
      ?auto_89372 - BLOCK
      ?auto_89371 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89366 ) ( not ( = ?auto_89366 ?auto_89367 ) ) ( not ( = ?auto_89366 ?auto_89368 ) ) ( not ( = ?auto_89366 ?auto_89369 ) ) ( not ( = ?auto_89367 ?auto_89368 ) ) ( not ( = ?auto_89367 ?auto_89369 ) ) ( not ( = ?auto_89368 ?auto_89369 ) ) ( ON ?auto_89369 ?auto_89373 ) ( not ( = ?auto_89366 ?auto_89373 ) ) ( not ( = ?auto_89367 ?auto_89373 ) ) ( not ( = ?auto_89368 ?auto_89373 ) ) ( not ( = ?auto_89369 ?auto_89373 ) ) ( ON ?auto_89368 ?auto_89369 ) ( CLEAR ?auto_89368 ) ( ON-TABLE ?auto_89370 ) ( ON ?auto_89372 ?auto_89370 ) ( ON ?auto_89371 ?auto_89372 ) ( ON ?auto_89373 ?auto_89371 ) ( not ( = ?auto_89370 ?auto_89372 ) ) ( not ( = ?auto_89370 ?auto_89371 ) ) ( not ( = ?auto_89370 ?auto_89373 ) ) ( not ( = ?auto_89370 ?auto_89369 ) ) ( not ( = ?auto_89370 ?auto_89368 ) ) ( not ( = ?auto_89372 ?auto_89371 ) ) ( not ( = ?auto_89372 ?auto_89373 ) ) ( not ( = ?auto_89372 ?auto_89369 ) ) ( not ( = ?auto_89372 ?auto_89368 ) ) ( not ( = ?auto_89371 ?auto_89373 ) ) ( not ( = ?auto_89371 ?auto_89369 ) ) ( not ( = ?auto_89371 ?auto_89368 ) ) ( not ( = ?auto_89366 ?auto_89370 ) ) ( not ( = ?auto_89366 ?auto_89372 ) ) ( not ( = ?auto_89366 ?auto_89371 ) ) ( not ( = ?auto_89367 ?auto_89370 ) ) ( not ( = ?auto_89367 ?auto_89372 ) ) ( not ( = ?auto_89367 ?auto_89371 ) ) ( HOLDING ?auto_89367 ) ( CLEAR ?auto_89366 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89366 ?auto_89367 )
      ( MAKE-4PILE ?auto_89366 ?auto_89367 ?auto_89368 ?auto_89369 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_89374 - BLOCK
      ?auto_89375 - BLOCK
      ?auto_89376 - BLOCK
      ?auto_89377 - BLOCK
    )
    :vars
    (
      ?auto_89381 - BLOCK
      ?auto_89379 - BLOCK
      ?auto_89378 - BLOCK
      ?auto_89380 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89374 ) ( not ( = ?auto_89374 ?auto_89375 ) ) ( not ( = ?auto_89374 ?auto_89376 ) ) ( not ( = ?auto_89374 ?auto_89377 ) ) ( not ( = ?auto_89375 ?auto_89376 ) ) ( not ( = ?auto_89375 ?auto_89377 ) ) ( not ( = ?auto_89376 ?auto_89377 ) ) ( ON ?auto_89377 ?auto_89381 ) ( not ( = ?auto_89374 ?auto_89381 ) ) ( not ( = ?auto_89375 ?auto_89381 ) ) ( not ( = ?auto_89376 ?auto_89381 ) ) ( not ( = ?auto_89377 ?auto_89381 ) ) ( ON ?auto_89376 ?auto_89377 ) ( ON-TABLE ?auto_89379 ) ( ON ?auto_89378 ?auto_89379 ) ( ON ?auto_89380 ?auto_89378 ) ( ON ?auto_89381 ?auto_89380 ) ( not ( = ?auto_89379 ?auto_89378 ) ) ( not ( = ?auto_89379 ?auto_89380 ) ) ( not ( = ?auto_89379 ?auto_89381 ) ) ( not ( = ?auto_89379 ?auto_89377 ) ) ( not ( = ?auto_89379 ?auto_89376 ) ) ( not ( = ?auto_89378 ?auto_89380 ) ) ( not ( = ?auto_89378 ?auto_89381 ) ) ( not ( = ?auto_89378 ?auto_89377 ) ) ( not ( = ?auto_89378 ?auto_89376 ) ) ( not ( = ?auto_89380 ?auto_89381 ) ) ( not ( = ?auto_89380 ?auto_89377 ) ) ( not ( = ?auto_89380 ?auto_89376 ) ) ( not ( = ?auto_89374 ?auto_89379 ) ) ( not ( = ?auto_89374 ?auto_89378 ) ) ( not ( = ?auto_89374 ?auto_89380 ) ) ( not ( = ?auto_89375 ?auto_89379 ) ) ( not ( = ?auto_89375 ?auto_89378 ) ) ( not ( = ?auto_89375 ?auto_89380 ) ) ( CLEAR ?auto_89374 ) ( ON ?auto_89375 ?auto_89376 ) ( CLEAR ?auto_89375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89379 ?auto_89378 ?auto_89380 ?auto_89381 ?auto_89377 ?auto_89376 )
      ( MAKE-4PILE ?auto_89374 ?auto_89375 ?auto_89376 ?auto_89377 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_89382 - BLOCK
      ?auto_89383 - BLOCK
      ?auto_89384 - BLOCK
      ?auto_89385 - BLOCK
    )
    :vars
    (
      ?auto_89386 - BLOCK
      ?auto_89389 - BLOCK
      ?auto_89387 - BLOCK
      ?auto_89388 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89382 ?auto_89383 ) ) ( not ( = ?auto_89382 ?auto_89384 ) ) ( not ( = ?auto_89382 ?auto_89385 ) ) ( not ( = ?auto_89383 ?auto_89384 ) ) ( not ( = ?auto_89383 ?auto_89385 ) ) ( not ( = ?auto_89384 ?auto_89385 ) ) ( ON ?auto_89385 ?auto_89386 ) ( not ( = ?auto_89382 ?auto_89386 ) ) ( not ( = ?auto_89383 ?auto_89386 ) ) ( not ( = ?auto_89384 ?auto_89386 ) ) ( not ( = ?auto_89385 ?auto_89386 ) ) ( ON ?auto_89384 ?auto_89385 ) ( ON-TABLE ?auto_89389 ) ( ON ?auto_89387 ?auto_89389 ) ( ON ?auto_89388 ?auto_89387 ) ( ON ?auto_89386 ?auto_89388 ) ( not ( = ?auto_89389 ?auto_89387 ) ) ( not ( = ?auto_89389 ?auto_89388 ) ) ( not ( = ?auto_89389 ?auto_89386 ) ) ( not ( = ?auto_89389 ?auto_89385 ) ) ( not ( = ?auto_89389 ?auto_89384 ) ) ( not ( = ?auto_89387 ?auto_89388 ) ) ( not ( = ?auto_89387 ?auto_89386 ) ) ( not ( = ?auto_89387 ?auto_89385 ) ) ( not ( = ?auto_89387 ?auto_89384 ) ) ( not ( = ?auto_89388 ?auto_89386 ) ) ( not ( = ?auto_89388 ?auto_89385 ) ) ( not ( = ?auto_89388 ?auto_89384 ) ) ( not ( = ?auto_89382 ?auto_89389 ) ) ( not ( = ?auto_89382 ?auto_89387 ) ) ( not ( = ?auto_89382 ?auto_89388 ) ) ( not ( = ?auto_89383 ?auto_89389 ) ) ( not ( = ?auto_89383 ?auto_89387 ) ) ( not ( = ?auto_89383 ?auto_89388 ) ) ( ON ?auto_89383 ?auto_89384 ) ( CLEAR ?auto_89383 ) ( HOLDING ?auto_89382 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_89382 )
      ( MAKE-4PILE ?auto_89382 ?auto_89383 ?auto_89384 ?auto_89385 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_89390 - BLOCK
      ?auto_89391 - BLOCK
      ?auto_89392 - BLOCK
      ?auto_89393 - BLOCK
    )
    :vars
    (
      ?auto_89397 - BLOCK
      ?auto_89394 - BLOCK
      ?auto_89395 - BLOCK
      ?auto_89396 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89390 ?auto_89391 ) ) ( not ( = ?auto_89390 ?auto_89392 ) ) ( not ( = ?auto_89390 ?auto_89393 ) ) ( not ( = ?auto_89391 ?auto_89392 ) ) ( not ( = ?auto_89391 ?auto_89393 ) ) ( not ( = ?auto_89392 ?auto_89393 ) ) ( ON ?auto_89393 ?auto_89397 ) ( not ( = ?auto_89390 ?auto_89397 ) ) ( not ( = ?auto_89391 ?auto_89397 ) ) ( not ( = ?auto_89392 ?auto_89397 ) ) ( not ( = ?auto_89393 ?auto_89397 ) ) ( ON ?auto_89392 ?auto_89393 ) ( ON-TABLE ?auto_89394 ) ( ON ?auto_89395 ?auto_89394 ) ( ON ?auto_89396 ?auto_89395 ) ( ON ?auto_89397 ?auto_89396 ) ( not ( = ?auto_89394 ?auto_89395 ) ) ( not ( = ?auto_89394 ?auto_89396 ) ) ( not ( = ?auto_89394 ?auto_89397 ) ) ( not ( = ?auto_89394 ?auto_89393 ) ) ( not ( = ?auto_89394 ?auto_89392 ) ) ( not ( = ?auto_89395 ?auto_89396 ) ) ( not ( = ?auto_89395 ?auto_89397 ) ) ( not ( = ?auto_89395 ?auto_89393 ) ) ( not ( = ?auto_89395 ?auto_89392 ) ) ( not ( = ?auto_89396 ?auto_89397 ) ) ( not ( = ?auto_89396 ?auto_89393 ) ) ( not ( = ?auto_89396 ?auto_89392 ) ) ( not ( = ?auto_89390 ?auto_89394 ) ) ( not ( = ?auto_89390 ?auto_89395 ) ) ( not ( = ?auto_89390 ?auto_89396 ) ) ( not ( = ?auto_89391 ?auto_89394 ) ) ( not ( = ?auto_89391 ?auto_89395 ) ) ( not ( = ?auto_89391 ?auto_89396 ) ) ( ON ?auto_89391 ?auto_89392 ) ( ON ?auto_89390 ?auto_89391 ) ( CLEAR ?auto_89390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_89394 ?auto_89395 ?auto_89396 ?auto_89397 ?auto_89393 ?auto_89392 ?auto_89391 )
      ( MAKE-4PILE ?auto_89390 ?auto_89391 ?auto_89392 ?auto_89393 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_89401 - BLOCK
      ?auto_89402 - BLOCK
      ?auto_89403 - BLOCK
    )
    :vars
    (
      ?auto_89404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89404 ?auto_89403 ) ( CLEAR ?auto_89404 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_89401 ) ( ON ?auto_89402 ?auto_89401 ) ( ON ?auto_89403 ?auto_89402 ) ( not ( = ?auto_89401 ?auto_89402 ) ) ( not ( = ?auto_89401 ?auto_89403 ) ) ( not ( = ?auto_89401 ?auto_89404 ) ) ( not ( = ?auto_89402 ?auto_89403 ) ) ( not ( = ?auto_89402 ?auto_89404 ) ) ( not ( = ?auto_89403 ?auto_89404 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_89404 ?auto_89403 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_89405 - BLOCK
      ?auto_89406 - BLOCK
      ?auto_89407 - BLOCK
    )
    :vars
    (
      ?auto_89408 - BLOCK
      ?auto_89409 - BLOCK
      ?auto_89410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89408 ?auto_89407 ) ( CLEAR ?auto_89408 ) ( ON-TABLE ?auto_89405 ) ( ON ?auto_89406 ?auto_89405 ) ( ON ?auto_89407 ?auto_89406 ) ( not ( = ?auto_89405 ?auto_89406 ) ) ( not ( = ?auto_89405 ?auto_89407 ) ) ( not ( = ?auto_89405 ?auto_89408 ) ) ( not ( = ?auto_89406 ?auto_89407 ) ) ( not ( = ?auto_89406 ?auto_89408 ) ) ( not ( = ?auto_89407 ?auto_89408 ) ) ( HOLDING ?auto_89409 ) ( CLEAR ?auto_89410 ) ( not ( = ?auto_89405 ?auto_89409 ) ) ( not ( = ?auto_89405 ?auto_89410 ) ) ( not ( = ?auto_89406 ?auto_89409 ) ) ( not ( = ?auto_89406 ?auto_89410 ) ) ( not ( = ?auto_89407 ?auto_89409 ) ) ( not ( = ?auto_89407 ?auto_89410 ) ) ( not ( = ?auto_89408 ?auto_89409 ) ) ( not ( = ?auto_89408 ?auto_89410 ) ) ( not ( = ?auto_89409 ?auto_89410 ) ) )
    :subtasks
    ( ( !STACK ?auto_89409 ?auto_89410 )
      ( MAKE-3PILE ?auto_89405 ?auto_89406 ?auto_89407 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_89411 - BLOCK
      ?auto_89412 - BLOCK
      ?auto_89413 - BLOCK
    )
    :vars
    (
      ?auto_89416 - BLOCK
      ?auto_89414 - BLOCK
      ?auto_89415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89416 ?auto_89413 ) ( ON-TABLE ?auto_89411 ) ( ON ?auto_89412 ?auto_89411 ) ( ON ?auto_89413 ?auto_89412 ) ( not ( = ?auto_89411 ?auto_89412 ) ) ( not ( = ?auto_89411 ?auto_89413 ) ) ( not ( = ?auto_89411 ?auto_89416 ) ) ( not ( = ?auto_89412 ?auto_89413 ) ) ( not ( = ?auto_89412 ?auto_89416 ) ) ( not ( = ?auto_89413 ?auto_89416 ) ) ( CLEAR ?auto_89414 ) ( not ( = ?auto_89411 ?auto_89415 ) ) ( not ( = ?auto_89411 ?auto_89414 ) ) ( not ( = ?auto_89412 ?auto_89415 ) ) ( not ( = ?auto_89412 ?auto_89414 ) ) ( not ( = ?auto_89413 ?auto_89415 ) ) ( not ( = ?auto_89413 ?auto_89414 ) ) ( not ( = ?auto_89416 ?auto_89415 ) ) ( not ( = ?auto_89416 ?auto_89414 ) ) ( not ( = ?auto_89415 ?auto_89414 ) ) ( ON ?auto_89415 ?auto_89416 ) ( CLEAR ?auto_89415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89411 ?auto_89412 ?auto_89413 ?auto_89416 )
      ( MAKE-3PILE ?auto_89411 ?auto_89412 ?auto_89413 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_89417 - BLOCK
      ?auto_89418 - BLOCK
      ?auto_89419 - BLOCK
    )
    :vars
    (
      ?auto_89420 - BLOCK
      ?auto_89421 - BLOCK
      ?auto_89422 - BLOCK
      ?auto_89423 - BLOCK
      ?auto_89424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89420 ?auto_89419 ) ( ON-TABLE ?auto_89417 ) ( ON ?auto_89418 ?auto_89417 ) ( ON ?auto_89419 ?auto_89418 ) ( not ( = ?auto_89417 ?auto_89418 ) ) ( not ( = ?auto_89417 ?auto_89419 ) ) ( not ( = ?auto_89417 ?auto_89420 ) ) ( not ( = ?auto_89418 ?auto_89419 ) ) ( not ( = ?auto_89418 ?auto_89420 ) ) ( not ( = ?auto_89419 ?auto_89420 ) ) ( not ( = ?auto_89417 ?auto_89421 ) ) ( not ( = ?auto_89417 ?auto_89422 ) ) ( not ( = ?auto_89418 ?auto_89421 ) ) ( not ( = ?auto_89418 ?auto_89422 ) ) ( not ( = ?auto_89419 ?auto_89421 ) ) ( not ( = ?auto_89419 ?auto_89422 ) ) ( not ( = ?auto_89420 ?auto_89421 ) ) ( not ( = ?auto_89420 ?auto_89422 ) ) ( not ( = ?auto_89421 ?auto_89422 ) ) ( ON ?auto_89421 ?auto_89420 ) ( CLEAR ?auto_89421 ) ( HOLDING ?auto_89422 ) ( CLEAR ?auto_89423 ) ( ON-TABLE ?auto_89424 ) ( ON ?auto_89423 ?auto_89424 ) ( not ( = ?auto_89424 ?auto_89423 ) ) ( not ( = ?auto_89424 ?auto_89422 ) ) ( not ( = ?auto_89423 ?auto_89422 ) ) ( not ( = ?auto_89417 ?auto_89423 ) ) ( not ( = ?auto_89417 ?auto_89424 ) ) ( not ( = ?auto_89418 ?auto_89423 ) ) ( not ( = ?auto_89418 ?auto_89424 ) ) ( not ( = ?auto_89419 ?auto_89423 ) ) ( not ( = ?auto_89419 ?auto_89424 ) ) ( not ( = ?auto_89420 ?auto_89423 ) ) ( not ( = ?auto_89420 ?auto_89424 ) ) ( not ( = ?auto_89421 ?auto_89423 ) ) ( not ( = ?auto_89421 ?auto_89424 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89424 ?auto_89423 ?auto_89422 )
      ( MAKE-3PILE ?auto_89417 ?auto_89418 ?auto_89419 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_89425 - BLOCK
      ?auto_89426 - BLOCK
      ?auto_89427 - BLOCK
    )
    :vars
    (
      ?auto_89429 - BLOCK
      ?auto_89430 - BLOCK
      ?auto_89432 - BLOCK
      ?auto_89428 - BLOCK
      ?auto_89431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89429 ?auto_89427 ) ( ON-TABLE ?auto_89425 ) ( ON ?auto_89426 ?auto_89425 ) ( ON ?auto_89427 ?auto_89426 ) ( not ( = ?auto_89425 ?auto_89426 ) ) ( not ( = ?auto_89425 ?auto_89427 ) ) ( not ( = ?auto_89425 ?auto_89429 ) ) ( not ( = ?auto_89426 ?auto_89427 ) ) ( not ( = ?auto_89426 ?auto_89429 ) ) ( not ( = ?auto_89427 ?auto_89429 ) ) ( not ( = ?auto_89425 ?auto_89430 ) ) ( not ( = ?auto_89425 ?auto_89432 ) ) ( not ( = ?auto_89426 ?auto_89430 ) ) ( not ( = ?auto_89426 ?auto_89432 ) ) ( not ( = ?auto_89427 ?auto_89430 ) ) ( not ( = ?auto_89427 ?auto_89432 ) ) ( not ( = ?auto_89429 ?auto_89430 ) ) ( not ( = ?auto_89429 ?auto_89432 ) ) ( not ( = ?auto_89430 ?auto_89432 ) ) ( ON ?auto_89430 ?auto_89429 ) ( CLEAR ?auto_89428 ) ( ON-TABLE ?auto_89431 ) ( ON ?auto_89428 ?auto_89431 ) ( not ( = ?auto_89431 ?auto_89428 ) ) ( not ( = ?auto_89431 ?auto_89432 ) ) ( not ( = ?auto_89428 ?auto_89432 ) ) ( not ( = ?auto_89425 ?auto_89428 ) ) ( not ( = ?auto_89425 ?auto_89431 ) ) ( not ( = ?auto_89426 ?auto_89428 ) ) ( not ( = ?auto_89426 ?auto_89431 ) ) ( not ( = ?auto_89427 ?auto_89428 ) ) ( not ( = ?auto_89427 ?auto_89431 ) ) ( not ( = ?auto_89429 ?auto_89428 ) ) ( not ( = ?auto_89429 ?auto_89431 ) ) ( not ( = ?auto_89430 ?auto_89428 ) ) ( not ( = ?auto_89430 ?auto_89431 ) ) ( ON ?auto_89432 ?auto_89430 ) ( CLEAR ?auto_89432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89425 ?auto_89426 ?auto_89427 ?auto_89429 ?auto_89430 )
      ( MAKE-3PILE ?auto_89425 ?auto_89426 ?auto_89427 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_89433 - BLOCK
      ?auto_89434 - BLOCK
      ?auto_89435 - BLOCK
    )
    :vars
    (
      ?auto_89439 - BLOCK
      ?auto_89438 - BLOCK
      ?auto_89440 - BLOCK
      ?auto_89437 - BLOCK
      ?auto_89436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89439 ?auto_89435 ) ( ON-TABLE ?auto_89433 ) ( ON ?auto_89434 ?auto_89433 ) ( ON ?auto_89435 ?auto_89434 ) ( not ( = ?auto_89433 ?auto_89434 ) ) ( not ( = ?auto_89433 ?auto_89435 ) ) ( not ( = ?auto_89433 ?auto_89439 ) ) ( not ( = ?auto_89434 ?auto_89435 ) ) ( not ( = ?auto_89434 ?auto_89439 ) ) ( not ( = ?auto_89435 ?auto_89439 ) ) ( not ( = ?auto_89433 ?auto_89438 ) ) ( not ( = ?auto_89433 ?auto_89440 ) ) ( not ( = ?auto_89434 ?auto_89438 ) ) ( not ( = ?auto_89434 ?auto_89440 ) ) ( not ( = ?auto_89435 ?auto_89438 ) ) ( not ( = ?auto_89435 ?auto_89440 ) ) ( not ( = ?auto_89439 ?auto_89438 ) ) ( not ( = ?auto_89439 ?auto_89440 ) ) ( not ( = ?auto_89438 ?auto_89440 ) ) ( ON ?auto_89438 ?auto_89439 ) ( ON-TABLE ?auto_89437 ) ( not ( = ?auto_89437 ?auto_89436 ) ) ( not ( = ?auto_89437 ?auto_89440 ) ) ( not ( = ?auto_89436 ?auto_89440 ) ) ( not ( = ?auto_89433 ?auto_89436 ) ) ( not ( = ?auto_89433 ?auto_89437 ) ) ( not ( = ?auto_89434 ?auto_89436 ) ) ( not ( = ?auto_89434 ?auto_89437 ) ) ( not ( = ?auto_89435 ?auto_89436 ) ) ( not ( = ?auto_89435 ?auto_89437 ) ) ( not ( = ?auto_89439 ?auto_89436 ) ) ( not ( = ?auto_89439 ?auto_89437 ) ) ( not ( = ?auto_89438 ?auto_89436 ) ) ( not ( = ?auto_89438 ?auto_89437 ) ) ( ON ?auto_89440 ?auto_89438 ) ( CLEAR ?auto_89440 ) ( HOLDING ?auto_89436 ) ( CLEAR ?auto_89437 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89437 ?auto_89436 )
      ( MAKE-3PILE ?auto_89433 ?auto_89434 ?auto_89435 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90618 - BLOCK
      ?auto_90619 - BLOCK
      ?auto_90620 - BLOCK
    )
    :vars
    (
      ?auto_90624 - BLOCK
      ?auto_90621 - BLOCK
      ?auto_90623 - BLOCK
      ?auto_90622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90624 ?auto_90620 ) ( ON-TABLE ?auto_90618 ) ( ON ?auto_90619 ?auto_90618 ) ( ON ?auto_90620 ?auto_90619 ) ( not ( = ?auto_90618 ?auto_90619 ) ) ( not ( = ?auto_90618 ?auto_90620 ) ) ( not ( = ?auto_90618 ?auto_90624 ) ) ( not ( = ?auto_90619 ?auto_90620 ) ) ( not ( = ?auto_90619 ?auto_90624 ) ) ( not ( = ?auto_90620 ?auto_90624 ) ) ( not ( = ?auto_90618 ?auto_90621 ) ) ( not ( = ?auto_90618 ?auto_90623 ) ) ( not ( = ?auto_90619 ?auto_90621 ) ) ( not ( = ?auto_90619 ?auto_90623 ) ) ( not ( = ?auto_90620 ?auto_90621 ) ) ( not ( = ?auto_90620 ?auto_90623 ) ) ( not ( = ?auto_90624 ?auto_90621 ) ) ( not ( = ?auto_90624 ?auto_90623 ) ) ( not ( = ?auto_90621 ?auto_90623 ) ) ( ON ?auto_90621 ?auto_90624 ) ( not ( = ?auto_90622 ?auto_90623 ) ) ( not ( = ?auto_90618 ?auto_90622 ) ) ( not ( = ?auto_90619 ?auto_90622 ) ) ( not ( = ?auto_90620 ?auto_90622 ) ) ( not ( = ?auto_90624 ?auto_90622 ) ) ( not ( = ?auto_90621 ?auto_90622 ) ) ( ON ?auto_90623 ?auto_90621 ) ( ON ?auto_90622 ?auto_90623 ) ( CLEAR ?auto_90622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90618 ?auto_90619 ?auto_90620 ?auto_90624 ?auto_90621 ?auto_90623 )
      ( MAKE-3PILE ?auto_90618 ?auto_90619 ?auto_90620 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_89449 - BLOCK
      ?auto_89450 - BLOCK
      ?auto_89451 - BLOCK
    )
    :vars
    (
      ?auto_89453 - BLOCK
      ?auto_89452 - BLOCK
      ?auto_89455 - BLOCK
      ?auto_89456 - BLOCK
      ?auto_89454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89453 ?auto_89451 ) ( ON-TABLE ?auto_89449 ) ( ON ?auto_89450 ?auto_89449 ) ( ON ?auto_89451 ?auto_89450 ) ( not ( = ?auto_89449 ?auto_89450 ) ) ( not ( = ?auto_89449 ?auto_89451 ) ) ( not ( = ?auto_89449 ?auto_89453 ) ) ( not ( = ?auto_89450 ?auto_89451 ) ) ( not ( = ?auto_89450 ?auto_89453 ) ) ( not ( = ?auto_89451 ?auto_89453 ) ) ( not ( = ?auto_89449 ?auto_89452 ) ) ( not ( = ?auto_89449 ?auto_89455 ) ) ( not ( = ?auto_89450 ?auto_89452 ) ) ( not ( = ?auto_89450 ?auto_89455 ) ) ( not ( = ?auto_89451 ?auto_89452 ) ) ( not ( = ?auto_89451 ?auto_89455 ) ) ( not ( = ?auto_89453 ?auto_89452 ) ) ( not ( = ?auto_89453 ?auto_89455 ) ) ( not ( = ?auto_89452 ?auto_89455 ) ) ( ON ?auto_89452 ?auto_89453 ) ( not ( = ?auto_89456 ?auto_89454 ) ) ( not ( = ?auto_89456 ?auto_89455 ) ) ( not ( = ?auto_89454 ?auto_89455 ) ) ( not ( = ?auto_89449 ?auto_89454 ) ) ( not ( = ?auto_89449 ?auto_89456 ) ) ( not ( = ?auto_89450 ?auto_89454 ) ) ( not ( = ?auto_89450 ?auto_89456 ) ) ( not ( = ?auto_89451 ?auto_89454 ) ) ( not ( = ?auto_89451 ?auto_89456 ) ) ( not ( = ?auto_89453 ?auto_89454 ) ) ( not ( = ?auto_89453 ?auto_89456 ) ) ( not ( = ?auto_89452 ?auto_89454 ) ) ( not ( = ?auto_89452 ?auto_89456 ) ) ( ON ?auto_89455 ?auto_89452 ) ( ON ?auto_89454 ?auto_89455 ) ( CLEAR ?auto_89454 ) ( HOLDING ?auto_89456 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_89456 )
      ( MAKE-3PILE ?auto_89449 ?auto_89450 ?auto_89451 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_89457 - BLOCK
      ?auto_89458 - BLOCK
      ?auto_89459 - BLOCK
    )
    :vars
    (
      ?auto_89462 - BLOCK
      ?auto_89461 - BLOCK
      ?auto_89463 - BLOCK
      ?auto_89460 - BLOCK
      ?auto_89464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89462 ?auto_89459 ) ( ON-TABLE ?auto_89457 ) ( ON ?auto_89458 ?auto_89457 ) ( ON ?auto_89459 ?auto_89458 ) ( not ( = ?auto_89457 ?auto_89458 ) ) ( not ( = ?auto_89457 ?auto_89459 ) ) ( not ( = ?auto_89457 ?auto_89462 ) ) ( not ( = ?auto_89458 ?auto_89459 ) ) ( not ( = ?auto_89458 ?auto_89462 ) ) ( not ( = ?auto_89459 ?auto_89462 ) ) ( not ( = ?auto_89457 ?auto_89461 ) ) ( not ( = ?auto_89457 ?auto_89463 ) ) ( not ( = ?auto_89458 ?auto_89461 ) ) ( not ( = ?auto_89458 ?auto_89463 ) ) ( not ( = ?auto_89459 ?auto_89461 ) ) ( not ( = ?auto_89459 ?auto_89463 ) ) ( not ( = ?auto_89462 ?auto_89461 ) ) ( not ( = ?auto_89462 ?auto_89463 ) ) ( not ( = ?auto_89461 ?auto_89463 ) ) ( ON ?auto_89461 ?auto_89462 ) ( not ( = ?auto_89460 ?auto_89464 ) ) ( not ( = ?auto_89460 ?auto_89463 ) ) ( not ( = ?auto_89464 ?auto_89463 ) ) ( not ( = ?auto_89457 ?auto_89464 ) ) ( not ( = ?auto_89457 ?auto_89460 ) ) ( not ( = ?auto_89458 ?auto_89464 ) ) ( not ( = ?auto_89458 ?auto_89460 ) ) ( not ( = ?auto_89459 ?auto_89464 ) ) ( not ( = ?auto_89459 ?auto_89460 ) ) ( not ( = ?auto_89462 ?auto_89464 ) ) ( not ( = ?auto_89462 ?auto_89460 ) ) ( not ( = ?auto_89461 ?auto_89464 ) ) ( not ( = ?auto_89461 ?auto_89460 ) ) ( ON ?auto_89463 ?auto_89461 ) ( ON ?auto_89464 ?auto_89463 ) ( ON ?auto_89460 ?auto_89464 ) ( CLEAR ?auto_89460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_89457 ?auto_89458 ?auto_89459 ?auto_89462 ?auto_89461 ?auto_89463 ?auto_89464 )
      ( MAKE-3PILE ?auto_89457 ?auto_89458 ?auto_89459 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89470 - BLOCK
      ?auto_89471 - BLOCK
      ?auto_89472 - BLOCK
      ?auto_89473 - BLOCK
      ?auto_89474 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_89474 ) ( CLEAR ?auto_89473 ) ( ON-TABLE ?auto_89470 ) ( ON ?auto_89471 ?auto_89470 ) ( ON ?auto_89472 ?auto_89471 ) ( ON ?auto_89473 ?auto_89472 ) ( not ( = ?auto_89470 ?auto_89471 ) ) ( not ( = ?auto_89470 ?auto_89472 ) ) ( not ( = ?auto_89470 ?auto_89473 ) ) ( not ( = ?auto_89470 ?auto_89474 ) ) ( not ( = ?auto_89471 ?auto_89472 ) ) ( not ( = ?auto_89471 ?auto_89473 ) ) ( not ( = ?auto_89471 ?auto_89474 ) ) ( not ( = ?auto_89472 ?auto_89473 ) ) ( not ( = ?auto_89472 ?auto_89474 ) ) ( not ( = ?auto_89473 ?auto_89474 ) ) )
    :subtasks
    ( ( !STACK ?auto_89474 ?auto_89473 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89475 - BLOCK
      ?auto_89476 - BLOCK
      ?auto_89477 - BLOCK
      ?auto_89478 - BLOCK
      ?auto_89479 - BLOCK
    )
    :vars
    (
      ?auto_89480 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_89478 ) ( ON-TABLE ?auto_89475 ) ( ON ?auto_89476 ?auto_89475 ) ( ON ?auto_89477 ?auto_89476 ) ( ON ?auto_89478 ?auto_89477 ) ( not ( = ?auto_89475 ?auto_89476 ) ) ( not ( = ?auto_89475 ?auto_89477 ) ) ( not ( = ?auto_89475 ?auto_89478 ) ) ( not ( = ?auto_89475 ?auto_89479 ) ) ( not ( = ?auto_89476 ?auto_89477 ) ) ( not ( = ?auto_89476 ?auto_89478 ) ) ( not ( = ?auto_89476 ?auto_89479 ) ) ( not ( = ?auto_89477 ?auto_89478 ) ) ( not ( = ?auto_89477 ?auto_89479 ) ) ( not ( = ?auto_89478 ?auto_89479 ) ) ( ON ?auto_89479 ?auto_89480 ) ( CLEAR ?auto_89479 ) ( HAND-EMPTY ) ( not ( = ?auto_89475 ?auto_89480 ) ) ( not ( = ?auto_89476 ?auto_89480 ) ) ( not ( = ?auto_89477 ?auto_89480 ) ) ( not ( = ?auto_89478 ?auto_89480 ) ) ( not ( = ?auto_89479 ?auto_89480 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_89479 ?auto_89480 )
      ( MAKE-5PILE ?auto_89475 ?auto_89476 ?auto_89477 ?auto_89478 ?auto_89479 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89481 - BLOCK
      ?auto_89482 - BLOCK
      ?auto_89483 - BLOCK
      ?auto_89484 - BLOCK
      ?auto_89485 - BLOCK
    )
    :vars
    (
      ?auto_89486 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89481 ) ( ON ?auto_89482 ?auto_89481 ) ( ON ?auto_89483 ?auto_89482 ) ( not ( = ?auto_89481 ?auto_89482 ) ) ( not ( = ?auto_89481 ?auto_89483 ) ) ( not ( = ?auto_89481 ?auto_89484 ) ) ( not ( = ?auto_89481 ?auto_89485 ) ) ( not ( = ?auto_89482 ?auto_89483 ) ) ( not ( = ?auto_89482 ?auto_89484 ) ) ( not ( = ?auto_89482 ?auto_89485 ) ) ( not ( = ?auto_89483 ?auto_89484 ) ) ( not ( = ?auto_89483 ?auto_89485 ) ) ( not ( = ?auto_89484 ?auto_89485 ) ) ( ON ?auto_89485 ?auto_89486 ) ( CLEAR ?auto_89485 ) ( not ( = ?auto_89481 ?auto_89486 ) ) ( not ( = ?auto_89482 ?auto_89486 ) ) ( not ( = ?auto_89483 ?auto_89486 ) ) ( not ( = ?auto_89484 ?auto_89486 ) ) ( not ( = ?auto_89485 ?auto_89486 ) ) ( HOLDING ?auto_89484 ) ( CLEAR ?auto_89483 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89481 ?auto_89482 ?auto_89483 ?auto_89484 )
      ( MAKE-5PILE ?auto_89481 ?auto_89482 ?auto_89483 ?auto_89484 ?auto_89485 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89487 - BLOCK
      ?auto_89488 - BLOCK
      ?auto_89489 - BLOCK
      ?auto_89490 - BLOCK
      ?auto_89491 - BLOCK
    )
    :vars
    (
      ?auto_89492 - BLOCK
      ?auto_89494 - BLOCK
      ?auto_89493 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89487 ) ( ON ?auto_89488 ?auto_89487 ) ( ON ?auto_89489 ?auto_89488 ) ( not ( = ?auto_89487 ?auto_89488 ) ) ( not ( = ?auto_89487 ?auto_89489 ) ) ( not ( = ?auto_89487 ?auto_89490 ) ) ( not ( = ?auto_89487 ?auto_89491 ) ) ( not ( = ?auto_89488 ?auto_89489 ) ) ( not ( = ?auto_89488 ?auto_89490 ) ) ( not ( = ?auto_89488 ?auto_89491 ) ) ( not ( = ?auto_89489 ?auto_89490 ) ) ( not ( = ?auto_89489 ?auto_89491 ) ) ( not ( = ?auto_89490 ?auto_89491 ) ) ( ON ?auto_89491 ?auto_89492 ) ( not ( = ?auto_89487 ?auto_89492 ) ) ( not ( = ?auto_89488 ?auto_89492 ) ) ( not ( = ?auto_89489 ?auto_89492 ) ) ( not ( = ?auto_89490 ?auto_89492 ) ) ( not ( = ?auto_89491 ?auto_89492 ) ) ( CLEAR ?auto_89489 ) ( ON ?auto_89490 ?auto_89491 ) ( CLEAR ?auto_89490 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_89494 ) ( ON ?auto_89493 ?auto_89494 ) ( ON ?auto_89492 ?auto_89493 ) ( not ( = ?auto_89494 ?auto_89493 ) ) ( not ( = ?auto_89494 ?auto_89492 ) ) ( not ( = ?auto_89494 ?auto_89491 ) ) ( not ( = ?auto_89494 ?auto_89490 ) ) ( not ( = ?auto_89493 ?auto_89492 ) ) ( not ( = ?auto_89493 ?auto_89491 ) ) ( not ( = ?auto_89493 ?auto_89490 ) ) ( not ( = ?auto_89487 ?auto_89494 ) ) ( not ( = ?auto_89487 ?auto_89493 ) ) ( not ( = ?auto_89488 ?auto_89494 ) ) ( not ( = ?auto_89488 ?auto_89493 ) ) ( not ( = ?auto_89489 ?auto_89494 ) ) ( not ( = ?auto_89489 ?auto_89493 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89494 ?auto_89493 ?auto_89492 ?auto_89491 )
      ( MAKE-5PILE ?auto_89487 ?auto_89488 ?auto_89489 ?auto_89490 ?auto_89491 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89495 - BLOCK
      ?auto_89496 - BLOCK
      ?auto_89497 - BLOCK
      ?auto_89498 - BLOCK
      ?auto_89499 - BLOCK
    )
    :vars
    (
      ?auto_89502 - BLOCK
      ?auto_89500 - BLOCK
      ?auto_89501 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89495 ) ( ON ?auto_89496 ?auto_89495 ) ( not ( = ?auto_89495 ?auto_89496 ) ) ( not ( = ?auto_89495 ?auto_89497 ) ) ( not ( = ?auto_89495 ?auto_89498 ) ) ( not ( = ?auto_89495 ?auto_89499 ) ) ( not ( = ?auto_89496 ?auto_89497 ) ) ( not ( = ?auto_89496 ?auto_89498 ) ) ( not ( = ?auto_89496 ?auto_89499 ) ) ( not ( = ?auto_89497 ?auto_89498 ) ) ( not ( = ?auto_89497 ?auto_89499 ) ) ( not ( = ?auto_89498 ?auto_89499 ) ) ( ON ?auto_89499 ?auto_89502 ) ( not ( = ?auto_89495 ?auto_89502 ) ) ( not ( = ?auto_89496 ?auto_89502 ) ) ( not ( = ?auto_89497 ?auto_89502 ) ) ( not ( = ?auto_89498 ?auto_89502 ) ) ( not ( = ?auto_89499 ?auto_89502 ) ) ( ON ?auto_89498 ?auto_89499 ) ( CLEAR ?auto_89498 ) ( ON-TABLE ?auto_89500 ) ( ON ?auto_89501 ?auto_89500 ) ( ON ?auto_89502 ?auto_89501 ) ( not ( = ?auto_89500 ?auto_89501 ) ) ( not ( = ?auto_89500 ?auto_89502 ) ) ( not ( = ?auto_89500 ?auto_89499 ) ) ( not ( = ?auto_89500 ?auto_89498 ) ) ( not ( = ?auto_89501 ?auto_89502 ) ) ( not ( = ?auto_89501 ?auto_89499 ) ) ( not ( = ?auto_89501 ?auto_89498 ) ) ( not ( = ?auto_89495 ?auto_89500 ) ) ( not ( = ?auto_89495 ?auto_89501 ) ) ( not ( = ?auto_89496 ?auto_89500 ) ) ( not ( = ?auto_89496 ?auto_89501 ) ) ( not ( = ?auto_89497 ?auto_89500 ) ) ( not ( = ?auto_89497 ?auto_89501 ) ) ( HOLDING ?auto_89497 ) ( CLEAR ?auto_89496 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89495 ?auto_89496 ?auto_89497 )
      ( MAKE-5PILE ?auto_89495 ?auto_89496 ?auto_89497 ?auto_89498 ?auto_89499 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89503 - BLOCK
      ?auto_89504 - BLOCK
      ?auto_89505 - BLOCK
      ?auto_89506 - BLOCK
      ?auto_89507 - BLOCK
    )
    :vars
    (
      ?auto_89510 - BLOCK
      ?auto_89508 - BLOCK
      ?auto_89509 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89503 ) ( ON ?auto_89504 ?auto_89503 ) ( not ( = ?auto_89503 ?auto_89504 ) ) ( not ( = ?auto_89503 ?auto_89505 ) ) ( not ( = ?auto_89503 ?auto_89506 ) ) ( not ( = ?auto_89503 ?auto_89507 ) ) ( not ( = ?auto_89504 ?auto_89505 ) ) ( not ( = ?auto_89504 ?auto_89506 ) ) ( not ( = ?auto_89504 ?auto_89507 ) ) ( not ( = ?auto_89505 ?auto_89506 ) ) ( not ( = ?auto_89505 ?auto_89507 ) ) ( not ( = ?auto_89506 ?auto_89507 ) ) ( ON ?auto_89507 ?auto_89510 ) ( not ( = ?auto_89503 ?auto_89510 ) ) ( not ( = ?auto_89504 ?auto_89510 ) ) ( not ( = ?auto_89505 ?auto_89510 ) ) ( not ( = ?auto_89506 ?auto_89510 ) ) ( not ( = ?auto_89507 ?auto_89510 ) ) ( ON ?auto_89506 ?auto_89507 ) ( ON-TABLE ?auto_89508 ) ( ON ?auto_89509 ?auto_89508 ) ( ON ?auto_89510 ?auto_89509 ) ( not ( = ?auto_89508 ?auto_89509 ) ) ( not ( = ?auto_89508 ?auto_89510 ) ) ( not ( = ?auto_89508 ?auto_89507 ) ) ( not ( = ?auto_89508 ?auto_89506 ) ) ( not ( = ?auto_89509 ?auto_89510 ) ) ( not ( = ?auto_89509 ?auto_89507 ) ) ( not ( = ?auto_89509 ?auto_89506 ) ) ( not ( = ?auto_89503 ?auto_89508 ) ) ( not ( = ?auto_89503 ?auto_89509 ) ) ( not ( = ?auto_89504 ?auto_89508 ) ) ( not ( = ?auto_89504 ?auto_89509 ) ) ( not ( = ?auto_89505 ?auto_89508 ) ) ( not ( = ?auto_89505 ?auto_89509 ) ) ( CLEAR ?auto_89504 ) ( ON ?auto_89505 ?auto_89506 ) ( CLEAR ?auto_89505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89508 ?auto_89509 ?auto_89510 ?auto_89507 ?auto_89506 )
      ( MAKE-5PILE ?auto_89503 ?auto_89504 ?auto_89505 ?auto_89506 ?auto_89507 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89511 - BLOCK
      ?auto_89512 - BLOCK
      ?auto_89513 - BLOCK
      ?auto_89514 - BLOCK
      ?auto_89515 - BLOCK
    )
    :vars
    (
      ?auto_89516 - BLOCK
      ?auto_89518 - BLOCK
      ?auto_89517 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89511 ) ( not ( = ?auto_89511 ?auto_89512 ) ) ( not ( = ?auto_89511 ?auto_89513 ) ) ( not ( = ?auto_89511 ?auto_89514 ) ) ( not ( = ?auto_89511 ?auto_89515 ) ) ( not ( = ?auto_89512 ?auto_89513 ) ) ( not ( = ?auto_89512 ?auto_89514 ) ) ( not ( = ?auto_89512 ?auto_89515 ) ) ( not ( = ?auto_89513 ?auto_89514 ) ) ( not ( = ?auto_89513 ?auto_89515 ) ) ( not ( = ?auto_89514 ?auto_89515 ) ) ( ON ?auto_89515 ?auto_89516 ) ( not ( = ?auto_89511 ?auto_89516 ) ) ( not ( = ?auto_89512 ?auto_89516 ) ) ( not ( = ?auto_89513 ?auto_89516 ) ) ( not ( = ?auto_89514 ?auto_89516 ) ) ( not ( = ?auto_89515 ?auto_89516 ) ) ( ON ?auto_89514 ?auto_89515 ) ( ON-TABLE ?auto_89518 ) ( ON ?auto_89517 ?auto_89518 ) ( ON ?auto_89516 ?auto_89517 ) ( not ( = ?auto_89518 ?auto_89517 ) ) ( not ( = ?auto_89518 ?auto_89516 ) ) ( not ( = ?auto_89518 ?auto_89515 ) ) ( not ( = ?auto_89518 ?auto_89514 ) ) ( not ( = ?auto_89517 ?auto_89516 ) ) ( not ( = ?auto_89517 ?auto_89515 ) ) ( not ( = ?auto_89517 ?auto_89514 ) ) ( not ( = ?auto_89511 ?auto_89518 ) ) ( not ( = ?auto_89511 ?auto_89517 ) ) ( not ( = ?auto_89512 ?auto_89518 ) ) ( not ( = ?auto_89512 ?auto_89517 ) ) ( not ( = ?auto_89513 ?auto_89518 ) ) ( not ( = ?auto_89513 ?auto_89517 ) ) ( ON ?auto_89513 ?auto_89514 ) ( CLEAR ?auto_89513 ) ( HOLDING ?auto_89512 ) ( CLEAR ?auto_89511 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89511 ?auto_89512 )
      ( MAKE-5PILE ?auto_89511 ?auto_89512 ?auto_89513 ?auto_89514 ?auto_89515 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89519 - BLOCK
      ?auto_89520 - BLOCK
      ?auto_89521 - BLOCK
      ?auto_89522 - BLOCK
      ?auto_89523 - BLOCK
    )
    :vars
    (
      ?auto_89526 - BLOCK
      ?auto_89525 - BLOCK
      ?auto_89524 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89519 ) ( not ( = ?auto_89519 ?auto_89520 ) ) ( not ( = ?auto_89519 ?auto_89521 ) ) ( not ( = ?auto_89519 ?auto_89522 ) ) ( not ( = ?auto_89519 ?auto_89523 ) ) ( not ( = ?auto_89520 ?auto_89521 ) ) ( not ( = ?auto_89520 ?auto_89522 ) ) ( not ( = ?auto_89520 ?auto_89523 ) ) ( not ( = ?auto_89521 ?auto_89522 ) ) ( not ( = ?auto_89521 ?auto_89523 ) ) ( not ( = ?auto_89522 ?auto_89523 ) ) ( ON ?auto_89523 ?auto_89526 ) ( not ( = ?auto_89519 ?auto_89526 ) ) ( not ( = ?auto_89520 ?auto_89526 ) ) ( not ( = ?auto_89521 ?auto_89526 ) ) ( not ( = ?auto_89522 ?auto_89526 ) ) ( not ( = ?auto_89523 ?auto_89526 ) ) ( ON ?auto_89522 ?auto_89523 ) ( ON-TABLE ?auto_89525 ) ( ON ?auto_89524 ?auto_89525 ) ( ON ?auto_89526 ?auto_89524 ) ( not ( = ?auto_89525 ?auto_89524 ) ) ( not ( = ?auto_89525 ?auto_89526 ) ) ( not ( = ?auto_89525 ?auto_89523 ) ) ( not ( = ?auto_89525 ?auto_89522 ) ) ( not ( = ?auto_89524 ?auto_89526 ) ) ( not ( = ?auto_89524 ?auto_89523 ) ) ( not ( = ?auto_89524 ?auto_89522 ) ) ( not ( = ?auto_89519 ?auto_89525 ) ) ( not ( = ?auto_89519 ?auto_89524 ) ) ( not ( = ?auto_89520 ?auto_89525 ) ) ( not ( = ?auto_89520 ?auto_89524 ) ) ( not ( = ?auto_89521 ?auto_89525 ) ) ( not ( = ?auto_89521 ?auto_89524 ) ) ( ON ?auto_89521 ?auto_89522 ) ( CLEAR ?auto_89519 ) ( ON ?auto_89520 ?auto_89521 ) ( CLEAR ?auto_89520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89525 ?auto_89524 ?auto_89526 ?auto_89523 ?auto_89522 ?auto_89521 )
      ( MAKE-5PILE ?auto_89519 ?auto_89520 ?auto_89521 ?auto_89522 ?auto_89523 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89527 - BLOCK
      ?auto_89528 - BLOCK
      ?auto_89529 - BLOCK
      ?auto_89530 - BLOCK
      ?auto_89531 - BLOCK
    )
    :vars
    (
      ?auto_89532 - BLOCK
      ?auto_89534 - BLOCK
      ?auto_89533 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89527 ?auto_89528 ) ) ( not ( = ?auto_89527 ?auto_89529 ) ) ( not ( = ?auto_89527 ?auto_89530 ) ) ( not ( = ?auto_89527 ?auto_89531 ) ) ( not ( = ?auto_89528 ?auto_89529 ) ) ( not ( = ?auto_89528 ?auto_89530 ) ) ( not ( = ?auto_89528 ?auto_89531 ) ) ( not ( = ?auto_89529 ?auto_89530 ) ) ( not ( = ?auto_89529 ?auto_89531 ) ) ( not ( = ?auto_89530 ?auto_89531 ) ) ( ON ?auto_89531 ?auto_89532 ) ( not ( = ?auto_89527 ?auto_89532 ) ) ( not ( = ?auto_89528 ?auto_89532 ) ) ( not ( = ?auto_89529 ?auto_89532 ) ) ( not ( = ?auto_89530 ?auto_89532 ) ) ( not ( = ?auto_89531 ?auto_89532 ) ) ( ON ?auto_89530 ?auto_89531 ) ( ON-TABLE ?auto_89534 ) ( ON ?auto_89533 ?auto_89534 ) ( ON ?auto_89532 ?auto_89533 ) ( not ( = ?auto_89534 ?auto_89533 ) ) ( not ( = ?auto_89534 ?auto_89532 ) ) ( not ( = ?auto_89534 ?auto_89531 ) ) ( not ( = ?auto_89534 ?auto_89530 ) ) ( not ( = ?auto_89533 ?auto_89532 ) ) ( not ( = ?auto_89533 ?auto_89531 ) ) ( not ( = ?auto_89533 ?auto_89530 ) ) ( not ( = ?auto_89527 ?auto_89534 ) ) ( not ( = ?auto_89527 ?auto_89533 ) ) ( not ( = ?auto_89528 ?auto_89534 ) ) ( not ( = ?auto_89528 ?auto_89533 ) ) ( not ( = ?auto_89529 ?auto_89534 ) ) ( not ( = ?auto_89529 ?auto_89533 ) ) ( ON ?auto_89529 ?auto_89530 ) ( ON ?auto_89528 ?auto_89529 ) ( CLEAR ?auto_89528 ) ( HOLDING ?auto_89527 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_89527 )
      ( MAKE-5PILE ?auto_89527 ?auto_89528 ?auto_89529 ?auto_89530 ?auto_89531 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89535 - BLOCK
      ?auto_89536 - BLOCK
      ?auto_89537 - BLOCK
      ?auto_89538 - BLOCK
      ?auto_89539 - BLOCK
    )
    :vars
    (
      ?auto_89540 - BLOCK
      ?auto_89542 - BLOCK
      ?auto_89541 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89535 ?auto_89536 ) ) ( not ( = ?auto_89535 ?auto_89537 ) ) ( not ( = ?auto_89535 ?auto_89538 ) ) ( not ( = ?auto_89535 ?auto_89539 ) ) ( not ( = ?auto_89536 ?auto_89537 ) ) ( not ( = ?auto_89536 ?auto_89538 ) ) ( not ( = ?auto_89536 ?auto_89539 ) ) ( not ( = ?auto_89537 ?auto_89538 ) ) ( not ( = ?auto_89537 ?auto_89539 ) ) ( not ( = ?auto_89538 ?auto_89539 ) ) ( ON ?auto_89539 ?auto_89540 ) ( not ( = ?auto_89535 ?auto_89540 ) ) ( not ( = ?auto_89536 ?auto_89540 ) ) ( not ( = ?auto_89537 ?auto_89540 ) ) ( not ( = ?auto_89538 ?auto_89540 ) ) ( not ( = ?auto_89539 ?auto_89540 ) ) ( ON ?auto_89538 ?auto_89539 ) ( ON-TABLE ?auto_89542 ) ( ON ?auto_89541 ?auto_89542 ) ( ON ?auto_89540 ?auto_89541 ) ( not ( = ?auto_89542 ?auto_89541 ) ) ( not ( = ?auto_89542 ?auto_89540 ) ) ( not ( = ?auto_89542 ?auto_89539 ) ) ( not ( = ?auto_89542 ?auto_89538 ) ) ( not ( = ?auto_89541 ?auto_89540 ) ) ( not ( = ?auto_89541 ?auto_89539 ) ) ( not ( = ?auto_89541 ?auto_89538 ) ) ( not ( = ?auto_89535 ?auto_89542 ) ) ( not ( = ?auto_89535 ?auto_89541 ) ) ( not ( = ?auto_89536 ?auto_89542 ) ) ( not ( = ?auto_89536 ?auto_89541 ) ) ( not ( = ?auto_89537 ?auto_89542 ) ) ( not ( = ?auto_89537 ?auto_89541 ) ) ( ON ?auto_89537 ?auto_89538 ) ( ON ?auto_89536 ?auto_89537 ) ( ON ?auto_89535 ?auto_89536 ) ( CLEAR ?auto_89535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_89542 ?auto_89541 ?auto_89540 ?auto_89539 ?auto_89538 ?auto_89537 ?auto_89536 )
      ( MAKE-5PILE ?auto_89535 ?auto_89536 ?auto_89537 ?auto_89538 ?auto_89539 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89545 - BLOCK
      ?auto_89546 - BLOCK
    )
    :vars
    (
      ?auto_89547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89547 ?auto_89546 ) ( CLEAR ?auto_89547 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_89545 ) ( ON ?auto_89546 ?auto_89545 ) ( not ( = ?auto_89545 ?auto_89546 ) ) ( not ( = ?auto_89545 ?auto_89547 ) ) ( not ( = ?auto_89546 ?auto_89547 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_89547 ?auto_89546 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89548 - BLOCK
      ?auto_89549 - BLOCK
    )
    :vars
    (
      ?auto_89550 - BLOCK
      ?auto_89551 - BLOCK
      ?auto_89552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89550 ?auto_89549 ) ( CLEAR ?auto_89550 ) ( ON-TABLE ?auto_89548 ) ( ON ?auto_89549 ?auto_89548 ) ( not ( = ?auto_89548 ?auto_89549 ) ) ( not ( = ?auto_89548 ?auto_89550 ) ) ( not ( = ?auto_89549 ?auto_89550 ) ) ( HOLDING ?auto_89551 ) ( CLEAR ?auto_89552 ) ( not ( = ?auto_89548 ?auto_89551 ) ) ( not ( = ?auto_89548 ?auto_89552 ) ) ( not ( = ?auto_89549 ?auto_89551 ) ) ( not ( = ?auto_89549 ?auto_89552 ) ) ( not ( = ?auto_89550 ?auto_89551 ) ) ( not ( = ?auto_89550 ?auto_89552 ) ) ( not ( = ?auto_89551 ?auto_89552 ) ) )
    :subtasks
    ( ( !STACK ?auto_89551 ?auto_89552 )
      ( MAKE-2PILE ?auto_89548 ?auto_89549 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89553 - BLOCK
      ?auto_89554 - BLOCK
    )
    :vars
    (
      ?auto_89555 - BLOCK
      ?auto_89557 - BLOCK
      ?auto_89556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89555 ?auto_89554 ) ( ON-TABLE ?auto_89553 ) ( ON ?auto_89554 ?auto_89553 ) ( not ( = ?auto_89553 ?auto_89554 ) ) ( not ( = ?auto_89553 ?auto_89555 ) ) ( not ( = ?auto_89554 ?auto_89555 ) ) ( CLEAR ?auto_89557 ) ( not ( = ?auto_89553 ?auto_89556 ) ) ( not ( = ?auto_89553 ?auto_89557 ) ) ( not ( = ?auto_89554 ?auto_89556 ) ) ( not ( = ?auto_89554 ?auto_89557 ) ) ( not ( = ?auto_89555 ?auto_89556 ) ) ( not ( = ?auto_89555 ?auto_89557 ) ) ( not ( = ?auto_89556 ?auto_89557 ) ) ( ON ?auto_89556 ?auto_89555 ) ( CLEAR ?auto_89556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89553 ?auto_89554 ?auto_89555 )
      ( MAKE-2PILE ?auto_89553 ?auto_89554 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89558 - BLOCK
      ?auto_89559 - BLOCK
    )
    :vars
    (
      ?auto_89560 - BLOCK
      ?auto_89561 - BLOCK
      ?auto_89562 - BLOCK
      ?auto_89563 - BLOCK
      ?auto_89564 - BLOCK
      ?auto_89565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89560 ?auto_89559 ) ( ON-TABLE ?auto_89558 ) ( ON ?auto_89559 ?auto_89558 ) ( not ( = ?auto_89558 ?auto_89559 ) ) ( not ( = ?auto_89558 ?auto_89560 ) ) ( not ( = ?auto_89559 ?auto_89560 ) ) ( not ( = ?auto_89558 ?auto_89561 ) ) ( not ( = ?auto_89558 ?auto_89562 ) ) ( not ( = ?auto_89559 ?auto_89561 ) ) ( not ( = ?auto_89559 ?auto_89562 ) ) ( not ( = ?auto_89560 ?auto_89561 ) ) ( not ( = ?auto_89560 ?auto_89562 ) ) ( not ( = ?auto_89561 ?auto_89562 ) ) ( ON ?auto_89561 ?auto_89560 ) ( CLEAR ?auto_89561 ) ( HOLDING ?auto_89562 ) ( CLEAR ?auto_89563 ) ( ON-TABLE ?auto_89564 ) ( ON ?auto_89565 ?auto_89564 ) ( ON ?auto_89563 ?auto_89565 ) ( not ( = ?auto_89564 ?auto_89565 ) ) ( not ( = ?auto_89564 ?auto_89563 ) ) ( not ( = ?auto_89564 ?auto_89562 ) ) ( not ( = ?auto_89565 ?auto_89563 ) ) ( not ( = ?auto_89565 ?auto_89562 ) ) ( not ( = ?auto_89563 ?auto_89562 ) ) ( not ( = ?auto_89558 ?auto_89563 ) ) ( not ( = ?auto_89558 ?auto_89564 ) ) ( not ( = ?auto_89558 ?auto_89565 ) ) ( not ( = ?auto_89559 ?auto_89563 ) ) ( not ( = ?auto_89559 ?auto_89564 ) ) ( not ( = ?auto_89559 ?auto_89565 ) ) ( not ( = ?auto_89560 ?auto_89563 ) ) ( not ( = ?auto_89560 ?auto_89564 ) ) ( not ( = ?auto_89560 ?auto_89565 ) ) ( not ( = ?auto_89561 ?auto_89563 ) ) ( not ( = ?auto_89561 ?auto_89564 ) ) ( not ( = ?auto_89561 ?auto_89565 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89564 ?auto_89565 ?auto_89563 ?auto_89562 )
      ( MAKE-2PILE ?auto_89558 ?auto_89559 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89566 - BLOCK
      ?auto_89567 - BLOCK
    )
    :vars
    (
      ?auto_89573 - BLOCK
      ?auto_89568 - BLOCK
      ?auto_89572 - BLOCK
      ?auto_89571 - BLOCK
      ?auto_89569 - BLOCK
      ?auto_89570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89573 ?auto_89567 ) ( ON-TABLE ?auto_89566 ) ( ON ?auto_89567 ?auto_89566 ) ( not ( = ?auto_89566 ?auto_89567 ) ) ( not ( = ?auto_89566 ?auto_89573 ) ) ( not ( = ?auto_89567 ?auto_89573 ) ) ( not ( = ?auto_89566 ?auto_89568 ) ) ( not ( = ?auto_89566 ?auto_89572 ) ) ( not ( = ?auto_89567 ?auto_89568 ) ) ( not ( = ?auto_89567 ?auto_89572 ) ) ( not ( = ?auto_89573 ?auto_89568 ) ) ( not ( = ?auto_89573 ?auto_89572 ) ) ( not ( = ?auto_89568 ?auto_89572 ) ) ( ON ?auto_89568 ?auto_89573 ) ( CLEAR ?auto_89571 ) ( ON-TABLE ?auto_89569 ) ( ON ?auto_89570 ?auto_89569 ) ( ON ?auto_89571 ?auto_89570 ) ( not ( = ?auto_89569 ?auto_89570 ) ) ( not ( = ?auto_89569 ?auto_89571 ) ) ( not ( = ?auto_89569 ?auto_89572 ) ) ( not ( = ?auto_89570 ?auto_89571 ) ) ( not ( = ?auto_89570 ?auto_89572 ) ) ( not ( = ?auto_89571 ?auto_89572 ) ) ( not ( = ?auto_89566 ?auto_89571 ) ) ( not ( = ?auto_89566 ?auto_89569 ) ) ( not ( = ?auto_89566 ?auto_89570 ) ) ( not ( = ?auto_89567 ?auto_89571 ) ) ( not ( = ?auto_89567 ?auto_89569 ) ) ( not ( = ?auto_89567 ?auto_89570 ) ) ( not ( = ?auto_89573 ?auto_89571 ) ) ( not ( = ?auto_89573 ?auto_89569 ) ) ( not ( = ?auto_89573 ?auto_89570 ) ) ( not ( = ?auto_89568 ?auto_89571 ) ) ( not ( = ?auto_89568 ?auto_89569 ) ) ( not ( = ?auto_89568 ?auto_89570 ) ) ( ON ?auto_89572 ?auto_89568 ) ( CLEAR ?auto_89572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89566 ?auto_89567 ?auto_89573 ?auto_89568 )
      ( MAKE-2PILE ?auto_89566 ?auto_89567 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89574 - BLOCK
      ?auto_89575 - BLOCK
    )
    :vars
    (
      ?auto_89579 - BLOCK
      ?auto_89578 - BLOCK
      ?auto_89580 - BLOCK
      ?auto_89577 - BLOCK
      ?auto_89581 - BLOCK
      ?auto_89576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89579 ?auto_89575 ) ( ON-TABLE ?auto_89574 ) ( ON ?auto_89575 ?auto_89574 ) ( not ( = ?auto_89574 ?auto_89575 ) ) ( not ( = ?auto_89574 ?auto_89579 ) ) ( not ( = ?auto_89575 ?auto_89579 ) ) ( not ( = ?auto_89574 ?auto_89578 ) ) ( not ( = ?auto_89574 ?auto_89580 ) ) ( not ( = ?auto_89575 ?auto_89578 ) ) ( not ( = ?auto_89575 ?auto_89580 ) ) ( not ( = ?auto_89579 ?auto_89578 ) ) ( not ( = ?auto_89579 ?auto_89580 ) ) ( not ( = ?auto_89578 ?auto_89580 ) ) ( ON ?auto_89578 ?auto_89579 ) ( ON-TABLE ?auto_89577 ) ( ON ?auto_89581 ?auto_89577 ) ( not ( = ?auto_89577 ?auto_89581 ) ) ( not ( = ?auto_89577 ?auto_89576 ) ) ( not ( = ?auto_89577 ?auto_89580 ) ) ( not ( = ?auto_89581 ?auto_89576 ) ) ( not ( = ?auto_89581 ?auto_89580 ) ) ( not ( = ?auto_89576 ?auto_89580 ) ) ( not ( = ?auto_89574 ?auto_89576 ) ) ( not ( = ?auto_89574 ?auto_89577 ) ) ( not ( = ?auto_89574 ?auto_89581 ) ) ( not ( = ?auto_89575 ?auto_89576 ) ) ( not ( = ?auto_89575 ?auto_89577 ) ) ( not ( = ?auto_89575 ?auto_89581 ) ) ( not ( = ?auto_89579 ?auto_89576 ) ) ( not ( = ?auto_89579 ?auto_89577 ) ) ( not ( = ?auto_89579 ?auto_89581 ) ) ( not ( = ?auto_89578 ?auto_89576 ) ) ( not ( = ?auto_89578 ?auto_89577 ) ) ( not ( = ?auto_89578 ?auto_89581 ) ) ( ON ?auto_89580 ?auto_89578 ) ( CLEAR ?auto_89580 ) ( HOLDING ?auto_89576 ) ( CLEAR ?auto_89581 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89577 ?auto_89581 ?auto_89576 )
      ( MAKE-2PILE ?auto_89574 ?auto_89575 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89582 - BLOCK
      ?auto_89583 - BLOCK
    )
    :vars
    (
      ?auto_89584 - BLOCK
      ?auto_89585 - BLOCK
      ?auto_89587 - BLOCK
      ?auto_89589 - BLOCK
      ?auto_89588 - BLOCK
      ?auto_89586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89584 ?auto_89583 ) ( ON-TABLE ?auto_89582 ) ( ON ?auto_89583 ?auto_89582 ) ( not ( = ?auto_89582 ?auto_89583 ) ) ( not ( = ?auto_89582 ?auto_89584 ) ) ( not ( = ?auto_89583 ?auto_89584 ) ) ( not ( = ?auto_89582 ?auto_89585 ) ) ( not ( = ?auto_89582 ?auto_89587 ) ) ( not ( = ?auto_89583 ?auto_89585 ) ) ( not ( = ?auto_89583 ?auto_89587 ) ) ( not ( = ?auto_89584 ?auto_89585 ) ) ( not ( = ?auto_89584 ?auto_89587 ) ) ( not ( = ?auto_89585 ?auto_89587 ) ) ( ON ?auto_89585 ?auto_89584 ) ( ON-TABLE ?auto_89589 ) ( ON ?auto_89588 ?auto_89589 ) ( not ( = ?auto_89589 ?auto_89588 ) ) ( not ( = ?auto_89589 ?auto_89586 ) ) ( not ( = ?auto_89589 ?auto_89587 ) ) ( not ( = ?auto_89588 ?auto_89586 ) ) ( not ( = ?auto_89588 ?auto_89587 ) ) ( not ( = ?auto_89586 ?auto_89587 ) ) ( not ( = ?auto_89582 ?auto_89586 ) ) ( not ( = ?auto_89582 ?auto_89589 ) ) ( not ( = ?auto_89582 ?auto_89588 ) ) ( not ( = ?auto_89583 ?auto_89586 ) ) ( not ( = ?auto_89583 ?auto_89589 ) ) ( not ( = ?auto_89583 ?auto_89588 ) ) ( not ( = ?auto_89584 ?auto_89586 ) ) ( not ( = ?auto_89584 ?auto_89589 ) ) ( not ( = ?auto_89584 ?auto_89588 ) ) ( not ( = ?auto_89585 ?auto_89586 ) ) ( not ( = ?auto_89585 ?auto_89589 ) ) ( not ( = ?auto_89585 ?auto_89588 ) ) ( ON ?auto_89587 ?auto_89585 ) ( CLEAR ?auto_89588 ) ( ON ?auto_89586 ?auto_89587 ) ( CLEAR ?auto_89586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89582 ?auto_89583 ?auto_89584 ?auto_89585 ?auto_89587 )
      ( MAKE-2PILE ?auto_89582 ?auto_89583 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89590 - BLOCK
      ?auto_89591 - BLOCK
    )
    :vars
    (
      ?auto_89597 - BLOCK
      ?auto_89592 - BLOCK
      ?auto_89593 - BLOCK
      ?auto_89595 - BLOCK
      ?auto_89596 - BLOCK
      ?auto_89594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89597 ?auto_89591 ) ( ON-TABLE ?auto_89590 ) ( ON ?auto_89591 ?auto_89590 ) ( not ( = ?auto_89590 ?auto_89591 ) ) ( not ( = ?auto_89590 ?auto_89597 ) ) ( not ( = ?auto_89591 ?auto_89597 ) ) ( not ( = ?auto_89590 ?auto_89592 ) ) ( not ( = ?auto_89590 ?auto_89593 ) ) ( not ( = ?auto_89591 ?auto_89592 ) ) ( not ( = ?auto_89591 ?auto_89593 ) ) ( not ( = ?auto_89597 ?auto_89592 ) ) ( not ( = ?auto_89597 ?auto_89593 ) ) ( not ( = ?auto_89592 ?auto_89593 ) ) ( ON ?auto_89592 ?auto_89597 ) ( ON-TABLE ?auto_89595 ) ( not ( = ?auto_89595 ?auto_89596 ) ) ( not ( = ?auto_89595 ?auto_89594 ) ) ( not ( = ?auto_89595 ?auto_89593 ) ) ( not ( = ?auto_89596 ?auto_89594 ) ) ( not ( = ?auto_89596 ?auto_89593 ) ) ( not ( = ?auto_89594 ?auto_89593 ) ) ( not ( = ?auto_89590 ?auto_89594 ) ) ( not ( = ?auto_89590 ?auto_89595 ) ) ( not ( = ?auto_89590 ?auto_89596 ) ) ( not ( = ?auto_89591 ?auto_89594 ) ) ( not ( = ?auto_89591 ?auto_89595 ) ) ( not ( = ?auto_89591 ?auto_89596 ) ) ( not ( = ?auto_89597 ?auto_89594 ) ) ( not ( = ?auto_89597 ?auto_89595 ) ) ( not ( = ?auto_89597 ?auto_89596 ) ) ( not ( = ?auto_89592 ?auto_89594 ) ) ( not ( = ?auto_89592 ?auto_89595 ) ) ( not ( = ?auto_89592 ?auto_89596 ) ) ( ON ?auto_89593 ?auto_89592 ) ( ON ?auto_89594 ?auto_89593 ) ( CLEAR ?auto_89594 ) ( HOLDING ?auto_89596 ) ( CLEAR ?auto_89595 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89595 ?auto_89596 )
      ( MAKE-2PILE ?auto_89590 ?auto_89591 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90891 - BLOCK
      ?auto_90892 - BLOCK
    )
    :vars
    (
      ?auto_90897 - BLOCK
      ?auto_90894 - BLOCK
      ?auto_90895 - BLOCK
      ?auto_90893 - BLOCK
      ?auto_90896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90897 ?auto_90892 ) ( ON-TABLE ?auto_90891 ) ( ON ?auto_90892 ?auto_90891 ) ( not ( = ?auto_90891 ?auto_90892 ) ) ( not ( = ?auto_90891 ?auto_90897 ) ) ( not ( = ?auto_90892 ?auto_90897 ) ) ( not ( = ?auto_90891 ?auto_90894 ) ) ( not ( = ?auto_90891 ?auto_90895 ) ) ( not ( = ?auto_90892 ?auto_90894 ) ) ( not ( = ?auto_90892 ?auto_90895 ) ) ( not ( = ?auto_90897 ?auto_90894 ) ) ( not ( = ?auto_90897 ?auto_90895 ) ) ( not ( = ?auto_90894 ?auto_90895 ) ) ( ON ?auto_90894 ?auto_90897 ) ( not ( = ?auto_90893 ?auto_90896 ) ) ( not ( = ?auto_90893 ?auto_90895 ) ) ( not ( = ?auto_90896 ?auto_90895 ) ) ( not ( = ?auto_90891 ?auto_90896 ) ) ( not ( = ?auto_90891 ?auto_90893 ) ) ( not ( = ?auto_90892 ?auto_90896 ) ) ( not ( = ?auto_90892 ?auto_90893 ) ) ( not ( = ?auto_90897 ?auto_90896 ) ) ( not ( = ?auto_90897 ?auto_90893 ) ) ( not ( = ?auto_90894 ?auto_90896 ) ) ( not ( = ?auto_90894 ?auto_90893 ) ) ( ON ?auto_90895 ?auto_90894 ) ( ON ?auto_90896 ?auto_90895 ) ( ON ?auto_90893 ?auto_90896 ) ( CLEAR ?auto_90893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90891 ?auto_90892 ?auto_90897 ?auto_90894 ?auto_90895 ?auto_90896 )
      ( MAKE-2PILE ?auto_90891 ?auto_90892 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89606 - BLOCK
      ?auto_89607 - BLOCK
    )
    :vars
    (
      ?auto_89608 - BLOCK
      ?auto_89612 - BLOCK
      ?auto_89610 - BLOCK
      ?auto_89611 - BLOCK
      ?auto_89613 - BLOCK
      ?auto_89609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89608 ?auto_89607 ) ( ON-TABLE ?auto_89606 ) ( ON ?auto_89607 ?auto_89606 ) ( not ( = ?auto_89606 ?auto_89607 ) ) ( not ( = ?auto_89606 ?auto_89608 ) ) ( not ( = ?auto_89607 ?auto_89608 ) ) ( not ( = ?auto_89606 ?auto_89612 ) ) ( not ( = ?auto_89606 ?auto_89610 ) ) ( not ( = ?auto_89607 ?auto_89612 ) ) ( not ( = ?auto_89607 ?auto_89610 ) ) ( not ( = ?auto_89608 ?auto_89612 ) ) ( not ( = ?auto_89608 ?auto_89610 ) ) ( not ( = ?auto_89612 ?auto_89610 ) ) ( ON ?auto_89612 ?auto_89608 ) ( not ( = ?auto_89611 ?auto_89613 ) ) ( not ( = ?auto_89611 ?auto_89609 ) ) ( not ( = ?auto_89611 ?auto_89610 ) ) ( not ( = ?auto_89613 ?auto_89609 ) ) ( not ( = ?auto_89613 ?auto_89610 ) ) ( not ( = ?auto_89609 ?auto_89610 ) ) ( not ( = ?auto_89606 ?auto_89609 ) ) ( not ( = ?auto_89606 ?auto_89611 ) ) ( not ( = ?auto_89606 ?auto_89613 ) ) ( not ( = ?auto_89607 ?auto_89609 ) ) ( not ( = ?auto_89607 ?auto_89611 ) ) ( not ( = ?auto_89607 ?auto_89613 ) ) ( not ( = ?auto_89608 ?auto_89609 ) ) ( not ( = ?auto_89608 ?auto_89611 ) ) ( not ( = ?auto_89608 ?auto_89613 ) ) ( not ( = ?auto_89612 ?auto_89609 ) ) ( not ( = ?auto_89612 ?auto_89611 ) ) ( not ( = ?auto_89612 ?auto_89613 ) ) ( ON ?auto_89610 ?auto_89612 ) ( ON ?auto_89609 ?auto_89610 ) ( ON ?auto_89613 ?auto_89609 ) ( CLEAR ?auto_89613 ) ( HOLDING ?auto_89611 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_89611 )
      ( MAKE-2PILE ?auto_89606 ?auto_89607 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89614 - BLOCK
      ?auto_89615 - BLOCK
    )
    :vars
    (
      ?auto_89621 - BLOCK
      ?auto_89620 - BLOCK
      ?auto_89619 - BLOCK
      ?auto_89617 - BLOCK
      ?auto_89616 - BLOCK
      ?auto_89618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89621 ?auto_89615 ) ( ON-TABLE ?auto_89614 ) ( ON ?auto_89615 ?auto_89614 ) ( not ( = ?auto_89614 ?auto_89615 ) ) ( not ( = ?auto_89614 ?auto_89621 ) ) ( not ( = ?auto_89615 ?auto_89621 ) ) ( not ( = ?auto_89614 ?auto_89620 ) ) ( not ( = ?auto_89614 ?auto_89619 ) ) ( not ( = ?auto_89615 ?auto_89620 ) ) ( not ( = ?auto_89615 ?auto_89619 ) ) ( not ( = ?auto_89621 ?auto_89620 ) ) ( not ( = ?auto_89621 ?auto_89619 ) ) ( not ( = ?auto_89620 ?auto_89619 ) ) ( ON ?auto_89620 ?auto_89621 ) ( not ( = ?auto_89617 ?auto_89616 ) ) ( not ( = ?auto_89617 ?auto_89618 ) ) ( not ( = ?auto_89617 ?auto_89619 ) ) ( not ( = ?auto_89616 ?auto_89618 ) ) ( not ( = ?auto_89616 ?auto_89619 ) ) ( not ( = ?auto_89618 ?auto_89619 ) ) ( not ( = ?auto_89614 ?auto_89618 ) ) ( not ( = ?auto_89614 ?auto_89617 ) ) ( not ( = ?auto_89614 ?auto_89616 ) ) ( not ( = ?auto_89615 ?auto_89618 ) ) ( not ( = ?auto_89615 ?auto_89617 ) ) ( not ( = ?auto_89615 ?auto_89616 ) ) ( not ( = ?auto_89621 ?auto_89618 ) ) ( not ( = ?auto_89621 ?auto_89617 ) ) ( not ( = ?auto_89621 ?auto_89616 ) ) ( not ( = ?auto_89620 ?auto_89618 ) ) ( not ( = ?auto_89620 ?auto_89617 ) ) ( not ( = ?auto_89620 ?auto_89616 ) ) ( ON ?auto_89619 ?auto_89620 ) ( ON ?auto_89618 ?auto_89619 ) ( ON ?auto_89616 ?auto_89618 ) ( ON ?auto_89617 ?auto_89616 ) ( CLEAR ?auto_89617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_89614 ?auto_89615 ?auto_89621 ?auto_89620 ?auto_89619 ?auto_89618 ?auto_89616 )
      ( MAKE-2PILE ?auto_89614 ?auto_89615 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89628 - BLOCK
      ?auto_89629 - BLOCK
      ?auto_89630 - BLOCK
      ?auto_89631 - BLOCK
      ?auto_89632 - BLOCK
      ?auto_89633 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_89633 ) ( CLEAR ?auto_89632 ) ( ON-TABLE ?auto_89628 ) ( ON ?auto_89629 ?auto_89628 ) ( ON ?auto_89630 ?auto_89629 ) ( ON ?auto_89631 ?auto_89630 ) ( ON ?auto_89632 ?auto_89631 ) ( not ( = ?auto_89628 ?auto_89629 ) ) ( not ( = ?auto_89628 ?auto_89630 ) ) ( not ( = ?auto_89628 ?auto_89631 ) ) ( not ( = ?auto_89628 ?auto_89632 ) ) ( not ( = ?auto_89628 ?auto_89633 ) ) ( not ( = ?auto_89629 ?auto_89630 ) ) ( not ( = ?auto_89629 ?auto_89631 ) ) ( not ( = ?auto_89629 ?auto_89632 ) ) ( not ( = ?auto_89629 ?auto_89633 ) ) ( not ( = ?auto_89630 ?auto_89631 ) ) ( not ( = ?auto_89630 ?auto_89632 ) ) ( not ( = ?auto_89630 ?auto_89633 ) ) ( not ( = ?auto_89631 ?auto_89632 ) ) ( not ( = ?auto_89631 ?auto_89633 ) ) ( not ( = ?auto_89632 ?auto_89633 ) ) )
    :subtasks
    ( ( !STACK ?auto_89633 ?auto_89632 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89634 - BLOCK
      ?auto_89635 - BLOCK
      ?auto_89636 - BLOCK
      ?auto_89637 - BLOCK
      ?auto_89638 - BLOCK
      ?auto_89639 - BLOCK
    )
    :vars
    (
      ?auto_89640 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_89638 ) ( ON-TABLE ?auto_89634 ) ( ON ?auto_89635 ?auto_89634 ) ( ON ?auto_89636 ?auto_89635 ) ( ON ?auto_89637 ?auto_89636 ) ( ON ?auto_89638 ?auto_89637 ) ( not ( = ?auto_89634 ?auto_89635 ) ) ( not ( = ?auto_89634 ?auto_89636 ) ) ( not ( = ?auto_89634 ?auto_89637 ) ) ( not ( = ?auto_89634 ?auto_89638 ) ) ( not ( = ?auto_89634 ?auto_89639 ) ) ( not ( = ?auto_89635 ?auto_89636 ) ) ( not ( = ?auto_89635 ?auto_89637 ) ) ( not ( = ?auto_89635 ?auto_89638 ) ) ( not ( = ?auto_89635 ?auto_89639 ) ) ( not ( = ?auto_89636 ?auto_89637 ) ) ( not ( = ?auto_89636 ?auto_89638 ) ) ( not ( = ?auto_89636 ?auto_89639 ) ) ( not ( = ?auto_89637 ?auto_89638 ) ) ( not ( = ?auto_89637 ?auto_89639 ) ) ( not ( = ?auto_89638 ?auto_89639 ) ) ( ON ?auto_89639 ?auto_89640 ) ( CLEAR ?auto_89639 ) ( HAND-EMPTY ) ( not ( = ?auto_89634 ?auto_89640 ) ) ( not ( = ?auto_89635 ?auto_89640 ) ) ( not ( = ?auto_89636 ?auto_89640 ) ) ( not ( = ?auto_89637 ?auto_89640 ) ) ( not ( = ?auto_89638 ?auto_89640 ) ) ( not ( = ?auto_89639 ?auto_89640 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_89639 ?auto_89640 )
      ( MAKE-6PILE ?auto_89634 ?auto_89635 ?auto_89636 ?auto_89637 ?auto_89638 ?auto_89639 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89641 - BLOCK
      ?auto_89642 - BLOCK
      ?auto_89643 - BLOCK
      ?auto_89644 - BLOCK
      ?auto_89645 - BLOCK
      ?auto_89646 - BLOCK
    )
    :vars
    (
      ?auto_89647 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89641 ) ( ON ?auto_89642 ?auto_89641 ) ( ON ?auto_89643 ?auto_89642 ) ( ON ?auto_89644 ?auto_89643 ) ( not ( = ?auto_89641 ?auto_89642 ) ) ( not ( = ?auto_89641 ?auto_89643 ) ) ( not ( = ?auto_89641 ?auto_89644 ) ) ( not ( = ?auto_89641 ?auto_89645 ) ) ( not ( = ?auto_89641 ?auto_89646 ) ) ( not ( = ?auto_89642 ?auto_89643 ) ) ( not ( = ?auto_89642 ?auto_89644 ) ) ( not ( = ?auto_89642 ?auto_89645 ) ) ( not ( = ?auto_89642 ?auto_89646 ) ) ( not ( = ?auto_89643 ?auto_89644 ) ) ( not ( = ?auto_89643 ?auto_89645 ) ) ( not ( = ?auto_89643 ?auto_89646 ) ) ( not ( = ?auto_89644 ?auto_89645 ) ) ( not ( = ?auto_89644 ?auto_89646 ) ) ( not ( = ?auto_89645 ?auto_89646 ) ) ( ON ?auto_89646 ?auto_89647 ) ( CLEAR ?auto_89646 ) ( not ( = ?auto_89641 ?auto_89647 ) ) ( not ( = ?auto_89642 ?auto_89647 ) ) ( not ( = ?auto_89643 ?auto_89647 ) ) ( not ( = ?auto_89644 ?auto_89647 ) ) ( not ( = ?auto_89645 ?auto_89647 ) ) ( not ( = ?auto_89646 ?auto_89647 ) ) ( HOLDING ?auto_89645 ) ( CLEAR ?auto_89644 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89641 ?auto_89642 ?auto_89643 ?auto_89644 ?auto_89645 )
      ( MAKE-6PILE ?auto_89641 ?auto_89642 ?auto_89643 ?auto_89644 ?auto_89645 ?auto_89646 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89648 - BLOCK
      ?auto_89649 - BLOCK
      ?auto_89650 - BLOCK
      ?auto_89651 - BLOCK
      ?auto_89652 - BLOCK
      ?auto_89653 - BLOCK
    )
    :vars
    (
      ?auto_89654 - BLOCK
      ?auto_89655 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89648 ) ( ON ?auto_89649 ?auto_89648 ) ( ON ?auto_89650 ?auto_89649 ) ( ON ?auto_89651 ?auto_89650 ) ( not ( = ?auto_89648 ?auto_89649 ) ) ( not ( = ?auto_89648 ?auto_89650 ) ) ( not ( = ?auto_89648 ?auto_89651 ) ) ( not ( = ?auto_89648 ?auto_89652 ) ) ( not ( = ?auto_89648 ?auto_89653 ) ) ( not ( = ?auto_89649 ?auto_89650 ) ) ( not ( = ?auto_89649 ?auto_89651 ) ) ( not ( = ?auto_89649 ?auto_89652 ) ) ( not ( = ?auto_89649 ?auto_89653 ) ) ( not ( = ?auto_89650 ?auto_89651 ) ) ( not ( = ?auto_89650 ?auto_89652 ) ) ( not ( = ?auto_89650 ?auto_89653 ) ) ( not ( = ?auto_89651 ?auto_89652 ) ) ( not ( = ?auto_89651 ?auto_89653 ) ) ( not ( = ?auto_89652 ?auto_89653 ) ) ( ON ?auto_89653 ?auto_89654 ) ( not ( = ?auto_89648 ?auto_89654 ) ) ( not ( = ?auto_89649 ?auto_89654 ) ) ( not ( = ?auto_89650 ?auto_89654 ) ) ( not ( = ?auto_89651 ?auto_89654 ) ) ( not ( = ?auto_89652 ?auto_89654 ) ) ( not ( = ?auto_89653 ?auto_89654 ) ) ( CLEAR ?auto_89651 ) ( ON ?auto_89652 ?auto_89653 ) ( CLEAR ?auto_89652 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_89655 ) ( ON ?auto_89654 ?auto_89655 ) ( not ( = ?auto_89655 ?auto_89654 ) ) ( not ( = ?auto_89655 ?auto_89653 ) ) ( not ( = ?auto_89655 ?auto_89652 ) ) ( not ( = ?auto_89648 ?auto_89655 ) ) ( not ( = ?auto_89649 ?auto_89655 ) ) ( not ( = ?auto_89650 ?auto_89655 ) ) ( not ( = ?auto_89651 ?auto_89655 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89655 ?auto_89654 ?auto_89653 )
      ( MAKE-6PILE ?auto_89648 ?auto_89649 ?auto_89650 ?auto_89651 ?auto_89652 ?auto_89653 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89656 - BLOCK
      ?auto_89657 - BLOCK
      ?auto_89658 - BLOCK
      ?auto_89659 - BLOCK
      ?auto_89660 - BLOCK
      ?auto_89661 - BLOCK
    )
    :vars
    (
      ?auto_89662 - BLOCK
      ?auto_89663 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89656 ) ( ON ?auto_89657 ?auto_89656 ) ( ON ?auto_89658 ?auto_89657 ) ( not ( = ?auto_89656 ?auto_89657 ) ) ( not ( = ?auto_89656 ?auto_89658 ) ) ( not ( = ?auto_89656 ?auto_89659 ) ) ( not ( = ?auto_89656 ?auto_89660 ) ) ( not ( = ?auto_89656 ?auto_89661 ) ) ( not ( = ?auto_89657 ?auto_89658 ) ) ( not ( = ?auto_89657 ?auto_89659 ) ) ( not ( = ?auto_89657 ?auto_89660 ) ) ( not ( = ?auto_89657 ?auto_89661 ) ) ( not ( = ?auto_89658 ?auto_89659 ) ) ( not ( = ?auto_89658 ?auto_89660 ) ) ( not ( = ?auto_89658 ?auto_89661 ) ) ( not ( = ?auto_89659 ?auto_89660 ) ) ( not ( = ?auto_89659 ?auto_89661 ) ) ( not ( = ?auto_89660 ?auto_89661 ) ) ( ON ?auto_89661 ?auto_89662 ) ( not ( = ?auto_89656 ?auto_89662 ) ) ( not ( = ?auto_89657 ?auto_89662 ) ) ( not ( = ?auto_89658 ?auto_89662 ) ) ( not ( = ?auto_89659 ?auto_89662 ) ) ( not ( = ?auto_89660 ?auto_89662 ) ) ( not ( = ?auto_89661 ?auto_89662 ) ) ( ON ?auto_89660 ?auto_89661 ) ( CLEAR ?auto_89660 ) ( ON-TABLE ?auto_89663 ) ( ON ?auto_89662 ?auto_89663 ) ( not ( = ?auto_89663 ?auto_89662 ) ) ( not ( = ?auto_89663 ?auto_89661 ) ) ( not ( = ?auto_89663 ?auto_89660 ) ) ( not ( = ?auto_89656 ?auto_89663 ) ) ( not ( = ?auto_89657 ?auto_89663 ) ) ( not ( = ?auto_89658 ?auto_89663 ) ) ( not ( = ?auto_89659 ?auto_89663 ) ) ( HOLDING ?auto_89659 ) ( CLEAR ?auto_89658 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89656 ?auto_89657 ?auto_89658 ?auto_89659 )
      ( MAKE-6PILE ?auto_89656 ?auto_89657 ?auto_89658 ?auto_89659 ?auto_89660 ?auto_89661 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89664 - BLOCK
      ?auto_89665 - BLOCK
      ?auto_89666 - BLOCK
      ?auto_89667 - BLOCK
      ?auto_89668 - BLOCK
      ?auto_89669 - BLOCK
    )
    :vars
    (
      ?auto_89671 - BLOCK
      ?auto_89670 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89664 ) ( ON ?auto_89665 ?auto_89664 ) ( ON ?auto_89666 ?auto_89665 ) ( not ( = ?auto_89664 ?auto_89665 ) ) ( not ( = ?auto_89664 ?auto_89666 ) ) ( not ( = ?auto_89664 ?auto_89667 ) ) ( not ( = ?auto_89664 ?auto_89668 ) ) ( not ( = ?auto_89664 ?auto_89669 ) ) ( not ( = ?auto_89665 ?auto_89666 ) ) ( not ( = ?auto_89665 ?auto_89667 ) ) ( not ( = ?auto_89665 ?auto_89668 ) ) ( not ( = ?auto_89665 ?auto_89669 ) ) ( not ( = ?auto_89666 ?auto_89667 ) ) ( not ( = ?auto_89666 ?auto_89668 ) ) ( not ( = ?auto_89666 ?auto_89669 ) ) ( not ( = ?auto_89667 ?auto_89668 ) ) ( not ( = ?auto_89667 ?auto_89669 ) ) ( not ( = ?auto_89668 ?auto_89669 ) ) ( ON ?auto_89669 ?auto_89671 ) ( not ( = ?auto_89664 ?auto_89671 ) ) ( not ( = ?auto_89665 ?auto_89671 ) ) ( not ( = ?auto_89666 ?auto_89671 ) ) ( not ( = ?auto_89667 ?auto_89671 ) ) ( not ( = ?auto_89668 ?auto_89671 ) ) ( not ( = ?auto_89669 ?auto_89671 ) ) ( ON ?auto_89668 ?auto_89669 ) ( ON-TABLE ?auto_89670 ) ( ON ?auto_89671 ?auto_89670 ) ( not ( = ?auto_89670 ?auto_89671 ) ) ( not ( = ?auto_89670 ?auto_89669 ) ) ( not ( = ?auto_89670 ?auto_89668 ) ) ( not ( = ?auto_89664 ?auto_89670 ) ) ( not ( = ?auto_89665 ?auto_89670 ) ) ( not ( = ?auto_89666 ?auto_89670 ) ) ( not ( = ?auto_89667 ?auto_89670 ) ) ( CLEAR ?auto_89666 ) ( ON ?auto_89667 ?auto_89668 ) ( CLEAR ?auto_89667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89670 ?auto_89671 ?auto_89669 ?auto_89668 )
      ( MAKE-6PILE ?auto_89664 ?auto_89665 ?auto_89666 ?auto_89667 ?auto_89668 ?auto_89669 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89672 - BLOCK
      ?auto_89673 - BLOCK
      ?auto_89674 - BLOCK
      ?auto_89675 - BLOCK
      ?auto_89676 - BLOCK
      ?auto_89677 - BLOCK
    )
    :vars
    (
      ?auto_89678 - BLOCK
      ?auto_89679 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89672 ) ( ON ?auto_89673 ?auto_89672 ) ( not ( = ?auto_89672 ?auto_89673 ) ) ( not ( = ?auto_89672 ?auto_89674 ) ) ( not ( = ?auto_89672 ?auto_89675 ) ) ( not ( = ?auto_89672 ?auto_89676 ) ) ( not ( = ?auto_89672 ?auto_89677 ) ) ( not ( = ?auto_89673 ?auto_89674 ) ) ( not ( = ?auto_89673 ?auto_89675 ) ) ( not ( = ?auto_89673 ?auto_89676 ) ) ( not ( = ?auto_89673 ?auto_89677 ) ) ( not ( = ?auto_89674 ?auto_89675 ) ) ( not ( = ?auto_89674 ?auto_89676 ) ) ( not ( = ?auto_89674 ?auto_89677 ) ) ( not ( = ?auto_89675 ?auto_89676 ) ) ( not ( = ?auto_89675 ?auto_89677 ) ) ( not ( = ?auto_89676 ?auto_89677 ) ) ( ON ?auto_89677 ?auto_89678 ) ( not ( = ?auto_89672 ?auto_89678 ) ) ( not ( = ?auto_89673 ?auto_89678 ) ) ( not ( = ?auto_89674 ?auto_89678 ) ) ( not ( = ?auto_89675 ?auto_89678 ) ) ( not ( = ?auto_89676 ?auto_89678 ) ) ( not ( = ?auto_89677 ?auto_89678 ) ) ( ON ?auto_89676 ?auto_89677 ) ( ON-TABLE ?auto_89679 ) ( ON ?auto_89678 ?auto_89679 ) ( not ( = ?auto_89679 ?auto_89678 ) ) ( not ( = ?auto_89679 ?auto_89677 ) ) ( not ( = ?auto_89679 ?auto_89676 ) ) ( not ( = ?auto_89672 ?auto_89679 ) ) ( not ( = ?auto_89673 ?auto_89679 ) ) ( not ( = ?auto_89674 ?auto_89679 ) ) ( not ( = ?auto_89675 ?auto_89679 ) ) ( ON ?auto_89675 ?auto_89676 ) ( CLEAR ?auto_89675 ) ( HOLDING ?auto_89674 ) ( CLEAR ?auto_89673 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89672 ?auto_89673 ?auto_89674 )
      ( MAKE-6PILE ?auto_89672 ?auto_89673 ?auto_89674 ?auto_89675 ?auto_89676 ?auto_89677 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89680 - BLOCK
      ?auto_89681 - BLOCK
      ?auto_89682 - BLOCK
      ?auto_89683 - BLOCK
      ?auto_89684 - BLOCK
      ?auto_89685 - BLOCK
    )
    :vars
    (
      ?auto_89687 - BLOCK
      ?auto_89686 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89680 ) ( ON ?auto_89681 ?auto_89680 ) ( not ( = ?auto_89680 ?auto_89681 ) ) ( not ( = ?auto_89680 ?auto_89682 ) ) ( not ( = ?auto_89680 ?auto_89683 ) ) ( not ( = ?auto_89680 ?auto_89684 ) ) ( not ( = ?auto_89680 ?auto_89685 ) ) ( not ( = ?auto_89681 ?auto_89682 ) ) ( not ( = ?auto_89681 ?auto_89683 ) ) ( not ( = ?auto_89681 ?auto_89684 ) ) ( not ( = ?auto_89681 ?auto_89685 ) ) ( not ( = ?auto_89682 ?auto_89683 ) ) ( not ( = ?auto_89682 ?auto_89684 ) ) ( not ( = ?auto_89682 ?auto_89685 ) ) ( not ( = ?auto_89683 ?auto_89684 ) ) ( not ( = ?auto_89683 ?auto_89685 ) ) ( not ( = ?auto_89684 ?auto_89685 ) ) ( ON ?auto_89685 ?auto_89687 ) ( not ( = ?auto_89680 ?auto_89687 ) ) ( not ( = ?auto_89681 ?auto_89687 ) ) ( not ( = ?auto_89682 ?auto_89687 ) ) ( not ( = ?auto_89683 ?auto_89687 ) ) ( not ( = ?auto_89684 ?auto_89687 ) ) ( not ( = ?auto_89685 ?auto_89687 ) ) ( ON ?auto_89684 ?auto_89685 ) ( ON-TABLE ?auto_89686 ) ( ON ?auto_89687 ?auto_89686 ) ( not ( = ?auto_89686 ?auto_89687 ) ) ( not ( = ?auto_89686 ?auto_89685 ) ) ( not ( = ?auto_89686 ?auto_89684 ) ) ( not ( = ?auto_89680 ?auto_89686 ) ) ( not ( = ?auto_89681 ?auto_89686 ) ) ( not ( = ?auto_89682 ?auto_89686 ) ) ( not ( = ?auto_89683 ?auto_89686 ) ) ( ON ?auto_89683 ?auto_89684 ) ( CLEAR ?auto_89681 ) ( ON ?auto_89682 ?auto_89683 ) ( CLEAR ?auto_89682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89686 ?auto_89687 ?auto_89685 ?auto_89684 ?auto_89683 )
      ( MAKE-6PILE ?auto_89680 ?auto_89681 ?auto_89682 ?auto_89683 ?auto_89684 ?auto_89685 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89688 - BLOCK
      ?auto_89689 - BLOCK
      ?auto_89690 - BLOCK
      ?auto_89691 - BLOCK
      ?auto_89692 - BLOCK
      ?auto_89693 - BLOCK
    )
    :vars
    (
      ?auto_89695 - BLOCK
      ?auto_89694 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89688 ) ( not ( = ?auto_89688 ?auto_89689 ) ) ( not ( = ?auto_89688 ?auto_89690 ) ) ( not ( = ?auto_89688 ?auto_89691 ) ) ( not ( = ?auto_89688 ?auto_89692 ) ) ( not ( = ?auto_89688 ?auto_89693 ) ) ( not ( = ?auto_89689 ?auto_89690 ) ) ( not ( = ?auto_89689 ?auto_89691 ) ) ( not ( = ?auto_89689 ?auto_89692 ) ) ( not ( = ?auto_89689 ?auto_89693 ) ) ( not ( = ?auto_89690 ?auto_89691 ) ) ( not ( = ?auto_89690 ?auto_89692 ) ) ( not ( = ?auto_89690 ?auto_89693 ) ) ( not ( = ?auto_89691 ?auto_89692 ) ) ( not ( = ?auto_89691 ?auto_89693 ) ) ( not ( = ?auto_89692 ?auto_89693 ) ) ( ON ?auto_89693 ?auto_89695 ) ( not ( = ?auto_89688 ?auto_89695 ) ) ( not ( = ?auto_89689 ?auto_89695 ) ) ( not ( = ?auto_89690 ?auto_89695 ) ) ( not ( = ?auto_89691 ?auto_89695 ) ) ( not ( = ?auto_89692 ?auto_89695 ) ) ( not ( = ?auto_89693 ?auto_89695 ) ) ( ON ?auto_89692 ?auto_89693 ) ( ON-TABLE ?auto_89694 ) ( ON ?auto_89695 ?auto_89694 ) ( not ( = ?auto_89694 ?auto_89695 ) ) ( not ( = ?auto_89694 ?auto_89693 ) ) ( not ( = ?auto_89694 ?auto_89692 ) ) ( not ( = ?auto_89688 ?auto_89694 ) ) ( not ( = ?auto_89689 ?auto_89694 ) ) ( not ( = ?auto_89690 ?auto_89694 ) ) ( not ( = ?auto_89691 ?auto_89694 ) ) ( ON ?auto_89691 ?auto_89692 ) ( ON ?auto_89690 ?auto_89691 ) ( CLEAR ?auto_89690 ) ( HOLDING ?auto_89689 ) ( CLEAR ?auto_89688 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89688 ?auto_89689 )
      ( MAKE-6PILE ?auto_89688 ?auto_89689 ?auto_89690 ?auto_89691 ?auto_89692 ?auto_89693 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89696 - BLOCK
      ?auto_89697 - BLOCK
      ?auto_89698 - BLOCK
      ?auto_89699 - BLOCK
      ?auto_89700 - BLOCK
      ?auto_89701 - BLOCK
    )
    :vars
    (
      ?auto_89702 - BLOCK
      ?auto_89703 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89696 ) ( not ( = ?auto_89696 ?auto_89697 ) ) ( not ( = ?auto_89696 ?auto_89698 ) ) ( not ( = ?auto_89696 ?auto_89699 ) ) ( not ( = ?auto_89696 ?auto_89700 ) ) ( not ( = ?auto_89696 ?auto_89701 ) ) ( not ( = ?auto_89697 ?auto_89698 ) ) ( not ( = ?auto_89697 ?auto_89699 ) ) ( not ( = ?auto_89697 ?auto_89700 ) ) ( not ( = ?auto_89697 ?auto_89701 ) ) ( not ( = ?auto_89698 ?auto_89699 ) ) ( not ( = ?auto_89698 ?auto_89700 ) ) ( not ( = ?auto_89698 ?auto_89701 ) ) ( not ( = ?auto_89699 ?auto_89700 ) ) ( not ( = ?auto_89699 ?auto_89701 ) ) ( not ( = ?auto_89700 ?auto_89701 ) ) ( ON ?auto_89701 ?auto_89702 ) ( not ( = ?auto_89696 ?auto_89702 ) ) ( not ( = ?auto_89697 ?auto_89702 ) ) ( not ( = ?auto_89698 ?auto_89702 ) ) ( not ( = ?auto_89699 ?auto_89702 ) ) ( not ( = ?auto_89700 ?auto_89702 ) ) ( not ( = ?auto_89701 ?auto_89702 ) ) ( ON ?auto_89700 ?auto_89701 ) ( ON-TABLE ?auto_89703 ) ( ON ?auto_89702 ?auto_89703 ) ( not ( = ?auto_89703 ?auto_89702 ) ) ( not ( = ?auto_89703 ?auto_89701 ) ) ( not ( = ?auto_89703 ?auto_89700 ) ) ( not ( = ?auto_89696 ?auto_89703 ) ) ( not ( = ?auto_89697 ?auto_89703 ) ) ( not ( = ?auto_89698 ?auto_89703 ) ) ( not ( = ?auto_89699 ?auto_89703 ) ) ( ON ?auto_89699 ?auto_89700 ) ( ON ?auto_89698 ?auto_89699 ) ( CLEAR ?auto_89696 ) ( ON ?auto_89697 ?auto_89698 ) ( CLEAR ?auto_89697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89703 ?auto_89702 ?auto_89701 ?auto_89700 ?auto_89699 ?auto_89698 )
      ( MAKE-6PILE ?auto_89696 ?auto_89697 ?auto_89698 ?auto_89699 ?auto_89700 ?auto_89701 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89704 - BLOCK
      ?auto_89705 - BLOCK
      ?auto_89706 - BLOCK
      ?auto_89707 - BLOCK
      ?auto_89708 - BLOCK
      ?auto_89709 - BLOCK
    )
    :vars
    (
      ?auto_89710 - BLOCK
      ?auto_89711 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89704 ?auto_89705 ) ) ( not ( = ?auto_89704 ?auto_89706 ) ) ( not ( = ?auto_89704 ?auto_89707 ) ) ( not ( = ?auto_89704 ?auto_89708 ) ) ( not ( = ?auto_89704 ?auto_89709 ) ) ( not ( = ?auto_89705 ?auto_89706 ) ) ( not ( = ?auto_89705 ?auto_89707 ) ) ( not ( = ?auto_89705 ?auto_89708 ) ) ( not ( = ?auto_89705 ?auto_89709 ) ) ( not ( = ?auto_89706 ?auto_89707 ) ) ( not ( = ?auto_89706 ?auto_89708 ) ) ( not ( = ?auto_89706 ?auto_89709 ) ) ( not ( = ?auto_89707 ?auto_89708 ) ) ( not ( = ?auto_89707 ?auto_89709 ) ) ( not ( = ?auto_89708 ?auto_89709 ) ) ( ON ?auto_89709 ?auto_89710 ) ( not ( = ?auto_89704 ?auto_89710 ) ) ( not ( = ?auto_89705 ?auto_89710 ) ) ( not ( = ?auto_89706 ?auto_89710 ) ) ( not ( = ?auto_89707 ?auto_89710 ) ) ( not ( = ?auto_89708 ?auto_89710 ) ) ( not ( = ?auto_89709 ?auto_89710 ) ) ( ON ?auto_89708 ?auto_89709 ) ( ON-TABLE ?auto_89711 ) ( ON ?auto_89710 ?auto_89711 ) ( not ( = ?auto_89711 ?auto_89710 ) ) ( not ( = ?auto_89711 ?auto_89709 ) ) ( not ( = ?auto_89711 ?auto_89708 ) ) ( not ( = ?auto_89704 ?auto_89711 ) ) ( not ( = ?auto_89705 ?auto_89711 ) ) ( not ( = ?auto_89706 ?auto_89711 ) ) ( not ( = ?auto_89707 ?auto_89711 ) ) ( ON ?auto_89707 ?auto_89708 ) ( ON ?auto_89706 ?auto_89707 ) ( ON ?auto_89705 ?auto_89706 ) ( CLEAR ?auto_89705 ) ( HOLDING ?auto_89704 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_89704 )
      ( MAKE-6PILE ?auto_89704 ?auto_89705 ?auto_89706 ?auto_89707 ?auto_89708 ?auto_89709 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89712 - BLOCK
      ?auto_89713 - BLOCK
      ?auto_89714 - BLOCK
      ?auto_89715 - BLOCK
      ?auto_89716 - BLOCK
      ?auto_89717 - BLOCK
    )
    :vars
    (
      ?auto_89718 - BLOCK
      ?auto_89719 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89712 ?auto_89713 ) ) ( not ( = ?auto_89712 ?auto_89714 ) ) ( not ( = ?auto_89712 ?auto_89715 ) ) ( not ( = ?auto_89712 ?auto_89716 ) ) ( not ( = ?auto_89712 ?auto_89717 ) ) ( not ( = ?auto_89713 ?auto_89714 ) ) ( not ( = ?auto_89713 ?auto_89715 ) ) ( not ( = ?auto_89713 ?auto_89716 ) ) ( not ( = ?auto_89713 ?auto_89717 ) ) ( not ( = ?auto_89714 ?auto_89715 ) ) ( not ( = ?auto_89714 ?auto_89716 ) ) ( not ( = ?auto_89714 ?auto_89717 ) ) ( not ( = ?auto_89715 ?auto_89716 ) ) ( not ( = ?auto_89715 ?auto_89717 ) ) ( not ( = ?auto_89716 ?auto_89717 ) ) ( ON ?auto_89717 ?auto_89718 ) ( not ( = ?auto_89712 ?auto_89718 ) ) ( not ( = ?auto_89713 ?auto_89718 ) ) ( not ( = ?auto_89714 ?auto_89718 ) ) ( not ( = ?auto_89715 ?auto_89718 ) ) ( not ( = ?auto_89716 ?auto_89718 ) ) ( not ( = ?auto_89717 ?auto_89718 ) ) ( ON ?auto_89716 ?auto_89717 ) ( ON-TABLE ?auto_89719 ) ( ON ?auto_89718 ?auto_89719 ) ( not ( = ?auto_89719 ?auto_89718 ) ) ( not ( = ?auto_89719 ?auto_89717 ) ) ( not ( = ?auto_89719 ?auto_89716 ) ) ( not ( = ?auto_89712 ?auto_89719 ) ) ( not ( = ?auto_89713 ?auto_89719 ) ) ( not ( = ?auto_89714 ?auto_89719 ) ) ( not ( = ?auto_89715 ?auto_89719 ) ) ( ON ?auto_89715 ?auto_89716 ) ( ON ?auto_89714 ?auto_89715 ) ( ON ?auto_89713 ?auto_89714 ) ( ON ?auto_89712 ?auto_89713 ) ( CLEAR ?auto_89712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_89719 ?auto_89718 ?auto_89717 ?auto_89716 ?auto_89715 ?auto_89714 ?auto_89713 )
      ( MAKE-6PILE ?auto_89712 ?auto_89713 ?auto_89714 ?auto_89715 ?auto_89716 ?auto_89717 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89721 - BLOCK
    )
    :vars
    (
      ?auto_89722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89722 ?auto_89721 ) ( CLEAR ?auto_89722 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_89721 ) ( not ( = ?auto_89721 ?auto_89722 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_89722 ?auto_89721 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89723 - BLOCK
    )
    :vars
    (
      ?auto_89724 - BLOCK
      ?auto_89725 - BLOCK
      ?auto_89726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89724 ?auto_89723 ) ( CLEAR ?auto_89724 ) ( ON-TABLE ?auto_89723 ) ( not ( = ?auto_89723 ?auto_89724 ) ) ( HOLDING ?auto_89725 ) ( CLEAR ?auto_89726 ) ( not ( = ?auto_89723 ?auto_89725 ) ) ( not ( = ?auto_89723 ?auto_89726 ) ) ( not ( = ?auto_89724 ?auto_89725 ) ) ( not ( = ?auto_89724 ?auto_89726 ) ) ( not ( = ?auto_89725 ?auto_89726 ) ) )
    :subtasks
    ( ( !STACK ?auto_89725 ?auto_89726 )
      ( MAKE-1PILE ?auto_89723 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89727 - BLOCK
    )
    :vars
    (
      ?auto_89728 - BLOCK
      ?auto_89729 - BLOCK
      ?auto_89730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89728 ?auto_89727 ) ( ON-TABLE ?auto_89727 ) ( not ( = ?auto_89727 ?auto_89728 ) ) ( CLEAR ?auto_89729 ) ( not ( = ?auto_89727 ?auto_89730 ) ) ( not ( = ?auto_89727 ?auto_89729 ) ) ( not ( = ?auto_89728 ?auto_89730 ) ) ( not ( = ?auto_89728 ?auto_89729 ) ) ( not ( = ?auto_89730 ?auto_89729 ) ) ( ON ?auto_89730 ?auto_89728 ) ( CLEAR ?auto_89730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89727 ?auto_89728 )
      ( MAKE-1PILE ?auto_89727 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89731 - BLOCK
    )
    :vars
    (
      ?auto_89734 - BLOCK
      ?auto_89732 - BLOCK
      ?auto_89733 - BLOCK
      ?auto_89736 - BLOCK
      ?auto_89735 - BLOCK
      ?auto_89738 - BLOCK
      ?auto_89737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89734 ?auto_89731 ) ( ON-TABLE ?auto_89731 ) ( not ( = ?auto_89731 ?auto_89734 ) ) ( not ( = ?auto_89731 ?auto_89732 ) ) ( not ( = ?auto_89731 ?auto_89733 ) ) ( not ( = ?auto_89734 ?auto_89732 ) ) ( not ( = ?auto_89734 ?auto_89733 ) ) ( not ( = ?auto_89732 ?auto_89733 ) ) ( ON ?auto_89732 ?auto_89734 ) ( CLEAR ?auto_89732 ) ( HOLDING ?auto_89733 ) ( CLEAR ?auto_89736 ) ( ON-TABLE ?auto_89735 ) ( ON ?auto_89738 ?auto_89735 ) ( ON ?auto_89737 ?auto_89738 ) ( ON ?auto_89736 ?auto_89737 ) ( not ( = ?auto_89735 ?auto_89738 ) ) ( not ( = ?auto_89735 ?auto_89737 ) ) ( not ( = ?auto_89735 ?auto_89736 ) ) ( not ( = ?auto_89735 ?auto_89733 ) ) ( not ( = ?auto_89738 ?auto_89737 ) ) ( not ( = ?auto_89738 ?auto_89736 ) ) ( not ( = ?auto_89738 ?auto_89733 ) ) ( not ( = ?auto_89737 ?auto_89736 ) ) ( not ( = ?auto_89737 ?auto_89733 ) ) ( not ( = ?auto_89736 ?auto_89733 ) ) ( not ( = ?auto_89731 ?auto_89736 ) ) ( not ( = ?auto_89731 ?auto_89735 ) ) ( not ( = ?auto_89731 ?auto_89738 ) ) ( not ( = ?auto_89731 ?auto_89737 ) ) ( not ( = ?auto_89734 ?auto_89736 ) ) ( not ( = ?auto_89734 ?auto_89735 ) ) ( not ( = ?auto_89734 ?auto_89738 ) ) ( not ( = ?auto_89734 ?auto_89737 ) ) ( not ( = ?auto_89732 ?auto_89736 ) ) ( not ( = ?auto_89732 ?auto_89735 ) ) ( not ( = ?auto_89732 ?auto_89738 ) ) ( not ( = ?auto_89732 ?auto_89737 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89735 ?auto_89738 ?auto_89737 ?auto_89736 ?auto_89733 )
      ( MAKE-1PILE ?auto_89731 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89739 - BLOCK
    )
    :vars
    (
      ?auto_89743 - BLOCK
      ?auto_89740 - BLOCK
      ?auto_89745 - BLOCK
      ?auto_89742 - BLOCK
      ?auto_89744 - BLOCK
      ?auto_89741 - BLOCK
      ?auto_89746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89743 ?auto_89739 ) ( ON-TABLE ?auto_89739 ) ( not ( = ?auto_89739 ?auto_89743 ) ) ( not ( = ?auto_89739 ?auto_89740 ) ) ( not ( = ?auto_89739 ?auto_89745 ) ) ( not ( = ?auto_89743 ?auto_89740 ) ) ( not ( = ?auto_89743 ?auto_89745 ) ) ( not ( = ?auto_89740 ?auto_89745 ) ) ( ON ?auto_89740 ?auto_89743 ) ( CLEAR ?auto_89742 ) ( ON-TABLE ?auto_89744 ) ( ON ?auto_89741 ?auto_89744 ) ( ON ?auto_89746 ?auto_89741 ) ( ON ?auto_89742 ?auto_89746 ) ( not ( = ?auto_89744 ?auto_89741 ) ) ( not ( = ?auto_89744 ?auto_89746 ) ) ( not ( = ?auto_89744 ?auto_89742 ) ) ( not ( = ?auto_89744 ?auto_89745 ) ) ( not ( = ?auto_89741 ?auto_89746 ) ) ( not ( = ?auto_89741 ?auto_89742 ) ) ( not ( = ?auto_89741 ?auto_89745 ) ) ( not ( = ?auto_89746 ?auto_89742 ) ) ( not ( = ?auto_89746 ?auto_89745 ) ) ( not ( = ?auto_89742 ?auto_89745 ) ) ( not ( = ?auto_89739 ?auto_89742 ) ) ( not ( = ?auto_89739 ?auto_89744 ) ) ( not ( = ?auto_89739 ?auto_89741 ) ) ( not ( = ?auto_89739 ?auto_89746 ) ) ( not ( = ?auto_89743 ?auto_89742 ) ) ( not ( = ?auto_89743 ?auto_89744 ) ) ( not ( = ?auto_89743 ?auto_89741 ) ) ( not ( = ?auto_89743 ?auto_89746 ) ) ( not ( = ?auto_89740 ?auto_89742 ) ) ( not ( = ?auto_89740 ?auto_89744 ) ) ( not ( = ?auto_89740 ?auto_89741 ) ) ( not ( = ?auto_89740 ?auto_89746 ) ) ( ON ?auto_89745 ?auto_89740 ) ( CLEAR ?auto_89745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89739 ?auto_89743 ?auto_89740 )
      ( MAKE-1PILE ?auto_89739 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89747 - BLOCK
    )
    :vars
    (
      ?auto_89750 - BLOCK
      ?auto_89753 - BLOCK
      ?auto_89752 - BLOCK
      ?auto_89751 - BLOCK
      ?auto_89754 - BLOCK
      ?auto_89748 - BLOCK
      ?auto_89749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89750 ?auto_89747 ) ( ON-TABLE ?auto_89747 ) ( not ( = ?auto_89747 ?auto_89750 ) ) ( not ( = ?auto_89747 ?auto_89753 ) ) ( not ( = ?auto_89747 ?auto_89752 ) ) ( not ( = ?auto_89750 ?auto_89753 ) ) ( not ( = ?auto_89750 ?auto_89752 ) ) ( not ( = ?auto_89753 ?auto_89752 ) ) ( ON ?auto_89753 ?auto_89750 ) ( ON-TABLE ?auto_89751 ) ( ON ?auto_89754 ?auto_89751 ) ( ON ?auto_89748 ?auto_89754 ) ( not ( = ?auto_89751 ?auto_89754 ) ) ( not ( = ?auto_89751 ?auto_89748 ) ) ( not ( = ?auto_89751 ?auto_89749 ) ) ( not ( = ?auto_89751 ?auto_89752 ) ) ( not ( = ?auto_89754 ?auto_89748 ) ) ( not ( = ?auto_89754 ?auto_89749 ) ) ( not ( = ?auto_89754 ?auto_89752 ) ) ( not ( = ?auto_89748 ?auto_89749 ) ) ( not ( = ?auto_89748 ?auto_89752 ) ) ( not ( = ?auto_89749 ?auto_89752 ) ) ( not ( = ?auto_89747 ?auto_89749 ) ) ( not ( = ?auto_89747 ?auto_89751 ) ) ( not ( = ?auto_89747 ?auto_89754 ) ) ( not ( = ?auto_89747 ?auto_89748 ) ) ( not ( = ?auto_89750 ?auto_89749 ) ) ( not ( = ?auto_89750 ?auto_89751 ) ) ( not ( = ?auto_89750 ?auto_89754 ) ) ( not ( = ?auto_89750 ?auto_89748 ) ) ( not ( = ?auto_89753 ?auto_89749 ) ) ( not ( = ?auto_89753 ?auto_89751 ) ) ( not ( = ?auto_89753 ?auto_89754 ) ) ( not ( = ?auto_89753 ?auto_89748 ) ) ( ON ?auto_89752 ?auto_89753 ) ( CLEAR ?auto_89752 ) ( HOLDING ?auto_89749 ) ( CLEAR ?auto_89748 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89751 ?auto_89754 ?auto_89748 ?auto_89749 )
      ( MAKE-1PILE ?auto_89747 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89755 - BLOCK
    )
    :vars
    (
      ?auto_89757 - BLOCK
      ?auto_89758 - BLOCK
      ?auto_89761 - BLOCK
      ?auto_89756 - BLOCK
      ?auto_89762 - BLOCK
      ?auto_89760 - BLOCK
      ?auto_89759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89757 ?auto_89755 ) ( ON-TABLE ?auto_89755 ) ( not ( = ?auto_89755 ?auto_89757 ) ) ( not ( = ?auto_89755 ?auto_89758 ) ) ( not ( = ?auto_89755 ?auto_89761 ) ) ( not ( = ?auto_89757 ?auto_89758 ) ) ( not ( = ?auto_89757 ?auto_89761 ) ) ( not ( = ?auto_89758 ?auto_89761 ) ) ( ON ?auto_89758 ?auto_89757 ) ( ON-TABLE ?auto_89756 ) ( ON ?auto_89762 ?auto_89756 ) ( ON ?auto_89760 ?auto_89762 ) ( not ( = ?auto_89756 ?auto_89762 ) ) ( not ( = ?auto_89756 ?auto_89760 ) ) ( not ( = ?auto_89756 ?auto_89759 ) ) ( not ( = ?auto_89756 ?auto_89761 ) ) ( not ( = ?auto_89762 ?auto_89760 ) ) ( not ( = ?auto_89762 ?auto_89759 ) ) ( not ( = ?auto_89762 ?auto_89761 ) ) ( not ( = ?auto_89760 ?auto_89759 ) ) ( not ( = ?auto_89760 ?auto_89761 ) ) ( not ( = ?auto_89759 ?auto_89761 ) ) ( not ( = ?auto_89755 ?auto_89759 ) ) ( not ( = ?auto_89755 ?auto_89756 ) ) ( not ( = ?auto_89755 ?auto_89762 ) ) ( not ( = ?auto_89755 ?auto_89760 ) ) ( not ( = ?auto_89757 ?auto_89759 ) ) ( not ( = ?auto_89757 ?auto_89756 ) ) ( not ( = ?auto_89757 ?auto_89762 ) ) ( not ( = ?auto_89757 ?auto_89760 ) ) ( not ( = ?auto_89758 ?auto_89759 ) ) ( not ( = ?auto_89758 ?auto_89756 ) ) ( not ( = ?auto_89758 ?auto_89762 ) ) ( not ( = ?auto_89758 ?auto_89760 ) ) ( ON ?auto_89761 ?auto_89758 ) ( CLEAR ?auto_89760 ) ( ON ?auto_89759 ?auto_89761 ) ( CLEAR ?auto_89759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89755 ?auto_89757 ?auto_89758 ?auto_89761 )
      ( MAKE-1PILE ?auto_89755 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89763 - BLOCK
    )
    :vars
    (
      ?auto_89768 - BLOCK
      ?auto_89767 - BLOCK
      ?auto_89769 - BLOCK
      ?auto_89765 - BLOCK
      ?auto_89770 - BLOCK
      ?auto_89764 - BLOCK
      ?auto_89766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89768 ?auto_89763 ) ( ON-TABLE ?auto_89763 ) ( not ( = ?auto_89763 ?auto_89768 ) ) ( not ( = ?auto_89763 ?auto_89767 ) ) ( not ( = ?auto_89763 ?auto_89769 ) ) ( not ( = ?auto_89768 ?auto_89767 ) ) ( not ( = ?auto_89768 ?auto_89769 ) ) ( not ( = ?auto_89767 ?auto_89769 ) ) ( ON ?auto_89767 ?auto_89768 ) ( ON-TABLE ?auto_89765 ) ( ON ?auto_89770 ?auto_89765 ) ( not ( = ?auto_89765 ?auto_89770 ) ) ( not ( = ?auto_89765 ?auto_89764 ) ) ( not ( = ?auto_89765 ?auto_89766 ) ) ( not ( = ?auto_89765 ?auto_89769 ) ) ( not ( = ?auto_89770 ?auto_89764 ) ) ( not ( = ?auto_89770 ?auto_89766 ) ) ( not ( = ?auto_89770 ?auto_89769 ) ) ( not ( = ?auto_89764 ?auto_89766 ) ) ( not ( = ?auto_89764 ?auto_89769 ) ) ( not ( = ?auto_89766 ?auto_89769 ) ) ( not ( = ?auto_89763 ?auto_89766 ) ) ( not ( = ?auto_89763 ?auto_89765 ) ) ( not ( = ?auto_89763 ?auto_89770 ) ) ( not ( = ?auto_89763 ?auto_89764 ) ) ( not ( = ?auto_89768 ?auto_89766 ) ) ( not ( = ?auto_89768 ?auto_89765 ) ) ( not ( = ?auto_89768 ?auto_89770 ) ) ( not ( = ?auto_89768 ?auto_89764 ) ) ( not ( = ?auto_89767 ?auto_89766 ) ) ( not ( = ?auto_89767 ?auto_89765 ) ) ( not ( = ?auto_89767 ?auto_89770 ) ) ( not ( = ?auto_89767 ?auto_89764 ) ) ( ON ?auto_89769 ?auto_89767 ) ( ON ?auto_89766 ?auto_89769 ) ( CLEAR ?auto_89766 ) ( HOLDING ?auto_89764 ) ( CLEAR ?auto_89770 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89765 ?auto_89770 ?auto_89764 )
      ( MAKE-1PILE ?auto_89763 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89771 - BLOCK
    )
    :vars
    (
      ?auto_89775 - BLOCK
      ?auto_89774 - BLOCK
      ?auto_89776 - BLOCK
      ?auto_89772 - BLOCK
      ?auto_89773 - BLOCK
      ?auto_89777 - BLOCK
      ?auto_89778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89775 ?auto_89771 ) ( ON-TABLE ?auto_89771 ) ( not ( = ?auto_89771 ?auto_89775 ) ) ( not ( = ?auto_89771 ?auto_89774 ) ) ( not ( = ?auto_89771 ?auto_89776 ) ) ( not ( = ?auto_89775 ?auto_89774 ) ) ( not ( = ?auto_89775 ?auto_89776 ) ) ( not ( = ?auto_89774 ?auto_89776 ) ) ( ON ?auto_89774 ?auto_89775 ) ( ON-TABLE ?auto_89772 ) ( ON ?auto_89773 ?auto_89772 ) ( not ( = ?auto_89772 ?auto_89773 ) ) ( not ( = ?auto_89772 ?auto_89777 ) ) ( not ( = ?auto_89772 ?auto_89778 ) ) ( not ( = ?auto_89772 ?auto_89776 ) ) ( not ( = ?auto_89773 ?auto_89777 ) ) ( not ( = ?auto_89773 ?auto_89778 ) ) ( not ( = ?auto_89773 ?auto_89776 ) ) ( not ( = ?auto_89777 ?auto_89778 ) ) ( not ( = ?auto_89777 ?auto_89776 ) ) ( not ( = ?auto_89778 ?auto_89776 ) ) ( not ( = ?auto_89771 ?auto_89778 ) ) ( not ( = ?auto_89771 ?auto_89772 ) ) ( not ( = ?auto_89771 ?auto_89773 ) ) ( not ( = ?auto_89771 ?auto_89777 ) ) ( not ( = ?auto_89775 ?auto_89778 ) ) ( not ( = ?auto_89775 ?auto_89772 ) ) ( not ( = ?auto_89775 ?auto_89773 ) ) ( not ( = ?auto_89775 ?auto_89777 ) ) ( not ( = ?auto_89774 ?auto_89778 ) ) ( not ( = ?auto_89774 ?auto_89772 ) ) ( not ( = ?auto_89774 ?auto_89773 ) ) ( not ( = ?auto_89774 ?auto_89777 ) ) ( ON ?auto_89776 ?auto_89774 ) ( ON ?auto_89778 ?auto_89776 ) ( CLEAR ?auto_89773 ) ( ON ?auto_89777 ?auto_89778 ) ( CLEAR ?auto_89777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89771 ?auto_89775 ?auto_89774 ?auto_89776 ?auto_89778 )
      ( MAKE-1PILE ?auto_89771 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89779 - BLOCK
    )
    :vars
    (
      ?auto_89782 - BLOCK
      ?auto_89784 - BLOCK
      ?auto_89786 - BLOCK
      ?auto_89780 - BLOCK
      ?auto_89783 - BLOCK
      ?auto_89781 - BLOCK
      ?auto_89785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89782 ?auto_89779 ) ( ON-TABLE ?auto_89779 ) ( not ( = ?auto_89779 ?auto_89782 ) ) ( not ( = ?auto_89779 ?auto_89784 ) ) ( not ( = ?auto_89779 ?auto_89786 ) ) ( not ( = ?auto_89782 ?auto_89784 ) ) ( not ( = ?auto_89782 ?auto_89786 ) ) ( not ( = ?auto_89784 ?auto_89786 ) ) ( ON ?auto_89784 ?auto_89782 ) ( ON-TABLE ?auto_89780 ) ( not ( = ?auto_89780 ?auto_89783 ) ) ( not ( = ?auto_89780 ?auto_89781 ) ) ( not ( = ?auto_89780 ?auto_89785 ) ) ( not ( = ?auto_89780 ?auto_89786 ) ) ( not ( = ?auto_89783 ?auto_89781 ) ) ( not ( = ?auto_89783 ?auto_89785 ) ) ( not ( = ?auto_89783 ?auto_89786 ) ) ( not ( = ?auto_89781 ?auto_89785 ) ) ( not ( = ?auto_89781 ?auto_89786 ) ) ( not ( = ?auto_89785 ?auto_89786 ) ) ( not ( = ?auto_89779 ?auto_89785 ) ) ( not ( = ?auto_89779 ?auto_89780 ) ) ( not ( = ?auto_89779 ?auto_89783 ) ) ( not ( = ?auto_89779 ?auto_89781 ) ) ( not ( = ?auto_89782 ?auto_89785 ) ) ( not ( = ?auto_89782 ?auto_89780 ) ) ( not ( = ?auto_89782 ?auto_89783 ) ) ( not ( = ?auto_89782 ?auto_89781 ) ) ( not ( = ?auto_89784 ?auto_89785 ) ) ( not ( = ?auto_89784 ?auto_89780 ) ) ( not ( = ?auto_89784 ?auto_89783 ) ) ( not ( = ?auto_89784 ?auto_89781 ) ) ( ON ?auto_89786 ?auto_89784 ) ( ON ?auto_89785 ?auto_89786 ) ( ON ?auto_89781 ?auto_89785 ) ( CLEAR ?auto_89781 ) ( HOLDING ?auto_89783 ) ( CLEAR ?auto_89780 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89780 ?auto_89783 )
      ( MAKE-1PILE ?auto_89779 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_91193 - BLOCK
    )
    :vars
    (
      ?auto_91194 - BLOCK
      ?auto_91197 - BLOCK
      ?auto_91199 - BLOCK
      ?auto_91195 - BLOCK
      ?auto_91198 - BLOCK
      ?auto_91196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91194 ?auto_91193 ) ( ON-TABLE ?auto_91193 ) ( not ( = ?auto_91193 ?auto_91194 ) ) ( not ( = ?auto_91193 ?auto_91197 ) ) ( not ( = ?auto_91193 ?auto_91199 ) ) ( not ( = ?auto_91194 ?auto_91197 ) ) ( not ( = ?auto_91194 ?auto_91199 ) ) ( not ( = ?auto_91197 ?auto_91199 ) ) ( ON ?auto_91197 ?auto_91194 ) ( not ( = ?auto_91195 ?auto_91198 ) ) ( not ( = ?auto_91195 ?auto_91196 ) ) ( not ( = ?auto_91195 ?auto_91199 ) ) ( not ( = ?auto_91198 ?auto_91196 ) ) ( not ( = ?auto_91198 ?auto_91199 ) ) ( not ( = ?auto_91196 ?auto_91199 ) ) ( not ( = ?auto_91193 ?auto_91196 ) ) ( not ( = ?auto_91193 ?auto_91195 ) ) ( not ( = ?auto_91193 ?auto_91198 ) ) ( not ( = ?auto_91194 ?auto_91196 ) ) ( not ( = ?auto_91194 ?auto_91195 ) ) ( not ( = ?auto_91194 ?auto_91198 ) ) ( not ( = ?auto_91197 ?auto_91196 ) ) ( not ( = ?auto_91197 ?auto_91195 ) ) ( not ( = ?auto_91197 ?auto_91198 ) ) ( ON ?auto_91199 ?auto_91197 ) ( ON ?auto_91196 ?auto_91199 ) ( ON ?auto_91198 ?auto_91196 ) ( ON ?auto_91195 ?auto_91198 ) ( CLEAR ?auto_91195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91193 ?auto_91194 ?auto_91197 ?auto_91199 ?auto_91196 ?auto_91198 )
      ( MAKE-1PILE ?auto_91193 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89795 - BLOCK
    )
    :vars
    (
      ?auto_89796 - BLOCK
      ?auto_89801 - BLOCK
      ?auto_89800 - BLOCK
      ?auto_89797 - BLOCK
      ?auto_89798 - BLOCK
      ?auto_89802 - BLOCK
      ?auto_89799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89796 ?auto_89795 ) ( ON-TABLE ?auto_89795 ) ( not ( = ?auto_89795 ?auto_89796 ) ) ( not ( = ?auto_89795 ?auto_89801 ) ) ( not ( = ?auto_89795 ?auto_89800 ) ) ( not ( = ?auto_89796 ?auto_89801 ) ) ( not ( = ?auto_89796 ?auto_89800 ) ) ( not ( = ?auto_89801 ?auto_89800 ) ) ( ON ?auto_89801 ?auto_89796 ) ( not ( = ?auto_89797 ?auto_89798 ) ) ( not ( = ?auto_89797 ?auto_89802 ) ) ( not ( = ?auto_89797 ?auto_89799 ) ) ( not ( = ?auto_89797 ?auto_89800 ) ) ( not ( = ?auto_89798 ?auto_89802 ) ) ( not ( = ?auto_89798 ?auto_89799 ) ) ( not ( = ?auto_89798 ?auto_89800 ) ) ( not ( = ?auto_89802 ?auto_89799 ) ) ( not ( = ?auto_89802 ?auto_89800 ) ) ( not ( = ?auto_89799 ?auto_89800 ) ) ( not ( = ?auto_89795 ?auto_89799 ) ) ( not ( = ?auto_89795 ?auto_89797 ) ) ( not ( = ?auto_89795 ?auto_89798 ) ) ( not ( = ?auto_89795 ?auto_89802 ) ) ( not ( = ?auto_89796 ?auto_89799 ) ) ( not ( = ?auto_89796 ?auto_89797 ) ) ( not ( = ?auto_89796 ?auto_89798 ) ) ( not ( = ?auto_89796 ?auto_89802 ) ) ( not ( = ?auto_89801 ?auto_89799 ) ) ( not ( = ?auto_89801 ?auto_89797 ) ) ( not ( = ?auto_89801 ?auto_89798 ) ) ( not ( = ?auto_89801 ?auto_89802 ) ) ( ON ?auto_89800 ?auto_89801 ) ( ON ?auto_89799 ?auto_89800 ) ( ON ?auto_89802 ?auto_89799 ) ( ON ?auto_89798 ?auto_89802 ) ( CLEAR ?auto_89798 ) ( HOLDING ?auto_89797 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_89797 )
      ( MAKE-1PILE ?auto_89795 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89803 - BLOCK
    )
    :vars
    (
      ?auto_89809 - BLOCK
      ?auto_89804 - BLOCK
      ?auto_89807 - BLOCK
      ?auto_89808 - BLOCK
      ?auto_89805 - BLOCK
      ?auto_89810 - BLOCK
      ?auto_89806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89809 ?auto_89803 ) ( ON-TABLE ?auto_89803 ) ( not ( = ?auto_89803 ?auto_89809 ) ) ( not ( = ?auto_89803 ?auto_89804 ) ) ( not ( = ?auto_89803 ?auto_89807 ) ) ( not ( = ?auto_89809 ?auto_89804 ) ) ( not ( = ?auto_89809 ?auto_89807 ) ) ( not ( = ?auto_89804 ?auto_89807 ) ) ( ON ?auto_89804 ?auto_89809 ) ( not ( = ?auto_89808 ?auto_89805 ) ) ( not ( = ?auto_89808 ?auto_89810 ) ) ( not ( = ?auto_89808 ?auto_89806 ) ) ( not ( = ?auto_89808 ?auto_89807 ) ) ( not ( = ?auto_89805 ?auto_89810 ) ) ( not ( = ?auto_89805 ?auto_89806 ) ) ( not ( = ?auto_89805 ?auto_89807 ) ) ( not ( = ?auto_89810 ?auto_89806 ) ) ( not ( = ?auto_89810 ?auto_89807 ) ) ( not ( = ?auto_89806 ?auto_89807 ) ) ( not ( = ?auto_89803 ?auto_89806 ) ) ( not ( = ?auto_89803 ?auto_89808 ) ) ( not ( = ?auto_89803 ?auto_89805 ) ) ( not ( = ?auto_89803 ?auto_89810 ) ) ( not ( = ?auto_89809 ?auto_89806 ) ) ( not ( = ?auto_89809 ?auto_89808 ) ) ( not ( = ?auto_89809 ?auto_89805 ) ) ( not ( = ?auto_89809 ?auto_89810 ) ) ( not ( = ?auto_89804 ?auto_89806 ) ) ( not ( = ?auto_89804 ?auto_89808 ) ) ( not ( = ?auto_89804 ?auto_89805 ) ) ( not ( = ?auto_89804 ?auto_89810 ) ) ( ON ?auto_89807 ?auto_89804 ) ( ON ?auto_89806 ?auto_89807 ) ( ON ?auto_89810 ?auto_89806 ) ( ON ?auto_89805 ?auto_89810 ) ( ON ?auto_89808 ?auto_89805 ) ( CLEAR ?auto_89808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_89803 ?auto_89809 ?auto_89804 ?auto_89807 ?auto_89806 ?auto_89810 ?auto_89805 )
      ( MAKE-1PILE ?auto_89803 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89818 - BLOCK
      ?auto_89819 - BLOCK
      ?auto_89820 - BLOCK
      ?auto_89821 - BLOCK
      ?auto_89822 - BLOCK
      ?auto_89823 - BLOCK
      ?auto_89824 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_89824 ) ( CLEAR ?auto_89823 ) ( ON-TABLE ?auto_89818 ) ( ON ?auto_89819 ?auto_89818 ) ( ON ?auto_89820 ?auto_89819 ) ( ON ?auto_89821 ?auto_89820 ) ( ON ?auto_89822 ?auto_89821 ) ( ON ?auto_89823 ?auto_89822 ) ( not ( = ?auto_89818 ?auto_89819 ) ) ( not ( = ?auto_89818 ?auto_89820 ) ) ( not ( = ?auto_89818 ?auto_89821 ) ) ( not ( = ?auto_89818 ?auto_89822 ) ) ( not ( = ?auto_89818 ?auto_89823 ) ) ( not ( = ?auto_89818 ?auto_89824 ) ) ( not ( = ?auto_89819 ?auto_89820 ) ) ( not ( = ?auto_89819 ?auto_89821 ) ) ( not ( = ?auto_89819 ?auto_89822 ) ) ( not ( = ?auto_89819 ?auto_89823 ) ) ( not ( = ?auto_89819 ?auto_89824 ) ) ( not ( = ?auto_89820 ?auto_89821 ) ) ( not ( = ?auto_89820 ?auto_89822 ) ) ( not ( = ?auto_89820 ?auto_89823 ) ) ( not ( = ?auto_89820 ?auto_89824 ) ) ( not ( = ?auto_89821 ?auto_89822 ) ) ( not ( = ?auto_89821 ?auto_89823 ) ) ( not ( = ?auto_89821 ?auto_89824 ) ) ( not ( = ?auto_89822 ?auto_89823 ) ) ( not ( = ?auto_89822 ?auto_89824 ) ) ( not ( = ?auto_89823 ?auto_89824 ) ) )
    :subtasks
    ( ( !STACK ?auto_89824 ?auto_89823 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89825 - BLOCK
      ?auto_89826 - BLOCK
      ?auto_89827 - BLOCK
      ?auto_89828 - BLOCK
      ?auto_89829 - BLOCK
      ?auto_89830 - BLOCK
      ?auto_89831 - BLOCK
    )
    :vars
    (
      ?auto_89832 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_89830 ) ( ON-TABLE ?auto_89825 ) ( ON ?auto_89826 ?auto_89825 ) ( ON ?auto_89827 ?auto_89826 ) ( ON ?auto_89828 ?auto_89827 ) ( ON ?auto_89829 ?auto_89828 ) ( ON ?auto_89830 ?auto_89829 ) ( not ( = ?auto_89825 ?auto_89826 ) ) ( not ( = ?auto_89825 ?auto_89827 ) ) ( not ( = ?auto_89825 ?auto_89828 ) ) ( not ( = ?auto_89825 ?auto_89829 ) ) ( not ( = ?auto_89825 ?auto_89830 ) ) ( not ( = ?auto_89825 ?auto_89831 ) ) ( not ( = ?auto_89826 ?auto_89827 ) ) ( not ( = ?auto_89826 ?auto_89828 ) ) ( not ( = ?auto_89826 ?auto_89829 ) ) ( not ( = ?auto_89826 ?auto_89830 ) ) ( not ( = ?auto_89826 ?auto_89831 ) ) ( not ( = ?auto_89827 ?auto_89828 ) ) ( not ( = ?auto_89827 ?auto_89829 ) ) ( not ( = ?auto_89827 ?auto_89830 ) ) ( not ( = ?auto_89827 ?auto_89831 ) ) ( not ( = ?auto_89828 ?auto_89829 ) ) ( not ( = ?auto_89828 ?auto_89830 ) ) ( not ( = ?auto_89828 ?auto_89831 ) ) ( not ( = ?auto_89829 ?auto_89830 ) ) ( not ( = ?auto_89829 ?auto_89831 ) ) ( not ( = ?auto_89830 ?auto_89831 ) ) ( ON ?auto_89831 ?auto_89832 ) ( CLEAR ?auto_89831 ) ( HAND-EMPTY ) ( not ( = ?auto_89825 ?auto_89832 ) ) ( not ( = ?auto_89826 ?auto_89832 ) ) ( not ( = ?auto_89827 ?auto_89832 ) ) ( not ( = ?auto_89828 ?auto_89832 ) ) ( not ( = ?auto_89829 ?auto_89832 ) ) ( not ( = ?auto_89830 ?auto_89832 ) ) ( not ( = ?auto_89831 ?auto_89832 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_89831 ?auto_89832 )
      ( MAKE-7PILE ?auto_89825 ?auto_89826 ?auto_89827 ?auto_89828 ?auto_89829 ?auto_89830 ?auto_89831 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89833 - BLOCK
      ?auto_89834 - BLOCK
      ?auto_89835 - BLOCK
      ?auto_89836 - BLOCK
      ?auto_89837 - BLOCK
      ?auto_89838 - BLOCK
      ?auto_89839 - BLOCK
    )
    :vars
    (
      ?auto_89840 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89833 ) ( ON ?auto_89834 ?auto_89833 ) ( ON ?auto_89835 ?auto_89834 ) ( ON ?auto_89836 ?auto_89835 ) ( ON ?auto_89837 ?auto_89836 ) ( not ( = ?auto_89833 ?auto_89834 ) ) ( not ( = ?auto_89833 ?auto_89835 ) ) ( not ( = ?auto_89833 ?auto_89836 ) ) ( not ( = ?auto_89833 ?auto_89837 ) ) ( not ( = ?auto_89833 ?auto_89838 ) ) ( not ( = ?auto_89833 ?auto_89839 ) ) ( not ( = ?auto_89834 ?auto_89835 ) ) ( not ( = ?auto_89834 ?auto_89836 ) ) ( not ( = ?auto_89834 ?auto_89837 ) ) ( not ( = ?auto_89834 ?auto_89838 ) ) ( not ( = ?auto_89834 ?auto_89839 ) ) ( not ( = ?auto_89835 ?auto_89836 ) ) ( not ( = ?auto_89835 ?auto_89837 ) ) ( not ( = ?auto_89835 ?auto_89838 ) ) ( not ( = ?auto_89835 ?auto_89839 ) ) ( not ( = ?auto_89836 ?auto_89837 ) ) ( not ( = ?auto_89836 ?auto_89838 ) ) ( not ( = ?auto_89836 ?auto_89839 ) ) ( not ( = ?auto_89837 ?auto_89838 ) ) ( not ( = ?auto_89837 ?auto_89839 ) ) ( not ( = ?auto_89838 ?auto_89839 ) ) ( ON ?auto_89839 ?auto_89840 ) ( CLEAR ?auto_89839 ) ( not ( = ?auto_89833 ?auto_89840 ) ) ( not ( = ?auto_89834 ?auto_89840 ) ) ( not ( = ?auto_89835 ?auto_89840 ) ) ( not ( = ?auto_89836 ?auto_89840 ) ) ( not ( = ?auto_89837 ?auto_89840 ) ) ( not ( = ?auto_89838 ?auto_89840 ) ) ( not ( = ?auto_89839 ?auto_89840 ) ) ( HOLDING ?auto_89838 ) ( CLEAR ?auto_89837 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89833 ?auto_89834 ?auto_89835 ?auto_89836 ?auto_89837 ?auto_89838 )
      ( MAKE-7PILE ?auto_89833 ?auto_89834 ?auto_89835 ?auto_89836 ?auto_89837 ?auto_89838 ?auto_89839 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89841 - BLOCK
      ?auto_89842 - BLOCK
      ?auto_89843 - BLOCK
      ?auto_89844 - BLOCK
      ?auto_89845 - BLOCK
      ?auto_89846 - BLOCK
      ?auto_89847 - BLOCK
    )
    :vars
    (
      ?auto_89848 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89841 ) ( ON ?auto_89842 ?auto_89841 ) ( ON ?auto_89843 ?auto_89842 ) ( ON ?auto_89844 ?auto_89843 ) ( ON ?auto_89845 ?auto_89844 ) ( not ( = ?auto_89841 ?auto_89842 ) ) ( not ( = ?auto_89841 ?auto_89843 ) ) ( not ( = ?auto_89841 ?auto_89844 ) ) ( not ( = ?auto_89841 ?auto_89845 ) ) ( not ( = ?auto_89841 ?auto_89846 ) ) ( not ( = ?auto_89841 ?auto_89847 ) ) ( not ( = ?auto_89842 ?auto_89843 ) ) ( not ( = ?auto_89842 ?auto_89844 ) ) ( not ( = ?auto_89842 ?auto_89845 ) ) ( not ( = ?auto_89842 ?auto_89846 ) ) ( not ( = ?auto_89842 ?auto_89847 ) ) ( not ( = ?auto_89843 ?auto_89844 ) ) ( not ( = ?auto_89843 ?auto_89845 ) ) ( not ( = ?auto_89843 ?auto_89846 ) ) ( not ( = ?auto_89843 ?auto_89847 ) ) ( not ( = ?auto_89844 ?auto_89845 ) ) ( not ( = ?auto_89844 ?auto_89846 ) ) ( not ( = ?auto_89844 ?auto_89847 ) ) ( not ( = ?auto_89845 ?auto_89846 ) ) ( not ( = ?auto_89845 ?auto_89847 ) ) ( not ( = ?auto_89846 ?auto_89847 ) ) ( ON ?auto_89847 ?auto_89848 ) ( not ( = ?auto_89841 ?auto_89848 ) ) ( not ( = ?auto_89842 ?auto_89848 ) ) ( not ( = ?auto_89843 ?auto_89848 ) ) ( not ( = ?auto_89844 ?auto_89848 ) ) ( not ( = ?auto_89845 ?auto_89848 ) ) ( not ( = ?auto_89846 ?auto_89848 ) ) ( not ( = ?auto_89847 ?auto_89848 ) ) ( CLEAR ?auto_89845 ) ( ON ?auto_89846 ?auto_89847 ) ( CLEAR ?auto_89846 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_89848 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89848 ?auto_89847 )
      ( MAKE-7PILE ?auto_89841 ?auto_89842 ?auto_89843 ?auto_89844 ?auto_89845 ?auto_89846 ?auto_89847 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89849 - BLOCK
      ?auto_89850 - BLOCK
      ?auto_89851 - BLOCK
      ?auto_89852 - BLOCK
      ?auto_89853 - BLOCK
      ?auto_89854 - BLOCK
      ?auto_89855 - BLOCK
    )
    :vars
    (
      ?auto_89856 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89849 ) ( ON ?auto_89850 ?auto_89849 ) ( ON ?auto_89851 ?auto_89850 ) ( ON ?auto_89852 ?auto_89851 ) ( not ( = ?auto_89849 ?auto_89850 ) ) ( not ( = ?auto_89849 ?auto_89851 ) ) ( not ( = ?auto_89849 ?auto_89852 ) ) ( not ( = ?auto_89849 ?auto_89853 ) ) ( not ( = ?auto_89849 ?auto_89854 ) ) ( not ( = ?auto_89849 ?auto_89855 ) ) ( not ( = ?auto_89850 ?auto_89851 ) ) ( not ( = ?auto_89850 ?auto_89852 ) ) ( not ( = ?auto_89850 ?auto_89853 ) ) ( not ( = ?auto_89850 ?auto_89854 ) ) ( not ( = ?auto_89850 ?auto_89855 ) ) ( not ( = ?auto_89851 ?auto_89852 ) ) ( not ( = ?auto_89851 ?auto_89853 ) ) ( not ( = ?auto_89851 ?auto_89854 ) ) ( not ( = ?auto_89851 ?auto_89855 ) ) ( not ( = ?auto_89852 ?auto_89853 ) ) ( not ( = ?auto_89852 ?auto_89854 ) ) ( not ( = ?auto_89852 ?auto_89855 ) ) ( not ( = ?auto_89853 ?auto_89854 ) ) ( not ( = ?auto_89853 ?auto_89855 ) ) ( not ( = ?auto_89854 ?auto_89855 ) ) ( ON ?auto_89855 ?auto_89856 ) ( not ( = ?auto_89849 ?auto_89856 ) ) ( not ( = ?auto_89850 ?auto_89856 ) ) ( not ( = ?auto_89851 ?auto_89856 ) ) ( not ( = ?auto_89852 ?auto_89856 ) ) ( not ( = ?auto_89853 ?auto_89856 ) ) ( not ( = ?auto_89854 ?auto_89856 ) ) ( not ( = ?auto_89855 ?auto_89856 ) ) ( ON ?auto_89854 ?auto_89855 ) ( CLEAR ?auto_89854 ) ( ON-TABLE ?auto_89856 ) ( HOLDING ?auto_89853 ) ( CLEAR ?auto_89852 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89849 ?auto_89850 ?auto_89851 ?auto_89852 ?auto_89853 )
      ( MAKE-7PILE ?auto_89849 ?auto_89850 ?auto_89851 ?auto_89852 ?auto_89853 ?auto_89854 ?auto_89855 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89857 - BLOCK
      ?auto_89858 - BLOCK
      ?auto_89859 - BLOCK
      ?auto_89860 - BLOCK
      ?auto_89861 - BLOCK
      ?auto_89862 - BLOCK
      ?auto_89863 - BLOCK
    )
    :vars
    (
      ?auto_89864 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89857 ) ( ON ?auto_89858 ?auto_89857 ) ( ON ?auto_89859 ?auto_89858 ) ( ON ?auto_89860 ?auto_89859 ) ( not ( = ?auto_89857 ?auto_89858 ) ) ( not ( = ?auto_89857 ?auto_89859 ) ) ( not ( = ?auto_89857 ?auto_89860 ) ) ( not ( = ?auto_89857 ?auto_89861 ) ) ( not ( = ?auto_89857 ?auto_89862 ) ) ( not ( = ?auto_89857 ?auto_89863 ) ) ( not ( = ?auto_89858 ?auto_89859 ) ) ( not ( = ?auto_89858 ?auto_89860 ) ) ( not ( = ?auto_89858 ?auto_89861 ) ) ( not ( = ?auto_89858 ?auto_89862 ) ) ( not ( = ?auto_89858 ?auto_89863 ) ) ( not ( = ?auto_89859 ?auto_89860 ) ) ( not ( = ?auto_89859 ?auto_89861 ) ) ( not ( = ?auto_89859 ?auto_89862 ) ) ( not ( = ?auto_89859 ?auto_89863 ) ) ( not ( = ?auto_89860 ?auto_89861 ) ) ( not ( = ?auto_89860 ?auto_89862 ) ) ( not ( = ?auto_89860 ?auto_89863 ) ) ( not ( = ?auto_89861 ?auto_89862 ) ) ( not ( = ?auto_89861 ?auto_89863 ) ) ( not ( = ?auto_89862 ?auto_89863 ) ) ( ON ?auto_89863 ?auto_89864 ) ( not ( = ?auto_89857 ?auto_89864 ) ) ( not ( = ?auto_89858 ?auto_89864 ) ) ( not ( = ?auto_89859 ?auto_89864 ) ) ( not ( = ?auto_89860 ?auto_89864 ) ) ( not ( = ?auto_89861 ?auto_89864 ) ) ( not ( = ?auto_89862 ?auto_89864 ) ) ( not ( = ?auto_89863 ?auto_89864 ) ) ( ON ?auto_89862 ?auto_89863 ) ( ON-TABLE ?auto_89864 ) ( CLEAR ?auto_89860 ) ( ON ?auto_89861 ?auto_89862 ) ( CLEAR ?auto_89861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89864 ?auto_89863 ?auto_89862 )
      ( MAKE-7PILE ?auto_89857 ?auto_89858 ?auto_89859 ?auto_89860 ?auto_89861 ?auto_89862 ?auto_89863 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89865 - BLOCK
      ?auto_89866 - BLOCK
      ?auto_89867 - BLOCK
      ?auto_89868 - BLOCK
      ?auto_89869 - BLOCK
      ?auto_89870 - BLOCK
      ?auto_89871 - BLOCK
    )
    :vars
    (
      ?auto_89872 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89865 ) ( ON ?auto_89866 ?auto_89865 ) ( ON ?auto_89867 ?auto_89866 ) ( not ( = ?auto_89865 ?auto_89866 ) ) ( not ( = ?auto_89865 ?auto_89867 ) ) ( not ( = ?auto_89865 ?auto_89868 ) ) ( not ( = ?auto_89865 ?auto_89869 ) ) ( not ( = ?auto_89865 ?auto_89870 ) ) ( not ( = ?auto_89865 ?auto_89871 ) ) ( not ( = ?auto_89866 ?auto_89867 ) ) ( not ( = ?auto_89866 ?auto_89868 ) ) ( not ( = ?auto_89866 ?auto_89869 ) ) ( not ( = ?auto_89866 ?auto_89870 ) ) ( not ( = ?auto_89866 ?auto_89871 ) ) ( not ( = ?auto_89867 ?auto_89868 ) ) ( not ( = ?auto_89867 ?auto_89869 ) ) ( not ( = ?auto_89867 ?auto_89870 ) ) ( not ( = ?auto_89867 ?auto_89871 ) ) ( not ( = ?auto_89868 ?auto_89869 ) ) ( not ( = ?auto_89868 ?auto_89870 ) ) ( not ( = ?auto_89868 ?auto_89871 ) ) ( not ( = ?auto_89869 ?auto_89870 ) ) ( not ( = ?auto_89869 ?auto_89871 ) ) ( not ( = ?auto_89870 ?auto_89871 ) ) ( ON ?auto_89871 ?auto_89872 ) ( not ( = ?auto_89865 ?auto_89872 ) ) ( not ( = ?auto_89866 ?auto_89872 ) ) ( not ( = ?auto_89867 ?auto_89872 ) ) ( not ( = ?auto_89868 ?auto_89872 ) ) ( not ( = ?auto_89869 ?auto_89872 ) ) ( not ( = ?auto_89870 ?auto_89872 ) ) ( not ( = ?auto_89871 ?auto_89872 ) ) ( ON ?auto_89870 ?auto_89871 ) ( ON-TABLE ?auto_89872 ) ( ON ?auto_89869 ?auto_89870 ) ( CLEAR ?auto_89869 ) ( HOLDING ?auto_89868 ) ( CLEAR ?auto_89867 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89865 ?auto_89866 ?auto_89867 ?auto_89868 )
      ( MAKE-7PILE ?auto_89865 ?auto_89866 ?auto_89867 ?auto_89868 ?auto_89869 ?auto_89870 ?auto_89871 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89873 - BLOCK
      ?auto_89874 - BLOCK
      ?auto_89875 - BLOCK
      ?auto_89876 - BLOCK
      ?auto_89877 - BLOCK
      ?auto_89878 - BLOCK
      ?auto_89879 - BLOCK
    )
    :vars
    (
      ?auto_89880 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89873 ) ( ON ?auto_89874 ?auto_89873 ) ( ON ?auto_89875 ?auto_89874 ) ( not ( = ?auto_89873 ?auto_89874 ) ) ( not ( = ?auto_89873 ?auto_89875 ) ) ( not ( = ?auto_89873 ?auto_89876 ) ) ( not ( = ?auto_89873 ?auto_89877 ) ) ( not ( = ?auto_89873 ?auto_89878 ) ) ( not ( = ?auto_89873 ?auto_89879 ) ) ( not ( = ?auto_89874 ?auto_89875 ) ) ( not ( = ?auto_89874 ?auto_89876 ) ) ( not ( = ?auto_89874 ?auto_89877 ) ) ( not ( = ?auto_89874 ?auto_89878 ) ) ( not ( = ?auto_89874 ?auto_89879 ) ) ( not ( = ?auto_89875 ?auto_89876 ) ) ( not ( = ?auto_89875 ?auto_89877 ) ) ( not ( = ?auto_89875 ?auto_89878 ) ) ( not ( = ?auto_89875 ?auto_89879 ) ) ( not ( = ?auto_89876 ?auto_89877 ) ) ( not ( = ?auto_89876 ?auto_89878 ) ) ( not ( = ?auto_89876 ?auto_89879 ) ) ( not ( = ?auto_89877 ?auto_89878 ) ) ( not ( = ?auto_89877 ?auto_89879 ) ) ( not ( = ?auto_89878 ?auto_89879 ) ) ( ON ?auto_89879 ?auto_89880 ) ( not ( = ?auto_89873 ?auto_89880 ) ) ( not ( = ?auto_89874 ?auto_89880 ) ) ( not ( = ?auto_89875 ?auto_89880 ) ) ( not ( = ?auto_89876 ?auto_89880 ) ) ( not ( = ?auto_89877 ?auto_89880 ) ) ( not ( = ?auto_89878 ?auto_89880 ) ) ( not ( = ?auto_89879 ?auto_89880 ) ) ( ON ?auto_89878 ?auto_89879 ) ( ON-TABLE ?auto_89880 ) ( ON ?auto_89877 ?auto_89878 ) ( CLEAR ?auto_89875 ) ( ON ?auto_89876 ?auto_89877 ) ( CLEAR ?auto_89876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89880 ?auto_89879 ?auto_89878 ?auto_89877 )
      ( MAKE-7PILE ?auto_89873 ?auto_89874 ?auto_89875 ?auto_89876 ?auto_89877 ?auto_89878 ?auto_89879 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89881 - BLOCK
      ?auto_89882 - BLOCK
      ?auto_89883 - BLOCK
      ?auto_89884 - BLOCK
      ?auto_89885 - BLOCK
      ?auto_89886 - BLOCK
      ?auto_89887 - BLOCK
    )
    :vars
    (
      ?auto_89888 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89881 ) ( ON ?auto_89882 ?auto_89881 ) ( not ( = ?auto_89881 ?auto_89882 ) ) ( not ( = ?auto_89881 ?auto_89883 ) ) ( not ( = ?auto_89881 ?auto_89884 ) ) ( not ( = ?auto_89881 ?auto_89885 ) ) ( not ( = ?auto_89881 ?auto_89886 ) ) ( not ( = ?auto_89881 ?auto_89887 ) ) ( not ( = ?auto_89882 ?auto_89883 ) ) ( not ( = ?auto_89882 ?auto_89884 ) ) ( not ( = ?auto_89882 ?auto_89885 ) ) ( not ( = ?auto_89882 ?auto_89886 ) ) ( not ( = ?auto_89882 ?auto_89887 ) ) ( not ( = ?auto_89883 ?auto_89884 ) ) ( not ( = ?auto_89883 ?auto_89885 ) ) ( not ( = ?auto_89883 ?auto_89886 ) ) ( not ( = ?auto_89883 ?auto_89887 ) ) ( not ( = ?auto_89884 ?auto_89885 ) ) ( not ( = ?auto_89884 ?auto_89886 ) ) ( not ( = ?auto_89884 ?auto_89887 ) ) ( not ( = ?auto_89885 ?auto_89886 ) ) ( not ( = ?auto_89885 ?auto_89887 ) ) ( not ( = ?auto_89886 ?auto_89887 ) ) ( ON ?auto_89887 ?auto_89888 ) ( not ( = ?auto_89881 ?auto_89888 ) ) ( not ( = ?auto_89882 ?auto_89888 ) ) ( not ( = ?auto_89883 ?auto_89888 ) ) ( not ( = ?auto_89884 ?auto_89888 ) ) ( not ( = ?auto_89885 ?auto_89888 ) ) ( not ( = ?auto_89886 ?auto_89888 ) ) ( not ( = ?auto_89887 ?auto_89888 ) ) ( ON ?auto_89886 ?auto_89887 ) ( ON-TABLE ?auto_89888 ) ( ON ?auto_89885 ?auto_89886 ) ( ON ?auto_89884 ?auto_89885 ) ( CLEAR ?auto_89884 ) ( HOLDING ?auto_89883 ) ( CLEAR ?auto_89882 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89881 ?auto_89882 ?auto_89883 )
      ( MAKE-7PILE ?auto_89881 ?auto_89882 ?auto_89883 ?auto_89884 ?auto_89885 ?auto_89886 ?auto_89887 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89889 - BLOCK
      ?auto_89890 - BLOCK
      ?auto_89891 - BLOCK
      ?auto_89892 - BLOCK
      ?auto_89893 - BLOCK
      ?auto_89894 - BLOCK
      ?auto_89895 - BLOCK
    )
    :vars
    (
      ?auto_89896 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89889 ) ( ON ?auto_89890 ?auto_89889 ) ( not ( = ?auto_89889 ?auto_89890 ) ) ( not ( = ?auto_89889 ?auto_89891 ) ) ( not ( = ?auto_89889 ?auto_89892 ) ) ( not ( = ?auto_89889 ?auto_89893 ) ) ( not ( = ?auto_89889 ?auto_89894 ) ) ( not ( = ?auto_89889 ?auto_89895 ) ) ( not ( = ?auto_89890 ?auto_89891 ) ) ( not ( = ?auto_89890 ?auto_89892 ) ) ( not ( = ?auto_89890 ?auto_89893 ) ) ( not ( = ?auto_89890 ?auto_89894 ) ) ( not ( = ?auto_89890 ?auto_89895 ) ) ( not ( = ?auto_89891 ?auto_89892 ) ) ( not ( = ?auto_89891 ?auto_89893 ) ) ( not ( = ?auto_89891 ?auto_89894 ) ) ( not ( = ?auto_89891 ?auto_89895 ) ) ( not ( = ?auto_89892 ?auto_89893 ) ) ( not ( = ?auto_89892 ?auto_89894 ) ) ( not ( = ?auto_89892 ?auto_89895 ) ) ( not ( = ?auto_89893 ?auto_89894 ) ) ( not ( = ?auto_89893 ?auto_89895 ) ) ( not ( = ?auto_89894 ?auto_89895 ) ) ( ON ?auto_89895 ?auto_89896 ) ( not ( = ?auto_89889 ?auto_89896 ) ) ( not ( = ?auto_89890 ?auto_89896 ) ) ( not ( = ?auto_89891 ?auto_89896 ) ) ( not ( = ?auto_89892 ?auto_89896 ) ) ( not ( = ?auto_89893 ?auto_89896 ) ) ( not ( = ?auto_89894 ?auto_89896 ) ) ( not ( = ?auto_89895 ?auto_89896 ) ) ( ON ?auto_89894 ?auto_89895 ) ( ON-TABLE ?auto_89896 ) ( ON ?auto_89893 ?auto_89894 ) ( ON ?auto_89892 ?auto_89893 ) ( CLEAR ?auto_89890 ) ( ON ?auto_89891 ?auto_89892 ) ( CLEAR ?auto_89891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89896 ?auto_89895 ?auto_89894 ?auto_89893 ?auto_89892 )
      ( MAKE-7PILE ?auto_89889 ?auto_89890 ?auto_89891 ?auto_89892 ?auto_89893 ?auto_89894 ?auto_89895 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89897 - BLOCK
      ?auto_89898 - BLOCK
      ?auto_89899 - BLOCK
      ?auto_89900 - BLOCK
      ?auto_89901 - BLOCK
      ?auto_89902 - BLOCK
      ?auto_89903 - BLOCK
    )
    :vars
    (
      ?auto_89904 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89897 ) ( not ( = ?auto_89897 ?auto_89898 ) ) ( not ( = ?auto_89897 ?auto_89899 ) ) ( not ( = ?auto_89897 ?auto_89900 ) ) ( not ( = ?auto_89897 ?auto_89901 ) ) ( not ( = ?auto_89897 ?auto_89902 ) ) ( not ( = ?auto_89897 ?auto_89903 ) ) ( not ( = ?auto_89898 ?auto_89899 ) ) ( not ( = ?auto_89898 ?auto_89900 ) ) ( not ( = ?auto_89898 ?auto_89901 ) ) ( not ( = ?auto_89898 ?auto_89902 ) ) ( not ( = ?auto_89898 ?auto_89903 ) ) ( not ( = ?auto_89899 ?auto_89900 ) ) ( not ( = ?auto_89899 ?auto_89901 ) ) ( not ( = ?auto_89899 ?auto_89902 ) ) ( not ( = ?auto_89899 ?auto_89903 ) ) ( not ( = ?auto_89900 ?auto_89901 ) ) ( not ( = ?auto_89900 ?auto_89902 ) ) ( not ( = ?auto_89900 ?auto_89903 ) ) ( not ( = ?auto_89901 ?auto_89902 ) ) ( not ( = ?auto_89901 ?auto_89903 ) ) ( not ( = ?auto_89902 ?auto_89903 ) ) ( ON ?auto_89903 ?auto_89904 ) ( not ( = ?auto_89897 ?auto_89904 ) ) ( not ( = ?auto_89898 ?auto_89904 ) ) ( not ( = ?auto_89899 ?auto_89904 ) ) ( not ( = ?auto_89900 ?auto_89904 ) ) ( not ( = ?auto_89901 ?auto_89904 ) ) ( not ( = ?auto_89902 ?auto_89904 ) ) ( not ( = ?auto_89903 ?auto_89904 ) ) ( ON ?auto_89902 ?auto_89903 ) ( ON-TABLE ?auto_89904 ) ( ON ?auto_89901 ?auto_89902 ) ( ON ?auto_89900 ?auto_89901 ) ( ON ?auto_89899 ?auto_89900 ) ( CLEAR ?auto_89899 ) ( HOLDING ?auto_89898 ) ( CLEAR ?auto_89897 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89897 ?auto_89898 )
      ( MAKE-7PILE ?auto_89897 ?auto_89898 ?auto_89899 ?auto_89900 ?auto_89901 ?auto_89902 ?auto_89903 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89905 - BLOCK
      ?auto_89906 - BLOCK
      ?auto_89907 - BLOCK
      ?auto_89908 - BLOCK
      ?auto_89909 - BLOCK
      ?auto_89910 - BLOCK
      ?auto_89911 - BLOCK
    )
    :vars
    (
      ?auto_89912 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89905 ) ( not ( = ?auto_89905 ?auto_89906 ) ) ( not ( = ?auto_89905 ?auto_89907 ) ) ( not ( = ?auto_89905 ?auto_89908 ) ) ( not ( = ?auto_89905 ?auto_89909 ) ) ( not ( = ?auto_89905 ?auto_89910 ) ) ( not ( = ?auto_89905 ?auto_89911 ) ) ( not ( = ?auto_89906 ?auto_89907 ) ) ( not ( = ?auto_89906 ?auto_89908 ) ) ( not ( = ?auto_89906 ?auto_89909 ) ) ( not ( = ?auto_89906 ?auto_89910 ) ) ( not ( = ?auto_89906 ?auto_89911 ) ) ( not ( = ?auto_89907 ?auto_89908 ) ) ( not ( = ?auto_89907 ?auto_89909 ) ) ( not ( = ?auto_89907 ?auto_89910 ) ) ( not ( = ?auto_89907 ?auto_89911 ) ) ( not ( = ?auto_89908 ?auto_89909 ) ) ( not ( = ?auto_89908 ?auto_89910 ) ) ( not ( = ?auto_89908 ?auto_89911 ) ) ( not ( = ?auto_89909 ?auto_89910 ) ) ( not ( = ?auto_89909 ?auto_89911 ) ) ( not ( = ?auto_89910 ?auto_89911 ) ) ( ON ?auto_89911 ?auto_89912 ) ( not ( = ?auto_89905 ?auto_89912 ) ) ( not ( = ?auto_89906 ?auto_89912 ) ) ( not ( = ?auto_89907 ?auto_89912 ) ) ( not ( = ?auto_89908 ?auto_89912 ) ) ( not ( = ?auto_89909 ?auto_89912 ) ) ( not ( = ?auto_89910 ?auto_89912 ) ) ( not ( = ?auto_89911 ?auto_89912 ) ) ( ON ?auto_89910 ?auto_89911 ) ( ON-TABLE ?auto_89912 ) ( ON ?auto_89909 ?auto_89910 ) ( ON ?auto_89908 ?auto_89909 ) ( ON ?auto_89907 ?auto_89908 ) ( CLEAR ?auto_89905 ) ( ON ?auto_89906 ?auto_89907 ) ( CLEAR ?auto_89906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89912 ?auto_89911 ?auto_89910 ?auto_89909 ?auto_89908 ?auto_89907 )
      ( MAKE-7PILE ?auto_89905 ?auto_89906 ?auto_89907 ?auto_89908 ?auto_89909 ?auto_89910 ?auto_89911 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89913 - BLOCK
      ?auto_89914 - BLOCK
      ?auto_89915 - BLOCK
      ?auto_89916 - BLOCK
      ?auto_89917 - BLOCK
      ?auto_89918 - BLOCK
      ?auto_89919 - BLOCK
    )
    :vars
    (
      ?auto_89920 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89913 ?auto_89914 ) ) ( not ( = ?auto_89913 ?auto_89915 ) ) ( not ( = ?auto_89913 ?auto_89916 ) ) ( not ( = ?auto_89913 ?auto_89917 ) ) ( not ( = ?auto_89913 ?auto_89918 ) ) ( not ( = ?auto_89913 ?auto_89919 ) ) ( not ( = ?auto_89914 ?auto_89915 ) ) ( not ( = ?auto_89914 ?auto_89916 ) ) ( not ( = ?auto_89914 ?auto_89917 ) ) ( not ( = ?auto_89914 ?auto_89918 ) ) ( not ( = ?auto_89914 ?auto_89919 ) ) ( not ( = ?auto_89915 ?auto_89916 ) ) ( not ( = ?auto_89915 ?auto_89917 ) ) ( not ( = ?auto_89915 ?auto_89918 ) ) ( not ( = ?auto_89915 ?auto_89919 ) ) ( not ( = ?auto_89916 ?auto_89917 ) ) ( not ( = ?auto_89916 ?auto_89918 ) ) ( not ( = ?auto_89916 ?auto_89919 ) ) ( not ( = ?auto_89917 ?auto_89918 ) ) ( not ( = ?auto_89917 ?auto_89919 ) ) ( not ( = ?auto_89918 ?auto_89919 ) ) ( ON ?auto_89919 ?auto_89920 ) ( not ( = ?auto_89913 ?auto_89920 ) ) ( not ( = ?auto_89914 ?auto_89920 ) ) ( not ( = ?auto_89915 ?auto_89920 ) ) ( not ( = ?auto_89916 ?auto_89920 ) ) ( not ( = ?auto_89917 ?auto_89920 ) ) ( not ( = ?auto_89918 ?auto_89920 ) ) ( not ( = ?auto_89919 ?auto_89920 ) ) ( ON ?auto_89918 ?auto_89919 ) ( ON-TABLE ?auto_89920 ) ( ON ?auto_89917 ?auto_89918 ) ( ON ?auto_89916 ?auto_89917 ) ( ON ?auto_89915 ?auto_89916 ) ( ON ?auto_89914 ?auto_89915 ) ( CLEAR ?auto_89914 ) ( HOLDING ?auto_89913 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_89913 )
      ( MAKE-7PILE ?auto_89913 ?auto_89914 ?auto_89915 ?auto_89916 ?auto_89917 ?auto_89918 ?auto_89919 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89921 - BLOCK
      ?auto_89922 - BLOCK
      ?auto_89923 - BLOCK
      ?auto_89924 - BLOCK
      ?auto_89925 - BLOCK
      ?auto_89926 - BLOCK
      ?auto_89927 - BLOCK
    )
    :vars
    (
      ?auto_89928 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89921 ?auto_89922 ) ) ( not ( = ?auto_89921 ?auto_89923 ) ) ( not ( = ?auto_89921 ?auto_89924 ) ) ( not ( = ?auto_89921 ?auto_89925 ) ) ( not ( = ?auto_89921 ?auto_89926 ) ) ( not ( = ?auto_89921 ?auto_89927 ) ) ( not ( = ?auto_89922 ?auto_89923 ) ) ( not ( = ?auto_89922 ?auto_89924 ) ) ( not ( = ?auto_89922 ?auto_89925 ) ) ( not ( = ?auto_89922 ?auto_89926 ) ) ( not ( = ?auto_89922 ?auto_89927 ) ) ( not ( = ?auto_89923 ?auto_89924 ) ) ( not ( = ?auto_89923 ?auto_89925 ) ) ( not ( = ?auto_89923 ?auto_89926 ) ) ( not ( = ?auto_89923 ?auto_89927 ) ) ( not ( = ?auto_89924 ?auto_89925 ) ) ( not ( = ?auto_89924 ?auto_89926 ) ) ( not ( = ?auto_89924 ?auto_89927 ) ) ( not ( = ?auto_89925 ?auto_89926 ) ) ( not ( = ?auto_89925 ?auto_89927 ) ) ( not ( = ?auto_89926 ?auto_89927 ) ) ( ON ?auto_89927 ?auto_89928 ) ( not ( = ?auto_89921 ?auto_89928 ) ) ( not ( = ?auto_89922 ?auto_89928 ) ) ( not ( = ?auto_89923 ?auto_89928 ) ) ( not ( = ?auto_89924 ?auto_89928 ) ) ( not ( = ?auto_89925 ?auto_89928 ) ) ( not ( = ?auto_89926 ?auto_89928 ) ) ( not ( = ?auto_89927 ?auto_89928 ) ) ( ON ?auto_89926 ?auto_89927 ) ( ON-TABLE ?auto_89928 ) ( ON ?auto_89925 ?auto_89926 ) ( ON ?auto_89924 ?auto_89925 ) ( ON ?auto_89923 ?auto_89924 ) ( ON ?auto_89922 ?auto_89923 ) ( ON ?auto_89921 ?auto_89922 ) ( CLEAR ?auto_89921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_89928 ?auto_89927 ?auto_89926 ?auto_89925 ?auto_89924 ?auto_89923 ?auto_89922 )
      ( MAKE-7PILE ?auto_89921 ?auto_89922 ?auto_89923 ?auto_89924 ?auto_89925 ?auto_89926 ?auto_89927 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90035 - BLOCK
    )
    :vars
    (
      ?auto_90036 - BLOCK
      ?auto_90037 - BLOCK
      ?auto_90038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90035 ?auto_90036 ) ( CLEAR ?auto_90035 ) ( not ( = ?auto_90035 ?auto_90036 ) ) ( HOLDING ?auto_90037 ) ( CLEAR ?auto_90038 ) ( not ( = ?auto_90035 ?auto_90037 ) ) ( not ( = ?auto_90035 ?auto_90038 ) ) ( not ( = ?auto_90036 ?auto_90037 ) ) ( not ( = ?auto_90036 ?auto_90038 ) ) ( not ( = ?auto_90037 ?auto_90038 ) ) )
    :subtasks
    ( ( !STACK ?auto_90037 ?auto_90038 )
      ( MAKE-1PILE ?auto_90035 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90039 - BLOCK
    )
    :vars
    (
      ?auto_90041 - BLOCK
      ?auto_90040 - BLOCK
      ?auto_90042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90039 ?auto_90041 ) ( not ( = ?auto_90039 ?auto_90041 ) ) ( CLEAR ?auto_90040 ) ( not ( = ?auto_90039 ?auto_90042 ) ) ( not ( = ?auto_90039 ?auto_90040 ) ) ( not ( = ?auto_90041 ?auto_90042 ) ) ( not ( = ?auto_90041 ?auto_90040 ) ) ( not ( = ?auto_90042 ?auto_90040 ) ) ( ON ?auto_90042 ?auto_90039 ) ( CLEAR ?auto_90042 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90041 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90041 ?auto_90039 )
      ( MAKE-1PILE ?auto_90039 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90043 - BLOCK
    )
    :vars
    (
      ?auto_90044 - BLOCK
      ?auto_90045 - BLOCK
      ?auto_90046 - BLOCK
      ?auto_90048 - BLOCK
      ?auto_90047 - BLOCK
      ?auto_90050 - BLOCK
      ?auto_90049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90043 ?auto_90044 ) ( not ( = ?auto_90043 ?auto_90044 ) ) ( not ( = ?auto_90043 ?auto_90045 ) ) ( not ( = ?auto_90043 ?auto_90046 ) ) ( not ( = ?auto_90044 ?auto_90045 ) ) ( not ( = ?auto_90044 ?auto_90046 ) ) ( not ( = ?auto_90045 ?auto_90046 ) ) ( ON ?auto_90045 ?auto_90043 ) ( CLEAR ?auto_90045 ) ( ON-TABLE ?auto_90044 ) ( HOLDING ?auto_90046 ) ( CLEAR ?auto_90048 ) ( ON-TABLE ?auto_90047 ) ( ON ?auto_90050 ?auto_90047 ) ( ON ?auto_90049 ?auto_90050 ) ( ON ?auto_90048 ?auto_90049 ) ( not ( = ?auto_90047 ?auto_90050 ) ) ( not ( = ?auto_90047 ?auto_90049 ) ) ( not ( = ?auto_90047 ?auto_90048 ) ) ( not ( = ?auto_90047 ?auto_90046 ) ) ( not ( = ?auto_90050 ?auto_90049 ) ) ( not ( = ?auto_90050 ?auto_90048 ) ) ( not ( = ?auto_90050 ?auto_90046 ) ) ( not ( = ?auto_90049 ?auto_90048 ) ) ( not ( = ?auto_90049 ?auto_90046 ) ) ( not ( = ?auto_90048 ?auto_90046 ) ) ( not ( = ?auto_90043 ?auto_90048 ) ) ( not ( = ?auto_90043 ?auto_90047 ) ) ( not ( = ?auto_90043 ?auto_90050 ) ) ( not ( = ?auto_90043 ?auto_90049 ) ) ( not ( = ?auto_90044 ?auto_90048 ) ) ( not ( = ?auto_90044 ?auto_90047 ) ) ( not ( = ?auto_90044 ?auto_90050 ) ) ( not ( = ?auto_90044 ?auto_90049 ) ) ( not ( = ?auto_90045 ?auto_90048 ) ) ( not ( = ?auto_90045 ?auto_90047 ) ) ( not ( = ?auto_90045 ?auto_90050 ) ) ( not ( = ?auto_90045 ?auto_90049 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90047 ?auto_90050 ?auto_90049 ?auto_90048 ?auto_90046 )
      ( MAKE-1PILE ?auto_90043 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90051 - BLOCK
    )
    :vars
    (
      ?auto_90055 - BLOCK
      ?auto_90057 - BLOCK
      ?auto_90053 - BLOCK
      ?auto_90054 - BLOCK
      ?auto_90056 - BLOCK
      ?auto_90052 - BLOCK
      ?auto_90058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90051 ?auto_90055 ) ( not ( = ?auto_90051 ?auto_90055 ) ) ( not ( = ?auto_90051 ?auto_90057 ) ) ( not ( = ?auto_90051 ?auto_90053 ) ) ( not ( = ?auto_90055 ?auto_90057 ) ) ( not ( = ?auto_90055 ?auto_90053 ) ) ( not ( = ?auto_90057 ?auto_90053 ) ) ( ON ?auto_90057 ?auto_90051 ) ( ON-TABLE ?auto_90055 ) ( CLEAR ?auto_90054 ) ( ON-TABLE ?auto_90056 ) ( ON ?auto_90052 ?auto_90056 ) ( ON ?auto_90058 ?auto_90052 ) ( ON ?auto_90054 ?auto_90058 ) ( not ( = ?auto_90056 ?auto_90052 ) ) ( not ( = ?auto_90056 ?auto_90058 ) ) ( not ( = ?auto_90056 ?auto_90054 ) ) ( not ( = ?auto_90056 ?auto_90053 ) ) ( not ( = ?auto_90052 ?auto_90058 ) ) ( not ( = ?auto_90052 ?auto_90054 ) ) ( not ( = ?auto_90052 ?auto_90053 ) ) ( not ( = ?auto_90058 ?auto_90054 ) ) ( not ( = ?auto_90058 ?auto_90053 ) ) ( not ( = ?auto_90054 ?auto_90053 ) ) ( not ( = ?auto_90051 ?auto_90054 ) ) ( not ( = ?auto_90051 ?auto_90056 ) ) ( not ( = ?auto_90051 ?auto_90052 ) ) ( not ( = ?auto_90051 ?auto_90058 ) ) ( not ( = ?auto_90055 ?auto_90054 ) ) ( not ( = ?auto_90055 ?auto_90056 ) ) ( not ( = ?auto_90055 ?auto_90052 ) ) ( not ( = ?auto_90055 ?auto_90058 ) ) ( not ( = ?auto_90057 ?auto_90054 ) ) ( not ( = ?auto_90057 ?auto_90056 ) ) ( not ( = ?auto_90057 ?auto_90052 ) ) ( not ( = ?auto_90057 ?auto_90058 ) ) ( ON ?auto_90053 ?auto_90057 ) ( CLEAR ?auto_90053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90055 ?auto_90051 ?auto_90057 )
      ( MAKE-1PILE ?auto_90051 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90059 - BLOCK
    )
    :vars
    (
      ?auto_90060 - BLOCK
      ?auto_90066 - BLOCK
      ?auto_90065 - BLOCK
      ?auto_90064 - BLOCK
      ?auto_90062 - BLOCK
      ?auto_90063 - BLOCK
      ?auto_90061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90059 ?auto_90060 ) ( not ( = ?auto_90059 ?auto_90060 ) ) ( not ( = ?auto_90059 ?auto_90066 ) ) ( not ( = ?auto_90059 ?auto_90065 ) ) ( not ( = ?auto_90060 ?auto_90066 ) ) ( not ( = ?auto_90060 ?auto_90065 ) ) ( not ( = ?auto_90066 ?auto_90065 ) ) ( ON ?auto_90066 ?auto_90059 ) ( ON-TABLE ?auto_90060 ) ( ON-TABLE ?auto_90064 ) ( ON ?auto_90062 ?auto_90064 ) ( ON ?auto_90063 ?auto_90062 ) ( not ( = ?auto_90064 ?auto_90062 ) ) ( not ( = ?auto_90064 ?auto_90063 ) ) ( not ( = ?auto_90064 ?auto_90061 ) ) ( not ( = ?auto_90064 ?auto_90065 ) ) ( not ( = ?auto_90062 ?auto_90063 ) ) ( not ( = ?auto_90062 ?auto_90061 ) ) ( not ( = ?auto_90062 ?auto_90065 ) ) ( not ( = ?auto_90063 ?auto_90061 ) ) ( not ( = ?auto_90063 ?auto_90065 ) ) ( not ( = ?auto_90061 ?auto_90065 ) ) ( not ( = ?auto_90059 ?auto_90061 ) ) ( not ( = ?auto_90059 ?auto_90064 ) ) ( not ( = ?auto_90059 ?auto_90062 ) ) ( not ( = ?auto_90059 ?auto_90063 ) ) ( not ( = ?auto_90060 ?auto_90061 ) ) ( not ( = ?auto_90060 ?auto_90064 ) ) ( not ( = ?auto_90060 ?auto_90062 ) ) ( not ( = ?auto_90060 ?auto_90063 ) ) ( not ( = ?auto_90066 ?auto_90061 ) ) ( not ( = ?auto_90066 ?auto_90064 ) ) ( not ( = ?auto_90066 ?auto_90062 ) ) ( not ( = ?auto_90066 ?auto_90063 ) ) ( ON ?auto_90065 ?auto_90066 ) ( CLEAR ?auto_90065 ) ( HOLDING ?auto_90061 ) ( CLEAR ?auto_90063 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90064 ?auto_90062 ?auto_90063 ?auto_90061 )
      ( MAKE-1PILE ?auto_90059 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90067 - BLOCK
    )
    :vars
    (
      ?auto_90072 - BLOCK
      ?auto_90070 - BLOCK
      ?auto_90071 - BLOCK
      ?auto_90068 - BLOCK
      ?auto_90069 - BLOCK
      ?auto_90074 - BLOCK
      ?auto_90073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90067 ?auto_90072 ) ( not ( = ?auto_90067 ?auto_90072 ) ) ( not ( = ?auto_90067 ?auto_90070 ) ) ( not ( = ?auto_90067 ?auto_90071 ) ) ( not ( = ?auto_90072 ?auto_90070 ) ) ( not ( = ?auto_90072 ?auto_90071 ) ) ( not ( = ?auto_90070 ?auto_90071 ) ) ( ON ?auto_90070 ?auto_90067 ) ( ON-TABLE ?auto_90072 ) ( ON-TABLE ?auto_90068 ) ( ON ?auto_90069 ?auto_90068 ) ( ON ?auto_90074 ?auto_90069 ) ( not ( = ?auto_90068 ?auto_90069 ) ) ( not ( = ?auto_90068 ?auto_90074 ) ) ( not ( = ?auto_90068 ?auto_90073 ) ) ( not ( = ?auto_90068 ?auto_90071 ) ) ( not ( = ?auto_90069 ?auto_90074 ) ) ( not ( = ?auto_90069 ?auto_90073 ) ) ( not ( = ?auto_90069 ?auto_90071 ) ) ( not ( = ?auto_90074 ?auto_90073 ) ) ( not ( = ?auto_90074 ?auto_90071 ) ) ( not ( = ?auto_90073 ?auto_90071 ) ) ( not ( = ?auto_90067 ?auto_90073 ) ) ( not ( = ?auto_90067 ?auto_90068 ) ) ( not ( = ?auto_90067 ?auto_90069 ) ) ( not ( = ?auto_90067 ?auto_90074 ) ) ( not ( = ?auto_90072 ?auto_90073 ) ) ( not ( = ?auto_90072 ?auto_90068 ) ) ( not ( = ?auto_90072 ?auto_90069 ) ) ( not ( = ?auto_90072 ?auto_90074 ) ) ( not ( = ?auto_90070 ?auto_90073 ) ) ( not ( = ?auto_90070 ?auto_90068 ) ) ( not ( = ?auto_90070 ?auto_90069 ) ) ( not ( = ?auto_90070 ?auto_90074 ) ) ( ON ?auto_90071 ?auto_90070 ) ( CLEAR ?auto_90074 ) ( ON ?auto_90073 ?auto_90071 ) ( CLEAR ?auto_90073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90072 ?auto_90067 ?auto_90070 ?auto_90071 )
      ( MAKE-1PILE ?auto_90067 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90075 - BLOCK
    )
    :vars
    (
      ?auto_90081 - BLOCK
      ?auto_90082 - BLOCK
      ?auto_90076 - BLOCK
      ?auto_90078 - BLOCK
      ?auto_90080 - BLOCK
      ?auto_90077 - BLOCK
      ?auto_90079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90075 ?auto_90081 ) ( not ( = ?auto_90075 ?auto_90081 ) ) ( not ( = ?auto_90075 ?auto_90082 ) ) ( not ( = ?auto_90075 ?auto_90076 ) ) ( not ( = ?auto_90081 ?auto_90082 ) ) ( not ( = ?auto_90081 ?auto_90076 ) ) ( not ( = ?auto_90082 ?auto_90076 ) ) ( ON ?auto_90082 ?auto_90075 ) ( ON-TABLE ?auto_90081 ) ( ON-TABLE ?auto_90078 ) ( ON ?auto_90080 ?auto_90078 ) ( not ( = ?auto_90078 ?auto_90080 ) ) ( not ( = ?auto_90078 ?auto_90077 ) ) ( not ( = ?auto_90078 ?auto_90079 ) ) ( not ( = ?auto_90078 ?auto_90076 ) ) ( not ( = ?auto_90080 ?auto_90077 ) ) ( not ( = ?auto_90080 ?auto_90079 ) ) ( not ( = ?auto_90080 ?auto_90076 ) ) ( not ( = ?auto_90077 ?auto_90079 ) ) ( not ( = ?auto_90077 ?auto_90076 ) ) ( not ( = ?auto_90079 ?auto_90076 ) ) ( not ( = ?auto_90075 ?auto_90079 ) ) ( not ( = ?auto_90075 ?auto_90078 ) ) ( not ( = ?auto_90075 ?auto_90080 ) ) ( not ( = ?auto_90075 ?auto_90077 ) ) ( not ( = ?auto_90081 ?auto_90079 ) ) ( not ( = ?auto_90081 ?auto_90078 ) ) ( not ( = ?auto_90081 ?auto_90080 ) ) ( not ( = ?auto_90081 ?auto_90077 ) ) ( not ( = ?auto_90082 ?auto_90079 ) ) ( not ( = ?auto_90082 ?auto_90078 ) ) ( not ( = ?auto_90082 ?auto_90080 ) ) ( not ( = ?auto_90082 ?auto_90077 ) ) ( ON ?auto_90076 ?auto_90082 ) ( ON ?auto_90079 ?auto_90076 ) ( CLEAR ?auto_90079 ) ( HOLDING ?auto_90077 ) ( CLEAR ?auto_90080 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90078 ?auto_90080 ?auto_90077 )
      ( MAKE-1PILE ?auto_90075 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90083 - BLOCK
    )
    :vars
    (
      ?auto_90087 - BLOCK
      ?auto_90089 - BLOCK
      ?auto_90088 - BLOCK
      ?auto_90086 - BLOCK
      ?auto_90090 - BLOCK
      ?auto_90084 - BLOCK
      ?auto_90085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90083 ?auto_90087 ) ( not ( = ?auto_90083 ?auto_90087 ) ) ( not ( = ?auto_90083 ?auto_90089 ) ) ( not ( = ?auto_90083 ?auto_90088 ) ) ( not ( = ?auto_90087 ?auto_90089 ) ) ( not ( = ?auto_90087 ?auto_90088 ) ) ( not ( = ?auto_90089 ?auto_90088 ) ) ( ON ?auto_90089 ?auto_90083 ) ( ON-TABLE ?auto_90087 ) ( ON-TABLE ?auto_90086 ) ( ON ?auto_90090 ?auto_90086 ) ( not ( = ?auto_90086 ?auto_90090 ) ) ( not ( = ?auto_90086 ?auto_90084 ) ) ( not ( = ?auto_90086 ?auto_90085 ) ) ( not ( = ?auto_90086 ?auto_90088 ) ) ( not ( = ?auto_90090 ?auto_90084 ) ) ( not ( = ?auto_90090 ?auto_90085 ) ) ( not ( = ?auto_90090 ?auto_90088 ) ) ( not ( = ?auto_90084 ?auto_90085 ) ) ( not ( = ?auto_90084 ?auto_90088 ) ) ( not ( = ?auto_90085 ?auto_90088 ) ) ( not ( = ?auto_90083 ?auto_90085 ) ) ( not ( = ?auto_90083 ?auto_90086 ) ) ( not ( = ?auto_90083 ?auto_90090 ) ) ( not ( = ?auto_90083 ?auto_90084 ) ) ( not ( = ?auto_90087 ?auto_90085 ) ) ( not ( = ?auto_90087 ?auto_90086 ) ) ( not ( = ?auto_90087 ?auto_90090 ) ) ( not ( = ?auto_90087 ?auto_90084 ) ) ( not ( = ?auto_90089 ?auto_90085 ) ) ( not ( = ?auto_90089 ?auto_90086 ) ) ( not ( = ?auto_90089 ?auto_90090 ) ) ( not ( = ?auto_90089 ?auto_90084 ) ) ( ON ?auto_90088 ?auto_90089 ) ( ON ?auto_90085 ?auto_90088 ) ( CLEAR ?auto_90090 ) ( ON ?auto_90084 ?auto_90085 ) ( CLEAR ?auto_90084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90087 ?auto_90083 ?auto_90089 ?auto_90088 ?auto_90085 )
      ( MAKE-1PILE ?auto_90083 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90091 - BLOCK
    )
    :vars
    (
      ?auto_90094 - BLOCK
      ?auto_90095 - BLOCK
      ?auto_90096 - BLOCK
      ?auto_90097 - BLOCK
      ?auto_90092 - BLOCK
      ?auto_90093 - BLOCK
      ?auto_90098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90091 ?auto_90094 ) ( not ( = ?auto_90091 ?auto_90094 ) ) ( not ( = ?auto_90091 ?auto_90095 ) ) ( not ( = ?auto_90091 ?auto_90096 ) ) ( not ( = ?auto_90094 ?auto_90095 ) ) ( not ( = ?auto_90094 ?auto_90096 ) ) ( not ( = ?auto_90095 ?auto_90096 ) ) ( ON ?auto_90095 ?auto_90091 ) ( ON-TABLE ?auto_90094 ) ( ON-TABLE ?auto_90097 ) ( not ( = ?auto_90097 ?auto_90092 ) ) ( not ( = ?auto_90097 ?auto_90093 ) ) ( not ( = ?auto_90097 ?auto_90098 ) ) ( not ( = ?auto_90097 ?auto_90096 ) ) ( not ( = ?auto_90092 ?auto_90093 ) ) ( not ( = ?auto_90092 ?auto_90098 ) ) ( not ( = ?auto_90092 ?auto_90096 ) ) ( not ( = ?auto_90093 ?auto_90098 ) ) ( not ( = ?auto_90093 ?auto_90096 ) ) ( not ( = ?auto_90098 ?auto_90096 ) ) ( not ( = ?auto_90091 ?auto_90098 ) ) ( not ( = ?auto_90091 ?auto_90097 ) ) ( not ( = ?auto_90091 ?auto_90092 ) ) ( not ( = ?auto_90091 ?auto_90093 ) ) ( not ( = ?auto_90094 ?auto_90098 ) ) ( not ( = ?auto_90094 ?auto_90097 ) ) ( not ( = ?auto_90094 ?auto_90092 ) ) ( not ( = ?auto_90094 ?auto_90093 ) ) ( not ( = ?auto_90095 ?auto_90098 ) ) ( not ( = ?auto_90095 ?auto_90097 ) ) ( not ( = ?auto_90095 ?auto_90092 ) ) ( not ( = ?auto_90095 ?auto_90093 ) ) ( ON ?auto_90096 ?auto_90095 ) ( ON ?auto_90098 ?auto_90096 ) ( ON ?auto_90093 ?auto_90098 ) ( CLEAR ?auto_90093 ) ( HOLDING ?auto_90092 ) ( CLEAR ?auto_90097 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90097 ?auto_90092 )
      ( MAKE-1PILE ?auto_90091 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90099 - BLOCK
    )
    :vars
    (
      ?auto_90104 - BLOCK
      ?auto_90103 - BLOCK
      ?auto_90102 - BLOCK
      ?auto_90106 - BLOCK
      ?auto_90105 - BLOCK
      ?auto_90101 - BLOCK
      ?auto_90100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90099 ?auto_90104 ) ( not ( = ?auto_90099 ?auto_90104 ) ) ( not ( = ?auto_90099 ?auto_90103 ) ) ( not ( = ?auto_90099 ?auto_90102 ) ) ( not ( = ?auto_90104 ?auto_90103 ) ) ( not ( = ?auto_90104 ?auto_90102 ) ) ( not ( = ?auto_90103 ?auto_90102 ) ) ( ON ?auto_90103 ?auto_90099 ) ( ON-TABLE ?auto_90104 ) ( ON-TABLE ?auto_90106 ) ( not ( = ?auto_90106 ?auto_90105 ) ) ( not ( = ?auto_90106 ?auto_90101 ) ) ( not ( = ?auto_90106 ?auto_90100 ) ) ( not ( = ?auto_90106 ?auto_90102 ) ) ( not ( = ?auto_90105 ?auto_90101 ) ) ( not ( = ?auto_90105 ?auto_90100 ) ) ( not ( = ?auto_90105 ?auto_90102 ) ) ( not ( = ?auto_90101 ?auto_90100 ) ) ( not ( = ?auto_90101 ?auto_90102 ) ) ( not ( = ?auto_90100 ?auto_90102 ) ) ( not ( = ?auto_90099 ?auto_90100 ) ) ( not ( = ?auto_90099 ?auto_90106 ) ) ( not ( = ?auto_90099 ?auto_90105 ) ) ( not ( = ?auto_90099 ?auto_90101 ) ) ( not ( = ?auto_90104 ?auto_90100 ) ) ( not ( = ?auto_90104 ?auto_90106 ) ) ( not ( = ?auto_90104 ?auto_90105 ) ) ( not ( = ?auto_90104 ?auto_90101 ) ) ( not ( = ?auto_90103 ?auto_90100 ) ) ( not ( = ?auto_90103 ?auto_90106 ) ) ( not ( = ?auto_90103 ?auto_90105 ) ) ( not ( = ?auto_90103 ?auto_90101 ) ) ( ON ?auto_90102 ?auto_90103 ) ( ON ?auto_90100 ?auto_90102 ) ( ON ?auto_90101 ?auto_90100 ) ( CLEAR ?auto_90106 ) ( ON ?auto_90105 ?auto_90101 ) ( CLEAR ?auto_90105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90104 ?auto_90099 ?auto_90103 ?auto_90102 ?auto_90100 ?auto_90101 )
      ( MAKE-1PILE ?auto_90099 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90107 - BLOCK
    )
    :vars
    (
      ?auto_90113 - BLOCK
      ?auto_90114 - BLOCK
      ?auto_90112 - BLOCK
      ?auto_90111 - BLOCK
      ?auto_90108 - BLOCK
      ?auto_90109 - BLOCK
      ?auto_90110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90107 ?auto_90113 ) ( not ( = ?auto_90107 ?auto_90113 ) ) ( not ( = ?auto_90107 ?auto_90114 ) ) ( not ( = ?auto_90107 ?auto_90112 ) ) ( not ( = ?auto_90113 ?auto_90114 ) ) ( not ( = ?auto_90113 ?auto_90112 ) ) ( not ( = ?auto_90114 ?auto_90112 ) ) ( ON ?auto_90114 ?auto_90107 ) ( ON-TABLE ?auto_90113 ) ( not ( = ?auto_90111 ?auto_90108 ) ) ( not ( = ?auto_90111 ?auto_90109 ) ) ( not ( = ?auto_90111 ?auto_90110 ) ) ( not ( = ?auto_90111 ?auto_90112 ) ) ( not ( = ?auto_90108 ?auto_90109 ) ) ( not ( = ?auto_90108 ?auto_90110 ) ) ( not ( = ?auto_90108 ?auto_90112 ) ) ( not ( = ?auto_90109 ?auto_90110 ) ) ( not ( = ?auto_90109 ?auto_90112 ) ) ( not ( = ?auto_90110 ?auto_90112 ) ) ( not ( = ?auto_90107 ?auto_90110 ) ) ( not ( = ?auto_90107 ?auto_90111 ) ) ( not ( = ?auto_90107 ?auto_90108 ) ) ( not ( = ?auto_90107 ?auto_90109 ) ) ( not ( = ?auto_90113 ?auto_90110 ) ) ( not ( = ?auto_90113 ?auto_90111 ) ) ( not ( = ?auto_90113 ?auto_90108 ) ) ( not ( = ?auto_90113 ?auto_90109 ) ) ( not ( = ?auto_90114 ?auto_90110 ) ) ( not ( = ?auto_90114 ?auto_90111 ) ) ( not ( = ?auto_90114 ?auto_90108 ) ) ( not ( = ?auto_90114 ?auto_90109 ) ) ( ON ?auto_90112 ?auto_90114 ) ( ON ?auto_90110 ?auto_90112 ) ( ON ?auto_90109 ?auto_90110 ) ( ON ?auto_90108 ?auto_90109 ) ( CLEAR ?auto_90108 ) ( HOLDING ?auto_90111 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90111 )
      ( MAKE-1PILE ?auto_90107 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90115 - BLOCK
    )
    :vars
    (
      ?auto_90117 - BLOCK
      ?auto_90119 - BLOCK
      ?auto_90121 - BLOCK
      ?auto_90116 - BLOCK
      ?auto_90120 - BLOCK
      ?auto_90122 - BLOCK
      ?auto_90118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90115 ?auto_90117 ) ( not ( = ?auto_90115 ?auto_90117 ) ) ( not ( = ?auto_90115 ?auto_90119 ) ) ( not ( = ?auto_90115 ?auto_90121 ) ) ( not ( = ?auto_90117 ?auto_90119 ) ) ( not ( = ?auto_90117 ?auto_90121 ) ) ( not ( = ?auto_90119 ?auto_90121 ) ) ( ON ?auto_90119 ?auto_90115 ) ( ON-TABLE ?auto_90117 ) ( not ( = ?auto_90116 ?auto_90120 ) ) ( not ( = ?auto_90116 ?auto_90122 ) ) ( not ( = ?auto_90116 ?auto_90118 ) ) ( not ( = ?auto_90116 ?auto_90121 ) ) ( not ( = ?auto_90120 ?auto_90122 ) ) ( not ( = ?auto_90120 ?auto_90118 ) ) ( not ( = ?auto_90120 ?auto_90121 ) ) ( not ( = ?auto_90122 ?auto_90118 ) ) ( not ( = ?auto_90122 ?auto_90121 ) ) ( not ( = ?auto_90118 ?auto_90121 ) ) ( not ( = ?auto_90115 ?auto_90118 ) ) ( not ( = ?auto_90115 ?auto_90116 ) ) ( not ( = ?auto_90115 ?auto_90120 ) ) ( not ( = ?auto_90115 ?auto_90122 ) ) ( not ( = ?auto_90117 ?auto_90118 ) ) ( not ( = ?auto_90117 ?auto_90116 ) ) ( not ( = ?auto_90117 ?auto_90120 ) ) ( not ( = ?auto_90117 ?auto_90122 ) ) ( not ( = ?auto_90119 ?auto_90118 ) ) ( not ( = ?auto_90119 ?auto_90116 ) ) ( not ( = ?auto_90119 ?auto_90120 ) ) ( not ( = ?auto_90119 ?auto_90122 ) ) ( ON ?auto_90121 ?auto_90119 ) ( ON ?auto_90118 ?auto_90121 ) ( ON ?auto_90122 ?auto_90118 ) ( ON ?auto_90120 ?auto_90122 ) ( ON ?auto_90116 ?auto_90120 ) ( CLEAR ?auto_90116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_90117 ?auto_90115 ?auto_90119 ?auto_90121 ?auto_90118 ?auto_90122 ?auto_90120 )
      ( MAKE-1PILE ?auto_90115 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_90134 - BLOCK
      ?auto_90135 - BLOCK
      ?auto_90136 - BLOCK
      ?auto_90137 - BLOCK
      ?auto_90138 - BLOCK
    )
    :vars
    (
      ?auto_90139 - BLOCK
      ?auto_90140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90139 ?auto_90138 ) ( CLEAR ?auto_90139 ) ( ON-TABLE ?auto_90134 ) ( ON ?auto_90135 ?auto_90134 ) ( ON ?auto_90136 ?auto_90135 ) ( ON ?auto_90137 ?auto_90136 ) ( ON ?auto_90138 ?auto_90137 ) ( not ( = ?auto_90134 ?auto_90135 ) ) ( not ( = ?auto_90134 ?auto_90136 ) ) ( not ( = ?auto_90134 ?auto_90137 ) ) ( not ( = ?auto_90134 ?auto_90138 ) ) ( not ( = ?auto_90134 ?auto_90139 ) ) ( not ( = ?auto_90135 ?auto_90136 ) ) ( not ( = ?auto_90135 ?auto_90137 ) ) ( not ( = ?auto_90135 ?auto_90138 ) ) ( not ( = ?auto_90135 ?auto_90139 ) ) ( not ( = ?auto_90136 ?auto_90137 ) ) ( not ( = ?auto_90136 ?auto_90138 ) ) ( not ( = ?auto_90136 ?auto_90139 ) ) ( not ( = ?auto_90137 ?auto_90138 ) ) ( not ( = ?auto_90137 ?auto_90139 ) ) ( not ( = ?auto_90138 ?auto_90139 ) ) ( HOLDING ?auto_90140 ) ( not ( = ?auto_90134 ?auto_90140 ) ) ( not ( = ?auto_90135 ?auto_90140 ) ) ( not ( = ?auto_90136 ?auto_90140 ) ) ( not ( = ?auto_90137 ?auto_90140 ) ) ( not ( = ?auto_90138 ?auto_90140 ) ) ( not ( = ?auto_90139 ?auto_90140 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_90140 )
      ( MAKE-5PILE ?auto_90134 ?auto_90135 ?auto_90136 ?auto_90137 ?auto_90138 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90231 - BLOCK
      ?auto_90232 - BLOCK
    )
    :vars
    (
      ?auto_90233 - BLOCK
      ?auto_90235 - BLOCK
      ?auto_90234 - BLOCK
      ?auto_90236 - BLOCK
      ?auto_90237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90231 ?auto_90232 ) ) ( ON ?auto_90232 ?auto_90233 ) ( not ( = ?auto_90231 ?auto_90233 ) ) ( not ( = ?auto_90232 ?auto_90233 ) ) ( ON ?auto_90231 ?auto_90232 ) ( CLEAR ?auto_90231 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90235 ) ( ON ?auto_90234 ?auto_90235 ) ( ON ?auto_90236 ?auto_90234 ) ( ON ?auto_90237 ?auto_90236 ) ( ON ?auto_90233 ?auto_90237 ) ( not ( = ?auto_90235 ?auto_90234 ) ) ( not ( = ?auto_90235 ?auto_90236 ) ) ( not ( = ?auto_90235 ?auto_90237 ) ) ( not ( = ?auto_90235 ?auto_90233 ) ) ( not ( = ?auto_90235 ?auto_90232 ) ) ( not ( = ?auto_90235 ?auto_90231 ) ) ( not ( = ?auto_90234 ?auto_90236 ) ) ( not ( = ?auto_90234 ?auto_90237 ) ) ( not ( = ?auto_90234 ?auto_90233 ) ) ( not ( = ?auto_90234 ?auto_90232 ) ) ( not ( = ?auto_90234 ?auto_90231 ) ) ( not ( = ?auto_90236 ?auto_90237 ) ) ( not ( = ?auto_90236 ?auto_90233 ) ) ( not ( = ?auto_90236 ?auto_90232 ) ) ( not ( = ?auto_90236 ?auto_90231 ) ) ( not ( = ?auto_90237 ?auto_90233 ) ) ( not ( = ?auto_90237 ?auto_90232 ) ) ( not ( = ?auto_90237 ?auto_90231 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90235 ?auto_90234 ?auto_90236 ?auto_90237 ?auto_90233 ?auto_90232 )
      ( MAKE-2PILE ?auto_90231 ?auto_90232 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90240 - BLOCK
      ?auto_90241 - BLOCK
    )
    :vars
    (
      ?auto_90242 - BLOCK
      ?auto_90243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90240 ?auto_90241 ) ) ( ON ?auto_90241 ?auto_90242 ) ( CLEAR ?auto_90241 ) ( not ( = ?auto_90240 ?auto_90242 ) ) ( not ( = ?auto_90241 ?auto_90242 ) ) ( ON ?auto_90240 ?auto_90243 ) ( CLEAR ?auto_90240 ) ( HAND-EMPTY ) ( not ( = ?auto_90240 ?auto_90243 ) ) ( not ( = ?auto_90241 ?auto_90243 ) ) ( not ( = ?auto_90242 ?auto_90243 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90240 ?auto_90243 )
      ( MAKE-2PILE ?auto_90240 ?auto_90241 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90244 - BLOCK
      ?auto_90245 - BLOCK
    )
    :vars
    (
      ?auto_90246 - BLOCK
      ?auto_90247 - BLOCK
      ?auto_90249 - BLOCK
      ?auto_90248 - BLOCK
      ?auto_90250 - BLOCK
      ?auto_90251 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90244 ?auto_90245 ) ) ( not ( = ?auto_90244 ?auto_90246 ) ) ( not ( = ?auto_90245 ?auto_90246 ) ) ( ON ?auto_90244 ?auto_90247 ) ( CLEAR ?auto_90244 ) ( not ( = ?auto_90244 ?auto_90247 ) ) ( not ( = ?auto_90245 ?auto_90247 ) ) ( not ( = ?auto_90246 ?auto_90247 ) ) ( HOLDING ?auto_90245 ) ( CLEAR ?auto_90246 ) ( ON-TABLE ?auto_90249 ) ( ON ?auto_90248 ?auto_90249 ) ( ON ?auto_90250 ?auto_90248 ) ( ON ?auto_90251 ?auto_90250 ) ( ON ?auto_90246 ?auto_90251 ) ( not ( = ?auto_90249 ?auto_90248 ) ) ( not ( = ?auto_90249 ?auto_90250 ) ) ( not ( = ?auto_90249 ?auto_90251 ) ) ( not ( = ?auto_90249 ?auto_90246 ) ) ( not ( = ?auto_90249 ?auto_90245 ) ) ( not ( = ?auto_90248 ?auto_90250 ) ) ( not ( = ?auto_90248 ?auto_90251 ) ) ( not ( = ?auto_90248 ?auto_90246 ) ) ( not ( = ?auto_90248 ?auto_90245 ) ) ( not ( = ?auto_90250 ?auto_90251 ) ) ( not ( = ?auto_90250 ?auto_90246 ) ) ( not ( = ?auto_90250 ?auto_90245 ) ) ( not ( = ?auto_90251 ?auto_90246 ) ) ( not ( = ?auto_90251 ?auto_90245 ) ) ( not ( = ?auto_90244 ?auto_90249 ) ) ( not ( = ?auto_90244 ?auto_90248 ) ) ( not ( = ?auto_90244 ?auto_90250 ) ) ( not ( = ?auto_90244 ?auto_90251 ) ) ( not ( = ?auto_90247 ?auto_90249 ) ) ( not ( = ?auto_90247 ?auto_90248 ) ) ( not ( = ?auto_90247 ?auto_90250 ) ) ( not ( = ?auto_90247 ?auto_90251 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90249 ?auto_90248 ?auto_90250 ?auto_90251 ?auto_90246 ?auto_90245 )
      ( MAKE-2PILE ?auto_90244 ?auto_90245 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90252 - BLOCK
      ?auto_90253 - BLOCK
    )
    :vars
    (
      ?auto_90259 - BLOCK
      ?auto_90257 - BLOCK
      ?auto_90258 - BLOCK
      ?auto_90256 - BLOCK
      ?auto_90254 - BLOCK
      ?auto_90255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90252 ?auto_90253 ) ) ( not ( = ?auto_90252 ?auto_90259 ) ) ( not ( = ?auto_90253 ?auto_90259 ) ) ( ON ?auto_90252 ?auto_90257 ) ( not ( = ?auto_90252 ?auto_90257 ) ) ( not ( = ?auto_90253 ?auto_90257 ) ) ( not ( = ?auto_90259 ?auto_90257 ) ) ( CLEAR ?auto_90259 ) ( ON-TABLE ?auto_90258 ) ( ON ?auto_90256 ?auto_90258 ) ( ON ?auto_90254 ?auto_90256 ) ( ON ?auto_90255 ?auto_90254 ) ( ON ?auto_90259 ?auto_90255 ) ( not ( = ?auto_90258 ?auto_90256 ) ) ( not ( = ?auto_90258 ?auto_90254 ) ) ( not ( = ?auto_90258 ?auto_90255 ) ) ( not ( = ?auto_90258 ?auto_90259 ) ) ( not ( = ?auto_90258 ?auto_90253 ) ) ( not ( = ?auto_90256 ?auto_90254 ) ) ( not ( = ?auto_90256 ?auto_90255 ) ) ( not ( = ?auto_90256 ?auto_90259 ) ) ( not ( = ?auto_90256 ?auto_90253 ) ) ( not ( = ?auto_90254 ?auto_90255 ) ) ( not ( = ?auto_90254 ?auto_90259 ) ) ( not ( = ?auto_90254 ?auto_90253 ) ) ( not ( = ?auto_90255 ?auto_90259 ) ) ( not ( = ?auto_90255 ?auto_90253 ) ) ( not ( = ?auto_90252 ?auto_90258 ) ) ( not ( = ?auto_90252 ?auto_90256 ) ) ( not ( = ?auto_90252 ?auto_90254 ) ) ( not ( = ?auto_90252 ?auto_90255 ) ) ( not ( = ?auto_90257 ?auto_90258 ) ) ( not ( = ?auto_90257 ?auto_90256 ) ) ( not ( = ?auto_90257 ?auto_90254 ) ) ( not ( = ?auto_90257 ?auto_90255 ) ) ( ON ?auto_90253 ?auto_90252 ) ( CLEAR ?auto_90253 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90257 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90257 ?auto_90252 )
      ( MAKE-2PILE ?auto_90252 ?auto_90253 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90260 - BLOCK
      ?auto_90261 - BLOCK
    )
    :vars
    (
      ?auto_90267 - BLOCK
      ?auto_90265 - BLOCK
      ?auto_90266 - BLOCK
      ?auto_90262 - BLOCK
      ?auto_90263 - BLOCK
      ?auto_90264 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90260 ?auto_90261 ) ) ( not ( = ?auto_90260 ?auto_90267 ) ) ( not ( = ?auto_90261 ?auto_90267 ) ) ( ON ?auto_90260 ?auto_90265 ) ( not ( = ?auto_90260 ?auto_90265 ) ) ( not ( = ?auto_90261 ?auto_90265 ) ) ( not ( = ?auto_90267 ?auto_90265 ) ) ( ON-TABLE ?auto_90266 ) ( ON ?auto_90262 ?auto_90266 ) ( ON ?auto_90263 ?auto_90262 ) ( ON ?auto_90264 ?auto_90263 ) ( not ( = ?auto_90266 ?auto_90262 ) ) ( not ( = ?auto_90266 ?auto_90263 ) ) ( not ( = ?auto_90266 ?auto_90264 ) ) ( not ( = ?auto_90266 ?auto_90267 ) ) ( not ( = ?auto_90266 ?auto_90261 ) ) ( not ( = ?auto_90262 ?auto_90263 ) ) ( not ( = ?auto_90262 ?auto_90264 ) ) ( not ( = ?auto_90262 ?auto_90267 ) ) ( not ( = ?auto_90262 ?auto_90261 ) ) ( not ( = ?auto_90263 ?auto_90264 ) ) ( not ( = ?auto_90263 ?auto_90267 ) ) ( not ( = ?auto_90263 ?auto_90261 ) ) ( not ( = ?auto_90264 ?auto_90267 ) ) ( not ( = ?auto_90264 ?auto_90261 ) ) ( not ( = ?auto_90260 ?auto_90266 ) ) ( not ( = ?auto_90260 ?auto_90262 ) ) ( not ( = ?auto_90260 ?auto_90263 ) ) ( not ( = ?auto_90260 ?auto_90264 ) ) ( not ( = ?auto_90265 ?auto_90266 ) ) ( not ( = ?auto_90265 ?auto_90262 ) ) ( not ( = ?auto_90265 ?auto_90263 ) ) ( not ( = ?auto_90265 ?auto_90264 ) ) ( ON ?auto_90261 ?auto_90260 ) ( CLEAR ?auto_90261 ) ( ON-TABLE ?auto_90265 ) ( HOLDING ?auto_90267 ) ( CLEAR ?auto_90264 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90266 ?auto_90262 ?auto_90263 ?auto_90264 ?auto_90267 )
      ( MAKE-2PILE ?auto_90260 ?auto_90261 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90268 - BLOCK
      ?auto_90269 - BLOCK
    )
    :vars
    (
      ?auto_90270 - BLOCK
      ?auto_90273 - BLOCK
      ?auto_90275 - BLOCK
      ?auto_90271 - BLOCK
      ?auto_90274 - BLOCK
      ?auto_90272 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90268 ?auto_90269 ) ) ( not ( = ?auto_90268 ?auto_90270 ) ) ( not ( = ?auto_90269 ?auto_90270 ) ) ( ON ?auto_90268 ?auto_90273 ) ( not ( = ?auto_90268 ?auto_90273 ) ) ( not ( = ?auto_90269 ?auto_90273 ) ) ( not ( = ?auto_90270 ?auto_90273 ) ) ( ON-TABLE ?auto_90275 ) ( ON ?auto_90271 ?auto_90275 ) ( ON ?auto_90274 ?auto_90271 ) ( ON ?auto_90272 ?auto_90274 ) ( not ( = ?auto_90275 ?auto_90271 ) ) ( not ( = ?auto_90275 ?auto_90274 ) ) ( not ( = ?auto_90275 ?auto_90272 ) ) ( not ( = ?auto_90275 ?auto_90270 ) ) ( not ( = ?auto_90275 ?auto_90269 ) ) ( not ( = ?auto_90271 ?auto_90274 ) ) ( not ( = ?auto_90271 ?auto_90272 ) ) ( not ( = ?auto_90271 ?auto_90270 ) ) ( not ( = ?auto_90271 ?auto_90269 ) ) ( not ( = ?auto_90274 ?auto_90272 ) ) ( not ( = ?auto_90274 ?auto_90270 ) ) ( not ( = ?auto_90274 ?auto_90269 ) ) ( not ( = ?auto_90272 ?auto_90270 ) ) ( not ( = ?auto_90272 ?auto_90269 ) ) ( not ( = ?auto_90268 ?auto_90275 ) ) ( not ( = ?auto_90268 ?auto_90271 ) ) ( not ( = ?auto_90268 ?auto_90274 ) ) ( not ( = ?auto_90268 ?auto_90272 ) ) ( not ( = ?auto_90273 ?auto_90275 ) ) ( not ( = ?auto_90273 ?auto_90271 ) ) ( not ( = ?auto_90273 ?auto_90274 ) ) ( not ( = ?auto_90273 ?auto_90272 ) ) ( ON ?auto_90269 ?auto_90268 ) ( ON-TABLE ?auto_90273 ) ( CLEAR ?auto_90272 ) ( ON ?auto_90270 ?auto_90269 ) ( CLEAR ?auto_90270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90273 ?auto_90268 ?auto_90269 )
      ( MAKE-2PILE ?auto_90268 ?auto_90269 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90276 - BLOCK
      ?auto_90277 - BLOCK
    )
    :vars
    (
      ?auto_90279 - BLOCK
      ?auto_90280 - BLOCK
      ?auto_90281 - BLOCK
      ?auto_90278 - BLOCK
      ?auto_90282 - BLOCK
      ?auto_90283 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90276 ?auto_90277 ) ) ( not ( = ?auto_90276 ?auto_90279 ) ) ( not ( = ?auto_90277 ?auto_90279 ) ) ( ON ?auto_90276 ?auto_90280 ) ( not ( = ?auto_90276 ?auto_90280 ) ) ( not ( = ?auto_90277 ?auto_90280 ) ) ( not ( = ?auto_90279 ?auto_90280 ) ) ( ON-TABLE ?auto_90281 ) ( ON ?auto_90278 ?auto_90281 ) ( ON ?auto_90282 ?auto_90278 ) ( not ( = ?auto_90281 ?auto_90278 ) ) ( not ( = ?auto_90281 ?auto_90282 ) ) ( not ( = ?auto_90281 ?auto_90283 ) ) ( not ( = ?auto_90281 ?auto_90279 ) ) ( not ( = ?auto_90281 ?auto_90277 ) ) ( not ( = ?auto_90278 ?auto_90282 ) ) ( not ( = ?auto_90278 ?auto_90283 ) ) ( not ( = ?auto_90278 ?auto_90279 ) ) ( not ( = ?auto_90278 ?auto_90277 ) ) ( not ( = ?auto_90282 ?auto_90283 ) ) ( not ( = ?auto_90282 ?auto_90279 ) ) ( not ( = ?auto_90282 ?auto_90277 ) ) ( not ( = ?auto_90283 ?auto_90279 ) ) ( not ( = ?auto_90283 ?auto_90277 ) ) ( not ( = ?auto_90276 ?auto_90281 ) ) ( not ( = ?auto_90276 ?auto_90278 ) ) ( not ( = ?auto_90276 ?auto_90282 ) ) ( not ( = ?auto_90276 ?auto_90283 ) ) ( not ( = ?auto_90280 ?auto_90281 ) ) ( not ( = ?auto_90280 ?auto_90278 ) ) ( not ( = ?auto_90280 ?auto_90282 ) ) ( not ( = ?auto_90280 ?auto_90283 ) ) ( ON ?auto_90277 ?auto_90276 ) ( ON-TABLE ?auto_90280 ) ( ON ?auto_90279 ?auto_90277 ) ( CLEAR ?auto_90279 ) ( HOLDING ?auto_90283 ) ( CLEAR ?auto_90282 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90281 ?auto_90278 ?auto_90282 ?auto_90283 )
      ( MAKE-2PILE ?auto_90276 ?auto_90277 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90284 - BLOCK
      ?auto_90285 - BLOCK
    )
    :vars
    (
      ?auto_90289 - BLOCK
      ?auto_90291 - BLOCK
      ?auto_90290 - BLOCK
      ?auto_90288 - BLOCK
      ?auto_90286 - BLOCK
      ?auto_90287 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90284 ?auto_90285 ) ) ( not ( = ?auto_90284 ?auto_90289 ) ) ( not ( = ?auto_90285 ?auto_90289 ) ) ( ON ?auto_90284 ?auto_90291 ) ( not ( = ?auto_90284 ?auto_90291 ) ) ( not ( = ?auto_90285 ?auto_90291 ) ) ( not ( = ?auto_90289 ?auto_90291 ) ) ( ON-TABLE ?auto_90290 ) ( ON ?auto_90288 ?auto_90290 ) ( ON ?auto_90286 ?auto_90288 ) ( not ( = ?auto_90290 ?auto_90288 ) ) ( not ( = ?auto_90290 ?auto_90286 ) ) ( not ( = ?auto_90290 ?auto_90287 ) ) ( not ( = ?auto_90290 ?auto_90289 ) ) ( not ( = ?auto_90290 ?auto_90285 ) ) ( not ( = ?auto_90288 ?auto_90286 ) ) ( not ( = ?auto_90288 ?auto_90287 ) ) ( not ( = ?auto_90288 ?auto_90289 ) ) ( not ( = ?auto_90288 ?auto_90285 ) ) ( not ( = ?auto_90286 ?auto_90287 ) ) ( not ( = ?auto_90286 ?auto_90289 ) ) ( not ( = ?auto_90286 ?auto_90285 ) ) ( not ( = ?auto_90287 ?auto_90289 ) ) ( not ( = ?auto_90287 ?auto_90285 ) ) ( not ( = ?auto_90284 ?auto_90290 ) ) ( not ( = ?auto_90284 ?auto_90288 ) ) ( not ( = ?auto_90284 ?auto_90286 ) ) ( not ( = ?auto_90284 ?auto_90287 ) ) ( not ( = ?auto_90291 ?auto_90290 ) ) ( not ( = ?auto_90291 ?auto_90288 ) ) ( not ( = ?auto_90291 ?auto_90286 ) ) ( not ( = ?auto_90291 ?auto_90287 ) ) ( ON ?auto_90285 ?auto_90284 ) ( ON-TABLE ?auto_90291 ) ( ON ?auto_90289 ?auto_90285 ) ( CLEAR ?auto_90286 ) ( ON ?auto_90287 ?auto_90289 ) ( CLEAR ?auto_90287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90291 ?auto_90284 ?auto_90285 ?auto_90289 )
      ( MAKE-2PILE ?auto_90284 ?auto_90285 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90292 - BLOCK
      ?auto_90293 - BLOCK
    )
    :vars
    (
      ?auto_90295 - BLOCK
      ?auto_90299 - BLOCK
      ?auto_90296 - BLOCK
      ?auto_90297 - BLOCK
      ?auto_90294 - BLOCK
      ?auto_90298 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90292 ?auto_90293 ) ) ( not ( = ?auto_90292 ?auto_90295 ) ) ( not ( = ?auto_90293 ?auto_90295 ) ) ( ON ?auto_90292 ?auto_90299 ) ( not ( = ?auto_90292 ?auto_90299 ) ) ( not ( = ?auto_90293 ?auto_90299 ) ) ( not ( = ?auto_90295 ?auto_90299 ) ) ( ON-TABLE ?auto_90296 ) ( ON ?auto_90297 ?auto_90296 ) ( not ( = ?auto_90296 ?auto_90297 ) ) ( not ( = ?auto_90296 ?auto_90294 ) ) ( not ( = ?auto_90296 ?auto_90298 ) ) ( not ( = ?auto_90296 ?auto_90295 ) ) ( not ( = ?auto_90296 ?auto_90293 ) ) ( not ( = ?auto_90297 ?auto_90294 ) ) ( not ( = ?auto_90297 ?auto_90298 ) ) ( not ( = ?auto_90297 ?auto_90295 ) ) ( not ( = ?auto_90297 ?auto_90293 ) ) ( not ( = ?auto_90294 ?auto_90298 ) ) ( not ( = ?auto_90294 ?auto_90295 ) ) ( not ( = ?auto_90294 ?auto_90293 ) ) ( not ( = ?auto_90298 ?auto_90295 ) ) ( not ( = ?auto_90298 ?auto_90293 ) ) ( not ( = ?auto_90292 ?auto_90296 ) ) ( not ( = ?auto_90292 ?auto_90297 ) ) ( not ( = ?auto_90292 ?auto_90294 ) ) ( not ( = ?auto_90292 ?auto_90298 ) ) ( not ( = ?auto_90299 ?auto_90296 ) ) ( not ( = ?auto_90299 ?auto_90297 ) ) ( not ( = ?auto_90299 ?auto_90294 ) ) ( not ( = ?auto_90299 ?auto_90298 ) ) ( ON ?auto_90293 ?auto_90292 ) ( ON-TABLE ?auto_90299 ) ( ON ?auto_90295 ?auto_90293 ) ( ON ?auto_90298 ?auto_90295 ) ( CLEAR ?auto_90298 ) ( HOLDING ?auto_90294 ) ( CLEAR ?auto_90297 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90296 ?auto_90297 ?auto_90294 )
      ( MAKE-2PILE ?auto_90292 ?auto_90293 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90300 - BLOCK
      ?auto_90301 - BLOCK
    )
    :vars
    (
      ?auto_90302 - BLOCK
      ?auto_90307 - BLOCK
      ?auto_90305 - BLOCK
      ?auto_90306 - BLOCK
      ?auto_90304 - BLOCK
      ?auto_90303 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90300 ?auto_90301 ) ) ( not ( = ?auto_90300 ?auto_90302 ) ) ( not ( = ?auto_90301 ?auto_90302 ) ) ( ON ?auto_90300 ?auto_90307 ) ( not ( = ?auto_90300 ?auto_90307 ) ) ( not ( = ?auto_90301 ?auto_90307 ) ) ( not ( = ?auto_90302 ?auto_90307 ) ) ( ON-TABLE ?auto_90305 ) ( ON ?auto_90306 ?auto_90305 ) ( not ( = ?auto_90305 ?auto_90306 ) ) ( not ( = ?auto_90305 ?auto_90304 ) ) ( not ( = ?auto_90305 ?auto_90303 ) ) ( not ( = ?auto_90305 ?auto_90302 ) ) ( not ( = ?auto_90305 ?auto_90301 ) ) ( not ( = ?auto_90306 ?auto_90304 ) ) ( not ( = ?auto_90306 ?auto_90303 ) ) ( not ( = ?auto_90306 ?auto_90302 ) ) ( not ( = ?auto_90306 ?auto_90301 ) ) ( not ( = ?auto_90304 ?auto_90303 ) ) ( not ( = ?auto_90304 ?auto_90302 ) ) ( not ( = ?auto_90304 ?auto_90301 ) ) ( not ( = ?auto_90303 ?auto_90302 ) ) ( not ( = ?auto_90303 ?auto_90301 ) ) ( not ( = ?auto_90300 ?auto_90305 ) ) ( not ( = ?auto_90300 ?auto_90306 ) ) ( not ( = ?auto_90300 ?auto_90304 ) ) ( not ( = ?auto_90300 ?auto_90303 ) ) ( not ( = ?auto_90307 ?auto_90305 ) ) ( not ( = ?auto_90307 ?auto_90306 ) ) ( not ( = ?auto_90307 ?auto_90304 ) ) ( not ( = ?auto_90307 ?auto_90303 ) ) ( ON ?auto_90301 ?auto_90300 ) ( ON-TABLE ?auto_90307 ) ( ON ?auto_90302 ?auto_90301 ) ( ON ?auto_90303 ?auto_90302 ) ( CLEAR ?auto_90306 ) ( ON ?auto_90304 ?auto_90303 ) ( CLEAR ?auto_90304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90307 ?auto_90300 ?auto_90301 ?auto_90302 ?auto_90303 )
      ( MAKE-2PILE ?auto_90300 ?auto_90301 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90308 - BLOCK
      ?auto_90309 - BLOCK
    )
    :vars
    (
      ?auto_90311 - BLOCK
      ?auto_90313 - BLOCK
      ?auto_90310 - BLOCK
      ?auto_90315 - BLOCK
      ?auto_90314 - BLOCK
      ?auto_90312 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90308 ?auto_90309 ) ) ( not ( = ?auto_90308 ?auto_90311 ) ) ( not ( = ?auto_90309 ?auto_90311 ) ) ( ON ?auto_90308 ?auto_90313 ) ( not ( = ?auto_90308 ?auto_90313 ) ) ( not ( = ?auto_90309 ?auto_90313 ) ) ( not ( = ?auto_90311 ?auto_90313 ) ) ( ON-TABLE ?auto_90310 ) ( not ( = ?auto_90310 ?auto_90315 ) ) ( not ( = ?auto_90310 ?auto_90314 ) ) ( not ( = ?auto_90310 ?auto_90312 ) ) ( not ( = ?auto_90310 ?auto_90311 ) ) ( not ( = ?auto_90310 ?auto_90309 ) ) ( not ( = ?auto_90315 ?auto_90314 ) ) ( not ( = ?auto_90315 ?auto_90312 ) ) ( not ( = ?auto_90315 ?auto_90311 ) ) ( not ( = ?auto_90315 ?auto_90309 ) ) ( not ( = ?auto_90314 ?auto_90312 ) ) ( not ( = ?auto_90314 ?auto_90311 ) ) ( not ( = ?auto_90314 ?auto_90309 ) ) ( not ( = ?auto_90312 ?auto_90311 ) ) ( not ( = ?auto_90312 ?auto_90309 ) ) ( not ( = ?auto_90308 ?auto_90310 ) ) ( not ( = ?auto_90308 ?auto_90315 ) ) ( not ( = ?auto_90308 ?auto_90314 ) ) ( not ( = ?auto_90308 ?auto_90312 ) ) ( not ( = ?auto_90313 ?auto_90310 ) ) ( not ( = ?auto_90313 ?auto_90315 ) ) ( not ( = ?auto_90313 ?auto_90314 ) ) ( not ( = ?auto_90313 ?auto_90312 ) ) ( ON ?auto_90309 ?auto_90308 ) ( ON-TABLE ?auto_90313 ) ( ON ?auto_90311 ?auto_90309 ) ( ON ?auto_90312 ?auto_90311 ) ( ON ?auto_90314 ?auto_90312 ) ( CLEAR ?auto_90314 ) ( HOLDING ?auto_90315 ) ( CLEAR ?auto_90310 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90310 ?auto_90315 )
      ( MAKE-2PILE ?auto_90308 ?auto_90309 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90316 - BLOCK
      ?auto_90317 - BLOCK
    )
    :vars
    (
      ?auto_90323 - BLOCK
      ?auto_90322 - BLOCK
      ?auto_90321 - BLOCK
      ?auto_90320 - BLOCK
      ?auto_90318 - BLOCK
      ?auto_90319 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90316 ?auto_90317 ) ) ( not ( = ?auto_90316 ?auto_90323 ) ) ( not ( = ?auto_90317 ?auto_90323 ) ) ( ON ?auto_90316 ?auto_90322 ) ( not ( = ?auto_90316 ?auto_90322 ) ) ( not ( = ?auto_90317 ?auto_90322 ) ) ( not ( = ?auto_90323 ?auto_90322 ) ) ( ON-TABLE ?auto_90321 ) ( not ( = ?auto_90321 ?auto_90320 ) ) ( not ( = ?auto_90321 ?auto_90318 ) ) ( not ( = ?auto_90321 ?auto_90319 ) ) ( not ( = ?auto_90321 ?auto_90323 ) ) ( not ( = ?auto_90321 ?auto_90317 ) ) ( not ( = ?auto_90320 ?auto_90318 ) ) ( not ( = ?auto_90320 ?auto_90319 ) ) ( not ( = ?auto_90320 ?auto_90323 ) ) ( not ( = ?auto_90320 ?auto_90317 ) ) ( not ( = ?auto_90318 ?auto_90319 ) ) ( not ( = ?auto_90318 ?auto_90323 ) ) ( not ( = ?auto_90318 ?auto_90317 ) ) ( not ( = ?auto_90319 ?auto_90323 ) ) ( not ( = ?auto_90319 ?auto_90317 ) ) ( not ( = ?auto_90316 ?auto_90321 ) ) ( not ( = ?auto_90316 ?auto_90320 ) ) ( not ( = ?auto_90316 ?auto_90318 ) ) ( not ( = ?auto_90316 ?auto_90319 ) ) ( not ( = ?auto_90322 ?auto_90321 ) ) ( not ( = ?auto_90322 ?auto_90320 ) ) ( not ( = ?auto_90322 ?auto_90318 ) ) ( not ( = ?auto_90322 ?auto_90319 ) ) ( ON ?auto_90317 ?auto_90316 ) ( ON-TABLE ?auto_90322 ) ( ON ?auto_90323 ?auto_90317 ) ( ON ?auto_90319 ?auto_90323 ) ( ON ?auto_90318 ?auto_90319 ) ( CLEAR ?auto_90321 ) ( ON ?auto_90320 ?auto_90318 ) ( CLEAR ?auto_90320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90322 ?auto_90316 ?auto_90317 ?auto_90323 ?auto_90319 ?auto_90318 )
      ( MAKE-2PILE ?auto_90316 ?auto_90317 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90324 - BLOCK
      ?auto_90325 - BLOCK
    )
    :vars
    (
      ?auto_90328 - BLOCK
      ?auto_90329 - BLOCK
      ?auto_90330 - BLOCK
      ?auto_90327 - BLOCK
      ?auto_90331 - BLOCK
      ?auto_90326 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90324 ?auto_90325 ) ) ( not ( = ?auto_90324 ?auto_90328 ) ) ( not ( = ?auto_90325 ?auto_90328 ) ) ( ON ?auto_90324 ?auto_90329 ) ( not ( = ?auto_90324 ?auto_90329 ) ) ( not ( = ?auto_90325 ?auto_90329 ) ) ( not ( = ?auto_90328 ?auto_90329 ) ) ( not ( = ?auto_90330 ?auto_90327 ) ) ( not ( = ?auto_90330 ?auto_90331 ) ) ( not ( = ?auto_90330 ?auto_90326 ) ) ( not ( = ?auto_90330 ?auto_90328 ) ) ( not ( = ?auto_90330 ?auto_90325 ) ) ( not ( = ?auto_90327 ?auto_90331 ) ) ( not ( = ?auto_90327 ?auto_90326 ) ) ( not ( = ?auto_90327 ?auto_90328 ) ) ( not ( = ?auto_90327 ?auto_90325 ) ) ( not ( = ?auto_90331 ?auto_90326 ) ) ( not ( = ?auto_90331 ?auto_90328 ) ) ( not ( = ?auto_90331 ?auto_90325 ) ) ( not ( = ?auto_90326 ?auto_90328 ) ) ( not ( = ?auto_90326 ?auto_90325 ) ) ( not ( = ?auto_90324 ?auto_90330 ) ) ( not ( = ?auto_90324 ?auto_90327 ) ) ( not ( = ?auto_90324 ?auto_90331 ) ) ( not ( = ?auto_90324 ?auto_90326 ) ) ( not ( = ?auto_90329 ?auto_90330 ) ) ( not ( = ?auto_90329 ?auto_90327 ) ) ( not ( = ?auto_90329 ?auto_90331 ) ) ( not ( = ?auto_90329 ?auto_90326 ) ) ( ON ?auto_90325 ?auto_90324 ) ( ON-TABLE ?auto_90329 ) ( ON ?auto_90328 ?auto_90325 ) ( ON ?auto_90326 ?auto_90328 ) ( ON ?auto_90331 ?auto_90326 ) ( ON ?auto_90327 ?auto_90331 ) ( CLEAR ?auto_90327 ) ( HOLDING ?auto_90330 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90330 )
      ( MAKE-2PILE ?auto_90324 ?auto_90325 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90332 - BLOCK
      ?auto_90333 - BLOCK
    )
    :vars
    (
      ?auto_90337 - BLOCK
      ?auto_90339 - BLOCK
      ?auto_90336 - BLOCK
      ?auto_90338 - BLOCK
      ?auto_90334 - BLOCK
      ?auto_90335 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90332 ?auto_90333 ) ) ( not ( = ?auto_90332 ?auto_90337 ) ) ( not ( = ?auto_90333 ?auto_90337 ) ) ( ON ?auto_90332 ?auto_90339 ) ( not ( = ?auto_90332 ?auto_90339 ) ) ( not ( = ?auto_90333 ?auto_90339 ) ) ( not ( = ?auto_90337 ?auto_90339 ) ) ( not ( = ?auto_90336 ?auto_90338 ) ) ( not ( = ?auto_90336 ?auto_90334 ) ) ( not ( = ?auto_90336 ?auto_90335 ) ) ( not ( = ?auto_90336 ?auto_90337 ) ) ( not ( = ?auto_90336 ?auto_90333 ) ) ( not ( = ?auto_90338 ?auto_90334 ) ) ( not ( = ?auto_90338 ?auto_90335 ) ) ( not ( = ?auto_90338 ?auto_90337 ) ) ( not ( = ?auto_90338 ?auto_90333 ) ) ( not ( = ?auto_90334 ?auto_90335 ) ) ( not ( = ?auto_90334 ?auto_90337 ) ) ( not ( = ?auto_90334 ?auto_90333 ) ) ( not ( = ?auto_90335 ?auto_90337 ) ) ( not ( = ?auto_90335 ?auto_90333 ) ) ( not ( = ?auto_90332 ?auto_90336 ) ) ( not ( = ?auto_90332 ?auto_90338 ) ) ( not ( = ?auto_90332 ?auto_90334 ) ) ( not ( = ?auto_90332 ?auto_90335 ) ) ( not ( = ?auto_90339 ?auto_90336 ) ) ( not ( = ?auto_90339 ?auto_90338 ) ) ( not ( = ?auto_90339 ?auto_90334 ) ) ( not ( = ?auto_90339 ?auto_90335 ) ) ( ON ?auto_90333 ?auto_90332 ) ( ON-TABLE ?auto_90339 ) ( ON ?auto_90337 ?auto_90333 ) ( ON ?auto_90335 ?auto_90337 ) ( ON ?auto_90334 ?auto_90335 ) ( ON ?auto_90338 ?auto_90334 ) ( ON ?auto_90336 ?auto_90338 ) ( CLEAR ?auto_90336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_90339 ?auto_90332 ?auto_90333 ?auto_90337 ?auto_90335 ?auto_90334 ?auto_90338 )
      ( MAKE-2PILE ?auto_90332 ?auto_90333 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90363 - BLOCK
      ?auto_90364 - BLOCK
      ?auto_90365 - BLOCK
      ?auto_90366 - BLOCK
    )
    :vars
    (
      ?auto_90367 - BLOCK
      ?auto_90369 - BLOCK
      ?auto_90368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90367 ?auto_90366 ) ( ON-TABLE ?auto_90363 ) ( ON ?auto_90364 ?auto_90363 ) ( ON ?auto_90365 ?auto_90364 ) ( ON ?auto_90366 ?auto_90365 ) ( not ( = ?auto_90363 ?auto_90364 ) ) ( not ( = ?auto_90363 ?auto_90365 ) ) ( not ( = ?auto_90363 ?auto_90366 ) ) ( not ( = ?auto_90363 ?auto_90367 ) ) ( not ( = ?auto_90364 ?auto_90365 ) ) ( not ( = ?auto_90364 ?auto_90366 ) ) ( not ( = ?auto_90364 ?auto_90367 ) ) ( not ( = ?auto_90365 ?auto_90366 ) ) ( not ( = ?auto_90365 ?auto_90367 ) ) ( not ( = ?auto_90366 ?auto_90367 ) ) ( not ( = ?auto_90363 ?auto_90369 ) ) ( not ( = ?auto_90363 ?auto_90368 ) ) ( not ( = ?auto_90364 ?auto_90369 ) ) ( not ( = ?auto_90364 ?auto_90368 ) ) ( not ( = ?auto_90365 ?auto_90369 ) ) ( not ( = ?auto_90365 ?auto_90368 ) ) ( not ( = ?auto_90366 ?auto_90369 ) ) ( not ( = ?auto_90366 ?auto_90368 ) ) ( not ( = ?auto_90367 ?auto_90369 ) ) ( not ( = ?auto_90367 ?auto_90368 ) ) ( not ( = ?auto_90369 ?auto_90368 ) ) ( ON ?auto_90369 ?auto_90367 ) ( CLEAR ?auto_90369 ) ( HOLDING ?auto_90368 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90368 )
      ( MAKE-4PILE ?auto_90363 ?auto_90364 ?auto_90365 ?auto_90366 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90450 - BLOCK
      ?auto_90451 - BLOCK
      ?auto_90452 - BLOCK
    )
    :vars
    (
      ?auto_90453 - BLOCK
      ?auto_90456 - BLOCK
      ?auto_90454 - BLOCK
      ?auto_90455 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90450 ) ( not ( = ?auto_90450 ?auto_90451 ) ) ( not ( = ?auto_90450 ?auto_90452 ) ) ( not ( = ?auto_90451 ?auto_90452 ) ) ( ON ?auto_90452 ?auto_90453 ) ( not ( = ?auto_90450 ?auto_90453 ) ) ( not ( = ?auto_90451 ?auto_90453 ) ) ( not ( = ?auto_90452 ?auto_90453 ) ) ( CLEAR ?auto_90450 ) ( ON ?auto_90451 ?auto_90452 ) ( CLEAR ?auto_90451 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90456 ) ( ON ?auto_90454 ?auto_90456 ) ( ON ?auto_90455 ?auto_90454 ) ( ON ?auto_90453 ?auto_90455 ) ( not ( = ?auto_90456 ?auto_90454 ) ) ( not ( = ?auto_90456 ?auto_90455 ) ) ( not ( = ?auto_90456 ?auto_90453 ) ) ( not ( = ?auto_90456 ?auto_90452 ) ) ( not ( = ?auto_90456 ?auto_90451 ) ) ( not ( = ?auto_90454 ?auto_90455 ) ) ( not ( = ?auto_90454 ?auto_90453 ) ) ( not ( = ?auto_90454 ?auto_90452 ) ) ( not ( = ?auto_90454 ?auto_90451 ) ) ( not ( = ?auto_90455 ?auto_90453 ) ) ( not ( = ?auto_90455 ?auto_90452 ) ) ( not ( = ?auto_90455 ?auto_90451 ) ) ( not ( = ?auto_90450 ?auto_90456 ) ) ( not ( = ?auto_90450 ?auto_90454 ) ) ( not ( = ?auto_90450 ?auto_90455 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90456 ?auto_90454 ?auto_90455 ?auto_90453 ?auto_90452 )
      ( MAKE-3PILE ?auto_90450 ?auto_90451 ?auto_90452 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90457 - BLOCK
      ?auto_90458 - BLOCK
      ?auto_90459 - BLOCK
    )
    :vars
    (
      ?auto_90461 - BLOCK
      ?auto_90462 - BLOCK
      ?auto_90460 - BLOCK
      ?auto_90463 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90457 ?auto_90458 ) ) ( not ( = ?auto_90457 ?auto_90459 ) ) ( not ( = ?auto_90458 ?auto_90459 ) ) ( ON ?auto_90459 ?auto_90461 ) ( not ( = ?auto_90457 ?auto_90461 ) ) ( not ( = ?auto_90458 ?auto_90461 ) ) ( not ( = ?auto_90459 ?auto_90461 ) ) ( ON ?auto_90458 ?auto_90459 ) ( CLEAR ?auto_90458 ) ( ON-TABLE ?auto_90462 ) ( ON ?auto_90460 ?auto_90462 ) ( ON ?auto_90463 ?auto_90460 ) ( ON ?auto_90461 ?auto_90463 ) ( not ( = ?auto_90462 ?auto_90460 ) ) ( not ( = ?auto_90462 ?auto_90463 ) ) ( not ( = ?auto_90462 ?auto_90461 ) ) ( not ( = ?auto_90462 ?auto_90459 ) ) ( not ( = ?auto_90462 ?auto_90458 ) ) ( not ( = ?auto_90460 ?auto_90463 ) ) ( not ( = ?auto_90460 ?auto_90461 ) ) ( not ( = ?auto_90460 ?auto_90459 ) ) ( not ( = ?auto_90460 ?auto_90458 ) ) ( not ( = ?auto_90463 ?auto_90461 ) ) ( not ( = ?auto_90463 ?auto_90459 ) ) ( not ( = ?auto_90463 ?auto_90458 ) ) ( not ( = ?auto_90457 ?auto_90462 ) ) ( not ( = ?auto_90457 ?auto_90460 ) ) ( not ( = ?auto_90457 ?auto_90463 ) ) ( HOLDING ?auto_90457 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90457 )
      ( MAKE-3PILE ?auto_90457 ?auto_90458 ?auto_90459 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90464 - BLOCK
      ?auto_90465 - BLOCK
      ?auto_90466 - BLOCK
    )
    :vars
    (
      ?auto_90470 - BLOCK
      ?auto_90469 - BLOCK
      ?auto_90468 - BLOCK
      ?auto_90467 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90464 ?auto_90465 ) ) ( not ( = ?auto_90464 ?auto_90466 ) ) ( not ( = ?auto_90465 ?auto_90466 ) ) ( ON ?auto_90466 ?auto_90470 ) ( not ( = ?auto_90464 ?auto_90470 ) ) ( not ( = ?auto_90465 ?auto_90470 ) ) ( not ( = ?auto_90466 ?auto_90470 ) ) ( ON ?auto_90465 ?auto_90466 ) ( ON-TABLE ?auto_90469 ) ( ON ?auto_90468 ?auto_90469 ) ( ON ?auto_90467 ?auto_90468 ) ( ON ?auto_90470 ?auto_90467 ) ( not ( = ?auto_90469 ?auto_90468 ) ) ( not ( = ?auto_90469 ?auto_90467 ) ) ( not ( = ?auto_90469 ?auto_90470 ) ) ( not ( = ?auto_90469 ?auto_90466 ) ) ( not ( = ?auto_90469 ?auto_90465 ) ) ( not ( = ?auto_90468 ?auto_90467 ) ) ( not ( = ?auto_90468 ?auto_90470 ) ) ( not ( = ?auto_90468 ?auto_90466 ) ) ( not ( = ?auto_90468 ?auto_90465 ) ) ( not ( = ?auto_90467 ?auto_90470 ) ) ( not ( = ?auto_90467 ?auto_90466 ) ) ( not ( = ?auto_90467 ?auto_90465 ) ) ( not ( = ?auto_90464 ?auto_90469 ) ) ( not ( = ?auto_90464 ?auto_90468 ) ) ( not ( = ?auto_90464 ?auto_90467 ) ) ( ON ?auto_90464 ?auto_90465 ) ( CLEAR ?auto_90464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90469 ?auto_90468 ?auto_90467 ?auto_90470 ?auto_90466 ?auto_90465 )
      ( MAKE-3PILE ?auto_90464 ?auto_90465 ?auto_90466 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90474 - BLOCK
      ?auto_90475 - BLOCK
      ?auto_90476 - BLOCK
    )
    :vars
    (
      ?auto_90479 - BLOCK
      ?auto_90480 - BLOCK
      ?auto_90478 - BLOCK
      ?auto_90477 - BLOCK
      ?auto_90481 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90474 ?auto_90475 ) ) ( not ( = ?auto_90474 ?auto_90476 ) ) ( not ( = ?auto_90475 ?auto_90476 ) ) ( ON ?auto_90476 ?auto_90479 ) ( not ( = ?auto_90474 ?auto_90479 ) ) ( not ( = ?auto_90475 ?auto_90479 ) ) ( not ( = ?auto_90476 ?auto_90479 ) ) ( ON ?auto_90475 ?auto_90476 ) ( CLEAR ?auto_90475 ) ( ON-TABLE ?auto_90480 ) ( ON ?auto_90478 ?auto_90480 ) ( ON ?auto_90477 ?auto_90478 ) ( ON ?auto_90479 ?auto_90477 ) ( not ( = ?auto_90480 ?auto_90478 ) ) ( not ( = ?auto_90480 ?auto_90477 ) ) ( not ( = ?auto_90480 ?auto_90479 ) ) ( not ( = ?auto_90480 ?auto_90476 ) ) ( not ( = ?auto_90480 ?auto_90475 ) ) ( not ( = ?auto_90478 ?auto_90477 ) ) ( not ( = ?auto_90478 ?auto_90479 ) ) ( not ( = ?auto_90478 ?auto_90476 ) ) ( not ( = ?auto_90478 ?auto_90475 ) ) ( not ( = ?auto_90477 ?auto_90479 ) ) ( not ( = ?auto_90477 ?auto_90476 ) ) ( not ( = ?auto_90477 ?auto_90475 ) ) ( not ( = ?auto_90474 ?auto_90480 ) ) ( not ( = ?auto_90474 ?auto_90478 ) ) ( not ( = ?auto_90474 ?auto_90477 ) ) ( ON ?auto_90474 ?auto_90481 ) ( CLEAR ?auto_90474 ) ( HAND-EMPTY ) ( not ( = ?auto_90474 ?auto_90481 ) ) ( not ( = ?auto_90475 ?auto_90481 ) ) ( not ( = ?auto_90476 ?auto_90481 ) ) ( not ( = ?auto_90479 ?auto_90481 ) ) ( not ( = ?auto_90480 ?auto_90481 ) ) ( not ( = ?auto_90478 ?auto_90481 ) ) ( not ( = ?auto_90477 ?auto_90481 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90474 ?auto_90481 )
      ( MAKE-3PILE ?auto_90474 ?auto_90475 ?auto_90476 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90482 - BLOCK
      ?auto_90483 - BLOCK
      ?auto_90484 - BLOCK
    )
    :vars
    (
      ?auto_90485 - BLOCK
      ?auto_90487 - BLOCK
      ?auto_90488 - BLOCK
      ?auto_90486 - BLOCK
      ?auto_90489 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90482 ?auto_90483 ) ) ( not ( = ?auto_90482 ?auto_90484 ) ) ( not ( = ?auto_90483 ?auto_90484 ) ) ( ON ?auto_90484 ?auto_90485 ) ( not ( = ?auto_90482 ?auto_90485 ) ) ( not ( = ?auto_90483 ?auto_90485 ) ) ( not ( = ?auto_90484 ?auto_90485 ) ) ( ON-TABLE ?auto_90487 ) ( ON ?auto_90488 ?auto_90487 ) ( ON ?auto_90486 ?auto_90488 ) ( ON ?auto_90485 ?auto_90486 ) ( not ( = ?auto_90487 ?auto_90488 ) ) ( not ( = ?auto_90487 ?auto_90486 ) ) ( not ( = ?auto_90487 ?auto_90485 ) ) ( not ( = ?auto_90487 ?auto_90484 ) ) ( not ( = ?auto_90487 ?auto_90483 ) ) ( not ( = ?auto_90488 ?auto_90486 ) ) ( not ( = ?auto_90488 ?auto_90485 ) ) ( not ( = ?auto_90488 ?auto_90484 ) ) ( not ( = ?auto_90488 ?auto_90483 ) ) ( not ( = ?auto_90486 ?auto_90485 ) ) ( not ( = ?auto_90486 ?auto_90484 ) ) ( not ( = ?auto_90486 ?auto_90483 ) ) ( not ( = ?auto_90482 ?auto_90487 ) ) ( not ( = ?auto_90482 ?auto_90488 ) ) ( not ( = ?auto_90482 ?auto_90486 ) ) ( ON ?auto_90482 ?auto_90489 ) ( CLEAR ?auto_90482 ) ( not ( = ?auto_90482 ?auto_90489 ) ) ( not ( = ?auto_90483 ?auto_90489 ) ) ( not ( = ?auto_90484 ?auto_90489 ) ) ( not ( = ?auto_90485 ?auto_90489 ) ) ( not ( = ?auto_90487 ?auto_90489 ) ) ( not ( = ?auto_90488 ?auto_90489 ) ) ( not ( = ?auto_90486 ?auto_90489 ) ) ( HOLDING ?auto_90483 ) ( CLEAR ?auto_90484 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90487 ?auto_90488 ?auto_90486 ?auto_90485 ?auto_90484 ?auto_90483 )
      ( MAKE-3PILE ?auto_90482 ?auto_90483 ?auto_90484 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90490 - BLOCK
      ?auto_90491 - BLOCK
      ?auto_90492 - BLOCK
    )
    :vars
    (
      ?auto_90493 - BLOCK
      ?auto_90496 - BLOCK
      ?auto_90494 - BLOCK
      ?auto_90495 - BLOCK
      ?auto_90497 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90490 ?auto_90491 ) ) ( not ( = ?auto_90490 ?auto_90492 ) ) ( not ( = ?auto_90491 ?auto_90492 ) ) ( ON ?auto_90492 ?auto_90493 ) ( not ( = ?auto_90490 ?auto_90493 ) ) ( not ( = ?auto_90491 ?auto_90493 ) ) ( not ( = ?auto_90492 ?auto_90493 ) ) ( ON-TABLE ?auto_90496 ) ( ON ?auto_90494 ?auto_90496 ) ( ON ?auto_90495 ?auto_90494 ) ( ON ?auto_90493 ?auto_90495 ) ( not ( = ?auto_90496 ?auto_90494 ) ) ( not ( = ?auto_90496 ?auto_90495 ) ) ( not ( = ?auto_90496 ?auto_90493 ) ) ( not ( = ?auto_90496 ?auto_90492 ) ) ( not ( = ?auto_90496 ?auto_90491 ) ) ( not ( = ?auto_90494 ?auto_90495 ) ) ( not ( = ?auto_90494 ?auto_90493 ) ) ( not ( = ?auto_90494 ?auto_90492 ) ) ( not ( = ?auto_90494 ?auto_90491 ) ) ( not ( = ?auto_90495 ?auto_90493 ) ) ( not ( = ?auto_90495 ?auto_90492 ) ) ( not ( = ?auto_90495 ?auto_90491 ) ) ( not ( = ?auto_90490 ?auto_90496 ) ) ( not ( = ?auto_90490 ?auto_90494 ) ) ( not ( = ?auto_90490 ?auto_90495 ) ) ( ON ?auto_90490 ?auto_90497 ) ( not ( = ?auto_90490 ?auto_90497 ) ) ( not ( = ?auto_90491 ?auto_90497 ) ) ( not ( = ?auto_90492 ?auto_90497 ) ) ( not ( = ?auto_90493 ?auto_90497 ) ) ( not ( = ?auto_90496 ?auto_90497 ) ) ( not ( = ?auto_90494 ?auto_90497 ) ) ( not ( = ?auto_90495 ?auto_90497 ) ) ( CLEAR ?auto_90492 ) ( ON ?auto_90491 ?auto_90490 ) ( CLEAR ?auto_90491 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90497 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90497 ?auto_90490 )
      ( MAKE-3PILE ?auto_90490 ?auto_90491 ?auto_90492 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90498 - BLOCK
      ?auto_90499 - BLOCK
      ?auto_90500 - BLOCK
    )
    :vars
    (
      ?auto_90504 - BLOCK
      ?auto_90501 - BLOCK
      ?auto_90505 - BLOCK
      ?auto_90502 - BLOCK
      ?auto_90503 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90498 ?auto_90499 ) ) ( not ( = ?auto_90498 ?auto_90500 ) ) ( not ( = ?auto_90499 ?auto_90500 ) ) ( not ( = ?auto_90498 ?auto_90504 ) ) ( not ( = ?auto_90499 ?auto_90504 ) ) ( not ( = ?auto_90500 ?auto_90504 ) ) ( ON-TABLE ?auto_90501 ) ( ON ?auto_90505 ?auto_90501 ) ( ON ?auto_90502 ?auto_90505 ) ( ON ?auto_90504 ?auto_90502 ) ( not ( = ?auto_90501 ?auto_90505 ) ) ( not ( = ?auto_90501 ?auto_90502 ) ) ( not ( = ?auto_90501 ?auto_90504 ) ) ( not ( = ?auto_90501 ?auto_90500 ) ) ( not ( = ?auto_90501 ?auto_90499 ) ) ( not ( = ?auto_90505 ?auto_90502 ) ) ( not ( = ?auto_90505 ?auto_90504 ) ) ( not ( = ?auto_90505 ?auto_90500 ) ) ( not ( = ?auto_90505 ?auto_90499 ) ) ( not ( = ?auto_90502 ?auto_90504 ) ) ( not ( = ?auto_90502 ?auto_90500 ) ) ( not ( = ?auto_90502 ?auto_90499 ) ) ( not ( = ?auto_90498 ?auto_90501 ) ) ( not ( = ?auto_90498 ?auto_90505 ) ) ( not ( = ?auto_90498 ?auto_90502 ) ) ( ON ?auto_90498 ?auto_90503 ) ( not ( = ?auto_90498 ?auto_90503 ) ) ( not ( = ?auto_90499 ?auto_90503 ) ) ( not ( = ?auto_90500 ?auto_90503 ) ) ( not ( = ?auto_90504 ?auto_90503 ) ) ( not ( = ?auto_90501 ?auto_90503 ) ) ( not ( = ?auto_90505 ?auto_90503 ) ) ( not ( = ?auto_90502 ?auto_90503 ) ) ( ON ?auto_90499 ?auto_90498 ) ( CLEAR ?auto_90499 ) ( ON-TABLE ?auto_90503 ) ( HOLDING ?auto_90500 ) ( CLEAR ?auto_90504 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90501 ?auto_90505 ?auto_90502 ?auto_90504 ?auto_90500 )
      ( MAKE-3PILE ?auto_90498 ?auto_90499 ?auto_90500 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90506 - BLOCK
      ?auto_90507 - BLOCK
      ?auto_90508 - BLOCK
    )
    :vars
    (
      ?auto_90511 - BLOCK
      ?auto_90510 - BLOCK
      ?auto_90509 - BLOCK
      ?auto_90513 - BLOCK
      ?auto_90512 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90506 ?auto_90507 ) ) ( not ( = ?auto_90506 ?auto_90508 ) ) ( not ( = ?auto_90507 ?auto_90508 ) ) ( not ( = ?auto_90506 ?auto_90511 ) ) ( not ( = ?auto_90507 ?auto_90511 ) ) ( not ( = ?auto_90508 ?auto_90511 ) ) ( ON-TABLE ?auto_90510 ) ( ON ?auto_90509 ?auto_90510 ) ( ON ?auto_90513 ?auto_90509 ) ( ON ?auto_90511 ?auto_90513 ) ( not ( = ?auto_90510 ?auto_90509 ) ) ( not ( = ?auto_90510 ?auto_90513 ) ) ( not ( = ?auto_90510 ?auto_90511 ) ) ( not ( = ?auto_90510 ?auto_90508 ) ) ( not ( = ?auto_90510 ?auto_90507 ) ) ( not ( = ?auto_90509 ?auto_90513 ) ) ( not ( = ?auto_90509 ?auto_90511 ) ) ( not ( = ?auto_90509 ?auto_90508 ) ) ( not ( = ?auto_90509 ?auto_90507 ) ) ( not ( = ?auto_90513 ?auto_90511 ) ) ( not ( = ?auto_90513 ?auto_90508 ) ) ( not ( = ?auto_90513 ?auto_90507 ) ) ( not ( = ?auto_90506 ?auto_90510 ) ) ( not ( = ?auto_90506 ?auto_90509 ) ) ( not ( = ?auto_90506 ?auto_90513 ) ) ( ON ?auto_90506 ?auto_90512 ) ( not ( = ?auto_90506 ?auto_90512 ) ) ( not ( = ?auto_90507 ?auto_90512 ) ) ( not ( = ?auto_90508 ?auto_90512 ) ) ( not ( = ?auto_90511 ?auto_90512 ) ) ( not ( = ?auto_90510 ?auto_90512 ) ) ( not ( = ?auto_90509 ?auto_90512 ) ) ( not ( = ?auto_90513 ?auto_90512 ) ) ( ON ?auto_90507 ?auto_90506 ) ( ON-TABLE ?auto_90512 ) ( CLEAR ?auto_90511 ) ( ON ?auto_90508 ?auto_90507 ) ( CLEAR ?auto_90508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90512 ?auto_90506 ?auto_90507 )
      ( MAKE-3PILE ?auto_90506 ?auto_90507 ?auto_90508 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90514 - BLOCK
      ?auto_90515 - BLOCK
      ?auto_90516 - BLOCK
    )
    :vars
    (
      ?auto_90519 - BLOCK
      ?auto_90521 - BLOCK
      ?auto_90520 - BLOCK
      ?auto_90518 - BLOCK
      ?auto_90517 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90514 ?auto_90515 ) ) ( not ( = ?auto_90514 ?auto_90516 ) ) ( not ( = ?auto_90515 ?auto_90516 ) ) ( not ( = ?auto_90514 ?auto_90519 ) ) ( not ( = ?auto_90515 ?auto_90519 ) ) ( not ( = ?auto_90516 ?auto_90519 ) ) ( ON-TABLE ?auto_90521 ) ( ON ?auto_90520 ?auto_90521 ) ( ON ?auto_90518 ?auto_90520 ) ( not ( = ?auto_90521 ?auto_90520 ) ) ( not ( = ?auto_90521 ?auto_90518 ) ) ( not ( = ?auto_90521 ?auto_90519 ) ) ( not ( = ?auto_90521 ?auto_90516 ) ) ( not ( = ?auto_90521 ?auto_90515 ) ) ( not ( = ?auto_90520 ?auto_90518 ) ) ( not ( = ?auto_90520 ?auto_90519 ) ) ( not ( = ?auto_90520 ?auto_90516 ) ) ( not ( = ?auto_90520 ?auto_90515 ) ) ( not ( = ?auto_90518 ?auto_90519 ) ) ( not ( = ?auto_90518 ?auto_90516 ) ) ( not ( = ?auto_90518 ?auto_90515 ) ) ( not ( = ?auto_90514 ?auto_90521 ) ) ( not ( = ?auto_90514 ?auto_90520 ) ) ( not ( = ?auto_90514 ?auto_90518 ) ) ( ON ?auto_90514 ?auto_90517 ) ( not ( = ?auto_90514 ?auto_90517 ) ) ( not ( = ?auto_90515 ?auto_90517 ) ) ( not ( = ?auto_90516 ?auto_90517 ) ) ( not ( = ?auto_90519 ?auto_90517 ) ) ( not ( = ?auto_90521 ?auto_90517 ) ) ( not ( = ?auto_90520 ?auto_90517 ) ) ( not ( = ?auto_90518 ?auto_90517 ) ) ( ON ?auto_90515 ?auto_90514 ) ( ON-TABLE ?auto_90517 ) ( ON ?auto_90516 ?auto_90515 ) ( CLEAR ?auto_90516 ) ( HOLDING ?auto_90519 ) ( CLEAR ?auto_90518 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90521 ?auto_90520 ?auto_90518 ?auto_90519 )
      ( MAKE-3PILE ?auto_90514 ?auto_90515 ?auto_90516 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90522 - BLOCK
      ?auto_90523 - BLOCK
      ?auto_90524 - BLOCK
    )
    :vars
    (
      ?auto_90525 - BLOCK
      ?auto_90528 - BLOCK
      ?auto_90529 - BLOCK
      ?auto_90527 - BLOCK
      ?auto_90526 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90522 ?auto_90523 ) ) ( not ( = ?auto_90522 ?auto_90524 ) ) ( not ( = ?auto_90523 ?auto_90524 ) ) ( not ( = ?auto_90522 ?auto_90525 ) ) ( not ( = ?auto_90523 ?auto_90525 ) ) ( not ( = ?auto_90524 ?auto_90525 ) ) ( ON-TABLE ?auto_90528 ) ( ON ?auto_90529 ?auto_90528 ) ( ON ?auto_90527 ?auto_90529 ) ( not ( = ?auto_90528 ?auto_90529 ) ) ( not ( = ?auto_90528 ?auto_90527 ) ) ( not ( = ?auto_90528 ?auto_90525 ) ) ( not ( = ?auto_90528 ?auto_90524 ) ) ( not ( = ?auto_90528 ?auto_90523 ) ) ( not ( = ?auto_90529 ?auto_90527 ) ) ( not ( = ?auto_90529 ?auto_90525 ) ) ( not ( = ?auto_90529 ?auto_90524 ) ) ( not ( = ?auto_90529 ?auto_90523 ) ) ( not ( = ?auto_90527 ?auto_90525 ) ) ( not ( = ?auto_90527 ?auto_90524 ) ) ( not ( = ?auto_90527 ?auto_90523 ) ) ( not ( = ?auto_90522 ?auto_90528 ) ) ( not ( = ?auto_90522 ?auto_90529 ) ) ( not ( = ?auto_90522 ?auto_90527 ) ) ( ON ?auto_90522 ?auto_90526 ) ( not ( = ?auto_90522 ?auto_90526 ) ) ( not ( = ?auto_90523 ?auto_90526 ) ) ( not ( = ?auto_90524 ?auto_90526 ) ) ( not ( = ?auto_90525 ?auto_90526 ) ) ( not ( = ?auto_90528 ?auto_90526 ) ) ( not ( = ?auto_90529 ?auto_90526 ) ) ( not ( = ?auto_90527 ?auto_90526 ) ) ( ON ?auto_90523 ?auto_90522 ) ( ON-TABLE ?auto_90526 ) ( ON ?auto_90524 ?auto_90523 ) ( CLEAR ?auto_90527 ) ( ON ?auto_90525 ?auto_90524 ) ( CLEAR ?auto_90525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90526 ?auto_90522 ?auto_90523 ?auto_90524 )
      ( MAKE-3PILE ?auto_90522 ?auto_90523 ?auto_90524 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90530 - BLOCK
      ?auto_90531 - BLOCK
      ?auto_90532 - BLOCK
    )
    :vars
    (
      ?auto_90536 - BLOCK
      ?auto_90537 - BLOCK
      ?auto_90534 - BLOCK
      ?auto_90535 - BLOCK
      ?auto_90533 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90530 ?auto_90531 ) ) ( not ( = ?auto_90530 ?auto_90532 ) ) ( not ( = ?auto_90531 ?auto_90532 ) ) ( not ( = ?auto_90530 ?auto_90536 ) ) ( not ( = ?auto_90531 ?auto_90536 ) ) ( not ( = ?auto_90532 ?auto_90536 ) ) ( ON-TABLE ?auto_90537 ) ( ON ?auto_90534 ?auto_90537 ) ( not ( = ?auto_90537 ?auto_90534 ) ) ( not ( = ?auto_90537 ?auto_90535 ) ) ( not ( = ?auto_90537 ?auto_90536 ) ) ( not ( = ?auto_90537 ?auto_90532 ) ) ( not ( = ?auto_90537 ?auto_90531 ) ) ( not ( = ?auto_90534 ?auto_90535 ) ) ( not ( = ?auto_90534 ?auto_90536 ) ) ( not ( = ?auto_90534 ?auto_90532 ) ) ( not ( = ?auto_90534 ?auto_90531 ) ) ( not ( = ?auto_90535 ?auto_90536 ) ) ( not ( = ?auto_90535 ?auto_90532 ) ) ( not ( = ?auto_90535 ?auto_90531 ) ) ( not ( = ?auto_90530 ?auto_90537 ) ) ( not ( = ?auto_90530 ?auto_90534 ) ) ( not ( = ?auto_90530 ?auto_90535 ) ) ( ON ?auto_90530 ?auto_90533 ) ( not ( = ?auto_90530 ?auto_90533 ) ) ( not ( = ?auto_90531 ?auto_90533 ) ) ( not ( = ?auto_90532 ?auto_90533 ) ) ( not ( = ?auto_90536 ?auto_90533 ) ) ( not ( = ?auto_90537 ?auto_90533 ) ) ( not ( = ?auto_90534 ?auto_90533 ) ) ( not ( = ?auto_90535 ?auto_90533 ) ) ( ON ?auto_90531 ?auto_90530 ) ( ON-TABLE ?auto_90533 ) ( ON ?auto_90532 ?auto_90531 ) ( ON ?auto_90536 ?auto_90532 ) ( CLEAR ?auto_90536 ) ( HOLDING ?auto_90535 ) ( CLEAR ?auto_90534 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90537 ?auto_90534 ?auto_90535 )
      ( MAKE-3PILE ?auto_90530 ?auto_90531 ?auto_90532 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90538 - BLOCK
      ?auto_90539 - BLOCK
      ?auto_90540 - BLOCK
    )
    :vars
    (
      ?auto_90543 - BLOCK
      ?auto_90541 - BLOCK
      ?auto_90544 - BLOCK
      ?auto_90545 - BLOCK
      ?auto_90542 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90538 ?auto_90539 ) ) ( not ( = ?auto_90538 ?auto_90540 ) ) ( not ( = ?auto_90539 ?auto_90540 ) ) ( not ( = ?auto_90538 ?auto_90543 ) ) ( not ( = ?auto_90539 ?auto_90543 ) ) ( not ( = ?auto_90540 ?auto_90543 ) ) ( ON-TABLE ?auto_90541 ) ( ON ?auto_90544 ?auto_90541 ) ( not ( = ?auto_90541 ?auto_90544 ) ) ( not ( = ?auto_90541 ?auto_90545 ) ) ( not ( = ?auto_90541 ?auto_90543 ) ) ( not ( = ?auto_90541 ?auto_90540 ) ) ( not ( = ?auto_90541 ?auto_90539 ) ) ( not ( = ?auto_90544 ?auto_90545 ) ) ( not ( = ?auto_90544 ?auto_90543 ) ) ( not ( = ?auto_90544 ?auto_90540 ) ) ( not ( = ?auto_90544 ?auto_90539 ) ) ( not ( = ?auto_90545 ?auto_90543 ) ) ( not ( = ?auto_90545 ?auto_90540 ) ) ( not ( = ?auto_90545 ?auto_90539 ) ) ( not ( = ?auto_90538 ?auto_90541 ) ) ( not ( = ?auto_90538 ?auto_90544 ) ) ( not ( = ?auto_90538 ?auto_90545 ) ) ( ON ?auto_90538 ?auto_90542 ) ( not ( = ?auto_90538 ?auto_90542 ) ) ( not ( = ?auto_90539 ?auto_90542 ) ) ( not ( = ?auto_90540 ?auto_90542 ) ) ( not ( = ?auto_90543 ?auto_90542 ) ) ( not ( = ?auto_90541 ?auto_90542 ) ) ( not ( = ?auto_90544 ?auto_90542 ) ) ( not ( = ?auto_90545 ?auto_90542 ) ) ( ON ?auto_90539 ?auto_90538 ) ( ON-TABLE ?auto_90542 ) ( ON ?auto_90540 ?auto_90539 ) ( ON ?auto_90543 ?auto_90540 ) ( CLEAR ?auto_90544 ) ( ON ?auto_90545 ?auto_90543 ) ( CLEAR ?auto_90545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90542 ?auto_90538 ?auto_90539 ?auto_90540 ?auto_90543 )
      ( MAKE-3PILE ?auto_90538 ?auto_90539 ?auto_90540 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90546 - BLOCK
      ?auto_90547 - BLOCK
      ?auto_90548 - BLOCK
    )
    :vars
    (
      ?auto_90549 - BLOCK
      ?auto_90551 - BLOCK
      ?auto_90550 - BLOCK
      ?auto_90552 - BLOCK
      ?auto_90553 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90546 ?auto_90547 ) ) ( not ( = ?auto_90546 ?auto_90548 ) ) ( not ( = ?auto_90547 ?auto_90548 ) ) ( not ( = ?auto_90546 ?auto_90549 ) ) ( not ( = ?auto_90547 ?auto_90549 ) ) ( not ( = ?auto_90548 ?auto_90549 ) ) ( ON-TABLE ?auto_90551 ) ( not ( = ?auto_90551 ?auto_90550 ) ) ( not ( = ?auto_90551 ?auto_90552 ) ) ( not ( = ?auto_90551 ?auto_90549 ) ) ( not ( = ?auto_90551 ?auto_90548 ) ) ( not ( = ?auto_90551 ?auto_90547 ) ) ( not ( = ?auto_90550 ?auto_90552 ) ) ( not ( = ?auto_90550 ?auto_90549 ) ) ( not ( = ?auto_90550 ?auto_90548 ) ) ( not ( = ?auto_90550 ?auto_90547 ) ) ( not ( = ?auto_90552 ?auto_90549 ) ) ( not ( = ?auto_90552 ?auto_90548 ) ) ( not ( = ?auto_90552 ?auto_90547 ) ) ( not ( = ?auto_90546 ?auto_90551 ) ) ( not ( = ?auto_90546 ?auto_90550 ) ) ( not ( = ?auto_90546 ?auto_90552 ) ) ( ON ?auto_90546 ?auto_90553 ) ( not ( = ?auto_90546 ?auto_90553 ) ) ( not ( = ?auto_90547 ?auto_90553 ) ) ( not ( = ?auto_90548 ?auto_90553 ) ) ( not ( = ?auto_90549 ?auto_90553 ) ) ( not ( = ?auto_90551 ?auto_90553 ) ) ( not ( = ?auto_90550 ?auto_90553 ) ) ( not ( = ?auto_90552 ?auto_90553 ) ) ( ON ?auto_90547 ?auto_90546 ) ( ON-TABLE ?auto_90553 ) ( ON ?auto_90548 ?auto_90547 ) ( ON ?auto_90549 ?auto_90548 ) ( ON ?auto_90552 ?auto_90549 ) ( CLEAR ?auto_90552 ) ( HOLDING ?auto_90550 ) ( CLEAR ?auto_90551 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90551 ?auto_90550 )
      ( MAKE-3PILE ?auto_90546 ?auto_90547 ?auto_90548 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90554 - BLOCK
      ?auto_90555 - BLOCK
      ?auto_90556 - BLOCK
    )
    :vars
    (
      ?auto_90560 - BLOCK
      ?auto_90561 - BLOCK
      ?auto_90558 - BLOCK
      ?auto_90557 - BLOCK
      ?auto_90559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90554 ?auto_90555 ) ) ( not ( = ?auto_90554 ?auto_90556 ) ) ( not ( = ?auto_90555 ?auto_90556 ) ) ( not ( = ?auto_90554 ?auto_90560 ) ) ( not ( = ?auto_90555 ?auto_90560 ) ) ( not ( = ?auto_90556 ?auto_90560 ) ) ( ON-TABLE ?auto_90561 ) ( not ( = ?auto_90561 ?auto_90558 ) ) ( not ( = ?auto_90561 ?auto_90557 ) ) ( not ( = ?auto_90561 ?auto_90560 ) ) ( not ( = ?auto_90561 ?auto_90556 ) ) ( not ( = ?auto_90561 ?auto_90555 ) ) ( not ( = ?auto_90558 ?auto_90557 ) ) ( not ( = ?auto_90558 ?auto_90560 ) ) ( not ( = ?auto_90558 ?auto_90556 ) ) ( not ( = ?auto_90558 ?auto_90555 ) ) ( not ( = ?auto_90557 ?auto_90560 ) ) ( not ( = ?auto_90557 ?auto_90556 ) ) ( not ( = ?auto_90557 ?auto_90555 ) ) ( not ( = ?auto_90554 ?auto_90561 ) ) ( not ( = ?auto_90554 ?auto_90558 ) ) ( not ( = ?auto_90554 ?auto_90557 ) ) ( ON ?auto_90554 ?auto_90559 ) ( not ( = ?auto_90554 ?auto_90559 ) ) ( not ( = ?auto_90555 ?auto_90559 ) ) ( not ( = ?auto_90556 ?auto_90559 ) ) ( not ( = ?auto_90560 ?auto_90559 ) ) ( not ( = ?auto_90561 ?auto_90559 ) ) ( not ( = ?auto_90558 ?auto_90559 ) ) ( not ( = ?auto_90557 ?auto_90559 ) ) ( ON ?auto_90555 ?auto_90554 ) ( ON-TABLE ?auto_90559 ) ( ON ?auto_90556 ?auto_90555 ) ( ON ?auto_90560 ?auto_90556 ) ( ON ?auto_90557 ?auto_90560 ) ( CLEAR ?auto_90561 ) ( ON ?auto_90558 ?auto_90557 ) ( CLEAR ?auto_90558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90559 ?auto_90554 ?auto_90555 ?auto_90556 ?auto_90560 ?auto_90557 )
      ( MAKE-3PILE ?auto_90554 ?auto_90555 ?auto_90556 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90562 - BLOCK
      ?auto_90563 - BLOCK
      ?auto_90564 - BLOCK
    )
    :vars
    (
      ?auto_90565 - BLOCK
      ?auto_90568 - BLOCK
      ?auto_90567 - BLOCK
      ?auto_90569 - BLOCK
      ?auto_90566 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90562 ?auto_90563 ) ) ( not ( = ?auto_90562 ?auto_90564 ) ) ( not ( = ?auto_90563 ?auto_90564 ) ) ( not ( = ?auto_90562 ?auto_90565 ) ) ( not ( = ?auto_90563 ?auto_90565 ) ) ( not ( = ?auto_90564 ?auto_90565 ) ) ( not ( = ?auto_90568 ?auto_90567 ) ) ( not ( = ?auto_90568 ?auto_90569 ) ) ( not ( = ?auto_90568 ?auto_90565 ) ) ( not ( = ?auto_90568 ?auto_90564 ) ) ( not ( = ?auto_90568 ?auto_90563 ) ) ( not ( = ?auto_90567 ?auto_90569 ) ) ( not ( = ?auto_90567 ?auto_90565 ) ) ( not ( = ?auto_90567 ?auto_90564 ) ) ( not ( = ?auto_90567 ?auto_90563 ) ) ( not ( = ?auto_90569 ?auto_90565 ) ) ( not ( = ?auto_90569 ?auto_90564 ) ) ( not ( = ?auto_90569 ?auto_90563 ) ) ( not ( = ?auto_90562 ?auto_90568 ) ) ( not ( = ?auto_90562 ?auto_90567 ) ) ( not ( = ?auto_90562 ?auto_90569 ) ) ( ON ?auto_90562 ?auto_90566 ) ( not ( = ?auto_90562 ?auto_90566 ) ) ( not ( = ?auto_90563 ?auto_90566 ) ) ( not ( = ?auto_90564 ?auto_90566 ) ) ( not ( = ?auto_90565 ?auto_90566 ) ) ( not ( = ?auto_90568 ?auto_90566 ) ) ( not ( = ?auto_90567 ?auto_90566 ) ) ( not ( = ?auto_90569 ?auto_90566 ) ) ( ON ?auto_90563 ?auto_90562 ) ( ON-TABLE ?auto_90566 ) ( ON ?auto_90564 ?auto_90563 ) ( ON ?auto_90565 ?auto_90564 ) ( ON ?auto_90569 ?auto_90565 ) ( ON ?auto_90567 ?auto_90569 ) ( CLEAR ?auto_90567 ) ( HOLDING ?auto_90568 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90568 )
      ( MAKE-3PILE ?auto_90562 ?auto_90563 ?auto_90564 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90570 - BLOCK
      ?auto_90571 - BLOCK
      ?auto_90572 - BLOCK
    )
    :vars
    (
      ?auto_90577 - BLOCK
      ?auto_90574 - BLOCK
      ?auto_90576 - BLOCK
      ?auto_90573 - BLOCK
      ?auto_90575 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90570 ?auto_90571 ) ) ( not ( = ?auto_90570 ?auto_90572 ) ) ( not ( = ?auto_90571 ?auto_90572 ) ) ( not ( = ?auto_90570 ?auto_90577 ) ) ( not ( = ?auto_90571 ?auto_90577 ) ) ( not ( = ?auto_90572 ?auto_90577 ) ) ( not ( = ?auto_90574 ?auto_90576 ) ) ( not ( = ?auto_90574 ?auto_90573 ) ) ( not ( = ?auto_90574 ?auto_90577 ) ) ( not ( = ?auto_90574 ?auto_90572 ) ) ( not ( = ?auto_90574 ?auto_90571 ) ) ( not ( = ?auto_90576 ?auto_90573 ) ) ( not ( = ?auto_90576 ?auto_90577 ) ) ( not ( = ?auto_90576 ?auto_90572 ) ) ( not ( = ?auto_90576 ?auto_90571 ) ) ( not ( = ?auto_90573 ?auto_90577 ) ) ( not ( = ?auto_90573 ?auto_90572 ) ) ( not ( = ?auto_90573 ?auto_90571 ) ) ( not ( = ?auto_90570 ?auto_90574 ) ) ( not ( = ?auto_90570 ?auto_90576 ) ) ( not ( = ?auto_90570 ?auto_90573 ) ) ( ON ?auto_90570 ?auto_90575 ) ( not ( = ?auto_90570 ?auto_90575 ) ) ( not ( = ?auto_90571 ?auto_90575 ) ) ( not ( = ?auto_90572 ?auto_90575 ) ) ( not ( = ?auto_90577 ?auto_90575 ) ) ( not ( = ?auto_90574 ?auto_90575 ) ) ( not ( = ?auto_90576 ?auto_90575 ) ) ( not ( = ?auto_90573 ?auto_90575 ) ) ( ON ?auto_90571 ?auto_90570 ) ( ON-TABLE ?auto_90575 ) ( ON ?auto_90572 ?auto_90571 ) ( ON ?auto_90577 ?auto_90572 ) ( ON ?auto_90573 ?auto_90577 ) ( ON ?auto_90576 ?auto_90573 ) ( ON ?auto_90574 ?auto_90576 ) ( CLEAR ?auto_90574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_90575 ?auto_90570 ?auto_90571 ?auto_90572 ?auto_90577 ?auto_90573 ?auto_90576 )
      ( MAKE-3PILE ?auto_90570 ?auto_90571 ?auto_90572 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90597 - BLOCK
      ?auto_90598 - BLOCK
      ?auto_90599 - BLOCK
    )
    :vars
    (
      ?auto_90602 - BLOCK
      ?auto_90601 - BLOCK
      ?auto_90600 - BLOCK
      ?auto_90603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90602 ?auto_90599 ) ( ON-TABLE ?auto_90597 ) ( ON ?auto_90598 ?auto_90597 ) ( ON ?auto_90599 ?auto_90598 ) ( not ( = ?auto_90597 ?auto_90598 ) ) ( not ( = ?auto_90597 ?auto_90599 ) ) ( not ( = ?auto_90597 ?auto_90602 ) ) ( not ( = ?auto_90598 ?auto_90599 ) ) ( not ( = ?auto_90598 ?auto_90602 ) ) ( not ( = ?auto_90599 ?auto_90602 ) ) ( not ( = ?auto_90597 ?auto_90601 ) ) ( not ( = ?auto_90597 ?auto_90600 ) ) ( not ( = ?auto_90598 ?auto_90601 ) ) ( not ( = ?auto_90598 ?auto_90600 ) ) ( not ( = ?auto_90599 ?auto_90601 ) ) ( not ( = ?auto_90599 ?auto_90600 ) ) ( not ( = ?auto_90602 ?auto_90601 ) ) ( not ( = ?auto_90602 ?auto_90600 ) ) ( not ( = ?auto_90601 ?auto_90600 ) ) ( ON ?auto_90601 ?auto_90602 ) ( CLEAR ?auto_90601 ) ( HOLDING ?auto_90600 ) ( CLEAR ?auto_90603 ) ( ON-TABLE ?auto_90603 ) ( not ( = ?auto_90603 ?auto_90600 ) ) ( not ( = ?auto_90597 ?auto_90603 ) ) ( not ( = ?auto_90598 ?auto_90603 ) ) ( not ( = ?auto_90599 ?auto_90603 ) ) ( not ( = ?auto_90602 ?auto_90603 ) ) ( not ( = ?auto_90601 ?auto_90603 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90603 ?auto_90600 )
      ( MAKE-3PILE ?auto_90597 ?auto_90598 ?auto_90599 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90604 - BLOCK
      ?auto_90605 - BLOCK
      ?auto_90606 - BLOCK
    )
    :vars
    (
      ?auto_90610 - BLOCK
      ?auto_90609 - BLOCK
      ?auto_90608 - BLOCK
      ?auto_90607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90610 ?auto_90606 ) ( ON-TABLE ?auto_90604 ) ( ON ?auto_90605 ?auto_90604 ) ( ON ?auto_90606 ?auto_90605 ) ( not ( = ?auto_90604 ?auto_90605 ) ) ( not ( = ?auto_90604 ?auto_90606 ) ) ( not ( = ?auto_90604 ?auto_90610 ) ) ( not ( = ?auto_90605 ?auto_90606 ) ) ( not ( = ?auto_90605 ?auto_90610 ) ) ( not ( = ?auto_90606 ?auto_90610 ) ) ( not ( = ?auto_90604 ?auto_90609 ) ) ( not ( = ?auto_90604 ?auto_90608 ) ) ( not ( = ?auto_90605 ?auto_90609 ) ) ( not ( = ?auto_90605 ?auto_90608 ) ) ( not ( = ?auto_90606 ?auto_90609 ) ) ( not ( = ?auto_90606 ?auto_90608 ) ) ( not ( = ?auto_90610 ?auto_90609 ) ) ( not ( = ?auto_90610 ?auto_90608 ) ) ( not ( = ?auto_90609 ?auto_90608 ) ) ( ON ?auto_90609 ?auto_90610 ) ( CLEAR ?auto_90607 ) ( ON-TABLE ?auto_90607 ) ( not ( = ?auto_90607 ?auto_90608 ) ) ( not ( = ?auto_90604 ?auto_90607 ) ) ( not ( = ?auto_90605 ?auto_90607 ) ) ( not ( = ?auto_90606 ?auto_90607 ) ) ( not ( = ?auto_90610 ?auto_90607 ) ) ( not ( = ?auto_90609 ?auto_90607 ) ) ( ON ?auto_90608 ?auto_90609 ) ( CLEAR ?auto_90608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90604 ?auto_90605 ?auto_90606 ?auto_90610 ?auto_90609 )
      ( MAKE-3PILE ?auto_90604 ?auto_90605 ?auto_90606 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90611 - BLOCK
      ?auto_90612 - BLOCK
      ?auto_90613 - BLOCK
    )
    :vars
    (
      ?auto_90615 - BLOCK
      ?auto_90616 - BLOCK
      ?auto_90617 - BLOCK
      ?auto_90614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90615 ?auto_90613 ) ( ON-TABLE ?auto_90611 ) ( ON ?auto_90612 ?auto_90611 ) ( ON ?auto_90613 ?auto_90612 ) ( not ( = ?auto_90611 ?auto_90612 ) ) ( not ( = ?auto_90611 ?auto_90613 ) ) ( not ( = ?auto_90611 ?auto_90615 ) ) ( not ( = ?auto_90612 ?auto_90613 ) ) ( not ( = ?auto_90612 ?auto_90615 ) ) ( not ( = ?auto_90613 ?auto_90615 ) ) ( not ( = ?auto_90611 ?auto_90616 ) ) ( not ( = ?auto_90611 ?auto_90617 ) ) ( not ( = ?auto_90612 ?auto_90616 ) ) ( not ( = ?auto_90612 ?auto_90617 ) ) ( not ( = ?auto_90613 ?auto_90616 ) ) ( not ( = ?auto_90613 ?auto_90617 ) ) ( not ( = ?auto_90615 ?auto_90616 ) ) ( not ( = ?auto_90615 ?auto_90617 ) ) ( not ( = ?auto_90616 ?auto_90617 ) ) ( ON ?auto_90616 ?auto_90615 ) ( not ( = ?auto_90614 ?auto_90617 ) ) ( not ( = ?auto_90611 ?auto_90614 ) ) ( not ( = ?auto_90612 ?auto_90614 ) ) ( not ( = ?auto_90613 ?auto_90614 ) ) ( not ( = ?auto_90615 ?auto_90614 ) ) ( not ( = ?auto_90616 ?auto_90614 ) ) ( ON ?auto_90617 ?auto_90616 ) ( CLEAR ?auto_90617 ) ( HOLDING ?auto_90614 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90614 )
      ( MAKE-3PILE ?auto_90611 ?auto_90612 ?auto_90613 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90628 - BLOCK
      ?auto_90629 - BLOCK
      ?auto_90630 - BLOCK
    )
    :vars
    (
      ?auto_90634 - BLOCK
      ?auto_90632 - BLOCK
      ?auto_90633 - BLOCK
      ?auto_90631 - BLOCK
      ?auto_90635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90634 ?auto_90630 ) ( ON-TABLE ?auto_90628 ) ( ON ?auto_90629 ?auto_90628 ) ( ON ?auto_90630 ?auto_90629 ) ( not ( = ?auto_90628 ?auto_90629 ) ) ( not ( = ?auto_90628 ?auto_90630 ) ) ( not ( = ?auto_90628 ?auto_90634 ) ) ( not ( = ?auto_90629 ?auto_90630 ) ) ( not ( = ?auto_90629 ?auto_90634 ) ) ( not ( = ?auto_90630 ?auto_90634 ) ) ( not ( = ?auto_90628 ?auto_90632 ) ) ( not ( = ?auto_90628 ?auto_90633 ) ) ( not ( = ?auto_90629 ?auto_90632 ) ) ( not ( = ?auto_90629 ?auto_90633 ) ) ( not ( = ?auto_90630 ?auto_90632 ) ) ( not ( = ?auto_90630 ?auto_90633 ) ) ( not ( = ?auto_90634 ?auto_90632 ) ) ( not ( = ?auto_90634 ?auto_90633 ) ) ( not ( = ?auto_90632 ?auto_90633 ) ) ( ON ?auto_90632 ?auto_90634 ) ( not ( = ?auto_90631 ?auto_90633 ) ) ( not ( = ?auto_90628 ?auto_90631 ) ) ( not ( = ?auto_90629 ?auto_90631 ) ) ( not ( = ?auto_90630 ?auto_90631 ) ) ( not ( = ?auto_90634 ?auto_90631 ) ) ( not ( = ?auto_90632 ?auto_90631 ) ) ( ON ?auto_90633 ?auto_90632 ) ( CLEAR ?auto_90633 ) ( ON ?auto_90631 ?auto_90635 ) ( CLEAR ?auto_90631 ) ( HAND-EMPTY ) ( not ( = ?auto_90628 ?auto_90635 ) ) ( not ( = ?auto_90629 ?auto_90635 ) ) ( not ( = ?auto_90630 ?auto_90635 ) ) ( not ( = ?auto_90634 ?auto_90635 ) ) ( not ( = ?auto_90632 ?auto_90635 ) ) ( not ( = ?auto_90633 ?auto_90635 ) ) ( not ( = ?auto_90631 ?auto_90635 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90631 ?auto_90635 )
      ( MAKE-3PILE ?auto_90628 ?auto_90629 ?auto_90630 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90636 - BLOCK
      ?auto_90637 - BLOCK
      ?auto_90638 - BLOCK
    )
    :vars
    (
      ?auto_90643 - BLOCK
      ?auto_90639 - BLOCK
      ?auto_90640 - BLOCK
      ?auto_90642 - BLOCK
      ?auto_90641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90643 ?auto_90638 ) ( ON-TABLE ?auto_90636 ) ( ON ?auto_90637 ?auto_90636 ) ( ON ?auto_90638 ?auto_90637 ) ( not ( = ?auto_90636 ?auto_90637 ) ) ( not ( = ?auto_90636 ?auto_90638 ) ) ( not ( = ?auto_90636 ?auto_90643 ) ) ( not ( = ?auto_90637 ?auto_90638 ) ) ( not ( = ?auto_90637 ?auto_90643 ) ) ( not ( = ?auto_90638 ?auto_90643 ) ) ( not ( = ?auto_90636 ?auto_90639 ) ) ( not ( = ?auto_90636 ?auto_90640 ) ) ( not ( = ?auto_90637 ?auto_90639 ) ) ( not ( = ?auto_90637 ?auto_90640 ) ) ( not ( = ?auto_90638 ?auto_90639 ) ) ( not ( = ?auto_90638 ?auto_90640 ) ) ( not ( = ?auto_90643 ?auto_90639 ) ) ( not ( = ?auto_90643 ?auto_90640 ) ) ( not ( = ?auto_90639 ?auto_90640 ) ) ( ON ?auto_90639 ?auto_90643 ) ( not ( = ?auto_90642 ?auto_90640 ) ) ( not ( = ?auto_90636 ?auto_90642 ) ) ( not ( = ?auto_90637 ?auto_90642 ) ) ( not ( = ?auto_90638 ?auto_90642 ) ) ( not ( = ?auto_90643 ?auto_90642 ) ) ( not ( = ?auto_90639 ?auto_90642 ) ) ( ON ?auto_90642 ?auto_90641 ) ( CLEAR ?auto_90642 ) ( not ( = ?auto_90636 ?auto_90641 ) ) ( not ( = ?auto_90637 ?auto_90641 ) ) ( not ( = ?auto_90638 ?auto_90641 ) ) ( not ( = ?auto_90643 ?auto_90641 ) ) ( not ( = ?auto_90639 ?auto_90641 ) ) ( not ( = ?auto_90640 ?auto_90641 ) ) ( not ( = ?auto_90642 ?auto_90641 ) ) ( HOLDING ?auto_90640 ) ( CLEAR ?auto_90639 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90636 ?auto_90637 ?auto_90638 ?auto_90643 ?auto_90639 ?auto_90640 )
      ( MAKE-3PILE ?auto_90636 ?auto_90637 ?auto_90638 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90698 - BLOCK
      ?auto_90699 - BLOCK
      ?auto_90700 - BLOCK
      ?auto_90701 - BLOCK
    )
    :vars
    (
      ?auto_90702 - BLOCK
      ?auto_90703 - BLOCK
      ?auto_90704 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90698 ) ( ON ?auto_90699 ?auto_90698 ) ( not ( = ?auto_90698 ?auto_90699 ) ) ( not ( = ?auto_90698 ?auto_90700 ) ) ( not ( = ?auto_90698 ?auto_90701 ) ) ( not ( = ?auto_90699 ?auto_90700 ) ) ( not ( = ?auto_90699 ?auto_90701 ) ) ( not ( = ?auto_90700 ?auto_90701 ) ) ( ON ?auto_90701 ?auto_90702 ) ( not ( = ?auto_90698 ?auto_90702 ) ) ( not ( = ?auto_90699 ?auto_90702 ) ) ( not ( = ?auto_90700 ?auto_90702 ) ) ( not ( = ?auto_90701 ?auto_90702 ) ) ( CLEAR ?auto_90699 ) ( ON ?auto_90700 ?auto_90701 ) ( CLEAR ?auto_90700 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90703 ) ( ON ?auto_90704 ?auto_90703 ) ( ON ?auto_90702 ?auto_90704 ) ( not ( = ?auto_90703 ?auto_90704 ) ) ( not ( = ?auto_90703 ?auto_90702 ) ) ( not ( = ?auto_90703 ?auto_90701 ) ) ( not ( = ?auto_90703 ?auto_90700 ) ) ( not ( = ?auto_90704 ?auto_90702 ) ) ( not ( = ?auto_90704 ?auto_90701 ) ) ( not ( = ?auto_90704 ?auto_90700 ) ) ( not ( = ?auto_90698 ?auto_90703 ) ) ( not ( = ?auto_90698 ?auto_90704 ) ) ( not ( = ?auto_90699 ?auto_90703 ) ) ( not ( = ?auto_90699 ?auto_90704 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90703 ?auto_90704 ?auto_90702 ?auto_90701 )
      ( MAKE-4PILE ?auto_90698 ?auto_90699 ?auto_90700 ?auto_90701 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90705 - BLOCK
      ?auto_90706 - BLOCK
      ?auto_90707 - BLOCK
      ?auto_90708 - BLOCK
    )
    :vars
    (
      ?auto_90709 - BLOCK
      ?auto_90710 - BLOCK
      ?auto_90711 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90705 ) ( not ( = ?auto_90705 ?auto_90706 ) ) ( not ( = ?auto_90705 ?auto_90707 ) ) ( not ( = ?auto_90705 ?auto_90708 ) ) ( not ( = ?auto_90706 ?auto_90707 ) ) ( not ( = ?auto_90706 ?auto_90708 ) ) ( not ( = ?auto_90707 ?auto_90708 ) ) ( ON ?auto_90708 ?auto_90709 ) ( not ( = ?auto_90705 ?auto_90709 ) ) ( not ( = ?auto_90706 ?auto_90709 ) ) ( not ( = ?auto_90707 ?auto_90709 ) ) ( not ( = ?auto_90708 ?auto_90709 ) ) ( ON ?auto_90707 ?auto_90708 ) ( CLEAR ?auto_90707 ) ( ON-TABLE ?auto_90710 ) ( ON ?auto_90711 ?auto_90710 ) ( ON ?auto_90709 ?auto_90711 ) ( not ( = ?auto_90710 ?auto_90711 ) ) ( not ( = ?auto_90710 ?auto_90709 ) ) ( not ( = ?auto_90710 ?auto_90708 ) ) ( not ( = ?auto_90710 ?auto_90707 ) ) ( not ( = ?auto_90711 ?auto_90709 ) ) ( not ( = ?auto_90711 ?auto_90708 ) ) ( not ( = ?auto_90711 ?auto_90707 ) ) ( not ( = ?auto_90705 ?auto_90710 ) ) ( not ( = ?auto_90705 ?auto_90711 ) ) ( not ( = ?auto_90706 ?auto_90710 ) ) ( not ( = ?auto_90706 ?auto_90711 ) ) ( HOLDING ?auto_90706 ) ( CLEAR ?auto_90705 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90705 ?auto_90706 )
      ( MAKE-4PILE ?auto_90705 ?auto_90706 ?auto_90707 ?auto_90708 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90712 - BLOCK
      ?auto_90713 - BLOCK
      ?auto_90714 - BLOCK
      ?auto_90715 - BLOCK
    )
    :vars
    (
      ?auto_90717 - BLOCK
      ?auto_90716 - BLOCK
      ?auto_90718 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90712 ) ( not ( = ?auto_90712 ?auto_90713 ) ) ( not ( = ?auto_90712 ?auto_90714 ) ) ( not ( = ?auto_90712 ?auto_90715 ) ) ( not ( = ?auto_90713 ?auto_90714 ) ) ( not ( = ?auto_90713 ?auto_90715 ) ) ( not ( = ?auto_90714 ?auto_90715 ) ) ( ON ?auto_90715 ?auto_90717 ) ( not ( = ?auto_90712 ?auto_90717 ) ) ( not ( = ?auto_90713 ?auto_90717 ) ) ( not ( = ?auto_90714 ?auto_90717 ) ) ( not ( = ?auto_90715 ?auto_90717 ) ) ( ON ?auto_90714 ?auto_90715 ) ( ON-TABLE ?auto_90716 ) ( ON ?auto_90718 ?auto_90716 ) ( ON ?auto_90717 ?auto_90718 ) ( not ( = ?auto_90716 ?auto_90718 ) ) ( not ( = ?auto_90716 ?auto_90717 ) ) ( not ( = ?auto_90716 ?auto_90715 ) ) ( not ( = ?auto_90716 ?auto_90714 ) ) ( not ( = ?auto_90718 ?auto_90717 ) ) ( not ( = ?auto_90718 ?auto_90715 ) ) ( not ( = ?auto_90718 ?auto_90714 ) ) ( not ( = ?auto_90712 ?auto_90716 ) ) ( not ( = ?auto_90712 ?auto_90718 ) ) ( not ( = ?auto_90713 ?auto_90716 ) ) ( not ( = ?auto_90713 ?auto_90718 ) ) ( CLEAR ?auto_90712 ) ( ON ?auto_90713 ?auto_90714 ) ( CLEAR ?auto_90713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90716 ?auto_90718 ?auto_90717 ?auto_90715 ?auto_90714 )
      ( MAKE-4PILE ?auto_90712 ?auto_90713 ?auto_90714 ?auto_90715 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90719 - BLOCK
      ?auto_90720 - BLOCK
      ?auto_90721 - BLOCK
      ?auto_90722 - BLOCK
    )
    :vars
    (
      ?auto_90725 - BLOCK
      ?auto_90724 - BLOCK
      ?auto_90723 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90719 ?auto_90720 ) ) ( not ( = ?auto_90719 ?auto_90721 ) ) ( not ( = ?auto_90719 ?auto_90722 ) ) ( not ( = ?auto_90720 ?auto_90721 ) ) ( not ( = ?auto_90720 ?auto_90722 ) ) ( not ( = ?auto_90721 ?auto_90722 ) ) ( ON ?auto_90722 ?auto_90725 ) ( not ( = ?auto_90719 ?auto_90725 ) ) ( not ( = ?auto_90720 ?auto_90725 ) ) ( not ( = ?auto_90721 ?auto_90725 ) ) ( not ( = ?auto_90722 ?auto_90725 ) ) ( ON ?auto_90721 ?auto_90722 ) ( ON-TABLE ?auto_90724 ) ( ON ?auto_90723 ?auto_90724 ) ( ON ?auto_90725 ?auto_90723 ) ( not ( = ?auto_90724 ?auto_90723 ) ) ( not ( = ?auto_90724 ?auto_90725 ) ) ( not ( = ?auto_90724 ?auto_90722 ) ) ( not ( = ?auto_90724 ?auto_90721 ) ) ( not ( = ?auto_90723 ?auto_90725 ) ) ( not ( = ?auto_90723 ?auto_90722 ) ) ( not ( = ?auto_90723 ?auto_90721 ) ) ( not ( = ?auto_90719 ?auto_90724 ) ) ( not ( = ?auto_90719 ?auto_90723 ) ) ( not ( = ?auto_90720 ?auto_90724 ) ) ( not ( = ?auto_90720 ?auto_90723 ) ) ( ON ?auto_90720 ?auto_90721 ) ( CLEAR ?auto_90720 ) ( HOLDING ?auto_90719 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90719 )
      ( MAKE-4PILE ?auto_90719 ?auto_90720 ?auto_90721 ?auto_90722 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90726 - BLOCK
      ?auto_90727 - BLOCK
      ?auto_90728 - BLOCK
      ?auto_90729 - BLOCK
    )
    :vars
    (
      ?auto_90730 - BLOCK
      ?auto_90732 - BLOCK
      ?auto_90731 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90726 ?auto_90727 ) ) ( not ( = ?auto_90726 ?auto_90728 ) ) ( not ( = ?auto_90726 ?auto_90729 ) ) ( not ( = ?auto_90727 ?auto_90728 ) ) ( not ( = ?auto_90727 ?auto_90729 ) ) ( not ( = ?auto_90728 ?auto_90729 ) ) ( ON ?auto_90729 ?auto_90730 ) ( not ( = ?auto_90726 ?auto_90730 ) ) ( not ( = ?auto_90727 ?auto_90730 ) ) ( not ( = ?auto_90728 ?auto_90730 ) ) ( not ( = ?auto_90729 ?auto_90730 ) ) ( ON ?auto_90728 ?auto_90729 ) ( ON-TABLE ?auto_90732 ) ( ON ?auto_90731 ?auto_90732 ) ( ON ?auto_90730 ?auto_90731 ) ( not ( = ?auto_90732 ?auto_90731 ) ) ( not ( = ?auto_90732 ?auto_90730 ) ) ( not ( = ?auto_90732 ?auto_90729 ) ) ( not ( = ?auto_90732 ?auto_90728 ) ) ( not ( = ?auto_90731 ?auto_90730 ) ) ( not ( = ?auto_90731 ?auto_90729 ) ) ( not ( = ?auto_90731 ?auto_90728 ) ) ( not ( = ?auto_90726 ?auto_90732 ) ) ( not ( = ?auto_90726 ?auto_90731 ) ) ( not ( = ?auto_90727 ?auto_90732 ) ) ( not ( = ?auto_90727 ?auto_90731 ) ) ( ON ?auto_90727 ?auto_90728 ) ( ON ?auto_90726 ?auto_90727 ) ( CLEAR ?auto_90726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90732 ?auto_90731 ?auto_90730 ?auto_90729 ?auto_90728 ?auto_90727 )
      ( MAKE-4PILE ?auto_90726 ?auto_90727 ?auto_90728 ?auto_90729 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90737 - BLOCK
      ?auto_90738 - BLOCK
      ?auto_90739 - BLOCK
      ?auto_90740 - BLOCK
    )
    :vars
    (
      ?auto_90743 - BLOCK
      ?auto_90742 - BLOCK
      ?auto_90741 - BLOCK
      ?auto_90744 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90737 ?auto_90738 ) ) ( not ( = ?auto_90737 ?auto_90739 ) ) ( not ( = ?auto_90737 ?auto_90740 ) ) ( not ( = ?auto_90738 ?auto_90739 ) ) ( not ( = ?auto_90738 ?auto_90740 ) ) ( not ( = ?auto_90739 ?auto_90740 ) ) ( ON ?auto_90740 ?auto_90743 ) ( not ( = ?auto_90737 ?auto_90743 ) ) ( not ( = ?auto_90738 ?auto_90743 ) ) ( not ( = ?auto_90739 ?auto_90743 ) ) ( not ( = ?auto_90740 ?auto_90743 ) ) ( ON ?auto_90739 ?auto_90740 ) ( ON-TABLE ?auto_90742 ) ( ON ?auto_90741 ?auto_90742 ) ( ON ?auto_90743 ?auto_90741 ) ( not ( = ?auto_90742 ?auto_90741 ) ) ( not ( = ?auto_90742 ?auto_90743 ) ) ( not ( = ?auto_90742 ?auto_90740 ) ) ( not ( = ?auto_90742 ?auto_90739 ) ) ( not ( = ?auto_90741 ?auto_90743 ) ) ( not ( = ?auto_90741 ?auto_90740 ) ) ( not ( = ?auto_90741 ?auto_90739 ) ) ( not ( = ?auto_90737 ?auto_90742 ) ) ( not ( = ?auto_90737 ?auto_90741 ) ) ( not ( = ?auto_90738 ?auto_90742 ) ) ( not ( = ?auto_90738 ?auto_90741 ) ) ( ON ?auto_90738 ?auto_90739 ) ( CLEAR ?auto_90738 ) ( ON ?auto_90737 ?auto_90744 ) ( CLEAR ?auto_90737 ) ( HAND-EMPTY ) ( not ( = ?auto_90737 ?auto_90744 ) ) ( not ( = ?auto_90738 ?auto_90744 ) ) ( not ( = ?auto_90739 ?auto_90744 ) ) ( not ( = ?auto_90740 ?auto_90744 ) ) ( not ( = ?auto_90743 ?auto_90744 ) ) ( not ( = ?auto_90742 ?auto_90744 ) ) ( not ( = ?auto_90741 ?auto_90744 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90737 ?auto_90744 )
      ( MAKE-4PILE ?auto_90737 ?auto_90738 ?auto_90739 ?auto_90740 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90745 - BLOCK
      ?auto_90746 - BLOCK
      ?auto_90747 - BLOCK
      ?auto_90748 - BLOCK
    )
    :vars
    (
      ?auto_90749 - BLOCK
      ?auto_90752 - BLOCK
      ?auto_90751 - BLOCK
      ?auto_90750 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90745 ?auto_90746 ) ) ( not ( = ?auto_90745 ?auto_90747 ) ) ( not ( = ?auto_90745 ?auto_90748 ) ) ( not ( = ?auto_90746 ?auto_90747 ) ) ( not ( = ?auto_90746 ?auto_90748 ) ) ( not ( = ?auto_90747 ?auto_90748 ) ) ( ON ?auto_90748 ?auto_90749 ) ( not ( = ?auto_90745 ?auto_90749 ) ) ( not ( = ?auto_90746 ?auto_90749 ) ) ( not ( = ?auto_90747 ?auto_90749 ) ) ( not ( = ?auto_90748 ?auto_90749 ) ) ( ON ?auto_90747 ?auto_90748 ) ( ON-TABLE ?auto_90752 ) ( ON ?auto_90751 ?auto_90752 ) ( ON ?auto_90749 ?auto_90751 ) ( not ( = ?auto_90752 ?auto_90751 ) ) ( not ( = ?auto_90752 ?auto_90749 ) ) ( not ( = ?auto_90752 ?auto_90748 ) ) ( not ( = ?auto_90752 ?auto_90747 ) ) ( not ( = ?auto_90751 ?auto_90749 ) ) ( not ( = ?auto_90751 ?auto_90748 ) ) ( not ( = ?auto_90751 ?auto_90747 ) ) ( not ( = ?auto_90745 ?auto_90752 ) ) ( not ( = ?auto_90745 ?auto_90751 ) ) ( not ( = ?auto_90746 ?auto_90752 ) ) ( not ( = ?auto_90746 ?auto_90751 ) ) ( ON ?auto_90745 ?auto_90750 ) ( CLEAR ?auto_90745 ) ( not ( = ?auto_90745 ?auto_90750 ) ) ( not ( = ?auto_90746 ?auto_90750 ) ) ( not ( = ?auto_90747 ?auto_90750 ) ) ( not ( = ?auto_90748 ?auto_90750 ) ) ( not ( = ?auto_90749 ?auto_90750 ) ) ( not ( = ?auto_90752 ?auto_90750 ) ) ( not ( = ?auto_90751 ?auto_90750 ) ) ( HOLDING ?auto_90746 ) ( CLEAR ?auto_90747 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90752 ?auto_90751 ?auto_90749 ?auto_90748 ?auto_90747 ?auto_90746 )
      ( MAKE-4PILE ?auto_90745 ?auto_90746 ?auto_90747 ?auto_90748 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90753 - BLOCK
      ?auto_90754 - BLOCK
      ?auto_90755 - BLOCK
      ?auto_90756 - BLOCK
    )
    :vars
    (
      ?auto_90757 - BLOCK
      ?auto_90758 - BLOCK
      ?auto_90760 - BLOCK
      ?auto_90759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90753 ?auto_90754 ) ) ( not ( = ?auto_90753 ?auto_90755 ) ) ( not ( = ?auto_90753 ?auto_90756 ) ) ( not ( = ?auto_90754 ?auto_90755 ) ) ( not ( = ?auto_90754 ?auto_90756 ) ) ( not ( = ?auto_90755 ?auto_90756 ) ) ( ON ?auto_90756 ?auto_90757 ) ( not ( = ?auto_90753 ?auto_90757 ) ) ( not ( = ?auto_90754 ?auto_90757 ) ) ( not ( = ?auto_90755 ?auto_90757 ) ) ( not ( = ?auto_90756 ?auto_90757 ) ) ( ON ?auto_90755 ?auto_90756 ) ( ON-TABLE ?auto_90758 ) ( ON ?auto_90760 ?auto_90758 ) ( ON ?auto_90757 ?auto_90760 ) ( not ( = ?auto_90758 ?auto_90760 ) ) ( not ( = ?auto_90758 ?auto_90757 ) ) ( not ( = ?auto_90758 ?auto_90756 ) ) ( not ( = ?auto_90758 ?auto_90755 ) ) ( not ( = ?auto_90760 ?auto_90757 ) ) ( not ( = ?auto_90760 ?auto_90756 ) ) ( not ( = ?auto_90760 ?auto_90755 ) ) ( not ( = ?auto_90753 ?auto_90758 ) ) ( not ( = ?auto_90753 ?auto_90760 ) ) ( not ( = ?auto_90754 ?auto_90758 ) ) ( not ( = ?auto_90754 ?auto_90760 ) ) ( ON ?auto_90753 ?auto_90759 ) ( not ( = ?auto_90753 ?auto_90759 ) ) ( not ( = ?auto_90754 ?auto_90759 ) ) ( not ( = ?auto_90755 ?auto_90759 ) ) ( not ( = ?auto_90756 ?auto_90759 ) ) ( not ( = ?auto_90757 ?auto_90759 ) ) ( not ( = ?auto_90758 ?auto_90759 ) ) ( not ( = ?auto_90760 ?auto_90759 ) ) ( CLEAR ?auto_90755 ) ( ON ?auto_90754 ?auto_90753 ) ( CLEAR ?auto_90754 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90759 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90759 ?auto_90753 )
      ( MAKE-4PILE ?auto_90753 ?auto_90754 ?auto_90755 ?auto_90756 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90761 - BLOCK
      ?auto_90762 - BLOCK
      ?auto_90763 - BLOCK
      ?auto_90764 - BLOCK
    )
    :vars
    (
      ?auto_90767 - BLOCK
      ?auto_90765 - BLOCK
      ?auto_90768 - BLOCK
      ?auto_90766 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90761 ?auto_90762 ) ) ( not ( = ?auto_90761 ?auto_90763 ) ) ( not ( = ?auto_90761 ?auto_90764 ) ) ( not ( = ?auto_90762 ?auto_90763 ) ) ( not ( = ?auto_90762 ?auto_90764 ) ) ( not ( = ?auto_90763 ?auto_90764 ) ) ( ON ?auto_90764 ?auto_90767 ) ( not ( = ?auto_90761 ?auto_90767 ) ) ( not ( = ?auto_90762 ?auto_90767 ) ) ( not ( = ?auto_90763 ?auto_90767 ) ) ( not ( = ?auto_90764 ?auto_90767 ) ) ( ON-TABLE ?auto_90765 ) ( ON ?auto_90768 ?auto_90765 ) ( ON ?auto_90767 ?auto_90768 ) ( not ( = ?auto_90765 ?auto_90768 ) ) ( not ( = ?auto_90765 ?auto_90767 ) ) ( not ( = ?auto_90765 ?auto_90764 ) ) ( not ( = ?auto_90765 ?auto_90763 ) ) ( not ( = ?auto_90768 ?auto_90767 ) ) ( not ( = ?auto_90768 ?auto_90764 ) ) ( not ( = ?auto_90768 ?auto_90763 ) ) ( not ( = ?auto_90761 ?auto_90765 ) ) ( not ( = ?auto_90761 ?auto_90768 ) ) ( not ( = ?auto_90762 ?auto_90765 ) ) ( not ( = ?auto_90762 ?auto_90768 ) ) ( ON ?auto_90761 ?auto_90766 ) ( not ( = ?auto_90761 ?auto_90766 ) ) ( not ( = ?auto_90762 ?auto_90766 ) ) ( not ( = ?auto_90763 ?auto_90766 ) ) ( not ( = ?auto_90764 ?auto_90766 ) ) ( not ( = ?auto_90767 ?auto_90766 ) ) ( not ( = ?auto_90765 ?auto_90766 ) ) ( not ( = ?auto_90768 ?auto_90766 ) ) ( ON ?auto_90762 ?auto_90761 ) ( CLEAR ?auto_90762 ) ( ON-TABLE ?auto_90766 ) ( HOLDING ?auto_90763 ) ( CLEAR ?auto_90764 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90765 ?auto_90768 ?auto_90767 ?auto_90764 ?auto_90763 )
      ( MAKE-4PILE ?auto_90761 ?auto_90762 ?auto_90763 ?auto_90764 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90769 - BLOCK
      ?auto_90770 - BLOCK
      ?auto_90771 - BLOCK
      ?auto_90772 - BLOCK
    )
    :vars
    (
      ?auto_90775 - BLOCK
      ?auto_90776 - BLOCK
      ?auto_90773 - BLOCK
      ?auto_90774 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90769 ?auto_90770 ) ) ( not ( = ?auto_90769 ?auto_90771 ) ) ( not ( = ?auto_90769 ?auto_90772 ) ) ( not ( = ?auto_90770 ?auto_90771 ) ) ( not ( = ?auto_90770 ?auto_90772 ) ) ( not ( = ?auto_90771 ?auto_90772 ) ) ( ON ?auto_90772 ?auto_90775 ) ( not ( = ?auto_90769 ?auto_90775 ) ) ( not ( = ?auto_90770 ?auto_90775 ) ) ( not ( = ?auto_90771 ?auto_90775 ) ) ( not ( = ?auto_90772 ?auto_90775 ) ) ( ON-TABLE ?auto_90776 ) ( ON ?auto_90773 ?auto_90776 ) ( ON ?auto_90775 ?auto_90773 ) ( not ( = ?auto_90776 ?auto_90773 ) ) ( not ( = ?auto_90776 ?auto_90775 ) ) ( not ( = ?auto_90776 ?auto_90772 ) ) ( not ( = ?auto_90776 ?auto_90771 ) ) ( not ( = ?auto_90773 ?auto_90775 ) ) ( not ( = ?auto_90773 ?auto_90772 ) ) ( not ( = ?auto_90773 ?auto_90771 ) ) ( not ( = ?auto_90769 ?auto_90776 ) ) ( not ( = ?auto_90769 ?auto_90773 ) ) ( not ( = ?auto_90770 ?auto_90776 ) ) ( not ( = ?auto_90770 ?auto_90773 ) ) ( ON ?auto_90769 ?auto_90774 ) ( not ( = ?auto_90769 ?auto_90774 ) ) ( not ( = ?auto_90770 ?auto_90774 ) ) ( not ( = ?auto_90771 ?auto_90774 ) ) ( not ( = ?auto_90772 ?auto_90774 ) ) ( not ( = ?auto_90775 ?auto_90774 ) ) ( not ( = ?auto_90776 ?auto_90774 ) ) ( not ( = ?auto_90773 ?auto_90774 ) ) ( ON ?auto_90770 ?auto_90769 ) ( ON-TABLE ?auto_90774 ) ( CLEAR ?auto_90772 ) ( ON ?auto_90771 ?auto_90770 ) ( CLEAR ?auto_90771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90774 ?auto_90769 ?auto_90770 )
      ( MAKE-4PILE ?auto_90769 ?auto_90770 ?auto_90771 ?auto_90772 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90777 - BLOCK
      ?auto_90778 - BLOCK
      ?auto_90779 - BLOCK
      ?auto_90780 - BLOCK
    )
    :vars
    (
      ?auto_90781 - BLOCK
      ?auto_90783 - BLOCK
      ?auto_90784 - BLOCK
      ?auto_90782 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90777 ?auto_90778 ) ) ( not ( = ?auto_90777 ?auto_90779 ) ) ( not ( = ?auto_90777 ?auto_90780 ) ) ( not ( = ?auto_90778 ?auto_90779 ) ) ( not ( = ?auto_90778 ?auto_90780 ) ) ( not ( = ?auto_90779 ?auto_90780 ) ) ( not ( = ?auto_90777 ?auto_90781 ) ) ( not ( = ?auto_90778 ?auto_90781 ) ) ( not ( = ?auto_90779 ?auto_90781 ) ) ( not ( = ?auto_90780 ?auto_90781 ) ) ( ON-TABLE ?auto_90783 ) ( ON ?auto_90784 ?auto_90783 ) ( ON ?auto_90781 ?auto_90784 ) ( not ( = ?auto_90783 ?auto_90784 ) ) ( not ( = ?auto_90783 ?auto_90781 ) ) ( not ( = ?auto_90783 ?auto_90780 ) ) ( not ( = ?auto_90783 ?auto_90779 ) ) ( not ( = ?auto_90784 ?auto_90781 ) ) ( not ( = ?auto_90784 ?auto_90780 ) ) ( not ( = ?auto_90784 ?auto_90779 ) ) ( not ( = ?auto_90777 ?auto_90783 ) ) ( not ( = ?auto_90777 ?auto_90784 ) ) ( not ( = ?auto_90778 ?auto_90783 ) ) ( not ( = ?auto_90778 ?auto_90784 ) ) ( ON ?auto_90777 ?auto_90782 ) ( not ( = ?auto_90777 ?auto_90782 ) ) ( not ( = ?auto_90778 ?auto_90782 ) ) ( not ( = ?auto_90779 ?auto_90782 ) ) ( not ( = ?auto_90780 ?auto_90782 ) ) ( not ( = ?auto_90781 ?auto_90782 ) ) ( not ( = ?auto_90783 ?auto_90782 ) ) ( not ( = ?auto_90784 ?auto_90782 ) ) ( ON ?auto_90778 ?auto_90777 ) ( ON-TABLE ?auto_90782 ) ( ON ?auto_90779 ?auto_90778 ) ( CLEAR ?auto_90779 ) ( HOLDING ?auto_90780 ) ( CLEAR ?auto_90781 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90783 ?auto_90784 ?auto_90781 ?auto_90780 )
      ( MAKE-4PILE ?auto_90777 ?auto_90778 ?auto_90779 ?auto_90780 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90785 - BLOCK
      ?auto_90786 - BLOCK
      ?auto_90787 - BLOCK
      ?auto_90788 - BLOCK
    )
    :vars
    (
      ?auto_90789 - BLOCK
      ?auto_90790 - BLOCK
      ?auto_90792 - BLOCK
      ?auto_90791 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90785 ?auto_90786 ) ) ( not ( = ?auto_90785 ?auto_90787 ) ) ( not ( = ?auto_90785 ?auto_90788 ) ) ( not ( = ?auto_90786 ?auto_90787 ) ) ( not ( = ?auto_90786 ?auto_90788 ) ) ( not ( = ?auto_90787 ?auto_90788 ) ) ( not ( = ?auto_90785 ?auto_90789 ) ) ( not ( = ?auto_90786 ?auto_90789 ) ) ( not ( = ?auto_90787 ?auto_90789 ) ) ( not ( = ?auto_90788 ?auto_90789 ) ) ( ON-TABLE ?auto_90790 ) ( ON ?auto_90792 ?auto_90790 ) ( ON ?auto_90789 ?auto_90792 ) ( not ( = ?auto_90790 ?auto_90792 ) ) ( not ( = ?auto_90790 ?auto_90789 ) ) ( not ( = ?auto_90790 ?auto_90788 ) ) ( not ( = ?auto_90790 ?auto_90787 ) ) ( not ( = ?auto_90792 ?auto_90789 ) ) ( not ( = ?auto_90792 ?auto_90788 ) ) ( not ( = ?auto_90792 ?auto_90787 ) ) ( not ( = ?auto_90785 ?auto_90790 ) ) ( not ( = ?auto_90785 ?auto_90792 ) ) ( not ( = ?auto_90786 ?auto_90790 ) ) ( not ( = ?auto_90786 ?auto_90792 ) ) ( ON ?auto_90785 ?auto_90791 ) ( not ( = ?auto_90785 ?auto_90791 ) ) ( not ( = ?auto_90786 ?auto_90791 ) ) ( not ( = ?auto_90787 ?auto_90791 ) ) ( not ( = ?auto_90788 ?auto_90791 ) ) ( not ( = ?auto_90789 ?auto_90791 ) ) ( not ( = ?auto_90790 ?auto_90791 ) ) ( not ( = ?auto_90792 ?auto_90791 ) ) ( ON ?auto_90786 ?auto_90785 ) ( ON-TABLE ?auto_90791 ) ( ON ?auto_90787 ?auto_90786 ) ( CLEAR ?auto_90789 ) ( ON ?auto_90788 ?auto_90787 ) ( CLEAR ?auto_90788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90791 ?auto_90785 ?auto_90786 ?auto_90787 )
      ( MAKE-4PILE ?auto_90785 ?auto_90786 ?auto_90787 ?auto_90788 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90793 - BLOCK
      ?auto_90794 - BLOCK
      ?auto_90795 - BLOCK
      ?auto_90796 - BLOCK
    )
    :vars
    (
      ?auto_90799 - BLOCK
      ?auto_90800 - BLOCK
      ?auto_90797 - BLOCK
      ?auto_90798 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90793 ?auto_90794 ) ) ( not ( = ?auto_90793 ?auto_90795 ) ) ( not ( = ?auto_90793 ?auto_90796 ) ) ( not ( = ?auto_90794 ?auto_90795 ) ) ( not ( = ?auto_90794 ?auto_90796 ) ) ( not ( = ?auto_90795 ?auto_90796 ) ) ( not ( = ?auto_90793 ?auto_90799 ) ) ( not ( = ?auto_90794 ?auto_90799 ) ) ( not ( = ?auto_90795 ?auto_90799 ) ) ( not ( = ?auto_90796 ?auto_90799 ) ) ( ON-TABLE ?auto_90800 ) ( ON ?auto_90797 ?auto_90800 ) ( not ( = ?auto_90800 ?auto_90797 ) ) ( not ( = ?auto_90800 ?auto_90799 ) ) ( not ( = ?auto_90800 ?auto_90796 ) ) ( not ( = ?auto_90800 ?auto_90795 ) ) ( not ( = ?auto_90797 ?auto_90799 ) ) ( not ( = ?auto_90797 ?auto_90796 ) ) ( not ( = ?auto_90797 ?auto_90795 ) ) ( not ( = ?auto_90793 ?auto_90800 ) ) ( not ( = ?auto_90793 ?auto_90797 ) ) ( not ( = ?auto_90794 ?auto_90800 ) ) ( not ( = ?auto_90794 ?auto_90797 ) ) ( ON ?auto_90793 ?auto_90798 ) ( not ( = ?auto_90793 ?auto_90798 ) ) ( not ( = ?auto_90794 ?auto_90798 ) ) ( not ( = ?auto_90795 ?auto_90798 ) ) ( not ( = ?auto_90796 ?auto_90798 ) ) ( not ( = ?auto_90799 ?auto_90798 ) ) ( not ( = ?auto_90800 ?auto_90798 ) ) ( not ( = ?auto_90797 ?auto_90798 ) ) ( ON ?auto_90794 ?auto_90793 ) ( ON-TABLE ?auto_90798 ) ( ON ?auto_90795 ?auto_90794 ) ( ON ?auto_90796 ?auto_90795 ) ( CLEAR ?auto_90796 ) ( HOLDING ?auto_90799 ) ( CLEAR ?auto_90797 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90800 ?auto_90797 ?auto_90799 )
      ( MAKE-4PILE ?auto_90793 ?auto_90794 ?auto_90795 ?auto_90796 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90801 - BLOCK
      ?auto_90802 - BLOCK
      ?auto_90803 - BLOCK
      ?auto_90804 - BLOCK
    )
    :vars
    (
      ?auto_90805 - BLOCK
      ?auto_90808 - BLOCK
      ?auto_90806 - BLOCK
      ?auto_90807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90801 ?auto_90802 ) ) ( not ( = ?auto_90801 ?auto_90803 ) ) ( not ( = ?auto_90801 ?auto_90804 ) ) ( not ( = ?auto_90802 ?auto_90803 ) ) ( not ( = ?auto_90802 ?auto_90804 ) ) ( not ( = ?auto_90803 ?auto_90804 ) ) ( not ( = ?auto_90801 ?auto_90805 ) ) ( not ( = ?auto_90802 ?auto_90805 ) ) ( not ( = ?auto_90803 ?auto_90805 ) ) ( not ( = ?auto_90804 ?auto_90805 ) ) ( ON-TABLE ?auto_90808 ) ( ON ?auto_90806 ?auto_90808 ) ( not ( = ?auto_90808 ?auto_90806 ) ) ( not ( = ?auto_90808 ?auto_90805 ) ) ( not ( = ?auto_90808 ?auto_90804 ) ) ( not ( = ?auto_90808 ?auto_90803 ) ) ( not ( = ?auto_90806 ?auto_90805 ) ) ( not ( = ?auto_90806 ?auto_90804 ) ) ( not ( = ?auto_90806 ?auto_90803 ) ) ( not ( = ?auto_90801 ?auto_90808 ) ) ( not ( = ?auto_90801 ?auto_90806 ) ) ( not ( = ?auto_90802 ?auto_90808 ) ) ( not ( = ?auto_90802 ?auto_90806 ) ) ( ON ?auto_90801 ?auto_90807 ) ( not ( = ?auto_90801 ?auto_90807 ) ) ( not ( = ?auto_90802 ?auto_90807 ) ) ( not ( = ?auto_90803 ?auto_90807 ) ) ( not ( = ?auto_90804 ?auto_90807 ) ) ( not ( = ?auto_90805 ?auto_90807 ) ) ( not ( = ?auto_90808 ?auto_90807 ) ) ( not ( = ?auto_90806 ?auto_90807 ) ) ( ON ?auto_90802 ?auto_90801 ) ( ON-TABLE ?auto_90807 ) ( ON ?auto_90803 ?auto_90802 ) ( ON ?auto_90804 ?auto_90803 ) ( CLEAR ?auto_90806 ) ( ON ?auto_90805 ?auto_90804 ) ( CLEAR ?auto_90805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90807 ?auto_90801 ?auto_90802 ?auto_90803 ?auto_90804 )
      ( MAKE-4PILE ?auto_90801 ?auto_90802 ?auto_90803 ?auto_90804 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90809 - BLOCK
      ?auto_90810 - BLOCK
      ?auto_90811 - BLOCK
      ?auto_90812 - BLOCK
    )
    :vars
    (
      ?auto_90814 - BLOCK
      ?auto_90815 - BLOCK
      ?auto_90816 - BLOCK
      ?auto_90813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90809 ?auto_90810 ) ) ( not ( = ?auto_90809 ?auto_90811 ) ) ( not ( = ?auto_90809 ?auto_90812 ) ) ( not ( = ?auto_90810 ?auto_90811 ) ) ( not ( = ?auto_90810 ?auto_90812 ) ) ( not ( = ?auto_90811 ?auto_90812 ) ) ( not ( = ?auto_90809 ?auto_90814 ) ) ( not ( = ?auto_90810 ?auto_90814 ) ) ( not ( = ?auto_90811 ?auto_90814 ) ) ( not ( = ?auto_90812 ?auto_90814 ) ) ( ON-TABLE ?auto_90815 ) ( not ( = ?auto_90815 ?auto_90816 ) ) ( not ( = ?auto_90815 ?auto_90814 ) ) ( not ( = ?auto_90815 ?auto_90812 ) ) ( not ( = ?auto_90815 ?auto_90811 ) ) ( not ( = ?auto_90816 ?auto_90814 ) ) ( not ( = ?auto_90816 ?auto_90812 ) ) ( not ( = ?auto_90816 ?auto_90811 ) ) ( not ( = ?auto_90809 ?auto_90815 ) ) ( not ( = ?auto_90809 ?auto_90816 ) ) ( not ( = ?auto_90810 ?auto_90815 ) ) ( not ( = ?auto_90810 ?auto_90816 ) ) ( ON ?auto_90809 ?auto_90813 ) ( not ( = ?auto_90809 ?auto_90813 ) ) ( not ( = ?auto_90810 ?auto_90813 ) ) ( not ( = ?auto_90811 ?auto_90813 ) ) ( not ( = ?auto_90812 ?auto_90813 ) ) ( not ( = ?auto_90814 ?auto_90813 ) ) ( not ( = ?auto_90815 ?auto_90813 ) ) ( not ( = ?auto_90816 ?auto_90813 ) ) ( ON ?auto_90810 ?auto_90809 ) ( ON-TABLE ?auto_90813 ) ( ON ?auto_90811 ?auto_90810 ) ( ON ?auto_90812 ?auto_90811 ) ( ON ?auto_90814 ?auto_90812 ) ( CLEAR ?auto_90814 ) ( HOLDING ?auto_90816 ) ( CLEAR ?auto_90815 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90815 ?auto_90816 )
      ( MAKE-4PILE ?auto_90809 ?auto_90810 ?auto_90811 ?auto_90812 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90817 - BLOCK
      ?auto_90818 - BLOCK
      ?auto_90819 - BLOCK
      ?auto_90820 - BLOCK
    )
    :vars
    (
      ?auto_90822 - BLOCK
      ?auto_90821 - BLOCK
      ?auto_90824 - BLOCK
      ?auto_90823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90817 ?auto_90818 ) ) ( not ( = ?auto_90817 ?auto_90819 ) ) ( not ( = ?auto_90817 ?auto_90820 ) ) ( not ( = ?auto_90818 ?auto_90819 ) ) ( not ( = ?auto_90818 ?auto_90820 ) ) ( not ( = ?auto_90819 ?auto_90820 ) ) ( not ( = ?auto_90817 ?auto_90822 ) ) ( not ( = ?auto_90818 ?auto_90822 ) ) ( not ( = ?auto_90819 ?auto_90822 ) ) ( not ( = ?auto_90820 ?auto_90822 ) ) ( ON-TABLE ?auto_90821 ) ( not ( = ?auto_90821 ?auto_90824 ) ) ( not ( = ?auto_90821 ?auto_90822 ) ) ( not ( = ?auto_90821 ?auto_90820 ) ) ( not ( = ?auto_90821 ?auto_90819 ) ) ( not ( = ?auto_90824 ?auto_90822 ) ) ( not ( = ?auto_90824 ?auto_90820 ) ) ( not ( = ?auto_90824 ?auto_90819 ) ) ( not ( = ?auto_90817 ?auto_90821 ) ) ( not ( = ?auto_90817 ?auto_90824 ) ) ( not ( = ?auto_90818 ?auto_90821 ) ) ( not ( = ?auto_90818 ?auto_90824 ) ) ( ON ?auto_90817 ?auto_90823 ) ( not ( = ?auto_90817 ?auto_90823 ) ) ( not ( = ?auto_90818 ?auto_90823 ) ) ( not ( = ?auto_90819 ?auto_90823 ) ) ( not ( = ?auto_90820 ?auto_90823 ) ) ( not ( = ?auto_90822 ?auto_90823 ) ) ( not ( = ?auto_90821 ?auto_90823 ) ) ( not ( = ?auto_90824 ?auto_90823 ) ) ( ON ?auto_90818 ?auto_90817 ) ( ON-TABLE ?auto_90823 ) ( ON ?auto_90819 ?auto_90818 ) ( ON ?auto_90820 ?auto_90819 ) ( ON ?auto_90822 ?auto_90820 ) ( CLEAR ?auto_90821 ) ( ON ?auto_90824 ?auto_90822 ) ( CLEAR ?auto_90824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90823 ?auto_90817 ?auto_90818 ?auto_90819 ?auto_90820 ?auto_90822 )
      ( MAKE-4PILE ?auto_90817 ?auto_90818 ?auto_90819 ?auto_90820 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90825 - BLOCK
      ?auto_90826 - BLOCK
      ?auto_90827 - BLOCK
      ?auto_90828 - BLOCK
    )
    :vars
    (
      ?auto_90829 - BLOCK
      ?auto_90830 - BLOCK
      ?auto_90831 - BLOCK
      ?auto_90832 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90825 ?auto_90826 ) ) ( not ( = ?auto_90825 ?auto_90827 ) ) ( not ( = ?auto_90825 ?auto_90828 ) ) ( not ( = ?auto_90826 ?auto_90827 ) ) ( not ( = ?auto_90826 ?auto_90828 ) ) ( not ( = ?auto_90827 ?auto_90828 ) ) ( not ( = ?auto_90825 ?auto_90829 ) ) ( not ( = ?auto_90826 ?auto_90829 ) ) ( not ( = ?auto_90827 ?auto_90829 ) ) ( not ( = ?auto_90828 ?auto_90829 ) ) ( not ( = ?auto_90830 ?auto_90831 ) ) ( not ( = ?auto_90830 ?auto_90829 ) ) ( not ( = ?auto_90830 ?auto_90828 ) ) ( not ( = ?auto_90830 ?auto_90827 ) ) ( not ( = ?auto_90831 ?auto_90829 ) ) ( not ( = ?auto_90831 ?auto_90828 ) ) ( not ( = ?auto_90831 ?auto_90827 ) ) ( not ( = ?auto_90825 ?auto_90830 ) ) ( not ( = ?auto_90825 ?auto_90831 ) ) ( not ( = ?auto_90826 ?auto_90830 ) ) ( not ( = ?auto_90826 ?auto_90831 ) ) ( ON ?auto_90825 ?auto_90832 ) ( not ( = ?auto_90825 ?auto_90832 ) ) ( not ( = ?auto_90826 ?auto_90832 ) ) ( not ( = ?auto_90827 ?auto_90832 ) ) ( not ( = ?auto_90828 ?auto_90832 ) ) ( not ( = ?auto_90829 ?auto_90832 ) ) ( not ( = ?auto_90830 ?auto_90832 ) ) ( not ( = ?auto_90831 ?auto_90832 ) ) ( ON ?auto_90826 ?auto_90825 ) ( ON-TABLE ?auto_90832 ) ( ON ?auto_90827 ?auto_90826 ) ( ON ?auto_90828 ?auto_90827 ) ( ON ?auto_90829 ?auto_90828 ) ( ON ?auto_90831 ?auto_90829 ) ( CLEAR ?auto_90831 ) ( HOLDING ?auto_90830 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90830 )
      ( MAKE-4PILE ?auto_90825 ?auto_90826 ?auto_90827 ?auto_90828 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90833 - BLOCK
      ?auto_90834 - BLOCK
      ?auto_90835 - BLOCK
      ?auto_90836 - BLOCK
    )
    :vars
    (
      ?auto_90840 - BLOCK
      ?auto_90838 - BLOCK
      ?auto_90839 - BLOCK
      ?auto_90837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90833 ?auto_90834 ) ) ( not ( = ?auto_90833 ?auto_90835 ) ) ( not ( = ?auto_90833 ?auto_90836 ) ) ( not ( = ?auto_90834 ?auto_90835 ) ) ( not ( = ?auto_90834 ?auto_90836 ) ) ( not ( = ?auto_90835 ?auto_90836 ) ) ( not ( = ?auto_90833 ?auto_90840 ) ) ( not ( = ?auto_90834 ?auto_90840 ) ) ( not ( = ?auto_90835 ?auto_90840 ) ) ( not ( = ?auto_90836 ?auto_90840 ) ) ( not ( = ?auto_90838 ?auto_90839 ) ) ( not ( = ?auto_90838 ?auto_90840 ) ) ( not ( = ?auto_90838 ?auto_90836 ) ) ( not ( = ?auto_90838 ?auto_90835 ) ) ( not ( = ?auto_90839 ?auto_90840 ) ) ( not ( = ?auto_90839 ?auto_90836 ) ) ( not ( = ?auto_90839 ?auto_90835 ) ) ( not ( = ?auto_90833 ?auto_90838 ) ) ( not ( = ?auto_90833 ?auto_90839 ) ) ( not ( = ?auto_90834 ?auto_90838 ) ) ( not ( = ?auto_90834 ?auto_90839 ) ) ( ON ?auto_90833 ?auto_90837 ) ( not ( = ?auto_90833 ?auto_90837 ) ) ( not ( = ?auto_90834 ?auto_90837 ) ) ( not ( = ?auto_90835 ?auto_90837 ) ) ( not ( = ?auto_90836 ?auto_90837 ) ) ( not ( = ?auto_90840 ?auto_90837 ) ) ( not ( = ?auto_90838 ?auto_90837 ) ) ( not ( = ?auto_90839 ?auto_90837 ) ) ( ON ?auto_90834 ?auto_90833 ) ( ON-TABLE ?auto_90837 ) ( ON ?auto_90835 ?auto_90834 ) ( ON ?auto_90836 ?auto_90835 ) ( ON ?auto_90840 ?auto_90836 ) ( ON ?auto_90839 ?auto_90840 ) ( ON ?auto_90838 ?auto_90839 ) ( CLEAR ?auto_90838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_90837 ?auto_90833 ?auto_90834 ?auto_90835 ?auto_90836 ?auto_90840 ?auto_90839 )
      ( MAKE-4PILE ?auto_90833 ?auto_90834 ?auto_90835 ?auto_90836 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90856 - BLOCK
      ?auto_90857 - BLOCK
    )
    :vars
    (
      ?auto_90859 - BLOCK
      ?auto_90858 - BLOCK
      ?auto_90860 - BLOCK
      ?auto_90861 - BLOCK
      ?auto_90862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90859 ?auto_90857 ) ( ON-TABLE ?auto_90856 ) ( ON ?auto_90857 ?auto_90856 ) ( not ( = ?auto_90856 ?auto_90857 ) ) ( not ( = ?auto_90856 ?auto_90859 ) ) ( not ( = ?auto_90857 ?auto_90859 ) ) ( not ( = ?auto_90856 ?auto_90858 ) ) ( not ( = ?auto_90856 ?auto_90860 ) ) ( not ( = ?auto_90857 ?auto_90858 ) ) ( not ( = ?auto_90857 ?auto_90860 ) ) ( not ( = ?auto_90859 ?auto_90858 ) ) ( not ( = ?auto_90859 ?auto_90860 ) ) ( not ( = ?auto_90858 ?auto_90860 ) ) ( ON ?auto_90858 ?auto_90859 ) ( CLEAR ?auto_90858 ) ( HOLDING ?auto_90860 ) ( CLEAR ?auto_90861 ) ( ON-TABLE ?auto_90862 ) ( ON ?auto_90861 ?auto_90862 ) ( not ( = ?auto_90862 ?auto_90861 ) ) ( not ( = ?auto_90862 ?auto_90860 ) ) ( not ( = ?auto_90861 ?auto_90860 ) ) ( not ( = ?auto_90856 ?auto_90861 ) ) ( not ( = ?auto_90856 ?auto_90862 ) ) ( not ( = ?auto_90857 ?auto_90861 ) ) ( not ( = ?auto_90857 ?auto_90862 ) ) ( not ( = ?auto_90859 ?auto_90861 ) ) ( not ( = ?auto_90859 ?auto_90862 ) ) ( not ( = ?auto_90858 ?auto_90861 ) ) ( not ( = ?auto_90858 ?auto_90862 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90862 ?auto_90861 ?auto_90860 )
      ( MAKE-2PILE ?auto_90856 ?auto_90857 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90863 - BLOCK
      ?auto_90864 - BLOCK
    )
    :vars
    (
      ?auto_90865 - BLOCK
      ?auto_90866 - BLOCK
      ?auto_90868 - BLOCK
      ?auto_90869 - BLOCK
      ?auto_90867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90865 ?auto_90864 ) ( ON-TABLE ?auto_90863 ) ( ON ?auto_90864 ?auto_90863 ) ( not ( = ?auto_90863 ?auto_90864 ) ) ( not ( = ?auto_90863 ?auto_90865 ) ) ( not ( = ?auto_90864 ?auto_90865 ) ) ( not ( = ?auto_90863 ?auto_90866 ) ) ( not ( = ?auto_90863 ?auto_90868 ) ) ( not ( = ?auto_90864 ?auto_90866 ) ) ( not ( = ?auto_90864 ?auto_90868 ) ) ( not ( = ?auto_90865 ?auto_90866 ) ) ( not ( = ?auto_90865 ?auto_90868 ) ) ( not ( = ?auto_90866 ?auto_90868 ) ) ( ON ?auto_90866 ?auto_90865 ) ( CLEAR ?auto_90869 ) ( ON-TABLE ?auto_90867 ) ( ON ?auto_90869 ?auto_90867 ) ( not ( = ?auto_90867 ?auto_90869 ) ) ( not ( = ?auto_90867 ?auto_90868 ) ) ( not ( = ?auto_90869 ?auto_90868 ) ) ( not ( = ?auto_90863 ?auto_90869 ) ) ( not ( = ?auto_90863 ?auto_90867 ) ) ( not ( = ?auto_90864 ?auto_90869 ) ) ( not ( = ?auto_90864 ?auto_90867 ) ) ( not ( = ?auto_90865 ?auto_90869 ) ) ( not ( = ?auto_90865 ?auto_90867 ) ) ( not ( = ?auto_90866 ?auto_90869 ) ) ( not ( = ?auto_90866 ?auto_90867 ) ) ( ON ?auto_90868 ?auto_90866 ) ( CLEAR ?auto_90868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90863 ?auto_90864 ?auto_90865 ?auto_90866 )
      ( MAKE-2PILE ?auto_90863 ?auto_90864 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90870 - BLOCK
      ?auto_90871 - BLOCK
    )
    :vars
    (
      ?auto_90875 - BLOCK
      ?auto_90876 - BLOCK
      ?auto_90874 - BLOCK
      ?auto_90873 - BLOCK
      ?auto_90872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90875 ?auto_90871 ) ( ON-TABLE ?auto_90870 ) ( ON ?auto_90871 ?auto_90870 ) ( not ( = ?auto_90870 ?auto_90871 ) ) ( not ( = ?auto_90870 ?auto_90875 ) ) ( not ( = ?auto_90871 ?auto_90875 ) ) ( not ( = ?auto_90870 ?auto_90876 ) ) ( not ( = ?auto_90870 ?auto_90874 ) ) ( not ( = ?auto_90871 ?auto_90876 ) ) ( not ( = ?auto_90871 ?auto_90874 ) ) ( not ( = ?auto_90875 ?auto_90876 ) ) ( not ( = ?auto_90875 ?auto_90874 ) ) ( not ( = ?auto_90876 ?auto_90874 ) ) ( ON ?auto_90876 ?auto_90875 ) ( ON-TABLE ?auto_90873 ) ( not ( = ?auto_90873 ?auto_90872 ) ) ( not ( = ?auto_90873 ?auto_90874 ) ) ( not ( = ?auto_90872 ?auto_90874 ) ) ( not ( = ?auto_90870 ?auto_90872 ) ) ( not ( = ?auto_90870 ?auto_90873 ) ) ( not ( = ?auto_90871 ?auto_90872 ) ) ( not ( = ?auto_90871 ?auto_90873 ) ) ( not ( = ?auto_90875 ?auto_90872 ) ) ( not ( = ?auto_90875 ?auto_90873 ) ) ( not ( = ?auto_90876 ?auto_90872 ) ) ( not ( = ?auto_90876 ?auto_90873 ) ) ( ON ?auto_90874 ?auto_90876 ) ( CLEAR ?auto_90874 ) ( HOLDING ?auto_90872 ) ( CLEAR ?auto_90873 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90873 ?auto_90872 )
      ( MAKE-2PILE ?auto_90870 ?auto_90871 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90877 - BLOCK
      ?auto_90878 - BLOCK
    )
    :vars
    (
      ?auto_90882 - BLOCK
      ?auto_90879 - BLOCK
      ?auto_90880 - BLOCK
      ?auto_90881 - BLOCK
      ?auto_90883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90882 ?auto_90878 ) ( ON-TABLE ?auto_90877 ) ( ON ?auto_90878 ?auto_90877 ) ( not ( = ?auto_90877 ?auto_90878 ) ) ( not ( = ?auto_90877 ?auto_90882 ) ) ( not ( = ?auto_90878 ?auto_90882 ) ) ( not ( = ?auto_90877 ?auto_90879 ) ) ( not ( = ?auto_90877 ?auto_90880 ) ) ( not ( = ?auto_90878 ?auto_90879 ) ) ( not ( = ?auto_90878 ?auto_90880 ) ) ( not ( = ?auto_90882 ?auto_90879 ) ) ( not ( = ?auto_90882 ?auto_90880 ) ) ( not ( = ?auto_90879 ?auto_90880 ) ) ( ON ?auto_90879 ?auto_90882 ) ( ON-TABLE ?auto_90881 ) ( not ( = ?auto_90881 ?auto_90883 ) ) ( not ( = ?auto_90881 ?auto_90880 ) ) ( not ( = ?auto_90883 ?auto_90880 ) ) ( not ( = ?auto_90877 ?auto_90883 ) ) ( not ( = ?auto_90877 ?auto_90881 ) ) ( not ( = ?auto_90878 ?auto_90883 ) ) ( not ( = ?auto_90878 ?auto_90881 ) ) ( not ( = ?auto_90882 ?auto_90883 ) ) ( not ( = ?auto_90882 ?auto_90881 ) ) ( not ( = ?auto_90879 ?auto_90883 ) ) ( not ( = ?auto_90879 ?auto_90881 ) ) ( ON ?auto_90880 ?auto_90879 ) ( CLEAR ?auto_90881 ) ( ON ?auto_90883 ?auto_90880 ) ( CLEAR ?auto_90883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90877 ?auto_90878 ?auto_90882 ?auto_90879 ?auto_90880 )
      ( MAKE-2PILE ?auto_90877 ?auto_90878 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90884 - BLOCK
      ?auto_90885 - BLOCK
    )
    :vars
    (
      ?auto_90887 - BLOCK
      ?auto_90888 - BLOCK
      ?auto_90889 - BLOCK
      ?auto_90886 - BLOCK
      ?auto_90890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90887 ?auto_90885 ) ( ON-TABLE ?auto_90884 ) ( ON ?auto_90885 ?auto_90884 ) ( not ( = ?auto_90884 ?auto_90885 ) ) ( not ( = ?auto_90884 ?auto_90887 ) ) ( not ( = ?auto_90885 ?auto_90887 ) ) ( not ( = ?auto_90884 ?auto_90888 ) ) ( not ( = ?auto_90884 ?auto_90889 ) ) ( not ( = ?auto_90885 ?auto_90888 ) ) ( not ( = ?auto_90885 ?auto_90889 ) ) ( not ( = ?auto_90887 ?auto_90888 ) ) ( not ( = ?auto_90887 ?auto_90889 ) ) ( not ( = ?auto_90888 ?auto_90889 ) ) ( ON ?auto_90888 ?auto_90887 ) ( not ( = ?auto_90886 ?auto_90890 ) ) ( not ( = ?auto_90886 ?auto_90889 ) ) ( not ( = ?auto_90890 ?auto_90889 ) ) ( not ( = ?auto_90884 ?auto_90890 ) ) ( not ( = ?auto_90884 ?auto_90886 ) ) ( not ( = ?auto_90885 ?auto_90890 ) ) ( not ( = ?auto_90885 ?auto_90886 ) ) ( not ( = ?auto_90887 ?auto_90890 ) ) ( not ( = ?auto_90887 ?auto_90886 ) ) ( not ( = ?auto_90888 ?auto_90890 ) ) ( not ( = ?auto_90888 ?auto_90886 ) ) ( ON ?auto_90889 ?auto_90888 ) ( ON ?auto_90890 ?auto_90889 ) ( CLEAR ?auto_90890 ) ( HOLDING ?auto_90886 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90886 )
      ( MAKE-2PILE ?auto_90884 ?auto_90885 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90900 - BLOCK
      ?auto_90901 - BLOCK
    )
    :vars
    (
      ?auto_90904 - BLOCK
      ?auto_90905 - BLOCK
      ?auto_90902 - BLOCK
      ?auto_90906 - BLOCK
      ?auto_90903 - BLOCK
      ?auto_90907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90904 ?auto_90901 ) ( ON-TABLE ?auto_90900 ) ( ON ?auto_90901 ?auto_90900 ) ( not ( = ?auto_90900 ?auto_90901 ) ) ( not ( = ?auto_90900 ?auto_90904 ) ) ( not ( = ?auto_90901 ?auto_90904 ) ) ( not ( = ?auto_90900 ?auto_90905 ) ) ( not ( = ?auto_90900 ?auto_90902 ) ) ( not ( = ?auto_90901 ?auto_90905 ) ) ( not ( = ?auto_90901 ?auto_90902 ) ) ( not ( = ?auto_90904 ?auto_90905 ) ) ( not ( = ?auto_90904 ?auto_90902 ) ) ( not ( = ?auto_90905 ?auto_90902 ) ) ( ON ?auto_90905 ?auto_90904 ) ( not ( = ?auto_90906 ?auto_90903 ) ) ( not ( = ?auto_90906 ?auto_90902 ) ) ( not ( = ?auto_90903 ?auto_90902 ) ) ( not ( = ?auto_90900 ?auto_90903 ) ) ( not ( = ?auto_90900 ?auto_90906 ) ) ( not ( = ?auto_90901 ?auto_90903 ) ) ( not ( = ?auto_90901 ?auto_90906 ) ) ( not ( = ?auto_90904 ?auto_90903 ) ) ( not ( = ?auto_90904 ?auto_90906 ) ) ( not ( = ?auto_90905 ?auto_90903 ) ) ( not ( = ?auto_90905 ?auto_90906 ) ) ( ON ?auto_90902 ?auto_90905 ) ( ON ?auto_90903 ?auto_90902 ) ( CLEAR ?auto_90903 ) ( ON ?auto_90906 ?auto_90907 ) ( CLEAR ?auto_90906 ) ( HAND-EMPTY ) ( not ( = ?auto_90900 ?auto_90907 ) ) ( not ( = ?auto_90901 ?auto_90907 ) ) ( not ( = ?auto_90904 ?auto_90907 ) ) ( not ( = ?auto_90905 ?auto_90907 ) ) ( not ( = ?auto_90902 ?auto_90907 ) ) ( not ( = ?auto_90906 ?auto_90907 ) ) ( not ( = ?auto_90903 ?auto_90907 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90906 ?auto_90907 )
      ( MAKE-2PILE ?auto_90900 ?auto_90901 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90908 - BLOCK
      ?auto_90909 - BLOCK
    )
    :vars
    (
      ?auto_90915 - BLOCK
      ?auto_90911 - BLOCK
      ?auto_90913 - BLOCK
      ?auto_90910 - BLOCK
      ?auto_90912 - BLOCK
      ?auto_90914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90915 ?auto_90909 ) ( ON-TABLE ?auto_90908 ) ( ON ?auto_90909 ?auto_90908 ) ( not ( = ?auto_90908 ?auto_90909 ) ) ( not ( = ?auto_90908 ?auto_90915 ) ) ( not ( = ?auto_90909 ?auto_90915 ) ) ( not ( = ?auto_90908 ?auto_90911 ) ) ( not ( = ?auto_90908 ?auto_90913 ) ) ( not ( = ?auto_90909 ?auto_90911 ) ) ( not ( = ?auto_90909 ?auto_90913 ) ) ( not ( = ?auto_90915 ?auto_90911 ) ) ( not ( = ?auto_90915 ?auto_90913 ) ) ( not ( = ?auto_90911 ?auto_90913 ) ) ( ON ?auto_90911 ?auto_90915 ) ( not ( = ?auto_90910 ?auto_90912 ) ) ( not ( = ?auto_90910 ?auto_90913 ) ) ( not ( = ?auto_90912 ?auto_90913 ) ) ( not ( = ?auto_90908 ?auto_90912 ) ) ( not ( = ?auto_90908 ?auto_90910 ) ) ( not ( = ?auto_90909 ?auto_90912 ) ) ( not ( = ?auto_90909 ?auto_90910 ) ) ( not ( = ?auto_90915 ?auto_90912 ) ) ( not ( = ?auto_90915 ?auto_90910 ) ) ( not ( = ?auto_90911 ?auto_90912 ) ) ( not ( = ?auto_90911 ?auto_90910 ) ) ( ON ?auto_90913 ?auto_90911 ) ( ON ?auto_90910 ?auto_90914 ) ( CLEAR ?auto_90910 ) ( not ( = ?auto_90908 ?auto_90914 ) ) ( not ( = ?auto_90909 ?auto_90914 ) ) ( not ( = ?auto_90915 ?auto_90914 ) ) ( not ( = ?auto_90911 ?auto_90914 ) ) ( not ( = ?auto_90913 ?auto_90914 ) ) ( not ( = ?auto_90910 ?auto_90914 ) ) ( not ( = ?auto_90912 ?auto_90914 ) ) ( HOLDING ?auto_90912 ) ( CLEAR ?auto_90913 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90908 ?auto_90909 ?auto_90915 ?auto_90911 ?auto_90913 ?auto_90912 )
      ( MAKE-2PILE ?auto_90908 ?auto_90909 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90916 - BLOCK
      ?auto_90917 - BLOCK
    )
    :vars
    (
      ?auto_90922 - BLOCK
      ?auto_90920 - BLOCK
      ?auto_90923 - BLOCK
      ?auto_90921 - BLOCK
      ?auto_90918 - BLOCK
      ?auto_90919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90922 ?auto_90917 ) ( ON-TABLE ?auto_90916 ) ( ON ?auto_90917 ?auto_90916 ) ( not ( = ?auto_90916 ?auto_90917 ) ) ( not ( = ?auto_90916 ?auto_90922 ) ) ( not ( = ?auto_90917 ?auto_90922 ) ) ( not ( = ?auto_90916 ?auto_90920 ) ) ( not ( = ?auto_90916 ?auto_90923 ) ) ( not ( = ?auto_90917 ?auto_90920 ) ) ( not ( = ?auto_90917 ?auto_90923 ) ) ( not ( = ?auto_90922 ?auto_90920 ) ) ( not ( = ?auto_90922 ?auto_90923 ) ) ( not ( = ?auto_90920 ?auto_90923 ) ) ( ON ?auto_90920 ?auto_90922 ) ( not ( = ?auto_90921 ?auto_90918 ) ) ( not ( = ?auto_90921 ?auto_90923 ) ) ( not ( = ?auto_90918 ?auto_90923 ) ) ( not ( = ?auto_90916 ?auto_90918 ) ) ( not ( = ?auto_90916 ?auto_90921 ) ) ( not ( = ?auto_90917 ?auto_90918 ) ) ( not ( = ?auto_90917 ?auto_90921 ) ) ( not ( = ?auto_90922 ?auto_90918 ) ) ( not ( = ?auto_90922 ?auto_90921 ) ) ( not ( = ?auto_90920 ?auto_90918 ) ) ( not ( = ?auto_90920 ?auto_90921 ) ) ( ON ?auto_90923 ?auto_90920 ) ( ON ?auto_90921 ?auto_90919 ) ( not ( = ?auto_90916 ?auto_90919 ) ) ( not ( = ?auto_90917 ?auto_90919 ) ) ( not ( = ?auto_90922 ?auto_90919 ) ) ( not ( = ?auto_90920 ?auto_90919 ) ) ( not ( = ?auto_90923 ?auto_90919 ) ) ( not ( = ?auto_90921 ?auto_90919 ) ) ( not ( = ?auto_90918 ?auto_90919 ) ) ( CLEAR ?auto_90923 ) ( ON ?auto_90918 ?auto_90921 ) ( CLEAR ?auto_90918 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90919 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90919 ?auto_90921 )
      ( MAKE-2PILE ?auto_90916 ?auto_90917 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90924 - BLOCK
      ?auto_90925 - BLOCK
    )
    :vars
    (
      ?auto_90929 - BLOCK
      ?auto_90931 - BLOCK
      ?auto_90928 - BLOCK
      ?auto_90926 - BLOCK
      ?auto_90927 - BLOCK
      ?auto_90930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90929 ?auto_90925 ) ( ON-TABLE ?auto_90924 ) ( ON ?auto_90925 ?auto_90924 ) ( not ( = ?auto_90924 ?auto_90925 ) ) ( not ( = ?auto_90924 ?auto_90929 ) ) ( not ( = ?auto_90925 ?auto_90929 ) ) ( not ( = ?auto_90924 ?auto_90931 ) ) ( not ( = ?auto_90924 ?auto_90928 ) ) ( not ( = ?auto_90925 ?auto_90931 ) ) ( not ( = ?auto_90925 ?auto_90928 ) ) ( not ( = ?auto_90929 ?auto_90931 ) ) ( not ( = ?auto_90929 ?auto_90928 ) ) ( not ( = ?auto_90931 ?auto_90928 ) ) ( ON ?auto_90931 ?auto_90929 ) ( not ( = ?auto_90926 ?auto_90927 ) ) ( not ( = ?auto_90926 ?auto_90928 ) ) ( not ( = ?auto_90927 ?auto_90928 ) ) ( not ( = ?auto_90924 ?auto_90927 ) ) ( not ( = ?auto_90924 ?auto_90926 ) ) ( not ( = ?auto_90925 ?auto_90927 ) ) ( not ( = ?auto_90925 ?auto_90926 ) ) ( not ( = ?auto_90929 ?auto_90927 ) ) ( not ( = ?auto_90929 ?auto_90926 ) ) ( not ( = ?auto_90931 ?auto_90927 ) ) ( not ( = ?auto_90931 ?auto_90926 ) ) ( ON ?auto_90926 ?auto_90930 ) ( not ( = ?auto_90924 ?auto_90930 ) ) ( not ( = ?auto_90925 ?auto_90930 ) ) ( not ( = ?auto_90929 ?auto_90930 ) ) ( not ( = ?auto_90931 ?auto_90930 ) ) ( not ( = ?auto_90928 ?auto_90930 ) ) ( not ( = ?auto_90926 ?auto_90930 ) ) ( not ( = ?auto_90927 ?auto_90930 ) ) ( ON ?auto_90927 ?auto_90926 ) ( CLEAR ?auto_90927 ) ( ON-TABLE ?auto_90930 ) ( HOLDING ?auto_90928 ) ( CLEAR ?auto_90931 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90924 ?auto_90925 ?auto_90929 ?auto_90931 ?auto_90928 )
      ( MAKE-2PILE ?auto_90924 ?auto_90925 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_90975 - BLOCK
      ?auto_90976 - BLOCK
      ?auto_90977 - BLOCK
      ?auto_90978 - BLOCK
      ?auto_90979 - BLOCK
    )
    :vars
    (
      ?auto_90980 - BLOCK
      ?auto_90981 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90975 ) ( ON ?auto_90976 ?auto_90975 ) ( ON ?auto_90977 ?auto_90976 ) ( not ( = ?auto_90975 ?auto_90976 ) ) ( not ( = ?auto_90975 ?auto_90977 ) ) ( not ( = ?auto_90975 ?auto_90978 ) ) ( not ( = ?auto_90975 ?auto_90979 ) ) ( not ( = ?auto_90976 ?auto_90977 ) ) ( not ( = ?auto_90976 ?auto_90978 ) ) ( not ( = ?auto_90976 ?auto_90979 ) ) ( not ( = ?auto_90977 ?auto_90978 ) ) ( not ( = ?auto_90977 ?auto_90979 ) ) ( not ( = ?auto_90978 ?auto_90979 ) ) ( ON ?auto_90979 ?auto_90980 ) ( not ( = ?auto_90975 ?auto_90980 ) ) ( not ( = ?auto_90976 ?auto_90980 ) ) ( not ( = ?auto_90977 ?auto_90980 ) ) ( not ( = ?auto_90978 ?auto_90980 ) ) ( not ( = ?auto_90979 ?auto_90980 ) ) ( CLEAR ?auto_90977 ) ( ON ?auto_90978 ?auto_90979 ) ( CLEAR ?auto_90978 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90981 ) ( ON ?auto_90980 ?auto_90981 ) ( not ( = ?auto_90981 ?auto_90980 ) ) ( not ( = ?auto_90981 ?auto_90979 ) ) ( not ( = ?auto_90981 ?auto_90978 ) ) ( not ( = ?auto_90975 ?auto_90981 ) ) ( not ( = ?auto_90976 ?auto_90981 ) ) ( not ( = ?auto_90977 ?auto_90981 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90981 ?auto_90980 ?auto_90979 )
      ( MAKE-5PILE ?auto_90975 ?auto_90976 ?auto_90977 ?auto_90978 ?auto_90979 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_90982 - BLOCK
      ?auto_90983 - BLOCK
      ?auto_90984 - BLOCK
      ?auto_90985 - BLOCK
      ?auto_90986 - BLOCK
    )
    :vars
    (
      ?auto_90988 - BLOCK
      ?auto_90987 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90982 ) ( ON ?auto_90983 ?auto_90982 ) ( not ( = ?auto_90982 ?auto_90983 ) ) ( not ( = ?auto_90982 ?auto_90984 ) ) ( not ( = ?auto_90982 ?auto_90985 ) ) ( not ( = ?auto_90982 ?auto_90986 ) ) ( not ( = ?auto_90983 ?auto_90984 ) ) ( not ( = ?auto_90983 ?auto_90985 ) ) ( not ( = ?auto_90983 ?auto_90986 ) ) ( not ( = ?auto_90984 ?auto_90985 ) ) ( not ( = ?auto_90984 ?auto_90986 ) ) ( not ( = ?auto_90985 ?auto_90986 ) ) ( ON ?auto_90986 ?auto_90988 ) ( not ( = ?auto_90982 ?auto_90988 ) ) ( not ( = ?auto_90983 ?auto_90988 ) ) ( not ( = ?auto_90984 ?auto_90988 ) ) ( not ( = ?auto_90985 ?auto_90988 ) ) ( not ( = ?auto_90986 ?auto_90988 ) ) ( ON ?auto_90985 ?auto_90986 ) ( CLEAR ?auto_90985 ) ( ON-TABLE ?auto_90987 ) ( ON ?auto_90988 ?auto_90987 ) ( not ( = ?auto_90987 ?auto_90988 ) ) ( not ( = ?auto_90987 ?auto_90986 ) ) ( not ( = ?auto_90987 ?auto_90985 ) ) ( not ( = ?auto_90982 ?auto_90987 ) ) ( not ( = ?auto_90983 ?auto_90987 ) ) ( not ( = ?auto_90984 ?auto_90987 ) ) ( HOLDING ?auto_90984 ) ( CLEAR ?auto_90983 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90982 ?auto_90983 ?auto_90984 )
      ( MAKE-5PILE ?auto_90982 ?auto_90983 ?auto_90984 ?auto_90985 ?auto_90986 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_90989 - BLOCK
      ?auto_90990 - BLOCK
      ?auto_90991 - BLOCK
      ?auto_90992 - BLOCK
      ?auto_90993 - BLOCK
    )
    :vars
    (
      ?auto_90995 - BLOCK
      ?auto_90994 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90989 ) ( ON ?auto_90990 ?auto_90989 ) ( not ( = ?auto_90989 ?auto_90990 ) ) ( not ( = ?auto_90989 ?auto_90991 ) ) ( not ( = ?auto_90989 ?auto_90992 ) ) ( not ( = ?auto_90989 ?auto_90993 ) ) ( not ( = ?auto_90990 ?auto_90991 ) ) ( not ( = ?auto_90990 ?auto_90992 ) ) ( not ( = ?auto_90990 ?auto_90993 ) ) ( not ( = ?auto_90991 ?auto_90992 ) ) ( not ( = ?auto_90991 ?auto_90993 ) ) ( not ( = ?auto_90992 ?auto_90993 ) ) ( ON ?auto_90993 ?auto_90995 ) ( not ( = ?auto_90989 ?auto_90995 ) ) ( not ( = ?auto_90990 ?auto_90995 ) ) ( not ( = ?auto_90991 ?auto_90995 ) ) ( not ( = ?auto_90992 ?auto_90995 ) ) ( not ( = ?auto_90993 ?auto_90995 ) ) ( ON ?auto_90992 ?auto_90993 ) ( ON-TABLE ?auto_90994 ) ( ON ?auto_90995 ?auto_90994 ) ( not ( = ?auto_90994 ?auto_90995 ) ) ( not ( = ?auto_90994 ?auto_90993 ) ) ( not ( = ?auto_90994 ?auto_90992 ) ) ( not ( = ?auto_90989 ?auto_90994 ) ) ( not ( = ?auto_90990 ?auto_90994 ) ) ( not ( = ?auto_90991 ?auto_90994 ) ) ( CLEAR ?auto_90990 ) ( ON ?auto_90991 ?auto_90992 ) ( CLEAR ?auto_90991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90994 ?auto_90995 ?auto_90993 ?auto_90992 )
      ( MAKE-5PILE ?auto_90989 ?auto_90990 ?auto_90991 ?auto_90992 ?auto_90993 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_90996 - BLOCK
      ?auto_90997 - BLOCK
      ?auto_90998 - BLOCK
      ?auto_90999 - BLOCK
      ?auto_91000 - BLOCK
    )
    :vars
    (
      ?auto_91002 - BLOCK
      ?auto_91001 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90996 ) ( not ( = ?auto_90996 ?auto_90997 ) ) ( not ( = ?auto_90996 ?auto_90998 ) ) ( not ( = ?auto_90996 ?auto_90999 ) ) ( not ( = ?auto_90996 ?auto_91000 ) ) ( not ( = ?auto_90997 ?auto_90998 ) ) ( not ( = ?auto_90997 ?auto_90999 ) ) ( not ( = ?auto_90997 ?auto_91000 ) ) ( not ( = ?auto_90998 ?auto_90999 ) ) ( not ( = ?auto_90998 ?auto_91000 ) ) ( not ( = ?auto_90999 ?auto_91000 ) ) ( ON ?auto_91000 ?auto_91002 ) ( not ( = ?auto_90996 ?auto_91002 ) ) ( not ( = ?auto_90997 ?auto_91002 ) ) ( not ( = ?auto_90998 ?auto_91002 ) ) ( not ( = ?auto_90999 ?auto_91002 ) ) ( not ( = ?auto_91000 ?auto_91002 ) ) ( ON ?auto_90999 ?auto_91000 ) ( ON-TABLE ?auto_91001 ) ( ON ?auto_91002 ?auto_91001 ) ( not ( = ?auto_91001 ?auto_91002 ) ) ( not ( = ?auto_91001 ?auto_91000 ) ) ( not ( = ?auto_91001 ?auto_90999 ) ) ( not ( = ?auto_90996 ?auto_91001 ) ) ( not ( = ?auto_90997 ?auto_91001 ) ) ( not ( = ?auto_90998 ?auto_91001 ) ) ( ON ?auto_90998 ?auto_90999 ) ( CLEAR ?auto_90998 ) ( HOLDING ?auto_90997 ) ( CLEAR ?auto_90996 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90996 ?auto_90997 )
      ( MAKE-5PILE ?auto_90996 ?auto_90997 ?auto_90998 ?auto_90999 ?auto_91000 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91003 - BLOCK
      ?auto_91004 - BLOCK
      ?auto_91005 - BLOCK
      ?auto_91006 - BLOCK
      ?auto_91007 - BLOCK
    )
    :vars
    (
      ?auto_91009 - BLOCK
      ?auto_91008 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91003 ) ( not ( = ?auto_91003 ?auto_91004 ) ) ( not ( = ?auto_91003 ?auto_91005 ) ) ( not ( = ?auto_91003 ?auto_91006 ) ) ( not ( = ?auto_91003 ?auto_91007 ) ) ( not ( = ?auto_91004 ?auto_91005 ) ) ( not ( = ?auto_91004 ?auto_91006 ) ) ( not ( = ?auto_91004 ?auto_91007 ) ) ( not ( = ?auto_91005 ?auto_91006 ) ) ( not ( = ?auto_91005 ?auto_91007 ) ) ( not ( = ?auto_91006 ?auto_91007 ) ) ( ON ?auto_91007 ?auto_91009 ) ( not ( = ?auto_91003 ?auto_91009 ) ) ( not ( = ?auto_91004 ?auto_91009 ) ) ( not ( = ?auto_91005 ?auto_91009 ) ) ( not ( = ?auto_91006 ?auto_91009 ) ) ( not ( = ?auto_91007 ?auto_91009 ) ) ( ON ?auto_91006 ?auto_91007 ) ( ON-TABLE ?auto_91008 ) ( ON ?auto_91009 ?auto_91008 ) ( not ( = ?auto_91008 ?auto_91009 ) ) ( not ( = ?auto_91008 ?auto_91007 ) ) ( not ( = ?auto_91008 ?auto_91006 ) ) ( not ( = ?auto_91003 ?auto_91008 ) ) ( not ( = ?auto_91004 ?auto_91008 ) ) ( not ( = ?auto_91005 ?auto_91008 ) ) ( ON ?auto_91005 ?auto_91006 ) ( CLEAR ?auto_91003 ) ( ON ?auto_91004 ?auto_91005 ) ( CLEAR ?auto_91004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91008 ?auto_91009 ?auto_91007 ?auto_91006 ?auto_91005 )
      ( MAKE-5PILE ?auto_91003 ?auto_91004 ?auto_91005 ?auto_91006 ?auto_91007 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91010 - BLOCK
      ?auto_91011 - BLOCK
      ?auto_91012 - BLOCK
      ?auto_91013 - BLOCK
      ?auto_91014 - BLOCK
    )
    :vars
    (
      ?auto_91015 - BLOCK
      ?auto_91016 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91010 ?auto_91011 ) ) ( not ( = ?auto_91010 ?auto_91012 ) ) ( not ( = ?auto_91010 ?auto_91013 ) ) ( not ( = ?auto_91010 ?auto_91014 ) ) ( not ( = ?auto_91011 ?auto_91012 ) ) ( not ( = ?auto_91011 ?auto_91013 ) ) ( not ( = ?auto_91011 ?auto_91014 ) ) ( not ( = ?auto_91012 ?auto_91013 ) ) ( not ( = ?auto_91012 ?auto_91014 ) ) ( not ( = ?auto_91013 ?auto_91014 ) ) ( ON ?auto_91014 ?auto_91015 ) ( not ( = ?auto_91010 ?auto_91015 ) ) ( not ( = ?auto_91011 ?auto_91015 ) ) ( not ( = ?auto_91012 ?auto_91015 ) ) ( not ( = ?auto_91013 ?auto_91015 ) ) ( not ( = ?auto_91014 ?auto_91015 ) ) ( ON ?auto_91013 ?auto_91014 ) ( ON-TABLE ?auto_91016 ) ( ON ?auto_91015 ?auto_91016 ) ( not ( = ?auto_91016 ?auto_91015 ) ) ( not ( = ?auto_91016 ?auto_91014 ) ) ( not ( = ?auto_91016 ?auto_91013 ) ) ( not ( = ?auto_91010 ?auto_91016 ) ) ( not ( = ?auto_91011 ?auto_91016 ) ) ( not ( = ?auto_91012 ?auto_91016 ) ) ( ON ?auto_91012 ?auto_91013 ) ( ON ?auto_91011 ?auto_91012 ) ( CLEAR ?auto_91011 ) ( HOLDING ?auto_91010 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91010 )
      ( MAKE-5PILE ?auto_91010 ?auto_91011 ?auto_91012 ?auto_91013 ?auto_91014 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91017 - BLOCK
      ?auto_91018 - BLOCK
      ?auto_91019 - BLOCK
      ?auto_91020 - BLOCK
      ?auto_91021 - BLOCK
    )
    :vars
    (
      ?auto_91023 - BLOCK
      ?auto_91022 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91017 ?auto_91018 ) ) ( not ( = ?auto_91017 ?auto_91019 ) ) ( not ( = ?auto_91017 ?auto_91020 ) ) ( not ( = ?auto_91017 ?auto_91021 ) ) ( not ( = ?auto_91018 ?auto_91019 ) ) ( not ( = ?auto_91018 ?auto_91020 ) ) ( not ( = ?auto_91018 ?auto_91021 ) ) ( not ( = ?auto_91019 ?auto_91020 ) ) ( not ( = ?auto_91019 ?auto_91021 ) ) ( not ( = ?auto_91020 ?auto_91021 ) ) ( ON ?auto_91021 ?auto_91023 ) ( not ( = ?auto_91017 ?auto_91023 ) ) ( not ( = ?auto_91018 ?auto_91023 ) ) ( not ( = ?auto_91019 ?auto_91023 ) ) ( not ( = ?auto_91020 ?auto_91023 ) ) ( not ( = ?auto_91021 ?auto_91023 ) ) ( ON ?auto_91020 ?auto_91021 ) ( ON-TABLE ?auto_91022 ) ( ON ?auto_91023 ?auto_91022 ) ( not ( = ?auto_91022 ?auto_91023 ) ) ( not ( = ?auto_91022 ?auto_91021 ) ) ( not ( = ?auto_91022 ?auto_91020 ) ) ( not ( = ?auto_91017 ?auto_91022 ) ) ( not ( = ?auto_91018 ?auto_91022 ) ) ( not ( = ?auto_91019 ?auto_91022 ) ) ( ON ?auto_91019 ?auto_91020 ) ( ON ?auto_91018 ?auto_91019 ) ( ON ?auto_91017 ?auto_91018 ) ( CLEAR ?auto_91017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91022 ?auto_91023 ?auto_91021 ?auto_91020 ?auto_91019 ?auto_91018 )
      ( MAKE-5PILE ?auto_91017 ?auto_91018 ?auto_91019 ?auto_91020 ?auto_91021 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91029 - BLOCK
      ?auto_91030 - BLOCK
      ?auto_91031 - BLOCK
      ?auto_91032 - BLOCK
      ?auto_91033 - BLOCK
    )
    :vars
    (
      ?auto_91035 - BLOCK
      ?auto_91034 - BLOCK
      ?auto_91036 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91029 ?auto_91030 ) ) ( not ( = ?auto_91029 ?auto_91031 ) ) ( not ( = ?auto_91029 ?auto_91032 ) ) ( not ( = ?auto_91029 ?auto_91033 ) ) ( not ( = ?auto_91030 ?auto_91031 ) ) ( not ( = ?auto_91030 ?auto_91032 ) ) ( not ( = ?auto_91030 ?auto_91033 ) ) ( not ( = ?auto_91031 ?auto_91032 ) ) ( not ( = ?auto_91031 ?auto_91033 ) ) ( not ( = ?auto_91032 ?auto_91033 ) ) ( ON ?auto_91033 ?auto_91035 ) ( not ( = ?auto_91029 ?auto_91035 ) ) ( not ( = ?auto_91030 ?auto_91035 ) ) ( not ( = ?auto_91031 ?auto_91035 ) ) ( not ( = ?auto_91032 ?auto_91035 ) ) ( not ( = ?auto_91033 ?auto_91035 ) ) ( ON ?auto_91032 ?auto_91033 ) ( ON-TABLE ?auto_91034 ) ( ON ?auto_91035 ?auto_91034 ) ( not ( = ?auto_91034 ?auto_91035 ) ) ( not ( = ?auto_91034 ?auto_91033 ) ) ( not ( = ?auto_91034 ?auto_91032 ) ) ( not ( = ?auto_91029 ?auto_91034 ) ) ( not ( = ?auto_91030 ?auto_91034 ) ) ( not ( = ?auto_91031 ?auto_91034 ) ) ( ON ?auto_91031 ?auto_91032 ) ( ON ?auto_91030 ?auto_91031 ) ( CLEAR ?auto_91030 ) ( ON ?auto_91029 ?auto_91036 ) ( CLEAR ?auto_91029 ) ( HAND-EMPTY ) ( not ( = ?auto_91029 ?auto_91036 ) ) ( not ( = ?auto_91030 ?auto_91036 ) ) ( not ( = ?auto_91031 ?auto_91036 ) ) ( not ( = ?auto_91032 ?auto_91036 ) ) ( not ( = ?auto_91033 ?auto_91036 ) ) ( not ( = ?auto_91035 ?auto_91036 ) ) ( not ( = ?auto_91034 ?auto_91036 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91029 ?auto_91036 )
      ( MAKE-5PILE ?auto_91029 ?auto_91030 ?auto_91031 ?auto_91032 ?auto_91033 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91037 - BLOCK
      ?auto_91038 - BLOCK
      ?auto_91039 - BLOCK
      ?auto_91040 - BLOCK
      ?auto_91041 - BLOCK
    )
    :vars
    (
      ?auto_91043 - BLOCK
      ?auto_91044 - BLOCK
      ?auto_91042 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91037 ?auto_91038 ) ) ( not ( = ?auto_91037 ?auto_91039 ) ) ( not ( = ?auto_91037 ?auto_91040 ) ) ( not ( = ?auto_91037 ?auto_91041 ) ) ( not ( = ?auto_91038 ?auto_91039 ) ) ( not ( = ?auto_91038 ?auto_91040 ) ) ( not ( = ?auto_91038 ?auto_91041 ) ) ( not ( = ?auto_91039 ?auto_91040 ) ) ( not ( = ?auto_91039 ?auto_91041 ) ) ( not ( = ?auto_91040 ?auto_91041 ) ) ( ON ?auto_91041 ?auto_91043 ) ( not ( = ?auto_91037 ?auto_91043 ) ) ( not ( = ?auto_91038 ?auto_91043 ) ) ( not ( = ?auto_91039 ?auto_91043 ) ) ( not ( = ?auto_91040 ?auto_91043 ) ) ( not ( = ?auto_91041 ?auto_91043 ) ) ( ON ?auto_91040 ?auto_91041 ) ( ON-TABLE ?auto_91044 ) ( ON ?auto_91043 ?auto_91044 ) ( not ( = ?auto_91044 ?auto_91043 ) ) ( not ( = ?auto_91044 ?auto_91041 ) ) ( not ( = ?auto_91044 ?auto_91040 ) ) ( not ( = ?auto_91037 ?auto_91044 ) ) ( not ( = ?auto_91038 ?auto_91044 ) ) ( not ( = ?auto_91039 ?auto_91044 ) ) ( ON ?auto_91039 ?auto_91040 ) ( ON ?auto_91037 ?auto_91042 ) ( CLEAR ?auto_91037 ) ( not ( = ?auto_91037 ?auto_91042 ) ) ( not ( = ?auto_91038 ?auto_91042 ) ) ( not ( = ?auto_91039 ?auto_91042 ) ) ( not ( = ?auto_91040 ?auto_91042 ) ) ( not ( = ?auto_91041 ?auto_91042 ) ) ( not ( = ?auto_91043 ?auto_91042 ) ) ( not ( = ?auto_91044 ?auto_91042 ) ) ( HOLDING ?auto_91038 ) ( CLEAR ?auto_91039 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91044 ?auto_91043 ?auto_91041 ?auto_91040 ?auto_91039 ?auto_91038 )
      ( MAKE-5PILE ?auto_91037 ?auto_91038 ?auto_91039 ?auto_91040 ?auto_91041 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91045 - BLOCK
      ?auto_91046 - BLOCK
      ?auto_91047 - BLOCK
      ?auto_91048 - BLOCK
      ?auto_91049 - BLOCK
    )
    :vars
    (
      ?auto_91050 - BLOCK
      ?auto_91052 - BLOCK
      ?auto_91051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91045 ?auto_91046 ) ) ( not ( = ?auto_91045 ?auto_91047 ) ) ( not ( = ?auto_91045 ?auto_91048 ) ) ( not ( = ?auto_91045 ?auto_91049 ) ) ( not ( = ?auto_91046 ?auto_91047 ) ) ( not ( = ?auto_91046 ?auto_91048 ) ) ( not ( = ?auto_91046 ?auto_91049 ) ) ( not ( = ?auto_91047 ?auto_91048 ) ) ( not ( = ?auto_91047 ?auto_91049 ) ) ( not ( = ?auto_91048 ?auto_91049 ) ) ( ON ?auto_91049 ?auto_91050 ) ( not ( = ?auto_91045 ?auto_91050 ) ) ( not ( = ?auto_91046 ?auto_91050 ) ) ( not ( = ?auto_91047 ?auto_91050 ) ) ( not ( = ?auto_91048 ?auto_91050 ) ) ( not ( = ?auto_91049 ?auto_91050 ) ) ( ON ?auto_91048 ?auto_91049 ) ( ON-TABLE ?auto_91052 ) ( ON ?auto_91050 ?auto_91052 ) ( not ( = ?auto_91052 ?auto_91050 ) ) ( not ( = ?auto_91052 ?auto_91049 ) ) ( not ( = ?auto_91052 ?auto_91048 ) ) ( not ( = ?auto_91045 ?auto_91052 ) ) ( not ( = ?auto_91046 ?auto_91052 ) ) ( not ( = ?auto_91047 ?auto_91052 ) ) ( ON ?auto_91047 ?auto_91048 ) ( ON ?auto_91045 ?auto_91051 ) ( not ( = ?auto_91045 ?auto_91051 ) ) ( not ( = ?auto_91046 ?auto_91051 ) ) ( not ( = ?auto_91047 ?auto_91051 ) ) ( not ( = ?auto_91048 ?auto_91051 ) ) ( not ( = ?auto_91049 ?auto_91051 ) ) ( not ( = ?auto_91050 ?auto_91051 ) ) ( not ( = ?auto_91052 ?auto_91051 ) ) ( CLEAR ?auto_91047 ) ( ON ?auto_91046 ?auto_91045 ) ( CLEAR ?auto_91046 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91051 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91051 ?auto_91045 )
      ( MAKE-5PILE ?auto_91045 ?auto_91046 ?auto_91047 ?auto_91048 ?auto_91049 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91053 - BLOCK
      ?auto_91054 - BLOCK
      ?auto_91055 - BLOCK
      ?auto_91056 - BLOCK
      ?auto_91057 - BLOCK
    )
    :vars
    (
      ?auto_91059 - BLOCK
      ?auto_91058 - BLOCK
      ?auto_91060 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91053 ?auto_91054 ) ) ( not ( = ?auto_91053 ?auto_91055 ) ) ( not ( = ?auto_91053 ?auto_91056 ) ) ( not ( = ?auto_91053 ?auto_91057 ) ) ( not ( = ?auto_91054 ?auto_91055 ) ) ( not ( = ?auto_91054 ?auto_91056 ) ) ( not ( = ?auto_91054 ?auto_91057 ) ) ( not ( = ?auto_91055 ?auto_91056 ) ) ( not ( = ?auto_91055 ?auto_91057 ) ) ( not ( = ?auto_91056 ?auto_91057 ) ) ( ON ?auto_91057 ?auto_91059 ) ( not ( = ?auto_91053 ?auto_91059 ) ) ( not ( = ?auto_91054 ?auto_91059 ) ) ( not ( = ?auto_91055 ?auto_91059 ) ) ( not ( = ?auto_91056 ?auto_91059 ) ) ( not ( = ?auto_91057 ?auto_91059 ) ) ( ON ?auto_91056 ?auto_91057 ) ( ON-TABLE ?auto_91058 ) ( ON ?auto_91059 ?auto_91058 ) ( not ( = ?auto_91058 ?auto_91059 ) ) ( not ( = ?auto_91058 ?auto_91057 ) ) ( not ( = ?auto_91058 ?auto_91056 ) ) ( not ( = ?auto_91053 ?auto_91058 ) ) ( not ( = ?auto_91054 ?auto_91058 ) ) ( not ( = ?auto_91055 ?auto_91058 ) ) ( ON ?auto_91053 ?auto_91060 ) ( not ( = ?auto_91053 ?auto_91060 ) ) ( not ( = ?auto_91054 ?auto_91060 ) ) ( not ( = ?auto_91055 ?auto_91060 ) ) ( not ( = ?auto_91056 ?auto_91060 ) ) ( not ( = ?auto_91057 ?auto_91060 ) ) ( not ( = ?auto_91059 ?auto_91060 ) ) ( not ( = ?auto_91058 ?auto_91060 ) ) ( ON ?auto_91054 ?auto_91053 ) ( CLEAR ?auto_91054 ) ( ON-TABLE ?auto_91060 ) ( HOLDING ?auto_91055 ) ( CLEAR ?auto_91056 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91058 ?auto_91059 ?auto_91057 ?auto_91056 ?auto_91055 )
      ( MAKE-5PILE ?auto_91053 ?auto_91054 ?auto_91055 ?auto_91056 ?auto_91057 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91061 - BLOCK
      ?auto_91062 - BLOCK
      ?auto_91063 - BLOCK
      ?auto_91064 - BLOCK
      ?auto_91065 - BLOCK
    )
    :vars
    (
      ?auto_91068 - BLOCK
      ?auto_91066 - BLOCK
      ?auto_91067 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91061 ?auto_91062 ) ) ( not ( = ?auto_91061 ?auto_91063 ) ) ( not ( = ?auto_91061 ?auto_91064 ) ) ( not ( = ?auto_91061 ?auto_91065 ) ) ( not ( = ?auto_91062 ?auto_91063 ) ) ( not ( = ?auto_91062 ?auto_91064 ) ) ( not ( = ?auto_91062 ?auto_91065 ) ) ( not ( = ?auto_91063 ?auto_91064 ) ) ( not ( = ?auto_91063 ?auto_91065 ) ) ( not ( = ?auto_91064 ?auto_91065 ) ) ( ON ?auto_91065 ?auto_91068 ) ( not ( = ?auto_91061 ?auto_91068 ) ) ( not ( = ?auto_91062 ?auto_91068 ) ) ( not ( = ?auto_91063 ?auto_91068 ) ) ( not ( = ?auto_91064 ?auto_91068 ) ) ( not ( = ?auto_91065 ?auto_91068 ) ) ( ON ?auto_91064 ?auto_91065 ) ( ON-TABLE ?auto_91066 ) ( ON ?auto_91068 ?auto_91066 ) ( not ( = ?auto_91066 ?auto_91068 ) ) ( not ( = ?auto_91066 ?auto_91065 ) ) ( not ( = ?auto_91066 ?auto_91064 ) ) ( not ( = ?auto_91061 ?auto_91066 ) ) ( not ( = ?auto_91062 ?auto_91066 ) ) ( not ( = ?auto_91063 ?auto_91066 ) ) ( ON ?auto_91061 ?auto_91067 ) ( not ( = ?auto_91061 ?auto_91067 ) ) ( not ( = ?auto_91062 ?auto_91067 ) ) ( not ( = ?auto_91063 ?auto_91067 ) ) ( not ( = ?auto_91064 ?auto_91067 ) ) ( not ( = ?auto_91065 ?auto_91067 ) ) ( not ( = ?auto_91068 ?auto_91067 ) ) ( not ( = ?auto_91066 ?auto_91067 ) ) ( ON ?auto_91062 ?auto_91061 ) ( ON-TABLE ?auto_91067 ) ( CLEAR ?auto_91064 ) ( ON ?auto_91063 ?auto_91062 ) ( CLEAR ?auto_91063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91067 ?auto_91061 ?auto_91062 )
      ( MAKE-5PILE ?auto_91061 ?auto_91062 ?auto_91063 ?auto_91064 ?auto_91065 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91069 - BLOCK
      ?auto_91070 - BLOCK
      ?auto_91071 - BLOCK
      ?auto_91072 - BLOCK
      ?auto_91073 - BLOCK
    )
    :vars
    (
      ?auto_91074 - BLOCK
      ?auto_91075 - BLOCK
      ?auto_91076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91069 ?auto_91070 ) ) ( not ( = ?auto_91069 ?auto_91071 ) ) ( not ( = ?auto_91069 ?auto_91072 ) ) ( not ( = ?auto_91069 ?auto_91073 ) ) ( not ( = ?auto_91070 ?auto_91071 ) ) ( not ( = ?auto_91070 ?auto_91072 ) ) ( not ( = ?auto_91070 ?auto_91073 ) ) ( not ( = ?auto_91071 ?auto_91072 ) ) ( not ( = ?auto_91071 ?auto_91073 ) ) ( not ( = ?auto_91072 ?auto_91073 ) ) ( ON ?auto_91073 ?auto_91074 ) ( not ( = ?auto_91069 ?auto_91074 ) ) ( not ( = ?auto_91070 ?auto_91074 ) ) ( not ( = ?auto_91071 ?auto_91074 ) ) ( not ( = ?auto_91072 ?auto_91074 ) ) ( not ( = ?auto_91073 ?auto_91074 ) ) ( ON-TABLE ?auto_91075 ) ( ON ?auto_91074 ?auto_91075 ) ( not ( = ?auto_91075 ?auto_91074 ) ) ( not ( = ?auto_91075 ?auto_91073 ) ) ( not ( = ?auto_91075 ?auto_91072 ) ) ( not ( = ?auto_91069 ?auto_91075 ) ) ( not ( = ?auto_91070 ?auto_91075 ) ) ( not ( = ?auto_91071 ?auto_91075 ) ) ( ON ?auto_91069 ?auto_91076 ) ( not ( = ?auto_91069 ?auto_91076 ) ) ( not ( = ?auto_91070 ?auto_91076 ) ) ( not ( = ?auto_91071 ?auto_91076 ) ) ( not ( = ?auto_91072 ?auto_91076 ) ) ( not ( = ?auto_91073 ?auto_91076 ) ) ( not ( = ?auto_91074 ?auto_91076 ) ) ( not ( = ?auto_91075 ?auto_91076 ) ) ( ON ?auto_91070 ?auto_91069 ) ( ON-TABLE ?auto_91076 ) ( ON ?auto_91071 ?auto_91070 ) ( CLEAR ?auto_91071 ) ( HOLDING ?auto_91072 ) ( CLEAR ?auto_91073 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91075 ?auto_91074 ?auto_91073 ?auto_91072 )
      ( MAKE-5PILE ?auto_91069 ?auto_91070 ?auto_91071 ?auto_91072 ?auto_91073 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91077 - BLOCK
      ?auto_91078 - BLOCK
      ?auto_91079 - BLOCK
      ?auto_91080 - BLOCK
      ?auto_91081 - BLOCK
    )
    :vars
    (
      ?auto_91083 - BLOCK
      ?auto_91084 - BLOCK
      ?auto_91082 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91077 ?auto_91078 ) ) ( not ( = ?auto_91077 ?auto_91079 ) ) ( not ( = ?auto_91077 ?auto_91080 ) ) ( not ( = ?auto_91077 ?auto_91081 ) ) ( not ( = ?auto_91078 ?auto_91079 ) ) ( not ( = ?auto_91078 ?auto_91080 ) ) ( not ( = ?auto_91078 ?auto_91081 ) ) ( not ( = ?auto_91079 ?auto_91080 ) ) ( not ( = ?auto_91079 ?auto_91081 ) ) ( not ( = ?auto_91080 ?auto_91081 ) ) ( ON ?auto_91081 ?auto_91083 ) ( not ( = ?auto_91077 ?auto_91083 ) ) ( not ( = ?auto_91078 ?auto_91083 ) ) ( not ( = ?auto_91079 ?auto_91083 ) ) ( not ( = ?auto_91080 ?auto_91083 ) ) ( not ( = ?auto_91081 ?auto_91083 ) ) ( ON-TABLE ?auto_91084 ) ( ON ?auto_91083 ?auto_91084 ) ( not ( = ?auto_91084 ?auto_91083 ) ) ( not ( = ?auto_91084 ?auto_91081 ) ) ( not ( = ?auto_91084 ?auto_91080 ) ) ( not ( = ?auto_91077 ?auto_91084 ) ) ( not ( = ?auto_91078 ?auto_91084 ) ) ( not ( = ?auto_91079 ?auto_91084 ) ) ( ON ?auto_91077 ?auto_91082 ) ( not ( = ?auto_91077 ?auto_91082 ) ) ( not ( = ?auto_91078 ?auto_91082 ) ) ( not ( = ?auto_91079 ?auto_91082 ) ) ( not ( = ?auto_91080 ?auto_91082 ) ) ( not ( = ?auto_91081 ?auto_91082 ) ) ( not ( = ?auto_91083 ?auto_91082 ) ) ( not ( = ?auto_91084 ?auto_91082 ) ) ( ON ?auto_91078 ?auto_91077 ) ( ON-TABLE ?auto_91082 ) ( ON ?auto_91079 ?auto_91078 ) ( CLEAR ?auto_91081 ) ( ON ?auto_91080 ?auto_91079 ) ( CLEAR ?auto_91080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91082 ?auto_91077 ?auto_91078 ?auto_91079 )
      ( MAKE-5PILE ?auto_91077 ?auto_91078 ?auto_91079 ?auto_91080 ?auto_91081 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91085 - BLOCK
      ?auto_91086 - BLOCK
      ?auto_91087 - BLOCK
      ?auto_91088 - BLOCK
      ?auto_91089 - BLOCK
    )
    :vars
    (
      ?auto_91091 - BLOCK
      ?auto_91092 - BLOCK
      ?auto_91090 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91085 ?auto_91086 ) ) ( not ( = ?auto_91085 ?auto_91087 ) ) ( not ( = ?auto_91085 ?auto_91088 ) ) ( not ( = ?auto_91085 ?auto_91089 ) ) ( not ( = ?auto_91086 ?auto_91087 ) ) ( not ( = ?auto_91086 ?auto_91088 ) ) ( not ( = ?auto_91086 ?auto_91089 ) ) ( not ( = ?auto_91087 ?auto_91088 ) ) ( not ( = ?auto_91087 ?auto_91089 ) ) ( not ( = ?auto_91088 ?auto_91089 ) ) ( not ( = ?auto_91085 ?auto_91091 ) ) ( not ( = ?auto_91086 ?auto_91091 ) ) ( not ( = ?auto_91087 ?auto_91091 ) ) ( not ( = ?auto_91088 ?auto_91091 ) ) ( not ( = ?auto_91089 ?auto_91091 ) ) ( ON-TABLE ?auto_91092 ) ( ON ?auto_91091 ?auto_91092 ) ( not ( = ?auto_91092 ?auto_91091 ) ) ( not ( = ?auto_91092 ?auto_91089 ) ) ( not ( = ?auto_91092 ?auto_91088 ) ) ( not ( = ?auto_91085 ?auto_91092 ) ) ( not ( = ?auto_91086 ?auto_91092 ) ) ( not ( = ?auto_91087 ?auto_91092 ) ) ( ON ?auto_91085 ?auto_91090 ) ( not ( = ?auto_91085 ?auto_91090 ) ) ( not ( = ?auto_91086 ?auto_91090 ) ) ( not ( = ?auto_91087 ?auto_91090 ) ) ( not ( = ?auto_91088 ?auto_91090 ) ) ( not ( = ?auto_91089 ?auto_91090 ) ) ( not ( = ?auto_91091 ?auto_91090 ) ) ( not ( = ?auto_91092 ?auto_91090 ) ) ( ON ?auto_91086 ?auto_91085 ) ( ON-TABLE ?auto_91090 ) ( ON ?auto_91087 ?auto_91086 ) ( ON ?auto_91088 ?auto_91087 ) ( CLEAR ?auto_91088 ) ( HOLDING ?auto_91089 ) ( CLEAR ?auto_91091 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91092 ?auto_91091 ?auto_91089 )
      ( MAKE-5PILE ?auto_91085 ?auto_91086 ?auto_91087 ?auto_91088 ?auto_91089 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91093 - BLOCK
      ?auto_91094 - BLOCK
      ?auto_91095 - BLOCK
      ?auto_91096 - BLOCK
      ?auto_91097 - BLOCK
    )
    :vars
    (
      ?auto_91098 - BLOCK
      ?auto_91100 - BLOCK
      ?auto_91099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91093 ?auto_91094 ) ) ( not ( = ?auto_91093 ?auto_91095 ) ) ( not ( = ?auto_91093 ?auto_91096 ) ) ( not ( = ?auto_91093 ?auto_91097 ) ) ( not ( = ?auto_91094 ?auto_91095 ) ) ( not ( = ?auto_91094 ?auto_91096 ) ) ( not ( = ?auto_91094 ?auto_91097 ) ) ( not ( = ?auto_91095 ?auto_91096 ) ) ( not ( = ?auto_91095 ?auto_91097 ) ) ( not ( = ?auto_91096 ?auto_91097 ) ) ( not ( = ?auto_91093 ?auto_91098 ) ) ( not ( = ?auto_91094 ?auto_91098 ) ) ( not ( = ?auto_91095 ?auto_91098 ) ) ( not ( = ?auto_91096 ?auto_91098 ) ) ( not ( = ?auto_91097 ?auto_91098 ) ) ( ON-TABLE ?auto_91100 ) ( ON ?auto_91098 ?auto_91100 ) ( not ( = ?auto_91100 ?auto_91098 ) ) ( not ( = ?auto_91100 ?auto_91097 ) ) ( not ( = ?auto_91100 ?auto_91096 ) ) ( not ( = ?auto_91093 ?auto_91100 ) ) ( not ( = ?auto_91094 ?auto_91100 ) ) ( not ( = ?auto_91095 ?auto_91100 ) ) ( ON ?auto_91093 ?auto_91099 ) ( not ( = ?auto_91093 ?auto_91099 ) ) ( not ( = ?auto_91094 ?auto_91099 ) ) ( not ( = ?auto_91095 ?auto_91099 ) ) ( not ( = ?auto_91096 ?auto_91099 ) ) ( not ( = ?auto_91097 ?auto_91099 ) ) ( not ( = ?auto_91098 ?auto_91099 ) ) ( not ( = ?auto_91100 ?auto_91099 ) ) ( ON ?auto_91094 ?auto_91093 ) ( ON-TABLE ?auto_91099 ) ( ON ?auto_91095 ?auto_91094 ) ( ON ?auto_91096 ?auto_91095 ) ( CLEAR ?auto_91098 ) ( ON ?auto_91097 ?auto_91096 ) ( CLEAR ?auto_91097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91099 ?auto_91093 ?auto_91094 ?auto_91095 ?auto_91096 )
      ( MAKE-5PILE ?auto_91093 ?auto_91094 ?auto_91095 ?auto_91096 ?auto_91097 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91101 - BLOCK
      ?auto_91102 - BLOCK
      ?auto_91103 - BLOCK
      ?auto_91104 - BLOCK
      ?auto_91105 - BLOCK
    )
    :vars
    (
      ?auto_91106 - BLOCK
      ?auto_91107 - BLOCK
      ?auto_91108 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91101 ?auto_91102 ) ) ( not ( = ?auto_91101 ?auto_91103 ) ) ( not ( = ?auto_91101 ?auto_91104 ) ) ( not ( = ?auto_91101 ?auto_91105 ) ) ( not ( = ?auto_91102 ?auto_91103 ) ) ( not ( = ?auto_91102 ?auto_91104 ) ) ( not ( = ?auto_91102 ?auto_91105 ) ) ( not ( = ?auto_91103 ?auto_91104 ) ) ( not ( = ?auto_91103 ?auto_91105 ) ) ( not ( = ?auto_91104 ?auto_91105 ) ) ( not ( = ?auto_91101 ?auto_91106 ) ) ( not ( = ?auto_91102 ?auto_91106 ) ) ( not ( = ?auto_91103 ?auto_91106 ) ) ( not ( = ?auto_91104 ?auto_91106 ) ) ( not ( = ?auto_91105 ?auto_91106 ) ) ( ON-TABLE ?auto_91107 ) ( not ( = ?auto_91107 ?auto_91106 ) ) ( not ( = ?auto_91107 ?auto_91105 ) ) ( not ( = ?auto_91107 ?auto_91104 ) ) ( not ( = ?auto_91101 ?auto_91107 ) ) ( not ( = ?auto_91102 ?auto_91107 ) ) ( not ( = ?auto_91103 ?auto_91107 ) ) ( ON ?auto_91101 ?auto_91108 ) ( not ( = ?auto_91101 ?auto_91108 ) ) ( not ( = ?auto_91102 ?auto_91108 ) ) ( not ( = ?auto_91103 ?auto_91108 ) ) ( not ( = ?auto_91104 ?auto_91108 ) ) ( not ( = ?auto_91105 ?auto_91108 ) ) ( not ( = ?auto_91106 ?auto_91108 ) ) ( not ( = ?auto_91107 ?auto_91108 ) ) ( ON ?auto_91102 ?auto_91101 ) ( ON-TABLE ?auto_91108 ) ( ON ?auto_91103 ?auto_91102 ) ( ON ?auto_91104 ?auto_91103 ) ( ON ?auto_91105 ?auto_91104 ) ( CLEAR ?auto_91105 ) ( HOLDING ?auto_91106 ) ( CLEAR ?auto_91107 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91107 ?auto_91106 )
      ( MAKE-5PILE ?auto_91101 ?auto_91102 ?auto_91103 ?auto_91104 ?auto_91105 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91109 - BLOCK
      ?auto_91110 - BLOCK
      ?auto_91111 - BLOCK
      ?auto_91112 - BLOCK
      ?auto_91113 - BLOCK
    )
    :vars
    (
      ?auto_91114 - BLOCK
      ?auto_91116 - BLOCK
      ?auto_91115 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91109 ?auto_91110 ) ) ( not ( = ?auto_91109 ?auto_91111 ) ) ( not ( = ?auto_91109 ?auto_91112 ) ) ( not ( = ?auto_91109 ?auto_91113 ) ) ( not ( = ?auto_91110 ?auto_91111 ) ) ( not ( = ?auto_91110 ?auto_91112 ) ) ( not ( = ?auto_91110 ?auto_91113 ) ) ( not ( = ?auto_91111 ?auto_91112 ) ) ( not ( = ?auto_91111 ?auto_91113 ) ) ( not ( = ?auto_91112 ?auto_91113 ) ) ( not ( = ?auto_91109 ?auto_91114 ) ) ( not ( = ?auto_91110 ?auto_91114 ) ) ( not ( = ?auto_91111 ?auto_91114 ) ) ( not ( = ?auto_91112 ?auto_91114 ) ) ( not ( = ?auto_91113 ?auto_91114 ) ) ( ON-TABLE ?auto_91116 ) ( not ( = ?auto_91116 ?auto_91114 ) ) ( not ( = ?auto_91116 ?auto_91113 ) ) ( not ( = ?auto_91116 ?auto_91112 ) ) ( not ( = ?auto_91109 ?auto_91116 ) ) ( not ( = ?auto_91110 ?auto_91116 ) ) ( not ( = ?auto_91111 ?auto_91116 ) ) ( ON ?auto_91109 ?auto_91115 ) ( not ( = ?auto_91109 ?auto_91115 ) ) ( not ( = ?auto_91110 ?auto_91115 ) ) ( not ( = ?auto_91111 ?auto_91115 ) ) ( not ( = ?auto_91112 ?auto_91115 ) ) ( not ( = ?auto_91113 ?auto_91115 ) ) ( not ( = ?auto_91114 ?auto_91115 ) ) ( not ( = ?auto_91116 ?auto_91115 ) ) ( ON ?auto_91110 ?auto_91109 ) ( ON-TABLE ?auto_91115 ) ( ON ?auto_91111 ?auto_91110 ) ( ON ?auto_91112 ?auto_91111 ) ( ON ?auto_91113 ?auto_91112 ) ( CLEAR ?auto_91116 ) ( ON ?auto_91114 ?auto_91113 ) ( CLEAR ?auto_91114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91115 ?auto_91109 ?auto_91110 ?auto_91111 ?auto_91112 ?auto_91113 )
      ( MAKE-5PILE ?auto_91109 ?auto_91110 ?auto_91111 ?auto_91112 ?auto_91113 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91117 - BLOCK
      ?auto_91118 - BLOCK
      ?auto_91119 - BLOCK
      ?auto_91120 - BLOCK
      ?auto_91121 - BLOCK
    )
    :vars
    (
      ?auto_91124 - BLOCK
      ?auto_91123 - BLOCK
      ?auto_91122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91117 ?auto_91118 ) ) ( not ( = ?auto_91117 ?auto_91119 ) ) ( not ( = ?auto_91117 ?auto_91120 ) ) ( not ( = ?auto_91117 ?auto_91121 ) ) ( not ( = ?auto_91118 ?auto_91119 ) ) ( not ( = ?auto_91118 ?auto_91120 ) ) ( not ( = ?auto_91118 ?auto_91121 ) ) ( not ( = ?auto_91119 ?auto_91120 ) ) ( not ( = ?auto_91119 ?auto_91121 ) ) ( not ( = ?auto_91120 ?auto_91121 ) ) ( not ( = ?auto_91117 ?auto_91124 ) ) ( not ( = ?auto_91118 ?auto_91124 ) ) ( not ( = ?auto_91119 ?auto_91124 ) ) ( not ( = ?auto_91120 ?auto_91124 ) ) ( not ( = ?auto_91121 ?auto_91124 ) ) ( not ( = ?auto_91123 ?auto_91124 ) ) ( not ( = ?auto_91123 ?auto_91121 ) ) ( not ( = ?auto_91123 ?auto_91120 ) ) ( not ( = ?auto_91117 ?auto_91123 ) ) ( not ( = ?auto_91118 ?auto_91123 ) ) ( not ( = ?auto_91119 ?auto_91123 ) ) ( ON ?auto_91117 ?auto_91122 ) ( not ( = ?auto_91117 ?auto_91122 ) ) ( not ( = ?auto_91118 ?auto_91122 ) ) ( not ( = ?auto_91119 ?auto_91122 ) ) ( not ( = ?auto_91120 ?auto_91122 ) ) ( not ( = ?auto_91121 ?auto_91122 ) ) ( not ( = ?auto_91124 ?auto_91122 ) ) ( not ( = ?auto_91123 ?auto_91122 ) ) ( ON ?auto_91118 ?auto_91117 ) ( ON-TABLE ?auto_91122 ) ( ON ?auto_91119 ?auto_91118 ) ( ON ?auto_91120 ?auto_91119 ) ( ON ?auto_91121 ?auto_91120 ) ( ON ?auto_91124 ?auto_91121 ) ( CLEAR ?auto_91124 ) ( HOLDING ?auto_91123 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91123 )
      ( MAKE-5PILE ?auto_91117 ?auto_91118 ?auto_91119 ?auto_91120 ?auto_91121 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91125 - BLOCK
      ?auto_91126 - BLOCK
      ?auto_91127 - BLOCK
      ?auto_91128 - BLOCK
      ?auto_91129 - BLOCK
    )
    :vars
    (
      ?auto_91132 - BLOCK
      ?auto_91131 - BLOCK
      ?auto_91130 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91125 ?auto_91126 ) ) ( not ( = ?auto_91125 ?auto_91127 ) ) ( not ( = ?auto_91125 ?auto_91128 ) ) ( not ( = ?auto_91125 ?auto_91129 ) ) ( not ( = ?auto_91126 ?auto_91127 ) ) ( not ( = ?auto_91126 ?auto_91128 ) ) ( not ( = ?auto_91126 ?auto_91129 ) ) ( not ( = ?auto_91127 ?auto_91128 ) ) ( not ( = ?auto_91127 ?auto_91129 ) ) ( not ( = ?auto_91128 ?auto_91129 ) ) ( not ( = ?auto_91125 ?auto_91132 ) ) ( not ( = ?auto_91126 ?auto_91132 ) ) ( not ( = ?auto_91127 ?auto_91132 ) ) ( not ( = ?auto_91128 ?auto_91132 ) ) ( not ( = ?auto_91129 ?auto_91132 ) ) ( not ( = ?auto_91131 ?auto_91132 ) ) ( not ( = ?auto_91131 ?auto_91129 ) ) ( not ( = ?auto_91131 ?auto_91128 ) ) ( not ( = ?auto_91125 ?auto_91131 ) ) ( not ( = ?auto_91126 ?auto_91131 ) ) ( not ( = ?auto_91127 ?auto_91131 ) ) ( ON ?auto_91125 ?auto_91130 ) ( not ( = ?auto_91125 ?auto_91130 ) ) ( not ( = ?auto_91126 ?auto_91130 ) ) ( not ( = ?auto_91127 ?auto_91130 ) ) ( not ( = ?auto_91128 ?auto_91130 ) ) ( not ( = ?auto_91129 ?auto_91130 ) ) ( not ( = ?auto_91132 ?auto_91130 ) ) ( not ( = ?auto_91131 ?auto_91130 ) ) ( ON ?auto_91126 ?auto_91125 ) ( ON-TABLE ?auto_91130 ) ( ON ?auto_91127 ?auto_91126 ) ( ON ?auto_91128 ?auto_91127 ) ( ON ?auto_91129 ?auto_91128 ) ( ON ?auto_91132 ?auto_91129 ) ( ON ?auto_91131 ?auto_91132 ) ( CLEAR ?auto_91131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_91130 ?auto_91125 ?auto_91126 ?auto_91127 ?auto_91128 ?auto_91129 ?auto_91132 )
      ( MAKE-5PILE ?auto_91125 ?auto_91126 ?auto_91127 ?auto_91128 ?auto_91129 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_91144 - BLOCK
    )
    :vars
    (
      ?auto_91145 - BLOCK
      ?auto_91146 - BLOCK
      ?auto_91147 - BLOCK
      ?auto_91149 - BLOCK
      ?auto_91148 - BLOCK
      ?auto_91150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91145 ?auto_91144 ) ( ON-TABLE ?auto_91144 ) ( not ( = ?auto_91144 ?auto_91145 ) ) ( not ( = ?auto_91144 ?auto_91146 ) ) ( not ( = ?auto_91144 ?auto_91147 ) ) ( not ( = ?auto_91145 ?auto_91146 ) ) ( not ( = ?auto_91145 ?auto_91147 ) ) ( not ( = ?auto_91146 ?auto_91147 ) ) ( ON ?auto_91146 ?auto_91145 ) ( CLEAR ?auto_91146 ) ( HOLDING ?auto_91147 ) ( CLEAR ?auto_91149 ) ( ON-TABLE ?auto_91148 ) ( ON ?auto_91150 ?auto_91148 ) ( ON ?auto_91149 ?auto_91150 ) ( not ( = ?auto_91148 ?auto_91150 ) ) ( not ( = ?auto_91148 ?auto_91149 ) ) ( not ( = ?auto_91148 ?auto_91147 ) ) ( not ( = ?auto_91150 ?auto_91149 ) ) ( not ( = ?auto_91150 ?auto_91147 ) ) ( not ( = ?auto_91149 ?auto_91147 ) ) ( not ( = ?auto_91144 ?auto_91149 ) ) ( not ( = ?auto_91144 ?auto_91148 ) ) ( not ( = ?auto_91144 ?auto_91150 ) ) ( not ( = ?auto_91145 ?auto_91149 ) ) ( not ( = ?auto_91145 ?auto_91148 ) ) ( not ( = ?auto_91145 ?auto_91150 ) ) ( not ( = ?auto_91146 ?auto_91149 ) ) ( not ( = ?auto_91146 ?auto_91148 ) ) ( not ( = ?auto_91146 ?auto_91150 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91148 ?auto_91150 ?auto_91149 ?auto_91147 )
      ( MAKE-1PILE ?auto_91144 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_91151 - BLOCK
    )
    :vars
    (
      ?auto_91155 - BLOCK
      ?auto_91156 - BLOCK
      ?auto_91157 - BLOCK
      ?auto_91152 - BLOCK
      ?auto_91154 - BLOCK
      ?auto_91153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91155 ?auto_91151 ) ( ON-TABLE ?auto_91151 ) ( not ( = ?auto_91151 ?auto_91155 ) ) ( not ( = ?auto_91151 ?auto_91156 ) ) ( not ( = ?auto_91151 ?auto_91157 ) ) ( not ( = ?auto_91155 ?auto_91156 ) ) ( not ( = ?auto_91155 ?auto_91157 ) ) ( not ( = ?auto_91156 ?auto_91157 ) ) ( ON ?auto_91156 ?auto_91155 ) ( CLEAR ?auto_91152 ) ( ON-TABLE ?auto_91154 ) ( ON ?auto_91153 ?auto_91154 ) ( ON ?auto_91152 ?auto_91153 ) ( not ( = ?auto_91154 ?auto_91153 ) ) ( not ( = ?auto_91154 ?auto_91152 ) ) ( not ( = ?auto_91154 ?auto_91157 ) ) ( not ( = ?auto_91153 ?auto_91152 ) ) ( not ( = ?auto_91153 ?auto_91157 ) ) ( not ( = ?auto_91152 ?auto_91157 ) ) ( not ( = ?auto_91151 ?auto_91152 ) ) ( not ( = ?auto_91151 ?auto_91154 ) ) ( not ( = ?auto_91151 ?auto_91153 ) ) ( not ( = ?auto_91155 ?auto_91152 ) ) ( not ( = ?auto_91155 ?auto_91154 ) ) ( not ( = ?auto_91155 ?auto_91153 ) ) ( not ( = ?auto_91156 ?auto_91152 ) ) ( not ( = ?auto_91156 ?auto_91154 ) ) ( not ( = ?auto_91156 ?auto_91153 ) ) ( ON ?auto_91157 ?auto_91156 ) ( CLEAR ?auto_91157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91151 ?auto_91155 ?auto_91156 )
      ( MAKE-1PILE ?auto_91151 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_91158 - BLOCK
    )
    :vars
    (
      ?auto_91159 - BLOCK
      ?auto_91162 - BLOCK
      ?auto_91164 - BLOCK
      ?auto_91161 - BLOCK
      ?auto_91160 - BLOCK
      ?auto_91163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91159 ?auto_91158 ) ( ON-TABLE ?auto_91158 ) ( not ( = ?auto_91158 ?auto_91159 ) ) ( not ( = ?auto_91158 ?auto_91162 ) ) ( not ( = ?auto_91158 ?auto_91164 ) ) ( not ( = ?auto_91159 ?auto_91162 ) ) ( not ( = ?auto_91159 ?auto_91164 ) ) ( not ( = ?auto_91162 ?auto_91164 ) ) ( ON ?auto_91162 ?auto_91159 ) ( ON-TABLE ?auto_91161 ) ( ON ?auto_91160 ?auto_91161 ) ( not ( = ?auto_91161 ?auto_91160 ) ) ( not ( = ?auto_91161 ?auto_91163 ) ) ( not ( = ?auto_91161 ?auto_91164 ) ) ( not ( = ?auto_91160 ?auto_91163 ) ) ( not ( = ?auto_91160 ?auto_91164 ) ) ( not ( = ?auto_91163 ?auto_91164 ) ) ( not ( = ?auto_91158 ?auto_91163 ) ) ( not ( = ?auto_91158 ?auto_91161 ) ) ( not ( = ?auto_91158 ?auto_91160 ) ) ( not ( = ?auto_91159 ?auto_91163 ) ) ( not ( = ?auto_91159 ?auto_91161 ) ) ( not ( = ?auto_91159 ?auto_91160 ) ) ( not ( = ?auto_91162 ?auto_91163 ) ) ( not ( = ?auto_91162 ?auto_91161 ) ) ( not ( = ?auto_91162 ?auto_91160 ) ) ( ON ?auto_91164 ?auto_91162 ) ( CLEAR ?auto_91164 ) ( HOLDING ?auto_91163 ) ( CLEAR ?auto_91160 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91161 ?auto_91160 ?auto_91163 )
      ( MAKE-1PILE ?auto_91158 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_91165 - BLOCK
    )
    :vars
    (
      ?auto_91166 - BLOCK
      ?auto_91171 - BLOCK
      ?auto_91169 - BLOCK
      ?auto_91170 - BLOCK
      ?auto_91168 - BLOCK
      ?auto_91167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91166 ?auto_91165 ) ( ON-TABLE ?auto_91165 ) ( not ( = ?auto_91165 ?auto_91166 ) ) ( not ( = ?auto_91165 ?auto_91171 ) ) ( not ( = ?auto_91165 ?auto_91169 ) ) ( not ( = ?auto_91166 ?auto_91171 ) ) ( not ( = ?auto_91166 ?auto_91169 ) ) ( not ( = ?auto_91171 ?auto_91169 ) ) ( ON ?auto_91171 ?auto_91166 ) ( ON-TABLE ?auto_91170 ) ( ON ?auto_91168 ?auto_91170 ) ( not ( = ?auto_91170 ?auto_91168 ) ) ( not ( = ?auto_91170 ?auto_91167 ) ) ( not ( = ?auto_91170 ?auto_91169 ) ) ( not ( = ?auto_91168 ?auto_91167 ) ) ( not ( = ?auto_91168 ?auto_91169 ) ) ( not ( = ?auto_91167 ?auto_91169 ) ) ( not ( = ?auto_91165 ?auto_91167 ) ) ( not ( = ?auto_91165 ?auto_91170 ) ) ( not ( = ?auto_91165 ?auto_91168 ) ) ( not ( = ?auto_91166 ?auto_91167 ) ) ( not ( = ?auto_91166 ?auto_91170 ) ) ( not ( = ?auto_91166 ?auto_91168 ) ) ( not ( = ?auto_91171 ?auto_91167 ) ) ( not ( = ?auto_91171 ?auto_91170 ) ) ( not ( = ?auto_91171 ?auto_91168 ) ) ( ON ?auto_91169 ?auto_91171 ) ( CLEAR ?auto_91168 ) ( ON ?auto_91167 ?auto_91169 ) ( CLEAR ?auto_91167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91165 ?auto_91166 ?auto_91171 ?auto_91169 )
      ( MAKE-1PILE ?auto_91165 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_91172 - BLOCK
    )
    :vars
    (
      ?auto_91173 - BLOCK
      ?auto_91176 - BLOCK
      ?auto_91178 - BLOCK
      ?auto_91174 - BLOCK
      ?auto_91177 - BLOCK
      ?auto_91175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91173 ?auto_91172 ) ( ON-TABLE ?auto_91172 ) ( not ( = ?auto_91172 ?auto_91173 ) ) ( not ( = ?auto_91172 ?auto_91176 ) ) ( not ( = ?auto_91172 ?auto_91178 ) ) ( not ( = ?auto_91173 ?auto_91176 ) ) ( not ( = ?auto_91173 ?auto_91178 ) ) ( not ( = ?auto_91176 ?auto_91178 ) ) ( ON ?auto_91176 ?auto_91173 ) ( ON-TABLE ?auto_91174 ) ( not ( = ?auto_91174 ?auto_91177 ) ) ( not ( = ?auto_91174 ?auto_91175 ) ) ( not ( = ?auto_91174 ?auto_91178 ) ) ( not ( = ?auto_91177 ?auto_91175 ) ) ( not ( = ?auto_91177 ?auto_91178 ) ) ( not ( = ?auto_91175 ?auto_91178 ) ) ( not ( = ?auto_91172 ?auto_91175 ) ) ( not ( = ?auto_91172 ?auto_91174 ) ) ( not ( = ?auto_91172 ?auto_91177 ) ) ( not ( = ?auto_91173 ?auto_91175 ) ) ( not ( = ?auto_91173 ?auto_91174 ) ) ( not ( = ?auto_91173 ?auto_91177 ) ) ( not ( = ?auto_91176 ?auto_91175 ) ) ( not ( = ?auto_91176 ?auto_91174 ) ) ( not ( = ?auto_91176 ?auto_91177 ) ) ( ON ?auto_91178 ?auto_91176 ) ( ON ?auto_91175 ?auto_91178 ) ( CLEAR ?auto_91175 ) ( HOLDING ?auto_91177 ) ( CLEAR ?auto_91174 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91174 ?auto_91177 )
      ( MAKE-1PILE ?auto_91172 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_91179 - BLOCK
    )
    :vars
    (
      ?auto_91184 - BLOCK
      ?auto_91181 - BLOCK
      ?auto_91180 - BLOCK
      ?auto_91185 - BLOCK
      ?auto_91182 - BLOCK
      ?auto_91183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91184 ?auto_91179 ) ( ON-TABLE ?auto_91179 ) ( not ( = ?auto_91179 ?auto_91184 ) ) ( not ( = ?auto_91179 ?auto_91181 ) ) ( not ( = ?auto_91179 ?auto_91180 ) ) ( not ( = ?auto_91184 ?auto_91181 ) ) ( not ( = ?auto_91184 ?auto_91180 ) ) ( not ( = ?auto_91181 ?auto_91180 ) ) ( ON ?auto_91181 ?auto_91184 ) ( ON-TABLE ?auto_91185 ) ( not ( = ?auto_91185 ?auto_91182 ) ) ( not ( = ?auto_91185 ?auto_91183 ) ) ( not ( = ?auto_91185 ?auto_91180 ) ) ( not ( = ?auto_91182 ?auto_91183 ) ) ( not ( = ?auto_91182 ?auto_91180 ) ) ( not ( = ?auto_91183 ?auto_91180 ) ) ( not ( = ?auto_91179 ?auto_91183 ) ) ( not ( = ?auto_91179 ?auto_91185 ) ) ( not ( = ?auto_91179 ?auto_91182 ) ) ( not ( = ?auto_91184 ?auto_91183 ) ) ( not ( = ?auto_91184 ?auto_91185 ) ) ( not ( = ?auto_91184 ?auto_91182 ) ) ( not ( = ?auto_91181 ?auto_91183 ) ) ( not ( = ?auto_91181 ?auto_91185 ) ) ( not ( = ?auto_91181 ?auto_91182 ) ) ( ON ?auto_91180 ?auto_91181 ) ( ON ?auto_91183 ?auto_91180 ) ( CLEAR ?auto_91185 ) ( ON ?auto_91182 ?auto_91183 ) ( CLEAR ?auto_91182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91179 ?auto_91184 ?auto_91181 ?auto_91180 ?auto_91183 )
      ( MAKE-1PILE ?auto_91179 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_91186 - BLOCK
    )
    :vars
    (
      ?auto_91192 - BLOCK
      ?auto_91189 - BLOCK
      ?auto_91191 - BLOCK
      ?auto_91190 - BLOCK
      ?auto_91187 - BLOCK
      ?auto_91188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91192 ?auto_91186 ) ( ON-TABLE ?auto_91186 ) ( not ( = ?auto_91186 ?auto_91192 ) ) ( not ( = ?auto_91186 ?auto_91189 ) ) ( not ( = ?auto_91186 ?auto_91191 ) ) ( not ( = ?auto_91192 ?auto_91189 ) ) ( not ( = ?auto_91192 ?auto_91191 ) ) ( not ( = ?auto_91189 ?auto_91191 ) ) ( ON ?auto_91189 ?auto_91192 ) ( not ( = ?auto_91190 ?auto_91187 ) ) ( not ( = ?auto_91190 ?auto_91188 ) ) ( not ( = ?auto_91190 ?auto_91191 ) ) ( not ( = ?auto_91187 ?auto_91188 ) ) ( not ( = ?auto_91187 ?auto_91191 ) ) ( not ( = ?auto_91188 ?auto_91191 ) ) ( not ( = ?auto_91186 ?auto_91188 ) ) ( not ( = ?auto_91186 ?auto_91190 ) ) ( not ( = ?auto_91186 ?auto_91187 ) ) ( not ( = ?auto_91192 ?auto_91188 ) ) ( not ( = ?auto_91192 ?auto_91190 ) ) ( not ( = ?auto_91192 ?auto_91187 ) ) ( not ( = ?auto_91189 ?auto_91188 ) ) ( not ( = ?auto_91189 ?auto_91190 ) ) ( not ( = ?auto_91189 ?auto_91187 ) ) ( ON ?auto_91191 ?auto_91189 ) ( ON ?auto_91188 ?auto_91191 ) ( ON ?auto_91187 ?auto_91188 ) ( CLEAR ?auto_91187 ) ( HOLDING ?auto_91190 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91190 )
      ( MAKE-1PILE ?auto_91186 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_91201 - BLOCK
    )
    :vars
    (
      ?auto_91202 - BLOCK
      ?auto_91203 - BLOCK
      ?auto_91206 - BLOCK
      ?auto_91205 - BLOCK
      ?auto_91207 - BLOCK
      ?auto_91204 - BLOCK
      ?auto_91208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91202 ?auto_91201 ) ( ON-TABLE ?auto_91201 ) ( not ( = ?auto_91201 ?auto_91202 ) ) ( not ( = ?auto_91201 ?auto_91203 ) ) ( not ( = ?auto_91201 ?auto_91206 ) ) ( not ( = ?auto_91202 ?auto_91203 ) ) ( not ( = ?auto_91202 ?auto_91206 ) ) ( not ( = ?auto_91203 ?auto_91206 ) ) ( ON ?auto_91203 ?auto_91202 ) ( not ( = ?auto_91205 ?auto_91207 ) ) ( not ( = ?auto_91205 ?auto_91204 ) ) ( not ( = ?auto_91205 ?auto_91206 ) ) ( not ( = ?auto_91207 ?auto_91204 ) ) ( not ( = ?auto_91207 ?auto_91206 ) ) ( not ( = ?auto_91204 ?auto_91206 ) ) ( not ( = ?auto_91201 ?auto_91204 ) ) ( not ( = ?auto_91201 ?auto_91205 ) ) ( not ( = ?auto_91201 ?auto_91207 ) ) ( not ( = ?auto_91202 ?auto_91204 ) ) ( not ( = ?auto_91202 ?auto_91205 ) ) ( not ( = ?auto_91202 ?auto_91207 ) ) ( not ( = ?auto_91203 ?auto_91204 ) ) ( not ( = ?auto_91203 ?auto_91205 ) ) ( not ( = ?auto_91203 ?auto_91207 ) ) ( ON ?auto_91206 ?auto_91203 ) ( ON ?auto_91204 ?auto_91206 ) ( ON ?auto_91207 ?auto_91204 ) ( CLEAR ?auto_91207 ) ( ON ?auto_91205 ?auto_91208 ) ( CLEAR ?auto_91205 ) ( HAND-EMPTY ) ( not ( = ?auto_91201 ?auto_91208 ) ) ( not ( = ?auto_91202 ?auto_91208 ) ) ( not ( = ?auto_91203 ?auto_91208 ) ) ( not ( = ?auto_91206 ?auto_91208 ) ) ( not ( = ?auto_91205 ?auto_91208 ) ) ( not ( = ?auto_91207 ?auto_91208 ) ) ( not ( = ?auto_91204 ?auto_91208 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91205 ?auto_91208 )
      ( MAKE-1PILE ?auto_91201 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_91209 - BLOCK
    )
    :vars
    (
      ?auto_91212 - BLOCK
      ?auto_91211 - BLOCK
      ?auto_91216 - BLOCK
      ?auto_91214 - BLOCK
      ?auto_91213 - BLOCK
      ?auto_91210 - BLOCK
      ?auto_91215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91212 ?auto_91209 ) ( ON-TABLE ?auto_91209 ) ( not ( = ?auto_91209 ?auto_91212 ) ) ( not ( = ?auto_91209 ?auto_91211 ) ) ( not ( = ?auto_91209 ?auto_91216 ) ) ( not ( = ?auto_91212 ?auto_91211 ) ) ( not ( = ?auto_91212 ?auto_91216 ) ) ( not ( = ?auto_91211 ?auto_91216 ) ) ( ON ?auto_91211 ?auto_91212 ) ( not ( = ?auto_91214 ?auto_91213 ) ) ( not ( = ?auto_91214 ?auto_91210 ) ) ( not ( = ?auto_91214 ?auto_91216 ) ) ( not ( = ?auto_91213 ?auto_91210 ) ) ( not ( = ?auto_91213 ?auto_91216 ) ) ( not ( = ?auto_91210 ?auto_91216 ) ) ( not ( = ?auto_91209 ?auto_91210 ) ) ( not ( = ?auto_91209 ?auto_91214 ) ) ( not ( = ?auto_91209 ?auto_91213 ) ) ( not ( = ?auto_91212 ?auto_91210 ) ) ( not ( = ?auto_91212 ?auto_91214 ) ) ( not ( = ?auto_91212 ?auto_91213 ) ) ( not ( = ?auto_91211 ?auto_91210 ) ) ( not ( = ?auto_91211 ?auto_91214 ) ) ( not ( = ?auto_91211 ?auto_91213 ) ) ( ON ?auto_91216 ?auto_91211 ) ( ON ?auto_91210 ?auto_91216 ) ( ON ?auto_91214 ?auto_91215 ) ( CLEAR ?auto_91214 ) ( not ( = ?auto_91209 ?auto_91215 ) ) ( not ( = ?auto_91212 ?auto_91215 ) ) ( not ( = ?auto_91211 ?auto_91215 ) ) ( not ( = ?auto_91216 ?auto_91215 ) ) ( not ( = ?auto_91214 ?auto_91215 ) ) ( not ( = ?auto_91213 ?auto_91215 ) ) ( not ( = ?auto_91210 ?auto_91215 ) ) ( HOLDING ?auto_91213 ) ( CLEAR ?auto_91210 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91209 ?auto_91212 ?auto_91211 ?auto_91216 ?auto_91210 ?auto_91213 )
      ( MAKE-1PILE ?auto_91209 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_91217 - BLOCK
    )
    :vars
    (
      ?auto_91221 - BLOCK
      ?auto_91220 - BLOCK
      ?auto_91224 - BLOCK
      ?auto_91222 - BLOCK
      ?auto_91223 - BLOCK
      ?auto_91219 - BLOCK
      ?auto_91218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91221 ?auto_91217 ) ( ON-TABLE ?auto_91217 ) ( not ( = ?auto_91217 ?auto_91221 ) ) ( not ( = ?auto_91217 ?auto_91220 ) ) ( not ( = ?auto_91217 ?auto_91224 ) ) ( not ( = ?auto_91221 ?auto_91220 ) ) ( not ( = ?auto_91221 ?auto_91224 ) ) ( not ( = ?auto_91220 ?auto_91224 ) ) ( ON ?auto_91220 ?auto_91221 ) ( not ( = ?auto_91222 ?auto_91223 ) ) ( not ( = ?auto_91222 ?auto_91219 ) ) ( not ( = ?auto_91222 ?auto_91224 ) ) ( not ( = ?auto_91223 ?auto_91219 ) ) ( not ( = ?auto_91223 ?auto_91224 ) ) ( not ( = ?auto_91219 ?auto_91224 ) ) ( not ( = ?auto_91217 ?auto_91219 ) ) ( not ( = ?auto_91217 ?auto_91222 ) ) ( not ( = ?auto_91217 ?auto_91223 ) ) ( not ( = ?auto_91221 ?auto_91219 ) ) ( not ( = ?auto_91221 ?auto_91222 ) ) ( not ( = ?auto_91221 ?auto_91223 ) ) ( not ( = ?auto_91220 ?auto_91219 ) ) ( not ( = ?auto_91220 ?auto_91222 ) ) ( not ( = ?auto_91220 ?auto_91223 ) ) ( ON ?auto_91224 ?auto_91220 ) ( ON ?auto_91219 ?auto_91224 ) ( ON ?auto_91222 ?auto_91218 ) ( not ( = ?auto_91217 ?auto_91218 ) ) ( not ( = ?auto_91221 ?auto_91218 ) ) ( not ( = ?auto_91220 ?auto_91218 ) ) ( not ( = ?auto_91224 ?auto_91218 ) ) ( not ( = ?auto_91222 ?auto_91218 ) ) ( not ( = ?auto_91223 ?auto_91218 ) ) ( not ( = ?auto_91219 ?auto_91218 ) ) ( CLEAR ?auto_91219 ) ( ON ?auto_91223 ?auto_91222 ) ( CLEAR ?auto_91223 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91218 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91218 ?auto_91222 )
      ( MAKE-1PILE ?auto_91217 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_91225 - BLOCK
    )
    :vars
    (
      ?auto_91228 - BLOCK
      ?auto_91232 - BLOCK
      ?auto_91227 - BLOCK
      ?auto_91230 - BLOCK
      ?auto_91231 - BLOCK
      ?auto_91226 - BLOCK
      ?auto_91229 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91228 ?auto_91225 ) ( ON-TABLE ?auto_91225 ) ( not ( = ?auto_91225 ?auto_91228 ) ) ( not ( = ?auto_91225 ?auto_91232 ) ) ( not ( = ?auto_91225 ?auto_91227 ) ) ( not ( = ?auto_91228 ?auto_91232 ) ) ( not ( = ?auto_91228 ?auto_91227 ) ) ( not ( = ?auto_91232 ?auto_91227 ) ) ( ON ?auto_91232 ?auto_91228 ) ( not ( = ?auto_91230 ?auto_91231 ) ) ( not ( = ?auto_91230 ?auto_91226 ) ) ( not ( = ?auto_91230 ?auto_91227 ) ) ( not ( = ?auto_91231 ?auto_91226 ) ) ( not ( = ?auto_91231 ?auto_91227 ) ) ( not ( = ?auto_91226 ?auto_91227 ) ) ( not ( = ?auto_91225 ?auto_91226 ) ) ( not ( = ?auto_91225 ?auto_91230 ) ) ( not ( = ?auto_91225 ?auto_91231 ) ) ( not ( = ?auto_91228 ?auto_91226 ) ) ( not ( = ?auto_91228 ?auto_91230 ) ) ( not ( = ?auto_91228 ?auto_91231 ) ) ( not ( = ?auto_91232 ?auto_91226 ) ) ( not ( = ?auto_91232 ?auto_91230 ) ) ( not ( = ?auto_91232 ?auto_91231 ) ) ( ON ?auto_91227 ?auto_91232 ) ( ON ?auto_91230 ?auto_91229 ) ( not ( = ?auto_91225 ?auto_91229 ) ) ( not ( = ?auto_91228 ?auto_91229 ) ) ( not ( = ?auto_91232 ?auto_91229 ) ) ( not ( = ?auto_91227 ?auto_91229 ) ) ( not ( = ?auto_91230 ?auto_91229 ) ) ( not ( = ?auto_91231 ?auto_91229 ) ) ( not ( = ?auto_91226 ?auto_91229 ) ) ( ON ?auto_91231 ?auto_91230 ) ( CLEAR ?auto_91231 ) ( ON-TABLE ?auto_91229 ) ( HOLDING ?auto_91226 ) ( CLEAR ?auto_91227 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91225 ?auto_91228 ?auto_91232 ?auto_91227 ?auto_91226 )
      ( MAKE-1PILE ?auto_91225 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_91271 - BLOCK
      ?auto_91272 - BLOCK
      ?auto_91273 - BLOCK
      ?auto_91274 - BLOCK
      ?auto_91275 - BLOCK
      ?auto_91276 - BLOCK
    )
    :vars
    (
      ?auto_91277 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91271 ) ( ON ?auto_91272 ?auto_91271 ) ( ON ?auto_91273 ?auto_91272 ) ( ON ?auto_91274 ?auto_91273 ) ( not ( = ?auto_91271 ?auto_91272 ) ) ( not ( = ?auto_91271 ?auto_91273 ) ) ( not ( = ?auto_91271 ?auto_91274 ) ) ( not ( = ?auto_91271 ?auto_91275 ) ) ( not ( = ?auto_91271 ?auto_91276 ) ) ( not ( = ?auto_91272 ?auto_91273 ) ) ( not ( = ?auto_91272 ?auto_91274 ) ) ( not ( = ?auto_91272 ?auto_91275 ) ) ( not ( = ?auto_91272 ?auto_91276 ) ) ( not ( = ?auto_91273 ?auto_91274 ) ) ( not ( = ?auto_91273 ?auto_91275 ) ) ( not ( = ?auto_91273 ?auto_91276 ) ) ( not ( = ?auto_91274 ?auto_91275 ) ) ( not ( = ?auto_91274 ?auto_91276 ) ) ( not ( = ?auto_91275 ?auto_91276 ) ) ( ON ?auto_91276 ?auto_91277 ) ( not ( = ?auto_91271 ?auto_91277 ) ) ( not ( = ?auto_91272 ?auto_91277 ) ) ( not ( = ?auto_91273 ?auto_91277 ) ) ( not ( = ?auto_91274 ?auto_91277 ) ) ( not ( = ?auto_91275 ?auto_91277 ) ) ( not ( = ?auto_91276 ?auto_91277 ) ) ( CLEAR ?auto_91274 ) ( ON ?auto_91275 ?auto_91276 ) ( CLEAR ?auto_91275 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91277 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91277 ?auto_91276 )
      ( MAKE-6PILE ?auto_91271 ?auto_91272 ?auto_91273 ?auto_91274 ?auto_91275 ?auto_91276 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_91278 - BLOCK
      ?auto_91279 - BLOCK
      ?auto_91280 - BLOCK
      ?auto_91281 - BLOCK
      ?auto_91282 - BLOCK
      ?auto_91283 - BLOCK
    )
    :vars
    (
      ?auto_91284 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91278 ) ( ON ?auto_91279 ?auto_91278 ) ( ON ?auto_91280 ?auto_91279 ) ( not ( = ?auto_91278 ?auto_91279 ) ) ( not ( = ?auto_91278 ?auto_91280 ) ) ( not ( = ?auto_91278 ?auto_91281 ) ) ( not ( = ?auto_91278 ?auto_91282 ) ) ( not ( = ?auto_91278 ?auto_91283 ) ) ( not ( = ?auto_91279 ?auto_91280 ) ) ( not ( = ?auto_91279 ?auto_91281 ) ) ( not ( = ?auto_91279 ?auto_91282 ) ) ( not ( = ?auto_91279 ?auto_91283 ) ) ( not ( = ?auto_91280 ?auto_91281 ) ) ( not ( = ?auto_91280 ?auto_91282 ) ) ( not ( = ?auto_91280 ?auto_91283 ) ) ( not ( = ?auto_91281 ?auto_91282 ) ) ( not ( = ?auto_91281 ?auto_91283 ) ) ( not ( = ?auto_91282 ?auto_91283 ) ) ( ON ?auto_91283 ?auto_91284 ) ( not ( = ?auto_91278 ?auto_91284 ) ) ( not ( = ?auto_91279 ?auto_91284 ) ) ( not ( = ?auto_91280 ?auto_91284 ) ) ( not ( = ?auto_91281 ?auto_91284 ) ) ( not ( = ?auto_91282 ?auto_91284 ) ) ( not ( = ?auto_91283 ?auto_91284 ) ) ( ON ?auto_91282 ?auto_91283 ) ( CLEAR ?auto_91282 ) ( ON-TABLE ?auto_91284 ) ( HOLDING ?auto_91281 ) ( CLEAR ?auto_91280 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91278 ?auto_91279 ?auto_91280 ?auto_91281 )
      ( MAKE-6PILE ?auto_91278 ?auto_91279 ?auto_91280 ?auto_91281 ?auto_91282 ?auto_91283 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_91285 - BLOCK
      ?auto_91286 - BLOCK
      ?auto_91287 - BLOCK
      ?auto_91288 - BLOCK
      ?auto_91289 - BLOCK
      ?auto_91290 - BLOCK
    )
    :vars
    (
      ?auto_91291 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91285 ) ( ON ?auto_91286 ?auto_91285 ) ( ON ?auto_91287 ?auto_91286 ) ( not ( = ?auto_91285 ?auto_91286 ) ) ( not ( = ?auto_91285 ?auto_91287 ) ) ( not ( = ?auto_91285 ?auto_91288 ) ) ( not ( = ?auto_91285 ?auto_91289 ) ) ( not ( = ?auto_91285 ?auto_91290 ) ) ( not ( = ?auto_91286 ?auto_91287 ) ) ( not ( = ?auto_91286 ?auto_91288 ) ) ( not ( = ?auto_91286 ?auto_91289 ) ) ( not ( = ?auto_91286 ?auto_91290 ) ) ( not ( = ?auto_91287 ?auto_91288 ) ) ( not ( = ?auto_91287 ?auto_91289 ) ) ( not ( = ?auto_91287 ?auto_91290 ) ) ( not ( = ?auto_91288 ?auto_91289 ) ) ( not ( = ?auto_91288 ?auto_91290 ) ) ( not ( = ?auto_91289 ?auto_91290 ) ) ( ON ?auto_91290 ?auto_91291 ) ( not ( = ?auto_91285 ?auto_91291 ) ) ( not ( = ?auto_91286 ?auto_91291 ) ) ( not ( = ?auto_91287 ?auto_91291 ) ) ( not ( = ?auto_91288 ?auto_91291 ) ) ( not ( = ?auto_91289 ?auto_91291 ) ) ( not ( = ?auto_91290 ?auto_91291 ) ) ( ON ?auto_91289 ?auto_91290 ) ( ON-TABLE ?auto_91291 ) ( CLEAR ?auto_91287 ) ( ON ?auto_91288 ?auto_91289 ) ( CLEAR ?auto_91288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91291 ?auto_91290 ?auto_91289 )
      ( MAKE-6PILE ?auto_91285 ?auto_91286 ?auto_91287 ?auto_91288 ?auto_91289 ?auto_91290 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_91292 - BLOCK
      ?auto_91293 - BLOCK
      ?auto_91294 - BLOCK
      ?auto_91295 - BLOCK
      ?auto_91296 - BLOCK
      ?auto_91297 - BLOCK
    )
    :vars
    (
      ?auto_91298 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91292 ) ( ON ?auto_91293 ?auto_91292 ) ( not ( = ?auto_91292 ?auto_91293 ) ) ( not ( = ?auto_91292 ?auto_91294 ) ) ( not ( = ?auto_91292 ?auto_91295 ) ) ( not ( = ?auto_91292 ?auto_91296 ) ) ( not ( = ?auto_91292 ?auto_91297 ) ) ( not ( = ?auto_91293 ?auto_91294 ) ) ( not ( = ?auto_91293 ?auto_91295 ) ) ( not ( = ?auto_91293 ?auto_91296 ) ) ( not ( = ?auto_91293 ?auto_91297 ) ) ( not ( = ?auto_91294 ?auto_91295 ) ) ( not ( = ?auto_91294 ?auto_91296 ) ) ( not ( = ?auto_91294 ?auto_91297 ) ) ( not ( = ?auto_91295 ?auto_91296 ) ) ( not ( = ?auto_91295 ?auto_91297 ) ) ( not ( = ?auto_91296 ?auto_91297 ) ) ( ON ?auto_91297 ?auto_91298 ) ( not ( = ?auto_91292 ?auto_91298 ) ) ( not ( = ?auto_91293 ?auto_91298 ) ) ( not ( = ?auto_91294 ?auto_91298 ) ) ( not ( = ?auto_91295 ?auto_91298 ) ) ( not ( = ?auto_91296 ?auto_91298 ) ) ( not ( = ?auto_91297 ?auto_91298 ) ) ( ON ?auto_91296 ?auto_91297 ) ( ON-TABLE ?auto_91298 ) ( ON ?auto_91295 ?auto_91296 ) ( CLEAR ?auto_91295 ) ( HOLDING ?auto_91294 ) ( CLEAR ?auto_91293 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91292 ?auto_91293 ?auto_91294 )
      ( MAKE-6PILE ?auto_91292 ?auto_91293 ?auto_91294 ?auto_91295 ?auto_91296 ?auto_91297 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_91299 - BLOCK
      ?auto_91300 - BLOCK
      ?auto_91301 - BLOCK
      ?auto_91302 - BLOCK
      ?auto_91303 - BLOCK
      ?auto_91304 - BLOCK
    )
    :vars
    (
      ?auto_91305 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91299 ) ( ON ?auto_91300 ?auto_91299 ) ( not ( = ?auto_91299 ?auto_91300 ) ) ( not ( = ?auto_91299 ?auto_91301 ) ) ( not ( = ?auto_91299 ?auto_91302 ) ) ( not ( = ?auto_91299 ?auto_91303 ) ) ( not ( = ?auto_91299 ?auto_91304 ) ) ( not ( = ?auto_91300 ?auto_91301 ) ) ( not ( = ?auto_91300 ?auto_91302 ) ) ( not ( = ?auto_91300 ?auto_91303 ) ) ( not ( = ?auto_91300 ?auto_91304 ) ) ( not ( = ?auto_91301 ?auto_91302 ) ) ( not ( = ?auto_91301 ?auto_91303 ) ) ( not ( = ?auto_91301 ?auto_91304 ) ) ( not ( = ?auto_91302 ?auto_91303 ) ) ( not ( = ?auto_91302 ?auto_91304 ) ) ( not ( = ?auto_91303 ?auto_91304 ) ) ( ON ?auto_91304 ?auto_91305 ) ( not ( = ?auto_91299 ?auto_91305 ) ) ( not ( = ?auto_91300 ?auto_91305 ) ) ( not ( = ?auto_91301 ?auto_91305 ) ) ( not ( = ?auto_91302 ?auto_91305 ) ) ( not ( = ?auto_91303 ?auto_91305 ) ) ( not ( = ?auto_91304 ?auto_91305 ) ) ( ON ?auto_91303 ?auto_91304 ) ( ON-TABLE ?auto_91305 ) ( ON ?auto_91302 ?auto_91303 ) ( CLEAR ?auto_91300 ) ( ON ?auto_91301 ?auto_91302 ) ( CLEAR ?auto_91301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91305 ?auto_91304 ?auto_91303 ?auto_91302 )
      ( MAKE-6PILE ?auto_91299 ?auto_91300 ?auto_91301 ?auto_91302 ?auto_91303 ?auto_91304 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_91306 - BLOCK
      ?auto_91307 - BLOCK
      ?auto_91308 - BLOCK
      ?auto_91309 - BLOCK
      ?auto_91310 - BLOCK
      ?auto_91311 - BLOCK
    )
    :vars
    (
      ?auto_91312 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91306 ) ( not ( = ?auto_91306 ?auto_91307 ) ) ( not ( = ?auto_91306 ?auto_91308 ) ) ( not ( = ?auto_91306 ?auto_91309 ) ) ( not ( = ?auto_91306 ?auto_91310 ) ) ( not ( = ?auto_91306 ?auto_91311 ) ) ( not ( = ?auto_91307 ?auto_91308 ) ) ( not ( = ?auto_91307 ?auto_91309 ) ) ( not ( = ?auto_91307 ?auto_91310 ) ) ( not ( = ?auto_91307 ?auto_91311 ) ) ( not ( = ?auto_91308 ?auto_91309 ) ) ( not ( = ?auto_91308 ?auto_91310 ) ) ( not ( = ?auto_91308 ?auto_91311 ) ) ( not ( = ?auto_91309 ?auto_91310 ) ) ( not ( = ?auto_91309 ?auto_91311 ) ) ( not ( = ?auto_91310 ?auto_91311 ) ) ( ON ?auto_91311 ?auto_91312 ) ( not ( = ?auto_91306 ?auto_91312 ) ) ( not ( = ?auto_91307 ?auto_91312 ) ) ( not ( = ?auto_91308 ?auto_91312 ) ) ( not ( = ?auto_91309 ?auto_91312 ) ) ( not ( = ?auto_91310 ?auto_91312 ) ) ( not ( = ?auto_91311 ?auto_91312 ) ) ( ON ?auto_91310 ?auto_91311 ) ( ON-TABLE ?auto_91312 ) ( ON ?auto_91309 ?auto_91310 ) ( ON ?auto_91308 ?auto_91309 ) ( CLEAR ?auto_91308 ) ( HOLDING ?auto_91307 ) ( CLEAR ?auto_91306 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91306 ?auto_91307 )
      ( MAKE-6PILE ?auto_91306 ?auto_91307 ?auto_91308 ?auto_91309 ?auto_91310 ?auto_91311 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_91313 - BLOCK
      ?auto_91314 - BLOCK
      ?auto_91315 - BLOCK
      ?auto_91316 - BLOCK
      ?auto_91317 - BLOCK
      ?auto_91318 - BLOCK
    )
    :vars
    (
      ?auto_91319 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91313 ) ( not ( = ?auto_91313 ?auto_91314 ) ) ( not ( = ?auto_91313 ?auto_91315 ) ) ( not ( = ?auto_91313 ?auto_91316 ) ) ( not ( = ?auto_91313 ?auto_91317 ) ) ( not ( = ?auto_91313 ?auto_91318 ) ) ( not ( = ?auto_91314 ?auto_91315 ) ) ( not ( = ?auto_91314 ?auto_91316 ) ) ( not ( = ?auto_91314 ?auto_91317 ) ) ( not ( = ?auto_91314 ?auto_91318 ) ) ( not ( = ?auto_91315 ?auto_91316 ) ) ( not ( = ?auto_91315 ?auto_91317 ) ) ( not ( = ?auto_91315 ?auto_91318 ) ) ( not ( = ?auto_91316 ?auto_91317 ) ) ( not ( = ?auto_91316 ?auto_91318 ) ) ( not ( = ?auto_91317 ?auto_91318 ) ) ( ON ?auto_91318 ?auto_91319 ) ( not ( = ?auto_91313 ?auto_91319 ) ) ( not ( = ?auto_91314 ?auto_91319 ) ) ( not ( = ?auto_91315 ?auto_91319 ) ) ( not ( = ?auto_91316 ?auto_91319 ) ) ( not ( = ?auto_91317 ?auto_91319 ) ) ( not ( = ?auto_91318 ?auto_91319 ) ) ( ON ?auto_91317 ?auto_91318 ) ( ON-TABLE ?auto_91319 ) ( ON ?auto_91316 ?auto_91317 ) ( ON ?auto_91315 ?auto_91316 ) ( CLEAR ?auto_91313 ) ( ON ?auto_91314 ?auto_91315 ) ( CLEAR ?auto_91314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91319 ?auto_91318 ?auto_91317 ?auto_91316 ?auto_91315 )
      ( MAKE-6PILE ?auto_91313 ?auto_91314 ?auto_91315 ?auto_91316 ?auto_91317 ?auto_91318 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_91320 - BLOCK
      ?auto_91321 - BLOCK
      ?auto_91322 - BLOCK
      ?auto_91323 - BLOCK
      ?auto_91324 - BLOCK
      ?auto_91325 - BLOCK
    )
    :vars
    (
      ?auto_91326 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91320 ?auto_91321 ) ) ( not ( = ?auto_91320 ?auto_91322 ) ) ( not ( = ?auto_91320 ?auto_91323 ) ) ( not ( = ?auto_91320 ?auto_91324 ) ) ( not ( = ?auto_91320 ?auto_91325 ) ) ( not ( = ?auto_91321 ?auto_91322 ) ) ( not ( = ?auto_91321 ?auto_91323 ) ) ( not ( = ?auto_91321 ?auto_91324 ) ) ( not ( = ?auto_91321 ?auto_91325 ) ) ( not ( = ?auto_91322 ?auto_91323 ) ) ( not ( = ?auto_91322 ?auto_91324 ) ) ( not ( = ?auto_91322 ?auto_91325 ) ) ( not ( = ?auto_91323 ?auto_91324 ) ) ( not ( = ?auto_91323 ?auto_91325 ) ) ( not ( = ?auto_91324 ?auto_91325 ) ) ( ON ?auto_91325 ?auto_91326 ) ( not ( = ?auto_91320 ?auto_91326 ) ) ( not ( = ?auto_91321 ?auto_91326 ) ) ( not ( = ?auto_91322 ?auto_91326 ) ) ( not ( = ?auto_91323 ?auto_91326 ) ) ( not ( = ?auto_91324 ?auto_91326 ) ) ( not ( = ?auto_91325 ?auto_91326 ) ) ( ON ?auto_91324 ?auto_91325 ) ( ON-TABLE ?auto_91326 ) ( ON ?auto_91323 ?auto_91324 ) ( ON ?auto_91322 ?auto_91323 ) ( ON ?auto_91321 ?auto_91322 ) ( CLEAR ?auto_91321 ) ( HOLDING ?auto_91320 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91320 )
      ( MAKE-6PILE ?auto_91320 ?auto_91321 ?auto_91322 ?auto_91323 ?auto_91324 ?auto_91325 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_91327 - BLOCK
      ?auto_91328 - BLOCK
      ?auto_91329 - BLOCK
      ?auto_91330 - BLOCK
      ?auto_91331 - BLOCK
      ?auto_91332 - BLOCK
    )
    :vars
    (
      ?auto_91333 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91327 ?auto_91328 ) ) ( not ( = ?auto_91327 ?auto_91329 ) ) ( not ( = ?auto_91327 ?auto_91330 ) ) ( not ( = ?auto_91327 ?auto_91331 ) ) ( not ( = ?auto_91327 ?auto_91332 ) ) ( not ( = ?auto_91328 ?auto_91329 ) ) ( not ( = ?auto_91328 ?auto_91330 ) ) ( not ( = ?auto_91328 ?auto_91331 ) ) ( not ( = ?auto_91328 ?auto_91332 ) ) ( not ( = ?auto_91329 ?auto_91330 ) ) ( not ( = ?auto_91329 ?auto_91331 ) ) ( not ( = ?auto_91329 ?auto_91332 ) ) ( not ( = ?auto_91330 ?auto_91331 ) ) ( not ( = ?auto_91330 ?auto_91332 ) ) ( not ( = ?auto_91331 ?auto_91332 ) ) ( ON ?auto_91332 ?auto_91333 ) ( not ( = ?auto_91327 ?auto_91333 ) ) ( not ( = ?auto_91328 ?auto_91333 ) ) ( not ( = ?auto_91329 ?auto_91333 ) ) ( not ( = ?auto_91330 ?auto_91333 ) ) ( not ( = ?auto_91331 ?auto_91333 ) ) ( not ( = ?auto_91332 ?auto_91333 ) ) ( ON ?auto_91331 ?auto_91332 ) ( ON-TABLE ?auto_91333 ) ( ON ?auto_91330 ?auto_91331 ) ( ON ?auto_91329 ?auto_91330 ) ( ON ?auto_91328 ?auto_91329 ) ( ON ?auto_91327 ?auto_91328 ) ( CLEAR ?auto_91327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91333 ?auto_91332 ?auto_91331 ?auto_91330 ?auto_91329 ?auto_91328 )
      ( MAKE-6PILE ?auto_91327 ?auto_91328 ?auto_91329 ?auto_91330 ?auto_91331 ?auto_91332 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_91340 - BLOCK
      ?auto_91341 - BLOCK
      ?auto_91342 - BLOCK
      ?auto_91343 - BLOCK
      ?auto_91344 - BLOCK
      ?auto_91345 - BLOCK
    )
    :vars
    (
      ?auto_91346 - BLOCK
      ?auto_91347 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91340 ?auto_91341 ) ) ( not ( = ?auto_91340 ?auto_91342 ) ) ( not ( = ?auto_91340 ?auto_91343 ) ) ( not ( = ?auto_91340 ?auto_91344 ) ) ( not ( = ?auto_91340 ?auto_91345 ) ) ( not ( = ?auto_91341 ?auto_91342 ) ) ( not ( = ?auto_91341 ?auto_91343 ) ) ( not ( = ?auto_91341 ?auto_91344 ) ) ( not ( = ?auto_91341 ?auto_91345 ) ) ( not ( = ?auto_91342 ?auto_91343 ) ) ( not ( = ?auto_91342 ?auto_91344 ) ) ( not ( = ?auto_91342 ?auto_91345 ) ) ( not ( = ?auto_91343 ?auto_91344 ) ) ( not ( = ?auto_91343 ?auto_91345 ) ) ( not ( = ?auto_91344 ?auto_91345 ) ) ( ON ?auto_91345 ?auto_91346 ) ( not ( = ?auto_91340 ?auto_91346 ) ) ( not ( = ?auto_91341 ?auto_91346 ) ) ( not ( = ?auto_91342 ?auto_91346 ) ) ( not ( = ?auto_91343 ?auto_91346 ) ) ( not ( = ?auto_91344 ?auto_91346 ) ) ( not ( = ?auto_91345 ?auto_91346 ) ) ( ON ?auto_91344 ?auto_91345 ) ( ON-TABLE ?auto_91346 ) ( ON ?auto_91343 ?auto_91344 ) ( ON ?auto_91342 ?auto_91343 ) ( ON ?auto_91341 ?auto_91342 ) ( CLEAR ?auto_91341 ) ( ON ?auto_91340 ?auto_91347 ) ( CLEAR ?auto_91340 ) ( HAND-EMPTY ) ( not ( = ?auto_91340 ?auto_91347 ) ) ( not ( = ?auto_91341 ?auto_91347 ) ) ( not ( = ?auto_91342 ?auto_91347 ) ) ( not ( = ?auto_91343 ?auto_91347 ) ) ( not ( = ?auto_91344 ?auto_91347 ) ) ( not ( = ?auto_91345 ?auto_91347 ) ) ( not ( = ?auto_91346 ?auto_91347 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91340 ?auto_91347 )
      ( MAKE-6PILE ?auto_91340 ?auto_91341 ?auto_91342 ?auto_91343 ?auto_91344 ?auto_91345 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_91348 - BLOCK
      ?auto_91349 - BLOCK
      ?auto_91350 - BLOCK
      ?auto_91351 - BLOCK
      ?auto_91352 - BLOCK
      ?auto_91353 - BLOCK
    )
    :vars
    (
      ?auto_91355 - BLOCK
      ?auto_91354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91348 ?auto_91349 ) ) ( not ( = ?auto_91348 ?auto_91350 ) ) ( not ( = ?auto_91348 ?auto_91351 ) ) ( not ( = ?auto_91348 ?auto_91352 ) ) ( not ( = ?auto_91348 ?auto_91353 ) ) ( not ( = ?auto_91349 ?auto_91350 ) ) ( not ( = ?auto_91349 ?auto_91351 ) ) ( not ( = ?auto_91349 ?auto_91352 ) ) ( not ( = ?auto_91349 ?auto_91353 ) ) ( not ( = ?auto_91350 ?auto_91351 ) ) ( not ( = ?auto_91350 ?auto_91352 ) ) ( not ( = ?auto_91350 ?auto_91353 ) ) ( not ( = ?auto_91351 ?auto_91352 ) ) ( not ( = ?auto_91351 ?auto_91353 ) ) ( not ( = ?auto_91352 ?auto_91353 ) ) ( ON ?auto_91353 ?auto_91355 ) ( not ( = ?auto_91348 ?auto_91355 ) ) ( not ( = ?auto_91349 ?auto_91355 ) ) ( not ( = ?auto_91350 ?auto_91355 ) ) ( not ( = ?auto_91351 ?auto_91355 ) ) ( not ( = ?auto_91352 ?auto_91355 ) ) ( not ( = ?auto_91353 ?auto_91355 ) ) ( ON ?auto_91352 ?auto_91353 ) ( ON-TABLE ?auto_91355 ) ( ON ?auto_91351 ?auto_91352 ) ( ON ?auto_91350 ?auto_91351 ) ( ON ?auto_91348 ?auto_91354 ) ( CLEAR ?auto_91348 ) ( not ( = ?auto_91348 ?auto_91354 ) ) ( not ( = ?auto_91349 ?auto_91354 ) ) ( not ( = ?auto_91350 ?auto_91354 ) ) ( not ( = ?auto_91351 ?auto_91354 ) ) ( not ( = ?auto_91352 ?auto_91354 ) ) ( not ( = ?auto_91353 ?auto_91354 ) ) ( not ( = ?auto_91355 ?auto_91354 ) ) ( HOLDING ?auto_91349 ) ( CLEAR ?auto_91350 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91355 ?auto_91353 ?auto_91352 ?auto_91351 ?auto_91350 ?auto_91349 )
      ( MAKE-6PILE ?auto_91348 ?auto_91349 ?auto_91350 ?auto_91351 ?auto_91352 ?auto_91353 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_91356 - BLOCK
      ?auto_91357 - BLOCK
      ?auto_91358 - BLOCK
      ?auto_91359 - BLOCK
      ?auto_91360 - BLOCK
      ?auto_91361 - BLOCK
    )
    :vars
    (
      ?auto_91363 - BLOCK
      ?auto_91362 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91356 ?auto_91357 ) ) ( not ( = ?auto_91356 ?auto_91358 ) ) ( not ( = ?auto_91356 ?auto_91359 ) ) ( not ( = ?auto_91356 ?auto_91360 ) ) ( not ( = ?auto_91356 ?auto_91361 ) ) ( not ( = ?auto_91357 ?auto_91358 ) ) ( not ( = ?auto_91357 ?auto_91359 ) ) ( not ( = ?auto_91357 ?auto_91360 ) ) ( not ( = ?auto_91357 ?auto_91361 ) ) ( not ( = ?auto_91358 ?auto_91359 ) ) ( not ( = ?auto_91358 ?auto_91360 ) ) ( not ( = ?auto_91358 ?auto_91361 ) ) ( not ( = ?auto_91359 ?auto_91360 ) ) ( not ( = ?auto_91359 ?auto_91361 ) ) ( not ( = ?auto_91360 ?auto_91361 ) ) ( ON ?auto_91361 ?auto_91363 ) ( not ( = ?auto_91356 ?auto_91363 ) ) ( not ( = ?auto_91357 ?auto_91363 ) ) ( not ( = ?auto_91358 ?auto_91363 ) ) ( not ( = ?auto_91359 ?auto_91363 ) ) ( not ( = ?auto_91360 ?auto_91363 ) ) ( not ( = ?auto_91361 ?auto_91363 ) ) ( ON ?auto_91360 ?auto_91361 ) ( ON-TABLE ?auto_91363 ) ( ON ?auto_91359 ?auto_91360 ) ( ON ?auto_91358 ?auto_91359 ) ( ON ?auto_91356 ?auto_91362 ) ( not ( = ?auto_91356 ?auto_91362 ) ) ( not ( = ?auto_91357 ?auto_91362 ) ) ( not ( = ?auto_91358 ?auto_91362 ) ) ( not ( = ?auto_91359 ?auto_91362 ) ) ( not ( = ?auto_91360 ?auto_91362 ) ) ( not ( = ?auto_91361 ?auto_91362 ) ) ( not ( = ?auto_91363 ?auto_91362 ) ) ( CLEAR ?auto_91358 ) ( ON ?auto_91357 ?auto_91356 ) ( CLEAR ?auto_91357 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91362 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91362 ?auto_91356 )
      ( MAKE-6PILE ?auto_91356 ?auto_91357 ?auto_91358 ?auto_91359 ?auto_91360 ?auto_91361 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_91364 - BLOCK
      ?auto_91365 - BLOCK
      ?auto_91366 - BLOCK
      ?auto_91367 - BLOCK
      ?auto_91368 - BLOCK
      ?auto_91369 - BLOCK
    )
    :vars
    (
      ?auto_91370 - BLOCK
      ?auto_91371 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91364 ?auto_91365 ) ) ( not ( = ?auto_91364 ?auto_91366 ) ) ( not ( = ?auto_91364 ?auto_91367 ) ) ( not ( = ?auto_91364 ?auto_91368 ) ) ( not ( = ?auto_91364 ?auto_91369 ) ) ( not ( = ?auto_91365 ?auto_91366 ) ) ( not ( = ?auto_91365 ?auto_91367 ) ) ( not ( = ?auto_91365 ?auto_91368 ) ) ( not ( = ?auto_91365 ?auto_91369 ) ) ( not ( = ?auto_91366 ?auto_91367 ) ) ( not ( = ?auto_91366 ?auto_91368 ) ) ( not ( = ?auto_91366 ?auto_91369 ) ) ( not ( = ?auto_91367 ?auto_91368 ) ) ( not ( = ?auto_91367 ?auto_91369 ) ) ( not ( = ?auto_91368 ?auto_91369 ) ) ( ON ?auto_91369 ?auto_91370 ) ( not ( = ?auto_91364 ?auto_91370 ) ) ( not ( = ?auto_91365 ?auto_91370 ) ) ( not ( = ?auto_91366 ?auto_91370 ) ) ( not ( = ?auto_91367 ?auto_91370 ) ) ( not ( = ?auto_91368 ?auto_91370 ) ) ( not ( = ?auto_91369 ?auto_91370 ) ) ( ON ?auto_91368 ?auto_91369 ) ( ON-TABLE ?auto_91370 ) ( ON ?auto_91367 ?auto_91368 ) ( ON ?auto_91364 ?auto_91371 ) ( not ( = ?auto_91364 ?auto_91371 ) ) ( not ( = ?auto_91365 ?auto_91371 ) ) ( not ( = ?auto_91366 ?auto_91371 ) ) ( not ( = ?auto_91367 ?auto_91371 ) ) ( not ( = ?auto_91368 ?auto_91371 ) ) ( not ( = ?auto_91369 ?auto_91371 ) ) ( not ( = ?auto_91370 ?auto_91371 ) ) ( ON ?auto_91365 ?auto_91364 ) ( CLEAR ?auto_91365 ) ( ON-TABLE ?auto_91371 ) ( HOLDING ?auto_91366 ) ( CLEAR ?auto_91367 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91370 ?auto_91369 ?auto_91368 ?auto_91367 ?auto_91366 )
      ( MAKE-6PILE ?auto_91364 ?auto_91365 ?auto_91366 ?auto_91367 ?auto_91368 ?auto_91369 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_91372 - BLOCK
      ?auto_91373 - BLOCK
      ?auto_91374 - BLOCK
      ?auto_91375 - BLOCK
      ?auto_91376 - BLOCK
      ?auto_91377 - BLOCK
    )
    :vars
    (
      ?auto_91379 - BLOCK
      ?auto_91378 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91372 ?auto_91373 ) ) ( not ( = ?auto_91372 ?auto_91374 ) ) ( not ( = ?auto_91372 ?auto_91375 ) ) ( not ( = ?auto_91372 ?auto_91376 ) ) ( not ( = ?auto_91372 ?auto_91377 ) ) ( not ( = ?auto_91373 ?auto_91374 ) ) ( not ( = ?auto_91373 ?auto_91375 ) ) ( not ( = ?auto_91373 ?auto_91376 ) ) ( not ( = ?auto_91373 ?auto_91377 ) ) ( not ( = ?auto_91374 ?auto_91375 ) ) ( not ( = ?auto_91374 ?auto_91376 ) ) ( not ( = ?auto_91374 ?auto_91377 ) ) ( not ( = ?auto_91375 ?auto_91376 ) ) ( not ( = ?auto_91375 ?auto_91377 ) ) ( not ( = ?auto_91376 ?auto_91377 ) ) ( ON ?auto_91377 ?auto_91379 ) ( not ( = ?auto_91372 ?auto_91379 ) ) ( not ( = ?auto_91373 ?auto_91379 ) ) ( not ( = ?auto_91374 ?auto_91379 ) ) ( not ( = ?auto_91375 ?auto_91379 ) ) ( not ( = ?auto_91376 ?auto_91379 ) ) ( not ( = ?auto_91377 ?auto_91379 ) ) ( ON ?auto_91376 ?auto_91377 ) ( ON-TABLE ?auto_91379 ) ( ON ?auto_91375 ?auto_91376 ) ( ON ?auto_91372 ?auto_91378 ) ( not ( = ?auto_91372 ?auto_91378 ) ) ( not ( = ?auto_91373 ?auto_91378 ) ) ( not ( = ?auto_91374 ?auto_91378 ) ) ( not ( = ?auto_91375 ?auto_91378 ) ) ( not ( = ?auto_91376 ?auto_91378 ) ) ( not ( = ?auto_91377 ?auto_91378 ) ) ( not ( = ?auto_91379 ?auto_91378 ) ) ( ON ?auto_91373 ?auto_91372 ) ( ON-TABLE ?auto_91378 ) ( CLEAR ?auto_91375 ) ( ON ?auto_91374 ?auto_91373 ) ( CLEAR ?auto_91374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91378 ?auto_91372 ?auto_91373 )
      ( MAKE-6PILE ?auto_91372 ?auto_91373 ?auto_91374 ?auto_91375 ?auto_91376 ?auto_91377 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_91380 - BLOCK
      ?auto_91381 - BLOCK
      ?auto_91382 - BLOCK
      ?auto_91383 - BLOCK
      ?auto_91384 - BLOCK
      ?auto_91385 - BLOCK
    )
    :vars
    (
      ?auto_91387 - BLOCK
      ?auto_91386 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91380 ?auto_91381 ) ) ( not ( = ?auto_91380 ?auto_91382 ) ) ( not ( = ?auto_91380 ?auto_91383 ) ) ( not ( = ?auto_91380 ?auto_91384 ) ) ( not ( = ?auto_91380 ?auto_91385 ) ) ( not ( = ?auto_91381 ?auto_91382 ) ) ( not ( = ?auto_91381 ?auto_91383 ) ) ( not ( = ?auto_91381 ?auto_91384 ) ) ( not ( = ?auto_91381 ?auto_91385 ) ) ( not ( = ?auto_91382 ?auto_91383 ) ) ( not ( = ?auto_91382 ?auto_91384 ) ) ( not ( = ?auto_91382 ?auto_91385 ) ) ( not ( = ?auto_91383 ?auto_91384 ) ) ( not ( = ?auto_91383 ?auto_91385 ) ) ( not ( = ?auto_91384 ?auto_91385 ) ) ( ON ?auto_91385 ?auto_91387 ) ( not ( = ?auto_91380 ?auto_91387 ) ) ( not ( = ?auto_91381 ?auto_91387 ) ) ( not ( = ?auto_91382 ?auto_91387 ) ) ( not ( = ?auto_91383 ?auto_91387 ) ) ( not ( = ?auto_91384 ?auto_91387 ) ) ( not ( = ?auto_91385 ?auto_91387 ) ) ( ON ?auto_91384 ?auto_91385 ) ( ON-TABLE ?auto_91387 ) ( ON ?auto_91380 ?auto_91386 ) ( not ( = ?auto_91380 ?auto_91386 ) ) ( not ( = ?auto_91381 ?auto_91386 ) ) ( not ( = ?auto_91382 ?auto_91386 ) ) ( not ( = ?auto_91383 ?auto_91386 ) ) ( not ( = ?auto_91384 ?auto_91386 ) ) ( not ( = ?auto_91385 ?auto_91386 ) ) ( not ( = ?auto_91387 ?auto_91386 ) ) ( ON ?auto_91381 ?auto_91380 ) ( ON-TABLE ?auto_91386 ) ( ON ?auto_91382 ?auto_91381 ) ( CLEAR ?auto_91382 ) ( HOLDING ?auto_91383 ) ( CLEAR ?auto_91384 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91387 ?auto_91385 ?auto_91384 ?auto_91383 )
      ( MAKE-6PILE ?auto_91380 ?auto_91381 ?auto_91382 ?auto_91383 ?auto_91384 ?auto_91385 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_91388 - BLOCK
      ?auto_91389 - BLOCK
      ?auto_91390 - BLOCK
      ?auto_91391 - BLOCK
      ?auto_91392 - BLOCK
      ?auto_91393 - BLOCK
    )
    :vars
    (
      ?auto_91395 - BLOCK
      ?auto_91394 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91388 ?auto_91389 ) ) ( not ( = ?auto_91388 ?auto_91390 ) ) ( not ( = ?auto_91388 ?auto_91391 ) ) ( not ( = ?auto_91388 ?auto_91392 ) ) ( not ( = ?auto_91388 ?auto_91393 ) ) ( not ( = ?auto_91389 ?auto_91390 ) ) ( not ( = ?auto_91389 ?auto_91391 ) ) ( not ( = ?auto_91389 ?auto_91392 ) ) ( not ( = ?auto_91389 ?auto_91393 ) ) ( not ( = ?auto_91390 ?auto_91391 ) ) ( not ( = ?auto_91390 ?auto_91392 ) ) ( not ( = ?auto_91390 ?auto_91393 ) ) ( not ( = ?auto_91391 ?auto_91392 ) ) ( not ( = ?auto_91391 ?auto_91393 ) ) ( not ( = ?auto_91392 ?auto_91393 ) ) ( ON ?auto_91393 ?auto_91395 ) ( not ( = ?auto_91388 ?auto_91395 ) ) ( not ( = ?auto_91389 ?auto_91395 ) ) ( not ( = ?auto_91390 ?auto_91395 ) ) ( not ( = ?auto_91391 ?auto_91395 ) ) ( not ( = ?auto_91392 ?auto_91395 ) ) ( not ( = ?auto_91393 ?auto_91395 ) ) ( ON ?auto_91392 ?auto_91393 ) ( ON-TABLE ?auto_91395 ) ( ON ?auto_91388 ?auto_91394 ) ( not ( = ?auto_91388 ?auto_91394 ) ) ( not ( = ?auto_91389 ?auto_91394 ) ) ( not ( = ?auto_91390 ?auto_91394 ) ) ( not ( = ?auto_91391 ?auto_91394 ) ) ( not ( = ?auto_91392 ?auto_91394 ) ) ( not ( = ?auto_91393 ?auto_91394 ) ) ( not ( = ?auto_91395 ?auto_91394 ) ) ( ON ?auto_91389 ?auto_91388 ) ( ON-TABLE ?auto_91394 ) ( ON ?auto_91390 ?auto_91389 ) ( CLEAR ?auto_91392 ) ( ON ?auto_91391 ?auto_91390 ) ( CLEAR ?auto_91391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91394 ?auto_91388 ?auto_91389 ?auto_91390 )
      ( MAKE-6PILE ?auto_91388 ?auto_91389 ?auto_91390 ?auto_91391 ?auto_91392 ?auto_91393 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_91396 - BLOCK
      ?auto_91397 - BLOCK
      ?auto_91398 - BLOCK
      ?auto_91399 - BLOCK
      ?auto_91400 - BLOCK
      ?auto_91401 - BLOCK
    )
    :vars
    (
      ?auto_91403 - BLOCK
      ?auto_91402 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91396 ?auto_91397 ) ) ( not ( = ?auto_91396 ?auto_91398 ) ) ( not ( = ?auto_91396 ?auto_91399 ) ) ( not ( = ?auto_91396 ?auto_91400 ) ) ( not ( = ?auto_91396 ?auto_91401 ) ) ( not ( = ?auto_91397 ?auto_91398 ) ) ( not ( = ?auto_91397 ?auto_91399 ) ) ( not ( = ?auto_91397 ?auto_91400 ) ) ( not ( = ?auto_91397 ?auto_91401 ) ) ( not ( = ?auto_91398 ?auto_91399 ) ) ( not ( = ?auto_91398 ?auto_91400 ) ) ( not ( = ?auto_91398 ?auto_91401 ) ) ( not ( = ?auto_91399 ?auto_91400 ) ) ( not ( = ?auto_91399 ?auto_91401 ) ) ( not ( = ?auto_91400 ?auto_91401 ) ) ( ON ?auto_91401 ?auto_91403 ) ( not ( = ?auto_91396 ?auto_91403 ) ) ( not ( = ?auto_91397 ?auto_91403 ) ) ( not ( = ?auto_91398 ?auto_91403 ) ) ( not ( = ?auto_91399 ?auto_91403 ) ) ( not ( = ?auto_91400 ?auto_91403 ) ) ( not ( = ?auto_91401 ?auto_91403 ) ) ( ON-TABLE ?auto_91403 ) ( ON ?auto_91396 ?auto_91402 ) ( not ( = ?auto_91396 ?auto_91402 ) ) ( not ( = ?auto_91397 ?auto_91402 ) ) ( not ( = ?auto_91398 ?auto_91402 ) ) ( not ( = ?auto_91399 ?auto_91402 ) ) ( not ( = ?auto_91400 ?auto_91402 ) ) ( not ( = ?auto_91401 ?auto_91402 ) ) ( not ( = ?auto_91403 ?auto_91402 ) ) ( ON ?auto_91397 ?auto_91396 ) ( ON-TABLE ?auto_91402 ) ( ON ?auto_91398 ?auto_91397 ) ( ON ?auto_91399 ?auto_91398 ) ( CLEAR ?auto_91399 ) ( HOLDING ?auto_91400 ) ( CLEAR ?auto_91401 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91403 ?auto_91401 ?auto_91400 )
      ( MAKE-6PILE ?auto_91396 ?auto_91397 ?auto_91398 ?auto_91399 ?auto_91400 ?auto_91401 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_91404 - BLOCK
      ?auto_91405 - BLOCK
      ?auto_91406 - BLOCK
      ?auto_91407 - BLOCK
      ?auto_91408 - BLOCK
      ?auto_91409 - BLOCK
    )
    :vars
    (
      ?auto_91410 - BLOCK
      ?auto_91411 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91404 ?auto_91405 ) ) ( not ( = ?auto_91404 ?auto_91406 ) ) ( not ( = ?auto_91404 ?auto_91407 ) ) ( not ( = ?auto_91404 ?auto_91408 ) ) ( not ( = ?auto_91404 ?auto_91409 ) ) ( not ( = ?auto_91405 ?auto_91406 ) ) ( not ( = ?auto_91405 ?auto_91407 ) ) ( not ( = ?auto_91405 ?auto_91408 ) ) ( not ( = ?auto_91405 ?auto_91409 ) ) ( not ( = ?auto_91406 ?auto_91407 ) ) ( not ( = ?auto_91406 ?auto_91408 ) ) ( not ( = ?auto_91406 ?auto_91409 ) ) ( not ( = ?auto_91407 ?auto_91408 ) ) ( not ( = ?auto_91407 ?auto_91409 ) ) ( not ( = ?auto_91408 ?auto_91409 ) ) ( ON ?auto_91409 ?auto_91410 ) ( not ( = ?auto_91404 ?auto_91410 ) ) ( not ( = ?auto_91405 ?auto_91410 ) ) ( not ( = ?auto_91406 ?auto_91410 ) ) ( not ( = ?auto_91407 ?auto_91410 ) ) ( not ( = ?auto_91408 ?auto_91410 ) ) ( not ( = ?auto_91409 ?auto_91410 ) ) ( ON-TABLE ?auto_91410 ) ( ON ?auto_91404 ?auto_91411 ) ( not ( = ?auto_91404 ?auto_91411 ) ) ( not ( = ?auto_91405 ?auto_91411 ) ) ( not ( = ?auto_91406 ?auto_91411 ) ) ( not ( = ?auto_91407 ?auto_91411 ) ) ( not ( = ?auto_91408 ?auto_91411 ) ) ( not ( = ?auto_91409 ?auto_91411 ) ) ( not ( = ?auto_91410 ?auto_91411 ) ) ( ON ?auto_91405 ?auto_91404 ) ( ON-TABLE ?auto_91411 ) ( ON ?auto_91406 ?auto_91405 ) ( ON ?auto_91407 ?auto_91406 ) ( CLEAR ?auto_91409 ) ( ON ?auto_91408 ?auto_91407 ) ( CLEAR ?auto_91408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91411 ?auto_91404 ?auto_91405 ?auto_91406 ?auto_91407 )
      ( MAKE-6PILE ?auto_91404 ?auto_91405 ?auto_91406 ?auto_91407 ?auto_91408 ?auto_91409 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_91412 - BLOCK
      ?auto_91413 - BLOCK
      ?auto_91414 - BLOCK
      ?auto_91415 - BLOCK
      ?auto_91416 - BLOCK
      ?auto_91417 - BLOCK
    )
    :vars
    (
      ?auto_91418 - BLOCK
      ?auto_91419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91412 ?auto_91413 ) ) ( not ( = ?auto_91412 ?auto_91414 ) ) ( not ( = ?auto_91412 ?auto_91415 ) ) ( not ( = ?auto_91412 ?auto_91416 ) ) ( not ( = ?auto_91412 ?auto_91417 ) ) ( not ( = ?auto_91413 ?auto_91414 ) ) ( not ( = ?auto_91413 ?auto_91415 ) ) ( not ( = ?auto_91413 ?auto_91416 ) ) ( not ( = ?auto_91413 ?auto_91417 ) ) ( not ( = ?auto_91414 ?auto_91415 ) ) ( not ( = ?auto_91414 ?auto_91416 ) ) ( not ( = ?auto_91414 ?auto_91417 ) ) ( not ( = ?auto_91415 ?auto_91416 ) ) ( not ( = ?auto_91415 ?auto_91417 ) ) ( not ( = ?auto_91416 ?auto_91417 ) ) ( not ( = ?auto_91412 ?auto_91418 ) ) ( not ( = ?auto_91413 ?auto_91418 ) ) ( not ( = ?auto_91414 ?auto_91418 ) ) ( not ( = ?auto_91415 ?auto_91418 ) ) ( not ( = ?auto_91416 ?auto_91418 ) ) ( not ( = ?auto_91417 ?auto_91418 ) ) ( ON-TABLE ?auto_91418 ) ( ON ?auto_91412 ?auto_91419 ) ( not ( = ?auto_91412 ?auto_91419 ) ) ( not ( = ?auto_91413 ?auto_91419 ) ) ( not ( = ?auto_91414 ?auto_91419 ) ) ( not ( = ?auto_91415 ?auto_91419 ) ) ( not ( = ?auto_91416 ?auto_91419 ) ) ( not ( = ?auto_91417 ?auto_91419 ) ) ( not ( = ?auto_91418 ?auto_91419 ) ) ( ON ?auto_91413 ?auto_91412 ) ( ON-TABLE ?auto_91419 ) ( ON ?auto_91414 ?auto_91413 ) ( ON ?auto_91415 ?auto_91414 ) ( ON ?auto_91416 ?auto_91415 ) ( CLEAR ?auto_91416 ) ( HOLDING ?auto_91417 ) ( CLEAR ?auto_91418 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91418 ?auto_91417 )
      ( MAKE-6PILE ?auto_91412 ?auto_91413 ?auto_91414 ?auto_91415 ?auto_91416 ?auto_91417 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_91420 - BLOCK
      ?auto_91421 - BLOCK
      ?auto_91422 - BLOCK
      ?auto_91423 - BLOCK
      ?auto_91424 - BLOCK
      ?auto_91425 - BLOCK
    )
    :vars
    (
      ?auto_91427 - BLOCK
      ?auto_91426 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91420 ?auto_91421 ) ) ( not ( = ?auto_91420 ?auto_91422 ) ) ( not ( = ?auto_91420 ?auto_91423 ) ) ( not ( = ?auto_91420 ?auto_91424 ) ) ( not ( = ?auto_91420 ?auto_91425 ) ) ( not ( = ?auto_91421 ?auto_91422 ) ) ( not ( = ?auto_91421 ?auto_91423 ) ) ( not ( = ?auto_91421 ?auto_91424 ) ) ( not ( = ?auto_91421 ?auto_91425 ) ) ( not ( = ?auto_91422 ?auto_91423 ) ) ( not ( = ?auto_91422 ?auto_91424 ) ) ( not ( = ?auto_91422 ?auto_91425 ) ) ( not ( = ?auto_91423 ?auto_91424 ) ) ( not ( = ?auto_91423 ?auto_91425 ) ) ( not ( = ?auto_91424 ?auto_91425 ) ) ( not ( = ?auto_91420 ?auto_91427 ) ) ( not ( = ?auto_91421 ?auto_91427 ) ) ( not ( = ?auto_91422 ?auto_91427 ) ) ( not ( = ?auto_91423 ?auto_91427 ) ) ( not ( = ?auto_91424 ?auto_91427 ) ) ( not ( = ?auto_91425 ?auto_91427 ) ) ( ON-TABLE ?auto_91427 ) ( ON ?auto_91420 ?auto_91426 ) ( not ( = ?auto_91420 ?auto_91426 ) ) ( not ( = ?auto_91421 ?auto_91426 ) ) ( not ( = ?auto_91422 ?auto_91426 ) ) ( not ( = ?auto_91423 ?auto_91426 ) ) ( not ( = ?auto_91424 ?auto_91426 ) ) ( not ( = ?auto_91425 ?auto_91426 ) ) ( not ( = ?auto_91427 ?auto_91426 ) ) ( ON ?auto_91421 ?auto_91420 ) ( ON-TABLE ?auto_91426 ) ( ON ?auto_91422 ?auto_91421 ) ( ON ?auto_91423 ?auto_91422 ) ( ON ?auto_91424 ?auto_91423 ) ( CLEAR ?auto_91427 ) ( ON ?auto_91425 ?auto_91424 ) ( CLEAR ?auto_91425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91426 ?auto_91420 ?auto_91421 ?auto_91422 ?auto_91423 ?auto_91424 )
      ( MAKE-6PILE ?auto_91420 ?auto_91421 ?auto_91422 ?auto_91423 ?auto_91424 ?auto_91425 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_91428 - BLOCK
      ?auto_91429 - BLOCK
      ?auto_91430 - BLOCK
      ?auto_91431 - BLOCK
      ?auto_91432 - BLOCK
      ?auto_91433 - BLOCK
    )
    :vars
    (
      ?auto_91434 - BLOCK
      ?auto_91435 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91428 ?auto_91429 ) ) ( not ( = ?auto_91428 ?auto_91430 ) ) ( not ( = ?auto_91428 ?auto_91431 ) ) ( not ( = ?auto_91428 ?auto_91432 ) ) ( not ( = ?auto_91428 ?auto_91433 ) ) ( not ( = ?auto_91429 ?auto_91430 ) ) ( not ( = ?auto_91429 ?auto_91431 ) ) ( not ( = ?auto_91429 ?auto_91432 ) ) ( not ( = ?auto_91429 ?auto_91433 ) ) ( not ( = ?auto_91430 ?auto_91431 ) ) ( not ( = ?auto_91430 ?auto_91432 ) ) ( not ( = ?auto_91430 ?auto_91433 ) ) ( not ( = ?auto_91431 ?auto_91432 ) ) ( not ( = ?auto_91431 ?auto_91433 ) ) ( not ( = ?auto_91432 ?auto_91433 ) ) ( not ( = ?auto_91428 ?auto_91434 ) ) ( not ( = ?auto_91429 ?auto_91434 ) ) ( not ( = ?auto_91430 ?auto_91434 ) ) ( not ( = ?auto_91431 ?auto_91434 ) ) ( not ( = ?auto_91432 ?auto_91434 ) ) ( not ( = ?auto_91433 ?auto_91434 ) ) ( ON ?auto_91428 ?auto_91435 ) ( not ( = ?auto_91428 ?auto_91435 ) ) ( not ( = ?auto_91429 ?auto_91435 ) ) ( not ( = ?auto_91430 ?auto_91435 ) ) ( not ( = ?auto_91431 ?auto_91435 ) ) ( not ( = ?auto_91432 ?auto_91435 ) ) ( not ( = ?auto_91433 ?auto_91435 ) ) ( not ( = ?auto_91434 ?auto_91435 ) ) ( ON ?auto_91429 ?auto_91428 ) ( ON-TABLE ?auto_91435 ) ( ON ?auto_91430 ?auto_91429 ) ( ON ?auto_91431 ?auto_91430 ) ( ON ?auto_91432 ?auto_91431 ) ( ON ?auto_91433 ?auto_91432 ) ( CLEAR ?auto_91433 ) ( HOLDING ?auto_91434 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91434 )
      ( MAKE-6PILE ?auto_91428 ?auto_91429 ?auto_91430 ?auto_91431 ?auto_91432 ?auto_91433 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_91436 - BLOCK
      ?auto_91437 - BLOCK
      ?auto_91438 - BLOCK
      ?auto_91439 - BLOCK
      ?auto_91440 - BLOCK
      ?auto_91441 - BLOCK
    )
    :vars
    (
      ?auto_91443 - BLOCK
      ?auto_91442 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91436 ?auto_91437 ) ) ( not ( = ?auto_91436 ?auto_91438 ) ) ( not ( = ?auto_91436 ?auto_91439 ) ) ( not ( = ?auto_91436 ?auto_91440 ) ) ( not ( = ?auto_91436 ?auto_91441 ) ) ( not ( = ?auto_91437 ?auto_91438 ) ) ( not ( = ?auto_91437 ?auto_91439 ) ) ( not ( = ?auto_91437 ?auto_91440 ) ) ( not ( = ?auto_91437 ?auto_91441 ) ) ( not ( = ?auto_91438 ?auto_91439 ) ) ( not ( = ?auto_91438 ?auto_91440 ) ) ( not ( = ?auto_91438 ?auto_91441 ) ) ( not ( = ?auto_91439 ?auto_91440 ) ) ( not ( = ?auto_91439 ?auto_91441 ) ) ( not ( = ?auto_91440 ?auto_91441 ) ) ( not ( = ?auto_91436 ?auto_91443 ) ) ( not ( = ?auto_91437 ?auto_91443 ) ) ( not ( = ?auto_91438 ?auto_91443 ) ) ( not ( = ?auto_91439 ?auto_91443 ) ) ( not ( = ?auto_91440 ?auto_91443 ) ) ( not ( = ?auto_91441 ?auto_91443 ) ) ( ON ?auto_91436 ?auto_91442 ) ( not ( = ?auto_91436 ?auto_91442 ) ) ( not ( = ?auto_91437 ?auto_91442 ) ) ( not ( = ?auto_91438 ?auto_91442 ) ) ( not ( = ?auto_91439 ?auto_91442 ) ) ( not ( = ?auto_91440 ?auto_91442 ) ) ( not ( = ?auto_91441 ?auto_91442 ) ) ( not ( = ?auto_91443 ?auto_91442 ) ) ( ON ?auto_91437 ?auto_91436 ) ( ON-TABLE ?auto_91442 ) ( ON ?auto_91438 ?auto_91437 ) ( ON ?auto_91439 ?auto_91438 ) ( ON ?auto_91440 ?auto_91439 ) ( ON ?auto_91441 ?auto_91440 ) ( ON ?auto_91443 ?auto_91441 ) ( CLEAR ?auto_91443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_91442 ?auto_91436 ?auto_91437 ?auto_91438 ?auto_91439 ?auto_91440 ?auto_91441 )
      ( MAKE-6PILE ?auto_91436 ?auto_91437 ?auto_91438 ?auto_91439 ?auto_91440 ?auto_91441 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_91458 - BLOCK
      ?auto_91459 - BLOCK
      ?auto_91460 - BLOCK
      ?auto_91461 - BLOCK
      ?auto_91462 - BLOCK
      ?auto_91463 - BLOCK
      ?auto_91464 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_91463 ) ( ON-TABLE ?auto_91458 ) ( ON ?auto_91459 ?auto_91458 ) ( ON ?auto_91460 ?auto_91459 ) ( ON ?auto_91461 ?auto_91460 ) ( ON ?auto_91462 ?auto_91461 ) ( ON ?auto_91463 ?auto_91462 ) ( not ( = ?auto_91458 ?auto_91459 ) ) ( not ( = ?auto_91458 ?auto_91460 ) ) ( not ( = ?auto_91458 ?auto_91461 ) ) ( not ( = ?auto_91458 ?auto_91462 ) ) ( not ( = ?auto_91458 ?auto_91463 ) ) ( not ( = ?auto_91458 ?auto_91464 ) ) ( not ( = ?auto_91459 ?auto_91460 ) ) ( not ( = ?auto_91459 ?auto_91461 ) ) ( not ( = ?auto_91459 ?auto_91462 ) ) ( not ( = ?auto_91459 ?auto_91463 ) ) ( not ( = ?auto_91459 ?auto_91464 ) ) ( not ( = ?auto_91460 ?auto_91461 ) ) ( not ( = ?auto_91460 ?auto_91462 ) ) ( not ( = ?auto_91460 ?auto_91463 ) ) ( not ( = ?auto_91460 ?auto_91464 ) ) ( not ( = ?auto_91461 ?auto_91462 ) ) ( not ( = ?auto_91461 ?auto_91463 ) ) ( not ( = ?auto_91461 ?auto_91464 ) ) ( not ( = ?auto_91462 ?auto_91463 ) ) ( not ( = ?auto_91462 ?auto_91464 ) ) ( not ( = ?auto_91463 ?auto_91464 ) ) ( ON-TABLE ?auto_91464 ) ( CLEAR ?auto_91464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_91464 )
      ( MAKE-7PILE ?auto_91458 ?auto_91459 ?auto_91460 ?auto_91461 ?auto_91462 ?auto_91463 ?auto_91464 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_91465 - BLOCK
      ?auto_91466 - BLOCK
      ?auto_91467 - BLOCK
      ?auto_91468 - BLOCK
      ?auto_91469 - BLOCK
      ?auto_91470 - BLOCK
      ?auto_91471 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91465 ) ( ON ?auto_91466 ?auto_91465 ) ( ON ?auto_91467 ?auto_91466 ) ( ON ?auto_91468 ?auto_91467 ) ( ON ?auto_91469 ?auto_91468 ) ( not ( = ?auto_91465 ?auto_91466 ) ) ( not ( = ?auto_91465 ?auto_91467 ) ) ( not ( = ?auto_91465 ?auto_91468 ) ) ( not ( = ?auto_91465 ?auto_91469 ) ) ( not ( = ?auto_91465 ?auto_91470 ) ) ( not ( = ?auto_91465 ?auto_91471 ) ) ( not ( = ?auto_91466 ?auto_91467 ) ) ( not ( = ?auto_91466 ?auto_91468 ) ) ( not ( = ?auto_91466 ?auto_91469 ) ) ( not ( = ?auto_91466 ?auto_91470 ) ) ( not ( = ?auto_91466 ?auto_91471 ) ) ( not ( = ?auto_91467 ?auto_91468 ) ) ( not ( = ?auto_91467 ?auto_91469 ) ) ( not ( = ?auto_91467 ?auto_91470 ) ) ( not ( = ?auto_91467 ?auto_91471 ) ) ( not ( = ?auto_91468 ?auto_91469 ) ) ( not ( = ?auto_91468 ?auto_91470 ) ) ( not ( = ?auto_91468 ?auto_91471 ) ) ( not ( = ?auto_91469 ?auto_91470 ) ) ( not ( = ?auto_91469 ?auto_91471 ) ) ( not ( = ?auto_91470 ?auto_91471 ) ) ( ON-TABLE ?auto_91471 ) ( CLEAR ?auto_91471 ) ( HOLDING ?auto_91470 ) ( CLEAR ?auto_91469 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91465 ?auto_91466 ?auto_91467 ?auto_91468 ?auto_91469 ?auto_91470 )
      ( MAKE-7PILE ?auto_91465 ?auto_91466 ?auto_91467 ?auto_91468 ?auto_91469 ?auto_91470 ?auto_91471 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_91472 - BLOCK
      ?auto_91473 - BLOCK
      ?auto_91474 - BLOCK
      ?auto_91475 - BLOCK
      ?auto_91476 - BLOCK
      ?auto_91477 - BLOCK
      ?auto_91478 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91472 ) ( ON ?auto_91473 ?auto_91472 ) ( ON ?auto_91474 ?auto_91473 ) ( ON ?auto_91475 ?auto_91474 ) ( ON ?auto_91476 ?auto_91475 ) ( not ( = ?auto_91472 ?auto_91473 ) ) ( not ( = ?auto_91472 ?auto_91474 ) ) ( not ( = ?auto_91472 ?auto_91475 ) ) ( not ( = ?auto_91472 ?auto_91476 ) ) ( not ( = ?auto_91472 ?auto_91477 ) ) ( not ( = ?auto_91472 ?auto_91478 ) ) ( not ( = ?auto_91473 ?auto_91474 ) ) ( not ( = ?auto_91473 ?auto_91475 ) ) ( not ( = ?auto_91473 ?auto_91476 ) ) ( not ( = ?auto_91473 ?auto_91477 ) ) ( not ( = ?auto_91473 ?auto_91478 ) ) ( not ( = ?auto_91474 ?auto_91475 ) ) ( not ( = ?auto_91474 ?auto_91476 ) ) ( not ( = ?auto_91474 ?auto_91477 ) ) ( not ( = ?auto_91474 ?auto_91478 ) ) ( not ( = ?auto_91475 ?auto_91476 ) ) ( not ( = ?auto_91475 ?auto_91477 ) ) ( not ( = ?auto_91475 ?auto_91478 ) ) ( not ( = ?auto_91476 ?auto_91477 ) ) ( not ( = ?auto_91476 ?auto_91478 ) ) ( not ( = ?auto_91477 ?auto_91478 ) ) ( ON-TABLE ?auto_91478 ) ( CLEAR ?auto_91476 ) ( ON ?auto_91477 ?auto_91478 ) ( CLEAR ?auto_91477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91478 )
      ( MAKE-7PILE ?auto_91472 ?auto_91473 ?auto_91474 ?auto_91475 ?auto_91476 ?auto_91477 ?auto_91478 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_91479 - BLOCK
      ?auto_91480 - BLOCK
      ?auto_91481 - BLOCK
      ?auto_91482 - BLOCK
      ?auto_91483 - BLOCK
      ?auto_91484 - BLOCK
      ?auto_91485 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91479 ) ( ON ?auto_91480 ?auto_91479 ) ( ON ?auto_91481 ?auto_91480 ) ( ON ?auto_91482 ?auto_91481 ) ( not ( = ?auto_91479 ?auto_91480 ) ) ( not ( = ?auto_91479 ?auto_91481 ) ) ( not ( = ?auto_91479 ?auto_91482 ) ) ( not ( = ?auto_91479 ?auto_91483 ) ) ( not ( = ?auto_91479 ?auto_91484 ) ) ( not ( = ?auto_91479 ?auto_91485 ) ) ( not ( = ?auto_91480 ?auto_91481 ) ) ( not ( = ?auto_91480 ?auto_91482 ) ) ( not ( = ?auto_91480 ?auto_91483 ) ) ( not ( = ?auto_91480 ?auto_91484 ) ) ( not ( = ?auto_91480 ?auto_91485 ) ) ( not ( = ?auto_91481 ?auto_91482 ) ) ( not ( = ?auto_91481 ?auto_91483 ) ) ( not ( = ?auto_91481 ?auto_91484 ) ) ( not ( = ?auto_91481 ?auto_91485 ) ) ( not ( = ?auto_91482 ?auto_91483 ) ) ( not ( = ?auto_91482 ?auto_91484 ) ) ( not ( = ?auto_91482 ?auto_91485 ) ) ( not ( = ?auto_91483 ?auto_91484 ) ) ( not ( = ?auto_91483 ?auto_91485 ) ) ( not ( = ?auto_91484 ?auto_91485 ) ) ( ON-TABLE ?auto_91485 ) ( ON ?auto_91484 ?auto_91485 ) ( CLEAR ?auto_91484 ) ( HOLDING ?auto_91483 ) ( CLEAR ?auto_91482 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91479 ?auto_91480 ?auto_91481 ?auto_91482 ?auto_91483 )
      ( MAKE-7PILE ?auto_91479 ?auto_91480 ?auto_91481 ?auto_91482 ?auto_91483 ?auto_91484 ?auto_91485 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_91486 - BLOCK
      ?auto_91487 - BLOCK
      ?auto_91488 - BLOCK
      ?auto_91489 - BLOCK
      ?auto_91490 - BLOCK
      ?auto_91491 - BLOCK
      ?auto_91492 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91486 ) ( ON ?auto_91487 ?auto_91486 ) ( ON ?auto_91488 ?auto_91487 ) ( ON ?auto_91489 ?auto_91488 ) ( not ( = ?auto_91486 ?auto_91487 ) ) ( not ( = ?auto_91486 ?auto_91488 ) ) ( not ( = ?auto_91486 ?auto_91489 ) ) ( not ( = ?auto_91486 ?auto_91490 ) ) ( not ( = ?auto_91486 ?auto_91491 ) ) ( not ( = ?auto_91486 ?auto_91492 ) ) ( not ( = ?auto_91487 ?auto_91488 ) ) ( not ( = ?auto_91487 ?auto_91489 ) ) ( not ( = ?auto_91487 ?auto_91490 ) ) ( not ( = ?auto_91487 ?auto_91491 ) ) ( not ( = ?auto_91487 ?auto_91492 ) ) ( not ( = ?auto_91488 ?auto_91489 ) ) ( not ( = ?auto_91488 ?auto_91490 ) ) ( not ( = ?auto_91488 ?auto_91491 ) ) ( not ( = ?auto_91488 ?auto_91492 ) ) ( not ( = ?auto_91489 ?auto_91490 ) ) ( not ( = ?auto_91489 ?auto_91491 ) ) ( not ( = ?auto_91489 ?auto_91492 ) ) ( not ( = ?auto_91490 ?auto_91491 ) ) ( not ( = ?auto_91490 ?auto_91492 ) ) ( not ( = ?auto_91491 ?auto_91492 ) ) ( ON-TABLE ?auto_91492 ) ( ON ?auto_91491 ?auto_91492 ) ( CLEAR ?auto_91489 ) ( ON ?auto_91490 ?auto_91491 ) ( CLEAR ?auto_91490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91492 ?auto_91491 )
      ( MAKE-7PILE ?auto_91486 ?auto_91487 ?auto_91488 ?auto_91489 ?auto_91490 ?auto_91491 ?auto_91492 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_91493 - BLOCK
      ?auto_91494 - BLOCK
      ?auto_91495 - BLOCK
      ?auto_91496 - BLOCK
      ?auto_91497 - BLOCK
      ?auto_91498 - BLOCK
      ?auto_91499 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91493 ) ( ON ?auto_91494 ?auto_91493 ) ( ON ?auto_91495 ?auto_91494 ) ( not ( = ?auto_91493 ?auto_91494 ) ) ( not ( = ?auto_91493 ?auto_91495 ) ) ( not ( = ?auto_91493 ?auto_91496 ) ) ( not ( = ?auto_91493 ?auto_91497 ) ) ( not ( = ?auto_91493 ?auto_91498 ) ) ( not ( = ?auto_91493 ?auto_91499 ) ) ( not ( = ?auto_91494 ?auto_91495 ) ) ( not ( = ?auto_91494 ?auto_91496 ) ) ( not ( = ?auto_91494 ?auto_91497 ) ) ( not ( = ?auto_91494 ?auto_91498 ) ) ( not ( = ?auto_91494 ?auto_91499 ) ) ( not ( = ?auto_91495 ?auto_91496 ) ) ( not ( = ?auto_91495 ?auto_91497 ) ) ( not ( = ?auto_91495 ?auto_91498 ) ) ( not ( = ?auto_91495 ?auto_91499 ) ) ( not ( = ?auto_91496 ?auto_91497 ) ) ( not ( = ?auto_91496 ?auto_91498 ) ) ( not ( = ?auto_91496 ?auto_91499 ) ) ( not ( = ?auto_91497 ?auto_91498 ) ) ( not ( = ?auto_91497 ?auto_91499 ) ) ( not ( = ?auto_91498 ?auto_91499 ) ) ( ON-TABLE ?auto_91499 ) ( ON ?auto_91498 ?auto_91499 ) ( ON ?auto_91497 ?auto_91498 ) ( CLEAR ?auto_91497 ) ( HOLDING ?auto_91496 ) ( CLEAR ?auto_91495 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91493 ?auto_91494 ?auto_91495 ?auto_91496 )
      ( MAKE-7PILE ?auto_91493 ?auto_91494 ?auto_91495 ?auto_91496 ?auto_91497 ?auto_91498 ?auto_91499 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_91500 - BLOCK
      ?auto_91501 - BLOCK
      ?auto_91502 - BLOCK
      ?auto_91503 - BLOCK
      ?auto_91504 - BLOCK
      ?auto_91505 - BLOCK
      ?auto_91506 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91500 ) ( ON ?auto_91501 ?auto_91500 ) ( ON ?auto_91502 ?auto_91501 ) ( not ( = ?auto_91500 ?auto_91501 ) ) ( not ( = ?auto_91500 ?auto_91502 ) ) ( not ( = ?auto_91500 ?auto_91503 ) ) ( not ( = ?auto_91500 ?auto_91504 ) ) ( not ( = ?auto_91500 ?auto_91505 ) ) ( not ( = ?auto_91500 ?auto_91506 ) ) ( not ( = ?auto_91501 ?auto_91502 ) ) ( not ( = ?auto_91501 ?auto_91503 ) ) ( not ( = ?auto_91501 ?auto_91504 ) ) ( not ( = ?auto_91501 ?auto_91505 ) ) ( not ( = ?auto_91501 ?auto_91506 ) ) ( not ( = ?auto_91502 ?auto_91503 ) ) ( not ( = ?auto_91502 ?auto_91504 ) ) ( not ( = ?auto_91502 ?auto_91505 ) ) ( not ( = ?auto_91502 ?auto_91506 ) ) ( not ( = ?auto_91503 ?auto_91504 ) ) ( not ( = ?auto_91503 ?auto_91505 ) ) ( not ( = ?auto_91503 ?auto_91506 ) ) ( not ( = ?auto_91504 ?auto_91505 ) ) ( not ( = ?auto_91504 ?auto_91506 ) ) ( not ( = ?auto_91505 ?auto_91506 ) ) ( ON-TABLE ?auto_91506 ) ( ON ?auto_91505 ?auto_91506 ) ( ON ?auto_91504 ?auto_91505 ) ( CLEAR ?auto_91502 ) ( ON ?auto_91503 ?auto_91504 ) ( CLEAR ?auto_91503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91506 ?auto_91505 ?auto_91504 )
      ( MAKE-7PILE ?auto_91500 ?auto_91501 ?auto_91502 ?auto_91503 ?auto_91504 ?auto_91505 ?auto_91506 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_91507 - BLOCK
      ?auto_91508 - BLOCK
      ?auto_91509 - BLOCK
      ?auto_91510 - BLOCK
      ?auto_91511 - BLOCK
      ?auto_91512 - BLOCK
      ?auto_91513 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91507 ) ( ON ?auto_91508 ?auto_91507 ) ( not ( = ?auto_91507 ?auto_91508 ) ) ( not ( = ?auto_91507 ?auto_91509 ) ) ( not ( = ?auto_91507 ?auto_91510 ) ) ( not ( = ?auto_91507 ?auto_91511 ) ) ( not ( = ?auto_91507 ?auto_91512 ) ) ( not ( = ?auto_91507 ?auto_91513 ) ) ( not ( = ?auto_91508 ?auto_91509 ) ) ( not ( = ?auto_91508 ?auto_91510 ) ) ( not ( = ?auto_91508 ?auto_91511 ) ) ( not ( = ?auto_91508 ?auto_91512 ) ) ( not ( = ?auto_91508 ?auto_91513 ) ) ( not ( = ?auto_91509 ?auto_91510 ) ) ( not ( = ?auto_91509 ?auto_91511 ) ) ( not ( = ?auto_91509 ?auto_91512 ) ) ( not ( = ?auto_91509 ?auto_91513 ) ) ( not ( = ?auto_91510 ?auto_91511 ) ) ( not ( = ?auto_91510 ?auto_91512 ) ) ( not ( = ?auto_91510 ?auto_91513 ) ) ( not ( = ?auto_91511 ?auto_91512 ) ) ( not ( = ?auto_91511 ?auto_91513 ) ) ( not ( = ?auto_91512 ?auto_91513 ) ) ( ON-TABLE ?auto_91513 ) ( ON ?auto_91512 ?auto_91513 ) ( ON ?auto_91511 ?auto_91512 ) ( ON ?auto_91510 ?auto_91511 ) ( CLEAR ?auto_91510 ) ( HOLDING ?auto_91509 ) ( CLEAR ?auto_91508 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91507 ?auto_91508 ?auto_91509 )
      ( MAKE-7PILE ?auto_91507 ?auto_91508 ?auto_91509 ?auto_91510 ?auto_91511 ?auto_91512 ?auto_91513 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_91514 - BLOCK
      ?auto_91515 - BLOCK
      ?auto_91516 - BLOCK
      ?auto_91517 - BLOCK
      ?auto_91518 - BLOCK
      ?auto_91519 - BLOCK
      ?auto_91520 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91514 ) ( ON ?auto_91515 ?auto_91514 ) ( not ( = ?auto_91514 ?auto_91515 ) ) ( not ( = ?auto_91514 ?auto_91516 ) ) ( not ( = ?auto_91514 ?auto_91517 ) ) ( not ( = ?auto_91514 ?auto_91518 ) ) ( not ( = ?auto_91514 ?auto_91519 ) ) ( not ( = ?auto_91514 ?auto_91520 ) ) ( not ( = ?auto_91515 ?auto_91516 ) ) ( not ( = ?auto_91515 ?auto_91517 ) ) ( not ( = ?auto_91515 ?auto_91518 ) ) ( not ( = ?auto_91515 ?auto_91519 ) ) ( not ( = ?auto_91515 ?auto_91520 ) ) ( not ( = ?auto_91516 ?auto_91517 ) ) ( not ( = ?auto_91516 ?auto_91518 ) ) ( not ( = ?auto_91516 ?auto_91519 ) ) ( not ( = ?auto_91516 ?auto_91520 ) ) ( not ( = ?auto_91517 ?auto_91518 ) ) ( not ( = ?auto_91517 ?auto_91519 ) ) ( not ( = ?auto_91517 ?auto_91520 ) ) ( not ( = ?auto_91518 ?auto_91519 ) ) ( not ( = ?auto_91518 ?auto_91520 ) ) ( not ( = ?auto_91519 ?auto_91520 ) ) ( ON-TABLE ?auto_91520 ) ( ON ?auto_91519 ?auto_91520 ) ( ON ?auto_91518 ?auto_91519 ) ( ON ?auto_91517 ?auto_91518 ) ( CLEAR ?auto_91515 ) ( ON ?auto_91516 ?auto_91517 ) ( CLEAR ?auto_91516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91520 ?auto_91519 ?auto_91518 ?auto_91517 )
      ( MAKE-7PILE ?auto_91514 ?auto_91515 ?auto_91516 ?auto_91517 ?auto_91518 ?auto_91519 ?auto_91520 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_91521 - BLOCK
      ?auto_91522 - BLOCK
      ?auto_91523 - BLOCK
      ?auto_91524 - BLOCK
      ?auto_91525 - BLOCK
      ?auto_91526 - BLOCK
      ?auto_91527 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91521 ) ( not ( = ?auto_91521 ?auto_91522 ) ) ( not ( = ?auto_91521 ?auto_91523 ) ) ( not ( = ?auto_91521 ?auto_91524 ) ) ( not ( = ?auto_91521 ?auto_91525 ) ) ( not ( = ?auto_91521 ?auto_91526 ) ) ( not ( = ?auto_91521 ?auto_91527 ) ) ( not ( = ?auto_91522 ?auto_91523 ) ) ( not ( = ?auto_91522 ?auto_91524 ) ) ( not ( = ?auto_91522 ?auto_91525 ) ) ( not ( = ?auto_91522 ?auto_91526 ) ) ( not ( = ?auto_91522 ?auto_91527 ) ) ( not ( = ?auto_91523 ?auto_91524 ) ) ( not ( = ?auto_91523 ?auto_91525 ) ) ( not ( = ?auto_91523 ?auto_91526 ) ) ( not ( = ?auto_91523 ?auto_91527 ) ) ( not ( = ?auto_91524 ?auto_91525 ) ) ( not ( = ?auto_91524 ?auto_91526 ) ) ( not ( = ?auto_91524 ?auto_91527 ) ) ( not ( = ?auto_91525 ?auto_91526 ) ) ( not ( = ?auto_91525 ?auto_91527 ) ) ( not ( = ?auto_91526 ?auto_91527 ) ) ( ON-TABLE ?auto_91527 ) ( ON ?auto_91526 ?auto_91527 ) ( ON ?auto_91525 ?auto_91526 ) ( ON ?auto_91524 ?auto_91525 ) ( ON ?auto_91523 ?auto_91524 ) ( CLEAR ?auto_91523 ) ( HOLDING ?auto_91522 ) ( CLEAR ?auto_91521 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91521 ?auto_91522 )
      ( MAKE-7PILE ?auto_91521 ?auto_91522 ?auto_91523 ?auto_91524 ?auto_91525 ?auto_91526 ?auto_91527 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_91528 - BLOCK
      ?auto_91529 - BLOCK
      ?auto_91530 - BLOCK
      ?auto_91531 - BLOCK
      ?auto_91532 - BLOCK
      ?auto_91533 - BLOCK
      ?auto_91534 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91528 ) ( not ( = ?auto_91528 ?auto_91529 ) ) ( not ( = ?auto_91528 ?auto_91530 ) ) ( not ( = ?auto_91528 ?auto_91531 ) ) ( not ( = ?auto_91528 ?auto_91532 ) ) ( not ( = ?auto_91528 ?auto_91533 ) ) ( not ( = ?auto_91528 ?auto_91534 ) ) ( not ( = ?auto_91529 ?auto_91530 ) ) ( not ( = ?auto_91529 ?auto_91531 ) ) ( not ( = ?auto_91529 ?auto_91532 ) ) ( not ( = ?auto_91529 ?auto_91533 ) ) ( not ( = ?auto_91529 ?auto_91534 ) ) ( not ( = ?auto_91530 ?auto_91531 ) ) ( not ( = ?auto_91530 ?auto_91532 ) ) ( not ( = ?auto_91530 ?auto_91533 ) ) ( not ( = ?auto_91530 ?auto_91534 ) ) ( not ( = ?auto_91531 ?auto_91532 ) ) ( not ( = ?auto_91531 ?auto_91533 ) ) ( not ( = ?auto_91531 ?auto_91534 ) ) ( not ( = ?auto_91532 ?auto_91533 ) ) ( not ( = ?auto_91532 ?auto_91534 ) ) ( not ( = ?auto_91533 ?auto_91534 ) ) ( ON-TABLE ?auto_91534 ) ( ON ?auto_91533 ?auto_91534 ) ( ON ?auto_91532 ?auto_91533 ) ( ON ?auto_91531 ?auto_91532 ) ( ON ?auto_91530 ?auto_91531 ) ( CLEAR ?auto_91528 ) ( ON ?auto_91529 ?auto_91530 ) ( CLEAR ?auto_91529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91534 ?auto_91533 ?auto_91532 ?auto_91531 ?auto_91530 )
      ( MAKE-7PILE ?auto_91528 ?auto_91529 ?auto_91530 ?auto_91531 ?auto_91532 ?auto_91533 ?auto_91534 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_91535 - BLOCK
      ?auto_91536 - BLOCK
      ?auto_91537 - BLOCK
      ?auto_91538 - BLOCK
      ?auto_91539 - BLOCK
      ?auto_91540 - BLOCK
      ?auto_91541 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91535 ?auto_91536 ) ) ( not ( = ?auto_91535 ?auto_91537 ) ) ( not ( = ?auto_91535 ?auto_91538 ) ) ( not ( = ?auto_91535 ?auto_91539 ) ) ( not ( = ?auto_91535 ?auto_91540 ) ) ( not ( = ?auto_91535 ?auto_91541 ) ) ( not ( = ?auto_91536 ?auto_91537 ) ) ( not ( = ?auto_91536 ?auto_91538 ) ) ( not ( = ?auto_91536 ?auto_91539 ) ) ( not ( = ?auto_91536 ?auto_91540 ) ) ( not ( = ?auto_91536 ?auto_91541 ) ) ( not ( = ?auto_91537 ?auto_91538 ) ) ( not ( = ?auto_91537 ?auto_91539 ) ) ( not ( = ?auto_91537 ?auto_91540 ) ) ( not ( = ?auto_91537 ?auto_91541 ) ) ( not ( = ?auto_91538 ?auto_91539 ) ) ( not ( = ?auto_91538 ?auto_91540 ) ) ( not ( = ?auto_91538 ?auto_91541 ) ) ( not ( = ?auto_91539 ?auto_91540 ) ) ( not ( = ?auto_91539 ?auto_91541 ) ) ( not ( = ?auto_91540 ?auto_91541 ) ) ( ON-TABLE ?auto_91541 ) ( ON ?auto_91540 ?auto_91541 ) ( ON ?auto_91539 ?auto_91540 ) ( ON ?auto_91538 ?auto_91539 ) ( ON ?auto_91537 ?auto_91538 ) ( ON ?auto_91536 ?auto_91537 ) ( CLEAR ?auto_91536 ) ( HOLDING ?auto_91535 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91535 )
      ( MAKE-7PILE ?auto_91535 ?auto_91536 ?auto_91537 ?auto_91538 ?auto_91539 ?auto_91540 ?auto_91541 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_91542 - BLOCK
      ?auto_91543 - BLOCK
      ?auto_91544 - BLOCK
      ?auto_91545 - BLOCK
      ?auto_91546 - BLOCK
      ?auto_91547 - BLOCK
      ?auto_91548 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91542 ?auto_91543 ) ) ( not ( = ?auto_91542 ?auto_91544 ) ) ( not ( = ?auto_91542 ?auto_91545 ) ) ( not ( = ?auto_91542 ?auto_91546 ) ) ( not ( = ?auto_91542 ?auto_91547 ) ) ( not ( = ?auto_91542 ?auto_91548 ) ) ( not ( = ?auto_91543 ?auto_91544 ) ) ( not ( = ?auto_91543 ?auto_91545 ) ) ( not ( = ?auto_91543 ?auto_91546 ) ) ( not ( = ?auto_91543 ?auto_91547 ) ) ( not ( = ?auto_91543 ?auto_91548 ) ) ( not ( = ?auto_91544 ?auto_91545 ) ) ( not ( = ?auto_91544 ?auto_91546 ) ) ( not ( = ?auto_91544 ?auto_91547 ) ) ( not ( = ?auto_91544 ?auto_91548 ) ) ( not ( = ?auto_91545 ?auto_91546 ) ) ( not ( = ?auto_91545 ?auto_91547 ) ) ( not ( = ?auto_91545 ?auto_91548 ) ) ( not ( = ?auto_91546 ?auto_91547 ) ) ( not ( = ?auto_91546 ?auto_91548 ) ) ( not ( = ?auto_91547 ?auto_91548 ) ) ( ON-TABLE ?auto_91548 ) ( ON ?auto_91547 ?auto_91548 ) ( ON ?auto_91546 ?auto_91547 ) ( ON ?auto_91545 ?auto_91546 ) ( ON ?auto_91544 ?auto_91545 ) ( ON ?auto_91543 ?auto_91544 ) ( ON ?auto_91542 ?auto_91543 ) ( CLEAR ?auto_91542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91548 ?auto_91547 ?auto_91546 ?auto_91545 ?auto_91544 ?auto_91543 )
      ( MAKE-7PILE ?auto_91542 ?auto_91543 ?auto_91544 ?auto_91545 ?auto_91546 ?auto_91547 ?auto_91548 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_91556 - BLOCK
      ?auto_91557 - BLOCK
      ?auto_91558 - BLOCK
      ?auto_91559 - BLOCK
      ?auto_91560 - BLOCK
      ?auto_91561 - BLOCK
      ?auto_91562 - BLOCK
    )
    :vars
    (
      ?auto_91563 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91556 ?auto_91557 ) ) ( not ( = ?auto_91556 ?auto_91558 ) ) ( not ( = ?auto_91556 ?auto_91559 ) ) ( not ( = ?auto_91556 ?auto_91560 ) ) ( not ( = ?auto_91556 ?auto_91561 ) ) ( not ( = ?auto_91556 ?auto_91562 ) ) ( not ( = ?auto_91557 ?auto_91558 ) ) ( not ( = ?auto_91557 ?auto_91559 ) ) ( not ( = ?auto_91557 ?auto_91560 ) ) ( not ( = ?auto_91557 ?auto_91561 ) ) ( not ( = ?auto_91557 ?auto_91562 ) ) ( not ( = ?auto_91558 ?auto_91559 ) ) ( not ( = ?auto_91558 ?auto_91560 ) ) ( not ( = ?auto_91558 ?auto_91561 ) ) ( not ( = ?auto_91558 ?auto_91562 ) ) ( not ( = ?auto_91559 ?auto_91560 ) ) ( not ( = ?auto_91559 ?auto_91561 ) ) ( not ( = ?auto_91559 ?auto_91562 ) ) ( not ( = ?auto_91560 ?auto_91561 ) ) ( not ( = ?auto_91560 ?auto_91562 ) ) ( not ( = ?auto_91561 ?auto_91562 ) ) ( ON-TABLE ?auto_91562 ) ( ON ?auto_91561 ?auto_91562 ) ( ON ?auto_91560 ?auto_91561 ) ( ON ?auto_91559 ?auto_91560 ) ( ON ?auto_91558 ?auto_91559 ) ( ON ?auto_91557 ?auto_91558 ) ( CLEAR ?auto_91557 ) ( ON ?auto_91556 ?auto_91563 ) ( CLEAR ?auto_91556 ) ( HAND-EMPTY ) ( not ( = ?auto_91556 ?auto_91563 ) ) ( not ( = ?auto_91557 ?auto_91563 ) ) ( not ( = ?auto_91558 ?auto_91563 ) ) ( not ( = ?auto_91559 ?auto_91563 ) ) ( not ( = ?auto_91560 ?auto_91563 ) ) ( not ( = ?auto_91561 ?auto_91563 ) ) ( not ( = ?auto_91562 ?auto_91563 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91556 ?auto_91563 )
      ( MAKE-7PILE ?auto_91556 ?auto_91557 ?auto_91558 ?auto_91559 ?auto_91560 ?auto_91561 ?auto_91562 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_91564 - BLOCK
      ?auto_91565 - BLOCK
      ?auto_91566 - BLOCK
      ?auto_91567 - BLOCK
      ?auto_91568 - BLOCK
      ?auto_91569 - BLOCK
      ?auto_91570 - BLOCK
    )
    :vars
    (
      ?auto_91571 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91564 ?auto_91565 ) ) ( not ( = ?auto_91564 ?auto_91566 ) ) ( not ( = ?auto_91564 ?auto_91567 ) ) ( not ( = ?auto_91564 ?auto_91568 ) ) ( not ( = ?auto_91564 ?auto_91569 ) ) ( not ( = ?auto_91564 ?auto_91570 ) ) ( not ( = ?auto_91565 ?auto_91566 ) ) ( not ( = ?auto_91565 ?auto_91567 ) ) ( not ( = ?auto_91565 ?auto_91568 ) ) ( not ( = ?auto_91565 ?auto_91569 ) ) ( not ( = ?auto_91565 ?auto_91570 ) ) ( not ( = ?auto_91566 ?auto_91567 ) ) ( not ( = ?auto_91566 ?auto_91568 ) ) ( not ( = ?auto_91566 ?auto_91569 ) ) ( not ( = ?auto_91566 ?auto_91570 ) ) ( not ( = ?auto_91567 ?auto_91568 ) ) ( not ( = ?auto_91567 ?auto_91569 ) ) ( not ( = ?auto_91567 ?auto_91570 ) ) ( not ( = ?auto_91568 ?auto_91569 ) ) ( not ( = ?auto_91568 ?auto_91570 ) ) ( not ( = ?auto_91569 ?auto_91570 ) ) ( ON-TABLE ?auto_91570 ) ( ON ?auto_91569 ?auto_91570 ) ( ON ?auto_91568 ?auto_91569 ) ( ON ?auto_91567 ?auto_91568 ) ( ON ?auto_91566 ?auto_91567 ) ( ON ?auto_91564 ?auto_91571 ) ( CLEAR ?auto_91564 ) ( not ( = ?auto_91564 ?auto_91571 ) ) ( not ( = ?auto_91565 ?auto_91571 ) ) ( not ( = ?auto_91566 ?auto_91571 ) ) ( not ( = ?auto_91567 ?auto_91571 ) ) ( not ( = ?auto_91568 ?auto_91571 ) ) ( not ( = ?auto_91569 ?auto_91571 ) ) ( not ( = ?auto_91570 ?auto_91571 ) ) ( HOLDING ?auto_91565 ) ( CLEAR ?auto_91566 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91570 ?auto_91569 ?auto_91568 ?auto_91567 ?auto_91566 ?auto_91565 )
      ( MAKE-7PILE ?auto_91564 ?auto_91565 ?auto_91566 ?auto_91567 ?auto_91568 ?auto_91569 ?auto_91570 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_91572 - BLOCK
      ?auto_91573 - BLOCK
      ?auto_91574 - BLOCK
      ?auto_91575 - BLOCK
      ?auto_91576 - BLOCK
      ?auto_91577 - BLOCK
      ?auto_91578 - BLOCK
    )
    :vars
    (
      ?auto_91579 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91572 ?auto_91573 ) ) ( not ( = ?auto_91572 ?auto_91574 ) ) ( not ( = ?auto_91572 ?auto_91575 ) ) ( not ( = ?auto_91572 ?auto_91576 ) ) ( not ( = ?auto_91572 ?auto_91577 ) ) ( not ( = ?auto_91572 ?auto_91578 ) ) ( not ( = ?auto_91573 ?auto_91574 ) ) ( not ( = ?auto_91573 ?auto_91575 ) ) ( not ( = ?auto_91573 ?auto_91576 ) ) ( not ( = ?auto_91573 ?auto_91577 ) ) ( not ( = ?auto_91573 ?auto_91578 ) ) ( not ( = ?auto_91574 ?auto_91575 ) ) ( not ( = ?auto_91574 ?auto_91576 ) ) ( not ( = ?auto_91574 ?auto_91577 ) ) ( not ( = ?auto_91574 ?auto_91578 ) ) ( not ( = ?auto_91575 ?auto_91576 ) ) ( not ( = ?auto_91575 ?auto_91577 ) ) ( not ( = ?auto_91575 ?auto_91578 ) ) ( not ( = ?auto_91576 ?auto_91577 ) ) ( not ( = ?auto_91576 ?auto_91578 ) ) ( not ( = ?auto_91577 ?auto_91578 ) ) ( ON-TABLE ?auto_91578 ) ( ON ?auto_91577 ?auto_91578 ) ( ON ?auto_91576 ?auto_91577 ) ( ON ?auto_91575 ?auto_91576 ) ( ON ?auto_91574 ?auto_91575 ) ( ON ?auto_91572 ?auto_91579 ) ( not ( = ?auto_91572 ?auto_91579 ) ) ( not ( = ?auto_91573 ?auto_91579 ) ) ( not ( = ?auto_91574 ?auto_91579 ) ) ( not ( = ?auto_91575 ?auto_91579 ) ) ( not ( = ?auto_91576 ?auto_91579 ) ) ( not ( = ?auto_91577 ?auto_91579 ) ) ( not ( = ?auto_91578 ?auto_91579 ) ) ( CLEAR ?auto_91574 ) ( ON ?auto_91573 ?auto_91572 ) ( CLEAR ?auto_91573 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91579 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91579 ?auto_91572 )
      ( MAKE-7PILE ?auto_91572 ?auto_91573 ?auto_91574 ?auto_91575 ?auto_91576 ?auto_91577 ?auto_91578 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_91580 - BLOCK
      ?auto_91581 - BLOCK
      ?auto_91582 - BLOCK
      ?auto_91583 - BLOCK
      ?auto_91584 - BLOCK
      ?auto_91585 - BLOCK
      ?auto_91586 - BLOCK
    )
    :vars
    (
      ?auto_91587 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91580 ?auto_91581 ) ) ( not ( = ?auto_91580 ?auto_91582 ) ) ( not ( = ?auto_91580 ?auto_91583 ) ) ( not ( = ?auto_91580 ?auto_91584 ) ) ( not ( = ?auto_91580 ?auto_91585 ) ) ( not ( = ?auto_91580 ?auto_91586 ) ) ( not ( = ?auto_91581 ?auto_91582 ) ) ( not ( = ?auto_91581 ?auto_91583 ) ) ( not ( = ?auto_91581 ?auto_91584 ) ) ( not ( = ?auto_91581 ?auto_91585 ) ) ( not ( = ?auto_91581 ?auto_91586 ) ) ( not ( = ?auto_91582 ?auto_91583 ) ) ( not ( = ?auto_91582 ?auto_91584 ) ) ( not ( = ?auto_91582 ?auto_91585 ) ) ( not ( = ?auto_91582 ?auto_91586 ) ) ( not ( = ?auto_91583 ?auto_91584 ) ) ( not ( = ?auto_91583 ?auto_91585 ) ) ( not ( = ?auto_91583 ?auto_91586 ) ) ( not ( = ?auto_91584 ?auto_91585 ) ) ( not ( = ?auto_91584 ?auto_91586 ) ) ( not ( = ?auto_91585 ?auto_91586 ) ) ( ON-TABLE ?auto_91586 ) ( ON ?auto_91585 ?auto_91586 ) ( ON ?auto_91584 ?auto_91585 ) ( ON ?auto_91583 ?auto_91584 ) ( ON ?auto_91580 ?auto_91587 ) ( not ( = ?auto_91580 ?auto_91587 ) ) ( not ( = ?auto_91581 ?auto_91587 ) ) ( not ( = ?auto_91582 ?auto_91587 ) ) ( not ( = ?auto_91583 ?auto_91587 ) ) ( not ( = ?auto_91584 ?auto_91587 ) ) ( not ( = ?auto_91585 ?auto_91587 ) ) ( not ( = ?auto_91586 ?auto_91587 ) ) ( ON ?auto_91581 ?auto_91580 ) ( CLEAR ?auto_91581 ) ( ON-TABLE ?auto_91587 ) ( HOLDING ?auto_91582 ) ( CLEAR ?auto_91583 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91586 ?auto_91585 ?auto_91584 ?auto_91583 ?auto_91582 )
      ( MAKE-7PILE ?auto_91580 ?auto_91581 ?auto_91582 ?auto_91583 ?auto_91584 ?auto_91585 ?auto_91586 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_91588 - BLOCK
      ?auto_91589 - BLOCK
      ?auto_91590 - BLOCK
      ?auto_91591 - BLOCK
      ?auto_91592 - BLOCK
      ?auto_91593 - BLOCK
      ?auto_91594 - BLOCK
    )
    :vars
    (
      ?auto_91595 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91588 ?auto_91589 ) ) ( not ( = ?auto_91588 ?auto_91590 ) ) ( not ( = ?auto_91588 ?auto_91591 ) ) ( not ( = ?auto_91588 ?auto_91592 ) ) ( not ( = ?auto_91588 ?auto_91593 ) ) ( not ( = ?auto_91588 ?auto_91594 ) ) ( not ( = ?auto_91589 ?auto_91590 ) ) ( not ( = ?auto_91589 ?auto_91591 ) ) ( not ( = ?auto_91589 ?auto_91592 ) ) ( not ( = ?auto_91589 ?auto_91593 ) ) ( not ( = ?auto_91589 ?auto_91594 ) ) ( not ( = ?auto_91590 ?auto_91591 ) ) ( not ( = ?auto_91590 ?auto_91592 ) ) ( not ( = ?auto_91590 ?auto_91593 ) ) ( not ( = ?auto_91590 ?auto_91594 ) ) ( not ( = ?auto_91591 ?auto_91592 ) ) ( not ( = ?auto_91591 ?auto_91593 ) ) ( not ( = ?auto_91591 ?auto_91594 ) ) ( not ( = ?auto_91592 ?auto_91593 ) ) ( not ( = ?auto_91592 ?auto_91594 ) ) ( not ( = ?auto_91593 ?auto_91594 ) ) ( ON-TABLE ?auto_91594 ) ( ON ?auto_91593 ?auto_91594 ) ( ON ?auto_91592 ?auto_91593 ) ( ON ?auto_91591 ?auto_91592 ) ( ON ?auto_91588 ?auto_91595 ) ( not ( = ?auto_91588 ?auto_91595 ) ) ( not ( = ?auto_91589 ?auto_91595 ) ) ( not ( = ?auto_91590 ?auto_91595 ) ) ( not ( = ?auto_91591 ?auto_91595 ) ) ( not ( = ?auto_91592 ?auto_91595 ) ) ( not ( = ?auto_91593 ?auto_91595 ) ) ( not ( = ?auto_91594 ?auto_91595 ) ) ( ON ?auto_91589 ?auto_91588 ) ( ON-TABLE ?auto_91595 ) ( CLEAR ?auto_91591 ) ( ON ?auto_91590 ?auto_91589 ) ( CLEAR ?auto_91590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91595 ?auto_91588 ?auto_91589 )
      ( MAKE-7PILE ?auto_91588 ?auto_91589 ?auto_91590 ?auto_91591 ?auto_91592 ?auto_91593 ?auto_91594 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_91596 - BLOCK
      ?auto_91597 - BLOCK
      ?auto_91598 - BLOCK
      ?auto_91599 - BLOCK
      ?auto_91600 - BLOCK
      ?auto_91601 - BLOCK
      ?auto_91602 - BLOCK
    )
    :vars
    (
      ?auto_91603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91596 ?auto_91597 ) ) ( not ( = ?auto_91596 ?auto_91598 ) ) ( not ( = ?auto_91596 ?auto_91599 ) ) ( not ( = ?auto_91596 ?auto_91600 ) ) ( not ( = ?auto_91596 ?auto_91601 ) ) ( not ( = ?auto_91596 ?auto_91602 ) ) ( not ( = ?auto_91597 ?auto_91598 ) ) ( not ( = ?auto_91597 ?auto_91599 ) ) ( not ( = ?auto_91597 ?auto_91600 ) ) ( not ( = ?auto_91597 ?auto_91601 ) ) ( not ( = ?auto_91597 ?auto_91602 ) ) ( not ( = ?auto_91598 ?auto_91599 ) ) ( not ( = ?auto_91598 ?auto_91600 ) ) ( not ( = ?auto_91598 ?auto_91601 ) ) ( not ( = ?auto_91598 ?auto_91602 ) ) ( not ( = ?auto_91599 ?auto_91600 ) ) ( not ( = ?auto_91599 ?auto_91601 ) ) ( not ( = ?auto_91599 ?auto_91602 ) ) ( not ( = ?auto_91600 ?auto_91601 ) ) ( not ( = ?auto_91600 ?auto_91602 ) ) ( not ( = ?auto_91601 ?auto_91602 ) ) ( ON-TABLE ?auto_91602 ) ( ON ?auto_91601 ?auto_91602 ) ( ON ?auto_91600 ?auto_91601 ) ( ON ?auto_91596 ?auto_91603 ) ( not ( = ?auto_91596 ?auto_91603 ) ) ( not ( = ?auto_91597 ?auto_91603 ) ) ( not ( = ?auto_91598 ?auto_91603 ) ) ( not ( = ?auto_91599 ?auto_91603 ) ) ( not ( = ?auto_91600 ?auto_91603 ) ) ( not ( = ?auto_91601 ?auto_91603 ) ) ( not ( = ?auto_91602 ?auto_91603 ) ) ( ON ?auto_91597 ?auto_91596 ) ( ON-TABLE ?auto_91603 ) ( ON ?auto_91598 ?auto_91597 ) ( CLEAR ?auto_91598 ) ( HOLDING ?auto_91599 ) ( CLEAR ?auto_91600 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91602 ?auto_91601 ?auto_91600 ?auto_91599 )
      ( MAKE-7PILE ?auto_91596 ?auto_91597 ?auto_91598 ?auto_91599 ?auto_91600 ?auto_91601 ?auto_91602 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_91604 - BLOCK
      ?auto_91605 - BLOCK
      ?auto_91606 - BLOCK
      ?auto_91607 - BLOCK
      ?auto_91608 - BLOCK
      ?auto_91609 - BLOCK
      ?auto_91610 - BLOCK
    )
    :vars
    (
      ?auto_91611 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91604 ?auto_91605 ) ) ( not ( = ?auto_91604 ?auto_91606 ) ) ( not ( = ?auto_91604 ?auto_91607 ) ) ( not ( = ?auto_91604 ?auto_91608 ) ) ( not ( = ?auto_91604 ?auto_91609 ) ) ( not ( = ?auto_91604 ?auto_91610 ) ) ( not ( = ?auto_91605 ?auto_91606 ) ) ( not ( = ?auto_91605 ?auto_91607 ) ) ( not ( = ?auto_91605 ?auto_91608 ) ) ( not ( = ?auto_91605 ?auto_91609 ) ) ( not ( = ?auto_91605 ?auto_91610 ) ) ( not ( = ?auto_91606 ?auto_91607 ) ) ( not ( = ?auto_91606 ?auto_91608 ) ) ( not ( = ?auto_91606 ?auto_91609 ) ) ( not ( = ?auto_91606 ?auto_91610 ) ) ( not ( = ?auto_91607 ?auto_91608 ) ) ( not ( = ?auto_91607 ?auto_91609 ) ) ( not ( = ?auto_91607 ?auto_91610 ) ) ( not ( = ?auto_91608 ?auto_91609 ) ) ( not ( = ?auto_91608 ?auto_91610 ) ) ( not ( = ?auto_91609 ?auto_91610 ) ) ( ON-TABLE ?auto_91610 ) ( ON ?auto_91609 ?auto_91610 ) ( ON ?auto_91608 ?auto_91609 ) ( ON ?auto_91604 ?auto_91611 ) ( not ( = ?auto_91604 ?auto_91611 ) ) ( not ( = ?auto_91605 ?auto_91611 ) ) ( not ( = ?auto_91606 ?auto_91611 ) ) ( not ( = ?auto_91607 ?auto_91611 ) ) ( not ( = ?auto_91608 ?auto_91611 ) ) ( not ( = ?auto_91609 ?auto_91611 ) ) ( not ( = ?auto_91610 ?auto_91611 ) ) ( ON ?auto_91605 ?auto_91604 ) ( ON-TABLE ?auto_91611 ) ( ON ?auto_91606 ?auto_91605 ) ( CLEAR ?auto_91608 ) ( ON ?auto_91607 ?auto_91606 ) ( CLEAR ?auto_91607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91611 ?auto_91604 ?auto_91605 ?auto_91606 )
      ( MAKE-7PILE ?auto_91604 ?auto_91605 ?auto_91606 ?auto_91607 ?auto_91608 ?auto_91609 ?auto_91610 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_91612 - BLOCK
      ?auto_91613 - BLOCK
      ?auto_91614 - BLOCK
      ?auto_91615 - BLOCK
      ?auto_91616 - BLOCK
      ?auto_91617 - BLOCK
      ?auto_91618 - BLOCK
    )
    :vars
    (
      ?auto_91619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91612 ?auto_91613 ) ) ( not ( = ?auto_91612 ?auto_91614 ) ) ( not ( = ?auto_91612 ?auto_91615 ) ) ( not ( = ?auto_91612 ?auto_91616 ) ) ( not ( = ?auto_91612 ?auto_91617 ) ) ( not ( = ?auto_91612 ?auto_91618 ) ) ( not ( = ?auto_91613 ?auto_91614 ) ) ( not ( = ?auto_91613 ?auto_91615 ) ) ( not ( = ?auto_91613 ?auto_91616 ) ) ( not ( = ?auto_91613 ?auto_91617 ) ) ( not ( = ?auto_91613 ?auto_91618 ) ) ( not ( = ?auto_91614 ?auto_91615 ) ) ( not ( = ?auto_91614 ?auto_91616 ) ) ( not ( = ?auto_91614 ?auto_91617 ) ) ( not ( = ?auto_91614 ?auto_91618 ) ) ( not ( = ?auto_91615 ?auto_91616 ) ) ( not ( = ?auto_91615 ?auto_91617 ) ) ( not ( = ?auto_91615 ?auto_91618 ) ) ( not ( = ?auto_91616 ?auto_91617 ) ) ( not ( = ?auto_91616 ?auto_91618 ) ) ( not ( = ?auto_91617 ?auto_91618 ) ) ( ON-TABLE ?auto_91618 ) ( ON ?auto_91617 ?auto_91618 ) ( ON ?auto_91612 ?auto_91619 ) ( not ( = ?auto_91612 ?auto_91619 ) ) ( not ( = ?auto_91613 ?auto_91619 ) ) ( not ( = ?auto_91614 ?auto_91619 ) ) ( not ( = ?auto_91615 ?auto_91619 ) ) ( not ( = ?auto_91616 ?auto_91619 ) ) ( not ( = ?auto_91617 ?auto_91619 ) ) ( not ( = ?auto_91618 ?auto_91619 ) ) ( ON ?auto_91613 ?auto_91612 ) ( ON-TABLE ?auto_91619 ) ( ON ?auto_91614 ?auto_91613 ) ( ON ?auto_91615 ?auto_91614 ) ( CLEAR ?auto_91615 ) ( HOLDING ?auto_91616 ) ( CLEAR ?auto_91617 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91618 ?auto_91617 ?auto_91616 )
      ( MAKE-7PILE ?auto_91612 ?auto_91613 ?auto_91614 ?auto_91615 ?auto_91616 ?auto_91617 ?auto_91618 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_91620 - BLOCK
      ?auto_91621 - BLOCK
      ?auto_91622 - BLOCK
      ?auto_91623 - BLOCK
      ?auto_91624 - BLOCK
      ?auto_91625 - BLOCK
      ?auto_91626 - BLOCK
    )
    :vars
    (
      ?auto_91627 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91620 ?auto_91621 ) ) ( not ( = ?auto_91620 ?auto_91622 ) ) ( not ( = ?auto_91620 ?auto_91623 ) ) ( not ( = ?auto_91620 ?auto_91624 ) ) ( not ( = ?auto_91620 ?auto_91625 ) ) ( not ( = ?auto_91620 ?auto_91626 ) ) ( not ( = ?auto_91621 ?auto_91622 ) ) ( not ( = ?auto_91621 ?auto_91623 ) ) ( not ( = ?auto_91621 ?auto_91624 ) ) ( not ( = ?auto_91621 ?auto_91625 ) ) ( not ( = ?auto_91621 ?auto_91626 ) ) ( not ( = ?auto_91622 ?auto_91623 ) ) ( not ( = ?auto_91622 ?auto_91624 ) ) ( not ( = ?auto_91622 ?auto_91625 ) ) ( not ( = ?auto_91622 ?auto_91626 ) ) ( not ( = ?auto_91623 ?auto_91624 ) ) ( not ( = ?auto_91623 ?auto_91625 ) ) ( not ( = ?auto_91623 ?auto_91626 ) ) ( not ( = ?auto_91624 ?auto_91625 ) ) ( not ( = ?auto_91624 ?auto_91626 ) ) ( not ( = ?auto_91625 ?auto_91626 ) ) ( ON-TABLE ?auto_91626 ) ( ON ?auto_91625 ?auto_91626 ) ( ON ?auto_91620 ?auto_91627 ) ( not ( = ?auto_91620 ?auto_91627 ) ) ( not ( = ?auto_91621 ?auto_91627 ) ) ( not ( = ?auto_91622 ?auto_91627 ) ) ( not ( = ?auto_91623 ?auto_91627 ) ) ( not ( = ?auto_91624 ?auto_91627 ) ) ( not ( = ?auto_91625 ?auto_91627 ) ) ( not ( = ?auto_91626 ?auto_91627 ) ) ( ON ?auto_91621 ?auto_91620 ) ( ON-TABLE ?auto_91627 ) ( ON ?auto_91622 ?auto_91621 ) ( ON ?auto_91623 ?auto_91622 ) ( CLEAR ?auto_91625 ) ( ON ?auto_91624 ?auto_91623 ) ( CLEAR ?auto_91624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91627 ?auto_91620 ?auto_91621 ?auto_91622 ?auto_91623 )
      ( MAKE-7PILE ?auto_91620 ?auto_91621 ?auto_91622 ?auto_91623 ?auto_91624 ?auto_91625 ?auto_91626 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_91628 - BLOCK
      ?auto_91629 - BLOCK
      ?auto_91630 - BLOCK
      ?auto_91631 - BLOCK
      ?auto_91632 - BLOCK
      ?auto_91633 - BLOCK
      ?auto_91634 - BLOCK
    )
    :vars
    (
      ?auto_91635 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91628 ?auto_91629 ) ) ( not ( = ?auto_91628 ?auto_91630 ) ) ( not ( = ?auto_91628 ?auto_91631 ) ) ( not ( = ?auto_91628 ?auto_91632 ) ) ( not ( = ?auto_91628 ?auto_91633 ) ) ( not ( = ?auto_91628 ?auto_91634 ) ) ( not ( = ?auto_91629 ?auto_91630 ) ) ( not ( = ?auto_91629 ?auto_91631 ) ) ( not ( = ?auto_91629 ?auto_91632 ) ) ( not ( = ?auto_91629 ?auto_91633 ) ) ( not ( = ?auto_91629 ?auto_91634 ) ) ( not ( = ?auto_91630 ?auto_91631 ) ) ( not ( = ?auto_91630 ?auto_91632 ) ) ( not ( = ?auto_91630 ?auto_91633 ) ) ( not ( = ?auto_91630 ?auto_91634 ) ) ( not ( = ?auto_91631 ?auto_91632 ) ) ( not ( = ?auto_91631 ?auto_91633 ) ) ( not ( = ?auto_91631 ?auto_91634 ) ) ( not ( = ?auto_91632 ?auto_91633 ) ) ( not ( = ?auto_91632 ?auto_91634 ) ) ( not ( = ?auto_91633 ?auto_91634 ) ) ( ON-TABLE ?auto_91634 ) ( ON ?auto_91628 ?auto_91635 ) ( not ( = ?auto_91628 ?auto_91635 ) ) ( not ( = ?auto_91629 ?auto_91635 ) ) ( not ( = ?auto_91630 ?auto_91635 ) ) ( not ( = ?auto_91631 ?auto_91635 ) ) ( not ( = ?auto_91632 ?auto_91635 ) ) ( not ( = ?auto_91633 ?auto_91635 ) ) ( not ( = ?auto_91634 ?auto_91635 ) ) ( ON ?auto_91629 ?auto_91628 ) ( ON-TABLE ?auto_91635 ) ( ON ?auto_91630 ?auto_91629 ) ( ON ?auto_91631 ?auto_91630 ) ( ON ?auto_91632 ?auto_91631 ) ( CLEAR ?auto_91632 ) ( HOLDING ?auto_91633 ) ( CLEAR ?auto_91634 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91634 ?auto_91633 )
      ( MAKE-7PILE ?auto_91628 ?auto_91629 ?auto_91630 ?auto_91631 ?auto_91632 ?auto_91633 ?auto_91634 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_91636 - BLOCK
      ?auto_91637 - BLOCK
      ?auto_91638 - BLOCK
      ?auto_91639 - BLOCK
      ?auto_91640 - BLOCK
      ?auto_91641 - BLOCK
      ?auto_91642 - BLOCK
    )
    :vars
    (
      ?auto_91643 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91636 ?auto_91637 ) ) ( not ( = ?auto_91636 ?auto_91638 ) ) ( not ( = ?auto_91636 ?auto_91639 ) ) ( not ( = ?auto_91636 ?auto_91640 ) ) ( not ( = ?auto_91636 ?auto_91641 ) ) ( not ( = ?auto_91636 ?auto_91642 ) ) ( not ( = ?auto_91637 ?auto_91638 ) ) ( not ( = ?auto_91637 ?auto_91639 ) ) ( not ( = ?auto_91637 ?auto_91640 ) ) ( not ( = ?auto_91637 ?auto_91641 ) ) ( not ( = ?auto_91637 ?auto_91642 ) ) ( not ( = ?auto_91638 ?auto_91639 ) ) ( not ( = ?auto_91638 ?auto_91640 ) ) ( not ( = ?auto_91638 ?auto_91641 ) ) ( not ( = ?auto_91638 ?auto_91642 ) ) ( not ( = ?auto_91639 ?auto_91640 ) ) ( not ( = ?auto_91639 ?auto_91641 ) ) ( not ( = ?auto_91639 ?auto_91642 ) ) ( not ( = ?auto_91640 ?auto_91641 ) ) ( not ( = ?auto_91640 ?auto_91642 ) ) ( not ( = ?auto_91641 ?auto_91642 ) ) ( ON-TABLE ?auto_91642 ) ( ON ?auto_91636 ?auto_91643 ) ( not ( = ?auto_91636 ?auto_91643 ) ) ( not ( = ?auto_91637 ?auto_91643 ) ) ( not ( = ?auto_91638 ?auto_91643 ) ) ( not ( = ?auto_91639 ?auto_91643 ) ) ( not ( = ?auto_91640 ?auto_91643 ) ) ( not ( = ?auto_91641 ?auto_91643 ) ) ( not ( = ?auto_91642 ?auto_91643 ) ) ( ON ?auto_91637 ?auto_91636 ) ( ON-TABLE ?auto_91643 ) ( ON ?auto_91638 ?auto_91637 ) ( ON ?auto_91639 ?auto_91638 ) ( ON ?auto_91640 ?auto_91639 ) ( CLEAR ?auto_91642 ) ( ON ?auto_91641 ?auto_91640 ) ( CLEAR ?auto_91641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91643 ?auto_91636 ?auto_91637 ?auto_91638 ?auto_91639 ?auto_91640 )
      ( MAKE-7PILE ?auto_91636 ?auto_91637 ?auto_91638 ?auto_91639 ?auto_91640 ?auto_91641 ?auto_91642 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_91644 - BLOCK
      ?auto_91645 - BLOCK
      ?auto_91646 - BLOCK
      ?auto_91647 - BLOCK
      ?auto_91648 - BLOCK
      ?auto_91649 - BLOCK
      ?auto_91650 - BLOCK
    )
    :vars
    (
      ?auto_91651 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91644 ?auto_91645 ) ) ( not ( = ?auto_91644 ?auto_91646 ) ) ( not ( = ?auto_91644 ?auto_91647 ) ) ( not ( = ?auto_91644 ?auto_91648 ) ) ( not ( = ?auto_91644 ?auto_91649 ) ) ( not ( = ?auto_91644 ?auto_91650 ) ) ( not ( = ?auto_91645 ?auto_91646 ) ) ( not ( = ?auto_91645 ?auto_91647 ) ) ( not ( = ?auto_91645 ?auto_91648 ) ) ( not ( = ?auto_91645 ?auto_91649 ) ) ( not ( = ?auto_91645 ?auto_91650 ) ) ( not ( = ?auto_91646 ?auto_91647 ) ) ( not ( = ?auto_91646 ?auto_91648 ) ) ( not ( = ?auto_91646 ?auto_91649 ) ) ( not ( = ?auto_91646 ?auto_91650 ) ) ( not ( = ?auto_91647 ?auto_91648 ) ) ( not ( = ?auto_91647 ?auto_91649 ) ) ( not ( = ?auto_91647 ?auto_91650 ) ) ( not ( = ?auto_91648 ?auto_91649 ) ) ( not ( = ?auto_91648 ?auto_91650 ) ) ( not ( = ?auto_91649 ?auto_91650 ) ) ( ON ?auto_91644 ?auto_91651 ) ( not ( = ?auto_91644 ?auto_91651 ) ) ( not ( = ?auto_91645 ?auto_91651 ) ) ( not ( = ?auto_91646 ?auto_91651 ) ) ( not ( = ?auto_91647 ?auto_91651 ) ) ( not ( = ?auto_91648 ?auto_91651 ) ) ( not ( = ?auto_91649 ?auto_91651 ) ) ( not ( = ?auto_91650 ?auto_91651 ) ) ( ON ?auto_91645 ?auto_91644 ) ( ON-TABLE ?auto_91651 ) ( ON ?auto_91646 ?auto_91645 ) ( ON ?auto_91647 ?auto_91646 ) ( ON ?auto_91648 ?auto_91647 ) ( ON ?auto_91649 ?auto_91648 ) ( CLEAR ?auto_91649 ) ( HOLDING ?auto_91650 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91650 )
      ( MAKE-7PILE ?auto_91644 ?auto_91645 ?auto_91646 ?auto_91647 ?auto_91648 ?auto_91649 ?auto_91650 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_91652 - BLOCK
      ?auto_91653 - BLOCK
      ?auto_91654 - BLOCK
      ?auto_91655 - BLOCK
      ?auto_91656 - BLOCK
      ?auto_91657 - BLOCK
      ?auto_91658 - BLOCK
    )
    :vars
    (
      ?auto_91659 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91652 ?auto_91653 ) ) ( not ( = ?auto_91652 ?auto_91654 ) ) ( not ( = ?auto_91652 ?auto_91655 ) ) ( not ( = ?auto_91652 ?auto_91656 ) ) ( not ( = ?auto_91652 ?auto_91657 ) ) ( not ( = ?auto_91652 ?auto_91658 ) ) ( not ( = ?auto_91653 ?auto_91654 ) ) ( not ( = ?auto_91653 ?auto_91655 ) ) ( not ( = ?auto_91653 ?auto_91656 ) ) ( not ( = ?auto_91653 ?auto_91657 ) ) ( not ( = ?auto_91653 ?auto_91658 ) ) ( not ( = ?auto_91654 ?auto_91655 ) ) ( not ( = ?auto_91654 ?auto_91656 ) ) ( not ( = ?auto_91654 ?auto_91657 ) ) ( not ( = ?auto_91654 ?auto_91658 ) ) ( not ( = ?auto_91655 ?auto_91656 ) ) ( not ( = ?auto_91655 ?auto_91657 ) ) ( not ( = ?auto_91655 ?auto_91658 ) ) ( not ( = ?auto_91656 ?auto_91657 ) ) ( not ( = ?auto_91656 ?auto_91658 ) ) ( not ( = ?auto_91657 ?auto_91658 ) ) ( ON ?auto_91652 ?auto_91659 ) ( not ( = ?auto_91652 ?auto_91659 ) ) ( not ( = ?auto_91653 ?auto_91659 ) ) ( not ( = ?auto_91654 ?auto_91659 ) ) ( not ( = ?auto_91655 ?auto_91659 ) ) ( not ( = ?auto_91656 ?auto_91659 ) ) ( not ( = ?auto_91657 ?auto_91659 ) ) ( not ( = ?auto_91658 ?auto_91659 ) ) ( ON ?auto_91653 ?auto_91652 ) ( ON-TABLE ?auto_91659 ) ( ON ?auto_91654 ?auto_91653 ) ( ON ?auto_91655 ?auto_91654 ) ( ON ?auto_91656 ?auto_91655 ) ( ON ?auto_91657 ?auto_91656 ) ( ON ?auto_91658 ?auto_91657 ) ( CLEAR ?auto_91658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_91659 ?auto_91652 ?auto_91653 ?auto_91654 ?auto_91655 ?auto_91656 ?auto_91657 )
      ( MAKE-7PILE ?auto_91652 ?auto_91653 ?auto_91654 ?auto_91655 ?auto_91656 ?auto_91657 ?auto_91658 ) )
  )

)

