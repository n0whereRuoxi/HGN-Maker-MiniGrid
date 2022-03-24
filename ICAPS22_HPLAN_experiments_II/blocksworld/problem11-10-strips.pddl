( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b249 - block
    b24 - block
    b18 - block
    b269 - block
    b226 - block
    b818 - block
    b51 - block
    b602 - block
    b113 - block
    b861 - block
    b352 - block
    b278 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b249 )
    ( on b24 b249 )
    ( on b18 b24 )
    ( on b269 b18 )
    ( on b226 b269 )
    ( on b818 b226 )
    ( on b51 b818 )
    ( on b602 b51 )
    ( on b113 b602 )
    ( on b861 b113 )
    ( on b352 b861 )
    ( on b278 b352 )
    ( clear b278 )
  )
  ( :goal
    ( and
      ( clear b249 )
    )
  )
)
