( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b739 - block
    b518 - block
    b994 - block
    b914 - block
    b570 - block
    b117 - block
    b124 - block
    b322 - block
    b384 - block
    b781 - block
    b621 - block
    b112 - block
    b437 - block
    b467 - block
    b568 - block
    b734 - block
    b672 - block
    b527 - block
    b630 - block
    b815 - block
    b441 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b739 )
    ( on b518 b739 )
    ( on b994 b518 )
    ( on b914 b994 )
    ( on b570 b914 )
    ( on b117 b570 )
    ( on b124 b117 )
    ( on b322 b124 )
    ( on b384 b322 )
    ( on b781 b384 )
    ( on b621 b781 )
    ( on b112 b621 )
    ( on b437 b112 )
    ( on b467 b437 )
    ( on b568 b467 )
    ( on b734 b568 )
    ( on b672 b734 )
    ( on b527 b672 )
    ( on b630 b527 )
    ( on b815 b630 )
    ( on b441 b815 )
    ( clear b441 )
  )
  ( :goal
    ( and
      ( clear b739 )
    )
  )
)
