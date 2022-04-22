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

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158149 - BLOCK
      ?auto_158150 - BLOCK
      ?auto_158151 - BLOCK
      ?auto_158152 - BLOCK
      ?auto_158153 - BLOCK
      ?auto_158154 - BLOCK
      ?auto_158155 - BLOCK
      ?auto_158156 - BLOCK
    )
    :vars
    (
      ?auto_158157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158157 ?auto_158156 ) ( CLEAR ?auto_158157 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158149 ) ( ON ?auto_158150 ?auto_158149 ) ( ON ?auto_158151 ?auto_158150 ) ( ON ?auto_158152 ?auto_158151 ) ( ON ?auto_158153 ?auto_158152 ) ( ON ?auto_158154 ?auto_158153 ) ( ON ?auto_158155 ?auto_158154 ) ( ON ?auto_158156 ?auto_158155 ) ( not ( = ?auto_158149 ?auto_158150 ) ) ( not ( = ?auto_158149 ?auto_158151 ) ) ( not ( = ?auto_158149 ?auto_158152 ) ) ( not ( = ?auto_158149 ?auto_158153 ) ) ( not ( = ?auto_158149 ?auto_158154 ) ) ( not ( = ?auto_158149 ?auto_158155 ) ) ( not ( = ?auto_158149 ?auto_158156 ) ) ( not ( = ?auto_158149 ?auto_158157 ) ) ( not ( = ?auto_158150 ?auto_158151 ) ) ( not ( = ?auto_158150 ?auto_158152 ) ) ( not ( = ?auto_158150 ?auto_158153 ) ) ( not ( = ?auto_158150 ?auto_158154 ) ) ( not ( = ?auto_158150 ?auto_158155 ) ) ( not ( = ?auto_158150 ?auto_158156 ) ) ( not ( = ?auto_158150 ?auto_158157 ) ) ( not ( = ?auto_158151 ?auto_158152 ) ) ( not ( = ?auto_158151 ?auto_158153 ) ) ( not ( = ?auto_158151 ?auto_158154 ) ) ( not ( = ?auto_158151 ?auto_158155 ) ) ( not ( = ?auto_158151 ?auto_158156 ) ) ( not ( = ?auto_158151 ?auto_158157 ) ) ( not ( = ?auto_158152 ?auto_158153 ) ) ( not ( = ?auto_158152 ?auto_158154 ) ) ( not ( = ?auto_158152 ?auto_158155 ) ) ( not ( = ?auto_158152 ?auto_158156 ) ) ( not ( = ?auto_158152 ?auto_158157 ) ) ( not ( = ?auto_158153 ?auto_158154 ) ) ( not ( = ?auto_158153 ?auto_158155 ) ) ( not ( = ?auto_158153 ?auto_158156 ) ) ( not ( = ?auto_158153 ?auto_158157 ) ) ( not ( = ?auto_158154 ?auto_158155 ) ) ( not ( = ?auto_158154 ?auto_158156 ) ) ( not ( = ?auto_158154 ?auto_158157 ) ) ( not ( = ?auto_158155 ?auto_158156 ) ) ( not ( = ?auto_158155 ?auto_158157 ) ) ( not ( = ?auto_158156 ?auto_158157 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158157 ?auto_158156 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_158159 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_158159 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_158159 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_158160 - BLOCK
    )
    :vars
    (
      ?auto_158161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158160 ?auto_158161 ) ( CLEAR ?auto_158160 ) ( HAND-EMPTY ) ( not ( = ?auto_158160 ?auto_158161 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158160 ?auto_158161 )
      ( MAKE-1PILE ?auto_158160 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158169 - BLOCK
      ?auto_158170 - BLOCK
      ?auto_158171 - BLOCK
      ?auto_158172 - BLOCK
      ?auto_158173 - BLOCK
      ?auto_158174 - BLOCK
      ?auto_158175 - BLOCK
    )
    :vars
    (
      ?auto_158176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158176 ?auto_158175 ) ( CLEAR ?auto_158176 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158169 ) ( ON ?auto_158170 ?auto_158169 ) ( ON ?auto_158171 ?auto_158170 ) ( ON ?auto_158172 ?auto_158171 ) ( ON ?auto_158173 ?auto_158172 ) ( ON ?auto_158174 ?auto_158173 ) ( ON ?auto_158175 ?auto_158174 ) ( not ( = ?auto_158169 ?auto_158170 ) ) ( not ( = ?auto_158169 ?auto_158171 ) ) ( not ( = ?auto_158169 ?auto_158172 ) ) ( not ( = ?auto_158169 ?auto_158173 ) ) ( not ( = ?auto_158169 ?auto_158174 ) ) ( not ( = ?auto_158169 ?auto_158175 ) ) ( not ( = ?auto_158169 ?auto_158176 ) ) ( not ( = ?auto_158170 ?auto_158171 ) ) ( not ( = ?auto_158170 ?auto_158172 ) ) ( not ( = ?auto_158170 ?auto_158173 ) ) ( not ( = ?auto_158170 ?auto_158174 ) ) ( not ( = ?auto_158170 ?auto_158175 ) ) ( not ( = ?auto_158170 ?auto_158176 ) ) ( not ( = ?auto_158171 ?auto_158172 ) ) ( not ( = ?auto_158171 ?auto_158173 ) ) ( not ( = ?auto_158171 ?auto_158174 ) ) ( not ( = ?auto_158171 ?auto_158175 ) ) ( not ( = ?auto_158171 ?auto_158176 ) ) ( not ( = ?auto_158172 ?auto_158173 ) ) ( not ( = ?auto_158172 ?auto_158174 ) ) ( not ( = ?auto_158172 ?auto_158175 ) ) ( not ( = ?auto_158172 ?auto_158176 ) ) ( not ( = ?auto_158173 ?auto_158174 ) ) ( not ( = ?auto_158173 ?auto_158175 ) ) ( not ( = ?auto_158173 ?auto_158176 ) ) ( not ( = ?auto_158174 ?auto_158175 ) ) ( not ( = ?auto_158174 ?auto_158176 ) ) ( not ( = ?auto_158175 ?auto_158176 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158176 ?auto_158175 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158177 - BLOCK
      ?auto_158178 - BLOCK
      ?auto_158179 - BLOCK
      ?auto_158180 - BLOCK
      ?auto_158181 - BLOCK
      ?auto_158182 - BLOCK
      ?auto_158183 - BLOCK
    )
    :vars
    (
      ?auto_158184 - BLOCK
      ?auto_158185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158184 ?auto_158183 ) ( CLEAR ?auto_158184 ) ( ON-TABLE ?auto_158177 ) ( ON ?auto_158178 ?auto_158177 ) ( ON ?auto_158179 ?auto_158178 ) ( ON ?auto_158180 ?auto_158179 ) ( ON ?auto_158181 ?auto_158180 ) ( ON ?auto_158182 ?auto_158181 ) ( ON ?auto_158183 ?auto_158182 ) ( not ( = ?auto_158177 ?auto_158178 ) ) ( not ( = ?auto_158177 ?auto_158179 ) ) ( not ( = ?auto_158177 ?auto_158180 ) ) ( not ( = ?auto_158177 ?auto_158181 ) ) ( not ( = ?auto_158177 ?auto_158182 ) ) ( not ( = ?auto_158177 ?auto_158183 ) ) ( not ( = ?auto_158177 ?auto_158184 ) ) ( not ( = ?auto_158178 ?auto_158179 ) ) ( not ( = ?auto_158178 ?auto_158180 ) ) ( not ( = ?auto_158178 ?auto_158181 ) ) ( not ( = ?auto_158178 ?auto_158182 ) ) ( not ( = ?auto_158178 ?auto_158183 ) ) ( not ( = ?auto_158178 ?auto_158184 ) ) ( not ( = ?auto_158179 ?auto_158180 ) ) ( not ( = ?auto_158179 ?auto_158181 ) ) ( not ( = ?auto_158179 ?auto_158182 ) ) ( not ( = ?auto_158179 ?auto_158183 ) ) ( not ( = ?auto_158179 ?auto_158184 ) ) ( not ( = ?auto_158180 ?auto_158181 ) ) ( not ( = ?auto_158180 ?auto_158182 ) ) ( not ( = ?auto_158180 ?auto_158183 ) ) ( not ( = ?auto_158180 ?auto_158184 ) ) ( not ( = ?auto_158181 ?auto_158182 ) ) ( not ( = ?auto_158181 ?auto_158183 ) ) ( not ( = ?auto_158181 ?auto_158184 ) ) ( not ( = ?auto_158182 ?auto_158183 ) ) ( not ( = ?auto_158182 ?auto_158184 ) ) ( not ( = ?auto_158183 ?auto_158184 ) ) ( HOLDING ?auto_158185 ) ( not ( = ?auto_158177 ?auto_158185 ) ) ( not ( = ?auto_158178 ?auto_158185 ) ) ( not ( = ?auto_158179 ?auto_158185 ) ) ( not ( = ?auto_158180 ?auto_158185 ) ) ( not ( = ?auto_158181 ?auto_158185 ) ) ( not ( = ?auto_158182 ?auto_158185 ) ) ( not ( = ?auto_158183 ?auto_158185 ) ) ( not ( = ?auto_158184 ?auto_158185 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_158185 )
      ( MAKE-7PILE ?auto_158177 ?auto_158178 ?auto_158179 ?auto_158180 ?auto_158181 ?auto_158182 ?auto_158183 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158186 - BLOCK
      ?auto_158187 - BLOCK
      ?auto_158188 - BLOCK
      ?auto_158189 - BLOCK
      ?auto_158190 - BLOCK
      ?auto_158191 - BLOCK
      ?auto_158192 - BLOCK
    )
    :vars
    (
      ?auto_158193 - BLOCK
      ?auto_158194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158193 ?auto_158192 ) ( ON-TABLE ?auto_158186 ) ( ON ?auto_158187 ?auto_158186 ) ( ON ?auto_158188 ?auto_158187 ) ( ON ?auto_158189 ?auto_158188 ) ( ON ?auto_158190 ?auto_158189 ) ( ON ?auto_158191 ?auto_158190 ) ( ON ?auto_158192 ?auto_158191 ) ( not ( = ?auto_158186 ?auto_158187 ) ) ( not ( = ?auto_158186 ?auto_158188 ) ) ( not ( = ?auto_158186 ?auto_158189 ) ) ( not ( = ?auto_158186 ?auto_158190 ) ) ( not ( = ?auto_158186 ?auto_158191 ) ) ( not ( = ?auto_158186 ?auto_158192 ) ) ( not ( = ?auto_158186 ?auto_158193 ) ) ( not ( = ?auto_158187 ?auto_158188 ) ) ( not ( = ?auto_158187 ?auto_158189 ) ) ( not ( = ?auto_158187 ?auto_158190 ) ) ( not ( = ?auto_158187 ?auto_158191 ) ) ( not ( = ?auto_158187 ?auto_158192 ) ) ( not ( = ?auto_158187 ?auto_158193 ) ) ( not ( = ?auto_158188 ?auto_158189 ) ) ( not ( = ?auto_158188 ?auto_158190 ) ) ( not ( = ?auto_158188 ?auto_158191 ) ) ( not ( = ?auto_158188 ?auto_158192 ) ) ( not ( = ?auto_158188 ?auto_158193 ) ) ( not ( = ?auto_158189 ?auto_158190 ) ) ( not ( = ?auto_158189 ?auto_158191 ) ) ( not ( = ?auto_158189 ?auto_158192 ) ) ( not ( = ?auto_158189 ?auto_158193 ) ) ( not ( = ?auto_158190 ?auto_158191 ) ) ( not ( = ?auto_158190 ?auto_158192 ) ) ( not ( = ?auto_158190 ?auto_158193 ) ) ( not ( = ?auto_158191 ?auto_158192 ) ) ( not ( = ?auto_158191 ?auto_158193 ) ) ( not ( = ?auto_158192 ?auto_158193 ) ) ( not ( = ?auto_158186 ?auto_158194 ) ) ( not ( = ?auto_158187 ?auto_158194 ) ) ( not ( = ?auto_158188 ?auto_158194 ) ) ( not ( = ?auto_158189 ?auto_158194 ) ) ( not ( = ?auto_158190 ?auto_158194 ) ) ( not ( = ?auto_158191 ?auto_158194 ) ) ( not ( = ?auto_158192 ?auto_158194 ) ) ( not ( = ?auto_158193 ?auto_158194 ) ) ( ON ?auto_158194 ?auto_158193 ) ( CLEAR ?auto_158194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_158186 ?auto_158187 ?auto_158188 ?auto_158189 ?auto_158190 ?auto_158191 ?auto_158192 ?auto_158193 )
      ( MAKE-7PILE ?auto_158186 ?auto_158187 ?auto_158188 ?auto_158189 ?auto_158190 ?auto_158191 ?auto_158192 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158197 - BLOCK
      ?auto_158198 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_158198 ) ( CLEAR ?auto_158197 ) ( ON-TABLE ?auto_158197 ) ( not ( = ?auto_158197 ?auto_158198 ) ) )
    :subtasks
    ( ( !STACK ?auto_158198 ?auto_158197 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158199 - BLOCK
      ?auto_158200 - BLOCK
    )
    :vars
    (
      ?auto_158201 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_158199 ) ( ON-TABLE ?auto_158199 ) ( not ( = ?auto_158199 ?auto_158200 ) ) ( ON ?auto_158200 ?auto_158201 ) ( CLEAR ?auto_158200 ) ( HAND-EMPTY ) ( not ( = ?auto_158199 ?auto_158201 ) ) ( not ( = ?auto_158200 ?auto_158201 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158200 ?auto_158201 )
      ( MAKE-2PILE ?auto_158199 ?auto_158200 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158202 - BLOCK
      ?auto_158203 - BLOCK
    )
    :vars
    (
      ?auto_158204 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158202 ?auto_158203 ) ) ( ON ?auto_158203 ?auto_158204 ) ( CLEAR ?auto_158203 ) ( not ( = ?auto_158202 ?auto_158204 ) ) ( not ( = ?auto_158203 ?auto_158204 ) ) ( HOLDING ?auto_158202 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158202 )
      ( MAKE-2PILE ?auto_158202 ?auto_158203 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158205 - BLOCK
      ?auto_158206 - BLOCK
    )
    :vars
    (
      ?auto_158207 - BLOCK
      ?auto_158211 - BLOCK
      ?auto_158213 - BLOCK
      ?auto_158208 - BLOCK
      ?auto_158212 - BLOCK
      ?auto_158209 - BLOCK
      ?auto_158210 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158205 ?auto_158206 ) ) ( ON ?auto_158206 ?auto_158207 ) ( not ( = ?auto_158205 ?auto_158207 ) ) ( not ( = ?auto_158206 ?auto_158207 ) ) ( ON ?auto_158205 ?auto_158206 ) ( CLEAR ?auto_158205 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158211 ) ( ON ?auto_158213 ?auto_158211 ) ( ON ?auto_158208 ?auto_158213 ) ( ON ?auto_158212 ?auto_158208 ) ( ON ?auto_158209 ?auto_158212 ) ( ON ?auto_158210 ?auto_158209 ) ( ON ?auto_158207 ?auto_158210 ) ( not ( = ?auto_158211 ?auto_158213 ) ) ( not ( = ?auto_158211 ?auto_158208 ) ) ( not ( = ?auto_158211 ?auto_158212 ) ) ( not ( = ?auto_158211 ?auto_158209 ) ) ( not ( = ?auto_158211 ?auto_158210 ) ) ( not ( = ?auto_158211 ?auto_158207 ) ) ( not ( = ?auto_158211 ?auto_158206 ) ) ( not ( = ?auto_158211 ?auto_158205 ) ) ( not ( = ?auto_158213 ?auto_158208 ) ) ( not ( = ?auto_158213 ?auto_158212 ) ) ( not ( = ?auto_158213 ?auto_158209 ) ) ( not ( = ?auto_158213 ?auto_158210 ) ) ( not ( = ?auto_158213 ?auto_158207 ) ) ( not ( = ?auto_158213 ?auto_158206 ) ) ( not ( = ?auto_158213 ?auto_158205 ) ) ( not ( = ?auto_158208 ?auto_158212 ) ) ( not ( = ?auto_158208 ?auto_158209 ) ) ( not ( = ?auto_158208 ?auto_158210 ) ) ( not ( = ?auto_158208 ?auto_158207 ) ) ( not ( = ?auto_158208 ?auto_158206 ) ) ( not ( = ?auto_158208 ?auto_158205 ) ) ( not ( = ?auto_158212 ?auto_158209 ) ) ( not ( = ?auto_158212 ?auto_158210 ) ) ( not ( = ?auto_158212 ?auto_158207 ) ) ( not ( = ?auto_158212 ?auto_158206 ) ) ( not ( = ?auto_158212 ?auto_158205 ) ) ( not ( = ?auto_158209 ?auto_158210 ) ) ( not ( = ?auto_158209 ?auto_158207 ) ) ( not ( = ?auto_158209 ?auto_158206 ) ) ( not ( = ?auto_158209 ?auto_158205 ) ) ( not ( = ?auto_158210 ?auto_158207 ) ) ( not ( = ?auto_158210 ?auto_158206 ) ) ( not ( = ?auto_158210 ?auto_158205 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_158211 ?auto_158213 ?auto_158208 ?auto_158212 ?auto_158209 ?auto_158210 ?auto_158207 ?auto_158206 )
      ( MAKE-2PILE ?auto_158205 ?auto_158206 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158220 - BLOCK
      ?auto_158221 - BLOCK
      ?auto_158222 - BLOCK
      ?auto_158223 - BLOCK
      ?auto_158224 - BLOCK
      ?auto_158225 - BLOCK
    )
    :vars
    (
      ?auto_158226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158226 ?auto_158225 ) ( CLEAR ?auto_158226 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158220 ) ( ON ?auto_158221 ?auto_158220 ) ( ON ?auto_158222 ?auto_158221 ) ( ON ?auto_158223 ?auto_158222 ) ( ON ?auto_158224 ?auto_158223 ) ( ON ?auto_158225 ?auto_158224 ) ( not ( = ?auto_158220 ?auto_158221 ) ) ( not ( = ?auto_158220 ?auto_158222 ) ) ( not ( = ?auto_158220 ?auto_158223 ) ) ( not ( = ?auto_158220 ?auto_158224 ) ) ( not ( = ?auto_158220 ?auto_158225 ) ) ( not ( = ?auto_158220 ?auto_158226 ) ) ( not ( = ?auto_158221 ?auto_158222 ) ) ( not ( = ?auto_158221 ?auto_158223 ) ) ( not ( = ?auto_158221 ?auto_158224 ) ) ( not ( = ?auto_158221 ?auto_158225 ) ) ( not ( = ?auto_158221 ?auto_158226 ) ) ( not ( = ?auto_158222 ?auto_158223 ) ) ( not ( = ?auto_158222 ?auto_158224 ) ) ( not ( = ?auto_158222 ?auto_158225 ) ) ( not ( = ?auto_158222 ?auto_158226 ) ) ( not ( = ?auto_158223 ?auto_158224 ) ) ( not ( = ?auto_158223 ?auto_158225 ) ) ( not ( = ?auto_158223 ?auto_158226 ) ) ( not ( = ?auto_158224 ?auto_158225 ) ) ( not ( = ?auto_158224 ?auto_158226 ) ) ( not ( = ?auto_158225 ?auto_158226 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158226 ?auto_158225 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158227 - BLOCK
      ?auto_158228 - BLOCK
      ?auto_158229 - BLOCK
      ?auto_158230 - BLOCK
      ?auto_158231 - BLOCK
      ?auto_158232 - BLOCK
    )
    :vars
    (
      ?auto_158233 - BLOCK
      ?auto_158234 - BLOCK
      ?auto_158235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158233 ?auto_158232 ) ( CLEAR ?auto_158233 ) ( ON-TABLE ?auto_158227 ) ( ON ?auto_158228 ?auto_158227 ) ( ON ?auto_158229 ?auto_158228 ) ( ON ?auto_158230 ?auto_158229 ) ( ON ?auto_158231 ?auto_158230 ) ( ON ?auto_158232 ?auto_158231 ) ( not ( = ?auto_158227 ?auto_158228 ) ) ( not ( = ?auto_158227 ?auto_158229 ) ) ( not ( = ?auto_158227 ?auto_158230 ) ) ( not ( = ?auto_158227 ?auto_158231 ) ) ( not ( = ?auto_158227 ?auto_158232 ) ) ( not ( = ?auto_158227 ?auto_158233 ) ) ( not ( = ?auto_158228 ?auto_158229 ) ) ( not ( = ?auto_158228 ?auto_158230 ) ) ( not ( = ?auto_158228 ?auto_158231 ) ) ( not ( = ?auto_158228 ?auto_158232 ) ) ( not ( = ?auto_158228 ?auto_158233 ) ) ( not ( = ?auto_158229 ?auto_158230 ) ) ( not ( = ?auto_158229 ?auto_158231 ) ) ( not ( = ?auto_158229 ?auto_158232 ) ) ( not ( = ?auto_158229 ?auto_158233 ) ) ( not ( = ?auto_158230 ?auto_158231 ) ) ( not ( = ?auto_158230 ?auto_158232 ) ) ( not ( = ?auto_158230 ?auto_158233 ) ) ( not ( = ?auto_158231 ?auto_158232 ) ) ( not ( = ?auto_158231 ?auto_158233 ) ) ( not ( = ?auto_158232 ?auto_158233 ) ) ( HOLDING ?auto_158234 ) ( CLEAR ?auto_158235 ) ( not ( = ?auto_158227 ?auto_158234 ) ) ( not ( = ?auto_158227 ?auto_158235 ) ) ( not ( = ?auto_158228 ?auto_158234 ) ) ( not ( = ?auto_158228 ?auto_158235 ) ) ( not ( = ?auto_158229 ?auto_158234 ) ) ( not ( = ?auto_158229 ?auto_158235 ) ) ( not ( = ?auto_158230 ?auto_158234 ) ) ( not ( = ?auto_158230 ?auto_158235 ) ) ( not ( = ?auto_158231 ?auto_158234 ) ) ( not ( = ?auto_158231 ?auto_158235 ) ) ( not ( = ?auto_158232 ?auto_158234 ) ) ( not ( = ?auto_158232 ?auto_158235 ) ) ( not ( = ?auto_158233 ?auto_158234 ) ) ( not ( = ?auto_158233 ?auto_158235 ) ) ( not ( = ?auto_158234 ?auto_158235 ) ) )
    :subtasks
    ( ( !STACK ?auto_158234 ?auto_158235 )
      ( MAKE-6PILE ?auto_158227 ?auto_158228 ?auto_158229 ?auto_158230 ?auto_158231 ?auto_158232 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_159567 - BLOCK
      ?auto_159568 - BLOCK
      ?auto_159569 - BLOCK
      ?auto_159570 - BLOCK
      ?auto_159571 - BLOCK
      ?auto_159572 - BLOCK
    )
    :vars
    (
      ?auto_159573 - BLOCK
      ?auto_159574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159573 ?auto_159572 ) ( ON-TABLE ?auto_159567 ) ( ON ?auto_159568 ?auto_159567 ) ( ON ?auto_159569 ?auto_159568 ) ( ON ?auto_159570 ?auto_159569 ) ( ON ?auto_159571 ?auto_159570 ) ( ON ?auto_159572 ?auto_159571 ) ( not ( = ?auto_159567 ?auto_159568 ) ) ( not ( = ?auto_159567 ?auto_159569 ) ) ( not ( = ?auto_159567 ?auto_159570 ) ) ( not ( = ?auto_159567 ?auto_159571 ) ) ( not ( = ?auto_159567 ?auto_159572 ) ) ( not ( = ?auto_159567 ?auto_159573 ) ) ( not ( = ?auto_159568 ?auto_159569 ) ) ( not ( = ?auto_159568 ?auto_159570 ) ) ( not ( = ?auto_159568 ?auto_159571 ) ) ( not ( = ?auto_159568 ?auto_159572 ) ) ( not ( = ?auto_159568 ?auto_159573 ) ) ( not ( = ?auto_159569 ?auto_159570 ) ) ( not ( = ?auto_159569 ?auto_159571 ) ) ( not ( = ?auto_159569 ?auto_159572 ) ) ( not ( = ?auto_159569 ?auto_159573 ) ) ( not ( = ?auto_159570 ?auto_159571 ) ) ( not ( = ?auto_159570 ?auto_159572 ) ) ( not ( = ?auto_159570 ?auto_159573 ) ) ( not ( = ?auto_159571 ?auto_159572 ) ) ( not ( = ?auto_159571 ?auto_159573 ) ) ( not ( = ?auto_159572 ?auto_159573 ) ) ( not ( = ?auto_159567 ?auto_159574 ) ) ( not ( = ?auto_159568 ?auto_159574 ) ) ( not ( = ?auto_159569 ?auto_159574 ) ) ( not ( = ?auto_159570 ?auto_159574 ) ) ( not ( = ?auto_159571 ?auto_159574 ) ) ( not ( = ?auto_159572 ?auto_159574 ) ) ( not ( = ?auto_159573 ?auto_159574 ) ) ( ON ?auto_159574 ?auto_159573 ) ( CLEAR ?auto_159574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_159567 ?auto_159568 ?auto_159569 ?auto_159570 ?auto_159571 ?auto_159572 ?auto_159573 )
      ( MAKE-6PILE ?auto_159567 ?auto_159568 ?auto_159569 ?auto_159570 ?auto_159571 ?auto_159572 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158245 - BLOCK
      ?auto_158246 - BLOCK
      ?auto_158247 - BLOCK
      ?auto_158248 - BLOCK
      ?auto_158249 - BLOCK
      ?auto_158250 - BLOCK
    )
    :vars
    (
      ?auto_158253 - BLOCK
      ?auto_158252 - BLOCK
      ?auto_158251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158253 ?auto_158250 ) ( ON-TABLE ?auto_158245 ) ( ON ?auto_158246 ?auto_158245 ) ( ON ?auto_158247 ?auto_158246 ) ( ON ?auto_158248 ?auto_158247 ) ( ON ?auto_158249 ?auto_158248 ) ( ON ?auto_158250 ?auto_158249 ) ( not ( = ?auto_158245 ?auto_158246 ) ) ( not ( = ?auto_158245 ?auto_158247 ) ) ( not ( = ?auto_158245 ?auto_158248 ) ) ( not ( = ?auto_158245 ?auto_158249 ) ) ( not ( = ?auto_158245 ?auto_158250 ) ) ( not ( = ?auto_158245 ?auto_158253 ) ) ( not ( = ?auto_158246 ?auto_158247 ) ) ( not ( = ?auto_158246 ?auto_158248 ) ) ( not ( = ?auto_158246 ?auto_158249 ) ) ( not ( = ?auto_158246 ?auto_158250 ) ) ( not ( = ?auto_158246 ?auto_158253 ) ) ( not ( = ?auto_158247 ?auto_158248 ) ) ( not ( = ?auto_158247 ?auto_158249 ) ) ( not ( = ?auto_158247 ?auto_158250 ) ) ( not ( = ?auto_158247 ?auto_158253 ) ) ( not ( = ?auto_158248 ?auto_158249 ) ) ( not ( = ?auto_158248 ?auto_158250 ) ) ( not ( = ?auto_158248 ?auto_158253 ) ) ( not ( = ?auto_158249 ?auto_158250 ) ) ( not ( = ?auto_158249 ?auto_158253 ) ) ( not ( = ?auto_158250 ?auto_158253 ) ) ( not ( = ?auto_158245 ?auto_158252 ) ) ( not ( = ?auto_158245 ?auto_158251 ) ) ( not ( = ?auto_158246 ?auto_158252 ) ) ( not ( = ?auto_158246 ?auto_158251 ) ) ( not ( = ?auto_158247 ?auto_158252 ) ) ( not ( = ?auto_158247 ?auto_158251 ) ) ( not ( = ?auto_158248 ?auto_158252 ) ) ( not ( = ?auto_158248 ?auto_158251 ) ) ( not ( = ?auto_158249 ?auto_158252 ) ) ( not ( = ?auto_158249 ?auto_158251 ) ) ( not ( = ?auto_158250 ?auto_158252 ) ) ( not ( = ?auto_158250 ?auto_158251 ) ) ( not ( = ?auto_158253 ?auto_158252 ) ) ( not ( = ?auto_158253 ?auto_158251 ) ) ( not ( = ?auto_158252 ?auto_158251 ) ) ( ON ?auto_158252 ?auto_158253 ) ( CLEAR ?auto_158252 ) ( HOLDING ?auto_158251 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158251 )
      ( MAKE-6PILE ?auto_158245 ?auto_158246 ?auto_158247 ?auto_158248 ?auto_158249 ?auto_158250 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158254 - BLOCK
      ?auto_158255 - BLOCK
      ?auto_158256 - BLOCK
      ?auto_158257 - BLOCK
      ?auto_158258 - BLOCK
      ?auto_158259 - BLOCK
    )
    :vars
    (
      ?auto_158261 - BLOCK
      ?auto_158260 - BLOCK
      ?auto_158262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158261 ?auto_158259 ) ( ON-TABLE ?auto_158254 ) ( ON ?auto_158255 ?auto_158254 ) ( ON ?auto_158256 ?auto_158255 ) ( ON ?auto_158257 ?auto_158256 ) ( ON ?auto_158258 ?auto_158257 ) ( ON ?auto_158259 ?auto_158258 ) ( not ( = ?auto_158254 ?auto_158255 ) ) ( not ( = ?auto_158254 ?auto_158256 ) ) ( not ( = ?auto_158254 ?auto_158257 ) ) ( not ( = ?auto_158254 ?auto_158258 ) ) ( not ( = ?auto_158254 ?auto_158259 ) ) ( not ( = ?auto_158254 ?auto_158261 ) ) ( not ( = ?auto_158255 ?auto_158256 ) ) ( not ( = ?auto_158255 ?auto_158257 ) ) ( not ( = ?auto_158255 ?auto_158258 ) ) ( not ( = ?auto_158255 ?auto_158259 ) ) ( not ( = ?auto_158255 ?auto_158261 ) ) ( not ( = ?auto_158256 ?auto_158257 ) ) ( not ( = ?auto_158256 ?auto_158258 ) ) ( not ( = ?auto_158256 ?auto_158259 ) ) ( not ( = ?auto_158256 ?auto_158261 ) ) ( not ( = ?auto_158257 ?auto_158258 ) ) ( not ( = ?auto_158257 ?auto_158259 ) ) ( not ( = ?auto_158257 ?auto_158261 ) ) ( not ( = ?auto_158258 ?auto_158259 ) ) ( not ( = ?auto_158258 ?auto_158261 ) ) ( not ( = ?auto_158259 ?auto_158261 ) ) ( not ( = ?auto_158254 ?auto_158260 ) ) ( not ( = ?auto_158254 ?auto_158262 ) ) ( not ( = ?auto_158255 ?auto_158260 ) ) ( not ( = ?auto_158255 ?auto_158262 ) ) ( not ( = ?auto_158256 ?auto_158260 ) ) ( not ( = ?auto_158256 ?auto_158262 ) ) ( not ( = ?auto_158257 ?auto_158260 ) ) ( not ( = ?auto_158257 ?auto_158262 ) ) ( not ( = ?auto_158258 ?auto_158260 ) ) ( not ( = ?auto_158258 ?auto_158262 ) ) ( not ( = ?auto_158259 ?auto_158260 ) ) ( not ( = ?auto_158259 ?auto_158262 ) ) ( not ( = ?auto_158261 ?auto_158260 ) ) ( not ( = ?auto_158261 ?auto_158262 ) ) ( not ( = ?auto_158260 ?auto_158262 ) ) ( ON ?auto_158260 ?auto_158261 ) ( ON ?auto_158262 ?auto_158260 ) ( CLEAR ?auto_158262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_158254 ?auto_158255 ?auto_158256 ?auto_158257 ?auto_158258 ?auto_158259 ?auto_158261 ?auto_158260 )
      ( MAKE-6PILE ?auto_158254 ?auto_158255 ?auto_158256 ?auto_158257 ?auto_158258 ?auto_158259 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158266 - BLOCK
      ?auto_158267 - BLOCK
      ?auto_158268 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_158268 ) ( CLEAR ?auto_158267 ) ( ON-TABLE ?auto_158266 ) ( ON ?auto_158267 ?auto_158266 ) ( not ( = ?auto_158266 ?auto_158267 ) ) ( not ( = ?auto_158266 ?auto_158268 ) ) ( not ( = ?auto_158267 ?auto_158268 ) ) )
    :subtasks
    ( ( !STACK ?auto_158268 ?auto_158267 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158269 - BLOCK
      ?auto_158270 - BLOCK
      ?auto_158271 - BLOCK
    )
    :vars
    (
      ?auto_158272 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_158270 ) ( ON-TABLE ?auto_158269 ) ( ON ?auto_158270 ?auto_158269 ) ( not ( = ?auto_158269 ?auto_158270 ) ) ( not ( = ?auto_158269 ?auto_158271 ) ) ( not ( = ?auto_158270 ?auto_158271 ) ) ( ON ?auto_158271 ?auto_158272 ) ( CLEAR ?auto_158271 ) ( HAND-EMPTY ) ( not ( = ?auto_158269 ?auto_158272 ) ) ( not ( = ?auto_158270 ?auto_158272 ) ) ( not ( = ?auto_158271 ?auto_158272 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158271 ?auto_158272 )
      ( MAKE-3PILE ?auto_158269 ?auto_158270 ?auto_158271 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158273 - BLOCK
      ?auto_158274 - BLOCK
      ?auto_158275 - BLOCK
    )
    :vars
    (
      ?auto_158276 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158273 ) ( not ( = ?auto_158273 ?auto_158274 ) ) ( not ( = ?auto_158273 ?auto_158275 ) ) ( not ( = ?auto_158274 ?auto_158275 ) ) ( ON ?auto_158275 ?auto_158276 ) ( CLEAR ?auto_158275 ) ( not ( = ?auto_158273 ?auto_158276 ) ) ( not ( = ?auto_158274 ?auto_158276 ) ) ( not ( = ?auto_158275 ?auto_158276 ) ) ( HOLDING ?auto_158274 ) ( CLEAR ?auto_158273 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_158273 ?auto_158274 )
      ( MAKE-3PILE ?auto_158273 ?auto_158274 ?auto_158275 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158277 - BLOCK
      ?auto_158278 - BLOCK
      ?auto_158279 - BLOCK
    )
    :vars
    (
      ?auto_158280 - BLOCK
      ?auto_158284 - BLOCK
      ?auto_158285 - BLOCK
      ?auto_158281 - BLOCK
      ?auto_158283 - BLOCK
      ?auto_158282 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158277 ) ( not ( = ?auto_158277 ?auto_158278 ) ) ( not ( = ?auto_158277 ?auto_158279 ) ) ( not ( = ?auto_158278 ?auto_158279 ) ) ( ON ?auto_158279 ?auto_158280 ) ( not ( = ?auto_158277 ?auto_158280 ) ) ( not ( = ?auto_158278 ?auto_158280 ) ) ( not ( = ?auto_158279 ?auto_158280 ) ) ( CLEAR ?auto_158277 ) ( ON ?auto_158278 ?auto_158279 ) ( CLEAR ?auto_158278 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158284 ) ( ON ?auto_158285 ?auto_158284 ) ( ON ?auto_158281 ?auto_158285 ) ( ON ?auto_158283 ?auto_158281 ) ( ON ?auto_158282 ?auto_158283 ) ( ON ?auto_158280 ?auto_158282 ) ( not ( = ?auto_158284 ?auto_158285 ) ) ( not ( = ?auto_158284 ?auto_158281 ) ) ( not ( = ?auto_158284 ?auto_158283 ) ) ( not ( = ?auto_158284 ?auto_158282 ) ) ( not ( = ?auto_158284 ?auto_158280 ) ) ( not ( = ?auto_158284 ?auto_158279 ) ) ( not ( = ?auto_158284 ?auto_158278 ) ) ( not ( = ?auto_158285 ?auto_158281 ) ) ( not ( = ?auto_158285 ?auto_158283 ) ) ( not ( = ?auto_158285 ?auto_158282 ) ) ( not ( = ?auto_158285 ?auto_158280 ) ) ( not ( = ?auto_158285 ?auto_158279 ) ) ( not ( = ?auto_158285 ?auto_158278 ) ) ( not ( = ?auto_158281 ?auto_158283 ) ) ( not ( = ?auto_158281 ?auto_158282 ) ) ( not ( = ?auto_158281 ?auto_158280 ) ) ( not ( = ?auto_158281 ?auto_158279 ) ) ( not ( = ?auto_158281 ?auto_158278 ) ) ( not ( = ?auto_158283 ?auto_158282 ) ) ( not ( = ?auto_158283 ?auto_158280 ) ) ( not ( = ?auto_158283 ?auto_158279 ) ) ( not ( = ?auto_158283 ?auto_158278 ) ) ( not ( = ?auto_158282 ?auto_158280 ) ) ( not ( = ?auto_158282 ?auto_158279 ) ) ( not ( = ?auto_158282 ?auto_158278 ) ) ( not ( = ?auto_158277 ?auto_158284 ) ) ( not ( = ?auto_158277 ?auto_158285 ) ) ( not ( = ?auto_158277 ?auto_158281 ) ) ( not ( = ?auto_158277 ?auto_158283 ) ) ( not ( = ?auto_158277 ?auto_158282 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_158284 ?auto_158285 ?auto_158281 ?auto_158283 ?auto_158282 ?auto_158280 ?auto_158279 )
      ( MAKE-3PILE ?auto_158277 ?auto_158278 ?auto_158279 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158286 - BLOCK
      ?auto_158287 - BLOCK
      ?auto_158288 - BLOCK
    )
    :vars
    (
      ?auto_158289 - BLOCK
      ?auto_158291 - BLOCK
      ?auto_158290 - BLOCK
      ?auto_158294 - BLOCK
      ?auto_158292 - BLOCK
      ?auto_158293 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158286 ?auto_158287 ) ) ( not ( = ?auto_158286 ?auto_158288 ) ) ( not ( = ?auto_158287 ?auto_158288 ) ) ( ON ?auto_158288 ?auto_158289 ) ( not ( = ?auto_158286 ?auto_158289 ) ) ( not ( = ?auto_158287 ?auto_158289 ) ) ( not ( = ?auto_158288 ?auto_158289 ) ) ( ON ?auto_158287 ?auto_158288 ) ( CLEAR ?auto_158287 ) ( ON-TABLE ?auto_158291 ) ( ON ?auto_158290 ?auto_158291 ) ( ON ?auto_158294 ?auto_158290 ) ( ON ?auto_158292 ?auto_158294 ) ( ON ?auto_158293 ?auto_158292 ) ( ON ?auto_158289 ?auto_158293 ) ( not ( = ?auto_158291 ?auto_158290 ) ) ( not ( = ?auto_158291 ?auto_158294 ) ) ( not ( = ?auto_158291 ?auto_158292 ) ) ( not ( = ?auto_158291 ?auto_158293 ) ) ( not ( = ?auto_158291 ?auto_158289 ) ) ( not ( = ?auto_158291 ?auto_158288 ) ) ( not ( = ?auto_158291 ?auto_158287 ) ) ( not ( = ?auto_158290 ?auto_158294 ) ) ( not ( = ?auto_158290 ?auto_158292 ) ) ( not ( = ?auto_158290 ?auto_158293 ) ) ( not ( = ?auto_158290 ?auto_158289 ) ) ( not ( = ?auto_158290 ?auto_158288 ) ) ( not ( = ?auto_158290 ?auto_158287 ) ) ( not ( = ?auto_158294 ?auto_158292 ) ) ( not ( = ?auto_158294 ?auto_158293 ) ) ( not ( = ?auto_158294 ?auto_158289 ) ) ( not ( = ?auto_158294 ?auto_158288 ) ) ( not ( = ?auto_158294 ?auto_158287 ) ) ( not ( = ?auto_158292 ?auto_158293 ) ) ( not ( = ?auto_158292 ?auto_158289 ) ) ( not ( = ?auto_158292 ?auto_158288 ) ) ( not ( = ?auto_158292 ?auto_158287 ) ) ( not ( = ?auto_158293 ?auto_158289 ) ) ( not ( = ?auto_158293 ?auto_158288 ) ) ( not ( = ?auto_158293 ?auto_158287 ) ) ( not ( = ?auto_158286 ?auto_158291 ) ) ( not ( = ?auto_158286 ?auto_158290 ) ) ( not ( = ?auto_158286 ?auto_158294 ) ) ( not ( = ?auto_158286 ?auto_158292 ) ) ( not ( = ?auto_158286 ?auto_158293 ) ) ( HOLDING ?auto_158286 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158286 )
      ( MAKE-3PILE ?auto_158286 ?auto_158287 ?auto_158288 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158295 - BLOCK
      ?auto_158296 - BLOCK
      ?auto_158297 - BLOCK
    )
    :vars
    (
      ?auto_158298 - BLOCK
      ?auto_158300 - BLOCK
      ?auto_158303 - BLOCK
      ?auto_158301 - BLOCK
      ?auto_158299 - BLOCK
      ?auto_158302 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158295 ?auto_158296 ) ) ( not ( = ?auto_158295 ?auto_158297 ) ) ( not ( = ?auto_158296 ?auto_158297 ) ) ( ON ?auto_158297 ?auto_158298 ) ( not ( = ?auto_158295 ?auto_158298 ) ) ( not ( = ?auto_158296 ?auto_158298 ) ) ( not ( = ?auto_158297 ?auto_158298 ) ) ( ON ?auto_158296 ?auto_158297 ) ( ON-TABLE ?auto_158300 ) ( ON ?auto_158303 ?auto_158300 ) ( ON ?auto_158301 ?auto_158303 ) ( ON ?auto_158299 ?auto_158301 ) ( ON ?auto_158302 ?auto_158299 ) ( ON ?auto_158298 ?auto_158302 ) ( not ( = ?auto_158300 ?auto_158303 ) ) ( not ( = ?auto_158300 ?auto_158301 ) ) ( not ( = ?auto_158300 ?auto_158299 ) ) ( not ( = ?auto_158300 ?auto_158302 ) ) ( not ( = ?auto_158300 ?auto_158298 ) ) ( not ( = ?auto_158300 ?auto_158297 ) ) ( not ( = ?auto_158300 ?auto_158296 ) ) ( not ( = ?auto_158303 ?auto_158301 ) ) ( not ( = ?auto_158303 ?auto_158299 ) ) ( not ( = ?auto_158303 ?auto_158302 ) ) ( not ( = ?auto_158303 ?auto_158298 ) ) ( not ( = ?auto_158303 ?auto_158297 ) ) ( not ( = ?auto_158303 ?auto_158296 ) ) ( not ( = ?auto_158301 ?auto_158299 ) ) ( not ( = ?auto_158301 ?auto_158302 ) ) ( not ( = ?auto_158301 ?auto_158298 ) ) ( not ( = ?auto_158301 ?auto_158297 ) ) ( not ( = ?auto_158301 ?auto_158296 ) ) ( not ( = ?auto_158299 ?auto_158302 ) ) ( not ( = ?auto_158299 ?auto_158298 ) ) ( not ( = ?auto_158299 ?auto_158297 ) ) ( not ( = ?auto_158299 ?auto_158296 ) ) ( not ( = ?auto_158302 ?auto_158298 ) ) ( not ( = ?auto_158302 ?auto_158297 ) ) ( not ( = ?auto_158302 ?auto_158296 ) ) ( not ( = ?auto_158295 ?auto_158300 ) ) ( not ( = ?auto_158295 ?auto_158303 ) ) ( not ( = ?auto_158295 ?auto_158301 ) ) ( not ( = ?auto_158295 ?auto_158299 ) ) ( not ( = ?auto_158295 ?auto_158302 ) ) ( ON ?auto_158295 ?auto_158296 ) ( CLEAR ?auto_158295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_158300 ?auto_158303 ?auto_158301 ?auto_158299 ?auto_158302 ?auto_158298 ?auto_158297 ?auto_158296 )
      ( MAKE-3PILE ?auto_158295 ?auto_158296 ?auto_158297 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158309 - BLOCK
      ?auto_158310 - BLOCK
      ?auto_158311 - BLOCK
      ?auto_158312 - BLOCK
      ?auto_158313 - BLOCK
    )
    :vars
    (
      ?auto_158314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158314 ?auto_158313 ) ( CLEAR ?auto_158314 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158309 ) ( ON ?auto_158310 ?auto_158309 ) ( ON ?auto_158311 ?auto_158310 ) ( ON ?auto_158312 ?auto_158311 ) ( ON ?auto_158313 ?auto_158312 ) ( not ( = ?auto_158309 ?auto_158310 ) ) ( not ( = ?auto_158309 ?auto_158311 ) ) ( not ( = ?auto_158309 ?auto_158312 ) ) ( not ( = ?auto_158309 ?auto_158313 ) ) ( not ( = ?auto_158309 ?auto_158314 ) ) ( not ( = ?auto_158310 ?auto_158311 ) ) ( not ( = ?auto_158310 ?auto_158312 ) ) ( not ( = ?auto_158310 ?auto_158313 ) ) ( not ( = ?auto_158310 ?auto_158314 ) ) ( not ( = ?auto_158311 ?auto_158312 ) ) ( not ( = ?auto_158311 ?auto_158313 ) ) ( not ( = ?auto_158311 ?auto_158314 ) ) ( not ( = ?auto_158312 ?auto_158313 ) ) ( not ( = ?auto_158312 ?auto_158314 ) ) ( not ( = ?auto_158313 ?auto_158314 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158314 ?auto_158313 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158315 - BLOCK
      ?auto_158316 - BLOCK
      ?auto_158317 - BLOCK
      ?auto_158318 - BLOCK
      ?auto_158319 - BLOCK
    )
    :vars
    (
      ?auto_158320 - BLOCK
      ?auto_158321 - BLOCK
      ?auto_158322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158320 ?auto_158319 ) ( CLEAR ?auto_158320 ) ( ON-TABLE ?auto_158315 ) ( ON ?auto_158316 ?auto_158315 ) ( ON ?auto_158317 ?auto_158316 ) ( ON ?auto_158318 ?auto_158317 ) ( ON ?auto_158319 ?auto_158318 ) ( not ( = ?auto_158315 ?auto_158316 ) ) ( not ( = ?auto_158315 ?auto_158317 ) ) ( not ( = ?auto_158315 ?auto_158318 ) ) ( not ( = ?auto_158315 ?auto_158319 ) ) ( not ( = ?auto_158315 ?auto_158320 ) ) ( not ( = ?auto_158316 ?auto_158317 ) ) ( not ( = ?auto_158316 ?auto_158318 ) ) ( not ( = ?auto_158316 ?auto_158319 ) ) ( not ( = ?auto_158316 ?auto_158320 ) ) ( not ( = ?auto_158317 ?auto_158318 ) ) ( not ( = ?auto_158317 ?auto_158319 ) ) ( not ( = ?auto_158317 ?auto_158320 ) ) ( not ( = ?auto_158318 ?auto_158319 ) ) ( not ( = ?auto_158318 ?auto_158320 ) ) ( not ( = ?auto_158319 ?auto_158320 ) ) ( HOLDING ?auto_158321 ) ( CLEAR ?auto_158322 ) ( not ( = ?auto_158315 ?auto_158321 ) ) ( not ( = ?auto_158315 ?auto_158322 ) ) ( not ( = ?auto_158316 ?auto_158321 ) ) ( not ( = ?auto_158316 ?auto_158322 ) ) ( not ( = ?auto_158317 ?auto_158321 ) ) ( not ( = ?auto_158317 ?auto_158322 ) ) ( not ( = ?auto_158318 ?auto_158321 ) ) ( not ( = ?auto_158318 ?auto_158322 ) ) ( not ( = ?auto_158319 ?auto_158321 ) ) ( not ( = ?auto_158319 ?auto_158322 ) ) ( not ( = ?auto_158320 ?auto_158321 ) ) ( not ( = ?auto_158320 ?auto_158322 ) ) ( not ( = ?auto_158321 ?auto_158322 ) ) )
    :subtasks
    ( ( !STACK ?auto_158321 ?auto_158322 )
      ( MAKE-5PILE ?auto_158315 ?auto_158316 ?auto_158317 ?auto_158318 ?auto_158319 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158323 - BLOCK
      ?auto_158324 - BLOCK
      ?auto_158325 - BLOCK
      ?auto_158326 - BLOCK
      ?auto_158327 - BLOCK
    )
    :vars
    (
      ?auto_158330 - BLOCK
      ?auto_158328 - BLOCK
      ?auto_158329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158330 ?auto_158327 ) ( ON-TABLE ?auto_158323 ) ( ON ?auto_158324 ?auto_158323 ) ( ON ?auto_158325 ?auto_158324 ) ( ON ?auto_158326 ?auto_158325 ) ( ON ?auto_158327 ?auto_158326 ) ( not ( = ?auto_158323 ?auto_158324 ) ) ( not ( = ?auto_158323 ?auto_158325 ) ) ( not ( = ?auto_158323 ?auto_158326 ) ) ( not ( = ?auto_158323 ?auto_158327 ) ) ( not ( = ?auto_158323 ?auto_158330 ) ) ( not ( = ?auto_158324 ?auto_158325 ) ) ( not ( = ?auto_158324 ?auto_158326 ) ) ( not ( = ?auto_158324 ?auto_158327 ) ) ( not ( = ?auto_158324 ?auto_158330 ) ) ( not ( = ?auto_158325 ?auto_158326 ) ) ( not ( = ?auto_158325 ?auto_158327 ) ) ( not ( = ?auto_158325 ?auto_158330 ) ) ( not ( = ?auto_158326 ?auto_158327 ) ) ( not ( = ?auto_158326 ?auto_158330 ) ) ( not ( = ?auto_158327 ?auto_158330 ) ) ( CLEAR ?auto_158328 ) ( not ( = ?auto_158323 ?auto_158329 ) ) ( not ( = ?auto_158323 ?auto_158328 ) ) ( not ( = ?auto_158324 ?auto_158329 ) ) ( not ( = ?auto_158324 ?auto_158328 ) ) ( not ( = ?auto_158325 ?auto_158329 ) ) ( not ( = ?auto_158325 ?auto_158328 ) ) ( not ( = ?auto_158326 ?auto_158329 ) ) ( not ( = ?auto_158326 ?auto_158328 ) ) ( not ( = ?auto_158327 ?auto_158329 ) ) ( not ( = ?auto_158327 ?auto_158328 ) ) ( not ( = ?auto_158330 ?auto_158329 ) ) ( not ( = ?auto_158330 ?auto_158328 ) ) ( not ( = ?auto_158329 ?auto_158328 ) ) ( ON ?auto_158329 ?auto_158330 ) ( CLEAR ?auto_158329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_158323 ?auto_158324 ?auto_158325 ?auto_158326 ?auto_158327 ?auto_158330 )
      ( MAKE-5PILE ?auto_158323 ?auto_158324 ?auto_158325 ?auto_158326 ?auto_158327 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158331 - BLOCK
      ?auto_158332 - BLOCK
      ?auto_158333 - BLOCK
      ?auto_158334 - BLOCK
      ?auto_158335 - BLOCK
    )
    :vars
    (
      ?auto_158336 - BLOCK
      ?auto_158338 - BLOCK
      ?auto_158337 - BLOCK
      ?auto_158339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158336 ?auto_158335 ) ( ON-TABLE ?auto_158331 ) ( ON ?auto_158332 ?auto_158331 ) ( ON ?auto_158333 ?auto_158332 ) ( ON ?auto_158334 ?auto_158333 ) ( ON ?auto_158335 ?auto_158334 ) ( not ( = ?auto_158331 ?auto_158332 ) ) ( not ( = ?auto_158331 ?auto_158333 ) ) ( not ( = ?auto_158331 ?auto_158334 ) ) ( not ( = ?auto_158331 ?auto_158335 ) ) ( not ( = ?auto_158331 ?auto_158336 ) ) ( not ( = ?auto_158332 ?auto_158333 ) ) ( not ( = ?auto_158332 ?auto_158334 ) ) ( not ( = ?auto_158332 ?auto_158335 ) ) ( not ( = ?auto_158332 ?auto_158336 ) ) ( not ( = ?auto_158333 ?auto_158334 ) ) ( not ( = ?auto_158333 ?auto_158335 ) ) ( not ( = ?auto_158333 ?auto_158336 ) ) ( not ( = ?auto_158334 ?auto_158335 ) ) ( not ( = ?auto_158334 ?auto_158336 ) ) ( not ( = ?auto_158335 ?auto_158336 ) ) ( not ( = ?auto_158331 ?auto_158338 ) ) ( not ( = ?auto_158331 ?auto_158337 ) ) ( not ( = ?auto_158332 ?auto_158338 ) ) ( not ( = ?auto_158332 ?auto_158337 ) ) ( not ( = ?auto_158333 ?auto_158338 ) ) ( not ( = ?auto_158333 ?auto_158337 ) ) ( not ( = ?auto_158334 ?auto_158338 ) ) ( not ( = ?auto_158334 ?auto_158337 ) ) ( not ( = ?auto_158335 ?auto_158338 ) ) ( not ( = ?auto_158335 ?auto_158337 ) ) ( not ( = ?auto_158336 ?auto_158338 ) ) ( not ( = ?auto_158336 ?auto_158337 ) ) ( not ( = ?auto_158338 ?auto_158337 ) ) ( ON ?auto_158338 ?auto_158336 ) ( CLEAR ?auto_158338 ) ( HOLDING ?auto_158337 ) ( CLEAR ?auto_158339 ) ( ON-TABLE ?auto_158339 ) ( not ( = ?auto_158339 ?auto_158337 ) ) ( not ( = ?auto_158331 ?auto_158339 ) ) ( not ( = ?auto_158332 ?auto_158339 ) ) ( not ( = ?auto_158333 ?auto_158339 ) ) ( not ( = ?auto_158334 ?auto_158339 ) ) ( not ( = ?auto_158335 ?auto_158339 ) ) ( not ( = ?auto_158336 ?auto_158339 ) ) ( not ( = ?auto_158338 ?auto_158339 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_158339 ?auto_158337 )
      ( MAKE-5PILE ?auto_158331 ?auto_158332 ?auto_158333 ?auto_158334 ?auto_158335 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_159859 - BLOCK
      ?auto_159860 - BLOCK
      ?auto_159861 - BLOCK
      ?auto_159862 - BLOCK
      ?auto_159863 - BLOCK
    )
    :vars
    (
      ?auto_159866 - BLOCK
      ?auto_159864 - BLOCK
      ?auto_159865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159866 ?auto_159863 ) ( ON-TABLE ?auto_159859 ) ( ON ?auto_159860 ?auto_159859 ) ( ON ?auto_159861 ?auto_159860 ) ( ON ?auto_159862 ?auto_159861 ) ( ON ?auto_159863 ?auto_159862 ) ( not ( = ?auto_159859 ?auto_159860 ) ) ( not ( = ?auto_159859 ?auto_159861 ) ) ( not ( = ?auto_159859 ?auto_159862 ) ) ( not ( = ?auto_159859 ?auto_159863 ) ) ( not ( = ?auto_159859 ?auto_159866 ) ) ( not ( = ?auto_159860 ?auto_159861 ) ) ( not ( = ?auto_159860 ?auto_159862 ) ) ( not ( = ?auto_159860 ?auto_159863 ) ) ( not ( = ?auto_159860 ?auto_159866 ) ) ( not ( = ?auto_159861 ?auto_159862 ) ) ( not ( = ?auto_159861 ?auto_159863 ) ) ( not ( = ?auto_159861 ?auto_159866 ) ) ( not ( = ?auto_159862 ?auto_159863 ) ) ( not ( = ?auto_159862 ?auto_159866 ) ) ( not ( = ?auto_159863 ?auto_159866 ) ) ( not ( = ?auto_159859 ?auto_159864 ) ) ( not ( = ?auto_159859 ?auto_159865 ) ) ( not ( = ?auto_159860 ?auto_159864 ) ) ( not ( = ?auto_159860 ?auto_159865 ) ) ( not ( = ?auto_159861 ?auto_159864 ) ) ( not ( = ?auto_159861 ?auto_159865 ) ) ( not ( = ?auto_159862 ?auto_159864 ) ) ( not ( = ?auto_159862 ?auto_159865 ) ) ( not ( = ?auto_159863 ?auto_159864 ) ) ( not ( = ?auto_159863 ?auto_159865 ) ) ( not ( = ?auto_159866 ?auto_159864 ) ) ( not ( = ?auto_159866 ?auto_159865 ) ) ( not ( = ?auto_159864 ?auto_159865 ) ) ( ON ?auto_159864 ?auto_159866 ) ( ON ?auto_159865 ?auto_159864 ) ( CLEAR ?auto_159865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_159859 ?auto_159860 ?auto_159861 ?auto_159862 ?auto_159863 ?auto_159866 ?auto_159864 )
      ( MAKE-5PILE ?auto_159859 ?auto_159860 ?auto_159861 ?auto_159862 ?auto_159863 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158349 - BLOCK
      ?auto_158350 - BLOCK
      ?auto_158351 - BLOCK
      ?auto_158352 - BLOCK
      ?auto_158353 - BLOCK
    )
    :vars
    (
      ?auto_158355 - BLOCK
      ?auto_158354 - BLOCK
      ?auto_158356 - BLOCK
      ?auto_158357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158355 ?auto_158353 ) ( ON-TABLE ?auto_158349 ) ( ON ?auto_158350 ?auto_158349 ) ( ON ?auto_158351 ?auto_158350 ) ( ON ?auto_158352 ?auto_158351 ) ( ON ?auto_158353 ?auto_158352 ) ( not ( = ?auto_158349 ?auto_158350 ) ) ( not ( = ?auto_158349 ?auto_158351 ) ) ( not ( = ?auto_158349 ?auto_158352 ) ) ( not ( = ?auto_158349 ?auto_158353 ) ) ( not ( = ?auto_158349 ?auto_158355 ) ) ( not ( = ?auto_158350 ?auto_158351 ) ) ( not ( = ?auto_158350 ?auto_158352 ) ) ( not ( = ?auto_158350 ?auto_158353 ) ) ( not ( = ?auto_158350 ?auto_158355 ) ) ( not ( = ?auto_158351 ?auto_158352 ) ) ( not ( = ?auto_158351 ?auto_158353 ) ) ( not ( = ?auto_158351 ?auto_158355 ) ) ( not ( = ?auto_158352 ?auto_158353 ) ) ( not ( = ?auto_158352 ?auto_158355 ) ) ( not ( = ?auto_158353 ?auto_158355 ) ) ( not ( = ?auto_158349 ?auto_158354 ) ) ( not ( = ?auto_158349 ?auto_158356 ) ) ( not ( = ?auto_158350 ?auto_158354 ) ) ( not ( = ?auto_158350 ?auto_158356 ) ) ( not ( = ?auto_158351 ?auto_158354 ) ) ( not ( = ?auto_158351 ?auto_158356 ) ) ( not ( = ?auto_158352 ?auto_158354 ) ) ( not ( = ?auto_158352 ?auto_158356 ) ) ( not ( = ?auto_158353 ?auto_158354 ) ) ( not ( = ?auto_158353 ?auto_158356 ) ) ( not ( = ?auto_158355 ?auto_158354 ) ) ( not ( = ?auto_158355 ?auto_158356 ) ) ( not ( = ?auto_158354 ?auto_158356 ) ) ( ON ?auto_158354 ?auto_158355 ) ( not ( = ?auto_158357 ?auto_158356 ) ) ( not ( = ?auto_158349 ?auto_158357 ) ) ( not ( = ?auto_158350 ?auto_158357 ) ) ( not ( = ?auto_158351 ?auto_158357 ) ) ( not ( = ?auto_158352 ?auto_158357 ) ) ( not ( = ?auto_158353 ?auto_158357 ) ) ( not ( = ?auto_158355 ?auto_158357 ) ) ( not ( = ?auto_158354 ?auto_158357 ) ) ( ON ?auto_158356 ?auto_158354 ) ( CLEAR ?auto_158356 ) ( HOLDING ?auto_158357 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158357 )
      ( MAKE-5PILE ?auto_158349 ?auto_158350 ?auto_158351 ?auto_158352 ?auto_158353 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158358 - BLOCK
      ?auto_158359 - BLOCK
      ?auto_158360 - BLOCK
      ?auto_158361 - BLOCK
      ?auto_158362 - BLOCK
    )
    :vars
    (
      ?auto_158364 - BLOCK
      ?auto_158365 - BLOCK
      ?auto_158363 - BLOCK
      ?auto_158366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158364 ?auto_158362 ) ( ON-TABLE ?auto_158358 ) ( ON ?auto_158359 ?auto_158358 ) ( ON ?auto_158360 ?auto_158359 ) ( ON ?auto_158361 ?auto_158360 ) ( ON ?auto_158362 ?auto_158361 ) ( not ( = ?auto_158358 ?auto_158359 ) ) ( not ( = ?auto_158358 ?auto_158360 ) ) ( not ( = ?auto_158358 ?auto_158361 ) ) ( not ( = ?auto_158358 ?auto_158362 ) ) ( not ( = ?auto_158358 ?auto_158364 ) ) ( not ( = ?auto_158359 ?auto_158360 ) ) ( not ( = ?auto_158359 ?auto_158361 ) ) ( not ( = ?auto_158359 ?auto_158362 ) ) ( not ( = ?auto_158359 ?auto_158364 ) ) ( not ( = ?auto_158360 ?auto_158361 ) ) ( not ( = ?auto_158360 ?auto_158362 ) ) ( not ( = ?auto_158360 ?auto_158364 ) ) ( not ( = ?auto_158361 ?auto_158362 ) ) ( not ( = ?auto_158361 ?auto_158364 ) ) ( not ( = ?auto_158362 ?auto_158364 ) ) ( not ( = ?auto_158358 ?auto_158365 ) ) ( not ( = ?auto_158358 ?auto_158363 ) ) ( not ( = ?auto_158359 ?auto_158365 ) ) ( not ( = ?auto_158359 ?auto_158363 ) ) ( not ( = ?auto_158360 ?auto_158365 ) ) ( not ( = ?auto_158360 ?auto_158363 ) ) ( not ( = ?auto_158361 ?auto_158365 ) ) ( not ( = ?auto_158361 ?auto_158363 ) ) ( not ( = ?auto_158362 ?auto_158365 ) ) ( not ( = ?auto_158362 ?auto_158363 ) ) ( not ( = ?auto_158364 ?auto_158365 ) ) ( not ( = ?auto_158364 ?auto_158363 ) ) ( not ( = ?auto_158365 ?auto_158363 ) ) ( ON ?auto_158365 ?auto_158364 ) ( not ( = ?auto_158366 ?auto_158363 ) ) ( not ( = ?auto_158358 ?auto_158366 ) ) ( not ( = ?auto_158359 ?auto_158366 ) ) ( not ( = ?auto_158360 ?auto_158366 ) ) ( not ( = ?auto_158361 ?auto_158366 ) ) ( not ( = ?auto_158362 ?auto_158366 ) ) ( not ( = ?auto_158364 ?auto_158366 ) ) ( not ( = ?auto_158365 ?auto_158366 ) ) ( ON ?auto_158363 ?auto_158365 ) ( ON ?auto_158366 ?auto_158363 ) ( CLEAR ?auto_158366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_158358 ?auto_158359 ?auto_158360 ?auto_158361 ?auto_158362 ?auto_158364 ?auto_158365 ?auto_158363 )
      ( MAKE-5PILE ?auto_158358 ?auto_158359 ?auto_158360 ?auto_158361 ?auto_158362 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158371 - BLOCK
      ?auto_158372 - BLOCK
      ?auto_158373 - BLOCK
      ?auto_158374 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_158374 ) ( CLEAR ?auto_158373 ) ( ON-TABLE ?auto_158371 ) ( ON ?auto_158372 ?auto_158371 ) ( ON ?auto_158373 ?auto_158372 ) ( not ( = ?auto_158371 ?auto_158372 ) ) ( not ( = ?auto_158371 ?auto_158373 ) ) ( not ( = ?auto_158371 ?auto_158374 ) ) ( not ( = ?auto_158372 ?auto_158373 ) ) ( not ( = ?auto_158372 ?auto_158374 ) ) ( not ( = ?auto_158373 ?auto_158374 ) ) )
    :subtasks
    ( ( !STACK ?auto_158374 ?auto_158373 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158375 - BLOCK
      ?auto_158376 - BLOCK
      ?auto_158377 - BLOCK
      ?auto_158378 - BLOCK
    )
    :vars
    (
      ?auto_158379 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_158377 ) ( ON-TABLE ?auto_158375 ) ( ON ?auto_158376 ?auto_158375 ) ( ON ?auto_158377 ?auto_158376 ) ( not ( = ?auto_158375 ?auto_158376 ) ) ( not ( = ?auto_158375 ?auto_158377 ) ) ( not ( = ?auto_158375 ?auto_158378 ) ) ( not ( = ?auto_158376 ?auto_158377 ) ) ( not ( = ?auto_158376 ?auto_158378 ) ) ( not ( = ?auto_158377 ?auto_158378 ) ) ( ON ?auto_158378 ?auto_158379 ) ( CLEAR ?auto_158378 ) ( HAND-EMPTY ) ( not ( = ?auto_158375 ?auto_158379 ) ) ( not ( = ?auto_158376 ?auto_158379 ) ) ( not ( = ?auto_158377 ?auto_158379 ) ) ( not ( = ?auto_158378 ?auto_158379 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158378 ?auto_158379 )
      ( MAKE-4PILE ?auto_158375 ?auto_158376 ?auto_158377 ?auto_158378 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158380 - BLOCK
      ?auto_158381 - BLOCK
      ?auto_158382 - BLOCK
      ?auto_158383 - BLOCK
    )
    :vars
    (
      ?auto_158384 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158380 ) ( ON ?auto_158381 ?auto_158380 ) ( not ( = ?auto_158380 ?auto_158381 ) ) ( not ( = ?auto_158380 ?auto_158382 ) ) ( not ( = ?auto_158380 ?auto_158383 ) ) ( not ( = ?auto_158381 ?auto_158382 ) ) ( not ( = ?auto_158381 ?auto_158383 ) ) ( not ( = ?auto_158382 ?auto_158383 ) ) ( ON ?auto_158383 ?auto_158384 ) ( CLEAR ?auto_158383 ) ( not ( = ?auto_158380 ?auto_158384 ) ) ( not ( = ?auto_158381 ?auto_158384 ) ) ( not ( = ?auto_158382 ?auto_158384 ) ) ( not ( = ?auto_158383 ?auto_158384 ) ) ( HOLDING ?auto_158382 ) ( CLEAR ?auto_158381 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_158380 ?auto_158381 ?auto_158382 )
      ( MAKE-4PILE ?auto_158380 ?auto_158381 ?auto_158382 ?auto_158383 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158385 - BLOCK
      ?auto_158386 - BLOCK
      ?auto_158387 - BLOCK
      ?auto_158388 - BLOCK
    )
    :vars
    (
      ?auto_158389 - BLOCK
      ?auto_158393 - BLOCK
      ?auto_158392 - BLOCK
      ?auto_158391 - BLOCK
      ?auto_158390 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158385 ) ( ON ?auto_158386 ?auto_158385 ) ( not ( = ?auto_158385 ?auto_158386 ) ) ( not ( = ?auto_158385 ?auto_158387 ) ) ( not ( = ?auto_158385 ?auto_158388 ) ) ( not ( = ?auto_158386 ?auto_158387 ) ) ( not ( = ?auto_158386 ?auto_158388 ) ) ( not ( = ?auto_158387 ?auto_158388 ) ) ( ON ?auto_158388 ?auto_158389 ) ( not ( = ?auto_158385 ?auto_158389 ) ) ( not ( = ?auto_158386 ?auto_158389 ) ) ( not ( = ?auto_158387 ?auto_158389 ) ) ( not ( = ?auto_158388 ?auto_158389 ) ) ( CLEAR ?auto_158386 ) ( ON ?auto_158387 ?auto_158388 ) ( CLEAR ?auto_158387 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158393 ) ( ON ?auto_158392 ?auto_158393 ) ( ON ?auto_158391 ?auto_158392 ) ( ON ?auto_158390 ?auto_158391 ) ( ON ?auto_158389 ?auto_158390 ) ( not ( = ?auto_158393 ?auto_158392 ) ) ( not ( = ?auto_158393 ?auto_158391 ) ) ( not ( = ?auto_158393 ?auto_158390 ) ) ( not ( = ?auto_158393 ?auto_158389 ) ) ( not ( = ?auto_158393 ?auto_158388 ) ) ( not ( = ?auto_158393 ?auto_158387 ) ) ( not ( = ?auto_158392 ?auto_158391 ) ) ( not ( = ?auto_158392 ?auto_158390 ) ) ( not ( = ?auto_158392 ?auto_158389 ) ) ( not ( = ?auto_158392 ?auto_158388 ) ) ( not ( = ?auto_158392 ?auto_158387 ) ) ( not ( = ?auto_158391 ?auto_158390 ) ) ( not ( = ?auto_158391 ?auto_158389 ) ) ( not ( = ?auto_158391 ?auto_158388 ) ) ( not ( = ?auto_158391 ?auto_158387 ) ) ( not ( = ?auto_158390 ?auto_158389 ) ) ( not ( = ?auto_158390 ?auto_158388 ) ) ( not ( = ?auto_158390 ?auto_158387 ) ) ( not ( = ?auto_158385 ?auto_158393 ) ) ( not ( = ?auto_158385 ?auto_158392 ) ) ( not ( = ?auto_158385 ?auto_158391 ) ) ( not ( = ?auto_158385 ?auto_158390 ) ) ( not ( = ?auto_158386 ?auto_158393 ) ) ( not ( = ?auto_158386 ?auto_158392 ) ) ( not ( = ?auto_158386 ?auto_158391 ) ) ( not ( = ?auto_158386 ?auto_158390 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_158393 ?auto_158392 ?auto_158391 ?auto_158390 ?auto_158389 ?auto_158388 )
      ( MAKE-4PILE ?auto_158385 ?auto_158386 ?auto_158387 ?auto_158388 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158394 - BLOCK
      ?auto_158395 - BLOCK
      ?auto_158396 - BLOCK
      ?auto_158397 - BLOCK
    )
    :vars
    (
      ?auto_158400 - BLOCK
      ?auto_158399 - BLOCK
      ?auto_158402 - BLOCK
      ?auto_158401 - BLOCK
      ?auto_158398 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158394 ) ( not ( = ?auto_158394 ?auto_158395 ) ) ( not ( = ?auto_158394 ?auto_158396 ) ) ( not ( = ?auto_158394 ?auto_158397 ) ) ( not ( = ?auto_158395 ?auto_158396 ) ) ( not ( = ?auto_158395 ?auto_158397 ) ) ( not ( = ?auto_158396 ?auto_158397 ) ) ( ON ?auto_158397 ?auto_158400 ) ( not ( = ?auto_158394 ?auto_158400 ) ) ( not ( = ?auto_158395 ?auto_158400 ) ) ( not ( = ?auto_158396 ?auto_158400 ) ) ( not ( = ?auto_158397 ?auto_158400 ) ) ( ON ?auto_158396 ?auto_158397 ) ( CLEAR ?auto_158396 ) ( ON-TABLE ?auto_158399 ) ( ON ?auto_158402 ?auto_158399 ) ( ON ?auto_158401 ?auto_158402 ) ( ON ?auto_158398 ?auto_158401 ) ( ON ?auto_158400 ?auto_158398 ) ( not ( = ?auto_158399 ?auto_158402 ) ) ( not ( = ?auto_158399 ?auto_158401 ) ) ( not ( = ?auto_158399 ?auto_158398 ) ) ( not ( = ?auto_158399 ?auto_158400 ) ) ( not ( = ?auto_158399 ?auto_158397 ) ) ( not ( = ?auto_158399 ?auto_158396 ) ) ( not ( = ?auto_158402 ?auto_158401 ) ) ( not ( = ?auto_158402 ?auto_158398 ) ) ( not ( = ?auto_158402 ?auto_158400 ) ) ( not ( = ?auto_158402 ?auto_158397 ) ) ( not ( = ?auto_158402 ?auto_158396 ) ) ( not ( = ?auto_158401 ?auto_158398 ) ) ( not ( = ?auto_158401 ?auto_158400 ) ) ( not ( = ?auto_158401 ?auto_158397 ) ) ( not ( = ?auto_158401 ?auto_158396 ) ) ( not ( = ?auto_158398 ?auto_158400 ) ) ( not ( = ?auto_158398 ?auto_158397 ) ) ( not ( = ?auto_158398 ?auto_158396 ) ) ( not ( = ?auto_158394 ?auto_158399 ) ) ( not ( = ?auto_158394 ?auto_158402 ) ) ( not ( = ?auto_158394 ?auto_158401 ) ) ( not ( = ?auto_158394 ?auto_158398 ) ) ( not ( = ?auto_158395 ?auto_158399 ) ) ( not ( = ?auto_158395 ?auto_158402 ) ) ( not ( = ?auto_158395 ?auto_158401 ) ) ( not ( = ?auto_158395 ?auto_158398 ) ) ( HOLDING ?auto_158395 ) ( CLEAR ?auto_158394 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_158394 ?auto_158395 )
      ( MAKE-4PILE ?auto_158394 ?auto_158395 ?auto_158396 ?auto_158397 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158403 - BLOCK
      ?auto_158404 - BLOCK
      ?auto_158405 - BLOCK
      ?auto_158406 - BLOCK
    )
    :vars
    (
      ?auto_158410 - BLOCK
      ?auto_158409 - BLOCK
      ?auto_158408 - BLOCK
      ?auto_158407 - BLOCK
      ?auto_158411 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158403 ) ( not ( = ?auto_158403 ?auto_158404 ) ) ( not ( = ?auto_158403 ?auto_158405 ) ) ( not ( = ?auto_158403 ?auto_158406 ) ) ( not ( = ?auto_158404 ?auto_158405 ) ) ( not ( = ?auto_158404 ?auto_158406 ) ) ( not ( = ?auto_158405 ?auto_158406 ) ) ( ON ?auto_158406 ?auto_158410 ) ( not ( = ?auto_158403 ?auto_158410 ) ) ( not ( = ?auto_158404 ?auto_158410 ) ) ( not ( = ?auto_158405 ?auto_158410 ) ) ( not ( = ?auto_158406 ?auto_158410 ) ) ( ON ?auto_158405 ?auto_158406 ) ( ON-TABLE ?auto_158409 ) ( ON ?auto_158408 ?auto_158409 ) ( ON ?auto_158407 ?auto_158408 ) ( ON ?auto_158411 ?auto_158407 ) ( ON ?auto_158410 ?auto_158411 ) ( not ( = ?auto_158409 ?auto_158408 ) ) ( not ( = ?auto_158409 ?auto_158407 ) ) ( not ( = ?auto_158409 ?auto_158411 ) ) ( not ( = ?auto_158409 ?auto_158410 ) ) ( not ( = ?auto_158409 ?auto_158406 ) ) ( not ( = ?auto_158409 ?auto_158405 ) ) ( not ( = ?auto_158408 ?auto_158407 ) ) ( not ( = ?auto_158408 ?auto_158411 ) ) ( not ( = ?auto_158408 ?auto_158410 ) ) ( not ( = ?auto_158408 ?auto_158406 ) ) ( not ( = ?auto_158408 ?auto_158405 ) ) ( not ( = ?auto_158407 ?auto_158411 ) ) ( not ( = ?auto_158407 ?auto_158410 ) ) ( not ( = ?auto_158407 ?auto_158406 ) ) ( not ( = ?auto_158407 ?auto_158405 ) ) ( not ( = ?auto_158411 ?auto_158410 ) ) ( not ( = ?auto_158411 ?auto_158406 ) ) ( not ( = ?auto_158411 ?auto_158405 ) ) ( not ( = ?auto_158403 ?auto_158409 ) ) ( not ( = ?auto_158403 ?auto_158408 ) ) ( not ( = ?auto_158403 ?auto_158407 ) ) ( not ( = ?auto_158403 ?auto_158411 ) ) ( not ( = ?auto_158404 ?auto_158409 ) ) ( not ( = ?auto_158404 ?auto_158408 ) ) ( not ( = ?auto_158404 ?auto_158407 ) ) ( not ( = ?auto_158404 ?auto_158411 ) ) ( CLEAR ?auto_158403 ) ( ON ?auto_158404 ?auto_158405 ) ( CLEAR ?auto_158404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_158409 ?auto_158408 ?auto_158407 ?auto_158411 ?auto_158410 ?auto_158406 ?auto_158405 )
      ( MAKE-4PILE ?auto_158403 ?auto_158404 ?auto_158405 ?auto_158406 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158412 - BLOCK
      ?auto_158413 - BLOCK
      ?auto_158414 - BLOCK
      ?auto_158415 - BLOCK
    )
    :vars
    (
      ?auto_158417 - BLOCK
      ?auto_158419 - BLOCK
      ?auto_158420 - BLOCK
      ?auto_158418 - BLOCK
      ?auto_158416 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158412 ?auto_158413 ) ) ( not ( = ?auto_158412 ?auto_158414 ) ) ( not ( = ?auto_158412 ?auto_158415 ) ) ( not ( = ?auto_158413 ?auto_158414 ) ) ( not ( = ?auto_158413 ?auto_158415 ) ) ( not ( = ?auto_158414 ?auto_158415 ) ) ( ON ?auto_158415 ?auto_158417 ) ( not ( = ?auto_158412 ?auto_158417 ) ) ( not ( = ?auto_158413 ?auto_158417 ) ) ( not ( = ?auto_158414 ?auto_158417 ) ) ( not ( = ?auto_158415 ?auto_158417 ) ) ( ON ?auto_158414 ?auto_158415 ) ( ON-TABLE ?auto_158419 ) ( ON ?auto_158420 ?auto_158419 ) ( ON ?auto_158418 ?auto_158420 ) ( ON ?auto_158416 ?auto_158418 ) ( ON ?auto_158417 ?auto_158416 ) ( not ( = ?auto_158419 ?auto_158420 ) ) ( not ( = ?auto_158419 ?auto_158418 ) ) ( not ( = ?auto_158419 ?auto_158416 ) ) ( not ( = ?auto_158419 ?auto_158417 ) ) ( not ( = ?auto_158419 ?auto_158415 ) ) ( not ( = ?auto_158419 ?auto_158414 ) ) ( not ( = ?auto_158420 ?auto_158418 ) ) ( not ( = ?auto_158420 ?auto_158416 ) ) ( not ( = ?auto_158420 ?auto_158417 ) ) ( not ( = ?auto_158420 ?auto_158415 ) ) ( not ( = ?auto_158420 ?auto_158414 ) ) ( not ( = ?auto_158418 ?auto_158416 ) ) ( not ( = ?auto_158418 ?auto_158417 ) ) ( not ( = ?auto_158418 ?auto_158415 ) ) ( not ( = ?auto_158418 ?auto_158414 ) ) ( not ( = ?auto_158416 ?auto_158417 ) ) ( not ( = ?auto_158416 ?auto_158415 ) ) ( not ( = ?auto_158416 ?auto_158414 ) ) ( not ( = ?auto_158412 ?auto_158419 ) ) ( not ( = ?auto_158412 ?auto_158420 ) ) ( not ( = ?auto_158412 ?auto_158418 ) ) ( not ( = ?auto_158412 ?auto_158416 ) ) ( not ( = ?auto_158413 ?auto_158419 ) ) ( not ( = ?auto_158413 ?auto_158420 ) ) ( not ( = ?auto_158413 ?auto_158418 ) ) ( not ( = ?auto_158413 ?auto_158416 ) ) ( ON ?auto_158413 ?auto_158414 ) ( CLEAR ?auto_158413 ) ( HOLDING ?auto_158412 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158412 )
      ( MAKE-4PILE ?auto_158412 ?auto_158413 ?auto_158414 ?auto_158415 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158421 - BLOCK
      ?auto_158422 - BLOCK
      ?auto_158423 - BLOCK
      ?auto_158424 - BLOCK
    )
    :vars
    (
      ?auto_158428 - BLOCK
      ?auto_158425 - BLOCK
      ?auto_158426 - BLOCK
      ?auto_158429 - BLOCK
      ?auto_158427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158421 ?auto_158422 ) ) ( not ( = ?auto_158421 ?auto_158423 ) ) ( not ( = ?auto_158421 ?auto_158424 ) ) ( not ( = ?auto_158422 ?auto_158423 ) ) ( not ( = ?auto_158422 ?auto_158424 ) ) ( not ( = ?auto_158423 ?auto_158424 ) ) ( ON ?auto_158424 ?auto_158428 ) ( not ( = ?auto_158421 ?auto_158428 ) ) ( not ( = ?auto_158422 ?auto_158428 ) ) ( not ( = ?auto_158423 ?auto_158428 ) ) ( not ( = ?auto_158424 ?auto_158428 ) ) ( ON ?auto_158423 ?auto_158424 ) ( ON-TABLE ?auto_158425 ) ( ON ?auto_158426 ?auto_158425 ) ( ON ?auto_158429 ?auto_158426 ) ( ON ?auto_158427 ?auto_158429 ) ( ON ?auto_158428 ?auto_158427 ) ( not ( = ?auto_158425 ?auto_158426 ) ) ( not ( = ?auto_158425 ?auto_158429 ) ) ( not ( = ?auto_158425 ?auto_158427 ) ) ( not ( = ?auto_158425 ?auto_158428 ) ) ( not ( = ?auto_158425 ?auto_158424 ) ) ( not ( = ?auto_158425 ?auto_158423 ) ) ( not ( = ?auto_158426 ?auto_158429 ) ) ( not ( = ?auto_158426 ?auto_158427 ) ) ( not ( = ?auto_158426 ?auto_158428 ) ) ( not ( = ?auto_158426 ?auto_158424 ) ) ( not ( = ?auto_158426 ?auto_158423 ) ) ( not ( = ?auto_158429 ?auto_158427 ) ) ( not ( = ?auto_158429 ?auto_158428 ) ) ( not ( = ?auto_158429 ?auto_158424 ) ) ( not ( = ?auto_158429 ?auto_158423 ) ) ( not ( = ?auto_158427 ?auto_158428 ) ) ( not ( = ?auto_158427 ?auto_158424 ) ) ( not ( = ?auto_158427 ?auto_158423 ) ) ( not ( = ?auto_158421 ?auto_158425 ) ) ( not ( = ?auto_158421 ?auto_158426 ) ) ( not ( = ?auto_158421 ?auto_158429 ) ) ( not ( = ?auto_158421 ?auto_158427 ) ) ( not ( = ?auto_158422 ?auto_158425 ) ) ( not ( = ?auto_158422 ?auto_158426 ) ) ( not ( = ?auto_158422 ?auto_158429 ) ) ( not ( = ?auto_158422 ?auto_158427 ) ) ( ON ?auto_158422 ?auto_158423 ) ( ON ?auto_158421 ?auto_158422 ) ( CLEAR ?auto_158421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_158425 ?auto_158426 ?auto_158429 ?auto_158427 ?auto_158428 ?auto_158424 ?auto_158423 ?auto_158422 )
      ( MAKE-4PILE ?auto_158421 ?auto_158422 ?auto_158423 ?auto_158424 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158434 - BLOCK
      ?auto_158435 - BLOCK
      ?auto_158436 - BLOCK
      ?auto_158437 - BLOCK
    )
    :vars
    (
      ?auto_158438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158438 ?auto_158437 ) ( CLEAR ?auto_158438 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158434 ) ( ON ?auto_158435 ?auto_158434 ) ( ON ?auto_158436 ?auto_158435 ) ( ON ?auto_158437 ?auto_158436 ) ( not ( = ?auto_158434 ?auto_158435 ) ) ( not ( = ?auto_158434 ?auto_158436 ) ) ( not ( = ?auto_158434 ?auto_158437 ) ) ( not ( = ?auto_158434 ?auto_158438 ) ) ( not ( = ?auto_158435 ?auto_158436 ) ) ( not ( = ?auto_158435 ?auto_158437 ) ) ( not ( = ?auto_158435 ?auto_158438 ) ) ( not ( = ?auto_158436 ?auto_158437 ) ) ( not ( = ?auto_158436 ?auto_158438 ) ) ( not ( = ?auto_158437 ?auto_158438 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158438 ?auto_158437 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158439 - BLOCK
      ?auto_158440 - BLOCK
      ?auto_158441 - BLOCK
      ?auto_158442 - BLOCK
    )
    :vars
    (
      ?auto_158443 - BLOCK
      ?auto_158444 - BLOCK
      ?auto_158445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158443 ?auto_158442 ) ( CLEAR ?auto_158443 ) ( ON-TABLE ?auto_158439 ) ( ON ?auto_158440 ?auto_158439 ) ( ON ?auto_158441 ?auto_158440 ) ( ON ?auto_158442 ?auto_158441 ) ( not ( = ?auto_158439 ?auto_158440 ) ) ( not ( = ?auto_158439 ?auto_158441 ) ) ( not ( = ?auto_158439 ?auto_158442 ) ) ( not ( = ?auto_158439 ?auto_158443 ) ) ( not ( = ?auto_158440 ?auto_158441 ) ) ( not ( = ?auto_158440 ?auto_158442 ) ) ( not ( = ?auto_158440 ?auto_158443 ) ) ( not ( = ?auto_158441 ?auto_158442 ) ) ( not ( = ?auto_158441 ?auto_158443 ) ) ( not ( = ?auto_158442 ?auto_158443 ) ) ( HOLDING ?auto_158444 ) ( CLEAR ?auto_158445 ) ( not ( = ?auto_158439 ?auto_158444 ) ) ( not ( = ?auto_158439 ?auto_158445 ) ) ( not ( = ?auto_158440 ?auto_158444 ) ) ( not ( = ?auto_158440 ?auto_158445 ) ) ( not ( = ?auto_158441 ?auto_158444 ) ) ( not ( = ?auto_158441 ?auto_158445 ) ) ( not ( = ?auto_158442 ?auto_158444 ) ) ( not ( = ?auto_158442 ?auto_158445 ) ) ( not ( = ?auto_158443 ?auto_158444 ) ) ( not ( = ?auto_158443 ?auto_158445 ) ) ( not ( = ?auto_158444 ?auto_158445 ) ) )
    :subtasks
    ( ( !STACK ?auto_158444 ?auto_158445 )
      ( MAKE-4PILE ?auto_158439 ?auto_158440 ?auto_158441 ?auto_158442 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158446 - BLOCK
      ?auto_158447 - BLOCK
      ?auto_158448 - BLOCK
      ?auto_158449 - BLOCK
    )
    :vars
    (
      ?auto_158450 - BLOCK
      ?auto_158451 - BLOCK
      ?auto_158452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158450 ?auto_158449 ) ( ON-TABLE ?auto_158446 ) ( ON ?auto_158447 ?auto_158446 ) ( ON ?auto_158448 ?auto_158447 ) ( ON ?auto_158449 ?auto_158448 ) ( not ( = ?auto_158446 ?auto_158447 ) ) ( not ( = ?auto_158446 ?auto_158448 ) ) ( not ( = ?auto_158446 ?auto_158449 ) ) ( not ( = ?auto_158446 ?auto_158450 ) ) ( not ( = ?auto_158447 ?auto_158448 ) ) ( not ( = ?auto_158447 ?auto_158449 ) ) ( not ( = ?auto_158447 ?auto_158450 ) ) ( not ( = ?auto_158448 ?auto_158449 ) ) ( not ( = ?auto_158448 ?auto_158450 ) ) ( not ( = ?auto_158449 ?auto_158450 ) ) ( CLEAR ?auto_158451 ) ( not ( = ?auto_158446 ?auto_158452 ) ) ( not ( = ?auto_158446 ?auto_158451 ) ) ( not ( = ?auto_158447 ?auto_158452 ) ) ( not ( = ?auto_158447 ?auto_158451 ) ) ( not ( = ?auto_158448 ?auto_158452 ) ) ( not ( = ?auto_158448 ?auto_158451 ) ) ( not ( = ?auto_158449 ?auto_158452 ) ) ( not ( = ?auto_158449 ?auto_158451 ) ) ( not ( = ?auto_158450 ?auto_158452 ) ) ( not ( = ?auto_158450 ?auto_158451 ) ) ( not ( = ?auto_158452 ?auto_158451 ) ) ( ON ?auto_158452 ?auto_158450 ) ( CLEAR ?auto_158452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_158446 ?auto_158447 ?auto_158448 ?auto_158449 ?auto_158450 )
      ( MAKE-4PILE ?auto_158446 ?auto_158447 ?auto_158448 ?auto_158449 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158453 - BLOCK
      ?auto_158454 - BLOCK
      ?auto_158455 - BLOCK
      ?auto_158456 - BLOCK
    )
    :vars
    (
      ?auto_158458 - BLOCK
      ?auto_158459 - BLOCK
      ?auto_158457 - BLOCK
      ?auto_158461 - BLOCK
      ?auto_158460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158458 ?auto_158456 ) ( ON-TABLE ?auto_158453 ) ( ON ?auto_158454 ?auto_158453 ) ( ON ?auto_158455 ?auto_158454 ) ( ON ?auto_158456 ?auto_158455 ) ( not ( = ?auto_158453 ?auto_158454 ) ) ( not ( = ?auto_158453 ?auto_158455 ) ) ( not ( = ?auto_158453 ?auto_158456 ) ) ( not ( = ?auto_158453 ?auto_158458 ) ) ( not ( = ?auto_158454 ?auto_158455 ) ) ( not ( = ?auto_158454 ?auto_158456 ) ) ( not ( = ?auto_158454 ?auto_158458 ) ) ( not ( = ?auto_158455 ?auto_158456 ) ) ( not ( = ?auto_158455 ?auto_158458 ) ) ( not ( = ?auto_158456 ?auto_158458 ) ) ( not ( = ?auto_158453 ?auto_158459 ) ) ( not ( = ?auto_158453 ?auto_158457 ) ) ( not ( = ?auto_158454 ?auto_158459 ) ) ( not ( = ?auto_158454 ?auto_158457 ) ) ( not ( = ?auto_158455 ?auto_158459 ) ) ( not ( = ?auto_158455 ?auto_158457 ) ) ( not ( = ?auto_158456 ?auto_158459 ) ) ( not ( = ?auto_158456 ?auto_158457 ) ) ( not ( = ?auto_158458 ?auto_158459 ) ) ( not ( = ?auto_158458 ?auto_158457 ) ) ( not ( = ?auto_158459 ?auto_158457 ) ) ( ON ?auto_158459 ?auto_158458 ) ( CLEAR ?auto_158459 ) ( HOLDING ?auto_158457 ) ( CLEAR ?auto_158461 ) ( ON-TABLE ?auto_158460 ) ( ON ?auto_158461 ?auto_158460 ) ( not ( = ?auto_158460 ?auto_158461 ) ) ( not ( = ?auto_158460 ?auto_158457 ) ) ( not ( = ?auto_158461 ?auto_158457 ) ) ( not ( = ?auto_158453 ?auto_158461 ) ) ( not ( = ?auto_158453 ?auto_158460 ) ) ( not ( = ?auto_158454 ?auto_158461 ) ) ( not ( = ?auto_158454 ?auto_158460 ) ) ( not ( = ?auto_158455 ?auto_158461 ) ) ( not ( = ?auto_158455 ?auto_158460 ) ) ( not ( = ?auto_158456 ?auto_158461 ) ) ( not ( = ?auto_158456 ?auto_158460 ) ) ( not ( = ?auto_158458 ?auto_158461 ) ) ( not ( = ?auto_158458 ?auto_158460 ) ) ( not ( = ?auto_158459 ?auto_158461 ) ) ( not ( = ?auto_158459 ?auto_158460 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_158460 ?auto_158461 ?auto_158457 )
      ( MAKE-4PILE ?auto_158453 ?auto_158454 ?auto_158455 ?auto_158456 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158462 - BLOCK
      ?auto_158463 - BLOCK
      ?auto_158464 - BLOCK
      ?auto_158465 - BLOCK
    )
    :vars
    (
      ?auto_158468 - BLOCK
      ?auto_158469 - BLOCK
      ?auto_158466 - BLOCK
      ?auto_158470 - BLOCK
      ?auto_158467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158468 ?auto_158465 ) ( ON-TABLE ?auto_158462 ) ( ON ?auto_158463 ?auto_158462 ) ( ON ?auto_158464 ?auto_158463 ) ( ON ?auto_158465 ?auto_158464 ) ( not ( = ?auto_158462 ?auto_158463 ) ) ( not ( = ?auto_158462 ?auto_158464 ) ) ( not ( = ?auto_158462 ?auto_158465 ) ) ( not ( = ?auto_158462 ?auto_158468 ) ) ( not ( = ?auto_158463 ?auto_158464 ) ) ( not ( = ?auto_158463 ?auto_158465 ) ) ( not ( = ?auto_158463 ?auto_158468 ) ) ( not ( = ?auto_158464 ?auto_158465 ) ) ( not ( = ?auto_158464 ?auto_158468 ) ) ( not ( = ?auto_158465 ?auto_158468 ) ) ( not ( = ?auto_158462 ?auto_158469 ) ) ( not ( = ?auto_158462 ?auto_158466 ) ) ( not ( = ?auto_158463 ?auto_158469 ) ) ( not ( = ?auto_158463 ?auto_158466 ) ) ( not ( = ?auto_158464 ?auto_158469 ) ) ( not ( = ?auto_158464 ?auto_158466 ) ) ( not ( = ?auto_158465 ?auto_158469 ) ) ( not ( = ?auto_158465 ?auto_158466 ) ) ( not ( = ?auto_158468 ?auto_158469 ) ) ( not ( = ?auto_158468 ?auto_158466 ) ) ( not ( = ?auto_158469 ?auto_158466 ) ) ( ON ?auto_158469 ?auto_158468 ) ( CLEAR ?auto_158470 ) ( ON-TABLE ?auto_158467 ) ( ON ?auto_158470 ?auto_158467 ) ( not ( = ?auto_158467 ?auto_158470 ) ) ( not ( = ?auto_158467 ?auto_158466 ) ) ( not ( = ?auto_158470 ?auto_158466 ) ) ( not ( = ?auto_158462 ?auto_158470 ) ) ( not ( = ?auto_158462 ?auto_158467 ) ) ( not ( = ?auto_158463 ?auto_158470 ) ) ( not ( = ?auto_158463 ?auto_158467 ) ) ( not ( = ?auto_158464 ?auto_158470 ) ) ( not ( = ?auto_158464 ?auto_158467 ) ) ( not ( = ?auto_158465 ?auto_158470 ) ) ( not ( = ?auto_158465 ?auto_158467 ) ) ( not ( = ?auto_158468 ?auto_158470 ) ) ( not ( = ?auto_158468 ?auto_158467 ) ) ( not ( = ?auto_158469 ?auto_158470 ) ) ( not ( = ?auto_158469 ?auto_158467 ) ) ( ON ?auto_158466 ?auto_158469 ) ( CLEAR ?auto_158466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_158462 ?auto_158463 ?auto_158464 ?auto_158465 ?auto_158468 ?auto_158469 )
      ( MAKE-4PILE ?auto_158462 ?auto_158463 ?auto_158464 ?auto_158465 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158471 - BLOCK
      ?auto_158472 - BLOCK
      ?auto_158473 - BLOCK
      ?auto_158474 - BLOCK
    )
    :vars
    (
      ?auto_158478 - BLOCK
      ?auto_158477 - BLOCK
      ?auto_158476 - BLOCK
      ?auto_158479 - BLOCK
      ?auto_158475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158478 ?auto_158474 ) ( ON-TABLE ?auto_158471 ) ( ON ?auto_158472 ?auto_158471 ) ( ON ?auto_158473 ?auto_158472 ) ( ON ?auto_158474 ?auto_158473 ) ( not ( = ?auto_158471 ?auto_158472 ) ) ( not ( = ?auto_158471 ?auto_158473 ) ) ( not ( = ?auto_158471 ?auto_158474 ) ) ( not ( = ?auto_158471 ?auto_158478 ) ) ( not ( = ?auto_158472 ?auto_158473 ) ) ( not ( = ?auto_158472 ?auto_158474 ) ) ( not ( = ?auto_158472 ?auto_158478 ) ) ( not ( = ?auto_158473 ?auto_158474 ) ) ( not ( = ?auto_158473 ?auto_158478 ) ) ( not ( = ?auto_158474 ?auto_158478 ) ) ( not ( = ?auto_158471 ?auto_158477 ) ) ( not ( = ?auto_158471 ?auto_158476 ) ) ( not ( = ?auto_158472 ?auto_158477 ) ) ( not ( = ?auto_158472 ?auto_158476 ) ) ( not ( = ?auto_158473 ?auto_158477 ) ) ( not ( = ?auto_158473 ?auto_158476 ) ) ( not ( = ?auto_158474 ?auto_158477 ) ) ( not ( = ?auto_158474 ?auto_158476 ) ) ( not ( = ?auto_158478 ?auto_158477 ) ) ( not ( = ?auto_158478 ?auto_158476 ) ) ( not ( = ?auto_158477 ?auto_158476 ) ) ( ON ?auto_158477 ?auto_158478 ) ( ON-TABLE ?auto_158479 ) ( not ( = ?auto_158479 ?auto_158475 ) ) ( not ( = ?auto_158479 ?auto_158476 ) ) ( not ( = ?auto_158475 ?auto_158476 ) ) ( not ( = ?auto_158471 ?auto_158475 ) ) ( not ( = ?auto_158471 ?auto_158479 ) ) ( not ( = ?auto_158472 ?auto_158475 ) ) ( not ( = ?auto_158472 ?auto_158479 ) ) ( not ( = ?auto_158473 ?auto_158475 ) ) ( not ( = ?auto_158473 ?auto_158479 ) ) ( not ( = ?auto_158474 ?auto_158475 ) ) ( not ( = ?auto_158474 ?auto_158479 ) ) ( not ( = ?auto_158478 ?auto_158475 ) ) ( not ( = ?auto_158478 ?auto_158479 ) ) ( not ( = ?auto_158477 ?auto_158475 ) ) ( not ( = ?auto_158477 ?auto_158479 ) ) ( ON ?auto_158476 ?auto_158477 ) ( CLEAR ?auto_158476 ) ( HOLDING ?auto_158475 ) ( CLEAR ?auto_158479 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_158479 ?auto_158475 )
      ( MAKE-4PILE ?auto_158471 ?auto_158472 ?auto_158473 ?auto_158474 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160173 - BLOCK
      ?auto_160174 - BLOCK
      ?auto_160175 - BLOCK
      ?auto_160176 - BLOCK
    )
    :vars
    (
      ?auto_160180 - BLOCK
      ?auto_160179 - BLOCK
      ?auto_160177 - BLOCK
      ?auto_160178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160180 ?auto_160176 ) ( ON-TABLE ?auto_160173 ) ( ON ?auto_160174 ?auto_160173 ) ( ON ?auto_160175 ?auto_160174 ) ( ON ?auto_160176 ?auto_160175 ) ( not ( = ?auto_160173 ?auto_160174 ) ) ( not ( = ?auto_160173 ?auto_160175 ) ) ( not ( = ?auto_160173 ?auto_160176 ) ) ( not ( = ?auto_160173 ?auto_160180 ) ) ( not ( = ?auto_160174 ?auto_160175 ) ) ( not ( = ?auto_160174 ?auto_160176 ) ) ( not ( = ?auto_160174 ?auto_160180 ) ) ( not ( = ?auto_160175 ?auto_160176 ) ) ( not ( = ?auto_160175 ?auto_160180 ) ) ( not ( = ?auto_160176 ?auto_160180 ) ) ( not ( = ?auto_160173 ?auto_160179 ) ) ( not ( = ?auto_160173 ?auto_160177 ) ) ( not ( = ?auto_160174 ?auto_160179 ) ) ( not ( = ?auto_160174 ?auto_160177 ) ) ( not ( = ?auto_160175 ?auto_160179 ) ) ( not ( = ?auto_160175 ?auto_160177 ) ) ( not ( = ?auto_160176 ?auto_160179 ) ) ( not ( = ?auto_160176 ?auto_160177 ) ) ( not ( = ?auto_160180 ?auto_160179 ) ) ( not ( = ?auto_160180 ?auto_160177 ) ) ( not ( = ?auto_160179 ?auto_160177 ) ) ( ON ?auto_160179 ?auto_160180 ) ( not ( = ?auto_160178 ?auto_160177 ) ) ( not ( = ?auto_160173 ?auto_160178 ) ) ( not ( = ?auto_160174 ?auto_160178 ) ) ( not ( = ?auto_160175 ?auto_160178 ) ) ( not ( = ?auto_160176 ?auto_160178 ) ) ( not ( = ?auto_160180 ?auto_160178 ) ) ( not ( = ?auto_160179 ?auto_160178 ) ) ( ON ?auto_160177 ?auto_160179 ) ( ON ?auto_160178 ?auto_160177 ) ( CLEAR ?auto_160178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160173 ?auto_160174 ?auto_160175 ?auto_160176 ?auto_160180 ?auto_160179 ?auto_160177 )
      ( MAKE-4PILE ?auto_160173 ?auto_160174 ?auto_160175 ?auto_160176 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158489 - BLOCK
      ?auto_158490 - BLOCK
      ?auto_158491 - BLOCK
      ?auto_158492 - BLOCK
    )
    :vars
    (
      ?auto_158496 - BLOCK
      ?auto_158495 - BLOCK
      ?auto_158497 - BLOCK
      ?auto_158493 - BLOCK
      ?auto_158494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158496 ?auto_158492 ) ( ON-TABLE ?auto_158489 ) ( ON ?auto_158490 ?auto_158489 ) ( ON ?auto_158491 ?auto_158490 ) ( ON ?auto_158492 ?auto_158491 ) ( not ( = ?auto_158489 ?auto_158490 ) ) ( not ( = ?auto_158489 ?auto_158491 ) ) ( not ( = ?auto_158489 ?auto_158492 ) ) ( not ( = ?auto_158489 ?auto_158496 ) ) ( not ( = ?auto_158490 ?auto_158491 ) ) ( not ( = ?auto_158490 ?auto_158492 ) ) ( not ( = ?auto_158490 ?auto_158496 ) ) ( not ( = ?auto_158491 ?auto_158492 ) ) ( not ( = ?auto_158491 ?auto_158496 ) ) ( not ( = ?auto_158492 ?auto_158496 ) ) ( not ( = ?auto_158489 ?auto_158495 ) ) ( not ( = ?auto_158489 ?auto_158497 ) ) ( not ( = ?auto_158490 ?auto_158495 ) ) ( not ( = ?auto_158490 ?auto_158497 ) ) ( not ( = ?auto_158491 ?auto_158495 ) ) ( not ( = ?auto_158491 ?auto_158497 ) ) ( not ( = ?auto_158492 ?auto_158495 ) ) ( not ( = ?auto_158492 ?auto_158497 ) ) ( not ( = ?auto_158496 ?auto_158495 ) ) ( not ( = ?auto_158496 ?auto_158497 ) ) ( not ( = ?auto_158495 ?auto_158497 ) ) ( ON ?auto_158495 ?auto_158496 ) ( not ( = ?auto_158493 ?auto_158494 ) ) ( not ( = ?auto_158493 ?auto_158497 ) ) ( not ( = ?auto_158494 ?auto_158497 ) ) ( not ( = ?auto_158489 ?auto_158494 ) ) ( not ( = ?auto_158489 ?auto_158493 ) ) ( not ( = ?auto_158490 ?auto_158494 ) ) ( not ( = ?auto_158490 ?auto_158493 ) ) ( not ( = ?auto_158491 ?auto_158494 ) ) ( not ( = ?auto_158491 ?auto_158493 ) ) ( not ( = ?auto_158492 ?auto_158494 ) ) ( not ( = ?auto_158492 ?auto_158493 ) ) ( not ( = ?auto_158496 ?auto_158494 ) ) ( not ( = ?auto_158496 ?auto_158493 ) ) ( not ( = ?auto_158495 ?auto_158494 ) ) ( not ( = ?auto_158495 ?auto_158493 ) ) ( ON ?auto_158497 ?auto_158495 ) ( ON ?auto_158494 ?auto_158497 ) ( CLEAR ?auto_158494 ) ( HOLDING ?auto_158493 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158493 )
      ( MAKE-4PILE ?auto_158489 ?auto_158490 ?auto_158491 ?auto_158492 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158498 - BLOCK
      ?auto_158499 - BLOCK
      ?auto_158500 - BLOCK
      ?auto_158501 - BLOCK
    )
    :vars
    (
      ?auto_158503 - BLOCK
      ?auto_158502 - BLOCK
      ?auto_158506 - BLOCK
      ?auto_158504 - BLOCK
      ?auto_158505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158503 ?auto_158501 ) ( ON-TABLE ?auto_158498 ) ( ON ?auto_158499 ?auto_158498 ) ( ON ?auto_158500 ?auto_158499 ) ( ON ?auto_158501 ?auto_158500 ) ( not ( = ?auto_158498 ?auto_158499 ) ) ( not ( = ?auto_158498 ?auto_158500 ) ) ( not ( = ?auto_158498 ?auto_158501 ) ) ( not ( = ?auto_158498 ?auto_158503 ) ) ( not ( = ?auto_158499 ?auto_158500 ) ) ( not ( = ?auto_158499 ?auto_158501 ) ) ( not ( = ?auto_158499 ?auto_158503 ) ) ( not ( = ?auto_158500 ?auto_158501 ) ) ( not ( = ?auto_158500 ?auto_158503 ) ) ( not ( = ?auto_158501 ?auto_158503 ) ) ( not ( = ?auto_158498 ?auto_158502 ) ) ( not ( = ?auto_158498 ?auto_158506 ) ) ( not ( = ?auto_158499 ?auto_158502 ) ) ( not ( = ?auto_158499 ?auto_158506 ) ) ( not ( = ?auto_158500 ?auto_158502 ) ) ( not ( = ?auto_158500 ?auto_158506 ) ) ( not ( = ?auto_158501 ?auto_158502 ) ) ( not ( = ?auto_158501 ?auto_158506 ) ) ( not ( = ?auto_158503 ?auto_158502 ) ) ( not ( = ?auto_158503 ?auto_158506 ) ) ( not ( = ?auto_158502 ?auto_158506 ) ) ( ON ?auto_158502 ?auto_158503 ) ( not ( = ?auto_158504 ?auto_158505 ) ) ( not ( = ?auto_158504 ?auto_158506 ) ) ( not ( = ?auto_158505 ?auto_158506 ) ) ( not ( = ?auto_158498 ?auto_158505 ) ) ( not ( = ?auto_158498 ?auto_158504 ) ) ( not ( = ?auto_158499 ?auto_158505 ) ) ( not ( = ?auto_158499 ?auto_158504 ) ) ( not ( = ?auto_158500 ?auto_158505 ) ) ( not ( = ?auto_158500 ?auto_158504 ) ) ( not ( = ?auto_158501 ?auto_158505 ) ) ( not ( = ?auto_158501 ?auto_158504 ) ) ( not ( = ?auto_158503 ?auto_158505 ) ) ( not ( = ?auto_158503 ?auto_158504 ) ) ( not ( = ?auto_158502 ?auto_158505 ) ) ( not ( = ?auto_158502 ?auto_158504 ) ) ( ON ?auto_158506 ?auto_158502 ) ( ON ?auto_158505 ?auto_158506 ) ( ON ?auto_158504 ?auto_158505 ) ( CLEAR ?auto_158504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_158498 ?auto_158499 ?auto_158500 ?auto_158501 ?auto_158503 ?auto_158502 ?auto_158506 ?auto_158505 )
      ( MAKE-4PILE ?auto_158498 ?auto_158499 ?auto_158500 ?auto_158501 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158512 - BLOCK
      ?auto_158513 - BLOCK
      ?auto_158514 - BLOCK
      ?auto_158515 - BLOCK
      ?auto_158516 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_158516 ) ( CLEAR ?auto_158515 ) ( ON-TABLE ?auto_158512 ) ( ON ?auto_158513 ?auto_158512 ) ( ON ?auto_158514 ?auto_158513 ) ( ON ?auto_158515 ?auto_158514 ) ( not ( = ?auto_158512 ?auto_158513 ) ) ( not ( = ?auto_158512 ?auto_158514 ) ) ( not ( = ?auto_158512 ?auto_158515 ) ) ( not ( = ?auto_158512 ?auto_158516 ) ) ( not ( = ?auto_158513 ?auto_158514 ) ) ( not ( = ?auto_158513 ?auto_158515 ) ) ( not ( = ?auto_158513 ?auto_158516 ) ) ( not ( = ?auto_158514 ?auto_158515 ) ) ( not ( = ?auto_158514 ?auto_158516 ) ) ( not ( = ?auto_158515 ?auto_158516 ) ) )
    :subtasks
    ( ( !STACK ?auto_158516 ?auto_158515 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158517 - BLOCK
      ?auto_158518 - BLOCK
      ?auto_158519 - BLOCK
      ?auto_158520 - BLOCK
      ?auto_158521 - BLOCK
    )
    :vars
    (
      ?auto_158522 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_158520 ) ( ON-TABLE ?auto_158517 ) ( ON ?auto_158518 ?auto_158517 ) ( ON ?auto_158519 ?auto_158518 ) ( ON ?auto_158520 ?auto_158519 ) ( not ( = ?auto_158517 ?auto_158518 ) ) ( not ( = ?auto_158517 ?auto_158519 ) ) ( not ( = ?auto_158517 ?auto_158520 ) ) ( not ( = ?auto_158517 ?auto_158521 ) ) ( not ( = ?auto_158518 ?auto_158519 ) ) ( not ( = ?auto_158518 ?auto_158520 ) ) ( not ( = ?auto_158518 ?auto_158521 ) ) ( not ( = ?auto_158519 ?auto_158520 ) ) ( not ( = ?auto_158519 ?auto_158521 ) ) ( not ( = ?auto_158520 ?auto_158521 ) ) ( ON ?auto_158521 ?auto_158522 ) ( CLEAR ?auto_158521 ) ( HAND-EMPTY ) ( not ( = ?auto_158517 ?auto_158522 ) ) ( not ( = ?auto_158518 ?auto_158522 ) ) ( not ( = ?auto_158519 ?auto_158522 ) ) ( not ( = ?auto_158520 ?auto_158522 ) ) ( not ( = ?auto_158521 ?auto_158522 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158521 ?auto_158522 )
      ( MAKE-5PILE ?auto_158517 ?auto_158518 ?auto_158519 ?auto_158520 ?auto_158521 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158523 - BLOCK
      ?auto_158524 - BLOCK
      ?auto_158525 - BLOCK
      ?auto_158526 - BLOCK
      ?auto_158527 - BLOCK
    )
    :vars
    (
      ?auto_158528 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158523 ) ( ON ?auto_158524 ?auto_158523 ) ( ON ?auto_158525 ?auto_158524 ) ( not ( = ?auto_158523 ?auto_158524 ) ) ( not ( = ?auto_158523 ?auto_158525 ) ) ( not ( = ?auto_158523 ?auto_158526 ) ) ( not ( = ?auto_158523 ?auto_158527 ) ) ( not ( = ?auto_158524 ?auto_158525 ) ) ( not ( = ?auto_158524 ?auto_158526 ) ) ( not ( = ?auto_158524 ?auto_158527 ) ) ( not ( = ?auto_158525 ?auto_158526 ) ) ( not ( = ?auto_158525 ?auto_158527 ) ) ( not ( = ?auto_158526 ?auto_158527 ) ) ( ON ?auto_158527 ?auto_158528 ) ( CLEAR ?auto_158527 ) ( not ( = ?auto_158523 ?auto_158528 ) ) ( not ( = ?auto_158524 ?auto_158528 ) ) ( not ( = ?auto_158525 ?auto_158528 ) ) ( not ( = ?auto_158526 ?auto_158528 ) ) ( not ( = ?auto_158527 ?auto_158528 ) ) ( HOLDING ?auto_158526 ) ( CLEAR ?auto_158525 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_158523 ?auto_158524 ?auto_158525 ?auto_158526 )
      ( MAKE-5PILE ?auto_158523 ?auto_158524 ?auto_158525 ?auto_158526 ?auto_158527 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158529 - BLOCK
      ?auto_158530 - BLOCK
      ?auto_158531 - BLOCK
      ?auto_158532 - BLOCK
      ?auto_158533 - BLOCK
    )
    :vars
    (
      ?auto_158534 - BLOCK
      ?auto_158537 - BLOCK
      ?auto_158535 - BLOCK
      ?auto_158536 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158529 ) ( ON ?auto_158530 ?auto_158529 ) ( ON ?auto_158531 ?auto_158530 ) ( not ( = ?auto_158529 ?auto_158530 ) ) ( not ( = ?auto_158529 ?auto_158531 ) ) ( not ( = ?auto_158529 ?auto_158532 ) ) ( not ( = ?auto_158529 ?auto_158533 ) ) ( not ( = ?auto_158530 ?auto_158531 ) ) ( not ( = ?auto_158530 ?auto_158532 ) ) ( not ( = ?auto_158530 ?auto_158533 ) ) ( not ( = ?auto_158531 ?auto_158532 ) ) ( not ( = ?auto_158531 ?auto_158533 ) ) ( not ( = ?auto_158532 ?auto_158533 ) ) ( ON ?auto_158533 ?auto_158534 ) ( not ( = ?auto_158529 ?auto_158534 ) ) ( not ( = ?auto_158530 ?auto_158534 ) ) ( not ( = ?auto_158531 ?auto_158534 ) ) ( not ( = ?auto_158532 ?auto_158534 ) ) ( not ( = ?auto_158533 ?auto_158534 ) ) ( CLEAR ?auto_158531 ) ( ON ?auto_158532 ?auto_158533 ) ( CLEAR ?auto_158532 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158537 ) ( ON ?auto_158535 ?auto_158537 ) ( ON ?auto_158536 ?auto_158535 ) ( ON ?auto_158534 ?auto_158536 ) ( not ( = ?auto_158537 ?auto_158535 ) ) ( not ( = ?auto_158537 ?auto_158536 ) ) ( not ( = ?auto_158537 ?auto_158534 ) ) ( not ( = ?auto_158537 ?auto_158533 ) ) ( not ( = ?auto_158537 ?auto_158532 ) ) ( not ( = ?auto_158535 ?auto_158536 ) ) ( not ( = ?auto_158535 ?auto_158534 ) ) ( not ( = ?auto_158535 ?auto_158533 ) ) ( not ( = ?auto_158535 ?auto_158532 ) ) ( not ( = ?auto_158536 ?auto_158534 ) ) ( not ( = ?auto_158536 ?auto_158533 ) ) ( not ( = ?auto_158536 ?auto_158532 ) ) ( not ( = ?auto_158529 ?auto_158537 ) ) ( not ( = ?auto_158529 ?auto_158535 ) ) ( not ( = ?auto_158529 ?auto_158536 ) ) ( not ( = ?auto_158530 ?auto_158537 ) ) ( not ( = ?auto_158530 ?auto_158535 ) ) ( not ( = ?auto_158530 ?auto_158536 ) ) ( not ( = ?auto_158531 ?auto_158537 ) ) ( not ( = ?auto_158531 ?auto_158535 ) ) ( not ( = ?auto_158531 ?auto_158536 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_158537 ?auto_158535 ?auto_158536 ?auto_158534 ?auto_158533 )
      ( MAKE-5PILE ?auto_158529 ?auto_158530 ?auto_158531 ?auto_158532 ?auto_158533 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158538 - BLOCK
      ?auto_158539 - BLOCK
      ?auto_158540 - BLOCK
      ?auto_158541 - BLOCK
      ?auto_158542 - BLOCK
    )
    :vars
    (
      ?auto_158544 - BLOCK
      ?auto_158545 - BLOCK
      ?auto_158546 - BLOCK
      ?auto_158543 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158538 ) ( ON ?auto_158539 ?auto_158538 ) ( not ( = ?auto_158538 ?auto_158539 ) ) ( not ( = ?auto_158538 ?auto_158540 ) ) ( not ( = ?auto_158538 ?auto_158541 ) ) ( not ( = ?auto_158538 ?auto_158542 ) ) ( not ( = ?auto_158539 ?auto_158540 ) ) ( not ( = ?auto_158539 ?auto_158541 ) ) ( not ( = ?auto_158539 ?auto_158542 ) ) ( not ( = ?auto_158540 ?auto_158541 ) ) ( not ( = ?auto_158540 ?auto_158542 ) ) ( not ( = ?auto_158541 ?auto_158542 ) ) ( ON ?auto_158542 ?auto_158544 ) ( not ( = ?auto_158538 ?auto_158544 ) ) ( not ( = ?auto_158539 ?auto_158544 ) ) ( not ( = ?auto_158540 ?auto_158544 ) ) ( not ( = ?auto_158541 ?auto_158544 ) ) ( not ( = ?auto_158542 ?auto_158544 ) ) ( ON ?auto_158541 ?auto_158542 ) ( CLEAR ?auto_158541 ) ( ON-TABLE ?auto_158545 ) ( ON ?auto_158546 ?auto_158545 ) ( ON ?auto_158543 ?auto_158546 ) ( ON ?auto_158544 ?auto_158543 ) ( not ( = ?auto_158545 ?auto_158546 ) ) ( not ( = ?auto_158545 ?auto_158543 ) ) ( not ( = ?auto_158545 ?auto_158544 ) ) ( not ( = ?auto_158545 ?auto_158542 ) ) ( not ( = ?auto_158545 ?auto_158541 ) ) ( not ( = ?auto_158546 ?auto_158543 ) ) ( not ( = ?auto_158546 ?auto_158544 ) ) ( not ( = ?auto_158546 ?auto_158542 ) ) ( not ( = ?auto_158546 ?auto_158541 ) ) ( not ( = ?auto_158543 ?auto_158544 ) ) ( not ( = ?auto_158543 ?auto_158542 ) ) ( not ( = ?auto_158543 ?auto_158541 ) ) ( not ( = ?auto_158538 ?auto_158545 ) ) ( not ( = ?auto_158538 ?auto_158546 ) ) ( not ( = ?auto_158538 ?auto_158543 ) ) ( not ( = ?auto_158539 ?auto_158545 ) ) ( not ( = ?auto_158539 ?auto_158546 ) ) ( not ( = ?auto_158539 ?auto_158543 ) ) ( not ( = ?auto_158540 ?auto_158545 ) ) ( not ( = ?auto_158540 ?auto_158546 ) ) ( not ( = ?auto_158540 ?auto_158543 ) ) ( HOLDING ?auto_158540 ) ( CLEAR ?auto_158539 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_158538 ?auto_158539 ?auto_158540 )
      ( MAKE-5PILE ?auto_158538 ?auto_158539 ?auto_158540 ?auto_158541 ?auto_158542 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158547 - BLOCK
      ?auto_158548 - BLOCK
      ?auto_158549 - BLOCK
      ?auto_158550 - BLOCK
      ?auto_158551 - BLOCK
    )
    :vars
    (
      ?auto_158552 - BLOCK
      ?auto_158555 - BLOCK
      ?auto_158553 - BLOCK
      ?auto_158554 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158547 ) ( ON ?auto_158548 ?auto_158547 ) ( not ( = ?auto_158547 ?auto_158548 ) ) ( not ( = ?auto_158547 ?auto_158549 ) ) ( not ( = ?auto_158547 ?auto_158550 ) ) ( not ( = ?auto_158547 ?auto_158551 ) ) ( not ( = ?auto_158548 ?auto_158549 ) ) ( not ( = ?auto_158548 ?auto_158550 ) ) ( not ( = ?auto_158548 ?auto_158551 ) ) ( not ( = ?auto_158549 ?auto_158550 ) ) ( not ( = ?auto_158549 ?auto_158551 ) ) ( not ( = ?auto_158550 ?auto_158551 ) ) ( ON ?auto_158551 ?auto_158552 ) ( not ( = ?auto_158547 ?auto_158552 ) ) ( not ( = ?auto_158548 ?auto_158552 ) ) ( not ( = ?auto_158549 ?auto_158552 ) ) ( not ( = ?auto_158550 ?auto_158552 ) ) ( not ( = ?auto_158551 ?auto_158552 ) ) ( ON ?auto_158550 ?auto_158551 ) ( ON-TABLE ?auto_158555 ) ( ON ?auto_158553 ?auto_158555 ) ( ON ?auto_158554 ?auto_158553 ) ( ON ?auto_158552 ?auto_158554 ) ( not ( = ?auto_158555 ?auto_158553 ) ) ( not ( = ?auto_158555 ?auto_158554 ) ) ( not ( = ?auto_158555 ?auto_158552 ) ) ( not ( = ?auto_158555 ?auto_158551 ) ) ( not ( = ?auto_158555 ?auto_158550 ) ) ( not ( = ?auto_158553 ?auto_158554 ) ) ( not ( = ?auto_158553 ?auto_158552 ) ) ( not ( = ?auto_158553 ?auto_158551 ) ) ( not ( = ?auto_158553 ?auto_158550 ) ) ( not ( = ?auto_158554 ?auto_158552 ) ) ( not ( = ?auto_158554 ?auto_158551 ) ) ( not ( = ?auto_158554 ?auto_158550 ) ) ( not ( = ?auto_158547 ?auto_158555 ) ) ( not ( = ?auto_158547 ?auto_158553 ) ) ( not ( = ?auto_158547 ?auto_158554 ) ) ( not ( = ?auto_158548 ?auto_158555 ) ) ( not ( = ?auto_158548 ?auto_158553 ) ) ( not ( = ?auto_158548 ?auto_158554 ) ) ( not ( = ?auto_158549 ?auto_158555 ) ) ( not ( = ?auto_158549 ?auto_158553 ) ) ( not ( = ?auto_158549 ?auto_158554 ) ) ( CLEAR ?auto_158548 ) ( ON ?auto_158549 ?auto_158550 ) ( CLEAR ?auto_158549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_158555 ?auto_158553 ?auto_158554 ?auto_158552 ?auto_158551 ?auto_158550 )
      ( MAKE-5PILE ?auto_158547 ?auto_158548 ?auto_158549 ?auto_158550 ?auto_158551 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158556 - BLOCK
      ?auto_158557 - BLOCK
      ?auto_158558 - BLOCK
      ?auto_158559 - BLOCK
      ?auto_158560 - BLOCK
    )
    :vars
    (
      ?auto_158564 - BLOCK
      ?auto_158563 - BLOCK
      ?auto_158561 - BLOCK
      ?auto_158562 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158556 ) ( not ( = ?auto_158556 ?auto_158557 ) ) ( not ( = ?auto_158556 ?auto_158558 ) ) ( not ( = ?auto_158556 ?auto_158559 ) ) ( not ( = ?auto_158556 ?auto_158560 ) ) ( not ( = ?auto_158557 ?auto_158558 ) ) ( not ( = ?auto_158557 ?auto_158559 ) ) ( not ( = ?auto_158557 ?auto_158560 ) ) ( not ( = ?auto_158558 ?auto_158559 ) ) ( not ( = ?auto_158558 ?auto_158560 ) ) ( not ( = ?auto_158559 ?auto_158560 ) ) ( ON ?auto_158560 ?auto_158564 ) ( not ( = ?auto_158556 ?auto_158564 ) ) ( not ( = ?auto_158557 ?auto_158564 ) ) ( not ( = ?auto_158558 ?auto_158564 ) ) ( not ( = ?auto_158559 ?auto_158564 ) ) ( not ( = ?auto_158560 ?auto_158564 ) ) ( ON ?auto_158559 ?auto_158560 ) ( ON-TABLE ?auto_158563 ) ( ON ?auto_158561 ?auto_158563 ) ( ON ?auto_158562 ?auto_158561 ) ( ON ?auto_158564 ?auto_158562 ) ( not ( = ?auto_158563 ?auto_158561 ) ) ( not ( = ?auto_158563 ?auto_158562 ) ) ( not ( = ?auto_158563 ?auto_158564 ) ) ( not ( = ?auto_158563 ?auto_158560 ) ) ( not ( = ?auto_158563 ?auto_158559 ) ) ( not ( = ?auto_158561 ?auto_158562 ) ) ( not ( = ?auto_158561 ?auto_158564 ) ) ( not ( = ?auto_158561 ?auto_158560 ) ) ( not ( = ?auto_158561 ?auto_158559 ) ) ( not ( = ?auto_158562 ?auto_158564 ) ) ( not ( = ?auto_158562 ?auto_158560 ) ) ( not ( = ?auto_158562 ?auto_158559 ) ) ( not ( = ?auto_158556 ?auto_158563 ) ) ( not ( = ?auto_158556 ?auto_158561 ) ) ( not ( = ?auto_158556 ?auto_158562 ) ) ( not ( = ?auto_158557 ?auto_158563 ) ) ( not ( = ?auto_158557 ?auto_158561 ) ) ( not ( = ?auto_158557 ?auto_158562 ) ) ( not ( = ?auto_158558 ?auto_158563 ) ) ( not ( = ?auto_158558 ?auto_158561 ) ) ( not ( = ?auto_158558 ?auto_158562 ) ) ( ON ?auto_158558 ?auto_158559 ) ( CLEAR ?auto_158558 ) ( HOLDING ?auto_158557 ) ( CLEAR ?auto_158556 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_158556 ?auto_158557 )
      ( MAKE-5PILE ?auto_158556 ?auto_158557 ?auto_158558 ?auto_158559 ?auto_158560 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158565 - BLOCK
      ?auto_158566 - BLOCK
      ?auto_158567 - BLOCK
      ?auto_158568 - BLOCK
      ?auto_158569 - BLOCK
    )
    :vars
    (
      ?auto_158571 - BLOCK
      ?auto_158572 - BLOCK
      ?auto_158570 - BLOCK
      ?auto_158573 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158565 ) ( not ( = ?auto_158565 ?auto_158566 ) ) ( not ( = ?auto_158565 ?auto_158567 ) ) ( not ( = ?auto_158565 ?auto_158568 ) ) ( not ( = ?auto_158565 ?auto_158569 ) ) ( not ( = ?auto_158566 ?auto_158567 ) ) ( not ( = ?auto_158566 ?auto_158568 ) ) ( not ( = ?auto_158566 ?auto_158569 ) ) ( not ( = ?auto_158567 ?auto_158568 ) ) ( not ( = ?auto_158567 ?auto_158569 ) ) ( not ( = ?auto_158568 ?auto_158569 ) ) ( ON ?auto_158569 ?auto_158571 ) ( not ( = ?auto_158565 ?auto_158571 ) ) ( not ( = ?auto_158566 ?auto_158571 ) ) ( not ( = ?auto_158567 ?auto_158571 ) ) ( not ( = ?auto_158568 ?auto_158571 ) ) ( not ( = ?auto_158569 ?auto_158571 ) ) ( ON ?auto_158568 ?auto_158569 ) ( ON-TABLE ?auto_158572 ) ( ON ?auto_158570 ?auto_158572 ) ( ON ?auto_158573 ?auto_158570 ) ( ON ?auto_158571 ?auto_158573 ) ( not ( = ?auto_158572 ?auto_158570 ) ) ( not ( = ?auto_158572 ?auto_158573 ) ) ( not ( = ?auto_158572 ?auto_158571 ) ) ( not ( = ?auto_158572 ?auto_158569 ) ) ( not ( = ?auto_158572 ?auto_158568 ) ) ( not ( = ?auto_158570 ?auto_158573 ) ) ( not ( = ?auto_158570 ?auto_158571 ) ) ( not ( = ?auto_158570 ?auto_158569 ) ) ( not ( = ?auto_158570 ?auto_158568 ) ) ( not ( = ?auto_158573 ?auto_158571 ) ) ( not ( = ?auto_158573 ?auto_158569 ) ) ( not ( = ?auto_158573 ?auto_158568 ) ) ( not ( = ?auto_158565 ?auto_158572 ) ) ( not ( = ?auto_158565 ?auto_158570 ) ) ( not ( = ?auto_158565 ?auto_158573 ) ) ( not ( = ?auto_158566 ?auto_158572 ) ) ( not ( = ?auto_158566 ?auto_158570 ) ) ( not ( = ?auto_158566 ?auto_158573 ) ) ( not ( = ?auto_158567 ?auto_158572 ) ) ( not ( = ?auto_158567 ?auto_158570 ) ) ( not ( = ?auto_158567 ?auto_158573 ) ) ( ON ?auto_158567 ?auto_158568 ) ( CLEAR ?auto_158565 ) ( ON ?auto_158566 ?auto_158567 ) ( CLEAR ?auto_158566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_158572 ?auto_158570 ?auto_158573 ?auto_158571 ?auto_158569 ?auto_158568 ?auto_158567 )
      ( MAKE-5PILE ?auto_158565 ?auto_158566 ?auto_158567 ?auto_158568 ?auto_158569 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158574 - BLOCK
      ?auto_158575 - BLOCK
      ?auto_158576 - BLOCK
      ?auto_158577 - BLOCK
      ?auto_158578 - BLOCK
    )
    :vars
    (
      ?auto_158579 - BLOCK
      ?auto_158582 - BLOCK
      ?auto_158580 - BLOCK
      ?auto_158581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158574 ?auto_158575 ) ) ( not ( = ?auto_158574 ?auto_158576 ) ) ( not ( = ?auto_158574 ?auto_158577 ) ) ( not ( = ?auto_158574 ?auto_158578 ) ) ( not ( = ?auto_158575 ?auto_158576 ) ) ( not ( = ?auto_158575 ?auto_158577 ) ) ( not ( = ?auto_158575 ?auto_158578 ) ) ( not ( = ?auto_158576 ?auto_158577 ) ) ( not ( = ?auto_158576 ?auto_158578 ) ) ( not ( = ?auto_158577 ?auto_158578 ) ) ( ON ?auto_158578 ?auto_158579 ) ( not ( = ?auto_158574 ?auto_158579 ) ) ( not ( = ?auto_158575 ?auto_158579 ) ) ( not ( = ?auto_158576 ?auto_158579 ) ) ( not ( = ?auto_158577 ?auto_158579 ) ) ( not ( = ?auto_158578 ?auto_158579 ) ) ( ON ?auto_158577 ?auto_158578 ) ( ON-TABLE ?auto_158582 ) ( ON ?auto_158580 ?auto_158582 ) ( ON ?auto_158581 ?auto_158580 ) ( ON ?auto_158579 ?auto_158581 ) ( not ( = ?auto_158582 ?auto_158580 ) ) ( not ( = ?auto_158582 ?auto_158581 ) ) ( not ( = ?auto_158582 ?auto_158579 ) ) ( not ( = ?auto_158582 ?auto_158578 ) ) ( not ( = ?auto_158582 ?auto_158577 ) ) ( not ( = ?auto_158580 ?auto_158581 ) ) ( not ( = ?auto_158580 ?auto_158579 ) ) ( not ( = ?auto_158580 ?auto_158578 ) ) ( not ( = ?auto_158580 ?auto_158577 ) ) ( not ( = ?auto_158581 ?auto_158579 ) ) ( not ( = ?auto_158581 ?auto_158578 ) ) ( not ( = ?auto_158581 ?auto_158577 ) ) ( not ( = ?auto_158574 ?auto_158582 ) ) ( not ( = ?auto_158574 ?auto_158580 ) ) ( not ( = ?auto_158574 ?auto_158581 ) ) ( not ( = ?auto_158575 ?auto_158582 ) ) ( not ( = ?auto_158575 ?auto_158580 ) ) ( not ( = ?auto_158575 ?auto_158581 ) ) ( not ( = ?auto_158576 ?auto_158582 ) ) ( not ( = ?auto_158576 ?auto_158580 ) ) ( not ( = ?auto_158576 ?auto_158581 ) ) ( ON ?auto_158576 ?auto_158577 ) ( ON ?auto_158575 ?auto_158576 ) ( CLEAR ?auto_158575 ) ( HOLDING ?auto_158574 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158574 )
      ( MAKE-5PILE ?auto_158574 ?auto_158575 ?auto_158576 ?auto_158577 ?auto_158578 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158583 - BLOCK
      ?auto_158584 - BLOCK
      ?auto_158585 - BLOCK
      ?auto_158586 - BLOCK
      ?auto_158587 - BLOCK
    )
    :vars
    (
      ?auto_158591 - BLOCK
      ?auto_158588 - BLOCK
      ?auto_158589 - BLOCK
      ?auto_158590 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158583 ?auto_158584 ) ) ( not ( = ?auto_158583 ?auto_158585 ) ) ( not ( = ?auto_158583 ?auto_158586 ) ) ( not ( = ?auto_158583 ?auto_158587 ) ) ( not ( = ?auto_158584 ?auto_158585 ) ) ( not ( = ?auto_158584 ?auto_158586 ) ) ( not ( = ?auto_158584 ?auto_158587 ) ) ( not ( = ?auto_158585 ?auto_158586 ) ) ( not ( = ?auto_158585 ?auto_158587 ) ) ( not ( = ?auto_158586 ?auto_158587 ) ) ( ON ?auto_158587 ?auto_158591 ) ( not ( = ?auto_158583 ?auto_158591 ) ) ( not ( = ?auto_158584 ?auto_158591 ) ) ( not ( = ?auto_158585 ?auto_158591 ) ) ( not ( = ?auto_158586 ?auto_158591 ) ) ( not ( = ?auto_158587 ?auto_158591 ) ) ( ON ?auto_158586 ?auto_158587 ) ( ON-TABLE ?auto_158588 ) ( ON ?auto_158589 ?auto_158588 ) ( ON ?auto_158590 ?auto_158589 ) ( ON ?auto_158591 ?auto_158590 ) ( not ( = ?auto_158588 ?auto_158589 ) ) ( not ( = ?auto_158588 ?auto_158590 ) ) ( not ( = ?auto_158588 ?auto_158591 ) ) ( not ( = ?auto_158588 ?auto_158587 ) ) ( not ( = ?auto_158588 ?auto_158586 ) ) ( not ( = ?auto_158589 ?auto_158590 ) ) ( not ( = ?auto_158589 ?auto_158591 ) ) ( not ( = ?auto_158589 ?auto_158587 ) ) ( not ( = ?auto_158589 ?auto_158586 ) ) ( not ( = ?auto_158590 ?auto_158591 ) ) ( not ( = ?auto_158590 ?auto_158587 ) ) ( not ( = ?auto_158590 ?auto_158586 ) ) ( not ( = ?auto_158583 ?auto_158588 ) ) ( not ( = ?auto_158583 ?auto_158589 ) ) ( not ( = ?auto_158583 ?auto_158590 ) ) ( not ( = ?auto_158584 ?auto_158588 ) ) ( not ( = ?auto_158584 ?auto_158589 ) ) ( not ( = ?auto_158584 ?auto_158590 ) ) ( not ( = ?auto_158585 ?auto_158588 ) ) ( not ( = ?auto_158585 ?auto_158589 ) ) ( not ( = ?auto_158585 ?auto_158590 ) ) ( ON ?auto_158585 ?auto_158586 ) ( ON ?auto_158584 ?auto_158585 ) ( ON ?auto_158583 ?auto_158584 ) ( CLEAR ?auto_158583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_158588 ?auto_158589 ?auto_158590 ?auto_158591 ?auto_158587 ?auto_158586 ?auto_158585 ?auto_158584 )
      ( MAKE-5PILE ?auto_158583 ?auto_158584 ?auto_158585 ?auto_158586 ?auto_158587 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158595 - BLOCK
      ?auto_158596 - BLOCK
      ?auto_158597 - BLOCK
    )
    :vars
    (
      ?auto_158598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158598 ?auto_158597 ) ( CLEAR ?auto_158598 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158595 ) ( ON ?auto_158596 ?auto_158595 ) ( ON ?auto_158597 ?auto_158596 ) ( not ( = ?auto_158595 ?auto_158596 ) ) ( not ( = ?auto_158595 ?auto_158597 ) ) ( not ( = ?auto_158595 ?auto_158598 ) ) ( not ( = ?auto_158596 ?auto_158597 ) ) ( not ( = ?auto_158596 ?auto_158598 ) ) ( not ( = ?auto_158597 ?auto_158598 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158598 ?auto_158597 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158599 - BLOCK
      ?auto_158600 - BLOCK
      ?auto_158601 - BLOCK
    )
    :vars
    (
      ?auto_158602 - BLOCK
      ?auto_158603 - BLOCK
      ?auto_158604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158602 ?auto_158601 ) ( CLEAR ?auto_158602 ) ( ON-TABLE ?auto_158599 ) ( ON ?auto_158600 ?auto_158599 ) ( ON ?auto_158601 ?auto_158600 ) ( not ( = ?auto_158599 ?auto_158600 ) ) ( not ( = ?auto_158599 ?auto_158601 ) ) ( not ( = ?auto_158599 ?auto_158602 ) ) ( not ( = ?auto_158600 ?auto_158601 ) ) ( not ( = ?auto_158600 ?auto_158602 ) ) ( not ( = ?auto_158601 ?auto_158602 ) ) ( HOLDING ?auto_158603 ) ( CLEAR ?auto_158604 ) ( not ( = ?auto_158599 ?auto_158603 ) ) ( not ( = ?auto_158599 ?auto_158604 ) ) ( not ( = ?auto_158600 ?auto_158603 ) ) ( not ( = ?auto_158600 ?auto_158604 ) ) ( not ( = ?auto_158601 ?auto_158603 ) ) ( not ( = ?auto_158601 ?auto_158604 ) ) ( not ( = ?auto_158602 ?auto_158603 ) ) ( not ( = ?auto_158602 ?auto_158604 ) ) ( not ( = ?auto_158603 ?auto_158604 ) ) )
    :subtasks
    ( ( !STACK ?auto_158603 ?auto_158604 )
      ( MAKE-3PILE ?auto_158599 ?auto_158600 ?auto_158601 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158605 - BLOCK
      ?auto_158606 - BLOCK
      ?auto_158607 - BLOCK
    )
    :vars
    (
      ?auto_158609 - BLOCK
      ?auto_158610 - BLOCK
      ?auto_158608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158609 ?auto_158607 ) ( ON-TABLE ?auto_158605 ) ( ON ?auto_158606 ?auto_158605 ) ( ON ?auto_158607 ?auto_158606 ) ( not ( = ?auto_158605 ?auto_158606 ) ) ( not ( = ?auto_158605 ?auto_158607 ) ) ( not ( = ?auto_158605 ?auto_158609 ) ) ( not ( = ?auto_158606 ?auto_158607 ) ) ( not ( = ?auto_158606 ?auto_158609 ) ) ( not ( = ?auto_158607 ?auto_158609 ) ) ( CLEAR ?auto_158610 ) ( not ( = ?auto_158605 ?auto_158608 ) ) ( not ( = ?auto_158605 ?auto_158610 ) ) ( not ( = ?auto_158606 ?auto_158608 ) ) ( not ( = ?auto_158606 ?auto_158610 ) ) ( not ( = ?auto_158607 ?auto_158608 ) ) ( not ( = ?auto_158607 ?auto_158610 ) ) ( not ( = ?auto_158609 ?auto_158608 ) ) ( not ( = ?auto_158609 ?auto_158610 ) ) ( not ( = ?auto_158608 ?auto_158610 ) ) ( ON ?auto_158608 ?auto_158609 ) ( CLEAR ?auto_158608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_158605 ?auto_158606 ?auto_158607 ?auto_158609 )
      ( MAKE-3PILE ?auto_158605 ?auto_158606 ?auto_158607 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158611 - BLOCK
      ?auto_158612 - BLOCK
      ?auto_158613 - BLOCK
    )
    :vars
    (
      ?auto_158614 - BLOCK
      ?auto_158616 - BLOCK
      ?auto_158615 - BLOCK
      ?auto_158619 - BLOCK
      ?auto_158617 - BLOCK
      ?auto_158618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158614 ?auto_158613 ) ( ON-TABLE ?auto_158611 ) ( ON ?auto_158612 ?auto_158611 ) ( ON ?auto_158613 ?auto_158612 ) ( not ( = ?auto_158611 ?auto_158612 ) ) ( not ( = ?auto_158611 ?auto_158613 ) ) ( not ( = ?auto_158611 ?auto_158614 ) ) ( not ( = ?auto_158612 ?auto_158613 ) ) ( not ( = ?auto_158612 ?auto_158614 ) ) ( not ( = ?auto_158613 ?auto_158614 ) ) ( not ( = ?auto_158611 ?auto_158616 ) ) ( not ( = ?auto_158611 ?auto_158615 ) ) ( not ( = ?auto_158612 ?auto_158616 ) ) ( not ( = ?auto_158612 ?auto_158615 ) ) ( not ( = ?auto_158613 ?auto_158616 ) ) ( not ( = ?auto_158613 ?auto_158615 ) ) ( not ( = ?auto_158614 ?auto_158616 ) ) ( not ( = ?auto_158614 ?auto_158615 ) ) ( not ( = ?auto_158616 ?auto_158615 ) ) ( ON ?auto_158616 ?auto_158614 ) ( CLEAR ?auto_158616 ) ( HOLDING ?auto_158615 ) ( CLEAR ?auto_158619 ) ( ON-TABLE ?auto_158617 ) ( ON ?auto_158618 ?auto_158617 ) ( ON ?auto_158619 ?auto_158618 ) ( not ( = ?auto_158617 ?auto_158618 ) ) ( not ( = ?auto_158617 ?auto_158619 ) ) ( not ( = ?auto_158617 ?auto_158615 ) ) ( not ( = ?auto_158618 ?auto_158619 ) ) ( not ( = ?auto_158618 ?auto_158615 ) ) ( not ( = ?auto_158619 ?auto_158615 ) ) ( not ( = ?auto_158611 ?auto_158619 ) ) ( not ( = ?auto_158611 ?auto_158617 ) ) ( not ( = ?auto_158611 ?auto_158618 ) ) ( not ( = ?auto_158612 ?auto_158619 ) ) ( not ( = ?auto_158612 ?auto_158617 ) ) ( not ( = ?auto_158612 ?auto_158618 ) ) ( not ( = ?auto_158613 ?auto_158619 ) ) ( not ( = ?auto_158613 ?auto_158617 ) ) ( not ( = ?auto_158613 ?auto_158618 ) ) ( not ( = ?auto_158614 ?auto_158619 ) ) ( not ( = ?auto_158614 ?auto_158617 ) ) ( not ( = ?auto_158614 ?auto_158618 ) ) ( not ( = ?auto_158616 ?auto_158619 ) ) ( not ( = ?auto_158616 ?auto_158617 ) ) ( not ( = ?auto_158616 ?auto_158618 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_158617 ?auto_158618 ?auto_158619 ?auto_158615 )
      ( MAKE-3PILE ?auto_158611 ?auto_158612 ?auto_158613 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158620 - BLOCK
      ?auto_158621 - BLOCK
      ?auto_158622 - BLOCK
    )
    :vars
    (
      ?auto_158627 - BLOCK
      ?auto_158626 - BLOCK
      ?auto_158623 - BLOCK
      ?auto_158625 - BLOCK
      ?auto_158628 - BLOCK
      ?auto_158624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158627 ?auto_158622 ) ( ON-TABLE ?auto_158620 ) ( ON ?auto_158621 ?auto_158620 ) ( ON ?auto_158622 ?auto_158621 ) ( not ( = ?auto_158620 ?auto_158621 ) ) ( not ( = ?auto_158620 ?auto_158622 ) ) ( not ( = ?auto_158620 ?auto_158627 ) ) ( not ( = ?auto_158621 ?auto_158622 ) ) ( not ( = ?auto_158621 ?auto_158627 ) ) ( not ( = ?auto_158622 ?auto_158627 ) ) ( not ( = ?auto_158620 ?auto_158626 ) ) ( not ( = ?auto_158620 ?auto_158623 ) ) ( not ( = ?auto_158621 ?auto_158626 ) ) ( not ( = ?auto_158621 ?auto_158623 ) ) ( not ( = ?auto_158622 ?auto_158626 ) ) ( not ( = ?auto_158622 ?auto_158623 ) ) ( not ( = ?auto_158627 ?auto_158626 ) ) ( not ( = ?auto_158627 ?auto_158623 ) ) ( not ( = ?auto_158626 ?auto_158623 ) ) ( ON ?auto_158626 ?auto_158627 ) ( CLEAR ?auto_158625 ) ( ON-TABLE ?auto_158628 ) ( ON ?auto_158624 ?auto_158628 ) ( ON ?auto_158625 ?auto_158624 ) ( not ( = ?auto_158628 ?auto_158624 ) ) ( not ( = ?auto_158628 ?auto_158625 ) ) ( not ( = ?auto_158628 ?auto_158623 ) ) ( not ( = ?auto_158624 ?auto_158625 ) ) ( not ( = ?auto_158624 ?auto_158623 ) ) ( not ( = ?auto_158625 ?auto_158623 ) ) ( not ( = ?auto_158620 ?auto_158625 ) ) ( not ( = ?auto_158620 ?auto_158628 ) ) ( not ( = ?auto_158620 ?auto_158624 ) ) ( not ( = ?auto_158621 ?auto_158625 ) ) ( not ( = ?auto_158621 ?auto_158628 ) ) ( not ( = ?auto_158621 ?auto_158624 ) ) ( not ( = ?auto_158622 ?auto_158625 ) ) ( not ( = ?auto_158622 ?auto_158628 ) ) ( not ( = ?auto_158622 ?auto_158624 ) ) ( not ( = ?auto_158627 ?auto_158625 ) ) ( not ( = ?auto_158627 ?auto_158628 ) ) ( not ( = ?auto_158627 ?auto_158624 ) ) ( not ( = ?auto_158626 ?auto_158625 ) ) ( not ( = ?auto_158626 ?auto_158628 ) ) ( not ( = ?auto_158626 ?auto_158624 ) ) ( ON ?auto_158623 ?auto_158626 ) ( CLEAR ?auto_158623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_158620 ?auto_158621 ?auto_158622 ?auto_158627 ?auto_158626 )
      ( MAKE-3PILE ?auto_158620 ?auto_158621 ?auto_158622 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158629 - BLOCK
      ?auto_158630 - BLOCK
      ?auto_158631 - BLOCK
    )
    :vars
    (
      ?auto_158637 - BLOCK
      ?auto_158635 - BLOCK
      ?auto_158636 - BLOCK
      ?auto_158634 - BLOCK
      ?auto_158632 - BLOCK
      ?auto_158633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158637 ?auto_158631 ) ( ON-TABLE ?auto_158629 ) ( ON ?auto_158630 ?auto_158629 ) ( ON ?auto_158631 ?auto_158630 ) ( not ( = ?auto_158629 ?auto_158630 ) ) ( not ( = ?auto_158629 ?auto_158631 ) ) ( not ( = ?auto_158629 ?auto_158637 ) ) ( not ( = ?auto_158630 ?auto_158631 ) ) ( not ( = ?auto_158630 ?auto_158637 ) ) ( not ( = ?auto_158631 ?auto_158637 ) ) ( not ( = ?auto_158629 ?auto_158635 ) ) ( not ( = ?auto_158629 ?auto_158636 ) ) ( not ( = ?auto_158630 ?auto_158635 ) ) ( not ( = ?auto_158630 ?auto_158636 ) ) ( not ( = ?auto_158631 ?auto_158635 ) ) ( not ( = ?auto_158631 ?auto_158636 ) ) ( not ( = ?auto_158637 ?auto_158635 ) ) ( not ( = ?auto_158637 ?auto_158636 ) ) ( not ( = ?auto_158635 ?auto_158636 ) ) ( ON ?auto_158635 ?auto_158637 ) ( ON-TABLE ?auto_158634 ) ( ON ?auto_158632 ?auto_158634 ) ( not ( = ?auto_158634 ?auto_158632 ) ) ( not ( = ?auto_158634 ?auto_158633 ) ) ( not ( = ?auto_158634 ?auto_158636 ) ) ( not ( = ?auto_158632 ?auto_158633 ) ) ( not ( = ?auto_158632 ?auto_158636 ) ) ( not ( = ?auto_158633 ?auto_158636 ) ) ( not ( = ?auto_158629 ?auto_158633 ) ) ( not ( = ?auto_158629 ?auto_158634 ) ) ( not ( = ?auto_158629 ?auto_158632 ) ) ( not ( = ?auto_158630 ?auto_158633 ) ) ( not ( = ?auto_158630 ?auto_158634 ) ) ( not ( = ?auto_158630 ?auto_158632 ) ) ( not ( = ?auto_158631 ?auto_158633 ) ) ( not ( = ?auto_158631 ?auto_158634 ) ) ( not ( = ?auto_158631 ?auto_158632 ) ) ( not ( = ?auto_158637 ?auto_158633 ) ) ( not ( = ?auto_158637 ?auto_158634 ) ) ( not ( = ?auto_158637 ?auto_158632 ) ) ( not ( = ?auto_158635 ?auto_158633 ) ) ( not ( = ?auto_158635 ?auto_158634 ) ) ( not ( = ?auto_158635 ?auto_158632 ) ) ( ON ?auto_158636 ?auto_158635 ) ( CLEAR ?auto_158636 ) ( HOLDING ?auto_158633 ) ( CLEAR ?auto_158632 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_158634 ?auto_158632 ?auto_158633 )
      ( MAKE-3PILE ?auto_158629 ?auto_158630 ?auto_158631 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158638 - BLOCK
      ?auto_158639 - BLOCK
      ?auto_158640 - BLOCK
    )
    :vars
    (
      ?auto_158641 - BLOCK
      ?auto_158644 - BLOCK
      ?auto_158642 - BLOCK
      ?auto_158643 - BLOCK
      ?auto_158646 - BLOCK
      ?auto_158645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158641 ?auto_158640 ) ( ON-TABLE ?auto_158638 ) ( ON ?auto_158639 ?auto_158638 ) ( ON ?auto_158640 ?auto_158639 ) ( not ( = ?auto_158638 ?auto_158639 ) ) ( not ( = ?auto_158638 ?auto_158640 ) ) ( not ( = ?auto_158638 ?auto_158641 ) ) ( not ( = ?auto_158639 ?auto_158640 ) ) ( not ( = ?auto_158639 ?auto_158641 ) ) ( not ( = ?auto_158640 ?auto_158641 ) ) ( not ( = ?auto_158638 ?auto_158644 ) ) ( not ( = ?auto_158638 ?auto_158642 ) ) ( not ( = ?auto_158639 ?auto_158644 ) ) ( not ( = ?auto_158639 ?auto_158642 ) ) ( not ( = ?auto_158640 ?auto_158644 ) ) ( not ( = ?auto_158640 ?auto_158642 ) ) ( not ( = ?auto_158641 ?auto_158644 ) ) ( not ( = ?auto_158641 ?auto_158642 ) ) ( not ( = ?auto_158644 ?auto_158642 ) ) ( ON ?auto_158644 ?auto_158641 ) ( ON-TABLE ?auto_158643 ) ( ON ?auto_158646 ?auto_158643 ) ( not ( = ?auto_158643 ?auto_158646 ) ) ( not ( = ?auto_158643 ?auto_158645 ) ) ( not ( = ?auto_158643 ?auto_158642 ) ) ( not ( = ?auto_158646 ?auto_158645 ) ) ( not ( = ?auto_158646 ?auto_158642 ) ) ( not ( = ?auto_158645 ?auto_158642 ) ) ( not ( = ?auto_158638 ?auto_158645 ) ) ( not ( = ?auto_158638 ?auto_158643 ) ) ( not ( = ?auto_158638 ?auto_158646 ) ) ( not ( = ?auto_158639 ?auto_158645 ) ) ( not ( = ?auto_158639 ?auto_158643 ) ) ( not ( = ?auto_158639 ?auto_158646 ) ) ( not ( = ?auto_158640 ?auto_158645 ) ) ( not ( = ?auto_158640 ?auto_158643 ) ) ( not ( = ?auto_158640 ?auto_158646 ) ) ( not ( = ?auto_158641 ?auto_158645 ) ) ( not ( = ?auto_158641 ?auto_158643 ) ) ( not ( = ?auto_158641 ?auto_158646 ) ) ( not ( = ?auto_158644 ?auto_158645 ) ) ( not ( = ?auto_158644 ?auto_158643 ) ) ( not ( = ?auto_158644 ?auto_158646 ) ) ( ON ?auto_158642 ?auto_158644 ) ( CLEAR ?auto_158646 ) ( ON ?auto_158645 ?auto_158642 ) ( CLEAR ?auto_158645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_158638 ?auto_158639 ?auto_158640 ?auto_158641 ?auto_158644 ?auto_158642 )
      ( MAKE-3PILE ?auto_158638 ?auto_158639 ?auto_158640 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158647 - BLOCK
      ?auto_158648 - BLOCK
      ?auto_158649 - BLOCK
    )
    :vars
    (
      ?auto_158652 - BLOCK
      ?auto_158654 - BLOCK
      ?auto_158655 - BLOCK
      ?auto_158653 - BLOCK
      ?auto_158650 - BLOCK
      ?auto_158651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158652 ?auto_158649 ) ( ON-TABLE ?auto_158647 ) ( ON ?auto_158648 ?auto_158647 ) ( ON ?auto_158649 ?auto_158648 ) ( not ( = ?auto_158647 ?auto_158648 ) ) ( not ( = ?auto_158647 ?auto_158649 ) ) ( not ( = ?auto_158647 ?auto_158652 ) ) ( not ( = ?auto_158648 ?auto_158649 ) ) ( not ( = ?auto_158648 ?auto_158652 ) ) ( not ( = ?auto_158649 ?auto_158652 ) ) ( not ( = ?auto_158647 ?auto_158654 ) ) ( not ( = ?auto_158647 ?auto_158655 ) ) ( not ( = ?auto_158648 ?auto_158654 ) ) ( not ( = ?auto_158648 ?auto_158655 ) ) ( not ( = ?auto_158649 ?auto_158654 ) ) ( not ( = ?auto_158649 ?auto_158655 ) ) ( not ( = ?auto_158652 ?auto_158654 ) ) ( not ( = ?auto_158652 ?auto_158655 ) ) ( not ( = ?auto_158654 ?auto_158655 ) ) ( ON ?auto_158654 ?auto_158652 ) ( ON-TABLE ?auto_158653 ) ( not ( = ?auto_158653 ?auto_158650 ) ) ( not ( = ?auto_158653 ?auto_158651 ) ) ( not ( = ?auto_158653 ?auto_158655 ) ) ( not ( = ?auto_158650 ?auto_158651 ) ) ( not ( = ?auto_158650 ?auto_158655 ) ) ( not ( = ?auto_158651 ?auto_158655 ) ) ( not ( = ?auto_158647 ?auto_158651 ) ) ( not ( = ?auto_158647 ?auto_158653 ) ) ( not ( = ?auto_158647 ?auto_158650 ) ) ( not ( = ?auto_158648 ?auto_158651 ) ) ( not ( = ?auto_158648 ?auto_158653 ) ) ( not ( = ?auto_158648 ?auto_158650 ) ) ( not ( = ?auto_158649 ?auto_158651 ) ) ( not ( = ?auto_158649 ?auto_158653 ) ) ( not ( = ?auto_158649 ?auto_158650 ) ) ( not ( = ?auto_158652 ?auto_158651 ) ) ( not ( = ?auto_158652 ?auto_158653 ) ) ( not ( = ?auto_158652 ?auto_158650 ) ) ( not ( = ?auto_158654 ?auto_158651 ) ) ( not ( = ?auto_158654 ?auto_158653 ) ) ( not ( = ?auto_158654 ?auto_158650 ) ) ( ON ?auto_158655 ?auto_158654 ) ( ON ?auto_158651 ?auto_158655 ) ( CLEAR ?auto_158651 ) ( HOLDING ?auto_158650 ) ( CLEAR ?auto_158653 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_158653 ?auto_158650 )
      ( MAKE-3PILE ?auto_158647 ?auto_158648 ?auto_158649 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160514 - BLOCK
      ?auto_160515 - BLOCK
      ?auto_160516 - BLOCK
    )
    :vars
    (
      ?auto_160518 - BLOCK
      ?auto_160520 - BLOCK
      ?auto_160521 - BLOCK
      ?auto_160517 - BLOCK
      ?auto_160519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160518 ?auto_160516 ) ( ON-TABLE ?auto_160514 ) ( ON ?auto_160515 ?auto_160514 ) ( ON ?auto_160516 ?auto_160515 ) ( not ( = ?auto_160514 ?auto_160515 ) ) ( not ( = ?auto_160514 ?auto_160516 ) ) ( not ( = ?auto_160514 ?auto_160518 ) ) ( not ( = ?auto_160515 ?auto_160516 ) ) ( not ( = ?auto_160515 ?auto_160518 ) ) ( not ( = ?auto_160516 ?auto_160518 ) ) ( not ( = ?auto_160514 ?auto_160520 ) ) ( not ( = ?auto_160514 ?auto_160521 ) ) ( not ( = ?auto_160515 ?auto_160520 ) ) ( not ( = ?auto_160515 ?auto_160521 ) ) ( not ( = ?auto_160516 ?auto_160520 ) ) ( not ( = ?auto_160516 ?auto_160521 ) ) ( not ( = ?auto_160518 ?auto_160520 ) ) ( not ( = ?auto_160518 ?auto_160521 ) ) ( not ( = ?auto_160520 ?auto_160521 ) ) ( ON ?auto_160520 ?auto_160518 ) ( not ( = ?auto_160517 ?auto_160519 ) ) ( not ( = ?auto_160517 ?auto_160521 ) ) ( not ( = ?auto_160519 ?auto_160521 ) ) ( not ( = ?auto_160514 ?auto_160519 ) ) ( not ( = ?auto_160514 ?auto_160517 ) ) ( not ( = ?auto_160515 ?auto_160519 ) ) ( not ( = ?auto_160515 ?auto_160517 ) ) ( not ( = ?auto_160516 ?auto_160519 ) ) ( not ( = ?auto_160516 ?auto_160517 ) ) ( not ( = ?auto_160518 ?auto_160519 ) ) ( not ( = ?auto_160518 ?auto_160517 ) ) ( not ( = ?auto_160520 ?auto_160519 ) ) ( not ( = ?auto_160520 ?auto_160517 ) ) ( ON ?auto_160521 ?auto_160520 ) ( ON ?auto_160519 ?auto_160521 ) ( ON ?auto_160517 ?auto_160519 ) ( CLEAR ?auto_160517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160514 ?auto_160515 ?auto_160516 ?auto_160518 ?auto_160520 ?auto_160521 ?auto_160519 )
      ( MAKE-3PILE ?auto_160514 ?auto_160515 ?auto_160516 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158665 - BLOCK
      ?auto_158666 - BLOCK
      ?auto_158667 - BLOCK
    )
    :vars
    (
      ?auto_158670 - BLOCK
      ?auto_158668 - BLOCK
      ?auto_158673 - BLOCK
      ?auto_158669 - BLOCK
      ?auto_158671 - BLOCK
      ?auto_158672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158670 ?auto_158667 ) ( ON-TABLE ?auto_158665 ) ( ON ?auto_158666 ?auto_158665 ) ( ON ?auto_158667 ?auto_158666 ) ( not ( = ?auto_158665 ?auto_158666 ) ) ( not ( = ?auto_158665 ?auto_158667 ) ) ( not ( = ?auto_158665 ?auto_158670 ) ) ( not ( = ?auto_158666 ?auto_158667 ) ) ( not ( = ?auto_158666 ?auto_158670 ) ) ( not ( = ?auto_158667 ?auto_158670 ) ) ( not ( = ?auto_158665 ?auto_158668 ) ) ( not ( = ?auto_158665 ?auto_158673 ) ) ( not ( = ?auto_158666 ?auto_158668 ) ) ( not ( = ?auto_158666 ?auto_158673 ) ) ( not ( = ?auto_158667 ?auto_158668 ) ) ( not ( = ?auto_158667 ?auto_158673 ) ) ( not ( = ?auto_158670 ?auto_158668 ) ) ( not ( = ?auto_158670 ?auto_158673 ) ) ( not ( = ?auto_158668 ?auto_158673 ) ) ( ON ?auto_158668 ?auto_158670 ) ( not ( = ?auto_158669 ?auto_158671 ) ) ( not ( = ?auto_158669 ?auto_158672 ) ) ( not ( = ?auto_158669 ?auto_158673 ) ) ( not ( = ?auto_158671 ?auto_158672 ) ) ( not ( = ?auto_158671 ?auto_158673 ) ) ( not ( = ?auto_158672 ?auto_158673 ) ) ( not ( = ?auto_158665 ?auto_158672 ) ) ( not ( = ?auto_158665 ?auto_158669 ) ) ( not ( = ?auto_158665 ?auto_158671 ) ) ( not ( = ?auto_158666 ?auto_158672 ) ) ( not ( = ?auto_158666 ?auto_158669 ) ) ( not ( = ?auto_158666 ?auto_158671 ) ) ( not ( = ?auto_158667 ?auto_158672 ) ) ( not ( = ?auto_158667 ?auto_158669 ) ) ( not ( = ?auto_158667 ?auto_158671 ) ) ( not ( = ?auto_158670 ?auto_158672 ) ) ( not ( = ?auto_158670 ?auto_158669 ) ) ( not ( = ?auto_158670 ?auto_158671 ) ) ( not ( = ?auto_158668 ?auto_158672 ) ) ( not ( = ?auto_158668 ?auto_158669 ) ) ( not ( = ?auto_158668 ?auto_158671 ) ) ( ON ?auto_158673 ?auto_158668 ) ( ON ?auto_158672 ?auto_158673 ) ( ON ?auto_158671 ?auto_158672 ) ( CLEAR ?auto_158671 ) ( HOLDING ?auto_158669 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158669 )
      ( MAKE-3PILE ?auto_158665 ?auto_158666 ?auto_158667 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158674 - BLOCK
      ?auto_158675 - BLOCK
      ?auto_158676 - BLOCK
    )
    :vars
    (
      ?auto_158677 - BLOCK
      ?auto_158678 - BLOCK
      ?auto_158680 - BLOCK
      ?auto_158681 - BLOCK
      ?auto_158682 - BLOCK
      ?auto_158679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158677 ?auto_158676 ) ( ON-TABLE ?auto_158674 ) ( ON ?auto_158675 ?auto_158674 ) ( ON ?auto_158676 ?auto_158675 ) ( not ( = ?auto_158674 ?auto_158675 ) ) ( not ( = ?auto_158674 ?auto_158676 ) ) ( not ( = ?auto_158674 ?auto_158677 ) ) ( not ( = ?auto_158675 ?auto_158676 ) ) ( not ( = ?auto_158675 ?auto_158677 ) ) ( not ( = ?auto_158676 ?auto_158677 ) ) ( not ( = ?auto_158674 ?auto_158678 ) ) ( not ( = ?auto_158674 ?auto_158680 ) ) ( not ( = ?auto_158675 ?auto_158678 ) ) ( not ( = ?auto_158675 ?auto_158680 ) ) ( not ( = ?auto_158676 ?auto_158678 ) ) ( not ( = ?auto_158676 ?auto_158680 ) ) ( not ( = ?auto_158677 ?auto_158678 ) ) ( not ( = ?auto_158677 ?auto_158680 ) ) ( not ( = ?auto_158678 ?auto_158680 ) ) ( ON ?auto_158678 ?auto_158677 ) ( not ( = ?auto_158681 ?auto_158682 ) ) ( not ( = ?auto_158681 ?auto_158679 ) ) ( not ( = ?auto_158681 ?auto_158680 ) ) ( not ( = ?auto_158682 ?auto_158679 ) ) ( not ( = ?auto_158682 ?auto_158680 ) ) ( not ( = ?auto_158679 ?auto_158680 ) ) ( not ( = ?auto_158674 ?auto_158679 ) ) ( not ( = ?auto_158674 ?auto_158681 ) ) ( not ( = ?auto_158674 ?auto_158682 ) ) ( not ( = ?auto_158675 ?auto_158679 ) ) ( not ( = ?auto_158675 ?auto_158681 ) ) ( not ( = ?auto_158675 ?auto_158682 ) ) ( not ( = ?auto_158676 ?auto_158679 ) ) ( not ( = ?auto_158676 ?auto_158681 ) ) ( not ( = ?auto_158676 ?auto_158682 ) ) ( not ( = ?auto_158677 ?auto_158679 ) ) ( not ( = ?auto_158677 ?auto_158681 ) ) ( not ( = ?auto_158677 ?auto_158682 ) ) ( not ( = ?auto_158678 ?auto_158679 ) ) ( not ( = ?auto_158678 ?auto_158681 ) ) ( not ( = ?auto_158678 ?auto_158682 ) ) ( ON ?auto_158680 ?auto_158678 ) ( ON ?auto_158679 ?auto_158680 ) ( ON ?auto_158682 ?auto_158679 ) ( ON ?auto_158681 ?auto_158682 ) ( CLEAR ?auto_158681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_158674 ?auto_158675 ?auto_158676 ?auto_158677 ?auto_158678 ?auto_158680 ?auto_158679 ?auto_158682 )
      ( MAKE-3PILE ?auto_158674 ?auto_158675 ?auto_158676 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158689 - BLOCK
      ?auto_158690 - BLOCK
      ?auto_158691 - BLOCK
      ?auto_158692 - BLOCK
      ?auto_158693 - BLOCK
      ?auto_158694 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_158694 ) ( CLEAR ?auto_158693 ) ( ON-TABLE ?auto_158689 ) ( ON ?auto_158690 ?auto_158689 ) ( ON ?auto_158691 ?auto_158690 ) ( ON ?auto_158692 ?auto_158691 ) ( ON ?auto_158693 ?auto_158692 ) ( not ( = ?auto_158689 ?auto_158690 ) ) ( not ( = ?auto_158689 ?auto_158691 ) ) ( not ( = ?auto_158689 ?auto_158692 ) ) ( not ( = ?auto_158689 ?auto_158693 ) ) ( not ( = ?auto_158689 ?auto_158694 ) ) ( not ( = ?auto_158690 ?auto_158691 ) ) ( not ( = ?auto_158690 ?auto_158692 ) ) ( not ( = ?auto_158690 ?auto_158693 ) ) ( not ( = ?auto_158690 ?auto_158694 ) ) ( not ( = ?auto_158691 ?auto_158692 ) ) ( not ( = ?auto_158691 ?auto_158693 ) ) ( not ( = ?auto_158691 ?auto_158694 ) ) ( not ( = ?auto_158692 ?auto_158693 ) ) ( not ( = ?auto_158692 ?auto_158694 ) ) ( not ( = ?auto_158693 ?auto_158694 ) ) )
    :subtasks
    ( ( !STACK ?auto_158694 ?auto_158693 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158695 - BLOCK
      ?auto_158696 - BLOCK
      ?auto_158697 - BLOCK
      ?auto_158698 - BLOCK
      ?auto_158699 - BLOCK
      ?auto_158700 - BLOCK
    )
    :vars
    (
      ?auto_158701 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_158699 ) ( ON-TABLE ?auto_158695 ) ( ON ?auto_158696 ?auto_158695 ) ( ON ?auto_158697 ?auto_158696 ) ( ON ?auto_158698 ?auto_158697 ) ( ON ?auto_158699 ?auto_158698 ) ( not ( = ?auto_158695 ?auto_158696 ) ) ( not ( = ?auto_158695 ?auto_158697 ) ) ( not ( = ?auto_158695 ?auto_158698 ) ) ( not ( = ?auto_158695 ?auto_158699 ) ) ( not ( = ?auto_158695 ?auto_158700 ) ) ( not ( = ?auto_158696 ?auto_158697 ) ) ( not ( = ?auto_158696 ?auto_158698 ) ) ( not ( = ?auto_158696 ?auto_158699 ) ) ( not ( = ?auto_158696 ?auto_158700 ) ) ( not ( = ?auto_158697 ?auto_158698 ) ) ( not ( = ?auto_158697 ?auto_158699 ) ) ( not ( = ?auto_158697 ?auto_158700 ) ) ( not ( = ?auto_158698 ?auto_158699 ) ) ( not ( = ?auto_158698 ?auto_158700 ) ) ( not ( = ?auto_158699 ?auto_158700 ) ) ( ON ?auto_158700 ?auto_158701 ) ( CLEAR ?auto_158700 ) ( HAND-EMPTY ) ( not ( = ?auto_158695 ?auto_158701 ) ) ( not ( = ?auto_158696 ?auto_158701 ) ) ( not ( = ?auto_158697 ?auto_158701 ) ) ( not ( = ?auto_158698 ?auto_158701 ) ) ( not ( = ?auto_158699 ?auto_158701 ) ) ( not ( = ?auto_158700 ?auto_158701 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158700 ?auto_158701 )
      ( MAKE-6PILE ?auto_158695 ?auto_158696 ?auto_158697 ?auto_158698 ?auto_158699 ?auto_158700 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158702 - BLOCK
      ?auto_158703 - BLOCK
      ?auto_158704 - BLOCK
      ?auto_158705 - BLOCK
      ?auto_158706 - BLOCK
      ?auto_158707 - BLOCK
    )
    :vars
    (
      ?auto_158708 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158702 ) ( ON ?auto_158703 ?auto_158702 ) ( ON ?auto_158704 ?auto_158703 ) ( ON ?auto_158705 ?auto_158704 ) ( not ( = ?auto_158702 ?auto_158703 ) ) ( not ( = ?auto_158702 ?auto_158704 ) ) ( not ( = ?auto_158702 ?auto_158705 ) ) ( not ( = ?auto_158702 ?auto_158706 ) ) ( not ( = ?auto_158702 ?auto_158707 ) ) ( not ( = ?auto_158703 ?auto_158704 ) ) ( not ( = ?auto_158703 ?auto_158705 ) ) ( not ( = ?auto_158703 ?auto_158706 ) ) ( not ( = ?auto_158703 ?auto_158707 ) ) ( not ( = ?auto_158704 ?auto_158705 ) ) ( not ( = ?auto_158704 ?auto_158706 ) ) ( not ( = ?auto_158704 ?auto_158707 ) ) ( not ( = ?auto_158705 ?auto_158706 ) ) ( not ( = ?auto_158705 ?auto_158707 ) ) ( not ( = ?auto_158706 ?auto_158707 ) ) ( ON ?auto_158707 ?auto_158708 ) ( CLEAR ?auto_158707 ) ( not ( = ?auto_158702 ?auto_158708 ) ) ( not ( = ?auto_158703 ?auto_158708 ) ) ( not ( = ?auto_158704 ?auto_158708 ) ) ( not ( = ?auto_158705 ?auto_158708 ) ) ( not ( = ?auto_158706 ?auto_158708 ) ) ( not ( = ?auto_158707 ?auto_158708 ) ) ( HOLDING ?auto_158706 ) ( CLEAR ?auto_158705 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_158702 ?auto_158703 ?auto_158704 ?auto_158705 ?auto_158706 )
      ( MAKE-6PILE ?auto_158702 ?auto_158703 ?auto_158704 ?auto_158705 ?auto_158706 ?auto_158707 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158709 - BLOCK
      ?auto_158710 - BLOCK
      ?auto_158711 - BLOCK
      ?auto_158712 - BLOCK
      ?auto_158713 - BLOCK
      ?auto_158714 - BLOCK
    )
    :vars
    (
      ?auto_158715 - BLOCK
      ?auto_158716 - BLOCK
      ?auto_158717 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158709 ) ( ON ?auto_158710 ?auto_158709 ) ( ON ?auto_158711 ?auto_158710 ) ( ON ?auto_158712 ?auto_158711 ) ( not ( = ?auto_158709 ?auto_158710 ) ) ( not ( = ?auto_158709 ?auto_158711 ) ) ( not ( = ?auto_158709 ?auto_158712 ) ) ( not ( = ?auto_158709 ?auto_158713 ) ) ( not ( = ?auto_158709 ?auto_158714 ) ) ( not ( = ?auto_158710 ?auto_158711 ) ) ( not ( = ?auto_158710 ?auto_158712 ) ) ( not ( = ?auto_158710 ?auto_158713 ) ) ( not ( = ?auto_158710 ?auto_158714 ) ) ( not ( = ?auto_158711 ?auto_158712 ) ) ( not ( = ?auto_158711 ?auto_158713 ) ) ( not ( = ?auto_158711 ?auto_158714 ) ) ( not ( = ?auto_158712 ?auto_158713 ) ) ( not ( = ?auto_158712 ?auto_158714 ) ) ( not ( = ?auto_158713 ?auto_158714 ) ) ( ON ?auto_158714 ?auto_158715 ) ( not ( = ?auto_158709 ?auto_158715 ) ) ( not ( = ?auto_158710 ?auto_158715 ) ) ( not ( = ?auto_158711 ?auto_158715 ) ) ( not ( = ?auto_158712 ?auto_158715 ) ) ( not ( = ?auto_158713 ?auto_158715 ) ) ( not ( = ?auto_158714 ?auto_158715 ) ) ( CLEAR ?auto_158712 ) ( ON ?auto_158713 ?auto_158714 ) ( CLEAR ?auto_158713 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158716 ) ( ON ?auto_158717 ?auto_158716 ) ( ON ?auto_158715 ?auto_158717 ) ( not ( = ?auto_158716 ?auto_158717 ) ) ( not ( = ?auto_158716 ?auto_158715 ) ) ( not ( = ?auto_158716 ?auto_158714 ) ) ( not ( = ?auto_158716 ?auto_158713 ) ) ( not ( = ?auto_158717 ?auto_158715 ) ) ( not ( = ?auto_158717 ?auto_158714 ) ) ( not ( = ?auto_158717 ?auto_158713 ) ) ( not ( = ?auto_158709 ?auto_158716 ) ) ( not ( = ?auto_158709 ?auto_158717 ) ) ( not ( = ?auto_158710 ?auto_158716 ) ) ( not ( = ?auto_158710 ?auto_158717 ) ) ( not ( = ?auto_158711 ?auto_158716 ) ) ( not ( = ?auto_158711 ?auto_158717 ) ) ( not ( = ?auto_158712 ?auto_158716 ) ) ( not ( = ?auto_158712 ?auto_158717 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_158716 ?auto_158717 ?auto_158715 ?auto_158714 )
      ( MAKE-6PILE ?auto_158709 ?auto_158710 ?auto_158711 ?auto_158712 ?auto_158713 ?auto_158714 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158718 - BLOCK
      ?auto_158719 - BLOCK
      ?auto_158720 - BLOCK
      ?auto_158721 - BLOCK
      ?auto_158722 - BLOCK
      ?auto_158723 - BLOCK
    )
    :vars
    (
      ?auto_158725 - BLOCK
      ?auto_158726 - BLOCK
      ?auto_158724 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158718 ) ( ON ?auto_158719 ?auto_158718 ) ( ON ?auto_158720 ?auto_158719 ) ( not ( = ?auto_158718 ?auto_158719 ) ) ( not ( = ?auto_158718 ?auto_158720 ) ) ( not ( = ?auto_158718 ?auto_158721 ) ) ( not ( = ?auto_158718 ?auto_158722 ) ) ( not ( = ?auto_158718 ?auto_158723 ) ) ( not ( = ?auto_158719 ?auto_158720 ) ) ( not ( = ?auto_158719 ?auto_158721 ) ) ( not ( = ?auto_158719 ?auto_158722 ) ) ( not ( = ?auto_158719 ?auto_158723 ) ) ( not ( = ?auto_158720 ?auto_158721 ) ) ( not ( = ?auto_158720 ?auto_158722 ) ) ( not ( = ?auto_158720 ?auto_158723 ) ) ( not ( = ?auto_158721 ?auto_158722 ) ) ( not ( = ?auto_158721 ?auto_158723 ) ) ( not ( = ?auto_158722 ?auto_158723 ) ) ( ON ?auto_158723 ?auto_158725 ) ( not ( = ?auto_158718 ?auto_158725 ) ) ( not ( = ?auto_158719 ?auto_158725 ) ) ( not ( = ?auto_158720 ?auto_158725 ) ) ( not ( = ?auto_158721 ?auto_158725 ) ) ( not ( = ?auto_158722 ?auto_158725 ) ) ( not ( = ?auto_158723 ?auto_158725 ) ) ( ON ?auto_158722 ?auto_158723 ) ( CLEAR ?auto_158722 ) ( ON-TABLE ?auto_158726 ) ( ON ?auto_158724 ?auto_158726 ) ( ON ?auto_158725 ?auto_158724 ) ( not ( = ?auto_158726 ?auto_158724 ) ) ( not ( = ?auto_158726 ?auto_158725 ) ) ( not ( = ?auto_158726 ?auto_158723 ) ) ( not ( = ?auto_158726 ?auto_158722 ) ) ( not ( = ?auto_158724 ?auto_158725 ) ) ( not ( = ?auto_158724 ?auto_158723 ) ) ( not ( = ?auto_158724 ?auto_158722 ) ) ( not ( = ?auto_158718 ?auto_158726 ) ) ( not ( = ?auto_158718 ?auto_158724 ) ) ( not ( = ?auto_158719 ?auto_158726 ) ) ( not ( = ?auto_158719 ?auto_158724 ) ) ( not ( = ?auto_158720 ?auto_158726 ) ) ( not ( = ?auto_158720 ?auto_158724 ) ) ( not ( = ?auto_158721 ?auto_158726 ) ) ( not ( = ?auto_158721 ?auto_158724 ) ) ( HOLDING ?auto_158721 ) ( CLEAR ?auto_158720 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_158718 ?auto_158719 ?auto_158720 ?auto_158721 )
      ( MAKE-6PILE ?auto_158718 ?auto_158719 ?auto_158720 ?auto_158721 ?auto_158722 ?auto_158723 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158727 - BLOCK
      ?auto_158728 - BLOCK
      ?auto_158729 - BLOCK
      ?auto_158730 - BLOCK
      ?auto_158731 - BLOCK
      ?auto_158732 - BLOCK
    )
    :vars
    (
      ?auto_158733 - BLOCK
      ?auto_158735 - BLOCK
      ?auto_158734 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158727 ) ( ON ?auto_158728 ?auto_158727 ) ( ON ?auto_158729 ?auto_158728 ) ( not ( = ?auto_158727 ?auto_158728 ) ) ( not ( = ?auto_158727 ?auto_158729 ) ) ( not ( = ?auto_158727 ?auto_158730 ) ) ( not ( = ?auto_158727 ?auto_158731 ) ) ( not ( = ?auto_158727 ?auto_158732 ) ) ( not ( = ?auto_158728 ?auto_158729 ) ) ( not ( = ?auto_158728 ?auto_158730 ) ) ( not ( = ?auto_158728 ?auto_158731 ) ) ( not ( = ?auto_158728 ?auto_158732 ) ) ( not ( = ?auto_158729 ?auto_158730 ) ) ( not ( = ?auto_158729 ?auto_158731 ) ) ( not ( = ?auto_158729 ?auto_158732 ) ) ( not ( = ?auto_158730 ?auto_158731 ) ) ( not ( = ?auto_158730 ?auto_158732 ) ) ( not ( = ?auto_158731 ?auto_158732 ) ) ( ON ?auto_158732 ?auto_158733 ) ( not ( = ?auto_158727 ?auto_158733 ) ) ( not ( = ?auto_158728 ?auto_158733 ) ) ( not ( = ?auto_158729 ?auto_158733 ) ) ( not ( = ?auto_158730 ?auto_158733 ) ) ( not ( = ?auto_158731 ?auto_158733 ) ) ( not ( = ?auto_158732 ?auto_158733 ) ) ( ON ?auto_158731 ?auto_158732 ) ( ON-TABLE ?auto_158735 ) ( ON ?auto_158734 ?auto_158735 ) ( ON ?auto_158733 ?auto_158734 ) ( not ( = ?auto_158735 ?auto_158734 ) ) ( not ( = ?auto_158735 ?auto_158733 ) ) ( not ( = ?auto_158735 ?auto_158732 ) ) ( not ( = ?auto_158735 ?auto_158731 ) ) ( not ( = ?auto_158734 ?auto_158733 ) ) ( not ( = ?auto_158734 ?auto_158732 ) ) ( not ( = ?auto_158734 ?auto_158731 ) ) ( not ( = ?auto_158727 ?auto_158735 ) ) ( not ( = ?auto_158727 ?auto_158734 ) ) ( not ( = ?auto_158728 ?auto_158735 ) ) ( not ( = ?auto_158728 ?auto_158734 ) ) ( not ( = ?auto_158729 ?auto_158735 ) ) ( not ( = ?auto_158729 ?auto_158734 ) ) ( not ( = ?auto_158730 ?auto_158735 ) ) ( not ( = ?auto_158730 ?auto_158734 ) ) ( CLEAR ?auto_158729 ) ( ON ?auto_158730 ?auto_158731 ) ( CLEAR ?auto_158730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_158735 ?auto_158734 ?auto_158733 ?auto_158732 ?auto_158731 )
      ( MAKE-6PILE ?auto_158727 ?auto_158728 ?auto_158729 ?auto_158730 ?auto_158731 ?auto_158732 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158736 - BLOCK
      ?auto_158737 - BLOCK
      ?auto_158738 - BLOCK
      ?auto_158739 - BLOCK
      ?auto_158740 - BLOCK
      ?auto_158741 - BLOCK
    )
    :vars
    (
      ?auto_158744 - BLOCK
      ?auto_158743 - BLOCK
      ?auto_158742 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158736 ) ( ON ?auto_158737 ?auto_158736 ) ( not ( = ?auto_158736 ?auto_158737 ) ) ( not ( = ?auto_158736 ?auto_158738 ) ) ( not ( = ?auto_158736 ?auto_158739 ) ) ( not ( = ?auto_158736 ?auto_158740 ) ) ( not ( = ?auto_158736 ?auto_158741 ) ) ( not ( = ?auto_158737 ?auto_158738 ) ) ( not ( = ?auto_158737 ?auto_158739 ) ) ( not ( = ?auto_158737 ?auto_158740 ) ) ( not ( = ?auto_158737 ?auto_158741 ) ) ( not ( = ?auto_158738 ?auto_158739 ) ) ( not ( = ?auto_158738 ?auto_158740 ) ) ( not ( = ?auto_158738 ?auto_158741 ) ) ( not ( = ?auto_158739 ?auto_158740 ) ) ( not ( = ?auto_158739 ?auto_158741 ) ) ( not ( = ?auto_158740 ?auto_158741 ) ) ( ON ?auto_158741 ?auto_158744 ) ( not ( = ?auto_158736 ?auto_158744 ) ) ( not ( = ?auto_158737 ?auto_158744 ) ) ( not ( = ?auto_158738 ?auto_158744 ) ) ( not ( = ?auto_158739 ?auto_158744 ) ) ( not ( = ?auto_158740 ?auto_158744 ) ) ( not ( = ?auto_158741 ?auto_158744 ) ) ( ON ?auto_158740 ?auto_158741 ) ( ON-TABLE ?auto_158743 ) ( ON ?auto_158742 ?auto_158743 ) ( ON ?auto_158744 ?auto_158742 ) ( not ( = ?auto_158743 ?auto_158742 ) ) ( not ( = ?auto_158743 ?auto_158744 ) ) ( not ( = ?auto_158743 ?auto_158741 ) ) ( not ( = ?auto_158743 ?auto_158740 ) ) ( not ( = ?auto_158742 ?auto_158744 ) ) ( not ( = ?auto_158742 ?auto_158741 ) ) ( not ( = ?auto_158742 ?auto_158740 ) ) ( not ( = ?auto_158736 ?auto_158743 ) ) ( not ( = ?auto_158736 ?auto_158742 ) ) ( not ( = ?auto_158737 ?auto_158743 ) ) ( not ( = ?auto_158737 ?auto_158742 ) ) ( not ( = ?auto_158738 ?auto_158743 ) ) ( not ( = ?auto_158738 ?auto_158742 ) ) ( not ( = ?auto_158739 ?auto_158743 ) ) ( not ( = ?auto_158739 ?auto_158742 ) ) ( ON ?auto_158739 ?auto_158740 ) ( CLEAR ?auto_158739 ) ( HOLDING ?auto_158738 ) ( CLEAR ?auto_158737 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_158736 ?auto_158737 ?auto_158738 )
      ( MAKE-6PILE ?auto_158736 ?auto_158737 ?auto_158738 ?auto_158739 ?auto_158740 ?auto_158741 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158745 - BLOCK
      ?auto_158746 - BLOCK
      ?auto_158747 - BLOCK
      ?auto_158748 - BLOCK
      ?auto_158749 - BLOCK
      ?auto_158750 - BLOCK
    )
    :vars
    (
      ?auto_158753 - BLOCK
      ?auto_158751 - BLOCK
      ?auto_158752 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158745 ) ( ON ?auto_158746 ?auto_158745 ) ( not ( = ?auto_158745 ?auto_158746 ) ) ( not ( = ?auto_158745 ?auto_158747 ) ) ( not ( = ?auto_158745 ?auto_158748 ) ) ( not ( = ?auto_158745 ?auto_158749 ) ) ( not ( = ?auto_158745 ?auto_158750 ) ) ( not ( = ?auto_158746 ?auto_158747 ) ) ( not ( = ?auto_158746 ?auto_158748 ) ) ( not ( = ?auto_158746 ?auto_158749 ) ) ( not ( = ?auto_158746 ?auto_158750 ) ) ( not ( = ?auto_158747 ?auto_158748 ) ) ( not ( = ?auto_158747 ?auto_158749 ) ) ( not ( = ?auto_158747 ?auto_158750 ) ) ( not ( = ?auto_158748 ?auto_158749 ) ) ( not ( = ?auto_158748 ?auto_158750 ) ) ( not ( = ?auto_158749 ?auto_158750 ) ) ( ON ?auto_158750 ?auto_158753 ) ( not ( = ?auto_158745 ?auto_158753 ) ) ( not ( = ?auto_158746 ?auto_158753 ) ) ( not ( = ?auto_158747 ?auto_158753 ) ) ( not ( = ?auto_158748 ?auto_158753 ) ) ( not ( = ?auto_158749 ?auto_158753 ) ) ( not ( = ?auto_158750 ?auto_158753 ) ) ( ON ?auto_158749 ?auto_158750 ) ( ON-TABLE ?auto_158751 ) ( ON ?auto_158752 ?auto_158751 ) ( ON ?auto_158753 ?auto_158752 ) ( not ( = ?auto_158751 ?auto_158752 ) ) ( not ( = ?auto_158751 ?auto_158753 ) ) ( not ( = ?auto_158751 ?auto_158750 ) ) ( not ( = ?auto_158751 ?auto_158749 ) ) ( not ( = ?auto_158752 ?auto_158753 ) ) ( not ( = ?auto_158752 ?auto_158750 ) ) ( not ( = ?auto_158752 ?auto_158749 ) ) ( not ( = ?auto_158745 ?auto_158751 ) ) ( not ( = ?auto_158745 ?auto_158752 ) ) ( not ( = ?auto_158746 ?auto_158751 ) ) ( not ( = ?auto_158746 ?auto_158752 ) ) ( not ( = ?auto_158747 ?auto_158751 ) ) ( not ( = ?auto_158747 ?auto_158752 ) ) ( not ( = ?auto_158748 ?auto_158751 ) ) ( not ( = ?auto_158748 ?auto_158752 ) ) ( ON ?auto_158748 ?auto_158749 ) ( CLEAR ?auto_158746 ) ( ON ?auto_158747 ?auto_158748 ) ( CLEAR ?auto_158747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_158751 ?auto_158752 ?auto_158753 ?auto_158750 ?auto_158749 ?auto_158748 )
      ( MAKE-6PILE ?auto_158745 ?auto_158746 ?auto_158747 ?auto_158748 ?auto_158749 ?auto_158750 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158754 - BLOCK
      ?auto_158755 - BLOCK
      ?auto_158756 - BLOCK
      ?auto_158757 - BLOCK
      ?auto_158758 - BLOCK
      ?auto_158759 - BLOCK
    )
    :vars
    (
      ?auto_158761 - BLOCK
      ?auto_158762 - BLOCK
      ?auto_158760 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158754 ) ( not ( = ?auto_158754 ?auto_158755 ) ) ( not ( = ?auto_158754 ?auto_158756 ) ) ( not ( = ?auto_158754 ?auto_158757 ) ) ( not ( = ?auto_158754 ?auto_158758 ) ) ( not ( = ?auto_158754 ?auto_158759 ) ) ( not ( = ?auto_158755 ?auto_158756 ) ) ( not ( = ?auto_158755 ?auto_158757 ) ) ( not ( = ?auto_158755 ?auto_158758 ) ) ( not ( = ?auto_158755 ?auto_158759 ) ) ( not ( = ?auto_158756 ?auto_158757 ) ) ( not ( = ?auto_158756 ?auto_158758 ) ) ( not ( = ?auto_158756 ?auto_158759 ) ) ( not ( = ?auto_158757 ?auto_158758 ) ) ( not ( = ?auto_158757 ?auto_158759 ) ) ( not ( = ?auto_158758 ?auto_158759 ) ) ( ON ?auto_158759 ?auto_158761 ) ( not ( = ?auto_158754 ?auto_158761 ) ) ( not ( = ?auto_158755 ?auto_158761 ) ) ( not ( = ?auto_158756 ?auto_158761 ) ) ( not ( = ?auto_158757 ?auto_158761 ) ) ( not ( = ?auto_158758 ?auto_158761 ) ) ( not ( = ?auto_158759 ?auto_158761 ) ) ( ON ?auto_158758 ?auto_158759 ) ( ON-TABLE ?auto_158762 ) ( ON ?auto_158760 ?auto_158762 ) ( ON ?auto_158761 ?auto_158760 ) ( not ( = ?auto_158762 ?auto_158760 ) ) ( not ( = ?auto_158762 ?auto_158761 ) ) ( not ( = ?auto_158762 ?auto_158759 ) ) ( not ( = ?auto_158762 ?auto_158758 ) ) ( not ( = ?auto_158760 ?auto_158761 ) ) ( not ( = ?auto_158760 ?auto_158759 ) ) ( not ( = ?auto_158760 ?auto_158758 ) ) ( not ( = ?auto_158754 ?auto_158762 ) ) ( not ( = ?auto_158754 ?auto_158760 ) ) ( not ( = ?auto_158755 ?auto_158762 ) ) ( not ( = ?auto_158755 ?auto_158760 ) ) ( not ( = ?auto_158756 ?auto_158762 ) ) ( not ( = ?auto_158756 ?auto_158760 ) ) ( not ( = ?auto_158757 ?auto_158762 ) ) ( not ( = ?auto_158757 ?auto_158760 ) ) ( ON ?auto_158757 ?auto_158758 ) ( ON ?auto_158756 ?auto_158757 ) ( CLEAR ?auto_158756 ) ( HOLDING ?auto_158755 ) ( CLEAR ?auto_158754 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_158754 ?auto_158755 )
      ( MAKE-6PILE ?auto_158754 ?auto_158755 ?auto_158756 ?auto_158757 ?auto_158758 ?auto_158759 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158763 - BLOCK
      ?auto_158764 - BLOCK
      ?auto_158765 - BLOCK
      ?auto_158766 - BLOCK
      ?auto_158767 - BLOCK
      ?auto_158768 - BLOCK
    )
    :vars
    (
      ?auto_158771 - BLOCK
      ?auto_158769 - BLOCK
      ?auto_158770 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158763 ) ( not ( = ?auto_158763 ?auto_158764 ) ) ( not ( = ?auto_158763 ?auto_158765 ) ) ( not ( = ?auto_158763 ?auto_158766 ) ) ( not ( = ?auto_158763 ?auto_158767 ) ) ( not ( = ?auto_158763 ?auto_158768 ) ) ( not ( = ?auto_158764 ?auto_158765 ) ) ( not ( = ?auto_158764 ?auto_158766 ) ) ( not ( = ?auto_158764 ?auto_158767 ) ) ( not ( = ?auto_158764 ?auto_158768 ) ) ( not ( = ?auto_158765 ?auto_158766 ) ) ( not ( = ?auto_158765 ?auto_158767 ) ) ( not ( = ?auto_158765 ?auto_158768 ) ) ( not ( = ?auto_158766 ?auto_158767 ) ) ( not ( = ?auto_158766 ?auto_158768 ) ) ( not ( = ?auto_158767 ?auto_158768 ) ) ( ON ?auto_158768 ?auto_158771 ) ( not ( = ?auto_158763 ?auto_158771 ) ) ( not ( = ?auto_158764 ?auto_158771 ) ) ( not ( = ?auto_158765 ?auto_158771 ) ) ( not ( = ?auto_158766 ?auto_158771 ) ) ( not ( = ?auto_158767 ?auto_158771 ) ) ( not ( = ?auto_158768 ?auto_158771 ) ) ( ON ?auto_158767 ?auto_158768 ) ( ON-TABLE ?auto_158769 ) ( ON ?auto_158770 ?auto_158769 ) ( ON ?auto_158771 ?auto_158770 ) ( not ( = ?auto_158769 ?auto_158770 ) ) ( not ( = ?auto_158769 ?auto_158771 ) ) ( not ( = ?auto_158769 ?auto_158768 ) ) ( not ( = ?auto_158769 ?auto_158767 ) ) ( not ( = ?auto_158770 ?auto_158771 ) ) ( not ( = ?auto_158770 ?auto_158768 ) ) ( not ( = ?auto_158770 ?auto_158767 ) ) ( not ( = ?auto_158763 ?auto_158769 ) ) ( not ( = ?auto_158763 ?auto_158770 ) ) ( not ( = ?auto_158764 ?auto_158769 ) ) ( not ( = ?auto_158764 ?auto_158770 ) ) ( not ( = ?auto_158765 ?auto_158769 ) ) ( not ( = ?auto_158765 ?auto_158770 ) ) ( not ( = ?auto_158766 ?auto_158769 ) ) ( not ( = ?auto_158766 ?auto_158770 ) ) ( ON ?auto_158766 ?auto_158767 ) ( ON ?auto_158765 ?auto_158766 ) ( CLEAR ?auto_158763 ) ( ON ?auto_158764 ?auto_158765 ) ( CLEAR ?auto_158764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_158769 ?auto_158770 ?auto_158771 ?auto_158768 ?auto_158767 ?auto_158766 ?auto_158765 )
      ( MAKE-6PILE ?auto_158763 ?auto_158764 ?auto_158765 ?auto_158766 ?auto_158767 ?auto_158768 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158772 - BLOCK
      ?auto_158773 - BLOCK
      ?auto_158774 - BLOCK
      ?auto_158775 - BLOCK
      ?auto_158776 - BLOCK
      ?auto_158777 - BLOCK
    )
    :vars
    (
      ?auto_158778 - BLOCK
      ?auto_158780 - BLOCK
      ?auto_158779 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158772 ?auto_158773 ) ) ( not ( = ?auto_158772 ?auto_158774 ) ) ( not ( = ?auto_158772 ?auto_158775 ) ) ( not ( = ?auto_158772 ?auto_158776 ) ) ( not ( = ?auto_158772 ?auto_158777 ) ) ( not ( = ?auto_158773 ?auto_158774 ) ) ( not ( = ?auto_158773 ?auto_158775 ) ) ( not ( = ?auto_158773 ?auto_158776 ) ) ( not ( = ?auto_158773 ?auto_158777 ) ) ( not ( = ?auto_158774 ?auto_158775 ) ) ( not ( = ?auto_158774 ?auto_158776 ) ) ( not ( = ?auto_158774 ?auto_158777 ) ) ( not ( = ?auto_158775 ?auto_158776 ) ) ( not ( = ?auto_158775 ?auto_158777 ) ) ( not ( = ?auto_158776 ?auto_158777 ) ) ( ON ?auto_158777 ?auto_158778 ) ( not ( = ?auto_158772 ?auto_158778 ) ) ( not ( = ?auto_158773 ?auto_158778 ) ) ( not ( = ?auto_158774 ?auto_158778 ) ) ( not ( = ?auto_158775 ?auto_158778 ) ) ( not ( = ?auto_158776 ?auto_158778 ) ) ( not ( = ?auto_158777 ?auto_158778 ) ) ( ON ?auto_158776 ?auto_158777 ) ( ON-TABLE ?auto_158780 ) ( ON ?auto_158779 ?auto_158780 ) ( ON ?auto_158778 ?auto_158779 ) ( not ( = ?auto_158780 ?auto_158779 ) ) ( not ( = ?auto_158780 ?auto_158778 ) ) ( not ( = ?auto_158780 ?auto_158777 ) ) ( not ( = ?auto_158780 ?auto_158776 ) ) ( not ( = ?auto_158779 ?auto_158778 ) ) ( not ( = ?auto_158779 ?auto_158777 ) ) ( not ( = ?auto_158779 ?auto_158776 ) ) ( not ( = ?auto_158772 ?auto_158780 ) ) ( not ( = ?auto_158772 ?auto_158779 ) ) ( not ( = ?auto_158773 ?auto_158780 ) ) ( not ( = ?auto_158773 ?auto_158779 ) ) ( not ( = ?auto_158774 ?auto_158780 ) ) ( not ( = ?auto_158774 ?auto_158779 ) ) ( not ( = ?auto_158775 ?auto_158780 ) ) ( not ( = ?auto_158775 ?auto_158779 ) ) ( ON ?auto_158775 ?auto_158776 ) ( ON ?auto_158774 ?auto_158775 ) ( ON ?auto_158773 ?auto_158774 ) ( CLEAR ?auto_158773 ) ( HOLDING ?auto_158772 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158772 )
      ( MAKE-6PILE ?auto_158772 ?auto_158773 ?auto_158774 ?auto_158775 ?auto_158776 ?auto_158777 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158781 - BLOCK
      ?auto_158782 - BLOCK
      ?auto_158783 - BLOCK
      ?auto_158784 - BLOCK
      ?auto_158785 - BLOCK
      ?auto_158786 - BLOCK
    )
    :vars
    (
      ?auto_158789 - BLOCK
      ?auto_158787 - BLOCK
      ?auto_158788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158781 ?auto_158782 ) ) ( not ( = ?auto_158781 ?auto_158783 ) ) ( not ( = ?auto_158781 ?auto_158784 ) ) ( not ( = ?auto_158781 ?auto_158785 ) ) ( not ( = ?auto_158781 ?auto_158786 ) ) ( not ( = ?auto_158782 ?auto_158783 ) ) ( not ( = ?auto_158782 ?auto_158784 ) ) ( not ( = ?auto_158782 ?auto_158785 ) ) ( not ( = ?auto_158782 ?auto_158786 ) ) ( not ( = ?auto_158783 ?auto_158784 ) ) ( not ( = ?auto_158783 ?auto_158785 ) ) ( not ( = ?auto_158783 ?auto_158786 ) ) ( not ( = ?auto_158784 ?auto_158785 ) ) ( not ( = ?auto_158784 ?auto_158786 ) ) ( not ( = ?auto_158785 ?auto_158786 ) ) ( ON ?auto_158786 ?auto_158789 ) ( not ( = ?auto_158781 ?auto_158789 ) ) ( not ( = ?auto_158782 ?auto_158789 ) ) ( not ( = ?auto_158783 ?auto_158789 ) ) ( not ( = ?auto_158784 ?auto_158789 ) ) ( not ( = ?auto_158785 ?auto_158789 ) ) ( not ( = ?auto_158786 ?auto_158789 ) ) ( ON ?auto_158785 ?auto_158786 ) ( ON-TABLE ?auto_158787 ) ( ON ?auto_158788 ?auto_158787 ) ( ON ?auto_158789 ?auto_158788 ) ( not ( = ?auto_158787 ?auto_158788 ) ) ( not ( = ?auto_158787 ?auto_158789 ) ) ( not ( = ?auto_158787 ?auto_158786 ) ) ( not ( = ?auto_158787 ?auto_158785 ) ) ( not ( = ?auto_158788 ?auto_158789 ) ) ( not ( = ?auto_158788 ?auto_158786 ) ) ( not ( = ?auto_158788 ?auto_158785 ) ) ( not ( = ?auto_158781 ?auto_158787 ) ) ( not ( = ?auto_158781 ?auto_158788 ) ) ( not ( = ?auto_158782 ?auto_158787 ) ) ( not ( = ?auto_158782 ?auto_158788 ) ) ( not ( = ?auto_158783 ?auto_158787 ) ) ( not ( = ?auto_158783 ?auto_158788 ) ) ( not ( = ?auto_158784 ?auto_158787 ) ) ( not ( = ?auto_158784 ?auto_158788 ) ) ( ON ?auto_158784 ?auto_158785 ) ( ON ?auto_158783 ?auto_158784 ) ( ON ?auto_158782 ?auto_158783 ) ( ON ?auto_158781 ?auto_158782 ) ( CLEAR ?auto_158781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_158787 ?auto_158788 ?auto_158789 ?auto_158786 ?auto_158785 ?auto_158784 ?auto_158783 ?auto_158782 )
      ( MAKE-6PILE ?auto_158781 ?auto_158782 ?auto_158783 ?auto_158784 ?auto_158785 ?auto_158786 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158792 - BLOCK
      ?auto_158793 - BLOCK
    )
    :vars
    (
      ?auto_158794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158794 ?auto_158793 ) ( CLEAR ?auto_158794 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158792 ) ( ON ?auto_158793 ?auto_158792 ) ( not ( = ?auto_158792 ?auto_158793 ) ) ( not ( = ?auto_158792 ?auto_158794 ) ) ( not ( = ?auto_158793 ?auto_158794 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158794 ?auto_158793 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158795 - BLOCK
      ?auto_158796 - BLOCK
    )
    :vars
    (
      ?auto_158797 - BLOCK
      ?auto_158798 - BLOCK
      ?auto_158799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158797 ?auto_158796 ) ( CLEAR ?auto_158797 ) ( ON-TABLE ?auto_158795 ) ( ON ?auto_158796 ?auto_158795 ) ( not ( = ?auto_158795 ?auto_158796 ) ) ( not ( = ?auto_158795 ?auto_158797 ) ) ( not ( = ?auto_158796 ?auto_158797 ) ) ( HOLDING ?auto_158798 ) ( CLEAR ?auto_158799 ) ( not ( = ?auto_158795 ?auto_158798 ) ) ( not ( = ?auto_158795 ?auto_158799 ) ) ( not ( = ?auto_158796 ?auto_158798 ) ) ( not ( = ?auto_158796 ?auto_158799 ) ) ( not ( = ?auto_158797 ?auto_158798 ) ) ( not ( = ?auto_158797 ?auto_158799 ) ) ( not ( = ?auto_158798 ?auto_158799 ) ) )
    :subtasks
    ( ( !STACK ?auto_158798 ?auto_158799 )
      ( MAKE-2PILE ?auto_158795 ?auto_158796 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158800 - BLOCK
      ?auto_158801 - BLOCK
    )
    :vars
    (
      ?auto_158803 - BLOCK
      ?auto_158804 - BLOCK
      ?auto_158802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158803 ?auto_158801 ) ( ON-TABLE ?auto_158800 ) ( ON ?auto_158801 ?auto_158800 ) ( not ( = ?auto_158800 ?auto_158801 ) ) ( not ( = ?auto_158800 ?auto_158803 ) ) ( not ( = ?auto_158801 ?auto_158803 ) ) ( CLEAR ?auto_158804 ) ( not ( = ?auto_158800 ?auto_158802 ) ) ( not ( = ?auto_158800 ?auto_158804 ) ) ( not ( = ?auto_158801 ?auto_158802 ) ) ( not ( = ?auto_158801 ?auto_158804 ) ) ( not ( = ?auto_158803 ?auto_158802 ) ) ( not ( = ?auto_158803 ?auto_158804 ) ) ( not ( = ?auto_158802 ?auto_158804 ) ) ( ON ?auto_158802 ?auto_158803 ) ( CLEAR ?auto_158802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_158800 ?auto_158801 ?auto_158803 )
      ( MAKE-2PILE ?auto_158800 ?auto_158801 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158805 - BLOCK
      ?auto_158806 - BLOCK
    )
    :vars
    (
      ?auto_158807 - BLOCK
      ?auto_158808 - BLOCK
      ?auto_158809 - BLOCK
      ?auto_158813 - BLOCK
      ?auto_158812 - BLOCK
      ?auto_158810 - BLOCK
      ?auto_158811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158807 ?auto_158806 ) ( ON-TABLE ?auto_158805 ) ( ON ?auto_158806 ?auto_158805 ) ( not ( = ?auto_158805 ?auto_158806 ) ) ( not ( = ?auto_158805 ?auto_158807 ) ) ( not ( = ?auto_158806 ?auto_158807 ) ) ( not ( = ?auto_158805 ?auto_158808 ) ) ( not ( = ?auto_158805 ?auto_158809 ) ) ( not ( = ?auto_158806 ?auto_158808 ) ) ( not ( = ?auto_158806 ?auto_158809 ) ) ( not ( = ?auto_158807 ?auto_158808 ) ) ( not ( = ?auto_158807 ?auto_158809 ) ) ( not ( = ?auto_158808 ?auto_158809 ) ) ( ON ?auto_158808 ?auto_158807 ) ( CLEAR ?auto_158808 ) ( HOLDING ?auto_158809 ) ( CLEAR ?auto_158813 ) ( ON-TABLE ?auto_158812 ) ( ON ?auto_158810 ?auto_158812 ) ( ON ?auto_158811 ?auto_158810 ) ( ON ?auto_158813 ?auto_158811 ) ( not ( = ?auto_158812 ?auto_158810 ) ) ( not ( = ?auto_158812 ?auto_158811 ) ) ( not ( = ?auto_158812 ?auto_158813 ) ) ( not ( = ?auto_158812 ?auto_158809 ) ) ( not ( = ?auto_158810 ?auto_158811 ) ) ( not ( = ?auto_158810 ?auto_158813 ) ) ( not ( = ?auto_158810 ?auto_158809 ) ) ( not ( = ?auto_158811 ?auto_158813 ) ) ( not ( = ?auto_158811 ?auto_158809 ) ) ( not ( = ?auto_158813 ?auto_158809 ) ) ( not ( = ?auto_158805 ?auto_158813 ) ) ( not ( = ?auto_158805 ?auto_158812 ) ) ( not ( = ?auto_158805 ?auto_158810 ) ) ( not ( = ?auto_158805 ?auto_158811 ) ) ( not ( = ?auto_158806 ?auto_158813 ) ) ( not ( = ?auto_158806 ?auto_158812 ) ) ( not ( = ?auto_158806 ?auto_158810 ) ) ( not ( = ?auto_158806 ?auto_158811 ) ) ( not ( = ?auto_158807 ?auto_158813 ) ) ( not ( = ?auto_158807 ?auto_158812 ) ) ( not ( = ?auto_158807 ?auto_158810 ) ) ( not ( = ?auto_158807 ?auto_158811 ) ) ( not ( = ?auto_158808 ?auto_158813 ) ) ( not ( = ?auto_158808 ?auto_158812 ) ) ( not ( = ?auto_158808 ?auto_158810 ) ) ( not ( = ?auto_158808 ?auto_158811 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_158812 ?auto_158810 ?auto_158811 ?auto_158813 ?auto_158809 )
      ( MAKE-2PILE ?auto_158805 ?auto_158806 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158814 - BLOCK
      ?auto_158815 - BLOCK
    )
    :vars
    (
      ?auto_158818 - BLOCK
      ?auto_158822 - BLOCK
      ?auto_158820 - BLOCK
      ?auto_158821 - BLOCK
      ?auto_158816 - BLOCK
      ?auto_158817 - BLOCK
      ?auto_158819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158818 ?auto_158815 ) ( ON-TABLE ?auto_158814 ) ( ON ?auto_158815 ?auto_158814 ) ( not ( = ?auto_158814 ?auto_158815 ) ) ( not ( = ?auto_158814 ?auto_158818 ) ) ( not ( = ?auto_158815 ?auto_158818 ) ) ( not ( = ?auto_158814 ?auto_158822 ) ) ( not ( = ?auto_158814 ?auto_158820 ) ) ( not ( = ?auto_158815 ?auto_158822 ) ) ( not ( = ?auto_158815 ?auto_158820 ) ) ( not ( = ?auto_158818 ?auto_158822 ) ) ( not ( = ?auto_158818 ?auto_158820 ) ) ( not ( = ?auto_158822 ?auto_158820 ) ) ( ON ?auto_158822 ?auto_158818 ) ( CLEAR ?auto_158821 ) ( ON-TABLE ?auto_158816 ) ( ON ?auto_158817 ?auto_158816 ) ( ON ?auto_158819 ?auto_158817 ) ( ON ?auto_158821 ?auto_158819 ) ( not ( = ?auto_158816 ?auto_158817 ) ) ( not ( = ?auto_158816 ?auto_158819 ) ) ( not ( = ?auto_158816 ?auto_158821 ) ) ( not ( = ?auto_158816 ?auto_158820 ) ) ( not ( = ?auto_158817 ?auto_158819 ) ) ( not ( = ?auto_158817 ?auto_158821 ) ) ( not ( = ?auto_158817 ?auto_158820 ) ) ( not ( = ?auto_158819 ?auto_158821 ) ) ( not ( = ?auto_158819 ?auto_158820 ) ) ( not ( = ?auto_158821 ?auto_158820 ) ) ( not ( = ?auto_158814 ?auto_158821 ) ) ( not ( = ?auto_158814 ?auto_158816 ) ) ( not ( = ?auto_158814 ?auto_158817 ) ) ( not ( = ?auto_158814 ?auto_158819 ) ) ( not ( = ?auto_158815 ?auto_158821 ) ) ( not ( = ?auto_158815 ?auto_158816 ) ) ( not ( = ?auto_158815 ?auto_158817 ) ) ( not ( = ?auto_158815 ?auto_158819 ) ) ( not ( = ?auto_158818 ?auto_158821 ) ) ( not ( = ?auto_158818 ?auto_158816 ) ) ( not ( = ?auto_158818 ?auto_158817 ) ) ( not ( = ?auto_158818 ?auto_158819 ) ) ( not ( = ?auto_158822 ?auto_158821 ) ) ( not ( = ?auto_158822 ?auto_158816 ) ) ( not ( = ?auto_158822 ?auto_158817 ) ) ( not ( = ?auto_158822 ?auto_158819 ) ) ( ON ?auto_158820 ?auto_158822 ) ( CLEAR ?auto_158820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_158814 ?auto_158815 ?auto_158818 ?auto_158822 )
      ( MAKE-2PILE ?auto_158814 ?auto_158815 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158823 - BLOCK
      ?auto_158824 - BLOCK
    )
    :vars
    (
      ?auto_158826 - BLOCK
      ?auto_158830 - BLOCK
      ?auto_158831 - BLOCK
      ?auto_158828 - BLOCK
      ?auto_158825 - BLOCK
      ?auto_158829 - BLOCK
      ?auto_158827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158826 ?auto_158824 ) ( ON-TABLE ?auto_158823 ) ( ON ?auto_158824 ?auto_158823 ) ( not ( = ?auto_158823 ?auto_158824 ) ) ( not ( = ?auto_158823 ?auto_158826 ) ) ( not ( = ?auto_158824 ?auto_158826 ) ) ( not ( = ?auto_158823 ?auto_158830 ) ) ( not ( = ?auto_158823 ?auto_158831 ) ) ( not ( = ?auto_158824 ?auto_158830 ) ) ( not ( = ?auto_158824 ?auto_158831 ) ) ( not ( = ?auto_158826 ?auto_158830 ) ) ( not ( = ?auto_158826 ?auto_158831 ) ) ( not ( = ?auto_158830 ?auto_158831 ) ) ( ON ?auto_158830 ?auto_158826 ) ( ON-TABLE ?auto_158828 ) ( ON ?auto_158825 ?auto_158828 ) ( ON ?auto_158829 ?auto_158825 ) ( not ( = ?auto_158828 ?auto_158825 ) ) ( not ( = ?auto_158828 ?auto_158829 ) ) ( not ( = ?auto_158828 ?auto_158827 ) ) ( not ( = ?auto_158828 ?auto_158831 ) ) ( not ( = ?auto_158825 ?auto_158829 ) ) ( not ( = ?auto_158825 ?auto_158827 ) ) ( not ( = ?auto_158825 ?auto_158831 ) ) ( not ( = ?auto_158829 ?auto_158827 ) ) ( not ( = ?auto_158829 ?auto_158831 ) ) ( not ( = ?auto_158827 ?auto_158831 ) ) ( not ( = ?auto_158823 ?auto_158827 ) ) ( not ( = ?auto_158823 ?auto_158828 ) ) ( not ( = ?auto_158823 ?auto_158825 ) ) ( not ( = ?auto_158823 ?auto_158829 ) ) ( not ( = ?auto_158824 ?auto_158827 ) ) ( not ( = ?auto_158824 ?auto_158828 ) ) ( not ( = ?auto_158824 ?auto_158825 ) ) ( not ( = ?auto_158824 ?auto_158829 ) ) ( not ( = ?auto_158826 ?auto_158827 ) ) ( not ( = ?auto_158826 ?auto_158828 ) ) ( not ( = ?auto_158826 ?auto_158825 ) ) ( not ( = ?auto_158826 ?auto_158829 ) ) ( not ( = ?auto_158830 ?auto_158827 ) ) ( not ( = ?auto_158830 ?auto_158828 ) ) ( not ( = ?auto_158830 ?auto_158825 ) ) ( not ( = ?auto_158830 ?auto_158829 ) ) ( ON ?auto_158831 ?auto_158830 ) ( CLEAR ?auto_158831 ) ( HOLDING ?auto_158827 ) ( CLEAR ?auto_158829 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_158828 ?auto_158825 ?auto_158829 ?auto_158827 )
      ( MAKE-2PILE ?auto_158823 ?auto_158824 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158832 - BLOCK
      ?auto_158833 - BLOCK
    )
    :vars
    (
      ?auto_158834 - BLOCK
      ?auto_158835 - BLOCK
      ?auto_158840 - BLOCK
      ?auto_158839 - BLOCK
      ?auto_158836 - BLOCK
      ?auto_158838 - BLOCK
      ?auto_158837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158834 ?auto_158833 ) ( ON-TABLE ?auto_158832 ) ( ON ?auto_158833 ?auto_158832 ) ( not ( = ?auto_158832 ?auto_158833 ) ) ( not ( = ?auto_158832 ?auto_158834 ) ) ( not ( = ?auto_158833 ?auto_158834 ) ) ( not ( = ?auto_158832 ?auto_158835 ) ) ( not ( = ?auto_158832 ?auto_158840 ) ) ( not ( = ?auto_158833 ?auto_158835 ) ) ( not ( = ?auto_158833 ?auto_158840 ) ) ( not ( = ?auto_158834 ?auto_158835 ) ) ( not ( = ?auto_158834 ?auto_158840 ) ) ( not ( = ?auto_158835 ?auto_158840 ) ) ( ON ?auto_158835 ?auto_158834 ) ( ON-TABLE ?auto_158839 ) ( ON ?auto_158836 ?auto_158839 ) ( ON ?auto_158838 ?auto_158836 ) ( not ( = ?auto_158839 ?auto_158836 ) ) ( not ( = ?auto_158839 ?auto_158838 ) ) ( not ( = ?auto_158839 ?auto_158837 ) ) ( not ( = ?auto_158839 ?auto_158840 ) ) ( not ( = ?auto_158836 ?auto_158838 ) ) ( not ( = ?auto_158836 ?auto_158837 ) ) ( not ( = ?auto_158836 ?auto_158840 ) ) ( not ( = ?auto_158838 ?auto_158837 ) ) ( not ( = ?auto_158838 ?auto_158840 ) ) ( not ( = ?auto_158837 ?auto_158840 ) ) ( not ( = ?auto_158832 ?auto_158837 ) ) ( not ( = ?auto_158832 ?auto_158839 ) ) ( not ( = ?auto_158832 ?auto_158836 ) ) ( not ( = ?auto_158832 ?auto_158838 ) ) ( not ( = ?auto_158833 ?auto_158837 ) ) ( not ( = ?auto_158833 ?auto_158839 ) ) ( not ( = ?auto_158833 ?auto_158836 ) ) ( not ( = ?auto_158833 ?auto_158838 ) ) ( not ( = ?auto_158834 ?auto_158837 ) ) ( not ( = ?auto_158834 ?auto_158839 ) ) ( not ( = ?auto_158834 ?auto_158836 ) ) ( not ( = ?auto_158834 ?auto_158838 ) ) ( not ( = ?auto_158835 ?auto_158837 ) ) ( not ( = ?auto_158835 ?auto_158839 ) ) ( not ( = ?auto_158835 ?auto_158836 ) ) ( not ( = ?auto_158835 ?auto_158838 ) ) ( ON ?auto_158840 ?auto_158835 ) ( CLEAR ?auto_158838 ) ( ON ?auto_158837 ?auto_158840 ) ( CLEAR ?auto_158837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_158832 ?auto_158833 ?auto_158834 ?auto_158835 ?auto_158840 )
      ( MAKE-2PILE ?auto_158832 ?auto_158833 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158841 - BLOCK
      ?auto_158842 - BLOCK
    )
    :vars
    (
      ?auto_158847 - BLOCK
      ?auto_158845 - BLOCK
      ?auto_158846 - BLOCK
      ?auto_158848 - BLOCK
      ?auto_158849 - BLOCK
      ?auto_158843 - BLOCK
      ?auto_158844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158847 ?auto_158842 ) ( ON-TABLE ?auto_158841 ) ( ON ?auto_158842 ?auto_158841 ) ( not ( = ?auto_158841 ?auto_158842 ) ) ( not ( = ?auto_158841 ?auto_158847 ) ) ( not ( = ?auto_158842 ?auto_158847 ) ) ( not ( = ?auto_158841 ?auto_158845 ) ) ( not ( = ?auto_158841 ?auto_158846 ) ) ( not ( = ?auto_158842 ?auto_158845 ) ) ( not ( = ?auto_158842 ?auto_158846 ) ) ( not ( = ?auto_158847 ?auto_158845 ) ) ( not ( = ?auto_158847 ?auto_158846 ) ) ( not ( = ?auto_158845 ?auto_158846 ) ) ( ON ?auto_158845 ?auto_158847 ) ( ON-TABLE ?auto_158848 ) ( ON ?auto_158849 ?auto_158848 ) ( not ( = ?auto_158848 ?auto_158849 ) ) ( not ( = ?auto_158848 ?auto_158843 ) ) ( not ( = ?auto_158848 ?auto_158844 ) ) ( not ( = ?auto_158848 ?auto_158846 ) ) ( not ( = ?auto_158849 ?auto_158843 ) ) ( not ( = ?auto_158849 ?auto_158844 ) ) ( not ( = ?auto_158849 ?auto_158846 ) ) ( not ( = ?auto_158843 ?auto_158844 ) ) ( not ( = ?auto_158843 ?auto_158846 ) ) ( not ( = ?auto_158844 ?auto_158846 ) ) ( not ( = ?auto_158841 ?auto_158844 ) ) ( not ( = ?auto_158841 ?auto_158848 ) ) ( not ( = ?auto_158841 ?auto_158849 ) ) ( not ( = ?auto_158841 ?auto_158843 ) ) ( not ( = ?auto_158842 ?auto_158844 ) ) ( not ( = ?auto_158842 ?auto_158848 ) ) ( not ( = ?auto_158842 ?auto_158849 ) ) ( not ( = ?auto_158842 ?auto_158843 ) ) ( not ( = ?auto_158847 ?auto_158844 ) ) ( not ( = ?auto_158847 ?auto_158848 ) ) ( not ( = ?auto_158847 ?auto_158849 ) ) ( not ( = ?auto_158847 ?auto_158843 ) ) ( not ( = ?auto_158845 ?auto_158844 ) ) ( not ( = ?auto_158845 ?auto_158848 ) ) ( not ( = ?auto_158845 ?auto_158849 ) ) ( not ( = ?auto_158845 ?auto_158843 ) ) ( ON ?auto_158846 ?auto_158845 ) ( ON ?auto_158844 ?auto_158846 ) ( CLEAR ?auto_158844 ) ( HOLDING ?auto_158843 ) ( CLEAR ?auto_158849 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_158848 ?auto_158849 ?auto_158843 )
      ( MAKE-2PILE ?auto_158841 ?auto_158842 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158850 - BLOCK
      ?auto_158851 - BLOCK
    )
    :vars
    (
      ?auto_158852 - BLOCK
      ?auto_158855 - BLOCK
      ?auto_158854 - BLOCK
      ?auto_158858 - BLOCK
      ?auto_158856 - BLOCK
      ?auto_158857 - BLOCK
      ?auto_158853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158852 ?auto_158851 ) ( ON-TABLE ?auto_158850 ) ( ON ?auto_158851 ?auto_158850 ) ( not ( = ?auto_158850 ?auto_158851 ) ) ( not ( = ?auto_158850 ?auto_158852 ) ) ( not ( = ?auto_158851 ?auto_158852 ) ) ( not ( = ?auto_158850 ?auto_158855 ) ) ( not ( = ?auto_158850 ?auto_158854 ) ) ( not ( = ?auto_158851 ?auto_158855 ) ) ( not ( = ?auto_158851 ?auto_158854 ) ) ( not ( = ?auto_158852 ?auto_158855 ) ) ( not ( = ?auto_158852 ?auto_158854 ) ) ( not ( = ?auto_158855 ?auto_158854 ) ) ( ON ?auto_158855 ?auto_158852 ) ( ON-TABLE ?auto_158858 ) ( ON ?auto_158856 ?auto_158858 ) ( not ( = ?auto_158858 ?auto_158856 ) ) ( not ( = ?auto_158858 ?auto_158857 ) ) ( not ( = ?auto_158858 ?auto_158853 ) ) ( not ( = ?auto_158858 ?auto_158854 ) ) ( not ( = ?auto_158856 ?auto_158857 ) ) ( not ( = ?auto_158856 ?auto_158853 ) ) ( not ( = ?auto_158856 ?auto_158854 ) ) ( not ( = ?auto_158857 ?auto_158853 ) ) ( not ( = ?auto_158857 ?auto_158854 ) ) ( not ( = ?auto_158853 ?auto_158854 ) ) ( not ( = ?auto_158850 ?auto_158853 ) ) ( not ( = ?auto_158850 ?auto_158858 ) ) ( not ( = ?auto_158850 ?auto_158856 ) ) ( not ( = ?auto_158850 ?auto_158857 ) ) ( not ( = ?auto_158851 ?auto_158853 ) ) ( not ( = ?auto_158851 ?auto_158858 ) ) ( not ( = ?auto_158851 ?auto_158856 ) ) ( not ( = ?auto_158851 ?auto_158857 ) ) ( not ( = ?auto_158852 ?auto_158853 ) ) ( not ( = ?auto_158852 ?auto_158858 ) ) ( not ( = ?auto_158852 ?auto_158856 ) ) ( not ( = ?auto_158852 ?auto_158857 ) ) ( not ( = ?auto_158855 ?auto_158853 ) ) ( not ( = ?auto_158855 ?auto_158858 ) ) ( not ( = ?auto_158855 ?auto_158856 ) ) ( not ( = ?auto_158855 ?auto_158857 ) ) ( ON ?auto_158854 ?auto_158855 ) ( ON ?auto_158853 ?auto_158854 ) ( CLEAR ?auto_158856 ) ( ON ?auto_158857 ?auto_158853 ) ( CLEAR ?auto_158857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_158850 ?auto_158851 ?auto_158852 ?auto_158855 ?auto_158854 ?auto_158853 )
      ( MAKE-2PILE ?auto_158850 ?auto_158851 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158859 - BLOCK
      ?auto_158860 - BLOCK
    )
    :vars
    (
      ?auto_158864 - BLOCK
      ?auto_158861 - BLOCK
      ?auto_158865 - BLOCK
      ?auto_158867 - BLOCK
      ?auto_158862 - BLOCK
      ?auto_158866 - BLOCK
      ?auto_158863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158864 ?auto_158860 ) ( ON-TABLE ?auto_158859 ) ( ON ?auto_158860 ?auto_158859 ) ( not ( = ?auto_158859 ?auto_158860 ) ) ( not ( = ?auto_158859 ?auto_158864 ) ) ( not ( = ?auto_158860 ?auto_158864 ) ) ( not ( = ?auto_158859 ?auto_158861 ) ) ( not ( = ?auto_158859 ?auto_158865 ) ) ( not ( = ?auto_158860 ?auto_158861 ) ) ( not ( = ?auto_158860 ?auto_158865 ) ) ( not ( = ?auto_158864 ?auto_158861 ) ) ( not ( = ?auto_158864 ?auto_158865 ) ) ( not ( = ?auto_158861 ?auto_158865 ) ) ( ON ?auto_158861 ?auto_158864 ) ( ON-TABLE ?auto_158867 ) ( not ( = ?auto_158867 ?auto_158862 ) ) ( not ( = ?auto_158867 ?auto_158866 ) ) ( not ( = ?auto_158867 ?auto_158863 ) ) ( not ( = ?auto_158867 ?auto_158865 ) ) ( not ( = ?auto_158862 ?auto_158866 ) ) ( not ( = ?auto_158862 ?auto_158863 ) ) ( not ( = ?auto_158862 ?auto_158865 ) ) ( not ( = ?auto_158866 ?auto_158863 ) ) ( not ( = ?auto_158866 ?auto_158865 ) ) ( not ( = ?auto_158863 ?auto_158865 ) ) ( not ( = ?auto_158859 ?auto_158863 ) ) ( not ( = ?auto_158859 ?auto_158867 ) ) ( not ( = ?auto_158859 ?auto_158862 ) ) ( not ( = ?auto_158859 ?auto_158866 ) ) ( not ( = ?auto_158860 ?auto_158863 ) ) ( not ( = ?auto_158860 ?auto_158867 ) ) ( not ( = ?auto_158860 ?auto_158862 ) ) ( not ( = ?auto_158860 ?auto_158866 ) ) ( not ( = ?auto_158864 ?auto_158863 ) ) ( not ( = ?auto_158864 ?auto_158867 ) ) ( not ( = ?auto_158864 ?auto_158862 ) ) ( not ( = ?auto_158864 ?auto_158866 ) ) ( not ( = ?auto_158861 ?auto_158863 ) ) ( not ( = ?auto_158861 ?auto_158867 ) ) ( not ( = ?auto_158861 ?auto_158862 ) ) ( not ( = ?auto_158861 ?auto_158866 ) ) ( ON ?auto_158865 ?auto_158861 ) ( ON ?auto_158863 ?auto_158865 ) ( ON ?auto_158866 ?auto_158863 ) ( CLEAR ?auto_158866 ) ( HOLDING ?auto_158862 ) ( CLEAR ?auto_158867 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_158867 ?auto_158862 )
      ( MAKE-2PILE ?auto_158859 ?auto_158860 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_160886 - BLOCK
      ?auto_160887 - BLOCK
    )
    :vars
    (
      ?auto_160892 - BLOCK
      ?auto_160889 - BLOCK
      ?auto_160893 - BLOCK
      ?auto_160891 - BLOCK
      ?auto_160888 - BLOCK
      ?auto_160890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160892 ?auto_160887 ) ( ON-TABLE ?auto_160886 ) ( ON ?auto_160887 ?auto_160886 ) ( not ( = ?auto_160886 ?auto_160887 ) ) ( not ( = ?auto_160886 ?auto_160892 ) ) ( not ( = ?auto_160887 ?auto_160892 ) ) ( not ( = ?auto_160886 ?auto_160889 ) ) ( not ( = ?auto_160886 ?auto_160893 ) ) ( not ( = ?auto_160887 ?auto_160889 ) ) ( not ( = ?auto_160887 ?auto_160893 ) ) ( not ( = ?auto_160892 ?auto_160889 ) ) ( not ( = ?auto_160892 ?auto_160893 ) ) ( not ( = ?auto_160889 ?auto_160893 ) ) ( ON ?auto_160889 ?auto_160892 ) ( not ( = ?auto_160891 ?auto_160888 ) ) ( not ( = ?auto_160891 ?auto_160890 ) ) ( not ( = ?auto_160891 ?auto_160893 ) ) ( not ( = ?auto_160888 ?auto_160890 ) ) ( not ( = ?auto_160888 ?auto_160893 ) ) ( not ( = ?auto_160890 ?auto_160893 ) ) ( not ( = ?auto_160886 ?auto_160890 ) ) ( not ( = ?auto_160886 ?auto_160891 ) ) ( not ( = ?auto_160886 ?auto_160888 ) ) ( not ( = ?auto_160887 ?auto_160890 ) ) ( not ( = ?auto_160887 ?auto_160891 ) ) ( not ( = ?auto_160887 ?auto_160888 ) ) ( not ( = ?auto_160892 ?auto_160890 ) ) ( not ( = ?auto_160892 ?auto_160891 ) ) ( not ( = ?auto_160892 ?auto_160888 ) ) ( not ( = ?auto_160889 ?auto_160890 ) ) ( not ( = ?auto_160889 ?auto_160891 ) ) ( not ( = ?auto_160889 ?auto_160888 ) ) ( ON ?auto_160893 ?auto_160889 ) ( ON ?auto_160890 ?auto_160893 ) ( ON ?auto_160888 ?auto_160890 ) ( ON ?auto_160891 ?auto_160888 ) ( CLEAR ?auto_160891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160886 ?auto_160887 ?auto_160892 ?auto_160889 ?auto_160893 ?auto_160890 ?auto_160888 )
      ( MAKE-2PILE ?auto_160886 ?auto_160887 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158877 - BLOCK
      ?auto_158878 - BLOCK
    )
    :vars
    (
      ?auto_158885 - BLOCK
      ?auto_158881 - BLOCK
      ?auto_158884 - BLOCK
      ?auto_158883 - BLOCK
      ?auto_158882 - BLOCK
      ?auto_158879 - BLOCK
      ?auto_158880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158885 ?auto_158878 ) ( ON-TABLE ?auto_158877 ) ( ON ?auto_158878 ?auto_158877 ) ( not ( = ?auto_158877 ?auto_158878 ) ) ( not ( = ?auto_158877 ?auto_158885 ) ) ( not ( = ?auto_158878 ?auto_158885 ) ) ( not ( = ?auto_158877 ?auto_158881 ) ) ( not ( = ?auto_158877 ?auto_158884 ) ) ( not ( = ?auto_158878 ?auto_158881 ) ) ( not ( = ?auto_158878 ?auto_158884 ) ) ( not ( = ?auto_158885 ?auto_158881 ) ) ( not ( = ?auto_158885 ?auto_158884 ) ) ( not ( = ?auto_158881 ?auto_158884 ) ) ( ON ?auto_158881 ?auto_158885 ) ( not ( = ?auto_158883 ?auto_158882 ) ) ( not ( = ?auto_158883 ?auto_158879 ) ) ( not ( = ?auto_158883 ?auto_158880 ) ) ( not ( = ?auto_158883 ?auto_158884 ) ) ( not ( = ?auto_158882 ?auto_158879 ) ) ( not ( = ?auto_158882 ?auto_158880 ) ) ( not ( = ?auto_158882 ?auto_158884 ) ) ( not ( = ?auto_158879 ?auto_158880 ) ) ( not ( = ?auto_158879 ?auto_158884 ) ) ( not ( = ?auto_158880 ?auto_158884 ) ) ( not ( = ?auto_158877 ?auto_158880 ) ) ( not ( = ?auto_158877 ?auto_158883 ) ) ( not ( = ?auto_158877 ?auto_158882 ) ) ( not ( = ?auto_158877 ?auto_158879 ) ) ( not ( = ?auto_158878 ?auto_158880 ) ) ( not ( = ?auto_158878 ?auto_158883 ) ) ( not ( = ?auto_158878 ?auto_158882 ) ) ( not ( = ?auto_158878 ?auto_158879 ) ) ( not ( = ?auto_158885 ?auto_158880 ) ) ( not ( = ?auto_158885 ?auto_158883 ) ) ( not ( = ?auto_158885 ?auto_158882 ) ) ( not ( = ?auto_158885 ?auto_158879 ) ) ( not ( = ?auto_158881 ?auto_158880 ) ) ( not ( = ?auto_158881 ?auto_158883 ) ) ( not ( = ?auto_158881 ?auto_158882 ) ) ( not ( = ?auto_158881 ?auto_158879 ) ) ( ON ?auto_158884 ?auto_158881 ) ( ON ?auto_158880 ?auto_158884 ) ( ON ?auto_158879 ?auto_158880 ) ( ON ?auto_158882 ?auto_158879 ) ( CLEAR ?auto_158882 ) ( HOLDING ?auto_158883 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158883 )
      ( MAKE-2PILE ?auto_158877 ?auto_158878 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158886 - BLOCK
      ?auto_158887 - BLOCK
    )
    :vars
    (
      ?auto_158890 - BLOCK
      ?auto_158889 - BLOCK
      ?auto_158894 - BLOCK
      ?auto_158892 - BLOCK
      ?auto_158888 - BLOCK
      ?auto_158891 - BLOCK
      ?auto_158893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158890 ?auto_158887 ) ( ON-TABLE ?auto_158886 ) ( ON ?auto_158887 ?auto_158886 ) ( not ( = ?auto_158886 ?auto_158887 ) ) ( not ( = ?auto_158886 ?auto_158890 ) ) ( not ( = ?auto_158887 ?auto_158890 ) ) ( not ( = ?auto_158886 ?auto_158889 ) ) ( not ( = ?auto_158886 ?auto_158894 ) ) ( not ( = ?auto_158887 ?auto_158889 ) ) ( not ( = ?auto_158887 ?auto_158894 ) ) ( not ( = ?auto_158890 ?auto_158889 ) ) ( not ( = ?auto_158890 ?auto_158894 ) ) ( not ( = ?auto_158889 ?auto_158894 ) ) ( ON ?auto_158889 ?auto_158890 ) ( not ( = ?auto_158892 ?auto_158888 ) ) ( not ( = ?auto_158892 ?auto_158891 ) ) ( not ( = ?auto_158892 ?auto_158893 ) ) ( not ( = ?auto_158892 ?auto_158894 ) ) ( not ( = ?auto_158888 ?auto_158891 ) ) ( not ( = ?auto_158888 ?auto_158893 ) ) ( not ( = ?auto_158888 ?auto_158894 ) ) ( not ( = ?auto_158891 ?auto_158893 ) ) ( not ( = ?auto_158891 ?auto_158894 ) ) ( not ( = ?auto_158893 ?auto_158894 ) ) ( not ( = ?auto_158886 ?auto_158893 ) ) ( not ( = ?auto_158886 ?auto_158892 ) ) ( not ( = ?auto_158886 ?auto_158888 ) ) ( not ( = ?auto_158886 ?auto_158891 ) ) ( not ( = ?auto_158887 ?auto_158893 ) ) ( not ( = ?auto_158887 ?auto_158892 ) ) ( not ( = ?auto_158887 ?auto_158888 ) ) ( not ( = ?auto_158887 ?auto_158891 ) ) ( not ( = ?auto_158890 ?auto_158893 ) ) ( not ( = ?auto_158890 ?auto_158892 ) ) ( not ( = ?auto_158890 ?auto_158888 ) ) ( not ( = ?auto_158890 ?auto_158891 ) ) ( not ( = ?auto_158889 ?auto_158893 ) ) ( not ( = ?auto_158889 ?auto_158892 ) ) ( not ( = ?auto_158889 ?auto_158888 ) ) ( not ( = ?auto_158889 ?auto_158891 ) ) ( ON ?auto_158894 ?auto_158889 ) ( ON ?auto_158893 ?auto_158894 ) ( ON ?auto_158891 ?auto_158893 ) ( ON ?auto_158888 ?auto_158891 ) ( ON ?auto_158892 ?auto_158888 ) ( CLEAR ?auto_158892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_158886 ?auto_158887 ?auto_158890 ?auto_158889 ?auto_158894 ?auto_158893 ?auto_158891 ?auto_158888 )
      ( MAKE-2PILE ?auto_158886 ?auto_158887 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158902 - BLOCK
      ?auto_158903 - BLOCK
      ?auto_158904 - BLOCK
      ?auto_158905 - BLOCK
      ?auto_158906 - BLOCK
      ?auto_158907 - BLOCK
      ?auto_158908 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_158908 ) ( CLEAR ?auto_158907 ) ( ON-TABLE ?auto_158902 ) ( ON ?auto_158903 ?auto_158902 ) ( ON ?auto_158904 ?auto_158903 ) ( ON ?auto_158905 ?auto_158904 ) ( ON ?auto_158906 ?auto_158905 ) ( ON ?auto_158907 ?auto_158906 ) ( not ( = ?auto_158902 ?auto_158903 ) ) ( not ( = ?auto_158902 ?auto_158904 ) ) ( not ( = ?auto_158902 ?auto_158905 ) ) ( not ( = ?auto_158902 ?auto_158906 ) ) ( not ( = ?auto_158902 ?auto_158907 ) ) ( not ( = ?auto_158902 ?auto_158908 ) ) ( not ( = ?auto_158903 ?auto_158904 ) ) ( not ( = ?auto_158903 ?auto_158905 ) ) ( not ( = ?auto_158903 ?auto_158906 ) ) ( not ( = ?auto_158903 ?auto_158907 ) ) ( not ( = ?auto_158903 ?auto_158908 ) ) ( not ( = ?auto_158904 ?auto_158905 ) ) ( not ( = ?auto_158904 ?auto_158906 ) ) ( not ( = ?auto_158904 ?auto_158907 ) ) ( not ( = ?auto_158904 ?auto_158908 ) ) ( not ( = ?auto_158905 ?auto_158906 ) ) ( not ( = ?auto_158905 ?auto_158907 ) ) ( not ( = ?auto_158905 ?auto_158908 ) ) ( not ( = ?auto_158906 ?auto_158907 ) ) ( not ( = ?auto_158906 ?auto_158908 ) ) ( not ( = ?auto_158907 ?auto_158908 ) ) )
    :subtasks
    ( ( !STACK ?auto_158908 ?auto_158907 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158909 - BLOCK
      ?auto_158910 - BLOCK
      ?auto_158911 - BLOCK
      ?auto_158912 - BLOCK
      ?auto_158913 - BLOCK
      ?auto_158914 - BLOCK
      ?auto_158915 - BLOCK
    )
    :vars
    (
      ?auto_158916 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_158914 ) ( ON-TABLE ?auto_158909 ) ( ON ?auto_158910 ?auto_158909 ) ( ON ?auto_158911 ?auto_158910 ) ( ON ?auto_158912 ?auto_158911 ) ( ON ?auto_158913 ?auto_158912 ) ( ON ?auto_158914 ?auto_158913 ) ( not ( = ?auto_158909 ?auto_158910 ) ) ( not ( = ?auto_158909 ?auto_158911 ) ) ( not ( = ?auto_158909 ?auto_158912 ) ) ( not ( = ?auto_158909 ?auto_158913 ) ) ( not ( = ?auto_158909 ?auto_158914 ) ) ( not ( = ?auto_158909 ?auto_158915 ) ) ( not ( = ?auto_158910 ?auto_158911 ) ) ( not ( = ?auto_158910 ?auto_158912 ) ) ( not ( = ?auto_158910 ?auto_158913 ) ) ( not ( = ?auto_158910 ?auto_158914 ) ) ( not ( = ?auto_158910 ?auto_158915 ) ) ( not ( = ?auto_158911 ?auto_158912 ) ) ( not ( = ?auto_158911 ?auto_158913 ) ) ( not ( = ?auto_158911 ?auto_158914 ) ) ( not ( = ?auto_158911 ?auto_158915 ) ) ( not ( = ?auto_158912 ?auto_158913 ) ) ( not ( = ?auto_158912 ?auto_158914 ) ) ( not ( = ?auto_158912 ?auto_158915 ) ) ( not ( = ?auto_158913 ?auto_158914 ) ) ( not ( = ?auto_158913 ?auto_158915 ) ) ( not ( = ?auto_158914 ?auto_158915 ) ) ( ON ?auto_158915 ?auto_158916 ) ( CLEAR ?auto_158915 ) ( HAND-EMPTY ) ( not ( = ?auto_158909 ?auto_158916 ) ) ( not ( = ?auto_158910 ?auto_158916 ) ) ( not ( = ?auto_158911 ?auto_158916 ) ) ( not ( = ?auto_158912 ?auto_158916 ) ) ( not ( = ?auto_158913 ?auto_158916 ) ) ( not ( = ?auto_158914 ?auto_158916 ) ) ( not ( = ?auto_158915 ?auto_158916 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158915 ?auto_158916 )
      ( MAKE-7PILE ?auto_158909 ?auto_158910 ?auto_158911 ?auto_158912 ?auto_158913 ?auto_158914 ?auto_158915 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158917 - BLOCK
      ?auto_158918 - BLOCK
      ?auto_158919 - BLOCK
      ?auto_158920 - BLOCK
      ?auto_158921 - BLOCK
      ?auto_158922 - BLOCK
      ?auto_158923 - BLOCK
    )
    :vars
    (
      ?auto_158924 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158917 ) ( ON ?auto_158918 ?auto_158917 ) ( ON ?auto_158919 ?auto_158918 ) ( ON ?auto_158920 ?auto_158919 ) ( ON ?auto_158921 ?auto_158920 ) ( not ( = ?auto_158917 ?auto_158918 ) ) ( not ( = ?auto_158917 ?auto_158919 ) ) ( not ( = ?auto_158917 ?auto_158920 ) ) ( not ( = ?auto_158917 ?auto_158921 ) ) ( not ( = ?auto_158917 ?auto_158922 ) ) ( not ( = ?auto_158917 ?auto_158923 ) ) ( not ( = ?auto_158918 ?auto_158919 ) ) ( not ( = ?auto_158918 ?auto_158920 ) ) ( not ( = ?auto_158918 ?auto_158921 ) ) ( not ( = ?auto_158918 ?auto_158922 ) ) ( not ( = ?auto_158918 ?auto_158923 ) ) ( not ( = ?auto_158919 ?auto_158920 ) ) ( not ( = ?auto_158919 ?auto_158921 ) ) ( not ( = ?auto_158919 ?auto_158922 ) ) ( not ( = ?auto_158919 ?auto_158923 ) ) ( not ( = ?auto_158920 ?auto_158921 ) ) ( not ( = ?auto_158920 ?auto_158922 ) ) ( not ( = ?auto_158920 ?auto_158923 ) ) ( not ( = ?auto_158921 ?auto_158922 ) ) ( not ( = ?auto_158921 ?auto_158923 ) ) ( not ( = ?auto_158922 ?auto_158923 ) ) ( ON ?auto_158923 ?auto_158924 ) ( CLEAR ?auto_158923 ) ( not ( = ?auto_158917 ?auto_158924 ) ) ( not ( = ?auto_158918 ?auto_158924 ) ) ( not ( = ?auto_158919 ?auto_158924 ) ) ( not ( = ?auto_158920 ?auto_158924 ) ) ( not ( = ?auto_158921 ?auto_158924 ) ) ( not ( = ?auto_158922 ?auto_158924 ) ) ( not ( = ?auto_158923 ?auto_158924 ) ) ( HOLDING ?auto_158922 ) ( CLEAR ?auto_158921 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_158917 ?auto_158918 ?auto_158919 ?auto_158920 ?auto_158921 ?auto_158922 )
      ( MAKE-7PILE ?auto_158917 ?auto_158918 ?auto_158919 ?auto_158920 ?auto_158921 ?auto_158922 ?auto_158923 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158925 - BLOCK
      ?auto_158926 - BLOCK
      ?auto_158927 - BLOCK
      ?auto_158928 - BLOCK
      ?auto_158929 - BLOCK
      ?auto_158930 - BLOCK
      ?auto_158931 - BLOCK
    )
    :vars
    (
      ?auto_158932 - BLOCK
      ?auto_158933 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158925 ) ( ON ?auto_158926 ?auto_158925 ) ( ON ?auto_158927 ?auto_158926 ) ( ON ?auto_158928 ?auto_158927 ) ( ON ?auto_158929 ?auto_158928 ) ( not ( = ?auto_158925 ?auto_158926 ) ) ( not ( = ?auto_158925 ?auto_158927 ) ) ( not ( = ?auto_158925 ?auto_158928 ) ) ( not ( = ?auto_158925 ?auto_158929 ) ) ( not ( = ?auto_158925 ?auto_158930 ) ) ( not ( = ?auto_158925 ?auto_158931 ) ) ( not ( = ?auto_158926 ?auto_158927 ) ) ( not ( = ?auto_158926 ?auto_158928 ) ) ( not ( = ?auto_158926 ?auto_158929 ) ) ( not ( = ?auto_158926 ?auto_158930 ) ) ( not ( = ?auto_158926 ?auto_158931 ) ) ( not ( = ?auto_158927 ?auto_158928 ) ) ( not ( = ?auto_158927 ?auto_158929 ) ) ( not ( = ?auto_158927 ?auto_158930 ) ) ( not ( = ?auto_158927 ?auto_158931 ) ) ( not ( = ?auto_158928 ?auto_158929 ) ) ( not ( = ?auto_158928 ?auto_158930 ) ) ( not ( = ?auto_158928 ?auto_158931 ) ) ( not ( = ?auto_158929 ?auto_158930 ) ) ( not ( = ?auto_158929 ?auto_158931 ) ) ( not ( = ?auto_158930 ?auto_158931 ) ) ( ON ?auto_158931 ?auto_158932 ) ( not ( = ?auto_158925 ?auto_158932 ) ) ( not ( = ?auto_158926 ?auto_158932 ) ) ( not ( = ?auto_158927 ?auto_158932 ) ) ( not ( = ?auto_158928 ?auto_158932 ) ) ( not ( = ?auto_158929 ?auto_158932 ) ) ( not ( = ?auto_158930 ?auto_158932 ) ) ( not ( = ?auto_158931 ?auto_158932 ) ) ( CLEAR ?auto_158929 ) ( ON ?auto_158930 ?auto_158931 ) ( CLEAR ?auto_158930 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158933 ) ( ON ?auto_158932 ?auto_158933 ) ( not ( = ?auto_158933 ?auto_158932 ) ) ( not ( = ?auto_158933 ?auto_158931 ) ) ( not ( = ?auto_158933 ?auto_158930 ) ) ( not ( = ?auto_158925 ?auto_158933 ) ) ( not ( = ?auto_158926 ?auto_158933 ) ) ( not ( = ?auto_158927 ?auto_158933 ) ) ( not ( = ?auto_158928 ?auto_158933 ) ) ( not ( = ?auto_158929 ?auto_158933 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_158933 ?auto_158932 ?auto_158931 )
      ( MAKE-7PILE ?auto_158925 ?auto_158926 ?auto_158927 ?auto_158928 ?auto_158929 ?auto_158930 ?auto_158931 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158934 - BLOCK
      ?auto_158935 - BLOCK
      ?auto_158936 - BLOCK
      ?auto_158937 - BLOCK
      ?auto_158938 - BLOCK
      ?auto_158939 - BLOCK
      ?auto_158940 - BLOCK
    )
    :vars
    (
      ?auto_158942 - BLOCK
      ?auto_158941 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158934 ) ( ON ?auto_158935 ?auto_158934 ) ( ON ?auto_158936 ?auto_158935 ) ( ON ?auto_158937 ?auto_158936 ) ( not ( = ?auto_158934 ?auto_158935 ) ) ( not ( = ?auto_158934 ?auto_158936 ) ) ( not ( = ?auto_158934 ?auto_158937 ) ) ( not ( = ?auto_158934 ?auto_158938 ) ) ( not ( = ?auto_158934 ?auto_158939 ) ) ( not ( = ?auto_158934 ?auto_158940 ) ) ( not ( = ?auto_158935 ?auto_158936 ) ) ( not ( = ?auto_158935 ?auto_158937 ) ) ( not ( = ?auto_158935 ?auto_158938 ) ) ( not ( = ?auto_158935 ?auto_158939 ) ) ( not ( = ?auto_158935 ?auto_158940 ) ) ( not ( = ?auto_158936 ?auto_158937 ) ) ( not ( = ?auto_158936 ?auto_158938 ) ) ( not ( = ?auto_158936 ?auto_158939 ) ) ( not ( = ?auto_158936 ?auto_158940 ) ) ( not ( = ?auto_158937 ?auto_158938 ) ) ( not ( = ?auto_158937 ?auto_158939 ) ) ( not ( = ?auto_158937 ?auto_158940 ) ) ( not ( = ?auto_158938 ?auto_158939 ) ) ( not ( = ?auto_158938 ?auto_158940 ) ) ( not ( = ?auto_158939 ?auto_158940 ) ) ( ON ?auto_158940 ?auto_158942 ) ( not ( = ?auto_158934 ?auto_158942 ) ) ( not ( = ?auto_158935 ?auto_158942 ) ) ( not ( = ?auto_158936 ?auto_158942 ) ) ( not ( = ?auto_158937 ?auto_158942 ) ) ( not ( = ?auto_158938 ?auto_158942 ) ) ( not ( = ?auto_158939 ?auto_158942 ) ) ( not ( = ?auto_158940 ?auto_158942 ) ) ( ON ?auto_158939 ?auto_158940 ) ( CLEAR ?auto_158939 ) ( ON-TABLE ?auto_158941 ) ( ON ?auto_158942 ?auto_158941 ) ( not ( = ?auto_158941 ?auto_158942 ) ) ( not ( = ?auto_158941 ?auto_158940 ) ) ( not ( = ?auto_158941 ?auto_158939 ) ) ( not ( = ?auto_158934 ?auto_158941 ) ) ( not ( = ?auto_158935 ?auto_158941 ) ) ( not ( = ?auto_158936 ?auto_158941 ) ) ( not ( = ?auto_158937 ?auto_158941 ) ) ( not ( = ?auto_158938 ?auto_158941 ) ) ( HOLDING ?auto_158938 ) ( CLEAR ?auto_158937 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_158934 ?auto_158935 ?auto_158936 ?auto_158937 ?auto_158938 )
      ( MAKE-7PILE ?auto_158934 ?auto_158935 ?auto_158936 ?auto_158937 ?auto_158938 ?auto_158939 ?auto_158940 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158943 - BLOCK
      ?auto_158944 - BLOCK
      ?auto_158945 - BLOCK
      ?auto_158946 - BLOCK
      ?auto_158947 - BLOCK
      ?auto_158948 - BLOCK
      ?auto_158949 - BLOCK
    )
    :vars
    (
      ?auto_158950 - BLOCK
      ?auto_158951 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158943 ) ( ON ?auto_158944 ?auto_158943 ) ( ON ?auto_158945 ?auto_158944 ) ( ON ?auto_158946 ?auto_158945 ) ( not ( = ?auto_158943 ?auto_158944 ) ) ( not ( = ?auto_158943 ?auto_158945 ) ) ( not ( = ?auto_158943 ?auto_158946 ) ) ( not ( = ?auto_158943 ?auto_158947 ) ) ( not ( = ?auto_158943 ?auto_158948 ) ) ( not ( = ?auto_158943 ?auto_158949 ) ) ( not ( = ?auto_158944 ?auto_158945 ) ) ( not ( = ?auto_158944 ?auto_158946 ) ) ( not ( = ?auto_158944 ?auto_158947 ) ) ( not ( = ?auto_158944 ?auto_158948 ) ) ( not ( = ?auto_158944 ?auto_158949 ) ) ( not ( = ?auto_158945 ?auto_158946 ) ) ( not ( = ?auto_158945 ?auto_158947 ) ) ( not ( = ?auto_158945 ?auto_158948 ) ) ( not ( = ?auto_158945 ?auto_158949 ) ) ( not ( = ?auto_158946 ?auto_158947 ) ) ( not ( = ?auto_158946 ?auto_158948 ) ) ( not ( = ?auto_158946 ?auto_158949 ) ) ( not ( = ?auto_158947 ?auto_158948 ) ) ( not ( = ?auto_158947 ?auto_158949 ) ) ( not ( = ?auto_158948 ?auto_158949 ) ) ( ON ?auto_158949 ?auto_158950 ) ( not ( = ?auto_158943 ?auto_158950 ) ) ( not ( = ?auto_158944 ?auto_158950 ) ) ( not ( = ?auto_158945 ?auto_158950 ) ) ( not ( = ?auto_158946 ?auto_158950 ) ) ( not ( = ?auto_158947 ?auto_158950 ) ) ( not ( = ?auto_158948 ?auto_158950 ) ) ( not ( = ?auto_158949 ?auto_158950 ) ) ( ON ?auto_158948 ?auto_158949 ) ( ON-TABLE ?auto_158951 ) ( ON ?auto_158950 ?auto_158951 ) ( not ( = ?auto_158951 ?auto_158950 ) ) ( not ( = ?auto_158951 ?auto_158949 ) ) ( not ( = ?auto_158951 ?auto_158948 ) ) ( not ( = ?auto_158943 ?auto_158951 ) ) ( not ( = ?auto_158944 ?auto_158951 ) ) ( not ( = ?auto_158945 ?auto_158951 ) ) ( not ( = ?auto_158946 ?auto_158951 ) ) ( not ( = ?auto_158947 ?auto_158951 ) ) ( CLEAR ?auto_158946 ) ( ON ?auto_158947 ?auto_158948 ) ( CLEAR ?auto_158947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_158951 ?auto_158950 ?auto_158949 ?auto_158948 )
      ( MAKE-7PILE ?auto_158943 ?auto_158944 ?auto_158945 ?auto_158946 ?auto_158947 ?auto_158948 ?auto_158949 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158952 - BLOCK
      ?auto_158953 - BLOCK
      ?auto_158954 - BLOCK
      ?auto_158955 - BLOCK
      ?auto_158956 - BLOCK
      ?auto_158957 - BLOCK
      ?auto_158958 - BLOCK
    )
    :vars
    (
      ?auto_158960 - BLOCK
      ?auto_158959 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158952 ) ( ON ?auto_158953 ?auto_158952 ) ( ON ?auto_158954 ?auto_158953 ) ( not ( = ?auto_158952 ?auto_158953 ) ) ( not ( = ?auto_158952 ?auto_158954 ) ) ( not ( = ?auto_158952 ?auto_158955 ) ) ( not ( = ?auto_158952 ?auto_158956 ) ) ( not ( = ?auto_158952 ?auto_158957 ) ) ( not ( = ?auto_158952 ?auto_158958 ) ) ( not ( = ?auto_158953 ?auto_158954 ) ) ( not ( = ?auto_158953 ?auto_158955 ) ) ( not ( = ?auto_158953 ?auto_158956 ) ) ( not ( = ?auto_158953 ?auto_158957 ) ) ( not ( = ?auto_158953 ?auto_158958 ) ) ( not ( = ?auto_158954 ?auto_158955 ) ) ( not ( = ?auto_158954 ?auto_158956 ) ) ( not ( = ?auto_158954 ?auto_158957 ) ) ( not ( = ?auto_158954 ?auto_158958 ) ) ( not ( = ?auto_158955 ?auto_158956 ) ) ( not ( = ?auto_158955 ?auto_158957 ) ) ( not ( = ?auto_158955 ?auto_158958 ) ) ( not ( = ?auto_158956 ?auto_158957 ) ) ( not ( = ?auto_158956 ?auto_158958 ) ) ( not ( = ?auto_158957 ?auto_158958 ) ) ( ON ?auto_158958 ?auto_158960 ) ( not ( = ?auto_158952 ?auto_158960 ) ) ( not ( = ?auto_158953 ?auto_158960 ) ) ( not ( = ?auto_158954 ?auto_158960 ) ) ( not ( = ?auto_158955 ?auto_158960 ) ) ( not ( = ?auto_158956 ?auto_158960 ) ) ( not ( = ?auto_158957 ?auto_158960 ) ) ( not ( = ?auto_158958 ?auto_158960 ) ) ( ON ?auto_158957 ?auto_158958 ) ( ON-TABLE ?auto_158959 ) ( ON ?auto_158960 ?auto_158959 ) ( not ( = ?auto_158959 ?auto_158960 ) ) ( not ( = ?auto_158959 ?auto_158958 ) ) ( not ( = ?auto_158959 ?auto_158957 ) ) ( not ( = ?auto_158952 ?auto_158959 ) ) ( not ( = ?auto_158953 ?auto_158959 ) ) ( not ( = ?auto_158954 ?auto_158959 ) ) ( not ( = ?auto_158955 ?auto_158959 ) ) ( not ( = ?auto_158956 ?auto_158959 ) ) ( ON ?auto_158956 ?auto_158957 ) ( CLEAR ?auto_158956 ) ( HOLDING ?auto_158955 ) ( CLEAR ?auto_158954 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_158952 ?auto_158953 ?auto_158954 ?auto_158955 )
      ( MAKE-7PILE ?auto_158952 ?auto_158953 ?auto_158954 ?auto_158955 ?auto_158956 ?auto_158957 ?auto_158958 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158961 - BLOCK
      ?auto_158962 - BLOCK
      ?auto_158963 - BLOCK
      ?auto_158964 - BLOCK
      ?auto_158965 - BLOCK
      ?auto_158966 - BLOCK
      ?auto_158967 - BLOCK
    )
    :vars
    (
      ?auto_158969 - BLOCK
      ?auto_158968 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158961 ) ( ON ?auto_158962 ?auto_158961 ) ( ON ?auto_158963 ?auto_158962 ) ( not ( = ?auto_158961 ?auto_158962 ) ) ( not ( = ?auto_158961 ?auto_158963 ) ) ( not ( = ?auto_158961 ?auto_158964 ) ) ( not ( = ?auto_158961 ?auto_158965 ) ) ( not ( = ?auto_158961 ?auto_158966 ) ) ( not ( = ?auto_158961 ?auto_158967 ) ) ( not ( = ?auto_158962 ?auto_158963 ) ) ( not ( = ?auto_158962 ?auto_158964 ) ) ( not ( = ?auto_158962 ?auto_158965 ) ) ( not ( = ?auto_158962 ?auto_158966 ) ) ( not ( = ?auto_158962 ?auto_158967 ) ) ( not ( = ?auto_158963 ?auto_158964 ) ) ( not ( = ?auto_158963 ?auto_158965 ) ) ( not ( = ?auto_158963 ?auto_158966 ) ) ( not ( = ?auto_158963 ?auto_158967 ) ) ( not ( = ?auto_158964 ?auto_158965 ) ) ( not ( = ?auto_158964 ?auto_158966 ) ) ( not ( = ?auto_158964 ?auto_158967 ) ) ( not ( = ?auto_158965 ?auto_158966 ) ) ( not ( = ?auto_158965 ?auto_158967 ) ) ( not ( = ?auto_158966 ?auto_158967 ) ) ( ON ?auto_158967 ?auto_158969 ) ( not ( = ?auto_158961 ?auto_158969 ) ) ( not ( = ?auto_158962 ?auto_158969 ) ) ( not ( = ?auto_158963 ?auto_158969 ) ) ( not ( = ?auto_158964 ?auto_158969 ) ) ( not ( = ?auto_158965 ?auto_158969 ) ) ( not ( = ?auto_158966 ?auto_158969 ) ) ( not ( = ?auto_158967 ?auto_158969 ) ) ( ON ?auto_158966 ?auto_158967 ) ( ON-TABLE ?auto_158968 ) ( ON ?auto_158969 ?auto_158968 ) ( not ( = ?auto_158968 ?auto_158969 ) ) ( not ( = ?auto_158968 ?auto_158967 ) ) ( not ( = ?auto_158968 ?auto_158966 ) ) ( not ( = ?auto_158961 ?auto_158968 ) ) ( not ( = ?auto_158962 ?auto_158968 ) ) ( not ( = ?auto_158963 ?auto_158968 ) ) ( not ( = ?auto_158964 ?auto_158968 ) ) ( not ( = ?auto_158965 ?auto_158968 ) ) ( ON ?auto_158965 ?auto_158966 ) ( CLEAR ?auto_158963 ) ( ON ?auto_158964 ?auto_158965 ) ( CLEAR ?auto_158964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_158968 ?auto_158969 ?auto_158967 ?auto_158966 ?auto_158965 )
      ( MAKE-7PILE ?auto_158961 ?auto_158962 ?auto_158963 ?auto_158964 ?auto_158965 ?auto_158966 ?auto_158967 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158970 - BLOCK
      ?auto_158971 - BLOCK
      ?auto_158972 - BLOCK
      ?auto_158973 - BLOCK
      ?auto_158974 - BLOCK
      ?auto_158975 - BLOCK
      ?auto_158976 - BLOCK
    )
    :vars
    (
      ?auto_158977 - BLOCK
      ?auto_158978 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158970 ) ( ON ?auto_158971 ?auto_158970 ) ( not ( = ?auto_158970 ?auto_158971 ) ) ( not ( = ?auto_158970 ?auto_158972 ) ) ( not ( = ?auto_158970 ?auto_158973 ) ) ( not ( = ?auto_158970 ?auto_158974 ) ) ( not ( = ?auto_158970 ?auto_158975 ) ) ( not ( = ?auto_158970 ?auto_158976 ) ) ( not ( = ?auto_158971 ?auto_158972 ) ) ( not ( = ?auto_158971 ?auto_158973 ) ) ( not ( = ?auto_158971 ?auto_158974 ) ) ( not ( = ?auto_158971 ?auto_158975 ) ) ( not ( = ?auto_158971 ?auto_158976 ) ) ( not ( = ?auto_158972 ?auto_158973 ) ) ( not ( = ?auto_158972 ?auto_158974 ) ) ( not ( = ?auto_158972 ?auto_158975 ) ) ( not ( = ?auto_158972 ?auto_158976 ) ) ( not ( = ?auto_158973 ?auto_158974 ) ) ( not ( = ?auto_158973 ?auto_158975 ) ) ( not ( = ?auto_158973 ?auto_158976 ) ) ( not ( = ?auto_158974 ?auto_158975 ) ) ( not ( = ?auto_158974 ?auto_158976 ) ) ( not ( = ?auto_158975 ?auto_158976 ) ) ( ON ?auto_158976 ?auto_158977 ) ( not ( = ?auto_158970 ?auto_158977 ) ) ( not ( = ?auto_158971 ?auto_158977 ) ) ( not ( = ?auto_158972 ?auto_158977 ) ) ( not ( = ?auto_158973 ?auto_158977 ) ) ( not ( = ?auto_158974 ?auto_158977 ) ) ( not ( = ?auto_158975 ?auto_158977 ) ) ( not ( = ?auto_158976 ?auto_158977 ) ) ( ON ?auto_158975 ?auto_158976 ) ( ON-TABLE ?auto_158978 ) ( ON ?auto_158977 ?auto_158978 ) ( not ( = ?auto_158978 ?auto_158977 ) ) ( not ( = ?auto_158978 ?auto_158976 ) ) ( not ( = ?auto_158978 ?auto_158975 ) ) ( not ( = ?auto_158970 ?auto_158978 ) ) ( not ( = ?auto_158971 ?auto_158978 ) ) ( not ( = ?auto_158972 ?auto_158978 ) ) ( not ( = ?auto_158973 ?auto_158978 ) ) ( not ( = ?auto_158974 ?auto_158978 ) ) ( ON ?auto_158974 ?auto_158975 ) ( ON ?auto_158973 ?auto_158974 ) ( CLEAR ?auto_158973 ) ( HOLDING ?auto_158972 ) ( CLEAR ?auto_158971 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_158970 ?auto_158971 ?auto_158972 )
      ( MAKE-7PILE ?auto_158970 ?auto_158971 ?auto_158972 ?auto_158973 ?auto_158974 ?auto_158975 ?auto_158976 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158979 - BLOCK
      ?auto_158980 - BLOCK
      ?auto_158981 - BLOCK
      ?auto_158982 - BLOCK
      ?auto_158983 - BLOCK
      ?auto_158984 - BLOCK
      ?auto_158985 - BLOCK
    )
    :vars
    (
      ?auto_158986 - BLOCK
      ?auto_158987 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158979 ) ( ON ?auto_158980 ?auto_158979 ) ( not ( = ?auto_158979 ?auto_158980 ) ) ( not ( = ?auto_158979 ?auto_158981 ) ) ( not ( = ?auto_158979 ?auto_158982 ) ) ( not ( = ?auto_158979 ?auto_158983 ) ) ( not ( = ?auto_158979 ?auto_158984 ) ) ( not ( = ?auto_158979 ?auto_158985 ) ) ( not ( = ?auto_158980 ?auto_158981 ) ) ( not ( = ?auto_158980 ?auto_158982 ) ) ( not ( = ?auto_158980 ?auto_158983 ) ) ( not ( = ?auto_158980 ?auto_158984 ) ) ( not ( = ?auto_158980 ?auto_158985 ) ) ( not ( = ?auto_158981 ?auto_158982 ) ) ( not ( = ?auto_158981 ?auto_158983 ) ) ( not ( = ?auto_158981 ?auto_158984 ) ) ( not ( = ?auto_158981 ?auto_158985 ) ) ( not ( = ?auto_158982 ?auto_158983 ) ) ( not ( = ?auto_158982 ?auto_158984 ) ) ( not ( = ?auto_158982 ?auto_158985 ) ) ( not ( = ?auto_158983 ?auto_158984 ) ) ( not ( = ?auto_158983 ?auto_158985 ) ) ( not ( = ?auto_158984 ?auto_158985 ) ) ( ON ?auto_158985 ?auto_158986 ) ( not ( = ?auto_158979 ?auto_158986 ) ) ( not ( = ?auto_158980 ?auto_158986 ) ) ( not ( = ?auto_158981 ?auto_158986 ) ) ( not ( = ?auto_158982 ?auto_158986 ) ) ( not ( = ?auto_158983 ?auto_158986 ) ) ( not ( = ?auto_158984 ?auto_158986 ) ) ( not ( = ?auto_158985 ?auto_158986 ) ) ( ON ?auto_158984 ?auto_158985 ) ( ON-TABLE ?auto_158987 ) ( ON ?auto_158986 ?auto_158987 ) ( not ( = ?auto_158987 ?auto_158986 ) ) ( not ( = ?auto_158987 ?auto_158985 ) ) ( not ( = ?auto_158987 ?auto_158984 ) ) ( not ( = ?auto_158979 ?auto_158987 ) ) ( not ( = ?auto_158980 ?auto_158987 ) ) ( not ( = ?auto_158981 ?auto_158987 ) ) ( not ( = ?auto_158982 ?auto_158987 ) ) ( not ( = ?auto_158983 ?auto_158987 ) ) ( ON ?auto_158983 ?auto_158984 ) ( ON ?auto_158982 ?auto_158983 ) ( CLEAR ?auto_158980 ) ( ON ?auto_158981 ?auto_158982 ) ( CLEAR ?auto_158981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_158987 ?auto_158986 ?auto_158985 ?auto_158984 ?auto_158983 ?auto_158982 )
      ( MAKE-7PILE ?auto_158979 ?auto_158980 ?auto_158981 ?auto_158982 ?auto_158983 ?auto_158984 ?auto_158985 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158988 - BLOCK
      ?auto_158989 - BLOCK
      ?auto_158990 - BLOCK
      ?auto_158991 - BLOCK
      ?auto_158992 - BLOCK
      ?auto_158993 - BLOCK
      ?auto_158994 - BLOCK
    )
    :vars
    (
      ?auto_158996 - BLOCK
      ?auto_158995 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158988 ) ( not ( = ?auto_158988 ?auto_158989 ) ) ( not ( = ?auto_158988 ?auto_158990 ) ) ( not ( = ?auto_158988 ?auto_158991 ) ) ( not ( = ?auto_158988 ?auto_158992 ) ) ( not ( = ?auto_158988 ?auto_158993 ) ) ( not ( = ?auto_158988 ?auto_158994 ) ) ( not ( = ?auto_158989 ?auto_158990 ) ) ( not ( = ?auto_158989 ?auto_158991 ) ) ( not ( = ?auto_158989 ?auto_158992 ) ) ( not ( = ?auto_158989 ?auto_158993 ) ) ( not ( = ?auto_158989 ?auto_158994 ) ) ( not ( = ?auto_158990 ?auto_158991 ) ) ( not ( = ?auto_158990 ?auto_158992 ) ) ( not ( = ?auto_158990 ?auto_158993 ) ) ( not ( = ?auto_158990 ?auto_158994 ) ) ( not ( = ?auto_158991 ?auto_158992 ) ) ( not ( = ?auto_158991 ?auto_158993 ) ) ( not ( = ?auto_158991 ?auto_158994 ) ) ( not ( = ?auto_158992 ?auto_158993 ) ) ( not ( = ?auto_158992 ?auto_158994 ) ) ( not ( = ?auto_158993 ?auto_158994 ) ) ( ON ?auto_158994 ?auto_158996 ) ( not ( = ?auto_158988 ?auto_158996 ) ) ( not ( = ?auto_158989 ?auto_158996 ) ) ( not ( = ?auto_158990 ?auto_158996 ) ) ( not ( = ?auto_158991 ?auto_158996 ) ) ( not ( = ?auto_158992 ?auto_158996 ) ) ( not ( = ?auto_158993 ?auto_158996 ) ) ( not ( = ?auto_158994 ?auto_158996 ) ) ( ON ?auto_158993 ?auto_158994 ) ( ON-TABLE ?auto_158995 ) ( ON ?auto_158996 ?auto_158995 ) ( not ( = ?auto_158995 ?auto_158996 ) ) ( not ( = ?auto_158995 ?auto_158994 ) ) ( not ( = ?auto_158995 ?auto_158993 ) ) ( not ( = ?auto_158988 ?auto_158995 ) ) ( not ( = ?auto_158989 ?auto_158995 ) ) ( not ( = ?auto_158990 ?auto_158995 ) ) ( not ( = ?auto_158991 ?auto_158995 ) ) ( not ( = ?auto_158992 ?auto_158995 ) ) ( ON ?auto_158992 ?auto_158993 ) ( ON ?auto_158991 ?auto_158992 ) ( ON ?auto_158990 ?auto_158991 ) ( CLEAR ?auto_158990 ) ( HOLDING ?auto_158989 ) ( CLEAR ?auto_158988 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_158988 ?auto_158989 )
      ( MAKE-7PILE ?auto_158988 ?auto_158989 ?auto_158990 ?auto_158991 ?auto_158992 ?auto_158993 ?auto_158994 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158997 - BLOCK
      ?auto_158998 - BLOCK
      ?auto_158999 - BLOCK
      ?auto_159000 - BLOCK
      ?auto_159001 - BLOCK
      ?auto_159002 - BLOCK
      ?auto_159003 - BLOCK
    )
    :vars
    (
      ?auto_159005 - BLOCK
      ?auto_159004 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158997 ) ( not ( = ?auto_158997 ?auto_158998 ) ) ( not ( = ?auto_158997 ?auto_158999 ) ) ( not ( = ?auto_158997 ?auto_159000 ) ) ( not ( = ?auto_158997 ?auto_159001 ) ) ( not ( = ?auto_158997 ?auto_159002 ) ) ( not ( = ?auto_158997 ?auto_159003 ) ) ( not ( = ?auto_158998 ?auto_158999 ) ) ( not ( = ?auto_158998 ?auto_159000 ) ) ( not ( = ?auto_158998 ?auto_159001 ) ) ( not ( = ?auto_158998 ?auto_159002 ) ) ( not ( = ?auto_158998 ?auto_159003 ) ) ( not ( = ?auto_158999 ?auto_159000 ) ) ( not ( = ?auto_158999 ?auto_159001 ) ) ( not ( = ?auto_158999 ?auto_159002 ) ) ( not ( = ?auto_158999 ?auto_159003 ) ) ( not ( = ?auto_159000 ?auto_159001 ) ) ( not ( = ?auto_159000 ?auto_159002 ) ) ( not ( = ?auto_159000 ?auto_159003 ) ) ( not ( = ?auto_159001 ?auto_159002 ) ) ( not ( = ?auto_159001 ?auto_159003 ) ) ( not ( = ?auto_159002 ?auto_159003 ) ) ( ON ?auto_159003 ?auto_159005 ) ( not ( = ?auto_158997 ?auto_159005 ) ) ( not ( = ?auto_158998 ?auto_159005 ) ) ( not ( = ?auto_158999 ?auto_159005 ) ) ( not ( = ?auto_159000 ?auto_159005 ) ) ( not ( = ?auto_159001 ?auto_159005 ) ) ( not ( = ?auto_159002 ?auto_159005 ) ) ( not ( = ?auto_159003 ?auto_159005 ) ) ( ON ?auto_159002 ?auto_159003 ) ( ON-TABLE ?auto_159004 ) ( ON ?auto_159005 ?auto_159004 ) ( not ( = ?auto_159004 ?auto_159005 ) ) ( not ( = ?auto_159004 ?auto_159003 ) ) ( not ( = ?auto_159004 ?auto_159002 ) ) ( not ( = ?auto_158997 ?auto_159004 ) ) ( not ( = ?auto_158998 ?auto_159004 ) ) ( not ( = ?auto_158999 ?auto_159004 ) ) ( not ( = ?auto_159000 ?auto_159004 ) ) ( not ( = ?auto_159001 ?auto_159004 ) ) ( ON ?auto_159001 ?auto_159002 ) ( ON ?auto_159000 ?auto_159001 ) ( ON ?auto_158999 ?auto_159000 ) ( CLEAR ?auto_158997 ) ( ON ?auto_158998 ?auto_158999 ) ( CLEAR ?auto_158998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_159004 ?auto_159005 ?auto_159003 ?auto_159002 ?auto_159001 ?auto_159000 ?auto_158999 )
      ( MAKE-7PILE ?auto_158997 ?auto_158998 ?auto_158999 ?auto_159000 ?auto_159001 ?auto_159002 ?auto_159003 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_159006 - BLOCK
      ?auto_159007 - BLOCK
      ?auto_159008 - BLOCK
      ?auto_159009 - BLOCK
      ?auto_159010 - BLOCK
      ?auto_159011 - BLOCK
      ?auto_159012 - BLOCK
    )
    :vars
    (
      ?auto_159014 - BLOCK
      ?auto_159013 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159006 ?auto_159007 ) ) ( not ( = ?auto_159006 ?auto_159008 ) ) ( not ( = ?auto_159006 ?auto_159009 ) ) ( not ( = ?auto_159006 ?auto_159010 ) ) ( not ( = ?auto_159006 ?auto_159011 ) ) ( not ( = ?auto_159006 ?auto_159012 ) ) ( not ( = ?auto_159007 ?auto_159008 ) ) ( not ( = ?auto_159007 ?auto_159009 ) ) ( not ( = ?auto_159007 ?auto_159010 ) ) ( not ( = ?auto_159007 ?auto_159011 ) ) ( not ( = ?auto_159007 ?auto_159012 ) ) ( not ( = ?auto_159008 ?auto_159009 ) ) ( not ( = ?auto_159008 ?auto_159010 ) ) ( not ( = ?auto_159008 ?auto_159011 ) ) ( not ( = ?auto_159008 ?auto_159012 ) ) ( not ( = ?auto_159009 ?auto_159010 ) ) ( not ( = ?auto_159009 ?auto_159011 ) ) ( not ( = ?auto_159009 ?auto_159012 ) ) ( not ( = ?auto_159010 ?auto_159011 ) ) ( not ( = ?auto_159010 ?auto_159012 ) ) ( not ( = ?auto_159011 ?auto_159012 ) ) ( ON ?auto_159012 ?auto_159014 ) ( not ( = ?auto_159006 ?auto_159014 ) ) ( not ( = ?auto_159007 ?auto_159014 ) ) ( not ( = ?auto_159008 ?auto_159014 ) ) ( not ( = ?auto_159009 ?auto_159014 ) ) ( not ( = ?auto_159010 ?auto_159014 ) ) ( not ( = ?auto_159011 ?auto_159014 ) ) ( not ( = ?auto_159012 ?auto_159014 ) ) ( ON ?auto_159011 ?auto_159012 ) ( ON-TABLE ?auto_159013 ) ( ON ?auto_159014 ?auto_159013 ) ( not ( = ?auto_159013 ?auto_159014 ) ) ( not ( = ?auto_159013 ?auto_159012 ) ) ( not ( = ?auto_159013 ?auto_159011 ) ) ( not ( = ?auto_159006 ?auto_159013 ) ) ( not ( = ?auto_159007 ?auto_159013 ) ) ( not ( = ?auto_159008 ?auto_159013 ) ) ( not ( = ?auto_159009 ?auto_159013 ) ) ( not ( = ?auto_159010 ?auto_159013 ) ) ( ON ?auto_159010 ?auto_159011 ) ( ON ?auto_159009 ?auto_159010 ) ( ON ?auto_159008 ?auto_159009 ) ( ON ?auto_159007 ?auto_159008 ) ( CLEAR ?auto_159007 ) ( HOLDING ?auto_159006 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_159006 )
      ( MAKE-7PILE ?auto_159006 ?auto_159007 ?auto_159008 ?auto_159009 ?auto_159010 ?auto_159011 ?auto_159012 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_159015 - BLOCK
      ?auto_159016 - BLOCK
      ?auto_159017 - BLOCK
      ?auto_159018 - BLOCK
      ?auto_159019 - BLOCK
      ?auto_159020 - BLOCK
      ?auto_159021 - BLOCK
    )
    :vars
    (
      ?auto_159023 - BLOCK
      ?auto_159022 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159015 ?auto_159016 ) ) ( not ( = ?auto_159015 ?auto_159017 ) ) ( not ( = ?auto_159015 ?auto_159018 ) ) ( not ( = ?auto_159015 ?auto_159019 ) ) ( not ( = ?auto_159015 ?auto_159020 ) ) ( not ( = ?auto_159015 ?auto_159021 ) ) ( not ( = ?auto_159016 ?auto_159017 ) ) ( not ( = ?auto_159016 ?auto_159018 ) ) ( not ( = ?auto_159016 ?auto_159019 ) ) ( not ( = ?auto_159016 ?auto_159020 ) ) ( not ( = ?auto_159016 ?auto_159021 ) ) ( not ( = ?auto_159017 ?auto_159018 ) ) ( not ( = ?auto_159017 ?auto_159019 ) ) ( not ( = ?auto_159017 ?auto_159020 ) ) ( not ( = ?auto_159017 ?auto_159021 ) ) ( not ( = ?auto_159018 ?auto_159019 ) ) ( not ( = ?auto_159018 ?auto_159020 ) ) ( not ( = ?auto_159018 ?auto_159021 ) ) ( not ( = ?auto_159019 ?auto_159020 ) ) ( not ( = ?auto_159019 ?auto_159021 ) ) ( not ( = ?auto_159020 ?auto_159021 ) ) ( ON ?auto_159021 ?auto_159023 ) ( not ( = ?auto_159015 ?auto_159023 ) ) ( not ( = ?auto_159016 ?auto_159023 ) ) ( not ( = ?auto_159017 ?auto_159023 ) ) ( not ( = ?auto_159018 ?auto_159023 ) ) ( not ( = ?auto_159019 ?auto_159023 ) ) ( not ( = ?auto_159020 ?auto_159023 ) ) ( not ( = ?auto_159021 ?auto_159023 ) ) ( ON ?auto_159020 ?auto_159021 ) ( ON-TABLE ?auto_159022 ) ( ON ?auto_159023 ?auto_159022 ) ( not ( = ?auto_159022 ?auto_159023 ) ) ( not ( = ?auto_159022 ?auto_159021 ) ) ( not ( = ?auto_159022 ?auto_159020 ) ) ( not ( = ?auto_159015 ?auto_159022 ) ) ( not ( = ?auto_159016 ?auto_159022 ) ) ( not ( = ?auto_159017 ?auto_159022 ) ) ( not ( = ?auto_159018 ?auto_159022 ) ) ( not ( = ?auto_159019 ?auto_159022 ) ) ( ON ?auto_159019 ?auto_159020 ) ( ON ?auto_159018 ?auto_159019 ) ( ON ?auto_159017 ?auto_159018 ) ( ON ?auto_159016 ?auto_159017 ) ( ON ?auto_159015 ?auto_159016 ) ( CLEAR ?auto_159015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_159022 ?auto_159023 ?auto_159021 ?auto_159020 ?auto_159019 ?auto_159018 ?auto_159017 ?auto_159016 )
      ( MAKE-7PILE ?auto_159015 ?auto_159016 ?auto_159017 ?auto_159018 ?auto_159019 ?auto_159020 ?auto_159021 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159025 - BLOCK
    )
    :vars
    (
      ?auto_159026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159026 ?auto_159025 ) ( CLEAR ?auto_159026 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_159025 ) ( not ( = ?auto_159025 ?auto_159026 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_159026 ?auto_159025 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159027 - BLOCK
    )
    :vars
    (
      ?auto_159028 - BLOCK
      ?auto_159029 - BLOCK
      ?auto_159030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159028 ?auto_159027 ) ( CLEAR ?auto_159028 ) ( ON-TABLE ?auto_159027 ) ( not ( = ?auto_159027 ?auto_159028 ) ) ( HOLDING ?auto_159029 ) ( CLEAR ?auto_159030 ) ( not ( = ?auto_159027 ?auto_159029 ) ) ( not ( = ?auto_159027 ?auto_159030 ) ) ( not ( = ?auto_159028 ?auto_159029 ) ) ( not ( = ?auto_159028 ?auto_159030 ) ) ( not ( = ?auto_159029 ?auto_159030 ) ) )
    :subtasks
    ( ( !STACK ?auto_159029 ?auto_159030 )
      ( MAKE-1PILE ?auto_159027 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159031 - BLOCK
    )
    :vars
    (
      ?auto_159034 - BLOCK
      ?auto_159032 - BLOCK
      ?auto_159033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159034 ?auto_159031 ) ( ON-TABLE ?auto_159031 ) ( not ( = ?auto_159031 ?auto_159034 ) ) ( CLEAR ?auto_159032 ) ( not ( = ?auto_159031 ?auto_159033 ) ) ( not ( = ?auto_159031 ?auto_159032 ) ) ( not ( = ?auto_159034 ?auto_159033 ) ) ( not ( = ?auto_159034 ?auto_159032 ) ) ( not ( = ?auto_159033 ?auto_159032 ) ) ( ON ?auto_159033 ?auto_159034 ) ( CLEAR ?auto_159033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_159031 ?auto_159034 )
      ( MAKE-1PILE ?auto_159031 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159035 - BLOCK
    )
    :vars
    (
      ?auto_159036 - BLOCK
      ?auto_159038 - BLOCK
      ?auto_159037 - BLOCK
      ?auto_159043 - BLOCK
      ?auto_159040 - BLOCK
      ?auto_159041 - BLOCK
      ?auto_159042 - BLOCK
      ?auto_159039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159036 ?auto_159035 ) ( ON-TABLE ?auto_159035 ) ( not ( = ?auto_159035 ?auto_159036 ) ) ( not ( = ?auto_159035 ?auto_159038 ) ) ( not ( = ?auto_159035 ?auto_159037 ) ) ( not ( = ?auto_159036 ?auto_159038 ) ) ( not ( = ?auto_159036 ?auto_159037 ) ) ( not ( = ?auto_159038 ?auto_159037 ) ) ( ON ?auto_159038 ?auto_159036 ) ( CLEAR ?auto_159038 ) ( HOLDING ?auto_159037 ) ( CLEAR ?auto_159043 ) ( ON-TABLE ?auto_159040 ) ( ON ?auto_159041 ?auto_159040 ) ( ON ?auto_159042 ?auto_159041 ) ( ON ?auto_159039 ?auto_159042 ) ( ON ?auto_159043 ?auto_159039 ) ( not ( = ?auto_159040 ?auto_159041 ) ) ( not ( = ?auto_159040 ?auto_159042 ) ) ( not ( = ?auto_159040 ?auto_159039 ) ) ( not ( = ?auto_159040 ?auto_159043 ) ) ( not ( = ?auto_159040 ?auto_159037 ) ) ( not ( = ?auto_159041 ?auto_159042 ) ) ( not ( = ?auto_159041 ?auto_159039 ) ) ( not ( = ?auto_159041 ?auto_159043 ) ) ( not ( = ?auto_159041 ?auto_159037 ) ) ( not ( = ?auto_159042 ?auto_159039 ) ) ( not ( = ?auto_159042 ?auto_159043 ) ) ( not ( = ?auto_159042 ?auto_159037 ) ) ( not ( = ?auto_159039 ?auto_159043 ) ) ( not ( = ?auto_159039 ?auto_159037 ) ) ( not ( = ?auto_159043 ?auto_159037 ) ) ( not ( = ?auto_159035 ?auto_159043 ) ) ( not ( = ?auto_159035 ?auto_159040 ) ) ( not ( = ?auto_159035 ?auto_159041 ) ) ( not ( = ?auto_159035 ?auto_159042 ) ) ( not ( = ?auto_159035 ?auto_159039 ) ) ( not ( = ?auto_159036 ?auto_159043 ) ) ( not ( = ?auto_159036 ?auto_159040 ) ) ( not ( = ?auto_159036 ?auto_159041 ) ) ( not ( = ?auto_159036 ?auto_159042 ) ) ( not ( = ?auto_159036 ?auto_159039 ) ) ( not ( = ?auto_159038 ?auto_159043 ) ) ( not ( = ?auto_159038 ?auto_159040 ) ) ( not ( = ?auto_159038 ?auto_159041 ) ) ( not ( = ?auto_159038 ?auto_159042 ) ) ( not ( = ?auto_159038 ?auto_159039 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_159040 ?auto_159041 ?auto_159042 ?auto_159039 ?auto_159043 ?auto_159037 )
      ( MAKE-1PILE ?auto_159035 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159044 - BLOCK
    )
    :vars
    (
      ?auto_159049 - BLOCK
      ?auto_159052 - BLOCK
      ?auto_159045 - BLOCK
      ?auto_159050 - BLOCK
      ?auto_159048 - BLOCK
      ?auto_159047 - BLOCK
      ?auto_159046 - BLOCK
      ?auto_159051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159049 ?auto_159044 ) ( ON-TABLE ?auto_159044 ) ( not ( = ?auto_159044 ?auto_159049 ) ) ( not ( = ?auto_159044 ?auto_159052 ) ) ( not ( = ?auto_159044 ?auto_159045 ) ) ( not ( = ?auto_159049 ?auto_159052 ) ) ( not ( = ?auto_159049 ?auto_159045 ) ) ( not ( = ?auto_159052 ?auto_159045 ) ) ( ON ?auto_159052 ?auto_159049 ) ( CLEAR ?auto_159050 ) ( ON-TABLE ?auto_159048 ) ( ON ?auto_159047 ?auto_159048 ) ( ON ?auto_159046 ?auto_159047 ) ( ON ?auto_159051 ?auto_159046 ) ( ON ?auto_159050 ?auto_159051 ) ( not ( = ?auto_159048 ?auto_159047 ) ) ( not ( = ?auto_159048 ?auto_159046 ) ) ( not ( = ?auto_159048 ?auto_159051 ) ) ( not ( = ?auto_159048 ?auto_159050 ) ) ( not ( = ?auto_159048 ?auto_159045 ) ) ( not ( = ?auto_159047 ?auto_159046 ) ) ( not ( = ?auto_159047 ?auto_159051 ) ) ( not ( = ?auto_159047 ?auto_159050 ) ) ( not ( = ?auto_159047 ?auto_159045 ) ) ( not ( = ?auto_159046 ?auto_159051 ) ) ( not ( = ?auto_159046 ?auto_159050 ) ) ( not ( = ?auto_159046 ?auto_159045 ) ) ( not ( = ?auto_159051 ?auto_159050 ) ) ( not ( = ?auto_159051 ?auto_159045 ) ) ( not ( = ?auto_159050 ?auto_159045 ) ) ( not ( = ?auto_159044 ?auto_159050 ) ) ( not ( = ?auto_159044 ?auto_159048 ) ) ( not ( = ?auto_159044 ?auto_159047 ) ) ( not ( = ?auto_159044 ?auto_159046 ) ) ( not ( = ?auto_159044 ?auto_159051 ) ) ( not ( = ?auto_159049 ?auto_159050 ) ) ( not ( = ?auto_159049 ?auto_159048 ) ) ( not ( = ?auto_159049 ?auto_159047 ) ) ( not ( = ?auto_159049 ?auto_159046 ) ) ( not ( = ?auto_159049 ?auto_159051 ) ) ( not ( = ?auto_159052 ?auto_159050 ) ) ( not ( = ?auto_159052 ?auto_159048 ) ) ( not ( = ?auto_159052 ?auto_159047 ) ) ( not ( = ?auto_159052 ?auto_159046 ) ) ( not ( = ?auto_159052 ?auto_159051 ) ) ( ON ?auto_159045 ?auto_159052 ) ( CLEAR ?auto_159045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_159044 ?auto_159049 ?auto_159052 )
      ( MAKE-1PILE ?auto_159044 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159053 - BLOCK
    )
    :vars
    (
      ?auto_159054 - BLOCK
      ?auto_159060 - BLOCK
      ?auto_159056 - BLOCK
      ?auto_159058 - BLOCK
      ?auto_159057 - BLOCK
      ?auto_159061 - BLOCK
      ?auto_159059 - BLOCK
      ?auto_159055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159054 ?auto_159053 ) ( ON-TABLE ?auto_159053 ) ( not ( = ?auto_159053 ?auto_159054 ) ) ( not ( = ?auto_159053 ?auto_159060 ) ) ( not ( = ?auto_159053 ?auto_159056 ) ) ( not ( = ?auto_159054 ?auto_159060 ) ) ( not ( = ?auto_159054 ?auto_159056 ) ) ( not ( = ?auto_159060 ?auto_159056 ) ) ( ON ?auto_159060 ?auto_159054 ) ( ON-TABLE ?auto_159058 ) ( ON ?auto_159057 ?auto_159058 ) ( ON ?auto_159061 ?auto_159057 ) ( ON ?auto_159059 ?auto_159061 ) ( not ( = ?auto_159058 ?auto_159057 ) ) ( not ( = ?auto_159058 ?auto_159061 ) ) ( not ( = ?auto_159058 ?auto_159059 ) ) ( not ( = ?auto_159058 ?auto_159055 ) ) ( not ( = ?auto_159058 ?auto_159056 ) ) ( not ( = ?auto_159057 ?auto_159061 ) ) ( not ( = ?auto_159057 ?auto_159059 ) ) ( not ( = ?auto_159057 ?auto_159055 ) ) ( not ( = ?auto_159057 ?auto_159056 ) ) ( not ( = ?auto_159061 ?auto_159059 ) ) ( not ( = ?auto_159061 ?auto_159055 ) ) ( not ( = ?auto_159061 ?auto_159056 ) ) ( not ( = ?auto_159059 ?auto_159055 ) ) ( not ( = ?auto_159059 ?auto_159056 ) ) ( not ( = ?auto_159055 ?auto_159056 ) ) ( not ( = ?auto_159053 ?auto_159055 ) ) ( not ( = ?auto_159053 ?auto_159058 ) ) ( not ( = ?auto_159053 ?auto_159057 ) ) ( not ( = ?auto_159053 ?auto_159061 ) ) ( not ( = ?auto_159053 ?auto_159059 ) ) ( not ( = ?auto_159054 ?auto_159055 ) ) ( not ( = ?auto_159054 ?auto_159058 ) ) ( not ( = ?auto_159054 ?auto_159057 ) ) ( not ( = ?auto_159054 ?auto_159061 ) ) ( not ( = ?auto_159054 ?auto_159059 ) ) ( not ( = ?auto_159060 ?auto_159055 ) ) ( not ( = ?auto_159060 ?auto_159058 ) ) ( not ( = ?auto_159060 ?auto_159057 ) ) ( not ( = ?auto_159060 ?auto_159061 ) ) ( not ( = ?auto_159060 ?auto_159059 ) ) ( ON ?auto_159056 ?auto_159060 ) ( CLEAR ?auto_159056 ) ( HOLDING ?auto_159055 ) ( CLEAR ?auto_159059 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_159058 ?auto_159057 ?auto_159061 ?auto_159059 ?auto_159055 )
      ( MAKE-1PILE ?auto_159053 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159062 - BLOCK
    )
    :vars
    (
      ?auto_159064 - BLOCK
      ?auto_159066 - BLOCK
      ?auto_159063 - BLOCK
      ?auto_159069 - BLOCK
      ?auto_159070 - BLOCK
      ?auto_159065 - BLOCK
      ?auto_159068 - BLOCK
      ?auto_159067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159064 ?auto_159062 ) ( ON-TABLE ?auto_159062 ) ( not ( = ?auto_159062 ?auto_159064 ) ) ( not ( = ?auto_159062 ?auto_159066 ) ) ( not ( = ?auto_159062 ?auto_159063 ) ) ( not ( = ?auto_159064 ?auto_159066 ) ) ( not ( = ?auto_159064 ?auto_159063 ) ) ( not ( = ?auto_159066 ?auto_159063 ) ) ( ON ?auto_159066 ?auto_159064 ) ( ON-TABLE ?auto_159069 ) ( ON ?auto_159070 ?auto_159069 ) ( ON ?auto_159065 ?auto_159070 ) ( ON ?auto_159068 ?auto_159065 ) ( not ( = ?auto_159069 ?auto_159070 ) ) ( not ( = ?auto_159069 ?auto_159065 ) ) ( not ( = ?auto_159069 ?auto_159068 ) ) ( not ( = ?auto_159069 ?auto_159067 ) ) ( not ( = ?auto_159069 ?auto_159063 ) ) ( not ( = ?auto_159070 ?auto_159065 ) ) ( not ( = ?auto_159070 ?auto_159068 ) ) ( not ( = ?auto_159070 ?auto_159067 ) ) ( not ( = ?auto_159070 ?auto_159063 ) ) ( not ( = ?auto_159065 ?auto_159068 ) ) ( not ( = ?auto_159065 ?auto_159067 ) ) ( not ( = ?auto_159065 ?auto_159063 ) ) ( not ( = ?auto_159068 ?auto_159067 ) ) ( not ( = ?auto_159068 ?auto_159063 ) ) ( not ( = ?auto_159067 ?auto_159063 ) ) ( not ( = ?auto_159062 ?auto_159067 ) ) ( not ( = ?auto_159062 ?auto_159069 ) ) ( not ( = ?auto_159062 ?auto_159070 ) ) ( not ( = ?auto_159062 ?auto_159065 ) ) ( not ( = ?auto_159062 ?auto_159068 ) ) ( not ( = ?auto_159064 ?auto_159067 ) ) ( not ( = ?auto_159064 ?auto_159069 ) ) ( not ( = ?auto_159064 ?auto_159070 ) ) ( not ( = ?auto_159064 ?auto_159065 ) ) ( not ( = ?auto_159064 ?auto_159068 ) ) ( not ( = ?auto_159066 ?auto_159067 ) ) ( not ( = ?auto_159066 ?auto_159069 ) ) ( not ( = ?auto_159066 ?auto_159070 ) ) ( not ( = ?auto_159066 ?auto_159065 ) ) ( not ( = ?auto_159066 ?auto_159068 ) ) ( ON ?auto_159063 ?auto_159066 ) ( CLEAR ?auto_159068 ) ( ON ?auto_159067 ?auto_159063 ) ( CLEAR ?auto_159067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_159062 ?auto_159064 ?auto_159066 ?auto_159063 )
      ( MAKE-1PILE ?auto_159062 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159071 - BLOCK
    )
    :vars
    (
      ?auto_159078 - BLOCK
      ?auto_159074 - BLOCK
      ?auto_159079 - BLOCK
      ?auto_159073 - BLOCK
      ?auto_159076 - BLOCK
      ?auto_159072 - BLOCK
      ?auto_159077 - BLOCK
      ?auto_159075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159078 ?auto_159071 ) ( ON-TABLE ?auto_159071 ) ( not ( = ?auto_159071 ?auto_159078 ) ) ( not ( = ?auto_159071 ?auto_159074 ) ) ( not ( = ?auto_159071 ?auto_159079 ) ) ( not ( = ?auto_159078 ?auto_159074 ) ) ( not ( = ?auto_159078 ?auto_159079 ) ) ( not ( = ?auto_159074 ?auto_159079 ) ) ( ON ?auto_159074 ?auto_159078 ) ( ON-TABLE ?auto_159073 ) ( ON ?auto_159076 ?auto_159073 ) ( ON ?auto_159072 ?auto_159076 ) ( not ( = ?auto_159073 ?auto_159076 ) ) ( not ( = ?auto_159073 ?auto_159072 ) ) ( not ( = ?auto_159073 ?auto_159077 ) ) ( not ( = ?auto_159073 ?auto_159075 ) ) ( not ( = ?auto_159073 ?auto_159079 ) ) ( not ( = ?auto_159076 ?auto_159072 ) ) ( not ( = ?auto_159076 ?auto_159077 ) ) ( not ( = ?auto_159076 ?auto_159075 ) ) ( not ( = ?auto_159076 ?auto_159079 ) ) ( not ( = ?auto_159072 ?auto_159077 ) ) ( not ( = ?auto_159072 ?auto_159075 ) ) ( not ( = ?auto_159072 ?auto_159079 ) ) ( not ( = ?auto_159077 ?auto_159075 ) ) ( not ( = ?auto_159077 ?auto_159079 ) ) ( not ( = ?auto_159075 ?auto_159079 ) ) ( not ( = ?auto_159071 ?auto_159075 ) ) ( not ( = ?auto_159071 ?auto_159073 ) ) ( not ( = ?auto_159071 ?auto_159076 ) ) ( not ( = ?auto_159071 ?auto_159072 ) ) ( not ( = ?auto_159071 ?auto_159077 ) ) ( not ( = ?auto_159078 ?auto_159075 ) ) ( not ( = ?auto_159078 ?auto_159073 ) ) ( not ( = ?auto_159078 ?auto_159076 ) ) ( not ( = ?auto_159078 ?auto_159072 ) ) ( not ( = ?auto_159078 ?auto_159077 ) ) ( not ( = ?auto_159074 ?auto_159075 ) ) ( not ( = ?auto_159074 ?auto_159073 ) ) ( not ( = ?auto_159074 ?auto_159076 ) ) ( not ( = ?auto_159074 ?auto_159072 ) ) ( not ( = ?auto_159074 ?auto_159077 ) ) ( ON ?auto_159079 ?auto_159074 ) ( ON ?auto_159075 ?auto_159079 ) ( CLEAR ?auto_159075 ) ( HOLDING ?auto_159077 ) ( CLEAR ?auto_159072 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_159073 ?auto_159076 ?auto_159072 ?auto_159077 )
      ( MAKE-1PILE ?auto_159071 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159080 - BLOCK
    )
    :vars
    (
      ?auto_159083 - BLOCK
      ?auto_159082 - BLOCK
      ?auto_159085 - BLOCK
      ?auto_159088 - BLOCK
      ?auto_159087 - BLOCK
      ?auto_159084 - BLOCK
      ?auto_159086 - BLOCK
      ?auto_159081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159083 ?auto_159080 ) ( ON-TABLE ?auto_159080 ) ( not ( = ?auto_159080 ?auto_159083 ) ) ( not ( = ?auto_159080 ?auto_159082 ) ) ( not ( = ?auto_159080 ?auto_159085 ) ) ( not ( = ?auto_159083 ?auto_159082 ) ) ( not ( = ?auto_159083 ?auto_159085 ) ) ( not ( = ?auto_159082 ?auto_159085 ) ) ( ON ?auto_159082 ?auto_159083 ) ( ON-TABLE ?auto_159088 ) ( ON ?auto_159087 ?auto_159088 ) ( ON ?auto_159084 ?auto_159087 ) ( not ( = ?auto_159088 ?auto_159087 ) ) ( not ( = ?auto_159088 ?auto_159084 ) ) ( not ( = ?auto_159088 ?auto_159086 ) ) ( not ( = ?auto_159088 ?auto_159081 ) ) ( not ( = ?auto_159088 ?auto_159085 ) ) ( not ( = ?auto_159087 ?auto_159084 ) ) ( not ( = ?auto_159087 ?auto_159086 ) ) ( not ( = ?auto_159087 ?auto_159081 ) ) ( not ( = ?auto_159087 ?auto_159085 ) ) ( not ( = ?auto_159084 ?auto_159086 ) ) ( not ( = ?auto_159084 ?auto_159081 ) ) ( not ( = ?auto_159084 ?auto_159085 ) ) ( not ( = ?auto_159086 ?auto_159081 ) ) ( not ( = ?auto_159086 ?auto_159085 ) ) ( not ( = ?auto_159081 ?auto_159085 ) ) ( not ( = ?auto_159080 ?auto_159081 ) ) ( not ( = ?auto_159080 ?auto_159088 ) ) ( not ( = ?auto_159080 ?auto_159087 ) ) ( not ( = ?auto_159080 ?auto_159084 ) ) ( not ( = ?auto_159080 ?auto_159086 ) ) ( not ( = ?auto_159083 ?auto_159081 ) ) ( not ( = ?auto_159083 ?auto_159088 ) ) ( not ( = ?auto_159083 ?auto_159087 ) ) ( not ( = ?auto_159083 ?auto_159084 ) ) ( not ( = ?auto_159083 ?auto_159086 ) ) ( not ( = ?auto_159082 ?auto_159081 ) ) ( not ( = ?auto_159082 ?auto_159088 ) ) ( not ( = ?auto_159082 ?auto_159087 ) ) ( not ( = ?auto_159082 ?auto_159084 ) ) ( not ( = ?auto_159082 ?auto_159086 ) ) ( ON ?auto_159085 ?auto_159082 ) ( ON ?auto_159081 ?auto_159085 ) ( CLEAR ?auto_159084 ) ( ON ?auto_159086 ?auto_159081 ) ( CLEAR ?auto_159086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_159080 ?auto_159083 ?auto_159082 ?auto_159085 ?auto_159081 )
      ( MAKE-1PILE ?auto_159080 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159089 - BLOCK
    )
    :vars
    (
      ?auto_159093 - BLOCK
      ?auto_159097 - BLOCK
      ?auto_159094 - BLOCK
      ?auto_159095 - BLOCK
      ?auto_159096 - BLOCK
      ?auto_159092 - BLOCK
      ?auto_159091 - BLOCK
      ?auto_159090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159093 ?auto_159089 ) ( ON-TABLE ?auto_159089 ) ( not ( = ?auto_159089 ?auto_159093 ) ) ( not ( = ?auto_159089 ?auto_159097 ) ) ( not ( = ?auto_159089 ?auto_159094 ) ) ( not ( = ?auto_159093 ?auto_159097 ) ) ( not ( = ?auto_159093 ?auto_159094 ) ) ( not ( = ?auto_159097 ?auto_159094 ) ) ( ON ?auto_159097 ?auto_159093 ) ( ON-TABLE ?auto_159095 ) ( ON ?auto_159096 ?auto_159095 ) ( not ( = ?auto_159095 ?auto_159096 ) ) ( not ( = ?auto_159095 ?auto_159092 ) ) ( not ( = ?auto_159095 ?auto_159091 ) ) ( not ( = ?auto_159095 ?auto_159090 ) ) ( not ( = ?auto_159095 ?auto_159094 ) ) ( not ( = ?auto_159096 ?auto_159092 ) ) ( not ( = ?auto_159096 ?auto_159091 ) ) ( not ( = ?auto_159096 ?auto_159090 ) ) ( not ( = ?auto_159096 ?auto_159094 ) ) ( not ( = ?auto_159092 ?auto_159091 ) ) ( not ( = ?auto_159092 ?auto_159090 ) ) ( not ( = ?auto_159092 ?auto_159094 ) ) ( not ( = ?auto_159091 ?auto_159090 ) ) ( not ( = ?auto_159091 ?auto_159094 ) ) ( not ( = ?auto_159090 ?auto_159094 ) ) ( not ( = ?auto_159089 ?auto_159090 ) ) ( not ( = ?auto_159089 ?auto_159095 ) ) ( not ( = ?auto_159089 ?auto_159096 ) ) ( not ( = ?auto_159089 ?auto_159092 ) ) ( not ( = ?auto_159089 ?auto_159091 ) ) ( not ( = ?auto_159093 ?auto_159090 ) ) ( not ( = ?auto_159093 ?auto_159095 ) ) ( not ( = ?auto_159093 ?auto_159096 ) ) ( not ( = ?auto_159093 ?auto_159092 ) ) ( not ( = ?auto_159093 ?auto_159091 ) ) ( not ( = ?auto_159097 ?auto_159090 ) ) ( not ( = ?auto_159097 ?auto_159095 ) ) ( not ( = ?auto_159097 ?auto_159096 ) ) ( not ( = ?auto_159097 ?auto_159092 ) ) ( not ( = ?auto_159097 ?auto_159091 ) ) ( ON ?auto_159094 ?auto_159097 ) ( ON ?auto_159090 ?auto_159094 ) ( ON ?auto_159091 ?auto_159090 ) ( CLEAR ?auto_159091 ) ( HOLDING ?auto_159092 ) ( CLEAR ?auto_159096 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_159095 ?auto_159096 ?auto_159092 )
      ( MAKE-1PILE ?auto_159089 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159098 - BLOCK
    )
    :vars
    (
      ?auto_159104 - BLOCK
      ?auto_159106 - BLOCK
      ?auto_159102 - BLOCK
      ?auto_159101 - BLOCK
      ?auto_159103 - BLOCK
      ?auto_159099 - BLOCK
      ?auto_159100 - BLOCK
      ?auto_159105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159104 ?auto_159098 ) ( ON-TABLE ?auto_159098 ) ( not ( = ?auto_159098 ?auto_159104 ) ) ( not ( = ?auto_159098 ?auto_159106 ) ) ( not ( = ?auto_159098 ?auto_159102 ) ) ( not ( = ?auto_159104 ?auto_159106 ) ) ( not ( = ?auto_159104 ?auto_159102 ) ) ( not ( = ?auto_159106 ?auto_159102 ) ) ( ON ?auto_159106 ?auto_159104 ) ( ON-TABLE ?auto_159101 ) ( ON ?auto_159103 ?auto_159101 ) ( not ( = ?auto_159101 ?auto_159103 ) ) ( not ( = ?auto_159101 ?auto_159099 ) ) ( not ( = ?auto_159101 ?auto_159100 ) ) ( not ( = ?auto_159101 ?auto_159105 ) ) ( not ( = ?auto_159101 ?auto_159102 ) ) ( not ( = ?auto_159103 ?auto_159099 ) ) ( not ( = ?auto_159103 ?auto_159100 ) ) ( not ( = ?auto_159103 ?auto_159105 ) ) ( not ( = ?auto_159103 ?auto_159102 ) ) ( not ( = ?auto_159099 ?auto_159100 ) ) ( not ( = ?auto_159099 ?auto_159105 ) ) ( not ( = ?auto_159099 ?auto_159102 ) ) ( not ( = ?auto_159100 ?auto_159105 ) ) ( not ( = ?auto_159100 ?auto_159102 ) ) ( not ( = ?auto_159105 ?auto_159102 ) ) ( not ( = ?auto_159098 ?auto_159105 ) ) ( not ( = ?auto_159098 ?auto_159101 ) ) ( not ( = ?auto_159098 ?auto_159103 ) ) ( not ( = ?auto_159098 ?auto_159099 ) ) ( not ( = ?auto_159098 ?auto_159100 ) ) ( not ( = ?auto_159104 ?auto_159105 ) ) ( not ( = ?auto_159104 ?auto_159101 ) ) ( not ( = ?auto_159104 ?auto_159103 ) ) ( not ( = ?auto_159104 ?auto_159099 ) ) ( not ( = ?auto_159104 ?auto_159100 ) ) ( not ( = ?auto_159106 ?auto_159105 ) ) ( not ( = ?auto_159106 ?auto_159101 ) ) ( not ( = ?auto_159106 ?auto_159103 ) ) ( not ( = ?auto_159106 ?auto_159099 ) ) ( not ( = ?auto_159106 ?auto_159100 ) ) ( ON ?auto_159102 ?auto_159106 ) ( ON ?auto_159105 ?auto_159102 ) ( ON ?auto_159100 ?auto_159105 ) ( CLEAR ?auto_159103 ) ( ON ?auto_159099 ?auto_159100 ) ( CLEAR ?auto_159099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_159098 ?auto_159104 ?auto_159106 ?auto_159102 ?auto_159105 ?auto_159100 )
      ( MAKE-1PILE ?auto_159098 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159107 - BLOCK
    )
    :vars
    (
      ?auto_159111 - BLOCK
      ?auto_159110 - BLOCK
      ?auto_159108 - BLOCK
      ?auto_159112 - BLOCK
      ?auto_159114 - BLOCK
      ?auto_159109 - BLOCK
      ?auto_159113 - BLOCK
      ?auto_159115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159111 ?auto_159107 ) ( ON-TABLE ?auto_159107 ) ( not ( = ?auto_159107 ?auto_159111 ) ) ( not ( = ?auto_159107 ?auto_159110 ) ) ( not ( = ?auto_159107 ?auto_159108 ) ) ( not ( = ?auto_159111 ?auto_159110 ) ) ( not ( = ?auto_159111 ?auto_159108 ) ) ( not ( = ?auto_159110 ?auto_159108 ) ) ( ON ?auto_159110 ?auto_159111 ) ( ON-TABLE ?auto_159112 ) ( not ( = ?auto_159112 ?auto_159114 ) ) ( not ( = ?auto_159112 ?auto_159109 ) ) ( not ( = ?auto_159112 ?auto_159113 ) ) ( not ( = ?auto_159112 ?auto_159115 ) ) ( not ( = ?auto_159112 ?auto_159108 ) ) ( not ( = ?auto_159114 ?auto_159109 ) ) ( not ( = ?auto_159114 ?auto_159113 ) ) ( not ( = ?auto_159114 ?auto_159115 ) ) ( not ( = ?auto_159114 ?auto_159108 ) ) ( not ( = ?auto_159109 ?auto_159113 ) ) ( not ( = ?auto_159109 ?auto_159115 ) ) ( not ( = ?auto_159109 ?auto_159108 ) ) ( not ( = ?auto_159113 ?auto_159115 ) ) ( not ( = ?auto_159113 ?auto_159108 ) ) ( not ( = ?auto_159115 ?auto_159108 ) ) ( not ( = ?auto_159107 ?auto_159115 ) ) ( not ( = ?auto_159107 ?auto_159112 ) ) ( not ( = ?auto_159107 ?auto_159114 ) ) ( not ( = ?auto_159107 ?auto_159109 ) ) ( not ( = ?auto_159107 ?auto_159113 ) ) ( not ( = ?auto_159111 ?auto_159115 ) ) ( not ( = ?auto_159111 ?auto_159112 ) ) ( not ( = ?auto_159111 ?auto_159114 ) ) ( not ( = ?auto_159111 ?auto_159109 ) ) ( not ( = ?auto_159111 ?auto_159113 ) ) ( not ( = ?auto_159110 ?auto_159115 ) ) ( not ( = ?auto_159110 ?auto_159112 ) ) ( not ( = ?auto_159110 ?auto_159114 ) ) ( not ( = ?auto_159110 ?auto_159109 ) ) ( not ( = ?auto_159110 ?auto_159113 ) ) ( ON ?auto_159108 ?auto_159110 ) ( ON ?auto_159115 ?auto_159108 ) ( ON ?auto_159113 ?auto_159115 ) ( ON ?auto_159109 ?auto_159113 ) ( CLEAR ?auto_159109 ) ( HOLDING ?auto_159114 ) ( CLEAR ?auto_159112 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_159112 ?auto_159114 )
      ( MAKE-1PILE ?auto_159107 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161286 - BLOCK
    )
    :vars
    (
      ?auto_161290 - BLOCK
      ?auto_161287 - BLOCK
      ?auto_161291 - BLOCK
      ?auto_161292 - BLOCK
      ?auto_161293 - BLOCK
      ?auto_161288 - BLOCK
      ?auto_161289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161290 ?auto_161286 ) ( ON-TABLE ?auto_161286 ) ( not ( = ?auto_161286 ?auto_161290 ) ) ( not ( = ?auto_161286 ?auto_161287 ) ) ( not ( = ?auto_161286 ?auto_161291 ) ) ( not ( = ?auto_161290 ?auto_161287 ) ) ( not ( = ?auto_161290 ?auto_161291 ) ) ( not ( = ?auto_161287 ?auto_161291 ) ) ( ON ?auto_161287 ?auto_161290 ) ( not ( = ?auto_161292 ?auto_161293 ) ) ( not ( = ?auto_161292 ?auto_161288 ) ) ( not ( = ?auto_161292 ?auto_161289 ) ) ( not ( = ?auto_161292 ?auto_161291 ) ) ( not ( = ?auto_161293 ?auto_161288 ) ) ( not ( = ?auto_161293 ?auto_161289 ) ) ( not ( = ?auto_161293 ?auto_161291 ) ) ( not ( = ?auto_161288 ?auto_161289 ) ) ( not ( = ?auto_161288 ?auto_161291 ) ) ( not ( = ?auto_161289 ?auto_161291 ) ) ( not ( = ?auto_161286 ?auto_161289 ) ) ( not ( = ?auto_161286 ?auto_161292 ) ) ( not ( = ?auto_161286 ?auto_161293 ) ) ( not ( = ?auto_161286 ?auto_161288 ) ) ( not ( = ?auto_161290 ?auto_161289 ) ) ( not ( = ?auto_161290 ?auto_161292 ) ) ( not ( = ?auto_161290 ?auto_161293 ) ) ( not ( = ?auto_161290 ?auto_161288 ) ) ( not ( = ?auto_161287 ?auto_161289 ) ) ( not ( = ?auto_161287 ?auto_161292 ) ) ( not ( = ?auto_161287 ?auto_161293 ) ) ( not ( = ?auto_161287 ?auto_161288 ) ) ( ON ?auto_161291 ?auto_161287 ) ( ON ?auto_161289 ?auto_161291 ) ( ON ?auto_161288 ?auto_161289 ) ( ON ?auto_161293 ?auto_161288 ) ( ON ?auto_161292 ?auto_161293 ) ( CLEAR ?auto_161292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_161286 ?auto_161290 ?auto_161287 ?auto_161291 ?auto_161289 ?auto_161288 ?auto_161293 )
      ( MAKE-1PILE ?auto_161286 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159125 - BLOCK
    )
    :vars
    (
      ?auto_159129 - BLOCK
      ?auto_159131 - BLOCK
      ?auto_159133 - BLOCK
      ?auto_159130 - BLOCK
      ?auto_159128 - BLOCK
      ?auto_159127 - BLOCK
      ?auto_159132 - BLOCK
      ?auto_159126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159129 ?auto_159125 ) ( ON-TABLE ?auto_159125 ) ( not ( = ?auto_159125 ?auto_159129 ) ) ( not ( = ?auto_159125 ?auto_159131 ) ) ( not ( = ?auto_159125 ?auto_159133 ) ) ( not ( = ?auto_159129 ?auto_159131 ) ) ( not ( = ?auto_159129 ?auto_159133 ) ) ( not ( = ?auto_159131 ?auto_159133 ) ) ( ON ?auto_159131 ?auto_159129 ) ( not ( = ?auto_159130 ?auto_159128 ) ) ( not ( = ?auto_159130 ?auto_159127 ) ) ( not ( = ?auto_159130 ?auto_159132 ) ) ( not ( = ?auto_159130 ?auto_159126 ) ) ( not ( = ?auto_159130 ?auto_159133 ) ) ( not ( = ?auto_159128 ?auto_159127 ) ) ( not ( = ?auto_159128 ?auto_159132 ) ) ( not ( = ?auto_159128 ?auto_159126 ) ) ( not ( = ?auto_159128 ?auto_159133 ) ) ( not ( = ?auto_159127 ?auto_159132 ) ) ( not ( = ?auto_159127 ?auto_159126 ) ) ( not ( = ?auto_159127 ?auto_159133 ) ) ( not ( = ?auto_159132 ?auto_159126 ) ) ( not ( = ?auto_159132 ?auto_159133 ) ) ( not ( = ?auto_159126 ?auto_159133 ) ) ( not ( = ?auto_159125 ?auto_159126 ) ) ( not ( = ?auto_159125 ?auto_159130 ) ) ( not ( = ?auto_159125 ?auto_159128 ) ) ( not ( = ?auto_159125 ?auto_159127 ) ) ( not ( = ?auto_159125 ?auto_159132 ) ) ( not ( = ?auto_159129 ?auto_159126 ) ) ( not ( = ?auto_159129 ?auto_159130 ) ) ( not ( = ?auto_159129 ?auto_159128 ) ) ( not ( = ?auto_159129 ?auto_159127 ) ) ( not ( = ?auto_159129 ?auto_159132 ) ) ( not ( = ?auto_159131 ?auto_159126 ) ) ( not ( = ?auto_159131 ?auto_159130 ) ) ( not ( = ?auto_159131 ?auto_159128 ) ) ( not ( = ?auto_159131 ?auto_159127 ) ) ( not ( = ?auto_159131 ?auto_159132 ) ) ( ON ?auto_159133 ?auto_159131 ) ( ON ?auto_159126 ?auto_159133 ) ( ON ?auto_159132 ?auto_159126 ) ( ON ?auto_159127 ?auto_159132 ) ( ON ?auto_159128 ?auto_159127 ) ( CLEAR ?auto_159128 ) ( HOLDING ?auto_159130 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_159130 )
      ( MAKE-1PILE ?auto_159125 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159134 - BLOCK
    )
    :vars
    (
      ?auto_159141 - BLOCK
      ?auto_159142 - BLOCK
      ?auto_159136 - BLOCK
      ?auto_159135 - BLOCK
      ?auto_159139 - BLOCK
      ?auto_159140 - BLOCK
      ?auto_159138 - BLOCK
      ?auto_159137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159141 ?auto_159134 ) ( ON-TABLE ?auto_159134 ) ( not ( = ?auto_159134 ?auto_159141 ) ) ( not ( = ?auto_159134 ?auto_159142 ) ) ( not ( = ?auto_159134 ?auto_159136 ) ) ( not ( = ?auto_159141 ?auto_159142 ) ) ( not ( = ?auto_159141 ?auto_159136 ) ) ( not ( = ?auto_159142 ?auto_159136 ) ) ( ON ?auto_159142 ?auto_159141 ) ( not ( = ?auto_159135 ?auto_159139 ) ) ( not ( = ?auto_159135 ?auto_159140 ) ) ( not ( = ?auto_159135 ?auto_159138 ) ) ( not ( = ?auto_159135 ?auto_159137 ) ) ( not ( = ?auto_159135 ?auto_159136 ) ) ( not ( = ?auto_159139 ?auto_159140 ) ) ( not ( = ?auto_159139 ?auto_159138 ) ) ( not ( = ?auto_159139 ?auto_159137 ) ) ( not ( = ?auto_159139 ?auto_159136 ) ) ( not ( = ?auto_159140 ?auto_159138 ) ) ( not ( = ?auto_159140 ?auto_159137 ) ) ( not ( = ?auto_159140 ?auto_159136 ) ) ( not ( = ?auto_159138 ?auto_159137 ) ) ( not ( = ?auto_159138 ?auto_159136 ) ) ( not ( = ?auto_159137 ?auto_159136 ) ) ( not ( = ?auto_159134 ?auto_159137 ) ) ( not ( = ?auto_159134 ?auto_159135 ) ) ( not ( = ?auto_159134 ?auto_159139 ) ) ( not ( = ?auto_159134 ?auto_159140 ) ) ( not ( = ?auto_159134 ?auto_159138 ) ) ( not ( = ?auto_159141 ?auto_159137 ) ) ( not ( = ?auto_159141 ?auto_159135 ) ) ( not ( = ?auto_159141 ?auto_159139 ) ) ( not ( = ?auto_159141 ?auto_159140 ) ) ( not ( = ?auto_159141 ?auto_159138 ) ) ( not ( = ?auto_159142 ?auto_159137 ) ) ( not ( = ?auto_159142 ?auto_159135 ) ) ( not ( = ?auto_159142 ?auto_159139 ) ) ( not ( = ?auto_159142 ?auto_159140 ) ) ( not ( = ?auto_159142 ?auto_159138 ) ) ( ON ?auto_159136 ?auto_159142 ) ( ON ?auto_159137 ?auto_159136 ) ( ON ?auto_159138 ?auto_159137 ) ( ON ?auto_159140 ?auto_159138 ) ( ON ?auto_159139 ?auto_159140 ) ( ON ?auto_159135 ?auto_159139 ) ( CLEAR ?auto_159135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_159134 ?auto_159141 ?auto_159142 ?auto_159136 ?auto_159137 ?auto_159138 ?auto_159140 ?auto_159139 )
      ( MAKE-1PILE ?auto_159134 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159151 - BLOCK
      ?auto_159152 - BLOCK
      ?auto_159153 - BLOCK
      ?auto_159154 - BLOCK
      ?auto_159155 - BLOCK
      ?auto_159156 - BLOCK
      ?auto_159157 - BLOCK
      ?auto_159158 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_159158 ) ( CLEAR ?auto_159157 ) ( ON-TABLE ?auto_159151 ) ( ON ?auto_159152 ?auto_159151 ) ( ON ?auto_159153 ?auto_159152 ) ( ON ?auto_159154 ?auto_159153 ) ( ON ?auto_159155 ?auto_159154 ) ( ON ?auto_159156 ?auto_159155 ) ( ON ?auto_159157 ?auto_159156 ) ( not ( = ?auto_159151 ?auto_159152 ) ) ( not ( = ?auto_159151 ?auto_159153 ) ) ( not ( = ?auto_159151 ?auto_159154 ) ) ( not ( = ?auto_159151 ?auto_159155 ) ) ( not ( = ?auto_159151 ?auto_159156 ) ) ( not ( = ?auto_159151 ?auto_159157 ) ) ( not ( = ?auto_159151 ?auto_159158 ) ) ( not ( = ?auto_159152 ?auto_159153 ) ) ( not ( = ?auto_159152 ?auto_159154 ) ) ( not ( = ?auto_159152 ?auto_159155 ) ) ( not ( = ?auto_159152 ?auto_159156 ) ) ( not ( = ?auto_159152 ?auto_159157 ) ) ( not ( = ?auto_159152 ?auto_159158 ) ) ( not ( = ?auto_159153 ?auto_159154 ) ) ( not ( = ?auto_159153 ?auto_159155 ) ) ( not ( = ?auto_159153 ?auto_159156 ) ) ( not ( = ?auto_159153 ?auto_159157 ) ) ( not ( = ?auto_159153 ?auto_159158 ) ) ( not ( = ?auto_159154 ?auto_159155 ) ) ( not ( = ?auto_159154 ?auto_159156 ) ) ( not ( = ?auto_159154 ?auto_159157 ) ) ( not ( = ?auto_159154 ?auto_159158 ) ) ( not ( = ?auto_159155 ?auto_159156 ) ) ( not ( = ?auto_159155 ?auto_159157 ) ) ( not ( = ?auto_159155 ?auto_159158 ) ) ( not ( = ?auto_159156 ?auto_159157 ) ) ( not ( = ?auto_159156 ?auto_159158 ) ) ( not ( = ?auto_159157 ?auto_159158 ) ) )
    :subtasks
    ( ( !STACK ?auto_159158 ?auto_159157 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159159 - BLOCK
      ?auto_159160 - BLOCK
      ?auto_159161 - BLOCK
      ?auto_159162 - BLOCK
      ?auto_159163 - BLOCK
      ?auto_159164 - BLOCK
      ?auto_159165 - BLOCK
      ?auto_159166 - BLOCK
    )
    :vars
    (
      ?auto_159167 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_159165 ) ( ON-TABLE ?auto_159159 ) ( ON ?auto_159160 ?auto_159159 ) ( ON ?auto_159161 ?auto_159160 ) ( ON ?auto_159162 ?auto_159161 ) ( ON ?auto_159163 ?auto_159162 ) ( ON ?auto_159164 ?auto_159163 ) ( ON ?auto_159165 ?auto_159164 ) ( not ( = ?auto_159159 ?auto_159160 ) ) ( not ( = ?auto_159159 ?auto_159161 ) ) ( not ( = ?auto_159159 ?auto_159162 ) ) ( not ( = ?auto_159159 ?auto_159163 ) ) ( not ( = ?auto_159159 ?auto_159164 ) ) ( not ( = ?auto_159159 ?auto_159165 ) ) ( not ( = ?auto_159159 ?auto_159166 ) ) ( not ( = ?auto_159160 ?auto_159161 ) ) ( not ( = ?auto_159160 ?auto_159162 ) ) ( not ( = ?auto_159160 ?auto_159163 ) ) ( not ( = ?auto_159160 ?auto_159164 ) ) ( not ( = ?auto_159160 ?auto_159165 ) ) ( not ( = ?auto_159160 ?auto_159166 ) ) ( not ( = ?auto_159161 ?auto_159162 ) ) ( not ( = ?auto_159161 ?auto_159163 ) ) ( not ( = ?auto_159161 ?auto_159164 ) ) ( not ( = ?auto_159161 ?auto_159165 ) ) ( not ( = ?auto_159161 ?auto_159166 ) ) ( not ( = ?auto_159162 ?auto_159163 ) ) ( not ( = ?auto_159162 ?auto_159164 ) ) ( not ( = ?auto_159162 ?auto_159165 ) ) ( not ( = ?auto_159162 ?auto_159166 ) ) ( not ( = ?auto_159163 ?auto_159164 ) ) ( not ( = ?auto_159163 ?auto_159165 ) ) ( not ( = ?auto_159163 ?auto_159166 ) ) ( not ( = ?auto_159164 ?auto_159165 ) ) ( not ( = ?auto_159164 ?auto_159166 ) ) ( not ( = ?auto_159165 ?auto_159166 ) ) ( ON ?auto_159166 ?auto_159167 ) ( CLEAR ?auto_159166 ) ( HAND-EMPTY ) ( not ( = ?auto_159159 ?auto_159167 ) ) ( not ( = ?auto_159160 ?auto_159167 ) ) ( not ( = ?auto_159161 ?auto_159167 ) ) ( not ( = ?auto_159162 ?auto_159167 ) ) ( not ( = ?auto_159163 ?auto_159167 ) ) ( not ( = ?auto_159164 ?auto_159167 ) ) ( not ( = ?auto_159165 ?auto_159167 ) ) ( not ( = ?auto_159166 ?auto_159167 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_159166 ?auto_159167 )
      ( MAKE-8PILE ?auto_159159 ?auto_159160 ?auto_159161 ?auto_159162 ?auto_159163 ?auto_159164 ?auto_159165 ?auto_159166 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159168 - BLOCK
      ?auto_159169 - BLOCK
      ?auto_159170 - BLOCK
      ?auto_159171 - BLOCK
      ?auto_159172 - BLOCK
      ?auto_159173 - BLOCK
      ?auto_159174 - BLOCK
      ?auto_159175 - BLOCK
    )
    :vars
    (
      ?auto_159176 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159168 ) ( ON ?auto_159169 ?auto_159168 ) ( ON ?auto_159170 ?auto_159169 ) ( ON ?auto_159171 ?auto_159170 ) ( ON ?auto_159172 ?auto_159171 ) ( ON ?auto_159173 ?auto_159172 ) ( not ( = ?auto_159168 ?auto_159169 ) ) ( not ( = ?auto_159168 ?auto_159170 ) ) ( not ( = ?auto_159168 ?auto_159171 ) ) ( not ( = ?auto_159168 ?auto_159172 ) ) ( not ( = ?auto_159168 ?auto_159173 ) ) ( not ( = ?auto_159168 ?auto_159174 ) ) ( not ( = ?auto_159168 ?auto_159175 ) ) ( not ( = ?auto_159169 ?auto_159170 ) ) ( not ( = ?auto_159169 ?auto_159171 ) ) ( not ( = ?auto_159169 ?auto_159172 ) ) ( not ( = ?auto_159169 ?auto_159173 ) ) ( not ( = ?auto_159169 ?auto_159174 ) ) ( not ( = ?auto_159169 ?auto_159175 ) ) ( not ( = ?auto_159170 ?auto_159171 ) ) ( not ( = ?auto_159170 ?auto_159172 ) ) ( not ( = ?auto_159170 ?auto_159173 ) ) ( not ( = ?auto_159170 ?auto_159174 ) ) ( not ( = ?auto_159170 ?auto_159175 ) ) ( not ( = ?auto_159171 ?auto_159172 ) ) ( not ( = ?auto_159171 ?auto_159173 ) ) ( not ( = ?auto_159171 ?auto_159174 ) ) ( not ( = ?auto_159171 ?auto_159175 ) ) ( not ( = ?auto_159172 ?auto_159173 ) ) ( not ( = ?auto_159172 ?auto_159174 ) ) ( not ( = ?auto_159172 ?auto_159175 ) ) ( not ( = ?auto_159173 ?auto_159174 ) ) ( not ( = ?auto_159173 ?auto_159175 ) ) ( not ( = ?auto_159174 ?auto_159175 ) ) ( ON ?auto_159175 ?auto_159176 ) ( CLEAR ?auto_159175 ) ( not ( = ?auto_159168 ?auto_159176 ) ) ( not ( = ?auto_159169 ?auto_159176 ) ) ( not ( = ?auto_159170 ?auto_159176 ) ) ( not ( = ?auto_159171 ?auto_159176 ) ) ( not ( = ?auto_159172 ?auto_159176 ) ) ( not ( = ?auto_159173 ?auto_159176 ) ) ( not ( = ?auto_159174 ?auto_159176 ) ) ( not ( = ?auto_159175 ?auto_159176 ) ) ( HOLDING ?auto_159174 ) ( CLEAR ?auto_159173 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_159168 ?auto_159169 ?auto_159170 ?auto_159171 ?auto_159172 ?auto_159173 ?auto_159174 )
      ( MAKE-8PILE ?auto_159168 ?auto_159169 ?auto_159170 ?auto_159171 ?auto_159172 ?auto_159173 ?auto_159174 ?auto_159175 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159177 - BLOCK
      ?auto_159178 - BLOCK
      ?auto_159179 - BLOCK
      ?auto_159180 - BLOCK
      ?auto_159181 - BLOCK
      ?auto_159182 - BLOCK
      ?auto_159183 - BLOCK
      ?auto_159184 - BLOCK
    )
    :vars
    (
      ?auto_159185 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159177 ) ( ON ?auto_159178 ?auto_159177 ) ( ON ?auto_159179 ?auto_159178 ) ( ON ?auto_159180 ?auto_159179 ) ( ON ?auto_159181 ?auto_159180 ) ( ON ?auto_159182 ?auto_159181 ) ( not ( = ?auto_159177 ?auto_159178 ) ) ( not ( = ?auto_159177 ?auto_159179 ) ) ( not ( = ?auto_159177 ?auto_159180 ) ) ( not ( = ?auto_159177 ?auto_159181 ) ) ( not ( = ?auto_159177 ?auto_159182 ) ) ( not ( = ?auto_159177 ?auto_159183 ) ) ( not ( = ?auto_159177 ?auto_159184 ) ) ( not ( = ?auto_159178 ?auto_159179 ) ) ( not ( = ?auto_159178 ?auto_159180 ) ) ( not ( = ?auto_159178 ?auto_159181 ) ) ( not ( = ?auto_159178 ?auto_159182 ) ) ( not ( = ?auto_159178 ?auto_159183 ) ) ( not ( = ?auto_159178 ?auto_159184 ) ) ( not ( = ?auto_159179 ?auto_159180 ) ) ( not ( = ?auto_159179 ?auto_159181 ) ) ( not ( = ?auto_159179 ?auto_159182 ) ) ( not ( = ?auto_159179 ?auto_159183 ) ) ( not ( = ?auto_159179 ?auto_159184 ) ) ( not ( = ?auto_159180 ?auto_159181 ) ) ( not ( = ?auto_159180 ?auto_159182 ) ) ( not ( = ?auto_159180 ?auto_159183 ) ) ( not ( = ?auto_159180 ?auto_159184 ) ) ( not ( = ?auto_159181 ?auto_159182 ) ) ( not ( = ?auto_159181 ?auto_159183 ) ) ( not ( = ?auto_159181 ?auto_159184 ) ) ( not ( = ?auto_159182 ?auto_159183 ) ) ( not ( = ?auto_159182 ?auto_159184 ) ) ( not ( = ?auto_159183 ?auto_159184 ) ) ( ON ?auto_159184 ?auto_159185 ) ( not ( = ?auto_159177 ?auto_159185 ) ) ( not ( = ?auto_159178 ?auto_159185 ) ) ( not ( = ?auto_159179 ?auto_159185 ) ) ( not ( = ?auto_159180 ?auto_159185 ) ) ( not ( = ?auto_159181 ?auto_159185 ) ) ( not ( = ?auto_159182 ?auto_159185 ) ) ( not ( = ?auto_159183 ?auto_159185 ) ) ( not ( = ?auto_159184 ?auto_159185 ) ) ( CLEAR ?auto_159182 ) ( ON ?auto_159183 ?auto_159184 ) ( CLEAR ?auto_159183 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_159185 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_159185 ?auto_159184 )
      ( MAKE-8PILE ?auto_159177 ?auto_159178 ?auto_159179 ?auto_159180 ?auto_159181 ?auto_159182 ?auto_159183 ?auto_159184 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159186 - BLOCK
      ?auto_159187 - BLOCK
      ?auto_159188 - BLOCK
      ?auto_159189 - BLOCK
      ?auto_159190 - BLOCK
      ?auto_159191 - BLOCK
      ?auto_159192 - BLOCK
      ?auto_159193 - BLOCK
    )
    :vars
    (
      ?auto_159194 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159186 ) ( ON ?auto_159187 ?auto_159186 ) ( ON ?auto_159188 ?auto_159187 ) ( ON ?auto_159189 ?auto_159188 ) ( ON ?auto_159190 ?auto_159189 ) ( not ( = ?auto_159186 ?auto_159187 ) ) ( not ( = ?auto_159186 ?auto_159188 ) ) ( not ( = ?auto_159186 ?auto_159189 ) ) ( not ( = ?auto_159186 ?auto_159190 ) ) ( not ( = ?auto_159186 ?auto_159191 ) ) ( not ( = ?auto_159186 ?auto_159192 ) ) ( not ( = ?auto_159186 ?auto_159193 ) ) ( not ( = ?auto_159187 ?auto_159188 ) ) ( not ( = ?auto_159187 ?auto_159189 ) ) ( not ( = ?auto_159187 ?auto_159190 ) ) ( not ( = ?auto_159187 ?auto_159191 ) ) ( not ( = ?auto_159187 ?auto_159192 ) ) ( not ( = ?auto_159187 ?auto_159193 ) ) ( not ( = ?auto_159188 ?auto_159189 ) ) ( not ( = ?auto_159188 ?auto_159190 ) ) ( not ( = ?auto_159188 ?auto_159191 ) ) ( not ( = ?auto_159188 ?auto_159192 ) ) ( not ( = ?auto_159188 ?auto_159193 ) ) ( not ( = ?auto_159189 ?auto_159190 ) ) ( not ( = ?auto_159189 ?auto_159191 ) ) ( not ( = ?auto_159189 ?auto_159192 ) ) ( not ( = ?auto_159189 ?auto_159193 ) ) ( not ( = ?auto_159190 ?auto_159191 ) ) ( not ( = ?auto_159190 ?auto_159192 ) ) ( not ( = ?auto_159190 ?auto_159193 ) ) ( not ( = ?auto_159191 ?auto_159192 ) ) ( not ( = ?auto_159191 ?auto_159193 ) ) ( not ( = ?auto_159192 ?auto_159193 ) ) ( ON ?auto_159193 ?auto_159194 ) ( not ( = ?auto_159186 ?auto_159194 ) ) ( not ( = ?auto_159187 ?auto_159194 ) ) ( not ( = ?auto_159188 ?auto_159194 ) ) ( not ( = ?auto_159189 ?auto_159194 ) ) ( not ( = ?auto_159190 ?auto_159194 ) ) ( not ( = ?auto_159191 ?auto_159194 ) ) ( not ( = ?auto_159192 ?auto_159194 ) ) ( not ( = ?auto_159193 ?auto_159194 ) ) ( ON ?auto_159192 ?auto_159193 ) ( CLEAR ?auto_159192 ) ( ON-TABLE ?auto_159194 ) ( HOLDING ?auto_159191 ) ( CLEAR ?auto_159190 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_159186 ?auto_159187 ?auto_159188 ?auto_159189 ?auto_159190 ?auto_159191 )
      ( MAKE-8PILE ?auto_159186 ?auto_159187 ?auto_159188 ?auto_159189 ?auto_159190 ?auto_159191 ?auto_159192 ?auto_159193 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159195 - BLOCK
      ?auto_159196 - BLOCK
      ?auto_159197 - BLOCK
      ?auto_159198 - BLOCK
      ?auto_159199 - BLOCK
      ?auto_159200 - BLOCK
      ?auto_159201 - BLOCK
      ?auto_159202 - BLOCK
    )
    :vars
    (
      ?auto_159203 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159195 ) ( ON ?auto_159196 ?auto_159195 ) ( ON ?auto_159197 ?auto_159196 ) ( ON ?auto_159198 ?auto_159197 ) ( ON ?auto_159199 ?auto_159198 ) ( not ( = ?auto_159195 ?auto_159196 ) ) ( not ( = ?auto_159195 ?auto_159197 ) ) ( not ( = ?auto_159195 ?auto_159198 ) ) ( not ( = ?auto_159195 ?auto_159199 ) ) ( not ( = ?auto_159195 ?auto_159200 ) ) ( not ( = ?auto_159195 ?auto_159201 ) ) ( not ( = ?auto_159195 ?auto_159202 ) ) ( not ( = ?auto_159196 ?auto_159197 ) ) ( not ( = ?auto_159196 ?auto_159198 ) ) ( not ( = ?auto_159196 ?auto_159199 ) ) ( not ( = ?auto_159196 ?auto_159200 ) ) ( not ( = ?auto_159196 ?auto_159201 ) ) ( not ( = ?auto_159196 ?auto_159202 ) ) ( not ( = ?auto_159197 ?auto_159198 ) ) ( not ( = ?auto_159197 ?auto_159199 ) ) ( not ( = ?auto_159197 ?auto_159200 ) ) ( not ( = ?auto_159197 ?auto_159201 ) ) ( not ( = ?auto_159197 ?auto_159202 ) ) ( not ( = ?auto_159198 ?auto_159199 ) ) ( not ( = ?auto_159198 ?auto_159200 ) ) ( not ( = ?auto_159198 ?auto_159201 ) ) ( not ( = ?auto_159198 ?auto_159202 ) ) ( not ( = ?auto_159199 ?auto_159200 ) ) ( not ( = ?auto_159199 ?auto_159201 ) ) ( not ( = ?auto_159199 ?auto_159202 ) ) ( not ( = ?auto_159200 ?auto_159201 ) ) ( not ( = ?auto_159200 ?auto_159202 ) ) ( not ( = ?auto_159201 ?auto_159202 ) ) ( ON ?auto_159202 ?auto_159203 ) ( not ( = ?auto_159195 ?auto_159203 ) ) ( not ( = ?auto_159196 ?auto_159203 ) ) ( not ( = ?auto_159197 ?auto_159203 ) ) ( not ( = ?auto_159198 ?auto_159203 ) ) ( not ( = ?auto_159199 ?auto_159203 ) ) ( not ( = ?auto_159200 ?auto_159203 ) ) ( not ( = ?auto_159201 ?auto_159203 ) ) ( not ( = ?auto_159202 ?auto_159203 ) ) ( ON ?auto_159201 ?auto_159202 ) ( ON-TABLE ?auto_159203 ) ( CLEAR ?auto_159199 ) ( ON ?auto_159200 ?auto_159201 ) ( CLEAR ?auto_159200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_159203 ?auto_159202 ?auto_159201 )
      ( MAKE-8PILE ?auto_159195 ?auto_159196 ?auto_159197 ?auto_159198 ?auto_159199 ?auto_159200 ?auto_159201 ?auto_159202 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159204 - BLOCK
      ?auto_159205 - BLOCK
      ?auto_159206 - BLOCK
      ?auto_159207 - BLOCK
      ?auto_159208 - BLOCK
      ?auto_159209 - BLOCK
      ?auto_159210 - BLOCK
      ?auto_159211 - BLOCK
    )
    :vars
    (
      ?auto_159212 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159204 ) ( ON ?auto_159205 ?auto_159204 ) ( ON ?auto_159206 ?auto_159205 ) ( ON ?auto_159207 ?auto_159206 ) ( not ( = ?auto_159204 ?auto_159205 ) ) ( not ( = ?auto_159204 ?auto_159206 ) ) ( not ( = ?auto_159204 ?auto_159207 ) ) ( not ( = ?auto_159204 ?auto_159208 ) ) ( not ( = ?auto_159204 ?auto_159209 ) ) ( not ( = ?auto_159204 ?auto_159210 ) ) ( not ( = ?auto_159204 ?auto_159211 ) ) ( not ( = ?auto_159205 ?auto_159206 ) ) ( not ( = ?auto_159205 ?auto_159207 ) ) ( not ( = ?auto_159205 ?auto_159208 ) ) ( not ( = ?auto_159205 ?auto_159209 ) ) ( not ( = ?auto_159205 ?auto_159210 ) ) ( not ( = ?auto_159205 ?auto_159211 ) ) ( not ( = ?auto_159206 ?auto_159207 ) ) ( not ( = ?auto_159206 ?auto_159208 ) ) ( not ( = ?auto_159206 ?auto_159209 ) ) ( not ( = ?auto_159206 ?auto_159210 ) ) ( not ( = ?auto_159206 ?auto_159211 ) ) ( not ( = ?auto_159207 ?auto_159208 ) ) ( not ( = ?auto_159207 ?auto_159209 ) ) ( not ( = ?auto_159207 ?auto_159210 ) ) ( not ( = ?auto_159207 ?auto_159211 ) ) ( not ( = ?auto_159208 ?auto_159209 ) ) ( not ( = ?auto_159208 ?auto_159210 ) ) ( not ( = ?auto_159208 ?auto_159211 ) ) ( not ( = ?auto_159209 ?auto_159210 ) ) ( not ( = ?auto_159209 ?auto_159211 ) ) ( not ( = ?auto_159210 ?auto_159211 ) ) ( ON ?auto_159211 ?auto_159212 ) ( not ( = ?auto_159204 ?auto_159212 ) ) ( not ( = ?auto_159205 ?auto_159212 ) ) ( not ( = ?auto_159206 ?auto_159212 ) ) ( not ( = ?auto_159207 ?auto_159212 ) ) ( not ( = ?auto_159208 ?auto_159212 ) ) ( not ( = ?auto_159209 ?auto_159212 ) ) ( not ( = ?auto_159210 ?auto_159212 ) ) ( not ( = ?auto_159211 ?auto_159212 ) ) ( ON ?auto_159210 ?auto_159211 ) ( ON-TABLE ?auto_159212 ) ( ON ?auto_159209 ?auto_159210 ) ( CLEAR ?auto_159209 ) ( HOLDING ?auto_159208 ) ( CLEAR ?auto_159207 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_159204 ?auto_159205 ?auto_159206 ?auto_159207 ?auto_159208 )
      ( MAKE-8PILE ?auto_159204 ?auto_159205 ?auto_159206 ?auto_159207 ?auto_159208 ?auto_159209 ?auto_159210 ?auto_159211 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159213 - BLOCK
      ?auto_159214 - BLOCK
      ?auto_159215 - BLOCK
      ?auto_159216 - BLOCK
      ?auto_159217 - BLOCK
      ?auto_159218 - BLOCK
      ?auto_159219 - BLOCK
      ?auto_159220 - BLOCK
    )
    :vars
    (
      ?auto_159221 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159213 ) ( ON ?auto_159214 ?auto_159213 ) ( ON ?auto_159215 ?auto_159214 ) ( ON ?auto_159216 ?auto_159215 ) ( not ( = ?auto_159213 ?auto_159214 ) ) ( not ( = ?auto_159213 ?auto_159215 ) ) ( not ( = ?auto_159213 ?auto_159216 ) ) ( not ( = ?auto_159213 ?auto_159217 ) ) ( not ( = ?auto_159213 ?auto_159218 ) ) ( not ( = ?auto_159213 ?auto_159219 ) ) ( not ( = ?auto_159213 ?auto_159220 ) ) ( not ( = ?auto_159214 ?auto_159215 ) ) ( not ( = ?auto_159214 ?auto_159216 ) ) ( not ( = ?auto_159214 ?auto_159217 ) ) ( not ( = ?auto_159214 ?auto_159218 ) ) ( not ( = ?auto_159214 ?auto_159219 ) ) ( not ( = ?auto_159214 ?auto_159220 ) ) ( not ( = ?auto_159215 ?auto_159216 ) ) ( not ( = ?auto_159215 ?auto_159217 ) ) ( not ( = ?auto_159215 ?auto_159218 ) ) ( not ( = ?auto_159215 ?auto_159219 ) ) ( not ( = ?auto_159215 ?auto_159220 ) ) ( not ( = ?auto_159216 ?auto_159217 ) ) ( not ( = ?auto_159216 ?auto_159218 ) ) ( not ( = ?auto_159216 ?auto_159219 ) ) ( not ( = ?auto_159216 ?auto_159220 ) ) ( not ( = ?auto_159217 ?auto_159218 ) ) ( not ( = ?auto_159217 ?auto_159219 ) ) ( not ( = ?auto_159217 ?auto_159220 ) ) ( not ( = ?auto_159218 ?auto_159219 ) ) ( not ( = ?auto_159218 ?auto_159220 ) ) ( not ( = ?auto_159219 ?auto_159220 ) ) ( ON ?auto_159220 ?auto_159221 ) ( not ( = ?auto_159213 ?auto_159221 ) ) ( not ( = ?auto_159214 ?auto_159221 ) ) ( not ( = ?auto_159215 ?auto_159221 ) ) ( not ( = ?auto_159216 ?auto_159221 ) ) ( not ( = ?auto_159217 ?auto_159221 ) ) ( not ( = ?auto_159218 ?auto_159221 ) ) ( not ( = ?auto_159219 ?auto_159221 ) ) ( not ( = ?auto_159220 ?auto_159221 ) ) ( ON ?auto_159219 ?auto_159220 ) ( ON-TABLE ?auto_159221 ) ( ON ?auto_159218 ?auto_159219 ) ( CLEAR ?auto_159216 ) ( ON ?auto_159217 ?auto_159218 ) ( CLEAR ?auto_159217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_159221 ?auto_159220 ?auto_159219 ?auto_159218 )
      ( MAKE-8PILE ?auto_159213 ?auto_159214 ?auto_159215 ?auto_159216 ?auto_159217 ?auto_159218 ?auto_159219 ?auto_159220 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159222 - BLOCK
      ?auto_159223 - BLOCK
      ?auto_159224 - BLOCK
      ?auto_159225 - BLOCK
      ?auto_159226 - BLOCK
      ?auto_159227 - BLOCK
      ?auto_159228 - BLOCK
      ?auto_159229 - BLOCK
    )
    :vars
    (
      ?auto_159230 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159222 ) ( ON ?auto_159223 ?auto_159222 ) ( ON ?auto_159224 ?auto_159223 ) ( not ( = ?auto_159222 ?auto_159223 ) ) ( not ( = ?auto_159222 ?auto_159224 ) ) ( not ( = ?auto_159222 ?auto_159225 ) ) ( not ( = ?auto_159222 ?auto_159226 ) ) ( not ( = ?auto_159222 ?auto_159227 ) ) ( not ( = ?auto_159222 ?auto_159228 ) ) ( not ( = ?auto_159222 ?auto_159229 ) ) ( not ( = ?auto_159223 ?auto_159224 ) ) ( not ( = ?auto_159223 ?auto_159225 ) ) ( not ( = ?auto_159223 ?auto_159226 ) ) ( not ( = ?auto_159223 ?auto_159227 ) ) ( not ( = ?auto_159223 ?auto_159228 ) ) ( not ( = ?auto_159223 ?auto_159229 ) ) ( not ( = ?auto_159224 ?auto_159225 ) ) ( not ( = ?auto_159224 ?auto_159226 ) ) ( not ( = ?auto_159224 ?auto_159227 ) ) ( not ( = ?auto_159224 ?auto_159228 ) ) ( not ( = ?auto_159224 ?auto_159229 ) ) ( not ( = ?auto_159225 ?auto_159226 ) ) ( not ( = ?auto_159225 ?auto_159227 ) ) ( not ( = ?auto_159225 ?auto_159228 ) ) ( not ( = ?auto_159225 ?auto_159229 ) ) ( not ( = ?auto_159226 ?auto_159227 ) ) ( not ( = ?auto_159226 ?auto_159228 ) ) ( not ( = ?auto_159226 ?auto_159229 ) ) ( not ( = ?auto_159227 ?auto_159228 ) ) ( not ( = ?auto_159227 ?auto_159229 ) ) ( not ( = ?auto_159228 ?auto_159229 ) ) ( ON ?auto_159229 ?auto_159230 ) ( not ( = ?auto_159222 ?auto_159230 ) ) ( not ( = ?auto_159223 ?auto_159230 ) ) ( not ( = ?auto_159224 ?auto_159230 ) ) ( not ( = ?auto_159225 ?auto_159230 ) ) ( not ( = ?auto_159226 ?auto_159230 ) ) ( not ( = ?auto_159227 ?auto_159230 ) ) ( not ( = ?auto_159228 ?auto_159230 ) ) ( not ( = ?auto_159229 ?auto_159230 ) ) ( ON ?auto_159228 ?auto_159229 ) ( ON-TABLE ?auto_159230 ) ( ON ?auto_159227 ?auto_159228 ) ( ON ?auto_159226 ?auto_159227 ) ( CLEAR ?auto_159226 ) ( HOLDING ?auto_159225 ) ( CLEAR ?auto_159224 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_159222 ?auto_159223 ?auto_159224 ?auto_159225 )
      ( MAKE-8PILE ?auto_159222 ?auto_159223 ?auto_159224 ?auto_159225 ?auto_159226 ?auto_159227 ?auto_159228 ?auto_159229 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159231 - BLOCK
      ?auto_159232 - BLOCK
      ?auto_159233 - BLOCK
      ?auto_159234 - BLOCK
      ?auto_159235 - BLOCK
      ?auto_159236 - BLOCK
      ?auto_159237 - BLOCK
      ?auto_159238 - BLOCK
    )
    :vars
    (
      ?auto_159239 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159231 ) ( ON ?auto_159232 ?auto_159231 ) ( ON ?auto_159233 ?auto_159232 ) ( not ( = ?auto_159231 ?auto_159232 ) ) ( not ( = ?auto_159231 ?auto_159233 ) ) ( not ( = ?auto_159231 ?auto_159234 ) ) ( not ( = ?auto_159231 ?auto_159235 ) ) ( not ( = ?auto_159231 ?auto_159236 ) ) ( not ( = ?auto_159231 ?auto_159237 ) ) ( not ( = ?auto_159231 ?auto_159238 ) ) ( not ( = ?auto_159232 ?auto_159233 ) ) ( not ( = ?auto_159232 ?auto_159234 ) ) ( not ( = ?auto_159232 ?auto_159235 ) ) ( not ( = ?auto_159232 ?auto_159236 ) ) ( not ( = ?auto_159232 ?auto_159237 ) ) ( not ( = ?auto_159232 ?auto_159238 ) ) ( not ( = ?auto_159233 ?auto_159234 ) ) ( not ( = ?auto_159233 ?auto_159235 ) ) ( not ( = ?auto_159233 ?auto_159236 ) ) ( not ( = ?auto_159233 ?auto_159237 ) ) ( not ( = ?auto_159233 ?auto_159238 ) ) ( not ( = ?auto_159234 ?auto_159235 ) ) ( not ( = ?auto_159234 ?auto_159236 ) ) ( not ( = ?auto_159234 ?auto_159237 ) ) ( not ( = ?auto_159234 ?auto_159238 ) ) ( not ( = ?auto_159235 ?auto_159236 ) ) ( not ( = ?auto_159235 ?auto_159237 ) ) ( not ( = ?auto_159235 ?auto_159238 ) ) ( not ( = ?auto_159236 ?auto_159237 ) ) ( not ( = ?auto_159236 ?auto_159238 ) ) ( not ( = ?auto_159237 ?auto_159238 ) ) ( ON ?auto_159238 ?auto_159239 ) ( not ( = ?auto_159231 ?auto_159239 ) ) ( not ( = ?auto_159232 ?auto_159239 ) ) ( not ( = ?auto_159233 ?auto_159239 ) ) ( not ( = ?auto_159234 ?auto_159239 ) ) ( not ( = ?auto_159235 ?auto_159239 ) ) ( not ( = ?auto_159236 ?auto_159239 ) ) ( not ( = ?auto_159237 ?auto_159239 ) ) ( not ( = ?auto_159238 ?auto_159239 ) ) ( ON ?auto_159237 ?auto_159238 ) ( ON-TABLE ?auto_159239 ) ( ON ?auto_159236 ?auto_159237 ) ( ON ?auto_159235 ?auto_159236 ) ( CLEAR ?auto_159233 ) ( ON ?auto_159234 ?auto_159235 ) ( CLEAR ?auto_159234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_159239 ?auto_159238 ?auto_159237 ?auto_159236 ?auto_159235 )
      ( MAKE-8PILE ?auto_159231 ?auto_159232 ?auto_159233 ?auto_159234 ?auto_159235 ?auto_159236 ?auto_159237 ?auto_159238 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159240 - BLOCK
      ?auto_159241 - BLOCK
      ?auto_159242 - BLOCK
      ?auto_159243 - BLOCK
      ?auto_159244 - BLOCK
      ?auto_159245 - BLOCK
      ?auto_159246 - BLOCK
      ?auto_159247 - BLOCK
    )
    :vars
    (
      ?auto_159248 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159240 ) ( ON ?auto_159241 ?auto_159240 ) ( not ( = ?auto_159240 ?auto_159241 ) ) ( not ( = ?auto_159240 ?auto_159242 ) ) ( not ( = ?auto_159240 ?auto_159243 ) ) ( not ( = ?auto_159240 ?auto_159244 ) ) ( not ( = ?auto_159240 ?auto_159245 ) ) ( not ( = ?auto_159240 ?auto_159246 ) ) ( not ( = ?auto_159240 ?auto_159247 ) ) ( not ( = ?auto_159241 ?auto_159242 ) ) ( not ( = ?auto_159241 ?auto_159243 ) ) ( not ( = ?auto_159241 ?auto_159244 ) ) ( not ( = ?auto_159241 ?auto_159245 ) ) ( not ( = ?auto_159241 ?auto_159246 ) ) ( not ( = ?auto_159241 ?auto_159247 ) ) ( not ( = ?auto_159242 ?auto_159243 ) ) ( not ( = ?auto_159242 ?auto_159244 ) ) ( not ( = ?auto_159242 ?auto_159245 ) ) ( not ( = ?auto_159242 ?auto_159246 ) ) ( not ( = ?auto_159242 ?auto_159247 ) ) ( not ( = ?auto_159243 ?auto_159244 ) ) ( not ( = ?auto_159243 ?auto_159245 ) ) ( not ( = ?auto_159243 ?auto_159246 ) ) ( not ( = ?auto_159243 ?auto_159247 ) ) ( not ( = ?auto_159244 ?auto_159245 ) ) ( not ( = ?auto_159244 ?auto_159246 ) ) ( not ( = ?auto_159244 ?auto_159247 ) ) ( not ( = ?auto_159245 ?auto_159246 ) ) ( not ( = ?auto_159245 ?auto_159247 ) ) ( not ( = ?auto_159246 ?auto_159247 ) ) ( ON ?auto_159247 ?auto_159248 ) ( not ( = ?auto_159240 ?auto_159248 ) ) ( not ( = ?auto_159241 ?auto_159248 ) ) ( not ( = ?auto_159242 ?auto_159248 ) ) ( not ( = ?auto_159243 ?auto_159248 ) ) ( not ( = ?auto_159244 ?auto_159248 ) ) ( not ( = ?auto_159245 ?auto_159248 ) ) ( not ( = ?auto_159246 ?auto_159248 ) ) ( not ( = ?auto_159247 ?auto_159248 ) ) ( ON ?auto_159246 ?auto_159247 ) ( ON-TABLE ?auto_159248 ) ( ON ?auto_159245 ?auto_159246 ) ( ON ?auto_159244 ?auto_159245 ) ( ON ?auto_159243 ?auto_159244 ) ( CLEAR ?auto_159243 ) ( HOLDING ?auto_159242 ) ( CLEAR ?auto_159241 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_159240 ?auto_159241 ?auto_159242 )
      ( MAKE-8PILE ?auto_159240 ?auto_159241 ?auto_159242 ?auto_159243 ?auto_159244 ?auto_159245 ?auto_159246 ?auto_159247 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159249 - BLOCK
      ?auto_159250 - BLOCK
      ?auto_159251 - BLOCK
      ?auto_159252 - BLOCK
      ?auto_159253 - BLOCK
      ?auto_159254 - BLOCK
      ?auto_159255 - BLOCK
      ?auto_159256 - BLOCK
    )
    :vars
    (
      ?auto_159257 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159249 ) ( ON ?auto_159250 ?auto_159249 ) ( not ( = ?auto_159249 ?auto_159250 ) ) ( not ( = ?auto_159249 ?auto_159251 ) ) ( not ( = ?auto_159249 ?auto_159252 ) ) ( not ( = ?auto_159249 ?auto_159253 ) ) ( not ( = ?auto_159249 ?auto_159254 ) ) ( not ( = ?auto_159249 ?auto_159255 ) ) ( not ( = ?auto_159249 ?auto_159256 ) ) ( not ( = ?auto_159250 ?auto_159251 ) ) ( not ( = ?auto_159250 ?auto_159252 ) ) ( not ( = ?auto_159250 ?auto_159253 ) ) ( not ( = ?auto_159250 ?auto_159254 ) ) ( not ( = ?auto_159250 ?auto_159255 ) ) ( not ( = ?auto_159250 ?auto_159256 ) ) ( not ( = ?auto_159251 ?auto_159252 ) ) ( not ( = ?auto_159251 ?auto_159253 ) ) ( not ( = ?auto_159251 ?auto_159254 ) ) ( not ( = ?auto_159251 ?auto_159255 ) ) ( not ( = ?auto_159251 ?auto_159256 ) ) ( not ( = ?auto_159252 ?auto_159253 ) ) ( not ( = ?auto_159252 ?auto_159254 ) ) ( not ( = ?auto_159252 ?auto_159255 ) ) ( not ( = ?auto_159252 ?auto_159256 ) ) ( not ( = ?auto_159253 ?auto_159254 ) ) ( not ( = ?auto_159253 ?auto_159255 ) ) ( not ( = ?auto_159253 ?auto_159256 ) ) ( not ( = ?auto_159254 ?auto_159255 ) ) ( not ( = ?auto_159254 ?auto_159256 ) ) ( not ( = ?auto_159255 ?auto_159256 ) ) ( ON ?auto_159256 ?auto_159257 ) ( not ( = ?auto_159249 ?auto_159257 ) ) ( not ( = ?auto_159250 ?auto_159257 ) ) ( not ( = ?auto_159251 ?auto_159257 ) ) ( not ( = ?auto_159252 ?auto_159257 ) ) ( not ( = ?auto_159253 ?auto_159257 ) ) ( not ( = ?auto_159254 ?auto_159257 ) ) ( not ( = ?auto_159255 ?auto_159257 ) ) ( not ( = ?auto_159256 ?auto_159257 ) ) ( ON ?auto_159255 ?auto_159256 ) ( ON-TABLE ?auto_159257 ) ( ON ?auto_159254 ?auto_159255 ) ( ON ?auto_159253 ?auto_159254 ) ( ON ?auto_159252 ?auto_159253 ) ( CLEAR ?auto_159250 ) ( ON ?auto_159251 ?auto_159252 ) ( CLEAR ?auto_159251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_159257 ?auto_159256 ?auto_159255 ?auto_159254 ?auto_159253 ?auto_159252 )
      ( MAKE-8PILE ?auto_159249 ?auto_159250 ?auto_159251 ?auto_159252 ?auto_159253 ?auto_159254 ?auto_159255 ?auto_159256 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159258 - BLOCK
      ?auto_159259 - BLOCK
      ?auto_159260 - BLOCK
      ?auto_159261 - BLOCK
      ?auto_159262 - BLOCK
      ?auto_159263 - BLOCK
      ?auto_159264 - BLOCK
      ?auto_159265 - BLOCK
    )
    :vars
    (
      ?auto_159266 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159258 ) ( not ( = ?auto_159258 ?auto_159259 ) ) ( not ( = ?auto_159258 ?auto_159260 ) ) ( not ( = ?auto_159258 ?auto_159261 ) ) ( not ( = ?auto_159258 ?auto_159262 ) ) ( not ( = ?auto_159258 ?auto_159263 ) ) ( not ( = ?auto_159258 ?auto_159264 ) ) ( not ( = ?auto_159258 ?auto_159265 ) ) ( not ( = ?auto_159259 ?auto_159260 ) ) ( not ( = ?auto_159259 ?auto_159261 ) ) ( not ( = ?auto_159259 ?auto_159262 ) ) ( not ( = ?auto_159259 ?auto_159263 ) ) ( not ( = ?auto_159259 ?auto_159264 ) ) ( not ( = ?auto_159259 ?auto_159265 ) ) ( not ( = ?auto_159260 ?auto_159261 ) ) ( not ( = ?auto_159260 ?auto_159262 ) ) ( not ( = ?auto_159260 ?auto_159263 ) ) ( not ( = ?auto_159260 ?auto_159264 ) ) ( not ( = ?auto_159260 ?auto_159265 ) ) ( not ( = ?auto_159261 ?auto_159262 ) ) ( not ( = ?auto_159261 ?auto_159263 ) ) ( not ( = ?auto_159261 ?auto_159264 ) ) ( not ( = ?auto_159261 ?auto_159265 ) ) ( not ( = ?auto_159262 ?auto_159263 ) ) ( not ( = ?auto_159262 ?auto_159264 ) ) ( not ( = ?auto_159262 ?auto_159265 ) ) ( not ( = ?auto_159263 ?auto_159264 ) ) ( not ( = ?auto_159263 ?auto_159265 ) ) ( not ( = ?auto_159264 ?auto_159265 ) ) ( ON ?auto_159265 ?auto_159266 ) ( not ( = ?auto_159258 ?auto_159266 ) ) ( not ( = ?auto_159259 ?auto_159266 ) ) ( not ( = ?auto_159260 ?auto_159266 ) ) ( not ( = ?auto_159261 ?auto_159266 ) ) ( not ( = ?auto_159262 ?auto_159266 ) ) ( not ( = ?auto_159263 ?auto_159266 ) ) ( not ( = ?auto_159264 ?auto_159266 ) ) ( not ( = ?auto_159265 ?auto_159266 ) ) ( ON ?auto_159264 ?auto_159265 ) ( ON-TABLE ?auto_159266 ) ( ON ?auto_159263 ?auto_159264 ) ( ON ?auto_159262 ?auto_159263 ) ( ON ?auto_159261 ?auto_159262 ) ( ON ?auto_159260 ?auto_159261 ) ( CLEAR ?auto_159260 ) ( HOLDING ?auto_159259 ) ( CLEAR ?auto_159258 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_159258 ?auto_159259 )
      ( MAKE-8PILE ?auto_159258 ?auto_159259 ?auto_159260 ?auto_159261 ?auto_159262 ?auto_159263 ?auto_159264 ?auto_159265 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159267 - BLOCK
      ?auto_159268 - BLOCK
      ?auto_159269 - BLOCK
      ?auto_159270 - BLOCK
      ?auto_159271 - BLOCK
      ?auto_159272 - BLOCK
      ?auto_159273 - BLOCK
      ?auto_159274 - BLOCK
    )
    :vars
    (
      ?auto_159275 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159267 ) ( not ( = ?auto_159267 ?auto_159268 ) ) ( not ( = ?auto_159267 ?auto_159269 ) ) ( not ( = ?auto_159267 ?auto_159270 ) ) ( not ( = ?auto_159267 ?auto_159271 ) ) ( not ( = ?auto_159267 ?auto_159272 ) ) ( not ( = ?auto_159267 ?auto_159273 ) ) ( not ( = ?auto_159267 ?auto_159274 ) ) ( not ( = ?auto_159268 ?auto_159269 ) ) ( not ( = ?auto_159268 ?auto_159270 ) ) ( not ( = ?auto_159268 ?auto_159271 ) ) ( not ( = ?auto_159268 ?auto_159272 ) ) ( not ( = ?auto_159268 ?auto_159273 ) ) ( not ( = ?auto_159268 ?auto_159274 ) ) ( not ( = ?auto_159269 ?auto_159270 ) ) ( not ( = ?auto_159269 ?auto_159271 ) ) ( not ( = ?auto_159269 ?auto_159272 ) ) ( not ( = ?auto_159269 ?auto_159273 ) ) ( not ( = ?auto_159269 ?auto_159274 ) ) ( not ( = ?auto_159270 ?auto_159271 ) ) ( not ( = ?auto_159270 ?auto_159272 ) ) ( not ( = ?auto_159270 ?auto_159273 ) ) ( not ( = ?auto_159270 ?auto_159274 ) ) ( not ( = ?auto_159271 ?auto_159272 ) ) ( not ( = ?auto_159271 ?auto_159273 ) ) ( not ( = ?auto_159271 ?auto_159274 ) ) ( not ( = ?auto_159272 ?auto_159273 ) ) ( not ( = ?auto_159272 ?auto_159274 ) ) ( not ( = ?auto_159273 ?auto_159274 ) ) ( ON ?auto_159274 ?auto_159275 ) ( not ( = ?auto_159267 ?auto_159275 ) ) ( not ( = ?auto_159268 ?auto_159275 ) ) ( not ( = ?auto_159269 ?auto_159275 ) ) ( not ( = ?auto_159270 ?auto_159275 ) ) ( not ( = ?auto_159271 ?auto_159275 ) ) ( not ( = ?auto_159272 ?auto_159275 ) ) ( not ( = ?auto_159273 ?auto_159275 ) ) ( not ( = ?auto_159274 ?auto_159275 ) ) ( ON ?auto_159273 ?auto_159274 ) ( ON-TABLE ?auto_159275 ) ( ON ?auto_159272 ?auto_159273 ) ( ON ?auto_159271 ?auto_159272 ) ( ON ?auto_159270 ?auto_159271 ) ( ON ?auto_159269 ?auto_159270 ) ( CLEAR ?auto_159267 ) ( ON ?auto_159268 ?auto_159269 ) ( CLEAR ?auto_159268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_159275 ?auto_159274 ?auto_159273 ?auto_159272 ?auto_159271 ?auto_159270 ?auto_159269 )
      ( MAKE-8PILE ?auto_159267 ?auto_159268 ?auto_159269 ?auto_159270 ?auto_159271 ?auto_159272 ?auto_159273 ?auto_159274 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159276 - BLOCK
      ?auto_159277 - BLOCK
      ?auto_159278 - BLOCK
      ?auto_159279 - BLOCK
      ?auto_159280 - BLOCK
      ?auto_159281 - BLOCK
      ?auto_159282 - BLOCK
      ?auto_159283 - BLOCK
    )
    :vars
    (
      ?auto_159284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159276 ?auto_159277 ) ) ( not ( = ?auto_159276 ?auto_159278 ) ) ( not ( = ?auto_159276 ?auto_159279 ) ) ( not ( = ?auto_159276 ?auto_159280 ) ) ( not ( = ?auto_159276 ?auto_159281 ) ) ( not ( = ?auto_159276 ?auto_159282 ) ) ( not ( = ?auto_159276 ?auto_159283 ) ) ( not ( = ?auto_159277 ?auto_159278 ) ) ( not ( = ?auto_159277 ?auto_159279 ) ) ( not ( = ?auto_159277 ?auto_159280 ) ) ( not ( = ?auto_159277 ?auto_159281 ) ) ( not ( = ?auto_159277 ?auto_159282 ) ) ( not ( = ?auto_159277 ?auto_159283 ) ) ( not ( = ?auto_159278 ?auto_159279 ) ) ( not ( = ?auto_159278 ?auto_159280 ) ) ( not ( = ?auto_159278 ?auto_159281 ) ) ( not ( = ?auto_159278 ?auto_159282 ) ) ( not ( = ?auto_159278 ?auto_159283 ) ) ( not ( = ?auto_159279 ?auto_159280 ) ) ( not ( = ?auto_159279 ?auto_159281 ) ) ( not ( = ?auto_159279 ?auto_159282 ) ) ( not ( = ?auto_159279 ?auto_159283 ) ) ( not ( = ?auto_159280 ?auto_159281 ) ) ( not ( = ?auto_159280 ?auto_159282 ) ) ( not ( = ?auto_159280 ?auto_159283 ) ) ( not ( = ?auto_159281 ?auto_159282 ) ) ( not ( = ?auto_159281 ?auto_159283 ) ) ( not ( = ?auto_159282 ?auto_159283 ) ) ( ON ?auto_159283 ?auto_159284 ) ( not ( = ?auto_159276 ?auto_159284 ) ) ( not ( = ?auto_159277 ?auto_159284 ) ) ( not ( = ?auto_159278 ?auto_159284 ) ) ( not ( = ?auto_159279 ?auto_159284 ) ) ( not ( = ?auto_159280 ?auto_159284 ) ) ( not ( = ?auto_159281 ?auto_159284 ) ) ( not ( = ?auto_159282 ?auto_159284 ) ) ( not ( = ?auto_159283 ?auto_159284 ) ) ( ON ?auto_159282 ?auto_159283 ) ( ON-TABLE ?auto_159284 ) ( ON ?auto_159281 ?auto_159282 ) ( ON ?auto_159280 ?auto_159281 ) ( ON ?auto_159279 ?auto_159280 ) ( ON ?auto_159278 ?auto_159279 ) ( ON ?auto_159277 ?auto_159278 ) ( CLEAR ?auto_159277 ) ( HOLDING ?auto_159276 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_159276 )
      ( MAKE-8PILE ?auto_159276 ?auto_159277 ?auto_159278 ?auto_159279 ?auto_159280 ?auto_159281 ?auto_159282 ?auto_159283 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159285 - BLOCK
      ?auto_159286 - BLOCK
      ?auto_159287 - BLOCK
      ?auto_159288 - BLOCK
      ?auto_159289 - BLOCK
      ?auto_159290 - BLOCK
      ?auto_159291 - BLOCK
      ?auto_159292 - BLOCK
    )
    :vars
    (
      ?auto_159293 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159285 ?auto_159286 ) ) ( not ( = ?auto_159285 ?auto_159287 ) ) ( not ( = ?auto_159285 ?auto_159288 ) ) ( not ( = ?auto_159285 ?auto_159289 ) ) ( not ( = ?auto_159285 ?auto_159290 ) ) ( not ( = ?auto_159285 ?auto_159291 ) ) ( not ( = ?auto_159285 ?auto_159292 ) ) ( not ( = ?auto_159286 ?auto_159287 ) ) ( not ( = ?auto_159286 ?auto_159288 ) ) ( not ( = ?auto_159286 ?auto_159289 ) ) ( not ( = ?auto_159286 ?auto_159290 ) ) ( not ( = ?auto_159286 ?auto_159291 ) ) ( not ( = ?auto_159286 ?auto_159292 ) ) ( not ( = ?auto_159287 ?auto_159288 ) ) ( not ( = ?auto_159287 ?auto_159289 ) ) ( not ( = ?auto_159287 ?auto_159290 ) ) ( not ( = ?auto_159287 ?auto_159291 ) ) ( not ( = ?auto_159287 ?auto_159292 ) ) ( not ( = ?auto_159288 ?auto_159289 ) ) ( not ( = ?auto_159288 ?auto_159290 ) ) ( not ( = ?auto_159288 ?auto_159291 ) ) ( not ( = ?auto_159288 ?auto_159292 ) ) ( not ( = ?auto_159289 ?auto_159290 ) ) ( not ( = ?auto_159289 ?auto_159291 ) ) ( not ( = ?auto_159289 ?auto_159292 ) ) ( not ( = ?auto_159290 ?auto_159291 ) ) ( not ( = ?auto_159290 ?auto_159292 ) ) ( not ( = ?auto_159291 ?auto_159292 ) ) ( ON ?auto_159292 ?auto_159293 ) ( not ( = ?auto_159285 ?auto_159293 ) ) ( not ( = ?auto_159286 ?auto_159293 ) ) ( not ( = ?auto_159287 ?auto_159293 ) ) ( not ( = ?auto_159288 ?auto_159293 ) ) ( not ( = ?auto_159289 ?auto_159293 ) ) ( not ( = ?auto_159290 ?auto_159293 ) ) ( not ( = ?auto_159291 ?auto_159293 ) ) ( not ( = ?auto_159292 ?auto_159293 ) ) ( ON ?auto_159291 ?auto_159292 ) ( ON-TABLE ?auto_159293 ) ( ON ?auto_159290 ?auto_159291 ) ( ON ?auto_159289 ?auto_159290 ) ( ON ?auto_159288 ?auto_159289 ) ( ON ?auto_159287 ?auto_159288 ) ( ON ?auto_159286 ?auto_159287 ) ( ON ?auto_159285 ?auto_159286 ) ( CLEAR ?auto_159285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_159293 ?auto_159292 ?auto_159291 ?auto_159290 ?auto_159289 ?auto_159288 ?auto_159287 ?auto_159286 )
      ( MAKE-8PILE ?auto_159285 ?auto_159286 ?auto_159287 ?auto_159288 ?auto_159289 ?auto_159290 ?auto_159291 ?auto_159292 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159430 - BLOCK
    )
    :vars
    (
      ?auto_159431 - BLOCK
      ?auto_159432 - BLOCK
      ?auto_159433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159430 ?auto_159431 ) ( CLEAR ?auto_159430 ) ( not ( = ?auto_159430 ?auto_159431 ) ) ( HOLDING ?auto_159432 ) ( CLEAR ?auto_159433 ) ( not ( = ?auto_159430 ?auto_159432 ) ) ( not ( = ?auto_159430 ?auto_159433 ) ) ( not ( = ?auto_159431 ?auto_159432 ) ) ( not ( = ?auto_159431 ?auto_159433 ) ) ( not ( = ?auto_159432 ?auto_159433 ) ) )
    :subtasks
    ( ( !STACK ?auto_159432 ?auto_159433 )
      ( MAKE-1PILE ?auto_159430 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159434 - BLOCK
    )
    :vars
    (
      ?auto_159437 - BLOCK
      ?auto_159436 - BLOCK
      ?auto_159435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159434 ?auto_159437 ) ( not ( = ?auto_159434 ?auto_159437 ) ) ( CLEAR ?auto_159436 ) ( not ( = ?auto_159434 ?auto_159435 ) ) ( not ( = ?auto_159434 ?auto_159436 ) ) ( not ( = ?auto_159437 ?auto_159435 ) ) ( not ( = ?auto_159437 ?auto_159436 ) ) ( not ( = ?auto_159435 ?auto_159436 ) ) ( ON ?auto_159435 ?auto_159434 ) ( CLEAR ?auto_159435 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_159437 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_159437 ?auto_159434 )
      ( MAKE-1PILE ?auto_159434 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159438 - BLOCK
    )
    :vars
    (
      ?auto_159439 - BLOCK
      ?auto_159441 - BLOCK
      ?auto_159440 - BLOCK
      ?auto_159446 - BLOCK
      ?auto_159443 - BLOCK
      ?auto_159444 - BLOCK
      ?auto_159445 - BLOCK
      ?auto_159442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159438 ?auto_159439 ) ( not ( = ?auto_159438 ?auto_159439 ) ) ( not ( = ?auto_159438 ?auto_159441 ) ) ( not ( = ?auto_159438 ?auto_159440 ) ) ( not ( = ?auto_159439 ?auto_159441 ) ) ( not ( = ?auto_159439 ?auto_159440 ) ) ( not ( = ?auto_159441 ?auto_159440 ) ) ( ON ?auto_159441 ?auto_159438 ) ( CLEAR ?auto_159441 ) ( ON-TABLE ?auto_159439 ) ( HOLDING ?auto_159440 ) ( CLEAR ?auto_159446 ) ( ON-TABLE ?auto_159443 ) ( ON ?auto_159444 ?auto_159443 ) ( ON ?auto_159445 ?auto_159444 ) ( ON ?auto_159442 ?auto_159445 ) ( ON ?auto_159446 ?auto_159442 ) ( not ( = ?auto_159443 ?auto_159444 ) ) ( not ( = ?auto_159443 ?auto_159445 ) ) ( not ( = ?auto_159443 ?auto_159442 ) ) ( not ( = ?auto_159443 ?auto_159446 ) ) ( not ( = ?auto_159443 ?auto_159440 ) ) ( not ( = ?auto_159444 ?auto_159445 ) ) ( not ( = ?auto_159444 ?auto_159442 ) ) ( not ( = ?auto_159444 ?auto_159446 ) ) ( not ( = ?auto_159444 ?auto_159440 ) ) ( not ( = ?auto_159445 ?auto_159442 ) ) ( not ( = ?auto_159445 ?auto_159446 ) ) ( not ( = ?auto_159445 ?auto_159440 ) ) ( not ( = ?auto_159442 ?auto_159446 ) ) ( not ( = ?auto_159442 ?auto_159440 ) ) ( not ( = ?auto_159446 ?auto_159440 ) ) ( not ( = ?auto_159438 ?auto_159446 ) ) ( not ( = ?auto_159438 ?auto_159443 ) ) ( not ( = ?auto_159438 ?auto_159444 ) ) ( not ( = ?auto_159438 ?auto_159445 ) ) ( not ( = ?auto_159438 ?auto_159442 ) ) ( not ( = ?auto_159439 ?auto_159446 ) ) ( not ( = ?auto_159439 ?auto_159443 ) ) ( not ( = ?auto_159439 ?auto_159444 ) ) ( not ( = ?auto_159439 ?auto_159445 ) ) ( not ( = ?auto_159439 ?auto_159442 ) ) ( not ( = ?auto_159441 ?auto_159446 ) ) ( not ( = ?auto_159441 ?auto_159443 ) ) ( not ( = ?auto_159441 ?auto_159444 ) ) ( not ( = ?auto_159441 ?auto_159445 ) ) ( not ( = ?auto_159441 ?auto_159442 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_159443 ?auto_159444 ?auto_159445 ?auto_159442 ?auto_159446 ?auto_159440 )
      ( MAKE-1PILE ?auto_159438 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159447 - BLOCK
    )
    :vars
    (
      ?auto_159449 - BLOCK
      ?auto_159453 - BLOCK
      ?auto_159452 - BLOCK
      ?auto_159451 - BLOCK
      ?auto_159450 - BLOCK
      ?auto_159455 - BLOCK
      ?auto_159454 - BLOCK
      ?auto_159448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159447 ?auto_159449 ) ( not ( = ?auto_159447 ?auto_159449 ) ) ( not ( = ?auto_159447 ?auto_159453 ) ) ( not ( = ?auto_159447 ?auto_159452 ) ) ( not ( = ?auto_159449 ?auto_159453 ) ) ( not ( = ?auto_159449 ?auto_159452 ) ) ( not ( = ?auto_159453 ?auto_159452 ) ) ( ON ?auto_159453 ?auto_159447 ) ( ON-TABLE ?auto_159449 ) ( CLEAR ?auto_159451 ) ( ON-TABLE ?auto_159450 ) ( ON ?auto_159455 ?auto_159450 ) ( ON ?auto_159454 ?auto_159455 ) ( ON ?auto_159448 ?auto_159454 ) ( ON ?auto_159451 ?auto_159448 ) ( not ( = ?auto_159450 ?auto_159455 ) ) ( not ( = ?auto_159450 ?auto_159454 ) ) ( not ( = ?auto_159450 ?auto_159448 ) ) ( not ( = ?auto_159450 ?auto_159451 ) ) ( not ( = ?auto_159450 ?auto_159452 ) ) ( not ( = ?auto_159455 ?auto_159454 ) ) ( not ( = ?auto_159455 ?auto_159448 ) ) ( not ( = ?auto_159455 ?auto_159451 ) ) ( not ( = ?auto_159455 ?auto_159452 ) ) ( not ( = ?auto_159454 ?auto_159448 ) ) ( not ( = ?auto_159454 ?auto_159451 ) ) ( not ( = ?auto_159454 ?auto_159452 ) ) ( not ( = ?auto_159448 ?auto_159451 ) ) ( not ( = ?auto_159448 ?auto_159452 ) ) ( not ( = ?auto_159451 ?auto_159452 ) ) ( not ( = ?auto_159447 ?auto_159451 ) ) ( not ( = ?auto_159447 ?auto_159450 ) ) ( not ( = ?auto_159447 ?auto_159455 ) ) ( not ( = ?auto_159447 ?auto_159454 ) ) ( not ( = ?auto_159447 ?auto_159448 ) ) ( not ( = ?auto_159449 ?auto_159451 ) ) ( not ( = ?auto_159449 ?auto_159450 ) ) ( not ( = ?auto_159449 ?auto_159455 ) ) ( not ( = ?auto_159449 ?auto_159454 ) ) ( not ( = ?auto_159449 ?auto_159448 ) ) ( not ( = ?auto_159453 ?auto_159451 ) ) ( not ( = ?auto_159453 ?auto_159450 ) ) ( not ( = ?auto_159453 ?auto_159455 ) ) ( not ( = ?auto_159453 ?auto_159454 ) ) ( not ( = ?auto_159453 ?auto_159448 ) ) ( ON ?auto_159452 ?auto_159453 ) ( CLEAR ?auto_159452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_159449 ?auto_159447 ?auto_159453 )
      ( MAKE-1PILE ?auto_159447 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159456 - BLOCK
    )
    :vars
    (
      ?auto_159464 - BLOCK
      ?auto_159458 - BLOCK
      ?auto_159457 - BLOCK
      ?auto_159460 - BLOCK
      ?auto_159461 - BLOCK
      ?auto_159462 - BLOCK
      ?auto_159459 - BLOCK
      ?auto_159463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159456 ?auto_159464 ) ( not ( = ?auto_159456 ?auto_159464 ) ) ( not ( = ?auto_159456 ?auto_159458 ) ) ( not ( = ?auto_159456 ?auto_159457 ) ) ( not ( = ?auto_159464 ?auto_159458 ) ) ( not ( = ?auto_159464 ?auto_159457 ) ) ( not ( = ?auto_159458 ?auto_159457 ) ) ( ON ?auto_159458 ?auto_159456 ) ( ON-TABLE ?auto_159464 ) ( ON-TABLE ?auto_159460 ) ( ON ?auto_159461 ?auto_159460 ) ( ON ?auto_159462 ?auto_159461 ) ( ON ?auto_159459 ?auto_159462 ) ( not ( = ?auto_159460 ?auto_159461 ) ) ( not ( = ?auto_159460 ?auto_159462 ) ) ( not ( = ?auto_159460 ?auto_159459 ) ) ( not ( = ?auto_159460 ?auto_159463 ) ) ( not ( = ?auto_159460 ?auto_159457 ) ) ( not ( = ?auto_159461 ?auto_159462 ) ) ( not ( = ?auto_159461 ?auto_159459 ) ) ( not ( = ?auto_159461 ?auto_159463 ) ) ( not ( = ?auto_159461 ?auto_159457 ) ) ( not ( = ?auto_159462 ?auto_159459 ) ) ( not ( = ?auto_159462 ?auto_159463 ) ) ( not ( = ?auto_159462 ?auto_159457 ) ) ( not ( = ?auto_159459 ?auto_159463 ) ) ( not ( = ?auto_159459 ?auto_159457 ) ) ( not ( = ?auto_159463 ?auto_159457 ) ) ( not ( = ?auto_159456 ?auto_159463 ) ) ( not ( = ?auto_159456 ?auto_159460 ) ) ( not ( = ?auto_159456 ?auto_159461 ) ) ( not ( = ?auto_159456 ?auto_159462 ) ) ( not ( = ?auto_159456 ?auto_159459 ) ) ( not ( = ?auto_159464 ?auto_159463 ) ) ( not ( = ?auto_159464 ?auto_159460 ) ) ( not ( = ?auto_159464 ?auto_159461 ) ) ( not ( = ?auto_159464 ?auto_159462 ) ) ( not ( = ?auto_159464 ?auto_159459 ) ) ( not ( = ?auto_159458 ?auto_159463 ) ) ( not ( = ?auto_159458 ?auto_159460 ) ) ( not ( = ?auto_159458 ?auto_159461 ) ) ( not ( = ?auto_159458 ?auto_159462 ) ) ( not ( = ?auto_159458 ?auto_159459 ) ) ( ON ?auto_159457 ?auto_159458 ) ( CLEAR ?auto_159457 ) ( HOLDING ?auto_159463 ) ( CLEAR ?auto_159459 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_159460 ?auto_159461 ?auto_159462 ?auto_159459 ?auto_159463 )
      ( MAKE-1PILE ?auto_159456 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159465 - BLOCK
    )
    :vars
    (
      ?auto_159470 - BLOCK
      ?auto_159467 - BLOCK
      ?auto_159468 - BLOCK
      ?auto_159469 - BLOCK
      ?auto_159473 - BLOCK
      ?auto_159466 - BLOCK
      ?auto_159471 - BLOCK
      ?auto_159472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159465 ?auto_159470 ) ( not ( = ?auto_159465 ?auto_159470 ) ) ( not ( = ?auto_159465 ?auto_159467 ) ) ( not ( = ?auto_159465 ?auto_159468 ) ) ( not ( = ?auto_159470 ?auto_159467 ) ) ( not ( = ?auto_159470 ?auto_159468 ) ) ( not ( = ?auto_159467 ?auto_159468 ) ) ( ON ?auto_159467 ?auto_159465 ) ( ON-TABLE ?auto_159470 ) ( ON-TABLE ?auto_159469 ) ( ON ?auto_159473 ?auto_159469 ) ( ON ?auto_159466 ?auto_159473 ) ( ON ?auto_159471 ?auto_159466 ) ( not ( = ?auto_159469 ?auto_159473 ) ) ( not ( = ?auto_159469 ?auto_159466 ) ) ( not ( = ?auto_159469 ?auto_159471 ) ) ( not ( = ?auto_159469 ?auto_159472 ) ) ( not ( = ?auto_159469 ?auto_159468 ) ) ( not ( = ?auto_159473 ?auto_159466 ) ) ( not ( = ?auto_159473 ?auto_159471 ) ) ( not ( = ?auto_159473 ?auto_159472 ) ) ( not ( = ?auto_159473 ?auto_159468 ) ) ( not ( = ?auto_159466 ?auto_159471 ) ) ( not ( = ?auto_159466 ?auto_159472 ) ) ( not ( = ?auto_159466 ?auto_159468 ) ) ( not ( = ?auto_159471 ?auto_159472 ) ) ( not ( = ?auto_159471 ?auto_159468 ) ) ( not ( = ?auto_159472 ?auto_159468 ) ) ( not ( = ?auto_159465 ?auto_159472 ) ) ( not ( = ?auto_159465 ?auto_159469 ) ) ( not ( = ?auto_159465 ?auto_159473 ) ) ( not ( = ?auto_159465 ?auto_159466 ) ) ( not ( = ?auto_159465 ?auto_159471 ) ) ( not ( = ?auto_159470 ?auto_159472 ) ) ( not ( = ?auto_159470 ?auto_159469 ) ) ( not ( = ?auto_159470 ?auto_159473 ) ) ( not ( = ?auto_159470 ?auto_159466 ) ) ( not ( = ?auto_159470 ?auto_159471 ) ) ( not ( = ?auto_159467 ?auto_159472 ) ) ( not ( = ?auto_159467 ?auto_159469 ) ) ( not ( = ?auto_159467 ?auto_159473 ) ) ( not ( = ?auto_159467 ?auto_159466 ) ) ( not ( = ?auto_159467 ?auto_159471 ) ) ( ON ?auto_159468 ?auto_159467 ) ( CLEAR ?auto_159471 ) ( ON ?auto_159472 ?auto_159468 ) ( CLEAR ?auto_159472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_159470 ?auto_159465 ?auto_159467 ?auto_159468 )
      ( MAKE-1PILE ?auto_159465 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159474 - BLOCK
    )
    :vars
    (
      ?auto_159476 - BLOCK
      ?auto_159475 - BLOCK
      ?auto_159481 - BLOCK
      ?auto_159482 - BLOCK
      ?auto_159477 - BLOCK
      ?auto_159478 - BLOCK
      ?auto_159479 - BLOCK
      ?auto_159480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159474 ?auto_159476 ) ( not ( = ?auto_159474 ?auto_159476 ) ) ( not ( = ?auto_159474 ?auto_159475 ) ) ( not ( = ?auto_159474 ?auto_159481 ) ) ( not ( = ?auto_159476 ?auto_159475 ) ) ( not ( = ?auto_159476 ?auto_159481 ) ) ( not ( = ?auto_159475 ?auto_159481 ) ) ( ON ?auto_159475 ?auto_159474 ) ( ON-TABLE ?auto_159476 ) ( ON-TABLE ?auto_159482 ) ( ON ?auto_159477 ?auto_159482 ) ( ON ?auto_159478 ?auto_159477 ) ( not ( = ?auto_159482 ?auto_159477 ) ) ( not ( = ?auto_159482 ?auto_159478 ) ) ( not ( = ?auto_159482 ?auto_159479 ) ) ( not ( = ?auto_159482 ?auto_159480 ) ) ( not ( = ?auto_159482 ?auto_159481 ) ) ( not ( = ?auto_159477 ?auto_159478 ) ) ( not ( = ?auto_159477 ?auto_159479 ) ) ( not ( = ?auto_159477 ?auto_159480 ) ) ( not ( = ?auto_159477 ?auto_159481 ) ) ( not ( = ?auto_159478 ?auto_159479 ) ) ( not ( = ?auto_159478 ?auto_159480 ) ) ( not ( = ?auto_159478 ?auto_159481 ) ) ( not ( = ?auto_159479 ?auto_159480 ) ) ( not ( = ?auto_159479 ?auto_159481 ) ) ( not ( = ?auto_159480 ?auto_159481 ) ) ( not ( = ?auto_159474 ?auto_159480 ) ) ( not ( = ?auto_159474 ?auto_159482 ) ) ( not ( = ?auto_159474 ?auto_159477 ) ) ( not ( = ?auto_159474 ?auto_159478 ) ) ( not ( = ?auto_159474 ?auto_159479 ) ) ( not ( = ?auto_159476 ?auto_159480 ) ) ( not ( = ?auto_159476 ?auto_159482 ) ) ( not ( = ?auto_159476 ?auto_159477 ) ) ( not ( = ?auto_159476 ?auto_159478 ) ) ( not ( = ?auto_159476 ?auto_159479 ) ) ( not ( = ?auto_159475 ?auto_159480 ) ) ( not ( = ?auto_159475 ?auto_159482 ) ) ( not ( = ?auto_159475 ?auto_159477 ) ) ( not ( = ?auto_159475 ?auto_159478 ) ) ( not ( = ?auto_159475 ?auto_159479 ) ) ( ON ?auto_159481 ?auto_159475 ) ( ON ?auto_159480 ?auto_159481 ) ( CLEAR ?auto_159480 ) ( HOLDING ?auto_159479 ) ( CLEAR ?auto_159478 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_159482 ?auto_159477 ?auto_159478 ?auto_159479 )
      ( MAKE-1PILE ?auto_159474 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159483 - BLOCK
    )
    :vars
    (
      ?auto_159489 - BLOCK
      ?auto_159486 - BLOCK
      ?auto_159488 - BLOCK
      ?auto_159485 - BLOCK
      ?auto_159491 - BLOCK
      ?auto_159484 - BLOCK
      ?auto_159490 - BLOCK
      ?auto_159487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159483 ?auto_159489 ) ( not ( = ?auto_159483 ?auto_159489 ) ) ( not ( = ?auto_159483 ?auto_159486 ) ) ( not ( = ?auto_159483 ?auto_159488 ) ) ( not ( = ?auto_159489 ?auto_159486 ) ) ( not ( = ?auto_159489 ?auto_159488 ) ) ( not ( = ?auto_159486 ?auto_159488 ) ) ( ON ?auto_159486 ?auto_159483 ) ( ON-TABLE ?auto_159489 ) ( ON-TABLE ?auto_159485 ) ( ON ?auto_159491 ?auto_159485 ) ( ON ?auto_159484 ?auto_159491 ) ( not ( = ?auto_159485 ?auto_159491 ) ) ( not ( = ?auto_159485 ?auto_159484 ) ) ( not ( = ?auto_159485 ?auto_159490 ) ) ( not ( = ?auto_159485 ?auto_159487 ) ) ( not ( = ?auto_159485 ?auto_159488 ) ) ( not ( = ?auto_159491 ?auto_159484 ) ) ( not ( = ?auto_159491 ?auto_159490 ) ) ( not ( = ?auto_159491 ?auto_159487 ) ) ( not ( = ?auto_159491 ?auto_159488 ) ) ( not ( = ?auto_159484 ?auto_159490 ) ) ( not ( = ?auto_159484 ?auto_159487 ) ) ( not ( = ?auto_159484 ?auto_159488 ) ) ( not ( = ?auto_159490 ?auto_159487 ) ) ( not ( = ?auto_159490 ?auto_159488 ) ) ( not ( = ?auto_159487 ?auto_159488 ) ) ( not ( = ?auto_159483 ?auto_159487 ) ) ( not ( = ?auto_159483 ?auto_159485 ) ) ( not ( = ?auto_159483 ?auto_159491 ) ) ( not ( = ?auto_159483 ?auto_159484 ) ) ( not ( = ?auto_159483 ?auto_159490 ) ) ( not ( = ?auto_159489 ?auto_159487 ) ) ( not ( = ?auto_159489 ?auto_159485 ) ) ( not ( = ?auto_159489 ?auto_159491 ) ) ( not ( = ?auto_159489 ?auto_159484 ) ) ( not ( = ?auto_159489 ?auto_159490 ) ) ( not ( = ?auto_159486 ?auto_159487 ) ) ( not ( = ?auto_159486 ?auto_159485 ) ) ( not ( = ?auto_159486 ?auto_159491 ) ) ( not ( = ?auto_159486 ?auto_159484 ) ) ( not ( = ?auto_159486 ?auto_159490 ) ) ( ON ?auto_159488 ?auto_159486 ) ( ON ?auto_159487 ?auto_159488 ) ( CLEAR ?auto_159484 ) ( ON ?auto_159490 ?auto_159487 ) ( CLEAR ?auto_159490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_159489 ?auto_159483 ?auto_159486 ?auto_159488 ?auto_159487 )
      ( MAKE-1PILE ?auto_159483 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159492 - BLOCK
    )
    :vars
    (
      ?auto_159496 - BLOCK
      ?auto_159500 - BLOCK
      ?auto_159497 - BLOCK
      ?auto_159493 - BLOCK
      ?auto_159498 - BLOCK
      ?auto_159494 - BLOCK
      ?auto_159495 - BLOCK
      ?auto_159499 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159492 ?auto_159496 ) ( not ( = ?auto_159492 ?auto_159496 ) ) ( not ( = ?auto_159492 ?auto_159500 ) ) ( not ( = ?auto_159492 ?auto_159497 ) ) ( not ( = ?auto_159496 ?auto_159500 ) ) ( not ( = ?auto_159496 ?auto_159497 ) ) ( not ( = ?auto_159500 ?auto_159497 ) ) ( ON ?auto_159500 ?auto_159492 ) ( ON-TABLE ?auto_159496 ) ( ON-TABLE ?auto_159493 ) ( ON ?auto_159498 ?auto_159493 ) ( not ( = ?auto_159493 ?auto_159498 ) ) ( not ( = ?auto_159493 ?auto_159494 ) ) ( not ( = ?auto_159493 ?auto_159495 ) ) ( not ( = ?auto_159493 ?auto_159499 ) ) ( not ( = ?auto_159493 ?auto_159497 ) ) ( not ( = ?auto_159498 ?auto_159494 ) ) ( not ( = ?auto_159498 ?auto_159495 ) ) ( not ( = ?auto_159498 ?auto_159499 ) ) ( not ( = ?auto_159498 ?auto_159497 ) ) ( not ( = ?auto_159494 ?auto_159495 ) ) ( not ( = ?auto_159494 ?auto_159499 ) ) ( not ( = ?auto_159494 ?auto_159497 ) ) ( not ( = ?auto_159495 ?auto_159499 ) ) ( not ( = ?auto_159495 ?auto_159497 ) ) ( not ( = ?auto_159499 ?auto_159497 ) ) ( not ( = ?auto_159492 ?auto_159499 ) ) ( not ( = ?auto_159492 ?auto_159493 ) ) ( not ( = ?auto_159492 ?auto_159498 ) ) ( not ( = ?auto_159492 ?auto_159494 ) ) ( not ( = ?auto_159492 ?auto_159495 ) ) ( not ( = ?auto_159496 ?auto_159499 ) ) ( not ( = ?auto_159496 ?auto_159493 ) ) ( not ( = ?auto_159496 ?auto_159498 ) ) ( not ( = ?auto_159496 ?auto_159494 ) ) ( not ( = ?auto_159496 ?auto_159495 ) ) ( not ( = ?auto_159500 ?auto_159499 ) ) ( not ( = ?auto_159500 ?auto_159493 ) ) ( not ( = ?auto_159500 ?auto_159498 ) ) ( not ( = ?auto_159500 ?auto_159494 ) ) ( not ( = ?auto_159500 ?auto_159495 ) ) ( ON ?auto_159497 ?auto_159500 ) ( ON ?auto_159499 ?auto_159497 ) ( ON ?auto_159495 ?auto_159499 ) ( CLEAR ?auto_159495 ) ( HOLDING ?auto_159494 ) ( CLEAR ?auto_159498 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_159493 ?auto_159498 ?auto_159494 )
      ( MAKE-1PILE ?auto_159492 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159501 - BLOCK
    )
    :vars
    (
      ?auto_159505 - BLOCK
      ?auto_159503 - BLOCK
      ?auto_159508 - BLOCK
      ?auto_159509 - BLOCK
      ?auto_159507 - BLOCK
      ?auto_159506 - BLOCK
      ?auto_159502 - BLOCK
      ?auto_159504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159501 ?auto_159505 ) ( not ( = ?auto_159501 ?auto_159505 ) ) ( not ( = ?auto_159501 ?auto_159503 ) ) ( not ( = ?auto_159501 ?auto_159508 ) ) ( not ( = ?auto_159505 ?auto_159503 ) ) ( not ( = ?auto_159505 ?auto_159508 ) ) ( not ( = ?auto_159503 ?auto_159508 ) ) ( ON ?auto_159503 ?auto_159501 ) ( ON-TABLE ?auto_159505 ) ( ON-TABLE ?auto_159509 ) ( ON ?auto_159507 ?auto_159509 ) ( not ( = ?auto_159509 ?auto_159507 ) ) ( not ( = ?auto_159509 ?auto_159506 ) ) ( not ( = ?auto_159509 ?auto_159502 ) ) ( not ( = ?auto_159509 ?auto_159504 ) ) ( not ( = ?auto_159509 ?auto_159508 ) ) ( not ( = ?auto_159507 ?auto_159506 ) ) ( not ( = ?auto_159507 ?auto_159502 ) ) ( not ( = ?auto_159507 ?auto_159504 ) ) ( not ( = ?auto_159507 ?auto_159508 ) ) ( not ( = ?auto_159506 ?auto_159502 ) ) ( not ( = ?auto_159506 ?auto_159504 ) ) ( not ( = ?auto_159506 ?auto_159508 ) ) ( not ( = ?auto_159502 ?auto_159504 ) ) ( not ( = ?auto_159502 ?auto_159508 ) ) ( not ( = ?auto_159504 ?auto_159508 ) ) ( not ( = ?auto_159501 ?auto_159504 ) ) ( not ( = ?auto_159501 ?auto_159509 ) ) ( not ( = ?auto_159501 ?auto_159507 ) ) ( not ( = ?auto_159501 ?auto_159506 ) ) ( not ( = ?auto_159501 ?auto_159502 ) ) ( not ( = ?auto_159505 ?auto_159504 ) ) ( not ( = ?auto_159505 ?auto_159509 ) ) ( not ( = ?auto_159505 ?auto_159507 ) ) ( not ( = ?auto_159505 ?auto_159506 ) ) ( not ( = ?auto_159505 ?auto_159502 ) ) ( not ( = ?auto_159503 ?auto_159504 ) ) ( not ( = ?auto_159503 ?auto_159509 ) ) ( not ( = ?auto_159503 ?auto_159507 ) ) ( not ( = ?auto_159503 ?auto_159506 ) ) ( not ( = ?auto_159503 ?auto_159502 ) ) ( ON ?auto_159508 ?auto_159503 ) ( ON ?auto_159504 ?auto_159508 ) ( ON ?auto_159502 ?auto_159504 ) ( CLEAR ?auto_159507 ) ( ON ?auto_159506 ?auto_159502 ) ( CLEAR ?auto_159506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_159505 ?auto_159501 ?auto_159503 ?auto_159508 ?auto_159504 ?auto_159502 )
      ( MAKE-1PILE ?auto_159501 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159510 - BLOCK
    )
    :vars
    (
      ?auto_159515 - BLOCK
      ?auto_159511 - BLOCK
      ?auto_159516 - BLOCK
      ?auto_159513 - BLOCK
      ?auto_159514 - BLOCK
      ?auto_159512 - BLOCK
      ?auto_159517 - BLOCK
      ?auto_159518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159510 ?auto_159515 ) ( not ( = ?auto_159510 ?auto_159515 ) ) ( not ( = ?auto_159510 ?auto_159511 ) ) ( not ( = ?auto_159510 ?auto_159516 ) ) ( not ( = ?auto_159515 ?auto_159511 ) ) ( not ( = ?auto_159515 ?auto_159516 ) ) ( not ( = ?auto_159511 ?auto_159516 ) ) ( ON ?auto_159511 ?auto_159510 ) ( ON-TABLE ?auto_159515 ) ( ON-TABLE ?auto_159513 ) ( not ( = ?auto_159513 ?auto_159514 ) ) ( not ( = ?auto_159513 ?auto_159512 ) ) ( not ( = ?auto_159513 ?auto_159517 ) ) ( not ( = ?auto_159513 ?auto_159518 ) ) ( not ( = ?auto_159513 ?auto_159516 ) ) ( not ( = ?auto_159514 ?auto_159512 ) ) ( not ( = ?auto_159514 ?auto_159517 ) ) ( not ( = ?auto_159514 ?auto_159518 ) ) ( not ( = ?auto_159514 ?auto_159516 ) ) ( not ( = ?auto_159512 ?auto_159517 ) ) ( not ( = ?auto_159512 ?auto_159518 ) ) ( not ( = ?auto_159512 ?auto_159516 ) ) ( not ( = ?auto_159517 ?auto_159518 ) ) ( not ( = ?auto_159517 ?auto_159516 ) ) ( not ( = ?auto_159518 ?auto_159516 ) ) ( not ( = ?auto_159510 ?auto_159518 ) ) ( not ( = ?auto_159510 ?auto_159513 ) ) ( not ( = ?auto_159510 ?auto_159514 ) ) ( not ( = ?auto_159510 ?auto_159512 ) ) ( not ( = ?auto_159510 ?auto_159517 ) ) ( not ( = ?auto_159515 ?auto_159518 ) ) ( not ( = ?auto_159515 ?auto_159513 ) ) ( not ( = ?auto_159515 ?auto_159514 ) ) ( not ( = ?auto_159515 ?auto_159512 ) ) ( not ( = ?auto_159515 ?auto_159517 ) ) ( not ( = ?auto_159511 ?auto_159518 ) ) ( not ( = ?auto_159511 ?auto_159513 ) ) ( not ( = ?auto_159511 ?auto_159514 ) ) ( not ( = ?auto_159511 ?auto_159512 ) ) ( not ( = ?auto_159511 ?auto_159517 ) ) ( ON ?auto_159516 ?auto_159511 ) ( ON ?auto_159518 ?auto_159516 ) ( ON ?auto_159517 ?auto_159518 ) ( ON ?auto_159512 ?auto_159517 ) ( CLEAR ?auto_159512 ) ( HOLDING ?auto_159514 ) ( CLEAR ?auto_159513 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_159513 ?auto_159514 )
      ( MAKE-1PILE ?auto_159510 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159519 - BLOCK
    )
    :vars
    (
      ?auto_159520 - BLOCK
      ?auto_159527 - BLOCK
      ?auto_159526 - BLOCK
      ?auto_159522 - BLOCK
      ?auto_159521 - BLOCK
      ?auto_159523 - BLOCK
      ?auto_159525 - BLOCK
      ?auto_159524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159519 ?auto_159520 ) ( not ( = ?auto_159519 ?auto_159520 ) ) ( not ( = ?auto_159519 ?auto_159527 ) ) ( not ( = ?auto_159519 ?auto_159526 ) ) ( not ( = ?auto_159520 ?auto_159527 ) ) ( not ( = ?auto_159520 ?auto_159526 ) ) ( not ( = ?auto_159527 ?auto_159526 ) ) ( ON ?auto_159527 ?auto_159519 ) ( ON-TABLE ?auto_159520 ) ( ON-TABLE ?auto_159522 ) ( not ( = ?auto_159522 ?auto_159521 ) ) ( not ( = ?auto_159522 ?auto_159523 ) ) ( not ( = ?auto_159522 ?auto_159525 ) ) ( not ( = ?auto_159522 ?auto_159524 ) ) ( not ( = ?auto_159522 ?auto_159526 ) ) ( not ( = ?auto_159521 ?auto_159523 ) ) ( not ( = ?auto_159521 ?auto_159525 ) ) ( not ( = ?auto_159521 ?auto_159524 ) ) ( not ( = ?auto_159521 ?auto_159526 ) ) ( not ( = ?auto_159523 ?auto_159525 ) ) ( not ( = ?auto_159523 ?auto_159524 ) ) ( not ( = ?auto_159523 ?auto_159526 ) ) ( not ( = ?auto_159525 ?auto_159524 ) ) ( not ( = ?auto_159525 ?auto_159526 ) ) ( not ( = ?auto_159524 ?auto_159526 ) ) ( not ( = ?auto_159519 ?auto_159524 ) ) ( not ( = ?auto_159519 ?auto_159522 ) ) ( not ( = ?auto_159519 ?auto_159521 ) ) ( not ( = ?auto_159519 ?auto_159523 ) ) ( not ( = ?auto_159519 ?auto_159525 ) ) ( not ( = ?auto_159520 ?auto_159524 ) ) ( not ( = ?auto_159520 ?auto_159522 ) ) ( not ( = ?auto_159520 ?auto_159521 ) ) ( not ( = ?auto_159520 ?auto_159523 ) ) ( not ( = ?auto_159520 ?auto_159525 ) ) ( not ( = ?auto_159527 ?auto_159524 ) ) ( not ( = ?auto_159527 ?auto_159522 ) ) ( not ( = ?auto_159527 ?auto_159521 ) ) ( not ( = ?auto_159527 ?auto_159523 ) ) ( not ( = ?auto_159527 ?auto_159525 ) ) ( ON ?auto_159526 ?auto_159527 ) ( ON ?auto_159524 ?auto_159526 ) ( ON ?auto_159525 ?auto_159524 ) ( ON ?auto_159523 ?auto_159525 ) ( CLEAR ?auto_159522 ) ( ON ?auto_159521 ?auto_159523 ) ( CLEAR ?auto_159521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_159520 ?auto_159519 ?auto_159527 ?auto_159526 ?auto_159524 ?auto_159525 ?auto_159523 )
      ( MAKE-1PILE ?auto_159519 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159528 - BLOCK
    )
    :vars
    (
      ?auto_159536 - BLOCK
      ?auto_159534 - BLOCK
      ?auto_159532 - BLOCK
      ?auto_159530 - BLOCK
      ?auto_159529 - BLOCK
      ?auto_159531 - BLOCK
      ?auto_159533 - BLOCK
      ?auto_159535 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159528 ?auto_159536 ) ( not ( = ?auto_159528 ?auto_159536 ) ) ( not ( = ?auto_159528 ?auto_159534 ) ) ( not ( = ?auto_159528 ?auto_159532 ) ) ( not ( = ?auto_159536 ?auto_159534 ) ) ( not ( = ?auto_159536 ?auto_159532 ) ) ( not ( = ?auto_159534 ?auto_159532 ) ) ( ON ?auto_159534 ?auto_159528 ) ( ON-TABLE ?auto_159536 ) ( not ( = ?auto_159530 ?auto_159529 ) ) ( not ( = ?auto_159530 ?auto_159531 ) ) ( not ( = ?auto_159530 ?auto_159533 ) ) ( not ( = ?auto_159530 ?auto_159535 ) ) ( not ( = ?auto_159530 ?auto_159532 ) ) ( not ( = ?auto_159529 ?auto_159531 ) ) ( not ( = ?auto_159529 ?auto_159533 ) ) ( not ( = ?auto_159529 ?auto_159535 ) ) ( not ( = ?auto_159529 ?auto_159532 ) ) ( not ( = ?auto_159531 ?auto_159533 ) ) ( not ( = ?auto_159531 ?auto_159535 ) ) ( not ( = ?auto_159531 ?auto_159532 ) ) ( not ( = ?auto_159533 ?auto_159535 ) ) ( not ( = ?auto_159533 ?auto_159532 ) ) ( not ( = ?auto_159535 ?auto_159532 ) ) ( not ( = ?auto_159528 ?auto_159535 ) ) ( not ( = ?auto_159528 ?auto_159530 ) ) ( not ( = ?auto_159528 ?auto_159529 ) ) ( not ( = ?auto_159528 ?auto_159531 ) ) ( not ( = ?auto_159528 ?auto_159533 ) ) ( not ( = ?auto_159536 ?auto_159535 ) ) ( not ( = ?auto_159536 ?auto_159530 ) ) ( not ( = ?auto_159536 ?auto_159529 ) ) ( not ( = ?auto_159536 ?auto_159531 ) ) ( not ( = ?auto_159536 ?auto_159533 ) ) ( not ( = ?auto_159534 ?auto_159535 ) ) ( not ( = ?auto_159534 ?auto_159530 ) ) ( not ( = ?auto_159534 ?auto_159529 ) ) ( not ( = ?auto_159534 ?auto_159531 ) ) ( not ( = ?auto_159534 ?auto_159533 ) ) ( ON ?auto_159532 ?auto_159534 ) ( ON ?auto_159535 ?auto_159532 ) ( ON ?auto_159533 ?auto_159535 ) ( ON ?auto_159531 ?auto_159533 ) ( ON ?auto_159529 ?auto_159531 ) ( CLEAR ?auto_159529 ) ( HOLDING ?auto_159530 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_159530 )
      ( MAKE-1PILE ?auto_159528 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159537 - BLOCK
    )
    :vars
    (
      ?auto_159544 - BLOCK
      ?auto_159539 - BLOCK
      ?auto_159545 - BLOCK
      ?auto_159542 - BLOCK
      ?auto_159543 - BLOCK
      ?auto_159538 - BLOCK
      ?auto_159541 - BLOCK
      ?auto_159540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159537 ?auto_159544 ) ( not ( = ?auto_159537 ?auto_159544 ) ) ( not ( = ?auto_159537 ?auto_159539 ) ) ( not ( = ?auto_159537 ?auto_159545 ) ) ( not ( = ?auto_159544 ?auto_159539 ) ) ( not ( = ?auto_159544 ?auto_159545 ) ) ( not ( = ?auto_159539 ?auto_159545 ) ) ( ON ?auto_159539 ?auto_159537 ) ( ON-TABLE ?auto_159544 ) ( not ( = ?auto_159542 ?auto_159543 ) ) ( not ( = ?auto_159542 ?auto_159538 ) ) ( not ( = ?auto_159542 ?auto_159541 ) ) ( not ( = ?auto_159542 ?auto_159540 ) ) ( not ( = ?auto_159542 ?auto_159545 ) ) ( not ( = ?auto_159543 ?auto_159538 ) ) ( not ( = ?auto_159543 ?auto_159541 ) ) ( not ( = ?auto_159543 ?auto_159540 ) ) ( not ( = ?auto_159543 ?auto_159545 ) ) ( not ( = ?auto_159538 ?auto_159541 ) ) ( not ( = ?auto_159538 ?auto_159540 ) ) ( not ( = ?auto_159538 ?auto_159545 ) ) ( not ( = ?auto_159541 ?auto_159540 ) ) ( not ( = ?auto_159541 ?auto_159545 ) ) ( not ( = ?auto_159540 ?auto_159545 ) ) ( not ( = ?auto_159537 ?auto_159540 ) ) ( not ( = ?auto_159537 ?auto_159542 ) ) ( not ( = ?auto_159537 ?auto_159543 ) ) ( not ( = ?auto_159537 ?auto_159538 ) ) ( not ( = ?auto_159537 ?auto_159541 ) ) ( not ( = ?auto_159544 ?auto_159540 ) ) ( not ( = ?auto_159544 ?auto_159542 ) ) ( not ( = ?auto_159544 ?auto_159543 ) ) ( not ( = ?auto_159544 ?auto_159538 ) ) ( not ( = ?auto_159544 ?auto_159541 ) ) ( not ( = ?auto_159539 ?auto_159540 ) ) ( not ( = ?auto_159539 ?auto_159542 ) ) ( not ( = ?auto_159539 ?auto_159543 ) ) ( not ( = ?auto_159539 ?auto_159538 ) ) ( not ( = ?auto_159539 ?auto_159541 ) ) ( ON ?auto_159545 ?auto_159539 ) ( ON ?auto_159540 ?auto_159545 ) ( ON ?auto_159541 ?auto_159540 ) ( ON ?auto_159538 ?auto_159541 ) ( ON ?auto_159543 ?auto_159538 ) ( ON ?auto_159542 ?auto_159543 ) ( CLEAR ?auto_159542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_159544 ?auto_159537 ?auto_159539 ?auto_159545 ?auto_159540 ?auto_159541 ?auto_159538 ?auto_159543 )
      ( MAKE-1PILE ?auto_159537 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_159559 - BLOCK
      ?auto_159560 - BLOCK
      ?auto_159561 - BLOCK
      ?auto_159562 - BLOCK
      ?auto_159563 - BLOCK
      ?auto_159564 - BLOCK
    )
    :vars
    (
      ?auto_159565 - BLOCK
      ?auto_159566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159565 ?auto_159564 ) ( CLEAR ?auto_159565 ) ( ON-TABLE ?auto_159559 ) ( ON ?auto_159560 ?auto_159559 ) ( ON ?auto_159561 ?auto_159560 ) ( ON ?auto_159562 ?auto_159561 ) ( ON ?auto_159563 ?auto_159562 ) ( ON ?auto_159564 ?auto_159563 ) ( not ( = ?auto_159559 ?auto_159560 ) ) ( not ( = ?auto_159559 ?auto_159561 ) ) ( not ( = ?auto_159559 ?auto_159562 ) ) ( not ( = ?auto_159559 ?auto_159563 ) ) ( not ( = ?auto_159559 ?auto_159564 ) ) ( not ( = ?auto_159559 ?auto_159565 ) ) ( not ( = ?auto_159560 ?auto_159561 ) ) ( not ( = ?auto_159560 ?auto_159562 ) ) ( not ( = ?auto_159560 ?auto_159563 ) ) ( not ( = ?auto_159560 ?auto_159564 ) ) ( not ( = ?auto_159560 ?auto_159565 ) ) ( not ( = ?auto_159561 ?auto_159562 ) ) ( not ( = ?auto_159561 ?auto_159563 ) ) ( not ( = ?auto_159561 ?auto_159564 ) ) ( not ( = ?auto_159561 ?auto_159565 ) ) ( not ( = ?auto_159562 ?auto_159563 ) ) ( not ( = ?auto_159562 ?auto_159564 ) ) ( not ( = ?auto_159562 ?auto_159565 ) ) ( not ( = ?auto_159563 ?auto_159564 ) ) ( not ( = ?auto_159563 ?auto_159565 ) ) ( not ( = ?auto_159564 ?auto_159565 ) ) ( HOLDING ?auto_159566 ) ( not ( = ?auto_159559 ?auto_159566 ) ) ( not ( = ?auto_159560 ?auto_159566 ) ) ( not ( = ?auto_159561 ?auto_159566 ) ) ( not ( = ?auto_159562 ?auto_159566 ) ) ( not ( = ?auto_159563 ?auto_159566 ) ) ( not ( = ?auto_159564 ?auto_159566 ) ) ( not ( = ?auto_159565 ?auto_159566 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_159566 )
      ( MAKE-6PILE ?auto_159559 ?auto_159560 ?auto_159561 ?auto_159562 ?auto_159563 ?auto_159564 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159684 - BLOCK
      ?auto_159685 - BLOCK
    )
    :vars
    (
      ?auto_159686 - BLOCK
      ?auto_159691 - BLOCK
      ?auto_159689 - BLOCK
      ?auto_159690 - BLOCK
      ?auto_159688 - BLOCK
      ?auto_159687 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159684 ?auto_159685 ) ) ( ON ?auto_159685 ?auto_159686 ) ( not ( = ?auto_159684 ?auto_159686 ) ) ( not ( = ?auto_159685 ?auto_159686 ) ) ( ON ?auto_159684 ?auto_159685 ) ( CLEAR ?auto_159684 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_159691 ) ( ON ?auto_159689 ?auto_159691 ) ( ON ?auto_159690 ?auto_159689 ) ( ON ?auto_159688 ?auto_159690 ) ( ON ?auto_159687 ?auto_159688 ) ( ON ?auto_159686 ?auto_159687 ) ( not ( = ?auto_159691 ?auto_159689 ) ) ( not ( = ?auto_159691 ?auto_159690 ) ) ( not ( = ?auto_159691 ?auto_159688 ) ) ( not ( = ?auto_159691 ?auto_159687 ) ) ( not ( = ?auto_159691 ?auto_159686 ) ) ( not ( = ?auto_159691 ?auto_159685 ) ) ( not ( = ?auto_159691 ?auto_159684 ) ) ( not ( = ?auto_159689 ?auto_159690 ) ) ( not ( = ?auto_159689 ?auto_159688 ) ) ( not ( = ?auto_159689 ?auto_159687 ) ) ( not ( = ?auto_159689 ?auto_159686 ) ) ( not ( = ?auto_159689 ?auto_159685 ) ) ( not ( = ?auto_159689 ?auto_159684 ) ) ( not ( = ?auto_159690 ?auto_159688 ) ) ( not ( = ?auto_159690 ?auto_159687 ) ) ( not ( = ?auto_159690 ?auto_159686 ) ) ( not ( = ?auto_159690 ?auto_159685 ) ) ( not ( = ?auto_159690 ?auto_159684 ) ) ( not ( = ?auto_159688 ?auto_159687 ) ) ( not ( = ?auto_159688 ?auto_159686 ) ) ( not ( = ?auto_159688 ?auto_159685 ) ) ( not ( = ?auto_159688 ?auto_159684 ) ) ( not ( = ?auto_159687 ?auto_159686 ) ) ( not ( = ?auto_159687 ?auto_159685 ) ) ( not ( = ?auto_159687 ?auto_159684 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_159691 ?auto_159689 ?auto_159690 ?auto_159688 ?auto_159687 ?auto_159686 ?auto_159685 )
      ( MAKE-2PILE ?auto_159684 ?auto_159685 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159694 - BLOCK
      ?auto_159695 - BLOCK
    )
    :vars
    (
      ?auto_159696 - BLOCK
      ?auto_159697 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159694 ?auto_159695 ) ) ( ON ?auto_159695 ?auto_159696 ) ( CLEAR ?auto_159695 ) ( not ( = ?auto_159694 ?auto_159696 ) ) ( not ( = ?auto_159695 ?auto_159696 ) ) ( ON ?auto_159694 ?auto_159697 ) ( CLEAR ?auto_159694 ) ( HAND-EMPTY ) ( not ( = ?auto_159694 ?auto_159697 ) ) ( not ( = ?auto_159695 ?auto_159697 ) ) ( not ( = ?auto_159696 ?auto_159697 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_159694 ?auto_159697 )
      ( MAKE-2PILE ?auto_159694 ?auto_159695 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159698 - BLOCK
      ?auto_159699 - BLOCK
    )
    :vars
    (
      ?auto_159701 - BLOCK
      ?auto_159700 - BLOCK
      ?auto_159706 - BLOCK
      ?auto_159705 - BLOCK
      ?auto_159704 - BLOCK
      ?auto_159702 - BLOCK
      ?auto_159703 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159698 ?auto_159699 ) ) ( not ( = ?auto_159698 ?auto_159701 ) ) ( not ( = ?auto_159699 ?auto_159701 ) ) ( ON ?auto_159698 ?auto_159700 ) ( CLEAR ?auto_159698 ) ( not ( = ?auto_159698 ?auto_159700 ) ) ( not ( = ?auto_159699 ?auto_159700 ) ) ( not ( = ?auto_159701 ?auto_159700 ) ) ( HOLDING ?auto_159699 ) ( CLEAR ?auto_159701 ) ( ON-TABLE ?auto_159706 ) ( ON ?auto_159705 ?auto_159706 ) ( ON ?auto_159704 ?auto_159705 ) ( ON ?auto_159702 ?auto_159704 ) ( ON ?auto_159703 ?auto_159702 ) ( ON ?auto_159701 ?auto_159703 ) ( not ( = ?auto_159706 ?auto_159705 ) ) ( not ( = ?auto_159706 ?auto_159704 ) ) ( not ( = ?auto_159706 ?auto_159702 ) ) ( not ( = ?auto_159706 ?auto_159703 ) ) ( not ( = ?auto_159706 ?auto_159701 ) ) ( not ( = ?auto_159706 ?auto_159699 ) ) ( not ( = ?auto_159705 ?auto_159704 ) ) ( not ( = ?auto_159705 ?auto_159702 ) ) ( not ( = ?auto_159705 ?auto_159703 ) ) ( not ( = ?auto_159705 ?auto_159701 ) ) ( not ( = ?auto_159705 ?auto_159699 ) ) ( not ( = ?auto_159704 ?auto_159702 ) ) ( not ( = ?auto_159704 ?auto_159703 ) ) ( not ( = ?auto_159704 ?auto_159701 ) ) ( not ( = ?auto_159704 ?auto_159699 ) ) ( not ( = ?auto_159702 ?auto_159703 ) ) ( not ( = ?auto_159702 ?auto_159701 ) ) ( not ( = ?auto_159702 ?auto_159699 ) ) ( not ( = ?auto_159703 ?auto_159701 ) ) ( not ( = ?auto_159703 ?auto_159699 ) ) ( not ( = ?auto_159698 ?auto_159706 ) ) ( not ( = ?auto_159698 ?auto_159705 ) ) ( not ( = ?auto_159698 ?auto_159704 ) ) ( not ( = ?auto_159698 ?auto_159702 ) ) ( not ( = ?auto_159698 ?auto_159703 ) ) ( not ( = ?auto_159700 ?auto_159706 ) ) ( not ( = ?auto_159700 ?auto_159705 ) ) ( not ( = ?auto_159700 ?auto_159704 ) ) ( not ( = ?auto_159700 ?auto_159702 ) ) ( not ( = ?auto_159700 ?auto_159703 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_159706 ?auto_159705 ?auto_159704 ?auto_159702 ?auto_159703 ?auto_159701 ?auto_159699 )
      ( MAKE-2PILE ?auto_159698 ?auto_159699 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159707 - BLOCK
      ?auto_159708 - BLOCK
    )
    :vars
    (
      ?auto_159709 - BLOCK
      ?auto_159713 - BLOCK
      ?auto_159712 - BLOCK
      ?auto_159711 - BLOCK
      ?auto_159710 - BLOCK
      ?auto_159715 - BLOCK
      ?auto_159714 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159707 ?auto_159708 ) ) ( not ( = ?auto_159707 ?auto_159709 ) ) ( not ( = ?auto_159708 ?auto_159709 ) ) ( ON ?auto_159707 ?auto_159713 ) ( not ( = ?auto_159707 ?auto_159713 ) ) ( not ( = ?auto_159708 ?auto_159713 ) ) ( not ( = ?auto_159709 ?auto_159713 ) ) ( CLEAR ?auto_159709 ) ( ON-TABLE ?auto_159712 ) ( ON ?auto_159711 ?auto_159712 ) ( ON ?auto_159710 ?auto_159711 ) ( ON ?auto_159715 ?auto_159710 ) ( ON ?auto_159714 ?auto_159715 ) ( ON ?auto_159709 ?auto_159714 ) ( not ( = ?auto_159712 ?auto_159711 ) ) ( not ( = ?auto_159712 ?auto_159710 ) ) ( not ( = ?auto_159712 ?auto_159715 ) ) ( not ( = ?auto_159712 ?auto_159714 ) ) ( not ( = ?auto_159712 ?auto_159709 ) ) ( not ( = ?auto_159712 ?auto_159708 ) ) ( not ( = ?auto_159711 ?auto_159710 ) ) ( not ( = ?auto_159711 ?auto_159715 ) ) ( not ( = ?auto_159711 ?auto_159714 ) ) ( not ( = ?auto_159711 ?auto_159709 ) ) ( not ( = ?auto_159711 ?auto_159708 ) ) ( not ( = ?auto_159710 ?auto_159715 ) ) ( not ( = ?auto_159710 ?auto_159714 ) ) ( not ( = ?auto_159710 ?auto_159709 ) ) ( not ( = ?auto_159710 ?auto_159708 ) ) ( not ( = ?auto_159715 ?auto_159714 ) ) ( not ( = ?auto_159715 ?auto_159709 ) ) ( not ( = ?auto_159715 ?auto_159708 ) ) ( not ( = ?auto_159714 ?auto_159709 ) ) ( not ( = ?auto_159714 ?auto_159708 ) ) ( not ( = ?auto_159707 ?auto_159712 ) ) ( not ( = ?auto_159707 ?auto_159711 ) ) ( not ( = ?auto_159707 ?auto_159710 ) ) ( not ( = ?auto_159707 ?auto_159715 ) ) ( not ( = ?auto_159707 ?auto_159714 ) ) ( not ( = ?auto_159713 ?auto_159712 ) ) ( not ( = ?auto_159713 ?auto_159711 ) ) ( not ( = ?auto_159713 ?auto_159710 ) ) ( not ( = ?auto_159713 ?auto_159715 ) ) ( not ( = ?auto_159713 ?auto_159714 ) ) ( ON ?auto_159708 ?auto_159707 ) ( CLEAR ?auto_159708 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_159713 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_159713 ?auto_159707 )
      ( MAKE-2PILE ?auto_159707 ?auto_159708 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159716 - BLOCK
      ?auto_159717 - BLOCK
    )
    :vars
    (
      ?auto_159719 - BLOCK
      ?auto_159723 - BLOCK
      ?auto_159720 - BLOCK
      ?auto_159718 - BLOCK
      ?auto_159721 - BLOCK
      ?auto_159724 - BLOCK
      ?auto_159722 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159716 ?auto_159717 ) ) ( not ( = ?auto_159716 ?auto_159719 ) ) ( not ( = ?auto_159717 ?auto_159719 ) ) ( ON ?auto_159716 ?auto_159723 ) ( not ( = ?auto_159716 ?auto_159723 ) ) ( not ( = ?auto_159717 ?auto_159723 ) ) ( not ( = ?auto_159719 ?auto_159723 ) ) ( ON-TABLE ?auto_159720 ) ( ON ?auto_159718 ?auto_159720 ) ( ON ?auto_159721 ?auto_159718 ) ( ON ?auto_159724 ?auto_159721 ) ( ON ?auto_159722 ?auto_159724 ) ( not ( = ?auto_159720 ?auto_159718 ) ) ( not ( = ?auto_159720 ?auto_159721 ) ) ( not ( = ?auto_159720 ?auto_159724 ) ) ( not ( = ?auto_159720 ?auto_159722 ) ) ( not ( = ?auto_159720 ?auto_159719 ) ) ( not ( = ?auto_159720 ?auto_159717 ) ) ( not ( = ?auto_159718 ?auto_159721 ) ) ( not ( = ?auto_159718 ?auto_159724 ) ) ( not ( = ?auto_159718 ?auto_159722 ) ) ( not ( = ?auto_159718 ?auto_159719 ) ) ( not ( = ?auto_159718 ?auto_159717 ) ) ( not ( = ?auto_159721 ?auto_159724 ) ) ( not ( = ?auto_159721 ?auto_159722 ) ) ( not ( = ?auto_159721 ?auto_159719 ) ) ( not ( = ?auto_159721 ?auto_159717 ) ) ( not ( = ?auto_159724 ?auto_159722 ) ) ( not ( = ?auto_159724 ?auto_159719 ) ) ( not ( = ?auto_159724 ?auto_159717 ) ) ( not ( = ?auto_159722 ?auto_159719 ) ) ( not ( = ?auto_159722 ?auto_159717 ) ) ( not ( = ?auto_159716 ?auto_159720 ) ) ( not ( = ?auto_159716 ?auto_159718 ) ) ( not ( = ?auto_159716 ?auto_159721 ) ) ( not ( = ?auto_159716 ?auto_159724 ) ) ( not ( = ?auto_159716 ?auto_159722 ) ) ( not ( = ?auto_159723 ?auto_159720 ) ) ( not ( = ?auto_159723 ?auto_159718 ) ) ( not ( = ?auto_159723 ?auto_159721 ) ) ( not ( = ?auto_159723 ?auto_159724 ) ) ( not ( = ?auto_159723 ?auto_159722 ) ) ( ON ?auto_159717 ?auto_159716 ) ( CLEAR ?auto_159717 ) ( ON-TABLE ?auto_159723 ) ( HOLDING ?auto_159719 ) ( CLEAR ?auto_159722 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_159720 ?auto_159718 ?auto_159721 ?auto_159724 ?auto_159722 ?auto_159719 )
      ( MAKE-2PILE ?auto_159716 ?auto_159717 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159725 - BLOCK
      ?auto_159726 - BLOCK
    )
    :vars
    (
      ?auto_159729 - BLOCK
      ?auto_159733 - BLOCK
      ?auto_159727 - BLOCK
      ?auto_159730 - BLOCK
      ?auto_159728 - BLOCK
      ?auto_159732 - BLOCK
      ?auto_159731 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159725 ?auto_159726 ) ) ( not ( = ?auto_159725 ?auto_159729 ) ) ( not ( = ?auto_159726 ?auto_159729 ) ) ( ON ?auto_159725 ?auto_159733 ) ( not ( = ?auto_159725 ?auto_159733 ) ) ( not ( = ?auto_159726 ?auto_159733 ) ) ( not ( = ?auto_159729 ?auto_159733 ) ) ( ON-TABLE ?auto_159727 ) ( ON ?auto_159730 ?auto_159727 ) ( ON ?auto_159728 ?auto_159730 ) ( ON ?auto_159732 ?auto_159728 ) ( ON ?auto_159731 ?auto_159732 ) ( not ( = ?auto_159727 ?auto_159730 ) ) ( not ( = ?auto_159727 ?auto_159728 ) ) ( not ( = ?auto_159727 ?auto_159732 ) ) ( not ( = ?auto_159727 ?auto_159731 ) ) ( not ( = ?auto_159727 ?auto_159729 ) ) ( not ( = ?auto_159727 ?auto_159726 ) ) ( not ( = ?auto_159730 ?auto_159728 ) ) ( not ( = ?auto_159730 ?auto_159732 ) ) ( not ( = ?auto_159730 ?auto_159731 ) ) ( not ( = ?auto_159730 ?auto_159729 ) ) ( not ( = ?auto_159730 ?auto_159726 ) ) ( not ( = ?auto_159728 ?auto_159732 ) ) ( not ( = ?auto_159728 ?auto_159731 ) ) ( not ( = ?auto_159728 ?auto_159729 ) ) ( not ( = ?auto_159728 ?auto_159726 ) ) ( not ( = ?auto_159732 ?auto_159731 ) ) ( not ( = ?auto_159732 ?auto_159729 ) ) ( not ( = ?auto_159732 ?auto_159726 ) ) ( not ( = ?auto_159731 ?auto_159729 ) ) ( not ( = ?auto_159731 ?auto_159726 ) ) ( not ( = ?auto_159725 ?auto_159727 ) ) ( not ( = ?auto_159725 ?auto_159730 ) ) ( not ( = ?auto_159725 ?auto_159728 ) ) ( not ( = ?auto_159725 ?auto_159732 ) ) ( not ( = ?auto_159725 ?auto_159731 ) ) ( not ( = ?auto_159733 ?auto_159727 ) ) ( not ( = ?auto_159733 ?auto_159730 ) ) ( not ( = ?auto_159733 ?auto_159728 ) ) ( not ( = ?auto_159733 ?auto_159732 ) ) ( not ( = ?auto_159733 ?auto_159731 ) ) ( ON ?auto_159726 ?auto_159725 ) ( ON-TABLE ?auto_159733 ) ( CLEAR ?auto_159731 ) ( ON ?auto_159729 ?auto_159726 ) ( CLEAR ?auto_159729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_159733 ?auto_159725 ?auto_159726 )
      ( MAKE-2PILE ?auto_159725 ?auto_159726 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159734 - BLOCK
      ?auto_159735 - BLOCK
    )
    :vars
    (
      ?auto_159741 - BLOCK
      ?auto_159738 - BLOCK
      ?auto_159736 - BLOCK
      ?auto_159740 - BLOCK
      ?auto_159742 - BLOCK
      ?auto_159737 - BLOCK
      ?auto_159739 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159734 ?auto_159735 ) ) ( not ( = ?auto_159734 ?auto_159741 ) ) ( not ( = ?auto_159735 ?auto_159741 ) ) ( ON ?auto_159734 ?auto_159738 ) ( not ( = ?auto_159734 ?auto_159738 ) ) ( not ( = ?auto_159735 ?auto_159738 ) ) ( not ( = ?auto_159741 ?auto_159738 ) ) ( ON-TABLE ?auto_159736 ) ( ON ?auto_159740 ?auto_159736 ) ( ON ?auto_159742 ?auto_159740 ) ( ON ?auto_159737 ?auto_159742 ) ( not ( = ?auto_159736 ?auto_159740 ) ) ( not ( = ?auto_159736 ?auto_159742 ) ) ( not ( = ?auto_159736 ?auto_159737 ) ) ( not ( = ?auto_159736 ?auto_159739 ) ) ( not ( = ?auto_159736 ?auto_159741 ) ) ( not ( = ?auto_159736 ?auto_159735 ) ) ( not ( = ?auto_159740 ?auto_159742 ) ) ( not ( = ?auto_159740 ?auto_159737 ) ) ( not ( = ?auto_159740 ?auto_159739 ) ) ( not ( = ?auto_159740 ?auto_159741 ) ) ( not ( = ?auto_159740 ?auto_159735 ) ) ( not ( = ?auto_159742 ?auto_159737 ) ) ( not ( = ?auto_159742 ?auto_159739 ) ) ( not ( = ?auto_159742 ?auto_159741 ) ) ( not ( = ?auto_159742 ?auto_159735 ) ) ( not ( = ?auto_159737 ?auto_159739 ) ) ( not ( = ?auto_159737 ?auto_159741 ) ) ( not ( = ?auto_159737 ?auto_159735 ) ) ( not ( = ?auto_159739 ?auto_159741 ) ) ( not ( = ?auto_159739 ?auto_159735 ) ) ( not ( = ?auto_159734 ?auto_159736 ) ) ( not ( = ?auto_159734 ?auto_159740 ) ) ( not ( = ?auto_159734 ?auto_159742 ) ) ( not ( = ?auto_159734 ?auto_159737 ) ) ( not ( = ?auto_159734 ?auto_159739 ) ) ( not ( = ?auto_159738 ?auto_159736 ) ) ( not ( = ?auto_159738 ?auto_159740 ) ) ( not ( = ?auto_159738 ?auto_159742 ) ) ( not ( = ?auto_159738 ?auto_159737 ) ) ( not ( = ?auto_159738 ?auto_159739 ) ) ( ON ?auto_159735 ?auto_159734 ) ( ON-TABLE ?auto_159738 ) ( ON ?auto_159741 ?auto_159735 ) ( CLEAR ?auto_159741 ) ( HOLDING ?auto_159739 ) ( CLEAR ?auto_159737 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_159736 ?auto_159740 ?auto_159742 ?auto_159737 ?auto_159739 )
      ( MAKE-2PILE ?auto_159734 ?auto_159735 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159743 - BLOCK
      ?auto_159744 - BLOCK
    )
    :vars
    (
      ?auto_159751 - BLOCK
      ?auto_159748 - BLOCK
      ?auto_159747 - BLOCK
      ?auto_159749 - BLOCK
      ?auto_159746 - BLOCK
      ?auto_159750 - BLOCK
      ?auto_159745 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159743 ?auto_159744 ) ) ( not ( = ?auto_159743 ?auto_159751 ) ) ( not ( = ?auto_159744 ?auto_159751 ) ) ( ON ?auto_159743 ?auto_159748 ) ( not ( = ?auto_159743 ?auto_159748 ) ) ( not ( = ?auto_159744 ?auto_159748 ) ) ( not ( = ?auto_159751 ?auto_159748 ) ) ( ON-TABLE ?auto_159747 ) ( ON ?auto_159749 ?auto_159747 ) ( ON ?auto_159746 ?auto_159749 ) ( ON ?auto_159750 ?auto_159746 ) ( not ( = ?auto_159747 ?auto_159749 ) ) ( not ( = ?auto_159747 ?auto_159746 ) ) ( not ( = ?auto_159747 ?auto_159750 ) ) ( not ( = ?auto_159747 ?auto_159745 ) ) ( not ( = ?auto_159747 ?auto_159751 ) ) ( not ( = ?auto_159747 ?auto_159744 ) ) ( not ( = ?auto_159749 ?auto_159746 ) ) ( not ( = ?auto_159749 ?auto_159750 ) ) ( not ( = ?auto_159749 ?auto_159745 ) ) ( not ( = ?auto_159749 ?auto_159751 ) ) ( not ( = ?auto_159749 ?auto_159744 ) ) ( not ( = ?auto_159746 ?auto_159750 ) ) ( not ( = ?auto_159746 ?auto_159745 ) ) ( not ( = ?auto_159746 ?auto_159751 ) ) ( not ( = ?auto_159746 ?auto_159744 ) ) ( not ( = ?auto_159750 ?auto_159745 ) ) ( not ( = ?auto_159750 ?auto_159751 ) ) ( not ( = ?auto_159750 ?auto_159744 ) ) ( not ( = ?auto_159745 ?auto_159751 ) ) ( not ( = ?auto_159745 ?auto_159744 ) ) ( not ( = ?auto_159743 ?auto_159747 ) ) ( not ( = ?auto_159743 ?auto_159749 ) ) ( not ( = ?auto_159743 ?auto_159746 ) ) ( not ( = ?auto_159743 ?auto_159750 ) ) ( not ( = ?auto_159743 ?auto_159745 ) ) ( not ( = ?auto_159748 ?auto_159747 ) ) ( not ( = ?auto_159748 ?auto_159749 ) ) ( not ( = ?auto_159748 ?auto_159746 ) ) ( not ( = ?auto_159748 ?auto_159750 ) ) ( not ( = ?auto_159748 ?auto_159745 ) ) ( ON ?auto_159744 ?auto_159743 ) ( ON-TABLE ?auto_159748 ) ( ON ?auto_159751 ?auto_159744 ) ( CLEAR ?auto_159750 ) ( ON ?auto_159745 ?auto_159751 ) ( CLEAR ?auto_159745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_159748 ?auto_159743 ?auto_159744 ?auto_159751 )
      ( MAKE-2PILE ?auto_159743 ?auto_159744 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159752 - BLOCK
      ?auto_159753 - BLOCK
    )
    :vars
    (
      ?auto_159755 - BLOCK
      ?auto_159758 - BLOCK
      ?auto_159759 - BLOCK
      ?auto_159756 - BLOCK
      ?auto_159757 - BLOCK
      ?auto_159760 - BLOCK
      ?auto_159754 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159752 ?auto_159753 ) ) ( not ( = ?auto_159752 ?auto_159755 ) ) ( not ( = ?auto_159753 ?auto_159755 ) ) ( ON ?auto_159752 ?auto_159758 ) ( not ( = ?auto_159752 ?auto_159758 ) ) ( not ( = ?auto_159753 ?auto_159758 ) ) ( not ( = ?auto_159755 ?auto_159758 ) ) ( ON-TABLE ?auto_159759 ) ( ON ?auto_159756 ?auto_159759 ) ( ON ?auto_159757 ?auto_159756 ) ( not ( = ?auto_159759 ?auto_159756 ) ) ( not ( = ?auto_159759 ?auto_159757 ) ) ( not ( = ?auto_159759 ?auto_159760 ) ) ( not ( = ?auto_159759 ?auto_159754 ) ) ( not ( = ?auto_159759 ?auto_159755 ) ) ( not ( = ?auto_159759 ?auto_159753 ) ) ( not ( = ?auto_159756 ?auto_159757 ) ) ( not ( = ?auto_159756 ?auto_159760 ) ) ( not ( = ?auto_159756 ?auto_159754 ) ) ( not ( = ?auto_159756 ?auto_159755 ) ) ( not ( = ?auto_159756 ?auto_159753 ) ) ( not ( = ?auto_159757 ?auto_159760 ) ) ( not ( = ?auto_159757 ?auto_159754 ) ) ( not ( = ?auto_159757 ?auto_159755 ) ) ( not ( = ?auto_159757 ?auto_159753 ) ) ( not ( = ?auto_159760 ?auto_159754 ) ) ( not ( = ?auto_159760 ?auto_159755 ) ) ( not ( = ?auto_159760 ?auto_159753 ) ) ( not ( = ?auto_159754 ?auto_159755 ) ) ( not ( = ?auto_159754 ?auto_159753 ) ) ( not ( = ?auto_159752 ?auto_159759 ) ) ( not ( = ?auto_159752 ?auto_159756 ) ) ( not ( = ?auto_159752 ?auto_159757 ) ) ( not ( = ?auto_159752 ?auto_159760 ) ) ( not ( = ?auto_159752 ?auto_159754 ) ) ( not ( = ?auto_159758 ?auto_159759 ) ) ( not ( = ?auto_159758 ?auto_159756 ) ) ( not ( = ?auto_159758 ?auto_159757 ) ) ( not ( = ?auto_159758 ?auto_159760 ) ) ( not ( = ?auto_159758 ?auto_159754 ) ) ( ON ?auto_159753 ?auto_159752 ) ( ON-TABLE ?auto_159758 ) ( ON ?auto_159755 ?auto_159753 ) ( ON ?auto_159754 ?auto_159755 ) ( CLEAR ?auto_159754 ) ( HOLDING ?auto_159760 ) ( CLEAR ?auto_159757 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_159759 ?auto_159756 ?auto_159757 ?auto_159760 )
      ( MAKE-2PILE ?auto_159752 ?auto_159753 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159761 - BLOCK
      ?auto_159762 - BLOCK
    )
    :vars
    (
      ?auto_159766 - BLOCK
      ?auto_159767 - BLOCK
      ?auto_159764 - BLOCK
      ?auto_159768 - BLOCK
      ?auto_159769 - BLOCK
      ?auto_159765 - BLOCK
      ?auto_159763 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159761 ?auto_159762 ) ) ( not ( = ?auto_159761 ?auto_159766 ) ) ( not ( = ?auto_159762 ?auto_159766 ) ) ( ON ?auto_159761 ?auto_159767 ) ( not ( = ?auto_159761 ?auto_159767 ) ) ( not ( = ?auto_159762 ?auto_159767 ) ) ( not ( = ?auto_159766 ?auto_159767 ) ) ( ON-TABLE ?auto_159764 ) ( ON ?auto_159768 ?auto_159764 ) ( ON ?auto_159769 ?auto_159768 ) ( not ( = ?auto_159764 ?auto_159768 ) ) ( not ( = ?auto_159764 ?auto_159769 ) ) ( not ( = ?auto_159764 ?auto_159765 ) ) ( not ( = ?auto_159764 ?auto_159763 ) ) ( not ( = ?auto_159764 ?auto_159766 ) ) ( not ( = ?auto_159764 ?auto_159762 ) ) ( not ( = ?auto_159768 ?auto_159769 ) ) ( not ( = ?auto_159768 ?auto_159765 ) ) ( not ( = ?auto_159768 ?auto_159763 ) ) ( not ( = ?auto_159768 ?auto_159766 ) ) ( not ( = ?auto_159768 ?auto_159762 ) ) ( not ( = ?auto_159769 ?auto_159765 ) ) ( not ( = ?auto_159769 ?auto_159763 ) ) ( not ( = ?auto_159769 ?auto_159766 ) ) ( not ( = ?auto_159769 ?auto_159762 ) ) ( not ( = ?auto_159765 ?auto_159763 ) ) ( not ( = ?auto_159765 ?auto_159766 ) ) ( not ( = ?auto_159765 ?auto_159762 ) ) ( not ( = ?auto_159763 ?auto_159766 ) ) ( not ( = ?auto_159763 ?auto_159762 ) ) ( not ( = ?auto_159761 ?auto_159764 ) ) ( not ( = ?auto_159761 ?auto_159768 ) ) ( not ( = ?auto_159761 ?auto_159769 ) ) ( not ( = ?auto_159761 ?auto_159765 ) ) ( not ( = ?auto_159761 ?auto_159763 ) ) ( not ( = ?auto_159767 ?auto_159764 ) ) ( not ( = ?auto_159767 ?auto_159768 ) ) ( not ( = ?auto_159767 ?auto_159769 ) ) ( not ( = ?auto_159767 ?auto_159765 ) ) ( not ( = ?auto_159767 ?auto_159763 ) ) ( ON ?auto_159762 ?auto_159761 ) ( ON-TABLE ?auto_159767 ) ( ON ?auto_159766 ?auto_159762 ) ( ON ?auto_159763 ?auto_159766 ) ( CLEAR ?auto_159769 ) ( ON ?auto_159765 ?auto_159763 ) ( CLEAR ?auto_159765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_159767 ?auto_159761 ?auto_159762 ?auto_159766 ?auto_159763 )
      ( MAKE-2PILE ?auto_159761 ?auto_159762 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159770 - BLOCK
      ?auto_159771 - BLOCK
    )
    :vars
    (
      ?auto_159778 - BLOCK
      ?auto_159774 - BLOCK
      ?auto_159777 - BLOCK
      ?auto_159773 - BLOCK
      ?auto_159772 - BLOCK
      ?auto_159776 - BLOCK
      ?auto_159775 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159770 ?auto_159771 ) ) ( not ( = ?auto_159770 ?auto_159778 ) ) ( not ( = ?auto_159771 ?auto_159778 ) ) ( ON ?auto_159770 ?auto_159774 ) ( not ( = ?auto_159770 ?auto_159774 ) ) ( not ( = ?auto_159771 ?auto_159774 ) ) ( not ( = ?auto_159778 ?auto_159774 ) ) ( ON-TABLE ?auto_159777 ) ( ON ?auto_159773 ?auto_159777 ) ( not ( = ?auto_159777 ?auto_159773 ) ) ( not ( = ?auto_159777 ?auto_159772 ) ) ( not ( = ?auto_159777 ?auto_159776 ) ) ( not ( = ?auto_159777 ?auto_159775 ) ) ( not ( = ?auto_159777 ?auto_159778 ) ) ( not ( = ?auto_159777 ?auto_159771 ) ) ( not ( = ?auto_159773 ?auto_159772 ) ) ( not ( = ?auto_159773 ?auto_159776 ) ) ( not ( = ?auto_159773 ?auto_159775 ) ) ( not ( = ?auto_159773 ?auto_159778 ) ) ( not ( = ?auto_159773 ?auto_159771 ) ) ( not ( = ?auto_159772 ?auto_159776 ) ) ( not ( = ?auto_159772 ?auto_159775 ) ) ( not ( = ?auto_159772 ?auto_159778 ) ) ( not ( = ?auto_159772 ?auto_159771 ) ) ( not ( = ?auto_159776 ?auto_159775 ) ) ( not ( = ?auto_159776 ?auto_159778 ) ) ( not ( = ?auto_159776 ?auto_159771 ) ) ( not ( = ?auto_159775 ?auto_159778 ) ) ( not ( = ?auto_159775 ?auto_159771 ) ) ( not ( = ?auto_159770 ?auto_159777 ) ) ( not ( = ?auto_159770 ?auto_159773 ) ) ( not ( = ?auto_159770 ?auto_159772 ) ) ( not ( = ?auto_159770 ?auto_159776 ) ) ( not ( = ?auto_159770 ?auto_159775 ) ) ( not ( = ?auto_159774 ?auto_159777 ) ) ( not ( = ?auto_159774 ?auto_159773 ) ) ( not ( = ?auto_159774 ?auto_159772 ) ) ( not ( = ?auto_159774 ?auto_159776 ) ) ( not ( = ?auto_159774 ?auto_159775 ) ) ( ON ?auto_159771 ?auto_159770 ) ( ON-TABLE ?auto_159774 ) ( ON ?auto_159778 ?auto_159771 ) ( ON ?auto_159775 ?auto_159778 ) ( ON ?auto_159776 ?auto_159775 ) ( CLEAR ?auto_159776 ) ( HOLDING ?auto_159772 ) ( CLEAR ?auto_159773 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_159777 ?auto_159773 ?auto_159772 )
      ( MAKE-2PILE ?auto_159770 ?auto_159771 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159779 - BLOCK
      ?auto_159780 - BLOCK
    )
    :vars
    (
      ?auto_159781 - BLOCK
      ?auto_159783 - BLOCK
      ?auto_159784 - BLOCK
      ?auto_159786 - BLOCK
      ?auto_159782 - BLOCK
      ?auto_159787 - BLOCK
      ?auto_159785 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159779 ?auto_159780 ) ) ( not ( = ?auto_159779 ?auto_159781 ) ) ( not ( = ?auto_159780 ?auto_159781 ) ) ( ON ?auto_159779 ?auto_159783 ) ( not ( = ?auto_159779 ?auto_159783 ) ) ( not ( = ?auto_159780 ?auto_159783 ) ) ( not ( = ?auto_159781 ?auto_159783 ) ) ( ON-TABLE ?auto_159784 ) ( ON ?auto_159786 ?auto_159784 ) ( not ( = ?auto_159784 ?auto_159786 ) ) ( not ( = ?auto_159784 ?auto_159782 ) ) ( not ( = ?auto_159784 ?auto_159787 ) ) ( not ( = ?auto_159784 ?auto_159785 ) ) ( not ( = ?auto_159784 ?auto_159781 ) ) ( not ( = ?auto_159784 ?auto_159780 ) ) ( not ( = ?auto_159786 ?auto_159782 ) ) ( not ( = ?auto_159786 ?auto_159787 ) ) ( not ( = ?auto_159786 ?auto_159785 ) ) ( not ( = ?auto_159786 ?auto_159781 ) ) ( not ( = ?auto_159786 ?auto_159780 ) ) ( not ( = ?auto_159782 ?auto_159787 ) ) ( not ( = ?auto_159782 ?auto_159785 ) ) ( not ( = ?auto_159782 ?auto_159781 ) ) ( not ( = ?auto_159782 ?auto_159780 ) ) ( not ( = ?auto_159787 ?auto_159785 ) ) ( not ( = ?auto_159787 ?auto_159781 ) ) ( not ( = ?auto_159787 ?auto_159780 ) ) ( not ( = ?auto_159785 ?auto_159781 ) ) ( not ( = ?auto_159785 ?auto_159780 ) ) ( not ( = ?auto_159779 ?auto_159784 ) ) ( not ( = ?auto_159779 ?auto_159786 ) ) ( not ( = ?auto_159779 ?auto_159782 ) ) ( not ( = ?auto_159779 ?auto_159787 ) ) ( not ( = ?auto_159779 ?auto_159785 ) ) ( not ( = ?auto_159783 ?auto_159784 ) ) ( not ( = ?auto_159783 ?auto_159786 ) ) ( not ( = ?auto_159783 ?auto_159782 ) ) ( not ( = ?auto_159783 ?auto_159787 ) ) ( not ( = ?auto_159783 ?auto_159785 ) ) ( ON ?auto_159780 ?auto_159779 ) ( ON-TABLE ?auto_159783 ) ( ON ?auto_159781 ?auto_159780 ) ( ON ?auto_159785 ?auto_159781 ) ( ON ?auto_159787 ?auto_159785 ) ( CLEAR ?auto_159786 ) ( ON ?auto_159782 ?auto_159787 ) ( CLEAR ?auto_159782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_159783 ?auto_159779 ?auto_159780 ?auto_159781 ?auto_159785 ?auto_159787 )
      ( MAKE-2PILE ?auto_159779 ?auto_159780 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159788 - BLOCK
      ?auto_159789 - BLOCK
    )
    :vars
    (
      ?auto_159793 - BLOCK
      ?auto_159792 - BLOCK
      ?auto_159791 - BLOCK
      ?auto_159796 - BLOCK
      ?auto_159795 - BLOCK
      ?auto_159794 - BLOCK
      ?auto_159790 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159788 ?auto_159789 ) ) ( not ( = ?auto_159788 ?auto_159793 ) ) ( not ( = ?auto_159789 ?auto_159793 ) ) ( ON ?auto_159788 ?auto_159792 ) ( not ( = ?auto_159788 ?auto_159792 ) ) ( not ( = ?auto_159789 ?auto_159792 ) ) ( not ( = ?auto_159793 ?auto_159792 ) ) ( ON-TABLE ?auto_159791 ) ( not ( = ?auto_159791 ?auto_159796 ) ) ( not ( = ?auto_159791 ?auto_159795 ) ) ( not ( = ?auto_159791 ?auto_159794 ) ) ( not ( = ?auto_159791 ?auto_159790 ) ) ( not ( = ?auto_159791 ?auto_159793 ) ) ( not ( = ?auto_159791 ?auto_159789 ) ) ( not ( = ?auto_159796 ?auto_159795 ) ) ( not ( = ?auto_159796 ?auto_159794 ) ) ( not ( = ?auto_159796 ?auto_159790 ) ) ( not ( = ?auto_159796 ?auto_159793 ) ) ( not ( = ?auto_159796 ?auto_159789 ) ) ( not ( = ?auto_159795 ?auto_159794 ) ) ( not ( = ?auto_159795 ?auto_159790 ) ) ( not ( = ?auto_159795 ?auto_159793 ) ) ( not ( = ?auto_159795 ?auto_159789 ) ) ( not ( = ?auto_159794 ?auto_159790 ) ) ( not ( = ?auto_159794 ?auto_159793 ) ) ( not ( = ?auto_159794 ?auto_159789 ) ) ( not ( = ?auto_159790 ?auto_159793 ) ) ( not ( = ?auto_159790 ?auto_159789 ) ) ( not ( = ?auto_159788 ?auto_159791 ) ) ( not ( = ?auto_159788 ?auto_159796 ) ) ( not ( = ?auto_159788 ?auto_159795 ) ) ( not ( = ?auto_159788 ?auto_159794 ) ) ( not ( = ?auto_159788 ?auto_159790 ) ) ( not ( = ?auto_159792 ?auto_159791 ) ) ( not ( = ?auto_159792 ?auto_159796 ) ) ( not ( = ?auto_159792 ?auto_159795 ) ) ( not ( = ?auto_159792 ?auto_159794 ) ) ( not ( = ?auto_159792 ?auto_159790 ) ) ( ON ?auto_159789 ?auto_159788 ) ( ON-TABLE ?auto_159792 ) ( ON ?auto_159793 ?auto_159789 ) ( ON ?auto_159790 ?auto_159793 ) ( ON ?auto_159794 ?auto_159790 ) ( ON ?auto_159795 ?auto_159794 ) ( CLEAR ?auto_159795 ) ( HOLDING ?auto_159796 ) ( CLEAR ?auto_159791 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_159791 ?auto_159796 )
      ( MAKE-2PILE ?auto_159788 ?auto_159789 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159797 - BLOCK
      ?auto_159798 - BLOCK
    )
    :vars
    (
      ?auto_159802 - BLOCK
      ?auto_159803 - BLOCK
      ?auto_159799 - BLOCK
      ?auto_159801 - BLOCK
      ?auto_159805 - BLOCK
      ?auto_159804 - BLOCK
      ?auto_159800 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159797 ?auto_159798 ) ) ( not ( = ?auto_159797 ?auto_159802 ) ) ( not ( = ?auto_159798 ?auto_159802 ) ) ( ON ?auto_159797 ?auto_159803 ) ( not ( = ?auto_159797 ?auto_159803 ) ) ( not ( = ?auto_159798 ?auto_159803 ) ) ( not ( = ?auto_159802 ?auto_159803 ) ) ( ON-TABLE ?auto_159799 ) ( not ( = ?auto_159799 ?auto_159801 ) ) ( not ( = ?auto_159799 ?auto_159805 ) ) ( not ( = ?auto_159799 ?auto_159804 ) ) ( not ( = ?auto_159799 ?auto_159800 ) ) ( not ( = ?auto_159799 ?auto_159802 ) ) ( not ( = ?auto_159799 ?auto_159798 ) ) ( not ( = ?auto_159801 ?auto_159805 ) ) ( not ( = ?auto_159801 ?auto_159804 ) ) ( not ( = ?auto_159801 ?auto_159800 ) ) ( not ( = ?auto_159801 ?auto_159802 ) ) ( not ( = ?auto_159801 ?auto_159798 ) ) ( not ( = ?auto_159805 ?auto_159804 ) ) ( not ( = ?auto_159805 ?auto_159800 ) ) ( not ( = ?auto_159805 ?auto_159802 ) ) ( not ( = ?auto_159805 ?auto_159798 ) ) ( not ( = ?auto_159804 ?auto_159800 ) ) ( not ( = ?auto_159804 ?auto_159802 ) ) ( not ( = ?auto_159804 ?auto_159798 ) ) ( not ( = ?auto_159800 ?auto_159802 ) ) ( not ( = ?auto_159800 ?auto_159798 ) ) ( not ( = ?auto_159797 ?auto_159799 ) ) ( not ( = ?auto_159797 ?auto_159801 ) ) ( not ( = ?auto_159797 ?auto_159805 ) ) ( not ( = ?auto_159797 ?auto_159804 ) ) ( not ( = ?auto_159797 ?auto_159800 ) ) ( not ( = ?auto_159803 ?auto_159799 ) ) ( not ( = ?auto_159803 ?auto_159801 ) ) ( not ( = ?auto_159803 ?auto_159805 ) ) ( not ( = ?auto_159803 ?auto_159804 ) ) ( not ( = ?auto_159803 ?auto_159800 ) ) ( ON ?auto_159798 ?auto_159797 ) ( ON-TABLE ?auto_159803 ) ( ON ?auto_159802 ?auto_159798 ) ( ON ?auto_159800 ?auto_159802 ) ( ON ?auto_159804 ?auto_159800 ) ( ON ?auto_159805 ?auto_159804 ) ( CLEAR ?auto_159799 ) ( ON ?auto_159801 ?auto_159805 ) ( CLEAR ?auto_159801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_159803 ?auto_159797 ?auto_159798 ?auto_159802 ?auto_159800 ?auto_159804 ?auto_159805 )
      ( MAKE-2PILE ?auto_159797 ?auto_159798 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159806 - BLOCK
      ?auto_159807 - BLOCK
    )
    :vars
    (
      ?auto_159812 - BLOCK
      ?auto_159813 - BLOCK
      ?auto_159810 - BLOCK
      ?auto_159808 - BLOCK
      ?auto_159809 - BLOCK
      ?auto_159814 - BLOCK
      ?auto_159811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159806 ?auto_159807 ) ) ( not ( = ?auto_159806 ?auto_159812 ) ) ( not ( = ?auto_159807 ?auto_159812 ) ) ( ON ?auto_159806 ?auto_159813 ) ( not ( = ?auto_159806 ?auto_159813 ) ) ( not ( = ?auto_159807 ?auto_159813 ) ) ( not ( = ?auto_159812 ?auto_159813 ) ) ( not ( = ?auto_159810 ?auto_159808 ) ) ( not ( = ?auto_159810 ?auto_159809 ) ) ( not ( = ?auto_159810 ?auto_159814 ) ) ( not ( = ?auto_159810 ?auto_159811 ) ) ( not ( = ?auto_159810 ?auto_159812 ) ) ( not ( = ?auto_159810 ?auto_159807 ) ) ( not ( = ?auto_159808 ?auto_159809 ) ) ( not ( = ?auto_159808 ?auto_159814 ) ) ( not ( = ?auto_159808 ?auto_159811 ) ) ( not ( = ?auto_159808 ?auto_159812 ) ) ( not ( = ?auto_159808 ?auto_159807 ) ) ( not ( = ?auto_159809 ?auto_159814 ) ) ( not ( = ?auto_159809 ?auto_159811 ) ) ( not ( = ?auto_159809 ?auto_159812 ) ) ( not ( = ?auto_159809 ?auto_159807 ) ) ( not ( = ?auto_159814 ?auto_159811 ) ) ( not ( = ?auto_159814 ?auto_159812 ) ) ( not ( = ?auto_159814 ?auto_159807 ) ) ( not ( = ?auto_159811 ?auto_159812 ) ) ( not ( = ?auto_159811 ?auto_159807 ) ) ( not ( = ?auto_159806 ?auto_159810 ) ) ( not ( = ?auto_159806 ?auto_159808 ) ) ( not ( = ?auto_159806 ?auto_159809 ) ) ( not ( = ?auto_159806 ?auto_159814 ) ) ( not ( = ?auto_159806 ?auto_159811 ) ) ( not ( = ?auto_159813 ?auto_159810 ) ) ( not ( = ?auto_159813 ?auto_159808 ) ) ( not ( = ?auto_159813 ?auto_159809 ) ) ( not ( = ?auto_159813 ?auto_159814 ) ) ( not ( = ?auto_159813 ?auto_159811 ) ) ( ON ?auto_159807 ?auto_159806 ) ( ON-TABLE ?auto_159813 ) ( ON ?auto_159812 ?auto_159807 ) ( ON ?auto_159811 ?auto_159812 ) ( ON ?auto_159814 ?auto_159811 ) ( ON ?auto_159809 ?auto_159814 ) ( ON ?auto_159808 ?auto_159809 ) ( CLEAR ?auto_159808 ) ( HOLDING ?auto_159810 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_159810 )
      ( MAKE-2PILE ?auto_159806 ?auto_159807 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159815 - BLOCK
      ?auto_159816 - BLOCK
    )
    :vars
    (
      ?auto_159818 - BLOCK
      ?auto_159820 - BLOCK
      ?auto_159821 - BLOCK
      ?auto_159817 - BLOCK
      ?auto_159822 - BLOCK
      ?auto_159819 - BLOCK
      ?auto_159823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159815 ?auto_159816 ) ) ( not ( = ?auto_159815 ?auto_159818 ) ) ( not ( = ?auto_159816 ?auto_159818 ) ) ( ON ?auto_159815 ?auto_159820 ) ( not ( = ?auto_159815 ?auto_159820 ) ) ( not ( = ?auto_159816 ?auto_159820 ) ) ( not ( = ?auto_159818 ?auto_159820 ) ) ( not ( = ?auto_159821 ?auto_159817 ) ) ( not ( = ?auto_159821 ?auto_159822 ) ) ( not ( = ?auto_159821 ?auto_159819 ) ) ( not ( = ?auto_159821 ?auto_159823 ) ) ( not ( = ?auto_159821 ?auto_159818 ) ) ( not ( = ?auto_159821 ?auto_159816 ) ) ( not ( = ?auto_159817 ?auto_159822 ) ) ( not ( = ?auto_159817 ?auto_159819 ) ) ( not ( = ?auto_159817 ?auto_159823 ) ) ( not ( = ?auto_159817 ?auto_159818 ) ) ( not ( = ?auto_159817 ?auto_159816 ) ) ( not ( = ?auto_159822 ?auto_159819 ) ) ( not ( = ?auto_159822 ?auto_159823 ) ) ( not ( = ?auto_159822 ?auto_159818 ) ) ( not ( = ?auto_159822 ?auto_159816 ) ) ( not ( = ?auto_159819 ?auto_159823 ) ) ( not ( = ?auto_159819 ?auto_159818 ) ) ( not ( = ?auto_159819 ?auto_159816 ) ) ( not ( = ?auto_159823 ?auto_159818 ) ) ( not ( = ?auto_159823 ?auto_159816 ) ) ( not ( = ?auto_159815 ?auto_159821 ) ) ( not ( = ?auto_159815 ?auto_159817 ) ) ( not ( = ?auto_159815 ?auto_159822 ) ) ( not ( = ?auto_159815 ?auto_159819 ) ) ( not ( = ?auto_159815 ?auto_159823 ) ) ( not ( = ?auto_159820 ?auto_159821 ) ) ( not ( = ?auto_159820 ?auto_159817 ) ) ( not ( = ?auto_159820 ?auto_159822 ) ) ( not ( = ?auto_159820 ?auto_159819 ) ) ( not ( = ?auto_159820 ?auto_159823 ) ) ( ON ?auto_159816 ?auto_159815 ) ( ON-TABLE ?auto_159820 ) ( ON ?auto_159818 ?auto_159816 ) ( ON ?auto_159823 ?auto_159818 ) ( ON ?auto_159819 ?auto_159823 ) ( ON ?auto_159822 ?auto_159819 ) ( ON ?auto_159817 ?auto_159822 ) ( ON ?auto_159821 ?auto_159817 ) ( CLEAR ?auto_159821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_159820 ?auto_159815 ?auto_159816 ?auto_159818 ?auto_159823 ?auto_159819 ?auto_159822 ?auto_159817 )
      ( MAKE-2PILE ?auto_159815 ?auto_159816 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_159851 - BLOCK
      ?auto_159852 - BLOCK
      ?auto_159853 - BLOCK
      ?auto_159854 - BLOCK
      ?auto_159855 - BLOCK
    )
    :vars
    (
      ?auto_159856 - BLOCK
      ?auto_159858 - BLOCK
      ?auto_159857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159856 ?auto_159855 ) ( ON-TABLE ?auto_159851 ) ( ON ?auto_159852 ?auto_159851 ) ( ON ?auto_159853 ?auto_159852 ) ( ON ?auto_159854 ?auto_159853 ) ( ON ?auto_159855 ?auto_159854 ) ( not ( = ?auto_159851 ?auto_159852 ) ) ( not ( = ?auto_159851 ?auto_159853 ) ) ( not ( = ?auto_159851 ?auto_159854 ) ) ( not ( = ?auto_159851 ?auto_159855 ) ) ( not ( = ?auto_159851 ?auto_159856 ) ) ( not ( = ?auto_159852 ?auto_159853 ) ) ( not ( = ?auto_159852 ?auto_159854 ) ) ( not ( = ?auto_159852 ?auto_159855 ) ) ( not ( = ?auto_159852 ?auto_159856 ) ) ( not ( = ?auto_159853 ?auto_159854 ) ) ( not ( = ?auto_159853 ?auto_159855 ) ) ( not ( = ?auto_159853 ?auto_159856 ) ) ( not ( = ?auto_159854 ?auto_159855 ) ) ( not ( = ?auto_159854 ?auto_159856 ) ) ( not ( = ?auto_159855 ?auto_159856 ) ) ( not ( = ?auto_159851 ?auto_159858 ) ) ( not ( = ?auto_159851 ?auto_159857 ) ) ( not ( = ?auto_159852 ?auto_159858 ) ) ( not ( = ?auto_159852 ?auto_159857 ) ) ( not ( = ?auto_159853 ?auto_159858 ) ) ( not ( = ?auto_159853 ?auto_159857 ) ) ( not ( = ?auto_159854 ?auto_159858 ) ) ( not ( = ?auto_159854 ?auto_159857 ) ) ( not ( = ?auto_159855 ?auto_159858 ) ) ( not ( = ?auto_159855 ?auto_159857 ) ) ( not ( = ?auto_159856 ?auto_159858 ) ) ( not ( = ?auto_159856 ?auto_159857 ) ) ( not ( = ?auto_159858 ?auto_159857 ) ) ( ON ?auto_159858 ?auto_159856 ) ( CLEAR ?auto_159858 ) ( HOLDING ?auto_159857 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_159857 )
      ( MAKE-5PILE ?auto_159851 ?auto_159852 ?auto_159853 ?auto_159854 ?auto_159855 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_159964 - BLOCK
      ?auto_159965 - BLOCK
      ?auto_159966 - BLOCK
    )
    :vars
    (
      ?auto_159967 - BLOCK
      ?auto_159969 - BLOCK
      ?auto_159971 - BLOCK
      ?auto_159970 - BLOCK
      ?auto_159968 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159964 ) ( not ( = ?auto_159964 ?auto_159965 ) ) ( not ( = ?auto_159964 ?auto_159966 ) ) ( not ( = ?auto_159965 ?auto_159966 ) ) ( ON ?auto_159966 ?auto_159967 ) ( not ( = ?auto_159964 ?auto_159967 ) ) ( not ( = ?auto_159965 ?auto_159967 ) ) ( not ( = ?auto_159966 ?auto_159967 ) ) ( CLEAR ?auto_159964 ) ( ON ?auto_159965 ?auto_159966 ) ( CLEAR ?auto_159965 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_159969 ) ( ON ?auto_159971 ?auto_159969 ) ( ON ?auto_159970 ?auto_159971 ) ( ON ?auto_159968 ?auto_159970 ) ( ON ?auto_159967 ?auto_159968 ) ( not ( = ?auto_159969 ?auto_159971 ) ) ( not ( = ?auto_159969 ?auto_159970 ) ) ( not ( = ?auto_159969 ?auto_159968 ) ) ( not ( = ?auto_159969 ?auto_159967 ) ) ( not ( = ?auto_159969 ?auto_159966 ) ) ( not ( = ?auto_159969 ?auto_159965 ) ) ( not ( = ?auto_159971 ?auto_159970 ) ) ( not ( = ?auto_159971 ?auto_159968 ) ) ( not ( = ?auto_159971 ?auto_159967 ) ) ( not ( = ?auto_159971 ?auto_159966 ) ) ( not ( = ?auto_159971 ?auto_159965 ) ) ( not ( = ?auto_159970 ?auto_159968 ) ) ( not ( = ?auto_159970 ?auto_159967 ) ) ( not ( = ?auto_159970 ?auto_159966 ) ) ( not ( = ?auto_159970 ?auto_159965 ) ) ( not ( = ?auto_159968 ?auto_159967 ) ) ( not ( = ?auto_159968 ?auto_159966 ) ) ( not ( = ?auto_159968 ?auto_159965 ) ) ( not ( = ?auto_159964 ?auto_159969 ) ) ( not ( = ?auto_159964 ?auto_159971 ) ) ( not ( = ?auto_159964 ?auto_159970 ) ) ( not ( = ?auto_159964 ?auto_159968 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_159969 ?auto_159971 ?auto_159970 ?auto_159968 ?auto_159967 ?auto_159966 )
      ( MAKE-3PILE ?auto_159964 ?auto_159965 ?auto_159966 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_159972 - BLOCK
      ?auto_159973 - BLOCK
      ?auto_159974 - BLOCK
    )
    :vars
    (
      ?auto_159977 - BLOCK
      ?auto_159979 - BLOCK
      ?auto_159978 - BLOCK
      ?auto_159976 - BLOCK
      ?auto_159975 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159972 ?auto_159973 ) ) ( not ( = ?auto_159972 ?auto_159974 ) ) ( not ( = ?auto_159973 ?auto_159974 ) ) ( ON ?auto_159974 ?auto_159977 ) ( not ( = ?auto_159972 ?auto_159977 ) ) ( not ( = ?auto_159973 ?auto_159977 ) ) ( not ( = ?auto_159974 ?auto_159977 ) ) ( ON ?auto_159973 ?auto_159974 ) ( CLEAR ?auto_159973 ) ( ON-TABLE ?auto_159979 ) ( ON ?auto_159978 ?auto_159979 ) ( ON ?auto_159976 ?auto_159978 ) ( ON ?auto_159975 ?auto_159976 ) ( ON ?auto_159977 ?auto_159975 ) ( not ( = ?auto_159979 ?auto_159978 ) ) ( not ( = ?auto_159979 ?auto_159976 ) ) ( not ( = ?auto_159979 ?auto_159975 ) ) ( not ( = ?auto_159979 ?auto_159977 ) ) ( not ( = ?auto_159979 ?auto_159974 ) ) ( not ( = ?auto_159979 ?auto_159973 ) ) ( not ( = ?auto_159978 ?auto_159976 ) ) ( not ( = ?auto_159978 ?auto_159975 ) ) ( not ( = ?auto_159978 ?auto_159977 ) ) ( not ( = ?auto_159978 ?auto_159974 ) ) ( not ( = ?auto_159978 ?auto_159973 ) ) ( not ( = ?auto_159976 ?auto_159975 ) ) ( not ( = ?auto_159976 ?auto_159977 ) ) ( not ( = ?auto_159976 ?auto_159974 ) ) ( not ( = ?auto_159976 ?auto_159973 ) ) ( not ( = ?auto_159975 ?auto_159977 ) ) ( not ( = ?auto_159975 ?auto_159974 ) ) ( not ( = ?auto_159975 ?auto_159973 ) ) ( not ( = ?auto_159972 ?auto_159979 ) ) ( not ( = ?auto_159972 ?auto_159978 ) ) ( not ( = ?auto_159972 ?auto_159976 ) ) ( not ( = ?auto_159972 ?auto_159975 ) ) ( HOLDING ?auto_159972 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_159972 )
      ( MAKE-3PILE ?auto_159972 ?auto_159973 ?auto_159974 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_159980 - BLOCK
      ?auto_159981 - BLOCK
      ?auto_159982 - BLOCK
    )
    :vars
    (
      ?auto_159983 - BLOCK
      ?auto_159985 - BLOCK
      ?auto_159986 - BLOCK
      ?auto_159984 - BLOCK
      ?auto_159987 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159980 ?auto_159981 ) ) ( not ( = ?auto_159980 ?auto_159982 ) ) ( not ( = ?auto_159981 ?auto_159982 ) ) ( ON ?auto_159982 ?auto_159983 ) ( not ( = ?auto_159980 ?auto_159983 ) ) ( not ( = ?auto_159981 ?auto_159983 ) ) ( not ( = ?auto_159982 ?auto_159983 ) ) ( ON ?auto_159981 ?auto_159982 ) ( ON-TABLE ?auto_159985 ) ( ON ?auto_159986 ?auto_159985 ) ( ON ?auto_159984 ?auto_159986 ) ( ON ?auto_159987 ?auto_159984 ) ( ON ?auto_159983 ?auto_159987 ) ( not ( = ?auto_159985 ?auto_159986 ) ) ( not ( = ?auto_159985 ?auto_159984 ) ) ( not ( = ?auto_159985 ?auto_159987 ) ) ( not ( = ?auto_159985 ?auto_159983 ) ) ( not ( = ?auto_159985 ?auto_159982 ) ) ( not ( = ?auto_159985 ?auto_159981 ) ) ( not ( = ?auto_159986 ?auto_159984 ) ) ( not ( = ?auto_159986 ?auto_159987 ) ) ( not ( = ?auto_159986 ?auto_159983 ) ) ( not ( = ?auto_159986 ?auto_159982 ) ) ( not ( = ?auto_159986 ?auto_159981 ) ) ( not ( = ?auto_159984 ?auto_159987 ) ) ( not ( = ?auto_159984 ?auto_159983 ) ) ( not ( = ?auto_159984 ?auto_159982 ) ) ( not ( = ?auto_159984 ?auto_159981 ) ) ( not ( = ?auto_159987 ?auto_159983 ) ) ( not ( = ?auto_159987 ?auto_159982 ) ) ( not ( = ?auto_159987 ?auto_159981 ) ) ( not ( = ?auto_159980 ?auto_159985 ) ) ( not ( = ?auto_159980 ?auto_159986 ) ) ( not ( = ?auto_159980 ?auto_159984 ) ) ( not ( = ?auto_159980 ?auto_159987 ) ) ( ON ?auto_159980 ?auto_159981 ) ( CLEAR ?auto_159980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_159985 ?auto_159986 ?auto_159984 ?auto_159987 ?auto_159983 ?auto_159982 ?auto_159981 )
      ( MAKE-3PILE ?auto_159980 ?auto_159981 ?auto_159982 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_159991 - BLOCK
      ?auto_159992 - BLOCK
      ?auto_159993 - BLOCK
    )
    :vars
    (
      ?auto_159998 - BLOCK
      ?auto_159997 - BLOCK
      ?auto_159995 - BLOCK
      ?auto_159996 - BLOCK
      ?auto_159994 - BLOCK
      ?auto_159999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159991 ?auto_159992 ) ) ( not ( = ?auto_159991 ?auto_159993 ) ) ( not ( = ?auto_159992 ?auto_159993 ) ) ( ON ?auto_159993 ?auto_159998 ) ( not ( = ?auto_159991 ?auto_159998 ) ) ( not ( = ?auto_159992 ?auto_159998 ) ) ( not ( = ?auto_159993 ?auto_159998 ) ) ( ON ?auto_159992 ?auto_159993 ) ( CLEAR ?auto_159992 ) ( ON-TABLE ?auto_159997 ) ( ON ?auto_159995 ?auto_159997 ) ( ON ?auto_159996 ?auto_159995 ) ( ON ?auto_159994 ?auto_159996 ) ( ON ?auto_159998 ?auto_159994 ) ( not ( = ?auto_159997 ?auto_159995 ) ) ( not ( = ?auto_159997 ?auto_159996 ) ) ( not ( = ?auto_159997 ?auto_159994 ) ) ( not ( = ?auto_159997 ?auto_159998 ) ) ( not ( = ?auto_159997 ?auto_159993 ) ) ( not ( = ?auto_159997 ?auto_159992 ) ) ( not ( = ?auto_159995 ?auto_159996 ) ) ( not ( = ?auto_159995 ?auto_159994 ) ) ( not ( = ?auto_159995 ?auto_159998 ) ) ( not ( = ?auto_159995 ?auto_159993 ) ) ( not ( = ?auto_159995 ?auto_159992 ) ) ( not ( = ?auto_159996 ?auto_159994 ) ) ( not ( = ?auto_159996 ?auto_159998 ) ) ( not ( = ?auto_159996 ?auto_159993 ) ) ( not ( = ?auto_159996 ?auto_159992 ) ) ( not ( = ?auto_159994 ?auto_159998 ) ) ( not ( = ?auto_159994 ?auto_159993 ) ) ( not ( = ?auto_159994 ?auto_159992 ) ) ( not ( = ?auto_159991 ?auto_159997 ) ) ( not ( = ?auto_159991 ?auto_159995 ) ) ( not ( = ?auto_159991 ?auto_159996 ) ) ( not ( = ?auto_159991 ?auto_159994 ) ) ( ON ?auto_159991 ?auto_159999 ) ( CLEAR ?auto_159991 ) ( HAND-EMPTY ) ( not ( = ?auto_159991 ?auto_159999 ) ) ( not ( = ?auto_159992 ?auto_159999 ) ) ( not ( = ?auto_159993 ?auto_159999 ) ) ( not ( = ?auto_159998 ?auto_159999 ) ) ( not ( = ?auto_159997 ?auto_159999 ) ) ( not ( = ?auto_159995 ?auto_159999 ) ) ( not ( = ?auto_159996 ?auto_159999 ) ) ( not ( = ?auto_159994 ?auto_159999 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_159991 ?auto_159999 )
      ( MAKE-3PILE ?auto_159991 ?auto_159992 ?auto_159993 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160000 - BLOCK
      ?auto_160001 - BLOCK
      ?auto_160002 - BLOCK
    )
    :vars
    (
      ?auto_160003 - BLOCK
      ?auto_160008 - BLOCK
      ?auto_160004 - BLOCK
      ?auto_160007 - BLOCK
      ?auto_160006 - BLOCK
      ?auto_160005 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160000 ?auto_160001 ) ) ( not ( = ?auto_160000 ?auto_160002 ) ) ( not ( = ?auto_160001 ?auto_160002 ) ) ( ON ?auto_160002 ?auto_160003 ) ( not ( = ?auto_160000 ?auto_160003 ) ) ( not ( = ?auto_160001 ?auto_160003 ) ) ( not ( = ?auto_160002 ?auto_160003 ) ) ( ON-TABLE ?auto_160008 ) ( ON ?auto_160004 ?auto_160008 ) ( ON ?auto_160007 ?auto_160004 ) ( ON ?auto_160006 ?auto_160007 ) ( ON ?auto_160003 ?auto_160006 ) ( not ( = ?auto_160008 ?auto_160004 ) ) ( not ( = ?auto_160008 ?auto_160007 ) ) ( not ( = ?auto_160008 ?auto_160006 ) ) ( not ( = ?auto_160008 ?auto_160003 ) ) ( not ( = ?auto_160008 ?auto_160002 ) ) ( not ( = ?auto_160008 ?auto_160001 ) ) ( not ( = ?auto_160004 ?auto_160007 ) ) ( not ( = ?auto_160004 ?auto_160006 ) ) ( not ( = ?auto_160004 ?auto_160003 ) ) ( not ( = ?auto_160004 ?auto_160002 ) ) ( not ( = ?auto_160004 ?auto_160001 ) ) ( not ( = ?auto_160007 ?auto_160006 ) ) ( not ( = ?auto_160007 ?auto_160003 ) ) ( not ( = ?auto_160007 ?auto_160002 ) ) ( not ( = ?auto_160007 ?auto_160001 ) ) ( not ( = ?auto_160006 ?auto_160003 ) ) ( not ( = ?auto_160006 ?auto_160002 ) ) ( not ( = ?auto_160006 ?auto_160001 ) ) ( not ( = ?auto_160000 ?auto_160008 ) ) ( not ( = ?auto_160000 ?auto_160004 ) ) ( not ( = ?auto_160000 ?auto_160007 ) ) ( not ( = ?auto_160000 ?auto_160006 ) ) ( ON ?auto_160000 ?auto_160005 ) ( CLEAR ?auto_160000 ) ( not ( = ?auto_160000 ?auto_160005 ) ) ( not ( = ?auto_160001 ?auto_160005 ) ) ( not ( = ?auto_160002 ?auto_160005 ) ) ( not ( = ?auto_160003 ?auto_160005 ) ) ( not ( = ?auto_160008 ?auto_160005 ) ) ( not ( = ?auto_160004 ?auto_160005 ) ) ( not ( = ?auto_160007 ?auto_160005 ) ) ( not ( = ?auto_160006 ?auto_160005 ) ) ( HOLDING ?auto_160001 ) ( CLEAR ?auto_160002 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160008 ?auto_160004 ?auto_160007 ?auto_160006 ?auto_160003 ?auto_160002 ?auto_160001 )
      ( MAKE-3PILE ?auto_160000 ?auto_160001 ?auto_160002 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160009 - BLOCK
      ?auto_160010 - BLOCK
      ?auto_160011 - BLOCK
    )
    :vars
    (
      ?auto_160015 - BLOCK
      ?auto_160013 - BLOCK
      ?auto_160017 - BLOCK
      ?auto_160012 - BLOCK
      ?auto_160014 - BLOCK
      ?auto_160016 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160009 ?auto_160010 ) ) ( not ( = ?auto_160009 ?auto_160011 ) ) ( not ( = ?auto_160010 ?auto_160011 ) ) ( ON ?auto_160011 ?auto_160015 ) ( not ( = ?auto_160009 ?auto_160015 ) ) ( not ( = ?auto_160010 ?auto_160015 ) ) ( not ( = ?auto_160011 ?auto_160015 ) ) ( ON-TABLE ?auto_160013 ) ( ON ?auto_160017 ?auto_160013 ) ( ON ?auto_160012 ?auto_160017 ) ( ON ?auto_160014 ?auto_160012 ) ( ON ?auto_160015 ?auto_160014 ) ( not ( = ?auto_160013 ?auto_160017 ) ) ( not ( = ?auto_160013 ?auto_160012 ) ) ( not ( = ?auto_160013 ?auto_160014 ) ) ( not ( = ?auto_160013 ?auto_160015 ) ) ( not ( = ?auto_160013 ?auto_160011 ) ) ( not ( = ?auto_160013 ?auto_160010 ) ) ( not ( = ?auto_160017 ?auto_160012 ) ) ( not ( = ?auto_160017 ?auto_160014 ) ) ( not ( = ?auto_160017 ?auto_160015 ) ) ( not ( = ?auto_160017 ?auto_160011 ) ) ( not ( = ?auto_160017 ?auto_160010 ) ) ( not ( = ?auto_160012 ?auto_160014 ) ) ( not ( = ?auto_160012 ?auto_160015 ) ) ( not ( = ?auto_160012 ?auto_160011 ) ) ( not ( = ?auto_160012 ?auto_160010 ) ) ( not ( = ?auto_160014 ?auto_160015 ) ) ( not ( = ?auto_160014 ?auto_160011 ) ) ( not ( = ?auto_160014 ?auto_160010 ) ) ( not ( = ?auto_160009 ?auto_160013 ) ) ( not ( = ?auto_160009 ?auto_160017 ) ) ( not ( = ?auto_160009 ?auto_160012 ) ) ( not ( = ?auto_160009 ?auto_160014 ) ) ( ON ?auto_160009 ?auto_160016 ) ( not ( = ?auto_160009 ?auto_160016 ) ) ( not ( = ?auto_160010 ?auto_160016 ) ) ( not ( = ?auto_160011 ?auto_160016 ) ) ( not ( = ?auto_160015 ?auto_160016 ) ) ( not ( = ?auto_160013 ?auto_160016 ) ) ( not ( = ?auto_160017 ?auto_160016 ) ) ( not ( = ?auto_160012 ?auto_160016 ) ) ( not ( = ?auto_160014 ?auto_160016 ) ) ( CLEAR ?auto_160011 ) ( ON ?auto_160010 ?auto_160009 ) ( CLEAR ?auto_160010 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_160016 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160016 ?auto_160009 )
      ( MAKE-3PILE ?auto_160009 ?auto_160010 ?auto_160011 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160018 - BLOCK
      ?auto_160019 - BLOCK
      ?auto_160020 - BLOCK
    )
    :vars
    (
      ?auto_160026 - BLOCK
      ?auto_160025 - BLOCK
      ?auto_160021 - BLOCK
      ?auto_160024 - BLOCK
      ?auto_160023 - BLOCK
      ?auto_160022 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160018 ?auto_160019 ) ) ( not ( = ?auto_160018 ?auto_160020 ) ) ( not ( = ?auto_160019 ?auto_160020 ) ) ( not ( = ?auto_160018 ?auto_160026 ) ) ( not ( = ?auto_160019 ?auto_160026 ) ) ( not ( = ?auto_160020 ?auto_160026 ) ) ( ON-TABLE ?auto_160025 ) ( ON ?auto_160021 ?auto_160025 ) ( ON ?auto_160024 ?auto_160021 ) ( ON ?auto_160023 ?auto_160024 ) ( ON ?auto_160026 ?auto_160023 ) ( not ( = ?auto_160025 ?auto_160021 ) ) ( not ( = ?auto_160025 ?auto_160024 ) ) ( not ( = ?auto_160025 ?auto_160023 ) ) ( not ( = ?auto_160025 ?auto_160026 ) ) ( not ( = ?auto_160025 ?auto_160020 ) ) ( not ( = ?auto_160025 ?auto_160019 ) ) ( not ( = ?auto_160021 ?auto_160024 ) ) ( not ( = ?auto_160021 ?auto_160023 ) ) ( not ( = ?auto_160021 ?auto_160026 ) ) ( not ( = ?auto_160021 ?auto_160020 ) ) ( not ( = ?auto_160021 ?auto_160019 ) ) ( not ( = ?auto_160024 ?auto_160023 ) ) ( not ( = ?auto_160024 ?auto_160026 ) ) ( not ( = ?auto_160024 ?auto_160020 ) ) ( not ( = ?auto_160024 ?auto_160019 ) ) ( not ( = ?auto_160023 ?auto_160026 ) ) ( not ( = ?auto_160023 ?auto_160020 ) ) ( not ( = ?auto_160023 ?auto_160019 ) ) ( not ( = ?auto_160018 ?auto_160025 ) ) ( not ( = ?auto_160018 ?auto_160021 ) ) ( not ( = ?auto_160018 ?auto_160024 ) ) ( not ( = ?auto_160018 ?auto_160023 ) ) ( ON ?auto_160018 ?auto_160022 ) ( not ( = ?auto_160018 ?auto_160022 ) ) ( not ( = ?auto_160019 ?auto_160022 ) ) ( not ( = ?auto_160020 ?auto_160022 ) ) ( not ( = ?auto_160026 ?auto_160022 ) ) ( not ( = ?auto_160025 ?auto_160022 ) ) ( not ( = ?auto_160021 ?auto_160022 ) ) ( not ( = ?auto_160024 ?auto_160022 ) ) ( not ( = ?auto_160023 ?auto_160022 ) ) ( ON ?auto_160019 ?auto_160018 ) ( CLEAR ?auto_160019 ) ( ON-TABLE ?auto_160022 ) ( HOLDING ?auto_160020 ) ( CLEAR ?auto_160026 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160025 ?auto_160021 ?auto_160024 ?auto_160023 ?auto_160026 ?auto_160020 )
      ( MAKE-3PILE ?auto_160018 ?auto_160019 ?auto_160020 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160027 - BLOCK
      ?auto_160028 - BLOCK
      ?auto_160029 - BLOCK
    )
    :vars
    (
      ?auto_160031 - BLOCK
      ?auto_160034 - BLOCK
      ?auto_160032 - BLOCK
      ?auto_160035 - BLOCK
      ?auto_160030 - BLOCK
      ?auto_160033 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160027 ?auto_160028 ) ) ( not ( = ?auto_160027 ?auto_160029 ) ) ( not ( = ?auto_160028 ?auto_160029 ) ) ( not ( = ?auto_160027 ?auto_160031 ) ) ( not ( = ?auto_160028 ?auto_160031 ) ) ( not ( = ?auto_160029 ?auto_160031 ) ) ( ON-TABLE ?auto_160034 ) ( ON ?auto_160032 ?auto_160034 ) ( ON ?auto_160035 ?auto_160032 ) ( ON ?auto_160030 ?auto_160035 ) ( ON ?auto_160031 ?auto_160030 ) ( not ( = ?auto_160034 ?auto_160032 ) ) ( not ( = ?auto_160034 ?auto_160035 ) ) ( not ( = ?auto_160034 ?auto_160030 ) ) ( not ( = ?auto_160034 ?auto_160031 ) ) ( not ( = ?auto_160034 ?auto_160029 ) ) ( not ( = ?auto_160034 ?auto_160028 ) ) ( not ( = ?auto_160032 ?auto_160035 ) ) ( not ( = ?auto_160032 ?auto_160030 ) ) ( not ( = ?auto_160032 ?auto_160031 ) ) ( not ( = ?auto_160032 ?auto_160029 ) ) ( not ( = ?auto_160032 ?auto_160028 ) ) ( not ( = ?auto_160035 ?auto_160030 ) ) ( not ( = ?auto_160035 ?auto_160031 ) ) ( not ( = ?auto_160035 ?auto_160029 ) ) ( not ( = ?auto_160035 ?auto_160028 ) ) ( not ( = ?auto_160030 ?auto_160031 ) ) ( not ( = ?auto_160030 ?auto_160029 ) ) ( not ( = ?auto_160030 ?auto_160028 ) ) ( not ( = ?auto_160027 ?auto_160034 ) ) ( not ( = ?auto_160027 ?auto_160032 ) ) ( not ( = ?auto_160027 ?auto_160035 ) ) ( not ( = ?auto_160027 ?auto_160030 ) ) ( ON ?auto_160027 ?auto_160033 ) ( not ( = ?auto_160027 ?auto_160033 ) ) ( not ( = ?auto_160028 ?auto_160033 ) ) ( not ( = ?auto_160029 ?auto_160033 ) ) ( not ( = ?auto_160031 ?auto_160033 ) ) ( not ( = ?auto_160034 ?auto_160033 ) ) ( not ( = ?auto_160032 ?auto_160033 ) ) ( not ( = ?auto_160035 ?auto_160033 ) ) ( not ( = ?auto_160030 ?auto_160033 ) ) ( ON ?auto_160028 ?auto_160027 ) ( ON-TABLE ?auto_160033 ) ( CLEAR ?auto_160031 ) ( ON ?auto_160029 ?auto_160028 ) ( CLEAR ?auto_160029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_160033 ?auto_160027 ?auto_160028 )
      ( MAKE-3PILE ?auto_160027 ?auto_160028 ?auto_160029 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160036 - BLOCK
      ?auto_160037 - BLOCK
      ?auto_160038 - BLOCK
    )
    :vars
    (
      ?auto_160042 - BLOCK
      ?auto_160043 - BLOCK
      ?auto_160039 - BLOCK
      ?auto_160044 - BLOCK
      ?auto_160041 - BLOCK
      ?auto_160040 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160036 ?auto_160037 ) ) ( not ( = ?auto_160036 ?auto_160038 ) ) ( not ( = ?auto_160037 ?auto_160038 ) ) ( not ( = ?auto_160036 ?auto_160042 ) ) ( not ( = ?auto_160037 ?auto_160042 ) ) ( not ( = ?auto_160038 ?auto_160042 ) ) ( ON-TABLE ?auto_160043 ) ( ON ?auto_160039 ?auto_160043 ) ( ON ?auto_160044 ?auto_160039 ) ( ON ?auto_160041 ?auto_160044 ) ( not ( = ?auto_160043 ?auto_160039 ) ) ( not ( = ?auto_160043 ?auto_160044 ) ) ( not ( = ?auto_160043 ?auto_160041 ) ) ( not ( = ?auto_160043 ?auto_160042 ) ) ( not ( = ?auto_160043 ?auto_160038 ) ) ( not ( = ?auto_160043 ?auto_160037 ) ) ( not ( = ?auto_160039 ?auto_160044 ) ) ( not ( = ?auto_160039 ?auto_160041 ) ) ( not ( = ?auto_160039 ?auto_160042 ) ) ( not ( = ?auto_160039 ?auto_160038 ) ) ( not ( = ?auto_160039 ?auto_160037 ) ) ( not ( = ?auto_160044 ?auto_160041 ) ) ( not ( = ?auto_160044 ?auto_160042 ) ) ( not ( = ?auto_160044 ?auto_160038 ) ) ( not ( = ?auto_160044 ?auto_160037 ) ) ( not ( = ?auto_160041 ?auto_160042 ) ) ( not ( = ?auto_160041 ?auto_160038 ) ) ( not ( = ?auto_160041 ?auto_160037 ) ) ( not ( = ?auto_160036 ?auto_160043 ) ) ( not ( = ?auto_160036 ?auto_160039 ) ) ( not ( = ?auto_160036 ?auto_160044 ) ) ( not ( = ?auto_160036 ?auto_160041 ) ) ( ON ?auto_160036 ?auto_160040 ) ( not ( = ?auto_160036 ?auto_160040 ) ) ( not ( = ?auto_160037 ?auto_160040 ) ) ( not ( = ?auto_160038 ?auto_160040 ) ) ( not ( = ?auto_160042 ?auto_160040 ) ) ( not ( = ?auto_160043 ?auto_160040 ) ) ( not ( = ?auto_160039 ?auto_160040 ) ) ( not ( = ?auto_160044 ?auto_160040 ) ) ( not ( = ?auto_160041 ?auto_160040 ) ) ( ON ?auto_160037 ?auto_160036 ) ( ON-TABLE ?auto_160040 ) ( ON ?auto_160038 ?auto_160037 ) ( CLEAR ?auto_160038 ) ( HOLDING ?auto_160042 ) ( CLEAR ?auto_160041 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_160043 ?auto_160039 ?auto_160044 ?auto_160041 ?auto_160042 )
      ( MAKE-3PILE ?auto_160036 ?auto_160037 ?auto_160038 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160045 - BLOCK
      ?auto_160046 - BLOCK
      ?auto_160047 - BLOCK
    )
    :vars
    (
      ?auto_160050 - BLOCK
      ?auto_160053 - BLOCK
      ?auto_160049 - BLOCK
      ?auto_160052 - BLOCK
      ?auto_160051 - BLOCK
      ?auto_160048 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160045 ?auto_160046 ) ) ( not ( = ?auto_160045 ?auto_160047 ) ) ( not ( = ?auto_160046 ?auto_160047 ) ) ( not ( = ?auto_160045 ?auto_160050 ) ) ( not ( = ?auto_160046 ?auto_160050 ) ) ( not ( = ?auto_160047 ?auto_160050 ) ) ( ON-TABLE ?auto_160053 ) ( ON ?auto_160049 ?auto_160053 ) ( ON ?auto_160052 ?auto_160049 ) ( ON ?auto_160051 ?auto_160052 ) ( not ( = ?auto_160053 ?auto_160049 ) ) ( not ( = ?auto_160053 ?auto_160052 ) ) ( not ( = ?auto_160053 ?auto_160051 ) ) ( not ( = ?auto_160053 ?auto_160050 ) ) ( not ( = ?auto_160053 ?auto_160047 ) ) ( not ( = ?auto_160053 ?auto_160046 ) ) ( not ( = ?auto_160049 ?auto_160052 ) ) ( not ( = ?auto_160049 ?auto_160051 ) ) ( not ( = ?auto_160049 ?auto_160050 ) ) ( not ( = ?auto_160049 ?auto_160047 ) ) ( not ( = ?auto_160049 ?auto_160046 ) ) ( not ( = ?auto_160052 ?auto_160051 ) ) ( not ( = ?auto_160052 ?auto_160050 ) ) ( not ( = ?auto_160052 ?auto_160047 ) ) ( not ( = ?auto_160052 ?auto_160046 ) ) ( not ( = ?auto_160051 ?auto_160050 ) ) ( not ( = ?auto_160051 ?auto_160047 ) ) ( not ( = ?auto_160051 ?auto_160046 ) ) ( not ( = ?auto_160045 ?auto_160053 ) ) ( not ( = ?auto_160045 ?auto_160049 ) ) ( not ( = ?auto_160045 ?auto_160052 ) ) ( not ( = ?auto_160045 ?auto_160051 ) ) ( ON ?auto_160045 ?auto_160048 ) ( not ( = ?auto_160045 ?auto_160048 ) ) ( not ( = ?auto_160046 ?auto_160048 ) ) ( not ( = ?auto_160047 ?auto_160048 ) ) ( not ( = ?auto_160050 ?auto_160048 ) ) ( not ( = ?auto_160053 ?auto_160048 ) ) ( not ( = ?auto_160049 ?auto_160048 ) ) ( not ( = ?auto_160052 ?auto_160048 ) ) ( not ( = ?auto_160051 ?auto_160048 ) ) ( ON ?auto_160046 ?auto_160045 ) ( ON-TABLE ?auto_160048 ) ( ON ?auto_160047 ?auto_160046 ) ( CLEAR ?auto_160051 ) ( ON ?auto_160050 ?auto_160047 ) ( CLEAR ?auto_160050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_160048 ?auto_160045 ?auto_160046 ?auto_160047 )
      ( MAKE-3PILE ?auto_160045 ?auto_160046 ?auto_160047 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160054 - BLOCK
      ?auto_160055 - BLOCK
      ?auto_160056 - BLOCK
    )
    :vars
    (
      ?auto_160057 - BLOCK
      ?auto_160059 - BLOCK
      ?auto_160058 - BLOCK
      ?auto_160061 - BLOCK
      ?auto_160060 - BLOCK
      ?auto_160062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160054 ?auto_160055 ) ) ( not ( = ?auto_160054 ?auto_160056 ) ) ( not ( = ?auto_160055 ?auto_160056 ) ) ( not ( = ?auto_160054 ?auto_160057 ) ) ( not ( = ?auto_160055 ?auto_160057 ) ) ( not ( = ?auto_160056 ?auto_160057 ) ) ( ON-TABLE ?auto_160059 ) ( ON ?auto_160058 ?auto_160059 ) ( ON ?auto_160061 ?auto_160058 ) ( not ( = ?auto_160059 ?auto_160058 ) ) ( not ( = ?auto_160059 ?auto_160061 ) ) ( not ( = ?auto_160059 ?auto_160060 ) ) ( not ( = ?auto_160059 ?auto_160057 ) ) ( not ( = ?auto_160059 ?auto_160056 ) ) ( not ( = ?auto_160059 ?auto_160055 ) ) ( not ( = ?auto_160058 ?auto_160061 ) ) ( not ( = ?auto_160058 ?auto_160060 ) ) ( not ( = ?auto_160058 ?auto_160057 ) ) ( not ( = ?auto_160058 ?auto_160056 ) ) ( not ( = ?auto_160058 ?auto_160055 ) ) ( not ( = ?auto_160061 ?auto_160060 ) ) ( not ( = ?auto_160061 ?auto_160057 ) ) ( not ( = ?auto_160061 ?auto_160056 ) ) ( not ( = ?auto_160061 ?auto_160055 ) ) ( not ( = ?auto_160060 ?auto_160057 ) ) ( not ( = ?auto_160060 ?auto_160056 ) ) ( not ( = ?auto_160060 ?auto_160055 ) ) ( not ( = ?auto_160054 ?auto_160059 ) ) ( not ( = ?auto_160054 ?auto_160058 ) ) ( not ( = ?auto_160054 ?auto_160061 ) ) ( not ( = ?auto_160054 ?auto_160060 ) ) ( ON ?auto_160054 ?auto_160062 ) ( not ( = ?auto_160054 ?auto_160062 ) ) ( not ( = ?auto_160055 ?auto_160062 ) ) ( not ( = ?auto_160056 ?auto_160062 ) ) ( not ( = ?auto_160057 ?auto_160062 ) ) ( not ( = ?auto_160059 ?auto_160062 ) ) ( not ( = ?auto_160058 ?auto_160062 ) ) ( not ( = ?auto_160061 ?auto_160062 ) ) ( not ( = ?auto_160060 ?auto_160062 ) ) ( ON ?auto_160055 ?auto_160054 ) ( ON-TABLE ?auto_160062 ) ( ON ?auto_160056 ?auto_160055 ) ( ON ?auto_160057 ?auto_160056 ) ( CLEAR ?auto_160057 ) ( HOLDING ?auto_160060 ) ( CLEAR ?auto_160061 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_160059 ?auto_160058 ?auto_160061 ?auto_160060 )
      ( MAKE-3PILE ?auto_160054 ?auto_160055 ?auto_160056 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160063 - BLOCK
      ?auto_160064 - BLOCK
      ?auto_160065 - BLOCK
    )
    :vars
    (
      ?auto_160067 - BLOCK
      ?auto_160069 - BLOCK
      ?auto_160070 - BLOCK
      ?auto_160066 - BLOCK
      ?auto_160071 - BLOCK
      ?auto_160068 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160063 ?auto_160064 ) ) ( not ( = ?auto_160063 ?auto_160065 ) ) ( not ( = ?auto_160064 ?auto_160065 ) ) ( not ( = ?auto_160063 ?auto_160067 ) ) ( not ( = ?auto_160064 ?auto_160067 ) ) ( not ( = ?auto_160065 ?auto_160067 ) ) ( ON-TABLE ?auto_160069 ) ( ON ?auto_160070 ?auto_160069 ) ( ON ?auto_160066 ?auto_160070 ) ( not ( = ?auto_160069 ?auto_160070 ) ) ( not ( = ?auto_160069 ?auto_160066 ) ) ( not ( = ?auto_160069 ?auto_160071 ) ) ( not ( = ?auto_160069 ?auto_160067 ) ) ( not ( = ?auto_160069 ?auto_160065 ) ) ( not ( = ?auto_160069 ?auto_160064 ) ) ( not ( = ?auto_160070 ?auto_160066 ) ) ( not ( = ?auto_160070 ?auto_160071 ) ) ( not ( = ?auto_160070 ?auto_160067 ) ) ( not ( = ?auto_160070 ?auto_160065 ) ) ( not ( = ?auto_160070 ?auto_160064 ) ) ( not ( = ?auto_160066 ?auto_160071 ) ) ( not ( = ?auto_160066 ?auto_160067 ) ) ( not ( = ?auto_160066 ?auto_160065 ) ) ( not ( = ?auto_160066 ?auto_160064 ) ) ( not ( = ?auto_160071 ?auto_160067 ) ) ( not ( = ?auto_160071 ?auto_160065 ) ) ( not ( = ?auto_160071 ?auto_160064 ) ) ( not ( = ?auto_160063 ?auto_160069 ) ) ( not ( = ?auto_160063 ?auto_160070 ) ) ( not ( = ?auto_160063 ?auto_160066 ) ) ( not ( = ?auto_160063 ?auto_160071 ) ) ( ON ?auto_160063 ?auto_160068 ) ( not ( = ?auto_160063 ?auto_160068 ) ) ( not ( = ?auto_160064 ?auto_160068 ) ) ( not ( = ?auto_160065 ?auto_160068 ) ) ( not ( = ?auto_160067 ?auto_160068 ) ) ( not ( = ?auto_160069 ?auto_160068 ) ) ( not ( = ?auto_160070 ?auto_160068 ) ) ( not ( = ?auto_160066 ?auto_160068 ) ) ( not ( = ?auto_160071 ?auto_160068 ) ) ( ON ?auto_160064 ?auto_160063 ) ( ON-TABLE ?auto_160068 ) ( ON ?auto_160065 ?auto_160064 ) ( ON ?auto_160067 ?auto_160065 ) ( CLEAR ?auto_160066 ) ( ON ?auto_160071 ?auto_160067 ) ( CLEAR ?auto_160071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_160068 ?auto_160063 ?auto_160064 ?auto_160065 ?auto_160067 )
      ( MAKE-3PILE ?auto_160063 ?auto_160064 ?auto_160065 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160072 - BLOCK
      ?auto_160073 - BLOCK
      ?auto_160074 - BLOCK
    )
    :vars
    (
      ?auto_160080 - BLOCK
      ?auto_160077 - BLOCK
      ?auto_160079 - BLOCK
      ?auto_160075 - BLOCK
      ?auto_160076 - BLOCK
      ?auto_160078 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160072 ?auto_160073 ) ) ( not ( = ?auto_160072 ?auto_160074 ) ) ( not ( = ?auto_160073 ?auto_160074 ) ) ( not ( = ?auto_160072 ?auto_160080 ) ) ( not ( = ?auto_160073 ?auto_160080 ) ) ( not ( = ?auto_160074 ?auto_160080 ) ) ( ON-TABLE ?auto_160077 ) ( ON ?auto_160079 ?auto_160077 ) ( not ( = ?auto_160077 ?auto_160079 ) ) ( not ( = ?auto_160077 ?auto_160075 ) ) ( not ( = ?auto_160077 ?auto_160076 ) ) ( not ( = ?auto_160077 ?auto_160080 ) ) ( not ( = ?auto_160077 ?auto_160074 ) ) ( not ( = ?auto_160077 ?auto_160073 ) ) ( not ( = ?auto_160079 ?auto_160075 ) ) ( not ( = ?auto_160079 ?auto_160076 ) ) ( not ( = ?auto_160079 ?auto_160080 ) ) ( not ( = ?auto_160079 ?auto_160074 ) ) ( not ( = ?auto_160079 ?auto_160073 ) ) ( not ( = ?auto_160075 ?auto_160076 ) ) ( not ( = ?auto_160075 ?auto_160080 ) ) ( not ( = ?auto_160075 ?auto_160074 ) ) ( not ( = ?auto_160075 ?auto_160073 ) ) ( not ( = ?auto_160076 ?auto_160080 ) ) ( not ( = ?auto_160076 ?auto_160074 ) ) ( not ( = ?auto_160076 ?auto_160073 ) ) ( not ( = ?auto_160072 ?auto_160077 ) ) ( not ( = ?auto_160072 ?auto_160079 ) ) ( not ( = ?auto_160072 ?auto_160075 ) ) ( not ( = ?auto_160072 ?auto_160076 ) ) ( ON ?auto_160072 ?auto_160078 ) ( not ( = ?auto_160072 ?auto_160078 ) ) ( not ( = ?auto_160073 ?auto_160078 ) ) ( not ( = ?auto_160074 ?auto_160078 ) ) ( not ( = ?auto_160080 ?auto_160078 ) ) ( not ( = ?auto_160077 ?auto_160078 ) ) ( not ( = ?auto_160079 ?auto_160078 ) ) ( not ( = ?auto_160075 ?auto_160078 ) ) ( not ( = ?auto_160076 ?auto_160078 ) ) ( ON ?auto_160073 ?auto_160072 ) ( ON-TABLE ?auto_160078 ) ( ON ?auto_160074 ?auto_160073 ) ( ON ?auto_160080 ?auto_160074 ) ( ON ?auto_160076 ?auto_160080 ) ( CLEAR ?auto_160076 ) ( HOLDING ?auto_160075 ) ( CLEAR ?auto_160079 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_160077 ?auto_160079 ?auto_160075 )
      ( MAKE-3PILE ?auto_160072 ?auto_160073 ?auto_160074 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160081 - BLOCK
      ?auto_160082 - BLOCK
      ?auto_160083 - BLOCK
    )
    :vars
    (
      ?auto_160086 - BLOCK
      ?auto_160087 - BLOCK
      ?auto_160085 - BLOCK
      ?auto_160084 - BLOCK
      ?auto_160089 - BLOCK
      ?auto_160088 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160081 ?auto_160082 ) ) ( not ( = ?auto_160081 ?auto_160083 ) ) ( not ( = ?auto_160082 ?auto_160083 ) ) ( not ( = ?auto_160081 ?auto_160086 ) ) ( not ( = ?auto_160082 ?auto_160086 ) ) ( not ( = ?auto_160083 ?auto_160086 ) ) ( ON-TABLE ?auto_160087 ) ( ON ?auto_160085 ?auto_160087 ) ( not ( = ?auto_160087 ?auto_160085 ) ) ( not ( = ?auto_160087 ?auto_160084 ) ) ( not ( = ?auto_160087 ?auto_160089 ) ) ( not ( = ?auto_160087 ?auto_160086 ) ) ( not ( = ?auto_160087 ?auto_160083 ) ) ( not ( = ?auto_160087 ?auto_160082 ) ) ( not ( = ?auto_160085 ?auto_160084 ) ) ( not ( = ?auto_160085 ?auto_160089 ) ) ( not ( = ?auto_160085 ?auto_160086 ) ) ( not ( = ?auto_160085 ?auto_160083 ) ) ( not ( = ?auto_160085 ?auto_160082 ) ) ( not ( = ?auto_160084 ?auto_160089 ) ) ( not ( = ?auto_160084 ?auto_160086 ) ) ( not ( = ?auto_160084 ?auto_160083 ) ) ( not ( = ?auto_160084 ?auto_160082 ) ) ( not ( = ?auto_160089 ?auto_160086 ) ) ( not ( = ?auto_160089 ?auto_160083 ) ) ( not ( = ?auto_160089 ?auto_160082 ) ) ( not ( = ?auto_160081 ?auto_160087 ) ) ( not ( = ?auto_160081 ?auto_160085 ) ) ( not ( = ?auto_160081 ?auto_160084 ) ) ( not ( = ?auto_160081 ?auto_160089 ) ) ( ON ?auto_160081 ?auto_160088 ) ( not ( = ?auto_160081 ?auto_160088 ) ) ( not ( = ?auto_160082 ?auto_160088 ) ) ( not ( = ?auto_160083 ?auto_160088 ) ) ( not ( = ?auto_160086 ?auto_160088 ) ) ( not ( = ?auto_160087 ?auto_160088 ) ) ( not ( = ?auto_160085 ?auto_160088 ) ) ( not ( = ?auto_160084 ?auto_160088 ) ) ( not ( = ?auto_160089 ?auto_160088 ) ) ( ON ?auto_160082 ?auto_160081 ) ( ON-TABLE ?auto_160088 ) ( ON ?auto_160083 ?auto_160082 ) ( ON ?auto_160086 ?auto_160083 ) ( ON ?auto_160089 ?auto_160086 ) ( CLEAR ?auto_160085 ) ( ON ?auto_160084 ?auto_160089 ) ( CLEAR ?auto_160084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160088 ?auto_160081 ?auto_160082 ?auto_160083 ?auto_160086 ?auto_160089 )
      ( MAKE-3PILE ?auto_160081 ?auto_160082 ?auto_160083 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160090 - BLOCK
      ?auto_160091 - BLOCK
      ?auto_160092 - BLOCK
    )
    :vars
    (
      ?auto_160095 - BLOCK
      ?auto_160094 - BLOCK
      ?auto_160098 - BLOCK
      ?auto_160097 - BLOCK
      ?auto_160096 - BLOCK
      ?auto_160093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160090 ?auto_160091 ) ) ( not ( = ?auto_160090 ?auto_160092 ) ) ( not ( = ?auto_160091 ?auto_160092 ) ) ( not ( = ?auto_160090 ?auto_160095 ) ) ( not ( = ?auto_160091 ?auto_160095 ) ) ( not ( = ?auto_160092 ?auto_160095 ) ) ( ON-TABLE ?auto_160094 ) ( not ( = ?auto_160094 ?auto_160098 ) ) ( not ( = ?auto_160094 ?auto_160097 ) ) ( not ( = ?auto_160094 ?auto_160096 ) ) ( not ( = ?auto_160094 ?auto_160095 ) ) ( not ( = ?auto_160094 ?auto_160092 ) ) ( not ( = ?auto_160094 ?auto_160091 ) ) ( not ( = ?auto_160098 ?auto_160097 ) ) ( not ( = ?auto_160098 ?auto_160096 ) ) ( not ( = ?auto_160098 ?auto_160095 ) ) ( not ( = ?auto_160098 ?auto_160092 ) ) ( not ( = ?auto_160098 ?auto_160091 ) ) ( not ( = ?auto_160097 ?auto_160096 ) ) ( not ( = ?auto_160097 ?auto_160095 ) ) ( not ( = ?auto_160097 ?auto_160092 ) ) ( not ( = ?auto_160097 ?auto_160091 ) ) ( not ( = ?auto_160096 ?auto_160095 ) ) ( not ( = ?auto_160096 ?auto_160092 ) ) ( not ( = ?auto_160096 ?auto_160091 ) ) ( not ( = ?auto_160090 ?auto_160094 ) ) ( not ( = ?auto_160090 ?auto_160098 ) ) ( not ( = ?auto_160090 ?auto_160097 ) ) ( not ( = ?auto_160090 ?auto_160096 ) ) ( ON ?auto_160090 ?auto_160093 ) ( not ( = ?auto_160090 ?auto_160093 ) ) ( not ( = ?auto_160091 ?auto_160093 ) ) ( not ( = ?auto_160092 ?auto_160093 ) ) ( not ( = ?auto_160095 ?auto_160093 ) ) ( not ( = ?auto_160094 ?auto_160093 ) ) ( not ( = ?auto_160098 ?auto_160093 ) ) ( not ( = ?auto_160097 ?auto_160093 ) ) ( not ( = ?auto_160096 ?auto_160093 ) ) ( ON ?auto_160091 ?auto_160090 ) ( ON-TABLE ?auto_160093 ) ( ON ?auto_160092 ?auto_160091 ) ( ON ?auto_160095 ?auto_160092 ) ( ON ?auto_160096 ?auto_160095 ) ( ON ?auto_160097 ?auto_160096 ) ( CLEAR ?auto_160097 ) ( HOLDING ?auto_160098 ) ( CLEAR ?auto_160094 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160094 ?auto_160098 )
      ( MAKE-3PILE ?auto_160090 ?auto_160091 ?auto_160092 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160099 - BLOCK
      ?auto_160100 - BLOCK
      ?auto_160101 - BLOCK
    )
    :vars
    (
      ?auto_160104 - BLOCK
      ?auto_160105 - BLOCK
      ?auto_160103 - BLOCK
      ?auto_160106 - BLOCK
      ?auto_160107 - BLOCK
      ?auto_160102 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160099 ?auto_160100 ) ) ( not ( = ?auto_160099 ?auto_160101 ) ) ( not ( = ?auto_160100 ?auto_160101 ) ) ( not ( = ?auto_160099 ?auto_160104 ) ) ( not ( = ?auto_160100 ?auto_160104 ) ) ( not ( = ?auto_160101 ?auto_160104 ) ) ( ON-TABLE ?auto_160105 ) ( not ( = ?auto_160105 ?auto_160103 ) ) ( not ( = ?auto_160105 ?auto_160106 ) ) ( not ( = ?auto_160105 ?auto_160107 ) ) ( not ( = ?auto_160105 ?auto_160104 ) ) ( not ( = ?auto_160105 ?auto_160101 ) ) ( not ( = ?auto_160105 ?auto_160100 ) ) ( not ( = ?auto_160103 ?auto_160106 ) ) ( not ( = ?auto_160103 ?auto_160107 ) ) ( not ( = ?auto_160103 ?auto_160104 ) ) ( not ( = ?auto_160103 ?auto_160101 ) ) ( not ( = ?auto_160103 ?auto_160100 ) ) ( not ( = ?auto_160106 ?auto_160107 ) ) ( not ( = ?auto_160106 ?auto_160104 ) ) ( not ( = ?auto_160106 ?auto_160101 ) ) ( not ( = ?auto_160106 ?auto_160100 ) ) ( not ( = ?auto_160107 ?auto_160104 ) ) ( not ( = ?auto_160107 ?auto_160101 ) ) ( not ( = ?auto_160107 ?auto_160100 ) ) ( not ( = ?auto_160099 ?auto_160105 ) ) ( not ( = ?auto_160099 ?auto_160103 ) ) ( not ( = ?auto_160099 ?auto_160106 ) ) ( not ( = ?auto_160099 ?auto_160107 ) ) ( ON ?auto_160099 ?auto_160102 ) ( not ( = ?auto_160099 ?auto_160102 ) ) ( not ( = ?auto_160100 ?auto_160102 ) ) ( not ( = ?auto_160101 ?auto_160102 ) ) ( not ( = ?auto_160104 ?auto_160102 ) ) ( not ( = ?auto_160105 ?auto_160102 ) ) ( not ( = ?auto_160103 ?auto_160102 ) ) ( not ( = ?auto_160106 ?auto_160102 ) ) ( not ( = ?auto_160107 ?auto_160102 ) ) ( ON ?auto_160100 ?auto_160099 ) ( ON-TABLE ?auto_160102 ) ( ON ?auto_160101 ?auto_160100 ) ( ON ?auto_160104 ?auto_160101 ) ( ON ?auto_160107 ?auto_160104 ) ( ON ?auto_160106 ?auto_160107 ) ( CLEAR ?auto_160105 ) ( ON ?auto_160103 ?auto_160106 ) ( CLEAR ?auto_160103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160102 ?auto_160099 ?auto_160100 ?auto_160101 ?auto_160104 ?auto_160107 ?auto_160106 )
      ( MAKE-3PILE ?auto_160099 ?auto_160100 ?auto_160101 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160108 - BLOCK
      ?auto_160109 - BLOCK
      ?auto_160110 - BLOCK
    )
    :vars
    (
      ?auto_160116 - BLOCK
      ?auto_160115 - BLOCK
      ?auto_160113 - BLOCK
      ?auto_160112 - BLOCK
      ?auto_160111 - BLOCK
      ?auto_160114 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160108 ?auto_160109 ) ) ( not ( = ?auto_160108 ?auto_160110 ) ) ( not ( = ?auto_160109 ?auto_160110 ) ) ( not ( = ?auto_160108 ?auto_160116 ) ) ( not ( = ?auto_160109 ?auto_160116 ) ) ( not ( = ?auto_160110 ?auto_160116 ) ) ( not ( = ?auto_160115 ?auto_160113 ) ) ( not ( = ?auto_160115 ?auto_160112 ) ) ( not ( = ?auto_160115 ?auto_160111 ) ) ( not ( = ?auto_160115 ?auto_160116 ) ) ( not ( = ?auto_160115 ?auto_160110 ) ) ( not ( = ?auto_160115 ?auto_160109 ) ) ( not ( = ?auto_160113 ?auto_160112 ) ) ( not ( = ?auto_160113 ?auto_160111 ) ) ( not ( = ?auto_160113 ?auto_160116 ) ) ( not ( = ?auto_160113 ?auto_160110 ) ) ( not ( = ?auto_160113 ?auto_160109 ) ) ( not ( = ?auto_160112 ?auto_160111 ) ) ( not ( = ?auto_160112 ?auto_160116 ) ) ( not ( = ?auto_160112 ?auto_160110 ) ) ( not ( = ?auto_160112 ?auto_160109 ) ) ( not ( = ?auto_160111 ?auto_160116 ) ) ( not ( = ?auto_160111 ?auto_160110 ) ) ( not ( = ?auto_160111 ?auto_160109 ) ) ( not ( = ?auto_160108 ?auto_160115 ) ) ( not ( = ?auto_160108 ?auto_160113 ) ) ( not ( = ?auto_160108 ?auto_160112 ) ) ( not ( = ?auto_160108 ?auto_160111 ) ) ( ON ?auto_160108 ?auto_160114 ) ( not ( = ?auto_160108 ?auto_160114 ) ) ( not ( = ?auto_160109 ?auto_160114 ) ) ( not ( = ?auto_160110 ?auto_160114 ) ) ( not ( = ?auto_160116 ?auto_160114 ) ) ( not ( = ?auto_160115 ?auto_160114 ) ) ( not ( = ?auto_160113 ?auto_160114 ) ) ( not ( = ?auto_160112 ?auto_160114 ) ) ( not ( = ?auto_160111 ?auto_160114 ) ) ( ON ?auto_160109 ?auto_160108 ) ( ON-TABLE ?auto_160114 ) ( ON ?auto_160110 ?auto_160109 ) ( ON ?auto_160116 ?auto_160110 ) ( ON ?auto_160111 ?auto_160116 ) ( ON ?auto_160112 ?auto_160111 ) ( ON ?auto_160113 ?auto_160112 ) ( CLEAR ?auto_160113 ) ( HOLDING ?auto_160115 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_160115 )
      ( MAKE-3PILE ?auto_160108 ?auto_160109 ?auto_160110 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160117 - BLOCK
      ?auto_160118 - BLOCK
      ?auto_160119 - BLOCK
    )
    :vars
    (
      ?auto_160123 - BLOCK
      ?auto_160125 - BLOCK
      ?auto_160120 - BLOCK
      ?auto_160122 - BLOCK
      ?auto_160121 - BLOCK
      ?auto_160124 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160117 ?auto_160118 ) ) ( not ( = ?auto_160117 ?auto_160119 ) ) ( not ( = ?auto_160118 ?auto_160119 ) ) ( not ( = ?auto_160117 ?auto_160123 ) ) ( not ( = ?auto_160118 ?auto_160123 ) ) ( not ( = ?auto_160119 ?auto_160123 ) ) ( not ( = ?auto_160125 ?auto_160120 ) ) ( not ( = ?auto_160125 ?auto_160122 ) ) ( not ( = ?auto_160125 ?auto_160121 ) ) ( not ( = ?auto_160125 ?auto_160123 ) ) ( not ( = ?auto_160125 ?auto_160119 ) ) ( not ( = ?auto_160125 ?auto_160118 ) ) ( not ( = ?auto_160120 ?auto_160122 ) ) ( not ( = ?auto_160120 ?auto_160121 ) ) ( not ( = ?auto_160120 ?auto_160123 ) ) ( not ( = ?auto_160120 ?auto_160119 ) ) ( not ( = ?auto_160120 ?auto_160118 ) ) ( not ( = ?auto_160122 ?auto_160121 ) ) ( not ( = ?auto_160122 ?auto_160123 ) ) ( not ( = ?auto_160122 ?auto_160119 ) ) ( not ( = ?auto_160122 ?auto_160118 ) ) ( not ( = ?auto_160121 ?auto_160123 ) ) ( not ( = ?auto_160121 ?auto_160119 ) ) ( not ( = ?auto_160121 ?auto_160118 ) ) ( not ( = ?auto_160117 ?auto_160125 ) ) ( not ( = ?auto_160117 ?auto_160120 ) ) ( not ( = ?auto_160117 ?auto_160122 ) ) ( not ( = ?auto_160117 ?auto_160121 ) ) ( ON ?auto_160117 ?auto_160124 ) ( not ( = ?auto_160117 ?auto_160124 ) ) ( not ( = ?auto_160118 ?auto_160124 ) ) ( not ( = ?auto_160119 ?auto_160124 ) ) ( not ( = ?auto_160123 ?auto_160124 ) ) ( not ( = ?auto_160125 ?auto_160124 ) ) ( not ( = ?auto_160120 ?auto_160124 ) ) ( not ( = ?auto_160122 ?auto_160124 ) ) ( not ( = ?auto_160121 ?auto_160124 ) ) ( ON ?auto_160118 ?auto_160117 ) ( ON-TABLE ?auto_160124 ) ( ON ?auto_160119 ?auto_160118 ) ( ON ?auto_160123 ?auto_160119 ) ( ON ?auto_160121 ?auto_160123 ) ( ON ?auto_160122 ?auto_160121 ) ( ON ?auto_160120 ?auto_160122 ) ( ON ?auto_160125 ?auto_160120 ) ( CLEAR ?auto_160125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_160124 ?auto_160117 ?auto_160118 ?auto_160119 ?auto_160123 ?auto_160121 ?auto_160122 ?auto_160120 )
      ( MAKE-3PILE ?auto_160117 ?auto_160118 ?auto_160119 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160149 - BLOCK
      ?auto_160150 - BLOCK
      ?auto_160151 - BLOCK
      ?auto_160152 - BLOCK
    )
    :vars
    (
      ?auto_160153 - BLOCK
      ?auto_160155 - BLOCK
      ?auto_160154 - BLOCK
      ?auto_160156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160153 ?auto_160152 ) ( ON-TABLE ?auto_160149 ) ( ON ?auto_160150 ?auto_160149 ) ( ON ?auto_160151 ?auto_160150 ) ( ON ?auto_160152 ?auto_160151 ) ( not ( = ?auto_160149 ?auto_160150 ) ) ( not ( = ?auto_160149 ?auto_160151 ) ) ( not ( = ?auto_160149 ?auto_160152 ) ) ( not ( = ?auto_160149 ?auto_160153 ) ) ( not ( = ?auto_160150 ?auto_160151 ) ) ( not ( = ?auto_160150 ?auto_160152 ) ) ( not ( = ?auto_160150 ?auto_160153 ) ) ( not ( = ?auto_160151 ?auto_160152 ) ) ( not ( = ?auto_160151 ?auto_160153 ) ) ( not ( = ?auto_160152 ?auto_160153 ) ) ( not ( = ?auto_160149 ?auto_160155 ) ) ( not ( = ?auto_160149 ?auto_160154 ) ) ( not ( = ?auto_160150 ?auto_160155 ) ) ( not ( = ?auto_160150 ?auto_160154 ) ) ( not ( = ?auto_160151 ?auto_160155 ) ) ( not ( = ?auto_160151 ?auto_160154 ) ) ( not ( = ?auto_160152 ?auto_160155 ) ) ( not ( = ?auto_160152 ?auto_160154 ) ) ( not ( = ?auto_160153 ?auto_160155 ) ) ( not ( = ?auto_160153 ?auto_160154 ) ) ( not ( = ?auto_160155 ?auto_160154 ) ) ( ON ?auto_160155 ?auto_160153 ) ( CLEAR ?auto_160155 ) ( HOLDING ?auto_160154 ) ( CLEAR ?auto_160156 ) ( ON-TABLE ?auto_160156 ) ( not ( = ?auto_160156 ?auto_160154 ) ) ( not ( = ?auto_160149 ?auto_160156 ) ) ( not ( = ?auto_160150 ?auto_160156 ) ) ( not ( = ?auto_160151 ?auto_160156 ) ) ( not ( = ?auto_160152 ?auto_160156 ) ) ( not ( = ?auto_160153 ?auto_160156 ) ) ( not ( = ?auto_160155 ?auto_160156 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160156 ?auto_160154 )
      ( MAKE-4PILE ?auto_160149 ?auto_160150 ?auto_160151 ?auto_160152 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160157 - BLOCK
      ?auto_160158 - BLOCK
      ?auto_160159 - BLOCK
      ?auto_160160 - BLOCK
    )
    :vars
    (
      ?auto_160162 - BLOCK
      ?auto_160161 - BLOCK
      ?auto_160164 - BLOCK
      ?auto_160163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160162 ?auto_160160 ) ( ON-TABLE ?auto_160157 ) ( ON ?auto_160158 ?auto_160157 ) ( ON ?auto_160159 ?auto_160158 ) ( ON ?auto_160160 ?auto_160159 ) ( not ( = ?auto_160157 ?auto_160158 ) ) ( not ( = ?auto_160157 ?auto_160159 ) ) ( not ( = ?auto_160157 ?auto_160160 ) ) ( not ( = ?auto_160157 ?auto_160162 ) ) ( not ( = ?auto_160158 ?auto_160159 ) ) ( not ( = ?auto_160158 ?auto_160160 ) ) ( not ( = ?auto_160158 ?auto_160162 ) ) ( not ( = ?auto_160159 ?auto_160160 ) ) ( not ( = ?auto_160159 ?auto_160162 ) ) ( not ( = ?auto_160160 ?auto_160162 ) ) ( not ( = ?auto_160157 ?auto_160161 ) ) ( not ( = ?auto_160157 ?auto_160164 ) ) ( not ( = ?auto_160158 ?auto_160161 ) ) ( not ( = ?auto_160158 ?auto_160164 ) ) ( not ( = ?auto_160159 ?auto_160161 ) ) ( not ( = ?auto_160159 ?auto_160164 ) ) ( not ( = ?auto_160160 ?auto_160161 ) ) ( not ( = ?auto_160160 ?auto_160164 ) ) ( not ( = ?auto_160162 ?auto_160161 ) ) ( not ( = ?auto_160162 ?auto_160164 ) ) ( not ( = ?auto_160161 ?auto_160164 ) ) ( ON ?auto_160161 ?auto_160162 ) ( CLEAR ?auto_160163 ) ( ON-TABLE ?auto_160163 ) ( not ( = ?auto_160163 ?auto_160164 ) ) ( not ( = ?auto_160157 ?auto_160163 ) ) ( not ( = ?auto_160158 ?auto_160163 ) ) ( not ( = ?auto_160159 ?auto_160163 ) ) ( not ( = ?auto_160160 ?auto_160163 ) ) ( not ( = ?auto_160162 ?auto_160163 ) ) ( not ( = ?auto_160161 ?auto_160163 ) ) ( ON ?auto_160164 ?auto_160161 ) ( CLEAR ?auto_160164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160157 ?auto_160158 ?auto_160159 ?auto_160160 ?auto_160162 ?auto_160161 )
      ( MAKE-4PILE ?auto_160157 ?auto_160158 ?auto_160159 ?auto_160160 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160165 - BLOCK
      ?auto_160166 - BLOCK
      ?auto_160167 - BLOCK
      ?auto_160168 - BLOCK
    )
    :vars
    (
      ?auto_160169 - BLOCK
      ?auto_160170 - BLOCK
      ?auto_160172 - BLOCK
      ?auto_160171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160169 ?auto_160168 ) ( ON-TABLE ?auto_160165 ) ( ON ?auto_160166 ?auto_160165 ) ( ON ?auto_160167 ?auto_160166 ) ( ON ?auto_160168 ?auto_160167 ) ( not ( = ?auto_160165 ?auto_160166 ) ) ( not ( = ?auto_160165 ?auto_160167 ) ) ( not ( = ?auto_160165 ?auto_160168 ) ) ( not ( = ?auto_160165 ?auto_160169 ) ) ( not ( = ?auto_160166 ?auto_160167 ) ) ( not ( = ?auto_160166 ?auto_160168 ) ) ( not ( = ?auto_160166 ?auto_160169 ) ) ( not ( = ?auto_160167 ?auto_160168 ) ) ( not ( = ?auto_160167 ?auto_160169 ) ) ( not ( = ?auto_160168 ?auto_160169 ) ) ( not ( = ?auto_160165 ?auto_160170 ) ) ( not ( = ?auto_160165 ?auto_160172 ) ) ( not ( = ?auto_160166 ?auto_160170 ) ) ( not ( = ?auto_160166 ?auto_160172 ) ) ( not ( = ?auto_160167 ?auto_160170 ) ) ( not ( = ?auto_160167 ?auto_160172 ) ) ( not ( = ?auto_160168 ?auto_160170 ) ) ( not ( = ?auto_160168 ?auto_160172 ) ) ( not ( = ?auto_160169 ?auto_160170 ) ) ( not ( = ?auto_160169 ?auto_160172 ) ) ( not ( = ?auto_160170 ?auto_160172 ) ) ( ON ?auto_160170 ?auto_160169 ) ( not ( = ?auto_160171 ?auto_160172 ) ) ( not ( = ?auto_160165 ?auto_160171 ) ) ( not ( = ?auto_160166 ?auto_160171 ) ) ( not ( = ?auto_160167 ?auto_160171 ) ) ( not ( = ?auto_160168 ?auto_160171 ) ) ( not ( = ?auto_160169 ?auto_160171 ) ) ( not ( = ?auto_160170 ?auto_160171 ) ) ( ON ?auto_160172 ?auto_160170 ) ( CLEAR ?auto_160172 ) ( HOLDING ?auto_160171 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_160171 )
      ( MAKE-4PILE ?auto_160165 ?auto_160166 ?auto_160167 ?auto_160168 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160185 - BLOCK
      ?auto_160186 - BLOCK
      ?auto_160187 - BLOCK
      ?auto_160188 - BLOCK
    )
    :vars
    (
      ?auto_160191 - BLOCK
      ?auto_160189 - BLOCK
      ?auto_160190 - BLOCK
      ?auto_160192 - BLOCK
      ?auto_160193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160191 ?auto_160188 ) ( ON-TABLE ?auto_160185 ) ( ON ?auto_160186 ?auto_160185 ) ( ON ?auto_160187 ?auto_160186 ) ( ON ?auto_160188 ?auto_160187 ) ( not ( = ?auto_160185 ?auto_160186 ) ) ( not ( = ?auto_160185 ?auto_160187 ) ) ( not ( = ?auto_160185 ?auto_160188 ) ) ( not ( = ?auto_160185 ?auto_160191 ) ) ( not ( = ?auto_160186 ?auto_160187 ) ) ( not ( = ?auto_160186 ?auto_160188 ) ) ( not ( = ?auto_160186 ?auto_160191 ) ) ( not ( = ?auto_160187 ?auto_160188 ) ) ( not ( = ?auto_160187 ?auto_160191 ) ) ( not ( = ?auto_160188 ?auto_160191 ) ) ( not ( = ?auto_160185 ?auto_160189 ) ) ( not ( = ?auto_160185 ?auto_160190 ) ) ( not ( = ?auto_160186 ?auto_160189 ) ) ( not ( = ?auto_160186 ?auto_160190 ) ) ( not ( = ?auto_160187 ?auto_160189 ) ) ( not ( = ?auto_160187 ?auto_160190 ) ) ( not ( = ?auto_160188 ?auto_160189 ) ) ( not ( = ?auto_160188 ?auto_160190 ) ) ( not ( = ?auto_160191 ?auto_160189 ) ) ( not ( = ?auto_160191 ?auto_160190 ) ) ( not ( = ?auto_160189 ?auto_160190 ) ) ( ON ?auto_160189 ?auto_160191 ) ( not ( = ?auto_160192 ?auto_160190 ) ) ( not ( = ?auto_160185 ?auto_160192 ) ) ( not ( = ?auto_160186 ?auto_160192 ) ) ( not ( = ?auto_160187 ?auto_160192 ) ) ( not ( = ?auto_160188 ?auto_160192 ) ) ( not ( = ?auto_160191 ?auto_160192 ) ) ( not ( = ?auto_160189 ?auto_160192 ) ) ( ON ?auto_160190 ?auto_160189 ) ( CLEAR ?auto_160190 ) ( ON ?auto_160192 ?auto_160193 ) ( CLEAR ?auto_160192 ) ( HAND-EMPTY ) ( not ( = ?auto_160185 ?auto_160193 ) ) ( not ( = ?auto_160186 ?auto_160193 ) ) ( not ( = ?auto_160187 ?auto_160193 ) ) ( not ( = ?auto_160188 ?auto_160193 ) ) ( not ( = ?auto_160191 ?auto_160193 ) ) ( not ( = ?auto_160189 ?auto_160193 ) ) ( not ( = ?auto_160190 ?auto_160193 ) ) ( not ( = ?auto_160192 ?auto_160193 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_160192 ?auto_160193 )
      ( MAKE-4PILE ?auto_160185 ?auto_160186 ?auto_160187 ?auto_160188 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160194 - BLOCK
      ?auto_160195 - BLOCK
      ?auto_160196 - BLOCK
      ?auto_160197 - BLOCK
    )
    :vars
    (
      ?auto_160202 - BLOCK
      ?auto_160199 - BLOCK
      ?auto_160200 - BLOCK
      ?auto_160201 - BLOCK
      ?auto_160198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160202 ?auto_160197 ) ( ON-TABLE ?auto_160194 ) ( ON ?auto_160195 ?auto_160194 ) ( ON ?auto_160196 ?auto_160195 ) ( ON ?auto_160197 ?auto_160196 ) ( not ( = ?auto_160194 ?auto_160195 ) ) ( not ( = ?auto_160194 ?auto_160196 ) ) ( not ( = ?auto_160194 ?auto_160197 ) ) ( not ( = ?auto_160194 ?auto_160202 ) ) ( not ( = ?auto_160195 ?auto_160196 ) ) ( not ( = ?auto_160195 ?auto_160197 ) ) ( not ( = ?auto_160195 ?auto_160202 ) ) ( not ( = ?auto_160196 ?auto_160197 ) ) ( not ( = ?auto_160196 ?auto_160202 ) ) ( not ( = ?auto_160197 ?auto_160202 ) ) ( not ( = ?auto_160194 ?auto_160199 ) ) ( not ( = ?auto_160194 ?auto_160200 ) ) ( not ( = ?auto_160195 ?auto_160199 ) ) ( not ( = ?auto_160195 ?auto_160200 ) ) ( not ( = ?auto_160196 ?auto_160199 ) ) ( not ( = ?auto_160196 ?auto_160200 ) ) ( not ( = ?auto_160197 ?auto_160199 ) ) ( not ( = ?auto_160197 ?auto_160200 ) ) ( not ( = ?auto_160202 ?auto_160199 ) ) ( not ( = ?auto_160202 ?auto_160200 ) ) ( not ( = ?auto_160199 ?auto_160200 ) ) ( ON ?auto_160199 ?auto_160202 ) ( not ( = ?auto_160201 ?auto_160200 ) ) ( not ( = ?auto_160194 ?auto_160201 ) ) ( not ( = ?auto_160195 ?auto_160201 ) ) ( not ( = ?auto_160196 ?auto_160201 ) ) ( not ( = ?auto_160197 ?auto_160201 ) ) ( not ( = ?auto_160202 ?auto_160201 ) ) ( not ( = ?auto_160199 ?auto_160201 ) ) ( ON ?auto_160201 ?auto_160198 ) ( CLEAR ?auto_160201 ) ( not ( = ?auto_160194 ?auto_160198 ) ) ( not ( = ?auto_160195 ?auto_160198 ) ) ( not ( = ?auto_160196 ?auto_160198 ) ) ( not ( = ?auto_160197 ?auto_160198 ) ) ( not ( = ?auto_160202 ?auto_160198 ) ) ( not ( = ?auto_160199 ?auto_160198 ) ) ( not ( = ?auto_160200 ?auto_160198 ) ) ( not ( = ?auto_160201 ?auto_160198 ) ) ( HOLDING ?auto_160200 ) ( CLEAR ?auto_160199 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160194 ?auto_160195 ?auto_160196 ?auto_160197 ?auto_160202 ?auto_160199 ?auto_160200 )
      ( MAKE-4PILE ?auto_160194 ?auto_160195 ?auto_160196 ?auto_160197 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160276 - BLOCK
      ?auto_160277 - BLOCK
      ?auto_160278 - BLOCK
      ?auto_160279 - BLOCK
    )
    :vars
    (
      ?auto_160280 - BLOCK
      ?auto_160282 - BLOCK
      ?auto_160281 - BLOCK
      ?auto_160283 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160276 ) ( ON ?auto_160277 ?auto_160276 ) ( not ( = ?auto_160276 ?auto_160277 ) ) ( not ( = ?auto_160276 ?auto_160278 ) ) ( not ( = ?auto_160276 ?auto_160279 ) ) ( not ( = ?auto_160277 ?auto_160278 ) ) ( not ( = ?auto_160277 ?auto_160279 ) ) ( not ( = ?auto_160278 ?auto_160279 ) ) ( ON ?auto_160279 ?auto_160280 ) ( not ( = ?auto_160276 ?auto_160280 ) ) ( not ( = ?auto_160277 ?auto_160280 ) ) ( not ( = ?auto_160278 ?auto_160280 ) ) ( not ( = ?auto_160279 ?auto_160280 ) ) ( CLEAR ?auto_160277 ) ( ON ?auto_160278 ?auto_160279 ) ( CLEAR ?auto_160278 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_160282 ) ( ON ?auto_160281 ?auto_160282 ) ( ON ?auto_160283 ?auto_160281 ) ( ON ?auto_160280 ?auto_160283 ) ( not ( = ?auto_160282 ?auto_160281 ) ) ( not ( = ?auto_160282 ?auto_160283 ) ) ( not ( = ?auto_160282 ?auto_160280 ) ) ( not ( = ?auto_160282 ?auto_160279 ) ) ( not ( = ?auto_160282 ?auto_160278 ) ) ( not ( = ?auto_160281 ?auto_160283 ) ) ( not ( = ?auto_160281 ?auto_160280 ) ) ( not ( = ?auto_160281 ?auto_160279 ) ) ( not ( = ?auto_160281 ?auto_160278 ) ) ( not ( = ?auto_160283 ?auto_160280 ) ) ( not ( = ?auto_160283 ?auto_160279 ) ) ( not ( = ?auto_160283 ?auto_160278 ) ) ( not ( = ?auto_160276 ?auto_160282 ) ) ( not ( = ?auto_160276 ?auto_160281 ) ) ( not ( = ?auto_160276 ?auto_160283 ) ) ( not ( = ?auto_160277 ?auto_160282 ) ) ( not ( = ?auto_160277 ?auto_160281 ) ) ( not ( = ?auto_160277 ?auto_160283 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_160282 ?auto_160281 ?auto_160283 ?auto_160280 ?auto_160279 )
      ( MAKE-4PILE ?auto_160276 ?auto_160277 ?auto_160278 ?auto_160279 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160284 - BLOCK
      ?auto_160285 - BLOCK
      ?auto_160286 - BLOCK
      ?auto_160287 - BLOCK
    )
    :vars
    (
      ?auto_160290 - BLOCK
      ?auto_160291 - BLOCK
      ?auto_160289 - BLOCK
      ?auto_160288 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160284 ) ( not ( = ?auto_160284 ?auto_160285 ) ) ( not ( = ?auto_160284 ?auto_160286 ) ) ( not ( = ?auto_160284 ?auto_160287 ) ) ( not ( = ?auto_160285 ?auto_160286 ) ) ( not ( = ?auto_160285 ?auto_160287 ) ) ( not ( = ?auto_160286 ?auto_160287 ) ) ( ON ?auto_160287 ?auto_160290 ) ( not ( = ?auto_160284 ?auto_160290 ) ) ( not ( = ?auto_160285 ?auto_160290 ) ) ( not ( = ?auto_160286 ?auto_160290 ) ) ( not ( = ?auto_160287 ?auto_160290 ) ) ( ON ?auto_160286 ?auto_160287 ) ( CLEAR ?auto_160286 ) ( ON-TABLE ?auto_160291 ) ( ON ?auto_160289 ?auto_160291 ) ( ON ?auto_160288 ?auto_160289 ) ( ON ?auto_160290 ?auto_160288 ) ( not ( = ?auto_160291 ?auto_160289 ) ) ( not ( = ?auto_160291 ?auto_160288 ) ) ( not ( = ?auto_160291 ?auto_160290 ) ) ( not ( = ?auto_160291 ?auto_160287 ) ) ( not ( = ?auto_160291 ?auto_160286 ) ) ( not ( = ?auto_160289 ?auto_160288 ) ) ( not ( = ?auto_160289 ?auto_160290 ) ) ( not ( = ?auto_160289 ?auto_160287 ) ) ( not ( = ?auto_160289 ?auto_160286 ) ) ( not ( = ?auto_160288 ?auto_160290 ) ) ( not ( = ?auto_160288 ?auto_160287 ) ) ( not ( = ?auto_160288 ?auto_160286 ) ) ( not ( = ?auto_160284 ?auto_160291 ) ) ( not ( = ?auto_160284 ?auto_160289 ) ) ( not ( = ?auto_160284 ?auto_160288 ) ) ( not ( = ?auto_160285 ?auto_160291 ) ) ( not ( = ?auto_160285 ?auto_160289 ) ) ( not ( = ?auto_160285 ?auto_160288 ) ) ( HOLDING ?auto_160285 ) ( CLEAR ?auto_160284 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160284 ?auto_160285 )
      ( MAKE-4PILE ?auto_160284 ?auto_160285 ?auto_160286 ?auto_160287 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160292 - BLOCK
      ?auto_160293 - BLOCK
      ?auto_160294 - BLOCK
      ?auto_160295 - BLOCK
    )
    :vars
    (
      ?auto_160296 - BLOCK
      ?auto_160299 - BLOCK
      ?auto_160297 - BLOCK
      ?auto_160298 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160292 ) ( not ( = ?auto_160292 ?auto_160293 ) ) ( not ( = ?auto_160292 ?auto_160294 ) ) ( not ( = ?auto_160292 ?auto_160295 ) ) ( not ( = ?auto_160293 ?auto_160294 ) ) ( not ( = ?auto_160293 ?auto_160295 ) ) ( not ( = ?auto_160294 ?auto_160295 ) ) ( ON ?auto_160295 ?auto_160296 ) ( not ( = ?auto_160292 ?auto_160296 ) ) ( not ( = ?auto_160293 ?auto_160296 ) ) ( not ( = ?auto_160294 ?auto_160296 ) ) ( not ( = ?auto_160295 ?auto_160296 ) ) ( ON ?auto_160294 ?auto_160295 ) ( ON-TABLE ?auto_160299 ) ( ON ?auto_160297 ?auto_160299 ) ( ON ?auto_160298 ?auto_160297 ) ( ON ?auto_160296 ?auto_160298 ) ( not ( = ?auto_160299 ?auto_160297 ) ) ( not ( = ?auto_160299 ?auto_160298 ) ) ( not ( = ?auto_160299 ?auto_160296 ) ) ( not ( = ?auto_160299 ?auto_160295 ) ) ( not ( = ?auto_160299 ?auto_160294 ) ) ( not ( = ?auto_160297 ?auto_160298 ) ) ( not ( = ?auto_160297 ?auto_160296 ) ) ( not ( = ?auto_160297 ?auto_160295 ) ) ( not ( = ?auto_160297 ?auto_160294 ) ) ( not ( = ?auto_160298 ?auto_160296 ) ) ( not ( = ?auto_160298 ?auto_160295 ) ) ( not ( = ?auto_160298 ?auto_160294 ) ) ( not ( = ?auto_160292 ?auto_160299 ) ) ( not ( = ?auto_160292 ?auto_160297 ) ) ( not ( = ?auto_160292 ?auto_160298 ) ) ( not ( = ?auto_160293 ?auto_160299 ) ) ( not ( = ?auto_160293 ?auto_160297 ) ) ( not ( = ?auto_160293 ?auto_160298 ) ) ( CLEAR ?auto_160292 ) ( ON ?auto_160293 ?auto_160294 ) ( CLEAR ?auto_160293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160299 ?auto_160297 ?auto_160298 ?auto_160296 ?auto_160295 ?auto_160294 )
      ( MAKE-4PILE ?auto_160292 ?auto_160293 ?auto_160294 ?auto_160295 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160300 - BLOCK
      ?auto_160301 - BLOCK
      ?auto_160302 - BLOCK
      ?auto_160303 - BLOCK
    )
    :vars
    (
      ?auto_160307 - BLOCK
      ?auto_160305 - BLOCK
      ?auto_160304 - BLOCK
      ?auto_160306 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160300 ?auto_160301 ) ) ( not ( = ?auto_160300 ?auto_160302 ) ) ( not ( = ?auto_160300 ?auto_160303 ) ) ( not ( = ?auto_160301 ?auto_160302 ) ) ( not ( = ?auto_160301 ?auto_160303 ) ) ( not ( = ?auto_160302 ?auto_160303 ) ) ( ON ?auto_160303 ?auto_160307 ) ( not ( = ?auto_160300 ?auto_160307 ) ) ( not ( = ?auto_160301 ?auto_160307 ) ) ( not ( = ?auto_160302 ?auto_160307 ) ) ( not ( = ?auto_160303 ?auto_160307 ) ) ( ON ?auto_160302 ?auto_160303 ) ( ON-TABLE ?auto_160305 ) ( ON ?auto_160304 ?auto_160305 ) ( ON ?auto_160306 ?auto_160304 ) ( ON ?auto_160307 ?auto_160306 ) ( not ( = ?auto_160305 ?auto_160304 ) ) ( not ( = ?auto_160305 ?auto_160306 ) ) ( not ( = ?auto_160305 ?auto_160307 ) ) ( not ( = ?auto_160305 ?auto_160303 ) ) ( not ( = ?auto_160305 ?auto_160302 ) ) ( not ( = ?auto_160304 ?auto_160306 ) ) ( not ( = ?auto_160304 ?auto_160307 ) ) ( not ( = ?auto_160304 ?auto_160303 ) ) ( not ( = ?auto_160304 ?auto_160302 ) ) ( not ( = ?auto_160306 ?auto_160307 ) ) ( not ( = ?auto_160306 ?auto_160303 ) ) ( not ( = ?auto_160306 ?auto_160302 ) ) ( not ( = ?auto_160300 ?auto_160305 ) ) ( not ( = ?auto_160300 ?auto_160304 ) ) ( not ( = ?auto_160300 ?auto_160306 ) ) ( not ( = ?auto_160301 ?auto_160305 ) ) ( not ( = ?auto_160301 ?auto_160304 ) ) ( not ( = ?auto_160301 ?auto_160306 ) ) ( ON ?auto_160301 ?auto_160302 ) ( CLEAR ?auto_160301 ) ( HOLDING ?auto_160300 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_160300 )
      ( MAKE-4PILE ?auto_160300 ?auto_160301 ?auto_160302 ?auto_160303 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160308 - BLOCK
      ?auto_160309 - BLOCK
      ?auto_160310 - BLOCK
      ?auto_160311 - BLOCK
    )
    :vars
    (
      ?auto_160315 - BLOCK
      ?auto_160312 - BLOCK
      ?auto_160313 - BLOCK
      ?auto_160314 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160308 ?auto_160309 ) ) ( not ( = ?auto_160308 ?auto_160310 ) ) ( not ( = ?auto_160308 ?auto_160311 ) ) ( not ( = ?auto_160309 ?auto_160310 ) ) ( not ( = ?auto_160309 ?auto_160311 ) ) ( not ( = ?auto_160310 ?auto_160311 ) ) ( ON ?auto_160311 ?auto_160315 ) ( not ( = ?auto_160308 ?auto_160315 ) ) ( not ( = ?auto_160309 ?auto_160315 ) ) ( not ( = ?auto_160310 ?auto_160315 ) ) ( not ( = ?auto_160311 ?auto_160315 ) ) ( ON ?auto_160310 ?auto_160311 ) ( ON-TABLE ?auto_160312 ) ( ON ?auto_160313 ?auto_160312 ) ( ON ?auto_160314 ?auto_160313 ) ( ON ?auto_160315 ?auto_160314 ) ( not ( = ?auto_160312 ?auto_160313 ) ) ( not ( = ?auto_160312 ?auto_160314 ) ) ( not ( = ?auto_160312 ?auto_160315 ) ) ( not ( = ?auto_160312 ?auto_160311 ) ) ( not ( = ?auto_160312 ?auto_160310 ) ) ( not ( = ?auto_160313 ?auto_160314 ) ) ( not ( = ?auto_160313 ?auto_160315 ) ) ( not ( = ?auto_160313 ?auto_160311 ) ) ( not ( = ?auto_160313 ?auto_160310 ) ) ( not ( = ?auto_160314 ?auto_160315 ) ) ( not ( = ?auto_160314 ?auto_160311 ) ) ( not ( = ?auto_160314 ?auto_160310 ) ) ( not ( = ?auto_160308 ?auto_160312 ) ) ( not ( = ?auto_160308 ?auto_160313 ) ) ( not ( = ?auto_160308 ?auto_160314 ) ) ( not ( = ?auto_160309 ?auto_160312 ) ) ( not ( = ?auto_160309 ?auto_160313 ) ) ( not ( = ?auto_160309 ?auto_160314 ) ) ( ON ?auto_160309 ?auto_160310 ) ( ON ?auto_160308 ?auto_160309 ) ( CLEAR ?auto_160308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160312 ?auto_160313 ?auto_160314 ?auto_160315 ?auto_160311 ?auto_160310 ?auto_160309 )
      ( MAKE-4PILE ?auto_160308 ?auto_160309 ?auto_160310 ?auto_160311 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160320 - BLOCK
      ?auto_160321 - BLOCK
      ?auto_160322 - BLOCK
      ?auto_160323 - BLOCK
    )
    :vars
    (
      ?auto_160324 - BLOCK
      ?auto_160325 - BLOCK
      ?auto_160327 - BLOCK
      ?auto_160326 - BLOCK
      ?auto_160328 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160320 ?auto_160321 ) ) ( not ( = ?auto_160320 ?auto_160322 ) ) ( not ( = ?auto_160320 ?auto_160323 ) ) ( not ( = ?auto_160321 ?auto_160322 ) ) ( not ( = ?auto_160321 ?auto_160323 ) ) ( not ( = ?auto_160322 ?auto_160323 ) ) ( ON ?auto_160323 ?auto_160324 ) ( not ( = ?auto_160320 ?auto_160324 ) ) ( not ( = ?auto_160321 ?auto_160324 ) ) ( not ( = ?auto_160322 ?auto_160324 ) ) ( not ( = ?auto_160323 ?auto_160324 ) ) ( ON ?auto_160322 ?auto_160323 ) ( ON-TABLE ?auto_160325 ) ( ON ?auto_160327 ?auto_160325 ) ( ON ?auto_160326 ?auto_160327 ) ( ON ?auto_160324 ?auto_160326 ) ( not ( = ?auto_160325 ?auto_160327 ) ) ( not ( = ?auto_160325 ?auto_160326 ) ) ( not ( = ?auto_160325 ?auto_160324 ) ) ( not ( = ?auto_160325 ?auto_160323 ) ) ( not ( = ?auto_160325 ?auto_160322 ) ) ( not ( = ?auto_160327 ?auto_160326 ) ) ( not ( = ?auto_160327 ?auto_160324 ) ) ( not ( = ?auto_160327 ?auto_160323 ) ) ( not ( = ?auto_160327 ?auto_160322 ) ) ( not ( = ?auto_160326 ?auto_160324 ) ) ( not ( = ?auto_160326 ?auto_160323 ) ) ( not ( = ?auto_160326 ?auto_160322 ) ) ( not ( = ?auto_160320 ?auto_160325 ) ) ( not ( = ?auto_160320 ?auto_160327 ) ) ( not ( = ?auto_160320 ?auto_160326 ) ) ( not ( = ?auto_160321 ?auto_160325 ) ) ( not ( = ?auto_160321 ?auto_160327 ) ) ( not ( = ?auto_160321 ?auto_160326 ) ) ( ON ?auto_160321 ?auto_160322 ) ( CLEAR ?auto_160321 ) ( ON ?auto_160320 ?auto_160328 ) ( CLEAR ?auto_160320 ) ( HAND-EMPTY ) ( not ( = ?auto_160320 ?auto_160328 ) ) ( not ( = ?auto_160321 ?auto_160328 ) ) ( not ( = ?auto_160322 ?auto_160328 ) ) ( not ( = ?auto_160323 ?auto_160328 ) ) ( not ( = ?auto_160324 ?auto_160328 ) ) ( not ( = ?auto_160325 ?auto_160328 ) ) ( not ( = ?auto_160327 ?auto_160328 ) ) ( not ( = ?auto_160326 ?auto_160328 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_160320 ?auto_160328 )
      ( MAKE-4PILE ?auto_160320 ?auto_160321 ?auto_160322 ?auto_160323 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160329 - BLOCK
      ?auto_160330 - BLOCK
      ?auto_160331 - BLOCK
      ?auto_160332 - BLOCK
    )
    :vars
    (
      ?auto_160334 - BLOCK
      ?auto_160337 - BLOCK
      ?auto_160336 - BLOCK
      ?auto_160335 - BLOCK
      ?auto_160333 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160329 ?auto_160330 ) ) ( not ( = ?auto_160329 ?auto_160331 ) ) ( not ( = ?auto_160329 ?auto_160332 ) ) ( not ( = ?auto_160330 ?auto_160331 ) ) ( not ( = ?auto_160330 ?auto_160332 ) ) ( not ( = ?auto_160331 ?auto_160332 ) ) ( ON ?auto_160332 ?auto_160334 ) ( not ( = ?auto_160329 ?auto_160334 ) ) ( not ( = ?auto_160330 ?auto_160334 ) ) ( not ( = ?auto_160331 ?auto_160334 ) ) ( not ( = ?auto_160332 ?auto_160334 ) ) ( ON ?auto_160331 ?auto_160332 ) ( ON-TABLE ?auto_160337 ) ( ON ?auto_160336 ?auto_160337 ) ( ON ?auto_160335 ?auto_160336 ) ( ON ?auto_160334 ?auto_160335 ) ( not ( = ?auto_160337 ?auto_160336 ) ) ( not ( = ?auto_160337 ?auto_160335 ) ) ( not ( = ?auto_160337 ?auto_160334 ) ) ( not ( = ?auto_160337 ?auto_160332 ) ) ( not ( = ?auto_160337 ?auto_160331 ) ) ( not ( = ?auto_160336 ?auto_160335 ) ) ( not ( = ?auto_160336 ?auto_160334 ) ) ( not ( = ?auto_160336 ?auto_160332 ) ) ( not ( = ?auto_160336 ?auto_160331 ) ) ( not ( = ?auto_160335 ?auto_160334 ) ) ( not ( = ?auto_160335 ?auto_160332 ) ) ( not ( = ?auto_160335 ?auto_160331 ) ) ( not ( = ?auto_160329 ?auto_160337 ) ) ( not ( = ?auto_160329 ?auto_160336 ) ) ( not ( = ?auto_160329 ?auto_160335 ) ) ( not ( = ?auto_160330 ?auto_160337 ) ) ( not ( = ?auto_160330 ?auto_160336 ) ) ( not ( = ?auto_160330 ?auto_160335 ) ) ( ON ?auto_160329 ?auto_160333 ) ( CLEAR ?auto_160329 ) ( not ( = ?auto_160329 ?auto_160333 ) ) ( not ( = ?auto_160330 ?auto_160333 ) ) ( not ( = ?auto_160331 ?auto_160333 ) ) ( not ( = ?auto_160332 ?auto_160333 ) ) ( not ( = ?auto_160334 ?auto_160333 ) ) ( not ( = ?auto_160337 ?auto_160333 ) ) ( not ( = ?auto_160336 ?auto_160333 ) ) ( not ( = ?auto_160335 ?auto_160333 ) ) ( HOLDING ?auto_160330 ) ( CLEAR ?auto_160331 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160337 ?auto_160336 ?auto_160335 ?auto_160334 ?auto_160332 ?auto_160331 ?auto_160330 )
      ( MAKE-4PILE ?auto_160329 ?auto_160330 ?auto_160331 ?auto_160332 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160338 - BLOCK
      ?auto_160339 - BLOCK
      ?auto_160340 - BLOCK
      ?auto_160341 - BLOCK
    )
    :vars
    (
      ?auto_160346 - BLOCK
      ?auto_160344 - BLOCK
      ?auto_160342 - BLOCK
      ?auto_160343 - BLOCK
      ?auto_160345 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160338 ?auto_160339 ) ) ( not ( = ?auto_160338 ?auto_160340 ) ) ( not ( = ?auto_160338 ?auto_160341 ) ) ( not ( = ?auto_160339 ?auto_160340 ) ) ( not ( = ?auto_160339 ?auto_160341 ) ) ( not ( = ?auto_160340 ?auto_160341 ) ) ( ON ?auto_160341 ?auto_160346 ) ( not ( = ?auto_160338 ?auto_160346 ) ) ( not ( = ?auto_160339 ?auto_160346 ) ) ( not ( = ?auto_160340 ?auto_160346 ) ) ( not ( = ?auto_160341 ?auto_160346 ) ) ( ON ?auto_160340 ?auto_160341 ) ( ON-TABLE ?auto_160344 ) ( ON ?auto_160342 ?auto_160344 ) ( ON ?auto_160343 ?auto_160342 ) ( ON ?auto_160346 ?auto_160343 ) ( not ( = ?auto_160344 ?auto_160342 ) ) ( not ( = ?auto_160344 ?auto_160343 ) ) ( not ( = ?auto_160344 ?auto_160346 ) ) ( not ( = ?auto_160344 ?auto_160341 ) ) ( not ( = ?auto_160344 ?auto_160340 ) ) ( not ( = ?auto_160342 ?auto_160343 ) ) ( not ( = ?auto_160342 ?auto_160346 ) ) ( not ( = ?auto_160342 ?auto_160341 ) ) ( not ( = ?auto_160342 ?auto_160340 ) ) ( not ( = ?auto_160343 ?auto_160346 ) ) ( not ( = ?auto_160343 ?auto_160341 ) ) ( not ( = ?auto_160343 ?auto_160340 ) ) ( not ( = ?auto_160338 ?auto_160344 ) ) ( not ( = ?auto_160338 ?auto_160342 ) ) ( not ( = ?auto_160338 ?auto_160343 ) ) ( not ( = ?auto_160339 ?auto_160344 ) ) ( not ( = ?auto_160339 ?auto_160342 ) ) ( not ( = ?auto_160339 ?auto_160343 ) ) ( ON ?auto_160338 ?auto_160345 ) ( not ( = ?auto_160338 ?auto_160345 ) ) ( not ( = ?auto_160339 ?auto_160345 ) ) ( not ( = ?auto_160340 ?auto_160345 ) ) ( not ( = ?auto_160341 ?auto_160345 ) ) ( not ( = ?auto_160346 ?auto_160345 ) ) ( not ( = ?auto_160344 ?auto_160345 ) ) ( not ( = ?auto_160342 ?auto_160345 ) ) ( not ( = ?auto_160343 ?auto_160345 ) ) ( CLEAR ?auto_160340 ) ( ON ?auto_160339 ?auto_160338 ) ( CLEAR ?auto_160339 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_160345 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160345 ?auto_160338 )
      ( MAKE-4PILE ?auto_160338 ?auto_160339 ?auto_160340 ?auto_160341 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160347 - BLOCK
      ?auto_160348 - BLOCK
      ?auto_160349 - BLOCK
      ?auto_160350 - BLOCK
    )
    :vars
    (
      ?auto_160351 - BLOCK
      ?auto_160352 - BLOCK
      ?auto_160354 - BLOCK
      ?auto_160353 - BLOCK
      ?auto_160355 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160347 ?auto_160348 ) ) ( not ( = ?auto_160347 ?auto_160349 ) ) ( not ( = ?auto_160347 ?auto_160350 ) ) ( not ( = ?auto_160348 ?auto_160349 ) ) ( not ( = ?auto_160348 ?auto_160350 ) ) ( not ( = ?auto_160349 ?auto_160350 ) ) ( ON ?auto_160350 ?auto_160351 ) ( not ( = ?auto_160347 ?auto_160351 ) ) ( not ( = ?auto_160348 ?auto_160351 ) ) ( not ( = ?auto_160349 ?auto_160351 ) ) ( not ( = ?auto_160350 ?auto_160351 ) ) ( ON-TABLE ?auto_160352 ) ( ON ?auto_160354 ?auto_160352 ) ( ON ?auto_160353 ?auto_160354 ) ( ON ?auto_160351 ?auto_160353 ) ( not ( = ?auto_160352 ?auto_160354 ) ) ( not ( = ?auto_160352 ?auto_160353 ) ) ( not ( = ?auto_160352 ?auto_160351 ) ) ( not ( = ?auto_160352 ?auto_160350 ) ) ( not ( = ?auto_160352 ?auto_160349 ) ) ( not ( = ?auto_160354 ?auto_160353 ) ) ( not ( = ?auto_160354 ?auto_160351 ) ) ( not ( = ?auto_160354 ?auto_160350 ) ) ( not ( = ?auto_160354 ?auto_160349 ) ) ( not ( = ?auto_160353 ?auto_160351 ) ) ( not ( = ?auto_160353 ?auto_160350 ) ) ( not ( = ?auto_160353 ?auto_160349 ) ) ( not ( = ?auto_160347 ?auto_160352 ) ) ( not ( = ?auto_160347 ?auto_160354 ) ) ( not ( = ?auto_160347 ?auto_160353 ) ) ( not ( = ?auto_160348 ?auto_160352 ) ) ( not ( = ?auto_160348 ?auto_160354 ) ) ( not ( = ?auto_160348 ?auto_160353 ) ) ( ON ?auto_160347 ?auto_160355 ) ( not ( = ?auto_160347 ?auto_160355 ) ) ( not ( = ?auto_160348 ?auto_160355 ) ) ( not ( = ?auto_160349 ?auto_160355 ) ) ( not ( = ?auto_160350 ?auto_160355 ) ) ( not ( = ?auto_160351 ?auto_160355 ) ) ( not ( = ?auto_160352 ?auto_160355 ) ) ( not ( = ?auto_160354 ?auto_160355 ) ) ( not ( = ?auto_160353 ?auto_160355 ) ) ( ON ?auto_160348 ?auto_160347 ) ( CLEAR ?auto_160348 ) ( ON-TABLE ?auto_160355 ) ( HOLDING ?auto_160349 ) ( CLEAR ?auto_160350 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160352 ?auto_160354 ?auto_160353 ?auto_160351 ?auto_160350 ?auto_160349 )
      ( MAKE-4PILE ?auto_160347 ?auto_160348 ?auto_160349 ?auto_160350 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160356 - BLOCK
      ?auto_160357 - BLOCK
      ?auto_160358 - BLOCK
      ?auto_160359 - BLOCK
    )
    :vars
    (
      ?auto_160361 - BLOCK
      ?auto_160364 - BLOCK
      ?auto_160360 - BLOCK
      ?auto_160362 - BLOCK
      ?auto_160363 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160356 ?auto_160357 ) ) ( not ( = ?auto_160356 ?auto_160358 ) ) ( not ( = ?auto_160356 ?auto_160359 ) ) ( not ( = ?auto_160357 ?auto_160358 ) ) ( not ( = ?auto_160357 ?auto_160359 ) ) ( not ( = ?auto_160358 ?auto_160359 ) ) ( ON ?auto_160359 ?auto_160361 ) ( not ( = ?auto_160356 ?auto_160361 ) ) ( not ( = ?auto_160357 ?auto_160361 ) ) ( not ( = ?auto_160358 ?auto_160361 ) ) ( not ( = ?auto_160359 ?auto_160361 ) ) ( ON-TABLE ?auto_160364 ) ( ON ?auto_160360 ?auto_160364 ) ( ON ?auto_160362 ?auto_160360 ) ( ON ?auto_160361 ?auto_160362 ) ( not ( = ?auto_160364 ?auto_160360 ) ) ( not ( = ?auto_160364 ?auto_160362 ) ) ( not ( = ?auto_160364 ?auto_160361 ) ) ( not ( = ?auto_160364 ?auto_160359 ) ) ( not ( = ?auto_160364 ?auto_160358 ) ) ( not ( = ?auto_160360 ?auto_160362 ) ) ( not ( = ?auto_160360 ?auto_160361 ) ) ( not ( = ?auto_160360 ?auto_160359 ) ) ( not ( = ?auto_160360 ?auto_160358 ) ) ( not ( = ?auto_160362 ?auto_160361 ) ) ( not ( = ?auto_160362 ?auto_160359 ) ) ( not ( = ?auto_160362 ?auto_160358 ) ) ( not ( = ?auto_160356 ?auto_160364 ) ) ( not ( = ?auto_160356 ?auto_160360 ) ) ( not ( = ?auto_160356 ?auto_160362 ) ) ( not ( = ?auto_160357 ?auto_160364 ) ) ( not ( = ?auto_160357 ?auto_160360 ) ) ( not ( = ?auto_160357 ?auto_160362 ) ) ( ON ?auto_160356 ?auto_160363 ) ( not ( = ?auto_160356 ?auto_160363 ) ) ( not ( = ?auto_160357 ?auto_160363 ) ) ( not ( = ?auto_160358 ?auto_160363 ) ) ( not ( = ?auto_160359 ?auto_160363 ) ) ( not ( = ?auto_160361 ?auto_160363 ) ) ( not ( = ?auto_160364 ?auto_160363 ) ) ( not ( = ?auto_160360 ?auto_160363 ) ) ( not ( = ?auto_160362 ?auto_160363 ) ) ( ON ?auto_160357 ?auto_160356 ) ( ON-TABLE ?auto_160363 ) ( CLEAR ?auto_160359 ) ( ON ?auto_160358 ?auto_160357 ) ( CLEAR ?auto_160358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_160363 ?auto_160356 ?auto_160357 )
      ( MAKE-4PILE ?auto_160356 ?auto_160357 ?auto_160358 ?auto_160359 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160365 - BLOCK
      ?auto_160366 - BLOCK
      ?auto_160367 - BLOCK
      ?auto_160368 - BLOCK
    )
    :vars
    (
      ?auto_160372 - BLOCK
      ?auto_160370 - BLOCK
      ?auto_160369 - BLOCK
      ?auto_160373 - BLOCK
      ?auto_160371 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160365 ?auto_160366 ) ) ( not ( = ?auto_160365 ?auto_160367 ) ) ( not ( = ?auto_160365 ?auto_160368 ) ) ( not ( = ?auto_160366 ?auto_160367 ) ) ( not ( = ?auto_160366 ?auto_160368 ) ) ( not ( = ?auto_160367 ?auto_160368 ) ) ( not ( = ?auto_160365 ?auto_160372 ) ) ( not ( = ?auto_160366 ?auto_160372 ) ) ( not ( = ?auto_160367 ?auto_160372 ) ) ( not ( = ?auto_160368 ?auto_160372 ) ) ( ON-TABLE ?auto_160370 ) ( ON ?auto_160369 ?auto_160370 ) ( ON ?auto_160373 ?auto_160369 ) ( ON ?auto_160372 ?auto_160373 ) ( not ( = ?auto_160370 ?auto_160369 ) ) ( not ( = ?auto_160370 ?auto_160373 ) ) ( not ( = ?auto_160370 ?auto_160372 ) ) ( not ( = ?auto_160370 ?auto_160368 ) ) ( not ( = ?auto_160370 ?auto_160367 ) ) ( not ( = ?auto_160369 ?auto_160373 ) ) ( not ( = ?auto_160369 ?auto_160372 ) ) ( not ( = ?auto_160369 ?auto_160368 ) ) ( not ( = ?auto_160369 ?auto_160367 ) ) ( not ( = ?auto_160373 ?auto_160372 ) ) ( not ( = ?auto_160373 ?auto_160368 ) ) ( not ( = ?auto_160373 ?auto_160367 ) ) ( not ( = ?auto_160365 ?auto_160370 ) ) ( not ( = ?auto_160365 ?auto_160369 ) ) ( not ( = ?auto_160365 ?auto_160373 ) ) ( not ( = ?auto_160366 ?auto_160370 ) ) ( not ( = ?auto_160366 ?auto_160369 ) ) ( not ( = ?auto_160366 ?auto_160373 ) ) ( ON ?auto_160365 ?auto_160371 ) ( not ( = ?auto_160365 ?auto_160371 ) ) ( not ( = ?auto_160366 ?auto_160371 ) ) ( not ( = ?auto_160367 ?auto_160371 ) ) ( not ( = ?auto_160368 ?auto_160371 ) ) ( not ( = ?auto_160372 ?auto_160371 ) ) ( not ( = ?auto_160370 ?auto_160371 ) ) ( not ( = ?auto_160369 ?auto_160371 ) ) ( not ( = ?auto_160373 ?auto_160371 ) ) ( ON ?auto_160366 ?auto_160365 ) ( ON-TABLE ?auto_160371 ) ( ON ?auto_160367 ?auto_160366 ) ( CLEAR ?auto_160367 ) ( HOLDING ?auto_160368 ) ( CLEAR ?auto_160372 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_160370 ?auto_160369 ?auto_160373 ?auto_160372 ?auto_160368 )
      ( MAKE-4PILE ?auto_160365 ?auto_160366 ?auto_160367 ?auto_160368 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160374 - BLOCK
      ?auto_160375 - BLOCK
      ?auto_160376 - BLOCK
      ?auto_160377 - BLOCK
    )
    :vars
    (
      ?auto_160381 - BLOCK
      ?auto_160379 - BLOCK
      ?auto_160378 - BLOCK
      ?auto_160380 - BLOCK
      ?auto_160382 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160374 ?auto_160375 ) ) ( not ( = ?auto_160374 ?auto_160376 ) ) ( not ( = ?auto_160374 ?auto_160377 ) ) ( not ( = ?auto_160375 ?auto_160376 ) ) ( not ( = ?auto_160375 ?auto_160377 ) ) ( not ( = ?auto_160376 ?auto_160377 ) ) ( not ( = ?auto_160374 ?auto_160381 ) ) ( not ( = ?auto_160375 ?auto_160381 ) ) ( not ( = ?auto_160376 ?auto_160381 ) ) ( not ( = ?auto_160377 ?auto_160381 ) ) ( ON-TABLE ?auto_160379 ) ( ON ?auto_160378 ?auto_160379 ) ( ON ?auto_160380 ?auto_160378 ) ( ON ?auto_160381 ?auto_160380 ) ( not ( = ?auto_160379 ?auto_160378 ) ) ( not ( = ?auto_160379 ?auto_160380 ) ) ( not ( = ?auto_160379 ?auto_160381 ) ) ( not ( = ?auto_160379 ?auto_160377 ) ) ( not ( = ?auto_160379 ?auto_160376 ) ) ( not ( = ?auto_160378 ?auto_160380 ) ) ( not ( = ?auto_160378 ?auto_160381 ) ) ( not ( = ?auto_160378 ?auto_160377 ) ) ( not ( = ?auto_160378 ?auto_160376 ) ) ( not ( = ?auto_160380 ?auto_160381 ) ) ( not ( = ?auto_160380 ?auto_160377 ) ) ( not ( = ?auto_160380 ?auto_160376 ) ) ( not ( = ?auto_160374 ?auto_160379 ) ) ( not ( = ?auto_160374 ?auto_160378 ) ) ( not ( = ?auto_160374 ?auto_160380 ) ) ( not ( = ?auto_160375 ?auto_160379 ) ) ( not ( = ?auto_160375 ?auto_160378 ) ) ( not ( = ?auto_160375 ?auto_160380 ) ) ( ON ?auto_160374 ?auto_160382 ) ( not ( = ?auto_160374 ?auto_160382 ) ) ( not ( = ?auto_160375 ?auto_160382 ) ) ( not ( = ?auto_160376 ?auto_160382 ) ) ( not ( = ?auto_160377 ?auto_160382 ) ) ( not ( = ?auto_160381 ?auto_160382 ) ) ( not ( = ?auto_160379 ?auto_160382 ) ) ( not ( = ?auto_160378 ?auto_160382 ) ) ( not ( = ?auto_160380 ?auto_160382 ) ) ( ON ?auto_160375 ?auto_160374 ) ( ON-TABLE ?auto_160382 ) ( ON ?auto_160376 ?auto_160375 ) ( CLEAR ?auto_160381 ) ( ON ?auto_160377 ?auto_160376 ) ( CLEAR ?auto_160377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_160382 ?auto_160374 ?auto_160375 ?auto_160376 )
      ( MAKE-4PILE ?auto_160374 ?auto_160375 ?auto_160376 ?auto_160377 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160383 - BLOCK
      ?auto_160384 - BLOCK
      ?auto_160385 - BLOCK
      ?auto_160386 - BLOCK
    )
    :vars
    (
      ?auto_160389 - BLOCK
      ?auto_160388 - BLOCK
      ?auto_160391 - BLOCK
      ?auto_160387 - BLOCK
      ?auto_160390 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160383 ?auto_160384 ) ) ( not ( = ?auto_160383 ?auto_160385 ) ) ( not ( = ?auto_160383 ?auto_160386 ) ) ( not ( = ?auto_160384 ?auto_160385 ) ) ( not ( = ?auto_160384 ?auto_160386 ) ) ( not ( = ?auto_160385 ?auto_160386 ) ) ( not ( = ?auto_160383 ?auto_160389 ) ) ( not ( = ?auto_160384 ?auto_160389 ) ) ( not ( = ?auto_160385 ?auto_160389 ) ) ( not ( = ?auto_160386 ?auto_160389 ) ) ( ON-TABLE ?auto_160388 ) ( ON ?auto_160391 ?auto_160388 ) ( ON ?auto_160387 ?auto_160391 ) ( not ( = ?auto_160388 ?auto_160391 ) ) ( not ( = ?auto_160388 ?auto_160387 ) ) ( not ( = ?auto_160388 ?auto_160389 ) ) ( not ( = ?auto_160388 ?auto_160386 ) ) ( not ( = ?auto_160388 ?auto_160385 ) ) ( not ( = ?auto_160391 ?auto_160387 ) ) ( not ( = ?auto_160391 ?auto_160389 ) ) ( not ( = ?auto_160391 ?auto_160386 ) ) ( not ( = ?auto_160391 ?auto_160385 ) ) ( not ( = ?auto_160387 ?auto_160389 ) ) ( not ( = ?auto_160387 ?auto_160386 ) ) ( not ( = ?auto_160387 ?auto_160385 ) ) ( not ( = ?auto_160383 ?auto_160388 ) ) ( not ( = ?auto_160383 ?auto_160391 ) ) ( not ( = ?auto_160383 ?auto_160387 ) ) ( not ( = ?auto_160384 ?auto_160388 ) ) ( not ( = ?auto_160384 ?auto_160391 ) ) ( not ( = ?auto_160384 ?auto_160387 ) ) ( ON ?auto_160383 ?auto_160390 ) ( not ( = ?auto_160383 ?auto_160390 ) ) ( not ( = ?auto_160384 ?auto_160390 ) ) ( not ( = ?auto_160385 ?auto_160390 ) ) ( not ( = ?auto_160386 ?auto_160390 ) ) ( not ( = ?auto_160389 ?auto_160390 ) ) ( not ( = ?auto_160388 ?auto_160390 ) ) ( not ( = ?auto_160391 ?auto_160390 ) ) ( not ( = ?auto_160387 ?auto_160390 ) ) ( ON ?auto_160384 ?auto_160383 ) ( ON-TABLE ?auto_160390 ) ( ON ?auto_160385 ?auto_160384 ) ( ON ?auto_160386 ?auto_160385 ) ( CLEAR ?auto_160386 ) ( HOLDING ?auto_160389 ) ( CLEAR ?auto_160387 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_160388 ?auto_160391 ?auto_160387 ?auto_160389 )
      ( MAKE-4PILE ?auto_160383 ?auto_160384 ?auto_160385 ?auto_160386 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160392 - BLOCK
      ?auto_160393 - BLOCK
      ?auto_160394 - BLOCK
      ?auto_160395 - BLOCK
    )
    :vars
    (
      ?auto_160400 - BLOCK
      ?auto_160397 - BLOCK
      ?auto_160399 - BLOCK
      ?auto_160398 - BLOCK
      ?auto_160396 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160392 ?auto_160393 ) ) ( not ( = ?auto_160392 ?auto_160394 ) ) ( not ( = ?auto_160392 ?auto_160395 ) ) ( not ( = ?auto_160393 ?auto_160394 ) ) ( not ( = ?auto_160393 ?auto_160395 ) ) ( not ( = ?auto_160394 ?auto_160395 ) ) ( not ( = ?auto_160392 ?auto_160400 ) ) ( not ( = ?auto_160393 ?auto_160400 ) ) ( not ( = ?auto_160394 ?auto_160400 ) ) ( not ( = ?auto_160395 ?auto_160400 ) ) ( ON-TABLE ?auto_160397 ) ( ON ?auto_160399 ?auto_160397 ) ( ON ?auto_160398 ?auto_160399 ) ( not ( = ?auto_160397 ?auto_160399 ) ) ( not ( = ?auto_160397 ?auto_160398 ) ) ( not ( = ?auto_160397 ?auto_160400 ) ) ( not ( = ?auto_160397 ?auto_160395 ) ) ( not ( = ?auto_160397 ?auto_160394 ) ) ( not ( = ?auto_160399 ?auto_160398 ) ) ( not ( = ?auto_160399 ?auto_160400 ) ) ( not ( = ?auto_160399 ?auto_160395 ) ) ( not ( = ?auto_160399 ?auto_160394 ) ) ( not ( = ?auto_160398 ?auto_160400 ) ) ( not ( = ?auto_160398 ?auto_160395 ) ) ( not ( = ?auto_160398 ?auto_160394 ) ) ( not ( = ?auto_160392 ?auto_160397 ) ) ( not ( = ?auto_160392 ?auto_160399 ) ) ( not ( = ?auto_160392 ?auto_160398 ) ) ( not ( = ?auto_160393 ?auto_160397 ) ) ( not ( = ?auto_160393 ?auto_160399 ) ) ( not ( = ?auto_160393 ?auto_160398 ) ) ( ON ?auto_160392 ?auto_160396 ) ( not ( = ?auto_160392 ?auto_160396 ) ) ( not ( = ?auto_160393 ?auto_160396 ) ) ( not ( = ?auto_160394 ?auto_160396 ) ) ( not ( = ?auto_160395 ?auto_160396 ) ) ( not ( = ?auto_160400 ?auto_160396 ) ) ( not ( = ?auto_160397 ?auto_160396 ) ) ( not ( = ?auto_160399 ?auto_160396 ) ) ( not ( = ?auto_160398 ?auto_160396 ) ) ( ON ?auto_160393 ?auto_160392 ) ( ON-TABLE ?auto_160396 ) ( ON ?auto_160394 ?auto_160393 ) ( ON ?auto_160395 ?auto_160394 ) ( CLEAR ?auto_160398 ) ( ON ?auto_160400 ?auto_160395 ) ( CLEAR ?auto_160400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_160396 ?auto_160392 ?auto_160393 ?auto_160394 ?auto_160395 )
      ( MAKE-4PILE ?auto_160392 ?auto_160393 ?auto_160394 ?auto_160395 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160401 - BLOCK
      ?auto_160402 - BLOCK
      ?auto_160403 - BLOCK
      ?auto_160404 - BLOCK
    )
    :vars
    (
      ?auto_160405 - BLOCK
      ?auto_160408 - BLOCK
      ?auto_160409 - BLOCK
      ?auto_160406 - BLOCK
      ?auto_160407 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160401 ?auto_160402 ) ) ( not ( = ?auto_160401 ?auto_160403 ) ) ( not ( = ?auto_160401 ?auto_160404 ) ) ( not ( = ?auto_160402 ?auto_160403 ) ) ( not ( = ?auto_160402 ?auto_160404 ) ) ( not ( = ?auto_160403 ?auto_160404 ) ) ( not ( = ?auto_160401 ?auto_160405 ) ) ( not ( = ?auto_160402 ?auto_160405 ) ) ( not ( = ?auto_160403 ?auto_160405 ) ) ( not ( = ?auto_160404 ?auto_160405 ) ) ( ON-TABLE ?auto_160408 ) ( ON ?auto_160409 ?auto_160408 ) ( not ( = ?auto_160408 ?auto_160409 ) ) ( not ( = ?auto_160408 ?auto_160406 ) ) ( not ( = ?auto_160408 ?auto_160405 ) ) ( not ( = ?auto_160408 ?auto_160404 ) ) ( not ( = ?auto_160408 ?auto_160403 ) ) ( not ( = ?auto_160409 ?auto_160406 ) ) ( not ( = ?auto_160409 ?auto_160405 ) ) ( not ( = ?auto_160409 ?auto_160404 ) ) ( not ( = ?auto_160409 ?auto_160403 ) ) ( not ( = ?auto_160406 ?auto_160405 ) ) ( not ( = ?auto_160406 ?auto_160404 ) ) ( not ( = ?auto_160406 ?auto_160403 ) ) ( not ( = ?auto_160401 ?auto_160408 ) ) ( not ( = ?auto_160401 ?auto_160409 ) ) ( not ( = ?auto_160401 ?auto_160406 ) ) ( not ( = ?auto_160402 ?auto_160408 ) ) ( not ( = ?auto_160402 ?auto_160409 ) ) ( not ( = ?auto_160402 ?auto_160406 ) ) ( ON ?auto_160401 ?auto_160407 ) ( not ( = ?auto_160401 ?auto_160407 ) ) ( not ( = ?auto_160402 ?auto_160407 ) ) ( not ( = ?auto_160403 ?auto_160407 ) ) ( not ( = ?auto_160404 ?auto_160407 ) ) ( not ( = ?auto_160405 ?auto_160407 ) ) ( not ( = ?auto_160408 ?auto_160407 ) ) ( not ( = ?auto_160409 ?auto_160407 ) ) ( not ( = ?auto_160406 ?auto_160407 ) ) ( ON ?auto_160402 ?auto_160401 ) ( ON-TABLE ?auto_160407 ) ( ON ?auto_160403 ?auto_160402 ) ( ON ?auto_160404 ?auto_160403 ) ( ON ?auto_160405 ?auto_160404 ) ( CLEAR ?auto_160405 ) ( HOLDING ?auto_160406 ) ( CLEAR ?auto_160409 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_160408 ?auto_160409 ?auto_160406 )
      ( MAKE-4PILE ?auto_160401 ?auto_160402 ?auto_160403 ?auto_160404 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160410 - BLOCK
      ?auto_160411 - BLOCK
      ?auto_160412 - BLOCK
      ?auto_160413 - BLOCK
    )
    :vars
    (
      ?auto_160414 - BLOCK
      ?auto_160416 - BLOCK
      ?auto_160415 - BLOCK
      ?auto_160417 - BLOCK
      ?auto_160418 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160410 ?auto_160411 ) ) ( not ( = ?auto_160410 ?auto_160412 ) ) ( not ( = ?auto_160410 ?auto_160413 ) ) ( not ( = ?auto_160411 ?auto_160412 ) ) ( not ( = ?auto_160411 ?auto_160413 ) ) ( not ( = ?auto_160412 ?auto_160413 ) ) ( not ( = ?auto_160410 ?auto_160414 ) ) ( not ( = ?auto_160411 ?auto_160414 ) ) ( not ( = ?auto_160412 ?auto_160414 ) ) ( not ( = ?auto_160413 ?auto_160414 ) ) ( ON-TABLE ?auto_160416 ) ( ON ?auto_160415 ?auto_160416 ) ( not ( = ?auto_160416 ?auto_160415 ) ) ( not ( = ?auto_160416 ?auto_160417 ) ) ( not ( = ?auto_160416 ?auto_160414 ) ) ( not ( = ?auto_160416 ?auto_160413 ) ) ( not ( = ?auto_160416 ?auto_160412 ) ) ( not ( = ?auto_160415 ?auto_160417 ) ) ( not ( = ?auto_160415 ?auto_160414 ) ) ( not ( = ?auto_160415 ?auto_160413 ) ) ( not ( = ?auto_160415 ?auto_160412 ) ) ( not ( = ?auto_160417 ?auto_160414 ) ) ( not ( = ?auto_160417 ?auto_160413 ) ) ( not ( = ?auto_160417 ?auto_160412 ) ) ( not ( = ?auto_160410 ?auto_160416 ) ) ( not ( = ?auto_160410 ?auto_160415 ) ) ( not ( = ?auto_160410 ?auto_160417 ) ) ( not ( = ?auto_160411 ?auto_160416 ) ) ( not ( = ?auto_160411 ?auto_160415 ) ) ( not ( = ?auto_160411 ?auto_160417 ) ) ( ON ?auto_160410 ?auto_160418 ) ( not ( = ?auto_160410 ?auto_160418 ) ) ( not ( = ?auto_160411 ?auto_160418 ) ) ( not ( = ?auto_160412 ?auto_160418 ) ) ( not ( = ?auto_160413 ?auto_160418 ) ) ( not ( = ?auto_160414 ?auto_160418 ) ) ( not ( = ?auto_160416 ?auto_160418 ) ) ( not ( = ?auto_160415 ?auto_160418 ) ) ( not ( = ?auto_160417 ?auto_160418 ) ) ( ON ?auto_160411 ?auto_160410 ) ( ON-TABLE ?auto_160418 ) ( ON ?auto_160412 ?auto_160411 ) ( ON ?auto_160413 ?auto_160412 ) ( ON ?auto_160414 ?auto_160413 ) ( CLEAR ?auto_160415 ) ( ON ?auto_160417 ?auto_160414 ) ( CLEAR ?auto_160417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160418 ?auto_160410 ?auto_160411 ?auto_160412 ?auto_160413 ?auto_160414 )
      ( MAKE-4PILE ?auto_160410 ?auto_160411 ?auto_160412 ?auto_160413 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160419 - BLOCK
      ?auto_160420 - BLOCK
      ?auto_160421 - BLOCK
      ?auto_160422 - BLOCK
    )
    :vars
    (
      ?auto_160426 - BLOCK
      ?auto_160427 - BLOCK
      ?auto_160425 - BLOCK
      ?auto_160424 - BLOCK
      ?auto_160423 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160419 ?auto_160420 ) ) ( not ( = ?auto_160419 ?auto_160421 ) ) ( not ( = ?auto_160419 ?auto_160422 ) ) ( not ( = ?auto_160420 ?auto_160421 ) ) ( not ( = ?auto_160420 ?auto_160422 ) ) ( not ( = ?auto_160421 ?auto_160422 ) ) ( not ( = ?auto_160419 ?auto_160426 ) ) ( not ( = ?auto_160420 ?auto_160426 ) ) ( not ( = ?auto_160421 ?auto_160426 ) ) ( not ( = ?auto_160422 ?auto_160426 ) ) ( ON-TABLE ?auto_160427 ) ( not ( = ?auto_160427 ?auto_160425 ) ) ( not ( = ?auto_160427 ?auto_160424 ) ) ( not ( = ?auto_160427 ?auto_160426 ) ) ( not ( = ?auto_160427 ?auto_160422 ) ) ( not ( = ?auto_160427 ?auto_160421 ) ) ( not ( = ?auto_160425 ?auto_160424 ) ) ( not ( = ?auto_160425 ?auto_160426 ) ) ( not ( = ?auto_160425 ?auto_160422 ) ) ( not ( = ?auto_160425 ?auto_160421 ) ) ( not ( = ?auto_160424 ?auto_160426 ) ) ( not ( = ?auto_160424 ?auto_160422 ) ) ( not ( = ?auto_160424 ?auto_160421 ) ) ( not ( = ?auto_160419 ?auto_160427 ) ) ( not ( = ?auto_160419 ?auto_160425 ) ) ( not ( = ?auto_160419 ?auto_160424 ) ) ( not ( = ?auto_160420 ?auto_160427 ) ) ( not ( = ?auto_160420 ?auto_160425 ) ) ( not ( = ?auto_160420 ?auto_160424 ) ) ( ON ?auto_160419 ?auto_160423 ) ( not ( = ?auto_160419 ?auto_160423 ) ) ( not ( = ?auto_160420 ?auto_160423 ) ) ( not ( = ?auto_160421 ?auto_160423 ) ) ( not ( = ?auto_160422 ?auto_160423 ) ) ( not ( = ?auto_160426 ?auto_160423 ) ) ( not ( = ?auto_160427 ?auto_160423 ) ) ( not ( = ?auto_160425 ?auto_160423 ) ) ( not ( = ?auto_160424 ?auto_160423 ) ) ( ON ?auto_160420 ?auto_160419 ) ( ON-TABLE ?auto_160423 ) ( ON ?auto_160421 ?auto_160420 ) ( ON ?auto_160422 ?auto_160421 ) ( ON ?auto_160426 ?auto_160422 ) ( ON ?auto_160424 ?auto_160426 ) ( CLEAR ?auto_160424 ) ( HOLDING ?auto_160425 ) ( CLEAR ?auto_160427 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160427 ?auto_160425 )
      ( MAKE-4PILE ?auto_160419 ?auto_160420 ?auto_160421 ?auto_160422 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160428 - BLOCK
      ?auto_160429 - BLOCK
      ?auto_160430 - BLOCK
      ?auto_160431 - BLOCK
    )
    :vars
    (
      ?auto_160435 - BLOCK
      ?auto_160434 - BLOCK
      ?auto_160432 - BLOCK
      ?auto_160433 - BLOCK
      ?auto_160436 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160428 ?auto_160429 ) ) ( not ( = ?auto_160428 ?auto_160430 ) ) ( not ( = ?auto_160428 ?auto_160431 ) ) ( not ( = ?auto_160429 ?auto_160430 ) ) ( not ( = ?auto_160429 ?auto_160431 ) ) ( not ( = ?auto_160430 ?auto_160431 ) ) ( not ( = ?auto_160428 ?auto_160435 ) ) ( not ( = ?auto_160429 ?auto_160435 ) ) ( not ( = ?auto_160430 ?auto_160435 ) ) ( not ( = ?auto_160431 ?auto_160435 ) ) ( ON-TABLE ?auto_160434 ) ( not ( = ?auto_160434 ?auto_160432 ) ) ( not ( = ?auto_160434 ?auto_160433 ) ) ( not ( = ?auto_160434 ?auto_160435 ) ) ( not ( = ?auto_160434 ?auto_160431 ) ) ( not ( = ?auto_160434 ?auto_160430 ) ) ( not ( = ?auto_160432 ?auto_160433 ) ) ( not ( = ?auto_160432 ?auto_160435 ) ) ( not ( = ?auto_160432 ?auto_160431 ) ) ( not ( = ?auto_160432 ?auto_160430 ) ) ( not ( = ?auto_160433 ?auto_160435 ) ) ( not ( = ?auto_160433 ?auto_160431 ) ) ( not ( = ?auto_160433 ?auto_160430 ) ) ( not ( = ?auto_160428 ?auto_160434 ) ) ( not ( = ?auto_160428 ?auto_160432 ) ) ( not ( = ?auto_160428 ?auto_160433 ) ) ( not ( = ?auto_160429 ?auto_160434 ) ) ( not ( = ?auto_160429 ?auto_160432 ) ) ( not ( = ?auto_160429 ?auto_160433 ) ) ( ON ?auto_160428 ?auto_160436 ) ( not ( = ?auto_160428 ?auto_160436 ) ) ( not ( = ?auto_160429 ?auto_160436 ) ) ( not ( = ?auto_160430 ?auto_160436 ) ) ( not ( = ?auto_160431 ?auto_160436 ) ) ( not ( = ?auto_160435 ?auto_160436 ) ) ( not ( = ?auto_160434 ?auto_160436 ) ) ( not ( = ?auto_160432 ?auto_160436 ) ) ( not ( = ?auto_160433 ?auto_160436 ) ) ( ON ?auto_160429 ?auto_160428 ) ( ON-TABLE ?auto_160436 ) ( ON ?auto_160430 ?auto_160429 ) ( ON ?auto_160431 ?auto_160430 ) ( ON ?auto_160435 ?auto_160431 ) ( ON ?auto_160433 ?auto_160435 ) ( CLEAR ?auto_160434 ) ( ON ?auto_160432 ?auto_160433 ) ( CLEAR ?auto_160432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160436 ?auto_160428 ?auto_160429 ?auto_160430 ?auto_160431 ?auto_160435 ?auto_160433 )
      ( MAKE-4PILE ?auto_160428 ?auto_160429 ?auto_160430 ?auto_160431 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160437 - BLOCK
      ?auto_160438 - BLOCK
      ?auto_160439 - BLOCK
      ?auto_160440 - BLOCK
    )
    :vars
    (
      ?auto_160443 - BLOCK
      ?auto_160445 - BLOCK
      ?auto_160444 - BLOCK
      ?auto_160441 - BLOCK
      ?auto_160442 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160437 ?auto_160438 ) ) ( not ( = ?auto_160437 ?auto_160439 ) ) ( not ( = ?auto_160437 ?auto_160440 ) ) ( not ( = ?auto_160438 ?auto_160439 ) ) ( not ( = ?auto_160438 ?auto_160440 ) ) ( not ( = ?auto_160439 ?auto_160440 ) ) ( not ( = ?auto_160437 ?auto_160443 ) ) ( not ( = ?auto_160438 ?auto_160443 ) ) ( not ( = ?auto_160439 ?auto_160443 ) ) ( not ( = ?auto_160440 ?auto_160443 ) ) ( not ( = ?auto_160445 ?auto_160444 ) ) ( not ( = ?auto_160445 ?auto_160441 ) ) ( not ( = ?auto_160445 ?auto_160443 ) ) ( not ( = ?auto_160445 ?auto_160440 ) ) ( not ( = ?auto_160445 ?auto_160439 ) ) ( not ( = ?auto_160444 ?auto_160441 ) ) ( not ( = ?auto_160444 ?auto_160443 ) ) ( not ( = ?auto_160444 ?auto_160440 ) ) ( not ( = ?auto_160444 ?auto_160439 ) ) ( not ( = ?auto_160441 ?auto_160443 ) ) ( not ( = ?auto_160441 ?auto_160440 ) ) ( not ( = ?auto_160441 ?auto_160439 ) ) ( not ( = ?auto_160437 ?auto_160445 ) ) ( not ( = ?auto_160437 ?auto_160444 ) ) ( not ( = ?auto_160437 ?auto_160441 ) ) ( not ( = ?auto_160438 ?auto_160445 ) ) ( not ( = ?auto_160438 ?auto_160444 ) ) ( not ( = ?auto_160438 ?auto_160441 ) ) ( ON ?auto_160437 ?auto_160442 ) ( not ( = ?auto_160437 ?auto_160442 ) ) ( not ( = ?auto_160438 ?auto_160442 ) ) ( not ( = ?auto_160439 ?auto_160442 ) ) ( not ( = ?auto_160440 ?auto_160442 ) ) ( not ( = ?auto_160443 ?auto_160442 ) ) ( not ( = ?auto_160445 ?auto_160442 ) ) ( not ( = ?auto_160444 ?auto_160442 ) ) ( not ( = ?auto_160441 ?auto_160442 ) ) ( ON ?auto_160438 ?auto_160437 ) ( ON-TABLE ?auto_160442 ) ( ON ?auto_160439 ?auto_160438 ) ( ON ?auto_160440 ?auto_160439 ) ( ON ?auto_160443 ?auto_160440 ) ( ON ?auto_160441 ?auto_160443 ) ( ON ?auto_160444 ?auto_160441 ) ( CLEAR ?auto_160444 ) ( HOLDING ?auto_160445 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_160445 )
      ( MAKE-4PILE ?auto_160437 ?auto_160438 ?auto_160439 ?auto_160440 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160446 - BLOCK
      ?auto_160447 - BLOCK
      ?auto_160448 - BLOCK
      ?auto_160449 - BLOCK
    )
    :vars
    (
      ?auto_160452 - BLOCK
      ?auto_160454 - BLOCK
      ?auto_160450 - BLOCK
      ?auto_160453 - BLOCK
      ?auto_160451 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160446 ?auto_160447 ) ) ( not ( = ?auto_160446 ?auto_160448 ) ) ( not ( = ?auto_160446 ?auto_160449 ) ) ( not ( = ?auto_160447 ?auto_160448 ) ) ( not ( = ?auto_160447 ?auto_160449 ) ) ( not ( = ?auto_160448 ?auto_160449 ) ) ( not ( = ?auto_160446 ?auto_160452 ) ) ( not ( = ?auto_160447 ?auto_160452 ) ) ( not ( = ?auto_160448 ?auto_160452 ) ) ( not ( = ?auto_160449 ?auto_160452 ) ) ( not ( = ?auto_160454 ?auto_160450 ) ) ( not ( = ?auto_160454 ?auto_160453 ) ) ( not ( = ?auto_160454 ?auto_160452 ) ) ( not ( = ?auto_160454 ?auto_160449 ) ) ( not ( = ?auto_160454 ?auto_160448 ) ) ( not ( = ?auto_160450 ?auto_160453 ) ) ( not ( = ?auto_160450 ?auto_160452 ) ) ( not ( = ?auto_160450 ?auto_160449 ) ) ( not ( = ?auto_160450 ?auto_160448 ) ) ( not ( = ?auto_160453 ?auto_160452 ) ) ( not ( = ?auto_160453 ?auto_160449 ) ) ( not ( = ?auto_160453 ?auto_160448 ) ) ( not ( = ?auto_160446 ?auto_160454 ) ) ( not ( = ?auto_160446 ?auto_160450 ) ) ( not ( = ?auto_160446 ?auto_160453 ) ) ( not ( = ?auto_160447 ?auto_160454 ) ) ( not ( = ?auto_160447 ?auto_160450 ) ) ( not ( = ?auto_160447 ?auto_160453 ) ) ( ON ?auto_160446 ?auto_160451 ) ( not ( = ?auto_160446 ?auto_160451 ) ) ( not ( = ?auto_160447 ?auto_160451 ) ) ( not ( = ?auto_160448 ?auto_160451 ) ) ( not ( = ?auto_160449 ?auto_160451 ) ) ( not ( = ?auto_160452 ?auto_160451 ) ) ( not ( = ?auto_160454 ?auto_160451 ) ) ( not ( = ?auto_160450 ?auto_160451 ) ) ( not ( = ?auto_160453 ?auto_160451 ) ) ( ON ?auto_160447 ?auto_160446 ) ( ON-TABLE ?auto_160451 ) ( ON ?auto_160448 ?auto_160447 ) ( ON ?auto_160449 ?auto_160448 ) ( ON ?auto_160452 ?auto_160449 ) ( ON ?auto_160453 ?auto_160452 ) ( ON ?auto_160450 ?auto_160453 ) ( ON ?auto_160454 ?auto_160450 ) ( CLEAR ?auto_160454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_160451 ?auto_160446 ?auto_160447 ?auto_160448 ?auto_160449 ?auto_160452 ?auto_160453 ?auto_160450 )
      ( MAKE-4PILE ?auto_160446 ?auto_160447 ?auto_160448 ?auto_160449 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160474 - BLOCK
      ?auto_160475 - BLOCK
      ?auto_160476 - BLOCK
    )
    :vars
    (
      ?auto_160477 - BLOCK
      ?auto_160479 - BLOCK
      ?auto_160478 - BLOCK
      ?auto_160481 - BLOCK
      ?auto_160480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160477 ?auto_160476 ) ( ON-TABLE ?auto_160474 ) ( ON ?auto_160475 ?auto_160474 ) ( ON ?auto_160476 ?auto_160475 ) ( not ( = ?auto_160474 ?auto_160475 ) ) ( not ( = ?auto_160474 ?auto_160476 ) ) ( not ( = ?auto_160474 ?auto_160477 ) ) ( not ( = ?auto_160475 ?auto_160476 ) ) ( not ( = ?auto_160475 ?auto_160477 ) ) ( not ( = ?auto_160476 ?auto_160477 ) ) ( not ( = ?auto_160474 ?auto_160479 ) ) ( not ( = ?auto_160474 ?auto_160478 ) ) ( not ( = ?auto_160475 ?auto_160479 ) ) ( not ( = ?auto_160475 ?auto_160478 ) ) ( not ( = ?auto_160476 ?auto_160479 ) ) ( not ( = ?auto_160476 ?auto_160478 ) ) ( not ( = ?auto_160477 ?auto_160479 ) ) ( not ( = ?auto_160477 ?auto_160478 ) ) ( not ( = ?auto_160479 ?auto_160478 ) ) ( ON ?auto_160479 ?auto_160477 ) ( CLEAR ?auto_160479 ) ( HOLDING ?auto_160478 ) ( CLEAR ?auto_160481 ) ( ON-TABLE ?auto_160480 ) ( ON ?auto_160481 ?auto_160480 ) ( not ( = ?auto_160480 ?auto_160481 ) ) ( not ( = ?auto_160480 ?auto_160478 ) ) ( not ( = ?auto_160481 ?auto_160478 ) ) ( not ( = ?auto_160474 ?auto_160481 ) ) ( not ( = ?auto_160474 ?auto_160480 ) ) ( not ( = ?auto_160475 ?auto_160481 ) ) ( not ( = ?auto_160475 ?auto_160480 ) ) ( not ( = ?auto_160476 ?auto_160481 ) ) ( not ( = ?auto_160476 ?auto_160480 ) ) ( not ( = ?auto_160477 ?auto_160481 ) ) ( not ( = ?auto_160477 ?auto_160480 ) ) ( not ( = ?auto_160479 ?auto_160481 ) ) ( not ( = ?auto_160479 ?auto_160480 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_160480 ?auto_160481 ?auto_160478 )
      ( MAKE-3PILE ?auto_160474 ?auto_160475 ?auto_160476 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160482 - BLOCK
      ?auto_160483 - BLOCK
      ?auto_160484 - BLOCK
    )
    :vars
    (
      ?auto_160488 - BLOCK
      ?auto_160485 - BLOCK
      ?auto_160489 - BLOCK
      ?auto_160487 - BLOCK
      ?auto_160486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160488 ?auto_160484 ) ( ON-TABLE ?auto_160482 ) ( ON ?auto_160483 ?auto_160482 ) ( ON ?auto_160484 ?auto_160483 ) ( not ( = ?auto_160482 ?auto_160483 ) ) ( not ( = ?auto_160482 ?auto_160484 ) ) ( not ( = ?auto_160482 ?auto_160488 ) ) ( not ( = ?auto_160483 ?auto_160484 ) ) ( not ( = ?auto_160483 ?auto_160488 ) ) ( not ( = ?auto_160484 ?auto_160488 ) ) ( not ( = ?auto_160482 ?auto_160485 ) ) ( not ( = ?auto_160482 ?auto_160489 ) ) ( not ( = ?auto_160483 ?auto_160485 ) ) ( not ( = ?auto_160483 ?auto_160489 ) ) ( not ( = ?auto_160484 ?auto_160485 ) ) ( not ( = ?auto_160484 ?auto_160489 ) ) ( not ( = ?auto_160488 ?auto_160485 ) ) ( not ( = ?auto_160488 ?auto_160489 ) ) ( not ( = ?auto_160485 ?auto_160489 ) ) ( ON ?auto_160485 ?auto_160488 ) ( CLEAR ?auto_160487 ) ( ON-TABLE ?auto_160486 ) ( ON ?auto_160487 ?auto_160486 ) ( not ( = ?auto_160486 ?auto_160487 ) ) ( not ( = ?auto_160486 ?auto_160489 ) ) ( not ( = ?auto_160487 ?auto_160489 ) ) ( not ( = ?auto_160482 ?auto_160487 ) ) ( not ( = ?auto_160482 ?auto_160486 ) ) ( not ( = ?auto_160483 ?auto_160487 ) ) ( not ( = ?auto_160483 ?auto_160486 ) ) ( not ( = ?auto_160484 ?auto_160487 ) ) ( not ( = ?auto_160484 ?auto_160486 ) ) ( not ( = ?auto_160488 ?auto_160487 ) ) ( not ( = ?auto_160488 ?auto_160486 ) ) ( not ( = ?auto_160485 ?auto_160487 ) ) ( not ( = ?auto_160485 ?auto_160486 ) ) ( ON ?auto_160489 ?auto_160485 ) ( CLEAR ?auto_160489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_160482 ?auto_160483 ?auto_160484 ?auto_160488 ?auto_160485 )
      ( MAKE-3PILE ?auto_160482 ?auto_160483 ?auto_160484 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160490 - BLOCK
      ?auto_160491 - BLOCK
      ?auto_160492 - BLOCK
    )
    :vars
    (
      ?auto_160495 - BLOCK
      ?auto_160497 - BLOCK
      ?auto_160496 - BLOCK
      ?auto_160494 - BLOCK
      ?auto_160493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160495 ?auto_160492 ) ( ON-TABLE ?auto_160490 ) ( ON ?auto_160491 ?auto_160490 ) ( ON ?auto_160492 ?auto_160491 ) ( not ( = ?auto_160490 ?auto_160491 ) ) ( not ( = ?auto_160490 ?auto_160492 ) ) ( not ( = ?auto_160490 ?auto_160495 ) ) ( not ( = ?auto_160491 ?auto_160492 ) ) ( not ( = ?auto_160491 ?auto_160495 ) ) ( not ( = ?auto_160492 ?auto_160495 ) ) ( not ( = ?auto_160490 ?auto_160497 ) ) ( not ( = ?auto_160490 ?auto_160496 ) ) ( not ( = ?auto_160491 ?auto_160497 ) ) ( not ( = ?auto_160491 ?auto_160496 ) ) ( not ( = ?auto_160492 ?auto_160497 ) ) ( not ( = ?auto_160492 ?auto_160496 ) ) ( not ( = ?auto_160495 ?auto_160497 ) ) ( not ( = ?auto_160495 ?auto_160496 ) ) ( not ( = ?auto_160497 ?auto_160496 ) ) ( ON ?auto_160497 ?auto_160495 ) ( ON-TABLE ?auto_160494 ) ( not ( = ?auto_160494 ?auto_160493 ) ) ( not ( = ?auto_160494 ?auto_160496 ) ) ( not ( = ?auto_160493 ?auto_160496 ) ) ( not ( = ?auto_160490 ?auto_160493 ) ) ( not ( = ?auto_160490 ?auto_160494 ) ) ( not ( = ?auto_160491 ?auto_160493 ) ) ( not ( = ?auto_160491 ?auto_160494 ) ) ( not ( = ?auto_160492 ?auto_160493 ) ) ( not ( = ?auto_160492 ?auto_160494 ) ) ( not ( = ?auto_160495 ?auto_160493 ) ) ( not ( = ?auto_160495 ?auto_160494 ) ) ( not ( = ?auto_160497 ?auto_160493 ) ) ( not ( = ?auto_160497 ?auto_160494 ) ) ( ON ?auto_160496 ?auto_160497 ) ( CLEAR ?auto_160496 ) ( HOLDING ?auto_160493 ) ( CLEAR ?auto_160494 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160494 ?auto_160493 )
      ( MAKE-3PILE ?auto_160490 ?auto_160491 ?auto_160492 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160498 - BLOCK
      ?auto_160499 - BLOCK
      ?auto_160500 - BLOCK
    )
    :vars
    (
      ?auto_160502 - BLOCK
      ?auto_160503 - BLOCK
      ?auto_160505 - BLOCK
      ?auto_160504 - BLOCK
      ?auto_160501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160502 ?auto_160500 ) ( ON-TABLE ?auto_160498 ) ( ON ?auto_160499 ?auto_160498 ) ( ON ?auto_160500 ?auto_160499 ) ( not ( = ?auto_160498 ?auto_160499 ) ) ( not ( = ?auto_160498 ?auto_160500 ) ) ( not ( = ?auto_160498 ?auto_160502 ) ) ( not ( = ?auto_160499 ?auto_160500 ) ) ( not ( = ?auto_160499 ?auto_160502 ) ) ( not ( = ?auto_160500 ?auto_160502 ) ) ( not ( = ?auto_160498 ?auto_160503 ) ) ( not ( = ?auto_160498 ?auto_160505 ) ) ( not ( = ?auto_160499 ?auto_160503 ) ) ( not ( = ?auto_160499 ?auto_160505 ) ) ( not ( = ?auto_160500 ?auto_160503 ) ) ( not ( = ?auto_160500 ?auto_160505 ) ) ( not ( = ?auto_160502 ?auto_160503 ) ) ( not ( = ?auto_160502 ?auto_160505 ) ) ( not ( = ?auto_160503 ?auto_160505 ) ) ( ON ?auto_160503 ?auto_160502 ) ( ON-TABLE ?auto_160504 ) ( not ( = ?auto_160504 ?auto_160501 ) ) ( not ( = ?auto_160504 ?auto_160505 ) ) ( not ( = ?auto_160501 ?auto_160505 ) ) ( not ( = ?auto_160498 ?auto_160501 ) ) ( not ( = ?auto_160498 ?auto_160504 ) ) ( not ( = ?auto_160499 ?auto_160501 ) ) ( not ( = ?auto_160499 ?auto_160504 ) ) ( not ( = ?auto_160500 ?auto_160501 ) ) ( not ( = ?auto_160500 ?auto_160504 ) ) ( not ( = ?auto_160502 ?auto_160501 ) ) ( not ( = ?auto_160502 ?auto_160504 ) ) ( not ( = ?auto_160503 ?auto_160501 ) ) ( not ( = ?auto_160503 ?auto_160504 ) ) ( ON ?auto_160505 ?auto_160503 ) ( CLEAR ?auto_160504 ) ( ON ?auto_160501 ?auto_160505 ) ( CLEAR ?auto_160501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160498 ?auto_160499 ?auto_160500 ?auto_160502 ?auto_160503 ?auto_160505 )
      ( MAKE-3PILE ?auto_160498 ?auto_160499 ?auto_160500 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160506 - BLOCK
      ?auto_160507 - BLOCK
      ?auto_160508 - BLOCK
    )
    :vars
    (
      ?auto_160509 - BLOCK
      ?auto_160511 - BLOCK
      ?auto_160512 - BLOCK
      ?auto_160510 - BLOCK
      ?auto_160513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160509 ?auto_160508 ) ( ON-TABLE ?auto_160506 ) ( ON ?auto_160507 ?auto_160506 ) ( ON ?auto_160508 ?auto_160507 ) ( not ( = ?auto_160506 ?auto_160507 ) ) ( not ( = ?auto_160506 ?auto_160508 ) ) ( not ( = ?auto_160506 ?auto_160509 ) ) ( not ( = ?auto_160507 ?auto_160508 ) ) ( not ( = ?auto_160507 ?auto_160509 ) ) ( not ( = ?auto_160508 ?auto_160509 ) ) ( not ( = ?auto_160506 ?auto_160511 ) ) ( not ( = ?auto_160506 ?auto_160512 ) ) ( not ( = ?auto_160507 ?auto_160511 ) ) ( not ( = ?auto_160507 ?auto_160512 ) ) ( not ( = ?auto_160508 ?auto_160511 ) ) ( not ( = ?auto_160508 ?auto_160512 ) ) ( not ( = ?auto_160509 ?auto_160511 ) ) ( not ( = ?auto_160509 ?auto_160512 ) ) ( not ( = ?auto_160511 ?auto_160512 ) ) ( ON ?auto_160511 ?auto_160509 ) ( not ( = ?auto_160510 ?auto_160513 ) ) ( not ( = ?auto_160510 ?auto_160512 ) ) ( not ( = ?auto_160513 ?auto_160512 ) ) ( not ( = ?auto_160506 ?auto_160513 ) ) ( not ( = ?auto_160506 ?auto_160510 ) ) ( not ( = ?auto_160507 ?auto_160513 ) ) ( not ( = ?auto_160507 ?auto_160510 ) ) ( not ( = ?auto_160508 ?auto_160513 ) ) ( not ( = ?auto_160508 ?auto_160510 ) ) ( not ( = ?auto_160509 ?auto_160513 ) ) ( not ( = ?auto_160509 ?auto_160510 ) ) ( not ( = ?auto_160511 ?auto_160513 ) ) ( not ( = ?auto_160511 ?auto_160510 ) ) ( ON ?auto_160512 ?auto_160511 ) ( ON ?auto_160513 ?auto_160512 ) ( CLEAR ?auto_160513 ) ( HOLDING ?auto_160510 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_160510 )
      ( MAKE-3PILE ?auto_160506 ?auto_160507 ?auto_160508 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160525 - BLOCK
      ?auto_160526 - BLOCK
      ?auto_160527 - BLOCK
    )
    :vars
    (
      ?auto_160532 - BLOCK
      ?auto_160529 - BLOCK
      ?auto_160530 - BLOCK
      ?auto_160531 - BLOCK
      ?auto_160528 - BLOCK
      ?auto_160533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160532 ?auto_160527 ) ( ON-TABLE ?auto_160525 ) ( ON ?auto_160526 ?auto_160525 ) ( ON ?auto_160527 ?auto_160526 ) ( not ( = ?auto_160525 ?auto_160526 ) ) ( not ( = ?auto_160525 ?auto_160527 ) ) ( not ( = ?auto_160525 ?auto_160532 ) ) ( not ( = ?auto_160526 ?auto_160527 ) ) ( not ( = ?auto_160526 ?auto_160532 ) ) ( not ( = ?auto_160527 ?auto_160532 ) ) ( not ( = ?auto_160525 ?auto_160529 ) ) ( not ( = ?auto_160525 ?auto_160530 ) ) ( not ( = ?auto_160526 ?auto_160529 ) ) ( not ( = ?auto_160526 ?auto_160530 ) ) ( not ( = ?auto_160527 ?auto_160529 ) ) ( not ( = ?auto_160527 ?auto_160530 ) ) ( not ( = ?auto_160532 ?auto_160529 ) ) ( not ( = ?auto_160532 ?auto_160530 ) ) ( not ( = ?auto_160529 ?auto_160530 ) ) ( ON ?auto_160529 ?auto_160532 ) ( not ( = ?auto_160531 ?auto_160528 ) ) ( not ( = ?auto_160531 ?auto_160530 ) ) ( not ( = ?auto_160528 ?auto_160530 ) ) ( not ( = ?auto_160525 ?auto_160528 ) ) ( not ( = ?auto_160525 ?auto_160531 ) ) ( not ( = ?auto_160526 ?auto_160528 ) ) ( not ( = ?auto_160526 ?auto_160531 ) ) ( not ( = ?auto_160527 ?auto_160528 ) ) ( not ( = ?auto_160527 ?auto_160531 ) ) ( not ( = ?auto_160532 ?auto_160528 ) ) ( not ( = ?auto_160532 ?auto_160531 ) ) ( not ( = ?auto_160529 ?auto_160528 ) ) ( not ( = ?auto_160529 ?auto_160531 ) ) ( ON ?auto_160530 ?auto_160529 ) ( ON ?auto_160528 ?auto_160530 ) ( CLEAR ?auto_160528 ) ( ON ?auto_160531 ?auto_160533 ) ( CLEAR ?auto_160531 ) ( HAND-EMPTY ) ( not ( = ?auto_160525 ?auto_160533 ) ) ( not ( = ?auto_160526 ?auto_160533 ) ) ( not ( = ?auto_160527 ?auto_160533 ) ) ( not ( = ?auto_160532 ?auto_160533 ) ) ( not ( = ?auto_160529 ?auto_160533 ) ) ( not ( = ?auto_160530 ?auto_160533 ) ) ( not ( = ?auto_160531 ?auto_160533 ) ) ( not ( = ?auto_160528 ?auto_160533 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_160531 ?auto_160533 )
      ( MAKE-3PILE ?auto_160525 ?auto_160526 ?auto_160527 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160534 - BLOCK
      ?auto_160535 - BLOCK
      ?auto_160536 - BLOCK
    )
    :vars
    (
      ?auto_160539 - BLOCK
      ?auto_160537 - BLOCK
      ?auto_160538 - BLOCK
      ?auto_160541 - BLOCK
      ?auto_160540 - BLOCK
      ?auto_160542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160539 ?auto_160536 ) ( ON-TABLE ?auto_160534 ) ( ON ?auto_160535 ?auto_160534 ) ( ON ?auto_160536 ?auto_160535 ) ( not ( = ?auto_160534 ?auto_160535 ) ) ( not ( = ?auto_160534 ?auto_160536 ) ) ( not ( = ?auto_160534 ?auto_160539 ) ) ( not ( = ?auto_160535 ?auto_160536 ) ) ( not ( = ?auto_160535 ?auto_160539 ) ) ( not ( = ?auto_160536 ?auto_160539 ) ) ( not ( = ?auto_160534 ?auto_160537 ) ) ( not ( = ?auto_160534 ?auto_160538 ) ) ( not ( = ?auto_160535 ?auto_160537 ) ) ( not ( = ?auto_160535 ?auto_160538 ) ) ( not ( = ?auto_160536 ?auto_160537 ) ) ( not ( = ?auto_160536 ?auto_160538 ) ) ( not ( = ?auto_160539 ?auto_160537 ) ) ( not ( = ?auto_160539 ?auto_160538 ) ) ( not ( = ?auto_160537 ?auto_160538 ) ) ( ON ?auto_160537 ?auto_160539 ) ( not ( = ?auto_160541 ?auto_160540 ) ) ( not ( = ?auto_160541 ?auto_160538 ) ) ( not ( = ?auto_160540 ?auto_160538 ) ) ( not ( = ?auto_160534 ?auto_160540 ) ) ( not ( = ?auto_160534 ?auto_160541 ) ) ( not ( = ?auto_160535 ?auto_160540 ) ) ( not ( = ?auto_160535 ?auto_160541 ) ) ( not ( = ?auto_160536 ?auto_160540 ) ) ( not ( = ?auto_160536 ?auto_160541 ) ) ( not ( = ?auto_160539 ?auto_160540 ) ) ( not ( = ?auto_160539 ?auto_160541 ) ) ( not ( = ?auto_160537 ?auto_160540 ) ) ( not ( = ?auto_160537 ?auto_160541 ) ) ( ON ?auto_160538 ?auto_160537 ) ( ON ?auto_160541 ?auto_160542 ) ( CLEAR ?auto_160541 ) ( not ( = ?auto_160534 ?auto_160542 ) ) ( not ( = ?auto_160535 ?auto_160542 ) ) ( not ( = ?auto_160536 ?auto_160542 ) ) ( not ( = ?auto_160539 ?auto_160542 ) ) ( not ( = ?auto_160537 ?auto_160542 ) ) ( not ( = ?auto_160538 ?auto_160542 ) ) ( not ( = ?auto_160541 ?auto_160542 ) ) ( not ( = ?auto_160540 ?auto_160542 ) ) ( HOLDING ?auto_160540 ) ( CLEAR ?auto_160538 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160534 ?auto_160535 ?auto_160536 ?auto_160539 ?auto_160537 ?auto_160538 ?auto_160540 )
      ( MAKE-3PILE ?auto_160534 ?auto_160535 ?auto_160536 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160543 - BLOCK
      ?auto_160544 - BLOCK
      ?auto_160545 - BLOCK
    )
    :vars
    (
      ?auto_160551 - BLOCK
      ?auto_160548 - BLOCK
      ?auto_160547 - BLOCK
      ?auto_160549 - BLOCK
      ?auto_160550 - BLOCK
      ?auto_160546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160551 ?auto_160545 ) ( ON-TABLE ?auto_160543 ) ( ON ?auto_160544 ?auto_160543 ) ( ON ?auto_160545 ?auto_160544 ) ( not ( = ?auto_160543 ?auto_160544 ) ) ( not ( = ?auto_160543 ?auto_160545 ) ) ( not ( = ?auto_160543 ?auto_160551 ) ) ( not ( = ?auto_160544 ?auto_160545 ) ) ( not ( = ?auto_160544 ?auto_160551 ) ) ( not ( = ?auto_160545 ?auto_160551 ) ) ( not ( = ?auto_160543 ?auto_160548 ) ) ( not ( = ?auto_160543 ?auto_160547 ) ) ( not ( = ?auto_160544 ?auto_160548 ) ) ( not ( = ?auto_160544 ?auto_160547 ) ) ( not ( = ?auto_160545 ?auto_160548 ) ) ( not ( = ?auto_160545 ?auto_160547 ) ) ( not ( = ?auto_160551 ?auto_160548 ) ) ( not ( = ?auto_160551 ?auto_160547 ) ) ( not ( = ?auto_160548 ?auto_160547 ) ) ( ON ?auto_160548 ?auto_160551 ) ( not ( = ?auto_160549 ?auto_160550 ) ) ( not ( = ?auto_160549 ?auto_160547 ) ) ( not ( = ?auto_160550 ?auto_160547 ) ) ( not ( = ?auto_160543 ?auto_160550 ) ) ( not ( = ?auto_160543 ?auto_160549 ) ) ( not ( = ?auto_160544 ?auto_160550 ) ) ( not ( = ?auto_160544 ?auto_160549 ) ) ( not ( = ?auto_160545 ?auto_160550 ) ) ( not ( = ?auto_160545 ?auto_160549 ) ) ( not ( = ?auto_160551 ?auto_160550 ) ) ( not ( = ?auto_160551 ?auto_160549 ) ) ( not ( = ?auto_160548 ?auto_160550 ) ) ( not ( = ?auto_160548 ?auto_160549 ) ) ( ON ?auto_160547 ?auto_160548 ) ( ON ?auto_160549 ?auto_160546 ) ( not ( = ?auto_160543 ?auto_160546 ) ) ( not ( = ?auto_160544 ?auto_160546 ) ) ( not ( = ?auto_160545 ?auto_160546 ) ) ( not ( = ?auto_160551 ?auto_160546 ) ) ( not ( = ?auto_160548 ?auto_160546 ) ) ( not ( = ?auto_160547 ?auto_160546 ) ) ( not ( = ?auto_160549 ?auto_160546 ) ) ( not ( = ?auto_160550 ?auto_160546 ) ) ( CLEAR ?auto_160547 ) ( ON ?auto_160550 ?auto_160549 ) ( CLEAR ?auto_160550 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_160546 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160546 ?auto_160549 )
      ( MAKE-3PILE ?auto_160543 ?auto_160544 ?auto_160545 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160552 - BLOCK
      ?auto_160553 - BLOCK
      ?auto_160554 - BLOCK
    )
    :vars
    (
      ?auto_160558 - BLOCK
      ?auto_160556 - BLOCK
      ?auto_160555 - BLOCK
      ?auto_160560 - BLOCK
      ?auto_160559 - BLOCK
      ?auto_160557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160558 ?auto_160554 ) ( ON-TABLE ?auto_160552 ) ( ON ?auto_160553 ?auto_160552 ) ( ON ?auto_160554 ?auto_160553 ) ( not ( = ?auto_160552 ?auto_160553 ) ) ( not ( = ?auto_160552 ?auto_160554 ) ) ( not ( = ?auto_160552 ?auto_160558 ) ) ( not ( = ?auto_160553 ?auto_160554 ) ) ( not ( = ?auto_160553 ?auto_160558 ) ) ( not ( = ?auto_160554 ?auto_160558 ) ) ( not ( = ?auto_160552 ?auto_160556 ) ) ( not ( = ?auto_160552 ?auto_160555 ) ) ( not ( = ?auto_160553 ?auto_160556 ) ) ( not ( = ?auto_160553 ?auto_160555 ) ) ( not ( = ?auto_160554 ?auto_160556 ) ) ( not ( = ?auto_160554 ?auto_160555 ) ) ( not ( = ?auto_160558 ?auto_160556 ) ) ( not ( = ?auto_160558 ?auto_160555 ) ) ( not ( = ?auto_160556 ?auto_160555 ) ) ( ON ?auto_160556 ?auto_160558 ) ( not ( = ?auto_160560 ?auto_160559 ) ) ( not ( = ?auto_160560 ?auto_160555 ) ) ( not ( = ?auto_160559 ?auto_160555 ) ) ( not ( = ?auto_160552 ?auto_160559 ) ) ( not ( = ?auto_160552 ?auto_160560 ) ) ( not ( = ?auto_160553 ?auto_160559 ) ) ( not ( = ?auto_160553 ?auto_160560 ) ) ( not ( = ?auto_160554 ?auto_160559 ) ) ( not ( = ?auto_160554 ?auto_160560 ) ) ( not ( = ?auto_160558 ?auto_160559 ) ) ( not ( = ?auto_160558 ?auto_160560 ) ) ( not ( = ?auto_160556 ?auto_160559 ) ) ( not ( = ?auto_160556 ?auto_160560 ) ) ( ON ?auto_160560 ?auto_160557 ) ( not ( = ?auto_160552 ?auto_160557 ) ) ( not ( = ?auto_160553 ?auto_160557 ) ) ( not ( = ?auto_160554 ?auto_160557 ) ) ( not ( = ?auto_160558 ?auto_160557 ) ) ( not ( = ?auto_160556 ?auto_160557 ) ) ( not ( = ?auto_160555 ?auto_160557 ) ) ( not ( = ?auto_160560 ?auto_160557 ) ) ( not ( = ?auto_160559 ?auto_160557 ) ) ( ON ?auto_160559 ?auto_160560 ) ( CLEAR ?auto_160559 ) ( ON-TABLE ?auto_160557 ) ( HOLDING ?auto_160555 ) ( CLEAR ?auto_160556 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160552 ?auto_160553 ?auto_160554 ?auto_160558 ?auto_160556 ?auto_160555 )
      ( MAKE-3PILE ?auto_160552 ?auto_160553 ?auto_160554 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160619 - BLOCK
      ?auto_160620 - BLOCK
      ?auto_160621 - BLOCK
      ?auto_160622 - BLOCK
      ?auto_160623 - BLOCK
    )
    :vars
    (
      ?auto_160624 - BLOCK
      ?auto_160626 - BLOCK
      ?auto_160625 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160619 ) ( ON ?auto_160620 ?auto_160619 ) ( ON ?auto_160621 ?auto_160620 ) ( not ( = ?auto_160619 ?auto_160620 ) ) ( not ( = ?auto_160619 ?auto_160621 ) ) ( not ( = ?auto_160619 ?auto_160622 ) ) ( not ( = ?auto_160619 ?auto_160623 ) ) ( not ( = ?auto_160620 ?auto_160621 ) ) ( not ( = ?auto_160620 ?auto_160622 ) ) ( not ( = ?auto_160620 ?auto_160623 ) ) ( not ( = ?auto_160621 ?auto_160622 ) ) ( not ( = ?auto_160621 ?auto_160623 ) ) ( not ( = ?auto_160622 ?auto_160623 ) ) ( ON ?auto_160623 ?auto_160624 ) ( not ( = ?auto_160619 ?auto_160624 ) ) ( not ( = ?auto_160620 ?auto_160624 ) ) ( not ( = ?auto_160621 ?auto_160624 ) ) ( not ( = ?auto_160622 ?auto_160624 ) ) ( not ( = ?auto_160623 ?auto_160624 ) ) ( CLEAR ?auto_160621 ) ( ON ?auto_160622 ?auto_160623 ) ( CLEAR ?auto_160622 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_160626 ) ( ON ?auto_160625 ?auto_160626 ) ( ON ?auto_160624 ?auto_160625 ) ( not ( = ?auto_160626 ?auto_160625 ) ) ( not ( = ?auto_160626 ?auto_160624 ) ) ( not ( = ?auto_160626 ?auto_160623 ) ) ( not ( = ?auto_160626 ?auto_160622 ) ) ( not ( = ?auto_160625 ?auto_160624 ) ) ( not ( = ?auto_160625 ?auto_160623 ) ) ( not ( = ?auto_160625 ?auto_160622 ) ) ( not ( = ?auto_160619 ?auto_160626 ) ) ( not ( = ?auto_160619 ?auto_160625 ) ) ( not ( = ?auto_160620 ?auto_160626 ) ) ( not ( = ?auto_160620 ?auto_160625 ) ) ( not ( = ?auto_160621 ?auto_160626 ) ) ( not ( = ?auto_160621 ?auto_160625 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_160626 ?auto_160625 ?auto_160624 ?auto_160623 )
      ( MAKE-5PILE ?auto_160619 ?auto_160620 ?auto_160621 ?auto_160622 ?auto_160623 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160627 - BLOCK
      ?auto_160628 - BLOCK
      ?auto_160629 - BLOCK
      ?auto_160630 - BLOCK
      ?auto_160631 - BLOCK
    )
    :vars
    (
      ?auto_160632 - BLOCK
      ?auto_160633 - BLOCK
      ?auto_160634 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160627 ) ( ON ?auto_160628 ?auto_160627 ) ( not ( = ?auto_160627 ?auto_160628 ) ) ( not ( = ?auto_160627 ?auto_160629 ) ) ( not ( = ?auto_160627 ?auto_160630 ) ) ( not ( = ?auto_160627 ?auto_160631 ) ) ( not ( = ?auto_160628 ?auto_160629 ) ) ( not ( = ?auto_160628 ?auto_160630 ) ) ( not ( = ?auto_160628 ?auto_160631 ) ) ( not ( = ?auto_160629 ?auto_160630 ) ) ( not ( = ?auto_160629 ?auto_160631 ) ) ( not ( = ?auto_160630 ?auto_160631 ) ) ( ON ?auto_160631 ?auto_160632 ) ( not ( = ?auto_160627 ?auto_160632 ) ) ( not ( = ?auto_160628 ?auto_160632 ) ) ( not ( = ?auto_160629 ?auto_160632 ) ) ( not ( = ?auto_160630 ?auto_160632 ) ) ( not ( = ?auto_160631 ?auto_160632 ) ) ( ON ?auto_160630 ?auto_160631 ) ( CLEAR ?auto_160630 ) ( ON-TABLE ?auto_160633 ) ( ON ?auto_160634 ?auto_160633 ) ( ON ?auto_160632 ?auto_160634 ) ( not ( = ?auto_160633 ?auto_160634 ) ) ( not ( = ?auto_160633 ?auto_160632 ) ) ( not ( = ?auto_160633 ?auto_160631 ) ) ( not ( = ?auto_160633 ?auto_160630 ) ) ( not ( = ?auto_160634 ?auto_160632 ) ) ( not ( = ?auto_160634 ?auto_160631 ) ) ( not ( = ?auto_160634 ?auto_160630 ) ) ( not ( = ?auto_160627 ?auto_160633 ) ) ( not ( = ?auto_160627 ?auto_160634 ) ) ( not ( = ?auto_160628 ?auto_160633 ) ) ( not ( = ?auto_160628 ?auto_160634 ) ) ( not ( = ?auto_160629 ?auto_160633 ) ) ( not ( = ?auto_160629 ?auto_160634 ) ) ( HOLDING ?auto_160629 ) ( CLEAR ?auto_160628 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_160627 ?auto_160628 ?auto_160629 )
      ( MAKE-5PILE ?auto_160627 ?auto_160628 ?auto_160629 ?auto_160630 ?auto_160631 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160635 - BLOCK
      ?auto_160636 - BLOCK
      ?auto_160637 - BLOCK
      ?auto_160638 - BLOCK
      ?auto_160639 - BLOCK
    )
    :vars
    (
      ?auto_160640 - BLOCK
      ?auto_160642 - BLOCK
      ?auto_160641 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160635 ) ( ON ?auto_160636 ?auto_160635 ) ( not ( = ?auto_160635 ?auto_160636 ) ) ( not ( = ?auto_160635 ?auto_160637 ) ) ( not ( = ?auto_160635 ?auto_160638 ) ) ( not ( = ?auto_160635 ?auto_160639 ) ) ( not ( = ?auto_160636 ?auto_160637 ) ) ( not ( = ?auto_160636 ?auto_160638 ) ) ( not ( = ?auto_160636 ?auto_160639 ) ) ( not ( = ?auto_160637 ?auto_160638 ) ) ( not ( = ?auto_160637 ?auto_160639 ) ) ( not ( = ?auto_160638 ?auto_160639 ) ) ( ON ?auto_160639 ?auto_160640 ) ( not ( = ?auto_160635 ?auto_160640 ) ) ( not ( = ?auto_160636 ?auto_160640 ) ) ( not ( = ?auto_160637 ?auto_160640 ) ) ( not ( = ?auto_160638 ?auto_160640 ) ) ( not ( = ?auto_160639 ?auto_160640 ) ) ( ON ?auto_160638 ?auto_160639 ) ( ON-TABLE ?auto_160642 ) ( ON ?auto_160641 ?auto_160642 ) ( ON ?auto_160640 ?auto_160641 ) ( not ( = ?auto_160642 ?auto_160641 ) ) ( not ( = ?auto_160642 ?auto_160640 ) ) ( not ( = ?auto_160642 ?auto_160639 ) ) ( not ( = ?auto_160642 ?auto_160638 ) ) ( not ( = ?auto_160641 ?auto_160640 ) ) ( not ( = ?auto_160641 ?auto_160639 ) ) ( not ( = ?auto_160641 ?auto_160638 ) ) ( not ( = ?auto_160635 ?auto_160642 ) ) ( not ( = ?auto_160635 ?auto_160641 ) ) ( not ( = ?auto_160636 ?auto_160642 ) ) ( not ( = ?auto_160636 ?auto_160641 ) ) ( not ( = ?auto_160637 ?auto_160642 ) ) ( not ( = ?auto_160637 ?auto_160641 ) ) ( CLEAR ?auto_160636 ) ( ON ?auto_160637 ?auto_160638 ) ( CLEAR ?auto_160637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_160642 ?auto_160641 ?auto_160640 ?auto_160639 ?auto_160638 )
      ( MAKE-5PILE ?auto_160635 ?auto_160636 ?auto_160637 ?auto_160638 ?auto_160639 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160643 - BLOCK
      ?auto_160644 - BLOCK
      ?auto_160645 - BLOCK
      ?auto_160646 - BLOCK
      ?auto_160647 - BLOCK
    )
    :vars
    (
      ?auto_160648 - BLOCK
      ?auto_160650 - BLOCK
      ?auto_160649 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160643 ) ( not ( = ?auto_160643 ?auto_160644 ) ) ( not ( = ?auto_160643 ?auto_160645 ) ) ( not ( = ?auto_160643 ?auto_160646 ) ) ( not ( = ?auto_160643 ?auto_160647 ) ) ( not ( = ?auto_160644 ?auto_160645 ) ) ( not ( = ?auto_160644 ?auto_160646 ) ) ( not ( = ?auto_160644 ?auto_160647 ) ) ( not ( = ?auto_160645 ?auto_160646 ) ) ( not ( = ?auto_160645 ?auto_160647 ) ) ( not ( = ?auto_160646 ?auto_160647 ) ) ( ON ?auto_160647 ?auto_160648 ) ( not ( = ?auto_160643 ?auto_160648 ) ) ( not ( = ?auto_160644 ?auto_160648 ) ) ( not ( = ?auto_160645 ?auto_160648 ) ) ( not ( = ?auto_160646 ?auto_160648 ) ) ( not ( = ?auto_160647 ?auto_160648 ) ) ( ON ?auto_160646 ?auto_160647 ) ( ON-TABLE ?auto_160650 ) ( ON ?auto_160649 ?auto_160650 ) ( ON ?auto_160648 ?auto_160649 ) ( not ( = ?auto_160650 ?auto_160649 ) ) ( not ( = ?auto_160650 ?auto_160648 ) ) ( not ( = ?auto_160650 ?auto_160647 ) ) ( not ( = ?auto_160650 ?auto_160646 ) ) ( not ( = ?auto_160649 ?auto_160648 ) ) ( not ( = ?auto_160649 ?auto_160647 ) ) ( not ( = ?auto_160649 ?auto_160646 ) ) ( not ( = ?auto_160643 ?auto_160650 ) ) ( not ( = ?auto_160643 ?auto_160649 ) ) ( not ( = ?auto_160644 ?auto_160650 ) ) ( not ( = ?auto_160644 ?auto_160649 ) ) ( not ( = ?auto_160645 ?auto_160650 ) ) ( not ( = ?auto_160645 ?auto_160649 ) ) ( ON ?auto_160645 ?auto_160646 ) ( CLEAR ?auto_160645 ) ( HOLDING ?auto_160644 ) ( CLEAR ?auto_160643 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160643 ?auto_160644 )
      ( MAKE-5PILE ?auto_160643 ?auto_160644 ?auto_160645 ?auto_160646 ?auto_160647 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160651 - BLOCK
      ?auto_160652 - BLOCK
      ?auto_160653 - BLOCK
      ?auto_160654 - BLOCK
      ?auto_160655 - BLOCK
    )
    :vars
    (
      ?auto_160656 - BLOCK
      ?auto_160658 - BLOCK
      ?auto_160657 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160651 ) ( not ( = ?auto_160651 ?auto_160652 ) ) ( not ( = ?auto_160651 ?auto_160653 ) ) ( not ( = ?auto_160651 ?auto_160654 ) ) ( not ( = ?auto_160651 ?auto_160655 ) ) ( not ( = ?auto_160652 ?auto_160653 ) ) ( not ( = ?auto_160652 ?auto_160654 ) ) ( not ( = ?auto_160652 ?auto_160655 ) ) ( not ( = ?auto_160653 ?auto_160654 ) ) ( not ( = ?auto_160653 ?auto_160655 ) ) ( not ( = ?auto_160654 ?auto_160655 ) ) ( ON ?auto_160655 ?auto_160656 ) ( not ( = ?auto_160651 ?auto_160656 ) ) ( not ( = ?auto_160652 ?auto_160656 ) ) ( not ( = ?auto_160653 ?auto_160656 ) ) ( not ( = ?auto_160654 ?auto_160656 ) ) ( not ( = ?auto_160655 ?auto_160656 ) ) ( ON ?auto_160654 ?auto_160655 ) ( ON-TABLE ?auto_160658 ) ( ON ?auto_160657 ?auto_160658 ) ( ON ?auto_160656 ?auto_160657 ) ( not ( = ?auto_160658 ?auto_160657 ) ) ( not ( = ?auto_160658 ?auto_160656 ) ) ( not ( = ?auto_160658 ?auto_160655 ) ) ( not ( = ?auto_160658 ?auto_160654 ) ) ( not ( = ?auto_160657 ?auto_160656 ) ) ( not ( = ?auto_160657 ?auto_160655 ) ) ( not ( = ?auto_160657 ?auto_160654 ) ) ( not ( = ?auto_160651 ?auto_160658 ) ) ( not ( = ?auto_160651 ?auto_160657 ) ) ( not ( = ?auto_160652 ?auto_160658 ) ) ( not ( = ?auto_160652 ?auto_160657 ) ) ( not ( = ?auto_160653 ?auto_160658 ) ) ( not ( = ?auto_160653 ?auto_160657 ) ) ( ON ?auto_160653 ?auto_160654 ) ( CLEAR ?auto_160651 ) ( ON ?auto_160652 ?auto_160653 ) ( CLEAR ?auto_160652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160658 ?auto_160657 ?auto_160656 ?auto_160655 ?auto_160654 ?auto_160653 )
      ( MAKE-5PILE ?auto_160651 ?auto_160652 ?auto_160653 ?auto_160654 ?auto_160655 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160659 - BLOCK
      ?auto_160660 - BLOCK
      ?auto_160661 - BLOCK
      ?auto_160662 - BLOCK
      ?auto_160663 - BLOCK
    )
    :vars
    (
      ?auto_160666 - BLOCK
      ?auto_160664 - BLOCK
      ?auto_160665 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160659 ?auto_160660 ) ) ( not ( = ?auto_160659 ?auto_160661 ) ) ( not ( = ?auto_160659 ?auto_160662 ) ) ( not ( = ?auto_160659 ?auto_160663 ) ) ( not ( = ?auto_160660 ?auto_160661 ) ) ( not ( = ?auto_160660 ?auto_160662 ) ) ( not ( = ?auto_160660 ?auto_160663 ) ) ( not ( = ?auto_160661 ?auto_160662 ) ) ( not ( = ?auto_160661 ?auto_160663 ) ) ( not ( = ?auto_160662 ?auto_160663 ) ) ( ON ?auto_160663 ?auto_160666 ) ( not ( = ?auto_160659 ?auto_160666 ) ) ( not ( = ?auto_160660 ?auto_160666 ) ) ( not ( = ?auto_160661 ?auto_160666 ) ) ( not ( = ?auto_160662 ?auto_160666 ) ) ( not ( = ?auto_160663 ?auto_160666 ) ) ( ON ?auto_160662 ?auto_160663 ) ( ON-TABLE ?auto_160664 ) ( ON ?auto_160665 ?auto_160664 ) ( ON ?auto_160666 ?auto_160665 ) ( not ( = ?auto_160664 ?auto_160665 ) ) ( not ( = ?auto_160664 ?auto_160666 ) ) ( not ( = ?auto_160664 ?auto_160663 ) ) ( not ( = ?auto_160664 ?auto_160662 ) ) ( not ( = ?auto_160665 ?auto_160666 ) ) ( not ( = ?auto_160665 ?auto_160663 ) ) ( not ( = ?auto_160665 ?auto_160662 ) ) ( not ( = ?auto_160659 ?auto_160664 ) ) ( not ( = ?auto_160659 ?auto_160665 ) ) ( not ( = ?auto_160660 ?auto_160664 ) ) ( not ( = ?auto_160660 ?auto_160665 ) ) ( not ( = ?auto_160661 ?auto_160664 ) ) ( not ( = ?auto_160661 ?auto_160665 ) ) ( ON ?auto_160661 ?auto_160662 ) ( ON ?auto_160660 ?auto_160661 ) ( CLEAR ?auto_160660 ) ( HOLDING ?auto_160659 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_160659 )
      ( MAKE-5PILE ?auto_160659 ?auto_160660 ?auto_160661 ?auto_160662 ?auto_160663 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160667 - BLOCK
      ?auto_160668 - BLOCK
      ?auto_160669 - BLOCK
      ?auto_160670 - BLOCK
      ?auto_160671 - BLOCK
    )
    :vars
    (
      ?auto_160673 - BLOCK
      ?auto_160674 - BLOCK
      ?auto_160672 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160667 ?auto_160668 ) ) ( not ( = ?auto_160667 ?auto_160669 ) ) ( not ( = ?auto_160667 ?auto_160670 ) ) ( not ( = ?auto_160667 ?auto_160671 ) ) ( not ( = ?auto_160668 ?auto_160669 ) ) ( not ( = ?auto_160668 ?auto_160670 ) ) ( not ( = ?auto_160668 ?auto_160671 ) ) ( not ( = ?auto_160669 ?auto_160670 ) ) ( not ( = ?auto_160669 ?auto_160671 ) ) ( not ( = ?auto_160670 ?auto_160671 ) ) ( ON ?auto_160671 ?auto_160673 ) ( not ( = ?auto_160667 ?auto_160673 ) ) ( not ( = ?auto_160668 ?auto_160673 ) ) ( not ( = ?auto_160669 ?auto_160673 ) ) ( not ( = ?auto_160670 ?auto_160673 ) ) ( not ( = ?auto_160671 ?auto_160673 ) ) ( ON ?auto_160670 ?auto_160671 ) ( ON-TABLE ?auto_160674 ) ( ON ?auto_160672 ?auto_160674 ) ( ON ?auto_160673 ?auto_160672 ) ( not ( = ?auto_160674 ?auto_160672 ) ) ( not ( = ?auto_160674 ?auto_160673 ) ) ( not ( = ?auto_160674 ?auto_160671 ) ) ( not ( = ?auto_160674 ?auto_160670 ) ) ( not ( = ?auto_160672 ?auto_160673 ) ) ( not ( = ?auto_160672 ?auto_160671 ) ) ( not ( = ?auto_160672 ?auto_160670 ) ) ( not ( = ?auto_160667 ?auto_160674 ) ) ( not ( = ?auto_160667 ?auto_160672 ) ) ( not ( = ?auto_160668 ?auto_160674 ) ) ( not ( = ?auto_160668 ?auto_160672 ) ) ( not ( = ?auto_160669 ?auto_160674 ) ) ( not ( = ?auto_160669 ?auto_160672 ) ) ( ON ?auto_160669 ?auto_160670 ) ( ON ?auto_160668 ?auto_160669 ) ( ON ?auto_160667 ?auto_160668 ) ( CLEAR ?auto_160667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160674 ?auto_160672 ?auto_160673 ?auto_160671 ?auto_160670 ?auto_160669 ?auto_160668 )
      ( MAKE-5PILE ?auto_160667 ?auto_160668 ?auto_160669 ?auto_160670 ?auto_160671 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160680 - BLOCK
      ?auto_160681 - BLOCK
      ?auto_160682 - BLOCK
      ?auto_160683 - BLOCK
      ?auto_160684 - BLOCK
    )
    :vars
    (
      ?auto_160687 - BLOCK
      ?auto_160685 - BLOCK
      ?auto_160686 - BLOCK
      ?auto_160688 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160680 ?auto_160681 ) ) ( not ( = ?auto_160680 ?auto_160682 ) ) ( not ( = ?auto_160680 ?auto_160683 ) ) ( not ( = ?auto_160680 ?auto_160684 ) ) ( not ( = ?auto_160681 ?auto_160682 ) ) ( not ( = ?auto_160681 ?auto_160683 ) ) ( not ( = ?auto_160681 ?auto_160684 ) ) ( not ( = ?auto_160682 ?auto_160683 ) ) ( not ( = ?auto_160682 ?auto_160684 ) ) ( not ( = ?auto_160683 ?auto_160684 ) ) ( ON ?auto_160684 ?auto_160687 ) ( not ( = ?auto_160680 ?auto_160687 ) ) ( not ( = ?auto_160681 ?auto_160687 ) ) ( not ( = ?auto_160682 ?auto_160687 ) ) ( not ( = ?auto_160683 ?auto_160687 ) ) ( not ( = ?auto_160684 ?auto_160687 ) ) ( ON ?auto_160683 ?auto_160684 ) ( ON-TABLE ?auto_160685 ) ( ON ?auto_160686 ?auto_160685 ) ( ON ?auto_160687 ?auto_160686 ) ( not ( = ?auto_160685 ?auto_160686 ) ) ( not ( = ?auto_160685 ?auto_160687 ) ) ( not ( = ?auto_160685 ?auto_160684 ) ) ( not ( = ?auto_160685 ?auto_160683 ) ) ( not ( = ?auto_160686 ?auto_160687 ) ) ( not ( = ?auto_160686 ?auto_160684 ) ) ( not ( = ?auto_160686 ?auto_160683 ) ) ( not ( = ?auto_160680 ?auto_160685 ) ) ( not ( = ?auto_160680 ?auto_160686 ) ) ( not ( = ?auto_160681 ?auto_160685 ) ) ( not ( = ?auto_160681 ?auto_160686 ) ) ( not ( = ?auto_160682 ?auto_160685 ) ) ( not ( = ?auto_160682 ?auto_160686 ) ) ( ON ?auto_160682 ?auto_160683 ) ( ON ?auto_160681 ?auto_160682 ) ( CLEAR ?auto_160681 ) ( ON ?auto_160680 ?auto_160688 ) ( CLEAR ?auto_160680 ) ( HAND-EMPTY ) ( not ( = ?auto_160680 ?auto_160688 ) ) ( not ( = ?auto_160681 ?auto_160688 ) ) ( not ( = ?auto_160682 ?auto_160688 ) ) ( not ( = ?auto_160683 ?auto_160688 ) ) ( not ( = ?auto_160684 ?auto_160688 ) ) ( not ( = ?auto_160687 ?auto_160688 ) ) ( not ( = ?auto_160685 ?auto_160688 ) ) ( not ( = ?auto_160686 ?auto_160688 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_160680 ?auto_160688 )
      ( MAKE-5PILE ?auto_160680 ?auto_160681 ?auto_160682 ?auto_160683 ?auto_160684 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160689 - BLOCK
      ?auto_160690 - BLOCK
      ?auto_160691 - BLOCK
      ?auto_160692 - BLOCK
      ?auto_160693 - BLOCK
    )
    :vars
    (
      ?auto_160695 - BLOCK
      ?auto_160696 - BLOCK
      ?auto_160694 - BLOCK
      ?auto_160697 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160689 ?auto_160690 ) ) ( not ( = ?auto_160689 ?auto_160691 ) ) ( not ( = ?auto_160689 ?auto_160692 ) ) ( not ( = ?auto_160689 ?auto_160693 ) ) ( not ( = ?auto_160690 ?auto_160691 ) ) ( not ( = ?auto_160690 ?auto_160692 ) ) ( not ( = ?auto_160690 ?auto_160693 ) ) ( not ( = ?auto_160691 ?auto_160692 ) ) ( not ( = ?auto_160691 ?auto_160693 ) ) ( not ( = ?auto_160692 ?auto_160693 ) ) ( ON ?auto_160693 ?auto_160695 ) ( not ( = ?auto_160689 ?auto_160695 ) ) ( not ( = ?auto_160690 ?auto_160695 ) ) ( not ( = ?auto_160691 ?auto_160695 ) ) ( not ( = ?auto_160692 ?auto_160695 ) ) ( not ( = ?auto_160693 ?auto_160695 ) ) ( ON ?auto_160692 ?auto_160693 ) ( ON-TABLE ?auto_160696 ) ( ON ?auto_160694 ?auto_160696 ) ( ON ?auto_160695 ?auto_160694 ) ( not ( = ?auto_160696 ?auto_160694 ) ) ( not ( = ?auto_160696 ?auto_160695 ) ) ( not ( = ?auto_160696 ?auto_160693 ) ) ( not ( = ?auto_160696 ?auto_160692 ) ) ( not ( = ?auto_160694 ?auto_160695 ) ) ( not ( = ?auto_160694 ?auto_160693 ) ) ( not ( = ?auto_160694 ?auto_160692 ) ) ( not ( = ?auto_160689 ?auto_160696 ) ) ( not ( = ?auto_160689 ?auto_160694 ) ) ( not ( = ?auto_160690 ?auto_160696 ) ) ( not ( = ?auto_160690 ?auto_160694 ) ) ( not ( = ?auto_160691 ?auto_160696 ) ) ( not ( = ?auto_160691 ?auto_160694 ) ) ( ON ?auto_160691 ?auto_160692 ) ( ON ?auto_160689 ?auto_160697 ) ( CLEAR ?auto_160689 ) ( not ( = ?auto_160689 ?auto_160697 ) ) ( not ( = ?auto_160690 ?auto_160697 ) ) ( not ( = ?auto_160691 ?auto_160697 ) ) ( not ( = ?auto_160692 ?auto_160697 ) ) ( not ( = ?auto_160693 ?auto_160697 ) ) ( not ( = ?auto_160695 ?auto_160697 ) ) ( not ( = ?auto_160696 ?auto_160697 ) ) ( not ( = ?auto_160694 ?auto_160697 ) ) ( HOLDING ?auto_160690 ) ( CLEAR ?auto_160691 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160696 ?auto_160694 ?auto_160695 ?auto_160693 ?auto_160692 ?auto_160691 ?auto_160690 )
      ( MAKE-5PILE ?auto_160689 ?auto_160690 ?auto_160691 ?auto_160692 ?auto_160693 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160698 - BLOCK
      ?auto_160699 - BLOCK
      ?auto_160700 - BLOCK
      ?auto_160701 - BLOCK
      ?auto_160702 - BLOCK
    )
    :vars
    (
      ?auto_160705 - BLOCK
      ?auto_160703 - BLOCK
      ?auto_160704 - BLOCK
      ?auto_160706 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160698 ?auto_160699 ) ) ( not ( = ?auto_160698 ?auto_160700 ) ) ( not ( = ?auto_160698 ?auto_160701 ) ) ( not ( = ?auto_160698 ?auto_160702 ) ) ( not ( = ?auto_160699 ?auto_160700 ) ) ( not ( = ?auto_160699 ?auto_160701 ) ) ( not ( = ?auto_160699 ?auto_160702 ) ) ( not ( = ?auto_160700 ?auto_160701 ) ) ( not ( = ?auto_160700 ?auto_160702 ) ) ( not ( = ?auto_160701 ?auto_160702 ) ) ( ON ?auto_160702 ?auto_160705 ) ( not ( = ?auto_160698 ?auto_160705 ) ) ( not ( = ?auto_160699 ?auto_160705 ) ) ( not ( = ?auto_160700 ?auto_160705 ) ) ( not ( = ?auto_160701 ?auto_160705 ) ) ( not ( = ?auto_160702 ?auto_160705 ) ) ( ON ?auto_160701 ?auto_160702 ) ( ON-TABLE ?auto_160703 ) ( ON ?auto_160704 ?auto_160703 ) ( ON ?auto_160705 ?auto_160704 ) ( not ( = ?auto_160703 ?auto_160704 ) ) ( not ( = ?auto_160703 ?auto_160705 ) ) ( not ( = ?auto_160703 ?auto_160702 ) ) ( not ( = ?auto_160703 ?auto_160701 ) ) ( not ( = ?auto_160704 ?auto_160705 ) ) ( not ( = ?auto_160704 ?auto_160702 ) ) ( not ( = ?auto_160704 ?auto_160701 ) ) ( not ( = ?auto_160698 ?auto_160703 ) ) ( not ( = ?auto_160698 ?auto_160704 ) ) ( not ( = ?auto_160699 ?auto_160703 ) ) ( not ( = ?auto_160699 ?auto_160704 ) ) ( not ( = ?auto_160700 ?auto_160703 ) ) ( not ( = ?auto_160700 ?auto_160704 ) ) ( ON ?auto_160700 ?auto_160701 ) ( ON ?auto_160698 ?auto_160706 ) ( not ( = ?auto_160698 ?auto_160706 ) ) ( not ( = ?auto_160699 ?auto_160706 ) ) ( not ( = ?auto_160700 ?auto_160706 ) ) ( not ( = ?auto_160701 ?auto_160706 ) ) ( not ( = ?auto_160702 ?auto_160706 ) ) ( not ( = ?auto_160705 ?auto_160706 ) ) ( not ( = ?auto_160703 ?auto_160706 ) ) ( not ( = ?auto_160704 ?auto_160706 ) ) ( CLEAR ?auto_160700 ) ( ON ?auto_160699 ?auto_160698 ) ( CLEAR ?auto_160699 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_160706 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160706 ?auto_160698 )
      ( MAKE-5PILE ?auto_160698 ?auto_160699 ?auto_160700 ?auto_160701 ?auto_160702 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160707 - BLOCK
      ?auto_160708 - BLOCK
      ?auto_160709 - BLOCK
      ?auto_160710 - BLOCK
      ?auto_160711 - BLOCK
    )
    :vars
    (
      ?auto_160713 - BLOCK
      ?auto_160712 - BLOCK
      ?auto_160715 - BLOCK
      ?auto_160714 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160707 ?auto_160708 ) ) ( not ( = ?auto_160707 ?auto_160709 ) ) ( not ( = ?auto_160707 ?auto_160710 ) ) ( not ( = ?auto_160707 ?auto_160711 ) ) ( not ( = ?auto_160708 ?auto_160709 ) ) ( not ( = ?auto_160708 ?auto_160710 ) ) ( not ( = ?auto_160708 ?auto_160711 ) ) ( not ( = ?auto_160709 ?auto_160710 ) ) ( not ( = ?auto_160709 ?auto_160711 ) ) ( not ( = ?auto_160710 ?auto_160711 ) ) ( ON ?auto_160711 ?auto_160713 ) ( not ( = ?auto_160707 ?auto_160713 ) ) ( not ( = ?auto_160708 ?auto_160713 ) ) ( not ( = ?auto_160709 ?auto_160713 ) ) ( not ( = ?auto_160710 ?auto_160713 ) ) ( not ( = ?auto_160711 ?auto_160713 ) ) ( ON ?auto_160710 ?auto_160711 ) ( ON-TABLE ?auto_160712 ) ( ON ?auto_160715 ?auto_160712 ) ( ON ?auto_160713 ?auto_160715 ) ( not ( = ?auto_160712 ?auto_160715 ) ) ( not ( = ?auto_160712 ?auto_160713 ) ) ( not ( = ?auto_160712 ?auto_160711 ) ) ( not ( = ?auto_160712 ?auto_160710 ) ) ( not ( = ?auto_160715 ?auto_160713 ) ) ( not ( = ?auto_160715 ?auto_160711 ) ) ( not ( = ?auto_160715 ?auto_160710 ) ) ( not ( = ?auto_160707 ?auto_160712 ) ) ( not ( = ?auto_160707 ?auto_160715 ) ) ( not ( = ?auto_160708 ?auto_160712 ) ) ( not ( = ?auto_160708 ?auto_160715 ) ) ( not ( = ?auto_160709 ?auto_160712 ) ) ( not ( = ?auto_160709 ?auto_160715 ) ) ( ON ?auto_160707 ?auto_160714 ) ( not ( = ?auto_160707 ?auto_160714 ) ) ( not ( = ?auto_160708 ?auto_160714 ) ) ( not ( = ?auto_160709 ?auto_160714 ) ) ( not ( = ?auto_160710 ?auto_160714 ) ) ( not ( = ?auto_160711 ?auto_160714 ) ) ( not ( = ?auto_160713 ?auto_160714 ) ) ( not ( = ?auto_160712 ?auto_160714 ) ) ( not ( = ?auto_160715 ?auto_160714 ) ) ( ON ?auto_160708 ?auto_160707 ) ( CLEAR ?auto_160708 ) ( ON-TABLE ?auto_160714 ) ( HOLDING ?auto_160709 ) ( CLEAR ?auto_160710 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160712 ?auto_160715 ?auto_160713 ?auto_160711 ?auto_160710 ?auto_160709 )
      ( MAKE-5PILE ?auto_160707 ?auto_160708 ?auto_160709 ?auto_160710 ?auto_160711 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160716 - BLOCK
      ?auto_160717 - BLOCK
      ?auto_160718 - BLOCK
      ?auto_160719 - BLOCK
      ?auto_160720 - BLOCK
    )
    :vars
    (
      ?auto_160723 - BLOCK
      ?auto_160722 - BLOCK
      ?auto_160721 - BLOCK
      ?auto_160724 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160716 ?auto_160717 ) ) ( not ( = ?auto_160716 ?auto_160718 ) ) ( not ( = ?auto_160716 ?auto_160719 ) ) ( not ( = ?auto_160716 ?auto_160720 ) ) ( not ( = ?auto_160717 ?auto_160718 ) ) ( not ( = ?auto_160717 ?auto_160719 ) ) ( not ( = ?auto_160717 ?auto_160720 ) ) ( not ( = ?auto_160718 ?auto_160719 ) ) ( not ( = ?auto_160718 ?auto_160720 ) ) ( not ( = ?auto_160719 ?auto_160720 ) ) ( ON ?auto_160720 ?auto_160723 ) ( not ( = ?auto_160716 ?auto_160723 ) ) ( not ( = ?auto_160717 ?auto_160723 ) ) ( not ( = ?auto_160718 ?auto_160723 ) ) ( not ( = ?auto_160719 ?auto_160723 ) ) ( not ( = ?auto_160720 ?auto_160723 ) ) ( ON ?auto_160719 ?auto_160720 ) ( ON-TABLE ?auto_160722 ) ( ON ?auto_160721 ?auto_160722 ) ( ON ?auto_160723 ?auto_160721 ) ( not ( = ?auto_160722 ?auto_160721 ) ) ( not ( = ?auto_160722 ?auto_160723 ) ) ( not ( = ?auto_160722 ?auto_160720 ) ) ( not ( = ?auto_160722 ?auto_160719 ) ) ( not ( = ?auto_160721 ?auto_160723 ) ) ( not ( = ?auto_160721 ?auto_160720 ) ) ( not ( = ?auto_160721 ?auto_160719 ) ) ( not ( = ?auto_160716 ?auto_160722 ) ) ( not ( = ?auto_160716 ?auto_160721 ) ) ( not ( = ?auto_160717 ?auto_160722 ) ) ( not ( = ?auto_160717 ?auto_160721 ) ) ( not ( = ?auto_160718 ?auto_160722 ) ) ( not ( = ?auto_160718 ?auto_160721 ) ) ( ON ?auto_160716 ?auto_160724 ) ( not ( = ?auto_160716 ?auto_160724 ) ) ( not ( = ?auto_160717 ?auto_160724 ) ) ( not ( = ?auto_160718 ?auto_160724 ) ) ( not ( = ?auto_160719 ?auto_160724 ) ) ( not ( = ?auto_160720 ?auto_160724 ) ) ( not ( = ?auto_160723 ?auto_160724 ) ) ( not ( = ?auto_160722 ?auto_160724 ) ) ( not ( = ?auto_160721 ?auto_160724 ) ) ( ON ?auto_160717 ?auto_160716 ) ( ON-TABLE ?auto_160724 ) ( CLEAR ?auto_160719 ) ( ON ?auto_160718 ?auto_160717 ) ( CLEAR ?auto_160718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_160724 ?auto_160716 ?auto_160717 )
      ( MAKE-5PILE ?auto_160716 ?auto_160717 ?auto_160718 ?auto_160719 ?auto_160720 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160725 - BLOCK
      ?auto_160726 - BLOCK
      ?auto_160727 - BLOCK
      ?auto_160728 - BLOCK
      ?auto_160729 - BLOCK
    )
    :vars
    (
      ?auto_160731 - BLOCK
      ?auto_160733 - BLOCK
      ?auto_160732 - BLOCK
      ?auto_160730 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160725 ?auto_160726 ) ) ( not ( = ?auto_160725 ?auto_160727 ) ) ( not ( = ?auto_160725 ?auto_160728 ) ) ( not ( = ?auto_160725 ?auto_160729 ) ) ( not ( = ?auto_160726 ?auto_160727 ) ) ( not ( = ?auto_160726 ?auto_160728 ) ) ( not ( = ?auto_160726 ?auto_160729 ) ) ( not ( = ?auto_160727 ?auto_160728 ) ) ( not ( = ?auto_160727 ?auto_160729 ) ) ( not ( = ?auto_160728 ?auto_160729 ) ) ( ON ?auto_160729 ?auto_160731 ) ( not ( = ?auto_160725 ?auto_160731 ) ) ( not ( = ?auto_160726 ?auto_160731 ) ) ( not ( = ?auto_160727 ?auto_160731 ) ) ( not ( = ?auto_160728 ?auto_160731 ) ) ( not ( = ?auto_160729 ?auto_160731 ) ) ( ON-TABLE ?auto_160733 ) ( ON ?auto_160732 ?auto_160733 ) ( ON ?auto_160731 ?auto_160732 ) ( not ( = ?auto_160733 ?auto_160732 ) ) ( not ( = ?auto_160733 ?auto_160731 ) ) ( not ( = ?auto_160733 ?auto_160729 ) ) ( not ( = ?auto_160733 ?auto_160728 ) ) ( not ( = ?auto_160732 ?auto_160731 ) ) ( not ( = ?auto_160732 ?auto_160729 ) ) ( not ( = ?auto_160732 ?auto_160728 ) ) ( not ( = ?auto_160725 ?auto_160733 ) ) ( not ( = ?auto_160725 ?auto_160732 ) ) ( not ( = ?auto_160726 ?auto_160733 ) ) ( not ( = ?auto_160726 ?auto_160732 ) ) ( not ( = ?auto_160727 ?auto_160733 ) ) ( not ( = ?auto_160727 ?auto_160732 ) ) ( ON ?auto_160725 ?auto_160730 ) ( not ( = ?auto_160725 ?auto_160730 ) ) ( not ( = ?auto_160726 ?auto_160730 ) ) ( not ( = ?auto_160727 ?auto_160730 ) ) ( not ( = ?auto_160728 ?auto_160730 ) ) ( not ( = ?auto_160729 ?auto_160730 ) ) ( not ( = ?auto_160731 ?auto_160730 ) ) ( not ( = ?auto_160733 ?auto_160730 ) ) ( not ( = ?auto_160732 ?auto_160730 ) ) ( ON ?auto_160726 ?auto_160725 ) ( ON-TABLE ?auto_160730 ) ( ON ?auto_160727 ?auto_160726 ) ( CLEAR ?auto_160727 ) ( HOLDING ?auto_160728 ) ( CLEAR ?auto_160729 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_160733 ?auto_160732 ?auto_160731 ?auto_160729 ?auto_160728 )
      ( MAKE-5PILE ?auto_160725 ?auto_160726 ?auto_160727 ?auto_160728 ?auto_160729 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160734 - BLOCK
      ?auto_160735 - BLOCK
      ?auto_160736 - BLOCK
      ?auto_160737 - BLOCK
      ?auto_160738 - BLOCK
    )
    :vars
    (
      ?auto_160739 - BLOCK
      ?auto_160740 - BLOCK
      ?auto_160741 - BLOCK
      ?auto_160742 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160734 ?auto_160735 ) ) ( not ( = ?auto_160734 ?auto_160736 ) ) ( not ( = ?auto_160734 ?auto_160737 ) ) ( not ( = ?auto_160734 ?auto_160738 ) ) ( not ( = ?auto_160735 ?auto_160736 ) ) ( not ( = ?auto_160735 ?auto_160737 ) ) ( not ( = ?auto_160735 ?auto_160738 ) ) ( not ( = ?auto_160736 ?auto_160737 ) ) ( not ( = ?auto_160736 ?auto_160738 ) ) ( not ( = ?auto_160737 ?auto_160738 ) ) ( ON ?auto_160738 ?auto_160739 ) ( not ( = ?auto_160734 ?auto_160739 ) ) ( not ( = ?auto_160735 ?auto_160739 ) ) ( not ( = ?auto_160736 ?auto_160739 ) ) ( not ( = ?auto_160737 ?auto_160739 ) ) ( not ( = ?auto_160738 ?auto_160739 ) ) ( ON-TABLE ?auto_160740 ) ( ON ?auto_160741 ?auto_160740 ) ( ON ?auto_160739 ?auto_160741 ) ( not ( = ?auto_160740 ?auto_160741 ) ) ( not ( = ?auto_160740 ?auto_160739 ) ) ( not ( = ?auto_160740 ?auto_160738 ) ) ( not ( = ?auto_160740 ?auto_160737 ) ) ( not ( = ?auto_160741 ?auto_160739 ) ) ( not ( = ?auto_160741 ?auto_160738 ) ) ( not ( = ?auto_160741 ?auto_160737 ) ) ( not ( = ?auto_160734 ?auto_160740 ) ) ( not ( = ?auto_160734 ?auto_160741 ) ) ( not ( = ?auto_160735 ?auto_160740 ) ) ( not ( = ?auto_160735 ?auto_160741 ) ) ( not ( = ?auto_160736 ?auto_160740 ) ) ( not ( = ?auto_160736 ?auto_160741 ) ) ( ON ?auto_160734 ?auto_160742 ) ( not ( = ?auto_160734 ?auto_160742 ) ) ( not ( = ?auto_160735 ?auto_160742 ) ) ( not ( = ?auto_160736 ?auto_160742 ) ) ( not ( = ?auto_160737 ?auto_160742 ) ) ( not ( = ?auto_160738 ?auto_160742 ) ) ( not ( = ?auto_160739 ?auto_160742 ) ) ( not ( = ?auto_160740 ?auto_160742 ) ) ( not ( = ?auto_160741 ?auto_160742 ) ) ( ON ?auto_160735 ?auto_160734 ) ( ON-TABLE ?auto_160742 ) ( ON ?auto_160736 ?auto_160735 ) ( CLEAR ?auto_160738 ) ( ON ?auto_160737 ?auto_160736 ) ( CLEAR ?auto_160737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_160742 ?auto_160734 ?auto_160735 ?auto_160736 )
      ( MAKE-5PILE ?auto_160734 ?auto_160735 ?auto_160736 ?auto_160737 ?auto_160738 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160743 - BLOCK
      ?auto_160744 - BLOCK
      ?auto_160745 - BLOCK
      ?auto_160746 - BLOCK
      ?auto_160747 - BLOCK
    )
    :vars
    (
      ?auto_160750 - BLOCK
      ?auto_160748 - BLOCK
      ?auto_160749 - BLOCK
      ?auto_160751 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160743 ?auto_160744 ) ) ( not ( = ?auto_160743 ?auto_160745 ) ) ( not ( = ?auto_160743 ?auto_160746 ) ) ( not ( = ?auto_160743 ?auto_160747 ) ) ( not ( = ?auto_160744 ?auto_160745 ) ) ( not ( = ?auto_160744 ?auto_160746 ) ) ( not ( = ?auto_160744 ?auto_160747 ) ) ( not ( = ?auto_160745 ?auto_160746 ) ) ( not ( = ?auto_160745 ?auto_160747 ) ) ( not ( = ?auto_160746 ?auto_160747 ) ) ( not ( = ?auto_160743 ?auto_160750 ) ) ( not ( = ?auto_160744 ?auto_160750 ) ) ( not ( = ?auto_160745 ?auto_160750 ) ) ( not ( = ?auto_160746 ?auto_160750 ) ) ( not ( = ?auto_160747 ?auto_160750 ) ) ( ON-TABLE ?auto_160748 ) ( ON ?auto_160749 ?auto_160748 ) ( ON ?auto_160750 ?auto_160749 ) ( not ( = ?auto_160748 ?auto_160749 ) ) ( not ( = ?auto_160748 ?auto_160750 ) ) ( not ( = ?auto_160748 ?auto_160747 ) ) ( not ( = ?auto_160748 ?auto_160746 ) ) ( not ( = ?auto_160749 ?auto_160750 ) ) ( not ( = ?auto_160749 ?auto_160747 ) ) ( not ( = ?auto_160749 ?auto_160746 ) ) ( not ( = ?auto_160743 ?auto_160748 ) ) ( not ( = ?auto_160743 ?auto_160749 ) ) ( not ( = ?auto_160744 ?auto_160748 ) ) ( not ( = ?auto_160744 ?auto_160749 ) ) ( not ( = ?auto_160745 ?auto_160748 ) ) ( not ( = ?auto_160745 ?auto_160749 ) ) ( ON ?auto_160743 ?auto_160751 ) ( not ( = ?auto_160743 ?auto_160751 ) ) ( not ( = ?auto_160744 ?auto_160751 ) ) ( not ( = ?auto_160745 ?auto_160751 ) ) ( not ( = ?auto_160746 ?auto_160751 ) ) ( not ( = ?auto_160747 ?auto_160751 ) ) ( not ( = ?auto_160750 ?auto_160751 ) ) ( not ( = ?auto_160748 ?auto_160751 ) ) ( not ( = ?auto_160749 ?auto_160751 ) ) ( ON ?auto_160744 ?auto_160743 ) ( ON-TABLE ?auto_160751 ) ( ON ?auto_160745 ?auto_160744 ) ( ON ?auto_160746 ?auto_160745 ) ( CLEAR ?auto_160746 ) ( HOLDING ?auto_160747 ) ( CLEAR ?auto_160750 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_160748 ?auto_160749 ?auto_160750 ?auto_160747 )
      ( MAKE-5PILE ?auto_160743 ?auto_160744 ?auto_160745 ?auto_160746 ?auto_160747 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160752 - BLOCK
      ?auto_160753 - BLOCK
      ?auto_160754 - BLOCK
      ?auto_160755 - BLOCK
      ?auto_160756 - BLOCK
    )
    :vars
    (
      ?auto_160759 - BLOCK
      ?auto_160760 - BLOCK
      ?auto_160758 - BLOCK
      ?auto_160757 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160752 ?auto_160753 ) ) ( not ( = ?auto_160752 ?auto_160754 ) ) ( not ( = ?auto_160752 ?auto_160755 ) ) ( not ( = ?auto_160752 ?auto_160756 ) ) ( not ( = ?auto_160753 ?auto_160754 ) ) ( not ( = ?auto_160753 ?auto_160755 ) ) ( not ( = ?auto_160753 ?auto_160756 ) ) ( not ( = ?auto_160754 ?auto_160755 ) ) ( not ( = ?auto_160754 ?auto_160756 ) ) ( not ( = ?auto_160755 ?auto_160756 ) ) ( not ( = ?auto_160752 ?auto_160759 ) ) ( not ( = ?auto_160753 ?auto_160759 ) ) ( not ( = ?auto_160754 ?auto_160759 ) ) ( not ( = ?auto_160755 ?auto_160759 ) ) ( not ( = ?auto_160756 ?auto_160759 ) ) ( ON-TABLE ?auto_160760 ) ( ON ?auto_160758 ?auto_160760 ) ( ON ?auto_160759 ?auto_160758 ) ( not ( = ?auto_160760 ?auto_160758 ) ) ( not ( = ?auto_160760 ?auto_160759 ) ) ( not ( = ?auto_160760 ?auto_160756 ) ) ( not ( = ?auto_160760 ?auto_160755 ) ) ( not ( = ?auto_160758 ?auto_160759 ) ) ( not ( = ?auto_160758 ?auto_160756 ) ) ( not ( = ?auto_160758 ?auto_160755 ) ) ( not ( = ?auto_160752 ?auto_160760 ) ) ( not ( = ?auto_160752 ?auto_160758 ) ) ( not ( = ?auto_160753 ?auto_160760 ) ) ( not ( = ?auto_160753 ?auto_160758 ) ) ( not ( = ?auto_160754 ?auto_160760 ) ) ( not ( = ?auto_160754 ?auto_160758 ) ) ( ON ?auto_160752 ?auto_160757 ) ( not ( = ?auto_160752 ?auto_160757 ) ) ( not ( = ?auto_160753 ?auto_160757 ) ) ( not ( = ?auto_160754 ?auto_160757 ) ) ( not ( = ?auto_160755 ?auto_160757 ) ) ( not ( = ?auto_160756 ?auto_160757 ) ) ( not ( = ?auto_160759 ?auto_160757 ) ) ( not ( = ?auto_160760 ?auto_160757 ) ) ( not ( = ?auto_160758 ?auto_160757 ) ) ( ON ?auto_160753 ?auto_160752 ) ( ON-TABLE ?auto_160757 ) ( ON ?auto_160754 ?auto_160753 ) ( ON ?auto_160755 ?auto_160754 ) ( CLEAR ?auto_160759 ) ( ON ?auto_160756 ?auto_160755 ) ( CLEAR ?auto_160756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_160757 ?auto_160752 ?auto_160753 ?auto_160754 ?auto_160755 )
      ( MAKE-5PILE ?auto_160752 ?auto_160753 ?auto_160754 ?auto_160755 ?auto_160756 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160761 - BLOCK
      ?auto_160762 - BLOCK
      ?auto_160763 - BLOCK
      ?auto_160764 - BLOCK
      ?auto_160765 - BLOCK
    )
    :vars
    (
      ?auto_160768 - BLOCK
      ?auto_160767 - BLOCK
      ?auto_160769 - BLOCK
      ?auto_160766 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160761 ?auto_160762 ) ) ( not ( = ?auto_160761 ?auto_160763 ) ) ( not ( = ?auto_160761 ?auto_160764 ) ) ( not ( = ?auto_160761 ?auto_160765 ) ) ( not ( = ?auto_160762 ?auto_160763 ) ) ( not ( = ?auto_160762 ?auto_160764 ) ) ( not ( = ?auto_160762 ?auto_160765 ) ) ( not ( = ?auto_160763 ?auto_160764 ) ) ( not ( = ?auto_160763 ?auto_160765 ) ) ( not ( = ?auto_160764 ?auto_160765 ) ) ( not ( = ?auto_160761 ?auto_160768 ) ) ( not ( = ?auto_160762 ?auto_160768 ) ) ( not ( = ?auto_160763 ?auto_160768 ) ) ( not ( = ?auto_160764 ?auto_160768 ) ) ( not ( = ?auto_160765 ?auto_160768 ) ) ( ON-TABLE ?auto_160767 ) ( ON ?auto_160769 ?auto_160767 ) ( not ( = ?auto_160767 ?auto_160769 ) ) ( not ( = ?auto_160767 ?auto_160768 ) ) ( not ( = ?auto_160767 ?auto_160765 ) ) ( not ( = ?auto_160767 ?auto_160764 ) ) ( not ( = ?auto_160769 ?auto_160768 ) ) ( not ( = ?auto_160769 ?auto_160765 ) ) ( not ( = ?auto_160769 ?auto_160764 ) ) ( not ( = ?auto_160761 ?auto_160767 ) ) ( not ( = ?auto_160761 ?auto_160769 ) ) ( not ( = ?auto_160762 ?auto_160767 ) ) ( not ( = ?auto_160762 ?auto_160769 ) ) ( not ( = ?auto_160763 ?auto_160767 ) ) ( not ( = ?auto_160763 ?auto_160769 ) ) ( ON ?auto_160761 ?auto_160766 ) ( not ( = ?auto_160761 ?auto_160766 ) ) ( not ( = ?auto_160762 ?auto_160766 ) ) ( not ( = ?auto_160763 ?auto_160766 ) ) ( not ( = ?auto_160764 ?auto_160766 ) ) ( not ( = ?auto_160765 ?auto_160766 ) ) ( not ( = ?auto_160768 ?auto_160766 ) ) ( not ( = ?auto_160767 ?auto_160766 ) ) ( not ( = ?auto_160769 ?auto_160766 ) ) ( ON ?auto_160762 ?auto_160761 ) ( ON-TABLE ?auto_160766 ) ( ON ?auto_160763 ?auto_160762 ) ( ON ?auto_160764 ?auto_160763 ) ( ON ?auto_160765 ?auto_160764 ) ( CLEAR ?auto_160765 ) ( HOLDING ?auto_160768 ) ( CLEAR ?auto_160769 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_160767 ?auto_160769 ?auto_160768 )
      ( MAKE-5PILE ?auto_160761 ?auto_160762 ?auto_160763 ?auto_160764 ?auto_160765 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160770 - BLOCK
      ?auto_160771 - BLOCK
      ?auto_160772 - BLOCK
      ?auto_160773 - BLOCK
      ?auto_160774 - BLOCK
    )
    :vars
    (
      ?auto_160778 - BLOCK
      ?auto_160777 - BLOCK
      ?auto_160776 - BLOCK
      ?auto_160775 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160770 ?auto_160771 ) ) ( not ( = ?auto_160770 ?auto_160772 ) ) ( not ( = ?auto_160770 ?auto_160773 ) ) ( not ( = ?auto_160770 ?auto_160774 ) ) ( not ( = ?auto_160771 ?auto_160772 ) ) ( not ( = ?auto_160771 ?auto_160773 ) ) ( not ( = ?auto_160771 ?auto_160774 ) ) ( not ( = ?auto_160772 ?auto_160773 ) ) ( not ( = ?auto_160772 ?auto_160774 ) ) ( not ( = ?auto_160773 ?auto_160774 ) ) ( not ( = ?auto_160770 ?auto_160778 ) ) ( not ( = ?auto_160771 ?auto_160778 ) ) ( not ( = ?auto_160772 ?auto_160778 ) ) ( not ( = ?auto_160773 ?auto_160778 ) ) ( not ( = ?auto_160774 ?auto_160778 ) ) ( ON-TABLE ?auto_160777 ) ( ON ?auto_160776 ?auto_160777 ) ( not ( = ?auto_160777 ?auto_160776 ) ) ( not ( = ?auto_160777 ?auto_160778 ) ) ( not ( = ?auto_160777 ?auto_160774 ) ) ( not ( = ?auto_160777 ?auto_160773 ) ) ( not ( = ?auto_160776 ?auto_160778 ) ) ( not ( = ?auto_160776 ?auto_160774 ) ) ( not ( = ?auto_160776 ?auto_160773 ) ) ( not ( = ?auto_160770 ?auto_160777 ) ) ( not ( = ?auto_160770 ?auto_160776 ) ) ( not ( = ?auto_160771 ?auto_160777 ) ) ( not ( = ?auto_160771 ?auto_160776 ) ) ( not ( = ?auto_160772 ?auto_160777 ) ) ( not ( = ?auto_160772 ?auto_160776 ) ) ( ON ?auto_160770 ?auto_160775 ) ( not ( = ?auto_160770 ?auto_160775 ) ) ( not ( = ?auto_160771 ?auto_160775 ) ) ( not ( = ?auto_160772 ?auto_160775 ) ) ( not ( = ?auto_160773 ?auto_160775 ) ) ( not ( = ?auto_160774 ?auto_160775 ) ) ( not ( = ?auto_160778 ?auto_160775 ) ) ( not ( = ?auto_160777 ?auto_160775 ) ) ( not ( = ?auto_160776 ?auto_160775 ) ) ( ON ?auto_160771 ?auto_160770 ) ( ON-TABLE ?auto_160775 ) ( ON ?auto_160772 ?auto_160771 ) ( ON ?auto_160773 ?auto_160772 ) ( ON ?auto_160774 ?auto_160773 ) ( CLEAR ?auto_160776 ) ( ON ?auto_160778 ?auto_160774 ) ( CLEAR ?auto_160778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160775 ?auto_160770 ?auto_160771 ?auto_160772 ?auto_160773 ?auto_160774 )
      ( MAKE-5PILE ?auto_160770 ?auto_160771 ?auto_160772 ?auto_160773 ?auto_160774 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160779 - BLOCK
      ?auto_160780 - BLOCK
      ?auto_160781 - BLOCK
      ?auto_160782 - BLOCK
      ?auto_160783 - BLOCK
    )
    :vars
    (
      ?auto_160785 - BLOCK
      ?auto_160787 - BLOCK
      ?auto_160786 - BLOCK
      ?auto_160784 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160779 ?auto_160780 ) ) ( not ( = ?auto_160779 ?auto_160781 ) ) ( not ( = ?auto_160779 ?auto_160782 ) ) ( not ( = ?auto_160779 ?auto_160783 ) ) ( not ( = ?auto_160780 ?auto_160781 ) ) ( not ( = ?auto_160780 ?auto_160782 ) ) ( not ( = ?auto_160780 ?auto_160783 ) ) ( not ( = ?auto_160781 ?auto_160782 ) ) ( not ( = ?auto_160781 ?auto_160783 ) ) ( not ( = ?auto_160782 ?auto_160783 ) ) ( not ( = ?auto_160779 ?auto_160785 ) ) ( not ( = ?auto_160780 ?auto_160785 ) ) ( not ( = ?auto_160781 ?auto_160785 ) ) ( not ( = ?auto_160782 ?auto_160785 ) ) ( not ( = ?auto_160783 ?auto_160785 ) ) ( ON-TABLE ?auto_160787 ) ( not ( = ?auto_160787 ?auto_160786 ) ) ( not ( = ?auto_160787 ?auto_160785 ) ) ( not ( = ?auto_160787 ?auto_160783 ) ) ( not ( = ?auto_160787 ?auto_160782 ) ) ( not ( = ?auto_160786 ?auto_160785 ) ) ( not ( = ?auto_160786 ?auto_160783 ) ) ( not ( = ?auto_160786 ?auto_160782 ) ) ( not ( = ?auto_160779 ?auto_160787 ) ) ( not ( = ?auto_160779 ?auto_160786 ) ) ( not ( = ?auto_160780 ?auto_160787 ) ) ( not ( = ?auto_160780 ?auto_160786 ) ) ( not ( = ?auto_160781 ?auto_160787 ) ) ( not ( = ?auto_160781 ?auto_160786 ) ) ( ON ?auto_160779 ?auto_160784 ) ( not ( = ?auto_160779 ?auto_160784 ) ) ( not ( = ?auto_160780 ?auto_160784 ) ) ( not ( = ?auto_160781 ?auto_160784 ) ) ( not ( = ?auto_160782 ?auto_160784 ) ) ( not ( = ?auto_160783 ?auto_160784 ) ) ( not ( = ?auto_160785 ?auto_160784 ) ) ( not ( = ?auto_160787 ?auto_160784 ) ) ( not ( = ?auto_160786 ?auto_160784 ) ) ( ON ?auto_160780 ?auto_160779 ) ( ON-TABLE ?auto_160784 ) ( ON ?auto_160781 ?auto_160780 ) ( ON ?auto_160782 ?auto_160781 ) ( ON ?auto_160783 ?auto_160782 ) ( ON ?auto_160785 ?auto_160783 ) ( CLEAR ?auto_160785 ) ( HOLDING ?auto_160786 ) ( CLEAR ?auto_160787 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160787 ?auto_160786 )
      ( MAKE-5PILE ?auto_160779 ?auto_160780 ?auto_160781 ?auto_160782 ?auto_160783 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160788 - BLOCK
      ?auto_160789 - BLOCK
      ?auto_160790 - BLOCK
      ?auto_160791 - BLOCK
      ?auto_160792 - BLOCK
    )
    :vars
    (
      ?auto_160796 - BLOCK
      ?auto_160794 - BLOCK
      ?auto_160793 - BLOCK
      ?auto_160795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160788 ?auto_160789 ) ) ( not ( = ?auto_160788 ?auto_160790 ) ) ( not ( = ?auto_160788 ?auto_160791 ) ) ( not ( = ?auto_160788 ?auto_160792 ) ) ( not ( = ?auto_160789 ?auto_160790 ) ) ( not ( = ?auto_160789 ?auto_160791 ) ) ( not ( = ?auto_160789 ?auto_160792 ) ) ( not ( = ?auto_160790 ?auto_160791 ) ) ( not ( = ?auto_160790 ?auto_160792 ) ) ( not ( = ?auto_160791 ?auto_160792 ) ) ( not ( = ?auto_160788 ?auto_160796 ) ) ( not ( = ?auto_160789 ?auto_160796 ) ) ( not ( = ?auto_160790 ?auto_160796 ) ) ( not ( = ?auto_160791 ?auto_160796 ) ) ( not ( = ?auto_160792 ?auto_160796 ) ) ( ON-TABLE ?auto_160794 ) ( not ( = ?auto_160794 ?auto_160793 ) ) ( not ( = ?auto_160794 ?auto_160796 ) ) ( not ( = ?auto_160794 ?auto_160792 ) ) ( not ( = ?auto_160794 ?auto_160791 ) ) ( not ( = ?auto_160793 ?auto_160796 ) ) ( not ( = ?auto_160793 ?auto_160792 ) ) ( not ( = ?auto_160793 ?auto_160791 ) ) ( not ( = ?auto_160788 ?auto_160794 ) ) ( not ( = ?auto_160788 ?auto_160793 ) ) ( not ( = ?auto_160789 ?auto_160794 ) ) ( not ( = ?auto_160789 ?auto_160793 ) ) ( not ( = ?auto_160790 ?auto_160794 ) ) ( not ( = ?auto_160790 ?auto_160793 ) ) ( ON ?auto_160788 ?auto_160795 ) ( not ( = ?auto_160788 ?auto_160795 ) ) ( not ( = ?auto_160789 ?auto_160795 ) ) ( not ( = ?auto_160790 ?auto_160795 ) ) ( not ( = ?auto_160791 ?auto_160795 ) ) ( not ( = ?auto_160792 ?auto_160795 ) ) ( not ( = ?auto_160796 ?auto_160795 ) ) ( not ( = ?auto_160794 ?auto_160795 ) ) ( not ( = ?auto_160793 ?auto_160795 ) ) ( ON ?auto_160789 ?auto_160788 ) ( ON-TABLE ?auto_160795 ) ( ON ?auto_160790 ?auto_160789 ) ( ON ?auto_160791 ?auto_160790 ) ( ON ?auto_160792 ?auto_160791 ) ( ON ?auto_160796 ?auto_160792 ) ( CLEAR ?auto_160794 ) ( ON ?auto_160793 ?auto_160796 ) ( CLEAR ?auto_160793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160795 ?auto_160788 ?auto_160789 ?auto_160790 ?auto_160791 ?auto_160792 ?auto_160796 )
      ( MAKE-5PILE ?auto_160788 ?auto_160789 ?auto_160790 ?auto_160791 ?auto_160792 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160797 - BLOCK
      ?auto_160798 - BLOCK
      ?auto_160799 - BLOCK
      ?auto_160800 - BLOCK
      ?auto_160801 - BLOCK
    )
    :vars
    (
      ?auto_160804 - BLOCK
      ?auto_160803 - BLOCK
      ?auto_160805 - BLOCK
      ?auto_160802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160797 ?auto_160798 ) ) ( not ( = ?auto_160797 ?auto_160799 ) ) ( not ( = ?auto_160797 ?auto_160800 ) ) ( not ( = ?auto_160797 ?auto_160801 ) ) ( not ( = ?auto_160798 ?auto_160799 ) ) ( not ( = ?auto_160798 ?auto_160800 ) ) ( not ( = ?auto_160798 ?auto_160801 ) ) ( not ( = ?auto_160799 ?auto_160800 ) ) ( not ( = ?auto_160799 ?auto_160801 ) ) ( not ( = ?auto_160800 ?auto_160801 ) ) ( not ( = ?auto_160797 ?auto_160804 ) ) ( not ( = ?auto_160798 ?auto_160804 ) ) ( not ( = ?auto_160799 ?auto_160804 ) ) ( not ( = ?auto_160800 ?auto_160804 ) ) ( not ( = ?auto_160801 ?auto_160804 ) ) ( not ( = ?auto_160803 ?auto_160805 ) ) ( not ( = ?auto_160803 ?auto_160804 ) ) ( not ( = ?auto_160803 ?auto_160801 ) ) ( not ( = ?auto_160803 ?auto_160800 ) ) ( not ( = ?auto_160805 ?auto_160804 ) ) ( not ( = ?auto_160805 ?auto_160801 ) ) ( not ( = ?auto_160805 ?auto_160800 ) ) ( not ( = ?auto_160797 ?auto_160803 ) ) ( not ( = ?auto_160797 ?auto_160805 ) ) ( not ( = ?auto_160798 ?auto_160803 ) ) ( not ( = ?auto_160798 ?auto_160805 ) ) ( not ( = ?auto_160799 ?auto_160803 ) ) ( not ( = ?auto_160799 ?auto_160805 ) ) ( ON ?auto_160797 ?auto_160802 ) ( not ( = ?auto_160797 ?auto_160802 ) ) ( not ( = ?auto_160798 ?auto_160802 ) ) ( not ( = ?auto_160799 ?auto_160802 ) ) ( not ( = ?auto_160800 ?auto_160802 ) ) ( not ( = ?auto_160801 ?auto_160802 ) ) ( not ( = ?auto_160804 ?auto_160802 ) ) ( not ( = ?auto_160803 ?auto_160802 ) ) ( not ( = ?auto_160805 ?auto_160802 ) ) ( ON ?auto_160798 ?auto_160797 ) ( ON-TABLE ?auto_160802 ) ( ON ?auto_160799 ?auto_160798 ) ( ON ?auto_160800 ?auto_160799 ) ( ON ?auto_160801 ?auto_160800 ) ( ON ?auto_160804 ?auto_160801 ) ( ON ?auto_160805 ?auto_160804 ) ( CLEAR ?auto_160805 ) ( HOLDING ?auto_160803 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_160803 )
      ( MAKE-5PILE ?auto_160797 ?auto_160798 ?auto_160799 ?auto_160800 ?auto_160801 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160806 - BLOCK
      ?auto_160807 - BLOCK
      ?auto_160808 - BLOCK
      ?auto_160809 - BLOCK
      ?auto_160810 - BLOCK
    )
    :vars
    (
      ?auto_160813 - BLOCK
      ?auto_160812 - BLOCK
      ?auto_160814 - BLOCK
      ?auto_160811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160806 ?auto_160807 ) ) ( not ( = ?auto_160806 ?auto_160808 ) ) ( not ( = ?auto_160806 ?auto_160809 ) ) ( not ( = ?auto_160806 ?auto_160810 ) ) ( not ( = ?auto_160807 ?auto_160808 ) ) ( not ( = ?auto_160807 ?auto_160809 ) ) ( not ( = ?auto_160807 ?auto_160810 ) ) ( not ( = ?auto_160808 ?auto_160809 ) ) ( not ( = ?auto_160808 ?auto_160810 ) ) ( not ( = ?auto_160809 ?auto_160810 ) ) ( not ( = ?auto_160806 ?auto_160813 ) ) ( not ( = ?auto_160807 ?auto_160813 ) ) ( not ( = ?auto_160808 ?auto_160813 ) ) ( not ( = ?auto_160809 ?auto_160813 ) ) ( not ( = ?auto_160810 ?auto_160813 ) ) ( not ( = ?auto_160812 ?auto_160814 ) ) ( not ( = ?auto_160812 ?auto_160813 ) ) ( not ( = ?auto_160812 ?auto_160810 ) ) ( not ( = ?auto_160812 ?auto_160809 ) ) ( not ( = ?auto_160814 ?auto_160813 ) ) ( not ( = ?auto_160814 ?auto_160810 ) ) ( not ( = ?auto_160814 ?auto_160809 ) ) ( not ( = ?auto_160806 ?auto_160812 ) ) ( not ( = ?auto_160806 ?auto_160814 ) ) ( not ( = ?auto_160807 ?auto_160812 ) ) ( not ( = ?auto_160807 ?auto_160814 ) ) ( not ( = ?auto_160808 ?auto_160812 ) ) ( not ( = ?auto_160808 ?auto_160814 ) ) ( ON ?auto_160806 ?auto_160811 ) ( not ( = ?auto_160806 ?auto_160811 ) ) ( not ( = ?auto_160807 ?auto_160811 ) ) ( not ( = ?auto_160808 ?auto_160811 ) ) ( not ( = ?auto_160809 ?auto_160811 ) ) ( not ( = ?auto_160810 ?auto_160811 ) ) ( not ( = ?auto_160813 ?auto_160811 ) ) ( not ( = ?auto_160812 ?auto_160811 ) ) ( not ( = ?auto_160814 ?auto_160811 ) ) ( ON ?auto_160807 ?auto_160806 ) ( ON-TABLE ?auto_160811 ) ( ON ?auto_160808 ?auto_160807 ) ( ON ?auto_160809 ?auto_160808 ) ( ON ?auto_160810 ?auto_160809 ) ( ON ?auto_160813 ?auto_160810 ) ( ON ?auto_160814 ?auto_160813 ) ( ON ?auto_160812 ?auto_160814 ) ( CLEAR ?auto_160812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_160811 ?auto_160806 ?auto_160807 ?auto_160808 ?auto_160809 ?auto_160810 ?auto_160813 ?auto_160814 )
      ( MAKE-5PILE ?auto_160806 ?auto_160807 ?auto_160808 ?auto_160809 ?auto_160810 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_160830 - BLOCK
      ?auto_160831 - BLOCK
    )
    :vars
    (
      ?auto_160834 - BLOCK
      ?auto_160832 - BLOCK
      ?auto_160833 - BLOCK
      ?auto_160835 - BLOCK
      ?auto_160837 - BLOCK
      ?auto_160836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160834 ?auto_160831 ) ( ON-TABLE ?auto_160830 ) ( ON ?auto_160831 ?auto_160830 ) ( not ( = ?auto_160830 ?auto_160831 ) ) ( not ( = ?auto_160830 ?auto_160834 ) ) ( not ( = ?auto_160831 ?auto_160834 ) ) ( not ( = ?auto_160830 ?auto_160832 ) ) ( not ( = ?auto_160830 ?auto_160833 ) ) ( not ( = ?auto_160831 ?auto_160832 ) ) ( not ( = ?auto_160831 ?auto_160833 ) ) ( not ( = ?auto_160834 ?auto_160832 ) ) ( not ( = ?auto_160834 ?auto_160833 ) ) ( not ( = ?auto_160832 ?auto_160833 ) ) ( ON ?auto_160832 ?auto_160834 ) ( CLEAR ?auto_160832 ) ( HOLDING ?auto_160833 ) ( CLEAR ?auto_160835 ) ( ON-TABLE ?auto_160837 ) ( ON ?auto_160836 ?auto_160837 ) ( ON ?auto_160835 ?auto_160836 ) ( not ( = ?auto_160837 ?auto_160836 ) ) ( not ( = ?auto_160837 ?auto_160835 ) ) ( not ( = ?auto_160837 ?auto_160833 ) ) ( not ( = ?auto_160836 ?auto_160835 ) ) ( not ( = ?auto_160836 ?auto_160833 ) ) ( not ( = ?auto_160835 ?auto_160833 ) ) ( not ( = ?auto_160830 ?auto_160835 ) ) ( not ( = ?auto_160830 ?auto_160837 ) ) ( not ( = ?auto_160830 ?auto_160836 ) ) ( not ( = ?auto_160831 ?auto_160835 ) ) ( not ( = ?auto_160831 ?auto_160837 ) ) ( not ( = ?auto_160831 ?auto_160836 ) ) ( not ( = ?auto_160834 ?auto_160835 ) ) ( not ( = ?auto_160834 ?auto_160837 ) ) ( not ( = ?auto_160834 ?auto_160836 ) ) ( not ( = ?auto_160832 ?auto_160835 ) ) ( not ( = ?auto_160832 ?auto_160837 ) ) ( not ( = ?auto_160832 ?auto_160836 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_160837 ?auto_160836 ?auto_160835 ?auto_160833 )
      ( MAKE-2PILE ?auto_160830 ?auto_160831 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_160838 - BLOCK
      ?auto_160839 - BLOCK
    )
    :vars
    (
      ?auto_160844 - BLOCK
      ?auto_160842 - BLOCK
      ?auto_160841 - BLOCK
      ?auto_160840 - BLOCK
      ?auto_160845 - BLOCK
      ?auto_160843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160844 ?auto_160839 ) ( ON-TABLE ?auto_160838 ) ( ON ?auto_160839 ?auto_160838 ) ( not ( = ?auto_160838 ?auto_160839 ) ) ( not ( = ?auto_160838 ?auto_160844 ) ) ( not ( = ?auto_160839 ?auto_160844 ) ) ( not ( = ?auto_160838 ?auto_160842 ) ) ( not ( = ?auto_160838 ?auto_160841 ) ) ( not ( = ?auto_160839 ?auto_160842 ) ) ( not ( = ?auto_160839 ?auto_160841 ) ) ( not ( = ?auto_160844 ?auto_160842 ) ) ( not ( = ?auto_160844 ?auto_160841 ) ) ( not ( = ?auto_160842 ?auto_160841 ) ) ( ON ?auto_160842 ?auto_160844 ) ( CLEAR ?auto_160840 ) ( ON-TABLE ?auto_160845 ) ( ON ?auto_160843 ?auto_160845 ) ( ON ?auto_160840 ?auto_160843 ) ( not ( = ?auto_160845 ?auto_160843 ) ) ( not ( = ?auto_160845 ?auto_160840 ) ) ( not ( = ?auto_160845 ?auto_160841 ) ) ( not ( = ?auto_160843 ?auto_160840 ) ) ( not ( = ?auto_160843 ?auto_160841 ) ) ( not ( = ?auto_160840 ?auto_160841 ) ) ( not ( = ?auto_160838 ?auto_160840 ) ) ( not ( = ?auto_160838 ?auto_160845 ) ) ( not ( = ?auto_160838 ?auto_160843 ) ) ( not ( = ?auto_160839 ?auto_160840 ) ) ( not ( = ?auto_160839 ?auto_160845 ) ) ( not ( = ?auto_160839 ?auto_160843 ) ) ( not ( = ?auto_160844 ?auto_160840 ) ) ( not ( = ?auto_160844 ?auto_160845 ) ) ( not ( = ?auto_160844 ?auto_160843 ) ) ( not ( = ?auto_160842 ?auto_160840 ) ) ( not ( = ?auto_160842 ?auto_160845 ) ) ( not ( = ?auto_160842 ?auto_160843 ) ) ( ON ?auto_160841 ?auto_160842 ) ( CLEAR ?auto_160841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_160838 ?auto_160839 ?auto_160844 ?auto_160842 )
      ( MAKE-2PILE ?auto_160838 ?auto_160839 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_160846 - BLOCK
      ?auto_160847 - BLOCK
    )
    :vars
    (
      ?auto_160852 - BLOCK
      ?auto_160853 - BLOCK
      ?auto_160849 - BLOCK
      ?auto_160848 - BLOCK
      ?auto_160850 - BLOCK
      ?auto_160851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160852 ?auto_160847 ) ( ON-TABLE ?auto_160846 ) ( ON ?auto_160847 ?auto_160846 ) ( not ( = ?auto_160846 ?auto_160847 ) ) ( not ( = ?auto_160846 ?auto_160852 ) ) ( not ( = ?auto_160847 ?auto_160852 ) ) ( not ( = ?auto_160846 ?auto_160853 ) ) ( not ( = ?auto_160846 ?auto_160849 ) ) ( not ( = ?auto_160847 ?auto_160853 ) ) ( not ( = ?auto_160847 ?auto_160849 ) ) ( not ( = ?auto_160852 ?auto_160853 ) ) ( not ( = ?auto_160852 ?auto_160849 ) ) ( not ( = ?auto_160853 ?auto_160849 ) ) ( ON ?auto_160853 ?auto_160852 ) ( ON-TABLE ?auto_160848 ) ( ON ?auto_160850 ?auto_160848 ) ( not ( = ?auto_160848 ?auto_160850 ) ) ( not ( = ?auto_160848 ?auto_160851 ) ) ( not ( = ?auto_160848 ?auto_160849 ) ) ( not ( = ?auto_160850 ?auto_160851 ) ) ( not ( = ?auto_160850 ?auto_160849 ) ) ( not ( = ?auto_160851 ?auto_160849 ) ) ( not ( = ?auto_160846 ?auto_160851 ) ) ( not ( = ?auto_160846 ?auto_160848 ) ) ( not ( = ?auto_160846 ?auto_160850 ) ) ( not ( = ?auto_160847 ?auto_160851 ) ) ( not ( = ?auto_160847 ?auto_160848 ) ) ( not ( = ?auto_160847 ?auto_160850 ) ) ( not ( = ?auto_160852 ?auto_160851 ) ) ( not ( = ?auto_160852 ?auto_160848 ) ) ( not ( = ?auto_160852 ?auto_160850 ) ) ( not ( = ?auto_160853 ?auto_160851 ) ) ( not ( = ?auto_160853 ?auto_160848 ) ) ( not ( = ?auto_160853 ?auto_160850 ) ) ( ON ?auto_160849 ?auto_160853 ) ( CLEAR ?auto_160849 ) ( HOLDING ?auto_160851 ) ( CLEAR ?auto_160850 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_160848 ?auto_160850 ?auto_160851 )
      ( MAKE-2PILE ?auto_160846 ?auto_160847 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_160854 - BLOCK
      ?auto_160855 - BLOCK
    )
    :vars
    (
      ?auto_160859 - BLOCK
      ?auto_160858 - BLOCK
      ?auto_160860 - BLOCK
      ?auto_160861 - BLOCK
      ?auto_160856 - BLOCK
      ?auto_160857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160859 ?auto_160855 ) ( ON-TABLE ?auto_160854 ) ( ON ?auto_160855 ?auto_160854 ) ( not ( = ?auto_160854 ?auto_160855 ) ) ( not ( = ?auto_160854 ?auto_160859 ) ) ( not ( = ?auto_160855 ?auto_160859 ) ) ( not ( = ?auto_160854 ?auto_160858 ) ) ( not ( = ?auto_160854 ?auto_160860 ) ) ( not ( = ?auto_160855 ?auto_160858 ) ) ( not ( = ?auto_160855 ?auto_160860 ) ) ( not ( = ?auto_160859 ?auto_160858 ) ) ( not ( = ?auto_160859 ?auto_160860 ) ) ( not ( = ?auto_160858 ?auto_160860 ) ) ( ON ?auto_160858 ?auto_160859 ) ( ON-TABLE ?auto_160861 ) ( ON ?auto_160856 ?auto_160861 ) ( not ( = ?auto_160861 ?auto_160856 ) ) ( not ( = ?auto_160861 ?auto_160857 ) ) ( not ( = ?auto_160861 ?auto_160860 ) ) ( not ( = ?auto_160856 ?auto_160857 ) ) ( not ( = ?auto_160856 ?auto_160860 ) ) ( not ( = ?auto_160857 ?auto_160860 ) ) ( not ( = ?auto_160854 ?auto_160857 ) ) ( not ( = ?auto_160854 ?auto_160861 ) ) ( not ( = ?auto_160854 ?auto_160856 ) ) ( not ( = ?auto_160855 ?auto_160857 ) ) ( not ( = ?auto_160855 ?auto_160861 ) ) ( not ( = ?auto_160855 ?auto_160856 ) ) ( not ( = ?auto_160859 ?auto_160857 ) ) ( not ( = ?auto_160859 ?auto_160861 ) ) ( not ( = ?auto_160859 ?auto_160856 ) ) ( not ( = ?auto_160858 ?auto_160857 ) ) ( not ( = ?auto_160858 ?auto_160861 ) ) ( not ( = ?auto_160858 ?auto_160856 ) ) ( ON ?auto_160860 ?auto_160858 ) ( CLEAR ?auto_160856 ) ( ON ?auto_160857 ?auto_160860 ) ( CLEAR ?auto_160857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_160854 ?auto_160855 ?auto_160859 ?auto_160858 ?auto_160860 )
      ( MAKE-2PILE ?auto_160854 ?auto_160855 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_160862 - BLOCK
      ?auto_160863 - BLOCK
    )
    :vars
    (
      ?auto_160866 - BLOCK
      ?auto_160864 - BLOCK
      ?auto_160868 - BLOCK
      ?auto_160869 - BLOCK
      ?auto_160867 - BLOCK
      ?auto_160865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160866 ?auto_160863 ) ( ON-TABLE ?auto_160862 ) ( ON ?auto_160863 ?auto_160862 ) ( not ( = ?auto_160862 ?auto_160863 ) ) ( not ( = ?auto_160862 ?auto_160866 ) ) ( not ( = ?auto_160863 ?auto_160866 ) ) ( not ( = ?auto_160862 ?auto_160864 ) ) ( not ( = ?auto_160862 ?auto_160868 ) ) ( not ( = ?auto_160863 ?auto_160864 ) ) ( not ( = ?auto_160863 ?auto_160868 ) ) ( not ( = ?auto_160866 ?auto_160864 ) ) ( not ( = ?auto_160866 ?auto_160868 ) ) ( not ( = ?auto_160864 ?auto_160868 ) ) ( ON ?auto_160864 ?auto_160866 ) ( ON-TABLE ?auto_160869 ) ( not ( = ?auto_160869 ?auto_160867 ) ) ( not ( = ?auto_160869 ?auto_160865 ) ) ( not ( = ?auto_160869 ?auto_160868 ) ) ( not ( = ?auto_160867 ?auto_160865 ) ) ( not ( = ?auto_160867 ?auto_160868 ) ) ( not ( = ?auto_160865 ?auto_160868 ) ) ( not ( = ?auto_160862 ?auto_160865 ) ) ( not ( = ?auto_160862 ?auto_160869 ) ) ( not ( = ?auto_160862 ?auto_160867 ) ) ( not ( = ?auto_160863 ?auto_160865 ) ) ( not ( = ?auto_160863 ?auto_160869 ) ) ( not ( = ?auto_160863 ?auto_160867 ) ) ( not ( = ?auto_160866 ?auto_160865 ) ) ( not ( = ?auto_160866 ?auto_160869 ) ) ( not ( = ?auto_160866 ?auto_160867 ) ) ( not ( = ?auto_160864 ?auto_160865 ) ) ( not ( = ?auto_160864 ?auto_160869 ) ) ( not ( = ?auto_160864 ?auto_160867 ) ) ( ON ?auto_160868 ?auto_160864 ) ( ON ?auto_160865 ?auto_160868 ) ( CLEAR ?auto_160865 ) ( HOLDING ?auto_160867 ) ( CLEAR ?auto_160869 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160869 ?auto_160867 )
      ( MAKE-2PILE ?auto_160862 ?auto_160863 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_160870 - BLOCK
      ?auto_160871 - BLOCK
    )
    :vars
    (
      ?auto_160872 - BLOCK
      ?auto_160875 - BLOCK
      ?auto_160874 - BLOCK
      ?auto_160873 - BLOCK
      ?auto_160876 - BLOCK
      ?auto_160877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160872 ?auto_160871 ) ( ON-TABLE ?auto_160870 ) ( ON ?auto_160871 ?auto_160870 ) ( not ( = ?auto_160870 ?auto_160871 ) ) ( not ( = ?auto_160870 ?auto_160872 ) ) ( not ( = ?auto_160871 ?auto_160872 ) ) ( not ( = ?auto_160870 ?auto_160875 ) ) ( not ( = ?auto_160870 ?auto_160874 ) ) ( not ( = ?auto_160871 ?auto_160875 ) ) ( not ( = ?auto_160871 ?auto_160874 ) ) ( not ( = ?auto_160872 ?auto_160875 ) ) ( not ( = ?auto_160872 ?auto_160874 ) ) ( not ( = ?auto_160875 ?auto_160874 ) ) ( ON ?auto_160875 ?auto_160872 ) ( ON-TABLE ?auto_160873 ) ( not ( = ?auto_160873 ?auto_160876 ) ) ( not ( = ?auto_160873 ?auto_160877 ) ) ( not ( = ?auto_160873 ?auto_160874 ) ) ( not ( = ?auto_160876 ?auto_160877 ) ) ( not ( = ?auto_160876 ?auto_160874 ) ) ( not ( = ?auto_160877 ?auto_160874 ) ) ( not ( = ?auto_160870 ?auto_160877 ) ) ( not ( = ?auto_160870 ?auto_160873 ) ) ( not ( = ?auto_160870 ?auto_160876 ) ) ( not ( = ?auto_160871 ?auto_160877 ) ) ( not ( = ?auto_160871 ?auto_160873 ) ) ( not ( = ?auto_160871 ?auto_160876 ) ) ( not ( = ?auto_160872 ?auto_160877 ) ) ( not ( = ?auto_160872 ?auto_160873 ) ) ( not ( = ?auto_160872 ?auto_160876 ) ) ( not ( = ?auto_160875 ?auto_160877 ) ) ( not ( = ?auto_160875 ?auto_160873 ) ) ( not ( = ?auto_160875 ?auto_160876 ) ) ( ON ?auto_160874 ?auto_160875 ) ( ON ?auto_160877 ?auto_160874 ) ( CLEAR ?auto_160873 ) ( ON ?auto_160876 ?auto_160877 ) ( CLEAR ?auto_160876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160870 ?auto_160871 ?auto_160872 ?auto_160875 ?auto_160874 ?auto_160877 )
      ( MAKE-2PILE ?auto_160870 ?auto_160871 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_160878 - BLOCK
      ?auto_160879 - BLOCK
    )
    :vars
    (
      ?auto_160883 - BLOCK
      ?auto_160882 - BLOCK
      ?auto_160884 - BLOCK
      ?auto_160885 - BLOCK
      ?auto_160880 - BLOCK
      ?auto_160881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160883 ?auto_160879 ) ( ON-TABLE ?auto_160878 ) ( ON ?auto_160879 ?auto_160878 ) ( not ( = ?auto_160878 ?auto_160879 ) ) ( not ( = ?auto_160878 ?auto_160883 ) ) ( not ( = ?auto_160879 ?auto_160883 ) ) ( not ( = ?auto_160878 ?auto_160882 ) ) ( not ( = ?auto_160878 ?auto_160884 ) ) ( not ( = ?auto_160879 ?auto_160882 ) ) ( not ( = ?auto_160879 ?auto_160884 ) ) ( not ( = ?auto_160883 ?auto_160882 ) ) ( not ( = ?auto_160883 ?auto_160884 ) ) ( not ( = ?auto_160882 ?auto_160884 ) ) ( ON ?auto_160882 ?auto_160883 ) ( not ( = ?auto_160885 ?auto_160880 ) ) ( not ( = ?auto_160885 ?auto_160881 ) ) ( not ( = ?auto_160885 ?auto_160884 ) ) ( not ( = ?auto_160880 ?auto_160881 ) ) ( not ( = ?auto_160880 ?auto_160884 ) ) ( not ( = ?auto_160881 ?auto_160884 ) ) ( not ( = ?auto_160878 ?auto_160881 ) ) ( not ( = ?auto_160878 ?auto_160885 ) ) ( not ( = ?auto_160878 ?auto_160880 ) ) ( not ( = ?auto_160879 ?auto_160881 ) ) ( not ( = ?auto_160879 ?auto_160885 ) ) ( not ( = ?auto_160879 ?auto_160880 ) ) ( not ( = ?auto_160883 ?auto_160881 ) ) ( not ( = ?auto_160883 ?auto_160885 ) ) ( not ( = ?auto_160883 ?auto_160880 ) ) ( not ( = ?auto_160882 ?auto_160881 ) ) ( not ( = ?auto_160882 ?auto_160885 ) ) ( not ( = ?auto_160882 ?auto_160880 ) ) ( ON ?auto_160884 ?auto_160882 ) ( ON ?auto_160881 ?auto_160884 ) ( ON ?auto_160880 ?auto_160881 ) ( CLEAR ?auto_160880 ) ( HOLDING ?auto_160885 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_160885 )
      ( MAKE-2PILE ?auto_160878 ?auto_160879 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_160896 - BLOCK
      ?auto_160897 - BLOCK
    )
    :vars
    (
      ?auto_160902 - BLOCK
      ?auto_160899 - BLOCK
      ?auto_160898 - BLOCK
      ?auto_160901 - BLOCK
      ?auto_160903 - BLOCK
      ?auto_160900 - BLOCK
      ?auto_160904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160902 ?auto_160897 ) ( ON-TABLE ?auto_160896 ) ( ON ?auto_160897 ?auto_160896 ) ( not ( = ?auto_160896 ?auto_160897 ) ) ( not ( = ?auto_160896 ?auto_160902 ) ) ( not ( = ?auto_160897 ?auto_160902 ) ) ( not ( = ?auto_160896 ?auto_160899 ) ) ( not ( = ?auto_160896 ?auto_160898 ) ) ( not ( = ?auto_160897 ?auto_160899 ) ) ( not ( = ?auto_160897 ?auto_160898 ) ) ( not ( = ?auto_160902 ?auto_160899 ) ) ( not ( = ?auto_160902 ?auto_160898 ) ) ( not ( = ?auto_160899 ?auto_160898 ) ) ( ON ?auto_160899 ?auto_160902 ) ( not ( = ?auto_160901 ?auto_160903 ) ) ( not ( = ?auto_160901 ?auto_160900 ) ) ( not ( = ?auto_160901 ?auto_160898 ) ) ( not ( = ?auto_160903 ?auto_160900 ) ) ( not ( = ?auto_160903 ?auto_160898 ) ) ( not ( = ?auto_160900 ?auto_160898 ) ) ( not ( = ?auto_160896 ?auto_160900 ) ) ( not ( = ?auto_160896 ?auto_160901 ) ) ( not ( = ?auto_160896 ?auto_160903 ) ) ( not ( = ?auto_160897 ?auto_160900 ) ) ( not ( = ?auto_160897 ?auto_160901 ) ) ( not ( = ?auto_160897 ?auto_160903 ) ) ( not ( = ?auto_160902 ?auto_160900 ) ) ( not ( = ?auto_160902 ?auto_160901 ) ) ( not ( = ?auto_160902 ?auto_160903 ) ) ( not ( = ?auto_160899 ?auto_160900 ) ) ( not ( = ?auto_160899 ?auto_160901 ) ) ( not ( = ?auto_160899 ?auto_160903 ) ) ( ON ?auto_160898 ?auto_160899 ) ( ON ?auto_160900 ?auto_160898 ) ( ON ?auto_160903 ?auto_160900 ) ( CLEAR ?auto_160903 ) ( ON ?auto_160901 ?auto_160904 ) ( CLEAR ?auto_160901 ) ( HAND-EMPTY ) ( not ( = ?auto_160896 ?auto_160904 ) ) ( not ( = ?auto_160897 ?auto_160904 ) ) ( not ( = ?auto_160902 ?auto_160904 ) ) ( not ( = ?auto_160899 ?auto_160904 ) ) ( not ( = ?auto_160898 ?auto_160904 ) ) ( not ( = ?auto_160901 ?auto_160904 ) ) ( not ( = ?auto_160903 ?auto_160904 ) ) ( not ( = ?auto_160900 ?auto_160904 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_160901 ?auto_160904 )
      ( MAKE-2PILE ?auto_160896 ?auto_160897 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_160905 - BLOCK
      ?auto_160906 - BLOCK
    )
    :vars
    (
      ?auto_160913 - BLOCK
      ?auto_160909 - BLOCK
      ?auto_160908 - BLOCK
      ?auto_160910 - BLOCK
      ?auto_160912 - BLOCK
      ?auto_160907 - BLOCK
      ?auto_160911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160913 ?auto_160906 ) ( ON-TABLE ?auto_160905 ) ( ON ?auto_160906 ?auto_160905 ) ( not ( = ?auto_160905 ?auto_160906 ) ) ( not ( = ?auto_160905 ?auto_160913 ) ) ( not ( = ?auto_160906 ?auto_160913 ) ) ( not ( = ?auto_160905 ?auto_160909 ) ) ( not ( = ?auto_160905 ?auto_160908 ) ) ( not ( = ?auto_160906 ?auto_160909 ) ) ( not ( = ?auto_160906 ?auto_160908 ) ) ( not ( = ?auto_160913 ?auto_160909 ) ) ( not ( = ?auto_160913 ?auto_160908 ) ) ( not ( = ?auto_160909 ?auto_160908 ) ) ( ON ?auto_160909 ?auto_160913 ) ( not ( = ?auto_160910 ?auto_160912 ) ) ( not ( = ?auto_160910 ?auto_160907 ) ) ( not ( = ?auto_160910 ?auto_160908 ) ) ( not ( = ?auto_160912 ?auto_160907 ) ) ( not ( = ?auto_160912 ?auto_160908 ) ) ( not ( = ?auto_160907 ?auto_160908 ) ) ( not ( = ?auto_160905 ?auto_160907 ) ) ( not ( = ?auto_160905 ?auto_160910 ) ) ( not ( = ?auto_160905 ?auto_160912 ) ) ( not ( = ?auto_160906 ?auto_160907 ) ) ( not ( = ?auto_160906 ?auto_160910 ) ) ( not ( = ?auto_160906 ?auto_160912 ) ) ( not ( = ?auto_160913 ?auto_160907 ) ) ( not ( = ?auto_160913 ?auto_160910 ) ) ( not ( = ?auto_160913 ?auto_160912 ) ) ( not ( = ?auto_160909 ?auto_160907 ) ) ( not ( = ?auto_160909 ?auto_160910 ) ) ( not ( = ?auto_160909 ?auto_160912 ) ) ( ON ?auto_160908 ?auto_160909 ) ( ON ?auto_160907 ?auto_160908 ) ( ON ?auto_160910 ?auto_160911 ) ( CLEAR ?auto_160910 ) ( not ( = ?auto_160905 ?auto_160911 ) ) ( not ( = ?auto_160906 ?auto_160911 ) ) ( not ( = ?auto_160913 ?auto_160911 ) ) ( not ( = ?auto_160909 ?auto_160911 ) ) ( not ( = ?auto_160908 ?auto_160911 ) ) ( not ( = ?auto_160910 ?auto_160911 ) ) ( not ( = ?auto_160912 ?auto_160911 ) ) ( not ( = ?auto_160907 ?auto_160911 ) ) ( HOLDING ?auto_160912 ) ( CLEAR ?auto_160907 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160905 ?auto_160906 ?auto_160913 ?auto_160909 ?auto_160908 ?auto_160907 ?auto_160912 )
      ( MAKE-2PILE ?auto_160905 ?auto_160906 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_160914 - BLOCK
      ?auto_160915 - BLOCK
    )
    :vars
    (
      ?auto_160921 - BLOCK
      ?auto_160917 - BLOCK
      ?auto_160916 - BLOCK
      ?auto_160918 - BLOCK
      ?auto_160920 - BLOCK
      ?auto_160922 - BLOCK
      ?auto_160919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160921 ?auto_160915 ) ( ON-TABLE ?auto_160914 ) ( ON ?auto_160915 ?auto_160914 ) ( not ( = ?auto_160914 ?auto_160915 ) ) ( not ( = ?auto_160914 ?auto_160921 ) ) ( not ( = ?auto_160915 ?auto_160921 ) ) ( not ( = ?auto_160914 ?auto_160917 ) ) ( not ( = ?auto_160914 ?auto_160916 ) ) ( not ( = ?auto_160915 ?auto_160917 ) ) ( not ( = ?auto_160915 ?auto_160916 ) ) ( not ( = ?auto_160921 ?auto_160917 ) ) ( not ( = ?auto_160921 ?auto_160916 ) ) ( not ( = ?auto_160917 ?auto_160916 ) ) ( ON ?auto_160917 ?auto_160921 ) ( not ( = ?auto_160918 ?auto_160920 ) ) ( not ( = ?auto_160918 ?auto_160922 ) ) ( not ( = ?auto_160918 ?auto_160916 ) ) ( not ( = ?auto_160920 ?auto_160922 ) ) ( not ( = ?auto_160920 ?auto_160916 ) ) ( not ( = ?auto_160922 ?auto_160916 ) ) ( not ( = ?auto_160914 ?auto_160922 ) ) ( not ( = ?auto_160914 ?auto_160918 ) ) ( not ( = ?auto_160914 ?auto_160920 ) ) ( not ( = ?auto_160915 ?auto_160922 ) ) ( not ( = ?auto_160915 ?auto_160918 ) ) ( not ( = ?auto_160915 ?auto_160920 ) ) ( not ( = ?auto_160921 ?auto_160922 ) ) ( not ( = ?auto_160921 ?auto_160918 ) ) ( not ( = ?auto_160921 ?auto_160920 ) ) ( not ( = ?auto_160917 ?auto_160922 ) ) ( not ( = ?auto_160917 ?auto_160918 ) ) ( not ( = ?auto_160917 ?auto_160920 ) ) ( ON ?auto_160916 ?auto_160917 ) ( ON ?auto_160922 ?auto_160916 ) ( ON ?auto_160918 ?auto_160919 ) ( not ( = ?auto_160914 ?auto_160919 ) ) ( not ( = ?auto_160915 ?auto_160919 ) ) ( not ( = ?auto_160921 ?auto_160919 ) ) ( not ( = ?auto_160917 ?auto_160919 ) ) ( not ( = ?auto_160916 ?auto_160919 ) ) ( not ( = ?auto_160918 ?auto_160919 ) ) ( not ( = ?auto_160920 ?auto_160919 ) ) ( not ( = ?auto_160922 ?auto_160919 ) ) ( CLEAR ?auto_160922 ) ( ON ?auto_160920 ?auto_160918 ) ( CLEAR ?auto_160920 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_160919 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160919 ?auto_160918 )
      ( MAKE-2PILE ?auto_160914 ?auto_160915 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_160923 - BLOCK
      ?auto_160924 - BLOCK
    )
    :vars
    (
      ?auto_160929 - BLOCK
      ?auto_160928 - BLOCK
      ?auto_160931 - BLOCK
      ?auto_160926 - BLOCK
      ?auto_160930 - BLOCK
      ?auto_160925 - BLOCK
      ?auto_160927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160929 ?auto_160924 ) ( ON-TABLE ?auto_160923 ) ( ON ?auto_160924 ?auto_160923 ) ( not ( = ?auto_160923 ?auto_160924 ) ) ( not ( = ?auto_160923 ?auto_160929 ) ) ( not ( = ?auto_160924 ?auto_160929 ) ) ( not ( = ?auto_160923 ?auto_160928 ) ) ( not ( = ?auto_160923 ?auto_160931 ) ) ( not ( = ?auto_160924 ?auto_160928 ) ) ( not ( = ?auto_160924 ?auto_160931 ) ) ( not ( = ?auto_160929 ?auto_160928 ) ) ( not ( = ?auto_160929 ?auto_160931 ) ) ( not ( = ?auto_160928 ?auto_160931 ) ) ( ON ?auto_160928 ?auto_160929 ) ( not ( = ?auto_160926 ?auto_160930 ) ) ( not ( = ?auto_160926 ?auto_160925 ) ) ( not ( = ?auto_160926 ?auto_160931 ) ) ( not ( = ?auto_160930 ?auto_160925 ) ) ( not ( = ?auto_160930 ?auto_160931 ) ) ( not ( = ?auto_160925 ?auto_160931 ) ) ( not ( = ?auto_160923 ?auto_160925 ) ) ( not ( = ?auto_160923 ?auto_160926 ) ) ( not ( = ?auto_160923 ?auto_160930 ) ) ( not ( = ?auto_160924 ?auto_160925 ) ) ( not ( = ?auto_160924 ?auto_160926 ) ) ( not ( = ?auto_160924 ?auto_160930 ) ) ( not ( = ?auto_160929 ?auto_160925 ) ) ( not ( = ?auto_160929 ?auto_160926 ) ) ( not ( = ?auto_160929 ?auto_160930 ) ) ( not ( = ?auto_160928 ?auto_160925 ) ) ( not ( = ?auto_160928 ?auto_160926 ) ) ( not ( = ?auto_160928 ?auto_160930 ) ) ( ON ?auto_160931 ?auto_160928 ) ( ON ?auto_160926 ?auto_160927 ) ( not ( = ?auto_160923 ?auto_160927 ) ) ( not ( = ?auto_160924 ?auto_160927 ) ) ( not ( = ?auto_160929 ?auto_160927 ) ) ( not ( = ?auto_160928 ?auto_160927 ) ) ( not ( = ?auto_160931 ?auto_160927 ) ) ( not ( = ?auto_160926 ?auto_160927 ) ) ( not ( = ?auto_160930 ?auto_160927 ) ) ( not ( = ?auto_160925 ?auto_160927 ) ) ( ON ?auto_160930 ?auto_160926 ) ( CLEAR ?auto_160930 ) ( ON-TABLE ?auto_160927 ) ( HOLDING ?auto_160925 ) ( CLEAR ?auto_160931 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160923 ?auto_160924 ?auto_160929 ?auto_160928 ?auto_160931 ?auto_160925 )
      ( MAKE-2PILE ?auto_160923 ?auto_160924 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_160932 - BLOCK
      ?auto_160933 - BLOCK
    )
    :vars
    (
      ?auto_160936 - BLOCK
      ?auto_160939 - BLOCK
      ?auto_160935 - BLOCK
      ?auto_160940 - BLOCK
      ?auto_160938 - BLOCK
      ?auto_160934 - BLOCK
      ?auto_160937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160936 ?auto_160933 ) ( ON-TABLE ?auto_160932 ) ( ON ?auto_160933 ?auto_160932 ) ( not ( = ?auto_160932 ?auto_160933 ) ) ( not ( = ?auto_160932 ?auto_160936 ) ) ( not ( = ?auto_160933 ?auto_160936 ) ) ( not ( = ?auto_160932 ?auto_160939 ) ) ( not ( = ?auto_160932 ?auto_160935 ) ) ( not ( = ?auto_160933 ?auto_160939 ) ) ( not ( = ?auto_160933 ?auto_160935 ) ) ( not ( = ?auto_160936 ?auto_160939 ) ) ( not ( = ?auto_160936 ?auto_160935 ) ) ( not ( = ?auto_160939 ?auto_160935 ) ) ( ON ?auto_160939 ?auto_160936 ) ( not ( = ?auto_160940 ?auto_160938 ) ) ( not ( = ?auto_160940 ?auto_160934 ) ) ( not ( = ?auto_160940 ?auto_160935 ) ) ( not ( = ?auto_160938 ?auto_160934 ) ) ( not ( = ?auto_160938 ?auto_160935 ) ) ( not ( = ?auto_160934 ?auto_160935 ) ) ( not ( = ?auto_160932 ?auto_160934 ) ) ( not ( = ?auto_160932 ?auto_160940 ) ) ( not ( = ?auto_160932 ?auto_160938 ) ) ( not ( = ?auto_160933 ?auto_160934 ) ) ( not ( = ?auto_160933 ?auto_160940 ) ) ( not ( = ?auto_160933 ?auto_160938 ) ) ( not ( = ?auto_160936 ?auto_160934 ) ) ( not ( = ?auto_160936 ?auto_160940 ) ) ( not ( = ?auto_160936 ?auto_160938 ) ) ( not ( = ?auto_160939 ?auto_160934 ) ) ( not ( = ?auto_160939 ?auto_160940 ) ) ( not ( = ?auto_160939 ?auto_160938 ) ) ( ON ?auto_160935 ?auto_160939 ) ( ON ?auto_160940 ?auto_160937 ) ( not ( = ?auto_160932 ?auto_160937 ) ) ( not ( = ?auto_160933 ?auto_160937 ) ) ( not ( = ?auto_160936 ?auto_160937 ) ) ( not ( = ?auto_160939 ?auto_160937 ) ) ( not ( = ?auto_160935 ?auto_160937 ) ) ( not ( = ?auto_160940 ?auto_160937 ) ) ( not ( = ?auto_160938 ?auto_160937 ) ) ( not ( = ?auto_160934 ?auto_160937 ) ) ( ON ?auto_160938 ?auto_160940 ) ( ON-TABLE ?auto_160937 ) ( CLEAR ?auto_160935 ) ( ON ?auto_160934 ?auto_160938 ) ( CLEAR ?auto_160934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_160937 ?auto_160940 ?auto_160938 )
      ( MAKE-2PILE ?auto_160932 ?auto_160933 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_160990 - BLOCK
      ?auto_160991 - BLOCK
      ?auto_160992 - BLOCK
      ?auto_160993 - BLOCK
      ?auto_160994 - BLOCK
      ?auto_160995 - BLOCK
    )
    :vars
    (
      ?auto_160996 - BLOCK
      ?auto_160997 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160990 ) ( ON ?auto_160991 ?auto_160990 ) ( ON ?auto_160992 ?auto_160991 ) ( ON ?auto_160993 ?auto_160992 ) ( not ( = ?auto_160990 ?auto_160991 ) ) ( not ( = ?auto_160990 ?auto_160992 ) ) ( not ( = ?auto_160990 ?auto_160993 ) ) ( not ( = ?auto_160990 ?auto_160994 ) ) ( not ( = ?auto_160990 ?auto_160995 ) ) ( not ( = ?auto_160991 ?auto_160992 ) ) ( not ( = ?auto_160991 ?auto_160993 ) ) ( not ( = ?auto_160991 ?auto_160994 ) ) ( not ( = ?auto_160991 ?auto_160995 ) ) ( not ( = ?auto_160992 ?auto_160993 ) ) ( not ( = ?auto_160992 ?auto_160994 ) ) ( not ( = ?auto_160992 ?auto_160995 ) ) ( not ( = ?auto_160993 ?auto_160994 ) ) ( not ( = ?auto_160993 ?auto_160995 ) ) ( not ( = ?auto_160994 ?auto_160995 ) ) ( ON ?auto_160995 ?auto_160996 ) ( not ( = ?auto_160990 ?auto_160996 ) ) ( not ( = ?auto_160991 ?auto_160996 ) ) ( not ( = ?auto_160992 ?auto_160996 ) ) ( not ( = ?auto_160993 ?auto_160996 ) ) ( not ( = ?auto_160994 ?auto_160996 ) ) ( not ( = ?auto_160995 ?auto_160996 ) ) ( CLEAR ?auto_160993 ) ( ON ?auto_160994 ?auto_160995 ) ( CLEAR ?auto_160994 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_160997 ) ( ON ?auto_160996 ?auto_160997 ) ( not ( = ?auto_160997 ?auto_160996 ) ) ( not ( = ?auto_160997 ?auto_160995 ) ) ( not ( = ?auto_160997 ?auto_160994 ) ) ( not ( = ?auto_160990 ?auto_160997 ) ) ( not ( = ?auto_160991 ?auto_160997 ) ) ( not ( = ?auto_160992 ?auto_160997 ) ) ( not ( = ?auto_160993 ?auto_160997 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_160997 ?auto_160996 ?auto_160995 )
      ( MAKE-6PILE ?auto_160990 ?auto_160991 ?auto_160992 ?auto_160993 ?auto_160994 ?auto_160995 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_160998 - BLOCK
      ?auto_160999 - BLOCK
      ?auto_161000 - BLOCK
      ?auto_161001 - BLOCK
      ?auto_161002 - BLOCK
      ?auto_161003 - BLOCK
    )
    :vars
    (
      ?auto_161004 - BLOCK
      ?auto_161005 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160998 ) ( ON ?auto_160999 ?auto_160998 ) ( ON ?auto_161000 ?auto_160999 ) ( not ( = ?auto_160998 ?auto_160999 ) ) ( not ( = ?auto_160998 ?auto_161000 ) ) ( not ( = ?auto_160998 ?auto_161001 ) ) ( not ( = ?auto_160998 ?auto_161002 ) ) ( not ( = ?auto_160998 ?auto_161003 ) ) ( not ( = ?auto_160999 ?auto_161000 ) ) ( not ( = ?auto_160999 ?auto_161001 ) ) ( not ( = ?auto_160999 ?auto_161002 ) ) ( not ( = ?auto_160999 ?auto_161003 ) ) ( not ( = ?auto_161000 ?auto_161001 ) ) ( not ( = ?auto_161000 ?auto_161002 ) ) ( not ( = ?auto_161000 ?auto_161003 ) ) ( not ( = ?auto_161001 ?auto_161002 ) ) ( not ( = ?auto_161001 ?auto_161003 ) ) ( not ( = ?auto_161002 ?auto_161003 ) ) ( ON ?auto_161003 ?auto_161004 ) ( not ( = ?auto_160998 ?auto_161004 ) ) ( not ( = ?auto_160999 ?auto_161004 ) ) ( not ( = ?auto_161000 ?auto_161004 ) ) ( not ( = ?auto_161001 ?auto_161004 ) ) ( not ( = ?auto_161002 ?auto_161004 ) ) ( not ( = ?auto_161003 ?auto_161004 ) ) ( ON ?auto_161002 ?auto_161003 ) ( CLEAR ?auto_161002 ) ( ON-TABLE ?auto_161005 ) ( ON ?auto_161004 ?auto_161005 ) ( not ( = ?auto_161005 ?auto_161004 ) ) ( not ( = ?auto_161005 ?auto_161003 ) ) ( not ( = ?auto_161005 ?auto_161002 ) ) ( not ( = ?auto_160998 ?auto_161005 ) ) ( not ( = ?auto_160999 ?auto_161005 ) ) ( not ( = ?auto_161000 ?auto_161005 ) ) ( not ( = ?auto_161001 ?auto_161005 ) ) ( HOLDING ?auto_161001 ) ( CLEAR ?auto_161000 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_160998 ?auto_160999 ?auto_161000 ?auto_161001 )
      ( MAKE-6PILE ?auto_160998 ?auto_160999 ?auto_161000 ?auto_161001 ?auto_161002 ?auto_161003 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161006 - BLOCK
      ?auto_161007 - BLOCK
      ?auto_161008 - BLOCK
      ?auto_161009 - BLOCK
      ?auto_161010 - BLOCK
      ?auto_161011 - BLOCK
    )
    :vars
    (
      ?auto_161013 - BLOCK
      ?auto_161012 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161006 ) ( ON ?auto_161007 ?auto_161006 ) ( ON ?auto_161008 ?auto_161007 ) ( not ( = ?auto_161006 ?auto_161007 ) ) ( not ( = ?auto_161006 ?auto_161008 ) ) ( not ( = ?auto_161006 ?auto_161009 ) ) ( not ( = ?auto_161006 ?auto_161010 ) ) ( not ( = ?auto_161006 ?auto_161011 ) ) ( not ( = ?auto_161007 ?auto_161008 ) ) ( not ( = ?auto_161007 ?auto_161009 ) ) ( not ( = ?auto_161007 ?auto_161010 ) ) ( not ( = ?auto_161007 ?auto_161011 ) ) ( not ( = ?auto_161008 ?auto_161009 ) ) ( not ( = ?auto_161008 ?auto_161010 ) ) ( not ( = ?auto_161008 ?auto_161011 ) ) ( not ( = ?auto_161009 ?auto_161010 ) ) ( not ( = ?auto_161009 ?auto_161011 ) ) ( not ( = ?auto_161010 ?auto_161011 ) ) ( ON ?auto_161011 ?auto_161013 ) ( not ( = ?auto_161006 ?auto_161013 ) ) ( not ( = ?auto_161007 ?auto_161013 ) ) ( not ( = ?auto_161008 ?auto_161013 ) ) ( not ( = ?auto_161009 ?auto_161013 ) ) ( not ( = ?auto_161010 ?auto_161013 ) ) ( not ( = ?auto_161011 ?auto_161013 ) ) ( ON ?auto_161010 ?auto_161011 ) ( ON-TABLE ?auto_161012 ) ( ON ?auto_161013 ?auto_161012 ) ( not ( = ?auto_161012 ?auto_161013 ) ) ( not ( = ?auto_161012 ?auto_161011 ) ) ( not ( = ?auto_161012 ?auto_161010 ) ) ( not ( = ?auto_161006 ?auto_161012 ) ) ( not ( = ?auto_161007 ?auto_161012 ) ) ( not ( = ?auto_161008 ?auto_161012 ) ) ( not ( = ?auto_161009 ?auto_161012 ) ) ( CLEAR ?auto_161008 ) ( ON ?auto_161009 ?auto_161010 ) ( CLEAR ?auto_161009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161012 ?auto_161013 ?auto_161011 ?auto_161010 )
      ( MAKE-6PILE ?auto_161006 ?auto_161007 ?auto_161008 ?auto_161009 ?auto_161010 ?auto_161011 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161014 - BLOCK
      ?auto_161015 - BLOCK
      ?auto_161016 - BLOCK
      ?auto_161017 - BLOCK
      ?auto_161018 - BLOCK
      ?auto_161019 - BLOCK
    )
    :vars
    (
      ?auto_161020 - BLOCK
      ?auto_161021 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161014 ) ( ON ?auto_161015 ?auto_161014 ) ( not ( = ?auto_161014 ?auto_161015 ) ) ( not ( = ?auto_161014 ?auto_161016 ) ) ( not ( = ?auto_161014 ?auto_161017 ) ) ( not ( = ?auto_161014 ?auto_161018 ) ) ( not ( = ?auto_161014 ?auto_161019 ) ) ( not ( = ?auto_161015 ?auto_161016 ) ) ( not ( = ?auto_161015 ?auto_161017 ) ) ( not ( = ?auto_161015 ?auto_161018 ) ) ( not ( = ?auto_161015 ?auto_161019 ) ) ( not ( = ?auto_161016 ?auto_161017 ) ) ( not ( = ?auto_161016 ?auto_161018 ) ) ( not ( = ?auto_161016 ?auto_161019 ) ) ( not ( = ?auto_161017 ?auto_161018 ) ) ( not ( = ?auto_161017 ?auto_161019 ) ) ( not ( = ?auto_161018 ?auto_161019 ) ) ( ON ?auto_161019 ?auto_161020 ) ( not ( = ?auto_161014 ?auto_161020 ) ) ( not ( = ?auto_161015 ?auto_161020 ) ) ( not ( = ?auto_161016 ?auto_161020 ) ) ( not ( = ?auto_161017 ?auto_161020 ) ) ( not ( = ?auto_161018 ?auto_161020 ) ) ( not ( = ?auto_161019 ?auto_161020 ) ) ( ON ?auto_161018 ?auto_161019 ) ( ON-TABLE ?auto_161021 ) ( ON ?auto_161020 ?auto_161021 ) ( not ( = ?auto_161021 ?auto_161020 ) ) ( not ( = ?auto_161021 ?auto_161019 ) ) ( not ( = ?auto_161021 ?auto_161018 ) ) ( not ( = ?auto_161014 ?auto_161021 ) ) ( not ( = ?auto_161015 ?auto_161021 ) ) ( not ( = ?auto_161016 ?auto_161021 ) ) ( not ( = ?auto_161017 ?auto_161021 ) ) ( ON ?auto_161017 ?auto_161018 ) ( CLEAR ?auto_161017 ) ( HOLDING ?auto_161016 ) ( CLEAR ?auto_161015 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161014 ?auto_161015 ?auto_161016 )
      ( MAKE-6PILE ?auto_161014 ?auto_161015 ?auto_161016 ?auto_161017 ?auto_161018 ?auto_161019 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161022 - BLOCK
      ?auto_161023 - BLOCK
      ?auto_161024 - BLOCK
      ?auto_161025 - BLOCK
      ?auto_161026 - BLOCK
      ?auto_161027 - BLOCK
    )
    :vars
    (
      ?auto_161028 - BLOCK
      ?auto_161029 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161022 ) ( ON ?auto_161023 ?auto_161022 ) ( not ( = ?auto_161022 ?auto_161023 ) ) ( not ( = ?auto_161022 ?auto_161024 ) ) ( not ( = ?auto_161022 ?auto_161025 ) ) ( not ( = ?auto_161022 ?auto_161026 ) ) ( not ( = ?auto_161022 ?auto_161027 ) ) ( not ( = ?auto_161023 ?auto_161024 ) ) ( not ( = ?auto_161023 ?auto_161025 ) ) ( not ( = ?auto_161023 ?auto_161026 ) ) ( not ( = ?auto_161023 ?auto_161027 ) ) ( not ( = ?auto_161024 ?auto_161025 ) ) ( not ( = ?auto_161024 ?auto_161026 ) ) ( not ( = ?auto_161024 ?auto_161027 ) ) ( not ( = ?auto_161025 ?auto_161026 ) ) ( not ( = ?auto_161025 ?auto_161027 ) ) ( not ( = ?auto_161026 ?auto_161027 ) ) ( ON ?auto_161027 ?auto_161028 ) ( not ( = ?auto_161022 ?auto_161028 ) ) ( not ( = ?auto_161023 ?auto_161028 ) ) ( not ( = ?auto_161024 ?auto_161028 ) ) ( not ( = ?auto_161025 ?auto_161028 ) ) ( not ( = ?auto_161026 ?auto_161028 ) ) ( not ( = ?auto_161027 ?auto_161028 ) ) ( ON ?auto_161026 ?auto_161027 ) ( ON-TABLE ?auto_161029 ) ( ON ?auto_161028 ?auto_161029 ) ( not ( = ?auto_161029 ?auto_161028 ) ) ( not ( = ?auto_161029 ?auto_161027 ) ) ( not ( = ?auto_161029 ?auto_161026 ) ) ( not ( = ?auto_161022 ?auto_161029 ) ) ( not ( = ?auto_161023 ?auto_161029 ) ) ( not ( = ?auto_161024 ?auto_161029 ) ) ( not ( = ?auto_161025 ?auto_161029 ) ) ( ON ?auto_161025 ?auto_161026 ) ( CLEAR ?auto_161023 ) ( ON ?auto_161024 ?auto_161025 ) ( CLEAR ?auto_161024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161029 ?auto_161028 ?auto_161027 ?auto_161026 ?auto_161025 )
      ( MAKE-6PILE ?auto_161022 ?auto_161023 ?auto_161024 ?auto_161025 ?auto_161026 ?auto_161027 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161030 - BLOCK
      ?auto_161031 - BLOCK
      ?auto_161032 - BLOCK
      ?auto_161033 - BLOCK
      ?auto_161034 - BLOCK
      ?auto_161035 - BLOCK
    )
    :vars
    (
      ?auto_161037 - BLOCK
      ?auto_161036 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161030 ) ( not ( = ?auto_161030 ?auto_161031 ) ) ( not ( = ?auto_161030 ?auto_161032 ) ) ( not ( = ?auto_161030 ?auto_161033 ) ) ( not ( = ?auto_161030 ?auto_161034 ) ) ( not ( = ?auto_161030 ?auto_161035 ) ) ( not ( = ?auto_161031 ?auto_161032 ) ) ( not ( = ?auto_161031 ?auto_161033 ) ) ( not ( = ?auto_161031 ?auto_161034 ) ) ( not ( = ?auto_161031 ?auto_161035 ) ) ( not ( = ?auto_161032 ?auto_161033 ) ) ( not ( = ?auto_161032 ?auto_161034 ) ) ( not ( = ?auto_161032 ?auto_161035 ) ) ( not ( = ?auto_161033 ?auto_161034 ) ) ( not ( = ?auto_161033 ?auto_161035 ) ) ( not ( = ?auto_161034 ?auto_161035 ) ) ( ON ?auto_161035 ?auto_161037 ) ( not ( = ?auto_161030 ?auto_161037 ) ) ( not ( = ?auto_161031 ?auto_161037 ) ) ( not ( = ?auto_161032 ?auto_161037 ) ) ( not ( = ?auto_161033 ?auto_161037 ) ) ( not ( = ?auto_161034 ?auto_161037 ) ) ( not ( = ?auto_161035 ?auto_161037 ) ) ( ON ?auto_161034 ?auto_161035 ) ( ON-TABLE ?auto_161036 ) ( ON ?auto_161037 ?auto_161036 ) ( not ( = ?auto_161036 ?auto_161037 ) ) ( not ( = ?auto_161036 ?auto_161035 ) ) ( not ( = ?auto_161036 ?auto_161034 ) ) ( not ( = ?auto_161030 ?auto_161036 ) ) ( not ( = ?auto_161031 ?auto_161036 ) ) ( not ( = ?auto_161032 ?auto_161036 ) ) ( not ( = ?auto_161033 ?auto_161036 ) ) ( ON ?auto_161033 ?auto_161034 ) ( ON ?auto_161032 ?auto_161033 ) ( CLEAR ?auto_161032 ) ( HOLDING ?auto_161031 ) ( CLEAR ?auto_161030 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161030 ?auto_161031 )
      ( MAKE-6PILE ?auto_161030 ?auto_161031 ?auto_161032 ?auto_161033 ?auto_161034 ?auto_161035 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161038 - BLOCK
      ?auto_161039 - BLOCK
      ?auto_161040 - BLOCK
      ?auto_161041 - BLOCK
      ?auto_161042 - BLOCK
      ?auto_161043 - BLOCK
    )
    :vars
    (
      ?auto_161045 - BLOCK
      ?auto_161044 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161038 ) ( not ( = ?auto_161038 ?auto_161039 ) ) ( not ( = ?auto_161038 ?auto_161040 ) ) ( not ( = ?auto_161038 ?auto_161041 ) ) ( not ( = ?auto_161038 ?auto_161042 ) ) ( not ( = ?auto_161038 ?auto_161043 ) ) ( not ( = ?auto_161039 ?auto_161040 ) ) ( not ( = ?auto_161039 ?auto_161041 ) ) ( not ( = ?auto_161039 ?auto_161042 ) ) ( not ( = ?auto_161039 ?auto_161043 ) ) ( not ( = ?auto_161040 ?auto_161041 ) ) ( not ( = ?auto_161040 ?auto_161042 ) ) ( not ( = ?auto_161040 ?auto_161043 ) ) ( not ( = ?auto_161041 ?auto_161042 ) ) ( not ( = ?auto_161041 ?auto_161043 ) ) ( not ( = ?auto_161042 ?auto_161043 ) ) ( ON ?auto_161043 ?auto_161045 ) ( not ( = ?auto_161038 ?auto_161045 ) ) ( not ( = ?auto_161039 ?auto_161045 ) ) ( not ( = ?auto_161040 ?auto_161045 ) ) ( not ( = ?auto_161041 ?auto_161045 ) ) ( not ( = ?auto_161042 ?auto_161045 ) ) ( not ( = ?auto_161043 ?auto_161045 ) ) ( ON ?auto_161042 ?auto_161043 ) ( ON-TABLE ?auto_161044 ) ( ON ?auto_161045 ?auto_161044 ) ( not ( = ?auto_161044 ?auto_161045 ) ) ( not ( = ?auto_161044 ?auto_161043 ) ) ( not ( = ?auto_161044 ?auto_161042 ) ) ( not ( = ?auto_161038 ?auto_161044 ) ) ( not ( = ?auto_161039 ?auto_161044 ) ) ( not ( = ?auto_161040 ?auto_161044 ) ) ( not ( = ?auto_161041 ?auto_161044 ) ) ( ON ?auto_161041 ?auto_161042 ) ( ON ?auto_161040 ?auto_161041 ) ( CLEAR ?auto_161038 ) ( ON ?auto_161039 ?auto_161040 ) ( CLEAR ?auto_161039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161044 ?auto_161045 ?auto_161043 ?auto_161042 ?auto_161041 ?auto_161040 )
      ( MAKE-6PILE ?auto_161038 ?auto_161039 ?auto_161040 ?auto_161041 ?auto_161042 ?auto_161043 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161046 - BLOCK
      ?auto_161047 - BLOCK
      ?auto_161048 - BLOCK
      ?auto_161049 - BLOCK
      ?auto_161050 - BLOCK
      ?auto_161051 - BLOCK
    )
    :vars
    (
      ?auto_161052 - BLOCK
      ?auto_161053 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161046 ?auto_161047 ) ) ( not ( = ?auto_161046 ?auto_161048 ) ) ( not ( = ?auto_161046 ?auto_161049 ) ) ( not ( = ?auto_161046 ?auto_161050 ) ) ( not ( = ?auto_161046 ?auto_161051 ) ) ( not ( = ?auto_161047 ?auto_161048 ) ) ( not ( = ?auto_161047 ?auto_161049 ) ) ( not ( = ?auto_161047 ?auto_161050 ) ) ( not ( = ?auto_161047 ?auto_161051 ) ) ( not ( = ?auto_161048 ?auto_161049 ) ) ( not ( = ?auto_161048 ?auto_161050 ) ) ( not ( = ?auto_161048 ?auto_161051 ) ) ( not ( = ?auto_161049 ?auto_161050 ) ) ( not ( = ?auto_161049 ?auto_161051 ) ) ( not ( = ?auto_161050 ?auto_161051 ) ) ( ON ?auto_161051 ?auto_161052 ) ( not ( = ?auto_161046 ?auto_161052 ) ) ( not ( = ?auto_161047 ?auto_161052 ) ) ( not ( = ?auto_161048 ?auto_161052 ) ) ( not ( = ?auto_161049 ?auto_161052 ) ) ( not ( = ?auto_161050 ?auto_161052 ) ) ( not ( = ?auto_161051 ?auto_161052 ) ) ( ON ?auto_161050 ?auto_161051 ) ( ON-TABLE ?auto_161053 ) ( ON ?auto_161052 ?auto_161053 ) ( not ( = ?auto_161053 ?auto_161052 ) ) ( not ( = ?auto_161053 ?auto_161051 ) ) ( not ( = ?auto_161053 ?auto_161050 ) ) ( not ( = ?auto_161046 ?auto_161053 ) ) ( not ( = ?auto_161047 ?auto_161053 ) ) ( not ( = ?auto_161048 ?auto_161053 ) ) ( not ( = ?auto_161049 ?auto_161053 ) ) ( ON ?auto_161049 ?auto_161050 ) ( ON ?auto_161048 ?auto_161049 ) ( ON ?auto_161047 ?auto_161048 ) ( CLEAR ?auto_161047 ) ( HOLDING ?auto_161046 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161046 )
      ( MAKE-6PILE ?auto_161046 ?auto_161047 ?auto_161048 ?auto_161049 ?auto_161050 ?auto_161051 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161054 - BLOCK
      ?auto_161055 - BLOCK
      ?auto_161056 - BLOCK
      ?auto_161057 - BLOCK
      ?auto_161058 - BLOCK
      ?auto_161059 - BLOCK
    )
    :vars
    (
      ?auto_161061 - BLOCK
      ?auto_161060 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161054 ?auto_161055 ) ) ( not ( = ?auto_161054 ?auto_161056 ) ) ( not ( = ?auto_161054 ?auto_161057 ) ) ( not ( = ?auto_161054 ?auto_161058 ) ) ( not ( = ?auto_161054 ?auto_161059 ) ) ( not ( = ?auto_161055 ?auto_161056 ) ) ( not ( = ?auto_161055 ?auto_161057 ) ) ( not ( = ?auto_161055 ?auto_161058 ) ) ( not ( = ?auto_161055 ?auto_161059 ) ) ( not ( = ?auto_161056 ?auto_161057 ) ) ( not ( = ?auto_161056 ?auto_161058 ) ) ( not ( = ?auto_161056 ?auto_161059 ) ) ( not ( = ?auto_161057 ?auto_161058 ) ) ( not ( = ?auto_161057 ?auto_161059 ) ) ( not ( = ?auto_161058 ?auto_161059 ) ) ( ON ?auto_161059 ?auto_161061 ) ( not ( = ?auto_161054 ?auto_161061 ) ) ( not ( = ?auto_161055 ?auto_161061 ) ) ( not ( = ?auto_161056 ?auto_161061 ) ) ( not ( = ?auto_161057 ?auto_161061 ) ) ( not ( = ?auto_161058 ?auto_161061 ) ) ( not ( = ?auto_161059 ?auto_161061 ) ) ( ON ?auto_161058 ?auto_161059 ) ( ON-TABLE ?auto_161060 ) ( ON ?auto_161061 ?auto_161060 ) ( not ( = ?auto_161060 ?auto_161061 ) ) ( not ( = ?auto_161060 ?auto_161059 ) ) ( not ( = ?auto_161060 ?auto_161058 ) ) ( not ( = ?auto_161054 ?auto_161060 ) ) ( not ( = ?auto_161055 ?auto_161060 ) ) ( not ( = ?auto_161056 ?auto_161060 ) ) ( not ( = ?auto_161057 ?auto_161060 ) ) ( ON ?auto_161057 ?auto_161058 ) ( ON ?auto_161056 ?auto_161057 ) ( ON ?auto_161055 ?auto_161056 ) ( ON ?auto_161054 ?auto_161055 ) ( CLEAR ?auto_161054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_161060 ?auto_161061 ?auto_161059 ?auto_161058 ?auto_161057 ?auto_161056 ?auto_161055 )
      ( MAKE-6PILE ?auto_161054 ?auto_161055 ?auto_161056 ?auto_161057 ?auto_161058 ?auto_161059 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161068 - BLOCK
      ?auto_161069 - BLOCK
      ?auto_161070 - BLOCK
      ?auto_161071 - BLOCK
      ?auto_161072 - BLOCK
      ?auto_161073 - BLOCK
    )
    :vars
    (
      ?auto_161075 - BLOCK
      ?auto_161074 - BLOCK
      ?auto_161076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161068 ?auto_161069 ) ) ( not ( = ?auto_161068 ?auto_161070 ) ) ( not ( = ?auto_161068 ?auto_161071 ) ) ( not ( = ?auto_161068 ?auto_161072 ) ) ( not ( = ?auto_161068 ?auto_161073 ) ) ( not ( = ?auto_161069 ?auto_161070 ) ) ( not ( = ?auto_161069 ?auto_161071 ) ) ( not ( = ?auto_161069 ?auto_161072 ) ) ( not ( = ?auto_161069 ?auto_161073 ) ) ( not ( = ?auto_161070 ?auto_161071 ) ) ( not ( = ?auto_161070 ?auto_161072 ) ) ( not ( = ?auto_161070 ?auto_161073 ) ) ( not ( = ?auto_161071 ?auto_161072 ) ) ( not ( = ?auto_161071 ?auto_161073 ) ) ( not ( = ?auto_161072 ?auto_161073 ) ) ( ON ?auto_161073 ?auto_161075 ) ( not ( = ?auto_161068 ?auto_161075 ) ) ( not ( = ?auto_161069 ?auto_161075 ) ) ( not ( = ?auto_161070 ?auto_161075 ) ) ( not ( = ?auto_161071 ?auto_161075 ) ) ( not ( = ?auto_161072 ?auto_161075 ) ) ( not ( = ?auto_161073 ?auto_161075 ) ) ( ON ?auto_161072 ?auto_161073 ) ( ON-TABLE ?auto_161074 ) ( ON ?auto_161075 ?auto_161074 ) ( not ( = ?auto_161074 ?auto_161075 ) ) ( not ( = ?auto_161074 ?auto_161073 ) ) ( not ( = ?auto_161074 ?auto_161072 ) ) ( not ( = ?auto_161068 ?auto_161074 ) ) ( not ( = ?auto_161069 ?auto_161074 ) ) ( not ( = ?auto_161070 ?auto_161074 ) ) ( not ( = ?auto_161071 ?auto_161074 ) ) ( ON ?auto_161071 ?auto_161072 ) ( ON ?auto_161070 ?auto_161071 ) ( ON ?auto_161069 ?auto_161070 ) ( CLEAR ?auto_161069 ) ( ON ?auto_161068 ?auto_161076 ) ( CLEAR ?auto_161068 ) ( HAND-EMPTY ) ( not ( = ?auto_161068 ?auto_161076 ) ) ( not ( = ?auto_161069 ?auto_161076 ) ) ( not ( = ?auto_161070 ?auto_161076 ) ) ( not ( = ?auto_161071 ?auto_161076 ) ) ( not ( = ?auto_161072 ?auto_161076 ) ) ( not ( = ?auto_161073 ?auto_161076 ) ) ( not ( = ?auto_161075 ?auto_161076 ) ) ( not ( = ?auto_161074 ?auto_161076 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161068 ?auto_161076 )
      ( MAKE-6PILE ?auto_161068 ?auto_161069 ?auto_161070 ?auto_161071 ?auto_161072 ?auto_161073 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161077 - BLOCK
      ?auto_161078 - BLOCK
      ?auto_161079 - BLOCK
      ?auto_161080 - BLOCK
      ?auto_161081 - BLOCK
      ?auto_161082 - BLOCK
    )
    :vars
    (
      ?auto_161084 - BLOCK
      ?auto_161083 - BLOCK
      ?auto_161085 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161077 ?auto_161078 ) ) ( not ( = ?auto_161077 ?auto_161079 ) ) ( not ( = ?auto_161077 ?auto_161080 ) ) ( not ( = ?auto_161077 ?auto_161081 ) ) ( not ( = ?auto_161077 ?auto_161082 ) ) ( not ( = ?auto_161078 ?auto_161079 ) ) ( not ( = ?auto_161078 ?auto_161080 ) ) ( not ( = ?auto_161078 ?auto_161081 ) ) ( not ( = ?auto_161078 ?auto_161082 ) ) ( not ( = ?auto_161079 ?auto_161080 ) ) ( not ( = ?auto_161079 ?auto_161081 ) ) ( not ( = ?auto_161079 ?auto_161082 ) ) ( not ( = ?auto_161080 ?auto_161081 ) ) ( not ( = ?auto_161080 ?auto_161082 ) ) ( not ( = ?auto_161081 ?auto_161082 ) ) ( ON ?auto_161082 ?auto_161084 ) ( not ( = ?auto_161077 ?auto_161084 ) ) ( not ( = ?auto_161078 ?auto_161084 ) ) ( not ( = ?auto_161079 ?auto_161084 ) ) ( not ( = ?auto_161080 ?auto_161084 ) ) ( not ( = ?auto_161081 ?auto_161084 ) ) ( not ( = ?auto_161082 ?auto_161084 ) ) ( ON ?auto_161081 ?auto_161082 ) ( ON-TABLE ?auto_161083 ) ( ON ?auto_161084 ?auto_161083 ) ( not ( = ?auto_161083 ?auto_161084 ) ) ( not ( = ?auto_161083 ?auto_161082 ) ) ( not ( = ?auto_161083 ?auto_161081 ) ) ( not ( = ?auto_161077 ?auto_161083 ) ) ( not ( = ?auto_161078 ?auto_161083 ) ) ( not ( = ?auto_161079 ?auto_161083 ) ) ( not ( = ?auto_161080 ?auto_161083 ) ) ( ON ?auto_161080 ?auto_161081 ) ( ON ?auto_161079 ?auto_161080 ) ( ON ?auto_161077 ?auto_161085 ) ( CLEAR ?auto_161077 ) ( not ( = ?auto_161077 ?auto_161085 ) ) ( not ( = ?auto_161078 ?auto_161085 ) ) ( not ( = ?auto_161079 ?auto_161085 ) ) ( not ( = ?auto_161080 ?auto_161085 ) ) ( not ( = ?auto_161081 ?auto_161085 ) ) ( not ( = ?auto_161082 ?auto_161085 ) ) ( not ( = ?auto_161084 ?auto_161085 ) ) ( not ( = ?auto_161083 ?auto_161085 ) ) ( HOLDING ?auto_161078 ) ( CLEAR ?auto_161079 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_161083 ?auto_161084 ?auto_161082 ?auto_161081 ?auto_161080 ?auto_161079 ?auto_161078 )
      ( MAKE-6PILE ?auto_161077 ?auto_161078 ?auto_161079 ?auto_161080 ?auto_161081 ?auto_161082 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161086 - BLOCK
      ?auto_161087 - BLOCK
      ?auto_161088 - BLOCK
      ?auto_161089 - BLOCK
      ?auto_161090 - BLOCK
      ?auto_161091 - BLOCK
    )
    :vars
    (
      ?auto_161093 - BLOCK
      ?auto_161094 - BLOCK
      ?auto_161092 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161086 ?auto_161087 ) ) ( not ( = ?auto_161086 ?auto_161088 ) ) ( not ( = ?auto_161086 ?auto_161089 ) ) ( not ( = ?auto_161086 ?auto_161090 ) ) ( not ( = ?auto_161086 ?auto_161091 ) ) ( not ( = ?auto_161087 ?auto_161088 ) ) ( not ( = ?auto_161087 ?auto_161089 ) ) ( not ( = ?auto_161087 ?auto_161090 ) ) ( not ( = ?auto_161087 ?auto_161091 ) ) ( not ( = ?auto_161088 ?auto_161089 ) ) ( not ( = ?auto_161088 ?auto_161090 ) ) ( not ( = ?auto_161088 ?auto_161091 ) ) ( not ( = ?auto_161089 ?auto_161090 ) ) ( not ( = ?auto_161089 ?auto_161091 ) ) ( not ( = ?auto_161090 ?auto_161091 ) ) ( ON ?auto_161091 ?auto_161093 ) ( not ( = ?auto_161086 ?auto_161093 ) ) ( not ( = ?auto_161087 ?auto_161093 ) ) ( not ( = ?auto_161088 ?auto_161093 ) ) ( not ( = ?auto_161089 ?auto_161093 ) ) ( not ( = ?auto_161090 ?auto_161093 ) ) ( not ( = ?auto_161091 ?auto_161093 ) ) ( ON ?auto_161090 ?auto_161091 ) ( ON-TABLE ?auto_161094 ) ( ON ?auto_161093 ?auto_161094 ) ( not ( = ?auto_161094 ?auto_161093 ) ) ( not ( = ?auto_161094 ?auto_161091 ) ) ( not ( = ?auto_161094 ?auto_161090 ) ) ( not ( = ?auto_161086 ?auto_161094 ) ) ( not ( = ?auto_161087 ?auto_161094 ) ) ( not ( = ?auto_161088 ?auto_161094 ) ) ( not ( = ?auto_161089 ?auto_161094 ) ) ( ON ?auto_161089 ?auto_161090 ) ( ON ?auto_161088 ?auto_161089 ) ( ON ?auto_161086 ?auto_161092 ) ( not ( = ?auto_161086 ?auto_161092 ) ) ( not ( = ?auto_161087 ?auto_161092 ) ) ( not ( = ?auto_161088 ?auto_161092 ) ) ( not ( = ?auto_161089 ?auto_161092 ) ) ( not ( = ?auto_161090 ?auto_161092 ) ) ( not ( = ?auto_161091 ?auto_161092 ) ) ( not ( = ?auto_161093 ?auto_161092 ) ) ( not ( = ?auto_161094 ?auto_161092 ) ) ( CLEAR ?auto_161088 ) ( ON ?auto_161087 ?auto_161086 ) ( CLEAR ?auto_161087 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161092 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161092 ?auto_161086 )
      ( MAKE-6PILE ?auto_161086 ?auto_161087 ?auto_161088 ?auto_161089 ?auto_161090 ?auto_161091 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161095 - BLOCK
      ?auto_161096 - BLOCK
      ?auto_161097 - BLOCK
      ?auto_161098 - BLOCK
      ?auto_161099 - BLOCK
      ?auto_161100 - BLOCK
    )
    :vars
    (
      ?auto_161103 - BLOCK
      ?auto_161101 - BLOCK
      ?auto_161102 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161095 ?auto_161096 ) ) ( not ( = ?auto_161095 ?auto_161097 ) ) ( not ( = ?auto_161095 ?auto_161098 ) ) ( not ( = ?auto_161095 ?auto_161099 ) ) ( not ( = ?auto_161095 ?auto_161100 ) ) ( not ( = ?auto_161096 ?auto_161097 ) ) ( not ( = ?auto_161096 ?auto_161098 ) ) ( not ( = ?auto_161096 ?auto_161099 ) ) ( not ( = ?auto_161096 ?auto_161100 ) ) ( not ( = ?auto_161097 ?auto_161098 ) ) ( not ( = ?auto_161097 ?auto_161099 ) ) ( not ( = ?auto_161097 ?auto_161100 ) ) ( not ( = ?auto_161098 ?auto_161099 ) ) ( not ( = ?auto_161098 ?auto_161100 ) ) ( not ( = ?auto_161099 ?auto_161100 ) ) ( ON ?auto_161100 ?auto_161103 ) ( not ( = ?auto_161095 ?auto_161103 ) ) ( not ( = ?auto_161096 ?auto_161103 ) ) ( not ( = ?auto_161097 ?auto_161103 ) ) ( not ( = ?auto_161098 ?auto_161103 ) ) ( not ( = ?auto_161099 ?auto_161103 ) ) ( not ( = ?auto_161100 ?auto_161103 ) ) ( ON ?auto_161099 ?auto_161100 ) ( ON-TABLE ?auto_161101 ) ( ON ?auto_161103 ?auto_161101 ) ( not ( = ?auto_161101 ?auto_161103 ) ) ( not ( = ?auto_161101 ?auto_161100 ) ) ( not ( = ?auto_161101 ?auto_161099 ) ) ( not ( = ?auto_161095 ?auto_161101 ) ) ( not ( = ?auto_161096 ?auto_161101 ) ) ( not ( = ?auto_161097 ?auto_161101 ) ) ( not ( = ?auto_161098 ?auto_161101 ) ) ( ON ?auto_161098 ?auto_161099 ) ( ON ?auto_161095 ?auto_161102 ) ( not ( = ?auto_161095 ?auto_161102 ) ) ( not ( = ?auto_161096 ?auto_161102 ) ) ( not ( = ?auto_161097 ?auto_161102 ) ) ( not ( = ?auto_161098 ?auto_161102 ) ) ( not ( = ?auto_161099 ?auto_161102 ) ) ( not ( = ?auto_161100 ?auto_161102 ) ) ( not ( = ?auto_161103 ?auto_161102 ) ) ( not ( = ?auto_161101 ?auto_161102 ) ) ( ON ?auto_161096 ?auto_161095 ) ( CLEAR ?auto_161096 ) ( ON-TABLE ?auto_161102 ) ( HOLDING ?auto_161097 ) ( CLEAR ?auto_161098 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161101 ?auto_161103 ?auto_161100 ?auto_161099 ?auto_161098 ?auto_161097 )
      ( MAKE-6PILE ?auto_161095 ?auto_161096 ?auto_161097 ?auto_161098 ?auto_161099 ?auto_161100 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161104 - BLOCK
      ?auto_161105 - BLOCK
      ?auto_161106 - BLOCK
      ?auto_161107 - BLOCK
      ?auto_161108 - BLOCK
      ?auto_161109 - BLOCK
    )
    :vars
    (
      ?auto_161110 - BLOCK
      ?auto_161112 - BLOCK
      ?auto_161111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161104 ?auto_161105 ) ) ( not ( = ?auto_161104 ?auto_161106 ) ) ( not ( = ?auto_161104 ?auto_161107 ) ) ( not ( = ?auto_161104 ?auto_161108 ) ) ( not ( = ?auto_161104 ?auto_161109 ) ) ( not ( = ?auto_161105 ?auto_161106 ) ) ( not ( = ?auto_161105 ?auto_161107 ) ) ( not ( = ?auto_161105 ?auto_161108 ) ) ( not ( = ?auto_161105 ?auto_161109 ) ) ( not ( = ?auto_161106 ?auto_161107 ) ) ( not ( = ?auto_161106 ?auto_161108 ) ) ( not ( = ?auto_161106 ?auto_161109 ) ) ( not ( = ?auto_161107 ?auto_161108 ) ) ( not ( = ?auto_161107 ?auto_161109 ) ) ( not ( = ?auto_161108 ?auto_161109 ) ) ( ON ?auto_161109 ?auto_161110 ) ( not ( = ?auto_161104 ?auto_161110 ) ) ( not ( = ?auto_161105 ?auto_161110 ) ) ( not ( = ?auto_161106 ?auto_161110 ) ) ( not ( = ?auto_161107 ?auto_161110 ) ) ( not ( = ?auto_161108 ?auto_161110 ) ) ( not ( = ?auto_161109 ?auto_161110 ) ) ( ON ?auto_161108 ?auto_161109 ) ( ON-TABLE ?auto_161112 ) ( ON ?auto_161110 ?auto_161112 ) ( not ( = ?auto_161112 ?auto_161110 ) ) ( not ( = ?auto_161112 ?auto_161109 ) ) ( not ( = ?auto_161112 ?auto_161108 ) ) ( not ( = ?auto_161104 ?auto_161112 ) ) ( not ( = ?auto_161105 ?auto_161112 ) ) ( not ( = ?auto_161106 ?auto_161112 ) ) ( not ( = ?auto_161107 ?auto_161112 ) ) ( ON ?auto_161107 ?auto_161108 ) ( ON ?auto_161104 ?auto_161111 ) ( not ( = ?auto_161104 ?auto_161111 ) ) ( not ( = ?auto_161105 ?auto_161111 ) ) ( not ( = ?auto_161106 ?auto_161111 ) ) ( not ( = ?auto_161107 ?auto_161111 ) ) ( not ( = ?auto_161108 ?auto_161111 ) ) ( not ( = ?auto_161109 ?auto_161111 ) ) ( not ( = ?auto_161110 ?auto_161111 ) ) ( not ( = ?auto_161112 ?auto_161111 ) ) ( ON ?auto_161105 ?auto_161104 ) ( ON-TABLE ?auto_161111 ) ( CLEAR ?auto_161107 ) ( ON ?auto_161106 ?auto_161105 ) ( CLEAR ?auto_161106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161111 ?auto_161104 ?auto_161105 )
      ( MAKE-6PILE ?auto_161104 ?auto_161105 ?auto_161106 ?auto_161107 ?auto_161108 ?auto_161109 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161113 - BLOCK
      ?auto_161114 - BLOCK
      ?auto_161115 - BLOCK
      ?auto_161116 - BLOCK
      ?auto_161117 - BLOCK
      ?auto_161118 - BLOCK
    )
    :vars
    (
      ?auto_161121 - BLOCK
      ?auto_161120 - BLOCK
      ?auto_161119 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161113 ?auto_161114 ) ) ( not ( = ?auto_161113 ?auto_161115 ) ) ( not ( = ?auto_161113 ?auto_161116 ) ) ( not ( = ?auto_161113 ?auto_161117 ) ) ( not ( = ?auto_161113 ?auto_161118 ) ) ( not ( = ?auto_161114 ?auto_161115 ) ) ( not ( = ?auto_161114 ?auto_161116 ) ) ( not ( = ?auto_161114 ?auto_161117 ) ) ( not ( = ?auto_161114 ?auto_161118 ) ) ( not ( = ?auto_161115 ?auto_161116 ) ) ( not ( = ?auto_161115 ?auto_161117 ) ) ( not ( = ?auto_161115 ?auto_161118 ) ) ( not ( = ?auto_161116 ?auto_161117 ) ) ( not ( = ?auto_161116 ?auto_161118 ) ) ( not ( = ?auto_161117 ?auto_161118 ) ) ( ON ?auto_161118 ?auto_161121 ) ( not ( = ?auto_161113 ?auto_161121 ) ) ( not ( = ?auto_161114 ?auto_161121 ) ) ( not ( = ?auto_161115 ?auto_161121 ) ) ( not ( = ?auto_161116 ?auto_161121 ) ) ( not ( = ?auto_161117 ?auto_161121 ) ) ( not ( = ?auto_161118 ?auto_161121 ) ) ( ON ?auto_161117 ?auto_161118 ) ( ON-TABLE ?auto_161120 ) ( ON ?auto_161121 ?auto_161120 ) ( not ( = ?auto_161120 ?auto_161121 ) ) ( not ( = ?auto_161120 ?auto_161118 ) ) ( not ( = ?auto_161120 ?auto_161117 ) ) ( not ( = ?auto_161113 ?auto_161120 ) ) ( not ( = ?auto_161114 ?auto_161120 ) ) ( not ( = ?auto_161115 ?auto_161120 ) ) ( not ( = ?auto_161116 ?auto_161120 ) ) ( ON ?auto_161113 ?auto_161119 ) ( not ( = ?auto_161113 ?auto_161119 ) ) ( not ( = ?auto_161114 ?auto_161119 ) ) ( not ( = ?auto_161115 ?auto_161119 ) ) ( not ( = ?auto_161116 ?auto_161119 ) ) ( not ( = ?auto_161117 ?auto_161119 ) ) ( not ( = ?auto_161118 ?auto_161119 ) ) ( not ( = ?auto_161121 ?auto_161119 ) ) ( not ( = ?auto_161120 ?auto_161119 ) ) ( ON ?auto_161114 ?auto_161113 ) ( ON-TABLE ?auto_161119 ) ( ON ?auto_161115 ?auto_161114 ) ( CLEAR ?auto_161115 ) ( HOLDING ?auto_161116 ) ( CLEAR ?auto_161117 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161120 ?auto_161121 ?auto_161118 ?auto_161117 ?auto_161116 )
      ( MAKE-6PILE ?auto_161113 ?auto_161114 ?auto_161115 ?auto_161116 ?auto_161117 ?auto_161118 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161122 - BLOCK
      ?auto_161123 - BLOCK
      ?auto_161124 - BLOCK
      ?auto_161125 - BLOCK
      ?auto_161126 - BLOCK
      ?auto_161127 - BLOCK
    )
    :vars
    (
      ?auto_161129 - BLOCK
      ?auto_161130 - BLOCK
      ?auto_161128 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161122 ?auto_161123 ) ) ( not ( = ?auto_161122 ?auto_161124 ) ) ( not ( = ?auto_161122 ?auto_161125 ) ) ( not ( = ?auto_161122 ?auto_161126 ) ) ( not ( = ?auto_161122 ?auto_161127 ) ) ( not ( = ?auto_161123 ?auto_161124 ) ) ( not ( = ?auto_161123 ?auto_161125 ) ) ( not ( = ?auto_161123 ?auto_161126 ) ) ( not ( = ?auto_161123 ?auto_161127 ) ) ( not ( = ?auto_161124 ?auto_161125 ) ) ( not ( = ?auto_161124 ?auto_161126 ) ) ( not ( = ?auto_161124 ?auto_161127 ) ) ( not ( = ?auto_161125 ?auto_161126 ) ) ( not ( = ?auto_161125 ?auto_161127 ) ) ( not ( = ?auto_161126 ?auto_161127 ) ) ( ON ?auto_161127 ?auto_161129 ) ( not ( = ?auto_161122 ?auto_161129 ) ) ( not ( = ?auto_161123 ?auto_161129 ) ) ( not ( = ?auto_161124 ?auto_161129 ) ) ( not ( = ?auto_161125 ?auto_161129 ) ) ( not ( = ?auto_161126 ?auto_161129 ) ) ( not ( = ?auto_161127 ?auto_161129 ) ) ( ON ?auto_161126 ?auto_161127 ) ( ON-TABLE ?auto_161130 ) ( ON ?auto_161129 ?auto_161130 ) ( not ( = ?auto_161130 ?auto_161129 ) ) ( not ( = ?auto_161130 ?auto_161127 ) ) ( not ( = ?auto_161130 ?auto_161126 ) ) ( not ( = ?auto_161122 ?auto_161130 ) ) ( not ( = ?auto_161123 ?auto_161130 ) ) ( not ( = ?auto_161124 ?auto_161130 ) ) ( not ( = ?auto_161125 ?auto_161130 ) ) ( ON ?auto_161122 ?auto_161128 ) ( not ( = ?auto_161122 ?auto_161128 ) ) ( not ( = ?auto_161123 ?auto_161128 ) ) ( not ( = ?auto_161124 ?auto_161128 ) ) ( not ( = ?auto_161125 ?auto_161128 ) ) ( not ( = ?auto_161126 ?auto_161128 ) ) ( not ( = ?auto_161127 ?auto_161128 ) ) ( not ( = ?auto_161129 ?auto_161128 ) ) ( not ( = ?auto_161130 ?auto_161128 ) ) ( ON ?auto_161123 ?auto_161122 ) ( ON-TABLE ?auto_161128 ) ( ON ?auto_161124 ?auto_161123 ) ( CLEAR ?auto_161126 ) ( ON ?auto_161125 ?auto_161124 ) ( CLEAR ?auto_161125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161128 ?auto_161122 ?auto_161123 ?auto_161124 )
      ( MAKE-6PILE ?auto_161122 ?auto_161123 ?auto_161124 ?auto_161125 ?auto_161126 ?auto_161127 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161131 - BLOCK
      ?auto_161132 - BLOCK
      ?auto_161133 - BLOCK
      ?auto_161134 - BLOCK
      ?auto_161135 - BLOCK
      ?auto_161136 - BLOCK
    )
    :vars
    (
      ?auto_161139 - BLOCK
      ?auto_161137 - BLOCK
      ?auto_161138 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161131 ?auto_161132 ) ) ( not ( = ?auto_161131 ?auto_161133 ) ) ( not ( = ?auto_161131 ?auto_161134 ) ) ( not ( = ?auto_161131 ?auto_161135 ) ) ( not ( = ?auto_161131 ?auto_161136 ) ) ( not ( = ?auto_161132 ?auto_161133 ) ) ( not ( = ?auto_161132 ?auto_161134 ) ) ( not ( = ?auto_161132 ?auto_161135 ) ) ( not ( = ?auto_161132 ?auto_161136 ) ) ( not ( = ?auto_161133 ?auto_161134 ) ) ( not ( = ?auto_161133 ?auto_161135 ) ) ( not ( = ?auto_161133 ?auto_161136 ) ) ( not ( = ?auto_161134 ?auto_161135 ) ) ( not ( = ?auto_161134 ?auto_161136 ) ) ( not ( = ?auto_161135 ?auto_161136 ) ) ( ON ?auto_161136 ?auto_161139 ) ( not ( = ?auto_161131 ?auto_161139 ) ) ( not ( = ?auto_161132 ?auto_161139 ) ) ( not ( = ?auto_161133 ?auto_161139 ) ) ( not ( = ?auto_161134 ?auto_161139 ) ) ( not ( = ?auto_161135 ?auto_161139 ) ) ( not ( = ?auto_161136 ?auto_161139 ) ) ( ON-TABLE ?auto_161137 ) ( ON ?auto_161139 ?auto_161137 ) ( not ( = ?auto_161137 ?auto_161139 ) ) ( not ( = ?auto_161137 ?auto_161136 ) ) ( not ( = ?auto_161137 ?auto_161135 ) ) ( not ( = ?auto_161131 ?auto_161137 ) ) ( not ( = ?auto_161132 ?auto_161137 ) ) ( not ( = ?auto_161133 ?auto_161137 ) ) ( not ( = ?auto_161134 ?auto_161137 ) ) ( ON ?auto_161131 ?auto_161138 ) ( not ( = ?auto_161131 ?auto_161138 ) ) ( not ( = ?auto_161132 ?auto_161138 ) ) ( not ( = ?auto_161133 ?auto_161138 ) ) ( not ( = ?auto_161134 ?auto_161138 ) ) ( not ( = ?auto_161135 ?auto_161138 ) ) ( not ( = ?auto_161136 ?auto_161138 ) ) ( not ( = ?auto_161139 ?auto_161138 ) ) ( not ( = ?auto_161137 ?auto_161138 ) ) ( ON ?auto_161132 ?auto_161131 ) ( ON-TABLE ?auto_161138 ) ( ON ?auto_161133 ?auto_161132 ) ( ON ?auto_161134 ?auto_161133 ) ( CLEAR ?auto_161134 ) ( HOLDING ?auto_161135 ) ( CLEAR ?auto_161136 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161137 ?auto_161139 ?auto_161136 ?auto_161135 )
      ( MAKE-6PILE ?auto_161131 ?auto_161132 ?auto_161133 ?auto_161134 ?auto_161135 ?auto_161136 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161140 - BLOCK
      ?auto_161141 - BLOCK
      ?auto_161142 - BLOCK
      ?auto_161143 - BLOCK
      ?auto_161144 - BLOCK
      ?auto_161145 - BLOCK
    )
    :vars
    (
      ?auto_161148 - BLOCK
      ?auto_161146 - BLOCK
      ?auto_161147 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161140 ?auto_161141 ) ) ( not ( = ?auto_161140 ?auto_161142 ) ) ( not ( = ?auto_161140 ?auto_161143 ) ) ( not ( = ?auto_161140 ?auto_161144 ) ) ( not ( = ?auto_161140 ?auto_161145 ) ) ( not ( = ?auto_161141 ?auto_161142 ) ) ( not ( = ?auto_161141 ?auto_161143 ) ) ( not ( = ?auto_161141 ?auto_161144 ) ) ( not ( = ?auto_161141 ?auto_161145 ) ) ( not ( = ?auto_161142 ?auto_161143 ) ) ( not ( = ?auto_161142 ?auto_161144 ) ) ( not ( = ?auto_161142 ?auto_161145 ) ) ( not ( = ?auto_161143 ?auto_161144 ) ) ( not ( = ?auto_161143 ?auto_161145 ) ) ( not ( = ?auto_161144 ?auto_161145 ) ) ( ON ?auto_161145 ?auto_161148 ) ( not ( = ?auto_161140 ?auto_161148 ) ) ( not ( = ?auto_161141 ?auto_161148 ) ) ( not ( = ?auto_161142 ?auto_161148 ) ) ( not ( = ?auto_161143 ?auto_161148 ) ) ( not ( = ?auto_161144 ?auto_161148 ) ) ( not ( = ?auto_161145 ?auto_161148 ) ) ( ON-TABLE ?auto_161146 ) ( ON ?auto_161148 ?auto_161146 ) ( not ( = ?auto_161146 ?auto_161148 ) ) ( not ( = ?auto_161146 ?auto_161145 ) ) ( not ( = ?auto_161146 ?auto_161144 ) ) ( not ( = ?auto_161140 ?auto_161146 ) ) ( not ( = ?auto_161141 ?auto_161146 ) ) ( not ( = ?auto_161142 ?auto_161146 ) ) ( not ( = ?auto_161143 ?auto_161146 ) ) ( ON ?auto_161140 ?auto_161147 ) ( not ( = ?auto_161140 ?auto_161147 ) ) ( not ( = ?auto_161141 ?auto_161147 ) ) ( not ( = ?auto_161142 ?auto_161147 ) ) ( not ( = ?auto_161143 ?auto_161147 ) ) ( not ( = ?auto_161144 ?auto_161147 ) ) ( not ( = ?auto_161145 ?auto_161147 ) ) ( not ( = ?auto_161148 ?auto_161147 ) ) ( not ( = ?auto_161146 ?auto_161147 ) ) ( ON ?auto_161141 ?auto_161140 ) ( ON-TABLE ?auto_161147 ) ( ON ?auto_161142 ?auto_161141 ) ( ON ?auto_161143 ?auto_161142 ) ( CLEAR ?auto_161145 ) ( ON ?auto_161144 ?auto_161143 ) ( CLEAR ?auto_161144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161147 ?auto_161140 ?auto_161141 ?auto_161142 ?auto_161143 )
      ( MAKE-6PILE ?auto_161140 ?auto_161141 ?auto_161142 ?auto_161143 ?auto_161144 ?auto_161145 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161149 - BLOCK
      ?auto_161150 - BLOCK
      ?auto_161151 - BLOCK
      ?auto_161152 - BLOCK
      ?auto_161153 - BLOCK
      ?auto_161154 - BLOCK
    )
    :vars
    (
      ?auto_161156 - BLOCK
      ?auto_161157 - BLOCK
      ?auto_161155 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161149 ?auto_161150 ) ) ( not ( = ?auto_161149 ?auto_161151 ) ) ( not ( = ?auto_161149 ?auto_161152 ) ) ( not ( = ?auto_161149 ?auto_161153 ) ) ( not ( = ?auto_161149 ?auto_161154 ) ) ( not ( = ?auto_161150 ?auto_161151 ) ) ( not ( = ?auto_161150 ?auto_161152 ) ) ( not ( = ?auto_161150 ?auto_161153 ) ) ( not ( = ?auto_161150 ?auto_161154 ) ) ( not ( = ?auto_161151 ?auto_161152 ) ) ( not ( = ?auto_161151 ?auto_161153 ) ) ( not ( = ?auto_161151 ?auto_161154 ) ) ( not ( = ?auto_161152 ?auto_161153 ) ) ( not ( = ?auto_161152 ?auto_161154 ) ) ( not ( = ?auto_161153 ?auto_161154 ) ) ( not ( = ?auto_161149 ?auto_161156 ) ) ( not ( = ?auto_161150 ?auto_161156 ) ) ( not ( = ?auto_161151 ?auto_161156 ) ) ( not ( = ?auto_161152 ?auto_161156 ) ) ( not ( = ?auto_161153 ?auto_161156 ) ) ( not ( = ?auto_161154 ?auto_161156 ) ) ( ON-TABLE ?auto_161157 ) ( ON ?auto_161156 ?auto_161157 ) ( not ( = ?auto_161157 ?auto_161156 ) ) ( not ( = ?auto_161157 ?auto_161154 ) ) ( not ( = ?auto_161157 ?auto_161153 ) ) ( not ( = ?auto_161149 ?auto_161157 ) ) ( not ( = ?auto_161150 ?auto_161157 ) ) ( not ( = ?auto_161151 ?auto_161157 ) ) ( not ( = ?auto_161152 ?auto_161157 ) ) ( ON ?auto_161149 ?auto_161155 ) ( not ( = ?auto_161149 ?auto_161155 ) ) ( not ( = ?auto_161150 ?auto_161155 ) ) ( not ( = ?auto_161151 ?auto_161155 ) ) ( not ( = ?auto_161152 ?auto_161155 ) ) ( not ( = ?auto_161153 ?auto_161155 ) ) ( not ( = ?auto_161154 ?auto_161155 ) ) ( not ( = ?auto_161156 ?auto_161155 ) ) ( not ( = ?auto_161157 ?auto_161155 ) ) ( ON ?auto_161150 ?auto_161149 ) ( ON-TABLE ?auto_161155 ) ( ON ?auto_161151 ?auto_161150 ) ( ON ?auto_161152 ?auto_161151 ) ( ON ?auto_161153 ?auto_161152 ) ( CLEAR ?auto_161153 ) ( HOLDING ?auto_161154 ) ( CLEAR ?auto_161156 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161157 ?auto_161156 ?auto_161154 )
      ( MAKE-6PILE ?auto_161149 ?auto_161150 ?auto_161151 ?auto_161152 ?auto_161153 ?auto_161154 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161158 - BLOCK
      ?auto_161159 - BLOCK
      ?auto_161160 - BLOCK
      ?auto_161161 - BLOCK
      ?auto_161162 - BLOCK
      ?auto_161163 - BLOCK
    )
    :vars
    (
      ?auto_161166 - BLOCK
      ?auto_161164 - BLOCK
      ?auto_161165 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161158 ?auto_161159 ) ) ( not ( = ?auto_161158 ?auto_161160 ) ) ( not ( = ?auto_161158 ?auto_161161 ) ) ( not ( = ?auto_161158 ?auto_161162 ) ) ( not ( = ?auto_161158 ?auto_161163 ) ) ( not ( = ?auto_161159 ?auto_161160 ) ) ( not ( = ?auto_161159 ?auto_161161 ) ) ( not ( = ?auto_161159 ?auto_161162 ) ) ( not ( = ?auto_161159 ?auto_161163 ) ) ( not ( = ?auto_161160 ?auto_161161 ) ) ( not ( = ?auto_161160 ?auto_161162 ) ) ( not ( = ?auto_161160 ?auto_161163 ) ) ( not ( = ?auto_161161 ?auto_161162 ) ) ( not ( = ?auto_161161 ?auto_161163 ) ) ( not ( = ?auto_161162 ?auto_161163 ) ) ( not ( = ?auto_161158 ?auto_161166 ) ) ( not ( = ?auto_161159 ?auto_161166 ) ) ( not ( = ?auto_161160 ?auto_161166 ) ) ( not ( = ?auto_161161 ?auto_161166 ) ) ( not ( = ?auto_161162 ?auto_161166 ) ) ( not ( = ?auto_161163 ?auto_161166 ) ) ( ON-TABLE ?auto_161164 ) ( ON ?auto_161166 ?auto_161164 ) ( not ( = ?auto_161164 ?auto_161166 ) ) ( not ( = ?auto_161164 ?auto_161163 ) ) ( not ( = ?auto_161164 ?auto_161162 ) ) ( not ( = ?auto_161158 ?auto_161164 ) ) ( not ( = ?auto_161159 ?auto_161164 ) ) ( not ( = ?auto_161160 ?auto_161164 ) ) ( not ( = ?auto_161161 ?auto_161164 ) ) ( ON ?auto_161158 ?auto_161165 ) ( not ( = ?auto_161158 ?auto_161165 ) ) ( not ( = ?auto_161159 ?auto_161165 ) ) ( not ( = ?auto_161160 ?auto_161165 ) ) ( not ( = ?auto_161161 ?auto_161165 ) ) ( not ( = ?auto_161162 ?auto_161165 ) ) ( not ( = ?auto_161163 ?auto_161165 ) ) ( not ( = ?auto_161166 ?auto_161165 ) ) ( not ( = ?auto_161164 ?auto_161165 ) ) ( ON ?auto_161159 ?auto_161158 ) ( ON-TABLE ?auto_161165 ) ( ON ?auto_161160 ?auto_161159 ) ( ON ?auto_161161 ?auto_161160 ) ( ON ?auto_161162 ?auto_161161 ) ( CLEAR ?auto_161166 ) ( ON ?auto_161163 ?auto_161162 ) ( CLEAR ?auto_161163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161165 ?auto_161158 ?auto_161159 ?auto_161160 ?auto_161161 ?auto_161162 )
      ( MAKE-6PILE ?auto_161158 ?auto_161159 ?auto_161160 ?auto_161161 ?auto_161162 ?auto_161163 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161167 - BLOCK
      ?auto_161168 - BLOCK
      ?auto_161169 - BLOCK
      ?auto_161170 - BLOCK
      ?auto_161171 - BLOCK
      ?auto_161172 - BLOCK
    )
    :vars
    (
      ?auto_161175 - BLOCK
      ?auto_161174 - BLOCK
      ?auto_161173 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161167 ?auto_161168 ) ) ( not ( = ?auto_161167 ?auto_161169 ) ) ( not ( = ?auto_161167 ?auto_161170 ) ) ( not ( = ?auto_161167 ?auto_161171 ) ) ( not ( = ?auto_161167 ?auto_161172 ) ) ( not ( = ?auto_161168 ?auto_161169 ) ) ( not ( = ?auto_161168 ?auto_161170 ) ) ( not ( = ?auto_161168 ?auto_161171 ) ) ( not ( = ?auto_161168 ?auto_161172 ) ) ( not ( = ?auto_161169 ?auto_161170 ) ) ( not ( = ?auto_161169 ?auto_161171 ) ) ( not ( = ?auto_161169 ?auto_161172 ) ) ( not ( = ?auto_161170 ?auto_161171 ) ) ( not ( = ?auto_161170 ?auto_161172 ) ) ( not ( = ?auto_161171 ?auto_161172 ) ) ( not ( = ?auto_161167 ?auto_161175 ) ) ( not ( = ?auto_161168 ?auto_161175 ) ) ( not ( = ?auto_161169 ?auto_161175 ) ) ( not ( = ?auto_161170 ?auto_161175 ) ) ( not ( = ?auto_161171 ?auto_161175 ) ) ( not ( = ?auto_161172 ?auto_161175 ) ) ( ON-TABLE ?auto_161174 ) ( not ( = ?auto_161174 ?auto_161175 ) ) ( not ( = ?auto_161174 ?auto_161172 ) ) ( not ( = ?auto_161174 ?auto_161171 ) ) ( not ( = ?auto_161167 ?auto_161174 ) ) ( not ( = ?auto_161168 ?auto_161174 ) ) ( not ( = ?auto_161169 ?auto_161174 ) ) ( not ( = ?auto_161170 ?auto_161174 ) ) ( ON ?auto_161167 ?auto_161173 ) ( not ( = ?auto_161167 ?auto_161173 ) ) ( not ( = ?auto_161168 ?auto_161173 ) ) ( not ( = ?auto_161169 ?auto_161173 ) ) ( not ( = ?auto_161170 ?auto_161173 ) ) ( not ( = ?auto_161171 ?auto_161173 ) ) ( not ( = ?auto_161172 ?auto_161173 ) ) ( not ( = ?auto_161175 ?auto_161173 ) ) ( not ( = ?auto_161174 ?auto_161173 ) ) ( ON ?auto_161168 ?auto_161167 ) ( ON-TABLE ?auto_161173 ) ( ON ?auto_161169 ?auto_161168 ) ( ON ?auto_161170 ?auto_161169 ) ( ON ?auto_161171 ?auto_161170 ) ( ON ?auto_161172 ?auto_161171 ) ( CLEAR ?auto_161172 ) ( HOLDING ?auto_161175 ) ( CLEAR ?auto_161174 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161174 ?auto_161175 )
      ( MAKE-6PILE ?auto_161167 ?auto_161168 ?auto_161169 ?auto_161170 ?auto_161171 ?auto_161172 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161176 - BLOCK
      ?auto_161177 - BLOCK
      ?auto_161178 - BLOCK
      ?auto_161179 - BLOCK
      ?auto_161180 - BLOCK
      ?auto_161181 - BLOCK
    )
    :vars
    (
      ?auto_161183 - BLOCK
      ?auto_161184 - BLOCK
      ?auto_161182 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161176 ?auto_161177 ) ) ( not ( = ?auto_161176 ?auto_161178 ) ) ( not ( = ?auto_161176 ?auto_161179 ) ) ( not ( = ?auto_161176 ?auto_161180 ) ) ( not ( = ?auto_161176 ?auto_161181 ) ) ( not ( = ?auto_161177 ?auto_161178 ) ) ( not ( = ?auto_161177 ?auto_161179 ) ) ( not ( = ?auto_161177 ?auto_161180 ) ) ( not ( = ?auto_161177 ?auto_161181 ) ) ( not ( = ?auto_161178 ?auto_161179 ) ) ( not ( = ?auto_161178 ?auto_161180 ) ) ( not ( = ?auto_161178 ?auto_161181 ) ) ( not ( = ?auto_161179 ?auto_161180 ) ) ( not ( = ?auto_161179 ?auto_161181 ) ) ( not ( = ?auto_161180 ?auto_161181 ) ) ( not ( = ?auto_161176 ?auto_161183 ) ) ( not ( = ?auto_161177 ?auto_161183 ) ) ( not ( = ?auto_161178 ?auto_161183 ) ) ( not ( = ?auto_161179 ?auto_161183 ) ) ( not ( = ?auto_161180 ?auto_161183 ) ) ( not ( = ?auto_161181 ?auto_161183 ) ) ( ON-TABLE ?auto_161184 ) ( not ( = ?auto_161184 ?auto_161183 ) ) ( not ( = ?auto_161184 ?auto_161181 ) ) ( not ( = ?auto_161184 ?auto_161180 ) ) ( not ( = ?auto_161176 ?auto_161184 ) ) ( not ( = ?auto_161177 ?auto_161184 ) ) ( not ( = ?auto_161178 ?auto_161184 ) ) ( not ( = ?auto_161179 ?auto_161184 ) ) ( ON ?auto_161176 ?auto_161182 ) ( not ( = ?auto_161176 ?auto_161182 ) ) ( not ( = ?auto_161177 ?auto_161182 ) ) ( not ( = ?auto_161178 ?auto_161182 ) ) ( not ( = ?auto_161179 ?auto_161182 ) ) ( not ( = ?auto_161180 ?auto_161182 ) ) ( not ( = ?auto_161181 ?auto_161182 ) ) ( not ( = ?auto_161183 ?auto_161182 ) ) ( not ( = ?auto_161184 ?auto_161182 ) ) ( ON ?auto_161177 ?auto_161176 ) ( ON-TABLE ?auto_161182 ) ( ON ?auto_161178 ?auto_161177 ) ( ON ?auto_161179 ?auto_161178 ) ( ON ?auto_161180 ?auto_161179 ) ( ON ?auto_161181 ?auto_161180 ) ( CLEAR ?auto_161184 ) ( ON ?auto_161183 ?auto_161181 ) ( CLEAR ?auto_161183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_161182 ?auto_161176 ?auto_161177 ?auto_161178 ?auto_161179 ?auto_161180 ?auto_161181 )
      ( MAKE-6PILE ?auto_161176 ?auto_161177 ?auto_161178 ?auto_161179 ?auto_161180 ?auto_161181 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161185 - BLOCK
      ?auto_161186 - BLOCK
      ?auto_161187 - BLOCK
      ?auto_161188 - BLOCK
      ?auto_161189 - BLOCK
      ?auto_161190 - BLOCK
    )
    :vars
    (
      ?auto_161192 - BLOCK
      ?auto_161191 - BLOCK
      ?auto_161193 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161185 ?auto_161186 ) ) ( not ( = ?auto_161185 ?auto_161187 ) ) ( not ( = ?auto_161185 ?auto_161188 ) ) ( not ( = ?auto_161185 ?auto_161189 ) ) ( not ( = ?auto_161185 ?auto_161190 ) ) ( not ( = ?auto_161186 ?auto_161187 ) ) ( not ( = ?auto_161186 ?auto_161188 ) ) ( not ( = ?auto_161186 ?auto_161189 ) ) ( not ( = ?auto_161186 ?auto_161190 ) ) ( not ( = ?auto_161187 ?auto_161188 ) ) ( not ( = ?auto_161187 ?auto_161189 ) ) ( not ( = ?auto_161187 ?auto_161190 ) ) ( not ( = ?auto_161188 ?auto_161189 ) ) ( not ( = ?auto_161188 ?auto_161190 ) ) ( not ( = ?auto_161189 ?auto_161190 ) ) ( not ( = ?auto_161185 ?auto_161192 ) ) ( not ( = ?auto_161186 ?auto_161192 ) ) ( not ( = ?auto_161187 ?auto_161192 ) ) ( not ( = ?auto_161188 ?auto_161192 ) ) ( not ( = ?auto_161189 ?auto_161192 ) ) ( not ( = ?auto_161190 ?auto_161192 ) ) ( not ( = ?auto_161191 ?auto_161192 ) ) ( not ( = ?auto_161191 ?auto_161190 ) ) ( not ( = ?auto_161191 ?auto_161189 ) ) ( not ( = ?auto_161185 ?auto_161191 ) ) ( not ( = ?auto_161186 ?auto_161191 ) ) ( not ( = ?auto_161187 ?auto_161191 ) ) ( not ( = ?auto_161188 ?auto_161191 ) ) ( ON ?auto_161185 ?auto_161193 ) ( not ( = ?auto_161185 ?auto_161193 ) ) ( not ( = ?auto_161186 ?auto_161193 ) ) ( not ( = ?auto_161187 ?auto_161193 ) ) ( not ( = ?auto_161188 ?auto_161193 ) ) ( not ( = ?auto_161189 ?auto_161193 ) ) ( not ( = ?auto_161190 ?auto_161193 ) ) ( not ( = ?auto_161192 ?auto_161193 ) ) ( not ( = ?auto_161191 ?auto_161193 ) ) ( ON ?auto_161186 ?auto_161185 ) ( ON-TABLE ?auto_161193 ) ( ON ?auto_161187 ?auto_161186 ) ( ON ?auto_161188 ?auto_161187 ) ( ON ?auto_161189 ?auto_161188 ) ( ON ?auto_161190 ?auto_161189 ) ( ON ?auto_161192 ?auto_161190 ) ( CLEAR ?auto_161192 ) ( HOLDING ?auto_161191 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161191 )
      ( MAKE-6PILE ?auto_161185 ?auto_161186 ?auto_161187 ?auto_161188 ?auto_161189 ?auto_161190 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161194 - BLOCK
      ?auto_161195 - BLOCK
      ?auto_161196 - BLOCK
      ?auto_161197 - BLOCK
      ?auto_161198 - BLOCK
      ?auto_161199 - BLOCK
    )
    :vars
    (
      ?auto_161202 - BLOCK
      ?auto_161200 - BLOCK
      ?auto_161201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161194 ?auto_161195 ) ) ( not ( = ?auto_161194 ?auto_161196 ) ) ( not ( = ?auto_161194 ?auto_161197 ) ) ( not ( = ?auto_161194 ?auto_161198 ) ) ( not ( = ?auto_161194 ?auto_161199 ) ) ( not ( = ?auto_161195 ?auto_161196 ) ) ( not ( = ?auto_161195 ?auto_161197 ) ) ( not ( = ?auto_161195 ?auto_161198 ) ) ( not ( = ?auto_161195 ?auto_161199 ) ) ( not ( = ?auto_161196 ?auto_161197 ) ) ( not ( = ?auto_161196 ?auto_161198 ) ) ( not ( = ?auto_161196 ?auto_161199 ) ) ( not ( = ?auto_161197 ?auto_161198 ) ) ( not ( = ?auto_161197 ?auto_161199 ) ) ( not ( = ?auto_161198 ?auto_161199 ) ) ( not ( = ?auto_161194 ?auto_161202 ) ) ( not ( = ?auto_161195 ?auto_161202 ) ) ( not ( = ?auto_161196 ?auto_161202 ) ) ( not ( = ?auto_161197 ?auto_161202 ) ) ( not ( = ?auto_161198 ?auto_161202 ) ) ( not ( = ?auto_161199 ?auto_161202 ) ) ( not ( = ?auto_161200 ?auto_161202 ) ) ( not ( = ?auto_161200 ?auto_161199 ) ) ( not ( = ?auto_161200 ?auto_161198 ) ) ( not ( = ?auto_161194 ?auto_161200 ) ) ( not ( = ?auto_161195 ?auto_161200 ) ) ( not ( = ?auto_161196 ?auto_161200 ) ) ( not ( = ?auto_161197 ?auto_161200 ) ) ( ON ?auto_161194 ?auto_161201 ) ( not ( = ?auto_161194 ?auto_161201 ) ) ( not ( = ?auto_161195 ?auto_161201 ) ) ( not ( = ?auto_161196 ?auto_161201 ) ) ( not ( = ?auto_161197 ?auto_161201 ) ) ( not ( = ?auto_161198 ?auto_161201 ) ) ( not ( = ?auto_161199 ?auto_161201 ) ) ( not ( = ?auto_161202 ?auto_161201 ) ) ( not ( = ?auto_161200 ?auto_161201 ) ) ( ON ?auto_161195 ?auto_161194 ) ( ON-TABLE ?auto_161201 ) ( ON ?auto_161196 ?auto_161195 ) ( ON ?auto_161197 ?auto_161196 ) ( ON ?auto_161198 ?auto_161197 ) ( ON ?auto_161199 ?auto_161198 ) ( ON ?auto_161202 ?auto_161199 ) ( ON ?auto_161200 ?auto_161202 ) ( CLEAR ?auto_161200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_161201 ?auto_161194 ?auto_161195 ?auto_161196 ?auto_161197 ?auto_161198 ?auto_161199 ?auto_161202 )
      ( MAKE-6PILE ?auto_161194 ?auto_161195 ?auto_161196 ?auto_161197 ?auto_161198 ?auto_161199 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161214 - BLOCK
    )
    :vars
    (
      ?auto_161215 - BLOCK
      ?auto_161217 - BLOCK
      ?auto_161216 - BLOCK
      ?auto_161220 - BLOCK
      ?auto_161221 - BLOCK
      ?auto_161219 - BLOCK
      ?auto_161218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161215 ?auto_161214 ) ( ON-TABLE ?auto_161214 ) ( not ( = ?auto_161214 ?auto_161215 ) ) ( not ( = ?auto_161214 ?auto_161217 ) ) ( not ( = ?auto_161214 ?auto_161216 ) ) ( not ( = ?auto_161215 ?auto_161217 ) ) ( not ( = ?auto_161215 ?auto_161216 ) ) ( not ( = ?auto_161217 ?auto_161216 ) ) ( ON ?auto_161217 ?auto_161215 ) ( CLEAR ?auto_161217 ) ( HOLDING ?auto_161216 ) ( CLEAR ?auto_161220 ) ( ON-TABLE ?auto_161221 ) ( ON ?auto_161219 ?auto_161221 ) ( ON ?auto_161218 ?auto_161219 ) ( ON ?auto_161220 ?auto_161218 ) ( not ( = ?auto_161221 ?auto_161219 ) ) ( not ( = ?auto_161221 ?auto_161218 ) ) ( not ( = ?auto_161221 ?auto_161220 ) ) ( not ( = ?auto_161221 ?auto_161216 ) ) ( not ( = ?auto_161219 ?auto_161218 ) ) ( not ( = ?auto_161219 ?auto_161220 ) ) ( not ( = ?auto_161219 ?auto_161216 ) ) ( not ( = ?auto_161218 ?auto_161220 ) ) ( not ( = ?auto_161218 ?auto_161216 ) ) ( not ( = ?auto_161220 ?auto_161216 ) ) ( not ( = ?auto_161214 ?auto_161220 ) ) ( not ( = ?auto_161214 ?auto_161221 ) ) ( not ( = ?auto_161214 ?auto_161219 ) ) ( not ( = ?auto_161214 ?auto_161218 ) ) ( not ( = ?auto_161215 ?auto_161220 ) ) ( not ( = ?auto_161215 ?auto_161221 ) ) ( not ( = ?auto_161215 ?auto_161219 ) ) ( not ( = ?auto_161215 ?auto_161218 ) ) ( not ( = ?auto_161217 ?auto_161220 ) ) ( not ( = ?auto_161217 ?auto_161221 ) ) ( not ( = ?auto_161217 ?auto_161219 ) ) ( not ( = ?auto_161217 ?auto_161218 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161221 ?auto_161219 ?auto_161218 ?auto_161220 ?auto_161216 )
      ( MAKE-1PILE ?auto_161214 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161222 - BLOCK
    )
    :vars
    (
      ?auto_161224 - BLOCK
      ?auto_161225 - BLOCK
      ?auto_161227 - BLOCK
      ?auto_161223 - BLOCK
      ?auto_161226 - BLOCK
      ?auto_161229 - BLOCK
      ?auto_161228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161224 ?auto_161222 ) ( ON-TABLE ?auto_161222 ) ( not ( = ?auto_161222 ?auto_161224 ) ) ( not ( = ?auto_161222 ?auto_161225 ) ) ( not ( = ?auto_161222 ?auto_161227 ) ) ( not ( = ?auto_161224 ?auto_161225 ) ) ( not ( = ?auto_161224 ?auto_161227 ) ) ( not ( = ?auto_161225 ?auto_161227 ) ) ( ON ?auto_161225 ?auto_161224 ) ( CLEAR ?auto_161223 ) ( ON-TABLE ?auto_161226 ) ( ON ?auto_161229 ?auto_161226 ) ( ON ?auto_161228 ?auto_161229 ) ( ON ?auto_161223 ?auto_161228 ) ( not ( = ?auto_161226 ?auto_161229 ) ) ( not ( = ?auto_161226 ?auto_161228 ) ) ( not ( = ?auto_161226 ?auto_161223 ) ) ( not ( = ?auto_161226 ?auto_161227 ) ) ( not ( = ?auto_161229 ?auto_161228 ) ) ( not ( = ?auto_161229 ?auto_161223 ) ) ( not ( = ?auto_161229 ?auto_161227 ) ) ( not ( = ?auto_161228 ?auto_161223 ) ) ( not ( = ?auto_161228 ?auto_161227 ) ) ( not ( = ?auto_161223 ?auto_161227 ) ) ( not ( = ?auto_161222 ?auto_161223 ) ) ( not ( = ?auto_161222 ?auto_161226 ) ) ( not ( = ?auto_161222 ?auto_161229 ) ) ( not ( = ?auto_161222 ?auto_161228 ) ) ( not ( = ?auto_161224 ?auto_161223 ) ) ( not ( = ?auto_161224 ?auto_161226 ) ) ( not ( = ?auto_161224 ?auto_161229 ) ) ( not ( = ?auto_161224 ?auto_161228 ) ) ( not ( = ?auto_161225 ?auto_161223 ) ) ( not ( = ?auto_161225 ?auto_161226 ) ) ( not ( = ?auto_161225 ?auto_161229 ) ) ( not ( = ?auto_161225 ?auto_161228 ) ) ( ON ?auto_161227 ?auto_161225 ) ( CLEAR ?auto_161227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161222 ?auto_161224 ?auto_161225 )
      ( MAKE-1PILE ?auto_161222 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161230 - BLOCK
    )
    :vars
    (
      ?auto_161237 - BLOCK
      ?auto_161232 - BLOCK
      ?auto_161233 - BLOCK
      ?auto_161231 - BLOCK
      ?auto_161234 - BLOCK
      ?auto_161236 - BLOCK
      ?auto_161235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161237 ?auto_161230 ) ( ON-TABLE ?auto_161230 ) ( not ( = ?auto_161230 ?auto_161237 ) ) ( not ( = ?auto_161230 ?auto_161232 ) ) ( not ( = ?auto_161230 ?auto_161233 ) ) ( not ( = ?auto_161237 ?auto_161232 ) ) ( not ( = ?auto_161237 ?auto_161233 ) ) ( not ( = ?auto_161232 ?auto_161233 ) ) ( ON ?auto_161232 ?auto_161237 ) ( ON-TABLE ?auto_161231 ) ( ON ?auto_161234 ?auto_161231 ) ( ON ?auto_161236 ?auto_161234 ) ( not ( = ?auto_161231 ?auto_161234 ) ) ( not ( = ?auto_161231 ?auto_161236 ) ) ( not ( = ?auto_161231 ?auto_161235 ) ) ( not ( = ?auto_161231 ?auto_161233 ) ) ( not ( = ?auto_161234 ?auto_161236 ) ) ( not ( = ?auto_161234 ?auto_161235 ) ) ( not ( = ?auto_161234 ?auto_161233 ) ) ( not ( = ?auto_161236 ?auto_161235 ) ) ( not ( = ?auto_161236 ?auto_161233 ) ) ( not ( = ?auto_161235 ?auto_161233 ) ) ( not ( = ?auto_161230 ?auto_161235 ) ) ( not ( = ?auto_161230 ?auto_161231 ) ) ( not ( = ?auto_161230 ?auto_161234 ) ) ( not ( = ?auto_161230 ?auto_161236 ) ) ( not ( = ?auto_161237 ?auto_161235 ) ) ( not ( = ?auto_161237 ?auto_161231 ) ) ( not ( = ?auto_161237 ?auto_161234 ) ) ( not ( = ?auto_161237 ?auto_161236 ) ) ( not ( = ?auto_161232 ?auto_161235 ) ) ( not ( = ?auto_161232 ?auto_161231 ) ) ( not ( = ?auto_161232 ?auto_161234 ) ) ( not ( = ?auto_161232 ?auto_161236 ) ) ( ON ?auto_161233 ?auto_161232 ) ( CLEAR ?auto_161233 ) ( HOLDING ?auto_161235 ) ( CLEAR ?auto_161236 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161231 ?auto_161234 ?auto_161236 ?auto_161235 )
      ( MAKE-1PILE ?auto_161230 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161238 - BLOCK
    )
    :vars
    (
      ?auto_161242 - BLOCK
      ?auto_161240 - BLOCK
      ?auto_161239 - BLOCK
      ?auto_161241 - BLOCK
      ?auto_161243 - BLOCK
      ?auto_161244 - BLOCK
      ?auto_161245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161242 ?auto_161238 ) ( ON-TABLE ?auto_161238 ) ( not ( = ?auto_161238 ?auto_161242 ) ) ( not ( = ?auto_161238 ?auto_161240 ) ) ( not ( = ?auto_161238 ?auto_161239 ) ) ( not ( = ?auto_161242 ?auto_161240 ) ) ( not ( = ?auto_161242 ?auto_161239 ) ) ( not ( = ?auto_161240 ?auto_161239 ) ) ( ON ?auto_161240 ?auto_161242 ) ( ON-TABLE ?auto_161241 ) ( ON ?auto_161243 ?auto_161241 ) ( ON ?auto_161244 ?auto_161243 ) ( not ( = ?auto_161241 ?auto_161243 ) ) ( not ( = ?auto_161241 ?auto_161244 ) ) ( not ( = ?auto_161241 ?auto_161245 ) ) ( not ( = ?auto_161241 ?auto_161239 ) ) ( not ( = ?auto_161243 ?auto_161244 ) ) ( not ( = ?auto_161243 ?auto_161245 ) ) ( not ( = ?auto_161243 ?auto_161239 ) ) ( not ( = ?auto_161244 ?auto_161245 ) ) ( not ( = ?auto_161244 ?auto_161239 ) ) ( not ( = ?auto_161245 ?auto_161239 ) ) ( not ( = ?auto_161238 ?auto_161245 ) ) ( not ( = ?auto_161238 ?auto_161241 ) ) ( not ( = ?auto_161238 ?auto_161243 ) ) ( not ( = ?auto_161238 ?auto_161244 ) ) ( not ( = ?auto_161242 ?auto_161245 ) ) ( not ( = ?auto_161242 ?auto_161241 ) ) ( not ( = ?auto_161242 ?auto_161243 ) ) ( not ( = ?auto_161242 ?auto_161244 ) ) ( not ( = ?auto_161240 ?auto_161245 ) ) ( not ( = ?auto_161240 ?auto_161241 ) ) ( not ( = ?auto_161240 ?auto_161243 ) ) ( not ( = ?auto_161240 ?auto_161244 ) ) ( ON ?auto_161239 ?auto_161240 ) ( CLEAR ?auto_161244 ) ( ON ?auto_161245 ?auto_161239 ) ( CLEAR ?auto_161245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161238 ?auto_161242 ?auto_161240 ?auto_161239 )
      ( MAKE-1PILE ?auto_161238 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161246 - BLOCK
    )
    :vars
    (
      ?auto_161252 - BLOCK
      ?auto_161249 - BLOCK
      ?auto_161248 - BLOCK
      ?auto_161251 - BLOCK
      ?auto_161253 - BLOCK
      ?auto_161250 - BLOCK
      ?auto_161247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161252 ?auto_161246 ) ( ON-TABLE ?auto_161246 ) ( not ( = ?auto_161246 ?auto_161252 ) ) ( not ( = ?auto_161246 ?auto_161249 ) ) ( not ( = ?auto_161246 ?auto_161248 ) ) ( not ( = ?auto_161252 ?auto_161249 ) ) ( not ( = ?auto_161252 ?auto_161248 ) ) ( not ( = ?auto_161249 ?auto_161248 ) ) ( ON ?auto_161249 ?auto_161252 ) ( ON-TABLE ?auto_161251 ) ( ON ?auto_161253 ?auto_161251 ) ( not ( = ?auto_161251 ?auto_161253 ) ) ( not ( = ?auto_161251 ?auto_161250 ) ) ( not ( = ?auto_161251 ?auto_161247 ) ) ( not ( = ?auto_161251 ?auto_161248 ) ) ( not ( = ?auto_161253 ?auto_161250 ) ) ( not ( = ?auto_161253 ?auto_161247 ) ) ( not ( = ?auto_161253 ?auto_161248 ) ) ( not ( = ?auto_161250 ?auto_161247 ) ) ( not ( = ?auto_161250 ?auto_161248 ) ) ( not ( = ?auto_161247 ?auto_161248 ) ) ( not ( = ?auto_161246 ?auto_161247 ) ) ( not ( = ?auto_161246 ?auto_161251 ) ) ( not ( = ?auto_161246 ?auto_161253 ) ) ( not ( = ?auto_161246 ?auto_161250 ) ) ( not ( = ?auto_161252 ?auto_161247 ) ) ( not ( = ?auto_161252 ?auto_161251 ) ) ( not ( = ?auto_161252 ?auto_161253 ) ) ( not ( = ?auto_161252 ?auto_161250 ) ) ( not ( = ?auto_161249 ?auto_161247 ) ) ( not ( = ?auto_161249 ?auto_161251 ) ) ( not ( = ?auto_161249 ?auto_161253 ) ) ( not ( = ?auto_161249 ?auto_161250 ) ) ( ON ?auto_161248 ?auto_161249 ) ( ON ?auto_161247 ?auto_161248 ) ( CLEAR ?auto_161247 ) ( HOLDING ?auto_161250 ) ( CLEAR ?auto_161253 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161251 ?auto_161253 ?auto_161250 )
      ( MAKE-1PILE ?auto_161246 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161254 - BLOCK
    )
    :vars
    (
      ?auto_161261 - BLOCK
      ?auto_161257 - BLOCK
      ?auto_161255 - BLOCK
      ?auto_161258 - BLOCK
      ?auto_161256 - BLOCK
      ?auto_161260 - BLOCK
      ?auto_161259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161261 ?auto_161254 ) ( ON-TABLE ?auto_161254 ) ( not ( = ?auto_161254 ?auto_161261 ) ) ( not ( = ?auto_161254 ?auto_161257 ) ) ( not ( = ?auto_161254 ?auto_161255 ) ) ( not ( = ?auto_161261 ?auto_161257 ) ) ( not ( = ?auto_161261 ?auto_161255 ) ) ( not ( = ?auto_161257 ?auto_161255 ) ) ( ON ?auto_161257 ?auto_161261 ) ( ON-TABLE ?auto_161258 ) ( ON ?auto_161256 ?auto_161258 ) ( not ( = ?auto_161258 ?auto_161256 ) ) ( not ( = ?auto_161258 ?auto_161260 ) ) ( not ( = ?auto_161258 ?auto_161259 ) ) ( not ( = ?auto_161258 ?auto_161255 ) ) ( not ( = ?auto_161256 ?auto_161260 ) ) ( not ( = ?auto_161256 ?auto_161259 ) ) ( not ( = ?auto_161256 ?auto_161255 ) ) ( not ( = ?auto_161260 ?auto_161259 ) ) ( not ( = ?auto_161260 ?auto_161255 ) ) ( not ( = ?auto_161259 ?auto_161255 ) ) ( not ( = ?auto_161254 ?auto_161259 ) ) ( not ( = ?auto_161254 ?auto_161258 ) ) ( not ( = ?auto_161254 ?auto_161256 ) ) ( not ( = ?auto_161254 ?auto_161260 ) ) ( not ( = ?auto_161261 ?auto_161259 ) ) ( not ( = ?auto_161261 ?auto_161258 ) ) ( not ( = ?auto_161261 ?auto_161256 ) ) ( not ( = ?auto_161261 ?auto_161260 ) ) ( not ( = ?auto_161257 ?auto_161259 ) ) ( not ( = ?auto_161257 ?auto_161258 ) ) ( not ( = ?auto_161257 ?auto_161256 ) ) ( not ( = ?auto_161257 ?auto_161260 ) ) ( ON ?auto_161255 ?auto_161257 ) ( ON ?auto_161259 ?auto_161255 ) ( CLEAR ?auto_161256 ) ( ON ?auto_161260 ?auto_161259 ) ( CLEAR ?auto_161260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161254 ?auto_161261 ?auto_161257 ?auto_161255 ?auto_161259 )
      ( MAKE-1PILE ?auto_161254 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161262 - BLOCK
    )
    :vars
    (
      ?auto_161266 - BLOCK
      ?auto_161263 - BLOCK
      ?auto_161268 - BLOCK
      ?auto_161264 - BLOCK
      ?auto_161269 - BLOCK
      ?auto_161267 - BLOCK
      ?auto_161265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161266 ?auto_161262 ) ( ON-TABLE ?auto_161262 ) ( not ( = ?auto_161262 ?auto_161266 ) ) ( not ( = ?auto_161262 ?auto_161263 ) ) ( not ( = ?auto_161262 ?auto_161268 ) ) ( not ( = ?auto_161266 ?auto_161263 ) ) ( not ( = ?auto_161266 ?auto_161268 ) ) ( not ( = ?auto_161263 ?auto_161268 ) ) ( ON ?auto_161263 ?auto_161266 ) ( ON-TABLE ?auto_161264 ) ( not ( = ?auto_161264 ?auto_161269 ) ) ( not ( = ?auto_161264 ?auto_161267 ) ) ( not ( = ?auto_161264 ?auto_161265 ) ) ( not ( = ?auto_161264 ?auto_161268 ) ) ( not ( = ?auto_161269 ?auto_161267 ) ) ( not ( = ?auto_161269 ?auto_161265 ) ) ( not ( = ?auto_161269 ?auto_161268 ) ) ( not ( = ?auto_161267 ?auto_161265 ) ) ( not ( = ?auto_161267 ?auto_161268 ) ) ( not ( = ?auto_161265 ?auto_161268 ) ) ( not ( = ?auto_161262 ?auto_161265 ) ) ( not ( = ?auto_161262 ?auto_161264 ) ) ( not ( = ?auto_161262 ?auto_161269 ) ) ( not ( = ?auto_161262 ?auto_161267 ) ) ( not ( = ?auto_161266 ?auto_161265 ) ) ( not ( = ?auto_161266 ?auto_161264 ) ) ( not ( = ?auto_161266 ?auto_161269 ) ) ( not ( = ?auto_161266 ?auto_161267 ) ) ( not ( = ?auto_161263 ?auto_161265 ) ) ( not ( = ?auto_161263 ?auto_161264 ) ) ( not ( = ?auto_161263 ?auto_161269 ) ) ( not ( = ?auto_161263 ?auto_161267 ) ) ( ON ?auto_161268 ?auto_161263 ) ( ON ?auto_161265 ?auto_161268 ) ( ON ?auto_161267 ?auto_161265 ) ( CLEAR ?auto_161267 ) ( HOLDING ?auto_161269 ) ( CLEAR ?auto_161264 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161264 ?auto_161269 )
      ( MAKE-1PILE ?auto_161262 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161270 - BLOCK
    )
    :vars
    (
      ?auto_161275 - BLOCK
      ?auto_161277 - BLOCK
      ?auto_161273 - BLOCK
      ?auto_161274 - BLOCK
      ?auto_161272 - BLOCK
      ?auto_161276 - BLOCK
      ?auto_161271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161275 ?auto_161270 ) ( ON-TABLE ?auto_161270 ) ( not ( = ?auto_161270 ?auto_161275 ) ) ( not ( = ?auto_161270 ?auto_161277 ) ) ( not ( = ?auto_161270 ?auto_161273 ) ) ( not ( = ?auto_161275 ?auto_161277 ) ) ( not ( = ?auto_161275 ?auto_161273 ) ) ( not ( = ?auto_161277 ?auto_161273 ) ) ( ON ?auto_161277 ?auto_161275 ) ( ON-TABLE ?auto_161274 ) ( not ( = ?auto_161274 ?auto_161272 ) ) ( not ( = ?auto_161274 ?auto_161276 ) ) ( not ( = ?auto_161274 ?auto_161271 ) ) ( not ( = ?auto_161274 ?auto_161273 ) ) ( not ( = ?auto_161272 ?auto_161276 ) ) ( not ( = ?auto_161272 ?auto_161271 ) ) ( not ( = ?auto_161272 ?auto_161273 ) ) ( not ( = ?auto_161276 ?auto_161271 ) ) ( not ( = ?auto_161276 ?auto_161273 ) ) ( not ( = ?auto_161271 ?auto_161273 ) ) ( not ( = ?auto_161270 ?auto_161271 ) ) ( not ( = ?auto_161270 ?auto_161274 ) ) ( not ( = ?auto_161270 ?auto_161272 ) ) ( not ( = ?auto_161270 ?auto_161276 ) ) ( not ( = ?auto_161275 ?auto_161271 ) ) ( not ( = ?auto_161275 ?auto_161274 ) ) ( not ( = ?auto_161275 ?auto_161272 ) ) ( not ( = ?auto_161275 ?auto_161276 ) ) ( not ( = ?auto_161277 ?auto_161271 ) ) ( not ( = ?auto_161277 ?auto_161274 ) ) ( not ( = ?auto_161277 ?auto_161272 ) ) ( not ( = ?auto_161277 ?auto_161276 ) ) ( ON ?auto_161273 ?auto_161277 ) ( ON ?auto_161271 ?auto_161273 ) ( ON ?auto_161276 ?auto_161271 ) ( CLEAR ?auto_161274 ) ( ON ?auto_161272 ?auto_161276 ) ( CLEAR ?auto_161272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161270 ?auto_161275 ?auto_161277 ?auto_161273 ?auto_161271 ?auto_161276 )
      ( MAKE-1PILE ?auto_161270 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161278 - BLOCK
    )
    :vars
    (
      ?auto_161283 - BLOCK
      ?auto_161285 - BLOCK
      ?auto_161284 - BLOCK
      ?auto_161279 - BLOCK
      ?auto_161280 - BLOCK
      ?auto_161281 - BLOCK
      ?auto_161282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161283 ?auto_161278 ) ( ON-TABLE ?auto_161278 ) ( not ( = ?auto_161278 ?auto_161283 ) ) ( not ( = ?auto_161278 ?auto_161285 ) ) ( not ( = ?auto_161278 ?auto_161284 ) ) ( not ( = ?auto_161283 ?auto_161285 ) ) ( not ( = ?auto_161283 ?auto_161284 ) ) ( not ( = ?auto_161285 ?auto_161284 ) ) ( ON ?auto_161285 ?auto_161283 ) ( not ( = ?auto_161279 ?auto_161280 ) ) ( not ( = ?auto_161279 ?auto_161281 ) ) ( not ( = ?auto_161279 ?auto_161282 ) ) ( not ( = ?auto_161279 ?auto_161284 ) ) ( not ( = ?auto_161280 ?auto_161281 ) ) ( not ( = ?auto_161280 ?auto_161282 ) ) ( not ( = ?auto_161280 ?auto_161284 ) ) ( not ( = ?auto_161281 ?auto_161282 ) ) ( not ( = ?auto_161281 ?auto_161284 ) ) ( not ( = ?auto_161282 ?auto_161284 ) ) ( not ( = ?auto_161278 ?auto_161282 ) ) ( not ( = ?auto_161278 ?auto_161279 ) ) ( not ( = ?auto_161278 ?auto_161280 ) ) ( not ( = ?auto_161278 ?auto_161281 ) ) ( not ( = ?auto_161283 ?auto_161282 ) ) ( not ( = ?auto_161283 ?auto_161279 ) ) ( not ( = ?auto_161283 ?auto_161280 ) ) ( not ( = ?auto_161283 ?auto_161281 ) ) ( not ( = ?auto_161285 ?auto_161282 ) ) ( not ( = ?auto_161285 ?auto_161279 ) ) ( not ( = ?auto_161285 ?auto_161280 ) ) ( not ( = ?auto_161285 ?auto_161281 ) ) ( ON ?auto_161284 ?auto_161285 ) ( ON ?auto_161282 ?auto_161284 ) ( ON ?auto_161281 ?auto_161282 ) ( ON ?auto_161280 ?auto_161281 ) ( CLEAR ?auto_161280 ) ( HOLDING ?auto_161279 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161279 )
      ( MAKE-1PILE ?auto_161278 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161295 - BLOCK
    )
    :vars
    (
      ?auto_161298 - BLOCK
      ?auto_161299 - BLOCK
      ?auto_161302 - BLOCK
      ?auto_161301 - BLOCK
      ?auto_161296 - BLOCK
      ?auto_161297 - BLOCK
      ?auto_161300 - BLOCK
      ?auto_161303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161298 ?auto_161295 ) ( ON-TABLE ?auto_161295 ) ( not ( = ?auto_161295 ?auto_161298 ) ) ( not ( = ?auto_161295 ?auto_161299 ) ) ( not ( = ?auto_161295 ?auto_161302 ) ) ( not ( = ?auto_161298 ?auto_161299 ) ) ( not ( = ?auto_161298 ?auto_161302 ) ) ( not ( = ?auto_161299 ?auto_161302 ) ) ( ON ?auto_161299 ?auto_161298 ) ( not ( = ?auto_161301 ?auto_161296 ) ) ( not ( = ?auto_161301 ?auto_161297 ) ) ( not ( = ?auto_161301 ?auto_161300 ) ) ( not ( = ?auto_161301 ?auto_161302 ) ) ( not ( = ?auto_161296 ?auto_161297 ) ) ( not ( = ?auto_161296 ?auto_161300 ) ) ( not ( = ?auto_161296 ?auto_161302 ) ) ( not ( = ?auto_161297 ?auto_161300 ) ) ( not ( = ?auto_161297 ?auto_161302 ) ) ( not ( = ?auto_161300 ?auto_161302 ) ) ( not ( = ?auto_161295 ?auto_161300 ) ) ( not ( = ?auto_161295 ?auto_161301 ) ) ( not ( = ?auto_161295 ?auto_161296 ) ) ( not ( = ?auto_161295 ?auto_161297 ) ) ( not ( = ?auto_161298 ?auto_161300 ) ) ( not ( = ?auto_161298 ?auto_161301 ) ) ( not ( = ?auto_161298 ?auto_161296 ) ) ( not ( = ?auto_161298 ?auto_161297 ) ) ( not ( = ?auto_161299 ?auto_161300 ) ) ( not ( = ?auto_161299 ?auto_161301 ) ) ( not ( = ?auto_161299 ?auto_161296 ) ) ( not ( = ?auto_161299 ?auto_161297 ) ) ( ON ?auto_161302 ?auto_161299 ) ( ON ?auto_161300 ?auto_161302 ) ( ON ?auto_161297 ?auto_161300 ) ( ON ?auto_161296 ?auto_161297 ) ( CLEAR ?auto_161296 ) ( ON ?auto_161301 ?auto_161303 ) ( CLEAR ?auto_161301 ) ( HAND-EMPTY ) ( not ( = ?auto_161295 ?auto_161303 ) ) ( not ( = ?auto_161298 ?auto_161303 ) ) ( not ( = ?auto_161299 ?auto_161303 ) ) ( not ( = ?auto_161302 ?auto_161303 ) ) ( not ( = ?auto_161301 ?auto_161303 ) ) ( not ( = ?auto_161296 ?auto_161303 ) ) ( not ( = ?auto_161297 ?auto_161303 ) ) ( not ( = ?auto_161300 ?auto_161303 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161301 ?auto_161303 )
      ( MAKE-1PILE ?auto_161295 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161304 - BLOCK
    )
    :vars
    (
      ?auto_161311 - BLOCK
      ?auto_161309 - BLOCK
      ?auto_161310 - BLOCK
      ?auto_161308 - BLOCK
      ?auto_161306 - BLOCK
      ?auto_161312 - BLOCK
      ?auto_161307 - BLOCK
      ?auto_161305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161311 ?auto_161304 ) ( ON-TABLE ?auto_161304 ) ( not ( = ?auto_161304 ?auto_161311 ) ) ( not ( = ?auto_161304 ?auto_161309 ) ) ( not ( = ?auto_161304 ?auto_161310 ) ) ( not ( = ?auto_161311 ?auto_161309 ) ) ( not ( = ?auto_161311 ?auto_161310 ) ) ( not ( = ?auto_161309 ?auto_161310 ) ) ( ON ?auto_161309 ?auto_161311 ) ( not ( = ?auto_161308 ?auto_161306 ) ) ( not ( = ?auto_161308 ?auto_161312 ) ) ( not ( = ?auto_161308 ?auto_161307 ) ) ( not ( = ?auto_161308 ?auto_161310 ) ) ( not ( = ?auto_161306 ?auto_161312 ) ) ( not ( = ?auto_161306 ?auto_161307 ) ) ( not ( = ?auto_161306 ?auto_161310 ) ) ( not ( = ?auto_161312 ?auto_161307 ) ) ( not ( = ?auto_161312 ?auto_161310 ) ) ( not ( = ?auto_161307 ?auto_161310 ) ) ( not ( = ?auto_161304 ?auto_161307 ) ) ( not ( = ?auto_161304 ?auto_161308 ) ) ( not ( = ?auto_161304 ?auto_161306 ) ) ( not ( = ?auto_161304 ?auto_161312 ) ) ( not ( = ?auto_161311 ?auto_161307 ) ) ( not ( = ?auto_161311 ?auto_161308 ) ) ( not ( = ?auto_161311 ?auto_161306 ) ) ( not ( = ?auto_161311 ?auto_161312 ) ) ( not ( = ?auto_161309 ?auto_161307 ) ) ( not ( = ?auto_161309 ?auto_161308 ) ) ( not ( = ?auto_161309 ?auto_161306 ) ) ( not ( = ?auto_161309 ?auto_161312 ) ) ( ON ?auto_161310 ?auto_161309 ) ( ON ?auto_161307 ?auto_161310 ) ( ON ?auto_161312 ?auto_161307 ) ( ON ?auto_161308 ?auto_161305 ) ( CLEAR ?auto_161308 ) ( not ( = ?auto_161304 ?auto_161305 ) ) ( not ( = ?auto_161311 ?auto_161305 ) ) ( not ( = ?auto_161309 ?auto_161305 ) ) ( not ( = ?auto_161310 ?auto_161305 ) ) ( not ( = ?auto_161308 ?auto_161305 ) ) ( not ( = ?auto_161306 ?auto_161305 ) ) ( not ( = ?auto_161312 ?auto_161305 ) ) ( not ( = ?auto_161307 ?auto_161305 ) ) ( HOLDING ?auto_161306 ) ( CLEAR ?auto_161312 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_161304 ?auto_161311 ?auto_161309 ?auto_161310 ?auto_161307 ?auto_161312 ?auto_161306 )
      ( MAKE-1PILE ?auto_161304 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161313 - BLOCK
    )
    :vars
    (
      ?auto_161314 - BLOCK
      ?auto_161315 - BLOCK
      ?auto_161319 - BLOCK
      ?auto_161320 - BLOCK
      ?auto_161318 - BLOCK
      ?auto_161317 - BLOCK
      ?auto_161321 - BLOCK
      ?auto_161316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161314 ?auto_161313 ) ( ON-TABLE ?auto_161313 ) ( not ( = ?auto_161313 ?auto_161314 ) ) ( not ( = ?auto_161313 ?auto_161315 ) ) ( not ( = ?auto_161313 ?auto_161319 ) ) ( not ( = ?auto_161314 ?auto_161315 ) ) ( not ( = ?auto_161314 ?auto_161319 ) ) ( not ( = ?auto_161315 ?auto_161319 ) ) ( ON ?auto_161315 ?auto_161314 ) ( not ( = ?auto_161320 ?auto_161318 ) ) ( not ( = ?auto_161320 ?auto_161317 ) ) ( not ( = ?auto_161320 ?auto_161321 ) ) ( not ( = ?auto_161320 ?auto_161319 ) ) ( not ( = ?auto_161318 ?auto_161317 ) ) ( not ( = ?auto_161318 ?auto_161321 ) ) ( not ( = ?auto_161318 ?auto_161319 ) ) ( not ( = ?auto_161317 ?auto_161321 ) ) ( not ( = ?auto_161317 ?auto_161319 ) ) ( not ( = ?auto_161321 ?auto_161319 ) ) ( not ( = ?auto_161313 ?auto_161321 ) ) ( not ( = ?auto_161313 ?auto_161320 ) ) ( not ( = ?auto_161313 ?auto_161318 ) ) ( not ( = ?auto_161313 ?auto_161317 ) ) ( not ( = ?auto_161314 ?auto_161321 ) ) ( not ( = ?auto_161314 ?auto_161320 ) ) ( not ( = ?auto_161314 ?auto_161318 ) ) ( not ( = ?auto_161314 ?auto_161317 ) ) ( not ( = ?auto_161315 ?auto_161321 ) ) ( not ( = ?auto_161315 ?auto_161320 ) ) ( not ( = ?auto_161315 ?auto_161318 ) ) ( not ( = ?auto_161315 ?auto_161317 ) ) ( ON ?auto_161319 ?auto_161315 ) ( ON ?auto_161321 ?auto_161319 ) ( ON ?auto_161317 ?auto_161321 ) ( ON ?auto_161320 ?auto_161316 ) ( not ( = ?auto_161313 ?auto_161316 ) ) ( not ( = ?auto_161314 ?auto_161316 ) ) ( not ( = ?auto_161315 ?auto_161316 ) ) ( not ( = ?auto_161319 ?auto_161316 ) ) ( not ( = ?auto_161320 ?auto_161316 ) ) ( not ( = ?auto_161318 ?auto_161316 ) ) ( not ( = ?auto_161317 ?auto_161316 ) ) ( not ( = ?auto_161321 ?auto_161316 ) ) ( CLEAR ?auto_161317 ) ( ON ?auto_161318 ?auto_161320 ) ( CLEAR ?auto_161318 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161316 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161316 ?auto_161320 )
      ( MAKE-1PILE ?auto_161313 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161322 - BLOCK
    )
    :vars
    (
      ?auto_161330 - BLOCK
      ?auto_161324 - BLOCK
      ?auto_161327 - BLOCK
      ?auto_161323 - BLOCK
      ?auto_161328 - BLOCK
      ?auto_161329 - BLOCK
      ?auto_161325 - BLOCK
      ?auto_161326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161330 ?auto_161322 ) ( ON-TABLE ?auto_161322 ) ( not ( = ?auto_161322 ?auto_161330 ) ) ( not ( = ?auto_161322 ?auto_161324 ) ) ( not ( = ?auto_161322 ?auto_161327 ) ) ( not ( = ?auto_161330 ?auto_161324 ) ) ( not ( = ?auto_161330 ?auto_161327 ) ) ( not ( = ?auto_161324 ?auto_161327 ) ) ( ON ?auto_161324 ?auto_161330 ) ( not ( = ?auto_161323 ?auto_161328 ) ) ( not ( = ?auto_161323 ?auto_161329 ) ) ( not ( = ?auto_161323 ?auto_161325 ) ) ( not ( = ?auto_161323 ?auto_161327 ) ) ( not ( = ?auto_161328 ?auto_161329 ) ) ( not ( = ?auto_161328 ?auto_161325 ) ) ( not ( = ?auto_161328 ?auto_161327 ) ) ( not ( = ?auto_161329 ?auto_161325 ) ) ( not ( = ?auto_161329 ?auto_161327 ) ) ( not ( = ?auto_161325 ?auto_161327 ) ) ( not ( = ?auto_161322 ?auto_161325 ) ) ( not ( = ?auto_161322 ?auto_161323 ) ) ( not ( = ?auto_161322 ?auto_161328 ) ) ( not ( = ?auto_161322 ?auto_161329 ) ) ( not ( = ?auto_161330 ?auto_161325 ) ) ( not ( = ?auto_161330 ?auto_161323 ) ) ( not ( = ?auto_161330 ?auto_161328 ) ) ( not ( = ?auto_161330 ?auto_161329 ) ) ( not ( = ?auto_161324 ?auto_161325 ) ) ( not ( = ?auto_161324 ?auto_161323 ) ) ( not ( = ?auto_161324 ?auto_161328 ) ) ( not ( = ?auto_161324 ?auto_161329 ) ) ( ON ?auto_161327 ?auto_161324 ) ( ON ?auto_161325 ?auto_161327 ) ( ON ?auto_161323 ?auto_161326 ) ( not ( = ?auto_161322 ?auto_161326 ) ) ( not ( = ?auto_161330 ?auto_161326 ) ) ( not ( = ?auto_161324 ?auto_161326 ) ) ( not ( = ?auto_161327 ?auto_161326 ) ) ( not ( = ?auto_161323 ?auto_161326 ) ) ( not ( = ?auto_161328 ?auto_161326 ) ) ( not ( = ?auto_161329 ?auto_161326 ) ) ( not ( = ?auto_161325 ?auto_161326 ) ) ( ON ?auto_161328 ?auto_161323 ) ( CLEAR ?auto_161328 ) ( ON-TABLE ?auto_161326 ) ( HOLDING ?auto_161329 ) ( CLEAR ?auto_161325 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161322 ?auto_161330 ?auto_161324 ?auto_161327 ?auto_161325 ?auto_161329 )
      ( MAKE-1PILE ?auto_161322 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161331 - BLOCK
    )
    :vars
    (
      ?auto_161333 - BLOCK
      ?auto_161337 - BLOCK
      ?auto_161338 - BLOCK
      ?auto_161335 - BLOCK
      ?auto_161334 - BLOCK
      ?auto_161339 - BLOCK
      ?auto_161336 - BLOCK
      ?auto_161332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161333 ?auto_161331 ) ( ON-TABLE ?auto_161331 ) ( not ( = ?auto_161331 ?auto_161333 ) ) ( not ( = ?auto_161331 ?auto_161337 ) ) ( not ( = ?auto_161331 ?auto_161338 ) ) ( not ( = ?auto_161333 ?auto_161337 ) ) ( not ( = ?auto_161333 ?auto_161338 ) ) ( not ( = ?auto_161337 ?auto_161338 ) ) ( ON ?auto_161337 ?auto_161333 ) ( not ( = ?auto_161335 ?auto_161334 ) ) ( not ( = ?auto_161335 ?auto_161339 ) ) ( not ( = ?auto_161335 ?auto_161336 ) ) ( not ( = ?auto_161335 ?auto_161338 ) ) ( not ( = ?auto_161334 ?auto_161339 ) ) ( not ( = ?auto_161334 ?auto_161336 ) ) ( not ( = ?auto_161334 ?auto_161338 ) ) ( not ( = ?auto_161339 ?auto_161336 ) ) ( not ( = ?auto_161339 ?auto_161338 ) ) ( not ( = ?auto_161336 ?auto_161338 ) ) ( not ( = ?auto_161331 ?auto_161336 ) ) ( not ( = ?auto_161331 ?auto_161335 ) ) ( not ( = ?auto_161331 ?auto_161334 ) ) ( not ( = ?auto_161331 ?auto_161339 ) ) ( not ( = ?auto_161333 ?auto_161336 ) ) ( not ( = ?auto_161333 ?auto_161335 ) ) ( not ( = ?auto_161333 ?auto_161334 ) ) ( not ( = ?auto_161333 ?auto_161339 ) ) ( not ( = ?auto_161337 ?auto_161336 ) ) ( not ( = ?auto_161337 ?auto_161335 ) ) ( not ( = ?auto_161337 ?auto_161334 ) ) ( not ( = ?auto_161337 ?auto_161339 ) ) ( ON ?auto_161338 ?auto_161337 ) ( ON ?auto_161336 ?auto_161338 ) ( ON ?auto_161335 ?auto_161332 ) ( not ( = ?auto_161331 ?auto_161332 ) ) ( not ( = ?auto_161333 ?auto_161332 ) ) ( not ( = ?auto_161337 ?auto_161332 ) ) ( not ( = ?auto_161338 ?auto_161332 ) ) ( not ( = ?auto_161335 ?auto_161332 ) ) ( not ( = ?auto_161334 ?auto_161332 ) ) ( not ( = ?auto_161339 ?auto_161332 ) ) ( not ( = ?auto_161336 ?auto_161332 ) ) ( ON ?auto_161334 ?auto_161335 ) ( ON-TABLE ?auto_161332 ) ( CLEAR ?auto_161336 ) ( ON ?auto_161339 ?auto_161334 ) ( CLEAR ?auto_161339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161332 ?auto_161335 ?auto_161334 )
      ( MAKE-1PILE ?auto_161331 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161383 - BLOCK
      ?auto_161384 - BLOCK
      ?auto_161385 - BLOCK
      ?auto_161386 - BLOCK
      ?auto_161387 - BLOCK
      ?auto_161388 - BLOCK
      ?auto_161389 - BLOCK
    )
    :vars
    (
      ?auto_161390 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161383 ) ( ON ?auto_161384 ?auto_161383 ) ( ON ?auto_161385 ?auto_161384 ) ( ON ?auto_161386 ?auto_161385 ) ( ON ?auto_161387 ?auto_161386 ) ( not ( = ?auto_161383 ?auto_161384 ) ) ( not ( = ?auto_161383 ?auto_161385 ) ) ( not ( = ?auto_161383 ?auto_161386 ) ) ( not ( = ?auto_161383 ?auto_161387 ) ) ( not ( = ?auto_161383 ?auto_161388 ) ) ( not ( = ?auto_161383 ?auto_161389 ) ) ( not ( = ?auto_161384 ?auto_161385 ) ) ( not ( = ?auto_161384 ?auto_161386 ) ) ( not ( = ?auto_161384 ?auto_161387 ) ) ( not ( = ?auto_161384 ?auto_161388 ) ) ( not ( = ?auto_161384 ?auto_161389 ) ) ( not ( = ?auto_161385 ?auto_161386 ) ) ( not ( = ?auto_161385 ?auto_161387 ) ) ( not ( = ?auto_161385 ?auto_161388 ) ) ( not ( = ?auto_161385 ?auto_161389 ) ) ( not ( = ?auto_161386 ?auto_161387 ) ) ( not ( = ?auto_161386 ?auto_161388 ) ) ( not ( = ?auto_161386 ?auto_161389 ) ) ( not ( = ?auto_161387 ?auto_161388 ) ) ( not ( = ?auto_161387 ?auto_161389 ) ) ( not ( = ?auto_161388 ?auto_161389 ) ) ( ON ?auto_161389 ?auto_161390 ) ( not ( = ?auto_161383 ?auto_161390 ) ) ( not ( = ?auto_161384 ?auto_161390 ) ) ( not ( = ?auto_161385 ?auto_161390 ) ) ( not ( = ?auto_161386 ?auto_161390 ) ) ( not ( = ?auto_161387 ?auto_161390 ) ) ( not ( = ?auto_161388 ?auto_161390 ) ) ( not ( = ?auto_161389 ?auto_161390 ) ) ( CLEAR ?auto_161387 ) ( ON ?auto_161388 ?auto_161389 ) ( CLEAR ?auto_161388 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161390 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161390 ?auto_161389 )
      ( MAKE-7PILE ?auto_161383 ?auto_161384 ?auto_161385 ?auto_161386 ?auto_161387 ?auto_161388 ?auto_161389 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161391 - BLOCK
      ?auto_161392 - BLOCK
      ?auto_161393 - BLOCK
      ?auto_161394 - BLOCK
      ?auto_161395 - BLOCK
      ?auto_161396 - BLOCK
      ?auto_161397 - BLOCK
    )
    :vars
    (
      ?auto_161398 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161391 ) ( ON ?auto_161392 ?auto_161391 ) ( ON ?auto_161393 ?auto_161392 ) ( ON ?auto_161394 ?auto_161393 ) ( not ( = ?auto_161391 ?auto_161392 ) ) ( not ( = ?auto_161391 ?auto_161393 ) ) ( not ( = ?auto_161391 ?auto_161394 ) ) ( not ( = ?auto_161391 ?auto_161395 ) ) ( not ( = ?auto_161391 ?auto_161396 ) ) ( not ( = ?auto_161391 ?auto_161397 ) ) ( not ( = ?auto_161392 ?auto_161393 ) ) ( not ( = ?auto_161392 ?auto_161394 ) ) ( not ( = ?auto_161392 ?auto_161395 ) ) ( not ( = ?auto_161392 ?auto_161396 ) ) ( not ( = ?auto_161392 ?auto_161397 ) ) ( not ( = ?auto_161393 ?auto_161394 ) ) ( not ( = ?auto_161393 ?auto_161395 ) ) ( not ( = ?auto_161393 ?auto_161396 ) ) ( not ( = ?auto_161393 ?auto_161397 ) ) ( not ( = ?auto_161394 ?auto_161395 ) ) ( not ( = ?auto_161394 ?auto_161396 ) ) ( not ( = ?auto_161394 ?auto_161397 ) ) ( not ( = ?auto_161395 ?auto_161396 ) ) ( not ( = ?auto_161395 ?auto_161397 ) ) ( not ( = ?auto_161396 ?auto_161397 ) ) ( ON ?auto_161397 ?auto_161398 ) ( not ( = ?auto_161391 ?auto_161398 ) ) ( not ( = ?auto_161392 ?auto_161398 ) ) ( not ( = ?auto_161393 ?auto_161398 ) ) ( not ( = ?auto_161394 ?auto_161398 ) ) ( not ( = ?auto_161395 ?auto_161398 ) ) ( not ( = ?auto_161396 ?auto_161398 ) ) ( not ( = ?auto_161397 ?auto_161398 ) ) ( ON ?auto_161396 ?auto_161397 ) ( CLEAR ?auto_161396 ) ( ON-TABLE ?auto_161398 ) ( HOLDING ?auto_161395 ) ( CLEAR ?auto_161394 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161391 ?auto_161392 ?auto_161393 ?auto_161394 ?auto_161395 )
      ( MAKE-7PILE ?auto_161391 ?auto_161392 ?auto_161393 ?auto_161394 ?auto_161395 ?auto_161396 ?auto_161397 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161399 - BLOCK
      ?auto_161400 - BLOCK
      ?auto_161401 - BLOCK
      ?auto_161402 - BLOCK
      ?auto_161403 - BLOCK
      ?auto_161404 - BLOCK
      ?auto_161405 - BLOCK
    )
    :vars
    (
      ?auto_161406 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161399 ) ( ON ?auto_161400 ?auto_161399 ) ( ON ?auto_161401 ?auto_161400 ) ( ON ?auto_161402 ?auto_161401 ) ( not ( = ?auto_161399 ?auto_161400 ) ) ( not ( = ?auto_161399 ?auto_161401 ) ) ( not ( = ?auto_161399 ?auto_161402 ) ) ( not ( = ?auto_161399 ?auto_161403 ) ) ( not ( = ?auto_161399 ?auto_161404 ) ) ( not ( = ?auto_161399 ?auto_161405 ) ) ( not ( = ?auto_161400 ?auto_161401 ) ) ( not ( = ?auto_161400 ?auto_161402 ) ) ( not ( = ?auto_161400 ?auto_161403 ) ) ( not ( = ?auto_161400 ?auto_161404 ) ) ( not ( = ?auto_161400 ?auto_161405 ) ) ( not ( = ?auto_161401 ?auto_161402 ) ) ( not ( = ?auto_161401 ?auto_161403 ) ) ( not ( = ?auto_161401 ?auto_161404 ) ) ( not ( = ?auto_161401 ?auto_161405 ) ) ( not ( = ?auto_161402 ?auto_161403 ) ) ( not ( = ?auto_161402 ?auto_161404 ) ) ( not ( = ?auto_161402 ?auto_161405 ) ) ( not ( = ?auto_161403 ?auto_161404 ) ) ( not ( = ?auto_161403 ?auto_161405 ) ) ( not ( = ?auto_161404 ?auto_161405 ) ) ( ON ?auto_161405 ?auto_161406 ) ( not ( = ?auto_161399 ?auto_161406 ) ) ( not ( = ?auto_161400 ?auto_161406 ) ) ( not ( = ?auto_161401 ?auto_161406 ) ) ( not ( = ?auto_161402 ?auto_161406 ) ) ( not ( = ?auto_161403 ?auto_161406 ) ) ( not ( = ?auto_161404 ?auto_161406 ) ) ( not ( = ?auto_161405 ?auto_161406 ) ) ( ON ?auto_161404 ?auto_161405 ) ( ON-TABLE ?auto_161406 ) ( CLEAR ?auto_161402 ) ( ON ?auto_161403 ?auto_161404 ) ( CLEAR ?auto_161403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161406 ?auto_161405 ?auto_161404 )
      ( MAKE-7PILE ?auto_161399 ?auto_161400 ?auto_161401 ?auto_161402 ?auto_161403 ?auto_161404 ?auto_161405 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161407 - BLOCK
      ?auto_161408 - BLOCK
      ?auto_161409 - BLOCK
      ?auto_161410 - BLOCK
      ?auto_161411 - BLOCK
      ?auto_161412 - BLOCK
      ?auto_161413 - BLOCK
    )
    :vars
    (
      ?auto_161414 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161407 ) ( ON ?auto_161408 ?auto_161407 ) ( ON ?auto_161409 ?auto_161408 ) ( not ( = ?auto_161407 ?auto_161408 ) ) ( not ( = ?auto_161407 ?auto_161409 ) ) ( not ( = ?auto_161407 ?auto_161410 ) ) ( not ( = ?auto_161407 ?auto_161411 ) ) ( not ( = ?auto_161407 ?auto_161412 ) ) ( not ( = ?auto_161407 ?auto_161413 ) ) ( not ( = ?auto_161408 ?auto_161409 ) ) ( not ( = ?auto_161408 ?auto_161410 ) ) ( not ( = ?auto_161408 ?auto_161411 ) ) ( not ( = ?auto_161408 ?auto_161412 ) ) ( not ( = ?auto_161408 ?auto_161413 ) ) ( not ( = ?auto_161409 ?auto_161410 ) ) ( not ( = ?auto_161409 ?auto_161411 ) ) ( not ( = ?auto_161409 ?auto_161412 ) ) ( not ( = ?auto_161409 ?auto_161413 ) ) ( not ( = ?auto_161410 ?auto_161411 ) ) ( not ( = ?auto_161410 ?auto_161412 ) ) ( not ( = ?auto_161410 ?auto_161413 ) ) ( not ( = ?auto_161411 ?auto_161412 ) ) ( not ( = ?auto_161411 ?auto_161413 ) ) ( not ( = ?auto_161412 ?auto_161413 ) ) ( ON ?auto_161413 ?auto_161414 ) ( not ( = ?auto_161407 ?auto_161414 ) ) ( not ( = ?auto_161408 ?auto_161414 ) ) ( not ( = ?auto_161409 ?auto_161414 ) ) ( not ( = ?auto_161410 ?auto_161414 ) ) ( not ( = ?auto_161411 ?auto_161414 ) ) ( not ( = ?auto_161412 ?auto_161414 ) ) ( not ( = ?auto_161413 ?auto_161414 ) ) ( ON ?auto_161412 ?auto_161413 ) ( ON-TABLE ?auto_161414 ) ( ON ?auto_161411 ?auto_161412 ) ( CLEAR ?auto_161411 ) ( HOLDING ?auto_161410 ) ( CLEAR ?auto_161409 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161407 ?auto_161408 ?auto_161409 ?auto_161410 )
      ( MAKE-7PILE ?auto_161407 ?auto_161408 ?auto_161409 ?auto_161410 ?auto_161411 ?auto_161412 ?auto_161413 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161415 - BLOCK
      ?auto_161416 - BLOCK
      ?auto_161417 - BLOCK
      ?auto_161418 - BLOCK
      ?auto_161419 - BLOCK
      ?auto_161420 - BLOCK
      ?auto_161421 - BLOCK
    )
    :vars
    (
      ?auto_161422 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161415 ) ( ON ?auto_161416 ?auto_161415 ) ( ON ?auto_161417 ?auto_161416 ) ( not ( = ?auto_161415 ?auto_161416 ) ) ( not ( = ?auto_161415 ?auto_161417 ) ) ( not ( = ?auto_161415 ?auto_161418 ) ) ( not ( = ?auto_161415 ?auto_161419 ) ) ( not ( = ?auto_161415 ?auto_161420 ) ) ( not ( = ?auto_161415 ?auto_161421 ) ) ( not ( = ?auto_161416 ?auto_161417 ) ) ( not ( = ?auto_161416 ?auto_161418 ) ) ( not ( = ?auto_161416 ?auto_161419 ) ) ( not ( = ?auto_161416 ?auto_161420 ) ) ( not ( = ?auto_161416 ?auto_161421 ) ) ( not ( = ?auto_161417 ?auto_161418 ) ) ( not ( = ?auto_161417 ?auto_161419 ) ) ( not ( = ?auto_161417 ?auto_161420 ) ) ( not ( = ?auto_161417 ?auto_161421 ) ) ( not ( = ?auto_161418 ?auto_161419 ) ) ( not ( = ?auto_161418 ?auto_161420 ) ) ( not ( = ?auto_161418 ?auto_161421 ) ) ( not ( = ?auto_161419 ?auto_161420 ) ) ( not ( = ?auto_161419 ?auto_161421 ) ) ( not ( = ?auto_161420 ?auto_161421 ) ) ( ON ?auto_161421 ?auto_161422 ) ( not ( = ?auto_161415 ?auto_161422 ) ) ( not ( = ?auto_161416 ?auto_161422 ) ) ( not ( = ?auto_161417 ?auto_161422 ) ) ( not ( = ?auto_161418 ?auto_161422 ) ) ( not ( = ?auto_161419 ?auto_161422 ) ) ( not ( = ?auto_161420 ?auto_161422 ) ) ( not ( = ?auto_161421 ?auto_161422 ) ) ( ON ?auto_161420 ?auto_161421 ) ( ON-TABLE ?auto_161422 ) ( ON ?auto_161419 ?auto_161420 ) ( CLEAR ?auto_161417 ) ( ON ?auto_161418 ?auto_161419 ) ( CLEAR ?auto_161418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161422 ?auto_161421 ?auto_161420 ?auto_161419 )
      ( MAKE-7PILE ?auto_161415 ?auto_161416 ?auto_161417 ?auto_161418 ?auto_161419 ?auto_161420 ?auto_161421 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161423 - BLOCK
      ?auto_161424 - BLOCK
      ?auto_161425 - BLOCK
      ?auto_161426 - BLOCK
      ?auto_161427 - BLOCK
      ?auto_161428 - BLOCK
      ?auto_161429 - BLOCK
    )
    :vars
    (
      ?auto_161430 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161423 ) ( ON ?auto_161424 ?auto_161423 ) ( not ( = ?auto_161423 ?auto_161424 ) ) ( not ( = ?auto_161423 ?auto_161425 ) ) ( not ( = ?auto_161423 ?auto_161426 ) ) ( not ( = ?auto_161423 ?auto_161427 ) ) ( not ( = ?auto_161423 ?auto_161428 ) ) ( not ( = ?auto_161423 ?auto_161429 ) ) ( not ( = ?auto_161424 ?auto_161425 ) ) ( not ( = ?auto_161424 ?auto_161426 ) ) ( not ( = ?auto_161424 ?auto_161427 ) ) ( not ( = ?auto_161424 ?auto_161428 ) ) ( not ( = ?auto_161424 ?auto_161429 ) ) ( not ( = ?auto_161425 ?auto_161426 ) ) ( not ( = ?auto_161425 ?auto_161427 ) ) ( not ( = ?auto_161425 ?auto_161428 ) ) ( not ( = ?auto_161425 ?auto_161429 ) ) ( not ( = ?auto_161426 ?auto_161427 ) ) ( not ( = ?auto_161426 ?auto_161428 ) ) ( not ( = ?auto_161426 ?auto_161429 ) ) ( not ( = ?auto_161427 ?auto_161428 ) ) ( not ( = ?auto_161427 ?auto_161429 ) ) ( not ( = ?auto_161428 ?auto_161429 ) ) ( ON ?auto_161429 ?auto_161430 ) ( not ( = ?auto_161423 ?auto_161430 ) ) ( not ( = ?auto_161424 ?auto_161430 ) ) ( not ( = ?auto_161425 ?auto_161430 ) ) ( not ( = ?auto_161426 ?auto_161430 ) ) ( not ( = ?auto_161427 ?auto_161430 ) ) ( not ( = ?auto_161428 ?auto_161430 ) ) ( not ( = ?auto_161429 ?auto_161430 ) ) ( ON ?auto_161428 ?auto_161429 ) ( ON-TABLE ?auto_161430 ) ( ON ?auto_161427 ?auto_161428 ) ( ON ?auto_161426 ?auto_161427 ) ( CLEAR ?auto_161426 ) ( HOLDING ?auto_161425 ) ( CLEAR ?auto_161424 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161423 ?auto_161424 ?auto_161425 )
      ( MAKE-7PILE ?auto_161423 ?auto_161424 ?auto_161425 ?auto_161426 ?auto_161427 ?auto_161428 ?auto_161429 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161431 - BLOCK
      ?auto_161432 - BLOCK
      ?auto_161433 - BLOCK
      ?auto_161434 - BLOCK
      ?auto_161435 - BLOCK
      ?auto_161436 - BLOCK
      ?auto_161437 - BLOCK
    )
    :vars
    (
      ?auto_161438 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161431 ) ( ON ?auto_161432 ?auto_161431 ) ( not ( = ?auto_161431 ?auto_161432 ) ) ( not ( = ?auto_161431 ?auto_161433 ) ) ( not ( = ?auto_161431 ?auto_161434 ) ) ( not ( = ?auto_161431 ?auto_161435 ) ) ( not ( = ?auto_161431 ?auto_161436 ) ) ( not ( = ?auto_161431 ?auto_161437 ) ) ( not ( = ?auto_161432 ?auto_161433 ) ) ( not ( = ?auto_161432 ?auto_161434 ) ) ( not ( = ?auto_161432 ?auto_161435 ) ) ( not ( = ?auto_161432 ?auto_161436 ) ) ( not ( = ?auto_161432 ?auto_161437 ) ) ( not ( = ?auto_161433 ?auto_161434 ) ) ( not ( = ?auto_161433 ?auto_161435 ) ) ( not ( = ?auto_161433 ?auto_161436 ) ) ( not ( = ?auto_161433 ?auto_161437 ) ) ( not ( = ?auto_161434 ?auto_161435 ) ) ( not ( = ?auto_161434 ?auto_161436 ) ) ( not ( = ?auto_161434 ?auto_161437 ) ) ( not ( = ?auto_161435 ?auto_161436 ) ) ( not ( = ?auto_161435 ?auto_161437 ) ) ( not ( = ?auto_161436 ?auto_161437 ) ) ( ON ?auto_161437 ?auto_161438 ) ( not ( = ?auto_161431 ?auto_161438 ) ) ( not ( = ?auto_161432 ?auto_161438 ) ) ( not ( = ?auto_161433 ?auto_161438 ) ) ( not ( = ?auto_161434 ?auto_161438 ) ) ( not ( = ?auto_161435 ?auto_161438 ) ) ( not ( = ?auto_161436 ?auto_161438 ) ) ( not ( = ?auto_161437 ?auto_161438 ) ) ( ON ?auto_161436 ?auto_161437 ) ( ON-TABLE ?auto_161438 ) ( ON ?auto_161435 ?auto_161436 ) ( ON ?auto_161434 ?auto_161435 ) ( CLEAR ?auto_161432 ) ( ON ?auto_161433 ?auto_161434 ) ( CLEAR ?auto_161433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161438 ?auto_161437 ?auto_161436 ?auto_161435 ?auto_161434 )
      ( MAKE-7PILE ?auto_161431 ?auto_161432 ?auto_161433 ?auto_161434 ?auto_161435 ?auto_161436 ?auto_161437 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161439 - BLOCK
      ?auto_161440 - BLOCK
      ?auto_161441 - BLOCK
      ?auto_161442 - BLOCK
      ?auto_161443 - BLOCK
      ?auto_161444 - BLOCK
      ?auto_161445 - BLOCK
    )
    :vars
    (
      ?auto_161446 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161439 ) ( not ( = ?auto_161439 ?auto_161440 ) ) ( not ( = ?auto_161439 ?auto_161441 ) ) ( not ( = ?auto_161439 ?auto_161442 ) ) ( not ( = ?auto_161439 ?auto_161443 ) ) ( not ( = ?auto_161439 ?auto_161444 ) ) ( not ( = ?auto_161439 ?auto_161445 ) ) ( not ( = ?auto_161440 ?auto_161441 ) ) ( not ( = ?auto_161440 ?auto_161442 ) ) ( not ( = ?auto_161440 ?auto_161443 ) ) ( not ( = ?auto_161440 ?auto_161444 ) ) ( not ( = ?auto_161440 ?auto_161445 ) ) ( not ( = ?auto_161441 ?auto_161442 ) ) ( not ( = ?auto_161441 ?auto_161443 ) ) ( not ( = ?auto_161441 ?auto_161444 ) ) ( not ( = ?auto_161441 ?auto_161445 ) ) ( not ( = ?auto_161442 ?auto_161443 ) ) ( not ( = ?auto_161442 ?auto_161444 ) ) ( not ( = ?auto_161442 ?auto_161445 ) ) ( not ( = ?auto_161443 ?auto_161444 ) ) ( not ( = ?auto_161443 ?auto_161445 ) ) ( not ( = ?auto_161444 ?auto_161445 ) ) ( ON ?auto_161445 ?auto_161446 ) ( not ( = ?auto_161439 ?auto_161446 ) ) ( not ( = ?auto_161440 ?auto_161446 ) ) ( not ( = ?auto_161441 ?auto_161446 ) ) ( not ( = ?auto_161442 ?auto_161446 ) ) ( not ( = ?auto_161443 ?auto_161446 ) ) ( not ( = ?auto_161444 ?auto_161446 ) ) ( not ( = ?auto_161445 ?auto_161446 ) ) ( ON ?auto_161444 ?auto_161445 ) ( ON-TABLE ?auto_161446 ) ( ON ?auto_161443 ?auto_161444 ) ( ON ?auto_161442 ?auto_161443 ) ( ON ?auto_161441 ?auto_161442 ) ( CLEAR ?auto_161441 ) ( HOLDING ?auto_161440 ) ( CLEAR ?auto_161439 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161439 ?auto_161440 )
      ( MAKE-7PILE ?auto_161439 ?auto_161440 ?auto_161441 ?auto_161442 ?auto_161443 ?auto_161444 ?auto_161445 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161447 - BLOCK
      ?auto_161448 - BLOCK
      ?auto_161449 - BLOCK
      ?auto_161450 - BLOCK
      ?auto_161451 - BLOCK
      ?auto_161452 - BLOCK
      ?auto_161453 - BLOCK
    )
    :vars
    (
      ?auto_161454 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161447 ) ( not ( = ?auto_161447 ?auto_161448 ) ) ( not ( = ?auto_161447 ?auto_161449 ) ) ( not ( = ?auto_161447 ?auto_161450 ) ) ( not ( = ?auto_161447 ?auto_161451 ) ) ( not ( = ?auto_161447 ?auto_161452 ) ) ( not ( = ?auto_161447 ?auto_161453 ) ) ( not ( = ?auto_161448 ?auto_161449 ) ) ( not ( = ?auto_161448 ?auto_161450 ) ) ( not ( = ?auto_161448 ?auto_161451 ) ) ( not ( = ?auto_161448 ?auto_161452 ) ) ( not ( = ?auto_161448 ?auto_161453 ) ) ( not ( = ?auto_161449 ?auto_161450 ) ) ( not ( = ?auto_161449 ?auto_161451 ) ) ( not ( = ?auto_161449 ?auto_161452 ) ) ( not ( = ?auto_161449 ?auto_161453 ) ) ( not ( = ?auto_161450 ?auto_161451 ) ) ( not ( = ?auto_161450 ?auto_161452 ) ) ( not ( = ?auto_161450 ?auto_161453 ) ) ( not ( = ?auto_161451 ?auto_161452 ) ) ( not ( = ?auto_161451 ?auto_161453 ) ) ( not ( = ?auto_161452 ?auto_161453 ) ) ( ON ?auto_161453 ?auto_161454 ) ( not ( = ?auto_161447 ?auto_161454 ) ) ( not ( = ?auto_161448 ?auto_161454 ) ) ( not ( = ?auto_161449 ?auto_161454 ) ) ( not ( = ?auto_161450 ?auto_161454 ) ) ( not ( = ?auto_161451 ?auto_161454 ) ) ( not ( = ?auto_161452 ?auto_161454 ) ) ( not ( = ?auto_161453 ?auto_161454 ) ) ( ON ?auto_161452 ?auto_161453 ) ( ON-TABLE ?auto_161454 ) ( ON ?auto_161451 ?auto_161452 ) ( ON ?auto_161450 ?auto_161451 ) ( ON ?auto_161449 ?auto_161450 ) ( CLEAR ?auto_161447 ) ( ON ?auto_161448 ?auto_161449 ) ( CLEAR ?auto_161448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161454 ?auto_161453 ?auto_161452 ?auto_161451 ?auto_161450 ?auto_161449 )
      ( MAKE-7PILE ?auto_161447 ?auto_161448 ?auto_161449 ?auto_161450 ?auto_161451 ?auto_161452 ?auto_161453 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161455 - BLOCK
      ?auto_161456 - BLOCK
      ?auto_161457 - BLOCK
      ?auto_161458 - BLOCK
      ?auto_161459 - BLOCK
      ?auto_161460 - BLOCK
      ?auto_161461 - BLOCK
    )
    :vars
    (
      ?auto_161462 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161455 ?auto_161456 ) ) ( not ( = ?auto_161455 ?auto_161457 ) ) ( not ( = ?auto_161455 ?auto_161458 ) ) ( not ( = ?auto_161455 ?auto_161459 ) ) ( not ( = ?auto_161455 ?auto_161460 ) ) ( not ( = ?auto_161455 ?auto_161461 ) ) ( not ( = ?auto_161456 ?auto_161457 ) ) ( not ( = ?auto_161456 ?auto_161458 ) ) ( not ( = ?auto_161456 ?auto_161459 ) ) ( not ( = ?auto_161456 ?auto_161460 ) ) ( not ( = ?auto_161456 ?auto_161461 ) ) ( not ( = ?auto_161457 ?auto_161458 ) ) ( not ( = ?auto_161457 ?auto_161459 ) ) ( not ( = ?auto_161457 ?auto_161460 ) ) ( not ( = ?auto_161457 ?auto_161461 ) ) ( not ( = ?auto_161458 ?auto_161459 ) ) ( not ( = ?auto_161458 ?auto_161460 ) ) ( not ( = ?auto_161458 ?auto_161461 ) ) ( not ( = ?auto_161459 ?auto_161460 ) ) ( not ( = ?auto_161459 ?auto_161461 ) ) ( not ( = ?auto_161460 ?auto_161461 ) ) ( ON ?auto_161461 ?auto_161462 ) ( not ( = ?auto_161455 ?auto_161462 ) ) ( not ( = ?auto_161456 ?auto_161462 ) ) ( not ( = ?auto_161457 ?auto_161462 ) ) ( not ( = ?auto_161458 ?auto_161462 ) ) ( not ( = ?auto_161459 ?auto_161462 ) ) ( not ( = ?auto_161460 ?auto_161462 ) ) ( not ( = ?auto_161461 ?auto_161462 ) ) ( ON ?auto_161460 ?auto_161461 ) ( ON-TABLE ?auto_161462 ) ( ON ?auto_161459 ?auto_161460 ) ( ON ?auto_161458 ?auto_161459 ) ( ON ?auto_161457 ?auto_161458 ) ( ON ?auto_161456 ?auto_161457 ) ( CLEAR ?auto_161456 ) ( HOLDING ?auto_161455 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161455 )
      ( MAKE-7PILE ?auto_161455 ?auto_161456 ?auto_161457 ?auto_161458 ?auto_161459 ?auto_161460 ?auto_161461 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161463 - BLOCK
      ?auto_161464 - BLOCK
      ?auto_161465 - BLOCK
      ?auto_161466 - BLOCK
      ?auto_161467 - BLOCK
      ?auto_161468 - BLOCK
      ?auto_161469 - BLOCK
    )
    :vars
    (
      ?auto_161470 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161463 ?auto_161464 ) ) ( not ( = ?auto_161463 ?auto_161465 ) ) ( not ( = ?auto_161463 ?auto_161466 ) ) ( not ( = ?auto_161463 ?auto_161467 ) ) ( not ( = ?auto_161463 ?auto_161468 ) ) ( not ( = ?auto_161463 ?auto_161469 ) ) ( not ( = ?auto_161464 ?auto_161465 ) ) ( not ( = ?auto_161464 ?auto_161466 ) ) ( not ( = ?auto_161464 ?auto_161467 ) ) ( not ( = ?auto_161464 ?auto_161468 ) ) ( not ( = ?auto_161464 ?auto_161469 ) ) ( not ( = ?auto_161465 ?auto_161466 ) ) ( not ( = ?auto_161465 ?auto_161467 ) ) ( not ( = ?auto_161465 ?auto_161468 ) ) ( not ( = ?auto_161465 ?auto_161469 ) ) ( not ( = ?auto_161466 ?auto_161467 ) ) ( not ( = ?auto_161466 ?auto_161468 ) ) ( not ( = ?auto_161466 ?auto_161469 ) ) ( not ( = ?auto_161467 ?auto_161468 ) ) ( not ( = ?auto_161467 ?auto_161469 ) ) ( not ( = ?auto_161468 ?auto_161469 ) ) ( ON ?auto_161469 ?auto_161470 ) ( not ( = ?auto_161463 ?auto_161470 ) ) ( not ( = ?auto_161464 ?auto_161470 ) ) ( not ( = ?auto_161465 ?auto_161470 ) ) ( not ( = ?auto_161466 ?auto_161470 ) ) ( not ( = ?auto_161467 ?auto_161470 ) ) ( not ( = ?auto_161468 ?auto_161470 ) ) ( not ( = ?auto_161469 ?auto_161470 ) ) ( ON ?auto_161468 ?auto_161469 ) ( ON-TABLE ?auto_161470 ) ( ON ?auto_161467 ?auto_161468 ) ( ON ?auto_161466 ?auto_161467 ) ( ON ?auto_161465 ?auto_161466 ) ( ON ?auto_161464 ?auto_161465 ) ( ON ?auto_161463 ?auto_161464 ) ( CLEAR ?auto_161463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_161470 ?auto_161469 ?auto_161468 ?auto_161467 ?auto_161466 ?auto_161465 ?auto_161464 )
      ( MAKE-7PILE ?auto_161463 ?auto_161464 ?auto_161465 ?auto_161466 ?auto_161467 ?auto_161468 ?auto_161469 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161478 - BLOCK
      ?auto_161479 - BLOCK
      ?auto_161480 - BLOCK
      ?auto_161481 - BLOCK
      ?auto_161482 - BLOCK
      ?auto_161483 - BLOCK
      ?auto_161484 - BLOCK
    )
    :vars
    (
      ?auto_161485 - BLOCK
      ?auto_161486 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161478 ?auto_161479 ) ) ( not ( = ?auto_161478 ?auto_161480 ) ) ( not ( = ?auto_161478 ?auto_161481 ) ) ( not ( = ?auto_161478 ?auto_161482 ) ) ( not ( = ?auto_161478 ?auto_161483 ) ) ( not ( = ?auto_161478 ?auto_161484 ) ) ( not ( = ?auto_161479 ?auto_161480 ) ) ( not ( = ?auto_161479 ?auto_161481 ) ) ( not ( = ?auto_161479 ?auto_161482 ) ) ( not ( = ?auto_161479 ?auto_161483 ) ) ( not ( = ?auto_161479 ?auto_161484 ) ) ( not ( = ?auto_161480 ?auto_161481 ) ) ( not ( = ?auto_161480 ?auto_161482 ) ) ( not ( = ?auto_161480 ?auto_161483 ) ) ( not ( = ?auto_161480 ?auto_161484 ) ) ( not ( = ?auto_161481 ?auto_161482 ) ) ( not ( = ?auto_161481 ?auto_161483 ) ) ( not ( = ?auto_161481 ?auto_161484 ) ) ( not ( = ?auto_161482 ?auto_161483 ) ) ( not ( = ?auto_161482 ?auto_161484 ) ) ( not ( = ?auto_161483 ?auto_161484 ) ) ( ON ?auto_161484 ?auto_161485 ) ( not ( = ?auto_161478 ?auto_161485 ) ) ( not ( = ?auto_161479 ?auto_161485 ) ) ( not ( = ?auto_161480 ?auto_161485 ) ) ( not ( = ?auto_161481 ?auto_161485 ) ) ( not ( = ?auto_161482 ?auto_161485 ) ) ( not ( = ?auto_161483 ?auto_161485 ) ) ( not ( = ?auto_161484 ?auto_161485 ) ) ( ON ?auto_161483 ?auto_161484 ) ( ON-TABLE ?auto_161485 ) ( ON ?auto_161482 ?auto_161483 ) ( ON ?auto_161481 ?auto_161482 ) ( ON ?auto_161480 ?auto_161481 ) ( ON ?auto_161479 ?auto_161480 ) ( CLEAR ?auto_161479 ) ( ON ?auto_161478 ?auto_161486 ) ( CLEAR ?auto_161478 ) ( HAND-EMPTY ) ( not ( = ?auto_161478 ?auto_161486 ) ) ( not ( = ?auto_161479 ?auto_161486 ) ) ( not ( = ?auto_161480 ?auto_161486 ) ) ( not ( = ?auto_161481 ?auto_161486 ) ) ( not ( = ?auto_161482 ?auto_161486 ) ) ( not ( = ?auto_161483 ?auto_161486 ) ) ( not ( = ?auto_161484 ?auto_161486 ) ) ( not ( = ?auto_161485 ?auto_161486 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161478 ?auto_161486 )
      ( MAKE-7PILE ?auto_161478 ?auto_161479 ?auto_161480 ?auto_161481 ?auto_161482 ?auto_161483 ?auto_161484 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161487 - BLOCK
      ?auto_161488 - BLOCK
      ?auto_161489 - BLOCK
      ?auto_161490 - BLOCK
      ?auto_161491 - BLOCK
      ?auto_161492 - BLOCK
      ?auto_161493 - BLOCK
    )
    :vars
    (
      ?auto_161494 - BLOCK
      ?auto_161495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161487 ?auto_161488 ) ) ( not ( = ?auto_161487 ?auto_161489 ) ) ( not ( = ?auto_161487 ?auto_161490 ) ) ( not ( = ?auto_161487 ?auto_161491 ) ) ( not ( = ?auto_161487 ?auto_161492 ) ) ( not ( = ?auto_161487 ?auto_161493 ) ) ( not ( = ?auto_161488 ?auto_161489 ) ) ( not ( = ?auto_161488 ?auto_161490 ) ) ( not ( = ?auto_161488 ?auto_161491 ) ) ( not ( = ?auto_161488 ?auto_161492 ) ) ( not ( = ?auto_161488 ?auto_161493 ) ) ( not ( = ?auto_161489 ?auto_161490 ) ) ( not ( = ?auto_161489 ?auto_161491 ) ) ( not ( = ?auto_161489 ?auto_161492 ) ) ( not ( = ?auto_161489 ?auto_161493 ) ) ( not ( = ?auto_161490 ?auto_161491 ) ) ( not ( = ?auto_161490 ?auto_161492 ) ) ( not ( = ?auto_161490 ?auto_161493 ) ) ( not ( = ?auto_161491 ?auto_161492 ) ) ( not ( = ?auto_161491 ?auto_161493 ) ) ( not ( = ?auto_161492 ?auto_161493 ) ) ( ON ?auto_161493 ?auto_161494 ) ( not ( = ?auto_161487 ?auto_161494 ) ) ( not ( = ?auto_161488 ?auto_161494 ) ) ( not ( = ?auto_161489 ?auto_161494 ) ) ( not ( = ?auto_161490 ?auto_161494 ) ) ( not ( = ?auto_161491 ?auto_161494 ) ) ( not ( = ?auto_161492 ?auto_161494 ) ) ( not ( = ?auto_161493 ?auto_161494 ) ) ( ON ?auto_161492 ?auto_161493 ) ( ON-TABLE ?auto_161494 ) ( ON ?auto_161491 ?auto_161492 ) ( ON ?auto_161490 ?auto_161491 ) ( ON ?auto_161489 ?auto_161490 ) ( ON ?auto_161487 ?auto_161495 ) ( CLEAR ?auto_161487 ) ( not ( = ?auto_161487 ?auto_161495 ) ) ( not ( = ?auto_161488 ?auto_161495 ) ) ( not ( = ?auto_161489 ?auto_161495 ) ) ( not ( = ?auto_161490 ?auto_161495 ) ) ( not ( = ?auto_161491 ?auto_161495 ) ) ( not ( = ?auto_161492 ?auto_161495 ) ) ( not ( = ?auto_161493 ?auto_161495 ) ) ( not ( = ?auto_161494 ?auto_161495 ) ) ( HOLDING ?auto_161488 ) ( CLEAR ?auto_161489 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_161494 ?auto_161493 ?auto_161492 ?auto_161491 ?auto_161490 ?auto_161489 ?auto_161488 )
      ( MAKE-7PILE ?auto_161487 ?auto_161488 ?auto_161489 ?auto_161490 ?auto_161491 ?auto_161492 ?auto_161493 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161496 - BLOCK
      ?auto_161497 - BLOCK
      ?auto_161498 - BLOCK
      ?auto_161499 - BLOCK
      ?auto_161500 - BLOCK
      ?auto_161501 - BLOCK
      ?auto_161502 - BLOCK
    )
    :vars
    (
      ?auto_161503 - BLOCK
      ?auto_161504 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161496 ?auto_161497 ) ) ( not ( = ?auto_161496 ?auto_161498 ) ) ( not ( = ?auto_161496 ?auto_161499 ) ) ( not ( = ?auto_161496 ?auto_161500 ) ) ( not ( = ?auto_161496 ?auto_161501 ) ) ( not ( = ?auto_161496 ?auto_161502 ) ) ( not ( = ?auto_161497 ?auto_161498 ) ) ( not ( = ?auto_161497 ?auto_161499 ) ) ( not ( = ?auto_161497 ?auto_161500 ) ) ( not ( = ?auto_161497 ?auto_161501 ) ) ( not ( = ?auto_161497 ?auto_161502 ) ) ( not ( = ?auto_161498 ?auto_161499 ) ) ( not ( = ?auto_161498 ?auto_161500 ) ) ( not ( = ?auto_161498 ?auto_161501 ) ) ( not ( = ?auto_161498 ?auto_161502 ) ) ( not ( = ?auto_161499 ?auto_161500 ) ) ( not ( = ?auto_161499 ?auto_161501 ) ) ( not ( = ?auto_161499 ?auto_161502 ) ) ( not ( = ?auto_161500 ?auto_161501 ) ) ( not ( = ?auto_161500 ?auto_161502 ) ) ( not ( = ?auto_161501 ?auto_161502 ) ) ( ON ?auto_161502 ?auto_161503 ) ( not ( = ?auto_161496 ?auto_161503 ) ) ( not ( = ?auto_161497 ?auto_161503 ) ) ( not ( = ?auto_161498 ?auto_161503 ) ) ( not ( = ?auto_161499 ?auto_161503 ) ) ( not ( = ?auto_161500 ?auto_161503 ) ) ( not ( = ?auto_161501 ?auto_161503 ) ) ( not ( = ?auto_161502 ?auto_161503 ) ) ( ON ?auto_161501 ?auto_161502 ) ( ON-TABLE ?auto_161503 ) ( ON ?auto_161500 ?auto_161501 ) ( ON ?auto_161499 ?auto_161500 ) ( ON ?auto_161498 ?auto_161499 ) ( ON ?auto_161496 ?auto_161504 ) ( not ( = ?auto_161496 ?auto_161504 ) ) ( not ( = ?auto_161497 ?auto_161504 ) ) ( not ( = ?auto_161498 ?auto_161504 ) ) ( not ( = ?auto_161499 ?auto_161504 ) ) ( not ( = ?auto_161500 ?auto_161504 ) ) ( not ( = ?auto_161501 ?auto_161504 ) ) ( not ( = ?auto_161502 ?auto_161504 ) ) ( not ( = ?auto_161503 ?auto_161504 ) ) ( CLEAR ?auto_161498 ) ( ON ?auto_161497 ?auto_161496 ) ( CLEAR ?auto_161497 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161504 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161504 ?auto_161496 )
      ( MAKE-7PILE ?auto_161496 ?auto_161497 ?auto_161498 ?auto_161499 ?auto_161500 ?auto_161501 ?auto_161502 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161505 - BLOCK
      ?auto_161506 - BLOCK
      ?auto_161507 - BLOCK
      ?auto_161508 - BLOCK
      ?auto_161509 - BLOCK
      ?auto_161510 - BLOCK
      ?auto_161511 - BLOCK
    )
    :vars
    (
      ?auto_161512 - BLOCK
      ?auto_161513 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161505 ?auto_161506 ) ) ( not ( = ?auto_161505 ?auto_161507 ) ) ( not ( = ?auto_161505 ?auto_161508 ) ) ( not ( = ?auto_161505 ?auto_161509 ) ) ( not ( = ?auto_161505 ?auto_161510 ) ) ( not ( = ?auto_161505 ?auto_161511 ) ) ( not ( = ?auto_161506 ?auto_161507 ) ) ( not ( = ?auto_161506 ?auto_161508 ) ) ( not ( = ?auto_161506 ?auto_161509 ) ) ( not ( = ?auto_161506 ?auto_161510 ) ) ( not ( = ?auto_161506 ?auto_161511 ) ) ( not ( = ?auto_161507 ?auto_161508 ) ) ( not ( = ?auto_161507 ?auto_161509 ) ) ( not ( = ?auto_161507 ?auto_161510 ) ) ( not ( = ?auto_161507 ?auto_161511 ) ) ( not ( = ?auto_161508 ?auto_161509 ) ) ( not ( = ?auto_161508 ?auto_161510 ) ) ( not ( = ?auto_161508 ?auto_161511 ) ) ( not ( = ?auto_161509 ?auto_161510 ) ) ( not ( = ?auto_161509 ?auto_161511 ) ) ( not ( = ?auto_161510 ?auto_161511 ) ) ( ON ?auto_161511 ?auto_161512 ) ( not ( = ?auto_161505 ?auto_161512 ) ) ( not ( = ?auto_161506 ?auto_161512 ) ) ( not ( = ?auto_161507 ?auto_161512 ) ) ( not ( = ?auto_161508 ?auto_161512 ) ) ( not ( = ?auto_161509 ?auto_161512 ) ) ( not ( = ?auto_161510 ?auto_161512 ) ) ( not ( = ?auto_161511 ?auto_161512 ) ) ( ON ?auto_161510 ?auto_161511 ) ( ON-TABLE ?auto_161512 ) ( ON ?auto_161509 ?auto_161510 ) ( ON ?auto_161508 ?auto_161509 ) ( ON ?auto_161505 ?auto_161513 ) ( not ( = ?auto_161505 ?auto_161513 ) ) ( not ( = ?auto_161506 ?auto_161513 ) ) ( not ( = ?auto_161507 ?auto_161513 ) ) ( not ( = ?auto_161508 ?auto_161513 ) ) ( not ( = ?auto_161509 ?auto_161513 ) ) ( not ( = ?auto_161510 ?auto_161513 ) ) ( not ( = ?auto_161511 ?auto_161513 ) ) ( not ( = ?auto_161512 ?auto_161513 ) ) ( ON ?auto_161506 ?auto_161505 ) ( CLEAR ?auto_161506 ) ( ON-TABLE ?auto_161513 ) ( HOLDING ?auto_161507 ) ( CLEAR ?auto_161508 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161512 ?auto_161511 ?auto_161510 ?auto_161509 ?auto_161508 ?auto_161507 )
      ( MAKE-7PILE ?auto_161505 ?auto_161506 ?auto_161507 ?auto_161508 ?auto_161509 ?auto_161510 ?auto_161511 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161514 - BLOCK
      ?auto_161515 - BLOCK
      ?auto_161516 - BLOCK
      ?auto_161517 - BLOCK
      ?auto_161518 - BLOCK
      ?auto_161519 - BLOCK
      ?auto_161520 - BLOCK
    )
    :vars
    (
      ?auto_161521 - BLOCK
      ?auto_161522 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161514 ?auto_161515 ) ) ( not ( = ?auto_161514 ?auto_161516 ) ) ( not ( = ?auto_161514 ?auto_161517 ) ) ( not ( = ?auto_161514 ?auto_161518 ) ) ( not ( = ?auto_161514 ?auto_161519 ) ) ( not ( = ?auto_161514 ?auto_161520 ) ) ( not ( = ?auto_161515 ?auto_161516 ) ) ( not ( = ?auto_161515 ?auto_161517 ) ) ( not ( = ?auto_161515 ?auto_161518 ) ) ( not ( = ?auto_161515 ?auto_161519 ) ) ( not ( = ?auto_161515 ?auto_161520 ) ) ( not ( = ?auto_161516 ?auto_161517 ) ) ( not ( = ?auto_161516 ?auto_161518 ) ) ( not ( = ?auto_161516 ?auto_161519 ) ) ( not ( = ?auto_161516 ?auto_161520 ) ) ( not ( = ?auto_161517 ?auto_161518 ) ) ( not ( = ?auto_161517 ?auto_161519 ) ) ( not ( = ?auto_161517 ?auto_161520 ) ) ( not ( = ?auto_161518 ?auto_161519 ) ) ( not ( = ?auto_161518 ?auto_161520 ) ) ( not ( = ?auto_161519 ?auto_161520 ) ) ( ON ?auto_161520 ?auto_161521 ) ( not ( = ?auto_161514 ?auto_161521 ) ) ( not ( = ?auto_161515 ?auto_161521 ) ) ( not ( = ?auto_161516 ?auto_161521 ) ) ( not ( = ?auto_161517 ?auto_161521 ) ) ( not ( = ?auto_161518 ?auto_161521 ) ) ( not ( = ?auto_161519 ?auto_161521 ) ) ( not ( = ?auto_161520 ?auto_161521 ) ) ( ON ?auto_161519 ?auto_161520 ) ( ON-TABLE ?auto_161521 ) ( ON ?auto_161518 ?auto_161519 ) ( ON ?auto_161517 ?auto_161518 ) ( ON ?auto_161514 ?auto_161522 ) ( not ( = ?auto_161514 ?auto_161522 ) ) ( not ( = ?auto_161515 ?auto_161522 ) ) ( not ( = ?auto_161516 ?auto_161522 ) ) ( not ( = ?auto_161517 ?auto_161522 ) ) ( not ( = ?auto_161518 ?auto_161522 ) ) ( not ( = ?auto_161519 ?auto_161522 ) ) ( not ( = ?auto_161520 ?auto_161522 ) ) ( not ( = ?auto_161521 ?auto_161522 ) ) ( ON ?auto_161515 ?auto_161514 ) ( ON-TABLE ?auto_161522 ) ( CLEAR ?auto_161517 ) ( ON ?auto_161516 ?auto_161515 ) ( CLEAR ?auto_161516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161522 ?auto_161514 ?auto_161515 )
      ( MAKE-7PILE ?auto_161514 ?auto_161515 ?auto_161516 ?auto_161517 ?auto_161518 ?auto_161519 ?auto_161520 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161523 - BLOCK
      ?auto_161524 - BLOCK
      ?auto_161525 - BLOCK
      ?auto_161526 - BLOCK
      ?auto_161527 - BLOCK
      ?auto_161528 - BLOCK
      ?auto_161529 - BLOCK
    )
    :vars
    (
      ?auto_161530 - BLOCK
      ?auto_161531 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161523 ?auto_161524 ) ) ( not ( = ?auto_161523 ?auto_161525 ) ) ( not ( = ?auto_161523 ?auto_161526 ) ) ( not ( = ?auto_161523 ?auto_161527 ) ) ( not ( = ?auto_161523 ?auto_161528 ) ) ( not ( = ?auto_161523 ?auto_161529 ) ) ( not ( = ?auto_161524 ?auto_161525 ) ) ( not ( = ?auto_161524 ?auto_161526 ) ) ( not ( = ?auto_161524 ?auto_161527 ) ) ( not ( = ?auto_161524 ?auto_161528 ) ) ( not ( = ?auto_161524 ?auto_161529 ) ) ( not ( = ?auto_161525 ?auto_161526 ) ) ( not ( = ?auto_161525 ?auto_161527 ) ) ( not ( = ?auto_161525 ?auto_161528 ) ) ( not ( = ?auto_161525 ?auto_161529 ) ) ( not ( = ?auto_161526 ?auto_161527 ) ) ( not ( = ?auto_161526 ?auto_161528 ) ) ( not ( = ?auto_161526 ?auto_161529 ) ) ( not ( = ?auto_161527 ?auto_161528 ) ) ( not ( = ?auto_161527 ?auto_161529 ) ) ( not ( = ?auto_161528 ?auto_161529 ) ) ( ON ?auto_161529 ?auto_161530 ) ( not ( = ?auto_161523 ?auto_161530 ) ) ( not ( = ?auto_161524 ?auto_161530 ) ) ( not ( = ?auto_161525 ?auto_161530 ) ) ( not ( = ?auto_161526 ?auto_161530 ) ) ( not ( = ?auto_161527 ?auto_161530 ) ) ( not ( = ?auto_161528 ?auto_161530 ) ) ( not ( = ?auto_161529 ?auto_161530 ) ) ( ON ?auto_161528 ?auto_161529 ) ( ON-TABLE ?auto_161530 ) ( ON ?auto_161527 ?auto_161528 ) ( ON ?auto_161523 ?auto_161531 ) ( not ( = ?auto_161523 ?auto_161531 ) ) ( not ( = ?auto_161524 ?auto_161531 ) ) ( not ( = ?auto_161525 ?auto_161531 ) ) ( not ( = ?auto_161526 ?auto_161531 ) ) ( not ( = ?auto_161527 ?auto_161531 ) ) ( not ( = ?auto_161528 ?auto_161531 ) ) ( not ( = ?auto_161529 ?auto_161531 ) ) ( not ( = ?auto_161530 ?auto_161531 ) ) ( ON ?auto_161524 ?auto_161523 ) ( ON-TABLE ?auto_161531 ) ( ON ?auto_161525 ?auto_161524 ) ( CLEAR ?auto_161525 ) ( HOLDING ?auto_161526 ) ( CLEAR ?auto_161527 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161530 ?auto_161529 ?auto_161528 ?auto_161527 ?auto_161526 )
      ( MAKE-7PILE ?auto_161523 ?auto_161524 ?auto_161525 ?auto_161526 ?auto_161527 ?auto_161528 ?auto_161529 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161532 - BLOCK
      ?auto_161533 - BLOCK
      ?auto_161534 - BLOCK
      ?auto_161535 - BLOCK
      ?auto_161536 - BLOCK
      ?auto_161537 - BLOCK
      ?auto_161538 - BLOCK
    )
    :vars
    (
      ?auto_161539 - BLOCK
      ?auto_161540 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161532 ?auto_161533 ) ) ( not ( = ?auto_161532 ?auto_161534 ) ) ( not ( = ?auto_161532 ?auto_161535 ) ) ( not ( = ?auto_161532 ?auto_161536 ) ) ( not ( = ?auto_161532 ?auto_161537 ) ) ( not ( = ?auto_161532 ?auto_161538 ) ) ( not ( = ?auto_161533 ?auto_161534 ) ) ( not ( = ?auto_161533 ?auto_161535 ) ) ( not ( = ?auto_161533 ?auto_161536 ) ) ( not ( = ?auto_161533 ?auto_161537 ) ) ( not ( = ?auto_161533 ?auto_161538 ) ) ( not ( = ?auto_161534 ?auto_161535 ) ) ( not ( = ?auto_161534 ?auto_161536 ) ) ( not ( = ?auto_161534 ?auto_161537 ) ) ( not ( = ?auto_161534 ?auto_161538 ) ) ( not ( = ?auto_161535 ?auto_161536 ) ) ( not ( = ?auto_161535 ?auto_161537 ) ) ( not ( = ?auto_161535 ?auto_161538 ) ) ( not ( = ?auto_161536 ?auto_161537 ) ) ( not ( = ?auto_161536 ?auto_161538 ) ) ( not ( = ?auto_161537 ?auto_161538 ) ) ( ON ?auto_161538 ?auto_161539 ) ( not ( = ?auto_161532 ?auto_161539 ) ) ( not ( = ?auto_161533 ?auto_161539 ) ) ( not ( = ?auto_161534 ?auto_161539 ) ) ( not ( = ?auto_161535 ?auto_161539 ) ) ( not ( = ?auto_161536 ?auto_161539 ) ) ( not ( = ?auto_161537 ?auto_161539 ) ) ( not ( = ?auto_161538 ?auto_161539 ) ) ( ON ?auto_161537 ?auto_161538 ) ( ON-TABLE ?auto_161539 ) ( ON ?auto_161536 ?auto_161537 ) ( ON ?auto_161532 ?auto_161540 ) ( not ( = ?auto_161532 ?auto_161540 ) ) ( not ( = ?auto_161533 ?auto_161540 ) ) ( not ( = ?auto_161534 ?auto_161540 ) ) ( not ( = ?auto_161535 ?auto_161540 ) ) ( not ( = ?auto_161536 ?auto_161540 ) ) ( not ( = ?auto_161537 ?auto_161540 ) ) ( not ( = ?auto_161538 ?auto_161540 ) ) ( not ( = ?auto_161539 ?auto_161540 ) ) ( ON ?auto_161533 ?auto_161532 ) ( ON-TABLE ?auto_161540 ) ( ON ?auto_161534 ?auto_161533 ) ( CLEAR ?auto_161536 ) ( ON ?auto_161535 ?auto_161534 ) ( CLEAR ?auto_161535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161540 ?auto_161532 ?auto_161533 ?auto_161534 )
      ( MAKE-7PILE ?auto_161532 ?auto_161533 ?auto_161534 ?auto_161535 ?auto_161536 ?auto_161537 ?auto_161538 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161541 - BLOCK
      ?auto_161542 - BLOCK
      ?auto_161543 - BLOCK
      ?auto_161544 - BLOCK
      ?auto_161545 - BLOCK
      ?auto_161546 - BLOCK
      ?auto_161547 - BLOCK
    )
    :vars
    (
      ?auto_161549 - BLOCK
      ?auto_161548 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161541 ?auto_161542 ) ) ( not ( = ?auto_161541 ?auto_161543 ) ) ( not ( = ?auto_161541 ?auto_161544 ) ) ( not ( = ?auto_161541 ?auto_161545 ) ) ( not ( = ?auto_161541 ?auto_161546 ) ) ( not ( = ?auto_161541 ?auto_161547 ) ) ( not ( = ?auto_161542 ?auto_161543 ) ) ( not ( = ?auto_161542 ?auto_161544 ) ) ( not ( = ?auto_161542 ?auto_161545 ) ) ( not ( = ?auto_161542 ?auto_161546 ) ) ( not ( = ?auto_161542 ?auto_161547 ) ) ( not ( = ?auto_161543 ?auto_161544 ) ) ( not ( = ?auto_161543 ?auto_161545 ) ) ( not ( = ?auto_161543 ?auto_161546 ) ) ( not ( = ?auto_161543 ?auto_161547 ) ) ( not ( = ?auto_161544 ?auto_161545 ) ) ( not ( = ?auto_161544 ?auto_161546 ) ) ( not ( = ?auto_161544 ?auto_161547 ) ) ( not ( = ?auto_161545 ?auto_161546 ) ) ( not ( = ?auto_161545 ?auto_161547 ) ) ( not ( = ?auto_161546 ?auto_161547 ) ) ( ON ?auto_161547 ?auto_161549 ) ( not ( = ?auto_161541 ?auto_161549 ) ) ( not ( = ?auto_161542 ?auto_161549 ) ) ( not ( = ?auto_161543 ?auto_161549 ) ) ( not ( = ?auto_161544 ?auto_161549 ) ) ( not ( = ?auto_161545 ?auto_161549 ) ) ( not ( = ?auto_161546 ?auto_161549 ) ) ( not ( = ?auto_161547 ?auto_161549 ) ) ( ON ?auto_161546 ?auto_161547 ) ( ON-TABLE ?auto_161549 ) ( ON ?auto_161541 ?auto_161548 ) ( not ( = ?auto_161541 ?auto_161548 ) ) ( not ( = ?auto_161542 ?auto_161548 ) ) ( not ( = ?auto_161543 ?auto_161548 ) ) ( not ( = ?auto_161544 ?auto_161548 ) ) ( not ( = ?auto_161545 ?auto_161548 ) ) ( not ( = ?auto_161546 ?auto_161548 ) ) ( not ( = ?auto_161547 ?auto_161548 ) ) ( not ( = ?auto_161549 ?auto_161548 ) ) ( ON ?auto_161542 ?auto_161541 ) ( ON-TABLE ?auto_161548 ) ( ON ?auto_161543 ?auto_161542 ) ( ON ?auto_161544 ?auto_161543 ) ( CLEAR ?auto_161544 ) ( HOLDING ?auto_161545 ) ( CLEAR ?auto_161546 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161549 ?auto_161547 ?auto_161546 ?auto_161545 )
      ( MAKE-7PILE ?auto_161541 ?auto_161542 ?auto_161543 ?auto_161544 ?auto_161545 ?auto_161546 ?auto_161547 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161550 - BLOCK
      ?auto_161551 - BLOCK
      ?auto_161552 - BLOCK
      ?auto_161553 - BLOCK
      ?auto_161554 - BLOCK
      ?auto_161555 - BLOCK
      ?auto_161556 - BLOCK
    )
    :vars
    (
      ?auto_161557 - BLOCK
      ?auto_161558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161550 ?auto_161551 ) ) ( not ( = ?auto_161550 ?auto_161552 ) ) ( not ( = ?auto_161550 ?auto_161553 ) ) ( not ( = ?auto_161550 ?auto_161554 ) ) ( not ( = ?auto_161550 ?auto_161555 ) ) ( not ( = ?auto_161550 ?auto_161556 ) ) ( not ( = ?auto_161551 ?auto_161552 ) ) ( not ( = ?auto_161551 ?auto_161553 ) ) ( not ( = ?auto_161551 ?auto_161554 ) ) ( not ( = ?auto_161551 ?auto_161555 ) ) ( not ( = ?auto_161551 ?auto_161556 ) ) ( not ( = ?auto_161552 ?auto_161553 ) ) ( not ( = ?auto_161552 ?auto_161554 ) ) ( not ( = ?auto_161552 ?auto_161555 ) ) ( not ( = ?auto_161552 ?auto_161556 ) ) ( not ( = ?auto_161553 ?auto_161554 ) ) ( not ( = ?auto_161553 ?auto_161555 ) ) ( not ( = ?auto_161553 ?auto_161556 ) ) ( not ( = ?auto_161554 ?auto_161555 ) ) ( not ( = ?auto_161554 ?auto_161556 ) ) ( not ( = ?auto_161555 ?auto_161556 ) ) ( ON ?auto_161556 ?auto_161557 ) ( not ( = ?auto_161550 ?auto_161557 ) ) ( not ( = ?auto_161551 ?auto_161557 ) ) ( not ( = ?auto_161552 ?auto_161557 ) ) ( not ( = ?auto_161553 ?auto_161557 ) ) ( not ( = ?auto_161554 ?auto_161557 ) ) ( not ( = ?auto_161555 ?auto_161557 ) ) ( not ( = ?auto_161556 ?auto_161557 ) ) ( ON ?auto_161555 ?auto_161556 ) ( ON-TABLE ?auto_161557 ) ( ON ?auto_161550 ?auto_161558 ) ( not ( = ?auto_161550 ?auto_161558 ) ) ( not ( = ?auto_161551 ?auto_161558 ) ) ( not ( = ?auto_161552 ?auto_161558 ) ) ( not ( = ?auto_161553 ?auto_161558 ) ) ( not ( = ?auto_161554 ?auto_161558 ) ) ( not ( = ?auto_161555 ?auto_161558 ) ) ( not ( = ?auto_161556 ?auto_161558 ) ) ( not ( = ?auto_161557 ?auto_161558 ) ) ( ON ?auto_161551 ?auto_161550 ) ( ON-TABLE ?auto_161558 ) ( ON ?auto_161552 ?auto_161551 ) ( ON ?auto_161553 ?auto_161552 ) ( CLEAR ?auto_161555 ) ( ON ?auto_161554 ?auto_161553 ) ( CLEAR ?auto_161554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161558 ?auto_161550 ?auto_161551 ?auto_161552 ?auto_161553 )
      ( MAKE-7PILE ?auto_161550 ?auto_161551 ?auto_161552 ?auto_161553 ?auto_161554 ?auto_161555 ?auto_161556 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161559 - BLOCK
      ?auto_161560 - BLOCK
      ?auto_161561 - BLOCK
      ?auto_161562 - BLOCK
      ?auto_161563 - BLOCK
      ?auto_161564 - BLOCK
      ?auto_161565 - BLOCK
    )
    :vars
    (
      ?auto_161567 - BLOCK
      ?auto_161566 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161559 ?auto_161560 ) ) ( not ( = ?auto_161559 ?auto_161561 ) ) ( not ( = ?auto_161559 ?auto_161562 ) ) ( not ( = ?auto_161559 ?auto_161563 ) ) ( not ( = ?auto_161559 ?auto_161564 ) ) ( not ( = ?auto_161559 ?auto_161565 ) ) ( not ( = ?auto_161560 ?auto_161561 ) ) ( not ( = ?auto_161560 ?auto_161562 ) ) ( not ( = ?auto_161560 ?auto_161563 ) ) ( not ( = ?auto_161560 ?auto_161564 ) ) ( not ( = ?auto_161560 ?auto_161565 ) ) ( not ( = ?auto_161561 ?auto_161562 ) ) ( not ( = ?auto_161561 ?auto_161563 ) ) ( not ( = ?auto_161561 ?auto_161564 ) ) ( not ( = ?auto_161561 ?auto_161565 ) ) ( not ( = ?auto_161562 ?auto_161563 ) ) ( not ( = ?auto_161562 ?auto_161564 ) ) ( not ( = ?auto_161562 ?auto_161565 ) ) ( not ( = ?auto_161563 ?auto_161564 ) ) ( not ( = ?auto_161563 ?auto_161565 ) ) ( not ( = ?auto_161564 ?auto_161565 ) ) ( ON ?auto_161565 ?auto_161567 ) ( not ( = ?auto_161559 ?auto_161567 ) ) ( not ( = ?auto_161560 ?auto_161567 ) ) ( not ( = ?auto_161561 ?auto_161567 ) ) ( not ( = ?auto_161562 ?auto_161567 ) ) ( not ( = ?auto_161563 ?auto_161567 ) ) ( not ( = ?auto_161564 ?auto_161567 ) ) ( not ( = ?auto_161565 ?auto_161567 ) ) ( ON-TABLE ?auto_161567 ) ( ON ?auto_161559 ?auto_161566 ) ( not ( = ?auto_161559 ?auto_161566 ) ) ( not ( = ?auto_161560 ?auto_161566 ) ) ( not ( = ?auto_161561 ?auto_161566 ) ) ( not ( = ?auto_161562 ?auto_161566 ) ) ( not ( = ?auto_161563 ?auto_161566 ) ) ( not ( = ?auto_161564 ?auto_161566 ) ) ( not ( = ?auto_161565 ?auto_161566 ) ) ( not ( = ?auto_161567 ?auto_161566 ) ) ( ON ?auto_161560 ?auto_161559 ) ( ON-TABLE ?auto_161566 ) ( ON ?auto_161561 ?auto_161560 ) ( ON ?auto_161562 ?auto_161561 ) ( ON ?auto_161563 ?auto_161562 ) ( CLEAR ?auto_161563 ) ( HOLDING ?auto_161564 ) ( CLEAR ?auto_161565 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161567 ?auto_161565 ?auto_161564 )
      ( MAKE-7PILE ?auto_161559 ?auto_161560 ?auto_161561 ?auto_161562 ?auto_161563 ?auto_161564 ?auto_161565 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161568 - BLOCK
      ?auto_161569 - BLOCK
      ?auto_161570 - BLOCK
      ?auto_161571 - BLOCK
      ?auto_161572 - BLOCK
      ?auto_161573 - BLOCK
      ?auto_161574 - BLOCK
    )
    :vars
    (
      ?auto_161575 - BLOCK
      ?auto_161576 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161568 ?auto_161569 ) ) ( not ( = ?auto_161568 ?auto_161570 ) ) ( not ( = ?auto_161568 ?auto_161571 ) ) ( not ( = ?auto_161568 ?auto_161572 ) ) ( not ( = ?auto_161568 ?auto_161573 ) ) ( not ( = ?auto_161568 ?auto_161574 ) ) ( not ( = ?auto_161569 ?auto_161570 ) ) ( not ( = ?auto_161569 ?auto_161571 ) ) ( not ( = ?auto_161569 ?auto_161572 ) ) ( not ( = ?auto_161569 ?auto_161573 ) ) ( not ( = ?auto_161569 ?auto_161574 ) ) ( not ( = ?auto_161570 ?auto_161571 ) ) ( not ( = ?auto_161570 ?auto_161572 ) ) ( not ( = ?auto_161570 ?auto_161573 ) ) ( not ( = ?auto_161570 ?auto_161574 ) ) ( not ( = ?auto_161571 ?auto_161572 ) ) ( not ( = ?auto_161571 ?auto_161573 ) ) ( not ( = ?auto_161571 ?auto_161574 ) ) ( not ( = ?auto_161572 ?auto_161573 ) ) ( not ( = ?auto_161572 ?auto_161574 ) ) ( not ( = ?auto_161573 ?auto_161574 ) ) ( ON ?auto_161574 ?auto_161575 ) ( not ( = ?auto_161568 ?auto_161575 ) ) ( not ( = ?auto_161569 ?auto_161575 ) ) ( not ( = ?auto_161570 ?auto_161575 ) ) ( not ( = ?auto_161571 ?auto_161575 ) ) ( not ( = ?auto_161572 ?auto_161575 ) ) ( not ( = ?auto_161573 ?auto_161575 ) ) ( not ( = ?auto_161574 ?auto_161575 ) ) ( ON-TABLE ?auto_161575 ) ( ON ?auto_161568 ?auto_161576 ) ( not ( = ?auto_161568 ?auto_161576 ) ) ( not ( = ?auto_161569 ?auto_161576 ) ) ( not ( = ?auto_161570 ?auto_161576 ) ) ( not ( = ?auto_161571 ?auto_161576 ) ) ( not ( = ?auto_161572 ?auto_161576 ) ) ( not ( = ?auto_161573 ?auto_161576 ) ) ( not ( = ?auto_161574 ?auto_161576 ) ) ( not ( = ?auto_161575 ?auto_161576 ) ) ( ON ?auto_161569 ?auto_161568 ) ( ON-TABLE ?auto_161576 ) ( ON ?auto_161570 ?auto_161569 ) ( ON ?auto_161571 ?auto_161570 ) ( ON ?auto_161572 ?auto_161571 ) ( CLEAR ?auto_161574 ) ( ON ?auto_161573 ?auto_161572 ) ( CLEAR ?auto_161573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161576 ?auto_161568 ?auto_161569 ?auto_161570 ?auto_161571 ?auto_161572 )
      ( MAKE-7PILE ?auto_161568 ?auto_161569 ?auto_161570 ?auto_161571 ?auto_161572 ?auto_161573 ?auto_161574 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161577 - BLOCK
      ?auto_161578 - BLOCK
      ?auto_161579 - BLOCK
      ?auto_161580 - BLOCK
      ?auto_161581 - BLOCK
      ?auto_161582 - BLOCK
      ?auto_161583 - BLOCK
    )
    :vars
    (
      ?auto_161584 - BLOCK
      ?auto_161585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161577 ?auto_161578 ) ) ( not ( = ?auto_161577 ?auto_161579 ) ) ( not ( = ?auto_161577 ?auto_161580 ) ) ( not ( = ?auto_161577 ?auto_161581 ) ) ( not ( = ?auto_161577 ?auto_161582 ) ) ( not ( = ?auto_161577 ?auto_161583 ) ) ( not ( = ?auto_161578 ?auto_161579 ) ) ( not ( = ?auto_161578 ?auto_161580 ) ) ( not ( = ?auto_161578 ?auto_161581 ) ) ( not ( = ?auto_161578 ?auto_161582 ) ) ( not ( = ?auto_161578 ?auto_161583 ) ) ( not ( = ?auto_161579 ?auto_161580 ) ) ( not ( = ?auto_161579 ?auto_161581 ) ) ( not ( = ?auto_161579 ?auto_161582 ) ) ( not ( = ?auto_161579 ?auto_161583 ) ) ( not ( = ?auto_161580 ?auto_161581 ) ) ( not ( = ?auto_161580 ?auto_161582 ) ) ( not ( = ?auto_161580 ?auto_161583 ) ) ( not ( = ?auto_161581 ?auto_161582 ) ) ( not ( = ?auto_161581 ?auto_161583 ) ) ( not ( = ?auto_161582 ?auto_161583 ) ) ( not ( = ?auto_161577 ?auto_161584 ) ) ( not ( = ?auto_161578 ?auto_161584 ) ) ( not ( = ?auto_161579 ?auto_161584 ) ) ( not ( = ?auto_161580 ?auto_161584 ) ) ( not ( = ?auto_161581 ?auto_161584 ) ) ( not ( = ?auto_161582 ?auto_161584 ) ) ( not ( = ?auto_161583 ?auto_161584 ) ) ( ON-TABLE ?auto_161584 ) ( ON ?auto_161577 ?auto_161585 ) ( not ( = ?auto_161577 ?auto_161585 ) ) ( not ( = ?auto_161578 ?auto_161585 ) ) ( not ( = ?auto_161579 ?auto_161585 ) ) ( not ( = ?auto_161580 ?auto_161585 ) ) ( not ( = ?auto_161581 ?auto_161585 ) ) ( not ( = ?auto_161582 ?auto_161585 ) ) ( not ( = ?auto_161583 ?auto_161585 ) ) ( not ( = ?auto_161584 ?auto_161585 ) ) ( ON ?auto_161578 ?auto_161577 ) ( ON-TABLE ?auto_161585 ) ( ON ?auto_161579 ?auto_161578 ) ( ON ?auto_161580 ?auto_161579 ) ( ON ?auto_161581 ?auto_161580 ) ( ON ?auto_161582 ?auto_161581 ) ( CLEAR ?auto_161582 ) ( HOLDING ?auto_161583 ) ( CLEAR ?auto_161584 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161584 ?auto_161583 )
      ( MAKE-7PILE ?auto_161577 ?auto_161578 ?auto_161579 ?auto_161580 ?auto_161581 ?auto_161582 ?auto_161583 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161586 - BLOCK
      ?auto_161587 - BLOCK
      ?auto_161588 - BLOCK
      ?auto_161589 - BLOCK
      ?auto_161590 - BLOCK
      ?auto_161591 - BLOCK
      ?auto_161592 - BLOCK
    )
    :vars
    (
      ?auto_161593 - BLOCK
      ?auto_161594 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161586 ?auto_161587 ) ) ( not ( = ?auto_161586 ?auto_161588 ) ) ( not ( = ?auto_161586 ?auto_161589 ) ) ( not ( = ?auto_161586 ?auto_161590 ) ) ( not ( = ?auto_161586 ?auto_161591 ) ) ( not ( = ?auto_161586 ?auto_161592 ) ) ( not ( = ?auto_161587 ?auto_161588 ) ) ( not ( = ?auto_161587 ?auto_161589 ) ) ( not ( = ?auto_161587 ?auto_161590 ) ) ( not ( = ?auto_161587 ?auto_161591 ) ) ( not ( = ?auto_161587 ?auto_161592 ) ) ( not ( = ?auto_161588 ?auto_161589 ) ) ( not ( = ?auto_161588 ?auto_161590 ) ) ( not ( = ?auto_161588 ?auto_161591 ) ) ( not ( = ?auto_161588 ?auto_161592 ) ) ( not ( = ?auto_161589 ?auto_161590 ) ) ( not ( = ?auto_161589 ?auto_161591 ) ) ( not ( = ?auto_161589 ?auto_161592 ) ) ( not ( = ?auto_161590 ?auto_161591 ) ) ( not ( = ?auto_161590 ?auto_161592 ) ) ( not ( = ?auto_161591 ?auto_161592 ) ) ( not ( = ?auto_161586 ?auto_161593 ) ) ( not ( = ?auto_161587 ?auto_161593 ) ) ( not ( = ?auto_161588 ?auto_161593 ) ) ( not ( = ?auto_161589 ?auto_161593 ) ) ( not ( = ?auto_161590 ?auto_161593 ) ) ( not ( = ?auto_161591 ?auto_161593 ) ) ( not ( = ?auto_161592 ?auto_161593 ) ) ( ON-TABLE ?auto_161593 ) ( ON ?auto_161586 ?auto_161594 ) ( not ( = ?auto_161586 ?auto_161594 ) ) ( not ( = ?auto_161587 ?auto_161594 ) ) ( not ( = ?auto_161588 ?auto_161594 ) ) ( not ( = ?auto_161589 ?auto_161594 ) ) ( not ( = ?auto_161590 ?auto_161594 ) ) ( not ( = ?auto_161591 ?auto_161594 ) ) ( not ( = ?auto_161592 ?auto_161594 ) ) ( not ( = ?auto_161593 ?auto_161594 ) ) ( ON ?auto_161587 ?auto_161586 ) ( ON-TABLE ?auto_161594 ) ( ON ?auto_161588 ?auto_161587 ) ( ON ?auto_161589 ?auto_161588 ) ( ON ?auto_161590 ?auto_161589 ) ( ON ?auto_161591 ?auto_161590 ) ( CLEAR ?auto_161593 ) ( ON ?auto_161592 ?auto_161591 ) ( CLEAR ?auto_161592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_161594 ?auto_161586 ?auto_161587 ?auto_161588 ?auto_161589 ?auto_161590 ?auto_161591 )
      ( MAKE-7PILE ?auto_161586 ?auto_161587 ?auto_161588 ?auto_161589 ?auto_161590 ?auto_161591 ?auto_161592 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161595 - BLOCK
      ?auto_161596 - BLOCK
      ?auto_161597 - BLOCK
      ?auto_161598 - BLOCK
      ?auto_161599 - BLOCK
      ?auto_161600 - BLOCK
      ?auto_161601 - BLOCK
    )
    :vars
    (
      ?auto_161603 - BLOCK
      ?auto_161602 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161595 ?auto_161596 ) ) ( not ( = ?auto_161595 ?auto_161597 ) ) ( not ( = ?auto_161595 ?auto_161598 ) ) ( not ( = ?auto_161595 ?auto_161599 ) ) ( not ( = ?auto_161595 ?auto_161600 ) ) ( not ( = ?auto_161595 ?auto_161601 ) ) ( not ( = ?auto_161596 ?auto_161597 ) ) ( not ( = ?auto_161596 ?auto_161598 ) ) ( not ( = ?auto_161596 ?auto_161599 ) ) ( not ( = ?auto_161596 ?auto_161600 ) ) ( not ( = ?auto_161596 ?auto_161601 ) ) ( not ( = ?auto_161597 ?auto_161598 ) ) ( not ( = ?auto_161597 ?auto_161599 ) ) ( not ( = ?auto_161597 ?auto_161600 ) ) ( not ( = ?auto_161597 ?auto_161601 ) ) ( not ( = ?auto_161598 ?auto_161599 ) ) ( not ( = ?auto_161598 ?auto_161600 ) ) ( not ( = ?auto_161598 ?auto_161601 ) ) ( not ( = ?auto_161599 ?auto_161600 ) ) ( not ( = ?auto_161599 ?auto_161601 ) ) ( not ( = ?auto_161600 ?auto_161601 ) ) ( not ( = ?auto_161595 ?auto_161603 ) ) ( not ( = ?auto_161596 ?auto_161603 ) ) ( not ( = ?auto_161597 ?auto_161603 ) ) ( not ( = ?auto_161598 ?auto_161603 ) ) ( not ( = ?auto_161599 ?auto_161603 ) ) ( not ( = ?auto_161600 ?auto_161603 ) ) ( not ( = ?auto_161601 ?auto_161603 ) ) ( ON ?auto_161595 ?auto_161602 ) ( not ( = ?auto_161595 ?auto_161602 ) ) ( not ( = ?auto_161596 ?auto_161602 ) ) ( not ( = ?auto_161597 ?auto_161602 ) ) ( not ( = ?auto_161598 ?auto_161602 ) ) ( not ( = ?auto_161599 ?auto_161602 ) ) ( not ( = ?auto_161600 ?auto_161602 ) ) ( not ( = ?auto_161601 ?auto_161602 ) ) ( not ( = ?auto_161603 ?auto_161602 ) ) ( ON ?auto_161596 ?auto_161595 ) ( ON-TABLE ?auto_161602 ) ( ON ?auto_161597 ?auto_161596 ) ( ON ?auto_161598 ?auto_161597 ) ( ON ?auto_161599 ?auto_161598 ) ( ON ?auto_161600 ?auto_161599 ) ( ON ?auto_161601 ?auto_161600 ) ( CLEAR ?auto_161601 ) ( HOLDING ?auto_161603 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161603 )
      ( MAKE-7PILE ?auto_161595 ?auto_161596 ?auto_161597 ?auto_161598 ?auto_161599 ?auto_161600 ?auto_161601 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161604 - BLOCK
      ?auto_161605 - BLOCK
      ?auto_161606 - BLOCK
      ?auto_161607 - BLOCK
      ?auto_161608 - BLOCK
      ?auto_161609 - BLOCK
      ?auto_161610 - BLOCK
    )
    :vars
    (
      ?auto_161612 - BLOCK
      ?auto_161611 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161604 ?auto_161605 ) ) ( not ( = ?auto_161604 ?auto_161606 ) ) ( not ( = ?auto_161604 ?auto_161607 ) ) ( not ( = ?auto_161604 ?auto_161608 ) ) ( not ( = ?auto_161604 ?auto_161609 ) ) ( not ( = ?auto_161604 ?auto_161610 ) ) ( not ( = ?auto_161605 ?auto_161606 ) ) ( not ( = ?auto_161605 ?auto_161607 ) ) ( not ( = ?auto_161605 ?auto_161608 ) ) ( not ( = ?auto_161605 ?auto_161609 ) ) ( not ( = ?auto_161605 ?auto_161610 ) ) ( not ( = ?auto_161606 ?auto_161607 ) ) ( not ( = ?auto_161606 ?auto_161608 ) ) ( not ( = ?auto_161606 ?auto_161609 ) ) ( not ( = ?auto_161606 ?auto_161610 ) ) ( not ( = ?auto_161607 ?auto_161608 ) ) ( not ( = ?auto_161607 ?auto_161609 ) ) ( not ( = ?auto_161607 ?auto_161610 ) ) ( not ( = ?auto_161608 ?auto_161609 ) ) ( not ( = ?auto_161608 ?auto_161610 ) ) ( not ( = ?auto_161609 ?auto_161610 ) ) ( not ( = ?auto_161604 ?auto_161612 ) ) ( not ( = ?auto_161605 ?auto_161612 ) ) ( not ( = ?auto_161606 ?auto_161612 ) ) ( not ( = ?auto_161607 ?auto_161612 ) ) ( not ( = ?auto_161608 ?auto_161612 ) ) ( not ( = ?auto_161609 ?auto_161612 ) ) ( not ( = ?auto_161610 ?auto_161612 ) ) ( ON ?auto_161604 ?auto_161611 ) ( not ( = ?auto_161604 ?auto_161611 ) ) ( not ( = ?auto_161605 ?auto_161611 ) ) ( not ( = ?auto_161606 ?auto_161611 ) ) ( not ( = ?auto_161607 ?auto_161611 ) ) ( not ( = ?auto_161608 ?auto_161611 ) ) ( not ( = ?auto_161609 ?auto_161611 ) ) ( not ( = ?auto_161610 ?auto_161611 ) ) ( not ( = ?auto_161612 ?auto_161611 ) ) ( ON ?auto_161605 ?auto_161604 ) ( ON-TABLE ?auto_161611 ) ( ON ?auto_161606 ?auto_161605 ) ( ON ?auto_161607 ?auto_161606 ) ( ON ?auto_161608 ?auto_161607 ) ( ON ?auto_161609 ?auto_161608 ) ( ON ?auto_161610 ?auto_161609 ) ( ON ?auto_161612 ?auto_161610 ) ( CLEAR ?auto_161612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_161611 ?auto_161604 ?auto_161605 ?auto_161606 ?auto_161607 ?auto_161608 ?auto_161609 ?auto_161610 )
      ( MAKE-7PILE ?auto_161604 ?auto_161605 ?auto_161606 ?auto_161607 ?auto_161608 ?auto_161609 ?auto_161610 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161629 - BLOCK
      ?auto_161630 - BLOCK
      ?auto_161631 - BLOCK
      ?auto_161632 - BLOCK
      ?auto_161633 - BLOCK
      ?auto_161634 - BLOCK
      ?auto_161635 - BLOCK
      ?auto_161636 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_161635 ) ( ON-TABLE ?auto_161629 ) ( ON ?auto_161630 ?auto_161629 ) ( ON ?auto_161631 ?auto_161630 ) ( ON ?auto_161632 ?auto_161631 ) ( ON ?auto_161633 ?auto_161632 ) ( ON ?auto_161634 ?auto_161633 ) ( ON ?auto_161635 ?auto_161634 ) ( not ( = ?auto_161629 ?auto_161630 ) ) ( not ( = ?auto_161629 ?auto_161631 ) ) ( not ( = ?auto_161629 ?auto_161632 ) ) ( not ( = ?auto_161629 ?auto_161633 ) ) ( not ( = ?auto_161629 ?auto_161634 ) ) ( not ( = ?auto_161629 ?auto_161635 ) ) ( not ( = ?auto_161629 ?auto_161636 ) ) ( not ( = ?auto_161630 ?auto_161631 ) ) ( not ( = ?auto_161630 ?auto_161632 ) ) ( not ( = ?auto_161630 ?auto_161633 ) ) ( not ( = ?auto_161630 ?auto_161634 ) ) ( not ( = ?auto_161630 ?auto_161635 ) ) ( not ( = ?auto_161630 ?auto_161636 ) ) ( not ( = ?auto_161631 ?auto_161632 ) ) ( not ( = ?auto_161631 ?auto_161633 ) ) ( not ( = ?auto_161631 ?auto_161634 ) ) ( not ( = ?auto_161631 ?auto_161635 ) ) ( not ( = ?auto_161631 ?auto_161636 ) ) ( not ( = ?auto_161632 ?auto_161633 ) ) ( not ( = ?auto_161632 ?auto_161634 ) ) ( not ( = ?auto_161632 ?auto_161635 ) ) ( not ( = ?auto_161632 ?auto_161636 ) ) ( not ( = ?auto_161633 ?auto_161634 ) ) ( not ( = ?auto_161633 ?auto_161635 ) ) ( not ( = ?auto_161633 ?auto_161636 ) ) ( not ( = ?auto_161634 ?auto_161635 ) ) ( not ( = ?auto_161634 ?auto_161636 ) ) ( not ( = ?auto_161635 ?auto_161636 ) ) ( ON-TABLE ?auto_161636 ) ( CLEAR ?auto_161636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_161636 )
      ( MAKE-8PILE ?auto_161629 ?auto_161630 ?auto_161631 ?auto_161632 ?auto_161633 ?auto_161634 ?auto_161635 ?auto_161636 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161637 - BLOCK
      ?auto_161638 - BLOCK
      ?auto_161639 - BLOCK
      ?auto_161640 - BLOCK
      ?auto_161641 - BLOCK
      ?auto_161642 - BLOCK
      ?auto_161643 - BLOCK
      ?auto_161644 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161637 ) ( ON ?auto_161638 ?auto_161637 ) ( ON ?auto_161639 ?auto_161638 ) ( ON ?auto_161640 ?auto_161639 ) ( ON ?auto_161641 ?auto_161640 ) ( ON ?auto_161642 ?auto_161641 ) ( not ( = ?auto_161637 ?auto_161638 ) ) ( not ( = ?auto_161637 ?auto_161639 ) ) ( not ( = ?auto_161637 ?auto_161640 ) ) ( not ( = ?auto_161637 ?auto_161641 ) ) ( not ( = ?auto_161637 ?auto_161642 ) ) ( not ( = ?auto_161637 ?auto_161643 ) ) ( not ( = ?auto_161637 ?auto_161644 ) ) ( not ( = ?auto_161638 ?auto_161639 ) ) ( not ( = ?auto_161638 ?auto_161640 ) ) ( not ( = ?auto_161638 ?auto_161641 ) ) ( not ( = ?auto_161638 ?auto_161642 ) ) ( not ( = ?auto_161638 ?auto_161643 ) ) ( not ( = ?auto_161638 ?auto_161644 ) ) ( not ( = ?auto_161639 ?auto_161640 ) ) ( not ( = ?auto_161639 ?auto_161641 ) ) ( not ( = ?auto_161639 ?auto_161642 ) ) ( not ( = ?auto_161639 ?auto_161643 ) ) ( not ( = ?auto_161639 ?auto_161644 ) ) ( not ( = ?auto_161640 ?auto_161641 ) ) ( not ( = ?auto_161640 ?auto_161642 ) ) ( not ( = ?auto_161640 ?auto_161643 ) ) ( not ( = ?auto_161640 ?auto_161644 ) ) ( not ( = ?auto_161641 ?auto_161642 ) ) ( not ( = ?auto_161641 ?auto_161643 ) ) ( not ( = ?auto_161641 ?auto_161644 ) ) ( not ( = ?auto_161642 ?auto_161643 ) ) ( not ( = ?auto_161642 ?auto_161644 ) ) ( not ( = ?auto_161643 ?auto_161644 ) ) ( ON-TABLE ?auto_161644 ) ( CLEAR ?auto_161644 ) ( HOLDING ?auto_161643 ) ( CLEAR ?auto_161642 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_161637 ?auto_161638 ?auto_161639 ?auto_161640 ?auto_161641 ?auto_161642 ?auto_161643 )
      ( MAKE-8PILE ?auto_161637 ?auto_161638 ?auto_161639 ?auto_161640 ?auto_161641 ?auto_161642 ?auto_161643 ?auto_161644 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161645 - BLOCK
      ?auto_161646 - BLOCK
      ?auto_161647 - BLOCK
      ?auto_161648 - BLOCK
      ?auto_161649 - BLOCK
      ?auto_161650 - BLOCK
      ?auto_161651 - BLOCK
      ?auto_161652 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161645 ) ( ON ?auto_161646 ?auto_161645 ) ( ON ?auto_161647 ?auto_161646 ) ( ON ?auto_161648 ?auto_161647 ) ( ON ?auto_161649 ?auto_161648 ) ( ON ?auto_161650 ?auto_161649 ) ( not ( = ?auto_161645 ?auto_161646 ) ) ( not ( = ?auto_161645 ?auto_161647 ) ) ( not ( = ?auto_161645 ?auto_161648 ) ) ( not ( = ?auto_161645 ?auto_161649 ) ) ( not ( = ?auto_161645 ?auto_161650 ) ) ( not ( = ?auto_161645 ?auto_161651 ) ) ( not ( = ?auto_161645 ?auto_161652 ) ) ( not ( = ?auto_161646 ?auto_161647 ) ) ( not ( = ?auto_161646 ?auto_161648 ) ) ( not ( = ?auto_161646 ?auto_161649 ) ) ( not ( = ?auto_161646 ?auto_161650 ) ) ( not ( = ?auto_161646 ?auto_161651 ) ) ( not ( = ?auto_161646 ?auto_161652 ) ) ( not ( = ?auto_161647 ?auto_161648 ) ) ( not ( = ?auto_161647 ?auto_161649 ) ) ( not ( = ?auto_161647 ?auto_161650 ) ) ( not ( = ?auto_161647 ?auto_161651 ) ) ( not ( = ?auto_161647 ?auto_161652 ) ) ( not ( = ?auto_161648 ?auto_161649 ) ) ( not ( = ?auto_161648 ?auto_161650 ) ) ( not ( = ?auto_161648 ?auto_161651 ) ) ( not ( = ?auto_161648 ?auto_161652 ) ) ( not ( = ?auto_161649 ?auto_161650 ) ) ( not ( = ?auto_161649 ?auto_161651 ) ) ( not ( = ?auto_161649 ?auto_161652 ) ) ( not ( = ?auto_161650 ?auto_161651 ) ) ( not ( = ?auto_161650 ?auto_161652 ) ) ( not ( = ?auto_161651 ?auto_161652 ) ) ( ON-TABLE ?auto_161652 ) ( CLEAR ?auto_161650 ) ( ON ?auto_161651 ?auto_161652 ) ( CLEAR ?auto_161651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161652 )
      ( MAKE-8PILE ?auto_161645 ?auto_161646 ?auto_161647 ?auto_161648 ?auto_161649 ?auto_161650 ?auto_161651 ?auto_161652 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161653 - BLOCK
      ?auto_161654 - BLOCK
      ?auto_161655 - BLOCK
      ?auto_161656 - BLOCK
      ?auto_161657 - BLOCK
      ?auto_161658 - BLOCK
      ?auto_161659 - BLOCK
      ?auto_161660 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161653 ) ( ON ?auto_161654 ?auto_161653 ) ( ON ?auto_161655 ?auto_161654 ) ( ON ?auto_161656 ?auto_161655 ) ( ON ?auto_161657 ?auto_161656 ) ( not ( = ?auto_161653 ?auto_161654 ) ) ( not ( = ?auto_161653 ?auto_161655 ) ) ( not ( = ?auto_161653 ?auto_161656 ) ) ( not ( = ?auto_161653 ?auto_161657 ) ) ( not ( = ?auto_161653 ?auto_161658 ) ) ( not ( = ?auto_161653 ?auto_161659 ) ) ( not ( = ?auto_161653 ?auto_161660 ) ) ( not ( = ?auto_161654 ?auto_161655 ) ) ( not ( = ?auto_161654 ?auto_161656 ) ) ( not ( = ?auto_161654 ?auto_161657 ) ) ( not ( = ?auto_161654 ?auto_161658 ) ) ( not ( = ?auto_161654 ?auto_161659 ) ) ( not ( = ?auto_161654 ?auto_161660 ) ) ( not ( = ?auto_161655 ?auto_161656 ) ) ( not ( = ?auto_161655 ?auto_161657 ) ) ( not ( = ?auto_161655 ?auto_161658 ) ) ( not ( = ?auto_161655 ?auto_161659 ) ) ( not ( = ?auto_161655 ?auto_161660 ) ) ( not ( = ?auto_161656 ?auto_161657 ) ) ( not ( = ?auto_161656 ?auto_161658 ) ) ( not ( = ?auto_161656 ?auto_161659 ) ) ( not ( = ?auto_161656 ?auto_161660 ) ) ( not ( = ?auto_161657 ?auto_161658 ) ) ( not ( = ?auto_161657 ?auto_161659 ) ) ( not ( = ?auto_161657 ?auto_161660 ) ) ( not ( = ?auto_161658 ?auto_161659 ) ) ( not ( = ?auto_161658 ?auto_161660 ) ) ( not ( = ?auto_161659 ?auto_161660 ) ) ( ON-TABLE ?auto_161660 ) ( ON ?auto_161659 ?auto_161660 ) ( CLEAR ?auto_161659 ) ( HOLDING ?auto_161658 ) ( CLEAR ?auto_161657 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161653 ?auto_161654 ?auto_161655 ?auto_161656 ?auto_161657 ?auto_161658 )
      ( MAKE-8PILE ?auto_161653 ?auto_161654 ?auto_161655 ?auto_161656 ?auto_161657 ?auto_161658 ?auto_161659 ?auto_161660 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161661 - BLOCK
      ?auto_161662 - BLOCK
      ?auto_161663 - BLOCK
      ?auto_161664 - BLOCK
      ?auto_161665 - BLOCK
      ?auto_161666 - BLOCK
      ?auto_161667 - BLOCK
      ?auto_161668 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161661 ) ( ON ?auto_161662 ?auto_161661 ) ( ON ?auto_161663 ?auto_161662 ) ( ON ?auto_161664 ?auto_161663 ) ( ON ?auto_161665 ?auto_161664 ) ( not ( = ?auto_161661 ?auto_161662 ) ) ( not ( = ?auto_161661 ?auto_161663 ) ) ( not ( = ?auto_161661 ?auto_161664 ) ) ( not ( = ?auto_161661 ?auto_161665 ) ) ( not ( = ?auto_161661 ?auto_161666 ) ) ( not ( = ?auto_161661 ?auto_161667 ) ) ( not ( = ?auto_161661 ?auto_161668 ) ) ( not ( = ?auto_161662 ?auto_161663 ) ) ( not ( = ?auto_161662 ?auto_161664 ) ) ( not ( = ?auto_161662 ?auto_161665 ) ) ( not ( = ?auto_161662 ?auto_161666 ) ) ( not ( = ?auto_161662 ?auto_161667 ) ) ( not ( = ?auto_161662 ?auto_161668 ) ) ( not ( = ?auto_161663 ?auto_161664 ) ) ( not ( = ?auto_161663 ?auto_161665 ) ) ( not ( = ?auto_161663 ?auto_161666 ) ) ( not ( = ?auto_161663 ?auto_161667 ) ) ( not ( = ?auto_161663 ?auto_161668 ) ) ( not ( = ?auto_161664 ?auto_161665 ) ) ( not ( = ?auto_161664 ?auto_161666 ) ) ( not ( = ?auto_161664 ?auto_161667 ) ) ( not ( = ?auto_161664 ?auto_161668 ) ) ( not ( = ?auto_161665 ?auto_161666 ) ) ( not ( = ?auto_161665 ?auto_161667 ) ) ( not ( = ?auto_161665 ?auto_161668 ) ) ( not ( = ?auto_161666 ?auto_161667 ) ) ( not ( = ?auto_161666 ?auto_161668 ) ) ( not ( = ?auto_161667 ?auto_161668 ) ) ( ON-TABLE ?auto_161668 ) ( ON ?auto_161667 ?auto_161668 ) ( CLEAR ?auto_161665 ) ( ON ?auto_161666 ?auto_161667 ) ( CLEAR ?auto_161666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161668 ?auto_161667 )
      ( MAKE-8PILE ?auto_161661 ?auto_161662 ?auto_161663 ?auto_161664 ?auto_161665 ?auto_161666 ?auto_161667 ?auto_161668 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161669 - BLOCK
      ?auto_161670 - BLOCK
      ?auto_161671 - BLOCK
      ?auto_161672 - BLOCK
      ?auto_161673 - BLOCK
      ?auto_161674 - BLOCK
      ?auto_161675 - BLOCK
      ?auto_161676 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161669 ) ( ON ?auto_161670 ?auto_161669 ) ( ON ?auto_161671 ?auto_161670 ) ( ON ?auto_161672 ?auto_161671 ) ( not ( = ?auto_161669 ?auto_161670 ) ) ( not ( = ?auto_161669 ?auto_161671 ) ) ( not ( = ?auto_161669 ?auto_161672 ) ) ( not ( = ?auto_161669 ?auto_161673 ) ) ( not ( = ?auto_161669 ?auto_161674 ) ) ( not ( = ?auto_161669 ?auto_161675 ) ) ( not ( = ?auto_161669 ?auto_161676 ) ) ( not ( = ?auto_161670 ?auto_161671 ) ) ( not ( = ?auto_161670 ?auto_161672 ) ) ( not ( = ?auto_161670 ?auto_161673 ) ) ( not ( = ?auto_161670 ?auto_161674 ) ) ( not ( = ?auto_161670 ?auto_161675 ) ) ( not ( = ?auto_161670 ?auto_161676 ) ) ( not ( = ?auto_161671 ?auto_161672 ) ) ( not ( = ?auto_161671 ?auto_161673 ) ) ( not ( = ?auto_161671 ?auto_161674 ) ) ( not ( = ?auto_161671 ?auto_161675 ) ) ( not ( = ?auto_161671 ?auto_161676 ) ) ( not ( = ?auto_161672 ?auto_161673 ) ) ( not ( = ?auto_161672 ?auto_161674 ) ) ( not ( = ?auto_161672 ?auto_161675 ) ) ( not ( = ?auto_161672 ?auto_161676 ) ) ( not ( = ?auto_161673 ?auto_161674 ) ) ( not ( = ?auto_161673 ?auto_161675 ) ) ( not ( = ?auto_161673 ?auto_161676 ) ) ( not ( = ?auto_161674 ?auto_161675 ) ) ( not ( = ?auto_161674 ?auto_161676 ) ) ( not ( = ?auto_161675 ?auto_161676 ) ) ( ON-TABLE ?auto_161676 ) ( ON ?auto_161675 ?auto_161676 ) ( ON ?auto_161674 ?auto_161675 ) ( CLEAR ?auto_161674 ) ( HOLDING ?auto_161673 ) ( CLEAR ?auto_161672 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161669 ?auto_161670 ?auto_161671 ?auto_161672 ?auto_161673 )
      ( MAKE-8PILE ?auto_161669 ?auto_161670 ?auto_161671 ?auto_161672 ?auto_161673 ?auto_161674 ?auto_161675 ?auto_161676 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161677 - BLOCK
      ?auto_161678 - BLOCK
      ?auto_161679 - BLOCK
      ?auto_161680 - BLOCK
      ?auto_161681 - BLOCK
      ?auto_161682 - BLOCK
      ?auto_161683 - BLOCK
      ?auto_161684 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161677 ) ( ON ?auto_161678 ?auto_161677 ) ( ON ?auto_161679 ?auto_161678 ) ( ON ?auto_161680 ?auto_161679 ) ( not ( = ?auto_161677 ?auto_161678 ) ) ( not ( = ?auto_161677 ?auto_161679 ) ) ( not ( = ?auto_161677 ?auto_161680 ) ) ( not ( = ?auto_161677 ?auto_161681 ) ) ( not ( = ?auto_161677 ?auto_161682 ) ) ( not ( = ?auto_161677 ?auto_161683 ) ) ( not ( = ?auto_161677 ?auto_161684 ) ) ( not ( = ?auto_161678 ?auto_161679 ) ) ( not ( = ?auto_161678 ?auto_161680 ) ) ( not ( = ?auto_161678 ?auto_161681 ) ) ( not ( = ?auto_161678 ?auto_161682 ) ) ( not ( = ?auto_161678 ?auto_161683 ) ) ( not ( = ?auto_161678 ?auto_161684 ) ) ( not ( = ?auto_161679 ?auto_161680 ) ) ( not ( = ?auto_161679 ?auto_161681 ) ) ( not ( = ?auto_161679 ?auto_161682 ) ) ( not ( = ?auto_161679 ?auto_161683 ) ) ( not ( = ?auto_161679 ?auto_161684 ) ) ( not ( = ?auto_161680 ?auto_161681 ) ) ( not ( = ?auto_161680 ?auto_161682 ) ) ( not ( = ?auto_161680 ?auto_161683 ) ) ( not ( = ?auto_161680 ?auto_161684 ) ) ( not ( = ?auto_161681 ?auto_161682 ) ) ( not ( = ?auto_161681 ?auto_161683 ) ) ( not ( = ?auto_161681 ?auto_161684 ) ) ( not ( = ?auto_161682 ?auto_161683 ) ) ( not ( = ?auto_161682 ?auto_161684 ) ) ( not ( = ?auto_161683 ?auto_161684 ) ) ( ON-TABLE ?auto_161684 ) ( ON ?auto_161683 ?auto_161684 ) ( ON ?auto_161682 ?auto_161683 ) ( CLEAR ?auto_161680 ) ( ON ?auto_161681 ?auto_161682 ) ( CLEAR ?auto_161681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161684 ?auto_161683 ?auto_161682 )
      ( MAKE-8PILE ?auto_161677 ?auto_161678 ?auto_161679 ?auto_161680 ?auto_161681 ?auto_161682 ?auto_161683 ?auto_161684 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161685 - BLOCK
      ?auto_161686 - BLOCK
      ?auto_161687 - BLOCK
      ?auto_161688 - BLOCK
      ?auto_161689 - BLOCK
      ?auto_161690 - BLOCK
      ?auto_161691 - BLOCK
      ?auto_161692 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161685 ) ( ON ?auto_161686 ?auto_161685 ) ( ON ?auto_161687 ?auto_161686 ) ( not ( = ?auto_161685 ?auto_161686 ) ) ( not ( = ?auto_161685 ?auto_161687 ) ) ( not ( = ?auto_161685 ?auto_161688 ) ) ( not ( = ?auto_161685 ?auto_161689 ) ) ( not ( = ?auto_161685 ?auto_161690 ) ) ( not ( = ?auto_161685 ?auto_161691 ) ) ( not ( = ?auto_161685 ?auto_161692 ) ) ( not ( = ?auto_161686 ?auto_161687 ) ) ( not ( = ?auto_161686 ?auto_161688 ) ) ( not ( = ?auto_161686 ?auto_161689 ) ) ( not ( = ?auto_161686 ?auto_161690 ) ) ( not ( = ?auto_161686 ?auto_161691 ) ) ( not ( = ?auto_161686 ?auto_161692 ) ) ( not ( = ?auto_161687 ?auto_161688 ) ) ( not ( = ?auto_161687 ?auto_161689 ) ) ( not ( = ?auto_161687 ?auto_161690 ) ) ( not ( = ?auto_161687 ?auto_161691 ) ) ( not ( = ?auto_161687 ?auto_161692 ) ) ( not ( = ?auto_161688 ?auto_161689 ) ) ( not ( = ?auto_161688 ?auto_161690 ) ) ( not ( = ?auto_161688 ?auto_161691 ) ) ( not ( = ?auto_161688 ?auto_161692 ) ) ( not ( = ?auto_161689 ?auto_161690 ) ) ( not ( = ?auto_161689 ?auto_161691 ) ) ( not ( = ?auto_161689 ?auto_161692 ) ) ( not ( = ?auto_161690 ?auto_161691 ) ) ( not ( = ?auto_161690 ?auto_161692 ) ) ( not ( = ?auto_161691 ?auto_161692 ) ) ( ON-TABLE ?auto_161692 ) ( ON ?auto_161691 ?auto_161692 ) ( ON ?auto_161690 ?auto_161691 ) ( ON ?auto_161689 ?auto_161690 ) ( CLEAR ?auto_161689 ) ( HOLDING ?auto_161688 ) ( CLEAR ?auto_161687 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161685 ?auto_161686 ?auto_161687 ?auto_161688 )
      ( MAKE-8PILE ?auto_161685 ?auto_161686 ?auto_161687 ?auto_161688 ?auto_161689 ?auto_161690 ?auto_161691 ?auto_161692 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161693 - BLOCK
      ?auto_161694 - BLOCK
      ?auto_161695 - BLOCK
      ?auto_161696 - BLOCK
      ?auto_161697 - BLOCK
      ?auto_161698 - BLOCK
      ?auto_161699 - BLOCK
      ?auto_161700 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161693 ) ( ON ?auto_161694 ?auto_161693 ) ( ON ?auto_161695 ?auto_161694 ) ( not ( = ?auto_161693 ?auto_161694 ) ) ( not ( = ?auto_161693 ?auto_161695 ) ) ( not ( = ?auto_161693 ?auto_161696 ) ) ( not ( = ?auto_161693 ?auto_161697 ) ) ( not ( = ?auto_161693 ?auto_161698 ) ) ( not ( = ?auto_161693 ?auto_161699 ) ) ( not ( = ?auto_161693 ?auto_161700 ) ) ( not ( = ?auto_161694 ?auto_161695 ) ) ( not ( = ?auto_161694 ?auto_161696 ) ) ( not ( = ?auto_161694 ?auto_161697 ) ) ( not ( = ?auto_161694 ?auto_161698 ) ) ( not ( = ?auto_161694 ?auto_161699 ) ) ( not ( = ?auto_161694 ?auto_161700 ) ) ( not ( = ?auto_161695 ?auto_161696 ) ) ( not ( = ?auto_161695 ?auto_161697 ) ) ( not ( = ?auto_161695 ?auto_161698 ) ) ( not ( = ?auto_161695 ?auto_161699 ) ) ( not ( = ?auto_161695 ?auto_161700 ) ) ( not ( = ?auto_161696 ?auto_161697 ) ) ( not ( = ?auto_161696 ?auto_161698 ) ) ( not ( = ?auto_161696 ?auto_161699 ) ) ( not ( = ?auto_161696 ?auto_161700 ) ) ( not ( = ?auto_161697 ?auto_161698 ) ) ( not ( = ?auto_161697 ?auto_161699 ) ) ( not ( = ?auto_161697 ?auto_161700 ) ) ( not ( = ?auto_161698 ?auto_161699 ) ) ( not ( = ?auto_161698 ?auto_161700 ) ) ( not ( = ?auto_161699 ?auto_161700 ) ) ( ON-TABLE ?auto_161700 ) ( ON ?auto_161699 ?auto_161700 ) ( ON ?auto_161698 ?auto_161699 ) ( ON ?auto_161697 ?auto_161698 ) ( CLEAR ?auto_161695 ) ( ON ?auto_161696 ?auto_161697 ) ( CLEAR ?auto_161696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161700 ?auto_161699 ?auto_161698 ?auto_161697 )
      ( MAKE-8PILE ?auto_161693 ?auto_161694 ?auto_161695 ?auto_161696 ?auto_161697 ?auto_161698 ?auto_161699 ?auto_161700 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161701 - BLOCK
      ?auto_161702 - BLOCK
      ?auto_161703 - BLOCK
      ?auto_161704 - BLOCK
      ?auto_161705 - BLOCK
      ?auto_161706 - BLOCK
      ?auto_161707 - BLOCK
      ?auto_161708 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161701 ) ( ON ?auto_161702 ?auto_161701 ) ( not ( = ?auto_161701 ?auto_161702 ) ) ( not ( = ?auto_161701 ?auto_161703 ) ) ( not ( = ?auto_161701 ?auto_161704 ) ) ( not ( = ?auto_161701 ?auto_161705 ) ) ( not ( = ?auto_161701 ?auto_161706 ) ) ( not ( = ?auto_161701 ?auto_161707 ) ) ( not ( = ?auto_161701 ?auto_161708 ) ) ( not ( = ?auto_161702 ?auto_161703 ) ) ( not ( = ?auto_161702 ?auto_161704 ) ) ( not ( = ?auto_161702 ?auto_161705 ) ) ( not ( = ?auto_161702 ?auto_161706 ) ) ( not ( = ?auto_161702 ?auto_161707 ) ) ( not ( = ?auto_161702 ?auto_161708 ) ) ( not ( = ?auto_161703 ?auto_161704 ) ) ( not ( = ?auto_161703 ?auto_161705 ) ) ( not ( = ?auto_161703 ?auto_161706 ) ) ( not ( = ?auto_161703 ?auto_161707 ) ) ( not ( = ?auto_161703 ?auto_161708 ) ) ( not ( = ?auto_161704 ?auto_161705 ) ) ( not ( = ?auto_161704 ?auto_161706 ) ) ( not ( = ?auto_161704 ?auto_161707 ) ) ( not ( = ?auto_161704 ?auto_161708 ) ) ( not ( = ?auto_161705 ?auto_161706 ) ) ( not ( = ?auto_161705 ?auto_161707 ) ) ( not ( = ?auto_161705 ?auto_161708 ) ) ( not ( = ?auto_161706 ?auto_161707 ) ) ( not ( = ?auto_161706 ?auto_161708 ) ) ( not ( = ?auto_161707 ?auto_161708 ) ) ( ON-TABLE ?auto_161708 ) ( ON ?auto_161707 ?auto_161708 ) ( ON ?auto_161706 ?auto_161707 ) ( ON ?auto_161705 ?auto_161706 ) ( ON ?auto_161704 ?auto_161705 ) ( CLEAR ?auto_161704 ) ( HOLDING ?auto_161703 ) ( CLEAR ?auto_161702 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161701 ?auto_161702 ?auto_161703 )
      ( MAKE-8PILE ?auto_161701 ?auto_161702 ?auto_161703 ?auto_161704 ?auto_161705 ?auto_161706 ?auto_161707 ?auto_161708 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161709 - BLOCK
      ?auto_161710 - BLOCK
      ?auto_161711 - BLOCK
      ?auto_161712 - BLOCK
      ?auto_161713 - BLOCK
      ?auto_161714 - BLOCK
      ?auto_161715 - BLOCK
      ?auto_161716 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161709 ) ( ON ?auto_161710 ?auto_161709 ) ( not ( = ?auto_161709 ?auto_161710 ) ) ( not ( = ?auto_161709 ?auto_161711 ) ) ( not ( = ?auto_161709 ?auto_161712 ) ) ( not ( = ?auto_161709 ?auto_161713 ) ) ( not ( = ?auto_161709 ?auto_161714 ) ) ( not ( = ?auto_161709 ?auto_161715 ) ) ( not ( = ?auto_161709 ?auto_161716 ) ) ( not ( = ?auto_161710 ?auto_161711 ) ) ( not ( = ?auto_161710 ?auto_161712 ) ) ( not ( = ?auto_161710 ?auto_161713 ) ) ( not ( = ?auto_161710 ?auto_161714 ) ) ( not ( = ?auto_161710 ?auto_161715 ) ) ( not ( = ?auto_161710 ?auto_161716 ) ) ( not ( = ?auto_161711 ?auto_161712 ) ) ( not ( = ?auto_161711 ?auto_161713 ) ) ( not ( = ?auto_161711 ?auto_161714 ) ) ( not ( = ?auto_161711 ?auto_161715 ) ) ( not ( = ?auto_161711 ?auto_161716 ) ) ( not ( = ?auto_161712 ?auto_161713 ) ) ( not ( = ?auto_161712 ?auto_161714 ) ) ( not ( = ?auto_161712 ?auto_161715 ) ) ( not ( = ?auto_161712 ?auto_161716 ) ) ( not ( = ?auto_161713 ?auto_161714 ) ) ( not ( = ?auto_161713 ?auto_161715 ) ) ( not ( = ?auto_161713 ?auto_161716 ) ) ( not ( = ?auto_161714 ?auto_161715 ) ) ( not ( = ?auto_161714 ?auto_161716 ) ) ( not ( = ?auto_161715 ?auto_161716 ) ) ( ON-TABLE ?auto_161716 ) ( ON ?auto_161715 ?auto_161716 ) ( ON ?auto_161714 ?auto_161715 ) ( ON ?auto_161713 ?auto_161714 ) ( ON ?auto_161712 ?auto_161713 ) ( CLEAR ?auto_161710 ) ( ON ?auto_161711 ?auto_161712 ) ( CLEAR ?auto_161711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161716 ?auto_161715 ?auto_161714 ?auto_161713 ?auto_161712 )
      ( MAKE-8PILE ?auto_161709 ?auto_161710 ?auto_161711 ?auto_161712 ?auto_161713 ?auto_161714 ?auto_161715 ?auto_161716 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161717 - BLOCK
      ?auto_161718 - BLOCK
      ?auto_161719 - BLOCK
      ?auto_161720 - BLOCK
      ?auto_161721 - BLOCK
      ?auto_161722 - BLOCK
      ?auto_161723 - BLOCK
      ?auto_161724 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161717 ) ( not ( = ?auto_161717 ?auto_161718 ) ) ( not ( = ?auto_161717 ?auto_161719 ) ) ( not ( = ?auto_161717 ?auto_161720 ) ) ( not ( = ?auto_161717 ?auto_161721 ) ) ( not ( = ?auto_161717 ?auto_161722 ) ) ( not ( = ?auto_161717 ?auto_161723 ) ) ( not ( = ?auto_161717 ?auto_161724 ) ) ( not ( = ?auto_161718 ?auto_161719 ) ) ( not ( = ?auto_161718 ?auto_161720 ) ) ( not ( = ?auto_161718 ?auto_161721 ) ) ( not ( = ?auto_161718 ?auto_161722 ) ) ( not ( = ?auto_161718 ?auto_161723 ) ) ( not ( = ?auto_161718 ?auto_161724 ) ) ( not ( = ?auto_161719 ?auto_161720 ) ) ( not ( = ?auto_161719 ?auto_161721 ) ) ( not ( = ?auto_161719 ?auto_161722 ) ) ( not ( = ?auto_161719 ?auto_161723 ) ) ( not ( = ?auto_161719 ?auto_161724 ) ) ( not ( = ?auto_161720 ?auto_161721 ) ) ( not ( = ?auto_161720 ?auto_161722 ) ) ( not ( = ?auto_161720 ?auto_161723 ) ) ( not ( = ?auto_161720 ?auto_161724 ) ) ( not ( = ?auto_161721 ?auto_161722 ) ) ( not ( = ?auto_161721 ?auto_161723 ) ) ( not ( = ?auto_161721 ?auto_161724 ) ) ( not ( = ?auto_161722 ?auto_161723 ) ) ( not ( = ?auto_161722 ?auto_161724 ) ) ( not ( = ?auto_161723 ?auto_161724 ) ) ( ON-TABLE ?auto_161724 ) ( ON ?auto_161723 ?auto_161724 ) ( ON ?auto_161722 ?auto_161723 ) ( ON ?auto_161721 ?auto_161722 ) ( ON ?auto_161720 ?auto_161721 ) ( ON ?auto_161719 ?auto_161720 ) ( CLEAR ?auto_161719 ) ( HOLDING ?auto_161718 ) ( CLEAR ?auto_161717 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161717 ?auto_161718 )
      ( MAKE-8PILE ?auto_161717 ?auto_161718 ?auto_161719 ?auto_161720 ?auto_161721 ?auto_161722 ?auto_161723 ?auto_161724 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161725 - BLOCK
      ?auto_161726 - BLOCK
      ?auto_161727 - BLOCK
      ?auto_161728 - BLOCK
      ?auto_161729 - BLOCK
      ?auto_161730 - BLOCK
      ?auto_161731 - BLOCK
      ?auto_161732 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161725 ) ( not ( = ?auto_161725 ?auto_161726 ) ) ( not ( = ?auto_161725 ?auto_161727 ) ) ( not ( = ?auto_161725 ?auto_161728 ) ) ( not ( = ?auto_161725 ?auto_161729 ) ) ( not ( = ?auto_161725 ?auto_161730 ) ) ( not ( = ?auto_161725 ?auto_161731 ) ) ( not ( = ?auto_161725 ?auto_161732 ) ) ( not ( = ?auto_161726 ?auto_161727 ) ) ( not ( = ?auto_161726 ?auto_161728 ) ) ( not ( = ?auto_161726 ?auto_161729 ) ) ( not ( = ?auto_161726 ?auto_161730 ) ) ( not ( = ?auto_161726 ?auto_161731 ) ) ( not ( = ?auto_161726 ?auto_161732 ) ) ( not ( = ?auto_161727 ?auto_161728 ) ) ( not ( = ?auto_161727 ?auto_161729 ) ) ( not ( = ?auto_161727 ?auto_161730 ) ) ( not ( = ?auto_161727 ?auto_161731 ) ) ( not ( = ?auto_161727 ?auto_161732 ) ) ( not ( = ?auto_161728 ?auto_161729 ) ) ( not ( = ?auto_161728 ?auto_161730 ) ) ( not ( = ?auto_161728 ?auto_161731 ) ) ( not ( = ?auto_161728 ?auto_161732 ) ) ( not ( = ?auto_161729 ?auto_161730 ) ) ( not ( = ?auto_161729 ?auto_161731 ) ) ( not ( = ?auto_161729 ?auto_161732 ) ) ( not ( = ?auto_161730 ?auto_161731 ) ) ( not ( = ?auto_161730 ?auto_161732 ) ) ( not ( = ?auto_161731 ?auto_161732 ) ) ( ON-TABLE ?auto_161732 ) ( ON ?auto_161731 ?auto_161732 ) ( ON ?auto_161730 ?auto_161731 ) ( ON ?auto_161729 ?auto_161730 ) ( ON ?auto_161728 ?auto_161729 ) ( ON ?auto_161727 ?auto_161728 ) ( CLEAR ?auto_161725 ) ( ON ?auto_161726 ?auto_161727 ) ( CLEAR ?auto_161726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161732 ?auto_161731 ?auto_161730 ?auto_161729 ?auto_161728 ?auto_161727 )
      ( MAKE-8PILE ?auto_161725 ?auto_161726 ?auto_161727 ?auto_161728 ?auto_161729 ?auto_161730 ?auto_161731 ?auto_161732 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161733 - BLOCK
      ?auto_161734 - BLOCK
      ?auto_161735 - BLOCK
      ?auto_161736 - BLOCK
      ?auto_161737 - BLOCK
      ?auto_161738 - BLOCK
      ?auto_161739 - BLOCK
      ?auto_161740 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161733 ?auto_161734 ) ) ( not ( = ?auto_161733 ?auto_161735 ) ) ( not ( = ?auto_161733 ?auto_161736 ) ) ( not ( = ?auto_161733 ?auto_161737 ) ) ( not ( = ?auto_161733 ?auto_161738 ) ) ( not ( = ?auto_161733 ?auto_161739 ) ) ( not ( = ?auto_161733 ?auto_161740 ) ) ( not ( = ?auto_161734 ?auto_161735 ) ) ( not ( = ?auto_161734 ?auto_161736 ) ) ( not ( = ?auto_161734 ?auto_161737 ) ) ( not ( = ?auto_161734 ?auto_161738 ) ) ( not ( = ?auto_161734 ?auto_161739 ) ) ( not ( = ?auto_161734 ?auto_161740 ) ) ( not ( = ?auto_161735 ?auto_161736 ) ) ( not ( = ?auto_161735 ?auto_161737 ) ) ( not ( = ?auto_161735 ?auto_161738 ) ) ( not ( = ?auto_161735 ?auto_161739 ) ) ( not ( = ?auto_161735 ?auto_161740 ) ) ( not ( = ?auto_161736 ?auto_161737 ) ) ( not ( = ?auto_161736 ?auto_161738 ) ) ( not ( = ?auto_161736 ?auto_161739 ) ) ( not ( = ?auto_161736 ?auto_161740 ) ) ( not ( = ?auto_161737 ?auto_161738 ) ) ( not ( = ?auto_161737 ?auto_161739 ) ) ( not ( = ?auto_161737 ?auto_161740 ) ) ( not ( = ?auto_161738 ?auto_161739 ) ) ( not ( = ?auto_161738 ?auto_161740 ) ) ( not ( = ?auto_161739 ?auto_161740 ) ) ( ON-TABLE ?auto_161740 ) ( ON ?auto_161739 ?auto_161740 ) ( ON ?auto_161738 ?auto_161739 ) ( ON ?auto_161737 ?auto_161738 ) ( ON ?auto_161736 ?auto_161737 ) ( ON ?auto_161735 ?auto_161736 ) ( ON ?auto_161734 ?auto_161735 ) ( CLEAR ?auto_161734 ) ( HOLDING ?auto_161733 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161733 )
      ( MAKE-8PILE ?auto_161733 ?auto_161734 ?auto_161735 ?auto_161736 ?auto_161737 ?auto_161738 ?auto_161739 ?auto_161740 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161741 - BLOCK
      ?auto_161742 - BLOCK
      ?auto_161743 - BLOCK
      ?auto_161744 - BLOCK
      ?auto_161745 - BLOCK
      ?auto_161746 - BLOCK
      ?auto_161747 - BLOCK
      ?auto_161748 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161741 ?auto_161742 ) ) ( not ( = ?auto_161741 ?auto_161743 ) ) ( not ( = ?auto_161741 ?auto_161744 ) ) ( not ( = ?auto_161741 ?auto_161745 ) ) ( not ( = ?auto_161741 ?auto_161746 ) ) ( not ( = ?auto_161741 ?auto_161747 ) ) ( not ( = ?auto_161741 ?auto_161748 ) ) ( not ( = ?auto_161742 ?auto_161743 ) ) ( not ( = ?auto_161742 ?auto_161744 ) ) ( not ( = ?auto_161742 ?auto_161745 ) ) ( not ( = ?auto_161742 ?auto_161746 ) ) ( not ( = ?auto_161742 ?auto_161747 ) ) ( not ( = ?auto_161742 ?auto_161748 ) ) ( not ( = ?auto_161743 ?auto_161744 ) ) ( not ( = ?auto_161743 ?auto_161745 ) ) ( not ( = ?auto_161743 ?auto_161746 ) ) ( not ( = ?auto_161743 ?auto_161747 ) ) ( not ( = ?auto_161743 ?auto_161748 ) ) ( not ( = ?auto_161744 ?auto_161745 ) ) ( not ( = ?auto_161744 ?auto_161746 ) ) ( not ( = ?auto_161744 ?auto_161747 ) ) ( not ( = ?auto_161744 ?auto_161748 ) ) ( not ( = ?auto_161745 ?auto_161746 ) ) ( not ( = ?auto_161745 ?auto_161747 ) ) ( not ( = ?auto_161745 ?auto_161748 ) ) ( not ( = ?auto_161746 ?auto_161747 ) ) ( not ( = ?auto_161746 ?auto_161748 ) ) ( not ( = ?auto_161747 ?auto_161748 ) ) ( ON-TABLE ?auto_161748 ) ( ON ?auto_161747 ?auto_161748 ) ( ON ?auto_161746 ?auto_161747 ) ( ON ?auto_161745 ?auto_161746 ) ( ON ?auto_161744 ?auto_161745 ) ( ON ?auto_161743 ?auto_161744 ) ( ON ?auto_161742 ?auto_161743 ) ( ON ?auto_161741 ?auto_161742 ) ( CLEAR ?auto_161741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_161748 ?auto_161747 ?auto_161746 ?auto_161745 ?auto_161744 ?auto_161743 ?auto_161742 )
      ( MAKE-8PILE ?auto_161741 ?auto_161742 ?auto_161743 ?auto_161744 ?auto_161745 ?auto_161746 ?auto_161747 ?auto_161748 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161757 - BLOCK
      ?auto_161758 - BLOCK
      ?auto_161759 - BLOCK
      ?auto_161760 - BLOCK
      ?auto_161761 - BLOCK
      ?auto_161762 - BLOCK
      ?auto_161763 - BLOCK
      ?auto_161764 - BLOCK
    )
    :vars
    (
      ?auto_161765 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161757 ?auto_161758 ) ) ( not ( = ?auto_161757 ?auto_161759 ) ) ( not ( = ?auto_161757 ?auto_161760 ) ) ( not ( = ?auto_161757 ?auto_161761 ) ) ( not ( = ?auto_161757 ?auto_161762 ) ) ( not ( = ?auto_161757 ?auto_161763 ) ) ( not ( = ?auto_161757 ?auto_161764 ) ) ( not ( = ?auto_161758 ?auto_161759 ) ) ( not ( = ?auto_161758 ?auto_161760 ) ) ( not ( = ?auto_161758 ?auto_161761 ) ) ( not ( = ?auto_161758 ?auto_161762 ) ) ( not ( = ?auto_161758 ?auto_161763 ) ) ( not ( = ?auto_161758 ?auto_161764 ) ) ( not ( = ?auto_161759 ?auto_161760 ) ) ( not ( = ?auto_161759 ?auto_161761 ) ) ( not ( = ?auto_161759 ?auto_161762 ) ) ( not ( = ?auto_161759 ?auto_161763 ) ) ( not ( = ?auto_161759 ?auto_161764 ) ) ( not ( = ?auto_161760 ?auto_161761 ) ) ( not ( = ?auto_161760 ?auto_161762 ) ) ( not ( = ?auto_161760 ?auto_161763 ) ) ( not ( = ?auto_161760 ?auto_161764 ) ) ( not ( = ?auto_161761 ?auto_161762 ) ) ( not ( = ?auto_161761 ?auto_161763 ) ) ( not ( = ?auto_161761 ?auto_161764 ) ) ( not ( = ?auto_161762 ?auto_161763 ) ) ( not ( = ?auto_161762 ?auto_161764 ) ) ( not ( = ?auto_161763 ?auto_161764 ) ) ( ON-TABLE ?auto_161764 ) ( ON ?auto_161763 ?auto_161764 ) ( ON ?auto_161762 ?auto_161763 ) ( ON ?auto_161761 ?auto_161762 ) ( ON ?auto_161760 ?auto_161761 ) ( ON ?auto_161759 ?auto_161760 ) ( ON ?auto_161758 ?auto_161759 ) ( CLEAR ?auto_161758 ) ( ON ?auto_161757 ?auto_161765 ) ( CLEAR ?auto_161757 ) ( HAND-EMPTY ) ( not ( = ?auto_161757 ?auto_161765 ) ) ( not ( = ?auto_161758 ?auto_161765 ) ) ( not ( = ?auto_161759 ?auto_161765 ) ) ( not ( = ?auto_161760 ?auto_161765 ) ) ( not ( = ?auto_161761 ?auto_161765 ) ) ( not ( = ?auto_161762 ?auto_161765 ) ) ( not ( = ?auto_161763 ?auto_161765 ) ) ( not ( = ?auto_161764 ?auto_161765 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161757 ?auto_161765 )
      ( MAKE-8PILE ?auto_161757 ?auto_161758 ?auto_161759 ?auto_161760 ?auto_161761 ?auto_161762 ?auto_161763 ?auto_161764 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161766 - BLOCK
      ?auto_161767 - BLOCK
      ?auto_161768 - BLOCK
      ?auto_161769 - BLOCK
      ?auto_161770 - BLOCK
      ?auto_161771 - BLOCK
      ?auto_161772 - BLOCK
      ?auto_161773 - BLOCK
    )
    :vars
    (
      ?auto_161774 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161766 ?auto_161767 ) ) ( not ( = ?auto_161766 ?auto_161768 ) ) ( not ( = ?auto_161766 ?auto_161769 ) ) ( not ( = ?auto_161766 ?auto_161770 ) ) ( not ( = ?auto_161766 ?auto_161771 ) ) ( not ( = ?auto_161766 ?auto_161772 ) ) ( not ( = ?auto_161766 ?auto_161773 ) ) ( not ( = ?auto_161767 ?auto_161768 ) ) ( not ( = ?auto_161767 ?auto_161769 ) ) ( not ( = ?auto_161767 ?auto_161770 ) ) ( not ( = ?auto_161767 ?auto_161771 ) ) ( not ( = ?auto_161767 ?auto_161772 ) ) ( not ( = ?auto_161767 ?auto_161773 ) ) ( not ( = ?auto_161768 ?auto_161769 ) ) ( not ( = ?auto_161768 ?auto_161770 ) ) ( not ( = ?auto_161768 ?auto_161771 ) ) ( not ( = ?auto_161768 ?auto_161772 ) ) ( not ( = ?auto_161768 ?auto_161773 ) ) ( not ( = ?auto_161769 ?auto_161770 ) ) ( not ( = ?auto_161769 ?auto_161771 ) ) ( not ( = ?auto_161769 ?auto_161772 ) ) ( not ( = ?auto_161769 ?auto_161773 ) ) ( not ( = ?auto_161770 ?auto_161771 ) ) ( not ( = ?auto_161770 ?auto_161772 ) ) ( not ( = ?auto_161770 ?auto_161773 ) ) ( not ( = ?auto_161771 ?auto_161772 ) ) ( not ( = ?auto_161771 ?auto_161773 ) ) ( not ( = ?auto_161772 ?auto_161773 ) ) ( ON-TABLE ?auto_161773 ) ( ON ?auto_161772 ?auto_161773 ) ( ON ?auto_161771 ?auto_161772 ) ( ON ?auto_161770 ?auto_161771 ) ( ON ?auto_161769 ?auto_161770 ) ( ON ?auto_161768 ?auto_161769 ) ( ON ?auto_161766 ?auto_161774 ) ( CLEAR ?auto_161766 ) ( not ( = ?auto_161766 ?auto_161774 ) ) ( not ( = ?auto_161767 ?auto_161774 ) ) ( not ( = ?auto_161768 ?auto_161774 ) ) ( not ( = ?auto_161769 ?auto_161774 ) ) ( not ( = ?auto_161770 ?auto_161774 ) ) ( not ( = ?auto_161771 ?auto_161774 ) ) ( not ( = ?auto_161772 ?auto_161774 ) ) ( not ( = ?auto_161773 ?auto_161774 ) ) ( HOLDING ?auto_161767 ) ( CLEAR ?auto_161768 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_161773 ?auto_161772 ?auto_161771 ?auto_161770 ?auto_161769 ?auto_161768 ?auto_161767 )
      ( MAKE-8PILE ?auto_161766 ?auto_161767 ?auto_161768 ?auto_161769 ?auto_161770 ?auto_161771 ?auto_161772 ?auto_161773 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161775 - BLOCK
      ?auto_161776 - BLOCK
      ?auto_161777 - BLOCK
      ?auto_161778 - BLOCK
      ?auto_161779 - BLOCK
      ?auto_161780 - BLOCK
      ?auto_161781 - BLOCK
      ?auto_161782 - BLOCK
    )
    :vars
    (
      ?auto_161783 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161775 ?auto_161776 ) ) ( not ( = ?auto_161775 ?auto_161777 ) ) ( not ( = ?auto_161775 ?auto_161778 ) ) ( not ( = ?auto_161775 ?auto_161779 ) ) ( not ( = ?auto_161775 ?auto_161780 ) ) ( not ( = ?auto_161775 ?auto_161781 ) ) ( not ( = ?auto_161775 ?auto_161782 ) ) ( not ( = ?auto_161776 ?auto_161777 ) ) ( not ( = ?auto_161776 ?auto_161778 ) ) ( not ( = ?auto_161776 ?auto_161779 ) ) ( not ( = ?auto_161776 ?auto_161780 ) ) ( not ( = ?auto_161776 ?auto_161781 ) ) ( not ( = ?auto_161776 ?auto_161782 ) ) ( not ( = ?auto_161777 ?auto_161778 ) ) ( not ( = ?auto_161777 ?auto_161779 ) ) ( not ( = ?auto_161777 ?auto_161780 ) ) ( not ( = ?auto_161777 ?auto_161781 ) ) ( not ( = ?auto_161777 ?auto_161782 ) ) ( not ( = ?auto_161778 ?auto_161779 ) ) ( not ( = ?auto_161778 ?auto_161780 ) ) ( not ( = ?auto_161778 ?auto_161781 ) ) ( not ( = ?auto_161778 ?auto_161782 ) ) ( not ( = ?auto_161779 ?auto_161780 ) ) ( not ( = ?auto_161779 ?auto_161781 ) ) ( not ( = ?auto_161779 ?auto_161782 ) ) ( not ( = ?auto_161780 ?auto_161781 ) ) ( not ( = ?auto_161780 ?auto_161782 ) ) ( not ( = ?auto_161781 ?auto_161782 ) ) ( ON-TABLE ?auto_161782 ) ( ON ?auto_161781 ?auto_161782 ) ( ON ?auto_161780 ?auto_161781 ) ( ON ?auto_161779 ?auto_161780 ) ( ON ?auto_161778 ?auto_161779 ) ( ON ?auto_161777 ?auto_161778 ) ( ON ?auto_161775 ?auto_161783 ) ( not ( = ?auto_161775 ?auto_161783 ) ) ( not ( = ?auto_161776 ?auto_161783 ) ) ( not ( = ?auto_161777 ?auto_161783 ) ) ( not ( = ?auto_161778 ?auto_161783 ) ) ( not ( = ?auto_161779 ?auto_161783 ) ) ( not ( = ?auto_161780 ?auto_161783 ) ) ( not ( = ?auto_161781 ?auto_161783 ) ) ( not ( = ?auto_161782 ?auto_161783 ) ) ( CLEAR ?auto_161777 ) ( ON ?auto_161776 ?auto_161775 ) ( CLEAR ?auto_161776 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161783 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161783 ?auto_161775 )
      ( MAKE-8PILE ?auto_161775 ?auto_161776 ?auto_161777 ?auto_161778 ?auto_161779 ?auto_161780 ?auto_161781 ?auto_161782 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161784 - BLOCK
      ?auto_161785 - BLOCK
      ?auto_161786 - BLOCK
      ?auto_161787 - BLOCK
      ?auto_161788 - BLOCK
      ?auto_161789 - BLOCK
      ?auto_161790 - BLOCK
      ?auto_161791 - BLOCK
    )
    :vars
    (
      ?auto_161792 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161784 ?auto_161785 ) ) ( not ( = ?auto_161784 ?auto_161786 ) ) ( not ( = ?auto_161784 ?auto_161787 ) ) ( not ( = ?auto_161784 ?auto_161788 ) ) ( not ( = ?auto_161784 ?auto_161789 ) ) ( not ( = ?auto_161784 ?auto_161790 ) ) ( not ( = ?auto_161784 ?auto_161791 ) ) ( not ( = ?auto_161785 ?auto_161786 ) ) ( not ( = ?auto_161785 ?auto_161787 ) ) ( not ( = ?auto_161785 ?auto_161788 ) ) ( not ( = ?auto_161785 ?auto_161789 ) ) ( not ( = ?auto_161785 ?auto_161790 ) ) ( not ( = ?auto_161785 ?auto_161791 ) ) ( not ( = ?auto_161786 ?auto_161787 ) ) ( not ( = ?auto_161786 ?auto_161788 ) ) ( not ( = ?auto_161786 ?auto_161789 ) ) ( not ( = ?auto_161786 ?auto_161790 ) ) ( not ( = ?auto_161786 ?auto_161791 ) ) ( not ( = ?auto_161787 ?auto_161788 ) ) ( not ( = ?auto_161787 ?auto_161789 ) ) ( not ( = ?auto_161787 ?auto_161790 ) ) ( not ( = ?auto_161787 ?auto_161791 ) ) ( not ( = ?auto_161788 ?auto_161789 ) ) ( not ( = ?auto_161788 ?auto_161790 ) ) ( not ( = ?auto_161788 ?auto_161791 ) ) ( not ( = ?auto_161789 ?auto_161790 ) ) ( not ( = ?auto_161789 ?auto_161791 ) ) ( not ( = ?auto_161790 ?auto_161791 ) ) ( ON-TABLE ?auto_161791 ) ( ON ?auto_161790 ?auto_161791 ) ( ON ?auto_161789 ?auto_161790 ) ( ON ?auto_161788 ?auto_161789 ) ( ON ?auto_161787 ?auto_161788 ) ( ON ?auto_161784 ?auto_161792 ) ( not ( = ?auto_161784 ?auto_161792 ) ) ( not ( = ?auto_161785 ?auto_161792 ) ) ( not ( = ?auto_161786 ?auto_161792 ) ) ( not ( = ?auto_161787 ?auto_161792 ) ) ( not ( = ?auto_161788 ?auto_161792 ) ) ( not ( = ?auto_161789 ?auto_161792 ) ) ( not ( = ?auto_161790 ?auto_161792 ) ) ( not ( = ?auto_161791 ?auto_161792 ) ) ( ON ?auto_161785 ?auto_161784 ) ( CLEAR ?auto_161785 ) ( ON-TABLE ?auto_161792 ) ( HOLDING ?auto_161786 ) ( CLEAR ?auto_161787 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161791 ?auto_161790 ?auto_161789 ?auto_161788 ?auto_161787 ?auto_161786 )
      ( MAKE-8PILE ?auto_161784 ?auto_161785 ?auto_161786 ?auto_161787 ?auto_161788 ?auto_161789 ?auto_161790 ?auto_161791 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161793 - BLOCK
      ?auto_161794 - BLOCK
      ?auto_161795 - BLOCK
      ?auto_161796 - BLOCK
      ?auto_161797 - BLOCK
      ?auto_161798 - BLOCK
      ?auto_161799 - BLOCK
      ?auto_161800 - BLOCK
    )
    :vars
    (
      ?auto_161801 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161793 ?auto_161794 ) ) ( not ( = ?auto_161793 ?auto_161795 ) ) ( not ( = ?auto_161793 ?auto_161796 ) ) ( not ( = ?auto_161793 ?auto_161797 ) ) ( not ( = ?auto_161793 ?auto_161798 ) ) ( not ( = ?auto_161793 ?auto_161799 ) ) ( not ( = ?auto_161793 ?auto_161800 ) ) ( not ( = ?auto_161794 ?auto_161795 ) ) ( not ( = ?auto_161794 ?auto_161796 ) ) ( not ( = ?auto_161794 ?auto_161797 ) ) ( not ( = ?auto_161794 ?auto_161798 ) ) ( not ( = ?auto_161794 ?auto_161799 ) ) ( not ( = ?auto_161794 ?auto_161800 ) ) ( not ( = ?auto_161795 ?auto_161796 ) ) ( not ( = ?auto_161795 ?auto_161797 ) ) ( not ( = ?auto_161795 ?auto_161798 ) ) ( not ( = ?auto_161795 ?auto_161799 ) ) ( not ( = ?auto_161795 ?auto_161800 ) ) ( not ( = ?auto_161796 ?auto_161797 ) ) ( not ( = ?auto_161796 ?auto_161798 ) ) ( not ( = ?auto_161796 ?auto_161799 ) ) ( not ( = ?auto_161796 ?auto_161800 ) ) ( not ( = ?auto_161797 ?auto_161798 ) ) ( not ( = ?auto_161797 ?auto_161799 ) ) ( not ( = ?auto_161797 ?auto_161800 ) ) ( not ( = ?auto_161798 ?auto_161799 ) ) ( not ( = ?auto_161798 ?auto_161800 ) ) ( not ( = ?auto_161799 ?auto_161800 ) ) ( ON-TABLE ?auto_161800 ) ( ON ?auto_161799 ?auto_161800 ) ( ON ?auto_161798 ?auto_161799 ) ( ON ?auto_161797 ?auto_161798 ) ( ON ?auto_161796 ?auto_161797 ) ( ON ?auto_161793 ?auto_161801 ) ( not ( = ?auto_161793 ?auto_161801 ) ) ( not ( = ?auto_161794 ?auto_161801 ) ) ( not ( = ?auto_161795 ?auto_161801 ) ) ( not ( = ?auto_161796 ?auto_161801 ) ) ( not ( = ?auto_161797 ?auto_161801 ) ) ( not ( = ?auto_161798 ?auto_161801 ) ) ( not ( = ?auto_161799 ?auto_161801 ) ) ( not ( = ?auto_161800 ?auto_161801 ) ) ( ON ?auto_161794 ?auto_161793 ) ( ON-TABLE ?auto_161801 ) ( CLEAR ?auto_161796 ) ( ON ?auto_161795 ?auto_161794 ) ( CLEAR ?auto_161795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161801 ?auto_161793 ?auto_161794 )
      ( MAKE-8PILE ?auto_161793 ?auto_161794 ?auto_161795 ?auto_161796 ?auto_161797 ?auto_161798 ?auto_161799 ?auto_161800 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161802 - BLOCK
      ?auto_161803 - BLOCK
      ?auto_161804 - BLOCK
      ?auto_161805 - BLOCK
      ?auto_161806 - BLOCK
      ?auto_161807 - BLOCK
      ?auto_161808 - BLOCK
      ?auto_161809 - BLOCK
    )
    :vars
    (
      ?auto_161810 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161802 ?auto_161803 ) ) ( not ( = ?auto_161802 ?auto_161804 ) ) ( not ( = ?auto_161802 ?auto_161805 ) ) ( not ( = ?auto_161802 ?auto_161806 ) ) ( not ( = ?auto_161802 ?auto_161807 ) ) ( not ( = ?auto_161802 ?auto_161808 ) ) ( not ( = ?auto_161802 ?auto_161809 ) ) ( not ( = ?auto_161803 ?auto_161804 ) ) ( not ( = ?auto_161803 ?auto_161805 ) ) ( not ( = ?auto_161803 ?auto_161806 ) ) ( not ( = ?auto_161803 ?auto_161807 ) ) ( not ( = ?auto_161803 ?auto_161808 ) ) ( not ( = ?auto_161803 ?auto_161809 ) ) ( not ( = ?auto_161804 ?auto_161805 ) ) ( not ( = ?auto_161804 ?auto_161806 ) ) ( not ( = ?auto_161804 ?auto_161807 ) ) ( not ( = ?auto_161804 ?auto_161808 ) ) ( not ( = ?auto_161804 ?auto_161809 ) ) ( not ( = ?auto_161805 ?auto_161806 ) ) ( not ( = ?auto_161805 ?auto_161807 ) ) ( not ( = ?auto_161805 ?auto_161808 ) ) ( not ( = ?auto_161805 ?auto_161809 ) ) ( not ( = ?auto_161806 ?auto_161807 ) ) ( not ( = ?auto_161806 ?auto_161808 ) ) ( not ( = ?auto_161806 ?auto_161809 ) ) ( not ( = ?auto_161807 ?auto_161808 ) ) ( not ( = ?auto_161807 ?auto_161809 ) ) ( not ( = ?auto_161808 ?auto_161809 ) ) ( ON-TABLE ?auto_161809 ) ( ON ?auto_161808 ?auto_161809 ) ( ON ?auto_161807 ?auto_161808 ) ( ON ?auto_161806 ?auto_161807 ) ( ON ?auto_161802 ?auto_161810 ) ( not ( = ?auto_161802 ?auto_161810 ) ) ( not ( = ?auto_161803 ?auto_161810 ) ) ( not ( = ?auto_161804 ?auto_161810 ) ) ( not ( = ?auto_161805 ?auto_161810 ) ) ( not ( = ?auto_161806 ?auto_161810 ) ) ( not ( = ?auto_161807 ?auto_161810 ) ) ( not ( = ?auto_161808 ?auto_161810 ) ) ( not ( = ?auto_161809 ?auto_161810 ) ) ( ON ?auto_161803 ?auto_161802 ) ( ON-TABLE ?auto_161810 ) ( ON ?auto_161804 ?auto_161803 ) ( CLEAR ?auto_161804 ) ( HOLDING ?auto_161805 ) ( CLEAR ?auto_161806 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161809 ?auto_161808 ?auto_161807 ?auto_161806 ?auto_161805 )
      ( MAKE-8PILE ?auto_161802 ?auto_161803 ?auto_161804 ?auto_161805 ?auto_161806 ?auto_161807 ?auto_161808 ?auto_161809 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161811 - BLOCK
      ?auto_161812 - BLOCK
      ?auto_161813 - BLOCK
      ?auto_161814 - BLOCK
      ?auto_161815 - BLOCK
      ?auto_161816 - BLOCK
      ?auto_161817 - BLOCK
      ?auto_161818 - BLOCK
    )
    :vars
    (
      ?auto_161819 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161811 ?auto_161812 ) ) ( not ( = ?auto_161811 ?auto_161813 ) ) ( not ( = ?auto_161811 ?auto_161814 ) ) ( not ( = ?auto_161811 ?auto_161815 ) ) ( not ( = ?auto_161811 ?auto_161816 ) ) ( not ( = ?auto_161811 ?auto_161817 ) ) ( not ( = ?auto_161811 ?auto_161818 ) ) ( not ( = ?auto_161812 ?auto_161813 ) ) ( not ( = ?auto_161812 ?auto_161814 ) ) ( not ( = ?auto_161812 ?auto_161815 ) ) ( not ( = ?auto_161812 ?auto_161816 ) ) ( not ( = ?auto_161812 ?auto_161817 ) ) ( not ( = ?auto_161812 ?auto_161818 ) ) ( not ( = ?auto_161813 ?auto_161814 ) ) ( not ( = ?auto_161813 ?auto_161815 ) ) ( not ( = ?auto_161813 ?auto_161816 ) ) ( not ( = ?auto_161813 ?auto_161817 ) ) ( not ( = ?auto_161813 ?auto_161818 ) ) ( not ( = ?auto_161814 ?auto_161815 ) ) ( not ( = ?auto_161814 ?auto_161816 ) ) ( not ( = ?auto_161814 ?auto_161817 ) ) ( not ( = ?auto_161814 ?auto_161818 ) ) ( not ( = ?auto_161815 ?auto_161816 ) ) ( not ( = ?auto_161815 ?auto_161817 ) ) ( not ( = ?auto_161815 ?auto_161818 ) ) ( not ( = ?auto_161816 ?auto_161817 ) ) ( not ( = ?auto_161816 ?auto_161818 ) ) ( not ( = ?auto_161817 ?auto_161818 ) ) ( ON-TABLE ?auto_161818 ) ( ON ?auto_161817 ?auto_161818 ) ( ON ?auto_161816 ?auto_161817 ) ( ON ?auto_161815 ?auto_161816 ) ( ON ?auto_161811 ?auto_161819 ) ( not ( = ?auto_161811 ?auto_161819 ) ) ( not ( = ?auto_161812 ?auto_161819 ) ) ( not ( = ?auto_161813 ?auto_161819 ) ) ( not ( = ?auto_161814 ?auto_161819 ) ) ( not ( = ?auto_161815 ?auto_161819 ) ) ( not ( = ?auto_161816 ?auto_161819 ) ) ( not ( = ?auto_161817 ?auto_161819 ) ) ( not ( = ?auto_161818 ?auto_161819 ) ) ( ON ?auto_161812 ?auto_161811 ) ( ON-TABLE ?auto_161819 ) ( ON ?auto_161813 ?auto_161812 ) ( CLEAR ?auto_161815 ) ( ON ?auto_161814 ?auto_161813 ) ( CLEAR ?auto_161814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161819 ?auto_161811 ?auto_161812 ?auto_161813 )
      ( MAKE-8PILE ?auto_161811 ?auto_161812 ?auto_161813 ?auto_161814 ?auto_161815 ?auto_161816 ?auto_161817 ?auto_161818 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161820 - BLOCK
      ?auto_161821 - BLOCK
      ?auto_161822 - BLOCK
      ?auto_161823 - BLOCK
      ?auto_161824 - BLOCK
      ?auto_161825 - BLOCK
      ?auto_161826 - BLOCK
      ?auto_161827 - BLOCK
    )
    :vars
    (
      ?auto_161828 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161820 ?auto_161821 ) ) ( not ( = ?auto_161820 ?auto_161822 ) ) ( not ( = ?auto_161820 ?auto_161823 ) ) ( not ( = ?auto_161820 ?auto_161824 ) ) ( not ( = ?auto_161820 ?auto_161825 ) ) ( not ( = ?auto_161820 ?auto_161826 ) ) ( not ( = ?auto_161820 ?auto_161827 ) ) ( not ( = ?auto_161821 ?auto_161822 ) ) ( not ( = ?auto_161821 ?auto_161823 ) ) ( not ( = ?auto_161821 ?auto_161824 ) ) ( not ( = ?auto_161821 ?auto_161825 ) ) ( not ( = ?auto_161821 ?auto_161826 ) ) ( not ( = ?auto_161821 ?auto_161827 ) ) ( not ( = ?auto_161822 ?auto_161823 ) ) ( not ( = ?auto_161822 ?auto_161824 ) ) ( not ( = ?auto_161822 ?auto_161825 ) ) ( not ( = ?auto_161822 ?auto_161826 ) ) ( not ( = ?auto_161822 ?auto_161827 ) ) ( not ( = ?auto_161823 ?auto_161824 ) ) ( not ( = ?auto_161823 ?auto_161825 ) ) ( not ( = ?auto_161823 ?auto_161826 ) ) ( not ( = ?auto_161823 ?auto_161827 ) ) ( not ( = ?auto_161824 ?auto_161825 ) ) ( not ( = ?auto_161824 ?auto_161826 ) ) ( not ( = ?auto_161824 ?auto_161827 ) ) ( not ( = ?auto_161825 ?auto_161826 ) ) ( not ( = ?auto_161825 ?auto_161827 ) ) ( not ( = ?auto_161826 ?auto_161827 ) ) ( ON-TABLE ?auto_161827 ) ( ON ?auto_161826 ?auto_161827 ) ( ON ?auto_161825 ?auto_161826 ) ( ON ?auto_161820 ?auto_161828 ) ( not ( = ?auto_161820 ?auto_161828 ) ) ( not ( = ?auto_161821 ?auto_161828 ) ) ( not ( = ?auto_161822 ?auto_161828 ) ) ( not ( = ?auto_161823 ?auto_161828 ) ) ( not ( = ?auto_161824 ?auto_161828 ) ) ( not ( = ?auto_161825 ?auto_161828 ) ) ( not ( = ?auto_161826 ?auto_161828 ) ) ( not ( = ?auto_161827 ?auto_161828 ) ) ( ON ?auto_161821 ?auto_161820 ) ( ON-TABLE ?auto_161828 ) ( ON ?auto_161822 ?auto_161821 ) ( ON ?auto_161823 ?auto_161822 ) ( CLEAR ?auto_161823 ) ( HOLDING ?auto_161824 ) ( CLEAR ?auto_161825 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161827 ?auto_161826 ?auto_161825 ?auto_161824 )
      ( MAKE-8PILE ?auto_161820 ?auto_161821 ?auto_161822 ?auto_161823 ?auto_161824 ?auto_161825 ?auto_161826 ?auto_161827 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161829 - BLOCK
      ?auto_161830 - BLOCK
      ?auto_161831 - BLOCK
      ?auto_161832 - BLOCK
      ?auto_161833 - BLOCK
      ?auto_161834 - BLOCK
      ?auto_161835 - BLOCK
      ?auto_161836 - BLOCK
    )
    :vars
    (
      ?auto_161837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161829 ?auto_161830 ) ) ( not ( = ?auto_161829 ?auto_161831 ) ) ( not ( = ?auto_161829 ?auto_161832 ) ) ( not ( = ?auto_161829 ?auto_161833 ) ) ( not ( = ?auto_161829 ?auto_161834 ) ) ( not ( = ?auto_161829 ?auto_161835 ) ) ( not ( = ?auto_161829 ?auto_161836 ) ) ( not ( = ?auto_161830 ?auto_161831 ) ) ( not ( = ?auto_161830 ?auto_161832 ) ) ( not ( = ?auto_161830 ?auto_161833 ) ) ( not ( = ?auto_161830 ?auto_161834 ) ) ( not ( = ?auto_161830 ?auto_161835 ) ) ( not ( = ?auto_161830 ?auto_161836 ) ) ( not ( = ?auto_161831 ?auto_161832 ) ) ( not ( = ?auto_161831 ?auto_161833 ) ) ( not ( = ?auto_161831 ?auto_161834 ) ) ( not ( = ?auto_161831 ?auto_161835 ) ) ( not ( = ?auto_161831 ?auto_161836 ) ) ( not ( = ?auto_161832 ?auto_161833 ) ) ( not ( = ?auto_161832 ?auto_161834 ) ) ( not ( = ?auto_161832 ?auto_161835 ) ) ( not ( = ?auto_161832 ?auto_161836 ) ) ( not ( = ?auto_161833 ?auto_161834 ) ) ( not ( = ?auto_161833 ?auto_161835 ) ) ( not ( = ?auto_161833 ?auto_161836 ) ) ( not ( = ?auto_161834 ?auto_161835 ) ) ( not ( = ?auto_161834 ?auto_161836 ) ) ( not ( = ?auto_161835 ?auto_161836 ) ) ( ON-TABLE ?auto_161836 ) ( ON ?auto_161835 ?auto_161836 ) ( ON ?auto_161834 ?auto_161835 ) ( ON ?auto_161829 ?auto_161837 ) ( not ( = ?auto_161829 ?auto_161837 ) ) ( not ( = ?auto_161830 ?auto_161837 ) ) ( not ( = ?auto_161831 ?auto_161837 ) ) ( not ( = ?auto_161832 ?auto_161837 ) ) ( not ( = ?auto_161833 ?auto_161837 ) ) ( not ( = ?auto_161834 ?auto_161837 ) ) ( not ( = ?auto_161835 ?auto_161837 ) ) ( not ( = ?auto_161836 ?auto_161837 ) ) ( ON ?auto_161830 ?auto_161829 ) ( ON-TABLE ?auto_161837 ) ( ON ?auto_161831 ?auto_161830 ) ( ON ?auto_161832 ?auto_161831 ) ( CLEAR ?auto_161834 ) ( ON ?auto_161833 ?auto_161832 ) ( CLEAR ?auto_161833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161837 ?auto_161829 ?auto_161830 ?auto_161831 ?auto_161832 )
      ( MAKE-8PILE ?auto_161829 ?auto_161830 ?auto_161831 ?auto_161832 ?auto_161833 ?auto_161834 ?auto_161835 ?auto_161836 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161838 - BLOCK
      ?auto_161839 - BLOCK
      ?auto_161840 - BLOCK
      ?auto_161841 - BLOCK
      ?auto_161842 - BLOCK
      ?auto_161843 - BLOCK
      ?auto_161844 - BLOCK
      ?auto_161845 - BLOCK
    )
    :vars
    (
      ?auto_161846 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161838 ?auto_161839 ) ) ( not ( = ?auto_161838 ?auto_161840 ) ) ( not ( = ?auto_161838 ?auto_161841 ) ) ( not ( = ?auto_161838 ?auto_161842 ) ) ( not ( = ?auto_161838 ?auto_161843 ) ) ( not ( = ?auto_161838 ?auto_161844 ) ) ( not ( = ?auto_161838 ?auto_161845 ) ) ( not ( = ?auto_161839 ?auto_161840 ) ) ( not ( = ?auto_161839 ?auto_161841 ) ) ( not ( = ?auto_161839 ?auto_161842 ) ) ( not ( = ?auto_161839 ?auto_161843 ) ) ( not ( = ?auto_161839 ?auto_161844 ) ) ( not ( = ?auto_161839 ?auto_161845 ) ) ( not ( = ?auto_161840 ?auto_161841 ) ) ( not ( = ?auto_161840 ?auto_161842 ) ) ( not ( = ?auto_161840 ?auto_161843 ) ) ( not ( = ?auto_161840 ?auto_161844 ) ) ( not ( = ?auto_161840 ?auto_161845 ) ) ( not ( = ?auto_161841 ?auto_161842 ) ) ( not ( = ?auto_161841 ?auto_161843 ) ) ( not ( = ?auto_161841 ?auto_161844 ) ) ( not ( = ?auto_161841 ?auto_161845 ) ) ( not ( = ?auto_161842 ?auto_161843 ) ) ( not ( = ?auto_161842 ?auto_161844 ) ) ( not ( = ?auto_161842 ?auto_161845 ) ) ( not ( = ?auto_161843 ?auto_161844 ) ) ( not ( = ?auto_161843 ?auto_161845 ) ) ( not ( = ?auto_161844 ?auto_161845 ) ) ( ON-TABLE ?auto_161845 ) ( ON ?auto_161844 ?auto_161845 ) ( ON ?auto_161838 ?auto_161846 ) ( not ( = ?auto_161838 ?auto_161846 ) ) ( not ( = ?auto_161839 ?auto_161846 ) ) ( not ( = ?auto_161840 ?auto_161846 ) ) ( not ( = ?auto_161841 ?auto_161846 ) ) ( not ( = ?auto_161842 ?auto_161846 ) ) ( not ( = ?auto_161843 ?auto_161846 ) ) ( not ( = ?auto_161844 ?auto_161846 ) ) ( not ( = ?auto_161845 ?auto_161846 ) ) ( ON ?auto_161839 ?auto_161838 ) ( ON-TABLE ?auto_161846 ) ( ON ?auto_161840 ?auto_161839 ) ( ON ?auto_161841 ?auto_161840 ) ( ON ?auto_161842 ?auto_161841 ) ( CLEAR ?auto_161842 ) ( HOLDING ?auto_161843 ) ( CLEAR ?auto_161844 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161845 ?auto_161844 ?auto_161843 )
      ( MAKE-8PILE ?auto_161838 ?auto_161839 ?auto_161840 ?auto_161841 ?auto_161842 ?auto_161843 ?auto_161844 ?auto_161845 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161847 - BLOCK
      ?auto_161848 - BLOCK
      ?auto_161849 - BLOCK
      ?auto_161850 - BLOCK
      ?auto_161851 - BLOCK
      ?auto_161852 - BLOCK
      ?auto_161853 - BLOCK
      ?auto_161854 - BLOCK
    )
    :vars
    (
      ?auto_161855 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161847 ?auto_161848 ) ) ( not ( = ?auto_161847 ?auto_161849 ) ) ( not ( = ?auto_161847 ?auto_161850 ) ) ( not ( = ?auto_161847 ?auto_161851 ) ) ( not ( = ?auto_161847 ?auto_161852 ) ) ( not ( = ?auto_161847 ?auto_161853 ) ) ( not ( = ?auto_161847 ?auto_161854 ) ) ( not ( = ?auto_161848 ?auto_161849 ) ) ( not ( = ?auto_161848 ?auto_161850 ) ) ( not ( = ?auto_161848 ?auto_161851 ) ) ( not ( = ?auto_161848 ?auto_161852 ) ) ( not ( = ?auto_161848 ?auto_161853 ) ) ( not ( = ?auto_161848 ?auto_161854 ) ) ( not ( = ?auto_161849 ?auto_161850 ) ) ( not ( = ?auto_161849 ?auto_161851 ) ) ( not ( = ?auto_161849 ?auto_161852 ) ) ( not ( = ?auto_161849 ?auto_161853 ) ) ( not ( = ?auto_161849 ?auto_161854 ) ) ( not ( = ?auto_161850 ?auto_161851 ) ) ( not ( = ?auto_161850 ?auto_161852 ) ) ( not ( = ?auto_161850 ?auto_161853 ) ) ( not ( = ?auto_161850 ?auto_161854 ) ) ( not ( = ?auto_161851 ?auto_161852 ) ) ( not ( = ?auto_161851 ?auto_161853 ) ) ( not ( = ?auto_161851 ?auto_161854 ) ) ( not ( = ?auto_161852 ?auto_161853 ) ) ( not ( = ?auto_161852 ?auto_161854 ) ) ( not ( = ?auto_161853 ?auto_161854 ) ) ( ON-TABLE ?auto_161854 ) ( ON ?auto_161853 ?auto_161854 ) ( ON ?auto_161847 ?auto_161855 ) ( not ( = ?auto_161847 ?auto_161855 ) ) ( not ( = ?auto_161848 ?auto_161855 ) ) ( not ( = ?auto_161849 ?auto_161855 ) ) ( not ( = ?auto_161850 ?auto_161855 ) ) ( not ( = ?auto_161851 ?auto_161855 ) ) ( not ( = ?auto_161852 ?auto_161855 ) ) ( not ( = ?auto_161853 ?auto_161855 ) ) ( not ( = ?auto_161854 ?auto_161855 ) ) ( ON ?auto_161848 ?auto_161847 ) ( ON-TABLE ?auto_161855 ) ( ON ?auto_161849 ?auto_161848 ) ( ON ?auto_161850 ?auto_161849 ) ( ON ?auto_161851 ?auto_161850 ) ( CLEAR ?auto_161853 ) ( ON ?auto_161852 ?auto_161851 ) ( CLEAR ?auto_161852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161855 ?auto_161847 ?auto_161848 ?auto_161849 ?auto_161850 ?auto_161851 )
      ( MAKE-8PILE ?auto_161847 ?auto_161848 ?auto_161849 ?auto_161850 ?auto_161851 ?auto_161852 ?auto_161853 ?auto_161854 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161856 - BLOCK
      ?auto_161857 - BLOCK
      ?auto_161858 - BLOCK
      ?auto_161859 - BLOCK
      ?auto_161860 - BLOCK
      ?auto_161861 - BLOCK
      ?auto_161862 - BLOCK
      ?auto_161863 - BLOCK
    )
    :vars
    (
      ?auto_161864 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161856 ?auto_161857 ) ) ( not ( = ?auto_161856 ?auto_161858 ) ) ( not ( = ?auto_161856 ?auto_161859 ) ) ( not ( = ?auto_161856 ?auto_161860 ) ) ( not ( = ?auto_161856 ?auto_161861 ) ) ( not ( = ?auto_161856 ?auto_161862 ) ) ( not ( = ?auto_161856 ?auto_161863 ) ) ( not ( = ?auto_161857 ?auto_161858 ) ) ( not ( = ?auto_161857 ?auto_161859 ) ) ( not ( = ?auto_161857 ?auto_161860 ) ) ( not ( = ?auto_161857 ?auto_161861 ) ) ( not ( = ?auto_161857 ?auto_161862 ) ) ( not ( = ?auto_161857 ?auto_161863 ) ) ( not ( = ?auto_161858 ?auto_161859 ) ) ( not ( = ?auto_161858 ?auto_161860 ) ) ( not ( = ?auto_161858 ?auto_161861 ) ) ( not ( = ?auto_161858 ?auto_161862 ) ) ( not ( = ?auto_161858 ?auto_161863 ) ) ( not ( = ?auto_161859 ?auto_161860 ) ) ( not ( = ?auto_161859 ?auto_161861 ) ) ( not ( = ?auto_161859 ?auto_161862 ) ) ( not ( = ?auto_161859 ?auto_161863 ) ) ( not ( = ?auto_161860 ?auto_161861 ) ) ( not ( = ?auto_161860 ?auto_161862 ) ) ( not ( = ?auto_161860 ?auto_161863 ) ) ( not ( = ?auto_161861 ?auto_161862 ) ) ( not ( = ?auto_161861 ?auto_161863 ) ) ( not ( = ?auto_161862 ?auto_161863 ) ) ( ON-TABLE ?auto_161863 ) ( ON ?auto_161856 ?auto_161864 ) ( not ( = ?auto_161856 ?auto_161864 ) ) ( not ( = ?auto_161857 ?auto_161864 ) ) ( not ( = ?auto_161858 ?auto_161864 ) ) ( not ( = ?auto_161859 ?auto_161864 ) ) ( not ( = ?auto_161860 ?auto_161864 ) ) ( not ( = ?auto_161861 ?auto_161864 ) ) ( not ( = ?auto_161862 ?auto_161864 ) ) ( not ( = ?auto_161863 ?auto_161864 ) ) ( ON ?auto_161857 ?auto_161856 ) ( ON-TABLE ?auto_161864 ) ( ON ?auto_161858 ?auto_161857 ) ( ON ?auto_161859 ?auto_161858 ) ( ON ?auto_161860 ?auto_161859 ) ( ON ?auto_161861 ?auto_161860 ) ( CLEAR ?auto_161861 ) ( HOLDING ?auto_161862 ) ( CLEAR ?auto_161863 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161863 ?auto_161862 )
      ( MAKE-8PILE ?auto_161856 ?auto_161857 ?auto_161858 ?auto_161859 ?auto_161860 ?auto_161861 ?auto_161862 ?auto_161863 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161865 - BLOCK
      ?auto_161866 - BLOCK
      ?auto_161867 - BLOCK
      ?auto_161868 - BLOCK
      ?auto_161869 - BLOCK
      ?auto_161870 - BLOCK
      ?auto_161871 - BLOCK
      ?auto_161872 - BLOCK
    )
    :vars
    (
      ?auto_161873 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161865 ?auto_161866 ) ) ( not ( = ?auto_161865 ?auto_161867 ) ) ( not ( = ?auto_161865 ?auto_161868 ) ) ( not ( = ?auto_161865 ?auto_161869 ) ) ( not ( = ?auto_161865 ?auto_161870 ) ) ( not ( = ?auto_161865 ?auto_161871 ) ) ( not ( = ?auto_161865 ?auto_161872 ) ) ( not ( = ?auto_161866 ?auto_161867 ) ) ( not ( = ?auto_161866 ?auto_161868 ) ) ( not ( = ?auto_161866 ?auto_161869 ) ) ( not ( = ?auto_161866 ?auto_161870 ) ) ( not ( = ?auto_161866 ?auto_161871 ) ) ( not ( = ?auto_161866 ?auto_161872 ) ) ( not ( = ?auto_161867 ?auto_161868 ) ) ( not ( = ?auto_161867 ?auto_161869 ) ) ( not ( = ?auto_161867 ?auto_161870 ) ) ( not ( = ?auto_161867 ?auto_161871 ) ) ( not ( = ?auto_161867 ?auto_161872 ) ) ( not ( = ?auto_161868 ?auto_161869 ) ) ( not ( = ?auto_161868 ?auto_161870 ) ) ( not ( = ?auto_161868 ?auto_161871 ) ) ( not ( = ?auto_161868 ?auto_161872 ) ) ( not ( = ?auto_161869 ?auto_161870 ) ) ( not ( = ?auto_161869 ?auto_161871 ) ) ( not ( = ?auto_161869 ?auto_161872 ) ) ( not ( = ?auto_161870 ?auto_161871 ) ) ( not ( = ?auto_161870 ?auto_161872 ) ) ( not ( = ?auto_161871 ?auto_161872 ) ) ( ON-TABLE ?auto_161872 ) ( ON ?auto_161865 ?auto_161873 ) ( not ( = ?auto_161865 ?auto_161873 ) ) ( not ( = ?auto_161866 ?auto_161873 ) ) ( not ( = ?auto_161867 ?auto_161873 ) ) ( not ( = ?auto_161868 ?auto_161873 ) ) ( not ( = ?auto_161869 ?auto_161873 ) ) ( not ( = ?auto_161870 ?auto_161873 ) ) ( not ( = ?auto_161871 ?auto_161873 ) ) ( not ( = ?auto_161872 ?auto_161873 ) ) ( ON ?auto_161866 ?auto_161865 ) ( ON-TABLE ?auto_161873 ) ( ON ?auto_161867 ?auto_161866 ) ( ON ?auto_161868 ?auto_161867 ) ( ON ?auto_161869 ?auto_161868 ) ( ON ?auto_161870 ?auto_161869 ) ( CLEAR ?auto_161872 ) ( ON ?auto_161871 ?auto_161870 ) ( CLEAR ?auto_161871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_161873 ?auto_161865 ?auto_161866 ?auto_161867 ?auto_161868 ?auto_161869 ?auto_161870 )
      ( MAKE-8PILE ?auto_161865 ?auto_161866 ?auto_161867 ?auto_161868 ?auto_161869 ?auto_161870 ?auto_161871 ?auto_161872 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161874 - BLOCK
      ?auto_161875 - BLOCK
      ?auto_161876 - BLOCK
      ?auto_161877 - BLOCK
      ?auto_161878 - BLOCK
      ?auto_161879 - BLOCK
      ?auto_161880 - BLOCK
      ?auto_161881 - BLOCK
    )
    :vars
    (
      ?auto_161882 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161874 ?auto_161875 ) ) ( not ( = ?auto_161874 ?auto_161876 ) ) ( not ( = ?auto_161874 ?auto_161877 ) ) ( not ( = ?auto_161874 ?auto_161878 ) ) ( not ( = ?auto_161874 ?auto_161879 ) ) ( not ( = ?auto_161874 ?auto_161880 ) ) ( not ( = ?auto_161874 ?auto_161881 ) ) ( not ( = ?auto_161875 ?auto_161876 ) ) ( not ( = ?auto_161875 ?auto_161877 ) ) ( not ( = ?auto_161875 ?auto_161878 ) ) ( not ( = ?auto_161875 ?auto_161879 ) ) ( not ( = ?auto_161875 ?auto_161880 ) ) ( not ( = ?auto_161875 ?auto_161881 ) ) ( not ( = ?auto_161876 ?auto_161877 ) ) ( not ( = ?auto_161876 ?auto_161878 ) ) ( not ( = ?auto_161876 ?auto_161879 ) ) ( not ( = ?auto_161876 ?auto_161880 ) ) ( not ( = ?auto_161876 ?auto_161881 ) ) ( not ( = ?auto_161877 ?auto_161878 ) ) ( not ( = ?auto_161877 ?auto_161879 ) ) ( not ( = ?auto_161877 ?auto_161880 ) ) ( not ( = ?auto_161877 ?auto_161881 ) ) ( not ( = ?auto_161878 ?auto_161879 ) ) ( not ( = ?auto_161878 ?auto_161880 ) ) ( not ( = ?auto_161878 ?auto_161881 ) ) ( not ( = ?auto_161879 ?auto_161880 ) ) ( not ( = ?auto_161879 ?auto_161881 ) ) ( not ( = ?auto_161880 ?auto_161881 ) ) ( ON ?auto_161874 ?auto_161882 ) ( not ( = ?auto_161874 ?auto_161882 ) ) ( not ( = ?auto_161875 ?auto_161882 ) ) ( not ( = ?auto_161876 ?auto_161882 ) ) ( not ( = ?auto_161877 ?auto_161882 ) ) ( not ( = ?auto_161878 ?auto_161882 ) ) ( not ( = ?auto_161879 ?auto_161882 ) ) ( not ( = ?auto_161880 ?auto_161882 ) ) ( not ( = ?auto_161881 ?auto_161882 ) ) ( ON ?auto_161875 ?auto_161874 ) ( ON-TABLE ?auto_161882 ) ( ON ?auto_161876 ?auto_161875 ) ( ON ?auto_161877 ?auto_161876 ) ( ON ?auto_161878 ?auto_161877 ) ( ON ?auto_161879 ?auto_161878 ) ( ON ?auto_161880 ?auto_161879 ) ( CLEAR ?auto_161880 ) ( HOLDING ?auto_161881 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161881 )
      ( MAKE-8PILE ?auto_161874 ?auto_161875 ?auto_161876 ?auto_161877 ?auto_161878 ?auto_161879 ?auto_161880 ?auto_161881 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161883 - BLOCK
      ?auto_161884 - BLOCK
      ?auto_161885 - BLOCK
      ?auto_161886 - BLOCK
      ?auto_161887 - BLOCK
      ?auto_161888 - BLOCK
      ?auto_161889 - BLOCK
      ?auto_161890 - BLOCK
    )
    :vars
    (
      ?auto_161891 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161883 ?auto_161884 ) ) ( not ( = ?auto_161883 ?auto_161885 ) ) ( not ( = ?auto_161883 ?auto_161886 ) ) ( not ( = ?auto_161883 ?auto_161887 ) ) ( not ( = ?auto_161883 ?auto_161888 ) ) ( not ( = ?auto_161883 ?auto_161889 ) ) ( not ( = ?auto_161883 ?auto_161890 ) ) ( not ( = ?auto_161884 ?auto_161885 ) ) ( not ( = ?auto_161884 ?auto_161886 ) ) ( not ( = ?auto_161884 ?auto_161887 ) ) ( not ( = ?auto_161884 ?auto_161888 ) ) ( not ( = ?auto_161884 ?auto_161889 ) ) ( not ( = ?auto_161884 ?auto_161890 ) ) ( not ( = ?auto_161885 ?auto_161886 ) ) ( not ( = ?auto_161885 ?auto_161887 ) ) ( not ( = ?auto_161885 ?auto_161888 ) ) ( not ( = ?auto_161885 ?auto_161889 ) ) ( not ( = ?auto_161885 ?auto_161890 ) ) ( not ( = ?auto_161886 ?auto_161887 ) ) ( not ( = ?auto_161886 ?auto_161888 ) ) ( not ( = ?auto_161886 ?auto_161889 ) ) ( not ( = ?auto_161886 ?auto_161890 ) ) ( not ( = ?auto_161887 ?auto_161888 ) ) ( not ( = ?auto_161887 ?auto_161889 ) ) ( not ( = ?auto_161887 ?auto_161890 ) ) ( not ( = ?auto_161888 ?auto_161889 ) ) ( not ( = ?auto_161888 ?auto_161890 ) ) ( not ( = ?auto_161889 ?auto_161890 ) ) ( ON ?auto_161883 ?auto_161891 ) ( not ( = ?auto_161883 ?auto_161891 ) ) ( not ( = ?auto_161884 ?auto_161891 ) ) ( not ( = ?auto_161885 ?auto_161891 ) ) ( not ( = ?auto_161886 ?auto_161891 ) ) ( not ( = ?auto_161887 ?auto_161891 ) ) ( not ( = ?auto_161888 ?auto_161891 ) ) ( not ( = ?auto_161889 ?auto_161891 ) ) ( not ( = ?auto_161890 ?auto_161891 ) ) ( ON ?auto_161884 ?auto_161883 ) ( ON-TABLE ?auto_161891 ) ( ON ?auto_161885 ?auto_161884 ) ( ON ?auto_161886 ?auto_161885 ) ( ON ?auto_161887 ?auto_161886 ) ( ON ?auto_161888 ?auto_161887 ) ( ON ?auto_161889 ?auto_161888 ) ( ON ?auto_161890 ?auto_161889 ) ( CLEAR ?auto_161890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_161891 ?auto_161883 ?auto_161884 ?auto_161885 ?auto_161886 ?auto_161887 ?auto_161888 ?auto_161889 )
      ( MAKE-8PILE ?auto_161883 ?auto_161884 ?auto_161885 ?auto_161886 ?auto_161887 ?auto_161888 ?auto_161889 ?auto_161890 ) )
  )

)

