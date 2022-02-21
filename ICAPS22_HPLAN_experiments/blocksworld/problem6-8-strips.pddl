( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b173 - block
    b165 - block
    b439 - block
    b456 - block
    b333 - block
    b109 - block
    b236 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b173 )
    ( on b165 b173 )
    ( on b439 b165 )
    ( on b456 b439 )
    ( on b333 b456 )
    ( on b109 b333 )
    ( on b236 b109 )
    ( clear b236 )
  )
  ( :goal
    ( and
      ( clear b173 )
      ( clear b173 )
      ( clear b173 )
      ( clear b173 )
      ( clear b173 )
      ( clear b173 )
      ( clear b173 )
    )
  )
)
