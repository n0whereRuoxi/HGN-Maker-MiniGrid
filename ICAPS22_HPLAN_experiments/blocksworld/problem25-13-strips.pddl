( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b86 - block
    b176 - block
    b179 - block
    b581 - block
    b287 - block
    b266 - block
    b364 - block
    b396 - block
    b188 - block
    b242 - block
    b473 - block
    b781 - block
    b453 - block
    b457 - block
    b755 - block
    b720 - block
    b639 - block
    b263 - block
    b39 - block
    b997 - block
    b297 - block
    b130 - block
    b960 - block
    b641 - block
    b395 - block
    b733 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b86 )
    ( on b176 b86 )
    ( on b179 b176 )
    ( on b581 b179 )
    ( on b287 b581 )
    ( on b266 b287 )
    ( on b364 b266 )
    ( on b396 b364 )
    ( on b188 b396 )
    ( on b242 b188 )
    ( on b473 b242 )
    ( on b781 b473 )
    ( on b453 b781 )
    ( on b457 b453 )
    ( on b755 b457 )
    ( on b720 b755 )
    ( on b639 b720 )
    ( on b263 b639 )
    ( on b39 b263 )
    ( on b997 b39 )
    ( on b297 b997 )
    ( on b130 b297 )
    ( on b960 b130 )
    ( on b641 b960 )
    ( on b395 b641 )
    ( on b733 b395 )
    ( clear b733 )
  )
  ( :goal
    ( and
      ( clear b86 )
    )
  )
)
