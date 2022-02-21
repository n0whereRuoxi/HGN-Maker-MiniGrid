( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b437 - block
    b315 - block
    b584 - block
    b410 - block
    b740 - block
    b931 - block
    b387 - block
    b108 - block
    b670 - block
    b820 - block
    b188 - block
    b402 - block
    b828 - block
    b175 - block
    b244 - block
    b861 - block
    b471 - block
    b617 - block
    b760 - block
    b978 - block
    b106 - block
    b332 - block
    b642 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b437 )
    ( on b315 b437 )
    ( on b584 b315 )
    ( on b410 b584 )
    ( on b740 b410 )
    ( on b931 b740 )
    ( on b387 b931 )
    ( on b108 b387 )
    ( on b670 b108 )
    ( on b820 b670 )
    ( on b188 b820 )
    ( on b402 b188 )
    ( on b828 b402 )
    ( on b175 b828 )
    ( on b244 b175 )
    ( on b861 b244 )
    ( on b471 b861 )
    ( on b617 b471 )
    ( on b760 b617 )
    ( on b978 b760 )
    ( on b106 b978 )
    ( on b332 b106 )
    ( on b642 b332 )
    ( clear b642 )
  )
  ( :goal
    ( and
      ( clear b437 )
    )
  )
)
