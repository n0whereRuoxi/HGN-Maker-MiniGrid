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
      ?auto_10041 - BLOCK
    )
    :vars
    (
      ?auto_10042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10041 ?auto_10042 ) ( CLEAR ?auto_10041 ) ( HAND-EMPTY ) ( not ( = ?auto_10041 ?auto_10042 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10041 ?auto_10042 )
      ( !PUTDOWN ?auto_10041 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10048 - BLOCK
      ?auto_10049 - BLOCK
    )
    :vars
    (
      ?auto_10050 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10048 ) ( ON ?auto_10049 ?auto_10050 ) ( CLEAR ?auto_10049 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10048 ) ( not ( = ?auto_10048 ?auto_10049 ) ) ( not ( = ?auto_10048 ?auto_10050 ) ) ( not ( = ?auto_10049 ?auto_10050 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10049 ?auto_10050 )
      ( !STACK ?auto_10049 ?auto_10048 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10058 - BLOCK
      ?auto_10059 - BLOCK
    )
    :vars
    (
      ?auto_10060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10059 ?auto_10060 ) ( not ( = ?auto_10058 ?auto_10059 ) ) ( not ( = ?auto_10058 ?auto_10060 ) ) ( not ( = ?auto_10059 ?auto_10060 ) ) ( ON ?auto_10058 ?auto_10059 ) ( CLEAR ?auto_10058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10058 )
      ( MAKE-2PILE ?auto_10058 ?auto_10059 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10069 - BLOCK
      ?auto_10070 - BLOCK
      ?auto_10071 - BLOCK
    )
    :vars
    (
      ?auto_10072 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10070 ) ( ON ?auto_10071 ?auto_10072 ) ( CLEAR ?auto_10071 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10069 ) ( ON ?auto_10070 ?auto_10069 ) ( not ( = ?auto_10069 ?auto_10070 ) ) ( not ( = ?auto_10069 ?auto_10071 ) ) ( not ( = ?auto_10069 ?auto_10072 ) ) ( not ( = ?auto_10070 ?auto_10071 ) ) ( not ( = ?auto_10070 ?auto_10072 ) ) ( not ( = ?auto_10071 ?auto_10072 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10071 ?auto_10072 )
      ( !STACK ?auto_10071 ?auto_10070 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10083 - BLOCK
      ?auto_10084 - BLOCK
      ?auto_10085 - BLOCK
    )
    :vars
    (
      ?auto_10086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10085 ?auto_10086 ) ( ON-TABLE ?auto_10083 ) ( not ( = ?auto_10083 ?auto_10084 ) ) ( not ( = ?auto_10083 ?auto_10085 ) ) ( not ( = ?auto_10083 ?auto_10086 ) ) ( not ( = ?auto_10084 ?auto_10085 ) ) ( not ( = ?auto_10084 ?auto_10086 ) ) ( not ( = ?auto_10085 ?auto_10086 ) ) ( CLEAR ?auto_10083 ) ( ON ?auto_10084 ?auto_10085 ) ( CLEAR ?auto_10084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10083 ?auto_10084 )
      ( MAKE-3PILE ?auto_10083 ?auto_10084 ?auto_10085 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10097 - BLOCK
      ?auto_10098 - BLOCK
      ?auto_10099 - BLOCK
    )
    :vars
    (
      ?auto_10100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10099 ?auto_10100 ) ( not ( = ?auto_10097 ?auto_10098 ) ) ( not ( = ?auto_10097 ?auto_10099 ) ) ( not ( = ?auto_10097 ?auto_10100 ) ) ( not ( = ?auto_10098 ?auto_10099 ) ) ( not ( = ?auto_10098 ?auto_10100 ) ) ( not ( = ?auto_10099 ?auto_10100 ) ) ( ON ?auto_10098 ?auto_10099 ) ( ON ?auto_10097 ?auto_10098 ) ( CLEAR ?auto_10097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10097 )
      ( MAKE-3PILE ?auto_10097 ?auto_10098 ?auto_10099 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10112 - BLOCK
      ?auto_10113 - BLOCK
      ?auto_10114 - BLOCK
      ?auto_10115 - BLOCK
    )
    :vars
    (
      ?auto_10116 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10114 ) ( ON ?auto_10115 ?auto_10116 ) ( CLEAR ?auto_10115 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10112 ) ( ON ?auto_10113 ?auto_10112 ) ( ON ?auto_10114 ?auto_10113 ) ( not ( = ?auto_10112 ?auto_10113 ) ) ( not ( = ?auto_10112 ?auto_10114 ) ) ( not ( = ?auto_10112 ?auto_10115 ) ) ( not ( = ?auto_10112 ?auto_10116 ) ) ( not ( = ?auto_10113 ?auto_10114 ) ) ( not ( = ?auto_10113 ?auto_10115 ) ) ( not ( = ?auto_10113 ?auto_10116 ) ) ( not ( = ?auto_10114 ?auto_10115 ) ) ( not ( = ?auto_10114 ?auto_10116 ) ) ( not ( = ?auto_10115 ?auto_10116 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10115 ?auto_10116 )
      ( !STACK ?auto_10115 ?auto_10114 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10130 - BLOCK
      ?auto_10131 - BLOCK
      ?auto_10132 - BLOCK
      ?auto_10133 - BLOCK
    )
    :vars
    (
      ?auto_10134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10133 ?auto_10134 ) ( ON-TABLE ?auto_10130 ) ( ON ?auto_10131 ?auto_10130 ) ( not ( = ?auto_10130 ?auto_10131 ) ) ( not ( = ?auto_10130 ?auto_10132 ) ) ( not ( = ?auto_10130 ?auto_10133 ) ) ( not ( = ?auto_10130 ?auto_10134 ) ) ( not ( = ?auto_10131 ?auto_10132 ) ) ( not ( = ?auto_10131 ?auto_10133 ) ) ( not ( = ?auto_10131 ?auto_10134 ) ) ( not ( = ?auto_10132 ?auto_10133 ) ) ( not ( = ?auto_10132 ?auto_10134 ) ) ( not ( = ?auto_10133 ?auto_10134 ) ) ( CLEAR ?auto_10131 ) ( ON ?auto_10132 ?auto_10133 ) ( CLEAR ?auto_10132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10130 ?auto_10131 ?auto_10132 )
      ( MAKE-4PILE ?auto_10130 ?auto_10131 ?auto_10132 ?auto_10133 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10148 - BLOCK
      ?auto_10149 - BLOCK
      ?auto_10150 - BLOCK
      ?auto_10151 - BLOCK
    )
    :vars
    (
      ?auto_10152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10151 ?auto_10152 ) ( ON-TABLE ?auto_10148 ) ( not ( = ?auto_10148 ?auto_10149 ) ) ( not ( = ?auto_10148 ?auto_10150 ) ) ( not ( = ?auto_10148 ?auto_10151 ) ) ( not ( = ?auto_10148 ?auto_10152 ) ) ( not ( = ?auto_10149 ?auto_10150 ) ) ( not ( = ?auto_10149 ?auto_10151 ) ) ( not ( = ?auto_10149 ?auto_10152 ) ) ( not ( = ?auto_10150 ?auto_10151 ) ) ( not ( = ?auto_10150 ?auto_10152 ) ) ( not ( = ?auto_10151 ?auto_10152 ) ) ( ON ?auto_10150 ?auto_10151 ) ( CLEAR ?auto_10148 ) ( ON ?auto_10149 ?auto_10150 ) ( CLEAR ?auto_10149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10148 ?auto_10149 )
      ( MAKE-4PILE ?auto_10148 ?auto_10149 ?auto_10150 ?auto_10151 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10166 - BLOCK
      ?auto_10167 - BLOCK
      ?auto_10168 - BLOCK
      ?auto_10169 - BLOCK
    )
    :vars
    (
      ?auto_10170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10169 ?auto_10170 ) ( not ( = ?auto_10166 ?auto_10167 ) ) ( not ( = ?auto_10166 ?auto_10168 ) ) ( not ( = ?auto_10166 ?auto_10169 ) ) ( not ( = ?auto_10166 ?auto_10170 ) ) ( not ( = ?auto_10167 ?auto_10168 ) ) ( not ( = ?auto_10167 ?auto_10169 ) ) ( not ( = ?auto_10167 ?auto_10170 ) ) ( not ( = ?auto_10168 ?auto_10169 ) ) ( not ( = ?auto_10168 ?auto_10170 ) ) ( not ( = ?auto_10169 ?auto_10170 ) ) ( ON ?auto_10168 ?auto_10169 ) ( ON ?auto_10167 ?auto_10168 ) ( ON ?auto_10166 ?auto_10167 ) ( CLEAR ?auto_10166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10166 )
      ( MAKE-4PILE ?auto_10166 ?auto_10167 ?auto_10168 ?auto_10169 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_10185 - BLOCK
      ?auto_10186 - BLOCK
      ?auto_10187 - BLOCK
      ?auto_10188 - BLOCK
      ?auto_10189 - BLOCK
    )
    :vars
    (
      ?auto_10190 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10188 ) ( ON ?auto_10189 ?auto_10190 ) ( CLEAR ?auto_10189 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10185 ) ( ON ?auto_10186 ?auto_10185 ) ( ON ?auto_10187 ?auto_10186 ) ( ON ?auto_10188 ?auto_10187 ) ( not ( = ?auto_10185 ?auto_10186 ) ) ( not ( = ?auto_10185 ?auto_10187 ) ) ( not ( = ?auto_10185 ?auto_10188 ) ) ( not ( = ?auto_10185 ?auto_10189 ) ) ( not ( = ?auto_10185 ?auto_10190 ) ) ( not ( = ?auto_10186 ?auto_10187 ) ) ( not ( = ?auto_10186 ?auto_10188 ) ) ( not ( = ?auto_10186 ?auto_10189 ) ) ( not ( = ?auto_10186 ?auto_10190 ) ) ( not ( = ?auto_10187 ?auto_10188 ) ) ( not ( = ?auto_10187 ?auto_10189 ) ) ( not ( = ?auto_10187 ?auto_10190 ) ) ( not ( = ?auto_10188 ?auto_10189 ) ) ( not ( = ?auto_10188 ?auto_10190 ) ) ( not ( = ?auto_10189 ?auto_10190 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10189 ?auto_10190 )
      ( !STACK ?auto_10189 ?auto_10188 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_10207 - BLOCK
      ?auto_10208 - BLOCK
      ?auto_10209 - BLOCK
      ?auto_10210 - BLOCK
      ?auto_10211 - BLOCK
    )
    :vars
    (
      ?auto_10212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10211 ?auto_10212 ) ( ON-TABLE ?auto_10207 ) ( ON ?auto_10208 ?auto_10207 ) ( ON ?auto_10209 ?auto_10208 ) ( not ( = ?auto_10207 ?auto_10208 ) ) ( not ( = ?auto_10207 ?auto_10209 ) ) ( not ( = ?auto_10207 ?auto_10210 ) ) ( not ( = ?auto_10207 ?auto_10211 ) ) ( not ( = ?auto_10207 ?auto_10212 ) ) ( not ( = ?auto_10208 ?auto_10209 ) ) ( not ( = ?auto_10208 ?auto_10210 ) ) ( not ( = ?auto_10208 ?auto_10211 ) ) ( not ( = ?auto_10208 ?auto_10212 ) ) ( not ( = ?auto_10209 ?auto_10210 ) ) ( not ( = ?auto_10209 ?auto_10211 ) ) ( not ( = ?auto_10209 ?auto_10212 ) ) ( not ( = ?auto_10210 ?auto_10211 ) ) ( not ( = ?auto_10210 ?auto_10212 ) ) ( not ( = ?auto_10211 ?auto_10212 ) ) ( CLEAR ?auto_10209 ) ( ON ?auto_10210 ?auto_10211 ) ( CLEAR ?auto_10210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10207 ?auto_10208 ?auto_10209 ?auto_10210 )
      ( MAKE-5PILE ?auto_10207 ?auto_10208 ?auto_10209 ?auto_10210 ?auto_10211 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_10229 - BLOCK
      ?auto_10230 - BLOCK
      ?auto_10231 - BLOCK
      ?auto_10232 - BLOCK
      ?auto_10233 - BLOCK
    )
    :vars
    (
      ?auto_10234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10233 ?auto_10234 ) ( ON-TABLE ?auto_10229 ) ( ON ?auto_10230 ?auto_10229 ) ( not ( = ?auto_10229 ?auto_10230 ) ) ( not ( = ?auto_10229 ?auto_10231 ) ) ( not ( = ?auto_10229 ?auto_10232 ) ) ( not ( = ?auto_10229 ?auto_10233 ) ) ( not ( = ?auto_10229 ?auto_10234 ) ) ( not ( = ?auto_10230 ?auto_10231 ) ) ( not ( = ?auto_10230 ?auto_10232 ) ) ( not ( = ?auto_10230 ?auto_10233 ) ) ( not ( = ?auto_10230 ?auto_10234 ) ) ( not ( = ?auto_10231 ?auto_10232 ) ) ( not ( = ?auto_10231 ?auto_10233 ) ) ( not ( = ?auto_10231 ?auto_10234 ) ) ( not ( = ?auto_10232 ?auto_10233 ) ) ( not ( = ?auto_10232 ?auto_10234 ) ) ( not ( = ?auto_10233 ?auto_10234 ) ) ( ON ?auto_10232 ?auto_10233 ) ( CLEAR ?auto_10230 ) ( ON ?auto_10231 ?auto_10232 ) ( CLEAR ?auto_10231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10229 ?auto_10230 ?auto_10231 )
      ( MAKE-5PILE ?auto_10229 ?auto_10230 ?auto_10231 ?auto_10232 ?auto_10233 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_10251 - BLOCK
      ?auto_10252 - BLOCK
      ?auto_10253 - BLOCK
      ?auto_10254 - BLOCK
      ?auto_10255 - BLOCK
    )
    :vars
    (
      ?auto_10256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10255 ?auto_10256 ) ( ON-TABLE ?auto_10251 ) ( not ( = ?auto_10251 ?auto_10252 ) ) ( not ( = ?auto_10251 ?auto_10253 ) ) ( not ( = ?auto_10251 ?auto_10254 ) ) ( not ( = ?auto_10251 ?auto_10255 ) ) ( not ( = ?auto_10251 ?auto_10256 ) ) ( not ( = ?auto_10252 ?auto_10253 ) ) ( not ( = ?auto_10252 ?auto_10254 ) ) ( not ( = ?auto_10252 ?auto_10255 ) ) ( not ( = ?auto_10252 ?auto_10256 ) ) ( not ( = ?auto_10253 ?auto_10254 ) ) ( not ( = ?auto_10253 ?auto_10255 ) ) ( not ( = ?auto_10253 ?auto_10256 ) ) ( not ( = ?auto_10254 ?auto_10255 ) ) ( not ( = ?auto_10254 ?auto_10256 ) ) ( not ( = ?auto_10255 ?auto_10256 ) ) ( ON ?auto_10254 ?auto_10255 ) ( ON ?auto_10253 ?auto_10254 ) ( CLEAR ?auto_10251 ) ( ON ?auto_10252 ?auto_10253 ) ( CLEAR ?auto_10252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10251 ?auto_10252 )
      ( MAKE-5PILE ?auto_10251 ?auto_10252 ?auto_10253 ?auto_10254 ?auto_10255 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_10273 - BLOCK
      ?auto_10274 - BLOCK
      ?auto_10275 - BLOCK
      ?auto_10276 - BLOCK
      ?auto_10277 - BLOCK
    )
    :vars
    (
      ?auto_10278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10277 ?auto_10278 ) ( not ( = ?auto_10273 ?auto_10274 ) ) ( not ( = ?auto_10273 ?auto_10275 ) ) ( not ( = ?auto_10273 ?auto_10276 ) ) ( not ( = ?auto_10273 ?auto_10277 ) ) ( not ( = ?auto_10273 ?auto_10278 ) ) ( not ( = ?auto_10274 ?auto_10275 ) ) ( not ( = ?auto_10274 ?auto_10276 ) ) ( not ( = ?auto_10274 ?auto_10277 ) ) ( not ( = ?auto_10274 ?auto_10278 ) ) ( not ( = ?auto_10275 ?auto_10276 ) ) ( not ( = ?auto_10275 ?auto_10277 ) ) ( not ( = ?auto_10275 ?auto_10278 ) ) ( not ( = ?auto_10276 ?auto_10277 ) ) ( not ( = ?auto_10276 ?auto_10278 ) ) ( not ( = ?auto_10277 ?auto_10278 ) ) ( ON ?auto_10276 ?auto_10277 ) ( ON ?auto_10275 ?auto_10276 ) ( ON ?auto_10274 ?auto_10275 ) ( ON ?auto_10273 ?auto_10274 ) ( CLEAR ?auto_10273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10273 )
      ( MAKE-5PILE ?auto_10273 ?auto_10274 ?auto_10275 ?auto_10276 ?auto_10277 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_10296 - BLOCK
      ?auto_10297 - BLOCK
      ?auto_10298 - BLOCK
      ?auto_10299 - BLOCK
      ?auto_10300 - BLOCK
      ?auto_10301 - BLOCK
    )
    :vars
    (
      ?auto_10302 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10300 ) ( ON ?auto_10301 ?auto_10302 ) ( CLEAR ?auto_10301 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10296 ) ( ON ?auto_10297 ?auto_10296 ) ( ON ?auto_10298 ?auto_10297 ) ( ON ?auto_10299 ?auto_10298 ) ( ON ?auto_10300 ?auto_10299 ) ( not ( = ?auto_10296 ?auto_10297 ) ) ( not ( = ?auto_10296 ?auto_10298 ) ) ( not ( = ?auto_10296 ?auto_10299 ) ) ( not ( = ?auto_10296 ?auto_10300 ) ) ( not ( = ?auto_10296 ?auto_10301 ) ) ( not ( = ?auto_10296 ?auto_10302 ) ) ( not ( = ?auto_10297 ?auto_10298 ) ) ( not ( = ?auto_10297 ?auto_10299 ) ) ( not ( = ?auto_10297 ?auto_10300 ) ) ( not ( = ?auto_10297 ?auto_10301 ) ) ( not ( = ?auto_10297 ?auto_10302 ) ) ( not ( = ?auto_10298 ?auto_10299 ) ) ( not ( = ?auto_10298 ?auto_10300 ) ) ( not ( = ?auto_10298 ?auto_10301 ) ) ( not ( = ?auto_10298 ?auto_10302 ) ) ( not ( = ?auto_10299 ?auto_10300 ) ) ( not ( = ?auto_10299 ?auto_10301 ) ) ( not ( = ?auto_10299 ?auto_10302 ) ) ( not ( = ?auto_10300 ?auto_10301 ) ) ( not ( = ?auto_10300 ?auto_10302 ) ) ( not ( = ?auto_10301 ?auto_10302 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10301 ?auto_10302 )
      ( !STACK ?auto_10301 ?auto_10300 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_10309 - BLOCK
      ?auto_10310 - BLOCK
      ?auto_10311 - BLOCK
      ?auto_10312 - BLOCK
      ?auto_10313 - BLOCK
      ?auto_10314 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10313 ) ( ON-TABLE ?auto_10314 ) ( CLEAR ?auto_10314 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10309 ) ( ON ?auto_10310 ?auto_10309 ) ( ON ?auto_10311 ?auto_10310 ) ( ON ?auto_10312 ?auto_10311 ) ( ON ?auto_10313 ?auto_10312 ) ( not ( = ?auto_10309 ?auto_10310 ) ) ( not ( = ?auto_10309 ?auto_10311 ) ) ( not ( = ?auto_10309 ?auto_10312 ) ) ( not ( = ?auto_10309 ?auto_10313 ) ) ( not ( = ?auto_10309 ?auto_10314 ) ) ( not ( = ?auto_10310 ?auto_10311 ) ) ( not ( = ?auto_10310 ?auto_10312 ) ) ( not ( = ?auto_10310 ?auto_10313 ) ) ( not ( = ?auto_10310 ?auto_10314 ) ) ( not ( = ?auto_10311 ?auto_10312 ) ) ( not ( = ?auto_10311 ?auto_10313 ) ) ( not ( = ?auto_10311 ?auto_10314 ) ) ( not ( = ?auto_10312 ?auto_10313 ) ) ( not ( = ?auto_10312 ?auto_10314 ) ) ( not ( = ?auto_10313 ?auto_10314 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_10314 )
      ( !STACK ?auto_10314 ?auto_10313 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_10321 - BLOCK
      ?auto_10322 - BLOCK
      ?auto_10323 - BLOCK
      ?auto_10324 - BLOCK
      ?auto_10325 - BLOCK
      ?auto_10326 - BLOCK
    )
    :vars
    (
      ?auto_10327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10326 ?auto_10327 ) ( ON-TABLE ?auto_10321 ) ( ON ?auto_10322 ?auto_10321 ) ( ON ?auto_10323 ?auto_10322 ) ( ON ?auto_10324 ?auto_10323 ) ( not ( = ?auto_10321 ?auto_10322 ) ) ( not ( = ?auto_10321 ?auto_10323 ) ) ( not ( = ?auto_10321 ?auto_10324 ) ) ( not ( = ?auto_10321 ?auto_10325 ) ) ( not ( = ?auto_10321 ?auto_10326 ) ) ( not ( = ?auto_10321 ?auto_10327 ) ) ( not ( = ?auto_10322 ?auto_10323 ) ) ( not ( = ?auto_10322 ?auto_10324 ) ) ( not ( = ?auto_10322 ?auto_10325 ) ) ( not ( = ?auto_10322 ?auto_10326 ) ) ( not ( = ?auto_10322 ?auto_10327 ) ) ( not ( = ?auto_10323 ?auto_10324 ) ) ( not ( = ?auto_10323 ?auto_10325 ) ) ( not ( = ?auto_10323 ?auto_10326 ) ) ( not ( = ?auto_10323 ?auto_10327 ) ) ( not ( = ?auto_10324 ?auto_10325 ) ) ( not ( = ?auto_10324 ?auto_10326 ) ) ( not ( = ?auto_10324 ?auto_10327 ) ) ( not ( = ?auto_10325 ?auto_10326 ) ) ( not ( = ?auto_10325 ?auto_10327 ) ) ( not ( = ?auto_10326 ?auto_10327 ) ) ( CLEAR ?auto_10324 ) ( ON ?auto_10325 ?auto_10326 ) ( CLEAR ?auto_10325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_10321 ?auto_10322 ?auto_10323 ?auto_10324 ?auto_10325 )
      ( MAKE-6PILE ?auto_10321 ?auto_10322 ?auto_10323 ?auto_10324 ?auto_10325 ?auto_10326 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_10334 - BLOCK
      ?auto_10335 - BLOCK
      ?auto_10336 - BLOCK
      ?auto_10337 - BLOCK
      ?auto_10338 - BLOCK
      ?auto_10339 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10339 ) ( ON-TABLE ?auto_10334 ) ( ON ?auto_10335 ?auto_10334 ) ( ON ?auto_10336 ?auto_10335 ) ( ON ?auto_10337 ?auto_10336 ) ( not ( = ?auto_10334 ?auto_10335 ) ) ( not ( = ?auto_10334 ?auto_10336 ) ) ( not ( = ?auto_10334 ?auto_10337 ) ) ( not ( = ?auto_10334 ?auto_10338 ) ) ( not ( = ?auto_10334 ?auto_10339 ) ) ( not ( = ?auto_10335 ?auto_10336 ) ) ( not ( = ?auto_10335 ?auto_10337 ) ) ( not ( = ?auto_10335 ?auto_10338 ) ) ( not ( = ?auto_10335 ?auto_10339 ) ) ( not ( = ?auto_10336 ?auto_10337 ) ) ( not ( = ?auto_10336 ?auto_10338 ) ) ( not ( = ?auto_10336 ?auto_10339 ) ) ( not ( = ?auto_10337 ?auto_10338 ) ) ( not ( = ?auto_10337 ?auto_10339 ) ) ( not ( = ?auto_10338 ?auto_10339 ) ) ( CLEAR ?auto_10337 ) ( ON ?auto_10338 ?auto_10339 ) ( CLEAR ?auto_10338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_10334 ?auto_10335 ?auto_10336 ?auto_10337 ?auto_10338 )
      ( MAKE-6PILE ?auto_10334 ?auto_10335 ?auto_10336 ?auto_10337 ?auto_10338 ?auto_10339 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_10346 - BLOCK
      ?auto_10347 - BLOCK
      ?auto_10348 - BLOCK
      ?auto_10349 - BLOCK
      ?auto_10350 - BLOCK
      ?auto_10351 - BLOCK
    )
    :vars
    (
      ?auto_10352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10351 ?auto_10352 ) ( ON-TABLE ?auto_10346 ) ( ON ?auto_10347 ?auto_10346 ) ( ON ?auto_10348 ?auto_10347 ) ( not ( = ?auto_10346 ?auto_10347 ) ) ( not ( = ?auto_10346 ?auto_10348 ) ) ( not ( = ?auto_10346 ?auto_10349 ) ) ( not ( = ?auto_10346 ?auto_10350 ) ) ( not ( = ?auto_10346 ?auto_10351 ) ) ( not ( = ?auto_10346 ?auto_10352 ) ) ( not ( = ?auto_10347 ?auto_10348 ) ) ( not ( = ?auto_10347 ?auto_10349 ) ) ( not ( = ?auto_10347 ?auto_10350 ) ) ( not ( = ?auto_10347 ?auto_10351 ) ) ( not ( = ?auto_10347 ?auto_10352 ) ) ( not ( = ?auto_10348 ?auto_10349 ) ) ( not ( = ?auto_10348 ?auto_10350 ) ) ( not ( = ?auto_10348 ?auto_10351 ) ) ( not ( = ?auto_10348 ?auto_10352 ) ) ( not ( = ?auto_10349 ?auto_10350 ) ) ( not ( = ?auto_10349 ?auto_10351 ) ) ( not ( = ?auto_10349 ?auto_10352 ) ) ( not ( = ?auto_10350 ?auto_10351 ) ) ( not ( = ?auto_10350 ?auto_10352 ) ) ( not ( = ?auto_10351 ?auto_10352 ) ) ( ON ?auto_10350 ?auto_10351 ) ( CLEAR ?auto_10348 ) ( ON ?auto_10349 ?auto_10350 ) ( CLEAR ?auto_10349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10346 ?auto_10347 ?auto_10348 ?auto_10349 )
      ( MAKE-6PILE ?auto_10346 ?auto_10347 ?auto_10348 ?auto_10349 ?auto_10350 ?auto_10351 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_10359 - BLOCK
      ?auto_10360 - BLOCK
      ?auto_10361 - BLOCK
      ?auto_10362 - BLOCK
      ?auto_10363 - BLOCK
      ?auto_10364 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10364 ) ( ON-TABLE ?auto_10359 ) ( ON ?auto_10360 ?auto_10359 ) ( ON ?auto_10361 ?auto_10360 ) ( not ( = ?auto_10359 ?auto_10360 ) ) ( not ( = ?auto_10359 ?auto_10361 ) ) ( not ( = ?auto_10359 ?auto_10362 ) ) ( not ( = ?auto_10359 ?auto_10363 ) ) ( not ( = ?auto_10359 ?auto_10364 ) ) ( not ( = ?auto_10360 ?auto_10361 ) ) ( not ( = ?auto_10360 ?auto_10362 ) ) ( not ( = ?auto_10360 ?auto_10363 ) ) ( not ( = ?auto_10360 ?auto_10364 ) ) ( not ( = ?auto_10361 ?auto_10362 ) ) ( not ( = ?auto_10361 ?auto_10363 ) ) ( not ( = ?auto_10361 ?auto_10364 ) ) ( not ( = ?auto_10362 ?auto_10363 ) ) ( not ( = ?auto_10362 ?auto_10364 ) ) ( not ( = ?auto_10363 ?auto_10364 ) ) ( ON ?auto_10363 ?auto_10364 ) ( CLEAR ?auto_10361 ) ( ON ?auto_10362 ?auto_10363 ) ( CLEAR ?auto_10362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10359 ?auto_10360 ?auto_10361 ?auto_10362 )
      ( MAKE-6PILE ?auto_10359 ?auto_10360 ?auto_10361 ?auto_10362 ?auto_10363 ?auto_10364 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_10371 - BLOCK
      ?auto_10372 - BLOCK
      ?auto_10373 - BLOCK
      ?auto_10374 - BLOCK
      ?auto_10375 - BLOCK
      ?auto_10376 - BLOCK
    )
    :vars
    (
      ?auto_10377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10376 ?auto_10377 ) ( ON-TABLE ?auto_10371 ) ( ON ?auto_10372 ?auto_10371 ) ( not ( = ?auto_10371 ?auto_10372 ) ) ( not ( = ?auto_10371 ?auto_10373 ) ) ( not ( = ?auto_10371 ?auto_10374 ) ) ( not ( = ?auto_10371 ?auto_10375 ) ) ( not ( = ?auto_10371 ?auto_10376 ) ) ( not ( = ?auto_10371 ?auto_10377 ) ) ( not ( = ?auto_10372 ?auto_10373 ) ) ( not ( = ?auto_10372 ?auto_10374 ) ) ( not ( = ?auto_10372 ?auto_10375 ) ) ( not ( = ?auto_10372 ?auto_10376 ) ) ( not ( = ?auto_10372 ?auto_10377 ) ) ( not ( = ?auto_10373 ?auto_10374 ) ) ( not ( = ?auto_10373 ?auto_10375 ) ) ( not ( = ?auto_10373 ?auto_10376 ) ) ( not ( = ?auto_10373 ?auto_10377 ) ) ( not ( = ?auto_10374 ?auto_10375 ) ) ( not ( = ?auto_10374 ?auto_10376 ) ) ( not ( = ?auto_10374 ?auto_10377 ) ) ( not ( = ?auto_10375 ?auto_10376 ) ) ( not ( = ?auto_10375 ?auto_10377 ) ) ( not ( = ?auto_10376 ?auto_10377 ) ) ( ON ?auto_10375 ?auto_10376 ) ( ON ?auto_10374 ?auto_10375 ) ( CLEAR ?auto_10372 ) ( ON ?auto_10373 ?auto_10374 ) ( CLEAR ?auto_10373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10371 ?auto_10372 ?auto_10373 )
      ( MAKE-6PILE ?auto_10371 ?auto_10372 ?auto_10373 ?auto_10374 ?auto_10375 ?auto_10376 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_10384 - BLOCK
      ?auto_10385 - BLOCK
      ?auto_10386 - BLOCK
      ?auto_10387 - BLOCK
      ?auto_10388 - BLOCK
      ?auto_10389 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10389 ) ( ON-TABLE ?auto_10384 ) ( ON ?auto_10385 ?auto_10384 ) ( not ( = ?auto_10384 ?auto_10385 ) ) ( not ( = ?auto_10384 ?auto_10386 ) ) ( not ( = ?auto_10384 ?auto_10387 ) ) ( not ( = ?auto_10384 ?auto_10388 ) ) ( not ( = ?auto_10384 ?auto_10389 ) ) ( not ( = ?auto_10385 ?auto_10386 ) ) ( not ( = ?auto_10385 ?auto_10387 ) ) ( not ( = ?auto_10385 ?auto_10388 ) ) ( not ( = ?auto_10385 ?auto_10389 ) ) ( not ( = ?auto_10386 ?auto_10387 ) ) ( not ( = ?auto_10386 ?auto_10388 ) ) ( not ( = ?auto_10386 ?auto_10389 ) ) ( not ( = ?auto_10387 ?auto_10388 ) ) ( not ( = ?auto_10387 ?auto_10389 ) ) ( not ( = ?auto_10388 ?auto_10389 ) ) ( ON ?auto_10388 ?auto_10389 ) ( ON ?auto_10387 ?auto_10388 ) ( CLEAR ?auto_10385 ) ( ON ?auto_10386 ?auto_10387 ) ( CLEAR ?auto_10386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10384 ?auto_10385 ?auto_10386 )
      ( MAKE-6PILE ?auto_10384 ?auto_10385 ?auto_10386 ?auto_10387 ?auto_10388 ?auto_10389 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_10396 - BLOCK
      ?auto_10397 - BLOCK
      ?auto_10398 - BLOCK
      ?auto_10399 - BLOCK
      ?auto_10400 - BLOCK
      ?auto_10401 - BLOCK
    )
    :vars
    (
      ?auto_10402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10401 ?auto_10402 ) ( ON-TABLE ?auto_10396 ) ( not ( = ?auto_10396 ?auto_10397 ) ) ( not ( = ?auto_10396 ?auto_10398 ) ) ( not ( = ?auto_10396 ?auto_10399 ) ) ( not ( = ?auto_10396 ?auto_10400 ) ) ( not ( = ?auto_10396 ?auto_10401 ) ) ( not ( = ?auto_10396 ?auto_10402 ) ) ( not ( = ?auto_10397 ?auto_10398 ) ) ( not ( = ?auto_10397 ?auto_10399 ) ) ( not ( = ?auto_10397 ?auto_10400 ) ) ( not ( = ?auto_10397 ?auto_10401 ) ) ( not ( = ?auto_10397 ?auto_10402 ) ) ( not ( = ?auto_10398 ?auto_10399 ) ) ( not ( = ?auto_10398 ?auto_10400 ) ) ( not ( = ?auto_10398 ?auto_10401 ) ) ( not ( = ?auto_10398 ?auto_10402 ) ) ( not ( = ?auto_10399 ?auto_10400 ) ) ( not ( = ?auto_10399 ?auto_10401 ) ) ( not ( = ?auto_10399 ?auto_10402 ) ) ( not ( = ?auto_10400 ?auto_10401 ) ) ( not ( = ?auto_10400 ?auto_10402 ) ) ( not ( = ?auto_10401 ?auto_10402 ) ) ( ON ?auto_10400 ?auto_10401 ) ( ON ?auto_10399 ?auto_10400 ) ( ON ?auto_10398 ?auto_10399 ) ( CLEAR ?auto_10396 ) ( ON ?auto_10397 ?auto_10398 ) ( CLEAR ?auto_10397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10396 ?auto_10397 )
      ( MAKE-6PILE ?auto_10396 ?auto_10397 ?auto_10398 ?auto_10399 ?auto_10400 ?auto_10401 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_10409 - BLOCK
      ?auto_10410 - BLOCK
      ?auto_10411 - BLOCK
      ?auto_10412 - BLOCK
      ?auto_10413 - BLOCK
      ?auto_10414 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10414 ) ( ON-TABLE ?auto_10409 ) ( not ( = ?auto_10409 ?auto_10410 ) ) ( not ( = ?auto_10409 ?auto_10411 ) ) ( not ( = ?auto_10409 ?auto_10412 ) ) ( not ( = ?auto_10409 ?auto_10413 ) ) ( not ( = ?auto_10409 ?auto_10414 ) ) ( not ( = ?auto_10410 ?auto_10411 ) ) ( not ( = ?auto_10410 ?auto_10412 ) ) ( not ( = ?auto_10410 ?auto_10413 ) ) ( not ( = ?auto_10410 ?auto_10414 ) ) ( not ( = ?auto_10411 ?auto_10412 ) ) ( not ( = ?auto_10411 ?auto_10413 ) ) ( not ( = ?auto_10411 ?auto_10414 ) ) ( not ( = ?auto_10412 ?auto_10413 ) ) ( not ( = ?auto_10412 ?auto_10414 ) ) ( not ( = ?auto_10413 ?auto_10414 ) ) ( ON ?auto_10413 ?auto_10414 ) ( ON ?auto_10412 ?auto_10413 ) ( ON ?auto_10411 ?auto_10412 ) ( CLEAR ?auto_10409 ) ( ON ?auto_10410 ?auto_10411 ) ( CLEAR ?auto_10410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10409 ?auto_10410 )
      ( MAKE-6PILE ?auto_10409 ?auto_10410 ?auto_10411 ?auto_10412 ?auto_10413 ?auto_10414 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_10421 - BLOCK
      ?auto_10422 - BLOCK
      ?auto_10423 - BLOCK
      ?auto_10424 - BLOCK
      ?auto_10425 - BLOCK
      ?auto_10426 - BLOCK
    )
    :vars
    (
      ?auto_10427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10426 ?auto_10427 ) ( not ( = ?auto_10421 ?auto_10422 ) ) ( not ( = ?auto_10421 ?auto_10423 ) ) ( not ( = ?auto_10421 ?auto_10424 ) ) ( not ( = ?auto_10421 ?auto_10425 ) ) ( not ( = ?auto_10421 ?auto_10426 ) ) ( not ( = ?auto_10421 ?auto_10427 ) ) ( not ( = ?auto_10422 ?auto_10423 ) ) ( not ( = ?auto_10422 ?auto_10424 ) ) ( not ( = ?auto_10422 ?auto_10425 ) ) ( not ( = ?auto_10422 ?auto_10426 ) ) ( not ( = ?auto_10422 ?auto_10427 ) ) ( not ( = ?auto_10423 ?auto_10424 ) ) ( not ( = ?auto_10423 ?auto_10425 ) ) ( not ( = ?auto_10423 ?auto_10426 ) ) ( not ( = ?auto_10423 ?auto_10427 ) ) ( not ( = ?auto_10424 ?auto_10425 ) ) ( not ( = ?auto_10424 ?auto_10426 ) ) ( not ( = ?auto_10424 ?auto_10427 ) ) ( not ( = ?auto_10425 ?auto_10426 ) ) ( not ( = ?auto_10425 ?auto_10427 ) ) ( not ( = ?auto_10426 ?auto_10427 ) ) ( ON ?auto_10425 ?auto_10426 ) ( ON ?auto_10424 ?auto_10425 ) ( ON ?auto_10423 ?auto_10424 ) ( ON ?auto_10422 ?auto_10423 ) ( ON ?auto_10421 ?auto_10422 ) ( CLEAR ?auto_10421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10421 )
      ( MAKE-6PILE ?auto_10421 ?auto_10422 ?auto_10423 ?auto_10424 ?auto_10425 ?auto_10426 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_10434 - BLOCK
      ?auto_10435 - BLOCK
      ?auto_10436 - BLOCK
      ?auto_10437 - BLOCK
      ?auto_10438 - BLOCK
      ?auto_10439 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10439 ) ( not ( = ?auto_10434 ?auto_10435 ) ) ( not ( = ?auto_10434 ?auto_10436 ) ) ( not ( = ?auto_10434 ?auto_10437 ) ) ( not ( = ?auto_10434 ?auto_10438 ) ) ( not ( = ?auto_10434 ?auto_10439 ) ) ( not ( = ?auto_10435 ?auto_10436 ) ) ( not ( = ?auto_10435 ?auto_10437 ) ) ( not ( = ?auto_10435 ?auto_10438 ) ) ( not ( = ?auto_10435 ?auto_10439 ) ) ( not ( = ?auto_10436 ?auto_10437 ) ) ( not ( = ?auto_10436 ?auto_10438 ) ) ( not ( = ?auto_10436 ?auto_10439 ) ) ( not ( = ?auto_10437 ?auto_10438 ) ) ( not ( = ?auto_10437 ?auto_10439 ) ) ( not ( = ?auto_10438 ?auto_10439 ) ) ( ON ?auto_10438 ?auto_10439 ) ( ON ?auto_10437 ?auto_10438 ) ( ON ?auto_10436 ?auto_10437 ) ( ON ?auto_10435 ?auto_10436 ) ( ON ?auto_10434 ?auto_10435 ) ( CLEAR ?auto_10434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10434 )
      ( MAKE-6PILE ?auto_10434 ?auto_10435 ?auto_10436 ?auto_10437 ?auto_10438 ?auto_10439 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_10446 - BLOCK
      ?auto_10447 - BLOCK
      ?auto_10448 - BLOCK
      ?auto_10449 - BLOCK
      ?auto_10450 - BLOCK
      ?auto_10451 - BLOCK
    )
    :vars
    (
      ?auto_10452 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10446 ?auto_10447 ) ) ( not ( = ?auto_10446 ?auto_10448 ) ) ( not ( = ?auto_10446 ?auto_10449 ) ) ( not ( = ?auto_10446 ?auto_10450 ) ) ( not ( = ?auto_10446 ?auto_10451 ) ) ( not ( = ?auto_10447 ?auto_10448 ) ) ( not ( = ?auto_10447 ?auto_10449 ) ) ( not ( = ?auto_10447 ?auto_10450 ) ) ( not ( = ?auto_10447 ?auto_10451 ) ) ( not ( = ?auto_10448 ?auto_10449 ) ) ( not ( = ?auto_10448 ?auto_10450 ) ) ( not ( = ?auto_10448 ?auto_10451 ) ) ( not ( = ?auto_10449 ?auto_10450 ) ) ( not ( = ?auto_10449 ?auto_10451 ) ) ( not ( = ?auto_10450 ?auto_10451 ) ) ( ON ?auto_10446 ?auto_10452 ) ( not ( = ?auto_10451 ?auto_10452 ) ) ( not ( = ?auto_10450 ?auto_10452 ) ) ( not ( = ?auto_10449 ?auto_10452 ) ) ( not ( = ?auto_10448 ?auto_10452 ) ) ( not ( = ?auto_10447 ?auto_10452 ) ) ( not ( = ?auto_10446 ?auto_10452 ) ) ( ON ?auto_10447 ?auto_10446 ) ( ON ?auto_10448 ?auto_10447 ) ( ON ?auto_10449 ?auto_10448 ) ( ON ?auto_10450 ?auto_10449 ) ( ON ?auto_10451 ?auto_10450 ) ( CLEAR ?auto_10451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_10451 ?auto_10450 ?auto_10449 ?auto_10448 ?auto_10447 ?auto_10446 )
      ( MAKE-6PILE ?auto_10446 ?auto_10447 ?auto_10448 ?auto_10449 ?auto_10450 ?auto_10451 ) )
  )

)

