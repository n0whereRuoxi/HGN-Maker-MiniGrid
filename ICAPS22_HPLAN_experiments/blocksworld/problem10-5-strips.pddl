( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b9 - block
    b347 - block
    b972 - block
    b335 - block
    b233 - block
    b877 - block
    b673 - block
    b193 - block
    b786 - block
    b274 - block
    b797 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b9 )
    ( on b347 b9 )
    ( on b972 b347 )
    ( on b335 b972 )
    ( on b233 b335 )
    ( on b877 b233 )
    ( on b673 b877 )
    ( on b193 b673 )
    ( on b786 b193 )
    ( on b274 b786 )
    ( on b797 b274 )
    ( clear b797 )
  )
  ( :goal
    ( and
      ( clear b9 )
    )
  )
)
