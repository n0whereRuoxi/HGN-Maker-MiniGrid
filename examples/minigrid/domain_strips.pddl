( define ( domain minigrid )

  ( :requirements :strips :typing :equality )

  ( :types robot room door obj)
  ( :predicates
    ( robot-in ?a - robot ?b - room )
    ( obj-in ?c - obj ?d - room )
    ( on-robot ?e - obj ?f - robot )
    ( door-between ?i - door ?j - room ?k - room)
    ( open ?l - door )
    ( locked ?m - door )
    ( is-key ?n - obj )
    ( is-package ?o - obj )
  )
  
  ( :action !PICK-UP
    :parameters
    (
      ?r - robot
      ?o - obj
      ?c -room
    )
    :precondition
    ( and
      ( robot-in ?r ?c )
      ( obj-in ?o ?c )
    )
    :effect
    ( and      
      ( not ( obj-in ?o ?c ) )
      ( on-robot ?o ?r )
    )
  )

  ( :action !MOVE-TO
    :parameters
    (
      ?r - robot
      ?c1 - room
      ?c2 - room
      ?d - door
    )
    :precondition
    ( and
      ( robot-in ?r ?c1 )
      ( door-between ?d ?c1 ?c2 )
      ( open ?d )
    )
    :effect
    ( and
      ( not ( robot-in ?r ?c1 ) )
      ( robot-in ?r ?c2 )
    )
  )

  ( :action !DROP
    :parameters
    (
      ?r - robot
      ?o - obj
      ?c -room
    )
    :precondition
    ( and
      ( robot-in ?r ?c )
      ( on-robot ?o ?r )
    )
    :effect
    ( and      
      ( obj-in ?o ?c )
      ( not ( on-robot ?o ?r ) )
    )
  )

  ( :action !OPEN
    :parameters
    (
      ?r - robot
      ?d - door
      ?c1 -room
      ?c2 -room
      ?k - obj
    )
    :precondition
    ( and
      ( robot-in ?r ?c1 )
      ( door-between ?d ?c1 ?c2 )
      ( locked ?d )
      ( on-robot ?k ?r )
      ( is-key ?k )
    )
    :effect
    ( and      
      ( not ( locked ?d ) )
      ( open ?d )
    )
  )

)