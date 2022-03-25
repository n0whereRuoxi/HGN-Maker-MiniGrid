( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-219 - location
    l000-173 - location
    l000-534 - location
    l000-10 - location
    l000-899 - location
    l000-558 - location
    l000-307 - location
    l000-892 - location
    l000-143 - location
    l000-594 - location
    l000-935 - location
    l000-427 - location
    l000-361 - location
    l000-851 - location
    l000-306 - location
    l000-678 - location
    p262 - obj
    p799 - obj
    p855 - obj
    p886 - obj
    p295 - obj
    p411 - obj
    p783 - obj
    p980 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-219 c000 )
    ( in-city l000-173 c000 )
    ( in-city l000-534 c000 )
    ( in-city l000-10 c000 )
    ( in-city l000-899 c000 )
    ( in-city l000-558 c000 )
    ( in-city l000-307 c000 )
    ( in-city l000-892 c000 )
    ( in-city l000-143 c000 )
    ( in-city l000-594 c000 )
    ( in-city l000-935 c000 )
    ( in-city l000-427 c000 )
    ( in-city l000-361 c000 )
    ( in-city l000-851 c000 )
    ( in-city l000-306 c000 )
    ( in-city l000-678 c000 )
    ( obj-at p262 l000-173 )
    ( obj-at p799 l000-143 )
    ( obj-at p855 l000-851 )
    ( obj-at p886 l000-892 )
    ( obj-at p295 l000-678 )
    ( obj-at p411 l000-307 )
    ( obj-at p783 l000-935 )
    ( obj-at p980 l000-851 )
  )
  ( :goal
    ( and
      ( obj-at p262 l000-000 )
      ( obj-at p799 l000-000 )
      ( obj-at p855 l000-000 )
      ( obj-at p886 l000-000 )
      ( obj-at p295 l000-000 )
      ( obj-at p411 l000-000 )
      ( obj-at p783 l000-000 )
      ( obj-at p980 l000-000 )
    )
  )
)
