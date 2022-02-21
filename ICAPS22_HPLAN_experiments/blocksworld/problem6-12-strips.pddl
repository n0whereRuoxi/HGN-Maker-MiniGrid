( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b646 - block
    b407 - block
    b95 - block
    b640 - block
    b651 - block
    b380 - block
    b545 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b646 )
    ( on b407 b646 )
    ( on b95 b407 )
    ( on b640 b95 )
    ( on b651 b640 )
    ( on b380 b651 )
    ( on b545 b380 )
    ( clear b545 )
  )
  ( :goal
    ( and
      ( clear b646 )
    )
  )
)
